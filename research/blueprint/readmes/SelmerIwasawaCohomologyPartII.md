# Selmer groups, continuous integral cohomology, and Iwasawa cohomology, Part II: p-adic height pairings and bi-extensions of cycles

This roadmap constructs heights of geometrically trivial algebraic cycles and proves a uniform finite-condition theorem for their mixed extensions. The construction starts with the parent’s Kummer completion, finite Bloch–Kato conditions and duality. Its geometric input is an actual localization diagram, with both marginal extensions and the full extension retained. Its main theorem says that suitable correspondences make all three extension classes crystalline on a strictly semistable model, under an explicit deeper-stratum localization hypothesis.

The plan has thirty targets in six layers. Every layer is planned at target level. The packet is a complete planning pass, with eight open supplier interfaces and one explicit proof-verification gap, G1. No layer is claimed closed and no target is claimed formalized. G1 concerns the canonical local height construction with exceptional quotients; the separate supported-comparison and crystalline bi-extension argument does not use it. The final completed-unit consequence does.

The parent is [SelmerIwasawaCohomology](SelmerIwasawaCohomology.md), especially L0, L1 and L4. Arithmetic level raising and adjoint Selmer vanishing are separate continuations: this issue’s permitted split assigns all 198 and 19 corresponding paper items to explicit proposed owners below. All fourteen height-route items have targets here. Their item-by-item disposition is in the packet.

## Conventions and build boundaries

Fix a prime p. The coefficient algebra L is a finite product of finite extensions of Q_p; assertions are interpreted componentwise. For inverse coefficient systems use a finite flat Z_p-algebra W and W_l=W/p^l. In geometric semistable calculations W instead denotes W(κ), with K₀ its fraction field; these two uses are distinguished by context. Rationalization means derived inverse limit followed by tensoring with L, and never silently gives the discrete topology. Cohomological shifts use differentials of degree +1.

For a smooth proper X/K of dimension n−1, complementary cycles have codimensions d,d′ with d+d′=n and 1≤d,d′≤n−1. The geometric cycle-class kernel is Z^d(X)^0_L; arithmetic cycle-class vanishing is a stronger condition. The supported construction admits singular cycle supports through enhanced localization and fundamental classes. Smooth-pair purity is not applied directly to a singular support. The main semistable theorem uses projective generic X and n<p. Zero cycles use split extension conventions rather than artificially nonempty supports.

A span X←f X₁→g X acts as f_*g*. Its support bound is S_t=f(g⁻¹S), and its transpose exchanges f,g. The correspondence algebra T is commutative for the localization statements. Its image on each relevant finite-dimensional cohomology sum is Artinian; T itself need not be finite-dimensional. A supported action has source U_t and target U. These are different coefficient objects.

The multiplicative coefficient group at a local field is the p-completion lim_m K×/(K×)^{p^m}, followed by tensoring with L. Its finite-condition subgroup at p is the image of completed O_K×. At ℓ≠p, completed units vanish after tensoring with L. The scalar trace-boundary normalization sends a uniformizer to −1, even though its valuation is +1. The global target Γ_{K,p} is the p-completed finite idele group modulo principal ideles and local units away from p. Its torsion is retained until tensoring. Each local term is sent to Γ before summing.

Generic period rings, log-convergent complexes, tube supports, residue complexes and weight spectral sequences retain their existing owners. In particular CR.6 supplies the supported log complexes, RD.4 the supported/positive weight sequences and density comparison, and PH R06.1 the completed semistable period rings and Frobenius-restricted monodromy edge. Their exact node IDs occur below. The extra integral Kato/Sato maps and the smooth-open potential-semistability theorem are requested explicitly; a proper C_st comparison or a rational syntomic fiber does not imply those interfaces by itself.

The generic local Panchishkin condition and canonical mixed-extension heights belong here. NE.7 retains its equivariant Bockstein and leading-term applications, while NC.5 and GZ.9 retain curve-specific constructions and comparison theorems. This roadmap imports none of those higher height applications. Its package belongs after its geometric period and purity suppliers, rather than in the parent’s earlier tier.

The pinned baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Actual Submodule and LinearMap structure statements were read there. The reviewed parent audit is AUDIT-27 in data/library-coverage.json: L0 partly built and L1–L4 not built. Current upstream roadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were inspected independently of that older snapshot. LocalGaloisGroups already supplies local completions and Kummer infrastructure; the parent L0 is the import boundary. ProfiniteCohomology supplies the existing cochain carriers. No replacement is planned here.

## Layer order and proof route

| Layer | Objects and milestone | Main imported interface |
| --- | --- | --- |
| HP.0 | Geometric edge, supports, cycles and mixed extension | AG D7/R02.1; EDC.0/2/3; SF.5; MC.0 |
| HP.1 | Non-p index, Panchishkin splitting, finite AJ and global height | Parent L0/L1/L4; PH R06.2; CP.4; DWP.7; class field theory |
| HP.2 | Supported syntomic heart, rigid obstruction and cycle lift | PH R06.5; CR.6; RD.4 |
| HP.3 | Altered boundary period diagrams and kernel comparison | SF.4; PH R06.1/R06.5; CR.6; EDC.0 |
| HP.4 | Finite filtration, deeper-stratum ideal and finite supported AJ | RD.4; HP.2–HP.3; proper C_st |
| HP.5 | Localized finite-condition pushout and uniform full crystallinity | PH R06.2; parent finite condition; HP.4 |

HP.0–HP.1 give the height library. HP.2–HP.5 give the geometric finite-condition theorem. For that theorem a cycle first has a supported syntomic lift with zero positive residue. A weight filtration then puts its rigid obstruction in a kernel killed by I^(4n−5). A strict-pair period comparison identifies a zero obstruction with a zero crystalline-valued edge after one finite extension. Three applications, first to the dual marginal cycle, then to the first marginal cycle, and finally to its supported lift off the second support, give the full extension. Its last descent obstruction is a valuation class in H¹(L(1))/H¹_f(L(1)); restriction is injective on this rational line. The argument does not assume general descent of potentially crystalline extensions.

For each target below the statement, hypotheses, proof route, prerequisites and source locator are part of the specification. API names are proposed names, not existing declarations. “Check” means an acceptance condition for the implementation; every definition and construction also has named discriminating unit tests.

## HP.0. Geometric classes and mixed extensions

Construct admissible geometric coefficient towers, the continuous geometric Hochschild–Serre edge with its fixed connecting-cocycle convention, finite étale span correspondences with support transport, geometrically trivial and V-restricted cycle domains, and the mixed extension of disjoint complementary cycles. Import raw cycles, enhanced localization, Poincaré trace and generic continuous-cochain/limit machinery; retain singular supports and distinguish geometric from arithmetic cycle-class vanishing.

**Coverage:** planned. Discharge the AG R02.1 site/continuous-limit extension and EDC.0 singular-support enhanced localization requests; obtain SF.5 raw cycle operations.

### Admissible geometric coefficient towers

**Target:** `SelmerIwasawaCohomologyPartII:HP.0/admissible-geometric-tower` · definition · planet: Admissible coefficient towers

Let G act continuously on a site S and W be finite flat over Z_p, W_l=W/p^l. A bounded-below equivariant derived W_l-tower C is admissible if every H^q(S,C_l) is a discrete continuous G-module and R¹lim_l H^q(S,C_l) is killed by a power of p, for every q. Put C_L=(Rlim_l C_l)⊗_W L for a finite product L of p-adic fields with a W-algebra structure. Its geometric cohomology is canonically (lim_l H^q(S,C_l))⊗_W L, with the inverse-limit topology followed by rationalization; the displayed isomorphism is part of the interface, not a discrete topology on its right side.

**Hypotheses and conventions.** The derived inverse limit is taken before inverting p; the finite-exponent bound may depend on q. G-equivariant sheaves and their continuous derived global sections are imported from the arithmetic-duality supplier.

**Construction or proof.**

1. Use the supplier Milnor sequence to identify the possible obstruction as R¹lim H^{q−1}.
2. A p-power torsion obstruction disappears after tensoring with L; retain the inverse-limit topology for the cochain comparison.

**Uses.** DL24 Lemma A.4: Justifies continuous rather than discrete group cohomology after inverse limits. DL24 Lemma B.21 and diagram (B.40): Controls the barred period complexes and the connecting cocycles.

**API.**

- `TauCeti.Selmer.Height.AdmissibleTower.cohomology` (projection): The topological geometric cohomology is (lim H^q(C_l))⊗_W L.
- `TauCeti.Selmer.Height.AdmissibleTower.of_mittagLeffler` (constructor): Discrete cohomology towers with the Mittag–Leffler property are admissible.
- `TauCeti.Selmer.Height.AdmissibleTower.map` (functoriality): A morphism of admissible towers induces continuous equivariant maps on rational cohomology, respecting identity and composition.
- `TauCeti.Selmer.Height.AdmissibleTower.exact_triangle` (compatibility): In a distinguished triangle, verify the finite-exponent R¹lim condition for the third object from the two others when the corresponding cohomology exact sequences supply the required uniform torsion bounds; no unconditional closure under arbitrary limits is asserted.

**Unit tests.**

- `TauCeti.Selmer.Height.admissible_constant_finite` (example): A constant finite W/p^a-module in degree zero is admissible and its rational cohomology is zero.
- `TauCeti.Selmer.Height.admissible_lattice` (compatibility): The tower W/p^l with surjective transitions has rational H^0=L, with its p-adic topology.
- `TauCeti.Selmer.Height.admissible_liminf_obstruction` (non-example): A tower with R¹lim H^q containing a non-p-power-torsion element fails the finite-exponent condition; degreewise discreteness alone cannot certify it.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `ArithmeticGaloisDuality:D7/admissible-coefficients`; `ArithmeticGaloisDuality:R02.1/milnor-sequence`; `ArithmeticGaloisDuality:D7/derived-tensor-and-tor`.

**Sources.** DL24, Definition A.3, p. 322; Lemma A.4, pp. 322–323. Specifies the rationally admissible inverse systems used for the site version of the edge map.

### Geometric Hochschild–Serre edge map

**Target:** `SelmerIwasawaCohomologyPartII:HP.0/geometric-hochschild-serre-edge` · theorem · planet: Geometric Abel–Jacobi edge

For an admissible tower C there is a functorial first-quadrant, degreewise convergent spectral sequence H^a_cont(G,H^b(S,C_L)) ⇒ H^{a+b}_G(S,C_L), with the usual shift if C is only bounded below. Define H^q_G(S,C_L)_0 as the kernel of the geometric forgetful map to H^q(S,C_L). The filtration edge gives ε_C:H^q_G(S,C_L)_0→H¹_cont(G,H^{q−1}(S,C_L)). Its image lies in E₂^{1,q−1}; ε is not asserted injective on the whole kernel.

**Hypotheses and conventions.** C is admissible as defined above; cohomology is continuous for the limit topology. For general finite flat W, restrict scalars to Z_p before rationalization, then restore W/L-linearity.

**Construction or proof.**

1. Apply the D7 Grothendieck spectral sequence to geometric sections followed by G-invariants on discrete finite-level equivariant sheaves.
2. Use acyclic equivariant resolutions and the requested continuous inverse-limit comparison, rather than the group-quotient spectral sequence alone.
3. The vanishing in filtration degree zero identifies the kernel with filtration F¹; project F¹→F¹/F²=E∞^{1,q−1} and include this subspace in E₂^{1,q−1}.

**Check.** For C concentrated geometrically in degree zero, the degree-one edge is the usual continuous H¹ identification. In degree two, F² need not vanish, so the edge is allowed to have a kernel.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/admissible-geometric-tower`; `ArithmeticGaloisDuality:D7/grothendieck-spectral-sequence`; `ArithmeticGaloisDuality:D7/continuous-derived-cochains`; `ArithmeticGaloisDuality:R02.1`.

**Sources.** DL24, Lemma A.4, pp. 322–323. Constructs the geometric site spectral sequence and its first edge on the geometric kernel.

### Connecting cocycles with fixed signs

**Target:** `SelmerIwasawaCohomologyPartII:HP.0/triangle-edge-cocycle` · lemma

In a distinguished triangle A→B→C→A[1] of admissible objects, represent the triangle by compatible cochain complexes with differentials of degree +1. Let b∈Z^q(B)^G and choose c∈C^{q−1} with dc=νb and a=b−dy∈Z^q(A), where y lifts c to B. Then the projected edge of ν[b] is represented by g↦gc−c in H^{q−1}(C)/im H^{q−1}(B). Under the connecting map δ([z])=[d(lift z)] its value is [a−ga]. Equivalently it is ga−a after choosing the connecting map −δ. State the sign whenever this description is used.

**Hypotheses and conventions.** The image of ν[b] in geometric H^q(C) is zero. An equivariant acyclic resolution gives a representative b that is G-fixed; replace the original complexes by that resolution if necessary. Replace the triangle by a degreewise split short exact sequence of cochain complexes before choosing y; compatible derived maps alone do not specify a cochain lift.

**Construction or proof.**

1. Choose y and compute a=b−dy, then d(gy−y)=a−ga.
2. Changing y or c changes the displayed cochain by the appropriate coboundary or the image from H^{q−1}(B).
3. Pass through the geometric edge and the quotient; use −δ in the shifted −N monodromy triangle consistently.

**Check.** A two-term complex with a nontrivial connecting map detects reversal of δ; both normalized formulas must give the same kernel comparison. The formula descends through im H^{q−1}(B).

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/geometric-hochschild-serre-edge`.

**Sources.** DL24, Lemma A.5, pp. 323–324; use in (B.40), pp. 367–368. Extracts the triangle calculation with an explicit cohomological convention, avoiding reliance on the typographical slips in the printed representatives.

### Finite étale correspondences and support transport

**Target:** `SelmerIwasawaCohomologyPartII:HP.0/etale-correspondences-with-support` · definition · planet: Étale correspondences

For a scheme X take isomorphism classes of spans X←f X₁→g X with both legs finite étale, composed by fiber product. EC(X) is their unital integral monoid algebra. A ring T of correspondences is a commutative L-algebra with a unital L-algebra homomorphism into EC(X)⊗L. For a basis span set S_t=f(g⁻¹S), t∨=(g,f), and t*=f_*g* on cycles and cohomology. For a finite formal sum, define S_t by the union over its nonzero coefficients. If 𝒰⊆𝒳 is open, set 𝒰_t=𝒳∖(𝒳∖𝒰)_{t∨}; then t* transports proper-support cohomology from U_t to U. Cancellation can make this support bound strict.

**Hypotheses and conventions.** L is a finite product of p-adic fields. The commutative T convention is used for maximal ideals and localizations in HP.4–HP.5; noncommutative localization is outside this target.

**Construction or proof.**

1. Use finite étale base change and trace to define span composition and its action.
2. Extend linearly from the monoid algebra; do not impose a Chow-equivalence quotient on EC(X).
3. The transpose support condition ensures that a section supported properly in U_t pushes to one supported properly in U.

**Uses.** DL24 Theorem A.8: Requires saturation of both supports under every element of T. DL24 Lemma B.10 and Proposition B.11: Moves Abel–Jacobi classes between U_t and U.

**API.**

- `TauCeti.Selmer.Height.EtaleCorrespondence.diagonal` (constructor): The identity span acts as the identity and sends S to S.
- `TauCeti.Selmer.Height.EtaleCorrespondence.transpose` (data): Transpose swaps the legs, is involutive and reverses composition.
- `TauCeti.Selmer.Height.EtaleCorrespondence.act_comp` (functoriality): Composite spans act by the composite pull-push maps, with the induced nested support opens.
- `TauCeti.Selmer.Height.EtaleCorrespondence.support_bound` (compatibility): supp(t*c)⊆(supp c)_t; finite sums use unions and can have strict containment.
- `TauCeti.Selmer.Height.EtaleCorrespondence.trace_adjoint` (compatibility): For the Poincaré pairing, t* on one factor is adjoint to (t∨)* on the other.
- `TauCeti.Selmer.Height.EtaleCorrespondence.supported_map` (projection): There is a natural map H^q_c(U_t,L(r))→H^q_c(U,L(r)), agreeing with t* on the proper ambient scheme.

**Unit tests.**

- `TauCeti.Selmer.Height.span_identity` (example): For the diagonal, U_t=U and t*=id.
- `TauCeti.Selmer.Height.span_zero` (degenerate): The zero formal sum has empty support bound and sends every cycle to zero.
- `TauCeti.Selmer.Height.span_orientation` (compatibility): For a graph span, the action and support are f_*g*, not the reversed pull-push; transposition exchanges these roles.
- `TauCeti.Selmer.Height.span_cancellation` (non-example): For a nonzero span s, the support bound for s+(−s)=0 is computed after collecting coefficients; even a nonzero sum can act as zero on a particular cycle.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`; `MotivesAndAlgebraicCycles:MC.0/composition-compatible-with-action`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/compact-support-functoriality`; `SchemeAndStackFoundations:SF.5`.

**Sources.** DL24, §A.1, Notation A.1, pp. 320–321; §B.4 before Lemma B.10, pp. 343–344. Provides the precise support-sensitive correspondence algebra used by the uniform annihilators.

### Geometrically trivial cycles and Selmer-restricted cycles

**Target:** `SelmerIwasawaCohomologyPartII:HP.0/homologically-trivial-cycles` · definition · planet: Homologically trivial cycles

For X/K proper smooth of pure dimension n−1, let Z^d(X)^0_L be the kernel of the geometric class map Z^d(X)⊗L→H^{2d}(X_Kbar,L(d)). The geometric edge applied to the arithmetic cycle class defines AJ_X(c)∈H¹(K,H^{2d−1}(X_Kbar,L(d))). For V⊆H^{2d−1}(X_Kbar,L(d)), put Z^d_V(X)^0_L={c:AJ_X(c) lies in im H¹(K,V)}. A lift to H¹(K,V) is canonical only when H⁰(K,H/V)=0; HP.1 verifies that hypothesis in its geometric situation.

**Hypotheses and conventions.** Arithmetic cycle classes and refined classes are the EDC.3 objects. The geometric triviality condition is weaker than vanishing of the arithmetic class.

**Construction or proof.**

1. Take the kernel of the EDC.3 geometric cycle map, with its L-module structure.
2. Apply the geometric edge to the arithmetic cycle class and use naturality.
3. Define the V-restricted domain by inverse image; uniqueness follows from the Galois-cohomology exact sequence once H⁰(H/V)=0 is supplied.

**Uses.** DL24 §A.3: Supplies the two cycle classes used in the localization diagram. DL24 (A.5) and (4.8): Restricts the global height to prescribed cohomological summands.

**API.**

- `TauCeti.Selmer.Height.HomologicallyTrivialCycle.coe` (coercion): A cycle in the kernel forgets to its underlying codimension-d cycle.
- `TauCeti.Selmer.Height.HomologicallyTrivialCycle.abelJacobi` (projection): AJ is L-linear and natural for proper pushforward and smooth pullback with their degree/twist shifts.
- `TauCeti.Selmer.Height.HomologicallyTrivialCycle.rational_equivalence` (compatibility): AJ annihilates rationally trivial cycles, hence factors through CH^d(X)^0⊗L; supported mixed extensions are first constructed on disjoint cycle representatives.
- `TauCeti.Selmer.Height.HomologicallyTrivialCycle.restrictTo` (characterisation): The V-restricted subgroup is the inverse image of im H¹(K,V); if H⁰(K,H/V)=0 it has a unique AJ lift.

**Unit tests.**

- `TauCeti.Selmer.Height.cycle_divisor_degree` (example): For a geometrically connected smooth proper curve, the geometric kernel in codimension one is the degree-zero divisors.
- `TauCeti.Selmer.Height.cycle_zero` (degenerate): The zero cycle has zero Abel–Jacobi class and belongs to every V-restricted domain.
- `TauCeti.Selmer.Height.cycle_arithmetic_distinction` (non-example): A degree-zero divisor with nonzero Kummer class of its Jacobian point is geometrically trivial but its arithmetic class need not vanish.
- `TauCeti.Selmer.Height.cycle_V_zero` (characterisation): For V=0 the restricted domain is precisely ker AJ, not all geometrically trivial cycles.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/geometric-hochschild-serre-edge`; `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`; `EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`; `ArithmeticGaloisDuality:D7/continuous-derived-cochains`.

**Sources.** DL24, §A.3, pp. 324–326; §A.7, p. 330. Defines the cycle domains on which the mixed extensions and global height are evaluated.

### Mixed extension of disjoint cycles

**Target:** `SelmerIwasawaCohomologyPartII:HP.0/cycle-mixed-extension` · construction · planet: Cycle bi-extension

Let c∈Z^d(X)^0_L and c′∈Z^{d′}(X)^0_L, d+d′=n, with disjoint supports. For disjoint pure-codimension supports Z,Z′ choose κ_c:L→H_Z^{2d}(X_Kbar,L(d)) and κ_c′:H^{2d−2}(Z′_Kbar,L(d−1))→L, the refined cycle map and the trace pairing with c′. Pull back and push out the localization diagram along κ_c and κ_c′(1). This produces a mixed extension E(c,c′) with rows 0→L(1)→E_c′→H→0 and 0→L(1)→E(c,c′)→E_c→0 and columns 0→H→E_c→L→0 and 0→E_c′→E(c,c′)→L→0, where H=H^{2d−1}(X_Kbar,L(d)). It is independent up to canonical compatible isomorphism of the enlarged supports. Its three classes are AJ(c), AJ(c′) in H¹(K,H∨(1)), and e(c,c′)∈H¹(K,E_c′).

**Hypotheses and conventions.** 1≤d,d′≤n−1; zero cycles are handled by split extensions without requiring nonempty supports. Poincaré duality identifies H∨(1) with H^{2d′−1}(X_Kbar,L(d′)). The construction uses proper smooth X, as in A.7; A.3 states its projective case. Enhanced localization and Poincaré duality provide the same diagram without projectivity.

**Construction or proof.**

1. Use EDC localization, purity and Poincaré duality to obtain the four exact sequences in the A.2 diagram.
2. Geometric triviality makes κ_c land in the localization kernel and makes κ_c′ vanish on the image from X with twist d−1.
3. Pull back on the L endpoint and push out on the L(1) endpoint. Compare support enlargements through their union to obtain independence.
4. Compare the resulting connecting classes with the geometric edge using the fixed cochain signs.

**Uses.** DL24 Proposition A.7: Its lifted class defines the local index. DL24 Theorem A.8 and Remark A.15: Tests finite local conditions on the full extension, not only its two marginals.

**API.**

- `TauCeti.Selmer.Height.CycleMixedExtension.of_disjoint` (constructor): Disjoint geometrically trivial cycles give the mixed-extension diagram and its exact endpoint identifications.
- `TauCeti.Selmer.Height.CycleMixedExtension.first_class` (projection): The H-by-L extension has class AJ(c).
- `TauCeti.Selmer.Height.CycleMixedExtension.dual_class` (compatibility): The Tate-dual of E_c′ has Abel–Jacobi class AJ(c′), using the fixed Poincaré convention.
- `TauCeti.Selmer.Height.CycleMixedExtension.support_independent` (extensionality): Enlarging disjoint pure supports induces compatible isomorphisms of the full diagram, transitive under another enlargement.
- `TauCeti.Selmer.Height.CycleMixedExtension.baer_add` (relation): Addition of either cycle corresponds to Baer addition in the corresponding biextension variable whenever common disjoint supports exist.
- `TauCeti.Selmer.Height.CycleMixedExtension.transpose` (functoriality): Pull-push by a finite étale span in one cycle is adjoint to its transpose in the other, with supports transported by HP.0.

**Unit tests.**

- `TauCeti.Selmer.Height.mixed_zero_first` (degenerate): If c=0 then E_c=H⊕L and the lifted class e(c,c′) is zero.
- `TauCeti.Selmer.Height.mixed_zero_second` (degenerate): If c′=0 then E_c′=L(1)⊕H and the second marginal extension splits.
- `TauCeti.Selmer.Height.mixed_curve` (compatibility): On a curve, degree-zero disjoint divisors give the Tate-module realization of the Poincaré biextension of the Jacobian and its dual.
- `TauCeti.Selmer.Height.mixed_twists` (non-example): The trace defining κ_c′ uses L(d−1); using L(d) there would produce the wrong endpoint instead of L(1) after twisting.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/homologically-trivial-cycles`; `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`; `SelmerIwasawaCohomologyPartII:HP.0/triangle-edge-cocycle`; `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.** DL24, §A.3, diagram (A.2), pp. 324–326. Builds the full biextension diagram, retaining both extensions and the lift rather than just its two marginal classes.

## HP.1. Local indices and canonical global heights

Compare the non-p Kummer local index with the cup/Mayer–Vietoris index, normalized so the trace-boundary sends a uniformizer to −1. Define the Panchishkin subrepresentation, prove its crystalline weak-admissibility criterion and extension stability inside the crystalline category, and show geometric AJ classes on the stated pure semistable summands satisfy the finite condition. Construct the canonical local Kummer-torsor height with its completed-unit criterion and the idelic global height under (V1)–(V3), including local decomposition. The canonical local proof with exceptional quotients is explicitly G1; no unconditional Bockstein identification is asserted.

**Coverage:** planned. Resolve G1: verify the canonical local filtered-semistable torsor splitting with exceptional quotients from the original height proof. Discharge CP.4 smooth-open potential semistability, PH R06.2 finite-extension-complex, DWP.7 good-prime purity and CFT idelic interfaces.

### Local index away from p

**Target:** `SelmerIwasawaCohomologyPartII:HP.1/local-index-away-p` · construction · planet: Local cycle index

Let K be nonarchimedean of residue characteristic ℓ≠p. For disjoint cycles as in HP.0 assume AJ(c)=AJ(c′)=0 locally. Then both marginal extension classes vanish and e(c,c′) has a unique preimage in H¹(K,L(1)) under H¹(K,L(1))→H¹(K,E_c′). Define the local Kummer index by this preimage, using H¹(K,L(1))≃(lim_m K×/(K×)^{p^m})⊗_{Z_p}L. If, in addition, both arithmetic cycle classes vanish in H^{2d}(X,L(d)) and H^{2d′}(X,L(d′)), one can also lift the refined classes to γ∈H^{2d−1}(X∖Z,L(d)) and γ′∈H^{2d′−1}(X∖Z′,L(d′)), then apply Mayer–Vietoris boundary and trace to γ∪γ′. This second realization is the Beilinson index on that stronger domain.

**Hypotheses and conventions.** The residue characteristic is different from p. Vanishing of both marginal AJ classes suffices for the Kummer preimage. The cup-product comparison additionally requires both arithmetic cycle classes to vanish; geometric triviality alone supplies neither hypothesis.

**Construction or proof.**

1. Use the two zero marginal classes and the exact cohomology sequence of 0→L(1)→E_c′→H→0 to get existence and injectivity of the preimage.
2. Use the parent Kummer identification with the multiplicative completion, retaining the completion before tensoring.
3. Localization gives γ and γ′, and Mayer–Vietoris and trace give the second description; independence is established by the next comparison.

**Uses.** DL24 Proposition A.7: Connects the p-adic local height to geometric local intersection calculations. DL24 (4.8): Supplies all non-p local terms in the global cycle height.

**API.**

- `TauCeti.Selmer.Height.LocalCycleIndex.kummer` (projection): The index maps to e(c,c′) in H¹(K,E_c′).
- `TauCeti.Selmer.Height.LocalCycleIndex.choice_independent` (extensionality): Support enlargements preserve the Kummer index. On the stronger arithmetic-vanishing domain, changes of γ,γ′ preserve its Beilinson realization.
- `TauCeti.Selmer.Height.LocalCycleIndex.bilinear` (structure): The Kummer index is L-bilinear on pairs with common disjoint supports and zero marginal AJ classes.
- `TauCeti.Selmer.Height.LocalCycleIndex.trace_normalization` (compatibility): In the scalar trace-boundary convention of DL24 A.6, the completed Kummer class of a uniformizer maps to −1; hence the scalar realization is −ord_K.

**Unit tests.**

- `TauCeti.Selmer.Height.local_index_zero` (degenerate): A zero input cycle has index zero.
- `TauCeti.Selmer.Height.local_uniformizer_sign` (example): The Kummer class of π has valuation 1 but trace-boundary scalar −1.
- `TauCeti.Selmer.Height.local_index_completion` (compatibility): For ℓ≠p, completed units tensor L vanish, so the scalar index factors through the valuation line.
- `TauCeti.Selmer.Height.local_arithmetic_required` (non-example): The construction does not choose a Kummer preimage from geometric triviality when AJ(c) is nonzero.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/cycle-mixed-extension`; `SelmerIwasawaCohomology:L0/padic-kummer-identification`; `EtaleDualityAndPerverseSheaves:EDC.0`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

**Sources.** DL24, §A.4, Remark A.6, Proposition A.7, p. 326. Defines the local index and the cup-boundary realization with the arithmetic-vanishing hypothesis retained.

### Equality with the Beilinson local index

**Target:** `SelmerIwasawaCohomologyPartII:HP.1/beilinson-local-index-comparison` · theorem · planet: Local index comparison

With the hypotheses and fixed trace-boundary sign of the preceding construction, the Kummer preimage of the mixed extension equals the cup/Mayer–Vietoris/trace local index. The latter is independent of the chosen lifts. In the scalar normalization this equality uses −ord_K on completed K×.

**Hypotheses and conventions.** All hypotheses of local-index-away-p, including arithmetic vanishing of both cycle classes.

**Construction or proof.**

1. Represent the two localization sequences by a compatible mapping-cone diagram and the two refined classes by cocycles.
2. The pullback/pushout extension cocycle is the Mayer–Vietoris boundary of their cup product; identify the endpoint by Poincaré trace.
3. Changes of lifts give boundary terms whose trace vanishes by the assumed zero arithmetic classes. This is the étale realization of the Scholl comparison, rather than an assumption about the existence of a category of mixed motives.

**Check.** Check the uniformizer value −1 and independence from both lifts. For curves, the equality is compatible with the Poincaré biextension local symbol.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.1/local-index-away-p`; `SelmerIwasawaCohomologyPartII:HP.0/triangle-edge-cocycle`; `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.** DL24, Proposition A.7 and Remark A.6, p. 326; Scholl, Theorem 5.3, author-copy printed pp. 18–21. Identifies the two local-index constructions; Scholl’s proof supplies the compatible extension/cup-product calculation. SCHOLL94, §5, Theorem 5.3 and proof, author-copy printed pp. 18–21. The extension calculation compares the geometric local index and its motivic realization; only its étale cup/extension computation is used.

### The Panchishkin subrepresentation

**Target:** `SelmerIwasawaCohomologyPartII:HP.1/panchishkin-subrepresentation` · definition · planet: Panchishkin condition

For a de Rham finite-dimensional L-representation V of G_K, K/Q_p finite, a Panchishkin subrepresentation is a G_K-stable subspace V⁺ such that Fil⁰D_dR(V⁺)=0 and Fil⁰D_dR(V/V⁺)=D_dR(V/V⁺). Existence is a property; when it holds V⁺ is unique. Write V⁻=V/V⁺. The induced splitting of D_dR(V)→D_dR(V)/Fil⁰ is the one with image D_dR(V⁺). No vanishing of H⁰(K,V⁻) is included in this definition.

**Hypotheses and conventions.** The category is the imported de Rham representation category, and filtrations use the convention D_dR(Q_p(1)) has Fil⁰=0.

**Construction or proof.**

1. Express the two filtration conditions on the existing de Rham realization.
2. For two candidates, the image of V⁺→V/W⁺ is a de Rham subquotient. Strict exactness makes its Fil⁰ zero from the source and everything from the target; it is zero. Apply in both directions. This uses exactness and faithfulness of D_dR, not fullness of D_dR on arbitrary filtered maps.
3. Strictness gives the direct-sum decomposition D_dR(V)=D_dR(V⁺)⊕Fil⁰D_dR(V).

**Uses.** DL24 §A.7 (V3): Fixes the Hodge choices for the global canonical height. DL24 Lemmas A.13–A.14: Recognizes the property from crystalline linear algebra.

**API.**

- `TauCeti.Selmer.Height.Panchishkin.plus` (projection): Return the unique G_K-stable subrepresentation V⁺.
- `TauCeti.Selmer.Height.Panchishkin.hodge_section` (projection): D_dR(V⁺) is a complement of Fil⁰ and identifies with D_dR(V)/Fil⁰.
- `TauCeti.Selmer.Height.Panchishkin.unique` (extensionality): Any two subrepresentations satisfying the two filtration conditions coincide.
- `TauCeti.Selmer.Height.Panchishkin.dual_twist` (compatibility): The Panchishkin plus part of V∨(1) is the annihilator of V⁺, namely (V⁻)∨(1).
- `TauCeti.Selmer.Height.Panchishkin.direct_sum` (constructor): The direct sum of two Panchishkin representations has plus part the direct sum of their plus parts.

**Unit tests.**

- `TauCeti.Selmer.Height.panchishkin_tate` (example): Q_p(1) has V⁺=V and Q_p has V⁺=0.
- `TauCeti.Selmer.Height.panchishkin_zero` (degenerate): The zero representation has unique plus part zero.
- `TauCeti.Selmer.Height.panchishkin_tate_curve` (non-example): For the Tate-curve representation 0→Q_p(1)→V→Q_p→0, the plus part is Q_p(1), but H⁰(K,V⁻)=Q_p. Panchishkin and pure weight −1 do not remove exceptional zeros.
- `TauCeti.Selmer.Height.panchishkin_dual` (compatibility): For Q_p⊕Q_p(1), the annihilator rule gives again a one-dimensional plus part after dual twist.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomology:L4/period-realization`; `PadicHodgeTheory:R06.2`.

**Sources.** DL24, Definition A.12, p. 329; Nekovář 1993 §6.7 (cited by DL24, original not accessed). Pins the local ordinary-type subrepresentation that supplies the canonical height’s Hodge splitting.

### Crystalline Panchishkin criterion and extension stability

**Target:** `SelmerIwasawaCohomologyPartII:HP.1/crystalline-panchishkin-criterion` · theorem · planet: Crystalline Panchishkin criterion

For crystalline V let D⁺⊆D_cris(V) be its strictly negative Newton-slope subspace, with the induced Hodge filtration after extension to K. V is Panchishkin if and only if D⁺ is weakly admissible and D⁺⊗_{K₀}K is a complement to Fil⁰D_dR(V). In that case D⁺=D_cris(V⁺). In an exact sequence 0→V₁→V→V₂→0 in which all three representations are crystalline, a common nonzero purity weight of V₁,V₂ passes to V, and the Panchishkin property of V₁,V₂ passes to V.

**Hypotheses and conventions.** Weak admissibility includes all filtered φ-subobject inequalities, not just equality of total Hodge and Newton degrees. The extension assertion is inside the crystalline category; it does not assert that every extension of crystalline representations is crystalline.

**Construction or proof.**

1. For V⁺, Fil⁰=0 forces every Newton slope negative by weak admissibility; the quotient has only nonnegative slopes.
2. Conversely apply weak-admissibility-is-admissibility to D⁺ and strictness to identify its quotient, then recover V⁺.
3. Use exactness of slope decompositions and strict filtered exactness for the extension assertion; purity is read on crystalline Frobenius eigenvalues.

**Check.** Reject a slope/Hodge direct-sum claim lacking weak admissibility of D⁺. Apply the criterion to Q_p⊕Q_p(1) and to the zero representation.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.1/panchishkin-subrepresentation`; `PadicHodgeTheory:R06.2/weak-admissibility-is-admissibility`; `CrystallineCohomology:CR.4/isocrystal-slope-decomposition`; `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`.

**Sources.** DL24, Lemmas A.13–A.14, p. 329. Recognizes the Hodge section and its stability with the crystallinity hypothesis on the middle term retained.

### Finite Abel–Jacobi classes for pure semistable summands

**Target:** `SelmerIwasawaCohomologyPartII:HP.1/abel-jacobi-finite-condition` · theorem

Let K be a number field, X/K smooth proper, H=H^{2d−1}(X_Kbar,L(d)), and V⊆H a G_K-subrepresentation. Assume H^i(K_v,V)=0 for every i and every finite v∤p, and that V|G_{K_v} is semistable pure of weight −1 for v|p. Then every c∈Z^d_V(X)^0_L has a unique AJ lift in H¹_f(K,V). Here H⁰(K,H/V)=0 is supplied by a good-reduction Frobenius with weight −1 on H/V, not by a claim that all quotients of a monodromy-pure local representation are pure of weight −1.

**Hypotheses and conventions.** Use the global finite condition defined in the parent, with archimedean rational p-adic conditions; n<p in the final geometric application forces p odd. Purity at p is monodromy/Weil–Deligne purity.

**Construction or proof.**

1. At a good finite prime away from p, smooth proper purity excludes eigenvalue 1 on H/V; the long exact cohomology sequence gives injectivity H¹(K,V)→H¹(K,H).
2. Realize AJ as an extension subquotient of the cohomology of the open complement of its support; request the smooth-open potential semistability theorem, including localization and pullback compatibility.
3. A potentially semistable extension of the semistable V by L is semistable: finite inertial type in its associated potentially semistable module is unipotent and hence trivial in characteristic zero.
4. For pure weight −1, the semistable finite-condition complex has no φ=p⁻¹ obstruction on D_st(V)/ND_st(V), so H¹_st(K_v,V)=H¹_f(K_v,V). This weight/finite-complex interface is requested explicitly from PH R06.2.
5. Away from p use the assumed local acyclicity.

**Check.** The argument must work for singular support by localization, rather than assume the support smooth. A Tate-curve quotient Q_p must not be used as evidence that pure local representations have only pure quotients.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/homologically-trivial-cycles`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`; `CohomologyComparisons:CP.4`; `PadicHodgeTheory:R06.2`; `DeligneWeightsAndPurity:DWP.7/purity-of-smooth-proper-dm-stacks`; `DeligneWeightsAndPurity:DWP.7`; `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.** DL24, §A.7, p. 330, invoking Nekovář 2000, Theorem 3.1; §A.3, pp. 324–326. Explains why the geometric Abel–Jacobi lifts used by the height land in the finite Selmer condition; the direct comparison route makes the missing supplier inputs explicit.

### Canonical local height of finite mixed extensions

**Target:** `SelmerIwasawaCohomologyPartII:HP.1/canonical-local-height` · construction · planet: Canonical local height

For K/Q_p finite, V semistable pure of weight −1 with its Panchishkin subrepresentation, and V′ paired G_K-equivariantly with V into L(1), consider mixed extensions with marginal classes in H¹_f(K,V) and H¹_f(K,V′). The Hodge splitting D_dR(V⁺)⊕Fil⁰ defines Nekovář’s canonical local splitting of the associated Kummer torsor. Write h_K(e) for its value in (lim_m K×/(K×)^{p^m})⊗L, normalized compatibly with the non-p local index. Translation of the mixed extension by a∈H¹(K,L(1)) translates h_K by a. For the cycle mixed extensions in this setting, e∈H¹_f(K,E_c′) if and only if h_K(e) belongs to the image of completed O_K×⊗L. The construction includes the exceptional-quotient terms when H⁰(K,V⁻)≠0.

**Hypotheses and conventions.** The full local construction and the normalization of its exceptional terms are an explicit proof-verification gap G1. The criterion itself is stated in DL24 A.15. A pairing V×V′→L(1) may be degenerate; reduce by pullback from the dual representation rather than assume it perfect.

**Construction or proof.**

1. Use the parent finite-condition extension complexes and the Hodge section to split the local mixed-extension torsor.
2. To complete this construction, verify the filtered semistable extension calculation and the exceptional-zero correction in Nekovář 1993 §§1–4, 7; the original was inaccessible in this run (G1).
3. Use the finite-condition complex for L(1), whose H¹_f is completed units, to compare the finite sub-torsor with the kernel of valuation.
4. Do not replace the construction by the uncorrected norm/Bockstein height: SC §11.4 has extra hypotheses and a correction term.

**Uses.** DL24 Remark A.15: Converts full crystallinity to the local unit statement. DL24 §4.7, Lemma 4.34: Uses this criterion for the p-adic local terms.

**API.**

- `TauCeti.Selmer.Height.CanonicalLocalHeight.value` (projection): Return the local Kummer-torsor value in completed K×⊗L.
- `TauCeti.Selmer.Height.CanonicalLocalHeight.translate` (relation): Adding a Kummer class a at the central L(1) extension changes the value by a.
- `TauCeti.Selmer.Height.CanonicalLocalHeight.zero` (simp): The split mixed extension has value zero.
- `TauCeti.Selmer.Height.CanonicalLocalHeight.finite_iff_unit` (characterisation): For the stated finite marginal cycle extensions, the full class is finite exactly when the value is in completed units.
- `TauCeti.Selmer.Height.CanonicalLocalHeight.coefficients` (functoriality): Scalar extension L→L₁ transports both the mixed extension and the value, respecting identity and composition.
- `TauCeti.Selmer.Height.CanonicalLocalHeight.dual_pullback` (compatibility): A pairing V×V′→L(1) induces the height by pullback from the dual-representation construction, also for a degenerate pairing.

**Unit tests.**

- `TauCeti.Selmer.Height.height_split` (degenerate): The all-split extension has height zero and is finite.
- `TauCeti.Selmer.Height.height_unit_translation` (example): Translation of a finite full extension by a completed unit preserves finiteness.
- `TauCeti.Selmer.Height.height_uniformizer_translation` (non-example): Translation by the Kummer class of a uniformizer changes valuation by 1 and leaves the finite sub-torsor.
- `TauCeti.Selmer.Height.height_exceptional_tate` (non-example): For a Tate-curve representation the quotient has fixed vectors; an implementation that silently discards the exceptional contribution fails the SC §11.4 comparison.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/cycle-mixed-extension`; `SelmerIwasawaCohomologyPartII:HP.1/panchishkin-subrepresentation`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`; `SelmerIwasawaCohomology:L4/period-fundamental-sequences`; `SelmerIwasawaCohomology:L0/local-power-class-finite`; `PadicHodgeTheory:R06.2`.

**Sources.** DL24, §A.7, (V2)–(V3) and Remark A.15, pp. 330–331; Nekovář 1993 §§1–4, 7 cited there, original not accessed. States the local interface and the unit criterion used by the main theorem, keeping the unverified proof obligation explicit. NEK-SC, §11.3.9, pp. 370–374; §11.4.1–11.4.6, pp. 375–382. The norm/Bockstein comparison requires its sign and the canonical height has additional exceptional-quotient corrections under the assumptions stated there.

### Global height and its cycle decomposition

**Target:** `SelmerIwasawaCohomologyPartII:HP.1/global-height-pairing` · construction · planet: Global cycle height

For a number field K let Γ_{K,p} be the p-completion of the finite idele group A_K^{∞,×} modulo K× and the local unit groups away from p; retain its torsion until tensoring with L. For V,V′ satisfying the two local hypotheses of abel-jacobi-finite-condition and the Panchishkin condition at every v|p, a G_K-pairing V×V′→L(1) gives an L-bilinear canonical height H¹_f(K,V)×H¹_f(K,V′)→Γ_{K,p}⊗_{Z_p}L. Pull it back along the unique finite AJ lifts to obtain the cycle height on Z^d_V(X)^0_L×Z^{d′}_{V′}(X)^0_L. For disjoint representatives it is the sum over finite places of their local mixed-extension indices: first map each local completed K_v×⊗L into Γ_{K,p}⊗L by the idelic map, then add. Away from p use the Kummer/Nekovář index: (V1) makes both marginal AJ classes zero. It equals the Beilinson index under the additional arithmetic-vanishing hypotheses of that comparison. At p use the canonical local height.

**Hypotheses and conventions.** V and V′ satisfy (V1) local acyclicity away from p, (V2) semistability and purity −1 at p, and (V3) Panchishkin at p. For cycles require X smooth proper of dimension n−1, d+d′=n, the chosen embeddings of V and V′ in the complementary cohomology groups, and the induced Poincaré pairing.

**Construction or proof.**

1. Use the parent global duality and orthogonality to choose a global lift of one finite extension through the other dual extension.
2. Apply the canonical local splittings; (V1) kills both non-p marginal AJ classes and hence gives the unique Kummer preimage. Use the Beilinson comparison only when its stronger arithmetic-vanishing hypotheses hold. Almost all scalar local terms vanish by integral extension and unramifiedness.
3. The difference of two global lifts is a global Kummer class, whose sum in Γ vanishes by global reciprocity. This proves choice independence.
4. Functoriality of the mixed extension gives bilinearity and compatibility with scalar extension; evaluate on AJ lifts for cycles.
5. The local at-p splitting proof remains dependent on G1, and the precise global idelic exactness is a supplier request, not an unstated class-field-theory theorem.

**Uses.** DL24 (4.8): Provides the global-to-local height identity for the two special cycles. GrossZagierAndArithmeticHeights GZ.9 and AnabelianGeometryAndNonabelianChabauty NC.5: Supply geometric cycle instances and comparisons with curve-specific heights, retaining ownership of those applications.

**API.**

- `TauCeti.Selmer.Height.GlobalHeight.pair` (projection): The height is a bilinear map into Γ_{K,p}⊗L.
- `TauCeti.Selmer.Height.GlobalHeight.cycle` (constructor): Compose with the unique finite Abel–Jacobi maps to get the cycle pairing.
- `TauCeti.Selmer.Height.GlobalHeight.local_sum` (characterisation): For disjoint cycle representatives the value is the finite sum of the images of local indices under the idelic maps.
- `TauCeti.Selmer.Height.GlobalHeight.principal_relation` (relation): A change of global Kummer lift contributes a principal idele and hence changes the global height by zero.
- `TauCeti.Selmer.Height.GlobalHeight.correspondence_adjoint` (compatibility): For disjoint transported supports, ⟨t*c,c′⟩=⟨c,(t∨)*c′⟩.
- `TauCeti.Selmer.Height.GlobalHeight.coefficient_map` (functoriality): Extension of coefficient fields commutes with the height and its local decomposition.

**Unit tests.**

- `TauCeti.Selmer.Height.height_zero_pairing` (degenerate): If V=0 or the chosen V×V′ pairing is zero, the global height is zero.
- `TauCeti.Selmer.Height.height_principal_idele` (compatibility): Changing a lift by a∈K× changes the local terms by its local Kummer classes but their sum in Γ⊗L is zero.
- `TauCeti.Selmer.Height.height_curve_jacobian` (compatibility): For disjoint degree-zero divisors on a curve and V the Jacobian Tate module, recover the canonical Selmer height with the same Panchishkin splitting.
- `TauCeti.Selmer.Height.height_local_targets` (non-example): Adding raw elements of different completed K_v× without their idelic maps is ill-typed and cannot define the global pairing.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.1/canonical-local-height`; `SelmerIwasawaCohomologyPartII:HP.1/beilinson-local-index-comparison`; `SelmerIwasawaCohomologyPartII:HP.1/abel-jacobi-finite-condition`; `SelmerIwasawaCohomology:L1/derived-selmer-duality`; `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`; `SelmerIwasawaCohomology:L0/kummer-cup-shapiro`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Sources.** DL24, §A.7, (A.5), pp. 330–331; §4.5, (4.8), p. 293; §1.3, p. 227. Constructs the canonical height and the precise local decomposition used by the special-cycle formula, without importing the automorphic formula itself.

## HP.2. Syntomic cycles with proper support

From the supplier-owned integral Kato/Sato sheaves construct the supported syntomic complex, the heart defined by geometric vanishing of its étale image, and its B_cris-valued Abel–Jacobi edge. Under the imported d-density predicate define the unique log-rigid obstruction through the monodromy quotient and prove the supported cycle lift has zero positive residue. Import CR.6/RD.4 log complexes, support and spectral-sequence definitions, rather than recreate them.

**Coverage:** planned. Discharge PH R06.5 integral Kato/Sato supported comparison, cycle-residue and crystalline injectivity inputs; retain CR/RD suppliers.

### Supported syntomic Abel–Jacobi domain

**Target:** `SelmerIwasawaCohomologyPartII:HP.2/supported-syntomic-abel-jacobi` · construction · planet: Supported syntomic Abel–Jacobi map

Let 𝒳/O_K be proper strictly semistable of relative dimension n−1, X its special fiber, 𝒰⊆𝒳 open with generic fiber U, and F:U_s→X. Import Kato’s integral log-syntomic tower S(d)_𝒳 and Sato’s twists, for 0≤d<p−1. Define Syn_c(𝒰,d)=RΓ(X_et,F!F*S(d)_𝒳,Q_p). Its comparison map π goes to RΓ_c(U,Q_p(d)). Define H^q(Syn_c)^♥=π⁻¹(ker(H^q_c(U,Q_p(d))→H^q_c(U_Kbar,Q_p(d)))). The map α_q is the geometric edge after π followed by Q_p(d)→B_cris, with target H¹(K,H^{q−1}_c(U_Kbar,Q_p)⊗B_cris). The heart is an inverse image under π, not the kernel of forgetting G on the syntomic complex.

**Hypotheses and conventions.** K/Q_p finite, uniformizer chosen for the auxiliary log model; W=W(κ), K₀=Frac W. Integral Kato/Sato interfaces and their maps with proper support are a precise request to PH R06.5; its existing rational syntomic fiber alone does not supply them.

**Construction or proof.**

1. Apply the imported integral sheaf-level syntomic construction and rationalize only after Rlim.
2. Use the open proper-support functor from CR/RD and the truncated near-cycle comparison S(d)≃τ≤d i*Rj*μ_{p•}^{⊗d} to obtain π.
3. Take the inverse image of the geometric étale kernel, then use HP.0 for α_q.

**Uses.** DL24 Proposition B.9: Compares the kernel of α with the rigid obstruction. DL24 Proposition B.11: Receives supported cycle lifts and transports them along correspondences.

**API.**

- `TauCeti.Selmer.Height.SupportedSyntomic.etalemap` (projection): π:Syn_c→RΓ_c(U,Q_p(d)) is functorial for proper-support-compatible maps.
- `TauCeti.Selmer.Height.SupportedSyntomic.heart` (characterisation): A class belongs to the heart exactly when its étale image is geometrically zero.
- `TauCeti.Selmer.Height.SupportedSyntomic.abelJacobi` (projection): α_q is the composite of π, the edge and the canonical coefficient embedding into B_cris.
- `TauCeti.Selmer.Height.SupportedSyntomic.correspondence` (functoriality): t*:Syn_c(𝒰_t,d)→Syn_c(𝒰,d) respects π, the heart and α_q.
- `TauCeti.Selmer.Height.SupportedSyntomic.weight_range` (compatibility): The near-cycle identification is truncated in degrees ≤d and requires 0≤d<p−1; no unrestricted quasi-isomorphism with full near cycles is asserted.

**Unit tests.**

- `TauCeti.Selmer.Height.syntomic_empty_support` (degenerate): For 𝒰 empty, the supported complex and its heart are zero.
- `TauCeti.Selmer.Height.syntomic_proper_case` (compatibility): For 𝒰=𝒳, π and α recover the proper syntomic comparison and its edge.
- `TauCeti.Selmer.Height.syntomic_heart_distinction` (non-example): A class can be geometrically nonzero syntomically while π sends it to zero geometrically; it must still belong to the heart.
- `TauCeti.Selmer.Height.syntomic_weight_boundary` (non-example): The construction may not invoke the stated integral near-cycle theorem at d=p−1.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/geometric-hochschild-serre-edge`; `PadicHodgeTheory:R06.5`; `CrystallineCohomology:CR.6/tube-proper-support`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/compact-support-functoriality`; `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.** DL24, §B.4, (B.14)–(B.17), pp. 340–341. Defines the supported syntomic domain and its exact geometric-kernel condition.

### The log-rigid obstruction map

**Target:** `SelmerIwasawaCohomologyPartII:HP.2/log-rigid-obstruction` · construction · planet: Log-rigid Abel–Jacobi obstruction

Use the imported supported log-convergent complexes ω_(U_s,X) and ω̃_(U_s,X) and their monodromy triangle. The syntomic-to-crystalline map followed by specialization gives ξ:Syn_c(𝒰,d)→RΓ(X_et,ω̃_(U_s,X)). Call 𝒰 d-dense when dim(X^{(h)}∖U_s^{(h)})≤d−h for every h≥1, using RD.4’s predicate. If d≥1 and 𝒰 is d-dense, the composite from H^{2d}(Syn_c)^♥ to H^{2d}_rig((U_s,X)/W°) is zero. The triangle therefore gives a unique map ρ_{2d}:H^{2d}(Syn_c)^♥→H^{2d−1}_rig((U_s,X)/W°)/N; its composite with the triangle’s injective boundary equals H^{2d}(ξ). The quotient by the image of N is essential.

**Hypotheses and conventions.** 0≤d<p−1; the case d=0 instead uses injectivity of supported H⁰ into proper H⁰. The log complexes, density predicate and high-degree comparison retain their existing CR.6/RD.4 ownership.

**Construction or proof.**

1. Import the natural maps from log-syntomic to trivial-log crystalline and then to log-convergent cohomology.
2. RD.4’s high-degree comparison reduces degree 2d to the proper case.
3. In the proper case use the requested Sato finite-coefficient injectivity/base-change argument to kill the heart after crystalline specialization; this is not a consequence of density alone.
4. Use the long exact monodromy sequence: H^{2d−1}_rig/N injects with image precisely the kernel of H^{2d}(ω̃)→H^{2d}(ω). Factor ξ uniquely through this injection.

**Uses.** DL24 Proposition B.9: Its kernel must be contained in the restricted kernel of α. DL24 Lemma B.10: The positive-residue quotient detects its cycle image.

**API.**

- `TauCeti.Selmer.Height.RigidAJObstruction.boundary` (characterisation): The injection H^{2d−1}_rig/N→H^{2d}(ω̃) sends ρ to ξ on the heart.
- `TauCeti.Selmer.Height.RigidAJObstruction.unique` (extensionality): This boundary identity uniquely determines ρ.
- `TauCeti.Selmer.Height.RigidAJObstruction.correspondence` (functoriality): Correspondence pull-push from 𝒰_t to 𝒰 commutes with ρ and its monodromy quotient.
- `TauCeti.Selmer.Height.RigidAJObstruction.proper` (compatibility): For 𝒰=𝒳 this is the proper syntomic-to-Hyodo–Kato obstruction.

**Unit tests.**

- `TauCeti.Selmer.Height.rho_empty` (degenerate): The empty supported complex has zero obstruction.
- `TauCeti.Selmer.Height.rho_monodromy_quotient` (characterisation): Adding Nη to a representative does not change ρ; an unquotiented target would destroy uniqueness.
- `TauCeti.Selmer.Height.rho_boundary` (compatibility): For every input σ in the heart, its image under the triangle boundary is exactly ξ(σ).
- `TauCeti.Selmer.Height.rho_density_dimension` (non-example): A complement of dimension exceeding d−h on some h-fold stratum cannot use B.8’s high-degree argument.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.2/supported-syntomic-abel-jacobi`; `CrystallineCohomology:CR.6/convergent-monodromy-triangle`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/high-degree-log-support-comparison`; `PadicHodgeTheory:R06.5`.

**Sources.** DL24, Lemma B.8, Definition B.7, (B.16)–(B.18), pp. 341–343. Defines the obstruction by the monodromy boundary after proving its required vanishing, not by an arbitrary choice of lift.

### Syntomic lifts of supported cycle classes

**Target:** `SelmerIwasawaCohomologyPartII:HP.2/supported-cycle-lift` · theorem

Let c∈Z^d(X_K)^0_L have closure contained in a d-dense 𝒰. The Sato refined cycle class in T(d)_𝒳 maps through T(d)_𝒳→S(d)_𝒳 to σ_c∈H^{2d}(Syn_c(𝒰,d)_L)^♥. Its étale image is the arithmetic supported cycle class. Its image under ξ followed by the residue morphism RΓ(ω̃_(U_s,X))→RΓ(ω⁺_(U_s,X))[−1] is zero in H^{2d−1}(X_et,ω⁺_(U_s,X))_L. Therefore ρ_{2d}(σ_c) lies in the kernel of H^{2d−1}_rig((U_s,X)/W°)_L/N→H^{2d−1}(X_et,ω⁺_(U_s,X))_L.

**Hypotheses and conventions.** 1≤d<p−1; the closure lies inside the specified integral open. Rational support lift choices are taken with the compatible Sato class construction; no uniqueness of an arbitrary syntomic preimage is asserted. The integral open is d-dense; equivalently for the heart argument one needs the induced injection of geometric H_c^{2d}(U) into H^{2d}(X_K). It follows here from the dimension bound on the proper boundary.

**Construction or proof.**

1. Import the Sato twist triangle and refined cycle morphism, and apply the proper-support functor.
2. The residue of the refined cycle in logarithmic Hodge–Witt cohomology is zero by the requested Sato Prop. 9.10 interface. This supplies the supported syntomic lift and its zero positive residue.
3. The complement dimension bound gives H^{2d−1}(X_Kbar∖U_Kbar,L(d))=0 and thus injectivity H_c^{2d}(U_Kbar,L(d))→H^{2d}(X_Kbar,L(d)). Geometric triviality therefore puts σ_c in the supported heart.
4. The residue map ω̃→ω⁺[−1] is compatible with the boundary T(d)→S(d)→ν^{d−1}[−d] and with the monodromy boundary. The refined class comes from T(d), so its residue, and hence the displayed image of ρ, is zero.

**Check.** Check that the supported étale class lives on U, not on its ambient proper scheme only. The residue assertion uses the Sato twist and cycle construction; a rational syntomic fiber without this map does not suffice.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/homologically-trivial-cycles`; `SelmerIwasawaCohomologyPartII:HP.2/supported-syntomic-abel-jacobi`; `SelmerIwasawaCohomologyPartII:HP.2/log-rigid-obstruction`; `PadicHodgeTheory:R06.5`; `CrystallineCohomology:CR.6/sato-residue-variant`; `EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/high-degree-log-support-comparison`.

**Sources.** DL24, Proposition B.11, triangle (B.20), pp. 344–346, citing Sato, Definition 4.2.4 and Proposition 9.10. Supplies the cycle-to-syntomic lift and residue vanishing needed before any annihilator is applied.

## HP.3. Alteration and compatible period comparisons

Choose a strict semistable alteration with flat horizontal boundary, and form supported coefficient diagrams by coherent enhanced boundary totalization. Prove the exact admissibility/base-change claims for the unbarred log and barred log/trivial period complexes, construct their compatible supported B_st comparison and the weight-raising edge compatibility, and deduce the all-degree strict-pair kernel comparison. Transfer it by compact-support trace to ker ρ⊆ker(res α) after one finite extension depending on the open. Retain the Frobenius-restricted monodromy edge; the altered open need not be d-dense.

**Coverage:** planned. Discharge PH R06.5 Galois-PD, stable-range and p^a-almost finiteness interfaces, and EDC.0 enhanced support/trace compatibility.

### Altered semistable pairs and coherent boundary complexes

**Target:** `SelmerIwasawaCohomologyPartII:HP.3/altered-semistable-pair` · construction · planet: Semistable alteration with boundary

For a proper strictly semistable 𝒳/O_K and an open 𝒰 with generic U, choose a finite K′/K and a projective strictly semistable alteration A:𝒳′→𝒳 with a strict semistable horizontal boundary over O_K′. Let 𝒰′ be the open with generic fiber A⁻¹U whose complement is the horizontal closure of that generic boundary; it can be larger than A⁻¹𝒰. Put 𝒱=𝒳′∖𝒰′ and let 𝒱(h) be the disjoint union of h-fold intersections of its components, 𝒱(0)=𝒳′. For each coefficient complex, define the supported object indexed by h=−1 as the shifted totalization of the alternating boundary diagram, with its augmentation. Perform this in the supplier’s dg/stable enhancement, retaining coherent maps; a bare complex in an arbitrary triangulated category does not determine canonical successive fibers.

**Hypotheses and conventions.** Use each irreducible component and its induced log structure, with one fixed ordering for the boundary signs. The altered open is not assumed d-dense, even if 𝒰 was d-dense.

**Construction or proof.**

1. Apply SF.4 semistable alteration to the pair consisting of the generic boundary and special fiber, and use properness to extend the alteration over the original proper model.
2. Remove precisely the horizontal boundary closure to obtain a flat boundary and the indicated generic open.
3. Use the strict semistable-pair log structure on every intersection. The alternating boundary resolution of extension by zero supplies its coherent totalization.
4. Construct the coefficient diagrams at the level of actual embedding/resolution complexes, so that their induced φ,N and period maps descend through the totalization.

**Uses.** DL24 Lemmas B.16–B.17: Replaces a density argument by comparison in every degree. DL24 Lemmas B.20–B.24: Constructs the supported period diagrams by totalization of proper strata.

**API.**

- `TauCeti.Selmer.Height.AlteredPair.generic_open` (projection): U′=A⁻¹U on generic fibers; the integral open is defined from the horizontal boundary.
- `TauCeti.Selmer.Height.AlteredPair.boundary_stratum` (data): For h≥0 return the h-fold boundary intersection with its induced strict semistable log structure.
- `TauCeti.Selmer.Height.AlteredPair.supported_totalization` (constructor): The augmented alternating boundary complex realizes extension by zero from U′.
- `TauCeti.Selmer.Height.AlteredPair.refinement` (functoriality): A compatible map of chosen altered pairs and boundary diagrams induces a map of totalizations, respecting identities and composition.
- `TauCeti.Selmer.Height.AlteredPair.order_independent` (equivalence): Changing the ordering of boundary components gives the sign-corrected equivalent totalization.

**Unit tests.**

- `TauCeti.Selmer.Height.pair_empty_boundary` (degenerate): If U′=X′ the boundary has no positive strata and its supported totalization is the proper complex.
- `TauCeti.Selmer.Height.pair_one_boundary` (example): For one horizontal boundary component the supported object is the fiber of restriction to that component.
- `TauCeti.Selmer.Height.pair_non_dense` (non-example): No use of the high-degree d-density comparison is allowed merely from the existence of a strict pair.
- `TauCeti.Selmer.Height.pair_integral_open` (non-example): The integral open can contain points outside A⁻¹𝒰 while having exactly A⁻¹U as generic fiber; replacing it silently changes the support problem.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SchemeAndStackFoundations:SF.4/semistable-alteration-theorem`; `EtaleDualityAndPerverseSheaves:EDC.0`; `CrystallineCohomology:CR.6/convergent-log-complex`.

**Sources.** DL24, §B.6, pp. 350–353, Lemma B.18 and Remark B.19; Definition B.12, p. 348. Provides a strict pair for comparison and repairs the categorical input by retaining the enhancement implicit in the actual cochain construction.

### The supported period diagram of an altered pair

**Target:** `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-diagram` · construction · planet: Supported period diagram

On the boundary strata of a chosen altered pair take compatible Galois-equivariant log-PD embedding systems over W[t]°. At each finite p-power level and each finite Galois coefficient extension use the PD de Rham complex with degree-j term J^[r−j]⊗Ω^j over W with trivial base log structure (J^[a]=O for a≤0), with its divided Frobenius. Taking the coefficient-extension colimit gives barred B(r); B(0) is barred C_triv. Replacing relative differentials by those over W[t]° gives barred C_log. Set barred S(r)=fib(incl−φ_r:B(r)→C_triv), where φ_r denotes the degree-compatible integral map p^(−r)φ supplied by the Kato divided-Frobenius construction. Take the boundary totalization for h=−1 and push from the embedding hypercover to X_et. The unbarred objects use the initial coefficient extension without that colimit. The diagram includes ξ_r:S(r)→C_triv, π_r:S(r)→near-cycles(r), the log monodromy triangle C_log[−1]→C_triv→C_log→^N C_log, and specialization to the W° complexes.

**Hypotheses and conventions.** The map φ_r=p^(−r)φ is an integral divided-Frobenius morphism on the PD-filtered complex, supplied at finite level; it is not defined by dividing arbitrary elements of a torsion ring by p. The PD envelopes, divided Frobenius and embedding-independence are requested from PH R06.5; CR.6 and PH R06.1 retain their generic log-complex and period-ring ownership.

**Construction or proof.**

1. Build the degreewise PD differential complexes on compatible embedding systems and use the integral syntomic divided-Frobenius map.
2. Colimit over the finite Galois extensions before derived inverse limit, preserving the discrete finite-level G_K-action.
3. Use the exact sequence of log differentials, with wedge dlog(t), to obtain the monodromy triangle and Nφ=pφN.
4. Apply the coherent boundary totalization to all maps simultaneously, including ξ,π and specialization.

**Uses.** DL24 Lemma B.21: Calculates the topological cohomology and admissibility of selected objects. DL24 Lemmas B.23–B.25: Compares both realizations before taking the edge map.

**API.**

- `TauCeti.Selmer.Height.BoundaryPeriodDiagram.xi` (projection): ξ_r maps the syntomic fiber into the trivial-log crystalline realization.
- `TauCeti.Selmer.Height.BoundaryPeriodDiagram.pi` (projection): π_r maps to the boundary realization of near cycles with twist r.
- `TauCeti.Selmer.Height.BoundaryPeriodDiagram.monodromy` (relation): The log triangle has connecting monodromy N and satisfies Nφ=pφN.
- `TauCeti.Selmer.Height.BoundaryPeriodDiagram.specialize` (compatibility): Specialization t=0 commutes with ξ and with the monodromy triangles, including the p-shift on the Frobenius of the boundary.
- `TauCeti.Selmer.Height.BoundaryPeriodDiagram.refine` (functoriality): Compatible refinement of embedding systems induces equivalent diagrams, coherently with boundary totalization.
- `TauCeti.Selmer.Height.BoundaryPeriodDiagram.unbarred_map` (projection): The initial-extension complexes map to the barred complexes with their G_K-action.

**Unit tests.**

- `TauCeti.Selmer.Height.period_proper_stratum` (compatibility): For h=0 with no boundary recover the imported proper Kato/Hyodo–Kato diagram.
- `TauCeti.Selmer.Height.period_boundary_fiber` (example): For a single boundary component, every supported object and every map is the fiber of the corresponding restriction map.
- `TauCeti.Selmer.Height.period_N_phi` (non-example): Interchanging Nφ=pφN with φN=pNφ breaks the Frobenius shift used in diagram B.40.
- `TauCeti.Selmer.Height.period_no_unbarred_admissibility` (non-example): Do not infer admissibility of unbarred C_triv from the admissibility theorem below; only its barred version is asserted admissible.

**Check.** All API and discriminating unit tests below must hold on the imported carriers, with the stated signs and support conventions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.3/altered-semistable-pair`; `PadicHodgeTheory:R06.5`; `PadicHodgeTheory:R06.1/completed-bst-nilpotent-part`; `CrystallineCohomology:CR.6/convergent-monodromy-triangle`; `CrystallineCohomology:CR.6/convergent-witt-comparison`.

**Sources.** DL24, §B.6, (B.24)–(B.32), pp. 353–357. Specifies the proof-specific supported realization diagram; the integral site-level pieces and generic period rings remain supplier inputs.

### Admissibility and cohomology of the boundary period diagram

**Target:** `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-cohomology` · theorem

For every boundary index h≥−1 and degree q, the specialized unbarred C_W° realizes H^q_rig(V(h)/W°), compatibly with N. The unbarred C_log, barred C_log and barred C_triv are admissible towers. If D_q=H^q_rig(V(h)/W°), their cohomology is respectively D_q⊗_{K₀}𝒦, D_q⊗_{K₀}B̂_st⁺ and (D_q⊗_{K₀}B_st⁺)^{N=0}, with the diagonal monodromy on the last two tensors. Here 𝒦 and B̂_st⁺ are the PH R06.1 period rings, with their given limit topology. The assertions include the supported index h=−1. No assertion of admissibility of unbarred C_triv is made.

**Hypotheses and conventions.** Use the compatible Galois embedding and PD systems of boundary-period-diagram. Tensor statements are rational and have the canonical continuous G_K,φ,N compatibilities.

**Construction or proof.**

1. For proper strata use the requested p^a-almost crystalline comparison and finite-coefficient finiteness to bound R¹lim; rationalization kills the bounded torsion.
2. The boundary alternating complex is exact on supported tube sections, giving the h=−1 log-rigid identification, not just an unspecified dimension equality.
3. Transport the finite proper-stratum comparisons through the bounded totalization and its long exact sequences. Flatness of the relevant period scalar extensions gives the cohomology base changes.
4. Use the monodromy exact sequence and PH’s completed-period nilpotent part to identify barred C_triv with the N-invariants of D_q⊗B_st⁺.

**Check.** Verify the supported h=−1 case by the boundary resolution. Check that N on D_q⊗B_st⁺ is the diagonal operator, so N-invariants are not replaced by D_q^{N=0}⊗B_cris⁺.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-diagram`; `SelmerIwasawaCohomologyPartII:HP.0/admissible-geometric-tower`; `CrystallineCohomology:CR.6/tube-proper-support`; `CrystallineCohomology:CR.6/convergent-witt-comparison`; `PadicHodgeTheory:R06.1/completed-bst-nilpotent-part`; `PadicHodgeTheory:R06.5`.

**Sources.** DL24, Lemmas B.20–B.21, pp. 357–360. Supplies exactly the admissible objects and their base-change identities needed for the continuous edge calculation.

### Period comparison with compatible syntomic maps

**Target:** `SelmerIwasawaCohomologyPartII:HP.3/supported-period-comparison` · theorem · planet: Supported semistable comparison

Assume n<p. For every boundary index h≥−1 there is a G_K,φ,N-compatible B_st comparison between its rational étale cohomology tensored with B_st and D_q⊗_{K₀}B_st. For n−1≤r<p−1 the boundary period map π_r is an equivalence; its composite with ξ_r produces this comparison and it is independent of the chosen such r. For 0≤d<p−1, the maps ξ_d and π_d fit the comparison square using Q_p(d)→B_cris⊆B_st. Moreover, the original supported syntomic map factors through S(d)_{V(−1)} on the chosen strict pair, compatibly with both π_d and ξ_d.

**Hypotheses and conventions.** This is a supported strict-pair comparison built from proper-stratum comparison and coherent boundary maps. The general open geometric comparison used in HP.1 is a separate supplier request, not inferred from an arbitrary proper theorem without supports.

**Construction or proof.**

1. Use the Kato/Tsuji stable-range period map on each stratum, with r≥n−1, and totalize the actual compatible diagram.
2. Use proper semistable comparison on each stratum and boundary compatibility to obtain the supported B_st comparison.
3. Compare different weights by syntomic cup product with the base-point Tate class; include filtration compatibility through the supplied period maps.
4. Extend the supported map through the boundary resolution using the strict pair’s log structures; verify both ξ and π composites.

**Check.** Use r=n−1; n<p guarantees this is below p−1. The comparison must commute with both syntomic maps and boundary restriction, not merely identify dimensions.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-cohomology`; `PadicHodgeTheory:R06.5/proper-semistable-model-comparison`; `PadicHodgeTheory:R06.5`; `CrystallineCohomology:CR.6/convergent-monodromy-triangle`; `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.** DL24, Lemmas B.22–B.24, pp. 360–363; (B.33)–(B.36). Identifies the compatible period morphisms needed for the edge comparison, not just an abstract vector-space isomorphism.

### Compatibility of the syntomic Abel–Jacobi edge

**Target:** `SelmerIwasawaCohomologyPartII:HP.3/syntomic-edge-compatibility` · theorem

For 0≤d<p−1, all h≥−1 and all q, the edge of a syntomic class whose étale image is geometrically zero is compatible with the map to H¹(K,(D_{q−1}⊗B_st⁺)^{N=0}), and then with the B_cris-valued étale edge under supported-period-comparison. This statement holds on the entire inverse-image heart, even when the class is not in the geometric kernel of syntomic cohomology itself.

**Hypotheses and conventions.** n<p, and the period diagram and its coefficient maps use the fixed log/Frobenius conventions.

**Construction or proof.**

1. Choose n−1≤r<p−1 with r≥d. Cup with the base-point syntomic Tate class of weight r−d and retain the compensating Tate twist d−r.
2. The high-weight π_r is an equivalence; use it to lift the near-cycle map to a compatible derived diagram before applying equivariant sections.
3. Take the continuous edge of that derived diagram and then identify its period coefficient maps by period-cohomology.
4. This weight-raising argument is necessary because ordinary edge naturality alone does not apply to the larger syntomic heart.

**Check.** A proof that assumes every heart class is geometrically trivial syntomically does not pass. The Tate twists r−d and d−r must cancel in the coefficient diagram.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.2/supported-syntomic-abel-jacobi`; `SelmerIwasawaCohomologyPartII:HP.3/supported-period-comparison`; `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-cohomology`; `SelmerIwasawaCohomologyPartII:HP.0/geometric-hochschild-serre-edge`; `PadicHodgeTheory:R06.5`.

**Sources.** DL24, Lemma B.25, (B.37)–(B.38), pp. 363–366. Provides the additional derived compatibility required by the heart definition.

### Strict-pair kernel comparison in every degree

**Target:** `SelmerIwasawaCohomologyPartII:HP.3/strict-pair-kernel-comparison` · theorem · planet: Strict-pair kernel comparison

On the chosen strict semistable pair with n<p and 0≤d<p−1, the syntomic heart maps to zero in H^q_rig((U_s,X)/W°) for every q, hence has an obstruction ρ′_q into D_{q−1}/N. Its kernel is contained in the kernel of α′_q for every q. More precisely, the kernel of ρ′_q equals the kernel of the intermediate edge into H¹(K,(D_{q−1}⊗B_st⁺)^{N=0}); composition with the period comparison yields α′_q.

**Hypotheses and conventions.** No density assumption is imposed on the altered open. The monodromy connecting-map comparison is used only on the φ=p^{d−1} eigenspace of the completed log realization.

**Construction or proof.**

1. Use the injective period base change and ξ/π square to show vanishing of the heart in rigid cohomology in every degree (B.16).
2. Identify the geometric kernel of barred C_triv with the monodromy quotient of barred C_log using period-cohomology.
3. Apply triangle-edge-cocycle to the shifted monodromy triangle, whose first arrow is −N[−1]. The boundary shifts Frobenius eigenvalue p^{d−1} to p^d.
4. Use PH R06.1’s Frobenius-restricted monodromy-edge theorem and specialization 𝒦→K₀ to get equality of the two kernels in (B.39). Do not extend that result to the full monodromy quotient.
5. Use syntomic-edge-compatibility to conclude the inclusion for α′_q.

**Check.** The proof cannot assume the altered open is d-dense. Diagram B.40 is checked on φ=p^{d−1}; the statement does not assert that δ factors through specialization on the entire space.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-cohomology`; `SelmerIwasawaCohomologyPartII:HP.3/syntomic-edge-compatibility`; `SelmerIwasawaCohomologyPartII:HP.0/triangle-edge-cocycle`; `PadicHodgeTheory:R06.1/frobenius-restricted-monodromy-edge`; `SelmerIwasawaCohomologyPartII:HP.2/log-rigid-obstruction`.

**Sources.** DL24, Lemmas B.16–B.17, pp. 350–351; proof of B.17, (B.39)–(B.40), pp. 366–368. Proves the strict-pair kernel statement with the Frobenius restriction and monodromy sign retained.

### Kernel comparison after one finite extension

**Target:** `SelmerIwasawaCohomologyPartII:HP.3/alteration-kernel-descent` · theorem · planet: Syntomic kernel comparison

Let n<p, 1≤d<p−1 and 𝒰 be d-dense in the original proper strictly semistable 𝒳. There exists a finite K_𝒰/K depending on 𝒰 but not on the syntomic class such that ker ρ_{2d}⊆ker(res_{K_𝒰}∘α_{2d}). For 𝒰=𝒳 one may take K_𝒰=K. The conclusion is a kernel comparison after restriction, not a claim that potentially crystalline extension classes always descend as crystalline.

**Hypotheses and conventions.** Use the source/target of ρ and α from HP.2 with their proper support and Tate twists.

**Construction or proof.**

1. Choose the altered pair once, with coefficient extension K′. Its open need not be dense; strict-pair-kernel-comparison nevertheless applies in every degree.
2. Pull back the original syntomic class and obstruction through the compatible support map. If its original ρ vanishes, so does the altered one.
3. The proper generically finite map on generic opens has compact-support pullback with a G_K′-equivariant trace splitting after division by its degree, by Poincaré duality. This remains split after tensoring B_cris, so the induced H¹ map is injective.
4. Descend the zero edge from the altered representation to the original one over K′. In the proper case use the original strict semistable model directly.

**Check.** K_𝒰 is chosen from the altered pair once for all input classes. The proper-open case takes K_𝒳=K; general finite-extension descent of crystallinity is not used.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.3/strict-pair-kernel-comparison`; `SelmerIwasawaCohomologyPartII:HP.3/altered-semistable-pair`; `SelmerIwasawaCohomologyPartII:HP.2/log-rigid-obstruction`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/compact-support-functoriality`; `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.** DL24, Proposition B.9, p. 343; §B.6, pp. 350–351. Transfers the strict-pair calculation back by a trace splitting, retaining the necessary finite extension.

## HP.4. Correspondence annihilators and finite classes

Prove finite-filtration annihilation, and use the imported supported and positive weight sequences to bound the obstruction kernel by 4d−1 deeper-stratum pieces. The ideal I annihilating all deeper-stratum cohomology then kills it through I^{4n−5}. Combine the syntomic cycle lift and kernel comparison to obtain the finite supported Abel–Jacobi theorem with source U_t and target U. Show a localization with no deeper-stratum cohomology cuts out a crystalline pure weight −1 summand and gives uniform elements outside the maximal ideals.

**Coverage:** planned. Realize the imported RD.4 weight/positive/density and HP.2–HP.3 interfaces before closing the geometric annihilator proof.

### Annihilation from a finite filtration

**Target:** `SelmerIwasawaCohomologyPartII:HP.4/finite-filtration-annihilation` · theorem · planet: Finite-filtration annihilation

Let T be a commutative ring, M a T-module, and 0=F₀⊆F₁⊆⋯⊆F_m=M a finite filtration. If an ideal I acts by zero on every F_{j+1}/F_j, then I^m M=0. Equivalently, a composite of m operators each lowering one filtration step is zero, also for a sequence of filtered modules and compatible lowering maps. As a signature available at the pins: for an R-linear endomorphism f of M with f(F_{j+1})⊆F_j, F₀=0 and F_m=M, one has f^m=0.

**Hypotheses and conventions.** The filtration is exhaustive and starts at zero; it need not be strictly increasing. For the multi-module version each factor lowers the filtration between its actual source and target.

**Construction or proof.**

1. An element of I sends F_{j+1} into F_j because it kills the corresponding quotient.
2. Induct on the number of factors: a product of r ideal elements sends F_j into F_{max(j−r,0)}.
3. After m factors the image is zero; extend from products to their additive span I^m.

**Check.** For m=0 the hypotheses force M=0. The Jordan block of size two is nonzero with square zero: replacing I^m by I is false. A filtration of length m+1 needs m+1 lowering steps in general.

**Dependencies.** `mathlib:Submodule`; `mathlib:LinearMap`.

**Sources.** DL24, Lemma B.10, p. 344, filtration argument. Isolates the algebraic proof milestone used by the geometric annihilator, with an actual native-carrier signature in the suggested file.

### Deeper-stratum annihilation of the rigid obstruction

**Target:** `SelmerIwasawaCohomologyPartII:HP.4/deeper-strata-annihilator` · theorem · planet: Deeper-stratum annihilator

Let 𝒳 be proper strictly semistable of relative dimension n−1, 1≤d≤n−1, and T its commutative L-correspondence algebra. Put D_deep=⊕_{h>1,q≥0}H^q_rig(X^{(h)}/K₀)⊗_{Q_p}L and I=Ann_T(D_deep). If 𝒰 is d-dense, then for every t∈I^{4n−5}, t* annihilates the kernel of H^{2d−1}_rig((U_{t,s},X)/W°)_L/N→H^{2d−1}(X_et,ω⁺_(U_{t,s},X))_L, with target support changed to U_s. The filtration induced from the supported weight spectral sequence has at most 4d−1 pieces, indexed 0 through 4d−2; its pieces on this kernel are subquotients of deeper-stratum cohomology.

**Hypotheses and conventions.** The source is the support open 𝒰_t defined by the transpose correspondence; the target after t* uses 𝒰. The positive complex ω⁺ is CR.6’s Sato residue variant; the weight and density comparisons are RD.4 imports.

**Construction or proof.**

1. Use RD.4’s supported weight spectral sequence and its projection onto the positive-support sequence.
2. The density comparison makes all non-deeper contributions to the indicated kernel vanish. Intersect the weight filtration with the monodromy quotient kernel.
3. Every remaining graded piece is a subquotient of D_deep, so each factor of I lowers its filtration. Use naturality with the actual sequence of support opens when composing factors.
4. Apply finite-filtration-annihilation. Since 4d−1≤4n−5, every element of I^{4n−5}, an additive sum of such products, kills the kernel.

**Check.** Count 4d−1 pieces, not 4d−2. For d=n−1 the required bound is exactly 4n−5. Do not treat t* as an endomorphism of supported cohomology on U_t; record its map to U.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.4/finite-filtration-annihilation`; `SelmerIwasawaCohomologyPartII:HP.0/etale-correspondences-with-support`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-weight-spectral-sequence`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/positive-support-spectral-sequence`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/high-degree-log-support-comparison`; `CrystallineCohomology:CR.6/sato-residue-variant`.

**Sources.** DL24, Lemma B.10, pp. 343–344; Lemmas B.5–B.6, pp. 337–340. Identifies the deeper-stratum filtration and the precise uniform annihilator exponent.

### Finite supported Abel–Jacobi classes after annihilation

**Target:** `SelmerIwasawaCohomologyPartII:HP.4/supported-finite-abel-jacobi` · theorem · planet: Finite supported Abel–Jacobi theorem

Under n<p, 1≤d≤n−1 and d-density of 𝒰, let t∈I^{4n−5} and let c∈Z^d(X_K)^0_L have closure in 𝒰_t. The arithmetic supported class has edge β_c∈H¹(K,H^{2d−1}_c(U_{t,Kbar},L(d))). Then res_{K_𝒰}(t*β_c)∈H¹_f(K_𝒰,H^{2d−1}_c(U_Kbar,L(d))). The extension K_𝒰 is chosen independently of c and t by the kernel-comparison theorem; for 𝒰=𝒳 it is K.

**Hypotheses and conventions.** I is the deeper-stratum annihilator and t* has source support U_t and target support U. The Bloch–Kato finite condition on arbitrary finite-dimensional cohomology is the kernel of the B_cris coefficient map.

**Construction or proof.**

1. Use the supported-cycle-lift σ_c with zero positive residue.
2. The deeper-stratum annihilator kills ρ(t*σ_c) by naturality and the stated filtration theorem.
3. Apply alteration-kernel-descent to conclude that the restricted B_cris-valued edge of t*σ_c vanishes.
4. By the definition of the finite condition and compatibility of π with the arithmetic cycle class, the restricted t*β_c is finite.

**Check.** The target is H_c(U), not H_c(U_t), after the correspondence acts. The extension is not chosen separately for each cycle.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.2/supported-cycle-lift`; `SelmerIwasawaCohomologyPartII:HP.4/deeper-strata-annihilator`; `SelmerIwasawaCohomologyPartII:HP.3/alteration-kernel-descent`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`.

**Sources.** DL24, Proposition B.11 and its proof, pp. 344–346. Converts the supported cycle lift and kernel comparison into the finite condition with the correct target open.

### Crystalline pure localized cohomology

**Target:** `SelmerIwasawaCohomologyPartII:HP.4/localized-crystalline-summand` · theorem · planet: Localized crystalline cohomology

Let m be a maximal ideal of the commutative correspondence algebra T such that (D_deep)_m=0. Then for every r the localized summand H^{2r−1}(X_Kbar,L(r))_m is crystalline and pure of weight −1. It is the idempotent summand cut out in the finite-dimensional image of T; no finite-dimensionality of T itself is required. The annihilator I has an element outside m, and I^a has one outside m for each a≥1.

**Hypotheses and conventions.** The ambient scheme has a proper strictly semistable model, and all correspondence actions commute with φ,N. Use all deeper-stratum degrees, rather than only the degree of the desired representation.

**Construction or proof.**

1. Apply the semistable comparison and weight spectral sequence equivariantly for T. After localizing, all h>1 stratum terms vanish, leaving only smooth proper components with their usual Frobenius weights.
2. Monodromy factors through the now-zero deeper terms, so N=0. Import RD.6 smooth proper rigid purity and RD.7 Frobenius compatibility of comparison: the surviving odd cohomology with twist r has crystalline Frobenius weight −1.
3. The image of T in the finite sum of the relevant cohomology groups is a finite-dimensional commutative Artinian L-algebra. Its primary idempotents split the localized summands.
4. Finite generation of D_deep and its zero localization gives I∖m nonempty; take powers for I^a.

**Check.** For a smooth model the deeper-stratum module is zero and I=T. Semistability without localized deeper-stratum vanishing is insufficient to conclude N=0.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/etale-correspondences-with-support`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-weight-spectral-sequence`; `PadicHodgeTheory:R06.5/proper-semistable-model-comparison`; `PadicDifferentialEquationsAndRigidCohomology:RD.6/purity-smooth-proper`; `PadicDifferentialEquationsAndRigidCohomology:RD.7/frobenius-compatibility-of-comparison`; `CrystallineCohomology:CR.6/convergent-monodromy-triangle`.

**Sources.** DL24, Proof of Theorem A.8, pp. 346–347; hypothesis (A.3), p. 327. Produces the crystalline pure summand and the uniform correspondence choices needed for the full extension.

## HP.5. Crystalline bi-extensions and height units

Prove the localized finite-condition exactness and pushout for an extension whose dual class is finite and supported in the crystalline pure summand. Apply the finite supported AJ theorem three times to obtain uniform t,t′ independent of cycles under saturated disjointness and the asymmetric stratum codimension bound. Descend the full extension only through the injective valuation quotient. Deduce finite bi-extensions for disjoint closures on a proper smooth model when n<p, and completed-unit local heights when the canonical-height hypotheses hold.

**Coverage:** planned. Discharge PH R06.2 localized finite-condition exactness, the imported HP.2–HP.4 interfaces and G1 for the height-unit consequence.

### Finite-condition exactness for the localized extension

**Target:** `SelmerIwasawaCohomologyPartII:HP.5/finite-condition-pushout` · theorem · planet: Finite-condition pushout

Put H=H^{2d−1}(X_Kbar,L(d)) and H′=H∨(1). Suppose the m′-localized summand H′_{m′} is crystalline pure of weight −1 and a short exact sequence 0→L(1)→E→H→0 has dual class in H¹_f(K,H′)∩H¹(K,H′_{m′}). For every finite K†/K the sequence 0→H¹_f(K†,L(1))→H¹_f(K†,E)→H¹_f(K†,H)→0 is exact. If H¹_♯(K†,E) is the inverse image of H¹_f(K†,H) in H¹(K†,E), the inclusion of this finite exact sequence into 0→H¹(K†,L(1))→H¹_♯(K†,E)→H¹_f(K†,H)→0 is a pushout.

**Hypotheses and conventions.** H is proper semistable cohomology, but purity or crystallinity of its entire unlocalized representation is not assumed. The extension is supported in the specified crystalline dual summand.

**Construction or proof.**

1. Split H and its dual by the finite-image idempotent. The extension is split on the complementary summand, where the finite-condition sequence is tautologically split.
2. On the selected summand use the crystalline finite-extension complex, strictness of D_dR and the absence of Frobenius eigenvalues 1 and p⁻¹ in weight −1.
3. This special exactness interface is a precise PH R06.2 request, replacing an unverified invocation of Nekovář 1993 Proposition 1.25 in broader generality.
4. Compare the two short exact sequences with the same right endpoint; their quotient is H¹(K†,L(1))/H¹_f(K†,L(1)), giving the pushout.

**Check.** The exactness assertion is uniform in finite K†/K. A proof assuming all of H crystalline or all short exact sequences preserve H¹_f misses the stated hypothesis.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.4/localized-crystalline-summand`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`; `SelmerIwasawaCohomology:L4/period-fundamental-sequences`; `PadicHodgeTheory:R06.2`.

**Sources.** DL24, Proof of Theorem A.8, property (*), (B.21), pp. 346–347, invoking Nekovář 1993 Proposition 1.25. States the exact finite-condition input and its pushout on the correct localized summand.

### Uniform crystalline cycle bi-extensions

**Target:** `SelmerIwasawaCohomologyPartII:HP.5/uniform-crystalline-cycle-biextension` · theorem · planet: Crystalline bi-extension theorem

Let K/Q_p be finite, X/K smooth projective of dimension n−1, 𝒳/O_K a proper strictly semistable model, n<p, and T a commutative L-algebra of finite étale correspondences on 𝒳. Suppose maximal ideals m,m′ satisfy (⊕_{h>1,q≥0}H^q_cris(X^{(h)}/W)⊗_{Z_p}L)_m=(...)_{m′}=0. There exist t∈T∖m and t′∈T∖m′, chosen from the model and its correspondence action independently of the cycles, such that for every c∈Z^d(X)^0_L and c′∈Z^{d′}(X)^0_L with d+d′=n, (i) (supp 𝒞)_s∩(supp 𝒞′)_{s′}=∅ for EVERY s,s′∈T, and (ii) codim_{X^{(h)}}(supp 𝒞′∩X^{(h)})≥d′ for every h≥1, the three classes AJ(t*c), AJ(t′*c′), and e(t*c,t′*c′) lie respectively in H¹_f(K,H), H¹_f(K,H′), and H¹_f(K,E_{t′*c′}). Here 𝒞,𝒞′ are the closures of the supports, and 1≤d,d′≤n−1; zero inputs use the split conventions.

**Hypotheses and conventions.** The disjointness hypothesis quantifies over the whole algebra T, not just the final t,t′. The codimension condition is asymmetric and imposed on the second cycle on every special-fiber intersection. L may be a finite product of p-adic fields, handled componentwise.

**Construction or proof.**

1. Let I annihilate all deeper strata and let J′ annihilate all complementary idempotent summands of H¹(K,H^{2r−1}(X_Kbar,L(r))) for 1≤r≤n−1 outside m′. The finite image of T gives J′∖m′≠∅.
2. Choose t′=t′₁t′₂ with t′₁∈J′∖m′ and t′₂∈I^{4n−5}∖m′. Apply supported-finite-abel-jacobi with the whole model to c′ after t′₁: the dual marginal extension is finite and belongs to the selected crystalline summand. Invoke finite-condition-pushout.
3. Choose t₁∈I^{4n−5}∖m and apply the same proper-case theorem to c; its first marginal is finite.
4. Use the integral open 𝒰=𝒳∖(supp 𝒞′)_{t′}. Its d-density follows from d+d′=n and the codimension assumption; saturated disjointness puts the first support in the required 𝒰_{t₂}. Choose t₂∈I^{4n−5}∖m. The third application gives the full extension finite over K_𝒰, with target H_c(U) before pushout, and t=t₁t₂.
5. Apply the pushout for K and K_𝒰: the only obstruction left is the valuation line H¹(K,L(1))/H¹_f(K,L(1)). Restriction multiplies valuations by the nonzero ramification index, hence is injective after tensoring L. The full class is therefore finite over K.

**Check.** The same t,t′ must work for every pair of cycles satisfying the two geometric conditions. Reject a version needing disjointness only for the selected pair of correspondences. Descent uses the valuation quotient of L(1), not a general descent assertion for potentially crystalline classes.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.0/cycle-mixed-extension`; `SelmerIwasawaCohomologyPartII:HP.4/supported-finite-abel-jacobi`; `SelmerIwasawaCohomologyPartII:HP.4/localized-crystalline-summand`; `SelmerIwasawaCohomologyPartII:HP.5/finite-condition-pushout`; `SelmerIwasawaCohomologyPartII:HP.0/etale-correspondences-with-support`; `SelmerIwasawaCohomology:L0/local-power-class-finite`.

**Sources.** DL24, Theorem A.8, pp. 327–328; proof, pp. 346–347. The main theorem combines the supported finite-class theorem three times with a localized finite-condition pushout.

### Disjoint closures on a smooth model

**Target:** `SelmerIwasawaCohomologyPartII:HP.5/smooth-disjoint-closures` · theorem · planet: Good-reduction bi-extensions

If 𝒳/O_K is proper smooth, X_K projective, n<p, and geometrically trivial cycles of complementary codimensions d+d′=n have disjoint closures, their two Abel–Jacobi extensions and their full mixed extension are finite. Take T=L, m=m′=0 and t=t′=1. For global cycles satisfying HP.1’s (V1)–(V3), at a p-adic place with this smooth model their local canonical height lies in the completed unit subgroup.

**Hypotheses and conventions.** For the height assertion retain the embedding in the prescribed V,V′ and all canonical-height hypotheses, including G1’s unresolved proof obligation. Replacing smooth by strictly semistable without deeper-stratum annihilation is not asserted.

**Construction or proof.**

1. There are no h>1 strata on a smooth model; hence I=T and the localization condition is automatic.
2. A horizontal cycle closure in a smooth model over a DVR meets the special fiber in codimension at least its generic codimension, so the second geometric hypothesis is satisfied.
3. Apply the main theorem with the identity correspondence. For the last assertion apply the local finite-iff-unit criterion.

**Check.** For curves this gives the finite Poincaré biextension of disjoint degree-zero divisor closures when p>2. Strictly semistable reduction alone does not pass this corollary.

**Dependencies.** `SelmerIwasawaCohomologyPartII:HP.5/uniform-crystalline-cycle-biextension`; `SelmerIwasawaCohomologyPartII:HP.1/canonical-local-height`.

**Sources.** DL24, Remark A.9, p. 327; Remark A.15, p. 331. Gives the good-reduction test and the exact local-height consequence, without extending it to all semistable models.

## Worked checks across layers

For a geometrically connected curve, n=2 and d=d′=1. The geometric cycle-class kernel is the degree-zero divisors. Disjoint such divisors give the Poincaré mixed extension of the Jacobian. At a smooth p-adic model with p>2 and disjoint closures, the deeper-stratum module is zero, I=T=L, and the identity correspondences suffice. HP.5 gives finite marginals and full extension. With the stated Panchishkin hypotheses, HP.1 then places the local height in completed units. This test uses the full extension: knowing only the two Jacobian Kummer classes are finite does not certify it.

For a two-step filtration of R², take F₀=0, F₁=R×0, F₂=R² and f(x,y)=(y,0). Each graded action is zero, yet f(0,1)=(1,0)≠0 when R is nontrivial. One has f²=0. Thus “I kills all graded pieces” implies I² kills the extension, not that I already kills it. In the geometric filtration there are 4d−1 pieces. With d≤n−1 this is at most 4n−5, explaining the uniform exponent rather than simply repeating it.

For local coefficients, translate a finite full extension by the Kummer class of a completed unit: the local height remains in the finite sub-torsor. Translating by a uniformizer adds valuation 1 and leaves it. At a place away from p the scalar trace-boundary instead evaluates the uniformizer as −1. This checks that the Kummer convention and the geometric local-index normalization have not been conflated.

For a Tate curve, 0→Q_p(1)→V→Q_p→0 has the expected Panchishkin plus part Q_p(1), and V has monodromy-pure weight −1. Nevertheless H⁰(K,V⁻)=Q_p. Any shortcut that deletes this space in the canonical local height fails. In Nekovář’s Selmer complexes §11.3.9 the norm height is the negative of the Bockstein height with his deformation convention; §11.4 requires additional valuation/logarithmic assumptions and subtracts an exceptional correction to obtain the canonical height. Those assertions are not an unconditional identification of the canonical height in this roadmap. G1 requires the direct local construction.

## Exact supplier obligations

The following are requests in the packet, not claims that the named stages already prove the extra interfaces. Existing fine-grained nodes are cited directly above; requests record the additional statement that they do not yet supply.

### R1. ArithmeticGaloisDuality:R02.1

For bounded-below equivariant sheaf towers on a site with discrete finite-level G-action, justify the continuous equivariant derived-sections/geometric-sections spectral sequence after Rlim and rationalization when all R¹lim H^q have finite p-power exponent. Include the limit topology, equivariant acyclic resolutions, finite flat W scalar restriction, and the natural first edge on the geometric kernel. This is the site/period-coefficient extension of the existing Milnor and continuous-cochain interfaces, not only the discrete group-quotient Hochschild–Serre theorem.

Consumers: `SelmerIwasawaCohomologyPartII:HP.0/geometric-hochschild-serre-edge`.

### R2. EtaleDualityAndPerverseSheaves:EDC.0

Provide the enhanced localization and Mayer–Vietoris diagrams with cup, proper-support trace and coefficient maps for p-invertible finite towers and rational limits. Include compatible cones for two possibly singular pure-codimension supports, the Kummer sign of the boundary trace, and Galois-equivariant pullback/degree-trace splitting for a proper generically finite alteration of smooth generic opens. Existing EDC.3 smooth-pair Gysin alone must not be applied to singular cycle supports.

Consumers: `SelmerIwasawaCohomologyPartII:HP.0/cycle-mixed-extension`, `SelmerIwasawaCohomologyPartII:HP.1/local-index-away-p`, `SelmerIwasawaCohomologyPartII:HP.1/beilinson-local-index-comparison`, `SelmerIwasawaCohomologyPartII:HP.1/abel-jacobi-finite-condition`, `SelmerIwasawaCohomologyPartII:HP.2/supported-syntomic-abel-jacobi`, `SelmerIwasawaCohomologyPartII:HP.3/altered-semistable-pair`, `SelmerIwasawaCohomologyPartII:HP.3/supported-period-comparison`, `SelmerIwasawaCohomologyPartII:HP.3/alteration-kernel-descent`.

### R3. SchemeAndStackFoundations:SF.5

Supply raw cycle groups, finite flat pullback, proper pushforward and their base-change/composition formulas before passing to rational equivalence. The finite étale span monoid algebra and its integral support transport are owned in HP.0; existing MC.0 Chow-correspondence action supplies its compatibility on Chow groups, not a replacement for raw cycle supports.

Consumers: `SelmerIwasawaCohomologyPartII:HP.0/etale-correspondences-with-support`.

### R4. PadicHodgeTheory:R06.2

Supply exact/faithful strict D_dR and D_cris on their admissible representation categories, G-stable subquotient functoriality, semistable finite-condition complexes and two exact consequences: (a) a semistable monodromy-pure weight −1 V has H¹_st=H¹_f, by the absence of φ=p⁻¹ on D_st(V)/ND_st(V); (b) for a crystalline pure weight −1 summand W of H∨(1) and a finite dual extension class supported in W, 0→H¹_f(L(1))→H¹_f(E)→H¹_f(H)→0 for all finite base extensions, with the complement split. Also retain the Tate-curve exceptional H⁰(V⁻) terms in the canonical local mixed-extension calculation. This is an extension of the listed period/weak-admissibility nodes, not an assumption that all crystalline extensions stay crystalline.

Consumers: `SelmerIwasawaCohomologyPartII:HP.1/panchishkin-subrepresentation`, `SelmerIwasawaCohomologyPartII:HP.1/abel-jacobi-finite-condition`, `SelmerIwasawaCohomologyPartII:HP.1/canonical-local-height`, `SelmerIwasawaCohomologyPartII:HP.5/finite-condition-pushout`.

### R5. CohomologyComparisons:CP.4

Extend the proper potential-semistability interface to H^q_et(Y_Kbar,Q_p) of smooth separated algebraic Y/K, with localization, finite-extension descent data and G-stable subquotients, so the Abel–Jacobi extension realized in open-complement cohomology is potentially semistable. The existing proper-rigid theorem does not supply this smooth-open statement. A direct Nekovář 2000 Theorem 3.1 route can replace it once the primary proof is accessible.

Consumers: `SelmerIwasawaCohomologyPartII:HP.1/abel-jacobi-finite-condition`.

### R6. DeligneWeightsAndPurity:DWP.7

Export the arithmetic good-prime consequence of the existing smooth proper finite-field purity theorem: combine good-reduction base change and its Galois equivariance to exclude Frobenius eigenvalue 1 on every G_K quotient of H^{2d−1}(X_Kbar,L(d)) at a good finite prime away from p. The finite-field purity theorem is already imported by its exact node ID. This request is its good-prime/base-change application, not a new purity theorem or a claim about quotients of arbitrary monodromy-pure local p-adic representations.

Consumers: `SelmerIwasawaCohomologyPartII:HP.1/abel-jacobi-finite-condition`.

### R7. PadicHodgeTheory:R06.5

Add the integral site-level Kato/Sato interfaces for 0≤d<p−1: S(d)≃τ≤d i*Rj*μ_{p•}^{⊗d}; Sato T(d) and its logarithmic Hodge–Witt triangle; refined cycle classes with zero residue (Sato 2013 Proposition 9.10); support, cup and trace compatibility. Supply the finite-coefficient crystalline injectivity/base-change used in DL24 B.8 (Sato A.3.1/9.5), compatible Galois log-PD embedding systems and their divided-Frobenius complexes, p^a-almost comparison/finiteness giving B.21’s exact admissibility claims, the π_r equivalence for n−1≤r<p−1 on strict-pair boundary diagrams, and cup with the point Tate class for weight raising. Existing rational HK syntomic fibers and proper C_st comparison are imported; they do not by themselves supply these integral supported maps.

Consumers: `SelmerIwasawaCohomologyPartII:HP.2/supported-syntomic-abel-jacobi`, `SelmerIwasawaCohomologyPartII:HP.2/log-rigid-obstruction`, `SelmerIwasawaCohomologyPartII:HP.2/supported-cycle-lift`, `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-diagram`, `SelmerIwasawaCohomologyPartII:HP.3/boundary-period-cohomology`, `SelmerIwasawaCohomologyPartII:HP.3/supported-period-comparison`, `SelmerIwasawaCohomologyPartII:HP.3/syntomic-edge-compatibility`.

### R8. tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Use the existing principal-idele reciprocity and local compatibility to identify the p-completed finite-idelic quotient Γ_{K,p}, its finite generation as a Z_p-module, and the local completed K_v× maps into it; prove the almost-everywhere vanishing and principal-relation exactness used when summing the local height indices. The underlying Artin maps and idele carriers remain upstream-owned.

Consumers: `SelmerIwasawaCohomologyPartII:HP.1/global-height-pairing`.

## Proof-verification gap

**G1 — Canonical local Hodge splitting with exceptional quotients.** The defining local torsor splitting and finite-iff-unit criterion are stated in DL24 A.7/A.15, but the full proof cited to Nekovář 1993 §§1–4 and 7 was not accessible. SC §11.3 constructs a norm height and §11.4 corrects it under additional valuation and logarithmic invertibility hypotheses; it does not justify identifying that restricted construction with the general A.7 canonical local height. Verify the original filtered-semistable mixed-extension construction, its exceptional H⁰(V⁻) terms and normalization before claiming closure. This gap affects the canonical height proof, not the separate B.9/B.11/A.8 chain.

Consumers: `SelmerIwasawaCohomologyPartII:HP.1/canonical-local-height`, `SelmerIwasawaCohomologyPartII:HP.1/global-height-pairing`, `SelmerIwasawaCohomologyPartII:HP.5/smooth-disjoint-closures`.

## Ownership proposals for the independent continuations

Issue #3430 permits planning its first independent direction and assigning the rest to separate roadmaps. The shared parent finite-condition library is their common interface; it does not turn the three proof developments into one dependency chain. The packet contains every item ID, so accepting the split can create design jobs without losing any routed target. These are scope proposals, not completed blueprints of those two sources.

### ArithmeticLevelRaisingAndBipartiteEulerSystems

198 items from `PAPER-LIU-ETAL-22`; parent `SelmerIwasawaCohomology`, area iwasawa.

This direction consumes the parent’s Selmer/duality interfaces and the unitary geometry, level-type, automorphy and Euler-system roadmaps. It owns the proof-specific arithmetic level-raising and annihilator argument. It has no dependence on HP.0–HP.5 heights.

| Proposed stage | Targets |
| --- | --- |
| AL.0 — Coefficients, genericity and admissible primes | Finite coefficient rings, polarizations, sign-sensitive Frobenius conditions and admissible auxiliary primes; import the parent Selmer and Euler-system coefficients. |
| AL.1 — Localized unitary geometry | Unitary integral models and incidence correspondences, localized weight sequences and potential maps, with the existing Shimura/Rapoport–Zink suppliers. |
| AL.2 — Arithmetic level raising | LTXZZ Theorems 6.2.3 and 6.3.4 at every level-raising place, with torsion coefficient and localization hypotheses. |
| AL.3 — Geometric and explicit reciprocity | Theorems 4.6.2, 5.11.5, 7.2.8 and 7.3.4, linking cycles, degeneracy maps and singular local cohomology. |
| AL.4 — Rankin–Selberg Selmer annihilators | Theorems 8.2.2 and 8.3.2 and their explicitly scoped corollaries, with the Euler/Kolyvagin argument and no unsupported norm-compatible Euler-system assertion. |

**Source warnings carried with the assignment.**

- Preserve extraction E1/E2/E23: use the γ-Frobenius condition in q(N^α), not the fixed-space shortcut; one conjugation eigenspace can vanish.
- Preserve E102: auxiliary-prime sign depends on the Selmer class; the rank-one argument may need primes of both signs, whose existence hypotheses must be explicit.
- Preserve E8: the torsion coefficient statement in Lemma 5.9.3(6) supplies the injection used by the argument, not an unsupported isomorphism.
- Preserve E89: the special mod-λ^m level-raising condition is required at every place in Σ_lr.
- Preserve E105 and E30: the corollaries’ F⁺≠Q restriction and unpublished KSZ Hypothesis 3.2.10 must remain visible.
- Preserve E93 and E106 supplier needs: semistable potential maps and the ℓ-adic Faltings comparison.

Ownership/scope proposal from the existing extraction and full route brief; the 198 source results have not been independently re-proved in this height job.

### AdjointSelmerGroupsFromModularityLifting

19 items from `PAPER-CALEGARI-GERAGHTY-20`; parent `SelmerIwasawaCohomology`, area iwasawa.

This direction imports the parent finite local conditions and the deformation/patching and automorphy suppliers. It owns the adjoint-vanishing consequence and its explicit conditional hypotheses; it neither constructs heights nor repeats arithmetic level raising.

| Proposed stage | Targets |
| --- | --- |
| AV.0 — Selmer and deformation tangent spaces | Compare H_f with the precise local deformation conditions, then convert R=T and tangent control to adjoint Selmer vanishing. |
| AV.1 — Betti vanishing at Taylor–Wiles levels | Cohomology vanishing with the actual level, residual irreducibility and descent hypotheses. |
| AV.2 — Coherent symplectic vanishing | Separate the ω and ω² coherent-cohomology assertions and their boundary conditions; retain any unresolved ω²(−∞) input as a hypothesis. |
| AV.3 — Conditional GL_n adjoint vanishing | Appendix Theorem A.2 for weight-zero regular algebraic conjugate-self-dual GL_n/CM representations, enormous residual image, specified Steinberg/unipotent local behavior, sufficiently large p and Conjecture B except part (4). |
| AV.4 — GSp_4 adjoint vanishing and density | Appendix Theorem A.1 for semistable modular abelian surfaces with End(A)=Z, sufficiently large ordinary p and the four displayed noncongruence factors in the source, plus the stated density consequence. |

**Source warnings carried with the assignment.**

- Preserve E135: descent needs invariant vanishing or prime-to-p degree; a blanket invariance step is insufficient.
- Preserve E140: retain absolute irreducibility and the residual-image hypotheses.
- Conjecture B except part (4), large-p/minimal-conductor assumptions and the precise determinant/dual conventions remain hypotheses.
- Preserve E150: do not silently substitute the ω assertion for the required ω²(−∞) assertion.
- Retain the Arthur-transfer/GSp_4 automorphy supplier as a named conditional input wherever its owner remains conditional.

Ownership/scope proposal from the existing extraction and full route brief; the 19 appendix items have not been independently re-proved in this height job.

The proposed rescope of NE.7 assigns its generic local Panchishkin and canonical height interface to HP.1. NE.7 keeps the equivariant Bockstein, leading-term and semisimplicity results and imports this interface; NC.5 and GZ.9 keep their curve-specific results. CR.6, RD.4 and PH retain their existing generic geometric and period targets. No upstream Tau Ceti roadmap is changed by these proposals.

## Source corrections and categorical convention

The following findings are also recorded in the packet’s sourceIssues, against the versions actually read. Existing extraction findings retain their provenance; the new enhancement finding awaits independent review.

### E1 — Proof of Lemma A.5, published pp. 323–324; arXiv v3 agrees

The cochain description switches from C^q to an undefined E^q; two representative names also change to undefined symbols.

**Correction.** Use C^q throughout the kernel/boundary display, a for the chosen lift class and b^q for the closed representative. Fix the connecting-map sign independently as in HP.0.

**Reason.** The relevant complexes in this proof are A,B,C; the subsequent differential computation uses b^q and the lift class a. Affects: nothing. Previously recorded and confirmed as PAPER-DISEGNI-LIU-24/E4; no published correction located.

### E2 — §A.3, published p. 325; arXiv v3 agrees

The vanishing clause for κ_c′ uses twist L(d), while the stated domain of κ_c′ has twist L(d−1).

**Correction.** In that clause use L(d−1) on X and Z′, or state it for κ_c′(1) with twist L(d).

**Reason.** A map can vanish on the indicated image only when its source is the target of that image map; the localization diagram subsequently uses κ_c′(1). Affects: nothing. Previously recorded and confirmed as PAPER-DISEGNI-LIU-24/E5; no published correction located.

### E3 — Proof of Theorem A.8, third use of B.11, published p. 347; arXiv v3 agrees

The finite class after applying t₂* and its pushout are assigned the support open U_t.

**Correction.** Both groups use U after t₂* has transported support; reserve U_t for the input to the correspondence.

**Reason.** B.11 has source H_c(U_t) and target H_c(U), and the mixed-extension pushout is built from the latter. Affects: nothing. Previously recorded and confirmed as PAPER-DISEGNI-LIU-24/E6; no published correction located.

### E4 — Lemma A.4, p. 322, and proof of B.17, p. 367, published; arXiv v3 agrees

A.4 is written for Z_{p•}, although its subsequent applications have finite flat W coefficients; the last proof also changes equivariant H^q_{G_K} to H^q_K.

**Correction.** Use finite flat W with scalar restriction to Z_p, then restore W-linearity; retain G_K as the equivariant group subscript.

**Reason.** The cochain/limit argument is linear under finite flat scalar restriction, and the barred crystalline coefficients in B.21 have precisely those W coefficients. Affects: nothing. Previously recorded and confirmed in PAPER-DISEGNI-LIU-24/E7; no published correction located.

### E5 — Definition B.12, published p. 348; arXiv v3 agrees

A finite complex in an arbitrary triangulated category is assigned canonical successive homotopy fibers and canonical induced operators.

**Correction.** Construct the actual boundary diagram in a dg/stable enhancement with its coherent maps, then totalize and pass to the triangulated category. The embedding complexes used here provide such data.

**Reason.** A bare triangulated category does not have functorial cones or uniquely specified fibers. Already for the zero map L[−1]→L, its fiber has nontrivial triangular automorphisms fixing the endpoint maps; a longer complex also omits higher coherence. The supported construction is repaired by explicit enhanced complexes. Affects: a stated result. new

Existing-correction searches: Published Inventiones PDF at DOI 10.1007/s00222-024-01243-7, read 2026-10-19; the corresponding displays were compared with arXiv v3. arXiv:2204.09239 submission history, checked 2026-10-19: v3 dated 2024-02-23 remains the last listed revision. Yifeng Liu’s publication page, checked 2026-10-19: no correction linked for this article; an unrelated article has its own erratum link. Existing confirmed extraction findings PAPER-DISEGNI-LIU-24/E4–E7.

## Sources and suggested signatures

- **DL24.** Daniel Disegni; Yifeng Liu, *A p-adic arithmetic inner product formula*. Inventiones mathematicae 236 (2024), 219–371; version of record, with arXiv:2204.09239v3 compared. [Source](https://link.springer.com/content/pdf/10.1007/s00222-024-01243-7.pdf). Appendices A and B, published pp. 320–368; all statements and proofs read in arXiv v3, and journal locators and corrected displays checked in the published PDF. §1.3, definition of Γ_{K,p}; §4.5, equation (4.8), p. 293. SHA-256: `e8c4e026fab0fe89fd7dcbc724009af7b867ad910937ffb9fa7e72289f0f1ef8`.

- **NEK-SC.** Jan Nekovář, *Selmer complexes*. Astérisque 310 (2006), Numdam public scan. [Source](https://www.numdam.org/item/AST_2006__310__R1_0.pdf). §11.3, pp. 363–374, particularly §11.3.9: norm heights and the sign of the Bockstein comparison. §11.4, pp. 375–382: assumptions §11.4.1, exceptional quotient spaces and the canonical-height correction in §11.4.5–11.4.6. SHA-256: `61c84e5ad3252a2e520747215ac57a282addc2b58c824a3637bcd77bbe02153f`.

- **SCHOLL94.** A. J. Scholl, *Height pairings and special values of L-functions*. Author copy of Proc. Sympos. Pure Math. 55.1 (1994), 571–598; locators here use the author copy’s printed pages. [Source](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/height-all.pdf). §5, Theorem 5.3 and proof, author-copy printed pp. 18–21, read on page images; theorem assumptions in §5.0 and referenced §3.6 distinguished from the étale computation used here. SHA-256: `e1214babfd7c4e4c47847472aa7a94fdaadfd65ecac81618088d54c1962d3e12`.

- **NEK93-UNREAD.** Jan Nekovář, *On p-adic height pairings*. Séminaire de Théorie des Nombres, Paris 1990–91, Progress in Mathematics 108 (1993), 127–202; bibliography only, original inaccessible. [Source](https://webusers.imj-prg.fr/~jan.nekovar/pu/height.pdf). Not accessed: author endpoint returned HTTP 403 and publisher chapter PDF was unavailable. DL24 cites Proposition 1.25, §§1–4, 6.7 and 7. Local proof verification remains gap G1.

- **NEK00-UNREAD.** Jan Nekovář, *p-adic Abel–Jacobi maps and p-adic heights*. The Arithmetic and Geometry of Algebraic Cycles, CRM Proc. Lecture Notes 24 (2000), 367–379; bibliography only, original inaccessible. [Source](https://webusers.imj-prg.fr/~jan.nekovar/pu/banff.pdf). Not accessed: author endpoint failed. Theorem 3.1 is cited by DL24 A.7; this packet gives a comparison-based proof route and requests its exact suppliers instead of claiming to have read that theorem.

The companion [suggested file](../suggested/SelmerIwasawaCohomologyPartII.lean) contains the native finite-filtration milestone and four examples. It elaborates at the pinned Mathlib with only the expected admission warnings. Its small size follows the current roadmap shape: missing geometric, semistable and syntomic carriers remain precise reader targets, rather than being replaced by empty predicates or admitted data. It does not claim to formalize the heights or crystalline bi-extension theorem. All thirty packet nodes retain implementationStatus unchecked.
