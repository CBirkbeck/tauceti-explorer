# Local invariant, maximal contact and coefficient ideals

This is the reader for **AlgebraicModuliForArithmeticGeometry:R09.7b**. Its output is a local resolution invariant with regular presentations of its strata, compatible with permissible transformations and the labelled exceptional history. R09.7c consumes those presentations and local descent estimates to choose global centres and prove termination.

The local mathematics already has accepted owners. The [aggregate R09.7 packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json) owns twenty-one targets assigned to this stage by the [accepted R09.7a supplement](../packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json); the supplement also owns the coefficient-completion comparison. This reader makes their contracts explicit for this stage. The [R09.7b packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7b.json) is an ownership manifest with **zero new nodes**, not a replacement plan for those declarations. The accepted packets and their independent reviews govern the imported statements; their older readers contain corrections still to be synchronized at assembly.

There are 22 imported targets: seven definitions, four constructions and eleven theorems, with 33 planning API items, 34 definition/construction tests and three existing planets. Every implementation remains unchecked. The stage is **planned**, not closed: the actual regular-coordinate/completion and geometric blowup interfaces below remain supplier obligations.

## Conventions and imported foundations

Work over a field k of characteristic zero, with smooth finite-type ambient schemes, coherent closed subschemes and finite labelled SNC boundaries. Numerical invariant statements are on **closed points**. At a closed point a the completed regular local ring is identified, with the requisite coordinate compatibility, with κ(a)[[X₁,…,Xₙ]]. The coefficient field is the residue field, including at non-rational points. Orders take values in ℕ∪{∞}; the order of the zero function or zero ideal is ∞, and that of a unit is zero. All finite marks are positive. Empty/all-zero presentations have infinite normalized order; marks zero are removed without dividing by them.

Below, `core/name` abbreviates the existing node id `AlgebraicModuliForArithmeticGeometry:R09.7/name`, and `supp/completion` abbreviates `AlgebraicModuliForArithmeticGeometry:R09.7a/coefficient-completion-comparison`. These are references, not new identifiers. The packet lists their unabbreviated ids and direct prerequisites.

Import nine supporting owners from R09.7a's foundational part of the aggregate:

| Owner | Exact interface used here |
| --- | --- |
| `core/regular-coordinates` | Actual regular étale coordinates, compatible residue-field completions, derivatives, restrictions and coordinate blowup charts on common opens. |
| `core/stalk-order` | The germ ideal and its maximal-ideal-power order; on formal smooth charts it agrees with the infimum of Mathlib's total-degree orders. |
| `core/snc-boundary` | Persistent birth labels for smooth Cartier hypersurfaces with distinct coordinate germs; simultaneous SNC with a presentation submanifold. |
| `core/marked-ideal` | A smooth presentation submanifold, coherent ideal and positive mark, or finitely many function/positive rational-mark pairs; cosupport is the simultaneous order inequalities. |
| `core/permissible-centre` | A smooth centre in cosupport, simultaneous coordinate form with the boundary, and ideal divisibility J⊆I_Cᵈ. |
| `core/controlled-transform` | If e is the new exceptional equation, J·𝒪=eᵈJ′; keep strict transform by saturation and weak transform by the actual centre order distinct. |
| `core/test-equivalence` | Equality of transformed cosupports and continuation conditions after the full pointed test class below. |
| `core/normalized-orders` | µ=min ord(hᵢ)/dᵢ, µ_H=min ord_H(hᵢ)/dᵢ, and finite ν=µ−Σµ_H; use a separate ∞ branch. |
| `core/orders-invariant` | For equal codimension, µ is determined by permissible/product tests; each labelled µ_H, hence ν, is determined by the restricted exceptional-test relation s*. |

The full test class consists of permissible controlled blowups; product with A¹ at (a,0), adding its zero section as artificial boundary; and exceptional blowups of an intersection of two boundary hypersurfaces, using pure pullback. In the last case choose the point above a lying on the strict transform of the specified second hypersurface. The restricted s* relation permits exceptional blocks following a product or preceding exceptional step: continue blowing the artificial/new exceptional against the strict transforms of one fixed old hypersurface at that pointed continuation. It is essential to keep the chosen point and the continuation conditions. Equal initial cosupports alone do not determine the normalized exceptional orders. These are the accepted owner contracts from BM1997 (4.3)–(4.4), Remark 4.5 and Definition 4.6, p. 242; Definition 4.10, pp. 243–244; Propositions 4.8 and 4.11, pp. 243–244, and their proofs, pp. 248–251.

Ordinary blowups, their universal property, Rees/relative-Proj construction, complement isomorphism and affine charts belong to **TauCetiRoadmap, StableReduction Layer 4**. Its arithmetic-surface resolution theorem does not supply characteristic-zero resolution in arbitrary dimension. A blowup is not assumed flat. Even a Cartier-centre blowup that is an isomorphism retains its born exceptional label and its controlled division.

## Contact and coefficient reduction

**Maximal contact — `core/maximal-contact`.** Suppose a finite integral-mark presentation has normalized order one at a. Choose an entry (f,d) of actual order d and a coordinate direction transverse to the remaining boundary with d-th derivative of f a unit. The (d−1)-st derivative gives an order-one equation z. Adjoining (z,1) preserves full test equivalence, and H=(z=0) is smooth, transverse to the remaining boundary, and contains the cosupport. Its continued transform contains the continued cosupport after the allowed tests. This is an existence assertion under those hypotheses, not a choice of contact for every marked ideal with arbitrary boundary. Source: BM1997 Proposition 4.12 and Remarks 4.13, p. 244; Example 4.16, p. 245; proof pp. 251–252.

**Coefficient presentation — `core/coefficient-presentation`.** On H take

cᵢq = ((1/q!)∂z^q fᵢ)|H, with 0≤q<dᵢ,

and retain the pairs (cᵢq,dᵢ−q), including zero coefficients. For a positive common integral mark D divisible by every reduced mark dᵢ−q, the coefficient ideal is generated by cᵢq raised to D/(dᵢ−q), with mark D. Rational marks are first cleared by the imported common-mark operation. The power and the mark both matter; the raw ideal of the coefficients is not this construction. Source: BM1997 Construction 4.18, Proposition 4.19 and Remark 4.20, pp. 246–247.

The planning API is:

- `coefficientPresentation_cosupport`: on H the coefficient inequalities describe precisely the original cosupport, under the contact hypotheses.
- `coefficientPresentation_commonMark`: passage to mark D uses exactly the exponents D/(dᵢ−q).
- `coefficientPresentation_transform`: in a permissible pivot chart with exceptional equation e, c′ᵢq=e^{−(dᵢ−q)}π*cᵢq; exceptional tests use pure pullback instead.

Checks C1–C3 retain the owner's three tests:

- `cusp_coefficient_weights`: (z²+x³,2) gives (x³,2),(0,1). With empty boundary the residual ratio is 3/2.
- `mixed_coefficient_weights`: (z³+x⁴z+y⁵,3) gives the nonzero pairs (y⁵,3),(x⁴,2). Mark six gives the ideal (y¹⁰,x¹²).
- `contact_pure_power`: (zᵈ,d) has all lower coefficients zero. Its coefficient ideal is zero. Including q=d would introduce a unit and destroy the cosupport.

**Dimension reduction — `core/coefficient-equivalence`.** With the contact hypotheses and the adjoined order-one pair, the coefficient presentation on H is fully test-equivalent to the presentation on N. This includes all continued cosupport points and the two different transform formulas above. The coefficient functions extend regularly on one sufficiently small common neighbourhood. Proof route: compare the Taylor order inequalities on contact, use the order-one pair to keep continued points on contact, then compute in permissible pivot charts; the contact pivot chart carries no continuing cosupport when its leading derivative is a unit. Treat an exceptional test separately. Source: BM1997 Proposition 4.19, p. 246, proof pp. 252–253. Invariance of µ alone cannot be invoked across different codimensions; that theorem has an equal-codimension hypothesis.

**Regular-to-completed comparison — `supp/completion`.** For regular coefficients on a common étale neighbourhood of a closed a, require actual compatible identifications of the completions of N and H with κ(a)[[z,y]] and κ(a)[[y]]. Under these maps, the completion of cᵢq equals the z^q coefficient of the completed fᵢ. Extension of the common-mark ideal is consequently the formal common-mark ideal with the same powers. Noetherian local faithful flatness reflects equality and ideal-power inclusion for these finitely generated regular ideals. The SF.0 contract supplies the coordinate maps, derivative/restriction compatibility and faithful-flat reflection. Formal coefficient differentiation by itself proves none of their existence. Source: BM1997 Lemma 3.5 and Remarks 3.6–3.7, pp. 233–234, and Construction 4.18, Proposition 4.19, Remark 4.20, pp. 246–247; the accepted supplement makes the comparison explicit.

Its theorem acceptance checks are C1, C3, and C4: for (z²+zy+y³,2) the lower pairs are (y³,2),(y,1), so mark two gives (y³,y²)=(y²). The linear coefficient must survive completion. The suggested file states the native factorial coefficient calculation and these algebraic examples; the supplier comparison remains part of the theorem's geometric obligation.

**Guarded residual presentation — `core/residual-presentation`.** After a common integral mark d, write hᵢ=M gᵢ with M=∏x_H^{dµ_H}. If 0<ν<∞, take (gᵢ,dν) and, when ν<1, adjoin (M,d(1−ν)); remove zero marks and clear positive rational marks. At ν=0 take (M,d). At ν=∞ use the zero presentation. There is no ∞−∞ calculation. Source: BM1997 Construction 4.23, Proposition 4.24 and Remark 4.25, pp. 247–248; proof p. 253.

- `residualPresentation_normalized`: the positive finite residual presentation has normalized order one.
- `residualPresentation_stratum`: inside the preceding stratum, its cosupport selects equality of the new residual order.
- `residualPresentation_sstar`: its s* class depends only on the preceding class and the labelled remaining boundary.

The checks distinguish all three finite branches:

- `residual_requires_guard`: for (x²(x+y),3), with boundary x=0, µ=1, µ_H=2/3 and ν=1/3. Keep both (x+y,1) and (x²,2). The residual line alone includes points with x≠0 that fail the monomial condition.
- `residual_monomial_terminal`: for (x²y³,2) with both axes in the boundary, ν=0; retain the monomial pair (x²y³,2).
- `residual_no_guard_above_one`: with only x=0 in that example, ν=3/2 and the residual pair is (y³,3). Do not add a negative-mark monomial pair.

## Hilbert–Samuel input in arbitrary codimension

**Initial diagram — `core/initial-diagram`.** In K[[X₁,…,Xₙ]], order exponents by lexicographic comparison of (|α|,α₁,…,αₙ). For a nonzero series take the least supported exponent; D(I) consists of those exponents for nonzero members of I. It is upward closed under addition by ℕⁿ and is the union of translates from finitely many minimal vertices. Source: BM1997 p. 238 and Corollary 3.19, pp. 238–239. The finite-vertex input uses the pinned finite-product well-quasi-order instance.

- `initialDiagram_upward`: α∈D implies α+β∈D for every β∈ℕⁿ.
- `initialDiagram_vertices`: the minimal vertices generate D by these translates.
- `initialDiagram_monomial`: a monomial-generated ideal has exactly the union of the generating translates.

Checks: `diagram_zero_and_unit` gives empty and full diagrams for zero and unit ideals; `diagram_xy` gives vertices (2,0),(1,1) for (x²,xy); `graded_lex_not_pure_lex` gives (1,0) for x+y², whereas pure lexicographic exponent order would give (0,2).

**Supported formal division — `core/formal-division`.** For ordered nonzero generators Fᵢ with leading exponents αᵢ, partition the exponent space into Δᵢ=(αᵢ+ℕⁿ) minus the preceding regions, and their complement Δ₀. Every G has a unique expression ΣQᵢFᵢ+R with αᵢ+supp(Qᵢ)⊆Δᵢ and supp(R)⊆Δ₀. When the Fᵢ represent the vertices of D(I), membership in I is equivalent to zero remainder and there is a unique reduced standard basis. Degree-compatible division preserves the order filtration with the appropriate generator shifts. Source: BM1997 Theorem 3.17, Remark 3.18 and Corollary 3.19, pp. 238–239. Construct by successively cancelling the least remaining term, then pass to the formal limit; the support partition forces uniqueness.

**Hilbert–Samuel function — `core/hilbert-samuel`.** For a Noetherian local ring (A,m), define H_A(ℓ)=length_A(A/m^{ℓ+1}), a finite natural number. In a smooth completed ambient chart this is the complement count #{α∉D(I):|α|≤ℓ}. Compare functions pointwise; the first entry is partially ordered, not ordered by the first degree at which two arbitrary functions differ. Source: BM1997 Remarks 1.3, pp. 213–214, Corollary 3.20, p. 239, and p. 220.

- `hilbertSamuel_completion`: actual local completion preserves H_A at every degree.
- `hilbertSamuel_diagram`: formal division identifies each value with the finite complement count.
- `hilbertSamuel_order`: H≤H′ means the inequality at every degree, and equality means equality at every degree.

Checks: `hilbertSamuel_smooth` gives choose(n+ℓ,n) for K[[X₁,…,Xₙ]]; `hilbertSamuel_double_point` gives 1 at degree zero and 2 thereafter for K[[x]]/(x²); `hilbertSamuel_nonrational_point` gives H(0)=1 at a degree-two closed point over ℚ, even though its residue field has ℚ-dimension two. Length is over the local ring, not over the original ground field.

**Stabilization — `core/hs-stabilization`.** In a fixed ambient dimension n, a pointwise nonincreasing sequence of Hilbert–Samuel functions realized by ideals of K[[X₁,…,Xₙ]] is eventually constant. This statement is not made for arbitrary numerical functions or rational words. The accepted owner imports Bierstone–Milman, *Uniformization of analytic spaces* (1989), Theorem 5.2.1, pp. 820–821; BM1997 p. 220 explicitly identifies this separate input. The independent review freshly checked the theorem and proof in the [author-uploaded public copy](https://www.researchgate.net/publication/255647609_Uniformization_of_Analytic_Spaces). Its argument is about upward diagrams in ℕⁿ: fix successive finite vertex prefixes along infinite subsequences, then use finite generation to contradict a strict decrease. The formal-ideal statement follows from the complement count and applies over any field; it does not require analytic convergence.

**Samuel certificate — `core/standard-certificate`.** Keep a chosen upward diagram, its ordered vertex-degree blocks, nested essential-variable blocks, generators fᵢ and cutoff K≥max dᵢ−1. The five conditions are: orders dᵢ equal the assigned vertex degrees; homogeneous division by each degree-block prefix has unique prescribed-support quotients and remainder; full ideal elements have the corresponding supported formal division; selected derivatives indexed by a vertex minus a coordinate have a unit Jacobian in each essential block and vanish on that block's coordinate subspace; and the specified derivatives of the remaining generators through cutoff K vanish in the earlier essential-variable ideal. These are the conditions of BM1997 (7.1)–(7.2), pp. 261–262, with all blocks and support conditions retained. A generating list of the right orders alone is insufficient.

More explicitly, write the essential coordinates as Z=(Z₁,…,Z_r), with a nested final block Z^ℓ of size r_ℓ for each vertex-degree prefix ending at s_ℓ. For each j choose i(j) and β_j with α_{i(j)}=β_j+e_j, supported in the appropriate essential block, and put g_j=∂^{β_j}f_{i(j)}. Condition (4) says that the corresponding g_j lie in (Z^ℓ) and det(∂g^ℓ/∂Z^ℓ)(0)≠0 for each block. Condition (5) says ∂_{Z^ℓ}^β f_i∈(Z^ℓ) whenever i>s_ℓ, β belongs to the projected diagram of that prefix, and |β|≤K. Conditions (2) and (3) use the disjoint division regions Δᵢ and their shifted quotient supports from formal division, for every homogeneous degree and every ideal element respectively.

The chosen division diagram need not be the actual graded-lex initial diagram. Conditions (1)–(3) identify its **complement-count function** with H_I. They do not identify the two diagrams. Source: Lemmas 7.3, 7.5 and 7.7, pp. 263–264.

- `samuelCertificate_generates`: supported division of all ideal elements implies generation by the fᵢ.
- `samuelCertificate_hilbert`: conditions (1)–(3) imply equality of the complement-count function and H_I, without asserting equality of diagrams.
- `samuelCertificate_finiteCheck`: for the monotone degree-block diagrams used in the construction, the homogeneous support requirements become bounded-degree matrix tests using finite-degree control.

Checks S1–S4 are `certificate_coordinate_ideal`, with (x,y), order-one generators and identity derivative Jacobian; `certificate_pure_power`, with z² and derivative 2z having a unit z-Jacobian in characteristic zero; `certificate_wrong_order`, rejecting the assigned degree one for x²; and `certificate_division_not_initialDiagram`, using I=(x+y) in ℚ[[x,y]] and chosen diagram generated by (1,0). The latter satisfies conditions (1)–(3) by division with remainder in ℚ[[y]], while the actual graded-lex leading exponent is (0,1). It tests only those three conditions, not the full certificate.

**Finite-degree control — `core/finite-degree`.** For the monotone upward diagrams used in the certificate construction, there is a diagram-dependent k(D) such that the prescribed supported multiples of homogeneous Hᵢ, together with complementary monomials, span every homogeneous degree ℓ≥k once they span one degree k≥k(D). The coefficient ring may be any commutative ring A with identity, and Hᵢ has the degree of its assigned vertex. Monotonicity means that, for i<j, moving the whole i-th exponent of any α∈D into its j-th exponent, leaving zero in position i, gives another member of D; arbitrary upward closure is insufficient. The bound is not simply the largest vertex degree. Source: BM1997 Theorem 8.1, Definition 8.3 and proof, pp. 273–275. Use the finite bounded parts of the partition and induction on coordinate slices to propagate the spanning statement. This lets a finite set of determinant-unit conditions control all degrees on one regular neighbourhood.

**Samuel jet ideal — `core/samuel-jet-ideal`.** At jet degree k, index rows by α with |α|≤k and columns by (i,β) with |β|≤k. The (α,(i,β)) entry is ∂^{α−β}fᵢ/(α−β)! when β≤α coordinatewise, and zero otherwise. Let r_k be the rank at the distinguished point. Let I°_S,k be generated by the (r_k+1)-minors and set I_S,k=Σ_{j≤k}I°_S,j. This uses finite matrices of regular functions, not a local-flattener carrier. Source: BM1997 Definitions 7.10, 7.13 and Remark 7.11, pp. 265–266; Remarks 9.1, pp. 275–276.

- `samuelJetIdeal_vanishing`: vanishing means H_x(j)≥H_a(j) simultaneously for all j≤k.
- `samuelJetIdeal_generatorIndependent`: changing coherent generators leaves this ideal unchanged, by the two Cauchy–Binet inclusions.
- `samuelJetIdeal_monotone`: I_S,k⊆I_S,k+1, retaining every lower-jet condition.

Checks: `jet_zero_ideal` gives the zero matrix and zero condition ideal for the zero ambient ideal; `jet_unit_ideal` gives zero quotient-jet dimension everywhere with no artificial singular stratum; `jet_double_origin` gives (x) at k=1 for f=x² at zero in characteristic zero, whereas a degree-zero jet alone misses the order-two condition.

**Determinantal/coefficient identity — `core/samuel-presentation-identity`.** Under all five certificate conditions, for k≥max dᵢ−1 the Samuel ideal equals the ideal of the contact/essential subspace together with derivatives of its coefficients cᵢγ of orders |β|<dᵢ−|γ|, for |γ|<dᵢ. The derivative bound is strict. Source: BM1997 Theorem 7.14 and proof, pp. 266–268, and Remark 9.5(1), p. 277. An invertible supported jet block gives one inclusion by minors; division with the remaining columns gives the converse. This supplies the infinitesimal stratum, not just its underlying points.

**Transform theorem — `core/samuel-transform`.** A smooth centre C contained in the Samuel stratum has **I_C⊇I_S**. Under its ordinary blowup the Hilbert–Samuel function of the strict transform does not increase. Equality holds exactly when the controlled certificate generators retain all their orders dᵢ. At equality they generate the strict ideal and retain the five conditions; the coefficient transforms divide by e^{dᵢ−|γ|}. Exceptional tests use pure pullback and preserve the certificate. Source: BM1997 Theorems 7.20–7.21, pp. 268–269, proofs pp. 270–273. Its finite-jet rank/division argument precedes the semicoherence theorem; the dependency chain must not use semicoherence to justify this theorem itself.

## Common regular presentations and the invariant

**Semicoherent presentation — `core/semicoherent-presentation`.** Around each closed point choose one Zariski open V, one regular presentation submanifold, finite regular functions and positive weights, labelled remaining boundary and compatible transform data. Their cosupport agrees with the selected invariant equality stratum on a neighbourhood where the value is bounded above by its value at the distinguished point. They encode the infinitesimal stratum and its continuation after permissible tests. Unrelated formal series chosen separately at every point do not meet this definition. Source: BM1997 Definitions 6.2 and 6.4, pp. 254–255.

- `semicoherentPresentation_restrict`: shrinking V restricts the entire certificate consistently.
- `semicoherentPresentation_stratum`: on that V the cosupport equals the designated equality stratum.
- `semicoherentPresentation_transform`: permissible transformations yield compatible regular presentations on their chart cover.

Checks: `semicoherent_hypersurface` uses the pair (f,d) on a fixed maximum order-d stratum; `semicoherent_common_open` uses the intersection of the finitely many denominator-unit opens for rational regular coefficients; `formal_only_is_insufficient` rejects independently supplied formal germs without common regular coefficients.

**Hilbert–Samuel semicoherence — `core/hs-semicoherence`.** For a coherent closed subscheme in the finite-type characteristic-zero setting, H on closed points is Zariski upper semicontinuous with locally finitely many values and has semicoherent presentations of its equality strata. Choose generic coordinates giving monotone diagrams; construct essential blocks with derivative-unit Jacobians; solve finite supported elimination by Cramer's rule; invert the finitely many denominators on a common open; apply finite-degree control to obtain all homogeneous support conditions; and use the determinantal/coefficient identity and transform theorem. Formal standard bases are not silently declared regular generators. Source: BM1997 Theorems 9.2, 9.4, 9.6 and Remarks 9.15, pp. 276–283.

No raw-local-length semicontinuity statement is being asserted on every scheme point. On A¹ over a field the generic point has field local ring while the closed points have one-dimensional regular local rings; their unshifted local Hilbert–Samuel functions already show the problem. The accepted SF.0 Jacobson finite-type bridge supplies the closed-point density needed for coherent scheme-level bad-locus/centre assertions. This bridge is an inherited dependency, not a new conclusion of the numerical theorem.

**Exceptional history — `core/exceptional-history`.** Follow a point's ancestors through a finite admissible tower. E¹ consists of surviving boundary components present at the earliest year in which its current first entry occurred. Remove that block. At the r-th step use the earliest year of the current prefix through ν_r to select surviving components from the remaining boundary; this gives Eʳ and s_r=#Eʳ. Keep birth years and strict-transform labels, and remove previous blocks before the next selection. Source: BM1997 Definitions 6.8 and 6.15 and Proposition 6.6, pp. 255–256, 259.

- `exceptionalHistory_disjoint`: old blocks are disjoint subsets of the current boundary.
- `exceptionalHistory_birth`: each block comes from the earliest attained prefix year, rather than only the current equations.
- `exceptionalHistory_stratum`: on a fixed prefix stratum, nearby old blocks are the incident members of the distinguished point's blocks.

Checks: `history_year_zero` gives no old components with empty initial boundary; `history_new_exceptional` keeps a first newly born exceptional out of E¹ if the first entry has stayed unchanged; `history_changes_centre` compares the year-four equation v₃²−v₁v₂² with the same equation supplied in year zero. Their hypersurface words are (2,0;0) and (2,0;3/2,0;1,0;∞), and their selected centres differ. Source: BM1997 Examples 2.1–2.2, pp. 226–228.

**Invariant word — `core/invariant-word`.** Store the realized Hilbert–Samuel function H, s₁, positive finite rational entries ν₂,…,ν_t and their nonnegative counters, followed by a separate terminal value ν_{t+1} equal to zero or ∞. Compare lexicographically, with pointwise partial comparison of H. Depth is bounded by ambient dimension. Let e₁ be the least degree from which H agrees with its eventual polynomial. Recursively e_r=max(e_{r−1}!,e_{r−1}!ν_r), with e_{r−1}!ν_r integral. These are certificates on realized values; arbitrary rational words are not well ordered. In the hypersurface notation replace H by order only through the hypersurface Hilbert–Samuel formula. Source: BM1997 Remarks 1.3, pp. 213–214, Theorem 1.14, p. 220, and Definitions 6.15–6.16, pp. 259–260.

- `invariantWord_prefix`: truncation retains the residual entries and counters in their order.
- `invariantWord_compare`: the first different comparable entry decides comparison, with incomparable H entries left incomparable.
- `invariantWord_terminal`: zero and ∞ are distinct terminal choices with zero smaller.

Checks: `word_multiplicity_tie` compares (2,0;5/2,0;1,0;∞)>(2,0;3/2,1;1,0;∞); `word_history_tie` changes the first differing s_r while fixing earlier entries; `word_terminal_zero_infinity` distinguishes the same prefix ending in zero and ∞. Neither terminal is encoded by an arbitrary finite residual.

**Recursive construction — `core/recursive-invariant`.** Start from a semicoherent Samuel presentation. Add the current old-block equations with mark one; choose contact; take coefficients; divide the common remaining-boundary monomial with the guard above. Read ν. Stop at zero or ∞. At a positive finite value normalize the residual presentation to order one, select the next old block at its prefix birth year, add that block's equations and repeat in smaller dimension. This terminates locally by exhaustion of dimensions.

For arbitrary codimension retain the source's padding: if the first presentation has codimension r in ambient dimension n and e=H(1)−1, insert (1,0) exactly e−(n−r)−1 times when n−r<e and reindex the next presentation as prescribed. If n−r=e, retain the first prefix. This prevents dependence on the chosen presentation codimension or ambient enlargement. Source: BM1997 Definitions 6.12–6.15, pp. 258–259, Remark 6.16, p. 260, and Remark 9.15, pp. 282–283.

- `resolutionInvariant_first`: the first entry is the actual local Hilbert–Samuel function.
- `resolutionInvariant_equivalent`: equivalent initial presentations with the same history give the same normalized word.
- `resolutionInvariant_hypersurface`: after the hypersurface Hilbert–Samuel identification, this agrees with the order-first construction.

Checks: `invariant_smooth_empty_boundary` reaches the smooth Hilbert–Samuel entry, s₁=0 and terminal ∞; `invariant_cusp` gives (2,0;3/2,0;∞) for z²+x³; `invariant_bm_example` gives (2,0;5/2,0;1,0;∞) for x₃²−x₁²x₂³ in year zero. Checks O1–O3 in the suggested file additionally pin zero/unit order and the cusp-chart warning: z²+x⁵ under z=xt becomes x²(t²+x³), so order can remain two after the first blowup.

**Invariant properties — `core/invariant-properties`.** The normalized word is independent of permitted presentations and smooth coordinate isomorphisms preserving labelled history. On the closed-point spaces of finite inv-admissible towers it is upper semicontinuous with locally finitely many values and does not increase under their blowups. Here inv-admissible means that each smooth centre has simultaneous normal crossings with the boundary and the complete invariant is locally constant on it (BM1997 (1.2), p. 213, and (6.7), pp. 256, 258–259). Permissibility for an isolated marked ideal alone does not supply this hypothesis. Any nonincreasing sequence of realized values in bounded dimension stabilizes. Strata and boundary are simultaneously unions of coordinate subspaces. A terminal-∞ stratum is smooth. For terminal zero, each irreducible stratum component Z equals S∩⋂_{H⊇Z}H. Source: BM1997 Theorem 1.14(1)–(3), p. 220, proofs pp. 259–260, extended by Theorem 9.6 and Remark 9.15, pp. 278–283. Recover normalized ratios by test sequences, induct on semicoherent prefixes and history, stabilize H, then use the recursive denominator/depth bounds.

Here “smooth coordinate changes” means coordinate isomorphisms in this interface. Arbitrary smooth-morphism functoriality requires a separate statement with the Hilbert–Samuel shift and ambient normalization proved; it is not inferred from BM1997's local-isomorphism theorem or from one product test.

## Monomial local descent

**Monomial data — `core/monomial-data`.** At terminal zero and common mark d write M=∏x_H^{dΩ_H}, with nonnegative rational Ω_H. At a point, cosupport means Σ_{H through a}Ω_H≥1. Choose an inclusion-minimal set I meeting that threshold: Σ_IΩ_H≥1 and Σ_IΩ_H−1<Ω_i for every i∈I. The centre is its boundary intersection together with the preceding fixed stratum equations. Define the auxiliary mass µ by summing the incident weights. A fixed terminal mark bounds its denominator. Source: BM1997 Construction 4.23, p. 247, and Theorem 1.14(4), p. 220, proof pp. 259–260.

- `monomialCentre_minimal`: minimality is equivalent to each single-component removal dropping the sum below one.
- `monomialWeight_transform`: the new exceptional weight in a pivot i-chart is Σ_IΩ_H−1; surviving old weights stay fixed.
- `monomialMass_denominator`: the common mark bounds denominators of transformed weights and their mass.

Checks: `monomial_two_axes` uses weights (1/2,1/2), whose minimal centre is the two-axis intersection and whose new weight is zero; `monomial_single_axis` uses weight 3/2, whose Cartier identity blowup changes it to 1/2; `monomial_nonminimal` rejects the pair for weights (1,1), because a singleton already meets the threshold.

**Augmented decrease — `core/monomial-decrease`.** Above a minimal monomial centre inv′≤inv. If the full word is unchanged, its pivot's replacement weight is nonnegative and strictly smaller than the removed pivot weight. Any other lost components only reduce the mass, so µ′<µ. Fixed denominators allow only finitely many such equal-word steps. At terminal ∞, blowing up the smooth full stratum strictly lowers the word. Thus local strict progress uses (inv,µ); it does not require multiplicity to drop at every blowup. Source: BM1997 Theorem 1.14(4), p. 220, proof pp. 259–260. Example 2.1, pp. 227–228, has equal terminal-zero words and masses 7/2,5/2,3/2. The suggested `monomial_pivot_drop` is the native rational inequality behind that geometric step. Global selection and termination remain the existing R09.7c owners.

## Baseline, suppliers and assembly acceptance

The pinned baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Nine Mathlib declarations were read at that pin for this pass:

| Declaration | Reused input |
| --- | --- |
| `MvPowerSeries.coeff` | Coefficient linear maps on finitely supported multi-indices. |
| `MvPowerSeries.order` | Total-degree order in extended naturals. |
| `MvPowerSeries.order_mul` | Additivity of order over a nontrivial commutative semiring without zero divisors. |
| `MvPowerSeries.pderiv` | Formal coordinate derivation. |
| `MvPowerSeries.coeff_pderiv` | Derivative coefficients equal the shifted coefficient times its new exponent. |
| `PowerSeries.constantCoeff_iterate_derivative` | The constant coefficient of the q-th derivative is q! times coefficient q. |
| `Pi.wellQuasiOrderedLE` | A finite product of well-quasi-ordered preorders is well quasi ordered; this is an instance. |
| `Module.length` | Extended-natural module length, specialized to finite local quotients. |
| `Matrix.det` | Determinants for finite square matrices over a commutative ring. |

These supply ingredients and native examples, not the missing resolution theory. The reviewed library audit marks R09.7b not built. Accepted blueprint plans provide the target ownership missing from the older A0-extension follow-up brief.

Current TauCetiRoadmap and library were inspected separately, read-only, including StableReduction's README and Suggested.lean, AlgebraicVectorBundles' README and relative-Spec signatures, and searches of the nine roadmaps newer than the atlas snapshot. Current Tau Ceti commit **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** has `Ideal.affineBlowup`, Rees-chart comparisons and `Scheme.IdealSheafData.IsEffectiveCartier`. Those must replace older adapters when packaging. They do not provide this local invariant. The current environment repository commit was **0d144d044dacebca17b654695b6f1ad58f159b27**; it is not the pinned Mathlib baseline.

No new request duplicates an accepted supplier request. This stage inherits three interfaces:

1. **SchemeAndStackFoundations:SF.0:** common regular étale coordinates, actual residue-field completion/quotient maps, compatible derivations and contact restriction, faithful-flat reflection for finite ideals and their powers, and the existing Jacobson finite-type closed-point bridge.
2. **StableReduction Layer 4:** ordinary blowup and pivot-chart comparisons, exceptional Cartier ideal, strict transforms and complement identifications, used through the nine foundational owners.
3. **SchemeAndStackFoundations:SF.3:** the native effective-Cartier local-equation and product/divisor bridge used by labelled SNC boundaries, with regularity of chart equations justified directly rather than by fictitious flatness.

Projective closure, analytification, global resolution outputs and stable-moduli covers are not required to formulate this local stage. Their existing R09.7c/d owners and supplier requests are unaffected.

Assembly acceptance requires exact import ids, all 33 API contracts and all 34 definition/construction tests above; the contact, coefficient-completion, Samuel transform, semicoherence, invariant and descent theorem checks; actual geometric supplier maps; correct pointed tests and birth history; and successful finite native examples. Preserve these three existing planets, without creating duplicate nodes: **Maximal contact**, **Resolution invariant**, **Coefficient completion comparison**.

The fixed WORKERS.md shape keeps the suggested file compact: no artificial heavy carriers, no development of a second theory, and no data-producing proof placeholders. The file states twenty native examples and one monomial pivot theorem; all proof bodies remain targets. It elaborated with only the expected proof-placeholder warnings. Passing elaboration checks statement types, not mathematical proofs.

## Sources and corrections

The source is Bierstone–Milman, [*Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*](https://mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Inventiones mathematicae 128 (1997), 207–302, the full published 96-page article. Locators above use printed pages. The portions freshly read on 2026-10-16 are recorded in the packet, with SHA-256 f01ebbb0591fa62f9b65c16ab54f35e7409cf4fb0abd1f01bf3bf9b59d87ecaf. The independent review additionally checked BM1997 Theorems 7.20–7.21 and their proofs through p. 273, and BM1989 Theorem 5.2.1 and its proof, pp. 820–821. The accepted owners retain their declaration ownership and open supplier boundaries. This is a target-oriented specification, not a source extraction or section-by-section synopsis.

Apply the two already confirmed source findings owned by the aggregate packet: **E1901**, the year-one parenthetical in Example 2.1, p. 226, must pull back x₁²x₂³ to obtain y₁³y₂³ after controlled square division; **E1902**, the end of the proof of Theorem 9.6, p. 282, must use |β|<dᵢ−|γ|, as Definition 7.9, p. 265, and Remark 9.5(1), p. 277, require. For c=t² marked two, the correct derivative ideal is (t²,2t)=(t); adding the second derivative makes it the unit ideal. The independent review freshly confirmed both corrections at those locators and recorded its verdicts on the imported findings. Their original ownership is retained; no duplicate erratum is created.
