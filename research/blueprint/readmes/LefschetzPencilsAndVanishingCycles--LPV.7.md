# LPV.7 — invariant cycles and semistable-curve exports

This is the mathematical plan for the two exports of LPV.7. The parent
`LefschetzPencilsAndVanishingCycles:LPV.7` is a navigation index. Its children
are `LPV.7:semistable-curves` and `LPV.7:invariant-cycles`, with their full
roadmap prefix understood throughout this document. Both children are planned
at target level. The six recorded gaps and the supplier requests are part of
that status: none of the three stages is closed or claimed to be implemented.

The curve child computes normalization, specialization and monodromy directly.
It uses LPV.0–2 and the geometry of StableReduction, without a weights input.
For a supplied higher-dimensional strict semistable model it also gives the
source-qualified filtered nearby-cycle calculation used in the Shimura
consumer. The invariant-cycle child proves the equicharacteristic local
theorem through the arithmetic weight cross, then the potentially pure-complex
and projective support-bound extensions. It imports DWP.7–8. DWP.9 consumes
its global export, so importing hard Lefschetz here would make a dependency
cycle.

The ownership boundary is that of accepted restructuring RS-17. StableReduction
owns nodal geometry, normalization and dual graphs. R11.4 of
NeronModelsAndSemistableAbelianVarieties owns the generalized Jacobian,
its character lattice and its integral valuation pairing. LPV owns their
étale realization, with all maps and signs, and does not construct a second
version of those objects. CrystallineCohomology CR.6 owns Hyodo–Kato monodromy;
CohomologyComparisons owns comparisons with that realization.

## Baseline and conventions

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library
audit does not supply any of the three geometric stage targets. The pinned
Mathlib does contain schemes, proper morphisms, module categories, derived
categories, representation invariants, kernels, images and quotients. It also
contains general cohomological spectral sequences and the spectral-object
construction. Those existing carriers must be used. The missing input is the
constructible étale realization and its filtered hypercohomology bridge, not
a new definition of spectral sequence.

All proposed declarations in this part use namespace `TauCeti.LPV7`.
Curve declarations belong to proposed module
`TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`; invariant-cycle
declarations belong to `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`.
The declaration names below omit that namespace only in explanatory prose.
The packet gives every node its stable identifier and direct prerequisites.

A trait is henselian with chosen compatible geometric points. Pass to strict
henselization for the geometric curve calculations and retain residue-Galois
descent. Coefficients are prime to the residue characteristic. Integral curve
normalization and specialization use Λ=ℤ/ℓᵐ, ℤℓ, or the integers in a finite
ℚℓ-extension; nilpotent logarithms, nondegeneracy and the three-piece
monodromy filtration are asserted over rational coefficients. A Tate twist
is part of a map: `N:V→V(−1)` can also be written `N:V(1)→V`. A choice
of Tate coordinate turns this into a displayed matrix, but is not part of
the intrinsic operator.

For a nodal fibre Y, let V(Γ) be its geometric components and E(Γ) its nodes.
Choose tail/head branches. The incidence map is
∂e=[tail e]−[head e], and the normalization differential is its transpose
`d(a)(e)=a(tail e)−a(head e)`. Loops and multiple edges are retained.
`H₁(Γ,ℤ)=ker ∂` is the character lattice; `H¹(Γ,ℤ)=coker d` is its dual.
For the two branches Bₑ, let Λ(e)=coker(diag:Λ→Λᴮᵉ) and
Λ′(e)=ker(sum:Λᴮᵉ→Λ). Their dual branch bases are δₑ and
δ′ₑ=(1,−1). The normal-crossing Kummer calculation in arbitrary dimension
uses exterior powers of **coker diagonal**; it is not an integral
identification of that quotient with the sum kernel in arbitrary rank.

Illusie’s local variation sends δ′ₑ to −nₑδₑ, where nₑ is the node
thickness. Its resulting graph form is `u⁻(a,b)=−Σ nₑaₑbₑ`.
R11.4’s polarized valuation form has positive convention `u⁺=Σ aₑbₑ`
on a regular model. The comparison proves `u⁻=−u⁺` and transports
the connecting-map signs; it does not silently equate the pairings.

## LPV.7:semistable-curves

The first thirteen nodes below form the curve calculation and its geometric
instances. The final five construct the strict normal-crossing description,
filtered spectral sequence and curve comparison. Their premises include an
actual supplied semistable model. Existence of such a model is a separate
supplier obligation.

### Étale normalization differential

Node `normalization-differential` (construction). Declaration `TauCeti.LPV7.normalizationDifferential`.

For the finite oriented dual multigraph Γ of a proper geometrically connected nodal special fibre Y, imported from StableReduction, construct d:Λ^V→Λ^E by (da)e=a(tail e)−a(head e), using the ordered branch sets. Regard d as the degree-zero map of the two-term normalization complex. Λ is ℤ/ℓ^m, ℤℓ or a finite extension of ℚℓ, with ℓ invertible. The graph, its integral homology and orientations are supplied objects; this node builds the étale coefficient realization, not a second graph theory.

Hypotheses. Y is a proper connected geometric nodal curve; ordered branches are chosen only for coordinates. Loops and multiple edges are retained; no component weight or intersection matrix is substituted for Γ.

Construction/proof. Use StableReduction’s normalization and paired branch scheme. Take the branch-difference map in the normalization sequence, as in Illusie91 (2.1.2) and (2.3.5). Identify constant sections with ker d when Γ is connected; orientation reversal is the signed change of edge coordinates.

Acceptance. A loop has zero differential; two parallel edges remain two coordinates. The maps retain the exact source branch sign.

The API is determined by these uses: Illusie91 (1.6.5), (2.3.5) — Computes the toric injection from node residues and prevents confusing cycles with cocycles. LPV.7:semistable-curves; DWP.10 and WeightsInEtaleCohomology:R34.3 — Provides the exact normalization maps, rather than only a graph Betti number.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.LPV7.normalizationDifferential_apply` | simp | For a:Λ^V and e∈E, d(a)(e)=a(tail e)−a(head e). |
| `TauCeti.LPV7.normalizationDifferential_constant` | characterisation | d sends every constant vertex function to zero. |
| `TauCeti.LPV7.normalizationDifferential_reverse` | functoriality | Swapping tail and head multiplies d by −1 on the corresponding edge coordinates. |
| `TauCeti.LPV7.normalizationDifferential_ker` | compatibility | The degree-zero cohomology of this two-term complex is the Mathlib kernel of d; its degree-one cohomology is Λ^E/range d. |

The discriminating unit tests are:

- `TauCeti.LPV7.normalization_tree_test` (computation): For two vertices and one oriented edge, d(a0,a1)=a0−a1; hence the degree-one quotient vanishes.
- `TauCeti.LPV7.normalization_loop_test` (degenerate): For one vertex and one loop, d=0 and the edge quotient is Λ, not zero.
- `TauCeti.LPV7.normalization_parallel_test` (non-example): For two vertices and two parallel edges with the same orientation, d(a0,a1)=(a0−a1,a0−a1), whose quotient has rank one over ℚℓ.

Direct inputs: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `mathlib:LinearMap.ker`, `mathlib:LinearMap.range`.

Source: Illusie91, §§1.1, 2.1–2.3, formulas1.1.1–1.1.3, 2.1.2, 2.3.5.

### Normalization resolution of the constant sheaf

Node `normalization-etale-resolution` (comparison). Declaration `TauCeti.LPV7.normalizationEtaleResolution`.

Let ν:Ỹ→Y be normalization and i_e:{e}→Y the node inclusions. The sequence 0→Λ_Y→ν_*Λ_Ỹ→⊕_e i_e*Λ(e)→0 is exact, where Λ(e)=coker(Λ→Λ^{B_e}) for the two branches B_e, and the last map is restriction to the branches followed by the quotient. Branch ordering identifies Λ(e) with Λ with the same sign as normalizationDifferential. This is an étale constant-sheaf calculation, distinct from the imported coherent normalization/conductor sequence.

Hypotheses. Finite normalization of a proper geometric nodal curve; coefficients prime to the characteristic.

Construction/proof. Check smooth stalks and the two-branch node stalks using the supplied normalization chart. Use conservative geometric stalks to prove exactness. Take derived global sections and identify H⁰(Ỹ,Λ)→⊕Λ(e) with the normalization differential.

Acceptance. At a node the cokernel of the diagonal Λ→Λ² is rank one. At a smooth point the cokernel vanishes.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/normalization-differential`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Source: Illusie91, §2.3, formulas2.3.1–2.3.5 and Lemma2.4.

### Nearby cycles at nodes

Node `nodal-nearby-cycle-sheaves` (theorem). Declaration `TauCeti.LPV7.nodalNearbyCycleSheaves`.

For a proper flat nodal curve X/S over a strictly henselian trait, with smooth geometrically connected generic fibre and étale local equations uv=a_e≠0 at the nodes, R⁰ΨΛ=Λ_Y, R¹ΨΛ is supported at the nodes, and R^qΨΛ=0 for q>1. There is a canonical residue identification R¹ΦΛ(e)(1)≅Λ′(e), where Λ′(e)=ker(sum:Λ^{B_e}→Λ), dual to Λ(e). Inertia is trivial on these cohomology sheaves, although its action on RΨΛ and on H¹ of the generic fibre need not be trivial.

Hypotheses. ℓ is invertible on S; ν and node charts imported from StableReduction. For the strict semistable subcase, X is regular and every thickness v(a_e)=1.

Construction/proof. Apply LPV.0’s stalk formula and LPV.2’s dimension-one local quadratic calculation at each node. Apply smooth local acyclicity off the nodes. Use the branch residue/trace dualities in Illusie91 (1.3.3), (1.5.1), preserving the twist.

Acceptance. The smooth locus has R¹Φ=0. A split node has one copy of Λ(−1) in R¹Φ; trivial sheaf action does not force N=0 globally.

Direct inputs: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: Illusie91, §§1.2–1.5, formulas1.2.1–1.2.2, 1.3.3 and 1.5.1.

### Node residue and variation sign

Node `node-residue-variation-sign` (lemma). Declaration `TauCeti.LPV7.nodeResidueVariationSign`.

With Illusie’s dual branch bases δ′_e=(1,−1) and δ_e, the normalized local variation N_e:R¹ΦΛ(e)(1)→H¹_e(Y,RΨΛ) sends δ′_e to −n_e δ_e, where n_e=v(a_e). The map to H²(Y,Λ)(1) sends δ′_e to [C_tail]−[C_head]. The two connecting morphisms compared by the localization/normalization diagram differ by a minus sign (Illusie91 Lemmas1.5.4 and2.4).

Hypotheses. Same nodal-family hypotheses; n_e≥1; coefficient/tame character normalization fixed by LPV.1.

Construction/proof. Identify the boundary map through local trace duality and LPV.2’s odd-dimensional Picard–Lefschetz formula. Use the nine-diagram boundary sign to compare local cospecialization with normalization. Insert tℓ(σ), obtaining Var_e(σ)=tℓ(σ)N_e.

Acceptance. For uv=π, N_e is minus the identity in the branch bases. Reversing the branch order changes both bases, leaving the geometric map unchanged.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/nodal-nearby-cycle-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/normalization-etale-resolution`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `EtaleDualityAndPerverseSheaves:EDC.1`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: Illusie91, Lemma1.5.4, §1.7 formulas1.7.1–1.7.4, Lemma2.4.

### Specialization sequence for a nodal curve

Node `curve-specialization-sequence` (theorem). Declaration `TauCeti.LPV7.curveSpecializationSequence`.

For X/S as above, proper base change and the vanishing triangle give 0→H¹(Y,Λ)→H¹(Xη̄,Λ)→⊕_e Λ′(e)(−1)→H²(Y,Λ)→H²(Xη̄,Λ)→0. In branch coordinates the middle boundary is the oriented incidence map on edges, followed by component trace classes. For a connected generic curve H²(Xη̄,Λ)≅Λ(−1), and H⁰ specializes isomorphically. All arrows, twists and Galois actions are retained.

Hypotheses. Proper flat family, geometrically connected smooth generic fibre and reduced nodal special fibre. Work after strict henselization; descent to a henselian base is part of the compatibility theorem.

Construction/proof. Use LPV.0’s proper comparison RΓ(Y,RΨΛ)≅RΓ(Xη̄,Λ). Apply the vanishing triangle and ns; the node support kills H^j(Y,R¹Φ) for j>0. Identify the boundary using sign and compute the final trace using connectedness.

Acceptance. The kernel of the node-to-component map is H₁(Γ,Λ)(−1). A bridge contributes a local vanishing cycle but no nonzero quotient in generic H¹.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/nodal-nearby-cycle-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/node-residue-variation-sign`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: Illusie91, §1.6, formulas1.6.1–1.6.6, §2.2.

### Graph and component cohomology

Node `curve-normalization-cohomology` (theorem). Declaration `TauCeti.LPV7.curveNormalizationCohomology`.

The normalization resolution gives a canonical exact sequence 0→H¹(Γ,Λ)→H¹(Y,Λ)→⊕_v H¹(Ỹ_v,Λ)→0 and H²(Y,Λ)≅⊕_v Λ(−1). Here H¹(Γ,Λ)=coker d, whereas H₁(Γ,Λ)=ker ∂ is its dual lattice realization. No canonical splitting of the H¹ sequence is asserted. Under branch choices, the normalization injection γ′ and the cospecialization map c′ satisfy c′=−γ′.

Hypotheses. Y proper, connected, nodal and geometric; normalized components smooth proper.

Construction/proof. Take the long exact sequence of nr, using finiteness of the node scheme. Identify the graph quotient from nd and component H² by EDC.2 trace. Use sign’s nine-diagram comparison to identify the two graph injections.

Acceptance. A tree has H¹(Y)=⊕H¹(Ỹ_v); a cycle of rational components has graph H¹ of rank one.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/normalization-etale-resolution`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/node-residue-variation-sign`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`.

Source: Illusie91, §§2.1–2.4, especially2.3.5 and Lemma2.4.

### Graph factorization of curve monodromy

Node `curve-monodromy-factorization` (comparison). Declaration `TauCeti.LPV7.curveMonodromyFactorization`.

Put V=H¹(Xη̄,ℚℓ), M=H₁(Γ,ℤ) and M∨=H¹(Γ,ℤ). The LPV.1 operator N:V(1)→V factors as c′ ∘ u− ∘ c, where c:V(1)↠M⊗ℚℓ is the specialization quotient, c′:M∨⊗ℚℓ↪V is cospecialization, and u−(a)(b)=−Σ_e n_e a_e b_e. Equivalently N=γ′ ∘ u− ∘ γ, with γ=−c and γ′=−c′. The negative edge form is nondegenerate over ℚℓ; it need not be an integral isomorphism.

Hypotheses. Proper nodal family of seq, with all positive node thicknesses. Rational coefficients; choose a Tate-coordinate only when writing N as an endomorphism.

Construction/proof. Factor σ−1 through local variation using LPV.0 and sign. Use seq and the dual sequence to identify the quotient and injection with the imported graph lattices. Sum the local maps and use the positive-definiteness of Σ n_e a_e² over ℚ to show rational nondegeneracy.

Acceptance. N²=0 and rank N=b₁(Γ). For a two-edge cycle the scalar pairing is −2; the integral determinant is not forced to be a unit.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/node-residue-variation-sign`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`, `mathlib:LinearMap.ker`, `mathlib:LinearMap.range`, `mathlib:Module.finrank`.

Source: Illusie91, §§2.1–2.2, formulas2.1.3, 2.2.3;2.6.5–2.7.

### Curve invariant cycles without weights

Node `curve-inertia-invariants` (theorem). Declaration `TauCeti.LPV7.curveInertiaInvariants`.

For the rational nodal-curve setting, sp:H¹(Y,ℚℓ)→V is injective with image V^I=ker N. In degrees0 and2 specialization is surjective onto invariants as well; in degree2 it is the component-trace sum and is an isomorphism only when there is one geometric component. This result follows from the explicit monodromy calculation and does not import DWP.

Hypotheses. The proper nodal-family hypotheses and ℓ invertible; N is twist-aware.

Construction/proof. From nf, rational injectivity of u− and c′ gives ker N=ker c. Use seq to identify ker c with the special-fibre image. Use ρ(σ)=1+tℓ(σ)N and surjectivity of the tame character to identify ker N with invariants.

Acceptance. Smooth specialization has N=0 and is an isomorphism in all degrees. A two-component rational cycle has invariant H¹ of dimension one and generic H¹ of dimension two.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-factorization`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Source: Illusie91, Remarques2.8–2.9, printed p.42.

### Curve monodromy filtration and its graded pieces

Node `curve-monodromy-filtration` (theorem). Declaration `TauCeti.LPV7.curveMonodromyFiltration`.

The LPV.1 monodromy filtration of V=H¹(Xη̄,ℚℓ), centered at1, is M_j=0 for j<0, M_0=im N, M_1=ker N=sp H¹(Y), and M_j=V for j≥2, after the appropriate Tate-coordinate identifications. Canonically gr_0≅H¹(Γ,ℚℓ), gr_1≅⊕H¹(Ỹ_v,ℚℓ), and gr_2≅H₁(Γ,ℚℓ)(−1). N:gr_2→gr_0(−1) is the negative edge-pairing isomorphism in the specified residue coordinates. These indices label monodromy, without asserting Frobenius weights over an arbitrary residue field.

Hypotheses. Rational coefficients and the curve setting of nf; monodromy-filtration existence/uniqueness imported from LPV.1.

Construction/proof. Use N²=0 and the LPV.1 uniqueness characterization. Use ni and nc for gr_1 and the graph subspace. Use seq and nf for gr_2 and the twisted N isomorphism.

Acceptance. For a smooth curve only gr_1 survives. For a cycle of rational components gr_1=0, and gr_0,gr_2 each have dimension one.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-factorization`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-inertia-invariants`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Source: Illusie91, Remarque2.9, printed p.42; formulas2.2.3,2.6.5.

### Jacobian and Tate realization of the sequence

Node `jacobian-tate-realization` (comparison). Declaration `TauCeti.LPV7.jacobianTateRealization`.

For a regular projective semistable model X/S of a smooth geometrically connected curve, identify Vℓ(Jac(Xη)) with H¹(Xη̄,ℚℓ)(1). The invariant part identifies with Vℓ(Pic⁰Y), the toric part with H¹(Γ,ℚℓ)(1), and the abelian quotient with ⊕Vℓ(Jac(Ỹ_v)). The torus character lattice is H₁(Γ,ℤ), not H¹. The normalization, specialization and Tate exact sequences commute, with Kummer realization and the canonical principal polarization fixing the identifications.

Hypotheses. Strictly henselian base with algebraically closed residue field, regular projective semistable model; retain the R11.4 Picard/Néron hypotheses. ℓ invertible; rationalize the integral Tate modules only after constructing their maps.

Construction/proof. Import R11.4 normalization and Picard/Néron identity, and A3’s Tate pairings. Use Kummer to compare additive normalization with the multiplicative Picard sequence. Apply the residue sign sign and the torsion-compatible specialization maps to identify the filtration.

Acceptance. The torus rank equals b₁; the abelian rank is twice the sum of normalization genera. The diagrams agree as Galois modules, not just dimensions.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`, `NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence`, `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`, `NeronModelsAndSemistableAbelianVarieties:R11.4/picard-neron-identity`, `AbelianSchemesAndArithmeticModuli:A3`.

Source: Illusie91, §§2.3–2.6, formulas2.3.3–2.3.5 and2.6.1–2.6.5.

### Agreement with the Jacobian valuation pairing

Node `curve-jacobian-pairing` (comparison). Declaration `TauCeti.LPV7.curveJacobianPairing`.

Under jt, the ℓ-adic pairing defined from N by the trace-dual quotient/injection is Illusie’s negative form u−⊗ℚℓ. R11.4’s polarization-normalized integral valuation form u+ has the positive convention Σ a_e b_e on a regular model. Prove u−=−u+ and transport the two connecting-map signs explicitly, rather than asserting the identically named pairings equal. The pairing and factorization are compatible with reorientation and coefficient extension. The thickness-weighted extension uses the supplied regular subdivision comparison.

Hypotheses. Regular projective semistable curve for direct use of R11.4/graph-monodromy; weighted nonregular models require the extra subdivision contract.

Construction/proof. Use Illusie91 Theorem2.7 for the trace-dual Tate realization. Compare with the precise positive convention of R11.4/integral-monodromy-pairing and /graph-monodromy. Use c′=−γ′ and c=−γ to check the commuting square; record rather than discard the overall pairing convention.

Acceptance. For a regular two-edge cycle the two pairings are [−2] and [2]. There is no integral unimodularity claim.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-factorization`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/jacobian-tate-realization`, `NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing`, `NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy`, `mathlib:LinearMap.BilinForm`.

Source: Illusie91, Theorem2.7 and its sign comparison with SGA7 IX9.1.2, printed p.41.

### Choice and base-change compatibility

Node `curve-choice-basechange-compatibility` (theorem). Declaration `TauCeti.LPV7.curveChoiceBaseChange`.

The curve comparison diagrams descend from strict henselization, are equivariant for residue Galois permutations of components and branches, and commute with coefficient extension. Reorientation acts by signed edge permutations. Replacing a Tate-generator coordinate by a unit rescales log T and the coordinate of tℓ together, leaving the twisted N canonical. Under a finite trait extension of ramification index e, after compatible tame/Tate identification N_new=e N_old. A regular semistable resolution subdivides each old edge into e edges; its summed edge pairing gives the same scaling, with exceptional rational components contributing no H¹.

Hypotheses. Use actual proper base-change maps and chosen trait embeddings; allow regular semistable resolutions only through the StableReduction subdivision supplier.

Construction/proof. Use LPV.0 trait base change, LPV.1 tame character compatibility, and signed branch transports. Compare the normalization maps and variation factors before passing to graph quotients. For ramified base change use the nodal chart uv=π^e and the supplied blowup/subdivision geometry.

Acceptance. Unramified base change preserves N; ramification e scales it. An orientation change conjugates matrices, preserving the underlying map and pairing.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-factorization`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-jacobian-pairing`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: Illusie91, §0 thicknesses and §§1.7,2.1–2.7; compare Illusie21 §4.4.

### Smooth, bridge and split-cycle instances

Node `smooth-and-split-cycle-examples` (application). Declaration `TauCeti.LPV7.smoothAndSplitCycleExamples`.

Instantiate the constructions on a smooth proper model (N=0), two smooth components meeting in one node (tree, N=0 on global H¹ despite nonzero R¹Φ at that node), and a split strict semistable genus-one model with two rational components meeting in two nodes. In the last case gr_0 and gr_2 have rank one, gr_1=0, and there are compatible rational bases in which N(a,b)=(−2b,0) and ρ(σ)=1+tℓ(σ)N. Prove existence or import an actual algebraic model with this special fibre; an abstract two-dimensional linear map alone is only the algebraic test.

Hypotheses. An actual proper strict semistable model, ℓ invertible, and branch/Tate conventions as above. For the split genus-one instance, import an I₂ regular Tate/elliptic model with split rational components.

Construction/proof. Apply seq, nc, nf and mf to the three imported geometric instances. Compute the one-dimensional cycle generator (1,−1) for the two-edge graph and its negative norm −2. Use jt to check the Tate-module interpretation and retain the distinction between the linear test and geometric existence.

Acceptance. The two-edge N is nonzero over ℚℓ for every ℓ, including ℓ=2. The bridge is not mistaken for a nonzero global monodromy contribution.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-inertia-invariants`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/jacobian-tate-realization`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

Source: Illusie91, §§2.1–2.2, especially2.1.1 and2.1.3; Remarques2.8–2.9.

### Strict normal-crossing nearby-cycle stalks

Node `snc-nearby-cycle-description` (theorem). Declaration `TauCeti.LPV7.sncNearbyCycleDescription`.

Let X/S be strictly semistable of pure relative dimension d in Saito’s chart sense: locally étale over Spec R[t₀,…,t_d]/(t₀⋯t_r−π), 0≤r≤d, with smooth irreducible special components. For Λ=ℤ/ℓ^m, ℤℓ or ℚℓ and a geometric point lying on a branches, R^qΨΛ_x≅∧^q(coker(diag:Λ→Λ^a))(−q). This is the stalk form of the Kummer-residue description, with R⁰Ψ=Λ and inertia trivial on all R^qΨ. The residue resolution is canonical before choosing a basis; this theorem does not determine the derived inertia action by its cohomology-sheaf action.

Hypotheses. Henselian DVR; ℓ invertible; strict semistable charts, not just a divisor called semistable. Use the global component ordering only to write alternating residue coordinates.

Construction/proof. Use Saito03 Prop1.1.1 tameness and relative duality, requested in their trait scope. Construct the Kummer classes for the components and the uniformizer. Apply Prop1.1.2 and Cor1.1.3 to get the residue resolution; evaluate at a geometric stalk.

Acceptance. One branch gives R^qΨ=0 for q>0; two branches give one Λ(−1); three give ranks1,2,1.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: Saito03, §1.1, Propositions1.1.1–1.1.2 and Corollary1.1.3; Illusie21 (2.5), reduced multiplicity-one case.

### Graded nearby complex for strict semistability

Node `snc-graded-nearby-complex` (comparison). Declaration `TauCeti.LPV7.sncGradedNearbyComplex`.

Let a_j:Y^(j)→Y be the disjoint union of (j+1)-fold component intersections (Y^(0) denotes components). For ℚℓ coefficients, the LPV.1 monodromy filtration centered at0 on the shifted-perverse nearby complex has gr_r RΨℚℓ≅⊕_{p,q≥0,p−q=r} a_{p+q,*}ℚℓ(−p)[−p−q]. N lowers r by2 and sends the (p,q) summand identically to the (p−1,q+1) summand after a (−1) twist when p≥1, and to zero otherwise. This comparison supplies a concrete model; it neither constructs a second general monodromy filtration nor imports weight theorems.

Hypotheses. Strict semistability of sn; ℚℓ coefficients. The perverse interpretation RΨℚℓ[d] and its constructibility must be justified in this trait setting.

Construction/proof. Follow Saito03 Lemma2.2.1 and Cor2.2.2: kernel filtration is canonical truncation and image filtration is identified through residues. Use the LPV.1 convolution characterization to obtain gr_r. Check generator independence and identify log(T) on the graded with the leading T−1 map.

Acceptance. For two components, gr₁=ℚℓ_C(−1)[−1], gr₀=ℚℓ_D1⊕ℚℓ_D2, gr₋₁=ℚℓ_C[−1]. Trivial action on R^qΨ does not replace the nonzero derived N.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-nearby-cycle-description`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `EtaleDualityAndPerverseSheaves:EDC.5`, `mathlib:DerivedCategory`.

Source: Saito03, Lemma2.2.1, Corollary2.2.2, Proposition2.2.3 (author numbering); Illusie21 (6.3)–(6.4).

### Strict semistable weight spectral sequence

Node `snc-weight-spectral-sequence` (construction). Declaration `TauCeti.LPV7.weightSpectralSequence`.

From the finite filtered nearby complex construct the cohomological spectral sequence E₁^{p,q}=⊕_{i≥max(0,−p)} H^{q−2i}(Ȳ^(p+2i),ℚℓ(−i))⇒H^{p+q}(Xη̄,ℚℓ), with d_r of bidegree(r,1−r). Empty/negative-index strata contribute zero, so the displayed sum is finite. Properness is used to identify RΓ(Ȳ,RΨℚℓ) with generic cohomology. Without properness the same filtered-complex construction abuts to H^{p+q}(Ȳ,RΨℚℓ), without asserting that it is H^{p+q}(Xη̄,ℚℓ). The induced filtration on H^m is M′, with the weight indexing W_sH^m=M′_{s−m}; equality with the canonical monodromy filtration on H^m is a separate theorem.

Hypotheses. Strict semistability of sn; finite-dimensional constructible cohomology; proper X for the generic-fibre abutment. Coefficients ℚℓ; no Frobenius-weight or degeneration premise in this construction.

Construction/proof. Apply Mathlib’s spectral-object spectral-sequence machinery to the finite filtration in sg; request the étale hypercohomology bridge rather than redefine spectral sequences. Compute E₁ by sg and proper pushforward from strata. Prove convergence from bounded filtration and proper base change, identifying its actual abutment and filtration maps.

Acceptance. A smooth model has only p=0 terms. For curves the page has the normalization restriction and node Gysin maps of seq and nc. Nonproperness does not erase the spectral sequence but changes the justified abutment.

The API is determined by these uses: LTXZZ22 §5.9 Construction5.9.1 and Lemma5.9.3 — Supplies stratum maps and the T−1 action; arithmetic localizations and their degeneration belong to the consumer. DWP.10; WeightsInEtaleCohomology:R34.3 — Exports a filtered geometric calculation with degeneration and weight-monodromy obligations kept distinct.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.LPV7.weightSpectralSequence_e1` | data | The first page is canonically isomorphic to the displayed finite sum of twisted stratum cohomology. |
| `TauCeti.LPV7.weightSpectralSequence_e2` | compatibility | The second page is the homology of the actual first-page differential, through Mathlib’s spectral-sequence iso. |
| `TauCeti.LPV7.weightSpectralSequence_abutment` | characterisation | For proper X the finite filtration converges to generic-fibre cohomology with the induced filtration M′; retain the filtered comparison maps. |
| `TauCeti.LPV7.weightSpectralSequence_reindex` | functoriality | A signed permutation of component indices induces an isomorphism of spectral sequences compatible with stratum maps and N. |

The discriminating unit tests are:

- `TauCeti.LPV7.weight_ss_smooth_test` (degenerate): With one smooth component, E₁^{0,q}=H^q(Y,ℚℓ), and E₁^{p,q}=0 for p≠0.
- `TauCeti.LPV7.weight_ss_curve_test` (computation): For relative dimension1, E₁^{−1,2}=H⁰(nodes,ℚℓ)(−1), E₁^{0,1}=⊕H¹(components,ℚℓ), E₁^{1,0}=H⁰(nodes,ℚℓ); d₁ also includes components→nodes and nodes→H²(components).
- `TauCeti.LPV7.weight_ss_nonproper_test` (non-example): For the local model uv=π the construction abuts to H*(Ȳ,RΨ), and the signature contains no unsupported proper-base-change isomorphism to generic H*.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-graded-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `EtaleDualityAndPerverseSheaves:EDC.0`, `mathlib:CategoryTheory.CohomologicalSpectralSequence`, `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence`, `mathlib:ModuleCat`, `mathlib:CategoryTheory.Abelian.SpectralObject`, `mathlib:CategoryTheory.Abelian.SpectralObject.SpectralSequenceDataCore`, `mathlib:CategoryTheory.Abelian.SpectralObject.HasSpectralSequence`, `mathlib:CategoryTheory.Limits.IsZero`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: Saito03, Corollary2.2.4 and proof (author numbering; published Corollary2.8); LTXZZ22, §5.9, Construction5.9.1, printed p.231, and Lemma5.9.3 proof, printed pp.233–240.

### Restriction and Gysin differential

Node `snc-restriction-gysin-differential` (theorem). Declaration `TauCeti.LPV7.weightSpectralSequenceDifferential`.

Order the special components. For J=I\{i_j}, use sign (−1)^j; let δ* be the alternating restriction maps from (r+1)-fold to (r+2)-fold intersections and δ_* the alternating Gysin maps in the reverse direction, of cohomological degree2 and twist(1). In Saito’s convention d₁ is δ*+δ_* on the corresponding E₁ summands. Their squares vanish and their mixed compositions anticommute by divisor/intersection compatibility. A transpose to Rapoport–Zink coordinates uses the signed conjugation (−1)^{ij}, not an unqualified assertion of identical matrices.

Hypotheses. Strict semistable strata; Gysin maps between smooth strata with their codimension and purity hypotheses. Actual coefficient twists and component ordering, not abstract arrows called Gysin.

Construction/proof. Import EDC.3 transverse restriction/Gysin, self-intersection and projection formulas. Identify boundary maps in Saito03 Lemma2.2.5 and Proposition2.2.6 via the residue classes. Compute the total-complex signs and compare the manuscript’s final paragraph with Rapoport–Zink indexing.

Acceptance. For curves the maps agree with the incidence maps used in seq, after its explicitly specified residue coordinates. For three intersecting components, the alternating second boundary vanishes.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-weight-spectral-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-nearby-cycle-description`, `EtaleDualityAndPerverseSheaves:EDC.3`.

Source: Saito03, Lemma2.2.5 and Proposition2.2.6, author pp.21–26, including final sign comparison.

### Monodromy on the spectral sequence and curve agreement

Node `snc-monodromy-and-curve-comparison` (comparison). Declaration `TauCeti.LPV7.spectralMonodromyCurveComparison`.

The twisted N map induces E₁^{p,q}(1)→E₁^{p+2,q−2}. On common stratum summands it is the identity in the normalized graded coordinates of sg, and is zero on absent summands. It commutes with d₁ and persists to the abutment. For curves, finite page positions force E₂=E∞ and the induced filtration, recentered at1, agrees with mf; the identification of its N with nf includes the residue-coordinate sign. In higher dimensions no equality between M′ on cohomology and its canonical monodromy filtration is inferred merely from existence of the sequence or an E₂ degeneration input.

Hypotheses. Rational coefficients, strict semistability; properness for generic cohomology. The integral statement in the source is for ν=T−1; log(T) is not defined by an integral series in general.

Construction/proof. Use Saito03 Cor2.2.4(2) and sg to compute N on each common summand. Check compatibility with sd through the filtered morphism. For curves compute E₂ kernels/cokernels, observe the remaining d_r have zero targets for r≥2, and compare their edge pairing to nf.

Acceptance. The curve E₂ pieces are graph cohomology, component H¹ and graph homology with the stated twist. The rational logarithm and T−1 have the same leading action on gr, without claiming they are equal on every higher-dimensional complex.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-weight-spectral-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-restriction-gysin-differential`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-factorization`.

Source: Saito03, Corollary2.2.4(2), author pp.19–20; Illusie21 §§6.3–6.4; LTXZZ22, §5.9, monodromy-filtration discussion preceding Lemma5.9.3, printed p.233.

## LPV.7:invariant-cycles

The local constant-sheaf theorem is stated over the henselization of k[T] at
(T), with algebraically closed k, proper f, essentially smooth total space
over k and smooth generic fibre. These are substantive hypotheses. The
arithmetic descent preserves the inertia image and the specialization maps.
The finite-field proof separates weights in an exact localization/Wang cross;
it does not use a semistable model or the higher-dimensional weight spectral
sequence above.

For the pure-complex extension, potential purity includes an integral
finite-type ℤ[1/ℓ]-model, the geometric generic point, the smooth relative
curve and section, the proper family, the arithmetic pure complex and the
realization isomorphisms. The global theorem starts with the distinct absolute
`GeometricGenericPureModel`: a proper arithmetic model of the projective X
and pure K over an integral base, with geometric-generic fibre and complex
realization isomorphisms. The incidence-line pullback converts that absolute
model into the local curve-and-section witnesses. No converse from a local
trait witness to an absolute projective model is asserted.

The support-bound projective theorem has a different
premise: for every j,

`dim Supp ℋʲ(DK[−2n−2]) ≤ n+1−j`.

Equivalently `dim Supp ℋᵠ(DK) ≤ −n−1−q`. Empty support has dimension −∞.
For the constant sheaf on a smooth (n+1)-fold the shifted dual is ℚℓ(n+1),
so its degree-zero support is allowed dimension n+1. This checks the shift
and catches the incorrect bound n−1−j. Weak Lefschetz under this bound needs
no purity or smoothness; global invariant cycles adds the precise potential
purity witness. The extension obstruction uses WeilII4.3.6–8. The
hard-Lefschetz-dependent orthogonal splitting4.3.9 is not an input.

### Specialization with invariant codomain

Node `invariant-specialization` (construction). Declaration `TauCeti.LPV7.invariantSpecialization`.

For f:X→S proper over a henselian trait and K∈Dᵇ_c(X,ℚℓ), the LPV.0 specialization map sp_i:H^i(Xs̄,K)→H^i(Xη̄,K) has inertia-fixed image. Construct sp_i^I by corestriction to the actual invariant submodule of the continuous inertia representation; its composite with the inclusion is sp_i. The map is constructed for every proper family; surjectivity requires one of the source-qualified theorems below.

Hypotheses. ℓ invertible; geometric fibre identifications and continuous coefficient realization supplied by LPV.0, EDC.0 and R02.1.

Construction/proof. Use the trivial inertia action on i*K and equivariance of the vanishing triangle. Apply Representation.invariants and LinearMap.codRestrict, not a new fixed-space predicate. Transport the corestriction along compatible proper/trait base-change comparisons.

Acceptance. The underlying map is exactly sp_i. There is no surjectivity assertion in this construction.

The API is determined by these uses: WeilII Theorems3.6.1 and6.2.9 — Gives the actual map whose surjectivity is proved by the weight cross. DWP.9, WeilII6.2.13 — Ensures the global theorem exports the invariant subspace as a linear-map image, not merely equality of dimensions.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.LPV7.invariantSpecialization_coe` | projection | The inclusion of invariants composed with sp^I equals sp. |
| `TauCeti.LPV7.invariantSpecialization_range` | characterisation | sp^I is surjective exactly when range sp equals the invariant submodule. |
| `TauCeti.LPV7.invariantSpecialization_unique` | extensionality | A linear map to invariants whose composite with inclusion is sp equals sp^I. |
| `TauCeti.LPV7.invariantSpecialization_natural` | functoriality | For equivariant cohomology comparison maps commuting with sp, the corestricted maps commute too. |

The discriminating unit tests are:

- `TauCeti.LPV7.invariant_sp_identity_test` (degenerate): For the identity map and trivial action, the corestriction is surjective.
- `TauCeti.LPV7.invariant_sp_zero_test` (non-example): The zero map to a nonzero trivially acted-on one-dimensional space corestricts but is not surjective.
- `TauCeti.LPV7.invariant_sp_unipotent_test` (computation): On ℚ² with ρ(t)(a,b)=(a+tb,b), the injection a↦(a,0) corestricts surjectively to invariants; the full identity ℚ²→ℚ² has no fixed-image witness.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `mathlib:Representation.invariants`, `mathlib:Representation.mem_invariants`, `mathlib:LinearMap.codRestrict`, `EtaleDualityAndPerverseSheaves:EDC.0`, `ArithmeticGaloisDuality:R02.1`, `mathlib:Representation.trivial`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: WeilII, Introduction to §3.6, printed p.212; specialization in6.2.9.

### Arithmetic spreading with inertia-image control

Node `arithmetic-spreading` (lemma). Declaration `TauCeti.LPV7.arithmeticSpreading`.

For k algebraically closed, S=Spec(k[T]^h_(T)), f:X→S proper, X essentially smooth over k and Xη smooth, spread to f′:X′→C with C a smooth k-curve, X′ smooth, and f′ smooth off the marked point. Then descend after shrinking an integral finite-type arithmetic parameter base to a finite-field fibre, preserving the specialization cohomology maps and the image of local inertia in the relevant ℓ-adic local system. One must preserve inertia-fixed subspaces, not only Betti numbers; use WeilII1.11.1–1.11.3’s tame-cover specialization on a sufficiently small parameter open.

Hypotheses. Finite-presentation descent with a marked smooth curve section and compatible coefficient systems; ℓ invertible. Use the prime-to-residue-characteristic/tame tower and any required finite extension explicitly.

Construction/proof. Apply limit descent to algebraize the henselian family with its marked point. Use the tame compactification tower and stabilizers of lifted boundary sections in1.11.3. Apply proper/smooth base change to the family of cohomology maps and preserve the local monodromy image while choosing a closed finite-field parameter.

Acceptance. The comparison identifies invariants and specialization image; mere equality of ranks is insufficient.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/invariant-specialization`, `LefschetzPencilsAndVanishingCycles:LPV.5`, `EtaleDualityAndPerverseSheaves:EDC.0`, `ArithmeticGaloisDuality:R02.1`.

Source: WeilII, Proof3.6.1, printed p.213, referring to1.11.3; read1.11.1–1.11.3.

### Continuous Wang sequence over the trait

Node `continuous-wang-sequence` (theorem). Declaration `TauCeti.LPV7.continuousWangSequence`.

In the strict henselian equicharacteristic setting of spread, continuous ℓ-adic Hochschild–Serre gives 0→H^{i−1}(Xη̄,ℚℓ)_I(−1)→H^i(Xη,ℚℓ)→H^i(Xη̄,ℚℓ)^I→0. Its finite-level derivation uses 1→I′→I→ℤℓ(1)→1, exact averaging for the pro-prime-to-ℓ kernel, and putting W=V^{I′}≅V_{I′}, H⁰(ℤℓ(1),W)=V^I, H¹(ℤℓ(1),W)=V_I(−1), H^j=0 for j≥2. Prove the inverse-limit/rationalization comparisons under the source’s finite constructibility hypotheses; Mathlib’s discrete group cohomology is not by itself this continuous theorem.

Hypotheses. ℓ-adic continuous representations arising from proper geometric cohomology; finite-level ℓ-power torsion systems.

Construction/proof. Import R02.2 continuous Hochschild–Serre and R02.1 inverse-limit exactness. Average the finite prime-to-ℓ quotients and pass to continuous invariants. Use the two-column spectral sequence to obtain the exact edge sequence with Tate twist.

Acceptance. For trivial rank-one coefficients, H¹(I,ℚℓ)=ℚℓ(−1). The degree-two term vanishes without treating ℤℓ as a discrete infinite cyclic group.

Direct inputs: `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Source: WeilII, Proof3.6.1, equations(1)–(5), printed p.213.

### Localization and Wang duality cross

Node `localization-duality-cross` (comparison). Declaration `TauCeti.LPV7.localizationDualityCross`.

If X is essentially smooth over k of pure dimension d, combine Wang’s short exact sequence with localization H^i(X)→H^i(Xη)→H^{i+1}_{Xs}(X), proper base change H^i(X)≅H^i(Xs), and support duality H^{i+1}_{Xs}(X)≅H^{2d−i−1}(Xs)^∨(−d). The resulting exact cross has middle H^i(Xη), lower H^i(Xs), upper this support group and right H^i(Xη̄)^I. This rational cross is Galois/Frobenius equivariant after arithmetic descent; no torsion-free integral duality is silently assumed.

Hypotheses. X essentially smooth and proper over the trait, dimension handled componentwise; rational ℓ-adic coefficients.

Construction/proof. Use EDC.0 localization, EDC.1 Verdier duality and the smooth dualizing formula. Use proper base change and the étale comparison with X′ to identify the support group. Combine with wang and isp, retaining all maps and arithmetic actions.

Acceptance. The upper twist is −d and its cohomological degree is2d−i−1. Integral torsion is explicitly excluded from this dual-vector-space identification.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/continuous-wang-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/invariant-specialization`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`.

Source: WeilII, Proof3.6.1, equations(6)–(8), printed p.214.

### Weights in the invariant-cycle cross

Node `invariant-and-support-weight-bounds` (lemma). Declaration `TauCeti.LPV7.invariantSupportWeightBounds`.

After the finite-field descent, B=H^i(Xη̄,ℚℓ)^I is mixed of weights≤i, while C=H^{2d−i−1}(Xs,ℚℓ)^∨(−d) is mixed of weights≥i+1. The first bound uses punctual purity of R^if_* on the smooth locus and the local estimate WeilII1.8.8(i); the second uses the proper special-fibre upper weight bound3.3.4, duality and twist. Exactness of W_i on mixed Frobenius modules turns the cross into a lift from H^i(Xs) onto B.

Hypotheses. Finite-field model of spread and rational coefficients; no hard Lefschetz or decomposition input.

Construction/proof. Import DWP.7 proper smooth purity and cohomological upper bounds. Request DWP.5’s precise local inertia-invariant estimate1.8.8(i). Use the exact weight filtration of DWP.8: W_i C=0 and W_i B=B, so the cross forces the right-hand map to factor through the lower image.

Acceptance. The strict separation i versus i+1 is retained; mixedness alone is insufficient.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/localization-duality-cross`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`, `DeligneWeightsAndPurity:DWP.5`.

Source: WeilII, Lemmas3.6.2–3.6.3 and final exact W_i diagram, printed p.214.

### Local invariant-cycle theorem

Node `local-invariant-cycles` (theorem). Declaration `TauCeti.LPV7.localInvariantCycles`.

Let k be algebraically closed with ℓ invertible, S=Spec(k[T]^h_(T)), and f:X→S proper. If X is essentially smooth over k and Xη is smooth, then for every i the specialization H^i(Xs,ℚℓ)→H^i(Xη̄,ℚℓ)^I is surjective. This is Deligne II3.6.1 in its equicharacteristic, algebraizable trait scope, not an assertion for every degeneration over a mixed-characteristic DVR or for integral coefficients.

Hypotheses. All stated properness, total-space essential smoothness, generic-fibre smoothness and trait hypotheses.

Construction/proof. Reduce via spread, then apply cross and wb over the finite-field model. Apply exact W_i to eliminate the upper support obstruction. Transport surjectivity back through the preserved cohomology/inertia-image identifications.

Acceptance. A smooth proper family specializes isomorphically. A split nodal curve agrees with the independent curve calculation. An arbitrary mixed-characteristic trait is not an admissible instance of this statement.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/arithmetic-spreading`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/invariant-and-support-weight-bounds`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/invariant-specialization`.

Source: WeilII, Theorem3.6.1 and proof, printed pp.213–214.

### Complex local invariant-cycle theorem

Node `complex-local-invariant-cycles` (theorem). Declaration `TauCeti.LPV7.complexLocalInvariantCycles`.

Let D⊂ℂ be the unit disk, f:X→D proper, X smooth and f smooth over D*=D\{0}. Use a relative projective closed embedding X↪P^N(ℂ)×D whose projection is f, an unambiguous sufficient form of the factorization in Deligne3.6.4. For t∈D*, H^i(X₀,ℚ)→H^i(X_t,ℚ)^{π₁(D*,t)} is surjective. A mixed-Hodge version of the same localization/Wang cross proves this using exactness of the weight filtration. The geometric mixed-Hodge structures and their compatibility with the cross are a recorded source/proof gap, not supplied merely by the linear-algebraic HodgeStructures roadmap.

Hypotheses. Proper smooth total complex manifold with the specified relative projective closed embedding; smoothness over the punctured disk. Rational singular/Betti cohomology, not ℓ-adic arithmetic coefficients.

Construction/proof. Use the Betti localization and topological Wang comparison for the disk family. Supply the geometric mixed-Hodge structures on invariants and support cohomology with bounds≤i and≥i+1, and all maps as MHS morphisms (G-complex-mhs). Apply the imported HodgeStructures L2 strictness to the cross, giving exact W_i and surjectivity.

Acceptance. The trivial projective family has identity specialization. The source’s factorization and rational coefficients are visible in the theorem.

Direct inputs: `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`, `ComplexComparisonPartII:C5`.

Source: WeilII, §3.6.4, printed p.215, citing Steenbrink’s Oslo vanishing-cohomology work.

### Arithmetic pure model at a geometric generic point

Node `geometric-generic-pure-model` (definition). Declaration `TauCeti.LPV7.GeometricGenericPureModel`.

For a projective k-scheme X, k algebraically closed, and K∈Dᵇ_c(X,ℚ̄ℓ), retain the absolute arithmetic model data used before applying6.2.8 to the incidence pencil: an integral finite-type ℤ[1/ℓ]-scheme A₀, a geometric generic point Spec k→A₀, a proper X₀→A₀, an arithmetic pure complex K₀ of weight w on X₀, and compatible base-change identifications X≅X₀×A₀Spec k and K≅pullback K₀. GeometricGenericPureModel stores this data. It imports arithmetic purity from DWP.8; it does not redefine purity. A sufficiently general incidence-line pullback turns this absolute witness into the local curve/section PotentiallyPureModel.

Hypotheses. X projective over algebraically closed k; ℓ invertible; actual model schemes and constructible pullback functors. The pure-model convention is6.2.7. The local trait model is a distinct witness, not inferred from a pointwise weight label.

Construction/proof. Retain the arithmetic base, generic point, proper family and pure complex of6.2.8(a),(c),(d) before making the smooth-curve base of(b). Expose the geometric base-change square and complex realization, importing proper model spreading from EDC.0. Use generic incidence duality in the pullback lemma to produce the smooth-curve/section local witnesses at singular pencil parameters.

Acceptance. A model based at a proper closed parameter point does not qualify. The absolute witness contains a complex isomorphism and proper base-change square, not just an integer weight.

The API is determined by these uses: WeilII6.2.12 — Supplies the arithmetic data transported to every local pencil trait, before applying6.2.9. DWP.9, WeilII6.2.13 — Specifies the input meaning of a potentially pure projective complex without importing hard Lefschetz.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.LPV7.GeometricGenericPureModel.base` | projection | Expose A₀ and its geometric generic point, together with the arithmetic structure map. |
| `TauCeti.LPV7.GeometricGenericPureModel.family` | projection | Expose the proper X₀→A₀ and pure model complex K₀ with weight w. |
| `TauCeti.LPV7.GeometricGenericPureModel.realization` | data | Expose the proper-family base-change square, geometric-fibre isomorphism and constructible-complex pullback isomorphism. |
| `TauCeti.LPV7.GeometricGenericPureModel.transport` | compatibility | Transport a witness along compatible isomorphisms of the projective k-scheme and complex, preserving its arithmetic model and weight. |

The discriminating unit tests are:

- `TauCeti.LPV7.generic_model_constant_test` (compatibility): An actual constant smooth projective model with pure constant coefficients retains its geometric-fibre and complex realization isomorphisms.
- `TauCeti.LPV7.generic_model_shift_twist_test` (computation): For K₀[a](b), the same geometric model has weight w+a−2b and the shifted/twisted realization.
- `TauCeti.LPV7.generic_model_closed_point_test` (non-example): The generic-point condition rules out a model point contained in a proper closed subset of the integral arithmetic base.

Direct inputs: `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.IsProper`, `EtaleDualityAndPerverseSheaves:EDC.0`, `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:IsGenericPoint`, `mathlib:HasDerivedCategory.standard`, `mathlib:CategoryTheory.shiftFunctor`, `mathlib:CategoryTheory.IsPullback`.

Source: WeilII, 6.2.8(a),(c),(d), and proof6.2.12 constructing potentially pure i*q*K, printed pp.248,250.

### Arithmetic model of a potentially pure complex

Node `potentially-pure-model` (definition). Declaration `TauCeti.LPV7.PotentiallyPureModel`.

For k algebraically closed, S=Spec(k[T]^h_(T)), f:X→S proper and K∈Dᵇ_c(X,ℚ̄ℓ), a PotentiallyPureModel is the witness of Deligne6.2.8: an integral finite-type ℤ[1/ℓ]-scheme A₀ with Spec k a geometric generic point; a smooth relative curve S₀→A₀ with section; a proper f₀:X₀→S₀; a complex K₀ pure in the arithmetic6.2.7 sense; and compatible isomorphisms identifying S with the henselization at that section after base change to k, and (X,K) with the corresponding pullback of (X₀,K₀). Potential purity means existence of this data, not a Prop field or a free label. Record its integer weight and purity witness under the supplied DWP definition.

Hypotheses. ℓ invertible in k; genuine constructible complexes and model pullback functors. Use the arithmetic dualizing normalization of6.2.7; no arbitrary ℤ-model purity convention.

Construction/proof. Import DWP.8’s actual arithmetic purity definition and EDC.0 constructible coefficients. Package the schemes, section, proper map, complex and pullback identifications of6.2.8. Derive the predicate as existence of this witness and expose projections/transport without requiring a unique witness.

Acceptance. A model includes its geometric generic point, not a closed finite-field point. The complex has its model and purity data, rather than an arbitrary symbol.

The API is determined by these uses: WeilII6.2.9 — Allows arithmetic descent of the entire specialization/duality cross. WeilII6.2.12 and DWP.9’s6.2.13 — Retains the source data needed to pull purity to the general incidence-pencil family.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.LPV7.PotentiallyPureModel.base` | projection | Project the arithmetic base A₀ and the geometric generic-point map. |
| `TauCeti.LPV7.PotentiallyPureModel.family` | projection | Project the smooth relative curve with section, the proper X₀→S₀ and the pure model complex K₀. |
| `TauCeti.LPV7.PotentiallyPureModel.realization` | data | Expose the henselized base-change and complex pullback isomorphisms with their commuting diagrams. |
| `TauCeti.LPV7.PotentiallyPureModel.shrink` | functoriality | Restrict to a nonempty parameter open containing the geometric generic point; retain the induced model, section and purity. |
| `TauCeti.LPV7.PotentiallyPureModel.transport` | compatibility | Transport a witness along compatible isomorphisms of the trait family and complex; proof-irrelevance applies to properties, not to the model schemes. |

The discriminating unit tests are:

- `TauCeti.LPV7.potential_model_constant_test` (compatibility): A constant proper smooth family descending to an integral finite-type ℤ[1/ℓ]-base, with a pure constant complex, gives the indicated witness and constant family after realization.
- `TauCeti.LPV7.potential_model_shift_twist_test` (computation): Replacing pure K₀ of weight w by K₀[a](b) gives a witness of weight w+a−2b with the same geometric model; shifts and twists are tracked.
- `TauCeti.LPV7.potential_model_closed_point_test` (non-example): A parameter map factoring through a proper closed subset of integral A₀ fails the geometric-generic-point condition, even if the remaining schemes and complex are present.

Direct inputs: `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.IsProper`, `EtaleDualityAndPerverseSheaves:EDC.0`, `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:IsGenericPoint`, `mathlib:HasDerivedCategory.standard`, `mathlib:CategoryTheory.shiftFunctor`, `mathlib:CategoryTheory.IsPullback`.

Source: WeilII, Definition6.2.8(a)–(d), printed p.248.

### Potential purity on a general incidence pencil

Node `potential-purity-incidence-pullback` (lemma). Declaration `TauCeti.LPV7.potentialPurityIncidencePullback`.

For the projective incidence diagram X←q Z←i X̃ over a sufficiently general parameter line D as in6.2.10, transport the absolute GeometricGenericPureModel for K to i*q*K on X̃. Prove the needed duality identity D(i*q*K)=i*q*DK in Deligne’s normalized incidence convention; it comes from q smooth and i noncharacteristic/generic-local-acyclic pullback with the relative-dimension shifts cancelling. Retain the shrink of the arithmetic parameter base and the general-line condition. Arbitrary pullback of a pure complex is not asserted pure.

Hypotheses. The projective incidence family, smooth base-change maps and sufficiently general line supplied by LPV.3/EDC.0. The projective K has the absolute arithmetic witness gam; the conclusion supplies the local PotentiallyPureModel on each pencil trait.

Construction/proof. Spread the incidence diagram and line/section along the witness. Apply generic local acyclicity and the correctly shifted Verdier duality exchanges to q and i. Use DWP.8’s upper bounds for pullback, duality and the normalized identity to show arithmetic purity of the pulled-back model.

Acceptance. For a general smooth hyperplane, D(K|Y)=DK|Y(−1)[−2]. The conclusion requires generality; arbitrary closed immersion is not allowed.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/potentially-pure-model`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.0`, `LefschetzPencilsAndVanishingCycles:LPV.3`, `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/geometric-generic-pure-model`.

Source: WeilII, Proof6.2.12, printed p.250; generic duality comparison in proof6.2.11.

### Local invariant cycles for potentially pure complexes

Node `pure-complex-local-invariant-cycles` (theorem). Declaration `TauCeti.LPV7.pureComplexLocalInvariantCycles`.

In the trait setting of6.2.8, f:X→S proper and K∈Dᵇ_c(X,ℚ̄ℓ) with a PotentiallyPureModel imply surjectivity H^i(Xs,K)→H^i(Xη̄,K)^I for every integer i. No total-space smoothness or generic-fibre smoothness is added beyond the existence of the arithmetic pure model. With D the Verdier duality, the support group in the cross is H^{i+1}_{Xs}(X,K)≅H^{−i−1}(Xs,DK)^∨. The same exact weight separation follows from proper preservation of purity6.2.6/6.2.7 and upper bounds6.2.3.

Hypotheses. Proper f, algebraically closed k, equicharacteristic henselization S, ℓ invertible and the precise model witness. Bounded constructible rational ℓ-adic coefficients; degrees may be negative.

Construction/proof. Use ppm to spread all maps, wang with hypercohomology, and EDC.1 support duality. Use DWP.8 proper purity and compact-support upper bounds to replace the two estimates in wb. Apply exact W at the appropriate shifted weight, then descend the surjectivity through the model realization.

Acceptance. The constant-sheaf smooth-total-space case recovers lic after choosing its arithmetic model. The theorem applies to a pure complex with several cohomological degrees, not just a lisse sheaf.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/potentially-pure-model`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/continuous-wang-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/invariant-specialization`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`, `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`, `DeligneWeightsAndPurity:DWP.8/compact-support-direct-image-upper-weights-6-2-3`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`.

Source: WeilII, Theorem6.2.9 and its duality cross, printed pp.248–249.

### Affine vanishing from the dual support bound

Node `dual-support-affine-vanishing` (lemma). Declaration `TauCeti.LPV7.dualSupportAffineVanishing`.

For X projective over algebraically closed k, K∈Dᵇ_c(X,ℚℓ), n∈ℤ and dim Supp ℋ^j(DK[−2n−2])≤n+1−j for every j (dim∅=−∞), any hyperplane complement A=X\Y is affine and H_c^i(A,K)=0 for i≤n. Equivalently the bound on unshifted DK is dim Supp ℋ^q(DK)≤−n−1−q. Apply affine Artin vanishing to the cohomology sheaves and their hypercohomology sequence, then duality; this is a support condition, without requiring X smooth or K pure.

Hypotheses. Projective closed embedding X⊂P^N; ℓ invertible; n integer; actual dual-support dimensions.

Construction/proof. Translate the shift correctly: ℋ^j(DK[−2n−2])=ℋ^{j−2n−2}(DK). Use EDC.4’s affine support-dimension bound to get H^a(A,ℋ^q DK)=0 for a+q≥−n. Apply hypercohomology and EDC.1 duality H_c^i(A,K)^∨≅H^{−i}(A,DK).

Acceptance. For smooth dim X=n+1 and K=ℚℓ, DK[−2n−2]=ℚℓ(n+1); the j=0 bound is n+1, as required. Replacing n+1−j by n−1−j wrongly excludes this standard case.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.0`, `mathlib:CategoryTheory.Limits.IsZero`.

Source: WeilII, Proposition6.2.11 and proof, printed pp.249–250; compare4.1.6.

### Support-bound weak Lefschetz

Node `support-bound-weak-lefschetz` (theorem). Declaration `TauCeti.LPV7.supportBoundWeakLefschetz`.

Under the bound of av, for every hyperplane section Y the restriction H^i(X,K)→H^i(Y,K|Y) is an isomorphism for i<n and is injective for i=n. This includes singular hyperplanes, since the proof uses the affine complement rather than purity of that hyperplane. For a sufficiently general Y, generic local acyclicity gives D_Y(K|Y)=DK|Y(−1)[−2] and transfers the same bound with n replaced by n−1.

Hypotheses. Exactly the projective and dual-support hypotheses of6.2.11; no smoothness or potential-purity premise.

Construction/proof. Apply the localization exact sequence and the vanishing from av. Use generic-local-acyclicity duality for the sufficiently general section, retaining its shifts. Check the support dimensions after intersection with the general hyperplane.

Acceptance. The boundary degree n is injective, not asserted surjective. The constant sheaf on a smooth(n+1)-fold recovers ordinary weak Lefschetz.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/dual-support-affine-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`.

Source: WeilII, Proposition6.2.11(i) and first two paragraphs of its proof, printed pp.249–250.

### Local detection of the pencil extension obstruction

Node `pencil-relative-obstruction` (lemma). Declaration `TauCeti.LPV7.pencilRelativeObstruction`.

For the general incidence pencil and a chosen fibre Y_u, identify the obstruction to extending a class from Y_u to X with a relative-cohomology class on P¹ using the cone of the pushforward-to-axis comparison. Under wl’s inherited affine bounds, its negative cohomology sheaves have finite support. Apply Deligne4.3.6: for L∈D⁺_c(P¹) with finite support of ℋ^j(L) for j<0, lisse outside finite B, and a chosen t∈P¹, the maps H¹(P¹ mod t,L)→∏_{b∈B}H¹(P¹_(b) mod η_b,L) are injective. Thus the obstruction vanishes if all its local obstructions vanish.

Hypotheses. Constructible complexes and the actual general-pencil/axis morphisms; boundedness needed for the relative Leray comparison. The finite-support condition is proved using affine bounds; no arbitrary Leray degeneration is assumed.

Construction/proof. Use EDC.0 localization cones and relative hypercohomology, and LPV.4’s axis/pencil maps. Follow4.3.6’s truncation to H⁰ and H¹ of a sheaf without point-supported sections. Use the P¹ torsor extension argument and local inertia generation, then apply the injective detection map to the extension obstruction.

Acceptance. An invariant class extending over each singular neighbourhood has zero global obstruction. The argument uses4.3.6–4.3.8, without importing the hard-Lefschetz-dependent orthogonal splitting4.3.9.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/support-bound-weak-lefschetz`, `EtaleDualityAndPerverseSheaves:EDC.0`, `LefschetzPencilsAndVanishingCycles:LPV.4`, `LefschetzPencilsAndVanishingCycles:LPV.5`.

Source: WeilII, Proposition4.3.6 and §§4.3.7–4.3.8, printed pp.224–226; proof6.2.11.

### Ambient and pencil-section images

Node `pencil-image-equality` (theorem). Declaration `TauCeti.LPV7.pencilImageEquality`.

For K satisfying6.2.11’s dual-support bound and a sufficiently general pencil D, for every u∈D the image of H^n(X,K) in H^n(Y_u,K) equals the image of H⁰(D,R^n f̃_*(i*q*K)) in that fibre. Prove the equality through the relative obstruction calculation; it does not assert degeneration of all Leray spectral sequences, a direct-sum fixed/vanishing decomposition or hard Lefschetz.

Hypotheses. Projective X⊂P^N, n integer, dual-support bounds; sufficiently general incidence pencil with axis and duality compatibilities.

Construction/proof. Restriction from X gives a global section of the pencil direct image. Use wl on general fibres/axis to place the reverse extension obstruction in ob’s finite-support range. A global section extends locally by definition, so local obstructions vanish; ob gives an ambient lift.

Acceptance. Equality is of actual images, including singular fibres u; only wl’s middle-degree injection is used.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/pencil-relative-obstruction`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/support-bound-weak-lefschetz`, `LefschetzPencilsAndVanishingCycles:LPV.3`, `LefschetzPencilsAndVanishingCycles:LPV.4`.

Source: WeilII, Proposition6.2.11(ii) and proof;4.3.7–4.3.8.

### Monodromy image on a general pencil

Node `general-pencil-monodromy` (comparison). Declaration `TauCeti.LPV7.generalPencilMonodromy`.

For the full hyperplane incidence family Z→P̌ and K, choose a dense open U where all relevant R^j f_*q*K are lisse. For a sufficiently general line D and u∈V=D∩U, the images of π₁(V,u) and π₁(U,u) acting on H^j(Y_u,K) agree, hence so do their invariant subspaces. Request the general constructible-complex Bertini/fundamental-group statement from LPV.3/LPV.5; their ordinary constant-coefficient transvection theorem alone does not supply this assertion.

Hypotheses. k algebraically closed, projective incidence family; sufficiently general line relative to the fixed lisse systems, not every line.

Construction/proof. Use constructibility and generic lissity from EDC.0 to choose U. Apply the supplier’s general-line monodromy-image theorem to the finite set of cohomological degrees. Transport the same basepoint/path identifications to compare the actual images and invariant submodules.

Acceptance. The comparison is image equality, not a claim of isomorphism of fundamental groups.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.3`, `LefschetzPencilsAndVanishingCycles:LPV.5`, `EtaleDualityAndPerverseSheaves:EDC.0`, `mathlib:Representation.invariants`.

Source: WeilII, §6.2.10, formulas6.2.10.1–6.2.10.2, printed p.249.

### Global invariant cycles for potentially pure complexes

Node `global-invariant-cycles` (theorem). Declaration `TauCeti.LPV7.globalInvariantCycles`.

Let X⊂P^N be projective over algebraically closed k, K∈Dᵇ_c(X,ℚ̄ℓ) with the absolute GeometricGenericPureModel, so that the general pencil pullback has the6.2.8 local witnesses; n∈ℤ, and dim Supp ℋ^j(DK[−2n−2])≤n+1−j for all j. For a general hyperplane Y_u with u∈U as in6.2.10, restriction identifies H^n(X,K) with H^n(Y_u,K)^{π₁(U,u)}. The injection comes from wl; surjectivity comes from applying6.2.9 at every point of D\V to the pulled-back pure model, using im and gm. This is the exact6.2.12 input to DWP.9, not a consequence of DWP.9.

Hypotheses. All the projectivity, source dual-support, general-hyperplane and arithmetic-model hypotheses. ℓ invertible and rational coefficients; no hidden hard-Lefschetz or decomposition premise.

Construction/proof. Use pull to transport potential purity to a sufficiently general pencil. Use pl at the finitely many omitted points to identify the image of global pencil sections with π₁(V)-invariants. Use im and gm for surjectivity, and wl for injectivity.

Acceptance. The exported isomorphism is the corestricted ambient restriction, not an arbitrary vector-space isomorphism. No E⊕E⊥ decomposition is used; DWP.9 is a consumer.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/potential-purity-incidence-pullback`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/pure-complex-local-invariant-cycles`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/support-bound-weak-lefschetz`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/pencil-image-equality`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/general-pencil-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/invariant-specialization`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/geometric-generic-pure-model`.

Source: WeilII, Corollary6.2.12 and proof, printed p.250.

## LPV.7 export index

### Invariant-cycle and semistable export index

Node `export-index` (application).

The parent LPV.7 stage is only the index of two independent child exports. DWP.9 consumes local/pure/global invariant cycles from LPV.7:invariant-cycles; DWP.10 and WeightsInEtaleCohomology:R34.3 consume the curve/strict-SNC maps from LPV.7:semistable-curves. No proof, object or late purity prerequisite is added at this aggregate. Hyodo–Kato N is owned by CrystallineCohomology:CR.6, and comparison with étale N by CohomologyComparisons.

Hypotheses. Accepted RS-17 narrowing; existing stage identifiers retained.

Construction/proof. Point consumers to the child’s precise named theorem and its hypotheses. Keep semistable cohomology and graph calculations independent of the invariant-cycle weight proof. Expose source restrictions and explicit open supplier contracts in the reader/handoff.

Acceptance. No consumer of the early curve interface is forced through DWP.7–DWP.9. No second proof of either child or unsourced identification of operators named N.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`.

Source: Illusie21, §§4.4,6.3–6.4 (separate curve calculation and weight-monodromy question); scope fixed by reviewed RS-17.

## Acceptance and the consumer interfaces

For the curve child, run the normalization tests on a single bridge, one
loop and two parallel edges before realizing the geometric models. The
strict semistable nonzero-monodromy instance is I₂: two rational components,
two nodes, cycle vector (1,−1), negative norm −2. Its generic H¹ is
two-dimensional with matrix N(a,b)=(−2b,0); its fixed line is the graph
part. Even for ℓ=2 this matrix is nonzero over ℚℓ. A bridge has nonzero
local R¹Φ but zero global N. A smooth model has N=0 and only the middle
component-cohomology graded piece. A global irreducible nodal loop is a
normalization test, not a strict normal-crossing model with a smooth global
irreducible component.

For higher-dimensional consumers retain the complete E₁ indexing, signed
restriction/Gysin differential, twists, properness and abutment maps. The
Liu–Tian–Xiao–Zhang–Zhu §5.9 input is the geometric stratum/monodromy
calculation. Its arithmetic localizations, cohomological concentration and
degeneration deductions belong to that consumer. Without properness the
sequence abuts to special-fibre nearby hypercohomology. Properness gives
generic-fibre cohomology. The resulting filtration is M′; the weight indexing
is WₛHᵐ=M′ₛ₋ₘ. Equality with the canonical monodromy filtration on Hᵐ
requires its own theorem. For curves the page positions force E₂=E∞ and
the explicit graph pairing identifies the filtrations. Illusie21 §6.4 records
broader E₂-degeneration results; this plan does not describe them as unknown,
nor import them as a proof of general weight–monodromy.

DWP.9 receives the exact potentially pure support-bound global invariant-cycle
theorem, before its own hard-Lefschetz argument. DWP.10 and
WeightsInEtaleCohomology R34.3 receive the independent curve and qualified
filtered-nearby exports. An arbitrary mixed-characteristic degeneration
does not instantiate Deligne3.6.1 or6.2.9. The curve theorem applies over
its own henselian nodal-model hypotheses, which is a separate result.

## Supplier contracts and closure work

Every request below terminates a prerequisite chain at its owner. It is a
packet request, not a new implementation ticket. Existing LPV.0/2,
R11.4 and DWP.7/8 node identifiers are imported unchanged. The suggested
file uses the pinned existing carriers and explicitly identifies the
geometric premises it cannot yet state. Its elaboration tests names and
types; it certifies no geometric theorem.

**Request 1 — `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.** Import the finite normalization, two-branch node schemes, local uv=a charts with thicknesses, geometric component set and oriented dual multigraph retaining loops/multiple edges; identify ker ∂=H₁ and coker d=H¹ with their dual integral lattices and signed orientation/Galois transports. This packet adds only the étale realization of those supplied geometric objects.

**Request 2 — `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.** For a ramified nodal chart uv=π^e, supply the regular semistable resolution, its exceptional rational chain, and the graph subdivision comparison replacing one thick edge by e unit-thickness edges. Include proper pullback on cohomology and invariance of the normalization component H¹ under the rational subdivision.

**Request 3 — `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.** Supply the actual proper regular split genus-one I₂ model of the EllipticCurves Layer4 Tate example with v(q)=2: special fibre two smooth rational components meeting transversely at two nodes, smooth connected generic fibre, and its Picard/Jacobian identification. Also supply a smooth proper curve model and a two-component bridge instance. An abstract graph or reduction-symbol datatype is insufficient.

**Request 4 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.** Supply the split Tate elliptic curve with parameter q=π² over a complete discretely valued field (choose residue characteristic≠2 if using a Weierstrass construction), its regular I₂ fibre through StableReduction Layer5, and the Galois-equivariant Tate-module realization. Retain the distinction between the point-level Tate uniformization and the geometric component model.

**Request 5 — `AbelianSchemesAndArithmeticModuli:A3`.** Supply the smooth proper curve Picard/Jacobian realization H¹(Cη̄,ℤℓ)(1)≅TℓJac(Cη̄), including its trace-dual pairing, compatibility with component Picard varieties, specialization and descent; use R11.4 for the semistable identity component and character lattice.

**Request 6 — `EtaleDualityAndPerverseSheaves:EDC.0`.** Supply bounded constructible ℓ-adic complexes, integer-indexed hypercohomology and Tate twist, conservative geometric stalks, finite normalization pushforward, proper/smooth base change and rational coefficient passage from compatible torsion towers. Supply finite-presentation/limit descent of families and complexes, generic local acyclicity for hyperplanes and incidence lines, localization cones and relative hypercohomology, and the exact bridge from finite filtered nearby complexes to Mathlib spectral objects with convergence and induced filtration maps. Ordinary DerivedCategory and SpectralSequence alone do not supply this geometric interface.

**Request 7 — `EtaleDualityAndPerverseSheaves:EDC.1`.** Supply the localization nine-diagram comparison with explicit boundary signs and the cup-product/coboundary rule used in Illusie91 Lemma1.5.4; compare the two node connecting maps as negatives, rather than only giving an unsigned exact sequence.

**Request 8 — `EtaleDualityAndPerverseSheaves:EDC.1:biduality`.** Supply support duality for constructible complexes, biduality and pullback exchange including all shifts and Tate twists. In the trait cross identify H^{i+1}_{Xs}(X,K)=H^{−i−1}(Xs,DK)^∨ with the correct total/arithmetic dualizing normalization. For a generic-local-acyclic codimension-one section use D_Y i*K=i*DK(−1)[−2]; for the incidence smooth/generic-line composite justify the cancelling normalized identity D(i*q*K)=i*q*DK. Compatibility of every map in the cross and pencil cone is required.

**Request 9 — `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.** Supply the perfect trace pairing for smooth proper component curves, H²(C,Λ)=Λ(−1), sum of component trace maps to connected generic H², and the compatibility of residue/cospecialization maps with cup products. Preserve the integral branch duality and distinguish H₁ from H¹.

**Request 10 — `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`.** Supply the smooth-total-space support duality/trace normalization for the WeilII3.6 cross, plus the relative fundamental-class isomorphism Λ≅Rf!Λ(−d)[−2d] for the strict semistable trait morphism in Saito03 Proposition1.1.1(2). Smooth-morphism purity alone does not cover that singular trait morphism; record the trait extension explicitly.

**Request 11 — `EtaleDualityAndPerverseSheaves:EDC.3`.** Supply intersection-stratum regular-immersion fundamental classes and residue/Gysin maps over the trait in Saito03 Lemma1.1.4, and restriction/Gysin/projection/self-intersection compatibility over the residue field. For the ordered strata, prove the mixed alternating compositions cancel using the principal vertical divisor. This is the exact input to Saito03 Proposition2.2.6; smooth pairs over a field alone do not justify the regular ambient DVR purity step.

**Request 12 — `EtaleDualityAndPerverseSheaves:EDC.4`.** Supply affine Artin vanishing H^a(A,F)=0 for a>dimSupp F for constructible sheaves and its hypercohomology support-bound consequence. With dimSupp ℋ^q(DK)≤−n−1−q, deduce H^{−i}(A,DK)=0 for i≤n and hence H_c^i(A,K)=0 by duality. No hard Lefschetz input is allowed.

**Request 13 — `EtaleDualityAndPerverseSheaves:EDC.5`.** Supply the early middle perverse category over the special-fibre field, its exactness operations and normalized L[d] statement over rational ℓ-adic coefficients. Justify the strict-semistable instance RΨℚℓ[d] perverse by the source’s kernel/image calculation or the independently proved nearby t-exactness interface. Integral p/p+ conventions require their own extension and are not imported from rational self-duality.

**Request 14 — `ArithmeticGaloisDuality:R02.1`.** Supply actual continuous inertia representations on finite-dimensional rational ℓ-adic hypercohomology and compatible inverse-limit cohomology for torsion towers. For I′=ker(I→ℤℓ(1)), prove exactness of invariants and coinvariants on compatible torsion systems by averaging over its finite prime-to-ℓ quotients; I′ includes wild inertia and all other tame prime factors. Identify V^{I′}≅V_{I′} and their induced ℤℓ(1)-actions. Relate continuous fixed subspaces to Mathlib Representation.invariants. Preserve tℓ, Galois descent and invariants under arithmetic spreading.

**Request 15 — `ArithmeticGaloisDuality:R02.2`.** Supply continuous Hochschild–Serre for the generic fibre and the cohomological-dimension-one tame quotient, including the twisted coinvariant term and the Wang short exact sequence for bounded constructible rational complexes. Use ℓ-adic continuous cohomology, not cohomology of the abstract underlying discrete group.

**Request 16 — `DeligneWeightsAndPurity:DWP.5`.** Supply WeilII1.8.8’s local invariant weight bound: at a finite-field boundary point, inertia invariants of a punctually pure local system of weight i have weights≤i; retain the local Frobenius/tame conventions. This plus proper upper bounds and smooth support duality proves the weight cross, without DWP.9.

**Request 17 — `LefschetzPencilsAndVanishingCycles:LPV.1`.** Supply the tame twisted nilpotent logarithm N:V→V(−1), finite monodromy filtration with its center, kernel/image convolution in an abelian category, generator/ramified-character compatibility, and comparison of log T with T−1 on graded pieces. The curve instance requires T=1+tℓN and N²=0; the general filtered nearby instance uses the shifted-perverse rational category and does not infer filtration equality on cohomology.

**Request 18 — `LefschetzPencilsAndVanishingCycles:LPV.0`.** Extend the imported finite-torsion nearby/vanishing-cycle triangles, variation maps and functoriality to compatible ℓ-power towers and their rational ℓ-adic realization. Prove compatibility of proper base change, local stalk calculations, specialization and support localization with this coefficient passage; EDC.0 supplies the constructible category and inverse-limit realization, and R02.1 supplies continuous cohomology. The finite-torsion declarations alone do not justify the rational statements in this packet.

**Request 19 — `LefschetzPencilsAndVanishingCycles:LPV.3`.** Supply the projective incidence scheme, smooth projection q to X, generic-local-acyclic parameter open U for every relevant cohomology sheaf of an actual constructible complex K, and sufficiently general lines with marked sections and incidence duality exchanges. Ordinary constant-sheaf Lefschetz pencils do not cover arbitrary K in WeilII6.2.10–12.

**Request 20 — `LefschetzPencilsAndVanishingCycles:LPV.4`.** Supply the sufficiently general pencil total space and axis maps for constructible complexes, their pushforward-to-axis cone and restriction comparison. Under the dual-support bound prove the finite-support conditions on negative cohomology of the relative obstruction complex used in WeilII4.3.6–8 and6.2.11(ii). This contract excludes the hard-Lefschetz orthogonal splitting4.3.9.

**Request 21 — `LefschetzPencilsAndVanishingCycles:LPV.5`.** Supply tame-cover specialization preserving the full local inertia image in WeilII1.11.3, general-line surjectivity π₁(V)→π₁(U) in the incidence setup of6.2.10, and local-inertia generation/torsor extension on P¹ for4.3.6. Equality of representation images, not just a dimension calculation, is needed. Imported ordinary transvection formulas alone do not suffice.

**Request 22 — `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`.** Import mixed-Hodge structures and strictness/exactness of the weight filtration from L2. The geometric Betti/support/limit MHS of the projective disk family, their maps and separated weight bounds are an extension beyond that linear-algebraic contract, recorded as G-complex-mhs and proposed HodgeStructures PartII below; do not infer them from strictness alone.

**Request 23 — `ComplexComparisonPartII:C5`.** Supply the actual rational Betti realization and de Rham–Betti comparison for the projective algebraic/analytic family, with localization and topological Wang maps over the disk. This comparison does not by itself construct the geometric mixed-Hodge structures needed for WeilII3.6.4.

**G-complex-mhs — Geometric mixed-Hodge cross.** Deligne3.6.4 gives the complex result and cites Steenbrink, but the complete construction/compatibility proof of geometric MHS on inertia invariants and support cohomology has not been extracted here. HodgeStructures L2 supplies only the abstract mixed-Hodge category and strictness. The first page of Steenbrink’s Oslo article was inspected; its isolated-singularity abstract does not establish the required general projective-disk contract. Complete the source proof in HodgeStructures PartII, including weight bounds≤i and≥i+1 and the Betti localization/Wang morphisms; retain projective factorization.

**G-trait-purity — Trait-scope purity interface.** Saito03 Proposition1.1.1(2) and Lemma1.1.4 require relative purity for a strictly semistable morphism over a DVR and stratum fundamental classes in a regular trait ambient scheme. The read EDC.2/3 field/smooth interfaces do not certify this scope. The requests state the exact extension; certify its source and coefficient hypotheses before implementation, without replacing the singular morphism by a smooth one.

**G-filtered-realization — Filtered étale realization and convergence.** Mathlib at the pin has spectral sequences and spectral objects. Its general machinery has not been connected to the constructible étale nearby category: construct the bounded filtered hypercohomology spectral object, page-one comparison, convergence maps and abutment filtration. The suggested file checks the existing carriers and linear/page shapes, with geometric premises explicitly omitted; it is not a formal geometric spectral sequence.

**G-complex-pencil — Constructible-complex pencil contracts.** LPV.3–5 must supply the generic-local-acyclic incidence-line and relative-cone interfaces for arbitrary constructible K, with the finite-support proof and normalized duality exchanges. The source statements and proof route are read and planned here; the existing ordinary quadratic/transvection nodes do not certify this extension. Requests require the exact6.2.10–12 generality, arithmetic model transport and4.3.6–8 route, without DWP.9.

**G-geometric-tests — Realization of geometric acceptance instances.** The graph and unipotent linear calculations discriminate the sign and rank, but no actual proper I₂ model is implemented or certified at the pinned baseline. Complete the EllipticCurves/StableReduction supplier contract for the regular split two-component two-node genus-one model and compare its Jacobian Tate action; also realize the smooth and bridge tests. This packet does not count a matrix as an algebraic family.

**G-suggested-premises — Geometric premises absent from suggested signatures.** The pinned libraries do not expose the full constructible étale category, geometric nearby/purity realization, generic incidence contracts or arithmetic potential-purity predicate. The suggested signatures use existing Scheme, DerivedCategory, ModuleCat, Representation, linear maps and spectral-sequence carriers, and mark exactly which geometric premises or realizations are omitted. Complete these supplier interfaces and strengthen the signatures before treating them as the mathematical theorems. All nodes remain implementationStatus unchecked.

The extension proposed for the geometric MHS cross is **HodgeStructures, Part II: geometric degeneration mixed-Hodge structures**, beginning after the existing L2 category and strictness results and importing ComplexComparisonPartII C5. The RS-17 stage structure is retained.

## Coverage and planets

| Stage | Coverage | Planets |
|---|---|---|
| `LefschetzPencilsAndVanishingCycles:LPV.7` | planned |  |
| `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves` | planned | Normalization complex, Curve specialization sequence, Curve inertia invariants, Curve monodromy filtration, Normal-crossing nearby cycles, Weight spectral sequence |
| `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles` | planned | Local invariant cycles, Complex invariant cycles, Potentially pure complexes, Pure-complex invariant cycles, Support-bound weak Lefschetz, Global invariant cycles |

`LefschetzPencilsAndVanishingCycles:LPV.7`: Certify the two child supplier interfaces and recorded gaps; the parent is only an export index.

`LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`: Certify trait purity and filtered étale realization (G-trait-purity, G-filtered-realization). Realize the geometric smooth/bridge/I₂ acceptance instances (G-geometric-tests). Supply omitted geometric premises before strengthening Lean signatures (G-suggested-premises).

`LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`: Certify constructible-complex incidence/pencil contracts (G-complex-pencil). Extract the geometric mixed-Hodge proof for the complex specialization target (G-complex-mhs). Supply omitted geometric premises and arithmetic-model conditions before strengthening Lean signatures (G-suggested-premises).

## Read sources and version policy

**WeilII.** Pierre Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf). Publications Mathématiques de l’IHÉS 52 (1980), 137–252; published scan. Read 6 October 2026: 1.11.1–1.11.3 (spreading and tame inertia images); 3.6.1–3.6.4, printed pp.213–215, statements and proofs; 4.1.6, 4.3.2–4.3.8 (affine vanishing and relative obstruction); 6.2.7–6.2.12, printed pp.248–250; page images checked for shifts and support bound.

**Illusie91.** Luc Illusie, [Réalisation ℓ-adique de l’accouplement de monodromie, d’après A. Grothendieck](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf). Astérisque 196–197 (1991), 27–44; article in the published collection. Read 6 October 2026: Entire article, §§0–2.9, printed pp.27–44; local trace signs, specialization, graph lattices, Tate realization, pairing.

**Illusie21.** Luc Illusie, [Grothendieck and vanishing cycles](https://www.numdam.org/item/AFST_2021_6_30_1_83_0.pdf). Annales de la Faculté des Sciences de Toulouse 30 (2021), 83–115; published version. Read 6 October 2026: §2.2 (tame normal-crossing stalks); §4.4, formulas4.24–4.39 (graph realization and negative sign); §§6.3–6.4, formulas6.1–6.6 (graded nearby complex and abutment filtration).

**Saito03.** Takeshi Saito, [Weight spectral sequences and independence of ℓ](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/wmr2r.pdf). Author manuscript dated 9 June 2003; published in J. Inst. Math. Jussieu 2 (2003), 583–634; manuscript numbering retained. Read 6 October 2026: §1.1, Propositions1.1.1–1.1.2, Corollary1.1.3 and proof (local purity/residues); §2.1, kernel/image convolution (import from LPV.1); §2.2, Lemma2.2.1 through Proposition2.2.6 and proofs (graded pieces, spectral sequence, d1 and signs); §2.2 final comparison with Rapoport–Zink sign conventions.

**LTXZZ22.** Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones mathematicae 228 (2022), 107–375; published article served by NSF PAR. Read 6 October 2026: §5.9, Construction5.9.1, monodromy-filtration discussion and Lemma5.9.3 proof, printed pp.231–240; uses published Saito Corollary2.8(2) for d1 without properness.

Saito locators use the 9 June 2003 author manuscript. In particular its
Corollary2.2.4 is the published Corollary2.8 cited in the §5.9 consumer.
The published and author numbering are not interchanged silently. Illusie91
is the article on printed pages27–44 inside the openly served Astérisque
collection. Deligne’s support-bound formula was checked against the image of
printed page249 as well as text extraction. No mathematical error in these
read passages was established, so the packet has no source-issue finding.
The remaining MHS proof extraction is a gap in this plan, not an erratum
attributed to Deligne or Steenbrink.
