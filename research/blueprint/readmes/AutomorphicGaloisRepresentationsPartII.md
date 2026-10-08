# Galois representations attached to regular algebraic automorphic representations of GL_n

## Purpose and scope

This roadmap constructs the Galois representations attached to regular algebraic cuspidal automorphic representations of GL_n, then identifies their geometric, local and residual arithmetic properties. Its input includes the ground number field, an automorphic representation, its labelled algebraic weight, a coefficient-prime embedding and, in the polarized branch, an algebraic multiplier. Its outputs distinguish attachment at good places, coefficient-prime admissibility, Weil–Deligne comparison, compatible systems and residual Hecke ideals. Each output carries the hypotheses under which it is proved.

The historical identifier `AutomorphicGaloisRepresentationsPartII` and the declaration namespace `TauCeti.AutomorphicGalois` remain stable. Accepted [RS-12](../restructure/RS-12.result.json) keeps this general-rank roadmap separate from the classical and Hilbert rank-two roadmap. Early compact-unitary cohomology here supplies the local-correspondence construction; later layers compare their exact rank-two specializations with R19. The two directions are organized at the level of stages and nodes.

The polarized branch includes the conjugate-self-dual cohomological cuspidal case over CM fields and its algebraic-character twists, with the stated essentially self-dual totally real descent. The nonselfdual existence and away-prime comparison branch has the totally real or CM scope of HLTT and Varma. The stronger nonselfdual coefficient-prime theorem is the CM theorem of A’Campo–Hevesi–Thorne–Whitmore. A selected two-block unitary endoscopic parameter gives a semisimple sum with labelled constituents and parity corrections; that sum need not be globally irreducible. The GSp₄ comparison entries describe specialized conditional interfaces pending the dedicated owner identified below.

This assembled planning pass contains 120 nodes, 142 API entries, 107 packet tests and 46 proposed planets. AG2.1 is a process aggregate with no independent mathematical node. Its two producers, and the remaining layers, are **planned**, with precise supplier and source gaps. Every implementation status is **unchecked**. The reviewed [AG2.0 packet](../packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json) and [AG2.6 packet](../packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) remain the structured records; the [combined suggested file](../suggested/AutomorphicGaloisRepresentationsPartII.lean) proposes Lean forms for the expressible components.

## Boundaries and prerequisites

The [reviewed library audit](../../../data/library-coverage.json) supplies the baseline inventory. Reusable representation, cohomology, Hecke and period objects are imported from their owners. The roadmap specializes them to its automorphic constructions and proves agreement on overlaps.

| Owner | Boundary and interface |
| --- | --- |
| AutomorphicFormsOnReductiveGroups AF.1/AF.4 | Automorphic representations, algebraic coefficient representations, infinitesimal characters, rationality and coefficient conjugation. AG2 chooses and applies these objects. |
| ArithmeticGaloisRepresentations R01 and G7 | Continuous representations, lattices, semisimple recognition and descent, WD operations and purity, actual pairings, multipliers and residual polarization. AG2 proves the automorphic instances. |
| IntegralHeckeAndGaloisDeterminants IHG.3/IHG.4 | Integral spherical polynomial and nonreduced determinant-law interpolation. AG2 proves the HLTT congruence witnesses, continuity and factor-separation specialization; density alone does not prove integrality. |
| EndoscopicTransferAndUnitaryTraceComparison ET.5/ET.6/ET.7a | Igusa stabilization, local correspondences, and pure global transfer/base change. Raw compact-unitary geometry from AG2.1a precedes ET.6. An earlier generic fixed-point theorem is still required at the EDC.8/ET.5 boundary. |
| SemisimpleAlgebras and SchurWeyl | Isotypic decomposition and rational Young idempotents. The [SchurWeyl link](../links/tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.json) supplies the normalized rational identity. AG2.1a constructs its map to the actual correspondence algebra, graded permutation signs, degree and Tate twist. |
| PadicHodgeTheory R06; CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.6 | Period comparison and descent, bounded-family extensions, the requested two-boundary log-crystalline sequence and purity inference. AG2 supplies the actual projected automorphic summands and concentration arguments. |
| GlobalNumberFields and ClassFieldTheory | Algebraic Hecke characters, reciprocity and local-global extension prescriptions. S-general/Grunwald–Wang extensions are requested from the existing direction, with a Part II refinement if needed. |
| AutomorphicGaloisRepresentations R19.1–R19.6 | Classical/Hilbert geometry, systems, local and residual comparisons, and weight one remain there. AG2’s subsequent regular-weight comparisons import those exact results and prove uniqueness on the shared domain. |
| PotentialModularityAndCompatibleSystems R24.5:operations | One early compatible-system data carrier and its operations, independent of late potential-modularity existence. The current supplier’s conflict between raw data and strength predicates remains open. AG2 assembly is a conditional import of the corrected interface. |
| GSp4LocalLanglandsAndGaloisRepresentations (proposed); ML.4 | The proposed owner carries the specialized Calegari–Geraghty/Pilloni/BCGP constructions and comparisons. It has no atlas stage id yet. ML.4’s transfer and normalization requests are retained provisionally; AG2.2 does not supply a new GSp₄ theory. |
| Potential automorphy, Igusa varieties, torsion cohomology and lifting consumers | AG2.7 exports the strongest proved branch-specific package. Consumers retain their independent residual-image, level, field and auxiliary-prime hypotheses. Enormity and other residual image conditions keep their existing owners. |

## Conventions

Let n≥1. A dominant algebraic weight a has weakly decreasing integer coordinates a_{τ,i}; negative coordinates are allowed. The infinitesimal character of π_τ is that of Ξ_a∨. The highest-weight representation Ξ_a itself is used for algebraic coefficients, so these two roles cannot be interchanged. The sources’ one-indexed coordinates run from 1 to n; Lean’s `Fin n` coordinates run from 0 to n−1.

Artin reciprocity sends a uniformizer to **geometric Frobenius**. The cyclotomic character ε_ℓ has ε_ℓ(Frob_v)=q_v⁻¹ and HT(ε_ℓ)=−1. The geometric good-place polynomial is

P_v(X)=Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}, with t_{v,0}=1.

The sign of the constant coefficient is (−1)^n. In unitary Satake coordinates its roots are q_v^{(n−1)/2}α_j; the integral coefficient formula requires no choice of square root. Local comparison uses rec^T(π_v)=rec(π_v⊗|det|^{(1−n)/2}). The early polynomial dictionary is rec-free; agreement with local Langlands is the subsequent AG2.5 output, even though its node retains a historical AG2.0 identifier. Arithmetic Frobenius uses the normalized reciprocal polynomial.

The labelled Hodge multiset is H_τ(a)={a_{τ,i}+n−i : 1≤i≤n}. The zero-indexed formula is a(i)+n−1−i. A classical weight-k form with a=(k−2,0) gives {k−1,0}. Its sum records the determinant weight but does not determine the multiset. The period supplier uses HT(ε)=+1; the exposed numerical labels are negated through the explicit convention dictionary. The filtered period modules and monodromy maps require their own comparison, with no implicit dualization. Algebraic norm twists and their cyclotomic characters use this same dictionary.

For a_{τ,i}+a_{τc,n+1−i}=w, the purity weight is W=w+n−1. The polarized multiplier is μ_λ=ε_ℓ^{1−n}r_{χ,λ}, and r_χ has purity weight 2w. At a real place the sign is μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1). Thus χ_v(−1)=(−1)^{n+w} gives total oddness. The algebraic-weight factor in the confirmed AG2.0/E2 correction is retained throughout.

Write M_π for the rationality field of π^∞ and the good Frobenius coefficients; use a finite local E_λ/Q_ℓ to realize one member and choose a lattice; use a possibly enlarged global E⊂ℂ for a strong coefficient field whose completions realize all members. The smallest trace field need not split the Schur-index obstruction. Chenevier–Harris Proposition 3.2.5, p.12, uses two regular good Frobenius polynomials of different residue characteristics to construct a common realization field. The AG2.3 theorem now names its AG2.6 regular Hodge input; the AG2.6 strong-field export reuses that theorem. These node dependencies are acyclic despite their numerical layer order. Liu’s minimal-field geometric consequence retains Hypothesis 3.2.10, pp.145–146.

Good polynomial attachment, equality of semisimplified Weil parameters, monodromy dominance, and full Frobenius-semisimple WD equality are distinct outputs. The polarized branch obtains full equality with N. The arbitrary nonselfdual CM branch at v|ℓ obtains de Rham admissibility, the full labelled Hodge multiset, semisimplified comparison and an N upper bound; spherical places are crystalline and Iwahori places semistable. It does not assert general ramified monodromy equality. Integral reduction first realizes the representation over a finite local field, chooses a stable lattice and semisimplifies the reduction. Lattice independence concerns that semisimple isomorphism class; stability supplies no self-dual integral pairing.

ACC+ local residual genericity requires trivial inertia and α_i/α_j≠q for every ordered pair i≠j, counting eigenvalues with multiplicity. Repeated roots can satisfy it. The stronger CS condition also excludes ratio 1. A decomposed generic rational prime p≠ℓ splits completely in F and satisfies the local condition at **every** v|p. Absolute irreducibility is a separate requirement. Projective ratio invariance preserves local genericity only with the unramified scalar-twist condition; a global finite twist has a finite ramification set to avoid when choosing primes.

The imaginary quadratic field of the CS §5.1 setup is denoted 𝒦 in both discrete-transfer entries, including the norm F→𝒦 and its rational splitting condition. This unifies the earlier K glyph and applies the inherited correction of the undefined F₀ in Corollary 5.5.5. E-number references are qualified by packet part in the source-correction appendix, because the two local numbering schemes overlap.

## Sources and mathematical route

The node entries below retain their own statements, hypotheses, proof plans and theorem/section/page references. They are organized by the mathematical outputs they serve. The final source catalog records the reviewed editions and hashes; it is not a summary of each paper. The principal routes are:

| Route | Sources and controlling results |
| --- | --- |
| Polarized construction and signs | Shin’s compact-unitary and Igusa results; Chenevier–Harris Theorems 1.4, 2.3 and 3.2.3, pp.5–12; BLGGT Theorem 2.1.1 and §5.1; Bellaïche–Chenevier Theorem 1.2/Corollary 1.3, p.1339; Patrikis’s sign analysis. |
| Nonselfdual existence | HLTT ordinary boundary rigid cohomology, approximation and Theorem A; its fixed compactification data and integral determinant extraction retain the recorded limitations. |
| Away-prime local comparison | Varma Theorems 1.1–1.2 and the isotypic monodromy order; Taylor–Yoshida Lemma 1.4(2)–(4), pp.6–7; Caraiani’s tensor-square concentration and Theorem 7.4, published pp.2410–2411. |
| Coefficient-prime comparison | Caraiani Theorem 1.1, Proposition 4.4, Theorem 4.6 and Proposition 5.1, arXiv pp.1–2, 29–32; AHTW v1 Theorem 1.2.1/Corollary 1.2.2, pp.5–6, Theorem 3.3.6, p.34, and Corollary 6.0.6, pp.111–112. AHTW v1 is an unrefereed preprint. |
| Residual and consumer interfaces | ACC+ Definition 4.3.1/Lemma 4.3.2, pp.972–973; CS Definition 1.9 and Corollary 5.5.5/Remark 5.5.6, pp.745–746; Liu Definition 3.2.5/Hypothesis 3.2.10, pp.145–146, and Appendix D; Newton–Thorne Theorem 5.1/Lemma 5.2, p.38. |

## Layer overview

The layers are presented in atlas order. Within them, the prerequisite ids determine proof order. AG2.1a produces actual geometric objects and raw traces before automorphic comparison; AG2.1b subsequently extracts representations. AG2.2’s final discrete sums use the arbitrary-regular AG2.3 blocks. Period comparison at AG2.6 supplies the later common-field argument; no such admissibility is an input to raw cohomology or HLTT existence.

| Layer | Mathematical output | Nodes | Coverage |
| --- | --- | ---: | --- |
| [AG2.0](#ag20-algebraic-weights-fields-of-rationality-and-normalization) | Weights, characters, attachment and the early Frobenius dictionary | 14 | planned |
| AG2.1 | Aggregate of the two producers below | 0 | source_decomposed |
| AG2.1a | Compact PEL/Kuga–Sato coefficients, raw cohomology, fixed-point traces and Kottwitz data | 9 | planned |
| AG2.1b | Mantovan/Ext and Igusa trace comparison, concentration and actual constituents | 6 | planned |
| AG2.2 | Algebraic polarization twists, descent and selected discrete sums | 5 | planned |
| AG2.3 | Definite families, determinant interpolation, effective patching, arbitrary regularity, sign and common field | 12 | planned |
| AG2.4 | Ordinary boundary rigid cohomology, Hasse approximation, uniform congruences and HLTT extraction | 14 | planned |
| AG2.5 | Post-construction normalization, semisimple comparison, monodromy order, tensor-square purity and full polarized compatibility | 17 | planned |
| AG2.6 | Coefficient-prime comparison, compatible-system assembly, strong fields and exact specializations | 23 | planned |
| AG2.7 | Finite local realization, semisimple residuals, Hecke ideals, genericity and arithmetic exports | 20 | planned |

The raw geometric realization, the separate at-coefficient-prime tensor-square realization, bounded family comparison and the AHTW boundary/cohomology interfaces retain exact unmet supplier contracts. The cross-part precision repairs identify available components without closing these gaps. All requests, remaining gaps and owner proposals are collected in the [assembly handoff](../handoff/ASM-AutomorphicGaloisRepresentationsPartII.md).

## Suggested Lean boundaries

The combined suggested file elaborates at the pinned Mathlib with only sorry warnings. It uses one namespace, one import block and the AG2.0 definition of expectedHodgeTate throughout. The AG2.0 omission ledger retains its 84 API entries and 58 tests; unavailable carriers are described rather than invented. It contains the AG2.6–AG2.7 part’s 38 unique main declaration names, 58 API names and 49 tests as labelled typed examples. These are suggested forms, with implementation status **unchecked**. The definitions use concrete bodies, Mathlib semisimplicity and Mathlib irreducibility over an algebraic closure. No arbitrary proposition field, empty predicate or substitute automorphic/Hecke carrier fills a missing hypothesis.

System and its assembly/member projections are universally supplied parameters for the single corrected R24 data carrier. The local prime predicate uses the entire externally supplied nonempty place fiber, with e=f=1 and local genericity at every place; the singleton test fiber is only the Q specialization. Its coefficient characteristic is explicitly constrained to ℓ. Characteristic-zero and finite-residue-field recognition hypotheses are retained where algebraic semisimple uniqueness uses them.

| Suggested form | What the elaboration establishes | What remains outside its statement |
| --- | --- | --- |
| Concrete definition/API fragment | The actual homomorphisms, matrices, polynomials and proof fields have compatible types | Automorphic, geometric, topological and number-field provenance listed at the node |
| Output signature with omitted hypotheses | The target conclusion has the intended Hodge, purity or intertwiner shape | Necessary unavailable hypotheses; such a signature is not a valid assertion for arbitrary input matrices |
| Labelled example | The indicated algebraic portion uses the named definition or supplied realization | Full class-field, lattice, period or automorphic construction when explicitly omitted |
| Shared comparison component | Existing signatures/examples check the overlap or loss of information | A second construction of the supplier’s theory |

The rank-one good and nonselfdual tests inhabit their actual wrappers. The polarized weight-k test reads the full Hodge multiset from a wrapper. The unitary two-character sum explicitly fails irreducibility. The rational-trace test uses quaternionic matrices with no Q model to exhibit a descent obstruction. Partial examples state their limits: for instance, the two unipotent lattice examples check unequal raw reductions at t=1 with equal polynomials, while the Z₅ lattice construction itself is absent.

### Supplier interfaces for the later layers

The following entries are organized by the AG2 consumer outputs, not by sections of any source. Each gives the full planned statement and proof route, direct supplier inputs, API and tests, source locators, and the narrower suggested Lean component. No source passage is reproduced.

| Supplier | Interface used here |
| --- | --- |
| R24.5:operations | Conditional single raw-data carrier; separate weak/very weak/extremely weak, pure and polarized predicates; assembly, weakening and linear operations |
| R19.3 and R19.5 | Fixed classical/Hilbert systems and full coefficient-prime comparison on the exact regular-weight overlap |
| PadicHodgeTheory R06.2, R06.4, R06.5 | Period exactness/base change, bounded-family extension, ordinary filtration and projector-compatible geometric comparison |
| CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.6 | Requested two-boundary extension and weight/purity inference after projected diagonal concentration |
| ArithmeticGaloisRepresentations G7 | Requested residual polarization through semisimplification and CM conjugation extension, before the polarized deformation problem |
| ArithmeticGaloisRepresentations R01.1, R01.5 | Finite local realization/lattices and existing arbitrary-rank recognition; requested precise regular-Frobenius descent splitting |
| AG2.1a | Two separate requests: raw projector-compatible cohomology before comparison; Caraiani tensor-square and closed-stratum concentration |
| AG2.0, AG2.2–AG2.5 | Weight/normalization, algebraic twists, bounded families, boundary analysis and local comparison |
| ET.6; ET.7a | Local correspondence; pure global transfer and controlled solvable descent, respectively |
| IHG.3 | Integral unramified Hecke algebra, eigencharacters, residue quotient and involution APIs |
| AF.4; ML.4 | Automorphic coefficient conjugation and GSp4 transfer/Harish–Chandra/Satake normalization |
| PA.1; Igusa/torsion infrastructure (consumers) | Arithmetic lifting and concentration with their separate residual-image, level and field hypotheses |

## AG2.0. Algebraic weights, fields of rationality and normalization

The input is the automorphic representation, its labelled algebraic weight and its multiplier, with a specified complex–ℓ-adic coefficient isomorphism. The coefficient representation is Ξ_a and the archimedean infinitesimal character is that of Ξ_a∨. Geometric Frobenius and geometric Artin reciprocity are fixed throughout. Thus the cyclotomic character has value q_v⁻¹ at geometric Frobenius and Hodge–Tate number −1. An algebraic norm twist acts by that character. Arithmetic Frobenius instead gives the normalized reciprocal polynomial.

The normalized Satake calculation and integral Hecke polynomial are imported from IHG.3. In one-indexed notation the polynomial is Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}, with t_{v,0}=1. Its roots are q_v^{(n−1)/2}α_j in the unitary Satake convention. The square root needed to describe α_j does not belong to the integral polynomial's coefficients. These are polynomial identities before a local Langlands correspondence exists. The correspondence is compared in AG2.5.

The field fixed by automorphisms preserving the finite part π^∞ is the automorphic rationality field; the finite common field over whose completions r can be represented is a different target, placed after construction in AG2.3. Schur index makes the distinction necessary. The examples include rank-one characters, the rank-two weight-k polynomial and a nontrivial similitude coefficient ν. The central exponent a₀ survives both purity weight and labelled Hodge–Tate formulas.

Coverage: **planned**. Every stage target is an own declaration, an exact imported contract or an explicitly identified ownership/source gap; planned does not mean closed or implemented.

Requirements for closure:

- Close the AF.1/AF.4 and character/PHT specialization contracts; verify CHT08 Lemma 4.1.4 and the p-adic unit prescriptions. The finite realization-field target is the AG2.3 late theorem, distinct from the early trace-field theorem.

Atlas planets: Regular algebraic automorphic representation; Polarized automorphic representation; Rational Hecke polynomials; Crystalline twisting character.

### Dominant weights (ℤⁿ)^{Hom(F,Ω),+}, the subsets (ℤⁿ)_w for CM fields, base change of weights and the representations Ξ_a

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w` (definition; unchecked).

For a number field F, rank n≥1 and algebraically closed characteristic-zero coefficient field Ω, use the embedding-wise dominant GL_n coordinates of AF.4: a family a has a_{τ,1}≥⋯≥a_{τ,n} at each τ:F→Ω. The notation (ℤⁿ)^{Hom(F,Ω),+} denotes this specialization of the imported algebraic-weight carrier. For totally real or CM F with conjugation c, membership in (ℤⁿ)_w means a_{τ,i}+a_{τ∘c,n+1−i}=w for every τ and i. When Ω=ℂ, conjugating the target embedding gives the same condition. Restriction of embeddings defines base change: (a_{F′})_{τ,i}=a_{τ|_F,i}. Extreme regularity asks that, at some embedding, equal-sized subsets of the shifted entries {a_{τ,i}+n−i} are determined by their sums. For complex coefficients Ξ_a is AF.4’s highest-weight representation, identified with the tensor product of the GL_n representations of highest weights a_τ. The coordinate notation and Ξ_a do not introduce a second highest-weight theory.

Hypotheses: Dominance is the ordering a_{τ,1} ≥ ⋯ ≥ a_{τ,n}, with repetitions allowed; regularity of the attached Hodge–Tate numbers comes from the shift by n − i (node expected-hodge-tate-multiset), not from strictness of a. The condition defining (ℤⁿ)_w pairs τ with τ∘c and i with n + 1 − i. It is empty unless F is totally real or CM. Ξ_a is a representation of the complex group GL_n^{Hom(F,ℂ)} = (Res_{F/ℚ} GL_n)_ℂ. Its highest-weight theory is supplied by AutomorphicFormsOnReductiveGroups AF.4 (algebraic highest weights).

Uses:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`: the weight a of a regular algebraic π, through Ξ_a^∨
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`: HT_τ = {a_{ιτ,i} + n − i}
- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`: the integer w with a ∈ (ℤⁿ)_w decides the parity condition on χ

Planning API:

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

Discriminating tests:

- `TauCeti.AutomorphicGalois.DominantWeight.isInW_classical` (computation): For F = ℚ, n = 2, integer k≥2 and a = (k − 2, 0): a is dominant and lies in (ℤ²)_{k−2}.
- `TauCeti.AutomorphicGalois.DominantWeight.isInW_rank_one` (degenerate): For n = 1 every a ∈ ℤ^{Hom(F,ℂ)} is dominant, and a ∈ (ℤ¹)_w iff a_τ + a_{cτ} = w for all τ.
- `TauCeti.AutomorphicGalois.DominantWeight.not_isInW_unpaired` (non-example): For F imaginary quadratic, n = 2, a_τ = (1, 0) and a_{cτ} = (0, 0): a_{τ,1} + a_{cτ,2} = 1 but a_{τ,2} + a_{cτ,1} = 0, so a lies in no (ℤ²)_w.
- `TauCeti.AutomorphicGalois.DominantWeight.not_dominant` (non-example): (0, 1) is not dominant: a definition with a_{τ,1} ≤ ⋯ ≤ a_{τ,n} would accept it.

Construction or proof:

1. Import AF.4/algebraic-weight and identify its dominant GL_n coordinates and representation V_a with the notation a and Ξ_a. Only the polarized weight-w condition and extremely-regular subset are added here.
2. Well-definedness: dominance and membership in (ℤⁿ)_w are finitely many linear conditions on the integers a_{τ,i}.
3. The two forms of the (ℤⁿ)_w condition agree for Ω = ℂ because, for F totally real or CM, τ∘c = c∘τ for every τ: F → ℂ (Mathlib's NumberField.IsCMField.complexEmbedding_complexConj).
4. a_{F′} is dominant, and lies in (ℤⁿ)_w for the same w when F′ is again totally real or CM and a ∈ (ℤⁿ)_w, since complex conjugation on F′ restricts to that of F.

Acceptance: For integer k≥2, the classical weight-k form gives a = (k − 2, 0) at the single embedding of ℚ, which lies in (ℤ²)_{k−2}. For F imaginary quadratic and n = 1, a = (a_τ, a_{cτ}) lies in (ℤ¹)_w with w = a_τ + a_{cτ}; w can be odd, e.g. (1, 0), the weight of the Hecke character of a CM elliptic curve. Dominant algebraic GL_n weights allow negative integers. The polarized determinant pair has tuples (1,…,1) and (−1,…,−1), with w=0; imposing nonnegative coordinates as in CH’s misprint AG2.0/E7 would wrongly exclude it.

Direct prerequisites: `mathlib:NumberField.IsCMField.complexEmbedding_complexConj`, `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. Embedding-wise dominance, conjugate-coordinate weight relation and restriction of embeddings under base change.
- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. Extremely regular weights; the definition continues on the same page.

### Regular algebraic automorphic representations of GL_n(𝔸_F) and their weight

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight` (definition; unchecked).

For an automorphic GL_n(𝔸_F) representation π over a number field F, regular algebraicity means that its archimedean infinitesimal character comes from an irreducible algebraic representation of Res_{F/ℚ} GL_n. Write its weight as the unique dominant family a for which infChar(π_∞)=infChar(Ξ_a^∨). If an algebraic Hecke character ψ has identity-component infinity type ∏_τ τ(x)^{−b_τ}, tensoring π with ψ∘det changes a_{τ,i} to a_{τ,i}+b_τ. Thus an integer norm twist π⊗‖det‖^t changes every coordinate to a_{τ,i}−t.

Hypotheses: The infinitesimal character is compared with that of Ξ_a^∨, not Ξ_a; this is the convention of both BLGGT and ACC+. Regular algebraic is Clozel's C-algebraic for GL_n. It differs from L-algebraic by the twist ‖det‖^{(n−1)/2} when n is even. The C/L distinction is owned by AutomorphicFormsOnReductiveGroups AF.4 and is not re-planned here. No cuspidality, self-duality or unitarity is part of the definition.

Uses:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`: a polarized pair is regular algebraic of some weight a ∈ (ℤⁿ)_w
- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`: the class of π to which Galois representations are attached
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`: rationality is proved for regular algebraic cuspidal π

Planning API:

- `TauCeti.AutomorphicGalois.IsRegularAlgebraic` (data): π.IsRegularAlgebraic :⇔ ∃ a, π.HasWeight a.
- `TauCeti.AutomorphicGalois.HasWeight` (data): π.HasWeight a :⇔ infChar π_∞ = infChar (Ξ_a)^∨.
- `TauCeti.AutomorphicGalois.HasWeight.unique` (characterisation): π.HasWeight a → π.HasWeight b → a = b.
- `TauCeti.AutomorphicGalois.HasWeight.twist` (compatibility): π.HasWeight a → (π ⊗ ψ∘det).HasWeight (a + b) for ψ algebraic of exponents (b_τ).
- `TauCeti.AutomorphicGalois.HasWeight.twist_norm` (simp): (π ⊗ ‖det‖^t).HasWeight (a − t) ↔ π.HasWeight a.

Discriminating tests:

- `TauCeti.AutomorphicGalois.hasWeight_heckeCharacter` (computation): n = 1: ψ with ψ_∞(x) = ∏ τ(x)^{−a_τ} on (F_∞^×)⁰ has weight (a_τ).
- `TauCeti.AutomorphicGalois.hasWeight_classical` (computation): For a classical newform f of integer weight k≥2, π_f ⊗ ‖det‖^{1−k/2} has weight (k − 2, 0).
- `TauCeti.AutomorphicGalois.not_isRegularAlgebraic_odd_weight_unitary` (non-example): π_f with f of odd weight k is not regular algebraic: its infinitesimal character (±(k − 1)/2) is not a shifted integral weight.
- `TauCeti.AutomorphicGalois.hasWeight_trivial` (degenerate): The trivial representation of GL_1(𝔸_F) has weight 0.

Construction or proof:

1. Well-definedness of the weight: the infinitesimal character of Ξ_a^∨ is the W-orbit of −w₀a + ρ at each τ, and these orbits determine a (AF.4's Harish-Chandra parametrisation).
2. Twisting: the infinitesimal character of π_∞ ⊗ (ψ_∞∘det) is that of π_∞ shifted by the exponents of ψ_∞, and Ξ_a^∨ ⊗ ∏_τ τ(det)^{−b_τ} = Ξ_{a+b}^∨. For ψ = ‖·‖^t, the identity-component exponents are b_τ = −t, since ‖x‖ = ∏_τ |τ(x)| on (F_∞^×)⁰.

Acceptance: n = 1: an algebraic Hecke character ψ with ψ|_{(F_∞^×)⁰}(x) = ∏ τ(x)^{−a_τ} is regular algebraic of weight (a_τ). n = 2, F = ℚ: for a newform f of integer weight k≥2, the automorphic representation π_f (unitary normalisation) is not regular algebraic when k is odd, but π_f ⊗ ‖det‖^{1−k/2} is, of weight (k − 2, 0).

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`, `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `AutomorphicFormsOnReductiveGroups:AF.4/infinitesimal-character-of-weight`, `AutomorphicFormsOnReductiveGroups:AF.1`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. The definition of regular algebraic.
- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1, Notation, p. 908. ACC+ use the same Ξ^∨ convention for the weight.

### Conjugate self-dual, essentially conjugate self-dual and polarized automorphic representations, with the multiplier character

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation` (definition; unchecked).

Let F be totally real or CM with maximal totally real subfield F⁺ and complex conjugation c, and π an automorphic representation of GL_n(𝔸_F). (i) π is conjugate self-dual if π^c ≅ π^∨. (ii) π is essentially conjugate self-dual with multiplier χ if χ: 𝔸_{F⁺}^×/(F⁺)^× → ℂ^× is continuous and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det). (iii) (π, χ) is a polarized automorphic representation if moreover χ_v(−1) is independent of v | ∞. (iv) π is polarizable if some (π, χ) is polarized. (v) A regular algebraic polarized (π, χ) of weight a ∈ (ℤⁿ)_w with F imaginary is totally odd if χ_v(−1) = (−1)^{n+w} for all v | ∞. Here π^c = π ∘ c on GL_n(𝔸_F), and π^c = π when F is totally real.

Hypotheses: The multiplier χ is part of the data. It is determined by π only up to δ_{F/F⁺}, since δ_{F/F⁺} ∘ N_{F/F⁺} = 1. BLGGT impose instead χ_v(−1) = (−1)^n for F imaginary (printed with µ in place of χ). That is the correct normalisation only when w is even; with odd w it makes the Galois multiplier even (sourceIssue AG2.0/E2; node sign-of-the-polarization-multiplier). Condition (v) is the corrected form, and like BLGGT's it can always be achieved by replacing χ by χδ_{F/F⁺}. For regular algebraic (π, χ) of weight a ∈ (ℤⁿ)_w, χ is algebraic with |χ| = ‖·‖^{−w}. Conjugate self-duality is the case χ = 1, possible only when w = 0. For F totally real, polarized means essentially self-dual with χ_v(−1) independent of v. Patrikis shows the independence is automatic for regular algebraic cuspidal π; this packet does not use that.

Uses:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`: the parity of χ_v(−1) against n + w
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`: (r_{l,ι}(π), ε^{1−n} r_{l,ι}(χ)) is the expected polarized Galois pair
- `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`: the input class of the polarized construction

Planning API:

- `TauCeti.AutomorphicGalois.IsConjSelfDual` (data): π.IsConjSelfDual :⇔ π^c ≅ π^∨.
- `TauCeti.AutomorphicGalois.IsEssConjSelfDual` (data): π.IsEssConjSelfDual χ :⇔ π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det).
- `TauCeti.AutomorphicGalois.PolarizedAutRep` (structure): A pair (π, χ) with IsEssConjSelfDual and v ↦ χ_v(−1) constant on the real places.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.twistDelta` (constructor): (π, χ) ↦ (π, χ δ_{F/F⁺}), again polarized.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.IsTotallyOdd` (data): For regular algebraic (π, χ) of weight in (ℤⁿ)_w: χ_v(−1) = (−1)^{n+w} for v | ∞.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.exists_totallyOdd` (characterisation): Exactly one of (π, χ), (π, χδ_{F/F⁺}) is totally odd when F is imaginary.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.weight_mem_W` (relation): A regular algebraic polarized pair has weight in (ℤⁿ)_w with |χ| = ‖·‖^{−w}.

Discriminating tests:

- `TauCeti.AutomorphicGalois.polarized_heckeCharacter_cm` (computation): n = 1, ψ of weight (1, 0) over an imaginary quadratic field: (ψ, ψ|_{𝔸_ℚ}δ) is totally odd; (ψ, ψ|_{𝔸_ℚ}) is not.
- `TauCeti.AutomorphicGalois.isConjSelfDual_iff_multiplier_one` (degenerate): π.IsConjSelfDual ↔ π.IsEssConjSelfDual 1.
- `TauCeti.AutomorphicGalois.polarized_totallyReal` (compatibility): For F totally real, π^c = π and polarized means essentially self-dual with χ_v(−1) independent of v.
- `TauCeti.AutomorphicGalois.not_totallyOdd_blggt_sign_odd_w` (non-example): A pair satisfying BLGGT's printed χ_v(−1) = (−1)^n with w odd (the CM elliptic curve character) is not totally odd: its Galois multiplier takes c_v to +1.

Construction or proof:

1. Well-definedness: π^c and π^∨ ⊗ (χ ∘ N ∘ det) are automorphic representations, so the condition is an isomorphism class condition; χ_v(−1) makes sense since −1 ∈ (F⁺_v)^× at every real place v.
2. Weight constraint: comparing the infinitesimal characters of π^c (weight (a_{τc,i})) and π^∨ ⊗ (χ∘N∘det) (weight (−a_{τ,n+1−i} + b)), where χ has parallel exponent b, gives a_{τc,i} + a_{τ,n+1−i} = b. So a ∈ (ℤⁿ)_b and w = b, and |χ| = ‖·‖^{−w}.
3. Normalisation: χ and χδ_{F/F⁺} give the same condition (ii), and δ_{F/F⁺,v}(−1) = −1 at every real place v when F is imaginary. So exactly one of them satisfies (v).

Acceptance: n = 1, F imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0), w = 1): ψψ^c = ψ|_{𝔸_{F⁺}} ∘ N, and (ψ, ψ|_{𝔸_ℚ}) satisfies BLGGT's printed condition while (ψ, ψ|_{𝔸_ℚ} δ) is totally odd. Base change of a weight-k newform to an imaginary quadratic field: π^c ≅ π and π^∨ ≅ π ⊗ ω_π^{−1}, so π is essentially conjugate self-dual with multiplier the central character of the form (twisted as needed), and w = k − 2.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. The three conditions of a polarized pair follow on the same page.
- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. BLGGT's sign normalisation, with µ printed for χ (sourceIssue AG2.0/E1); corrected in (v) (AG2.0/E2).
- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Hypotheses 4.1(ii), p. 13. Chenevier–Harris's polarization over a totally real field, with the same independence condition.

### BLGGT pairing conventions for the imported polarized carrier

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation` (comparison; unchecked).

Use the continuous representation and polarized-extension carriers of R01.1 and G7. For CM F, the BLGGT pairing has symmetry ε_v=−μ(c_v), so total oddness is ε_v=1, equivalently μ(c_v)=−1; this is the convention bridge to the G_n-valued extension with multiplier μ. For totally real F, an invariant alternating (respectively symmetric) pairing has μ(c_v)=−ε_v (respectively ε_v) in the corresponding symplectic (respectively orthogonal) extension convention. Algebraic and regular conditions import the p-adic Hodge carrier, with HT(ε_ℓ)={−1}. This node specializes those carriers and does not construct a second deformation theory.

Hypotheses: The condition at one infinite place implies it at all of them, with ε_{v′} = µ(c_v c_{v′})ε_v and ⟨x, y⟩_{v′} = ⟨x, r(c_v c_{v′}) y⟩_v. For F imaginary, (r, µ) is polarized if and only if r extends to r̃: G_{F⁺} → 𝒢_n(Q̄_l) with multiplier µ, where 𝒢_n is the group of Clozel–Harris–Taylor (ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group). For F totally real, (r, µ) is polarized if and only if r factors through GSp_n (µ(c_v) = −ε_v) or GO_n (µ(c_v) = ε_v) with multiplier µ. Hodge–Tate numbers use BLGGT's convention HT_τ(ε_l) = {−1}.

Construction or proof:

1. Well-definedness: the pairing condition is a closed condition on (r, µ), and the change of place v ↦ v′ is the computation quoted in the hypotheses.
2. Equivalence with 𝒢_n-valued extensions (F imaginary), BLGGT's second remark in §2.1: r̃(c_v) = (A, a)·j, where A is determined by the Gram matrix of ⟨ , ⟩_v and ν(r̃(c_v)) = −a = µ(c_v), so a = ε_v. Conversely, a pairing is read off from r̃(c_v). (For n = 1, r̃(c)² = 1 forces a = 1, i.e. µ(c) = −1.)

Acceptance: n = 1, F imaginary: a character r with r^c = r^{−1}µ|_{G_F} is polarized with multiplier µ if and only if µ(c_v) = −1, since a non-degenerate pairing on a line is symmetric (ε_v = 1). n = 2, F imaginary quadratic, r = ρ|_{G_F} for an odd ρ: G_ℚ → GL_2(Q̄_l): (r, det ρ) is totally odd, via the pairing ⟨x, y⟩ = det(x, ρ(c)y).

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`, `PadicHodgeTheory:R06.2`, `ArithmeticGaloisRepresentations:G7/polarized-representation`, `ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant`, `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 31. The sign convention linking ε_v and µ(c_v).
- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 31. Totally odd.

### The l-adic character r_{l,ι}(χ) of an algebraic Hecke character, its Hodge–Tate numbers and its weight

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character` (construction; unchecked).

Let F be a number field, l a prime and ι: Q̄_l ≅ ℂ, with Art_F normalised to send uniformisers to geometric Frobenius elements. Let χ: 𝔸_F^×/F^× → ℂ^× be algebraic: χ|_{(F_∞^×)⁰}(x) = ∏_{τ ∈ Hom(F,ℂ)} τ(x)^{−a_τ} with a_τ ∈ ℤ. There is a unique continuous character r_{l,ι}(χ): G_F → Q̄_l^× with ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for all v ∤ l; explicitly ι((r_{l,ι}(χ) ∘ Art_F)(x) ∏_τ (ι^{−1}τ)(x_l)^{a_τ}) = χ(x) ∏_τ (τ x_∞)^{a_τ}. It is de Rham above l with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}. The weight wt(χ) is the integer with |χ| = ‖·‖^{−wt(χ)/2}. Then a_τ + a_{τ′} = wt(χ) whenever τ|_{F₀} = τ′|_{F₀} ∘ c (F₀ the maximal CM subfield), wt(χ) is even when F₀ is totally real, wt(‖·‖_F) = −2, r_{l,ι}(‖·‖) = ε_l, and r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2} at every real place v when F is totally real.

Hypotheses: The normalisation of Art_F (uniformisers ↦ geometric Frobenius) fixes r_{l,ι}(‖·‖) = ε_l. With the arithmetic normalisation it would be ε_l^{−1}. HT_τ(ε_l) = {−1} in this convention, consistent with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}} and a = −1 for ‖·‖ over ℚ. The value at complex conjugation is computed at real places only: at a complex place there is no c_v in G_F.

Uses:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`: the value of r_{l,ι}(χ) at complex conjugation
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`: the n = 1 case of the Frobenius dictionary
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`: the multiplier ε_l^{1−n} r_{l,ι}(χ)

Planning API:

- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar` (constructor): r_{l,ι}(χ): G_F → Q̄_l^× for an algebraic Hecke character χ.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_local` (characterisation): ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for v ∤ l.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.hodgeTate_galoisChar` (characterisation): HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.wt` (data): wt(χ) ∈ ℤ with |χ| = ‖·‖^{−wt(χ)/2}.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_mul` (simp): r_{l,ι}(χ₁χ₂) = r_{l,ι}(χ₁) r_{l,ι}(χ₂).
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_norm` (simp): r_{l,ι}(‖·‖_F) = ε_l.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_complexConj` (relation): For F totally real: r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2}.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_restrict` (functoriality): r_{l,ι}(χ|_{𝔸_{F⁺}^×}) = r_{l,ι}(χ) ∘ V, V: G_{F⁺}^{ab} → G_F^{ab} the transfer.

Discriminating tests:

- `TauCeti.AutomorphicGalois.galoisChar_norm_rat` (computation): F = ℚ: r_{l,ι}(‖·‖) = ε_l, with HT {−1} and wt −2.
- `TauCeti.AutomorphicGalois.galoisChar_trivial` (degenerate): r_{l,ι}(1) = 1, with a = 0 and wt 0.
- `TauCeti.AutomorphicGalois.galoisChar_finite_order` (compatibility): For ω of finite order unramified at p ∤ l: r_{l,ι}(ω)(Frob_p^{geom}) = ω_p(p), and r_{l,ι}(ω)(Frob_p^{arith}) = ω_p(p)^{−1}.
- `TauCeti.AutomorphicGalois.galoisChar_restrict_complexConj` (non-example): For F imaginary and ψ algebraic on F, r_{l,ι}(ψ|_{𝔸_{F⁺}})(c_v) = +1 because the transfer sends c_v to c_v² = 1, whatever ψ_v(−1) is: the Galois sign is not χ_v(−1) unless wt/2 is even.

Construction or proof:

1. The displayed formula defines a continuous character of 𝔸_F^×/F^×(F_∞^×)⁰ with values in Q̄_l^× (the correction factor at l cancels χ_∞ on F^×). Global Artin reciprocity (Tau Ceti ClassFieldTheory, layer 11) turns it into r_{l,ι}(χ).
2. Local compatibility at v ∤ l is immediate from the formula. Uniqueness follows from Čebotarev density of the unramified Frobenius elements.
3. Hodge–Tate numbers: on an open subgroup of O_{F_v}^× (v | l), r ∘ Art is ∏_τ τ^{−a_τ}, a Lubin–Tate character product, whose τ-Hodge–Tate number is a_{ι∘τ} (Serre, Abelian l-adic representations).
4. Weight: |χ| = ‖·‖^{−wt/2} and the unit theorem give a_τ + a_{τ′} = wt for conjugate pairs; for F₀ totally real all a_τ are equal, so wt = 2a is even.
5. Value at c_v for F totally real: χ = χ₀‖·‖^{−wt/2} with χ₀ of finite order. Then r(χ) = r(χ₀)ε_l^{−wt/2}, r(χ₀)(c_v) = χ_{0,v}(−1) = χ_v(−1) because Art_ℝ(−1) = c, and ε_l(c_v) = −1.

Acceptance: F = ℚ, χ = ‖·‖: r = ε_l and HT = {−1}, i.e. a = −1 and wt = −2. F = ℚ, ω of finite order and unramified at p ∤ l: r_{l,ι}(ω)(Frob_p) = ω_p(p) for the geometric Frobenius, so the arithmetic Frobenius goes to ω_p(p)^{−1}. Which of χ(p)^{±1} this is for a Dirichlet character χ depends on how χ is made idelic, and must be fixed once (GlobalNumberFields layer 9's Dirichlet dictionary). The Hecke character ψ of a CM elliptic curve E over its CM field K (weight (1, 0)): r_{l,ι}(ψ) ⊕ r_{l,ι}(ψ^c) is the restriction to G_K of the dual of V_l(E), in this convention.

Direct prerequisites: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `PadicHodgeTheory:R06.2`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §A.2, p. 87. The Hodge–Tate numbers of r_{l,ι}(χ).
- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §A.2, p. 87. Parity of the weight over a totally real field.
- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Notation, p. 8. The Artin normalisation fixing r_{l,ι}(‖·‖) = ε_l.

### The parity of the Galois multiplier of a polarized pair: µ(c_v) = (−1)^{n−1+w} χ_v(−1)

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` (lemma; unchecked).

Let F be imaginary CM and (π, χ) a regular algebraic polarized automorphic representation of GL_n(𝔸_F) of weight a ∈ (ℤⁿ)_w. Put µ = ε_l^{1−n} r_{l,ι}(χ): G_{F⁺} → Q̄_l^×. Then µ(c_v) = (−1)^{n−1+w} χ_v(−1) for every v | ∞. Hence µ is totally odd if and only if χ_v(−1) = (−1)^{n+w}, i.e. (π, χ) is totally odd in the sense of polarized-automorphic-representation (v). Under BLGGT's printed normalisation χ_v(−1) = (−1)^n, µ(c_v) = (−1)^{w+1}: it is −1 exactly when w is even.

Hypotheses: The integer w is the one with a ∈ (ℤⁿ)_w. Theorem 2.1.1 of BLGGT uses a different integer, the purity weight w + n − 1 of r_{l,ι}(π). Only the multiplier's value at complex conjugation is computed. No Galois representation r_{l,ι}(π) is needed for the statement.

Construction or proof:

1. By polarized-automorphic-representation, χ is algebraic with parallel exponent b = w on 𝔸_{F⁺}, so wt(χ) = 2w.
2. By galois-character-of-an-algebraic-hecke-character, r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^w.
3. ε_l(c_v) = −1, so ε_l^{1−n}(c_v) = (−1)^{n−1}, and µ(c_v) = (−1)^{n−1+w} χ_v(−1).
4. Consequence for BLGGT Theorem 2.1.1(1): the pair (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) is totally odd only for the multiplier χ satisfying (v). With χ_v(−1) = (−1)^n and w odd, µ(c_v) = +1, and (r_{l,ι}(π), µ) is not even polarized for n = 1 (a pairing on a line is symmetric).
5. Independent check against Patrikis, who records the sign of the pairing preserved by these representations as ω_ι(c_v) = (−1)^w ω_v(−1) in his normalisation.

Acceptance: n = 1, F = K imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0), w = 1): ψψ^c = ψ|_{𝔸_ℚ} ∘ N. χ = ψ|_{𝔸_ℚ} has χ_∞(−1) = (−1)^1 = −1, BLGGT's sign. But r_{l,ι}(ψ|_{𝔸_ℚ})(c) = 1 (transfer), whereas χ = ψ|_{𝔸_ℚ}δ_K, with χ_∞(−1) = +1 = (−1)^{n+w}, gives µ(c) = −1. n = 2, the base change to K of a newform of weight k with k odd (w = k − 2 odd): BLGGT's sign gives µ(c) = +1. The invariant pairing on r = ρ_f^∨|_{G_K} is symmetric (det(x, ρ(c)y)), so the totally odd multiplier is the other one, the extension of det r with value −1 at c. w even (for instance n = 1 and ψ with ψψ^c = 1): the corrected and printed normalisations agree.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(1), p. 33. The assertion that fails for odd w under the printed normalisation (sourceIssue AG2.0/E2).
- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Proof of Theorem 2.1.1, p. 34. The step that holds only when w is even.
- [Stefan Patrikis, On the sign of regular algebraic polarizable automorphic representations](https://arxiv.org/pdf/1306.1242v2), §4, proof of Proposition 4.1, p. 8. An independent calculation of ω_ι(c_v)=(−1)^w ω_v(−1), with ω_ι the associated geometric Galois character. This is in Proposition 4.1, not the proof of Theorem 2.1.

### The Hodge–Tate multiset attached to a weight: HT_τ = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset` (definition; unchecked).

For a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, ι: Q̄_l ≅ ℂ and τ: F → Q̄_l, put HT_τ(a) = {a_{ι∘τ,i} + n − i : 1 ≤ i ≤ n}, a multiset of n integers, in BLGGT's convention HT_τ(ε_l) = {−1}. The elements are distinct, so a Galois representation with these Hodge–Tate numbers is regular. If F is CM and a ∈ (ℤⁿ)_w, then HT_{τ∘c}(a) = {w + n − 1 − h : h ∈ HT_τ(a)}. Twisting a by −t (π ↦ π ⊗ ‖det‖^t) subtracts t from every element, matching ⊗ ε_l^t. In the opposite convention (HT(ε_l) = +1) every element is negated.

Hypotheses: This is the target that AG2.6 proves for r_{l,ι}(π) (BLGGT Theorem 2.1.1(3), ACC+ Theorem 2.3.3(b)); here it is only the dictionary from a to a multiset. The integer w + n − 1 is BLGGT's w in Theorem 2.1.1(3). The two integers must not be confused.

Uses:

- `AutomorphicGaloisRepresentationsPartII:AG2.6`: the labelled Hodge–Tate multiset of the constructed representations
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`: regular algebraic means |HT_τ| = n

Planning API:

- `TauCeti.AutomorphicGalois.expectedHodgeTate` (constructor): expectedHodgeTate a = multiset of a i + (n − 1 − i), i : Fin n (0-indexed).
- `TauCeti.AutomorphicGalois.expectedHodgeTate_strictAnti` (characterisation): i ↦ a i + (n − 1 − i) is strictly antitone when a is antitone.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_conj` (relation): a ∈ (ℤⁿ)_w ⇒ HT at τc is {w + n − 1 − h : h ∈ HT at τ}.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_twist` (simp): expectedHodgeTate (a − t) = (expectedHodgeTate a).map (· − t).
- `TauCeti.AutomorphicGalois.expectedHodgeTate_card` (characterisation): The multiset expectedHodgeTate a has cardinality n.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_nodup` (characterisation): For antitone a, expectedHodgeTate a has no repetitions, by strict antitonicity of the shifted coordinates.

Discriminating tests:

- `TauCeti.AutomorphicGalois.expectedHodgeTate_classical` (computation): n = 2, a = (k − 2, 0) ↦ {k − 1, 0}; for k = 12, {11, 0}.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_zero` (degenerate): For n≥1, a = 0 ↦ {n − 1, …, 1, 0}: parallel weight 0 gives the Hodge–Tate numbers of Symⁿ⁻¹ of the dual Tate module of an elliptic curve.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_regular` (compatibility): The elements are pairwise distinct, so the multiset is regular in BLGGT's sense (|HT_τ| = n).
- `TauCeti.AutomorphicGalois.not_expectedHodgeTate_unshifted` (non-example): The unshifted multiset {a_{τ,i}} fails regularity for a = 0 and n ≥ 2, so the shift n − i is part of the definition.

Construction or proof:

1. Distinctness: a dominant gives a_{τ,i} + n − i > a_{τ,j} + n − j for i < j.
2. Polarity: a_{τc,i} = w − a_{τ,n+1−i}, so a_{τc,i} + n − i = (w + n − 1) − (a_{τ,n+1−i} + n − (n + 1 − i)).
3. Twist: (a − t)_{τ,i} + n − i = (a_{τ,i} + n − i) − t, and HT(ε_l^t) = {−t}.

Acceptance: For integer k≥2, n = 2, a = (k − 2, 0): HT = {k − 1, 0} for ρ_f^∨ in BLGGT’s convention and for ρ_f in R19’s opposite convention. Negating the convention for a fixed representation negates its weights; passing to its dual also negates them. n = 2, a = (0, 0), w = 0: HT = {1, 0} at τ and τc, as for the dual of the Tate module of an elliptic curve in BLGGT's convention (V_l(E) itself has {0, −1}). ACC+ attach Sym^m r_{E,l}^∨ to a π of weight 0.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(3), p. 33. The multiset, and after it the polarity HT_{τ∘c} = {w − h}, with BLGGT's w equal to w + n − 1 here.
- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Notation, p. 8. The sign convention for Hodge–Tate numbers.
- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Corollary 7.2.4, p. 1100. Weight 0 corresponds to Sym^m of the dual Tate module (the test expectedHodgeTate_zero).

### Automorphic specialization of the integral Hecke polynomial

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions` (comparison; unchecked).

Let v be a finite place of F with q_v = #k(v), π_v an unramified irreducible representation of GL_n(F_v), and t_{v,i} the eigenvalue on π_v^{GL_n(O_{F_v})} of T_{v,i} = [GL_n(O_{F_v}) diag(ϖ_v, …, ϖ_v, 1, …, 1) GL_n(O_{F_v})] (ϖ_v repeated i times). Define P_v(π_v; X) = Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}. If α₁, …, α_n are the Satake parameters of π_v, with t_{v,i} = q_v^{i(n−i)/2} e_i(α), then P_v(π_v; X) = ∏_j (X − q_v^{(n−1)/2} α_j). Conventions: a Galois representation r corresponds to π at v in the geometric convention (BLGGT, ACC+, HLTT: Frob_v geometric, Art uniformisers ↦ geometric Frobenius) if ι det(X − r(Frob_v)) = P_v(π_v; X). It corresponds in the arithmetic convention (IntegralHeckeAndGaloisDeterminants IHG.3, and R19) if the arithmetic Frobenius has characteristic polynomial P_v(π_v; X). r corresponds in one convention if and only if r^∨ corresponds in the other. Twists: P_v(π_v ⊗ ‖det‖^t; X) = q_v^{−tn} P_v(π_v; q_v^t X), matching r ↦ r ⊗ ε_l^t. The contragredient has roots q_v^{n−1}/β_j, where β_j are the roots for π_v, matching r ↦ r^∨ ⊗ ε_l^{1−n}.

Hypotheses: No local Langlands correspondence is used. For unramified π_v, 'r corresponds at v' is defined by the polynomial identity, which is what AG2.0 requires. Agreement with rec(π_v ⊗ |det|^{(1−n)/2}) for unramified π_v is an AG2.5 comparison. ACC+ say P_v corresponds to Frobenius on rec^T(π_v), their arithmetic normalisation of local Langlands (Clozel–Thorne §2.1), with Frob_v geometric in their notation. That is the geometric convention here.

Construction or proof:

1. Import the normalized Satake and integral polynomial declarations from IHG.3; specialize the coefficient ring along the spherical Hecke eigencharacter of π_v.
2. Use the imported scalar-twist and reciprocal-polynomial identities, with ε_ℓ(Frob_geom)=q_v^(−1), to obtain norm, contragredient and Frobenius conversion formulas.
3. For rank two compare the resulting polynomial with the classical Hecke eigenvalues; this is a polynomial acceptance check and does not use a modular Galois existence theorem.

Acceptance: n = 1: P_v(X) = X − χ_v(ϖ_v), and r_{l,ι}(χ)(Frob_v) = ι^{−1}χ_v(ϖ_v) in the geometric convention (galois-character-of-an-algebraic-hecke-character). n = 2, F = ℚ, π = π_f ⊗ ‖det‖^{1−k/2}, normalised so that T_{p,1} acts by a_p and T_{p,2} by ψ(p)p^{k−2}: P_p(X) = X² − a_pX + ψ(p)p^{k−1}. This is the R19 polynomial of ρ_f for arithmetic Frobenius, so the geometric convention gives r_{l,ι}(π) ≅ ρ_f^∨. For Δ at p = 2: X² + 24X + 2^{11}. n = 3: P_v(X) = X³ − t₁X² + q t₂X − q³ t₃ = ∏(X − qα_j) when t₁ = q e₁, t₂ = q e₂ and t₃ = e₃.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients`, `IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist`, `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

Sources:

- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, (2.2.6), p. 922. Use all signed coefficients of the characteristic polynomial. The terminal sign and unitary powers in the displayed definitions require the corrections recorded as AG2.0/E6; the packet’s GL_n polynomial already has the correct signs and degrees.
- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Theorem 2.3.2, p. 935. The geometric convention in the construction HLTT–ACC+ use (Frob_v geometric).
- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation, p. 906. rec^T, in which P_v is read.

### A Galois representation attached to π at the good places, and its functoriality under twist, dual, conjugation and base change

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` (definition; unchecked).

For regular algebraic cuspidal π, a coefficient isomorphism ι:Q̄_ℓ≅C, and a continuous semisimple rank-n representation r of G_F unramified outside a finite set, IsAttached(ι,r,π) means that outside a finite set of finite places v∤ℓ, π_v is spherical, r is unramified, and ι det(X−r(Frob_v^geom))=P_v(π_v;X). The exceptional set contains the ramification of π, F and r and the coefficient prime. Two such r are isomorphic by Frobenius density. This is a good-place condition; it asserts neither local Langlands compatibility at ramified places nor de Rham admissibility nor global existence.

Hypotheses: This is the property HLTT prove for every regular algebraic cuspidal π over a CM field (ACC+ Theorem 2.3.2). It is the interface that AG2.1–AG2.4 produce and AG2.5 strengthens. Nothing at the places in S, or above l, is asserted. Uniqueness needs semisimplicity. It uses Čebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations R01.1/R01.5). The base-change clause needs the Satake parameters of BC(π)_w to be the q-power restrictions of those of π_v (the unramified base-change identity), requested from EndoscopicTransferAndUnitaryTraceComparison ET.7, which exports the Arthur–Clozel base-change steps to this roadmap.

Uses:

- `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`: HLTT Theorem A produces an attached r_{p,ι}(π)
- `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`: the polarized construction's good-place property
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`: P_v(π_v) has coefficients in M_π, so an attached r has traces in ι^{-1}(M_π) at good places

Planning API:

- `TauCeti.AutomorphicGalois.IsAttached` (data): r.IsAttached ι π :⇔ ∃ S finite, ∀ v ∉ S, r unramified at v ∧ ι det(X − r(Frob_v)) = P_v(π_v).
- `TauCeti.AutomorphicGalois.IsAttached.unique` (extensionality): r, r′ semisimple and both attached to π ⇒ r ≅ r′.
- `TauCeti.AutomorphicGalois.IsAttached.twist` (functoriality): r.IsAttached π → (r ⊗ r_{l,ι}(ψ)).IsAttached (π ⊗ ψ∘det).
- `TauCeti.AutomorphicGalois.IsAttached.dual` (functoriality): r.IsAttached π → (r^∨ ⊗ ε_l^{1−n}).IsAttached π^∨.
- `TauCeti.AutomorphicGalois.IsAttached.conj` (functoriality): r.IsAttached π → r^c.IsAttached π^c.

Discriminating tests:

- `TauCeti.AutomorphicGalois.isAttached_heckeCharacter` (degenerate): n = 1: r_{l,ι}(ψ).IsAttached ι ψ.
- `TauCeti.AutomorphicGalois.isAttached_classical` (computation): ρ_f^∨ is attached to π_f ⊗ ‖det‖^{1−k/2}; for Δ the polynomial at 2 is X² + 24X + 2^{11}.
- `TauCeti.AutomorphicGalois.not_isAttached_classical_rho` (non-example): ρ_f is not attached to π_f ⊗ ‖det‖^{1−k/2} (for Δ its geometric polynomial at 2 is X² + 24·2^{−11}X + 2^{−11}).
- `TauCeti.AutomorphicGalois.isAttached_dual_twist` (compatibility): The two rules compose consistently: (r^∨ε^{1−n})^∨ε^{1−n} = r, matching π^∨∨ = π.

Construction or proof:

1. The polynomial condition is invariant under change of a Frobenius lift at an unramified place and isomorphism of r.
2. Apply R01.5 recognition on a density-one set to prove uniqueness among semisimple representations.
3. Twist, dual and conjugation formulas are exported by the separate attachment-operations lemma; solvable base change is a late AG2.2 export.

Acceptance: n = 1: r_{l,ι}(ψ) is attached to ψ. n = 2, F = ℚ: ρ_f^∨ (R19 convention for ρ_f, i.e. the cohomological realisation M_{f,λ}) is attached to π_f ⊗ ‖det‖^{1−k/2}; ρ_f is attached to (π_f ⊗ ‖det‖^{1−k/2})^∨ ⊗ ‖det‖ (dual rule, then twist rule with r_{l,ι}(‖·‖) = ε_l); for Δ at 2, ρ_f^∨ has geometric-Frobenius roots β_j and ρ_f has roots 1/β_j, where β_j are the roots of X² + 24X + 2^{11}. Dual check at n = 2: ρ_f^∨ is attached to π ⇒ ρ_f ⊗ ε_l^{−1} is attached to π^∨. Indeed ρ_f ⊗ ε_l^{−1} = (ρ_f^∨)^∨ ⊗ ε_l^{1−2}.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

Sources:

- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Theorem 2.3.2, p. 935. The good-place property that defines attachment.
- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.3, after Definition 2.3.6, p. 938. The contragredient rule r ↦ r^∨ ⊗ ε^{1−n}, as ACC+ state it for Hecke maximal ideals.

### Rationality of the good Hecke polynomials

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality` (theorem; unchecked).

Import M_π=C^{Aut(C/π^∞)} and Clozel rationality from AF.4. For regular algebraic cuspidal π on GL_n over a CM or totally real field, every spherical integral Hecke polynomial P_v(π_v;X) has coefficients in M_π. At good places the traces of any attached r therefore lie in ι^(−1)(M_π). This controls traces, not a model of r over (M_π)_λ: the Schur-index obstruction is supplied by R01.5. Coefficient conjugation sends M_π to M_{σπ}=σ(M_π).

Hypotheses: The definition uses π^∞ only. σπ^∞ is π^∞ with scalars extended along σ. M_π controls traces, not realizations. The field over which r can be written may be strictly larger, by a Schur-index obstruction. AG2.3/finite-number-field-of-realization proves a common realization field using the regular labelled Hodge–Tate input supplied by AG2.6; the early rationality theorem does not depend on that late result. Clozel's theorem is used with its exact hypotheses: π regular algebraic (cohomological) and cuspidal. It is not claimed for non-cuspidal or non-algebraic π.

Construction or proof:

1. The spherical Hecke algebra and its integral normalization are defined over Q, so t_{v,i}(σπ)=σ(t_{v,i}(π)).
2. The rational factors q_v^(i(i−1)/2) are fixed by Aut(C); take invariants under the stabilizer of π^∞.
3. Use AF.4 for finiteness of M_π and R01.5 for the distinction between a trace field and a realization field.

Acceptance: n = 1: M_ψ is the field generated by the values of ψ on 𝔸_F^{∞,×}, a number field for algebraic ψ. n = 2: for π = π_f ⊗ ‖det‖^{1−k/2}, M_π = ℚ(a_p, ψ(p) : p ∤ N) = K_f, the Hecke field, and ρ_{f,λ} is realised over K_{f,λ} (Deligne–Serre footnote (2): complex conjugation has distinct rational eigenvalues). Realisation is a separate question: the two-dimensional representation of the quaternion group Q₈ has rational character but is not realisable over ℚ₂, since the quaternion algebra (−1, −1)_ℚ ramifies at 2. So an Artin representation of G_ℚ through a Q₈-extension has trace field ℚ but no model over ℚ₂.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `ArithmeticGaloisRepresentations:R01.5/descent-obstruction`.

Sources:

- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, p. 1093. The field of rationality, in the coefficient field of the compatible system ACC+ attach to π.

### Twists, duals and conjugation preserve good-place attachment

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation` (lemma; unchecked).

If IsAttached(ι,r,π), then IsAttached(ι,r⊗r(ψ),π⊗ψ∘det) for algebraic ψ; in particular norm^t corresponds to ε_ℓ^t. Also r^∨⊗ε_ℓ^(1−n) is attached to π^∨, and for CM F the conjugate r^c is attached to π^c. All conclusions are up to isomorphism and enlarge the finite excluded set by the character ramification.

Hypotheses: r semisimple and continuous; ψ algebraic; fixed geometric Artin/Frobenius normalization.

Construction or proof:

1. Apply the scalar-twist and reciprocal-polynomial identities from IHG.3, then the algebraic-character local formula.
2. Transport Frobenius at v to Frobenius at cv; use attachment uniqueness.

Acceptance: Dualizing twice returns r. For n=1 a norm twist multiplies geometric Frobenius by q^(−t).

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

Sources:

- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.3 after Definition 2.3.6, p. 938. The dual Hecke ideal has representation ρ^∨⊗ε^(1−n); the polynomial computation supplies the other operations.

### The similitude character in a compact coefficient system

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary` (comparison; unchecked).

For Shin’s compact similitude datum, write an algebraic coefficient ξ by its integral central exponent a₀(ξ) and dominant entries a(ξ)_{σ,1}≥⋯≥a(ξ)_{σ,n} for the chosen CM type. Its purity weight is w(ξ)=−2a₀(ξ)−Σ_{σ,i}a(ξ)_{σ,i}. The normalization of the coefficient sheaf and the extracted Galois constituent retains the GL₁-character ψ: the shifted labelled integers are j_κ(k)=k−1−a(ιξ)_{ικ,k}−a₀(ιξ). For ξ=ν^t, a₀=t and all a_{σ,i}=0, so w(ξ)=−2t and j_κ(k)=k−1−t. This is the required nontrivial central-character acceptance case.

Hypotheses: Use the chosen CM type and positive similitude component, with Shin §3.6 and §6.2 indexing; n≥1, t integral.

Construction or proof:

1. Restrict ξ to the central similitude torus and evaluate the central character; import the algebraic coefficient representation from AF.4/B2.
2. Keep a₀ through the Kuga–Sato Tate twist and the GL₁ correction in Shin Corollary 6.8.

Acceptance: t=1 shifts each j by −1 and the weight by −2. t=0 gives the trivial central character. Changing the highest GL_n weight and changing a₀ are separate operations.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`, `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `AutomorphicBundles:B2`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.6, definitions preceding (3.18), and §6.2 preceding Corollary 6.7, pp. 20, 48. The central exponent enters both w(ξ) and j_κ(k); forgetting it fails the similitude acceptance test.

### A crystalline character with prescribed p-adic unit type

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/prescribed-crystalline-twisting-character` (theorem; unchecked).

Let F be CM, p a prime, E/Q_p sufficiently large, S a finite ramification set containing the p-adic places, and ṽ a p-adic place split over F⁺. For the compatible algebraic local unit characters used in ACC+ §4.5.1, there is a continuous ψ:G_F→O_E^× crystalline at every place above p, unramified at ṽ and at S minus S_p, and with ψ∘Art_{F_{ṽc}} on units equal to ∏_{τ:F_{ṽ}→E}(τc)^(λ_{τ₀,1}+λ_{τ₀c,1}), where τ₀ maximizes that sum. Its labelled HT weights are 0 at ṽ and −λ_{τ₀,1}−λ_{τ₀c,1} at ṽc. Additional finite ramification is allowed outside S.

Hypotheses: The local prescriptions satisfy the global unit and totally real restriction compatibility of HSBT Lemma 2.2. This is the source’s split-place construction; arbitrary inconsistent local characters are excluded.

Construction or proof:

1. Use HSBT Lemma 2.2 to extend the compatible character from units and the totally real idele subgroup.
2. Apply geometric class field theory and the algebraic-character p-adic Hodge formula; enlarge E and the finite ramification set.

Acceptance: The sign on HT is negative for positive unit exponent in geometric Artin normalization. The character is unramified at ṽ while carrying the opposite-place type. A nontrivial character on a global unit violating compatibility cannot extend.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`, `PadicHodgeTheory:R06.2`.

Sources:

- [Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.5.1, proof of Theorem 4.5.1, pp. 985–986. The split p-adic twist is used to place the weights in the prescribed range.
- [Michael Harris, Nicholas Shepherd-Barron and Richard Taylor, A family of Calabi–Yau varieties and potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf), Lemma 2.2, pp. 795–796. The three compatibility hypotheses precede the extension, so local prescriptions alone do not imply existence.

### The coefficient field of a relevant automorphic representation

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/relevant-automorphic-coefficient-field` (comparison; unchecked).

For relevant π in Liu et al. Definition 1.1.3, import Q(π) as the fixed field of automorphisms preserving the finite part π^∞. Its local coefficient field is generated by coefficients of ∏_i(T−α_i q_v^{(N−1)/2}) at spherical places. Lemma 3.1.2 identifies Q(π) with the compositum of these local fields, using Clozel rationality and strong multiplicity one. This is an automorphic coefficient-field result; it does not prove Definition 3.2.5 strong Galois realization over each completion.

Hypotheses: Relevant regular algebraic CSD cuspidal π and normalized spherical parameters; all coefficient embeddings tracked.

Construction or proof:

1. Identify the local polynomial with the IHG.3 integral polynomial.
2. Use the AF.4 rational model and strong multiplicity one to identify the stabilizer.
3. Distinguish the strong Galois realization property in AG2.6.

Acceptance: The local polynomial is independent of the chosen square-root extension.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`, `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `AutomorphicFormsOnReductiveGroups:AF.4`.

Sources:

- [Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §3.1, Definition 3.1.1 and Lemma 3.1.2, pp. 138–139 (PDF pp. 32–33). Clozel and strong multiplicity one identify the global/local coefficient fields.

## AG2.1. Characteristic-zero geometric Galois realization

This is the process aggregate prescribed by accepted RS-12. Its producers are AG2.1a and AG2.1b. It has no separate declaration and is never an input to the local comparison. ET.6 and ET.6a consume the raw geometry of AG2.1a. Their local outputs can then be used in AG2.1b. This ordering also separates characteristic-zero geometry from torsion concentration and potential automorphy.

Coverage: **source_decomposed**. Process aggregate of the named producers AG2.1a and AG2.1b under accepted RS-12; no independent node and never an early ET.6 prerequisite. Producer stages are planned, with the gaps recorded in their own coverage.

## AG2.1a. Raw cohomology before local Langlands

The geometric instance is the compact unitary similitude datum of Shin, with one signature (1,n−1), the other real signatures definite, and the specified finite quasi-split factors. It is not the quasi-split HLTT group of signature (n,n). The finite-level variety X_U has dimension n−1 and carries its universal abelian scheme. The relevant Drinfeld factors allow ramification in F_w/ℚ_p; an unramified local chart cannot be substituted for them.

Taylor–Yoshida's corrected coefficient projector is an actual rational algebraic correspondence on the abelian power. Its relative selector uses multiplication by an integer N≥2 on every factor; the Schur correspondence selects ξ; and the power 2n−1 corrects the action on the global Leray filtration. Relative idempotence alone does not establish global idempotence. The exact ξ-to-tensor-degree, Tate-twist and graded permutation recipe is requested from its generic owners and remains an explicit source gap.

Actual graded cohomology and its commuting actions precede the alternating Grothendieck class. Purity here concerns the actual finite-level groups. Fixed-point and nearby-cycle traces are raw geometric statements before local Langlands. Effectivity of polarized O_F-linear Kottwitz triples, including the obstruction α₀, is a separate requirement from unpolarized Honda–Tate classification.


The generic geometric fixed-point theorem must be available before Igusa stabilization. EDC.8 presently supplies trace classes and assigns the stronger theorem to ET.5; that boundary needs the explicit owner refinement recorded below. A trace-class construction alone does not establish the raw Hecke–Frobenius identity.

Coverage: **planned**. Every stage target is an own declaration, an exact imported contract or an explicitly identified ownership/source gap; planned does not mean closed or implemented.

Requirements for closure:

- Supply the explicit ξ↦(m_ξ,t_ξ,ε_ξ) recipe and graded Young signs; compact possibly ramified PEL/Igusa model contracts; polarized O_F-linear Kottwitz effectivity with α₀; raw fixed-point and nearby-cycle contracts.
- Reconcile the EDC.8 trace-class / ET.5 stronger fixed-point theorem boundary so the raw geometric theorem has an independent earlier owner.

Atlas planets: Compact unitary Shimura varieties; Kuga–Sato coefficient projector; Coefficient cohomology; Geometric Galois actions; Automorphic multiplicity spaces; Geometric fixed-point traces.

### The compact unitary PEL instance

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance` (construction; unchecked).

Under Shin §5.1, F=EF⁺ is CM, E imaginary quadratic, n≥3 odd, [F⁺:Q]≥2, and all rational primes ramified in F split in F/F⁺. Choose a CM embedding τ and the similitude datum of Lemma 5.1: signature (1,n−1) at τ and (0,n) at the other selected embeddings, quasi-split at all finite places and anisotropic modulo centre over Q. At sufficiently small level U the PEL moduli scheme X_U/F is smooth proper of dimension n−1 with universal abelian scheme A_U. For p split in E choose w|p: G(Q_p) has the GL_n(F_w) factor used for Drinfeld level, including when F_w/Q_p is ramified. The other split factors have the étale level structures of §5.2. Form A_U^m over X_U for m≥0.

Hypotheses: The positivity, determinant, polarization and level conditions are those of the chosen PEL datum, not those of the quasi-split signature (n,n) datum. Choose integral orders and sufficiently small levels as in §5.2; Drinfeld models require the distinguished split factor.

Uses:

- `TY §2 and AG2.1a coefficient projector`: Provides the abelian powers on which the correspondences act.
- `Shin Proposition 5.2 and AG2.1b`: Provides the proper tower and its Drinfeld Newton strata.

Planning API:

- `CompactPEL.dimension` (characterisation): dim X_U=n−1; the universal abelian scheme has the relative dimension prescribed by this PEL representation.
- `CompactPEL.levelPullback` (functoriality): Level inclusions give finite étale maps on generic fibres, with compatible universal abelian schemes.
- `CompactPEL.kugaPower` (constructor): A_U^0=X_U and A_U^(m+1)=A_U^m×_{X_U}A_U.
- `CompactPEL.drinfeldFactor` (compatibility): At w the integral level structure is the Drinfeld structure on the one-dimensional O_{F_w}-Barsotti–Tate factor.

Discriminating tests:

- `CompactPEL.zeroPower` (degenerate): m=0 gives X_U, not an empty scheme.
- `CompactPEL.signatureDimension` (computation): n=3 gives a proper surface of dimension 2; the signature (3,3) datum has complex dimension 9[F⁺:Q].
- `CompactPEL.ramifiedFactor` (non-example): An unramified-only local datum cannot satisfy the API for ramified F_w.

Construction or proof:

1. Specialize PEL M0–M4 to Lemma 5.1, keeping the signature and reflex-field embedding.
2. Use representability, properness from anisotropy and the universal abelian scheme; form relative fibre powers.
3. Use the Harris–Taylor Drinfeld integral model in the distinguished factor, and product level structures in the remaining factors.

Acceptance: The generic fibre has dimension n−1. The construction includes ramified F_w when p splits in E. A signature (n,n) variety of dimension [F⁺:Q]n² cannot replace this instance.

Direct prerequisites: `PELModuli:M0`, `PELModuli:M4`, `IgusaVarietiesAndTorsionConcentration:IG.0/drinfeld-level-newton-strata`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Lemma 5.1 and §5.2, pp. 30–34. The finite-level compact datum and its models are fixed here.

### The corrected Kuga–Sato coefficient projector

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector` (construction; unchecked).

For an irreducible algebraic ξ of the compact similitude group choose the TY §2 integers m_ξ,t_ξ and rational algebraic correspondence ε_ξ realizing L_ξ inside R^{m_ξ}(A_U^{m_ξ}/X_U)(t_ξ). For N≥2 let ε(m,N)=∏_{x=1}^m ∏_{0≤y≤2[F⁺:Q]n², y≠1}([N]_x−N^y)/(N−N^y), and set a_ξ=ε_ξ ε(m_ξ,N)^{2n−1}. Its action on global cohomology is idempotent and realizes the coefficient cohomology in the shifted degree. The exponent 2n−1 removes the Leray-filtration error: ε(m,N) alone is only the relative-degree selector.

Hypotheses: Q-coefficients; N≥2; sufficiently small U; the chosen realization of ξ and its central exponent a₀, CM type and Tate twist are retained.

Uses:

- `TY §2 degree identity`: Extracts L_ξ-cohomology from ordinary étale cohomology.
- `AG2.1b purity and multiplicity`: Makes ξ-cohomology a geometric direct summand with its correct weight.

Planning API:

- `CoefficientProjector.idempotent` (characterisation): a_ξ²=a_ξ on each global cohomology group after the 2n−1 correction.
- `CoefficientProjector.relativeDegree` (characterisation): The multiplier correspondence annihilates relative degrees other than m_ξ.
- `CoefficientProjector.centralTwist` (compatibility): Replacing ξ by ξ⊗ν^t changes the retained central character and Tate normalization according to the coefficient dictionary.
- `CoefficientProjector.level` (functoriality): a_ξ commutes with level pullback and the correspondences defining Hecke actions.

Discriminating tests:

- `CoefficientProjector.denominator` (computation): For N=2, y=0, the denominator is 1; for y=2 it is −2.
- `CoefficientProjector.degreeSelector` (non-example): On H⁰ of one abelian factor the y=0 term annihilates the class; on H¹ every term acts as 1.
- `CoefficientProjector.zeroPower` (degenerate): For ξ=1 with m_ξ=t_ξ=0 and ε_ξ=1, the empty product is the identity and realizes the trivial coefficient. The condition m_ξ=0 alone does not exclude a nontrivial Tate twist.
- `CoefficientProjector.lerayCorrection` (compatibility): The global selector uses the power 2n−1 even though its associated-graded selector is idempotent.

Construction or proof:

1. Multiplication by N acts on relative R^y by N^y, so the product selects H¹ from each abelian factor.
2. Apply the normalized Young/Schur correspondence ε_ξ on the selected tensor power.
3. The Leray filtration has length at most 2n−1. Apply the TY correction before asserting a global idempotent.

Acceptance: Denominators are nonzero for N≥2. The exponent is exactly the corrected source exponent, not a degree-one idempotence assertion. The output degree shifts by m_ξ and the Tate twist remains t_ξ.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`, `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `AutomorphicBundles:B2`, `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-2-young-symmetrizers`, `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality`.

Sources:

- [Richard Taylor and Teruyoshi Yoshida, Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), §2, p. 12, definition of a_ξ. The source corrects the projector and identifies its global cohomology image.

### Cohomology of the coefficient projector

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity` (lemma; unchecked).

For every j, a_ξ H^j(A_U^{m_ξ}×_F F̄,Q̄_ℓ(t_ξ)) is canonically H^{j−m_ξ}(X_U×_F F̄,L_ξ) if j≥m_ξ, and zero otherwise. The identity is equivariant for Gal(F̄/F), level transitions and prime-to-level Hecke correspondences.

Hypotheses: Use the corrected a_ξ and the selected algebraic realization; ℓ invertible on the generic fibre.

Construction or proof:

1. The relative selector leaves the single R^{m_ξ} row in Leray.
2. Identify the ε_ξ summand with L_ξ; use the corrected global projector to split the filtration.

Acceptance: j=m_ξ gives H⁰(X_U,L_ξ). No negative cohomology group is introduced when j<m_ξ.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources:

- [Richard Taylor and Teruyoshi Yoshida, Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), §2, cohomology identity after a_ξ, p. 12. This is the actual shifted coefficient-cohomology identity.

### Finite-level coefficient cohomology

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology` (construction; unchecked).

Define H^k_U(ξ)=H^k_et(X_U×_F F̄,L_ξ) as the corrected Kuga–Sato summand in degree k+m_ξ with twist t_ξ. Set H^k(ξ)=colim_U H^k_U(ξ) under pullback. This is a smooth admissible G(A_f)-representation with commuting continuous Gal(F̄/F)-action on finite-level invariants. Define H(ξ)=Σ_k(−1)^k[H^k(ξ)] only in the Grothendieck group, retaining the graded H^k separately.

Hypotheses: Small levels; ξ irreducible algebraic; Q̄_ℓ coefficients obtained from a finite ℓ-adic coefficient field; the finite-level étale finiteness and descent contracts.

Uses:

- `Shin Theorem 6.4`: The geometric side of Mantovan and trace comparison.
- `ET.6 geometric export`: Supplies graded cohomology and actions before local Langlands.

Planning API:

- `CoefficientCohomology.level` (functoriality): Compatible level pullbacks compose and commute with Galois.
- `CoefficientCohomology.hecke` (functoriality): A double-coset correspondence acts by finite pullback followed by proper pushforward.
- `CoefficientCohomology.invariants` (compatibility): Small-level invariants identify with the finite-level cohomology in characteristic zero.
- `CoefficientCohomology.alternating` (constructor): The alternating sum is a Grothendieck class and is not declared an actual representation.

Discriminating tests:

- `CoefficientCohomology.outsideRange` (degenerate): Degrees below 0 or above 2(n−1) vanish.
- `CoefficientCohomology.trivialCoefficient` (compatibility): ξ=1 gives the usual étale cohomology of X_U.
- `CoefficientCohomology.virtualCancellation` (non-example): A nonzero class appearing in two adjacent degrees cancels in H(ξ) but remains in both graded groups.

Construction or proof:

1. Construct finite-level coefficient cohomology via the preceding identity.
2. Use functorial level pullbacks and Hecke correspondences to form the smooth tower.
3. Take the alternating class after constructing the actual graded representation.

Acceptance: H^k_U=0 outside 0≤k≤2(n−1). Invariants at a small level recover finite-dimensional coefficient cohomology. Equality of alternating classes cannot by itself identify H^{n−1}.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2, definitions of H^k and H, pp. 33–34. Actual graded cohomology precedes the alternating virtual class.

### Commutation of the geometric actions

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation` (lemma; unchecked).

On H^k_U(ξ), the Galois action commutes with every rational Hecke correspondence that is defined over F and with a_ξ. Passage between levels preserves this commutation and the Tate twist. In particular the cohomology is a joint module, not just a list of unrelated eigenvalues.

Hypotheses: Correspondences and the selected coefficient projector are defined over the reflex field.

Construction or proof:

1. Use functoriality of pullback and proper pushforward under field automorphisms.
2. Use the rational algebraic correspondence description of a_ξ.

Acceptance: The central similitude character is preserved under the commutation identity.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources:

- [Richard Taylor and Teruyoshi Yoshida, Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), §2, action following the cohomology identity, p. 12. The level and Galois actions respect the ξ projector.

### Finite continuous geometric Galois actions

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action` (theorem; unchecked).

Every H^k_U(ξ) is finite-dimensional over a finite extension of Q_ℓ and has continuous Galois action; after scalar extension it is unramified away from finitely many places. For almost all y∤ℓ its Frobenius eigenvalues are algebraic and pure of weight k+w(ξ). These statements apply to actual finite-level summands, independently of local Langlands.

Hypotheses: Smooth proper X_U and the abelian-power projector; coefficient field of definition fixed.

Construction or proof:

1. Apply étale finiteness and continuity at finite level.
2. Spread the smooth proper abelian tower and algebraic correspondences away from finitely many places.
3. Apply the proper smooth purity theorem to the summand, tracking m_ξ−2t_ξ=w(ξ).

Acceptance: The Tate twist changes the weight by −2t_ξ. Removing purity from an alternating sum cannot replace the finite-level purity statement.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Proposition 5.3(ii)–(iii), pp. 34–35. Only the geometric finiteness and weight assertions are used here.

### Automorphic multiplicity spaces in the tower

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces` (construction; unchecked).

For π^∞ irreducible admissible occurring in H^k(ξ), let R^k_{ξ,ℓ}(π^∞)=Hom_{G(A_f)}(π^∞,H^k(ξ)), with its commuting Galois action. In the characteristic-zero discrete automorphic decomposition of the compact tower, H^k(ξ)=⊕_{π∞}π^∞⊗R^k_{ξ,ℓ}(π^∞). R^k is finite-dimensional; R_{ξ,ℓ}(π∞)=Σ_k(−1)^k[R^k] remains a virtual representation.

Hypotheses: Compact quotient and the semisimple automorphic decomposition at the chosen central character; π∞ has finite-level invariants.

Uses:

- `Shin Theorem 6.4 and Corollary 6.5`: Separates the automorphic factor from actual Galois multiplicities.
- `AG2.1b actual constituent`: The object from which a genuine representation is extracted.

Planning API:

- `MultiplicitySpace.evaluation` (compatibility): The evaluation map π∞⊗Hom(π∞,H^k)→the π∞-isotypic summand is an isomorphism under the discrete semisimple decomposition.
- `MultiplicitySpace.galois` (functoriality): Galois acts by postcomposition on Hom and commutes with evaluation.
- `MultiplicitySpace.finite` (projection): Choose a small level with nonzero π∞ invariants to bound dim R^k by finite-level cohomology.
- `MultiplicitySpace.virtual` (constructor): The virtual multiplicity is Σ_k(−1)^k[R^k].

Discriminating tests:

- `MultiplicitySpace.absent` (degenerate): If π∞ is absent then every R^k is zero.
- `MultiplicitySpace.double` (computation): Two copies of π∞ give a two-dimensional multiplicity space.
- `MultiplicitySpace.cancellation` (non-example): Equal multiplicity spaces in adjacent degrees give zero virtual class with nonzero actual spaces.

Construction or proof:

1. Use the compact automorphic spectral decomposition and Schur isotypic multiplicities.
2. Transport the commuting Galois action to Hom; take finite-level invariants to prove finiteness.

Acceptance: A multiplicity greater than one is retained. Virtual R cannot be replaced by a rank-n Galois representation before cancellation.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action`, `AutomorphicFormsOnReductiveGroups:AF.1`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-1-simple-modules-schur-and-isotypic-components`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2 decomposition (5.5), p. 34. The multiplicity space is graded before its alternating sum.

### The raw geometric fixed-point trace identity

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity` (theorem; unchecked).

For a good reduction prime p≠ℓ and sufficiently large Frobenius power, the alternating trace of a Hecke correspondence times geometric Frobenius on H^k_U(ξ) equals the fixed-point sum with the coefficient trace. When expressed as a sum over admissible Kottwitz triples, the local orbital integrals, volumes and effectivity multiplicities belong to the compact PEL instance. No local Langlands parameter or automorphic Galois representation occurs in this identity.

Hypotheses: Correspondence and Frobenius power satisfy the Fujiwara/Varshavsky fixed-point hypotheses; good integral model and all coefficient factors fixed.

Construction or proof:

1. Use the generic cohomological-correspondence fixed-point theorem.
2. Identify fixed points with the effective polarized O_F-linear objects and their Kottwitz invariant.
3. Rewrite the raw count as orbital integrals without spectral stabilization.

Acceptance: The equality is alternating until the weight argument is supplied. Ineffective triples contribute zero.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`, `PELModuli:M4`, `EtaleDualityAndPerverseSheaves:EDC.8`, `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`.

Sources:

- [Sug Woo Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2, pp. 13–14; §4.4, Theorem 4.4, p. 15. The raw count requires the actual effectivity and coefficient factors.

### Raw nearby-cycle and stratum traces

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces` (theorem; unchecked).

For the compact Drinfeld model at w|p≠ℓ, identify the generic-fibre alternating trace with the trace on the special fibre with RΨL_ξ. Decompose by Newton/Drinfeld strata and the compatible Igusa level covers before applying any local Langlands correspondence. Retain the nearby-cycle monodromy operator and its filtration rather than replacing it by zero.

Hypotheses: Proper integral model; the actual ramified O_{F_w} charts and coefficient projector; p split in E.

Construction or proof:

1. Use proper base change for nearby cycles and specialize the correspondences.
2. Apply the raw trace theorem on strata with the nearby-cycle coefficients.
3. Use the Drinfeld and Igusa comparison to organize the stratum sum.

Acceptance: A ramified model requires its verified chart contract. The raw identity makes no claim that its alternating summand is an actual representation.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`, `IgusaVarietiesAndTorsionConcentration:IG.1/harris-taylor-igusa-varieties`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Proposition 5.2 and §5.2, pp. 33–34. The geometric stratum identity supplies the Mantovan comparison.

## AG2.1b. Automorphic constituents after local comparison

The compact global Mantovan formula is a representation-valued Ext/level-colimit identity, with its dimension twist and Weil action. The local comparison needed to evaluate that functor is supplied by ET.6/ET.6a. The Igusa computation then retains Shin's Case ST and Case END, the prescribed character and transfer factors, and the signs e₀,e₁,e₂. All ramification, infinity-type and central-character hypotheses are part of the theorem.

Three outputs must be proved separately. The stabilized trace first identifies a virtual class. Selected-constituent weight separation then concentrates it in degree n−1. Finally every irreducible Galois multiplicity must be divisible by C_G before an actual rank-m constituent can be extracted. Neither total-rank divisibility nor an equality in a Grothendieck group substitutes for the last step. The unavailable Harris–Taylor passages are recorded as two distinct source gaps.

Coverage: **planned**. Every stage target is an own declaration, an exact imported contract or an explicitly identified ownership/source gap; planned does not mean closed or implemented.

Requirements for closure:

- Read and prove the HT01 p. 207 weight-cancellation and Proposition VII.1.8 irreducible-multiplicity divisibility steps; close the precise ramified Mantovan/Ext and ST/END trace/sign supplier contracts.

Atlas planets: Mantovan formula; Shin’s Igusa computation; Middle-degree concentration; Galois constituents of cohomology.

### The compact global Mantovan formula

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula` (theorem; unchecked).

For every Newton class b of the compact datum, define Mant_{b,μ}(ρ) by the colimit over Rapoport–Zink levels of the alternating Ext^i_{J_b(Q_p)}(H^j_c(M_{b,μ}),ρ), with the source’s dimension twist (−D) and sign (−1)^{i+j}. Shin Proposition 5.2 gives [H(Sh,L_ξ)]=Σ_b Mant_{b,μ}([H_c(Ig_b,L_ξ)]) as a class with commuting prime-to-p Hecke and Weil actions. The split local factors tensor as in (5.6).

Hypotheses: Mantovan’s cohomology, smooth derived Ext, towers and actions for the chosen compact Drinfeld model; the dimension twist is included.

Construction or proof:

1. Import the representation-valued Rapoport–Zink and Igusa cohomology functor and derived Ext.
2. Apply the almost-product stratum comparison and compact-support descent.
3. Sum the alternating Ext/cohomology classes and keep the Weil twist.

Acceptance: This is the global formula of Proposition 5.2, not only a local slogan. Changing D changes the Frobenius normalization.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces`, `IgusaVarietiesAndTorsionConcentration:IG.1/harris-taylor-igusa-varieties`, `HeckeStacksAndLocalShtukas:HS3`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `IgusaVarietiesAndTorsionConcentration:IG.1`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §2.2, Mantovan functor (2.1), p. 9; Proposition 5.2, p. 34. The required global formula includes the Ext/colimit functor and normalization.

### Shin’s stable and endoscopic Igusa computation

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation` (theorem; unchecked).

Under Shin §6.1, n≥3 is odd, Π=ψ⊗Π₁ is θ-stable, generic Ξ-cohomological, and Ram_Q(Π) lies in Spl_{F/F⁺,Q}; the finite set S also contains the ramification of F and the auxiliary odd character ϖ. In Case ST, Π₁ is cuspidal. In Case END, m₁>m₂>0, m₁+m₂=n, Π is transferred from ψ_H⊗Π₁⊗Π₂, each Π_i is conjugate-self-dual cohomological cuspidal and the central-character condition §6.1(ii) holds. Set C_G=|ker¹(Q,G)|τ(G). Theorem 6.1 computes BC(H_c(Ig_b,L_ξ){Π^S}) as C_G e₀[Π^{∞,p}]Red_n^b(π_p) in ST and (C_G/2)[Π^{∞,p}] · (e₁Red_n^b(π_p)+e₂Red_{m₁,m₂}^b(π_H,p)) in END, with e_i∈{±1} independent of b and the §3.6 transfer factors.

Hypotheses: All displayed §6.1 datum, ramification, central-character and infinity hypotheses; the END blocks and parity character are fixed.

Construction or proof:

1. Apply the stable Igusa trace formula with the exact compact datum and transfer factors.
2. Use twisted character identities and linear independence to isolate the Π^S component.
3. Compute archimedean packet signs using §3.6; retain e₁ and e₂ separately.

Acceptance: The factor 1/2 appears in END only. e₁=e₂ is not imposed before the packet computation.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`, `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §6.1 and Theorem 6.1, pp. 41–46. The specialized ST/END computation retains the signs and C_G factors.

### The virtual Weil constituent comparison

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison` (theorem; unchecked).

Under the ST/END hypotheses, Theorem 6.4 identifies the base-changed alternating Π-part with C_G times the selected local Weil constituent, with the GL₁ character. In ST it is e₀ χ₀⊗L_n(Π₁,w). In END it is e₁ χ₀⊗L_{m₁}(Π_{M,1,w})|·|^(−m₂/2) if e₁=e₂, and e₁ χ₀⊗L_{m₂}(Π_{M,2,w})|·|^(−m₁/2) if e₁=−e₂. This equality is in the Weil Grothendieck group and has not yet removed alternating degrees or divided an actual representation by C_G.

Hypotheses: w over a rational prime split in E, w∤ℓ; exact local transfer and the normalized Mantovan formula.

Construction or proof:

1. Insert the Igusa ST/END computation in the global Mantovan formula.
2. Apply the local Harris–Taylor/Mantovan calculation, including Sp_s terms and normalized parabolic induction.
3. Sum the reduction functors using Shin Proposition 2.3 and retain the GL₁ correction.

Acceptance: The selected rank is n, m₁ or m₂ according to the case/sign, never always n. All identities here are virtual.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`, `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Propositions 2.2–2.3, pp. 10–11; Theorem 6.4, pp. 46–47. The local computation applies to the required generalized Steinberg and parabolic cases.

### Weight separation into the middle degree

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree` (theorem; unchecked).

For π∞ in the ST/END Π-part, R^k_{ξ,ℓ}(π∞)=0 for k≠n−1. Thus the alternating multiplicity is (−1)^(n−1)[R^{n−1}], an actual representation up to the explicit sign. In particular e₀=(−1)^(n−1) in ST and e₁=(−1)^(n−1) in END.

Hypotheses: The virtual Weil formula, geometric purity of every actual degree k, and the selected constituent purity/temperedness argument of Shin Corollary 6.5; no equality of virtual dimensions is used as cancellation.

Construction or proof:

1. Compare Frobenius eigenvalue weights k+w(ξ) for the actual graded summands with the selected constituent weights.
2. Use the Harris–Taylor argument cited in Corollary 6.5 to rule out other degrees.
3. Read the remaining alternating sign from the actual middle degree.

Acceptance: An artificial pair of equal adjacent-degree summands is excluded by distinct geometric weights.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `DeligneWeightsAndPurity:DWP.0`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 6.5(i)–(ii) and proof, pp. 47–49. The source explicitly uses Proposition 5.3(iii) and HT01 p. 207.

### The archimedean packet multiplicity

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity` (theorem; unchecked).

Under ST/END, the sum of discrete multiplicities at the ith relevant cohomological archimedean packet member is τ(G) for all i in ST; in END it is τ(G) for i≤m₁ if e₁=e₂, or i>m₁ if e₁=−e₂, and zero for the other indices. These are the multiplicities of Shin Corollary 6.5(iv), compatible with the ξ highest-weight partition W^1_κ⊔W^2_κ.

Hypotheses: The exact cohomological packet and signs of §3.6/§6.1, with middle-degree concentration.

Construction or proof:

1. Combine Lie-algebra cohomology dimensions from Proposition 5.3(i) with the stabilized virtual character.
2. Use the selected archimedean partition and packet transfer to determine which indices contribute.

Acceptance: END has vanishing members as well as the contributing members.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`, `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`, `AutomorphicFormsOnReductiveGroups:AF.1`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 6.5(iv), pp. 47–48. The formula selects one END block and preserves the packet multiplicity.

### The actual Galois constituent of cohomology

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology` (construction; unchecked).

For the selected ST/END Π-part, semisimplify the actual middle-degree Galois multiplicity space to R̃. The source proves that R̃ is C_G copies of a continuous semisimple representation R̃₀, and then removes the GL₁ character ψ by class field theory. The resulting R′_ℓ(Π) has rank n in ST, m₁ in END with e₁=e₂, or m₂ with e₁=−e₂; it is independent, up to isomorphism, of τ and ψ. At the source’s split primes its Weil Grothendieck class is exactly (6.31), with the selected half-dimensional norm twist.

Hypotheses: Middle-degree concentration, packet multiplicity and the actual multiplicity divisibility argument in Shin Corollary 6.8/Remark 6.9; de Rham comparison for the geometric summand is used to obtain the distinct labelled dimensions.

Uses:

- `AG2.2 geometric polarized existence`: Supplies the effective constituent with known normalization.
- `ET.6 export`: The genuine cohomological Galois representation with the raw source supplied by AG2.1a.

Planning API:

- `ActualConstituent.rank` (characterisation): dim R′ equals the selected n, m₁ or m₂.
- `ActualConstituent.copies` (compatibility): Before removing ψ, R̃≅R̃₀^{⊕C_G} as Galois representations.
- `ActualConstituent.independent` (functoriality): Changing τ or the auxiliary ψ produces an isomorphic corrected constituent.
- `ActualConstituent.goodWeil` (projection): At source split primes recover the selected class (6.31), including the norm twist.

Discriminating tests:

- `ActualConstituent.stableRank` (computation): Case ST n=3 gives rank 3 after removing C_G copies.
- `ActualConstituent.endRank` (computation): For n=5,m₁=3,m₂=2 the two sign cases give rank 3 and 2 respectively.
- `ActualConstituent.rankOnly` (non-example): A semisimple rank-4 representation with irreducible multiplicities 1 and 3 cannot be divided into two copies merely because 2 divides 4.

Construction or proof:

1. Vary τ and apply Frobenius-density recognition to identify the actual semisimple multiplicity representation.
2. Use the labelled de Rham dimensions and HT01 Proposition VII.1.8 as specified in Remark 6.9 to divide multiplicities by C_G.
3. Remove ψ using the character dictionary; use Frobenius density for independence.

Acceptance: Rank divisibility alone is insufficient: every irreducible multiplicity must be divisible by C_G. The central-character twist is explicitly removed.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`, `AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `PadicHodgeTheory:R06.5`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 6.8 and Remark 6.9, p. 49. The proof extracts a true rank-n or selected-rank representation; it does not divide a virtual dimension.

## AG2.2. Polarized cuspidal and discrete automorphic systems

The compact geometric existence theorem initially has the Shin-regular range and the technical auxiliary-field hypotheses. Even rank uses an odd-dimensional endoscopic datum with an added character; its parity and scalar corrections remain visible. Arbitrary regularity is supplied by AG2.3. Essentially polarized representations use a globally compatible algebraic Hecke character, not pointwise square roots of a multiplier.

HLTT's classical unitary input can be square-integrable and discrete. Its stable base change is therefore decomposed into cuspidal blocks with their multiplicities and norm strings. The construction takes a normalized rank-m_i representation for each cohomological constituent as input. The resulting rank-2n direct sum has twists ε_ℓ^{−n−j}. This normalization is derived from the two displayed norm exponents; omitting the varying j gives the wrong polynomial. The published Caraiani–Scholze cohomological corollary treats its selected two-block transfer with its own splitting set and auxiliary parity character. It is not used as a theorem for arbitrary discrete GL_N representations.

Solvable restriction is a good-polynomial identity once the representations exist. Effective descent belongs to the separate patching argument. The full automorphic polarization sign is an AG2.3 export after arbitrary-regular construction. Regular GSp₄ constructions and their specialized ramified comparisons have the dedicated ownership gap described below.

Coverage: **planned**. Every stage target is an own declaration, an exact imported contract or an explicitly identified ownership/source gap; planned does not mean closed or implemented.

Requirements for closure:

- Close the auxiliary character, discrete-transfer/classification and solvable base-change contracts. Instantiate discrete blocks with the arbitrary-regular AG2.3 output. The full sign export is AG2.3; the proposed GSp₄ owner must be created.

Atlas planets: Shin-regular Galois representations; Algebraic polarization twists; Discrete unitary Galois assembly.

### Geometric existence in the Shin-regular range

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence` (theorem; unchecked).

For CM F and regular algebraic conjugate-self-dual cuspidal π of GL_m(A_F), m≥2, suppose m is odd, or for even m the algebraic highest weight has a_{σ,k}>a_{σ,k+1} for some embedding σ and odd k. Under the technical §7.1 conditions F=EF⁺, [F⁺:Q]≥2 and all ramification of F and π over rational primes split in F/F⁺, the compact construction gives a continuous semisimple rank-m r attached to π. For odd m use ST with n=m; for even m use END with n=m+1 and an auxiliary character chosen so that e₁=e₂, then remove its parity and norm corrections. This node asserts good-place attachment and rank; the comparison and coefficient-prime conclusions have separate owners.

Hypotheses: Shin §7.1 technical datum; m=1 is supplied by the character dictionary; slight regularity for even m is retained.

Construction or proof:

1. Choose the auxiliary odd Hecke character and the coefficient extension as in Lemmas 7.1–7.2.
2. For even m insert a rank-one END block into the strict odd-index gap and use Lemma 7.3 to select the rank-m block.
3. Apply the actual constituent construction and remove ψ, parity and norm twists; compare good polynomials.

Acceptance: Even rank with no odd-index gap is excluded from this geometric node. n=m+1 in the even-rank construction.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

Sources:

- [Sug Woo Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §7.1, Lemmas 7.1–7.3 and Proposition 7.4, pp. 50–53. The rank-m effective representation is built by the selected ST/END geometry.

### Twisting an essentially self-dual form into unitary type

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist` (theorem; unchecked).

For a CM regular algebraic cuspidal polarized pair (π,χ), choose an algebraic Hecke character ψ with ψψ^c=χ∘N_{F/F⁺} in the source’s compatible infinity-type and parity convention. Then π⊗ψ^−1∘det is conjugate self-dual. Given a good-place attached representation r₀ for the twisted form, r=r₀⊗r(ψ) is attached to π. A change of ψ changes the construction only up to the unique good-place attached isomorphism. The existence of ψ uses the idele-character extension compatibility, not a pointwise square root of χ.

Hypotheses: Compatible algebraic infinity types and finite-order parity, after the parity correction AG2.0/E2 for total oddness; the source extension lemma applies.

Construction or proof:

1. Import the algebraic Hecke-character extension lemma of CHT08 Lemma 4.1.4 with its global-unit compatibility.
2. Compute the conjugate dual of π⊗ψ^−1.
3. Apply attachment operations and uniqueness to the corrected representation.

Acceptance: For ψ=1 this is the conjugate-self-dual case. A character with incompatible global-unit restrictions is not admitted.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

Sources:

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Proof of Theorem 2.1.1, p. 34. The proof twists the polarized form to conjugate-self-dual type.
- [Laurent Clozel and Jack A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), Lemma 7.4 and proof, accepted copy pp. 47–48. The rank-two route explicitly checks the odd infinity-weight and conjugate-character conditions.

### Galois assembly for discrete unitary transfer

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly` (construction; unchecked).

For cohomological square-integrable Π on HLTT G_n(A), write 2n=Σ_i m_i n_i and BC(Π)_v=⊞_i⊞_{j=0}^{n_i−1} π̃_{i,v}|det|^{(n_i−1)/2−j} at the source’s good places, where π̃_i is conjugate-self-dual cuspidal and π_i=π̃_i||det||^{(m_i+n_i−1)/2} is cohomological. Given normalized rank-m_i attached r_i for π_i, form R(Π)=⊕_i⊕_{j=0}^{n_i−1} r_i⊗ε_ℓ^{−n−j}. Its rank is 2n and its good-place WD semisimplification is rec(BC(Π)_v|det|^{(1−2n)/2}). The input r_i are supplied individually; this assembly does not presume they all lie in the Shin-regular geometric range.

Hypotheses: Discrete transfer/classification in HLTT Proposition 1.2; actual rank-m_i normalized representations supplied; good places q≠ℓ with q split in F₀ or F and Π unramified above q.

Uses:

- `HLTT Corollary 1.3 and Lemma 6.2`: Supplies the 2n Galois representation attached to a classical discrete G_n eigensystem.
- `CS Corollary 5.5.5`: The same discrete-versus-cuspidal distinction must be retained in cohomology inputs.

Planning API:

- `DiscreteAssembly.rank` (characterisation): rank R=Σ_i m_i n_i=2n.
- `DiscreteAssembly.goodPolynomial` (projection): The good Frobenius polynomial is the product of the scalar-twisted polynomials of r_i.
- `DiscreteAssembly.continuous` (compatibility): Finite sums of continuous finite-field representations are continuous and semisimple.
- `DiscreteAssembly.choice` (functoriality): Replacing each supplied r_i by an isomorphic attached representative gives an isomorphic R.

Discriminating tests:

- `DiscreteAssembly.singleBlock` (computation): n=1,m₁=1,n₁=2 gives r₁ε^−1⊕r₁ε^−2.
- `DiscreteAssembly.cuspidal` (degenerate): n₁=1,m₁=2n gives r₁ε^−n, tracking the cohomological twist on π₁.
- `DiscreteAssembly.rank` (non-example): Taking only one copy of each r_i gives the wrong rank when some n_i>1.

Construction or proof:

1. Apply discrete stable transfer and the GL square-integrable classification.
2. The normalized r_i parameter has norm exponent (m_i+n_i−1)/2+(1−m_i)/2=n_i/2 on π̃_i.
3. Subtract from (n_i−1)/2−j+(1−2n)/2 to obtain −n−j, then use direct sum and scalar twists.

Acceptance: The total rank is Σm_i n_i=2n. For n_i>1 the cyclotomic twists differ as j varies. Cuspidal-only existence cannot justify this discrete assembly without the classification.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 1.2 and Corollary 1.3, p. 31. The discrete decomposition and its good-place parameter determine the twists.

### The Caraiani–Scholze discrete normalization

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization` (comparison; unchecked).

For an irreducible admissible Π^S in BC^S[H_c(I_Mant^b,Q̄_ℓ)]_Sur of CS Corollary 5.5.5, Corollary 5.5.2 chooses the specified transfer from G_{n₁,n₂}, with Π⃗=ψ⊗Π₁⊗Π₂ and n₁+n₂=N. Let r_i be the representation for the L-algebraic parameter Π_i|det|^{(1−n_i)/2}. The character |det|^{(n_i−N)/2}(ϖ∘N_{F/𝒦})^{ε(N−n_i)} is L-algebraic, with Galois character ε_i. Then r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i has rank N, is unramified outside the places above S∪{ℓ}, and at v above q∈Spl_{𝒦/Q} outside S∪{ℓ} has the displayed integral Hecke polynomial. The parity ε takes values 0 or 1 and ϖ has odd infinity exponent. This is the selected two-block cohomological transfer, not an assertion about every abstract discrete GL_N representation. The full local normalization at the specified split places is the separate Remark 5.5.6 comparison contract.

Hypotheses: The exact cohomological surjection and transferred packet of Corollaries 5.5.2/5.5.5; published numbering; specified imaginary quadratic 𝒦, source splitting set, n₁+n₂=N and odd ϖ.

Construction or proof:

1. Choose the two-block transfer supplied by Corollary 5.5.2, then r_i by Theorem 5.5.4.
2. Check ((N−n_i)+ε(N−n_i)δ)/2 is integral for the odd infinity exponent δ of ϖ.
3. Apply the displayed L-morphism and normalized parabolic-induction identity, then sum r_i⊗ε_i and compare good polynomials.

Acceptance: When all N−n_i are even the parity correction is trivial. An odd block difference needs the selected auxiliary character.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`.

Sources:

- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Corollary 5.5.5, pp. 745–746. The discrete case requires the displayed blockwise parity/norm corrections.

### Attachment under cuspidal solvable base change

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change` (theorem; unchecked).

If F′/F is solvable, π′=BC_{F′/F}(π) is cuspidal regular algebraic, and r is attached to π, then (r|_{G_{F′}})^ss is attached to π′. If another semisimple representation is attached to π′, good Frobenius polynomials identify it with this restriction. This is a specialization of automorphic base change and Galois restriction, distinct from the effective descent theorem used to construct r over F.

Hypotheses: Existence and good-place Satake compatibility of the specified solvable base change; cuspidality is assumed or ensured by avoiding finite self-twist fields.

Construction or proof:

1. At a good w|v, Frobenius is the residue-degree power of Frobenius at v.
2. Use the automorphic base-change Satake power identity and Frobenius recognition.

Acceptance: A degree-f residue extension raises every good Satake root to its fth power.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.1, proof of Theorem 3.1.2, p. 9. Good-polynomial compatibility identifies restrictions along the chosen base changes.

## AG2.3. Removing auxiliary geometric hypotheses

The definite-unitary eigenvariety is a specific automorphic instance of the finite-slope machinery already owned by L4 and L2a. CH’s §2 interpolation initially has even rank and all Special Hypotheses 1.2, including sphericality at nonsplit places. AF.4 supplies the definite-unitary Banach forms and classicality. The target point has an Iwahori refinement at a split coefficient-prime place v₀; other labelled infinity weights stay fixed. Strongly regular classical points determine its good Hecke functions. Their density requires definite-unitary classicality, which is not a consequence of a Fredholm decomposition alone.

Continuous characteristic-zero pseudocharacter interpolation and semisimple reconstruction are imported from IHG.4/R01. A reducible target is allowed, so a theorem requiring residual absolute irreducibility cannot justify continuity. The affinoid characteristic-zero contract is distinct from IHG.4's uniform integral congruence witnesses used by HLTT.

The odd-rank geometric branch is separate from this even-rank interpolation. S-general extension families and effective patching remove the field conditions; CH Theorem 3.1.2 treats slight regularity and the first paragraph of the proof of 3.2.3 applies the removal to the arbitrary-regular finite-slope branch. Solvable-index induction removes the local Iwahori and finite-slope restrictions, including targets which have no finite-slope refinement at the coefficient prime. Frobenius uniqueness then identifies all constructions. Bellaïche–Chenevier supplies the automorphic sign, beyond good-place self-duality. The common finite realization field additionally needs regular Hodge–Tate input; this dependence is explicit and does not enter the early trace-field dictionary.

Coverage: **planned**. Every stage target is an own declaration, an exact imported contract or an explicitly identified ownership/source gap; planned does not mean closed or implemented.

Requirements for closure:

- Supply the definite-unitary Banach/lattice/classicality/density contract and its cited Chenevier proof; characteristic-zero affinoid pseudocharacter continuity for reducible specialization; effective S-general patching and prime-degree local globalization; prove the regular Hodge–Tate criterion used in finite realization fields.

Atlas planets: Chenevier–Harris Galois representations; Definite unitary eigenvarieties; Strongly regular classical density; Automorphic Galois patching; Bellaïche–Chenevier polarization sign; Finite fields of realization.

### Arbitrary regular conjugate-self-dual existence

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` (theorem; unchecked).

For any CM F, regular algebraic conjugate-self-dual cuspidal π on GL_n(A_F), prime ℓ and coefficient isomorphism ι, there is a unique-up-to-isomorphism continuous semisimple rank-n r attached at good places. No odd-rank, slight-regularity, finite-place square-integrability, finite-slope, unramified-field or imaginary-quadratic-subfield hypothesis remains. CH Theorem 3.2.3 also proves domination away from ℓ and the de Rham/crystalline/semistable assertions, but those exports are assigned to AG2.5 and AG2.6. For an essentially polarized form apply the algebraic-character twist and undo it.

Hypotheses: Regular algebraic cuspidal and conjugate self-dual; n=1 comes from class field theory. The GSp₄ case is assigned to the dedicated proposed owner.

Construction or proof:

1. Construct the finite-slope definite-unitary target point from strongly regular classical points.
2. Remove the field and unramified hypotheses by S-general patching, and remove the Iwahori hypothesis by induction on solvable index.
3. For essentially polarized pairs, apply the prescribed algebraic polarization twist and recover good-place attachment.

Acceptance: An even-rank form whose weight has no strict odd-index gap is included. Every coefficient prime is included, including those at which the initial eigenvariety point has no finite-slope refinement.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction`, `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 3.2.3 and proof, pp. 11–12. Arbitrary regular CSD existence follows from the separate interpolation and patching steps.

### The definite-unitary eigenvariety instance

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance` (construction; unchecked).

Under CH General Hypotheses 1.1 and all Special Hypotheses 1.2, including Π spherical at nonsplit places (1.2.2), K/F is unramified at finite places and [F:Q] is even. The hermitian V₀ gives a unitary G₀ compact at all real places and quasi-split at finite places. Choose v₀|ℓ split in K and an Iwahori refinement of Π there; fix weights at all other real places, and tame Bernstein components with the prescribed local monodromy bound. Specialize the group-independent finite-slope eigenvariety to overconvergent G₀ forms varying the weights belonging to v₀. The classical Π gives a point x with its good Hecke eigenvalues.

Hypotheses: General Hypothesis 1.1 and Special Hypotheses 1.2 and 2.2; n even in the interpolation step; a genuine finite-slope refinement at v₀.

Uses:

- `CH Theorem 2.3`: Approximates a regular target by the geometric strong-regularity range.
- `AG2.3 local Hodge export`: Fixed other weights are the condition needed for the relative p-adic Hodge comparison.

Planning API:

- `DefiniteFamily.classicalPoint` (constructor): A refined classical Π with the fixed tame/infinity data gives x.
- `DefiniteFamily.fixedWeights` (characterisation): All labelled weights away from v₀ are fixed in the family.
- `DefiniteFamily.goodEigenvalues` (projection): At x, spherical operators specialize to the good Hecke eigenvalues of Π.
- `DefiniteFamily.tameType` (compatibility): At tame split places every classical point lies in the prescribed Bernstein component with the source local bound.

Discriminating tests:

- `DefiniteFamily.fixedWeight` (compatibility): Varying a weight at an embedding not attached to v₀ violates the family contract.
- `DefiniteFamily.missingRefinement` (non-example): An infinite-slope eigensystem does not give a point of a finite-slope chart.
- `DefiniteFamily.classicalSpecialization` (computation): At a classical point the good Hecke polynomial is the integral polynomial specialized to Π.

Construction or proof:

1. Use CH Lemma 2.1 and stable descent to G₀.
2. Construct the linked Banach family with compact controlling operator at v₀.
3. Import L4 finite-slope summands and L2a gluing; identify x through the eigenpacket-points theorem.

Acceptance: Weights away from v₀ are held fixed. A target with no finite-slope refinement cannot be inserted in this chart and needs the solvable-index step.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `PadicFamilies:L2a/linked-banach-families`, `PadicFamilies:L2a/eigenpacket-points`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `AutomorphicFormsOnReductiveGroups:AF.4`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Lemma 2.1, Hypotheses 2.2 and proof of Theorem 2.3, p. 8. This is a specific definite-unitary instance, not a second generic eigenvariety construction.

### Density of strongly regular classical points

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density` (theorem; unchecked).

In the CH definite-unitary family, classical points whose varied algebraic weights lie sufficiently far in the dominant chamber and satisfy slight regularity are Zariski dense in the required finite-slope charts. They retain the fixed other archimedean weights and tame local data. These points have geometric attached representations from AG2.2 and are sufficient to determine analytic good-place trace functions.

Hypotheses: The source’s classicality bounds relative to the chosen finite slope and coefficient family; density is asserted on the relevant charts, not on arbitrary eigenvarieties.

Construction or proof:

1. Use the definite-unitary classicality theorem at sufficiently dominant weights.
2. Choose arithmetic weights in the strict chambers satisfying the additional odd-index gap.
3. Use their density in weight space and finite Hecke charts to obtain the determining set.

Acceptance: Generic Fredholm finite-slope decomposition supplies no classicality by itself.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`, `PadicFamilies:L2a/finite-hecke-images`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `AutomorphicFormsOnReductiveGroups:AF.4`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proof of Theorem 2.3, p. 8; references to Ch Theorems 3.3 and 3.5. The classicality/density input is not furnished by the group-independent spectral theorem.

### Determinant interpolation on the definite family

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation` (theorem; unchecked).

The traces of the rank-n geometric attached representations at the dense strongly regular classical points extend to a continuous degree-n determinant on G_{K,S} with values in the reduced affinoid Hecke algebra of each relevant chart. Its good Frobenius characteristic polynomial is the analytic integral Hecke polynomial. At x, specialization and semisimple reconstruction give a continuous rank-n representation r_x over Q̄_ℓ, without an absolute-irreducibility hypothesis on r_x.

Hypotheses: One common finite ramification set S, reduced affinoid Hecke charts, continuous bounded trace interpolation, characteristic zero so n! is invertible, and finite-field continuity of the specialized semisimple representation.

Construction or proof:

1. Use dense classical points to enforce determinant/pseudocharacter identities on the reduced chart.
2. Apply the generic interpolation and continuity contract, then specialize at x.
3. Use algebraically closed semisimple reconstruction; obtain continuity by the characteristic-zero pseudocharacter continuity theorem, rather than invoking a residual absolutely irreducible matrix theorem.

Acceptance: Reducible r_x is allowed. A nonreduced chart cannot be checked by classical point values alone.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density`, `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3 and proof, p. 8. The family interpolation is evaluated at the arbitrary regular target.

### Existence at the regular finite-slope target

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-slope-regular-target-existence` (theorem; unchecked).

Under CH Hypotheses 1.1, 1.2 and 2.2, a regular CSD cuspidal Π has a unique continuous semisimple rank-n good-place attached r, without Hypothesis 1.3. The assertion includes even rank without slight regularity, because it is obtained by specializing the determinant at x, not by identifying Π itself with a geometric middle-degree constituent.

Hypotheses: A split coefficient place with Iwahori invariants and the technical unramified CM datum of the definite-unitary family. CH §2 takes n even; the odd-rank existence branch comes from the geometric theorem. This node is the even-rank finite-slope step of the general construction.

Construction or proof:

1. Take r_x from determinant interpolation.
2. Use good-eigenvalue specialization to verify attachment.
3. Use the early good-place uniqueness theorem.

Acceptance: An even-rank weight with repeated adjacent highest-weight entries is allowed if π is regular algebraic.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3, p. 8. The theorem explicitly drops Hypothesis 1.3.

### The automorphic S-general extension family

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families` (construction; unchecked).

For K/F CM, a finite forbidden set S and auxiliary finite extension M, choose cyclic prime-degree totally real F′/F disjoint from M, splitting the required places outside S and meeting the specified local splitting/ramification conditions. Their composita K′=KF′ give the S-general families used by CH §3.1. Enlarge M to exclude the finitely many self-twist extensions so that BC_{K′/K}(Π) stays cuspidal. S-general means: for every finite M/K and v∉S there is K′ disjoint from M with v split completely.

Hypotheses: Only compatible prime-degree Grunwald–Wang prescriptions, including real places; no special 2-power case is invoked.

Uses:

- `CH Theorem 3.1.2`: Removes the auxiliary geometric field hypotheses.
- `CH Theorem 3.2.3`: Supplies the inductive patching families.

Planning API:

- `SGeneralFamily.disjoint` (projection): Given every finite M, obtain an extension linearly disjoint from M.
- `SGeneralFamily.splitPlace` (projection): Given v∉S, choose that extension with v split completely.
- `SGeneralFamily.cuspidal` (compatibility): Avoiding the finite self-twist fields preserves cuspidality of base change.

Discriminating tests:

- `SGeneralFamily.quantifier` (non-example): An infinite collection all containing one fixed nontrivial extension is not S-general.
- `SGeneralFamily.split` (computation): At a prescribed split place the local completion of each branch is the original field.
- `SGeneralFamily.forbidden` (degenerate): No splitting assertion is made for v∈S unless included in the local prescription.

Construction or proof:

1. Use the prime-degree Grunwald–Wang approximation and auxiliary nonsplit primes to force disjointness.
2. Exclude the finite cuspidality obstruction fields by adjoining them to M.
3. Verify the S-general quantifiers, which are stronger than merely infinitely many extensions.

Acceptance: Disjointness is quantified for every M. Preserving one testing place is independent of changing another local completion.

Direct prerequisites: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.1 and Lemma 3.2.1, pp. 9–10. These are the exact families needed by effective patching.

### Effective Galois patching for automorphic base changes

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching` (theorem; unchecked).

For an S-general family K_i/K of cyclic extensions of a fixed prime degree, let r_i be continuous semisimple rank-n representations of G_{K_i}, invariant under Gal(K_i/K), with isomorphic restrictions on every compositum K_iK_j. Sorensen’s effective patching theorem yields a unique continuous semisimple rank-n r of G_K restricting to every r_i. For attached base-change r_i, good Frobenius polynomials establish both invariance and pairwise compatibility and then good-place attachment of r.

Hypotheses: All S-general quantifiers and all overlap/invariance conditions; actual representations r_i, not only virtual classes or traces.

Construction or proof:

1. Use base-change good-polynomial identities and density to verify the two compatibility conditions.
2. Import the effective continuous patching theorem.
3. Choose split testing places from S-generality to identify the descended good polynomials.

Acceptance: Pairwise equal traces without invariance and S-generality is insufficient.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`, `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `ArithmeticGaloisRepresentations:R01.5`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.1, patching lemma and Theorem 3.1.2, p. 9. The effective descent, not a trace-only construction, removes the field restrictions.

### Removal of the geometric field hypotheses

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/removal-of-geometric-field-hypotheses` (theorem; unchecked).

The good-place rank-n representation constructed in the geometric or finite-slope range descends over an arbitrary CM K after choosing S-general base changes that make the real degree even, the CM extension unramified and the necessary coefficient place split while preserving cuspidality. Thus the imaginary-quadratic-subfield, degree and field-ramification assumptions are construction devices rather than final hypotheses.

Hypotheses: CSD regular cuspidal Π; the local finite-slope or slight-regularity hypothesis needed by the chosen construction is retained at this step.

Construction or proof:

1. Use the CH §3.1 extension family to reach the relevant auxiliary geometry.
2. Check conjugation and overlap identities using the common automorphic good polynomials.
3. Apply effective patching.

Acceptance: Every additional construction field is removed from the conclusion.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`, `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-slope-regular-target-existence`, `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 3.1.2 and proof, p. 9. This step removes Hypotheses 1.2, before the solvable-index induction.
- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proof of Theorem 3.2.3, first paragraph, p. 11. The arbitrary-regular finite-slope branch removes the field hypotheses by the same patching argument as the slightly regular Theorem 3.1.2.

### Solvable local reduction to Iwahori level

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction` (theorem; unchecked).

At a split coefficient place v, choose a finite solvable local extension L/F_v over which the Weil part of rec(Π_u) is unramified; then the automorphic local base change has Iwahori invariants. If Π satisfies P(m+1), CH Corollary 3.2.2 supplies an S-general family of prime-degree global extensions preserving a testing place and cuspidality, on which the local solvable index drops to m.

Hypotheses: Local GL_n Langlands and its compatibility with cyclic base change; coefficient place split in K; finite solvable index as defined in CH p. 10.

Construction or proof:

1. Kill the finite inertial Weil image over a local solvable extension.
2. Peel the first prime-degree extension from the solvable tower.
3. Globalize that local step by Lemma 3.2.1 while avoiding the finite cuspidality obstructions.

Acceptance: m=0 means the original local representation has Iwahori invariants. A general n-dimensional representation is not assumed to be unramified before the local extension.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Property P(m) and Corollary 3.2.2, p. 10. The local index drops strictly and the resulting family is S-general.

### Induction removing the finite-slope hypothesis

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction` (theorem; unchecked).

For a regular CSD cuspidal Π, induction on its local solvable index P(m) constructs a continuous semisimple good-place attached representation at every coefficient prime. The base m=0 is finite-slope Iwahori existence, after field hypotheses are removed. The successor step constructs representations after each prime-degree extension lowering m and patches them effectively. No finite-slope hypothesis remains on the original Π.

Hypotheses: Arbitrary coefficient prime; the prime-degree local-global extension family and effective patching.

Construction or proof:

1. Apply the field-removal step in the base case.
2. Use Corollary 3.2.2 to lower m over an S-general family.
3. Check overlaps from good polynomials and descend by effective patching.

Acceptance: The argument terminates because m decreases by one. The original target need not itself be a finite-slope point.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction`, `AutomorphicGaloisRepresentationsPartII:AG2.3/removal-of-geometric-field-hypotheses`, `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proof of Theorem 3.2.3, pp. 11–12. This induction removes the residual Iwahori/finite-slope construction hypothesis.

### The polarization sign of the constructed system

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/automorphic-polarization-and-sign` (theorem; unchecked).

For the constructed regular algebraic polarized cuspidal pair (π,χ), r^c≅r∨⊗ε_ℓ^{1−n}r(χ)|_{G_F}. After the AG2.0/E2 parity normalization every conjugate-self-dual irreducible factor has Bellaïche–Chenevier sign +1, and the representation admits the G7 polarized-extension structure with totally odd multiplier µ=ε_ℓ^{1−n}r(χ). The good-place dual identity alone supplies the self-duality isomorphism; the sign theorem is the independent input needed for the prescribed symmetric polarization.

Hypotheses: The normalized polarized pair and algebraic twisting character; characteristic-zero semisimple r; irreducible factors fixed by the dual-conjugation operation as in BC Theorem 1.2.

Construction or proof:

1. Apply good-place attachment operations and uniqueness to identify the dual-conjugate representation.
2. Apply the automorphic sign theorem to its polarized irreducible factors, using the geometric case, specialization and solvable descent.
3. Assemble orthogonal sums of the sign +1 self-dual irreducible factors and hyperbolic pairings on pairs exchanged by dual-conjugation; use the arithmetic G7 extension equivalence and evaluate the multiplier at complex conjugation with the AG2.0/E2 correction.

Acceptance: A self-duality isomorphism without the sign theorem does not establish total oddness.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`, `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`, `ArithmeticGaloisRepresentations:G7/polarized-representation`, `ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant`, `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`, `ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations`.

Sources:

- [Joël Bellaïche and Gaëtan Chenevier, The sign of Galois representations attached to automorphic forms for unitary groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf), §1.3, Theorem 1.2 and Corollary 1.3, p. 1339 (PDF p. 4). The automorphic theorem gives sign +1 for the specified irreducible factors.

### A common finite field of realization in the polarized range

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization` (theorem; unchecked).

For the CH polarized π, there is a number field E(π) containing its trace field such that every coefficient-prime representation has a model over E(π)_λ. Obtain two auxiliary good Frobenius polynomials with n distinct roots and distinct residue characteristics, adjoin their roots to the trace field, and use R01.5 rational-eigenvalue descent at a place away from each coefficient prime. This is a field of realization, not an assertion that the minimal trace field itself is sufficient.

Hypotheses: CH regular de Rham/Hodge–Tate input used by the Serre Zariski-closure argument; uniform good polynomials and their number field; two auxiliary residue characteristics.

Construction or proof:

1. Use the labelled regular Hodge–Tate weights to find a regular-semisimple element in the algebraic monodromy group.
2. Use openness and Frobenius density to choose two good distinct-root places.
3. Adjoin the roots and apply the exact generic rational-eigenvalue descent theorem.

Acceptance: Two residue characteristics ensure at least one usable auxiliary place for every coefficient prime. A trace field need not be a realization field because of Schur index.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`, `ArithmeticGaloisRepresentations:R01.5/rational-eigenvalue-descent`, `PadicHodgeTheory:R06.2`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5 and proof, p. 12. The explicit auxiliary-prime/root construction supplies a common number field.

## AG2.4. Nonselfdual systems by rigid cohomology and approximation

This branch uses the quasi-split HLTT unitary group G_n and its ordinary mixed Shimura/Kuga boundary geometry. A fixed toroidal datum and the source transition colimit are used. HLTT explicitly does not prove intrinsic independence of the compactification pair; that stronger target is retained as a gap.

Boundary support is modeled by the dagger de Rham complex with the boundary ideal, rather than cohomology of the open stratum alone. Grosse-Klönne's partially proper tube comparison and HLTT Lemma 6.8 must be functorial for Frobenius and the specified Hecke pull-push maps. The finite-slope cusp spaces use actual L4 summands. HLTT Lemma 6.12 embeds their dagger sections into ordinary formal sections. Hasse congruences then provide high-weight global classical witnesses. These are separate steps with separate bundle and analytic contracts. Proposition 6.15 includes the coefficient trace factor p^{mn[F:ℚ]}; Corollary 6.17 consequently shifts the slope bound from a to a+mn[F:ℚ].

Powers of the Hasse invariant give congruences modulo every p^M. The proof must produce uniform integral Hecke witnesses, not merely pointwise equality of eigenvalues. The source yields a quotient comparison, while the current generic witness node is phrased as an injection; the requested bridge is an explicit gap. A single finite ramification set and continuity survive the limit.

The 2n representation contains π and its conjugate dual with a varying character. The log/boundary and Levi filtrations identify this parameter before the generic varying-twist separation extracts the rank-n constituent. Factor separation is supplied independently of TC.2; global existence is not an input to its own construction.

Coverage: **planned**. Every stage target is an own declaration, an exact imported contract or an explicitly identified ownership/source gap; planned does not mean closed or implemented.

Requirements for closure:

- Close exact ordinary boundary/bundle/rigid functoriality/weight contracts; reconcile Hasse quotient descent with the IHG.4 witness injection API and denominators; supply generic factor separation independent of TC.2. Intrinsic compactification independence remains unproved in HLTT and is not asserted by this plan.

Atlas planets: HLTT Galois representations; Ordinary unitary boundary geometry; Boundary-support cohomology; Hasse weight congruences; Boundary weight-zero comparison; Boundary Levi realization.

### HLTT existence over arbitrary CM and totally real fields

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems` (theorem; unchecked).

For E totally real or CM and π regular algebraic cuspidal on GL_n(A_E), every prime p and coefficient isomorphism ι yield a continuous semisimple rank-n r attached at good places. HLTT Theorem 7.13 constructs it first for F=F₀F⁺ with p split in F₀ and the stated source good primes; Corollary 7.14 removes the auxiliary field restrictions by effective patching and proves unramifiedness and the normalized polynomial at all v|q≠p for rational q where π is unramified above q. No polarization is required; the theorem here asserts neither de Rham admissibility at p nor full monodromy at ramified primes.

Hypotheses: Regular algebraic cuspidal; geometric Artin and the common integral polynomial convention; n=1 supplied by the algebraic-character construction.

Construction or proof:

1. Apply factor separation on the auxiliary imaginary-quadratic compositum.
2. Vary linearly disjoint auxiliary CM fields, preserving cuspidality and splitting testing places.
3. Use effective continuous patching, overlap recognition and good polynomials to descend to E.

Acceptance: All coefficient primes occur. A nonselfdual regular algebraic cuspidal π is included. Good-place equality is not promoted to ramified monodromy equality.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization`, `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`, `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`, `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Theorem 7.13 and Corollary 7.14, pp. 227–228. The final auxiliary-field descent supplies the nonselfdual rank-n representation.

### HLTT ordinary boundary geometry

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance` (construction; unchecked).

Fix F=F₀F⁺ with F₀ imaginary quadratic and p split in F₀. For the quasi-split similitude G_n on F^{2n} of signature (n,n), choose HLTT ordinary levels U^p(N₁,N₂), smooth toroidal cone data Σ and the Kuga family A^(m). The minimal compactification carries canonical and subcanonical E_ρ, the ordinary locus and its Hasse section; the ordinary toroidal Kuga model has SNC boundary ∂. Its formal ordinary tube has the dagger structure used in §6.2. Keep the right G_n action, the left GL_m(F) action and their source commutation conventions.

Hypotheses: The exact integral ordinary/mixed models and toroidal charts of HLTT §§3–5; neat levels and admissible smooth cones; m≥0.

Uses:

- `HLTT Lemma 6.1`: The ordinary Hasse section and ample minimal line bundle give the weight congruence.
- `HLTT §§6.4–6.5`: The SNC boundary and Levi charts produce the GL_n input.

Planning API:

- `HLTTModel.genericFibre` (compatibility): Minimal/toroidal/Kuga models identify the stipulated generic fibres and levels.
- `HLTTModel.ordinaryDagger` (constructor): The ordinary formal tube defines the smooth dagger pair with SNC boundary.
- `HLTTModel.subcanonical` (characterisation): E_ρ^sub is the boundary-vanishing extension used for cuspidal sections.
- `HLTTModel.refinement` (functoriality): Admissible cone refinements and level changes give the maps used in the cohomology colimit.

Discriminating tests:

- `HLTTModel.zeroKuga` (degenerate): m=0 has dimension [F⁺:Q]n².
- `HLTTModel.oneKuga` (computation): n=1,m=1 has dimension 3[F⁺:Q].
- `HLTTModel.boundaryIdeal` (non-example): Canonical sections without the boundary ideal include noncuspidal classes and cannot replace the subcanonical module.

Construction or proof:

1. Specialize the PEL and mixed Kuga suppliers to G_n and the ordinary levels.
2. Import minimal/toroidal compactifications and E_ρ extensions with the common generic fibre.
3. Use F1 to form the ordinary dagger tube and its SNC boundary.

Acceptance: The base dimension is [F⁺:Q]n² and the Kuga dimension is [F⁺:Q]n(n+2m). These are the quasi-split boundary models, not the compact Shin signature. The source left GL_m and right mixed-group actions must not be asserted to commute without its convention.

Direct prerequisites: `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum`, `PELModuli:M4`, `ShimuraCompactifications:C3`, `ShimuraCompactifications:C5`, `AutomorphicBundles:B3`, `AdicSpacesPartII:F1/dagger-snc-divisor`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §§3–5 and Appendix A.1, pp. 229–234. The ordinary mixed model, boundary charts and group actions are the actual geometric input. In Appendix A.1 the Std factor is the lower-right invertible block of the Levi matrix, correcting the zero lower-left-block description recorded as AG2.0/E8.

### Dagger cohomology with boundary support

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology` (construction; unchecked).

For each fixed ordinary toroidal Kuga pair (A_Σ^†,∂), define H^i_{c−∂}(A_Σ^ord)=H^i(A_Σ^†,I_∂Ω^•(log∂)), then form the HLTT colimit over levels and admissible Σ with its transition maps. The complex restricts to the ordinary de Rham complex away from ∂. This definition is relative to the selected compactification; no intrinsic compactification-independent identification is asserted.

Hypotheses: Smooth dagger SNC pair from the exact HLTT model and compatible level/refinement morphisms.

Uses:

- `HLTT Lemmas 6.20–6.21`: The same hypercohomology has cusp-form and boundary-stratum spectral sequences.
- `HLTT Corollary 6.25`: Its weight-zero part contains the Levi cohomology.

Planning API:

- `BoundaryCohomology.complex` (characterisation): Its complex is I_∂Ω^•(log∂), with the de Rham differential.
- `BoundaryCohomology.emptyBoundary` (compatibility): If ∂ is empty the complex is Ω^•.
- `BoundaryCohomology.transition` (functoriality): Level/refinement morphisms induce compatible maps used by the directed colimit.
- `BoundaryCohomology.groupAction` (functoriality): The source ordinary adelic group acts through these transition correspondences.

Discriminating tests:

- `BoundaryCohomology.localIdeal` (computation): For ∂=(t=0), the degree-zero term is tO^†, not O^†.
- `BoundaryCohomology.empty` (degenerate): With ∂=∅ recover ordinary dagger de Rham cohomology.
- `BoundaryCohomology.support` (non-example): Dropping I_∂ gives logarithmic cohomology with different boundary classes.

Construction or proof:

1. Import the F1 compact-support logarithmic complex.
2. Form hypercohomology and the level/cone transition maps.
3. Use the source colimit to define the tower module.

Acceptance: The boundary ideal is retained. Changing Σ produces a specified map, not a declared canonical equality.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`, `AdicSpacesPartII:F1/compact-support-log-complex`, `AdicSpacesPartII:F1/log-de-rham-complex`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §6.5 definition and Lemma 6.19, pp. 218–219. The definition uses the selected boundary pair and its tower invariants.

### Functorial comparison of HLTT tubes with rigid cohomology

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison` (theorem; unchecked).

For smooth quasi-projective Y/O_K in HLTT Lemma 6.8, H^i_rig(Y_s/K)≅H^i(Y^†,Ω^•). The isomorphism is functorial under the actual morphisms of smooth models used for boundary strata, Hecke maps and Frobenius lifts. In particular the ordinary lift ς_p corresponds to rigid Frobenius because its special-fibre map is Frobenius.

Hypotheses: The proper formal embeddings and strict-neighborhood choices in GK Theorem 5.1 and HLTT Lemma 6.8; this is not an arbitrary rigid-space comparison.

Construction or proof:

1. Apply GK Theorem 5.1 to a projective closure.
2. For a morphism choose compatible closures in a product and compatible affine covers.
3. Compare the Čech/strict-neighborhood maps as in HLTT’s added functoriality argument; identify Frobenius on the special fibre.

Acceptance: The word canonical alone does not establish the required functorial diagram.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`, `AdicSpacesPartII:F1/log-de-rham-complex`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemma 6.8 and bracketed functoriality proof, pp. 201–202. The source supplies the missing functorial comparison needed for Frobenius.
- [Elmar Grosse-Klönne, Rigid analytic spaces with overconvergent structure](https://arxiv.org/pdf/1408.3329), Theorem 5.1 and proof, §5. The proper formal embedding comparison is the generic supplier theorem.

### HLTT Frobenius and trace normalization

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization` (lemma; unchecked).

On H^i_{c−∂}(A_Σ^ord), the pullback ς_p and trace trF commute with the ordinary adelic action and satisfy trF∘ς_p=p^{n(n+2m)[F⁺:Q]} id. On the ordinary minimal cusp-section module the normalized trace is the source controlling operator, with the explicit coefficient factor p^{mn[F:Q]} of Proposition 6.15: on a graded E_ρ term the Kuga trace is p^{mn[F:Q]} times the cusp-section trace. Thus section slope bound a gives Kuga slope bound a+mn[F:Q] in Corollary 6.17; conversely Kuga bound a corresponds to section bound a−mn[F:Q]. This distinguishes geometric Frobenius pullback from its finite-étale trace.

Hypotheses: HLTT ordinary Frobenius quotient, dagger finite-étale trace and its boundary extension; characteristic zero coefficients.

Construction or proof:

1. Use trace∘pullback=degree on the ordinary finite-étale map.
2. Compute its degree from the ordinary Kuga dimension.
3. Extend through the boundary log complex and compare the coefficient trace filtration.

Acceptance: At m=0 the exponent is n²[F⁺:Q]. trF is not identified with ς_p. For n=m=1 and [F:Q]=2, section slope 3 corresponds to Kuga slope 5, and Kuga bound 5 corresponds to section bound 3; reversing this shift is incorrect.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison`, `AdicSpacesPartII:F1/dagger-finite-etale-trace`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 6.15 and Corollary 6.17; §6.5 before Lemma 6.19, pp. 215–218. The coefficient filtration and the Kuga degree fix the slope operator normalization.

### Finite slope cusp sections on the ordinary tube

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces` (theorem; unchecked).

For each algebraic ρ and slope bound a, H⁰(X^ord,min,†,E_ρ^sub)_{≤a} is an admissible ordinary adelic module; at each fixed small level it is finite-dimensional. The completely continuous normalized trF acts on Banach strict neighborhoods and the finite-slope summand is unchanged upon shrinking through the source compatible neighborhoods. Its tower embeds in the ordinary formal-section space H⁰(X^ord,min,E_ρ^ord,sub)⊗Q_p.

Hypotheses: HLTT Lemmas 6.6 and 6.10–6.12, compact restriction maps and exact linked neighborhood data; the slope is measured for the normalized source trace.

Construction or proof:

1. Construct the Banach neighborhood modules with compact restrictions.
2. Use the generic L4 coprime-factor Fredholm decomposition and compatibility under the primitive links.
3. Pass to the ordinary dagger union and finite-level invariants.

Acceptance: The finite-slope invariance is for strict neighborhoods of the same datum, not intrinsic independence of the toroidal boundary pair.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `PadicFamilies:L2a/linked-banach-families`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemmas 6.10–6.12 and Corollary 6.13, pp. 209–215. The finite-slope admissibility input applies to the ordinary cusp-section tower.

### Hasse weight-changing congruences

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence` (theorem; unchecked).

For M≥1 and any lower bound r, multiplication/division by the lifted Hasse section gives the Hecke-equivariant surjection ⊕_{j≥r} H⁰(X^min,E_ρ^sub⊗ω^{j(p−1)p^{M−1}})→H⁰(X^ord,min,E_ρ^sub⊗Z/p^M), f↦f/Hasse_M^j. Consequently a finite collection of ordinary sections modulo p^M admits lifts in finitely many sufficiently high classical weights; one common weight bound and modulus controls that finite collection.

Hypotheses: Integral E_ρ lattice and HLTT ordinary minimal model; ample ω and the lifted Hasse section; all relevant level/action normalizations.

Construction or proof:

1. Use ampleness and Serre vanishing after a common twist.
2. Localize along Hasse to recover ordinary sections and reduce modulo p^M.
3. Lift a finite generating set using finitely many j; retain the Hecke equivariant surjection, rather than just separate pointwise congruences.

Acceptance: The shift is (p−1)p^{M−1}. M grows arbitrarily; a single mod-p lift does not suffice.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`, `AutomorphicBundles:B3`, `ShimuraCompactifications:C5`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemma 6.1 and proof, pp. 192–195. The actual source surjection provides the integral weight-changing congruence.

### Galois type of sufficiently high classical cusp forms

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/classical-cusp-galois-type` (theorem; unchecked).

For a fixed algebraic ρ, sufficiently large determinant twists satisfying −2n≥(b_{τ,1}−t)+(b_{τc,1}−t) put the classical cuspidal G_n eigensystems in the discrete cohomological range of HLTT Lemma 6.2. Through constituent existence in AG2.3 and the discrete assembly they have continuous semisimple rank-2n representations with the normalized good polynomials and one fixed tame ramification set determined by the fixed level and p.

Hypotheses: The high-weight inequality and fixed level; all discrete constituent algebraic twists are retained; no torsion Hecke existence is an input.

Construction or proof:

1. Use the infinity-type inequality of Lemma 6.2.
2. Apply discrete transfer, construct each cuspidal constituent through arbitrary regular existence, then assemble.
3. Use local fixed-level bounds to choose the common tame set.

Acceptance: The G_n representation may be discrete and noncuspidal after transfer to GL_{2n}.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence`, `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemma 6.2 and Corollaries 6.3–6.4, pp. 195–197. The high classical weights have Galois type before ordinary interpolation.

### Uniform integral Hecke congruence witnesses

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses` (theorem; unchecked).

For each finite ordinary Hecke module W and each p-adic modulus, the Hasse surjection and sufficiently high classical Galois-type modules give a single finite classical comparison controlling all good Hecke operators on W modulo that modulus. Choose a common finite ramification set, coefficient ring and compatible refinements of these comparison data as the modulus grows. The resulting quotient determinant/trace data obey the IHG.4 uniform-congruence contract; at primes dividing (2n)! use a stronger modulus before converting trace pseudocharacters to determinants in characteristic zero.

Hypotheses: Integral finite Hecke image of W, finite classical comparison module and quotient descent for the continuous determinant identities; denominator control is explicit.

Construction or proof:

1. Lift finite generators of W by the Hasse surjection at a common sufficiently large weight.
2. Use Hecke equivariance to control the whole commuting Hecke image, not one eigencharacter at a time.
3. Descend the classical determinant identities along the resulting Hecke quotient using Frobenius density and fixed ramification; refine witnesses jointly at successive moduli.

Acceptance: The witness is uniform over all good primes for a given modulus. A Zariski-dense classical set without integral lifts does not supply this witness.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence`, `AutomorphicGaloisRepresentationsPartII:AG2.4/classical-cusp-galois-type`, `IntegralHeckeAndGaloisDeterminants:IHG.4/uniform-congruence-witness`, `IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Corollaries 6.3–6.4 and proof of Proposition 6.5, pp. 196–199. The passage from classical forms to the ordinary finite module uses congruences, not density alone.

### The continuous ordinary Hecke determinant limit

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit` (theorem; unchecked).

The compatible fixed-S quotient data for the ordinary finite Hecke modules interpolate to a unique continuous degree-2n determinant, with every good Frobenius polynomial equal to the normalized G_n Hecke polynomial. At each characteristic-zero irreducible ordinary eigensystem covered by Proposition 6.5/Corollary 6.13, specialization reconstructs a continuous semisimple rank-2n Galois representation. Coefficient/level changes transport this determinant; the coefficient limit adds no ramification.

Hypotheses: The uniform congruence witnesses and actual quotient-descent contract, separated complete coefficient topology, compatible level maps and characteristic-zero reconstruction continuity; the source Proposition 6.5 initially concerns an irreducible quotient of an admissible submodule.

Construction or proof:

1. Apply the generic finite-quotient inverse-limit theorem and completed-group-algebra extension.
2. Apply coefficient and level functoriality and fixed-S ramification descent.
3. Specialize to an eigencharacter and reconstruct semisimply; use the admissible finite-slope realization for the applicable subquotients.

Acceptance: A common finite quotient of G is not required across all moduli. Uniform unramifiedness must be proved before using inverse-limit ramification preservation.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`, `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces`, `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.4/completed-group-algebra-extension`, `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-coefficient-change`, `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-level-change`, `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-ramification`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 6.5 and Corollary 6.13, pp. 197–199, 214–215. The source obtains a characteristic-zero rank-2n representation for the applicable ordinary eigenquotient.

### The logarithmic cusp-section spectral sequence

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence` (theorem; unchecked).

At each fixed Kuga slope bound b, the logarithmic de Rham cohomology of the ordinary Kuga model with I_∂ has the coefficient filtration and spectral sequence of HLTT Proposition 6.15/Corollary 6.17: the E₁ terms are finite-slope H⁰(X^ord,min,†,E_{ρ_{m,s}^{i,j}}^sub), with section bound b−mn[F:Q]. Equivalently, section bound a gives Kuga bound a+mn[F:Q]. Combining with Lemma 6.20 gives the log de Rham spectral sequence to H^*_{c−∂,≤b}. Hence every irreducible constituent appearing in the abutment has the source rank-2n good-place Galois representation.

Hypotheses: Actual algebraic representations ρ_{m,s}^{i,j}, coefficient trace factor and finite filtrations; the higher coherent cohomology vanishing on the ordinary affine locus.

Construction or proof:

1. Compute the associated graded logarithmic differentials using the mixed Kuga boundary charts.
2. Use the source finite coefficient filtration and vanishing to pass to ordinary sections.
3. Apply finite-slope exactness and the spectral sequence filtration to obtain Corollaries 6.18 and 6.23.

Acceptance: An arbitrary subquotient assertion is justified by the finite spectral-sequence filtration, not merely quoted from Proposition 6.5.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization`, `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces`, `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit`, `AutomorphicBundles:B3`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 6.15, Corollary 6.17 and Corollaries 6.18, 6.23, pp. 215–220. The filtration and spectral sequence connect sections to higher boundary-support cohomology.

### The boundary-stratum and weight-zero spectral sequence

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence` (theorem; unchecked).

For the fixed HLTT ordinary boundary model, E₁^{i,j}=H^i_rig(∂^(j)A_Σ^ord)⇒H^{i+j}_{c−∂}(A_Σ^ord), compatibly with ς_p. The abutment is finite-dimensional at fixed level and is exhausted by finite trF slopes. Its Frobenius eigenvalues have nonnegative Weil weights; for i>0, the weight-zero part of H^{i+1}_{c−∂} is the cohomology H^i of the boundary dual simplicial complex, and for i=0 the source gives a surjection.

Hypotheses: Smooth quasi-projective strata, functorial rigid/dagger comparison, rigid finiteness and the weight lower bound w≥cohomological degree.

Construction or proof:

1. Resolve the boundary-support complex by its intersections.
2. Apply the functorial rigid comparison to each stratum and rigid finiteness.
3. Use trF∘ς_p=p^D to obtain finite slopes, then isolate weight zero from the stratum spectral sequence.

Acceptance: At i=0 claim a surjection only. Frobenius and trace slopes are related by the dimension factor.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization`, `PadicDifferentialEquationsAndRigidCohomology:RD.5`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemmas 6.21 and Corollaries 6.22–6.24, pp. 219–220. The precise degree shift and the i=0 exception identify the boundary weight-zero part.

### The boundary Levi realization

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization` (theorem; unchecked).

For i>0, the induced interior cohomology of the GL_n Levi locally symmetric space in HLTT Corollary 6.25 occurs as a subquotient of W₀H^{i+1}_{c−∂}. A regular algebraic GL_n cuspidal π, after all sufficiently large norm twists N, occurs in this interior-cohomology input by Corollary 1.9. Corollary 6.27 gives an actual rank-2n R(π,N) whose good-place parameter is rec(π_v|det|^{(1−n)/2})⊕rec(π^c_{cv}|det|^{(1−n)/2})^{∨,c}ε_p^{1−2n−2N}.

Hypotheses: n>1; exact Levi arithmetic quotient, coefficient representation ρ and π∞ with the infinitesimal character of ρ∨; N sufficiently large; good source places q≠p split in F₀ or unramified in F with π spherical above q.

Construction or proof:

1. Use the boundary open embedding of the Levi dual-complex piece and the induced cohomology formula.
2. Apply the weight-zero boundary comparison and the rank-2n cohomology constituent theorem.
3. Insert π||det||^N in the interior cohomology and undo ε_p^N to obtain Corollary 6.27.

Acceptance: The second n-dimensional block carries ε_p^{1−2n−2N}. The first block is independent of N.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence`, `AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence`, `AutomorphicFormsOnReductiveGroups:AF.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Corollary 1.9, §1.5, p. 41; Corollaries 6.25–6.27, p. 221. The Levi inclusion and the varying-twist polynomial are the bridge to separation.

### Separating the two HLTT rank-n factors

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization` (theorem; unchecked).

The representations R(π,N) for all sufficiently large N satisfy HLTT Proposition 7.12 with Γ=G_{F,S}, dense good Frobenius set, µ=ε_p^−2 and two n-element root multisets E₁,E₂ independent of N, the constant ε_p^{1−2n} correction absorbed into E₂. Each µ(Frob_v) has infinite order. The generic factor-separation theorem therefore gives continuous semisimple rank-n representations for each multiset. The first is the good-place attached r(π), uniquely determined by Frobenius polynomials.

Hypotheses: One finite S for all N; Γ topological, algebraically closed characteristic-zero coefficient field; all R(π,N) continuous semisimple; infinitely many exponents and infinite-order µ on the determining dense set.

Construction or proof:

1. Verify the fixed root multisets and infinite-order character from Corollary 6.27.
2. Import the generic reductive-closure/central-character separation theorem.
3. Use early attachment uniqueness for the first factor.

Acceptance: One or finitely many twists do not satisfy the theorem. A finite-order separating character is excluded.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `IntegralHeckeAndGaloisDeterminants:IHG.4`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §7 first two paragraphs, Proposition 7.12 and proof of Theorem 7.13, pp. 222–228. The algebraic separation hypotheses are all checked for the automorphic family.

## AG2.5. Good-prime and ramified local–global comparison

All local correspondence comparisons follow the construction of r. Good unramified polynomials, equality of WD semisimplifications, domination of Frobenius-semisimplified WD parameters, and full equality retaining N are four different assertions. Generic WD, monodromy partitions and purity belong to R01.2. Varma's order is isotypic partition dominance, equivalently a family of ranks of all monodromy powers, not just rank N.

The polarized CH local-family bound supplies semisimple local comparison before Caraiani. Caraiani's two-signature compact tensor-square variety has dimension 2n−2 and product semistable charts. Propositions 3.9, 4.6 and 4.10 supply product nearby cycles and total monodromy over a common trait with characteristic-zero coefficients. Corollary 4.29 uses the kernel/image bifiltration of that total monodromy. This filtration and stratum concentration prove tensor-square purity, which detects purity of r. For rank n≥2, Corollary 5.9 gives temperedness; rank one uses the character dictionary. The individual normalized L_n parameter has weight n−1 and its tensor square weight 2n−2, as corrected in source issue AG2.0/E5. Taylor–Yoshida's primitive-string uniqueness is up to WD equivalence, so it gives equality retaining N.

Varma then has the polarized full comparison needed at the classical points of its nonselfdual interpolation. Integral Bernstein trace operators and the bound idempotent transfer every required ramified Weil trace and all exterior-power rank identities through HLTT congruences. Factor extraction and auxiliary-field patching extend the result to every v away from the coefficient prime. Full monodromy equality for arbitrary nonselfdual π is not asserted.

Liu's middle-degree identification stays conditional outside its verified range. The RACSDC paragraph in BCGP25 follows equation (1.8.21), which itself is a GSp₄ equation; that paragraph has no standalone theorem number. The coefficient-prime assertions and strong coefficient-field package have explicit AG2.6 contracts. R19's GL₂ constructions are used only in the final overlap comparison.

Coverage: **planned**. Every stage target is an own declaration, an exact imported contract or an explicitly identified ownership/source gap; planned does not mean closed or implemented.

Requirements for closure:

- Close Bernstein integral-operator/type, generic WD partition/purity and two-chart nearby-cycle requests. The independent review confirms AG2.0/E3; use pure-WD uniqueness and all monodromy powers, never maximal rank alone. Correct Caraiani’s individual-factor weight using AG2.0/E5. Keep Liu Hypothesis 3.2.10 conditional outside its verified range; the dedicated GSp₄ owner supplies that route.

Atlas planets: Varma’s monodromy bound; Caraiani's local–global compatibility; Good-prime characteristic polynomials; Tensor-square Shimura realization; Ramanujan–Petersson for unitary type; Double weight spectral sequence.

### Comparison of the early polynomial with normalized local Langlands

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources` (comparison; unchecked).

For spherical π_v, after ET.6 fixes geometric Artin and the Harris–Taylor normalization, rec(π_v|det|^{(1−n)/2}) is unramified with Frobenius polynomial equal to the AG2.0 integral Hecke polynomial. Shin/Caraiani L_n is this geometric normalization. The square-root Satake extension cancels from the integral coefficients. rec^T is the corresponding arithmetic/rational normalization of the source; geometric-to-arithmetic Frobenius takes the normalized reciprocal polynomial. This is a comparison with the constructed local correspondence, and is not an early prerequisite for raw geometry.

Hypotheses: Use the chosen coefficient embedding and geometric Frobenius on both sides. Import the exact local reciprocity/Satake normalization from ET.6; do not invert roots in just one side.

Construction or proof:

1. Compare ET.6’s unramified local parameter with the normalized Satake character.
2. Apply the IHG.3 factorization and twist formula.
3. Compare the geometric L_n and rec^T source dictionaries, and apply reciprocal conversion for arithmetic Frobenius.

Acceptance: Check the n = 1 case: an algebraic Hecke character and the twist |det|^{(1-n)/2} = 1, so the dictionary must reduce to class field theory in the chosen normalization Check the n = 2 case against the R19 convention (characteristic polynomial X^2 - a_l X + eps(l) l^{k-1} at good arithmetic Frobenius) and record the twist relating the two

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Theorem 7.13 and notation §1, pp. 1–3, 227. The normalized good parameter is the one supplied by local Langlands.
- [Laurent Clozel and Jack A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §1.1 notation, accepted copy p. 3. The rational normalization must be compared with the fixed Artin convention.

### Varma’s semisimplified comparison and monodromy bound

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound` (theorem; unchecked).

For E totally real or CM and regular algebraic cuspidal π on GL_n(A_E), the constructed r_{p,ι}(π) satisfies WD(r|_{G_{E_v}})^ss≅ι^−1rec(π_v|det|^{(1−n)/2})^ss for every v∤p, and WD(r|_{G_{E_v}})^{F-ss}≺ι^−1rec(π_v|det|^{(1−n)/2}). Extract the local bound from the varying-twist 2n family and then remove the split-place and auxiliary-CM restrictions by the source extension/descent argument. The comparison retains no asserted equality of monodromy for arbitrary nonselfdual π.

Hypotheses: Regular algebraic cuspidal; every v∤p; the source parameter convention and the full isotypic dominance relation.

Construction or proof:

1. Establish the split-place local Weil traces and nilpotent bound in the 2n ordinary family.
2. Choose a sufficiently large twist avoiding the finitely many isotypic collisions; extract the rank-n first factor and its local bound as in §10.
3. Use the auxiliary CM extensions of §11 and effective patching to recover all v∤p.

Acceptance: A Steinberg target permits a smaller Galois monodromy under the bound; strictness is not asserted to occur in any actual automorphic example. Semisimplification equality does not remove N from the meaning of the separate F-ss bound.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization`, `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`, `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`.

Sources:

- [Ila Varma, Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), Theorem (1), p. 2; Proposition 8.1 and proof, pp. 18–19; Proposition 9.1 and proof, pp. 20–26; Theorem 10.2 and Corollary 10.3, §10, pp. 26–27. The completed route gives the semisimple local comparison and the monodromy bound at all away places.

### Caraiani’s full away-prime compatibility

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness` (theorem; unchecked).

For CM L and regular algebraic CSD cuspidal π on GL_n(A_L), every prime ℓ and every v∤ℓ satisfy WD(r_{ℓ,ι}(π)|_{G_{L_v}})^{F-ss}≅ι^−1rec(π_v|det|^{(1−n)/2}) including N. Choose the source solvable extensions and two-signature tensor-square instance, prove its monodromy purity, descend purity to the rank-n representation, and combine with the semisimple local comparison and temperedness. This is full WD compatibility under the polarized source hypotheses, not a conclusion for arbitrary nonselfdual HLTT systems or for v|ℓ.

Hypotheses: Regular algebraic CSD cuspidal; v∤ℓ; source geometric normalization and coefficient embedding.

Construction or proof:

1. Choose the source auxiliary extensions and compare the tensor-square geometric constituent.
2. Use the double weight sequence, tensor-square detection and finite-extension invariance to establish Galois WD purity.
3. Use tempered automorphic purity and equality of semisimple Weil parts, then pure-extension uniqueness up to equivalence.

Acceptance: The isomorphism preserves N, not only Frobenius eigenvalues. The companion coefficient-prime log-crystalline theorem belongs to AG2.6.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence`, `AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`.

Sources:

- [Ana Caraiani, Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Theorem 7.4 and proof, pp. 83–85. The tensor-square geometric route proves the full away-prime result.

### Unramifiedness and the good-prime polynomial

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial` (theorem; unchecked).

For each constructed polarized or nonselfdual rank-n r, outside its specified finite excluded set and v∤ℓ, r is unramified and det(X−r(Frob_v^geom))=ι^−1P_v(π_v;X). HLTT Corollary 7.14 proves this for v|q≠ℓ where π is unramified at every place above q, including field-ramified q after auxiliary descent. The polarized branch has the source’s unramified local-global comparison. The result includes every coefficient prime, while excluding the places above that prime.

Hypotheses: The relevant existence theorem and its actual common ramification set; π cuspidal regular algebraic, polarized only in the corresponding branch.

Construction or proof:

1. Use the good-place existence output and normalized local unramified parameter.
2. For the final HLTT good rational primes use the patching proof of Corollary 7.14, beyond the auxiliary Theorem 7.13.
3. Identify Frobenius polynomials in the early integral normalization.

Acceptance: An unramified π at one place above q does not satisfy HLTT’s stated all-places-above-q hypothesis. At v|ℓ this node gives no crystalline claim.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`, `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`.

Sources:

- [Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Corollary 7.14, p. 228. The final good-place unramifiedness is stronger than the auxiliary-field good set.

### The monodromy dominance interface

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface` (comparison; unchecked).

Import WD, Frobenius semisimplification, WD semisimplification and monodromy filtration from R01.2. For equal semisimple Weil representations, Varma’s ≺ compares decreasing Sp-block partitions separately in each irreducible Weil unramified-twist class: every initial sum on the first side is ≤ the second. The inertial relation ≺_I compares the corresponding N-block partitions in every irreducible inertia isotype. Lemma 9.2 identifies them when the semisimple Weil parts agree. Equivalently all ranks of positive powers of each isotypic N on the first side are ≤ the second; one rank is insufficient.

Hypotheses: Characteristic zero; finite inertial Weil image; same semisimple Weil part when identifying the two orders.

Construction or proof:

1. Import the indecomposable Sp classification and nilpotent partition order from R01.2.
2. Apply Varma Lemma 9.2’s repetition factor dim(s)/dim(θ) to compare the Weil and inertia partitions.

Acceptance: For partitions (1,1)≺(2), N=0 is below nonzero rank-one N. Partitions (3,3) and (4,2) have equal rank N but different higher-power ranks.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `ArithmeticGaloisRepresentations:R01.2/monodromy-filtration`, `ArithmeticGaloisRepresentations:R01.2`.

Sources:

- [Ila Varma, Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), §9, Definitions 1–2 and Lemma 9.2, pp. 20–21. The actual orders retain the isotypic partitions and all initial sums.

### Integral Bernstein operators on the ordinary family

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators` (theorem; unchecked).

At the unitary split places v∤p, the Bernstein centres of the finitely many components permitted by the fixed local level supply operators whose value at a classical or ordinary cusp eigensystem Π is tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ), for every σ∈W_{F_v}. After the source common denominator d(z), these operators preserve the integral cusp-section lattices used in the Hasse congruences. The bound idempotent e_{Π,B} selects points whose local parameter is dominated by that of the target Π.

Hypotheses: Finite union of actual Bernstein components at the split local G_n factor; fixed level; source integral denominator and idempotent.

Construction or proof:

1. Import the local Bernstein trace functions and parameter-type idempotent from SR/ET.
2. Map them to the Hecke action on each weight and prove the common denominator preserves the lattice.
3. Retain the same operator as the weight and modulus vary.

Acceptance: Split places are the starting local argument, not the final range of the theorem. Ignoring the denominator invalidates integral congruence transfer.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Sources:

- [Ila Varma, Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), §7.2, integral Bernstein operators, pp. 16–17; §9.1, e_{Π,B}, pp. 24–25. The centre operators and their integral action are the additional local interpolation data.

### Local Weil traces through the HLTT congruences

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-local-trace-congruence` (theorem; unchecked).

Include the denominator-corrected Bernstein operators in the uniform classical-to-ordinary Hecke congruences. The resulting continuous degree-2n pseudocharacter has T(σ_v)=tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ_v) at every split v∤p and every Weil element σ_v. Semisimple reconstruction therefore identifies the entire semisimple local Weil representation, not just its good unramified Frobenius polynomial.

Hypotheses: The integral operators, arbitrary-modulus congruences, common ramification set and characteristic-zero pseudocharacter continuity.

Construction or proof:

1. Use the known classical polarized local comparison at the sufficiently high classical weights.
2. Transfer the integral local operator eigenvalues through the uniform congruences.
3. Pass to the continuous pseudocharacter and use semisimple local recognition.

Acceptance: Unramified Frobenius values alone do not identify ramified inertia.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`, `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`, `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`.

Sources:

- [Ila Varma, Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), Proposition 8.1 and proof, pp. 18–20. Every required local Weil trace is included in the interpolation.

### Monodromy bounds through exterior trace identities

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound` (theorem; unchecked).

For the interpolated 2n representation at a split place, WD(r(Π)_v)^{F-ss}≺rec(BC(Π)_v|det|^{(1−2n)/2}). The source detects inertial nilpotent type by all exterior-power vanishing identities for powers of b_{η,ζ}=g_η−ζa_η, and transfers the associated pseudocharacter functions B_{η,ζ}^{k,j} across the integral bound idempotent. This proves rank inequalities for every monodromy power in every inertia isotype, then Lemma 9.2 gives the Weil order.

Hypotheses: Semisimple global representation; nondegenerate trace pairing on its semisimple image algebra; all η, p-power ζ, j,k>0 of Varma Lemma 9.7; the target Bernstein idempotent.

Construction or proof:

1. Use Lemma 9.7 to characterize the inertia order by exterior-power annihilation and traces against all global τ.
2. Use the integral idempotent and Lemma 9.8 to impose those identities in the classical Hecke quotient.
3. Transfer the identities by arbitrary-modulus congruences and conclude using the equal semisimple Weil parts.

Acceptance: A single rank inequality does not determine the partition order. The output is a bound, not equality of N.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-local-trace-congruence`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`.

Sources:

- [Ila Varma, Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), Lemma 9.7, Lemma 9.8 and proof of Proposition 9.1, pp. 24–26. The exterior trace identities establish the full inertial monodromy bound.

### The tensor-square geometric instance

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance` (construction; unchecked).

For the source auxiliary CM extensions F/F′/L and π with local Iwahori invariants, choose the compact unitary datum with signatures (1,n−1) at two distinguished real places and (0,n) at the others. Its dimension is 2n−2. The selected cohomological automorphic packet and corrected coefficient projector realize the tensor square of the already constructed rank-n representation, with the scalar character and multiplicity corrections of Caraiani §7. The integral model is locally étale over a product of two semistable charts at the chosen split prime.

Hypotheses: The solvable extensions and two split distinguished p-adic places of the proof of Theorem 7.4; cuspidality preserved, relevant local components Iwahori fixed and exact source coefficient twists.

Uses:

- `Caraiani Corollary 7.3`: The product-chart spectral sequence proves purity of the geometric constituent.
- `Caraiani Theorem 7.4`: Tensor-square purity is transferred to the rank-n representation.

Planning API:

- `TensorSquareInstance.signature` (characterisation): Exactly two nondefinite signatures give dimension 2n−2.
- `TensorSquareInstance.charts` (projection): The local model is étale over the product of the two specified semistable charts.
- `TensorSquareInstance.constituent` (compatibility): After the source scalar/multiplicity correction the selected middle cohomology realizes r(π)⊗r(π).
- `TensorSquareInstance.actions` (functoriality): This identification preserves Hecke and Weil actions with N acting as N⊗1+1⊗N.

Discriminating tests:

- `TensorSquareInstance.rankTwo` (computation): n=2 gives a two-dimensional Shimura variety and a rank-four tensor-square constituent.
- `TensorSquareInstance.dimension` (non-example): The single-signature Shin variety cannot replace the dimension-2n−2 model.
- `TensorSquareInstance.monodromy` (compatibility): For nonzero tensor factors V₁,V₂ with N₁=0 and N₂≠0, total monodromy is 1⊗N₂≠0. For the tensor square with N=0, total monodromy is zero.

Construction or proof:

1. Choose the source solvable extensions making the local parameter Iwahori and p split at the two selected places.
2. Specialize PEL geometry to the two-signature datum and import its product charts.
3. Use stable transfer and the packet cohomology calculation to identify the corrected tensor-square constituent.

Acceptance: The dimension is 2n−2 rather than n−1. The model is a product of semistable charts, not declared semistable as a single chart.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`, `PELModuli:M4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `LefschetzPencilsAndVanishingCycles:LPV.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

Sources:

- [Ana Caraiani, Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), §7 setup and proof of Theorem 7.4, pp. 80–85. The actual two-signature geometry realizes the tensor-square constituent.

### Nearby cycles of the two-chart instance

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy` (comparison; unchecked).

Import the product nearby-cycle comparison of Caraiani Proposition 3.9 and Proposition 4.10, with the single-chart filtration of Proposition 4.6 from LPV.6. On the tensor-square instance RΨ of the product is the derived tensor product of the two factors, and N=N₁⊗1+1⊗N₂. The kernel and image filtrations of the total monodromy operator N yield Corollary 4.29’s double-filtered stratum spectral sequence, compatible with the corrected projector, Hecke and Weil actions.

Hypotheses: The actual étale-local product of semistable charts, all shifts and Tate twists, and coefficient projector equivariance. Characteristic-zero ℓ-adic coefficients Λ=Q_ℓ or Q̄_ℓ for the product argument of §4.2; the two charts are semistable over the same trait.

Construction or proof:

1. Apply the generic product-chart comparison locally and glue equivariantly.
2. Track each monodromy operator and the two filtrations; apply the ξ projector.

Acceptance: Neither ordinary smooth nearby cycles nor a one-chart weight sequence supplies this comparison.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`, `LefschetzPencilsAndVanishingCycles:LPV.6`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`.

Sources:

- [Ana Caraiani, Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Proposition 3.9 (p. 24), Proposition 4.6 (p. 29), Proposition 4.10 (p. 33) and Corollary 4.29 (p. 51). The generic product nearby-cycle result supplies the needed N and double filtration.

### Cohomology of the two-chart strata

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration` (theorem; unchecked).

For the source Π^{1,S}-isotypic part, the stratum Y_{S,T} of the two-chart integral model has coefficient cohomology zero outside j=2n−|S|−|T|, as in Caraiani Proposition 5.10. Its surviving graded pieces have the explicit Igusa/Mantovan trace calculation of Proposition 5.8. These are characteristic-zero automorphic stratum calculations under the source §5 datum; torsion concentration is not used.

Hypotheses: The exact two-signature datum, selected packet, local Iwahori levels and source ST/END transfer hypotheses.

Construction or proof:

1. Express stratum traces using the product Newton/Igusa correspondence.
2. Apply the source stabilized characteristic-zero calculation and weight separation.
3. Identify the single allowed degree with the stratum dimension.

Acceptance: The allowed degree changes with both |S| and |T|.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`, `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`, `IgusaVarietiesAndTorsionConcentration:IG.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.

Sources:

- [Ana Caraiani, Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Propositions 5.8 and 5.10, pp. 64–65. The stratum concentration is the actual input used for degeneration in §7.

### Temperedness of regular unitary-type cuspidal forms

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness` (theorem; unchecked).

Every regular algebraic conjugate-self-dual cuspidal π on GL_n over CM L has tempered local components at all finite places. With every coefficient conjugate accounted for, the normalized local parameter is pure of weight n−1 in geometric normalization. This is the automorphic purity input to the monodromy comparison; arbitrary nonselfdual π is outside this theorem.

Hypotheses: Regular algebraic CSD cuspidal, source solvable-base-change descent and all coefficient embeddings. Corollary 5.9 is stated for n≥2. For n=1 the assertion follows separately from the conjugate-self-dual algebraic Hecke-character dictionary and class field theory.

Construction or proof:

1. Use Caraiani Proposition 5.8’s local trace calculation to prove Corollary 5.9.
2. Remove the local auxiliary hypotheses by the source base-change arguments.
3. Apply TY Lemma 1.4(3) with the correct norm normalization and all conjugates.

Acceptance: A norm twist shifts the weight and preserves essential temperedness only with its specified central normalization. The factor has weight n−1, and its tensor square has weight 2n−2; AG2.0/E5 records the doubled-factor-weight misprint in the proof of Theorem 7.4.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`, `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

Sources:

- [Ana Caraiani, Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Corollary 5.9, pp. 64–65, and Theorem 1.2, p. 2. The automorphic local parameter is pure because the local components are tempered.

### Purity from the double weight spectral sequence

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence` (theorem; unchecked).

Caraiani Proposition 7.2 supplies the double-filtered nearby-cycle spectral sequence for the Π^{1,S} part of the corrected Kuga tower, with N taking Gr_l Gr_k to Gr_{l+1} Gr_{k−1}. Its secondary stratum sequence has |S|=j+s, |T|=j+k+l−s+1 and coefficient degree m−2j−k−l+1 with twist −j−k+1. Stratum concentration forces m=2n−2, gives the source degeneration, and proves WD of the selected H^{2n−2} is pure of weight m_ξ−2t_ξ+2n−2.

Hypotheses: Exact stratum purity and the two-chart nearby-cycle comparison, equivariant projector and coefficient twists; no unproved general weight-monodromy conjecture is assumed.

Construction or proof:

1. Apply the two filtrations and the geometric projector to the nearby-cycle complexes.
2. Insert the stratum degree formula, forcing m=2n−2 in each nonzero term.
3. Use the graded weight w+k−l−1 and N maps, reindexed by r=k−l−1, to identify the monodromy filtration centered at zero and Corollary 7.3 purity.

Acceptance: The two filtration indices and the Tate twist −j−k+1 are retained. E₁ degeneration alone without the N identification does not establish purity. To use R01.2’s monodromy filtration centered at zero, reindex the source kernel/image piece Gr_l Gr_k by r=k−l−1. Its weight is w+r with w=m_ξ−2t_ξ+2n−2; when N=0 the sole monodromy grade is r=0.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`, `DeligneWeightsAndPurity:DWP.8`, `ArithmeticGaloisRepresentations:R01.2/monodromy-filtration`.

Sources:

- [Ana Caraiani, Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Proposition 7.2 and Corollary 7.3, pp. 82–84. The exact double spectral sequence establishes the geometric monodromy purity.

### Pure Weil–Deligne comparison up to equivalence

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison` (comparison; unchecked).

For the semisimple Weil representation shared by the Galois and automorphic sides, TY Lemma 1.4(4) determines at most one pure WD extension up to equivalence. Import purity and filtration from R01.2 and request the full primitive-string uniqueness, finite-extension equivalence and tensor-square detection. Apply it only after geometric purity of the Galois side and tempered purity of the automorphic side are proved. Do not replace purity with maximal rank of N: BCGP Lemma 2.5.1’s general maximal-rank uniqueness claim has the counterexample recorded in AG2.0/E3.

Hypotheses: Characteristic-zero algebraically closed field and semisimple Weil part; equivalence means a Weil-equivariant isomorphism carrying one N to the other.

Construction or proof:

1. Use primitive weight strings and their monodromy isomorphisms to recover the WD isomorphism class.
2. Apply the geometric tensor-square and finite-extension purity detection to the Galois side.
3. Combine with equality of the semisimple Weil parts.

Acceptance: N itself is not unique in a fixed basis. Rank N does not detect every N-power needed by purity.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence`, `AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness`, `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`, `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`, `ArithmeticGaloisRepresentations:R01.2/pure-graded-weil-deligne`, `ArithmeticGaloisRepresentations:R01.2`.

Sources:

- [Richard Taylor and Teruyoshi Yoshida, Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), Lemma 1.4(2)–(4), proof of (4), pp. 6–7. The uniqueness is a WD equivalence statement and uses full purity.

- [Ana Caraiani, Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Published typeset author copy lgc1.pdf, proof of Theorem 7.4, pp. 2410–2411; the preprint gives a shorter argument on p. 85. The primitive-string/binomial argument proves tensor-square detection of purity, an additional generic R01.2 contract beyond TY Lemma 1.4’s uniqueness and finite-extension assertions.

### The polarized local comparison from the definite family

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound` (theorem; unchecked).

For the arbitrary-regular polarized CH representation, at every v away from the coefficient prime the Frobenius-semisimplified WD parameter is dominated by the normalized local parameter of π. In particular their semisimple Weil parts agree. This is CH Theorem 3.2.3(a′), obtained from the tame Bernstein/monodromy restrictions in Theorem 2.3 and effective patching. It precedes the pure-WD upgrade and supplies that upgrade’s semisimple comparison without using Varma’s general nonselfdual theorem.

Hypotheses: CH General Hypotheses 1.1, the definite-unitary interpolation and source Bernstein restrictions; extend essentially polarized forms by the prescribed character twist.

Construction or proof:

1. At the dense geometric points import the local comparison in Shin’s range, with the imposed tame parameter bound.
2. Use the CH/BC family local theorem to specialize the Weil traces and monodromy domination at the target point.
3. Carry both properties through the S-general patching and solvable-index induction of Theorem 3.2.3.

Acceptance: The polarized semisimple comparison must precede Caraiani; otherwise using Varma here and Caraiani on Varma’s classical inputs creates a proof cycle. Domination retains the semisimple Weil part and only bounds N.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`, `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`, `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction`, `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`, `SmoothRepresentationsOfLocalGroups:SR.3`, `IntegralHeckeAndGaloisDeterminants:IHG.4`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3, tame-family paragraph, p. 8; Theorem 3.2.3(a′), pp. 11–12. The polarized bound is already proved by this interpolation and patching route.

### Published RACSDC comparison specializations

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations` (comparison; unchecked).

For the RACSDC systems, specialize the normalized away-prime compatibility to the relevant weight-zero representations of Liu et al. Proposition 3.2.4 and to BCGP25 RACSDC paragraph following equation (1.8.21). Published CS Theorem 5.5.4 supplies its polarized rank-n system and away-prime comparison; Corollary 5.5.5 treats the discrete sum separately. The p-adic WD comparison, de Rham assertions, coefficient conjugation and strong coefficient field are AG2.6 exports. Liu Hypothesis 3.2.10 is a conditional identification of a Shimura isotypic middle degree, not an unconditional realization for every π; Proposition 3.2.11’s stated range and its unpublished KSZ input are retained.

Hypotheses: Relevant means the CSD cohomological infinity type of Liu Definition 1.1.3; the chosen automorphic coefficient field and embeddings; no universal use of Hypothesis 3.2.10.

Construction or proof:

1. Match the relevant coefficient and weight-zero normalization with the good polynomial.
2. Apply the established polarized away-prime theorem.
3. Keep the conditional geometric identification and the p-adic comparison in their explicit requested ranges.

Acceptance: The RACSDC paragraph follows equation (1.8.21); it has no separate theorem or subsection number. CS discrete output has the full blockwise twists.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`, `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`, `AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization`.

Sources:

- [Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 1.1.3, p. 110; Proposition 3.2.4, Hypothesis 3.2.10 and Proposition 3.2.11, pp. 145–146 (PDF pp. 4, 39–40). The geometric identification is conditional and has a restricted verification range.
- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), Unnumbered RACSDC GL_n summary after equation (1.8.21), pp. 14–15. The unnumbered paragraph summarizes RACSDC systems; (1.8.21) labels the preceding GSp₄ equation.
- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Theorem 5.5.4, pp. 744–745. The published result is split by its away-prime and coefficient-prime dependencies.
- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Remark 5.5.6 and §5.6, pp. 746–750. The generic principal-series consequence and simple-Kottwitz variant have explicit supplier contracts.

### Comparison with the classical GL₂ constructions

Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison` (comparison; unchecked).

For a classical or Hilbert modular eigenform in the overlap of the source hypotheses, compare the constructed rank-two automorphic r with the classical R19.1/R19.2 representation after the explicit dual/cyclotomic and geometric-versus-arithmetic conversion. Equality of the good polynomials implies semisimple isomorphism. In the local range where R19.4 proves its own comparison, transport that comparison through the isomorphism. R19 is a consumer comparison, not an input to arbitrary-rank existence or raw geometry.

Hypotheses: Both independently constructed representations exist; identical weight, nebentype, embedding and Frobenius convention after conversion; only the actual R19 local range is used.

Construction or proof:

1. Use IHG.3 rank-two normalization and reciprocal conversion to match the good polynomials.
2. Use the generic Frobenius recognition theorem.
3. Transport the established R19.4 local assertion, without expanding its hypotheses.

Acceptance: Weight k arithmetic polynomial X²−a_qX+ω(q)q^(k−1) becomes its normalized reciprocal at geometric Frobenius.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.3/rank-two-modular-normalization`, `AutomorphicGaloisRepresentations:R19.1`, `AutomorphicGaloisRepresentations:R19.2`, `AutomorphicGaloisRepresentations:R19.4`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

Sources:

- [Gaetan Chenevier and Michael Harris, Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.2, pp. 10–12; §4, Hypotheses 4.1 and Theorem 4.2, p. 13. The overlap is identified by uniqueness after the arbitrary regular construction.

## AG2.6. Coefficient-prime comparison and compatible systems

### Weak, very weak and extremely weak automorphic data

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`. Kind: comparison. Implementation: unchecked.

Conditional on the R24.5:operations owner separating data from admissibility, use its single arbitrary-rank data carrier: coefficient number field M, finite S, common good-prime polynomials P_v, continuous semisimple members r_λ and labelled Hodge metadata H_τ. The carrier does not intrinsically require the members to be de Rham, crystalline, pure or polarized. Weak, VeryWeak and ExtremelyWeak are predicates supplied by that owner. Weak requires de Rhamness at every v|ℓ for every λ, the full labelled Hodge multisets for all members, and crystallinity when v|ℓ lies outside S. VeryWeak retains the determinant Hodge sums for all λ and, outside a set of rational ℓ of Dirichlet density zero, requires every λ|ℓ to be crystalline at every v|ℓ with the full labelled Hodge multisets for every coefficient embedding over M. ExtremelyWeak drops this density-one clause and retains the determinant Hodge sums for all λ. Prove Weak ⇒ VeryWeak ⇒ ExtremelyWeak on those same data. No higher-rank converse is asserted. The two current R24.5 supplier statements do not yet give this consistent interface, so this is a requested import, not a verified existing construction.

Proof route:

1. Obtain the owner’s corrected data/predicate interface before importing weakening maps; do not reuse the current carrier with full weak conditions built in as extremely weak data.
2. Transport AG2 geometric Frobenius and HT(ε)=−1 through the owner’s normalization parameter.
3. Use the supplied weakening implications. The labelled determinant sum forgets information in rank greater than one.

Direct inputs:

- `PotentialModularityAndCompatibleSystems:R24.5:operations`

Acceptance checks:

- For n=2 the lists {0,3} and {1,2} have the same determinant sum and are distinguished by weak compatibility.
- Rank-one extremely weak data become weak through the supplier’s algebraic-character classification.

Suggested Lean component (shared-component): The Hodge-sum acceptance calculation and the determinant-sum counterexample are typed; the data/predicate comparison stays a conditional supplier import.

Omitted conditions: R24 raw data and Weak/VeryWeak/ExtremelyWeak predicates; their density and local period conditions.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1084–1086. These are imported predicates on one carrier.

### Comparison on the geometric automorphic summand

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.geometricCoefficientPrimeComparison`.

For the smooth proper PEL/Kuga–Sato realization supplied by AG2.1a, after the stated Schur projector, automorphic isotypic projector and Tate twist, apply D_cris and D_dR to the actual cohomological summand. The comparison maps are restrictions of geometric comparison and commute with the projectors and cup products. At good reduction the summand is crystalline; its filtered de Rham realization gives HT_τ={a_{τ,i}+n−i : 1≤i≤n}. At strictly semistable reduction use the filtered (φ,N) comparison, with the same projectors. The passage is through a geometric realization, not an assumption that an arbitrary attached representation has period dimensions n.

Additional input conditions:

- AG2.1a first supplies the raw smooth proper PEL or Kuga–Sato realization, algebraic coefficient representation, cohomological degree, commuting Schur/isotypic idempotents, multiplicity and Tate twist. Its currently named attached-representation conclusion does not supply these data.
- The claimed good or strictly semistable reduction belongs to that realization and the specified local model. Comparison is applied to its cohomology before any admissibility conclusion about the attached representation.

Proof route:

1. Obtain the requested raw AG2.1a realization and projector/multiplicity/Tate dictionary independently of an attached-representation admissibility theorem.
2. Restrict the functorial geometric comparison to projector images, using strict exactness of the period functors.
3. Read each Hodge graded piece in the algebraic coefficient system; negate the supplier’s HT(ε)=+1 weights at this boundary.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.1a`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`
- `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`
- `PadicHodgeTheory:R06.5`
- `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`
- `AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity`
- `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`

Acceptance checks:

- For a classical weight-k base-change form the AG2 multiset is {0,k−1}.
- Projector images commute with coefficient extension; dimension equals the cohomological multiplicity times n.

Suggested Lean component (algebraic-fragment): An actual linear equivalence commuting with supplied idempotents induces an equivalence of their ranges.

Omitted conditions: Raw PEL/Kuga–Sato geometry, period functors and Hodge filtration, cohomological multiplicity and Tate normalization.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §1.4–1.5, Theorem 1.4 and formula (1.6), pp.5–7. Geometric cases, including the dual convention.

### Hodge comparison through deformation and descent

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.coefficientHodgeComparisonThroughDescent`.

For a conjugate-self-dual cohomological cuspidal Π over a CM field, the Chenevier–Harris construction passes de Rham, the prescribed regular Hodge multiset, crystallinity at spherical places and semistability at Iwahori places through their bounded family and cyclic patching. Theorem 2.3 varies weights at one chosen coefficient-prime place v_0 and establishes admissibility at the other coefficient-prime places. Theorem 3.2.3 removes this exclusion by solvable base change and descent, arranging at least two coefficient-prime places. A convergent sequence of de Rham representations with unbounded Hodge weights is not the statement.

Proof route:

1. Use the imported Fredholm determinant, finite-projective slope summands and completed base change in the AG2.3 eigenvariety interface, then apply the constant-weight bounded-family period theorem at places other than v_0.
2. Use S-general cyclic extensions disjoint from the finite bad cuspidality extensions; patch by intersection compatibility and invariance.
3. At a target coefficient place choose a solvable extension splitting enough other places, then descend the period comparison and recover its filtration.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`
- `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`
- `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`
- `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction`
- `LocallyAnalyticDistributions:L4/fredholm-determinant`
- `LocallyAnalyticDistributions:L4/finite-slope-summands`
- `LocallyAnalyticDistributions:L4/completed-base-change`
- `PadicHodgeTheory:R06.2/de-rham-base-change`
- `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`
- `PadicHodgeTheory:R06.2`

Acceptance checks:

- The place v_0 is absent from Theorem 2.3’s de Rham claim and present in Theorem 3.2.3.
- The labelled multiset, not only its sum, survives descent.

Suggested Lean component (algebraic-fragment): Equality of supplied labelled Hodge multisets descends along a surjective restriction of labels.

Omitted conditions: Bounded constant-Hodge-type family and its geometric dense locus; exceptional v₀; cyclic patching/local splitting and period descent.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3; §3.1; Theorem 3.2.3, pp.8–12. Other coefficient places first; cyclic patching removes the exclusion.

### Polarized admissibility at the coefficient prime

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.polarizedCoefficientPrimeAdmissibility`.

Let F be CM and (π,χ) regular algebraic cuspidal polarized of weight a. For every λ|ℓ and v|ℓ, r_{π,λ}|G_{F_v} is de Rham with HT_τ={a_{τ,i}+n−i}. If π_v is spherical it is crystalline; if π_v has Iwahori-fixed vectors it is semistable. In the Iwahori case BLGGT Theorem 2.1.1(4) gives full Frobenius-semisimple WD comparison with rec(π_v|det|^{(1−n)/2}). The full comparison for general π_v is the separate Caraiani theorem below.

Proof route:

1. Use the Chenevier–Harris descent theorem for Hodge admissibility.
2. Apply geometric semistable/crystalline comparison in the Iwahori/spherical cases.
3. Keep the proof order: the geometric Iwahori case precedes Caraiani’s general full-monodromy argument.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`
- `PadicHodgeTheory:R06.3/weil-deligne-parameter`

Acceptance checks:

- An unramified local component has N=0 and the expected crystalline polynomial.
- An Iwahori component may have N≠0; semistable does not mean crystalline.

Suggested Lean component (output-signature): The representation-indexed Hodge projection has the full expected multiset, using one-based aᵢ translated to Fin n.

Omitted conditions: Polarized regular algebraic cuspidality and actual geometric realization; de Rham/crystalline/semistable predicates and Iwahori/spherical hypotheses. Necessary automorphic hypotheses are omitted, so this is not a universal assertion about arbitrary r or HT.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(3)–(4), pp.33–34. Admissibility and the Iwahori comparison.

### Log-crystalline purity of the automorphic summand

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.logCrystallineAutomorphicPurity`.

In Caraiani’s two-boundary semistable PEL model and its Kuga–Sato projector, the Π-isotypic log-crystalline summand realizing the tensor-square representation is pure as a WD representation (Proposition 5.1). Use the two-index strata Y^(r,s) and Theorem 4.6’s generalized log-crystalline weight spectral sequence, with Frobenius, twists and the residue realization of N. Purity follows after proving the relevant projected stratum cohomology is concentrated on the required diagonal; neither semistability nor the existence of the spectral sequence alone implies purity.

Additional input conditions:

- The separate AG2.1a tensor-square realization includes the two distinguished coefficient-prime places, the closed two-index strata, cohomological multiplicity and coefficient-system projector/Tate twist. Its projected stratum concentration is proved before degeneration and purity are inferred.
- The log model used for comparison is proper, fine and saturated, log smooth and vertical over the standard log DVR, with special fiber of Cartier type. The second boundary uses its own divisors and s factors. With m smooth local coordinates, a nonempty (i,j)-stratum has dimension 2n+m−i−j; carry this dimension and the Kuga–Sato/Tate shifts into the spectral sequence.

Proof route:

1. Use the actual tensor-square cohomological realization and projector in §§2 and 5.
2. Apply the two-boundary log de Rham–Witt spectral sequence, including N realized by the residue operator.
3. Compare closed-stratum crystalline and étale cohomology; projected concentration along i=2n−2 gives degeneration and pure graded pieces.
4. Recover purity on the automorphic summand through the monodromy filtration.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`
- `CrystallineCohomology:CR.6`
- `WeightsInEtaleCohomology:R34.6`
- `AutomorphicGaloisRepresentationsPartII:AG2.1a`

Acceptance checks:

- Keep both stratum indices; a one-divisor Rapoport–Zink sequence is not the required input.
- A mixed cohomological summand without the concentration theorem does not pass the purity test.

Suggested Lean component (output-signature): The supplied monodromy-graded Frobenius matrices have squared root norm q^(W+i).

Omitted conditions: Two-boundary log de Rham–Witt complex, Frobenius/residue maps, closed-stratum projectors and diagonal concentration; monodromy filtration. These necessary geometric hypotheses are omitted.

Sources:

- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), §§2–4; Theorem 4.6, Remark 4.7, Proposition 5.1, pp.31–32. The projected two-boundary spectral sequence supplies purity.

- [Caraiani, published version](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf), §3A, pp.1609–1611, including Lemma 3.2; comparison hypotheses immediately before Corollary 2.3, p.1609. Specifies the log comparison domain and both independent boundary directions; AG2.6/E6–AG2.6/E8 record corrected indices and the dimension contribution of the smooth coordinates.

### Full polarized local–global compatibility at ℓ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.fullPolarizedCoefficientPrimeComparison`.

For n≥2, a conjugate-self-dual cohomological cuspidal Π over CM F, any ℓ, ι and v|ℓ, WD(r_{Π,ℓ,ι}|G_{F_v})^{F-ss} ≅ ι⁻¹ rec(Π_v|det|^{(1−n)/2}) with monodromy. The algebraic-character twist of AG2.2 extends this to the stated polarized branch. The theorem has no Shin-regularity condition; it uses purity of the geometric summand, temperedness and the pure-parameter uniqueness theorem. Rank one is supplied by algebraic local class field theory.

Proof route:

1. Twist to the conjugate-self-dual branch and take solvable local base change to an Iwahori situation.
2. Use log-crystalline purity of the tensor-square realization and the established temperedness theorem.
3. Apply Taylor–Yoshida pure WD uniqueness to the known semisimplification, then descend and undo the character twist.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`
- `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`

Acceptance checks:

- A Steinberg parameter retains its nonzero N.
- The even-rank non-Shin-regular case is included.

Suggested Lean component (output-signature): A single invertible u intertwines both the Weil action and monodromy N.

Omitted conditions: Polarized automorphic/geometric hypotheses, de Rham/WD constructions and tensor-square purity with pure-WD uniqueness. Necessary hypotheses are omitted; arbitrary matrix pairs need not admit such u.

Sources:

- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2; §§2 and 5. Equality includes N, including even non-Shin-regular weights.

### Nonselfdual de Rham comparison at ℓ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.allCMCoefficientPrimeComparison`.

A’Campo–Hevesi–Thorne–Whitmore v1, Theorem 1.2.1: for every CM F, n≥1, regular algebraic cuspidal π of highest weight a, ℓ, ι and v|ℓ, r_{π,ℓ,ι}|G_{F_v} is de Rham, has HT_τ={a_{ιτ,i}+n−i}, and WD(r_{π,ℓ,ι}|G_{F_v})^{ss} ≅ ι⁻¹ rec^T(π_v)^{ss}. Here rec^T(π_v)=rec(π_v|det|^{(1−n)/2}). No conjugate self-duality, residual irreducibility or decomposed genericity hypothesis is imposed. This is the July 2026 preprint theorem, with its precise input chain recorded below.

Proof route:

1. Use quantitative Hecke annihilators for cohomology outside the middle degree (Theorem 2.5.7), via local Shimura cohomology and Mantovan’s formula, rather than a residual genericity assumption.
2. Use bounded potentially semistable pseudodeformation quotients for arbitrary residual multiplicities (Theorem 3.3.6).
3. Control non-Siegel boundary terms and shift interior cohomological degrees; induction on n yields the bounded torsion local–global comparison P(n,a,S,T_n) in Proposition 5.2.8.
4. After suitable cyclic base change remove the auxiliary local-degree inequalities in Proposition 5.2.8 and apply Theorem 5.2.9.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `PadicHodgeTheory:R06.3/weil-deligne-parameter`
- `AutomorphicGaloisRepresentationsPartII:AG2.4`
- `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`

Acceptance checks:

- Reducible residual representations are allowed.
- The result is equality after ss, not an equality of monodromy operators.

Suggested Lean component (output-signature): Full labelled Hodge multisets and conjugacy of supplied semisimplified Weil projections are typed, with no N intertwiner.

Omitted conditions: Regular algebraic CM cuspidality; actual period/WD projections; AHTW quantitative cohomology and bounded pseudodeformations. These necessary hypotheses are omitted.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, p.5; §1.2.3–1.2.5; Theorem 5.2.9. All regular algebraic CM cuspidal representations.

### Nonselfdual monodromy bound at ℓ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.nonselfdualCoefficientPrimeMonodromyBound`.

Under the preceding theorem, WD(r_{π,ℓ,ι}|G_{F_v})^{F-ss} ≺ ι⁻¹rec^T(π_v). Equality of the semisimplified Weil representations comes from the preceding comparison theorem, not from the definition of the order. The order compares, for each irreducible Weil representation up to unramified twist, the sums of the largest Jordan-block sizes: every first-i sum on the left is ≤ the corresponding sum on the right. It is Varma’s order of §8.2, used in AHTW Definition 6.0.2. Full equality of N is not asserted for a general nonselfdual ramified π_v.

Proof route:

1. Use the ss equality from Theorem 1.2.1.
2. Local genericity of a cuspidal global π implies its local rec^T parameter is generic in the WD sense Hom_WD(D,D(1))=0.
3. Apply Proposition 6.0.5 and Corollary 6.0.6: its monodromy is maximal in the fixed-Weil-parameter space.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`

Acceptance checks:

- Two parameters with the same Weil semisimplification and different N can satisfy a strict inequality.
- WD genericity here is a characteristic-zero Hom condition, not AG2.7 residual genericity.

Suggested Lean component (output-signature): Partial-sum dominance of supplied Weil-type block lists is typed independently of semisimplified Weil equality.

Omitted conditions: Frobenius-semisimple WD construction, extraction of descending Jordan block lists by irreducible Weil type modulo unramified twist, automorphy and maximal-orbit hypotheses. Arbitrary lists do not satisfy this output without the omitted hypotheses.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Corollary 1.2.2, p.6; Definitions 6.0.1–4, Corollary 6.0.6, pp.111–112. Generic local GL_n parameters occupy the maximal monodromy orbit.

### Nonselfdual spherical and Iwahori admissibility

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.allCMCrystallineIwahoriAdmissibility`.

For arbitrary regular algebraic cuspidal π over a CM field, r_{π,λ}|G_{F_v} is crystalline when v|ℓ and π_v is spherical, and is semistable when π_v has Iwahori-fixed vectors. In the spherical case its crystalline Frobenius polynomial is the rec^T Satake polynomial. Proof: de Rham implies potentially semistable; ss compatibility gives trivial WD inertia for Iwahori π_v, and the monodromy bound against N=0 forces N=0 in the spherical case. Iwahori semistability does not establish full monodromy equality.

Proof route:

1. Apply the p-adic monodromy theorem.
2. A finite inertia action in characteristic zero is semisimple; triviality of its semisimplification therefore gives trivial inertia.
3. For spherical π_v all Jordan blocks on the upper bound have size one, so the dominance order forces N=0.
4. Apply the supplier’s semistable/crystalline criterion and Frobenius comparison.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`
- `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`
- `PadicHodgeTheory:R06.3/weil-deligne-descent`

Acceptance checks:

- An Iwahori parameter may retain nonzero N.
- No Fontaine–Laffaille weight range or residual genericity is required.

Suggested Lean component (algebraic-fragment): A monodromy matrix of rank at most zero is zero.

Omitted conditions: Actual WD inertia, crystalline/semistable period criteria, spherical and Iwahori hypotheses; the Iwahori semistability output.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. Admissibility is a consequence using the imported WD criteria.

### Totally real polarized coefficient-prime descent

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.totallyRealPolarizedCoefficientPrimeComparison`.

For a regular algebraic essentially self-dual cuspidal π over a totally real F, the attached BLGGT representation has the stated labelled Hodge weights, is de Rham, is crystalline at spherical coefficient-prime places and semistable at Iwahori places. Full coefficient-prime WD comparison is obtained from the polarized CM theorem by choosing a quadratic CM extension split at the target finite place, retaining cuspidality, matching the base-changed Galois representation, and comparing that unchanged local completion. This also covers the totally-real members used by Newton–Thorne; no unrestricted nonpolarized totally-real assertion is added.

Proof route:

1. Use the totally-real attached representation from AG2.0 and BLGGT.
2. Choose a cuspidality-preserving quadratic CM extension split at the prescribed finite place and identify the restrictions by their good polynomials.
3. Apply the full polarized CM coefficient-prime theorem at the unchanged local field and transport its Hodge/WD data.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`

Acceptance checks:

- The completion at the selected place is unchanged by split base change.
- The rank-two exact R19 overlap imports its full all-Hilbert theorem.

Suggested Lean component (algebraic-fragment): Conjugacy after a local group isomorphism implies conjugacy before that isomorphism.

Omitted conditions: Totally-real polarized automorphic branch, split CM base change, its local-completion identification and controlled descent.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; §2.1 terminology. The source allows CM or totally real polarized fields.

### Embedding independence and semisimple uniqueness

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.coefficientEmbeddingIndependence`.

Fix π, its coefficient field M_π, λ and the embedding M_π→Q̄_ℓ attached to λ. Any two continuous semisimple n-dimensional representations of G_F with the common good geometric Frobenius polynomials P_v for v outside a finite set are isomorphic over Q̄_ℓ. Thus r_{π,ℓ,ι} depends on ι only through its restriction to M_π, up to isomorphism. This determines an isomorphism class, not a preferred basis or unique intertwiner. Different λ are compared by the common M_π-polynomials, not by identifying their topological coefficient fields.

Proof route:

1. Use Chebotarev density to extend equality from good Frobenius classes to continuous characteristic-zero traces or characteristic polynomials.
2. Apply arbitrary-rank semisimple Brauer–Nesbitt.
3. For changes of ι fixing M_π, good polynomials coincide; conclude isomorphism, retaining scalar automorphisms.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`
- `ArithmeticGaloisRepresentations:R01.5`
- `mathlib:Matrix.charpoly_units_conj`

Acceptance checks:

- In rank one, an algebraic Hecke character is recovered.
- Scalar matrices give nonunique intertwiners even for an absolutely irreducible member.

Suggested Lean component (algebraic-fragment): For semisimple representations over a characteristic-zero field, equality of characteristic polynomials at every group element gives conjugacy over the algebraic closure.

Omitted conditions: Topology, genuine global Galois group and good Frobenius set; Chebotarev upgrade from good places to every element.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. The common rationality field and Frobenius data determine members.

### Compatible system attached to π

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.compatibleSystem`.

For a regular algebraic cuspidal π of GL_n(A_F), with F CM, or F totally real and π polarized, once the R24.5 owner fulfills the data/predicate separation request, assemble R_π on that single imported carrier: M_π is the field fixed by σ∈Aut(C) preserving π^∞; S_π is the finite ramification set of π; P_v(X) is the common monic rec^T geometric Frobenius polynomial; r_λ is the attached continuous semisimple representation; H_τ={a_{τ,i}+n−i}. Populate weak compatibility using all-CM de Rham admissibility, or the totally-real polarized theorem, and crystallinity for v outside S_π above ℓ. Purity, polarization and all-place strict compatibility are separate branch predicates, not fields asserted for every π.

Proof route:

1. Require the owner’s corrected raw-data assembly and projection laws; the current contradictory carrier statements are not treated as a completed import.
2. Fix the finite rationality field and finite ramification set from AG2.0.
3. Install every λ-member and P_v using good-place compatibility and embedding independence.
4. Read the labelled Hodge multisets from the coefficient-prime theorem and prove the weak predicate.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`

Acceptance checks:

- All λ use one M_π and S_π.
- Only the polarized instance receives the full pure-WD comparison below.

Planned API:

- `TauCeti.AutomorphicGalois.compatibleSystem` (constructor): Map π to R_π in the supplier carrier.
- `TauCeti.AutomorphicGalois.compatibleSystem_member` (projection): The λ-member after embedding is r_{π,ℓ,ι}, up to isomorphism.
- `TauCeti.AutomorphicGalois.compatibleSystem_goodPolynomial` (simp): At v outside S_π, the common polynomial is P_v(X).
- `TauCeti.AutomorphicGalois.compatibleSystem_hodgeTate` (data): The labelled multiset is {a_{τ,i}+n−i}, including multiplicities.
- `TauCeti.AutomorphicGalois.compatibleSystem_weak` (compatibility): R_π satisfies the R24.5 weak predicate, with explicit normalization conversion.
- `TauCeti.AutomorphicGalois.compatibleSystem_embedding` (extensionality): Two ι inducing the same λ on M_π give isomorphic members.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.compatibleSystem_rank_one` (degenerate): For an algebraic Hecke character ψ, this is its class-field-theoretic compatible system. **Prototype:** The assembly/projection law retains an actual supplied rank-one homomorphism; algebraic-Hecke-character/class-field construction is omitted.
- `TauCeti.AutomorphicGalois.compatibleSystem_weight_k` (computation): At n=2, a=(k−2,0), the Hodge multiset is {k−1,0} and its sum is k−1. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.compatibleSystem_R19` (compatibility): On the exact classical/Hilbert overlap, applying the stated dual/twist dictionary identifies each λ-member with the R19 fixed-form member. **Prototype:** Characteristic-zero semisimple comparison assumes equality for every group element after the supplied dual/twist normalization; the actual R19 dictionary is omitted.
- `TauCeti.AutomorphicGalois.compatibleSystem_no_automatic_strictness` (non-example): A weak instance with only good-place polynomials cannot supply an equality of monodromy at an unspecified bad place. **Prototype:** Explicit distinct nilpotent N matrices test the missing monodromy data; no weak-system inhabitant is constructed.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.0`: Supplies the fixed automorphic members and their normalization, before deformation or lifting.
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`: Allows tensor, dual and algebraic-character operations on the same carrier.

Suggested Lean component (algebraic-fragment): The constructor calls an externally supplied assembly operation on actual homomorphisms, polynomials and Hodge multisets. Projection APIs use explicit supplier coherence laws. The weak API currently tests only common good polynomials.

Omitted conditions: The corrected R24 data carrier/assembly implementation and admissibility predicates; number field, varying completions/place indexing, finite S, continuity, automorphic pi, good-place and full weak period conditions.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. Construct the automorphic data; stronger admissibility is supplied separately.
- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, pp.5–6. Upgrades the all-CM instance to weak compatibility.

### Complex and local coefficient conjugation

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.coefficientConjugation`.

For RAESDC π over totally real F or RAECSDC π over CM F, σ∈Aut(C), r_{σπ,ι}≅r_{π,σ⁻¹ι}. If σ_ℓ∈Gal(Q̄_ℓ/Q_ℓ) and σ=ισ_ℓι⁻¹, then σ_ℓ(r_{π,ι})≅r_{π,ισ_ℓ⁻¹}≅r_{π,σ⁻¹ι}≅r_{σπ,ι}. Coefficient conjugation acts on matrix entries; the absolute Galois group G_F is unchanged. Twisted tensor products use the semilinear convention of NT footnote 4.

Proof route:

1. Use rationality and conjugation of finite automorphic components from Clozel’s theorem.
2. Conjugate every good Satake polynomial and compare through σ⁻¹ι.
3. Apply semisimple uniqueness; the local formula follows by taking σ=ισ_ℓι⁻¹.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`
- `AutomorphicFormsOnReductiveGroups:AF.4`

Acceptance checks:

- σ=id gives the same isomorphism class.
- Composition gives σ_ℓτ_ℓ(r)≅σ_ℓ(τ_ℓ(r)), not a pullback on G_F.

Suggested Lean component (algebraic-fragment): Entrywise ring-automorphism change followed by its inverse returns the same group homomorphism; G itself is unchanged.

Omitted conditions: Clozel conjugate automorphic representation σπ and its weight/rationality construction; embedding conventions for ι and σ_ℓ.

Sources:

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Theorem 5.1 and Lemma 5.2, p.38, footnote 4. Both complex and local coefficient automorphisms, with inverse orientation.

### Strong coefficient field

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsStrongCoefficientField`.

For Π regular cohomological cuspidal conjugate-self-dual (including Liu’s relevant specialization with archimedean principal series arg^{1−n},arg^{3−n},…,arg^{n−1}) and a number field E⊂C containing Q(Π), E is a strong coefficient field if for each finite λ of E there exists a continuous E_λ-linear ρ_{Π,λ} whose scalar extension to Q̄_ℓ is ρ_{Π,ι} for every ι inducing λ. Members are unique up to E_λ-conjugacy when descended by the semisimple realization theorem. This is a field of definition of the representations, stronger than the field of rationality of good polynomials. It includes a family of descended realizations, not canonical bases or canonical intertwiners. This generalizes Liu’s named definition beyond its relevant specialization, using the simultaneous realization condition justified by Chenevier–Harris Proposition 3.2.5; Liu’s conditional minimal-field assertion remains confined to his specialization and Hypothesis 3.2.10.

Proof route:

1. Define the simultaneous realization condition on the supplier’s family, keeping the embedding compatibility.
2. Use descent/uniqueness only after scalar extension; record E_λ-linear conjugacy as the equivalence relation.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`
- `ArithmeticGaloisRepresentations:R01.5`

Acceptance checks:

- Containing Q(Π) is necessary, not by itself sufficient.
- Q(Π) being strong under Hypothesis 3.2.10 remains conditional.

Planned API:

- `TauCeti.AutomorphicGalois.IsStrongCoefficientField` (characterisation): The preceding all-λ realization property.
- `TauCeti.AutomorphicGalois.strongCoefficientField_member` (data): Choose an E_λ-realization with its scalar-extension isomorphism.
- `TauCeti.AutomorphicGalois.strongCoefficientField_baseChange` (functoriality): For E′/E finite, each λ′-member is E′_λ′⊗_{E_λ}ρ_{Π,λ}, with the identity and composition laws.
- `TauCeti.AutomorphicGalois.strongCoefficientField_unique` (extensionality): Descended semisimple members are unique up to conjugacy, not as based homomorphisms.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.strongCoefficientField_character` (degenerate): A rank-one character whose values lie in E has the expected E_λ-realizations. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongCoefficientField_extension` (compatibility): Changing E to a finite extension gives exactly the supplier’s coefficient base-change operation at every λ′. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongCoefficientField_not_rationality` (non-example): The definition does not identify rational Frobenius traces with a canonical E_λ-model; a nontrivial Schur obstruction must be split. **Prototype:** A supplied complex quaternionic representation has rational traces and two specified quaternion generators; its matrices cannot descend to GL₂(Q). This tests a nonsplit descent obstruction, beyond based-matrix inequality.
- `TauCeti.AutomorphicGalois.strongCoefficientField_scalar_intertwiner` (characterisation): Nonzero scalar multiples of an intertwiner remain intertwiners, so uniqueness is of the isomorphism class. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.

Consumers:

- `Liu et al., §3.2 and Appendix D`: Defines λ-members and integral reductions simultaneously.
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`: Uniform field of definition can precede every local lattice choice.

Suggested Lean component (algebraic-fragment): For every external coefficient-place index, a homomorphism over the supplied descended field becomes conjugate to the given member. Choice returns that model with its conjugacy evidence; tower and uniqueness APIs are typed.

Omitted conditions: A common number field E, finite places and completions E_λ, their relation to every inducing embedding, continuity and automorphic pi. The quaternionic non-example supplies its actual group representation and tests rational-trace failure of Q-descent.

Sources:

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 3.2.5 and Remark 3.2.6, printed p.145. A simultaneous field of definition, distinguished from Q(Π).
- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5, author-copy p.12. Justifies the broader regular cohomological domain used by the following uniform-realization theorem.

### Uniform strong realization of polarized systems

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.existsUniformStrongCoefficientField`.

For a conjugate-self-dual cohomological cuspidal Π over CM F, there is one finite number field E⊂C which is a strong coefficient field for all λ. Chenevier–Harris Proposition 3.2.5 enlarges the coefficient field E_0 of good polynomials by roots of regular semisimple good Frobenius elements at two places of different residue characteristics. Each λ can use one place away from ℓ; a split regular Frobenius and E_0-valued traces split the semisimple descent obstruction. No assertion that the minimal rationality field itself is strong is included.

Proof route:

1. Regular Hodge–Tate weights give a regular semisimple element in the algebraic monodromy group.
2. Choose two good regular Frobenius elements of different residue characteristics by Chebotarev.
3. Adjoin their eigenvalues to E_0 and apply the splitting/descent argument at each λ.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`
- `ArithmeticGaloisRepresentations:R01.5`
- `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`

Acceptance checks:

- Both good places are needed so one lies away from each coefficient prime.
- Hypothesis 3.2.10 is not used for the existence of an enlarged E.

Suggested Lean component (algebraic-fragment): Semisimple characteristic-zero representations in one algebraically closed ambient field, with traces in E₀ and characteristic polynomial one of two monic separable degree-n polynomials, descend over a finite intermediate extension.

Omitted conditions: The simultaneous number-field/p-adic-completion setup; regular Hodge weights, Chebotarev construction of two good places of different residue characteristics and each member’s choice away from ell. This algebraic component retains two regular polynomials, but does not construct those places.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5, p.12. Uniform realization follows from two regular Frobenius elements.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Remark 3.2.6, printed p.145. Existence is separate from conditional minimal-field rationality.

### Purity and polarization of the polarized system

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.polarizedSystemPurity`.

For a regular algebraic polarized cuspidal (π,χ) with a_{τ,i}+a_{τc,n+1−i}=w, R_π is pure and BLGGT-strictly pure of weight W=w+n−1. Its polarization is r_λ^c≅r_λ^∨⊗μ_λ, μ_λ=ε_ℓ^{1−n}r_{χ,λ}; the χ-system has purity weight 2w. Total oddness uses μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so the required sign is χ_v(−1)=(−1)^{n+w}. BLGGT strict purity describes pure common WD parameters away from the coefficient prime; all-place strict compatibility needs the separately proved coefficient-prime theorem, not a change of definition.

Proof route:

1. Use the algebraic weight symmetry and AG2.0’s corrected multiplier sign.
2. Apply tempered local comparison and weight purity at the good and away-coefficient places.
3. Populate the separate pure/polarized predicates, then use full coefficient-prime comparison for the all-place property.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`
- `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`
- `PotentialModularityAndCompatibleSystems:R24.5/polarized-system`
- `PotentialModularityAndCompatibleSystems:R24.5/character-system`

Acceptance checks:

- At n=2, a=(k−2,0), W=k−1.
- Purity is not inferred from a common polynomial family on an arbitrary nonselfdual branch.

Suggested Lean component (output-signature): At good places the root norm equation uses purity weight w+n−1.

Omitted conditions: Polarized automorphic hypotheses, monodromy-graded strict purity, Hodge conjugation, multiplier and total-oddness conditions. Necessary hypotheses are omitted; arbitrary P is not pure.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(1)–(2), pp.33–34; §5.1 pp.62–65. Purity weight and branch predicates on the imported carrier.

### Very weak compatibility and the density-one DGI route

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`. Kind: comparison. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.veryWeakCompatibilityUnderDGI`.

After the R24.5 data/predicate separation request is fulfilled, the weak compatibility proved for the constructed R_π implies very weak compatibility through the owner’s weakening map on the same data. This gives, in particular, the conclusions of ACC+ Lemmas 7.1.9–7.1.10. Lemma 7.1.9 originally assumes a density-one set of rational ℓ for which every residual member is absolutely irreducible and decomposed generic; Lemma 7.1.10 proves very weak compatibility in rank two through its constituent/image arguments. That Fontaine–Laffaille/degree-shifting proof is an arithmetic consumer in PA.1; it is not an input to the all-CM construction here. None of these statements gives residual irreducibility at every coefficient place.

Proof route:

1. Apply the all-CM or totally-real polarized weak compatibility already proved for R_π.
2. Forget to the very weak predicate; the finite ramification set omits only finitely many coefficient characteristics.
3. Compare its conclusion with the two ACC+ source lemmas without importing their downstream Fontaine–Laffaille route.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`

Acceptance checks:

- A finite set of exceptional ℓ is allowed.
- Existence of a local generic prime alone does not establish absolute irreducibility.

Suggested Lean component (algebraic-fragment): The full Hodge equality restricts to a specified subset of coefficient indices.

Omitted conditions: Density-one rational coefficient primes, DGI/image/Fontaine–Laffaille arguments, crystallinity and the owner’s weakened predicates. The subset is not asserted to have density one in Lean.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemmas 7.1.9–7.1.10, pp.1093–1094. The density-one DGI route, with rank-two specialization.

### Comparison strength at the coefficient prime

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-prime-branch-and-what-it-does-not-give`. Kind: comparison. Implementation: unchecked.

The polarized branch has de Rham admissibility and full pure WD comparison at every coefficient-prime place. The all-CM nonselfdual branch has de Rham admissibility, full labelled Hodge weights, ss compatibility and the monodromy upper bound of AHTW v1; spherical crystallinity and Iwahori semistability follow from WD criteria. Full N equality for general nonselfdual ramified places is not supplied by these statements. Fontaine–Laffaille, ordinary lifting and residual-image conclusions retain their separate consumer hypotheses.

Proof route:

1. Compare the exact outputs without upgrading a bound to equality.
2. Retain the branch tag on each arithmetic export.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`

Acceptance checks:

- A ramified nonselfdual member cannot be passed to a full-WD consumer without an additional theorem.
- Crystallinity at good places is sufficient for the imported weak predicate.

Suggested Lean component (shared-component): The two export structures and their negative examples distinguish a monodromy bound from a map intertwining N.

Omitted conditions: Actual automorphic/period realizations and the unavailable full branch predicates.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. Separate ss equality and N bound.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2. The polarized theorem identifies N.

### Rank-two comparison with R19

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19`. Kind: comparison. Implementation: unchecked.

For a fixed classical newform of weight k≥2 or regular cohomological Hilbert eigenform in the exact R19.3/5 overlap, identify the AG2 λ-member with the R19 member after converting geometric/arithmetic Frobenius and the stated Tate twist. For the standard weight-k classical normalization this is r_AG2≅r_R19^∨, giving geometric polynomial X²−a_qX+ψ(q)q^{k−1}, HT_AG2={0,k−1}, and det=r_ψ ε^{1−k} where r_ψ(Frob_q^geom)=ψ(q). For Hilbert (k_τ,w) use Skinner’s explicit half-integer normalization before dualizing; parity is part of its hypotheses. Import R19’s full Skinner coefficient-prime theorem, not Kisin’s conditional theorem as unconditional.

Proof route:

1. Fix the same eigenform and match normalized good Frobenius polynomials.
2. Apply semisimple uniqueness for the transported λ-members.
3. Transport Hodge and WD data from the supplier theorem on its exact regular-weight domain.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`
- `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`

Acceptance checks:

- For k=2 the weights are {0,1}; geometric det is ψε⁻¹.
- Finite-image weight-one systems do not enter the regular k≥2 comparison.

Suggested Lean component (shared-component): The rank-two assembly test identifies already-normalized semisimple members from every-element characteristic-polynomial equality; the full weight-k multiset is checked.

Omitted conditions: The R19 classical/Hilbert normalization constructor, Skinner local theorem and geometric-versus-arithmetic Frobenius dictionary.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §1.5 formula (1.6); Theorem 3.2.3. Explicit dual-normalization comparison on the common domain.

### Coefficient independence of tensor automorphy

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.tensorAutomorphyIndependentOfIota`.

Let π_1 and σ be RAESDC over a totally real F. Suppose r_{π_1,ι}⊗r_{σ,ι} is irreducible and automorphic for one (ℓ,ι), in the RAESDC sense used by Newton–Thorne. Then r_{π_1,j}⊗r_{σ,j} is automorphic for every prime q and j:Q̄_q≅C. Match the automorphic realization’s good polynomial to the tensor-product polynomial using coefficient conjugation, then use semisimple uniqueness. This does not establish automorphy of an arbitrary tensor product; its initial automorphy and irreducibility are hypotheses.

Proof route:

1. Choose the RAESDC automorphic realization at the initial coefficient embedding and conjugate it so its good polynomials match those of the tensor product in C.
2. Use the λ-independent tensor operation on the supplier carrier.
3. At each (q,j) compare good polynomials and apply arbitrary-rank semisimple uniqueness.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`

Acceptance checks:

- The identity coefficient embedding recovers the given automorphic representation.
- No residual genericity is introduced by changing j.

Suggested Lean component (algebraic-fragment): Two supplied characteristic-zero semisimple tensor/automorphic members with every-element polynomial equality become conjugate over the algebraic closure.

Omitted conditions: Tensor and automorphic constructions, initial irreducibility and RAESDC automorphy, and the good-prime Chebotarev transport. No general tensor automorphy is asserted by this algebraic component.

Sources:

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proof of Lemma 5.8, pp.42–44, cf. proof of Lemma 2.1. The same coefficient-conjugation argument applies to an automorphic tensor product.

### GSp₄ crystalline Hodge comparison

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.gsp4CrystallineHodgeComparison`.

In Calegari–Geraghty Proposition 6.8, for a cuspidal GSp4 eigenform f of good p-level and weight (a,b), a≥b≥3, the AG2.2 transferred r_f is crystalline at p with HT={0,b−2,a−1,W}, W=a+b−3. If f is also an eigenform for the Hecke operators at p, det(X−φ)=λ_f(Q_p(X)) in their monic convention. The eigenform-at-p condition specifies this polynomial; crystallinity in the proposition’s good-level setting does not depend on that additional condition.

Proof route:

1. Apply the ML.4 transfer and AG2.2 GSp4-valued realization with its exact similitude.
2. Read the four graded weights from the regular algebraic coefficient system.
3. Apply crystalline comparison at good p-level and the specialized p-Hecke polynomial when its eigencharacter exists.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.2`
- `ModularityAndLanglandsExtensions:ML.4`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`

Acceptance checks:

- At (a,b)=(3,3) the weights are {0,1,2,3}.
- Singular limit-of-discrete-series weights are not asserted by this theorem.

Suggested Lean component (output-signature): CG’s four labelled weights and equality of supplied crystalline Frobenius/Hecke polynomials are typed in the range a≥b≥3.

Omitted conditions: Regular good-level GSp₄ eigenform, de Rham/crystalline period projections, and the additional p-Hecke-eigenform hypothesis for polynomial equality. These necessary hypotheses are omitted.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proposition 6.8(3), author-copy pp.38–39. Regular good-level GSp4 branch, with the corrected eigenform wording.

### Ordinary GSp₄ triangular shape

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.ordinaryGsp4CoefficientPrimeShape`.

Under CG Proposition 6.8(4), assume f is a p-Hecke eigenform and ordinary: its T_{p,1} and Q_{p,2} eigenvalues are units. The roots α,β,γ,δ of λ_f(Q_p(X)) have valuations 0,b−2,a−1,W and are distinct. r_f|G_Qp has the upper-triangular diagonal unram(α), ε^{−(b−2)}unram(p^{−(b−2)}β), ε^{−(a−1)}unram(p^{−(a−1)}γ), ε^{−W}unram(p^{−W}δ). The parameters of the unramified characters are units. Distinctness follows from the four different valuations, not from ordinarity in an unspecified singular weight.

Proof route:

1. Apply the two unit-eigenvalue hypotheses in CG’s ordinary criterion.
2. Determine root valuations in increasing order and normalize each by its p-power.
3. Use the ordinary crystalline filtration to obtain the stated triangular diagonal.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`
- `PadicHodgeTheory:R06.4/ordinary-representation`
- `PadicHodgeTheory:R06.4`
- `ModularityAndLanglandsExtensions:ML.4`

Acceptance checks:

- At a=b=3 the valuations 0,1,2,3 are all distinct.
- The formula imposes no splitting of the off-diagonal extensions.

Suggested Lean component (output-signature): One basis makes the supplied rank-four member upper triangular with all four supplied diagonal characters.

Omitted conditions: Regular ordinary good-level GSp₄ form, both unit Hecke operator conditions, saturated filtration and cyclotomic/unramified character construction. These necessary hypotheses are omitted; arbitrary r and characters do not have this shape.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proposition 6.8(4), author-copy p.39. Use roots of the specialized polynomial, correcting E55.

### Pilloni GSp₄ normalization comparison

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison`. Kind: comparison. Implementation: unchecked.

Pilloni Theorem 5.1.7.1 for cuspidal π with discrete-series π_∞ and parameter (λ_1,λ_2;−λ_1−λ_2+3) gives a de Rham representation with HT={0,−λ_2,−λ_1,−λ_1−λ_2}. At p outside the nonspherical set it is crystalline and det(1−Xφ)=Θ_π(Q_p(X)). Its geometric Frobenius and HT(ε)=−1 conventions require reciprocal conversion X^4Q_p(1/X) to the monic polynomial. The corrected similitude exponent is ε^{λ_1+λ_2}, as recorded in E27 of the paper extraction. Substitution λ_1=1−a, λ_2=2−b gives CG’s four Hodge numbers; identifying the automorphic representations also requires the ML.4 Harish–Chandra/Satake dictionary.

Proof route:

1. Read the discrete-series hypothesis and the author copy’s exact weight signs.
2. Reverse the degree-four polynomial, retaining the determinant convention.
3. Compare the Hodge recipes algebraically; use the requested transfer dictionary before asserting equality of representations.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.2`
- `ModularityAndLanglandsExtensions:ML.4`

Acceptance checks:

- λ=(−2,−1) gives {0,1,2,3}.
- The theorem is not an assertion for every singular-weight p-adic form.

Suggested Lean component (shared-component): The explicit CG/Pilloni substitution gives the same four Hodge entries; strict inequalities between ordinary valuation exponents are checked separately.

Omitted conditions: ML.4 Harish–Chandra/Satake identification and reciprocal det(1−Xφ) versus monic charpoly conversion; full Pilloni de Rham/crystalline theorem and corrected similitude.

Sources:

- [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Theorem 5.1.7.1(3)–(4), Remark 5.1.7.1, author-copy pp.22–23. Hodge weights and the reciprocal polynomial in its stated convention.

## AG2.7. Integral, residual and arithmetic exports

### Finite p-adic realization before lattices

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.existsFinitePadicRealization`.

For each continuous r_{π,ℓ,ι}:G_F→GL_n(Q̄_ℓ), there is a finite extension E/Q_ℓ over which its matrices are defined, after a change of basis if desired. Prove this before invoking a compact-local-field stable-lattice theorem. The compact image is covered by GL_n(E) for the countably many finite subextensions of Q̄_ℓ/Q_ℓ; Baire gives one such closed subgroup with open intersection, and finitely many coset representatives lie in a larger finite field. A uniform strong number field is available on the polarized branch, but is not needed for this local assertion.

Proof route:

1. Use the compactness of the continuous image of G_F and the countability of finite local extensions inside Q̄_ℓ.
2. Apply Baire to image∩GL_n(E), which is closed, obtaining an open subgroup.
3. Adjoin entries of finitely many coset representatives to E.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`
- `ArithmeticGaloisRepresentations:R01.1`

Acceptance checks:

- Do not apply local-field lattice compactness directly over Q̄_ℓ.
- The chosen E is finite over Q_ℓ, not a finite field of positive characteristic.

Suggested Lean component (algebraic-fragment): Finitely many supplied algebraic matrix entries lie in a finite intermediate extension.

Omitted conditions: Compact p-adic image, countability of finite local extensions, closed intersections, Baire interior/open subgroup and finite-coset reduction. The finite-entry step alone is not the finite p-adic realization theorem.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, after Theorem 2.1.1, p.34. Finite realization is the prerequisite for the residual construction.
- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Proposition 6.8, author-copy p.39. An explicit source for finite local realization; the proof sketch records the compact-image argument in arbitrary rank.

### Residual representation of π

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.residualRep`.

Choose a finite E/Q_ℓ realizing r_{π,λ}, an O_E-stable lattice L, and a basis of L. Define r̄_{π,λ} as the semisimplification of L/m_EL. Its isomorphism class over k̄_ℓ is independent of L, the basis and enlargement of E, for a fixed coefficient embedding λ. It descends to the finite field generated by the reductions of the common good polynomial coefficients. At good v away from ℓ it is unramified and has characteristic polynomial P_v reduced through λ. For F/F^+ CM in the totally odd polarized branch, the semisimple residual polarized representation admits the 𝒢_n-valued extension with multiplier ε̄^{1−n}r̄_χ supplied by the polarized representation API. An arbitrary lattice is not declared self-dual.

Proof route:

1. Use finite p-adic realization first; compactness then supplies an O_E-stable lattice.
2. Reduce the integral representation and semisimplify; use arbitrary-rank residual Brauer–Nesbitt for lattice independence.
3. Use finite-image Frobenius density to recover all characteristic-polynomial coefficients from good places; descend the semisimple member by finite-field Brauer-group vanishing. In positive characteristic use characteristic polynomials rather than traces alone.
4. Request preservation of polarization under reduction and semisimplification and the specified 𝒢_n-extension from ArithmeticGaloisRepresentations G7. The deformation-problem supplier assumes that extension as input. Do not claim every chosen lattice carries a perfect pairing.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`
- `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`
- `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`
- `ArithmeticGaloisRepresentations:G7`
- `mathlib:Matrix.GeneralLinearGroup.map`
- `mathlib:Representation.IsSemisimpleRepresentation`

Acceptance checks:

- Changing λ may change the residual representation; only auxiliary choices at fixed λ are removed.
- Nonsemisimple reductions can differ.

Planned API:

- `TauCeti.AutomorphicGalois.residualRep` (constructor): The continuous semisimple residual member over its finite field of realization.
- `TauCeti.AutomorphicGalois.residualRep_indep_lattice` (extensionality): Two lattice reductions have isomorphic semisimplifications over k̄_ℓ.
- `TauCeti.AutomorphicGalois.residualRep_coeffExtension` (functoriality): Enlargement of E gives scalar extension of the same semisimple residual representation.
- `TauCeti.AutomorphicGalois.residualRep_goodPolynomial` (compatibility): At good v away from ℓ the polynomial is the coefficient reduction of P_v.
- `TauCeti.AutomorphicGalois.residualRep_extendGn` (constructor): For F/F^+ CM, totally odd polarized residual members extend to 𝒢_n with the specified multiplier; the totally-real orthogonal/symplectic specialization is separate.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.residualRep_rank_one` (degenerate): For an integral character ψ, r̄ is its reduction and no semisimplification changes it. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.residualRep_diagonal_reduction` (computation): Reduction of diag(1,2) modulo 3 has polynomial (X−1)(X−2), the reduction of the characteristic-zero polynomial. **Prototype:** The reduced diagonal matrix over ZMod 3 has the required polynomial; full integral reduction is additionally tested by residualExport_diagonal_mod3.
- `TauCeti.AutomorphicGalois.residualRep_R19_dual` (compatibility): For the classical weight-k overlap at fixed λ, r̄_AG2≅r̄_R19^∨ under the same residue embedding. **Prototype:** Finite residue field and common integral every-element polynomials identify semisimplifications over the algebraic closure; construction of the R19 normalization is omitted.
- `TauCeti.AutomorphicGalois.residualRep_noncanonical_lattice` (non-example): For the Z_5-action r(t)=[[1,5t],[0,1]], lattices with bases (e1,e2) and (5e1,e2) give identity and nontrivial unipotent reductions; both semisimplify to 1⊕1. **Prototype:** At t=1 the identity and nontrivial unipotent matrices over ZMod 5 are unequal with equal charpoly; the actual Z₅-action and lattice bases are omitted.

Consumers:

- `ACC+, Definition 2.3.6`: Certifies the residual Galois type of m_π.
- `PotentialAutomorphyInfrastructure:PA.0`: Supplies residual automorphic input, without adding irreducibility or enormous-image hypotheses.

Suggested Lean component (algebraic-fragment): Construct a semisimple homomorphism from an actual integral model and residue map, with every-element reduced characteristic polynomial. Lattice independence assumes equal integral polynomials and finite residue field. The G_n API currently transports only the matrix pairing equation.

Omitted conditions: Finite local field and stable-lattice construction, continuous global Galois action, lattice spanning/comparison; G_n carrier, CM conjugation extension, multiplier and total oddness. The unequal unipotent reductions are typed at t=1; the full Z₅ lattices are omitted.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p.34. The invariant is the semisimple reduction, with its polarized extension.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, p.1085. Finite-field descent of residual members.

### Reduction of good Frobenius polynomials

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`. Kind: lemma. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.goodPolynomialReduction`.

For a stable lattice realization A_v∈GL_n(O_E) of a good geometric Frobenius, Matrix.charpoly(A_v) has integral coefficients and maps under O_E→k_E to Matrix.charpoly(Ā_v); semisimplification leaves it unchanged. Thus the reduced polynomial is the reduction of ι⁻¹P_v. The constant term is a unit because A_v is invertible. This is ordinary characteristic-polynomial coefficient change, not a new determinant-law construction.

Proof route:

1. Write Frobenius in an integral lattice basis.
2. Apply the pinned Matrix.charpoly_map lemma to residue reduction.
3. Apply the supplier’s semisimplification invariance to the reduced representation.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `mathlib:Matrix.charpoly_map`
- `mathlib:Matrix.GeneralLinearGroup.map`

Acceptance checks:

- For diag(1,2) modulo 3, X²−3X+2 becomes X²+2.
- Conjugating the lattice basis leaves the polynomial unchanged.

Suggested Lean component (shared-component): Matrix.charpoly_map and the residual polynomial API give the actual coefficient-reduction square.

Omitted conditions: Geometric good-place/integrality provenance and stable-lattice carrier; these are external to the matrix identity.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. Residual Hecke polynomials are reduced characteristic polynomials.

### Maximal Hecke ideal of Galois type

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsGaloisType`.

For the unramified integral Hecke algebra T^S over O, a maximal ideal m with finite residue field k_m is of Galois type if there exists a continuous semisimple r_m:G_{F,S}→GL_n(k_m) such that at every v outside S its good geometric Frobenius polynomial is Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i} modulo m (T_{v,0}=1). Include the coefficient prime in S for this unramified quotient statement. r_m is considered up to isomorphism; the condition does not itself require absolute irreducibility.

Proof route:

1. Use the supplier’s T^S and the residual Frobenius convention fixed by AG2.0.
2. Quantify a continuous semisimple realization of the reduced Hecke polynomials.
3. Use residual Chebotarev/Brauer–Nesbitt for uniqueness up to isomorphism.

Direct inputs:

- `IntegralHeckeAndGaloisDeterminants:IHG.3`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`
- `ArithmeticGaloisRepresentations:R01.5`
- `mathlib:Representation.IsSemisimpleRepresentation`

Acceptance checks:

- At n=1 the polynomial is X−T_{v,1}, using AG2.6/E3’s correction.
- A reducible semisimple representation can certify Galois type.

Planned API:

- `TauCeti.AutomorphicGalois.IsGaloisType` (characterisation): Existence of the stated semisimple realization over k_m.
- `TauCeti.AutomorphicGalois.galoisType_rep` (data): A chosen r_m together with the polynomial matching theorem.
- `TauCeti.AutomorphicGalois.galoisType_rep_unique` (extensionality): Any two semisimple realizations are isomorphic after a common residue-field extension.
- `TauCeti.AutomorphicGalois.galoisType_coeffExtension` (compatibility): The polynomial comparison commutes with the existing GL coefficient map.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.galoisType_rank_one_polynomial` (computation): For n=1 the constant term is −T_{v,1}. **Prototype:** The signed n=1 constant coefficient is computed explicitly; construction of a Hecke eigencharacter is omitted.
- `TauCeti.AutomorphicGalois.galoisType_reducible` (degenerate): A Hecke eigencharacter with r_m=1⊕1 can be of Galois type. **Prototype:** The actual existential IsGaloisType predicate is inhabited by the rank-two trivial semisimple homomorphism with polynomial (X−1)².
- `TauCeti.AutomorphicGalois.galoisType_charpoly_map` (compatibility): Residue extension maps the matched polynomial exactly by Matrix.charpoly_map. **Prototype:** The genuine Matrix.charpoly_map theorem checks arbitrary coefficient reduction; the Hecke quotient realization is omitted.
- `TauCeti.AutomorphicGalois.galoisType_not_nonEisenstein` (non-example): The reducible example cannot certify non-Eisensteinness. **Prototype:** Taking the supplied Frobenius map to include every group element rules out a different absolutely irreducible witness with trivial characteristic polynomials.

Consumers:

- `ACC+, §2.3 and Chapter 4`: Chooses the residual representation attached to localization at m.
- `IgusaVarietiesAndTorsionConcentration:IG.5`: Provides the residual representation on which genericity is imposed.

Suggested Lean component (algebraic-fragment): Galois type is existence of a Mathlib-semisimple homomorphism matching every supplied normalized polynomial. A chosen witness retains its matching evidence. Uniqueness assumes finite k and polynomial equality for every group element.

Omitted conditions: Integral unramified Hecke algebra, maximal ideal/residue quotient, finite field and continuity in the predicate, actual G_{F,S}, good Frobenius set and Chebotarev density.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, printed p.938. Existence with all good Hecke polynomials, separated from non-Eisensteinness.

### Non-Eisenstein maximal ideal

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsNonEisenstein`.

A maximal ideal m of T^S is non-Eisenstein if it is of Galois type and its semisimple realization r_m is absolutely irreducible. The condition is independent of the chosen realization by semisimple uniqueness. It is a global condition, separate from local ACC+ genericity and from enormousness of the image after restriction to G_{F(ζ_ℓ)}.

Proof route:

1. Conjoin Galois type with absolute irreducibility of its realization.
2. Use uniqueness and invariance under residue-field extension to make the condition intrinsic to m.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`
- `mathlib:Representation.IsSemisimpleRepresentation`
- `mathlib:Representation.IsIrreducible`

Acceptance checks:

- A rank-one Galois-type ideal is non-Eisenstein.
- Local ratio genericity does not imply this condition.

Planned API:

- `TauCeti.AutomorphicGalois.IsNonEisenstein` (characterisation): Galois type plus absolute irreducibility.
- `TauCeti.AutomorphicGalois.nonEisenstein_galoisType` (projection): Forget absolute irreducibility.
- `TauCeti.AutomorphicGalois.nonEisenstein_coeffExtension` (compatibility): Absolute irreducibility persists under any residue-field extension and is detected over k̄.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.nonEisenstein_rank_one` (degenerate): Every rank-one Galois-type realization is absolutely irreducible. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.nonEisenstein_not_trivial_rank_two` (non-example): The rank-two trivial representation cannot make its ideal non-Eisenstein. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.nonEisenstein_absolute_not_relative` (characterisation): An irreducible k_m-representation that splits over k̄_m does not satisfy the definition. **Prototype:** An actual order-four real rotation representation is irreducible over R and reducible over AlgebraicClosure R; it tests absolute versus relative irreducibility without a finite-residue-field realization.

Consumers:

- `ACC+, Theorem 2.3.5 and Chapter 4`: Separates irreducible localized Galois data from reducible Galois-type data.

Suggested Lean component (algebraic-fragment): Non-Eisensteinness adds Mathlib irreducibility after coefficient extension to AlgebraicClosure to the same Galois-type witness. Tests separate reducible, rank-one and relatively-but-not-absolutely irreducible cases.

Omitted conditions: Maximal Hecke ideal, finite residue field/continuous Galois topology and Chebotarev recognition of its witness.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938. Absolute irreducibility is an additional global condition.

### Independence of the residual Hecke ideal

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.residualHeckeIdealIndependence`.

Fix π, λ and an integral eigencharacter θ_π:T^S→O_E at that coefficient place. Then m_{π,λ}=ker(T^S→O_E→k_E) is of Galois type with realization r̄_{π,λ}. Its kernel is independent of stable lattice, basis and finite extension of E inducing the same λ: the eigencharacter is defined by the same integral Hecke eigenvalues and the residue-field extension is injective. It is non-Eisenstein exactly when r̄_{π,λ} is absolutely irreducible. Independence across distinct λ is not asserted.

Proof route:

1. Match the reduced θ_π(P_v) with the residual Frobenius polynomial.
2. Use semisimple lattice independence for the representation.
3. An injective residue-field extension leaves the kernel of θ̄_π unchanged.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`
- `IntegralHeckeAndGaloisDeterminants:IHG.3`

Acceptance checks:

- Changing a lattice cannot change m_{π,λ}.
- Different coefficient primes can yield different maximal ideals.

Suggested Lean component (algebraic-fragment): The kernel of an actual ring eigencharacter is invariant under an injective residue-field extension.

Omitted conditions: Surjectivity/finite residue field needed for maximality, normalized Hecke-algebra identification and integral stable-lattice/embedding comparison.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. The reduced automorphic eigencharacter has the matching residual representation.

### Dual and character-twist Hecke comparison

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.dualAndTwistHeckeComparison`.

For a Galois-type maximal ideal m of rank n, the contragredient Hecke ideal m^∨ is of Galois type with r_{m^∨}≅r_m^∨⊗ε̄^{1−n}. At good geometric Frobenius its eigenvalues are q_v^{n−1}/α_i. An integral unramified-at-v character ψ multiplies the eigenvalues by ψ(Frob_v), and its Hecke twist realizes r_m⊗ψ̄. In the rank-2n unitary Hecke algebra the reciprocal factor is q_v^{2n−1}. Residual nonratio conditions are transported only with their unramifiedness hypotheses.

Proof route:

1. Apply the contragredient Hecke involution to the polynomial coefficients.
2. Compute eigenvalues of dual times the geometric cyclotomic twist.
3. Match all good polynomials and use semisimple uniqueness.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`
- `IntegralHeckeAndGaloisDeterminants:IHG.3`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`

Acceptance checks:

- At n=2, α_i become q/α_i.
- A ramified scalar twist can violate local unramifiedness.

Suggested Lean component (algebraic-fragment): The reciprocal q^(n−1)/α eigenvalue formula preserves the ordered noncyclotomic ratio predicate.

Omitted conditions: Actual dual/twist Hecke algebra involution, reciprocal degree-n polynomial identity and cyclotomic character; local unramifiedness is handled separately in genericityTransfer.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 2.3.6, p.938. Exact dual ε^(1−n) and character-twist conventions.

### Local residual genericity

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsGeneric`.

Let L/Q_p be any finite extension with residue cardinality q, ℓ≠p, k a finite field of characteristic ℓ, and r:G_L→GL_n(k) continuous. It is ACC+-generic at L if inertia acts trivially and, over k̄, the eigenvalues α_i∈k̄× of r(Frob_L^geom), listed with multiplicity, satisfy α_i/α_j≠q for every i≠j. Arithmetic instead of geometric Frobenius gives the same predicate because inversion reverses the ordered pair. Repeated eigenvalues are permitted when q≠1 in k; pairwise distinctness alone is insufficient. The local condition has no global irreducibility, adequacy or enormousness clause.

Proof route:

1. Use actual residual local inertia and a Frobenius lift; unramifiedness makes the matrix independent of the lift.
2. Split the characteristic polynomial in k̄ and test all ordered pairs of eigenvalues, retaining multiplicity.
3. Keep the eigenvalue predicate separate from its local representation predicate.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `ArithmeticGaloisRepresentations:R01.1`
- `mathlib:Matrix.charpoly`
- `mathlib:Matrix.GeneralLinearGroup.map`

Acceptance checks:

- For n=1 the ratio condition is vacuous but unramifiedness remains required.
- A ramified scalar representation has generic eigenvalue ratios without being locally generic.

Planned API:

- `TauCeti.AutomorphicGalois.IsGenericEigenvalues` (characterisation): For a list α:Fin n→k×, require α_i/α_j≠q for i≠j; list multiplicities are retained.
- `TauCeti.AutomorphicGalois.IsGeneric` (characterisation): Trivial inertia together with the eigenvalue predicate over k̄.
- `TauCeti.AutomorphicGalois.isGeneric_unramified` (projection): A locally generic representation kills inertia.
- `TauCeti.AutomorphicGalois.isGeneric_frobenius_independent` (extensionality): For trivial inertia, changing the Frobenius lift preserves the matrix and predicate.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_smul` (functoriality): Multiplication of every α_i by the same nonzero scalar preserves the eigenvalue predicate.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_reindex` (compatibility): Reordering the list by a permutation leaves the predicate unchanged.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_inverse` (compatibility): Inverting every eigenvalue preserves the predicate by exchanging ordered pairs.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue` (computation): Over F_3 with q=2, the list (1,1) is generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q` (non-example): Over F_5 with q=2, the distinct list (2,1) is not generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.isGeneric_rank_one` (degenerate): Every one-term nonzero list is generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one` (non-example): Over F_3 with q=1, (1,1) is not generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.isGeneric_matrix_diagonal` (compatibility): The list condition on α agrees with the characteristic-polynomial factorization of the diagonal matrix diag(α). **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.

Consumers:

- `ACC+, §4.3; §6 Taylor–Wiles construction`: Provides the local noncyclotomic ratio input without implying the other global hypotheses.
- `IgusaVarietiesAndTorsionConcentration:IG.5`: This is the condition exported by AG2.7 to the Hecke localization consumer.

Suggested Lean component (algebraic-fragment): Actual inertia, group homomorphism, Frobenius element and algebraic-closure charpoly factorization define local genericity with all ordered ratios and multiplicities. Frobenius-lift, scalar, inverse and reindex APIs are typed.

Omitted conditions: Identification with a genuine local Galois group/inertia and residue cardinality; finite coefficient field, ell≠p and topology. These local numerical parameters are supplied externally.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(1), p.972. Unramifiedness and the ordered noncyclotomic ratio condition.

### Completely split generic prime

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsDecomposedGenericPrime`.

For a continuous residual r:G_F→GL_n(k), a rational prime p is a decomposed-generic prime if p≠ℓ, p is completely split in F, and r is unramified and ACC+-generic at every v|p. Complete splitting means e_v=f_v=1 at every v, so q_v=p. This is a property of the pair (r,p), distinct from local genericity at one arbitrary place and from existence of such a p.

Proof route:

1. Conjoin coefficient-prime avoidance, complete splitting and the local predicate at every place.
2. Use complete splitting to rewrite each q_v as p in the residue field.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`
- `ArithmeticGaloisRepresentations:R01.1`

Acceptance checks:

- One generic place in a non-split fiber does not suffice.
- A generic prime is away from the coefficient characteristic.

Planned API:

- `TauCeti.AutomorphicGalois.IsDecomposedGenericPrime` (characterisation): The complete-splitting and all-v condition.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_local` (projection): For every v|p, obtain unramifiedness and the local predicate with q=p.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_coeffExtension` (functoriality): Any extension of the finite coefficient field preserves and reflects the condition.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.decomposedGenericPrime_Q` (computation): For F=Q there is exactly one place over p; the splitting clause is automatic. **Prototype:** The whole externally supplied Q-place fiber is PUnit with e=f=1; the actual number-field place identification is omitted.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_not_inert` (non-example): An inert prime in a quadratic F is not decomposed generic even when the local ratio condition holds. **Prototype:** A supplied nonempty fiber with residue degree 2 fails complete splitting; no quadratic number field is constructed.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_not_ell` (degenerate): p=ℓ is excluded independently of eigenvalues. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.

Consumers:

- `ACC+, Lemma 4.3.2`: Provides the witness whose Frobenius class is reproduced by Chebotarev.

Suggested Lean component (algebraic-fragment): A rational prime p different from the characteristic ell, e=f=1 and genericity at EVERY member of an externally supplied nonempty full place fiber define the prime predicate. Coefficient extension retains CharP at ell.

Omitted conditions: Identification of the supplied entire fiber, e/f, inertia and Frobenius with number-field places; finite residual field, continuity and number-field splitting equivalence. No singleton fiber replaces an arbitrary number-field fiber.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(2), p.972. All places over a completely split rational prime.

### Decomposed generic residual representation

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsDecomposedGeneric`.

A continuous residual representation r:G_F→GL_n(k) is decomposed generic if there exists a rational prime p which is decomposed generic for r. This existential condition is the ACC+ hypothesis used by the torsion-concentration and potential-automorphy consumers. It does not mean every split prime is generic, nor is it equivalent to global absolute irreducibility or enormousness.

Proof route:

1. Quantify the auxiliary rational prime in the preceding predicate.
2. Keep its witness available for the infinite-prime theorem.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`

Acceptance checks:

- A single witness is sufficient.
- For n≥2 the trivial representation may be decomposed generic when suitable p≠1 mod ℓ split in F.

Planned API:

- `TauCeti.AutomorphicGalois.IsDecomposedGeneric` (characterisation): There exists p satisfying IsDecomposedGenericPrime(r,p).
- `TauCeti.AutomorphicGalois.decomposedGeneric_witness` (data): Extract the prime witness and all-v local conditions.
- `TauCeti.AutomorphicGalois.decomposedGeneric_coeffExtension` (compatibility): The existential condition is preserved and reflected by finite residue-field extension.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.decomposedGeneric_trivial_F3` (computation): For F=Q, k=F_3, r=1⊕1, the prime p=2 is a witness. **Prototype:** The actual existential predicate on the one-place fiber and trivial rank-two homomorphism over ZMod 3 has p=2 as a witness.
- `TauCeti.AutomorphicGalois.decomposedGeneric_not_irreducible` (non-example): The preceding decomposed-generic representation is reducible. **Prototype:** The preceding actual existential witness coexists with failure of Mathlib absolute irreducibility.
- `TauCeti.AutomorphicGalois.decomposedGeneric_not_every_prime` (characterisation): For the same r, p=7 has q=1 mod 3 and is not a witness, although p=2 is. **Prototype:** The actual prime predicate fails at p=7 for the same one-place/trivial ZMod 3 representation.

Consumers:

- `ACC+, Lemma 7.1.9`: Supplies the density-one DGI hypothesis, separately from absolute irreducibility.
- `PotentialAutomorphyInfrastructure:PA.1`: Genericity hypothesis for the Fontaine–Laffaille comparison.

Suggested Lean component (algebraic-fragment): Existence quantifies exactly the preceding complete-splitting/all-place prime predicate. Actual F₃ examples distinguish existential genericity, irreducibility and a failed p=7 witness.

Omitted conditions: Number-field provenance/topology of the external place fiber; Chebotarev prime production is separate.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(3), p.972. Existence of an auxiliary rational prime.

### Strong local decomposed genericity

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsStrongGeneric`.

For any finite extension L/Q_p, ℓ≠p, define the Caraiani–Scholze Definition 1.9 specialization: r is unramified and α_i/α_j∉{1,q} for all i≠j over k̄. Equivalently its eigenvalues are pairwise distinct and ACC+-generic. The local field need not be Q_p. This stronger predicate has its own name and implies the ACC+ local predicate. Liu Appendix D’s displayed distinctness is unnecessary for its later noncompact concentration input, as its footnote 37 explicitly records; the stronger definition is not silently substituted for ACC+.

Proof route:

1. Add injectivity of the eigenvalue list to the ACC+ ratio predicate, equivalently excluding ratio 1.
2. Prove invariance under scalar, permutation, dual and coefficient extension with the same unramifiedness clauses.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`

Acceptance checks:

- A repeated list can be ACC+-generic and fail this predicate.
- Rank one still requires unramifiedness.

Planned API:

- `TauCeti.AutomorphicGalois.IsStrongGenericEigenvalues` (characterisation): IsGenericEigenvalues(α,q) and α injective, equivalently ratios avoid {1,q}.
- `TauCeti.AutomorphicGalois.IsStrongGeneric` (characterisation): Trivial inertia plus the stronger eigenvalue predicate over k̄.
- `TauCeti.AutomorphicGalois.strongGeneric_generic` (projection): Forget the ratio-1 exclusion.
- `TauCeti.AutomorphicGalois.strongGeneric_distinct` (projection): The Frobenius eigenvalues have no repeated roots.
- `TauCeti.AutomorphicGalois.strongGeneric_arbitrary_local_field` (compatibility): The definition uses q=|k_L| and specializes to Definition 1.9 for every finite L/Q_p.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.strongGeneric_not_repeated` (non-example): Over F_3, q=2, (1,1) is ACC+-generic but not strong-generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio` (computation): Over F_7, q=2, (1,3) is strong-generic: the two ordered ratios are 3 and 5. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongGeneric_rank_one` (degenerate): Every single nonzero eigenvalue is strong-generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongGeneric_non_Qp` (compatibility): For an unramified quadratic L/Q_2 and ℓ=3, use q=4≡1; the ratio-1 clause remains explicit. **Prototype:** The example checks q=4=1 in ZMod 3 and failure of the strong repeated-root predicate; construction of the unramified quadratic local field is omitted.

Consumers:

- `Caraiani–Scholze, Definition 1.9 and §6`: The residual stronger condition controls generic principal-series lifts.
- `Liu et al., Appendix D`: States the distinction between the displayed strong condition and the relaxed concentration input.

Suggested Lean component (algebraic-fragment): Strong local genericity adds injectivity of the eigenvalue list. The arbitrary-local-field component uses q=p^f, and the q=4 mod 3 repeated-root failure is typed.

Omitted conditions: Construction of a finite local extension and proof of its residue cardinality, genuine inertia/Frobenius and continuity.

Sources:

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition 1.9, printed p.652. The stronger condition over an arbitrary p-adic field.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition D.1.2, footnote 37, printed p.365. The paper explains the relaxed noncompact input.

### Infinitely many decomposed generic primes

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.infinitelyManyDecomposedGenericPrimes`.

If r:G_F→GL_n(k) is continuous and decomposed generic, there are infinitely many such rational primes, and witnesses can avoid any specified finite set. Let K be a normal closure of F, the field cut out by r and Q(ζ_ℓ). A witness determines a conjugacy class in Gal(K/Q) whose restriction fixes F, fixes the all-place eigenvalue ratios and fixes p mod ℓ. Chebotarev gives a positive Dirichlet-density set of primes with this class. Every such unramified prime is again a witness.

Proof route:

1. Encode r, complete splitting and the cyclotomic residue value in one finite normal extension.
2. Use the witness’s Frobenius conjugacy class and all its conjugates to retain conditions at every v.
3. Apply Chebotarev and discard the chosen finite exceptional set.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`
- `ArithmeticGaloisRepresentations:R01.5`

Acceptance checks:

- For r=1⊕1 over F_3 and F=Q, all p≡2 mod 3 away from 3 are witnesses.
- Keeping only the field cut out by r loses the q=p mod ℓ information.

Suggested Lean component (algebraic-fragment): An infinite supplier witness set contained in the decomposed-generic primes gives infinitude and avoidance of every finite exceptional set.

Omitted conditions: Finite Galois/splitting/cyclotomic extension and Chebotarev positive-density argument. Infinitude is a supplied hypothesis, not a result for arbitrary place parameters.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 4.3.2, pp.972–973. Chebotarev reproduces the witness at all conjugate places.

### Genericity transfer and projective qualification

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.genericityTransfer`.

The eigenvalue nonratio predicate is invariant under permutation, nonzero scalar multiplication, inversion and coefficient-field extension. Local representation genericity is invariant under conjugacy, semisimplification of an already unramified representation, and unramified scalar twists. An arbitrary ramified scalar twist preserves the projective representation but can destroy local unramifiedness. The global existential decomposed-generic condition is invariant under finite residual-character twists: use infinitely many witnesses and avoid the finite ramification set of the character. Strong local genericity obeys the same rules with distinctness retained.

Proof route:

1. Cancel a common nonzero scalar in ratios and exchange ordered pairs for inversion.
2. Use conjugacy and coefficient-change invariance of characteristic polynomials.
3. For the global twist choose a witness away from the character’s finite ramification set.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`
- `mathlib:Matrix.charpoly_units_conj`
- `mathlib:Matrix.charpoly_map`

Acceptance checks:

- A ramified quadratic scalar twist of 1⊕1 at L=Q_2, k=F_3, has the same projective representation but is not locally generic.
- For the globally trivial F_3 representation, an arbitrary finite character twist retains some good witness.

Suggested Lean component (algebraic-fragment): Scalar-twist invariance of local genericity requires an actual character trivial on inertia, alongside the pointwise matrix twist equation.

Omitted conditions: Global projective transfer, semisimplified tensor/base-change hypotheses and the global Chebotarev argument avoiding the character’s finite ramification set.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 4.3.1, p.972; Lemma 4.3.2. Qualify the local assertion by unramifiedness; see AG2.6/E5.

### Residual genericity outside finitely many λ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.residualGenericityOutsideFiniteSet`.

For a relevant Π with a strong coefficient field E in Liu et al., choose the regular unramified place used in Chenevier–Harris’s argument, with distinct algebraic Satake roots α_i and α_i≠qα_j. After a finite extension of E containing these roots, exclude the finitely many coefficient places dividing denominators, roots, α_i−α_j or α_i−qα_j. Their reductions are distinct and nonratio. Liu Appendix D, Corollary D.1.4 then uses Chebotarev to obtain a place w split in F/F⁺ that is locally generic for the reduced Hecke eigencharacter outside this finite set. The cohomological concentration conclusion has its own F^+≠Q and level hypotheses and belongs to the Igusa/torsion consumer. This conclusion does not itself provide the completely split rational prime, generic at every v above it, required by the ACC+ global predicate; that stronger witness needs its separate Chebotarev hypotheses.

Proof route:

1. Use the relevant polarized regular representation and a regular unramified Frobenius from CH.
2. Local genericity of the characteristic-zero π excludes the q-ratios.
3. Exclude finitely many algebraic bad factors and use the Appendix D split-place Chebotarev argument.
4. Pass the resulting generic Hecke ideal to the consumer rather than importing concentration back into AG2.6.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`
- `ArithmeticGaloisRepresentations:R01.5`

Acceptance checks:

- A nonzero algebraic difference can vanish at finitely many λ; these λ must be excluded.
- No absolute residual irreducibility or enormousness follows from this local condition.

Suggested Lean component (algebraic-fragment): If reduction preserves nonzero root differences and nonratio differences, the actual reduced unit roots are strongly generic.

Omitted conditions: Number-field roots, finiteness of bad coefficient places, Liu’s split-local-place Chebotarev step and its concentration hypotheses. No completely split all-place rational-prime conclusion is encoded.

Sources:

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Corollary D.1.4, printed p.368; Remark 3.2.6. Exclude divisors of finitely many nonzero algebraic quantities, then use Chebotarev.

### Good-prime characteristic-zero export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.GoodPrimeExport`.

GoodPrimeExport(π) consists of the imported R_π carrier, its finite coefficient field and common S_π/P_v data, the chosen λ-member interfaces, and the proved good-Frobenius comparison maps. It forgets branch-specific admissibility/purity and contains no assertion of a full bad-place WD parameter. It is an interface wrapping the supplier carrier, not a new compatible-system definition.

Proof route:

1. Package the carrier and its good polynomial comparison.
2. Give the forgetful map from stronger branch exports and a coefficient-change map inherited from the supplier.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`

Acceptance checks:

- The export can be consumed with no polarization hypothesis.
- Forgetting branch evidence preserves M,S,P_v and every λ-member.

Planned API:

- `TauCeti.AutomorphicGalois.GoodPrimeExport` (constructor): Wrap R_π with its good comparison maps.
- `TauCeti.AutomorphicGalois.goodPrimeExport_member` (projection): Retrieve the λ-member and good Frobenius theorem.
- `TauCeti.AutomorphicGalois.goodPrimeExport_coeffChange` (functoriality): Use supplier coefficient change, with identity and composition laws.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.goodPrimeExport_character` (degenerate): At n=1 it is the algebraic-character good-prime package. **Prototype:** An actual GoodPrimeExport wrapper is inhabited for the trivial rank-one character with polynomial X−1; its class-field provenance is omitted.
- `TauCeti.AutomorphicGalois.goodPrimeExport_polynomial` (computation): For a weight-k classical overlap its polynomial is X²−a_qX+ψ(q)q^{k−1}. **Prototype:** An actual rank-two wrapper exposes the quadratic polynomial; the modular-form nebentype/cyclotomic construction is omitted.
- `TauCeti.AutomorphicGalois.goodPrimeExport_not_fullWD` (non-example): The package cannot supply N at a ramified place without branch evidence. **Prototype:** Explicit F=diag(1,2) with N=0 or E₁₂ satisfies the WD Frobenius relation, while no invertible N-intertwiner exists.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.0`: The characteristic-zero fixed automorphic input.
- `IntegralHeckeAndGaloisDeterminants:IHG.1`: Provides dense classical comparisons for interpolation, whose nonreduced determinant construction is owned by IHG.

Suggested Lean component (algebraic-fragment): GoodPrimeExport is evidence for all supplied member Frobenius polynomials on the external System. Supplier coefficient change with its projection law maps those polynomials.

Omitted conditions: R24 raw carrier implementation, finite ramification set, good-place identification, continuity, automorphic attachment and coefficient-place/completion dictionary. Identity/composition of System coefficient change require the omitted owner laws.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. The minimum automorphic compatible-data export.

### Nonselfdual Hodge and monodromy-bound export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.NonselfdualComparisonExport`.

NonselfdualComparisonExport(π) for an arbitrary regular algebraic cuspidal π over CM F wraps GoodPrimeExport with the AHTW de Rham comparison, full labelled Hodge multiset, ss WD comparison and F-ss monodromy upper bound at every v|ℓ. It also exposes spherical crystallinity and Iwahori semistability with the stated local hypotheses. It does not contain a polarization, purity theorem or full ramified N equality. The output is the strongest nonselfdual coefficient-prime interface supplied by AHTW v1, rather than the good-prime interface alone.

Proof route:

1. Package the proved de Rham/Hodge maps and the separate ss/bound statements at each coefficient-prime place.
2. Expose the spherical and Iwahori corollaries as hypothesis-indexed local projections.
3. Forget to the good-prime carrier without changing its members.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`

Acceptance checks:

- An unrestricted regular CM cuspidal input receives the full labelled Hodge output.
- A general ramified member is exported with an N bound, not full equality.

Planned API:

- `TauCeti.AutomorphicGalois.NonselfdualComparisonExport` (constructor): Combine the AHTW coefficient-prime maps with the common carrier.
- `TauCeti.AutomorphicGalois.nonselfdualExport_goodPrime` (projection): Forget to GoodPrimeExport with the same members.
- `TauCeti.AutomorphicGalois.nonselfdualExport_hodge` (data): Retrieve de Rham comparison and the labelled multiset at every v|ℓ.
- `TauCeti.AutomorphicGalois.nonselfdualExport_wdBound` (data): Retrieve ss comparison and the F-ss monodromy upper bound, retaining their distinct strengths.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.nonselfdualExport_rank_one` (degenerate): For an algebraic character the Hodge multiset has one element and N=0. **Prototype:** An actual NonselfdualComparisonExport wrapper is inhabited for the trivial rank-one member, singleton Hodge weights and size-one Weil block. A separate nilpotent rank-one example gives N=0; period/class-field construction is omitted.
- `TauCeti.AutomorphicGalois.nonselfdualExport_good_crystalline` (compatibility): At a spherical coefficient-prime place the upper bound N=0 and trivial inertia recover the crystalline supplier criterion. **Prototype:** The zero-rank upper bound forces the monodromy matrix to be zero; actual period/inertia criteria for crystallinity are omitted.
- `TauCeti.AutomorphicGalois.nonselfdualExport_not_polarized_fullWD` (non-example): The export supplies neither a polarized pairing nor full ramified WD equality from an ss comparison alone. **Prototype:** Concrete strict dominance [1,1]≺[2] has unequal block lists. No polarized pairing is inferred.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.1`: Supplies unrestricted de Rham and Hodge data before additional Fontaine–Laffaille/ordinary assumptions.
- `TorsionCohomologyInfrastructure`: Keeps the unconditional characteristic-zero Hodge comparison distinct from residual concentration hypotheses.

Suggested Lean component (algebraic-fragment): The actual wrapper retains good polynomials, all supplied Hodge multisets, a separate conjugacy of semisimplified Weil actions and per-type block partial-sum bounds. A rank-one wrapper is inhabited in its labelled example.

Omitted conditions: Actual de Rham periods, WD semisimplification and normalized descending block extraction; underlying geometry/automorphy and R24 carrier. The wrapper does not supply a full N map or polarized pairing.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. The nonselfdual export includes the known Hodge and coefficient-prime properties.

### Polarized Hodge and Weil–Deligne export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.PolarizedComparisonExport`.

PolarizedComparisonExport(π,χ) wraps GoodPrimeExport with the actual polarization isomorphisms and multiplier, the corrected total-odd sign, the labelled Hodge comparison maps, and full F-ss WD comparison at all finite places, including coefficient-prime places. It supplies the proved pure/strict branch predicates. Forgetful maps return the good-prime package, the supplier’s polarized system and each local comparison; they do not insert residual enormousness or an ordinary refinement.

Proof route:

1. Assemble separately established comparison and polarization maps.
2. Supply forgetful maps and their agreement on the underlying members.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure`

Acceptance checks:

- The χ multiplier and W=w+n−1 are retained.
- An arbitrary nonselfdual good-prime package cannot be promoted to this type.

Planned API:

- `TauCeti.AutomorphicGalois.PolarizedComparisonExport` (constructor): Combine the established polarized branch comparisons.
- `TauCeti.AutomorphicGalois.polarizedExport_goodPrime` (projection): Forget to GoodPrimeExport, preserving all good polynomials.
- `TauCeti.AutomorphicGalois.polarizedExport_local` (data): Retrieve labelled Hodge and full WD comparison maps at a chosen finite place.
- `TauCeti.AutomorphicGalois.polarizedExport_supplier` (compatibility): Return precisely the R24.5 pure/polarized predicates with normalization conversion.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.polarizedExport_weight_k` (computation): For a weight-k base-change form it returns H={0,k−1}, W=k−1 and determinant ε^{1−k}r_ψ. **Prototype:** An actual PolarizedComparisonExport wrapper returns the full {k−1,0} multiset and determinant Hodge sum. The W=k−1 and multiplier/determinant character specialization are omitted.
- `TauCeti.AutomorphicGalois.polarizedExport_forget` (compatibility): The forgotten good package has exactly the same λ-members and P_v. **Prototype:** Forgetting an actual polarized wrapper retains the identical external System member and good Frobenius polynomial.
- `TauCeti.AutomorphicGalois.polarizedExport_nonselfdual_rejected` (non-example): AHTW ss comparison plus an N bound does not fulfill a full-WD comparison field. **Prototype:** No invertible matrix intertwines zero N with nonzero E₁₂; thus an ss/bound-only comparison cannot fill the full-map requirement.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.1–PA.5`:  supplies the Hodge/polarization input before their additional local and residual hypotheses.
- `Liu et al., §3.2`: Supplies the polarized relevant members and local comparison maps.

Suggested Lean component (algebraic-fragment): The actual wrapper retains good polynomials/Hodge multisets, an invertible pairing with its matrix equation, one local u intertwining Weil and N, and good-prime root purity. Weight-k and forgetful tests use this wrapper.

Omitted conditions: Period/WD construction, cohomological/automorphic provenance, graded strict purity, total oddness and R24 full pure/polarized predicates. The supplier API currently projects pairing and good purity only; the weight-k test omits multiplier/determinant and W verification.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; §5.1, pp.63–65. The polarized system evidence.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2. Full coefficient-prime WD evidence.

### Unitary discrete-parameter export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.UnitaryDiscreteExport`.

In the compact unitary setting of CS Corollary 5.5.5, export the semisimple representation r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i attached to an endoscopic discrete parameter of ranks n_1+n_2=n, with each ε_i the algebraic character of |det|^{(n_i−n)/2}$(N_{F/𝒦}det)^{ε(n−n_i)}, and ε(m)≡m mod 2. The polynomial at every v over q∈Spl_{𝒦/Q} outside S∪{ℓ} is the explicit degree-n Hecke polynomial. Keep the constituent labels, algebraic twist maps, and the away-ℓ local comparison from Remark 5.5.6. This package need not be globally irreducible and carries no coefficient-prime comparison beyond what its constituents separately prove. Here F=F⁺·𝒦 with 𝒦 the imaginary quadratic field of CS §5.1; the printed F₀ in Corollary 5.5.5 is the already confirmed E11 misprint, not another splitting field.

Additional input conditions:

- For the literal CS Corollary 5.5.5 application, retain the §5.1 unitary datum and the given irreducible admissible Π^S in the indicated BCS supercuspidal alternating Igusa summand. Its identification with the labelled pure automorphic transfer parameter is supplied as input; this export does not prove an Igusa trace or concentration theorem.
- The constituent Π_i are regular C-algebraic, θ-stable isobaric representations supplied by that parameter, and r_i has rank n_i (known E10), not n. The source setup has F⁺≠Q, quasi-split finite unitary group, and the ramified rational primes of F contained in Spl_{F/F⁺}; these source restrictions are retained for that literal application.

Proof route:

1. Use the ET.7a pure stable/endoscopic transfer and the AG2.2 constituent representations.
2. Install ε_i with the parity correction so the indicated twist is L-algebraic.
3. Take the direct sum and match normalized Satake polynomials using local LLC compatibility away from ℓ.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization`
- `AutomorphicGaloisRepresentationsPartII:AG2.5`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`

Acceptance checks:

- The two-constituent sum is allowed to be reducible.
- Theorem 5.5.4’s finite-place statement is used only at v∤ℓ, correcting the known E83 extraction finding.
- The known E10/E11 corrections are respected: constituent rank n_i and q split in 𝒦, not an undefined F₀.

Planned API:

- `TauCeti.AutomorphicGalois.UnitaryDiscreteExport` (constructor): Build the labelled direct sum with explicit algebraic character twists.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_constituent` (projection): Retrieve r_i, ε_i and its inclusion into the direct sum.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_goodPolynomial` (compatibility): Its good polynomial is the product of the twisted constituent polynomials and the specialized degree-n Hecke polynomial.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_two_characters` (computation): For n_1=n_2=1, at good v with twisted values β_1,β_2 the polynomial is (X−β_1)(X−β_2). **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity` (characterisation): The direct-sum dimension is n_1+n_2, with neither twist changing dimension. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_not_cuspidal_irreducibility` (non-example): A two-character endoscopic sum cannot certify global irreducibility. **Prototype:** The actual block-sum representation retains an invariant proper first summand and explicitly fails Mathlib irreducibility.

Consumers:

- `IgusaVarietiesAndTorsionConcentration:IG.5–IG.7`: Provides the discrete automorphic Galois summands used in the generic principal-series argument.
- `TorsionCohomologyInfrastructure:TC.0`: Supplies characteristic-zero summands, while torsion interpolation stays with IHG.

Suggested Lean component (algebraic-fragment): Two actual constituent homomorphisms and character twists give a labelled block-sum homomorphism. APIs test inclusion and product charpoly; the two-character example is explicitly not irreducible.

Omitted conditions: Literal CS endoscopic occurrence input, compact unitary field/group/level setup, auxiliary parity character construction, split-good-prime Hecke identification and away-ell full local comparison.

Sources:

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Corollary 5.5.5 and Remark 5.5.6, printed pp.745–746. The algebraic twists and finite-place comparison restricted away from ℓ.

### Lattice and residual polynomial export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/lattice-residual-polynomial-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.ResidualPolynomialExport`.

ResidualPolynomialExport(π,λ) contains a finite p-adic realization E, an explicitly chosen stable O_E-lattice, its continuous integral realization, the semisimple residual member, the coefficient-reduction maps on every good P_v and the comparison isomorphisms under another lattice or coefficient extension. It exports m_{π,λ} and its Galois-type evidence; non-Eisensteinness and decomposed genericity are additional hypotheses or projections only when proved. The chosen lattice is retained as data and never named canonical.

Proof route:

1. Choose finite E and stable lattice in that order.
2. Package the residue coefficient homomorphism and its characteristic-polynomial comparison.
3. Use lattice-independent semisimplification and kernel-independent m_{π,λ} for the comparison API.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`
- `mathlib:Representation.IsSemisimpleRepresentation`

Acceptance checks:

- The integral lattice may change while the residual semisimple isomorphism class remains fixed.
- The good-polynomial maps use the pinned GL map and charpoly_map.

Planned API:

- `TauCeti.AutomorphicGalois.ResidualPolynomialExport` (constructor): Assemble finite realization, chosen lattice and reduction maps.
- `TauCeti.AutomorphicGalois.residualExport_compareLattice` (equivalence): Different chosen lattices give isomorphic semisimple residual members, not necessarily isomorphic reductions.
- `TauCeti.AutomorphicGalois.residualExport_maxIdeal` (projection): Retrieve m_{π,λ} with Galois-type evidence.
- `TauCeti.AutomorphicGalois.residualExport_charpoly` (compatibility): The integral/residual Frobenius square commutes by Matrix.charpoly_map.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.residualExport_rank_one` (degenerate): Reduction of an integral character is its residual character. **Prototype:** The actual residual wrapper’s rank-one semisimple member is conjugate to the actual coefficient-reduced integral homomorphism.
- `TauCeti.AutomorphicGalois.residualExport_diagonal_mod3` (computation): The diagonal integral test reduces X²−3X+2 to X²+2 modulo 3. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.residualExport_unipotent_lattices` (non-example): The two Z_5-unipotent lattices have unequal reductions but equal semisimplifications; the package cannot identify the raw reductions. **Prototype:** The identity and unipotent reductions at t=1 are unequal with equal charpoly; the full Z₅ lattice construction is omitted.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.0`: Supplies residual automorphic data before lifting.
- `IntegralHeckeAndGaloisDeterminants:IHG.1–IHG.3`: Supplies classical integral polynomial comparisons, not a family over a nonreduced Hecke algebra.

Suggested Lean component (algebraic-fragment): An actual integral homomorphism/residue eigencharacter is retained alongside a semisimple residual member, every-element reduced polynomial and good Hecke matching. APIs compare finite-field semisimple members and identify the actual kernel.

Omitted conditions: Finite local coefficient field and stable lattice, global topology, surjectivity/maximality of the reduced eigencharacter and the integral Hecke polynomial provenance. The unipotent test includes unequal raw matrices, not a construction of the Z₅ lattices.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. Integral-to-residual good-polynomial interface.

### Rank-two residual comparison with R19

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/rank-two-residual-comparison-with-r19`. Kind: comparison. Implementation: unchecked.

For the regular classical/Hilbert exact overlap, fixed λ and the characteristic-zero dual/twist normalization of AG2.6, semisimple reduction commutes with the identification of the AG2 and R19 λ-members. In the classical normalization r̄_AG2≅r̄_R19^∨; the geometric good polynomial is X²−ā_qX+ψ̄(q)q^{k−1}. The associated maximal Hecke ideals agree under the normalized Hecke algebra identification. R19’s explicit geometry and lattice calculations remain supplier tools; only the semisimple isomorphism class, not a preferred lattice, is compared.

Proof route:

1. Identify characteristic-zero members through the exact R19 normalization dictionary.
2. Choose lattices and use residual semisimple independence to compare reductions.
3. Compare normalized reduced Hecke eigencharacters and their kernels.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`

Acceptance checks:

- At k=2 the determinant is ψ̄ε̄⁻¹ in the AG2 geometric convention.
- A claim that all integral lattices are identified fails the unipotent lattice test.

Suggested Lean component (shared-component): The residual R19 dual test compares already-normalized integral members through their common polynomials and finite-field semisimple reduction.

Omitted conditions: Construction of the classical/Hilbert dual/twist and Hecke-algebra normalization dictionary; preferred lattices are not compared.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6 and following duality statement, p.938. The dual convention descends to the residual comparison.

## Supplier contracts and remaining gaps

All contracts below retain their original consumer ids. An exact named prerequisite supplies only its stated component; a request for additional hypotheses or geometry remains open. The packets contain 70 requests and 20 gaps after assembly. The repeated suppliers denote separate contracts, not additional local constructions.

### Contracts from the AG2.0 part

- **AG2.0-R1: `AutomorphicFormsOnReductiveGroups:AF.1`.** Infinitesimal characters for the archimedean (g,K)-modules of Res GL_n, including restriction to the connected real subgroup.
Discrete compact-quotient automorphic decomposition with fixed central character and its comparison to (g,K)-cohomology; enough to identify multiplicity spaces at finite level.
Interior cohomology realization of regular algebraic GL_n cuspidal π after sufficiently large determinant twists, HLTT Corollary 1.9, with coefficient dual convention and degree i>0.
Shin Proposition 5.3(i): the exact cohomological archimedean packet, its Lie-algebra cohomology degree/dimensions and highest-weight partition, needed before Corollary 6.5(iv) can identify the selected multiplicities. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`, `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization`, `AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity`.

- **AG2.0-R2: `PadicHodgeTheory:R06.2`.** The de Rham and Hodge–Tate conditions on a continuous representation, with labelled Hodge–Tate multiset and HT(ε_ℓ)={−1}; used only to interpret BLGGT terminology, not to prove automorphic admissibility.
Serre regular-Hodge–Tate algebraic-monodromy criterion: distinct labelled weights force a regular-semisimple element of the Zariski closure, as used in CH Proposition 3.2.5. Automorphic de Rham and labelled regularity proofs are the AG2.6 output. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`.

- **AG2.0-R3: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.** Geometric Artin reciprocity on the idele class group modulo the connected archimedean component; compatibility with local Artin maps and transfer for extension of number fields. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

- **AG2.0-R4: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.** Idele Hecke characters, local components and finite-order parity, including the conductor-compatible Dirichlet dictionary.
Prime-degree Grunwald–Wang theorem with totally real local conditions, S-splitting and linear disjointness from arbitrary M; this is an extension of the global-field direction and must be owned there, as a proposed Part II if the upstream layers do not cover it. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`.

- **AG2.0-R5: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.** Algebraic infinity types x↦∏τ(x)^(−a_τ), purity of algebraic characters and the weight |χ|=norm^(−wt(χ)/2).
CHT08 Lemma 4.1.4 algebraic ψ satisfying ψψ^c=χ∘N, with its exact global-unit, infinity-type and finite-order parity hypotheses. HSBT Lemma 2.2 supplies the idele-extension mechanism, but the unpublished/read-missing CHT specialization must be checked.
Clozel–Thorne Lemma 7.4 rank-two specialization: for essentially square-integrable π∞ and cuspidal CM base change, a continuous χ with χχ^c=ψ^−1∘N and p_v+m_τ odd makes π_E⊗χ RACSDC. Track the initial central-character twist and global-unit compatibility; this is not an arbitrary algebraic square-root assertion. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`.

- **AG2.0-R6: `AutomorphicBundles:B2`.** Algebraic local systems for the compact Shin similitude datum, retaining a₀ and the selected CM type, and their comparison with the associated highest-weight representations.
TY §2 realization L_ξ=ε_ξ R^{m_ξ}(A_U^{m_ξ}/X_U)(t_ξ), including explicit ξ↦(m_ξ,t_ξ,ε_ξ), central character and graded permutation signs. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`.

- **AG2.0-R7: `AutomorphicFormsOnReductiveGroups:AF.4`.** Clozel’s Aut(C)-conjugate regular algebraic cuspidal π and its archimedean coefficient weight, as in Newton–Thorne Theorem 5.1 (Clozel Theorem 3.13). This extends the present rationality node’s explicit API.
Banach spaces of overconvergent definite-unitary automorphic forms with compact v₀ controlling operator, the fixed other infinity weights and linked tame-level maps. L2a only glues supplied families.
Definite-unitary classicality at sufficiently dominant varied weights relative to a finite slope, and Zariski density of slightly regular classical points with the other weights fixed, as in CH Theorem 2.3 / Ch Theorems 3.3 and 3.5.
Liu et al. Lemma 3.1.2: rational coefficient model and strong multiplicity one identify the field of a relevant representation with the compositum of its normalized spherical polynomial fields. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`, `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density`, `AutomorphicGaloisRepresentationsPartII:AG2.0/relevant-automorphic-coefficient-field`.

- **AG2.0-R8: `PELModuli:M0`.** Shin Lemma 5.1 compact similitude datum: odd n≥3, one signature (1,n−1), definite other signatures, finite quasi-split factors, reflex embedding and positivity. Current PEL conventions must specialize to this datum. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`.

- **AG2.0-R9: `PELModuli:M4`.** Smooth proper generic-fibre models X_U with universal A_U and finite étale level maps; Harris–Taylor Drinfeld integral levels at a split prime, allowing ramified F_w/Q_p. Do not substitute the unramified signature (n,n) model.
Effective polarized O_F-linear Kottwitz triples for the compact datum, with prime-to-p level, p-adic type and α₀=0; establish the actual multiplicity in the raw count.
HLTT §§3–4 quasi-split G_n integral ordinary level models and mixed Kuga families, with the right/left action conventions and common generic fibres.
Caraiani §7 compact unitary two-signature (1,n−1),(1,n−1) instance, Iwahori integral models and the product of two semistable charts after the source solvable extensions. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`.

- **AG2.0-R10: `IgusaVarietiesAndTorsionConcentration:IG.0`.** Extend the distinguished Drinfeld/Newton-stratum contract from the actual compact datum to Shin §5.2 with F_w possibly ramified; keep other split factors and the determinant condition. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`.

- **AG2.0-R11: `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-2-young-symmetrizers`.** Rationally normalized Young idempotents and denominator control, with the graded permutation action appropriate to tensor powers of H¹; import this upstream theory, not a second Schur-functor library. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`.

- **AG2.0-R12: `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality`.** The highest-weight ξ summand and its explicit rational tensor realization, including determinant/dual twists and the chosen polarization. Match the geometric H¹ sign convention. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`.

- **AG2.0-R13: `EtaleDualityAndPerverseSheaves:EDC.2`.** Étale derived pushforward, Leray spectral sequence and relative Künneth for the proper abelian tower; compatible with finite correspondences and rational summands. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity`.

- **AG2.0-R14: `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.** Smooth admissible characteristic-zero representations, fixed-level invariants and Grothendieck groups for the adelic tower, with exactness of compact-open invariants. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`.

- **AG2.0-R15: `DeligneWeightsAndPurity:DWP.7`.** Proper smooth purity for the geometric Kuga–Sato summand, with its algebraic correspondence, degree k+m_ξ and twist t_ξ; equality m_ξ−2t_ξ=w(ξ). Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action`.

- **AG2.0-R16: `EtaleDualityAndPerverseSheaves:EDC.8`.** Fujiwara/Varshavsky Lefschetz–Verdier trace for Hecke cohomological correspondences composed with sufficiently high Frobenius, including coefficients and compact support; keep it independent of ET.5.
The current EDC.8 statement supplies the trace class and explicitly sends stronger Fujiwara/contracting-boundary results to ET.5. Refine a single generic owner to supply the above theorem before automorphic stabilization; ET.5 should specialize it to Igusa varieties. Until that owner split is reconciled, this is a requested extension, not an available EDC.8 theorem. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`.

- **AG2.0-R17: `LefschetzPencilsAndVanishingCycles:LPV.0`.** Proper nearby-cycle comparison with the graded coefficient projector for the compact Drinfeld model, including the Galois/Hecke actions. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces`.

- **AG2.0-R18: `LefschetzPencilsAndVanishingCycles:LPV.1`.** Monodromy, specialization and trace compatibility on the actual Drinfeld charts, including ramified local fields; no LLC is an input. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces`.

- **AG2.0-R19: `HeckeStacksAndLocalShtukas:HS3`.** Rapoport–Zink compact-support cohomology as a smooth J_b×G×Weil functor, level colimits and the Mantovan dimension twist; specialize to the compact possibly ramified EL factors. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`.

- **AG2.0-R20: `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.** Derived smooth Ext with compact-support cohomology, level-colimit compatibility and Grothendieck additivity needed for the precise Mantovan functor. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`.

- **AG2.0-R21: `IgusaVarietiesAndTorsionConcentration:IG.1`.** The compact global Mantovan almost-product comparison and coefficient descent in Shin Proposition 5.2, including its ramified Drinfeld factors.
Caraiani §5 two-chart Newton/Igusa product-stratum comparison for the two-signature datum; characteristic-zero coefficient and Weil actions, independent of IG.7 torsion concentration. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`.

- **AG2.0-R22: `EndoscopicTransferAndUnitaryTraceComparison:ET.5`.** Stable Igusa trace formula for Shin’s compact datum and all its admissible classes b, with the §3.4/§5.3 transfer factors; raw geometric traces come from AG2.1a. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`.

- **AG2.0-R23: `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.** Twisted endoscopic character identities for the exact ST/END hypotheses of Shin §6.1, plus §3.6 archimedean sign calculation; not a universal multiplicity-one assertion.
Caraiani Proposition 5.8 characteristic-zero trace computation for the two-signature product strata; keep its packet, sign and local transfer restrictions. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`.

- **AG2.0-R24: `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`.** Shin Propositions 2.2–2.3: normalized local Mantovan/reduction formulas for supercuspidal, generalized Steinberg Sp_s and parabolic inputs over possibly ramified F_w, including Weil twist. A supercuspidal-only Drinfeld export does not suffice. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison`.

- **AG2.0-R25: `DeligneWeightsAndPurity:DWP.0`.** Eigenvalue-weight separation: classes of pure representations of distinct weights cannot cancel in the Weil Grothendieck group; apply to every actual graded summand. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`.

- **AG2.0-R26: `PadicHodgeTheory:R06.5`.** Geometric de Rham comparison for the compact Kuga–Sato projector and the labelled filtered dimensions in Shin Corollary 6.7, available before coefficient-system packaging AG2.6. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`.

- **AG2.0-R27: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.** Stable base change and the rank-m plus character endoscopic embedding in Shin §7.1, including the selected parity branch in Lemma 7.3 and good Hecke-polynomial identity.
HLTT Proposition 1.2 discrete stable transfer for square-integrable cohomological G_n representations, and the GL discrete classification with all m_i,n_i and half-integral norm twists. Also CS Corollary 5.5.5 parity character ϖ and its normalized discrete blocks.
Cuspidal solvable base change, finite exceptional self-twist extensions, and residue-degree Satake power compatibility; no automorphic Galois existence may be a prerequisite of the good polynomial identity.
Strong descent to the totally definite G₀ of CH Lemma 2.1, with the target refined Hecke eigensystem and prescribed tame local Bernstein data.
Caraiani §7 tensor-square packet comparison with the exact scalar characters, multiplicity and base-change factors; must identify actual middle cohomology, not just an alternating virtual tensor class.
Clozel–Thorne §3.5 selected real L-packet branches in stable base change and the source trace identities. CS §5.6 simple-Kottwitz inner-form variants require their own datum and stabilized packet comparison; import the exact variant, never identify it with Shin’s compact instance.
CS Corollaries 5.5.2/5.5.5 use the selected two-block transfer G_{n₁,n₂}, the surjective cohomological quotient, the source splitting set and ζ̃ L-morphism. Retain these hypotheses; the corollary does not state a general discrete GL_N theorem. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`, `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`, `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization`.

- **AG2.0-R28: `IntegralHeckeAndGaloisDeterminants:IHG.4`.** Characteristic-zero continuous pseudocharacter/determinant interpolation on reduced affinoid eigenvariety Hecke charts from a determining classical set, and continuity of specialized semisimple reconstruction even when residual or characteristic-zero representations are reducible.
Descent of characteristic-zero continuous determinant/pseudocharacter data along the integral Hecke quotients arising from the HLTT Hasse surjection, with uniform modulus and ramification. Supply the quotient identity and denominator control when p divides (2n)!; reconcile the finite-product witness API with a surjective classical Hecke comparison.
Generic HLTT Proposition 7.12 factor separation: continuous semisimple rank-2d ρ_m for infinitely many integer m, dense F, characteristic-zero algebraically closed k, continuous µ of infinite order on each f∈F, roots E₁(f)⊔E₂(f)µ(f)^m. Construct actual continuous rank-d factors by finite-product reductive Zariski closure and separation of connected-centre weights. Must be independent of TC.2 and automorphic existence.
CH Theorem 2.3 / Bellaïche–Chenevier §6.5 local family theorem: continuity of ramified Weil trace functions and specialization of the full inertial monodromy bound on the definite affinoid family with fixed tame Bernstein/parameter restrictions. This polarized route must not assume Varma’s theorem or Caraiani’s pure-WD upgrade. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`, `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization`, `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`.

- **AG2.0-R29: `ArithmeticGaloisRepresentations:R01.5`.** Sorensen effective patching of continuous semisimple rank-n representations over an S-general fixed-prime-degree cyclic extension family, with conjugation invariance and compositum compatibility; source CH §3.1. Keep the generic theorem in arithmetic Galois theory.
Use the corrected arithmetic blueprint recognition-by-characteristic-polynomials-and-coefficient-descent over any number field, characteristic-zero Hausdorff coefficient fields with fixed continuous embeddings, equal good Frobenius polynomials on a density-one set, and semisimple conclusion. The integrated decomposition’s earlier G_Q/finite-residue-field formulation alone is too narrow. Keep rational-eigenvalue-descent separate: traces in a characteristic-zero field M and one element with distinct M-rational eigenvalues. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`, `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`, `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`, `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`, `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison`.

- **AG2.0-R30: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.** Local GL_n parameter and cyclic base-change compatibility: after a finite solvable extension killing inertia of the Weil part, the local representation has Iwahori invariants. This uses the classical local parameter, not AG2.5 compatibility for already constructed global representations.
Unramified Satake normalization of the constructed local GL_n correspondence, geometric Artin, L_n=rec(π|det|^{(1−n)/2}), and the comparison with rec^T; supply this as a late comparison.
TY Lemma 1.4(3): all coefficient conjugates tempered iff the normalized local parameter is pure, with the geometric weight shift; import the local theorem, do not define purity again.
CS published Remark 5.5.6: at split places transfer via the specified L-morphism preserves the geometric local normalization. A direct sum of characters with no ratio equal to the cyclotomic character gives a generic principal series. Retain the all-ordered-pairs condition and its particular transfer datum. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction`, `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness`, `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations`.

- **AG2.0-R31: `ShimuraCompactifications:C3`.** HLTT minimal/toroidal compactification and SNC Kuga boundary charts, level/cone transition maps and formal ordinary completions. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`.

- **AG2.0-R32: `ShimuraCompactifications:C5`.** HLTT exact integral ordinary boundary charts and Hasse section modulo p^M; include ampleness of ω on X^min and extension of subcanonical bundles. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`.

- **AG2.0-R33: `AutomorphicBundles:B3`.** Canonical/subcanonical automorphic extensions on the HLTT mixed ordinary models, their coefficient lattices, boundary vanishing and determinant weight shifts.
Compute the explicit algebraic graded pieces ρ_{m,s}^{i,j} of logarithmic differentials and their finite filtration in HLTT Proposition 6.15, with subcanonical extension, trace factor and ordinary higher-cohomology vanishing. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence`.

- **AG2.0-R34: `PadicDifferentialEquationsAndRigidCohomology:RD.4`.** GK Theorem 5.1 / HLTT Lemma 6.8: rigid cohomology equals de Rham hypercohomology of the specified dagger tube, functorial in morphisms via compatible formal closures and covers, hence Frobenius and Hecke compatible. F1 supplies geometry, not this comparison. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison`.

- **AG2.0-R35: `PadicDifferentialEquationsAndRigidCohomology:RD.5`.** Finite-dimensional rigid cohomology of the smooth quasi-projective HLTT boundary strata, compatible with the displayed Čech spectral sequence. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence`.

- **AG2.0-R36: `PadicDifferentialEquationsAndRigidCohomology:RD.6`.** Rigid Frobenius weight lower bound w≥i on H^i of the smooth quasi-projective boundary strata, as used in HLTT Corollary 6.24; isolate weight zero and retain the degree-zero surjection exception. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence`.

- **AG2.0-R37: `ArithmeticGaloisRepresentations:R01.2`.** Complete the current WD classification API with Sp strings, isotypic monodromy partitions, dominance by all initial sums/ranks of all N powers, and Varma Lemma 9.2 comparison of Weil-twist and inertia orders. Keep these generic notions in R01.2.
TY Lemma 1.4(2),(4) primitive-string uniqueness of a pure WD extension up to equivalence and invariance/detection under finite local extension; tensor-square purity detects purity for the parameter and N⊗1+1⊗N. The current purity-definition node alone does not supply these theorems. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`, `AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison`.

- **AG2.0-R38: `SmoothRepresentationsOfLocalGroups:SR.3`.** Bernstein components/centre and the local trace functions σ↦tr rec(π)(σ), plus the type idempotent e_{Π,B} cutting out the target monodromy bound, as in Varma §9.1.
The fixed tame Bernstein-component and monodromy-bound condition imposed in CH Theorem 2.3 / BC §6.5; its trace functions and local-type inequalities on all relevant classical specializations. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`, `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`.

- **AG2.0-R39: `SmoothRepresentationsOfLocalGroups:SR.5`.** Integral Bernstein operators with a uniform denominator across the permitted finite component union and all algebraic weights, Varma §7.2. Supply their lattice-preserving action for HLTT ordinary congruences. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`.

- **AG2.0-R40: `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`.** Nondegenerate trace pairing on the image algebra of a characteristic-zero semisimple representation, used to convert all traces against τ into exterior-power annihilation. Import the upstream algebra theory. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound`.

- **AG2.0-R41: `LefschetzPencilsAndVanishingCycles:LPV.6`.** Caraiani Proposition 3.9, Propositions 4.6/4.10 and Corollary 4.29: derived nearby cycles on étale-local products of two semistable charts over one trait with characteristic-zero ℓ-adic coefficients; N=N₁⊗1+1⊗N₂; kernel/image bifiltration of total N and its stratum spectral sequence with shifts, twists and correspondence equivariance. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`, `AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy`.

- **AG2.0-R42: `DeligneWeightsAndPurity:DWP.8`.** Weight filtrations and degeneration/separation for the actual double-filtered nearby-cycle stratum complexes of Caraiani §7, with N and Tate twists; keep the general weight formalism in DWP. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence`.

- **AG2.0-R43: `ArithmeticGaloisRepresentations:G7`.** BC sign under algebraic twists, semisimple factor assembly and specialization (including potentially reducible target), plus the G_n extension equivalence; import these generic polarized-carrier operations. The automorphic sign theorem itself is AG2.3.
Use G7/polarized-representation, polarization-sign-and-determinant, operations-on-polarized-representations and clozel-harris-taylor-group. These generic carriers have no residual Schur, p>2 or deformation-ring hypothesis. The GlobalGaloisDeformations G7 polarized deformation problem does not supply this interface. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.3/automorphic-polarization-and-sign`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.

- **AG2.0-R44: `AutomorphicGaloisRepresentations:R19.1`.** Classical modular Galois representation with its arithmetic Frobenius, weight and nebentype convention. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison`.

- **AG2.0-R45: `AutomorphicGaloisRepresentations:R19.2`.** The established Hilbert/quaternionic rank-two representation in its stated cohomological range; use only in this late uniqueness comparison. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison`.

- **AG2.0-R46: `AutomorphicGaloisRepresentations:R19.4`.** The proven away-prime local comparison in its exact modular range, transported after the late semisimple identification. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison`.

- **AG2.0-R47: `AutomorphicGaloisRepresentationsPartII:AG2.6`.** Coefficient-prime Hodge/WD comparison and the common weakly compatible-system package, with separate proofs: Newton–Thorne Lemma 5.2 coefficient-conjugation formulas; Liu Proposition 3.2.4 at v|ℓ and Definition 3.2.5 strong coefficient-field property; CH labelled de Rham, crystalline and Iwahori assertions; Caraiani log-crystalline monodromy; BCGP25 RACSDC paragraph following equation (1.8.21). Use R24.5:operations for the generic system carrier. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations`, `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`.

- **AG2.0-R48: `AutomorphicGaloisRepresentationsPartII:AG2.7`.** ACC+ §4.5.1 generic quotient/Lemma 4.3.2 residual export and Liu Appendix D.1 genericity. Retain residual unramifiedness, pairwise distinctness and α_i/α_j≠q as separate conditions; no IG.7 torsion theorem may feed early cohomology. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/prescribed-crystalline-twisting-character`, `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations`.

- **AG2.0-R49: `PotentialModularityAndCompatibleSystems:R24.5:operations`.** Generic weakly compatible-system dual, conjugate, algebraic-character tensor and solvable-restriction operations, before potential modularity. AG2.2 specializes them when AG2.6 supplies a system. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`, `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`.

- **AG2.0-R50: `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-1-simple-modules-schur-and-isotypic-components`.** Characteristic-zero Schur/isotypic decomposition and evaluation for semisimple finite-level modules; compact automorphic tower decomposition is supplied separately by AF.1. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`.

### Gaps from the AG2.0 part

#### AG2.0-G1. Explicit coefficient realization

TY cites HT01 pp. 97–98 for the recipe ξ↦m_ξ,t_ξ,ε_ξ. Those pages were unavailable. The B2 and Schur–Weyl requests must provide the recipe and verify its parity and Tate twist; no unspecified projector is accepted as a proof.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`.

#### AG2.0-G2. Polarized Kottwitz-triple effectivity

The current Honda–Tate node classifies abelian varieties up to isogeny. Raw fixed-point counting additionally needs a polarized O_F-linear realization with prescribed p-adic isocrystal, positivity and trivial Kottwitz obstruction α₀. Request PEL/IG refinement; do not infer it from the unpolarized Honda–Tate node.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`.

#### AG2.0-G3. Middle-degree cancellation source step

Shin Corollary 6.5 imports the Harris–Taylor p. 207 argument, beyond just purity of H^k. That unavailable passage must supply the selected-constituent weight bounds under the exact ST/END hypotheses. Geometric purity plus a virtual rank equality alone is not a proof of concentration.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`.

#### AG2.0-G4. Irreducible multiplicity divisibility

Shin Corollary 6.8 invokes HT01 Proposition VII.1.8 and explains the adjusted assumptions in Remark 6.9. The book proof was unavailable. The required lemma is divisibility of every irreducible Galois multiplicity by C_G, using the labelled geometric de Rham dimensions and independence of τ. Numerical rank divisibility is expressly insufficient.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`.

#### AG2.0-G5. Polarization twisting lemma source

CHT08 Lemma 4.1.4 was not obtained from a working public URL. BLGGT explicitly invokes it in the twisting proof. The global-number-fields request records the exact ψψ^c requirement and compatibility; the packet does not assume arbitrary prescribed local square roots extend globally.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`.

#### AG2.0-G6. Definite-unitary density proof source

CH recalls Chenevier Theorems 3.3 and 3.5 without their analytic proof. The cited Chenevier eigenvariety chapter was not obtained. The request specifies the group-specific classicality and density input; L4 and L2a alone do not imply it.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density`.

#### AG2.0-G7. GSp₄ route and dedicated ownership

Confirmed RT-AREA-langlands-1/19 routes the regular GSp₄ systems, Calegari–Geraghty Proposition 6.8 GSp₄-valuedness and Sorensen parahoric/inertia bounds, Pilloni Theorem 5.1.7.1 and its normalization and GSp₄ ramified comparisons to the proposed GSp4LocalLanglandsAndGaloisRepresentations owner. No such roadmap/stage exists in the atlas yet, so a fabricated supplier id is not used. The source-route obligation for AG2.2 and AG2.5 is recorded as this explicit ownership gap, pending creation of that owner. The contract must preserve Calegari–Geraghty Proposition 6.8(1)–(2),(5), the Mok/Bellaïche–Chenevier GSp₄-valuedness argument and Sorensen’s Iwahori/Klingen/paraspherical/inertia cases, and Pilloni Theorem 5.1.7.1(2),(5) with its geometric-Frobenius normalization and the routed E27 correction. Coefficient-prime and ordinary-shape clauses go with that owner’s p-adic package, not with this away-prime blueprint. Only the generic GL_n sign theorem is kept in AG2.3; GL₄ polarized construction and generic pure WD theory are imported by the dedicated owner.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

#### AG2.0-G8. Intrinsic boundary-pair independence

HLTT explicitly says its cohomology should depend only on the intrinsic pair but this is unproved; the plan uses a fixed Σ and the constructed transition-map colimit. A proof of intrinsic compactification/refinement independence is still required for the stronger stage wording; it must not be inferred from Lemma 6.19’s finite-level invariants.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`.

#### AG2.0-G9. HLTT quotient witness versus injection contract

The current IHG.4 uniform-congruence-witness node is phrased using an injective map into a finite product, whereas the Hasse construction naturally gives a surjective classical Hecke comparison. A generic quotient-descent lemma with continuity and polynomial-law identities, or a construction of the required injective witnesses from these quotients, remains necessary. This contract is requested explicitly; pointwise Hecke congruence is not treated as that lemma.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`.

#### AG2.0-G10. Polarized local family comparison source

CH Theorem 2.3 cites Bellaïche–Chenevier §6.5 for its inertial and monodromy family comparison. That cited proof was not obtained. The exact family specialization contract is requested from IHG.4/SR.3, separately from Varma, so the proof order is acyclic and the polarized upgrade has an honest semisimple-comparison input.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`.

#### AG2.0-G11. Liu middle-degree identification range

Liu et al. Hypothesis 3.2.10 identifies the irreducible automorphic representation with Hom_{G(A_f)} in degree N−1 for its specified indefinite unitary group. Proposition 3.2.11 verifies low ranks N≤3 and cites unpublished Kisin–Shin–Zhu for the further F⁺≠Q range. No public proof of that unpublished input was obtained. Keep the identification conditional outside the proved range; no universal geometric realization is used.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations`.

#### AG2.0-G12. Coefficient realization dependency

CH Proposition 3.2.5 needs the regular Hodge–Tate/de Rham assertion established by its family comparison. The generic p-adic Hodge regular-semisimple criterion is requested here; the automorphic admissibility proof is assigned to AG2.6 and is not used by the early AG2.0 trace-field dictionary. The finite-field target stays planned with this precise dependency, rather than asserting trace-field descent.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`.

#### AG2.0-G13. Early fixed-point theorem owner refinement

EDC.8 constructs Lefschetz–Verdier trace classes but explicitly leaves the stronger Fujiwara/Varshavsky fixed-point result to ET.5. The raw compact Hecke–Frobenius identity needs that geometric result before ET.5 stabilization and ET.6 LLC/global comparison. Reconcile one generic owner with the existing ET.5 assignment; do not infer the fixed-point equality from a trace-class construction or import the stabilized automorphic formula into its own raw input.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`.

### Contracts from the AG2.6 part

- **AG2.6-R1: `PadicHodgeTheory:R06.5`.** Projector-compatible filtered semistable comparison for the PEL/Kuga–Sato realizations, with D_st, N and cup products; the existing good-reduction node supplies only the smooth proper crystalline case. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`.

- **AG2.6-R2: `PadicHodgeTheory:R06.2`.** Berger–Colmez bounded constant-Hodge-type family theorem in the CH Theorem 2.3 setting, at coefficient-prime places other than the weight-varying v_0; prove strict period comparison on that family. This is a family extension of the scalar period-functor API, not a claim that de Rham representations are closed under arbitrary limits. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`.

- **AG2.6-R3: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.** S-general cyclic base-change and patching/descent from CH §3.1–3.2, including finite excluded cuspidality extensions, local Grunwald–Wang realization and coefficient-place splitting. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`, `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`.

- **AG2.6-R4: `AutomorphicGaloisRepresentationsPartII:AG2.3`.** The CH bounded eigenvariety family and geometric dense locus, with one place v_0 allowed to vary and constant other local Hodge types; import LocallyAnalyticDistributions:L4 for its generic Fredholm ingredient only. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`.

- **AG2.6-R5: `CrystallineCohomology:CR.6`.** Part II extension: Caraiani §§3–4 two-boundary log de Rham–Witt complex, residue realization of N (Proposition 4.4), and Theorem 4.6 bi-indexed stratum spectral sequence with its Tate twists. The existing ordinary Hyodo–Kato theory is a base, not this full generalized sequence. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.

- **AG2.6-R6: `WeightsInEtaleCohomology:R34.6`.** Purity and monodromy-weight inference for the projected Caraiani two-boundary spectral sequence, after the explicit diagonal concentration of projected closed-stratum cohomology; retain the concentration hypothesis. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.

- **AG2.6-R7: `AutomorphicGaloisRepresentationsPartII:AG2.1a`.** Raw geometric interface before period comparison: actual smooth proper PEL/Kuga–Sato cohomology with algebraic coefficients, degree, commuting Schur and automorphic isotypic idempotents, multiplicity, exact Tate twist, coefficient extension and cup-product compatibility; identify the normalized attached member inside that cohomology. CH §1.4–1.5, Theorem 1.4 and formula (1.6), pp.5–7 give the geometric route. The current polarized-construction-inputs-shin-and-chenevier-harris node states attached-representation conclusions and cannot replace these input data. No local admissibility may be assumed to construct this realization. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`.

- **AG2.6-R8: `AutomorphicGaloisRepresentationsPartII:AG2.1a`.** Separate Caraiani tensor-square/closed-stratum interface: the semistable PEL/Kuga–Sato realization of the tensor square, its two boundary directions and distinguished local places, projected closed-stratum cohomology, multiplicity m_ξ and Tate twist t_ξ. Prove the diagonal degree concentration i=2n−2 used in Proposition 5.1, pp.31–32, after the geometric set-up of §2. This concentration is needed in addition to the reusable CR.6 two-boundary spectral sequence and is not supplied by the preceding smooth proper realization alone. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.

- **AG2.6-R9: `AutomorphicGaloisRepresentationsPartII:AG2.5`.** Exact Varma §8.2 Jordan-block dominance and generic maximal-orbit theorem, and Taylor–Yoshida Lemma 1.4(4) uniqueness of pure WD parameters from the semisimplified Weil representation. Existing integrated summary does not state these inputs with complete hypotheses. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`, `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`.

- **AG2.6-R10: `AutomorphicGaloisRepresentationsPartII:AG2.4`.** AHTW §5 bounded-torsion Hecke local–global interface and non-Siegel boundary control used in Proposition 5.2.8/Theorem 5.2.9; this is additional scope beyond the original classical/determinant extraction. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`.

- **AG2.6-R11: `ArithmeticGaloisRepresentations:R01.1`.** The compact-image Baire finite-p-adic-realization theorem for continuous maps from profinite G to GL_n(Q̄_ℓ), with countability of finite local extensions and closedness of GL_n(E), before the existing local-field lattice theorem. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`.

- **AG2.6-R12: `ArithmeticGaloisRepresentations:R01.5`.** Import the existing arbitrary-rank characteristic-zero/residual Chebotarev–Brauer–Nesbitt recognition target. Additional need: the precise regular-Frobenius simultaneous descent obstruction-splitting criterion used by CH Proposition 3.2.5 (traces in E₀, split regular Frobenius, and two good places of different residue characteristics for a uniform number-field enlargement). Do not re-plan generic recognition as a rank-two-only supplier. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`, `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`, `AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`, `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi`.

- **AG2.6-R13: `IntegralHeckeAndGaloisDeterminants:IHG.3`.** T^S with geometric rank-n Hecke polynomials, its integral eigencharacters, residue quotients, dual involution and algebraic-character twist; interpolate elsewhere over nonreduced rings, with this interface receiving only classical comparisons. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`, `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`.

- **AG2.6-R14: `AutomorphicFormsOnReductiveGroups:AF.4`.** Clozel conjugation theorem in NT Theorem 5.1: σπ exists, is cuspidal regular algebraic and has finite components σπ^∞; number-field rationality. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`.

- **AG2.6-R15: `PadicHodgeTheory:R06.4`.** Ordinary crystalline filtration when the ordered Newton slopes agree with the ordered Hodge numbers in the CG6.8 regular good-level GSp4 normalization: each successive Frobenius eigenline is weakly admissible and corresponds to the stated saturated Galois filtration. Retain both unit operator hypotheses used to establish the root valuations. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape`.

- **AG2.6-R16: `AutomorphicGaloisRepresentationsPartII:AG2.2`.** Algebraic twisting from polarized GL_n to the conjugate-self-dual construction; GSp4 realization and corrected similitude (known E27/E54/E55); CS5.5.5 endoscopic discrete constituents with each explicit ε_i twist. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`.

- **AG2.6-R17: `ModularityAndLanglandsExtensions:ML.4`.** GSp4 transfer/LLC normalization, the CG (a,b) and Pilloni λ Harish–Chandra/Satake dictionary and the specialized monic versus det(1−Xφ) polynomial conversion. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape`, `AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison`.

- **AG2.6-R18: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.** CS5.5.5 Shin stable/endoscopic transfer with L-morphism ζ̃_{n1,n2} and the parity-corrected auxiliary Hecke character $, identifying the twisted direct-sum Satake polynomial. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`.

- **AG2.6-R19: `PotentialModularityAndCompatibleSystems:R24.5:operations`.** Correct the single shared data carrier so it contains the coefficient number field/place indexing, finite ramification set, continuous semisimple members, common good polynomials and labelled Hodge metadata without intrinsically imposing local de Rham/full-Hodge/crystalline, pure or polarized conditions. Supply separate Weak, VeryWeak, ExtremelyWeak, Pure and Polarized predicates with precise quantifiers, weakening maps, assembly/projection laws and coefficient change. The current weakly-compatible-system-rank-n and weakened-compatible-data statements contradict one another on this boundary. AG2 uses universally supplied data and operations conditionally; it neither edits this owner nor defines a replacement carrier. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`, `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`, `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export`.

- **AG2.6-R20: `ArithmeticGaloisRepresentations:G7`.** For a continuous finite-local-field CM polarized representation with multiplier ε_ℓ^(1−n)r_χ, prove that stable-lattice reduction followed by semisimplification admits the residual polarization and continuous extension G_{F+}→𝒢_n over the finite residue field or its algebraic closure, with multiplier ε̄_ℓ^(1−n)r̄_χ and the specified complex-conjugation sign. Retain the characteristic-2 case allowed by BLGGT §2.1, p.34, or prove exactly the additional restriction needed there. Do not impose Schur/absolute-irreducibility or deformation-ring hypotheses. Generic polarization and conjugation-extension constructions belong here; GlobalGaloisDeformations:G7/polarized-deformation-problem consumes a given extension and does not supply it. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`.

### Gaps from the AG2.6 part

#### AG2.6-G1. Generalized two-boundary log-crystalline comparison

CR.6 and the existing geometric period comparison do not yet specify Caraiani’s full two-boundary weight spectral sequence and the projected-stratum concentration interface. The target node records its exact source and proof; the reusable sequence is requested as a CrystallineCohomology, Part II extension.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.

#### AG2.6-G2. AHTW quantitative cohomology and arbitrary-multiplicity pseudodeformations

The source theorem is fully stated, but the supplier chain is not already closed by the atlas: AHTW Theorem 2.5.7 uses quantitative local Shimura cohomology annihilators (FS/HKW, Mantovan/HL25, Harris–Viehmann cases), not the generic-only IG.5 concentration theorem; Theorem 3.3.6 constructs reduced p-torsion-free bounded potentially semistable/crystalline pseudodeformation quotients with arbitrary residual multiplicities using Wake–Wang Erickson stable conditions and the bounded stable-condition algebraization/comparison results of WE15/WWE19. AHTW explains why it avoids assuming general formal GAGA; no general quotient-stack GAGA theorem is asserted as a prerequisite. Existing BunG/Newton and fixed-representation R08.3 foundations do not contain these full extensions. Precise Part II supplier extensions must be designed without an IG.5→AG2.6 cycle.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`.

#### AG2.6-G3. Supplier types and complete predicates absent from the pinned Lean baseline

The suggested file now has actual declarations for all 38 unique main names and 58 unique API names, with all 49 packet tests as labelled typed examples. The missing automorphic, raw geometric, period/WD, number-field place and stable-lattice interfaces remain implementation gaps. Each node and partial example records its algebraic component and omitted conditions under section 13; output signatures with necessary hypotheses omitted are not universal matrix theorems. System is an external parameter for the single R24 data carrier. Semisimplicity/absolute irreducibility use Mathlib, and no arbitrary Prop fields, empty predicates, fake automorphic types or AG2 compatible-system carrier are introduced.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/lattice-residual-polynomial-export`.

#### AG2.6-G4. Common carrier and weakened predicates disagree in the supplier

R24.5/weakly-compatible-system-rank-n builds full weak conditions into its object while weakened-compatible-data claims the same object permits determinant-only Hodge data. The owner must separate raw data from Weak/VeryWeak/ExtremelyWeak and stronger predicates. The relevant statements and constructor/import here are conditional on that requested correction; the suggested file quantifies external data and projection laws. Supplier edits are outside this issue’s deliverables.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`, `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`.

#### AG2.6-G5. Raw projector-compatible geometric realization not supplied

The current AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris node states attached-representation conclusions. It does not supply the raw PEL/Kuga–Sato cohomology, commuting projectors, multiplicity and Tate twist needed before period comparison. The geometric node now depends on the AG2.1a stage’s exact raw-interface request rather than treating that named conclusion as a realization. A second, separate request supplies Caraiani’s tensor-square and projected closed-stratum concentration.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.

#### AG2.6-G6. Polarization through residual semisimplification

BLGGT §2.1, p.34 states the residual CM 𝒢_n-extension, but the previously cited deformation-problem node assumes it. ArithmeticGaloisRepresentations G7 owns the generic pairing/conjugation API; its exact reduction-and-semisimplification extension is requested here, including the coefficient-characteristic boundary, without importing Schur hypotheses. No self-dual lattice is asserted.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`.

#### AG2.6-G7. Unresolved cross-part comparison and specialized-export contracts

Assembly resolves the AG2.3 family/patching, AG2.2 algebraic twist, AG2.5 pure-WD uniqueness and partition-order components to named nodes. It does not identify the away-prime tensor-square construction with the distinct at-coefficient-prime Caraiani realization requested from AG2.1a. The AHTW characteristic-zero generic maximal-orbit theorem remains an additional AG2.5 contract beyond the Varma partition-order node. The AHTW bounded-torsion/non-Siegel boundary input requested from AG2.4 is additional to the named HLTT construction. The selected two-block unitary export still needs the separate CS Remark 5.5.6 local normalization from AG2.5; a cuspidal RACSDC specialization alone is insufficient. Finally, the GSp4 comparison nodes retain provisional AG2.2/ML.4 requests pending the dedicated GSp4LocalLanglandsAndGaloisRepresentations owner already recorded in the AG2.0 part. No fabricated node id or general theorem closes these contracts.

Affected declarations: `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`, `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`, `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`.

## Source corrections and version discipline

The two packets use overlapping local E-numbers. References in this assembled reader are qualified by part: AG2.0/E3 is the BCGP monodromy claim, whereas AG2.6/E3 is the ACC+ polynomial sign. These labels do not rename packet findings. Each record below paraphrases the problem and gives the correction and source locator; no source passage is reproduced. The accepted reviews and version records bound the findings to the editions read.

### Findings carried by the AG2.0 part

#### AG2.0/E1

Source: blggt-potential-automorphy; §2.1, definition of a polarized automorphic representation, p. 32; unchanged in published Annals §2.1, p. 536.

Problem (paraphrase): The automorphic parity condition uses the symbol μ although its pair is denoted (π,χ); the subsequent quadratic-character adjustment repeats that mismatched symbol.

Correction: Use χ in the automorphic condition and in its δ_{F/F⁺} adjustment. The required parity is the separate weight-dependent correction E2.

Reason: The definition introduces only π and χ; no µ is in scope, and the next paragraph speaks of a character µ with (π, µ) polarized, again meaning χ.

#### AG2.0/E2

Source: blggt-potential-automorphy; §2.1, p. 32 (sign normalisation) and Theorem 2.1.1(1) with its proof, pp. 33–34; published Annals pp. 536–538.

Problem (paraphrase): The CM automorphic sign condition is independent of w, namely χ_v(−1)=(−1)^n after repairing the symbol. Theorem 2.1.1(1) then asserts total oddness for the multiplier ε_l^{1−n}r_{l,ι}(χ), and the proof evaluates it at complex conjugation as −1.

Correction: For F imaginary and (π, χ) regular algebraic of weight a ∈ (ℤⁿ)_w, the normalisation making (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) totally odd is χ_v(−1) = (−1)^{n+w}. Equivalently, ε_l^{1−n} r_{l,ι}(χ)(c_v) = (−1)^{n−1+w} χ_v(−1), so the printed (−1)^n is right exactly when w is even. The stated result affected is Theorem 2.1.1(1) for odd w; the theorem holds for every polarizable π after replacing χ by χδ_{F/F⁺}, so no result about polarizable π is lost.

Reason: χ is algebraic on the totally real F⁺ with wt(χ) = 2w (compare infinitesimal characters in π^c ≅ π^∨ ⊗ χ∘N∘det). By BLGGT A.2, r_{l,ι}(χ) = r_{l,ι}(χ₀) ε_l^{−w} with χ₀ of finite order, so r_{l,ι}(χ)(c_v) = (−1)^w χ_v(−1), and µ(c_v) = (−1)^{n−1+w} χ_v(−1). Counterexample for w odd: n = 1, F imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0)). (ψ, ψ|_{𝔸_ℚ}) satisfies the printed conditions, since ψ|_{𝔸_ℚ} has sign (−1)^1 at ∞. But r_{l,ι}(ψ|_{𝔸_ℚ}) = r_{l,ι}(ψ)∘V (V the transfer) takes c to r_{l,ι}(ψ)(c²) = 1, so µ(c) = +1. A pairing on a line is symmetric, so (r_{l,ι}(ψ), µ) is not polarized, let alone totally odd. The same happens for the base change of a newform of odd weight k (w = k − 2). Patrikis (Math. Ann. 362, p. 8 of arXiv v2) gives the general sign as ω_ι(c_v) = (−1)^w ω_v(−1), consistent with this correction.

#### AG2.0/E3

Source: bcgp21-purity; Published §2.5, Lemma 2.5.1, p. 189; n(r,N)=rank N in preceding paragraph.

Problem (paraphrase): Lemma 2.5.1 uses maximum rank of N as a uniqueness criterion for a pure Weil–Deligne extension of the fixed semisimple Weil representation.

Correction: Pure extension is unique up to equivalence by TY Lemma 1.4(4). Rank N alone does not characterize it in arbitrary dimension. Use purity’s full family of monodromy-power isomorphisms, or a proved sufficiently refined criterion in the intended restricted rank.

Reason: For q=4, fix an unramified semisimple Weil representation whose geometric Frobenius is diag(8,2,2,1/2,1/2,1/8), with weights (3,1,1,−1,−1,−3). Let N_p have chains (0,1,3,5),(2,4), and N_i have chains (0,1,3),(2,4,5), each sending an entry to the next. Both satisfy FNF^−1=N/4 and have rank 4, the maximum allowed by the graded dimensions (1,2,2,1). N_p is pure of weight 0 with strings of lengths 4 and 2. N_i has strings of length 3 centred at weights 1 and −1, is not pure, and has N_i³=0 while rank N_p³=1. Thus the maximizing WD class is not unique even up to equivalence. Literal uniqueness of a matrix N must also be replaced by equivalence.

#### AG2.0/E4

Source: chenevier-harris-II; Alternative argument after Theorem 3.2.3, author copy p. 12.

Problem (paraphrase): The alternate de Rham proof treats the exterior-square map GL_n→GL_{n(n−1)/2} as an isogeny onto that target.

Correction: For n≥4, the exterior-square homomorphism has finite kernel μ₂ onto its algebraic image; it is not an isogeny onto the full displayed GL group. The alternate de Rham argument needs the theorem for a finite-kernel map onto that image and compatibility of the p-adic Hodge condition with its faithful inclusion. This packet uses the first, eigenvariety/fixed-weight proof instead.

Reason: For n=4 the domain dimension is 16 and the displayed codomain dimension is 36, so the map is not surjective and cannot be an isogeny onto that codomain. The first argument on pp. 11–12 does not use this sentence.

#### AG2.0/E5

Source: caraiani-monodromy-away; Proof of Theorem 7.4, arXiv:1010.2188 p. 84; published Duke version p. 2409.

Problem (paraphrase): The proof identifies the individual tempered parameter L_n(Π) as having weight 2n−2, which is the weight appropriate to its tensor square.

Correction: The individual normalized rank-n parameter L_n(Π) is pure of weight n−1. Its tensor square is pure of weight 2n−2.

Reason: Corollary5.9 gives tempered Π. Geometric rec(Π|det|^((1−n)/2)) has Frobenius absolute values q^((n−1)/2), hence weight n−1; weights add on tensor products. In rank2 a weight-zero CSD base change of a modular form has factor weight1 and square weight2. The sentence appears immediately before the tensor-square calculation and assigns its doubled weight to the factor.

#### AG2.0/E6

Source: accplus-cm-potential-automorphy; §2.2.5, equations (2.2.6)–(2.2.7) and following unitary σ-polynomial, journal-pagination author copy p. 922; current arXiv/author preprint p. 26 has equations (2.2.5)–(2.2.6).

Problem (paraphrase): The GL_n display ends with +q_v^{n(n−1)/2}T_{v,n}, omitting (−1)^n. The unitary display’s general j-term omits X^{2n−j}. Its following σ-polynomial has powers X^{n−i} although its index runs from 0 to 2n.

Correction: The GL_n constant is (−1)^n q_v^{n(n−1)/2}T_{v,n}; the unitary j-term has X^{2n−j}, and every unitary σ-term has X^{2n−i}.

Reason: For n=1 the spherical character polynomial is X−T_{v,1}. The degree-2n unitary characteristic polynomial has one coefficient in each nonnegative degree from 2n to 0. The displayed n−i exponent produces negative powers; the j-term without its X power collapses different degrees. The surrounding characteristic-polynomial interpretation and the correctly signed GL_n display later in §2.3 fix the intended expressions.

#### AG2.0/E7

Source: chenevier-harris-II; §1, after Hypotheses 1.2, author copy p. 4; finding scoped to that copy (publisher download denied).

Problem (paraphrase): The coefficient highest weights are restricted to nonnegative coordinates on both conjugate embeddings, alongside the condition μ_i(τc)=−μ_{n−i+1}(τ).

Correction: Use dominant integral coordinates, without a nonnegativity restriction. Polynomial representations form a smaller class than the algebraic GL_n representations used here.

Reason: The two printed conditions together force every coordinate to vanish. The algebraic polarized pair det and det⁻¹ has dominant tuples (1,…,1) and (−1,…,−1), and is excluded by nonnegativity. BLGGT’s embedding-wise integer weights give the needed convention.

#### AG2.0/E8

Source: hltt-rigid-cohomology; Appendix A.1, definition of Std, article-pagination author copy p. 231.

Problem (paraphrase): Std is assigned the lower-left n×n block of the displayed block-diagonal Levi matrix.

Correction: Std takes the lower-right n×n block. This is the invertible GL_n factor paired with ν in the displayed Levi isomorphism.

Reason: The lower-left block in the display is zero, so it cannot even define a GL_n-valued map. The lower-right block is invertible; the ν×Std isomorphism and the Hodge-bundle examples determine the intended factor.

#### AG2.0/E9

Source: varma-local-global; arXiv:1411.2520v1, proof of Proposition 8.1, p. 19; §10 proof of Theorem 10.2 and Corollary 10.3, pp. 26–27.

Problem (paraphrase): The proof of Proposition 8.1 appeals to Corollary 9.3; the last section appeals to Corollary 11.1 and deduces Corollary 10.3 from Theorem 7.13. These numbers do not identify the comparison results established in this version.

Correction: Use Corollary 8.3 for the continuous Hecke pseudorepresentation on p. 19. Use Proposition 9.1’s constituent-by-constituent monodromy bound in Theorem 10.2, and Theorem 10.2 followed by the stated patching argument for Corollary 10.3. HLTT Theorem 7.13 alone gives existence rather than that local bound.

Reason: Corollary 8.3 appears immediately before the p. 19 application. Proposition 9.1 establishes the componentwise dominance used on p. 27. This version ends its mathematical sections at §10 and contains no Corollary 11.1; its preceding Theorem 10.2 supplies the bounded comparison that the final patching needs. The plan already distinguishes existence, trace agreement and the full family of N-power inequalities.

### Findings carried by the AG2.6 part

#### AG2.6/E3

Source: accplus-cm-potential-automorphy; §2.2.5, (2.2.6), p. 922; checked on the page image.

Problem (paraphrase): Paraphrase of the affected display: the final rank-n coefficient lacks the sign required in odd rank.

Correction: The last term is (−1)^n q_v^{n(n−1)/2} T_{v,n}, the i = n case of the general term.

Reason: For n = 1 the printed form gives X + T_{v,1} while the general term gives X − T_{v,1}, and the characteristic polynomial of the Frobenius on an unramified character χ is X − χ(ϖ_v). The proof of Theorem 2.3.5 (p. 938) prints the same polynomial with the last term (−1)^n q_v^{n(n−1)/2} T_{v,n}.

#### AG2.6/E4

Source: accplus-cm-potential-automorphy; §2.2.5, (2.2.7) and the definition of P̃_{v,σ}, p. 922; Lemma 2.2.13(2), p. 927.

Problem (paraphrase): Paraphrase of the affected displays: the degree-2n coefficient formula loses its monomial in (2.2.7), and the following sums use exponents indexed as though the degree were n.

Correction: The general term of (2.2.7) is (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2n−j}, and both sums of degree 2n are Σ_{i=0}^{2n} (−1)^i e_{v,i} X^{2n−i}.

Reason: P̃_v is monic of degree 2n (its leading term X^{2n} is printed), so the i-th term must carry X^{2n−i}; with X^{n−i} the sum has negative exponents for i > n.

#### AG2.6/E5

Source: accplus-cm-potential-automorphy; Remark after Definition 4.3.1, printed p.972, local genericity reading.

Problem (paraphrase): Paraphrase of the local reading: the remark treats projectivization as sufficient for genericity without separately retaining trivial inertia.

Correction: The ratio predicate is projectively invariant. Local genericity is invariant under unramified scalar twists; an arbitrary scalar twist also requires checking unramifiedness. Global existential decomposed genericity is invariant under finite residual character twists after avoiding the twist’s ramification set via Lemma 4.3.2.

Reason: At L=Q_2 with k=F_3, r=1⊕1 has q=2 and is generic. A ramified quadratic scalar twist χ⊕χ has the same projective representation and eigenvalue ratios but nontrivial inertia, so is not locally generic. This does not invalidate the global existential statement.

#### AG2.6/E6

Source: caraiani-monodromy-published; §3A, definition of the second separate boundary log structure, p.1611; also arXiv v1 §3.1, p.9.

Problem (paraphrase): The display for the second boundary log structure repeats the first boundary’s open immersions and open complements.

Correction: Use j_{2,j} and U_{2,j} for the second boundary; leave the first boundary using j_{1,j} and U_{1,j}.

Reason: The combined log structure on the same page uses both independent families. For X₁X₂=ϖ and Y₁Y₂=ϖ, the second boundary must detect the Y-divisors rather than duplicate the X-divisors. The p.1611 page image confirms the repeated first-boundary indices; the intended two-boundary construction is unchanged.

#### AG2.6/E7

Source: caraiani-monodromy-published; §3A local boundary membership, p.1609, and Lemma 3.2 chart, p.1611; also arXiv v1 §3.1 and Lemma 3.1.2, pp.8–9.

Problem (paraphrase): The second boundary’s membership list ends at j_r, and the chart’s second product ends at Y_r, although its second monoid has s generators.

Correction: Use j_s as the endpoint of the second boundary membership list and Y₁⋯Y_s in the chart’s second equation.

Reason: The model has independent r and s. Its preceding local equation and the proof’s second auxiliary model use s Y-factors, while the chart maps all s second-boundary generators to them. For r=1,s=2 the printed Y₁=ϖ chart loses the second boundary component. The published p.1611 image and p.1609 text confirm the slips; v1 has the same indices.

#### AG2.6/E8

Source: caraiani-monodromy-published; §3A dimension of Y^(i,j), p.1610; also arXiv v1 §3.1, p.8.

Problem (paraphrase): The stated dimension of a nonempty two-index stratum omits the m smooth Z-coordinates of the local model.

Correction: The local dimension is 2n+m−i−j. The expression 2n−i−j applies when m=0.

Reason: On the special fiber, imposing i X-coordinates and j Y-coordinates to vanish already kills both product equations, leaving 2n+m−i−j free coordinates. With n=r=s=i=j=m=1, the stratum is the affine Z-line, of dimension 1 rather than 0. The published p.1610 page image includes the Z-coordinates and omits m from the dimension. This is a dimension slip; the projected degree/Tate shifts remain separate in the purity argument.

#### AG2.6/E9

Source: chenevier-harris-II; Identified author copy, §1, highest-weight notation immediately after Special Hypotheses 1.2, p.4.

Problem (paraphrase): Both highest-weight tuples are described as having nonnegative entries, while the next formula makes them reverse negatives of one another.

Correction: Use non-increasing tuples of integers; a dominant algebraic GL_n weight need not have nonnegative entries.

Reason: Nonnegativity of both tuples combined with μ_i(τ^c)=−μ_{n−i+1}(τ) forces every entry to be zero. For n=2, μ(τ)=(1,0) has dual tuple (0,−1), a valid dominant integral weight excluded by that wording. The author-copy p.4 image confirms it. The packet already uses integer weights and needs no theorem restriction.

### Inherited corrections used by both parts

The selected CS transfer uses constituent rank n_i and the imaginary quadratic field 𝒦 of §5.1, pp.730–731, in the splitting condition of Corollary 5.5.5, p.745. The accepted AG2.6 reader identifies the published undefined F₀ as inherited E11; the full reader uses 𝒦 also in the earlier discrete-normalization entry. The rank correction is inherited E10. Pilloni’s source normalization retains the routed E27 similitude correction. These inherited findings are not new assembly errata.

## Pinned library interfaces

The reviewed library audit is the starting point; this plan does not reconstruct available CM, polynomial, matrix or representation algebra. The following 15 distinct declaration statements were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti’s audited baseline remains f790474821cf4256814db967cb154e7af3d0c369; the suggested file imports only Mathlib.

| Declaration | Interface reused |
| --- | --- |
| `mathlib:NumberField.IsCMField` | For [Field K] [CharZero K], NumberField.IsCMField K asserts total complexness and quadraticity over its maximal real subfield K⁺; number fields supply these ambient instances. |
| `mathlib:NumberField.IsCMField.complexConj` | For [Field K] [CharZero K] [NumberField.IsCMField K] [Algebra.IsIntegral ℚ K], complexConj K : K ≃ₐ[K⁺] K; [NumberField K] supplies integrality. |
| `mathlib:NumberField.IsCMField.complexEmbedding_complexConj` | Under the same CM/integrality instances, for φ:K→+*ℂ and x:K, φ (complexConj K x) = conj (φ x). This identifies τ∘c with c∘τ. |
| `mathlib:Multiset.prod_X_sub_C_coeff` | For [CommRing R], s:Multiset R and k≤s.card, (s.map (fun t => X−C t)).prod.coeff k = (−1)^(s.card−k)*s.esymm(s.card−k). It supplies exactly the signed elementary-symmetric coefficient identity. |
| `mathlib:AlgebraicClosure` | Algebraic closure of a field, with field, algebra and algebraic-closedness instances |
| `mathlib:Matrix.GeneralLinearGroup` | The group of units of square matrices; the carrier of the local prototypes |
| `mathlib:Matrix.charpoly` | det(X I − A) over a commutative ring |
| `mathlib:Matrix.charpoly_map` | charpoly(A mapped by f) = charpoly(A) mapped by f for a ring homomorphism |
| `mathlib:Matrix.charpoly_diagonal` | charpoly(diagonal d) = product of X − C(d_i) |
| `mathlib:Matrix.charpoly_units_conj` | invariance of characteristic polynomial under conjugation by an invertible matrix |
| `mathlib:Matrix.GeneralLinearGroup.map` | coefficient change on GL_n as a group homomorphism; map_id and map_comp are available |
| `mathlib:Representation.IsSemisimpleRepresentation` | Complemented lattice of subrepresentations; equivalent to semisimplicity of the corresponding group-algebra module |
| `mathlib:Representation.IsIrreducible` | Simple order of subrepresentations; apply after coefficient extension to AlgebraicClosure for absolute irreducibility |
| `mathlib:Matrix.GeneralLinearGroup.toLin` | Multiplicative equivalence from matrix units to invertible linear endomorphisms, used to obtain a Mathlib Representation |
| `mathlib:Matrix.rank` | Finite rank of the range of mulVecLin, used for the zero-monodromy algebraic inference |

## Source editions

Node entries give theorem, section and page locators for the particular mathematical contracts. This catalog records source versions, rather than a section-by-section summary of any paper. Public URLs and content hashes are inherited from the reviewed packets. Source ids that differ between packets are retained as aliases when they identify the same work; edition differences remain explicit.

- **`blggt-potential-automorphy`:** [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4) — Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. arXiv:1010.2561v4, 9 December 2013, the last arXiv version (published Annals of Math. 179 (2014), 501–609). Printed page = PDF page. R. Taylor's copy pa3.pdf has the same text in §2.1; arXiv:1010.2561v4; Annals 179 (2014). SHA-256: `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24`.

- **`accplus-cm-potential-automorphy`:** [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) — Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. Annals of Mathematics 197 (2023), 897–1113; the authors' copy Ramanujan.pdf, which carries the journal pagination (printed page = PDF page + 896); Author copy with Annals 197 (2023) pagination; printed page = PDF page + 896. SHA-256: `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02`.

- **`patrikis-sign`:** [On the sign of regular algebraic polarizable automorphic representations](https://arxiv.org/pdf/1306.1242v2) — Stefan Patrikis. arXiv:1306.1242v2, 8 July 2014 (published Math. Ann. 362 (2015), 147–171). Printed page = PDF page. SHA-256: `2bfa2a6a00a94465725cd7b0e48d64eef1fed4113a6be4b246a015e7927259f8`.

- **`hltt-rigid-cohomology`:** [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf) — Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne. Author's copy rigcoh.pdf (published in Res. Math. Sci. 3 (2016)). Locators give the article's own page numbers and result numbers. SHA-256: `abecfd049d617654dd0bb60e4945bf6967d3953ed20f2126de0624f2bd0bdbc7`.

- **`chenevier-harris-II`:** [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf) — Gaetan Chenevier and Michael Harris. Author's copy ConstructionII.pdf (published in Camb. J. Math. 1 (2013), 53-73). Locators give the article's own page and result numbers; Author copy; Cambridge Mathematical Journal 1 (2013). SHA-256: `9b5e76798f75273f53d1d4160f35815b1a3b656f04c965ad47fd4fa454840529`.

- **`varma-local-global`:** [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520) — Ila Varma. arXiv:1411.2520v1, 10 November 2014. Locators give the arXiv version's own page numbers. SHA-256: `24076dfcc6ca9b9e3168efb0150e75d5200f66e64085625b3e52895cfd1e56ef`.

- **`caraiani-monodromy-away`:** [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188) — Ana Caraiani. arXiv:1010.2188v1, 11 October 2010 (published Duke Math. J. 161 (2012)). Locators give the arXiv version's page numbers. SHA-256: `769e68e2384b42caf16861d9011b35afe48018eba006074ce0d6c4111451f3b3`.

- **`caraiani-monodromy-at-p`:** [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683) — Ana Caraiani. arXiv:1202.4683v1, 21 February 2012 (published Algebra Number Theory 8 (2014)). Locators give the arXiv version's page numbers; arXiv:1202.4683v1; Algebra & Number Theory 8 (2014). SHA-256: `6ec698414d5d3ad03f3d1c98de178b39d69722699f4a08a059e8d14027df885e`.

- **`shin-compact`:** [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf) — Sug Woo Shin. Author copy; article pagination, 61 pages. SHA-256: `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b`.

- **`shin-igusa`:** [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf) — Sug Woo Shin. Author copy; article pagination. SHA-256: `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0`.

- **`taylor-yoshida`:** [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357) — Richard Taylor and Teruyoshi Yoshida. arXiv:math/0412357v2, 7 April 2005; downloaded PDF metadata dated 2018. SHA-256: `a17d283d3a605cd3f031a1178f2914254ee9cbe430b11cfbff8c382e8cd1713b`.

- **`grosse-klonne-dagger`:** [Rigid analytic spaces with overconvergent structure](https://arxiv.org/pdf/1408.3329) — Elmar Grosse-Klönne. arXiv:1408.3329, author version. SHA-256: `f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b`.

- **`cs-generic-published`, `caraiani-scholze-17`:** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) — Ana Caraiani and Peter Scholze. Annals of Mathematics 186 (2017), 649–766; published PDF; Annals 186 (2017), 649–766; journal PDF. SHA-256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.

- **`newton-thorne26`, `newton-thorne-26`:** [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595) — James Newton and Jack A. Thorne. arXiv:2212.03595v2, 19 February 2025; published Annals 2026; arXiv:2212.03595v2; Annals 203 (2026). SHA-256: `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c`.

- **`liu-et-al22`, `liu-et-al-22`:** [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568) — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu. Inventiones Mathematicae 228 (2022), 107–375; published PDF; Inventiones 228 (2022), 107–375; public journal copy. SHA-256: `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`.

- **`bcgp21-purity`:** [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. Publications Mathématiques de l’IHÉS 134 (2021), 153–501; published PDF. SHA-256: `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`.

- **`bcgp25-racsdc`:** [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645) — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. arXiv:2502.20645v1, February 2025. SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.

- **`bellaiche-chenevier-sign`:** [The sign of Galois representations attached to automorphic forms for unitary groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf) — Joël Bellaïche and Gaëtan Chenevier. Compositio Mathematica 147 (2011), 1337–1352; published PDF. SHA-256: `46a4a8c7dc1394b6ec72c4b908bb7616818db4d608dcadf2f96d0998b3e0caa8`.

- **`hsbt-character`:** [A family of Calabi–Yau varieties and potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf) — Michael Harris, Nicholas Shepherd-Barron and Richard Taylor. Annals of Mathematics 171 (2010), 779–813; published PDF. SHA-256: `5e3fc579911961071bb7e7f7a7a4f4154d621d0abccafcf4d03702fbcfb3d1ab`.

- **`clozel-thorne17`:** [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download) — Laurent Clozel and Jack A. Thorne. Accepted Cambridge repository copy, published 2017. SHA-256: `fb88e83c3c056c2fa6100d1fbb4d0853c4ec636cc68a33548ac4259336094742`.

- **`ahtw-coefficient-prime`:** [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1) — A’Campo, Hevesi, Thorne and Whitmore. arXiv:2607.11763v1, 13 July 2026; unrefereed preprint. SHA-256: `a5a56b7917c387b24f717e31714675d2de183505250bbd3a3fae21bd1fa424bb`.

- **`calegari-geraghty-20`:** [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) — Calegari and Geraghty. Duke 169 (2020), 801–896; author copy. SHA-256: `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`.

- **`pilloni-20`:** [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) — Pilloni. Author copy; Duke Mathematical Journal 169 (2020), no.9, 1647–1807. SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.

- **`caraiani-monodromy-published`:** [Monodromy and local-global compatibility for l = p (published version)](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf) — Caraiani. Algebra & Number Theory 8 (2014), no.7, 1597–1646; published PDF includes two cover pages, printed page = PDF page + 1595. SHA-256: `a0c7963e45b4706c8d0e5ca4791d12f5de749ef77ca6ba8256371ecd215f5314`.

### Additional collated versions

The following distinct versions support the source corrections and edition comparisons already recorded in the AG2.0 packet. Their locators are not interchangeable with preprint pagination.

- [The same paper, R. Taylor's copy (§2.1 compared with arXiv v4; identical at the passages cited)](http://virtualmath1.stanford.edu/~rltaylor/pa3.pdf) (author copy). SHA-256: `0a3a56fb7ea2f598ef6c97edb64bffb7b4dcf80fb8a47ce67a8d567b9026a568`.

- [Potential automorphy and change of weight, Annals 179 (2014), 501–609; §2.1 pp. 535–538](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) (published). SHA-256: `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b`.

- [Local-global compatibility and the action of monodromy on nearby cycles, Duke Math. J. 161 (2012), 2311–2413; published proof of Theorem 7.4, p. 2409](https://www.ma.imperial.ac.uk/~acaraian/papers/lgc1.pdf) (author copy). SHA-256: `9801588a90444b611e10fe810c11c0099b54af4871217f3b7cf2c493d00595fe`.

- [ACC+, current arXiv download on 2026-10-08, §2.2.5 p. 26; numbering (2.2.5)–(2.2.6), distinct from journal pagination](https://arxiv.org/pdf/1812.09999) (preprint). SHA-256: `7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c`.
