# Geometry of numbers: Gram and intrinsic-volume checkpoint

Issue [#1030](https://github.com/CBirkbeck/tauceti-explorer/issues/1030). Codex — codex-a71f92, 2026-09-26. **Partial blueprint; nothing here is claimed formalized.**

This first packet supplies ten theorem/lemma plans in GN.0–GN.1. Three of the four additional consequences routed from Couveignes are decomposed: Hermitian Gram–Hadamard, the ordered-product bound, and the intrinsic cube/ball estimate. The fourth, primitive orthogonal covolume equality, remains a precise gap. GN.1's genuine second theorem and all later stages remain open.

The [packet](../packets/GeometryOfNumbersAndQuadraticArithmetic.json) has the dependency graph, source records, API names and tests. The [suggested Lean file](../suggested/GeometryOfNumbersAndQuadraticArithmetic.lean) checks the types of the proposed statements; its unproved declarations are not implementations.

## Reuse and source boundary

The complete seven-stage reviewed AUDIT-02 coverage was read before planning. The original lattice carrier, fundamental domains, covolume/change-of-basis and index formulas are already in Mathlib. Blichfeldt, Minkowski first (strict and compact-boundary versions), and the audited class-group/unit applications are imports. No lattice, Gram, measure or determinant carrier is created here.

Pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration in the packet's baseline inventory was checked at that pin. In particular, `Orientation.abs_volumeForm_apply_le` already proves the real full-dimensional volume-form inequality. The missing exported interface here is its RCLike Hermitian Gram consequence, including arbitrary ambient dimension and dependent families.

I read the entire published [Couveignes article](https://annals.math.princeton.edu/2020/192-2/p04), pp.487–497, and visually checked pp.493–494. The publisher PDF hash is `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`. The extraction, its accepted independent review and verified clean red-team result were also read. Couveignes motivates the three exported estimates; the supporting matrix, product and cube arguments below are worker derivations using the read pinned proofs. This does **not** claim a reading of Martinet's primitive-complement proof or Siegel's second-theorem proof.

Couveignes's p.493 tensor-base typo is already confirmed as [PAPER-COUVEIGNES-20/E1](../errata/PAPER-COUVEIGNES-20.md): the integral relation module extends over Z, not Q. Packet E1 preserves that provenance without adding a new review verdict. The printed “sphere” on p.494 is explicitly a set defined by norm ≤1; it means the closed ball, and is not a second erratum.

## Conventions that consumers must preserve

- Inner products are conjugate-linear in the first argument. Gram has entries ⟨v_i,v_j⟩. For a row family in the source, its displayed matrix is the conjugate/transpose convention of this Gram; the determinants agree because they are real. Establish that conversion in the consumer.
- Squared norms, not raw coordinate bounds, are the diagonal inputs. For m coefficients of modulus ≤A, the consumer first proves squared row norm ≤mA².
- Covolume and ball volume are intrinsic to the space containing the full lattice. A rank-one lattice in a plane is considered inside its real line, not with two-dimensional ambient measure.
- The ordered-product lemma needs every factor ≥1. This is not true for a general lattice. Nonzero integral coefficient vectors supply it; the number-field short-integer argument instead needs the arithmetic norm/product proof.
- Couveignes's canonical metric weights complex squared modulus by two. Mathlib's audited mixed-embedding coordinate basis is unweighted. The extraction assigns the resulting measure/discriminant conversion to proposed EffectiveBoundsCompactModels, not to a new lattice definition here.
- Fin n indices are zero-based. The tail length n−i.val is the paper's n+1−k, where k=i.val+1. The last term has exponent one.
- Empty Gram determinants/products and zero-dimensional canonical volume are one. The radius 1/√n is used only for n>0. The cube touches the unit sphere, so containment is in the closed ball.

## GN.0: Hermitian Gram and covolume consequences

The source chain is coordinate Gram identity → orthonormal-coordinate Hadamard → arbitrary-family Gram–Hadamard → uniform diagonal bound. The coordinate identity also supplies the squared-covolume adapter. All five are additional proof-local consequences, not replacements for built GN.0 foundations.

### Gram determinant in orthonormal coordinates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-orthonormal-coordinates` — lemma; unchecked.

For an RCLike field k, a normed k-inner-product space E, an orthonormal basis b indexed by Fin n, and any v:Fin n→E, det Gram_k(v) equals the scalar image in k of ‖det_b(v)‖².

Hypotheses: n may be zero; independence of v is not assumed. The inner product is conjugate-linear in its first argument; Gram has entries ⟨v_i,v_j⟩.

Proof plan:

1. Set A_ij=(b.repr(v_j))_i. The existing coordinate theorem identifies Gram(v) with AᴴA.
2. Take determinants using det_mul and det_conjTranspose; obtain conjugate(det A)·det A.
3. Use the RCLike norm-square identity and basis determinant definition to identify the scalar image of ‖det_b(v)‖², recording reality and nonnegativity.
4. For n=0 every determinant and empty product is one; no inverse or positive-rank assumption enters.

API: `TauCeti.GeometryOfNumbersPlan.gram_det_orthonormal_coordinates`: Exact scalar-valued norm-square identity, not merely equality of real parts.

Contract tests:

- The singleton complex family (i) has Gram determinant 1, not −1.
- Vectors (1,0),(0,i) in C² have Gram determinant 1 and squared coordinate-determinant norm 1.
- The empty family in zero-dimensional space has determinant 1.

Source use: Couveignes, p.493, transpose-evaluation lattice. The packet records the exact pinned prerequisites.

### Hadamard bound in orthonormal coordinates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthonormal-coordinate-hadamard` — lemma; unchecked.

For an orthonormal basis b:Fin n→E over an RCLike field and any v:Fin n→E, ‖det_b(v)‖≤∏i ‖v_i‖.

Hypotheses: b is a full orthonormal basis; n=0 and dependent families are allowed.

Proof plan:

1. Obtain finite dimensionality from b and dimension n. Use the existing gramSchmidtOrthonormalBasis for v, indexed by Fin n; it extends nonzero orthogonalized vectors even when v is dependent.
2. In that basis c the checked formula gives det_c(v)=∏i⟨c_i,v_i⟩. Take norms and apply Cauchy–Schwarz, since ‖c_i‖=1.
3. Apply gram-det-orthonormal-coordinates with b and c. Injectivity of real scalar embedding identifies their squared determinant norms; nonnegativity identifies the norms.
4. Transfer the bound to b. Empty product is one. The existing real oriented-volume bound remains an import/provenance comparison, not a newly owned theorem.

API: `TauCeti.GeometryOfNumbersPlan.orthonormal_coordinate_hadamard`: Determinant norm bounded by product of column norms.

Contract tests:

- Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6.
- Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails.
- Duplicate nonzero columns have determinant 0 and positive product norms.

Source use: Couveignes, pp.493–494, Hermitian determinant estimate. The packet records the exact pinned prerequisites.

### Hermitian Gram–Hadamard inequality

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/hermitian-gram-hadamard` — theorem; unchecked.

For any v:Fin n→E in a normed RCLike inner-product space, det Gram(v) is the scalar image of its real part, and 0≤Re(det Gram(v))≤∏i ‖v_i‖². The ambient space need not be finite-dimensional.

Hypotheses: E is normed, not merely seminormed; n may be zero. No linear independence or nonsingularity assumption.

Proof plan:

1. Split on independence. If v is dependent, the pinned determinant/nonzero equivalence implies det Gram(v)=0; all conclusions follow from nonnegative squared norms.
2. For independent v take W=span(range v), with inherited inner product. The checked dimension theorem gives dim W=n; the coerced vectors remain independent. Choose orthonormal coordinates on W.
3. Submodule inclusion preserves inner products and norms, so Gram_W(v)=Gram_E(v). Apply the preceding two nodes in W, square the nonnegative bound, and distribute the square over the product.
4. The coordinate identity supplies reality and nonnegativity, not a comparison in a complex ordering. n=0 gives 1≤1.

API: `TauCeti.GeometryOfNumbersPlan.hermitian_gram_hadamard`: Reality, nonnegativity and diagonal-product upper bound in one interface.

Contract tests:

- The empty Gram determinant and diagonal product both equal 1.
- Family (1,i) in C has Gram [[1,i],[-i,1]], determinant 0 and diagonal product 1; conjugation is essential.
- Real vectors (1,0),(1,1) have Gram [[1,1],[1,2]], determinant 1 and diagonal product 2.

Source use: Couveignes, p.494, first paragraph. The packet records the exact pinned prerequisites.

### Uniform Gram determinant bound

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-uniform-bound` — lemma; unchecked.

If D≥0 and every v_i in v:Fin n→E satisfies ‖v_i‖²≤D, then Re(det Gram(v))≤D^n.

Hypotheses: The bound is on squared norms, not individual coefficients; n=0 is allowed.

Proof plan:

1. Use hermitian-gram-hadamard.
2. Multiply the n pointwise inequalities using nonnegative squared norms and D≥0; the constant product is D^n.
3. No off-diagonal bound is required. For an m-column matrix with entries bounded by A in modulus, the consumer must first show row squared norm ≤m·A², then instantiate D.

API: `TauCeti.GeometryOfNumbersPlan.gram_uniform_bound`: D^n upper bound with D≥0 and squared-norm hypotheses.

Contract tests:

- n=0,D=0 gives 1≤0^0=1.
- A nonempty zero family with D=0 has determinant 0.
- Two orthogonal vectors of squared norm 5 attain determinant 25, so replacing D^n by D fails.

Source use: Couveignes, p.494, definition of D. The packet records the exact pinned prerequisites.

### Squared intrinsic covolume is a Gram determinant

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram` — lemma; unchecked.

For a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic volume and Z-basis b:Fin n→L, covolume(L)²=det Gram_R(i↦b_i in E).

Hypotheses: Use existing Submodule Z E, DiscreteTopology L and IsZLattice R L. The measure is canonical Euclidean volume; arbitrary Haar rescaling changes the identity. Rank equals dim E via existing basis extension. Rank zero is allowed.

Proof plan:

1. Extend b to a real basis by ofZLatticeBasis, giving dim E=n. Choose an orthonormal basis c with the same index.
2. Apply covolume_eq_det_mul_measureReal with b,c and intrinsic volume. The c-fundamental domain equals its parallelepiped almost everywhere, and the latter has volume one.
3. Thus covolume(L)=|det_c(b)|. Square and apply gram-det-orthonormal-coordinates over R.
4. Do not reconstruct covolume, index, fundamental domains or rational discriminant forms. For a proper subspace W instantiate E=W, not ambient volume on a measure-zero subset.

API: `TauCeti.GeometryOfNumbersPlan.covolume_square_gram`: Squared intrinsic covolume equals the real Gram determinant.

Contract tests:

- Basis (2,0),(0,3) has covolume 6 and Gram determinant 36.
- A unimodular shear of the standard Z² basis leaves covolume squared and Gram determinant equal to 1.
- Z(1,1) in its line has intrinsic covolume √2 and Gram determinant 2; ambient plane volume would give the wrong zero.

Source use: Couveignes, p.493, squared transpose-image covolume. The packet records the exact pinned prerequisites.

## GN.1: ordered products and intrinsic balls

These are elementary inputs to a future genuine second-theorem application. They do not construct successive minima or independent lattice witnesses.

### Ordered tail product inequality

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-tail-product` — lemma; unchecked.

For monotone a:Fin n→R with a_j≥1, every i:Fin n satisfies a_i^(n−i.val)≤∏j a_j.

Hypotheses: Indices are zero-based; tail length n−i.val is strictly positive. The lower bound 1 and monotonicity are both load-bearing.

Proof plan:

1. Use the temporary comparison function c_j=1 if j<i and c_j=a_i if i≤j; this is not a new packaged definition.
2. For j<i use 1≤a_j; for i≤j use monotonicity. All c_j≥0, so multiply the inequalities.
3. Split indices below i and at least i. The first product is one, the second has exactly n−i.val equal factors.
4. The consumer must supply and sort the independent nonzero lattice vectors; this arithmetic lemma does not supply minima witnesses.

API: `TauCeti.GeometryOfNumbersPlan.ordered_tail_product`: Natural-power form avoids root conventions.

Contract tests:

- For (1,2,4), the three left sides are 1,4,4 and total product is 8.
- Dropping a_j≥1 fails for (1/2,2): final term 2 exceeds total product 1.
- Dropping ordering fails for (4,1): first square 16 exceeds product 4.

Source use: Couveignes, pp.490 and494, ordered norm lists. The packet records the exact pinned prerequisites.

### Ordered-product root bound

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-product-root-bound` — theorem; unchecked.

If a:Fin n→R is monotone, a_j≥1, and ∏j a_j≤V, then a_i≤V^(1/(n−i.val)) for every i:Fin n, using Real.rpow.

Hypotheses: V≥1 follows from the hypotheses; no negative-base root. n−i.val>0 follows from i:Fin n; n=0 has no requested index.

Proof plan:

1. Combine ordered-tail-product with the upper product bound.
2. A product of terms ≥1 is ≥1, hence V≥1. Also a_i≥0 and the tail length is positive.
3. Apply the pinned positive inverse-power equivalence at exponent the real cast of n−i.val, rewriting the real power at a natural exponent as the natural power.
4. With paper index k=i.val+1 the denominator is n+1−k, not n−k.

API: `TauCeti.GeometryOfNumbersPlan.ordered_product_root_bound`: Paper's one-based denominator without last-index off-by-one.

Contract tests:

- All terms 1 and V=1 give equality.
- For (1,2,4),V=8, the final bound has exponent 1, not 1/0.
- For (2,2),V=4, the first bound 2≤√4 is exact.

Source use: Couveignes, pp.490 and494, individual norm bounds. The packet records the exact pinned prerequisites.

### Intrinsic volume of an orthonormal cube

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/orthonormal-cube-volume` — lemma; unchecked.

For a full real orthonormal basis b:Fin n→E and r≥0, volume_E{x : every |(b.repr x)_i|≤r}=ENNReal.ofReal((2r)^n).

Hypotheses: E finite-dimensional with Borel structure and canonical volume. n=0 and r=0 allowed; no new cube type.

Proof plan:

1. The coordinate map b.repr is measure preserving. Compose it with volume-preserving ofLp into the finite real function space.
2. The set becomes the interval box [−r,r]^n, by |t|≤r iff −r≤t≤r.
3. Apply Real.volume_Icc_pi. Side lengths 2r are nonnegative, so product of ofReal side lengths equals ofReal((2r)^n).
4. The empty-coordinate space has unit mass: n=0,r=0 gives 1, but n>0,r=0 gives 0.

API: `TauCeti.GeometryOfNumbersPlan.orthonormal_cube_volume`: ENNReal volume avoids an implicit finiteness assumption in toReal.

Contract tests:

- n=0,r=0 gives volume 1.
- n=1,r=0 gives volume 0.
- n=2,r=3 gives 36, not 9: r is half-side length.

Source use: Couveignes, p.494, unit-ball estimate. The packet records the exact pinned prerequisites.

### A cube inside the Euclidean unit ball

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/inscribed-cube` — lemma; unchecked.

For a real orthonormal basis b:Fin n→E and n>0, the coordinate cube |(b.repr x)_i|≤1/√n is contained in closedBall_E(0,1).

Hypotheses: The norm is Euclidean and b orthonormal; a general algebraic basis is insufficient. The normalized radius requires n>0.

Proof plan:

1. b.repr preserves norm; use the pinned Euclidean norm-square sum identity.
2. Each coordinate square is at most 1/n because n>0 and its modulus is ≤1/√n.
3. Sum n inequalities: ‖x‖²≤n/n=1. Nonnegative norm implies ‖x‖≤1, exactly closed-ball membership.
4. This is set containment, not a volume theorem. Cube vertices lie on the boundary; containment in the open ball is false.

API: `TauCeti.GeometryOfNumbersPlan.inscribed_cube`: Closed-set containment with explicit positive dimension.

Contract tests:

- n=1 gives [−1,1], whose endpoints have norm 1.
- n=4 gives half-side 1/2; the vertex with all four coordinates 1/2 has squared norm 1.
- Half-side 1 fails for n=2 at (1,1).

Source use: Couveignes, p.494, unit-ball estimate. The packet records the exact pinned prerequisites.

### Intrinsic Euclidean ball lower bound

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/intrinsic-ball-lower-bound` — theorem; unchecked.

For a finite-dimensional real inner-product space E with an orthonormal basis indexed by Fin n and n>0, ENNReal.ofReal((2/√n)^n)≤volume_E(closedBall_E(0,1)). The real lower constant equals 2^n·n^(−n/2).

Hypotheses: Intrinsic volume on E; for a proper subspace of R^M instantiate E with the subspace. This is a closed ball, not its boundary sphere. Dimension zero has unit volume and is separate from division by √0.

Proof plan:

1. Set r=1/√n≥0.
2. Apply orthonormal-cube-volume and inscribed-cube, followed by measure monotonicity.
3. Rewrite 2·(√n)⁻¹ as 2/√n. To match the paper use n>0, √n=n^(1/2), natural-power/real-power comparison and power multiplication to obtain 2^n·n^(−n/2).
4. No compactness-to-finiteness or toReal step is needed for the delivered inequality. Any real-volume corollary must explicitly use finiteness of closed-ball volume.

API: `TauCeti.GeometryOfNumbersPlan.intrinsic_ball_lower_bound`: Closed-ball lower bound for the space's own canonical volume.

Contract tests:

- n=1 gives exact lower bound 2.
- n=4 gives lower constant 1.
- n=2 gives lower constant 2, not 4; ambient volume of a ball in a proper subspace is zero and cannot satisfy this intrinsic estimate.

Source use: Couveignes, p.494, displayed lower estimate. The packet records the exact pinned prerequisites.

## Planets and completion boundary

Only three central estimates are selected as planets: Gram–Hadamard inequality (GN.0), Ordered-product bound and Intrinsic ball bound (GN.1). Supporting identities remain ordinary lemma nodes. This is a checkpoint selection, not a claim that the later stages have no landmarks.

- **GN.0 — partial.** Original lattice/covolume/fundamental-domain/change-of-basis target is already built (reviewed audit). This checkpoint adds Gram/Hadamard adapters. Primitive-orthogonal covolume equality remains an explicit GN.0 gap. The Couveignes weighted/unweighted number-field specialization belongs to the proposed EffectiveBoundsCompactModels Part II, not a new GN.0 carrier.
- **GN.1 — partial.** Blichfeldt and both strict and compact-boundary first-theorem versions are built (reviewed audit). Ordered-product and intrinsic-ball consequences are decomposed here. Successive-minima carrier, positivity/attainment/independent witnesses, and both sides of Minkowski's second theorem remain.
- **GN.2 — partial.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.
- **GN.3 — partial.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.
- **GN.4 — partial.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields.
- **GN.5 — partial.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.
- **GN.6 — partial.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

## Exact gaps and next work

1. **Primitive orthogonal covolumes (fourth routed input).** Couveignes p.493 quotes Martinet Corollary 1.3.5, whose proof has not been read. Required theorem: for rational W⊆R^M, primitive intersections W∩Z^M and W-perp∩Z^M are full lattices in their respective intrinsic spaces and have equal covolume, including W=0/full. Do not use the false assertion that a primitive lattice is an orthogonal direct summand of Z^M. A potential proof uses an integral basis completion and its dual complementary basis, plus a complementary Gram determinant identity; these bridges are not decomposed here. Reuse IntegralLattices for rational duality/gluing if that route is chosen. Tests: Z(1,1) and Z(1,−1) both covolume √2, while replacing the first by 2Z(1,1) gives 2√2 and disproves omission of saturation. GN.0/covolume-square-gram is only an adapter, not this theorem.

2. **Number-field metric comparison and integer-vector norm floor.** Consumer-owned normalization warning (not a request to duplicate it here): the Couveignes extraction routes the weighted/unweighted metric, discriminant normalization and integer-family applications to proposed EffectiveBoundsCompactModels. Couveignes uses twice the complex squared modulus; audited Mathlib mixed-embedding basis (1,i) is unweighted. The consumer must derive the 2^r2 measure factor, not identify unequal covolumes. Nonzero relation-lattice integer vectors have norm≥1; the initial number-field minima instead need the arithmetic norm/product argument. A general lattice does not have the ≥1 floor.

3. **Minkowski second theorem and successive minima.** Blichfeldt and both strict and compact-boundary first-theorem versions are built (reviewed audit). Ordered-product and intrinsic-ball consequences are decomposed here. Successive-minima carrier, positivity/attainment/independent witnesses, and both sides of Minkowski's second theorem remain. Acquire/read an exact freely accessible full proof, distinguish symmetric convex compact bodies with nonempty interior from open/body gauges, define minima on the existing lattice carrier with API and at least three discriminating tests, prove independent attained witnesses, and retain the full two-sided constants 2^n/n! and 2^n times covolume. Lower-rank lattices require their span, and dimension zero has separate empty products.

4. **GN.2 primary-source and proof decomposition.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.

5. **GN.3 primary-source and proof decomposition.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.

6. **GN.4 primary-source and proof decomposition.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields.

7. **GN.5 primary-source and proof decomposition.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.

8. **GN.6 primary-source and proof decomposition.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

9. **Proof execution.** All ten nodes and 27 suggested contract examples remain unchecked planning statements. Lean elaboration checks signatures only; exact finite tests and small scratch proofs do not prove the general results.

The primitive-complement gap is the first resume point. Read its complete source proof and audit possible built rational-duality inputs before selecting the basis-completion or discriminant-form route. Primitivity does not make the ambient integer lattice an orthogonal direct sum. The example Z(1,1) demonstrates why this distinction matters.

Accepted ownership remains binding: RS-07 assigns GN.4 the full Davenport multiset/projection-volume estimate needed by ArithmeticStatistics ST.2; generic convex-body or fixed-domain asymptotics are insufficient. RS-03 assigns verified LLL to GN.5 and its arithmetic applications to ED.1/ED.2. QuadraticFormInvariants, GlobalQuadraticForms, completed IntegralLattices, AdelicAlgebraicGroups and MetaplecticAutomorphicForms retain their existing work. GN.6 imports ordinary exact K theory but still has to construct duality and hermitian invariants; K.6 is only needed by a nonconnective branch. Retired Foundations stages are not dependencies of this packet.

## Validation

- Packet checker with the exact pinned declaration index: ten nodes, seven lemmas, three theorems, three planets, 24 baseline declarations, nine explicit gaps, seven partial stages. No new definition/construction: the checker's definition-only API/test totals are zero; the packet nevertheless records ten theorem APIs and thirty contract tests.
- Suggested Lean file: ten main declarations and 27 contract examples; expected unproved-statement warnings only. This validates signatures, not proofs.
- Six separate small Lean examples check a Hermitian determinant, two real determinants, the missing-floor and missing-order counterexamples, and a four-dimensional cube vertex by actual proofs.
- Independent exact finite calculations check 6,561 Gaussian-integer vector pairs, 9,009 ordered-tail inequalities, 368 primitive rank-one pairs with nonsaturated counterexamples, and 530 cube vertices. They are regression checks, not evidence of general proof completion.
- The compile helper verifies every reached Mathlib source byte against the pin before using cached artifacts. This import closure has 8,482 Mathlib modules and no Tau Ceti modules; no claim of Tau Ceti recompilation is made.
