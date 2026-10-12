# Geometry of numbers, quadratic forms and homogeneous arithmetic — GN.5, Part: certified reductions and applications

This part completes Layer GN.5, *Certified reductions and applications*, of the roadmap. The accepted parent packet already plans the core of certified LLL reduction (Layer 5 of the roadmap package, items 5.1–5.4): exact Gram–Schmidt coefficients, the reduced-basis predicate at δ = 3/4, the shortest-vector factor 2^{(n−1)/2}, unimodular change-of-basis certificates, the shear and swap transitions, the integer potential and the native full-row reduction with its verification in the original lattice. This part builds on those items, cited by their numbers, and adds what the layer's targets still needed: the reconciliation of the native algorithm with Lenstra–Lenstra–Lovász Algorithm (1.15) and its transition invariant; the polynomial running time of Proposition (1.26); the bounds a reduced basis gives on the covolume, on independent families and on the successive minima; the routed basis through a prescribed primitive vector; exact enumeration of lattice points in ellipsoids with counts and representation numbers; a certified way to reduce lattices whose Gram matrix is irrational; and the adapters through which number-field and arithmetic-group consumers use a reduction certificate: heights, norms, class representatives and Siegel reduction.

The end results of the part are the reconciliation theorem 5.5.5, the running-time bound 5.6.3, the successive-minima comparison 5.7.5, the Fincke–Pohst completeness theorem 5.9.4 with its counts, the transfer theorem 5.10.4, the certified short element of an ideal 5.11.4 and the Siegel-domain certificate 5.12.2.

## Scope and ownership

This part owns, inside GN.5: the nondeterministic LLL step relation with its invariant and termination; Algorithm (1.15) as a deterministic refinement; Proposition (1.26) with the integrality (1.27)–(1.29) and size bounds (1.30)–(1.36); the bounds (1.7)–(1.14) and the successive-minima comparison; the primitive-prefix basis routed from Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao; exact quadratic completion and the Fincke–Pohst enumeration with completeness, counts and certified representation numbers; the Loewner comparison with a rational model and the transfer of reduction and enumeration through it; the Euclidean lattice of a fractional ideal with its house, norm and height bounds, certified short elements and class representatives; simultaneous approximation (1.39); and the comparison of LLL-reduced bases with the reduced forms and Siegel domains of AdelicAlgebraicGroups AA.3.

It leaves to other owners, and cites: the core LLL nodes of the parent packet (5.1–5.4); lattices, covolumes, Hadamard's inequality and the mixed-embedding normalization (GN.0); successive minima, minima outside a subspace and Minkowski's second theorem (GN.1); reduced forms, the standard real Siegel domain and reduction theory for GL_n(ℝ) (AdelicAlgebraicGroups AA.3, an upstream TauCetiRoadmap roadmap); the representation number r_L(n) of an integral lattice (Tau Ceti `IntegralLattice.representationNumber` on current main, added after the pin). The arithmetic uses of reduction stay with their consumers: Diophantine distance witnesses, linear-form lattices and exclusion certificates are EffectiveDiophantineMethods ED.1, and certified residual enumeration for Thue, Thue–Mahler and S-unit equations is ED.2, as the accepted restructuring RS-03 decides; the trace metric on the mixed space and the class-group torsion bounds are the downstream class-group torsion roadmap's; local representation densities over ℤ_p are GN.2–GN.3's. No unrestricted exact shortest- or closest-vector statement follows from LLL, and none is made.

Two notions move down into this layer, under the tier rule that a tier-3 roadmap plans what it needs rather than citing a higher tier:

- **Fincke–Pohst enumeration** (5.9.1–5.9.4) moves down from EffectiveDiophantineMethods ED.1 (tier 17). ComputationalNumberTheory CN.4 (tier 15) requested exact enumeration with a completeness theorem from GN.5 and cannot import from ED.1; ED.1's `short-vector-enumeration` and `short-vector-enumeration-complete` become imports of 5.9.3 and 5.9.4.
- **The height of an algebraic integer from its house** (5.11.3) moves down from DiophantineApproximationAndTranscendence DT.4 (tier 4), whose `log-height-of-algebraic-integer-bound` becomes an import.

## Conventions

Indices are zero based. A state of reduction is a cursor k with 1 ≤ k ≤ n and a family b : Fin n → E; the prefix b_0, …, b_{k−1} has been checked and row k is current. The source's one-based subscript k ∈ {2, …, n + 1} of Algorithm (1.15) is our k + 1; nodes that quote the source's indexing say so. The parameter is δ = 3/4 and the Lovász test is strict: a swap happens only when ‖b*_k‖² < (3/4 − μ²_{k,k−1})‖b*_{k−1}‖². Gram–Schmidt vectors are Mathlib's ordered `gramSchmidt`, coefficients are the parent's μ_{ij} = ⟨b_i, b*_j⟩/‖b*_j‖², and nearest integers are Mathlib's `round`, ⌊t + 1/2⌋, unless a node names the source's tie rule. d_k = det Gram(b_0, …, b_{k−1}) with d_0 = 1, and D = ∏_{1≤k<n} d_k is the parent's potential.

Exact decisions are made in ℚ. A real Gram matrix enters only through a rational model G̃ and a two-sided Loewner comparison (1 − ε)G̃ ≤ G ≤ (1 + ε)G̃ with κ = (1 + ε)/(1 − ε); floating-point output is never a certificate.

Number fields use Mathlib's Euclidean mixed space ℝ^{r₁} × ℂ^{r₂} with its ℓ² norm, ‖ι(a)‖² = Σ_{w real} w(a)² + Σ_{w complex} w(a)², which counts each complex place once; the trace form Σ_σ|σ(a)|² counts it twice and is not used as a metric. Heights are Mathlib's unnormalised logHeight₁. Siegel domains follow AdelicAlgebraicGroups AA.3: GL_n(ℤ) acts on the left, elements are written v·diag(a)·k, and gram g = (g^{−1})ᵀg^{−1} is the Gram matrix of the columns of g^{−1}.

## Exact supplier contracts

**From Mathlib.** `InnerProductSpace.gramSchmidt` with `gramSchmidt_def`, `gramSchmidt_orthogonal`, `gramSchmidt_ne_zero`, `gramSchmidt_mem_span` and `span_gramSchmidt_Iio`; `Matrix.gram`, `Matrix.det_gram_ne_zero_iff_linearIndependent`, `Matrix.det_mul`, `Matrix.cramer` and `Matrix.mulVec_cramer`; `Matrix.PosDef`, `Matrix.PosSemidef`, the LDL decomposition `LDL.lower`, `LDL.diagEntries`, `LDL.lower_conj_diag` and `LDL.lowerInv_eq_gramSchmidtBasis`; the spectral facts `Matrix.IsHermitian.eigenvalues`, `eigenvalues_eq`, `det_eq_prod_eigenvalues` and `Matrix.PosSemidef.eigenvalues_nonneg`; `round`, `round_eq`, `abs_sub_round`; `ZLattice.comap`, `ZLattice.covolume`, `ZLattice.covolume_comap`; Minkowski's theorem `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`; the Euclidean mixed space `NumberField.mixedEmbedding.euclidean.mixedSpace` with `toMixed`, `volumePreserving_toMixed` and `integerLattice`; `mixedEmbedding.idealLattice`, `mem_idealLattice` and `covolume_idealLattice`; `NumberField.house`, `house_eq_sup'`, `norm_embedding_le_house`; `InfinitePlace.prod_eq_abs_norm` and `sum_mult_eq`; `NumberField.logHeight₁_eq` and `FinitePlace.norm_le_one`; `NumberField.exists_ideal_in_class_of_norm_le`; `Real.geom_mean_le_arith_mean_weighted`; `Matrix.GeneralLinearGroup` and `Matrix.orthogonalGroup`. Mathlib's LDL decomposition is over ℝ or ℂ; the exact rational completion 5.9.1 is new and is compared with it.

**From Tau Ceti.** `TauCeti.cholesky` and `cholesky_mul_transpose`; `TauCeti.IsPrimitive` and `IsPrimitive.exists_basis`; `TauCeti.IntegralLattice` with `gramMatrix`, `norm`, `IsPosDef` and `isPosDef_ofGramMatrix_iff`. The representation number `IntegralLattice.representationNumber` exists on current Tau Ceti main but not at the pin; 5.9.6 computes the cardinality it denotes.

**From the parent packet (GN.5, items 5.1–5.4), GN.0 and GN.1.** `lllCoefficient`, `IsLLLReduced`, `UnimodularBasisCertificate`, the growth and short-vector bounds, the shear and swap transition lemmas, the integer potential and its laws, the native reduction `exactLLL` and its original-lattice verification; GN.0 `hermitian-gram-hadamard`, `covolume-square-gram`, `prescribed-primitive-basis` and `mixed-embedding-normalization`; GN.1 `successive-minimum`, `successive-minimum-witnesses`, `successive-minimum-monotone`, `minimum-outside-subspace`, `minkowski-second-upper` and `ideal-class-application-import`.

**From AdelicAlgebraicGroups AA.3.** `reduced-form` and `reduced-form-set` (the sets T_{e,C} of (e, C)-reduced forms, `RealSiegel.IsReduced`), `real-siegel-set`, and `gln-real-reduction` with the standard real Siegel domain Σ_n(u, t) of its README.

## How to read the part

Sections 5.5–5.7 complete the reduction itself; 5.8 is the routed basis construction; 5.9 and 5.10 give enumeration and the irrational-metric transfer; 5.11 and 5.12 are the adapters for arithmetic consumers. Within 5.5, build the step relation 5.5.1 and its invariant before Algorithm (1.15), and both before the reconciliation. 5.6 needs 5.5. 5.9.1 is needed by 5.10.2 (exact positivity) and by every enumeration; 5.10 is needed by 5.11.4 and 5.12.2. Each entry's *Needs* line names its inputs by item number, parent item number with its node name, other layer's node, or library declaration; each *Lean* line names its declarations in `GeometryOfNumbersAndQuadraticArithmetic--GN.5.lean`; each definition and construction ends with its checks, which reappear as `example`s there.

## Layer 5, continued: certified reductions and applications

### 5.5 The step relation and Algorithm (1.15)

The parent layer reduces with a native variant that size-reduces the whole current row before the Lovász test. Lenstra, Lenstra and Lovász reduce only the coefficient μ_{k,k−1} first and the rest of the row after a successful test, and their subroutine (*) leaves a coefficient equal to ±1/2 alone. Both are planned here as deterministic refinements of one nondeterministic step relation, so the invariant (1.16)–(1.17), termination and the swap count are proved once. The two algorithms then agree step by step except at an exact tie before a swap, where they may return different, equally reduced bases; the reconciliation theorem states both facts.

Define `LLLStep` (5.5.1), *The LLL step relation at δ = 3/4*: Fix a real inner-product space E and n ≥ 2. A state is a pair (k, b) of a cursor 1 ≤ k ≤ n and a linearly independent family b : Fin n → E (zero-based; the prefix b_0, …, b_{k−1} has been checked and row k is current). For k < n the relation (k, b) ⟶ (k′, c) holds when c arises from b in two moves. Size move: b′ agrees with b except b′_k = b_k − Σ_{l<k} r_l b_l for integers r_l, chosen so that the new coefficient satisfies |μ(b′)_{k,k−1}| ≤ 1/2; the integers r_l for l < k − 1 are unconstrained. Decision: if ‖b′*_k‖² < (3/4 − μ(b′)²_{k,k−1})·‖b′*_{k−1}‖² (Case 1, the strict Lovász failure), c is b′ with entries k − 1 and k interchanged and k′ = max(1, k − 1); otherwise (Case 2), c arises from b′ by further integer shears of row k by rows l < k with |μ(c)_{k,l}| ≤ 1/2 for every l < k, and k′ = k + 1. Here b* is Mathlib's ordered gramSchmidt and μ is the parent coefficient lllCoefficient. States with k = n are terminal. In ranks 0 and 1 the unique state is terminal.
Zero-based cursor: the source's one-based subscript k ∈ {2, …, n+1} of (1.15) is our k + 1; its start k = 2 is our k = 1 and its stop k = n + 1 is our k = n. The relation fixes no tie rule for nearest integers and allows any extra shears of row k by earlier rows before the test: Algorithm (1.15) and the native full-row variant are deterministic refinements of it. Comparisons are decided exactly in ℚ when the Gram matrix of b is rational; δ = 3/4 throughout.
*Construction.* Package the size move as an integer upper-unitriangular change of the current row, the Case 1 move as the adjacent transposition, and the Case 2 move as further row-k shears. Express each move by the parent shear and swap certificates, so the relation carries a unimodular certificate from the input. Record the coefficient and Gram–Schmidt updates of each move from the parent shear and swap update lemmas.
Its API is `LLLStep` (constructor: The step relation on states (k, b) described above); `LLLStep.certificate` (relation: A step (k, b) ⟶ (k′, c) has a unimodular certificate U with c = b·U); `LLLStep.span_eq` (relation: A step preserves the ℤ-span of the family); `LLLStep.cursor_eq` (characterisation: k′ = max(1, k − 1) in Case 1 and k′ = k + 1 in Case 2); `LLLStep.gramSchmidt_eq_of_case2` (relation: In Case 2 every Gram–Schmidt vector is unchanged); `LLLStep.potential_of_case1` (relation: With integral Gram data, Case 1 multiplies the integer potential by a factor in (0, 3/4); Case 2 leaves it unchanged).
*Used by:* LLL 1982, Algorithm (1.15)–(1.21) — the source algorithm is one deterministic refinement of the relation; GN.5/lll-exact-reduction (parent) — the native full-row variant is another refinement; the reconciliation is proved once for the relation; LLL 1982, termination (1.23)–(1.25) — the potential argument is a statement about every chain of the relation; EffectiveDiophantineMethods:ED.1/exclusion-certificate — an LLL witness is the output of a chain of steps together with its composed certificate.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.21), reprint folios 31–32 (PDF pp. 5–6); Lenstra–Lenstra–Lovász 1982, Fig. 1, reprint folio 33 (PDF p. 7).)
*Needs:* 5.1.1 (`lll-coefficient`), 5.1.2 (`lll-reduced`), 5.2.1 (`unimodular-basis-certificate`), 5.2.3 (`lll-shear-certificate`), 5.2.7 (`lll-swap-certificate`), 5.2.5 (`lll-shear-coefficients`), 5.2.10 (`lll-swap-later-coefficients`), Mathlib `InnerProductSpace.gramSchmidt`.
*Lean:* `LLLStep`, `LLLState`, `sizeMove`, `LovaszFails`, `lllPotential`.
**Checks.**

- `lll_step_swap_example` (computation): From (1, ((2,0),(0,1))) the unique successor is (1, ((0,1),(2,0))): μ_{10} = 0 and 1 < (3/4)·4.
- `lll_step_orthonormal` (degenerate): From (1, e) with e the standard basis of ℝ² the unique successor is (2, e), a terminal state.
- `lll_step_equality_no_swap` (non-example): For the Gram matrix [[1,1/2],[1/2,3/4]] the Lovász inequality holds with equality (1/2 = (3/4 − 1/4)·1), so no Case 1 step exists; a non-strict test would swap a family that is already LLL-reduced.
- `lll_step_exactLLL` (compatibility): A native full-row size reduction of row k (all |μ_{k,l}| ≤ 1/2 after the shears) is an admissible size move, so from every non-terminal state the parent exactLLL transition is a step of this relation.
- On ((2,0),(0,1)) at cursor 1 the only step is the swap to ((0,1),(2,0)) with cursor 1.
- The family with Gram matrix [[1,1/2],[1/2,3/4]] satisfies the Lovász inequality with equality, so its only step is Case 2.

5.5.2. **The invariant (1.16)–(1.17) and prefix reducedness.** Write Inv(k, b) for: |μ_{ij}| ≤ 1/2 for j < i < k, and ‖b*_i‖² ≥ (3/4 − μ²_{i,i−1})·‖b*_{i−1}‖² for 1 ≤ i < k. Then Inv(1, b) holds for every independent b; if Inv(k, b) and (k, b) ⟶ (k′, c) then Inv(k′, c) and span_ℤ(c) = span_ℤ(b); a terminal state (n, b) with Inv(n, b) is LLL-reduced. Moreover, along any chain from (1, b), the first time the cursor reaches m (1 ≤ m ≤ n), the vectors c_0, …, c_{m−1} form an LLL-reduced basis of the lattice spanned by the first m input vectors.
The last statement is Remark (1.37) of the source in zero-based form. No integrality of the Gram data is needed for this lemma.
*Proof.* Case 2: the size move and the further shears only change row k by earlier rows, so all Gram–Schmidt vectors and the coefficients of rows i < k are unchanged; the strict Lovász test failed to fire, so Inv extends to k + 1. Case 1: the swap only changes b*_{k−1}, b*_k and coefficients in rows ≥ k − 1; the prefix below k − 1 is untouched, so Inv(max(1, k − 1), c) holds. Terminal: Inv(n, b) is exactly the size and adjacent Lovász conditions of the parent IsLLLReduced, with independence preserved by the certificate. Prefix statement: before the cursor first reaches m, no step touches rows ≥ m, and every move inside the prefix preserves the ℤ-span of its first m vectors.
(Source: Lenstra–Lenstra–Lovász 1982, §1, conditions (1.16)–(1.17) and Case 1/Case 2, reprint folios 31–32 (PDF pp. 5–6); Lenstra–Lenstra–Lovász 1982, Remark (1.37), reprint folio 36 (PDF p. 10).)
*Needs:* 5.5.1, 5.1.2 (`lll-reduced`), 5.2.4 (`lll-shear-gram-schmidt`), 5.2.5 (`lll-shear-coefficients`), 5.2.8 (`lll-swap-first-vector`), 5.2.9 (`lll-swap-second-vector`), 5.2.10 (`lll-swap-later-coefficients`), 5.3.7 (`lll-prefix-invariant`), 5.2.1 (`unimodular-basis-certificate`).
*Lean:* `LLLInvariant`, `lllStep_invariant`, `lllInvariant_one`, `isLLLReduced_of_invariant`, `lllStep_prefix_reduced`.
**Checks.**

- On ((2,0),(0,1)) the chain (1, b) ⟶ (1, ((0,1),(2,0))) ⟶ (2, ((0,1),(2,0))) satisfies Inv at every state and ends LLL-reduced.
- After the first time the cursor reaches 1 nothing is asserted beyond the first vector; Inv(1, b) is vacuous.

5.5.3. **Termination and swap count of LLL reduction.** (a) Integral data. Let b be independent with integral Gram matrix (a rational Gram matrix is first scaled by a common denominator, which changes no decision). Along any chain of the step relation from (1, b), Case 1 occurs at most log_{4/3} D(b) times, where D(b) = ∏_{i=1}^{n−1} d_i(b) is the parent integer potential, and Case 2 occurs at most (number of Case 1 steps) + n − 1 times; every chain is finite and has at most n − 1 + 2·log_{4/3} D(b) steps. If ‖b_i‖² ≤ B for all i, with B ≥ 1, then d_i(b) ≤ B^i and D(b) ≤ B^{n(n−1)/2}, so at most (n(n−1)/2)·log_{4/3} B swaps occur. (b) Real data. For an arbitrary lattice L in E with independent basis b, every chain is still finite: along a chain each d_i is at least (2^{−i}·vol(B_i)·m(L)^{i/2})², where B_i is the closed unit ball of dimension i and m(L) the minimum of ‖x‖² over nonzero x ∈ L, so D is bounded below by a positive constant depending only on L, and each swap multiplies D by less than 3/4.
Swap counts are counts of Case 1 steps, independent of the tie rule and of extra shears. The lower bound in (b) replaces the source's Hermite-constant bound (3/4)^{i(i−1)/2} m(L)^i by Minkowski's first theorem; only positivity is used.
*Proof.* Shears leave every d_i unchanged (parent lll-prefix-shear-invariant); a Case 1 step replaces d_k by a factor T/B < 3/4 of itself and leaves the others (parent lll-prefix-swap-ratio, lll-strict-potential-decrease). In (a) D is a positive integer (parent lll-prefix-gram-integral), so it is at least 1 and decreases by a factor below 3/4 at each swap: at most log_{4/3} D(b) swaps. The cursor starts at 1, ends at n, falls by at most 1 in Case 1 and rises by 1 in Case 2, which bounds the Case 2 steps. d_i = ∏_{l<i} ‖b*_l‖² ≤ ∏_{l<i} ‖b_l‖² ≤ B^i by the Gram–Schmidt product formula and Hadamard's inequality. In (b), d_i is the squared covolume of the rank-i lattice spanned by b_0, …, b_{i−1} in its real span; Minkowski's first theorem in that span gives a nonzero lattice vector of squared length at most 4·(d_i^{1/2}/vol(B_i))^{2/i}, whence the lower bound.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.23)–(1.25) and the termination argument, reprint folios 33–34 (PDF pp. 7–8); Lenstra–Lenstra–Lovász 1982, Proof of (1.26), first paragraph, reprint folio 34 (PDF p. 8).)
*Needs:* 5.5.1, 5.5.2, 5.3.1 (`lll-integer-potential`), 5.3.4 (`lll-prefix-shear-invariant`), 5.3.5 (`lll-prefix-swap-ratio`), 5.3.6 (`lll-strict-potential-decrease`), 5.3.3 (`lll-prefix-gram-integral`), 5.3.2 (`lll-prefix-gram-product`), GN.0/hermitian-gram-hadamard, GN.0/covolume-square-gram, Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`.
*Lean:* `lllStep_swap_count`, `lllPotential_le_pow`, `lllStep_wellFounded_real`.
**Checks.**

- For b = ((2,0),(0,1)): D = d_1 = 4, one swap, and 1 ≤ log_{4/3} 4 ≈ 4.82.
- In rank 1 the bound is n − 1 + 0 = 0 steps.
- For the identity basis B = 1 forces zero swaps.

Construct `LLL115.step` (5.5.4), *Algorithm (1.15) of Lenstra–Lenstra–Lovász*: The deterministic reduction of Fig. 1. State: the family b together with the exact rational data μ_{ij} (j < i) and B_i = ‖b*_i‖², initialised by Gram–Schmidt and afterwards only updated, never recomputed. At cursor k < n: (1) if |μ_{k,k−1}| > 1/2, replace b_k by b_k − r·b_{k−1} with r = round(μ_{k,k−1}) (Mathlib's round, ⌊t + 1/2⌋) and update μ_{k,j} for j ≤ k − 1; (2) if B_k < (3/4 − μ²_{k,k−1})·B_{k−1}, swap b_{k−1} and b_k, update B_{k−1}, B_k and the coefficients by the formulas of (1.22), and set k := max(1, k − 1); otherwise, for l = k − 2, …, 0, if |μ_{k,l}| > 1/2 shear row k by round(μ_{k,l})·b_l, and set k := k + 1. The run starts at k = 1 and stops at k = n; it returns the final family, the composed unimodular certificate, and the number of swaps. Ranks 0 and 1 return the input with the identity certificate.
A coefficient equal to ±1/2 is left alone, as in the source's (*), which only acts when |μ| > 1/2. Termination is the step-relation termination for integral or rational Gram data.
*Construction.* Each source step is a step of the relation: the shear of (1) gives |μ_{k,k−1}| ≤ 1/2 by abs_sub_round, the test is the strict Lovász test, and Case 2 ends with all |μ_{k,l}| ≤ 1/2. The stored μ and B agree with lllCoefficient and the Gram–Schmidt norms of the current family after every step: the shear updates are the parent shear-coefficient lemma and the swap updates are (1.22), i.e. the parent swap lemmas. Define the run by well-founded recursion on the lexicographic measure of the termination theorem, and read off reducedness from the invariant at k = n.
Its API is `LLL115.step` (constructor: One step of Fig. 1 on the stored state (cursor, family, μ, B)); `LLL115.step_isStep` (compatibility: Each source step is a step of LLLStep); `LLL115.data_spec` (compatibility: The stored μ and B equal lllCoefficient and ‖b*_i‖² of the current family after every step); `LLL115.run` (constructor: The run from cursor 1 to cursor n, by well-founded recursion on the termination measure); `LLL115.run_reduced` (relation: The output family is LLL-reduced); `LLL115.run_certificate` (projection: The output comes with a unimodular certificate from the input); `LLL115.run_swaps_le` (relation: The number of swaps is at most log_{4/3} D(b) for integral Gram data).
*Used by:* LLL 1982, Proposition (1.26) — its operation count is a statement about this algorithm; GN.5/lll-variant-reconciliation — compared step by step with the native variant; GN.5/lll-intermediate-size-bounds — the size bounds (1.30)–(1.36) hold along its runs.
(Source: Lenstra–Lenstra–Lovász 1982, Fig. 1 and §1, (1.15)–(1.22), reprint folios 31–33 (PDF pp. 5–7); Lenstra–Lenstra–Lovász 1982, §1, remark after (1.22), reprint folio 32 (PDF p. 6).)
*Needs:* 5.5.1, 5.5.2, 5.5.3, 5.2.2 (`lll-nearest-integer`), 5.2.5 (`lll-shear-coefficients`), 5.2.8 (`lll-swap-first-vector`), 5.2.9 (`lll-swap-second-vector`), 5.2.10 (`lll-swap-later-coefficients`), 5.2.1 (`unimodular-basis-certificate`), Mathlib `round`, Mathlib `round_eq`, Mathlib `abs_sub_round`.
*Lean:* `LLL115.State`, `LLL115.init`, `LLL115.step`, `LLL115.run`.
**Checks.**

- `lll115_swap_example` (computation): On ((2,0),(0,1)) the run performs one swap and returns ((0,1),(2,0)) with certificate [[0,1],[1,0]] of determinant −1.
- `lll115_shear_example` (computation): On ((1,0),(1,1)) the run returns ((1,0),(0,1)) with certificate [[1,−1],[0,1]] and no swap.
- `lll115_rank_one` (degenerate): In rank 1 the run returns its input with the identity certificate and zero swaps.
- `lll115_tie_untouched` (non-example): On ((2,0),(1,5)) the coefficient μ_{10} = 1/2 is left alone and the output is the input, whereas the native exactLLL shears to ((2,0),(−1,5)); both outputs are LLL-reduced (‖b*_1‖² = 25 ≥ (1/2)·4), so the two variants need not return the same basis.
- On ((1,0),(1,1)) the run shears once with r = 1, passes the test and returns ((1,0),(0,1)) with certificate [[1,−1],[0,1]].
- Every output satisfies the parent IsLLLReduced and spans the input lattice.

5.5.5. **Algorithm (1.15) and the native full-row variant agree.** (a) Every transition of the parent native variant exactLLL (full descending nearest-integer reduction of row k, then the strict Lovász test, then swap with cursor max(1, k − 1) or advance) and every step of Algorithm (1.15) is a step of the LLL step relation. Hence both satisfy the invariant (1.16)–(1.17), both terminate within the swap bound log_{4/3} D(b) for integral Gram data, and both return LLL-reduced bases of the input lattice with unimodular certificates. (b) Run both from the same input. As long as no Case 1 step occurs at which the coefficient μ_{k,k−1}, after its size reduction, equals ±1/2, the two runs visit the same cursors, take the same decisions, have the same Gram–Schmidt vectors b*_i at every step, and their families differ by an integer upper unitriangular matrix (b′_i − b_i ∈ span_ℤ(b_0, …, b_{i−1}) for every i). (c) At such a tie the runs may diverge; part (a) still holds for both.
The relation of (b) is equality of the flag of ℤ-spans of prefixes; it implies equality of every Gram–Schmidt vector.
*Proof.* (a) The native size move uses round, so |μ_{k,k−1}| ≤ 1/2 after it (abs_sub_round) and the full descending reduction gives the Case 2 condition (parent lll-descending-size-reduction); the source steps are steps by lll-source-algorithm. (b) Induction on the step count. Families related by an integer upper unitriangular matrix have the same prefix spans, hence the same Gram–Schmidt vectors (span_gramSchmidt_Iio). Before the test the two values of μ_{k,k−1} differ by an integer (the b*_{k−1}-coordinate of an element of span_ℤ(b_0, …, b_{k−1}) is its integer coefficient on b_{k−1}); after size reduction both lie in [−1/2, 1/2], so they agree unless the pair is {−1/2, 1/2}. The Lovász test only involves μ², B_{k−1} and B_k, so the decisions agree. With equal μ_{k,k−1}, the two current rows differ by an element of span_ℤ(b_0, …, b_{k−2}), so after the swap the families are still related by an upper unitriangular integer matrix; in Case 2 both rows are reduced in the same coset of span_ℤ(b_0, …, b_{k−1}). (c) On ((2,0),(1,1)) the coefficient μ_{10} is 1/2 and the test fails (1 < (3/4 − 1/4)·4). Algorithm (1.15) swaps without shearing and ends at ((1,1),(1,−1)); the native variant first shears to (−1,1), swaps, and ends at ((−1,1),(1,1)). The Gram–Schmidt vectors differ, both outputs are LLL-reduced; nothing beyond (a) is asserted at ties.
(Source: Lenstra–Lenstra–Lovász 1982, Fig. 1 and §1, (1.18)–(1.21), reprint folios 31–33 (PDF pp. 5–7); Lenstra–Lenstra–Lovász 1982, §1, remark after (1.3), reprint folio 28 (PDF p. 2).)
*Needs:* 5.5.1, 5.5.2, 5.5.3, 5.5.4, 5.4.1 (`lll-exact-reduction`), 5.2.6 (`lll-descending-size-reduction`), 5.2.2 (`lll-nearest-integer`), 5.2.4 (`lll-shear-gram-schmidt`), Mathlib `InnerProductSpace.span_gramSchmidt_Iio`, Mathlib `abs_sub_round`, Mathlib `round_eq`.
*Lean:* `gramSchmidt_eq_of_upperUnitriangular`, `lll_variant_lockstep`.
**Checks.**

- On ((2,0),(0,1)) both variants perform the same single swap and return ((0,1),(2,0)).
- On ((2,0),(1,5)) the outputs differ ((1,5) against (−1,5)) but both are LLL-reduced with equal Gram–Schmidt norms 4 and 25.
- On ((2,0),(1,1)) a tie precedes a swap: the outputs ((1,1),(1,−1)) and ((−1,1),(1,1)) have different Gram–Schmidt vectors, and both are LLL-reduced.

### 5.6 Running time: Proposition (1.26)

For integer input the prefix determinants d_k are common denominators of all Gram–Schmidt data, so the algorithm runs on integers. With |b_i|² ≤ B every number stays of binary length O(n log B), and the swap count of 5.5.3 bounds the number of passes; together they give O(n⁴ log B) arithmetic operations.

5.6.1. **The prefix determinants are common denominators.** Let b : Fin n → E be independent with integral Gram matrix, and d_k = det Gram(b_0, …, b_{k−1}) for 0 ≤ k ≤ n (d_0 = 1). Then (i) ‖b*_i‖² = d_{i+1}/d_i; (ii) d_i·b*_i ∈ span_ℤ(b_0, …, b_i); (iii) d_{j+1}·μ_{ij} ∈ ℤ for j < i. In particular every Gram–Schmidt quantity the reduction stores is an integer divided by one of the positive integers d_k.
Zero-based indexing: the source's (1.27)–(1.29) read ‖b*_i‖² = d_i/d_{i−1}, d_{i−1}b*_i ∈ L and d_jμ_{ij} ∈ ℤ with one-based indices. When b_i ∈ ℤ^m, (ii) gives d_i·b*_i ∈ ℤ^m.
*Proof.* (i) is the quotient of two instances of the parent prefix Gram product. (ii) Write b*_i = b_i − Σ_{j<i} λ_{ij} b_j; the λ_{ij} solve the linear system with matrix Gram(b_0, …, b_{i−1}) and integral right-hand side (⟨b_i, b_l⟩)_l, so Cramer's rule gives d_i·λ_{ij} ∈ ℤ. (iii) d_{j+1}μ_{ij} = d_{j+1}⟨b_i, b*_j⟩/‖b*_j‖² = ⟨b_i, d_j b*_j⟩, an integer by (ii) and integrality of the Gram matrix.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.27)–(1.29) and their proofs, reprint folio 35 (PDF p. 9).)
*Needs:* 5.3.2 (`lll-prefix-gram-product`), 5.3.3 (`lll-prefix-gram-integral`), 5.1.1 (`lll-coefficient`), Mathlib `Matrix.cramer`, Mathlib `Matrix.mulVec_cramer`, Mathlib `Matrix.gram`.
*Lean:* `lll_denominator_integrality`.
**Checks.**

- For b = ((2,0),(1,1)): d_1 = 4, d_2 = 4, ‖b*_1‖² = 1 = d_2/d_1, μ_{10} = 1/2 and d_1μ_{10} = 2 ∈ ℤ.
- d_0 b*_0 = b_0 always lies in the lattice.

5.6.2. **Sizes of all numbers during Algorithm (1.15).** In the source's one-based indexing: let b_1, …, b_n ∈ ℤ^n be a basis of L with |b_i|² ≤ B for all i, B ≥ 2, and run Algorithm (1.15). Throughout the run, d_i ≤ B^i, |b*_i|² ≤ B, |μ_{ij}| ≤ 2^{n−1}(nB^{n−1})^{1/2} for 1 ≤ j < i ≤ n, and |b_i|² ≤ n²(4B)^n. Each time the run returns to the situation (1.16)–(1.17) with current subscript k: (1.30) |b_i|² ≤ nB for i ≠ k; (1.31) |b_k|² ≤ n²(4B)^n if k ≠ n + 1; (1.32) |μ_{ij}| ≤ 1/2 for j < i < k; (1.33) |μ_{ij}| ≤ (nB^j)^{1/2} for j < i and i > k; (1.34) |μ_{kj}| ≤ 2^{n−k}(nB^{n−1})^{1/2} for j < k when k ≠ n + 1. The comparison (1.35) μ_{ij}² ≤ |b_i|²/|b*_j|² = d_{j−1}|b_i|²/d_j ≤ B^{j−1}|b_i|² links the coefficient and length bounds.
The bounds are stated for Algorithm (1.15); the native variant has its own constants and is not covered here. In the zero-based notation of the packet, d_i and b*_i shift as in lll-denominator-integrality.
*Proof.* The d_i never increase (they change only in Case 1, by a factor below 3/4) and start at most B^i; max_i |b*_i|² never increases, since in (1.22) the new |c*_{k−1}|² is below 3/4 of |b*_{k−1}|² and |c*_k|² ≤ |b*_{k−1}|². (1.30) is preserved: Case 1 does not change the set {b_i : i ≠ k}, Case 2 replaces {b_i : i > k} by a subset, and for i < k it follows from (1.32); (1.33) follows from (1.30) and (1.35). (1.34): at the end of Case 2 it is (1.33) at the previous stage; at the end of Case 1, size reduction (1.18) replaces μ_{kj} by μ_{kj} − rμ_{k−1,j} with |r| < 2|μ_{k,k−1}|, which at most doubles the bound (1.36). Between returns, each size-reduction pass at most doubles max_j |μ_{kj}|, giving the global coefficient bound, and |b_k|² ≤ Σ_j μ_{kj}²|b*_j|² + |b*_k|² gives the global length bound.
(Source: Lenstra–Lenstra–Lovász 1982, Proof of (1.26), inequalities (1.30)–(1.36) and the final two bounds, reprint folios 35–36 (PDF pp. 9–10).)
*Needs:* 5.5.4, 5.6.1, 5.5.2, 5.2.8 (`lll-swap-first-vector`), 5.2.9 (`lll-swap-second-vector`), 5.2.5 (`lll-shear-coefficients`), 5.3.2 (`lll-prefix-gram-product`), GN.0/hermitian-gram-hadamard.
*Lean:* `lll_intermediate_size_bounds`.
**Checks.**

- For n = 2, B = 4 and b = ((2,0),(0,1)) the bounds give d_1 ≤ 4, |μ_{21}| ≤ 2·(2·4)^{1/2} and |b_i|² ≤ 4·16², all met by the run's actual values 4, 0 and 4.
- In rank one every bound is the input bound |b_1|² ≤ B.

5.6.3. **Polynomial running time of LLL reduction (Proposition 1.26).** Let L ⊂ ℤ^n be a lattice with basis b_1, …, b_n and B ≥ 2 with |b_i|² ≤ B. Algorithm (1.15), carried out on integers by storing the vectors b_i, the prefix determinants d_i and the numerators d_jμ_{ij} (one-based), needs O(n⁴ log B) arithmetic operations (addition, subtraction, multiplication and exact division of integers), and every integer on which an operation is performed has binary length O(n log B). With schoolbook integer arithmetic this is O(n⁶ (log B)³) bit operations. Formal version: for the cost-instrumented integral run, which charges one unit per integer operation, there is an absolute constant C such that the total charge is at most C·n⁴·log B, every stored integer has absolute value at most n·(4B)^{2n}, and every operand of an operation (a stored integer, or a sum of two products of stored integers before an exact division) has absolute value at most 2n²·(4B)^{4n}.
Rational input is first scaled to integral Gram data; the source's Remark (1.38) allows integral Gram data instead of L ⊂ ℤ^n. The constant C is absolute; no claim is made about its value beyond existence, and no bound is claimed for floating-point variants.
*Proof.* The initialisation computes the d_i and the numerators d_jμ_{ij} in O(n³) operations (lll-denominator-integrality). By the termination theorem with d_i ≤ B^i and D ≥ 1, Cases 1 and 2 occur O(n² log B) times. Step (1.18) and Case 1 cost O(n) operations; Case 2 treats O(n) values of l at O(n) operations each; multiply by the number of passes. Stored integers: d_i ≤ B^n, |d_jμ_{ij}| ≤ B^{n−1}·2^{n−1}(nB^{n−1})^{1/2}, and every coordinate of b_i is at most n(4B)^{n/2} by the size bounds; each is at most n(4B)^{2n}. The integral update formulas add two products of stored integers before an exact division, which gives the operand bound.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition (1.26), its Remark and proof, reprint folios 34–36 (PDF pp. 8–10); Lenstra–Lenstra–Lovász 1982, Remark (1.38), reprint folio 36 (PDF p. 10).)
*Needs:* 5.5.4, 5.5.3, 5.6.1, 5.6.2.
*Lean:* `lllCostedRun`, `lll_arithmetic_complexity`.
*Planet:* LLL running-time bound.
**Checks.**

- For n = 1 the run performs no step after initialisation.
- For B = 2 and n = 2 the swap bound is at most log_{4/3} 2 < 3 and every stored integer is at most 2·8⁴.

### 5.7 What a reduced basis bounds: (1.7)–(1.14)

These are the lattice bounds the consumers read off a reduced basis: lengths against Gram–Schmidt lengths, the orthogonality defect, the first vector against the covolume, any basis vector against any independent family, and the successive minima. Remark (1.14) turns each constant into one computed from the output itself.

5.7.1. **Lengths of a reduced basis against its Gram–Schmidt vectors (1.7).** For an LLL-reduced family b : Fin n → E (δ = 3/4) and indices 0 ≤ j ≤ i < n, ‖b_j‖² ≤ 2^i·‖b*_i‖².
Zero-based form of the source's |b_j|² ≤ 2^{i−1}|b*_i|² for 1 ≤ j ≤ i ≤ n.
*Proof.* ‖b_i‖² = ‖b*_i‖² + Σ_{j<i} μ_{ij}²‖b*_j‖² ≤ ‖b*_i‖² + (1/4)Σ_{j<i} 2^{i−j}‖b*_i‖² = (2^{i−1} + 1/2)‖b*_i‖² ≤ 2^i‖b*_i‖², using the parent growth bound ‖b*_j‖² ≤ 2^{i−j}‖b*_i‖². For j ≤ i combine ‖b_j‖² ≤ 2^j‖b*_j‖² with ‖b*_j‖² ≤ 2^{i−j}‖b*_i‖².
(Source: Lenstra–Lenstra–Lovász 1982, Proposition (1.6), (1.7) and its proof, reprint folio 29 (PDF p. 3).)
*Needs:* 5.1.2 (`lll-reduced`), 5.1.3 (`lll-gram-schmidt-growth`), 5.1.1 (`lll-coefficient`), Mathlib `InnerProductSpace.gramSchmidt_def`, Mathlib `InnerProductSpace.gramSchmidt_orthogonal`.
*Lean:* `lll_basis_length_growth`.
**Checks.**

- For the reduced basis ((1,0),(1/2,1)): ‖b_1‖² = 5/4 ≤ 2·1.
- For i = 0 the statement is ‖b_0‖² ≤ ‖b*_0‖², an equality.

5.7.2. **Orthogonality defect of a reduced basis (1.8).** Let b be an LLL-reduced basis of a lattice L in E, of rank n, and write covol(L) = ∏_i ‖b*_i‖ = (det Gram(b))^{1/2}, which is ZLattice.covolume of L in its real span. Then covol(L) ≤ ∏_i ‖b_i‖ ≤ 2^{n(n−1)/4}·covol(L). The left inequality (Hadamard, (1.10)) holds for every basis.
For a full lattice in E, covol(L) is Mathlib's ZLattice.covolume (GN.0/covolume-square-gram).
*Proof.* covol(L)² = d_n = ∏‖b*_i‖² (parent prefix Gram product) and ‖b*_i‖ ≤ ‖b_i‖ give the left inequality (equivalently GN.0's Hadamard inequality). lll-basis-length-growth with j = i gives ‖b_i‖ ≤ 2^{i/2}‖b*_i‖; multiply over i to get the factor 2^{n(n−1)/4}.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition (1.6), (1.8), (1.10) and the proof, reprint folios 29–30 (PDF pp. 3–4).)
*Needs:* 5.7.1, 5.3.2 (`lll-prefix-gram-product`), GN.0/hermitian-gram-hadamard, GN.0/covolume-square-gram.
*Lean:* `lll_orthogonality_defect`.
**Checks.**

- For an orthogonal basis both inequalities are equalities on the left.
- For ((1,0),(1/2,1)): covol = 1, ∏‖b_i‖ = (5/4)^{1/2} ≤ 2^{1/2}.

5.7.3. **First vector against the covolume (1.9).** For n ≥ 1 and an LLL-reduced basis b of a rank-n lattice L, ‖b_0‖ ≤ 2^{(n−1)/4}·covol(L)^{1/n}.
Positive rank is needed for the n-th root.
*Proof.* Take j = 0 in lll-basis-length-growth: ‖b_0‖² ≤ 2^i‖b*_i‖² for every i. Multiply over i: ‖b_0‖^{2n} ≤ 2^{n(n−1)/2}∏‖b*_i‖² = 2^{n(n−1)/2}covol(L)².
(Source: Lenstra–Lenstra–Lovász 1982, Proposition (1.6), (1.9) and its proof, reprint folio 29 (PDF p. 3).)
*Needs:* 5.7.1, 5.3.2 (`lll-prefix-gram-product`).
*Lean:* `lll_first_vector_covolume`.
**Checks.**

- For ℤ² with the standard basis: 1 ≤ 2^{1/4}.
- Combined with lll-short-vector-factor this bounds the first vector both by the minimum and by the covolume.

5.7.4. **Reduced bases against independent lattice vectors (1.12).** Let b be an LLL-reduced basis of a rank-n lattice L and x_0, …, x_{t−1} ∈ L linearly independent. Then ‖b_j‖² ≤ 2^{n−1}·max_l ‖x_l‖² for every j < t. The factor 2^{n−1} may be replaced by the certificate constant max{‖b_j‖²/‖b*_i‖² : j ≤ i < n}, and in the short-vector bound by max_i ‖b_0‖²/‖b*_i‖² (Remark (1.14)).
The constants of (1.14) are computable from the exact Gram–Schmidt data of the output.
*Proof.* Write x_l = Σ r_{il} b_i with r_{il} ∈ ℤ and let i(l) be the largest index with r_{i(l),l} ≠ 0; as in (1.11), ‖x_l‖² ≥ ‖b*_{i(l)}‖² ((1.13)). Order the x_l with i(0) ≤ ⋯ ≤ i(t−1); linear independence forces j ≤ i(j). Then ‖b_j‖² ≤ 2^{i(j)}‖b*_{i(j)}‖² ≤ 2^{n−1}‖x_j‖² by lll-basis-length-growth; keeping the ratio ‖b_j‖²/‖b*_{i(j)}‖² instead of 2^{i(j)} gives (1.14).
(Source: Lenstra–Lenstra–Lovász 1982, Proposition (1.12), (1.13), its proof and Remark (1.14), reprint folio 30 (PDF p. 4).)
*Needs:* 5.7.1, 5.1.4 (`lll-short-vector-factor`), 5.1.2 (`lll-reduced`).
*Lean:* `lll_independent_family_bound`.
**Checks.**

- With t = 1 the statement is the parent short-vector bound.
- For ℤ² with the standard basis and x = ((1,1),(1,−1)), max‖x_l‖² = 2 bounds ‖b_0‖², ‖b_1‖² ≤ 2·2.

5.7.5. **A reduced basis approximates the successive minima.** Let L be a full lattice in an n-dimensional real inner-product space E, b an LLL-reduced basis of L, and λ_i (0 ≤ i < n) the successive minima of L with respect to the closed unit ball (GN.1/successive-minimum, zero-based). Then 2^{−i}·λ_i² ≤ ‖b_i‖² ≤ 2^{n−1}·λ_i². In particular ∏_i λ_i ≤ ∏_i ‖b_i‖ ≤ 2^{n(n−1)/4}·covol(L).
The source's minima are minima of |·|², i.e. our λ_i²; its index i is our i + 1.
*Proof.* Upper bound: GN.1 gives independent x_0, …, x_i ∈ L with ‖x_l‖ = λ_l ≤ λ_i; apply lll-independent-family-bound with t = i + 1 and j = i. Lower bound: b_0, …, b_i are independent, so λ_i ≤ max_{j ≤ i}‖b_j‖, and ‖b_j‖² ≤ 2^i‖b*_i‖² ≤ 2^i‖b_i‖² by lll-basis-length-growth. The product statement multiplies the upper bounds of the λ_i ≤ ‖b_{(i)}‖ after sorting, together with lll-orthogonality-defect.
(Source: Lenstra–Lenstra–Lovász 1982, Remark after (1.12), reprint folio 30 (PDF p. 4).)
*Needs:* 5.7.4, 5.7.1, 5.7.2, GN.1/successive-minimum, GN.1/successive-minimum-witnesses, GN.1/successive-minimum-monotone.
*Lean:* `ballMinimum`, `lll_successive_minima_bounds`.
**Checks.**

- For ℤ^n with the standard basis all λ_i = 1 and ‖b_i‖ = 1.
- For the reduced basis ((1,0),(1/2,1)) of its lattice, λ_0 = 1, λ_1 = (5/4)^{1/2}, and 2^{−1}·5/4 ≤ 5/4 ≤ 2·5/4.

### 5.8 A reduced basis through a prescribed primitive vector

Routed from Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao: a basis that begins with a prescribed primitive short vector (for 𝓞_K, the vector 1) and whose i-th vector is within an explicit factor c_i of every lattice vector outside the span of the previous ones. The number-field trace metric and the class-group application stay with the downstream class-group torsion roadmap.

5.8.1. **A reduced basis extending a prescribed primitive short vector.** Let Λ be a full lattice in a real inner-product space E of dimension n ≥ 1, A ≥ 1, and u ∈ Λ primitive with ‖u‖ ≤ A·λ_0(Λ) (λ_0 the first minimum for the unit ball). There is a ℤ-basis b_0 = u, b_1, …, b_{n−1} of Λ such that for every 0 ≤ i < n and every w ∈ Λ outside span_ℝ(b_0, …, b_{i−1}), ‖b_i‖ ≤ c_i·‖w‖, where c_0 = A and c_i = 1 + (1/2)·Σ_{j<i} c_j for i ≥ 1. For A = 1 this gives c_i = (3/2)^i. Moreover b_0, …, b_{i−1} is a ℤ-basis of Λ ∩ span_ℝ(b_0, …, b_{i−1}) for every i.
No ordering ‖b_0‖ ≤ ‖b_1‖ ≤ ⋯ is asserted; BSTTTZ's ordering comes from Minkowski reduction, which is not used here. For lattice vectors, lying outside span_ℝ(b_0, …, b_{i−1}) is the same as lying outside its ℚ-span, since b_0, …, b_{i−1} is primitive.
*Proof.* Induction on i keeping V_{i−1} = span_ℝ(b_0, …, b_{i−1}) with Λ ∩ V_{i−1} = span_ℤ(b_0, …, b_{i−1}); for i = 0 use primitivity of u (Λ ∩ ℝu = ℤu) and ‖u‖ ≤ Aλ_0 ≤ A‖w‖. Step i ≥ 1: choose w_i ∈ Λ ∖ V_{i−1} of least norm (GN.1/minimum-outside-subspace). Extend b_0, …, b_{i−1} to a basis b_0, …, b_{i−1}, b′ of the saturated lattice Λ ∩ (V_{i−1} + ℝw_i) (GN.0/prescribed-primitive-basis). Let π be the orthogonal projection onto V_{i−1}^⊥. π(w_i) is a nonzero integer multiple of π(b′), so ‖π(b′)‖ ≤ ‖w_i‖. Subtract from b′ the integer combination of b_0, …, b_{i−1} rounding the coordinates of b′ − π(b′) to get b_i with ‖b_i − π(b_i)‖ ≤ (1/2)Σ_{j<i}‖b_j‖. Every w ∉ V_{i−1} has ‖w‖ ≥ ‖w_i‖ and w_i ∉ V_{j−1} for j < i, so by induction ‖b_j‖ ≤ c_j‖w_i‖ and ‖b_i‖ ≤ (1 + (1/2)Σ_{j<i}c_j)‖w_i‖ = c_i‖w_i‖ ≤ c_i‖w‖. Evertse's projection-and-lift lemmas give the same saturation and lifting steps for the shortest-vector start A = 1.
(Source: Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao (arXiv v1), §3, second paragraph, printed pp. 4–5 (arXiv v1); Evertse, Geometry of numbers notes, §2.3, proof of Theorem 2.11, Lemmas 2.16–2.19, pp. 28–30.)
*Needs:* GN.1/minimum-outside-subspace, GN.0/prescribed-primitive-basis, GN.1/successive-minimum, Tau Ceti `IsPrimitive`, Tau Ceti `IsPrimitive.exists_basis`, Mathlib `Module.Basis.ofZLatticeBasis`, Mathlib `abs_sub_round`.
*Lean:* `primitivePrefixConst`, `primitive_prefix_reduced_basis`, `primitivePrefixConst_one`.
**Checks.**

- For Λ = ℤ², u = (1,0), A = 1: c_1 = 3/2 and b_1 = (0,1) satisfies ‖b_1‖ = 1 ≤ (3/2)‖w‖ for every w ∉ ℝu.
- For n = 1 the basis is (u) and the only condition is ‖u‖ ≤ Aλ_0.
- With A = 3 and u = (2,1) in ℤ² (primitive, ‖u‖ = √5 ≤ 3·1), c_1 = 5/2; the saturated completion b′ = (1,0) has coordinate 2/5 along u, which rounds to 0, so b_1 = (1,0) and ‖b_1‖ = 1 ≤ (5/2)‖w‖ for every w ∉ ℝu.

5.8.2. **Product of the primitive-prefix basis against the covolume.** For Λ, A, u and the basis b of primitive-prefix-reduced-basis, with λ_0 ≤ ⋯ ≤ λ_{n−1} the successive minima of Λ for the closed unit ball and v_n > 0 the volume of the unit ball of E: ‖b_i‖ ≤ c_i·λ_i for every i, and covol(Λ) ≤ ∏_i ‖b_i‖ ≤ (∏_i c_i)·(2^n/v_n)·covol(Λ).
covol(Λ) is Mathlib's ZLattice.covolume for the canonical volume of E.
*Proof.* Among the GN.1 minimum witnesses x_0, …, x_i (‖x_l‖ = λ_l ≤ λ_i), at least one lies outside the i-dimensional space span_ℝ(b_0, …, b_{i−1}); apply the bound of primitive-prefix-reduced-basis to it. The left inequality is Hadamard's inequality for a basis (GN.0). The right inequality multiplies ‖b_i‖ ≤ c_iλ_i and applies Minkowski's second theorem ∏λ_i·v_n ≤ 2^n·covol(Λ) (GN.1/minkowski-second-upper).
(Source: Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao (arXiv v1), §3, second paragraph, printed p. 5 (arXiv v1); Evertse, Geometry of numbers notes, §2.3, Theorem 2.11, Corollary 2.12 and Exercise 2.11, pp. 27–30.)
*Needs:* 5.8.1, GN.1/successive-minimum-witnesses, GN.1/minkowski-second-upper, GN.0/hermitian-gram-hadamard, GN.0/covolume-square-gram, Mathlib `ZLattice.covolume`.
*Lean:* `primitive_prefix_basis_product`.
**Checks.**

- For ℤ² with u = (1,0), A = 1: ∏‖b_i‖ = 1 ≤ (3/2)·(4/π)·1.
- In dimension one b = (u) with ‖u‖ = covol(Λ), and the right-hand side is A·(2/2)·covol(Λ), since the unit ball has length 2.

### 5.9 Quadratic completion, enumeration and certified counts

The Fincke–Pohst enumeration moves down here from EffectiveDiophantineMethods ED.1: ComputationalNumberTheory CN.4 requested it from this layer, and a tier-15 roadmap cannot import from tier 17. ED.1 keeps its Diophantine distance witnesses and exclusion certificates and imports the generic enumeration. The enumeration is exact over ℚ, lists every lattice point of an ellipsoid with its boundary, and gives counts and the representation numbers of positive definite Tau Ceti lattices.

Construct `quadraticCompletion` (5.9.1), *Exact quadratic completion of a rational symmetric matrix*: For a symmetric G ∈ ℚ^{n×n}, the quadratic completion consists of pivots q_ii and multipliers q_ij (i < j) produced by symmetric Gaussian elimination: q_00 = G_00, q_0j = G_0j/q_00, and inductively the same on the Schur complement of the processed rows. It is defined when every pivot is nonzero, and then xᵀGx = Σ_i q_ii·(x_i + Σ_{j>i} q_ij x_j)² for all x ∈ ℚ^n; equivalently G = Uᵀ·diag(q)·U with U upper unitriangular and U_ij = q_ij. All pivots are positive if and only if G is positive definite, and then det G = ∏_i q_ii. After casting to ℝ the completion of a positive definite G is Mathlib's LDL decomposition: q_ii = LDL.diagEntries i and U = (LDL.lower)ᵀ; Tau Ceti's cholesky factor is Uᵀ·diag(q_ii^{1/2}).
Zero-based indices; the empty matrix has no pivots and is positive definite. Arithmetic is exact over ℚ; no square root is taken. A nonpositive pivot stops the elimination and certifies that G is not positive definite.
*Construction.* Gaussian elimination on the first row and column writes xᵀGx = q_00(x_0 + Σ_{j>0} q_0j x_j)² + x′ᵀSx′ with S the Schur complement; induct on n. Positivity of all pivots is equivalent to positive definiteness by Sylvester's criterion in the form d_k = ∏_{i<k} q_ii for the leading minors d_k, together with the displayed sum of squares. Uniqueness of a factorisation Uᵀ D U with U unit upper triangular and D diagonal invertible identifies the cast completion with LDL.lower and LDL.diagEntries, whose product formula is LDL.lower_conj_diag; cholesky_mul_transpose gives the Cholesky comparison.
Its API is `quadraticCompletion` (data: The pivots q_ii and multipliers q_ij of a symmetric rational matrix, as an Option that is none when a pivot vanishes); `quadraticCompletion_spec` (characterisation: xᵀGx = Σ_i q_ii (x_i + Σ_{j>i} q_ij x_j)² for all x ∈ ℚ^n when all pivots are nonzero); `quadraticCompletion_pivots_pos_iff` (characterisation: All pivots exist and are positive iff G is positive definite); `quadraticCompletion_det` (relation: det G = ∏_i q_ii); `quadraticCompletion_cast_eq_LDL` (compatibility: For positive definite G, the cast pivots are LDL.diagEntries and the cast multiplier matrix is the transpose of LDL.lower); `IsLLLReducedGram` (characterisation: A positive definite real form A is LLL-reduced when the subdiagonal entries of LDL.lower have absolute value at most 1/2 and consecutive LDL.diagEntries satisfy the Lovász inequality at δ = 3/4; for the Gram matrix of a family this is the parent IsLLLReduced (quadratic-completion-gram-schmidt). It expresses reducedness of a rational model UᵀG̃U without choosing vectors).
*Used by:* de Weger §3.6 Figure 2; Fincke–Pohst (2.3) — the enumeration bounds each coordinate through the completed squares; GN.5/quadratic-completion-gram-schmidt — for a Gram matrix the pivots are the squared Gram–Schmidt lengths; GN.5/entrywise-enclosure-comparison — positive pivots of G̃ − cI certify a rational Loewner lower bound; ComputationalNumberTheory:CN.4/effective-ellipsoid-cover — requested exact positive-definite enumeration rests on this decomposition.
(Source: de Weger 1989, §3.6, Figure 2, initialisation, printed pp. 51–52; Mathlib at the pin, Analysis/Matrix/LDL.lean: LDL.lower, LDL.diagEntries, LDL.lower_conj_diag.)
*Needs:* Mathlib `Matrix.PosDef`, Mathlib `Matrix.PosDef.det_pos`, Mathlib `LDL.lower`, Mathlib `LDL.diagEntries`, Mathlib `LDL.lower_conj_diag`, Tau Ceti `cholesky`, Tau Ceti `cholesky_mul_transpose`.
*Lean:* `quadraticCompletion`, `IsLLLReducedGram`.
**Checks.**

- `quadraticCompletion_hexagonal` (computation): G = [[2,1],[1,2]]: pivots (2, 3/2) and q_01 = 1/2.
- `quadraticCompletion_identity` (degenerate): G = I_n: all pivots 1 and all multipliers 0; for n = 0 the completion is empty.
- `quadraticCompletion_indefinite` (non-example): G = [[1,2],[2,1]] has pivots (1, −3), so the positivity test rejects it.
- `quadraticCompletion_LDL_compat` (compatibility): For G = [[2,1],[1,2]] over ℝ, LDL.diagEntries = (2, 3/2) and the subdiagonal entry of LDL.lower is 1/2.
- For G = [[2,1],[1,2]] the pivots are 2 and 3/2 with q_01 = 1/2, and 2·(3/2) = 3 = det G.
- For G = [[1,2],[2,1]] the second pivot is −3, so G is not positive definite (x = (1,−1) gives −2).

5.9.2. **Quadratic completion of a Gram matrix is Gram–Schmidt.** For a linearly independent family b : Fin n → E in a real inner-product space with Gram matrix G (G_ij = ⟨b_i, b_j⟩), the quadratic completion of G has pivots q_ii = ‖b*_i‖² and multipliers q_ij = μ_{ji} for i < j: xᵀGx = Σ_i ‖b*_i‖²·(x_i + Σ_{j>i} μ_{ji} x_j)². For an LLL-reduced b this gives q_ii ≥ 2^{−i}‖b_0‖².
G is real here; when G is rational the statement holds in ℚ.
*Proof.* Expand Σ_j x_j b_j = Σ_i (x_i + Σ_{j>i} μ_{ji} x_j) b*_i using b_j = b*_j + Σ_{i<j} μ_{ji} b*_i, and use orthogonality of the b*_i. A factorisation Uᵀ·diag(q)·U with U unit upper triangular and q positive is unique, so this is the completion. The LLL bound is the parent growth lemma with j = 0.
(Source: de Weger 1989, §3.6, Figure 2 and the surrounding text, printed pp. 51–52; Mathlib at the pin, Analysis/Matrix/LDL.lean: LDL.lowerInv_eq_gramSchmidtBasis.)
*Needs:* 5.9.1, 5.1.1 (`lll-coefficient`), 5.1.3 (`lll-gram-schmidt-growth`), Mathlib `InnerProductSpace.gramSchmidt_def`, Mathlib `InnerProductSpace.gramSchmidt_orthogonal`, Mathlib `LDL.lowerInv_eq_gramSchmidtBasis`.
*Lean:* `quadraticCompletion_gram`, `isLLLReducedGram_iff`.
**Checks.**

- For b = ((2,0),(1,1)): G = [[4,2],[2,2]], pivots 4 and 1 = ‖b*_1‖², multiplier 1/2 = μ_{10}.
- For an orthogonal family the multipliers vanish and the pivots are the squared lengths.

Construct `fpEnumeration` (5.9.3), *Fincke–Pohst enumeration of lattice points in an ellipsoid*: Input: n ≥ 1, a symmetric G ∈ ℚ^{n×n} with positive quadratic-completion pivots, a centre t ∈ ℚ^n and a bound R ∈ ℚ. Put T_{n−1} = R. For k = n − 1, …, 0, given x_{k+1}, …, x_{n−1}, put U_k = Σ_{j>k} q_kj (x_j − t_j), let x_k run over all integers with q_kk·(x_k − t_k + U_k)² ≤ T_k (a finite interval of integers, decided by exact rational comparison), and put T_{k−1} = T_k − q_kk·(x_k − t_k + U_k)². fpEnumeration G t R ⊂ ℤ^n is the finite set of completed vectors x. Boundary points are included, both signs are produced, and for t = 0 and R ≥ 0 the zero vector is included. If R < 0 the set is empty.
The input bound R is exact; a consumer that needs a safety margin enlarges R explicitly and keeps the excess vectors. Fincke–Pohst's (2.8) lists only one of ±x and excludes zero; this construction lists the whole set, as the completeness theorem requires.
*Construction.* The completion identity makes the partial sums Σ_{i≥k} q_ii(x_i − t_i + U_i)² nondecreasing as k decreases, so each level is a bounded set of integers. Recursion on k with finite levels gives a finite set; its elements are exactly the leaves. The integer interval at level k is found by comparing squares of rationals, never by taking square roots.
Its API is `fpEnumeration` (data: The finite set of x ∈ ℤ^n produced by the recursion, as a Finset); `fpEnumeration_of_neg` (simp: If R < 0 the set is empty); `fpEnumeration_neg` (relation: With t = 0 the set is closed under x ↦ −x); `fpEnumeration_mono` (other: R ≤ R′ implies fpEnumeration G t R ⊆ fpEnumeration G t R′); `fpEnumeration_unimodular` (functoriality: For U ∈ GL_n(ℤ), fpEnumeration (UᵀGU) (U⁻¹t) R = U⁻¹ · fpEnumeration G t R); `fpEnumeration_zero_mem` (simp: 0 ∈ fpEnumeration G 0 R for R ≥ 0).
*Used by:* de Weger §3.6; Fincke–Pohst (2.8), (2.12) — complete lists of short and close lattice vectors; EffectiveDiophantineMethods:ED.1/short-vector-enumeration — ED.1's Diophantine distance witnesses import this generic enumeration (moved down from ED.1); ComputationalNumberTheory:CN.4/effective-ellipsoid-cover — the requested exact enumeration with completeness; GN.5/certified-representation-number — representation numbers are filtered enumerations; GN.5/reduction-transfer-under-comparison — covers for irrational Gram matrices enumerate a rational model at an enlarged radius.
(Source: de Weger 1989, §3.6 and Figure 2, printed pp. 51–52.)
*Needs:* 5.9.1, Mathlib `Matrix.PosDef`, Mathlib `Matrix.mulVec`.
*Lean:* `fpEnumeration`.
*Planet:* Fincke–Pohst enumeration.
**Checks.**

- `fpEnumeration_identity` (computation): G = I_2, t = 0, R = 1: the output is {0, ±(1,0), ±(0,1)}, five vectors.
- `fpEnumeration_hexagonal` (computation): G = [[2,1],[1,2]], t = 0, R = 2: the output is {0, ±(1,0), ±(0,1), ±(1,−1)}, seven vectors; (1,1) has value 6 and is excluded.
- `fpEnumeration_centre_half` (computation): n = 1, G = (1), t = 1/2, R = 1/4: the output is {0, 1}, both on the boundary.
- `fpEnumeration_negative_bound` (degenerate): R = −1 gives the empty set for every G and t.
- `fpEnumeration_box_non_example` (non-example): For G = [[2,1],[1,2]] and R = 2 the box |x_i| ≤ 1 contains (1,1), which is not in the output: bounding each coordinate separately overcounts.
- G = I_2, t = 0, R = 1 gives {0, ±e_0, ±e_1}.
- Output depends only on the quadratic form: replacing G by UᵀGU and t by U⁻¹t for U ∈ GL_n(ℤ) maps the output by U⁻¹.

5.9.4. **Soundness and completeness of the Fincke–Pohst enumeration.** Let G ∈ ℚ^{n×n} be symmetric with positive pivots, t ∈ ℚ^n and R ∈ ℚ. For every x ∈ ℤ^n: x ∈ fpEnumeration G t R ⟺ (x − t)ᵀG(x − t) ≤ R. Lattice form: if b is a basis of a lattice L ⊂ E with Gram matrix G and y = Σ_i t_i b_i, then {v ∈ L : ‖v − y‖² ≤ R} = {Σ_i x_i b_i : x ∈ fpEnumeration G t R}. Consequently an empty output certifies ‖v − y‖² > R for all v ∈ L, and for t = 0 an output {0} certifies ‖v‖² > R for every nonzero v ∈ L.
A rational Gram matrix is needed for exact decisions; real Gram matrices go through reduction-transfer-under-comparison.
*Proof.* (⇐) If (x − t)ᵀG(x − t) ≤ R, the completion identity bounds every tail partial sum by R, so at each level x_k lies in the scanned interval for its own tail; by downward induction the tail is produced. (⇒) A produced x has T_{−1} = R − Σ_i q_ii(x_i − t_i + U_i)² ≥ 0, which is (x − t)ᵀG(x − t) ≤ R. Lattice form: ‖Σ x_i b_i − y‖² = (x − t)ᵀG(x − t), and x ↦ Σ x_i b_i is a bijection ℤ^n → L.
(Source: de Weger 1989, §3.6 and Figure 2, printed pp. 51–52; de Weger 1989, §3.6, text after Figure 2, printed p. 52.)
*Needs:* 5.9.3, 5.9.1.
*Lean:* `fpEnumeration_mem_iff`, `fpEnumeration_lattice`.
**Checks.**

- For G = [[2,1],[1,2]] and R = 2 the seven listed vectors are exactly the solutions of 2x² + 2xy + 2y² ≤ 2.
- With t = 0 and R just below the squared minimum the output is {0}.

5.9.5. **Counting lattice points in an ellipsoid from a reduced basis.** For G ∈ ℚ^{n×n} (or ℝ^{n×n}) symmetric with positive pivots q_ii, t ∈ ℝ^n and R ≥ 0: #{x ∈ ℤ^n : (x − t)ᵀG(x − t) ≤ R} ≤ ∏_{i<n} (1 + 2·(R/q_ii)^{1/2}). If b is an LLL-reduced basis of a full lattice L in E and y ∈ E, then #{v ∈ L : ‖v − y‖² ≤ R} ≤ ∏_{i<n} (1 + 2^{1+i/2}·R^{1/2}/‖b_0‖) ≤ ∏_{i<n} (1 + 2^{1+i/2}·R^{1/2}/λ_0(L)).
λ_0(L) is the first successive minimum (the length of a shortest nonzero vector). The bound is a count, not an asymptotic; it includes the boundary.
*Proof.* At level k the admissible x_k form the integers of an interval of length 2(T_k/q_kk)^{1/2} ≤ 2(R/q_kk)^{1/2}, hence at most 1 + 2(R/q_kk)^{1/2} values; multiply over the levels. For a Gram matrix q_ii = ‖b*_i‖² (quadratic-completion-gram-schmidt), and for an LLL-reduced basis ‖b*_i‖² ≥ 2^{−i}‖b_0‖² ≥ 2^{−i}λ_0².
(Source: de Weger 1989, §3.6, Figure 2, coordinate bounds UB(x_i), printed pp. 51–52; Lenstra–Lenstra–Lovász 1982, Proposition (1.6), proof, reprint folio 29 (PDF p. 3).)
*Needs:* 5.9.4, 5.9.2, 5.1.3 (`lll-gram-schmidt-growth`), GN.1/successive-minimum.
*Lean:* `ellipsoid_point_count`, `lll_ball_count`.
**Checks.**

- G = I_2, R = 1: the bound is 3·3 = 9 ≥ 5.
- For n = 1, G = (q), the count of integers in an interval of length 2(R/q)^{1/2} is at most 1 + 2(R/q)^{1/2}.

5.9.6. **Certified representation numbers of a positive definite lattice.** Let L be a positive definite Tau Ceti integral lattice (TauCeti.IntegralLattice with IsPosDef) whose carrier has a ℤ-basis e : Fin n → L, let G = gramMatrix e ∈ ℤ^{n×n}, and let m ∈ ℤ. The map x ↦ Σ_i x_i e_i is a bijection from {x ∈ fpEnumeration G 0 m : xᵀGx = m} onto the shell {v ∈ L : B(v, v) = m}. Hence the shell is finite and its cardinality r_L(m) — the representation number, TauCeti.IntegralLattice.representationNumber on current Tau Ceti main — is computed exactly by the enumeration; r_L(m) = 0 for m < 0 and r_L(0) = 1; L represents m exactly when the filtered enumeration is nonempty; and the minimum of B(v, v) over nonzero v ∈ L is the least m ≥ 1 with r_L(m) > 0, which the enumeration with R = G_00 finds.
The norm is B(v, v), Tau Ceti's IntegralLattice.norm; a quadratic form q = B/2 halves every value. Positive definiteness of G over ℚ follows from IsPosDef by isPosDef_ofGramMatrix_iff applied to the basis, so the completion has positive pivots. These are global finite tests; local representation densities over ℤ_p are the separate GN.2–GN.3 owners.
*Proof.* Use the bijection ℤ^n ≃ L given by e and the identity B(Σ x_i e_i, Σ x_i e_i) = xᵀGx. Completeness of the enumeration at R = m lists every x with xᵀGx ≤ m; filtering by equality gives the shell. m < 0 gives an empty output; m = 0 gives {0} by positive definiteness; the minimum is attained by e_0 or a shorter vector, all of which the enumeration at R = G_00 lists.
(Source: de Weger 1989, §3.6, printed pp. 51–52; Tau Ceti, TauCeti/LinearAlgebra/IntegralLattice/Gram.lean and Signature.lean at the pin; RepresentationNumber.lean on current main.)
*Needs:* 5.9.4, 5.9.3, Tau Ceti `IntegralLattice`, Tau Ceti `IntegralLattice.gramMatrix`, Tau Ceti `IntegralLattice.norm`, Tau Ceti `IntegralLattice.IsPosDef`, Tau Ceti `IntegralLattice.isPosDef_ofGramMatrix_iff`.
*Lean:* `certified_representation_number`.
**Checks.**

- For ℤ² with G = I: r(1) = 4, r(2) = 4, r(3) = 0, r(5) = 8.
- For the hexagonal lattice G = [[2,1],[1,2]]: r(2) = 6 and the minimum is 2.
- r_L(−1) = 0 and r_L(0) = 1 for every positive definite L.

### 5.10 Irrational metrics through a rational model

Exact reduction needs rational Gram data, but the Euclidean Gram matrix of an ideal basis, or of the columns of a real matrix, is irrational. A two-sided Loewner comparison with a rational model transfers the approximation factor and the enumeration covers, at the price of κ = (1 + ε)/(1 − ε); the comparison itself is certified from entrywise enclosures and one exact positivity test.

Define `GramComparison` (5.10.1), *Two-sided comparison of a Gram matrix with a rational model*: For a real symmetric G ∈ ℝ^{n×n}, a rational symmetric G̃ ∈ ℚ^{n×n} and a rational ε with 0 ≤ ε < 1, GramComparison G G̃ ε holds when (1 − ε)·xᵀG̃x ≤ xᵀGx ≤ (1 + ε)·xᵀG̃x for all x ∈ ℝ^n, i.e. G − (1 − ε)G̃ and (1 + ε)G̃ − G are positive semidefinite. It is the hypothesis under which an exact rational reduction or enumeration is transferred to an irrational metric.
The comparison is in the Loewner order of quadratic forms, not entrywise. ε < 1 makes G positive definite exactly when G̃ is.
*Construction.* Define the predicate by the two inequalities for all real x. Derive the bilinear bound |xᵀ(G − G̃)y| ≤ ε(xᵀG̃x)^{1/2}(yᵀG̃y)^{1/2} by Cauchy–Schwarz for the semidefinite forms εG̃ ± (G − G̃). Change of basis: GramComparison G G̃ ε implies GramComparison (UᵀGU) (UᵀG̃U) ε for every real matrix U.
Its API is `GramComparison` (constructor: The two-sided Loewner comparison (1 − ε)G̃ ≤ G ≤ (1 + ε)G̃); `GramComparison.lower` (projection: (1 − ε)·xᵀG̃x ≤ xᵀGx for all x); `GramComparison.upper` (projection: xᵀGx ≤ (1 + ε)·xᵀG̃x for all x); `GramComparison.posDef_iff` (characterisation: G is positive definite iff G̃ is); `GramComparison.congr` (functoriality: The comparison is preserved by U ↦ UᵀGU, UᵀG̃U for every square U); `GramComparison.bilinear` (relation: |xᵀ(G − G̃)y| ≤ ε(xᵀG̃x)^{1/2}(yᵀG̃y)^{1/2}); `GramComparison.refl` (example: GramComparison G G 0 for rational G).
*Used by:* Belabas §4.2 — reduction of the irrational trace form through a rational model; GN.5/reduction-transfer-under-comparison — transfers the LLL factor and enumeration covers; GN.5/ideal-short-element — the Euclidean Gram matrix of an ideal basis is irrational in general; GN.5/lll-siegel-domain-certificate — real lattices are reduced through a rational model; ComputationalNumberTheory:CN.4/effective-ellipsoid-cover — a safety factor for a numerically enclosed Gram matrix is an instance.
(Source: Belabas 2004, §4.2, Proposition 4.2 and Corollary 4.3, pp. 27–28.)
*Needs:* Mathlib `Matrix.PosDef`, Mathlib `Matrix.gram`.
*Lean:* `GramComparison`.
**Checks.**

- `gramComparison_refl` (degenerate): For rational G, GramComparison G G 0.
- `gramComparison_diag` (computation): G = diag(1, 11/10), G̃ = I: the comparison holds with ε = 1/10 and fails with ε = 1/20.
- `gramComparison_non_example` (non-example): G = diag(1, 2), G̃ = I: no ε < 1 works, since x = (0,1) needs 2 ≤ 1 + ε.
- `gramComparison_swap` (compatibility): With U = [[0,1],[1,0]], GramComparison diag(1, 11/10) I (1/10) gives GramComparison diag(11/10, 1) I (1/10).
- G = G̃ gives the comparison with ε = 0.
- G = diag(1, 2) and G̃ = I admit no ε < 1.

5.10.2. **From entrywise enclosures to a Loewner comparison.** Let G ∈ ℝ^{n×n} be symmetric, G̃ ∈ ℚ^{n×n} symmetric, η ≥ 0 and 0 < ε < 1 rational, with |G_ij − G̃_ij| ≤ η for all i, j. If G̃ − (nη/ε)·I_n has positive quadratic-completion pivots, then GramComparison G G̃ ε.
The hypothesis on G̃ is decided exactly in ℚ by the quadratic completion; only the enclosure |G_ij − G̃_ij| ≤ η concerns the real matrix.
*Proof.* |xᵀ(G − G̃)x| ≤ η(Σ_i |x_i|)² ≤ nη‖x‖² by the entrywise bound and Cauchy–Schwarz. Positive pivots give G̃ − (nη/ε)I positive definite, so nη‖x‖² ≤ ε·xᵀG̃x.
(Source: Belabas 2004, §4.2, Proposition 4.2 and Corollary 4.3, pp. 27–28.)
*Needs:* 5.10.1, 5.9.1.
*Lean:* `entrywise_enclosure_comparison`.
**Checks.**

- n = 1, G = (π), G̃ = (3), η = 1/5, ε = 1/10: 3 − 2 = 1 > 0, so the comparison holds.
- If η = 0 the comparison holds for every ε ∈ (0,1) as soon as G̃ is positive definite.

5.10.3. **Determinants are monotone in the Loewner order.** Let A, B ∈ ℝ^{n×n} be symmetric with A positive definite and B positive semidefinite, and xᵀBx ≤ xᵀAx for all x ∈ ℝ^n. Then det B ≤ det A. In particular, GramComparison G G̃ ε gives (1 − ε)^n·det G̃ ≤ det G ≤ (1 + ε)^n·det G̃.
Mathlib at the pin has no monotonicity of the determinant in the Loewner order; this lemma supplies it for the transfer theorem.
*Proof.* Write A = L·Lᵀ with L = cholesky A and put C = L^{−1}·B·L^{−ᵀ}, symmetric positive semidefinite with yᵀCy ≤ yᵀy. Every eigenvalue of C lies in [0, 1] (Rayleigh quotients), so det C = ∏ eigenvalues ≤ 1. det B = det A·det C ≤ det A; the GramComparison form applies this to (1 − ε)G̃ ≤ G and G ≤ (1 + ε)G̃.
(Source: Mathlib at the pin, Analysis/Matrix/Spectrum.lean (det_eq_prod_eigenvalues, eigenvalues_eq); TauCeti Cholesky/Basic.lean (cholesky_mul_transpose); Belabas 2004, §4.2, proof of Proposition 4.2, pp. 27–28.)
*Needs:* Tau Ceti `cholesky`, Tau Ceti `cholesky_mul_transpose`, Mathlib `Matrix.IsHermitian.det_eq_prod_eigenvalues`, Mathlib `Matrix.IsHermitian.eigenvalues`, Mathlib `Matrix.IsHermitian.eigenvalues_eq`, Mathlib `Matrix.PosSemidef.eigenvalues_nonneg`, Mathlib `Matrix.PosSemidef`, Mathlib `Matrix.det_mul`, 5.10.1.
*Lean:* `loewner_det_monotone`.
**Checks.**

- A = diag(2, 3), B = diag(1, 3): det B = 3 ≤ 6.
- If B = A the inequality is an equality.

5.10.4. **Transfer of the LLL factor and enumeration covers to an irrational metric.** Let b be a basis of a lattice L in E with real Gram matrix G, and GramComparison G G̃ ε with κ = (1 + ε)/(1 − ε). (a) If U ∈ GL_n(ℤ) and the rational form UᵀG̃U is LLL-reduced (for its coordinate basis), then c = b·U is a basis of L with ‖c_0‖² ≤ κ·2^{n−1}·‖x‖² for every nonzero x ∈ L and ‖c_0‖² ≤ κ·2^{(n−1)/2}·covol(L)^{2/n}. (b) For rational t, R ≥ 0 and y = Σ_i t_i b_i: {v ∈ L : ‖v − y‖² ≤ R} ⊆ {Σ_i x_i b_i : x ∈ fpEnumeration G̃ t (R/(1 − ε))}; the excess vectors are kept and filtered by a separate exact or enclosed test.
Reducedness is certified for the rational model only; no claim is made that c is LLL-reduced for G.
*Proof.* (a) The LLL short-vector bound for the rational form gives e_0ᵀUᵀG̃Ue_0 ≤ 2^{n−1}zᵀG̃z for every nonzero integer z; the comparison converts both sides, giving the factor κ. The covolume bound: lll-first-vector-covolume for UᵀG̃U and det G̃ ≤ (1 − ε)^{−n}·det G by loewner-det-monotone, with det G = covol(L)². (b) (x − t)ᵀG(x − t) ≤ R implies (x − t)ᵀG̃(x − t) ≤ R/(1 − ε); apply completeness of the enumeration for G̃.
(Source: Belabas 2004, §4.2, Proposition 4.2 and its proof, pp. 27–28; Lenstra–Lenstra–Lovász 1982, Propositions (1.6) and (1.11), reprint folios 29–30 (PDF pp. 3–4).)
*Needs:* 5.10.1, 5.9.4, 5.1.4 (`lll-short-vector-factor`), 5.7.3, 5.2.1 (`unimodular-basis-certificate`), 5.4.2 (`lll-original-lattice-verification`), 5.10.3.
*Lean:* `reduction_transfer_under_comparison`, `enumeration_cover_under_comparison`.
**Checks.**

- With ε = 0 part (a) is the parent original-lattice verification.
- For G = diag(1, 11/10), G̃ = I, ε = 1/10 and U = I the bound reads ‖c_0‖² ≤ (11/9)·2·‖x‖².

### 5.11 Number-field adapters: heights, norms and class representatives

The adapters use Mathlib's Euclidean mixed space ℝ^{r₁} × ℂ^{r₂}, which counts each complex place once, and its integer lattice; no trace metric is introduced. A certified reduced basis of an ideal lattice gives a nonzero element whose Euclidean length, house, norm and height are bounded by explicit functions of the degree, the discriminant and the norm of the ideal, and hence a certified integral representative of every ideal class. Simultaneous approximation (1.39) is the source's own application.

Define `euclideanIdealLattice` (5.11.1), *The Euclidean lattice of a fractional ideal*: For a number field K of degree n with r₁ real and r₂ complex places and an invertible fractional ideal I of 𝓞_K, euclideanIdealLattice K I is the ℤ-lattice ZLattice.comap ℝ (mixedEmbedding.idealLattice K I) (euclidean.toMixed K) in Mathlib's Euclidean mixed space ℝ^{r₁} × ℂ^{r₂}, i.e. the image of I under ι = (toMixed)⁻¹ ∘ mixedEmbedding. It is discrete and full of rank n, ‖ι(a)‖² = Σ_{w real} w(a)² + Σ_{w complex} w(a)² (each place counted once), and its covolume is absNorm(I)·2^{−r₂}·√|disc K|. For I = 𝓞_K it is Mathlib's euclidean.integerLattice.
The metric counts each complex place once; the trace form T2(a) = Σ_σ |σ(a)|² counts it twice, so ‖ι(a)‖² ≤ T2(a) ≤ 2‖ι(a)‖², with equality on the left for totally real K. No new metric is introduced: the trace metric on the mixed space belongs to the class-group torsion roadmap that imports this lattice.
*Construction.* Define the lattice by ZLattice.comap along the continuous linear equivalence toMixed; discreteness and fullness transfer. The norm formula is the ℓ² norm of the Euclidean mixed space evaluated on the mixed embedding. The covolume is unchanged by comap along a volume-preserving equivalence (covolume_comap with volumePreserving_toMixed), and Mathlib computes the covolume of idealLattice.
Its API is `euclideanIdealLattice` (constructor: ZLattice.comap ℝ (idealLattice K I) (euclidean.toMixed K)); `mem_euclideanIdealLattice` (characterisation: x is in the lattice iff x = ι(a) for some a ∈ I); `norm_sq_euclideanEmbedding` (simp: ‖ι(a)‖² = Σ_{w real} w(a)² + Σ_{w complex} w(a)²); `covolume_euclideanIdealLattice` (relation: covolume = absNorm I · 2^{−r₂} · √|disc K|); `euclideanIdealLattice_one` (compatibility: For I = 1 the lattice is Mathlib's euclidean.integerLattice); `euclideanIdealLattice.instIsZLattice` (instance: The lattice is discrete and spans the Euclidean mixed space).
*Used by:* Belabas §4 — LLL reduction of ideals is reduction of this lattice for a positive definite form; GN.5/ideal-short-element — the lattice whose reduced basis gives small elements; BSTTTZ §3 — the class-group torsion roadmap measures 𝓞_K in a rescaled version of this lattice; GN.1/ideal-class-application-import — Minkowski's bound is proved on the same lattice.
(Source: Mathlib at the pin, NumberTheory/NumberField/CanonicalEmbedding/Basic.lean, namespace euclidean; Discriminant/Basic.lean, covolume_idealLattice; Belabas 2004, §2, Definition 2.1, p. 22.)
*Needs:* Mathlib `NumberField.mixedEmbedding.euclidean.mixedSpace`, Mathlib `NumberField.mixedEmbedding.euclidean.toMixed`, Mathlib `NumberField.mixedEmbedding.euclidean.volumePreserving_toMixed`, Mathlib `NumberField.mixedEmbedding.idealLattice`, Mathlib `NumberField.mixedEmbedding.mem_idealLattice`, Mathlib `NumberField.mixedEmbedding.covolume_idealLattice`, Mathlib `NumberField.mixedEmbedding.euclidean.integerLattice`, Mathlib `ZLattice.comap`, Mathlib `ZLattice.covolume_comap`, GN.0/mixed-embedding-normalization.
*Lean:* `euclideanEmbedding`, `euclideanIdealLattice`.
**Checks.**

- `euclideanIdealLattice_gaussian` (computation): K = ℚ(i), I = 𝓞_K: the lattice is ℤ + ℤi ⊂ ℂ, ‖ι(a + bi)‖² = a² + b², covolume 1.
- `euclideanIdealLattice_rat` (degenerate): K = ℚ, I = (2): the lattice is 2ℤ ⊂ ℝ with covolume 2.
- `euclideanIdealLattice_not_trace` (non-example): In ℚ(i), ‖ι(i)‖² = 1 whereas Σ_σ |σ(i)|² = 2: this is not the trace form on a field with complex places.
- `euclideanIdealLattice_totally_real` (compatibility): In ℚ(√2), ‖ι(√2)‖² = 2 + 2 = 4 = Tr(√2·√2): on a totally real field the norm is the trace form.
- For K = ℚ(i), I = 𝓞_K the lattice is ℤ[i] ⊂ ℂ with covolume 2^{−1}·√4 = 1.
- For K = ℚ, I = (2) the lattice is 2ℤ ⊂ ℝ with covolume 2.

5.11.2. **House and norm bounded by the Euclidean length.** For a number field K of degree n ≥ 1 and α ∈ K: house(α) ≤ ‖ι(α)‖, and |N_{K/ℚ}(α)|^{2/n} ≤ (2/n)·‖ι(α)‖²; when K is totally real, |N_{K/ℚ}(α)|^{2/n} ≤ (1/n)·‖ι(α)‖².
‖ι(α)‖ is the Euclidean mixed-space norm of ideal-euclidean-lattice; house is Mathlib's NumberField.house.
*Proof.* house(α) = max_w w(α) and each place occurs once in ‖ι(α)‖², so house(α)² ≤ ‖ι(α)‖². |N(α)| = ∏_w w(α)^{mult w} with Σ_w mult w = n; weighted AM–GM with weights mult(w)/n on the values w(α)² gives |N(α)|^{2/n} ≤ (1/n)Σ_w mult(w)·w(α)² ≤ (2/n)‖ι(α)‖², and the factor 2 disappears when every place is real.
(Source: Belabas 2004, §4.1, p. 26; Mathlib at the pin, NumberTheory/NumberField/InfinitePlace/Basic.lean: prod_eq_abs_norm, sum_mult_eq; House.lean: house_eq_sup'.)
*Needs:* 5.11.1, Mathlib `NumberField.house`, Mathlib `NumberField.house_eq_sup'`, Mathlib `NumberField.norm_embedding_le_house`, Mathlib `NumberField.InfinitePlace.prod_eq_abs_norm`, Mathlib `NumberField.InfinitePlace.sum_mult_eq`, Mathlib `Real.geom_mean_le_arith_mean_weighted`.
*Lean:* `house_le_norm_euclideanEmbedding`, `abs_norm_rpow_le_euclidean`, `abs_norm_rpow_le_euclidean_of_totallyReal`.
**Checks.**

- α = 1 + i in ℚ(i): house = √2 = ‖ι(α)‖, N(α) = 2 and 2^{2/2} = 2 ≤ (2/2)·2.
- α = 1 + √2 in ℚ(√2): ‖ι(α)‖² = (1 + √2)² + (1 − √2)² = 6 and |N(α)| = 1 ≤ 6/2.

5.11.3. **Height of an algebraic integer from its house.** For a number field K of degree n and α ∈ 𝓞_K: logHeight₁(α) ≤ n·log⁺ house(α) ≤ (n/2)·log⁺ ‖ι(α)‖², where logHeight₁ is Mathlib's (unnormalised) logarithmic Weil height on K.
Moved down from DiophantineApproximationAndTranscendence:DT.4/log-height-of-algebraic-integer-bound, which states the first inequality; that node imports this one.
*Proof.* By logHeight₁_eq, logHeight₁(α) = Σ_w mult(w)·log⁺ w(α) + Σᶠ_v log⁺ v(α). At finite places v(α) ≤ 1 for an algebraic integer, so the second sum vanishes. w(α) ≤ house(α) and Σ_w mult(w) = n give the first inequality; house(α)² ≤ ‖ι(α)‖² gives the second.
(Source: Mathlib at the pin, NumberTheory/Height/NumberField.lean, logHeight₁_eq; Completion/FinitePlace.lean, norm_le_one; Belabas 2004, §3.2 and §4.1, pp. 24–26.)
*Needs:* 5.11.2, Mathlib `NumberField.logHeight₁_eq`, Mathlib `NumberField.FinitePlace.norm_le_one`, Mathlib `NumberField.norm_embedding_le_house`, Mathlib `NumberField.InfinitePlace.sum_mult_eq`.
*Lean:* `integral_logHeight_le_house`.
**Checks.**

- α = 2 ∈ ℤ ⊂ ℚ: logHeight₁(2) = log 2 = 1·log⁺ 2.
- A root of unity has house 1 and height 0.

5.11.4. **A certified short element of an ideal.** Let K have degree n with r₂ complex places, I an invertible fractional ideal with ℤ-basis (β_j), G the real Gram matrix of ι(β_j) in the Euclidean mixed space, G̃ rational with GramComparison G G̃ ε, κ = (1 + ε)/(1 − ε), and U ∈ GL_n(ℤ) with UᵀG̃U LLL-reduced. Put α = Σ_j U_{j0} β_j. Then α ∈ I, α ≠ 0, and (i) ‖ι(α)‖² ≤ κ·2^{n−1}·‖ι(β)‖² for every nonzero β ∈ I; (ii) ‖ι(α)‖² ≤ κ·2^{(n−1)/2}·(absNorm(I)·2^{−r₂}·√|disc K|)^{2/n}; (iii) |N_{K/ℚ}(α)| ≤ (2κ/n)^{n/2}·2^{n(n−1)/4}·2^{−r₂}·√|disc K|·absNorm(I); (iv) house(α) ≤ ‖ι(α)‖, and if I ⊆ 𝓞_K then logHeight₁(α) ≤ (n/2)·log⁺(κ·2^{(n−1)/2}·(absNorm(I)·2^{−r₂}·√|disc K|)^{2/n}).
All data (β, G̃, ε, U) are exact; the only real input is the enclosure behind GramComparison, typically produced by entrywise-enclosure-comparison. For totally real K one may take G̃ = G = (Tr(β_iβ_j)), ε = 0, and the factor 2κ/n in (iii) improves to 1/n.
*Proof.* α ∈ I and α ≠ 0 because U is unimodular and (β_j) is a basis of I. (i) and (ii) are reduction-transfer-under-comparison for the lattice euclideanIdealLattice K I, with its covolume. (iii) and (iv) follow from (ii) by euclidean-house-norm-bounds and integral-log-height-le-house.
(Source: Belabas 2004, §4, Proposition 4.1 (Cohen Theorem 2.6.2) and §§4.1–4.2, pp. 25–28; Lenstra–Lenstra–Lovász 1982, (1.9) and (1.11), reprint folios 29–30 (PDF pp. 3–4).)
*Needs:* 5.11.1, 5.10.4, 5.11.2, 5.11.3, 5.10.1, Mathlib `NumberField.mixedEmbedding.covolume_idealLattice`.
*Lean:* `ideal_short_element`.
**Checks.**

- K = ℚ(i), I = (1 + i) with basis (1 + i, 2), exact Gram [[2,2],[2,4]], ε = 0: LLL returns α = ±(1 + i) or ±(1 − i) up to units, and |N(α)| = 2 ≤ (2/2)·2^{1/2}·2^{−1}·2·2.
- For K = ℚ, n = 1, the statement says α generates I and |α| = absNorm(I).

5.11.5. **Certified small integral representatives of ideal classes.** Let I be a nonzero integral ideal of 𝓞_K and α ∈ I the element of ideal-short-element for I. Then J = α·I^{−1} is an integral ideal in the class of I^{−1} with absNorm(J) = |N_{K/ℚ}(α)|/absNorm(I) ≤ (2κ/n)^{n/2}·2^{n(n−1)/4}·2^{−r₂}·√|disc K|. Applied to a representative of each class of the inverse, this lists, with exact certificates, an integral ideal of bounded norm in every class; the constant is weaker than Minkowski's bound of NumberField.exists_ideal_in_class_of_norm_le.
The data certifying J are those of ideal-short-element; finiteness of the class group itself is Mathlib's.
*Proof.* α ∈ I gives (α) ⊆ I, hence J = (α)I^{−1} ⊆ 𝓞_K, and J is in the class of I^{−1}. absNorm is multiplicative and absNorm((α)) = |N(α)|; divide (iii) of ideal-short-element by absNorm(I). This is the step of Mathlib's proof of exists_ideal_in_class_of_norm_le with the Minkowski element replaced by the certified LLL element.
(Source: Mathlib at the pin, NumberTheory/NumberField/ClassNumber.lean, exists_ideal_in_class_of_norm_le and its proof; Belabas 2004, §4.1, p. 26.)
*Needs:* 5.11.4, Mathlib `NumberField.exists_ideal_in_class_of_norm_le`, GN.1/ideal-class-application-import.
*Lean:* `ideal_class_small_representative`.
**Checks.**

- For K = ℚ(√−5) (n = 2, r₂ = 1, |disc| = 20, ε = 0) the bound is (2/2)·2^{1/2}·2^{−1}·√20 ≈ 3.16, so every class has an integral representative of norm at most 3; the nontrivial class is represented by (2, 1 + √−5) of norm 2.
- For K = ℚ the bound is 1 and J = (1).

5.11.6. **Certified simultaneous Diophantine approximation (1.39).** Given n ≥ 1, rationals α_1, …, α_n and a rational ε with 0 < ε < 1, LLL reduction of the lattice of rank n + 1 spanned by the columns of the matrix with identity block I_n, last column (−α_1, …, −α_n, 2^{−n(n+1)/4}ε^{n+1})ᵀ and zero last row otherwise, produces integers p_1, …, p_n, q with |p_i − qα_i| ≤ ε for all i and 1 ≤ q ≤ 2^{n(n+1)/4}ε^{−n}, in a number of operations polynomial in the input size, together with the unimodular certificate.
All inner products of the columns are rational (the last diagonal entry squares to 2^{−n(n+1)/2}ε^{2n+2}), so the exact reduction applies after clearing denominators. This is the algorithmic counterpart of Dirichlet's theorem with a weaker constant; Diophantine reductions of linear forms stay with EffectiveDiophantineMethods:ED.1.
*Proof.* The lattice has covolume 2^{−n(n+1)/4}ε^{n+1}, so (1.9) in rank n + 1 gives ‖b_0‖ ≤ 2^{n/4}·(2^{−n(n+1)/4}ε^{n+1})^{1/(n+1)} = ε. Writing b_0 = (p_1 − qα_1, …, p_n − qα_n, q·2^{−n(n+1)/4}ε^{n+1}) gives |p_i − qα_i| ≤ ε and |q| ≤ 2^{n(n+1)/4}ε^{−n}. ε < 1 and b_0 ≠ 0 force q ≠ 0; replace b_0 by −b_0 if necessary. Polynomial time is lll-arithmetic-complexity for the scaled integral lattice.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition (1.39) and its proof, reprint folios 36–37 (PDF pp. 10–11).)
*Needs:* 5.7.3, 5.6.3, 5.5.4, 5.2.1 (`unimodular-basis-certificate`).
*Lean:* `lll_simultaneous_approximation`.
**Checks.**

- n = 1, α_1 = 1/3, ε = 1/2: the bound q ≤ 2^{1/2}·2 allows q = 1 with p_1 = 0, since |0 − 1/3| ≤ 1/2.
- If every α_i is an integer the vector with q = 1, p_i = α_i is admissible.

### 5.12 Arithmetic-group adapters: Siegel reduction

AdelicAlgebraicGroups AA.3 states reduction theory for GL_n(ℝ) through (e, C)-reduced forms and the standard real Siegel domain Σ_n(u, t), in its convention of a left GL_n(ℤ)-action and coordinates v·diag(a)·k. An LLL certificate is an explicit witness for both forms of its reduction theorem, with the constants C_n = 2^{n(n−1)/2} + 2^n, u_n = (1/2)(3/2)^{max(n−2,0)} and t = 2^{−1/2}.

5.12.1. **LLL-reduced bases are reduced in the sense of Siegel sets.** Let b be an LLL-reduced basis (δ = 3/4) of a rank-n lattice in a real inner-product space, with Gram matrix B_ij = ⟨b_i, b_j⟩. Then |B_ij| ≤ 2^{i+1}·B_ii for all i, j; B_ii ≤ 2^{n−1}·B_jj for i < j; and ∏_i B_ii ≤ 2^{n(n−1)/2}·det B. Consequently B is (e, C_n)-reduced for the standard basis e in the sense of AdelicAlgebraicGroups AA.3 (RealSiegel.IsReduced), with C_n = 2^{n(n−1)/2} + 2^n. For every positive definite form, the LLL certificate U of a basis gives an explicit γ = U^{−1} ∈ GL_n(ℤ) moving it into the reduced set T_{e,C_n}.
All three inequalities are strict once C_n replaces the displayed constants, as AA.3's definition requires. For a real form, the existence of a reduced basis uses lll-step-termination (b); for a rational form the certificate is computed exactly.
*Proof.* For j ≤ i: ⟨b_i, b_j⟩ = Σ_{l≤j} μ_{il}μ_{jl}‖b*_l‖² (μ_{ll} = 1), so |⟨b_i, b_j⟩| ≤ Σ_{l≤i}‖b*_l‖² ≤ Σ_{l≤i} 2^{i−l}‖b*_i‖² ≤ 2^{i+1}‖b_i‖²; for j > i the same sum stops at l = i. For i < j, lll-basis-length-growth gives ‖b_i‖² ≤ 2^j‖b*_j‖² ≤ 2^{n−1}‖b_j‖². The product inequality is the square of lll-orthogonality-defect. Translate into AA.3's three conditions with the constant C_n; the change of basis is the certificate.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition (1.6) and Remark after it, reprint folio 29 (PDF p. 3); TauCetiRoadmap AdelicAlgebraicGroups, README, Layer AA.3, reduced forms T_{e,C}.)
*Needs:* 5.7.1, 5.7.2, 5.1.3 (`lll-gram-schmidt-growth`), 5.1.2 (`lll-reduced`), 5.5.3, AdelicAlgebraicGroups AA.3/reduced-form, AdelicAlgebraicGroups AA.3/reduced-form-set.
*Lean:* `lll_reduced_gram_bounds`, `lll_reduced_isReduced`.
**Checks.**

- For the standard basis of ℤ^n, B = I and every inequality holds with room.
- For the reduced basis ((1,0),(1/2,1)): |B_01| = 1/2 ≤ 2·1, B_00 = 1 ≤ 2·(5/4), and B_00B_11 = 5/4 ≤ 2·1.

5.12.2. **An LLL certificate places GL_n(ℝ) in a standard Siegel domain.** Let c be an LLL-reduced basis of ℝ^n and C the matrix with columns c_i, with C = Q·D·N where Q is orthogonal, D = diag(‖c*_i‖) and N is upper unitriangular with N_ij = μ_{ji} for i < j. Then |N_ij| ≤ 1/2, ‖c*_{i+1}‖² ≥ (1/2)‖c*_i‖², and |(N^{−1})_ij| ≤ (1/2)(3/2)^{j−i−1} for i < j. Consequently, for g ∈ GL_n(ℝ), let b be the basis formed by the columns of g^{−1} and U an LLL certificate with c = b·U; then γ = U^{−1} ∈ GL_n(ℤ) satisfies γg = v·diag(a)·k with v = N^{−1} upper unitriangular, |v_ij| ≤ u_n := (1/2)(3/2)^{max(n−2,0)}, a_i = ‖c*_i‖^{−1} with a_i/a_{i+1} ≥ 2^{−1/2}, and k = Qᵀ ∈ O(n). That is, γg lies in the standard real Siegel domain Σ_n(u_n, 2^{−1/2}) of AdelicAlgebraicGroups AA.3, an explicit instance of its reduction theorem for GL_n(ℝ).
AA.3's conventions: left action of GL_n(ℤ), coordinates v·diag(a)·k, and gram g = (g^{−1})ᵀg^{−1} the Gram matrix of the columns of g^{−1}. For irrational g the certificate is produced through a rational model (reduction-transfer-under-comparison) or by the existence statement lll-step-termination (b); for rational g it is computed exactly.
*Proof.* The QR (Gram–Schmidt) factorisation of C has R = D·N with the stated entries, by c_j = Σ_{i≤j} μ_{ji}c*_i. Size reduction gives |N_ij| ≤ 1/2; size reduction with the Lovász condition gives ‖c*_{i+1}‖² ≥ (3/4 − 1/4)‖c*_i‖². Back substitution in N·N^{−1} = I bounds the entries of N^{−1} by X_k with X_0 = 1 and X_k ≤ (1/2)Σ_{l<k}X_l, i.e. X_k = (1/2)(3/2)^{k−1}. (γg)^{−1} = g^{−1}U = C = QDN, so γg = N^{−1}D^{−1}Qᵀ, which has the stated Siegel coordinates.
(Source: Lenstra–Lenstra–Lovász 1982, (1.2)–(1.5) and Proposition (1.6), reprint folios 28–29 (PDF pp. 2–3); TauCetiRoadmap AdelicAlgebraicGroups, README, Layer AA.3, the standard real Siegel domain and the reduction theorem for GL_n(ℝ).)
*Needs:* 5.1.2 (`lll-reduced`), 5.1.1 (`lll-coefficient`), 5.1.3 (`lll-gram-schmidt-growth`), 5.2.1 (`unimodular-basis-certificate`), 5.10.4, 5.5.3, AdelicAlgebraicGroups AA.3/gln-real-reduction, AdelicAlgebraicGroups AA.3/real-siegel-set, Mathlib `Matrix.GeneralLinearGroup`, Mathlib `Matrix.orthogonalGroup`, Mathlib `InnerProductSpace.gramSchmidt`.
*Lean:* `siegelU`, `inv_unitriangular_bound`, `lll_siegel_domain_certificate`.
**Checks.**

- For g = I the certificate is U = I and γg = I = 1·diag(1)·1 lies in Σ_n(u_n, 2^{−1/2}).
- For n = 2 and g^{−1} with columns (2,0),(0,1): one swap, c = ((0,1),(2,0)), a = (1, 1/2), a_0/a_1 = 2 ≥ 2^{−1/2}, v = I.
- For n = 3 the entry (N^{−1})_{02} is μ_{10}μ_{21} − μ_{20}, of absolute value at most 3/4 = u_3.

### Examples

The basis ((2,0),(0,1)) fails the Lovász test at cursor 1 (1 < (3/4)·4); one swap gives ((0,1),(2,0)) with certificate [[0,1],[1,0]] of determinant −1, the potential drops from 4 to 1, and both Algorithm (1.15) and the native variant return this basis. The basis ((2,0),(1,1)) has μ_{10} = 1/2 and fails the test: Algorithm (1.15) swaps without shearing and returns ((1,1),(1,−1)), the native variant shears first and returns ((−1,1),(1,1)); the two outputs are LLL-reduced with different Gram–Schmidt vectors, which is why the reconciliation 5.5.5 is stated away from ties. The hexagonal form [[2,1],[1,2]] has completion pivots 2 and 3/2, its enumeration at R = 2 lists the seven vectors 0, ±(1,0), ±(0,1), ±(1,−1), and its representation number r(2) is 6. In ℚ(i) the ideal (1 + i) has Euclidean Gram matrix [[2,2],[2,4]] in the basis (1 + i, 2), reduces to (1 + i, 1 − i), and its first element has norm 2 within the bound 2√2 of 5.11.4. In ℚ(√−5) the class bound of 5.11.5 is √10 < 4, and (2, 1 + √−5) of norm 2 represents the nontrivial class. For g with g^{−1} = diag(2, 1), one swap gives γ with γg in Σ_2(1/2, 2^{−1/2}) with a = (1, 1/2).

### Dependencies

Inside the roadmap: the parent GN.5 items 5.1–5.4, GN.0 (Gram determinants, Hadamard, covolumes, the mixed-embedding normalization, prescribed primitive bases) and GN.1 (successive minima, minima outside a subspace, Minkowski's second theorem, the ideal-class import). Other roadmaps: AdelicAlgebraicGroups AA.3 (reduced forms, Siegel domains, reduction for GL_n(ℝ)), a lower-tier roadmap already on TauCetiRoadmap. No higher-tier roadmap is cited; the two moved-down notions are listed under *Scope and ownership*.

### Acceptance tests

- A short-vector output is checked in the original lattice with its proven factor: 5.4.2 of the parent for exact data and 5.10.4 for an irrational metric, with factor κ·2^{n−1}.
- Every reduction in this part carries a unimodular certificate; floating-point output alone is never a proof (5.10.1–5.10.2 make the comparison exact).
- Algorithm (1.15) and the native variant both satisfy the invariant, terminate within log_{4/3} D swaps for integral data, and agree away from ties (5.5.3, 5.5.5).
- Proposition (1.26): O(n⁴ log B) operations on integers bounded by n·(4B)^{2n} (5.6.3).
- Enumeration is complete and sound for every rational positive definite form, centre and bound, boundary included (5.9.4).
- The number-field and arithmetic-group consumers receive exact statements in their own conventions: house, norm and height bounds in Mathlib's Euclidean mixed space (5.11.2–5.11.4), and AA.3's reduced forms and Siegel domains (5.12.1–5.12.2).

### Downstream consumers

EffectiveDiophantineMethods ED.1 uses only the parent's certificate, factor and growth nodes for its distance witnesses and imports 5.9.3–5.9.4 for enumeration; its arithmetic exclusion statements stay there. ComputationalNumberTheory CN.4's ellipsoid cover uses 5.9.4 and the comparison 5.10. The class-group torsion roadmap imports 5.8 and 5.11.1. DiophantineApproximationAndTranscendence DT.4 imports 5.11.3. AdelicAlgebraicGroups consumers can use 5.12 as an explicit reduction certificate.

### References

- A. K. Lenstra, H. W. Lenstra Jr., L. Lovász, *Factoring polynomials with rational coefficients*, Math. Ann. 261 (1982), 515–534; §1, (1.1)–(1.39), read in a scanned reprint (folios 28–37). https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf
- B. M. M. de Weger, *Algorithms for Diophantine equations*, CWI Tract 65 (1989), §3.4–3.6, pp. 47–52. https://ir.cwi.nl/pub/13190/13190D.pdf — for the Fincke–Pohst algorithm of U. Fincke and M. Pohst, Math. Comp. 44 (1985), 463–471.
- K. Belabas, *Topics in computational algebraic number theory*, J. Théor. Nombres Bordeaux 16 (2004), 19–63; §2 and §4, pp. 22–29. http://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf
- J.-H. Evertse, *Diophantine approximation*, Chapter 2: Geometry of numbers (Leiden notes), §2.3, pp. 27–30. https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf
- M. Bhargava, A. Shankar, T. Taniguchi, F. Thorne, J. Tsimerman, Y. Zhao, *Bounds on 2-torsion in class groups of number fields and integral points on elliptic curves*, arXiv:1701.02458v1, §3, pp. 4–5; J. Amer. Math. Soc. 33 (2020), 1087–1099.
- TauCetiRoadmap, AdelicAlgebraicGroups, Layer AA.3 (reduced forms, standard real Siegel domain, reduction for GL_n(ℝ)).
- Mathlib at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti at f790474821cf4256814db967cb154e7af3d0c369, for the declarations listed above.

### Misprints in the sources

- **GeometryOfNumbersAndQuadraticArithmetic/E51** (Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao, arXiv v1, §3, p. 4). The paper equates the length induced by the conjugate trace pairing with the usual Euclidean length of ℝ^r × ℂ^s, in which 𝓞_K has covolume 2^{−s}|Disc K|^{1/2}. The trace length counts each complex place twice, so the two agree only for totally real fields, differ by at most a factor √2 in general, and the stated covolume belongs to the usual length (the trace length gives |Disc K|^{1/2}). For ℚ(i), the element i has trace length² 2 and usual length² 1. The paper's uses are up to implied constants, so nothing it proves is affected.

### Remaining refinements

- Confirm the locators of 5.9.1, 5.9.3 and 5.9.4 against the publisher's text of Fincke–Pohst (Math. Comp. 44, 1985, (2.2)–(2.12)), read here through de Weger §3.6 because the AMS site refused scripted access.
- At lemma level, write out the integral form of the update formulas (1.22) in terms of d_i and d_jμ_{ij}, which fixes the cost model of 5.6.3.
- The size bounds 5.6.2 are stated for Algorithm (1.15); the native variant's bounds are not stated.
- At lemma level, 5.5.3 (b) needs the intrinsic-volume form of GN.0's covolume identity for prefix lattices of lower rank.
