# MC.2 — Realizations and cycle-class compatibility

This part plans the Betti, algebraic de Rham and geometric ℓ-adic realizations of rational Chow motives, the two classical comparison maps on motives, and the precise cycle quotients through which these realizations factor. A comparison here is a specified natural isomorphism with its coefficient and Tate-line maps. Equal dimensions alone would not meet the target.

This is a complete **planning pass** for MC.2, with three explicit supplier gaps; it is not a closed dependency chain or a formalization. All implementation statuses are unchecked. The [packet](../packets/MotivesAndAlgebraicCycles--MC.2.json) contains eleven new target-level nodes, 39 API items and twenty tests. The twenty-five inherited MC.2 nodes remain in [the whole-roadmap packet](../packets/MotivesAndAlgebraicCycles.json); they are referenced, not replaced. In particular, the existing Weil axioms, pushforward, diagonal, correspondence construction, Lefschetz trace, homological equivalence and round-trip results are retained. MC.0 owns adequate equivalences and MC.1 owns Chow motives and their universal property. Nothing here constructs mixed motives or proves a standard conjecture.

## 1. Existing carriers, imports and boundaries

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The accepted AUDIT-35 MC.2 audit and REV-AUDIT-35 were read, together with `data/library-coverage.json`. At these pins no exported Weil-cohomology system, geometric cycle-class realization or motivic comparison was found. Group-cohomology Kummer constructions do not supply the geometric cycle interface.

Several useful pieces already exist and must be used directly:

- `CategoryTheory.Idempotents.karoubiUniversal` in `Mathlib/CategoryTheory/Idempotents/FunctorExtension.lean`, line 224, extends functors into an **idempotent-complete** target. `CategoryTheory.Idempotents.natTrans_eq`, line 37, forces a natural-transformation component on a retract from its ambient component. MC.2 does not rebuild this category theory.
- `LinearEquiv.ofSubmodules` in `Mathlib/Algebra/Module/Submodule/Equiv.lean`, line 57, restricts an equivalence when the submodule images agree. Together with `LinearMap.range_comp` and `LinearEquiv.range_comp`, it supplies the linear algebra for projector images below.
- `AlgebraicGeometry.Scheme.ellAdicSheaf` and `Scheme.EllAdicCohomology` in `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean` are real native carriers. The former is the pro-étale sheaf of continuous ℤℓ-valued functions; the latter is cohomology of its universe lift and has an additive-group instance. These declarations do **not** supply a ℚℓ-vector space, the classical finite-tower comparison, cycle classes or normalized traces.

The current read-only TauCetiRoadmap tree at `0d144d044dacebca17b654695b6f1ad58f159b27` and its Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also screened, including all nine roadmaps newer than the atlas snapshot. AlgebraicTopology stage 6 already plans singular cup products, Künneth and manifold duality. DifferentialGeometry layers 6 and 8 already plan smooth de Rham cohomology and integration. AlgebraicVectorBundles' further-direction §3 expressly leaves the geometric Betti/de Rham/cycle comparison to the realization direction. These are boundaries, not invitations to duplicate those theories. The canonical prerequisite for the topology import is `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; the newer DifferentialGeometry material is recorded in the screen rather than assigned an invented atlas id.

C5 of ComplexComparisonPartII owns algebraic/analytic cohomology comparison and analytic cycle integration. SF.5 owns Chow groups, intersection theory, Chern classes, K₀ and rational Riemann–Roch. SF.2 owns sites, coefficients, limits, geometric base change and their actual cohomology carriers. EDC.3 owns geometric étale cycle classes; EDC.2:pairings owns finite/adic/rational Poincaré duality. The SF.6 packet is a process-only interface report with no mathematical nodes. Its proposal for an additional comparison layer C7 has not created a supplier theorem. Section 12 records exactly what is still missing.

## 2. Conventions shared by every target

Let `Chow(k)ℚ` be MC.1's contravariant rational Chow-motive category. For pure-dimensional smooth projective schemes,

\[
\operatorname{Corr}^r(X,Y)=\operatorname{CH}^{\dim X+r}(X\times Y)_{\mathbb Q},\qquad
\operatorname{Hom}((X,p,m),(Y,q,n))=q\operatorname{Corr}^{n-m}(X,Y)p.
\]

We compose as ordinary maps: first `p`, then the correspondence, then `q`. For `f:Y→X`, the graph in `X×Y` gives `h(f):h(X)→h(Y)`. For components of different dimensions, apply the displayed formula separately and take the finite direct sum. The empty scheme gives zero, and geometrically disconnected schemes retain every geometric component.

The target is finite-dimensional ℤ-graded vector spaces (finite support and finite-dimensional graded pieces) with the Koszul symmetry: interchanging degrees `i,j` multiplies by `(-1)^{ij}`. For ℓ-adic realization retain a continuous Galois representation in every degree. Write `T_H` for a one-dimensional Tate line, and `H^q(X)(m)=H^q(X)⊗T_H^m`, using dual powers when `m<0`. Our convention is

\[
R_H^j(X,p,m)=\operatorname{im}\bigl(A_H(p):H^{j+2m}(X)(m)\to H^{j+2m}(X)(m)\bigr).
\]

Thus `1(1)` realizes in degree **−2**, and `h(ℙ¹)=1⊕1(−1)`. A codimension-`r` cycle is a motive morphism `1(−r)→h(X)`, whose realization is its class in `H^{2r}(X)(r)`. Forgetting the twist loses the comparison normalization.

The sources for these conventions are Scholl, *Classical motives*, §§1.4 and 1.6, author-preprint p.3; §§1.8–1.9, p.4; Proposition 1.12, pp.5–6; §1.13, p.6. The inherited construction is Stacks, *Weil Cohomology Theories*, Lemma 4.8 (0FGH), pp.10–11, and Lemma 7.10 (0FH2), pp.20–21, in chapter version ed88ff78. Its algebraically closed base hypothesis is respected: the concrete constructions over general `k` below verify pull–cup–push directly and use MC.1's universal property over `k`.

## 3. A common rational cycle map from first Chern classes

**Target `chern-character-cycle-map`.** Suppose a contravariant graded characteristic-zero cohomology ring `H` on smooth projective schemes has a Tate line and a natural first Chern class in `H²(X)(1)`. Require finite-disjoint-union compatibility, the projective bundle isomorphism

\[
\bigoplus_{j=0}^{r-1}H^{q-2j}(X)(-j)\ \longrightarrow\ H^q(\mathbb P(E)),
\quad (a_j)\longmapsto\sum_j\pi^*a_j\,c_1(\mathcal O(1))^j,
\]

and the Cartier-divisor support condition: for a smooth effective Cartier divisor `i:D↪X`, an element in the kernel of `i*` is annihilated by `c₁(O(D))`. Products, pullbacks and Tate identifications in this formula are the same ones used in all subsequent targets.

Import SF.5's ring isomorphism

\[
\mathrm{ch}_{CH}:K_0(\operatorname{Vect}(X))\otimes\mathbb Q\ \simeq\ \operatorname{CH}^*(X)_{\mathbb Q}.
\]

Construct the cohomological Chern character by the splitting/projective-bundle argument and define `cl_H=ch_H∘ch_CH⁻¹`. The Adams-operation eigenspaces, with eigenvalues `2^r`, identify its codimension-`r` summand with `H^{2r}(X)(r)`. This gives a rational, unital, multiplicative, pullback-compatible cycle map. A multiplicative comparison preserving first Chern classes preserves the entire Chern character, hence every rational cycle class. Proper pushforward compatibility is verified for the admitted theories below; it is not an extra consequence silently attached to this ring construction.

For an integral codimension-`r` closed subscheme `Z`, `r≥1`, a finite locally free resolution defines `[O_Z]` and yields

\[
\mathrm{cl}_H[Z]=\frac{(-1)^{r-1}}{(r-1)!}\,c_r^H([\mathcal O_Z]).
\]

The sign is essential. On `ℙ²`, for the intersection `z` of two hyperplanes with class `h`, the Koszul resolution gives `[O_z]=[O]−2[O(−1)]+[O(−2)]` and

\[
c([\mathcal O_z])=\frac{1-2h}{(1-h)^2}=1-h^2\pmod {h^3}.
\]

Consequently `c₂([O_z])=−h²`, while the point cycle class is `h²`. The character construction is primary and avoids depending on a misprinted structure-sheaf formula.

Source: Stacks, §12, Propositions 12.1 (0FI5) and 12.4 (0FI9), pp.41–45; §14, Lemmas 14.1–14.2 (0FIE, 0FIF), pp.48–49. The corrected structure-sheaf formula is Grothendieck, *La théorie des classes de Chern*, §4.3, formulas (15)–(16), printed pp.150–151. SF.5 supplies its Chow-theoretic input; this node owns only the cohomological construction.

**Planned API.**

| Name | Contract |
| --- | --- |
| `RealizationCycleClass.ofFirstChern` | The map cl_H=ch_H∘ch_CH^{-1} under the four stated hypotheses. |
| `RealizationCycleClass.ch_spec` | cl_H(ch_CH(v))=ch_H(v) for v∈K0(Vect(X))⊗Q; this determines cl_H. |
| `RealizationCycleClass.firstChern` | cl_H(c1_CH(L))=c1_H(L). |
| `RealizationCycleClass.pullback` | cl_H(f^!α)=f^*cl_H(α) for a morphism of smooth projective schemes. |
| `RealizationCycleClass.mul` | cl_H(αβ)=cl_H(α)∪cl_H(β), with cl_H(1)=1. |
| `RealizationCycleClass.compare` | A comparison preserving multiplication and first Chern classes transports every cl_H(α) to cl_K(α), with twists included. |
| `RealizationCycleClass.structureSheaf` | For a codimension-r integral closed subscheme Z, r≥1, cl_H[Z]=(−1)^{r−1}c_r^H([O_Z])/(r−1)!, where [O_Z] is represented by a finite locally free resolution. The Chern-character definition is primary. |

**Discriminating tests.**

- `RealizationCycleClass.projectiveLine` (computation): For h=c1_CH(O_P¹(1)), cl_H(h)=c1_H(O_P¹(1))∈H²(P¹)(1); it cannot land in degree one.
- `RealizationCycleClass.projectivePlanePoint` (computation): For the intersection z of two hyperplanes in P², cl_H[z]=c1_H(O(1))². Equivalently c2_H([O_z])=−cl_H[z], detecting the missing sign in the structure-sheaf formula.
- `RealizationCycleClass.empty` (degenerate): The Chow and cohomology rings of the empty scheme are both the zero ring, and cl_H is their unique map.
- `RealizationCycleClass.negativeDivisor` (characterisation): cl_H(−c1_CH(L))=−c1_H(L); the construction is additive on cycle classes, not the nonlinear map α↦exp(cl_H(α)).

## 4. Normalized cohomology comparisons

**Target `normalized-cohomology-comparison`.** Let `H,K` be admitted cohomology systems on the same smooth projective schemes, with finite-dimensional Poincaré pairings, Künneth, the cycle maps of §3, and proper pushforwards adjoint to pullback. Their characteristic-zero coefficient fields `F_H,F_K` have **specified embeddings** into a common field `E`. A normalized comparison consists of

\[
\tau:T_H\otimes E\simeq T_K\otimes E,\qquad
c_X^q:H^q(X)\otimes E\simeq K^q(X)\otimes E,
\]

with pullback naturality, unit and cup compatibility, and the equations

\[
c_X^{2,1}(c_{1,H}(L))=c_{1,K}(L),\qquad
\operatorname{Tr}_K\circ c_X^{2d,d}=\operatorname{Tr}_H,
\quad c_X^{q,m}:=c_X^q\otimes\tau^m.
\]

Take inverse-dual powers on negative twists. On disconnected pure-dimensional schemes sum component traces, and treat mixed dimensions componentwise. Exterior products are products of pullbacks, so their compatibility follows. Section 3 derives all-cycle compatibility from the first-Chern equation. The chosen coefficient embeddings are data; this definition does not identify the two original coefficient fields.

Identity, inverse and composition are obtained degreewise and on the Tate line, after extending to an explicitly common coefficient field. Extensionality compares both `τ` and every `c_X^q`. The source is Deligne, *Hodge cycles on abelian varieties*, §1, Theorem 1.4 and the Tate/cycle/trace discussion, revised pp.8–11, original printed pp.17–22. The packaging into this common comparison interface is the present plan's synthesis, not a named structure attributed to Deligne.

**Planned API.**

| Name | Contract |
| --- | --- |
| `NormalizedCohomologyComparison.mk` | Construct from τ, c_X^q, naturality, unit, cup, first-Chern and trace equations. |
| `NormalizedCohomologyComparison.twisted` | c_X^{q,m}=c_X^q⊗τ^m for every q,m∈Z. |
| `NormalizedCohomologyComparison.ext` | Two comparisons are equal when their τ and all c_X^q are equal. |
| `NormalizedCohomologyComparison.refl` | Identity on each degree and on the Tate line. |
| `NormalizedCohomologyComparison.symm` | Inverse degreewise and on the Tate line. |
| `NormalizedCohomologyComparison.trans` | Compose comparisons after extending to the same explicitly specified coefficient field; twisted components compose. |
| `NormalizedCohomologyComparison.cycleClass` | c_X^{2r,r}(cl_H α)=cl_K α for every α∈CH^r(X)_Q. |
| `NormalizedCohomologyComparison.trace` | Tr_K(c_X^{2d,d} a)=Tr_H(a); the target scalar map is the identity of E. |

**Discriminating tests.**

- `NormalizedCohomologyComparison.unitNotScaled` (non-example): Multiplication by 2 on every H^q(X), with τ the identity and H=K, fails c_Spec(k)^0(1)=1; equal ranks do not make it a comparison.
- `NormalizedCohomologyComparison.tateNotForgotten` (non-example): For dR→Betti on P¹, raw c(c1_dR O(1))=(2πi)u. Setting τ(1)=t_B instead of (2πi)^{-1}t_B fails the first-Chern equation.
- `NormalizedCohomologyComparison.identity` (degenerate): For H=K and identity coefficient embeddings, τ=id and c_X^q=id form the identity comparison, including zero cohomological degrees and empty schemes.
- `NormalizedCohomologyComparison.traceCurve` (characterisation): On a curve, a degree-one divisor class has trace one before and after the twisted comparison; a convention giving 2πi after taking the normalized trace is rejected.

## 5. From a cohomology comparison to a motivic comparison

**Target `comparison-intertwines-correspondences`.** If `f:X→Y` is proper and `dim X=d`, `dim Y=e`, then

\[
c_Y^{q+2(e-d),m+e-d}f_*^H=f_*^Kc_X^{q,m}.
\]

To prove this equality, pair both sides against an arbitrary complementary class on `Y`. Poincaré adjunction moves pushforward to pullback; the pullback, cup and normalized trace equations make the pairings equal. Nondegeneracy over `E` proves equality of maps. This explicitly uses the same trace normalization on both sides.

For `a∈CH^{d+r}(X×Y)ℚ`, define the existing correspondence action by

\[
A_H(a)(x)=\operatorname{pr}_{Y,*}\bigl(\mathrm{cl}_H(a)\smile\operatorname{pr}_X^*x\bigr):
H^q(X)(m)\longrightarrow H^{q+2r}(Y)(m+r).
\]

The degree calculation is `2(d+r)+q−2d=q+2r`; the twist calculation is `(d+r)+m−d=m+r`. All-cycle, pullback, cup and pushforward comparison give

\[
c_Y^{q+2r,m+r}A_H(a)=A_K(a)c_X^{q,m}.
\]

The same argument applies for negative `r`. Chow composition, the diagonal identity, the projection formula and Künneth prove functoriality; no new cycle or intersection carrier is introduced. On a graph this is pullback naturality; on the transpose graph it is the correctly shifted pushforward square. Sources: Stacks Lemma 7.1 (0FGT), pp.15–16, and Lemma 7.10 (0FH2), pp.20–21.

**Target `comparison-on-chow-motives` — planet: Normalized realization comparisons.** For `M=(X,p,m)`, restrict `c_X^{j+2m,m}` to the image of `A_H(p)`. The intertwining equation sends that image onto `im A_K(p)`; the inverse sends it back. Use `LinearEquiv.ofSubmodules` and the existing range lemmas for this step. Then extend the natural isomorphism through the Karoubi envelope and the invertible Tate object. The target graded finite-dimensional vector spaces, and continuous representations when retained, are idempotent complete.

Every motive is a retract of a twisted `h(X)`. `natTrans_eq` therefore forces the retract component, and the required component on `1(1)` forces every Tate power. This proves uniqueness **relative to the specified components on `h(X)` and the Tate line**. Naturality for `qap` is the restricted correspondence square. Künneth gives the tensor square on geometric motives; restriction to `p⊗q` gives it on retracts. Koszul symmetry supplies the symmetric constraint. The resulting symmetric monoidal natural isomorphism preserves evaluation, duality, categorical trace and the cycle morphisms `1(−r)→h(X)`.

Check `p=0` gives the unique zero-space map, `p=id` gives the original comparison, and `1(m)` gives `τ^m` in degree `−2m`. The `ℙ¹` splitting must be respected. Inverse and composition agree before and after extension. Sources and pinned ingredients are those of §§1–2, particularly Stacks 0FGH and Scholl §1.9/Proposition 1.12. No new abstract completion theorem is a target.

The two statements in the suggested Lean file isolate the genuine linear-algebra checks already statable on pinned carriers: intertwining detects a zero action, and an equivalence restricts to the two ranges. They do not pretend that the geometric motives or cohomology systems already exist in Lean.

## 6. Betti realization

**Target `betti-realization`.** For an embedding `σ:k→ℂ`, use

\[
H_B^q(X)=H_{\rm sing}^q(X_\sigma(\mathbb C),\mathbb Q),\quad
T_B=\mathbb Q(1)=(2\pi i)\mathbb Q.
\]

Construct a ℚ-linear symmetric monoidal functor from `Chow(k)ℚ` to finite-dimensional graded ℚ-vector spaces. Use AlgebraicTopology's singular cohomology, cup products, finite-dimensional Künneth and complex-oriented manifold Poincaré duality on the C5 analytification carrier. Set `c₁,B` by the exponential-sequence connecting class with kernel `2πiℤ`. Verify §3's projective-bundle and support hypotheses, then obtain the rational cycle map from the character construction.

For an integral codimension-`r` cycle, C5's cycle-integration/Gysin agreement identifies this class with the complex-oriented fundamental class tensored with `(2πi)^r`. The normalized trace removes the Tate generator, evaluates on the oriented fundamental class and sums over components. Proper/Gysin adjunction and the pushforward of oriented fundamental classes give cycle pushforward. Künneth and the point normalization then give the correspondence functor; MC.1 extends it to all Chow motives with the formula of §2.

Every geometric component is retained. For finite separable `L/k`, the embeddings of `L` into `ℂ` extending `σ` index the basis of `H_B^0(Spec L)`, and the structural pushforward sums those coordinates. It is not legitimate to impose one-dimensional `H⁰` on this object. The embedding `σ` remains an argument of the functor.

Sources: Deligne §1, revised pp.7–11, original pp.16–22; Demailly, *Complex Analytic and Differential Geometry*, V §13, Theorem 13.4 and formula 13.6, pp.271–272, for divisor/current normalization; Stacks 0FGH and 0FH2 for the passage to motives. C5 and AlgebraicTopology must export the same carriers and orientations; §12 records this contract.

**Planned API.**

| Name | Contract |
| --- | --- |
| `BettiRealization.functor` | R_B,σ with rational linearity and Koszul symmetric monoidality. |
| `BettiRealization.obj` | R_B,σ^j(X,p,m)=im p on H_sing^{j+2m}(X_σ(C),Q)⊗Q(m). |
| `BettiRealization.map` | A degree n−m Chow correspondence acts by the restricted pull–cup–push formula. |
| `BettiRealization.cycleClass` | cl_B^r is the rational cycle map to H_B^{2r}(X)(r). |
| `BettiRealization.divisor` | cl_B(D)=c1_B(O_X(D)), where c1_B comes from the exponential sequence. |
| `BettiRealization.trace` | Tr_B:H_B^{2d}(X)(d)→Q is the sum of complex-oriented component traces, with a geometric point of trace one. |
| `BettiRealization.tensor` | Exterior products give the tensor constraint; swapping degrees i,j contributes (−1)^{ij}. |
| `BettiRealization.cycleMorphism` | Applying R_B to the Chow morphism α:1(−r)→h(X) gives cl_B(α). |

**Discriminating tests.**

- `BettiRealization.projectiveLine` (computation): R_B(h(P¹)) has Q in degree 0 and Q(−1) in degree 2, and zero elsewhere; R_B(1(1)) has Q(1) in degree −2.
- `BettiRealization.finiteEtalePoint` (non-example): For a finite separable extension L/k of degree s, R_B^0(h(Spec L))=Q^{Hom_k(L,C)}, of dimension s, and the pushforward to the unit sums its s coordinates.
- `BettiRealization.curveDivisor` (computation): For a divisor D on a smooth geometrically connected projective curve, Tr_B(cl_B D)=deg_k D; after σ-base change a degree-s closed point contributes s geometric points.
- `BettiRealization.oddSwap` (characterisation): On H¹(E)⊗H¹(E) for an elliptic curve E, the graded tensor switch is minus the ordinary switch; forgetting the Koszul sign fails this test.

## 7. Algebraic de Rham realization

**Target `de-rham-realization`.** For any characteristic-zero field `k`, set

\[
H_{dR}^q(X/k)=\mathbb H^q(X,\Omega^\bullet_{X/k}),\qquad T_{dR}=kt_{dR}.
\]

The Tate line is formal with a chosen basis; its identification as an ungraded vector space with `k` does not erase twists. Use C5's algebraic complex, products and scalar base change. With **exactly** Hodge II §2.2.4.1's shift/total-complex convention, define `c₁,dR` to be the **negative** of the map on hypercohomology induced by `dlog:O×[−1]→Ω•`. Hodge II §2.2.5.1 identifies that sign with the exponential-sequence class. If an implementation uses another chain convention, transport through an explicit chain isomorphism; the invariant requirement is that `c₁(O(1))` has normalized trace +1.

Apply §3's cycle construction. Define trace algebraically with a geometric point of degree one. Over `ℂ`, after trivializing `t_dR^d`, it is `(2πi)^{-d}` times integration of the raw comparison class. On `Spec L` for finite separable `L/k`, this trace is the field trace `L→k`, not an isomorphism in general.

The constructor does not require `k→ℂ`. To prove its Weil identities, first descend a given finite scheme/morphism/bundle diagram to a finitely generated characteristic-zero field `k₀`, embed `k₀` into `ℂ`, and use C5 comparison and faithful scalar extension. This proves finite-dimensionality, Künneth, perfect pairings, the projective-bundle and divisor-support identities, and proper cycle pushforward. Every finite diagram over arbitrary `k` descends in this way; the requested C5 arbitrary-field base-change and cocycle theorems then transfer the identities to `k`. The algebraic maps were already defined, so this argument introduces no embedding choice into the resulting functor. Apply MC.1 to the correspondence action and invertible `ℙ¹` top summand.

Sources: Grothendieck, *On the de Rham cohomology of algebraic varieties*, Theorem 1′ and proper-case proof, printed pp.95–96; Deligne, *Théorie de Hodge, II*, §§2.2.4.1–2.2.5.1, printed pp.28–29; Deligne82 Theorem 1.4 and scalar base change, revised p.8, trace p.11 (original pp.17–18,22). The exact general-field and normalization supplier exports remain visible in §12.

**Planned API.**

| Name | Contract |
| --- | --- |
| `DeRhamRealization.functor` | R_dR over k, with rational linearity and Koszul symmetric monoidality. |
| `DeRhamRealization.obj` | R_dR^j(X,p,m)=im p on H_dR^{j+2m}(X/k)⊗k kt_dR^m. |
| `DeRhamRealization.firstChern` | The negative dlog hypercohomology map with the fixed shift convention. |
| `DeRhamRealization.cycleClass` | The graded rational Chow cycle map constructed from c1_dR. |
| `DeRhamRealization.trace` | The algebraic trace H_dR^{2d}(X/k)(d)→k with point normalization and the stated complex integration formula. |
| `DeRhamRealization.map` | Correspondence maps are the restricted pull–cup–push action, with degree and twist n−m. |
| `DeRhamRealization.baseChange` | For a specified extension k→k′ of characteristic-zero fields, R_dR,k(M)⊗k k′≅R_dR,k′(M_k′), natural and monoidal, commuting with cycles, trace and iterated base change. |
| `DeRhamRealization.cycleMorphism` | The image of α:1(−r)→h(X) is cl_dR(α). |

**Discriminating tests.**

- `DeRhamRealization.tateDegree` (computation): R_dR(1(1)) is kt_dR in degree −2; R_dR(h(P¹)) has k in degree 0 and k(−1) in degree 2.
- `DeRhamRealization.projectiveLineTrace` (computation): For h=c1_dR(O_P¹(1)), Tr_dR(h)=1. Over C the integral of the raw comparison of h is 2πi, so raw integration alone is the wrong algebraic trace.
- `DeRhamRealization.finiteEtalePoint` (characterisation): For finite separable L/k, R_dR^0(h(Spec L))=L and its proper pushforward is Tr_{L/k}; for a quadratic extension the class 1 has trace 2.
- `DeRhamRealization.positiveCharacteristic` (non-example): A field of characteristic p is outside this constructor. It cannot be accepted by omitting the characteristic-zero assumption from the scalar-descent proof.

## 8. Geometric ℓ-adic realization

**Target `etale-realization`.** Let `ℓ` be prime and invertible in `k`; fix an algebraic closure `k̄` and `G_k=Aut(k̄/k)`. The target is finite-dimensional graded continuous ℚℓ-representations of `G_k`, with Koszul symmetry. Set

\[
H_\ell^q(X)=H_{\mathrm{et}}^q(X_{\bar k},\mathbb Q_\ell),\qquad
T_\ell=\mathbb Q_\ell(1)=\bigl(\varprojlim_n\mu_{\ell^n}(\bar k)\bigr)\otimes_{\mathbb Z_\ell}\mathbb Q_\ell.
\]

These are **geometric** groups, not arithmetic `H^q(X,ℚℓ)`. SF.2 supplies the coefficient carrier, finite generation, continuous action, Künneth and geometric base change. EDC.3's cycle class is applied on the smooth scheme over the perfect field `k̄`, so its perfect-base condition is satisfied even when `k` is imperfect. Its finite Kummer first Chern class and the rational class agree with §3's character construction. EDC.2:pairings supplies the rational perfect pairings and normalized trace, including the finite-to-adic torsion/Ext bookkeeping.

Identification with the native pinned pro-étale carrier is a theorem still requested from SF.2. One must compare it with the **derived** finite-coefficient tower and retain

\[
0\to\varprojlim{}^1 H^{q-1}(K_n)\to H^q(R\varprojlim K_n)
\to\varprojlim H^q(K_n)\to0
\]

until Mittag–Leffler has been justified. Finite finite-level groups give stabilization of the relevant images in this smooth-proper setting; only then may one use the ordinary limit and invert `ℓ`. The comparison must preserve cup, pullback, Kummer classes and EDC traces, not just identify additive groups.

The geometric action through the separable closure and purely inseparable invariance identifies the algebraic-closure realization for imperfect `k`; do not assert that `k̄/k` is Galois. Base-changed `k`-correspondences act equivariantly. Images of equivariant idempotents remain finite-dimensional continuous representations, so MC.1 extends the correspondence functor without forgetting `G_k`.

Sources: Milne, *Lectures on Étale Cohomology* v2.21, §19, pp.121–125; §22, Theorems 22.1 and 22.4, pp.135–136; §23, Lemma 23.1 and Theorems 23.2–23.3, pp.138–141; §24, Theorem 24.1 and Remark 24.2, pp.144–145. These supply the classical theory; they do not establish the pinned native-carrier conversion by definition.

**Planned API.**

| Name | Contract |
| --- | --- |
| `EtaleRealization.functor` | R_ℓ with continuous G_k action and rational linear Koszul symmetric monoidal structure. |
| `EtaleRealization.obj` | R_ℓ^j(X,p,m)=im p on H_et^{j+2m}(X_k̄,Q_ℓ(m)). |
| `EtaleRealization.firstChern` | The class of a line bundle is the compatible Kummer boundary, then rationalized. |
| `EtaleRealization.cycleClass` | Use the EDC.3 class on X_k̄ after Chow base change; it is G_k-invariant and agrees with the first-Chern construction. |
| `EtaleRealization.trace` | Tr_ℓ:H_et^{2d}(X_k̄,Q_ℓ(d))→Q_ℓ is G_k-equivariant, a geometric point has trace one, and component traces are summed. |
| `EtaleRealization.map` | Correspondence maps are G_k-equivariant pull–cup–push maps restricted to projector images. |
| `EtaleRealization.geometricBaseChange` | An extension of algebraically closed fields carrying the fixed closures induces a natural monoidal realization isomorphism, with cycle/trace compatibility; the named base-change maps obey the tower cocycle. |
| `EtaleRealization.nativeComparison` | The specified SF.2 native/derived-tower identification commutes with coefficients, pullback, cup, Kummer classes and normalized trace; it is a required supplier theorem, not a definition. |

**Discriminating tests.**

- `EtaleRealization.finiteFieldTate` (computation): For k=F_q and ℓ∤q, geometric Frobenius acts by q on H²(P¹_k̄,Q_ℓ)=Q_ℓ(−1), by q^{−1} on Q_ℓ(1), and by 1 on H²(P¹)(1); the normalized trace is equivariant.
- `EtaleRealization.geometricPoint` (degenerate): R_ℓ(h(Spec k)) is the trivial Q_ℓ representation in degree 0 and zero elsewhere; R_ℓ(1(1)) is cyclotomic in degree −2.
- `EtaleRealization.closedPointDegree` (computation): For a closed point x of a smooth projective curve over k, Tr_ℓ(cl_ℓ[x])=[κ(x):k], including inseparable multiplicity in the Chow base-change class.
- `EtaleRealization.excludedPrime` (non-example): The constructor rejects ℓ=char(k); prime-to-characteristic Kummer and the rational duality supplier cannot justify that case.

## 9. The two named motivic comparisons

**Target `de-rham-betti-motivic-comparison`.** For `σ:k→ℂ`, construct

\[
C_{dRB,\sigma}:R_{dR}(-)\otimes_{k,\sigma}\mathbb C
\ \simeq\ R_{B,\sigma}(-)\otimes_{\mathbb Q}\mathbb C.
\]

On untwisted `h(X)`, the map `I_X^q` is the C5 composite of algebraic scalar base change, analytification, holomorphic de Rham comparison and singular comparison. Fix the standard `i`, put `p=2πi` and `t_B=p∈ℚ(1)`. Its Tate-line map is

\[
\tau(t_{dR})=p^{-1}t_B.
\]

Thus the map on `H^q(X)(m)`, **expressed in the chosen Tate bases**, is `p^{-m}I_X^q`. On `(X,e,m)` restrict it to the image of `e` in degree `j+2m`. The coefficient embeddings into `ℂ` are `σ:k→ℂ` and the canonical `ℚ→ℂ`; the original `k`-space and `ℚ`-space are not declared isomorphic.

The `ℙ¹` calculation fixes the convention: with `u` the positively oriented rational class, `I(c₁,dR(O(1)))=p u` in untwisted coordinates. Tensoring with `τ` sends `c₁,dR` to `u⊗t_B`, which is `c₁,B`. Raw top-degree integration gives `p^d` times algebraic trace; the twist factor cancels it. C5's unit/cup/pullback and this first-Chern/trace square make a normalized comparison. Sections 3–5 then give all-cycle, proper-pushforward, correspondence, projector and duality compatibility on motives. In particular, the component on `1(1)` is `p^{-1}` in Tate coordinates in degree −2. Its inverse has the inverse period.

Use C5 nodes `repair-proper-de-rham-betti` and `multiplicative-period-interface`, with the strengthened contract in §12. Sources: Grothendieck Theorem 1′, pp.95–96; Hodge II §§2.2.4–2.2.5, pp.28–29; Deligne82 §1, revised pp.8–11, original pp.17–22. No comparison is supplied solely by matching Betti numbers.

**Target `etale-betti-motivic-comparison`.** With `σ:k→ℂ`, choose an extension `σ̄:k̄→ℂ`. The comparison is

\[
C_{B\ell,\bar\sigma}:R_{B,\sigma}(-)\otimes_{\mathbb Q}\mathbb Q_\ell
\ \simeq\ \operatorname{Forget}_{G_k}R_\ell(-).
\]

At finite level use the site comparison

\[
a_n:H_{\mathrm{et}}^q(X_{\mathbb C},\mu_{\ell^n}^{\otimes m})
\ \longrightarrow\ H_{\mathrm{sing}}^q(X_\sigma(\mathbb C),\mathbb Z/\ell^n(m)),
\]

where the singular twist is identified by the exponential coefficient map `t_B mod ℓ^nℤ(1) ↦ exp(2πi/ℓ^n)`; the displayed étale→singular map uses its inverse. SGA 4 XVI, §4, Theorem 4.1, marginal pp.232–234 (public retypesetting PDF pp.13–14), supplies the all-degree torsion comparison for the proper structural map. Milne §21, Theorem 21.1 and Remark 21.2, p.130, supplies its classical variety form. A comparison of finite covers alone would not supply these all-degree maps.

Require compatibility of `a_n` with coefficient reduction, pullback, unit/cup, Kummer boundaries and point-normalized trace. Use finite-level finiteness and the derived-limit conversion of §8, plus finite generation of integral singular cohomology and its coefficient comparison, before rationalizing. If `b` is geometric base change from `X_k̄` to `X_ℂ`, the requested **Betti→étale** direction is `b⁻¹∘a⁻¹` on the resulting rational groups. Its Tate map takes `t_B` to the compatible roots

\[
(\exp(2\pi i/\ell^n))_n\in\mathbb Q_\ell(1),
\]

using `σ̄` to identify the roots in the fixed closure. Kummer/exponential compatibility proves the first-Chern equation; point normalization and Poincaré adjunction supply the trace and pushforward equations. Extend by §5 to a symmetric monoidal natural isomorphism on motives.

The displayed target explicitly forgets `G_k`. One can transport an action to the Betti ℚℓ space using this chosen comparison, but that action depends on the closure embedding and is not independent datum of rational Betti cohomology. There is no claimed canonical map `ℂ→ℚℓ`. The roots, coefficient direction, inverse site map and geometric base-change map are all part of the normalization. The all-degree supplier still needs an accepted owner-level node; SF.6's proposed C7 is not used as an existing prerequisite.

## 10. Exact quotient descent

**Target `realization-quotients`.** For an admitted `H`, let `I_H` be the ideal of correspondences whose cycle class is zero. Künneth and perfect pairings identify the cohomology class of a correspondence with its family of action maps. Therefore

\[
\mathrm{cl}_H(a)=0\quad\Longleftrightarrow\quad A_H(a)=0
\text{ in every degree}.
\]

To justify the reverse implication, use Künneth to express the class in complementary tensor factors and contract against arbitrary source classes; Poincaré nondegeneracy detects every coefficient. For maps `qap` between projector images, a zero restricted map is a zero ambient `qap` action because it already factors through `p` and `q`. Hence the realization factors faithfully through the homological correspondence quotient and its idempotent completion. This asserts faithfulness, not fullness.

For an arbitrary adequate correspondence ideal `J`, descent is equivalent to `J⊆I_H`. Take the quotient **before** Karoubi completion; an idempotent in a quotient need not lift to an idempotent before quotienting. The target is already idempotent complete, so its realization extends. A normalized comparison over faithful field extensions identifies both cycle kernels; thus Betti and de Rham, and each admitted ℓ-adic realization, have the same homological relation for the specified characteristic-zero complex embedding.

Homologically trivial cycles are numerically trivial by compatibility of intersection and degree. In ideal notation this is `I_H⊆I_num`, giving a functor from homological to numerical motives. Factoring the realization through **numerical** motives would require the reverse inclusion `I_num⊆I_H`, the standard-conjecture-D condition. It is not obtained from a comparison theorem. Sources: Stacks §7, Lemmas 7.4–7.11, pp.17–21, especially the Künneth/correspondence embedding; Scholl §1.4, p.3; Milne, *Motives — Grothendieck's Dream*, §6, pp.7–8. This makes explicit the quotient already intended by the inherited homological-equivalence and faithful-correspondence nodes.

Check that a nonzero-degree curve divisor survives; a degree-zero divisor maps to zero even when its Chow class need not vanish. A realization of the full Chow category therefore need not be faithful. These checks would reject a silent switch to rational equivalence or an unconditional numerical descent claim.

## 11. The curve divisor and trace acceptance calculation

**Target `curve-divisor-acceptance`.** Let `C/k` be smooth, projective and geometrically connected, and let `D` be a rational divisor. In each admitted theory,

\[
\mathrm{cl}_H(D)=c_{1,H,\mathbb Q}(D),\qquad
\operatorname{Tr}_H(\mathrm{cl}_H D)=\deg_kD,\qquad
\mathrm{cl}_H D=0\ \Longleftrightarrow\ \deg_kD=0.
\]

Here `c₁,H,ℚ` is the ℚ-linear extension of `D↦c₁,H(O_C(D))` for integral divisors; a line bundle `O_C(D)` is not assigned to a general rational divisor. The last equivalence uses that `H²(C)(1)` is one-dimensional and trace is an isomorphism. It would fail in that form without geometric connectedness. For a closed point, count all geometric points and the inseparable multiplicities of its Chow base change. For a rational linear combination, extend degree and class ℚ-linearly. This checks the exact homological quotient, rather than merely the rank of top cohomology.

For a finite map `f:C→C′` between such curves, proper cycle pushforward gives

\[
f_*\mathrm{cl}_H(D)=\mathrm{cl}_H(f_*D),\qquad
f_*f^*=(\deg f)\,\mathrm{id},\qquad
\operatorname{Tr}_{C'}f_*\mathrm{cl}_H(D)=\deg_kD.
\]

The push–pull identity is the graph/transpose-graph Chow identity, including inseparable degree. If `C=C′=ℙ¹` and `deg f=n`, pulling back a point gives degree `n`, so the induced push–pull cannot be the identity when `n>1`. On `ℙ¹`, a rational point has trace +1 and the difference of two rational points has class zero. Degree-zero nontrivial Picard classes on an elliptic curve provide a stronger check that Chow and homological equivalence have not been identified.

When the relevant comparison hypotheses hold, the cycle and trace squares of §9 commute. In the de Rham–Betti case the raw period is

\[
\int_{C_\sigma(\mathbb C)}I_C^2(\mathrm{cl}_{dR}D)
=2\pi i\,\deg_kD
\]

in the trivialized de Rham Tate coordinate; the twisted comparison and normalized trace remove `2πi`. In the Betti–étale case the exponential roots identify the Tate factors and preserve the degree directly. In positive characteristic only the admitted prime-to-characteristic ℓ-adic calculation is asserted; no complex comparison is inferred there.

Sources: Milne LEC §23, pp.138–141 and §24, Theorem 24.1/Remark 24.2(b)–(f), pp.144–145; Deligne82 revised p.11, original p.22. This is the explicit acceptance check demanded by MC.2, including maps, signs, twists and the quotient.

## 12. Supplier frontier, assembly and verification

The packet's requests are exact obligations, not exports credited to a process document:

| Owner | Required shared interface | Status in this pass |
| --- | --- | --- |
| SF.5 | Rational Chow ring, refined smooth pullbacks, products, degree and pushforward; `ch_CH:K₀⊗ℚ≃CH*ℚ`, Chern/Adams and field-base-change compatibility | Import existing ownership; no second cycle theory |
| AlgebraicTopology stage 6, coordinated with C5 | The same singular carrier for cup/Künneth, orientation, projective bundles, manifold duality and Gysin adjunction | Shared-carrier export request |
| C5 | Arbitrary characteristic-zero algebraic de Rham base change and cocycle; negative-dlog Chern normalization; exact `I_X`, Tate and normalized trace square, plus divisor-support and analytic cycle/Gysin agreement | **Gap 1:** existing proper comparison and multiplicative-period nodes do not state every strengthened export |
| C5, pending the maintainer's C7 ownership decision | All-degree finite Artin comparison with named coefficient/site maps and reduction/cup/Kummer/trace equations | **Gap 2:** SF.6 reports the absence and proposes C7; no nonexistent supplier node is imported |
| SF.2, coordinated with EDC | Native pro-étale carrier versus derived finite tower, ℚℓ linearity, lim¹ vanishing under finiteness, operation compatibility, continuous action and purely inseparable invariance; singular coefficient conversion for comparison | **Gap 3:** not supplied by the existing additive native carrier |

These gaps prevent marking the stage closed, but not completing the planning pass: every MC.2 target now has a statement, construction route, exact use and named supplier frontier. They must be resolved by the owners before implementation or package assembly claims dependency closure. EDC's rational pairings/cycle nodes remain mathematical imports; they do not discharge the native carrier identification. The accepted RS-08 narrowing concerns MC.4 and does not remove either MC.2 comparison target.

Assembly must retain the twenty-five inherited MC.2 nodes without duplicating their ids. Their five existing planet names are Classical Weil cohomology theory, Cohomological pushforward, Class of the diagonal, Euler characteristic of a variety, and Realisations are monoidal functors. Add only **Normalized realization comparisons**, keeping the total at six. The definitive statements and all geometric tests remain in this reader. The compact suggested file imports Mathlib and states two important range/kernel fragments using existing carriers; it introduces no opaque stand-in and no admitted data definition. There are no retained light definitions requiring executable examples, and no admitted examples.

### Source checks and corrections

All prose above states the mathematics in our own words. The packet records exact editions, public URLs, section/page locators and SHA-256 hashes. Scholl locators use author-preprint pagination; SGA uses original marginal pages; Deligne82 locators distinguish the original published scan from the revised 2018 copy. The author's DMOS addendum was also checked, including its separate first-Chern sign caution. No restricted library source was needed.

Three incidental source findings are recorded as `MotivesAndAlgebraicCycles/E48`–`E50`, continuing the inherited issue numbering:

- **E48:** revised Deligne82 p.10 calls the first Chern map an isomorphism. Original printed p.20 correctly calls it a homomorphism. Nontrivial degree-zero line bundles on a complex elliptic curve disprove injectivity; the revised transcription does not alter the intended theory.
- **E49:** both copies' codimension-`r` structure-sheaf formula omit `(-1)^{r-1}`. Section 3's `ℙ²` calculation checks the correction against Grothendieck 1958 §4.3, (15)–(16), pp.150–151. No correction was located in the author's listed addendum. The plan uses the Chern character, so this typo affects none of its targets.
- **E50:** Stacks Lemma 14.16 (0FIT), p.55, assumes A1–A8 but its proof invokes A9 for the exceptional divisor's class; Proposition 14.17 (0FIU), p.56, uses that lemma. Adding A9 suffices for the displayed argument, or an independent derivation is needed. This is a proof-dependency gap, not a claim that the weaker statement is false. The live tags and their comments were checked on 19 October 2026. This plan uses 0FIF for its ring cycle map and independently supplied Gysin/trace for pushforward, so it does not depend on that problematic proof.

The checks of these findings belong to the present source reading; no separate source or red-team job was claimed. The handoff records mechanical validation and the Lean elaboration result. Independent review must still check the normalization squares, supplier contracts and the source findings before acceptance.
