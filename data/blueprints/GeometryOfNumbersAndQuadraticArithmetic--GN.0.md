# GN.0: integral saturation and kernel determinants

This document closes the target-level follow-up for **Geometry of numbers, quadratic forms and homogeneous arithmetic**, stage GN.0. It builds on the accepted parent packet. Its purpose is to expose the arithmetic information that remains after the real metric-lattice library: how a collection of integer equations determines a primitive lattice, how the gcd of its maximal minors measures its failure to be saturated, and how this content controls two simultaneous congruences. The output is a reusable interface for coefficient-incidence lattices in ArithmeticStatistics. All declarations are planning targets; this document makes no implementation claim.

The parent owns the Gram, adapted-basis, projection and dual-covolume bridges. The reviewed library audit says the original GN.0 lattice carriers, fundamental domains, covolume independence, basis-change formula and number-field embedding factor are built. These remain imports. The additions here have an arithmetic endpoint; they do not reconstruct a general lattice theory. The complete plan has four light definitions, two comparisons and nine theorems. The companion suggested file gives forms over the pinned native carriers; proofs there are placeholders, and the document supplies the precise hypotheses, proof routes, API and checks.

## Scope and conventions

Write A_N=ℤ^N, with coordinates indexed from zero to N−1, and put ⟨c,x⟩=Σ_i c_i x_i. The real realization is Euclidean N-space with squared norm Σ_i x_i². Coordinate casting to ℚ^N and to real Euclidean space is injective and respects the integer module structure. For an integral submodule L write W_L=span_ℝ L, r(L)=rank_ℤ L, and cov(L) for its covolume **inside W_L**, with the inner product inherited from Euclidean N-space. This covolume is the native covolume of the image lattice pulled back along W_L→ℝ^N. It is not the ambient N-dimensional measure of a lower-dimensional parallelepiped. An orthonormal parallelepiped in W_L has volume one. The zero lattice in its zero-dimensional span has covolume one and empty Gram determinant one.

The native finite-free module, span, image, inverse image, orthogonal submodule, dual submodule and additive index carriers are used throughout. No extra integral-lattice structure is introduced. In particular, L⊥ always means the **integral** orthogonal submodule of A_N, consisting of integer vectors annihilating L under the coordinate pairing. W_L⊥ is a real subspace and is a different object. An intrinsic dual of a full lattice in a real subspace lives in that subspace. Treating a lower-rank lattice's dual in all of ℝ^N would add an unrestricted real orthogonal direction and would fail to be discrete.

Let sat(L) be its coordinate saturation; L is primitive when sat(L)=L. A vector c is primitive when the natural gcd of its absolute integer coordinates is one. Thus primitive vectors are nonzero and only exist for N≥1. For an N×k integer matrix C, L_C is the native integer span of its columns. Its column independence is over ℚ. The comparison with real spans below ensures this is also the appropriate independence condition for Euclidean lattice volume. The definition of G(C), however, has no independence restriction.

For a natural modulus Q write K_Q(c) for the modular equation kernel, and K(c) for the exact equation kernel. Source determinant formulas require Q≥1. The definition retains the native Q=0 convention, for which the modular kernel is the exact kernel. This extension is an API boundary case, not a claim that a positive-modulus counting theorem applies at zero. Use ordinary integer gcd with nonnegative output; gcd(0,Q)=Q for Q>0. The matrix determinant in a basis-change proof may have either sign, while every covolume and minor gcd is nonnegative.

## Imported mathematics and ownership

The baseline is Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369** and Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**. Each declaration in the packet's baseline inventory was read at the pin with its surrounding variables and hypotheses. The suggested file imports individual Mathlib modules. All new carriers can be expressed at these pins; there is no additional carrier gap.

The accepted parent packet supplies the following precise contracts. Each name below is the suffix of a node in GeometryOfNumbersAndQuadraticArithmetic:GN.0:

| Parent node | Contract used here |
| --- | --- |
| covolume-square-gram | Squared intrinsic lattice covolume is the determinant of the Gram matrix of an integral basis. |
| saturated-adapted-basis and prescribed-primitive-basis | An integral basis of a rational primitive intersection extends to an integral basis of the ambient full lattice. |
| projected-adapted-basis | Projected complementary basis vectors give a discrete full lattice in the orthogonal space. |
| dual-projection-comap | The intrinsic dual of a projected lattice equals the intersection of its ambient dual with the projection space. |
| orthogonal-intersection-basis | A rational orthogonal intersection in a self-dual lattice has a full intrinsic lattice basis and complementary rank. |
| covolume-projection | The projected factor covolume is the ambient covolume divided by the primitive intersection covolume. |
| covolume-dual | The intrinsic full inner dual has reciprocal covolume. |
| primitive-orthogonal-covolume | Primitive rational orthogonal intersections in a self-dual ambient lattice have equal intrinsic covolumes. |
| mixed-embedding-normalization | The native number-field product-volume factor is 2^(−r₂) times the square root of the absolute discriminant, with each complex coordinate counting as two real dimensions. |

The four accepted Couveignes source routes are retained: primitive-orthogonal-covolume and hermitian-gram-hadamard in GN.0, ordered-product-root-bound and intrinsic-ball-lower-bound in GN.1. None receives a duplicate node here. The weighted arithmetic metric belongs to EffectiveBoundsCompactModels. Its accepted CM.0/canonical-measure defines μcan=2^r₂ times native mixed-space product measure, equivalently the Euclidean volume after multiplying each complex real coordinate by √2. CM.0/canonical-covolume obtains √|disc K|. CM.0/first-half-minima uses that actual transport for the supremum-gauge body and retains the arithmetic house lower bound. Its independent review of 11 October 2026 checks these conventions explicitly. This resolves the parent's outstanding owner-adapter question: at assembly the base packet's gap on the consumer weighted metric is closed by these consumer-owned nodes, and since EffectiveBoundsCompactModels consumes this roadmap, no request or link from GN.0 to it is created. The present integral kernel theorems do not depend on that consumer and acquire no reverse dependency on it.

The current upstream IntegralLattices README, §5F, already plans the general equivalence between torsion-free cokernel and a direct-summand image for injections of finite free integer modules. This document does not re-plan that theorem. It only states the concrete comparison of rational-coordinate saturation, denominator witnesses and real-span intersection. Completed/IntegralLattices remains the owner of integral forms, discriminant modules and gluing used by GN.2. Current TauCeti also proves the general covolume-square/Gram identity and the positive-definite integral realization comparison; those current results are excluded from the new targets even though the parent was written at older pins. Current square Smith-normal-form theorems do not by themselves supply the rectangular maximal-minor or paired-congruence interfaces here. Current Tau Ceti also has Submodule.minorsIdeal (the ideal of p×p minors of a submodule, invariant under linear equivalences, in TauCeti/RingTheory/FittingIdeal/Basic.lean; not at the pin), which IntegralHeckeAndGaloisDeterminants uses for its maximal-minor ideal. It is not planned again here: the content G(C) is the nonnegative generator of the minors ideal of the column lattice over ℤ, recorded as a compatibility item, and this part adds the natural-number content with its saturation-index and determinant theorems.

## Source and route ledger

The source read for the arithmetic formulas is Browning–Le Boudec–Sawin, *The Hasse principle for random Fano hypersurfaces*, arXiv:2006.02356v1, dated 3 June 2020. Page numbers below are its printed preprint pages. The article's published record is Annals of Mathematics 197 (2023), 1115–1203; its version-of-record PDF was not obtained, so no published-page or version collation is claimed. The packet records the hash of the actual v1 PDF and the access date. Equations (2.3) and (2.7), p.4, provide the kernel conventions; pp.7–8 provide intrinsic lattice and dual conventions; pp.11–12 provide the determinant targets.

Lemma 3.8 cites Le Boudec's Lemma 4. Its full proof was read in *Height of rational points on random Fano hypersurfaces*, arXiv:2006.02288v1, §2.2, pp.8–9. That proof factors a column matrix through a basis of its saturation. The cited Cassels and Schmidt books/papers are not recorded as read. Their exact roles in these selected arguments instead terminate in the accepted parent's basis/projection/orthogonal nodes and the pinned PID, determinant and biduality declarations. Thus no unexamined book theorem is concealed at the end of a prerequisite chain. The dependent-column and zero-dimensional extensions are worker deductions and are identified as such in the packet. No source mistake was found in these selected statements or proofs; an empty sourceIssues list does not claim an errata survey of the whole articles.

| Routed BLS item | Owner or new target |
| --- | --- |
| lattice and covolume | Reviewed native lattice carriers; parent intrinsic Gram adapter. |
| projection-quotient | Parent projected-adapted-basis and covolume-projection. |
| primitive-lattice | arithmetic-saturation and arithmetic-saturation-characterisation. |
| orthogonal-lattice | Native integral orthogonal carrier; arithmetic-orthogonal-saturation. |
| dual | Native bilinear dual in its span; parent covolume-dual. |
| schmidt-dual | arithmetic-schmidt-dual. |
| kernel and congruence | arithmetic-exact-kernel and arithmetic-congruence-kernel. |
| minor-gcd | arithmetic-minor-gcd, arithmetic-minor-gcd-unimodular, arithmetic-minor-gcd-rank and arithmetic-minor-gcd-index. |
| intersection-det | arithmetic-intersection-covolume, with the primitive one-row specialization arithmetic-exact-kernel-covolume. |
| congruence-det and mixed-det | arithmetic-pair-triangularisation, arithmetic-two-congruence-covolume and arithmetic-mixed-covolume. |

These additions belong to GN.0. Counting errors, successive-minimum estimates, Veronese primitivity and polynomial valuation identities are separate consumer targets; the fact that they occur nearby in the source does not add them to this scope.

## GN.0 declaration targets

All new node ids below have prefix GeometryOfNumbersAndQuadraticArithmetic:GN.0/. All proposed new library names have namespace TauCeti.ArithmeticLattice. Definitions carry the API and at least three precise tests. The shared ambient, metric and dimension conventions above apply to every target. Proof routes operate at target level: small determinant expansions and integer manipulations remain within the proof of the named theorem.

### Coordinate saturation

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-saturation` (definition).

For L≤A_N, sat(L) is the inverse image in A_N of span_Q(L) under coordinate cast to Q^N. Call L primitive when sat(L)=L.

**Proof route.**

1. Use the native rational span, restrict scalars to Z and take the native comap along coordinate cast. This is a concrete wrapper, not a new finite-free module or general torsion-free quotient theory.
2. Containment and monotonicity follow from span. Applying span twice proves idempotence. The next comparison theorem proves the integral-denominator and real-span descriptions.

**Source.** BLS2020v1, §3.1, p.8, primitive integral lattice convention. The source identifies a primitive lattice by intersection with its real span; the rational-coordinate definition and its comparison are worker adapters.

**Direct prerequisites.** `mathlib:Submodule.span`, `mathlib:Submodule.comap`, `mathlib:Int.castAddHom`.

**Uses.** Le Boudec, Lemma 4, pp.8–9: Replaces a column lattice by the primitive lattice with the same real span before comparing determinants. BLS, Lemma 3.1, p.8: Makes the primitivity needed for the projected-dual equality explicit.

**API.**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ArithmeticLattice.mem_saturation` | characterisation | x∈sat(L) iff its rational coordinate vector belongs to span_Q(L). |
| `TauCeti.ArithmeticLattice.le_saturation` | relation | L≤sat(L). |
| `TauCeti.ArithmeticLattice.saturation_mono` | functoriality | L≤M implies sat(L)≤sat(M). |
| `TauCeti.ArithmeticLattice.saturation_idem` | simp | sat(sat(L))=sat(L). |
| `TauCeti.ArithmeticLattice.saturation_eq_comap_torsion` | compatibility | sat(L) is the preimage under the quotient map A_N→A_N/L of the torsion submodule of A_N/L (Mathlib's Submodule.torsion); hence L is primitive iff A_N/L is torsion-free. Supplied by arithmetic-saturation-characterisation. |

**Unit tests.**

- `TauCeti.ArithmeticLattice.saturation_even_line` (computation): In Z² the saturation of Z(2,2) is Z(1,1).
- `TauCeti.ArithmeticLattice.saturation_zero` (degenerate): sat(0)=0 for every N, including N=0.
- `TauCeti.ArithmeticLattice.saturation_full_index` (non-example): sat(2Z²)=Z², while 2Z² is not primitive.

**Check.** The definition must not retain a proper finite-index submodule of its saturation.

### Rational, integral and real descriptions of saturation

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-saturation-characterisation` (comparison).

For every L≤A_N and x∈A_N, x∈sat(L) iff there is a nonzero integer m with mx∈L, and iff the real coordinate vector of x belongs to span_R L. Consequently sat(L) has the same rank and real span as L. Equivalently, sat(L) is the preimage in A_N of the torsion submodule of A_N/L, so L is primitive exactly when A_N/L is torsion-free.

**Proof route.**

1. Apply exists_smith_normal_form_of_le to L≤A_N. In an integral ambient basis L is generated by a_i b_i for i<r; independence of the L basis implies each a_i≠0.
2. An integral basis of A_N has unimodular coordinate matrix; casting it to Q and R gives a basis in each field. Thus both rational and real membership are vanishing of the coordinates outside the initial r positions.
3. For an integral vector with those coordinates zero, the product of the nonzero a_i clears all denominators, including the empty product 1 when r=0. Conversely a nonzero integer scalar is invertible over both fields.
4. The first r ambient vectors span the saturation and both field spans, proving rank agreement without importing or reproving the general direct-summand dictionary.
5. The denominator criterion says exactly that the class of x in A_N/L is killed by a nonzero integer, i.e. lies in Mathlib's torsion submodule of the quotient; this gives the torsion description. It is the concrete torsion-free-cokernel form of primitivity and does not re-plan the general direct-summand criterion of IntegralLattices §5F.

**Source.** BLS2020v1, §3.1, p.8, primitive convention. Worker comparison between the source real-span convention and the concrete rational-coordinate definition. MathlibPinGN0, exists_smith_normal_form_of_le, FreeModule/PID.lean. Diagonal bases provide the denominator argument without an unread book.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-saturation`, `mathlib:Submodule.exists_smith_normal_form_of_le`, `mathlib:Matrix.isUnit_iff_isUnit_det`, `mathlib:Submodule.torsion`.

**Check.** For L=Z(2,2), (1,1) has denominator witness m=2. For L=0, only the zero vector has a nonzero scalar multiple in L.

### Integral orthogonal rank and double orthogonal

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-orthogonal-saturation` (comparison).

Use the existing integral orthogonal submodule L⊥ for the coordinate dot product. For every L≤A_N, L⊥ is primitive, rank_Z(L⊥)+rank_Z(L)=N, and (L⊥)⊥=sat(L). Its real span is (span_R L)⊥.

**Proof route.**

1. Integer dot-product equations survive division by a nonzero integer, so the denominator criterion makes L⊥ saturated.
2. Apply the parent orthogonal-intersection-basis to the standard self-dual lattice Z^N and the rational real span of L, using saturation-characterisation to supply the full intersection. This gives a full intrinsic lattice in the real orthogonal subspace. The standard basis is orthonormal for the coordinate pairing, so dualBasis_eq_iff makes it its own dual basis and dualSubmodule_span_of_basis gives A_N*=A_N, the self-duality the parent nodes assume.
3. Use the pinned complementary-dimension identity for the rank sum. Apply the pinned real double-orthogonal identity and saturation-characterisation to obtain (L⊥)⊥=sat(L).

**Source.** BLS2020v1, §3.1, p.8, orthogonal integral lattice discussion. States primitive orthogonals, complementary rank and the primitive double-orthogonal criterion. LeBoudec2020v1, §2.2, p.8, before Lemma 4. Explains full rank by rational orthogonal equations.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-saturation-characterisation`, `mathlib:LinearMap.BilinForm.orthogonal`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthogonal-intersection-basis`, `mathlib:Submodule.finrank_add_finrank_orthogonal`, `mathlib:Submodule.orthogonal_orthogonal`, `mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis`, `mathlib:LinearMap.BilinForm.dualBasis_eq_iff`.

**Check.** Z(2,2) has orthogonal Z(1,−1), but its double orthogonal is Z(1,1). The zero and full submodules exchange under integral orthogonal, in all dimensions.

### Exact dot-product kernel

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-exact-kernel` (definition).

For c∈A_N let K(c)=ker(x↦Σ_i c_i x_i), a native integer linear-map kernel. It is the integral orthogonal of the native span_Z{c}.

**Proof route.**

1. Apply native dotProductBilin over Z to c and take LinearMap.ker. Membership is the exact integer equation, with no primitivity hypothesis.
2. By symmetry and bilinearity, vanishing on c is equivalent to vanishing on its integral span. A nonzero scalar on c does not change the kernel because Z has no zero divisors.
3. The orthogonal-saturation theorem supplies saturation and complementary rank: if c≠0 then rank K(c)=N−1; if c=0 then K(c)=A_N.

**Source.** BLS2020v1, Equation (2.3), p.4; §3.1, p.8. The exact coefficient incidence condition is an integer dot-product kernel, also the orthogonal of the generated line.

**Direct prerequisites.** `mathlib:dotProductBilin`, `mathlib:LinearMap.ker`, `mathlib:LinearMap.BilinForm.orthogonal`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-orthogonal-saturation`.

**Uses.** ArithmeticStatistics:ST.5/coefficient-vector-form: The hypersurface coefficient equation supplies this exact lattice. BLS, Lemmas 3.8–3.9, pp.11–12: Intersections of exact kernels and an exact/congruence intersection need this carrier.

**API.**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ArithmeticLattice.mem_exactKernel` | characterisation | x∈K(c) iff Σ_i c_i x_i=0. |
| `TauCeti.ArithmeticLattice.exactKernel_zero` | simp | K(0)=A_N. |
| `TauCeti.ArithmeticLattice.exactKernel_smul` | functoriality | For m∈Z with m≠0, K(mc)=K(c). |
| `TauCeti.ArithmeticLattice.exactKernel_eq_orthogonal` | compatibility | K(c) equals the native integral orthogonal of span_Z{c}. |
| `TauCeti.ArithmeticLattice.saturation_exactKernel` | relation | sat(K(c))=K(c): every exact kernel is primitive, including K(0)=A_N. |
| `TauCeti.ArithmeticLattice.finrank_exactKernel` | structure | For c≠0, rank_Z K(c)=N−1. |

**Unit tests.**

- `TauCeti.ArithmeticLattice.exactKernel_diagonal` (computation): K((1,1)) in Z² is Z(1,−1).
- `TauCeti.ArithmeticLattice.exactKernel_nonprimitive` (non-example): K((2,2))=K((1,1)); coefficient scaling does not halve the kernel.
- `TauCeti.ArithmeticLattice.exactKernel_zero_test` (degenerate): K(0)=A_N, including the unique zero-dimensional submodule.

**Check.** Nonprimitive coefficient vectors are permitted; no covolume formula depending on their unnormalized norm is inferred.

### Dot-product congruence kernel

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-congruence-kernel` (definition).

For c∈A_N and a natural Q let K_Q(c)=ker(A_N→ZMod Q, x↦Σ_i c_i x_i mod Q). Positive Q is the source modulus; the native extension Q=0 recovers the exact kernel.

**Proof route.**

1. Compose the integer dot-product functional with native integer cast to ZMod Q and take LinearMap.ker. Use the pinned cast-zero/divisibility equivalence for membership.
2. For Q>0 the submodule contains QA_N and is full rank; its quotient identifies with the image of the residue functional.
3. To obtain its index API, diagonalize the integer row by the pinned PID theorem. Its image in Z is content(c)Z; modulo Q it has cardinal Q/gcd(content(c),Q). This includes c=0, when the index is one.

**Source.** BLS2020v1, Equation (2.7), p.4; Lemma 3.9, pp.11–12. Defines the modular incidence lattice and calculates simultaneous congruence indices. The single-row index and Q=0 convention are explicit worker extensions.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-exact-kernel`, `mathlib:Int.castAddHom`, `mathlib:LinearMap.ker`, `mathlib:ZMod.intCast_zmod_eq_zero_iff_dvd`, `mathlib:Submodule.exists_smith_normal_form_of_le`, `mathlib:Submodule.natAbs_det_basis_change`.

**Uses.** ArithmeticStatistics:ST.5/two-point-incidence-count: Two simultaneous residue coefficient equations determine the density denominator. BLS, Lemma 3.9, pp.11–12: Provides both the full-rank congruence intersection and the lower-rank mixed intersection.

**API.**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ArithmeticLattice.mem_congruenceKernel` | characterisation | x∈K_Q(c) iff Q divides Σ_i c_i x_i in Z. |
| `TauCeti.ArithmeticLattice.congruenceKernel_one` | simp | K_1(c)=A_N. |
| `TauCeti.ArithmeticLattice.congruenceKernel_modulus_zero` | compatibility | K_0(c)=K(c), using native ZMod 0. |
| `TauCeti.ArithmeticLattice.exactKernel_le_congruenceKernel` | relation | K(c)≤K_Q(c) for every Q. |
| `TauCeti.ArithmeticLattice.congruenceKernel_index` | data | For Q>0, [A_N:K_Q(c)]=Q/gcd(content(c),Q), where content(c)=gcd_i \|c_i\|. |
| `TauCeti.ArithmeticLattice.smul_mem_congruenceKernel` | relation | Q·x∈K_Q(c) for every x∈A_N and every natural Q, i.e. QA_N≤K_Q(c). |
| `TauCeti.ArithmeticLattice.finrank_congruenceKernel` | structure | For Q>0, rank_Z K_Q(c)=N: a positive-modulus kernel has full rank. |

**Unit tests.**

- `TauCeti.ArithmeticLattice.congruenceKernel_even_coordinate` (computation): K_6((1,0)) in Z² is 6Ze₁⊕Ze₂.
- `TauCeti.ArithmeticLattice.congruenceKernel_zero_vector` (degenerate): K_Q(0)=A_N for all Q, including Q=0.
- `TauCeti.ArithmeticLattice.congruenceKernel_not_primitive` (non-example): sat(K_2((1,0)))=Z² and K_2((1,0))≠Z².

**Check.** A positive modulus gives full rank, but usually not saturation.

### Gcd of maximal minors

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd` (definition).

For every integer N×k matrix C let G(C) be the natural gcd of |det C_e| over all row embeddings e:Fin k→Fin N, where C_e uses every column in its original order. Reordered rows only duplicate absolute values. For k=0 the unique empty minor has determinant 1; for k>N there are no row embeddings and G(C)=0.

**Hypotheses and boundary.** No independence hypothesis belongs to this definition. In particular dependent positive-column matrices have G=0, a convention needed by p-adic consumers.

**Proof route.**

1. Use the existing Matrix submatrix/determinant and Finset.gcd over the finite set of embeddings. Normalization by integer absolute value removes signs and row-order choices.
2. The native gcd divisibility characterization supplies the universal property. The empty-column value is one, distinct from the empty-family value zero.
3. The minor-gcd-rank theorem proves the dependent-column convention. For a square right multiplier V, each selected minor of CV is C_e V; determinant multiplicativity and gcd_mul_right yield G(CV)=|det V|G(C).

**Source.** BLS2020v1, Definition 3.7, p.11. Defines G for independent columns; the total natural-valued extension is a worker API refinement required by the ArithmeticStatistics request.

**Direct prerequisites.** `mathlib:Finset.gcd`, `mathlib:Finset.dvd_gcd_iff`, `mathlib:Matrix.det_mul`, `mathlib:Finset.gcd_mul_right`.

**Uses.** Le Boudec, Lemma 4, pp.8–9: Measures the index lost when passing from columns to their saturation. ArithmeticStatistics:ST.5/veronese-minor-valuation: Allows dependent columns: gcd(0,p^r)=p^r, so capped valuations remain meaningful. ArithmeticStatistics:ST.5/two-point-incidence-count: G for the two coefficient rows is the simultaneous-congruence correction factor.

**API.**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_dvd_minor` | data | G(C) divides the absolute determinant of each selected maximal minor. |
| `TauCeti.ArithmeticLattice.dvd_maximalMinorGCD_iff` | universal-property | a divides G(C) iff it divides the absolute value of every maximal minor. |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_empty` | simp | An N×0 integer matrix has G=1. |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_zero_iff` | characterisation | G(C)=0 iff its columns are not linearly independent over Q; supplied by arithmetic-minor-gcd-rank. |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_mul_right` | functoriality | For integer k×k V, G(CV)=G(C)\|det V\|, without an independence assumption. |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_single_column` | simp | For an N×1 matrix, G is the natural gcd of the absolute values of its entries (the content of the column); used for the one-equation kernel covolume. |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_square` | simp | For a square N×N matrix C, G(C)=\|det C\|: the row embeddings are permutations, which change the determinant only by sign. Includes N=0. |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_eq_zero_of_lt` | simp | If N<k then G(C)=0, since there is no row embedding Fin k→Fin N. |
| `TauCeti.ArithmeticLattice.maximalMinorGCD_span_eq_minorsIdeal` | compatibility | For every integer N×k matrix C, the ideal of Z generated by G(C) is the ideal of k×k minors of its column lattice, (span_Z of the columns).minorsIdeal k, in current Tau Ceti's Submodule.minorsIdeal (TauCeti/RingTheory/FittingIdeal/Basic.lean); G(C) is its nonnegative generator. No independence is assumed: dependent columns and k>N give the zero ideal, k=0 the unit ideal. minorsIdeal is in current Tau Ceti but not at the pin, so this item is untyped in the suggested file; once the baseline moves, minorsIdeal_comap_equiv also yields the ambient unimodular invariance. |

**Unit tests.**

- `TauCeti.ArithmeticLattice.maximalMinorGCD_rectangular` (computation): For columns (2,0,0),(0,3,0) in Z³, G=6.
- `TauCeti.ArithmeticLattice.maximalMinorGCD_empty_test` (degenerate): The unique 0×0 matrix has G=1.
- `TauCeti.ArithmeticLattice.maximalMinorGCD_dependent` (non-example): For columns (1,2),(2,4) in Z², G=0.
- `TauCeti.ArithmeticLattice.maximalMinorGCD_skew_pair` (computation): For columns (1,1,1),(1,−1,1) in Z³, G=2: the minors on the row pairs {1,2},{1,3},{2,3} are −2, 0 and 2. The tempting wrong values √det(CᵀC)=2√2, the product of the column contents 1 and the gcd of all entries 1 all differ.

**Check.** Do not confuse the gcd with a selected minor, its sign, or the determinant of the Gram matrix.

### Unimodular invariance of determinantal content

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-unimodular` (theorem).

For any integer N×k C and integer unimodular N×N U, G(UC)=G(C). Combined with G(CV)=G(C)|det V|, this makes G invariant under unimodular changes in both ambient and generator coordinates.

**Hypotheses and boundary.** Unimodular means determinant is a unit in Z, hence ±1, not merely nonzero.

**Proof route.**

1. Expand each row of a selected minor of UC as an integer linear combination of rows of C. Repeated expansion by determinant row additivity and homogeneity expresses it as an integer combination of determinants of k-tuples of rows of C.
2. A tuple with a repeated row has determinant zero; a tuple of distinct rows is an embedding already included in G(C), up to row order. Thus G(C) divides every minor of UC and divides G(UC).
3. The integral inverse U⁻¹ gives the reverse divisibility. Natural gcd normalization gives equality. This supplies the minor-content argument that the read Le Boudec proof cites to Cassels; no rectangular Cauchy–Binet theorem is assumed.

**Source.** LeBoudec2020v1, Lemma 4 proof, p.9, after (2.12). Worker replacement of the cited primitive-minor argument: integral row changes preserve the common divisor of maximal minors.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd`, `mathlib:Matrix.isUnit_iff_isUnit_det`, `mathlib:Matrix.det_updateRow_add`, `mathlib:Matrix.det_updateRow_smul`, `mathlib:Finset.dvd_gcd_iff`.

**Check.** A shear or orientation reversal leaves G unchanged. Multiplying one ambient coordinate by 2 is not a unimodular operation and can change G.

### Vanishing content detects dependent columns

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-rank` (theorem).

For every integer N×k matrix C, G(C)=0 iff its rational columns are not linearly independent. Equivalently independent columns have positive G. This includes k=0 and k>N.

**Proof route.**

1. The gcd is zero exactly when every selected maximal minor is zero. A nontrivial rational dependence survives selection of rows, so all selected square determinants vanish.
2. For independent columns, use the diagonal bases of the pinned PID inclusion for their column lattice in A_N. Its rank is k; every diagonal coefficient is nonzero. In these ambient coordinates the first k rows give the nonzero product of those coefficients times a unimodular generator determinant.
3. Unimodular invariance transfers nonvanishing content to the original matrix. Empty columns give G=1 and are independent; when k>N, independence is impossible and the minor family is empty.

**Source.** BLS2020v1, Definition 3.7, p.11. Worker extension of the independent-column definition, using its maximal minors to specify all boundary cases.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-unimodular`, `mathlib:Submodule.exists_smith_normal_form_of_le`, `mathlib:Matrix.det_mul`.

**Check.** Two equal columns give zero even if each column is primitive. G for a nonzero single column is the gcd of its coordinates, hence positive.

### Minor content is the saturation index

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-index` (theorem).

If the k columns of integer N×k C are independent over Q and L=span_Z(columns C), then G(C)=[sat(L):L], the relative additive index of L in sat(L). This is a positive finite integer. For k=0 both sides are one; for k=N it is the full lattice index in A_N.

**Hypotheses and boundary.** Independence includes k=0 and implies k≤N. Dependent matrices do not satisfy this index formula with their maximal-column minors.

**Proof route.**

1. Diagonalize L≤A_N using the pinned PID theorem. Saturation-characterisation identifies sat(L) with the span of the first k ambient basis vectors.
2. The prescribed columns and the diagonal generators are both integral bases of L, so their generator-change matrix is unimodular. Apply the right determinant rule and ambient unimodular invariance to compute G(C)=product_i |a_i|.
3. Apply natAbs_det_basis_change in the intrinsic finite free module sat(L): the inclusion determinant is product_i a_i. Its absolute value is Nat.card(sat(L)/L), equal to the relative subgroup index.
4. This supplies the complete primitive-minor step in Le Boudec without using an unread Cassels reference or redeveloping Smith normal form.

**Source.** LeBoudec2020v1, Lemma 4 proof, pp.8–9, (2.11)–(2.12). The read proof factors the columns through a saturation basis and identifies their maximal-minor gcd with the determinant of the inclusion.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-saturation-characterisation`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-unimodular`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd`, `mathlib:Submodule.exists_smith_normal_form_of_le`, `mathlib:Submodule.natAbs_det_basis_change`, `mathlib:AddSubgroup.relIndex_eq_natAbs_det`, `mathlib:Matrix.det_mul`.

**Check.** Columns 2e₁,3e₂ in Z³ have saturation index 6. The primitive diagonal generator (1,1) has index and content one; (2,2) has both equal to two.

### Covolume of simultaneous exact kernels

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-intersection-covolume` (theorem).

For independent rational columns c₁,…,c_k of C (0≤k≤N), put L=span_Z(c_i) and H=⋂_i K(c_i)=L⊥. Then H is primitive of rank N−k and cov(H)=cov(L)/G(C). The source range 1≤k≤N−1 is included; the empty and full-column extensions have covolume one for the zero-dimensional side.

**Proof route.**

1. The exact-kernel membership API identifies the intersection with the existing integral orthogonal of L. Orthogonal-saturation proves its rank and primitivity.
2. The accepted parent primitive-orthogonal-covolume identifies cov(H) with cov(sat(L)), in their respective real spans inside the standard self-dual ambient lattice.
3. Apply the pinned intrinsic covolume/relative-index theorem to L≤sat(L) in their common real span. The index theorem identifies the ratio with G(C); its positivity justifies division.
4. For k=0, L=0, H=A_N and G=1. For k=N, H=0 and the quotient is cov(L)/[A_N:L]=1. No ambient-volume calculation on a proper subspace is used.

**Source.** BLS2020v1, Lemma 3.8, p.11. States the independent-column intersection determinant formula. LeBoudec2020v1, Lemma 4 and proof, pp.8–9. Supplies the saturation/inclusion determinant argument underlying Lemma 3.8.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-exact-kernel`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-orthogonal-saturation`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-index`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/primitive-orthogonal-covolume`, `mathlib:ZLattice.covolume_div_covolume_eq_relIndex'`.

**Check.** For c=(2,2), cov(K(c))=2√2/2=√2. For columns 2e₁,3e₂ in Z³, the intersection is Ze₃ with covolume 1=6/6.

### Primitive coefficient kernel covolume

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-exact-kernel-covolume` (theorem).

For a primitive integer vector c (gcd_i |c_i|=1), cov(K(c))=‖c‖₂. Such a vector is nonzero and N≥1. No corresponding equality is asserted for an unnormalized nonprimitive vector.

**Proof route.**

1. Apply intersection-covolume to the single column c. Its integral line has intrinsic covolume ‖c‖₂ by the parent Gram identity, and its minor gcd is the coordinate gcd, one.
2. For a nonzero nonprimitive c, the same argument instead gives cov(K(c))=‖c‖₂/content(c). The zero coefficient vector has full kernel with covolume one and is handled by the definition API, not by division by its zero norm.

**Source.** BLS2020v1, Lemma 3.8, p.11, k=1; Lemma 3.9 proof, p.12. The primitive one-equation specialization is the exact-kernel normalization used by the mixed determinant formula.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-intersection-covolume`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram`, `mathlib:ZLattice.covolume_pos`.

**Check.** c=(1,1) gives √2. c=(2,2) is excluded from the primitive formula and still has kernel covolume √2.

### Schmidt projected-dual equality

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-schmidt-dual` (theorem).

If L≤A_N is primitive, W=span_R L, and π projects orthogonally onto W⊥, then the intrinsic inner dual of L⊥ in W⊥ equals π(A_N). Both sides are discrete full lattices in W⊥ of rank N−rank L. This is a concrete equality of submodules, not just an abstract group isomorphism.

**Hypotheses and boundary.** The dual lives in W⊥. The ambient dual of a lower-rank submodule in R^N is not used.

**Proof route.**

1. Use saturation-characterisation to identify L with A_N∩W. The parent saturated-adapted-basis gives an integral basis of A_N whose first block is a basis of L; the parent projected-adapted-basis then shows that the projections of the remaining block form a real basis of W⊥ with integral span π(A_N), so π(A_N) is discrete and full in W⊥.
2. Standard A_N is self-dual for the coordinate inner pairing: its standard basis is orthonormal, so dualBasis_eq_iff makes it its own dual basis and dualSubmodule_span_of_basis gives A_N*=A_N. The parent dual-projection-comap gives (π(A_N))*=A_N∩W⊥=L⊥ inside W⊥.
3. The pinned symmetric-nondegenerate double-dual theorem applies to the integral span of the projected real basis; dualizing again gives the stated equality. The parent orthogonal-intersection-basis supplies the rank/fullness of L⊥ independently.

**Source.** BLS2020v1, Lemma 3.1, p.8; quotient lattice Λ/Γ=π(Λ), §3.1, p.7; intrinsic dual (3.4), p.8. States the equality between the intrinsic dual of the integral orthogonal lattice and the projected quotient. The proof here terminates in the accepted parent projection bridge and pinned biduality rather than unread Schmidt.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-saturation-characterisation`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-orthogonal-saturation`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/projected-adapted-basis`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/dual-projection-comap`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthogonal-intersection-basis`, `mathlib:LinearMap.BilinForm.dualSubmodule_dualSubmodule_of_basis`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/saturated-adapted-basis`, `mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis`, `mathlib:LinearMap.BilinForm.dualBasis_eq_iff`.

**Check.** For L=Z(1,1), both sides are generated by (1/2,−1/2) in the antidiagonal line. For L=A_N both sides are the zero lattice in dimension zero. For L=0 both sides are the standard self-dual lattice.

### Primitive-row triangular coordinates

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-pair-triangularisation` (theorem).

Let N≥2 and c,d∈A_N be independent over Q, with c primitive. There exist an integer unimodular N×N T and f∈Z for which cᵀT=(1,0,…,0) and dᵀT=(f,G(c,d),0,…,0), with G(c,d)>0. Primitivity of d is not required for this auxiliary result.

**Proof route.**

1. Apply the pinned PID diagonalization to the row c, or to its transposed rank-one submodule. Coordinate content one makes its nonzero diagonal entry a unit; adjust its sign and transpose the integral coordinate change to obtain cᵀT₀=e₁ᵀ.
2. Write dᵀT₀=(f,v), with a nonzero residual integer row v by independence. A second PID row change inside the last N−1 coordinates takes v to (g,0,…,0), where g is its positive coordinate gcd.
3. The maximal 2×2 minors of the two transformed rows consist of the residual entries up to sign and zeros. Ambient unimodular invariance of the transposed column matrix identifies g with G(c,d).
4. Compose the two unimodular changes. This establishes the precise version of the source triangularization, retaining c as the first equation rather than silently applying row operations to both equations.

**Source.** BLS2020v1, Lemma 3.9 proof, equation (3.6), p.11. The source introduces these coordinates. The two-step row argument spells out why the primitive first equation remains fixed.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-unimodular`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd-rank`, `mathlib:Submodule.exists_smith_normal_form_of_le`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-minor-gcd`.

**Check.** For c=(1,0), d=(1,2), T=identity, f=1 and G=2 work. Replacing c by (2,0) violates the primitive hypothesis and cannot produce first row (1,0).

### Two-congruence determinant

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-two-congruence-covolume` (theorem).

Let N≥2, Q≥1, and primitive independent integer c,d. The full-rank lattice H=K_Q(c)∩K_Q(d) has index and intrinsic covolume [A_N:H]=cov(H)=Q²/gcd(G(c,d),Q). The fraction is an integer; full rank is a conclusion. The formula need not hold for dependent or nonprimitive pairs.

**Proof route.**

1. Use pair-triangularisation with integer coordinates x=Tz. The first congruence is Q|z₁. With it imposed, the second is Q|Gz₂, because fz₁ is already divisible by Q.
2. Set g=gcd(G,Q). Elementary integer Bezout gives Q|Gz₂ iff (Q/g)|z₂. Thus in z-coordinates H has basis Qe₁,(Q/g)e₂,e₃,…,e_N.
3. Unimodular T preserves the additive index and full lattice covolume. The pinned determinant/index theorem gives Q(Q/g); the standard lattice has covolume one (its standard basis has identity Gram matrix, so the parent covolume-square-gram and positivity of covolume give one), and the pinned intrinsic ratio theorem identifies this index with cov(H).
4. The resulting positive finite index proves fullness. The original definitions also show QA_N≤H, making the conclusion independent of the calculation.

**Source.** BLS2020v1, Lemma 3.9, first formula and proof (3.6)–(3.7), pp.11–12. The two modular equations become diagonal divisibility conditions, yielding the full-rank determinant.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-congruence-kernel`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-pair-triangularisation`, `mathlib:Submodule.natAbs_det_basis_change`, `mathlib:ZLattice.covolume_div_covolume_eq_relIndex'`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram`, `mathlib:ZLattice.covolume_pos`.

**Check.** c=(1,0), d=(1,2), Q=6 give G=2 and covolume 18, not 36. For Q=1 every congruence kernel is A_N and the formula gives one. For c=e₁,d=e₂ the index is Q².

### Exact-and-congruence determinant

Node `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-mixed-covolume` (theorem).

Let N≥2, Q≥1, and primitive independent integer c,d. The lattice H=K(c)∩K_Q(d) has rank N−1 and intrinsic covolume cov(H)=‖c‖₂ Q/gcd(G(c,d),Q). More precisely [K(c):H]=Q/gcd(G(c,d),Q). H is a full lattice in the hyperplane c⊥; it need not be primitive in A_N.

**Proof route.**

1. In the same triangular coordinates, K(c) has basis Te₂,…,Te_N. The congruence on d becomes Q|Gz₂ since z₁=0.
2. With g=gcd(G,Q), the mixed lattice is generated by (Q/g)Te₂,Te₃,…,Te_N. Thus its relative index in K(c) is Q/g and its rank is N−1.
3. Apply the pinned covolume/relative-index theorem inside the real hyperplane c⊥, then substitute exact-kernel-covolume. T is generally not an isometry; no norm or Gram determinant is declared invariant under this integral coordinate change.
4. Unlike the full-rank congruence formula, this argument compares two lattices in their common hyperplane. Multiplying the complete kernel covolume by its relative index supplies the norm factor.

**Source.** BLS2020v1, Lemma 3.9, second formula and proof, pp.11–12. The exact first equation and residual modular condition give an index Q/g in the primitive exact kernel, hence the displayed determinant.

**Direct prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-exact-kernel`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-congruence-kernel`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-pair-triangularisation`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-exact-kernel-covolume`, `mathlib:Submodule.natAbs_det_basis_change`, `mathlib:ZLattice.covolume_div_covolume_eq_relIndex'`.

**Check.** c=(1,0), d=(1,2), Q=6 give H=3Ze₂ with covolume 3. c=(1,1), d=(1,−1), Q=6 give H=3Z(1,−1) with intrinsic covolume 3√2. For Q=1 the formula recovers cov(K(c))=‖c‖₂.

## Worked arithmetic checks

For C with columns 2e₁ and 3e₂ in ℤ³, the column lattice is 2ℤe₁⊕3ℤe₂, its saturation is ℤe₁⊕ℤe₂, and its index there is six. The ordered row selections produce maximal minor absolute values six or zero; their gcd is six. Its Gram determinant is 36 and its intrinsic two-dimensional covolume is six. The simultaneous exact kernel is ℤe₃, with one-dimensional covolume one. Thus the intersection formula gives 6/6=1. The ambient volume of the column parallelogram would be zero and would fail this check. If the same matrix is regarded as a full-rank 2×2 matrix, the exact intersection is the zero lattice and the formula still gives one, using the empty-dimensional volume convention.

For the one-column lattice ℤ(2,2), the saturation is ℤ(1,1), so the saturation index and maximal-minor gcd are both two. The column lattice covolume is 2√2. Its exact kernel is ℤ(1,−1), whose covolume is √2. This tests both the denominator in the intersection formula and invariance of an exact kernel under nonzero coefficient scaling. It also rejects using the nonprimitive norm 2√2 as the kernel covolume. Applying integral orthogonal twice gives the saturation ℤ(1,1), rather than the original submodule.

For c=(1,0), d=(1,2), Q=6, both vectors are primitive and independent. Their 2×2 minor has absolute determinant two, so gcd(G,Q)=2. The two congruences say that x is divisible by six and x+2y is divisible by six; hence y is divisible by three. The full-rank kernel is 6ℤe₁⊕3ℤe₂, with index and covolume 18=36/2. Imposing the exact first equation gives x=0 and leaves 3ℤe₂, with covolume 3=‖c‖₂·6/2. This single pair checks the gcd correction in both formulas and their different ambient ranks.

For c=(1,1), d=(1,−1), Q=6, the mixed exact equation gives (x,y)=(t,−t). The modular equation becomes 6 dividing 2t, so t is divisible by three. The result is 3ℤ(1,−1) with covolume 3√2. Here the factor √2 is essential. An integral coordinate change used in triangularization need not preserve lengths; the covolume proof takes an index inside the common hyperplane and multiplies it by the complete exact-kernel covolume.

For primitive L=ℤ(1,1) in ℤ², its integral orthogonal is ℤ(1,−1). The intrinsic dual of the latter is generated by (1/2,−1/2). Orthogonal projection of e₁ and e₂ off L gives that same generator and its negative. This directly checks the equality in the Schmidt target and its embedding in the antidiagonal line. At L=ℤ² the target is equality of two zero lattices in a zero-dimensional space. At L=0 it is ordinary standard self-duality.

For two dependent columns (1,2) and (2,4), G is zero. This is a defined value even though the source originally restricts G to independent columns. A capped p-adic valuation consumer can therefore use gcd(G,p^r)=p^r. It must not apply the independent-column saturation-index or intersection formula with this zero denominator. For no columns G is one, while for more columns than ambient dimension the row-embedding family is empty and G is zero. These two superficially empty cases are deliberately different.

## Consumers, metadata and completion

ArithmeticStatistics:ST.5/two-point-incidence-count requests the two-congruence formula. It consumes arithmetic-two-congruence-covolume with actual primitive independent coefficient rows and positive modulus. ST.5/coefficient-vector-form consumes the exact integer kernel, and ST.5/veronese-minor-valuation consumes the total gcd convention, including dependent columns. The paper-specific Veronese valuation comparison stays with that consumer. The generic saturation and content objects are planned here once, and those nodes can be referenced directly when the consumer request is reconciled.

The prerequisite chains here terminate in the 26 recorded baseline declarations or accepted parent nodes. There are no stage-level requests or mathematical gaps. GN.0 is **closed at target level** and the packet's pass status is **complete**, ready for independent review. Every implementationStatus remains unchecked. Complete coverage refers to the original audited targets plus the imported parent targets and this follow-up's source routes; it does not mean all prerequisites have been formally proved.

The six planets for this part are Primitive lattice, Gcd of maximal minors, Orthogonal lattice determinant, Schmidt dual lattice, Two-congruence determinant and Mixed kernel determinant. The base packet already shows three planets on GN.0 (Gram–Hadamard inequality, Factor-lattice covolume, Primitive orthogonal covolumes), and a layer shows at most six. The packet therefore proposes dividing GN.0 for the atlas into GN.0a, metric lattices: Gram determinants, projections and duality (the base packet's nodes and three planets), and GN.0b, integral saturation and kernel determinants (the fifteen nodes here and their six planets), with GN.0a before GN.0b. Assembly must retain the parent node ids and the supplied imports, without adding their existing declarations a second time.

Confirmed finding RT-AREA-algebraicnt-1/1 says that the roadmap names QuadraticFormInvariants, GlobalQuadraticForms, AdelicAlgebraicGroups and Completed/IntegralLattices as owners in prose but records no direct supplier contract with them. Its verifier confirmed it narrowly and fixed the remedy: quoted supplier-stage to consumer-stage links in the link workflow, with full tauceti: identifiers, from which assembly derives the roadmap-level prerequisites and the suppliers' consumers; roadmap metadata, generated exports and Tau Ceti documents are not edited by hand. No GN.0 node uses any of the four suppliers, so this part adds no link into GN.0. The links belong to the layers that consume them: the QuadraticFormInvariants field-invariant layers, GlobalQuadraticForms Layers 5–6 and Completed IntegralLattices Layers 1–4 into GN.2, and AdelicAlgebraicGroups AA.2 and AA.3 into GN.3, as the GN.2 and GN.3 parts record. The packet's restructure field states this proposal.

## Source access

- [Browning–Le Boudec–Sawin, arXiv v1](https://arxiv.org/pdf/2006.02356v1): selected definitions and proofs at the locators above; SHA-256 210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb.
- [Le Boudec, arXiv v1](https://arxiv.org/pdf/2006.02288v1): §2.2, Lemma 4, pp.8–9; SHA-256 cb782025395c1c755d133328654dfbc61846389689a8dda893354c05fea882b8.
- [Pinned Mathlib](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib): exact files and statements enumerated in the packet baseline inventory.

Sources were accessed on 13 October 2026. No source passage or source PDF is included in the repository. The selected preprint proofs suffice for the planned statements; publication collation is a bibliographic limit of this reading, not an extra assumed mathematical input.
