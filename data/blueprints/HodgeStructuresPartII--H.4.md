# H.4 — Parabolic bounds and unitary deformation vanishing

This layer develops the parabolic vector-bundle estimate behind Landesman–Litt's rank theorem for the cohomology of a unitary local system on a versal family of curves. It then proves a different vanishing theorem with coefficients in a local Artinian algebra. The latter permits nonunitary monodromy on the total space, provided the restriction to one fibre is a constant deformation of a unitary system. These two conclusions have different hypotheses, and neither applies to an arbitrary family or to an arbitrary deformation of a unitary residual representation.

The packet covers exactly `HodgeStructuresPartII:H.4`. It extends the accepted parent design without modifying its H.0 development. Its 30 nodes are a target-level plan: 5 definitions, 7 constructions, 9 theorems, 1 comparison and 8 lemmas promoted from API items that other nodes use. Every implementation status remains unchecked. All H.4 targets have statements and prerequisite chains; 3 supplier requests and 6 recorded gaps keep the layer at **planned**, with the packet's planning pass complete. The six planets are parabolic bundles, coparabolic bundles, the parabolic Clifford bound, the trace pairing rank bound, the sub-local system rank bound and Artinian deformation vanishing.

The layer imports from the earlier parts of this roadmap rather than restating them. The Deligne canonical extension and its residue sign, the unitary curve variation of mixed Hodge structure and the fixed-part evaluation come from `HodgeStructuresPartII:H.2`. The trace pairing B_E with its global-section map μ_E and the trace formula for the derivative of the period map come from `HodgeStructuresPartII:H.3`; the section map μ_v at a fixed vector is this layer's. The moduli stack of pointed curves is the key definition `StableReductionPartII:key/moduli-curves`. What H.4 owns is the parabolic theory itself, the statement of the Mehta–Seshadri input for the canonical extension (its open-curve comparison is gap G6), the Clifford-type estimate and the two cohomological theorems.

## Conventions and the ordinary curve boundary

Work over the complex numbers. In the bundle portion, C is a smooth proper connected curve, g is its genus, J is a finite set of distinct marked complex points, and D is their reduced sum. Write n for the cardinality of J and K for the canonical line bundle. A vector bundle is a finite locally free sheaf on the curve, and its ordinary degree is the degree of its determinant. The zero bundle has rank and degree zero. The rank of a vector space always means its finite complex dimension; all section spaces whose dimensions occur are finite by proper coherent cohomology. The rank of a sheaf morphism at the generic point and the dimension of the image of its map on global sections are different quantities.

Ordinary bundles, degree, fibres, coherent cohomology, canonical degree, saturated subbundles, elementary modifications and the residue theorem for logarithmic connections belong to the curve foundations integrated by `SchemeAndStackFoundations:SF.3`. That integration starts from the AlgebraicCurves and JacobianChallenge developments. It does not reconstruct their divisors, line-bundle Riemann–Roch or classical Clifford theorem; those roadmaps plan them, and the libraries at the pinned baseline do not contain them. The vector-bundle Riemann–Roch identity needed here is

h⁰(E) − h¹(E) = deg(E) + (1−g) rank(E).

It follows from the line-bundle identity by a saturated line subbundle and induction, once the ordinary vector-bundle exact-sequence interfaces are supplied. Serre duality uses the exact nodes `SchemeAndStackFoundations:SF.2/serre-proper` and `SchemeAndStackFoundations:SF.2/smooth-proper`, specialized to a proper smooth curve and a finite locally free coefficient. The specialization must identify the dual of H¹(E) with H⁰(E∨⊗K); a formal dualizing object alone is not the final identification.

A saturated subbundle means that the ordinary quotient is locally free. On a regular curve, the kernel of a map into a torsion-free sheaf has this property. In contrast, an elementary modification can be locally free of the same rank as E while its inclusion into E has a torsion cokernel; its map on the fibre at the modified point can fail to be injective. Every use of fibre intersections in this layer is made for a saturated subbundle, whereas the coparabolic zero lattice is an elementary modification. This distinction prevents a false identification of the coparabolic inclusion with the kind of subbundle used in the semistability test.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library coverage has no entry for this roadmap, and no audited layer records parabolic bundles, the Mehta–Seshadri correspondence, Harder–Narasimhan filtrations of vector bundles on curves or the vector-bundle Clifford theorem as built. Searches of the pinned trees agree: hits for Clifford algebras or Clifford theory of representations are different results. Native submodules, finite rank, image submodules, representations, subrepresentations, invariants, locally free sheaves and power-series coefficients are reused.

## Weighted flags, degrees and the coparabolic convention

At a marked point use a strictly decreasing flag F₀=E(x) ⊋ F₁ ⊋ ⋯ ⊋ F_m=0 and strictly increasing real weights 0≤α₀<⋯<α_{m−1}<1. The weight αᵢ belongs to Fᵢ/Fᵢ₊₁ and is counted with the dimension of that quotient. Rank zero has the empty flag. Arbitrary real weights are allowed: restricting to rational weights would alter the source and the supplier statement. Transport of a flag means transport of its native complex subspaces; it changes neither the weights nor their graded multiplicities.

A parabolic bundle is equivalently a decreasing, left-continuous ℝ-filtration of E by locally free sheaves E_α with E₀=E and E_{α+1}=E_α(−D): for 0<α≤1, a section lies in E_α near xⱼ exactly when its value lies in the flag step of weight at least α (LL22 Example 2.2.4). The coparabolic filtration is the right-continuous hull Ê_α=⋃_{β>α}E_β. Parabolic morphisms are the bundle maps preserving every E_α.

For a saturated subbundle, intersect with the ambient flag, remove repetitions, and retain the **maximum** weight among indices giving the same nonzero intersection; equivalently the induced filtration is F∩E_α. For a locally free quotient, map each ambient flag subspace to the quotient, remove repetitions and use the same maximum convention. In the two-dimensional flag with weights 0 and 3/4 and second subspace ℂe₂, the subline ℂe₂ and the quotient by ℂe₁ both have weight 3/4. A first-occurrence (minimum) rule would assign weight zero in both examples and would break the additivity of the parabolic degree, which holds for the maximum rule because the associated graded multiplicities fit the ordinary exact sequence.

Parabolic degree is the real number

parDeg(E⋆) = deg(E) + Σⱼ Σᵢ αⱼᵢ dim(Fⱼᵢ/Fⱼᵢ₊₁).

For positive rank, divide by the rank to obtain the parabolic slope μ⋆. A total numerical interface assigns slope zero at rank zero; every slope theorem still guards the positive-rank objects it divides by. A bundle is semistable when every proper nonzero saturated subbundle, with its induced parabolic structure, has slope at most the ambient slope. This condition is equivalent to the reverse inequality on positive-rank induced quotients. Stable bundles satisfy the strict subbundle inequality, but the main bundle estimate requires only semistability. The direct sum of two trivial lines is an essential semistable test case.

The coparabolic zero lattice Ê₀ is formed only at marks whose minimum weight is zero. At such a mark, sections must have value in F₁. Equivalently it is the kernel of the map from E to the sum of the zero-weight graded fibre quotients, and it equals the coparabolic filtration at α=0. Locally, with parameter t, the weight-zero coordinate must be divisible by t, while positive-weight coordinates remain unrestricted. With all weights zero the result is E(−D); with positive minimum weight at every mark it is E itself. The ordinary degree loses the sum of the dimensions of the zero-weight graded pieces. Its **coparabolic** degree and slope are nevertheless those of the antecedent parabolic bundle E⋆. Using the ordinary degree of this modified lattice in the coparabolic slope would change the threshold in the theorem.

Normalized duality uses the filtered internal Hom into the trivial parabolic line; the dual's filtration is (E⋆∨)_α=(Ê_{−α})∨(−D) (LL22 Definition 2.6.1 and Lemma 2.6.2), so its underlying bundle is (Ê₀)∨(−D). Zero weight remains zero; a positive weight α becomes 1−α, and in that graded direction the underlying dual lattice is E∨ twisted by −x, which lowers the dual degree by the multiplicity. At a mark carrying both zero and positive weights the dual fibre is an extension: the subspace F₁∨⊗T*_x carries the weights 1−α on annihilator steps and the quotient (E(x)/F₁)∨ carries weight 0, so it is not the annihilator flag of E(x)∨. For a degree d line with one weight 1/4, the dual underlying degree is −d−1 and its weight is 3/4, so the dual parabolic degree is −d−1/4. Dualizing the ordinary line and changing only its weight fails this test. Twisting by an ordinary line bundle L keeps the flags and weights and adds rank(E)·deg L to the parabolic degree. Combining these descriptions, after twisting the dual by K(D) and taking the coparabolic zero lattice, the normalized shifts at positive weights and the zero-weight modifications together give the ordinary bundle E∨⊗K. This canonical identification is the bridge to the section pairing.

A logarithmic connection ∇ on E has a parabolic structure of its own: the weights at xⱼ are the fractional parts of the real parts of the residue eigenvalues, and the flag step of weight λ is the sum of the generalized eigenspaces for the eigenvalues η with Re η−⌊Re η⌋≥λ (LL22 Definition 3.3.1). On the Deligne canonical extension of a local system, owned by `HodgeStructuresPartII:H.2/canonical-extension`, the real parts already lie in [0,1); a residue α gives local monodromy exp(−2πiα) (`HodgeStructuresPartII:H.2/residue-monodromy`). For a unitary local system this layer states that the resulting parabolic bundle has parabolic degree zero and is semistable. The degree statement is the residue theorem deg E=−Σ tr Res and holds for every local system; semistability is Mehta and Seshadri's theorem, which needs unitarity. Mehta and Seshadri construct their parabolic bundle from a Fuchsian-group model, and its identification with the canonical extension, used by Landesman–Litt in their Remark 5.2.2, is recorded as gap G6.

## The bundle estimate and the section pairing

For a semistable nonzero parabolic bundle and an ordinary saturated U⊂Ê₀, set c=rank(E)−rank(U) and δ=h⁰(Ê₀)−h⁰(U). The two branches of the parabolic Clifford estimate are

- μ⋆(E⋆)>2g−2+n implies rank(E)+δ>g c;
- μ⋆(E⋆)=2g−2+n implies rank(E)+δ≥g c.

The section deficit δ is indispensable. Writing the conclusion with addition also prevents a truncated natural-number subtraction from silently weakening the inequality. Equality in the slope threshold never supplies strictness. The case U=Ê₀ gives c=δ=0, so the strict branch requires only that E be nonzero.

The proof first handles genus zero and one, then saturates the image generated by sections of U. For g≥2 it removes the initial Harder–Narasimhan segment whose slopes exceed 2g−2. Serre duality kills its H¹, so passing to the quotient preserves both c and δ. Semistability of the parabolic bundle bounds ordinary quotient slopes of Ê₀ from below by μ⋆−n. Generic global generation bounds the remaining slopes of U from below by zero, and the choice of the initial segment bounds them above by 2g−2. Ordinary vector-bundle Clifford and Riemann–Roch then give the displayed inequality, and the strict quotient slope gives its strict branch.

The vector Clifford input is BPGN97 Theorem 2.1: a semistable bundle of rank r and degree d with 0≤μ≤2g−2 has h⁰≤r+d/2. Its proof is induction on rank using a maximal-slope proper subbundle and the line-bundle Clifford theorem. Landesman–Litt's auxiliary Harder–Narasimhan version permits all graded slopes in [0,2g]: higher slopes use H¹=0 and Riemann–Roch; lower slopes use vector Clifford. Ordinary Harder–Narasimhan existence, maximal-slope subbundles, Hom vanishing, generic global generation and this vector Clifford statement have no exact supplier in the current curve scope. Gap G1 therefore proposes an Algebraic curves Part II development. The Fargues–Fontaine Harder–Narasimhan theory in VectorBundlesAndIsocrystals is not a complex proper-curve supplier.

The perfect line-valued trace pairing

B_E : (E⊗K(D)) × (E∨⊗K) → K²(D),

ordinary evaluation followed by multiplication of the line factors, is `HodgeStructuresPartII:H.3/trace-multiplication`; H.3 needs it for the derivative of the period map and owns it. For a nonzero global section v, the section map μ_v sends u to B_E(v,u), and r denotes the dimension of its image. Its sheaf kernel has corank one and is saturated because the image is a torsion-free rank-one sheaf; it need not be surjective onto the target line at the zeros of v. Its global section deficit is exactly r by rank-nullity.

Apply the nonstrict parabolic Clifford estimate to E⋆∨⊗K(D), whose slope is 2g−2+n when E⋆ has parabolic degree zero. Its coparabolic zero lattice is E∨⊗K. The corank-one kernel gives c=1 and δ=r, hence rank(E)+r≥g. This is the trace section rank bound. The pairing requires no connection or stability hypothesis; only its application to the parabolic estimate introduces degree-zero semistability and a nonzero section.

## From the fixed part to the cohomology rank theorem

The family portion fixes nonnegative integers (g,n) with 2g−2+n>0. Let M be a connected complex variety, π:C→M a smooth proper family of geometrically connected genus g curves with n disjoint sections, and π° its punctured family. Versal means the classifying map M→M_{g,n} to the moduli stack `StableReductionPartII:key/moduli-curves` is dominant and étale. The analytic realization of such a family, the deformation and cotangent dictionary for its classifying map and the homotopy exact sequence of the punctured family are gap G3. A nonisotrivial family alone is not the stated hypothesis.

For V unitary on the total space C°, put H=R¹π°_*V. H.2 supplies the real admissible graded-polarizable variation on the cohomology W_ℝ of the realification of V, with weights one and two and types (1,0), (0,1), (1,1), together with the fixed-part evaluation for an irreducible constituent (`HodgeStructuresPartII:H.2/unitary-curve-family`, `unitary-bigrading`, `irreducible-evaluation`). H.2 states admissibility, and hence the fixed part, under quasi-unipotent boundary monodromy; Landesman–Litt use it for every unitary V, and the difference is gap G5, carried from H.2's own gaps G6 and G15. H.3 supplies F¹H_m=H⁰(E⊗K(D)) and the trace formula: the dual of the derivative at m is c_m* composed with the section map of B_E, and c_m* is an isomorphism when the classifying map is étale (`HodgeStructuresPartII:H.3/curve-hodge-filtration`, `trace-period-derivative`, `trace-derivative-rank`). No equality of derivative rank and section rank is asserted before that cotangent isomorphism is used.

For an irreducible nonzero sub-local system L⊂H, the fixed-part evaluation supplies a Hodge-homogeneous constant factor q and an image L′ isomorphic to L. There is a nonzero v in L′_m∩F¹H_m whose contracted derivative has rank at most rank(L)/2, after conjugation when necessary. In a single-type factor the derivative is zero; in the two-type factor it lands in the smaller Hodge quotient. The original inclusion of L need not contain this chosen homogeneous vector.

The author's replacement proof also repairs an invalid realification identity. One must use W_ℝ=R¹π°_* of the realification of V and project its complexification to H. Realifying H minimally and taking cohomology of the realification of V are not generally the same: H can acquire a real structure that V lacks. The projection of the fixed-part evaluation remains nonzero because the original inclusion is among the evaluated constant homomorphisms, and irreducibility makes a nonzero restriction to a selected L factor injective.

On the fibre over m, the canonical extension of V with its parabolic structure is semistable of parabolic degree zero. Combining the derivative bound with rank(E)+r≥g gives rank(L)≥2g−2 rank(V). A general nonzero sub-local system contains an irreducible one by finite-dimensional monodromy, so it satisfies the same bound. For rank(V)<g, a nonzero invariant would give a rank-one trivial sub-local system, whereas the bound is at least two. Thus H⁰(M,H)=0.

The total-space unitarity and versality in this theorem matter. A constant family with constant coefficients has its entire H¹(C,ℂ) invariant, even at large genus. At g=3 and rank(V)=1, the theorem requires every nonzero sub-local system to have rank at least four. For smaller genus the numerical lower bound can be vacuous, but the hyperbolic marked-family setting is retained.

## Artinian vanishing and the change in hypotheses

Let A be a commutative Artin local complex algebra with identified residue field ℂ. Let V be a locally constant sheaf of finite-rank free A-modules on C°. Suppose at one fibre it is isomorphic to V₀⊗_ℂ A for a unitary complex local system V₀. This is a **constant deformation on that fibre**, a condition stronger than unitarity of the reduction modulo the maximal ideal. If rank_A(V)<g, the invariant A-module H⁰(M,R¹π°_*V) vanishes.

For nonzero V the rank hypothesis gives g≥2. The decomposition lemma, with its corrected g≥1 hypothesis, supplies after a dominant étale base change

V = ⊕ᵢ Uᵢ⊗π°*Wᵢ,

where the Uᵢ are total-space unitary complex systems whose fibre restrictions are irreducible and pairwise nonisomorphic, and the Wᵢ are free A-local systems on the base, identified with the pushforward of Hom(Uᵢ,V). This lemma uses finite-determinant extension of irreducible fibre representations and Schur evaluation. PAPER-LANDESMAN-LITT-24 routes it to MappingClassGroupsAndCanonicalRepresentations, whose design has no stage ids, so G2 records its precise output and proof inputs without inventing a supplier node.

Over ℂ, a nonzero invariant in (R¹π°_*U)⊗W gives a nonzero equivariant map W∨→R¹π°_*U. Apply the sub-local system theorem to its image; injectivity is not needed. If a=rank(U) and b=rank(W) are positive, b≥2g−2a. For g≥2 this forces ab≥g: when a≥g it is immediate; when 1≤a<g use b≥2(g−a) and the endpoint minimum of 2a(g−a). Each isotypic factor of a low-rank V has ab≤rank_A(V)<g, so its residual invariant space is zero.

For general A, filter W by powers of its nilpotent maximal ideal. A-freeness identifies the graded quotients with direct sums of copies of W⊗_Aℂ, indexed by a basis of m_A^k/m_A^{k+1}. The preceding bound kills each graded invariant space, and left exactness of invariants kills the whole filtered module. The projection formula and compatibility with finite direct sums for Artinian coefficients, the open H.2 request listed below, together with the elementary injectivity of pullback of invariant sections along the connected dominant étale cover, give the required vanishing on M.

A=ℂ is an included test, and A=ℂ[ε]/(ε²) gives two copies of the residual coefficient system in the filtration. Rank equal to g is outside the theorem's conclusion. Nonconstant fibre deformations and merely unitary residual fibres are outside its hypotheses. No unitary metric on the entire A-system is imposed.

## Declaration inventory, API and tests

The entries below reproduce the packet's mathematical declarations and their direct inputs. Names refer to proposed declarations, not to executable code. Every definition and construction carries its canonical maps, relations, recorded uses and discriminating unit tests; small proof steps stay in the proof outline at target granularity. The supplier boundary of the suggested signatures is stated after the inventory.

### Weighted decreasing fibre flags

**WeightedFlag** (definition). For a finite-dimensional complex vector space V, a weighted flag is an integer m≥0, a strictly decreasing filtration V=F₀⊋F₁⊋⋯⊋F_m=0 and weights α₀<⋯<α_{m−1} in [0,1). The weight αᵢ labels Fᵢ/Fᵢ₊₁. If V=0, m=0 and there are no weights. Isomorphisms transport subspaces and retain weights; this is a flag on the actual fibre, not a flag on its set of sections.

The construction or proof proceeds as follows.

1. Use finite families of native complex submodules; require the endpoints and strict inclusions.
2. Use real weights with the half-open normalization; quotient dimensions are dim Fᵢ−dim Fᵢ₊₁.

Direct inputs: `mathlib:Submodule`, `mathlib:Module.finrank`.

Sources:

- LL22, §2.1, Definition 2.1.1, pp.10–11: Defines a quasiparabolic structure as a strictly decreasing filtration of each marked fibre ending at zero, and a parabolic structure as adding strictly increasing weights in [0,1); the node is the fibrewise part of this.
- LL24, §5.2.1, p.30: Recalls the same decreasing fibre filtration with increasing weights in [0,1), confirming the conventions used in the rank argument.

The reusable API is:

- **WeightedFlag.trivial** (constructor): For nonzero V and 0≤a<1, the single-step flag V⊋0 has weight a; zero V has the empty flag.
- **WeightedFlag.gradedRank** (data): The i-th graded rank is dim Fᵢ−dim Fᵢ₊₁.
- **WeightedFlag.gradedRank_sum** (relation): The sum of all graded ranks is dim V. Planned as `HodgeStructuresPartII:H.4/weighted-graded-rank-sum`.
- **WeightedFlag.ext** (extensionality): Two flags with equal length, equal subspaces and equal weights are equal.
- **WeightedFlag.transport** (functoriality): A linear equivalence transports each flag subspace; weights and graded ranks are unchanged.
- **WeightedFlag.threshold** (data): For 0≤a<1, the part of weight at least a: the flag step F_β with β the least index whose weight is ≥a, and 0 if no weight is ≥a.
- **WeightedFlag.threshold_antitone** (structure): a≤b implies threshold b ⊆ threshold a, and threshold 0 is the whole space.
- **WeightedFlag.contribution** (data): The weighted contribution Σᵢ αᵢ·gradedRank i, a real number.
- **WeightedFlag.contribution_le** (relation): If every weight is at most a then the contribution is at most a·dim V; in particular the contribution is below dim V when V≠0 (LL22 Lemma 6.3.3).

The unit tests are:

- **WeightedFlag.one_step_half** (computation): On V=ℂ with weight 1/2, the unique graded rank is 1 and its weighted contribution is 1/2.
- **WeightedFlag.zero_empty** (degenerate): The zero fibre has empty weights and total graded rank zero.
- **WeightedFlag.weight_one_excluded** (non-example): A purported one-step flag of weight 1 is excluded by α<1.
- **WeightedFlag.transport_native** (compatibility): Transport along the identity linear equivalence returns the native Submodule flag unchanged.
- **WeightedFlag.two_step_contribution** (computation): On ℂ²⊋ℂe₂⊋0 with weights 1/4<1/2 the graded ranks are 1 and 1 and the weighted contribution is 3/4 (weighting dim Fᵢ instead of dim Fᵢ/Fᵢ₊₁ would give 1).
- **WeightedFlag.multiplicity** (computation): On ℂ²⊋0 with the single weight 1/3 the graded rank is 2 and the weighted contribution is 2/3 (counting each weight once would give 1/3).
- **WeightedFlag.not_increasing** (non-example): No weighted flag on ℂ² has two steps with weights 1/2 and then 0: weights must increase along the decreasing flag.

Uses:

- LL22 Definition 2.1.2, p.11: the graded dimensions dim(Eⱼⁱ/Eⱼⁱ⁺¹), each multiplied by its weight, form the correction term of the parabolic degree.
- LL22 §2.3, pp.13–14; LL24 §5.2.1, p.30: induced sub- and quotient structures intersect (resp. push) the flag into the fibre of the subbundle (resp. quotient), delete repeated steps and keep the largest weight.
- LL22 Lemma 6.3.3 and proof, p.40: the normalised graded dimensions at a point sum to one, which bounds the weight contribution per point by the maximal weight.
- LL24 §5.2.1, p.30 (packet node coparabolic-zero): at marks whose first weight is zero, the second flag step Eⱼ² is the target of the elementary modification defining Ê₀.

Acceptance checks:

- On ℂ²⊋ℂe₂⊋0 with weights 1/4<1/2 the contribution is 3/4, not 1.
- The sum of graded ranks is dim V and the contribution is strictly below dim V for V≠0.

### Parabolic bundle on a marked complex curve

**ParabolicBundle** (definition). Fix a smooth proper connected complex curve C and a reduced divisor D=Σ_{j∈J}xⱼ with distinct points and finite J. A parabolic bundle E⋆ is a finite locally free O_C-module E of constant rank together with a WeightedFlag on each complex fibre E(xⱼ). The zero bundle has empty flags. No rationality assumption is imposed on the weights. Morphisms preserve the corresponding real-filtered lattices, equivalently each weight threshold; an arbitrary map of underlying bundles need not be parabolic.

The construction or proof proceeds as follows.

1. Import the ordinary bundle, degree and fibre functor from the curve foundations.
2. Attach the finite weighted flags; identify equivalent trivializations by transporting native fibre submodules.
3. The trivial parabolic structure has the single weight zero at every mark. The parabolic structure attached to a logarithmic connection, in particular to a canonical extension, is the separate construction HodgeStructuresPartII:H.4/connection-parabolic-structure.

Direct inputs: `HodgeStructuresPartII:H.4/weighted-flag`, `SchemeAndStackFoundations:SF.3`, `mathlib:SheafOfModules.IsLocallyFree`.

Sources:

- LL22, Definition 2.1.1, pp.10–11: A parabolic bundle is a vector bundle with, at each marked point, a strictly decreasing fibre filtration and strictly increasing weights in [0,1); this is the node's data.
- LL22, Examples 2.2.4 and 2.2.6, p.12: Turns the flag data into a left-continuous ℝ-filtered sheaf with E_{α+1}=E_α(−D), and defines the trivial structure as the one-step flag with weight zero; fixes the morphism and filtration conventions.
- LL22, Definition 3.3.1, p.20: Weights from a logarithmic connection are fractional parts of real parts of residue eigenvalues; flag steps are sums of generalized eigenspaces above each threshold. Source of the residue compatibility item.
- LL24, §5.2.1, p.30: Restates the same parabolic bundle data and conventions in the form used for Proposition 5.2.3.

The reusable API is:

- **ParabolicBundle.trivial** (constructor): Equip any E with its single weight-zero flags, or empty flags at rank zero.
- **ParabolicBundle.rank** (projection): The rank of E⋆ equals the ordinary rank of E.
- **ParabolicBundle.residueWeights** (compatibility): For a logarithmic connection, in particular the canonical extension, the parabolic structure is HodgeStructuresPartII:H.4/connection-parabolic-structure: weights are the normalized real parts of the residue eigenvalues and the flag is the sum of generalized eigenspaces above each threshold. Planned as `HodgeStructuresPartII:H.4/connection-parabolic-structure`.
- **ParabolicBundle.ext** (extensionality): An equality of underlying bundles and transported fibre flags determines equality of the parabolic structures.
- **ParabolicBundle.markedFlag** (projection): For j∈J, the WeightedFlag on the fibre E(xⱼ).
- **ParabolicBundle.toBundle** (projection): The underlying ordinary vector bundle E; ordinaryDegree is deg det E.
- **ParabolicBundle.filtration** (data): The decreasing left-continuous ℝ-filtration E_α of LL22 Example 2.2.4: for 0≤α≤1, near xⱼ the sections whose value lies in the flag step of weight at least α (E_1=E(−D)), extended by E_{α+1}=E_α(−D).
- **ParabolicBundle.filtration_zero** (simp): E_0=E.
- **ParabolicBundle.filtration_add_one** (relation): E_{α+1}=E_α(−D) for every real α.
- **ParabolicBundle.filtration_antitone** (structure): α≤β implies E_β⊆E_α.
- **ParabolicBundle.filtration_mem** (characterisation): For 0≤α≤1, a local section near xⱼ lies in E_α exactly when its value at xⱼ lies in the threshold step of weight ≥α of the flag.
- **ParabolicBundle.ext_filtration** (extensionality): Two parabolic structures on the same E with the same filtration are equal: the weights are the jumps in [0,1) and the flags are the fibre images of the E_α.
- **ParabolicBundle.Hom** (data): Parabolic morphisms E⋆→F⋆: bundle maps f with f(E_α)⊆F_α for every α; equivalently at each xⱼ the fibre map sends the threshold step of weight ≥a into that of F for 0≤a<1 (LL22 Definition 2.2.3, Remark 2.2.5).
- **ParabolicBundle.Hom.comp** (functoriality): Identity maps are parabolic and composites of parabolic morphisms are parabolic.
- **ParabolicBundle.Hom.ofTrivial** (compatibility): Every ordinary map V→E is a parabolic morphism from V with the trivial structure to E⋆ (LL22 Remark 2.2.7).
- **ParabolicBundle.directSum** (constructor): E⋆⊕F⋆ with (E⊕F)_α=E_α⊕F_α; at xⱼ its weight-λ graded piece is the sum of the weight-λ graded pieces.
- **ParabolicBundle.exists_adapted_frame** (characterisation): Near each xⱼ there is a local frame whose values at xⱼ span every flag step; locally E⋆ is a direct sum of parabolic line bundles.

The unit tests are:

- **ParabolicBundle.no_marks** (degenerate): When J is empty the parabolic data is exactly the ordinary bundle, with no extra weights.
- **ParabolicBundle.trivial_weights** (compatibility): Every weight of a nonzero trivial parabolic structure is zero.
- **ParabolicBundle.rank_two_weights** (computation): For the diagonal residue with eigenvalues 0 and 1/3 in the frame e₁,e₂, the flag is E_x⊋ℂe₂⊋0 with weights 0 and 1/3 and graded multiplicities 1 and 1; the deep step is the 1/3-eigenline, not ℂe₁.
- **ParabolicBundle.residue_sign** (non-example): For a rank-one residue 1/3, continuing a flat section once counter-clockwise around x multiplies it by exp(−2πi/3), not exp(2πi/3) (the sign of HodgeStructuresPartII:H.2/residue-monodromy).
- **ParabolicBundle.trivial_filtration** (compatibility): For the trivial structure, E_α=E(−⌈α⌉D) for all real α; in particular E_{1/2}=E(−D) and the coparabolic zero lattice is E(−D).

Uses:

- LL24 proof of Theorem 1.7.1, p.32: the residues of the Deligne canonical extension of V restricted to a fibre make E a parabolic bundle (LL22 Def 3.3.1), which Mehta–Seshadri shows is semistable of parabolic degree zero.
- LL24 Proposition 5.2.3, p.31 (packet node trace-rank-bound): the hypothesis is a semistable parabolic bundle of parabolic degree zero, and the pairing B_E is formed on its underlying bundle E.
- LL22 Proposition 6.3.6, pp.41–42; LL24 Proposition 5.2.4, p.31 (packet node parabolic-clifford-rank): the Clifford-type rank inequality is stated for a nonzero parabolic bundle whose coparabolic bundle is semistable, with U inside Ê₀.

Acceptance checks:

- The trivial structure on E has E_α=E(−⌈α⌉D) and coparabolic zero lattice E(−D).
- For residue diag(0,1/3) the structure is E_x⊋(1/3-eigenline)⊋0 with weights 0<1/3, and parDeg=deg E+1/3.

### Induced parabolic subbundle

**inducedSubbundle** (construction). For a saturated ordinary subbundle F⊂E, intersect each fibre flag with F(xⱼ), remove repeated subspaces and give each retained nonzero step the largest original weight with that intersection. This yields F⋆. The zero subbundle has an empty flag. Saturated means the ordinary quotient is locally free on the regular curve; mere injectivity with torsion quotient does not supply this fibrewise construction.

The construction or proof proceeds as follows.

1. Pull back each native fibre subspace along the injective fibre map.
2. Compress equal consecutive intersections and take the maximum attached weight; retain endpoint zero only as an endpoint.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `mathlib:Submodule`.

Sources:

- LL22, §2.3, p.13: Gives the induced structure on a subbundle: intersect the fibre flag with the subbundle fibre, delete repetitions, and attach to each step the largest weight among the ambient steps cutting it out.
- LL24, §5.2.1, p.30: Repeats the same intersection-and-maximum rule and uses it in the definition of parabolic semistability.

The reusable API is:

- **inducedSubbundle.flag_comap** (characterisation): Before compression, the flag at x is the inverse image of the ambient flag under F(x)→E(x).
- **inducedSubbundle.repeated_max** (relation): Equal nonzero intersections receive the largest of their original weights.
- **inducedSubbundle.self** (simp): The induced structure on E⊂E is E⋆.
- **inducedSubbundle.trans** (functoriality): Inducing from E to F and then to G⊂F agrees with inducing directly from E to G.
- **inducedSubbundle.rank** (projection): rank F⋆=rank F, and the inclusion F⋆→E⋆ is a parabolic morphism.
- **inducedSubbundle.filtration_eq_inf** (characterisation): For a saturated F⊂E, the induced filtration is (F⋆)_α=F∩E_α for every real α; this is equivalent to the maximum-weight rule.

The unit tests are:

- **inducedSubbundle.zero** (degenerate): The zero subbundle has rank and weighted contribution zero.
- **inducedSubbundle.high_weight_line** (computation): For flag ℂ²⊋ℂe₂⊋0 of weights 0 and 3/4, the induced flag on ℂe₂ has its single weight 3/4, not zero.
- **inducedSubbundle.low_weight_line** (computation): For the same flag the induced flag on ℂe₁ has its single weight zero.
- **inducedSubbundle.identity_native** (compatibility): Under the identity fibre map, every native Submodule in the flag is unchanged.
- **inducedSubbundle.induced_two_dim** (computation): For ℂ³⊋⟨e₂,e₃⟩⊋⟨e₃⟩⊋0 with weights 0,1/3,2/3 and F=⟨e₁+e₂,e₃⟩, the induced flag is F⊋⟨e₃⟩⊋0 with weights 0 and 2/3 (the minimum rule would give 0 and 1/3).

Uses:

- LL22 Definition 2.4.1, p.14; LL24 §5.2.1, p.30: semistability compares μ⋆ of every subbundle with this induced structure against μ⋆(E⋆).
- LL22 Lemma 2.4.5, p.14: with the induced quotient structure, parDeg is additive along 0→F⋆→E⋆→Q⋆→0, turning the subbundle criterion into the quotient criterion.
- LL24 proof of Proposition 5.2.3, p.31 (packet node dual-twist-semistable): saturated subbundles of (E⋆)^∨⊗ω_C(D), with induced structure, are duals of induced quotients of E⋆ twisted by ω_C(D); their slopes give semistability.

Acceptance checks:

- In R4 (ℂ³ flag, F=⟨e₁+e₂,e₃⟩) the induced weights are 0 and 2/3.
- (F⋆)_α=F∩E_α for all α.

### Induced parabolic quotient

**inducedQuotient** (construction). For an ordinary locally free quotient q:E→Q with saturated kernel F, take at each marked point xⱼ the images q(Eⱼⁱ)=(Eⱼⁱ+F(xⱼ))/F(xⱼ) of the flag steps, remove repetitions and assign the maximum original weight to each retained nonzero step. This is the induced parabolic quotient Q⋆. Its graded multiplicities fit the exact sequence with those of F⋆ and E⋆, so parabolic degrees add.

The construction or proof proceeds as follows.

1. Map the fibre flags by the surjective native linear quotient map.
2. Compress repetitions with the same maximum-weight convention as for subbundles.
3. Exactness of the fibrewise associated gradeds gives degree additivity once ordinary degrees add.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/induced-subbundle`, `SchemeAndStackFoundations:SF.3`, `mathlib:Submodule`.

Sources:

- LL22, §2.3, pp.13–14: Gives the induced structure on a quotient: push each flag step to the quotient fibre, delete repetitions, and attach the largest ambient weight producing each step.
- LL22, Lemma 2.4.5, p.14: States that parabolic degree is additive for a subbundle with induced structure and the corresponding quotient, the property the node records.

The reusable API is:

- **inducedQuotient.flag_map** (characterisation): Before compression, the quotient flag is the image of each ambient flag.
- **inducedQuotient.degree_add** (relation): For 0→F⋆→E⋆→Q⋆→0 induced from a saturated sequence, parDeg E⋆=parDeg F⋆+parDeg Q⋆. Planned as `HodgeStructuresPartII:H.4/parabolic-degree-add`.
- **inducedQuotient.identity** (simp): The quotient by the zero subbundle has the original parabolic structure.
- **inducedQuotient.trans** (functoriality): Successive locally free quotients give the same structure as the composite quotient.
- **inducedQuotient.rank_add** (relation): rank E=rank F+rank Q for the induced sequence.
- **inducedQuotient.filtration_eq_map** (characterisation): For a locally free quotient q:E→Q with saturated kernel, the induced filtration is (Q⋆)_α=q(E_α) for every real α.

The unit tests are:

- **inducedQuotient.zero** (degenerate): The zero quotient has no weights and degree zero.
- **inducedQuotient.kill_high** (computation): Quotienting flag ℂ²⊋ℂe₂⊋0 of weights 0,3/4 by ℂe₂ leaves a weight-zero line.
- **inducedQuotient.kill_low** (computation): Quotienting that flag by ℂe₁ leaves a line of weight 3/4, because repeated images use maximum weight.
- **inducedQuotient.native_map** (compatibility): The uncompressed fibre flag is precisely the native Submodule.map under q.
- **inducedQuotient.induced_two_dim** (computation): For ℂ³⊋⟨e₂,e₃⟩⊋⟨e₃⟩⊋0 with weights 0,1/3,2/3 and kernel F=⟨e₁+e₂,e₃⟩, the one-dimensional quotient has weight 1/3; with the induced weights 0,2/3 on F the contributions add to the ambient 1 (under the minimum rule they would not).

Uses:

- LL22 Lemma 2.4.5, p.14: parDeg is additive along the induced sequence, so semistability is equivalent to μ⋆(E⋆)≤μ⋆(Q⋆) for all nonzero quotients.
- LL22 Lemma 6.3.4 and proof, pp.40–41 (packet node ordinary-quotient-slope): an ordinary quotient Q of V (or the image Q_ε of W[ε]_0) is given the induced quotient structure; its μ⋆ is at least μ⋆(V⋆) and Lemma 6.3.3 bounds μ⋆(Q⋆)−μ(Q) by n.
- packet node dual-twist-semistable (LL24 proof of Proposition 5.2.3, p.31): subbundles of the dual twist correspond to induced quotients of E⋆, so the quotient criterion yields its semistability.

Acceptance checks:

- In R4 the quotient weight is 1/3 and 0+2/3+1/3 equals the ambient contribution 1.
- (Q⋆)_α=q(E_α) for all α.

### Real parabolic degree

**parabolicDegree** (definition). For E⋆ on (C,D), parDeg(E⋆)=deg(E)+ΣⱼΣᵢ αⱼᵢ dim(Fⱼᵢ/Fⱼᵢ₊₁), as a real number. The ordinary degree is the degree of det E, extended by deg(0)=0. Weights contribute with a plus sign. Coparabolic degree, when used, means the parabolic degree of its antecedent E⋆ and is not the degree of its zero lattice.

The construction or proof proceeds as follows.

1. Coerce the ordinary integer degree to the reals and sum the finite weighted graded dimensions.
2. The sum of graded dimensions at each mark equals rank E; exact sequences use induced flags.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `SchemeAndStackFoundations:SF.3`, `mathlib:Module.finrank`, `HodgeStructuresPartII:H.4/weighted-graded-rank-sum`.

Sources:

- LL22, Definition 2.1.2, p.11: Defines parabolic degree as the ordinary degree plus, at every mark, each weight times the dimension of its graded piece, and slope as degree over rank.
- LL22, Definition 2.2.9, p.13: Defines the coparabolic degree and slope of Ê⋆ to be those of the parabolic bundle E⋆, which is the coparabolic convention the node fixes.
- LL24, §5.2.1, p.30: Restates the same parabolic degree formula used in Proposition 5.2.3.

The reusable API is:

- **parabolicDegree.trivial** (simp): The trivial parabolic structure has degree deg E.
- **parabolicDegree.bounds** (relation): For nonzero rank r, deg E≤parDeg E⋆<deg E+n r if n>0; if n=0 equality holds. Planned as `HodgeStructuresPartII:H.4/parabolic-degree-bounds`.
- **parabolicDegree.twist** (compatibility): Twisting by an ordinary line bundle L with trivial parabolic structure adds rank(E) deg L to parDeg. Planned as `HodgeStructuresPartII:H.4/parabolic-twist-degree`.
- **parabolicDegree.eq_deg_add_contribution** (characterisation): parDeg E⋆=deg E+Σⱼ contribution of the flag at xⱼ.
- **parabolicDegree.directSum** (relation): parDeg(E⋆⊕F⋆)=parDeg E⋆+parDeg F⋆.
- **ParabolicBundle.shift** (constructor): For 0<ε<1 the shifted parabolic bundle E[ε]⋆ with E[ε]_α=E_{α+ε} (LL22 Example 2.2.2); its underlying bundle is E_ε.
- **parabolicDegree.shift** (relation): For 0<ε<1, parDeg E[ε]⋆=parDeg E⋆−ε·n·rank E: each of the n marks lowers the degree by ε·rank E.
- **coparabolicDegree** (data): The coparabolic degree of Ê⋆ is parDeg E⋆ by definition (LL22 Definition 2.2.9), not the degree of Ê₀.

The unit tests are:

- **parabolicDegree.line_quarter** (computation): An ordinary degree −1 line with one weight 1/4 has parabolic degree −3/4.
- **parabolicDegree.zero** (degenerate): The zero parabolic bundle has degree zero.
- **parabolicDegree.unmarked** (compatibility): Without marks, parabolic and ordinary degrees agree.
- **parabolicDegree.real_weights** (non-example): A degree-zero line with one weight √2/2 has real parabolic degree √2/2; rational weights are not required.
- **parabolicDegree.rank_two_multiplicity** (computation): A degree-0 rank-two bundle with the one-step flag E_x⊋0 of weight 1/3 at one mark has parabolic degree 2/3 (counting the weight once gives 1/3).
- **parabolicDegree.two_weights** (computation): A degree-0 rank-two bundle with flag E_x⊋ℓ⊋0 and weights 1/4<1/2 has parabolic degree 3/4 (weighting the dimension of the flag step instead of the graded piece gives 1).
- **parabolicDegree.coparabolic_not_zero_lattice** (non-example): For the trivial structure on a rank-r degree-d bundle with n marks, the coparabolic degree is d while the ordinary degree of the coparabolic zero lattice E(−D) is d−nr.

Uses:

- LL24 Proposition 5.2.3, p.31 (packet node trace-rank-bound): the hypothesis parDeg E⋆=0 makes the dual twist (E⋆)^∨⊗ω_C(D) have slope exactly 2g−2+n, the boundary case of Proposition 5.2.4(II).
- LL22 Lemma 6.3.3, p.40 (packet node parabolic-degree-bounds): μ⋆(W⋆)−μ(W) is the weighted graded sum divided by rank, hence at most n times the largest weight.
- LL22 Lemma 2.6.5, p.15 (packet nodes parabolic-dual-degree, parabolic-twist-degree): parabolic degree is negated by the parabolic dual and is additive in the expected way under parabolic tensor product.
- LL22 Definition 2.2.9, p.13; LL24 Remark 5.2.5, p.31: coparabolic degree and slope are by definition those of the antecedent parabolic bundle.

Acceptance checks:

- A degree-0 rank-two bundle with weights 1/4<1/2 at one mark has parDeg 3/4; with the single weight 1/3 of multiplicity two it has parDeg 2/3.
- deg E ≤ parDeg E⋆ ≤ deg E + n·rank E·α_max, with equality on the right iff every weight equals α_max (LL22 Lemma 6.3.3).

### Parabolic slope with a nonzero-rank guard

**parabolicSlope** (definition). For positive rank r, μ⋆(E⋆)=parDeg(E⋆)/r. A total numerical interface assigns μ⋆(0)=0, but all assertions about slope comparisons in this layer require the relevant bundle or quotient to have positive rank. Coparabolic slope is μ⋆ of the antecedent parabolic bundle. It is not deg(Ē₀)/r.

The construction or proof proceeds as follows.

1. Divide the real parabolic degree by the positive integer rank.
2. Separate the zero-rank convention from every use of slope division.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-degree`.

Sources:

- LL22, Definition 2.1.2, p.11: Defines the parabolic slope as parabolic degree divided by rank.
- LL22, Definition 2.2.9, p.13: Sets the coparabolic slope equal to the parabolic slope of the antecedent bundle, the convention the node states.
- LL24, Remark 5.2.5, p.31: Notes that μ⋆(E⋆) and μ⋆(Ê⋆) coincide by definition when comparing Proposition 5.2.4 with the LL22 coparabolic formulation.

The reusable API is:

- **parabolicSlope.mul_rank** (characterisation): For r>0, μ⋆(E⋆) r=parDeg(E⋆).
- **parabolicSlope.twist** (compatibility): For E≠0, μ⋆(E⋆⊗L)=μ⋆(E⋆)+deg L.
- **parabolicSlope.zero** (simp): The total numerical interface assigns slope zero at rank zero.
- **parabolicSlope.dual** (relation): For positive rank, μ⋆(E⋆∨)=−μ⋆(E⋆).
- **parabolicSlope.shift** (relation): For 0<ε<1 and positive rank, μ⋆(E[ε]⋆)=μ⋆(E⋆)−nε.
- **parabolicSlope.sub_ordinary_lt** (relation): For positive rank, 0≤μ⋆(E⋆)−μ(E), and μ⋆(E⋆)−μ(E)<n when n>0 (LL22 Lemma 6.3.3 and the proof of Lemma 6.3.4).

The unit tests are:

- **parabolicSlope.rank_two** (computation): An ordinary degree −1 rank-two bundle with weights 0 and 1/2 at one point has slope −1/4.
- **parabolicSlope.rank_zero** (degenerate): The zero-rank convention is zero and does not supply a nonzero quotient.
- **parabolicSlope.trivial_native** (compatibility): For positive rank and zero weights the slope is ordinary degree divided by rank.
- **parabolicSlope.coparabolic_distinct** (non-example): For a degree-zero line of weight zero at one point, coparabolic slope is zero although its zero lattice has ordinary degree −1.
- **parabolicSlope.dual_twist_canonical** (computation): With two marks, the degree −1 line with weight 1/2 at both marks has μ⋆=0; its parabolic dual is the degree −1 line with weights 1/2,1/2, and the twist by K_C(D) has μ⋆=2g=2g−2+n (dualizing only the ordinary line, of degree 1, with reflected weights would give 2g+2).

Uses:

- LL22 Proposition 6.3.6 (I),(II), p.41; LL24 Proposition 5.2.4, p.31 (packet node parabolic-clifford-rank): whether μ⋆ exceeds or equals 2g−2+n selects the strict or the nonstrict rank inequality.
- LL22 Lemma 6.3.4, pp.40–41 (packet node ordinary-quotient-slope): a semistable (co)parabolic bundle of slope r+n has every ordinary quotient of slope at least r.
- LL24 proof of Proposition 5.2.3, p.31 (packet node dual-twist-semistable): since μ⋆(E⋆)=0, the dual twist by ω_C(D) has slope 2g−2+n.

Acceptance checks:

- For a degree −1 rank-two bundle with weights 0,1/2 at one mark, μ⋆=−1/4.
- μ⋆(E⋆^∨⊗L)=−μ⋆(E⋆)+deg L for positive rank.

### Parabolic semistability

**IsParabolicallySemistable** (definition). E⋆ is parabolically semistable if every nonzero proper saturated ordinary subbundle F⊂E, equipped with the induced parabolic structure, satisfies μ⋆(F⋆)≤μ⋆(E⋆). Declare the zero object semistable. For positive rank, this is equivalent to every nonzero locally free induced quotient Q having μ⋆(Q⋆)≥μ⋆(E⋆). Coparabolic semistability is inherited from the antecedent parabolic bundle, including its degree convention. Strict stability uses < and proper nonzero subbundles; it is not required by the rank bound.

The construction or proof proceeds as follows.

1. Use the induced-subbundle construction in the slope inequality, retaining saturation.
2. Use degree and rank additivity to pass between subbundle and quotient inequalities.
3. Rank-one bundles have no proper positive-rank saturated subbundles.

Direct inputs: `HodgeStructuresPartII:H.4/induced-subbundle`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/parabolic-slope`, `HodgeStructuresPartII:H.4/parabolic-degree-add`.

Sources:

- LL22, Definitions 2.4.1–2.4.2, p.14: Defines parabolic (semi)stability by comparing slopes of all subbundles with induced structure to the ambient slope, and coparabolic semistability through the antecedent parabolic bundle.
- LL22, Lemma 2.4.5, p.14: Shows semistability is equivalently tested on quotient bundles with induced structure, the characterisation listed in the node.
- LL24, §5.2.1, p.30: Restates parabolic semistability with the induced-subbundle maximum rule in the form used for Proposition 5.2.3.

The reusable API is:

- **IsParabolicallySemistable.rank_one** (example): Every rank-one parabolic bundle is semistable.
- **IsParabolicallySemistable.quotient_iff** (characterisation): At positive rank, semistability is equivalent to the induced quotient slope inequality. Planned as `HodgeStructuresPartII:H.4/parabolic-quotient-criterion`.
- **IsParabolicallySemistable.trivial_iff** (compatibility): For the trivial parabolic structure, parabolic semistability agrees with ordinary semistability.
- **IsParabolicallySemistable.iso** (functoriality): A parabolic bundle isomorphism preserves semistability.
- **IsParabolicallySemistable.slope_le** (projection): If E⋆ is semistable and F⊂E is a proper nonzero saturated subbundle, μ⋆(F⋆)≤μ⋆(E⋆).
- **IsParabolicallySemistable.dual_iff** (relation): E⋆∨ is semistable iff E⋆ is: saturated subbundles of the dual are the duals of induced quotients, with negated slopes.
- **IsParabolicallySemistable.directSum** (relation): If E⋆ and F⋆ are semistable of the same slope, E⋆⊕F⋆ is semistable of that slope.
- **IsCoparabolicallySemistable** (compatibility): Ê⋆ is coparabolically semistable iff E⋆ is parabolically semistable (LL22 Definition 2.4.2); no separate test on subsheaves of Ê₀ is made.

The unit tests are:

- **IsParabolicallySemistable.zero** (degenerate): The zero parabolic bundle is semistable by convention.
- **IsParabolicallySemistable.line** (computation): A line of any degree and any allowed weights is semistable.
- **IsParabolicallySemistable.split_unstable** (non-example): With no marks, O(1)⊕O(−1) on ℙ¹ is not semistable: O(1) has slope 1>0.
- **IsParabolicallySemistable.strict_not_needed** (non-example): With no marks, O_C⊕O_C is semistable but not stable; it must remain eligible for the nonstrict Clifford bound.
- **IsParabolicallySemistable.weight_destabilises** (non-example): On ℙ¹ with one mark, O⊕O with flag E_x⊋ℂe₂⊋0 (e₂ a constant frame vector) and weights 0,1/2 is not parabolically semistable: the constant line O·e₂ has induced weight 1/2 and μ⋆=1/2>1/4. The minimum-weight rule and ordinary semistability both wrongly accept it.
- **IsParabolicallySemistable.weights_stabilise** (computation): On ℙ¹ with three marks, O⊕O(−1) with flag E_x⊋O(−1)_x⊋0 and weights 0,1/3 at each mark is parabolically semistable of parabolic slope 0 (O⊕0 and 0⊕O(−1) both have μ⋆=0, every other line subbundle less), although O⊕O(−1) is not semistable as a vector bundle.
- **IsParabolicallySemistable.small_sub_allowed** (computation): With no marks, O⊕O on ℙ¹ is semistable although its saturated subbundle O(−1)→O⊕O, (s,t) a basis of H⁰(O(1)), has smaller slope; this catches the reversed inequality.

Uses:

- LL24 proof of Theorem 1.7.1, p.32; Remark 5.2.2, p.30: the parabolic bundle of the Deligne extension of a unitary local system is semistable (sum of stable bundles, Mehta–Seshadri/Simpson), the input to Proposition 5.2.3.
- LL24 proof of Proposition 5.2.3, p.31 (corrected to semistable; packet node dual-twist-semistable): the dual twist (E⋆)^∨⊗ω_C(D) of a semistable E⋆ is semistable, which is the hypothesis of Proposition 5.2.4(II).
- LL22 Definition 2.4.2, p.14 and Lemma 6.3.4, pp.40–41 (packet node ordinary-quotient-slope): coparabolic semistability means the antecedent is semistable; then every ordinary quotient of Ê₀ has slope at least μ⋆−n.

Acceptance checks:

- R5 (O⊕O on ℙ¹, weights 0,1/2 with a constant deep line) is not semistable.
- R6 (O⊕O(−1) on ℙ¹, three marks, weights 0,1/3) is semistable of slope 0 although the underlying bundle is unstable.

### Parabolic structure of a logarithmic connection

**ParabolicBundle.ofLogConnection** (construction). Let C be a smooth proper connected complex curve, D=Σ_{j∈J}xⱼ a reduced divisor, E a vector bundle on C and ∇:E→E⊗Ω¹_C(log D) a connection with logarithmic poles along D. For a residue eigenvalue η of Res_{xⱼ}∇∈End E(xⱼ) put λ(η)=Re η−⌊Re η⌋∈[0,1). The parabolic bundle E⋆^∇ has underlying bundle E; at xⱼ its weights are the distinct values λ(η) in increasing order, and the flag step of weight λ is the sum of the generalized eigenspaces of Res_{xⱼ}∇ for the eigenvalues η with λ(η)≥λ. The graded multiplicity at λ is the total algebraic multiplicity of the eigenvalues with λ(η)=λ. For the Deligne canonical extension of a local system on C∖D every eigenvalue has 0≤Re η<1, so the weights are the real parts of the eigenvalues; for unitary local monodromy the eigenvalues are real and the weights are the eigenvalues themselves.

Hypotheses:

- ∇ has logarithmic poles (regular singularities) along the reduced divisor D, whose points are distinct.
- Generalized eigenspaces, not eigenspaces, define the flag; the weight uses the real part of the eigenvalue modulo the integers.

The construction or proof proceeds as follows.

1. The residue Res_{xⱼ}∇ is an endomorphism of the fibre E(xⱼ); for the canonical extension HodgeStructuresPartII:H.2/canonical-extension supplies it in a commuting local logarithmic frame.
2. The generalized eigenspaces of Res_{xⱼ}∇ decompose E(xⱼ). Summing those with λ(η)≥λ over the distinct values of λ gives a strictly decreasing flag from E(xⱼ) to 0, hence a WeightedFlag with weights in [0,1); attaching these flags to E gives a parabolic bundle.
3. On the canonical extension ⌊Re η⌋=0. If the local monodromy is unitary, its eigenvalues exp(−2πiη) (HodgeStructuresPartII:H.2/residue-monodromy) have modulus one, which forces Im η=0.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/weighted-flag`, `HodgeStructuresPartII:H.2/canonical-extension`, `HodgeStructuresPartII:H.2/residue-monodromy`.

Sources:

- LL22, Definition 3.3.1, p.20: Defines the parabolic bundle of a connection with regular singularities: weights are the fractional parts of the real parts of the residue eigenvalues, flags are sums of generalized eigenspaces above each weight; the strip [0,1) is Deligne's canonical extension.
- LL24, Notation 5.1.1, pp.27–28; proof of Theorem 1.7.1, p.32: Equips the canonical extension of the unitary system on each fibre with this parabolic structure, and applies Proposition 5.2.3 to it.

The reusable API is:

- **ParabolicBundle.ofLogConnection.weight_eq** (characterisation): The weights at xⱼ are exactly the distinct values λ(η) of the residue eigenvalues, in increasing order.
- **ParabolicBundle.ofLogConnection.flag_eq** (characterisation): The flag step of weight λ is the sum of the generalized eigenspaces of the residue for the eigenvalues η with λ(η)≥λ.
- **ParabolicBundle.ofLogConnection.gradedRank_eq** (characterisation): The graded multiplicity at weight λ is the sum of the algebraic multiplicities of the residue eigenvalues η with λ(η)=λ; in particular the multiplicities sum to rank E.
- **ParabolicBundle.ofLogConnection.unitary_weights** (compatibility): For the canonical extension of a unitary local system the weights are the residue eigenvalues, which are real in [0,1), and exp(−2πiλ) runs over the local monodromy eigenvalues (HodgeStructuresPartII:H.2/residue-monodromy).
- **ParabolicBundle.ofLogConnection.directSum** (structure): For a direct sum of logarithmic connections the flag of each weight threshold is the direct sum of the flags, and the weights are the union of the weights.
- **ParabolicBundle.ofLogConnection.trivial** (example): The trivial connection (O_C,d) gives the trivial parabolic structure on O_C.

The unit tests are:

- **ParabolicBundle.ofLogConnection.trivial_connection** (degenerate): For E=O_C with ∇=d every residue is 0 and each mark carries the single weight 0 with multiplicity one.
- **ParabolicBundle.ofLogConnection.two_eigenvalues** (computation): Residue diag(0,1/3) on a rank-two fibre gives the flag ℂ²⊋ℂe₂⊋0 with weights 0 and 1/3, where e₂ spans the 1/3-eigenspace; an increasing flag of eigenspaces would wrongly put ℂe₁ at the second step.
- **ParabolicBundle.ofLogConnection.nilpotent_residue** (compatibility): A nonzero nilpotent residue on a rank-two fibre (unipotent local monodromy) gives the single weight 0 with graded multiplicity 2: generalized eigenspaces are used, so the one-dimensional kernel is not a flag step.
- **ParabolicBundle.ofLogConnection.fractional_part** (non-example): A rank-one logarithmic connection with residue 4/3 (not a canonical extension) has weight 1/3, not 4/3: weights are reduced modulo the integers and lie in [0,1).

Uses:

- LL24, proof of Theorem 1.7.1, p.32: the residues of the canonical extension of V on the fibre C give the parabolic bundle E⋆ to which Proposition 5.2.3 is applied.
- LL24, Notation 5.1.1, pp.27–28: for each fibre of the family, the canonical extension with this structure is the semistable parabolic bundle of the unitary system.
- HodgeStructuresPartII:H.4/unitary-parabolic-semistable: the degree-zero and semistability theorem is stated for this structure.
- LL22, Proposition 3.3.2, pp.20–21: the connection factors through the parabolic Atiyah bundle of this structure, the setting of the isomonodromy argument.

Acceptance checks:

- The trivial connection d on O_C gives the trivial parabolic structure: the single weight 0 at every mark.
- A rank-one connection with residue 1/3 at x gives weight 1/3, and its local monodromy is exp(−2πi/3) with the sign of HodgeStructuresPartII:H.2/residue-monodromy.

### Coparabolic zero lattice

**coparabolicZero** (construction). For E⋆, let J₀ be the marks whose minimum weight is zero. Define Ē₀=ker(E→⊕_{j∈J₀}E(xⱼ)/Fⱼ₁), where Fⱼ₁ is the second flag subspace, or zero for a one-step flag. This is a locally free elementary modification of the same rank as E; its cokernel is supported at D and need not be locally free. It is the zero lattice of the right-continuous coparabolic filtration Ē_α=⋃_{β>α}E_β. Do not identify its inclusion with a saturated ordinary subbundle of E.

The construction or proof proceeds as follows.

1. Use fibre evaluation followed by quotient at exactly the zero-minimum-weight marks.
2. On a local coordinate t, the kernel consists of sections whose reduction modulo t lies in Fⱼ₁; this lattice is finite free of the same rank.
3. Glue kernels; its degree is deg E minus the sum of the zero-weight graded multiplicities.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `SchemeAndStackFoundations:SF.3`, `mathlib:PowerSeries.coeff`, `mathlib:Submodule`.

Sources:

- LL24, §5.2.1, p.30: Defines Ê₀ as the kernel of the map from E to the quotients E_x/E² at marks whose first weight is zero, noting it is the special case of the coparabolic notation needed in the paper.
- LL22, Definition 2.2.8, p.13: Defines the coparabolic bundle by Ê_α = union of E_β over β>α; its value at α=0 is the lattice the node constructs.
- LL22, Example 2.2.4, p.12: Gives the filtration E_α of a parabolic bundle by fibre conditions at the marks and the −D periodicity, from which Ê₀ is computed.

The reusable API is:

- **coparabolicZero.mem_local** (characterisation): In a local trivialization, a section lies in Ē₀ exactly when its value at each zero-weight mark lies in the second flag subspace.
- **coparabolicZero.rank** (compatibility): rank Ē₀=rank E. Planned as `HodgeStructuresPartII:H.4/coparabolic-rank`.
- **coparabolicZero.degree** (relation): deg Ē₀=deg E−Σ_{j∈J₀}dim(E(xⱼ)/Fⱼ₁).
- **coparabolicZero.factor** (universal-property): A bundle map T→E factors uniquely through Ē₀ precisely when all the indicated residue-value quotient maps vanish.
- **coparabolicZero.eq_filtration** (characterisation): Ê₀=⋃_{β>0}E_β=E_ε for every 0<ε≤ε₀, where ε₀ is the least positive weight over all marks (ε₀=1 if every weight is zero) (LL22 Definition 2.2.8).
- **coparabolicZero.bounds** (relation): E(−D)⊆Ê₀⊆E, with E/Ê₀ a skyscraper of length Σ_{j∈J₀}dim(E(xⱼ)/Eⱼ²).

The unit tests are:

- **coparabolicZero.trivial** (compatibility): For trivial parabolic structure Ē₀=E(−D); locally every component has zero constant coefficient.
- **coparabolicZero.positive** (computation): At a mark with all weights positive the zero lattice is the whole original lattice.
- **coparabolicZero.mixed** (computation): For weights 0 and 1/2 on a two-dimensional fibre, in a frame adapted to the flag, only the weight-zero coordinate must be divisible by t.
- **coparabolicZero.not_fibre_injective** (non-example): The inclusion tℂ[[t]]→ℂ[[t]] has zero induced fibre map at t=0, although the two lattices have the same rank.
- **coparabolicZero.three_step** (computation): For ℂ³⊋⟨e₂,e₃⟩⊋⟨e₃⟩⊋0 with weights 0,1/3,2/3 at x, in an adapted frame, Ê₀ consists of the sections whose e₁-coordinate vanishes at x, so deg Ê₀=deg E−1 (killing the deepest step would give deg E−2).
- **coparabolicZero.eq_shift_example** (compatibility): For the rank-two flag with weights 0,1/4 at x, Ê₀ equals E_ε for every 0<ε≤1/4 and differs from E_0=E (agreement with LL22 Definition 2.2.8).
- **coparabolicZero.dual_twist_line** (computation): For a degree-d line with weight 0 at the single mark x, the coparabolic zero lattice of its parabolic dual twisted by K_C(x) is L∨⊗K_C, of degree −d+2g−2.

Uses:

- LL22 Proposition 6.3.6, pp.41–43; LL24 Proposition 5.2.4, p.31 (packet node parabolic-clifford-rank): the subbundle U, the corank c and the section deficit δ=h⁰(Ê₀)−h⁰(U) are all taken inside Ê₀.
- LL24 proof of Proposition 5.2.3, p.31 (packet node coparabolic-dual-twist): the zero lattice of the coparabolic bundle of (E⋆)^∨⊗ω_C(D) is E^∨⊗ω_C, so δ becomes the rank of the section map.
- LL22 Lemma 6.3.4 proof, pp.40–41 (packet node ordinary-quotient-slope): an ordinary quotient Q of Ê₀ receives W[ε]_0 for small ε>0; the image is used to show μ(Q)≥μ⋆−n.

Acceptance checks:

- Ê₀=E_ε for small ε>0 (agreement with LL22 Def 2.2.8), checked on the weights-0,1/4 example.
- deg Ê₀=deg E−Σ_{j∈J₀}dim(E(x_j)/E_j²); for the trivial structure this is deg E−n·rank E.

### Normalized parabolic dual

**parabolicDual** (construction). The parabolic dual E⋆∨ is the parabolic internal Hom into O_C with the trivial structure (LL22 Definition 2.6.1). Its filtration is (E⋆∨)_α=(Ê_{−α})∨(−D) (LL22 Lemma 2.6.2), so its underlying bundle is (Ê₀)∨(−D). Its weights are 0 for an original zero weight and 1−α for an original positive weight α, with the same multiplicities. At xⱼ the fibre of (Ê₀)∨(−D) contains the canonical subspace (Eⱼᵏ)∨⊗T*_{xⱼ}C, where k=2 if the first weight at xⱼ is 0 and k=1 otherwise; it carries the weights 1−αⱼⁱ (i≥k), the step of weight 1−αⱼⁱ being the annihilator of Eⱼ^{i+1} in (Eⱼᵏ)∨ tensored with T*, and the quotient (E(xⱼ)/Eⱼᵏ)∨ carries weight 0. Only at marks whose weights are all positive, or all zero, is the dual fibre flag the annihilator flag of E(xⱼ)∨ (tensored with T*_{xⱼ}C at marks whose weights are all positive). At a positive-weight graded factor the underlying dual lattice is shifted down by one divisor; dualizing just the ordinary bundle with reflected weights is wrong. Rank is preserved and parDeg(E⋆∨)=−parDeg(E⋆). Twisting by an ordinary line bundle is the separate construction HodgeStructuresPartII:H.4/parabolic-twist.

The construction or proof proceeds as follows.

1. Construct the filtered internal Hom as in LL22 Definition 2.2.3.
2. Use annihilators of the fibre flags and the periodic lattice relation to normalize weights into [0,1).
3. Check the local line models: α=0 gives the ordinary dual; α>0 gives E∨(−x) and weight 1−α. Glue and use determinant degree additivity.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`, `mathlib:Submodule`.

Sources:

- LL22, Definition 2.6.1 and Lemma 2.6.2, p.15: Defines the parabolic dual as the filtered internal Hom into the structure sheaf and identifies its α-term with the dual of the coparabolic (−α)-term twisted by −D, from which the weights and lattice shifts follow.
- LL22, Definition 2.2.3, pp.11–12: Defines parabolic morphisms and the filtered internal Hom sheaf whose α-term is Hom into the α-shift, the construction used for the dual.
- LL22, Lemma 2.6.5, p.15: States that the parabolic dual has the negative parabolic degree, as asserted in the node.
- LL24, Proof of Proposition 5.2.3, p.31: Applies the Clifford-type bound to the dual twisted by ω_C(D), and records that its coparabolic zero lattice is E^∨⊗ω_C.

The reusable API is:

- **parabolicDual.rank** (projection): The parabolic dual has the same rank as E⋆.
- **parabolicDual.degree** (relation): parDeg(E⋆∨)=−parDeg(E⋆). Planned as `HodgeStructuresPartII:H.4/parabolic-dual-degree`.
- **parabolicDual.involutive** (equivalence): Double parabolic dual is canonically E⋆, preserving filtered lattices.
- **parabolicDual.weight** (characterisation): A graded weight α is sent to 0 if α=0 and to 1−α otherwise.
- **parabolicDual.underlying** (projection): The underlying bundle of E⋆∨ is (Ê₀)∨(−D); its degree is −deg E minus the number of positive weights counted with multiplicity.
- **parabolicDual.filtration** (characterisation): (E⋆∨)_α=(Ê_{−α})∨(−D) for every real α (LL22 Lemma 2.6.2).
- **parabolicDual.fibre** (characterisation): At xⱼ the fibre of (Ê₀)∨(−D) has the canonical subspace (Eⱼᵏ)∨⊗T*_{xⱼ}C (k=2 if the first weight is 0, else k=1) carrying the weights 1−α on annihilator steps, with quotient (E(xⱼ)/Eⱼᵏ)∨ of weight 0.
- **parabolicDual.map** (functoriality): A parabolic morphism f:E⋆→F⋆ induces f∨:F⋆∨→E⋆∨, with id∨=id and (g∘f)∨=f∨∘g∨.
- **parabolicDual.induced_exact** (relation): For a saturated F⊂E with quotient Q and induced structures, 0→Q⋆∨→E⋆∨→F⋆∨→0 is exact, and its terms carry the induced subbundle and quotient structures.
- **parabolicDual.twist** (compatibility): (E⋆⊗L)∨=E⋆∨⊗L⁻¹ for an ordinary line bundle L.
- **parabolicDual.coparabolicZero** (relation): The coparabolic zero lattice of E⋆∨ is E∨(−D), of degree −deg E−n·rank E (LL24 proof of Proposition 5.2.3).

The unit tests are:

- **parabolicDual.zero_weight** (degenerate): An ordinary degree d line with a single zero weight has dual ordinary degree −d and weight zero.
- **parabolicDual.positive_line** (computation): A degree d line with a single weight 1/4 has dual degree −d−1 and weight 3/4.
- **parabolicDual.degree_test** (compatibility): For that line, dual parabolic degree equals −(d+1/4).
- **parabolicDual.no_weight_one** (non-example): Dualizing zero weight keeps zero and never creates weight one.
- **parabolicDual.mixed_rank_two** (computation): For E=Oe₁⊕Oe₂ near x with flag E_x⊋ℂe₂⊋0 and weights 0,1/4, the dual has underlying Oe₁∨⊕O(−x)e₂∨ (degree drop one), weights 0 and 3/4 with deep step spanned by t·e₂∨, and parabolic degree −1/4.
- **parabolicDual.trivial** (compatibility): The dual of E with the trivial parabolic structure is E∨ with the trivial parabolic structure.
- **parabolicDual.coparabolic_zero_line** (computation): For a degree-d line with weight 1/4 at x, the coparabolic zero lattice of its dual is L∨(−x); for weight 0 it is also L∨(−x), as the identity (E⋆∨)^₀=E∨(−D) predicts.

Uses:

- LL24 proof of Proposition 5.2.3, p.31 (packet nodes dual-twist-semistable, coparabolic-dual-twist): Proposition 5.2.4(II) is applied to (E⋆)^∨⊗ω_C(D); its semistability, slope 2g−2+n and coparabolic zero lattice E^∨⊗ω_C are read off from the dual.
- LL22 Lemma 2.6.5, p.15 (packet node parabolic-dual-degree): parabolic dualisation negates parabolic degree.
- LL22 Proposition 2.6.6, pp.15–16: parabolic Serre duality pairs H^i(E⋆) with H^{1−i} of the coparabolic dual twisted by ω(D), which motivates the coparabolic zero lattice of the dual twist.

Acceptance checks:

- Rank-two mixed example R3: dual underlying O⊕O(−x), weights 0,3/4, parDeg −1/4.
- (E⋆^∨)_0=(Ê₀)^∨(−D) and the coparabolic zero lattice of E⋆^∨ is E^∨(−D).

### Twist of a parabolic bundle by a line bundle

**ParabolicBundle.twist** (construction). For a parabolic bundle E⋆ on (C,D) and an ordinary line bundle L on C, the twist E⋆⊗L has underlying bundle E⊗L and, at each xⱼ, the flag Eⱼⁱ⊗L(xⱼ)⊂E(xⱼ)⊗L(xⱼ) with the same weights; equivalently (E⋆⊗L)_α=E_α⊗L for every real α. It is the parabolic tensor product of LL22 Definition 2.6.3 with L given the trivial parabolic structure. Rank, weights and graded multiplicities are unchanged, and parDeg(E⋆⊗L)=parDeg(E⋆)+rank(E)·deg L.

Hypotheses:

- L is an ordinary line bundle with the trivial parabolic structure: its only weight is zero.

The construction or proof proceeds as follows.

1. Tensor the underlying bundle with L and transport each marked flag along the canonical identification (E⊗L)(xⱼ)=E(xⱼ)⊗L(xⱼ).
2. On filtrations, the parabolic tensor product Σ_{β+γ=α}E_β⊗L_γ with L_γ=L(−⌈γ⌉D) reduces to E_α⊗L, because the trivial structure jumps only at integers and E_{β+1}=E_β(−D).
3. Determinant degree increases by rank(E)·deg L (SF.3) and the weighted multiplicities are unchanged, which gives the degree formula (LL22 Lemma 2.6.5).

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/weighted-flag`, `SchemeAndStackFoundations:SF.3`.

Sources:

- LL22, Definition 2.6.3 and Lemma 2.6.5, p.15: Defines the parabolic tensor product of parabolic bundles through the filtrations and states that parabolic degree is additive in the form deg(E⊗F)=deg E·rk F+deg F·rk E; the twist is the case of a trivially structured line.
- LL24, Proof of Proposition 5.2.3, p.31: The Clifford estimate is applied to the parabolic dual of E⋆ twisted by ω_C(D), whose slope 2g−2+n is computed from this degree formula.

The reusable API is:

- **ParabolicBundle.twist_rank** (projection): rank(E⋆⊗L)=rank E⋆, and the marked flags of E⋆⊗L are those of E⋆ under E(xⱼ)⊗L(xⱼ)≅E(xⱼ) for a chosen trivialization of L(xⱼ).
- **ParabolicBundle.twist_zero** (simp): E⋆⊗O_C=E⋆.
- **ParabolicBundle.twist_twist** (functoriality): (E⋆⊗L)⊗L′=E⋆⊗(L⊗L′), compatibly with the identifications of the fibres.
- **parabolicDegree.twist** (relation): parDeg(E⋆⊗L)=parDeg(E⋆)+rank(E)·deg L. Planned as `HodgeStructuresPartII:H.4/parabolic-twist-degree`.
- **ParabolicBundle.coparabolicZero_twist** (compatibility): The coparabolic zero lattice of E⋆⊗L is Ê₀⊗L; in particular its ordinary degree is deg Ê₀+rank(E)·deg L.
- **ParabolicBundle.twist_inducedSubbundle** (compatibility): For a saturated F⊂E, the induced structure on F⊗L⊂E⊗L is F⋆⊗L; hence slopes of corresponding subbundles shift by deg L and E⋆⊗L is semistable exactly when E⋆ is.

The unit tests are:

- **ParabolicBundle.twist_line_quarter** (computation): A degree d line with weight 1/4 at one point, twisted by a degree-one line, has ordinary degree d+1, weight 1/4 and parabolic degree d+5/4; realizing the twist as a shift of weights would change the weight.
- **ParabolicBundle.twist_rank_two** (computation): O_C⊕O_C with weights 0 and 1/2 at one point, twisted by a degree-three line, has parabolic degree 1/2+6=13/2; adding deg L only once would give 7/2.
- **ParabolicBundle.twist_trivial_KD** (compatibility): The trivially structured O_C twisted by K_C(D) (degree 2g−2+n) has coparabolic zero lattice of degree 2g−2, the degree of K_C; the rank-one case of the coparabolic dual-twist identification.
- **ParabolicBundle.twist_by_trivial** (degenerate): Twisting by O_C (degree zero) returns E⋆ with the same flags, weights and degree.

Uses:

- LL24, proof of Proposition 5.2.3, p.31: Proposition 5.2.4(II) is applied to (E⋆)∨⊗ω_C(D), a twist of the parabolic dual.
- HodgeStructuresPartII:H.4/dual-twist-semistable: the twist shifts every subbundle slope by deg L, so it preserves semistability and adds deg L to the slope.
- HodgeStructuresPartII:H.4/coparabolic-dual-twist: the coparabolic zero lattice of the twisted dual is computed as a twist of the dual's zero lattice.
- LL22 Lemma 2.6.5, p.15: the degree of a tensor product with a trivially structured line is the degree formula of this node.

Acceptance checks:

- Twisting a degree d line with weight 1/4 at x by O_C(x) gives a degree d+1 line with weight 1/4, of parabolic degree d+5/4.
- The trivially structured O_C twisted by K_C(D) has coparabolic zero lattice K_C(D)(−D)=K_C.

### Section multiplication map at a vector

**traceSectionMap** (construction). For v∈H⁰(C,E⊗K_C(D)), let μ_v:H⁰(C,E∨⊗K_C)→H⁰(C,K_C²(D)) be u↦B_E(v,u), where B_E:(E⊗K_C(D))×(E∨⊗K_C)→K_C²(D) is the perfect trace pairing HodgeStructuresPartII:H.3/trace-multiplication (LL24 (5.5)); equivalently μ_v=μ_E(v⊗−) for the section map μ_E of that node. Its rank is dim_C im μ_v. This is the rank of a linear map on global sections, not the generic rank of the sheaf map. Its kernel is H⁰ of the sheaf kernel; when v≠0 that sheaf kernel is a saturated corank-one subbundle of E∨⊗K_C on the regular curve.

The construction or proof proceeds as follows.

1. Apply the trace pairing of HodgeStructuresPartII:H.3/trace-multiplication to global sections and fix v to obtain the native complex linear map.
2. Left exactness of sections identifies its kernel.
3. For v≠0, perfection of B_E (part of the H.3 node) makes the sheaf map B_E(v,−) generically a nonzero functional; its image is torsion-free rank one, so its kernel is a saturated corank-one locally free subbundle. Do not assert surjectivity onto the target line at zeros of v.

Direct inputs: `HodgeStructuresPartII:H.3/trace-multiplication`, `SchemeAndStackFoundations:SF.3`, `mathlib:LinearMap.range`, `mathlib:Module.finrank`.

Sources:

- LL24, Proposition 5.2.3 and its proof, p.31: States the rank bound in terms of the rank of u↦B_E(v,u) on global sections, and in the proof takes the kernel of the sheaf map as a corank-one subbundle with section deficit r.
- LL24, §5.2, equation (5.5), p.29: Defines the pairing B_E as tensor product followed by trace, between E⊗ω_C(D) and E^∨⊗ω_C with values in ω_C²(D), and calls it perfect.
- LL24, Proof of Theorem 1.7.1, p.32: Identifies the fibre of the Gauss–Manin map with v↦(u↦B_E(v,u)) and applies Proposition 5.2.3 to its rank.

The reusable API is:

- **traceSectionMap.apply** (simp): μ_v(u)=B_E(v,u).
- **traceSectionMap.linear** (structure): The association v↦μ_v is complex-linear.
- **traceSectionMap.kernel_sections** (characterisation): ker μ_v=H⁰(C,ker B_E(v,−)). Planned as `HodgeStructuresPartII:H.4/trace-kernel-sections`.
- **traceSectionMap.eq_traceMultiplication** (compatibility): μ_v(u)=μ_E(v⊗u), where μ_E is the section map of HodgeStructuresPartII:H.3/trace-multiplication.
- **traceSectionMap.sheafMap** (data): The sheaf map f_v:E∨⊗K_C→K_C²(D), u↦B_E(v,u), whose map on global sections is μ_v.
- **traceSectionMap.sheafKernel_corank_one** (relation): For v≠0, ker f_v is a saturated subbundle of E∨⊗K_C of rank rank E−1.
- **traceSectionMap.rank_eq_deficit** (relation): rank μ_v=h⁰(E∨⊗K_C)−h⁰(ker f_v), by rank–nullity and kernel_sections.

The unit tests are:

- **traceSectionMap.zero** (degenerate): At v=0 the section map has zero image and rank zero.
- **traceSectionMap.scalar** (compatibility): For a≠0, μ_{av}=aμ_v and its image rank equals that of μ_v.
- **traceSectionMap.rank_one_model** (computation): For scalar evaluation ℂ×ℂ→ℂ and v=1 the section map is the identity of rank one.
- **traceSectionMap.kernel_model** (non-example): For the pairing ℂ²×(ℂ²)∨→ℂ and v=e₁ the kernel is the one-dimensional annihilator; it is not the zero space.
- **traceSectionMap.trivial_bundle_rank** (computation): For E=O_C and nonzero v∈H⁰(C,K_C(D)), μ_v is multiplication by v from H⁰(K_C) to H⁰(K_C²(D)); it is injective, so its rank is g, whereas the sheaf map has generic rank one.
- **traceSectionMap.split_kernel** (computation): For E=O_C⊕O_C and v=(v₁,0) with v₁≠0, the sheaf kernel of B_E(v,−) is 0⊕K_C, saturated of corank one, ker μ_v=0⊕H⁰(K_C) and rank μ_v=g.
- **traceSectionMap.rank_zero_possible** (degenerate): On ℙ¹ with two marks, E=O and any nonzero v∈H⁰(K(D))=H⁰(O) give μ_v=0, because H⁰(K)=0: a nonzero v can have section rank zero.

Uses:

- LL24 Proposition 5.2.3, p.31 (packet node trace-rank-bound): the rank r of this map is the quantity in the bound rk E ≥ g−r.
- LL24 proof of Proposition 5.2.3, p.31: U=ker f_v is a corank-one subbundle of E^∨⊗ω_C with h⁰(E^∨⊗ω_C)−h⁰(U)=r, so Proposition 5.2.4(II) applies with c=1, δ=r.
- LL24 proof of Theorem 1.7.1, p.32 (packet node sublocal-system-rank): via Theorem 5.1.6, ∇_m(v) is u↦B_E(v,u); a low-rank sub-local system yields v whose map has rank at most rk L/2.

Acceptance checks:

- For E=O_C and v≠0, rank μ_v=g.
- rank μ_v=h⁰(E^∨⊗K_C)−h⁰(ker f_v), and ker f_v has corank one for v≠0.

### Underlying coparabolic quotient slope bound

**ordinaryQuotientSlope** (theorem). Let E⋆ be nonzero parabolically semistable on (C,D), |D|=n. Every nonzero ordinary locally free quotient Q of Ē₀ satisfies μ(Q)≥μ⋆(E⋆)−n. For the ordinary underlying parabolic bundle E, the quotient inequality is strict when n>0: μ(Q)>μ⋆(E⋆)−n. Only the nonstrict coparabolic inequality is used in the Clifford proof.

Hypotheses:

- Q has positive rank.

The construction or proof proceeds as follows.

1. For quotients of E use induced quotient semistability and the strict upper bound parDeg Q⋆<deg Q+n rank Q when n>0.
2. For quotients of Ē₀ shift the filtered bundle by sufficiently small ε>0; it becomes a parabolic lattice whose slope converges to μ⋆(E⋆). Apply the ordinary parabolic inequality and take the limit.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-semistability`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/parabolic-degree-bounds`, `HodgeStructuresPartII:H.4/parabolic-quotient-criterion`.

Sources:

- LL22, Lemma 6.3.4 and proof, pp.40–41: For a semistable parabolic or coparabolic bundle of parabolic slope r+n, every quotient bundle of the underlying lattice has slope at least r, strictly in the parabolic case when n>0; the coparabolic case passes through small ε-shifts and a limit.
- LL22, Lemma 6.3.3 and proof, p.40: The parabolic slope exceeds the ordinary slope by at most n times the largest weight, with equality only when all weights equal it; this gives the strict parabolic branch since weights are below 1.

Acceptance checks:

- With no marks, recover the standard quotient-slope criterion.
- For a trivial degree-zero line and one mark, Ē₀=O_C(−x) attains equality −1; replacing ≥ by > is false.

### Semistability under parabolic dual and ordinary twist

**dualTwistSemistable** (theorem). For nonzero parabolically semistable E⋆ and an ordinary line bundle L, E⋆∨⊗L is parabolically semistable of slope −μ⋆(E⋆)+deg L. In particular, if parDeg E⋆=0 and L=K_C(D), its slope is 2g−2+n. No upgrade from semistable to stable is made.

The construction or proof proceeds as follows.

1. Duality exchanges saturated induced subbundles and quotients and negates their slopes. Apply the quotient criterion.
2. Twist preserves the subbundle order and shifts every slope by deg L.
3. Use the imported formula deg K_C=2g−2 and deg D=n.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/parabolic-semistability`, `SchemeAndStackFoundations:SF.3`, `HodgeStructuresPartII:H.4/parabolic-twist-degree`, `HodgeStructuresPartII:H.4/parabolic-quotient-criterion`, `HodgeStructuresPartII:H.4/parabolic-dual-degree`, `HodgeStructuresPartII:H.4/parabolic-twist`.

Sources:

- LL24, Proof of Proposition 5.2.3, p.31: Applies the Clifford estimate to the parabolic dual of E⋆ twisted by ω_C(D), whose slope is 2g−2+n because E⋆ has slope zero; the text calls it stable where only semistability follows (source issue E-H4-1).
- LL22, Lemma 2.6.5, p.15; Lemma 2.4.5, p.14: Parabolic degree is additive in tensor products and changes sign under parabolic duality; semistability is equivalent to the quotient-slope inequality, which duality turns into the subbundle inequality.

Acceptance checks:

- O_C⊕O_C with trivial flags remains semistable and is an admissible input; stability is not inferred.

### Coparabolic dual-twist identification

**coparabolicDualTwist** (comparison). For every E⋆ on (C,D), the zero lattice of the coparabolic bundle associated to E⋆∨⊗K_C(D) is canonically E∨⊗K_C, where E is the original ordinary underlying bundle. The isomorphism respects the inclusion into the normalized dual lattice tensored by K_C(D), and rank is unchanged.

The construction or proof proceeds as follows.

1. At original positive weights, the dual underlying lattice already has a −x shift, cancelled by the D twist.
2. At original zero weights, the dual zero weight remains zero and the coparabolic elementary modification supplies the −x shift.
3. Use annihilator flags to check the two complementary graded pieces and glue the natural identifications.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `SchemeAndStackFoundations:SF.3`, `HodgeStructuresPartII:H.4/coparabolic-rank`, `HodgeStructuresPartII:H.4/parabolic-twist`.

Sources:

- LL24, Proof of Proposition 5.2.3, p.31: Asserts, by unwinding definitions, that the coparabolic zero lattice of the dual of E⋆ twisted by ω_C(D) is E∨⊗ω_C, and uses it to compute the section deficit.
- LL22, Example 2.2.4, p.12; Definition 2.2.8, p.13; Lemma 2.6.2, p.15: The filtered sheaf of a parabolic bundle, its right-continuous coparabolic hull, and the formula expressing the dual filtration through the dual of the coparabolic hull twisted by −D; the identification follows from these.

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

Sources:

- LL22, Proposition 6.3.6 and proof, pp.41–43: For E⋆ with coparabolically semistable hull and a subbundle U of the zero lattice, rk E exceeds g·c−δ when the slope is above 2g−2+n and is at least g·c−δ at equality, with the non-generically-globally-generated corollary; the proof reduces to Lemma 6.2.3 after removing the HN part of slope above 2g−2.
- LL22, Definition 6.1.3, p.36; Lemmas 6.2.1–6.2.3, pp.36–38; Lemma 6.3.5, p.41: Generic global generation; the bound h⁰≤deg/2+rk for HN slopes in [0,2g] via vector Clifford; the rank inequality for high-slope bundles with a section-deficit subbundle; vanishing of H¹ when all HN slopes exceed 2g−2.
- LL24, Proposition 5.2.4 and Remark 5.2.5, p.31: Restates LL22 Proposition 6.3.6 with the hypothesis on E⋆ and its slope; the remark's word stable is a slip for semistable (source issue E-H4-1).
- BPGN97, Theorem 2.1 and proof, p.9: Clifford bound for a semistable bundle with slope between 0 and 2g−2 on a curve of genus at least 2 in characteristic zero: h⁰ is at most the rank plus half the degree, by induction on rank.

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

Sources:

- LL24, Proposition 5.2.3 and proof, p.31: For a semistable parabolic bundle of parabolic degree zero and a nonzero section v of E⊗ω(D), the rank r of u↦B_E(v,u) on global sections satisfies rk E≥g−r; proof: the equality branch of the Clifford estimate with c=1 and δ=r for the dual twist.

Acceptance checks:

- The global-section rank r may be zero; the conclusion then reads rank E≥g.
- v=0 is excluded because its sheaf kernel does not have corank one.

### Unitary local systems give semistable parabolic bundles of degree zero

**unitaryParabolicSemistable** (theorem). Let C be a smooth proper connected complex curve, D⊂C a reduced divisor, V a finite-rank unitary complex local system on C∖D, (E,∇) the Deligne canonical extension of V⊗O (residue eigenvalues with real parts in [0,1)), and E⋆ its parabolic structure HodgeStructuresPartII:H.4/connection-parabolic-structure. Then parDeg(E⋆)=0 and E⋆ is parabolically semistable. More precisely, E⋆ is the direct sum of the parabolic bundles of the irreducible summands of V, and each of these is parabolically stable of parabolic degree zero. The degree statement holds for the canonical extension of every local system; semistability uses unitarity.

Hypotheses:

- C is a smooth proper connected complex curve and D a reduced divisor, possibly empty.
- V is unitary: its monodromy preserves a positive definite Hermitian form.
- E⋆ carries the canonical-extension weights in [0,1), not those of another logarithmic lattice.

The construction or proof proceeds as follows.

1. Residue theorem: for a logarithmic connection on a smooth proper curve, deg E=−Σⱼ tr Res_{xⱼ}∇ (apply it to the induced rank-one connection on det E, whose residues are the traces). On the canonical extension the weights are the real parts of the residue eigenvalues counted with algebraic multiplicity, so their weighted sum is Re Σⱼ tr Res_{xⱼ}∇=−deg E and parDeg(E⋆)=0. MS80 Proposition 1.9 and Corollary 1.10 prove the same identity in the Fuchsian model of C∖D.
2. A unitary representation is completely reducible (the orthogonal complement of an invariant subspace is invariant), so V=⊕ᵢVᵢ with Vᵢ irreducible unitary. Canonical extension, residues and the parabolic structure commute with direct sums (connection-parabolic-structure, directSum).
3. Each irreducible unitary Vᵢ gives a parabolically stable bundle of parabolic degree zero: MS80 Proposition 1.12 proves stability for the Mehta–Seshadri bundle (reduce to line subbundles by exterior powers; a line subbundle of positive parabolic degree would give, after tensor powers, a nonconstant section of a unitary bundle, whose sections are constant, and degree zero forces a decomposable invariant vector, contradicting irreducibility). LL24 Remark 5.2.2 notes that identifying that bundle with the canonical-extension parabolic structure is not immediate from MS80 and cites Simpson 1990 Theorem 5 for the semistability of the latter; AHL19 Proposition 5.4 and Corollary 5.5 state it for a complex polarized variation, here of a single Hodge type with zero Higgs field. That analytic identification is gap G6.
4. A direct sum of semistable parabolic bundles of the same slope μ is semistable: for a saturated F⊂E₁⊕E₂, the sequence 0→F∩E₁→F→Q→0 with Q=p₂(F) has F∩E₁ saturated in E₁, of slope at most μ; Q with the quotient structure from F⋆ maps parabolically and generically isomorphically to its saturation Q′⊂E₂ with the induced structure, so Q_α⊆Q′_α for all α and parDeg Q⋆≤parDeg Q′⋆≤μ·rank Q. Degree additivity (HodgeStructuresPartII:H.4/parabolic-degree-add) gives μ⋆(F⋆)≤μ. MS80 Proposition 1.15 (the semistable bundles of parabolic degree zero form an abelian category) is the related statement.
5. When D=∅ the statement is the compact case of the harmonic correspondence: a unitary flat bundle carries a flat harmonic metric with zero Higgs field, so its Higgs bundle is slope-polystable of degree zero (HodgeStructuresPartII:H.1/flat-metric-existence, harmonic-correspondence). Only the marked case needs the open-curve input of gap G6.

Direct inputs: `HodgeStructuresPartII:H.4/connection-parabolic-structure`, `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/parabolic-semistability`, `HodgeStructuresPartII:H.4/parabolic-quotient-criterion`, `HodgeStructuresPartII:H.4/induced-subbundle`, `HodgeStructuresPartII:H.2/canonical-extension`, `HodgeStructuresPartII:H.2/residue-monodromy`, `SchemeAndStackFoundations:SF.3`, `mathlib:Representation`, `HodgeStructuresPartII:H.2`, `HodgeStructuresPartII:H.1/harmonic-correspondence`, `HodgeStructuresPartII:H.1/flat-metric-existence`.

Sources:

- LL24, §5.2.1 and Remark 5.2.2, p.30; proof of Theorem 1.7.1, p.32: States that the parabolic bundle of the canonical extension of a unitary system is parabolically semistable, citing Mehta–Seshadri and Simpson 1990 Theorem 5; the proof of Theorem 1.7.1 uses it with parabolic degree zero.
- MS80, §1: Proposition 1.9, Corollary 1.10, Definition 1.11, Proposition 1.12 and Definition 1.13, pp.213–215; Proposition 1.15, p.216: In the Fuchsian model of a hyperbolic punctured curve, a unitary Γ-bundle has parabolic degree zero and every proper nonzero parabolic subbundle coming from a Γ-subbundle has parabolic degree ≤0, <0 for an irreducible representation; so it is semistable, and stable when irreducible.
- AHL19, §5, pp.10–12: Theorem 5.3, Proposition 5.4 and Corollary 5.5, p.12: A complex polarized variation is a tame harmonic bundle whose parabolic structure is Deligne's; it yields a polystable parabolic Higgs bundle with vanishing parabolic Chern classes. The proof of Proposition 5.4 is referred to Brunebarbe and was not read.

Acceptance checks:

- D=∅ and V trivial of rank r: E⋆=O_C^r, of degree zero, semistable and for r≥2 not stable.
- A rank-one unitary local system on C∖{x,y} with local monodromies exp(−2πiα) and exp(2πiα), 0<α<1, has canonical extension of degree −1 with weights α at x and 1−α at y, so parabolic degree zero.
- Unitarity cannot be dropped: the rank-two uniformizing local system of a compact curve of genus g≥2 (D=∅) has canonical extension of degree zero containing a line subbundle of degree g−1.

### Fixed-part vector with small period derivative

**fixedPartVector** (theorem). In a punctured versal family π°:C°→M of hyperbolic (g,n)-curves over a connected complex variety with dominant étale classifying map, let V be a unitary complex local system on the total space, H=R¹π°_*V and L⊂H a nonzero irreducible sub-local system. At a point m, after possibly conjugating V and L, there is a sub-local system L′⊂H isomorphic to L and a nonzero v∈L′_m∩F¹H_m such that the map obtained by contracting the period derivative with v has rank at most rank L/2. The chosen vector need not lie in the original inclusion of L.

The construction or proof proceeds as follows.

1. Put H=R¹π°_*V and W_ℝ=R¹π°_*Ṽ for the realification Ṽ of V. W_ℝ is an admissible graded-polarizable real VMHS with Hodge types (1,0),(0,1),(1,1) and its complexification contains H as a direct summand (HodgeStructuresPartII:H.2/unitary-curve-family, unitary-curve-fiber, unitary-bigrading). H.2 states admissibility with quasi-unipotent boundary monodromy; the unrestricted unitary case is gap G5.
2. Do not identify W_ℝ with a minimal realification of H (source issue E-H4-3); follow the author replacement proof. The real form L̃ of the irreducible L (HodgeStructuresPartII:H.2/irreducible-real-form) and the fixed-part evaluation HodgeStructuresPartII:H.2/irreducible-evaluation give a nonzero constant real MHS Q_ℝ and a nonzero morphism ι:Q_ℝ⊗L̃→W_ℝ; the original inclusion L⊂H is among the evaluated constant homomorphisms, so p∘ι_ℂ is nonzero for the projection p to H.
3. Restrict to a Hodge component of Q and, after conjugating V and L if necessary, to the summand L of L̃_ℂ on which p∘ι_ℂ is nonzero. Choose a constant q in that component for which ℓ↦p∘ι_ℂ(q⊗ℓ) is nonzero; it is a morphism of local systems out of the irreducible L, hence injective; its image is L′≅L.
4. After regrading by opposite integral shifts on L and Q (HodgeStructuresPartII:H.2/isotypic-hodge) there are two cases. If L has the single type (0,0) and q has type (1,0) or (1,1) (conjugating once more when the component has type (0,1)), then v∈F¹H_m and the period map of L is zero, so the contracted derivative vanishes. If L has types (1,0),(0,1) and q type (0,0), conjugate so that dim L^{0,1}≤dim L^{1,0} and take ℓ∈L^{1,0}. Horizontality of p∘ι_ℂ and constancy of q bound the contracted derivative by the derivative of the period map of L, whose image lies in L_m/F¹L_m of dimension dim L^{0,1}≤rank L/2 (HodgeStructuresPartII:H.3/derivative-connection, curve-hodge-filtration).

Direct inputs: `HodgeStructuresPartII:H.2/unitary-curve-fiber`, `HodgeStructuresPartII:H.2/unitary-curve-family`, `HodgeStructuresPartII:H.2/unitary-bigrading`, `HodgeStructuresPartII:H.2/irreducible-real-form`, `HodgeStructuresPartII:H.2/irreducible-evaluation`, `HodgeStructuresPartII:H.2/isotypic-hodge`, `HodgeStructuresPartII:H.3/curve-hodge-filtration`, `HodgeStructuresPartII:H.3/derivative-connection`, `StableReductionPartII:key/moduli-curves`, `mathlib:Subrepresentation`, `mathlib:Module.finrank`, `mathlib:LinearMap.range`, `HodgeStructuresPartII:H.2`.

Sources:

- LL24, Lemma 6.1.1 and proof, p.33: Claims a nonzero v in L_m∩F¹H_m, after conjugation, whose contracted Gauss–Manin derivative has rank at most rk L/2, via the fixed part and a two-case Hodge-type analysis; the membership in L_m and a realification identity are faulty (source issues E-H4-2, E-H4-3).
- LL-ERRATA, P04 erratum, entry for printed p.860 (proof of Lemma 6.1.1): Replacement proof: apply the fixed part to R¹π°_* of the realified coefficients, project the evaluation to the complex summand H, choose a Hodge component, and bound the contracted derivative by dim L^{0,1}≤rk L/2.
- LL24, Theorem 4.1.1, Lemma 4.1.2 and Proposition 4.2.2, pp.24–26: The real VMHS on the cohomology of a unitary system on a punctured curve family, its three Hodge types, and the nonzero fixed-part evaluation out of the real form of an irreducible constituent.

Acceptance checks:

- Record L′ as an isomorphic image, not equality with the original subspace L_m.
- Apply the real VMHS to realification(V) before taking cohomology; the two realification functors do not commute as claimed in the preprint.

### Rank bound for sub-local systems

**sublocalSystemRank** (theorem). Let π:C→M be a smooth proper family of n-pointed geometrically connected genus g complex curves with disjoint sections, where M is a connected complex variety and M→M_{g,n} is dominant étale; require 2g−2+n>0. Let π° be its punctured family and V a finite-rank unitary complex local system on C°. Every nonzero sub-local system L⊂R¹π°_*V satisfies rank L≥2g−2 rank V. In particular, if rank V<g, H⁰(M,R¹π°_*V)=0. Unitarity here is on the total space.

The construction or proof proceeds as follows.

1. A nonzero sub-local system contains a nonzero irreducible one (finite rank); it suffices to bound the rank of an irreducible L.
2. HodgeStructuresPartII:H.4/fixed-part-vector gives, after possibly replacing V by its conjugate (same rank), a nonzero v∈F¹H_m whose contracted derivative has rank at most rank L/2.
3. On the fibre C=π⁻¹(m) let (E,∇) be the canonical extension of V|C° (HodgeStructuresPartII:H.2/canonical-extension) with its parabolic structure E⋆ (connection-parabolic-structure). By HodgeStructuresPartII:H.4/unitary-parabolic-semistable, E⋆ is semistable of parabolic degree zero, and F¹H_m=H⁰(C,E⊗K_C(D)) (HodgeStructuresPartII:H.3/curve-hodge-filtration).
4. By HodgeStructuresPartII:H.3/trace-period-derivative the dual of the derivative at m is c_m*∘μ_E, and since M→M_{g,n} is étale c_m* is an isomorphism (HodgeStructuresPartII:H.3/trace-derivative-rank); so the contracted derivative at v has the same rank r as the section map μ_v.
5. HodgeStructuresPartII:H.4/trace-rank-bound gives rank V=rank E≥g−r≥g−rank L/2, that is rank L≥2g−2 rank V.
6. If rank V<g, a nonzero invariant section would span a rank-one trivial sub-local system, while the bound gives rank at least 2g−2 rank V≥2. Hence H⁰(M,R¹π°_*V)=0.

Direct inputs: `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/trace-rank-bound`, `HodgeStructuresPartII:H.4/unitary-parabolic-semistable`, `HodgeStructuresPartII:H.4/connection-parabolic-structure`, `HodgeStructuresPartII:H.2/canonical-extension`, `HodgeStructuresPartII:H.3/curve-hodge-filtration`, `HodgeStructuresPartII:H.3/trace-period-derivative`, `HodgeStructuresPartII:H.3/trace-derivative-rank`, `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `mathlib:Subrepresentation`, `mathlib:Representation.invariants`, `HodgeStructuresPartII:H.2`.

Sources:

- LL24, Theorem 1.7.1, p.6; Notation 1.10.1, pp.10–11: For a versal family of n-pointed genus-g curves (dominant étale to M_{g,n}, hyperbolic (g,n)) and unitary V on the punctured total space, every nonzero sub-local system of R¹π°_*V has rank at least 2g−2 rk V, so H⁰ vanishes when rk V<g.
- LL24, §6.1, proof of Theorem 1.7.1, p.32: Combines Lemma 6.1.1, the trace description of the derivative (Theorem 5.1.6) and Proposition 5.2.3 for the semistable canonical parabolic extension on a fibre.

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

Direct inputs: `HodgeStructuresPartII:H.4/sublocal-system-rank`, `mathlib:Representation`, `mathlib:Subrepresentation`, `mathlib:Module.finrank`, `StableReductionPartII:key/moduli-curves`, `HodgeStructuresPartII:H.2`.

Sources:

- LL24, Proof of Theorem 6.2.1, final paragraph, p.34: A nonzero invariant of R¹π°_*U⊗W gives a nonzero map W∨→R¹π°_*U, so Theorem 1.7.1 gives rk W≥2g−2 rk U and hence rk U·rk W≥g when g≥2.

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
5. Every graded invariant space vanishes; left exactness of invariants inductively gives zero invariants for (R¹π°_*Uᵢ)⊗Wᵢ. A flat section on a connected base vanishing at one point vanishes everywhere, so invariants pull back injectively along the dominant étale cover; descend the vanishing to M.

Direct inputs: `HodgeStructuresPartII:H.4/tensor-invariant-rank`, `HodgeStructuresPartII:H.2`, `mathlib:Representation.invariants`, `mathlib:Subrepresentation`, `StableReductionPartII:key/moduli-curves`, `HodgeStructuresPartII:H.2/gauss-manin`.

Sources:

- LL24, Theorem 6.2.1 and proof, p.34: For a local Artin ℂ-algebra A and a free A-local system on the punctured total space that is a constant deformation of a unitary system on one fibre, rank below g forces H⁰(M,R¹π°_*V)=0; proof by base change, the decomposition lemma and the maximal-ideal filtration.
- LL24, Lemma 2.4.2 and proof, pp.19–20: After a dominant étale base change, a constant unitary deformation on a fibre decomposes as a sum of total-space unitary systems tensored with free A-local systems pulled back from the base.
- LL-ERRATA, P04 erratum, entry for printed pp.844–845 (Lemma 2.4.2): Adds the hypothesis g≥1 to Lemma 2.4.2, needed by Corollary 2.3.5, and notes that Theorem 6.2.1 is nonvacuous only for g≥2.

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

Sources:

- LL22, Definition 2.1.1, pp.10–11: The flag runs from the whole fibre down to zero, so the graded dimensions telescope to the rank.
- LL22, Proof of Lemma 6.3.3, p.40: Uses that the graded dimensions at a mark, divided by the rank, sum to one, to bound the weight contribution by the largest weight.

Acceptance checks:

- For ℂ³⊋⟨e₂,e₃⟩⊋⟨e₃⟩⊋0 the graded ranks are 1,1,1 with sum 3; for ℂ²⊋0 the single graded rank is 2.
- For V=0 the empty sum is 0.

### inducedQuotient — degree_add

**inducedQuotient.degree_add** (lemma). For 0→F⋆→E⋆→Q⋆→0 induced from a saturated sequence, parDeg E⋆=parDeg F⋆+parDeg Q⋆.

The construction or proof proceeds as follows.

1. Ordinary determinant degrees and ranks add in a saturated locally free exact sequence, supplied by SF.3.
2. At each weight threshold, intersect and map the fibre flag. The resulting associated graded sequence is exact at each original weight, with compressed repetitions using the maximum convention.
3. Add the weighted graded dimensions to the ordinary degree equality.

Direct inputs: `HodgeStructuresPartII:H.4/induced-subbundle`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`, `mathlib:LinearMap.range`.

Sources:

- LL22, Lemma 2.4.5, p.14: States that parabolic degree of E⋆ is the sum of those of a subbundle with induced structure and the quotient with induced structure, citing Seshadri.
- LL22, §2.3, pp.13–14: Supplies the induced subbundle and quotient structures entering the additivity.

Acceptance checks:

- R4: the induced sub (weights 0,2/3) and quotient (weight 1/3) of ℂ³ with weights 0,1/3,2/3 add to 1; under the min-weight rule they would not.
- R5: O·e₂ (parDeg 1/2) and its quotient O with weight 0 add to parDeg(O⊕O, weights 0,1/2)=1/2.

### parabolicDegree — bounds

**parabolicDegree.bounds** (lemma). For a parabolic bundle E⋆ of rank r>0, deg E≤parDeg E⋆. If n>0, parDeg E⋆<deg E+n r; if n=0, parDeg E⋆=deg E.

The construction or proof proceeds as follows.

1. Every graded multiplicity is nonnegative and its coefficient lies in [0,1).
2. At each mark the sum of graded multiplicities is r by weighted-graded-rank-sum, so the contribution is strictly below r for r>0. Sum over the n marks; at n=0 there is no contribution.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/weighted-graded-rank-sum`.

Sources:

- LL22, Lemma 6.3.3 and proof, p.40: Bounds the difference between parabolic and ordinary slope by n times the largest weight, with equality exactly when all weights coincide; since weights are below one this gives the node's bounds.
- LL22, Proof of Lemma 6.3.4, p.41: Notes the difference is at most n and strictly less when n>0 because every weight is below one.

Acceptance checks:

- A line with weight a at one mark has parDeg−deg=a∈[0,1); with n marks all of weight α the excess is exactly nrα (equality case of LL22 Lemma 6.3.3).
- At rank zero the strict upper bound fails (0<0), so the positive-rank hypothesis is necessary.

### parabolicDegree — twist

**parabolicDegree.twist** (lemma). Twisting by an ordinary line bundle L with trivial parabolic structure adds rank(E) deg L to parDeg.

The construction or proof proceeds as follows.

1. Ordinary tensoring with a line preserves each marked fibre flag up to its canonical fibre identification, hence preserves all weighted multiplicities.
2. Determinant degree increases by r deg L. Add the unchanged weight contribution.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`, `HodgeStructuresPartII:H.4/parabolic-twist`.

Sources:

- LL22, Definition 2.6.3 and Lemma 2.6.5, p.15: Defines the parabolic tensor product of filtered bundles and states its degree is deg E⋆·rk F⋆+deg F⋆·rk E⋆; for F⋆ a line bundle with trivial structure this is the node.

Acceptance checks:

- A degree-d line with weight 1/4 twisted by O_C(x) has parDeg d+5/4.
- A rank-two bundle twisted by L of degree 3 gains 6, not 3.

### IsParabolicallySemistable — quotient_iff

**IsParabolicallySemistable.quotient_iff** (lemma). Let E⋆ have positive rank. E⋆ is parabolically semistable if and only if every locally free quotient q:E→Q of positive rank (equivalently, with saturated kernel), with the induced quotient structure, satisfies μ⋆(Q⋆)≥μ⋆(E⋆).

The construction or proof proceeds as follows.

1. For an induced saturated sequence, use degree and rank additivity.
2. The inequality parDeg F/rank F≤parDeg E/rank E is equivalent, by multiplying the positive ranks, to parDeg E/rank E≤parDeg Q/rank Q.
3. Include the identity quotient as equality. Zero quotients are excluded from division.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-semistability`, `HodgeStructuresPartII:H.4/parabolic-degree-add`, `HodgeStructuresPartII:H.4/parabolic-slope`.

Sources:

- LL22, Lemma 2.4.5 and proof, p.14: Deduces from degree additivity that semistability (or stability) is equivalent to every quotient with induced structure having slope at least (or greater than) that of E⋆, by cross-multiplying ranks.

Acceptance checks:

- R5: the quotient O⊕O→O killing O·e₂ has weight 0 and μ⋆=0<1/4, detecting non-semistability.
- For a rank-one bundle the only nonzero quotient is the identity, and the criterion holds with equality.

### parabolicDual — degree

**parabolicDual.degree** (lemma). parDeg(E⋆∨)=−parDeg(E⋆).

The construction or proof proceeds as follows.

1. At weight zero, ordinary duality negates degree without a normalized divisor shift. At positive α with multiplicity m, normalization changes underlying dual degree by −m and supplies weight 1−α.
2. The net contribution at that factor is −m+(1−α)m=−αm. Add over the marked graded factors and use the negated determinant degree.

Direct inputs: `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/parabolic-degree`, `SchemeAndStackFoundations:SF.3`.

Sources:

- LL22, Lemma 2.6.5, p.15: States that the parabolic degree of the parabolic dual is the negative of the parabolic degree.
- LL22, Definition 2.6.1 and Lemma 2.6.2, p.15: Describe the dual's filtration via the coparabolic filtration twisted by −D, which is the local computation in the proof steps.

Acceptance checks:

- R3: the rank-two bundle with weights 0,1/4 (parDeg 1/4) has dual of parDeg −1/4 with underlying degree −1.
- For the trivial structure the dual has parDeg −deg E.

### coparabolicZero — rank

**coparabolicZero.rank** (lemma). rank Ē₀=rank E.

The construction or proof proceeds as follows.

1. On the formal disc, choose a basis adapted to the zero-weight flag. Replace its zero-weight basis vectors by t times themselves and leave the other basis vectors unchanged.
2. This is a free lattice of the original rank. Rank is unchanged away from D; glue with the local elementary-modification comparison supplied by SF.3.

Direct inputs: `HodgeStructuresPartII:H.4/coparabolic-zero`, `SchemeAndStackFoundations:SF.3`, `mathlib:Module.finrank`.

Sources:

- LL24, §5.2.1, p.30: Defines Ê₀ as a kernel of E onto skyscraper quotients at the zero-weight marks; such a kernel agrees with E away from D, hence has the same rank.
- LL22, Definition 2.2.8, p.13: Defines the coparabolic filtration as unions of the E_β, all of which agree with E away from D.

Acceptance checks:

- For the trivial structure Ê₀=E(−D) has rank rank E.
- Ê₀ restricted to C∖D equals E restricted to C∖D.

### traceSectionMap — kernel_sections

**traceSectionMap.kernel_sections** (lemma). ker μ_v=H⁰(C,ker B_E(v,−)).

The construction or proof proceeds as follows.

1. The section map is the global-section map of the sheaf morphism B_E(v,−).
2. Global sections preserve kernels by left exactness, so a global section maps to zero precisely when it is a section of the sheaf kernel. No surjectivity onto the target sheaf is required.

Direct inputs: `HodgeStructuresPartII:H.4/trace-section-map`, `SchemeAndStackFoundations:SF.3`.

Sources:

- LL24, Proof of Proposition 5.2.3, p.31: Sets U to be the kernel of the sheaf map induced by B_E(v,−) and uses that the section map's rank equals h⁰(E^∨⊗ω_C)−h⁰(U), which rests on this kernel identity.

Acceptance checks:

- For E=O_C⊕O_C and v=(v₁,0), v₁≠0, ker μ_v=0⊕H⁰(K_C)=H⁰(ker f_v).
- For E=O_C and v≠0 both sides are zero.

## Supplier requests and completion obligations

### Request 1 — SchemeAndStackFoundations:SF.3

Finite locally free bundles on a smooth proper connected complex curve; determinant degree, rank/degree additivity for saturated exact sequences, fibrewise injectivity for saturated subbundles, local elementary modifications and their length-degree formula; the residue theorem deg E=−Σ tr Res for a logarithmic connection (equivalently for its determinant line). Coherent curve cohomology finiteness, genus h¹(O), deg K=2g−2, and vector-bundle Riemann–Roch h⁰(E)−h¹(E)=deg E+(1−g)rank E. Integrate the line-bundle route already owned by AlgebraicCurves/JacobianChallenge; do not equate line Clifford with vector Clifford.

Consumers: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/trace-section-map`, `HodgeStructuresPartII:H.4/dual-twist-semistable`, `HodgeStructuresPartII:H.4/coparabolic-dual-twist`, `HodgeStructuresPartII:H.4/parabolic-clifford-rank`, `HodgeStructuresPartII:H.4/parabolic-degree-add`, `HodgeStructuresPartII:H.4/parabolic-twist-degree`, `HodgeStructuresPartII:H.4/parabolic-dual-degree`, `HodgeStructuresPartII:H.4/coparabolic-rank`, `HodgeStructuresPartII:H.4/trace-kernel-sections`, `HodgeStructuresPartII:H.4/unitary-parabolic-semistable`, `HodgeStructuresPartII:H.4/parabolic-twist`.

### Request 2 — HodgeStructuresPartII:H.2

Extend HodgeStructuresPartII:H.2/gauss-manin (R^q f_* of a coefficient local system on the complement of a relative SNC boundary, as a local system) to coefficient systems carrying an action of a finite-dimensional commutative ℂ-algebra A (locally constant sheaves of finite free A-modules): R¹π°_* is again locally constant with an A-action, compatible with finite direct sums, and satisfies the projection formula R¹π°_*(U⊗π°*W)≅(R¹π°_*U)⊗W for a base local system W. Injectivity of the pullback of invariant sections along a dominant map from a connected base is elementary and is a proof step of artinian-vanishing, not part of this request.

Consumers: `HodgeStructuresPartII:H.4/artinian-vanishing`.

### Request 3 — HodgeStructuresPartII:H.2

Define unitary complex local systems: finite-rank local systems whose monodromy preserves a positive definite Hermitian form, equivalently has relatively compact image (LL24 Notation 1.10.2); independence of base point; closure under direct sums, duals, tensor products, pullback and sub-local systems; complete reducibility. H.2's unitary-curve-fiber, unitary-curve-family and unitary-bigrading already use the notion. H.4 and H.5 build on it, so the owner must precede H.4; HodgeStructuresPartII:H.5/unitary-representation, which comes after H.4, then imports the notion instead of defining it.

Consumers: `HodgeStructuresPartII:H.4/unitary-parabolic-semistable`, `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/sublocal-system-rank`, `HodgeStructuresPartII:H.4/tensor-invariant-rank`, `HodgeStructuresPartII:H.4/artinian-vanishing`.

### G1 — Ordinary vector-bundle HN and Clifford foundations

The curve roadmaps plan, but the libraries at the pinned baseline do not contain, line-bundle Riemann–Roch and Clifford (tauceti:TauCetiRoadmap/AlgebraicCurves layer 5; JacobianChallenge layer B, whose scheme-level Riemann–Roch the library audit marks partial). They do not plan the needed ordinary vector-bundle HN existence, saturated maximal-slope subbundles, semistable Hom vanishing, generic global generation (LL22 Definition 6.1.3) and its lower HN slope bound, or BPGN97 Theorem 2.1. The full primary Clifford induction was read: split a special semistable bundle by a maximal-slope proper subbundle and apply line Clifford by induction. These generic statements need an Algebraic curves Part II owner (proposal below), including the HN version h⁰(W)≤deg(W)/2+rank W for slopes in [0,2g]. Until it has stages/nodes, no invented supplier id is used. The same ordinary Harder–Narasimhan theory for bundles on a smooth projective curve over a finite field is routed to GlobalShtukasAndFunctionFieldLanglands:GS.0 (PAPER-YU-23 items 026 and 126, PAPER-SCHIFFMANN-16 item 14), and the abstract formalism (PAPER-FARGUES-FONTAINE-18 items 590–600) has no owner; the owner proposed here should plan Harder–Narasimhan existence, uniqueness, saturation and semistable Hom vanishing once, over an arbitrary base field, for both H.4 and GS.0 to import.

Needed by: `HodgeStructuresPartII:H.4/parabolic-clifford-rank`.

### G2 — Fibre-unitary isotypic decomposition supplier

LL24 Lemma 2.4.2 with g≥1, after a dominant étale base change retaining a chosen fibre, supplies V≅⊕Uᵢ⊗π°*Wᵢ with total-space unitary Uᵢ and A-free Wᵢ. It uses finite-determinant irreducible fibre extensions (Corollary 2.3.5), Lemma 2.4.1(2), Schur evaluation and exact fundamental-group sequences. PAPER-LANDESMAN-LITT-24 routes this to MappingClassGroupsAndCanonicalRepresentations; no roadmap definition or exact stage/node exists in this checkout. Import its corrected statement once the design has supplied ids. Do not assume fibre unitarity implies total unitarity.

Needed by: `HodgeStructuresPartII:H.4/artinian-vanishing`.

### G3 — Analytic versal-family and classifying-map interface

The moduli stack of smooth n-pointed genus-g curves is the reserved key definition StableReductionPartII:key/moduli-curves, with the Deligne–Mumford theorem StableReductionPartII:MC.2/pointed-dm-theorem; those are cited, not rebuilt. Still unsupplied: the analytic realization of a family with a dominant étale classifying map M→M_{g,n}, the deformation/cotangent dictionary (T≅H¹(T_C(−D)), Ω¹≅H⁰(K²(D)), c_m* an isomorphism for étale c) which H.3 requests from StableReductionPartII:MC.2 for HodgeStructuresPartII:H.3/trace-period-derivative, and the exact homotopy sequence of a punctured versal family (LL24 Lemma 2.1.5) used with LL24 Lemma 2.4.2. These belong to the moduli and mapping-class-group owners; no private M_{g,n} is defined here.

Needed by: `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/sublocal-system-rank`, `HodgeStructuresPartII:H.4/tensor-invariant-rank`, `HodgeStructuresPartII:H.4/artinian-vanishing`.

### G4 — Global supplier carriers in suggested signatures

The suggested file elaborates native finite fibre flags, normalized numerical degree/slope, supplied subbundle-catalogue inequalities, local formal-disc coparabolic kernels, evaluation/section maps, numerical rank consequences and finite-filtration invariant vanishing. It omits unavailable global curve/sheaf, degree/cohomology, canonical extension, VMHS, versal-family and isotypic-decomposition carriers and hypotheses. Each affected declaration is explicitly mapped to its local or numerical portion; neither omitted geometry nor unitarity is replaced by an arbitrary proposition. Full supplier-based signatures and geometry-level tests remain necessary; successful elaboration is not a formalization of the global theorems. The formal-disc filtration model covers α≥0 at one mark; the API items and tests listed in prototypeMap.omittedSignatures need global carriers and have no declaration in the suggested file.

Needed by: `HodgeStructuresPartII:H.4/parabolic-bundle`, `HodgeStructuresPartII:H.4/induced-subbundle`, `HodgeStructuresPartII:H.4/induced-quotient`, `HodgeStructuresPartII:H.4/parabolic-degree`, `HodgeStructuresPartII:H.4/parabolic-slope`, `HodgeStructuresPartII:H.4/parabolic-semistability`, `HodgeStructuresPartII:H.4/coparabolic-zero`, `HodgeStructuresPartII:H.4/parabolic-dual`, `HodgeStructuresPartII:H.4/trace-section-map`, `HodgeStructuresPartII:H.4/ordinary-quotient-slope`, `HodgeStructuresPartII:H.4/dual-twist-semistable`, `HodgeStructuresPartII:H.4/coparabolic-dual-twist`, `HodgeStructuresPartII:H.4/parabolic-clifford-rank`, `HodgeStructuresPartII:H.4/trace-rank-bound`, `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/sublocal-system-rank`, `HodgeStructuresPartII:H.4/tensor-invariant-rank`, `HodgeStructuresPartII:H.4/artinian-vanishing`, `HodgeStructuresPartII:H.4/parabolic-degree-add`, `HodgeStructuresPartII:H.4/parabolic-degree-bounds`, `HodgeStructuresPartII:H.4/parabolic-twist-degree`, `HodgeStructuresPartII:H.4/parabolic-quotient-criterion`, `HodgeStructuresPartII:H.4/parabolic-dual-degree`, `HodgeStructuresPartII:H.4/coparabolic-rank`, `HodgeStructuresPartII:H.4/trace-kernel-sections`, `HodgeStructuresPartII:H.4/connection-parabolic-structure`, `HodgeStructuresPartII:H.4/unitary-parabolic-semistable`, `HodgeStructuresPartII:H.4/parabolic-twist`.

### G5 — Admissibility of the unitary curve VMHS without quasi-unipotence

LL24 Theorem 4.1.1 and Proposition 4.2.2 are used for an arbitrary unitary V, whose boundary monodromy on M need not be quasi-unipotent. HodgeStructuresPartII:H.2/unitary-curve-family and irreducible-evaluation state admissibility, and hence the fixed-part evaluation, only under quasi-unipotent boundary monodromy in H.2's finite-cover convention; the unrestricted statement is H.2 gaps G6 and G15 (real mixed Hodge modules). Until H.2 closes them, fixed-part-vector and the theorems built on it are planned for V satisfying H.2's hypothesis, and the full LL24 generality is this gap. No weaker admissibility is assumed silently.

Needed by: `HodgeStructuresPartII:H.4/fixed-part-vector`, `HodgeStructuresPartII:H.4/sublocal-system-rank`, `HodgeStructuresPartII:H.4/tensor-invariant-rank`, `HodgeStructuresPartII:H.4/artinian-vanishing`.

### G6 — Canonical-extension form of the Mehta–Seshadri semistability

Parabolic degree zero follows from the residue theorem (requested from SF.3). Semistability is proved in MS80 §1 for the parabolic bundle built from a unitary Fuchsian-group bundle; LL24 Remark 5.2.2 notes that identifying that bundle with the parabolic structure of the Deligne canonical extension is not immediate and cites Simpson 1990 Theorem 5; AHL19 Proposition 5.4 states the identification for complex polarized variations and refers its proof to Brunebarbe §7. Neither Simpson 1990 nor Brunebarbe is among the sources read for this layer. A formalization needs either that analytic comparison or a direct algebraic proof of semistability for the canonical-extension structure; its owner is the non-abelian Hodge development for open curves, which no layer plans. H.1 supplies the case D=∅ through its compact harmonic correspondence. The open-curve owner must come before H.4 in the roadmap order: HodgeStructuresPartII:H.5 depends on H.4, so placing the tame harmonic theory after H.4 would close a stage cycle.

Needed by: `HodgeStructuresPartII:H.4/unitary-parabolic-semistable`, `HodgeStructuresPartII:H.4/sublocal-system-rank`.

The requests and gaps are the precise follow-up. The SF.3 request supplies the ordinary curve interfaces every global statement uses. The two H.2 requests ask for the definition of unitary local systems, which H.2 already uses and which must precede H.4, and for the Artinian-coefficient extension of the Gauss–Manin local system. G1 needs an owner for ordinary Harder–Narasimhan theory and the vector-bundle Clifford theorem over an arbitrary base field, shared with GlobalShtukasAndFunctionFieldLanglands:GS.0. G2 waits for the design of MappingClassGroupsAndCanonicalRepresentations, whose stage holding LL24 §§1.10–2.4 must not require this layer. G3 lies with the moduli owner StableReductionPartII and, for the homotopy sequence of the punctured family, with the mapping-class-group owner. G4 is the global Lean boundary. G5 is inherited from H.2's admissibility convention. G6 needs the open-curve comparison of Mehta–Seshadri's bundle with the canonical extension (tame harmonic theory, or a direct algebraic proof of semistability), whose owner must be planned before H.4 because H.5 builds on H.4.

Once a supplier has a declaration matching the requested hypotheses and normalization, the consumer edge is replaced by that node id, and the supplier's proof closure is reviewed with the supplier. Until then this layer claims neither closure nor a completed global Lean signature. None of the gaps is an unlisted prerequisite.

## Suggested signatures and what elaboration checks

The suggested file imports individual pinned Mathlib modules. Its native WeightedFlag records the decreasing submodules, endpoints, strict steps, increasing real weights and the half-open range, together with the threshold step of weight at least a and the weighted contribution. Degree and slope use the finite weighted graded dimensions. Induced constructions use native fibre maps with separate injectivity and surjectivity data. The supplied subbundle catalogue is a parameter: an arbitrary catalogue does not prove that all global saturated subbundles have been included, so the semistability tests check named subbundles, not the completeness of a catalogue. The ordinary degree is a supplied integer; its interpretation as a determinant degree needs the global curve comparison.

The coparabolic zero lattice and the filtration E_α (for α≥0) are modelled as submodules of the free formal-disc lattice over complex power series, specified by constant-coefficient conditions and powers of the parameter. The residue model of a logarithmic connection records the residue endomorphism of each marked fibre and builds its flag from generalized eigenspaces. Parabolic morphisms are fibre maps preserving every threshold step; twists, shifts, direct sums and duals keep their numerical and fibre data. The section map is a native bilinear map on supplied section spaces, and the trace pairing itself is H.3's. The suggested Artinian theorem uses native representations and stable subrepresentations to state invariant vanishing through a finite filtration.

The named geometric theorems keep their arithmetic or linear-factorization portion where the global supplier types are absent, and the file ends with an inventory of what each such declaration omits. A numerical slope identity is not a theorem of semistability preservation, a determinant-degree identity is not the canonical sheaf isomorphism, and a rank rearrangement is not the sub-local system theorem without its family and unitarity hypotheses. Sixteen packet names need global carriers and have no declaration in the suggested file; the packet lists them under `prototypeMap.omittedSignatures` and the file's inventory repeats them. No missing geometric condition is encoded as an opaque proposition. The file elaborates with `lean-check` at the pinned Mathlib, the only warnings marking unfinished proofs; elaboration checks the available signatures and native operations and does not formalize the global assertions.

## Sources and version discipline

- **LL24**: Aaron Landesman and Daniel Litt, [Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4). arXiv:2205.15352v4, 23 February 2025; preprint page numbers. Version of record: Annals of Mathematics 199 (2024), 823–897. Accessed 2026-10-07. SHA-256: `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`. Read: Theorem 1.7.1 and Notation 1.10.1, pp.6 and 10–11; §2.1 (Lemmas 2.1.4–2.1.5) and §2.4 (Lemmas 2.4.1–2.4.2), pp.13–20, decomposition proof and cited extension route; §§4.1–4.2, pp.24–27, VMHS and fixed-part interfaces; §§5.1–5.2, pp.27–31: Notation 5.1.1, Theorem 5.1.6, (5.5), §5.2.1, Remark 5.2.2, Propositions 5.2.3–5.2.4, Remark 5.2.5; §§6.1–6.2, pp.32–34, entire proofs; corrected by the author erratum.
- **LL22**: Aaron Landesman and Daniel Litt, [Geometric local systems on very general curves and isomonodromy](https://arxiv.org/pdf/2202.00039v3). arXiv:2202.00039v3; preprint page numbers. Version of record: JAMS 37 (2024), 683–729. Accessed 2026-10-07. SHA-256: `4f291599d8259d8084677c9f4325cc4329e7460d246ff0b311aa739da45763ab`. Read: §§2.1–2.4, pp.10–14: Definitions 2.1.1–2.1.2, Example 2.2.4, Definitions 2.2.8–2.2.9, §2.3 induced structures, Definitions 2.4.1–2.4.2, Lemma 2.4.5; §2.6, p.15: Definition 2.6.1, Lemma 2.6.2 (parabolic dual), Definition 2.6.3 and Lemma 2.6.5 (tensor product and degrees); Definition 3.3.1 and Proposition 3.3.2, pp.20–21, parabolic structure of a connection; §§6.1–6.3, pp.36–43: Definition 6.1.3, Lemmas 6.2.1–6.2.3, Proposition 6.3.1, Lemmas 6.3.3–6.3.5, Proposition 6.3.6 with complete proofs.
- **BPGN97**: L. Brambila-Paz, I. Grzegorczyk and P. E. Newstead, [Geography of Brill-Noether loci for small slopes](https://arxiv.org/pdf/alg-geom/9511003v1). arXiv:alg-geom/9511003v1, 6 November 1995; J. Algebraic Geometry 6 (1997), 645–669. Accessed 2026-10-07. SHA-256: `49a54383e147457176491d81c822ea334504c8d16964e38fb7c5cdf155d03bf8`. Read: §1 curve and characteristic conventions; Theorem 2.1 and entire induction proof, preprint p.9; Riemann–Roch line, p.10.
- **MS80**: V. B. Mehta and C. S. Seshadri, [Moduli of vector bundles on curves with parabolic structures](https://repository.ias.ac.in/20407/1/305.pdf). Mathematische Annalen 248 (1980), 205–239; journal page numbers. Read in the Indian Academy of Sciences repository copy of the published article. Accessed 2026-10-08. SHA-256: `f039f19dc7a507301572930bbc54e3a94cf7dac2449f7cdebed098a3ef7dd7b9`. Read: §1, pp.208–216: Definitions 1.5–1.8, Proposition 1.9, Corollary 1.10, Definition 1.11, Propositions 1.12 and 1.15, Definition 1.13, Remark 1.16.
- **AHL19**: Donu Arapura, Feng Hao and Hongshan Li, [Vanishing theorems for parabolic Higgs bundles](https://arxiv.org/pdf/1801.02562v3). arXiv:1801.02562v3; preprint page numbers. Version of record: Mathematical Research Letters 26 (2019), 1251–1279. Accessed 2026-10-08. SHA-256: `311c64078d22ac5d34ff9754dfa529fa059af958ddf863e0346771a3e52ec5ea`. Read: §4, Proposition 4.1, pp.7–8; §5, Definitions 5.1–5.2, Theorem 5.3, Proposition 5.4, Corollary 5.5, pp.10–12.
- **LL-ERRATA**: Aaron Landesman and Daniel Litt; posted by Daniel Litt, [Author-posted errata: Canonical representations of surface groups and Geometric local systems](https://www.daniellitt.com/published-paper-reviews.html). Author erratum sections P04 and P05, accessed 7 October 2026. Audit/review text is not used as mathematical authority. Accessed 2026-10-07. SHA-256: `c382f55815ca3e6f01a3b1abf60d8d06161f8734876e9aaf887c5dc4143a6032`. Read: P04 author erratum: printed pp.844–845, Lemma 2.4.2; p.860 replacement proof of Lemma 6.1.1; P05 author erratum screened for corrections affecting §§2 and 6.2–6.3; none listed.
- **MATHLIB**: The Mathlib community, [Pinned Mathlib module and local-algebra source interfaces](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Accessed 2026-10-08. Read: Submodule, finrank, range, Representation, Subrepresentation, invariants, locally free sheaves and power-series coefficients; see baseline.declarations for exact files.

The author-posted erratum sections on Litt's page are used for corrected mathematics; the automated review and audit reproduced there are not mathematical authority. The published Annals landing page was accessible, but its full article was not served; no claim compares the public preprint with the version of record. The LL22 findings are scoped to arXiv v3, since the published JAMS proof was not collated. MS80 was read in the Indian Academy of Sciences repository copy of the published article. Simpson's 1990 paper and Brunebarbe's account, to which AHL19 refers the identification of Mehta–Seshadri's bundle with the canonical extension, were not read; that boundary is gap G6.

The following source issues determine the statements used here. Each has been checked at its locator.

- **E-H4-1** (misprint, affects the proof), LL24, Proof of Proposition 5.2.3 and Remark 5.2.5, arXiv v4 p.31. Printed: The source describes the object as stable in the parabolic sense. Correction: Use parabolically semistable and coparabolically semistable in these two passages. Reason: Dualization and twisting of a semistable bundle preserve semistability, not necessarily stability. Proposition 5.2.4 needs only semistability; O⊕O shows the distinction. Status: no published correction found. Verdict: confirmed.
- **E-H4-2** (error, affects a stated result), LL24, Lemma 6.1.1 statement, arXiv v4 p.33. Printed: v ∈ L_m. Correction: The proof gives v in a Hodge-homogeneous evaluation image L′ isomorphic to L, or simply a nonzero v∈F¹H_m, which is all Theorem 1.7.1 needs. Reason: The evaluation q⊗L→H can select a different inclusion of the same irreducible factor; a non-Hodge-compatible original inclusion need not contain that Hodge-homogeneous vector. Status: no published correction found. Verdict: confirmed.
- **E-H4-3** (error, affects the proof), LL24, Proof of Lemma 6.1.1, arXiv v4 p.33, displayed realification identity. Printed: The proof identifies R¹π°_* of the realification of V with the realification of H=R¹π°_*V. Correction: Use W_R=R¹π°_* realification(V) and project its complexification to H, as in the author replacement proof. Do not identify it with the minimal realification of H. Reason: If V has no real structure but its cohomology does, the minimal realification of cohomology has a different rank from the cohomology of the realification. The fixed-part argument must be applied to the latter. Status: Daniel Litt P04 author erratum, printed p.860, replacement proof of Lemma 6.1.1. Verdict: confirmed.
- **E-H4-4** (gap, affects a stated result), LL24, Lemma 2.4.2, arXiv v4 p.19. Printed: Lemma 2.4.2 is stated without a lower bound on the genus g. Correction: Add g≥1 to the decomposition lemma. Reason: Its proof invokes Corollary 2.3.5 with that hypothesis. The present nonzero vanishing application has positive rank<g, hence g≥2. Status: Daniel Litt P04 author erratum, printed pp.844–845; previously PAPER-LANDESMAN-LITT-24/E10. Verdict: confirmed.
- **E-H4-5** (misprint, affects the proof), LL22, Proof of Proposition 6.3.6, arXiv v3 p.42. Printed: > gc. Correction: In the intermediate goal use rank(V/N_t)>gc−δ (and ≥gc−δ for the nonstrict branch). Reason: The stated proposition and final application on p.43 retain −δ; dropping it would be a stronger assertion not proved by Lemma 6.2.3. Status: no published correction found. Verdict: confirmed.
- **E-H4-6** (misprint, affects the proof), LL22, Proof of Proposition 6.3.6, arXiv v3 p.43. Printed: 1 ≤ j ≤ t. Correction: The nonnegative HN slope conclusion holds for all 1≤j≤s, especially the residual indices t<j≤s. Reason: The smallest HN slope is nonnegative by generic global generation; monotonicity gives every slope nonnegative. The printed range covers only the discarded initial segment. Status: no published correction found. Verdict: confirmed.
- **E-H4-7** (misprint, affects nothing), LL22, Proof of Lemma 6.3.4, arXiv v3 p.41. Printed: The ε-shift W[ε]⋆ of a coparabolically semistable bundle of parabolic slope r+n is said to have parabolic slope r+n−ε. Correction: Its parabolic slope is r+n−nε, since shifting by ε lowers the parabolic degree by ε·rank at each of the n marks; the next line then gives μ(Q_ε)≥r−nε. Reason: With the left-continuous filtration and E_{α+1}=E_α(−D), the integral formula for parabolic degree gives par-deg(E[ε]⋆)=par-deg(E⋆)−ε·n·rank E; for one weight-zero line with two marks the shift has underlying O(−D) and weights 1−ε, parabolic degree −2ε. The argument only uses ε→0, so the conclusion stands. Status: no published correction found. Verdict: confirmed.
- **E-H4-8** (misprint, affects nothing), LL24, §5.2.1, arXiv v4 p.30, sentence after the definition of Ê₀. Printed: The lattice Ê₀ is called a subbundle of E. Correction: Ê₀ is a locally free subsheaf of E of the same rank (an elementary modification); its cokernel is a skyscraper of length Σ_{j∈J}dim(E_{xⱼ}/Eⱼ²), so it is not a subbundle in the saturated sense used for U in Proposition 5.2.4. Reason: For the trivial structure Ê₀=E(−D), whose inclusion into E is zero on the fibres over D. The rest of the argument uses only the local freeness of Ê₀. Status: no published correction found. Verdict: confirmed.

## Acceptance of the layer

A global implementation must preserve all of the following distinctions: real versus rational weights; maximum versus minimum weight under repeated intersections; ordinary versus coparabolic degree; zero versus positive normalized dual weights, and the extension structure of the dual fibre at marks carrying both; weights shifted by ε at every mark; section-map rank versus generic sheaf rank; semistability versus stability, and parabolic versus ordinary semistability; generalized versus ordinary residue eigenspaces; a chosen inclusion versus an isomorphic evaluation image; the cohomology of a realification versus a minimal realification of cohomology; total unitarity versus a constant unitary deformation on a fibre; versality versus an arbitrary curve family; Artinian rank strictly below g versus rank equal to g.

The pass is complete at target level with 30 nodes, 96 API items, 70 unit tests, 6 planets and 8 checked baseline declarations. H.4 is planned, not closed. Completion of G1–G6 and of the 3 supplier requests is the precise follow-up; the statements and routes recorded here are to be kept, with exact supplier nodes substituted as they become available.
