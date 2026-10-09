# S-integers, finite Mennicke defects and arithmetic congruence kernels

This continuation of **KTheoryLowDegrees:U.4** builds on the accepted [U.1 plan](KTheoryLowDegrees--U.1.md). It completes the finite-rank extension argument, specifies the arithmetic relative defect at every nonzero level, defines the congruence kernel of the S-arithmetic lattice, and plans its computation for SLₙ with n≥3 (Bass–Milnor–Serre) and for SL₂ when the unit group is infinite (Serre), with the degree-one consumer interface of Calegari–Geraghty. The stable K₁ model, Mennicke symbols, Kubota homomorphism and standard-form function retain their existing owners and identifiers. Every statement here is a plan; no formal implementation is asserted.

The principal arithmetic distinction is between the absolute and relative problems. For a number field F and a finite set S of finite primes, the determinant identifies K₁(O_{F,S}) canonically with O_{F,S}ˣ. A decomposition of these units into torsion and a free lattice requires a choice of fundamental S-units. In contrast, Γₙ(I)/Eₙ(A,I) at a nonzero ideal can be nontrivial even when absolute SK₁(A) vanishes: in the totally complex, S=∅ case its normalized order depends on the depth of I at primes above roots-of-unity orders. These finite relative groups, rather than absolute SK₁, form the congruence-kernel system.

The original targets remain the following accepted declarations. They are imported, not recreated in this part. The three valuation-image lemmas below split the rank proof of the existing S-unit theorem into library-level steps; at assembly the parent theorem cites the last of them.

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

In the SL₂ declarations E₁₂(t) and E₂₁(t) are Serre's names for the upper and lower roots e₀₁(t) and e₁₀(t), and h(u)=diag(u,u⁻¹). For a number field, S contains finite places only; r₁ and r₂ count real places and conjugate pairs of complex places. The group μ(F) is all roots of unity. At a nonzero integral ideal, ordᵥ(I) is its prime factorization exponent. The pinned Tau Ceti valuation has multiplicative value exp(−ordᵥ); hence a generator of vʰ has additive valuation vector −h eᵥ. The inverse supplies +h eᵥ. No order-of-vanishing convention is imposed on the zero ideal.

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed audit gives ordinary units in Mathlib and S-unit finite generation plus the valuation kernel in Tau Ceti; it does not give the S-unit rank or this finite Mennicke/completion argument. Quotients, determinant-one inclusions, native elementary matrices, normal closure, class-group finiteness and profinite completion are reused. The native completion is applied to abstract arithmetic lattices. The noncompact rational arithmetic group needs a separate two-sided completion interface.

## Extending the actual standard-form value

Write r for the old corner rank. The inherited standard form of a matrix in GL_{r+1}(A,I) factors as a type-L block, the root e_{r,0}(t), and a type-R block. The function f multiplies κ's two corner values in that order. Its hypotheses at this stage are HasStableRange A r and uniform relative GLᵣ transitivity, together with the five ExtensionConditions on κ: relative elementary kernel, elementary and unit-diagonal conjugation invariance, transpose stability of the kernel, and equality on each oriented (I,t)-related pair. The target C need not be commutative.

The inherited multiplier and conjugation-stabilizer arguments reduce product preservation to one matrix P: the permutation swapping the **last two** coordinates. P is different from the endpoint reflection used in the transpose argument. Removing a right type-R factor and a permitted upper-left factor reduces the test to L(a,y)e_{r,0}(t).

The higher-rank route assumes HasStableRange A (r−1) and uniform relative GL_{r−1} transitivity. A second standard-form reduction arranges the first column of a to have 1 in its initial entry, zero interior entries, and a possible final entry. Splitting off that entry evaluates the original corner in rank r−1. Explicit multiplication evaluates PσP⁻¹ in another standard form; elementary column corrections and a GE permutation make its remaining corner agree with the first. Thus P preserves f. At r=2 this route needs stable range one. A general Dedekind domain supplies stable range two, so its initial rank-two step uses the next route. This is the precise index distinction in BMS Proposition 8.6, pp.107 and 115–117.

For the Dedekind rank-two route, κ comes from a Mennicke symbol. Arrange a₀₀≠0, treating the unit ideal separately. Since A/a₀₀A has stable range one, choose s∈I with v=s a₁₀+tc coprime to a₀₀, where c=1+sy₁; lifting a residue s′ as s=s′(1−a₀₀) keeps s in I. Relative Bézout completion gives ω∈SL₂(A,I) sending (a₀₀,v) to (1,0), and the 2×2 adjugate formula then gives ω₁₁=a₀₀ and ω₁₀=−v; c≠0 is not needed. The swapped matrix has standard-form value κ(ω)⁻¹κ(β), with first row of β equal to (a₀₀c,sd−tc a₀₁), where d=det a is a unit. Numerator and denominator symbol multiplication, the sign and unit-factor rules and the congruence c≡1 modulo sd cancel the additional factors. The output is κ(a). No determinant-one assumption is imposed on a. The matrix and symbol steps follow BMS Proposition 8.5, pp.117–119.

The swap result completes GE conjugation invariance. The inherited conditional product lemma now yields an actual homomorphism, extendedHom, whose function is exactly f. Restriction, uniqueness, composition with target maps, elementary kernel and passage of ExtensionConditions give a compatible family κₙ for every n≥2. This ordering keeps multiplicativity out of the initial definition of f.

## Finite relative universality

For n≥3, FiniteDefect n I is the native group quotient Γₙ(I)/Eₙ(A,I). Its API exposes the quotient map, surjectivity, kernel, group instance and extensionality of outgoing maps. At I=0 it is trivial. Over ℤ every nonzero ideal gives a trivial defect. The diagonal matrix diag(−1,1,1) at level 2 is in the relative GL group but has no determinant-one representative; it excludes a definition using all GL matrices.

The finite quotient first-row map must itself satisfy MS1 and MS2. A stable SK₁ symbol is insufficient for that purpose. As in BMS Theorem 5.4 and Lemma 5.5, pp.101–103, the two finite symbol laws need only invariance of the class under conjugation by Eₙ(A), which the relative commutator bound gives for n≥3 and stable range two, together with the first-row fibre and the rank-three multiplication calculation. Separately, extending the finite **GL quotient projection** produces a left inverse to quotient stabilization; surjective reduction then proves injective stabilization, and in sufficiently high rank disjoint corner reduction kills GL commutators, which injectivity brings back to rank n (Theorem 11.1, pp.119–120).

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

The residue symbol (b/a)_{r(I)} is ClassicalArithmeticCompletion's power-residue symbol of an ideal, imported directly: its definition does not depend on the reciprocity nodes that close a cycle. It is a Mennicke symbol at level I by BMS Proposition 3.1, whose proof needs reciprocity and the local higher-unit images, both recorded as gaps. Surjectivity onto μ_{r(I)}(F) is elementary: take a first entry with one simple prime factor 𝔭 not dividing r·I and a second entry that is a primitive root modulo 𝔭. Injectivity reduces to p-primary parts; when the p-part j of r(I) is zero the parent power reduction applies, and when j>0 it is BMS Theorem 3.5, Case 3, pp.75–77, planned here as power-reduction-trivial-residue. For nonzero I, the finite defect is trivial when S is nonempty or F has a real place. Otherwise the first-row-normalized isomorphism identifies it with μ_{r(I)}(F), as in BMS Corollary 4.3, pp.95–96.

Inclusion from J≤I gives a surjective defect transition. In root coordinates it is z↦z^{r(J)/r(I)}, from the deeper level to the shallower one. It is not the inclusion of root groups. Deep full-root levels are cofinal and their mutual transitions are identities on μₘ(F). The inverse limit is therefore μ(F), with projection z↦z^{m/r(I)}. This normalized compatible system is the input to the completion proof.

## Arithmetic topology and central kernels

For n≥3, elementary levels form a cofinal system among finite-index normal subgroups of the lattice Γ=SLₙ(O_{F,S}). This assertion has two parts: every arithmetic neighborhood contains an elementary level, and every nonzero elementary level has finite index. The latter follows from finite residue rings and the bound #μ(F) on the Mennicke group, without the exact value μ_{r(I)}(F); containment alone does not prove it.

The native profinite completion Γ̂ is then the inverse limit of Γ/Eₙ(A,I). The congruence completion Γ̄ is the inverse limit of Γ/Γₙ(I), and the comparison is continuous and surjective. The congruence kernel is its kernel; equivalently, the intersection over nonzero I of the closures in Γ̂ of the images of Γₙ(I), which is how it is defined on Mathlib's completion. Taking compatible kernels identifies it with the finite-defect inverse limit, so it has the group described above. Finite-target universal properties and compact compatible-lift existence belong to the profinite supplier.

The rational group G=SLₙ(F) uses arithmetic and congruence group topologies in which Γ is an open subgroup. Its completions exist by Bourbaki's theorem for a group with an open subgroup on which the left and right uniform structures agree, as Serre 1970 §1.3 p.491 notes; Mathlib's uniform-group completion does not apply, and this completion input is a recorded gap. After the comparison, the lattice kernel is the rational completion kernel. The rational group's root subgroups are divisible additive groups and generate G, so G has no nontrivial finite quotient. Its conjugation action on the finite kernel is consequently trivial; density extends this centrality to the completion. This is the higher-rank route to BMS Theorem 14.1, pp.128–130.

## The infinite-unit-rank SL₂ route

SerreElementary I is the native normal closure of the level-I upper roots **inside SL₂(A)**. Weyl conjugation supplies lower roots. Normality, level containment, monotonicity, the normal-closure universal property and the image in SL₂(F) constitute its API. The zero level, the full level over a field, the element [[3,−2],[2,−1]] of SerreElementary(2ℤ), which is not in the subgroup generated by the level-2 roots, and exclusion of a root with nonzero residue distinguish the intended object. U.5's E₂-ambient closure is not silently substituted for it.

The rank hypothesis is r₁+r₂+|S|≥2. A CM quartic with S=∅ meets it; an imaginary quadratic field with S=∅ does not. Serre's finite-index containment argument itself does not need this hypothesis. Root production, rational conjugation and inverse-limit centrality use an S-unit of infinite order, which the parent S-unit theorem supplies. The rank refinements of this part serve that theorem: class-group finiteness gives principal powers of the primes of S, so hℤ^S lies in the valuation image, and with the ordinary unit rank this gives r₁+r₂+|S|−1 (Milne, ANT Theorem 5.11).

A noncentral subgroup normalized by a finite-index part of SL₂(A) contains elements whose two first-column entries a, c have ac ≠ 0, by conjugating with level roots; an explicit computation with an infinite-order diagonal unit then produces all upper roots of a nonzero level (Serre Proposition 2, pp.492–493). The centrality proof uses relative row relations, the conjugation move by lower roots with arbitrary coefficients, a diagonal congruence commutator, and one or two primes in a ray class that do not split completely in a nontrivial cyclotomic extension. These choices bound each primary exponent of the residue-unit group. The uniform power h(u)^m centralizes each defect quotient. Conjugation refinement gives an action of SL₂(F) on the **abstract** inverse limit. An infinite-order diagonal power is in the action kernel, and the commutator formula for diagonal matrices and transvections forces the kernel to be all of SL₂(F). At this step the inverse limit has not been shown finite; an argument through a finite automorphism group would be circular.

Serre's completed kernel is the inverse limit of the **profinite completions** of the defect quotients; this description needs no finiteness. BMS Theorem 15.1 makes the arithmetic completion the universal central extension of the congruence completion split over SL₂(F), and Moore's computation of the relative fundamental group, quoted by Serre, identifies the kernel: trivial if S is nonempty or there is a real place, μ(F) otherwise. Only after that computation does finite generation of SL₂(A) imply that each uncompleted defect is finite, and hence that SerreElementary I has finite index. The proof order is Serre Propositions 1–5 and Théorèmes 1–2, pp.491–499. The two-sided completion, finite generation of arithmetic SL₂ and Moore's computation remain exact external inputs.

## The cohomology interface

Calegari–Geraghty work with G=Res_{F/ℚ}PGL_n and orbifold cohomology (§9), with p>n unramified in F (§8.5). Their Remark 9.3 names GL(2) over CM fields of degree 2 or 4 and GL(3) over ℚ; in the §9 setting these are PGL₂ over a CM quartic field (d=6) and PGL₃ over ℚ (d=5), while the imaginary quadratic case needs only degrees 0 and 3. A degree-one class with trivial residue coefficients is a family of characters of the component lattices. The PGL determinant and the centre of SLₙ have exponent dividing n, and the congruence kernel is trivial (BMS, n=3) or μ(F) (Serre, n=2), of order prime to p because p is unramified in F; so every such character is trivial on a congruence subgroup.

The Hecke-equivariant finite-cover Hochschild–Serre sequence of ArithmeticLocallySymmetricSpaces then places H¹ in a term built from H⁰ at a deeper level, and H⁰ is Eisenstein, which is the one statement requested from that roadmap; localization at a non-Eisenstein ideal kills both H⁰ and H¹. The rest of the remark — duality at the dual ideal to reach compactly supported degree d−1, then ordinary degree d−1 through the boundary — belongs to AutomorphyLiftingBeyondTaylorWiles. Its printed degree q₀−1 should read d−1 (PAPER-CALEGARI-GERAGHTY-18/E184), and its SL₂ input is Serre 1970, which the remark does not cite (E185).

The following catalogue is arranged by these mathematical interfaces, with prerequisites stated for each declaration. Short ids in the inherited-target table above have the prefix KTheoryLowDegrees:U.4/. In the catalogue, every complete id identifies a declaration uniquely. Sources are cited by theorem, section and page; all formulations and proof outlines are in our own words.

## Extension and swap declarations

### Permitted modifications preserve the swap equation

**Lemma:** `KTheoryLowDegrees:U.4/swap-stable-modifications`; proposed declaration `swap_stable_modifications`.

Under the next-rank hypotheses, the set of σ with f(PσP⁻¹)=f(σ) is stable under right multiplication by type-R matrices and left multiplication by the upper blocks (10.3).

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Old corner rank r ≥ 2; HasStableRange A r; for every ideal J, GL_r(A,J) sends each J-relative unimodular column of length r to e₀; κ : GL_r(A,I) → C is a homomorphism with ExtensionConditions (U.1 next-rank hypotheses with n + 1 = r). f = extendedValue κ on GL_{r+1}(A,I); P is the permutation matrix exchanging coordinates r−1 and r (0-based); the left factors have block shape ((α′₁, γ₁),(0, 1₂)) with α′₁ of size r−1 and lie in GL_{r+1}(A,I).

Proof or construction:

1. P fixes the (10.3) shape and type R: P L P⁻¹ has the same α′₁ with the two columns of γ₁ exchanged, and P R(b,p) P⁻¹ = R(P′bP′⁻¹, pP′).
2. Corner values are unchanged: the two corners of L and PLP⁻¹ differ from diag(α′₁,1) by a level-I last-column block in E_r(A,I); κ(P′bP′⁻¹) = κ(b) because P′ ∈ GE_r(A) and κ is invariant under elementary and diagonal conjugation.
3. Apply extended-value-two-sided to P(LσR)P⁻¹ = (PLP⁻¹)(PσP⁻¹)(PRP⁻¹) and to LσR, in this order.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-value-two-sided`, `KTheoryLowDegrees:U.4/extended-value-type-l`, `KTheoryLowDegrees:U.4/extended-value-type-r`, `KTheoryLowDegrees:U.4/extension-conditions`, `KTheoryLowDegrees:U.4/ge-subgroup`, `KTheoryLowDegrees:U.1/signed-transposition`.

Acceptance: The left factor must be level I: over ℤ with I = 2ℤ and r = 2, ((1,1,0),(0,1,0),(0,0,1)) has the (10.3) shape but left multiplication by it leaves GL₃(ℤ,2ℤ), so it is not a permitted modification. Conjugation by P maps the (10.3) shape to itself, exchanging only the two columns of γ₁, and maps R(b,p) to R(P′bP′⁻¹, pP′) with P′ the last-two swap in rank r.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 10.2(a), p.115. BMS Lemma 10.2(a) shows that the set of σ satisfying (10.1) is closed under right multiplication by type-R matrices and left multiplication by matrices of shape (10.3), by conjugating each factor by the swap and applying Lemma 8.12. The node is the same statement with 0-based coordinates and an explicit level-I requirement on the left factor.

### Reduce swap invariance to a left block and one root

**Lemma:** `KTheoryLowDegrees:U.4/swap-reduction-left-middle`; proposed declaration `swap_reduction_left_middle`.

Under the next-rank hypotheses it suffices to prove the swap equation on σ=L(a,y)e_{r,0}(t), t∈I.

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Old corner rank r ≥ 2; HasStableRange A r; for every ideal J, GL_r(A,J) is transitive on J-relative unimodular columns of length r; κ : GL_r(A,I) → C has ExtensionConditions; f = extendedValue κ on GL_{r+1}(A,I); P exchanges coordinates r−1 and r.

Proof or construction:

1. Take a standard form and remove its type-R factor using swap-stable-modifications.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-stable-modifications`, `KTheoryLowDegrees:U.4/relative-standard-form-exists`.

Acceptance: The reduction keeps the middle parameter: for σ = L(a,y)e_{r,0}(t)R(b,p) the reduced matrix L(a,y)e_{r,0}(t) has the same (r,0) entry t = σ_{r,0}. At I = 0 every σ is the identity and the reduced form is a = 1, y = 0, t = 0.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 10.2(b), p.115. First half of BMS Lemma 10.2(b): by part (a) one may strip the type-R factor of a standard form (Lemma 8.9(a)), so (10.1) need only be checked for σ = ᾱε with ᾱ of type L and ε = I + t e_{n+1,1}. Same statement in 0-based indices.

### The stronger smaller-corner reduction

**Lemma:** `KTheoryLowDegrees:U.4/swap-smaller-corner-reduction`; proposed declaration `swap_smaller_corner_reduction`.

Assume additionally r≥2, HasStableRange A (r−1) and uniform relative GL_{r−1} transitivity. In the swap test σ=L(a,y)e_{r,0}(t), permitted upper-left modifications arrange a₀₀=1 and aᵢ₀=0 for 0<i<r−1. The final entry a_{r−1,0} may remain.

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. r ≥ 2; HasStableRange A (r−1), which at r = 2 is stable range one and is used directly in the r = 2 step; for every ideal J, GL_{r−1}(A,J) is transitive on J-relative unimodular columns of length r−1 (only J = I is used here). κ : GL_r(A,I) → C has ExtensionConditions and f = extendedValue κ on GL_{r+1}(A,I), built from HasStableRange A r and GL_r transitivity, which follow from the previous line.

Proof or construction:

1. For r ≥ 3: take a standard form a = L_r(a₁,y₁)e_{r−1,0}(t₁)R_r(b₁,p₁) in GL_r(A,I) (U.1 relative-standard-form-exists with n = r−2); diag(L_r(a₁,y₁),1) is a level-I (10.3) block.
2. For r = 2: relative-shortening with k = 1 gives b ∈ I with u = a₀₀ + b a₁₀ a unit; use the (10.3) block with corner u⁻¹ and row entry u⁻¹b.
3. Left-multiply σ by the inverse of the block of step 1 (r≥3) or by the block of step 2 (r=2), allowed by swap-stable-modifications; the new corner has first column (1,0,…,0,t₁), and the last column stays in I.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-stable-modifications`, `KTheoryLowDegrees:U.4/relative-standard-form-exists`, `KTheoryLowDegrees:U.4/relative-shortening`.

Acceptance: Stable range r−1 is essential: at r = 2 over ℤ (HasStableRange ℤ 2 but not 1) with I = ℤ and a = ((2,1),(5,3)), the (10.3) modifications change a₀₀ to 2u + 5g with u = ±1 and g ∈ ℤ, which is never 1. For r = 3 over ℤ (HasStableRange ℤ 2) every a ∈ GL₃(ℤ,I) can be brought to first column (1, 0, a₂₀); a₂₀ need not vanish.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 10.2(b), (10.4), p.115. Second half of BMS Lemma 10.2(b): under (7.2)_n and (8.1)_{n−1}, a standard form of α in GL_n(A,q) (Lemma 8.9(a)) has a left factor that is a (10.3) block, so after left multiplication α takes the shape (10.4). The node states the resulting normal form in 0-based indices.

### Evaluate the original reduced corner

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-original-corner`; proposed declaration `swap_higher_original_corner`.

For the corner in (10.4), the relative elementary root 1−a_{r−1,0}e_{r−1,0} splits off its first coordinate. Its remaining (r−1)-corner a′ has a′ᵢⱼ=a_{i+1,j+1} except a′_{r−2,j}=a_{r−1,j+1}−a_{r−1,0}a_{0,j+1}; f(σ)=κ restricted to rank r−1 evaluated on a′.

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Old corner rank r ≥ 2; HasStableRange A r; for every ideal J, GL_r(A,J) is transitive on J-relative unimodular columns of length r; κ : GL_r(A,I) → C has ExtensionConditions; f = extendedValue κ on GL_{r+1}(A,I). σ = L(a,y)e_{r,0}(t) with t ∈ I, y ∈ I^r and a ∈ GL_r(A,I) of shape (10.4): a₀₀ = 1 and a_{i0} = 0 for 0 < i < r−1.

Proof or construction:

1. σ is the standard form L(a,y)e_{r,0}(t)R(1,0), so f(σ) = κ(a); κ(a) = κ(ε₁a) by the relative-elementary kernel.
2. ε₁a = diag(1,a′)·((1,ρ′),(0,1)) with ρ′ ∈ I^{r−1}; the second factor is relative elementary, so κ(a) = κ(diag(1,a′)).
3. diag(1,a′) is conjugate to diag(a′,1) by the cyclic permutation moving coordinate 0 to r−1, which lies in GE_r(A); elementary and diagonal conjugation invariance give κ(diag(1,a′)) = κ(diag(a′,1)).

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-smaller-corner-reduction`, `KTheoryLowDegrees:U.4/extension-conditions`, `KTheoryLowDegrees:U.4/extended-value`, `KTheoryLowDegrees:U.4/ge-subgroup`, `KTheoryLowDegrees:U.1/signed-transposition`, `KTheoryLowDegrees:U.1/stabilisation-map`.

Acceptance: At r = 2, a′ is the 1×1 matrix a₁₁ − a₁₀a₀₁ = det a; over a field with κ = det this gives f(σ) = det a. For every r, det a′ = det a, since ε₁a = ((1,*),(0,a′)) and det ε₁ = 1.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, p.116. In the concluding proof of Proposition 8.6 (p.116) BMS left-multiply α of shape (10.4) by I − a_{n1}e_{n1} ∈ E_n(A,q), obtaining a block matrix with corner α′, and conclude κ_{n+1}(σ) = κ_n(α) = κ_{n−1}(α′). The node records this with 0-based indices.

### Standard form of the swapped higher-rank matrix

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-conjugate-factorization`; proposed declaration `swap_higher_conjugate_factorization`.

For reduced σ, set α₁=1−Σ_{i<r−1}yᵢe_{i,r−1}, α₂=1−te_{r−1,0}, and s=a_{r−1,0}+ty_{r−1}. Then β̄=e_{r,0}(s)⁻¹L(α₂α₁,0)PσP⁻¹ is type R; Its lower corner β has, for i,j<r−2, βᵢⱼ=a_{i+1,j+1}, β_{i,r−2}=0 and β_{i,r−1}=a_{i+1,r−1}; the penultimate row is (−ta₀₁,…,−ta_{0,r−2},1,−ta_{0,r−1}); the final row is (a_{r−1,1}−sa₀₁,…,a_{r−1,r−2}−sa_{0,r−2},y_{r−1},a_{r−1,r−1}−sa_{0,r−1}). These are actual level-I matrices and f(PσP⁻¹)=κ(β).

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Old corner rank r ≥ 2; HasStableRange A r; for every ideal J, GL_r(A,J) is transitive on J-relative unimodular columns of length r; κ : GL_r(A,I) → C has ExtensionConditions; f = extendedValue κ on GL_{r+1}(A,I). σ = L(a,y)e_{r,0}(t) with t ∈ I, y ∈ I^r and a of shape (10.4); P exchanges coordinates r−1 and r.

Proof or construction:

1. Multiply the three matrices entrywise, checking the first column and lower-right corner separately.
2. The two α factors are relative elementary, so the standard-form-value drops their κ values.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-original-corner`, `KTheoryLowDegrees:U.4/standard-form-value`, `KTheoryLowDegrees:U.4/standard-form-value-independent`, `KTheoryLowDegrees:U.4/extension-conditions`, `KTheoryLowDegrees:U.4/extended-value`.

Acceptance: r = 2, I = ℤ, a = ((1,2),(3,7)), y = (0,5), t = 4: s = 23 and β = ((1,−8),(5,−39)), with det β = 1 = det a. The first column of e_{r,0}(s)⁻¹L(α₂α₁,0)PσP⁻¹ is e₀ only for s = a_{r−1,0} + t y_{r−1}; any other s leaves a nonzero (r,0) entry.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, pp.116–117. BMS pp.116–117 compute τ = πσπ⁻¹ and exhibit the standard form τ = (ᾱ₂ᾱ₁)⁻¹ε₁β̄ with α₁ = I − Σc_ie_{in}, α₂ = I − te_{n1}, ε₁ = I + se_{n+1,1}, s = a_{n1} + tc_n, and display β; hence κ_{n+1}(τ) = κ_n(β). The node is this computation in 0-based indices (c_i = y_{i−1}).

### Correct the swapped corner by elementary columns

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-column-correction`; proposed declaration `swap_higher_column_correction`.

The matrix δ=1+Σ_{j<r−2}t a_{0,j+1}e_{r−2,j}+t a_{0,r−1}e_{r−2,r−1} belongs to E_r(A,I); βδ is a permutation conjugate of the upper block with corner a′ and column ending in y_{r−1}.

Hypotheses: A is a commutative ring and I an ideal of A. r ≥ 2; σ, a, y, t, s and β are as in swap-higher-conjugate-factorization (a of shape (10.4), t ∈ I, y ∈ I^r).

Proof or construction:

1. All correction coefficients lie in I because t∈I.
2. Use s=a_{r−1,0}+ty_{r−1} to cancel the t terms in the last row; permute the isolated coordinate into the final position.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-conjugate-factorization`, `KTheoryLowDegrees:U.4/extension-conditions`.

Acceptance: In the r = 2 example of swap-higher-conjugate-factorization (a = ((1,2),(3,7)), y = (0,5), t = 4): δ = ((1,8),(0,1)), βδ = ((1,0),(5,1)), and exchanging the two coordinates gives ((1,5),(0,1)) = ((a′, y₁),(0,1)) with a′ = det a = 1. The conjugating matrix is the transposition of coordinates r−2 and r−1; it has determinant −1, so over ℤ it lies in GE_r(ℤ) but not in E_r(ℤ).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, p.117. BMS p.117 define δ = I + Σ_{j≤n−2} t a_{1,j+1}e_{n−1,j} + t a_{1n}e_{n−1,n} in E_n(A,q), compute βδ using a_{nj} − s a_{1j} + t a_{1j}c_n = a_{nj} − a_{n1}a_{1j}, and observe that βδ is a permutation conjugate of the block matrix β′ with corner α′ and last column (0,…,0,c_n). Same statement in 0-based indices.

### The two higher-rank corner values agree

**Lemma:** `KTheoryLowDegrees:U.4/swap-higher-corner-value`; proposed declaration `swap_higher_corner_value`.

In the preceding notation κ(β)=κ|_{GL_{r−1}(A,I)}(a′).

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. r ≥ 2; κ : GL_r(A,I) → C has ExtensionConditions; β, δ and a′ are as in swap-higher-column-correction.

Proof or construction:

1. Use κ’s elementary kernel to remove δ. The permutation matrix lies in GE_r, so elementary and diagonal conjugation invariance remove its conjugation.
2. The remaining block tail is a product of relative roots; kill them and restrict to a′.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-column-correction`, `KTheoryLowDegrees:U.4/extension-conditions`, `KTheoryLowDegrees:U.4/ge-subgroup`, `KTheoryLowDegrees:U.1/signed-transposition`.

Acceptance: Over a field with κ = det: κ(β) = det β = det a′ = det a. The conjugating transposition has determinant −1 (over ℤ it is not in E_r(ℤ)): a proof using only conjugation by E_r(A) is insufficient; the diagonal clause of ExtensionConditions is required.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.6, p.117. BMS p.117 conclude κ_n(β) = κ_n(βδ) = κ_n(β′) = κ_{n−1}(α′) from (8.2)_n, since δ ∈ E_n(A,q) and β′ is a permutation conjugate of βδ; the node states the resulting equality of corner values.

### Higher-rank last-swap invariance

**Theorem:** `KTheoryLowDegrees:U.4/last-swap-higher-rank`; proposed declaration `last_swap_higher_rank`.

For r≥2, HasStableRange A (r−1), uniform relative GL_{r−1} transitivity for all ideals, and κ satisfying ExtensionConditions in rank r, the actual f satisfies f(PσP⁻¹)=f(σ) for every σ∈GL_{r+1}(A,I).

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. r ≥ 2 (at r = 2 the smaller-corner step uses stable range one directly, see swap-smaller-corner-reduction); HasStableRange A (r−1); for every ideal J, GL_{r−1}(A,J) is transitive on J-relative unimodular columns of length r−1. κ : GL_r(A,I) → C is a homomorphism with ExtensionConditions; f = extendedValue κ on GL_{r+1}(A,I), using HasStableRange A r and GL_r(A,J) transitivity derived from the previous line; P exchanges coordinates r−1 and r.

Proof or construction:

1. Combine swap-higher-original-corner and swap-higher-corner-value on the reduced matrices.
2. Undo the reductions using swap-smaller-corner-reduction and swap-reduction-left-middle.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-higher-original-corner`, `KTheoryLowDegrees:U.4/swap-higher-corner-value`, `KTheoryLowDegrees:U.4/swap-smaller-corner-reduction`, `KTheoryLowDegrees:U.4/swap-reduction-left-middle`, `KTheoryLowDegrees:U.4/relative-elementary-transitive`.

Acceptance: Keep HasStableRange A (r−1), not only HasStableRange A r. At r = 2 this is stable range one, which ℤ (or a general Dedekind domain) lacks, so the Dedekind rank-two case goes through last-swap-dedekind-rank-two. Over ℚ with I = ℚ and κ = det on GL₃(ℚ) (r = 3; ℚ has stable range one), f = det on GL₄(ℚ) and both sides of the swap equation equal det σ.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proposition 8.6 and its concluding proof, pp.107,115–117. BMS Proposition 8.6 (p.107) assumes (7.2)_n and (8.1)_{n−1}; its concluding proof (pp.115–117) verifies (10.1), invariance of κ_{n+1} under conjugation by the last-two-coordinate swap, via Lemma 10.2 and the explicit standard form of πσπ⁻¹. This node is that invariance with n = r and HasStableRange A (r−1) = (7.2)_r.

### Arrange a nonzero rank-two corner

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-nonzero`; proposed declaration `swap_rank_two_nonzero`.

For a Dedekind domain and κ the inherited Kubota homomorphism of a Mennicke symbol, the rank-two swap reduction permits a₀₀≠0, including I=A.

Hypotheses: A is a Dedekind domain (fields allowed) and I an ideal of A; C is any group; s is a Mennicke symbol on W_I with values in C and κ = kubotaHom s on GL₂(A,I). f = extendedValue κ on GL₃(A,I), built from dedekind-stable-range-two, dedekind-relative-gl-transitive and kubota-extension-conditions; P exchanges coordinates 1 and 2; σ = L(a,y)e_{2,0}(t) with t ∈ I, y ∈ I².

Proof or construction:

1. For I≠A the congruence a₀₀≡1 forces nonzero. For I=A use a unimodular first column and an allowed upper-block row operation.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-stable-modifications`, `KTheoryLowDegrees:U.4/swap-reduction-left-middle`, `KTheoryLowDegrees:U.4/kubota-hom`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`, `KTheoryLowDegrees:U.4/kubota-extension-conditions`.

Acceptance: I = A = ℤ: for a = ((0,1),(−1,0)), adding row 1 to row 0 via the block ((1,1,0),(0,1,0),(0,0,1)) gives a₀₀ = −1 ≠ 0. For I ≠ A no modification is needed: a₀₀ ≡ 1 mod I and a₀₀ = 0 would force 1 ∈ I (e.g. a₀₀ is odd when I = 2ℤ).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.117. In the concluding proof of Proposition 8.5 (p.117) BMS reduce to σ = ᾱε by Lemma 10.2(b) and then left-multiply by a (10.3) factor to make a₁₁ nonzero, noting this is automatic when q ≠ A. The node is that reduction in 0-based indices.

### Choose the relative semilocal Bézout pair

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-pair-choice`; proposed declaration `swap_rank_two_pair_choice`.

Let A be a Dedekind domain, a ∈ GL₂(A,I) with a₀₀ ≠ 0, t ∈ I and y ∈ I², and put u = a₁₀ + t y₁. There is s ∈ I such that, with c = 1 + s y₁, IsCoprime a₀₀ (s a₁₀ + t c); note s a₁₀ + t c = t + s u. The pair (a₀₀, s a₁₀ + t c) is I-relative unimodular. If I ≠ 0, s can in addition be chosen with c ≠ 0.

Hypotheses: A is a Dedekind domain (fields allowed) and I an ideal of A. a ∈ GL₂(A,I) with a₀₀ ≠ 0 (from swap-rank-two-nonzero); t ∈ I; y = (y₀,y₁) ∈ I².

Proof or construction:

1. The column (a₀₀, t, u) is the first column of the invertible matrix ᾱ₁PσP⁻¹, hence unimodular; so (t, u) is unimodular modulo a₀₀.
2. By dedekind-principal-quotient-semilocal, A/a₀₀A has stable range one (it is zero if a₀₀ is a unit): choose s′ ∈ A with t + s′u a unit modulo a₀₀.
3. Put s = s′(1 − a₀₀) ∈ I; then s ≡ s′ mod a₀₀, so IsCoprime a₀₀ (t + su), and t + su = s a₁₀ + t c. Both s and t lie in I and a₀₀ ≡ 1 mod I, so the pair is I-relative unimodular.
4. Optional c ≠ 0: if c = 0 then y₁ is a unit, so I ≠ 0; replace s by s + j with j a nonzero element of I·a₀₀A, giving c = j y₁ ≠ 0 with the same residue of s modulo a₀₀.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-nonzero`, `KTheoryLowDegrees:U.4/dedekind-principal-quotient-semilocal`, `KTheoryLowDegrees:U.3/stable-range`.

Acceptance: s = 0 can fail: over ℤ with I = 2ℤ, a = ((3,2),(4,3)), t = 6, y = (0,2) one has u = 16 and gcd(3,6) = 3; s = 2 gives c = 5 and s a₁₀ + tc = 38 = t + su, coprime to 3. c = 0 is possible for an admissible s: over ℤ with I = ℤ, a = 1, t = 0, y = (0,−1), s = 1 gives c = 0 and IsCoprime 1 0; the later steps remain valid.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.118. BMS p.118 use semilocality of A/a₁₁A (remark before Lemma 2.2, p.66) to choose s ∈ q with t + s(a₂₁ + tc₂) = sa₂₁ + tc prime to a₁₁, and also arrange c = 1 + sc₂ ≠ 0. The node supplies the lift of s into I and makes c ≠ 0 optional, since the later steps do not need it.

### Relative completion of the chosen pair

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-bezout-completion`; proposed declaration `swap_rank_two_bezout_completion`.

There is ω∈SL₂(A,I) with ω · (a₀₀,s a₁₀+tc)ᵀ=(1,0)ᵀ. In ω times [[a₀₀,0],[s a₁₀+tc,c]], the lower-right entry is y=a₀₀c.

Hypotheses: A is a commutative ring (in this chain a Dedekind domain) and I an ideal of A. a₀₀, s, t, c and b = s a₁₀ + t c are as in swap-rank-two-pair-choice, so (a₀₀, b) ∈ W_I.

Proof or construction:

1. Apply the inherited relative column completion to the chosen I-unimodular pair.
2. Compare determinants using det ω=1 and the now upper-triangular product.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-pair-choice`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`, `KTheoryLowDegrees:U.4/relative-first-row-completion`.

Acceptance: Over ℤ with I = 2ℤ, a₀₀ = 3, b = 38, c = 5: ω = ((−25,2),(−38,3)) ∈ SL₂(ℤ,2ℤ) and ω·((3,0),(38,5)) = ((1,10),(0,15)), with 15 = a₀₀c and 10 = ω₀₁c. ω must be level I: ((13,−1),(−38,3)) also sends (3,38)ᵀ to e₀ with determinant 1 but is not congruent to 1 modulo 2.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, (10.5), p.118. BMS p.118 use (7.1) (SL₂(A,q) transitive on q-unimodular pairs, from Lemma 5.3) to find ω ∈ SL₂(A,q) with ω·((a₁₁,0),(sa₂₁+tc, c)) = ((1,x),(0,y)), equation (10.5); p.119 derives y = a₁₁c from det ω = 1. The node combines both.

### The swapped rank-three standard form

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-standard-form`; proposed declaration `swap_rank_two_standard_form`.

After α₁=[[1,−y₀],[0,1]], δ=1+se_{1,2} and ω̄=diag(ω,1), set u=a₁₀+ty₁. Then e_{2,0}(u)⁻¹ω̄δᾱ₁PσP⁻¹ is type R with lower corner β; f(PσP⁻¹)=κ(ω)⁻¹κ(β).

Hypotheses: A is a Dedekind domain and I an ideal of A; C is any group; κ = kubotaHom s for a Mennicke symbol s on W_I; f = extendedValue κ on GL₃(A,I). σ = L(a,y)e_{2,0}(t) with a₀₀ ≠ 0; s, c and ω as in swap-rank-two-pair-choice and swap-rank-two-bezout-completion; P exchanges coordinates 1 and 2.

Proof or construction:

1. Multiply the factors to obtain the first column e₀ and the explicit β of p.118.
2. The inverse of ω̄δᾱ₁ is type L; evaluate the resulting standard form and kill α₁.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-bezout-completion`, `KTheoryLowDegrees:U.4/standard-form-value`, `KTheoryLowDegrees:U.4/standard-form-value-independent`, `KTheoryLowDegrees:U.4/extended-value`.

Acceptance: Over ℤ with I = 2ℤ, a = ((3,2),(4,3)), y = (0,2), t = 6, s = 2, ω = ((−25,2),(−38,3)): τ = ((3,0,2),(6,1,0),(16,2,3)), u = 16, and e_{2,0}(16)⁻¹ω̄δᾱ₁τ = ((1,10,−38),(0,15,−58),(0,−158,611)); det β = 1. The left factor's corner is (ωα₁)⁻¹, not ω⁻¹ alone; its κ-value equals κ(ω)⁻¹ only because α₁ = e₀₁(−y₀) is relative elementary.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.118. BMS p.118 multiply τ = πσπ⁻¹ on the left by ᾱ₁, δ = I + se₂₃ and ω̄, subtract u = a₂₁ + tc₂ times the first row from the last, and obtain the standard form τ = (ω̄δᾱ₁)⁻¹ε₁β̄ with the displayed β, hence κ₃(τ) = κ₂(ω)⁻¹κ₂(β). Same statement in 0-based indices.

### Recover the second row of the completion

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-omega-row`; proposed declaration `swap_rank_two_omega_row`.

The relative completion above satisfies ω₁₁=a₀₀ and ω₁₀=−(s a₁₀+tc), hence κ(ω⁻¹)=[−(s a₁₀+tc)/a₀₀]⁻¹. By numerator multiplication this equals [(tc a₀₁−s d)/a₀₀]⁻¹ κ(a), where d=det a.

Hypotheses: A is a Dedekind domain and I an ideal of A (for I = 0 everything is trivial); C is any group; s is a Mennicke symbol on W_I and κ = kubotaHom s. a ∈ GL₂(A,I) with d = det a; s, t, c, b = s a₁₀ + tc and ω as in swap-rank-two-pair-choice and swap-rank-two-bezout-completion.

Proof or construction:

1. Since det ω = 1 and ω(a₀₀,b)ᵀ = e₀, the first column of ω⁻¹ is (a₀₀,b)ᵀ; the adjugate formula gives ω₁₁ = a₀₀ and ω₁₀ = −b. (Equivalently, as in BMS, compare y = a₀₀c with y = ω₁₁c and cancel c ≠ 0.)
2. kubota-opposite-row gives κ(ω) = [−b/a₀₀]; mennicke-sign-unit removes the sign.
3. MS2 with (a₀₀,b),(a₀₀,a₀₁) ∈ W_I gives [b a₀₁/a₀₀] = [b/a₀₀][a₀₁/a₀₀], and [a₀₁/a₀₀] = κ(a); b a₀₁ = s(a₀₀a₁₁ − d) + tc a₀₁ differs from tca₀₁ − sd by (s a₁₁)a₀₀ with s a₁₁ ∈ I, so MS1 applies. Rearrange in the abelian symbol image.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-bezout-completion`, `KTheoryLowDegrees:U.4/swap-rank-two-pair-choice`, `KTheoryLowDegrees:U.4/kubota-opposite-row`, `KTheoryLowDegrees:U.4/mennicke-sign-unit`, `KTheoryLowDegrees:U.4/mennicke-symbol`, `KTheoryLowDegrees:U.4/mennicke-symbol-image-abelian`.

Acceptance: Example of swap-rank-two-standard-form: ω₁₁ = 3 = a₀₀, ω₁₀ = −38; (s a₁₀ + tc)a₀₁ = 76 = s(a₀₀a₁₁ − d) + tc a₀₁ = 16 + 60, and 76 − 58 = 18 = (s a₁₁)a₀₀ with s a₁₁ = 6 ∈ 2ℤ, so tca₀₁ − sd = 58. Signs: the numerator of κ(ω) is ω₁₀ = −b, not b; the sign is removed only through mennicke-sign-unit.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.119. BMS p.119 solve (10.5) for the second row of ω, getting w₂₂ = a₁₁ and w₂₁ = −(sa₂₁ + tc), and then use Kubota step (1) (p.103) and the Mennicke relations to rewrite κ₂(ω)⁻¹ as [(tca₁₂ − sd)/a₁₁]⁻¹κ₂(α). The node states the same with 0-based indices; the second row may also be read off from det ω = 1.

### Evaluate the corrected β by Mennicke relations

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-beta-symbol`; proposed declaration `swap_rank_two_beta_symbol`.

For β from swap-rank-two-standard-form, its first row is (a₀₀c, sd − tca₀₁), where d = det a ∈ Aˣ. Hence κ(β) = [(sd−tca₀₁)/(a₀₀c)] = [(sd−tca₀₁)/c][(sd−tca₀₁)/a₀₀] = [sd/c][(sd−tca₀₁)/a₀₀] = [(sd−tca₀₁)/a₀₀], the last step because c = 1 + s y₁ ≡ 1 modulo sd.

Hypotheses: A is a Dedekind domain and I an ideal of A (for I = 0 everything is trivial); C is any group; s is a Mennicke symbol on W_I and κ = kubotaHom s. a, d, s, t, c, ω and β as in swap-rank-two-standard-form and swap-rank-two-omega-row.

Proof or construction:

1. Use the determinant computation y=a₀₀c to identify the first entry.
2. Substitute ω’s recovered second row. Apply inherited q-equivalence and mennicke-denominator-multiplication; the W_I memberships needed are c ≡ a₀₀ ≡ 1 mod I and sd − tca₀₁ ∈ I.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-standard-form`, `KTheoryLowDegrees:U.4/swap-rank-two-omega-row`, `KTheoryLowDegrees:U.4/mennicke-denominator-multiplication`, `KTheoryLowDegrees:U.4/mennicke-sign-unit`, `KTheoryLowDegrees:U.4/q-equivalence-near-unit`.

Acceptance: Example of swap-rank-two-standard-form: first row of β is (15, −58) = (a₀₀c, sd − tca₀₁) with s = 2, d = 1, t = 6, c = 5, a₀₁ = 2; −58 + 12·5 = 2 = sd with coefficient ta₀₁ = 12 ∈ 2ℤ, and 5 ≡ 1 mod 2 gives [2/5] = 1. The MS1 move in step 3 must use a coefficient in I: it is ta₀₁ ∈ I because t ∈ I, not merely a₀₁ ∈ I.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.119. BMS p.119 compute the first row of β as (a₁₁c, sd − tca₁₂) and evaluate κ₂(β) by Lemma 2.11 and MS1, discarding [sd/c] because d is a unit and c = 1 + sc₂. The node is the same computation in 0-based indices.

### Cancel the two rank-two symbol factors

**Lemma:** `KTheoryLowDegrees:U.4/swap-rank-two-symbol-cancellation`; proposed declaration `swap_rank_two_symbol_cancellation`.

The factors κ(ω⁻¹)κ(β) reduce to [a₀₁/a₀₀]=κ(a). The extra [sd/c] factor is 1.

Hypotheses: A is a Dedekind domain and I an ideal of A; C is any group; s is a Mennicke symbol on W_I and κ = kubotaHom s. Notation as in swap-rank-two-omega-row and swap-rank-two-beta-symbol.

Proof or construction:

1. Apply the exact Mennicke products obtained in swap-rank-two-omega-row and swap-rank-two-beta-symbol; the inverse numerator factors cancel inside the abelian image of the symbol.
2. The determinant identity a₀₀a₁₁−a₀₁a₁₀=d∈Aˣ gives the remaining congruence; κ(a) is its first-row symbol.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-omega-row`, `KTheoryLowDegrees:U.4/swap-rank-two-beta-symbol`, `KTheoryLowDegrees:U.4/mennicke-symbol-image-abelian`, `KTheoryLowDegrees:U.4/kubota-hom`, `KTheoryLowDegrees:U.4/mennicke-sign-unit`.

Acceptance: The two numerators are negatives of each other (58 and −58 in the example of swap-rank-two-standard-form); the cancellation is valid only through mennicke-sign-unit. No commutativity of C is used beyond the abelian image of the symbol: with C = S₃ and the trivial symbol both sides are 1.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Proposition 8.5, p.119. BMS p.119 multiply κ₂(ω)⁻¹ = [(tca₁₂ − sd)/a₁₁]⁻¹κ₂(α) by κ₂(β) = [(sd − tca₁₂)/a₁₁] and conclude κ₃(τ) = κ₂(α) = κ₃(σ). The node isolates this cancellation, which silently uses [−x/a] = [x/a].

### Dedekind rank-two last-swap invariance

**Theorem:** `KTheoryLowDegrees:U.4/last-swap-dedekind-rank-two`; proposed declaration `last_swap_dedekind_rank_two`.

For a Dedekind domain, an ideal I, and κ the Kubota homomorphism of a Mennicke symbol, f on GL₃(A,I) satisfies f(PσP⁻¹)=f(σ), where P swaps the last two coordinates.

Hypotheses: A is a Dedekind domain (fields allowed) and I an ideal of A; C is any group; s is a Mennicke symbol on W_I and κ = kubotaHom s on GL₂(A,I). f = extendedValue κ on GL₃(A,I), with HasStableRange A 2, GL₂(A,J) transitivity for all J and ExtensionConditions(κ) supplied by dedekind-stable-range-two, dedekind-relative-gl-transitive and kubota-extension-conditions; P exchanges coordinates 1 and 2.

Proof or construction:

1. Apply swap-rank-two-symbol-cancellation to the standard form from swap-rank-two-standard-form.
2. Undo swap-rank-two-nonzero and swap-reduction-left-middle.

Direct prerequisites: `KTheoryLowDegrees:U.4/swap-rank-two-symbol-cancellation`, `KTheoryLowDegrees:U.4/swap-rank-two-standard-form`, `KTheoryLowDegrees:U.4/swap-rank-two-nonzero`, `KTheoryLowDegrees:U.4/swap-reduction-left-middle`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`, `KTheoryLowDegrees:U.4/kubota-extension-conditions`.

Acceptance: At I = 0, GL₃(A,0) is trivial and the equation is immediate; for I ≠ 0 the nonzero-ideal Mennicke parents apply. This route needs only HasStableRange A 2: it must not assume stable range one (ℤ, which lacks it, is covered).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proposition 8.5 and its concluding proof, pp.107,117–119. Conclusion of the proof of Proposition 8.5 (pp.117–119): for κ₂ from Kubota's theorem on a Dedekind ring, κ₃ satisfies (10.1), shown on σ = ᾱε with a₁₁ ≠ 0 via the explicit standard form of πσπ⁻¹ and Mennicke-symbol identities. The node is that invariance for the U.1 extendedValue in rank three.

### All GE conjugations preserve the next-rank value

**Lemma:** `KTheoryLowDegrees:U.4/ge-invariance-complete`; proposed declaration `ge_invariance_complete`.

In either last-swap-higher-rank or last-swap-dedekind-rank-two setting, GE_{r+1}(A)≤N(f).

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Either (higher-rank) r ≥ 2, HasStableRange A (r−1), GL_{r−1}(A,J) transitivity for every ideal J, and κ : GL_r(A,I) → C with ExtensionConditions; or (Dedekind) A is a Dedekind domain, r = 2 and κ = kubotaHom s for a Mennicke symbol s on W_I. f = extendedValue κ on GL_{r+1}(A,I) with the corresponding next-rank data; N(f) is the set of τ in the absolute group GL_{r+1}(A) with f(τστ⁻¹) = f(σ) for all σ.

Proof or construction:

1. Apply the inherited ge-stabilizer-swap-reduction to the corresponding last-swap theorem.

Direct prerequisites: `KTheoryLowDegrees:U.4/last-swap-higher-rank`, `KTheoryLowDegrees:U.4/last-swap-dedekind-rank-two`, `KTheoryLowDegrees:U.4/ge-stabilizer-swap-reduction`.

Acceptance: τ ranges over the absolute group: over ℤ with I = 2ℤ, τ = e₀₁(1) ∉ GL₃(ℤ,2ℤ) must be in N(f) in the Dedekind setting. Over ℚ with I = ℚ, κ = det on GL₃(ℚ) (r = 3): f = det and N(f) = GL₄(ℚ), consistent with GE₄(ℚ) = GL₄(ℚ).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 9.6 and §10, pp.114–119. BMS reduce GE_{n+1}(A) ⊆ N to the single swap π ∈ N via Lemmas 9.4–9.6 (pp.113–114, restated at the opening of §10, p.115); §10 then proves π ∈ N in both settings. The node composes the inherited reduction with the two last-swap theorems.

### The next-rank value preserves products

**Lemma:** `KTheoryLowDegrees:U.4/next-rank-product-law`; proposed declaration `next_rank_product_law`.

Under either completed GE-invariance route, f(στ)=f(σ)f(τ) for all same-level matrices.

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Either setting of ge-invariance-complete (higher-rank with HasStableRange A (r−1) and GL_{r−1} transitivity, r ≥ 2; or Dedekind with r = 2 and κ = kubotaHom s); f = extendedValue κ on GL_{r+1}(A,I).

Proof or construction:

1. Use ge-invariance-complete in inherited conditional-ge-multiplicativity.

Direct prerequisites: `KTheoryLowDegrees:U.4/ge-invariance-complete`, `KTheoryLowDegrees:U.4/conditional-ge-multiplicativity`.

Acceptance: For σ = L(a,y)e_{r,0}(t) and τ = R(b,p) the law gives f(στ) = κ(a)κ(b), the standard-form value, in this order. At I = 0 both sides are 1.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 9.3 and §10, pp.113,115–119. BMS Corollary 9.3 (p.113): if GE_{n+1}(A) ⊆ N then κ_{n+1} is a homomorphism satisfying (8.2)_{n+1}; §10 supplies the GE inclusion in the settings of Propositions 8.5 and 8.6. The node records the product law.

### The actual next-rank homomorphism

**Construction:** `KTheoryLowDegrees:U.4/extended-hom`; proposed declaration `extendedHom`.

Under either the Dedekind Kubota rank-two hypotheses or the stronger higher-rank hypotheses, extendedHom κ:GL_{r+1}(A,I)→*C has underlying function the inherited extendedValue. It is bundled only after next-rank-product-law.

Hypotheses: A is a commutative ring and I an ideal of A; C is any group (not assumed commutative). Either (higher-rank) r ≥ 2, HasStableRange A (r−1), GL_{r−1}(A,J) transitivity for every ideal J, and κ : GL_r(A,I) → C with ExtensionConditions; or (Dedekind) A is a Dedekind domain, r = 2 and κ = kubotaHom s for a Mennicke symbol s on W_I.

Proof or construction:

1. Take f as the function, use its inherited value at 1, and next-rank-product-law for the homomorphism fields.

Direct prerequisites: `KTheoryLowDegrees:U.4/next-rank-product-law`, `KTheoryLowDegrees:U.4/extended-value`, `KTheoryLowDegrees:U.4/extension-unique`.

Acceptance: Over ℚ with I = ℚ and r = 2, κ = ι∘det with ι : ℚˣ → ℚˣ × S₃, x ↦ (x,1): extendedHom κ (diag(1,1,2)) = (2,1); a definition using only the left corner would give (1,1). With the trivial symbol (Dedekind route) or trivial κ (higher-rank route) the extension is trivial.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Propositions 8.5–8.6, pp.107,115–119. BMS Propositions 8.5 and 8.6 (p.107) assert that κ_n extends to a homomorphism κ_{n+1} on GL_{n+1}(A,q) satisfying (8.2)_{n+1}; the proof constructs κ_{n+1} as the standard-form value of Lemma 8.11 and proves multiplicativity in §§9–10 (pp.112–119). The node bundles that function as a homomorphism.

Uses:

- BMS Proposition 8.6 and Theorem 4.1(c): Iteration and the finite relative universal property need a genuine homomorphism.
- BMS Corollary 8.10: Inheritance of transpose and related conditions requires the homomorphism’s elementary kernel.

Planning API:

- `extendedHom_apply` (simp): extendedHom κ g=extendedValue κ g with the same hypotheses and choices.
- `extendedHom_embed` (compatibility): extendedHom κ(diag(g,1))=κ(g).
- `extendedHom_unique` (characterisation): Any homomorphism with that restriction and relative elementary kernel equals extendedHom κ.
- `extendedHom_comp` (functoriality): Higher-rank route: for an injective homomorphism φ : C → D (or assuming ExtensionConditions(φ∘κ)), extendedHom (φ∘κ) = φ ∘ extendedHom κ. Dedekind route: extendedHom (kubotaHom (φ∘s)) = φ ∘ extendedHom (kubotaHom s) for every φ.

Unit-test contracts:

- `extendedHom_trivial_test` (degenerate): Extending the trivial κ gives the trivial homomorphism.
- `extendedHom_root_test` (computation): Every relative elementary root in the new rank has value 1.
- `extendedHom_restriction_test` (compatibility): Restriction along the fixed upper-left stabilization equals κ.
- `extendedHom_nonabelian_target_test` (compatibility): Over ℚ with I = ℚ and r = 2 (ℚ has stable range one, so the higher-rank route applies), κ = ι∘det : GL₂(ℚ) → ℚˣ × S₃ with ι(x) = (x,1) injective has ExtensionConditions, and extendedHom κ = ι∘det on GL₃(ℚ). The target is noncommutative; no commutativity of C may be required.
- `extendedHom_right_corner_test` (computation): In the setting of the previous test, extendedHom κ takes the value (2,1) on diag(1,1,2) and (−1,1) on the swap of the last two coordinates of GL₃(ℚ); both are type-R matrices whose value comes from the right corner of the standard form.

### Restriction of the bundled extension

**Lemma:** `KTheoryLowDegrees:U.4/extended-hom-embed`; proposed declaration `extendedHom_embed`.

extendedHom κ restricted to upper-left rank r equals κ.

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Either setting of extended-hom (higher-rank, r ≥ 2, HasStableRange A (r−1) and GL_{r−1} transitivity; or Dedekind, r = 2, κ = kubotaHom s).

Proof or construction:

1. Evaluate a type-L block with zero last column.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/extended-value-type-l`.

Acceptance: The restriction is along the upper-left placement diag(g,1); the lower-right placement diag(1,g) agrees only via GE conjugation invariance and is not the defining equation. Over ℚ with κ = det on GL₃(ℚ): extendedHom κ (diag(g,1)) = det g.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 8.11 (final assertion and last line of its proof), pp.110–111. BMS Lemma 8.11 shows that the standard-form value restricts to κ_n on GL_n(A,q) (the type-L matrix diag(g,1) is its own standard form). The node transfers this to the bundled homomorphism.

### The bundled extension kills relative elementary matrices

**Lemma:** `KTheoryLowDegrees:U.4/extended-hom-elementary-kernel`; proposed declaration `extended_hom_elementary_kernel`.

extendedHom κ annihilates E_{r+1}(A,I).

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Either setting of extended-hom.

Proof or construction:

1. Use inherited conditional-ge-multiplicativity with ge-invariance-complete.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/ge-invariance-complete`, `KTheoryLowDegrees:U.4/conditional-ge-multiplicativity`.

Acceptance: The kernel contains the relative group E_{r+1}(A,I) (normal closure of level-I roots under E_{r+1}(A)), not only bare level-I roots: e.g. e₁₀(1)e₀₁(t)e₁₀(−1) for t ∈ I. Over ℚ with κ = det (r = 2), the kernel of extendedHom κ is SL₃(ℚ) ⊇ E₃(ℚ).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 9.3 and §10, pp.113,115–119. Part of the conclusion of BMS Corollary 9.3 (p.113): once GE_{n+1}(A) ⊆ N, κ_{n+1} satisfies (8.2)_{n+1}, in particular it kills E_{n+1}(A,q); §10 supplies the inclusion.

### All conditions pass to the bundled extension

**Lemma:** `KTheoryLowDegrees:U.4/extended-hom-conditions`; proposed declaration `extended_hom_conditions`.

extendedHom κ satisfies ExtensionConditions in rank r+1, including transpose kernel stability and every oriented (I,t)-relation for t∈I.

Hypotheses: A is a commutative ring and I an ideal of A; C is any group. Either setting of extended-hom; the U.1 hypotheses n = r−1 ≥ 1, HasStableRange A r and GL_r(A,J) transitivity for all J hold in both.

Proof or construction:

1. Elementary and diagonal conjugation come from ge-invariance-complete; the elementary kernel is extended-hom-elementary-kernel.
2. Apply inherited extension-transpose-kernel and extension-related-invariance to the actual homomorphism and extended-hom-embed.

Direct prerequisites: `KTheoryLowDegrees:U.4/extended-hom-embed`, `KTheoryLowDegrees:U.4/extended-hom-elementary-kernel`, `KTheoryLowDegrees:U.4/ge-invariance-complete`, `KTheoryLowDegrees:U.4/extension-transpose-kernel`, `KTheoryLowDegrees:U.4/extension-related-invariance`.

Acceptance: The output feeds the next iteration: ExtensionConditions in rank r+1 is exactly the input of extended-hom at rank r+1. Transpose stability is of the kernel only: over ℚ with κ = det, extendedHom κ(gᵀ) = extendedHom κ(g) happens to hold, but only kernel stability is asserted in general.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 8.10 and Propositions 8.5–8.6, pp.110,115–119. BMS Corollary 8.10 (p.110) shows that an extension satisfying (8.2)_{n+1} automatically satisfies (8.3)_{n+1} and (8.4)_{n+1}; with Corollary 9.3 and §10 this gives all conditions for κ_{n+1} in Propositions 8.5–8.6. The node packages them as ExtensionConditions in rank r+1.

### Iterate the symbol through all finite ranks

**Theorem:** `KTheoryLowDegrees:U.4/dedekind-iterated-symbol-hom`; proposed declaration `dedekind_iterated_symbol_hom`.

For a Dedekind domain, every Mennicke symbol at I with values in any group C gives compatible homomorphisms κ_n:GL_n(A,I)→C for n≥2, satisfying ExtensionConditions, whose κ₂ is kubotaHom and whose upper-left restrictions agree.

Hypotheses: A is a Dedekind domain (fields allowed) and I an ideal of A; C is any group; s is a Mennicke symbol on W_I with values in C.

Proof or construction:

1. Construct κ₃ by last-swap-dedekind-rank-two and extended-hom.
2. For r≥3, the inherited stable-range-two and relative transitivity discharge the smaller-corner hypotheses; iterate using extended-hom-conditions.
3. Use extension-unique for compatibility and independence of the inductive construction.

Direct prerequisites: `KTheoryLowDegrees:U.4/kubota-extension-conditions`, `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/extended-hom-conditions`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`, `KTheoryLowDegrees:U.4/extension-unique`, `KTheoryLowDegrees:U.4/extended-hom-embed`.

Acceptance: If A is a field every Mennicke symbol is trivial (in each pair of W_I one entry is a unit), so every κ_n is trivial. Uniqueness: κ_{n+1} is the only homomorphism restricting to κ_n and killing E_{n+1}(A,I) (extension-unique, n ≥ 2 uses HasStableRange A 2).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Propositions 8.5–8.6 and Theorem 4.1(c), pp.94–95,107,119. BMS prove Theorem 4.1(c) (pp.94–95) by extending κ₂ from Kubota's theorem to κ₃ (Proposition 8.5) and then inductively to every κ_n (Proposition 8.6), as explained on p.107. The node is this inductive family with the restriction compatibilities.

### Sign and unit factors in Mennicke values

**Lemma:** `KTheoryLowDegrees:U.4/mennicke-sign-unit`; proposed declaration `mennicke_sign_unit`.

For a Mennicke symbol at I, admissible pairs obey [−b/a]=[b/a] and [bu/a]=[b/a] for u∈Aˣ whenever both symbols are defined. A denominator a congruent to 1 modulo the numerator has symbol value 1.

Hypotheses: A is a Dedekind domain and I an ideal of A (for I = 0, W_0 = {(1,0)} and all claims are trivial); C is any group; s is a Mennicke symbol on W_I with values in C. (a,b) ∈ W_I and u ∈ Aˣ; then (a,ub) ∈ W_I automatically.

Proof or construction:

1. Put q = 1 − a ∈ I. MS1 (q-equivalence-to-base-point) gives [b/a] = [bq/a] and [ub/a] = [ubq/a].
2. By mennicke-symbol-residue-function and mennicke-symbol-residue-homomorphism, x ↦ [xq/a] is a homomorphism on (A/aA)ˣ that is trivial on the image of Aˣ; hence [ubq/a] = [uq/a][bq/a] = [bq/a]. Take u = −1 for the sign.
3. If a ≡ 1 modulo b, then (a,b) ∼ (1,0) by q-equivalence-near-unit, so [b/a] = 1.

Direct prerequisites: `KTheoryLowDegrees:U.4/mennicke-symbol-residue-homomorphism`, `KTheoryLowDegrees:U.4/q-equivalence-to-base-point`, `KTheoryLowDegrees:U.4/mennicke-symbol-residue-function`, `KTheoryLowDegrees:U.4/q-equivalence-near-unit`.

Acceptance: The sign may move only onto the numerator: over ℤ with I = 3ℤ, (4,3) ∈ W_I but (−4,3) ∉ W_I because −4 ≢ 1 mod 3. Near-unit clause: over ℤ with I = 5ℤ, (11,5) ∈ W_I and 11 ≡ 1 mod 5, so [5/11] = 1 for every Mennicke symbol.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemmas 2.7(a,c), 2.9(a), pp.67–68; Kubota proof steps 1–2, pp.103–104. BMS Lemma 2.7(a),(c) and Lemma 2.9(a) (pp.67–68) show that b ↦ [bq/a] is a homomorphism on U(A/aA) trivial on global units and that symbols with a near-unit entry are 1; the unit-factor identity [ub/a] = [b/a] is the computation in step 2 of the proof of Kubota's theorem (p.104). The node isolates these facts, including u = −1.

## Finite quotient and commutator declarations

### The finite-rank relative determinant-one defect

**Definition:** `KTheoryLowDegrees:U.4/finite-mennicke-defect`; proposed declaration `FiniteDefect`.

For a Dedekind domain A and n≥3, let Γ_n(I) be the determinant-one part of U.5 congruenceSubgroup, and E_n(I) the inherited relative elementary subgroup viewed in Γ_n(I). Define FiniteDefect n I=Γ_n(I)/E_n(I), using relative-elementary-normal. The quotient map is denoted finiteDefectMk. Zero and unit ideals are allowed.

Hypotheses: A is a Dedekind domain; I is any ideal of A (zero and unit ideals allowed). n ≥ 3 (needed for normality of E_n(A,I) through relative-elementary-normal with stable range 2).

Proof or construction:

1. Use Matrix.SpecialLinearGroup.toGL to interpret Γ_n(I) without a new congruence carrier.
2. Restrict the normal relative elementary group to Γ_n(I), then apply the native quotient group construction.

Direct prerequisites: `KTheoryLowDegrees:U.5/congruence-subgroup`, `KTheoryLowDegrees:U.5/relative-elementary-subgroup`, `KTheoryLowDegrees:U.4/relative-elementary-normal`, `mathlib:Matrix.SpecialLinearGroup.toGL`, `mathlib:QuotientGroup.mk'`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: At I=⊤ the quotient is SL_n(A)/E_n(A) (relElementary_top, congruenceSubgroup_top); at I=⊥ it is trivial (congruenceSubgroup_bot). diag(−1,1,1)∈GL₃(ℤ,2ℤ) has determinant −1 and is not in Γ₃(2ℤ): the GL-level quotient surjects onto {±1} by the determinant while FiniteDefect 3 (2ℤ) is trivial, so a GL-based definition is rejected.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(b), p.94. BMS Theorem 4.1(b) (p.94) introduces C_q(n) as SL_n(A,q) modulo E_n(A,q), the normal subgroup of E_n(A) generated by q-elementary matrices, for A Dedekind and n≥3; the node is this quotient built from the U.5 congruence and relative elementary carriers.

Uses:

- BMS Theorem 4.1 and Corollary 4.3: The universal Mennicke quotient must be identified in each finite rank and ideal level.
- BMS Theorem 14.1: Finite relative defects form the kernel system for the two arithmetic lattice completions.

Planning API:

- `finiteDefectMk` (constructor): Γ_n(I)→*FiniteDefect n I is the native quotient homomorphism.
- `finiteDefectMk_surjective` (projection): finiteDefectMk is surjective.
- `finiteDefectMk_eq_one` (characterisation): The class of g is 1 iff its GL image lies in E_n(A,I).
- `FiniteDefect_group` (instance): The inherited quotient Group instance; commutativity follows from finite-defect-central-lattice.
- `finiteDefect_ext` (extensionality): Two maps out of FiniteDefect agree if their composites with finiteDefectMk agree.
- `relElementary_le_SL` (structure): Every element of E_n(A,I) has determinant one, so E_n(A,I) is a subgroup of Γ_n(I).

Unit-test contracts:

- `finiteDefect_zero_test` (degenerate): FiniteDefect n ⊥ is trivial for every n≥3.
- `finiteDefect_integer_test` (computation): For n≥3 and nonzero N∈ℕ, FiniteDefect n (Nℤ) is trivial (BMS Corollary 4.3: ℚ has a real place).
- `finiteDefect_top_test` (computation): For A=ℤ and every n≥3, FiniteDefect n ⊤ = SL_n(ℤ)/E_n(ℤ) is trivial (Corollary 4.3(a)); in general FiniteDefect n ⊤ is SL_n(A)/E_n(A).
- `finiteDefect_det_test` (non-example): diag(−1,1,1) over ℤ at level 2 belongs to GL₃(ℤ,2ℤ) but has no representative in Γ₃(2ℤ); the defect cannot be defined using all GL.
- `finiteDefect_quotient_test` (compatibility): The kernel of finiteDefectMk is exactly the restriction of relElementary to Γ_n(I).

### The quotient first-row symbol

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-symbol`; proposed declaration `finite_defect_symbol`.

For A Dedekind, any ideal I and n≥3, the composite SL₂(A,I)→Γ_n(I)→FiniteDefect n I (upper-left stabilization, then finiteDefectMk) factors through firstRow:SL₂(A,I)→W_I via a unique function W_I→FiniteDefect n I, and this function is a Mennicke symbol.

Hypotheses: A is a Dedekind domain; I is any ideal of A. n ≥ 3.

Proof or construction:

1. Use finite-symbol-ms1 for the first-row factor and the two elementary moves.
2. Use finite-symbol-ms2 for numerator multiplication; combine these as one Mennicke symbol and use first-row surjectivity for uniqueness.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-symbol-ms1`, `KTheoryLowDegrees:U.4/finite-symbol-ms2`, `KTheoryLowDegrees:U.4/mennicke-symbol`, `KTheoryLowDegrees:U.4/relative-first-row-map`.

Acceptance: Completions (a b; c d) and (a b; c+ta, d+tb), t∈I, differ by left multiplication by (1 0; t 1)∈E₂(A,I) and give the same class. The value at (1,0) is the identity class.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(b), p.94; Theorem 5.4 and Lemma 5.5, pp.101–103. Theorem 4.1(b) (p.94) asserts the unique Mennicke symbol W_q→C_q(n) compatible with the first-row map; Remark 1 after Theorem 5.4 (p.101) says Theorem 5.4 proves it for Dedekind rings, using Lemma 5.5 (p.102) for well-definedness and MS1 and the rank-three computation (pp.102–103) for MS2.

### Rank-two images generate the finite defect

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-generated-sl2`; proposed declaration `finite_defect_generated_sl2`.

Every element of Γ_n(I) differs by E_n(A,I) from an upper-left stabilized element of SL₂(A,I), for n≥3 and A Dedekind.

Hypotheses: A is a Dedekind domain; I is any ideal of A. n ≥ 3.

Proof or construction:

1. Apply inherited relative-gl-reduction with stable range two.
2. Every relative elementary correction has determinant one, so the rank-two corner also has determinant one.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.4/relative-gl-reduction`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: Rank two cannot be lowered to one: over ℤ[i] with I=(8) the defect is μ₄≠1 (arithmetic-finite-defect-roots), so not every element of Γ₃(I) lies in E₃(ℤ[i],I). diag(−1,−1,1)∈Γ₃(2ℤ) is already the stabilization of −1∈SL₂(ℤ,2ℤ).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 7.5(b), p.106; proof of Theorem 4.1, pp.107–119. Theorem 7.5(b) (p.106) gives GL_m(A,q)=GL_{n−1}(A,q)·E_m(A,q) under (7.2)_n; for Dedekind A, (7.2)_3 holds, so every level-q matrix is a stabilized rank-two matrix times a relative elementary one, and the determinant forces the corner into SL₂.

### Extend any finite symbol through the quotient

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-universal-map`; proposed declaration `finite_defect_universal_map`.

For any Mennicke symbol s:W_I→C and n≥3, the iterated homomorphism κ_n restricted to Γ_n(I) factors through a homomorphism FiniteDefect n I→C whose rank-two values are s.

Hypotheses: A is a Dedekind domain; I is any ideal of A. n ≥ 3; C is any group and s:W_I→C is a Mennicke symbol.

Proof or construction:

1. Apply dedekind-iterated-symbol-hom and its elementary kernel.
2. Use native QuotientGroup.lift on the restricted elementary subgroup.

Direct prerequisites: `KTheoryLowDegrees:U.4/dedekind-iterated-symbol-hom`, `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `mathlib:QuotientGroup.lift`.

Acceptance: For F=ℚ(i), I=4ℤ[i] (r=2, Prop. 3.1 applies since 4/2−1≥1) and s=(−)₂, the class of a stabilized completion of (a,b)=(21,64+28i) maps to −1 (computed: (b/3)₂=−1, (b/7)₂=1). For the trivial symbol the factored map is trivial.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(c), pp.94–95,119. Theorem 4.1(c) (p.94), restated on p.95, says every Mennicke symbol comes from a homomorphism on SL_n(A,q) invariant under E_n(A)-conjugation; its proof is completed with Proposition 8.5 on p.119. The node restricts the resulting κ_n to Γ_n(I) and factors it through the quotient.

### Uniqueness of the finite symbol factorization

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-universal-uniqueness`; proposed declaration `finite_defect_universal_uniqueness`.

The factorization of finite-defect-universal-map is unique among maps with the prescribed rank-two first-row values.

Hypotheses: A is a Dedekind domain; I is any ideal of A. n ≥ 3; C is any group.

Proof or construction:

1. First-row surjectivity identifies the map on the rank-two subgroup.
2. Use finite-defect-generated-sl2 and quotient surjectivity to determine it on every class.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-generated-sl2`, `KTheoryLowDegrees:U.4/finite-defect-universal-map`, `KTheoryLowDegrees:U.4/relative-first-row-map`.

Acceptance: Two homomorphisms FiniteDefect n I→C that agree on the classes of all stabilized SL₂(A,I) elements are equal. The proof must cite finite-defect-generated-sl2; agreement on symbols alone does not determine a map on all of Γ_n(I).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(c), pp.94–95,119. The uniqueness half of Theorem 4.1(c) (pp.94–95): homomorphisms out of C_q(n) are determined by their values on stabilized SL₂(A,q) elements, because these together with E_n(A,q) generate SL_n(A,q) (Theorem 7.5(b)) and the first-row map is onto W_q (Lemma 5.3).

### Finite relative Mennicke universality

**Theorem:** `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`; proposed declaration `finiteDefectMennickeEquiv`.

For A Dedekind, any ideal I and n≥3, there is an isomorphism FiniteDefect n I ≃* MennickeGroup I sending the class of a stabilized g∈SL₂(A,I) with first row (a,b) to the universal symbol [b/a]. For every Mennicke symbol s:W_I→C, MennickeGroup.lift s composed with this isomorphism is the map of finite-defect-universal-map.

Hypotheses: A is a Dedekind domain; I is any ideal of A. n ≥ 3.

Proof or construction:

1. Use finite-defect-symbol to map the parent universal Mennicke group into FiniteDefect.
2. Use finite-defect-universal-map on the parent universal symbol for the inverse.
3. Apply universal-mennicke-group uniqueness and finite-defect-universal-uniqueness to both composites.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-symbol`, `KTheoryLowDegrees:U.4/finite-defect-universal-map`, `KTheoryLowDegrees:U.4/finite-defect-universal-uniqueness`, `KTheoryLowDegrees:U.4/universal-mennicke-group`.

Acceptance: The class of diag(g,1) goes to [b/a] with b the (0,1) entry, not to [c/a] or [a/b]. Over ℤ (or any O_{F,S} with S≠∅ or a real place) both sides are trivial at every nonzero I; over ℤ[i] at I=(8) both are cyclic of order 4.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(b)–(c), pp.94–95; proof completed p.119. Theorem 4.1(b)–(c) (p.94) say the first-row symbol W_q→C_q(n) exists and is universal, i.e. C_q(n) is the universal Mennicke group C_q; the node packages this as an explicit group isomorphism.

### Finite-rank defect stability

**Theorem:** `KTheoryLowDegrees:U.4/finite-defect-stabilization`; proposed declaration `finite_defect_stabilization`.

For A Dedekind and n≥3, stabilization FiniteDefect n I→FiniteDefect (n+1) I is an isomorphism compatible with first-row symbols.

Hypotheses: A is a Dedekind domain; I is any ideal of A. n ≥ 3.

Proof or construction:

1. Transport through finite-defect-mennicke-equivalence on both sides.
2. The induced map is the identity on universal symbols; their universal property determines the full map.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`, `KTheoryLowDegrees:U.4/universal-mennicke-group`.

Acceptance: The class of diag(g,1_{n−2}) maps to the class of diag(g,1_{n−1}); both correspond to the same [b/a]. The rank bound n≥3 is retained: no statement about SL₂(A,I)/E₂(A,I) is made.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.2, p.95. Corollary 4.2 (p.95) states that C_q(n)→C_q(n+1) is an isomorphism for n≥3; it follows because both sides are the universal Mennicke group by Theorem 4.1(b)–(c) and the stabilization preserves first rows.

### The finite defect is central in the ambient quotient

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-central-lattice`; proposed declaration `finite_defect_central_lattice`.

For A Dedekind and n≥3, E_n(A,I)=[SL_n(A),SL_n(A,I)]. In particular the image of Γ_n(I) in SL_n(A)/E_n(A,I) is central and FiniteDefect n I is abelian.

Hypotheses: A is a Dedekind domain; I is any ideal of A. n ≥ 3.

Proof or construction:

1. Use finite-gl-commutator-pullback to bound the SL commutator by E_n(A,I).
2. Use the parent KTheoryLowDegrees:U.5/relative-elementary-commutator ([E_n(A),E_n(A,I)]=E_n(A,I), BMS (5.1)) for the reverse bound.
3. In the ambient SL quotient the relative subgroup therefore centralizes every class; it is abelian.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-gl-commutator-pullback`, `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.5/relative-elementary-commutator`.

Acceptance: Retain n≥3; this does not give the SL₂ centrality theorem. At A=ℤ and I=ℤ the statement gives E₃(ℤ)=[SL₃(ℤ),SL₃(ℤ)], consistent with Corollary 4.3(a) (SL₃(ℤ)=E₃(ℤ) is perfect).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 4.1(a), p.94; proof: Theorem 11.1(a) and Corollary 11.3, pp.119–121, with (5.1), p.101. Theorem 4.1(a) (p.94) asserts E_n(A,q)=[SL_n(A),SL_n(A,q)] for Dedekind A and n≥3; the proof is concluded at Corollary 11.3 (pp.120–121), which combines Theorem 11.1(a) with (5.1). Centrality and commutativity of the quotient are immediate consequences added by the node.

### The level transition map

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-level-map`; proposed declaration `finite_defect_level_map`.

For J≤I, the inclusion Γ_n(J)→Γ_n(I) induces levelMap:FiniteDefect n J→*FiniteDefect n I. For A Dedekind, n≥3 and J≠0 it is surjective.

Hypotheses: A is a Dedekind domain; J≤I ideals of A; n≥3. Surjectivity needs J≠0.

Proof or construction:

1. Each relative elementary generator at J is also a generator at I, so descend inclusion through the native quotient.
2. Transport to parent MennickeGroup.restrictHom and apply inherited q-equivalence-smaller-ideal to give a representative at J for every symbol at I.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`, `KTheoryLowDegrees:U.4/q-equivalence-smaller-ideal`, `KTheoryLowDegrees:U.4/universal-mennicke-group`, `KTheoryLowDegrees:U.4/relative-first-row-map`.

Acceptance: J=⊥ is excluded: FiniteDefect 3 ⊥ is trivial but FiniteDefect 3 (8ℤ[i])≅μ₄. levelMap sends the class of a stabilized SL₂(A,J) matrix with first row (a,b) to the class with the same first row at level I.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 2.3, p.66 and (2.6), p.67; arithmetic case Theorem 3.6, p.77 and Corollary 4.3(c), pp.95–96. (2.6) (p.67) defines C_{q′}→C_q for q′⊂q and notes it is surjective by Lemma 2.3 (p.66: every pair in W_q is q-equivalent to one in W_{q′} for q′≠0); via Theorem 4.1 this is the level map of finite defects.

### The defect level maps compose

**Lemma:** `KTheoryLowDegrees:U.4/finite-defect-level-functor-laws`; proposed declaration `finite_defect_level_functor_laws`.

levelMap I I=id and levelMap J I∘levelMap K J=levelMap K I when K≤J≤I; they commute with rank stabilization.

Hypotheses: A is a Dedekind domain; K≤J≤I ideals of A; n≥3.

Proof or construction:

1. Check equalities after the surjective finiteDefectMk. Every map is induced by the same subgroup inclusion or upper-left stabilization.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-level-map`, `KTheoryLowDegrees:U.4/finite-defect-stabilization`.

Acceptance: levelMap I I is the identity and levelMap J I∘levelMap K J = levelMap K I. levelMap commutes with FiniteDefect n→FiniteDefect (n+1) stabilization.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollaries 4.2–4.3, pp.95–96. Implicit in Corollaries 4.2–4.3 (pp.95–96): the level maps C_q→C_{q′} and the rank stabilizations are induced by subgroup inclusions, so they compose and commute; BMS use this tacitly to form lim C_q in 4.3(d).

### The finite GL quotient satisfies extension conditions

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-projection-conditions`; proposed declaration `finite_gl_projection_conditions`.

For A Dedekind and n≥3, the quotient projection GL_n(A,I)→GL_n(A,I)/E_n(A,I) satisfies the inherited ExtensionConditions.

Hypotheses: A is a Dedekind domain; I is any ideal of A; n≥3. The target GL_n(A,I)/E_n(A,I) uses normality from relative-elementary-normal (stable range 2 < n).

Proof or construction:

1. Use parent relative-ge-commutator to obtain elementary and diagonal invariance in this stable rank.
2. Transpose preserves the relative elementary subgroup.
3. Use parent related-relative-elementary to compare the same-level oriented related matrices.

Direct prerequisites: `KTheoryLowDegrees:U.4/relative-elementary-normal`, `KTheoryLowDegrees:U.4/relative-ge-commutator`, `KTheoryLowDegrees:U.4/related-relative-elementary`, `KTheoryLowDegrees:U.4/extension-conditions`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`.

Acceptance: For n=3 the related-matrix condition uses rank-two transitivity (dedekind-relative-gl-transitive), not a stable-range-one hypothesis. The stable-rank specialization of the parent commutator bound is required here; it is not a statement about all rank-two matrices.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 11.1 proof, p.120. In the proof of Theorem 11.1 (p.120) the natural projection GL_n(A,q)→C_n is checked to satisfy (8.2)_n by Theorem 7.5(d), (8.3)_n by transpose-stability of E_n(A,q), and (8.4)_n by Lemma 8.9(b); these are the packet's ExtensionConditions.

### GL quotient stabilization is onto

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-stabilization-surjective`; proposed declaration `finite_gl_stabilization_surjective`.

For Dedekind A and n≥3, GL_n(A,I)/E_n(A,I)→GL_{n+1}(A,I)/E_{n+1}(A,I) is surjective.

Hypotheses: A is a Dedekind domain; I is any ideal of A; n≥3.

Proof or construction:

1. Use parent relative-gl-reduction to reduce to rank two, then place the corner in rank n.

Direct prerequisites: `KTheoryLowDegrees:U.4/relative-gl-reduction`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`, `KTheoryLowDegrees:U.4/relative-elementary-normal`.

Acceptance: A=ℤ, I=2ℤ, n=3: diag(1,1,1,−1)∈GL₄(ℤ,2ℤ) is congruent modulo E₄(ℤ,2ℤ) to the stabilization of diag(−1,1,1), since their quotient lies in SL₄(ℤ,2ℤ)=E₄(ℤ,2ℤ). Every class at rank n+1 has a representative diag(g,1) with g of rank n.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 7.5(b), p.106; Theorem 11.1 proof p.120. Theorem 7.5(b) (p.106) gives GL_m(A,q)=GL_{n−1}(A,q)·E_m(A,q) under (7.2)_n, which the proof of Theorem 11.1 (p.120) uses to get surjectivity of C_n→C_m; for Dedekind A the corner rank is two, so certainly n.

### A left inverse makes GL quotient stabilization injective

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-stabilization-injective`; proposed declaration `finite_gl_stabilization_injective`.

For Dedekind A and n≥3, the GL quotient stabilization is injective.

Hypotheses: A is a Dedekind domain; I is any ideal of A; n≥3.

Proof or construction:

1. Apply the completed higher-rank extension to finite-gl-projection-conditions. Its elementary kernel gives a quotient map in the reverse direction.
2. The restriction formula shows that the reverse map is a left inverse; use finite-gl-stabilization-surjective.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-gl-projection-conditions`, `KTheoryLowDegrees:U.4/finite-gl-stabilization-surjective`, `KTheoryLowDegrees:U.4/extended-hom`, `KTheoryLowDegrees:U.4/extended-hom-embed`, `KTheoryLowDegrees:U.4/extended-hom-elementary-kernel`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`, `KTheoryLowDegrees:U.4/dedekind-relative-gl-transitive`.

Acceptance: The reverse map sends the class of diag(g,1) to the class of g (extended-hom-embed). Over ℤ[i] at I=(8), GL₃(A,I)/E₃(A,I)→GL₄(A,I)/E₄(A,I) is an isomorphism whose determinant-one parts are both μ₄.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 11.1(b) proof, p.120. Proof of Theorem 11.1(b) (p.120): Proposition 8.6 extends the projection κ_n to κ_{n+1}:GL_{n+1}(A,q)→C_n killing E_{n+1}(A,q); the induced C_{n+1}→C_n is a left inverse of C_n→C_{n+1}, which is therefore injective.

### Pull stable commutators back to the original rank

**Lemma:** `KTheoryLowDegrees:U.4/finite-gl-commutator-pullback`; proposed declaration `finite_gl_commutator_pullback`.

For Dedekind A and n≥3, [GL_n(A),GL_n(A,I)]≤E_n(A,I).

Hypotheses: A is a Dedekind domain; I is any ideal of A; n≥3.

Proof or construction:

1. Raise rank until the parent relative-ge-commutator bound applies to GL.
2. Iterate finite-gl-stabilization-injective to identify the elementary intersection with the original rank.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-gl-stabilization-injective`, `KTheoryLowDegrees:U.4/relative-high-gl-commutator`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: n=3 is included: the stable bound is applied at m=4=2·2 and pulled back through one injective stabilization. At I=⊤ the statement gives [GL₃(A),GL₃(A)]≤E₃(A).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 11.1(a) proof, p.120. Proof of Theorem 11.1(a) (p.120): by Theorem 7.5(d) the GL commutator lies in E_m(A,q) for large m, and injectivity of C_n→C_m pulls this back to E_n(A,q); Corollary 11.3 (pp.120–121) makes n≥3 sufficient for Dedekind rings.

### The finite quotient obeys the first Mennicke relation

**Lemma:** `KTheoryLowDegrees:U.4/finite-symbol-ms1`; proposed declaration `finite_symbol_ms1`.

For n≥3 and Dedekind A, the first-row factor of SL₂(A,I) in FiniteDefect n I is well-defined and satisfies MS1 at the same level I.

Hypotheses: A is a Dedekind domain; I is any ideal of A; n≥3.

Proof or construction:

1. Use the parent first-row fibre; relative roots kill its differences.
2. For b↦b+ta with t∈I multiply on the right by a relative root. For a↦a+tb with t∈A conjugate by the root e₁₀(t)∈E_n(A); relative-ge-commutator (HasStableRange A 2 from dedekind-stable-range-two, n≥3) puts the commutator in E_n(A,I), so the class is unchanged.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `KTheoryLowDegrees:U.4/relative-first-row-fibre`, `KTheoryLowDegrees:U.4/relative-ge-commutator`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: (a,b), (a,b+ta) for t∈I and (a+tb,b) for t∈A have the same class. At I=⊤ any pair with a a unit has trivial class (BMS remark, p.71).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 5.4 and Lemma 5.5, pp.101–102. Lemma 5.5 (p.102): a homomorphism on SL₂(A,q) killing E₂(A,q) and [E₂(A),SL₂(A,q)] factors through the first row and satisfies MS1; Theorem 5.4's proof (p.102) gets these kernel conditions from E_n(A)-conjugation invariance and (5.1).

### The rank-three Mennicke multiplication identity

**Lemma:** `KTheoryLowDegrees:U.4/finite-symbol-ms2`; proposed declaration `finite_symbol_ms2`.

For two relative rows (a,b₁),(a,b₂) at I, their finite quotient first-row values multiply to the value of (a,b₁b₂), for every n≥3.

Hypotheses: A is a Dedekind domain; I is any ideal of A; n≥3 (the computation takes place in the upper-left 3×3 block).

Proof or construction:

1. Choose determinant-one relative completions and conjugate the second into coordinates 0,2 with the signed three-cycle.
2. Apply the three explicit relative elementary operations of p.103; the resulting rank-two block has first row (a,b₁b₂).
3. The two signed-cycle conjugations are by elements of E_n(A); relative-ge-commutator (HasStableRange A 2, n≥3) shows they do not change classes modulo E_n(A,I). The other three operations are relative elementary and are killed directly.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-symbol-ms1`, `KTheoryLowDegrees:U.4/relative-first-row-completion`, `KTheoryLowDegrees:U.4/relative-ge-commutator`, `KTheoryLowDegrees:U.4/dedekind-stable-range-two`.

Acceptance: The explicit identity ε₃ε₂α₁(ε₁α₂ε₁⁻¹)ε₄=(1,0,0; 0,d₁−b₁c₁d₂,−c₁c₂; 0,b₁b₂,a) holds for all α₁,α₂∈SL₂ with common a (checked on random integer cases). ε₂, ε₃, ε₄ have off-diagonal entries c₂, c₁d₂, b₂, b₁ in I, so they lie in E₃(A,I); ε₁, ε₅ lie in E₃(A).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 5.4 proof of MS2, pp.102–103. Proof of MS2 in Theorem 5.4 (pp.102–103): for (a,b₁),(a,b₂)∈W_q, conjugating α₂ by a signed 3-cycle, multiplying by three q-level elementary matrices and conjugating by a second signed permutation yields a matrix with first row (a,b₁b₂), so κ(α₁)κ(α₂)=[b₁b₂/a].

### Full GL commutators vanish in a sufficiently high relative rank

**Lemma:** `KTheoryLowDegrees:U.4/relative-high-gl-commutator`; proposed declaration `relative_high_gl_commutator`.

For HasStableRange A k, k≥1 and m≥2k with m≥3, [GL_m(A),GL_m(A,I)]≤E_m(A,I).

Hypotheses: A is a commutative ring with HasStableRange A k, k≥1; I is any ideal. m≥2k and m≥3.

Proof or construction:

1. Reduce both factors to k×k corners using relative-gl-reduction, once at I=A.
2. Use relative-ge-commutator to discard elementary correction factors modulo E_m(A,I).
3. Conjugate one corner by an elementary signed permutation into k disjoint coordinates; its value changes by an elementary commutator, and the resulting corners commute.

Direct prerequisites: `KTheoryLowDegrees:U.4/relative-gl-reduction`, `KTheoryLowDegrees:U.4/relative-ge-commutator`, `KTheoryLowDegrees:U.4/relative-elementary-normal`.

Acceptance: For Dedekind A (k=2) the bound is m≥4; k=1 gives m≥3. The block swap moving a k×k corner to disjoint coordinates needs m≥2k; for Dedekind A the rank-three inclusion is not proved here but obtained in finite-gl-commutator-pullback by pulling back from m=4.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 7.5(d), p.106; Theorem 11.1 proof, p.120. Theorem 7.5(d) (p.106): under (7.2)_n, for m≥3 the relative elementary group is its own commutator with E_m(A), and for m≥2(n−1) also equals [GL_m(A),GL_m(A,q)]; with n=k+1 this is the node's bound m≥2k. BMS defer the proof to Bass [1, Thm 4.2]; the node reconstructs it by corner reduction and a block swap.

## Arithmetic order and level declarations

### The arithmetic defect order

**Definition:** `KTheoryLowDegrees:U.4/arithmetic-defect-order`; proposed declaration `defectOrder`.

Let F be a number field, I a nonzero ideal of O_F and m=#μ(F) (NumberField.Units.torsionOrder F). For a rational prime p and n∈ℕ let jIndex F p n I be the minimum, over the primes 𝔭 of O_F containing p, of min(n, max(0, ⌊ord_𝔭(I)/ord_𝔭(p) − 1/(p−1)⌋)), the floor of a rational number. Define defectOrder F I = ∏_{p∣m} p^{jIndex F p (ord_p m) I}. Only nonzero I occur: the suggested signature of defectOrder takes a proof of I≠⊥, while jIndex is total and its value at I=⊥ is never used.

Hypotheses: F is a number field; I is a nonzero ideal of O_F (S=∅). m = NumberField.Units.torsionOrder F; total complexity of F is needed only by consumers of r(I), not by this definition.

Proof or construction:

1. Define jIndex as stated (an infimum of clipped floors over the finitely many primes above p) and take the finite product over the prime factors of m.
2. Each exponent is bounded between zero and ord_p(m), so the product is a positive divisor of m.

Direct prerequisites: `mathlib:NumberField.Units.torsionOrder`.

Acceptance: F=ℚ(i), I=(1+i)^h: r=1 for h≤3, 2 for h=4,5, 4 for h≥6; in particular (−)₂ is not a Mennicke symbol on W_{(1+i)³} (a=29, b=26−2i, t=i give values 1 and −1), so a ceiling or nearest-integer rounding (giving r=2 at h=3) is wrong. F=ℚ(i,√−7), 2O_F=(𝔓₁𝔓₂)²: r(𝔓₁⁶𝔓₂⁴)=2 and r(𝔓₁⁶)=1 (minimum over all primes above 2, not only those dividing I).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), (3.3), p.74; Theorem 3.6, p.77; Corollary 4.3(c), p.95. (3.3) (p.74) defines j_p(q) as the minimum over primes above p of the floor of ord_𝔭(q)/ord_𝔭(p)−1/(p−1) clipped to [0,n]; Theorem 3.6 (p.77) defines r(q) | m by ord_p(r)=j_p(q) with the clip [0,ord_p(m)]. The node transcribes this (Cor 4.3(c) repeats it with a misprinted index set).

Uses:

- BMS Corollary 4.3(c): Specifies the exact root subgroup at every nonzero level.
- BMS Corollary 4.3(d): Deep levels with defectOrder=m identify the inverse limit with one fixed μ(F).

Planning API:

- `defectOrder_dvd` (characterisation): defectOrder F I divides m.
- `defectOrder_pos` (structure): defectOrder F I is strictly positive.
- `defectOrder_mono` (functoriality): J≤I nonzero implies defectOrder F I divides defectOrder F J.
- `defectOrder_top` (simp): defectOrder F O_F=1.
- `defectOrder_deep` (characterisation): If ord_𝔭(I)≥ord_𝔭(p)(ord_p(m)+1/(p−1)) at every 𝔭 above p∣m, defectOrder F I=m.
- `jIndex` (data): jIndex F p n I is the minimum over primes 𝔭 of O_F above p of min(n, max(0, ⌊ord_𝔭(I)/ord_𝔭(p) − 1/(p−1)⌋)); for I=⊥ a junk value; the infimum runs over the subtype of primes above p, which is nonempty for p prime (an ℕ-valued infimum over a Prop-guarded index would be 0).
- `jIndex_le` (characterisation): jIndex F p n I ≤ n, and jIndex F p n I>0 implies ord_𝔭(I) ≥ ord_𝔭(p)(jIndex+1/(p−1)) for every 𝔭 above p.

Unit-test contracts:

- `defectOrder_top_test` (degenerate): At I=O_F the defect order is 1.
- `defectOrder_gaussian_test` (computation): For a number-field profile with m=4, a unique dyadic prime 𝔭, ord_𝔭(2)=2 and ord_𝔭(I)=h, r(I)=1 for h≤3, 2 for h=4,5 and 4 for h≥6. This applies to F=ℚ(i), I=(1+i)^h.
- `defectOrder_depth_test` (characterisation): A level meeting every displayed deep bound has order m; the exponent is capped at ord_p(m).
- `defectOrder_multiple_primes_test` (non-example): If there are distinct primes 𝔭₁,𝔭₂ over p and the local clipped floors are 1 at 𝔭₁ and 3 at every other prime over p, then jIndex F p n I=1, rather than the maximum 3 or a sum. A concrete instance: F=ℚ(i,√−7), where 2O_F=(𝔓₁𝔓₂)², has r(𝔓₁⁶𝔓₂⁴)=2, not 4, and r(𝔓₁⁶)=1, because the prime 𝔓₂ above 2 that does not divide the level still enters the minimum.
- `defectOrder_mixed_primes_test` (computation): For F=ℚ(ζ₃) (m=6; 2 is inert and 3=(1−ζ₃)²·unit): r((6))=1, r((12))=2, r((18))=3 and r((36))=6; the exponents at 2 and 3 are computed independently.

### The arithmetic residue symbol satisfies the Mennicke laws

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`; proposed declaration `arithmetic_residue_symbol_ms`.

For F totally complex, I≠0 and r=defectOrder F I, (a,b)↦(b/a)_r, with value 1 for b=0, is a Mennicke symbol W_I→μ_r(F). The first entry a is prime to r whenever r>1.

Hypotheses: F is a totally complex number field, S=∅, A=O_F; I is a nonzero ideal; r = defectOrder F I. The degree-r local symbols follow BMS's orientation (Art(b) acting on an r-th root of a) and are supplied through the recorded CFT layer 5/6/11 requests and the reciprocity and higher-unit gaps.

Proof or construction:

1. For p|r, jIndex>0 gives ord_𝔭(I)/ord_𝔭(p) − 1/(p−1) ≥ ord_p(r) at every 𝔭 above p, i.e. the hypothesis of BMS Proposition 3.1 with m replaced by r; in particular a is prime to r for (a,b)∈W_I.
2. MS2 and invariance under b↦b+ta (t∈I) are immediate from the definition of (b/a)_r as a bimultiplicative function of b modulo aA.
3. For a↦a+tb, write (b/a)_r through (A.21) as the product of Hilbert symbols at primes not dividing a; at primes prime to r use the tame formula (A.16) to see dependence on a only modulo b; at primes above p|r use (A.18) with j=ord_p(r); totally complex F has no archimedean contribution.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `ClassicalArithmeticCompletion:CA.1/power-residue-symbol-of-an-ideal`.

Acceptance: F=ℚ(i), I=4ℤ[i] (r=2): (−)₂ is MS1-invariant (no violation found among level-4 pairs), and (a,b)=(21,64+28i) has value −1; at I=2ℤ[i] (r=1) the quadratic symbol violates MS1 (a=−9−8i, b=−6−6i, t=i: values 1 and −1), so the depth bound cannot be dropped. The reciprocity and higher-unit interfaces are unresolved suppliers, not implicit prerequisites from downstream K₂.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proposition 3.1, pp.71–72; Theorem 3.6, p.77. Proposition 3.1 (p.71) states that for totally imaginary A with μ_m⊂k and q deep enough at the primes over m, (a,b)↦(b/a)_m is a Mennicke symbol on W_q, proved on p.72 from (A.16), (A.18), (A.20), (A.21); the Remark after Theorem 3.6 (p.77) applies it with m=r(q).

### The arithmetic symbol reaches every r-th root

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`; proposed declaration `arithmetic_residue_symbol_surjective`.

The universal-symbol factorization MennickeGroup I→μ_r(F) induced by arithmetic-residue-symbol-ms is surjective.

Hypotheses: F is a totally complex number field, S=∅, A=O_F; I is a nonzero ideal; r = defectOrder F I.

Proof or construction:

1. If r=1 there is nothing to prove. Otherwise choose a prime 𝔭 of O_F not dividing rI; N𝔭≡1 mod r and μ_r injects into (O_F/𝔭)^×.
2. By CRT choose a≡1 mod I with a∈𝔭∖𝔭²; then aO_F=𝔭𝔟 with 𝔟 prime to 𝔭 and to I.
3. Let g generate the cyclic group (O_F/𝔭)^×; by CRT choose b∈I with b≡g mod 𝔭 and b≡1 mod 𝔟. Then (a,b)∈W_I and (b/a)_r=(g/𝔭)_r, which has exact order r, so it generates μ_r(F).
4. The universal factorization MennickeGroup I→μ_r(F) of arithmetic-residue-symbol-ms sends the universal symbol of (a,b) to this generator.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `ClassicalArithmeticCompletion:CA.1/power-residue-symbol`, `ClassicalArithmeticCompletion:CA.1/power-residue-symbol-of-an-ideal`, `ClassicalArithmeticCompletion:CA.1/norm-of-a-prime-is-one-modulo-n`, `mathlib:IsDedekindDomain.exists_forall_sub_mem_ideal`, `mathlib:Ideal.rootsOfUnityMapQuot_injective`, `KTheoryLowDegrees:U.4/universal-mennicke-group`.

Acceptance: F=ℚ(i), I=4ℤ[i], r=2, 𝔭=(3): a=21, b=64+28i gives (b/a)₂=(b/3)₂(b/7)₂=(−1)(1)=−1. No Dirichlet-density or local-symbol input is used.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Theorem 3.6, p.78. In the proof of Theorem 3.6 (p.78) the induced map f:C_q→μ_r is called clearly surjective; the node supplies the elementary reason: a first entry with one simple prime factor 𝔭 and a second entry that is a primitive root modulo 𝔭.

### Reduction to pⁿ-th powers when the p^j residue symbol is trivial

**Lemma:** `KTheoryLowDegrees:U.4/power-reduction-trivial-residue`; proposed declaration `power_reduction_trivial_residue`.

Let F be a totally complex number field, A=O_F, p a prime with n=ord_p(#μ(F))≥1, and q a nonzero ideal with j=jIndex F p n q>0 (so every prime above p divides q). If (a,b)∈W_q and (b/a)_{p^j}=1, then there are q₀∈q, a₁∈A with a₁≡1 mod q₀A, and c∈A such that (a,b)∼_q(a₁,c^{pⁿ}q₀).

Hypotheses: F totally complex, S=∅, A=O_F; q≠0; j=jIndex F p n q>0. Local symbols in BMS orientation; the local image formula (A.17), the tame formula (A.16) and the reciprocity formula (A.21) are the recorded higher-unit and reciprocity gaps.

Proof or construction:

1. (−)_{p^j} is a Mennicke symbol on W_q: it is a power of the symbol of arithmetic-residue-symbol-ms (BMS Lemma 3.4(b)).
2. Choose 𝔭₀ above p realizing the minimum in jIndex; with h=ord_{𝔭₀}(q), (A.17) gives u≡1 mod q and a unit v at 𝔭₀ with (u,v/𝔭₀)_{pⁿ} generating μ_{p^{n−j}} (BMS Lemma 3.4(a)).
3. Choose q₀∈q with ord_𝔭(q₀)=ord_𝔭(q) at every 𝔭 above p and, by q-equivalence-smaller-ideal, (a′,b′q₀)∈W_{q₀A} q-equivalent to (a,b); then (b′/a′)_{p^j}=1.
4. Dirichlet (A.10): a prime b₁A prime to q with b₁≡b′ mod a′, b₁ close to v at 𝔭₀ and to 1 at the other primes above p. By (A.17), (a′,b₁/𝔭₀)_{pⁿ}∈μ_{p^{n−j}}, so (a′,b₁/𝔭₀)_{p^j}=1; reciprocity applied to 1=(b₁/a′)_{p^j} then gives (a′,b₁/b₁A)_{p^j}=1, i.e. (a′,b₁/b₁A)_{pⁿ}∈μ_{p^{n−j}}; pick i with (u,v/𝔭₀)^i_{pⁿ}(a′,b₁/b₁A)_{pⁿ}=1.
5. Dirichlet again: a prime a₁ with a₁≡a′ mod b₁q₀ and a₁ close to u^i at 𝔭₀. Since a′ and u^i lie in U_{𝔭₀}(h), h=ord_{𝔭₀}(q₀), apply (A.10) with modulus b₁ (prime to q), local conditions a₁∈a′U_𝔭(ord_𝔭 q₀) at the primes 𝔭≠𝔭₀ dividing q₀ and a₁∈u^i(U_{𝔭₀}(h)∩F_{𝔭₀}^{×pⁿ}) at 𝔭₀; the Chinese remainder theorem then gives a₁≡a′ mod b₁q₀. Reciprocity with (A.16) gives (b₁/a₁)_{pⁿ}=1, so b₁≡c^{pⁿ} mod a₁, and (a,b)∼(a′,b′q₀)∼(a′,b₁q₀)∼(a₁,b₁q₀)∼(a₁,c^{pⁿ}q₀).

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/arithmetic-defect-order`, `KTheoryLowDegrees:U.4/q-equivalence-smaller-ideal`, `KTheoryLowDegrees:U.4/dirichlet-theorem-arithmetic-type`, `KTheoryLowDegrees:U.4/mennicke-symbol`, `ClassicalArithmeticCompletion:CA.1/power-residue-symbol-of-an-ideal`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance: F=ℚ(i), p=2, q=(1+i)⁴ (j=1): a pair with trivial quadratic residue reduces to second entry c⁴q₀. With j=0 the statement is the parent power-reduction-totally-imaginary; the hypothesis (b/a)_{p^j}=1 cannot be dropped when j>0.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Lemma 3.4, p.74; Theorem 3.5, Case 3, pp.75–77. Theorem 3.5 (p.74) gives the pⁿ-th power reduction except when A is totally imaginary and (b/a)_{p^j}≠1; Case 3 (pp.75–77) proves it for totally imaginary A, q divisible by all primes over p and trivial p^j residue, using Lemma 3.4, Dirichlet's theorem and reciprocity.

### The arithmetic residue symbol has trivial kernel

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-injective`; proposed declaration `arithmetic_residue_symbol_injective`.

The induced MennickeGroup I→μ_r(F) is injective.

Hypotheses: F is a totally complex number field, S=∅, A=O_F; I is a nonzero ideal; r = defectOrder F I; m=#μ(F).

Proof or construction:

1. MennickeGroup I is cyclic of order dividing m (mennicke-group-exponent). Fix p, write m=pⁿm′ and r=p^j r′ with j=jIndex, and let C_p be the p-primary part.
2. C_p is generated by p-parts [b^{m′}/a] of symbols, hence by one such symbol; all its powers are symbols by MS2. Let y=[β/α]∈C_p with image 1; then (β/α)_{p^j}=((β/α)_r)^{r′}=1.
3. If j=0 apply parent power-reduction-totally-imaginary; if j>0 apply power-reduction-trivial-residue. Either gives (α,β)∼_I(a₁,c^{pⁿ}q₀) with a₁≡1 mod q₀, so y=[cq₀/a₁]^{pⁿ} by mennicke-symbol-residue-homomorphism; its order is prime to p, so y=1.
4. Hence the kernel has trivial p-part for every p and is trivial.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/mennicke-group-exponent`, `KTheoryLowDegrees:U.4/mennicke-group-locally-cyclic`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`, `KTheoryLowDegrees:U.4/power-reduction-trivial-residue`, `KTheoryLowDegrees:U.4/mennicke-symbol-residue-homomorphism`, `ClassicalArithmeticCompletion:CA.1/power-residue-symbol-of-an-ideal`.

Acceptance: F=ℚ(i), I=(8)=(1+i)⁶: r=4 and MennickeGroup I≅μ₄; at I=(4): r=2, so a symbol with trivial quadratic residue is trivial. The j>0 case must use power-reduction-trivial-residue; the parent power-reduction-totally-imaginary covers only j=0.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Theorem 3.6, p.78; Theorem 3.5, Case 3, pp.75–77. In the proof of Theorem 3.6 (p.78) BMS reduce to p-primary parts and show C_p∩ker f=1: a symbol with trivial p^j residue is q-equivalent to a pair with second entry c^{pⁿ}q by Theorem 3.5 (pp.74–77), hence is a pⁿ-th power in a group of exponent pⁿ.

### Arithmetic finite defects are roots of unity

**Theorem:** `KTheoryLowDegrees:U.4/arithmetic-finite-defect-roots`; proposed declaration `arithmeticFiniteDefectRoots`.

For A=O_{F,S}, S finite and I≠0, n≥3: FiniteDefect n I is trivial if S≠∅ or F has a real place. Otherwise it is canonically equivalent to μ_{defectOrder F I}(F), normalized by the residue symbol (b/a)_r.

Hypotheses: F is a number field, S a finite set of finite primes, A=O_{F,S}; I a nonzero ideal of A; n≥3. The second branch assumes S=∅ and F totally complex (BMS 'totally imaginary'), with r=defectOrder F I.

Proof or construction:

1. For the first branch use the inherited arithmetic-mennicke-symbols-trivial and finite-defect-mennicke-equivalence.
2. For the totally complex S=∅ branch use arithmetic-residue-symbol-surjective and arithmetic-residue-symbol-injective, then the first-isomorphism equivalence.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`, `KTheoryLowDegrees:U.4/arithmetic-mennicke-symbols-trivial`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-surjective`, `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-injective`, `mathlib:QuotientGroup.quotientKerEquivOfSurjective`.

Acceptance: F=ℚ(√−2) (m=2, 2O_F=𝔭², e=2): FiniteDefect 3 (2) is trivial and FiniteDefect 3 (4)≅μ₂ (r=2 iff ord_𝔭(I)≥4). A=ℤ[i,1/2] (F totally complex but S={(1+i)}≠∅): every FiniteDefect n I is trivial.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.3(b)–(c), pp.95–96. Corollary 4.3(b)–(c) (p.95) combine Theorem 4.1 (C_q(n) is the universal Mennicke group) with Theorem 3.6: trivial unless A is totally imaginary, and μ_{r(q)} via the residue symbol otherwise.

### Root normalization of level transitions

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-defect-transition-power`; proposed declaration `arithmetic_defect_transition_power`.

For F totally complex, nonzero J≤I, r_J=defectOrder F J and r_I=defectOrder F I, the level map corresponds to μ_{r_J}(F)→μ_{r_I}(F), z↦z^{r_J/r_I}.

Hypotheses: F is a totally complex number field, S=∅, A=O_F; J≤I nonzero ideals; n≥3; r_J, r_I the defect orders (r_I | r_J).

Proof or construction:

1. The defining ideal residue symbols satisfy (b/a)_{r_I}=((b/a)_{r_J})^{r_J/r_I}.
2. Use finite-defect-mennicke-equivalence and surjectivity to extend the identity from first rows to every defect class.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`, `KTheoryLowDegrees:U.4/finite-defect-level-map`, `KTheoryLowDegrees:U.4/arithmetic-finite-defect-roots`, `KTheoryLowDegrees:U.4/defect-order-monotonicity`, `ClassicalArithmeticCompletion:CA.1/power-residue-symbol-of-an-ideal`.

Acceptance: F=ℚ(i): from J=(8) (r=4) to I=(4) (r=2) the map is z↦z²; from J=(8) to I=(2) (r=1) it is trivial. The direction is from the smaller ideal J (larger root group) to I, by the quotient r_J/r_I power; it is not root inclusion.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6 and Corollary 4.3(c), pp.77,95–96. Theorem 3.6 (p.77) and Corollary 4.3(c) (p.96) state that for q⊂q′ the natural map C_q→C_{q′} corresponds to the (r/r′)-th power map μ_r→μ_{r′}, because (−)_{r′} is the (r/r′)-th power of (−)_r.

### Deep full-root levels are cofinal

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-defect-deep-cofinality`; proposed declaration `arithmetic_defect_deep_cofinality`.

For every nonzero ideal I of O_F there is a nonzero J≤I with defectOrder F J=m. Such full-root levels are cofinal, and their normalized transition maps are identities on μ_m(F).

Hypotheses: F is a totally complex number field, S=∅, A=O_F; I a nonzero ideal; m=#μ(F); n≥3 for the defect groups.

Proof or construction:

1. Multiply I by sufficiently high powers of the finitely many primes over m, retaining nonzero and obtaining every local depth bound.
2. Apply defectOrder_deep and arithmetic-defect-transition-power with r_J=r_I=m on the full-root subfamily.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`, `KTheoryLowDegrees:U.4/arithmetic-defect-transition-power`, `KTheoryLowDegrees:U.4/defect-order-full-depth`.

Acceptance: F=ℚ(i), I=(3): J=(3)(1+i)⁶ satisfies J≤I and defectOrder=4=m. Between two full-root levels the transition z↦z^{m/m} is the identity.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.3(d), p.96. Corollary 4.3(d) (p.96) is said to follow immediately from (b)–(c); the node supplies the routine step that levels deep at every prime over m (r=m) are cofinal among nonzero ideals and that transitions between them are identities.

### The inverse limit of relative defects

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-defect-limit`; proposed declaration `arithmetic_defect_limit`.

Fix n≥3. Over the directed set of nonzero ideals of A=O_{F,S} ordered by reverse inclusion, the inverse limit of FiniteDefect n I along the level maps is μ(F) when S=∅ and F is totally complex, with projection to level I given by z↦z^{m/r(I)}, and is trivial otherwise.

Hypotheses: F is a number field, S a finite set of finite primes, A=O_{F,S}; n≥3. In the first branch S=∅, F totally complex, m=#μ(F) and r=defectOrder.

Proof or construction:

1. Use arithmetic-defect-deep-cofinality to restrict to a constant full-root system.
2. For each original level extend the family by arithmetic-defect-transition-power; the functor laws give compatibility and uniqueness.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-deep-cofinality`, `KTheoryLowDegrees:U.4/arithmetic-defect-transition-power`, `KTheoryLowDegrees:U.4/finite-defect-level-functor-laws`, `KTheoryLowDegrees:U.4/arithmetic-finite-defect-roots`.

Acceptance: F=ℚ(i): the limit is μ₄; the projection to level (4) is z↦z² and to level (2) is trivial. A=ℤ or A=ℤ[i,1/2]: the limit is trivial.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Corollary 4.3(d), p.96. Corollary 4.3(d) (p.96) states lim C_q is trivial if A is not totally imaginary and μ_m if it is, as an immediate consequence of 4.3(b)–(c).

### Defect order divides the root count

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-divisor`; proposed declaration `defect_order_divisor`.

For every nonzero level I, defectOrder F I is a positive divisor of m=#μ(F).

Hypotheses: F is a number field; I is a nonzero ideal of O_F; m=#μ(F).

Proof or construction:

1. Every jIndex is between 0 and ord_p(m); compare prime exponents in the finite product.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: F=ℚ(ζ₃): r((18))=3 and r((36))=6 both divide m=6. Exponents are clipped at ord_p(m): F=ℚ(i), I=(1+i)^{20} still has r=4.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6, p.77; (3.3), p.74. Theorem 3.6 (p.77) defines r(q) as the divisor of m with ord_p(r)=j_p(q)∈[0,ord_p(m)]; the node records that positivity and divisibility.

### Smaller ideals give divisible defect orders

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-monotonicity`; proposed declaration `defect_order_monotonicity`.

For nonzero J≤I, defectOrder F I divides defectOrder F J.

Hypotheses: F is a number field; J≤I nonzero ideals of O_F.

Proof or construction:

1. Ideal containment increases every ord_𝔭; the clipped floor and minimum are monotone; compare the finite products.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: F=ℚ(i): r((4))=2 divides r((8))=4. F=ℚ(ζ₃): (36)≤(12) and r((12))=2 divides r((36))=6, while (18) and (12) are incomparable with r=3 and 2.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6, p.77; Corollary 4.3(c), p.96. Implicit in the last assertion of Theorem 3.6 (p.77): for q⊂q′ the (r/r′)-th power map requires r(q′) | r(q); it follows from monotonicity of ord_𝔭 and of the clipped floor.

### The unit level has no arithmetic defect

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-unit-level`; proposed declaration `defect_order_unit_level`.

defectOrder F (⊤:Ideal O_F)=1.

Hypotheses: F is a number field; I=⊤=O_F.

Proof or construction:

1. Every ord_𝔭(⊤) is 0, so every clipped floor in jIndex is 0.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: For p=2 the floor of −1 is −1, for odd p the floor of −1/(p−1) is −1; both clip to 0. Consistent with C_A=1 (SK₁(O_F)=1).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 3.6, p.77; (3.3), p.74. With ord_𝔭(A)=0 the quantity in (3.3) is −1/(p−1)<0, so j_p(A)=0 for all p (as the parent records for the stable case) and r(A)=1.

### A sufficiently deep level has the full root order

**Lemma:** `KTheoryLowDegrees:U.4/defect-order-full-depth`; proposed declaration `defect_order_full_depth`.

If I≠0 and ord_𝔭(I)≥ord_𝔭(p)(ord_p(m)+1/(p−1)) at each prime over p∣m, then defectOrder F I=m.

Hypotheses: F is a number field; I a nonzero ideal of O_F; m=#μ(F); the bound holds at every prime above every p | m.

Proof or construction:

1. Each local clipped exponent equals ord_p(m), so the minimum does also; use prime factorization of m.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-defect-order`.

Acceptance: F=ℚ(i): the bound reads h≥6 and r((1+i)⁶)=4=m, while h=5 gives only r=2. Integer form: (p−1)·ord_𝔭(I) ≥ ord_𝔭(p)·((p−1)·ord_p(m)+1); for ℚ(ζ₃) at p=3 (e=2, ord_3(6)=1) it requires ord_𝔭(I)≥3.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proposition 3.1, p.71; Theorem 3.6, p.77; Corollary 4.3(d), p.96. The depth bound is the hypothesis of Proposition 3.1 for m=#μ(F); under it every clipped floor in Theorem 3.6 reaches ord_p(m), so r=m (the levels used for lim C_q≅μ_m in Corollary 4.3(d)).

## Completion and index declarations

### Every nonzero S-integer residue ring is finite

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-residue-ring-finite`; proposed declaration `arithmetic_residue_ring_finite`.

For F a number field, S finite and nonzero I⊂O_{F,S}, O_{F,S}/I is finite.

Hypotheses: F is a number field, S a finite set of nonzero primes of 𝓞_F (finite places only), A = O_{F,S} = Set.integer S F. I is a nonzero ideal of A. The unit ideal is allowed.

Proof or construction:

1. Let R = 𝓞_F, f = algebraMap R A and J = I.comap f. J ≠ ⊥ by IsDedekindDomain.integer_comap_ne_bot, so R/J is finite by Ideal.finiteQuotientOfFreeOfNeBot (equivalently absNorm J ∈ J is a nonzero integer).
2. The induced map Ideal.quotientMap I f : R/J → A/I is injective (Ideal.quotientMap_injective); call its image R₀, a finite subring.
3. By s-integers-ring-of-fractions every x ∈ A is y/s^k with y ∈ R and s ∈ R a unit of A. Multiplication by s̄ is injective on R₀ (s̄ is a unit of A/I), hence bijective on the finite set R₀, so s̄⁻¹ ∈ R₀ and x̄ = ȳ s̄^{-k} ∈ R₀. Thus R/J ≃ A/I and A/I is finite.

Direct prerequisites: `KTheoryLowDegrees:U.4/s-integers-ring-of-fractions`, `tauceti:IsDedekindDomain.integer_comap_ne_bot`, `mathlib:Ideal.finiteQuotientOfFreeOfNeBot`, `mathlib:Ideal.quotientMap_injective`, `mathlib:Ideal.absNorm_mem`.

Acceptance: I = A gives the zero ring, which is finite. F = ℚ, S = {2}, A = ℤ[1/2], I = 6A: the contraction is J = 3ℤ and |A/I| = 3, not 6; a proof that counts 𝓞_F/(generator of I) instead of 𝓞_F/(I ∩ 𝓞_F) fails here.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §1.2, p.490. Serre records that A/q is finite for every nonzero ideal q of the ring of S-integers; the node proves this from the pinned contraction and finite-quotient declarations.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, p.128. BMS note that congruence subgroups have finite index, which rests on this finiteness.

### Congruence subgroups have finite index

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-congruence-index`; proposed declaration `arithmetic_congruence_index`.

Γ_n(I) has finite index in SL_n(O_{F,S}) for every nonzero I.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}; any matrix size n. I a nonzero ideal of A; Γ_n(I) is the determinant-one part of U.5 congruenceSubgroup.

Proof or construction:

1. Γ_n(I) is the kernel of SpecialLinearGroup.map (Ideal.Quotient.mk I) : SL_n(A) → SL_n(A/I), by the entrywise description of congruenceSubgroup.
2. A/I is finite (arithmetic-residue-ring-finite), so SL_n(A/I) is finite and the range is finite; Subgroup.finiteIndex_ker gives finite index (index_ker: the index is the order of the image).

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-residue-ring-finite`, `mathlib:Subgroup.finiteIndex_ker`, `mathlib:Subgroup.index_ker`, `mathlib:Matrix.SpecialLinearGroup.map`.

Acceptance: A = ℤ, n = 2, I = 2ℤ: the index is 6 = |SL₂(𝔽₂)|; I = 3ℤ gives 24. I = 0 must be excluded: Γ_n(0) = 1 has infinite index in SL_n(ℤ) for n ≥ 2.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, p.128. BMS p.128 defines S-congruence subgroups of Γ as those containing some Γ_q, q ≠ 0, and notes they have finite index; Serre §1.2 p.490 says the same for SL₂. The node is that finiteness statement for every n.

### Relative elementary subgroups have finite index

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-elementary-index`; proposed declaration `arithmetic_elementary_index`.

For n≥3 and nonzero I, E_n(O_{F,S},I) has finite index in SL_n(O_{F,S}).

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}. n ≥ 3 and I a nonzero ideal; E_n(A,I) is U.5's relative elementary subgroup, read in SL_n(A) by comap.

Proof or construction:

1. FiniteDefect n I ≃* MennickeGroup I (finite-defect-mennicke-equivalence), and MennickeGroup I is cyclic of order dividing #μ(F) (mennicke-group-exponent), so [Γ_n(I) : E_n(A,I)] is finite.
2. Combine with arithmetic-congruence-index via Subgroup.relIndex_mul_index; do not infer finite index from elementary cofinality.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-congruence-index`, `KTheoryLowDegrees:U.4/finite-defect-mennicke-equivalence`, `KTheoryLowDegrees:U.4/mennicke-group-exponent`, `mathlib:Subgroup.relIndex_mul_index`.

Acceptance: F = ℚ, S = ∅, n = 3, I = 2ℤ: E_3(ℤ,2ℤ) = Γ_3(2ℤ) (C_q trivial since ℚ has a real place), so the index is |SL₃(𝔽₂)| = 168. The bound [Γ_n(I) : E_n(A,I)] divides #μ(F) must be available without the residue-symbol nodes; check the dependency closure of this node contains no CA.1/CFT layer-5 request.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Proof of Theorem 14.1, pp.129–130. In the proof of Theorem 14.1 (p.129) BMS deduce from Corollary 4.3 that E_q has finite index in Γ for q ≠ 0; only finiteness of Γ_q/E_q is used, combined with the finite index of Γ_q.

### Elementary levels are cofinal among finite-index normal subgroups

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-elementary-cofinal`; proposed declaration `arithmetic_elementary_cofinal`.

For n≥3, every finite-index normal subgroup of Γ=SL_n(O_{F,S}) contains E_n(A,I) for some nonzero I. Together with arithmetic-elementary-index this is a cofinal system of finite-index normal subgroups.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, Γ = SL_n(A) with n ≥ 3. Levels I range over nonzero ideals of A.

Proof or construction:

1. Use inherited finite-index-elementary-cofinality for containment.
2. Use arithmetic-elementary-index for the converse inclusion in the profinite neighborhood system.

Direct prerequisites: `KTheoryLowDegrees:U.4/finite-index-elementary-cofinality`, `KTheoryLowDegrees:U.4/arithmetic-elementary-index`.

Acceptance: The finite-index half needs n ≥ 3: for n = 2, A = ℤ, I = 6ℤ the normal closure of the level-6 upper roots has infinite index, since PSL₂(ℤ) modulo the normal closure of T⁶ is the infinite (2,3,6) triangle group. I = 0 is excluded: E_n(A,0) = 1 has infinite index.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1 proof, pp.129–130. In the proof of Theorem 14.1 (pp.129–130) BMS combine Corollary 4.3 (E_q has finite index) with Theorem 7.5(e) (every finite-index subgroup contains some E_q) to conclude that the E_q form a cofinal family of finite-index subgroups. The node states exactly that cofinality.

### Describe the arithmetic lattice completion by elementary quotients

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`; proposed declaration `arithmetic_completion_level_description`.

The native profinite completion Γ̂ is topologically isomorphic to lim_I Γ/E_n(A,I) for n≥3 and nonzero ideal levels. The unit Γ→Γ̂ agrees with the compatible quotient maps.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, Γ = SL_n(A), n ≥ 3. The limit is over nonzero ideals I ordered by reverse inclusion; Γ/E_n(A,I) is finite by arithmetic-elementary-index.

Proof or construction:

1. completion Γ is the limit over FiniteIndexNormalSubgroup Γ; send a compatible family to its E_n(A,I)-coordinates.
2. Injectivity and surjectivity follow from arithmetic-elementary-cofinal (each finite-index normal N contains some E_n(A,I), and J ≤ I implies E_n(A,J) ≤ E_n(A,I)); continuity is coordinatewise and a continuous bijection from a compact space to a Hausdorff one is a homeomorphism.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-elementary-cofinal`, `mathlib:ProfiniteGrp.profiniteCompletion`, `mathlib:ProfiniteGrp.ProfiniteCompletion.lift`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `mathlib:ProfiniteGrp.ProfiniteCompletion.completion`, `mathlib:ProfiniteGrp.ProfiniteCompletion.eta`.

Acceptance: The composite Γ → completion Γ → Γ/E_n(A,I) is QuotientGroup.mk for every I (this pins the identification, not just an abstract isomorphism). For F = ℚ, S = ∅, n = 3 every E_n(ℤ,I) equals Γ_n(I), so the description must agree with the congruence description of congruence-completion-level-description.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14 completion construction and Theorem 14.1, pp.128–130. BMS p.129 note that the closure of Γ in the arithmetic completion is the profinite completion of Γ, and p.130 rewrites it as lim Γ/E_q using the cofinality of the E_q. The node is that identification for the native Mathlib completion.

### Describe the congruence lattice completion

**Lemma:** `KTheoryLowDegrees:U.4/congruence-completion-level-description`; proposed declaration `congruence_completion_level_description`.

The congruence completion Γ̄ is lim_I Γ/Γ_n(I), a profinite group, and the natural map Γ̂→Γ̄ is a continuous surjective homomorphism.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, Γ = SL_n(A), any n ≥ 1 (n ≥ 3 only where arithmetic-completion-level-description is used). Γ̄ is defined as the limit in ProfiniteGrp of the finite groups Γ/Γ_n(I), I nonzero.

Proof or construction:

1. Each congruence quotient is finite by arithmetic-congruence-index.
2. Use the native completion lift for each finite quotient, and form the compatible map. Its image is compact and contains the dense image of Γ.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-congruence-index`, `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`.

Acceptance: Each coordinate Γ → Γ/Γ_n(I) is surjective, which is what makes the image of Γ dense; check the comparison composed with the unit of arithmetic-completion-level-description is the diagonal quotient map. A = ℤ, n = 2: Γ̄ ≅ SL₂(Ẑ) is not needed here and should not be asserted; only the inverse-limit description is claimed.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, pp.129–130. BMS p.129 obtain the comparison Γ̂ → Γ̄ as a continuous surjection (compact image, dense) and p.130 write Γ̄ as lim Γ/Γ_q. The node packages this with the finite congruence quotients from arithmetic-congruence-index.

### The congruence kernel of an S-arithmetic special linear lattice

**Definition:** `KTheoryLowDegrees:U.4/lattice-congruence-kernel`; proposed declaration `latticeCongruenceKernel`.

Let F be a number field, S a finite set of finite primes, A=O_{F,S}, n≥1 and Γ=SL_n(A). The congruence kernel C_n(F,S) is the kernel of the canonical map from the profinite completion Γ̂ (Mathlib's native profinite completion of Γ, with dense canonical map η:Γ→Γ̂) to the congruence completion Γ̄=lim_{I≠0} Γ/Γ_n(I). Since every Γ_n(I) with I≠0 has finite index, C_n(F,S) is the intersection, over nonzero ideals I of A, of the closures in Γ̂ of η(Γ_n(I)); this intersection is the carrier of the suggested definition. It is BMS's kernel C^S(SL_n) computed on the open subgroup Γ̂, where BMS's set of places is S together with all archimedean places.

Hypotheses: F is a number field, S is a finite set of finite primes of O_F and A=O_{F,S}; BMS's set of places is S together with all archimedean places. n≥1, and only nonzero ideals I of A index the congruence levels Γ_n(I).

Proof or construction:

1. Form Γ̂ by mathlib:ProfiniteGrp.profiniteCompletion and its canonical map η, whose image is dense.
2. For nonzero I, Γ_n(I) is normal of finite index by arithmetic-congruence-index, so the closure of η(Γ_n(I)) is the open kernel of the projection Γ̂→Γ/Γ_n(I). Intersect over all nonzero I.
3. By congruence-completion-level-description the intersection is the kernel of Γ̂→Γ̄; closedness and normality follow from the description as an intersection of open normal subgroups.

Direct prerequisites: `mathlib:ProfiniteGrp.profiniteCompletion`, `KTheoryLowDegrees:U.5/congruence-subgroup`, `KTheoryLowDegrees:U.4/arithmetic-congruence-index`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`.

Acceptance: Only nonzero levels occur: including the zero ideal would make the intersection trivial for every n, and the SL₂(ℤ) test would fail. η(g) lies in the kernel only for g=1, because the nonzero congruence levels of Γ intersect in the identity.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, pp.128–129. BMS give the lattice and the rational group the S-congruence and S-arithmetic topologies, note that the closure of the lattice in the arithmetic completion is its profinite completion, and define the congruence kernel as the kernel of the comparison map, which equals the kernel of its restriction to that closure. The node takes this restricted form for O_{F,S}-points of SL_n.

Uses:

- BMS §14, p.129, and Theorem 14.1, pp.129–130: the congruence subgroup problem asks whether this kernel is trivial; Theorem 14.1 computes it for SL_n with n≥3
- Serre 1970, Théorème 2, p.499: for SL₂ with r₁+r₂+|S|≥2 the kernel is trivial or μ(F)
- Calegari–Geraghty, Remark 9.3: finiteness of the kernel makes mod-p characters of the lattice factor through congruence quotients up to a finite central term

Planning API:

- `latticeCongruenceKernel_le` (projection): For every nonzero ideal I, C_n(F,S) lies in the closure of η(Γ_n(I)).
- `latticeCongruenceKernel_isClosed` (structure): C_n(F,S) is closed in Γ̂.
- `latticeCongruenceKernel_normal` (instance): C_n(F,S) is a normal subgroup of Γ̂.
- `latticeEta_mem_latticeCongruenceKernel_iff` (characterisation): For S finite and g∈Γ, η(g) lies in C_n(F,S) if and only if g=1.

Unit-test contracts:

- `latticeCongruenceKernel_rank_one_test` (degenerate): For n=1 the kernel is trivial, because SL_1(A) is the trivial group.
- `latticeCongruenceKernel_sl2_integers_test` (non-example): For F=ℚ, S=∅ and n=2 the kernel is infinite: SL₂(ℤ) has finite-index subgroups that are not congruence subgroups (Serre 1970, §3, the finite-unit-rank case). A definition that also used the zero level would make it trivial.
- `latticeCongruenceKernel_gaussian_test` (computation): For F=ℚ(i), S=∅ and n=3 the kernel is cyclic of order 4, the group μ(ℚ(i))={±1,±i} (BMS Theorem 14.1).
- `latticeCongruenceKernel_rational_test` (computation): For F=ℚ, S=∅ and n≥3 the kernel is trivial, since ℚ has a real place (BMS Theorem 14.1).

### Identify the congruence kernel with relative defects

**Lemma:** `KTheoryLowDegrees:U.4/arithmetic-kernel-level-comparison`; proposed declaration `arithmetic_kernel_level_comparison`.

For n≥3 the kernel of Γ̂→Γ̄ is topologically isomorphic to lim_I FiniteDefect n I along levelMap (finite-defect-level-map); the projection at I is the class in Γ_n(I)/E_n(A,I). Surjectivity of levelMap is not used.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, n ≥ 3; levels are nonzero ideals.

Proof or construction:

1. At each level the kernel of Γ/E_n(A,I) → Γ/Γ_n(I) is Γ_n(I)/E_n(A,I) = FiniteDefect n I.
2. Inverse limits are left exact, so the kernel of the limit map is the limit of these kernels; the subspace topologies agree because both sit in the same product.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`, `KTheoryLowDegrees:U.4/finite-mennicke-defect`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `KTheoryLowDegrees:U.4/lattice-congruence-kernel`, `KTheoryLowDegrees:U.4/finite-defect-level-map`.

Acceptance: The projection to level I sends the class of σ ∈ Γ_n(I) to finiteDefectMk σ. F = ℚ(i), S = ∅, n = 3: the limit is μ₄ by Corollary 4.3(d), so the kernel is not trivial; any proof that never uses the level identification would wrongly give a trivial answer here.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1 proof, p.130 (with Corollary 4.3(d), p.96). BMS p.130 identify ker(Γ̂ → Γ̄) with lim Γ_q/E_q = lim C_q once both completions are written as inverse limits over the same ideals. The node states this identification with the projection at I equal to the class map.

### The higher-rank arithmetic congruence kernel

**Theorem:** `KTheoryLowDegrees:U.4/higher-rank-lattice-congruence-kernel`; proposed declaration `higherRankLatticeCongruenceKernel`.

For F a number field, S finite and n≥3, ker(Γ̂→Γ̄) is trivial if S is nonempty or F has a real place, and otherwise is topologically isomorphic to the finite discrete group μ(F).

Hypotheses: F a number field, S a finite set of finite primes (archimedean places not included), A = O_{F,S}, Γ = SL_n(A), n ≥ 3. 'Totally imaginary' in BMS's sense means S = ∅ and F totally complex (NumberField.IsTotallyComplex).

Proof or construction:

1. Compose arithmetic-kernel-level-comparison with arithmetic-defect-limit.
2. The identifications are homeomorphisms because the source is profinite and the target is finite discrete.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-kernel-level-comparison`, `KTheoryLowDegrees:U.4/arithmetic-defect-limit`, `KTheoryLowDegrees:U.4/lattice-congruence-kernel`.

Acceptance: F = ℚ(i), S = ∅: kernel μ₄; F = ℚ(√−3), S = ∅: μ₆; F = ℚ(i), S = {(1+i)}: trivial; F = ℚ: trivial. A totally complex F with S ≠ ∅ must give the trivial group (a formalisation testing only 'F has no real place' fails).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1, pp.129–130. Theorem 14.1 (p.129) asserts the congruence subgroup conjecture for SL_n, n ≥ 3: the kernel is μ_k when S is totally imaginary and trivial otherwise; its proof (p.130) identifies the kernel with lim C_q and evaluates it by Corollary 4.3(d). The node is the lattice-level part.

### Rational special linear groups have no finite quotients

**Lemma:** `KTheoryLowDegrees:U.4/rational-sl-no-finite-quotients`; proposed declaration `rational_sl_no_finite_quotients`.

For a field F of characteristic zero (in particular a number field) and n≥1, every homomorphism SL_n(F)→Q to a finite group is trivial.

Hypotheses: F is a field of characteristic zero (in particular a number field); n ≥ 1 (n = 1 is trivial). Q is a finite group and φ : SL_n(F) →* Q an arbitrary (not necessarily continuous) homomorphism.

Proof or construction:

1. For a transvection E_ij(x), E_ij(x) = E_ij(x/|Q|)^{|Q|}, so φ(E_ij(x)) = 1 by Lagrange.
2. SL_n(F) is the closure of the transvections (closure_range_toSpecialLinearGroup_eq_top_of_field), hence φ is trivial.

Direct prerequisites: `KTheoryLowDegrees:U.3/field-special-linear-eq-elementary`, `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`.

Acceptance: Characteristic zero is essential: SL₂(𝔽_p) is a nontrivial finite quotient of itself, and SL₂(ℤ) → SL₂(𝔽₂) shows the lattice has finite quotients. The homomorphism is not assumed continuous; the statement must not carry a topology on SL_n(F).

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1 proof, p.130. In the proof of Theorem 14.1 (p.130) BMS note that G_k is generated by unipotent subgroups and therefore has no nontrivial finite quotient, which forces it to centralize the finite kernel. The node proves this for SL_n over a characteristic-zero field via divisibility of root groups.

### Lattice completions are open in the rational completions

**Lemma:** `KTheoryLowDegrees:U.4/rational-completions-lattice-open`; proposed declaration `rational_completions_lattice_open`.

Let G=SL_n(F), with the arithmetic topology from finite-index subgroups of Γ and the congruence topology from Γ_n(I). Their Hausdorff two-sided group completions contain Γ̂ and Γ̄ as open subgroups, with compatible comparison maps and the same kernel.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, Γ = SL_n(A), G = SL_n(F), any n ≥ 2. Arithmetic topology: neighbourhood basis of 1 given by finite-index subgroups of Γ; congruence topology: by the Γ_n(I), I ≠ 0. Both are group topologies because G commensurates Γ.

Proof or construction:

1. Prove the conjugation refinement property by clearing denominators and using finite-index containment for conjugated lattices.
2. Use a general group-completion theorem for groups with an open precompact subgroup.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`.

Acceptance: The completion must be two-sided: g = diag(2,1/2) does not normalize SL₂(ℤ), gΓ₂(4I)g⁻¹ ≤ Γ₂(I) but gE₂₁(2t)g⁻¹ = E₂₁(t/2) shows Γ₂(2I) is not mapped into Γ₂(I); the construction must use commensurability, not invariance. The general two-sided completion theorem is a recorded supplier gap; Mathlib's IsUniformGroup completion does not apply.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), §14, pp.128–129. BMS give G=SL_n(F) the S-congruence and S-arithmetic topologies, observe that the closure of the lattice in the arithmetic completion is its profinite completion and is open, and deduce that the comparison map is onto.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §1.3, p.491. Serre justifies the existence of the completions: the lattice is open and the left and right uniform structures agree on it, so the group has a completion by Bourbaki's theorem (Topologie générale III §3 no.4, Théorème 1). This is the external completion statement recorded as a gap.

### Centrality of the global higher-rank kernel

**Theorem:** `KTheoryLowDegrees:U.4/higher-rank-central-kernel`; proposed declaration `higherRankCentralKernel`.

In the rational arithmetic completion of SL_n(F), n≥3, the congruence kernel is central and has the finite group described by higher-rank-lattice-congruence-kernel.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, n ≥ 3. The completions are those of rational-completions-lattice-open; the kernel is finite by higher-rank-lattice-congruence-kernel.

Proof or construction:

1. Normality gives an action of dense SL_n(F) on the finite kernel through its finite automorphism group.
2. Use rational-sl-no-finite-quotients to make this action trivial; continuity extends it to the completion.

Direct prerequisites: `KTheoryLowDegrees:U.4/rational-completions-lattice-open`, `KTheoryLowDegrees:U.4/higher-rank-lattice-congruence-kernel`, `KTheoryLowDegrees:U.4/rational-sl-no-finite-quotients`.

Acceptance: F = ℚ(√−3), S = ∅: the kernel μ₆ is central even though elements of SL₃(F) do not normalize Γ; the proof must use the rational action, not Γ alone. The argument requires the kernel to be finite; it does not apply to SL₂ over ℚ, where no finiteness is available.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1 proof, p.130. At the end of the proof of Theorem 14.1 (p.130) BMS let G_k act by conjugation on the finite kernel; having no finite quotients it acts trivially, and density gives centrality in Ĝ_k. The node is that argument.

## S-unit rank refinements

### Class-group powers give valuation basis multiples

**Lemma:** `KTheoryLowDegrees:U.4/s-unit-principal-prime-powers`; proposed declaration `s_unit_principal_prime_powers`.

For h=classNumber F>0 and each finite prime v∈S, there is a nonzero a_v∈O_F with (a_v)=v^h. Its image in Fˣ is an S-unit with additive valuation vector −h e_v in the convention of Tau Ceti’s Set.unitValuation, which is built from Mathlib’s valuationOfNeZero. Its inverse gives +h e_v.

Hypotheses: F is a number field and 𝓞 F its ring of integers; h = NumberField.classNumber F (positive). S is a set of height-one primes of 𝓞 F and v ∈ S; finiteness of S is not used here. Valuations are Mathlib's valuationOfNeZero, i.e. exp(−ord_v).

Proof or construction:

1. Finite class-group order annihilates the class of v; apply ClassGroup.mk0_eq_one_iff to v^h.
2. Prime-ideal factorization identifies each valuation; no other finite prime occurs in the principal ideal.

Direct prerequisites: `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:ClassGroup.mk0_eq_one_iff`, `tauceti:Set.unitValuation`, `mathlib:NumberField.classNumber`, `mathlib:NumberField.classNumber_pos`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuationOfNeZero_eq`, `mathlib:IsDedekindDomain.HeightOneSpectrum.intValuation_if_neg`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_of_algebraMap`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_eq_one_iff_notMem`.

Acceptance: F = ℚ(√−5) (class number 2), v = (2, 1+√−5): v is not principal but v² = (2), so a_v = ±2 with valuation vector −2·e_v; a version using exponent 1 instead of h has no witness. F = ℚ, S = {(p)}: h = 1, a_v = ±p and unitValuation S ℚ p = ofAdd(−1) at (p).

Source: [Milne.ANT.2020](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Theorem 5.11 and proof, §5, printed p.90 (PDF p.92). Milne proves the S-unit theorem by choosing, for each prime of S, a generator of its h-th power, h the class number; that generator is an S-unit whose valuation vector is h times a basis vector. The node is that step, with the sign fixed by the library's exp(−ord) convention.

### The S-unit valuation image has finite index

**Lemma:** `KTheoryLowDegrees:U.4/s-unit-valuation-image-index`; proposed declaration `s_unit_valuation_image_index`.

For finite S and h=classNumber F>0, hℤ^S is contained in the additive image of Set.unitValuation S F, so that image has finite index in ℤ^S and rank |S|. At S=∅ the index is 1 and rank 0.

Hypotheses: F is a number field; S : Set (HeightOneSpectrum (𝓞 F)) is finite; h = NumberField.classNumber F. ℤ^S denotes the codomain ↥S → Multiplicative ℤ of Set.unitValuation, written additively.

Proof or construction:

1. Use s-unit-principal-prime-powers and multiply the inverse prime generators to realize h times every vector.
2. The quotient is a quotient of (ℤ/hℤ)^S, hence finite; tensor with ℚ to obtain the full |S|-dimensional image.

Direct prerequisites: `KTheoryLowDegrees:U.4/s-unit-principal-prime-powers`, `tauceti:Set.unitValuation`.

Acceptance: F = ℚ(√−5), S = {(2, 1+√−5)}: the image is exactly 2ℤ, index 2 = h, not 1. F = ℚ, S = {(2), (3)}: the image is all of ℤ², index 1; S = ∅: index 1 and rank 0.

Source: [Milne.ANT.2020](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Proof of Theorem 5.11, printed p.90 (PDF p.92). Milne's proof shows that the image of the S-units in ℤ^S contains h·e_i for every i and so has full rank; the node records that the image contains hℤ^S and therefore has finite index.

### Recover the missing S-unit rank from the valuation sequence

**Lemma:** `KTheoryLowDegrees:U.4/s-unit-rank-from-exact-sequence`; proposed declaration `s_unit_rank_from_exact_sequence`.

The inherited S-unit group has rank (r₁+r₂−1)+|S|. Its finite generation is the pinned Tau Ceti theorem, and its rank follows from the exact valuation kernel and finite-index image. This supplies the proof refinement of the accepted s-unit-theorem, not another theorem object.

Hypotheses: F is a number field with r₁ real and r₂ complex places; S : Set (HeightOneSpectrum (𝓞 F)) is finite. Rank means finrank ℤ of Additive (Set.unit S F); it equals the finrank of the quotient by torsion used in s-unit-theorem.

Proof or construction:

1. Identify the kernel with ordinary units using Set.unitValuation_ker and Set.unitEmptyEquivUnits.
2. Tensor the exact sequence with ℚ; exactness and the dimension formula add the ordinary unit rank to s-unit-valuation-image-index.
3. Apply the pinned NumberField.Units.finrank_eq and rank formula. Keep the parent torsion and chosen splitting nodes as the consumer API.

Direct prerequisites: `KTheoryLowDegrees:U.4/s-unit-valuation-image-index`, `tauceti:Set.unitValuation_ker`, `tauceti:Set.unitEmptyEquivUnits`, `tauceti:Set.unit_fg_of_units`, `mathlib:NumberField.Units.finrank_eq`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces`, `mathlib:LinearMap.rank_range_add_rank_ker`, `mathlib:IsDomain.hasRankNullity`, `mathlib:Subgroup.subgroupOfEquivOfLe`.

Acceptance: F = ℚ(i), S = {(1+i)}: rank 0 + 1 − 1 + 1 = 1, not 0. F = ℚ(√−5), S = {(2, 1+√−5)}: rank 1 although the valuation image has index 2; F = ℚ(√2), S = ∅: rank 1 (two real places).

Source: [Milne.ANT.2020](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Theorem 5.11, printed p.90 (PDF p.92). Milne states that the S-units form a finitely generated group of rank r₁+r₂+|S|−1 and derives the rank from the valuation sequence whose kernel is the ordinary units. The node is that rank count from the library's exact sequence and s-unit-valuation-image-index.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §1.1, p.490. Serre recalls the unit theorem in the form U ≅ μ × ℤ^{s−1} with the archimedean places counted in S, the form his SL₂ argument consumes.

## SL₂ declarations

### Serre’s relative elementary normal closure

**Definition:** `KTheoryLowDegrees:U.4/serre-relative-elementary`; proposed declaration `SerreElementary`.

For a commutative ring A (in use A=O_{F,S}) and an ideal I, SerreElementary I is the normal closure inside SL₂(A) of {e₀₁(t):t∈I}. It contains the lower-root family by the Weyl conjugation. The ambient group is part of the definition.

Hypotheses: A is a commutative ring and I an ideal of A (the arithmetic case A = O_{F,S}, I ≠ 0 is where it is used). The ambient group is SL₂(A) = Matrix.SpecialLinearGroup (Fin 2) A; the normal closure is taken there.

Proof or construction:

1. Use native Subgroup.normalClosure in Matrix.SpecialLinearGroup (Fin 2) A.
2. Each root reduces to the identity modulo I, so the closure lies in Γ₂(I).

Direct prerequisites: `mathlib:Subgroup.normalClosure`, `mathlib:Matrix.SpecialLinearGroup.transvection`, `KTheoryLowDegrees:U.5/congruence-subgroup`.

Acceptance: −1 = E₁₂(2)E₂₁(−2)·(E₁₂(1)E₂₁(2)E₁₂(−1))⁻¹ lies in SerreElementary(2ℤ) ≤ SL₂(ℤ), although −1 is not in the subgroup generated by E₁₂(2ℤ) ∪ E₂₁(2ℤ) (a ≡ 1 mod 4 there).

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §1.4, pp.491–492. Serre §1.4 (p.491) defines E_q as the smallest normal subgroup of Γ_A containing the upper root group E₁₂(q) and notes E_q ⊂ Γ_q. The node is that definition with its universal property.

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
- `serreElementary_map_le_iff` (compatibility): For X ≤ SL₂(F) with F = Frac A, the image of SerreElementary I under SpecialLinearGroup.map (algebraMap A F) lies in X iff every SL₂(A)-conjugate of every E₁₂(t), t ∈ I, maps into X.

Unit-test contracts:

- `serreElementary_zero_test` (degenerate): SerreElementary ⊥ = ⊥.
- `serreElementary_field_test` (computation): For any field k (including 𝔽₂ and 𝔽₃), SerreElementary (⊤ : Ideal k) = ⊤ in SL₂(k).
- `serreElementary_not_generated_test` (non-example): For A = ℤ, I = 2ℤ: [[3,−2],[2,−1]] = E₁₂(1)E₂₁(2)E₁₂(−1) belongs to SerreElementary I but not to the subgroup generated by E₁₂(I) ∪ E₂₁(I) (on which a ≡ 1 mod 4).
- `serreElementary_congruence_test` (non-example): For t ∉ I, E₁₂(t) ∉ SerreElementary I, since SerreElementary I ≤ Γ₂(I).

### Every arithmetic SL₂ neighborhood contains a Serre level

**Lemma:** `KTheoryLowDegrees:U.4/serre-finite-index-containment`; proposed declaration `serre_finite_index_containment`.

For a number field F, every finite-index subgroup H≤SL₂(A) contains SerreElementary I for a nonzero ideal I. No assumption on the S-unit rank is needed for this containment.

Hypotheses: A = O_{F,S} for a number field F and finite S (any commutative ring of characteristic zero that is a domain suffices). H ≤ SL₂(A) has finite index; H need not be normal; no unit-rank hypothesis.

Proof or construction:

1. Replace H by its finite-index normal core N. If d=[SL₂(A):N], the additive root map kills dA in the finite quotient.
2. Use normality of N and the universal property of SerreElementary.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-elementary`, `mathlib:Subgroup.normalCore`, `mathlib:Subgroup.finiteIndex_normalCore`, `mathlib:Subgroup.normalCore_le`, `mathlib:Subgroup.pow_index_mem`.

Acceptance: A = ℤ, H = Γ₂(3ℤ) (index 24): the proof gives I = 24ℤ and E_{24ℤ} ≤ Γ₂(3ℤ); any nonzero multiple works, I = 0 is not allowed. The statement holds for every number field and S, including F = ℚ, S = ∅ (unlike Propositions 2–4).

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 1, pp.491–492. Proposition 1 (pp.491–492), number-field case: after replacing N by its normal core one may take q = nA with n = (Γ_A : N), since E₁₂(x)^n = E₁₂(nx) dies in Γ_A/N; the corollary extends this to S-arithmetic subgroups.

### Choose a noncentral element with nonzero first-column product

**Lemma:** `KTheoryLowDegrees:U.4/serre-noncentral-root-choice`; proposed declaration `serre_noncentral_root_choice`.

If X≤SL₂(F) is noncentral and normalized by an S-arithmetic subgroup, X contains [[a,b],[c,d]] with ac≠0.

Hypotheses: F a number field, S finite, A = O_{F,S}; X ≤ SL₂(F) with X ⊄ {±1}. N ≤ SL₂(F) normalizes X and N ∩ SL₂(A) has finite index in SL₂(A). No unit-rank hypothesis.

Proof or construction:

1. By serre-finite-index-containment, N ∩ SL₂(A) ⊇ SerreElementary q′ for some q′ ≠ 0; so E₁₂(t) and E₂₁(t) (serreElementary_lower) normalize X for t ∈ q′.
2. Take x ∈ X \ {±1}. If c ≠ 0, E₁₂(t)xE₁₂(−t) has entries a+tc and c. If c = 0, E₂₁(t)xE₂₁(−t) has (1,1) entry a−tb and (2,1) entry t((a−d)−tb); the product is a nonzero polynomial of degree ≤ 3 since x ≠ ±1.
3. q′ contains the four distinct elements t₀,…,4t₀ (t₀ ≠ 0, characteristic zero), and one avoids the at most three roots.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-finite-index-containment`, `KTheoryLowDegrees:U.4/serre-relative-elementary`.

Acceptance: x = diag(2,1/2) (c = b = 0): E₂₁(t)xE₂₁(−t) has a′ = 2 and c′ = 3t/2, so t = 1 already works. X = {±1} must be excluded: every conjugate of −1 has c = 0.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 2 proof, p.492. In the proof of Proposition 2 (p.492) Serre shows that X contains an element with ac ≠ 0, arguing with Zariski closures. The node keeps the conclusion but replaces that argument by explicit conjugation with level roots that normalize X.

### A noncentral arithmetic-normalized subgroup contains a level

**Lemma:** `KTheoryLowDegrees:U.4/serre-normalizer-root-level`; proposed declaration `serre_normalizer_root_level`.

Assume r₁+r₂+|S|≥2. A noncentral X≤SL₂(F), normalized by an S-arithmetic subgroup, contains SerreElementary I for some nonzero I.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, and r₁+r₂+|S| ≥ 2 (Serre's Card(S) ≥ 2, i.e. Aˣ infinite). X ≤ SL₂(F), X ⊄ {±1}; N ≤ SL₂(F) normalizes X and N ∩ SL₂(A) has finite index in SL₂(A).

Proof or construction:

1. serre-finite-index-containment gives SerreElementary q′ ≤ N; U′ = {u : h(u) ∈ N} has finite index in Aˣ, so it contains u of infinite order (s-unit-theorem and the rank hypothesis). serre-noncentral-root-choice gives x = [[a,b],[c,d]] ∈ X with ac ≠ 0; shrink q′ so that a⁻¹cq′ ⊆ A.
2. A/a⁻¹cq′ is finite (arithmetic-residue-ring-finite), so u^{2n} ≡ 1 mod a⁻¹cq′ for some n ≥ 1; put t = a(u^{2n}−1)/c ∈ q′, x′ = E₁₂(t)xE₁₂(−t), x″ = h(uⁿ)xh(uⁿ)⁻¹, y = x′⁻¹x″ = [[u^{−2n}, e],[0, u^{2n}]] ∈ X.
3. For z ∈ q′, y⁻¹E₁₂(z)yE₁₂(−z) = E₁₂((u^{4n}−1)z) ∈ X, so E₁₂(q₀) ⊆ X with q₀ = (u^{4n}−1)q′ ≠ 0.
4. Apply the same to γXγ⁻¹ for γ in a set of representatives of the left cosets γ(N ∩ SL₂(A)) (finitely many; γXγ⁻¹ depends only on the left coset because N normalizes X); with q the intersection of the resulting ideals, X contains γ⁻¹E₁₂(q)γ for every γ ∈ SL₂(A), hence the image of SerreElementary q.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-noncentral-root-choice`, `KTheoryLowDegrees:U.4/s-unit-theorem`, `KTheoryLowDegrees:U.4/serre-finite-index-containment`, `KTheoryLowDegrees:U.4/arithmetic-residue-ring-finite`, `KTheoryLowDegrees:U.4/serre-relative-elementary`.

Acceptance: F = ℚ, S = {2}, A = ℤ[1/2], u = 2: when n = 1 is admissible (e.g. a⁻¹cq′ = 3A, since 4 ≡ 1 mod 3) the produced level is q₀ = 15q′, and y⁻¹E₁₂(z)yE₁₂(−z) = E₁₂(15z). Without the rank hypothesis (F = ℚ, S = ∅) u = ±1 gives u^{4n}−1 = 0 and no level: the hypothesis must be used exactly here.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 2, pp.492–493. Proposition 2 (pp.492–493): a non-central subgroup of SL₂(K) normalized by an S-arithmetic subgroup contains some E_q. The proof conjugates a chosen element by a level root and by h(uⁿ) for an infinite-order unit u, producing E₁₂((u^{4n}−1)q′), and then uses the finitely many Γ_A-conjugates of X.

### Relative rows have the Serre elementary equivalences

**Lemma:** `KTheoryLowDegrees:U.4/serre-relative-row-relations`; proposed declaration `serre_relative_row_relations`.

Relative SL₂ matrices with equal first rows have equal classes in Γ₂(I)/SerreElementary I. The operations b↦b+at for t∈I and a↦a+bt for t∈I preserve these classes. For t∈A, conjugation by E₂₁(t)∈SL₂(A) preserves Γ₂(I) and SerreElementary I and changes the first row (a,b) to (a+tb,b).

Hypotheses: A a commutative ring (Dedekind in use), I an ideal; σ, σ′ ∈ Γ₂(I) = SL₂(A) ∩ GL₂(A,I). Classes are taken in Γ₂(I)/SerreElementary I.

Proof or construction:

1. Use first-row fibre and upper/lower roots in SerreElementary.
2. E₂₁(t) normalizes both subgroups; left multiplication by E₂₁(−t) does not change the first row, and right multiplication by E₂₁(t) adds t times the second column to the first.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-elementary`, `KTheoryLowDegrees:U.4/relative-first-row-fibre`.

Acceptance: A = ℤ, I = 2ℤ: σ₁ = [[3,−2],[2,−1]], σ₂ = [[3,−2],[−4,3]] have equal first rows and σ₂σ₁⁻¹ = E₂₁(−2). The a-move with t ∉ I is not a relation of this node: (7,6) ↦ (13,6) (t = 1) is realised only by conjugation, E₂₁(−1)[[7,6],[8,7]]E₂₁(1) = [[13,6],[2,1]].

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 1, pp.493–494. Lemma 1 (pp.493–494) shows that the class of x modulo E_q depends only on the first row and is unchanged by b ↦ b+ta and a ↦ a+tb with t ∈ q, via right multiplication by level roots and Weyl conjugation of a lower level root.

### A diagonal power centralizes a row class

**Lemma:** `KTheoryLowDegrees:U.4/serre-diagonal-congruence-commutator`; proposed declaration `serre_diagonal_congruence_commutator`.

For σ∈Γ₂(I) with first row (a,b), if u∈Aˣ and u^{2n}≡1 modulo aA, then h(u)^n commutes with σ modulo SerreElementary I.

Hypotheses: A a commutative ring (A = O_{F,S} in use), I an ideal, σ ∈ Γ₂(I) with first row (a,b), u ∈ Aˣ, n ≥ 1 with u^{2n} − 1 ∈ aA. No unit-rank hypothesis.

Proof or construction:

1. h(u)ⁿσh(u)⁻ⁿ has first row (a, u^{2n}b).
2. u^{2n}b − b = a·t with t = b(u^{2n}−1)/a ∈ I; apply serre-relative-row-relations.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-row-relations`.

Acceptance: F = ℚ, S = {2}, u = 2, a = 3: u² = 4 ≡ 1 mod 3, so n = 1 works for every σ with first row (3,b). The congruence is modulo aA, not modulo aI: requiring u^{2n} ≡ 1 mod aI would be a needlessly stronger hypothesis that breaks serre-uniform-diagonal-commutator.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 2, p.494. Lemma 2 (p.494): h(u)ⁿ x h(u)⁻ⁿ has first row (a, u^{2n}b), congruent to x modulo E_q by Lemma 1(i) when u^{2n} ≡ 1 mod aA.

### Split a prescribed abelian automorphism into nontrivial restrictions

**Lemma:** `KTheoryLowDegrees:U.4/serre-two-frobenius-factor`; proposed declaration `serre_two_frobenius_factor`.

Let M/F be finite abelian and L⊂M a nontrivial subextension. Any g∈Gal(M/F) is one automorphism or a product g₁g₂, with each chosen factor restricting nontrivially to L.

Hypotheses: M/F a finite Galois (here abelian) extension and L ⊆ M an intermediate field with L ≠ F; restriction Gal(M/F) → Gal(L/F) is surjective.

Proof or construction:

1. If g has nontrivial restriction use one factor. Otherwise choose h with nontrivial restriction and use g=h(h⁻¹g).

Direct prerequisites: .

Acceptance: g = 1 must decompose as h·h⁻¹ with both factors nontrivial on L. L = F must be excluded: then no factor can restrict nontrivially.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proof of Lemma 4, p.495. In the proof of Lemma 4 (p.495) Serre writes the chosen automorphism as one or two factors with nontrivial image in Gal(L/K): itself if its image is nontrivial, otherwise σ₁ and σ₀σ₁⁻¹ with σ₁ any element of nontrivial image.

### A ray class has a prime-product representative avoiding splitting

**Lemma:** `KTheoryLowDegrees:U.4/serre-ray-prime-pair`; proposed declaration `serre_ray_prime_pair`.

There is a ∈ A with a ≡ a₀ mod 𝔯 such that aA is a product of one or two distinct primes of A, each prime to 𝔯, unramified and not split completely in L, and not in P′.

Hypotheses: F a number field, S finite, A = O_{F,S}; 𝔯 a nonzero ideal of A and a₀ ∈ A invertible modulo 𝔯. L/F finite abelian, L ≠ F; P′ a finite set of primes of A.

Proof or construction:

1. Form the compositum of L and the ray class field; lift the ray-class automorphism.
2. Apply serre-two-frobenius-factor and Chebotarev separately to the factors, deleting previously chosen primes and the finite forbidden set.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-two-frobenius-factor`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`.

Acceptance: H_𝔯 has no sign conditions at real places; using a narrow ray class group is harmless (finer), but using classes of 𝓞_F-ideals without killing S-primes is wrong when S ≠ ∅. F = ℚ, S = ∅, L = ℚ(i), 𝔯 = 4ℤ, a₀ = 1: since H_𝔯 has no sign condition, a = −3 (one inert prime, −3 ≡ 1 mod 4) is a valid output; a narrow-class version forces a > 0 and hence an even number of primes ≡ 3 mod 4, e.g. a = 21. Test the stated conditions, not a particular a.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 4 and proof, pp.494–495. Lemma 4 (pp.494–495) produces a ≡ a₀ mod 𝔯 whose ideal is a product of distinct primes outside S ∪ P′ that are unramified and not totally split in L, using the ray class field K_𝔯 for Serre's group H_𝔯, the compositum L·K_𝔯 and Chebotarev for each of one or two Frobenius factors.

### Choose a row denominator with controlled residue-unit exponent

**Lemma:** `KTheoryLowDegrees:U.4/serre-unit-exponent-row-choice`; proposed declaration `serre_unit_exponent_row_choice`.

Let ℓ be prime with ℓ^e exactly dividing #μ(F), 𝔯 a nonzero ideal of A and a₀∈A invertible modulo 𝔯. There is a ∈ A with a ≡ a₀ mod 𝔯 such that (A/aA)ˣ has no element of order divisible by ℓ^{e+1}.

Hypotheses: F a number field, S finite, A = O_{F,S}, m = #μ(F), ℓ prime with ℓ^e ∥ m. 𝔯 a nonzero ideal of A and a₀ ∈ A invertible modulo 𝔯.

Proof or construction:

1. Apply serre-ray-prime-pair to L=F(ζ_{ℓ^{e+1}}), which is a nontrivial extension by the definition of e.
2. A nontrivial arithmetic Frobenius on the new roots means ℓ^{e+1}∤N𝔭−1. Use a squarefree one- or two-prime product and the Chinese remainder theorem.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`, `KTheoryLowDegrees:U.4/relative-first-row-map`, `tauceti:AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one`, `mathlib:IsCyclotomicExtension.isAbelianGalois`, `mathlib:Ideal.exists_ideal_over_prime_of_isIntegral`.

Acceptance: F = ℚ, ℓ = 2 (e = 1), 𝔯 = 4ℤ, a₀ = 1: a = 21 gives (ℤ/21)ˣ ≅ C₂ × C₆, no element of order 4; a = 5 fails ((ℤ/5)ˣ ≅ C₄). Primes above ℓ are allowed: their Nv − 1 is prime to ℓ.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 3, p.494; its proof (§2.3), pp.495–496. Lemma 3 (p.494), proved in §2.3 from Lemma 4 applied to L = K(ζ_{ℓ^{e+1}}) ≠ K: the chosen a has squarefree ideal product of primes v with Nv ≢ 1 mod ℓ^{e+1}, so (A/aA)ˣ ≅ ∏ (A/v)ˣ has no element of order divisible by ℓ^{e+1}.

### One root-of-unity exponent works for every row

**Lemma:** `KTheoryLowDegrees:U.4/serre-uniform-diagonal-commutator`; proposed declaration `serre_uniform_diagonal_commutator`.

With m=#μ(F), h(u)^m commutes with every σ∈Γ₂(I) modulo SerreElementary I for every u∈Aˣ.

Hypotheses: F a number field, S finite, A = O_{F,S}, I a nonzero ideal, m = #μ(F) (NumberField.Units.torsionOrder), u ∈ Aˣ. No unit-rank hypothesis.

Proof or construction:

1. Use serre-unit-exponent-row-choice for each ℓ and serre-diagonal-congruence-commutator on the resulting relative row.
2. The gcd of the permitted residue-unit exponents divides m. Bézout combines the diagonal powers; recover the original row class.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-unit-exponent-row-choice`, `KTheoryLowDegrees:U.4/serre-diagonal-congruence-commutator`, `KTheoryLowDegrees:U.4/serre-relative-row-relations`, `KTheoryLowDegrees:U.4/relative-first-row-completion`.

Acceptance: The exponent is m = #μ(F), independent of I and u: 2 for every F with a real place, 4 for ℚ(i), 6 for ℚ(√−3). For u a root of unity the statement is trivial (h(u)^m = 1); the content is for infinite-order u.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 3, p.493; proof p.494. Proposition 3 (p.493) says h(u)^m commutes with C_q modulo E_q; the proof (p.494) picks a representative with a₀b₀ ≠ 0, takes the least N with h(u)^N commuting, and if ℓ^{e+1} | N uses Lemma 3 with 𝔯 = b₀q, Lemma 1(ii) and Lemma 2 to reach a contradiction.

### Serre relative quotients have surjective transitions

**Lemma:** `KTheoryLowDegrees:U.4/serre-level-transition-surjective`; proposed declaration `serre_level_transition_surjective`.

For nonzero J≤I the inclusion induces a surjection Γ₂(J)/SerreElementary J→Γ₂(I)/SerreElementary I.

Hypotheses: A a Dedekind domain (A = O_{F,S} in use); J ≤ I nonzero ideals. No unit-rank hypothesis.

Proof or construction:

1. Let σ ∈ Γ₂(I) with first row (a,b) ∈ W_I. By q-equivalence-smaller-ideal, (a,b) ∼_I (a′,b′) ∈ W_J by a chain of moves (a,b) ↦ (a, b+ta), t ∈ I, and (a,b) ↦ (a+tb, b), t ∈ A.
2. Realise each move on matrices in Γ₂(I): the first by right multiplication by E₁₂(t) ∈ SerreElementary I, the second by σ ↦ E₂₁(−t)σE₂₁(t). The set Γ₂(J)·SerreElementary I is stable under both operations and their inverses, because Γ₂(J) and SerreElementary I are normal in SL₂(A).
3. For the final matrix σ′ (first row in W_J), relative-first-row-completion gives τ ∈ Γ₂(J) with the same first row and relative-first-row-fibre gives σ′τ⁻¹ = E₂₁(f), f ∈ I, which lies in SerreElementary I. Hence σ ∈ Γ₂(J)·SerreElementary I.

Direct prerequisites: `KTheoryLowDegrees:U.4/q-equivalence-smaller-ideal`, `KTheoryLowDegrees:U.4/serre-relative-row-relations`, `KTheoryLowDegrees:U.4/serre-relative-elementary`, `KTheoryLowDegrees:U.4/mennicke-symbol`, `KTheoryLowDegrees:U.4/relative-first-row-completion`, `KTheoryLowDegrees:U.4/relative-first-row-fibre`.

Acceptance: σ = [[7,6],[8,7]] ∈ Γ₂(2ℤ) and t = 1: E₂₁(−1)σE₂₁(1) = [[13,6],[2,1]], realising the BMS move (7,6) ↦ (13,6) that Serre's Lemma 1 does not allow. The conclusion is equivalent to Γ₂(I) = Γ₂(J)·SerreElementary I; a proof that only uses moves with t ∈ I is incomplete.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §2.4, p.496 (BMS Lemma 2.3). In §2.4 (p.496) Serre asserts that the maps C_{q′} → C_q induced by inclusion are surjective, citing BMS Lemma 2.3 (p.66), the reduction of a q-unimodular row to a q′-unimodular one. The node supplies the matrix-level translation of that row lemma.

### Rational conjugation acts on the relative inverse limit

**Lemma:** `KTheoryLowDegrees:U.4/serre-rational-conjugation-refinement`; proposed declaration `serre_rational_conjugation_refinement`.

Assume r₁+r₂+|S|≥2. For g∈SL₂(F) and nonzero I, there is nonzero J with gΓ₂(J)g⁻¹≤Γ₂(I) and gSerreElementary J g⁻¹≤SerreElementary I. Hence conjugation defines an action on C=lim_I Γ₂(I)/SerreElementary I.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, r₁+r₂+|S| ≥ 2. g ∈ SL₂(F), I a nonzero ideal; levels are nonzero ideals.

Proof or construction:

1. Choose x ∈ A nonzero with x·g and x·g⁻¹ integral; then gΓ₂(x²I)g⁻¹ ≤ Γ₂(I).
2. X = g⁻¹·SerreElementary(I)·g is not contained in {±1} and is normalized by g⁻¹Γ₂(I)g ⊇ Γ₂(x²I), a finite-index subgroup of SL₂(A); serre-normalizer-root-level gives SerreElementary J₂ ≤ X. Take J = x²I ∩ J₂.
3. The induced maps C_J → C_I, composed with C → C_J, are independent of J and satisfy the action laws; on SL₂(A) they agree with inner conjugation.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-normalizer-root-level`.

Acceptance: g = diag(2,1/2), x = 2: gΓ₂(4I)g⁻¹ ≤ Γ₂(I) while gE₂₁(2t)g⁻¹ = E₂₁(t/2), so x² (not x) is needed. The unit-rank hypothesis must appear in the Lean statement; F = ℚ, S = ∅ is outside the node.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Lemma 5, pp.496–497. Lemma 5 (p.496) gives, for g ∈ G and q ≠ 0, an ideal q′ ≠ 0 with gΓ_q g⁻¹ ⊇ Γ_{q′} and gE_q g⁻¹ ⊇ E_{q′}, by clearing denominators and Proposition 2; pp.496–497 use it (for g⁻¹) to define the action of G on C = lim C_q extending that of Γ_A.

### Rational conjugation on the Serre inverse limit is trivial

**Lemma:** `KTheoryLowDegrees:U.4/serre-abstract-limit-centrality`; proposed declaration `serre_abstract_limit_centrality`.

Assume r₁+r₂+|S|≥2. The action of SL₂(F) on C=lim_I Γ₂(I)/SerreElementary I is trivial.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, r₁+r₂+|S| ≥ 2. C = lim_I Γ₂(I)/SerreElementary I over nonzero I (abstract inverse limit), with the SL₂(F)-action of serre-rational-conjugation-refinement.

Proof or construction:

1. The kernel H is normal in SL₂(F); by serre-uniform-diagonal-commutator it contains h(v), v = u^m, for an infinite-order unit u (rank hypothesis), so v² ≠ 1.
2. Since H is normal, ⁅h(v), E₁₂(x)⁆ = E₁₂((v²−1)x) ∈ H for all x ∈ F (Matrix.commutator_diag2_transvection), so E₁₂(F) ⊆ H, and E₂₁(F) ⊆ H by Weyl conjugation; Matrix.SL2.transvection_induction gives H = SL₂(F). (Alternatively: Matrix.ProjectiveSpecialLinearGroup.rank_two_simple' with a = 2 and Matrix.SL2.commutator_eq_top.)

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-rational-conjugation-refinement`, `KTheoryLowDegrees:U.4/serre-uniform-diagonal-commutator`, `KTheoryLowDegrees:U.4/s-unit-theorem`, `mathlib:Matrix.commutator_diag2_transvection`, `mathlib:Matrix.SL2.transvection_induction`, `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`, `mathlib:Matrix.SL2.commutator_eq_top`.

Acceptance: F = ℚ, S = {2}, u = 2, m = 2: h(4) ∈ H forces E₁₂(15x) ∈ H for all x ∈ ℚ, hence E₁₂(ℚ) ⊆ H. F = ℚ, S = ∅ is excluded: u = ±1 gives h(u)^m = 1 and no information.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 4, p.497. Proposition 4 (p.497): the kernel H of the action of G on C is normal and contains h(u)^m for u ∈ U (by Proposition 3; the printed text says Proposition 2, recorded as KTheoryLowDegrees/E121), hence is infinite when Card(S) ≥ 2, and so equals G because the only normal subgroups of SL₂(K) are {1}, {±1}, G.

### Every relative SL₂ defect quotient is central

**Lemma:** `KTheoryLowDegrees:U.4/serre-quotient-centrality`; proposed declaration `serre_quotient_centrality`.

Assume r₁+r₂+|S|≥2. For every nonzero I, Γ₂(I)/SerreElementary I is central in SL₂(A)/SerreElementary I and therefore abelian.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, r₁+r₂+|S| ≥ 2; I a nonzero ideal.

Proof or construction:

1. There are countably many ideals, and serre-level-transition-surjective makes the projection from the abstract inverse limit to each quotient surjective by recursive compatible lifts.
2. Use serre-abstract-limit-centrality to show every quotient class is fixed under SL₂(A).

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-level-transition-surjective`, `KTheoryLowDegrees:U.4/serre-abstract-limit-centrality`.

Acceptance: The conclusion is the commutator inclusion ⁅SL₂(A), Γ₂(I)⁆ ≤ SerreElementary I (Serre: (Γ_A, Γ_q) ⊂ E_q), equivalently that SL₂(A) acts trivially on C_I by conjugation; it is stronger than C_I abelian. This argument uses the abstract inverse limit and its surjective projections; compactness of the not-yet-finite C_q would be circular.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Corollary 1 to Proposition 4, p.497 (surjectivity of C → C_q: §2.4, p.496). Corollary 1 to Proposition 4 (p.497): Γ_A acts trivially on C, hence on its quotient C_q, i.e. (Γ_A, Γ_q) ⊂ E_q; the projection C → C_q is surjective by §2.4 (surjective transitions, countably many ideals).

### Serre’s abelian relative quotients are finitely generated

**Lemma:** `KTheoryLowDegrees:U.4/serre-defect-finite-generation`; proposed declaration `serre_defect_finite_generation`.

Assume r₁+r₂+|S|≥2. Then Γ₂(I)/SerreElementary I is a finitely generated abelian group; finite generation alone holds for every number field and finite S.

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, I a nonzero ideal. r₁+r₂+|S| ≥ 2 is used only for commutativity (via serre-quotient-centrality); finite generation of SL₂(A) holds for every number field and S.

Proof or construction:

1. SL₂(A) is finitely generated by the arithmetic SL₂ finite-generation supplier quoted in §1.2.
2. Γ₂(I) has finite index by arithmetic-congruence-index, so Schreier gives finite generation; use serre-quotient-centrality for commutativity.

Direct prerequisites: `KTheoryLowDegrees:U.4/arithmetic-congruence-index`, `KTheoryLowDegrees:U.4/serre-quotient-centrality`, `mathlib:Subgroup.fg_of_index_ne_zero`, `mathlib:QuotientGroup.fg`.

Acceptance: O'Meara Theorem 24.8 is quoted by Serre; its proof and an exact library supplier were not established and remain a gap. The abelian conclusion fails to be available for F = ℚ, S = ∅ (excluded); finite generation itself does not depend on the unit rank.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §1.2, p.490 (O'Meara Th. 24.8 quoted); Corollary 2 to Proposition 4, p.497. Corollary 2 to Proposition 4 (p.497): the C_q are abelian by Corollary 1 and finitely generated because Γ_q is, which Serre deduces in §1.2 from O'Meara's theorem that S-arithmetic subgroups of SL₂ over a number field are finitely generated.

### The SL₂ congruence kernel uses completed relative defects

**Lemma:** `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`; proposed declaration `serre_completed_defect_kernel`.

C(G) = ker(Γ̂ → Γ̄) for Γ = SL₂(A) is topologically isomorphic to lim_I Ĉ_I, the inverse limit of the profinite completions of C_I = Γ₂(I)/SerreElementary I, without assuming any C_I finite. Under r₁+r₂+|S| ≥ 2 it is central in the rational arithmetic completion of SL₂(F).

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}; levels are nonzero ideals. The centrality clause assumes r₁+r₂+|S| ≥ 2 and uses the completions of rational-completions-lattice-open with n = 2.

Proof or construction:

1. Use serre-finite-index-containment for cofinality of Serre levels among finite-index normal subgroups.
2. Within each quotient retain all finite quotients, not the uncompleted quotient itself.
3. Use serre-quotient-centrality and compatible rational conjugation, then density, for centrality of the resulting completed kernel.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-finite-index-containment`, `KTheoryLowDegrees:U.4/serre-rational-conjugation-refinement`, `KTheoryLowDegrees:U.4/serre-quotient-centrality`, `mathlib:ProfiniteGrp.profiniteCompletion`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `KTheoryLowDegrees:U.4/rational-completions-lattice-open`, `KTheoryLowDegrees:U.4/lattice-congruence-kernel`, `KTheoryLowDegrees:U.4/arithmetic-congruence-index`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`, `KTheoryLowDegrees:U.4/serre-abstract-limit-centrality`.

Acceptance: The completed Ĉ_I, not C_I, appears: Proposition 5 is used in serre-elementary-index-after-completion to prove C_I finite, so it may not assume it. Use SerreElementary I (normal closure in SL₂(A)) as the cofinal system; no use of arithmetic-elementary-index for n = 2.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Proposition 5, §2.5, pp.497–498. In §2.5 (pp.497–498) Serre writes Γ̂_A as lim (Γ_A/E_q)^ using Proposition 1, identifies Ĉ_q with the closure of C_q, and passes to the limit of the exact sequences (compact groups) to get Proposition 5, C(G) = lim Ĉ_q; the Corollary deduces centrality from Proposition 4 and density.

### The central SL₂ congruence extension is the relative universal cover

**Lemma:** `KTheoryLowDegrees:U.4/serre-relative-universal-cover`; proposed declaration `serre_relative_universal_cover`.

Under r₁+r₂+|S| ≥ 2: for every profinite abelian M with trivial action, the pushout f ↦ f_*(Ĝ) (BMS’s f ↦ f(e)) gives a bijection between continuous homomorphisms C(G) → M and isomorphism classes of topological central extensions 1 → M → E → Ḡ → 1 that split over the dense subgroup SL₂(F); the extension Ĝ → Ḡ corresponds to the identity of C(G). This is Serre's Theorem 1 (Ĝ is the universal covering of Ḡ relative to SL₂(F)).

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, r₁+r₂+|S| ≥ 2. Completions as in rational-completions-lattice-open (n = 2); C(G) central by serre-completed-defect-kernel.

Proof or construction:

1. Use serre-completed-defect-kernel for centrality and Matrix.SL2.commutator_eq_top (SL₂(F) perfect) for the absence of finite abelian quotients.
2. Follow BMS Theorem 15.1: the splitting s over SL₂(F) is continuous on Γ = SL₂(A) because the preimage of Γ̄ in E is profinite; extend s by completeness to Ĝ → E, obtaining the morphism of extensions and hence C(G) → M; uniqueness from perfectness and centrality.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`, `KTheoryLowDegrees:U.4/serre-relative-elementary`, `KTheoryLowDegrees:U.4/rational-completions-lattice-open`, `mathlib:Matrix.SL2.commutator_eq_top`.

Acceptance: The kernel classes considered are profinite abelian with trivial action; locally compact non-profinite kernels (Moore's general setting) are not claimed. SL₂(F) must have no nontrivial finite abelian quotient; this is where perfectness of SL₂ over F (|F| > 3) enters.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Théorème 1, §2.6, p.498. Serre states that the arithmetic completion is the universal covering of the congruence completion relative to the rational group, deducing it from Moore's Theorem 13.1 and pointing to BMS §15.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 15.1 and proof, pp.131–132. BMS prove for a profinite module M that homomorphisms from the congruence kernel to M map onto the classes in H²(Ḡ,M) that die on the rational group, bijectively when the actions are trivial and the rational group has no nontrivial finite abelian quotient; the node is this statement for SL₂.

### Serre’s infinite-unit-rank congruence kernel theorem

**Theorem:** `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`; proposed declaration `serreInfiniteUnitCongruenceKernel`.

For a number field F, S finite with r₁+r₂+|S|≥2, the SL₂ arithmetic congruence kernel is finite central: it is trivial when S≠∅ or F has a real place, and isomorphic to μ(F) otherwise.

Hypotheses: F a number field, S a finite set of finite primes (archimedean places not in S), A = O_{F,S}, r₁+r₂+|S| ≥ 2. Serre's 'S totally imaginary' is S = ∅ and F totally complex.

Proof or construction:

1. Use serre-relative-universal-cover and Moore’s relative fundamental-group computation quoted as Theorem 12.3.
2. Transfer the resulting finite central group to the lattice kernel.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-relative-universal-cover`, `KTheoryLowDegrees:U.4/lattice-congruence-kernel`.

Acceptance: CM quartic with S = ∅ satisfies the rank hypothesis; ℚ and imaginary quadratic fields with S = ∅ do not, and no finite-kernel conclusion is stated there. F = ℚ(ζ₅), S = ∅: kernel ≅ μ₁₀; F = ℚ(i), S = {(1+i)}: trivial; F = ℚ, S = {2}: trivial (Serre's example p.499).

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Theorem 2(a) and proof, §2.6, pp.498–499. Theorem 2(a) (p.498): C(G) is finite cyclic, isomorphic to μ if S is totally imaginary and trivial otherwise; the proof (p.499) reads this off Moore's determination of the relative fundamental group π₁(Ḡ,G) (Moore Th. 12.3) via Theorem 1.

### Finiteness descends from completed quotients to Serre levels

**Lemma:** `KTheoryLowDegrees:U.4/serre-elementary-index-after-completion`; proposed declaration `serre_elementary_index_after_completion`.

Under Serre’s infinite-unit-rank hypotheses, Γ₂(I)/SerreElementary I is finite and SerreElementary I has finite index in SL₂(A).

Hypotheses: F a number field, S a finite set of finite primes, A = O_{F,S}, r₁+r₂+|S| ≥ 2, I a nonzero ideal.

Proof or construction:

1. The finite congruence kernel surjects onto the profinite completion of each defect quotient.
2. A finitely generated abelian group whose profinite completion is finite is finite.
3. Combine with arithmetic-congruence-index.

Direct prerequisites: `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`, `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`, `KTheoryLowDegrees:U.4/serre-defect-finite-generation`, `KTheoryLowDegrees:U.4/arithmetic-congruence-index`.

Acceptance: A finitely generated abelian group with finite profinite completion is finite; ℚ (not finitely generated) has trivial profinite completion, so finite generation from serre-defect-finite-generation is genuinely used. Under the rank hypothesis r₁+r₂+|S|≥2, if moreover S ≠ ∅ or F has a real place, SerreElementary I = Γ₂(I) for every nonzero I (Corollary 3, p.499); e.g. A = ℤ[1/2], I = 3A.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Theorem 2(b),(c) proof and Corollary 1 to Theorem 2, p.499. In the proof of Theorem 2 (p.499) Serre notes that each Ĉ_q is a quotient of the finite group C(G), hence finite, and since C_q is a finitely generated abelian group it is finite and equal to Ĉ_q; Corollary 1 then says the finite-index subgroups of Γ_A are exactly those containing some E_q.

## Localized cohomology declarations

### Finite kernel obstruction to descending mod-p characters

**Lemma:** `KTheoryLowDegrees:U.4/cg-congruence-kernel-characters`; proposed declaration `cg_congruence_kernel_characters`.

Let Γ be a group with profinite completion Γ̂, let Γ̄ be a profinite group with a continuous surjection Γ̂ → Γ̄ whose kernel C is finite and central, and let k be a finite field of characteristic p with p ∤ #C. Every homomorphism Γ → (k, +) extends uniquely to a continuous homomorphism on Γ̂, kills C, and so factors through a continuous homomorphism Γ̄ → k; in particular its kernel contains the preimage of an open subgroup of Γ̄.

Hypotheses: Γ an abstract group; Γ̂ its profinite completion (Mathlib ProfiniteGrp.profiniteCompletion); Γ̄ profinite with a continuous surjection Γ̂ → Γ̄ whose kernel C is finite and central. k a finite field of characteristic p, viewed as a discrete additive group; p does not divide #C.

Proof or construction:

1. A finite-target homomorphism extends by the profinite universal property.
2. The additive target has p-power exponent; coprimality forces a homomorphism C→k_add to vanish.
3. Use the quotient universal property to descend when its kernel contains C.

Direct prerequisites: `mathlib:ProfiniteGrp.ProfiniteCompletion.lift`.

Acceptance: Toy case: Γ = ℤ × ℤ/2 with congruence subgroups nℤ × ℤ/2, so Γ̄ = ℤ̂ and C = ℤ/2. For p = 3 every character descends; for p = 2 the projection Γ → ℤ/2 does not, so the hypothesis p ∤ #C cannot be dropped. For SL₂ over a CM quartic F, C ≅ μ(F), and under CG's hypotheses (p > 2 unramified in F) p ∤ #μ(F): e.g. F = ℚ(ζ₁₂), μ(F) = μ₁₂, and p = 3 is excluded because 3 ramifies in F.

Source: [CG.2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Remark 9.3, PDF physical p.119. Calegari–Geraghty name the congruence subgroup property as the key input for degree-one vanishing; this lemma is the group-theoretic step from a finite central kernel of order prime to p to the descent of mod-p characters, which the remark leaves implicit.

Source: [BMS.1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), Theorem 14.1, pp.129–130. BMS prove that the congruence kernel of SL_n, n≥3, is trivial or μ(F) and central; this is the finite central kernel used for PGL₃ over ℚ.

Source: [Serre.1970](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Théorème 2 and Corollaire 2, pp.498–499. Serre proves the same for SL₂ when the unit group is infinite, and his Corollaire 2 is the uncompleted form of this lemma; this is the input for a CM quartic field (PAPER-CALEGARI-GERAGHTY-18/E185 records that the remark cites only BMS).

### Separate determinant and special-linear characters

**Lemma:** `KTheoryLowDegrees:U.4/cg-determinant-character-interface`; proposed declaration `cg_determinant_character_interface`.

Let n = 2 and F a CM quartic field, or n = 3 and F = ℚ; G = Res_{F/ℚ} PGL_n, K ⊂ G(A^∞) compact open, Γ = G(ℚ) ∩ gKg⁻¹ a component lattice of Y(K), π : SL_n → PGL_n and Δ = π⁻¹(Γ) ∩ SL_n(F). Let k be a finite field of characteristic p with p > n and p unramified in F. Then restriction Hom(Γ, k) → Hom(Δ, k) is injective, and for every φ ∈ Hom(Γ, k) there is an open normal subgroup K′ ⊂ K with φ trivial on Γ ∩ gK′g⁻¹. One K′ works for all of H¹(Y(K), k).

Hypotheses: n = 2 with F a CM field of degree 4, or n = 3 with F = ℚ; G = Res_{F/ℚ} PGL_n as in CG §9 (PDF p.115). K ⊂ G(A^∞) any compact open subgroup (no neatness needed); cohomology is orbifold (group) cohomology. k a finite field of characteristic p with p > n and p unramified in F (CG §8.5, PDF p.110); then p ∤ #μ(F).

Proof or construction:

1. The determinant of a lift defines Γ → F^×/F^{×n} with kernel π(Δ); its image has exponent dividing n, so p > n kills every character of Γ trivial on π(Δ).
2. ker(π|Δ) = μ_n(F) has order dividing n, prime to p, so characters of π(Δ) and of Δ correspond.
3. Δ is commensurable with SL_n(O_F); a finite-index subgroup has congruence kernel inside that of SL_n(O_F): trivial for n = 3, F = ℚ (higher-rank-lattice-congruence-kernel) and μ(F) for n = 2, F CM quartic (serre-infinite-unit-congruence-kernel). Since p unramified in F forces p ∤ #μ(F), cg-congruence-kernel-characters makes φ∘π trivial on Δ ∩ Γ(𝔫) for some nonzero 𝔫. Here Δ₀ = Δ ∩ SL_n(O_F) has finite index in SL_n(O_F); its profinite completion is the open closure of Δ₀ in the completion of SL_n(O_F), and its congruence kernel is the intersection of that closure with the congruence kernel of SL_n(O_F) (profinite foundations), so cg-congruence-kernel-characters applies to Δ₀ with a finite kernel of order dividing #μ(F) or 1.
4. Choose 𝔫′ ⊆ 𝔫 so small that, at every component representative g, an element of Δ whose image lies in gK(𝔫′)g⁻¹ is congruent to a scalar modulo 𝔫, and let K′ be the normal core in K of K ∩ K(𝔫′) (open, normal, differing from K only above 𝔫′). Put Γ′ = Γ ∩ gK′g⁻¹ and Δ′ = {δ ∈ Δ : π(δ) ∈ Γ′}. Then Γ′/π(Δ′) embeds in F^×/F^{×n}, and Δ′/(Δ′ ∩ Γ(𝔫)) embeds in the scalars ζ modulo 𝔫 with ζⁿ = 1; both have exponent dividing n, which is invertible in k, and φ∘π vanishes on Δ′ ∩ Γ(𝔫). Hence φ vanishes on Γ′. Take the intersection over a basis of the finite group H¹(Y(K), k) (ALS component decomposition and group-cohomology comparison).

Direct prerequisites: `KTheoryLowDegrees:U.4/cg-congruence-kernel-characters`, `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`, `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`, `KTheoryLowDegrees:U.4/higher-rank-lattice-congruence-kernel`, `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`, `KTheoryLowDegrees:U.4/lattice-congruence-kernel`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`.

Acceptance: PGL₂ over F = ℚ(ζ₈) = ℚ(i, √2) (CM quartic, 3 unramified) with p = 3: the determinant quotient has exponent 2 and contributes no character to F₃; for GL₂(O_F) instead det is onto O_F^× ⊇ an infinite cyclic factor, so Hom(GL₂(O_F), F₃) ≠ 0 and a GL formalisation fails this test. n = 3, F = ℚ, K = PGL₃(Ẑ): Γ = PGL₃(ℤ) ≅ SL₃(ℤ) (GL₃(ℤ) = SL₃(ℤ) × {±1}), which is perfect, so Hom(Γ, k) = 0 and K′ = K works.

Source: [CG.2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), CG Remark 9.3, PDF physical p.119. Remark 9.3 of Calegari–Geraghty (stated for GL(2) and GL(3), read in the §9 setting Res_{F/ℚ}PGL_n) asserts that the congruence subgroup property of the lattices gives degree-one vanishing; CG §9 works with PGL_n and §8.5 assumes p > n unramified in F. This node is the lattice-level step: under those hypotheses the PGL determinant and the centre of SL_n contribute nothing, and every mod-p character is trivial on a congruence subgroup.

### The congruence theorem’s localized H¹ consumer

**Application:** `KTheoryLowDegrees:U.4/cg-localized-h1-vanishing`; proposed declaration `cgLocalizedH1Vanishing`.

In the setting of cg-determinant-character-interface (G = Res_{F/ℚ} PGL_n with n = 2, F CM quartic, or n = 3, F = ℚ; any compact open K; k = O/ϖ of characteristic p > n, p unramified in F), let m be a maximal ideal of the Hecke algebra T^S acting on H*(Y(K), k) that is non-Eisenstein. Then H⁰(Y(K), k)_m = 0 and H¹(Y(K), k)_m = 0.

Hypotheses: G = Res_{F/ℚ} PGL_n, n = 2 with F a CM quartic field or n = 3 with F = ℚ; K ⊂ G(A^∞) compact open (CG §9.1 levels included, neat or not); orbifold cohomology. k = O/ϖ of characteristic p with p > n and p unramified in F; the ψ-twisted coefficients of CG §9 reduce to trivial k-coefficients because ψ takes values in 1 + ϖO. m ⊂ T^S non-Eisenstein in the sense of Conjecture B: r̄_m exists and is absolutely irreducible. "Eisenstein" is ALS.4/eisenstein-maximal-ideal applied through the homomorphism T^S_{GL_n} → T^S_{PGL_n} obtained by pushing double cosets along GL_n(F_v) → PGL_n(F_v); that extension to Res_{F/ℚ}PGL_n is part of the ArithmeticLocallySymmetricSpaces:ALS.4 request.

Proof or construction:

1. H⁰(Y(K′), k) is Eisenstein-supported at every level K′ (requested from ALS.4; Hecke action on H⁰ from ALS.3/derived-hecke-action), so H⁰(Y(K), k)_m = 0.
2. By cg-determinant-character-interface choose K′ ◁ K, differing from K at a finite set S′, such that restriction H¹(Y(K), k) → H¹(Y(K′), k) is zero.
3. ALS.6/finite-cover-hochschild-serre, equivariant for T^{S∪S′}, then identifies H¹(Y(K), k) with H¹(K/K′, H⁰(Y(K′), k)).
4. Localize at m ∩ T^{S∪S′}, still non-Eisenstein (ALS.4/localization-at-maximal-ideal, exact): the term becomes H¹(K/K′, H⁰(Y(K′), k)_m) = 0.

Direct prerequisites: `KTheoryLowDegrees:U.4/cg-determinant-character-interface`, `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`, `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`, `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`, `ArithmeticLocallySymmetricSpaces:ALS.4`.

Acceptance: The imaginary-quadratic case of the remark is not an instance: there (q₀, l₀) = (1, 1), d = 3, H¹ lies in the range [1, 2] and need not vanish (CG Lemma 5.9(1) covers degrees 0 and 3 instead). Degree 0 is part of the conclusion: Conjecture B(4)(a) also needs H⁰_m = 0, and the H¹ argument itself passes through H⁰ at a deeper level.

Source: [CG.2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), CG Remark 9.3, PDF physical p.119. Remark 9.3 of Calegari–Geraghty names GL(2) over CM fields of degree 2 or 4 and GL(3) over ℚ, read in the §9 setting G = Res_{F/ℚ} PGL_n, and says without proof that in the last two cases the congruence subgroup property gives vanishing of localized H¹ at non-Eisenstein ideals. This node supplies the argument: characters become trivial at deeper level, and the finite-cover Hochschild–Serre sequence places them in a term with Eisenstein support.

## Supplier contracts

These are exact open interfaces, not assertions that the supplier has already completed the extension. Inherited arithmetic contracts are repeated only where a declaration of this part consumes them.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

For finite extensions k/ℚ_p containing μ_m, the named cohomological localSymbol at kummerCupPairing ζ, bilinearity and the Steinberg relation, with antisymmetry and nondegeneracy derived from them and from tateDualityPairing_perfect_mixed. This is ClassFieldTheory layer 5's cohomological scope. The comparison with BMS reciprocity orientation and the openness/finite index of k^{×m}, including archimedean cases, are separately recorded gaps; layer 5 explicitly forbids local reciprocity.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/power-reduction-trivial-residue`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

For number fields, rayClassArtinMap at an admissible modulus, its unramified-prime splitting law and surjectivity. Supply the admissibility proof; ramification support alone is insufficient. This is the ray-class form of BMS (A.5).

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

For a modulus 𝔪 over a number field, the ray class field and gal_rayClassField_equiv_rayClassGroup, normalized through the Artin map, with conductor dividing 𝔪. Use CFT layer 13’s construction from layer 12 and the GlobalNumberFields ray quotient.

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

For a finite Galois extension of number fields, infinitude of the unramified primes in each Frobenius conjugacy class, and invariance under deletion of finitely many primes. In the abelian case this selects any requested automorphism; it is BMS (A.6).

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary

Every open subgroup of IdeleClassGroup K contains RaySubgroup 𝔪 for a modulus 𝔪. Supply the surjective rayClassQuotient with that kernel and its prime-idèle/ray-class dictionary away from 𝔪, as GlobalNumberFields layer 7 requires.

Consumers: `KTheoryLowDegrees:U.4/serre-ray-prime-pair`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

The finite local Artin normalization that layer 6 states: the local Artin map with uniformizers sent to arithmetic Frobenius, and the existing quadratic comparison localArtinMap_quadratic_eq_hilbertSymbol between the cohomological symbol and the Artin action. The degree-m comparison in the BMS orientation (Art_v(b) acting on an m-th root of a), openness and finite index of K_v^{×m}, the wild higher-unit formulas (A.13)–(A.18) and the archimedean cases lie outside the stated scope of the layer; they are the gap "Higher-unit and local Artin interfaces" and an upstream note, not part of this request.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/power-reduction-trivial-residue`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

The global Artin map kills principal idèles and agrees with normalized local Artin maps. This supplies the proof of the degree-m product formula once CA.1 consumes the degree-m local dictionary; the higher-power reciprocity specialization remains CA.1-owned.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`.

### tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations

Unbundled cofinal finite-quotient descriptions, compact compatible-lift existence, and the completion universal property for abstract lattice groups. For Serre use profinite completions of quotient groups before they are known finite. This request does not include the noncompact rational arithmetic two-sided completion.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-completion-level-description`, `KTheoryLowDegrees:U.4/congruence-completion-level-description`, `KTheoryLowDegrees:U.4/arithmetic-kernel-level-comparison`, `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`.

### ArithmeticLocallySymmetricSpaces:ALS.4

For G = Res_{F/ℚ} PGL_n with n = 2 over a CM quartic field or n = 3 over ℚ, every compact open K and k a finite field of characteristic p: the Hecke module H⁰(X_K, k) is Eisenstein, i.e. every maximal ideal of T^S in its support is Eisenstein in the sense of eisenstein-maximal-ideal. Hecke operators act on H⁰, the functions on the finite set π₀(X_K), through right translation (derived-hecke-action); π₀(X_K) is a finite abelian group of exponent dividing n via the determinant modulo n-th powers. Also state eisenstein-maximal-ideal for G = Res_{F/ℚ}PGL_n through T^S_{GL_n} → T^S_{PGL_n}, with the characteristic polynomial of Calegari–Geraghty Conjecture B, so that "Eisenstein" has a meaning for these groups. On H⁰ the unnormalized T_{λ,i} acts by a character value times a Gaussian binomial coefficient in Nλ, so the associated polynomial splits into linear factors and is reducible.

Consumers: `KTheoryLowDegrees:U.4/cg-localized-h1-vanishing`.

## Remaining proof inputs

U.4 is planned: every target has a declaration or an imported owner, and each chain ends at checked library statements, owner nodes, a requested stage, or the precise gaps below. It is not closed.

### Reciprocity supplier cycle and orientation

BMS Proposition 3.1 and Theorem 3.5, Case 3 use the reciprocity formula (A.21), which BMS derive (p.89) from the degree-m product formula (A.19), the tame formula (A.16) and antisymmetry. ClassicalArithmeticCompletion:CA.1 owns these as hilbert-product-formula-of-degree-n and tame-hilbert-symbol-formula, but they cite the stage K2SymbolsBrauer:T.7, whose node T.7/symbol-formula cites MotivicEtaleKTheory:M.3; M.3/tate-global uses K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence, which cites KTheoryLowDegrees:U.4 for SK₁(O_{F,S})=0. Importing them here would close that cycle. CA.1's definitions of the power residue symbol depend only on CA.1-internal nodes and Mathlib, and are imported. Orientation: BMS's (a,b) is CA.1's (b,a). CA.1's power-reciprocity-law needs (a), (b), (n) pairwise coprime, which Proposition 3.1 never has (b lies in a level divisible by every prime above m), so the needed form is (A.21), to be derived in U.4 from CA.1's product and tame formulas once those are proved from the ClassFieldTheory Artin inputs.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/power-reduction-trivial-residue`.

### Higher-unit and local Artin interfaces

BMS (A.13)–(A.15) need the degree-m comparison between the cohomological local symbol and the Artin action in the BMS orientation, and openness and finite index of K_v^{×m}. For K_v/ℚ_p containing μ_{pⁿ}, e=ord_v(p), U_h=1+𝔭^h (U_0 the units) and j=clip_[0,n](⌊h/e−1/(p−1)⌋), (A.17) identifies the degree-pⁿ symbol images of U_h×U_0 and of U_{h+1}×K_vˣ with μ_{p^{n−j}}; (A.18) controls the degree-p^j symbol as a function of a modulo b for a∈U_h and ord_v(b)≥h. BMS prove (A.17) on pp.87–88 by induction on n through the p-th power map, from local computations in Serre's Corps locaux, which is not read here. ClassFieldTheory layer 5 is cohomological and excludes reciprocity, and layer 6 states only the quadratic comparison; the extension needs an upstream scope decision.

Consumers: `KTheoryLowDegrees:U.4/arithmetic-residue-symbol-ms`, `KTheoryLowDegrees:U.4/power-reduction-trivial-residue`.

### Two-sided rational group completion

The completions of G=SL_n(F) (n≥2) for the arithmetic and congruence topologies need Bourbaki's completion theorem for a group with an open subgroup on which the left and right uniform structures agree (Topologie générale III §3 no.4, Théorème 1), which Serre 1970 §1.3 p.491 invokes. Mathlib's group completion requires a uniform group (left and right uniformities equal on the whole group), which fails here, and no Tau Ceti declaration or atlas node supplies the two-sided completion. The lattice completions themselves are Mathlib's native profinite completion.

Consumers: `KTheoryLowDegrees:U.4/rational-completions-lattice-open`, `KTheoryLowDegrees:U.4/serre-completed-defect-kernel`, `KTheoryLowDegrees:U.4/serre-relative-universal-cover`.

### Arithmetic SL₂ finite generation

Serre §1.2 p.490 quotes O'Meara, Theorem 24.8, for finite generation of SL₂(O_{F,S}); BMS p.96 attribute the n≥3 case to Hurwitz and Borel–Harish-Chandra. No Mathlib or Tau Ceti declaration states it, and the nearest atlas node (ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation) covers only S=∅ after a long bridge. Only serre-elementary-index-after-completion needs it, through serre-defect-finite-generation.

Consumers: `KTheoryLowDegrees:U.4/serre-defect-finite-generation`.

### Moore's relative fundamental group

Serre's Théorème 2 (pp.498–499) computes the kernel of the relative universal covering from Moore's Theorem 12.3: π₁ of the congruence completion of SL₂ relative to SL₂(F) is μ(F) when S is totally imaginary (here S=∅ and F totally complex) and trivial otherwise. Moore's paper is not read here and no atlas node supplies the computation. The universal property itself (serre-relative-universal-cover) follows BMS Theorem 15.1 and needs no Moore input.

Consumers: `KTheoryLowDegrees:U.4/serre-infinite-unit-congruence-kernel`.

## Source corrections and ownership

The published 1974 erratum withdraws BMS A.23(b), while preserving A.23(c) with a transfer argument. The accepted parent records this as E112; none of these new statements uses the false numerical formula. Its A.10 prime-choice correction E115 is also retained through the existing node contracts. Calegari–Geraghty Remark 9.3 is read with the corrections already in the register: its degree q₀−1 should be d−1 (PAPER-CALEGARI-GERAGHTY-18/E184), and its SL₂ input is Serre 1970 (E185). The entries below are numbered after the sibling U.5 packet, which uses E116–E119.

- **KTheoryLowDegrees/E120**, Conclusion of §10, published Numdam scan, p.119: The retrospective citation identifies the Mennicke proof of part (b) as Theorem 5.1. The relevant result is Theorem 5.4, pp.101–103; (5.1) is a commutator equation. The theorem statement on p.101 gives exactly the Mennicke factorization used for Theorem 4.1(b). No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Checked on the page image of p.119: the closing paragraph of §10 cites a Theorem 5.1, but §5 has only the displayed formula (5.1), a commutator identity, and the Mennicke Theorem 5.4 (statement p.101, proof pp.102–103), whose Remark 1 says it proves Theorem 4.1(b). Renumbered from E116, which the sibling U.5 packet already uses.

- **KTheoryLowDegrees/E121**, Proof of Proposition 4, published author-hosted scan, p.497: The proof attributes trivial action of h(u)^m to Proposition 2. Use Proposition 3 (statement p.493, proof p.494), which states the diagonal commutator bound. Proposition 2 is the noncentral arithmetic-normalized subgroup result; Proposition 3 gives exactly the uniform diagonal power used. The alternative argument on p.498 also cites Proposition 3. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Checked on the page image of p.497: the proof of Proposition 4 obtains h(u)^m in the kernel from Proposition 2, while the statement used is Proposition 3 (p.493), which the Remark on p.498 cites. Renumbered from E117, which the sibling U.5 packet already uses.

- **KTheoryLowDegrees/E122**, Theorem 6.1 (Kubota), first line of the statement, p.103, published Numdam scan: The ring-type adjective in the theorem has an incorrect final letter. The hypothesis is a Dedekind ring. The surrounding chapter and the hypotheses of the theorem specify precisely Dedekind rings; this is a spelling misprint, with no mathematical change. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Checked on the page image: the first line of Theorem 6.1 (Kubota) on p.103 misspells Dedekind; no mathematical effect. Renumbered from E118, which the sibling U.5 packet already uses.

- **KTheoryLowDegrees/E123**, Corollary 4.3(c), p.95, displayed formula for ord_p(r), published Numdam scan: The minimum defining ord_p(r) is printed over the primes 𝔭 dividing the level ideal 𝔮. The minimum runs over the primes 𝔭 above the rational prime p, as in (3.3) on p.74 and Theorem 3.6 on p.77, to which the corollary refers. Over 𝔭 | 𝔮 the term ord_𝔭(p) vanishes for primes not above p, and primes above p that do not divide 𝔮 drop out: for F=ℚ(i,√−7), with 2O_F=(𝔓₁𝔓₂)², and 𝔮=𝔓₁⁶ the printed formula gives r=4, while Theorem 3.6 gives r=1. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on the page image of p.95 (index 𝔭|𝔮 in Fraktur under the minimum); the arithmetic-defect-order node already uses 𝔭 | p.

- **KTheoryLowDegrees/E124**, Proof of Lemma 5.5, p.102, display for the move a ↦ a+tb, published Numdam scan: The left conjugating matrix is printed with rows (1, 1) and (−t, 0). It is (1 0; −t 1), the inverse of the right factor (1 0; t 1) ∈ E₂(A). The printed matrix has determinant t and is not elementary; with it the first row of the product is not (a+tb, b), which the display concludes. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on a 220 dpi render of p.102.

- **KTheoryLowDegrees/E125**, Remark after condition (8.2)_n, p.107, published Numdam scan: Theorem 7.5 d) is said to allow deleting the commutator [GE_n(A), GE_n(A,q)] from (8.2)_n. The commutator in (8.2)_n, and the one Theorem 7.5 d) controls, is [GE_n(A), GL_n(A,q)]. Condition (8.2)_n, displayed just above, involves [GE_n(A), GL_n(A,q)], and Theorem 7.5 d) on p.106 states [GE_m(A), GL_m(A,q)] ⊂ E_m(A,q). No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on a 220 dpi crop of p.107.

- **KTheoryLowDegrees/E126**, Proof of Lemma 8.11, p.111, sentence introducing the entries of a′, published Numdam scan: The entries are introduced as a′_{i1} = −c_i for 1 < i ≤ n and a′_{1j} = r_j for 1 ≤ j < n. They should be a′_{i1} = −c_i for 1 ≤ i ≤ n and a′_{1,j+1} = r_j for 1 ≤ j < n. The two displays that follow require a′₁₁ = −c₁ (the corner entry 1 − c₁t = 1 + t a′₁₁) and a′₁₂ = r₁; as printed j=1 would set a′₁₁ = r₁. With the corrected indices both displays hold, checked numerically for n = 2,…,5. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on a 220 dpi crop of p.111; the displays and the conclusion are right.

- **KTheoryLowDegrees/E127**, Proof of Proposition 8.6, p.116, display of τ = πσπ⁻¹, row n−1, published Numdam scan: Row n−1 of τ begins its a-block with a_{n−1,1}. It begins with a_{n−1,2}, like every other row and like the display of σ just above. Conjugation by the swap of the last two coordinates leaves columns 2 to n−1 in place, so row n−1 keeps the entries a_{n−1,2}, … of σ; also a_{n−1,1}=0 by (10.4) when n ≥ 3, and the next display (ᾱ₁τ) prints a_{n−1,2}. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on a 220 dpi crop of p.116.

- **KTheoryLowDegrees/E128**, Proof of Proposition 8.6, p.117, definition of δ and the identity after it, published Numdam scan: δ and the following identity use entries a_{ij+1} and a_{ij} with an index i that is not bound. Row 1 is meant: a_{1,j+1} and a_{1j}. The same line prints a_{1n} for the last term, and the βδ display that follows has entries a_{nj} − a_{n1}a_{1j}; the matrix identity was checked numerically for ranks 2 to 6. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on a 400 dpi crop of p.117.

- **KTheoryLowDegrees/E129**, Proof of Proposition 8.5, p.118, display of τ = πσπ⁻¹ for n = 2, published Numdam scan: The bottom row of τ is printed (a₂₁ + tc₂, c₁, a₂₂). The middle entry is c₂: the bottom row is (a₂₁ + tc₂, c₂, a₂₂). Conjugating σ = ᾱε by the swap of the last two coordinates places the second coordinate of the column γ there; the next display (ᾱ₁τ) prints c₂, and the identity was checked on 300 random integer cases. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on a 400 dpi crop of p.118.

- **KTheoryLowDegrees/E130**, Proof of Proposition 2, p.492, final display, author-hosted published scan: The right factor in the display defining x′ is printed with second row (0, 0), a singular matrix. The right factor is the upper root with entries (1, −t; 0, 1), so x′ is the conjugate of x by that root. On p.493 the proof uses x′ ∈ X and the entries a′ = a + tc, c′ = c, which hold for the conjugate and fail for the printed product, whose determinant is zero. No correction was found in the recorded primary-source and erratum searches; this records search results, not a claim that no correction exists. Independent review: confirmed. Read on a 400 dpi crop of p.492 by the review.

ClassicalArithmeticCompletion:CA.1's tame formula, degree-m product formula and reciprocity law cite the stage K2SymbolsBrauer:T.7; T.7/symbol-formula cites MotivicEtaleKTheory:M.3, whose node M.3/tate-global uses K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence, which cites KTheoryLowDegrees:U.4 for SK₁(O_{F,S})=0. Importing those CA.1 nodes into U.4 would close a cycle. CA.1's power-residue-symbol definitions depend only on CA.1-internal nodes and Mathlib and are imported. Keep all degree-m symbols and higher reciprocity under CA.1. Re-prove hilbert-product-formula-of-degree-n and tame-hilbert-symbol-formula from the ClassFieldTheory local and global Artin inputs (layers 6 and 11) instead of K2SymbolsBrauer:T.7, in BMS's orientation or with the transposition recorded. U.4 then derives BMS (A.21) from them in one node and cites them from arithmetic-residue-symbol-ms and power-reduction-trivial-residue. No upstream-to-upstream link is edited here.

The accepted U.1 part already gives U.4 six planets, the per-layer limit. This continuation adds three coherent directions — the finite Mennicke extension and relative defects, the arithmetic defect order and S-unit refinements, and the congruence kernels with their consumer interface — and its two named theorems, Bass–Milnor–Serre Theorem 14.1 and Serre's congruence theorem for SL₂, cannot be shown as planets without exceeding the limit. Split U.4 into three sub-layers. (1) Finite Mennicke extension and relative defects: the inherited mennicke-symbol, universal-mennicke-group, kubota-hom, extension-conditions, standard-form-value, relative-standard-form-exists and sk1-mennicke-symbol, and this part's swap-stable-modifications, swap-reduction-left-middle, swap-smaller-corner-reduction, swap-higher-original-corner, swap-higher-conjugate-factorization, swap-higher-column-correction, swap-higher-corner-value, last-swap-higher-rank, swap-rank-two-nonzero, swap-rank-two-pair-choice, swap-rank-two-bezout-completion, swap-rank-two-standard-form, swap-rank-two-omega-row, swap-rank-two-beta-symbol, swap-rank-two-symbol-cancellation, last-swap-dedekind-rank-two, ge-invariance-complete, next-rank-product-law, extended-hom, extended-hom-embed, extended-hom-elementary-kernel, extended-hom-conditions, dedekind-iterated-symbol-hom, mennicke-sign-unit, finite-mennicke-defect, finite-defect-symbol, finite-defect-generated-sl2, finite-defect-universal-map, finite-defect-universal-uniqueness, finite-defect-mennicke-equivalence, finite-defect-stabilization, finite-defect-central-lattice, finite-defect-level-map, finite-defect-level-functor-laws, finite-gl-projection-conditions, finite-gl-stabilization-surjective, finite-gl-stabilization-injective, finite-gl-commutator-pullback, finite-symbol-ms1, finite-symbol-ms2, relative-high-gl-commutator. (2) Arithmetic S-units and defect orders: the inherited s-unit-theorem, fundamental-s-units, K1-S-integers-*, dirichlet-theorem-arithmetic-type, arithmetic-mennicke-symbols-trivial and bass-milnor-serre, and this part's arithmetic-defect-order, defect-order-divisor, defect-order-monotonicity, defect-order-unit-level, defect-order-full-depth, arithmetic-residue-symbol-ms, arithmetic-residue-symbol-surjective, power-reduction-trivial-residue, arithmetic-residue-symbol-injective, arithmetic-finite-defect-roots, arithmetic-defect-transition-power, arithmetic-defect-deep-cofinality, arithmetic-defect-limit, s-unit-principal-prime-powers, s-unit-valuation-image-index, s-unit-rank-from-exact-sequence. (3) Congruence kernels and the cohomological consumer: this part's arithmetic-residue-ring-finite, arithmetic-congruence-index, arithmetic-elementary-index, arithmetic-elementary-cofinal, arithmetic-completion-level-description, congruence-completion-level-description, lattice-congruence-kernel, arithmetic-kernel-level-comparison, higher-rank-lattice-congruence-kernel, rational-sl-no-finite-quotients, rational-completions-lattice-open, higher-rank-central-kernel, serre-relative-elementary, serre-finite-index-containment, serre-noncentral-root-choice, serre-normalizer-root-level, serre-relative-row-relations, serre-diagonal-congruence-commutator, serre-two-frobenius-factor, serre-ray-prime-pair, serre-unit-exponent-row-choice, serre-uniform-diagonal-commutator, serre-level-transition-surjective, serre-rational-conjugation-refinement, serre-abstract-limit-centrality, serre-quotient-centrality, serre-defect-finite-generation, serre-completed-defect-kernel, serre-relative-universal-cover, serre-infinite-unit-congruence-kernel, serre-elementary-index-after-completion, cg-congruence-kernel-characters, cg-determinant-character-interface, cg-localized-h1-vanishing. Planets: keep the inherited ones on (1) and (2); on (3) mark higher-rank-lattice-congruence-kernel ("Congruence subgroup property for SLₙ") and serre-infinite-unit-congruence-kernel ("Serre's congruence theorem for SL₂"). If the split is not accepted, these two should replace the inherited dirichlet-theorem-arithmetic-type and arithmetic-mennicke-symbols-trivial planets, which needs an edit of the U.1 packet.

The six inherited U.4 planets remain until the sub-layer split is decided; this continuation marks none, and the proposal above names the two congruence theorems as the planets of the third sub-layer. General higher reciprocity remains CA.1-owned, class formations and Artin normalization remain ClassFieldTheory-owned, profinite limit infrastructure remains ProfiniteProPGroups-owned, duality and Hecke infrastructure remain ArithmeticLocallySymmetricSpaces-owned, and the degree d−1 conclusion of Remark 9.3 belongs to AutomorphyLiftingBeyondTaylorWiles. No existing roadmap is replanned.

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
| `mathlib:Ideal.absNorm_mem` | `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean` | The absolute norm of an ideal, as an element of the ring, lies in the ideal. |
| `mathlib:Ideal.exists_ideal_over_prime_of_isIntegral` | `Mathlib/RingTheory/Ideal/GoingUp.lean` | For an integral extension, every prime of the base has a prime lying over it. |
| `mathlib:Ideal.finiteQuotientOfFreeOfNeBot` | `Mathlib/LinearAlgebra/FreeModule/IdealQuotient.lean` | For a ring free and finite over ℤ (such as 𝓞 F), the quotient by a nonzero ideal is finite. |
| `mathlib:Ideal.quotientMap_injective` | `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` | The map R/(I.comap f) → S/I induced by a ring map f is injective. |
| `mathlib:Ideal.rootsOfUnityMapQuot_injective` | `Mathlib/NumberTheory/NumberField/Ideal/Basic.lean` | For an ideal of a ring of integers whose norm is not 1 and is coprime to n, the n-th roots of unity inject into the quotient. |
| `mathlib:IsCyclotomicExtension.isAbelianGalois` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean` | A cyclotomic extension is an abelian Galois extension. |
| `mathlib:IsDedekindDomain.HeightOneSpectrum.intValuation_if_neg` | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean` | For nonzero r the adic valuation of r is exp(−(multiplicity of v in rR)). |
| `mathlib:IsDedekindDomain.HeightOneSpectrum.valuationOfNeZero_eq` | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean` | valuationOfNeZero x, viewed in ℤᵐ⁰, is the v-adic valuation of x. |
| `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_eq_one_iff_notMem` | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean` | An element of R has v-adic valuation 1 exactly when it is not in the prime v. |
| `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_of_algebraMap` | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean` | The valuation on the fraction field restricts to the adic valuation on R. |
| `mathlib:IsDedekindDomain.exists_forall_sub_mem_ideal` | `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean` | Chinese remainder theorem in a Dedekind domain: for finitely many distinct primes with prescribed exponents, an element with prescribed residues modulo each prime power exists. |
| `mathlib:IsDomain.hasRankNullity` | `Mathlib/LinearAlgebra/Dimension/Localization.lean` | A domain has the rank–nullity property for its modules. |
| `mathlib:LinearMap.rank_range_add_rank_ker` | `Mathlib/LinearAlgebra/Dimension/RankNullity.lean` | For a linear map over a ring with rank–nullity, rank(range)+rank(ker) equals the rank of the domain. |
| `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` | `Mathlib/LinearAlgebra/Projectivization/PSL/PSL2.lean` | PSL(2,F) is a simple group when F has an element a≠0 with a²≠1. |
| `mathlib:Matrix.SL2.commutator_eq_top` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | If F has an element a≠0 with a²≠1, the commutator subgroup of SL(2,F) is the whole group. |
| `mathlib:Matrix.SL2.transvection_induction` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | Induction principle: a property of SL(2,F) holding at the identity, for upper and lower transvections and stable under products holds everywhere. |
| `mathlib:Matrix.SpecialLinearGroup.map` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | The homomorphism SLₙ(R)→SLₙ(S) induced by a ring homomorphism R→S. |
| `mathlib:Matrix.commutator_diag2_transvection` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | The commutator of diag(a,a⁻¹) with an upper transvection E₁₂(b) is the transvection E₁₂(b(a²−1)), and similarly for lower transvections. |
| `mathlib:NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | The number of infinite places is r₁+r₂. |
| `mathlib:NumberField.classNumber` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | The class number of a number field, the cardinality of the class group of 𝓞 F. |
| `mathlib:NumberField.classNumber_pos` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | The class number is positive. |
| `mathlib:ProfiniteGrp.ProfiniteCompletion.completion` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean` | The profinite completion of a group, defined as the limit of its finite quotients by finite-index normal subgroups. |
| `mathlib:ProfiniteGrp.ProfiniteCompletion.eta` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean` | The canonical homomorphism from a group to its profinite completion (with dense image). |
| `mathlib:QuotientGroup.fg` | `Mathlib/GroupTheory/Finiteness.lean` | A quotient of a finitely generated group is finitely generated. |
| `mathlib:Subgroup.fg_of_index_ne_zero` | `Mathlib/GroupTheory/Schreier.lean` | Schreier: a finite-index subgroup of a finitely generated group is finitely generated. |
| `mathlib:Subgroup.finiteIndex_ker` | `Mathlib/GroupTheory/Index.lean` | The kernel of a homomorphism with finite range has finite index. |
| `mathlib:Subgroup.finiteIndex_normalCore` | `Mathlib/GroupTheory/Index.lean` | The normal core of a finite-index subgroup has finite index. |
| `mathlib:Subgroup.index_ker` | `Mathlib/GroupTheory/Index.lean` | The index of a kernel equals the cardinality of the range. |
| `mathlib:Subgroup.normalCore` | `Mathlib/Algebra/Group/Subgroup/Basic.lean` | The normal core of a subgroup, the largest normal subgroup it contains. |
| `mathlib:Subgroup.normalCore_le` | `Mathlib/Algebra/Group/Subgroup/Basic.lean` | The normal core of H is contained in H. |
| `mathlib:Subgroup.pow_index_mem` | `Mathlib/GroupTheory/OrderOfElement.lean` | For a normal subgroup N and any g, g raised to the index of N lies in N. |
| `mathlib:Subgroup.relIndex_mul_index` | `Mathlib/GroupTheory/Index.lean` | For H≤K, the relative index of H in K times the index of K is the index of H. |
| `mathlib:Subgroup.subgroupOfEquivOfLe` | `Mathlib/Algebra/Group/Subgroup/Map.lean` | For H≤K, H viewed as a subgroup of K is isomorphic to H. |
| `tauceti:AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one` | `TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean` | An arithmetic Frobenius at a prime over 𝔭∤m sends an m-th root of unity ζ to ζ raised to the absolute norm of 𝔭. |
| `tauceti:IsDedekindDomain.integer_comap_ne_bot` | `TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean` | A nonzero ideal of the ring of S-integers contracts to a nonzero ideal of the Dedekind base ring. |
| `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field` | `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean` | Over a field, SLₙ is generated by the transvections. |

## Source record and suggested forms

Sources were read on 9 October 2026. BMS means the published Numdam scan; Serre 1970 means the author-hosted published scan; Serre 1974 means the public published erratum. CG is an author-hosted publisher-layout article. Its Remark 9.3 is cited by physical PDF page 119 because that copy lacks journal page numbers. No book text or source passage is reproduced.

- [Solution of the congruence subgroup problem for SLₙ (n ≥ 3) and Sp₂ₙ (n ≥ 2)](https://www.numdam.org/item/10.1007/BF02684586.pdf), Hyman Bass, John Milnor and Jean-Pierre Serre, Publications Mathématiques IHÉS 33 (1967), 59–137. Read: §3 Theorem 3.6, pp.77–79; §4 Theorem 4.1 and Corollaries 4.2–4.3, pp.94–96; §5 Theorem 5.4 and Lemma 5.5, pp.101–103; §§7–11, pp.105–121, with the last-swap matrices pp.115–119 inspected in the scan; §14, pp.128–130; §15, Theorem 15.1 and proof, pp.130–132; Appendix (A.13)–(A.23), pp.85–92; (A.17)–(A.18) statement p.86 and proof pp.87–89; §§2–3 Lemmas 2.3, 2.7, 2.9, Proposition 3.1, (3.3), Theorems 3.5–3.6, pp.65–78 (review). SHA-256: `b455790cdaeba5e3a313f1bd4dddfe2892e8a2035067bcdef434ef717edfb996`.

- [Le problème des groupes de congruence pour SL₂](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), Jean-Pierre Serre, Annals of Mathematics 92 (1970), 489–527; author-hosted published scan. Read: Introduction and §1, pp.489–492; §2.1–§2.6, pp.492–500; Proposition 5 and Theorems 1–2 pp.498–499; §3.1 Theorem 6, pp.504–505, the excluded finite-unit-rank cases; §1.1–§1.4, pp.490–492 (unit theorem notation, finiteness of A/q, Bourbaki completion, definition of E_q); Corollaries 1–2 to Theorem 2, p.499 (review). SHA-256: `2a079cca247de1b4765a4c5cb0d70ef1351ee192115fa34a9cd41c3fa1ec5e37`.

- [On a functorial property of power residue symbols](https://www.numdam.org/item/10.1007/BF02685884.pdf), Jean-Pierre Serre, Publications Mathématiques IHÉS 44 (1974), 241–244, published erratum to BMS. Read: Entire four-page article, Theorems 1–4; A.23(b) withdrawn, A.23(c) retained with transfer proof. SHA-256: `2f52d05a0f1ff1563d9da85efd8b224d1e110d9f67c940f3d9c0bbd2051184f9`.

- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Frank Calegari and David Geraghty, Inventiones Mathematicae 211 (2018), 297–433; author-hosted article. Read: §9.3 Conjecture B and Remark 9.3, PDF physical pp.118–120, Remark 9.3 on physical p.119; publisher-layout author copy lacks journal page numbers. SHA-256: `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5`.

- [Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANT.pdf), J. S. Milne, Course notes, version 3.08, 19 July 2020 (166 pages); PDF page = printed page + 2. Read: §5 S-units, Theorem 5.11 and its proof, printed p.90 (PDF p.92). SHA-256: `24b83c789a89f25aebffb3cbe4ae5ca29edd0075acc072de093d140770630847`.

The [suggested file](../suggested/KTheoryLowDegrees--U.4.lean) is a stand-alone Mathlib slice of the new interfaces. Its Inherited namespace only supplies prototypes of already owned inputs; assembly should import the existing definitions. It contains all 5 definitions and constructions of this part, their 28 API items and 23 unit tests, with explicit noncommutative targets and native matrix, quotient, unit-torsion, normal-closure and profinite-completion carriers. The arithmetic-profile tests state their hypotheses explicitly, and the mixed-primes test uses Mathlib's cyclotomic field ℚ(ζ₃). The S-integer finite-defect signature takes the inherited Dedekind instance and nonzero ideal contraction explicitly.

The congruence kernel is defined on Mathlib's profinite completion of SLₙ(O_{F,S}), so the lattice forms of Bass–Milnor–Serre Theorem 14.1 and of Serre's Théorème 2 are stated. The rational completion results, Moore's relative covering and the Calegari–Geraghty Hecke statement cannot yet be stated against concrete supplier objects; their signatures are omitted under the protocol's rule, and no opaque predicate stands in for them. The suggested file elaborates at the pinned Mathlib with automatic implicit variables disabled and only proof-placeholder warnings; this checks signatures, not proofs.

Confirmed findings: RT-AREA-ktheory-1/24 is resolved by the parent S-unit theorem, whose rank proof is split here into three library-level steps; /25 uses the parent arithmetic prime-choice nodes and their ClassFieldTheory, Chebotarev and GlobalNumberFields inputs, imports CA.1's power-residue symbol, and records the reciprocity cycle and its orientation explicitly.
