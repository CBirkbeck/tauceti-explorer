# H.4 — Parabolic bounds and unitary deformation vanishing

This layer develops the parabolic vector-bundle estimate behind Landesman–Litt’s rank theorem for the cohomology of a unitary local system on a versal family of curves. It then proves a different vanishing theorem with coefficients in a local Artinian algebra. The latter permits nonunitary monodromy on the total space, provided the restriction to one fibre is a constant deformation of a unitary system. These two conclusions have different hypotheses, and neither can be applied to an arbitrary family or an arbitrary deformation of a unitary residual representation.

The packet covers exactly `HodgeStructuresPartII:H.4`. It extends the accepted parent design without modifying its H.0 development. Its twenty-nine declaration-sized nodes are a target-level plan. Every implementation status remains unchecked. All H.4 targets have statements and prerequisite chains; explicit requests and gaps keep the layer at **planned**, with the packet’s planning pass complete. The six planets are parabolic bundles, coparabolic bundles, the parabolic Clifford bound, the trace pairing rank bound, the sublocal-system rank bound, and Artinian deformation vanishing.

## Conventions and the ordinary curve boundary

Work over the complex numbers. In the bundle portion, C is a smooth proper connected curve, g is its genus, J is a finite set of distinct marked complex points, and D is their reduced sum. Write n for the cardinality of J and K for the canonical line bundle. A vector bundle is a finite locally free sheaf on the existing curve, and its ordinary degree is the degree of its determinant. The zero bundle has rank and degree zero. Rank of a vector space always means its finite complex dimension; all section spaces whose dimensions occur are finite by proper coherent cohomology. A rank of a sheaf morphism at the generic point and the dimension of the image of its map on global sections are different quantities.

Ordinary bundles, degree, fibres, coherent cohomology, canonical degree, saturated subbundles and elementary modifications belong to the curve foundations integrated by `SchemeAndStackFoundations:SF.3`. The integration starts from the existing AlgebraicCurves and JacobianChallenge developments. It does not reconstruct their divisors, line-bundle Riemann–Roch or classical Clifford theorem. The vector-bundle Riemann–Roch identity needed here is

h⁰(E) − h¹(E) = deg(E) + (1−g) rank(E).

It can be obtained from the line-bundle identity by a saturated line subbundle and induction, once the ordinary vector-bundle exact-sequence interfaces are supplied. Serre duality uses the exact nodes `SchemeAndStackFoundations:SF.2/serre-proper` and `SchemeAndStackFoundations:SF.2/smooth-proper`, specialized to a proper smooth curve and a finite locally free coefficient. The specialization must identify H¹(E) dual with H⁰(E∨⊗K); a formal dualizing object alone is not the final identification.

A saturated subbundle means that the ordinary quotient is locally free. On a regular curve, the kernel of a map into a torsion-free sheaf has this property. In contrast, an elementary modification can be locally free of the same rank as E while its inclusion into E has a torsion cokernel. Its map on the fibre at the modified point can fail to be injective. Every use of fibre intersections in this layer is made for a saturated subbundle, whereas the coparabolic zero lattice is an elementary modification. This distinction prevents a false identification of the coparabolic inclusion with the kind of subbundle used in the semistability test.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library coverage has no H.4 entry. Searches of the pinned Tau Ceti tree and the Mathlib tree did not find the parabolic bundle estimates or the vector-bundle Clifford theorem used here. Hits for Clifford algebras or Clifford theory of representations are different results. Native submodules, finite dimension, representations, subrepresentations, invariants, locally free sheaves, double-dual equivalence and power-series coefficients are reused. The baseline’s Grassmannian uses quotient rank. It does not supply the analytic Grassmannian tangent formula needed for the period derivative.

## Weighted flags, degrees and the coparabolic convention

At a marked point use a strictly decreasing flag F₀=E(x) ⊋ F₁ ⊋ ⋯ ⊋ F_m=0 and strictly increasing real weights 0≤α₀<⋯<α_{m−1}<1. The weight αᵢ belongs to Fᵢ/Fᵢ₊₁. Rank zero has the empty flag. Arbitrary real weights are allowed: restricting to rational weights would alter the source and the supplier statement. Transport of a flag means transport of its native complex subspaces; it does not change the weights or their graded multiplicities.

For a saturated subbundle, intersect with the ambient flag, remove repetitions, and retain the **maximum** weight among indices giving the same nonzero intersection. For a locally free quotient, map each ambient flag subspace to the quotient, remove repetitions and use the same maximum convention. In the two-dimensional flag with weights 0 and 3/4 and second subspace ℂe₂, the subline ℂe₂ and the quotient by ℂe₁ both have weight 3/4. A first-occurrence rule would incorrectly assign weight zero in both examples. The associated graded multiplicities fit the ordinary exact sequence, which makes the parabolic degree additive.

Parabolic degree is the real number

parDeg(E⋆) = deg(E) + Σⱼ Σᵢ αⱼᵢ dim(Fⱼᵢ/Fⱼᵢ₊₁).

For positive rank, divide by the rank to obtain the parabolic slope μ⋆. A total numerical interface assigns slope zero at rank zero; every slope theorem still guards the positive-rank objects it divides by. A bundle is semistable when every proper nonzero saturated subbundle, with its induced parabolic structure, has slope at most the ambient slope. This condition is equivalent to the reverse inequality on positive-rank induced quotients. Stable bundles satisfy the strict subbundle inequality, but the main bundle estimate requires only semistability. The direct sum of two trivial lines is an essential semistable test case.

The coparabolic zero lattice is formed only at marks whose minimum weight is zero. At such a mark, sections must have value in F₁. Equivalently it is the kernel of the map from E to the sum of the zero-weight graded fibre quotients. Locally, with parameter t, the weight-zero coordinate must be divisible by t, while positive-weight coordinates remain unrestricted. With all weights zero the result is E(−D); with positive minimum weight at every mark it is E itself. The ordinary degree loses the sum of the dimensions of the zero-weight graded pieces. Its **coparabolic** degree and slope are nevertheless those of the antecedent parabolic bundle E⋆. Using the ordinary degree of this modified lattice in the coparabolic slope would change the threshold in the theorem.

Normalized duality uses filtered internal Hom into the trivial parabolic line. Zero weight remains zero; a positive weight α becomes 1−α and its underlying dual lattice gains a negative elementary divisor at that mark. For a degree d line with one weight 1/4, the dual underlying degree is −d−1 and its weight is 3/4, so the dual parabolic degree is −d−1/4. Dualizing the ordinary line and changing only its weight fails this test. Consequently, after tensoring by K(D) and taking the coparabolic zero lattice, the normalized shifts at positive weights and the zero-weight modifications together give the ordinary bundle E∨⊗K. This canonical identification is the bridge to the section pairing.

For the canonical logarithmic extension of a unitary local system, the flags come from the normalized real residue eigenvalues, using generalized eigenspaces above each threshold. A residue α gives local monodromy exp(−2πiα). `HodgeStructuresPartII:H.2` owns the canonical extension and the comparison proving that this particular parabolic bundle has degree zero and is semistable. The abstract Mehta–Seshadri classification does not by itself identify the specific canonical extension. The requested comparison is the one identified in Landesman–Litt’s Remark 5.2.2.

## The bundle estimate and the section pairing

For a semistable nonzero parabolic bundle and an ordinary saturated U⊂Ē₀, set c=rank(E)−rank(U) and δ=h⁰(Ē₀)−h⁰(U). The two branches of the parabolic Clifford estimate are

- μ⋆(E⋆)>2g−2+n implies rank(E)+δ>g c;
- μ⋆(E⋆)=2g−2+n implies rank(E)+δ≥g c.

The section deficit δ is indispensable. Writing the conclusion with addition also prevents a truncated natural-number subtraction from silently weakening the inequality. Equality in the slope threshold never supplies strictness. The case U=Ē₀ gives c=δ=0, so the strict branch requires only that E be nonzero.

The proof first handles genus zero and one, then saturates the image generated by sections of U. For g≥2 it removes the initial Harder–Narasimhan segment whose slopes exceed 2g−2. Serre duality kills its H¹, so passing to the quotient preserves both c and δ. Semistability of the parabolic bundle bounds ordinary quotient slopes from below by μ⋆−n. Global generation bounds the remaining slopes of U from below by zero, and the choice of the initial segment bounds them above by 2g−2. Ordinary vector-bundle Clifford and Riemann–Roch now give the displayed inequality. The strict ordinary quotient slope gives its strict branch.

The vector Clifford input is BPGN97 Theorem 2.1: a semistable bundle of rank r and degree d with 0≤μ≤2g−2 has h⁰≤r+d/2. Its proof is induction on rank using a maximal-slope proper subbundle and the line-bundle Clifford theorem. Landesman–Litt’s auxiliary HN version permits all graded slopes in [0,2g]: higher slopes use H¹=0 and Riemann–Roch; lower slopes use vector Clifford. The ordinary HN existence, maximal-slope and Hom-vanishing interfaces and this vector Clifford statement have no exact supplier in the current curve scope. Gap G1 therefore proposes an Algebraic curves Part II development. The Fargues–Fontaine HN theory in VectorBundlesAndIsocrystals is not a complex proper-curve supplier.

The perfect line-valued trace pairing is

B_E : (E⊗K(D)) × (E∨⊗K) → K²(D).

It is ordinary evaluation followed by multiplication of the line factors. For a nonzero global section v, denote by μ_v the map on global sections u↦B_E(v,u), and let r be its image dimension. The generic sheaf kernel has corank one, and is saturated because the image is a torsion-free rank-one sheaf. It need not be surjective onto the target line at the zeros of v. Its global section deficit is exactly r by rank-nullity.

Apply the nonstrict parabolic Clifford estimate to E⋆∨⊗K(D), whose slope is 2g−2+n. Its coparabolic zero lattice is E∨⊗K. The corank-one kernel gives c=1 and δ=r, hence rank(E)+r≥g. This is the trace section rank bound. The perfect pairing requires no connection or stability hypothesis; only its application to the parabolic estimate introduces degree-zero semistability and a nonzero section.

## From the fixed part to the cohomology rank theorem

The family portion fixes nonnegative integers (g,n) with 2g−2+n>0. Let M be a connected complex variety, π:C→M a smooth proper family of geometrically connected genus g curves with n disjoint sections, and π° its punctured family. Versal means the classifying map M→M_g,n is dominant and étale. The marked-curve stack and this shared family interface are gap G3 until the common supplier specifies them. The dominant étale condition implies the needed smooth base and identifies the Kodaira–Spencer cotangent map with an isomorphism. A nonisotrivial family alone is not the stated hypothesis.

For V unitary on the total space C°, put H=R¹π°_*V. H.2 supplies the real admissible graded-polarizable VMHS on the cohomology of the realification of V, with weights one and two and types (1,0), (0,1), (1,1). H.3 supplies the trace/Kodaira–Spencer formula for the period derivative, with the section identification F¹H_m=H⁰(E⊗K(D)). The source’s Gr(s,r) parametrizes s-dimensional subspaces, while the native quotient Grassmannian would use quotient rank r−s. R09.1 supplies the universal subbundle/quotient and tangent Hom(S,Q) geometry, and H.3 imports its analytic comparison. No equality of derivative rank and section rank is asserted before the versal cotangent isomorphism is used.

For an irreducible nonzero sub-local system L⊂H, the fixed-part evaluation supplies a Hodge-homogeneous constant factor q and an image L′ isomorphic to L. A nonzero v in L′_m∩F¹H_m has contracted derivative rank at most rank(L)/2, after conjugation when necessary. In a single-type factor the derivative is zero; in the two-type factor it lands in the smaller Hodge quotient. The original inclusion of L need not contain this chosen homogeneous vector.

The author’s replacement proof also repairs an invalid realification identity. One must use W_R=R¹π°_*realification(V) and project its complexification to H. Realifying H minimally and taking cohomology of the realification of V are not generally identical: H can acquire a real structure that V lacks. The projection of the fixed-part evaluation remains nonzero because the original inclusion is among the evaluated constant homomorphisms. Irreducibility makes a nonzero restriction to a selected L factor injective.

Combining the derivative bound with rank(E)+r≥g gives rank(L)≥2g−2 rank(V). A general nonzero sub-local system contains an irreducible one by finite-dimensional monodromy, so it satisfies the same bound. For rank(V)<g, a nonzero invariant would give a rank-one trivial sub-local system, whereas the bound is at least two. Thus H⁰(M,H)=0.

The total-space unitarity and versality in this theorem matter. A constant family with constant coefficients has its entire H¹(C,ℂ) invariant, even at large genus. At g=3 and rank(V)=1, the theorem requires every nonzero sub-local system to have rank at least four. For smaller genus the numerical lower bound can be vacuous, but the hyperbolic marked-family setting is retained.

## Artinian vanishing and the change in hypotheses

Let A be a commutative Artin local complex algebra with identified residue field ℂ. Let V be a locally constant sheaf of finite-rank free A-modules on C°. Suppose at one fibre it is isomorphic to V₀⊗_ℂ A for a unitary complex local system V₀. This is a **constant deformation on that fibre**, a condition stronger than unitarity of the reduction modulo the maximal ideal. If rank_A(V)<g, the invariant A-module H⁰(M,R¹π°_*V) vanishes.

For nonzero V the rank hypothesis gives g≥2. The decomposition lemma, with its corrected g≥1 hypothesis, supplies after a dominant étale base change

V = ⊕ᵢ Uᵢ⊗π°*Wᵢ,

where Uᵢ are total-space unitary complex systems, their fibre restrictions are irreducible and pairwise nonisomorphic, and Wᵢ are free A-local systems on the base. Wᵢ can be identified with the pushforward of Hom(Uᵢ,V). This lemma uses finite-determinant extension of irreducible fibre representations and Schur evaluation. It is routed by PAPER-LANDESMAN-LITT-24 to MappingClassGroupsAndCanonicalRepresentations. That design has no stage ids in this checkout, so G2 records its precise output and proof inputs without inventing a supplier node.

Over ℂ, a nonzero invariant in (R¹π°_*U)⊗W gives a nonzero equivariant map W∨→R¹π°_*U. Apply the sub-local-system theorem to its image. This image can be smaller than W∨; injectivity is not needed. If a=rank(U) and b=rank(W) are positive, b≥2g−2a. For g≥2 this forces ab≥g: when a≥g it is immediate; when 1≤a<g use b≥2(g−a) and the endpoint minimum of 2a(g−a). Each isotypic factor of a low-rank V has ab≤rank_A(V)<g, so its residual invariant space is zero.

For general A, filter W by powers of its nilpotent maximal ideal. A-freeness identifies the graded quotients with a direct sum of copies of W⊗_Aℂ, tensored by the finite complex vector space m_A^k/m_A^{k+1}. The preceding bound kills each graded invariant space. Left exactness of invariants then kills the whole filtered module. Projection formula, finite direct sums and injectivity of pullback of invariant sections along the connected cover give the required vanishing on M. These coefficient and cohomology interfaces are requested from H.2.

A=ℂ is an included test, and A=ℂ[ε]/(ε²) gives two copies of the residual coefficient system in the filtration. Rank equal to g is outside the theorem’s conclusion. Nonconstant fibre deformations and merely unitary residual fibres are outside its hypotheses. No unitary metric on the entire A-system is imposed.

## Declaration inventory, API and tests

The entries below reproduce the packet’s mathematical declarations and direct inputs. Names refer to declarations, rather than executable code. Every construction has its canonical maps, relations and discriminating tests. Small proof steps remain in the proof outline at target granularity. The supplier boundary of the suggested signatures is stated after this inventory.

### Weighted decreasing fibre flags

**WeightedFlag** (definition). For a finite-dimensional complex vector space V, a weighted flag is an integer m≥0, a strictly decreasing filtration V=F₀⊋F₁⊋⋯⊋F_m=0 and weights α₀<⋯<α_{m−1} in [0,1). The weight αᵢ labels Fᵢ/Fᵢ₊₁. If V=0, m=0 and there are no weights. Isomorphisms transport subspaces and retain weights; this is a flag on the actual fibre, not a flag on its set of sections.

The construction or proof proceeds as follows.

1. Use finite families of native complex submodules; require the endpoints and strict inclusions.
2. Use real weights with the half-open normalization; quotient dimensions are dim Fᵢ−dim Fᵢ₊₁.

Direct inputs: `mathlib:Submodule`, `mathlib:Module.finrank`.

Source: LL22, §2.1, Definition 2.1.1, pp.10–11.

The reusable API is:

- **WeightedFlag.trivial** (constructor): For nonzero V and 0≤a<1, the single-step flag V⊋0 has weight a; zero V has the empty flag.
- **WeightedFlag.gradedRank** (data): The i-th graded rank is dim Fᵢ−dim Fᵢ₊₁.
- **WeightedFlag.gradedRank_sum** (relation): The sum of all graded ranks is dim V.
- **WeightedFlag.ext** (extensionality): Two flags with equal length, equal subspaces and equal weights are equal.
- **WeightedFlag.transport** (functoriality): A linear equivalence transports each flag subspace; weights and graded ranks are unchanged.

The unit tests are:

- **WeightedFlag.one_step_half** (computation): On V=ℂ with weight 1/2, the unique graded rank is 1 and its weighted contribution is 1/2.
- **WeightedFlag.zero_empty** (degenerate): The zero fibre has empty weights and total graded rank zero.
- **WeightedFlag.weight_one_excluded** (non-example): A purported one-step flag of weight 1 is excluded by α<1.
- **WeightedFlag.transport_native** (compatibility): Transport along the identity linear equivalence returns the native Submodule flag unchanged.

Uses: §2.1, Definition 2.1.1, pp.10–11: Weighted decreasing fibre flags supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Parabolic bundle on a marked complex curve

**ParabolicBundle** (definition). Fix a smooth proper connected complex curve C and a reduced divisor D=Σ_{j∈J}xⱼ with distinct points and finite J. A parabolic bundle E⋆ is a finite locally free O_C-module E of constant rank together with a WeightedFlag on each complex fibre E(xⱼ). The zero bundle has empty flags. No rationality assumption is imposed on the weights. Morphisms preserve the corresponding real-filtered lattices, equivalently each weight threshold; an arbitrary map of underlying bundles need not be parabolic.

The construction or proof proceeds as follows.

1. Import the ordinary bundle, degree and fibre functor from the curve foundations.
2. Attach the finite weighted flags; identify equivalent trivializations by transporting native fibre submodules.
3. The trivial parabolic structure has only weight zero; a residue with eigenvalues in [0,1) gives flags by sums of generalized eigenspaces with eigenvalue at least the threshold. Monodromy around a residue α is exp(−2πiα).

Direct inputs: `HodgeStructuresPartII:H.4/weighted-flag`, `SchemeAndStackFoundations:SF.3`, `mathlib:SheafOfModules.IsLocallyFree`, `HodgeStructuresPartII:H.2`.

Source: LL22, Definitions 2.1.1 and 3.3.1, pp.10–11 and 20.

The reusable API is:

- **ParabolicBundle.trivial** (constructor): Equip any E with its single weight-zero flags, or empty flags at rank zero.
- **ParabolicBundle.rank** (projection): The rank of E⋆ equals the ordinary rank of E.
- **ParabolicBundle.residueWeights** (compatibility): For the canonical extension, weights are the real normalized residue eigenvalues and the flag is the sum of generalized eigenspaces above each threshold.
- **ParabolicBundle.ext** (extensionality): An equality of underlying bundles and transported fibre flags determines equality of the parabolic structures.

The unit tests are:

- **ParabolicBundle.no_marks** (degenerate): When J is empty the parabolic data is exactly the ordinary bundle, with no extra weights.
- **ParabolicBundle.trivial_weights** (compatibility): Every weight of a nonzero trivial parabolic structure is zero.
- **ParabolicBundle.rank_two_weights** (computation): A rank-two fibre with distinct residue eigenvalues 0 and 1/3 has graded multiplicities 1 and 1 at those weights.
- **ParabolicBundle.residue_sign** (non-example): A rank-one residue 1/3 corresponds to monodromy exp(−2πi/3), excluding the opposite sign convention.

Uses: Definitions 2.1.1 and 3.3.1, pp.10–11 and 20: Parabolic bundle on a marked complex curve supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Induced parabolic subbundle

**inducedSubbundle** (construction). For a saturated ordinary subbundle F⊂E, intersect each fibre flag with F(xⱼ), remove repeated subspaces and give each retained nonzero step the largest original weight with that intersection. This yields F⋆. The zero subbundle has an empty flag. Saturated means the ordinary quotient is locally free on the regular curve; mere injectivity with torsion quotient does not supply this fibrewise construction.

The construction or proof proceeds as follows.

1. Pull back each native fibre subspace along the injective fibre map.
2. Compress equal consecutive intersections and take the maximum attached weight; retain endpoint zero only as an endpoint.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `mathlib:Submodule`.

Source: LL22, §2.3, pp.13–14.

The reusable API is:

- **inducedSubbundle.flag_comap** (characterisation): Before compression, the flag at x is the inverse image of the ambient flag under F(x)→E(x).
- **inducedSubbundle.repeated_max** (relation): Equal nonzero intersections receive the largest of their original weights.
- **inducedSubbundle.self** (simp): The induced structure on E⊂E is E⋆.
- **inducedSubbundle.trans** (functoriality): Inducing from E to F and then to G⊂F agrees with inducing directly from E to G.

The unit tests are:

- **inducedSubbundle.zero** (degenerate): The zero subbundle has rank and weighted contribution zero.
- **inducedSubbundle.high_weight_line** (computation): For flag ℂ²⊋ℂe₂⊋0 of weights 0 and 3/4, the induced flag on ℂe₂ has its single weight 3/4, not zero.
- **inducedSubbundle.low_weight_line** (computation): For the same flag the induced flag on ℂe₁ has its single weight zero.
- **inducedSubbundle.identity_native** (compatibility): Under the identity fibre map, every native Submodule in the flag is unchanged.

Uses: §2.3, pp.13–14: Induced parabolic subbundle supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Induced parabolic quotient

**inducedQuotient** (construction). For an ordinary locally free quotient q:E→Q with saturated kernel F, take at each marked point q(Fᵢ)= (Fᵢ+F(x))/F(x), remove repetitions and assign the maximum original weight to each retained nonzero step. This is the induced parabolic quotient Q⋆. Its graded multiplicities fit the exact sequence with those of F⋆ and E⋆, so parabolic degrees add.

The construction or proof proceeds as follows.

1. Map the fibre flags by the surjective native linear quotient map.
2. Compress repetitions with the same maximum-weight convention as for subbundles.
3. Exactness of the fibrewise associated gradeds gives degree additivity once ordinary degrees add.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/induced-subbundle`, `SchemeAndStackFoundations:SF.3`, `mathlib:Submodule`.

Source: LL22, §2.3, pp.13–14.

The reusable API is:

- **inducedQuotient.flag_map** (characterisation): Before compression, the quotient flag is the image of each ambient flag.
- **inducedQuotient.degree_add** (relation): For 0→F⋆→E⋆→Q⋆→0 induced from a saturated sequence, parDeg E⋆=parDeg F⋆+parDeg Q⋆.
- **inducedQuotient.identity** (simp): The quotient by the zero subbundle has the original parabolic structure.
- **inducedQuotient.trans** (functoriality): Successive locally free quotients give the same structure as the composite quotient.

The unit tests are:

- **inducedQuotient.zero** (degenerate): The zero quotient has no weights and degree zero.
- **inducedQuotient.kill_high** (computation): Quotienting flag ℂ²⊋ℂe₂⊋0 of weights 0,3/4 by ℂe₂ leaves a weight-zero line.
- **inducedQuotient.kill_low** (computation): Quotienting that flag by ℂe₁ leaves a line of weight 3/4, because repeated images use maximum weight.
- **inducedQuotient.native_map** (compatibility): The uncompressed fibre flag is precisely the native Submodule.map under q.

Uses: §2.3, pp.13–14: Induced parabolic quotient supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Real parabolic degree

**parabolicDegree** (definition). For E⋆ on (C,D), parDeg(E⋆)=deg(E)+ΣⱼΣᵢ αⱼᵢ dim(Fⱼᵢ/Fⱼᵢ₊₁), as a real number. The ordinary degree is the degree of det E, extended by deg(0)=0. Weights contribute with a plus sign. Coparabolic degree, when used, means the parabolic degree of its antecedent E⋆ and is not the degree of its zero lattice.

The construction or proof proceeds as follows.

1. Coerce the ordinary integer degree to the reals and sum the finite weighted graded dimensions.
2. The sum of graded dimensions at each mark equals rank E; exact sequences use induced flags.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `SchemeAndStackFoundations:SF.3`, `mathlib:Module.finrank`, `HodgeStructuresPartII:H.4/weighted-graded-rank-sum`.

Source: LL22, Definition 2.1.2, p.11; Definition 2.2.9, p.13.

The reusable API is:

- **parabolicDegree.trivial** (simp): The trivial parabolic structure has degree deg E.
- **parabolicDegree.bounds** (relation): For nonzero rank r, deg E≤parDeg E⋆<deg E+n r if n>0; if n=0 equality holds.
- **parabolicDegree.twist** (compatibility): Twisting by an ordinary line bundle L with trivial parabolic structure adds rank(E) deg L to parDeg.

The unit tests are:

- **parabolicDegree.line_quarter** (computation): An ordinary degree −1 line with one weight 1/4 has parabolic degree −3/4.
- **parabolicDegree.zero** (degenerate): The zero parabolic bundle has degree zero.
- **parabolicDegree.unmarked** (compatibility): Without marks, parabolic and ordinary degrees agree.
- **parabolicDegree.real_weights** (non-example): A degree-zero line with one weight √2/2 has real parabolic degree √2/2; rational weights are not required.

Uses: Definition 2.1.2, p.11; Definition 2.2.9, p.13: Real parabolic degree supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Parabolic slope with a nonzero-rank guard

**parabolicSlope** (definition). For positive rank r, μ⋆(E⋆)=parDeg(E⋆)/r. A total numerical interface assigns μ⋆(0)=0, but all assertions about slope comparisons in this layer require the relevant bundle or quotient to have positive rank. Coparabolic slope is μ⋆ of the antecedent parabolic bundle. It is not deg(Ē₀)/r.

The construction or proof proceeds as follows.

1. Divide the real parabolic degree by the positive integer rank.
2. Separate the zero-rank convention from every use of slope division.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-degree`.

Source: LL22, Definitions 2.1.2 and 2.2.9, pp.11 and 13.

The reusable API is:

- **parabolicSlope.mul_rank** (characterisation): For r>0, μ⋆(E⋆) r=parDeg(E⋆).
- **parabolicSlope.twist** (compatibility): For E≠0, μ⋆(E⋆⊗L)=μ⋆(E⋆)+deg L.
- **parabolicSlope.zero** (simp): The total numerical interface assigns slope zero at rank zero.

The unit tests are:

- **parabolicSlope.rank_two** (computation): An ordinary degree −1 rank-two bundle with weights 0 and 1/2 at one point has slope −1/4.
- **parabolicSlope.rank_zero** (degenerate): The zero-rank convention is zero and does not supply a nonzero quotient.
- **parabolicSlope.trivial_native** (compatibility): For positive rank and zero weights the slope is ordinary degree divided by rank.
- **parabolicSlope.coparabolic_distinct** (non-example): For a degree-zero line of weight zero at one point, coparabolic slope is zero although its zero lattice has ordinary degree −1.

Uses: Definitions 2.1.2 and 2.2.9, pp.11 and 13: Parabolic slope with a nonzero-rank guard supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Parabolic semistability

**IsParabolicallySemistable** (definition). E⋆ is parabolically semistable if every nonzero proper saturated ordinary subbundle F⊂E, equipped with the induced parabolic structure, satisfies μ⋆(F⋆)≤μ⋆(E⋆). Declare the zero object semistable. For positive rank, this is equivalent to every nonzero locally free induced quotient Q having μ⋆(Q⋆)≥μ⋆(E⋆). Coparabolic semistability is inherited from the antecedent parabolic bundle, including its degree convention. Strict stability uses < and proper nonzero subbundles; it is not required by the rank bound.

The construction or proof proceeds as follows.

1. Use the induced-subbundle construction in the slope inequality, retaining saturation.
2. Use degree and rank additivity to pass between subbundle and quotient inequalities.
3. Rank-one bundles have no proper positive-rank saturated subbundles.

Direct inputs: `HodgeStructuresPartII:H.4/induced-subbundle`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/parabolic-slope`, `HodgeStructuresPartII:H.4/parabolic-degree-add`.

Source: LL22, Definitions 2.4.1–2.4.2, p.14.

The reusable API is:

- **IsParabolicallySemistable.rank_one** (example): Every rank-one parabolic bundle is semistable.
- **IsParabolicallySemistable.quotient_iff** (characterisation): At positive rank, semistability is equivalent to the induced quotient slope inequality.
- **IsParabolicallySemistable.trivial_iff** (compatibility): For the trivial parabolic structure, parabolic semistability agrees with ordinary semistability.
- **IsParabolicallySemistable.iso** (functoriality): A parabolic bundle isomorphism preserves semistability.

The unit tests are:

- **IsParabolicallySemistable.zero** (degenerate): The zero parabolic bundle is semistable by convention.
- **IsParabolicallySemistable.line** (computation): A line of any degree and any allowed weights is semistable.
- **IsParabolicallySemistable.split_unstable** (non-example): With no marks, O(1)⊕O(−1) on ℙ¹ is not semistable: O(1) has slope 1>0.
- **IsParabolicallySemistable.strict_not_needed** (non-example): With no marks, O_C⊕O_C is semistable but not stable; it must remain eligible for the nonstrict Clifford bound.

Uses: Definitions 2.4.1–2.4.2, p.14: Parabolic semistability supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Coparabolic zero lattice

**coparabolicZero** (construction). For E⋆, let J₀ be the marks whose minimum weight is zero. Define Ē₀=ker(E→⊕_{j∈J₀}E(xⱼ)/Fⱼ₁), where Fⱼ₁ is the second flag subspace, or zero for a one-step flag. This is a locally free elementary modification of the same rank as E; its cokernel is supported at D and need not be locally free. It is the zero lattice of the right-continuous coparabolic filtration Ē_α=⋃_{β>α}E_β. Do not identify its inclusion with a saturated ordinary subbundle of E.

The construction or proof proceeds as follows.

1. Use fibre evaluation followed by quotient at exactly the zero-minimum-weight marks.
2. On a local coordinate t, the kernel consists of sections whose reduction modulo t lies in Fⱼ₁; this lattice is finite free of the same rank.
3. Glue kernels; its degree is deg E minus the sum of the zero-weight graded multiplicities.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `SchemeAndStackFoundations:SF.3`, `mathlib:PowerSeries.coeff`, `mathlib:Submodule`.

Source: LL24, §5.2.1, p.30, formula for Ē₀.

The reusable API is:

- **coparabolicZero.mem_local** (characterisation): In a local trivialization, a section lies in Ē₀ exactly when its value at each zero-weight mark lies in the second flag subspace.
- **coparabolicZero.rank** (compatibility): rank Ē₀=rank E.
- **coparabolicZero.degree** (relation): deg Ē₀=deg E−Σ_{j∈J₀}dim(E(xⱼ)/Fⱼ₁).
- **coparabolicZero.factor** (universal-property): A bundle map T→E factors uniquely through Ē₀ precisely when all the indicated residue-value quotient maps vanish.

The unit tests are:

- **coparabolicZero.trivial** (compatibility): For trivial parabolic structure Ē₀=E(−D); locally every component has zero constant coefficient.
- **coparabolicZero.positive** (computation): At a mark with all weights positive the zero lattice is the whole original lattice.
- **coparabolicZero.mixed** (computation): For weights 0 and 1/2 on a two-dimensional fibre, only the weight-zero coordinate must be divisible by t.
- **coparabolicZero.not_fibre_injective** (non-example): The inclusion tℂ[[t]]→ℂ[[t]] has zero induced fibre map at t=0, although the two lattices have the same rank.

Uses: §5.2.1, p.30, formula for Ē₀: Coparabolic zero lattice supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Normalized parabolic dual

**parabolicDual** (construction). The parabolic dual E⋆∨ is the parabolic internal Hom to O_C with trivial structure, using the real-filtered lattice convention E_{α+1}=E_α(−D). Its weights are 0 for an original zero weight and 1−α for an original positive weight α, with dual annihilator flags and order reversed. At a positive-weight graded factor the underlying dual lattice is shifted down by one divisor; dualizing just the ordinary bundle with reflected weights is wrong. Rank is preserved and parDeg(E⋆∨)=−parDeg(E⋆). Ordinary tensoring by L has weights unchanged and adds r deg L.

The construction or proof proceeds as follows.

1. Construct the filtered internal Hom as in LL22 Definition 2.2.3.
2. Use annihilators of the fibre flags and the periodic lattice relation to normalize weights into [0,1).
3. Check the local line models: α=0 gives the ordinary dual; α>0 gives E∨(−x) and weight 1−α. Glue and use determinant degree additivity.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`, `mathlib:Submodule`.

Source: LL22, Definition 2.2.3, pp.11–12; Lemma 6.3.3, p.40; LL24 proof of Proposition 5.2.3.

Source: LL24, Proof of Proposition 5.2.3, p.31.

The reusable API is:

- **parabolicDual.rank** (projection): The parabolic dual has the same rank as E⋆.
- **parabolicDual.degree** (relation): parDeg(E⋆∨)=−parDeg(E⋆).
- **parabolicDual.involutive** (equivalence): Double parabolic dual is canonically E⋆, preserving filtered lattices.
- **parabolicDual.weight** (characterisation): A graded weight α is sent to 0 if α=0 and to 1−α otherwise.

The unit tests are:

- **parabolicDual.zero_weight** (degenerate): An ordinary degree d line with a single zero weight has dual ordinary degree −d and weight zero.
- **parabolicDual.positive_line** (computation): A degree d line with a single weight 1/4 has dual degree −d−1 and weight 3/4.
- **parabolicDual.degree_test** (compatibility): For that line, dual parabolic degree equals −(d+1/4).
- **parabolicDual.no_weight_one** (non-example): Dualizing zero weight keeps zero and never creates weight one.

Uses: Definition 2.2.3, pp.11–12; Lemma 6.3.3, p.40; LL24 proof of Proposition 5.2.3: Normalized parabolic dual supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Twisted trace pairing

**tracePairing** (construction). For an ordinary vector bundle E on (C,D), define B_E:(E⊗K_C(D))×(E∨⊗K_C)→K_C²(D) by evaluation E⊗E∨→O_C followed by multiplication of the line factors. It is a perfect pairing valued in the line K_C²(D); perfection means E⊗K_C(D)≅Hom(E∨⊗K_C,K_C²(D)). It is defined without semistability or a flat connection.

The construction or proof proceeds as follows.

1. Use the ordinary finite locally free evaluation pairing and tensor multiplication of K_C and O_C(D).
2. Use the existing Module.evalEquiv in local trivializations for perfection; descend the basis-independent line-valued construction.

Direct inputs: `SchemeAndStackFoundations:SF.3`, `mathlib:SheafOfModules.IsLocallyFree`, `mathlib:Module.evalEquiv`.

Source: LL24, §5.2, equation (5.5), p.29.

The reusable API is:

- **tracePairing.eval** (simp): For local pure tensors e⊗η and f⊗θ, B_E(e⊗η,f⊗θ)=f(e)ηθ.
- **tracePairing.perfect** (equivalence): The adjoint identifies E⊗K_C(D) with Hom(E∨⊗K_C,K_C²(D)).
- **tracePairing.natural** (functoriality): A bundle isomorphism and its inverse dual preserve the pairing.

The unit tests are:

- **tracePairing.rank_one** (computation): In trivial rank-one coordinates, B(z,f)=f(z), hence B(1,id)=1.
- **tracePairing.zero** (degenerate): If E=0 the pairing is the zero map and the perfection isomorphism is between zero bundles.
- **tracePairing.native_eval** (compatibility): After trivializing both line factors, B_E equals native linear-dual evaluation.
- **tracePairing.off_diagonal** (non-example): For standard basis e₁,e₂ and dual e₁*,e₂*, B(e₁,e₂*)=0 while B(e₁,e₁*)=1.

Uses: §5.2, equation (5.5), p.29: Twisted trace pairing supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Section multiplication map at a vector

**traceSectionMap** (construction). For v∈H⁰(C,E⊗K_C(D)), let μ_v:H⁰(C,E∨⊗K_C)→H⁰(C,K_C²(D)) be u↦B_E(v,u). Its rank is dim_C im μ_v. This is the rank of a linear map on global sections, not the generic rank of the sheaf map. Its kernel is H⁰ of the sheaf kernel; when v≠0 that sheaf kernel is a saturated corank-one subbundle of E∨⊗K_C on the regular curve.

The construction or proof proceeds as follows.

1. Apply the trace pairing to sections and fix v to obtain the native complex linear map.
2. Left exactness of sections identifies its kernel.
3. For v≠0, the generic sheaf map is a nonzero functional; its image is torsion-free rank one, so its kernel is a saturated corank-one locally free subbundle. Do not assert surjectivity onto the target line at zeros of v.

Direct inputs: `HodgeStructuresPartII:H.4/trace-pairing`, `SchemeAndStackFoundations:SF.3`, `mathlib:LinearMap.range`, `mathlib:Module.finrank`, `HodgeStructuresPartII:H.4/trace-pairing-perfect`.

Source: LL24, Proposition 5.2.3 and proof, p.31.

The reusable API is:

- **traceSectionMap.apply** (simp): μ_v(u)=B_E(v,u).
- **traceSectionMap.linear** (structure): The association v↦μ_v is complex-linear.
- **traceSectionMap.kernel_sections** (characterisation): ker μ_v=H⁰(C,ker B_E(v,−)).

The unit tests are:

- **traceSectionMap.zero** (degenerate): At v=0 the section map has zero image and rank zero.
- **traceSectionMap.scalar** (compatibility): For a≠0, μ_{av}=aμ_v and its image rank equals that of μ_v.
- **traceSectionMap.rank_one_model** (computation): For scalar evaluation ℂ×ℂ→ℂ and v=1 the section map is the identity of rank one.
- **traceSectionMap.kernel_model** (non-example): For the pairing ℂ²×(ℂ²)∨→ℂ and v=e₁ the kernel is the one-dimensional annihilator; it is not the zero space.

Uses: Proposition 5.2.3 and proof, p.31: Section multiplication map at a vector supplies the input used in the parabolic rank argument.; LL24 §6.1 and §6.2: The construction must preserve the bundle rank and the section spaces used to prove the rank and vanishing bounds.


### Underlying coparabolic quotient slope bound

**ordinaryQuotientSlope** (theorem). Let E⋆ be nonzero parabolically semistable on (C,D), |D|=n. Every nonzero ordinary locally free quotient Q of Ē₀ satisfies μ(Q)≥μ⋆(E⋆)−n. For the ordinary underlying parabolic bundle E, the quotient inequality is strict when n>0: μ(Q)>μ⋆(E⋆)−n. Only the nonstrict coparabolic inequality is used in the Clifford proof.

The construction or proof proceeds as follows.

1. For quotients of E use induced quotient semistability and the strict upper bound parDeg Q⋆<deg Q+n rank Q when n>0.
2. For quotients of Ē₀ shift the filtered bundle by sufficiently small ε>0; it becomes a parabolic lattice whose slope converges to μ⋆(E⋆). Apply the ordinary parabolic inequality and take the limit.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-semistability`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/parabolic-degree-bounds`, `HodgeStructuresPartII:H.4/parabolic-quotient-criterion`.

Source: LL22, Lemma 6.3.4 and proof, pp.40–41.

Acceptance checks:

- With no marks, recover the standard quotient-slope criterion.
- For a trivial degree-zero line and one mark, Ē₀=O_C(−x) attains equality −1; replacing ≥ by > is false.


### Semistability under parabolic dual and ordinary twist

**dualTwistSemistable** (theorem). For nonzero parabolically semistable E⋆ and an ordinary line bundle L, E⋆∨⊗L is parabolically semistable of slope −μ⋆(E⋆)+deg L. In particular, if parDeg E⋆=0 and L=K_C(D), its slope is 2g−2+n. No upgrade from semistable to stable is made.

The construction or proof proceeds as follows.

1. Duality exchanges saturated induced subbundles and quotients and negates their slopes. Apply the quotient criterion.
2. Twist preserves the subbundle order and shifts every slope by deg L.
3. Use the imported formula deg K_C=2g−2 and deg D=n.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/parabolic-semistability`, `SchemeAndStackFoundations:SF.3`, `HodgeStructuresPartII:H.4/parabolic-twist-degree`, `HodgeStructuresPartII:H.4/parabolic-quotient-criterion`, `HodgeStructuresPartII:H.4/parabolic-dual-degree`.

Source: LL24, Proof of Proposition 5.2.3, p.31, corrected semistability; LL22 Lemma 6.3.3.

Acceptance checks:

- O_C⊕O_C with trivial flags remains semistable and is an admissible input; stability is not inferred.


### Coparabolic dual-twist identification

**coparabolicDualTwist** (comparison). For every E⋆ on (C,D), the zero lattice of the coparabolic bundle associated to E⋆∨⊗K_C(D) is canonically E∨⊗K_C, where E is the original ordinary underlying bundle. The isomorphism respects the inclusion into the normalized dual lattice tensored by K_C(D), and rank is unchanged.

The construction or proof proceeds as follows.

1. At original positive weights, the dual underlying lattice already has a −x shift, cancelled by the D twist.
2. At original zero weights, the dual zero weight remains zero and the coparabolic elementary modification supplies the −x shift.
3. Use annihilator flags to check the two complementary graded pieces and glue the natural identifications.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `SchemeAndStackFoundations:SF.3`, `HodgeStructuresPartII:H.4/coparabolic-rank`.

Source: LL24, Proof of Proposition 5.2.3, p.31.

Acceptance checks:

- Check separately a zero-weight line and a positive-weight line; both give E∨⊗K_C.


### Landesman–Litt parabolic Clifford rank estimate

**parabolicCliffordRank** (theorem). Let C be a smooth proper connected complex curve of genus g, D reduced of degree n, and E⋆≠0 parabolically semistable. For any ordinary saturated subbundle U⊂Ē₀, set c=rank E−rank U and δ=h⁰(Ē₀)−h⁰(U), both nonnegative integers. If μ⋆(E⋆)>2g−2+n, then rank E>g c−δ; if μ⋆(E⋆)=2g−2+n, then rank E≥g c−δ. Equivalently write rank E+δ>g c or ≥g c to avoid truncated natural subtraction. If Ē₀ is not generically globally generated and the slope inequality is strict, rank E≥g+1.

The construction or proof proceeds as follows.

1. For g=0 the inequalities are immediate. For g=1 use c≤rank E and δ≥0; the strict case with δ=0 follows from positive underlying slope and Riemann–Roch.
2. Replace U by the saturation of the image of its global sections. This retains h⁰(U) and increases c, so the new bound implies the original one.
3. Take the HN initial segment N of U with slopes >2g−2. Serre duality gives H¹(N)=0. Passing to V=Ē₀/N and U/N preserves c and δ.
4. Apply ordinaryQuotientSlope to obtain μ(V)≥2g−2, strictly in the strict case. The remaining HN slopes of U/N lie in [0,2g−2], using generic global generation.
5. Use vector-bundle Clifford: h⁰(W)≤deg(W)/2+rank W for semistable 0≤μ(W)≤2g−2; the HN version with slopes in [0,2g] follows by Riemann–Roch and H¹=0 on higher slopes. Combine with Riemann–Roch for V to obtain rank V+δ≥g c, with strictness at μ(V)>2g−2.
6. The vector HN/Clifford foundations are gap G1, not the existing line-bundle Clifford theorem. For the global generation consequence choose U as the saturated section image, giving δ=0 and c≥1.

Direct inputs: `HodgeStructuresPartII:H.4/ordinary-quotient-slope`, `HodgeStructuresPartII:H.4/parabolic-semistability`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.2/serre-proper`, `SchemeAndStackFoundations:SF.2/smooth-proper`, `HodgeStructuresPartII:H.4/coparabolic-rank`.

Source: LL22, Proposition 6.3.6 and entire proof, pp.41–43; Lemmas 6.2.1–6.2.3, pp.36–39.

Acceptance checks:

- The deficit δ must remain in both branches.
- With U=Ē₀, c=δ=0 and the strict assertion requires only rank E>0.
- When slope equals the threshold, no strict inequality is asserted.


### Rank bound from a nonzero trace section

**traceRankBound** (theorem). Let E⋆≠0 be parabolically semistable of parabolic degree zero on (C,D), with genus g. For nonzero v∈H⁰(C,E⊗K_C(D)), set r=dim im μ_v. Then rank E≥g−r, equivalently rank E+r≥g. The hypothesis is semistability, including strictly semistable bundles.

The construction or proof proceeds as follows.

1. Take F⋆=E⋆∨⊗K_C(D); dualTwistSemistable gives its semistability and slope 2g−2+n.
2. Use coparabolicDualTwist to identify its zero lattice with E∨⊗K_C.
3. The sheaf kernel U of B_E(v,−) is saturated corank one by traceSectionMap. Its section deficit equals dim im μ_v by rank-nullity, so c=1 and δ=r.
4. Apply the nonstrict branch of parabolicCliffordRank and retain semistability throughout.

Direct inputs: `HodgeStructuresPartII:H.4/dual-twist-semistable`, `HodgeStructuresPartII:H.4/coparabolic-dual-twist`, `HodgeStructuresPartII:H.4/trace-section-map`, `HodgeStructuresPartII:H.4/parabolic-clifford-rank`, `HodgeStructuresPartII:H.4/trace-kernel-sections`.

Source: LL24, Proposition 5.2.3 and proof, p.31.

Acceptance checks:

- The global-section rank r may be zero; the conclusion then reads rank E≥g.
- v=0 is excluded because its sheaf kernel does not have corank one.


### Fixed-part vector with small period derivative

**fixedPartVector** (theorem). In a punctured versal family π°:C°→M of hyperbolic (g,n)-curves over a connected complex variety with dominant étale classifying map, let V be a unitary complex local system on the total space, H=R¹π°_*V and L⊂H a nonzero irreducible sub-local system. At a point m, after possibly conjugating V and L, there is a sub-local system L′⊂H isomorphic to L and a nonzero v∈L′_m∩F¹H_m such that the map obtained by contracting the period derivative with v has rank at most rank L/2. The chosen vector need not lie in the original inclusion of L.

The construction or proof proceeds as follows.

1. Request H.2 for the admissible graded-polarizable real VMHS on R¹π°_* realification(V), with types (1,0),(0,1),(1,1), and its fixed-part evaluation on an irreducible factor.
2. Use the author correction: work with this real higher direct image itself, whose complexification contains H as a summand, rather than identifying it with the minimal realification of H.
3. Project the nonzero fixed-part evaluation Q⊗realification(L)→real higher direct image to H; the original inclusion ensures the projected evaluation is nonzero. Choose a Hodge-homogeneous constant q on a summand mapping nontrivially; irreducibility makes its restriction to L injective, giving L′.
4. If L has one Hodge type, its derivative is zero; if it has types (1,0),(0,1), conjugate so the (0,1) piece has dimension at most rank L/2. Horizontality and the constant q bound the contracted derivative by this dimension.

Direct inputs: `HodgeStructuresPartII:H.2`, `HodgeStructuresPartII:H.3`.

Source: LL24, Lemma 6.1.1 and proof, pp.33–34; author erratum, printed p.860.

Source: LL-ERRATA, P04 author erratum, printed p.860, full replacement proof of Lemma 6.1.1.

Acceptance checks:

- Record L′ as an isomorphic image, not equality with the original subspace L_m.
- Apply the real VMHS to realification(V) before taking cohomology; the two realification functors do not commute as claimed in the preprint.


### Rank bound for sub-local systems

**sublocalSystemRank** (theorem). Let π:C→M be a smooth proper family of n-pointed geometrically connected genus g complex curves with disjoint sections, where M is a connected complex variety and M→M_{g,n} is dominant étale; require 2g−2+n>0. Let π° be its punctured family and V a finite-rank unitary complex local system on C°. Every nonzero sub-local system L⊂R¹π°_*V satisfies rank L≥2g−2 rank V. In particular, if rank V<g, H⁰(M,R¹π°_*V)=0. Unitarity here is on the total space.

The construction or proof proceeds as follows.

1. Choose a nonzero irreducible subobject inside L using finite-dimensional monodromy; it suffices to bound that subobject.
2. Use fixedPartVector to obtain v and r≤rank L/2 after conjugation.
3. H.2 supplies the canonical parabolic bundle of V|C°_m, of degree zero and semistable. H.3 identifies the derivative rank with μ_v: versality makes the Kodaira–Spencer cotangent map an isomorphism, not merely a map.
4. Apply traceRankBound to obtain rank V≥g−r≥g−rank L/2, and rearrange.
5. A nonzero invariant vector gives a rank-one trivial sub-local system; the bound is at least two when rank V<g.

Direct inputs: `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/trace-rank-bound`, `HodgeStructuresPartII:H.2`, `HodgeStructuresPartII:H.3`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `mathlib:Subrepresentation`, `mathlib:Representation.invariants`.

Source: LL24, Theorem 1.7.1, p.6; full proof in §6.1, pp.32–34.

Acceptance checks:

- For g=3 and rank V=1 every nonzero sub-local system has rank≥4.
- For g=0 or 1 the rank conclusion can be vacuous; retain hyperbolicity of the marked family.
- An isotrivial family C×M with constant V=ℂ has invariant H¹(C,ℂ); it violates the low-rank vanishing for g≥2 and is excluded by versality.


### Tensor coefficient obstruction

**tensorInvariantRank** (theorem). In the same punctured versal setting, let U be a nonzero unitary complex local system on C° and W a nonzero complex local system on M. If H⁰(M,(R¹π°_*U)⊗W)≠0, put a=rank U≥1 and b=rank W≥1. Then b≥2g−2a. If g≥2, this implies a b≥g. Consequently if a b<g the indicated invariant space vanishes. W need not be unitary.

The construction or proof proceeds as follows.

1. An invariant tensor is a nonzero monodromy-equivariant map W∨→R¹π°_*U. Its image is a nonzero sub-local system of rank at most b; injectivity of the map is not required.
2. Apply sublocalSystemRank to its image to obtain b+2a≥2g.
3. For positive integers, if a≥g then ab≥g. If a<g, b≥2(g−a) and 2a(g−a)≥g for g≥2 (minimum at the endpoints).

Direct inputs: `HodgeStructuresPartII:H.4/sublocal-system-rank`, `mathlib:Representation`, `mathlib:Subrepresentation`, `mathlib:Module.finrank`.

Source: LL24, Proof of Theorem 6.2.1, p.34.

Acceptance checks:

- For g=2 the obstruction excludes a=b=1.
- For g=3, a=1 forces b≥4; a=2 forces b≥2.
- W may be nonunitary; no total unitarity is required for U⊗π°*W.


### Vanishing for fibre-constant Artinian unitary deformations

**artinianVanishing** (theorem). Let π°:C°→M be a punctured versal family as above. Let A be a commutative Artin local complex algebra with identified residue field ℂ, and V a locally constant sheaf of finite-rank free A-modules on C°. Suppose on one fibre C°_m there is a unitary complex local system V₀ and an A-linear local-system isomorphism V|C°_m≅V₀⊗_ℂ A. If rank_A V<g then H⁰(M,R¹π°_*V)=0 as an A-module. A=ℂ is included. A total-space unitary structure on V is not assumed; unitarity of the residual fibre alone does not replace the constant-deformation hypothesis.

The construction or proof proceeds as follows.

1. The zero-rank case is immediate. A nonzero input has g≥2.
2. Use the fibre-unitary decomposition of LL24 Lemma 2.4.2 after a dominant étale cover preserving a chosen fibre: V≅⊕ᵢ Uᵢ⊗π°*Wᵢ, where Uᵢ are total-space unitary with pairwise nonisomorphic irreducible fibres and Wᵢ are free A-local systems on the base. This is recorded as gap G2 until the routed mapping-class-group supplier has exact nodes.
3. Projection formula gives R¹π°_*(Uᵢ⊗π°*Wᵢ)≅(R¹π°_*Uᵢ)⊗Wᵢ. Each positive product rank Uᵢ rank_A Wᵢ≤rank_A V<g.
4. For A=ℂ apply tensorInvariantRank. For general A filter Wᵢ by powers of its nilpotent maximal ideal. Each graded quotient is a direct sum of copies of Wᵢ⊗_A ℂ because Wᵢ is A-free.
5. Every graded invariant space vanishes; left exactness of invariants inductively gives zero invariants for Wᵢ. Invariants pull back injectively along the connected dominant étale cover, so descend vanishing to M.

Direct inputs: `HodgeStructuresPartII:H.4/tensor-invariant-rank`, `HodgeStructuresPartII:H.2`, `mathlib:Representation.invariants`, `mathlib:Subrepresentation`.

Source: LL24, Theorem 6.2.1 and proof, p.34; Lemma 2.4.2, pp.19–20.

Acceptance checks:

- At A=ℂ recover the fibre-unitary vanishing theorem, still weaker in total-space unitarity than Theorem 1.7.1.
- For A=ℂ[ε]/(ε²), constant fibre deformation gives two successive copies of the residual W in its maximal-ideal filtration.
- At rank_A V=g the theorem makes no assertion.
- A nonconstant Artinian deformation of a unitary residual fibre is excluded.


### WeightedFlag — gradedRank_sum

**WeightedFlag.gradedRank_sum** (lemma). The sum of all graded ranks is dim V.

The construction or proof proceeds as follows.

1. Finite-dimensional subspace ranks decrease along the flag. Sum their successive differences; the endpoints have ranks dim V and zero. This is the weighted flag’s graded-dimension identity.

Direct inputs: `HodgeStructuresPartII:H.4/weighted-flag`, `mathlib:Module.finrank`.

Source: LL22, §2.1, Definition 2.1.1, pp.10–11.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### inducedQuotient — degree_add

**inducedQuotient.degree_add** (lemma). For 0→F⋆→E⋆→Q⋆→0 induced from a saturated sequence, parDeg E⋆=parDeg F⋆+parDeg Q⋆.

The construction or proof proceeds as follows.

1. Ordinary determinant degrees and ranks add in a saturated locally free exact sequence, supplied by SF.3.
2. At each weight threshold, intersect and map the fibre flag. The resulting associated graded sequence is exact at each original weight, with compressed repetitions using the maximum convention.
3. Add the weighted graded dimensions to the ordinary degree equality.

Direct inputs: `HodgeStructuresPartII:H.4/induced-subbundle`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`.

Source: LL22, §2.3, pp.13–14.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### parabolicDegree — bounds

**parabolicDegree.bounds** (lemma). For a parabolic bundle E⋆ of rank r>0, deg E≤parDeg E⋆. If n>0, parDeg E⋆<deg E+n r; if n=0, parDeg E⋆=deg E.

The construction or proof proceeds as follows.

1. Every graded multiplicity is nonnegative and its coefficient lies in [0,1).
2. At each mark the sum of graded multiplicities is r by weighted-graded-rank-sum, so the contribution is strictly below r for r>0. Sum over the n marks; at n=0 there is no contribution.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/weighted-graded-rank-sum`.

Source: LL22, Definition 2.1.2, p.11; Definition 2.2.9, p.13.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### parabolicDegree — twist

**parabolicDegree.twist** (lemma). Twisting by an ordinary line bundle L with trivial parabolic structure adds rank(E) deg L to parDeg.

The construction or proof proceeds as follows.

1. Ordinary tensoring with a line preserves each marked fibre flag up to its canonical fibre identification, hence preserves all weighted multiplicities.
2. Determinant degree increases by r deg L. Add the unchanged weight contribution.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`.

Source: LL22, Definition 2.1.2, p.11; Definition 2.2.9, p.13.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### IsParabolicallySemistable — quotient_iff

**IsParabolicallySemistable.quotient_iff** (lemma). At positive rank, semistability is equivalent to the induced quotient slope inequality.

The construction or proof proceeds as follows.

1. For an induced saturated sequence, use degree and rank additivity.
2. The inequality parDeg F/rank F≤parDeg E/rank E is equivalent, by multiplying the positive ranks, to parDeg E/rank E≤parDeg Q/rank Q.
3. Include the identity quotient as equality. Zero quotients are excluded from division.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-semistability`, `HodgeStructuresPartII:H.4/parabolic-degree-add`, `HodgeStructuresPartII:H.4/parabolic-slope`.

Source: LL22, Definitions 2.4.1–2.4.2, p.14.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### parabolicDual — degree

**parabolicDual.degree** (lemma). parDeg(E⋆∨)=−parDeg(E⋆).

The construction or proof proceeds as follows.

1. At weight zero, ordinary duality negates degree without a normalized divisor shift. At positive α with multiplicity m, normalization changes underlying dual degree by −m and supplies weight 1−α.
2. The net contribution at that factor is −m+(1−α)m=−αm. Add over the marked graded factors and use the negated determinant degree.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`.

Source: LL22, Definition 2.2.3, pp.11–12; Lemma 6.3.3, p.40; LL24 proof of Proposition 5.2.3.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### coparabolicZero — rank

**coparabolicZero.rank** (lemma). rank Ē₀=rank E.

The construction or proof proceeds as follows.

1. On the formal disc, choose a basis adapted to the zero-weight flag. Replace its zero-weight basis vectors by t times themselves and leave the other basis vectors unchanged.
2. This is a free lattice of the original rank. Rank is unchanged away from D; glue with the local elementary-modification comparison supplied by SF.3.

Direct inputs: `HodgeStructuresPartII:H.4/coparabolic-zero`, `SchemeAndStackFoundations:SF.3`.

Source: LL24, §5.2.1, p.30, formula for Ē₀.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### tracePairing — perfect

**tracePairing.perfect** (comparison). The adjoint identifies E⊗K_C(D) with Hom(E∨⊗K_C,K_C²(D)).

The construction or proof proceeds as follows.

1. In a local trivialization of E and both canonical line factors, use the existing Module.evalEquiv for the finite-dimensional evaluation pairing.
2. Tensor the dual relation by the line K²(D). The construction is basis-independent, so the local isomorphisms glue and produce the stated line-valued perfection.

Direct inputs: `HodgeStructuresPartII:H.4/trace-pairing`, `mathlib:Module.evalEquiv`, `SchemeAndStackFoundations:SF.3`.

Source: LL24, §5.2, equation (5.5), p.29.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


### traceSectionMap — kernel_sections

**traceSectionMap.kernel_sections** (lemma). ker μ_v=H⁰(C,ker B_E(v,−)).

The construction or proof proceeds as follows.

1. The section map is the global-section map of the sheaf morphism B_E(v,−).
2. Global sections preserve kernels by left exactness, so a global section maps to zero precisely when it is a section of the sheaf kernel. No surjectivity onto the target sheaf is required.

Direct inputs: `HodgeStructuresPartII:H.4/trace-section-map`, `SchemeAndStackFoundations:SF.3`.

Source: LL24, Proposition 5.2.3 and proof, p.31.

Acceptance checks:

- Compare with the parent construction and retain its rank, fibre and degree hypotheses; this API fact is a named dependency, not an additional independent object.


## Supplier requests and completion obligations

### Request 1 — SchemeAndStackFoundations:SF.3

Finite locally free bundles on a smooth proper connected complex curve; determinant degree, rank/degree additivity for saturated exact sequences, fibrewise injectivity for saturated subbundles, local elementary modifications and their length-degree formula. Coherent curve cohomology finiteness, genus h¹(O), deg K=2g−2, and vector-bundle Riemann–Roch h⁰(E)−h¹(E)=deg E+(1−g)rank E. Integrate the line-bundle route already owned by AlgebraicCurves/JacobianChallenge; do not equate line Clifford with vector Clifford.

Consumers: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/trace-pairing`, `HodgeStructuresPartII:H.4/trace-section-map`, `HodgeStructuresPartII:H.4/dual-twist-semistable`, `HodgeStructuresPartII:H.4/coparabolic-dual-twist`, `HodgeStructuresPartII:H.4/parabolic-clifford-rank`, `HodgeStructuresPartII:H.4/parabolic-degree-add`, `HodgeStructuresPartII:H.4/parabolic-twist-degree`, `HodgeStructuresPartII:H.4/parabolic-dual-degree`, `HodgeStructuresPartII:H.4/coparabolic-rank`, `HodgeStructuresPartII:H.4/trace-pairing-perfect`, `HodgeStructuresPartII:H.4/trace-kernel-sections`.

### Request 2 — HodgeStructuresPartII:H.2

Canonical extension on punctured complex curves with residues having real parts in [0,1), monodromy exp(−2πi Res), and the parabolic flags of Definition 3.3.1. For a unitary local system the canonical parabolic extension has parabolic degree zero and is semistable (LL24 Remark 5.2.2, Simpson 1990 Theorem 5); this comparison is not merely the abstract Mehta–Seshadri classification.

Consumers: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/sublocal-system-rank`.

### Request 3 — HodgeStructuresPartII:H.2

Admissible graded-polarizable real VMHS on R¹π°_* realification(V), weights 1 and 2 and types (1,0),(0,1),(1,1); Hodge–de Rham F¹=H⁰(E K(D)); fixed-part evaluation on irreducible local-system factors, constant Hodge-homogeneous evaluation and horizontality, with projection to the original complex cohomology summand. Use the author replacement proof of Lemma 6.1.1.

Consumers: `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/sublocal-system-rank`.

### Request 4 — HodgeStructuresPartII:H.2

For a punctured smooth proper family and locally constant finite free Artinian coefficients: R¹π°_* remains locally constant, coefficient tensor projection formula with base local systems, finite-direct-sum compatibility and faithful pullback of invariant sections along a connected dominant étale cover.

Consumers: `HodgeStructuresPartII:H.4/artinian-vanishing`.

### Request 5 — HodgeStructuresPartII:H.3

LL24 Theorem 5.1.6: the derivative dual at m is c_m* composed with the trace multiplication H⁰(E K(D))⊗H⁰(E∨ K)→H⁰(K²(D)); adjoint to Gauss–Manin contracted modulo F¹. For a dominant étale classifying map to M_g,n, c_m* is an isomorphism by Kodaira–Spencer/Serre duality, so section rank equals derivative rank.

Consumers: `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/sublocal-system-rank`.

### Request 6 — AlgebraicModuliForArithmeticGeometry:R09.1

Grassmannian subbundle-versus-quotient comparison, universal S,Q and tangent identification T_Gr≅Hom(S,Q), compatible with base change; the source Gr(s,r) uses subspace rank s, whereas native Module.Grassmannian uses quotient rank r−s. Analytification and holomorphic derivative compatibility are imported by H.3.

Consumers: `HodgeStructuresPartII:H.4/sublocal-system-rank`.

### G1 — Ordinary vector-bundle HN and Clifford foundations

The curve roadmap supplies line-bundle Riemann–Roch/Clifford, not the needed ordinary vector-bundle HN existence, saturated maximal-slope subbundles, semistable Hom vanishing, global-generation lower HN slope, or BPGN97 Theorem 2.1. The full primary Clifford induction was read: split a special semistable bundle by a maximal-slope proper subbundle and apply line Clifford by induction. These generic statements need an Algebraic curves Part II owner (proposal below), including the HN version h⁰(W)≤deg(W)/2+rank W for slopes in [0,2g]. Until it has stages/nodes, no invented supplier id is used.

### G2 — Fibre-unitary isotypic decomposition supplier

LL24 Lemma 2.4.2 with g≥1, after a dominant étale base change retaining a chosen fibre, supplies V≅⊕Uᵢ⊗π°*Wᵢ with total-space unitary Uᵢ and A-free Wᵢ. It uses finite-determinant irreducible fibre extensions (Corollary 2.3.5), Lemma 2.4.1(2), Schur evaluation and exact fundamental-group sequences. PAPER-LANDESMAN-LITT-24 routes this to MappingClassGroupsAndCanonicalRepresentations; no roadmap definition or exact stage/node exists in this checkout. Import its corrected statement once the design has supplied ids. Do not assume fibre unitarity implies total unitarity.

### G3 — Common versal marked-curve family interface

The generic moduli stack M_g,n and smooth punctured versal family, with dominant étale classifying map, hyperbolicity and injective pullback of monodromy invariants, need a common carrier shared with the routed mapping-class-group programme. Generic algebraic-stack foundations alone do not construct M_g,n. H.3 must name its Kodaira–Spencer comparison and smoothness assumptions on that carrier; this packet states the full mathematical hypotheses without inventing a private M_g,n.

### G4 — Global supplier carriers in suggested signatures

The suggested file elaborates native finite fibre flags, normalized numerical degree/slope, supplied subbundle-catalogue inequalities, local formal-disc coparabolic kernels, evaluation/section maps, numerical rank consequences and finite-filtration invariant vanishing. It omits unavailable global curve/sheaf, degree/cohomology, canonical extension, VMHS, versal-family and isotypic-decomposition carriers and hypotheses. Each affected declaration is explicitly mapped to its local or numerical portion; neither omitted geometry nor unitarity is replaced by an arbitrary proposition. Full supplier-based signatures and geometry-level tests remain necessary; successful elaboration is not a formalization of the global theorems.

The two exact duality nodes are plans, not baseline implementations. Once a supplier has a declaration matching the requested hypotheses and normalization, the consumer edge is replaced by that node id. Supplier proof closure is then reviewed with that supplier. Until then this packet claims neither closure nor a completed global Lean signature. G1 and G2 require supplier design decisions; G3 requires a shared marked-family interface; G4 requires full geometric signatures and their global comparison tests. None is an unlisted prerequisite.

## Suggested signatures and what elaboration checks

The suggested file uses individual pinned Mathlib modules. Its native WeightedFlag records the decreasing submodules, endpoints, strict steps, increasing real weights and the half-open range. Degree and slope use the finite weighted graded dimensions. Induced constructions use native fibre maps with separate injectivity and surjectivity data. The supplied subbundle catalogue is a parameter: an arbitrary catalogue is not a proof that all global saturated subbundles have been included. The ordinary degree is a supplied integer; its interpretation as a determinant degree needs the global curve comparison.

The coparabolic model is a submodule of the actual free formal-disc lattice over complex power series, specified by its constant coefficient condition. The evaluation pairing and section map are actual native linear maps, and the perfect local pairing reuses the existing double-dual equivalence. These tests can distinguish zero and positive weights, reversed residue sign, wrong dual lattice shifts and first-versus-last induced weight. The suggested Artinian theorem uses native representations and stable subrepresentations to prove invariant vanishing through a finite filtration. Identifying that filtration with the maximal-ideal filtration of the geometric coefficient system requires G2 and the H.2 request.

The named geometric theorems retain their arithmetic or linear-factorization portion where the global supplier types are absent. The file has an explicit completion inventory for every such declaration. A numerical slope identity is not a theorem of semistability preservation, a determinant-degree identity is not the canonical sheaf isomorphism, and a rank rearrangement is not the sub-local-system theorem without its family and unitarity hypotheses. Every packet API name and each labelled example occurs in the file; full global comparisons remain G4. No missing geometric condition is encoded as an opaque proposition. Elaboration checks the available signatures and native operations with unfinished proofs; it does not formalize the global assertions.

## Sources and version discipline

- **LL24**: Aaron Landesman and Daniel Litt, [Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4). arXiv:2205.15352v4, 23 February 2025; preprint page numbers. Version of record: Annals of Mathematics 199 (2024), 823–897. Accessed 2026-10-07. SHA-256: `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`. Read: Theorem 1.7.1 and Notation 1.10.1, pp.6 and 10–11; §2.4, pp.19–20, decomposition proof and cited extension route; §§4.1–4.2, pp.24–27, VMHS and fixed-part interfaces; §§5.1–5.2, pp.27–31, entire statements and proofs; §§6.1–6.2, pp.32–34, entire proofs; corrected by author erratum.
- **LL22**: Aaron Landesman and Daniel Litt, [Geometric local systems on very general curves and isomonodromy](https://arxiv.org/pdf/2202.00039v3). arXiv:2202.00039v3; preprint page numbers. Version of record: JAMS 37 (2024), 683–729. Accessed 2026-10-07. SHA-256: `4f291599d8259d8084677c9f4325cc4329e7460d246ff0b311aa739da45763ab`. Read: §§2.1–2.4, pp.10–14, all definitions and induced subquotient conventions; Definition 3.3.1, p.20, residue weights; §§6.2–6.3, pp.36–43, entire Clifford/HN and parabolic rank proofs.
- **BPGN97**: L. Brambila-Paz, I. Grzegorczyk and P. E. Newstead, [Geography of Brill-Noether loci for small slopes](https://arxiv.org/pdf/alg-geom/9511003v1). arXiv:alg-geom/9511003v1, 6 November 1995; J. Algebraic Geometry 6 (1997), 645–669 Accessed 2026-10-07. SHA-256: `49a54383e147457176491d81c822ea334504c8d16964e38fb7c5cdf155d03bf8`. Read: §1 curve and characteristic conventions; Theorem 2.1 and entire induction proof, preprint p.9; Riemann–Roch line, p.10.
- **LL-ERRATA**: Aaron Landesman and Daniel Litt; posted by Daniel Litt, [Author-posted errata: Canonical representations of surface groups and Geometric local systems](https://www.daniellitt.com/published-paper-reviews.html). Author erratum sections P04 and P05, accessed 7 October 2026. Audit/review text is not used as mathematical authority. Accessed 2026-10-07. SHA-256: `c382f55815ca3e6f01a3b1abf60d8d06161f8734876e9aaf887c5dc4143a6032`. Read: P04 author erratum: printed pp.844–845, Lemma 2.4.2; p.860 replacement proof of Lemma 6.1.1; P05 author erratum screened for corrections affecting §§2 and 6.2–6.3; none listed.
- **MATHLIB**: The Mathlib community, [Pinned Mathlib module and local-algebra source interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 Accessed 2026-10-07. Pinned source tree; no separately fetched artifact. Read: Submodule, finrank, range, Representation, Subrepresentation, invariants, locally free sheaves, evalEquiv, power series coefficients and the quotient-rank Grassmannian source statements; see baseline.declarations for exact files.

The author-posted **erratum** sections are used for corrected mathematics; the automated review and audit reproduced on that page are not used as mathematical authority. The published Annals landing page was accessible, but its full article was not served. No claim compares the public preprint with the full version of record. The LL22 proof misprints below are scoped to arXiv v3; the published JAMS proof was not collated. The packet records the actual versions and fingerprints read.

The following source issues determine the statements used here:

- **E-H4-1**, LL24, Proof of Proposition 5.2.3 and Remark 5.2.5, arXiv v4 p.31: Use parabolically semistable and coparabolically semistable in these two passages. Dualization and twisting of a semistable bundle preserve semistability, not necessarily stability. Proposition 5.2.4 needs only semistability; O⊕O shows the distinction. Correction status: Previously confirmed in PAPER-LANDESMAN-LITT-24/E12; no correction to this precise passage found in the P04 author erratum.
- **E-H4-2**, LL24, Lemma 6.1.1 statement, arXiv v4 p.33: The proof gives v in a Hodge-homogeneous evaluation image L′ isomorphic to L, or simply a nonzero v∈F¹H_m, which is all Theorem 1.7.1 needs. The evaluation q⊗L→H can select a different inclusion of the same irreducible factor; a non-Hodge-compatible original inclusion need not contain that Hodge-homogeneous vector. Correction status: Previously confirmed in PAPER-LANDESMAN-LITT-24/E13. The P04 author replacement proof at printed p.860 supplies the required evaluated vector, without restoring membership in the original inclusion.
- **E-H4-3**, LL24, Proof of Lemma 6.1.1, arXiv v4 p.33, displayed realification identity: Use W_R=R¹π°_* realification(V) and project its complexification to H, as in the author replacement proof. Do not identify it with the minimal realification of H. If V has no real structure but its cohomology does, the minimal realification of cohomology has a different rank from the cohomology of the realification. The fixed-part argument must be applied to the latter. Correction status: Daniel Litt P04 author erratum, printed p.860, replacement proof of Lemma 6.1.1.
- **E-H4-4**, LL24, Lemma 2.4.2, arXiv v4 p.19: Add g≥1 to the decomposition lemma. Its proof invokes Corollary 2.3.5 with that hypothesis. The present nonzero vanishing application has positive rank<g, hence g≥2. Correction status: Daniel Litt P04 author erratum, printed pp.844–845; previously PAPER-LANDESMAN-LITT-24/E10.
- **E-H4-5**, LL22, Proof of Proposition 6.3.6, arXiv v3 p.42: In the intermediate goal use rank(V/N_t)>gc−δ (and ≥gc−δ for the nonstrict branch). The stated proposition and final application on p.43 retain −δ; dropping it would be a stronger assertion not proved by Lemma 6.2.3. Correction status: new: no matching correction found in arXiv v3 or the P05 author erratum.
- **E-H4-6**, LL22, Proof of Proposition 6.3.6, arXiv v3 p.43: The nonnegative HN slope conclusion holds for all 1≤j≤s, especially the residual indices t<j≤s. The smallest HN slope is nonnegative by generic global generation; monotonicity gives every slope nonnegative. The printed range covers only the discarded initial segment. Correction status: new: no matching correction found in arXiv v3 or the P05 author erratum.

The relevant complete supporting proofs read in this pass are the parabolic quotient estimate, the HN/Clifford section inequalities, Proposition 6.3.6, the trace rank estimate, the fixed-part vector construction with its author replacement, the sub-local-system theorem, and the Artinian reduction. BPGN97’s Clifford induction was also read. Canonical extension semistability, general VMHS/fixed parts, analytic Grassmannian derivatives and the finite-determinant extension machinery terminate in the precise supplier requests or G2. They are not silently assumed to have been constructed here.

## Acceptance of the layer

A global implementation must preserve all of the following distinctions: real versus rational weights; maximum versus minimum weight under repeated intersections; ordinary versus coparabolic degree; zero versus positive normalized dual weights; section-map rank versus generic sheaf rank; semistability versus stability; a chosen inclusion versus an isomorphic evaluation image; the cohomology of a realification versus a minimal realification of cohomology; total unitarity versus a constant unitary deformation on a fibre; versality versus an arbitrary curve family; Artinian rank strictly below g versus rank equal to g.

The pass is complete at target level with twenty-nine nodes, forty-one API items, forty-four construction tests, six planets and ten checked baseline declarations. H.4 is planned, not closed. Completion of G1–G4 and the six supplier requests is the precise follow-up; the statements and routes already recorded must be retained, with exact supplier nodes substituted as they become available. The handoff note records the executed checks and the limits of Lean elaboration.
