# Galois representations attached to regular algebraic automorphic representations of GL_n

This roadmap constructs the continuous semisimple Galois representations associated with regular algebraic cuspidal representations of GL_n over CM and totally real fields. It starts with algebraic weights and the good-place Hecke polynomial, constructs the representations through compact-unitary cohomology or ordinary boundary cohomology, and then proves local compatibility, coefficient-prime admissibility and residual properties. These results provide the arithmetic input for potential automorphy, modularity lifting and the generic parts of Shimura-variety cohomology.

The polarized route includes conjugate-self-dual cuspidal representations over CM fields, algebraic-character twists and essentially self-dual descent to totally real fields. The nonselfdual existence and away-prime route has the CM or totally real scope of HLTT and Varma. The newer nonselfdual coefficient-prime result is the CM theorem of A’Campo–Hevesi–Thorne–Whitmore. Selected unitary discrete transfers produce semisimple sums with specified constituents; a sum of this kind need not be irreducible. Three GSp₄ specializations at the end require the constructions of the dedicated GSp₄ direction and its transfer dictionary.

The general-rank construction is independent of the classical and Hilbert GL₂ construction in `AutomorphicGaloisRepresentations:R19`. Their representations are identified later on the regular-weight overlap. Weight one remains in R19. Throughout, “construct” and “prove” describe mathematical targets; the accompanying Suggested.lean supplies proposed declaration forms and algebraic examples with admitted proofs. Its output signatures sometimes omit unavailable automorphic, geometric or period hypotheses, as their comments specify. Those signatures must acquire the hypotheses stated here before they can be mathematical theorems.

## Prerequisites and boundaries

General objects belong to their supplying roadmaps. This roadmap applies them to its particular automorphic and geometric inputs and proves the resulting comparison statements.

| Supplier | Interface used here |
| --- | --- |
| `AutomorphicFormsOnReductiveGroups:AF.1`, `AF.4` | Automorphic representations, highest-weight coefficient representations, infinitesimal characters, rationality and coefficient conjugation. The GL_n weight coordinates below specialize the algebraic-weight carrier. |
| `ArithmeticGaloisRepresentations:R01.1`, `R01.2`, `R01.5`, `G7` | Continuous representations, stable lattices, semisimple recognition, descent, Weil–Deligne operations, purity, pairings, multipliers and residual polarization. Regular-Frobenius splitting and residual conjugation-extension require their precise supplier contracts. |
| `IntegralHeckeAndGaloisDeterminants:IHG.3`, `IHG.4` | The integral spherical Hecke polynomial and determinant laws, including interpolation over nonreduced coefficient rings. HLTT supplies actual congruence witnesses; a density argument alone cannot replace integrality. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `ET.6`, `ET.7a` | Igusa stabilization, local correspondence and pure global transfer/base change. The raw geometry in AG2.1a precedes ET.6. Its fixed-point traces also require the generic fixed-point interface at `EtaleDualityAndPerverseSheaves:EDC.8` and ET.5. |
| Tau Ceti `RepresentationTheory/SemisimpleAlgebras`, `RepresentationTheory/SchurWeyl` | Isotypic decomposition and rational normalized Young idempotents. The latter's layer 2 supplies the rational algebraic identity. AG2.1a supplies the map into actual correspondences, graded signs, degree and Tate twist. |
| `PadicHodgeTheory:R06.2`, `R06.4`, `R06.5`; `CrystallineCohomology:CR.6`; `WeightsInEtaleCohomology:R34.6` | Period comparison, base change, bounded-family extension, ordinary filtrations, the two-boundary log-crystalline sequence and purity after projected concentration. |
| Tau Ceti `ClassFieldTheory`; `GlobalNumberFields` | Algebraic Hecke characters, reciprocity and local-global character/extension prescriptions. S-general extensions and any necessary Grunwald–Wang refinement stay in this direction. |
| `AutomorphicGaloisRepresentations:R19.1`–`R19.6` | Classical and Hilbert geometry, systems, local and residual comparisons. Only the uniqueness comparisons on the exact shared regular-weight domain belong here. |
| `PotentialModularityAndCompatibleSystems:R24.5:operations` | A single arbitrary-rank raw-data carrier and operations; separate Weak, VeryWeak, ExtremelyWeak, Pure and Polarized predicates. The assembly below is conditional on this separation, independently of late potential-modularity existence. |
| `LocallyAnalyticDistributions:L4`; `AutomorphicFormsOnReductiveGroups:AF.4` | Fredholm/finite-slope family objects and the definite-unitary classicality and density inputs used in the Chenevier–Harris construction. |
| `ModularityAndLanglandsExtensions:ML.4`; proposed `GSp4LocalLanglandsAndGaloisRepresentations` | Transferred GSp₄ representations and Harish–Chandra/Satake conventions. The dedicated direction has no stage identifier here; the three GSp₄ entries are conditional specializations of these inputs. |
| Potential automorphy and lifting consumers, including `PotentialAutomorphyInfrastructure:PA.1` | The characteristic-zero, period and residual outputs below. Residual-image conditions, adequacy/enormity, levels and auxiliary primes remain separate hypotheses of the consumer. |

Mathlib provides `NumberField.IsCMField`, its `complexConj`, and `complexEmbedding_complexConj`: for a CM number field the conjugation over its maximal real subfield agrees under every complex embedding with complex conjugation. The integrality instance needed by the latter two declarations follows from the number-field assumption. `Multiset.prod_X_sub_C_coeff` supplies the signed elementary-symmetric coefficient formula over a commutative ring. These are reused, rather than reconstructed.

The later algebraic interfaces use `Matrix.GeneralLinearGroup` (units of finite square matrices), its `map` and `toLin`, `Matrix.charpoly`, `charpoly_map`, `charpoly_diagonal` and `charpoly_units_conj`. For a field, `Representation.IsSemisimpleRepresentation` means that the lattice of subrepresentations is complemented; `Representation.IsIrreducible` means it is a simple order. Absolute irreducibility is tested after scalar extension to `AlgebraicClosure`. `Matrix.rank` is the finite dimension of the image of `mulVecLin`. This matrix and representation algebra supplies neither automorphic existence nor period comparison.

## Conventions

Fix n≥1. A dominant weight a has integer coordinates a_{τ,1}≥⋯≥a_{τ,n}, possibly negative. The infinitesimal character of π_τ is that of Ξ_a∨, whereas Ξ_a itself supplies the coefficient representation. Repetitions in a are allowed: the shift by n−i produces distinct Hodge–Tate numbers. For CM conjugation c, the condition a∈(ℤⁿ)_w is a_{τ,i}+a_{τc,n+1−i}=w for every τ and i.

Artin reciprocity sends a uniformizer to geometric Frobenius. Thus ε_ℓ(Frob_v)=q_v⁻¹ and HT(ε_ℓ)=−1. With t_{v,0}=1 the monic good-place polynomial is

\[
P_v(X)=\sum_{i=0}^n(-1)^i q_v^{i(i-1)/2}t_{v,i}X^{n-i}.
\]

Its constant coefficient has sign (−1)^n. Its roots in unitary Satake coordinates are q_v^{(n−1)/2}α_j; the integral coefficients need no square root. The raw polynomial is defined before local Langlands. AG2.5 compares it with the geometric normalization rec^T(π_v)=rec(π_v⊗|det|^{(1−n)/2}); conversion to arithmetic Frobenius takes the normalized reciprocal polynomial. The classical R19 comparison must also account for its dual/Frobenius convention.

The labelled Hodge multiset is H_τ(a)={a_{τ,i}+n−i:1≤i≤n}. In `Fin n` coordinates it is {a(i)+n−1−i}. For a=(k−2,0) it is {k−1,0}. Its sum determines a determinant weight, but does not recover the multiset. The period supplier's convention HT(ε)=+1 is translated by negating numerical labels. Filtered modules and monodromy maps still require their explicit comparison; a numerical sign change does not implicitly dualize a representation.

For a∈(ℤⁿ)_w the purity weight is W=w+n−1. If the algebraic multiplier is χ, the Galois multiplier is μ_λ=ε_ℓ^{1−n}r_{χ,λ}, and r_χ has purity weight 2w. At a real place,

\[
\mu_\lambda(c_v)=(-1)^{n-1+w}\chi_v(-1).
\]

Total oddness therefore requires χ_v(−1)=(−1)^{n+w}. The printed BLGGT sign without w agrees only for even w. Twisting χ by the CM quadratic character exchanges the two parity choices.

Three coefficient fields serve different purposes. M_π is the rationality field of π^∞ and the good Frobenius polynomials. A finite local E_λ/Q_ℓ realizes one member before a lattice is chosen. A possibly larger global E is a strong field whose completions realize all members. Rational traces alone need not split the Schur-index obstruction. The common-field argument uses two good distinct-root Frobenius polynomials of different residue characteristics, together with regular de Rham information. Consequently its prerequisite arrows can go from AG2.3 to a particular AG2.6 comparison, then back to a later AG2.6 export; the target-level dependency order is acyclic.

Good-place attachment, equality of semisimplified Weil parameters, dominance of monodromy partitions and full Frobenius-semisimple Weil–Deligne equality are separate conclusions. Full equality includes N in the polarized branch. For arbitrary nonselfdual CM forms at v|ℓ the conclusions are de Rham admissibility, the full labelled Hodge multiset, semisimplified compatibility and an upper bound for N. Spherical places are crystalline and Iwahori places semistable; general ramified monodromy equality is not asserted.

For residual representations, first choose a finite local model and a stable lattice, then reduce and semisimplify. Independence concerns that semisimple isomorphism class, not a canonical lattice. A stable lattice alone does not supply a self-dual integral pairing. ACC+ local genericity includes trivial inertia and excludes α_i/α_j=q for every ordered pair i≠j, counting multiplicities. Repeated eigenvalues can satisfy it. The stronger CS condition also excludes ratio 1. A decomposed generic prime p≠ℓ must split completely in F and satisfy the local condition at every place above p. Absolute irreducibility is an additional hypothesis. Scalar twists preserve the local ratio condition only when they remain unramified there.

The imaginary quadratic field in the CS discrete-transfer setup is denoted 𝒦: F=F⁺𝒦, the norm is N_{F/𝒦}, and the rational splitting condition is q∈Spl_{𝒦/ℚ}. This resolves the undefined F₀ in the printed Corollary 5.5.5 and uses one symbol for the same field throughout.

## Layers

| Layer | Output |
| --- | --- |
| AG2.0 | Weights, algebraic characters, coefficient fields and good-place attachment |
| AG2.1a | Actual compact PEL/Kuga–Sato objects, coefficients, raw cohomology and traces |
| AG2.1b | Mantovan/Igusa comparison, concentration and actual Galois constituents |
| AG2.2 | Polarization twists, solvable base change and selected discrete sums |
| AG2.3 | Definite families, effective patching, arbitrary regularity and common realization fields |
| AG2.4 | Ordinary boundary rigid cohomology, Hasse approximation and nonselfdual existence |
| AG2.5 | Local normalization, semisimple comparison, monodromy bounds and full polarized compatibility |
| AG2.6 | Coefficient-prime comparison, compatible systems and specialization comparisons |
| AG2.7 | Finite local realization, residual Hecke ideals, genericity and arithmetic exports |

AG2.1 comprises its two mathematical producers AG2.1a and AG2.1b. The order below follows these layers; “Requires” records the finer proof order and names external stages explicitly. Internal links refer to mathematical targets even when their historical identifier has a different layer prefix. API and test names lie in `TauCeti.AutomorphicGalois` unless another namespace is displayed. The tests are required discriminating examples and counterexamples, including geometrically supplied cases; a partial algebraic example in Suggested.lean does not establish its full automorphic version.

The sources are keyed in the bibliography. Locators use the stated edition's printed pages unless marked as author-copy or arXiv pages. AHTW v1 is an unrefereed preprint. The targets are grouped by their mathematical outputs, rather than by the order of any paper.
## AG2.0. Algebraic weights, characters and good-place attachment

Start with the labelled weight, automorphic multiplier and coefficient embedding. The integral polynomial and its twist identities require only spherical Hecke and character theory. Keep the early rationality field separate from the later field of realization.

<a id="dominant-weights-and-the-weight-w"></a>

**Dominant weights (ℤⁿ)^{Hom(F,Ω),+}, the subsets (ℤⁿ)_w for CM fields, base change of weights and the representations Ξ_a.** For a number field F, rank n≥1 and algebraically closed characteristic-zero coefficient field Ω, use the embedding-wise dominant GL_n coordinates of AF.4: a family a has a_{τ,1}≥⋯≥a_{τ,n} at each τ:F→Ω. The notation (ℤⁿ)^{Hom(F,Ω),+} denotes this specialization of the imported algebraic-weight carrier. For totally real or CM F with conjugation c, membership in (ℤⁿ)_w means a_{τ,i}+a_{τ∘c,n+1−i}=w for every τ and i. When Ω=ℂ, conjugating the target embedding gives the same condition. Restriction of embeddings defines base change: (a_{F′})_{τ,i}=a_{τ|_F,i}. Extreme regularity asks that, at some embedding, equal-sized subsets of the shifted entries {a_{τ,i}+n−i} are determined by their sums. For complex coefficients Ξ_a is AF.4’s highest-weight representation, identified with the tensor product of the GL_n representations of highest weights a_τ. The coordinate notation and Ξ_a do not introduce a second highest-weight theory.

Assume also: Dominance is the ordering a_{τ,1} ≥ ⋯ ≥ a_{τ,n}, with repetitions allowed; regularity of the attached Hodge–Tate numbers comes from the shift by n − i (the Hodge multiset below), not from strictness of a. The condition defining (ℤⁿ)_w pairs τ with τ∘c and i with n + 1 − i. It is empty unless F is totally real or CM. Ξ_a is a representation of the complex group GL_n^{Hom(F,ℂ)} = (Res_{F/ℚ} GL_n)_ℂ. Its highest-weight theory is supplied by AutomorphicFormsOnReductiveGroups AF.4 (algebraic highest weights).

API:

- `DominantWeight`: The GL_n coordinate form of AF.4 AlgebraicWeight is ι → {a : Fin n → ℤ // Antitone a}; DominantWeight is this specialization, not a new general carrier.
- `DominantWeight.IsInW`: a.IsInW c w :⇔ ∀ τ i, a τ i + a (c τ) (rev i) = w, for an involution c of ι.
- `DominantWeight.baseChange`: (a.baseChange f) τ′ = a (f τ′) for the restriction f: Hom(F′, Ω) → Hom(F, Ω).
- `DominantWeight.IsExtremelyRegular`: Some τ has no two distinct equal-size subsets of {a τ i + n − 1 − i} with equal sums.
- `DominantWeight.xi`: Ξ_a is the imported AF.4 representation V_a, identified with its embedding-wise tensor product; no highest-weight classification is reproved here.
- `DominantWeight.isInW_baseChange`: a ∈ (ℤⁿ)_w implies a_{F′} ∈ (ℤⁿ)_w when F′ ⊇ F is CM or totally real.
- `DominantWeight.mk`: An embedding-indexed family a of antitone Fin n → ℤ functions constructs its DominantWeight.
- `DominantWeight.ext`: Two dominant weights are equal when every embedding-wise coordinate is equal.
- `DominantWeight.baseChange_id`: a.baseChange id = a.
- `DominantWeight.baseChange_comp`: (a.baseChange f).baseChange g = a.baseChange (f ∘ g).

Tests: `DominantWeight.isInW_classical` — For F = ℚ, n = 2, integer k≥2 and a = (k − 2, 0): a is dominant and lies in (ℤ²)_{k−2}; `DominantWeight.isInW_rank_one` — For n = 1 every a ∈ ℤ^{Hom(F,ℂ)} is dominant, and a ∈ (ℤ¹)_w iff a_τ + a_{cτ} = w for all τ; `DominantWeight.not_isInW_unpaired` — For F imaginary quadratic, n = 2, a_τ = (1, 0) and a_{cτ} = (0, 0): a_{τ,1} + a_{cτ,2} = 1 but a_{τ,2} + a_{cτ,1} = 0, so a lies in no (ℤ²)_w; `DominantWeight.not_dominant` — (0, 1) is not dominant: a definition with a_{τ,1} ≤ ⋯ ≤ a_{τ,n} would accept it.

Requires: `mathlib:NumberField.IsCMField.complexEmbedding_complexConj`; `AutomorphicFormsOnReductiveGroups:AF.4`; `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`.

Sources: [BLGGT](#source-blggt), §2.1, p. 32; [BLGGT](#source-blggt), §2.1, p. 32.

<a id="regular-algebraic-of-weight"></a>

**Regular algebraic automorphic representations of GL_n(𝔸_F) and their weight.** For an automorphic GL_n(𝔸_F) representation π over a number field F, regular algebraicity means that its archimedean infinitesimal character comes from an irreducible algebraic representation of Res_{F/ℚ} GL_n. Write its weight as the unique dominant family a for which infChar(π_∞)=infChar(Ξ_a^∨). If an algebraic Hecke character ψ has identity-component infinity type ∏_τ τ(x)^{−b_τ}, tensoring π with ψ∘det changes a_{τ,i} to a_{τ,i}+b_τ. Thus an integer norm twist π⊗‖det‖^t changes every coordinate to a_{τ,i}−t.

Assume also: The infinitesimal character is compared with that of Ξ_a^∨, not Ξ_a; this is the convention of both BLGGT and ACC+. Regular algebraic is Clozel's C-algebraic for GL_n. It differs from L-algebraic by the twist ‖det‖^{(n−1)/2} when n is even. The C/L distinction is owned by AutomorphicFormsOnReductiveGroups AF.4 and is imported here. No cuspidality, self-duality or unitarity is part of the definition.

API:

- `IsRegularAlgebraic`: π.IsRegularAlgebraic :⇔ ∃ a, π.HasWeight a.
- `HasWeight`: π.HasWeight a :⇔ infChar π_∞ = infChar (Ξ_a)^∨.
- `HasWeight.unique`: π.HasWeight a → π.HasWeight b → a = b.
- `HasWeight.twist`: π.HasWeight a → (π ⊗ ψ∘det).HasWeight (a + b) for ψ algebraic of exponents (b_τ).
- `HasWeight.twist_norm`: (π ⊗ ‖det‖^t).HasWeight (a − t) ↔ π.HasWeight a.

Tests: `hasWeight_heckeCharacter` — n = 1: ψ with ψ_∞(x) = ∏ τ(x)^{−a_τ} on (F_∞^×)⁰ has weight (a_τ); `hasWeight_classical` — For a classical newform f of integer weight k≥2, π_f ⊗ ‖det‖^{1−k/2} has weight (k − 2, 0); `not_isRegularAlgebraic_odd_weight_unitary` — π_f with f of odd weight k is not regular algebraic: its infinitesimal character (±(k − 1)/2) is not a shifted integral weight; `hasWeight_trivial` — The trivial representation of GL_1(𝔸_F) has weight 0.

Requires: [AG2.0: dominant weights](#dominant-weights-and-the-weight-w); `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`; `AutomorphicFormsOnReductiveGroups:AF.4/infinitesimal-character-of-weight`; `AutomorphicFormsOnReductiveGroups:AF.1`.

Sources: [BLGGT](#source-blggt), §2.1, p. 32; [ACC+](#source-accplus), §1, Notation, p. 908.

<a id="polarized-automorphic-representation"></a>

**Conjugate self-dual, essentially conjugate self-dual and polarized automorphic representations, with the multiplier character.** Let F be totally real or CM with maximal totally real subfield F⁺ and complex conjugation c, and π an automorphic representation of GL_n(𝔸_F). (i) π is conjugate self-dual if π^c ≅ π^∨. (ii) π is essentially conjugate self-dual with multiplier χ if χ: 𝔸_{F⁺}^×/(F⁺)^× → ℂ^× is continuous and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det). (iii) (π, χ) is a polarized automorphic representation if moreover χ_v(−1) is independent of v | ∞. (iv) π is polarizable if some (π, χ) is polarized. (v) A regular algebraic polarized (π, χ) of weight a ∈ (ℤⁿ)_w with F imaginary is totally odd if χ_v(−1) = (−1)^{n+w} for all v | ∞. Here π^c = π ∘ c on GL_n(𝔸_F), and π^c = π when F is totally real.

Assume also: The multiplier χ is part of the data. It is determined by π only up to δ_{F/F⁺}, since δ_{F/F⁺} ∘ N_{F/F⁺} = 1. BLGGT impose instead χ_v(−1) = (−1)^n for F imaginary (printed with µ in place of χ). That is the correct normalisation only when w is even; with odd w it makes the Galois multiplier even (the multiplier computation below). Condition (v) is the corrected form, and like BLGGT's it can always be achieved by replacing χ by χδ_{F/F⁺}. For regular algebraic (π, χ) of weight a ∈ (ℤⁿ)_w, χ is algebraic with |χ| = ‖·‖^{−w}. Conjugate self-duality is the case χ = 1, possible only when w = 0. For F totally real, polarized means essentially self-dual with χ_v(−1) independent of v. Patrikis shows the independence is automatic for regular algebraic cuspidal π; that result is not needed here.

API:

- `IsConjSelfDual`: π.IsConjSelfDual :⇔ π^c ≅ π^∨.
- `IsEssConjSelfDual`: π.IsEssConjSelfDual χ :⇔ π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det).
- `PolarizedAutRep`: A pair (π, χ) with IsEssConjSelfDual and v ↦ χ_v(−1) constant on the real places.
- `PolarizedAutRep.twistDelta`: (π, χ) ↦ (π, χ δ_{F/F⁺}), again polarized.
- `PolarizedAutRep.IsTotallyOdd`: For regular algebraic (π, χ) of weight in (ℤⁿ)_w: χ_v(−1) = (−1)^{n+w} for v | ∞.
- `PolarizedAutRep.exists_totallyOdd`: Exactly one of (π, χ), (π, χδ_{F/F⁺}) is totally odd when F is imaginary.
- `PolarizedAutRep.weight_mem_W`: A regular algebraic polarized pair has weight in (ℤⁿ)_w with |χ| = ‖·‖^{−w}.

Tests: `polarized_heckeCharacter_cm` — n = 1, ψ of weight (1, 0) over an imaginary quadratic field: (ψ, ψ|_{𝔸_ℚ}δ) is totally odd; (ψ, ψ|_{𝔸_ℚ}) is not; `isConjSelfDual_iff_multiplier_one` — π.IsConjSelfDual ↔ π.IsEssConjSelfDual 1; `polarized_totallyReal` — For F totally real, π^c = π and polarized means essentially self-dual with χ_v(−1) independent of v; `not_totallyOdd_blggt_sign_odd_w` — A pair satisfying BLGGT's printed χ_v(−1) = (−1)^n with w odd (the CM elliptic curve character) is not totally odd: its Galois multiplier takes c_v to +1.

Requires: [AG2.0: regular algebraicity](#regular-algebraic-of-weight); [AG2.0: dominant weights](#dominant-weights-and-the-weight-w); `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

Sources: [BLGGT](#source-blggt), §2.1, p. 32; [BLGGT](#source-blggt), §2.1, p. 32; [CH](#source-ch), Hypotheses 4.1(ii), p. 13.

<a id="polarized-galois-representation"></a>

**BLGGT pairing conventions for the imported polarized carrier.** Use the continuous representation and polarized-extension carriers of R01.1 and G7. For CM F, the BLGGT pairing has symmetry ε_v=−μ(c_v), so total oddness is ε_v=1, equivalently μ(c_v)=−1; this is the convention bridge to the G_n-valued extension with multiplier μ. For totally real F, an invariant alternating (respectively symmetric) pairing has μ(c_v)=−ε_v (respectively ε_v) in the corresponding symplectic (respectively orthogonal) extension convention. Algebraic and regular conditions import the p-adic Hodge carrier, with HT(ε_ℓ)={−1}. This comparison specializes those carriers and does not construct a second deformation theory.

Assume also: The condition at one infinite place implies it at all of them, with ε_{v′} = µ(c_v c_{v′})ε_v and ⟨x, y⟩_{v′} = ⟨x, r(c_v c_{v′}) y⟩_v. For F imaginary, (r, µ) is polarized if and only if r extends to r̃: G_{F⁺} → 𝒢_n(Q̄_l) with multiplier µ, where 𝒢_n is the group of Clozel–Harris–Taylor (ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group). For F totally real, (r, µ) is polarized if and only if r factors through GSp_n (µ(c_v) = −ε_v) or GO_n (µ(c_v) = ε_v) with multiplier µ. Hodge–Tate numbers use BLGGT's convention HT_τ(ε_l) = {−1}.

Requires: `ArithmeticGaloisRepresentations:R01.1/continuous-representation`; `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`; `PadicHodgeTheory:R06.2`; `ArithmeticGaloisRepresentations:G7/polarized-representation`; `ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant`; `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`.

Sources: [BLGGT](#source-blggt), §2.1, p. 31; [BLGGT](#source-blggt), §2.1, p. 31.

<a id="galois-character-of-an-algebraic-hecke-character"></a>

**The l-adic character r_{l,ι}(χ) of an algebraic Hecke character, its Hodge–Tate numbers and its weight.** Let F be a number field, l a prime and ι: Q̄_l ≅ ℂ, with Art_F normalised to send uniformisers to geometric Frobenius elements. Let χ: 𝔸_F^×/F^× → ℂ^× be algebraic: χ|_{(F_∞^×)⁰}(x) = ∏_{τ ∈ Hom(F,ℂ)} τ(x)^{−a_τ} with a_τ ∈ ℤ. There is a unique continuous character r_{l,ι}(χ): G_F → Q̄_l^× with ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for all v ∤ l; explicitly ι((r_{l,ι}(χ) ∘ Art_F)(x) ∏_τ (ι^{−1}τ)(x_l)^{a_τ}) = χ(x) ∏_τ (τ x_∞)^{a_τ}. It is de Rham above l with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}. The weight wt(χ) is the integer with |χ| = ‖·‖^{−wt(χ)/2}. Then a_τ + a_{τ′} = wt(χ) whenever τ|_{F₀} = τ′|_{F₀} ∘ c (F₀ the maximal CM subfield), wt(χ) is even when F₀ is totally real, wt(‖·‖_F) = −2, r_{l,ι}(‖·‖) = ε_l, and r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2} at every real place v when F is totally real.

Assume also: The normalisation of Art_F (uniformisers ↦ geometric Frobenius) fixes r_{l,ι}(‖·‖) = ε_l. With the arithmetic normalisation it would be ε_l^{−1}. HT_τ(ε_l) = {−1} in this convention, consistent with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}} and a = −1 for ‖·‖ over ℚ. The value at complex conjugation is computed at real places only: at a complex place there is no c_v in G_F.

API:

- `AlgHeckeChar.galoisChar`: r_{l,ι}(χ): G_F → Q̄_l^× for an algebraic Hecke character χ.
- `AlgHeckeChar.galoisChar_local`: ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for v ∤ l.
- `AlgHeckeChar.hodgeTate_galoisChar`: HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}.
- `AlgHeckeChar.wt`: wt(χ) ∈ ℤ with |χ| = ‖·‖^{−wt(χ)/2}.
- `AlgHeckeChar.galoisChar_mul`: r_{l,ι}(χ₁χ₂) = r_{l,ι}(χ₁) r_{l,ι}(χ₂).
- `AlgHeckeChar.galoisChar_norm`: r_{l,ι}(‖·‖_F) = ε_l.
- `AlgHeckeChar.galoisChar_complexConj`: For F totally real: r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2}.
- `AlgHeckeChar.galoisChar_restrict`: r_{l,ι}(χ|_{𝔸_{F⁺}^×}) = r_{l,ι}(χ) ∘ V, V: G_{F⁺}^{ab} → G_F^{ab} the transfer.

Tests: `galoisChar_norm_rat` — F = ℚ: r_{l,ι}(‖·‖) = ε_l, with HT {−1} and wt −2; `galoisChar_trivial` — r_{l,ι}(1) = 1, with a = 0 and wt 0; `galoisChar_finite_order` — For ω of finite order unramified at p ∤ l: r_{l,ι}(ω)(Frob_p^{geom}) = ω_p(p), and r_{l,ι}(ω)(Frob_p^{arith}) = ω_p(p)^{−1}; `galoisChar_restrict_complexConj` — For F imaginary and ψ algebraic on F, r_{l,ι}(ψ|_{𝔸_{F⁺}})(c_v) = +1 because the transfer sends c_v to c_v² = 1, whatever ψ_v(−1) is: the Galois sign is not χ_v(−1) unless wt/2 is even.

Requires: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`; `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`; `PadicHodgeTheory:R06.2`.

Sources: [BLGGT](#source-blggt), §A.2, p. 87; [BLGGT](#source-blggt), §A.2, p. 87; [BLGGT](#source-blggt), Notation, p. 8.

<a id="sign-of-the-polarization-multiplier"></a>

**The parity of the Galois multiplier of a polarized pair: µ(c_v) = (−1)^{n−1+w} χ_v(−1).** Let F be imaginary CM and (π, χ) a regular algebraic polarized automorphic representation of GL_n(𝔸_F) of weight a ∈ (ℤⁿ)_w. Put µ = ε_l^{1−n} r_{l,ι}(χ): G_{F⁺} → Q̄_l^×. Then µ(c_v) = (−1)^{n−1+w} χ_v(−1) for every v | ∞. Hence µ is totally odd if and only if χ_v(−1) = (−1)^{n+w}, i.e. (π, χ) is totally odd in the sense of polarized-automorphic-representation (v). Under BLGGT's printed normalisation χ_v(−1) = (−1)^n, µ(c_v) = (−1)^{w+1}: it is −1 exactly when w is even.

Assume also: The integer w is the one with a ∈ (ℤⁿ)_w. Theorem 2.1.1 of BLGGT uses a different integer, the purity weight w + n − 1 of r_{l,ι}(π). Only the multiplier's value at complex conjugation is computed. No Galois representation r_{l,ι}(π) is needed for the statement.

Requires: [AG2.0: polarized pairs](#polarized-automorphic-representation); [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); [AG2.0: pairing conventions](#polarized-galois-representation).

Sources: [BLGGT](#source-blggt), Theorem 2.1.1(1), p. 33; [BLGGT](#source-blggt), Proof of Theorem 2.1.1, p. 34; [Patrikis](#source-patrikis), §4, proof of Proposition 4.1, p. 8.

<a id="expected-hodge-tate-multiset"></a>

**The Hodge–Tate multiset attached to a weight: HT_τ = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}.** For a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, ι: Q̄_l ≅ ℂ and τ: F → Q̄_l, put HT_τ(a) = {a_{ι∘τ,i} + n − i : 1 ≤ i ≤ n}, a multiset of n integers, in BLGGT's convention HT_τ(ε_l) = {−1}. The elements are distinct, so a Galois representation with these Hodge–Tate numbers is regular. If F is CM and a ∈ (ℤⁿ)_w, then HT_{τ∘c}(a) = {w + n − 1 − h : h ∈ HT_τ(a)}. Twisting a by −t (π ↦ π ⊗ ‖det‖^t) subtracts t from every element, matching ⊗ ε_l^t. In the opposite convention (HT(ε_l) = +1) every element is negated.

Assume also: This is the target that AG2.6 proves for r_{l,ι}(π) (BLGGT Theorem 2.1.1(3), ACC+ Theorem 2.3.3(b)); here it is only the dictionary from a to a multiset. The integer w + n − 1 is BLGGT's w in Theorem 2.1.1(3). The two integers must not be confused.

API:

- `expectedHodgeTate`: expectedHodgeTate a = multiset of a i + (n − 1 − i), i : Fin n (0-indexed).
- `expectedHodgeTate_strictAnti`: i ↦ a i + (n − 1 − i) is strictly antitone when a is antitone.
- `expectedHodgeTate_conj`: a ∈ (ℤⁿ)_w ⇒ HT at τc is {w + n − 1 − h : h ∈ HT at τ}.
- `expectedHodgeTate_twist`: expectedHodgeTate (a − t) = (expectedHodgeTate a).map (· − t).
- `expectedHodgeTate_card`: The multiset expectedHodgeTate a has cardinality n.
- `expectedHodgeTate_nodup`: For antitone a, expectedHodgeTate a has no repetitions, by strict antitonicity of the shifted coordinates.

Tests: `expectedHodgeTate_classical` — n = 2, a = (k − 2, 0) ↦ {k − 1, 0}; for k = 12, {11, 0}; `expectedHodgeTate_zero` — For n≥1, a = 0 ↦ {n − 1, …, 1, 0}: parallel weight 0 gives the Hodge–Tate numbers of Symⁿ⁻¹ of the dual Tate module of an elliptic curve; `expectedHodgeTate_regular` — The elements are pairwise distinct, so the multiset is regular in BLGGT's sense (|HT_τ| = n); `not_expectedHodgeTate_unshifted` — The unshifted multiset {a_{τ,i}} fails regularity for a = 0 and n ≥ 2, so the shift n − i is part of the definition.

Requires: [AG2.0: dominant weights](#dominant-weights-and-the-weight-w).

Sources: [BLGGT](#source-blggt), Theorem 2.1.1(3), p. 33; [BLGGT](#source-blggt), Notation, p. 8; [ACC+](#source-accplus), Corollary 7.2.4, p. 1100.

<a id="frobenius-polynomial-and-conventions"></a>

**Automorphic specialization of the integral Hecke polynomial.** Let v be a finite place of F with q_v = #k(v), π_v an unramified irreducible representation of GL_n(F_v), and t_{v,i} the eigenvalue on π_v^{GL_n(O_{F_v})} of T_{v,i} = [GL_n(O_{F_v}) diag(ϖ_v, …, ϖ_v, 1, …, 1) GL_n(O_{F_v})] (ϖ_v repeated i times). Define P_v(π_v; X) = Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}. If α₁, …, α_n are the Satake parameters of π_v, with t_{v,i} = q_v^{i(n−i)/2} e_i(α), then P_v(π_v; X) = ∏_j (X − q_v^{(n−1)/2} α_j). Conventions: a Galois representation r corresponds to π at v in the geometric convention (BLGGT, ACC+, HLTT: Frob_v geometric, Art uniformisers ↦ geometric Frobenius) if ι det(X − r(Frob_v)) = P_v(π_v; X). It corresponds in the arithmetic convention (IntegralHeckeAndGaloisDeterminants IHG.3, and R19) if the arithmetic Frobenius has characteristic polynomial P_v(π_v; X). r corresponds in one convention if and only if r^∨ corresponds in the other. Twists: P_v(π_v ⊗ ‖det‖^t; X) = q_v^{−tn} P_v(π_v; q_v^t X), matching r ↦ r ⊗ ε_l^t. The contragredient has roots q_v^{n−1}/β_j, where β_j are the roots for π_v, matching r ↦ r^∨ ⊗ ε_l^{1−n}.

Assume also: No local Langlands correspondence is used. For unramified π_v, 'r corresponds at v' is defined by the polynomial identity, which is what AG2.0 requires. Agreement with rec(π_v ⊗ |det|^{(1−n)/2}) for unramified π_v is an AG2.5 comparison. ACC+ say P_v corresponds to Frobenius on rec^T(π_v), their arithmetic normalisation of local Langlands (Clozel–Thorne §2.1), with Frob_v geometric in their notation. That is the geometric convention here.

Requires: [AG2.0: regular algebraicity](#regular-algebraic-of-weight); `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients`; `IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist`; `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`; `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`; [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character).

Sources: [ACC+](#source-accplus), §2.2.5, (2.2.6), p. 922; [ACC+](#source-accplus), Theorem 2.3.2, p. 935; [ACC+](#source-accplus), Notation, p. 906.

<a id="galois-representation-attached-at-good-places"></a>

**A Galois representation attached to π at the good places, and its functoriality under twist, dual, conjugation and base change.** For regular algebraic cuspidal π, a coefficient isomorphism ι:Q̄_ℓ≅C, and a continuous semisimple rank-n representation r of G_F unramified outside a finite set, IsAttached(ι,r,π) means that outside a finite set of finite places v∤ℓ, π_v is spherical, r is unramified, and ι det(X−r(Frob_v^geom))=P_v(π_v;X). The exceptional set contains the ramification of π, F and r and the coefficient prime. Two such r are isomorphic by Frobenius density. This is a good-place condition; it asserts neither local Langlands compatibility at ramified places nor de Rham admissibility nor global existence.

Assume also: This is the property HLTT prove for every regular algebraic cuspidal π over a CM field (ACC+ Theorem 2.3.2). It is the interface that AG2.1–AG2.4 produce and AG2.5 strengthens. Nothing at the places in S, or above l, is asserted. Uniqueness needs semisimplicity. It uses Čebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations R01.1/R01.5). The base-change clause needs the Satake parameters of BC(π)_w to be the q-power restrictions of those of π_v (the unramified base-change identity), supplied by EndoscopicTransferAndUnitaryTraceComparison ET.7, which exports the Arthur–Clozel base-change steps to this roadmap.

API:

- `IsAttached`: r.IsAttached ι π :⇔ ∃ S finite, ∀ v ∉ S, r unramified at v ∧ ι det(X − r(Frob_v)) = P_v(π_v).
- `IsAttached.unique`: r, r′ semisimple and both attached to π ⇒ r ≅ r′.
- `IsAttached.twist`: r.IsAttached π → (r ⊗ r_{l,ι}(ψ)).IsAttached (π ⊗ ψ∘det).
- `IsAttached.dual`: r.IsAttached π → (r^∨ ⊗ ε_l^{1−n}).IsAttached π^∨.
- `IsAttached.conj`: r.IsAttached π → r^c.IsAttached π^c.

Tests: `isAttached_heckeCharacter` — n = 1: r_{l,ι}(ψ).IsAttached ι ψ; `isAttached_classical` — ρ_f^∨ is attached to π_f ⊗ ‖det‖^{1−k/2}; for Δ the polynomial at 2 is X² + 24X + 2^{11}; `not_isAttached_classical_rho` — ρ_f is not attached to π_f ⊗ ‖det‖^{1−k/2} (for Δ its geometric polynomial at 2 is X² + 24·2^{−11}X + 2^{−11}); `isAttached_dual_twist` — The two rules compose consistently: (r^∨ε^{1−n})^∨ε^{1−n} = r, matching π^∨∨ = π.

Requires: [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); [AG2.0: regular algebraicity](#regular-algebraic-of-weight); `ArithmeticGaloisRepresentations:R01.1/continuous-representation`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

Sources: [ACC+](#source-accplus), Theorem 2.3.2, p. 935; [ACC+](#source-accplus), §2.3, after Definition 2.3.6, p. 938.

<a id="field-of-rationality"></a>

**Rationality of the good Hecke polynomials.** Import M_π=C^{Aut(C/π^∞)} and Clozel rationality from AF.4. For regular algebraic cuspidal π on GL_n over a CM or totally real field, every spherical integral Hecke polynomial P_v(π_v;X) has coefficients in M_π. At good places the traces of any attached r therefore lie in ι^(−1)(M_π). This controls traces, not a model of r over (M_π)_λ: the Schur-index obstruction is supplied by R01.5. Coefficient conjugation sends M_π to M_{σπ}=σ(M_π).

Assume also: The definition uses π^∞ only. σπ^∞ is π^∞ with scalars extended along σ. M_π controls traces, not realizations. The field over which r can be written may be strictly larger, by a Schur-index obstruction. AG2.3/finite-number-field-of-realization proves a common realization field using the regular labelled Hodge–Tate input supplied by AG2.6; the early rationality theorem does not depend on that late result. Clozel's theorem is used with its exact hypotheses: π regular algebraic (cohomological) and cuspidal. It is not claimed for non-cuspidal or non-algebraic π.

Requires: [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`; `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`; `ArithmeticGaloisRepresentations:R01.5/descent-obstruction`.

Sources: [ACC+](#source-accplus), §7.1, p. 1093.

<a id="attachment-twist-dual-and-conjugation"></a>

**Twists, duals and conjugation preserve good-place attachment.** If IsAttached(ι,r,π), then IsAttached(ι,r⊗r(ψ),π⊗ψ∘det) for algebraic ψ; in particular norm^t corresponds to ε_ℓ^t. Also r^∨⊗ε_ℓ^(1−n) is attached to π^∨, and for CM F the conjugate r^c is attached to π^c. All conclusions are up to isomorphism and enlarge the finite excluded set by the character ramification.

Assume also: r semisimple and continuous; ψ algebraic; fixed geometric Artin/Frobenius normalization.

Requires: [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

Sources: [ACC+](#source-accplus), §2.3 after Definition 2.3.6, p. 938.

<a id="unitary-similitude-central-character-dictionary"></a>

**The similitude character in a compact coefficient system.** For Shin’s compact similitude datum, write an algebraic coefficient ξ by its integral central exponent a₀(ξ) and dominant entries a(ξ)_{σ,1}≥⋯≥a(ξ)_{σ,n} for the chosen CM type. Its purity weight is w(ξ)=−2a₀(ξ)−Σ_{σ,i}a(ξ)_{σ,i}. The normalization of the coefficient sheaf and the extracted Galois constituent retains the GL₁-character ψ: the shifted labelled integers are j_κ(k)=k−1−a(ιξ)_{ικ,k}−a₀(ιξ). For ξ=ν^t, a₀=t and all a_{σ,i}=0, so w(ξ)=−2t and j_κ(k)=k−1−t. This is the required nontrivial central-character acceptance case.

Assume also: Use the chosen CM type and positive similitude component, with Shin §3.6 and §6.2 indexing; n≥1, t integral.

Requires: [AG2.0: dominant weights](#dominant-weights-and-the-weight-w); `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`; `AutomorphicBundles:B2`.

Sources: [Shin](#source-shin), §3.6, definitions preceding (3.18), and §6.2 preceding Corollary 6.7, pp. 20, 48.

<a id="prescribed-crystalline-twisting-character"></a>

**A crystalline character with prescribed p-adic unit type.** Let F be CM, p a prime, E/Q_p sufficiently large, S a finite ramification set containing the p-adic places, and ṽ a p-adic place split over F⁺. For the compatible algebraic local unit characters used in ACC+ §4.5.1, there is a continuous ψ:G_F→O_E^× crystalline at every place above p, unramified at ṽ and at S minus S_p, and with ψ∘Art_{F_{ṽc}} on units equal to ∏_{τ:F_{ṽ}→E}(τc)^(λ_{τ₀,1}+λ_{τ₀c,1}), where τ₀ maximizes that sum. Its labelled HT weights are 0 at ṽ and −λ_{τ₀,1}−λ_{τ₀c,1} at ṽc. Additional finite ramification is allowed outside S.

Assume also: The local prescriptions satisfy the global unit and totally real restriction compatibility of HSBT Lemma 2.2. This is the source’s split-place construction; arbitrary inconsistent local characters are excluded.

Requires: [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); [AG2.0: dominant weights](#dominant-weights-and-the-weight-w); `PadicHodgeTheory:R06.2`.

Sources: [ACC+](#source-accplus), §4.5.1, proof of Theorem 4.5.1, pp. 985–986; [HSBT](#source-hsbt), Lemma 2.2, pp. 795–796.

<a id="relevant-automorphic-coefficient-field"></a>

**The coefficient field of a relevant automorphic representation.** For relevant π in Liu et al. Definition 1.1.3, import Q(π) as the fixed field of automorphisms preserving the finite part π^∞. Its local coefficient field is generated by coefficients of ∏_i(T−α_i q_v^{(N−1)/2}) at spherical places. Lemma 3.1.2 identifies Q(π) with the compositum of these local fields, using Clozel rationality and strong multiplicity one. This is an automorphic coefficient-field result; it does not prove Definition 3.2.5 strong Galois realization over each completion.

Assume also: Relevant regular algebraic CSD cuspidal π and normalized spherical parameters; all coefficient embeddings tracked.

Requires: [AG2.0: Rationality of the good Hecke polynomials](#field-of-rationality); `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`; `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`; `AutomorphicFormsOnReductiveGroups:AF.4`.

Sources: [Liu](#source-liu), §3.1, Definition 3.1.1 and Lemma 3.1.2, pp. 138–139 (PDF pp. 32–33).

## AG2.1a. Compact-unitary geometry and raw cohomology

Construct the actual compact PEL tower and its Kuga–Sato powers with algebraic coefficients. First produce finite continuous geometric Galois actions and raw traces. Neither a virtual automorphic identity nor a later local correspondence can replace these geometric inputs.

The coefficient construction requires an explicit ξ↦(m_ξ,t_ξ,ε_ξ) recipe with parity and central twist, not merely an idempotent identity; TY §2 points to Harris–Taylor pp.97–98 for that recipe. Effectivity of Kottwitz triples requires a polarized O_F-linear abelian realization with the prescribed p-adic isocrystal, positivity and trivial obstruction α₀. Unpolarized Honda–Tate classification alone does not provide this. The raw fixed-point theorem must be available before stabilization; Lefschetz–Verdier trace classes alone do not identify the fixed-point sum.

<a id="compact-shin-pel-instance"></a>

**The compact unitary PEL instance.** Under Shin §5.1, F=EF⁺ is CM, E imaginary quadratic, n≥3 odd, [F⁺:Q]≥2, and all rational primes ramified in F split in F/F⁺. Choose a CM embedding τ and the similitude datum of Lemma 5.1: signature (1,n−1) at τ and (0,n) at the other selected embeddings, quasi-split at all finite places and anisotropic modulo centre over Q. At sufficiently small level U the PEL moduli scheme X_U/F is smooth proper of dimension n−1 with universal abelian scheme A_U. For p split in E choose w|p: G(Q_p) has the GL_n(F_w) factor used for Drinfeld level, including when F_w/Q_p is ramified. The other split factors have the étale level structures of §5.2. Form A_U^m over X_U for m≥0.

Assume also: The positivity, determinant, polarization and level conditions are those of the chosen PEL datum, not those of the quasi-split signature (n,n) datum. Choose integral orders and sufficiently small levels as in §5.2; Drinfeld models require the distinguished split factor.

API:

- `CompactPEL.dimension`: dim X_U=n−1; the universal abelian scheme has the relative dimension prescribed by this PEL representation.
- `CompactPEL.levelPullback`: Level inclusions give finite étale maps on generic fibres, with compatible universal abelian schemes.
- `CompactPEL.kugaPower`: A_U^0=X_U and A_U^(m+1)=A_U^m×_{X_U}A_U.
- `CompactPEL.drinfeldFactor`: At w the integral level structure is the Drinfeld structure on the one-dimensional O_{F_w}-Barsotti–Tate factor.

Tests: `CompactPEL.zeroPower` — m=0 gives X_U, not an empty scheme; `CompactPEL.signatureDimension` — n=3 gives a proper surface of dimension 2; the signature (3,3) datum has complex dimension 9[F⁺:Q]; `CompactPEL.ramifiedFactor` — An unramified-only local datum cannot satisfy the API for ramified F_w.

Requires: `PELModuli:M0`; `PELModuli:M4`; `IgusaVarietiesAndTorsionConcentration:IG.0/drinfeld-level-newton-strata`.

Sources: [Shin](#source-shin), Lemma 5.1 and §5.2, pp. 30–34.

<a id="kuga-sato-coefficient-projector"></a>

**The corrected Kuga–Sato coefficient projector.** For an irreducible algebraic ξ of the compact similitude group choose the TY §2 integers m_ξ,t_ξ and rational algebraic correspondence ε_ξ realizing L_ξ inside R^{m_ξ}(A_U^{m_ξ}/X_U)(t_ξ). For N≥2 let ε(m,N)=∏_{x=1}^m ∏_{0≤y≤2[F⁺:Q]n², y≠1}([N]_x−N^y)/(N−N^y), and set a_ξ=ε_ξ ε(m_ξ,N)^{2n−1}. Its action on global cohomology is idempotent and realizes the coefficient cohomology in the shifted degree. The exponent 2n−1 removes the Leray-filtration error: ε(m,N) alone is only the relative-degree selector.

Assume also: Q-coefficients; N≥2; sufficiently small U; the chosen realization of ξ and its central exponent a₀, CM type and Tate twist are retained.

API:

- `CoefficientProjector.idempotent`: a_ξ²=a_ξ on each global cohomology group after the 2n−1 correction.
- `CoefficientProjector.relativeDegree`: The multiplier correspondence annihilates relative degrees other than m_ξ.
- `CoefficientProjector.centralTwist`: Replacing ξ by ξ⊗ν^t changes the retained central character and Tate normalization according to the coefficient dictionary.
- `CoefficientProjector.level`: a_ξ commutes with level pullback and the correspondences defining Hecke actions.

Tests: `CoefficientProjector.denominator` — For N=2, y=0, the denominator is 1; for y=2 it is −2; `CoefficientProjector.degreeSelector` — On H⁰ of one abelian factor the y=0 term annihilates the class; on H¹ every term acts as 1; `CoefficientProjector.zeroPower` — For ξ=1 with m_ξ=t_ξ=0 and ε_ξ=1, the empty product is the identity and realizes the trivial coefficient. The condition m_ξ=0 alone does not exclude a nontrivial Tate twist; `CoefficientProjector.lerayCorrection` — The global selector uses the power 2n−1 even though its associated-graded selector is idempotent.

Requires: [AG2.1a: compact unitary PEL instance](#compact-shin-pel-instance); [AG2.0: similitude character in a compact coefficient system](#unitary-similitude-central-character-dictionary); `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`; `AutomorphicBundles:B2`; `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-2-young-symmetrizers`; `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality`.

Sources: [TY](#source-ty), §2, p. 12, definition of a_ξ.

<a id="coefficient-projector-degree-identity"></a>

**Cohomology of the coefficient projector.** For every j, a_ξ H^j(A_U^{m_ξ}×_F F̄,Q̄_ℓ(t_ξ)) is canonically H^{j−m_ξ}(X_U×_F F̄,L_ξ) if j≥m_ξ, and zero otherwise. The identity is equivariant for Gal(F̄/F), level transitions and prime-to-level Hecke correspondences.

Assume also: Use the corrected a_ξ and the selected algebraic realization; ℓ invertible on the generic fibre.

Requires: [AG2.1a: corrected Kuga–Sato coefficient projector](#kuga-sato-coefficient-projector); `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [TY](#source-ty), §2, cohomology identity after a_ξ, p. 12.

<a id="finite-level-coefficient-cohomology"></a>

**Finite-level coefficient cohomology.** Define H^k_U(ξ)=H^k_et(X_U×_F F̄,L_ξ) as the corrected Kuga–Sato summand in degree k+m_ξ with twist t_ξ. Set H^k(ξ)=colim_U H^k_U(ξ) under pullback. This is a smooth admissible G(A_f)-representation with commuting continuous Gal(F̄/F)-action on finite-level invariants. Define H(ξ)=Σ_k(−1)^k[H^k(ξ)] only in the Grothendieck group, retaining the graded H^k separately.

Assume also: Small levels; ξ irreducible algebraic; Q̄_ℓ coefficients obtained from a finite ℓ-adic coefficient field; the finite-level étale finiteness and descent contracts.

API:

- `CoefficientCohomology.level`: Compatible level pullbacks compose and commute with Galois.
- `CoefficientCohomology.hecke`: A double-coset correspondence acts by finite pullback followed by proper pushforward.
- `CoefficientCohomology.invariants`: Small-level invariants identify with the finite-level cohomology in characteristic zero.
- `CoefficientCohomology.alternating`: The alternating sum is a Grothendieck class and is not declared an actual representation.

Tests: `CoefficientCohomology.outsideRange` — Degrees below 0 or above 2(n−1) vanish; `CoefficientCohomology.trivialCoefficient` — ξ=1 gives the usual étale cohomology of X_U; `CoefficientCohomology.virtualCancellation` — A nonzero class appearing in two adjacent degrees cancels in H(ξ) but remains in both graded groups.

Requires: [AG2.1a: compact unitary PEL instance](#compact-shin-pel-instance); [AG2.1a: projector degree identity](#coefficient-projector-degree-identity); `EtaleDualityAndPerverseSheaves:EDC.2`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Sources: [Shin](#source-shin), §5.2, definitions of H^k and H, pp. 33–34.

<a id="hecke-galois-projector-commutation"></a>

**Commutation of the geometric actions.** On H^k_U(ξ), the Galois action commutes with every rational Hecke correspondence that is defined over F and with a_ξ. Passage between levels preserves this commutation and the Tate twist. In particular the cohomology is a joint module, not just a list of unrelated eigenvalues.

Assume also: Correspondences and the selected coefficient projector are defined over the reflex field.

Requires: [AG2.1a: Finite-level coefficient cohomology](#finite-level-coefficient-cohomology); [AG2.1a: corrected Kuga–Sato coefficient projector](#kuga-sato-coefficient-projector); `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [TY](#source-ty), §2, action following the cohomology identity, p. 12.

<a id="finite-continuous-geometric-galois-action"></a>

**Finite continuous geometric Galois actions.** Every H^k_U(ξ) is finite-dimensional over a finite extension of Q_ℓ and has continuous Galois action; after scalar extension it is unramified away from finitely many places. For almost all y∤ℓ its Frobenius eigenvalues are algebraic and pure of weight k+w(ξ). These statements apply to actual finite-level summands, independently of local Langlands.

Assume also: Smooth proper X_U and the abelian-power projector; coefficient field of definition fixed.

Requires: [AG2.1a: Finite-level coefficient cohomology](#finite-level-coefficient-cohomology); [AG2.1a: geometric commutation](#hecke-galois-projector-commutation); `EtaleDualityAndPerverseSheaves:EDC.2`; `DeligneWeightsAndPurity:DWP.7`.

Sources: [Shin](#source-shin), Proposition 5.3(ii)–(iii), pp. 34–35.

<a id="automorphic-multiplicity-spaces"></a>

**Automorphic multiplicity spaces in the tower.** For π^∞ irreducible admissible occurring in H^k(ξ), let R^k_{ξ,ℓ}(π^∞)=Hom_{G(A_f)}(π^∞,H^k(ξ)), with its commuting Galois action. In the characteristic-zero discrete automorphic decomposition of the compact tower, H^k(ξ)=⊕_{π∞}π^∞⊗R^k_{ξ,ℓ}(π^∞). R^k is finite-dimensional; R_{ξ,ℓ}(π∞)=Σ_k(−1)^k[R^k] remains a virtual representation.

Assume also: Compact quotient and the semisimple automorphic decomposition at the chosen central character; π∞ has finite-level invariants.

API:

- `MultiplicitySpace.evaluation`: The evaluation map π∞⊗Hom(π∞,H^k)→the π∞-isotypic summand is an isomorphism under the discrete semisimple decomposition.
- `MultiplicitySpace.galois`: Galois acts by postcomposition on Hom and commutes with evaluation.
- `MultiplicitySpace.finite`: Choose a small level with nonzero π∞ invariants to bound dim R^k by finite-level cohomology.
- `MultiplicitySpace.virtual`: The virtual multiplicity is Σ_k(−1)^k[R^k].

Tests: `MultiplicitySpace.absent` — If π∞ is absent then every R^k is zero; `MultiplicitySpace.double` — Two copies of π∞ give a two-dimensional multiplicity space; `MultiplicitySpace.cancellation` — Equal multiplicity spaces in adjacent degrees give zero virtual class with nonzero actual spaces.

Requires: [AG2.1a: Finite-level coefficient cohomology](#finite-level-coefficient-cohomology); [AG2.1a: geometric commutation](#hecke-galois-projector-commutation); [AG2.1a: geometric Galois actions](#finite-continuous-geometric-galois-action); `AutomorphicFormsOnReductiveGroups:AF.1`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-1-simple-modules-schur-and-isotypic-components`.

Sources: [Shin](#source-shin), §5.2 decomposition (5.5), p. 34.

<a id="raw-fixed-point-trace-identity"></a>

**The raw geometric fixed-point trace identity.** For a good reduction prime p≠ℓ and sufficiently large Frobenius power, the alternating trace of a Hecke correspondence times geometric Frobenius on H^k_U(ξ) equals the fixed-point sum with the coefficient trace. When expressed as a sum over admissible Kottwitz triples, the local orbital integrals, volumes and effectivity multiplicities belong to the compact PEL instance. No local Langlands parameter or automorphic Galois representation occurs in this identity.

Assume also: Correspondence and Frobenius power satisfy the Fujiwara/Varshavsky fixed-point hypotheses; good integral model and all coefficient factors fixed.

Requires: [AG2.1a: Finite-level coefficient cohomology](#finite-level-coefficient-cohomology); [AG2.1a: geometric commutation](#hecke-galois-projector-commutation); `PELModuli:M4`; `EtaleDualityAndPerverseSheaves:EDC.8`; `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`.

Sources: [Shin-Igusa](#source-shin-igusa), §4.2, Definition 4.2, pp. 13–14; §4.4, Theorem 4.4, p. 15.

<a id="raw-nearby-cycle-traces"></a>

**Raw nearby-cycle and stratum traces.** For the compact Drinfeld model at w|p≠ℓ, identify the generic-fibre alternating trace with the trace on the special fibre with RΨL_ξ. Decompose by Newton/Drinfeld strata and the compatible Igusa level covers before applying any local Langlands correspondence. Retain the nearby-cycle monodromy operator and its filtration rather than replacing it by zero.

Assume also: Proper integral model; the actual ramified O_{F_w} charts and coefficient projector; p split in E.

Requires: [AG2.1a: compact unitary PEL instance](#compact-shin-pel-instance); [AG2.1a: Finite-level coefficient cohomology](#finite-level-coefficient-cohomology); [AG2.1a: raw fixed-point traces](#raw-fixed-point-trace-identity); `IgusaVarietiesAndTorsionConcentration:IG.1/harris-taylor-igusa-varieties`; `LefschetzPencilsAndVanishingCycles:LPV.0`; `LefschetzPencilsAndVanishingCycles:LPV.1`.

Sources: [Shin](#source-shin), Proposition 5.2 and §5.2, pp. 33–34.

## AG2.1b. From trace identities to actual Galois constituents

Combine the raw geometric traces with Igusa stabilization and Mantovan’s formula. Weight separation turns alternating multiplicity spaces into an actual middle-degree space. Dividing the scalar multiplicity requires multiplicity divisibility for each constituent, rather than divisibility of total dimension.

The concentration argument requires the selected-constituent weight bounds used in Shin Corollary 6.5, including its Harris–Taylor p.207 input. Geometric purity and a virtual rank equality alone are insufficient. Removing C_G requires divisibility of every irreducible Galois multiplicity, with the adjusted assumptions of Shin Remark 6.9 and the argument of Harris–Taylor Proposition VII.1.8. The labelled geometric de Rham dimensions and independence of τ are part of this input.

<a id="compact-global-mantovan-formula"></a>

**The compact global Mantovan formula.** For every Newton class b of the compact datum, define Mant_{b,μ}(ρ) by the colimit over Rapoport–Zink levels of the alternating Ext^i_{J_b(Q_p)}(H^j_c(M_{b,μ}),ρ), with the source’s dimension twist (−D) and sign (−1)^{i+j}. Shin Proposition 5.2 gives [H(Sh,L_ξ)]=Σ_b Mant_{b,μ}([H_c(Ig_b,L_ξ)]) as a class with commuting prime-to-p Hecke and Weil actions. The split local factors tensor as in (5.6).

Assume also: Mantovan’s cohomology, smooth derived Ext, towers and actions for the chosen compact Drinfeld model; the dimension twist is included.

Requires: [AG2.1a: Raw nearby-cycle and stratum traces](#raw-nearby-cycle-traces); `IgusaVarietiesAndTorsionConcentration:IG.1/harris-taylor-igusa-varieties`; `HeckeStacksAndLocalShtukas:HS3`; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`; `IgusaVarietiesAndTorsionConcentration:IG.1`.

Sources: [Shin](#source-shin), §2.2, Mantovan functor (2.1), p. 9; Proposition 5.2, p. 34.

<a id="shin-st-end-igusa-computation"></a>

**Shin’s stable and endoscopic Igusa computation.** Under Shin §6.1, n≥3 is odd, Π=ψ⊗Π₁ is θ-stable, generic Ξ-cohomological, and Ram_Q(Π) lies in Spl_{F/F⁺,Q}; the finite set S also contains the ramification of F and the auxiliary odd character ϖ. In Case ST, Π₁ is cuspidal. In Case END, m₁>m₂>0, m₁+m₂=n, Π is transferred from ψ_H⊗Π₁⊗Π₂, each Π_i is conjugate-self-dual cohomological cuspidal and the central-character condition §6.1(ii) holds. Set C_G=|ker¹(Q,G)|τ(G). Theorem 6.1 computes BC(H_c(Ig_b,L_ξ){Π^S}) as C_G e₀[Π^{∞,p}]Red_n^b(π_p) in ST and (C_G/2)[Π^{∞,p}](e₁Red_n^b(π_p)+e₂Red_{m₁,m₂}^b(π_H,p)) in END, with e_i∈{±1} independent of b and the §3.6 transfer factors.

Assume also: All displayed §6.1 datum, ramification, central-character and infinity hypotheses; the END blocks and parity character are fixed.

Requires: [AG2.1b: compact global Mantovan formula](#compact-global-mantovan-formula); [AG2.0: similitude character in a compact coefficient system](#unitary-similitude-central-character-dictionary); `EndoscopicTransferAndUnitaryTraceComparison:ET.5`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.

Sources: [Shin](#source-shin), §6.1 and Theorem 6.1, pp. 41–46.

<a id="virtual-weil-constituent-comparison"></a>

**The virtual Weil constituent comparison.** Under the ST/END hypotheses, Theorem 6.4 identifies the base-changed alternating Π-part with C_G times the selected local Weil constituent, with the GL₁ character. In ST it is e₀ χ₀⊗L_n(Π₁,w). In END it is e₁ χ₀⊗L_{m₁}(Π_{M,1,w})|·|^(−m₂/2) if e₁=e₂, and e₁ χ₀⊗L_{m₂}(Π_{M,2,w})|·|^(−m₁/2) if e₁=−e₂. This equality is in the Weil Grothendieck group and has not yet removed alternating degrees or divided an actual representation by C_G.

Assume also: w over a rational prime split in E, w∤ℓ; exact local transfer and the normalized Mantovan formula.

Requires: [AG2.1b: stable/endoscopic Igusa traces](#shin-st-end-igusa-computation); [AG2.1b: compact global Mantovan formula](#compact-global-mantovan-formula); `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`; `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

Sources: [Shin](#source-shin), Propositions 2.2–2.3, pp. 10–11; Theorem 6.4, pp. 46–47.

<a id="weight-separation-middle-degree"></a>

**Weight separation into the middle degree.** For π∞ in the ST/END Π-part, R^k_{ξ,ℓ}(π∞)=0 for k≠n−1. Thus the alternating multiplicity is (−1)^(n−1)[R^{n−1}], an actual representation up to the explicit sign. In particular e₀=(−1)^(n−1) in ST and e₁=(−1)^(n−1) in END.

Assume also: The virtual Weil formula, geometric purity of every actual degree k, and the selected constituent purity/temperedness argument of Shin Corollary 6.5; no equality of virtual dimensions is used as cancellation.

Requires: [AG2.1b: virtual Weil constituent comparison](#virtual-weil-constituent-comparison); [AG2.1a: geometric Galois actions](#finite-continuous-geometric-galois-action); [AG2.1a: multiplicity spaces](#automorphic-multiplicity-spaces); `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`; `DeligneWeightsAndPurity:DWP.0`.

Sources: [Shin](#source-shin), Corollary 6.5(i)–(ii) and proof, pp. 47–49.

<a id="archimedean-packet-multiplicity"></a>

**The archimedean packet multiplicity.** Under ST/END, the sum of discrete multiplicities at the ith relevant cohomological archimedean packet member is τ(G) for all i in ST; in END it is τ(G) for i≤m₁ if e₁=e₂, or i>m₁ if e₁=−e₂, and zero for the other indices. These are the multiplicities of Shin Corollary 6.5(iv), compatible with the ξ highest-weight partition W^1_κ⊔W^2_κ.

Assume also: The exact cohomological packet and signs of §3.6/§6.1, with middle-degree concentration.

Requires: [AG2.1b: middle-degree concentration](#weight-separation-middle-degree); [AG2.1b: stable/endoscopic Igusa traces](#shin-st-end-igusa-computation); [AG2.1a: multiplicity spaces](#automorphic-multiplicity-spaces); `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`; `AutomorphicFormsOnReductiveGroups:AF.1`.

Sources: [Shin](#source-shin), Corollary 6.5(iv), pp. 47–48.

<a id="actual-galois-constituent-from-cohomology"></a>

**The actual Galois constituent of cohomology.** For the selected ST/END Π-part, semisimplify the actual middle-degree Galois multiplicity space to R̃. The source proves that R̃ is C_G copies of a continuous semisimple representation R̃₀, and then removes the GL₁ character ψ by class field theory. The resulting R′_ℓ(Π) has rank n in ST, m₁ in END with e₁=e₂, or m₂ with e₁=−e₂; it is independent, up to isomorphism, of τ and ψ. At the source’s split primes its Weil Grothendieck class is exactly (6.31), with the selected half-dimensional norm twist.

Assume also: Middle-degree concentration, packet multiplicity and the actual multiplicity divisibility argument in Shin Corollary 6.8/Remark 6.9; de Rham comparison for the geometric summand is used to obtain the distinct labelled dimensions.

API:

- `ActualConstituent.rank`: dim R′ equals the selected n, m₁ or m₂.
- `ActualConstituent.copies`: Before removing ψ, R̃≅R̃₀^{⊕C_G} as Galois representations.
- `ActualConstituent.independent`: Changing τ or the auxiliary ψ produces an isomorphic corrected constituent.
- `ActualConstituent.goodWeil`: At source split primes recover the selected class (6.31), including the norm twist.

Tests: `ActualConstituent.stableRank` — Case ST n=3 gives rank 3 after removing C_G copies; `ActualConstituent.endRank` — For n=5,m₁=3,m₂=2 the two sign cases give rank 3 and 2 respectively; `ActualConstituent.rankOnly` — A semisimple rank-4 representation with irreducible multiplicities 1 and 3 cannot be divided into two copies merely because 2 divides 4.

Requires: [AG2.1b: middle-degree concentration](#weight-separation-middle-degree); [AG2.1b: archimedean multiplicity](#archimedean-packet-multiplicity); [AG2.1a: multiplicity spaces](#automorphic-multiplicity-spaces); [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`; `PadicHodgeTheory:R06.5`.

Sources: [Shin](#source-shin), Corollary 6.8 and Remark 6.9, p. 49.

## AG2.2. Polarization twists, base change and discrete sums

The geometric theorem initially has Shin’s weight and field restrictions. Algebraic twisting passes from essential polarization to unitary type. Assemble discrete parameters only from supplied constituent representations, retaining every block multiplicity and parity/norm correction. The unrestricted constituents needed here are constructed in AG2.3.

The algebraic-character construction requires the global ψψ^c prescription and its infinity/finite parity compatibility (the CHT08 Lemma 4.1.4 input to BLGGT's twisting proof); arbitrary local square roots cannot simply be extended globally. The dedicated GSp₄ direction must supply GSp₄-valuedness and the Iwahori, Klingen, paraspherical and inertia cases of CG Proposition 6.8(1)–(2),(5), and Pilloni Theorem 5.1.7.1(2),(5), before their comparisons can be imported.

<a id="shin-regular-geometric-existence"></a>

**Geometric existence in the Shin-regular range.** For CM F and regular algebraic conjugate-self-dual cuspidal π of GL_m(A_F), m≥2, suppose m is odd, or for even m the algebraic highest weight has a_{σ,k}>a_{σ,k+1} for some embedding σ and odd k. Under the technical §7.1 conditions F=EF⁺, [F⁺:Q]≥2 and all ramification of F and π over rational primes split in F/F⁺, the compact construction gives a continuous semisimple rank-m r attached to π. For odd m use ST with n=m; for even m use END with n=m+1 and an auxiliary character chosen so that e₁=e₂, then remove its parity and norm corrections. This existence statement asserts good-place attachment and rank; the comparison and coefficient-prime conclusions are separate comparison targets.

Assume also: Shin §7.1 technical datum; m=1 is supplied by the character dictionary; slight regularity for even m is retained.

Requires: [AG2.1b: actual constituents](#actual-galois-constituent-from-cohomology); [AG2.0: attachment operations](#attachment-twist-dual-and-conjugation); [AG2.0: similitude character in a compact coefficient system](#unitary-similitude-central-character-dictionary); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

Sources: [Shin](#source-shin), §7.1, Lemmas 7.1–7.3 and Proposition 7.4, pp. 50–53.

<a id="algebraic-character-polarization-twist"></a>

**Twisting an essentially self-dual form into unitary type.** For a CM regular algebraic cuspidal polarized pair (π,χ), choose an algebraic Hecke character ψ with ψψ^c=χ∘N_{F/F⁺} in the source’s compatible infinity-type and parity convention. Then π⊗ψ^−1∘det is conjugate self-dual. Given a good-place attached representation r₀ for the twisted form, r=r₀⊗r(ψ) is attached to π. A change of ψ changes the construction only up to the unique good-place attached isomorphism. The existence of ψ uses the idele-character extension compatibility, not a pointwise square root of χ.

Assume also: Compatible algebraic infinity types and finite-order parity, with the total-oddness parity convention above; the source extension lemma applies.

Requires: [AG2.0: polarized pairs](#polarized-automorphic-representation); [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); [AG2.0: attachment operations](#attachment-twist-dual-and-conjugation); `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

Sources: [BLGGT](#source-blggt), Proof of Theorem 2.1.1, p. 34; [CT](#source-ct), Lemma 7.4 and proof, accepted copy pp. 47–48.

<a id="discrete-unitary-galois-assembly"></a>

**Galois assembly for discrete unitary transfer.** For cohomological square-integrable Π on HLTT G_n(A), write 2n=Σ_i m_i n_i and BC(Π)_v=⊞_i⊞_{j=0}^{n_i−1} π̃_{i,v}|det|^{(n_i−1)/2−j} at the source’s good places, where π̃_i is conjugate-self-dual cuspidal and π_i=π̃_i||det||^{(m_i+n_i−1)/2} is cohomological. Given normalized rank-m_i attached r_i for π_i, form R(Π)=⊕_i⊕_{j=0}^{n_i−1} r_i⊗ε_ℓ^{−n−j}. Its rank is 2n and its good-place WD semisimplification is rec(BC(Π)_v|det|^{(1−2n)/2}). The input r_i are supplied individually; this assembly does not presume they all lie in the Shin-regular geometric range.

Assume also: Discrete transfer/classification in HLTT Proposition 1.2; actual rank-m_i normalized representations supplied; good places q≠ℓ with q split in F₀ or F and Π unramified above q.

API:

- `DiscreteAssembly.rank`: rank R=Σ_i m_i n_i=2n.
- `DiscreteAssembly.goodPolynomial`: The good Frobenius polynomial is the product of the scalar-twisted polynomials of r_i.
- `DiscreteAssembly.continuous`: Finite sums of continuous finite-field representations are continuous and semisimple.
- `DiscreteAssembly.choice`: Replacing each supplied r_i by an isomorphic attached representative gives an isomorphic R.

Tests: `DiscreteAssembly.singleBlock` — n=1,m₁=1,n₁=2 gives r₁ε^−1⊕r₁ε^−2; `DiscreteAssembly.cuspidal` — n₁=1,m₁=2n gives r₁ε^−n, tracking the cohomological twist on π₁; `DiscreteAssembly.rank` — Taking only one copy of each r_i gives the wrong rank when some n_i>1.

Requires: [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); [AG2.0: attachment operations](#attachment-twist-dual-and-conjugation); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`; `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

Sources: [HLTT](#source-hltt), Proposition 1.2 and Corollary 1.3, p. 31.

<a id="cs-discrete-polarization-normalization"></a>

**The Caraiani–Scholze discrete normalization.** For an irreducible admissible Π^S in BC^S[H_c(I_Mant^b,Q̄_ℓ)]_Sur of CS Corollary 5.5.5, Corollary 5.5.2 chooses the specified transfer from G_{n₁,n₂}, with Π⃗=ψ⊗Π₁⊗Π₂ and n₁+n₂=N. Let r_i be the representation for the L-algebraic parameter Π_i|det|^{(1−n_i)/2}. The character |det|^{(n_i−N)/2}(ϖ∘N_{F/𝒦})^{ε(N−n_i)} is L-algebraic, with Galois character ε_i. Then r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i has rank N, is unramified outside the places above S∪{ℓ}, and at v above q∈Spl_{𝒦/ℚ} outside S∪{ℓ} has the displayed integral Hecke polynomial. The parity ε takes values 0 or 1 and ϖ has odd infinity exponent. This is the selected two-block cohomological transfer, not an assertion about every abstract discrete GL_N representation. The full local normalization at the specified split places is the separate Remark 5.5.6 comparison contract.

Assume also: The exact cohomological surjection and transferred packet of Corollaries 5.5.2/5.5.5; published numbering; specified imaginary quadratic 𝒦, source splitting set, n₁+n₂=N and odd ϖ.

Requires: [AG2.2: Galois assembly for discrete unitary transfer](#discrete-unitary-galois-assembly); [AG2.0: attachment operations](#attachment-twist-dual-and-conjugation); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`; [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris).

Sources: [CS](#source-cs), Corollary 5.5.5, pp. 745–746.

<a id="attachment-under-solvable-base-change"></a>

**Attachment under cuspidal solvable base change.** If F′/F is solvable, π′=BC_{F′/F}(π) is cuspidal regular algebraic, and r is attached to π, then (r|_{G_{F′}})^ss is attached to π′. If another semisimple representation is attached to π′, good Frobenius polynomials identify it with this restriction. This is a specialization of automorphic base change and Galois restriction, distinct from the effective descent theorem used to construct r over F.

Assume also: Existence and good-place Satake compatibility of the specified solvable base change; cuspidality is assumed or ensured by avoiding finite self-twist fields.

Requires: [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [CH](#source-ch), §3.1, proof of Theorem 3.1.2, p. 9.

## AG2.3. Definite families, patching and arbitrary regularity

A definite-unitary family interpolates determinant laws on a strongly regular classical locus. Finite-slope specialization, S-general solvable extensions and effective patching remove the initial restrictions. Polarization and its sign follow for the constructed representation. The common-field target additionally imports the regular Hodge theorem from AG2.6, rather than presuming trace-field descent.

Strongly regular density needs the definite-unitary classicality and density theorem recalled in CH, not only an abstract Fredholm construction. The inertial/monodromy family comparison in CH Theorem 2.3 uses the bounded local-type specialization argument of Bellaïche–Chenevier §6.5. It is an independent family interface and cannot be replaced by the later Varma nonselfdual theorem.

<a id="polarized-construction-inputs-shin-and-chenevier-harris"></a>

**Arbitrary regular conjugate-self-dual existence.** For any CM F, regular algebraic conjugate-self-dual cuspidal π on GL_n(A_F), prime ℓ and coefficient isomorphism ι, there is a unique-up-to-isomorphism continuous semisimple rank-n r attached at good places. No odd-rank, slight-regularity, finite-place square-integrability, finite-slope, unramified-field or imaginary-quadratic-subfield hypothesis remains. CH Theorem 3.2.3 also proves domination away from ℓ and the de Rham/crystalline/semistable assertions, but those exports are assigned to AG2.5 and AG2.6. For an essentially polarized form apply the algebraic-character twist and undo it.

Assume also: Regular algebraic cuspidal and conjugate self-dual; n=1 comes from class field theory. The GSp₄ case requires the dedicated construction.

Requires: [AG2.3: solvable-index induction](#solvable-index-induction); [AG2.2: Twisting an essentially self-dual form into unitary type](#algebraic-character-polarization-twist); [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); [AG2.0: good-place attachment](#galois-representation-attached-at-good-places).

Sources: [CH](#source-ch), Theorem 3.2.3 and proof, pp. 11–12.

<a id="definite-unitary-eigenvariety-instance"></a>

**The definite-unitary eigenvariety instance.** Under CH General Hypotheses 1.1 and all Special Hypotheses 1.2, including Π spherical at nonsplit places (1.2.2), K/F is unramified at finite places and [F:Q] is even. The hermitian V₀ gives a unitary G₀ compact at all real places and quasi-split at finite places. Choose v₀|ℓ split in K and an Iwahori refinement of Π there; fix weights at all other real places, and tame Bernstein components with the prescribed local monodromy bound. Specialize the group-independent finite-slope eigenvariety to overconvergent G₀ forms varying the weights belonging to v₀. The classical Π gives a point x with its good Hecke eigenvalues.

Assume also: General Hypothesis 1.1 and Special Hypotheses 1.2 and 2.2; n even in the interpolation step; a genuine finite-slope refinement at v₀.

API:

- `DefiniteFamily.classicalPoint`: A refined classical Π with the fixed tame/infinity data gives x.
- `DefiniteFamily.fixedWeights`: All labelled weights away from v₀ are fixed in the family.
- `DefiniteFamily.goodEigenvalues`: At x, spherical operators specialize to the good Hecke eigenvalues of Π.
- `DefiniteFamily.tameType`: At tame split places every classical point lies in the prescribed Bernstein component with the source local bound.

Tests: `DefiniteFamily.fixedWeight` — Varying a weight at an embedding not attached to v₀ violates the family contract; `DefiniteFamily.missingRefinement` — An infinite-slope eigensystem does not give a point of a finite-slope chart; `DefiniteFamily.classicalSpecialization` — At a classical point the good Hecke polynomial is the integral polynomial specialized to Π.

Requires: [AG2.0: polarized pairs](#polarized-automorphic-representation); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`; `PadicFamilies:L2a/linked-banach-families`; `PadicFamilies:L2a/eigenpacket-points`; `LocallyAnalyticDistributions:L4/finite-slope-summands`; `AutomorphicFormsOnReductiveGroups:AF.4`.

Sources: [CH](#source-ch), Lemma 2.1, Hypotheses 2.2 and proof of Theorem 2.3, p. 8.

<a id="strongly-regular-classical-density"></a>

**Density of strongly regular classical points.** In the CH definite-unitary family, classical points whose varied algebraic weights lie sufficiently far in the dominant chamber and satisfy slight regularity are Zariski dense in the required finite-slope charts. They retain the fixed other archimedean weights and tame local data. These points have geometric attached representations from AG2.2 and are sufficient to determine analytic good-place trace functions.

Assume also: The source’s classicality bounds relative to the chosen finite slope and coefficient family; density is asserted on the relevant charts, not on arbitrary eigenvarieties.

Requires: [AG2.3: definite-unitary eigenvariety instance](#definite-unitary-eigenvariety-instance); [AG2.2: Geometric existence in the Shin-regular range](#shin-regular-geometric-existence); `PadicFamilies:L2a/finite-hecke-images`; `LocallyAnalyticDistributions:L4/summand-fredholm-theory`; `AutomorphicFormsOnReductiveGroups:AF.4`.

Sources: [CH](#source-ch), Proof of Theorem 2.3, p. 8; references to Ch Theorems 3.3 and 3.5.

<a id="definite-family-determinant-interpolation"></a>

**Determinant interpolation on the definite family.** The traces of the rank-n geometric attached representations at the dense strongly regular classical points extend to a continuous degree-n determinant on G_{K,S} with values in the reduced affinoid Hecke algebra of each relevant chart. Its good Frobenius characteristic polynomial is the analytic integral Hecke polynomial. At x, specialization and semisimple reconstruction give a continuous rank-n representation r_x over Q̄_ℓ, without an absolute-irreducibility hypothesis on r_x.

Assume also: One common finite ramification set S, reduced affinoid Hecke charts, continuous bounded trace interpolation, characteristic zero so n! is invertible, and finite-field continuity of the specialized semisimple representation.

Requires: [AG2.3: classical density](#strongly-regular-classical-density); [AG2.3: definite-unitary eigenvariety instance](#definite-unitary-eigenvariety-instance); `IntegralHeckeAndGaloisDeterminants:IHG.4`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`; `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

Sources: [CH](#source-ch), Theorem 2.3 and proof, p. 8.

<a id="finite-slope-regular-target-existence"></a>

**Existence at the regular finite-slope target.** Under CH Hypotheses 1.1, 1.2 and 2.2, a regular CSD cuspidal Π has a unique continuous semisimple rank-n good-place attached r, without Hypothesis 1.3. The assertion includes even rank without slight regularity, because it is obtained by specializing the determinant at x, not by identifying Π itself with a geometric middle-degree constituent.

Assume also: A split coefficient place with Iwahori invariants and the technical unramified CM datum of the definite-unitary family. CH §2 takes n even; the odd-rank existence branch comes from the geometric theorem. This is the even-rank finite-slope step of the general construction.

Requires: [AG2.3: family determinant](#definite-family-determinant-interpolation); [AG2.0: good-place attachment](#galois-representation-attached-at-good-places).

Sources: [CH](#source-ch), Theorem 2.3, p. 8.

<a id="s-general-solvable-extension-families"></a>

**The automorphic S-general extension family.** For K/F CM, a finite forbidden set S and auxiliary finite extension M, choose cyclic prime-degree totally real F′/F disjoint from M, splitting the required places outside S and meeting the specified local splitting/ramification conditions. Their composita K′=KF′ give the S-general families used by CH §3.1. Enlarge M to exclude the finitely many self-twist extensions so that BC_{K′/K}(Π) stays cuspidal. S-general means: for every finite M/K and v∉S there is K′ disjoint from M with v split completely.

Assume also: Only compatible prime-degree Grunwald–Wang prescriptions, including real places; no special 2-power case is invoked.

API:

- `SGeneralFamily.disjoint`: Given every finite M, obtain an extension linearly disjoint from M.
- `SGeneralFamily.splitPlace`: Given v∉S, choose that extension with v split completely.
- `SGeneralFamily.cuspidal`: Avoiding the finite self-twist fields preserves cuspidality of base change.

Tests: `SGeneralFamily.quantifier` — An infinite collection all containing one fixed nontrivial extension is not S-general; `SGeneralFamily.split` — At a prescribed split place the local completion of each branch is the original field; `SGeneralFamily.forbidden` — No splitting assertion is made for v∈S unless included in the local prescription.

Requires: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [CH](#source-ch), §3.1 and Lemma 3.2.1, pp. 9–10.

<a id="effective-automorphic-galois-patching"></a>

**Effective Galois patching for automorphic base changes.** For an S-general family K_i/K of cyclic extensions of a fixed prime degree, let r_i be continuous semisimple rank-n representations of G_{K_i}, invariant under Gal(K_i/K), with isomorphic restrictions on every compositum K_iK_j. Sorensen’s effective patching theorem yields a unique continuous semisimple rank-n r of G_K restricting to every r_i. For attached base-change r_i, good Frobenius polynomials establish both invariance and pairwise compatibility and then good-place attachment of r.

Assume also: All S-general quantifiers and all overlap/invariance conditions; actual representations r_i, not only virtual classes or traces.

Requires: [AG2.3: automorphic S-general extension family](#s-general-solvable-extension-families); [AG2.2: Attachment under cuspidal solvable base change](#attachment-under-solvable-base-change); [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); `ArithmeticGaloisRepresentations:R01.5`.

Sources: [CH](#source-ch), §3.1, patching lemma and Theorem 3.1.2, p. 9.

<a id="removal-of-geometric-field-hypotheses"></a>

**Removal of the geometric field hypotheses.** The good-place rank-n representation constructed in the geometric or finite-slope range descends over an arbitrary CM K after choosing S-general base changes that make the real degree even, the CM extension unramified and the necessary coefficient place split while preserving cuspidality. Thus the imaginary-quadratic-subfield, degree and field-ramification assumptions are construction devices rather than final hypotheses.

Assume also: CSD regular cuspidal Π; the local finite-slope or slight-regularity hypothesis needed by the chosen construction is retained at this step.

Requires: [AG2.3: effective patching](#effective-automorphic-galois-patching); [AG2.3: Existence at the regular finite-slope target](#finite-slope-regular-target-existence); [AG2.2: Geometric existence in the Shin-regular range](#shin-regular-geometric-existence); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [CH](#source-ch), Theorem 3.1.2 and proof, p. 9; [CH](#source-ch), Proof of Theorem 3.2.3, first paragraph, p. 11.

<a id="solvable-local-iwahori-reduction"></a>

**Solvable local reduction to Iwahori level.** At a split coefficient place v, choose a finite solvable local extension L/F_v over which the Weil part of rec(Π_u) is unramified; then the automorphic local base change has Iwahori invariants. If Π satisfies P(m+1), CH Corollary 3.2.2 supplies an S-general family of prime-degree global extensions preserving a testing place and cuspidality, on which the local solvable index drops to m.

Assume also: Local GL_n Langlands and its compatibility with cyclic base change; coefficient place split in K; finite solvable index as defined in CH p. 10.

Requires: [AG2.3: automorphic S-general extension family](#s-general-solvable-extension-families); `EndoscopicTransferAndUnitaryTraceComparison:ET.6`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [CH](#source-ch), Property P(m) and Corollary 3.2.2, p. 10.

<a id="solvable-index-induction"></a>

**Induction removing the finite-slope hypothesis.** For a regular CSD cuspidal Π, induction on its local solvable index P(m) constructs a continuous semisimple good-place attached representation at every coefficient prime. The base m=0 is finite-slope Iwahori existence, after field hypotheses are removed. The successor step constructs representations after each prime-degree extension lowering m and patches them effectively. No finite-slope hypothesis remains on the original Π.

Assume also: Arbitrary coefficient prime; the prime-degree local-global extension family and effective patching.

Requires: [AG2.3: Solvable local reduction to Iwahori level](#solvable-local-iwahori-reduction); [AG2.3: field-hypothesis removal](#removal-of-geometric-field-hypotheses); [AG2.3: effective patching](#effective-automorphic-galois-patching).

Sources: [CH](#source-ch), Proof of Theorem 3.2.3, pp. 11–12.

<a id="automorphic-polarization-and-sign"></a>

**The polarization sign of the constructed system.** For the constructed regular algebraic polarized cuspidal pair (π,χ), r^c≅r∨⊗ε_ℓ^{1−n}r(χ)|_{G_F}. With the total-oddness parity convention every conjugate-self-dual irreducible factor has Bellaïche–Chenevier sign +1, and the representation admits the G7 polarized-extension structure with totally odd multiplier µ=ε_ℓ^{1−n}r(χ). The good-place dual identity alone supplies the self-duality isomorphism; the sign theorem is the independent input needed for the prescribed symmetric polarization.

Assume also: The normalized polarized pair and algebraic twisting character; characteristic-zero semisimple r; irreducible factors fixed by the dual-conjugation operation as in BC Theorem 1.2.

Requires: [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris); [AG2.2: Twisting an essentially self-dual form into unitary type](#algebraic-character-polarization-twist); [AG2.0: attachment operations](#attachment-twist-dual-and-conjugation); [AG2.0: multiplier parity](#sign-of-the-polarization-multiplier); `ArithmeticGaloisRepresentations:G7/polarized-representation`; `ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant`; `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`; `ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations`.

Sources: [BC](#source-bc), §1.3, Theorem 1.2 and Corollary 1.3, p. 1339 (PDF p. 4).

<a id="finite-number-field-of-realization"></a>

**A common finite field of realization in the polarized range.** For the CH polarized π, there is a number field E(π) containing its trace field such that every coefficient-prime representation has a model over E(π)_λ. Obtain two auxiliary good Frobenius polynomials with n distinct roots and distinct residue characteristics, adjoin their roots to the trace field, and use R01.5 rational-eigenvalue descent at a place away from each coefficient prime. This is a field of realization, not an assertion that the minimal trace field itself is sufficient.

Assume also: CH regular de Rham/Hodge–Tate input used by the Serre Zariski-closure argument; uniform good polynomials and their number field; two auxiliary residue characteristics.

Requires: [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris); [AG2.0: Rationality of the good Hecke polynomials](#field-of-rationality); `ArithmeticGaloisRepresentations:R01.5/rational-eigenvalue-descent`; `PadicHodgeTheory:R06.2`; [AG2.6: polarized admissibility](#polarized-branch-de-rham-and-crystalline).

Sources: [CH](#source-ch), Proposition 3.2.5 and proof, p. 12.

## AG2.4. Ordinary boundary cohomology and nonselfdual existence

Use the specific HLTT ordinary boundary instance, its dagger/rigid comparison and Hasse weight changes to construct integral congruences with high-weight classical forms. Spectral sequences identify the boundary Levi term. The determinant limit and two-factor separation construct the nonselfdual representation; coefficient-prime admissibility is a later comparison.

Boundary cohomology below uses the fixed compactification and its transition-map colimit. An intrinsic compactification-independent identification would require a further theorem; HLTT Lemma 6.19's invariants do not imply it. Hasse approximation naturally gives classical comparison quotients. Interpolation therefore requires determinant-law descent through those quotients, with continuity, or a construction of suitable injective witnesses; pointwise Hecke congruences alone do not meet this requirement.

<a id="hltt-construction-of-nonselfdual-systems"></a>

**HLTT existence over arbitrary CM and totally real fields.** For E totally real or CM and π regular algebraic cuspidal on GL_n(A_E), every prime p and coefficient isomorphism ι yield a continuous semisimple rank-n r attached at good places. HLTT Theorem 7.13 constructs it first for F=F₀F⁺ with p split in F₀ and the stated source good primes; Corollary 7.14 removes the auxiliary field restrictions by effective patching and proves unramifiedness and the normalized polynomial at all v|q≠p for rational q where π is unramified above q. No polarization is required; the theorem here asserts neither de Rham admissibility at p nor full monodromy at ramified primes.

Assume also: Regular algebraic cuspidal; geometric Artin and the common integral polynomial convention; n=1 supplied by the algebraic-character construction.

Requires: [AG2.4: HLTT factor separation](#hltt-factor-separation-specialization); [AG2.3: effective patching](#effective-automorphic-galois-patching); [AG2.3: automorphic S-general extension family](#s-general-solvable-extension-families); [AG2.2: Attachment under cuspidal solvable base change](#attachment-under-solvable-base-change); [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character).

Sources: [HLTT](#source-hltt), Theorem 7.13 and Corollary 7.14, pp. 227–228.

<a id="hltt-ordinary-boundary-instance"></a>

**HLTT ordinary boundary geometry.** Fix F=F₀F⁺ with F₀ imaginary quadratic and p split in F₀. For the quasi-split similitude G_n on F^{2n} of signature (n,n), choose HLTT ordinary levels U^p(N₁,N₂), smooth toroidal cone data Σ and the Kuga family A^(m). The minimal compactification carries canonical and subcanonical E_ρ, the ordinary locus and its Hasse section; the ordinary toroidal Kuga model has SNC boundary ∂. Its formal ordinary tube has the dagger structure used in §6.2. Keep the right G_n action, the left GL_m(F) action and their source commutation conventions.

Assume also: The exact integral ordinary/mixed models and toroidal charts of HLTT §§3–5; neat levels and admissible smooth cones; m≥0.

API:

- `HLTTModel.genericFibre`: Minimal/toroidal/Kuga models identify the stipulated generic fibres and levels.
- `HLTTModel.ordinaryDagger`: The ordinary formal tube defines the smooth dagger pair with SNC boundary.
- `HLTTModel.subcanonical`: E_ρ^sub is the boundary-vanishing extension used for cuspidal sections.
- `HLTTModel.refinement`: Admissible cone refinements and level changes give the maps used in the cohomology colimit.

Tests: `HLTTModel.zeroKuga` — m=0 has dimension [F⁺:Q]n²; `HLTTModel.oneKuga` — n=1,m=1 has dimension 3[F⁺:Q]; `HLTTModel.boundaryIdeal` — Canonical sections without the boundary ideal include noncuspidal classes and cannot replace the subcanonical module.

Requires: `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum`; `PELModuli:M4`; `ShimuraCompactifications:C3`; `ShimuraCompactifications:C5`; `AutomorphicBundles:B3`; `AdicSpacesPartII:F1/dagger-snc-divisor`.

Sources: [HLTT](#source-hltt), §§3–5 and Appendix A.1, pp. 229–234.

<a id="boundary-support-dagger-cohomology"></a>

**Dagger cohomology with boundary support.** For each fixed ordinary toroidal Kuga pair (A_Σ^†,∂), define H^i_{c−∂}(A_Σ^ord)=H^i(A_Σ^†,I_∂Ω^•(log∂)), then form the HLTT colimit over levels and admissible Σ with its transition maps. The complex restricts to the ordinary de Rham complex away from ∂. This definition is relative to the selected compactification; no intrinsic compactification-independent identification is asserted.

Assume also: Smooth dagger SNC pair from the exact HLTT model and compatible level/refinement morphisms.

API:

- `BoundaryCohomology.complex`: Its complex is I_∂Ω^•(log∂), with the de Rham differential.
- `BoundaryCohomology.emptyBoundary`: If ∂ is empty the complex is Ω^•.
- `BoundaryCohomology.transition`: Level/refinement morphisms induce compatible maps used by the directed colimit.
- `BoundaryCohomology.groupAction`: The source ordinary adelic group acts through these transition correspondences.

Tests: `BoundaryCohomology.localIdeal` — For ∂=(t=0), the degree-zero term is tO^†, not O^†; `BoundaryCohomology.empty` — With ∂=∅ recover ordinary dagger de Rham cohomology; `BoundaryCohomology.support` — Dropping I_∂ gives logarithmic cohomology with different boundary classes.

Requires: [AG2.4: HLTT ordinary boundary geometry](#hltt-ordinary-boundary-instance); `AdicSpacesPartII:F1/compact-support-log-complex`; `AdicSpacesPartII:F1/log-de-rham-complex`.

Sources: [HLTT](#source-hltt), §6.5 definition and Lemma 6.19, pp. 218–219.

<a id="hltt-functorial-dagger-rigid-comparison"></a>

**Functorial comparison of HLTT tubes with rigid cohomology.** For smooth quasi-projective Y/O_K in HLTT Lemma 6.8, H^i_rig(Y_s/K)≅H^i(Y^†,Ω^•). The isomorphism is functorial under the actual morphisms of smooth models used for boundary strata, Hecke maps and Frobenius lifts. In particular the ordinary lift ς_p corresponds to rigid Frobenius because its special-fibre map is Frobenius.

Assume also: The proper formal embeddings and strict-neighborhood choices in GK Theorem 5.1 and HLTT Lemma 6.8; this is not an arbitrary rigid-space comparison.

Requires: [AG2.4: HLTT ordinary boundary geometry](#hltt-ordinary-boundary-instance); `PadicDifferentialEquationsAndRigidCohomology:RD.4`; `AdicSpacesPartII:F1/log-de-rham-complex`.

Sources: [HLTT](#source-hltt), Lemma 6.8 and bracketed functoriality proof, pp. 201–202; [GK](#source-gk), Theorem 5.1 and proof, §5, pp.23–24.

<a id="hltt-frobenius-trace-normalization"></a>

**HLTT Frobenius and trace normalization.** On H^i_{c−∂}(A_Σ^ord), the pullback ς_p and trace trF commute with the ordinary adelic action and satisfy trF∘ς_p=p^{n(n+2m)[F⁺:Q]} id. On the ordinary minimal cusp-section module the normalized trace is the source controlling operator, with the explicit coefficient factor p^{mn[F:Q]} of Proposition 6.15: on a graded E_ρ term the Kuga trace is p^{mn[F:Q]} times the cusp-section trace. Thus section slope bound a gives Kuga slope bound a+mn[F:Q] in Corollary 6.17; conversely Kuga bound a corresponds to section bound a−mn[F:Q]. This distinguishes geometric Frobenius pullback from its finite-étale trace.

Assume also: HLTT ordinary Frobenius quotient, dagger finite-étale trace and its boundary extension; characteristic zero coefficients.

Requires: [AG2.4: Dagger cohomology with boundary support](#boundary-support-dagger-cohomology); [AG2.4: Functorial comparison of HLTT tubes with rigid cohomology](#hltt-functorial-dagger-rigid-comparison); `AdicSpacesPartII:F1/dagger-finite-etale-trace`.

Sources: [HLTT](#source-hltt), Proposition 6.15 and Corollary 6.17; §6.5 before Lemma 6.19, pp. 215–218.

<a id="ordinary-cusp-finite-slope-pieces"></a>

**Finite slope cusp sections on the ordinary tube.** For each algebraic ρ and slope bound a, H⁰(X^ord,min,†,E_ρ^sub)_{≤a} is an admissible ordinary adelic module; at each fixed small level it is finite-dimensional. The completely continuous normalized trF acts on Banach strict neighborhoods and the finite-slope summand is unchanged upon shrinking through the source compatible neighborhoods. Its tower embeds in the ordinary formal-section space H⁰(X^ord,min,E_ρ^ord,sub)⊗Q_p.

Assume also: HLTT Lemmas 6.6 and 6.10–6.12, compact restriction maps and exact linked neighborhood data; the slope is measured for the normalized source trace.

Requires: [AG2.4: HLTT ordinary boundary geometry](#hltt-ordinary-boundary-instance); [AG2.4: Frobenius/trace normalization](#hltt-frobenius-trace-normalization); `LocallyAnalyticDistributions:L4/finite-slope-summands`; `LocallyAnalyticDistributions:L4/summand-fredholm-theory`; `PadicFamilies:L2a/linked-banach-families`.

Sources: [HLTT](#source-hltt), Lemmas 6.10–6.12 and Corollary 6.13, pp. 209–215.

<a id="hasse-weight-changing-congruence"></a>

**Hasse weight-changing congruences.** For M≥1 and any lower bound r, multiplication/division by the lifted Hasse section gives the Hecke-equivariant surjection ⊕_{j≥r} H⁰(X^min,E_ρ^sub⊗ω^{j(p−1)p^{M−1}})→H⁰(X^ord,min,E_ρ^sub⊗Z/p^M), f↦f/Hasse_M^j. Consequently a finite collection of ordinary sections modulo p^M admits lifts in finitely many sufficiently high classical weights; one common weight bound and modulus controls that finite collection.

Assume also: Integral E_ρ lattice and HLTT ordinary minimal model; ample ω and the lifted Hasse section; all relevant level/action normalizations.

Requires: [AG2.4: HLTT ordinary boundary geometry](#hltt-ordinary-boundary-instance); `AutomorphicBundles:B3`; `ShimuraCompactifications:C5`.

Sources: [HLTT](#source-hltt), Lemma 6.1 and proof, pp. 192–195.

<a id="classical-cusp-galois-type"></a>

**Galois type of sufficiently high classical cusp forms.** For a fixed algebraic ρ, sufficiently large determinant twists satisfying −2n≥(b_{τ,1}−t)+(b_{τc,1}−t) put the classical cuspidal G_n eigensystems in the discrete cohomological range of HLTT Lemma 6.2. Through constituent existence in AG2.3 and the discrete assembly they have continuous semisimple rank-2n representations with the normalized good polynomials and one fixed tame ramification set determined by the fixed level and p.

Assume also: The high-weight inequality and fixed level; all discrete constituent algebraic twists are retained; no torsion Hecke existence is an input.

Requires: [AG2.4: Hasse weight-changing congruences](#hasse-weight-changing-congruence); [AG2.2: Galois assembly for discrete unitary transfer](#discrete-unitary-galois-assembly); [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [HLTT](#source-hltt), Lemma 6.2 and Corollaries 6.3–6.4, pp. 195–197.

<a id="uniform-integral-hecke-congruence-witnesses"></a>

**Uniform integral Hecke congruence witnesses.** For each finite ordinary Hecke module W and each p-adic modulus, the Hasse surjection and sufficiently high classical Galois-type modules give a single finite classical comparison controlling all good Hecke operators on W modulo that modulus. Choose a common finite ramification set, coefficient ring and compatible refinements of these comparison data as the modulus grows. The resulting quotient determinant/trace data obey the IHG.4 uniform-congruence contract; at primes dividing (2n)! use a stronger modulus before converting trace pseudocharacters to determinants in characteristic zero.

Assume also: Integral finite Hecke image of W, finite classical comparison module and quotient descent for the continuous determinant identities; denominator control is explicit.

Requires: [AG2.4: Hasse weight-changing congruences](#hasse-weight-changing-congruence); [AG2.4: Galois type of sufficiently high classical cusp forms](#classical-cusp-galois-type); `IntegralHeckeAndGaloisDeterminants:IHG.4/uniform-congruence-witness`; `IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data`.

Sources: [HLTT](#source-hltt), Corollaries 6.3–6.4 and proof of Proposition 6.5, pp. 196–199.

<a id="ordinary-hecke-determinant-limit"></a>

**The continuous ordinary Hecke determinant limit.** The compatible fixed-S quotient data for the ordinary finite Hecke modules interpolate to a unique continuous degree-2n determinant, with every good Frobenius polynomial equal to the normalized G_n Hecke polynomial. At each characteristic-zero irreducible ordinary eigensystem covered by Proposition 6.5/Corollary 6.13, specialization reconstructs a continuous semisimple rank-2n Galois representation. Coefficient/level changes transport this determinant; the coefficient limit adds no ramification.

Assume also: The uniform congruence witnesses and actual quotient-descent contract, separated complete coefficient topology, compatible level maps and characteristic-zero reconstruction continuity; the source Proposition 6.5 initially concerns an irreducible quotient of an admissible submodule.

Requires: [AG2.4: uniform Hecke congruences](#uniform-integral-hecke-congruence-witnesses); [AG2.4: Finite slope cusp sections on the ordinary tube](#ordinary-cusp-finite-slope-pieces); `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`; `IntegralHeckeAndGaloisDeterminants:IHG.4/completed-group-algebra-extension`; `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-coefficient-change`; `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-level-change`; `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-ramification`; `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

Sources: [HLTT](#source-hltt), Proposition 6.5 and Corollary 6.13, pp. 197–199, 214–215.

<a id="logarithmic-cusp-section-spectral-sequence"></a>

**The logarithmic cusp-section spectral sequence.** At each fixed Kuga slope bound b, the logarithmic de Rham cohomology of the ordinary Kuga model with I_∂ has the coefficient filtration and spectral sequence of HLTT Proposition 6.15/Corollary 6.17: the E₁ terms are finite-slope H⁰(X^ord,min,†,E_{ρ_{m,s}^{i,j}}^sub), with section bound b−mn[F:Q]. Equivalently, section bound a gives Kuga bound a+mn[F:Q]. Combining with Lemma 6.20 gives the log de Rham spectral sequence to H^*_{c−∂,≤b}. Hence every irreducible constituent appearing in the abutment has the source rank-2n good-place Galois representation.

Assume also: Actual algebraic representations ρ_{m,s}^{i,j}, coefficient trace factor and finite filtrations; the higher coherent cohomology vanishing on the ordinary affine locus.

Requires: [AG2.4: Dagger cohomology with boundary support](#boundary-support-dagger-cohomology); [AG2.4: Frobenius/trace normalization](#hltt-frobenius-trace-normalization); [AG2.4: Finite slope cusp sections on the ordinary tube](#ordinary-cusp-finite-slope-pieces); [AG2.4: continuous ordinary Hecke determinant limit](#ordinary-hecke-determinant-limit); `AutomorphicBundles:B3`.

Sources: [HLTT](#source-hltt), Proposition 6.15, Corollary 6.17 and Corollaries 6.18, 6.23, pp. 215–220.

<a id="boundary-stratum-weight-zero-sequence"></a>

**The boundary-stratum and weight-zero spectral sequence.** For the fixed HLTT ordinary boundary model, E₁^{i,j}=H^i_rig(∂^(j)A_Σ^ord)⇒H^{i+j}_{c−∂}(A_Σ^ord), compatibly with ς_p. The abutment is finite-dimensional at fixed level and is exhausted by finite trF slopes. Its Frobenius eigenvalues have nonnegative Weil weights; for i>0, the weight-zero part of H^{i+1}_{c−∂} is the cohomology H^i of the boundary dual simplicial complex, and for i=0 the source gives a surjection.

Assume also: Smooth quasi-projective strata, functorial rigid/dagger comparison, rigid finiteness and the weight lower bound w≥cohomological degree.

Requires: [AG2.4: Dagger cohomology with boundary support](#boundary-support-dagger-cohomology); [AG2.4: Functorial comparison of HLTT tubes with rigid cohomology](#hltt-functorial-dagger-rigid-comparison); [AG2.4: Frobenius/trace normalization](#hltt-frobenius-trace-normalization); `PadicDifferentialEquationsAndRigidCohomology:RD.5`; `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

Sources: [HLTT](#source-hltt), Lemmas 6.21 and Corollaries 6.22–6.24, pp. 219–220.

<a id="boundary-levi-cohomology-realization"></a>

**The boundary Levi realization.** For i>0, the induced interior cohomology of the GL_n Levi locally symmetric space in HLTT Corollary 6.25 occurs as a subquotient of W₀H^{i+1}_{c−∂}. A regular algebraic GL_n cuspidal π, after all sufficiently large norm twists N, occurs in this interior-cohomology input by Corollary 1.9. Corollary 6.27 gives an actual rank-2n R(π,N) whose good-place parameter is rec(π_v|det|^{(1−n)/2})⊕rec(π^c_{cv}|det|^{(1−n)/2})^{∨,c}ε_p^{1−2n−2N}.

Assume also: n>1; exact Levi arithmetic quotient, coefficient representation ρ and π∞ with the infinitesimal character of ρ∨; N sufficiently large; good source places q≠p split in F₀ or unramified in F with π spherical above q.

Requires: [AG2.4: boundary weight-zero sequence](#boundary-stratum-weight-zero-sequence); [AG2.4: cusp-section spectral sequence](#logarithmic-cusp-section-spectral-sequence); `AutomorphicFormsOnReductiveGroups:AF.1`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [HLTT](#source-hltt), Corollary 1.9, §1.5, p. 41; Corollaries 6.25–6.27, p. 221.

<a id="hltt-factor-separation-specialization"></a>

**Separating the two HLTT rank-n factors.** The representations R(π,N) for all sufficiently large N satisfy HLTT Proposition 7.12 with Γ=G_{F,S}, dense good Frobenius set, µ=ε_p^−2 and two n-element root multisets E₁,E₂ independent of N, the constant ε_p^{1−2n} correction absorbed into E₂. Each µ(Frob_v) has infinite order. The generic factor-separation theorem therefore gives continuous semisimple rank-n representations for each multiset. The first is the good-place attached r(π), uniquely determined by Frobenius polynomials.

Assume also: One finite S for all N; Γ topological, algebraically closed characteristic-zero coefficient field; all R(π,N) continuous semisimple; infinitely many exponents and infinite-order µ on the determining dense set.

Requires: [AG2.4: boundary Levi realization](#boundary-levi-cohomology-realization); [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); `IntegralHeckeAndGaloisDeterminants:IHG.4`.

Sources: [HLTT](#source-hltt), §7 first two paragraphs, Proposition 7.12 and proof of Theorem 7.13, pp. 222–228.

## AG2.5. Local comparison, monodromy and purity

Compare the early integral polynomial with the constructed local correspondence. Varma’s congruences give semisimplified compatibility and monodromy dominance in the nonselfdual setting. The polarized tensor-square geometry, double weight spectral sequence and temperedness supply purity; pure WD uniqueness then upgrades the comparison to include N.

<a id="the-normalization-dictionary-fixed-by-the-sources"></a>

**Comparison of the early polynomial with normalized local Langlands.** For spherical π_v, after ET.6 fixes geometric Artin and the Harris–Taylor normalization, rec(π_v|det|^{(1−n)/2}) is unramified with Frobenius polynomial equal to the AG2.0 integral Hecke polynomial. Shin/Caraiani L_n is this geometric normalization. The square-root Satake extension cancels from the integral coefficients. rec^T is the corresponding arithmetic/rational normalization of the source; geometric-to-arithmetic Frobenius takes the normalized reciprocal polynomial. This is a comparison with the constructed local correspondence, and is not an early prerequisite for raw geometry.

Assume also: Use the chosen coefficient embedding and geometric Frobenius on both sides. Import the exact local reciprocity/Satake normalization from ET.6; do not invert roots in just one side.

Requires: [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); `EndoscopicTransferAndUnitaryTraceComparison:ET.6`; `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`.

Sources: [HLTT](#source-hltt), Theorem 7.13 and notation §1, pp. 1–3, 227; [CT](#source-ct), §1.1 notation, accepted copy p. 3.

<a id="varma-semisimplified-comparison-and-monodromy-bound"></a>

**Varma’s semisimplified comparison and monodromy bound.** For E totally real or CM and regular algebraic cuspidal π on GL_n(A_E), the constructed r_{p,ι}(π) satisfies WD(r|_{G_{E_v}})^ss≅ι^−1rec(π_v|det|^{(1−n)/2})^ss for every v∤p, and WD(r|_{G_{E_v}})^{F-ss}≺ι^−1rec(π_v|det|^{(1−n)/2}). Extract the local bound from the varying-twist 2n family and then remove the split-place and auxiliary-CM restrictions by the source extension/descent argument. The comparison retains no asserted equality of monodromy for arbitrary nonselfdual π.

Assume also: Regular algebraic cuspidal; every v∤p; the source parameter convention and the full isotypic dominance relation.

Requires: [AG2.4: HLTT existence](#hltt-construction-of-nonselfdual-systems); [AG2.5: Varma monodromy bound](#varma-monodromy-rank-bound); [AG2.4: HLTT factor separation](#hltt-factor-separation-specialization); [AG2.3: effective patching](#effective-automorphic-galois-patching); [AG2.5: local normalization comparison](#the-normalization-dictionary-fixed-by-the-sources).

Sources: [Varma](#source-varma), Theorem (1), p. 2; Proposition 8.1 and proof, pp. 18–19; Proposition 9.1 and proof, pp. 20–26; Theorem 10.2 and Corollary 10.3, §10, pp. 26–27.

<a id="caraiani-upgrade-away-from-p-and-temperedness"></a>

**Caraiani’s full away-prime compatibility.** For CM L and regular algebraic CSD cuspidal π on GL_n(A_L), every prime ℓ and every v∤ℓ satisfy WD(r_{ℓ,ι}(π)|_{G_{L_v}})^{F-ss}≅ι^−1rec(π_v|det|^{(1−n)/2}) including N. Choose the source solvable extensions and two-signature tensor-square instance, prove its monodromy purity, descend purity to the rank-n representation, and combine with the semisimple local comparison and temperedness. This is full WD compatibility under the polarized source hypotheses, not a conclusion for arbitrary nonselfdual HLTT systems or for v|ℓ.

Assume also: Regular algebraic CSD cuspidal; v∤ℓ; source geometric normalization and coefficient embedding.

Requires: [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris); [AG2.5: polarized family comparison](#ch-polarized-local-monodromy-bound); [AG2.5: tensor-square geometry](#caraiani-tensor-square-geometric-instance); [AG2.5: Purity from the double weight spectral sequence](#tensor-square-weight-spectral-sequence); [AG2.5: Pure Weil–Deligne comparison up to equivalence](#pure-weil-deligne-comparison); [AG2.5: local normalization comparison](#the-normalization-dictionary-fixed-by-the-sources).

Sources: [Caraiani-away](#source-caraiani-away), Theorem 7.4 and proof, pp. 83–85.

<a id="good-prime-unramified-polynomial"></a>

**Unramifiedness and the good-prime polynomial.** For each constructed polarized or nonselfdual rank-n r, outside its specified finite excluded set and v∤ℓ, r is unramified and det(X−r(Frob_v^geom))=ι^−1P_v(π_v;X). HLTT Corollary 7.14 proves this for v|q≠ℓ where π is unramified at every place above q, including field-ramified q after auxiliary descent. The polarized branch has the source’s unramified local-global comparison. The result includes every coefficient prime, while excluding the places above that prime.

Assume also: The relevant existence theorem and its actual common ramification set; π cuspidal regular algebraic, polarized only in the corresponding branch.

Requires: [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris); [AG2.4: HLTT existence](#hltt-construction-of-nonselfdual-systems); [AG2.5: local normalization comparison](#the-normalization-dictionary-fixed-by-the-sources); [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions).

Sources: [HLTT](#source-hltt), Corollary 7.14, p. 228.

<a id="monodromy-order-interface"></a>

**The monodromy dominance interface.** Import WD, Frobenius semisimplification, WD semisimplification and monodromy filtration from R01.2. For equal semisimple Weil representations, Varma’s ≺ compares decreasing Sp-block partitions separately in each irreducible Weil unramified-twist class: every initial sum on the first side is ≤ the second. The inertial relation ≺_I compares the corresponding N-block partitions in every irreducible inertia isotype. Lemma 9.2 identifies them when the semisimple Weil parts agree. Equivalently all ranks of positive powers of each isotypic N on the first side are ≤ the second; one rank is insufficient.

Assume also: Characteristic zero; finite inertial Weil image; same semisimple Weil part when identifying the two orders.

Requires: `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`; `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`; `ArithmeticGaloisRepresentations:R01.2/monodromy-filtration`; `ArithmeticGaloisRepresentations:R01.2`.

Sources: [Varma](#source-varma), §9, Definitions 1–2 and Lemma 9.2, pp. 20–21.

<a id="varma-integral-bernstein-operators"></a>

**Integral Bernstein operators on the ordinary family.** At the unitary split places v∤p, the Bernstein centres of the finitely many components permitted by the fixed local level supply operators whose value at a classical or ordinary cusp eigensystem Π is tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ), for every σ∈W_{F_v}. After the source common denominator d(z), these operators preserve the integral cusp-section lattices used in the Hasse congruences. The bound idempotent e_{Π,B} selects points whose local parameter is dominated by that of the target Π.

Assume also: Finite union of actual Bernstein components at the split local G_n factor; fixed level; source integral denominator and idempotent.

Requires: [AG2.4: HLTT ordinary boundary geometry](#hltt-ordinary-boundary-instance); [AG2.4: Hasse weight-changing congruences](#hasse-weight-changing-congruence); `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.5`; `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Sources: [Varma](#source-varma), §7.2, integral Bernstein operators, pp. 16–17; §9.1, e_{Π,B}, pp. 24–25.

<a id="varma-local-trace-congruence"></a>

**Local Weil traces through the HLTT congruences.** Include the denominator-corrected Bernstein operators in the uniform classical-to-ordinary Hecke congruences. The resulting continuous degree-2n pseudocharacter has T(σ_v)=tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ_v) at every split v∤p and every Weil element σ_v. Semisimple reconstruction therefore identifies the entire semisimple local Weil representation, not just its good unramified Frobenius polynomial.

Assume also: The integral operators, arbitrary-modulus congruences, common ramification set and characteristic-zero pseudocharacter continuity.

Requires: [AG2.5: Integral Bernstein operators on the ordinary family](#varma-integral-bernstein-operators); [AG2.4: uniform Hecke congruences](#uniform-integral-hecke-congruence-witnesses); [AG2.4: continuous ordinary Hecke determinant limit](#ordinary-hecke-determinant-limit); `IntegralHeckeAndGaloisDeterminants:IHG.4`; `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`; [AG2.5: full away-prime comparison](#caraiani-upgrade-away-from-p-and-temperedness).

Sources: [Varma](#source-varma), Proposition 8.1 and proof, pp. 18–20.

<a id="varma-monodromy-rank-bound"></a>

**Monodromy bounds through exterior trace identities.** For the interpolated 2n representation at a split place, WD(r(Π)_v)^{F-ss}≺rec(BC(Π)_v|det|^{(1−2n)/2}). The source detects inertial nilpotent type by all exterior-power vanishing identities for powers of b_{η,ζ}=g_η−ζa_η, and transfers the associated pseudocharacter functions B_{η,ζ}^{k,j} across the integral bound idempotent. This proves rank inequalities for every monodromy power in every inertia isotype, then Lemma 9.2 gives the Weil order.

Assume also: Semisimple global representation; nondegenerate trace pairing on its semisimple image algebra; all η, p-power ζ, j,k>0 of Varma Lemma 9.7; the target Bernstein idempotent.

Requires: [AG2.5: monodromy dominance interface](#monodromy-order-interface); [AG2.5: Local Weil traces through the HLTT congruences](#varma-local-trace-congruence); [AG2.5: Integral Bernstein operators on the ordinary family](#varma-integral-bernstein-operators); `IntegralHeckeAndGaloisDeterminants:IHG.4`; `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`.

Sources: [Varma](#source-varma), Lemma 9.7, Lemma 9.8 and proof of Proposition 9.1, pp. 24–26.

<a id="caraiani-tensor-square-geometric-instance"></a>

**The tensor-square geometric instance.** For the source auxiliary CM extensions F/F′/L and π with local Iwahori invariants, choose the compact unitary datum with signatures (1,n−1) at two distinguished real places and (0,n) at the others. Its dimension is 2n−2. The selected cohomological automorphic packet and corrected coefficient projector realize the tensor square of the already constructed rank-n representation, with the scalar character and multiplicity corrections of Caraiani §7. The integral model is locally étale over a product of two semistable charts at the chosen split prime.

Assume also: The solvable extensions and two split distinguished p-adic places of the proof of Theorem 7.4; cuspidality preserved, relevant local components Iwahori fixed and exact source coefficient twists.

API:

- `TensorSquareInstance.signature`: Exactly two nondefinite signatures give dimension 2n−2.
- `TensorSquareInstance.charts`: The local model is étale over the product of the two specified semistable charts.
- `TensorSquareInstance.constituent`: After the source scalar/multiplicity correction the selected middle cohomology realizes r(π)⊗r(π).
- `TensorSquareInstance.actions`: This identification preserves Hecke and Weil actions with N acting as N⊗1+1⊗N.

Tests: `TensorSquareInstance.rankTwo` — n=2 gives a two-dimensional Shimura variety and a rank-four tensor-square constituent; `TensorSquareInstance.dimension` — The single-signature Shin variety cannot replace the dimension-2n−2 model; `TensorSquareInstance.monodromy` — For nonzero tensor factors V₁,V₂ with N₁=0 and N₂≠0, total monodromy is 1⊗N₂≠0. For the tensor square with N=0, total monodromy is zero.

Requires: [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris); [AG2.1a: corrected Kuga–Sato coefficient projector](#kuga-sato-coefficient-projector); `PELModuli:M4`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`; `LefschetzPencilsAndVanishingCycles:LPV.6`; `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

Sources: [Caraiani-away](#source-caraiani-away), §7 setup and proof of Theorem 7.4, pp. 80–85.

<a id="two-chart-nearby-cycle-monodromy"></a>

**Nearby cycles of the two-chart instance.** Import the product nearby-cycle comparison of Caraiani Proposition 3.9 and Proposition 4.10, with the single-chart filtration of Proposition 4.6 from LPV.6. On the tensor-square instance RΨ of the product is the derived tensor product of the two factors, and N=N₁⊗1+1⊗N₂. The kernel and image filtrations of the total monodromy operator N yield Corollary 4.29’s double-filtered stratum spectral sequence, compatible with the corrected projector, Hecke and Weil actions.

Assume also: The actual étale-local product of semistable charts, all shifts and Tate twists, and coefficient projector equivariance. Characteristic-zero ℓ-adic coefficients Λ=Q_ℓ or Q̄_ℓ for the product argument of §4.2; the two charts are semistable over the same trait.

Requires: [AG2.5: tensor-square geometry](#caraiani-tensor-square-geometric-instance); `LefschetzPencilsAndVanishingCycles:LPV.6`; [AG2.1a: corrected Kuga–Sato coefficient projector](#kuga-sato-coefficient-projector).

Sources: [Caraiani-away](#source-caraiani-away), Proposition 3.9 (p. 24), Proposition 4.6 (p. 29), Proposition 4.10 (p. 33) and Corollary 4.29 (p. 51).

<a id="caraiani-stratum-concentration"></a>

**Cohomology of the two-chart strata.** For the source Π^{1,S}-isotypic part, the stratum Y_{S,T} of the two-chart integral model has coefficient cohomology zero outside j=2n−|S|−|T|, as in Caraiani Proposition 5.10. Its surviving graded pieces have the explicit Igusa/Mantovan trace calculation of Proposition 5.8. These are characteristic-zero automorphic stratum calculations under the source §5 datum; torsion concentration is not used.

Assume also: The exact two-signature datum, selected packet, local Iwahori levels and source ST/END transfer hypotheses.

Requires: [AG2.5: tensor-square geometry](#caraiani-tensor-square-geometric-instance); [AG2.1b: stable/endoscopic Igusa traces](#shin-st-end-igusa-computation); [AG2.1b: compact global Mantovan formula](#compact-global-mantovan-formula); `IgusaVarietiesAndTorsionConcentration:IG.1`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.

Sources: [Caraiani-away](#source-caraiani-away), Propositions 5.8 and 5.10, pp. 64–65.

<a id="racsdc-temperedness"></a>

**Temperedness of regular unitary-type cuspidal forms.** Every regular algebraic conjugate-self-dual cuspidal π on GL_n over CM L has tempered local components at all finite places. With every coefficient conjugate accounted for, the normalized local parameter is pure of weight n−1 in geometric normalization. This is the automorphic purity input to the monodromy comparison; arbitrary nonselfdual π is outside this theorem.

Assume also: Regular algebraic CSD cuspidal, source solvable-base-change descent and all coefficient embeddings. Corollary 5.9 is stated for n≥2. For n=1 the assertion follows separately from the conjugate-self-dual algebraic Hecke-character dictionary and class field theory.

Requires: [AG2.5: Cohomology of the two-chart strata](#caraiani-stratum-concentration); [AG2.2: Attachment under cuspidal solvable base change](#attachment-under-solvable-base-change); `EndoscopicTransferAndUnitaryTraceComparison:ET.6`; `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`; [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character).

Sources: [Caraiani-away](#source-caraiani-away), Corollary 5.9, pp. 64–65, and Theorem 1.2, p. 2.

<a id="tensor-square-weight-spectral-sequence"></a>

**Purity from the double weight spectral sequence.** Caraiani Proposition 7.2 supplies the double-filtered nearby-cycle spectral sequence for the Π^{1,S} part of the corrected Kuga tower, with N taking Gr_l Gr_k to Gr_{l+1} Gr_{k−1}. Its secondary stratum sequence has |S|=j+s, |T|=j+k+l−s+1 and coefficient degree m−2j−k−l+1 with twist −j−k+1. Stratum concentration forces m=2n−2, gives the source degeneration, and proves WD of the selected H^{2n−2} is pure of weight m_ξ−2t_ξ+2n−2.

Assume also: Exact stratum purity and the two-chart nearby-cycle comparison, equivariant projector and coefficient twists; no unproved general weight-monodromy conjecture is assumed.

Requires: [AG2.5: Nearby cycles of the two-chart instance](#two-chart-nearby-cycle-monodromy); [AG2.5: Cohomology of the two-chart strata](#caraiani-stratum-concentration); `DeligneWeightsAndPurity:DWP.8`; `ArithmeticGaloisRepresentations:R01.2/monodromy-filtration`.

Sources: [Caraiani-away](#source-caraiani-away), Proposition 7.2 and Corollary 7.3, pp. 82–84.

<a id="pure-weil-deligne-comparison"></a>

**Pure Weil–Deligne comparison up to equivalence.** For the semisimple Weil representation shared by the Galois and automorphic sides, TY Lemma 1.4(4) determines at most one pure WD extension up to equivalence. Import purity and filtration from R01.2 together with full primitive-string uniqueness, finite-extension equivalence and tensor-square detection. Apply it only after geometric purity of the Galois side and tempered purity of the automorphic side are proved. Do not replace purity with maximal rank of N: maximal rank alone does not determine the WD equivalence class.

Assume also: Characteristic-zero algebraically closed field and semisimple Weil part; equivalence means a Weil-equivariant isomorphism carrying one N to the other.

Requires: [AG2.5: Purity from the double weight spectral sequence](#tensor-square-weight-spectral-sequence); [AG2.5: Temperedness of regular unitary-type cuspidal forms](#racsdc-temperedness); [AG2.5: monodromy dominance interface](#monodromy-order-interface); `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`; `ArithmeticGaloisRepresentations:R01.2/pure-graded-weil-deligne`; `ArithmeticGaloisRepresentations:R01.2`.

Sources: [TY](#source-ty), Lemma 1.4(2)–(4), proof of (4), pp. 6–7; [Caraiani-away](#source-caraiani-away), Published typeset author copy lgc1.pdf, proof of Theorem 7.4, pp. 2410–2411; the preprint gives a shorter argument on p. 85.

<a id="ch-polarized-local-monodromy-bound"></a>

**The polarized local comparison from the definite family.** For the arbitrary-regular polarized CH representation, at every v away from the coefficient prime the Frobenius-semisimplified WD parameter is dominated by the normalized local parameter of π. In particular their semisimple Weil parts agree. This is CH Theorem 3.2.3(a′), obtained from the tame Bernstein/monodromy restrictions in Theorem 2.3 and effective patching. It precedes the pure-WD upgrade and supplies that upgrade’s semisimple comparison without using Varma’s general nonselfdual theorem.

Assume also: CH General Hypotheses 1.1, the definite-unitary interpolation and source Bernstein restrictions; extend essentially polarized forms by the prescribed character twist.

Requires: [AG2.3: arbitrary regular existence](#polarized-construction-inputs-shin-and-chenevier-harris); [AG2.3: definite-unitary eigenvariety instance](#definite-unitary-eigenvariety-instance); [AG2.3: family determinant](#definite-family-determinant-interpolation); [AG2.3: effective patching](#effective-automorphic-galois-patching); [AG2.3: solvable-index induction](#solvable-index-induction); [AG2.5: monodromy dominance interface](#monodromy-order-interface); `SmoothRepresentationsOfLocalGroups:SR.3`; `IntegralHeckeAndGaloisDeterminants:IHG.4`.

Sources: [CH](#source-ch), Theorem 2.3, tame-family paragraph, p. 8; Theorem 3.2.3(a′), pp. 11–12.

<a id="published-racsdc-comparison-specializations"></a>

**Published RACSDC comparison specializations.** For the RACSDC systems, specialize the normalized away-prime compatibility to the relevant weight-zero representations of Liu et al. Proposition 3.2.4 and to BCGP25 RACSDC paragraph following equation (1.8.21). Published CS Theorem 5.5.4 supplies its polarized rank-n system and away-prime comparison; Corollary 5.5.5 treats the discrete sum separately. The p-adic WD comparison, de Rham assertions, coefficient conjugation and strong coefficient field are AG2.6 exports. Liu Hypothesis 3.2.10 is a conditional identification of a Shimura isotypic middle degree, not an unconditional realization for every π; Proposition 3.2.11’s stated range and its unpublished KSZ input are retained.

Assume also: Relevant means the CSD cohomological infinity type of Liu Definition 1.1.3; the chosen automorphic coefficient field and embeddings; no universal use of Hypothesis 3.2.10.

Requires: [AG2.5: full away-prime comparison](#caraiani-upgrade-away-from-p-and-temperedness); [AG2.0: Rationality of the good Hecke polynomials](#field-of-rationality); [AG2.2: Caraiani–Scholze discrete normalization](#cs-discrete-polarization-normalization).

Sources: [Liu](#source-liu), Definition 1.1.3, p. 110; Proposition 3.2.4, Hypothesis 3.2.10 and Proposition 3.2.11, pp. 145–146 (PDF pp. 4, 39–40); [BCGP25](#source-bcgp25), Unnumbered RACSDC GL_n summary after equation (1.8.21), pp. 14–15; [CS](#source-cs), Theorem 5.5.4, pp. 744–745; [CS](#source-cs), Remark 5.5.6 and §5.6, pp. 746–750.

<a id="late-gl2-modular-comparison"></a>

**Comparison with the classical GL₂ constructions.** For a classical or Hilbert modular eigenform in the overlap of the source hypotheses, compare the constructed rank-two automorphic r with the classical R19.1/R19.2 representation after the explicit dual/cyclotomic and geometric-versus-arithmetic conversion. Equality of the good polynomials implies semisimple isomorphism. In the local range where R19.4 proves its own comparison, transport that comparison through the isomorphism. R19 is a consumer comparison, not an input to arbitrary-rank existence or raw geometry.

Assume also: Both independently constructed representations exist; identical weight, nebentype, embedding and Frobenius convention after conversion; only the actual R19 local range is used.

Requires: [AG2.5: Unramifiedness and the good-prime polynomial](#good-prime-unramified-polynomial); `IntegralHeckeAndGaloisDeterminants:IHG.3/rank-two-modular-normalization`; `AutomorphicGaloisRepresentations:R19.1`; `AutomorphicGaloisRepresentations:R19.2`; `AutomorphicGaloisRepresentations:R19.4`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

Sources: [CH](#source-ch), §3.2, pp. 10–12; §4, Hypotheses 4.1 and Theorem 4.2, p. 13.

## AG2.6. Coefficient-prime comparison and compatible systems

Apply period comparison to the actual projected summand, then extend through bounded families and solvable descent. The polarized and nonselfdual CM conclusions have different strengths. Assemble their members into the single imported compatible-system carrier, keeping purity and polarization as branch predicates. Finally compare rank-two, tensor and conditional GSp₄ specializations.

The at-ℓ tensor-square realization is a separate geometric input from the away-prime AG2.5 instance. CR.6 must provide the two-boundary log-crystalline sequence with projected stratum concentration. AHTW additionally requires quantitative local Shimura-cohomology annihilators (Theorem 2.5.7), bounded potentially semistable/crystalline pseudodeformation quotients with arbitrary residual multiplicities (Theorem 3.3.6), and the bounded-torsion/non-Siegel boundary argument. Generic-only concentration and fixed-representation deformation rings do not supply these interfaces; no general formal GAGA theorem is assumed. Its generic maximal-orbit argument is additional to Varma's partition order. Liu's minimal-field geometric identification retains Hypothesis 3.2.10; outside the proved low-rank range of Proposition 3.2.11 it remains conditional.

<a id="extremely-weakly-compatible-system"></a>

**Weak, very weak and extremely weak automorphic data.** Conditional on R24.5:operations separating data from admissibility, use its single arbitrary-rank data carrier: coefficient number field M, finite S, common good-prime polynomials P_v, continuous semisimple members r_λ and labelled Hodge metadata H_τ. The carrier does not intrinsically require the members to be de Rham, crystalline, pure or polarized. Weak, VeryWeak and ExtremelyWeak are predicates supplied by R24.5:operations. Weak requires de Rhamness at every v|ℓ for every λ, the full labelled Hodge multisets for all members, and crystallinity when v|ℓ lies outside S. VeryWeak retains the determinant Hodge sums for all λ and, outside a set of rational ℓ of Dirichlet density zero, requires every λ|ℓ to be crystalline at every v|ℓ with the full labelled Hodge multisets for every coefficient embedding over M. ExtremelyWeak drops this density-one clause and retains the determinant Hodge sums for all λ. Prove Weak ⇒ VeryWeak ⇒ ExtremelyWeak on those same data. No higher-rank converse is asserted. This separation of raw data and strength predicates is a prerequisite of the comparison.

Requires: `PotentialModularityAndCompatibleSystems:R24.5:operations`.

Sources: [ACC+](#source-accplus), §7.1, pp.1084–1086.

<a id="geometric-coefficient-prime-comparison"></a>

**Comparison on the geometric automorphic summand.** For the smooth proper PEL/Kuga–Sato realization supplied by AG2.1a, after the stated Schur projector, automorphic isotypic projector and Tate twist, apply D_cris and D_dR to the actual cohomological summand. The comparison maps are restrictions of geometric comparison and commute with the projectors and cup products. At good reduction the summand is crystalline; its filtered de Rham realization gives HT_τ={a_{τ,i}+n−i : 1≤i≤n}. At strictly semistable reduction use the filtered (φ,N) comparison, with the same projectors. The passage is through a geometric realization, not an assumption that an arbitrary attached representation has period dimensions n.

Assume also: AG2.1a first supplies the raw smooth proper PEL or Kuga–Sato realization, algebraic coefficient representation, cohomological degree, commuting Schur/isotypic idempotents, multiplicity and Tate twist. A statement of good-place attachment by itself does not supply these geometric data. The claimed good or strictly semistable reduction belongs to that realization and the specified local model. Comparison is applied to its cohomology before any admissibility conclusion about the attached representation.

Requires: `AutomorphicGaloisRepresentationsPartII:AG2.1a`; [AG2.0: Hodge multiset](#expected-hodge-tate-multiset); `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`; `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`; `PadicHodgeTheory:R06.5`; [AG2.1a: Finite-level coefficient cohomology](#finite-level-coefficient-cohomology); [AG2.1a: projector degree identity](#coefficient-projector-degree-identity); [AG2.1a: geometric commutation](#hecke-galois-projector-commutation).

Sources: [CH](#source-ch), §1.4–1.5, Theorem 1.4 and formula (1.6), pp.5–7.

<a id="coefficient-hodge-comparison-through-families-and-descent"></a>

**Hodge comparison through deformation and descent.** For a conjugate-self-dual cohomological cuspidal Π over a CM field, the Chenevier–Harris construction passes de Rham, the prescribed regular Hodge multiset, crystallinity at spherical places and semistability at Iwahori places through their bounded family and cyclic patching. Theorem 2.3 varies weights at one chosen coefficient-prime place v_0 and establishes admissibility at the other coefficient-prime places. Theorem 3.2.3 removes this exclusion by solvable base change and descent, arranging at least two coefficient-prime places. A convergent sequence of de Rham representations with unbounded Hodge weights is not the statement.

Requires: [AG2.6: geometric period comparison](#geometric-coefficient-prime-comparison); [AG2.3: definite-unitary eigenvariety instance](#definite-unitary-eigenvariety-instance); [AG2.3: family determinant](#definite-family-determinant-interpolation); [AG2.3: effective patching](#effective-automorphic-galois-patching); [AG2.3: solvable-index induction](#solvable-index-induction); `LocallyAnalyticDistributions:L4/fredholm-determinant`; `LocallyAnalyticDistributions:L4/finite-slope-summands`; `LocallyAnalyticDistributions:L4/completed-base-change`; `PadicHodgeTheory:R06.2/de-rham-base-change`; `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`; `PadicHodgeTheory:R06.2`.

Sources: [CH](#source-ch), Theorem 2.3; §3.1; Theorem 3.2.3, pp.8–12.

<a id="polarized-branch-de-rham-and-crystalline"></a>

**Polarized admissibility at the coefficient prime.** Let F be CM and (π,χ) regular algebraic cuspidal polarized of weight a. For every λ|ℓ and v|ℓ, r_{π,λ}|G_{F_v} is de Rham with HT_τ={a_{τ,i}+n−i}. If π_v is spherical it is crystalline; if π_v has Iwahori-fixed vectors it is semistable. In the Iwahori case BLGGT Theorem 2.1.1(4) gives full Frobenius-semisimple WD comparison with rec(π_v|det|^{(1−n)/2}). The full comparison for general π_v is the separate Caraiani theorem below.

Requires: [AG2.6: Hodge comparison by descent](#coefficient-hodge-comparison-through-families-and-descent); [AG2.0: Hodge multiset](#expected-hodge-tate-multiset); [AG2.0: pairing conventions](#polarized-galois-representation); `PadicHodgeTheory:R06.3/weil-deligne-parameter`.

Sources: [BLGGT](#source-blggt), Theorem 2.1.1(3)–(4), pp.33–34.

<a id="log-crystalline-purity-on-the-automorphic-summand"></a>

**Log-crystalline purity of the automorphic summand.** In Caraiani’s two-boundary semistable PEL model and its Kuga–Sato projector, the Π-isotypic log-crystalline summand realizing the tensor-square representation is pure as a WD representation (Proposition 5.1). Use the two-index strata Y^(r,s) and Theorem 4.6’s generalized log-crystalline weight spectral sequence, with Frobenius, twists and the residue realization of N. Purity follows after proving the relevant projected stratum cohomology is concentrated on the required diagonal; neither semistability nor the existence of the spectral sequence alone implies purity.

Assume also: The separate AG2.1a tensor-square realization includes the two distinguished coefficient-prime places, the closed two-index strata, cohomological multiplicity and coefficient-system projector/Tate twist. Its projected stratum concentration is proved before degeneration and purity are inferred. The log model used for comparison is proper, fine and saturated, log smooth and vertical over the standard log DVR, with special fiber of Cartier type. The second boundary uses its own divisors and s factors. With m smooth local coordinates, a nonempty (i,j)-stratum has dimension 2n+m−i−j; carry this dimension and the Kuga–Sato/Tate shifts into the spectral sequence.

Requires: [AG2.6: geometric period comparison](#geometric-coefficient-prime-comparison); `CrystallineCohomology:CR.6`; `WeightsInEtaleCohomology:R34.6`; `AutomorphicGaloisRepresentationsPartII:AG2.1a`.

Sources: [Caraiani-p](#source-caraiani-p), §§2–4; Theorem 4.6, Remark 4.7, Proposition 5.1, pp.31–32; [Caraiani-p-published](#source-caraiani-p-published), §3A, pp.1609–1611, including Lemma 3.2; comparison hypotheses immediately before Corollary 2.3, p.1609.

<a id="full-polarized-comparison-at-the-coefficient-prime"></a>

**Full polarized local–global compatibility at ℓ.** For n≥2, a conjugate-self-dual cohomological cuspidal Π over CM F, any ℓ, ι and v|ℓ, WD(r_{Π,ℓ,ι}|G_{F_v})^{F-ss} ≅ ι⁻¹ rec(Π_v|det|^{(1−n)/2}) with monodromy. The algebraic-character twist of AG2.2 extends this to the stated polarized branch. The theorem has no Shin-regularity condition; it uses purity of the geometric summand, temperedness and the pure-parameter uniqueness theorem. Rank one is supplied by algebraic local class field theory.

Requires: [AG2.6: polarized admissibility](#polarized-branch-de-rham-and-crystalline); [AG2.6: log-crystalline purity](#log-crystalline-purity-on-the-automorphic-summand); [AG2.2: Twisting an essentially self-dual form into unitary type](#algebraic-character-polarization-twist); [AG2.5: full away-prime comparison](#caraiani-upgrade-away-from-p-and-temperedness); [AG2.5: Pure Weil–Deligne comparison up to equivalence](#pure-weil-deligne-comparison); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [Caraiani-p](#source-caraiani-p), Theorem 1.1, pp.1–2; §§2 and 5.

<a id="all-cm-de-rham-and-semisimplified-coefficient-comparison"></a>

**Nonselfdual de Rham comparison at ℓ.** A’Campo–Hevesi–Thorne–Whitmore v1, Theorem 1.2.1: for every CM F, n≥1, regular algebraic cuspidal π of highest weight a, ℓ, ι and v|ℓ, r_{π,ℓ,ι}|G_{F_v} is de Rham, has HT_τ={a_{ιτ,i}+n−i}, and WD(r_{π,ℓ,ι}|G_{F_v})^{ss} ≅ ι⁻¹ rec^T(π_v)^{ss}. Here rec^T(π_v)=rec(π_v|det|^{(1−n)/2}). No conjugate self-duality, residual irreducibility or decomposed genericity hypothesis is imposed. This is the July 2026 preprint theorem, with its precise input chain recorded below.

Requires: [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); [AG2.0: Hodge multiset](#expected-hodge-tate-multiset); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `AutomorphicGaloisRepresentationsPartII:AG2.4`; [AG2.4: HLTT existence](#hltt-construction-of-nonselfdual-systems).

Sources: [AHTW](#source-ahtw), Theorem 1.2.1, p.5; §1.2.3–1.2.5; Theorem 5.2.9.

<a id="nonselfdual-coefficient-prime-monodromy-bound"></a>

**Nonselfdual monodromy bound at ℓ.** Under the preceding theorem, WD(r_{π,ℓ,ι}|G_{F_v})^{F-ss} ≺ ι⁻¹rec^T(π_v). Equality of the semisimplified Weil representations comes from the preceding comparison theorem, not from the definition of the order. The order compares, for each irreducible Weil representation up to unramified twist, the sums of the largest Jordan-block sizes: every first-i sum on the left is ≤ the corresponding sum on the right. It is Varma’s order of §8.2, used in AHTW Definition 6.0.2. Full equality of N is not asserted for a general nonselfdual ramified π_v.

Requires: [AG2.6: nonselfdual de Rham comparison](#all-cm-de-rham-and-semisimplified-coefficient-comparison); [AG2.5: Varma comparison](#varma-semisimplified-comparison-and-monodromy-bound); [AG2.5: monodromy dominance interface](#monodromy-order-interface).

Sources: [AHTW](#source-ahtw), Corollary 1.2.2, p.6; Definitions 6.0.1–4, Corollary 6.0.6, pp.111–112.

<a id="all-cm-crystalline-and-iwahori-corollary"></a>

**Nonselfdual spherical and Iwahori admissibility.** For arbitrary regular algebraic cuspidal π over a CM field, r_{π,λ}|G_{F_v} is crystalline when v|ℓ and π_v is spherical, and is semistable when π_v has Iwahori-fixed vectors. In the spherical case its crystalline Frobenius polynomial is the rec^T Satake polynomial. Proof: de Rham implies potentially semistable; ss compatibility gives trivial WD inertia for Iwahori π_v, and the monodromy bound against N=0 forces N=0 in the spherical case. Iwahori semistability does not establish full monodromy equality.

Requires: [AG2.6: nonselfdual de Rham comparison](#all-cm-de-rham-and-semisimplified-coefficient-comparison); [AG2.6: nonselfdual monodromy bound](#nonselfdual-coefficient-prime-monodromy-bound); `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`; `PadicHodgeTheory:R06.3/weil-deligne-descent`.

Sources: [AHTW](#source-ahtw), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6.

<a id="totally-real-polarized-coefficient-prime-descent"></a>

**Totally real polarized coefficient-prime descent.** For a regular algebraic essentially self-dual cuspidal π over a totally real F, the attached BLGGT representation has the stated labelled Hodge weights, is de Rham, is crystalline at spherical coefficient-prime places and semistable at Iwahori places. Full coefficient-prime WD comparison is obtained from the polarized CM theorem by choosing a quadratic CM extension split at the target finite place, retaining cuspidality, matching the base-changed Galois representation, and comparing that unchanged local completion. This also covers the totally-real members used by Newton–Thorne; no unrestricted nonpolarized totally-real assertion is added.

Requires: [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); [AG2.0: Hodge multiset](#expected-hodge-tate-multiset); [AG2.6: full polarized comparison](#full-polarized-comparison-at-the-coefficient-prime); [AG2.6: Hodge comparison by descent](#coefficient-hodge-comparison-through-families-and-descent); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources: [BLGGT](#source-blggt), Theorem 2.1.1, pp.33–34; §2.1 terminology.

<a id="coefficient-embedding-independence-and-semisimple-uniqueness"></a>

**Embedding independence and semisimple uniqueness.** Fix π, its coefficient field M_π, λ and the embedding M_π→Q̄_ℓ attached to λ. Any two continuous semisimple n-dimensional representations of G_F with the common good geometric Frobenius polynomials P_v for v outside a finite set are isomorphic over Q̄_ℓ. Thus r_{π,ℓ,ι} depends on ι only through its restriction to M_π, up to isomorphism. This determines an isomorphism class, not a preferred basis or unique intertwiner. Different λ are compared by the common M_π-polynomials, not by identifying their topological coefficient fields.

Requires: [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); `ArithmeticGaloisRepresentations:R01.5`; `mathlib:Matrix.charpoly_units_conj`.

Sources: [ACC+](#source-accplus), §7.1, pp.1093–1094.

<a id="compatible-system-of-pi"></a>

**Compatible system attached to π.** For a regular algebraic cuspidal π of GL_n(A_F), with F CM, or F totally real and π polarized, given the R24.5 data/predicate separation, assemble R_π on that single imported carrier: M_π is the field fixed by σ∈Aut(C) preserving π^∞; S_π is the finite ramification set of π; P_v(X) is the common monic rec^T geometric Frobenius polynomial; r_λ is the attached continuous semisimple representation; H_τ={a_{τ,i}+n−i}. Populate weak compatibility using all-CM de Rham admissibility, or the totally-real polarized theorem, and crystallinity for v outside S_π above ℓ. Purity, polarization and all-place strict compatibility are separate branch predicates, not fields asserted for every π.

API:

- `compatibleSystem`: Map π to R_π in the supplier carrier.
- `compatibleSystem_member`: The λ-member after embedding is r_{π,ℓ,ι}, up to isomorphism.
- `compatibleSystem_goodPolynomial`: At v outside S_π, the common polynomial is P_v(X).
- `compatibleSystem_hodgeTate`: The labelled multiset is {a_{τ,i}+n−i}, including multiplicities.
- `compatibleSystem_weak`: R_π satisfies the R24.5 weak predicate, with explicit normalization conversion.
- `compatibleSystem_embedding`: Two ι inducing the same λ on M_π give isomorphic members.

Tests: `compatibleSystem_rank_one` — For an algebraic Hecke character ψ, this is its class-field-theoretic compatible system; `compatibleSystem_weight_k` — At n=2, a=(k−2,0), the Hodge multiset is {k−1,0} and its sum is k−1; `compatibleSystem_R19` — On the exact classical/Hilbert overlap, applying the stated dual/twist dictionary identifies each λ-member with the R19 fixed-form member; `compatibleSystem_no_automatic_strictness` — A weak instance with only good-place polynomials cannot supply an equality of monodromy at an unspecified bad place.

Requires: [AG2.0: good-place attachment](#galois-representation-attached-at-good-places); [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); [AG2.0: Hodge multiset](#expected-hodge-tate-multiset); [AG2.0: Rationality of the good Hecke polynomials](#field-of-rationality); [AG2.6: embedding independence](#coefficient-embedding-independence-and-semisimple-uniqueness); [AG2.6: Nonselfdual spherical and Iwahori admissibility](#all-cm-crystalline-and-iwahori-corollary); [AG2.6: Totally real polarized coefficient-prime descent](#totally-real-polarized-coefficient-prime-descent); `PotentialModularityAndCompatibleSystems:R24.5:operations`.

Sources: [ACC+](#source-accplus), §7.1, pp.1093–1094; [AHTW](#source-ahtw), Theorem 1.2.1, pp.5–6.

<a id="complex-and-local-coefficient-conjugation"></a>

**Complex and local coefficient conjugation.** For RAESDC π over totally real F or RAECSDC π over CM F, σ∈Aut(C), r_{σπ,ι}≅r_{π,σ⁻¹ι}. If σ_ℓ∈Gal(Q̄_ℓ/Q_ℓ) and σ=ισ_ℓι⁻¹, then σ_ℓ(r_{π,ι})≅r_{π,ισ_ℓ⁻¹}≅r_{π,σ⁻¹ι}≅r_{σπ,ι}. Coefficient conjugation acts on matrix entries; the absolute Galois group G_F is unchanged. Twisted tensor products use the semilinear convention of NT footnote 4.

Requires: [AG2.6: embedding independence](#coefficient-embedding-independence-and-semisimple-uniqueness); [AG2.0: Rationality of the good Hecke polynomials](#field-of-rationality); `AutomorphicFormsOnReductiveGroups:AF.4`.

Sources: [NT](#source-nt), Theorem 5.1 and Lemma 5.2, p.38, footnote 4.

<a id="strong-coefficient-field"></a>

**Strong coefficient field.** For Π regular cohomological cuspidal conjugate-self-dual (including Liu’s relevant specialization with archimedean principal series arg^{1−n},arg^{3−n},…,arg^{n−1}) and a number field E⊂C containing Q(Π), E is a strong coefficient field if for each finite λ of E there exists a continuous E_λ-linear ρ_{Π,λ} whose scalar extension to Q̄_ℓ is ρ_{Π,ι} for every ι inducing λ. Members are unique up to E_λ-conjugacy when descended by the semisimple realization theorem. This is a field of definition of the representations, stronger than the field of rationality of good polynomials. It includes a family of descended realizations, not canonical bases or canonical intertwiners. This generalizes Liu’s named definition beyond its relevant specialization, using the simultaneous realization condition justified by Chenevier–Harris Proposition 3.2.5; Liu’s conditional minimal-field assertion remains confined to his specialization and Hypothesis 3.2.10.

API:

- `IsStrongCoefficientField`: The preceding all-λ realization property.
- `strongCoefficientField_member`: Choose an E_λ-realization with its scalar-extension isomorphism.
- `strongCoefficientField_baseChange`: For E′/E finite, each λ′-member is E′_λ′⊗_{E_λ}ρ_{Π,λ}, with the identity and composition laws.
- `strongCoefficientField_unique`: Descended semisimple members are unique up to conjugacy, not as based homomorphisms.

Tests: `strongCoefficientField_character` — A rank-one character whose values lie in E has the expected E_λ-realizations; `strongCoefficientField_extension` — Changing E to a finite extension gives exactly the supplier’s coefficient base-change operation at every λ′; `strongCoefficientField_not_rationality` — The definition does not identify rational Frobenius traces with a canonical E_λ-model; a nontrivial Schur obstruction must be split; `strongCoefficientField_scalar_intertwiner` — Nonzero scalar multiples of an intertwiner remain intertwiners, so uniqueness is of the isomorphism class.

Requires: [AG2.6: embedding independence](#coefficient-embedding-independence-and-semisimple-uniqueness); [AG2.0: Rationality of the good Hecke polynomials](#field-of-rationality); `ArithmeticGaloisRepresentations:R01.5`.

Sources: [Liu](#source-liu), Definition 3.2.5 and Remark 3.2.6, printed p.145; [CH](#source-ch), Proposition 3.2.5, author-copy p.12.

<a id="uniform-strong-realization-for-polarized-systems"></a>

**Uniform strong realization of polarized systems.** For a conjugate-self-dual cohomological cuspidal Π over CM F, there is one finite number field E⊂C which is a strong coefficient field for all λ. Chenevier–Harris Proposition 3.2.5 enlarges the coefficient field E_0 of good polynomials by roots of regular semisimple good Frobenius elements at two places of different residue characteristics. Each λ can use one place away from ℓ; a split regular Frobenius and E_0-valued traces split the semisimple descent obstruction. No assertion that the minimal rationality field itself is strong is included.

Requires: [AG2.6: polarized admissibility](#polarized-branch-de-rham-and-crystalline); [AG2.6: Strong coefficient field](#strong-coefficient-field); `ArithmeticGaloisRepresentations:R01.5`; [AG2.3: common realization field](#finite-number-field-of-realization).

Sources: [CH](#source-ch), Proposition 3.2.5, p.12; [Liu](#source-liu), Remark 3.2.6, printed p.145.

<a id="polarized-compatible-system-strictly-pure"></a>

**Purity and polarization of the polarized system.** For a regular algebraic polarized cuspidal (π,χ) with a_{τ,i}+a_{τc,n+1−i}=w, R_π is pure and BLGGT-strictly pure of weight W=w+n−1. Its polarization is r_λ^c≅r_λ^∨⊗μ_λ, μ_λ=ε_ℓ^{1−n}r_{χ,λ}; the χ-system has purity weight 2w. Total oddness uses μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so the required sign is χ_v(−1)=(−1)^{n+w}. BLGGT strict purity describes pure common WD parameters away from the coefficient prime; all-place strict compatibility needs the separately proved coefficient-prime theorem, not a change of definition.

Requires: [AG2.6: automorphic compatible system](#compatible-system-of-pi); [AG2.6: full polarized comparison](#full-polarized-comparison-at-the-coefficient-prime); [AG2.0: pairing conventions](#polarized-galois-representation); [AG2.0: multiplier parity](#sign-of-the-polarization-multiplier); [AG2.5: full away-prime comparison](#caraiani-upgrade-away-from-p-and-temperedness); `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`; `PotentialModularityAndCompatibleSystems:R24.5/polarized-system`; `PotentialModularityAndCompatibleSystems:R24.5/character-system`.

Sources: [BLGGT](#source-blggt), Theorem 2.1.1(1)–(2), pp.33–34; §5.1 pp.62–65.

<a id="very-weak-compatibility-under-dgi"></a>

**Very weak compatibility and the density-one DGI route.** Given the R24.5 data/predicate separation, the weak compatibility proved for the constructed R_π implies very weak compatibility through R24.5’s weakening map on the same data. This gives, in particular, the conclusions of ACC+ Lemmas 7.1.9–7.1.10. Lemma 7.1.9 originally assumes a density-one set of rational ℓ for which every residual member is absolutely irreducible and decomposed generic; Lemma 7.1.10 proves very weak compatibility in rank two through its constituent/image arguments. That Fontaine–Laffaille/degree-shifting proof is an arithmetic consumer in PA.1; it is not an input to the all-CM construction here. None of these statements gives residual irreducibility at every coefficient place.

Requires: [AG2.6: automorphic compatible system](#compatible-system-of-pi); `PotentialModularityAndCompatibleSystems:R24.5:operations`.

Sources: [ACC+](#source-accplus), Lemmas 7.1.9–7.1.10, pp.1093–1094.

<a id="coefficient-prime-branch-and-what-it-does-not-give"></a>

**Comparison strength at the coefficient prime.** The polarized branch has de Rham admissibility and full pure WD comparison at every coefficient-prime place. The all-CM nonselfdual branch has de Rham admissibility, full labelled Hodge weights, ss compatibility and the monodromy upper bound of AHTW v1; spherical crystallinity and Iwahori semistability follow from WD criteria. Full N equality for general nonselfdual ramified places is not supplied by these statements. Fontaine–Laffaille, ordinary lifting and residual-image conclusions retain their separate consumer hypotheses.

Requires: [AG2.6: full polarized comparison](#full-polarized-comparison-at-the-coefficient-prime); [AG2.6: Nonselfdual spherical and Iwahori admissibility](#all-cm-crystalline-and-iwahori-corollary); [AG2.6: nonselfdual monodromy bound](#nonselfdual-coefficient-prime-monodromy-bound).

Sources: [AHTW](#source-ahtw), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6; [Caraiani-p](#source-caraiani-p), Theorem 1.1, pp.1–2.

<a id="rank-two-comparison-with-r19"></a>

**Rank-two comparison with R19.** For a fixed classical newform of weight k≥2 or regular cohomological Hilbert eigenform in the exact R19.3/5 overlap, identify the AG2 λ-member with the R19 member after converting geometric/arithmetic Frobenius and the stated Tate twist. For the standard weight-k classical normalization this is r_AG2≅r_R19^∨, giving geometric polynomial X²−a_qX+ψ(q)q^{k−1}, HT_AG2={0,k−1}, and det=r_ψ ε^{1−k} where r_ψ(Frob_q^geom)=ψ(q). For Hilbert (k_τ,w) use Skinner’s explicit half-integer normalization before dualizing; parity is part of its hypotheses. Import R19’s full Skinner coefficient-prime theorem, not Kisin’s conditional theorem as unconditional.

Requires: [AG2.6: embedding independence](#coefficient-embedding-independence-and-semisimple-uniqueness); `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`; [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions).

Sources: [CH](#source-ch), §1.5 formula (1.6), p.7; Theorem 3.2.3, pp.11–12.

<a id="tensor-automorphy-independent-of-coefficient-embedding"></a>

**Coefficient independence of tensor automorphy.** Let π_1 and σ be RAESDC over a totally real F. Suppose r_{π_1,ι}⊗r_{σ,ι} is irreducible and automorphic for one (ℓ,ι), in the RAESDC sense used by Newton–Thorne. Then r_{π_1,j}⊗r_{σ,j} is automorphic for every prime q and j:Q̄_q≅C. Match the automorphic realization’s good polynomial to the tensor-product polynomial using coefficient conjugation, then use semisimple uniqueness. This does not establish automorphy of an arbitrary tensor product; its initial automorphy and irreducibility are hypotheses.

Requires: [AG2.6: coefficient conjugation](#complex-and-local-coefficient-conjugation); [AG2.6: embedding independence](#coefficient-embedding-independence-and-semisimple-uniqueness); `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`.

Sources: [NT](#source-nt), Proof of Lemma 5.8, pp.42–44, cf. proof of Lemma 2.1.

<a id="gsp4-crystalline-hodge-comparison"></a>

**GSp₄ crystalline Hodge comparison.** In Calegari–Geraghty Proposition 6.8, for a cuspidal GSp4 eigenform f of good p-level and weight (a,b), a≥b≥3, the r_f supplied by the GSp₄ construction and ML.4 transfer is crystalline at p with HT={0,b−2,a−1,W}, W=a+b−3. If f is also an eigenform for the Hecke operators at p, det(X−φ)=λ_f(Q_p(X)) in their monic convention. The eigenform-at-p condition specifies this polynomial; crystallinity in the proposition’s good-level setting does not depend on that additional condition.

Requires: `AutomorphicGaloisRepresentationsPartII:AG2.2`; `ModularityAndLanglandsExtensions:ML.4`; [AG2.6: polarized admissibility](#polarized-branch-de-rham-and-crystalline).

Sources: [CG](#source-cg), Proposition 6.8(3), author-copy pp.38–39.

<a id="ordinary-gsp4-coefficient-prime-shape"></a>

**Ordinary GSp₄ triangular shape.** Under CG Proposition 6.8(4), assume f is a p-Hecke eigenform and ordinary: its T_{p,1} and Q_{p,2} eigenvalues are units. The roots α,β,γ,δ of λ_f(Q_p(X)) have valuations 0,b−2,a−1,W and are distinct. r_f|G_Qp has the upper-triangular diagonal unram(α), ε^{−(b−2)}unram(p^{−(b−2)}β), ε^{−(a−1)}unram(p^{−(a−1)}γ), ε^{−W}unram(p^{−W}δ). The parameters of the unramified characters are units. Distinctness follows from the four different valuations, not from ordinarity in an unspecified singular weight.

Requires: [AG2.6: GSp₄ crystalline Hodge comparison](#gsp4-crystalline-hodge-comparison); `PadicHodgeTheory:R06.4/ordinary-representation`; `PadicHodgeTheory:R06.4`; `ModularityAndLanglandsExtensions:ML.4`.

Sources: [CG](#source-cg), Proposition 6.8(4), author-copy p.39.

<a id="pilloni-gsp4-normalization-comparison"></a>

**Pilloni GSp₄ normalization comparison.** Pilloni Theorem 5.1.7.1 for cuspidal π with discrete-series π_∞ and parameter (λ_1,λ_2;−λ_1−λ_2+3) gives a de Rham representation with HT={0,−λ_2,−λ_1,−λ_1−λ_2}. At p outside the nonspherical set it is crystalline and det(1−Xφ)=Θ_π(Q_p(X)). Its geometric Frobenius and HT(ε)=−1 conventions require reciprocal conversion X^4Q_p(1/X) to the monic polynomial. The corrected similitude exponent is ε^{λ_1+λ_2}, in the stated geometric and Hodge convention. Substitution λ_1=1−a, λ_2=2−b gives CG’s four Hodge numbers; identifying the automorphic representations also requires the ML.4 Harish–Chandra/Satake dictionary.

Requires: [AG2.6: GSp₄ crystalline Hodge comparison](#gsp4-crystalline-hodge-comparison); `AutomorphicGaloisRepresentationsPartII:AG2.2`; `ModularityAndLanglandsExtensions:ML.4`.

Sources: [Pilloni](#source-pilloni), Theorem 5.1.7.1(3)–(4), Remark 5.1.7.1, author-copy pp.22–23.

## AG2.7. Residual representations, Hecke ideals and arithmetic exports

Choose finite local models and stable lattices before defining residual semisimplifications. Relate their Frobenius polynomials to maximal Hecke ideals. Distinguish local genericity, genericity at every place above a split prime, absolute irreducibility and the stronger ratio condition. The final exports retain exactly the branch-specific characteristic-zero and residual hypotheses.

Residual polarization needs a G7 reduction-and-semisimplification theorem for the CM conjugation extension with its coefficient-characteristic hypotheses. A deformation problem that already assumes that extension cannot prove it. The selected two-block CS export requires the separate local-normalization input of Remark 5.5.6; a cuspidal RACSDC theorem does not by itself establish the comparison for that sum.

<a id="finite-p-adic-field-of-realization"></a>

**Finite p-adic realization before lattices.** For each continuous r_{π,ℓ,ι}:G_F→GL_n(Q̄_ℓ), there is a finite extension E/Q_ℓ over which its matrices are defined, after a change of basis if desired. Prove this before invoking a compact-local-field stable-lattice theorem. The compact image is covered by GL_n(E) for the countably many finite subextensions of Q̄_ℓ/Q_ℓ; Baire gives one such closed subgroup with open intersection, and finitely many coset representatives lie in a larger finite field. A uniform strong number field is available on the polarized branch, but is not needed for this local assertion.

Requires: [AG2.6: automorphic compatible system](#compatible-system-of-pi); `ArithmeticGaloisRepresentations:R01.1`.

Sources: [BLGGT](#source-blggt), §2.1, after Theorem 2.1.1, p.34; [CG](#source-cg), Proof of Proposition 6.8, author-copy p.39.

<a id="residual-representation-of-pi"></a>

**Residual representation of π.** Choose a finite E/Q_ℓ realizing r_{π,λ}, an O_E-stable lattice L, and a basis of L. Define r̄_{π,λ} as the semisimplification of L/m_EL. Its isomorphism class over k̄_ℓ is independent of L, the basis and enlargement of E, for a fixed coefficient embedding λ. It descends to the finite field generated by the reductions of the common good polynomial coefficients. At good v away from ℓ it is unramified and has characteristic polynomial P_v reduced through λ. For F/F^+ CM in the totally odd polarized branch, the semisimple residual polarized representation admits the 𝒢_n-valued extension with multiplier ε̄^{1−n}r̄_χ supplied by the polarized representation API. An arbitrary lattice is not declared self-dual.

API:

- `residualRep`: The continuous semisimple residual member over its finite field of realization.
- `residualRep_indep_lattice`: Two lattice reductions have isomorphic semisimplifications over k̄_ℓ.
- `residualRep_coeffExtension`: Enlargement of E gives scalar extension of the same semisimple residual representation.
- `residualRep_goodPolynomial`: At good v away from ℓ the polynomial is the coefficient reduction of P_v.
- `residualRep_extendGn`: For F/F^+ CM, totally odd polarized residual members extend to 𝒢_n with the specified multiplier; the totally-real orthogonal/symplectic specialization is separate.

Tests: `residualRep_rank_one` — For an integral character ψ, r̄ is its reduction and no semisimplification changes it; `residualRep_diagonal_reduction` — Reduction of diag(1,2) modulo 3 has polynomial (X−1)(X−2), the reduction of the characteristic-zero polynomial; `residualRep_R19_dual` — For the classical weight-k overlap at fixed λ, r̄_AG2≅r̄_R19^∨ under the same residue embedding; `residualRep_noncanonical_lattice` — For the Z_5-action r(t)=[[1,5t],[0,1]], lattices with bases (e1,e2) and (5e1,e2) give identity and nontrivial unipotent reductions; both semisimplify to 1⊕1.

Requires: [AG2.7: finite local realization](#finite-p-adic-field-of-realization); `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`; [AG2.0: pairing conventions](#polarized-galois-representation); `ArithmeticGaloisRepresentations:G7`; `mathlib:Matrix.GeneralLinearGroup.map`; `mathlib:Representation.IsSemisimpleRepresentation`.

Sources: [BLGGT](#source-blggt), §2.1, p.34; [ACC+](#source-accplus), §7.1, p.1085.

<a id="good-polynomial-reduction"></a>

**Reduction of good Frobenius polynomials.** For a stable lattice realization A_v∈GL_n(O_E) of a good geometric Frobenius, Matrix.charpoly(A_v) has integral coefficients and maps under O_E→k_E to Matrix.charpoly(Ā_v); semisimplification leaves it unchanged. Thus the reduced polynomial is the reduction of ι⁻¹P_v. The constant term is a unit because A_v is invertible. This is ordinary characteristic-polynomial coefficient change, not a new determinant-law construction.

Requires: [AG2.7: residual representation](#residual-representation-of-pi); `mathlib:Matrix.charpoly_map`; `mathlib:Matrix.GeneralLinearGroup.map`.

Sources: [ACC+](#source-accplus), Definition 2.3.6, p.938; §7.1, p.1085.

<a id="hecke-maximal-ideal-of-galois-type"></a>

**Maximal Hecke ideal of Galois type.** For the unramified integral Hecke algebra T^S over O, a maximal ideal m with finite residue field k_m is of Galois type if there exists a continuous semisimple r_m:G_{F,S}→GL_n(k_m) such that at every v outside S its good geometric Frobenius polynomial is Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i} modulo m (T_{v,0}=1). Include the coefficient prime in S for this unramified quotient statement. r_m is considered up to isomorphism; the condition does not itself require absolute irreducibility.

API:

- `IsGaloisType`: Existence of the stated semisimple realization over k_m.
- `galoisType_rep`: A chosen r_m together with the polynomial matching theorem.
- `galoisType_rep_unique`: Any two semisimple realizations are isomorphic after a common residue-field extension.
- `galoisType_coeffExtension`: The polynomial comparison commutes with the existing GL coefficient map.

Tests: `galoisType_rank_one_polynomial` — For n=1 the constant term is −T_{v,1}; `galoisType_reducible` — A Hecke eigencharacter with r_m=1⊕1 can be of Galois type; `galoisType_charpoly_map` — Residue extension maps the matched polynomial exactly by Matrix.charpoly_map; `galoisType_not_nonEisenstein` — The reducible example cannot certify non-Eisensteinness.

Requires: `IntegralHeckeAndGaloisDeterminants:IHG.3`; [AG2.0: integral Frobenius polynomial](#frobenius-polynomial-and-conventions); `ArithmeticGaloisRepresentations:R01.5`; `mathlib:Representation.IsSemisimpleRepresentation`.

Sources: [ACC+](#source-accplus), Definition 2.3.6, printed p.938.

<a id="non-eisenstein-maximal-ideal"></a>

**Non-Eisenstein maximal ideal.** A maximal ideal m of T^S is non-Eisenstein if it is of Galois type and its semisimple realization r_m is absolutely irreducible. The condition is independent of the chosen realization by semisimple uniqueness. It is a global condition, separate from local ACC+ genericity and from enormousness of the image after restriction to G_{F(ζ_ℓ)}.

API:

- `IsNonEisenstein`: Galois type plus absolute irreducibility.
- `nonEisenstein_galoisType`: Forget absolute irreducibility.
- `nonEisenstein_coeffExtension`: Absolute irreducibility persists under any residue-field extension and is detected over k̄.

Tests: `nonEisenstein_rank_one` — Every rank-one Galois-type realization is absolutely irreducible; `nonEisenstein_not_trivial_rank_two` — The rank-two trivial representation cannot make its ideal non-Eisenstein; `nonEisenstein_absolute_not_relative` — An irreducible k_m-representation that splits over k̄_m does not satisfy the definition.

Requires: [AG2.7: Galois-type Hecke ideal](#hecke-maximal-ideal-of-galois-type); `mathlib:Representation.IsSemisimpleRepresentation`; `mathlib:Representation.IsIrreducible`.

Sources: [ACC+](#source-accplus), Definition 2.3.6, p.938.

<a id="residual-hecke-ideal-independence"></a>

**Independence of the residual Hecke ideal.** Fix π, λ and an integral eigencharacter θ_π:T^S→O_E at that coefficient place. Then m_{π,λ}=ker(T^S→O_E→k_E) is of Galois type with realization r̄_{π,λ}. Its kernel is independent of stable lattice, basis and finite extension of E inducing the same λ: the eigencharacter is defined by the same integral Hecke eigenvalues and the residue-field extension is injective. It is non-Eisenstein exactly when r̄_{π,λ} is absolutely irreducible. Independence across distinct λ is not asserted.

Requires: [AG2.7: residual representation](#residual-representation-of-pi); [AG2.7: good polynomial reduction](#good-polynomial-reduction); [AG2.7: Galois-type Hecke ideal](#hecke-maximal-ideal-of-galois-type); [AG2.7: Non-Eisenstein maximal ideal](#non-eisenstein-maximal-ideal); `IntegralHeckeAndGaloisDeterminants:IHG.3`.

Sources: [ACC+](#source-accplus), Definition 2.3.6, p.938; §7.1, p.1085.

<a id="dual-and-character-twist-hecke-comparison"></a>

**Dual and character-twist Hecke comparison.** For a Galois-type maximal ideal m of rank n, the contragredient Hecke ideal m^∨ is of Galois type with r_{m^∨}≅r_m^∨⊗ε̄^{1−n}. At good geometric Frobenius its eigenvalues are q_v^{n−1}/α_i. An integral unramified-at-v character ψ multiplies the eigenvalues by ψ(Frob_v), and its Hecke twist realizes r_m⊗ψ̄. In the rank-2n unitary Hecke algebra the reciprocal factor is q_v^{2n−1}. Residual nonratio conditions are transported only with their unramifiedness hypotheses.

Requires: [AG2.7: Galois-type Hecke ideal](#hecke-maximal-ideal-of-galois-type); `IntegralHeckeAndGaloisDeterminants:IHG.3`; [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`.

Sources: [ACC+](#source-accplus), After Definition 2.3.6, p.938.

<a id="the-residual-ratio-condition-for-taylor-wiles-primes"></a>

**Local residual genericity.** Let L/Q_p be any finite extension with residue cardinality q, ℓ≠p, k a finite field of characteristic ℓ, and r:G_L→GL_n(k) continuous. It is ACC+-generic at L if inertia acts trivially and, over k̄, the eigenvalues α_i∈k̄× of r(Frob_L^geom), listed with multiplicity, satisfy α_i/α_j≠q for every i≠j. Arithmetic instead of geometric Frobenius gives the same predicate because inversion reverses the ordered pair. Repeated eigenvalues are permitted when q≠1 in k; pairwise distinctness alone is insufficient. The local condition has no global irreducibility, adequacy or enormousness clause.

API:

- `IsGenericEigenvalues`: For a list α:Fin n→k×, require α_i/α_j≠q for i≠j; list multiplicities are retained.
- `IsGeneric`: Trivial inertia together with the eigenvalue predicate over k̄.
- `isGeneric_unramified`: A locally generic representation kills inertia.
- `isGeneric_frobenius_independent`: For trivial inertia, changing the Frobenius lift preserves the matrix and predicate.
- `isGenericEigenvalues_smul`: Multiplication of every α_i by the same nonzero scalar preserves the eigenvalue predicate.
- `isGenericEigenvalues_reindex`: Reordering the list by a permutation leaves the predicate unchanged.
- `isGenericEigenvalues_inverse`: Inverting every eigenvalue preserves the predicate by exchanging ordered pairs.

Tests: `isGeneric_repeated_eigenvalue` — Over F_3 with q=2, the list (1,1) is generic; `not_isGeneric_distinct_ratio_q` — Over F_5 with q=2, the distinct list (2,1) is not generic; `isGeneric_rank_one` — Every one-term nonzero list is generic; `not_isGeneric_repeated_q_one` — Over F_3 with q=1, (1,1) is not generic; `isGeneric_matrix_diagonal` — The list condition on α agrees with the characteristic-polynomial factorization of the diagonal matrix diag(α).

Requires: [AG2.7: residual representation](#residual-representation-of-pi); `ArithmeticGaloisRepresentations:R01.1`; `mathlib:Matrix.charpoly`; `mathlib:Matrix.GeneralLinearGroup.map`.

Sources: [ACC+](#source-accplus), Definition 4.3.1(1), p.972.

<a id="completely-split-generic-prime"></a>

**Completely split generic prime.** For a continuous residual r:G_F→GL_n(k), a rational prime p is a decomposed-generic prime if p≠ℓ, p is completely split in F, and r is unramified and ACC+-generic at every v|p. Complete splitting means e_v=f_v=1 at every v, so q_v=p. This is a property of the pair (r,p), distinct from local genericity at one arbitrary place and from existence of such a p.

API:

- `IsDecomposedGenericPrime`: The complete-splitting and all-v condition.
- `decomposedGenericPrime_local`: For every v|p, obtain unramifiedness and the local predicate with q=p.
- `decomposedGenericPrime_coeffExtension`: Any extension of the finite coefficient field preserves and reflects the condition.

Tests: `decomposedGenericPrime_Q` — For F=Q there is exactly one place over p; the splitting clause is automatic; `decomposedGenericPrime_not_inert` — An inert prime in a quadratic F is not decomposed generic even when the local ratio condition holds; `decomposedGenericPrime_not_ell` — p=ℓ is excluded independently of eigenvalues.

Requires: [AG2.7: Local residual genericity](#the-residual-ratio-condition-for-taylor-wiles-primes); `ArithmeticGaloisRepresentations:R01.1`.

Sources: [ACC+](#source-accplus), Definition 4.3.1(2), p.972.

<a id="existential-decomposed-genericity"></a>

**Decomposed generic residual representation.** A continuous residual representation r:G_F→GL_n(k) is decomposed generic if there exists a rational prime p which is decomposed generic for r. This existential condition is the ACC+ hypothesis used by the torsion-concentration and potential-automorphy consumers. It does not mean every split prime is generic, nor is it equivalent to global absolute irreducibility or enormousness.

API:

- `IsDecomposedGeneric`: There exists p satisfying IsDecomposedGenericPrime(r,p).
- `decomposedGeneric_witness`: Extract the prime witness and all-v local conditions.
- `decomposedGeneric_coeffExtension`: The existential condition is preserved and reflected by finite residue-field extension.

Tests: `decomposedGeneric_trivial_F3` — For F=Q, k=F_3, r=1⊕1, the prime p=2 is a witness; `decomposedGeneric_not_irreducible` — The preceding decomposed-generic representation is reducible; `decomposedGeneric_not_every_prime` — For the same r, p=7 has q=1 mod 3 and is not a witness, although p=2 is.

Requires: [AG2.7: split generic prime](#completely-split-generic-prime).

Sources: [ACC+](#source-accplus), Definition 4.3.1(3), p.972.

<a id="strong-local-decomposed-genericity"></a>

**Strong local decomposed genericity.** For any finite extension L/Q_p, ℓ≠p, define the Caraiani–Scholze Definition 1.9 specialization: r is unramified and α_i/α_j∉{1,q} for all i≠j over k̄. Equivalently its eigenvalues are pairwise distinct and ACC+-generic. The local field need not be Q_p. This stronger predicate has its own name and implies the ACC+ local predicate. Liu Appendix D’s displayed distinctness is unnecessary for its later noncompact concentration input, as its footnote 37 explicitly records; the stronger definition is not silently substituted for ACC+.

API:

- `IsStrongGenericEigenvalues`: IsGenericEigenvalues(α,q) and α injective, equivalently ratios avoid {1,q}.
- `IsStrongGeneric`: Trivial inertia plus the stronger eigenvalue predicate over k̄.
- `strongGeneric_generic`: Forget the ratio-1 exclusion.
- `strongGeneric_distinct`: The Frobenius eigenvalues have no repeated roots.
- `strongGeneric_arbitrary_local_field`: The definition uses q=|k_L| and specializes to Definition 1.9 for every finite L/Q_p.

Tests: `strongGeneric_not_repeated` — Over F_3, q=2, (1,1) is ACC+-generic but not strong-generic; `strongGeneric_distinct_nonratio` — Over F_7, q=2, (1,3) is strong-generic: the two ordered ratios are 3 and 5; `strongGeneric_rank_one` — Every single nonzero eigenvalue is strong-generic; `strongGeneric_non_Qp` — For an unramified quadratic L/Q_2 and ℓ=3, use q=4≡1; the ratio-1 clause remains explicit.

Requires: [AG2.7: Local residual genericity](#the-residual-ratio-condition-for-taylor-wiles-primes).

Sources: [CS](#source-cs), Definition 1.9, printed p.652; [Liu](#source-liu), Definition D.1.2, footnote 37, printed p.365.

<a id="infinitely-many-decomposed-generic-primes"></a>

**Infinitely many decomposed generic primes.** If r:G_F→GL_n(k) is continuous and decomposed generic, there are infinitely many such rational primes, and witnesses can avoid any specified finite set. Let K be a normal closure of F, the field cut out by r and Q(ζ_ℓ). A witness determines a conjugacy class in Gal(K/Q) whose restriction fixes F, fixes the all-place eigenvalue ratios and fixes p mod ℓ. Chebotarev gives a positive Dirichlet-density set of primes with this class. Every such unramified prime is again a witness.

Requires: [AG2.7: decomposed genericity](#existential-decomposed-genericity); `ArithmeticGaloisRepresentations:R01.5`.

Sources: [ACC+](#source-accplus), Lemma 4.3.2, pp.972–973.

<a id="genericity-transfer-and-projective-qualification"></a>

**Genericity transfer and projective qualification.** The eigenvalue nonratio predicate is invariant under permutation, nonzero scalar multiplication, inversion and coefficient-field extension. Local representation genericity is invariant under conjugacy, semisimplification of an already unramified representation, and unramified scalar twists. An arbitrary ramified scalar twist preserves the projective representation but can destroy local unramifiedness. The global existential decomposed-generic condition is invariant under finite residual-character twists: use infinitely many witnesses and avoid the finite ramification set of the character. Strong local genericity obeys the same rules with distinctness retained.

Requires: [AG2.7: Local residual genericity](#the-residual-ratio-condition-for-taylor-wiles-primes); [AG2.7: Strong local decomposed genericity](#strong-local-decomposed-genericity); [AG2.7: infinitely many generic primes](#infinitely-many-decomposed-generic-primes); `mathlib:Matrix.charpoly_units_conj`; `mathlib:Matrix.charpoly_map`.

Sources: [ACC+](#source-accplus), After Definition 4.3.1, p.972; Lemma 4.3.2.

<a id="finite-exceptional-residual-genericity-for-relevant-pi"></a>

**Residual genericity outside finitely many λ.** For a relevant Π with a strong coefficient field E in Liu et al., choose the regular unramified place used in Chenevier–Harris’s argument, with distinct algebraic Satake roots α_i and α_i≠qα_j. After a finite extension of E containing these roots, exclude the finitely many coefficient places dividing denominators, roots, α_i−α_j or α_i−qα_j. Their reductions are distinct and nonratio. Liu Appendix D, Corollary D.1.4 then uses Chebotarev to obtain a place w split in F/F⁺ that is locally generic for the reduced Hecke eigencharacter outside this finite set. The cohomological concentration conclusion has its own F^+≠Q and level hypotheses and belongs to the Igusa/torsion consumer. This conclusion does not itself provide the completely split rational prime, generic at every v above it, required by the ACC+ global predicate; that stronger witness needs its separate Chebotarev hypotheses.

Requires: [AG2.6: uniform strong realization](#uniform-strong-realization-for-polarized-systems); [AG2.7: Hecke ideal independence](#residual-hecke-ideal-independence); [AG2.7: Strong local decomposed genericity](#strong-local-decomposed-genericity); `ArithmeticGaloisRepresentations:R01.5`.

Sources: [Liu](#source-liu), Corollary D.1.4, printed p.368; Remark 3.2.6.

<a id="good-prime-characteristic-zero-export"></a>

**Good-prime characteristic-zero export.** GoodPrimeExport(π) consists of the imported R_π carrier, its finite coefficient field and common S_π/P_v data, the chosen λ-member interfaces, and the proved good-Frobenius comparison maps. It forgets branch-specific admissibility/purity and contains no assertion of a full bad-place WD parameter. It is an interface wrapping the supplier carrier, not a new compatible-system definition.

API:

- `GoodPrimeExport`: Wrap R_π with its good comparison maps.
- `goodPrimeExport_member`: Retrieve the λ-member and good Frobenius theorem.
- `goodPrimeExport_coeffChange`: Use supplier coefficient change, with identity and composition laws.

Tests: `goodPrimeExport_character` — At n=1 it is the algebraic-character good-prime package; `goodPrimeExport_polynomial` — For a weight-k classical overlap its polynomial is X²−a_qX+ψ(q)q^{k−1}; `goodPrimeExport_not_fullWD` — The package cannot supply N at a ramified place without branch evidence.

Requires: [AG2.6: automorphic compatible system](#compatible-system-of-pi).

Sources: [ACC+](#source-accplus), §7.1, pp.1093–1094.

<a id="nonselfdual-hodge-and-monodromy-bound-export"></a>

**Nonselfdual Hodge and monodromy-bound export.** NonselfdualComparisonExport(π) for an arbitrary regular algebraic cuspidal π over CM F wraps GoodPrimeExport with the AHTW de Rham comparison, full labelled Hodge multiset, ss WD comparison and F-ss monodromy upper bound at every v|ℓ. It also exposes spherical crystallinity and Iwahori semistability with the stated local hypotheses. It does not contain a polarization, purity theorem or full ramified N equality. The output is the strongest nonselfdual coefficient-prime interface supplied by AHTW v1, rather than the good-prime interface alone.

API:

- `NonselfdualComparisonExport`: Combine the AHTW coefficient-prime maps with the common carrier.
- `nonselfdualExport_goodPrime`: Forget to GoodPrimeExport with the same members.
- `nonselfdualExport_hodge`: Retrieve de Rham comparison and the labelled multiset at every v|ℓ.
- `nonselfdualExport_wdBound`: Retrieve ss comparison and the F-ss monodromy upper bound, retaining their distinct strengths.

Tests: `nonselfdualExport_rank_one` — For an algebraic character the Hodge multiset has one element and N=0; `nonselfdualExport_good_crystalline` — At a spherical coefficient-prime place the upper bound N=0 and trivial inertia recover the crystalline supplier criterion; `nonselfdualExport_not_polarized_fullWD` — The export supplies neither a polarized pairing nor full ramified WD equality from an ss comparison alone.

Requires: [AG2.7: Good-prime characteristic-zero export](#good-prime-characteristic-zero-export); [AG2.6: nonselfdual de Rham comparison](#all-cm-de-rham-and-semisimplified-coefficient-comparison); [AG2.6: nonselfdual monodromy bound](#nonselfdual-coefficient-prime-monodromy-bound); [AG2.6: Nonselfdual spherical and Iwahori admissibility](#all-cm-crystalline-and-iwahori-corollary).

Sources: [AHTW](#source-ahtw), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6.

<a id="polarized-hodge-and-wd-export"></a>

**Polarized Hodge and Weil–Deligne export.** PolarizedComparisonExport(π,χ) wraps GoodPrimeExport with the actual polarization isomorphisms and multiplier, the corrected total-odd sign, the labelled Hodge comparison maps, and full F-ss WD comparison at all finite places, including coefficient-prime places. It supplies the proved pure/strict branch predicates. Forgetful maps return the good-prime package, the supplier’s polarized system and each local comparison; they do not insert residual enormousness or an ordinary refinement.

API:

- `PolarizedComparisonExport`: Combine the established polarized branch comparisons.
- `polarizedExport_goodPrime`: Forget to GoodPrimeExport, preserving all good polynomials.
- `polarizedExport_local`: Retrieve labelled Hodge and full WD comparison maps at a chosen finite place.
- `polarizedExport_supplier`: Return precisely the R24.5 pure/polarized predicates with normalization conversion.

Tests: `polarizedExport_weight_k` — For a weight-k base-change form it returns H={0,k−1}, W=k−1 and determinant ε^{1−k}r_ψ; `polarizedExport_forget` — The forgotten good package has exactly the same λ-members and P_v; `polarizedExport_nonselfdual_rejected` — AHTW ss comparison plus an N bound does not fulfill a full-WD comparison field.

Requires: [AG2.7: Good-prime characteristic-zero export](#good-prime-characteristic-zero-export); [AG2.6: full polarized comparison](#full-polarized-comparison-at-the-coefficient-prime); [AG2.6: Totally real polarized coefficient-prime descent](#totally-real-polarized-coefficient-prime-descent); [AG2.6: system purity/polarization](#polarized-compatible-system-strictly-pure).

Sources: [BLGGT](#source-blggt), Theorem 2.1.1, pp.33–34; §5.1, pp.63–65; [Caraiani-p](#source-caraiani-p), Theorem 1.1, pp.1–2.

<a id="unitary-discrete-parameter-export"></a>

**Unitary discrete-parameter export.** In the compact unitary setting of CS Corollary 5.5.5, export the semisimple representation r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i attached to an endoscopic discrete parameter of ranks n_1+n_2=n, with each ε_i the algebraic character of |det|^{(n_i−n)/2 }ϖ(N_{F/𝒦}∘det)^{ε(n−n_i)}, and ε(m)≡m mod 2. The polynomial at every v over q∈Spl_{𝒦/Q} outside S∪{ℓ} is the explicit degree-n Hecke polynomial. Keep the constituent labels, algebraic twist maps, and the away-ℓ local comparison from Remark 5.5.6. This representation need not be globally irreducible and carries no coefficient-prime comparison beyond what its constituents separately prove. Here F=F⁺·𝒦 with 𝒦 the imaginary quadratic field of CS §5.1; the printed F₀ in Corollary 5.5.5 denotes this same imaginary quadratic field.

Assume also: For the literal CS Corollary 5.5.5 application, retain the §5.1 unitary datum and the given irreducible admissible Π^S in the indicated BCS supercuspidal alternating Igusa summand. Its identification with the labelled pure automorphic transfer parameter is supplied as input; this export does not prove an Igusa trace or concentration theorem. The constituent Π_i are regular C-algebraic, θ-stable isobaric representations supplied by that parameter, and r_i has rank n_i , not n. The source setup has F⁺≠Q, quasi-split finite unitary group, and the ramified rational primes of F contained in Spl_{F/F⁺}; these source restrictions are retained for that literal application.

API:

- `UnitaryDiscreteExport`: Build the labelled direct sum with explicit algebraic character twists.
- `unitaryDiscreteExport_constituent`: Retrieve r_i, ε_i and its inclusion into the direct sum.
- `unitaryDiscreteExport_goodPolynomial`: Its good polynomial is the product of the twisted constituent polynomials and the specialized degree-n Hecke polynomial.

Tests: `unitaryDiscreteExport_two_characters` — For n_1=n_2=1, at good v with twisted values β_1,β_2 the polynomial is (X−β_1)(X−β_2); `unitaryDiscreteExport_rank_additivity` — The direct-sum dimension is n_1+n_2, with neither twist changing dimension; `unitaryDiscreteExport_not_cuspidal_irreducibility` — A two-character endoscopic sum cannot certify global irreducibility.

Requires: [AG2.2: Caraiani–Scholze discrete normalization](#cs-discrete-polarization-normalization); `AutomorphicGaloisRepresentationsPartII:AG2.5`; [AG2.0: algebraic Galois characters](#galois-character-of-an-algebraic-hecke-character); `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`; `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`.

Sources: [CS](#source-cs), Corollary 5.5.5 and Remark 5.5.6, printed pp.745–746.

<a id="lattice-residual-polynomial-export"></a>

**Lattice and residual polynomial export.** ResidualPolynomialExport(π,λ) contains a finite p-adic realization E, an explicitly chosen stable O_E-lattice, its continuous integral realization, the semisimple residual member, the coefficient-reduction maps on every good P_v and the comparison isomorphisms under another lattice or coefficient extension. It exports m_{π,λ} and its Galois-type evidence; non-Eisensteinness and decomposed genericity are additional hypotheses or projections only when proved. The chosen lattice is retained as data and never named canonical.

API:

- `ResidualPolynomialExport`: Assemble finite realization, chosen lattice and reduction maps.
- `residualExport_compareLattice`: Different chosen lattices give isomorphic semisimple residual members, not necessarily isomorphic reductions.
- `residualExport_maxIdeal`: Retrieve m_{π,λ} with Galois-type evidence.
- `residualExport_charpoly`: The integral/residual Frobenius square commutes by Matrix.charpoly_map.

Tests: `residualExport_rank_one` — Reduction of an integral character is its residual character; `residualExport_diagonal_mod3` — The diagonal integral test reduces X²−3X+2 to X²+2 modulo 3; `residualExport_unipotent_lattices` — The two Z_5-unipotent lattices have unequal reductions but equal semisimplifications; the package cannot identify the raw reductions.

Requires: [AG2.7: residual representation](#residual-representation-of-pi); [AG2.7: good polynomial reduction](#good-polynomial-reduction); [AG2.7: Hecke ideal independence](#residual-hecke-ideal-independence); `mathlib:Representation.IsSemisimpleRepresentation`.

Sources: [ACC+](#source-accplus), Definition 2.3.6, p.938; §7.1, p.1085.

<a id="rank-two-residual-comparison-with-r19"></a>

**Rank-two residual comparison with R19.** For the regular classical/Hilbert exact overlap, fixed λ and the characteristic-zero dual/twist normalization of AG2.6, semisimple reduction commutes with the identification of the AG2 and R19 λ-members. In the classical normalization r̄_AG2≅r̄_R19^∨; the geometric good polynomial is X²−ā_qX+ψ̄(q)q^{k−1}. The associated maximal Hecke ideals agree under the normalized Hecke algebra identification. R19’s explicit geometry and lattice calculations remain supplier tools; only the semisimple isomorphism class, not a preferred lattice, is compared.

Requires: [AG2.6: Rank-two comparison with R19](#rank-two-comparison-with-r19); [AG2.7: residual representation](#residual-representation-of-pi); [AG2.7: Hecke ideal independence](#residual-hecke-ideal-independence).

Sources: [ACC+](#source-accplus), Definition 2.3.6 and following duality statement, p.938.

## Bibliography

<a id="source-blggt"></a>

**BLGGT.** Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4). arXiv:1010.2561v4 (2013), published Annals 179 (2014), 501–609; locators here use arXiv/article pages.

<a id="source-accplus"></a>

**ACC+.** Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals 197 (2023), 897–1113, author copy with journal pagination; printed page = PDF page + 896.

<a id="source-patrikis"></a>

**Patrikis.** Stefan Patrikis, [On the sign of regular algebraic polarizable automorphic representations](https://arxiv.org/pdf/1306.1242v2). arXiv:1306.1242v2 (2014), published Math. Ann. 362 (2015), 147–171; arXiv pages.

<a id="source-hltt"></a>

**HLTT.** Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf). author copy rigcoh.pdf, published Res. Math. Sci. 3 (2016); article pages 1–234.

<a id="source-ch"></a>

**CH.** Gaetan Chenevier and Michael Harris, [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf). author copy ConstructionII.pdf, published Camb. J. Math. 1 (2013), 53–73; author-copy pages 1–15.

<a id="source-varma"></a>

**Varma.** Ila Varma, [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520v1). arXiv:1411.2520v1 (2014); arXiv pages.

<a id="source-caraiani-away"></a>

**Caraiani-away.** Ana Caraiani, [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188v1). arXiv:1010.2188v1 (2010), published Duke Math. J. 161 (2012), 2331–2413. The full tensor-square purity argument uses the published author copy lgc1.pdf, pp.2410–2411; other locators specify arXiv pages.

<a id="source-caraiani-p"></a>

**Caraiani-p.** Ana Caraiani, [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1). arXiv:1202.4683v1 (2012), published Algebra Number Theory 8 (2014), 1597–1646; arXiv pages unless explicitly marked published.

<a id="source-shin"></a>

**Shin.** Sug Woo Shin, [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf). author copy StableGal.pdf, 61 pages, published Annals 173 (2011), 1645–1741; author-copy pages.

<a id="source-shin-igusa"></a>

**Shin-Igusa.** Sug Woo Shin, [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf). author copy StableIgusa.pdf, published Duke Math. J. 146 (2009), 509–568; author-copy pages.

<a id="source-ty"></a>

**TY.** Richard Taylor and Teruyoshi Yoshida, [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357v2). arXiv:math/0412357v2 (2005); arXiv pages.

<a id="source-gk"></a>

**GK.** Elmar Grosse-Klönne, [Rigid analytic spaces with overconvergent structure](https://arxiv.org/pdf/1408.3329). arXiv:1408.3329; author-version pages.

<a id="source-cs"></a>

**CS.** Ana Caraiani and Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals 186 (2017), 649–766; journal pages.

<a id="source-nt"></a>

**NT.** James Newton and Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2). arXiv:2212.03595v2 (2025); arXiv pages.

<a id="source-liu"></a>

**Liu.** Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Invent. Math. 228 (2022), 107–375; journal pages.

<a id="source-bcgp21"></a>

**BCGP21.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publ. Math. IHÉS 134 (2021), 153–501; journal pages. The general maximal-rank uniqueness claim is not used in place of pure WD uniqueness.

<a id="source-bcgp25"></a>

**BCGP25.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645). arXiv:2502.20645v1 (2025); arXiv pages.

<a id="source-bc"></a>

**BC.** Joël Bellaïche and Gaëtan Chenevier, [The sign of Galois representations attached to automorphic forms for unitary groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf). Compositio Math. 147 (2011), 1337–1352; journal pages.

<a id="source-hsbt"></a>

**HSBT.** Michael Harris, Nicholas Shepherd-Barron and Richard Taylor, [A family of Calabi–Yau varieties and potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf). Annals 171 (2010), 779–813; journal pages.

<a id="source-ct"></a>

**CT.** Laurent Clozel and Jack A. Thorne, [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download). accepted Cambridge repository copy (2017); author-copy pages.

<a id="source-ahtw"></a>

**AHTW.** A’Campo, Hevesi, Thorne and Whitmore, [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1). arXiv:2607.11763v1 (13 July 2026), unrefereed preprint; arXiv pages.

<a id="source-cg"></a>

**CG.** Calegari and Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Math. J. 169 (2020), 801–896; locators use the author copy Siegel.pdf.

<a id="source-pilloni"></a>

**Pilloni.** Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), 1647–1807; locators use the author copy complexhidatheorygsp4.pdf.

<a id="source-caraiani-p-published"></a>

**Caraiani-p-published.** Caraiani, [Monodromy and local-global compatibility for l = p (published version)](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf). Algebra Number Theory 8 (2014), no.7, 1597–1646; journal pages. The linked PDF includes two cover pages (printed page = PDF page + 1595).
