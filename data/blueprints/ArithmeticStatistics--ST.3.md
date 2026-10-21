# Fields and class groups — ArithmeticStatistics ST.3

This is the target-level follow-up plan for `ArithmeticStatistics:ST.3`, issue #6355. It extends the [accepted parent packet](../packets/ArithmeticStatistics.json) and retains all 33 accepted ST.3 target IDs. The [packet](../packets/ArithmeticStatistics--ST.3.json) is the machine-readable plan; the [suggested file](../suggested/ArithmeticStatistics--ST.3.lean) proposes native signatures.

Every target assigned to this part has a statement and a prerequisite chain. The planning pass is complete; the stage is **planned**, with 19 precise gaps and 24 supplier requests, and is **not closed**. No declaration is claimed as implemented. The suggested file elaborates at the pins with only placeholder-proof warnings; its omission ledger distinguishes unavailable exact supplier interfaces from native signatures.

## Conventions and ownership

Fields are counted by absolute field discriminant unless a theorem explicitly specifies the norm of a relative discriminant or a generator/radicand height. Isomorphism classes, embedded fields and rigid labeled fields are distinct counting families. Local masses retain automorphism weights. Ordinary and narrow class groups use their native carriers; relative class groups are kernels of the native norm.

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations, with their hypotheses, were read before being cited. Current upstream roadmaps were also checked at commit `81207c7` (current library `a91d3aa`, current Mathlib `6b7abb`): GlobalNumberFields orders/Picard groups, ClassFieldTheory norm/class-field layers, Completed/EffectiveBounds, IntegralLattices and the InductionRestriction projective/Schur-multiplier layer. The nine roadmaps newer than the atlas snapshot are not planned again.

ST.1 owns integral orbit/order parametrizations; ST.2 owns orbit geometry and sieve uniformity; ST.5 owns generic moment uniqueness, finite-matrix laws and function-field moment proofs. AnalyticNumberTheory belongs to the same upstream bundle. The exact external requests below specify the additional interfaces. Accepted InductionRestrictionPartII supplies reduced multipliers, reduced covers and finite certificates; accepted InverseGalois supplies the arithmetic lifting invariant. Their supplier gaps propagate through the imports.

## Layer targets and proof contracts

### Ranks and quadratic moments

The four-rank is the rank of two-torsion inside the squares, rather than the rank of all two-torsion. The conic formula and Jacobi expansion turn powers of this cardinal into character sums. The surviving supports are affine translates of maximal singular planes, but the main coefficient requires a stronger, nonsymmetric bilinear condition on the underlying planes. Its finite bijection gives N(k,2), the number of all subspaces of F₂^k. The real coefficient is 2^(−k)(N(k+1,2)−N(k,2)). These yield 2 and 3/2 at the first moment. The passage to rank probabilities imports the generic uniqueness theorem of ST.5; it does not treat a heuristic as an arithmetic moment theorem.

<a id="prime-power-class-group-rank"></a>

#### Prime-power ranks of finite abelian groups

**ID:** `ArithmeticStatistics:ST.3/prime-power-class-group-rank`. **Kind:** definition. **Proposed name:** `FieldStatistics.powerRank`.

For a finite abelian group A, a prime p and k≥1, rk_{p^k}(A)=log_p #((A^{p^{k−1}})[p]); equivalently it is dim_Fp(A^{p^{k−1}}/A^{p^k}). The cardinal form avoids choosing an elementary-abelian module instance. rk₄ means p=2,k=2, and for a real quadratic field the primary input is A=Cl⁺(K).

Hypotheses: A is a finite commutative group; p is prime; k≥1.

Proof or construction:

1. Take the image of the power homomorphism, then its p-torsion. Finite abelian group structure identifies the resulting cardinal with a power of p.
2. Relate the cardinal to the adjacent quotient; the p-power factor decomposition gives the rank, and the existing elementary-two quotient supplies the k=1 comparison.

Direct prerequisites: `ArithmeticStatistics:ST.3/torsion-count-of-class-groups`; `tauceti:NumberField.NarrowClassGroup`; `tauceti:NumberField.NarrowClassGroup.instFinite`; `tauceti:TauCeti.ClassGroup.ElementaryTwoQuotient`; `tauceti:TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion`.

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §1, p.1; §3.2, Lemma9, p.11.

Uses: FK Theorems1–3, pp.3–4 — Distinguishes class-group 4-rank from 2-rank in moments and densities.; Koymans–Milovic §1 and §5 — Indexes governing-field and 16-rank criteria..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.powerRank` | The integer log_p of the cardinal of p-torsion inside p^{k−1}-th powers. |
| `FieldStatistics.powerRank_eq_log_quotient` | For k≥1, powerRank(A,p,k)=log_p # (A^{p^{k−1}}/A^{p^k}). |
| `FieldStatistics.powerRank_congr` | A group isomorphism preserves every prime-power rank. |
| `FieldStatistics.powerRank_prod` | Prime-power rank is additive on finite direct products. |
| `FieldStatistics.powerRank_antitone` | For k≥1, rk_{p^{k+1}}(A)≤rk_{p^k}(A). |
| `FieldStatistics.powerRank_one_eq_elementaryTwo` | For p=2,k=1, 2^powerRank equals the cardinal of A/A²; for A=Cl(K), use TauCeti.ClassGroup.ElementaryTwoQuotient. |

Unit tests:

- `FieldStatistics.powerRank_c2_at_four` (computation): rk₄(C₂)=0; elementary two-torsion alone must not be counted as 4-rank.
- `FieldStatistics.powerRank_c4_at_four` (computation): rk₄(C₄)=1.
- `FieldStatistics.powerRank_c8_at_eight` (computation): rk₈(C₈)=1 and rk₁₆(C₈)=0.
- `FieldStatistics.powerRank_trivial` (degenerate): Every prime-power rank of the trivial group is zero.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="fk-linking-phase"></a>

#### The Fouvry–Klüners linking phase

**ID:** `ArithmeticStatistics:ST.3/fk-linking-phase`. **Kind:** definition. **Proposed name:** `FieldStatistics.fkPhase`.

On E_k=(F₂²)^k put Φ_k(u,v)=Σ_j(u_{j,1}+v_{j,1})(u_{j,1}+v_{j,2}). Two indices are linked exactly when Φ_k(u,v)+Φ_k(v,u)=1. Set P_k(w)=Σ_j w_{j,1}(w_{j,1}+w_{j,2}); then linkage equals P_k(u+v). These are F₂-valued expressions; exponents in a Jacobi-symbol product use their representatives 0,1.

Hypotheses: k≥0; all coordinates and phase values lie in F₂.

Proof or construction:

1. Expand each Jacobi factor of the first moment and raise to the kth power. Pairwise coprime squarefree factors provide the (F₂²)^k indexing.
2. Expand Φ_k(u,v)+Φ_k(v,u), keeping the characteristic-two quadratic term as well as its alternating polar form.

Direct prerequisites: .

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §5.1–5.2, (20)–(27), pp.15–17.

Uses: FK Lemma17 and Proposition3, pp.17 and23 — Partitions the expanded moment into linked error terms and maximal unlinked main terms.; FK Lemma18, pp.22–23 — Reduces the support of the main term to affine totally singular spaces..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.fkPhase` | The F₂-valued phase Φ_k on ordered pairs. |
| `FieldStatistics.fkQuadratic` | The quadratic expression P_k. |
| `FieldStatistics.fkLinked` | Linkage means fkPhase(u,v)+fkPhase(v,u)=1. |
| `FieldStatistics.fkPhase_diagonal` | Φ_k(u,u)=0. |
| `FieldStatistics.fkPhase_linked_iff` | Φ_k(u,v)+Φ_k(v,u)=P_k(u+v). |
| `FieldStatistics.fkLinked_translate` | Simultaneous translation u↦u+c, v↦v+c preserves linkage. |

Unit tests:

- `FieldStatistics.fkPhase_zero` (degenerate): For k=0 the phase and quadratic expression vanish.
- `FieldStatistics.fkPhase_asymmetric` (computation): For k=1,u=(1,0),v=(0,0), Φ(u,v)=1 and Φ(v,u)=0.
- `FieldStatistics.fkPhase_diagonal_vector` (non-example): For k=1,u=(1,1),v=0, both ordered phases equal 1 but u and v are unlinked; P(u)=0.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="fk-good-subspace-bijection"></a>

#### Good subspaces and the Fouvry–Klüners main coefficient

**ID:** `ArithmeticStatistics:ST.3/fk-good-subspace-bijection`. **Kind:** theorem. **Proposed name:** `FieldStatistics.fk_good_subspace_bijection`.

Let E_k=F₂^{2k}, k≥1, and L(u,v)=Σ_j u_{j,1}(v_{j,1}+v_{j,2}). The k-dimensional subspaces U with L|_{U×U}=0 are in bijection with all subspaces of F₂^k. In the basis b_{j,1}=e_{j,1}+e_{j,2}, b_{j,2}=e_{j,2}, the bijection sends F≤X=span(b_{j,1}) to F⊕F^⊥≤X⊕Y. Consequently their number is N(k,2). If a nonempty Γ⊆{1,…,k} prescribes Σ_{j∈Γ}(u_{j,1}+u_{j,2})=0, or prescribes Σ_{j∈Γ}u_{j,1}=0, the number is N(k−1,2).

Hypotheses: k≥1; good means the full nonsymmetric bilinear form vanishes, not merely its alternating symmetrization.

Proof or construction:

1. Use the displayed change of basis to express L as the perfect X×Y pairing. Projection of a good k-plane to X is F, and projection to Y lies in F^⊥.
2. Dimensions force U=F⊕F^⊥. The extra linear constraint means respectively containing one nonzero vector or lying in one hyperplane; quotient or duality yields N(k−1,2).

Direct prerequisites: [ArithmeticStatistics:ST.3/fk-linking-phase](#fk-linking-phase).

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §5.7, Lemma26 and its proof, pp.32–34.

Acceptance:

- Let E_k=F₂^{2k}, k≥1, and L(u,v)=Σ_j u_{j,1}(v_{j,1}+v_{j,2}). The k-dimensional subspaces U with L|_{U×U}=0 are in bijection with all subspaces of F₂^k. In the basis b_{j,1}=e_{j,1}+e_{j,2}, b_{j,2}=e_{j,2}, the bijection sends F≤X=span(b_{j,1}) to F⊕F^⊥≤X⊕Y. Consequently their number is N(k,2). If a nonempty Γ⊆{1,…,k} prescribes Σ_{j∈Γ}(u_{j,1}+u_{j,2})=0, or prescribes Σ_{j∈Γ}u_{j,1}=0, the number is N(k−1,2).

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="quadratic-four-rank-conic-formula"></a>

#### Four-ranks as soluble discriminant factorizations

**ID:** `ArithmeticStatistics:ST.3/quadratic-four-rank-conic-formula`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quadratic_four_rank_conic_formula`.

For a fundamental quadratic discriminant D, let C_D be the narrow class group. Then 2^{rk₄ C_D} is one half the number of signed squarefree divisors b of D for which b′ is the squarefree part of D/b and the conic b x²−b′ y²=z² has a nonzero rational point. All signs and the prime2 conditions are retained; replacing this by residue conditions only at the odd primes is insufficient.

Hypotheses: D is a fundamental discriminant, D≠1; for positive D the class group is narrow.

Proof or construction:

1. Represent the two-torsion classes by ramified ideals and apply the quadratic genus-character test for being a square.
2. Translate the square condition to the conic; use its local-to-global principle and quadratic reciprocity.
3. Count the two complementary factorizations for each class.

Direct prerequisites: [ArithmeticStatistics:ST.3/prime-power-class-group-rank](#prime-power-class-group-rank); `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`.

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §3, Theorem5 and Lemmas4–10, pp.9–12.

Acceptance:

- For a fundamental quadratic discriminant D, let C_D be the narrow class group. Then 2^{rk₄ C_D} is one half the number of signed squarefree divisors b of D for which b′ is the squarefree part of D/b and the conic b x²−b′ y²=z² has a nonzero rational point. All signs and the prime2 conditions are retained; replacing this by residue conditions only at the odd primes is insufficient.

Suggested-file coverage: **omitted signature**. Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

<a id="quadratic-four-rank-jacobi-expansion"></a>

#### The four-rank Jacobi expansion

**ID:** `ArithmeticStatistics:ST.3/quadratic-four-rank-jacobi-expansion`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quadratic_four_rank_jacobi_expansion`.

If D<0 is odd and fundamental, then 2^{rk₄ C_D}=2^{-1−ω(|D|)} Σ_{|D|=D₀D₁D₂D₃}(D₂/D₀)(D₁/D₃)(D₃/D₀)(D₀/D₃), over positive pairwise coprime squarefree factors. Raising this to k gives the (F₂²)^k-indexed sum with weight 2^{-kω(∏D_u)}, phase Φ_k(u,v) and prefactor 2^{-k}. For the other five sign/congruence families the same phase persists with the precise characters at −1 and2 supplied by Lemmas28,34,39,41,43.

Hypotheses: k≥1; the six families are D of either sign with D odd, D≡0 mod8, or D≡4 mod8.

Proof or construction:

1. Expand the quadratic-residue indicator as a product over the ramified primes.
2. Distribute each prime among the four factors, then among the 4^k factors for kth moments.
3. For the even and positive cases carry the −1 and2 character factors through the expansion.

Direct prerequisites: [ArithmeticStatistics:ST.3/quadratic-four-rank-conic-formula](#quadratic-four-rank-conic-formula); [ArithmeticStatistics:ST.3/fk-linking-phase](#fk-linking-phase).

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §5.1, (20), Lemma17, pp.14–16; Lemmas28,34,39,41,43, pp.35,42,45,48,51.

Acceptance:

- If D<0 is odd and fundamental, then 2^{rk₄ C_D}=2^{-1−ω(|D|)} Σ_{|D|=D₀D₁D₂D₃}(D₂/D₀)(D₁/D₃)(D₃/D₀)(D₀/D₃), over positive pairwise coprime squarefree factors. Raising this to k gives the (F₂²)^k-indexed sum with weight 2^{-kω(∏D_u)}, phase Φ_k(u,v) and prefactor 2^{-k}. For the other five sign/congruence families the same phase persists with the precise characters at −1 and2 supplied by Lemmas28,34,39,41,43.

Suggested-file coverage: **omitted signature**. Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

<a id="fk-maximal-unlinked-support"></a>

#### Maximal unlinked supports

**ID:** `ArithmeticStatistics:ST.3/fk-maximal-unlinked-support`. **Kind:** theorem. **Proposed name:** `FieldStatistics.fk_maximal_unlinked_support`.

An unlinked subset U of (F₂²)^k has at most 2^k members. Equality holds exactly for the affine translates of k-dimensional totally singular subspaces for P_k. In the kth Jacobi moment only maximal unlinked supports give a main term: boxes with two linked large variables, with an intermediate linked variable, or with fewer than 2^k large variables contribute O_{k,ε}(X(log X)^{-2^{-k}+ε}).

Hypotheses: k≥1 and ε>0 are fixed; X≥2.

Proof or construction:

1. Translate an unlinked support to contain zero and use its polar orthogonality; the maximal dimension is k.
2. Dissect each factor into multiplicative boxes with mesh 1+(log X)^{-2^k} and remove the boundary and excessive prime-factor boxes.
3. Apply the two quadratic bilinear estimates to linked pairs and Siegel–Walfisz to the remaining small characters.
4. Estimate the supports with fewer than 2^k large variables by the multiplicative mean-value bound.

Direct prerequisites: [ArithmeticStatistics:ST.3/quadratic-four-rank-jacobi-expansion](#quadratic-four-rank-jacobi-expansion); `SieveMethodsAndPrimePatterns:SV.2`; `AnalyticNumberTheory:AN.2`; `AnalyticNumberTheory:AN.5`.

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §5.3–5.4, Lemma18, Proposition3, pp.17–23.

Acceptance:

- An unlinked subset U of (F₂²)^k has at most 2^k members. Equality holds exactly for the affine translates of k-dimensional totally singular subspaces for P_k. In the kth Jacobi moment only maximal unlinked supports give a main term: boxes with two linked large variables, with an intermediate linked variable, or with fewer than 2^k large variables contribute O_{k,ε}(X(log X)^{-2^{-k}+ε}).

Suggested-file coverage: **omitted signature**. Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

<a id="fk-main-coefficient"></a>

#### The finite coefficient of the four-rank moment

**ID:** `ArithmeticStatistics:ST.3/fk-main-coefficient`. **Kind:** theorem. **Proposed name:** `FieldStatistics.fk_main_coefficient`.

Write N(k,2) for the number of all subspaces of F₂^k. Summing the reciprocity signs over maximal unlinked supports gives imaginary coefficient N(k,2), and real coefficient 2^{-k}(N(k+1,2)−N(k,2)). The same coefficients hold separately in each of the three fundamental-discriminant congruence families; the −1 and2 twists restrict the affine translates but do not change these normalized coefficients.

Hypotheses: k≥1.

Proof or construction:

1. Evaluate the character sum on the group of subsets under symmetric difference; its square vanishes unless the full bilinear form L is zero on the underlying k-plane.
2. Use the good-subspace bijection; for real discriminants sum the sizes of the projected subspaces.
3. For the even families impose the linear constraints from the2-character; the constrained count is N(k−1,2). Sum over the subsets of coordinates carrying that character.

Direct prerequisites: [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](#fk-maximal-unlinked-support); [ArithmeticStatistics:ST.3/fk-good-subspace-bijection](#fk-good-subspace-bijection).

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §5.5–5.7, Propositions4–5 and Lemmas20–26, pp.24–34; (105), pp.40–41; §§7–10, pp.41–52.

Acceptance:

- N(1,2)=2 and N(2,2)=5 give first-moment coefficients2 (imaginary) and3/2 (real).

Suggested-file coverage: **omitted signature**. Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

<a id="fk-narrow-wide-moment-comparison"></a>

#### Comparison of ordinary and narrow four-rank moments

**ID:** `ArithmeticStatistics:ST.3/fk-narrow-wide-moment-comparison`. **Kind:** theorem. **Proposed name:** `FieldStatistics.fk_narrow_wide_moment_comparison`.

For every fixed k≥1 and ε>0, the sum over positive fundamental D<X of |2^{k rk₄ Cl⁺(D)}−2^{k rk₄ Cl(D)}| is O_{k,ε}(X(log X)^{-1/2+ε}). The ranks agree off the thin family whose odd prime divisors are all1 mod4; this is an averaged comparison and does not assert equality for every real quadratic field.

Hypotheses: D is positive and fundamental; k≥1, ε>0, X≥2.

Proof or construction:

1. Use the narrow-to-ordinary exact sequence and the genus criterion to locate the exceptional family.
2. Count that family by the prime-factor sieve and apply Hölder using higher four-rank moments.
3. Combine the high-moment bound with the exceptional-family count and let the Hölder exponent grow.

Direct prerequisites: [ArithmeticStatistics:ST.3/fk-main-coefficient](#fk-main-coefficient); `SieveMethodsAndPrimePatterns:SV.1`; `tauceti:NumberField.NarrowClassGroup.toClassGroup`.

Sources: [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §3.2, Lemma10, Corollary1 and proof, pp.11–12.

Acceptance:

- For every fixed k≥1 and ε>0, the sum over positive fundamental D<X of |2^{k rk₄ Cl⁺(D)}−2^{k rk₄ Cl(D)}| is O_{k,ε}(X(log X)^{-1/2+ε}). The ranks agree off the thin family whose odd prime divisors are all1 mod4; this is an averaged comparison and does not assert equality for every real quadratic field.

Suggested-file coverage: **omitted signature**. Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

<a id="rank-moments-determine-rank-law"></a>

#### Rank moments determine the Cohen–Lenstra rank law

**ID:** `ArithmeticStatistics:ST.3/rank-moments-determine-rank-law`. **Kind:** theorem. **Proposed name:** `FieldStatistics.rank_moments_determine_rank_law`.

Let p be prime, u≥0 an integer and μ_X a probability measure on N. Suppose every moment Σ_r p^{kr} μ_X(r) tends to Σ_{j=0}^k #{j-dimensional subspaces of F_p^k} p^{-uj}. Then for every r≥0, μ_X(r) tends to p^{-r(r+u)} η_∞(p)/(η_r(p)η_{r+u}(p)), with η_t=∏_{i=1}^t(1−p^{-i}). The conclusion applies to the empirical4-rank by putting p=2 and u=0 or1; it does not deduce an arithmetic moment hypothesis from the heuristic.

Hypotheses: p is prime; u∈N; all displayed moments exist; the probability measures may be empirical measures of a height-ordered family.

Proof or construction:

1. Higher moments give tightness and uniform integrability for each lower moment, so every subsequential limit has the prescribed moments.
2. The subgroup-count formula bounds the moment coefficients by O_p(p^{k²/4}(k+1)), giving a Gaussian bound on limiting masses.
3. The difference of two candidate laws defines an entire generating function vanishing at every p^k. The geometric-zero growth lemma forces this function to vanish.
4. Evaluate the unique law by the q-binomial identities and remove the subsequence.
5. Import ST.5’s surjection-moment uniqueness theorem after finite Gaussian-binomial inversion of these rank moments. This node is the empirical-rank adapter, not a second plan of generic Cohen–Lenstra uniqueness; the alternate analytic proof retains its stated growth-lemma gap.

Direct prerequisites: [ArithmeticStatistics:ST.3/prime-power-class-group-rank](#prime-power-class-group-rank); `ArithmeticStatistics:ST.5/gaussian-binomial-coefficient`; `ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u`.

Sources: [delaunay-moments](https://arxiv.org/pdf/1303.7337), §2, Lemma3 and Corollary4, pp.5–6; §3, Theorem5 and its proof, pp.6–8, specialized to ℓ=1.

Acceptance:

- Let p be prime, u≥0 an integer and μ_X a probability measure on N. Suppose every moment Σ_r p^{kr} μ_X(r) tends to Σ_{j=0}^k #{j-dimensional subspaces of F_p^k} p^{-uj}. Then for every r≥0, μ_X(r) tends to p^{-r(r+u)} η_∞(p)/(η_r(p)η_{r+u}(p)), with η_t=∏_{i=1}^t(1−p^{-i}). The conclusion applies to the empirical4-rank by putting p=2 and u=0 or1; it does not deduce an arithmetic moment hypothesis from the heuristic.

Suggested-file coverage: **omitted signature**. Imports ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u; the missing arithmetic adapter must bind the empirical rank family and its Gaussian-inversion moments to that supplier.

Open proof/interface contracts: Geometric-zero growth lemma.

### Secondary cubic densities and the refined sieve

The X^(5/6) term requires more than the leading-volume sieve. A lattice’s leading-coefficient image and its fibre index enter with different powers. Local rescaling produces root-weighted counts, and the large-conductor range is controlled through quadratic ring-class characters. The final p-adic integral uses primitive classes in R/Z_p and the 2/3 power of their generated-order index. Its Haar normalization and integrability near roots are part of the contract. These are the missing proof inputs of the accepted BST second-term targets, whose IDs remain unchanged.

<a id="cubic-conductor-discriminant"></a>

#### The cubic conductor–discriminant adapter

**ID:** `ArithmeticStatistics:ST.3/cubic-conductor-discriminant`. **Kind:** theorem. **Proposed name:** `FieldStatistics.cubic_conductor_discriminant`.

For a non-Galois cubic field L/Q with quadratic resolvent K and normal closure M, disc(L)=disc(K) f² for a positive integer f, and the conductor of the cyclic extension M/K is f O_K. The cyclic cubic characters cutting out M are inverse and anti-invariant under Gal(K/Q). This is a correspondence with conductor and infinity conditions, not a count of arbitrary cubic extensions of K.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the standard representation of S₃ and induction of either nontrivial C₃ character. The Artin conductor identity gives the discriminant factorization.
2. Use reciprocity for ring class groups to identify anti-invariant characters; inverse characters give the same extension and the conjugate cubic fields give one Q-isomorphism class.

Direct prerequisites: `ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Sources: [bbp](https://math.dartmouth.edu/~carlp/BBPnew23.pdf), §3, Remark3.2 and Lemma3.3, p.12.

Acceptance:

- For x³−3, D_L=−243, D_K=−3 and f=9. Wild conductors must survive the formula.

Suggested-file coverage: **omitted signature**. Needs the exact Picard conductor sequence, relative class-field character correspondence and wild-prime3 normalization; the native finite-group rank does not replace them.

Open proof/interface contracts: Ring-class conductor normalization.

<a id="quadratic-order-three-torsion-bound"></a>

#### Three-torsion in a quadratic order

**ID:** `ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quadratic_order_three_torsion_bound`.

For the order O_f=Z+f O_K of conductor f≥1 in a quadratic field K, h₃(Pic(O_f)) ≤ 3^{ω(f)} h₃(Cl(K)). Equivalently its 3-rank is at most rk₃ Cl(K)+ω(f). At the conductor primes each local quotient contributes at most one dimension over F₃; the assertion includes ramified and wild primes.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Import the proper invertible ideal Picard group and the conductor exact sequence from GlobalNumberFields Layer11.
2. Factor the finite residue-unit quotient prime by prime. In each factor its 3-primary quotient has cyclic 3-torsion; quotienting by global units can only decrease the rank.
3. Apply the elementary torsion bound for an exact sequence of finite abelian groups.

Direct prerequisites: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `ArithmeticStatistics:ST.3/torsion-count-of-class-groups`.

Sources: [bbp](https://math.dartmouth.edu/~carlp/BBPnew23.pdf), §3, Lemma3.3 proof, p.12.

Acceptance:

- At conductor1 the Picard group and native maximal-order class group agree; the factor3^ω(1) is1.

Suggested-file coverage: **omitted signature**. Needs the exact Picard conductor sequence, relative class-field character correspondence and wild-prime3 normalization; the native finite-group rank does not replace them.

Open proof/interface contracts: Ring-class conductor normalization.

<a id="cubic-large-total-ramification-bound"></a>

#### Large totally ramified primes in cubic fields

**ID:** `ArithmeticStatistics:ST.3/cubic-large-total-ramification-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.cubic_large_total_ramification_bound`.

For either discriminant sign and X≥1, the number of cubic fields of |disc|<X totally ramified at a fixed prime p is O(X/p²), with an absolute implied constant. Therefore the union over p>M is O(X/M). This field assertion supplies the Y_p part; nonmaximal cubic rings W_p are a separate ST.2 estimate.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Apply the conductor–discriminant adapter and the quadratic-order torsion bound to the ring-class characters forced by total ramification.
2. Sum the conductor contributions with the first-moment quadratic three-torsion bound; the condition p|f contributes p^{-2}.
3. Sum p^{-2} over p>M; invoke the ST.2 nonmaximal estimate only when passing from fields to forms.

Direct prerequisites: [ArithmeticStatistics:ST.3/cubic-conductor-discriminant](#cubic-conductor-discriminant); [ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound](#quadratic-order-three-torsion-bound); `ArithmeticStatistics:ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields`; `ArithmeticStatistics:ST.2/binary-cubic-counts-with-congruence-conditions`.

Sources: [bst](https://arxiv.org/pdf/1005.0672v3), §8, Proposition29, pp.23–26.

Acceptance:

- For either discriminant sign and X≥1, the number of cubic fields of |disc|<X totally ramified at a fixed prime p is O(X/p²), with an absolute implied constant. Therefore the union over p>M is O(X/M). This field assertion supplies the Y_p part; nonmaximal cubic rings W_p are a separate ST.2 estimate.

Suggested-file coverage: **omitted signature**. Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

<a id="secondary-cubic-lattice-coefficient"></a>

#### Secondary coefficients for cubic lattices

**ID:** `ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient`. **Kind:** theorem. **Proposed name:** `FieldStatistics.secondary_cubic_lattice_coefficient`.

For a full lattice L⊆V_Z of index T=T₁T₂ containing mV_Z, with leading-coefficient image T₁Z and fibre index T₂, and m⁴≤X, the cubic orbit count of sign i is c₁⁽ⁱ⁾X/T+c₂⁽ⁱ⁾X^{5/6}/(T₁^{1/3}T₂)+O(mX^{3/4}/T). A translate uses the corresponding Hurwitz-zeta residue average, rather than the same scalar secondary coefficient.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Import ST.2’s averaged fundamental domain, slicing and Mellin smoothing with its lattice-covolume normalization.
2. The sum of a^{-1/3} over the permitted leading coefficients has residues at s=2/3 and s=0; the residue at zero produces ζ(1/3).
3. Take smoothing parameter κ=X^{1/12}; the condition m⁴≤X absorbs the remaining error terms.

Direct prerequisites: `ArithmeticStatistics:ST.2`.

Sources: [bst](https://arxiv.org/pdf/1005.0672v3), §6, Theorem27 and Remark3, pp.19–20.

Acceptance:

- For the full lattice, T₁=T₂=m=1, recover c₁X+c₂X^(5/6)+O(X^(3/4)).

Suggested-file coverage: **omitted signature**. Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

<a id="cubic-secondary-local-factor-evaluation"></a>

#### Secondary local factors for maximal cubic orders

**ID:** `ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation`. **Kind:** theorem. **Proposed name:** `FieldStatistics.cubic_secondary_local_factor_evaluation`.

For every prime p the secondary density of maximal cubic forms is μ₂(p)=(1−p^{-2})(1−p^{-5/3}); for maximal forms which are not totally ramified it is μ₂′(p)=(1−p^{-2})(1−(p^{1/3}+1)/(p(p+1))). The five splitting-type factors are obtained by disjoint projective-root lattices and removal of the zero reduction, with maximality imposed modulo p².

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the secondary lattice coefficient on the root lattices, separating those with a root at infinity from the others.
2. For a repeated root at infinity remove the p²-divisibility sublattice with secondary ratio p^{-1/3}; at another root the ratio is p^{-1}.
3. Sum the five disjoint splitting types and remove the totally ramified type for μ₂′.

Direct prerequisites: [ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient](#secondary-cubic-lattice-coefficient); `ArithmeticStatistics:ST.3/splitting-symbol-and-local-sets-of-binary-cubic-forms`; `ArithmeticStatistics:ST.3/densities-of-splitting-types-of-maximal-forms`.

Sources: [bst](https://arxiv.org/pdf/1005.0672v3), §7, Table1 and formulas(56)–(57), pp.20–22.

Acceptance:

- For every prime p the secondary density of maximal cubic forms is μ₂(p)=(1−p^{-2})(1−p^{-5/3}); for maximal forms which are not totally ramified it is μ₂′(p)=(1−p^{-2})(1−(p^{1/3}+1)/(p(p+1))). The five splitting-type factors are obtained by disjoint projective-root lattices and removal of the zero reduction, with maximality imposed modulo p².

Suggested-file coverage: **omitted signature**. Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

<a id="cubic-root-weighted-sieve-identity"></a>

#### Root-weighted cubic sieve identities

**ID:** `ArithmeticStatistics:ST.3/cubic-root-weighted-sieve-identity`. **Kind:** theorem. **Proposed name:** `FieldStatistics.cubic_root_weighted_sieve_identity`.

For W_p the nonmaximal locus and V_{p,α} the forms with root α mod p, N(W_p;X)=Σ_{α∈P¹(F_p)}N(V_{p,α};X/p²)−Σ_αN(V_{p,α};X/p⁴)+N(V_Z;X/p⁴). The CRT gives the corresponding identity for squarefree n; the zero reduction has p+1 roots and must retain that multiplicity.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the p-adic maximality criterion to rescale a repeated-root form, tracking the new discriminant and the extra root.
2. Apply inclusion-exclusion to the forms divisible by p.
3. Iterate the identity at distinct primes by CRT; group the terms by their root weights.

Direct prerequisites: `ArithmeticStatistics:ST.1/davenport-heilbronn-maximality-criterion`; `ArithmeticStatistics:ST.2/binary-cubic-counts-with-congruence-conditions`.

Sources: [bst](https://arxiv.org/pdf/1005.0672v3), §9.1, Proposition33 and (70)–(71), pp.27–29.

Acceptance:

- The zero binary cubic has p+1 projective roots, so its contribution cannot be silently treated as one root.

Suggested-file coverage: **omitted signature**. Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

<a id="refined-cubic-sieve"></a>

#### The refined cubic sieve

**ID:** `ArithmeticStatistics:ST.3/refined-cubic-sieve`. **Kind:** theorem. **Proposed name:** `FieldStatistics.refined_cubic_sieve`.

For squarefree n let E_n(X)=N(W_n;X)−γ₁(n)c₁X−γ₂(n)c₂X^{5/6}, where γ_j(n)=∏_{p|n}(1−μ_j(p)). For δ₁,δ₂>0 the sums of |E_n| over n≤X^{1/6−δ₁}, n≥X^{1/6+δ₂}, and the intermediate range are respectively O_ε(X^{5/6−δ₁/2+ε}), O_ε(X^{5/6−δ₂+ε}+X^{13/18−2δ₂/3+ε}), and O_ε(X^{29/36+δ₁/6+ε}+X^{2/3+4δ₂+ε}). The choices δ₁=1/24,δ₂=1/30 yield O_ε(X^{5/6−1/48+ε}).

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Apply the root-weighted sieve identity and the lattice estimate to small n.
2. Use the uniform total-ramification and nonmaximality bounds in the large range.
3. For the middle range use the finite Fourier transform of the root-count weight: its zero coefficient is 1+p^{-1}, and each nonzero coefficient is O(p^{-1}); average over the regular sliced fundamental domain.
4. Use Möbius inversion and the absolutely convergent Euler products to recover the two field-counting terms.

Direct prerequisites: [ArithmeticStatistics:ST.3/cubic-root-weighted-sieve-identity](#cubic-root-weighted-sieve-identity); [ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient](#secondary-cubic-lattice-coefficient); [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation); [ArithmeticStatistics:ST.3/cubic-large-total-ramification-bound](#cubic-large-total-ramification-bound); `ArithmeticStatistics:ST.2`.

Sources: [bst](https://arxiv.org/pdf/1005.0672v3), §9.2–9.6, Lemmas34–36, (75), (85), (91)–(94), pp.29–35.

Acceptance:

- δ₁=1/24 and δ₂=1/30 make all three errors smaller than X^(5/6), with an overall saving1/48.

Suggested-file coverage: **omitted signature**. Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

<a id="cubic-secondary-orbit-integral"></a>

#### The secondary density of a cubic p-adic order

**ID:** `ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral`. **Kind:** theorem. **Proposed name:** `FieldStatistics.cubic_secondary_orbit_integral`.

For an étale cubic Z_p-order R, the secondary orbit density equals (1−p^{-2})(1−p^{-1/3})/(Disc_p(R)|Aut R|) times ∫_{(R/Z_p)^Prim} index(R:Z_p[x])^{2/3} dx. Primitive means x has nonzero reduction in (R/Z_p)/p, and the Haar measure on that primitive set is normalized to one. Infinite index points form a null set; convergence near roots of the associated cubic is part of the assertion.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Identify primitive quotient elements with primitive binary vectors and their index with |f(v)|_p^{-1}.
2. Truncate the integral away from the zero locus and use the orbit Jacobian to calculate each congruence approximation.
3. Prove integrability of |f(v)|_p^{-2/3} near each simple root and pass to the limit by dominated convergence. Treat distinct roots with separate neighborhoods; do not use a uniform bound on singular congruence roots.

Direct prerequisites: `ArithmeticStatistics:ST.3/p-adic-density-of-a-local-specification`; [ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient](#secondary-cubic-lattice-coefficient).

Sources: [bst](https://arxiv.org/pdf/1005.0672v3), §9.7, Lemma37, pp.35–36.

Acceptance:

- For an étale cubic Z_p-order R, the secondary orbit density equals (1−p^{-2})(1−p^{-1/3})/(Disc_p(R)|Aut R|) times ∫_{(R/Z_p)^Prim} index(R:Z_p[x])^{2/3} dx. Primitive means x has nonzero reduction in (R/Z_p)/p, and the Haar measure on that primitive set is normalized to one. Infinite index points form a null set; convergence near roots of the associated cubic is part of the assertion.

Suggested-file coverage: **omitted signature**. Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

Open proof/interface contracts: Native cubic secondary density interface.

### Low-degree fields and resolvent fibres

The orbit count must range over the adelic lattices supplied by S-integral parametrization; an arbitrary base ring of integers is not assumed principal. The cusp estimate, non-generic removal and maximality tail precede passage from finite to acceptable infinite local specifications. Local Jacobians turn orbit volumes into discriminant/automorphism masses. Resolvent fibres then give the class-group mean as one plus a local-mass ratio. Total quartic counts also include the linear D₄ family: the S₄ density alone does not count all quartic fields.

<a id="low-degree-s-integral-parametrization"></a>

#### Integral parametrization in each adelic lattice

**ID:** `ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization`. **Kind:** theorem. **Proposed name:** `FieldStatistics.low_degree_s_integral_parametrization`.

For a number field F, n∈{2,3,4,5} and finite S containing the infinite places and the places above 2 when n=2, separable degree-n extensions correspond to the disjoint union of Γ_β-orbits of S-maximal elements of L_β, over the finite double-coset set G_n(O^S)\G_n(A^S)/G_n(F). Here L_β=V_n(F)∩β^{-1}(∏_{v∉S}V_n(O_v)×∏_{v∈S}V_n(F_v)) and Γ_β is the analogous conjugated integral subgroup. The stabilizer is Aut_F(L), and Disc_S(L)=χ(β)²Δ_n(v).

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Import the cubic, quartic-resolvent and quintic orbit parametrizations from ST.1, including maximal-order stabilizers.
2. Patch the local maximal elements using the finite adelic double-coset decomposition.
3. Maximal local orders force a rational conjugating element to be integral in the same adelic lattice; the determinant character identifies the discriminant and Steinitz class.

Direct prerequisites: `ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings`; `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quartic-rings`; `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quintic-rings`; `AdelicAlgebraicGroups:AA.0`.

Sources: [bsw-global](https://arxiv.org/pdf/1512.03035v2), §3, Theorems3.1–3.4, pp.9–11.

Acceptance:

- For a number field F, n∈{2,3,4,5} and finite S containing the infinite places and the places above 2 when n=2, separable degree-n extensions correspond to the disjoint union of Γ_β-orbits of S-maximal elements of L_β, over the finite double-coset set G_n(O^S)\G_n(A^S)/G_n(F). Here L_β=V_n(F)∩β^{-1}(∏_{v∉S}V_n(O_v)×∏_{v∈S}V_n(F_v)) and Γ_β is the analogous conjugated integral subgroup. The stabilizer is Aut_F(L), and Disc_S(L)=χ(β)²Δ_n(v).

Suggested-file coverage: **omitted signature**. Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

<a id="low-degree-maximal-sieve"></a>

#### The low-degree maximal-order sieve over a number field

**ID:** `ArithmeticStatistics:ST.3/low-degree-maximal-sieve`. **Kind:** theorem. **Proposed name:** `FieldStatistics.low_degree_maximal_sieve`.

For n∈{2,3,4,5} and a fixed number field F and S-integral orbit family, let W_𝔭 mean nonmaximality or ramification beyond one quadratic ramified factor. Then Σ_{N𝔭>M}N(W_𝔭;X)=O_F(X/(M log M))+o_F(X), uniformly in M>1. Finite local specifications consequently extend to acceptable infinite specifications by this tail bound.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Import the ST.2 cusp bounds and semialgebraic lattice estimate for each adelic lattice.
2. The extra-ramification locus has codimension at least two; the geometric sieve bounds its contribution.
3. For weak nonmaximality use a local change of variables reducing the discriminant by N𝔭², then patch to one of finitely many adelic lattices. Fibres have cardinal at most ten.
4. Apply finite-place inclusion-exclusion before taking M to infinity.

Direct prerequisites: [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](#low-degree-s-integral-parametrization); `ArithmeticStatistics:ST.2`.

Sources: [bsw-global](https://arxiv.org/pdf/1512.03035v2), §5, Theorems5.1–5.3 and (29), pp.18–20.

Acceptance:

- For n∈{2,3,4,5} and a fixed number field F and S-integral orbit family, let W_𝔭 mean nonmaximality or ramification beyond one quadratic ramified factor. Then Σ_{N𝔭>M}N(W_𝔭;X)=O_F(X/(M log M))+o_F(X), uniformly in M>1. Finite local specifications consequently extend to acceptable infinite specifications by this tail bound.

Suggested-file coverage: **omitted signature**. Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

<a id="low-degree-jacobian-mass"></a>

#### Orbit volumes and local masses in degree at most five

**ID:** `ArithmeticStatistics:ST.3/low-degree-jacobian-mass`. **Kind:** theorem. **Proposed name:** `FieldStatistics.low_degree_jacobian_mass`.

For the BSW degree-n representation with n∈{2,3,4,5}, the orbit map has pullback π_v^*ω_V=JΔ_n(v)χ²ω_G, with J=2 for n=2 and J=±1 for n≥3. Thus each maximal local orbit contributes |J|_v/(Disc_v(R)|Aut R|) times Vol(G_n(O_v)); the product of |J|_v is one. The final weighted field constant is κ_F/2 times the product of finite masses (1−q_v^{-1})Σ_R(Disc_v(R)|Aut R|)^{-1} and infinite masses Σ_R|Aut R|^{-1}.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Evaluate the Jacobian on the split étale orbit, using its n! stabilizer and its reduction modulo every prime.
2. Use change of variables on each local orbit, including the stabilizer divisor.
3. Sum over the adelic double cosets; the Tamagawa number of G_n is one, and integration over the positive determinant character gives the factor 1/2.
4. Restore the places in S and cancel J by the product formula.

Direct prerequisites: [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](#low-degree-s-integral-parametrization); [ArithmeticStatistics:ST.3/low-degree-maximal-sieve](#low-degree-maximal-sieve); `AdelicAlgebraicGroups:AA.2`.

Sources: [bsw-global](https://arxiv.org/pdf/1512.03035v2), §7, Propositions7.1–7.3 and §8, pp.21–25.

Acceptance:

- For the BSW degree-n representation with n∈{2,3,4,5}, the orbit map has pullback π_v^*ω_V=JΔ_n(v)χ²ω_G, with J=2 for n=2 and J=±1 for n≥3. Thus each maximal local orbit contributes |J|_v/(Disc_v(R)|Aut R|) times Vol(G_n(O_v)); the product of |J|_v is one. The final weighted field constant is κ_F/2 times the product of finite masses (1−q_v^{-1})Σ_R(Disc_v(R)|Aut R|)^{-1} and infinite masses Σ_R|Aut R|^{-1}.

Suggested-file coverage: **omitted signature**. Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

<a id="quartic-quintic-density-constants"></a>

#### Quartic and quintic discriminant density constants

**ID:** `ArithmeticStatistics:ST.3/quartic-quintic-density-constants`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quartic_quintic_density_constants`.

For S₄ fields over Q of signature (r₁,r₂) with r₁+2r₂=4, the coefficient of X is [2r₁!2^{r₂}r₂!]^{-1}∏_p(1+p^{-2}−p^{-3}−p^{-4}); for S₅ it is the same archimedean prefactor with r₁+2r₂=5 and product ∏_p(1+p^{-2}−p^{-4}−p^{-5}). These are unweighted isomorphism-class counts because these fields have trivial Q-automorphism groups.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Evaluate the finite étale local mass using partitions of n−k into k parts.
2. Evaluate the real automorphism group as S_{r₁}×(C₂≀S_{r₂}).
3. Apply the low-degree mass theorem and remove non-S_n fields using the nongeneric orbit estimate.

Direct prerequisites: [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](#low-degree-jacobian-mass).

Sources: [bsw-global](https://arxiv.org/pdf/1512.03035v2), §2.2, (9)–(11), pp.7–8; Theorem1, pp.1–2.

Acceptance:

- Quartic archimedean prefactors are1/48,1/8,1/16; quintic prefactors are1/240,1/24,1/16.

Suggested-file coverage: **omitted signature**. Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

<a id="quartic-class-group-two-torsion-fibre"></a>

#### Two-torsion and quartic resolvent fibres

**ID:** `ArithmeticStatistics:ST.3/quartic-class-group-two-torsion-fibre`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quartic_class_group_two_torsion_fibre`.

For a non-Galois cubic extension L/F, the nonidentity ordinary class-group two-torsion corresponds to quadratic extensions L₂/L unramified at all places whose normal closure over F has group S₄. Via the quartic resolvent this counts nowhere overramified quartic fields with resolvent L and Disc(L₄/F)=Disc(L/F). For Cl⁺ replace the condition at real places by unramified at finite places only.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the Hilbert or narrow Hilbert class field to identify characters to C₂.
2. Use the S₄ resolvent correspondence, tracking the normal closure and every real place.
3. The local discriminant equality is equivalent to the stated ramification restriction; the trivial character is excluded.

Direct prerequisites: `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quartic-rings`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Sources: [bsw-global](https://arxiv.org/pdf/1512.03035v2), §10.1, proof of Theorem6(b), pp.29–30.

Acceptance:

- For a non-Galois cubic extension L/F, the nonidentity ordinary class-group two-torsion corresponds to quadratic extensions L₂/L unramified at all places whose normal closure over F has group S₄. Via the quartic resolvent this counts nowhere overramified quartic fields with resolvent L and Disc(L₄/F)=Disc(L/F). For Cl⁺ replace the condition at real places by unramified at finite places only.

Suggested-file coverage: **omitted signature**. Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

<a id="low-degree-class-group-mass-ratios"></a>

#### Class-group means from resolvent local mass ratios

**ID:** `ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios`. **Kind:** theorem. **Proposed name:** `FieldStatistics.low_degree_class_group_mass_ratios`.

For an acceptable family over a number field F with fixed pure infinite specifications, let α₂ be the number of real base places with quadratic algebra R², and α₃ those with cubic algebra R³. Then the mean quadratic h₃ is 1+3^{-r₂(F)−α₂}; the mean ordinary cubic h₂ is 1+2^{-r₁(F)−2r₂(F)−α₃}; the mean narrow cubic h₂ is 1+2^{-r₁(F)−2r₂(F)+α₃}. At every finite place the corresponding numerator/denominator mass ratio is one.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Apply the cyclic cubic and quartic-resolvent fibre identities.
2. Use the low-degree mass theorem for numerator and denominator with compatible finite specifications.
3. At complex places the quartic/cubic ratio is 1/4; at a real R×C place it is 1/2; at R³ it is 1/4 in the ordinary case and 1 in the narrow case. Account for the quadratic automorphism weight 1/2 separately.

Direct prerequisites: [ArithmeticStatistics:ST.3/quartic-class-group-two-torsion-fibre](#quartic-class-group-two-torsion-fibre); [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](#low-degree-jacobian-mass); `ArithmeticStatistics:ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields`.

Sources: [bsw-global](https://arxiv.org/pdf/1512.03035v2), Theorem6 and §10.1, (43)–(44), pp.4 and28–30.

Acceptance:

- Over Q: real/imaginary quadratic h₃ means4/3 and2; totally real/complex cubic ordinary h₂ means5/4 and3/2, and narrow means2 and3/2.

Suggested-file coverage: **omitted signature**. Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

<a id="all-fields-degree-at-most-five"></a>

#### All fields in degrees at most five

**ID:** `ArithmeticStatistics:ST.3/all-fields-degree-at-most-five`. **Kind:** theorem. **Proposed name:** `FieldStatistics.all_fields_degree_at_most_five`.

For every fixed n∈{2,3,4,5} the total degree-n Q-field count is asymptotic to c_nX with c_n>0. For degree4 the D₄ contribution is linear and must be included alongside the imported S₄ constant; C₄ and V₄ contributions are smaller. For degree5 the nonsymmetric transitive groups are lower order. Thus summing S₄/S₅ asymptotics alone is not a proof of the all-field statement.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the imported quadratic/cubic counts and their cyclic remainder bounds.
2. For degree4 add the Cohen–Diaz y Diaz–Olivier D₄ constant with its tower normalization, then bound the abelian groups.
3. For degree5 enumerate its transitive groups, retain the S₅ asymptotic and import bounds showing every proper group contributes o(X).

Direct prerequisites: `ArithmeticStatistics:ST.3/count-of-quadratic-fields`; `ArithmeticStatistics:ST.3/davenport-heilbronn-count-of-cubic-fields`; `ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields`; `ArithmeticStatistics:ST.3/bhargava-count-of-quintic-fields`; [ArithmeticStatistics:ST.3/cyclic-prime-field-count](#cyclic-prime-field-count); [ArithmeticStatistics:ST.3/quadratic-tower-counting-constants](#quadratic-tower-counting-constants).

Sources: [bhargava-fields](https://arxiv.org/pdf/2111.06507v3), §7,p.24; quartic/quintic density sources and their nonsymmetric remainders.

Acceptance:

- For n=4 include the linear D₄ contribution alongside S₄; an S₄-only constant fails the total-field test.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

Open proof/interface contracts: Abelian and classical counting originals.

### Relative torsion and quadratic towers

Norm followed by class extension is the degree power. Inverting that degree on ℓ-torsion splits off the base class group; quadratic steps therefore split three-torsion. Uniform cubic-order counts and the five discriminant regimes supply the tail bound needed before interchanging a tower sum and a limit. The relative small-prime argument includes the reviewed unit repair: pigeonhole generator norms modulo powers of base units, rescale, and use ratios of relative element norm one. Rigid fields retain both their embedding into the fixed closure and the numbering of embeddings; a normalizer acts on the latter. The tower constants consequently retain the signature weight 2^(−r₂(F)).

<a id="rigid-embedded-field-family"></a>

#### Permutation-identified embedded fields

**ID:** `ArithmeticStatistics:ST.3/rigid-embedded-field-family`. **Kind:** definition. **Proposed name:** `FieldStatistics.RigidField`.

Fix a number field k, its algebraic closure, n≥1 and a transitive subgroup G≤S_n. A rigid G-field consists of a finite degree-n intermediate field K/k in that algebraic closure and a bijection e:Hom_k(K,kbar)→Fin n for which the transported Galois-action image is exactly G. Count these pairs by absolute discriminant. The underlying fields are embedded fields; conjugate fields and different labelings are retained. Aut_perm(G) is the normalizer N_{S_n}(G), not the abstract automorphism group of G. Group-signature restrictions use conjugacy classes of complex conjugation at the real base places.

Hypotheses: k is a number field; n≥1; G≤S_n is transitive; all fields use the fixed algebraic closure.

Proof or construction:

1. Use the parent embedding-action predicate, keeping its numbering rather than existentially discarding it.
2. Prove the labels over a fixed admissible embedded field form a normalizer torsor.
3. Use Hermite finiteness for the underlying fields and finiteness of labels to obtain the height count.

Direct prerequisites: `ArithmeticStatistics:ST.3/number-field-counting-function`; `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`; `mathlib:NumberField.discr`; `mathlib:NumberField.finite_of_discr_bdd`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), §1 notation, p.2; Definition6.7 and Lemma6.8, pp.33–34.

Uses: LOWW Lemmas6.8–6.9 and Theorem6.1 — Makes the factor2^d in each tower fibre and the normalizer quotient meaningful.; LOWW Theorem8.1 — Keeps the same convention when the quotient group H is not a2-group..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.RigidField` | The embedded degree-n field and its compatible numbering of embeddings. |
| `FieldStatistics.RigidField.field` | Forget the numbering to an actual intermediate field of kbar/k. |
| `FieldStatistics.RigidField.relabel` | The normalizer of G acts on labels by postcomposition; identity and composition laws hold. |
| `FieldStatistics.rigidFieldCount` | Cardinality of the absolute-discriminant-bounded rigid pairs, with isomorphism-invariant local conditions supplied by a selection predicate. |
| `FieldStatistics.rigidFieldCount_eq_normalizer_mul_embedded` | The rigid count is \|N_{S_n}(G)\| times the embedded-field count. |
| `FieldStatistics.rigidFieldCount_eq_weightedIso` | It is the sum over field isomorphism classes of \|N_{S_n}(G)\| n/\|Aut_k K\|. |
| `FieldStatistics.rigidFieldCount_mono` | Increasing the discriminant bound or enlarging the local condition increases the count. |

Unit tests:

- `FieldStatistics.rigidField_degree_one` (degenerate): For n=1,G=1 the only field is k; the count is1 above its absolute discriminant and0 below.
- `FieldStatistics.rigidField_quadratic` (computation): Each quadratic field contributes two rigid pairs: it has one embedded copy and two compatible labels.
- `FieldStatistics.rigidField_s3` (non-example): A non-Galois S₃ cubic isomorphism class contributes18 rigid pairs: three embedded copies, each with six labels. Counting only abstract automorphisms would give a wrong multiplicity.
- `FieldStatistics.rigidField_below_discriminant` (boundary): A singleton field with absolute discriminant D contributes zero for X<D and its full label multiplicity at X=D.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="relative-torsion-splitting"></a>

#### Prime-to-degree relative torsion splitting

**ID:** `ArithmeticStatistics:ST.3/relative-torsion-splitting`. **Kind:** theorem. **Proposed name:** `FieldStatistics.relative_torsion_splitting`.

For a finite extension L/K of number fields and a prime ℓ not dividing d=[L:K], the norm and extension maps split Cl_L[ℓ] as Cl_{L/K}[ℓ]×Cl_K[ℓ]. Hence h_ℓ(L)=h_ℓ(L/K)h_ℓ(K). In a tower of quadratic extensions h₃ therefore factors over all steps. Cl_{L/K} is the kernel of the native relative class-group norm, not a second class-group carrier.

Hypotheses: L/K is finite; ℓ is prime and ℓ∤[L:K].

Proof or construction:

1. Use norm∘extension=power d on the native class group.
2. Invert d on its ℓ-torsion by Bézout and construct a section of norm.
3. Split the finite abelian group by kernel and section, and take cardinalities.

Direct prerequisites: `ArithmeticStatistics:ST.3/torsion-count-of-class-groups`; `mathlib:ClassGroup.extendedHom`; `tauceti:ClassGroup.relNorm`; `tauceti:ClassGroup.relNorm_comp_extendedHom`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), §2, beginning, p.6.

Acceptance:

- For a quadratic tower step and ℓ=3, degree2 is invertible on torsion. The assertion deliberately excludes ℓ=2.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="uniform-small-degree-field-bound"></a>

#### Uniform small-degree extensions at fixed discriminant

**ID:** `ArithmeticStatistics:ST.3/uniform-small-degree-field-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.uniform_small_degree_field_bound`.

For a number field F and n≥1, the number of embedded extensions L/F of degree2 or3 with relative discriminant norm n is O_{[F:Q],ε}(n^{1/2+ε}h₂(F)D_F^{1/2+ε}). Consequently their cumulative count is O_{[F:Q],ε}(X^{3/2+ε}h₂(F)D_F^{1/2+ε}). Quadratic extensions alone satisfy N_F(C₂,X)≪_{[F:Q],ε}h₂(F)D_F^εX.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Count quadratic idèle characters with fixed local conductor, including the n^ε number of local choices.
2. Count cyclic cubic extensions of a quadratic resolvent by the relative class-group bound.
3. For the sharper quadratic cumulative bound count ideals through smoothed Perron and the Dedekind-zeta convexity bound.

Direct prerequisites: [ArithmeticStatistics:ST.3/rigid-embedded-field-family](#rigid-embedded-field-family); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`; `AnalyticNumberTheory:AN.4`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), §3, Lemma3.5, p.12; §5, Lemma5.8, p.25.

Acceptance:

- For a number field F and n≥1, the number of embedded extensions L/F of degree2 or3 with relative discriminant norm n is O_{[F:Q],ε}(n^{1/2+ε}h₂(F)D_F^{1/2+ε}). Consequently their cumulative count is O_{[F:Q],ε}(X^{3/2+ε}h₂(F)D_F^{1/2+ε}). Quadratic extensions alone satisfy N_F(C₂,X)≪_{[F:Q],ε}h₂(F)D_F^εX.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="shintani-cubic-order-uniform-bound"></a>

#### Uniform counting of cubic orders over a number field

**ID:** `ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.shintani_cubic_order_uniform_bound`.

Let κ_F=Res_{s=1}ζ_F and h=h₂(F). Cubic O_F-orders with nonzero discriminant norm≤X satisfy N_{O_F,3}(X)≪_{[F:Q],ε}κ_F X+X^{-1/2−ε}hD_F^{9/2+ε}. In particular N_{O_F,3}(X)≪_{[F:Q],ε}D_F^εX once X≥D_F³h^{2/3}. The F=Q case uses the separate cubic lattice count; the assertion ξ_F(0)=0 used in the contour shift requires [F:Q]≥2.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the Shintani order series with isomorphism weights |Aut R|^{-1}; unweighted counts differ by a bounded factor in degree3.
2. Apply smoothed Perron, moving past the poles1 and5/6 to Re(s)=−1/2−ε.
3. Use the functional equation and the absolute-convergence bound for its dual to control the remainder.
4. For F=Q apply the parent congruence orbit count.

Direct prerequisites: [ArithmeticStatistics:ST.3/rigid-embedded-field-family](#rigid-embedded-field-family); `ArithmeticStatistics:ST.2`; `AnalyticNumberTheory:AN.8`; `AnalyticNumberTheory:AN.4`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), §3.1, Proposition3.6 and Lemmas3.7–3.10, pp.12–16.

Acceptance:

- Let κ_F=Res_{s=1}ζ_F and h=h₂(F). Cubic O_F-orders with nonzero discriminant norm≤X satisfy N_{O_F,3}(X)≪_{[F:Q],ε}κ_F X+X^{-1/2−ε}hD_F^{9/2+ε}. In particular N_{O_F,3}(X)≪_{[F:Q],ε}D_F^εX once X≥D_F³h^{2/3}. The F=Q case uses the separate cubic lattice count; the assertion ξ_F(0)=0 used in the contour shift requires [F:Q]≥2.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="relative-three-torsion-propagation"></a>

#### Propagation from cubic orders to relative three-torsion

**ID:** `ArithmeticStatistics:ST.3/relative-three-torsion-propagation`. **Kind:** theorem. **Proposed name:** `FieldStatistics.relative_three_torsion_propagation`.

For every number field F, both Σ_{[K:F]=2,Disc(K/F)≤X}h₃(K/F) and N_F(S₃,X) are ≪_{[F:Q],ε}D_F^{1/2+ε}κ_F^{-2}X^{1/2}(D_Fh₂(F)^{1/3}+X^{1/2}). This follows from an order-series lower bound over each quadratic resolvent, with weight |Aut R|^{-1}, and ideal-count lower bounds beyond T≥C D_F^{1/2+δ}κ_F^{-1}. For the S₃ count the conductor sum includes wild nonsquarefree conductors.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the corrected mass-weighted cubic-order identity over a quadratic resolvent.
2. Attach sufficiently many ideals in the required class to each character and obtain an order-count lower bound.
3. Insert the uniform order-count upper bound and optimize the auxiliary discriminant.
4. Sum conductor contributions using the full local conductor parametrization.

Direct prerequisites: [ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound](#shintani-cubic-order-uniform-bound); [ArithmeticStatistics:ST.3/relative-torsion-splitting](#relative-torsion-splitting); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `AnalyticNumberTheory:AN.4`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), §3.2, Lemmas3.13–3.14 and Proposition3.15, pp.18–20; Proposition3.12, pp.17–18.

Acceptance:

- For every number field F, both Σ_{[K:F]=2,Disc(K/F)≤X}h₃(K/F) and N_F(S₃,X) are ≪_{[F:Q],ε}D_F^{1/2+ε}κ_F^{-2}X^{1/2}(D_Fh₂(F)^{1/3}+X^{1/2}). This follows from an order-series lower bound over each quadratic resolvent, with weight |Aut R|^{-1}, and ideal-count lower bounds beyond T≥C D_F^{1/2+δ}κ_F^{-1}. For the S₃ count the conductor sum includes wild nonsquarefree conductors.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

Open proof/interface contracts: Cubic order identity over a fixed resolvent.

<a id="relative-three-torsion-piecewise-bound"></a>

#### The five-range relative three-torsion estimate

**ID:** `ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.relative_three_torsion_piecewise_bound`.

Put D=D_F and h=h₂(F). The sum of h₃(K/F) over quadratic K/F with relative discriminant norm≤X, and also N_F(S₃,X), are bounded by D^ε times: hX^{3/2}D^{1/2} for X≤Dh^{-2/3}; h^{1/3}X^{1/2}D^{3/2} for Dh^{-2/3}≤X≤D²h^{2/3}; XD^{1/2} for D²h^{2/3}≤X≤D^{5/2}h^{2/3}; h^{2/3}D³ for D^{5/2}h^{2/3}≤X≤D³h^{2/3}; and X above D³h^{2/3}. Constants depend on [F:Q],ε and are ineffective. Thus both are ≪D^{1+ε}h^{2/3}X.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the fixed-discriminant estimate in the first range.
2. Use propagation, the relative trivial class-group bound, and the large-range order count in the remaining ranges.
3. Compare at the four boundary values and take the least valid bound in every range.

Direct prerequisites: [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](#uniform-small-degree-field-bound); [ArithmeticStatistics:ST.3/relative-three-torsion-propagation](#relative-three-torsion-propagation); [ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound](#shintani-cubic-order-uniform-bound); `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Theorem3.1, Corollary3.2 and Remark3.3, pp.10–12.

Acceptance:

- Put D=D_F and h=h₂(F). The sum of h₃(K/F) over quadratic K/F with relative discriminant norm≤X, and also N_F(S₃,X), are bounded by D^ε times: hX^{3/2}D^{1/2} for X≤Dh^{-2/3}; h^{1/3}X^{1/2}D^{3/2} for Dh^{-2/3}≤X≤D²h^{2/3}; XD^{1/2} for D²h^{2/3}≤X≤D^{5/2}h^{2/3}; h^{2/3}D³ for D^{5/2}h^{2/3}≤X≤D³h^{2/3}; and X above D³h^{2/3}. Constants depend on [F:Q],ε and are ineffective. Thus both are ≪D^{1+ε}h^{2/3}X.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="quadratic-tower-torsion-tail"></a>

#### Three-torsion tails in quadratic towers

**ID:** `ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quadratic_tower_torsion_tail`.

For each m≥2 there are δ_m>0 and α_m, depending only on m and [k:Q], such that the sum of h₃(F_m/k) over quadratic towers F_m/F_{m−1}/…/k with D_{F_{m−1}}≥Y and X/2≤D_{F_m}≤X is O_{m,[k:Q],ε}(D_k^{α_m}(X/Y^{1−ε}+X^{1−δ_m})). This counts towers, so it is an upper bound when intermediate fields are forgotten.

Hypotheses: m≥2; X,Y>0; ε>0; discriminants here are absolute discriminants.

Proof or construction:

1. In the base case split D_{F₁} at X^{1/3±δ₀}; the noncritical ranges use the five-range estimate and partial summation.
2. Before applying the relative small-prime lemma, pigeonhole generator norms in O_K^*/(O_K^*)^d, a set of size at most d^[K:Q]. Rescale generators in one class by base units; their ratios then have relative element norm1, so each archimedean block sum vanishes. This repairs the published unit-normalization step at bounded degree-dependent cost.
3. In the critical range use the relative small-split-prime torsion bound and two applications of the quadratic zero-density estimate.
4. Treat each exceptional field set by its cardinal bound and the uniform class-group bounds.
5. Induct on m, splitting the preceding discriminant at X^b and choosing b and δ₀ so every exponent stays below1.

Direct prerequisites: [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](#relative-three-torsion-piecewise-bound); [ArithmeticStatistics:ST.3/relative-torsion-splitting](#relative-torsion-splitting); [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](#uniform-small-degree-field-bound); `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`; `AnalyticNumberTheory:AN.3`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), §5, Theorem5.1, Lemmas5.7–5.9 and induction, pp.22–29.

Acceptance:

- For each m≥2 there are δ_m>0 and α_m, depending only on m and [k:Q], such that the sum of h₃(F_m/k) over quadratic towers F_m/F_{m−1}/…/k with D_{F_{m−1}}≥Y and X/2≤D_{F_m}≤X is O_{m,[k:Q],ε}(D_k^{α_m}(X/Y^{1−ε}+X^{1−δ_m})). This counts towers, so it is an upper bound when intermediate fields are forgotten.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="wreath-transposition-fibre"></a>

#### Transpositions and quadratic wreath fibres

**ID:** `ArithmeticStatistics:ST.3/wreath-transposition-fibre`. **Kind:** theorem. **Proposed name:** `FieldStatistics.wreath_transposition_fibre`.

A transitive permutation2-group G≤S_{2d} contains a transposition exactly when G=C₂≀H, after conjugacy, for a unique transitive H≤S_d. Every such G-field K/k has a unique subfield F with [K:F]=2. Over a labeled H-field each quadratic K/F with a transposition has2^d compatible labelings. The permutation normalizers satisfy |Aut_perm(G)|=2^d|Aut_perm(H)|. For an arbitrary transitive H the same unique index-two subfield statement holds for G=C₂≀H.

Hypotheses: d≥1; G,H are permutation groups, not merely abstract groups.

Proof or construction:

1. The transpositions identify the2-element blocks; transitivity supplies all independent block flips.
2. Use the subgroup lattice above a point stabilizer to prove uniqueness of the index-two intermediate field.
3. Count the independent embedding labels in every block and calculate the kernel of the normalizer map.

Direct prerequisites: [ArithmeticStatistics:ST.3/rigid-embedded-field-family](#rigid-embedded-field-family).

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemmas6.6–6.8, pp.33–34; proof of Theorem6.1, p.37; Theorem8.1, pp.40–41.

Acceptance:

- A transitive permutation2-group G≤S_{2d} contains a transposition exactly when G=C₂≀H, after conjugacy, for a unique transitive H≤S_d. Every such G-field K/k has a unique subfield F with [K:F]=2. Over a labeled H-field each quadratic K/F with a transposition has2^d compatible labelings. The permutation normalizers satisfy |Aut_perm(G)|=2^d|Aut_perm(H)|. For an arbitrary transitive H the same unique index-two subfield statement holds for G=C₂≀H.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="thin-two-group-torsion"></a>

#### Thin two-group families and their torsion weights

**ID:** `ArithmeticStatistics:ST.3/thin-two-group-torsion`. **Kind:** theorem. **Proposed name:** `FieldStatistics.thin_two_group_torsion`.

For degree2^m extensions with2-group normal closure, the number at a fixed relative discriminant norm D is O_{m,[k:Q],ε}(D^εD_k^{α_m}). If the transitive group G has no transposition, its discriminant ideal is powerful, the cumulative count is O(X^{1/2+ε}D_k^α), and its total relative three-torsion is O(X^{1−δ}D_k^α) for some δ>0.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Before applying the relative small-prime lemma, pigeonhole generator norms in O_K^*/(O_K^*)^d, a set of size at most d^[K:Q]. Rescale generators in one class by base units; their ratios then have relative element norm1, so each archimedean block sum vanishes. This repairs the published unit-normalization step at bounded degree-dependent cost.
2. A finite p-group subgroup chain expresses the field as a tower of quadratic extensions.
3. Use the fixed-discriminant quadratic character estimate and the2-torsion bound in quadratic towers.
4. A nontrivial inertia group without a transposition has permutation index≥2; count powerful discriminants.
5. Combine the tower tail with the relative small-split-prime bound in the remaining short-base range.

Direct prerequisites: [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](#uniform-small-degree-field-bound); [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](#quadratic-tower-torsion-tail); `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`; `AnalyticNumberTheory:AN.3`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma6.3 and Theorems6.4–6.5, pp.31–33.

Acceptance:

- For degree2^m extensions with2-group normal closure, the number at a fixed relative discriminant norm D is O_{m,[k:Q],ε}(D^εD_k^{α_m}). If the transitive group G has no transposition, its discriminant ideal is powerful, the cumulative count is O(X^{1/2+ε}D_k^α), and its total relative three-torsion is O(X^{1−δ}D_k^α) for some δ>0.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="quadratic-tower-counting-constants"></a>

#### Counting constants for two-extensions

**ID:** `ArithmeticStatistics:ST.3/quadratic-tower-counting-constants`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quadratic_tower_counting_constants`.

Embedded degree2^m fields with2-group closure satisfy #E_k(m,X)~D_mX, where D_m=Σ_F κ_F/(2^{r₂(F)}ζ_F(2)D_F²)>0 over embedded degree2^{m−1} two-extensions. For rigid G=C₂≀H fields the constant is D_G=Σ_{F rigid H}2^{d−r₂(F)}κ_F/(ζ_F(2)D_F²), d=2^{m−1}. A fixed realized group signature has the corresponding positive constant with its infinite-place proportion. Convert to isomorphism counts using the rigid-family API.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Apply the number-field quadratic mass theorem to the finitely many bases with D_F≤Y.
2. Use the tower tail with weight1 and the thin-family estimate to control the omitted bases and smaller groups.
3. Use the wreath fibre multiplicity, then let X tend to infinity followed by Y.
4. For all two-groups divide rigid counts by normalizers; the ratio2^{-d} cancels the fibre multiplicity.

Direct prerequisites: [ArithmeticStatistics:ST.3/wreath-transposition-fibre](#wreath-transposition-fibre); [ArithmeticStatistics:ST.3/thin-two-group-torsion](#thin-two-group-torsion); [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](#quadratic-tower-torsion-tail); [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](#low-degree-jacobian-mass).

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Theorem6.2 and proof, pp.30–31; end of Theorem6.1 proof, p.37.

Acceptance:

- Embedded degree2^m fields with2-group closure satisfy #E_k(m,X)~D_mX, where D_m=Σ_F κ_F/(2^{r₂(F)}ζ_F(2)D_F²)>0 over embedded degree2^{m−1} two-extensions. For rigid G=C₂≀H fields the constant is D_G=Σ_{F rigid H}2^{d−r₂(F)}κ_F/(ζ_F(2)D_F²), d=2^{m−1}. A fixed realized group signature has the corresponding positive constant with its infinite-place proportion. Convert to isomorphism counts using the rigid-family API.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="two-extension-three-torsion-means"></a>

#### Three-torsion means for two-extensions

**ID:** `ArithmeticStatistics:ST.3/two-extension-three-torsion-means`. **Kind:** theorem. **Proposed name:** `FieldStatistics.two_extension_three_torsion_means`.

For embedded degree2^m two-extensions the mean h₃(K) tends to C_m=[Σ_F w_F h₃(F)(1+2^{r₁(F)}/3^{r₁(F)+r₂(F)})]/Σ_F w_F, where w_F=κ_F/(2^{r₂(F)}ζ_F(2)D_F²). For fixed G=C₂≀H the unrestricted mean uses the same weights over rigid H-fields. At a fixed realized group signature Σ it is (1+3^{-u(Σ)}) times [Σ_{F of signature Σbar}h₃(F)κ_F/(ζ_F(2)D_F²)]/[Σ_F κ_F/(ζ_F(2)D_F²)]. Every displayed sum converges and every denominator is positive.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Split h₃(K) by the relative torsion identity.
2. For a fixed base apply the quadratic local-mass mean and sum its infinite signatures.
3. Remove the thin smaller-group contribution and apply the tower tail for the remaining bases.
4. Take the two limits in order and divide by the positive field-counting constant.

Direct prerequisites: [ArithmeticStatistics:ST.3/relative-torsion-splitting](#relative-torsion-splitting); [ArithmeticStatistics:ST.3/quadratic-tower-counting-constants](#quadratic-tower-counting-constants); [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](#quadratic-tower-torsion-tail); [ArithmeticStatistics:ST.3/thin-two-group-torsion](#thin-two-group-torsion); [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios).

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Theorem6.1 and proof, pp.29–30 and35–37.

Acceptance:

- For embedded degree2^m two-extensions the mean h₃(K) tends to C_m=[Σ_F w_F h₃(F)(1+2^{r₁(F)}/3^{r₁(F)+r₂(F)})]/Σ_F w_F, where w_F=κ_F/(2^{r₂(F)}ζ_F(2)D_F²). For fixed G=C₂≀H the unrestricted mean uses the same weights over rigid H-fields. At a fixed realized group signature Σ it is (1+3^{-u(Σ)}) times [Σ_{F of signature Σbar}h₃(F)κ_F/(ζ_F(2)D_F²)]/[Σ_F κ_F/(ζ_F(2)D_F²)]. Every displayed sum converges and every denominator is positive.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

<a id="relative-wreath-three-torsion-mean"></a>

#### The relative wreath-product three-torsion mean

**ID:** `ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean`. **Kind:** theorem. **Proposed name:** `FieldStatistics.relative_wreath_three_torsion_mean`.

For a transitive2-group G=C₂≀H and a realized relative unit rank u, the discriminant-ordered mean of h₃(K/F_K) is1+3^{-u}. More generally this holds for arbitrary transitive H if its embedded count is O_{k,H,ε}(X^{2/3+ε}) for every ε>0. If instead Σ_{F of H-type,D_F≤X}h₃(F/k)=O_{k,H,ε}(X^{2/3+ε}), the ordinary h₃(K) mean exists with the convergent base-field weighted constant.

Hypotheses: The fixed-u family is nonempty; the general-H counting or weighted-counting hypothesis is quantified for every ε>0.

Proof or construction:

1. For2-groups use the tower tail and the thin-group torsion estimate.
2. For general H replace the tower tail by the five-range bound and the nontrivial2-torsion estimate of BSTTTZ.
3. At finitely many completely split base primes impose one inert block and all other split blocks; any such prime forces the full wreath group.
4. The local exclusion product tends to zero, so the smaller-group contribution is o(X). Apply the quadratic mean and cancel the denominator.

Direct prerequisites: [ArithmeticStatistics:ST.3/two-extension-three-torsion-means](#two-extension-three-torsion-means); [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](#relative-three-torsion-piecewise-bound); [ArithmeticStatistics:ST.3/wreath-transposition-fibre](#wreath-transposition-fibre); [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios); `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.

Sources: [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Theorem6.11, pp.37–38; Theorem8.1 and proof, pp.40–41.

Acceptance:

- For a transitive2-group G=C₂≀H and a realized relative unit rank u, the discriminant-ordered mean of h₃(K/F_K) is1+3^{-u}. More generally this holds for arbitrary transitive H if its embedded count is O_{k,H,ε}(X^{2/3+ε}) for every ε>0. If instead Σ_{F of H-type,D_F≤X}h₃(F/k)=O_{k,H,ε}(X^{2/3+ε}), the ordinary h₃(K) mean exists with the convergent base-field weighted constant.

Suggested-file coverage: **omitted signature**. Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

### Embedded quadratic types and nonabelian moments

The type is a subgroup of G≀C₂ with its specified swap, not an abstract group name. Goursat identifies it through a normal subgroup and an involution of the quotient. Diagonal Aut(G) orbits govern relabeling, and the outside-involution conjugacy classes distinguish good and bad types. The reduced multiplier and arithmetic lifting invariant are exact imports from InductionRestrictionPartII and InverseGaloisAndArithmeticFundamentalGroups. The refined conjecture evaluates the invariant at a generator, or retains it as a homomorphism. Elementary-two moments are proved divergent by their Euler products; the general logarithmic prediction remains a conjecture. The A₄ appendix has a finite module selector and unbiased finite-sample estimator, with its arithmetic kernel-to-field correspondence stated separately.

<a id="embedded-quadratic-wreath-type"></a>

#### Embedded quadratic wreath types

**ID:** `ArithmeticStatistics:ST.3/embedded-quadratic-wreath-type`. **Kind:** definition. **Proposed name:** `FieldStatistics.OutsideInvolutions`.

For a finite group G use the native regular wreath product W=G≀C₂=(C₂→G)⋊C₂. An embedded type is a subgroup F≤W. Write c(F) for its order-two elements outside the kernel of W→C₂. Admissibility means the canonical swap lies in F, the kernel projects onto G in one coordinate, and c(F) generates F. Goodness means c(F) is one F-conjugacy class. Types are equivalent under the diagonal action of Aut(G); abstract group isomorphism alone is insufficient. Aut_F(G) is the stabilizer of F under that diagonal action.

Hypotheses: All groups are finite; arithmetic fields have characteristic zero.

Proof or construction:

1. Use RegularWreathProduct with C₂=Multiplicative(ZMod2).
2. Define the outside-involution set and its generated subgroup using native subgroup closure.
3. Transport a subgroup by the diagonal automorphism and calculate its stabilizer.

Direct prerequisites: `mathlib:RegularWreathProduct`; `mathlib:RegularWreathProduct.rightHom`; `mathlib:RegularWreathProduct.inl`; `mathlib:RegularWreathProduct.congr`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), §1,p.378; §2.1–2.2,pp.383–387.

Uses: Wood Conjecture1.1 — Keeps the good/bad distinction and Aut_F(G) factor explicit.; Wood §8 catalogue — Makes completeness refer to embedded types modulo diagonal automorphisms..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.OutsideInvolutions` | Elements w∈F with w²=1 and nontrivial C₂ projection. |
| `FieldStatistics.IsAdmissibleType` | Swap membership, surjective coordinate projection of the kernel, and generation by outside involutions. |
| `FieldStatistics.IsGoodType` | Admissibility and conjugacy of any two outside involutions inside F. |
| `FieldStatistics.typeAutStabilizer` | The subgroup of MulAut G preserving F under the diagonal action. |
| `FieldStatistics.transportType` | Diagonal automorphisms transport F; identity/composition and admissibility/goodness laws hold. |
| `FieldStatistics.outsideClassCount` | The number of F-conjugacy classes in the outside-involution set. |
| `FieldStatistics.goodType_iff_classCount_one` | For admissible F, goodness is equivalent to outsideClassCount=1. |
| `FieldStatistics.typeAutStabilizer_abelian` | For an abelian G the inverse-graph type has full stabilizer MulAut G. |

Unit tests:

- `FieldStatistics.type_c2` (non-example): The inverse-graph type for G=C₂ is C₂²; its two outside involutions are distinct conjugacy classes, so it is admissible and bad.
- `FieldStatistics.type_c3` (computation): For G=C₃ its inverse-graph type is S₃, with one outside class of size3 and stabilizer of order2.
- `FieldStatistics.type_trivial` (degenerate): For G=1 the sole admissible type is C₂, good with one outside involution.
- `FieldStatistics.type_missing_swap` (boundary): The base subgroup G×G is never admissible because it has trivial C₂ projection.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="nonabelian-quadratic-moment-interface"></a>

#### Nonabelian quadratic-field moments and predictions

**ID:** `ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface`. **Kind:** definition. **Proposed name:** `FieldStatistics.rigidQuadraticMoment`.

Fix a separable closure of Q and its infinite inertia. For each quadratic K let Γ_K be the Galois group of the maximal extension unramified at every finite prime and split at infinity. Imaginary rigid objects are continuous surjections Γ_K↠G whose induced normal-closure embedding in G≀C₂ has type F; real rigid objects also retain an outside involution (a twist). Divide their discriminant-bounded totals by the number of quadratic fields of the selected sign. Unrigid counts forget the isomorphism to G. For a good F they differ by |Aut_F(G)| in the imaginary case and |c(F)||Aut_F(G)| in the real case. Wood’s good-type prediction is rigid mean |H₂(F,c)[2]|; bad-type prediction is divergence, and inadmissible types have zero counts. These predictions are named propositions, not asserted arithmetic theorems. The refined good-type prediction restricts to tame quadratic fields and gives mean1 for each lifting-invariant value, evaluated at a generator of μ_L for L=Q(μ_{4|F̃_c|}), or equivalently for each Hom-valued invariant μ_L→H₂(F,c)[2]. Changing generators permutes the strata by a power automorphism. An arbitrary root of unity, in particular1, cannot index these strata.

Hypotheses: All groups are finite; arithmetic fields have characteristic zero.

Proof or construction:

1. Use the Galois correspondence and unramified-at-all-places predicate of ClassFieldTheory.
2. An imaginary infinite inertia generator gives the wreath embedding; in the real case retain the chosen involution.
3. Count the fibres of rigidification; conjugacy of twists proves the good real factor.
4. State conjectural limits as predicates and retain the reduced-multiplier correction.
5. Import the accepted reduced multiplier and chosen reduced cover from InductionRestrictionPartII RS.1, and the finite-place Hom-valued arithmetic invariant from InverseGaloisAndArithmeticFundamentalGroups IG.4; neither object is constructed again here.

Direct prerequisites: [ArithmeticStatistics:ST.3/embedded-quadratic-wreath-type](#embedded-quadratic-wreath-type); `ArithmeticStatistics:ST.3/count-of-quadratic-fields`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `InductionRestrictionPartII:RS.1/reduced-multiplier`; `InductionRestrictionPartII:RS.1/reduced-cover`; `InverseGaloisAndArithmeticFundamentalGroups:IG.4/global-arithmetic-invariant`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), §2.1,pp.383–386,Lemma2.1; Conjecture1.1,p.378; [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), Definition3.1,pp.388–389; Conjecture5.1,p.411, corrected generator form.

Uses: Elementary-two divergence — Distinguishes imaginary fixed-swap and real twisted surjection counts.; A₄ appendix — Supplies the factor24 for each eligible extension..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.rigidQuadraticMoment` | Discriminant-bounded average of continuous surjections, with real twists retained. |
| `FieldStatistics.unrigidQuadraticMoment` | The corresponding average of extension subfields with embedded type modulo diagonal Aut(G). |
| `FieldStatistics.rigidMoment_imaginary_eq` | For admissible F the imaginary rigid count is \|Aut_F(G)\| times the unrigid count. |
| `FieldStatistics.rigidMoment_real_good_eq` | For good F the real factor is \|c(F)\|\|Aut_F(G)\|. |
| `FieldStatistics.GoodTypeMomentPrediction` | The two rigid averages tend to \|H₂(F,c)[2]\|. |
| `FieldStatistics.BadTypeMomentPrediction` | Both averages tend to positive infinity. |
| `FieldStatistics.rigidMoment_inadmissible` | Inadmissible types have no arithmetic objects. |
| `FieldStatistics.RefinedGoodTypeMomentPrediction` | Each tame signed rigid invariant stratum has mean1, with generator evaluation or Hom-valued invariant. |
| `FieldStatistics.liftingInvariant_generator_change` | Replacing u by u^a with gcd(a,\|μ_L\|)=1 permutes the invariant values by h↦h^a. |

Unit tests:

- `FieldStatistics.moment_c3` (computation): For C₃,S₃ the unrigid imaginary/real means are1/2 and1/6, and rigid means are1 in both cases.
- `FieldStatistics.moment_c2_bad` (non-example): C₂,C₂² is bad; the good finite-limit formula does not apply.
- `FieldStatistics.moment_a4_correction` (computation): For the order96 A₄ type with reduced multiplier C₂, the predicted rigid mean is2, not1.
- `FieldStatistics.refined_generator_not_one` (non-example): For a type with H₂(F,c)[2]=C₂, evaluation at1 sees only the identity value, so it cannot give two strata each of mean1.

Suggested-file coverage: **omitted signature**. Needs the native maximal everywhere-unramified, infinity-split Galois group and continuous finite surjections from ClassFieldTheory, plus InductionRestrictionPartII RS.1 reduced covers and IG.4 Hom-valued arithmetic invariants. The exact moment definitions and tests are in the packet; no substitute carrier is introduced.

Exact omitted names: `FieldStatistics.rigidQuadraticMoment`, `FieldStatistics.unrigidQuadraticMoment`, `FieldStatistics.rigidMoment_imaginary_eq`, `FieldStatistics.rigidMoment_real_good_eq`, `FieldStatistics.GoodTypeMomentPrediction`, `FieldStatistics.BadTypeMomentPrediction`, `FieldStatistics.rigidMoment_inadmissible`, `FieldStatistics.RefinedGoodTypeMomentPrediction`, `FieldStatistics.liftingInvariant_generator_change`, `FieldStatistics.moment_c3`, `FieldStatistics.moment_c2_bad`, `FieldStatistics.moment_a4_correction`, `FieldStatistics.refined_generator_not_one`.

Open proof/interface contracts: Native reduced-multiplier and arithmetic-lift exports; Arithmetic nonabelian moment signatures.

<a id="nonabelian-admissibility-and-abelianization"></a>

#### Admissibility and the good-type abelianization

**ID:** `ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization`. **Kind:** theorem. **Proposed name:** `FieldStatistics.good_type_abelianization`.

Every arithmetic normal-closure type is admissible. For admissible good F its abelianization is C₂, so every cyclotomic intermediate field of an F-extension of Q is contained in its distinguished quadratic subfield. For abelian G the unique admissible type is the inverse-graph generalized dihedral group. For odd |G| this type is good and the reduced multiplier has trivial2-torsion. The last multiplier assertion is a requested homological input.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. All inertia/decomposition images are outside involutions or trivial; otherwise the quotient by their generated normal subgroup would be an everywhere unramified nontrivial Q-extension.
2. Conjugate generators have the same image in the abelianization. The swap generates it and the quotient to C₂ prevents collapse.
3. For abelian G use inertia generation to force the inverse graph; for odd order use Schur–Zassenhaus and the reduced multiplier computation.

Direct prerequisites: [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface); [ArithmeticStatistics:ST.3/embedded-quadratic-wreath-type](#embedded-quadratic-wreath-type); `mathlib:Abelianization`; `InductionRestrictionPartII:RS.4/involution-abelianization`; `InductionRestrictionPartII:RS.1/reduced-multiplier`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), Proposition2.2,pp.386–387; Lemma6.2,p.414; §1,p.379.

Acceptance:

- Every arithmetic normal-closure type is admissible. For admissible good F its abelianization is C₂, so every cyclotomic intermediate field of an F-extension of Q is contained in its distinguished quadratic subfield. For abelian G the unique admissible type is the inverse-graph generalized dihedral group. For odd |G| this type is good and the reduced multiplier has trivial2-torsion. The last multiplier assertion is a requested homological input.

Suggested-file coverage: **partial native signature**. Needs the named ClassFieldTheory, reduced-multiplier and arithmetic lifting suppliers. Finite wreath/group statements above are only their quadratic arithmetic adapters. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

Open proof/interface contracts: Native reduced-multiplier and arithmetic-lift exports.

<a id="embedded-type-catalogue"></a>

#### Finite enumeration of embedded types

**ID:** `ArithmeticStatistics:ST.3/embedded-type-catalogue`. **Kind:** construction. **Proposed name:** `FieldStatistics.quotientGraphType`.

Enumerate pairs (N,α), where N◁G and α is an involutive automorphism of G/N. Form H(N,α)={(a,b):α(aN)=bN} and F(N,α)=H(N,α)⋊swap. Its outside involutions are ((a,a⁻¹),swap) with α(aN)=a⁻¹N. Retain the pairs whose outside involutions generate a subgroup of cardinal2|G||N|. Quotient the resulting embedded subgroups by diagonal Aut(G). This is complete by native Goursat. Then compute outside-class count, center and the reduced multiplier using an independent supplier. The finite catalogue in Wood Tables1–2 covers only their listed G, and finite continuations cover only their explicit input list.

Hypotheses: All groups are finite; arithmetic fields have characteristic zero.

Proof or construction:

1. Apply Goursat to the subdirect base kernel and use swap invariance to identify the two kernels and force α²=1.
2. Calculate the outside involutions directly from the wreath multiplication.
3. The cardinal generation test is exact, and diagonal transport changes N and the quotient map compatibly.
4. Prove soundness/completeness before deduplicating by the diagonal action; compute rather than infer goodness from abstract names.
5. Import RS.6 reduction certificates and its explicit order96 embedding. This node supplies the quadratic-wreath enumeration and diagonal-orbit adapter, not a second reduced-multiplier or compatible-parity algorithm.

Direct prerequisites: [ArithmeticStatistics:ST.3/embedded-quadratic-wreath-type](#embedded-quadratic-wreath-type); `mathlib:Subgroup.goursat_surjective`; `mathlib:alternatingGroup.kleinFour`; `mathlib:alternatingGroup.normal_kleinFour`; `mathlib:alternatingGroup.kleinFour_card_of_card_eq_four`; `InductionRestrictionPartII:RS.6/reduction-certificate`; `InductionRestrictionPartII:RS.6/order96-type`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), §8.1–8.2,pp.417–420; derived Goursat enumeration adapter.

Uses: Tables1–2 and routed finite row results — One construction owns the finite computation certificates, with the exact finite input set.; A₄ appendix type — N=V₄ and α=inversion on C₃ produce its order96 closure type..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.quotientGraphType` | The embedded type for a normal subgroup N and involutive quotient automorphism α. |
| `FieldStatistics.quotientGraphType_card` | Its cardinal is2\|G\|\|N\|. |
| `FieldStatistics.quotientGraphType_outside` | The exact outside-involution formula in the statement. |
| `FieldStatistics.enumeratedTypes_complete` | Every admissible embedded type arises from the quotient-graph construction. |
| `FieldStatistics.enumeratedTypes_transport` | Diagonal Aut(G) transports N and α by the induced quotient equivalence. |
| `FieldStatistics.catalogueRow` | A row retains G,N,α, the embedded subgroup orbit, class count, center and supplied reduced multiplier. |

Unit tests:

- `FieldStatistics.catalogue_c2` (computation): G=C₂ has one admissible diagonal orbit, C₂², with two outside classes.
- `FieldStatistics.catalogue_c3` (computation): G=C₃ has one admissible orbit, S₃, with one outside class.
- `FieldStatistics.catalogue_a4` (computation): G=A₄ has the S₄ type and the order96 inverse-C₃-quotient type; they must not be collapsed.
- `FieldStatistics.catalogue_normalizer_not_abstract` (non-example): The coordinate-swap subgroup C₂ and the trivial-projection subgroup of the base of C₂≀C₂ are abstractly isomorphic, but diagonal automorphisms preserve their different C₂ projections. They are distinct embedded-type orbits.

Suggested-file coverage: **partial native signature**. catalogueRow additionally stores the imported reduced-multiplier certificate; RS.6/reduction-certificate has no native exported row type at the pins. The quotient graph, transport and finite subgroup tests above are native.

Exact omitted names: `FieldStatistics.catalogueRow`.

Open proof/interface contracts: Native reduced-multiplier and arithmetic-lift exports; Catalogue computation certificates.

<a id="elementary-two-moment-euler-products"></a>

#### Elementary-two moment Euler products

**ID:** `ArithmeticStatistics:ST.3/elementary-two-moment-euler-products`. **Kind:** theorem. **Proposed name:** `FieldStatistics.elementary_two_moment_euler_products`.

For k≥1 put m=2^k. The real twisted homomorphism series is F₊=(T+U+(2m−2)V)/(2m), where T=(1+m2^{-2s}+2m2^{-3s})∏_{p odd}(1+mp^{-s}), U=(1−m2^{-2s})∏_{p≡1(4)}(1+mp^{-s})∏_{p≡3(4)}(1−mp^{-s}), and V=(1+m2^{-3s})∏_{p≡1(4)}(1+mp^{-s}). The imaginary fixed-swap series is F₋=(T−U)/(2m); counting all outside involutions instead multiplies it by m. T=ζ(s)^mG_T(s), U=L(s,χ₄)^mG_U(s), and V=ζ(s)^{m/2}L(s,χ₄)^{m/2}G_V(s), with the remaining products holomorphic for Re(s)>1/2.

Hypotheses: k≥1; the initial products converge absolutely for Re(s)>1.

Proof or construction:

1. Use Q idèle class reciprocity and classify the local characters whose inertia intersects the base C₂^k trivially.
2. Average all2m sign characters to impose total reality; use the fixed-swap archimedean selector for imaginary fields.
3. Calculate the prime2 factors separately; cancel the first-order Euler terms by ζ and L.

Direct prerequisites: [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `AnalyticNumberTheory:AN.4`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), §7,pp.415–417; prime2 and imaginary selectors supplied explicitly here.

Acceptance:

- For k≥1 put m=2^k. The real twisted homomorphism series is F₊=(T+U+(2m−2)V)/(2m), where T=(1+m2^{-2s}+2m2^{-3s})∏_{p odd}(1+mp^{-s}), U=(1−m2^{-2s})∏_{p≡1(4)}(1+mp^{-s})∏_{p≡3(4)}(1−mp^{-s}), and V=(1+m2^{-3s})∏_{p≡1(4)}(1+mp^{-s}). The imaginary fixed-swap series is F₋=(T−U)/(2m); counting all outside involutions instead multiplies it by m. T=ζ(s)^mG_T(s), U=L(s,χ₄)^mG_U(s), and V=ζ(s)^{m/2}L(s,χ₄)^{m/2}G_V(s), with the remaining products holomorphic for Re(s)>1/2.

Suggested-file coverage: **omitted signature**. Needs the named ClassFieldTheory, reduced-multiplier and arithmetic lifting suppliers. Finite wreath/group statements above are only their quadratic arithmetic adapters.

<a id="elementary-two-moment-divergence"></a>

#### Proved elementary-two moment divergence

**ID:** `ArithmeticStatistics:ST.3/elementary-two-moment-divergence`. **Kind:** theorem. **Proposed name:** `FieldStatistics.elementary_two_moment_divergence`.

For k≥1,m=2^k, both the real twisted and imaginary fixed-swap surjection totals are asymptotic to C_k X(log X)^{m−1}, where C_k=G_T(1)/(2m(m−1)!)>0 and G_T(1)=(1+m/2)2^{-m}∏_{p odd}(1+m/p)(1−1/p)^m. Proper-image homomorphisms have smaller logarithmic order. Dividing by quadratic-field counts proves both rigid and unrigid moments diverge for the embedded type C₂^{k+1}; it does not prove the general bad-type conjecture.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Apply the higher-pole Delange theorem to the nonnegative coefficients, retaining the lower-order U,V terms.
2. Bound proper-image maps by the finite collection of smaller elementary-two groups; their largest pole has order at most m/2.
3. Use the quadratic field asymptotic and the finite rigidification constants.

Direct prerequisites: [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products); [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface); `ArithmeticStatistics:ST.3/count-of-quadratic-fields`; `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), End of §7,p.417; derived explicit leading constant.

Acceptance:

- For k≥1,m=2^k, both the real twisted and imaginary fixed-swap surjection totals are asymptotic to C_k X(log X)^{m−1}, where C_k=G_T(1)/(2m(m−1)!)>0 and G_T(1)=(1+m/2)2^{-m}∏_{p odd}(1+m/p)(1−1/p)^m. Proper-image homomorphisms have smaller logarithmic order. Dividing by quadratic-field counts proves both rigid and unrigid moments diverge for the embedded type C₂^{k+1}; it does not prove the general bad-type conjecture.

Suggested-file coverage: **omitted signature**. Needs the named ClassFieldTheory, reduced-multiplier and arithmetic lifting suppliers. Finite wreath/group statements above are only their quadratic arithmetic adapters.

<a id="nonabelian-low-degree-known-moments"></a>

#### Known low-degree nonabelian moments

**ID:** `ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments`. **Kind:** theorem. **Proposed name:** `FieldStatistics.nonabelian_low_degree_known_moments`.

For n=3,4,5, BSW’s mass ratios imply E_k(A_n,S_n)=½(2/n!)^{r₂(k)+α₂}(1/(n−2)!)^{r₁(k)−α₂}, where α₂ counts real base places splitting as R² in the quadratic extension. In particular over Q the imaginary means for (A₃,S₃),(A₄,S₄),(A₅,S₅) are1/2,1/4,1/12 and the real means are1/6,1/24,1/120. For (S_n,S_n×C₂),n=3,4,5, both means diverge. For the normal-over-Q Q₈ closure type of order16 and the D₈×C₂ type, Alberts proves both signed means diverge; these claims concern those embedded types and do not exclude other wreath types.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the low-degree field-to-unramified-extension correspondence and the exact local mass ratios.
2. For product types sum the quadratic twists over a fixed unramified field and use the divergent harmonic subfamily.
3. For Q₈ and D₈ use the discriminant-factorization classification, extract residues with two fixed factors, and sum a nonnegative lower bound over those factors.

Direct prerequisites: [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios); [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface); `AnalyticNumberTheory:AN.4`.

Sources: [bsw-global](https://arxiv.org/pdf/1512.03035v2), Theorem8,pp.4–5; §10.3,pp.30–31; Alberts Corollary4.10/Theorem4.11,pp.656–657; [wood-alberts](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf), Theorem4.1,pp.646–648; Lemma4.9,pp.655–656; Corollary4.10/Theorem4.11,pp.656–657.

Acceptance:

- For n=3,4,5, BSW’s mass ratios imply E_k(A_n,S_n)=½(2/n!)^{r₂(k)+α₂}(1/(n−2)!)^{r₁(k)−α₂}, where α₂ counts real base places splitting as R² in the quadratic extension. In particular over Q the imaginary means for (A₃,S₃),(A₄,S₄),(A₅,S₅) are1/2,1/4,1/12 and the real means are1/6,1/24,1/120. For (S_n,S_n×C₂),n=3,4,5, both means diverge. For the normal-over-Q Q₈ closure type of order16 and the D₈×C₂ type, Alberts proves both signed means diverge; these claims concern those embedded types and do not exclude other wreath types.

Suggested-file coverage: **omitted signature**. Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

Open proof/interface contracts: Alberts original classification and residue inputs.

<a id="a4-appendix-kernel-enumerator"></a>

#### The A₄ class-group-kernel enumeration

**ID:** `ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator`. **Kind:** construction. **Proposed name:** `FieldStatistics.eligibleA4Kernel`.

Let M/Q be the S₃ closure of a nowhere-totally-ramified cubic field of negative fundamental discriminant D, and K its quadratic subfield. Enumerate index4 subgroups N of Cl(M), stable under C₃=Gal(M/K), with quotient C₂², but not stable under all S₃. Class-field equivariance identifies them with unramified A₄-extensions L/K having the order96 closure type. Every kernel gives24 rigid surjections. The two kernels in its S₃-orbit together give48. Exhaustive cubic lists plus certified class-group/action computations give an exact finite-discriminant total; a sampled list yields an estimator, not an exact total or a limit theorem. For a general finite S₃-module backend, also require a nontrivial induced C₃ action on the quotient. Arithmetic class-field conjugation makes this automatic for the intended Cl(M) input; it must not be assumed for an arbitrary supplied action.

Hypotheses: All groups are finite; arithmetic fields have characteristic zero.

Proof or construction:

1. Use the cubic/unramified-C₃ correspondence to obtain every M.
2. Filter the native class-group subgroups by index, quotient type and the C₃/S₃ actions.
3. Schur–Zassenhaus gives a C₂²⋊C₃ group; the trivial action would make the extension abelian over K and stable over Q, so the retained action is A₄.
4. Use |Aut(A₄)|=24 and a stabilizer of index2 in S₃ to prove both equivalent rigidification weights.

Direct prerequisites: `ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent`; [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue); [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `InductionRestrictionPartII:RS.6/order96-type`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), AppendixA.1,pp.420–422; A.2–A.3,pp.422–424.

Uses: Appendix exact and sampled averages — Separates the exact finite arithmetic correspondence from computational certification and asymptotic evidence.; Order96 correction test — Makes the multiplier factor2 observable with the right24/48 normalization..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.eligibleA4Kernel` | An index4 subgroup of a finite abelian S₃-module, with elementary-two quotient, C₃ stability, nontrivial induced C₃ action, and failure of S₃ stability. For the certified native Cl(M) action this is the arithmetic eligible kernel. |
| `FieldStatistics.eligibleA4Kernels` | The finite set of eligible kernels for a supplied S₃ action on Cl(M). |
| `FieldStatistics.a4KernelFieldCorrespondence` | The kernel-to-unramified-extension bijection, including the closure type. |
| `FieldStatistics.a4RigidCount_eq_24_mul` | The total rigid count is24 times the number of eligible kernels. |
| `FieldStatistics.a4RigidCount_eq_48_mul_orbits` | Equivalently it is48 times the number of eligible S₃ orbits. |
| `FieldStatistics.a4SampleEstimator` | Inverse-probability weighted total for a uniform sample with replacement, unbiased for the certified finite input list. |

Unit tests:

- `FieldStatistics.a4_empty_kernel_set` (degenerate): An odd-cardinality finite abelian group has no quotient C₂², so its eligible kernel set is empty. The arithmetic backend must also reject every input with no elementary-two quotient of dimension2.
- `FieldStatistics.a4_trivial_c3_action` (non-example): A C₃-trivial quotient is rejected; it gives C₂²×C₃ of order12, not A₄.
- `FieldStatistics.a4_s3_module_regression` (computation): For the S₃-module consisting of two swapped copies of the irreducible C₃-module F₂², the two coordinate kernels are eligible, giving48 rigid surjections together.
- `FieldStatistics.a4_sample_estimator_unbiased` (boundary): For a finite certified list of size N and a uniform sample with replacement of size m>0, the estimator (N/m) times the sum of sampled rigid counts has expectation equal to the list’s total. This tests the sampling weights, without claiming an arithmetic limit.

Suggested-file coverage: **partial native signature**. The missing kernel-to-field correspondence and rigid24/48 counts require equivariant unramified class-field exports. The finite module selector and sample estimator above do not stand for that arithmetic correspondence.

Exact omitted names: `FieldStatistics.a4KernelFieldCorrespondence`, `FieldStatistics.a4RigidCount_eq_24_mul`, `FieldStatistics.a4RigidCount_eq_48_mul_orbits`.

Open proof/interface contracts: Arithmetic nonabelian moment signatures.

<a id="nonabelian-tame-local-model"></a>

#### The nonabelian tame local model

**ID:** `ArithmeticStatistics:ST.3/nonabelian-tame-local-model`. **Kind:** definition. **Proposed name:** `FieldStatistics.tameOutsideLocalMass`.

For a finite embedded type F and an odd prime p∤|F|, the unramified/tame local mass is |F|⁻¹ times the sum over x,y∈F with xyx⁻¹=y^p and y=1 or y∈c(F), weighted by1 when y=1 and p^{-s} otherwise. It equals1+N_Fp^{-s}, where N_F is the number of F-conjugacy classes in c(F). The full Malle–Bhargava local model includes separate bad-prime and infinite factors. It predicts signed arithmetic means of order(log X)^{N_F−1}; the global prediction is a named predicate and is not implied by the local calculation.

Hypotheses: All groups are finite; arithmetic fields have characteristic zero.

Proof or construction:

1. Count x for each allowed y by its centralizer; since y²=1 and p is odd, the tame relation is commutation.
2. Sum one centralizer contribution per conjugacy class; y=1 gives1.
3. Factor the good-prime Euler product by ζ(s)^{N_F}; local/global compatibility and bad-prime constants remain heuristic except in the explicitly proved elementary-two case.

Direct prerequisites: [ArithmeticStatistics:ST.3/embedded-quadratic-wreath-type](#embedded-quadratic-wreath-type); [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface); `AnalyticNumberTheory:AN.4`.

Sources: [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), §6,pp.411–414; Question6.1,p.413.

Uses: Wood §6 — Supplies the local reason for distinguishing good from bad types.; Wood §7 — The elementary-two theorem certifies this predicted logarithmic order in that specific family..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.tameOutsideLocalMass` | The normalized finite sum with tame relation and the quadratic discriminant weight. |
| `FieldStatistics.tameOutsideLocalMass_eq` | For odd p, the finite mass is1+outsideClassCount(F)p^{-s}. |
| `FieldStatistics.tameOutsideLocalMass_at_zero` | At s=0 the mass is1+outsideClassCount(F). |
| `FieldStatistics.localModelLogExponent` | The natural exponent N_F−1. |
| `FieldStatistics.localModelLogExponent_good` | An admissible good type has exponent0. |
| `FieldStatistics.LogarithmicMomentPrediction` | Positive signed constants give asymptotics c±(log X)^{N_F−1}; this is a predicate, not a proved limit. |

Unit tests:

- `FieldStatistics.tame_model_c3` (computation): For the C₃ inverse-graph type, the factor is1+p^{-s}, with exponent0.
- `FieldStatistics.tame_model_c2` (non-example): For the C₂ inverse-graph type, the factor is1+2p^{-s}, with exponent1.
- `FieldStatistics.tame_model_trivial` (degenerate): For G=1,F=C₂, the factor is1+p^{-s}, not1.

Suggested-file coverage: **partial native signature**. LogarithmicMomentPrediction uses the missing signed arithmetic moments, their base-field denominator and their asymptotic limit. The finite tame factor is native and does not prove that prediction.

Exact omitted names: `FieldStatistics.LogarithmicMomentPrediction`.

### Field reconstruction and torsion-weighted counts

A small trace-zero element generates a primitive extension, but may lie in a proper subfield in general. Schmidt’s bound treats the latter through intermediate-field induction. Mixed traces use a finite-fibre reconstruction input to reduce the coefficient count; the explicit exponent comparison includes a finite numerical certificate. Quartic applications use a separate torsion-weighted cubic-resolvent estimate and retain fixed-resolvent constants. Klüners’s cyclotomic subfamily tests the logarithmic part of Malle’s prediction, and keeps the weaker bound with an arbitrary positive exponent loss distinct.

<a id="small-trace-zero-element"></a>

#### Small nonrational trace-zero elements

**ID:** `ArithmeticStatistics:ST.3/small-trace-zero-element`. **Kind:** theorem. **Proposed name:** `FieldStatistics.small_trace_zero_element`.

Every degree-n number field K/Q,n≥2, has an integral nonzero nonrational element α of trace zero with archimedean L² norm O_n(D_K^{1/(2n−2)}). If K has no proper intermediate field, α generates K; its monic minimal polynomial then has a₁=0 and |a_i|≪_nD_K^{i/(2n−2)}. Without primitivity it may lie in a proper subfield, so the coefficient box alone does not count every field.

Hypotheses: n≥2; fields are counted up to Q-isomorphism.

Proof or construction:

1. Use the trace-zero integral lattice and its covolume, then Minkowski’s first theorem.
2. The only rational algebraic integer of trace zero is0.
3. Under the no-intermediate-field hypothesis the nonrational element generates K; bound elementary symmetric polynomials of its conjugates.

Direct prerequisites: `ArithmeticStatistics:ST.3/number-field-counting-function`; `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.

Sources: [lot](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf), §2,p.2; Schmidt proof,pp.190–191; [schmidt](https://www.numdam.org/article/AST_1995__228__189_0.pdf), (1.1)–(1.2) and proof, pp.189–195.

Acceptance:

- Every degree-n number field K/Q,n≥2, has an integral nonzero nonrational element α of trace zero with archimedean L² norm O_n(D_K^{1/(2n−2)}). If K has no proper intermediate field, α generates K; its monic minimal polynomial then has a₁=0 and |a_i|≪_nD_K^{i/(2n−2)}. Without primitivity it may lie in a proper subfield, so the coefficient box alone does not count every field.

Suggested-file coverage: **partial native signature**. Needs the mixed-trace map and its exact Alexander-Hirschowitz/Bézout finite-fibre export; the generic native field-count bounds above do not construct that map. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

<a id="schmidt-field-count-bound"></a>

#### Schmidt’s field-counting bound

**ID:** `ArithmeticStatistics:ST.3/schmidt-field-count-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.schmidt_field_count_bound`.

For n≥2 the number of degree-n Q-isomorphism classes with absolute discriminant≤X is O_n(X^{(n+2)/4}). For a fixed number-field base k the same exponent holds for relative degree n and relative discriminant norm≤X, with constant depending on k,n.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. For primitive fields count the trace-zero coefficient boxes.
2. For imprimitive fields choose a maximal chain of intermediate fields and apply the relative primitive estimate at each step.
3. Use the discriminant tower identity and sum dyadic base-discriminant intervals; retain the base-discriminant saving that makes the sum converge.

Direct prerequisites: [ArithmeticStatistics:ST.3/small-trace-zero-element](#small-trace-zero-element); `ArithmeticStatistics:ST.3/number-field-counting-function`; `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.

Sources: [lot](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf), §1,p.1; §2,p.2; Schmidt (1.1)–(1.2) and proof,pp.189–195; [schmidt](https://www.numdam.org/article/AST_1995__228__189_0.pdf), (1.1)–(1.2) and proof, pp.189–195.

Acceptance:

- At n=2 the bound is linear; at n=4 its exponent is3/2.

Suggested-file coverage: **partial native signature**. Needs the mixed-trace map and its exact Alexander-Hirschowitz/Bézout finite-fibre export; the generic native field-count bounds above do not construct that map. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

<a id="mixed-trace-finite-fibres"></a>

#### Finite fibres of generic mixed traces

**ID:** `ArithmeticStatistics:ST.3/mixed-trace-finite-fibres`. **Kind:** theorem. **Proposed name:** `FieldStatistics.mixed_trace_finite_fibres`.

For n≥6 and3≤r≤n, if binomial(d+r−1,r−1)>rn, there is a set of rn degree-d multi-indices whose mixed-trace map on r ordered n-tuples has nonzero Jacobian and, outside a fixed hypersurface, at most the product of its coordinate degrees many points per fibre. For r=2 the first2n nonzero pairs ordered by total degree then second coordinate also have nonzero Jacobian. The hypersurface and bound depend only on n,r,d.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. For r=2 expand the Jacobian determinant and isolate its last two columns; induction prevents cancellation.
2. For r≥3 apply Alexander–Hirschowitz with its exceptional cases excluded by the hypotheses, then choose a full-rank minor.
3. A nonzero Jacobian makes the map generically finite; use a nonzero polynomial cutting out the bad fibres and affine Bézout for the uniform bound.

Direct prerequisites: .

Sources: [lot](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf), Lemma2.1,pp.2–3; Lemmas3.1 and3.3/Theorem3.2,pp.3–5.

Acceptance:

- For n≥6 and3≤r≤n, if binomial(d+r−1,r−1)>rn, there is a set of rn degree-d multi-indices whose mixed-trace map on r ordered n-tuples has nonzero Jacobian and, outside a fixed hypersurface, at most the product of its coordinate degrees many points per fibre. For r=2 the first2n nonzero pairs ordered by total degree then second coordinate also have nonzero Jacobian. The hypersurface and bound depend only on n,r,d.

Suggested-file coverage: **omitted signature**. Needs the mixed-trace map and its exact Alexander-Hirschowitz/Bézout finite-fibre export; the generic native field-count bounds above do not construct that map.

Open proof/interface contracts: Mixed-trace algebraic geometry input.

<a id="lemke-oliver-thorne-field-bound"></a>

#### The Lemke Oliver–Thorne field-counting bound

**ID:** `ArithmeticStatistics:ST.3/lemke-oliver-thorne-field-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.lemke_oliver_thorne_field_bound`.

For every n≥6 the degree-n field count is O_n(X^{1.564(log n)²}); for every c>1/(4(log2)²) there is n₀(c) such that exponent c(log n)² works for n≥n₀. More precisely the mixed-trace construction gives exponent dr when3≤r≤n and binomial(d+r−1,r−1)>rn. The two-generator version gives2d−d(d−1)(d+4)/(6n), where d is least with binomial(d+2,2)≥2n+1. The explicit comparison with Schmidt starts at n=95; no claim of current optimality is made.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the ring-of-integers largest-minimum bound to choose a basis of size O_n(D_K^{1/n}).
2. Avoid the finite-fibre hypersurface and the first-element discriminant hypersurface by bounded integer combinations of that basis.
3. The first element generates K; count the integer mixed traces and bound their fibre multiplicity.
4. Optimize d,r using Stirling and supply the finite numerical certificate for the constant1.564 and threshold95.

Direct prerequisites: [ArithmeticStatistics:ST.3/mixed-trace-finite-fibres](#mixed-trace-finite-fibres); [ArithmeticStatistics:ST.3/schmidt-field-count-bound](#schmidt-field-count-bound); `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.

Sources: [lot](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf), Theorems1.1–1.2,pp.1–2; Lemmas4.1–4.2 and proofs,pp.5–6.

Acceptance:

- The two-generator numerical comparison has its first strict improvement over Schmidt at n=95; certify that finite threshold.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="cyclic-prime-field-count"></a>

#### Cyclic-prime field counts

**ID:** `ArithmeticStatistics:ST.3/cyclic-prime-field-count`. **Kind:** theorem. **Proposed name:** `FieldStatistics.cyclic_prime_field_count`.

For every prime p, the cyclic degree-p Q-field count is O_p(X^{1/(p−1)}). In particular cyclic cubic fields satisfy N₃(C₃,X)~C₃X^{1/2} for an explicit positive Euler-product constant. These are field counts; distinct characters defining one field are divided by p−1. General abelian groups may carry logarithmic factors, so the cyclic-prime assertion does not imply a pure-power bound for C₂².

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use conductor–discriminant for Dirichlet characters and divide the primitive order-p characters by p−1.
2. At good primes the number of possible nontrivial characters is p−1 only when the prime is1 mod p; analyze the bad prime separately.
3. Factor the conductor series by the appropriate ζ/Dirichlet-L products and apply a Tauberian theorem.

Direct prerequisites: `ArithmeticStatistics:ST.3/number-field-counting-function`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `AnalyticNumberTheory:AN.4`; `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`.

Sources: [bhargava-fields](https://arxiv.org/pdf/2111.06507v3), Cyclic-prime input,p.4; BSTTTZ §6,p.10; quoted Mäki/Wright/Cohn originals; [bstttz](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), §6, p.10, quoting the cyclic cubic theorem; [cohen-morra](https://arxiv.org/pdf/1003.1869v1), Corollary7.2,p.15; Corollary6.2,pp.13–14.

Acceptance:

- p=2 gives a linear bound and p=3 a square-root bound. This cannot be extrapolated to V₄ without its logarithmic factor.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

Open proof/interface contracts: Original abelian and quartic counting proofs; Abelian and classical counting originals.

<a id="galois-field-three-eighths-bound"></a>

#### The historical three-eighths Galois-field bound

**ID:** `ArithmeticStatistics:ST.3/galois-field-three-eighths-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.galois_field_three_eighths_bound`.

For a fixed number field k and finite G with |G|>4, Galois G-extensions L/k of relative discriminant norm≤X have count O_{k,G,ε}(X^{3/8+ε}) for every ε>0. No pure O(X^{1/2}) assertion for all groups of order≤4 is inferred; C₂² has a logarithmic factor.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Induct on |G| using a minimal normal subgroup H=S^r. For nonabelian S use a large proper subgroup with trivial normal core and the non-Galois counting theorem; this step invokes the classification of finite simple groups.
2. For abelian H use ramified characters, the class-group bound, and the tame-inertia conductor restriction to obtain the exponents in the proof. Small quotient groups require the abelian counting inputs, with logarithms absorbed into X^ε.
3. Treat S₃ by Datskovsky–Wright and nilpotent groups of order8 by Klüners–Malle. When H=C₂, inflation–restriction removes the class-group factor; the remaining exponents are at most3/8.

Direct prerequisites: [ArithmeticStatistics:ST.3/cyclic-prime-field-count](#cyclic-prime-field-count); [ArithmeticStatistics:ST.3/schmidt-field-count-bound](#schmidt-field-count-bound); `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.

Sources: [ev-fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n2-p11.pdf), Proposition1.3,p.725; proof Proposition2.8,§2.2,pp.734–737.

Acceptance:

- The regular S₃ action has degree6 and group order6>4; its3/8+ε bound makes its contribution smaller than X^(1/2).

Suggested-file coverage: **partial native signature**. The packet records the full relative-base and field-count supplier contract; the signature here covers its explicitly typed native Q-base specialization. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

Open proof/interface contracts: Historical Galois-bound exceptional inputs.

<a id="fixed-resolvent-cubic-count"></a>

#### Cubic fields with a fixed quadratic resolvent

**ID:** `ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count`. **Kind:** theorem. **Proposed name:** `FieldStatistics.fixed_resolvent_cubic_count`.

For a fixed quadratic field F=Q(√d), with d its fundamental discriminant and d≠−3, the number N₃(S₃,F,X) of cubic fields with quadratic resolvent F and |D_K|<X satisfies N₃(S₃,F,X)~C_F X^{1/2}, C_F>0. For F=Q(√−3), instead N₃(S₃,F,X)~C_{−3} X^{1/2}log X, with C_{−3}=7/(60√3)·∏_p(1−3/p²+2/p³)>0. Consequently every fixed F satisfies N₃(S₃,F,X)≪_F X^{1/2}(1+log X). All constants and error terms may depend on F; these pointwise statements do not give uniformity in F.

Hypotheses: F is a fixed quadratic extension of Q; fields are counted up to Q-isomorphism by absolute field discriminant. Separate the fundamental discriminant d=−3 from d≠−3.

Proof or construction:

1. Use the anti-invariant ray-class/Kummer conductor series of Cohen–Morra Theorem6.1, retaining its finite character sum and wild prime3 factors; this is the requested ClassFieldTheory export.
2. For d≠−3 the trivial-character part has a simple conductor pole; for d=−3 it has a double pole. Apply Corollary6.2/§7.2–7.3, retaining positivity and the lower-order pole.
3. Translate conductor height Y to discriminant height X by Y=(X/|d|)^{1/2}. The double-pole term contributes (1/2)log X and yields the stated pure-cubic coefficient. Compare Bhargava–Shnidman Theorems7–8 and their shape/hyperbola proofs.

Direct prerequisites: [ArithmeticStatistics:ST.3/cubic-conductor-discriminant](#cubic-conductor-discriminant); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`.

Sources: [cohen-morra](https://arxiv.org/pdf/1003.1869v1), Theorem1.1(1)–(2),pp.2–3; Corollary6.2,pp.13–14; Corollaries7.4 and7.6,pp.15–17; [bhargava-shnidman](https://msp.org/ant/2014/8-1/ant-v8-n1-p03-s.pdf), Theorems7–8 and(1),pp.57–58; §5,pp.79–80; §6,pp.80–86; [bstttz](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), §6,Remark6.1,(10),p.10.

Acceptance:

- For d≠−3, the normalized count N₃(S₃,F,X)/√X tends to a finite positive C_F.
- For d=−3, that quotient diverges like C_{−3}log X; dividing by √X log X gives the stated positive Euler product.
- The extra logarithm is absorbed by X^η for any η>0, without making the constants uniform in F.

Suggested-file coverage: **omitted signature**. Needs the native quadratic-resolvent map on cubic fields and the anti-invariant conductor-series export of Cohen–Morra §§6–7, with the Tauberian hypotheses. The source result includes a distinct Q(√−3) logarithmic branch.

<a id="baily-weighted-quartic-count"></a>

#### The quartic-to-cubic weighted counting estimate

**ID:** `ArithmeticStatistics:ST.3/baily-weighted-quartic-count`. **Kind:** theorem. **Proposed name:** `FieldStatistics.baily_weighted_quartic_count`.

For a family C of cyclic or noncyclic cubic fields and quartic A₄/S₄ fields whose cubic resolvents lie in C, N₄(C,X)≪Σ_{K∈C,D_K<X}h₂(K)(log D_K)²√(X/D_K). The passage to arbitrary resolvent subfamilies requires Baily’s original multiplicity calculation; it is recorded as an explicit source gap.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the quartic/cubic-resolvent parametrization and the quadratic-extension/class-group description of each fibre.
2. Bound the allowable conductors at fixed K and account for every isomorphism multiplicity.
3. Sum the fixed-K estimate over the selected cubic family.

Direct prerequisites: `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quartic-rings`; `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Sources: [bstttz](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), §6,(5),pp.9–10; citing Baily Lemma10/Theorems2 and4.

Acceptance:

- For a family C of cyclic or noncyclic cubic fields and quartic A₄/S₄ fields whose cubic resolvents lie in C, N₄(C,X)≪Σ_{K∈C,D_K<X}h₂(K)(log D_K)²√(X/D_K). The passage to arbitrary resolvent subfamilies requires Baily’s original multiplicity calculation; it is recorded as an explicit source gap.

Suggested-file coverage: **omitted signature**. Needs the native cubic resolvent-fibre, field weighting and pointwise two-torsion export from EffectiveBounds Part II, with fixed-resolvent constants retained.

Open proof/interface contracts: Original abelian and quartic counting proofs; Abelian and classical counting originals.

<a id="weighted-cubic-partial-summation"></a>

#### Partial summation of the weighted cubic family

**ID:** `ArithmeticStatistics:ST.3/weighted-cubic-partial-summation`. **Kind:** theorem. **Proposed name:** `FieldStatistics.weighted_cubic_partial_summation`.

Fix b≥0 and a>0. If a cubic field family C satisfies N_C(T)≪_F T^{1/2}(1+log T)^b for T≥2, and h₂(K)≪_ηD_K^{a+η} for each η>0, then Σ_{K∈C,D_K<X}h₂(K)(log D_K)²√(X/D_K)≪_{F,ε,b}X^{1/2+a+ε} for each ε>0. Dyadic summation precedes absorption of logarithms. The choice b=0 covers cyclic cubics and nonexceptional fixed resolvents; b=1 covers F=Q(√−3).

Hypotheses: C is an isomorphism-class family of cubic number fields ordered by absolute field discriminant; a>0 and b≥0 are fixed. The implied count constant may depend on the fixed resolvent F.

Proof or construction:

1. A shell T≤D_K<2T contributes O_{F,b,η}(X^{1/2}T^{a+η}(1+log T)^{b+2}).
2. Sum the geometric sequence using a>0, choose η<ε and absorb the fixed logarithmic power into X^{ε−η}.

Direct prerequisites: `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.

Sources: [bstttz](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), §6,proof of(8)–(9),p.10.

Acceptance:

- b=0 and b=1 give the same exponent 1/2+a+ε after logarithm absorption.
- Without ε, the extra pure-cubic logarithm cannot be discarded.

Suggested-file coverage: **omitted signature**. Needs the native cubic resolvent-fibre, field weighting and pointwise two-torsion export from EffectiveBounds Part II, with fixed-resolvent constants retained.

<a id="quartic-torsion-counting-applications"></a>

#### A₄ and fixed-resolvent S₄ counting bounds

**ID:** `ArithmeticStatistics:ST.3/quartic-torsion-counting-applications`. **Kind:** theorem. **Proposed name:** `FieldStatistics.quartic_torsion_counting_applications`.

Set α=√3/2, β=((1+α)/(2α))log((1+α)/(2α))−((1−α)/(2α))log((1−α)/(2α)), and a=1/(6(1−β/log2)); thus a≈0.2784. The requested cubic two-torsion bound is h₂(K)≪_ηD_K^{a+η} for every η>0. Then N₄(A₄,X)≪_εX^{1/2+a+ε}, and for each fixed quadratic resolvent F, N₄(S₄,F,X)≪_{F,ε}X^{1/2+a+ε}. Keep F-dependence in the second estimate; the pure-cubic resolvent is handled with its logarithmic factor.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Apply the weighted quartic estimate to cyclic cubic resolvents for A₄, and to fixed-quadratic-resolvent cubic fields for S₄.
2. Use the cyclic cubic √T count and the fixed-resolvent bound √T(1+log T), including F=Q(√−3), together with the nontrivial cubic two-torsion bound.
3. Apply weighted partial summation with arbitrary ε>0.

Direct prerequisites: [ArithmeticStatistics:ST.3/baily-weighted-quartic-count](#baily-weighted-quartic-count); [ArithmeticStatistics:ST.3/cyclic-prime-field-count](#cyclic-prime-field-count); [ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count](#fixed-resolvent-cubic-count); [ArithmeticStatistics:ST.3/weighted-cubic-partial-summation](#weighted-cubic-partial-summation); `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.

Sources: [bstttz](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), Theorem1.4,p.2; §6,(8)–(9),Remark6.1,p.10.

Acceptance:

- With a≈0.2784, the exponent is about0.7784; fixed-resolvent constants may depend on F.

Suggested-file coverage: **omitted signature**. Needs the native cubic resolvent-fibre, field weighting and pointwise two-torsion export from EffectiveBounds Part II, with fixed-resolvent constants retained.

<a id="kluners-cyclotomic-subfamily"></a>

#### The cyclotomic subfamily in Klüners’s counterexample

**ID:** `ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily`. **Kind:** theorem. **Proposed name:** `FieldStatistics.kluners_cyclotomic_subfamily`.

Let G=C₃≀C₂ in degree6. Its minimum permutation index is2, so a(G)=1/2 and b_Q(G)=1. Over K=Q(ζ₃), cyclic cubic extensions have count~c_KY^{1/2}logY with c_K>0. Since |D_L|=27N_K(D_{L/K}), these towers contribute≫X^{1/2}logX. The cyclic C₆ and regular S₃ degree6 families contribute O_ε(X^{3/8+ε}) for ε<1/8, so removing them leaves the same lower order of growth for G-fields. This contradicts the original logarithmic exponent, while it does not contradict the weak X^{1/2+ε} upper prediction.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Compute the index and Q-cyclotomic conjugacy orbit of the two minimum-index classes.
2. Apply Wright’s abelian count over Q(ζ₃), where the two classes are no longer joined by cyclotomic action.
3. Use the tower discriminant formula and the finite normalization between embeddings and isomorphism classes.
4. Remove C₆ and regular S₃ using the historical Galois bound; retain the logarithmic lower bound.

Direct prerequisites: `ArithmeticStatistics:ST.3/malle-invariants-of-a-permutation-group`; `ArithmeticStatistics:ST.3/malle-conjecture`; [ArithmeticStatistics:ST.3/galois-field-three-eighths-bound](#galois-field-three-eighths-bound); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`.

Sources: [kluners-counterexample](https://arxiv.org/pdf/math/0411486v1), §§1–2,pp.1–3.

Acceptance:

- For C₃≀C₂, a_Q=1/2 and b_Q=1, but the Q(ζ₃) subfamily grows as X^(1/2)log X. This refutes the strong logarithmic prediction while respecting an ε-loss upper bound.

Suggested-file coverage: **omitted signature**. Needs Wright’s original conductor/discriminant series over Q(zeta3), the native fixed-quadratic tower embedding, and its logarithmic coefficient. Malle invariants remain accepted imports.

Open proof/interface contracts: Abelian and classical counting originals.

### Governing fields and the restricted Pell family

A governing field fixes the multiplier d, the power-rank level and a conjugacy-invariant Frobenius function. The no-sixteen-rank theorem retains the named short-character hypothesis C_n; it is not an unconditional general theorem. Its spin criterion uses the actual unit-square-invariant module in the selected degree-eight field. The Pell family is ordered by radicand and contains 1. A class-group slice removes that unit radicand and uses the correct discriminant in each residue class. The historical lower and upper inequalities are distinct from the limiting-density proof, which belongs to its routed owner.

<a id="governing-field-interface"></a>

#### Governing fields for prime-parameter ranks

**ID:** `ArithmeticStatistics:ST.3/governing-field-interface`. **Kind:** definition. **Proposed name:** `FieldStatistics.IsRankGoverningField`.

Fix k≥1 and d∈Z with d≢2 mod4. A governing field for rk_{2^k} in the family of quadratic fields of fundamental discriminant dp consists of a finite normal M/Q and a conjugacy-invariant map φ:Gal(M/Q)→N. For every unramified rational prime p with dp fundamental, φ(Frob_p)=rk_{2^k}Cl⁺(Q(√dp)). All primes over p give the same value; finitely many ramified primes are excluded explicitly. This notion keeps d and k fixed, unlike relative governing fields which vary with other prime factors.

Hypotheses: k≥1; d≢2 mod4; M/Q is finite Galois.

Proof or construction:

1. Use the native arithmetic-Frobenius relation on primes of the ring of integers.
2. Use conjugacy invariance to eliminate the prime and Frobenius representative.
3. Identify the quadratic field by an element with square dp and degree2, and use the already-defined prime-power rank of its native narrow class group.

Direct prerequisites: [ArithmeticStatistics:ST.3/prime-power-class-group-rank](#prime-power-class-group-rank); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `tauceti:NumberField.exists_isArithFrobAt_int_of_liesOver`; `tauceti:NumberField.isArithFrobAt_eq_of_isUnramifiedAt`; `tauceti:NumberField.NarrowClassGroup`.

Sources: [km-governing](https://arxiv.org/pdf/1809.09597v1), §1,(1.2),p.3.

Uses: KM Theorem3 — The impossibility result quantifies over finite normal fields and actual class functions.; KM §5 — Allows replacing a hypothetical field by its compositum with E..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.IsRankGoverningField` | The conjugacy-invariant Frobenius formula at every admissible unramified prime. |
| `FieldStatistics.governing_prime_choice` | Changing the prime over p or the Frobenius representative preserves the value. |
| `FieldStatistics.governing_isomorphism` | Transport M and its class function along a Q-algebra isomorphism. |
| `FieldStatistics.governing_enlarge` | A finite normal extension of M governs by composing φ with restriction. |
| `FieldStatistics.governing_conjugate_class` | φ(τστ⁻¹)=φ(σ). |

Unit tests:

- `FieldStatistics.governing_k1_mod4` (computation): For d=−4,p≡1 mod4 the genus-theory two-rank is1; the constant class function1 is compatible with every admissible prime.
- `FieldStatistics.governing_ramified_excluded` (boundary): A rational prime ramified in M creates no Frobenius obligation.
- `FieldStatistics.governing_prime_parameter_guard` (non-example): For d=−4,p=3, dp=−12 is not fundamental; that prime is not in the family.
- `FieldStatistics.governing_class_function` (non-example): Values differing on conjugate Frobenius elements cannot define a governing class function.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="eight-rank-governing-field"></a>

#### The classical eight-rank governing field

**ID:** `ArithmeticStatistics:ST.3/eight-rank-governing-field`. **Kind:** theorem. **Proposed name:** `FieldStatistics.eight_rank_governing_field`.

For odd p≡1 mod4, put E=Q(ζ₈,√(1+i)). It is a Galois field of degree8 with dihedral group of order8 and principal ring of integers. Then8 divides h(−4p) exactly when p splits completely in E. The parameter restriction makes−4p the fundamental field discriminant; the source’s notation D₄ means the order8 dihedral group.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the quadratic genus description to identify the unique relevant two-primary cyclic factor.
2. Express its8-divisibility by the quartic-residue criterion; identify this criterion with splitting in E.
3. Certify the PID and the degree/group calculation in the original classical source.

Direct prerequisites: [ArithmeticStatistics:ST.3/governing-field-interface](#governing-field-interface); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Sources: [km-governing](https://arxiv.org/pdf/1809.09597v1), §5,p.22; citing the preceding classical work.

Acceptance:

- For odd p≡1 mod4, put E=Q(ζ₈,√(1+i)). It is a Galois field of degree8 with dihedral group of order8 and principal ring of integers. Then8 divides h(−4p) exactly when p splits completely in E. The parameter restriction makes−4p the fundamental field discriminant; the source’s notation D₄ means the order8 dihedral group.

Suggested-file coverage: **omitted signature**. Needs the original selected prime2/order4 spin criterion, native field E, the unit-square-invariant spin and conditional C_n exports. The governing predicate above is native.

Open proof/interface contracts: Original governing-field criteria.

<a id="sixteen-rank-spin-criterion"></a>

#### The sixteen-rank spin criterion

**ID:** `ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion`. **Kind:** theorem. **Proposed name:** `FieldStatistics.sixteen_rank_spin_criterion`.

Fix r of order4 in Gal(E/Q). There are F>0 and ψ₀:(O_E/F O_E)ˣ→C invariant under multiplication by unit squares, such that for odd p∤F splitting completely in E and any generator π of a prime over p,16|h(−4p) iff ψ₀(π modF)(r(π)/π)_{E,2}=1. Generator independence, the2-adic residue correction and the fixed r convention are part of the assertion.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Import the corrected quadratic residue-symbol and joint-spin convention.
2. Read the original Bruin–Hemenway and KM Proposition6.2 criterion, checking all primes above2 and all generator changes.
3. Transport its local residue factor to the finite quotient and verify unit-square invariance.

Direct prerequisites: [ArithmeticStatistics:ST.3/eight-rank-governing-field](#eight-rank-governing-field); `SieveMethodsAndPrimePatterns:SV.5`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Sources: [km-governing](https://arxiv.org/pdf/1809.09597v1), §5,(5.1),p.22; citing KM18a Proposition6.2 and Bruin–Hemenway.

Acceptance:

- Fix r of order4 in Gal(E/Q). There are F>0 and ψ₀:(O_E/F O_E)ˣ→C invariant under multiplication by unit squares, such that for odd p∤F splitting completely in E and any generator π of a prime over p,16|h(−4p) iff ψ₀(π modF)(r(π)/π)_{E,2}=1. Generator independence, the2-adic residue correction and the fixed r convention are part of the assertion.

Suggested-file coverage: **omitted signature**. Needs the original selected prime2/order4 spin criterion, native field E, the unit-square-invariant spin and conditional C_n exports. The governing predicate above is native.

Open proof/interface contracts: Original governing-field criteria.

<a id="no-sixteen-rank-governing-field"></a>

#### Conditional absence of a sixteen-rank governing field

**ID:** `ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field`. **Kind:** theorem. **Proposed name:** `FieldStatistics.no_sixteen_rank_governing_field`.

Assume the short real-character-sum conjecture C_n of KM §2.5 for every n≥3. Then no finite normal M/Q with a class function governs the16-rank of Cl⁺(Q(√−4p)) as odd p≡1 mod4 varies. The conclusion remains conditional; it is not a Chebotarev theorem or a proved unconditional counterexample.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Enlarge a hypothetical governing field to contain E. Take S to be the inverse image of the fixed order4 element r; S is disjoint from S⁻¹.
2. Use the norm identity for the joint spin and the finite residue selector to express it on degree-one principal primes as2|T_M||V_M/V_M²|(1_{16|h(−4p)}−1/2).
3. The governing class function makes the sign constant on degree-one primes. The conditional joint-spin estimate gives a power saving, while prime-ideal Chebotarev gives a positive main term, a contradiction.

Direct prerequisites: [ArithmeticStatistics:ST.3/governing-field-interface](#governing-field-interface); [ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion](#sixteen-rank-spin-criterion); `SieveMethodsAndPrimePatterns:SV.5`; `ExponentialSumsAndCircleMethod:ES.0`; `AnalyticNumberTheory:AN.2`.

Sources: [km-governing](https://arxiv.org/pdf/1809.09597v1), Theorem3,p.3; proof §5,pp.22–23.

Acceptance:

- Assume the short real-character-sum conjecture C_n of KM §2.5 for every n≥3. Then no finite normal M/Q with a class function governs the16-rank of Cl⁺(Q(√−4p)) as odd p≡1 mod4 varies. The conclusion remains conditional; it is not a Chebotarev theorem or a proved unconditional counterexample.

Suggested-file coverage: **omitted signature**. Needs the original selected prime2/order4 spin criterion, native field E, the unit-square-invariant spin and conditional C_n exports. The governing predicate above is native.

<a id="restricted-real-quadratic-family"></a>

#### The locally soluble negative-Pell family

**ID:** `ArithmeticStatistics:ST.3/restricted-real-quadratic-family`. **Kind:** definition. **Proposed name:** `FieldStatistics.pellRadicands`.

D={d∈N:d>0, squarefree, and every prime divisor is2 or1 mod4}; D(X) uses d<X. D⁻ imposes an integer solution x²−dy²=−1. The unit radicand1 belongs to both sets but gives Q rather than a quadratic field, and is removed when assigning a class group. For r≥0, D_{2,r} is the d>1 subfamily with rk₄Cl⁺(Q(√d))=r. Ordering is by radicand; the discriminant is d when d≡1 mod4 and4d otherwise. The symmetric-matrix law P_Sym and the rectangular law P(m,n,j) are imported from ST.5.

Hypotheses: For the field/rank API d>1; all set definitions retain d=1.

Proof or construction:

1. Define D directly on integers; no arithmetic-field carrier is needed for its local and Pell tests.
2. Use the existing quadratic-field construction for d>1 and its narrow class group.
3. Use the exact discriminant conversion on each residue subfamily before comparing radicand and discriminant proportions.

Direct prerequisites: [ArithmeticStatistics:ST.3/prime-power-class-group-rank](#prime-power-class-group-rank); `ArithmeticStatistics:ST.5/symmetric-matrix-kernel-law`; `ArithmeticStatistics:ST.5/matrix-kernel-law-over-a-finite-field`.

Sources: [kp-pell](https://arxiv.org/pdf/2201.13424), §1,pp.1–2; §7.3,p.74.

Uses: KP §7.3 — Pins the arithmetic carrier of the narrow four-rank distribution.; Historical Pell bounds — Keeps the conjectural/proved proportions on the exact radicand family..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.pellRadicands` | The positive squarefree radicands with no prime divisor3 mod4. |
| `FieldStatistics.negativePellRadicands` | The soluble negative-Pell subfamily. |
| `FieldStatistics.pellRadicandsBelow` | Strict radicand truncation and its finite cardinal. |
| `FieldStatistics.pellRadicand_iff_local` | For d>1 squarefree, membership is equivalent to rational solubility of x²−dy²=−1. |
| `FieldStatistics.pellFourRankSlice` | The d>1 subfamily with native narrow four-rank r. |
| `FieldStatistics.pellDiscriminant` | d if d≡1 mod4, otherwise4d; comparison of orderings is made residue class by residue class. |

Unit tests:

- `FieldStatistics.pell_unit_radicand` (degenerate): 1 is in D and D⁻, but excluded from every four-rank slice.
- `FieldStatistics.pell_five` (computation): 5∈D⁻, witnessed by (x,y)=(2,1); its field discriminant is5.
- `FieldStatistics.pell_three` (non-example): 3∉D because3 mod4 is forbidden.
- `FieldStatistics.pell_two_height` (compatibility): 2∈D⁻ via(1,1), but its field discriminant is8, not2.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

Open proof/interface contracts: Original Pell bounds and height transfer.

<a id="negative-pell-historical-bounds"></a>

#### Historical negative-Pell proportion bounds

**ID:** `ArithmeticStatistics:ST.3/negative-pell-historical-bounds`. **Kind:** theorem. **Proposed name:** `FieldStatistics.negative_pell_historical_bounds`.

Put α=∏_{j≥1,j odd}(1−2^{-j}). The historical Fouvry–Klüners bounds are α≤liminf #D⁻(X)/#D(X)≤limsup #D⁻(X)/#D(X)≤2/3. Blomer’s cited bound is #D⁻(X)≫X/(log X)^0.62, and at each fixed positive number t of prime factors Cremona–Odoni gives liminf≥λ_t≥α. These are earlier theorems, not the 1−α limiting density; the limiting-density proof’s reflection/expansion machinery remains in its routed owner.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Import the earlier Pell/genus moment comparisons with their exact radicand ordering.
2. Use their finite-prime-factor and unrestricted-family lower/upper estimates separately.
3. Compare α with2/3 numerically only as a regression, not as a proof of the 1−α limiting density.

Direct prerequisites: [ArithmeticStatistics:ST.3/restricted-real-quadratic-family](#restricted-real-quadratic-family); [ArithmeticStatistics:ST.3/fk-main-coefficient](#fk-main-coefficient); `SieveMethodsAndPrimePatterns:SV.1`.

Sources: [kp-pell](https://arxiv.org/pdf/2201.13424), §1,p.2, citing FK1/Blomer/Cremona–Odoni.

Acceptance:

- The upper bound2/3 and lower productα leave room for the 1−α theorem; the historical inequalities are not its proof.

Suggested-file coverage: **omitted signature**. Needs the original historical Pell estimates with radicand ordering and the native counting comparison; the local Pell carrier above is native.

Open proof/interface contracts: Original Pell bounds and height transfer.

### Polynomial orders, local densities and field multiplicity

The order metric counts each real embedding and one representative from each complex pair. Monic orders use the power basis; binary orders use the ζ basis. Weak quasi-reduction means existence of a reduced basis after the permitted change. Strong quasi-reduction is uniqueness modulo independent signs. It fails on a positive-density quadratic family, so a polynomial density cannot establish the claimed field lower bound without a repaired multiplicity argument. Uniform binary coefficient dilation fixes 1 and scales the remaining basis vectors, rather than scaling the entire lattice. The quartic odd-prime density uses the corrected factor, independently checked modulo 9. The general lattice reduction theory is imported from current IntegralLattices, with a precise extension request for real Gram metrics.

<a id="polynomial-order-lattice-reduction"></a>

#### Order lattices and quasi-reduction

**ID:** `ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction`. **Kind:** construction. **Proposed name:** `FieldStatistics.monicOrderGram`.

For monic real g of degree n with nonzero discriminant, form A_g=R[X]/(g), its basis1,θ,…,θ^{n−1}, and the Z-span of that basis. For a real binary n-ic f with a₀≠0 and nonzero discriminant, put θ=X in R[X]/(f(X,1)) and ζ_k=Σ_{j=0}^{k−1}a_jθ^{k−j}; use1,ζ₁,…,ζ_{n−1}. The norm is the sum of the squares at real embeddings and |z|² for one embedding from each complex pair. A basis is Minkowski-reduced when at each step it minimizes norm among vectors extending the preceding vectors to a Z-basis. Monic quasi-reduction permits upper unitriangular integral basis changes; binary quasi-reduction permits an SL₂(Z) representative. Strong quasi-reduction means uniqueness of the reduced basis modulo independent signs. It is a separate condition. This Euclidean metric must not be replaced by the all-embeddings weighted metric.

Hypotheses: n≥2; real coefficients; nonzero discriminant; binary leading coefficient nonzero.

Proof or construction:

1. Construct the quotient-algebra basis and its embedding Gram matrix, counting each complex pair once.
2. Use the general real-lattice reduced-basis predicate; record the two allowed change groups separately.
3. For integral polynomials compare the lattice with the image of Z[X]/(g); for binary forms compare with the existing binary-form order of ST.1, requesting its general-degree extension.

Direct prerequisites: `mathlib:AdjoinRoot`; `ArithmeticStatistics:ST.1`; `mathlib:Matrix.SpecialLinearGroup`.

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), §5,pp.24–25; BSW II §7,pp.52–53; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §7,Lemma7.2,pp.52–53.

Uses: Monogenic field lower bounds — Supplies the bounded-multiplicity condition needed after the polynomial sieve.; Binary-form field lower bounds — Keeps its degree-n order and signed equivalence convention distinct..

API:

| Name | Contract |
| --- | --- |
| `FieldStatistics.monicOrderGram` | The embedding Gram matrix of the power basis with one complex representative. |
| `FieldStatistics.binaryOrderGram` | The embedding Gram matrix of1,ζ₁,…,ζ_{n−1}. |
| `FieldStatistics.IsMinkowskiReducedGram` | Successive norm minimization among integral vectors extending the fixed prefix to a unimodular basis. |
| `FieldStatistics.IsMonicQuasiReduced` | Some upper unitriangular integral change gives a reduced power basis. |
| `FieldStatistics.IsBinaryQuasiReduced` | Some SL₂(Z) representative has reduced displayed basis. |
| `FieldStatistics.IsStrongReducedGram` | Reduced Gram bases form exactly one orbit under independent signs. |
| `FieldStatistics.monicOrderGram_ring` | For integral monic g it is the Gram matrix on the native quotient ring Z[X]/(g). |
| `FieldStatistics.binaryOrderGram_ring` | For integral f it is the Gram matrix on the associated binary-form order. |
| `FieldStatistics.reduction_root_dilation` | The monic root dilation multiplies the jth basis vector byρ^j; uniform binary coefficient dilation fixes1 and multiplies every ζ_k byρ. |

Unit tests:

- `FieldStatistics.orderGram_x2_plus_one` (computation): For g=X²+1 the unweighted Gram matrix is diag(1,1), not diag(2,2).
- `FieldStatistics.orderGram_x2_minus_two` (computation): For g=X²−2 the Gram matrix is diag(2,4).
- `FieldStatistics.strong_sign_regression` (non-example): An independent sign change always preserves reducedness; literal unique ordered basis is impossible in positive rank.
- `FieldStatistics.binary_uniform_dilation` (boundary): Scaling f byρ leaves the root θ fixed, fixes basis vector1 and scales every other ζ_k byρ, so it is not a homothety of the whole lattice.

Suggested-file coverage: **partial native signature**. binaryOrderGram_ring needs the general-degree binary-form associated order and its zeta-basis comparison from ST.1. The explicit real Gram formula is native; it is not a replacement arithmetic order.

Exact omitted names: `FieldStatistics.binaryOrderGram_ring`.

Open proof/interface contracts: Real-metric lattice reduction supplier; Restricted polynomial densities and general binary-order interfaces.

<a id="squarefree-field-discriminant-sn"></a>

#### Squarefree field discriminants force the symmetric group

**ID:** `ArithmeticStatistics:ST.3/squarefree-field-discriminant-sn`. **Kind:** theorem. **Proposed name:** `FieldStatistics.squarefree_field_discriminant_sn`.

If K/Q has degree n≥2 and squarefree absolute field discriminant, its normal-closure permutation group is S_n. In particular an irreducible monic integral polynomial with squarefree polynomial discriminant defines a maximal order and an S_n field. For a binary form, the same conclusion requires its rank-n order and discriminant identity.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. The tame discriminant exponent1 at each ramified prime means inertia acts by a transposition.
2. The normal subgroup generated by all inertia has fixed field everywhere unramified over Q, hence trivial.
3. A transitive subgroup generated by transpositions is the full symmetric group; squarefree order discriminant also forces index1.

Direct prerequisites: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `ArithmeticStatistics:ST.1`; `ArithmeticStatistics:ST.2`.

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), §1,p.2; §5,p.26, citing the classical originals.

Acceptance:

- If K/Q has degree n≥2 and squarefree absolute field discriminant, its normal-closure permutation group is S_n. In particular an irreducible monic integral polynomial with squarefree polynomial discriminant defines a maximal order and an S_n field. For a binary form, the same conclusion requires its rank-n order and discriminant identity.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="monic-polynomial-sieve-counts"></a>

#### Monic polynomial squarefree and maximal-order counts

**ID:** `ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts`. **Kind:** theorem. **Proposed name:** `FieldStatistics.monic_polynomial_sieve_counts`.

For n≥2, put H(g)=max_{1≤i≤n}|a_i|^{1/i} and N=n(n+1)/2. The squarefree-discriminant count with H<X is λ_n2^nX^N+O_{n,ε}(X^{N−1/5+ε}), λ_n=∏_pλ_n(p)>0. The maximal-order count is ζ(2)^{-1}2^nX^N with the same error. Irreducibility may be imposed with a smaller error. In a fixed signature/regular weighted-homogeneous real region and a κ-acceptable local family, replace the coefficient by the real volume times the local product, and the error by O(X^{N−min(1/(2κ),1/5)+ε}); κ≥2.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Count each congruence class in the weighted coefficient box and truncate Möbius inversion at X^{1/κ}.
2. Use the ST.2 weak/strong divisibility tail to control the omitted moduli.
3. Sum the convergent local factors and use the quantitative reducibility bound; include the region-boundary estimate for each signature.

Direct prerequisites: `ArithmeticStatistics:ST.2`; `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`.

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Theorems1.1–1.2,(4),pp.1–3; Theorem4.1 and §4.2,pp.20–23.

Acceptance:

- For n≥2, put H(g)=max_{1≤i≤n}|a_i|^{1/i} and N=n(n+1)/2. The squarefree-discriminant count with H<X is λ_n2^nX^N+O_{n,ε}(X^{N−1/5+ε}), λ_n=∏_pλ_n(p)>0. The maximal-order count is ζ(2)^{-1}2^nX^N with the same error. Irreducibility may be imposed with a smaller error. In a fixed signature/regular weighted-homogeneous real region and a κ-acceptable local family, replace the coefficient by the real volume times the local product, and the error by O(X^{N−min(1/(2κ),1/5)+ε}); κ≥2.

Suggested-file coverage: **omitted signature**. Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

<a id="monic-weak-quasi-reduction"></a>

#### Density-one weak quasi-reduction

**ID:** `ArithmeticStatistics:ST.3/monic-weak-quasi-reduction`. **Kind:** theorem. **Proposed name:** `FieldStatistics.monic_weak_quasi_reduction`.

For a separable monic real g, define g_ρ(X)=ρ^n g(X/ρ),ρ>0. For all sufficiently largeρ, g_ρ is quasi-reduced. Uniformly on compact regular subsets away from zero discriminant this implies density-one quasi-reduction of monic integer polynomials ordered by H. It does not imply density-one strong quasi-reduction; the latter assertion in Lemma5.3 is false already in degree2.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Root expansion sends θ^j toρ^jθ^j and separates successive Gram–Schmidt lengths.
2. Use the general reduced-basis criterion for well-separated bases; make the bound uniform on a compact set with positive continuous lengths.
3. Exhaust the coefficient unit box by compact regular subsets and apply lattice-point counting. Do not infer uniqueness of shortest-vector choices.

Direct prerequisites: [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction); `ArithmeticStatistics:ST.2`.

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Lemmas5.2–5.3,pp.24–25, corrected weak conclusion.

Acceptance:

- For a separable monic real g, define g_ρ(X)=ρ^n g(X/ρ),ρ>0. For all sufficiently largeρ, g_ρ is quasi-reduced. Uniformly on compact regular subsets away from zero discriminant this implies density-one quasi-reduction of monic integer polynomials ordered by H. It does not imply density-one strong quasi-reduction; the latter assertion in Lemma5.3 is false already in degree2.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

Open proof/interface contracts: Real-metric lattice reduction supplier.

<a id="strong-reduction-ring-fibres"></a>

#### Ring fibres of strongly reduced generators

**ID:** `ArithmeticStatistics:ST.3/strong-reduction-ring-fibres`. **Kind:** theorem. **Proposed name:** `FieldStatistics.strong_reduction_ring_fibres`.

For irreducible integral monic g,g* of degree n≥2 with trace zero, nonzero discriminant and strong quasi-reduction, an isomorphism Z[X]/(g)≃Z[X]/(g*) forces g*(X)=g(X) or(−1)^n g(−X). For binary n-ic forms, n≥3, after choosing strongly reduced SL₂(Z) representatives, an isomorphism of their associated orders forces f*(x,y)=εs^n f(sx,y), ε,s∈{±1}. There are at most four such reduced sign alternatives; the overall sign for even n need not be an ordinary GL₂(Z) substitution.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. A ring isomorphism preserves the unweighted embedding metric and sends the unique sign-orbit of reduced bases to itself.
2. The first nonconstant monic basis vector gives θ↦±θ*+c. Trace zero forces c=0.
3. In the binary case compare ζ₁ and ζ₂, using the independence of θ*,θ*², then recover the remaining coefficients and the two possible signs.

Direct prerequisites: [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction).

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Lemma5.1,p.24, corrected; BSW II Lemma7.2,pp.52–53; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Lemma7.2,pp.52–53.

Acceptance:

- Odd degree has the monic reflected representative−g(−x); binary representatives also require the independent overall sign.

Suggested-file coverage: **partial native signature**. Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

<a id="trace-restricted-polynomial-sieve"></a>

#### The trace-restricted polynomial sieve target

**ID:** `ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve`. **Kind:** theorem. **Proposed name:** `FieldStatistics.trace_restricted_polynomial_sieve`.

For fixed n≥2 the source’s trace-zero slice has squarefree density κ_n=∏_pκ_n(p), with each factor the probability of p²∤Δ on a₁=0. The product is not universally positive: κ₂(2)=κ₂=0 since Δ(X²+a₂)=−4a₂. The band0≤a₁<n requires its own restricted tail estimate and local-factor comparison; integral translation alone does not prove that its density is λ_n. For n=1 the trace-zero slice consists ofX with discriminant1.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Request the codimension-one sieve with its exact height and boundary constants.
2. Compute the p-adic local factors on the actual affine slice and check positivity independently.
3. For the trace band retain each residue of a₁ and use a uniform restricted tail; compare the resulting constants rather than using unrestricted density.

Direct prerequisites: [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](#monic-polynomial-sieve-counts); `ArithmeticStatistics:ST.2`.

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Theorem5.4,p.25.

Acceptance:

- For n=2, a₁=0 gives Δ=−4a₂, so κ₂=0. Universal positivity fails.

Suggested-file coverage: **omitted signature**. Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

Open proof/interface contracts: Restricted polynomial densities and general binary-order interfaces.

<a id="short-generator-field-upper-bound"></a>

#### The short-generator field upper bound

**ID:** `ArithmeticStatistics:ST.3/short-generator-field-upper-bound`. **Kind:** theorem. **Proposed name:** `FieldStatistics.short_generator_field_upper_bound`.

For degree n≥2, the number of Q-isomorphism classes having an integral generator α with maximum archimedean absolute value≤Y is O_n(Y^{(n−1)(n+2)/2}),Y≥1. Translate α by an integer so0≤a₁<n, and then |a_i|≪_nY^i for2≤i≤n. This supplies an upper bound only; a polynomial count requires bounded field multiplicity for a lower bound.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Use the conjugate bound to control the elementary symmetric coefficients.
2. Remove the trace coefficient by bounded integral translation; root norms remain O_n(Y).
3. Count the remaining coefficient box, with exponent2+…+n.

Direct prerequisites: `ArithmeticStatistics:ST.3/number-field-counting-function`.

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), §5,proof of Corollary1.4,pp.26–27; Ellenberg–Venkatesh Remark3.3.

Acceptance:

- At n=2 the exponent is2; at n=3 it is5. These are generator-height counts, not discriminant counts.

Suggested-file coverage: **native signature**. Native object/signature and every listed API/test are present; mathematical proofs remain unchecked.

<a id="monogenic-field-lower-bound-target"></a>

#### The monogenic field lower-bound targets

**ID:** `ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target`. **Kind:** theorem. **Proposed name:** `FieldStatistics.monogenic_field_lower_bound_target`.

The source targets are N_n^{monogenic,S_n}(X)≫X^{1/2+1/n}, and the short-generator S_n-field count≫Y^{(n−1)(n+2)/2}. Fixed compatible signature and finitely many local monogeneity conditions have the same exponents. Their extracted proof remains open: use a positive regular trace-band/slice family, a quantitative squarefree sieve, and a uniform bounded field multiplicity replacing the false density-one strong uniqueness claim.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Supply the positive restricted sieve on a regular family.
2. Prove a replacement bounded-multiplicity theorem on that family, modulo α↦±α+c.
3. Use |Δ(g)|≪H(g)^{n(n−1)} and a valid root bound, then translate the polynomial exponent2+…+n into the asserted field exponents.

Direct prerequisites: [ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve](#trace-restricted-polynomial-sieve); [ArithmeticStatistics:ST.3/strong-reduction-ring-fibres](#strong-reduction-ring-fibres); [ArithmeticStatistics:ST.3/squarefree-field-discriminant-sn](#squarefree-field-discriminant-sn); [ArithmeticStatistics:ST.3/short-generator-field-upper-bound](#short-generator-field-upper-bound).

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Corollaries1.3–1.4,pp.2–3; proof §5,pp.25–27.

Acceptance:

- The degree3 discriminant exponent is5/6; polynomial density alone does not establish this field lower bound.

Suggested-file coverage: **omitted signature**. Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

Open proof/interface contracts: Polynomial-to-field bounded multiplicity.

<a id="monogenic-field-asymptotic-prediction"></a>

#### The monogenic-field asymptotic prediction

**ID:** `ArithmeticStatistics:ST.3/monogenic-field-asymptotic-prediction`. **Kind:** theorem. **Proposed name:** `FieldStatistics.monogenic_field_asymptotic_prediction`.

For n≥2, BSW Remark5.6 predicts that the monogenic degree-n field count is asymptotic to nC_n/(2ζ(2))X^{1/2+1/n}, where C_n is the(n−1)-dimensional volume of the trace-zero coefficient region |Δ|<1. It also predicts a positive proportion of trace-band polynomial models have H=O(X^{1/(n(n−1))}). These are conjectural predicates: finite volume, cusp control and asymptotic uniqueness modulo±translation are proof obligations, not consequences of the lower bound.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Specify the exact height, monogenic-field family and normalized trace-zero Lebesgue measure.
2. State the two predictions separately and retain the factor1/2 from generator sign.
3. Import no assertion of the prediction without a proof of cusp control and generator multiplicity.

Direct prerequisites: [ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target](#monogenic-field-lower-bound-target); `ArithmeticStatistics:ST.0/relative-density`.

Sources: [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Remark5.6,(42),p.26.

Acceptance:

- For n≥2, BSW Remark5.6 predicts that the monogenic degree-n field count is asymptotic to nC_n/(2ζ(2))X^{1/2+1/n}, where C_n is the(n−1)-dimensional volume of the trace-zero coefficient region |Δ|<1. It also predicts a positive proportion of trace-band polynomial models have H=O(X^{1/(n(n−1))}). These are conjectural predicates: finite volume, cusp control and asymptotic uniqueness modulo±translation are proof obligations, not consequences of the lower bound.

Suggested-file coverage: **omitted signature**. Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

<a id="binary-discriminant-local-factors"></a>

#### Binary-form squarefree and maximal local factors

**ID:** `ArithmeticStatistics:ST.3/binary-discriminant-local-factors`. **Kind:** theorem. **Proposed name:** `FieldStatistics.binary_discriminant_local_factors`.

For squarefree discriminants α₂(2)=1/2 and α_n(2)=3/8 for n≥3. At odd p, α₂(p)=(1−p⁻¹)(1+p⁻¹−p⁻³), α₃(p)=(1−p⁻¹)²(1+p⁻¹)² and α_n(p)=(1−p⁻¹)²(1+p⁻¹)(1+p⁻¹−p⁻²) for all n≥4. For maximal orders β₂(p)=1−p⁻²−p⁻³+p⁻⁴ and β_n(p)=(1−p⁻²)(1−p⁻³) for n≥3. The corrected quartic squarefree factor at3 is176/243, with42,768 good coefficient tuples among9⁵ modulo9.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Partition by the first coefficient not divisible by p; include the double root at infinity and all lifts modulo p².
2. Use the corrected monic discriminant-valuation counts, not the erroneous n=4 expression in AppendixA.1.
3. For maximality use coprime Hensel factors and the local maximal-order criterion, separating the zero reduction.
4. Enumerate the quartic discriminant polynomial modulo9 as a finite regression certificate; do not claim one finite check proves every prime.

Direct prerequisites: `ArithmeticStatistics:ST.1`; `ArithmeticStatistics:ST.2`.

Sources: [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), AppendixA,PropositionsA.1–A.2,pp.53–55, corrected at n=4.

Acceptance:

- Modulo9 the quartic count is42768/59049=176/243, and modulo4 it is384/1024=3/8.

Suggested-file coverage: **partial native signature**. Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

<a id="binary-form-sieve-counts"></a>

#### Binary-form density and power-saving targets

**ID:** `ArithmeticStatistics:ST.3/binary-form-sieve-counts`. **Kind:** theorem. **Proposed name:** `FieldStatistics.binary_form_sieve_counts`.

For n≥2, in the coefficient box H(f)<X the squarefree-discriminant count is α_n(2X)^{n+1}+O_{n,ε}(X^{n+1−η_n+ε}) and the maximal-order count is β_n(2X)^{n+1} with the same error, where η_n=1/(2n) for odd n and1/(88n⁶) for even n. Here α_n=∏_pα_n(p) and β_n=∏_pβ_n(p); for n≥3 β_n=ζ(2)^{-1}ζ(3)^{-1}. Finite congruence specifications change the local factors; regular real regions change the volume. The even-degree tail gaps and the separate n=2 sieve are explicit inputs.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Truncate Möbius inversion using the corrected ST.2 weak/strong tail contract.
2. Count translates of m²N²Z^{n+1} and sum every boundary error before choosing the cutoff.
3. Apply the corrected local-factor formulas; remove reducible forms by a quantitative estimate.
4. For a region/specific signature prove its Jordan regularity and uniform tail separately.

Direct prerequisites: [ArithmeticStatistics:ST.3/binary-discriminant-local-factors](#binary-discriminant-local-factors); `ArithmeticStatistics:ST.2`.

Sources: [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorems1–2 and6,pp.2–4; §7,Theorem7.1,pp.51–52.

Acceptance:

- For n≥2, in the coefficient box H(f)<X the squarefree-discriminant count is α_n(2X)^{n+1}+O_{n,ε}(X^{n+1−η_n+ε}) and the maximal-order count is β_n(2X)^{n+1} with the same error, where η_n=1/(2n) for odd n and1/(88n⁶) for even n. Here α_n=∏_pα_n(p) and β_n=∏_pβ_n(p); for n≥3 β_n=ζ(2)^{-1}ζ(3)^{-1}. Finite congruence specifications change the local factors; regular real regions change the volume. The even-degree tail gaps and the separate n=2 sieve are explicit inputs.

Suggested-file coverage: **omitted signature**. Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

Open proof/interface contracts: Restricted polynomial densities and general binary-order interfaces.

<a id="binary-form-arithmetic-bertini"></a>

#### Arithmetic Bertini for the projective line over Z

**ID:** `ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini`. **Kind:** theorem. **Proposed name:** `FieldStatistics.binary_form_arithmetic_bertini`.

For each fixed n≥3 in the binary n-ic coefficient-box ordering, the density of regular effective degree-n hyperplane sections of P¹_Z is ζ(2)^{-1}ζ(3)^{-1}. The equivalence with maximality of the associated finite flat rank-n order includes the scheme/ring comparison. Degree2 has a different density; this does not prove the general higher-dimensional arithmetic Bertini conjecture.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Identify the section with the finite flat algebra of the binary-form order.
2. For finite flat orders in number fields, regularity is equivalent to local maximality.
3. Use the binary maximal-order density and ζ_{P¹_Z}(s)=ζ(s)ζ(s−1).

Direct prerequisites: [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts); `ArithmeticStatistics:ST.1`.

Sources: [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §1,p.3, referring to Poonen §5/Theorem5.1.

Acceptance:

- For each fixed n≥3 in the binary n-ic coefficient-box ordering, the density of regular effective degree-n hyperplane sections of P¹_Z is ζ(2)^{-1}ζ(3)^{-1}. The equivalence with maximality of the associated finite flat rank-n order includes the scheme/ring comparison. Degree2 has a different density; this does not prove the general higher-dimensional arithmetic Bertini conjecture.

Suggested-file coverage: **omitted signature**. Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

Open proof/interface contracts: Restricted polynomial densities and general binary-order interfaces.

<a id="binary-form-field-lower-bound-target"></a>

#### The binary-form field lower-bound target

**ID:** `ArithmeticStatistics:ST.3/binary-form-field-lower-bound-target`. **Kind:** theorem. **Proposed name:** `FieldStatistics.binary_form_field_lower_bound_target`.

For every n≥3 the source targets an isomorphism-class lower bound≫X^{1/2+1/(n−1)} for S_n fields with squarefree discriminant. Its proposed construction needs a regular positive-volume family B, a sieve uniform on tB, and a uniform bounded multiplicity of the associated maximal-order fields. Openness of strong quasi-reduction at one form does not establish strong quasi-reduction on every dilation tB.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Construct a regular family with compatible signature and positive local density.
2. Prove strong reduction uniformly along its dilations, or supply a replacement bounded-multiplicity result modulo the four sign alternatives.
3. Apply the region sieve at t=X^{1/(2n−2)}, and use the degree2n−2 discriminant homogeneity to obtain the exponent(n+1)/(2n−2).

Direct prerequisites: [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction); [ArithmeticStatistics:ST.3/strong-reduction-ring-fibres](#strong-reduction-ring-fibres); [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts); [ArithmeticStatistics:ST.3/squarefree-field-discriminant-sn](#squarefree-field-discriminant-sn).

Sources: [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem3,p.3; proof §7,p.53.

Acceptance:

- At n=3 the target exponent is1. The positive-volume, uniform-dilation and multiplicity obligations all remain necessary.

Suggested-file coverage: **omitted signature**. Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

Open proof/interface contracts: Polynomial-to-field bounded multiplicity.

<a id="unramified-alternating-extension-lower-bound-target"></a>

#### The unramified alternating-extension lower-bound target

**ID:** `ArithmeticStatistics:ST.3/unramified-alternating-extension-lower-bound-target`. **Kind:** theorem. **Proposed name:** `FieldStatistics.unramified_alternating_extension_lower_bound_target`.

For n≥3 the source targets≫X^{(n+1)/(2n−2)} unramified A_n-extensions over real quadratic fields, and separately over imaginary quadratic fields, with base discriminant absolute value<X. Its restoration of Nakagawa’s withdrawn results requires the original extension correspondence, rigidity/multiplicity calculation and the corrected binary tail; it is not inferred solely from the field-count lower bound.

Hypotheses: All fields have characteristic zero; all asymptotics are for the fixed family as X tends to infinity.

Proof or construction:

1. Read the original binary-form/unramified-extension parametrization with its infinity conditions.
2. Reconcile its quadratic resolvent discriminant and isomorphism multiplicities with the statistical carrier.
3. Insert the corrected tail and regular-region estimate and sum the two signatures separately.

Direct prerequisites: [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts); [ArithmeticStatistics:ST.3/binary-form-field-lower-bound-target](#binary-form-field-lower-bound-target); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Sources: [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem4,p.3, citing Nakagawa’s two papers and their corrections.

Acceptance:

- For n≥3 the source targets≫X^{(n+1)/(2n−2)} unramified A_n-extensions over real quadratic fields, and separately over imaginary quadratic fields, with base discriminant absolute value<X. Its restoration of Nakagawa’s withdrawn results requires the original extension correspondence, rigidity/multiplicity calculation and the corrected binary tail; it is not inferred solely from the field-count lower bound.

Suggested-file coverage: **omitted signature**. Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

Open proof/interface contracts: Nakagawa restoration.

## Accepted targets retained by exact ID

The following targets are imported rather than declared again. Each row states the additional contracts this part supplies; it does not erase the parent’s qualifications.

| Accepted target | New contracts | Remaining named gaps |
| --- | --- | --- |
| `ArithmeticStatistics:ST.3/number-field-counting-function` | [ArithmeticStatistics:ST.3/rigid-embedded-field-family](#rigid-embedded-field-family); [ArithmeticStatistics:ST.3/schmidt-field-count-bound](#schmidt-field-count-bound); [ArithmeticStatistics:ST.3/all-fields-degree-at-most-five](#all-fields-degree-at-most-five) | Abelian and classical counting originals |
| `ArithmeticStatistics:ST.3/torsion-count-of-class-groups` | [ArithmeticStatistics:ST.3/prime-power-class-group-rank](#prime-power-class-group-rank); [ArithmeticStatistics:ST.3/relative-torsion-splitting](#relative-torsion-splitting) |  |
| `ArithmeticStatistics:ST.3/splitting-symbol-and-local-sets-of-binary-cubic-forms` | [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation) |  |
| `ArithmeticStatistics:ST.3/splitting-symbol-determines-the-reduction-mod-p` | [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation) |  |
| `ArithmeticStatistics:ST.3/densities-of-splitting-types` | [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation) |  |
| `ArithmeticStatistics:ST.3/densities-of-splitting-types-of-maximal-forms` | [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation) |  |
| `ArithmeticStatistics:ST.3/densities-of-maximal-and-nowhere-totally-ramified-forms` | [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation) |  |
| `ArithmeticStatistics:ST.3/maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields` | [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](#low-degree-s-integral-parametrization) |  |
| `ArithmeticStatistics:ST.3/davenport-heilbronn-count-of-cubic-fields` | [ArithmeticStatistics:ST.3/refined-cubic-sieve](#refined-cubic-sieve) |  |
| `ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent` | [ArithmeticStatistics:ST.3/cubic-conductor-discriminant](#cubic-conductor-discriminant); [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios) | Ring-class conductor normalization |
| `ArithmeticStatistics:ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields` | [ArithmeticStatistics:ST.3/cubic-conductor-discriminant](#cubic-conductor-discriminant); [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios) | Ring-class conductor normalization |
| `ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse` | [ArithmeticStatistics:ST.3/cubic-large-total-ramification-bound](#cubic-large-total-ramification-bound) |  |
| `ArithmeticStatistics:ST.3/squarefree-integers-in-residue-classes-modulo-four` |  |  |
| `ArithmeticStatistics:ST.3/count-of-quadratic-fields` |  |  |
| `ArithmeticStatistics:ST.3/davenport-heilbronn-mean-of-three-torsion` | [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios) |  |
| `ArithmeticStatistics:ST.3/acceptable-local-specifications-for-cubic-orders` | [ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral](#cubic-secondary-orbit-integral) | Native cubic secondary density interface |
| `ArithmeticStatistics:ST.3/p-adic-density-of-a-local-specification` | [ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral](#cubic-secondary-orbit-integral) | Native cubic secondary density interface |
| `ArithmeticStatistics:ST.3/density-of-cubic-orders-with-local-specifications` | [ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient](#secondary-cubic-lattice-coefficient); [ArithmeticStatistics:ST.3/refined-cubic-sieve](#refined-cubic-sieve) |  |
| `ArithmeticStatistics:ST.3/roberts-second-order-term-for-cubic-fields` | [ArithmeticStatistics:ST.3/refined-cubic-sieve](#refined-cubic-sieve); [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation) |  |
| `ArithmeticStatistics:ST.3/second-order-term-for-the-mean-of-three-torsion` | [ArithmeticStatistics:ST.3/refined-cubic-sieve](#refined-cubic-sieve); [ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation](#cubic-secondary-local-factor-evaluation) |  |
| `ArithmeticStatistics:ST.3/second-order-term-for-cubic-orders-with-local-specifications` | [ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral](#cubic-secondary-orbit-integral); [ArithmeticStatistics:ST.3/refined-cubic-sieve](#refined-cubic-sieve) | Native cubic secondary density interface |
| `ArithmeticStatistics:ST.3/mertens-count-of-positive-definite-binary-quadratic-forms` |  | Classical binary quadratic orbit counts |
| `ArithmeticStatistics:ST.3/siegel-count-of-indefinite-binary-quadratic-forms` |  | Classical binary quadratic orbit counts |
| `ArithmeticStatistics:ST.3/quoted-classical-counts-for-binary-quadratic-and-cubic-forms` |  | Classical binary quadratic orbit counts |
| `ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields` | [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](#low-degree-s-integral-parametrization); [ArithmeticStatistics:ST.3/low-degree-maximal-sieve](#low-degree-maximal-sieve); [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](#low-degree-jacobian-mass) |  |
| `ArithmeticStatistics:ST.3/bhargava-count-of-quintic-fields` | [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](#low-degree-s-integral-parametrization); [ArithmeticStatistics:ST.3/low-degree-maximal-sieve](#low-degree-maximal-sieve); [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](#low-degree-jacobian-mass) |  |
| `ArithmeticStatistics:ST.3/bhargava-shankar-wang-counts-over-number-fields` | [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](#low-degree-s-integral-parametrization); [ArithmeticStatistics:ST.3/low-degree-maximal-sieve](#low-degree-maximal-sieve); [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](#low-degree-jacobian-mass) |  |
| `ArithmeticStatistics:ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups` | [ArithmeticStatistics:ST.3/quartic-class-group-two-torsion-fibre](#quartic-class-group-two-torsion-fibre); [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios) |  |
| `ArithmeticStatistics:ST.3/fouvry-kluners-moments-of-four-ranks` | [ArithmeticStatistics:ST.3/quadratic-four-rank-conic-formula](#quadratic-four-rank-conic-formula); [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](#fk-maximal-unlinked-support); [ArithmeticStatistics:ST.3/fk-main-coefficient](#fk-main-coefficient); [ArithmeticStatistics:ST.3/rank-moments-determine-rank-law](#rank-moments-determine-rank-law) | Geometric-zero growth lemma |
| `ArithmeticStatistics:ST.3/cohen-lenstra-moment-prediction` | [ArithmeticStatistics:ST.3/rank-moments-determine-rank-law](#rank-moments-determine-rank-law) | Geometric-zero growth lemma |
| `ArithmeticStatistics:ST.3/malle-invariants-of-a-permutation-group` | [ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily](#kluners-cyclotomic-subfamily) | Abelian and classical counting originals |
| `ArithmeticStatistics:ST.3/malle-conjecture` | [ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily](#kluners-cyclotomic-subfamily) | Abelian and classical counting originals |
| `ArithmeticStatistics:ST.3/kluners-counterexample-to-malle-conjecture` | [ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily](#kluners-cyclotomic-subfamily) | Abelian and classical counting originals |

## Supplier requests

**R1 — `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.** Export the anti-invariant cyclic cubic/ring-class correspondence and conductor–discriminant identity for the S₃ representation, including the condition at real places. For the fixed-resolvent count, export Cohen–Morra Theorem6.1’s finite ray-class character sum, including its wild3 factors and the holomorphic nontrivial-character contribution of §7.3; distinguish the pure-cubic double pole.

Consumers: [ArithmeticStatistics:ST.3/cubic-conductor-discriminant](#cubic-conductor-discriminant), [ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count](#fixed-resolvent-cubic-count).

**R2 — `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.** Export the conductor exact sequence for Pic(Z+f O_K) and its finite residue-unit kernel; import the existing proper-invertible-ideal carrier.

Consumers: [ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound](#quadratic-order-three-torsion-bound).

**R3 — `ArithmeticStatistics:ST.2`.** Export BST Theorem27’s slicing/Mellin calculation, regular-domain root-weighted estimate (91), and Lemma34’s bound N(Z_n;X)≪3^{ω(n)}X/n². These are geometry and uniformity inputs; this packet supplies their statistical assembly.

Consumers: [ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient](#secondary-cubic-lattice-coefficient), [ArithmeticStatistics:ST.3/refined-cubic-sieve](#refined-cubic-sieve).

**R4 — `AdelicAlgebraicGroups:AA.0`.** Export the finite double-coset decomposition for the BSW reductive groups over a number field, with their induced integral lattices.

Consumers: [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](#low-degree-s-integral-parametrization).

**R5 — `AdelicAlgebraicGroups:AA.2`.** Export the canonical Tamagawa measure and τ(G_n)=1 for the four explicit BSW groups, compatible with the determinant character and Dedekind zeta residue.

Consumers: [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](#low-degree-jacobian-mass).

**R6 — `ArithmeticStatistics:ST.2`.** Export BSW Theorem4.7 with cusp and nongeneric contributions o_F(X), and the codimension-two geometric sieve for bounded semialgebraic fundamental-domain regions. The complementary local probability is 1−1/Aut(τ), not 1/Aut(τ).

Consumers: [ArithmeticStatistics:ST.3/low-degree-maximal-sieve](#low-degree-maximal-sieve).

**R7 — `SieveMethodsAndPrimePatterns:SV.2`.** Supply the two quadratic Jacobi bilinear estimates in FK Lemmas14–15, pp.13–14, with squarefree coefficient support, both symmetric size parameters and the dependence on the prime-factor cutoff.

Consumers: [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](#fk-maximal-unlinked-support).

**R8 — `AnalyticNumberTheory:AN.2`.** Supply the FK Lemma13 Siegel–Walfisz estimate for primitive real characters, with its √q dependence, and equidistribution in the fixed moduli4 and8 used in Lemma19.

Consumers: [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](#fk-maximal-unlinked-support).

**R9 — `AnalyticNumberTheory:AN.5`.** Supply the squarefree multiplicative mean-value and short-interval estimates of FK Lemmas11–12, pp.12–13, for weights γ^{ω(n)}, uniformly in the dissection parameters.

Consumers: [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](#fk-maximal-unlinked-support).

**R10 — `SieveMethodsAndPrimePatterns:SV.1`.** Supply the bound O(X/√log X) for integers supported on2 and primes1 mod4, as used in FK Corollary1.

Consumers: [ArithmeticStatistics:ST.3/fk-narrow-wide-moment-comparison](#fk-narrow-wide-moment-comparison).

**R11 — `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.** As EffectiveBounds, Part II, supply the relative EV small-split-prime torsion bound (LOWW Lemma2.1, corrected d=[L:K] and positive prime exponents), the absolute/relative trivial torsion bounds, h₂(F)≪D_F^εh₂(k)^{[F:k]} for2-extensions, and the BSTTTZ nontrivial2-torsion saving used in Theorem8.1.

Consumers: [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](#uniform-small-degree-field-bound), [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](#relative-three-torsion-piecewise-bound), [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](#quadratic-tower-torsion-tail), [ArithmeticStatistics:ST.3/thin-two-group-torsion](#thin-two-group-torsion), [ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean](#relative-wreath-three-torsion-mean).

**R12 — `tauceti:Completed/EffectiveBounds#layer-3-regulators-and-unit-lattice-volume`.** As EffectiveBounds, Part II, supply the relative regulator lower bound R_L/R_K≫_{[L:Q]}1 of Friedman–Skoruppa, together with the norm-cokernel bound needed in the relative class-group estimate.

Consumers: [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](#relative-three-torsion-piecewise-bound).

**R13 — `AnalyticNumberTheory:AN.8`.** Export the cubic Shintani order series and its dual, with |Aut R|^{-1} coefficients, simple poles1 and5/6, exact residues, gamma factors, functional equation, ξ_F(0)=0 when [F:Q]≥2, and the dual-series convexity bound of LOWW Proposition3.7/Lemmas3.8–3.10.

Consumers: [ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound](#shintani-cubic-order-uniform-bound).

**R14 — `AnalyticNumberTheory:AN.4`.** Export uniform Dedekind-zeta residue and convexity bounds, the smoothed Perron ideal upper bound, and the ideal lower bound for T≥C D_F^{1/2+δ}κ_F^{-1}; constants with Brauer–Siegel input are ineffective.

Consumers: [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](#uniform-small-degree-field-bound), [ArithmeticStatistics:ST.3/relative-three-torsion-propagation](#relative-three-torsion-propagation), [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](#relative-three-torsion-piecewise-bound).

**R15 — `AnalyticNumberTheory:AN.3`.** Export LOWW Theorem4.2 quadratic Hecke zero-density sum over conductor norm≤Q, plus Lemmas4.3–4.4 split-prime estimates outside O_ε(D_F^εX^ε) exceptional quadratic extensions, uniformly in degree and base discriminant.

Consumers: [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](#quadratic-tower-torsion-tail), [ArithmeticStatistics:ST.3/thin-two-group-torsion](#thin-two-group-torsion).

**R16 — `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.** Export the native maximal everywhere-unramified, infinity-split extension and its profinite Galois group, continuous finite quotients, normal-closure wreath embedding, local inertia generation, and equivariant class-group/abelian-unramified-extension correspondence.

Consumers: [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface), [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](#nonabelian-admissibility-and-abelianization), [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator), [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products).

**R17 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`.** Extend the Tauberian interface to the higher-pole Delange conclusion: nonnegative Dirichlet coefficients with pole order m have main term G(1)X(log X)^{m−1}/(m−1)!; retain the domain and lower-order singularities needed for Wood §7. The same exact higher-pole interface handles the pure-cubic conductor series; retain its simple/double-pole distinction and the conductor-to-discriminant translation.

Consumers: [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence), [ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count](#fixed-resolvent-cubic-count).

**R18 — `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`.** As EffectiveBounds, Part II, supply the ring-of-integers largest successive-minimum bound O_n(D_K^{1/n}), bounded-height basis, trace-zero lattice covolume/Minkowski bound, the refined relative primitive extension bound with its base-discriminant saving, and the exact cubic two-torsion exponent of BSTTTZ. Here Set α=√3/2, β=((1+α)/(2α))log((1+α)/(2α))−((1−α)/(2α))log((1−α)/(2α)), and a=1/(6(1−β/log2)); thus a≈0.2784. The pointwise bound retains an arbitrary positive exponent loss.

Consumers: [ArithmeticStatistics:ST.3/small-trace-zero-element](#small-trace-zero-element), [ArithmeticStatistics:ST.3/schmidt-field-count-bound](#schmidt-field-count-bound), [ArithmeticStatistics:ST.3/lemke-oliver-thorne-field-bound](#lemke-oliver-thorne-field-bound), [ArithmeticStatistics:ST.3/galois-field-three-eighths-bound](#galois-field-three-eighths-bound), [ArithmeticStatistics:ST.3/quartic-torsion-counting-applications](#quartic-torsion-counting-applications).

**R19 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.** Export partial summation for discrete positive field weights and discriminant-ordered counting measures; the dyadic form here is sufficient.

Consumers: [ArithmeticStatistics:ST.3/weighted-cubic-partial-summation](#weighted-cubic-partial-summation).

**R20 — `SieveMethodsAndPrimePatterns:SV.5`.** Export KM Theorem1 for the unit-square-invariant joint ideal spin, nonempty S with S∩S⁻¹=∅, and its saving δ/(54|S|²n(12n+1)). Keep C_{|S|n} as a hypothesis. Supply the norm/residue compatibility used in §5.

Consumers: [ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion](#sixteen-rank-spin-criterion), [ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field](#no-sixteen-rank-governing-field).

**R21 — `ExponentialSumsAndCircleMethod:ES.0`.** Export the named conditional C_n predicate of KM §2.5: for every ε>0 all real nonprincipal characters of modulus q≤Q and intervals N≤Q^{1/n} have bound C(n,ε)Q^{(1−δ(n))/n+ε}, with δ(n)>0. Do not assert C_n for n≥4.

Consumers: [ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field](#no-sixteen-rank-governing-field).

**R22 — `ArithmeticStatistics:ST.2`.** Export the BSW I κ-acceptable weighted-box sieve and its trace-zero/trace-band restricted tails; export BSW II Theorem5 and Corollary6.27 after the reviewed even-degree errors E3/E18 are resolved, with a separate n=2 proof. For signatures use an explicitly regular real region and retain every boundary term.

Consumers: [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](#monic-polynomial-sieve-counts), [ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve](#trace-restricted-polynomial-sieve), [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts), [ArithmeticStatistics:ST.3/monic-weak-quasi-reduction](#monic-weak-quasi-reduction).

**R23 — `ArithmeticStatistics:ST.1`.** Export the general degree-n binary-form order on its native quotient algebra, its ζ basis, discriminant and GL₂ transport laws; the accepted cubic/quartic constructions are imported, not repeated.

Consumers: [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction), [ArithmeticStatistics:ST.3/binary-discriminant-local-factors](#binary-discriminant-local-factors), [ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini](#binary-form-arithmetic-bertini).

**R24 — `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`.** Use the existing rational Hasse–Minkowski isotropy criterion to prove the squarefree-divisor conic test; retain every infinity and prime2 condition.

Consumers: [ArithmeticStatistics:ST.3/quadratic-four-rank-conic-formula](#quadratic-four-rank-conic-formula), [ArithmeticStatistics:ST.3/restricted-real-quadratic-family](#restricted-real-quadratic-family).

## Gaps and closure criteria

These are the exact work items needed to close the stage; imported supplier targets remain owned by their suppliers. The planning pass covers every target while keeping these unresolved inputs visible.

**G1 — Geometric-zero growth lemma.** DJ Lemma3 uses the lower bound for an entire function with zeros at p^k from FK06 Lemma6. The DJ argument is read, but the original Jensen/product proof was not obtained. Supply that exact analytic input, with vanishing order and growth constants, before declaring rank-law uniqueness closed.

Needed by: [ArithmeticStatistics:ST.3/rank-moments-determine-rank-law](#rank-moments-determine-rank-law).

**G2 — Native cubic secondary density interface.** The parent local-order and Haar interfaces are not implemented at the pins. Bind the primitive quotient R/Z_p, its probability Haar measure and its index function to their ST.1/ST.2 definitions; then prove the integrable-root bound and type the integral. The signature is omitted rather than replacing a cubic order by an arbitrary type.

Needed by: [ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral](#cubic-secondary-orbit-integral).

**G3 — Ring-class conductor normalization.** BBP Lemma3.3 invokes a classical bound with a bounded additive term in the rank. The sharper constant-one bound and conductor identity in these adapter nodes need the requested Picard exact sequence and a checked local-unit computation at3; the original Hasse/Datskovsky–Wright proof was not read.

Needed by: [ArithmeticStatistics:ST.3/cubic-conductor-discriminant](#cubic-conductor-discriminant), [ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound](#quadratic-order-three-torsion-bound).

**G4 — Cubic order identity over a fixed resolvent.** The corrected |Aut R|^{-1} coefficient identity and the full wild-conductor sum are needed in LOWW §3.2. Read Datskovsky–Wright’s original order/conductor formulas and verify their local factors, including3; the source’s abbreviated argument is insufficient to certify these inputs.

Needed by: [ArithmeticStatistics:ST.3/relative-three-torsion-propagation](#relative-three-torsion-propagation).

**G5 — Native reduced-multiplier and arithmetic-lift exports.** InductionRestrictionPartII RS.1/reduced-multiplier and reduced-cover, and InverseGaloisAndArithmeticFundamentalGroups IG.4/global-arithmetic-invariant are accepted exact suppliers. Their chosen ordinary-cover/oriented-H₂ and profinite local class-field interfaces are not exported at the pins; their own coverage remains planned. Import those definitions and supplier proof contracts. Arithmetic moment and catalogue-row Lean signatures are omitted until those precise exports exist. Conjecture5.1 is used only in generator-evaluation or Hom-valued form.

Needed by: [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface), [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue), [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](#nonabelian-admissibility-and-abelianization).

**G6 — Arithmetic nonabelian moment signatures.** The quadratic moment and kernel-to-field signatures need the requested native maximal-unramified ClassFieldTheory group plus the accepted reduced-multiplier/lifting suppliers just identified. Suggested.lean types the finite wreath, A₄-module and sampling APIs, and lists every arithmetic API/test omission by name. It introduces no opaque arithmetic extension carrier or placeholder proposition.

Needed by: [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface), [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator).

**G7 — Alberts original classification and residue inputs.** Read Lemmermeyer’s original Q₈/D₈ factorization theorem, including signs and2, and the Goldfeld–Hoffstein first-moment input before closing the Q₈ residue sum. Alberts’s published Corollary4.10/Theorem4.11 were read; the invoked originals and the full intermediate residue calculation were not certified.

Needed by: [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments).

**G8 — Mixed-trace algebraic geometry input.** Supply Alexander–Hirschowitz with its exact exceptional cases, the generic finite-fibre consequence of a nonzero Jacobian, and the affine Bézout bound. LOT Lemma2.1/Theorem3.2/Lemma3.3 are read; the originals were not read and no exact registered supplier target was located. These inputs cannot be replaced by a generic injectivity assertion.

Needed by: [ArithmeticStatistics:ST.3/mixed-trace-finite-fibres](#mixed-trace-finite-fibres).

**G9 — Original abelian and quartic counting proofs.** Wright’s original abelian-discriminant theorem and Baily’s quartic multiplicity proof were not obtained and read. Cohen–Morra Theorem1.1/§§6–7 and Bhargava–Shnidman Theorems7–8/§§5–6 have now been read for the fixed quadratic resolvent, including its exceptional pure-cubic logarithm. Their exact native conductor-series interface is requested from ClassFieldTheory. Keep the original abelian/quartic proofs and the arbitrary-subfamily Baily extension open.

Needed by: [ArithmeticStatistics:ST.3/cyclic-prime-field-count](#cyclic-prime-field-count), [ArithmeticStatistics:ST.3/baily-weighted-quartic-count](#baily-weighted-quartic-count).

**G10 — Original governing-field criteria.** KM §5 was read, but its classical PID/eight-rank theorem and the Bruin–Hemenway/KM18a Proposition6.2 sixteen-rank criterion were not obtained in their originals. Certify the fixed-order4 automorphism, prime2 selector and generator independence there.

Needed by: [ArithmeticStatistics:ST.3/eight-rank-governing-field](#eight-rank-governing-field), [ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion](#sixteen-rank-spin-criterion).

**G11 — Original Pell bounds and height transfer.** Read the cited FK negative-Pell paper, Blomer and Cremona–Odoni before closing the historical bounds; this run read KP’s statements. The assertion that the1−α theorem works for discriminant ordering needs a proved residue-subfamily comparison, not the footnote alone. The ST.5 matrix laws and MacWilliams count are imports.

Needed by: [ArithmeticStatistics:ST.3/negative-pell-historical-bounds](#negative-pell-historical-bounds), [ArithmeticStatistics:ST.3/restricted-real-quadratic-family](#restricted-real-quadratic-family).

**G12 — Real-metric lattice reduction supplier.** Import current IntegralLattices Layer2 instead of replanning it. The requested extension to arbitrary real Gram metrics and uniform well-separated bases is recorded in upstreamNotes; no registered atlas stage id exists for this newer upstream roadmap. The native Gram and reducedness predicates can be prototyped directly, but the geometric proof contract remains open.

Needed by: [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction), [ArithmeticStatistics:ST.3/monic-weak-quasi-reduction](#monic-weak-quasi-reduction).

**G13 — Polynomial-to-field bounded multiplicity.** The reviewed BSW I Lemma5.3 strong conclusion is false. Prove uniform bounded field multiplicity on a positive restricted polynomial family before closing Corollaries1.3–1.4 and their signature/local variants. For BSW II, correct signs do not repair the missing uniform dilation argument; supply that argument or a replacement family.

Needed by: [ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target](#monogenic-field-lower-bound-target), [ArithmeticStatistics:ST.3/binary-form-field-lower-bound-target](#binary-form-field-lower-bound-target).

**G14 — Restricted polynomial densities and general binary-order interfaces.** The trace-zero product is zero in degree2, and positivity elsewhere must be checked. The trace band needs a restricted tail and its own factor comparison. The binary regular-section/order comparison and general-degree associated-order interface are unimplemented at the pins; arithmetic Lean signatures are omitted pending those exact exports.

Needed by: [ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve](#trace-restricted-polynomial-sieve), [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction), [ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini](#binary-form-arithmetic-bertini), [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts).

**G15 — Nakagawa restoration.** Read Nakagawa’s1989/1990 papers and1991 corrections before certifying the unramified A_n correspondence. BSW II’s brief restoration claim and a tail estimate do not alone certify signs, multiplicities and the withdrawn proofs.

Needed by: [ArithmeticStatistics:ST.3/unramified-alternating-extension-lower-bound-target](#unramified-alternating-extension-lower-bound-target).

**G16 — Abelian and classical counting originals.** Wright’s1989 original abelian theorem was not obtained; obtain its conductor series and exact logarithmic order over Q(ζ₃) and its cyclic-prime specialization. Also obtain Mäki, Baily and the D₄/degree5 remainder originals. The fixed quadratic cubic-resolvent result was checked directly in Cohen–Morra and Bhargava–Shnidman, including the d=−3 logarithmic branch; do not retain the unqualified quoted √X formula.

Needed by: [ArithmeticStatistics:ST.3/cyclic-prime-field-count](#cyclic-prime-field-count), [ArithmeticStatistics:ST.3/baily-weighted-quartic-count](#baily-weighted-quartic-count), [ArithmeticStatistics:ST.3/all-fields-degree-at-most-five](#all-fields-degree-at-most-five), [ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily](#kluners-cyclotomic-subfamily).

**G17 — Historical Galois-bound exceptional inputs.** The published EV Proposition1.3 and proof Proposition2.8,pp.734–737 were read. Closure still requires the CFSG large core-free subgroup result, the nilpotent order8 count of Klüners–Malle, the Datskovsky–Wright S₃ input and the inflation–restriction character bound with its ramification support. Those statements are imported or requested, not replaced by Schmidt’s exponent.

Needed by: [ArithmeticStatistics:ST.3/galois-field-three-eighths-bound](#galois-field-three-eighths-bound).

**G18 — Classical binary quadratic orbit counts.** The accepted Mertens definite and Siegel indefinite targets remain imports. No cleared copy of the original indefinite-count theorem was located. Read Siegel Theorem3/§8 with the exact primitive/content, orientation and positive-norm unit conventions, compare the corrected π²/(18ζ(3)) primitive leading coefficient with π²/18 for all forms, and connect it to the native quadratic-order/Picard and regulator layers before closing the parent target.

Needed by: `ArithmeticStatistics:ST.3/mertens-count-of-positive-definite-binary-quadratic-forms`, `ArithmeticStatistics:ST.3/siegel-count-of-indefinite-binary-quadratic-forms`, `ArithmeticStatistics:ST.3/quoted-classical-counts-for-binary-quadratic-and-cubic-forms`.

**G19 — Catalogue computation certificates.** Import the finite reduction-certificate and compatible-parity algorithms from InductionRestrictionPartII RS.6; do not plan them again. Their certified ordinary-cover inputs and complete table runs are still open in that accepted supplier. The present quadratic-wreath catalogue must bind each listed embedded subgroup orbit to those certificates; neither abstract SmallGroups names nor unverified95-candidate output proves a multiplier value or universal parity assertion.

Needed by: [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue).

## Source corrections and version scope

Every assertion below is in this plan’s own words. Existing independent findings retain their original provenance in the packet; this worker does not review those findings or this plan. No correction is silently promoted from a preprint to its published edition. The Springer BSW I PDF request returned an HTML interstitial, so its findings are expressly limited to arXiv v3.

**`ArithmeticStatistics/E1` — gap; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma2.1, p.9, published 2025 PDF.** The proof treats generators of ideals of relative norm1 as elements of relative norm1 and bounds the positive archimedean coordinates from their total sum.

Correction: Pigeonhole relative generator norms modulo dth powers of base units, rescale within one class, and apply the estimate to ratios with every relative norm block zero. Check: A generator norm can be a nontrivial unit. Block sums T and−T have total zero but positive part T. The unit quotient has at most d^[K:Q] classes, so the repair costs only a bounded factor.

**`ArithmeticStatistics/E2` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma2.1 and definitions, pp.7–9, published PDF.** The exponent uses the absolute degree in one relative norm factor; norm-unit indices and archimedean counts use inconsistent degree notation.

Correction: Use d=[L:K] in relative conductor/exponent calculations and [L:Q] only for absolute-place and bounded unit-index counts. Check: Norm after class extension is the dth power. The number of archimedean unit coordinates instead depends on the absolute degree.

**`ArithmeticStatistics/E3` — gap; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma2.4, p.11, published PDF.** The displayed fixed-norm quadratic-extension estimate suppresses the base two-torsion factor.

Correction: Retain O_[F:Q],ε(Nm(m)^ε h₂(F)) and compute the local-image restrictions separately for each prime. Check: Quadratic characters with a fixed conductor form a class-character fibre; its multiplicity is controlled by two-torsion and is not uniformly constant as F varies.

**`ArithmeticStatistics/E4` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Theorem6.1, p.30, compared with its proof p.36, published PDF.** The displayed tower-average numerator and denominator omit the factor2^(−r₂(F)).

Correction: Weight both sums by2^(−r₂(F)); fixed-signature formulas retain their existing constant. Check: Summing the quadratic-extension local masses over real-place signatures gives κ_F/(2^r₂(F) ζ_F(2)D_F²). The complex-place count varies with F.

**`ArithmeticStatistics/E5` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Proposition2.6/Lemma2.7, pp.7–9, published PDF.** The auxiliary factorization does not explicitly require both a and b to be positive.

Correction: Require a,b≥1 in the split-prime factorization. Check: If a=0, the prime whose exponent is tested disappears; the primitive-generator contradiction no longer follows.

**`ArithmeticStatistics/E6` — gap; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Convexity applications, pp.14,20–21, published PDF.** Pole-bearing zeta and Shintani functions are bounded without separating their poles in some intervening displays.

Correction: Apply the pole-cancelled convexity bound or work a fixed distance from the poles; keep the max(σ,1) in the contour estimate. Check: A meromorphic function cannot satisfy a uniform finite bound through a pole. Removing the pole gives the intended shifted-contour estimates.

**`ArithmeticStatistics/E7` — error; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma3.13, p.16, and use p.18, published PDF.** The cubic-order coefficient identity weights an order by the automorphism group of its rational algebra and tensors over Q.

Correction: Weight by |Aut_OF(R)|^(−1) and tensor R over O_F with F. Check: For index5 orders in Z×Z[i], one order is fixed and two are interchanged by conjugation. Ring orbit weights sum to3/2; using algebra automorphisms gives1. The corrected identity preserves the following upper bound.

**`ArithmeticStatistics/E8` — gap; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Proposition3.12 proof, p.18, published PDF.** The conductor sum is restricted to squarefree ideals.

Correction: Include all conductor ideals, retaining the convergent weighted norm sum. Check: Q(∛3) has discriminant−243=−3·9², so its resolvent conductor9 is not squarefree.

**`ArithmeticStatistics/E9` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma3.8, p.19, published PDF.** The comparison of cubic-order types does not state the equal-discriminant condition on the quadratic resolvent.

Correction: Restrict to cubic orders whose resolvent order has the required discriminant before comparing coefficients. Check: A nonmaximal quadratic resolvent changes the conductor factor in the coefficient series.

**`ArithmeticStatistics/E10` — gap; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Quadratic relative-class estimates, p.25, published PDF.** The fixed-ideal quadratic count drops the archimedean and prime2 local-image factors.

Correction: Carry the fixed-ideal class-character multiplicity and every archimedean/2-adic restriction through the sum. Check: The local image in the quadratic character group is not independent of the conductor ideal.

**`ArithmeticStatistics/E11` — gap; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Introduction, p.2, published PDF.** The quartic remainder is described as having a square-root bound in a discussion where other quartic groups are present.

Correction: Use o(X) for the full non-D₄/S₄ remainder; retain the smaller bounds only for the groups actually covered by them. Check: The cited estimates give a square-root-type upper bound for C₄ and V₄, but do not establish one for A₄. The available A₄ torsion argument has a larger exponent. The comparison only needs the established o(X) remainder.

**`ArithmeticStatistics/E12` — error; [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), Conjecture5.1, p.411; Lemma3.11, p.393, published Duke PDF.** The refined invariant conjecture permits any root of unity as its evaluation point.

Correction: Evaluate at a generator, or stratify by the full Hom-valued invariant. Check: The lifting invariant is a homomorphism in that point. Evaluation at1 is always1, so a nonidentity stratum is empty; the A₄ row has nontrivial multiplier two-torsion.

**`ArithmeticStatistics/E13` — misprint; [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050), AppendixA.1, p.421, published Duke PDF.** The trivial-action comparison names a group of order18.

Correction: Use C₂²×C₃, of order12. Check: The extension has kernel C₂² and quotient C₃; with trivial action its order is4·3.

**`ArithmeticStatistics/E14` — misprint; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Theorem4.1 proof, p.23, arXiv v3.** The multiplicative root weight repeats the composite index inside its prime product.

Correction: Use θ̄(m)=∏_(p|m) θ̄(p). Check: The local weight is defined on primes and then extended multiplicatively.

**`ArithmeticStatistics/E15` — gap; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Weighted congruence sieve, p.23, arXiv v3.** The translated-box estimate does not retain the full dependence of its boundary error on the modulus.

Correction: Keep Σ_(m≤M) θ̄(m)m^κ X^(D−1), or a proved sharper replacement. Check: Each translated congruence class has a modulus-dependent boundary term; summing only its volume loses that contribution.

**`ArithmeticStatistics/E16` — misprint; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Lemma5.1, p.24, arXiv v3.** The ring fibre is described with literal basis uniqueness and a single polynomial representative.

Correction: Use uniqueness modulo independent signs and the two monic representatives g(x) and(−1)^n g(−x). Check: A sign change preserves every successive norm. Trace zero eliminates translation, but reflection still changes the generator.

**`ArithmeticStatistics/E17` — gap; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Lemmas5.2–5.3 proofs, p.25, arXiv v3.** The proof identifies a Siegel set with the Minkowski reduction domain and transfers existence to uniqueness.

Correction: Use only reduction-domain containment, determinant normalization and a separate well-separated-basis argument for weak reduction. Check: An arbitrary Gram matrix has varying determinant and a reduction Siegel set does not characterize the exact Minkowski domain. Existence does not imply uniqueness.

**`ArithmeticStatistics/E18` — error; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Theorem4.1/4.4 sieve sums, pp.22–23, arXiv v3.** The square-divisor sum includes zero-discriminant polynomials.

Correction: Remove Δ=0 before the divisor sum and count that hypersurface separately. Check: A polynomial with Δ=0 belongs to every square-divisibility condition; its squarefree-modulus sum is infinite.

**`ArithmeticStatistics/E19` — misprint; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Lemma5.2 proof, p.25, arXiv v3.** The dilation contracts roots while the proof needs them to separate.

Correction: Use ρ^n g(x/ρ), expanding each root byρ. Check: Then the jth basis vector scales byρ^j, as required in the separation argument.

**`ArithmeticStatistics/E20` — error; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Lemma5.3, p.25, arXiv v3.** The source asserts strong quasi-reduction has density1.

Correction: Separate weak reduction; establish an adequate positive family with bounded multiplicity before the field-counting consequences. Check: For x²+x+q, q≥2, both(1,θ) and(1,θ+1) are reduced and are not sign-equivalent. Odd linear coefficients and a fixed upper-half constant-coefficient box give a non-strong family with asymptotic density at least1/32.

**`ArithmeticStatistics/E21` — error; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem1, p.2; PropositionA.1 proof, pp.53–54, published PDF.** The odd-prime quartic factor differs from the degree≥5 factor.

Correction: For all n≥4 use(1−q)²(1+q)(1+q−q²), q=1/p. The unique-double-root density is(1−q)²(1−(−p)^(2−n))/(p+1). Check: Complete enumeration of binary quartics modulo9 gives42768/59049=176/243. The source value1600/2187 is different. The double-root recurrence gives the corrected general formula.

**`ArithmeticStatistics/E22` — gap; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Lemma7.2 and Theorem3 proof, pp.52–53, published PDF.** Literal reduced-basis uniqueness and SL₂-equivalence are used for the fibre bound.

Correction: Use independent signs and the signed representatives ε s^n f(sx,y), ε,s∈{±1}; prove uniform dilation and multiplicity separately. Check: Reflection has determinant−1 and cannot generally be absorbed by SL₂. Uniform coefficient dilation fixes the vector1 while scaling every ζ_k; it is not a full lattice homothety.

**`ArithmeticStatistics/E23` — gap; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem7.1 proof, pp.51–52, published PDF.** A prescribed congruence class is accepted without enforcing every bad-prime local condition.

Correction: Require the class to be compatible with squarefree/maximality at each bad prime before multiplying the remaining densities. Check: A class forcing p²|Δ has zero density inside the squarefree family.

**`ArithmeticStatistics/E24` — misprint; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Displayed ζ basis, p.52, published PDF.** The final ζ_(n−1) coefficient has the wrong index.

Correction: Use ζ_k=Σ_(j<k) a_j θ^(k−j), ending ζ_(n−1) with a_(n−2)θ. Check: The displayed ζ₂ and its multiplication by θ determine the indexing.

**`ArithmeticStatistics/E25` — error; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Corollary6.27 and proof, p.51, published PDF.** The modulus sum includes Δ=0 and the strong/weak union is bounded by each summand separately.

Correction: Remove Δ=0, bound its hypersurface by O_n(X^n), and bound the union by the sum of the strong and weak contributions. Check: Zero is divisible by every m², so its divisor sum diverges; a union bound adds rather than independently bounds its two terms.

**`ArithmeticStatistics/E26` — gap; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Even-degree tail, §6, published PDF; ST.2 supplier qualification.** The intermediate lattice partition and rank estimate do not retain all equations of the counted subset.

Correction: Retain the subset equations and rank strata in the ST.2 export; do not infer the corrected global tail from a whole row-contained lattice. Check: Zero lies in every row-contained lattice, so the asserted disjointness/full-rank argument cannot count all such lattices. This is an inherited supplier finding; the ST.3 application keeps its dependency open.

**`ArithmeticStatistics/E27` — misprint; [km-governing](https://arxiv.org/pdf/1809.09597v1), §5, pp.22–23, arXiv v1.** The odd-prime quadratic class number is attached to−p in a family whose fundamental discriminant is−4p.

Correction: Use h(−4p), with the order4 automorphism and unit-square-invariant spin specified. Check: For p≡1 mod4, Q(√−p) has fundamental discriminant−4p; replacing its order by the nonfundamental−p changes the class-number convention.

**`ArithmeticStatistics/E28` — misprint; [bsw-global](https://arxiv.org/pdf/1512.03035v2), Theorem4.6 proof, §4.5, p.18, arXiv v2, 13March2026.** The omitted splitting-type density is bounded by1/|Aut τ|.

Correction: For sufficiently large primes choose any constant strictly between1−1/|Aut τ| and1, then multiply those omission densities. Check: The density of the specified unramified splitting type tends to1/|Aut τ|; its complement tends to1−1/|Aut τ|. For the split cubic type these are1/6 and5/6. The o(X) argument survives with the corrected constant.

**`ArithmeticStatistics/E29` — misprint; [ev-fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n2-p11.pdf), Proposition2.8 proof, §2.2, p.736, published Annals PDF.** The small abelian quotient count of orders3 or4 is described as a pure square-root asymptotic.

Correction: Use O_ε(Y^(1/2+ε)); a V₄ quotient has a logarithmic factor. Check: Wright’s abelian count for V₄ has order Y^(1/2)(log Y)² over Q. The proof already allows ε losses, so the stated3/8+ε conclusion survives.

**`ArithmeticStatistics/E30` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma2.1 proof, p.9, published PDF.** The divisor of the ratio of two generators loses the inverse exponents at the second pair of primes.

Correction: Retain the signed fractional-ideal exponents of α_r/α_s. Check: Division reverses every exponent in the denominator; the relative norm cancellation depends on these signs.

**`ArithmeticStatistics/E31` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma3.14, p.17; Corollary5.5, p.23, published PDF.** The ideal containment and the theorem cited by the corollary have their directions/index wrong.

Correction: Use 𝔞⊆O_F and cite Theorem5.1 in Corollary5.5. Check: The ideal is an integral ideal of the base; the invoked tail theorem is5.1.

**`ArithmeticStatistics/E32` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma2.1 proof, p.9, published PDF.** The unit-index bound is claimed to depend only on the relative degree d.

Correction: Use [O_L^*:O^*O_K^*]≤d^(r₁(K)+r₂(K)) and constants depending on [L:Q]. Check: The base unit rank can grow with K while d is fixed. The norm quotient is controlled by the base-place count.

**`ArithmeticStatistics/E33` — misprint; [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf), Lemma4.3 proof, p.21, published PDF.** The contour choice exchanges a maximum with a minimum.

Correction: Set σ₁=max(1−ε₁/(4c),1/2), matching the lemma statement. Check: The contour must remain inside the half-plane in which the available bounds hold.

**`ArithmeticStatistics/E34` — gap; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Proposition4.3 proof, p.22, arXiv v3.** The imprimitive quartic index estimate is treated like the higher-degree estimate.

Correction: For the quartic branch retain O_ε(X^(22/3+ε)); for n=6 use the actual index10, and n≥8 uses the stated combinatorial bound. Check: An imprimitive degree4 D₄ action has index3 in S₄; its contribution yields22/3. This weaker saving is still sufficient for the sieve application.

**`ArithmeticStatistics/E35` — gap; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Lemma4.2 proof, p.21, arXiv v3.** A pointwise divisor count is bounded logarithmically.

Correction: Use the summed divisor estimate over the nonzero constant coefficients. Check: The individual divisor function is not O(log x). Its average is logarithmic, which is exactly the sum used in this proof.

**`ArithmeticStatistics/E36` — gap; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Theorem1.5(b), p.4; §§2–3, arXiv v3.** The low-degree tail is covered by a representation argument whose displayed range starts above degree2.

Correction: Prove the quadratic congruence tail separately: for nonzero Δ and odd squarefree m, each fixed a₁ gives one a₂ class mod m², yielding O(X³/M+X²). Check: The coefficient box has a₁ range X and a₂ range X². The zero-discriminant quadratics are counted once, outside the modulus sum.

**`ArithmeticStatistics/E37` — misprint; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Corollary1.4 proof, p.27, arXiv v3.** The Fujiwara root bound loses its factor2.

Correction: Use ||θ||≤2 max(|a₁|,|a₂|^(1/2),…,|a_n/2|^(1/n)). Check: A quadratic such as x²−x−1 has a root larger than the displayed coefficient maximum without the factor2. The field-count exponent is unchanged.

**`ArithmeticStatistics/E38` — error; [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3), Theorem5.4, pp.25–26, arXiv v3.** The trace-zero local-density product is asserted to be positive in every degree.

Correction: Set κ₂(2)=κ₂=0 and verify positivity for the other specified slices; use a different quadratic trace slice when needed. Check: The trace-zero quadratic x²+a₂ has discriminant−4a₂, so no squarefree discriminant is possible.

**`ArithmeticStatistics/E39` — gap; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorems1,2,6 and tail range, pp.2–4,51, published PDF.** The quadratic conclusions are invoked from a tail theorem stated for n≥3.

Correction: Add the n=2 nonzero-discriminant tail O_ε(X^(3+ε)/M), its finite residue count and its own truncation. Check: Fixing a₁ and a nonzero discriminant makes a₀a₂ a fixed integer, so a divisor count gives O_ε(X^(1+ε)) solutions per discriminant. The Δ=0 locus is treated separately.

**`ArithmeticStatistics/E40` — misprint; [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Arithmetic-Bertini interpretation, p.3, published PDF.** The zeta factor in the geometric interpretation lacks an inverse.

Correction: Use ζ_(P¹_Z)(2)^(−1)=ζ(2)^(−1)ζ(3)^(−1). Check: A density lies in[0,1], while the uninverted zeta value is larger than1. The numerical main theorem uses the inverse factors.

**`ArithmeticStatistics/E41` — error; [bstttz](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), §6,Remark6.1,(10),p.10, Kobe author PDF.** The fixed-quadratic-resolvent square-root asymptotic is applied to every quadratic field, with no exception for the third cyclotomic field.

Correction: For F=Q(√−3), use a positive main term of order √X log X. Retain the √X asymptotic for d≠−3. Broaden the weighted partial-summation input to √T(1+log T); the quartic bound with an arbitrary positive exponent loss is preserved. Check: Bhargava–Shnidman Theorem7 explicitly excludes d=−3, and their Theorem8,(1),pp.57–58 gives the pure-cubic logarithm. Cohen–Morra Theorem1.1(1),Corollary7.4 gives the same double-pole case; translating conductor Y=√(X/3) introduces half the logarithm.

**`ArithmeticStatistics/E42` — misprint; [bhargava-shnidman](https://msp.org/ant/2014/8-1/ant-v8-n1-p03-s.pdf), §6.2,Proposition36,p.83, published PDF.** The displayed discriminant multiplier is positive nine for the square of a′d′.

Correction: With d=3d′ and a′=r³d′−9a, the signed discriminant is −3(a′d′)². Use |Disc f|=3(a′d′)² for height conversion. Check: Substitution in the standard binary-cubic discriminant, equivalently in the preceding §6.1 formula −(r³d²−27ad)²/27, gives the coefficient −3. For (a,r,d′)=(1,1,1), the discriminant is −192 whereas the displayed coefficient gives576. Fifty exact integer substitutions independently agree. The following Theorem8 proof uses conductor height √(X/3), consistent with the corrected coefficient.

## Sources read

All listed passages were accessed on 10 October 2026. The packet records URLs, exact editions and SHA-256 digests. Missing originals are listed under the gaps, rather than counted as texts read.

| Source | Edition and passages read |
| --- | --- |
| [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf) — On the 4-rank of class groups of quadratic number fields | Author manuscript corresponding to Inventiones Mathematicae 167 (2007), 455–513; manuscript page numbers; §§1–4, pp.1–14; §§5–7, pp.14–40; §§8–10, pp.40–55. The terminal arguments in §5.6, §8 and §9 were reread against the exact moment/sign conventions. The companion FK06 entire-function growth input was not obtained; it remains G1. |
| [bst](https://arxiv.org/pdf/1005.0672v3) — On the Davenport–Heilbronn theorems and second order terms | arXiv:1005.0672v3; manuscript pagination; §6, pp.15–20; §7, pp.20–22; §8, pp.22–26; §9, pp.27–36. |
| [bsw-global](https://arxiv.org/pdf/1512.03035v2) — Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces | arXiv:1512.03035v2 (13 March 2026); manuscript pagination; §§1–3, pp.1–11; §4.3–4.6, pp.15–18; §§5–8, pp.18–25; §10, pp.28–31. |
| [bbp](https://math.dartmouth.edu/~carlp/BBPnew23.pdf) — Error terms for the Davenport–Heilbronn theorems | Author manuscript corresponding to Duke Mathematical Journal 153 (2010), 173–210; manuscript pagination; §3, Lemmas3.1–3.4, pp.12–13; §5, pp.23–26. |
| [delaunay-moments](https://arxiv.org/pdf/1303.7337) — The Cohen–Lenstra heuristics, moments and pʲ-ranks of some groups | arXiv:1303.7337v1; manuscript pagination; §1, pp.1–4; §2, Lemma3 and Corollary4, pp.5–6; §3, Theorem5 and proof, pp.6–8. |
| [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf) — The average size of 3-torsion in class groups of 2-extensions | Forum of Mathematics, Pi 13 (2025), e2; publisher PDF pagination; §§1–6, pp.1–38; §8, pp.40–41. The comparison statements of §7, pp.38–40, are imported from the parent ST.5 nodes. |
| [wood-nonabelian](https://par.nsf.gov/servlets/purl/10152050) — Nonabelian Cohen–Lenstra moments | Duke Mathematical Journal168 (2019),377–427; published pagination; §§1–2, pp.378–387; Definition3.1, pp.388–389; §§5–8, pp.410–420; Appendix A.1–A.3, pp.420–424. The reduced-homology construction and Hurwitz-space proof remain imported supplier contracts. |
| [wood-alberts](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf) — Cohen–Lenstra moments for some nonabelian groups | Journal de Théorie des Nombres de Bordeaux32(2020),631–664; published pagination; §4,Theorem4.1,pp.646–648; Lemma4.9 and Corollary4.10/Theorem4.11,pp.655–657. The intermediate residue analysis and Lemmermeyer’s original classification remain proof inputs. |
| [lot](https://lemkeoliver.github.io/papers/25-NumberFieldBounds.pdf) — Upper bounds on number fields of given degree and bounded discriminant | Author manuscript corresponding to Duke Mathematical Journal171(2022),3077–3087; manuscript pagination; §§1–4,pp.1–6; limitations in §5,p.7. |
| [bstttz](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf) — Bounds on2-torsion in class groups of number fields and integral points on elliptic curves | Author manuscript dated18February2017; source routed as2020 publication; manuscript pagination; §1,pp.1–4; §5.1,Theorems5.1–5.2,(2)–(4),pp.7–8; §6,pp.9–10. Shared torsion and lattice bounds are requested from EffectiveBounds, Part II. |
| [bhargava-fields](https://arxiv.org/pdf/2111.06507v3) — Galois groups of random integer polynomials and van der Waerden’s conjecture | arXiv:2111.06507v3; manuscript pagination; Theorem19,p.12; Theorem20 proof,pp.15–16; degree≤5 comparison,p.24; cyclic-prime and Galois-field inputs,pp.4–5. The quoted counting results are read through their originals where available. |
| [schmidt](https://www.numdam.org/article/AST_1995__228__189_0.pdf) — Number fields of given degree and bounded discriminant | Astérisque228(1995),189–195; (1.1)–(1.2),pp.189–190; Lemmas1–2 and proof,pp.190–195. |
| [ev-fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n2-p11.pdf) — The number of extensions of a number field with fixed degree and bounded discriminant | Annals of Mathematics163(2006),723–741; Proposition1.3,p.725; its proof,Proposition2.8,§2.2,pp.734–737; generator-height discussion in §3,pp.737–740. |
| [km-governing](https://arxiv.org/pdf/1809.09597v1) — Joint distribution of spins | arXiv:1809.09597v1, 2018; manuscript pagination; §1,pp.1–3; §2.3–2.6,pp.5–7; §5,pp.22–23. The joint-spin analytic theorem is an SV.5 import, not certified here. |
| [kp-pell](https://arxiv.org/pdf/2201.13424) — On Stevenhagen’s conjecture | arXiv:2201.13424v1, 2022; manuscript pagination; §1,pp.1–4; §7.3,Theorem7.13,pp.74–75; §8 definitions and identity,p.76. The reflection/expansion proof belongs to its routed Part II. |
| [bsw-monogenic](https://arxiv.org/pdf/1611.09806v3) — Squarefree values of polynomial discriminants I | arXiv:1611.09806v3, corresponding to Inventiones228(2022),1037–1073; manuscript pagination; §1,pp.1–4; §4.2,pp.22–23; §5,pp.24–27. The extraction’s accepted corrections qualify the source-stated lower bounds. |
| [bsw-binary-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf) — Squarefree values of polynomial discriminants II | Forum of Mathematics,Pi13(2025),e17; publisher PDF pagination; §1,pp.2–4; §7,Theorem7.1 and Lemma7.2,pp.51–53; AppendixA.1–A.2,pp.53–55. The reviewed even-degree tail gaps are ST.2 inputs. |
| [kluners-counterexample](https://arxiv.org/pdf/math/0411486v1) — A counter example to Malle’s conjecture on the asymptotics of discriminants | arXiv:math/0411486v1, 2004; manuscript pagination; §§1–2,pp.1–3; references,p.4. Wright’s abelian theorem remains an original-source gap. |
| [bhargava-shnidman](https://msp.org/ant/2014/8-1/ant-v8-n1-p03-s.pdf) — On the number of cubic orders of bounded discriminant having automorphism group C₃, and related problems | Published Algebra & Number Theory 8 (2014), 53–88; journal page numbers; Theorems 4–8, pp.56–58; Theorem31 and §5, pp.78–80; §6, Lemma33, Propositions34–36 and proof of Theorem8, pp.80–86. Earlier shape parametrization and its uniform sieve are supplier inputs, not new ST.3 constructions. |
| [cohen-morra](https://arxiv.org/pdf/1003.1869v1) — Counting cubic extensions with given quadratic resolvent | arXiv:1003.1869v1, submitted 9 March 2010 (PDF title-page date 12 November 2018); manuscript page numbers; §1.1–1.2, Theorem1.1, pp.1–3; Theorem6.1, Corollary6.2, Proposition6.3 and Corollary6.4, pp.11–14; §7.1–7.3, Corollaries7.2,7.4,7.6 and proof of Theorem1.1(2), pp.15–17. Underlying Kummer/ray-class and conductor exports are required from ClassFieldTheory. |

## Verified pinned baseline

| Declaration | Exact input used |
| --- | --- |
| `mathlib:AdjoinRoot` | Polynomial quotient R[X]/(f), with the canonical root and quotient-ring structure. |
| `mathlib:RegularWreathProduct` | Native regular wreath product, with coordinate carrier and semidirect multiplication. |
| `mathlib:RegularWreathProduct.rightHom` | Projection to the acting group Q. |
| `mathlib:RegularWreathProduct.inl` | Canonical inclusion of the acting group Q. |
| `mathlib:RegularWreathProduct.congr` | Wreath-product equivalence induced by group equivalences in both factors. |
| `mathlib:Subgroup.goursat_surjective` | A subdirect product is the graph of an equivalence between quotient groups by the projection kernels. |
| `mathlib:NumberField.discr` | Integer discriminant of the ring-of-integers basis of a number field. |
| `mathlib:NumberField.finite_of_discr_bdd` | Hermite finiteness for finite-dimensional intermediate fields of a fixed extension of Q, with bounded absolute discriminant. |
| `mathlib:ClassGroup.extendedHom` | Class-group extension homomorphism for an injective extension of domains, expressed using a torsion-free algebra. |
| `tauceti:ClassGroup.relNorm` | Class-group norm for a finite torsion-free algebra of Dedekind domains. |
| `tauceti:ClassGroup.relNorm_comp_extendedHom` | The norm after extension equals the finrank power homomorphism. |
| `tauceti:NumberField.NarrowClassGroup` | Fractional ideal classes modulo principal ideals generated by totally positive elements. |
| `tauceti:NumberField.NarrowClassGroup.toClassGroup` | Surjection forgetting positivity of principal generators. |
| `tauceti:NumberField.NarrowClassGroup.instFinite` | Finiteness of the native narrow class group. |
| `tauceti:TauCeti.ClassGroup.ElementaryTwoQuotient` | Native elementary-two quotient of the class group. |
| `tauceti:TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion` | For a finite class group the elementary-two quotient and two-torsion have equal cardinality. |
| `tauceti:NumberField.exists_isArithFrobAt_int_of_liesOver` | An arithmetic Frobenius relative to Z exists at a prime above a rational prime in a Galois number field. |
| `tauceti:NumberField.isArithFrobAt_eq_of_isUnramifiedAt` | Frobenius automorphisms at the same unramified prime coincide. |
| `mathlib:Matrix.SpecialLinearGroup` | Matrices of determinant one, used for binary-form changes of variables. |
| `mathlib:alternatingGroup.kleinFour` | The subgroup of the alternating group generated by double transpositions. |
| `mathlib:alternatingGroup.normal_kleinFour` | For a four-element permutation carrier, this Klein-four subgroup is normal in the alternating group. |
| `mathlib:alternatingGroup.kleinFour_card_of_card_eq_four` | For a four-element carrier its cardinal is4. |
| `mathlib:Abelianization` | Native group quotient by the commutator subgroup, with its commutative-group instance. |

## Routed-item coverage

This is an ownership ledger for the eight incoming extraction routes, not a restatement of their papers. Every routed ST.3 item maps to a retained target, a target-level adapter, or an exact supplier. Smaller lemmas stay inside the proof sketches.

| Routed item | Owner/contract |
| --- | --- |
| `PAPER-BHARGAVA-25/6` | `ArithmeticStatistics:ST.3/number-field-counting-function`; `ArithmeticStatistics:ST.3/malle-invariants-of-a-permutation-group`; `ArithmeticStatistics:ST.3/malle-conjecture` |
| `PAPER-BHARGAVA-25/32` | [ArithmeticStatistics:ST.3/schmidt-field-count-bound](#schmidt-field-count-bound) |
| `PAPER-BHARGAVA-25/33` | [ArithmeticStatistics:ST.3/lemke-oliver-thorne-field-bound](#lemke-oliver-thorne-field-bound) |
| `PAPER-BHARGAVA-25/34` | [ArithmeticStatistics:ST.3/small-trace-zero-element](#small-trace-zero-element) |
| `PAPER-BHARGAVA-25/55` | [ArithmeticStatistics:ST.3/all-fields-degree-at-most-five](#all-fields-degree-at-most-five) |
| `PAPER-BHARGAVA-25/68` | [ArithmeticStatistics:ST.3/cyclic-prime-field-count](#cyclic-prime-field-count) |
| `PAPER-BHARGAVA-25/70` | [ArithmeticStatistics:ST.3/galois-field-three-eighths-bound](#galois-field-three-eighths-bound) |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/baily-weighted-count` | [ArithmeticStatistics:ST.3/baily-weighted-quartic-count](#baily-weighted-quartic-count) |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/cyclic-cubic-count` | [ArithmeticStatistics:ST.3/cyclic-prime-field-count](#cyclic-prime-field-count) |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/fixed-resolvent-cubic-count` | [ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count](#fixed-resolvent-cubic-count) |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/weighted-partial-summation` | [ArithmeticStatistics:ST.3/weighted-cubic-partial-summation](#weighted-cubic-partial-summation) |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/a4-quartic-count` | [ArithmeticStatistics:ST.3/quartic-torsion-counting-applications](#quartic-torsion-counting-applications) |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/fixed-resolvent-quartic-count` | [ArithmeticStatistics:ST.3/quartic-torsion-counting-applications](#quartic-torsion-counting-applications) |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/field-count-carrier` | `ArithmeticStatistics:ST.3/number-field-counting-function` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/7` | [ArithmeticStatistics:ST.3/squarefree-field-discriminant-sn](#squarefree-field-discriminant-sn) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/58` | [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](#monic-polynomial-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/59` | [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](#monic-polynomial-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/60` | [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](#monic-polynomial-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/61` | [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](#monic-polynomial-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/62` | [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](#monic-polynomial-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/63` | [ArithmeticStatistics:ST.3/short-generator-field-upper-bound](#short-generator-field-upper-bound) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/64` | [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/65` | [ArithmeticStatistics:ST.3/strong-reduction-ring-fibres](#strong-reduction-ring-fibres) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/66` | [ArithmeticStatistics:ST.3/monic-weak-quasi-reduction](#monic-weak-quasi-reduction) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/67` | [ArithmeticStatistics:ST.3/monic-weak-quasi-reduction](#monic-weak-quasi-reduction) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/68` | [ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve](#trace-restricted-polynomial-sieve) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/69` | [ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target](#monogenic-field-lower-bound-target) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/70` | [ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target](#monogenic-field-lower-bound-target) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/71` | [ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target](#monogenic-field-lower-bound-target); [ArithmeticStatistics:ST.3/short-generator-field-upper-bound](#short-generator-field-upper-bound) |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/72` | [ArithmeticStatistics:ST.3/monogenic-field-asymptotic-prediction](#monogenic-field-asymptotic-prediction) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/66` | [ArithmeticStatistics:ST.3/binary-discriminant-local-factors](#binary-discriminant-local-factors); [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/67` | [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/68` | [ArithmeticStatistics:ST.3/binary-form-sieve-counts](#binary-form-sieve-counts) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/69` | [ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini](#binary-form-arithmetic-bertini) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/71` | [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](#polynomial-order-lattice-reduction) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/72` | [ArithmeticStatistics:ST.3/strong-reduction-ring-fibres](#strong-reduction-ring-fibres) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/73` | [ArithmeticStatistics:ST.3/binary-form-field-lower-bound-target](#binary-form-field-lower-bound-target) |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/75` | [ArithmeticStatistics:ST.3/unramified-alternating-extension-lower-bound-target](#unramified-alternating-extension-lower-bound-target) |
| `PAPER-KOYMANS-MILOVIC-21/19` | `ArithmeticStatistics:ST.2` |
| `PAPER-KOYMANS-MILOVIC-21/25` | [ArithmeticStatistics:ST.3/prime-power-class-group-rank](#prime-power-class-group-rank); [ArithmeticStatistics:ST.3/governing-field-interface](#governing-field-interface) |
| `PAPER-KOYMANS-MILOVIC-21/26` | [ArithmeticStatistics:ST.3/eight-rank-governing-field](#eight-rank-governing-field) |
| `PAPER-KOYMANS-MILOVIC-21/27` | [ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion](#sixteen-rank-spin-criterion) |
| `PAPER-KOYMANS-MILOVIC-21/28` | [ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field](#no-sixteen-rank-governing-field) |
| `PAPER-KOYMANS-PAGANO/1` | [ArithmeticStatistics:ST.3/restricted-real-quadratic-family](#restricted-real-quadratic-family) |
| `PAPER-KOYMANS-PAGANO/6` | [ArithmeticStatistics:ST.3/negative-pell-historical-bounds](#negative-pell-historical-bounds) |
| `PAPER-KOYMANS-PAGANO/205` | [ArithmeticStatistics:ST.3/restricted-real-quadratic-family](#restricted-real-quadratic-family); `ArithmeticStatistics:ST.5/symmetric-matrix-kernel-law` |
| `PAPER-KOYMANS-PAGANO/207` | `ArithmeticStatistics:ST.5/macwilliams-symmetric-rank-count`; `ArithmeticStatistics:ST.5/limit-of-the-symmetric-kernel-law` |
| `PAPER-KOYMANS-PAGANO/218` | `ArithmeticStatistics:ST.5/cohen-lenstra-moments` |
| `PAPER-KOYMANS-PAGANO/265` | `ArithmeticStatistics:ST.5/matrix-kernel-law-over-a-finite-field` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/1` | [ArithmeticStatistics:ST.3/rigid-embedded-field-family](#rigid-embedded-field-family) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/2` | [ArithmeticStatistics:ST.3/relative-torsion-splitting](#relative-torsion-splitting) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/3` | `ArithmeticStatistics:ST.5/cohen-martinet-surjection-moment-conjecture` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/7` | `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/8` | `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/9` | `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`; `tauceti:Completed/EffectiveBounds#layer-3-regulators-and-unit-lattice-volume` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/10` | [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](#relative-three-torsion-piecewise-bound) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/11` | [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](#uniform-small-degree-field-bound) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/12` | [ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound](#shintani-cubic-order-uniform-bound) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/15` | [ArithmeticStatistics:ST.3/relative-three-torsion-propagation](#relative-three-torsion-propagation) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/21` | `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets`; [ArithmeticStatistics:ST.3/thin-two-group-torsion](#thin-two-group-torsion) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/22` | [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](#uniform-small-degree-field-bound) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/23` | [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](#quadratic-tower-torsion-tail) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/24` | [ArithmeticStatistics:ST.3/quadratic-tower-counting-constants](#quadratic-tower-counting-constants) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/26` | [ArithmeticStatistics:ST.3/thin-two-group-torsion](#thin-two-group-torsion) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/27` | [ArithmeticStatistics:ST.3/wreath-transposition-fibre](#wreath-transposition-fibre); [ArithmeticStatistics:ST.3/rigid-embedded-field-family](#rigid-embedded-field-family) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/28` | [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](#low-degree-class-group-mass-ratios) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/29` | [ArithmeticStatistics:ST.3/two-extension-three-torsion-means](#two-extension-three-torsion-means) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/30` | [ArithmeticStatistics:ST.3/two-extension-three-torsion-means](#two-extension-three-torsion-means) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/31` | [ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean](#relative-wreath-three-torsion-mean) |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/32` | `ArithmeticStatistics:ST.5/cohen-martinet-predicted-surjection-moment` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/33` | `ArithmeticStatistics:ST.5/cohen-martinet-prediction-for-relative-three-torsion` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/34` | `ArithmeticStatistics:ST.5/cohen-martinet-prediction-for-three-torsion-of-two-extensions` |
| `PAPER-LEMKEOLIVER-WANG-WOOD-25/35` | [ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean](#relative-wreath-three-torsion-mean) |
| `PAPER-WOOD-19/13` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/17` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/18` | [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](#nonabelian-admissibility-and-abelianization) |
| `PAPER-WOOD-19/29` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/30` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/31` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/32` | [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](#nonabelian-admissibility-and-abelianization) |
| `PAPER-WOOD-19/33` | [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](#nonabelian-admissibility-and-abelianization) |
| `PAPER-WOOD-19/100` | [ArithmeticStatistics:ST.3/nonabelian-tame-local-model](#nonabelian-tame-local-model) |
| `PAPER-WOOD-19/101` | [ArithmeticStatistics:ST.3/nonabelian-tame-local-model](#nonabelian-tame-local-model) |
| `PAPER-WOOD-19/102` | `ArithmeticStatistics:ST.3/count-of-quadratic-fields` |
| `PAPER-WOOD-19/103` | [ArithmeticStatistics:ST.3/nonabelian-tame-local-model](#nonabelian-tame-local-model) |
| `PAPER-WOOD-19/104` | [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](#nonabelian-admissibility-and-abelianization) |
| `PAPER-WOOD-19/105` | [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](#nonabelian-admissibility-and-abelianization) |
| `PAPER-WOOD-19/106` | [ArithmeticStatistics:ST.3/embedded-quadratic-wreath-type](#embedded-quadratic-wreath-type) |
| `PAPER-WOOD-19/108` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/109` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/110` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/111` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/112` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/113` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/114` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/115` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/116` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/117` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/118` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/119` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/121` | `ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent` |
| `PAPER-WOOD-19/122` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/124` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/125` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/126` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/127` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/128` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/145` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/147` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/148` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/149` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/150` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/151` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/152` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/153` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/154` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/155` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/156` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/157` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/158` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/159` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/160` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/161` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/162` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/163` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/164` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/165` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/166` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/167` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/168` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/169` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/170` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/171` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/172` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/173` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/174` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/175` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/176` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/177` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/178` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/179` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/180` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/181` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/182` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/183` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/184` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/185` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/186` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/187` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/189` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/191` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/193` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/195` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/197` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/199` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/201` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/203` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/205` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/207` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/209` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/211` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/213` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/215` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/217` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/219` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/221` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/223` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/225` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/227` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/229` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/231` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/233` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/235` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/237` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/239` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/241` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/243` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/245` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/247` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/249` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/137` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/139` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/146` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/260` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/261` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/262` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/263` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/264` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/265` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/266` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/267` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/268` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/269` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/270` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/271` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/272` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/273` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/274` | [ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments](#nonabelian-low-degree-known-moments) |
| `PAPER-WOOD-19/275` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/276` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/277` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/278` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/279` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/280` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/281` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/282` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/283` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/284` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/285` | [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](#elementary-two-moment-euler-products) |
| `PAPER-WOOD-19/288` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/289` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/290` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/291` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/292` | [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](#elementary-two-moment-divergence) |
| `PAPER-WOOD-19/293` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/294` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/295` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/296` | [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](#a4-appendix-kernel-enumerator) |
| `PAPER-WOOD-19/99` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/298` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/299` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](#nonabelian-quadratic-moment-interface) |
| `PAPER-WOOD-19/321` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/322` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/323` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/325` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/326` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |
| `PAPER-WOOD-19/341` | [ArithmeticStatistics:ST.3/embedded-type-catalogue](#embedded-type-catalogue) |

## Atlas planets

- Prime-power class-group ranks — `ArithmeticStatistics:ST.3/prime-power-class-group-rank`.
- Refined cubic sieve — `ArithmeticStatistics:ST.3/refined-cubic-sieve`.
- Low-degree local mass formula — `ArithmeticStatistics:ST.3/low-degree-jacobian-mass`.
- Quadratic tower torsion tail — `ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail`.
- Nonabelian quadratic moments — `ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface`.

The stage has five planets; all other declarations remain visible as target detail. The two restructuring proposals request Part II interfaces from EffectiveBounds and IntegralLattices; the present packet retains the single ST.3 scope.
