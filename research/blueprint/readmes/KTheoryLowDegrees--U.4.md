# S-integers, finite Mennicke defects and arithmetic congruence kernels

This continuation of **KTheoryLowDegrees:U.4** builds on the accepted [U.1 plan](KTheoryLowDegrees--U.1.md). It completes the finite-rank extension argument, specifies the arithmetic relative defect at every nonzero level, and connects that defect to arithmetic completions and the localized cohomology consumer. The stable K₁ model, Mennicke symbols, Kubota homomorphism and standard-form function retain their existing owners and identifiers. Every statement here is a plan; no formal implementation is asserted.

The principal arithmetic distinction is between the absolute and relative problems. For a number field F and a finite set S of finite primes, the determinant identifies K₁(O_{F,S}) canonically with O_{F,S}ˣ. A decomposition of these units into torsion and a free lattice requires a choice of fundamental S-units. In contrast, Γₙ(I)/Eₙ(A,I) at a nonzero ideal can be nontrivial even when absolute SK₁(A) vanishes: in the totally complex, S=∅ case its normalized order depends on the depth of I at primes above roots-of-unity orders. These finite relative groups, rather than absolute SK₁, form the congruence-kernel system.

The original targets remain the following accepted declarations. They are imported, not recreated in this part. The three valuation-image refinements below supply the missing proof input to the existing S-unit theorem.

| Target | Existing declaration id in KTheoryLowDegrees:U.4 |
| --- | --- |
| Arithmetic stable SK₁ vanishing | `bass-milnor-serre`, backed by `arithmetic-mennicke-symbols-trivial` and the power-reduction nodes |
| Canonical K₁ determinant equivalence | `K1-S-integers-determinant` |
| Unit finite generation, torsion and rank | `s-unit-theorem` |
| Chosen free generators and splitting | `fundamental-s-units` |
| Chosen structure of K₁ | `K1-S-integers-structure` |
| Inclusion into K₁(F) | `K1-S-integers-into-field` |
| Residue and local specializations | `K1-S-integers-residue-and-local`, `K1-S-integers-local` |
| Comparison with completions | `K1-S-integers-completion` |

## Conventions and library boundary

A is a commutative unital ring, I an ideal, and C an arbitrary group. Matrix indices start at zero. GLₙ and SLₙ use Mathlib's native general and special linear groups on n-element index sets. GLₙ(A,I) is the kernel of reduction modulo I, and Γₙ(I) its determinant-one subgroup. Eₙ(A,I) is the relative elementary group from U.5, formed by normal closure of the level-I roots **inside Eₙ(A)**. For n≥3 and A Dedekind, the inherited normality result makes it a normal subgroup of GLₙ(A); no such unrestricted rank-two assertion is used.

The convention HasStableRange A k means that every unimodular tuple of length at least k+1 shortens by adding multiples of its last entry. Consequently BMS's condition (7.2)ᵣ is HasStableRange A (r−1). All relative transitivity hypotheses quantify over every ideal J, not merely the fixed I. This matters when the proof reduces the size of a matrix corner.

For a number field, S contains finite places only; r₁ and r₂ count real places and conjugate pairs of complex places. The group μ(F) is all roots of unity. At a nonzero integral ideal, ordᵥ(I) is its prime factorization exponent. The pinned Tau Ceti valuation has multiplicative value exp(−ordᵥ); hence a generator of vʰ has additive valuation vector −h eᵥ. The inverse supplies +h eᵥ. No order-of-vanishing convention is imposed on the zero ideal.

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed audit gives ordinary units in Mathlib and S-unit finite generation plus the valuation kernel in Tau Ceti; it does not give the S-unit rank or this finite Mennicke/completion argument. Quotients, determinant-one inclusions, native elementary matrices, normal closure, class-group finiteness and profinite completion are reused. The native completion is applied to abstract arithmetic lattices. The noncompact rational arithmetic group needs a separate two-sided completion interface.

## Extending the actual standard-form value

Write r for the old corner rank. The inherited standard form of a matrix in GL_{r+1}(A,I) factors as a type-L block, the root e_{r,0}(t), and a type-R block. The function f multiplies κ's two corner values in that order. Its hypotheses at this stage are HasStableRange A r and uniform relative GLᵣ transitivity, together with the five ExtensionConditions on κ: relative elementary kernel, elementary and unit-diagonal conjugation invariance, transpose stability of the kernel, and equality on each oriented (I,t)-related pair. The target C need not be commutative.

The inherited multiplier and conjugation-stabilizer arguments reduce product preservation to one matrix P: the permutation swapping the **last two** coordinates. P is different from the endpoint reflection used in the transpose argument. Removing a right type-R factor and a permitted upper-left factor reduces the test to L(a,y)e_{r,0}(t).

The higher-rank route assumes HasStableRange A (r−1) and uniform relative GL_{r−1} transitivity. A second standard-form reduction arranges the first column of a to have 1 in its initial entry, zero interior entries, and a possible final entry. Splitting off that entry evaluates the original corner in rank r−1. Explicit multiplication evaluates PσP⁻¹ in another standard form; elementary column corrections and a GE permutation make its remaining corner agree with the first. Thus P preserves f. At r=2 this route needs stable range one. A general Dedekind domain supplies stable range two, so its initial rank-two step uses the next route. This is the precise index distinction in BMS Proposition 8.6, pp.107 and 115–117.

For the Dedekind rank-two route, κ comes from a Mennicke symbol. Arrange a₀₀≠0, treating the unit ideal separately. Choose s∈I such that c=1+sy₁≠0 and v=s a₁₀+tc is coprime to a₀₀. Relative Bézout completion gives ω∈SL₂(A,I) sending (a₀₀,v) to (1,0). Determinant one and c≠0 force ω₁₁=a₀₀ and ω₁₀=−v. The swapped matrix has standard-form value κ(ω)⁻¹κ(β), with first row of β equal to (a₀₀c,sd−tc a₀₁), where d=det a is a unit. Numerator and denominator symbol multiplication, unit-factor invariance and the relation c=1+sy₁ cancel the additional factors. The output is κ(a). No determinant-one assumption is imposed on a. The simultaneous nonzero/coprime scalar choice remains a precise refinement gap; the matrix and symbol steps follow BMS Proposition 8.5, pp.117–119.

The swap result completes GE conjugation invariance. The inherited conditional product lemma now yields an actual homomorphism, extendedHom, whose function is exactly f. Restriction, uniqueness, composition with target maps, elementary kernel and passage of ExtensionConditions give a compatible family κₙ for every n≥2. This ordering keeps multiplicativity out of the initial definition of f.

## Finite relative universality

For n≥3, FiniteDefect n I is the native group quotient Γₙ(I)/Eₙ(A,I). Its API exposes the quotient map, surjectivity, kernel, group instance and extensionality of outgoing maps. At I=0 it is trivial. Over ℤ every nonzero ideal gives a trivial defect. The diagonal matrix diag(−1,1,1) at level 2 is in the relative GL group but has no determinant-one representative; it excludes a definition using all GL matrices.

The finite quotient first-row map must itself satisfy MS1 and MS2. A stable SK₁ symbol is insufficient for that purpose. The proof first extends the finite **GL quotient projection**, producing a left inverse to quotient stabilization. Surjective reduction then proves injective stabilization. In sufficiently high rank, disjoint corner reduction kills GL commutators; injectivity brings this bound back to n. The first-row fibre and the rank-three Mennicke multiplication calculation prove the two finite symbol laws. These are the results of BMS Theorem 5.4 and Lemma 5.5, pp.101–103, used with the quotient stability argument of Theorem 11.1, pp.119–120.

A general Mennicke symbol extends through κₙ, kills relative elementary matrices, and therefore factors through FiniteDefect. Rank-two images generate the quotient, proving uniqueness. Apply this construction to the universal symbol and use the finite quotient's own symbol for the inverse. This identifies FiniteDefect canonically with the existing universal MennickeGroup, normalized by the first row. It also proves finite-rank stability. The commutator identities make the relative image central in SLₙ(A)/Eₙ(A,I).

## Arithmetic order and compatible levels

Assume F totally complex and S=∅. Set m=#μ(F). For each rational prime p dividing m, let nₚ=ordₚ(m), and define

\[
 j_p(I)=\min_{v\mid p}\min\left(n_p,\max\left(0,\left\lfloor
 \frac{\operatorname{ord}_v(I)}{\operatorname{ord}_v(p)}-\frac1{p-1}
 \right\rfloor\right)\right),\qquad
 r(I)=\prod_{p\mid m}p^{j_p(I)}.
\]

The minimum runs over **all primes above p**. Using a sum or maximum changes the result. The order r(I) is positive and divides m; containment J≤I gives r(I) dividing r(J). At the unit ideal r=1. Sufficient depth at every prime above each p makes r=m. These four facts are separate proof refinements as well as API contracts.

The formula test with m=4 and a unique dyadic prime of ramification index 2 gives r=1 at h≤3, r=2 at h=4,5, and r=4 at h≥6. In particular this is F=ℚ(i), I=(1+i)ʰ. The suggested test states the complete arithmetic profile explicitly; it tests the formula without introducing a second model of the Gaussian number field. A second profile with local clipped values 1 and 3 must produce exponent 1.

The residue symbol (b/a)_{r(I)} gives the arithmetic Mennicke symbol. Its kernel computation uses the existing power reductions. Its exact-level surjectivity uses local symbol values and prime choice, whose remaining construction is identified in the gap ledger. For nonzero I, the finite defect is trivial when S is nonempty or F has a real place. Otherwise the first-row-normalized isomorphism identifies it with μ_{r(I)}(F), as in BMS Corollary 4.3, pp.95–96.

Inclusion from J≤I gives a surjective defect transition. In root coordinates it is z↦z^{r(J)/r(I)}, from the deeper level to the shallower one. It is not the inclusion of root groups. Deep full-root levels are cofinal and their mutual transitions are identities on μₘ(F). The inverse limit is therefore μ(F), with projection z↦z^{m/r(I)}. This normalized compatible system is the input to the completion proof.

## Arithmetic topology and central kernels

For n≥3, elementary levels form a cofinal system among finite-index normal subgroups of the lattice Γ=SLₙ(O_{F,S}). This assertion has two parts: every arithmetic neighborhood contains an elementary level, and every nonzero elementary level has finite index. The latter follows from finite residue rings and finite relative defects; containment alone does not prove it.

The native profinite completion Γ̂ is then the inverse limit of Γ/Eₙ(A,I). The congruence completion Γ̄ is the inverse limit of Γ/Γₙ(I). Their comparison is continuous and surjective. Taking compatible kernels identifies its kernel with the finite-defect inverse limit, so it has the group described above. Finite-target universal properties and compact compatible-lift existence belong to the profinite supplier.

The rational group G=SLₙ(F) uses arithmetic and congruence group topologies containing Γ as an open subgroup. Its two-sided completions need open-subgroup compatibility and denominator/conjugation refinement. Those general completion statements are unresolved. Mathlib's uniform-group completion cannot supply them by assuming the two group uniformities agree globally. After the requested comparison, the lattice kernel is the rational completion kernel. The rational group's root subgroups are divisible additive groups and generate G, so G has no nontrivial finite quotient. Its conjugation action on the finite kernel is consequently trivial; density extends this centrality to the completion. This is the higher-rank route to BMS Theorem 14.1, pp.128–130.

## The infinite-unit-rank SL₂ route

SerreElementary I is the native normal closure of the level-I upper roots **inside SL₂(A)**. Weyl conjugation supplies lower roots. Normality, level containment, monotonicity and the normal-closure universal property constitute its API. Zero level, full level over a field, agreement with native normal closure, and exclusion of a root with nonzero residue distinguish the intended object. U.5's E₂-ambient closure is not silently substituted for it.

The rank hypothesis is r₁+r₂+|S|≥2. A CM quartic with S=∅ meets it; an imaginary quadratic field with S=∅ does not. Serre's finite-index containment argument itself does not need this hypothesis. Subsequent root-production and inverse-limit centrality use an infinite-order S-unit. The exact rank follows from the existing valuation sequence: class-group finiteness provides principal powers of primes in S, so hℤ^S lies in the valuation image. Its quotient is finite. Tensoring with ℚ and adding the ordinary unit rank gives r₁+r₂+|S|−1. These are refinements of the existing S-unit theorem, preserving its torsion and choice-dependent splitting API.

The centrality proof uses relative row relations, a diagonal congruence commutator, and one or two primes in a ray class that avoid splitting in a nontrivial cyclotomic extension. These choices bound each primary exponent of the residue-unit group. The uniform power h(u)^m centralizes each defect quotient. Conjugation refinement and surjective level transitions give an action of SL₂(F) on the **abstract** inverse limit. An infinite-order diagonal power is in the action kernel, and simplicity modulo the center forces the action to be trivial. At this step the inverse limit has not been shown finite; an argument through a finite automorphism group would be circular.

Serre's completed kernel is the inverse limit of the **profinite completions** of the finitely generated abelian defect quotients. Moore's relative universal-cover theorem and relative fundamental-group computation identify this kernel: trivial if S is nonempty or there is a real place, μ(F) otherwise. Only after that computation does finite generation imply that each uncompleted defect is finite, and hence that SerreElementary I has finite index. The proof order is Serre Propositions 3–5 and Theorems 1–2, pp.494–500. Arithmetic SL₂ finite generation, the algebraic simplicity inputs, the root/row refinements and Moore's theory remain exact external inputs.

## The cohomology interface

The congruence applications in Calegari–Geraghty Remark 9.3 are GL₂ over a CM quartic and GL₃ over ℚ. The imaginary quadratic GL₂ case in that remark uses a separate argument. Trivial-coefficient degree-one cohomology gives additive lattice characters. Separate their determinant quotient, continuous congruence-completion contribution and possible central-kernel contribution, retaining the actual GL level and component data.

If the residue characteristic p is prime to the central kernel order, finite-target characters kill that kernel and descend. If p divides its order, kernel characters remain. A finite central group alone cannot establish localized H¹ vanishing. The needed Hecke support of all three contributions is a precise ALS.4 supplier contract. Under that support condition, localization at a non-Eisenstein ideal annihilates them. Compactly supported degree one additionally needs the complementary-degree vanishing and the Hecke-dual ideal in Poincaré duality; ordinary H¹ vanishing alone supplies neither. Boundary localization, duality and component/group-cohomology comparisons retain their existing ALS owners.

The following catalogue is arranged by these mathematical interfaces, with prerequisites stated for each declaration. Short ids in the inherited-target table above have the prefix KTheoryLowDegrees:U.4/. In the catalogue, every complete id identifies a declaration uniquely. Sources are cited by theorem, section and page; all formulations and proof outlines are in our own words.

## Extension and swap declarations

### Permitted modifications preserve the swap equation

**Lemma:** `KTheoryLowDegrees:U.4/swap-stable-modifications`; proposed declaration `swap_stable_modifications`.

Under the next-rank hypotheses, the set of σ with f(PσP⁻¹)=f(σ) is stable under right multiplication by type-R matrices and left multiplication by the upper blocks (10.3).

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. The swap preserves type R and blocks (10.3); the inherited type-L/type-R evaluation identifies each factor’s value before and after conjugation.
2. Use extended-value-two-sided to multiply the three evaluated factors in their given order.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-value-two-sided`, `KTheoryLowDegrees:U.4/extended-value-type-l`, `KTheoryLowDegrees:U.4/extended-value-type-r`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 10.2(a), p.115.

### Reduce swap invariance to a left block and one root

**Lemma:** `KTheoryLowDegrees:U.4/swap-reduction-left-middle`; proposed declaration `swap_reduction_left_middle`.

Under the next-rank hypotheses it suffices to prove the swap equation on σ=L(a,y)e_{r,0}(t), t∈I.

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. Take a standard form and remove its type-R factor using swap-stable-modifications.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-stable-modifications`, `KTheoryLowDegrees:U.4/relative-standard-form-exists`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 10.2(b), p.115.

### The stronger smaller-corner reduction

**Lemma:** `KTheoryLowDegrees:U.4/swap-smaller-corner-reduction`; proposed declaration `swap_smaller_corner_reduction`.

Assume additionally r≥2, HasStableRange A (r−1) and uniform relative GL_{r−1} transitivity. In the swap test σ=L(a,y)e_{r,0}(t), permitted upper-left modifications arrange a₀₀=1 and aᵢ₀=0 for 0<i<r−1. The final entry a_{r−1,0} may remain.

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. Apply inherited standard-form existence one rank lower to a; factor its left piece as (10.3).
2. Remove that left piece by swap-stable-modifications, retaining the level-I last-row root.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-stable-modifications`, `KTheoryLowDegrees:U.4/relative-standard-form-exists`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 10.2(b), (10.4), p.115.

### Evaluate the original reduced corner

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-original-corner`; proposed declaration `swap_higher_original_corner`.

For the corner in (10.4), the relative elementary root 1−a_{r−1,0}e_{r−1,0} splits off its first coordinate. Its remaining (r−1)-corner a′ has a′ᵢⱼ=a_{i+1,j+1} except a′_{r−2,j}=a_{r−1,j+1}−a_{r−1,0}a_{0,j+1}; f(σ)=κ restricted to rank r−1 evaluated on a′.

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. Multiply by the stated root and use κ’s elementary kernel.
2. Use type-L evaluation, with the remaining first-row tail killed by the same root kernel.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-smaller-corner-reduction`, `KTheoryLowDegrees:U.4/extension-conditions`, `KTheoryLowDegrees:U.4/extended-value-type-l`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, p.116.

### Standard form of the swapped higher-rank matrix

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-conjugate-factorization`; proposed declaration `swap_higher_conjugate_factorization`.

For reduced σ, set α₁=1−Σ_{i<r−1}yᵢe_{i,r−1}, α₂=1−te_{r−1,0}, and s=a_{r−1,0}+ty_{r−1}. Then β̄=e_{r,0}(s)⁻¹L(α₂α₁,0)PσP⁻¹ is type R; Its lower corner β has, for i,j<r−2, βᵢⱼ=a_{i+1,j+1}, β_{i,r−2}=0 and β_{i,r−1}=a_{i+1,r−1}; the penultimate row is (−ta₀₁,…,−ta_{0,r−2},1,−ta_{0,r−1}); the final row is (a_{r−1,1}−sa₀₁,…,a_{r−1,r−2}−sa_{0,r−2},y_{r−1},a_{r−1,r−1}−sa_{0,r−1}). These are actual level-I matrices and f(PσP⁻¹)=κ(β).

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. Multiply the three matrices entrywise, checking the first column and lower-right corner separately.
2. The two α factors are relative elementary, so the standard-form-value drops their κ values.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-original-corner`, `KTheoryLowDegrees:U.4/standard-form-value`, `KTheoryLowDegrees:U.4/standard-form-value-independent`, `KTheoryLowDegrees:U.4/extension-conditions`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, pp.116–117.

### Correct the swapped corner by elementary columns

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-column-correction`; proposed declaration `swap_higher_column_correction`.

The matrix δ=1+Σ_{j<r−2}t a_{0,j+1}e_{r−2,j}+t a_{0,r−1}e_{r−2,r−1} belongs to E_r(A,I); βδ is a permutation conjugate of the upper block with corner a′ and column ending in y_{r−1}.

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. All correction coefficients lie in I because t∈I.
2. Use s=a_{r−1,0}+ty_{r−1} to cancel the t terms in the last row; permute the isolated coordinate into the final position.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-conjugate-factorization`, `KTheoryLowDegrees:U.4/extension-conditions`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, p.117.

### The two higher-rank corner values agree

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-corner-value`; proposed declaration `swap_higher_corner_value`.

In the preceding notation κ(β)=κ|_{GL_{r−1}(A,I)}(a′).

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. Use κ’s elementary kernel to remove δ. The permutation matrix lies in GE_r, so elementary and diagonal conjugation invariance remove its conjugation.
2. The remaining block tail is a product of relative roots; kill them and restrict to a′.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-column-correction`, `KTheoryLowDegrees:U.4/extension-conditions`, `KTheoryLowDegrees:U.4/ge-subgroup`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, p.117.

### Higher-rank last-swap invariance

**Theorem:** `KTheoryLowDegrees:U.4/last-swap-higher-rank`; proposed declaration `last_swap_higher_rank`.

For r≥2, HasStableRange A (r−1), uniform relative GL_{r−1} transitivity for all ideals, and κ satisfying ExtensionConditions in rank r, the actual f satisfies f(PσP⁻¹)=f(σ) for every σ∈GL_{r+1}(A,I).

Hypotheses: Old corner rank r≥2; HasStableRange A r; for every ideal J, GL_r(A,J) acts transitively on J-unimodular columns of length r; κ:GL_r(A,I)→C has the inherited ExtensionConditions. f is precisely the inherited standard-form extendedValue on GL_{r+1}(A,I), initially only a function. P swaps coordinates r−1,r (indices starting at zero), not the first and last reflection.

Proof or construction:

1. Combine swap-higher-original-corner and swap-higher-corner-value on the reduced matrices.
2. Undo the reductions using swap-smaller-corner-reduction and swap-reduction-left-middle.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-original-corner`, `KTheoryLowDegrees:U.4/swap-higher-corner-value`, `KTheoryLowDegrees:U.4/swap-smaller-corner-reduction`, `KTheoryLowDegrees:U.4/swap-reduction-left-middle`.

Acceptance: Keep the smaller-corner HasStableRange A (r−1) hypothesis, rather than only HasStableRange A r. At r=2 this route needs stable range one; a general Dedekind domain supplies only stable range two, so the Kubota route is required.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proposition 8.6 and its concluding proof, pp.107,115–117.

### Arrange a nonzero rank-two corner

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-nonzero`; proposed declaration `swap_rank_two_nonzero`.

For a Dedekind domain and κ the inherited Kubota homomorphism of a Mennicke symbol, the rank-two swap reduction permits a₀₀≠0, including I=A.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. For I≠A the congruence a₀₀≡1 forces nonzero. For I=A use a unimodular first column and an allowed upper-block row operation.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-stable-modifications`, `KTheoryLowDegrees:U.4/swap-reduction-left-middle`, `KTheoryLowDegrees:U.4/kubota-hom`.

Acceptance: The argument for a proper ideal cannot be reused at I=A.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.117.

### Choose the relative semilocal Bézout pair

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-pair-choice`; proposed declaration `swap_rank_two_pair_choice`.

With a₀₀≠0, t∈I and y∈I² as in the rank-two swap, there is s∈I such that c=1+sy₁≠0 and IsCoprime a₀₀ (s a₁₀+tc). The pair is I-unimodular.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. In A/a₀₀A use inherited principal-quotient semilocality and the relative stable-range-one choice.
2. Keep c nonzero by varying s in the same permitted residue class; in a nonfield Dedekind domain a nonzero ideal has infinitely many elements. In a field handle I=0 and I=A directly.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-nonzero`, `KTheoryLowDegrees:U.4/dedekind-principal-quotient-semilocal`, `KTheoryLowDegrees:U.4/dedekind-coprime-square-adjustment`.

Acceptance: The auxiliary c must be nonzero: cancellation in the next step uses it. The field case is stated separately.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.118.

### Relative completion of the chosen pair

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-bezout-completion`; proposed declaration `swap_rank_two_bezout_completion`.

There is ω∈SL₂(A,I) with ω · (a₀₀,s a₁₀+tc)ᵀ=(1,0)ᵀ. In ω times [[a₀₀,0],[s a₁₀+tc,c]], the lower-right entry is y=a₀₀c.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. Apply the inherited relative column completion to the chosen I-unimodular pair.
2. Compare determinants using det ω=1 and the now upper-triangular product.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-pair-choice`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`, `KTheoryLowDegrees:U.4/relative-first-row-completion`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, (10.5), p.118.

### The swapped rank-three standard form

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-standard-form`; proposed declaration `swap_rank_two_standard_form`.

After α₁=[[1,−y₀],[0,1]], δ=1+se_{1,2} and ω̄=diag(ω,1), set u=a₁₀+ty₁. Then e_{2,0}(u)⁻¹ω̄δᾱ₁PσP⁻¹ is type R with lower corner β; f(PσP⁻¹)=κ(ω)⁻¹κ(β).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. Multiply the factors to obtain the first column e₀ and the explicit β of p.118.
2. The inverse of ω̄δᾱ₁ is type L; evaluate the resulting standard form and kill α₁.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-bezout-completion`, `KTheoryLowDegrees:U.4/standard-form-value`, `KTheoryLowDegrees:U.4/standard-form-value-independent`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.118.

### Recover the second row of the completion

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-omega-row`; proposed declaration `swap_rank_two_omega_row`.

The relative completion above satisfies ω₁₁=a₀₀ and ω₁₀=−(s a₁₀+tc), hence κ(ω⁻¹)=[−(s a₁₀+tc)/a₀₀]⁻¹. By numerator multiplication this equals [(tc a₀₁−s d)/a₀₀]⁻¹ κ(a), where d=det a.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. Use the lower-row equation and determinant-one identity from swap-rank-two-bezout-completion; cancel the nonzero c.
2. Use the inherited opposite-row Kubota formula on ω, then invert its value. Multiply its numerator by a₀₁ and use a₀₀a₁₁−a₀₁a₁₀=d.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-bezout-completion`, `KTheoryLowDegrees:U.4/swap-rank-two-pair-choice`, `KTheoryLowDegrees:U.4/kubota-opposite-row`, `KTheoryLowDegrees:U.4/mennicke-sign-unit`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.119.

### Evaluate the corrected β by Mennicke relations

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-beta-symbol`; proposed declaration `swap_rank_two_beta_symbol`.

For β from the rank-three standard form, its first row is (a₀₀c,sd−tc a₀₁), where d=det a∈Aˣ. Thus κ(β)=[(sd−tc a₀₁)/c][(sd−tc a₀₁)/a₀₀]=[sd/c][(sd−tc a₀₁)/a₀₀]=[(sd−tc a₀₁)/a₀₀], because c=1+sy₁ and d is a unit.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. Use the determinant computation y=a₀₀c to identify the first entry.
2. Substitute the two linear equations for x and ω’s recovered second row. Apply inherited q-equivalence and Mennicke denominator multiplication with the common-level admissibility checks.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-standard-form`, `KTheoryLowDegrees:U.4/swap-rank-two-omega-row`, `KTheoryLowDegrees:U.4/mennicke-denominator-common-level`, `KTheoryLowDegrees:U.4/mennicke-denominator-multiplication`, `KTheoryLowDegrees:U.4/mennicke-sign-unit`.

Acceptance: Use the source’s c₂ only for the second coordinate of y; it is distinct from the auxiliary scalar c=1+sy₁.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.119.

### Cancel the two rank-two symbol factors

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-symbol-cancellation`; proposed declaration `swap_rank_two_symbol_cancellation`.

The factors κ(ω⁻¹)κ(β) reduce to [a₀₁/a₀₀]=κ(a). The extra [sd/c] factor is 1.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. Apply the exact Mennicke products obtained in swap-rank-two-omega-row and swap-rank-two-beta-symbol; the inverse numerator factors cancel inside the abelian image of the symbol.
2. The determinant identity a₀₀a₁₁−a₀₁a₁₀=d∈Aˣ gives the remaining congruence; κ(a) is its first-row symbol.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-omega-row`, `KTheoryLowDegrees:U.4/swap-rank-two-beta-symbol`, `KTheoryLowDegrees:U.4/mennicke-symbol-image-abelian`, `KTheoryLowDegrees:U.4/kubota-hom`.

Acceptance: Commutativity is used only in the Mennicke image; no assumption that the ambient target C is abelian.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.119.

### Dedekind rank-two last-swap invariance

**Theorem:** `KTheoryLowDegrees:U.4/last-swap-dedekind-rank-two`; proposed declaration `last_swap_dedekind_rank_two`.

For a Dedekind domain, an ideal I, and κ the Kubota homomorphism of a Mennicke symbol, f on GL₃(A,I) satisfies f(PσP⁻¹)=f(σ), where P swaps the last two coordinates.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind; the old corner rank is 2 and κ is the Kubota homomorphism of an ideal-I Mennicke symbol. The function f is the inherited standard-form value in rank 3.

Proof or construction:

1. Apply swap-rank-two-symbol-cancellation to the standard form from swap-rank-two-standard-form.
2. Undo swap-rank-two-nonzero and swap-reduction-left-middle.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-symbol-cancellation`, `KTheoryLowDegrees:U.4/swap-rank-two-standard-form`, `KTheoryLowDegrees:U.4/swap-rank-two-nonzero`, `KTheoryLowDegrees:U.4/swap-reduction-left-middle`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proposition 8.5 and its concluding proof, pp.107,117–119.

### All GE conjugations preserve the next-rank value

**Lemma:** `KTheoryLowDegrees:U.4/ge-invariance-complete`; proposed declaration `ge_invariance_complete`.

In either last-swap-higher-rank or last-swap-dedekind-rank-two setting, GE_{r+1}(A)≤N(f).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Apply the inherited ge-stabilizer-swap-reduction to the corresponding last-swap theorem.

Direct prerequisites: `KTheoryLowDegrees:U.4/last-swap-higher-rank`, `KTheoryLowDegrees:U.4/last-swap-dedekind-rank-two`, `KTheoryLowDegrees:U.4/ge-stabilizer-swap-reduction`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 9.6 and §10, pp.114–119.

### The next-rank value preserves products

**Lemma:** `KTheoryLowDegrees:U.4/next-rank-product-law`; proposed declaration `next_rank_product_law`.

Under either completed GE-invariance route, f(στ)=f(σ)f(τ) for all same-level matrices.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Use ge-invariance-complete in inherited conditional-ge-multiplicativity.

Direct prerequisites: `KTheoryLowDegrees:U.4/ge-invariance-complete`, `KTheoryLowDegrees:U.4/conditional-ge-multiplicativity`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 9.3 and §10, pp.113,115–119.

### The actual next-rank homomorphism

**Construction:** `KTheoryLowDegrees:U.4/extended-hom`; proposed declaration `extendedHom`.

Under either the Dedekind Kubota rank-two hypotheses or the stronger higher-rank hypotheses, extendedHom κ:GL_{r+1}(A,I)→*C has underlying function the inherited extendedValue. It is bundled only after next-rank-product-law.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Take f as the function, use its inherited value at 1, and next-rank-product-law for the homomorphism fields.

Direct prerequisites: `KTheoryLowDegrees:U.4/next-rank-product-law`, `KTheoryLowDegrees:U.4/extended-value`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Propositions 8.5–8.6, pp.107,115–119.

Uses:

- BMS Proposition 8.6 and Theorem 4.1(c): Iteration and the finite relative universal property need a genuine homomorphism.
- BMS Corollary 8.10: Inheritance of transpose and related conditions requires the homomorphism’s elementary kernel.

Planning API:

- `extendedHom_apply` (simp): extendedHom κ g=extendedValue κ g with the same hypotheses and choices.
- `extendedHom_embed` (compatibility): extendedHom κ(diag(g,1))=κ(g).
- `extendedHom_unique` (characterisation): Any homomorphism with that restriction and relative elementary kernel equals extendedHom κ.
- `extendedHom_comp` (functoriality): Composition by a target homomorphism commutes with extendedHom, under both extension-existence hypotheses.

Unit-test contracts:

- `extendedHom_trivial_test` (degenerate): Extending the trivial κ gives the trivial homomorphism.
- `extendedHom_root_test` (computation): Every relative elementary root in the new rank has value 1.
- `extendedHom_restriction_test` (compatibility): Restriction along the fixed upper-left stabilization equals κ.
- `extendedHom_nonabelian_target_test` (non-example): The determinant character GL₂(ℚ)→ℚˣ followed by an injective map into a noncommutative target (ℚˣ×S₃) extends by the determinant with the identity S₃ component; the theorem must allow this target.

### Restriction of the bundled extension

**Lemma:** `KTheoryLowDegrees:U.4/extended-hom-embed`; proposed declaration `extendedHom_embed`.

extendedHom κ restricted to upper-left rank r equals κ.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Evaluate a type-L block with zero last column.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/extended-value-type-l`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 8.12 and Propositions 8.5–8.6, pp.111,115–119.

### The bundled extension kills relative elementary matrices

**Lemma:** `KTheoryLowDegrees:U.4/extended-hom-elementary-kernel`; proposed declaration `extended_hom_elementary_kernel`.

extendedHom κ annihilates E_{r+1}(A,I).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Use inherited conditional-ge-multiplicativity with ge-invariance-complete.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/ge-invariance-complete`, `KTheoryLowDegrees:U.4/conditional-ge-multiplicativity`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 9.3 and §10, pp.113,115–119.

### All conditions pass to the bundled extension

**Lemma:** `KTheoryLowDegrees:U.4/extended-hom-conditions`; proposed declaration `extended_hom_conditions`.

extendedHom κ satisfies ExtensionConditions in rank r+1, including transpose kernel stability and every oriented (I,t)-relation for t∈I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Elementary and diagonal conjugation come from ge-invariance-complete; the elementary kernel is extended-hom-elementary-kernel.
2. Apply inherited extension-transpose-kernel and extension-related-invariance to the actual homomorphism and extended-hom-embed.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-hom-embed`, `KTheoryLowDegrees:U.4/extended-hom-elementary-kernel`, `KTheoryLowDegrees:U.4/ge-invariance-complete`, `KTheoryLowDegrees:U.4/extension-transpose-kernel`, `KTheoryLowDegrees:U.4/extension-related-invariance`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 8.10 and Propositions 8.5–8.6, pp.110,115–119.

### Iterate the symbol through all finite ranks

**Theorem:** `KTheoryLowDegrees:U.4/dedekind-iterated-symbol-hom`; proposed declaration `dedekind_iterated_symbol_hom`.

For a Dedekind domain, every Mennicke symbol at I with values in any group C gives compatible homomorphisms κ_n:GL_n(A,I)→C for n≥2, satisfying ExtensionConditions, whose κ₂ is kubotaHom and whose upper-left restrictions agree.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Construct κ₃ by last-swap-dedekind-rank-two and extended-hom.
2. For r≥3, the inherited stable-range-two and relative transitivity discharge the smaller-corner hypotheses; iterate using extended-hom-conditions.
3. Use extension-unique for compatibility and independence of the inductive construction.

Direct prerequisites: `KTheoryLowDegrees:U.4/kubota-extension-conditions`, `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/extended-hom-conditions`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`, `KTheoryLowDegrees:U.4/extension-unique`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Propositions 8.5–8.6 and Theorem 4.1(c), pp.94–95,107,119.

### Sign and unit factors in Mennicke values

**Lemma:** `KTheoryLowDegrees:U.4/mennicke-sign-unit`; proposed declaration `mennicke_sign_unit`.

For a Mennicke symbol at I, admissible pairs obey [−b/a]=[b/a] and [bu/a]=[b/a] for u∈Aˣ whenever both symbols are defined. A denominator a congruent to 1 modulo the numerator has symbol value 1.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Put q=1−a∈I. MS1 gives [b/a]=[bq/a]. The parent residue-function homomorphism on (A/aA)ˣ sends x to [xq/a] and kills the image of Aˣ. Apply it to x=b and the unit u; include u=−1. The near-unit vanishing is parent q-equivalence-to-base-point.

Direct prerequisites: `KTheoryLowDegrees:U.4/mennicke-symbol-residue-homomorphism`, `KTheoryLowDegrees:U.4/mennicke-denominator-multiplication`, `KTheoryLowDegrees:U.4/q-equivalence-to-base-point`.

Acceptance: Check the common ideal-level condition for each use; the sign equality is a consequence of the Mennicke relations, not an arbitrary residue-character identity.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemmas 2.7(a,c), 2.9(a), pp.67–68; Kubota proof steps 1–2, pp.103–104.

## Finite quotient and commutator declarations

### The finite-rank relative determinant-one defect

**Definition:** `KTheoryLowDegrees:U.4/finite-mennicke-defect`; proposed declaration `FiniteDefect`.

For a Dedekind domain A and n≥3, let Γ_n(I) be the determinant-one part of U.5 congruenceSubgroup, and E_n(I) the inherited relative elementary subgroup viewed in Γ_n(I). Define FiniteDefect n I=Γ_n(I)/E_n(I), using relative-elementary-normal. The quotient map is denoted finiteDefectMk. Zero and unit ideals are allowed.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Use Matrix.SpecialLinearGroup.toGL to interpret Γ_n(I) without a new congruence carrier.
2. Restrict the normal relative elementary group to Γ_n(I), then apply the native quotient group construction.

Direct prerequisites: `KTheoryLowDegrees:U.5/congruence-subgroup`, `KTheoryLowDegrees:U.5/relative-elementary-subgroup`, `KTheoryLowDegrees:U.4/relative-elementary-normal`, `mathlib:Matrix.SpecialLinearGroup.toGL`, `mathlib:QuotientGroup.mk'`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(b), p.94.

Uses:

- BMS Theorem 4.1 and Corollary 4.3: The universal Mennicke quotient must be identified in each finite rank and ideal level.
- BMS Theorem 14.1: Finite relative defects form the kernel system for the two arithmetic lattice completions.

Planning API:

- `finiteDefectMk` (constructor): Γ_n(I)→*FiniteDefect n I is the native quotient homomorphism.
- `finiteDefectMk_surjective` (projection): finiteDefectMk is surjective.
- `finiteDefectMk_eq_one` (characterisation): The class of g is 1 iff its GL image lies in E_n(A,I).
- `FiniteDefect_group` (instance): The inherited quotient Group instance; commutativity follows from finite-defect-central-lattice.
- `finiteDefect_ext` (extensionality): Two maps out of FiniteDefect agree if their composites with finiteDefectMk agree.

Unit-test contracts:

- `finiteDefect_zero_test` (degenerate): FiniteDefect n 0 is trivial for every n≥3.
- `finiteDefect_integer_test` (computation): For n≥3 and nonzero N∈ℕ, FiniteDefect n (Nℤ) is trivial.
- `finiteDefect_det_test` (non-example): diag(−1,1,1) over ℤ at level 2 belongs to GL₃(ℤ,2ℤ) but has no representative in Γ₃(2ℤ); the defect cannot be defined using all GL.
- `finiteDefect_quotient_test` (compatibility): The kernel of finiteDefectMk is exactly the restriction of relElementary to Γ_n(I).

### The quotient first-row symbol

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-symbol`; proposed declaration `finite_defect_symbol`.

For n≥3, the first-row map SL₂(A,I)→W_I followed by upper-left stabilization and finiteDefectMk factors through a unique Mennicke symbol W_I→FiniteDefect n I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Use finite-symbol-ms1 for the first-row factor and the two elementary moves.
2. Use finite-symbol-ms2 for numerator multiplication; combine these as one Mennicke symbol and use first-row surjectivity for uniqueness.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-symbol-ms1`, `KTheoryLowDegrees:U.4/finite-symbol-ms2`, `KTheoryLowDegrees:U.4/mennicke-symbol`.

Acceptance: This is a finite quotient statement proved before identifying the universal symbol; the stable SK₁ symbol alone would not suffice.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 5.4 and Lemma 5.5, pp.101–103.

### Rank-two images generate the finite defect

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-generated-sl2`; proposed declaration `finite_defect_generated_sl2`.

Every element of Γ_n(I) differs by E_n(A,I) from an upper-left stabilized element of SL₂(A,I), for n≥3 and A Dedekind.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Apply inherited relative-gl-reduction with stable range two.
2. Every relative elementary correction has determinant one, so the rank-two corner also has determinant one.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.4/relative-gl-reduction`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 7.5(b), p.106; proof of Theorem 4.1, pp.107–119.

### Extend any finite symbol through the quotient

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-universal-map`; proposed declaration `finite_defect_universal_map`.

For any Mennicke symbol s:W_I→C and n≥3, the iterated homomorphism κ_n restricted to Γ_n(I) factors through a homomorphism FiniteDefect n I→C whose rank-two values are s.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Apply dedekind-iterated-symbol-hom and its elementary kernel.
2. Use native QuotientGroup.lift on the restricted elementary subgroup.

Direct prerequisites: `KTheoryLowDegrees:U.4/dedekind-iterated-symbol-hom`, `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `mathlib:QuotientGroup.lift`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(c), pp.94–95,119.

### Uniqueness of the finite symbol factorization

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-universal-uniqueness`; proposed declaration `finite_defect_universal_uniqueness`.

The factorization of finite-defect-universal-map is unique among maps with the prescribed rank-two first-row values.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. First-row surjectivity identifies the map on the rank-two subgroup.
2. Use finite-defect-generated-sl2 and quotient surjectivity to determine it on every class.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-generated-sl2`, `KTheoryLowDegrees:U.4/finite-defect-universal-map`, `KTheoryLowDegrees:U.4/relative-first-row-map`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(c), pp.94–95,119.

### Finite relative Mennicke universality

**Theorem:** `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`; proposed declaration `finiteDefectMennickeEquiv`.

For A Dedekind and n≥3, FiniteDefect n I≃*MennickeGroup I, sending a stabilized SL₂ first row (a,b) to the universal symbol [b/a]. This is natural in homomorphisms of the target group.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Use finite-defect-symbol to map the parent universal Mennicke group into FiniteDefect.
2. Use finite-defect-universal-map on the parent universal symbol for the inverse.
3. Apply universal-mennicke-group uniqueness and finite-defect-universal-uniqueness to both composites.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-symbol`, `KTheoryLowDegrees:U.4/finite-defect-universal-map`, `KTheoryLowDegrees:U.4/finite-defect-universal-uniqueness`, `KTheoryLowDegrees:U.4/universal-mennicke-group`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(c), pp.94–95,119.

### Finite-rank defect stability

**Theorem:** `KTheoryLowDegrees:U.4/finite-defect-stabilization`; proposed declaration `finite_defect_stabilization`.

For A Dedekind and n≥3, stabilization FiniteDefect n I→FiniteDefect (n+1) I is an isomorphism compatible with first-row symbols.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Transport through finite-defect-mennicke-equivalence on both sides.
2. The induced map is the identity on universal symbols; their universal property determines the full map.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`, `KTheoryLowDegrees:U.4/universal-mennicke-group`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.2, p.95.

### The finite defect is central in the ambient quotient

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-central-lattice`; proposed declaration `finite_defect_central_lattice`.

For A Dedekind and n≥3, E_n(A,I)=[SL_n(A),SL_n(A,I)]. In particular the image of Γ_n(I) in SL_n(A)/E_n(A,I) is central and FiniteDefect n I is abelian.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Use finite-gl-commutator-pullback to bound the SL commutator by E_n(A,I).
2. Use relative-root-commutator for the reverse bound.
3. In the ambient SL quotient the relative subgroup therefore centralizes every class; it is abelian.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-gl-commutator-pullback`, `KTheoryLowDegrees:U.4/relative-root-commutator`, `KTheoryLowDegrees:U.4/finite-mennicke-defect`.

Acceptance: Retain n≥3; this does not give the SL₂ centrality theorem.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 11.1, Corollary 11.3 and (5.1), pp.99,119–121.

### The level transition map

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-level-map`; proposed declaration `finite_defect_level_map`.

For nonzero J≤I, inclusion Γ_n(J)→Γ_n(I) induces levelMap:FiniteDefect n J→*FiniteDefect n I. It is surjective for Dedekind A and n≥3.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Each relative elementary generator at J is also a generator at I, so descend inclusion through the native quotient.
2. Transport to parent MennickeGroup.restrictHom and apply inherited q-equivalence-smaller-ideal to give a representative at J for every symbol at I.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`, `KTheoryLowDegrees:U.4/q-equivalence-smaller-ideal`, `KTheoryLowDegrees:U.4/universal-mennicke-group`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6, p.77; Corollary 4.3(c), pp.95–96.

### The defect level maps compose

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-level-functor-laws`; proposed declaration `finite_defect_level_functor_laws`.

levelMap I I=id and levelMap J I∘levelMap K J=levelMap K I when K≤J≤I; they commute with rank stabilization.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Check equalities after the surjective finiteDefectMk. Every map is induced by the same subgroup inclusion or upper-left stabilization.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-level-map`, `KTheoryLowDegrees:U.4/finite-defect-stabilization`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollaries 4.2–4.3, pp.95–96.

### Relative elementary commutator identity

**Lemma:** `KTheoryLowDegrees:U.4/relative-root-commutator`; proposed declaration `relative_root_commutator`.

For n≥3 and any commutative ring, E_n(A,I)=[E_n(A),E_n(A,I)], where E_n(A,I) is the normal closure inside E_n(A).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. For distinct i,j,k use [e_ik(1),e_kj(t)]=e_ij(t) for t∈I.
2. The commutator subgroup is normal inside E_n(A), so it contains all relative conjugates; the reverse inclusion follows from normality.

Direct prerequisites: `KTheoryLowDegrees:U.5/relative-elementary-subgroup`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Equation (5.1), p.101.

### The finite GL quotient satisfies extension conditions

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-projection-conditions`; proposed declaration `finite_gl_projection_conditions`.

For A Dedekind and n≥3, the quotient projection GL_n(A,I)→GL_n(A,I)/E_n(A,I) satisfies the inherited ExtensionConditions.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Use parent relative-ge-commutator to obtain elementary and diagonal invariance in this stable rank.
2. Transpose preserves the relative elementary subgroup.
3. Use parent related-relative-elementary to compare the same-level oriented related matrices.

Direct prerequisites: `KTheoryLowDegrees:U.4/relative-elementary-normal`, `KTheoryLowDegrees:U.4/relative-ge-commutator`, `KTheoryLowDegrees:U.4/related-relative-elementary`, `KTheoryLowDegrees:U.4/extension-conditions`.

Acceptance: The stable-rank specialization of the parent commutator bound is required here; it is not a statement about all rank-two matrices.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 11.1 proof, p.120.

### GL quotient stabilization is onto

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-stabilization-surjective`; proposed declaration `finite_gl_stabilization_surjective`.

For Dedekind A and n≥3, GL_n(A,I)/E_n(A,I)→GL_{n+1}(A,I)/E_{n+1}(A,I) is surjective.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Use parent relative-gl-reduction to reduce to rank two, then place the corner in rank n.

Direct prerequisites: `KTheoryLowDegrees:U.4/relative-gl-reduction`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 7.5(b), p.106; Theorem 11.1 proof p.120.

### A left inverse makes GL quotient stabilization injective

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-stabilization-injective`; proposed declaration `finite_gl_stabilization_injective`.

For Dedekind A and n≥3, the GL quotient stabilization is injective.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Apply the completed higher-rank extension to finite-gl-projection-conditions. Its elementary kernel gives a quotient map in the reverse direction.
2. The restriction formula shows that the reverse map is a left inverse; use finite-gl-stabilization-surjective.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-gl-projection-conditions`, `KTheoryLowDegrees:U.4/finite-gl-stabilization-surjective`, `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/extended-hom-embed`, `KTheoryLowDegrees:U.4/extended-hom-elementary-kernel`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 11.1(b) proof, p.120.

### Pull stable commutators back to the original rank

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-commutator-pullback`; proposed declaration `finite_gl_commutator_pullback`.

For Dedekind A and n≥3, [GL_n(A),GL_n(A,I)]≤E_n(A,I).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Raise rank until the parent relative-ge-commutator bound applies to GL.
2. Iterate finite-gl-stabilization-injective to identify the elementary intersection with the original rank.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-gl-stabilization-injective`, `KTheoryLowDegrees:U.4/relative-high-gl-commutator`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 11.1(a) proof, p.120.

### The finite quotient obeys the first Mennicke relation

**Lemma:** `KTheoryLowDegrees:U.4/finite-symbol-ms1`; proposed declaration `finite_symbol_ms1`.

For n≥3 and Dedekind A, the first-row factor of SL₂(A,I) in FiniteDefect n I is well-defined and satisfies MS1 at the same level I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Use the parent first-row fibre; relative roots kill its differences.
2. For b↦b+ta with t∈I multiply on the right by a relative root. For a↦a+tb with t∈A conjugate by a root and use finite-gl-commutator-pullback.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.4/relative-first-row-fibre`, `KTheoryLowDegrees:U.4/finite-gl-commutator-pullback`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 5.5, p.102.

### The rank-three Mennicke multiplication identity

**Lemma:** `KTheoryLowDegrees:U.4/finite-symbol-ms2`; proposed declaration `finite_symbol_ms2`.

For two relative rows (a,b₁),(a,b₂) at I, their finite quotient first-row values multiply to the value of (a,b₁b₂), for every n≥3.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. A is Dedekind and the defect/GL quotient rank n is at least 3. Every inclusion J≤I keeps the same ambient ring and rank.

Proof or construction:

1. Choose determinant-one relative completions and conjugate the second into coordinates 0,2 with the signed three-cycle.
2. Apply the three explicit relative elementary operations of p.103; the resulting rank-two block has first row (a,b₁b₂).
3. Use finite-gl-commutator-pullback for the two signed-cycle conjugations and relative elementary killing for the other operations.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-symbol-ms1`, `KTheoryLowDegrees:U.4/relative-first-row-completion`, `KTheoryLowDegrees:U.4/finite-gl-commutator-pullback`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 5.4 proof of MS2, pp.102–103.

### Full GL commutators vanish in a sufficiently high relative rank

**Lemma:** `KTheoryLowDegrees:U.4/relative-high-gl-commutator`; proposed declaration `relative_high_gl_commutator`.

For HasStableRange A k, k≥1 and m≥2k with m≥3, [GL_m(A),GL_m(A,I)]≤E_m(A,I).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Reduce both factors to k×k corners using relative-gl-reduction, once at I=A.
2. Use relative-ge-commutator to discard elementary correction factors modulo E_m(A,I).
3. Conjugate one corner by an elementary signed permutation into k disjoint coordinates; its value changes by an elementary commutator, and the resulting corners commute.

Direct prerequisites: `KTheoryLowDegrees:U.4/relative-gl-reduction`, `KTheoryLowDegrees:U.4/relative-ge-commutator`, `KTheoryLowDegrees:U.4/relative-elementary-normal`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 7.5(d), p.106; Theorem 11.1 proof, p.120.

## Arithmetic order and level declarations

### The arithmetic defect order

**Definition:** `KTheoryLowDegrees:U.4/arithmetic-defect-order`; proposed declaration `defectOrder`.

Let F be totally complex, S=∅, I≠0 in O_F, and m=#μ(F). Define defectOrder F I=∏_{p∣m}p^{jIndex F p (ord_p m) I}, with jIndex the inherited minimum over finite primes 𝔭 above p of min(ord_p m,max(0,floor(ord_𝔭(I)/ord_𝔭(p)−1/(p−1)))). No valuation at the zero ideal is used.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Use the finite prime factorization of m and the already specified jIndex helper.
2. Each exponent is bounded between zero and ord_p(m), so the product is a positive divisor of m.

Direct prerequisites: `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`, `KTheoryLowDegrees:U.4/mennicke-group-exponent`, `mathlib:NumberField.Units.torsionOrder`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6, (3.3), Corollary 4.3(c), pp.72–73,77–78,95.

Uses:

- BMS Corollary 4.3(c): Specifies the exact root subgroup at every nonzero level.
- BMS Corollary 4.3(d): Deep levels with defectOrder=m identify the inverse limit with one fixed μ(F).

Planning API:

- `defectOrder_dvd` (characterisation): defectOrder F I divides m.
- `defectOrder_pos` (structure): defectOrder F I is strictly positive.
- `defectOrder_mono` (functoriality): J≤I nonzero implies defectOrder F I divides defectOrder F J.
- `defectOrder_top` (simp): defectOrder F O_F=1.
- `defectOrder_deep` (characterisation): If ord_𝔭(I)≥ord_𝔭(p)(ord_p(m)+1/(p−1)) at every 𝔭 above p∣m, defectOrder F I=m.

Unit-test contracts:

- `defectOrder_top_test` (degenerate): At I=O_F the defect order is 1.
- `defectOrder_gaussian_test` (computation): For a number-field profile with m=4, a unique dyadic prime 𝔭, ord_𝔭(2)=2 and ord_𝔭(I)=h, r(I)=1 for h≤3, 2 for h=4,5 and 4 for h≥6. This applies to F=ℚ(i), I=(1+i)^h.
- `defectOrder_depth_test` (characterisation): A level meeting every displayed deep bound has order m; the exponent is capped at ord_p(m).
- `defectOrder_multiple_primes_test` (non-example): If there are distinct primes 𝔭₁,𝔭₂ over p and the local clipped floors are 1 at 𝔭₁ and 3 at every other prime over p, then jIndex F p n I=1, rather than the maximum 3 or a sum.

### The arithmetic residue symbol satisfies the Mennicke laws

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`; proposed declaration `arithmetic_residue_symbol_ms`.

For F totally complex, I≠0 and r=defectOrder F I, (a,b)↦(b/a)_r, with value 1 for b=0, is a Mennicke symbol W_I→μ_r(F). The first entry a is prime to r whenever r>1.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Use the bound defining jIndex to check BMS Proposition 3.1’s local depth condition at every 𝔭 dividing r.
2. Use the degree-r local symbols and reciprocity to verify invariance under both MS1 moves; use multiplicativity of the ideal residue symbol for MS2.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`, `KTheoryLowDegrees:U.4/dirichlet-theorem-arithmetic-type`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance: The reciprocity and higher-unit interfaces are unresolved suppliers, not implicit prerequisites from downstream K₂.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proposition 3.1, pp.71–72; Theorem 3.6, p.77.

### The arithmetic symbol reaches every r-th root

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`; proposed declaration `arithmetic_residue_symbol_surjective`.

The universal-symbol factorization MennickeGroup I→μ_r(F) induced by arithmetic-residue-symbol-ms is surjective.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. For each rational p∣r prescribe a local Hilbert-symbol value using the required higher-unit image formula.
2. Use the parent A.10 prime-selection node to realize the residue-symbol value globally; combine primary components in the cyclic μ_r(F).

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/dirichlet-theorem-arithmetic-type`, `KTheoryLowDegrees:U.4/mennicke-group-exponent`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.

Acceptance: The source calls the surjectivity immediate; the local-choice and prime-approximation decomposition remains to be checked at the exact r(I) level.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Theorem 3.6, p.78.

### The arithmetic residue symbol has trivial kernel

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-injective`; proposed declaration `arithmetic_residue_symbol_injective`.

The induced MennickeGroup I→μ_r(F) is injective.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Reduce to a p-primary component using inherited finite cyclicity and exponent dividing m.
2. If the p^j residue symbol vanishes, parent power-reduction-totally-imaginary gives an equivalent pair (a₁,c^{pⁿ}q); its universal symbol is a pⁿ-th power and is 1 in that component.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/mennicke-group-exponent`, `KTheoryLowDegrees:U.4/mennicke-group-locally-cyclic`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Theorem 3.6, pp.77–78.

### Arithmetic finite defects are roots of unity

**Theorem:** `KTheoryLowDegrees:U.4/arithmetic-finite-defect-roots`; proposed declaration `arithmeticFiniteDefectRoots`.

For A=O_{F,S}, S finite and I≠0, n≥3: FiniteDefect n I is trivial if S≠∅ or F has a real place. Otherwise it is canonically equivalent to μ_{defectOrder F I}(F), normalized by the residue symbol (b/a)_r.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. For the first branch use the inherited arithmetic-mennicke-symbols-trivial and finite-defect-mennicke-equivalence.
2. For the totally complex S=∅ branch use arithmetic-residue-symbol-surjective and arithmetic-residue-symbol-injective, then the first-isomorphism equivalence.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`, `KTheoryLowDegrees:U.4/arithmetic-mennicke-symbols-trivial`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-injective`, `mathlib:QuotientGroup.quotientKerEquivOfSurjective`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.3(b)–(c), pp.95–96.

### Root normalization of level transitions

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-defect-transition-power`; proposed declaration `arithmetic_defect_transition_power`.

For F totally complex, nonzero J≤I, r_J=defectOrder F J and r_I=defectOrder F I, the level map corresponds to μ_{r_J}(F)→μ_{r_I}(F), z↦z^{r_J/r_I}.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. The defining ideal residue symbols satisfy (b/a)_{r_I}=((b/a)_{r_J})^{r_J/r_I}.
2. Use finite-defect-mennicke-equivalence and surjectivity to extend the identity from first rows to every defect class.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`, `KTheoryLowDegrees:U.4/finite-defect-level-map`, `KTheoryLowDegrees:U.4/arithmetic-finite-defect-roots`, `KTheoryLowDegrees:U.4/defect-order-monotonicity`.

Acceptance: The direction is from the smaller ideal J (larger root group) to I, by the quotient r_J/r_I power; it is not root inclusion.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6 and Corollary 4.3(c), pp.77,95–96.

### Deep full-root levels are cofinal

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-defect-deep-cofinality`; proposed declaration `arithmetic_defect_deep_cofinality`.

For every nonzero ideal I of O_F there is a nonzero J≤I with defectOrder F J=m. Such full-root levels are cofinal, and their normalized transition maps are identities on μ_m(F).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Multiply I by sufficiently high powers of the finitely many primes over m, retaining nonzero and obtaining every local depth bound.
2. Apply defectOrder_deep and arithmetic-defect-transition-power with r_J=r_I=m on the full-root subfamily.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`, `KTheoryLowDegrees:U.4/arithmetic-defect-transition-power`, `KTheoryLowDegrees:U.4/defect-order-full-depth`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.3(d), p.96.

### The inverse limit of relative defects

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-defect-limit`; proposed declaration `arithmetic_defect_limit`.

The inverse limit over nonzero ideals of the finite relative defects is μ(F) in the totally complex S=∅ case and trivial otherwise; its projections in the first case are z↦z^{m/r(I)}.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Use arithmetic-defect-deep-cofinality to restrict to a constant full-root system.
2. For each original level extend the family by arithmetic-defect-transition-power; the functor laws give compatibility and uniqueness.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-deep-cofinality`, `KTheoryLowDegrees:U.4/arithmetic-defect-transition-power`, `KTheoryLowDegrees:U.4/finite-defect-level-functor-laws`, `KTheoryLowDegrees:U.4/arithmetic-finite-defect-roots`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.3(d), p.96.

### Defect order divides the root count

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-divisor`; proposed declaration `defect_order_divisor`.

For every nonzero level I, defectOrder F I is a positive divisor of m=#μ(F).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Every jIndex is between 0 and ord_p(m); compare prime exponents in the finite product.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6 and Corollary 4.3(d), pp.77,96.

### Smaller ideals give divisible defect orders

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-monotonicity`; proposed declaration `defect_order_monotonicity`.

For nonzero J≤I, defectOrder F I divides defectOrder F J.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Ideal containment increases every ord_𝔭; the clipped floor and minimum are monotone; compare the finite products.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6 and Corollary 4.3(d), pp.77,96.

### The unit level has no arithmetic defect

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-unit-level`; proposed declaration `defect_order_unit_level`.

defectOrder F (⊤:Ideal O_F)=1.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Every ord_𝔭(⊤) is 0, so every clipped floor in jIndex is 0.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6 and Corollary 4.3(d), pp.77,96.

### A sufficiently deep level has the full root order

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-full-depth`; proposed declaration `defect_order_full_depth`.

If I≠0 and ord_𝔭(I)≥ord_𝔭(p)(ord_p(m)+1/(p−1)) at each prime over p∣m, then defectOrder F I=m.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. For r(I) and its normalized root transition system, F is totally complex, S=∅, I≠0 lies in O_F, and m=#μ(F).

Proof or construction:

1. Each local clipped exponent equals ord_p(m), so the minimum does also; use prime factorization of m.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6 and Corollary 4.3(d), pp.77,96.

## Completion and index declarations

### Every nonzero S-integer residue ring is finite

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-ring-finite`; proposed declaration `arithmetic_residue_ring_finite`.

For F a number field, S finite and nonzero I⊂O_{F,S}, O_{F,S}/I is finite.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. Use the parent s-integers-ring-of-fractions presentation and contract I to a nonzero ideal of O_F.
2. A nonzero O_F ideal contains a nonzero integer; its quotient is finite. The localized quotient is a quotient of a finite ring.

Direct prerequisites: `KTheoryLowDegrees:U.4/s-integers-ring-of-fractions`.

Acceptance: Include I=A, whose quotient is the zero ring. A residue-ring finiteness proof at the exact baseline remains a refinement gap.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14 congruence-level finiteness, p.128.

### Congruence subgroups have finite index

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-congruence-index`; proposed declaration `arithmetic_congruence_index`.

Γ_n(I) has finite index in SL_n(O_{F,S}) for every nonzero I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. Reduction maps into the finite matrix group over A/I; use arithmetic-residue-ring-finite and the injective quotient-to-image map.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-residue-ring-finite`, `mathlib:QuotientGroup.quotientKerEquivOfSurjective`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, p.128.

### Relative elementary subgroups have finite index

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-elementary-index`; proposed declaration `arithmetic_elementary_index`.

For n≥3 and nonzero I, E_n(O_{F,S},I) has finite index in SL_n(O_{F,S}).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. The quotient Γ_n(I)/E_n(I) is finite by arithmetic-finite-defect-roots.
2. Combine its finite index in Γ_n(I) with arithmetic-congruence-index; do not infer finite index merely from elementary cofinality.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-finite-defect-roots`, `KTheoryLowDegrees:U.4/arithmetic-congruence-index`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Theorem 14.1, pp.129–130.

### Elementary levels are cofinal among finite-index normal subgroups

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-elementary-cofinal`; proposed declaration `arithmetic_elementary_cofinal`.

For n≥3, every finite-index normal subgroup of Γ=SL_n(O_{F,S}) contains E_n(A,I) for some nonzero I. Together with arithmetic-elementary-index this is a cofinal system of finite-index normal subgroups.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. Use inherited finite-index-elementary-cofinality for containment.
2. Use arithmetic-elementary-index for the converse inclusion in the profinite neighborhood system.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-index-elementary-cofinality`, `KTheoryLowDegrees:U.4/arithmetic-elementary-index`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1 proof, pp.129–130.

### Describe the arithmetic lattice completion by elementary quotients

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`; proposed declaration `arithmetic_completion_level_description`.

The native profinite completion Γ̂ is topologically isomorphic to lim_I Γ/E_n(A,I) for n≥3 and nonzero ideal levels. The unit Γ→Γ̂ agrees with the compatible quotient maps.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. Use arithmetic-elementary-cofinal and the native profinite completion universal property.
2. Use the unbundled profinite inverse-limit supplier to prove the comparison is bijective and continuous.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-elementary-cofinal`, `mathlib:ProfiniteGrp.profiniteCompletion`, `mathlib:ProfiniteGrp.ProfiniteCompletion.lift`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14 completion construction and Theorem 14.1, pp.128–130.

### Describe the congruence lattice completion

**Lemma:** `KTheoryLowDegrees:U.4/congruence-completion-level-description`; proposed declaration `congruence_completion_level_description`.

The congruence completion Γ̄ is lim_I Γ/Γ_n(I), a profinite group, and the natural map Γ̂→Γ̄ is a continuous surjective homomorphism.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. Each congruence quotient is finite by arithmetic-congruence-index.
2. Use the native completion lift for each finite quotient, and form the compatible map. Its image is compact and contains the dense image of Γ.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-congruence-index`, `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, pp.128–129.

### Identify the congruence kernel with relative defects

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-kernel-level-comparison`; proposed declaration `arithmetic_kernel_level_comparison`.

For n≥3 the kernel of Γ̂→Γ̄ is topologically isomorphic to lim_I FiniteDefect n I. The projection at I is the class in Γ_n(I)/E_n(A,I).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. At every elementary quotient the kernel of Γ/E_n(I)→Γ/Γ_n(I) is Γ_n(I)/E_n(I).
2. Take compatible families using the elementary and congruence completion descriptions.
3. The finite-defect level maps are surjective; use compactness to obtain all prescribed compatible lifts.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`, `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.4/finite-defect-level-map`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.3(d) and Theorem 14.1 proof, pp.96,129–130.

### The higher-rank arithmetic congruence kernel

**Theorem:** `KTheoryLowDegrees:U.4/higher-rank-lattice-congruence-kernel`; proposed declaration `higherRankLatticeCongruenceKernel`.

For F a number field, S finite and n≥3, ker(Γ̂→Γ̄) is trivial if S is nonempty or F has a real place, and otherwise is topologically isomorphic to the finite discrete group μ(F).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. Compose arithmetic-kernel-level-comparison with arithmetic-defect-limit.
2. The identifications are homeomorphisms because the source is profinite and the target is finite discrete.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-kernel-level-comparison`, `KTheoryLowDegrees:U.4/arithmetic-defect-limit`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1, pp.129–130.

### Rational special linear groups have no finite quotients

**Lemma:** `KTheoryLowDegrees:U.4/rational-sl-no-finite-quotients`; proposed declaration `rational_sl_no_finite_quotients`.

For a number field F and n≥2, every homomorphism SL_n(F)→Q to a finite group is trivial.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. The additive group F is divisible; its image in Q is killed by |Q|, hence every elementary root image is trivial.
2. Use elementary generation of SL_n over a field.

Direct prerequisites: `KTheoryLowDegrees:U.3/field-special-linear-eq-elementary`.

Acceptance: A general subgroup of SL_n(F) need not have this property; the argument uses the whole divisible root group.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14 centrality proof, p.129.

### Lattice completions are open in the rational completions

**Lemma:** `KTheoryLowDegrees:U.4/rational-completions-lattice-open`; proposed declaration `rational_completions_lattice_open`.

Let G=SL_n(F), with the arithmetic topology from finite-index subgroups of Γ and the congruence topology from Γ_n(I). Their Hausdorff two-sided group completions contain Γ̂ and Γ̄ as open subgroups, with compatible comparison maps and the same kernel.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used.

Proof or construction:

1. Prove the conjugation refinement property by clearing denominators and using finite-index containment for conjugated lattices.
2. Use a general group-completion theorem for groups with an open precompact subgroup.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`.

Acceptance: The general two-sided completion construction is a recorded supplier gap; Mathlib’s abelian uniform group completion is not sufficient.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, pp.128–129.

### Centrality of the global higher-rank kernel

**Theorem:** `KTheoryLowDegrees:U.4/higher-rank-central-kernel`; proposed declaration `higherRankCentralKernel`.

In the rational arithmetic completion of SL_n(F), n≥3, the congruence kernel is central and has the finite group described by higher-rank-lattice-congruence-kernel.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field; S is a finite set of finite primes, A=O_{F,S}, and I is a nonzero ideal. Rank n≥3 applies to the finite-defect and higher-rank completion assertions; the residue-ring and congruence-index assertions hold at every matrix rank.

Proof or construction:

1. Normality gives an action of dense SL_n(F) on the finite kernel through its finite automorphism group.
2. Use rational-sl-no-finite-quotients to make this action trivial; continuity extends it to the completion.

Direct prerequisites: `KTheoryLowDegrees:U.4/rational-completions-lattice-open`, `KTheoryLowDegrees:U.4/higher-rank-lattice-congruence-kernel`, `KTheoryLowDegrees:U.4/rational-sl-no-finite-quotients`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1, pp.129–130.

## S-unit rank refinements

### Class-group powers give valuation basis multiples

**Lemma:** `KTheoryLowDegrees:U.4/s-unit-principal-prime-powers`; proposed declaration `s_unit_principal_prime_powers`.

For h=classNumber F>0 and each finite prime v∈S, there is a nonzero a_v∈O_F with (a_v)=v^h. Its image in Fˣ is an S-unit with additive valuation vector −h e_v in Tau Ceti’s valuationOfNeZero convention. Its inverse gives +h e_v.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Finite class-group order annihilates the class of v; apply ClassGroup.mk0_eq_one_iff to v^h.
2. Prime-ideal factorization identifies each valuation; no other finite prime occurs in the principal ideal.

Direct prerequisites: `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:ClassGroup.mk0_eq_one_iff`, `tauceti:Set.unitValuation`.

Acceptance: Tau Ceti uses exp(−ord), so the integral generator has −h, not +h; taking its inverse supplies the positive lattice basis.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Serre §1.1, p.490, unit theorem input; refinement via the cited pinned class-group and valuation statements.

### The S-unit valuation image has finite index

**Lemma:** `KTheoryLowDegrees:U.4/s-unit-valuation-image-index`; proposed declaration `s_unit_valuation_image_index`.

For finite S and h=classNumber F>0, hℤ^S is contained in the additive image of Set.unitValuation S F, so that image has finite index in ℤ^S and rank |S|. At S=∅ the index is 1 and rank 0.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Use s-unit-principal-prime-powers and multiply the inverse prime generators to realize h times every vector.
2. The quotient is a quotient of (ℤ/hℤ)^S, hence finite; tensor with ℚ to obtain the full |S|-dimensional image.

Direct prerequisites: `KTheoryLowDegrees:U.4/s-unit-principal-prime-powers`, `tauceti:Set.unitValuation`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Serre §1.1, p.490; arithmetic unit rank input.

### Recover the missing S-unit rank from the valuation sequence

**Lemma:** `KTheoryLowDegrees:U.4/s-unit-rank-from-exact-sequence`; proposed declaration `s_unit_rank_from_exact_sequence`.

The inherited S-unit group has rank (r₁+r₂−1)+|S|. Its finite generation is the pinned Tau Ceti theorem, and its rank follows from the exact valuation kernel and finite-index image. This supplies the proof refinement of the accepted s-unit-theorem, not another theorem object.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Identify the kernel with ordinary units using Set.unitValuation_ker and Set.unitEmptyEquivUnits.
2. Tensor the exact sequence with ℚ; exactness and the dimension formula add the ordinary unit rank to s-unit-valuation-image-index.
3. Apply the pinned NumberField.Units.finrank_eq and rank formula. Keep the parent torsion and chosen splitting nodes as the consumer API.

Direct prerequisites: `KTheoryLowDegrees:U.4/s-unit-valuation-image-index`, `tauceti:Set.unitValuation_ker`, `tauceti:Set.unitEmptyEquivUnits`, `tauceti:Set.unit_fg_of_units`, `mathlib:NumberField.Units.finrank_eq`, `mathlib:NumberField.Units.rank`.

Acceptance: ArithmeticKTheory:N.3 uses the inherited KTheoryLowDegrees:U.4/s-unit-theorem, backed by these refinements. A field with one complex place and one allowed finite prime has rank 1, not 0.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Serre §1.1, p.490; the listed pinned unit and valuation declarations.

## SL₂ declarations

### Serre’s relative elementary normal closure

**Definition:** `KTheoryLowDegrees:U.4/serre-relative-elementary`; proposed declaration `SerreElementary`.

For A=O_{F,S} and ideal I, SerreElementary I is the normal closure inside SL₂(A) of {e₀₁(t):t∈I}. It contains the lower-root family by the Weyl conjugation. The ambient group is part of the definition.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Use native Subgroup.normalClosure in Matrix.SpecialLinearGroup (Fin 2) A.
2. Each root reduces to the identity modulo I, so the closure lies in Γ₂(I).

Direct prerequisites: `mathlib:Subgroup.normalClosure`, `mathlib:Matrix.SpecialLinearGroup.transvection`, `KTheoryLowDegrees:U.5/congruence-subgroup`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §1.4, pp.491–492.

Uses:

- Serre Proposition 1: Cofinality among arithmetic neighborhoods uses normal closure in the full SL₂ lattice.
- Serre §§2.4–2.6: The quotient Γ₂(I)/SerreElementary I is used before it is known finite.

Planning API:

- `serreElementary_root` (constructor): e₀₁(t) lies in SerreElementary I when t∈I.
- `serreElementary_lower` (simp): e₁₀(t) lies in SerreElementary I when t∈I.
- `serreElementary_normal` (instance): SerreElementary I is normal in SL₂(A).
- `serreElementary_le_congruence` (compatibility): SerreElementary I≤Γ₂(I).
- `serreElementary_mono` (functoriality): J≤I implies SerreElementary J≤SerreElementary I.
- `serreElementary_le_iff` (universal-property): For N normal in SL₂(A), SerreElementary I≤N iff every e₀₁(t), t∈I, belongs to N.

Unit-test contracts:

- `serreElementary_zero_test` (degenerate): SerreElementary 0 is the trivial subgroup.
- `serreElementary_field_test` (computation): For a field k, SerreElementary (⊤:Ideal k) is all SL₂(k), by elementary generation.
- `serreElementary_ambient_test` (compatibility): This subgroup equals the native normalClosure of the specified upper-root set in SL₂(A).
- `serreElementary_congruence_test` (non-example): A root with nonzero reduction mod I cannot belong to SerreElementary I; normality cannot discard the level.

### Every arithmetic SL₂ neighborhood contains a Serre level

**Lemma:** `KTheoryLowDegrees:U.4/serre-finite-index-containment`; proposed declaration `serre_finite_index_containment`.

For a number field F, every finite-index subgroup H≤SL₂(A) contains SerreElementary I for a nonzero ideal I. No assumption on the S-unit rank is needed for this containment.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Replace H by its finite-index normal core N. If d=[SL₂(A):N], the additive root map kills dA in the finite quotient.
2. Use normality of N and the universal property of SerreElementary.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-elementary`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 1, pp.491–492.

### Choose a noncentral element with nonzero first-column product

**Lemma:** `KTheoryLowDegrees:U.4/serre-noncentral-root-choice`; proposed declaration `serre_noncentral_root_choice`.

If X≤SL₂(F) is noncentral and normalized by an S-arithmetic subgroup, X contains [[a,b],[c,d]] with ac≠0.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Take the Zariski closure of X. The arithmetic normalizer is Zariski dense, so this closure is normal in SL₂.
2. If every ac vanishes it is a proper normal algebraic subgroup; simplicity modulo the center contradicts noncentrality.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-finite-index-containment`.

Acceptance: Zariski density and the classification of proper normal algebraic subgroups need their stated algebraic-group suppliers; recorded as a gap.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 2 proof, p.492.

### A noncentral arithmetic-normalized subgroup contains a level

**Lemma:** `KTheoryLowDegrees:U.4/serre-normalizer-root-level`; proposed declaration `serre_normalizer_root_level`.

Assume r₁+r₂+|S|≥2. A noncentral X≤SL₂(F), normalized by an S-arithmetic subgroup, contains SerreElementary I for some nonzero I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. Use serre-noncentral-root-choice and choose an infinite-order S-unit in the finite-index unit subgroup of the normalizer.
2. Choose a power with u^{2n}≡1 modulo the denominator-cleared ideal; conjugate the selected matrix by the diagonal h(u^n) and one root as on pp.492–493.
3. The resulting nontrivial upper-root element, conjugated by diagonal units and level roots, supplies a nonzero ideal of roots; take its SL₂ normal closure.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-noncentral-root-choice`, `KTheoryLowDegrees:U.4/s-unit-theorem`, `KTheoryLowDegrees:U.4/serre-finite-index-containment`, `KTheoryLowDegrees:U.4/arithmetic-residue-ring-finite`, `KTheoryLowDegrees:U.4/serre-relative-elementary`.

Acceptance: The ideal-producing root calculation on p.493 remains a source refinement gap; it is not the n≥3 commutator identity.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 2, pp.492–493.

### Relative rows have the Serre elementary equivalences

**Lemma:** `KTheoryLowDegrees:U.4/serre-relative-row-relations`; proposed declaration `serre_relative_row_relations`.

Relative SL₂ matrices with equal first rows have equal classes in Γ₂(I)/SerreElementary I. The operations b↦b+at for t∈I and a↦a+bt for t∈I preserve these classes.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Use first-row fibre and upper/lower roots in SerreElementary.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-elementary`, `KTheoryLowDegrees:U.4/relative-first-row-fibre`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 1, pp.493–494.

### A diagonal power centralizes a row class

**Lemma:** `KTheoryLowDegrees:U.4/serre-diagonal-congruence-commutator`; proposed declaration `serre_diagonal_congruence_commutator`.

For σ∈Γ₂(I) with first row (a,b), if u∈Aˣ and u^{2n}≡1 modulo aA, then h(u)^n commutes with σ modulo SerreElementary I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Use the two row relations and write (u^{2n}−1)/a. Check the relative coefficients in the source calculation.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-row-relations`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 2, p.494.

### Split a prescribed abelian automorphism into nontrivial restrictions

**Lemma:** `KTheoryLowDegrees:U.4/serre-two-frobenius-factor`; proposed declaration `serre_two_frobenius_factor`.

Let M/F be finite abelian and L⊂M a nontrivial subextension. Any g∈Gal(M/F) is one automorphism or a product g₁g₂, with each chosen factor restricting nontrivially to L.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. If g has nontrivial restriction use one factor. Otherwise choose h with nontrivial restriction and use g=h(h⁻¹g).

Direct prerequisites: .

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 4 proof, p.496.

### A ray class has a prime-product representative avoiding splitting

**Lemma:** `KTheoryLowDegrees:U.4/serre-ray-prime-pair`; proposed declaration `serre_ray_prime_pair`.

For nontrivial finite abelian L/F and any ray class ξ, there are one or two distinct primes away from the modulus, each not splitting completely in L, whose product represents ξ.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Form the compositum of L and the ray class field; lift the ray-class automorphism.
2. Apply serre-two-frobenius-factor and Chebotarev separately to the factors, deleting previously chosen primes and the finite forbidden set.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-two-frobenius-factor`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 4, pp.495–496.

### Choose a row denominator with controlled residue-unit exponent

**Lemma:** `KTheoryLowDegrees:U.4/serre-unit-exponent-row-choice`; proposed declaration `serre_unit_exponent_row_choice`.

Let ℓ be prime and ℓ^e the largest ℓ-power dividing #μ(F). For an admissible relative row, a denominator a in its prescribed ray class can be chosen so that the exponent of (A/aA)ˣ is not divisible by ℓ^{e+1}.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Apply serre-ray-prime-pair to L=F(ζ_{ℓ^{e+1}}), which is a nontrivial extension by the definition of e.
2. A nontrivial arithmetic Frobenius on the new roots means ℓ^{e+1}∤N𝔭−1. Use a squarefree one- or two-prime product and the Chinese remainder theorem.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`, `tauceti:TauCetiRoadmap/Chebotarev#layer-4-cyclotomic-galois-characters`, `KTheoryLowDegrees:U.4/relative-first-row-map`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 3 and proof following Lemma 4, pp.495–496.

### One root-of-unity exponent works for every row

**Lemma:** `KTheoryLowDegrees:U.4/serre-uniform-diagonal-commutator`; proposed declaration `serre_uniform_diagonal_commutator`.

With m=#μ(F), h(u)^m commutes with every σ∈Γ₂(I) modulo SerreElementary I for every u∈Aˣ.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Use serre-unit-exponent-row-choice for each ℓ and serre-diagonal-congruence-commutator on the resulting relative row.
2. The gcd of the permitted residue-unit exponents divides m. Bézout combines the diagonal powers; recover the original row class.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-unit-exponent-row-choice`, `KTheoryLowDegrees:U.4/serre-diagonal-congruence-commutator`, `KTheoryLowDegrees:U.4/serre-relative-row-relations`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 3, pp.494–496.

### Serre relative quotients have surjective transitions

**Lemma:** `KTheoryLowDegrees:U.4/serre-level-transition-surjective`; proposed declaration `serre_level_transition_surjective`.

For nonzero J≤I the inclusion induces a surjection Γ₂(J)/SerreElementary J→Γ₂(I)/SerreElementary I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. The parent smaller-ideal row equivalence replaces every relative row at I by a row at J.
2. Use serre-relative-row-relations to lift that equivalence to relative matrix classes.

Direct prerequisites: `KTheoryLowDegrees:U.4/q-equivalence-smaller-ideal`, `KTheoryLowDegrees:U.4/serre-relative-row-relations`, `KTheoryLowDegrees:U.4/serre-relative-elementary`.

Acceptance: Verify that the parent row equivalences use only Serre-allowed moves; recorded as a comparison refinement gap.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §2.4, p.496 (BMS Lemma 2.3).

### Rational conjugation acts on the relative inverse limit

**Lemma:** `KTheoryLowDegrees:U.4/serre-rational-conjugation-refinement`; proposed declaration `serre_rational_conjugation_refinement`.

For g∈SL₂(F) and nonzero I, there is nonzero J with gΓ₂(J)g⁻¹≤Γ₂(I) and gSerreElementary J g⁻¹≤SerreElementary I. Hence conjugation defines an action on C=lim_I Γ₂(I)/SerreElementary I.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits.

Proof or construction:

1. Clear denominators for the first containment.
2. Apply serre-normalizer-root-level to a suitable noncentral root subgroup normalized by an arithmetic intersection, and refine J for the second containment.
3. Independence of J and functor laws follow after a common smaller level.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-normalizer-root-level`, `KTheoryLowDegrees:U.4/serre-level-transition-surjective`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 5, pp.496–497.

### Rational conjugation on the Serre inverse limit is trivial

**Lemma:** `KTheoryLowDegrees:U.4/serre-abstract-limit-centrality`; proposed declaration `serre_abstract_limit_centrality`.

Assume r₁+r₂+|S|≥2. The action of SL₂(F) on C=lim_I Γ₂(I)/SerreElementary I is trivial.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. By serre-uniform-diagonal-commutator, the kernel of the action contains h(u)^m for an infinite-order unit u.
2. The kernel is normal and is not contained in the center; use simplicity of PSL₂(F) to obtain the whole group.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-rational-conjugation-refinement`, `KTheoryLowDegrees:U.4/serre-uniform-diagonal-commutator`, `KTheoryLowDegrees:U.4/s-unit-theorem`.

Acceptance: Simplicity of PSL₂ over an infinite field needs a precise supplier; it is a listed gap, and finite target automorphisms cannot be used before finiteness.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 4, p.497.

### Every relative SL₂ defect quotient is central

**Lemma:** `KTheoryLowDegrees:U.4/serre-quotient-centrality`; proposed declaration `serre_quotient_centrality`.

For every nonzero I, Γ₂(I)/SerreElementary I is central in SL₂(A)/SerreElementary I and therefore abelian.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. There are countably many ideals, and serre-level-transition-surjective makes the projection from the abstract inverse limit to each quotient surjective by recursive compatible lifts.
2. Use serre-abstract-limit-centrality to show every quotient class is fixed under SL₂(A).

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-level-transition-surjective`, `KTheoryLowDegrees:U.4/serre-abstract-limit-centrality`.

Acceptance: This argument uses countability of number-field ideals; compactness of these not-yet-finite quotients would be circular.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Corollary to Proposition 4, p.497.

### Serre’s abelian relative quotients are finitely generated

**Lemma:** `KTheoryLowDegrees:U.4/serre-defect-finite-generation`; proposed declaration `serre_defect_finite_generation`.

For number fields, Γ₂(I)/SerreElementary I is a finitely generated abelian group.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. SL₂(A) is finitely generated by the arithmetic SL₂ finite-generation supplier quoted in §1.2.
2. Γ₂(I) has finite index by arithmetic-congruence-index, so Schreier gives finite generation; use serre-quotient-centrality for commutativity.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-congruence-index`, `KTheoryLowDegrees:U.4/serre-quotient-centrality`.

Acceptance: O’Meara Theorem 24.8 is quoted by Serre; its proof and exact library supplier were not established here and remain a gap.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §1.2, p.490; §2.4 corollary, p.497.

### The SL₂ congruence kernel uses completed relative defects

**Lemma:** `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`; proposed declaration `serre_completed_defect_kernel`.

Without first assuming SerreElementary I has finite index, the kernel C(G) is the inverse limit of the profinite completions of the finitely generated abelian quotients Γ₂(I)/SerreElementary I. It is central in the rational arithmetic completion.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. Use serre-finite-index-containment for cofinality of Serre levels among finite-index normal subgroups.
2. Within each quotient retain all finite quotients, not the uncompleted quotient itself.
3. Use serre-quotient-centrality and compatible rational conjugation, then density, for centrality of the resulting completed kernel.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-finite-index-containment`, `KTheoryLowDegrees:U.4/serre-defect-finite-generation`, `KTheoryLowDegrees:U.4/serre-rational-conjugation-refinement`, `KTheoryLowDegrees:U.4/serre-quotient-centrality`, `mathlib:ProfiniteGrp.profiniteCompletion`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `KTheoryLowDegrees:U.4/rational-completions-lattice-open`.

Acceptance: The rational completion input must be generalized to this cofinal system; no use of arithmetic-elementary-index for n=2.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 5, §2.5, pp.497–498.

### The central SL₂ congruence extension is the relative universal cover

**Lemma:** `KTheoryLowDegrees:U.4/serre-relative-universal-cover`; proposed declaration `serre_relative_universal_cover`.

Under r₁+r₂+|S|≥2, the rational arithmetic completion of SL₂(F)→its congruence completion is the universal central extension relative to the dense rational group in Moore’s sense.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. Use serre-completed-defect-kernel for centrality.
2. For an arbitrary relative central cover, compactness yields commuting roots at some congruence level; compare with Serre’s elementary normal closure and the arithmetic completion.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`, `KTheoryLowDegrees:U.4/serre-relative-elementary`.

Acceptance: Moore’s relative-cover category and its lifting theorem must be supplied externally; no new opaque cover predicate is introduced in Suggested.lean.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Theorem 1 and proof, §2.6, pp.498–500.

### Serre’s infinite-unit-rank congruence kernel theorem

**Theorem:** `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`; proposed declaration `serreInfiniteUnitCongruenceKernel`.

For a number field F, S finite with r₁+r₂+|S|≥2, the SL₂ arithmetic congruence kernel is finite central: it is trivial when S≠∅ or F has a real place, and isomorphic to μ(F) otherwise.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. Use serre-relative-universal-cover and Moore’s relative fundamental-group computation quoted as Theorem 12.3.
2. Transfer the resulting finite central group to the lattice kernel.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-universal-cover`.

Acceptance: CM quartic with S=∅ satisfies the rank hypothesis. ℚ and imaginary quadratic fields at S=∅ do not; no finite-kernel conclusion is stated there.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Theorem 2, §2.6, p.499.

### Finiteness descends from completed quotients to Serre levels

**Lemma:** `KTheoryLowDegrees:U.4/serre-elementary-index-after-completion`; proposed declaration `serre_elementary_index_after_completion`.

Under Serre’s infinite-unit-rank hypotheses, Γ₂(I)/SerreElementary I is finite and SerreElementary I has finite index in SL₂(A).

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. F is a number field, S is a finite set of finite primes and A=O_{F,S}. Nonzero levels are used in quotient limits. The infinite-unit hypothesis is r₁+r₂+|S|≥2; quotient centrality and finite generation in this proof use that hypothesis.

Proof or construction:

1. The finite congruence kernel surjects onto the profinite completion of each defect quotient.
2. A finitely generated abelian group whose profinite completion is finite is finite.
3. Combine with arithmetic-congruence-index.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`, `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`, `KTheoryLowDegrees:U.4/serre-defect-finite-generation`, `KTheoryLowDegrees:U.4/arithmetic-congruence-index`.

Acceptance: Retain every displayed rank and ideal-level hypothesis; test the zero ideal separately from nonzero arithmetic levels.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 5 corollary and Theorem 2 consequence, pp.498–499.

## Localized cohomology declarations

### Finite kernel obstruction to descending mod-p characters

**Lemma:** `KTheoryLowDegrees:U.4/cg-congruence-kernel-characters`; proposed declaration `cg_congruence_kernel_characters`.

Let Γ be an arithmetic lattice with finite central congruence kernel C and k a finite field of characteristic p. If p∤|C|, every homomorphism Γ→k_add extends to Γ̂ and kills C, hence descends continuously to Γ̄. If p∣|C|, restriction to C can be nonzero and is retained as a separate term.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. The cases are GL₂ over a CM quartic field or GL₃ over ℚ, with the actual level and arithmetic components of CG Remark 9.3. Coefficients are a finite residue field with trivial lattice action; localization uses a non-Eisenstein maximal Hecke ideal and the stated support/dual hypotheses.

Proof or construction:

1. A finite-target homomorphism extends by the profinite universal property.
2. The additive target has p-power exponent; coprimality forces a homomorphism C→k_add to vanish.
3. Use the quotient universal property to descend when its kernel contains C.

Direct prerequisites: `KTheoryLowDegrees:U.4/higher-rank-lattice-congruence-kernel`, `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`, `mathlib:ProfiniteGrp.ProfiniteCompletion.lift`.

Acceptance: The finite group μ(F) can have nonzero mod-p characters when p divides its order; finiteness alone does not prove mod-p H¹ vanishing.

Source: [CG.2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), CG Remark 9.3, PDF physical p.119; BMS Theorem 14.1, pp.129–130.

### Separate determinant and special-linear characters

**Lemma:** `KTheoryLowDegrees:U.4/cg-determinant-character-interface`; proposed declaration `cg_determinant_character_interface`.

For each GL lattice component in the CM-quartic GL₂ or rational GL₃ cases of CG Remark 9.3, restrict degree-one trivial-coefficient characters to its determinant-one subgroup. The remaining quotient factors through its determinant image. Transfer both this quotient and the congruence-kernel contribution with their Hecke actions.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. The cases are GL₂ over a CM quartic field or GL₃ over ℚ, with the actual level and arithmetic components of CG Remark 9.3. Coefficients are a finite residue field with trivial lattice action; localization uses a non-Eisenstein maximal Hecke ideal and the stated support/dual hypotheses.

Proof or construction:

1. Use the exact kernel/image sequence of determinant on the actual arithmetic component, including its level and connected-component choices.
2. Apply the appropriate U.4 congruence-kernel theorem to the determinant-one subgroup via finite-index comparison.
3. Use the ALS component and group-cohomology comparisons; request the Hecke-support theorem for these determinant and congruence terms.

Direct prerequisites: `KTheoryLowDegrees:U.4/cg-congruence-kernel-characters`, `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`, `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.4`.

Acceptance: Hecke compatibility under finite-index restriction, including bad characteristic, is an explicit supplier gap. The SL theorem alone does not identify the whole GL cohomology.

Source: [CG.2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), CG Remark 9.3, PDF physical p.119.

### The congruence theorem’s localized H¹ consumer

**Application:** `KTheoryLowDegrees:U.4/cg-localized-h1-vanishing`; proposed declaration `cgLocalizedH1Vanishing`.

In the CM-quartic GL₂ and GL₃/ℚ cases of CG Remark 9.3, with trivial finite residue coefficients and a non-Eisenstein Hecke maximal ideal, H¹ of the locally symmetric space localized at that ideal is zero, provided the Hecke-support inputs show that determinant characters, continuous congruence-completion characters, and any finite-central-kernel characters all have Eisenstein support.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. The cases are GL₂ over a CM quartic field or GL₃ over ℚ, with the actual level and arithmetic components of CG Remark 9.3. Coefficients are a finite residue field with trivial lattice action; localization uses a non-Eisenstein maximal Hecke ideal and the stated support/dual hypotheses.

Proof or construction:

1. Use ALS component-decomposition and group-cohomology-comparison to reduce to lattice characters.
2. Use cg-determinant-character-interface and the Hecke-equivariant inflation/restriction sequence.
3. Apply ALS localization-at-maximal-ideal to annihilate the three Eisenstein-supported contributions.

Direct prerequisites: `KTheoryLowDegrees:U.4/cg-determinant-character-interface`, `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`, `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`.

Acceptance: This is the conditional arithmetic-to-Hecke interface. The unconditional Hecke-support input remains a gap. The imaginary quadratic GL₂ case of the remark uses a separate method and is not a Serre infinite-unit-rank consequence.

Source: [CG.2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), CG Remark 9.3, PDF physical p.119.

### Duality and boundary transfer the localized vanishing

**Application:** `KTheoryLowDegrees:U.4/cg-compact-support-degree-one-interface`; proposed declaration `cg_compact_support_degree_one_interface`.

For the CM-quartic GL₂ and GL₃/ℚ cases, q₀=2. If the ALS supplier establishes vanishing at the degree complementary to compactly supported degree one, with its Hecke-dual maximal ideal, Poincaré duality gives H_c¹ localized vanishing. The boundary triangle then identifies this with ordinary localized H¹ under the boundary-Eisenstein hypotheses. The complementary-degree input is recorded as a gap; it is not deduced from H¹ vanishing alone.

Hypotheses: A is a commutative unital ring; I is an ideal; C is an arbitrary group where used. The cases are GL₂ over a CM quartic field or GL₃ over ℚ, with the actual level and arithmetic components of CG Remark 9.3. Coefficients are a finite residue field with trivial lattice action; localization uses a non-Eisenstein maximal Hecke ideal and the stated support/dual hypotheses.

Proof or construction:

1. Apply the Hecke-equivariant duality supplier to the requested complementary-degree vanishing, with both the maximal ideal and its dual.
2. Apply ALS boundary-triangle and gln-boundary-eisenstein with their exact coefficient and orientation hypotheses.

Direct prerequisites: `KTheoryLowDegrees:U.4/cg-localized-h1-vanishing`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`, `ArithmeticLocallySymmetricSpaces:ALS.4`.

Acceptance: Duality is used at the appropriate complementary degree; the needed intermediate-degree vanishing and Hecke-dual comparison are supplied by ALS, not claimed from H¹ alone.

Source: [CG.2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), CG Remark 9.3, PDF physical p.119.

## Supplier contracts

These are exact open interfaces, not assertions that the supplier has already completed the extension. The inherited seven arithmetic contracts are repeated only for new consuming declarations.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

For finite extensions k/ℚ_p containing μ_m, the named cohomological localSymbol at kummerCupPairing ζ, bilinearity, Steinberg and antisymmetry, and nondegeneracy from tateDualityPairing_perfect_mixed. This is ClassFieldTheory layer 5's cohomological scope. The comparison with BMS reciprocity orientation and the openness/finite index of k^{×m}, including archimedean cases, are separately recorded gaps; layer 5 explicitly forbids local reciprocity.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

For number fields, rayClassArtinMap at an admissible modulus, its unramified-prime splitting law and surjectivity. Supply the admissibility proof; ramification support alone is insufficient. This is the ray-class form of BMS (A.5).

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

For a modulus 𝔪 over a number field, the ray class field and gal_rayClassField_equiv_rayClassGroup, normalized through the Artin map, with conductor dividing 𝔪. Use CFT layer 13’s construction from layer 12 and the GlobalNumberFields ray quotient.

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

For a finite Galois extension of number fields, infinitude of the unramified primes in each Frobenius conjugacy class, and invariance under deletion of finitely many primes. In the abelian case this selects any requested automorphism; it is BMS (A.6).

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-4-cyclotomic-galois-characters

The cyclotomic extension K(ζ_m)/K is abelian, with the chosen arithmetic Frobenius at 𝔭∤m transported to an automorphism and an ideal Q of its integer ring lying over 𝔭. The norm-power and character formulas themselves are pinned baseline AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one and autToPow_eq_absNorm, as CH-L18 records; supply their actual IsArithFrobAt and LiesOver hypotheses, rather than re-plan those formulas.

Consumers: `KTheoryLowDegrees:U.4/serre-unit-exponent-row-choice`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary

Every open subgroup of IdeleClassGroup K contains RaySubgroup 𝔪 for a modulus 𝔪. Supply the surjective rayClassQuotient with that kernel and its prime-idèle/ray-class dictionary away from 𝔪, as GlobalNumberFields layer 7 requires.

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

On Mathlib’s NumberField.IdeleClassGroup, the norm homomorphism and compactness of its norm-one subgroup. These are the GlobalNumberFields layer 6 inputs for BMS (A.4); compactness of the full idèle class group is not requested.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

In the finite local Artin normalization, compare the degree-m cohomological Kummer pairing with Art_v(b) acting on an mth root of a divided by that root, the BMS orientation. The existing degree-two dictionary is insufficient. Extend the degree-m dictionary, finite-index openness of K_v^{×m}, tame formula and mixed-characteristic higher-unit images (A.13)–(A.18), including the real/complex cases separately. These extensions are unresolved and require an upstream scope decision; no new local symbol is owned here.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

The global Artin map kills principal idèles and agrees with normalized local Artin maps. This supplies the proof of the degree-m product formula once CA.1 consumes the degree-m local dictionary; the higher-power reciprocity specialization remains CA.1-owned.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`.

### tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations

Unbundled cofinal finite-quotient descriptions, compact compatible-lift existence, and the completion universal property for abstract lattice groups. For Serre use profinite completions of quotient groups before they are known finite. This request does not include the noncompact rational arithmetic two-sided completion.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`, `KTheoryLowDegrees:U.4/arithmetic-kernel-level-comparison`, `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`.

### ArithmeticLocallySymmetricSpaces:ALS.4

For the CM-quartic GL₂ and GL₃/ℚ cases of CG Remark 9.3, Hecke-equivariant determinant/SL inflation-restriction and finite-index transfer at residue characteristic p; Eisenstein support of determinant characters, characters of the congruence completion and the finite central kernel, including p dividing #μ(F); the dual complementary-degree vanishing used for compactly supported H¹ and its Hecke-dual ideal. Existing generic boundary-Eisenstein and localization nodes alone do not establish these arithmetic character-support assertions.

Consumers: `KTheoryLowDegrees:U.4/cg-determinant-character-interface`, `KTheoryLowDegrees:U.4/cg-compact-support-degree-one-interface`.

## Remaining proof inputs

U.4 is planned: every target has a declaration or an imported owner, and each chain ends at checked library statements, owner nodes, a requested stage, or the precise gaps below. It is not closed.

### Reciprocity supplier cycle and orientation

CA.1 owns tame-Hilbert-symbol-formula, hilbert-product-formula-of-degree-n and power-reciprocity-law, but all still depend on K2SymbolsBrauer:T.7. The path T.7←T.3←T.2←K3BlochGroups:V.2←ArithmeticKTheory:N.5←U.4 closes a cycle. No CA.1 prerequisite is imported in this continuation. First replace those arithmetic prerequisites by the acyclic local/global Artin inputs. CA.1 uses Art_v(a)(root b), while BMS uses Art_v(b)(root a). The current power-reciprocity-law also excludes b at primes over m; BMS (A.21) needs a prime to bm but permits b over m. Supply that transposed specialization, retaining wild and archimedean terms.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`.

### Higher-unit and local Artin interfaces

BMS (A.13)–(A.15) require the full degree-m Artin dictionary and openness/finite index of K_v^{×m}. For K_v/ℚ_p containing μ_{pⁿ}, e=ord_v(p), U_h=1+𝔭^h (U_0 the units), j=clip_[0,n](floor(h/e−1/(p−1))), (A.17) identifies the two degree-pⁿ symbol images on U_h×U_0 and U_{h+1}×K_vˣ with μ_{p^{n−j}}. The second argument changes from units to all nonzero elements when the first filtration level changes. (A.18) controls the degree-p^j symbol as a function of a modulo b for a∈U_h and ord_v(b)≥h, and makes it 1 at ord_v(b)=h. The proof pp.87–89 reduces by norm/Kummer induction to local ramification results from Corps locaux XIV. That book was not read; the public BMS statement and reduction were read. CFT layer 5 is cohomological and expressly omits reciprocity. The layer 6 scope must be extended; degree-two compatibility is insufficient.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`.

### Exact-level arithmetic symbol surjectivity

BMS Theorem 3.6 p.78 labels surjectivity immediate. The node’s local-value/prime-choice proof requires a checked construction preserving level I and realizing a generator in each μ_{p^j}, including j=0. This construction remains a refinement after the local image supplier is available.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`.

### Rank-two pair-choice details

The semilocal choice at p.118 must produce s∈I and c=1+sy₁≠0 simultaneously. The inherited square-adjustment lemma alone does not prove that exact choice. Separate the quotient residue-class choice, avoidance of the one forbidden scalar, and field/zero-level cases.

Consumers: `KTheoryLowDegrees:U.4/swap-rank-two-pair-choice`.

### Finite residue-ring bridge

The S-integer localization presentation is inherited, but the exact baseline theorem that a nonzero O_F ideal contains a nonzero integer, and finiteness after the stated localization, was not fully checked. Supply those two arithmetic refinements before claiming the index proof closed.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-ring-finite`.

### Two-sided rational group completion

Need Hausdorff two-sided completion for the arithmetic and congruence topologies on noncompact SL_n(F), an open-subgroup completion theorem, and the denominator/conjugation refinement proof. Mathlib’s uniformGroup construction requires the two uniformities to agree globally and cannot be invoked for this non-SIN group. The lattice profinite completion is already in Mathlib; only the rational ambient completion and its compatibility are missing. No covering atlas stage with a precise statement was found.

Consumers: `KTheoryLowDegrees:U.4/rational-completions-lattice-open`, `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`.

### Serre algebraic normal-subgroup input

Need arithmetic SL₂ Zariski density, proper normal algebraic subgroups central, and simplicity of PSL₂(F) for the infinite number field. Serre uses these at pp.492 and 497; an exact baseline declaration or owner specialization has not been established.

Consumers: `KTheoryLowDegrees:U.4/serre-noncentral-root-choice`, `KTheoryLowDegrees:U.4/serre-abstract-limit-centrality`.

### Serre root-ideal and row-transition refinements

Finish the p.493 root-producing calculation and its ideal/normal-closure step in Proposition 2. Compare BMS Lemma 2.3 row moves with Serre Lemma 1 to prove quotient transition surjectivity without replacing SerreElementary by the E₂-ambient closure.

Consumers: `KTheoryLowDegrees:U.4/serre-normalizer-root-level`, `KTheoryLowDegrees:U.4/serre-level-transition-surjective`.

### Arithmetic SL₂ finite generation

Serre §1.2 p.490 invokes O’Meara Theorem 24.8 for finite generation of arithmetic SL₂ over number fields. That external proof was not read and no exact supplier was found. It is needed for the finitely generated abelian quotient to be recovered from its finite profinite completion.

Consumers: `KTheoryLowDegrees:U.4/serre-defect-finite-generation`.

### Moore relative universal-cover theory

Serre Theorem 1 p.498 uses Moore Theorem 13.1; Theorem 2 pp.498–499 uses Moore Theorem 12.3 to compute the relative fundamental group. Need the category of central covers relative to the rational splitting and the normalized calculation μ(F) versus the trivial group. Moore’s paper was not read in this pass. This mathematics is a supplier boundary rather than a new opaque Prop-valued notion in the suggested file.

Consumers: `KTheoryLowDegrees:U.4/serre-relative-universal-cover`, `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`.

### CG Hecke support and dual degree

The source supplies the localized-vanishing assertion, but the actual Hecke support calculation is not supplied by the finite central kernel theorem. Establish the three character contributions and their Eisenstein support, including p dividing the central order, under actual GL component/level hypotheses. For compactly supported H¹, identify the complementary-degree input and dual Hecke ideal instead of inferring it from ordinary H¹ vanishing. General boundary localization is already owned by ALS.4.

Consumers: `KTheoryLowDegrees:U.4/cg-determinant-character-interface`, `KTheoryLowDegrees:U.4/cg-localized-h1-vanishing`, `KTheoryLowDegrees:U.4/cg-compact-support-degree-one-interface`.

## Source corrections and ownership

The published 1974 erratum withdraws BMS A.23(b), while preserving A.23(c) with a transfer argument. The accepted parent records this as E112; none of these new statements uses the false numerical formula. Its A.10 prime-choice correction E115 is also retained through the existing node contracts.

- **KTheoryLowDegrees/E116**, Conclusion of §10, published Numdam scan, p.119: The retrospective citation identifies the Mennicke proof of part (b) as Theorem 5.1. The relevant result is Theorem 5.4, pp.101–103; (5.1) is a commutator equation. The theorem statement on p.101 gives exactly the Mennicke factorization used for Theorem 4.1(b). No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists.

- **KTheoryLowDegrees/E117**, Proof of Proposition 4, published author-hosted scan, p.497: The proof attributes trivial action of h(u)^m to Proposition 2. Use Proposition 3, pp.494–496, which states the diagonal commutator bound. Proposition 2 is the noncentral arithmetic-normalized subgroup result; Proposition 3 gives exactly the uniform diagonal power used. The alternative argument on p.498 also cites Proposition 3. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists.

- **KTheoryLowDegrees/E118**, Theorem 6.1, p.103, inspected in the published scan: The ring-type adjective in the theorem has an incorrect final letter. The hypothesis is a Dedekind ring. The surrounding chapter and the hypotheses of the theorem specify precisely Dedekind rings; this is a spelling misprint, with no mathematical change. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists.

CA.1 arithmetic reciprocity depends on the K₂ sequence whose arithmetic specialization consumes U.4. The proposed U.4 import would be cyclic. Keep all degree-m symbols and higher reciprocity under CA.1. Replace its K2SymbolsBrauer:T.7 proof prerequisites for the three arithmetic-symbol nodes by CFT local/global Artin inputs and the exact transposed BMS specialization. After that change, U.4 imports the existing CA.1 node IDs. No upstream-to-upstream link is edited here.

The accepted U.1 part already has six U.4 planets. This continuation introduces none, so assembling it does not exceed the per-layer limit. U.4 now has coherent finite-symbol, arithmetic-defect and SL₂/consumer sub-directions. Split U.4 into Finite Mennicke extension (the inherited symbol/Kubota/standard-form nodes and the new swap, extended-hom, finite quotient and commutator nodes), Arithmetic S-units and relative defects (the inherited S-unit and absolute determinant targets and the new order, residue-symbol, level-transition and valuation-rank nodes), and Arithmetic completions and cohomology (the new index/completion, Serre and CG nodes). Choose finite-rank extension and finite relative Mennicke universality on the first sublayer, arithmetic congruence defect on the second, and Serre’s congruence theorem on the third, keeping at most six planets on each. Until this split is accepted, retain the six inherited planets.

The six inherited U.4 planets remain the choices until a sublayer split is accepted; this continuation adds no planet to the existing star. General higher reciprocity remains CA.1-owned, class formations and Artin normalization remain ClassFieldTheory-owned, profinite limit infrastructure remains ProfiniteProPGroups-owned, and Hecke/cohomology infrastructure remains ALS-owned. No existing roadmap is replanned.

## Checked baseline declarations

Every statement below was read in its pinned source file, not inferred from its name. Tau Ceti statements were read through the pinned source objects. The module names are source references, not additional deliverables.

| Declaration | Source module | Input used here |
| --- | --- | --- |
| `mathlib:ClassGroup.mk0_eq_one_iff` | `Mathlib/RingTheory/ClassGroup/Basic.lean` | The class of a nonzero ideal is trivial iff the ideal is principal. |
| `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | The class group of 𝓞 K is finite. |
| `mathlib:NumberField.Units.finrank_eq` | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` | finrank ℤ of the units is rank K. |
| `mathlib:NumberField.Units.rank` | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` | The unit rank card(InfinitePlace K) − 1. |
| `tauceti:Set.unitEmptyEquivUnits` | `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` | The ∅-units are the units of R. |
| `tauceti:Set.unitValuation` | `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` | The S-valuation map S-units → ℤ^S. |
| `tauceti:Set.unitValuation_ker` | `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` | Its kernel is the ∅-units (left exactness of 1 → Rˣ → O_Sˣ → ℤ^S). |
| `tauceti:Set.unit_fg_of_units` | `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` | For finite S and finitely generated Rˣ, the S-units are finitely generated. |
| `mathlib:QuotientGroup.mk'` | `Mathlib/GroupTheory/QuotientGroup/Defs.lean` | The canonical homomorphism to a quotient by a normal subgroup. |
| `mathlib:QuotientGroup.lift` | `Mathlib/GroupTheory/QuotientGroup/Defs.lean` | A homomorphism killing the specified normal subgroup descends to its quotient. |
| `mathlib:QuotientGroup.quotientKerEquivOfSurjective` | `Mathlib/GroupTheory/QuotientGroup/Basic.lean` | First-isomorphism equivalence for an actual surjective homomorphism. |
| `mathlib:Matrix.SpecialLinearGroup.toGL` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | The canonical homomorphism embedding determinant-one matrices in GL. |
| `mathlib:NumberField.Units.torsionOrder` | `Mathlib/NumberTheory/NumberField/Units/Basic.lean` | The finite cardinality of the ordinary unit torsion subgroup, equal to the number of roots of unity in the number field. |
| `mathlib:Matrix.SpecialLinearGroup.transvection` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | The native determinant-one elementary matrix over any commutative ring, with explicit distinct indices. |
| `mathlib:Subgroup.normalClosure` | `Mathlib/Algebra/Group/Subgroup/Basic.lean` | Normal closure in the explicitly specified ambient group, not another ambient normal closure. |
| `mathlib:ProfiniteGrp.profiniteCompletion` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean` | The functor GrpCat → ProfiniteGrp; only the arithmetic lattice, not its rational ambient group, is profinitely completed here. |
| `mathlib:ProfiniteGrp.ProfiniteCompletion.lift` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean` | The categorical universal morphism from the profinite completion to a given profinite group. |
| `mathlib:ProfiniteGrp.toLimit_surjective` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Limits.lean` | Every compatible family in the finite open-normal quotients of an existing profinite group is attained. |
| `mathlib:ProfiniteGrp.toLimit_injective` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Limits.lean` | Finite open-normal quotient coordinates separate elements of an existing profinite group. |

## Source record and suggested forms

Sources were read on 9 October 2026. BMS means the published Numdam scan; Serre 1970 means the author-hosted published scan; Serre 1974 means the public published erratum. CG is an author-hosted publisher-layout article. Its Remark 9.3 is cited by physical PDF page 119 because that copy lacks journal page numbers. No book text or source passage is reproduced.

- [Solution of the congruence subgroup problem for SLₙ (n ≥ 3) and Sp₂ₙ (n ≥ 2)](https://www.numdam.org/item/10.1007/BF02684586.pdf), Hyman Bass, John Milnor and Jean-Pierre Serre, Publications Mathématiques IHÉS 33 (1967), 59–137. Read: §3 Theorem 3.6, pp.77–79; §4 Theorem 4.1 and Corollaries 4.2–4.3, pp.94–96; §5 Theorem 5.4 and Lemma 5.5, pp.101–103; §§7–11, pp.105–121, with the last-swap matrices pp.115–119 inspected in the scan; §14, pp.128–130; §15 Theorem 15.1, pp.130–131; Appendix (A.13)–(A.23), pp.85–92; (A.17)–(A.18) statement p.86 and proof pp.87–89. SHA-256: `b455790cdaeba5e3a313f1bd4dddfe2892e8a2035067bcdef434ef717edfb996`.

- [Le problème des groupes de congruence pour SL₂](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Jean-Pierre Serre, Annals of Mathematics 92 (1970), 489–527; author-hosted published scan. Read: Introduction and §1, pp.489–492; §2.1–§2.6, pp.492–500; Proposition 5 and Theorems 1–2 pp.498–499; §3.1 Theorem 6, pp.504–505, the excluded finite-unit-rank cases. SHA-256: `2a079cca247de1b4765a4c5cb0d70ef1351ee192115fa34a9cd41c3fa1ec5e37`.

- [On a functorial property of power residue symbols](https://www.numdam.org/item/10.1007/BF02685884.pdf), Jean-Pierre Serre, Publications Mathématiques IHÉS 44 (1974), 241–244, published erratum to BMS. Read: Entire four-page article, Theorems 1–4; A.23(b) withdrawn, A.23(c) retained with transfer proof. SHA-256: `2f52d05a0f1ff1563d9da85efd8b224d1e110d9f67c940f3d9c0bbd2051184f9`.

- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Frank Calegari and David Geraghty, Inventiones Mathematicae 211 (2018), 297–433; author-hosted article. Read: §9.3 Conjecture B and Remark 9.3, PDF physical pp.118–120, Remark 9.3 on physical p.119; publisher-layout author copy lacks journal page numbers. SHA-256: `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5`.

The [suggested file](../suggested/KTheoryLowDegrees--U.4.lean) is a stand-alone Mathlib slice of the new interfaces. Its Inherited namespace only supplies prototypes of already owned inputs. Assembly should import the existing definitions. It includes all four new definitions/constructions, twenty API items and sixteen unit tests, with explicit noncommutative targets and native matrix, quotient, unit-torsion and normal-closure carriers. The Gaussian test exposes its arithmetic profile. The S-integer finite-defect signature takes the inherited Dedekind instance and nonzero ideal contraction explicitly.

The named lattice/rational/SL₂ completion results and the conditional CG localization result cannot yet be stated against concrete supplier objects. They remain in the mathematical catalogue, and their suggested signatures are omitted under the protocol’s rule for conditions that cannot yet be stated. No opaque predicate stands in for them. The complete suggested file elaborates at the pinned Mathlib with automatic implicit variables disabled and only proof-placeholder warnings; this checks signatures, not proofs.

Confirmed findings: RT-AREA-ktheory-1/24 uses the existing S-unit theorem, now backed by the valuation-image rank refinements; /25 uses the existing arithmetic prime-choice nodes and exact CFT/Chebotarev/global-number-field contracts, with the reciprocity cycle and normalization mismatch stated explicitly.
