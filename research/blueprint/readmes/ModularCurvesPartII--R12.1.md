# Modular curves, following Katz–Mazur, Part II: Uniformization, integral boundary and Hecke cohomology

This continues the existing ModularCurves roadmap and the ten preserved targets of the earlier checkpoint. It plans exactly R12.1–R12.6 and R13.1–R13.2. The accepted RS-06 scope is binding: individual elliptic uniformization and comparison live here; generic analytic geometry, ordinary arithmetic level moduli and analytic modular-form theory retain their existing owners.

All eight stages are **planned**. The pass is complete at target granularity; every implementation status remains **unchecked**. The shared analytic-space carrier has an explicit integration gap and an exact SF.2 request. Other imported stage interfaces are listed below with the statements needed. This is a mathematical development plan, not a report that these constructions exist at the pins.

## Conventions and ownership

For an oriented lattice Λ=Z+Zτ, τ∈H, use P=1/N and Q=τ/N and the Silverman convention e_N(P,Q)=exp(2πi/N). The native lattice cubic has equation y²=x³−g₂x/4−g₃/4, and its uniformization is z↦(℘(z),℘′(z)/2). Its invariant differential dx/(2y) pulls back to dz. At the modular/Tate comparison the frame is 2πi dz=du/u, where u=exp(2πiz). Conrad’s course pairing has the opposite sign; it is inverted when comparing to the imported scheme pairing.

Use the existing algebraic row action (P,Q)γ=(aP+cQ,bP+dQ), for γ=[[a,b],[c,d]]. Its analytic right action is τ·γ=(dτ+b)/(cτ+a), with fibre multiplier (a+cτ)⁻¹. A matrix of determinant r sends ζ to ζ^r. In usual left-action coordinates the base action is (aτ+b)/(cτ+d), but its torsion label matrix is [[d,b],[c,a]]. Consequently an upper triangular SL₂ label acts on the retained Γ₁ generator by a=d⁻¹. These conventions are checked together; they are not interchangeable formulas for the same action.

Strict full ordered level, a fixed Weil-pairing fibre, projective scalar framing, a rigidified stack and a coarse curve are distinct objects. Full N≥3 and open Γ₁ N≥4 are fine over C. Γ₀ retains inversion. The compact fine ranges and the bad-characteristic inertia are stated in R13.2. Native integer cusp width is the strict translation width; coarse cusp parameters use the effective PSL₂ width, which can be half the strict width at an irregular cusp.

| Target | Supplier or owner | Boundary of this part |
| --- | --- | --- |
| ℘, its derivative, g₂/g₃ and their ODE | Pinned Mathlib `PeriodPair` API | Construct the projective cubic comparison and nonsingularity, without replanning the lattice functions. |
| Algebraic elliptic curves, group laws, quotients, scheme Weil pairing | Existing ModularCurves 1A/1C/1D/2B/2E | Compare those carriers with the analytic torus. |
| Ordinary level moduli and their row quotients | Existing ModularCurves 3C/3D/5A/5B/5C/7B/8B/8D/9B/9D/9E | Extend only across polygon degeneration and discharge the named comparison contracts. |
| Analytic modular curves and modular-form section spaces | Existing ModularForms 10A/10B/10C and Layer 2 | Compare with actual algebraic models and fix the pullback–trace normalization. |
| Analytic spaces including nilpotents and scheme analytification | SchemeAndStackFoundations:SF.2 integration request | Generic carrier is requested explicitly; R12.1 owns elliptic uniformization. |
| Proper coherent comparison, proper morphism algebraicity, affine connectedness | ComplexComparisonPartII C0/C2/C4/C5 | Use exact accepted node ids and hypotheses. |
| Generic marked nodal curves and formal existence | AlgebraicModuliForArithmeticGeometry R09.1–R09.6; AdicSpacesPartII:F0 | Own generalized elliptic structure, polygon quotient/contraction and the polygon-count tower. |
| Relative abelian periods and general finite flat groups | AbelianSchemesAndArithmeticModuli:A5; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1 | Use the lower-tier period and group interfaces, specializing them here. |
| Full algebraic Tate charts | ModularCurvesPartII:R13.3 | Compare convergent parameters; do not construct Tate curves in this part. |
| Actual compact coarse curves and integral Φ_N | ModularCurvesPartII:R13.4a | Construction precedes R12.3; R12.6 exports to R13.4b. |
| Integral correspondences, bad regular models, Jacobians and CM consumers | R13.5/R14/R15 and the routed owners | Supply characteristic-zero comparisons; do not consume a higher-tier development to prove them. |

The mathematical direction is **R13.4a → R12.3 → R12.6 → R13.4b**. R13.1/R13.2 feed the Tate and coarse suppliers. R12.4 uses the open R12.2 comparison and C4, independently of compactification. The cusp-parameter comparison uses the open comparison and supplied Tate charts; it precedes the compact comparison. Integral Hecke correspondences are consumers of the characteristic-zero normalization, so R14.1 is not a prerequisite of R12.5.

This roadmap is tier 11 in the Caraiani–Newton order, with no new bundle. The other-roadmap suppliers below are lower tier. Current TauCetiRoadmap main and current Tau Ceti were inspected separately from the pinned atlas snapshot: the nine newer roadmaps supply no replacement for these missing comparison or polygon targets. Current Tau Ceti already has the Silverman scheme Weil pairing and Tate equation/q-expansions; both are imported.

## Baseline declarations

The full signatures were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. In particular the ℘ ODE excludes lattice points, the cyclotomic degree theorem assumes a nontrivial coefficient ring, and the connected-to-irreducible theorem requires a locally Noetherian scheme with domain stalks.

- **`mathlib:PeriodPair`**, Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean: A pair of real-linearly independent complex periods; its lattice and integer basis already exist.
- **`mathlib:PeriodPair.weierstrassP`**, Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean: The lattice Weierstrass function, including totalized values at lattice points; only its restriction off the lattice is used for affine coordinates.
- **`mathlib:PeriodPair.derivWeierstrassP`**, Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean: The native derivative function, periodic and odd.
- **`mathlib:PeriodPair.g₂`**, Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean: The invariant 60 G₄ of a native period pair.
- **`mathlib:PeriodPair.g₃`**, Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean: The invariant 140 G₆ of a native period pair.
- **`mathlib:PeriodPair.derivWeierstrassP_sq`**, Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean: For z outside the lattice, ℘′(z)² = 4℘(z)³ − g₂℘(z) − g₃.
- **`mathlib:WeierstrassCurve`**, Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean: The five-coefficient Weierstrass equation over a commutative ring and its discriminant.
- **`mathlib:WeierstrassCurve.IsElliptic`**, Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean: The class asserting that the Weierstrass discriminant is a unit; over C this is precisely nonsingularity.
- **`mathlib:Polynomial.natDegree_cyclotomic`**, Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean: For a nontrivial ring R, Φ_n has natural degree φ(n).
- **`tauceti:TauCeti.Subgroup.integerCuspWidth`**, TauCeti/NumberTheory/ModularForms/Cusps/Basic.lean: The least positive strict translation exponent, or zero if absent; positivity requires finite relative index. It is not automatically the effective PSL₂ cusp width.
- **`tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`**, TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean: A locally Noetherian connected scheme with all stalks domains is irreducible.
- **`tauceti:HeckeRing.GL2.qExpansion_coeff_one_heckeRingHomCharSpace_heckeTCompositeGamma0`**, TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Composite.lean: For nonzero n, a₁(T_n F)=a_n(F) on the native character space, with N nonzero; bad-prime blocks are included in the native operator.

## R12.1. Uniformisation of elliptic curves

Start with the native period-pair and projective Weierstrass carriers. The missing assertions are nonsingularity, the pointed analytic group isomorphism and its converse, then the differential/period/isogeny and pairing comparisons. Integration uses the imported bilinear period relation and coherent comparison; no unplanned general complex Lie exponential is assumed.

### The normalized lattice Weierstrass model

**Target** `ModularCurvesPartII:R12.1/lattice-weierstrass-model` · construction. **Planet:** Lattice Weierstrass model.

For a native PeriodPair L, define W_L with a₁=a₂=a₃=0, a₄=−L.g₂/4 and a₆=−L.g₃/4. Its discriminant is L.g₂³−27L.g₃² and is nonzero. The projective map z↦[℘_L(z):℘′_L(z)/2:1] off the lattice extends across each lattice point by O=[0:1:0] and descends to a pointed biholomorphism C/L.lattice ≅ W_L^an. It intertwines addition with the algebraic group law.

**Hypotheses and carrier boundaries.**

- The lattice has rank two over Z and spans C over R. Its orientation is not part of PeriodPair; choose an oriented basis only when normalizing to H.
- Projective affine coordinates use the native Weierstrass equation y²=x³−g₂x/4−g₃/4. Totalized native ℘ values at a pole are not projective coordinates.

**Construction or proof.**

1. Use the native differential equation away from the lattice. Laurent expansions ℘=z⁻²+O(z²), ℘′=−2z⁻³+O(z) give the projective extension at O.
2. Count zeros of the elliptic function ℘−x to obtain a two-sheeted x-map and injectivity once ℘′ is included. Its three nonzero half-periods have distinct x-values; hence the cubic discriminant is nonzero.
3. Periodicity descends the map; compactness and the local charts show it is a biholomorphism. The explicit ℘ addition formula identifies the group laws.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.latticeWeierstrass` | constructor | The five-coefficient W_L over C. |
| `TauCeti.ModularCurves.latticeWeierstrass_discriminant` | characterisation | W_L.Δ=L.g₂³−27L.g₃². |
| `TauCeti.ModularCurves.latticeWeierstrass_isElliptic` | instance | W_L is elliptic for every native PeriodPair. |
| `TauCeti.ModularCurves.latticeUniformization` | equivalence | A pointed analytic group isomorphism C/Λ_L→W_L^an. |
| `TauCeti.ModularCurves.latticeUniformization_zero` | simp | The zero class maps to the projective identity. |

**Uses.**

- `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`: Constructs the inverse lattice-to-curve functor.
- `ModularCurvesPartII:R12.2/marked-torus-family`: Supplies its fibrewise Weierstrass coordinates.

**Unit tests.**

- **compatibility**, `TauCeti.ModularCurves.latticeWeierstrass_equation`: For z∉Λ_L, (℘′_L(z)/2)²=℘_L(z)³−g₂℘_L(z)/4−g₃/4.
- **degenerate**, `TauCeti.ModularCurves.latticeUniformization_pole`: The class of any lattice point maps to O, not the affine pair of totalized native function values.
- **computation**, `TauCeti.ModularCurves.latticeWeierstrass_square`: For Λ=Z+iZ, g₃=0 and j(W_L)=1728.
- **non-example**, `TauCeti.ModularCurves.latticeWeierstrass_collapsed_basis`: Periods 1 and 2 do not form a PeriodPair, so no elliptic W_L is produced by this construction.

**Check.**

- Verify the factors 1/2, 1/4 and Δ=g₂³−27g₃² against the native equation.
- The zero lattice class maps to O; no evaluation of a native junk value is used.

**Direct prerequisites:** `mathlib:PeriodPair`, `mathlib:PeriodPair.weierstrassP`, `mathlib:PeriodPair.derivWeierstrassP`, `mathlib:PeriodPair.g₂`, `mathlib:PeriodPair.g₃`, `mathlib:PeriodPair.derivWeierstrassP_sq`, `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.IsElliptic`, `tauceti:TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `SchemeAndStackFoundations:SF.2`, `ComplexComparisonPartII:C0/repair-analytification`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`.

**Sources:** [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, Propositions 3.11–3.13, pp.46–47 — The lattice cubic and the projective uniformization; [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 2.9, p.4, corrected domain as E6 below — The projective map in a varying lattice.

### Pointed elliptic uniformization

**Target** `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization` · theorem. **Planet:** Elliptic uniformization.

For a smooth projective Weierstrass elliptic curve E/C with identity O, the analytification supplied by the shared carrier is a compact connected one-dimensional complex Lie group. There is a rank-two discrete lattice Λ⊂C and a pointed holomorphic group isomorphism C/Λ→E^an. Conversely every such lattice is realized by the preceding Weierstrass model. Isomorphisms of pointed elliptic curves correspond to nonzero homotheties uΛ=Λ′; general holomorphic group homomorphisms correspond to complex-linear maps z↦uz with uΛ⊂Λ′, including u=0. Algebraic and analytic pointed morphisms agree.

**Hypotheses and carrier boundaries.**

- E is smooth, projective, geometrically connected of genus one, with its algebraic group law.
- Use the projective points dictionary, not only the affine solution set.

**Construction or proof.**

1. Analytify the smooth projective curve and its group maps. Proper coherent comparison gives H⁰(E^an,O)=C, hence connectedness, and compact-surface cohomology identifies its analytic genus as one; choose the nonzero algebraic invariant differential ω.
2. Integrate ω around an oriented integral homology basis. The bilinear relation and positivity of iω∧conjugate(ω) make its two periods real-linearly independent. Integration from O defines E^an→C/Λ; it is a local isomorphism since ω never vanishes. Compactness and connectedness make it a covering onto the torus. Its induced homology image is the whole period lattice by definition, hence the covering has degree one. Invariance of ω identifies the group law.
3. Use the explicit lattice Weierstrass map for the inverse construction. Lift pointed group maps to the universal covers; their additive holomorphic lifts are complex-linear. Proper-source morphism comparison algebraizes maps between the proper algebraic curves.

**Named declarations and API.**

- `TauCeti.ModularCurves.pointedEllipticUniformization`: the stated theorem with precisely these hypotheses.

**Check.**

- O maps to the zero class, and the map is a group isomorphism.
- A translation by a nonzero point is excluded from pointed group homomorphisms.
- At j=0 and 1728 retain the extra pointed automorphisms.

**Direct prerequisites:** `ModularCurvesPartII:R12.1/lattice-weierstrass-model`, `tauceti:TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `ComplexComparisonPartII:C0/repair-analytification`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`, `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`, `ComplexComparisonPartII:C2`.

**Sources:** [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, pp.41–47, especially Propositions 3.12–3.13 — Uniformization and homothety classification; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1, pp.17–18 — Pointed elliptic curves as complex tori.

### Homotheties and lattice isogenies

**Target** `ModularCurvesPartII:R12.1/homothety-and-isogeny-compatibility` · theorem. **Planet:** Lattice isogenies.

If u≠0 and Λ′=uΛ, then g₂(Λ′)=u⁻⁴g₂(Λ), g₃(Λ′)=u⁻⁶g₃(Λ), and the corresponding cubic isomorphism is (x,y)↦(u⁻²x,u⁻³y). For uΛ⊂Λ′ the induced pointed map has kernel u⁻¹Λ′/Λ and degree [Λ′:uΛ]. Its pullback sends dz on C/Λ′ to u dz on C/Λ. These comparisons commute with composition, dual isogenies and the imported algebraic quotient.

**Hypotheses and carrier boundaries.**

- u is a nonzero complex number; the inclusion of full lattices has finite index.
- The coordinate change is for the forward map z↦uz, so its differential multiplier is u.

**Construction or proof.**

1. Reindex the absolutely convergent Eisenstein sums and ℘ series under multiplication by u.
2. Pass to the quotients and count the kernel by the lattice index. Algebraize the pointed map using C4 and compare degrees on a finite covering.
3. Composition gives the isogeny and differential compatibilities; identify duals by their composite with multiplication.

**Named declarations and API.**

- `TauCeti.ModularCurves.homothetyAndIsogenyCompatibility`: the stated theorem with precisely these hypotheses.

**Check.**

- For Λ′=Λ and u=n, multiplication by n has degree n².
- For u=2 with Λ′=2Λ the map is an isomorphism and pulls dz back to 2 dz.

**Direct prerequisites:** `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`, `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`.

**Sources:** [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, pp.41–47 — Homothety and the lattice cubic; [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §6, especially Proposition 6.2, pp.11–13 — Lattice maps and analytic homomorphisms.

### Invariant differentials and periods

**Target** `ModularCurvesPartII:R12.1/invariant-differentials-and-periods` · theorem. **Planet:** Elliptic periods.

Under the normalized lattice uniformization, the algebraic invariant differential dx/(2y) pulls back to dz. For any E/C and nonzero invariant differential ω, its period homomorphism H₁(E^an,Z)→C has image a full lattice Λ_ω, and integration from O gives E^an≅C/Λ_ω with ω corresponding to dz. Changing ω to cω changes the period lattice to cΛ_ω. An oriented integral homology basis gives τ=ω₂/ω₁∈H and the usual positive Riemann bilinear area.

**Hypotheses and carrier boundaries.**

- Use the complex orientation on E^an and a positively oriented homology basis.
- The differential line is imported from MC1C. The period map is the concrete integration map, not an arbitrary rank-two subgroup.

**Construction or proof.**

1. Compute dx/(2y)=d℘/℘′=dz off the finite half-period locus and extend the equality of holomorphic forms.
2. Pull an invariant differential back along the preceding pointed lattice uniformization; translation invariance makes it a constant nonzero multiple of dz. A lift of a homology loop ends at the corresponding lattice point, so integration identifies H₁ with the period lattice.
3. Positivity of iω∧ω̄ fixes the orientation; rescaling the differential gives the homothety formula.

**Named declarations and API.**

- `TauCeti.ModularCurves.invariantDifferentialsAndPeriods`: the stated theorem with precisely these hypotheses.

**Check.**

- The invariant form is dz, whereas the modular/Tate frame used in R12.5 is 2πi dz.
- Rescaling ω changes both periods by the same scalar and leaves τ unchanged.

**Direct prerequisites:** `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `ModularCurvesPartII:R12.1/homothety-and-isogeny-compatibility`, `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`, `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §§6–7, pp.11–15 — Invariant differentials and periods on complex elliptic curves; [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, pp.44–47 — The normalized lattice coordinate differential.

### The analytic Weil-pairing comparison

**Target** `ModularCurvesPartII:R12.1/analytic-algebraic-weil-pairing` · theorem. **Planet:** Weil-pairing comparison.

Fix Λ=Zω₁+Zω₂ with Im(ω₂/ω₁)>0 and N≥1. With the Tau Ceti/Silverman pairing convention, e_N((aω₁+bω₂)/N,(cω₁+dω₂)/N)=exp(2πi(ad−bc)/N). This is the imported algebraic Weil pairing evaluated on the corresponding torsion sections, and is compatible with homotheties, isogenies and their duals, and change of level. In particular on Λ_τ=Z+Zτ, the ordered frame (1/N,τ/N) has pairing ζ_N=exp(2πi/N).

**Hypotheses and carrier boundaries.**

- The displayed coefficients are integers interpreted modulo N.
- Conrad’s course convention is the inverse of Silverman’s; its positive-pairing frame is (τ/N,1/N). This plan changes both the convention and the basis order explicitly.
- The algebraic group-scheme pairing and its comparison with the equation-level pairing are MC2E inputs, not reconstructed here.

**Construction or proof.**

1. Identify N-torsion by the quotient (1/N)Λ/Λ.
2. Compute the translation quotient defining the imported equation-level pairing using elliptic functions with the relevant torsion divisor; the period multipliers give the determinant exponential. Invert Conrad’s convention as stated in his Remark 7.17 and §8.
3. Use bilinearity and the ordered-basis value to obtain all coefficients; apply the imported algebraic isogeny and change-of-level laws.

**Named declarations and API.**

- `TauCeti.ModularCurves.analyticAlgebraicWeilPairing`: the stated theorem with precisely these hypotheses.

**Check.**

- For N=3, e(1/3,τ/3)=ζ₃ and reversing the pair gives ζ₃⁻¹.
- The determinant of a changed frame is the pairing exponent.
- For N=1 the pairing is 1 and the single trivial level is retained.

**Direct prerequisites:** `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `ModularCurvesPartII:R12.1/invariant-differentials-and-periods`, `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 7.16, Remark 7.17 and §8, Theorem 8.5, pp.17–19 — The analytic pairing with its explicitly opposite-to-Silverman convention.

## R12.2. Level structures and quotient identification

Build the analytic family with its holomorphic sheaf, then classify level markings. A point bijection is only the first step: local period inverses and analytified étale rigidifiers give an analytic isomorphism. At coarse levels descend finite stabilizer charts. The Bakker–Tsimerman scalar-frame geometry is an application of these precise quotient conventions.

### The marked torus family over the upper half-plane

**Target** `ModularCurvesPartII:R12.2/marked-torus-family` · construction. **Planet:** Marked torus family.

Over H form T=(C×H)/((z,τ)∼(z+m+nτ,τ)), m,n∈Z. This is a proper smooth analytic group family with identity, and its sections P=1/N and Q=τ/N give an ordered N-torsion basis with pairing ζ_N. For γ=[[a,b],[c,d]]∈SL₂(Z), the algebraic row action (P,Q)γ=(aP+cQ,bP+dQ) matches the analytic right action τ·γ=(dτ+b)/(cτ+a) and the fibre isomorphism z↦z/(a+cτ). In usual left-action notation ητ=(ατ+β)/(γτ+δ), its label matrix is [[δ,β],[γ,α]].

**Hypotheses and carrier boundaries.**

- τ∈H and N≥1; the right action is the usual left action of Jγ⁻¹J with J=diag(1,−1).
- The quotient uses a sheaf of holomorphic functions descended along the lattice covering; it is not merely a topological orbit set.
- Base change of the family is analytic; the general relative torus and period machinery is imported from A5.

**Construction or proof.**

1. On compact subsets of H, real independence bounds lattice vectors away from zero; lattice translations act freely and locally discretely, giving holomorphic quotient charts.
2. Use a varying fundamental parallelogram to prove properness and smoothness. Joint ℘ functions away from the relative lattice, and their projective extensions, identify the family with varying Weierstrass models.
3. Check the displayed right action by applying z↦z/(a+cτ) to the two transformed sections; then verify composition of the row actions.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.markedTorusFamily` | constructor | The proper analytic elliptic family T→H with identity. |
| `TauCeti.ModularCurves.markedTorusFamily_level` | data | The frame (1/N,τ/N). |
| `TauCeti.ModularCurves.markedTorusFamily_pullback` | functoriality | A holomorphic map S→H pulls back T and its frame. |
| `TauCeti.ModularCurves.markedTorusFamily_changeMarking` | compatibility | The row action γ has base map τ·γ and fibre multiplier (a+cτ)⁻¹. |
| `TauCeti.ModularCurves.markedTorusFamily_weilPairing` | characterisation | e_N(P,Q)=ζ_N for the chosen orientation. |

**Uses.**

- `ModularCurvesPartII:R12.2/open-level-uniformization`: Provides holomorphic local moduli maps.
- `ModularCurvesPartII:R12.5/hodge-line-automorphy`: Fixes the fibre differential multiplier.

**Unit tests.**

- **computation**, `TauCeti.ModularCurves.markedTorusFamily_T`: For γ=[[1,1],[0,1]], τ·γ=τ+1 and the changed frame is (P,P+Q).
- **computation**, `TauCeti.ModularCurves.markedTorusFamily_S`: For γ=[[0,−1],[1,0]], τ·γ=−1/τ and (P,Q)γ=(Q,−P).
- **degenerate**, `TauCeti.ModularCurves.markedTorusFamily_zeroLevel`: At N=1 both level sections are the identity; the family remains nontrivial.
- **compatibility**, `TauCeti.ModularCurves.markedTorusFamily_borelDiamond`: When c≡0 modulo N, its row action on the retained Γ₁ generator is P↦aP=d⁻¹P, not dP.

**Check.**

- Use the same row action as MC9B.
- The family, section and isomorphism diagrams commute after every holomorphic base change.

**Direct prerequisites:** `ModularCurvesPartII:R12.1/lattice-weierstrass-model`, `ModularCurvesPartII:R12.1/analytic-algebraic-weil-pairing`, `SchemeAndStackFoundations:SF.2`, `AbelianSchemesAndArithmeticModuli:A5`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Example 2.5, Proposition 2.6, Remark 2.8 and Proposition 2.9, pp.3–4 — The relative lattice quotient and its holomorphic charts; [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §§5 and 9, pp.9–11 and 18–21 — Changes of marking and modular actions.

### Open modular uniformization with the specified level

**Target** `ModularCurvesPartII:R12.2/open-level-uniformization` · theorem. **Planet:** Open modular uniformization.

The marked torus family induces an isomorphism from the supplied analytic quotient curve to the analytification of the imported algebraic open modular curve: Γ(N)\H→Y(N,ζ_N)^an for a fixed pairing, Γ₁(N)\H→Y₁(N)^an, and Γ₀(N)\H→Y₀(N)^an. Interpret the first as a fine curve for N≥3 and the second for N≥4; at smaller levels and for Γ₀ use the coarse quotient with its stabilizer charts. Strict full ordered level is the disjoint union of φ(N) pairing components over C, with one such quotient for each primitive pairing value. These isomorphisms identify the corresponding local families on rigidified charts.

**Hypotheses and carrier boundaries.**

- N≥1 and the base is C. Full ordered level, a fixed pairing and a projective frame are three separate moduli problems.
- The algebraic models and representability are MC5A/5B/9D/9E inputs; Γ₀ uses cyclic subgroups and always has generic [−1] inertia.
- The target statement is an isomorphism of complex analytic curves, including their structure sheaves, not only a bijection of complex points.

**Construction or proof.**

1. Classify elliptic curves and their torsion labels by R12.1; changing a marking gives precisely the displayed congruence stabilizer. This supplies the point bijection.
2. For a local analytic family with a marking, A5 gives holomorphic period coordinates. The Weierstrass presentation and analytified étale rigidifier show that the forward map and the local inverse are holomorphic on fine charts.
3. For coarse cases choose an auxiliary prime-to-N full level ≥3, perform the fine comparison there, and descend finite quotient charts using stabilizer-equivariance. Do not infer local isomorphism from point bijectivity.

**Named declarations and API.**

- `TauCeti.ModularCurves.openLevelUniformization`: the stated theorem with precisely these hypotheses.

**Check.**

- For N=2 the coarse full-level curve is A¹_C\{0,1}; its level stack retains [−1].
- For N≥3 the fixed-pairing curve is connected; the unrestricted full curve has φ(N) components.
- Every local inverse preserves the analytic structure sheaf.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/marked-torus-family`, `tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures`, `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`, `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`, `AbelianSchemesAndArithmeticModuli:A5`, `ComplexComparisonPartII:C0/repair-analytification`, `ComplexComparisonPartII:C4/family-morphism-interface`, `SchemeAndStackFoundations:SF.2`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §9, pp.18–21; Theorem 17.21, p.41 — Fine complex level curves and their analytification; [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemmas 8.5 and 8.7, pp.99–100, with the pairing convention adjusted — The Γ₀ and full-level orbit classifications; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–25 — The open moduli interpretation.

### Level maps and diamond operators

**Target** `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison` · theorem. **Planet:** Level-map comparison.

The open comparisons commute with division of levels, forgetting Q, retaining the cyclic subgroup generated by P, and every row action by a constant matrix in GL₂(Z/NZ). A row action with determinant r sends pairing ζ to ζ^r. On the Γ₁ quotient the algebraic diamond action is P↦aP; for an upper triangular SL₂ label matrix it is a=d⁻¹ modulo N. The induced map for Γ₀ agrees with the algebraic quotient isogeny E→E/⟨P⟩ and the analytic lattice map. At N=4 and above use the imported fine Y₁ carrier without enlarging its base.

**Hypotheses and carrier boundaries.**

- All levels here are invertible over C. An action whose determinant changes the pairing is not an endomorphism of a single fixed-pairing component.
- Use the right action of the previous node; the usual left action has the transformed label matrix stated there.

**Construction or proof.**

1. Evaluate each map on the marked torus sections and apply the analytic pairing determinant formula.
2. The row quotient identifications are imported from MC9B; the local family comparison makes the diagrams holomorphic, so their pointwise equality is an equality of morphisms.
3. Identify isogeny quotients with the lattice quotient by R12.1 and the imported algebraic quotient universal property.

**Named declarations and API.**

- `TauCeti.ModularCurves.levelMapAndDiamondComparison`: the stated theorem with precisely these hypotheses.

**Check.**

- A matrix with determinant 2 at N=5 moves the ζ₅ component to the ζ₅² component.
- For γ in Γ₁(N), a≡d≡1 and c≡0, so the retained P section is fixed.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.1/homothety-and-isogeny-compatibility`, `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`, `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`, `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §§5–6 and 9, pp.9–13 and 18–21 — Marking changes, homomorphisms and level quotients; [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemma 8.5 and subsequent quotient-isogeny description, p.99 — The Γ₀ quotient isogeny.

### Small-level stabilizers and coarse quotients

**Target** `ModularCurvesPartII:R12.2/stabilizers-and-small-levels` · theorem. **Planet:** Small-level stabilizers.

Over C, a strict ordered full N-frame has no pointed automorphisms for N≥3; a point of exact order N has no pointed automorphisms for N≥4 on the open curve. At N=1 the elliptic stabilizers are generically μ₂, with μ₄ and μ₆ at the special j-values; at strict full N=2 the labels leave only μ₂. Γ₀ retains [−1] generically at every N and may have larger elliptic stabilizers. A scalar-equivalence class of a full frame retains [−1] when N>2. The analytic coarse local chart at a point is U/Aut(E,level), using a finite local chart U; the global infinite-group projection H→Γ\H is not a finite map.

**Hypotheses and carrier boundaries.**

- The statements concern pointed automorphisms of the elliptic curve, not translations.
- Fine assertions apply only to the stated open moduli; they do not imply the same compactification is fine at its cusps.

**Construction or proof.**

1. Use the imported rigidity theorem for strict full or Γ₁ level and compute how −1 acts on the torsion labels.
2. At j=1728 and j=0 check the finite pointed automorphism groups against the labels.
3. Use properly discontinuous local charts and finite stabilizer quotients from MF10A; correct the global finiteness assertion in the classical handout as recorded in E8.

**Named declarations and API.**

- `TauCeti.ModularCurves.stabilizersAndSmallLevels`: the stated theorem with precisely these hypotheses.

**Check.**

- For N=2, a quadratic twist of a generic Legendre curve over C(t) has the same λ and rational full two-torsion, but need not be isomorphic to it.
- A generic Γ₀(5) object still has the automorphism −1.
- Y₁(4) is fine over C although its compactification has an irregular cusp with inertia.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures`, `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `ModularCurvesPartII:R12.2/open-level-uniformization`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 16.4 and Theorem 17.1, p.37; §9, pp.18–21 — Full-level rigidity and fine moduli; [conrad-classical](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), Proposition 3.1 and its local-chart proof, pp.3–4 — The finite local quotient, with the global finiteness assertion corrected; [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), Example 8.9, p.100, corrected — The level-two coarse Legendre parameter.

### Projective full level in the Bakker–Tsimerman setting

**Target** `ModularCurvesPartII:R12.2/projective-prime-level-application` · application.

For a prime p>3, take strict full p-frames modulo simultaneous multiplication by F_p^×. Their determinant values modulo squares give two geometric components. Each coarse component is the compactification of the effective Γ(p) quotient. The projective-frame stack has generic μ₂ inertia; rigidifying that central μ₂ gives the smooth full-level curve for p>3. Its forgetful quotient by the effective deck group is the (2,3,p) orbifold on the rigidified bare-polygon moduli stack: the quotient map has elliptic branch orders 2 and 3 and boundary order p. On a strict full p-component the effective index is (p³−p)/2, the number of cusps is (p²−1)/2 and the genus is (p+2)(p−3)(p−5)/24. These are applications of MF10A/10B, not new dimension-formula targets.

**Hypotheses and carrier boundaries.**

- p is an odd prime greater than 3. Keep the full-frame, scalar quotient, μ₂-rigidification and coarse curve as separate objects.
- A bare p-gon has group-scheme automorphisms μ_p×Z/2; its geometric automorphism count in characteristic zero is 2p. The p-fold effective cusp description uses the indicated quotient/rigidification.

**Construction or proof.**

1. The scalar action changes a determinant by a square, giving the two classes in F_p^×/(F_p^×)². The stabilizer of a class always includes −1.
2. Use the open comparison and the imported cusp stabilizer and genus formulas; full Γ(p) is torsion free effectively for p>3.
3. The R13.1 polygon automorphism theorem supplies the boundary inertia check; no false fine universal-family statement is used.

**Check.**

- For p=5 a component has 12 cusps and genus 0; for p=7 it has 24 cusps and genus 3.
- Strict full p-level has p−1 pairing components; the scalar quotient has two.
- Retaining −1 prevents treating the scalar quotient as a fine universal elliptic scheme.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.2/stabilizers-and-small-levels`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`, `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`, `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`.

**Sources:** [bt](https://benjamin-bakker.github.io/P.torsion.pdf), §2.1, pp.714–716; compare E11 — The projective level convention and its effective quotient geometry.

## R12.3. Cusps and compactification comparison

The algebraic compact curve and its Tate boundary already have suppliers. Compare their punctured charts with the effective analytic cusp parameter and extend the open isomorphism in both directions. This proves comparison, not algebraic existence. Keep completed local rings, cusp residue fields and integral nonreduced cusp fibres distinct.

### Compact analytic–algebraic modular comparison

**Target** `ModularCurvesPartII:R12.3/compact-modular-uniformization` · theorem. **Planet:** Compact modular comparison.

Let X be the actual compact coarse modular curve supplied by R13.4a over a characteristic-zero component field, with open Y from R12.2, and choose an embedding into C. The open comparison extends uniquely to an isomorphism X_C^an≅Γ\(H∪P¹(Q)), using the analytic compactification of MF10A. It identifies the algebraic boundary with the analytic cusps and respects pairing components. For prime N≥5 diamond quotients over Z[1/N], use the existing MC Layer 10 model on precisely that overlap. Other full, composite or bad-level constructions are R13.2/R13.4a inputs.

**Hypotheses and carrier boundaries.**

- The compact algebraic curve is independently constructed, normal, projective and smooth on its characteristic-zero fibre.
- Neither R12.6 nor R13.4b is a prerequisite. Completion alone does not prove the algebraic model exists.

**Construction or proof.**

1. Compare the open parts by R12.2 and the characteristic-zero coarse quotient.
2. Use the algebraic boundary charts from R13.3 and the effective analytic cusp charts to show that the open map and inverse extend across every puncture. Properness rules out missing points.
3. The extensions are inverses on a dense open and hence everywhere. Uniqueness gives compatibility with component labels and every level map.

**Named declarations and API.**

- `TauCeti.ModularCurves.compactModularUniformization`: the stated theorem with precisely these hypotheses.

**Check.**

- The map is an isomorphism of analytic spaces; it does not rebuild X via Chow.
- At N=1 it gives X(1)^an≅P¹(C) with j as coordinate and the unique cusp at infinity.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.3`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`, `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`, `SchemeAndStackFoundations:SF.2`, `ComplexComparisonPartII:C0/repair-analytification`, `ComplexComparisonPartII:C4/repair-affine-curve-completion-interface`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`, `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.8, pp.310–313 — Analytic and algebraic compactifications and their boundary compatibility; [conrad-classical](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §4, pp.8–11 — Analytic cusp coordinates; [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), Theorems 7.2 and 7.5 and the canonical X₀(N) model, pp.94–96 — Proper curve and function-field uniqueness.

### Tate and analytic cusp parameters

**Target** `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement` · theorem. **Planet:** Tate parameter comparison.

At a cusp represented by σ∞ let w be the least positive integer with σT^wσ⁻¹∈±Γ, and put q_w=exp(2πi σ⁻¹τ/w). The coarse boundary completed local ring after splitting the cusp is C[[q_w]]. The algebraic Tate chart from R13.3 restricts on a punctured convergent disc to the torus C/(Z+Zτ), with Tate coordinate u=exp(2πiz); the Tate parameter is q=q_w^w. The level labels and the invariant differential du/u=2πi dz agree. Stack or strict-level charts may use a cover of this ring and must be descended by their actual cusp inertia.

**Hypotheses and carrier boundaries.**

- w is the effective PSL₂ width. The native strict integer width h is computed using Γ rather than ±Γ; at an irregular cusp h=2w.
- Use the independently constructed algebraic Tate charts and their convergence/differential contract, not an asserted equality between unrelated formal symbols.

**Construction or proof.**

1. Use the exponential map C/Z→C^× to identify the torus quotient with C^×/q^Z.
2. Compare its convergent Weierstrass equations and differential with the algebraic Tate equation, including the rescaling between dz and du/u.
3. Apply the cusp stabilizer quotient and its invariant local parameter; descending the completed chart gives C[[q_w]] and its completed algebraic comparison.

**Named declarations and API.**

- `TauCeti.ModularCurves.tateAndCuspParameterAgreement`: the stated theorem with precisely these hypotheses.

**Check.**

- For Γ(N), N≥3, w=N at infinity and q=q_N^N.
- For Γ₀(N) at infinity w=1 and at 0 w=N.
- An irregular Γ₁(4) cusp has strict width twice its effective width; use the effective parameter for the coarse local ring.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.1/invariant-differentials-and-periods`, `ModularCurvesPartII:R13.3`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`, `ComplexComparisonPartII:C0/repair-local-faithful-flatness`, `mathlib:PeriodPair`, `tauceti:TauCeti.Subgroup.integerCuspWidth`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §4, pp.310–313 — Tate parameters in the analytic/algebraic comparison; [conrad-classical](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §4, pp.8–11 — The effective cusp parameter; [conrad-qexp](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.1–3 — The Tate differential and q-expansion frame.

### Cusp ramification under level maps

**Target** `ModularCurvesPartII:R12.3/cusp-ramification-and-level-maps` · theorem. **Planet:** Cusp ramification.

For a finite map of modular curves induced by Γ′⊂Γ, and a chosen source cusp over a target cusp, the characteristic-zero ramification index is w′/w after conjugating the cusp representatives consistently. On completed split coarse local rings the map is q_w↦q_w′^(w′/w), up to a root of unity for a changed representative. For Γ₀(N), a cusp with reduced representative a/c and c|N has width N/gcd(c²,N). These statements commute with the actual algebraic level maps and their splitting fields.

**Hypotheses and carrier boundaries.**

- Γ and Γ′ have finite index and use effective widths; identify the appropriate cusp rather than comparing widths of unrelated representatives.
- The width ratio is an integer. The source field can enlarge the cusp residue field, so separate residue degree from ramification index.

**Construction or proof.**

1. Compute both parameters from the same conjugated translation variable and their stabilizer periods.
2. Identify their quotient discs and compute the order of vanishing of the pulled-back parameter.
3. Use R12.3 parameter agreement and uniqueness of compact morphism extension to obtain the algebraic equality. For Γ₀ compute the conjugated lower-left entry c²w modulo N.

**Named declarations and API.**

- `TauCeti.ModularCurves.cuspRamificationAndLevelMaps`: the stated theorem with precisely these hypotheses.

**Check.**

- X₀(N)→X(1) has ramification N at 0 and 1 at infinity.
- For full level M divisible by N≥3, the corresponding infinity ramification is M/N.
- A root of unity changes the chosen parameter, not its ramification order.

**Direct prerequisites:** `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement`, `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`, `ModularCurvesPartII:R13.4a`.

**Sources:** [conrad-classical](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §4, pp.8–11 — The cusp parameter and level-map local charts; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26 — Congruence quotient maps and cusp widths.

### Cusp fields and pairing components

**Target** `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels` · theorem. **Planet:** Cusp fields.

The compact comparison identifies the boundary labels supplied by R13.3/R13.4a with the rational-cusp orbit set Γ\P¹(Q), including the determinant label of a full frame. A fixed full N-pairing component is defined over Q(ζ_N), and its geometric cusps split over that field. The unrestricted full curve carries all primitive pairing values and is not a single geometrically connected curve over C. Γ₀(N) has its canonical Q-model with both 0 and infinity rational; each other cusp field is obtained from the Galois action on its cyclotomic Tate-level label, rather than inferred from its complex point alone.

**Hypotheses and carrier boundaries.**

- Statements about splitting apply to generic fibres, not arbitrary bad-level base change of coarse moduli.
- The cyclotomic Galois action is the action on actual Tate-level labels; the finite boundary algebra is imported from the algebraic supplier.

**Construction or proof.**

1. Read the algebraic boundary labels and residue fields in the independently built Tate charts.
2. Compare the chosen labels with primitive rational directions and their congruence stabilizers under R12.3.
3. Transport the determinant and cyclotomic action along the comparison. For Γ₀, use the quotient-isogeny description to identify the two distinguished rational cusps.

**Named declarations and API.**

- `TauCeti.ModularCurves.cuspFieldsAndComponentLabels`: the stated theorem with precisely these hypotheses.

**Check.**

- For X₀(11), the cusps 0 and infinity both have residue field Q.
- For full N=5, each fixed-pairing component and all its cusps split over Q(ζ₅); there are four geometric pairing components of unrestricted full level.
- A complex uniformization alone makes no claim about an integral cusp residue field.

**Direct prerequisites:** `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement`, `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.2–4.8, pp.310–313 — Level labels and coefficient fields in the comparison; [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), §7, pp.94–96 — The canonical Q-model of X₀(N); [gz](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I §1, p.226 (PDF p.3) — The two rational cusps and the Q-model used in Heegner-point constructions.

## R12.4. Connectedness and twisted curves

Supply the three MC5C contracts separately: the field-extension application below, the analytic twist comparison, and the imported C4 affine connectedness equivalence. Fixed determinant fibres are connected; unrestricted ordered full level has φ(N) components. The native domain-stalk theorem supplies the final irreducibility implication.

### Connectedness under the chosen algebraic closure extension

**Target** `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension` · application.

For the actual finite-type smooth curve Y(ρ)/Q and the chosen algebraically closed extension Q̄→C, Y(ρ)_Q̄ is connected if and only if Y(ρ)_C is connected. The same holds for the fixed-pairing curve over its algebraic closure. This is the MC5C contract for these carriers, obtained from the imported invariance of geometric components, not a new general base-change theory.

**Hypotheses and carrier boundaries.**

- N≥3 and the actual MC5B/5C finite-type schemes are used.
- Both fields are algebraically closed; a comparison of rational-point sets would not imply this statement.

**Construction or proof.**

1. Apply MC0E’s geometric-component base-change theorem to the actual finite-type curve.
2. The finite set of connected components is unchanged under extension of algebraically closed fields; nonemptiness is preserved.
3. Use the resulting equivalence as the first named MC5C comparison contract, separately from the analytic isomorphism and the C4 connectedness theorem.

**Named declarations and API.**

- `TauCeti.ModularCurves.geometricConnectednessFieldExtension`: the stated application with precisely these hypotheses.

**Check.**

- The result has an explicit algebraically closed field-extension hypothesis.
- No compactification or R12.3 statement is used.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `SchemeAndStackFoundations:SF.3`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Theorem 17.21, p.41 — The fixed-pairing curve to which the imported component invariance is applied; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25 — The arithmetic twisted curve used in this specialized application.

### Geometric connectedness of a fixed-pairing curve

**Target** `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness` · theorem. **Planet:** Fixed-pairing connectedness.

For N≥3 and a primitive pairing value ζ, the nonempty smooth affine curve Y(N,ζ) over Q(ζ) is geometrically connected and geometrically irreducible. After an embedding Q̄→C its analytification is Γ(N)\H and is connected. The algebraic connectedness assertion is invariant under the algebraically closed extension Q̄→C. The unrestricted full-level curve over C has exactly φ(N) geometrically irreducible components, indexed by primitive pairing values.

**Hypotheses and carrier boundaries.**

- Use the fixed-pairing fibre of MC5B, not all ordered bases.
- Algebraic/analytic connectedness is imported only for finite-type smooth affine C-curves from C4; no nonproper GAGA morphism theorem is asserted.
- Algebraically closed extension invariance for this finite-type curve is an explicit MC0E supplier contract.

**Construction or proof.**

1. The upper half-plane is connected, so its continuous surjective quotient by Γ(N) is connected.
2. Apply the C4 smooth-affine connectedness equivalence to the actual fine curve and the R12.2 analytic isomorphism.
3. Use faithful scalar-extension invariance of geometric connectedness to pass from C to Q̄. Apply the anchor’s smooth-connected curve irreducibility theorem, whose locally Noetherian domain-stalk leaf is already in Tau Ceti.

**Named declarations and API.**

- `TauCeti.ModularCurves.fixedPairingGeometricConnectedness`: the stated theorem with precisely these hypotheses.

**Check.**

- The C4 input is a scheme–analytic connectedness equivalence for the smooth affine curve.
- At N=3 the unrestricted full curve has two components, each connected.
- Connectedness without local domain stalks would not justify irreducibility.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `ComplexComparisonPartII:C4/affine-curve-connectedness`, `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`, `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Theorem 17.21 and discussion of connected components, p.41 — The analytic fixed-pairing component; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–25 — Connected upper-half-plane quotients and the level curves.

### The analytic comparison for a symplectic twist

**Target** `ModularCurvesPartII:R12.4/twisted-analytic-comparison` · theorem. **Planet:** Twisted-curve comparison.

Let N≥3 and let V_ρ/Q be the imported rank-two finite étale Z/N-module scheme with perfect alternating Galois-equivariant pairing to μ_N. Let Y(ρ) be the MC5C symplectic-frame quotient, parametrizing pairing-preserving isomorphisms E[N]≅V_ρ. A symplectic frame after extension to a splitting field identifies Y(ρ) there with the corresponding single fixed-pairing curve. After embedding that field in C, this gives an isomorphism (Y(ρ)_C)^an≅Γ(N)\H. Changing the frame changes the identification by the corresponding SL₂ action and preserves the actual descent cocycle.

**Hypotheses and carrier boundaries.**

- The representation comes with its pairing. In a chosen basis its determinant is the cyclotomic character; an arbitrary GL₂ representation without such a pairing does not define this symplectic twist.
- MC5C owns the construction, freeness, smoothness and descent of Y(ρ).

**Construction or proof.**

1. Trivialize the paired finite étale module over a finite Galois splitting field and evaluate the imported quotient construction in that frame.
2. The pairing equality selects one determinant fibre, not a union. Compose its algebraic trivialization with R12.2.
3. Compute a frame change and the Galois cocycle on the moduli isomorphisms; the equality is an equality of morphisms on the imported curve.

**Named declarations and API.**

- `TauCeti.ModularCurves.twistedAnalyticComparison`: the stated theorem with precisely these hypotheses.

**Check.**

- A symplectic frame produces exactly one Γ(N) quotient.
- Changing it by determinant r moves the pairing fibre unless the pairing is simultaneously transported.
- No field-points bijection substitutes for the analytic isomorphism.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25 — Level structures with prescribed Galois representation and their complex uniformization; [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §9, pp.18–21 and Theorem 17.21, p.41 — Marked complex curves and fixed-pairing analytification.

### Geometric irreducibility of the twisted curve

**Target** `ModularCurvesPartII:R12.4/twisted-geometric-irreducibility` · theorem. **Planet:** Twisted-curve irreducibility.

For the paired representation and Y(ρ) of the previous node, Y(ρ) is geometrically connected and geometrically irreducible over Q. Discharge the anchor’s three external hypotheses separately: invariance of connectedness under Q̄→C for the actual curve; the twisted analytic isomorphism with Γ(N)\H; and C4’s connectedness equivalence for the smooth affine C-curve. Smoothness and nonemptiness then permit the anchor’s conditional irreducibility result to be applied unconditionally.

**Hypotheses and carrier boundaries.**

- N≥3. A small-level coarse twist is not the fine scheme Y(ρ) treated by this theorem.
- The same statement holds over a characteristic-zero field with the same paired finite étale data after choosing an algebraic closure and embedding the field of definition into C.

**Construction or proof.**

1. Use the splitting-field trivialization to identify the geometric twist with a fixed-pairing component.
2. Apply its geometric connectedness, or the three contracts individually, with all smoothness and finite-type hypotheses checked.
3. Invoke the imported MC5C smooth-connected irreducibility implication.

**Named declarations and API.**

- `TauCeti.ModularCurves.twistedGeometricIrreducibility`: the stated theorem with precisely these hypotheses.

**Check.**

- The statement names each of the three MC5C contracts and does not add an unexplained connectedness assumption.
- It holds for a nontrivial twist with no chosen rational symplectic frame.

**Direct prerequisites:** `ModularCurvesPartII:R12.4/twisted-analytic-comparison`, `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `ComplexComparisonPartII:C4/affine-curve-connectedness`, `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension`.

**Sources:** [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25 — The twisted level curve used in the modularity argument; [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Theorem 17.21, p.41 — Fixed-pairing connected complex curves.

## R12.5. Differentials and Hecke normalisation

The Hodge frame is 2πi dz and a weight-two cusp form gives 2πi f(τ)dτ=f(q)dq/q at infinity. Construct the characteristic-zero correspondences needed for this comparison, separating all subgroups, cyclic kernels and bad-prime branches. The full rational first-coefficient pairing includes every T_n and does not invoke a newform decomposition.

### The Hodge line and the automorphy factor

**Target** `ModularCurvesPartII:R12.5/hodge-line-automorphy` · theorem. **Planet:** Hodge-line comparison.

On the elliptic level moduli stack let ω=e*Ω¹_E/Y be the imported invariant-differential line. Pulling it to H along the marked family trivializes it by 2πi dz, the frame agreeing with du/u on the Tate curve. In usual left-action coordinates τ′=(aτ+b)/(cτ+d), z′=z/(cτ+d), the pullback of dz′ is dz/(cτ+d). Thus a section (2πi)^k f(τ)dz^k is equivariant precisely when f(τ′)=(cτ+d)^k f(τ). This identifies ω^k with the imported analytic automorphy bundle, extends in Tate frames to the compact level stack, and respects level pullback.

**Hypotheses and carrier boundaries.**

- The line is on the moduli stack or on a fine locus with universal curve. For a coarse curve, descend only when its stabilizers act trivially on the relevant fibre; otherwise use the invariant section-space formulation of MF10C.
- In particular generic −1 acts as −1 on ω. There is no unrestricted weight-one line bundle on the coarse Γ₀ curve.
- The algebraic individual-curve normalization dx/(2y)↔dz remains unchanged; multiplication by 2πi belongs to this modular/Tate frame.

**Construction or proof.**

1. Pull back the relative algebraic differential line to the marked family and use R12.1.
2. Compute the multiplier of the fibre coordinate under a marking change; taking kth tensors gives the exact automorphy law.
3. Use Tate parameter agreement for the boundary frame and finite stabilizer invariance for the coarse section-space description.

**Named declarations and API.**

- `TauCeti.ModularCurves.hodgeLineAutomorphy`: the stated theorem with precisely these hypotheses.

**Check.**

- The Tate frame is du/u and pulls back to 2πi dz.
- For γ=T the multiplier is 1; for γ=S it is τ⁻¹ on the fibre differential.
- Weight one fails to descend across generic −1 inertia, while even powers can pass that obstruction.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`, `ModularCurvesPartII:R12.2/marked-torus-family`, `ModularCurvesPartII:R12.1/invariant-differentials-and-periods`, `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement`, `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`, `ComplexComparisonPartII:C0/repair-analytification`, `ComplexComparisonPartII:C2`.

**Sources:** [conrad-qexp](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.1–3 — The Hodge line, Tate frame and modular q-expansion; [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §9, pp.18–21 — The marking action on fibre differentials.

### Weight-two cusp forms and regular differentials

**Target** `ModularCurvesPartII:R12.5/weight-two-regular-differentials` · theorem. **Planet:** Cusp-form differential comparison.

For a congruence subgroup Γ with the actual smooth projective coarse curve X/C from R13.4a, the map f↦ω_f=2πi f(τ)dτ is a C-linear isomorphism S₂(Γ)≅H⁰(X,Ω¹_X/C). At a cusp of effective width w it is ω_f=w f dq_w/q_w; cuspidality is exactly regularity there. At elliptic points the invariant local expression descends regularly through the finite stabilizer chart. At irregular cusps use the effective parameter and the weight-two sign invariance. This comparison respects level pullback and trace on finite characteristic-zero curve maps.

**Hypotheses and carrier boundaries.**

- All coefficient spaces and analytic section spaces are the existing MF10C carriers; the algebraic differentials use the independently constructed X.
- No smooth fine universal elliptic curve on the coarse X is assumed.
- The formula contains 2πi and the width w; changing either changes the stated comparison.

**Construction or proof.**

1. Use the Hodge-line/automorphy comparison and the imported weight-two canonical-form dictionary on the analytic quotient.
2. At a cusp substitute dq_w/q_w=(2πi/w)dτ. The constant term must vanish exactly when the differential has no pole. At an elliptic chart compute invariants in t with quotient coordinate t^e.
3. Apply proper coherent comparison to identify holomorphic and algebraic regular differentials. Local pullback and finite trace computations give naturality.

**Named declarations and API.**

- `TauCeti.ModularCurves.weightTwoRegularDifferentials`: the stated theorem with precisely these hypotheses.

**Check.**

- For Γ₀(N) at infinity, ω_f=f dq/q; the q coefficient a₁ is the leading dq coefficient.
- At a width-N cusp the factor is N.
- A weight-two form with nonzero cusp constant gives a logarithmic pole and is excluded from H⁰Ω¹.
- No arbitrary integral base change is claimed: DDT Theorem 1.33 needs its stated flatness or invertibility assumptions.

**Direct prerequisites:** `ModularCurvesPartII:R12.5/hodge-line-automorphy`, `ModularCurvesPartII:R12.3/compact-modular-uniformization`, `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`, `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`, `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C5/curve-residue-localization`, `ModularCurvesPartII:R13.4a`.

**Sources:** [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.12, pp.25–26; Theorem 1.33, pp.38–39 — The weight-two differential and its algebraic comparison with explicit base hypotheses; [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §4, pp.310–313 — Comparison of modular sections and differentials.

### Characteristic-zero pullback and trace actions

**Target** `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action` · construction. **Planet:** Characteristic-zero Hecke action.

On the canonical Γ₀(N) coarse curve over Q, define the action on regular differentials of the good degree-n isogeny correspondence, gcd(n,N)=1, by pullback along the target map and finite trace along the source map. Its generic objects are all order-n finite subgroups D⊂E, with the transported cyclic N-subgroup; its degree is σ₁(n). Separately the cyclic-kernel correspondence has degree ψ(n)=n∏_{p|n}(1+1/p). For p|N define U_p from order-p subgroups disjoint from the marked cyclic N-subgroup; its source degree is p. Compactify the characteristic-zero correspondences by normalization of the appropriate open finite covers, using the supplied generic coarse models. The action on ω^k sections is n⁻¹ times raw isogeny pullback and trace (p⁻¹ for U_p); for regular differentials use the curve differential pullback and trace directly.

**Hypotheses and carrier boundaries.**

- N,n≥1; the all-subgroup degree assertion is for gcd(n,N)=1. The U_p construction is stated separately.
- The base has characteristic zero, so division by n is defined. Integral extensions and bad-characteristic divisibility are R14.1 targets, not prerequisites.
- For Γ₀ no universal elliptic scheme is assumed: define the isogeny differential multiplier on a rigidified cover and descend its invariant action.

**Construction or proof.**

1. Use the imported elliptic subgroup/isogeny carriers and finite quotients to build the open correspondence; count sublattices via Hermite normal form. Distinguish all subgroups from cyclic ones.
2. Normalize the independently given characteristic-zero compact curve in each finite generic algebra; use the generic curve morphism-extension and trace interface.
3. Compute the differential action on each lattice branch. At p|N the disjointness condition removes the multiplication branch, yielding U_p. The finite trace extends regular differentials, including at ramification.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.charZeroHeckeCorrespondence` | constructor | The compact all-subgroup correspondence for gcd(n,N)=1, with its two maps. |
| `TauCeti.ModularCurves.charZeroCyclicCorrespondence` | constructor | The separate cyclic-kernel correspondence. |
| `TauCeti.ModularCurves.charZeroUCorrespondence` | constructor | For p∣N, the degree-p disjoint-kernel correspondence. |
| `TauCeti.ModularCurves.charZeroHecke_onDifferentials` | functoriality | Target pullback followed by source trace on H⁰Ω¹. |
| `TauCeti.ModularCurves.charZeroHecke_onHodgePower` | compatibility | For weight k, divide the raw isogeny differential pullback/trace by n. |
| `TauCeti.ModularCurves.charZeroHecke_degree` | characterisation | Good all-subgroup degree σ₁(n); cyclic degree ψ(n); U_p degree p. |

**Uses.**

- `ModularCurvesPartII:R12.5/hecke-normalization-comparison`: Provides the geometric action to compare.
- `ModularCurvesPartII:R14.1`: Pins the characteristic-zero normalization which the integral comparison must recover.

**Unit tests.**

- **computation**, `TauCeti.ModularCurves.charZeroHecke_degree_four`: If N is odd, the n=4 all-subgroup degree is 7 and the cyclic degree is 6; the omitted kernel is E[2].
- **degenerate**, `TauCeti.ModularCurves.charZeroHecke_identity`: At n=1 the correspondence is the diagonal and its differential action is the identity.
- **compatibility**, `TauCeti.ModularCurves.charZeroHecke_raw_prime`: For weight k and p∤N, raw isogeny trace equals p times the analytic T_p, including both the p^k f(pτ) branch and the p other branches.
- **non-example**, `TauCeti.ModularCurves.charZeroHecke_bad_prime`: At p|N, U_p has degree p rather than p+1; no σ₁(p) claim is made for that operator.

**Check.**

- Use seven all-subgroup branches versus six cyclic branches at n=4.
- The correspondence acts on regular differentials by target pullback followed by source trace.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`, `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R12.1/homothety-and-isogeny-compatibility`, `ModularCurvesPartII:R12.5/weight-two-regular-differentials`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `SchemeAndStackFoundations:SF.3`.

**Sources:** [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), §5, Lemma 5.13, Remarks 5.14–5.15 and Proposition 5.16/Corollary 5.17, pp.72–74 — The lattice representatives underlying the characteristic-zero calculation; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26 and §1.6, p.39 — The Hecke action and q-normalization; [bt](https://benjamin-bakker.github.io/P.torsion.pdf), §2.5, pp.716–717, corrected as E12 — The cyclic/all-subgroup distinction needed by the routed Hecke item; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–46 — Geometric correspondences; only their characteristic-zero normalization is used here.

### The pullback–trace Hecke normalization

**Target** `ModularCurvesPartII:R12.5/hecke-normalization-comparison` · theorem. **Planet:** Hecke normalization.

Under f↦2πi f(τ)dτ, the geometric Γ₀(N) differential action of the preceding node equals the anchor’s analytic T_n for gcd(n,N)=1 and U_p for p|N. For even weight k, raw isogeny trace divided by n is T_n f=n^(k−1)∑_{ad=n,0≤b<d}d^(−k)f((aτ+b)/d); in weight two each branch has coefficient a/d, exactly d((aτ+b)/d)/dτ. At a good prime T_p f=p^(k−1)f(pτ)+p⁻¹∑_{b=0}^{p−1}f((τ+b)/p). The bad-prime action is U_p f=p⁻¹∑_b f((τ+b)/p). They recover a₁(T_n f)=a_n(f) for the full composite operator, with the imported good-prime recurrence and bad-prime powers.

**Hypotheses and carrier boundaries.**

- The general displayed weight-k formula is for trivial Γ₀ character. Nebentypus and Γ₁ transports use the anchor’s explicitly labelled slash/diamond conventions, not a silent change of this formula.
- The good composite T_n uses all subgroups. The cyclic modular-polynomial correspondence is not substituted at squareful n.

**Construction or proof.**

1. On the branch ad=n, τ′=(aτ+b)/d, the isogeny z↦az multiplies the Hodge frame by a, giving a^k/n=a^(k−1)/d.
2. For weight two the curve differential pullback multiplies dτ′ by a/d, giving precisely the normalized Hodge action.
3. Sum branch traces, identify the anchor’s triangular slash sum, and use its q-expansion theorem. Treat the U branch set separately and combine prime powers by the imported Hecke relations.

**Named declarations and API.**

- `TauCeti.ModularCurves.heckeNormalizationComparison`: the stated theorem with precisely these hypotheses.

**Check.**

- For k=2, T_p has coefficients p and 1/p in its two branch types.
- For good p, T_{p²}=T_p²−p·Id on trivial-character weight two, while the cyclic degree differs by the one noncyclic subgroup.
- This theorem supplies a characteristic-zero target for R14.1 and does not presume its integral construction.

**Direct prerequisites:** `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:HeckeRing.GL2.qExpansion_coeff_one_heckeRingHomCharSpace_heckeTCompositeGamma0`.

**Sources:** [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26 and §1.6, p.39 — The classical normalization and coefficient action; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–46 — The isogeny action whose raw differential multiplier is normalized here; [bt](https://benjamin-bakker.github.io/P.torsion.pdf), §2.5, pp.716–717, corrected — Avoids confusing cyclic and full Hecke operators.

### The full Hecke first-coefficient pairing

**Target** `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing` · definition. **Planet:** Hecke coefficient pairing.

Let V_Q=H⁰(X₀(N)_Q,Ω¹) and use the rational infinity Tate chart to extract a_n from ω=f(q)dq/q. Let T_Q⊂End_Q(V_Q) be the image of the full commutative Hecke algebra generated by every T_n, including the bad-prime U blocks. Define β:T_Q×V_Q→Q by β(T,f)=a₁(Tf), and extend scalars to C through the differential comparison. It is a bilinear form on the full space; it is not restricted to a newspace or an eigenspace.

**Hypotheses and carrier boundaries.**

- N≥1; X₀(N)_Q and its rational cusp chart are imported from R13.4a/R13.3.
- Use the image algebra of actual operators, so a zero operator is zero in T_Q; no abstract Hecke-ring kernel is silently discarded.
- At N=1 the cusp-form space is zero and its image algebra is the zero algebra.

**Construction or proof.**

1. The algebraic pullback–trace operators are defined over Q, so their image preserves V_Q. The rational q-chart defines Q-linear coefficient functionals.
2. Bilinearity follows from the operator action and coefficient extraction. Proper cohomology base change identifies V_Q⊗C with the analytic full S₂ space.
3. Use the normalized Hecke comparison to establish β(T_n,f)=a_n(f); record the commuting action relation β(ST,f)=β(S,Tf).

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing` | constructor | β(T,f)=a₁(Tf) over Q and its scalar extensions. |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_bilinear` | structure | Q-linearity in both arguments. |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_Tn` | characterisation | β(T_n,f)=a_n(f) for every n≥1. |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_action` | compatibility | β(ST,f)=β(S,Tf). |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_baseChange` | functoriality | Scalar extension to C agrees with the analytic q-coefficient pairing. |

**Uses.**

- `ModularCurvesPartII:R12.5/perfect-hecke-pairing`: Identifies the two full vector spaces as duals.
- `ModularCurvesPartII:R14.2`: Provides the cohomological normalization; the Jacobian action is a separate consumer.

**Unit tests.**

- **compatibility**, `TauCeti.ModularCurves.firstCoefficientHeckePairing_identity`: β(Id,f)=a₁(f); it need not equal a₂(f).
- **degenerate**, `TauCeti.ModularCurves.firstCoefficientHeckePairing_zeroSpace`: At N=1 both spaces are zero and the zero-dimensional pairing is perfect.
- **computation**, `TauCeti.ModularCurves.firstCoefficientHeckePairing_level11`: For the normalized level-11 weight-two cusp form, β(T₁,f)=1 and the full Hecke image has dimension one.
- **non-example**, `TauCeti.ModularCurves.firstCoefficientHeckePairing_badU`: If p|N, β(U_p,f)=a_p(f); excluding bad-prime operators would fail to describe the full pairing in GZ V §1.

**Check.**

- The domain is the operator image T_Q and the whole V_Q.
- The comparison identifies the algebraic rational coefficient normalization at infinity with the analytic one.

**Direct prerequisites:** `ModularCurvesPartII:R12.5/hecke-normalization-comparison`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `ComplexComparisonPartII:C2`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [gz](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), V §1, p.306 (PDF p.83) — The full rational Hecke pairing; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.34, p.39 — Hecke operators paired with the first coefficient.

### Perfection of the full Hecke pairing

**Target** `ModularCurvesPartII:R12.5/perfect-hecke-pairing` · theorem. **Planet:** Perfect Hecke pairing.

The pairing β:T_Q×V_Q→Q is perfect: T_Q≅V_Q* and V_Q≅T_Q*. In particular dim_Q T_Q=dim_Q V_Q. The same holds after scalar extension to C. The result uses q-expansion injectivity, commutativity and the span of all T_n, including bad-prime blocks; it requires no eigenbasis, semisimplicity or newform decomposition. The integral lattice perfectness of DDT is an imported stronger supplier when its hypotheses are met, not claimed by this rational theorem.

**Hypotheses and carrier boundaries.**

- The spaces are finite dimensional and T_Q is the image of the full Hecke algebra on V_Q.
- All operators T_n act with a₁(T_n f)=a_n(f), and their Q-span is T_Q by the imported Hecke relations.

**Construction or proof.**

1. If β(T_n,f)=0 for all n, every q coefficient of f vanishes, so f=0.
2. If β(T,f)=0 for every f, then a_n(Tf)=a₁(T_nTf)=a₁(TT_nf)=0 by commutativity; hence Tf=0 for every f, and T=0 in the image algebra.
3. Both radicals vanish; finite-dimensional linear algebra gives equal dimensions and perfection over C. The rational coefficient and operator definitions, or faithful scalar extension, give perfection over Q.

**Named declarations and API.**

- `TauCeti.ModularCurves.perfectHeckePairing`: the stated theorem with precisely these hypotheses.

**Check.**

- Both radicals are checked; one-sided nondegeneracy does not prove the claim by itself.
- The proof includes every n and every bad-prime block.
- No Jacobian faithfulness theorem is used to prove this pairing.

**Direct prerequisites:** `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [gz](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), V §1, p.306 (PDF p.83) — Perfection on the full rational space; [ddt](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.34 and proof, p.39 — The coefficient argument and its integral version.

## R12.6. Descent and compatibility statements

Export comparisons on the already constructed generic models with their actual coefficient fields, component labels and rational cusp parameters. The function-field statement uses the cyclic modular polynomial supplied by R13.4a. A nonsplit cusp needs parameter descent data; arbitrary automorphisms of C receive an algebraic semilinear action rather than an analytic continuity assertion.

### Canonical generic models and coefficient descent

**Target** `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent` · theorem. **Planet:** Generic-model descent.

For the independently constructed open and compact modular models, the R12.2/R12.3 comparisons respect their characteristic-zero fields of definition. Γ₀ and Γ₁ have their canonical Q-models; fixed full N-pairing has a Q(ζ_N)-model; the paired twist Y(ρ) has the MC5C Q-model. Effective descent of curve maps and sections applies to these actual models. A section defined over C descends to a characteristic-zero coefficient field K containing the model’s field when its q-expansion at a K-rational split cusp has coefficients in K, with the supplied injective q-expansion map and its field-base-change equality checked.

**Hypotheses and carrier boundaries.**

- The cusp is K-rational and its chosen Tate parameter/frame is defined over K; otherwise first enlarge K to split the cusp and use the resulting Galois descent datum.
- Use finite-dimensional section spaces with flat field base change; no arbitrary nonflat integral q-expansion principle is asserted.
- The compact input is R13.4a, and this stage exports to R13.4b.

**Construction or proof.**

1. Keep the curve and line bundle from the algebraic suppliers, and compare their complex fibres rather than reconstructing them from the analytic quotient.
2. Apply the imported effective descent framework to semilinear automorphisms and maps. For coefficients, choose a K-basis and use finitely many q coefficients giving an injective finite-dimensional coordinate map.
3. Solve its linear coordinate system over K to show that a section with coefficients in K lies in the K-form; verify the cusp parameter and Hodge normalization.

**Named declarations and API.**

- `TauCeti.ModularCurves.canonicalGenericFibreDescent`: the stated theorem with precisely these hypotheses.

**Check.**

- A nonsplit cusp does not give coefficient descent to K without its parameter descent datum.
- The map retains the factor (2πi)^k from the modular Hodge frame.
- The full Hecke pairing of R12.5 is already over Q and remains compatible under this export.

**Direct prerequisites:** `ModularCurvesPartII:R12.3/compact-modular-uniformization`, `ModularCurvesPartII:R12.5/hodge-line-automorphy`, `ModularCurvesPartII:R12.4/twisted-analytic-comparison`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.3`, `ComplexComparisonPartII:C2`.

**Sources:** [conrad-qexp](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.3–6 — The q-expansion descent argument and its base hypotheses; [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.5–4.8, pp.312–313 — Coefficient fields in the analytic/algebraic comparison.

### The rational function field of X₀(N)

**Target** `ModularCurvesPartII:R12.6/gamma-zero-rational-function-field` · theorem. **Planet:** Rational modular function field.

On the actual canonical X₀(N)_Q, j is the source invariant and j′ is the invariant of E/C for the cyclic order-N subgroup C. For N≥1, Q(X₀(N))=Q(j,j′), and after the chosen complex comparison j′(τ)=j(Nτ). The minimal polynomial is the imported cyclic modular polynomial Φ_N, of degree ψ(N) in the second variable, giving [Q(X₀(N)):Q(j)]=ψ(N). Normalization of its plane equation recovers the supplied smooth projective model. This is a generic function-field comparison; the integral construction of Φ_N belongs to R13.4a.

**Hypotheses and carrier boundaries.**

- The symbol C denotes the subgroup in E/C here; it is not the base field.
- For N=1, j′=j and Φ₁(X,Y)=Y−X up to the fixed monic convention.
- Use the cyclic correspondence rather than the all-subgroup Hecke correspondence at squareful N.

**Construction or proof.**

1. For the standard Γ₀ label ⟨1/N⟩, the quotient torus normalized by multiplication by N has parameter Nτ, giving j′=j(Nτ).
2. Distinct Γ₀ cosets give distinct generic quotient invariants; the orbit count is ψ(N). Apply the supplier’s irreducible monic modular polynomial.
3. Identify the subfield and its extension degree over Q by coefficient descent; unique smooth projective normalization identifies the two actual models.

**Named declarations and API.**

- `TauCeti.ModularCurves.gammaZeroRationalFunctionField`: the stated theorem with precisely these hypotheses.

**Check.**

- At N=1 the extension degree is one.
- At N=4 the function-field degree is six, not the all-subgroup Hecke degree seven.
- The two source/target invariant maps are defined over Q.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`, `ModularCurvesPartII:R13.4a`, `SchemeAndStackFoundations:SF.3`.

**Sources:** [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), Theorem 6.1, pp.87–90; §7, pp.94–96 — The cyclic modular polynomial and the canonical function field; [gz](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I §1, p.226 (PDF p.3) — Q(j,j′) on the canonical Γ₀ model.

### Component fields and symplectic descent

**Target** `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent` · theorem. **Planet:** Pairing-component descent.

For N≥3, the determinant map on the unrestricted full-level generic curve has fibres Y(N,ζ) which are geometrically connected, and the same pairing labels extend to its compact model. Over a splitting field these are exactly its φ(N) geometric components. Galois sends the ζ fibre to the σ(ζ) fibre, so the fixed fibre is defined over Q(ζ) and cannot be treated as a Q-subcurve without a compatible descent datum. The frame cocycle of the paired representation descends the selected fibre to Y(ρ)/Q and its canonical compact normalization. An unpaired GL₂ twist of all determinant fibres is a different moduli problem.

**Hypotheses and carrier boundaries.**

- The compact normalization of Y(ρ) is supplied by the generic algebraic compactification/descent interface; it is not constructed by analytic completion.
- Use the pairing-compatible cocycle of MC5C. Determinant data are part of the descent, not extra component labels added afterwards.

**Construction or proof.**

1. Apply geometric connectedness on every primitive determinant fibre. The Galois-equivariant algebraic pairing computes the permutation of fibres.
2. Identify the stabilizer of ζ in Galois and its cyclotomic fixed field.
3. Use the imported symplectic-frame quotient descent and unique proper-curve normalization to obtain the twisted compact model and its level compatibilities.

**Named declarations and API.**

- `TauCeti.ModularCurves.componentFieldsAndTwistedDescent`: the stated theorem with precisely these hypotheses.

**Check.**

- At N=5, Galois permutes four geometric components through the cyclotomic character.
- A nontrivial paired twist is geometrically one fixed-pairing curve, not four components.

**Direct prerequisites:** `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness`, `ModularCurvesPartII:R12.4/twisted-analytic-comparison`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `ModularCurvesPartII:R13.4a`.

**Sources:** [conrad-course](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §8, pp.17–19 and Theorem 17.21, p.41 — Fixed pairing values and their connected components; [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.5–4.8, pp.312–313 — Cyclotomic coefficient fields in full-level comparison.

### Complex conjugation and pairing inversion

**Target** `ModularCurvesPartII:R12.6/complex-conjugation-comparison` · theorem. **Planet:** Conjugation comparison.

Complex conjugation on the canonical algebraic models corresponds analytically to τ↦−τ̄ after restoring the positive lattice orientation. On a strict full frame the conjugate (P,Q)=(1/N,τ/N) becomes (P′,−Q′) on Λ_{−τ̄}, so its pairing is ζ_N⁻¹. It sends the ζ component to the ζ⁻¹ component, acts on cusp labels and residue fields through their actual cyclotomic descent data, and commutes with Γ₀ source/target j maps. An arbitrary automorphism of C acts semilinearly on the algebraic model; it is not claimed to be a holomorphic map on H.

**Hypotheses and carrier boundaries.**

- The analytic formula is for the continuous field automorphism of complex conjugation.
- Choose the oriented basis explicitly; taking (1,τ̄) without changing orientation would give a lower-half-plane parameter.

**Construction or proof.**

1. Conjugate the lattice and its torsion coordinates, then replace the second period by its negative to return to H.
2. The basis change has determinant −1, so use the Weil pairing determinant formula.
3. Compare algebraic conjugation on the independently constructed models, their j functions and cusp charts; uniqueness extends the open comparison.

**Named declarations and API.**

- `TauCeti.ModularCurves.complexConjugationComparison`: the stated theorem with precisely these hypotheses.

**Check.**

- At N=3 conjugation exchanges the two pairing components.
- For Γ₀(N) the rational cusps 0 and infinity remain rational.
- Complex conjugation is antiholomorphic; arbitrary σ∈Aut(C) receives no analytic continuity assertion.

**Direct prerequisites:** `ModularCurvesPartII:R12.1/analytic-algebraic-weil-pairing`, `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`, `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [bt](https://benjamin-bakker.github.io/P.torsion.pdf), §2.1, p.714 — The antiholomorphic involution on the projective level curves; [milne](https://www.jmilne.org/math/CourseNotes/MF.pdf), §7, pp.95–96 — The algebraic Aut(C) action defined through j and j′.

### Generic base change and level compatibility

**Target** `ModularCurvesPartII:R12.6/generic-base-change-and-level-compatibility` · theorem. **Planet:** Generic-fibre compatibility.

All the generic-fibre curve, pairing, cusp, Hodge-line and regular-differential comparisons commute with characteristic-zero field extension, level division, the imported diamond actions and the characteristic-zero Hecke actions with their stated level conditions. The finite boundary algebra and its rational/cyclotomic labels base change as algebraic data. The resulting interface is supplied to R13.4b and the CM-class-function consumers. It makes no assertion that formation of arbitrary integral coarse spaces commutes with every base change.

**Hypotheses and carrier boundaries.**

- Field extensions are flat; retain the actual model’s field, cusp splitting field and pairing value.
- A map changing determinant is a map between the indicated components. For U_p and good T_n retain the separate branch conditions.

**Construction or proof.**

1. Check the commutative diagrams on the marked torus and Tate charts for every permitted map.
2. Use faithful field extension and the algebraic map/section descent interface to obtain equalities over the coefficient field.
3. Apply uniqueness of extension on normal projective curves and proper coherent base change for differential section spaces.

**Named declarations and API.**

- `TauCeti.ModularCurves.genericBaseChangeAndLevelCompatibility`: the stated theorem with precisely these hypotheses.

**Check.**

- The dependency direction is R13.4a→R12.3→R12.6→R13.4b.
- No integral coarse-base-change theorem is smuggled into the field-extension comparison.
- Every Hecke diagram uses the normalization proved in R12.5.

**Direct prerequisites:** `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `ModularCurvesPartII:R12.3/cusp-ramification-and-level-maps`, `ModularCurvesPartII:R12.5/hecke-normalization-comparison`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `ComplexComparisonPartII:C2`, `ModularCurvesPartII:R13.4a`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.8, pp.310–313 — Compatibility of the algebraic/analytic maps and modular sections; [conrad-qexp](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.3–6 — Coefficient-field base change under its stated hypotheses.

## R13.1. Generalised elliptic curves

The generic nodal-curve machinery is an import. This stage owns the extra smooth-group/action structure, split polygon calculations, finite subgroup quotients, special contractions, torsion/full-set extension, formal polygon algebraization and the Ell_m contraction tower. These are sufficient to construct integral level stacks without using R13.3 as a hidden prerequisite.

### Semistable genus-one curves and split polygons

**Target** `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons` · definition.

A semistable genus-one curve C/S is proper, flat and finitely presented, with geometrically connected reduced fibres having only ordinary double points and trivial dualizing sheaf. Its smooth locus is Cˢᵐ. The split m-gon C_m is obtained by gluing infinity on the ith P¹_S to zero on the (i+1)st, indexed by Z/mZ, with C_mˢᵐ=G_m×Z/mZ. For m=1 identify two distinct sections of one P¹; an integral plane model is y²z+xyz=x³, with identity [0:1:0]. Every singular geometric fibre of a semistable genus-one curve is a polygon; the smooth fibres are genus-one curves.

**Hypotheses and carrier boundaries.**

- m≥1 and S is arbitrary; m=1 is a self-gluing, not a cycle with two independent components.
- The generic nodal-curve and dualizing-sheaf machinery is an AM supplier. No chosen identity or group law is part of the semistable-curve definition.

**Construction or proof.**

1. Use nodal gluing of marked P¹ components, including the two distinct branches in the one-component case.
2. Compute arithmetic genus from the normalization exact sequence and identify the dualizing sheaf using differentials with opposite residues at each glued pair.
3. For a singular connected nodal curve with trivial dualizing sheaf, the component degree formula forces every rational component to have valency two; its dual graph is a cycle. Smooth genus-one components cannot carry a node under the same formula.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.SemistableGenusOneCurve` | structure | The proper flat finitely presented curve with the stated geometric-fibre conditions. |
| `TauCeti.ModularCurves.neronPolygon` | constructor | C_m/S with its component indexing and gluing data. |
| `TauCeti.ModularCurves.neronPolygon_smoothLocus` | characterisation | C_mˢᵐ≅G_m×Z/mZ. |
| `TauCeti.ModularCurves.neronPolygon_baseChange` | functoriality | The split m-gon commutes with arbitrary base change. |
| `TauCeti.ModularCurves.neronPolygon_one_equation` | compatibility | The one-gon identifies with y²z+xyz=x³. |
| `TauCeti.ModularCurves.splitOneGonEquation` | constructor | The light native Weierstrass equation over Z with a₁=1 and all other coefficients zero, realizing y²z+xyz=x³. It is singular and does not stand in for the generalized-curve carrier. |

**Uses.**

- `ModularCurvesPartII:R13.1/generalized-elliptic-curve`: Adds the smooth-locus group and its action.
- `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change`: Identifies the degeneration scheme and component strata.

**Unit tests.**

- **degenerate**, `TauCeti.ModularCurves.neronPolygon_one`: For m=1, the normalization is one P¹ and the node has two distinct preimages; x=t(t+1), y=t²(t+1) gives the plane equation.
- **computation**, `TauCeti.ModularCurves.neronPolygon_characteristicTwo`: The tangent cone at (0,0) is y(y+x), so the two branches remain distinct in characteristic two.
- **computation**, `TauCeti.ModularCurves.neronPolygon_three`: C₃ has three geometric irreducible components and three nodes.
- **non-example**, `TauCeti.ModularCurves.semistableGenusOne_nonExample`: The cuspidal cubic y²z=x³ is excluded because its singularity is not an ordinary double point.

**Check.**

- The split one-gon has two normalization preimages at its node, in every characteristic.
- The structure sheaf and the singular scheme are retained over nonreduced bases.

**Direct prerequisites:** `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `SchemeAndStackFoundations:SF.3`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), II §§1.1–1.5, pp.173–176 — The polygon geometry and semistable genus-one fibres; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.1 and Example 2.1.2, pp.4–5, corrected as E1 — The family definition and the integral split one-gon.

### Generalized elliptic curves

**Target** `ModularCurvesPartII:R13.1/generalized-elliptic-curve` · definition. **Planet:** Generalized elliptic curves.

A generalized elliptic curve E/S is a semistable genus-one curve with a commutative S-group structure on Eˢᵐ and an action Eˢᵐ×_S E→E extending translation on Eˢᵐ. On each singular geometric fibre translation rotates the components, equivalently it acts trivially on Pic⁰ and transitively on the components. Its identity is a section of Eˢᵐ. A homomorphism is an S-map carrying smooth locus to smooth locus, inducing a group homomorphism there and respecting the action. The standard m-gon has (u,i)(v,j)=(uv,i+j) on its smooth locus; this action extends to the glued curve. Smooth generalized elliptic curves recover the imported elliptic-curve group-scheme carrier.

**Hypotheses and carrier boundaries.**

- S is arbitrary; the smooth group is usually not proper. The complete curve is not itself a group scheme in the degenerate case.
- The compatibility with the rotation action is part of the data and does not follow from putting any group structure on Eˢᵐ.

**Construction or proof.**

1. Extend multiplication on each G_m component of the split polygon to the corresponding P¹ and check agreement at the glued sections.
2. Descend the group and action along fppf trivializations, using the generic descent supplier.
3. On a smooth fibre the curve equals its smooth locus and the data are precisely a pointed genus-one group scheme.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve` | structure | The curve, smooth group, identity and extending action. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.smoothGroup` | projection | The smooth separated commutative group Eˢᵐ. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.action` | projection | The extending translation action on E. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.baseChange` | functoriality | Pullback of the curve, identity, group and action. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.hom` | relation | Smooth-locus-preserving equivariant group morphisms. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.ofEllipticCurve` | coercion | The smooth case agrees with MC1D. |

**Uses.**

- `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`: Determines boundary inertia.
- `ModularCurvesPartII:R13.2/gamma-level-structures`: Provides the compactified level object.

**Unit tests.**

- **computation**, `TauCeti.ModularCurves.generalizedEllipticCurve_one`: The one-gon has smooth group G_m, with identity at u=1.
- **degenerate**, `TauCeti.ModularCurves.generalizedEllipticCurve_emptyBoundary`: If every fibre is smooth, Eˢᵐ=E and this is an ordinary elliptic curve.
- **compatibility**, `TauCeti.ModularCurves.generalizedEllipticCurve_baseChange`: Pulling back twice identifies with pullback along the composite, including the action.
- **non-example**, `TauCeti.ModularCurves.generalizedEllipticCurve_contraction`: Contracting a component may send its smooth points to a node, so the curve map need not be a homomorphism.

**Check.**

- The standard group law extends to every component and both branches at a node.
- A contraction may send smooth points to nodes and is not automatically a homomorphism under this definition.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `SchemeAndStackFoundations:SF.4`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), II §§1.1–1.6, pp.173–177 — The group action and component rotation; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.1, p.4; §2.2, pp.7–9 — Generalized elliptic structures and their morphisms.

### Automorphisms and torsion of split polygons

**Target** `ModularCurvesPartII:R13.1/neron-polygon-automorphisms` · theorem.

For m≥1, the group scheme of automorphisms of the generalized m-gon is μ_m×(Z/2Z)_S. A root ζ acts by (u,i)↦(ζ^i u,i), and the other factor acts by (u,i)↦(u⁻¹,−i); the two actions commute. Its rank is 2m and its μ_m factor is not étale at primes dividing m. For N≥1, C_mˢᵐ[N]=μ_N×(Z/mZ)[N], of finite locally free rank N gcd(N,m). It has rank N² exactly when N divides m. These formulas are group-scheme identities compatible with arbitrary base change.

**Hypotheses and carrier boundaries.**

- The constant Z/2 factor remains étale in characteristic two; μ_m is the possible infinitesimal factor.
- Do not replace μ_m by its geometric-point set in bad characteristic.

**Construction or proof.**

1. An automorphism fixes the identity, permutes components through a group automorphism and preserves their cyclic adjacency. The action condition leaves component permutation i↦i or −i.
2. On each component, equivariance gives u↦c_i u or c_i/u; compatibility forces c_i=ζ^i with ζ^m=1. Check directly that inversion commutes with this scaling.
3. Compute the N-kernel separately on G_m and the constant component group. The latter has gcd(N,m) elements.

**Named declarations and API.**

- `TauCeti.ModularCurves.neronPolygonAutomorphisms`: the stated theorem with precisely these hypotheses.

**Check.**

- For m=5 over C there are ten automorphisms and the two factors commute.
- For m=p in characteristic p the automorphism scheme has rank 2p but only two geometric points.
- For N=2 on a one-gon the torsion rank is two, not four.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), II §§1.10–1.20, pp.179–184 — Polygon automorphisms and torsion; [ces](https://arxiv.org/pdf/1511.07475v2), §2.1, especially 2.1.6 and 2.1.11, pp.5–9 — The explicit automorphism group and torsion count; [bt](https://benjamin-bakker.github.io/P.torsion.pdf), §2.1, p.714 — The direct-product polygon automorphism calculation.

### The degeneration scheme and polygon strata

**Target** `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change` · theorem.

For a generalized elliptic curve E/S define Eˢⁱⁿᵍ by Fitt₁(Ω¹_E/S) and define S∞ as its schematic image in S. Formation of these closed subschemes commutes with arbitrary base change. The degeneration scheme decomposes into open and closed strata S∞_m on which the geometric fibres are m-gons; Eˢⁱⁿᵍ→S∞_m is finite étale of degree m. Over S∞_m the curve is fppf locally the split m-gon, including when S∞_m is nonreduced. The complement S\S∞ is the largest open elliptic locus.

**Hypotheses and carrier boundaries.**

- The statement is about schematic degeneration, not just its reduced support.
- The locally constant polygon count is on S∞, not necessarily on all of S.

**Construction or proof.**

1. Compute Fitt₁ and its image on a split polygon and on an étale node chart xy=a.
2. Use translation to transport a node and its local deformation ideal to all components, making their schematic images agree. The polygon trivialization over that image identifies the finite node cover.
3. Descend these identifications and their base-change equalities; the local chart describes the complement exactly.

**Named declarations and API.**

- `TauCeti.ModularCurves.nonSmoothLocusAndBaseChange`: the stated theorem with precisely these hypotheses.

**Check.**

- The split m-gon over S has S∞=S, not S_red.
- A smooth elliptic family has empty degeneration scheme.
- Node count and the locally split description persist after any base change.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.1.12, pp.6–7 — The schematic image, strata and base-change result; [ces](https://arxiv.org/pdf/1511.07475v2), §2.1, especially 2.1.12–2.1.16, pp.8–10 — The boundary with its nonreduced structure.

### Contraction along a positive Cartier divisor

**Target** `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor` · construction. **Planet:** Divisor contraction.

Let D⊂Eˢᵐ be finite locally free over S, a relative effective Cartier divisor of positive degree on every geometric fibre. Define c_D:E→E_D by the relative Proj of ⊕_{r≥0}f_*O_E(rD). It contracts exactly the components missed by D, commutes with arbitrary base change and is unique with the stated contraction property. It identifies the preimage of E_Dˢᵐ with E_Dˢᵐ. If D is a subgroup, E_D has a unique generalized elliptic structure making this identification a group isomorphism, and the image of D is ample. If E is smooth or D meets every component, c_D is an isomorphism.

**Hypotheses and carrier boundaries.**

- The positivity condition excludes the empty divisor. D need not meet every component before contraction.
- The map c_D need not carry all of Eˢᵐ to E_Dˢᵐ; it is not asserted to be a generalized-curve homomorphism.

**Construction or proof.**

1. Apply the imported section-ring/curve contraction machinery to O_E(D). The fibre graph identifies its positive-degree and zero-degree components.
2. Use nodal local computations and cohomology base change to prove the section algebra and contraction commute with arbitrary base change.
3. For a subgroup, translations preserve the retained component set and descend to the target. The structure criterion gives the group/action and its uniqueness.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.contractGenusOne` | constructor | E_D with c_D and its relative Proj description. |
| `TauCeti.ModularCurves.contractGenusOne_retainedSmooth` | equivalence | c_D⁻¹(E_Dˢᵐ)≅E_Dˢᵐ. |
| `TauCeti.ModularCurves.contractGenusOne_baseChange` | functoriality | Arbitrary-base-change identification of contractions. |
| `TauCeti.ModularCurves.contractGenusOne_universal` | universal-property | Uniqueness among curve contractions retaining exactly the D-components. |
| `TauCeti.ModularCurves.contractGenusOne_subgroup` | structure | The unique generalized elliptic structure when D is a subgroup. |

**Uses.**

- `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`: Builds the polygon-count contraction tower.
- `ModularCurvesPartII:R13.2/contraction-maps-between-levels`: Defines compactified level reduction.

**Unit tests.**

- **degenerate**, `TauCeti.ModularCurves.contractGenusOne_smooth`: On a smooth elliptic curve a positive finite divisor contracts nothing.
- **computation**, `TauCeti.ModularCurves.contractGenusOne_three_to_one`: For a split three-gon and D={identity}, only the identity component survives and the target is a one-gon.
- **compatibility**, `TauCeti.ModularCurves.contractGenusOne_ample`: If D meets every component, c_D is the identity up to the specified unique isomorphism.
- **non-example**, `TauCeti.ModularCurves.contractGenusOne_empty`: The empty divisor has degree zero and does not satisfy this construction’s hypotheses.

**Check.**

- Retain the distinction between generic projective-curve contraction and the special generalized-curve structure.
- A smooth point on a discarded component may map to a node.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `SchemeAndStackFoundations:SF.3`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), IV §§1.1–1.6, pp.205–209 — Contraction and the group on the retained smooth locus; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.2, p.7, before Theorem 2.2.2 — The divisor contraction and its functorial properties; [ces](https://arxiv.org/pdf/1511.07475v2), §3.2, pp.21–24 — Contractions through the polygon-count stack.

### The translation structure criterion

**Target** `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion` · theorem.

Let C/S be semistable genus one with section e in Cˢᵐ. If a commutative flat locally finitely presented S-group G acts on C, acts trivially on Pic⁰ of every geometric fibre and transitively on its irreducible components, then C has a unique generalized elliptic structure with identity e for which G acts by translations. An automorphism commuting with G is translation by its value at e PROVIDED it also acts trivially on Pic⁰. Equivalently, an ample finite locally free Cartier divisor D⊂Cˢᵐ with a group law and extending action gives this structure precisely when its action on Pic⁰ is trivial; the fibrewise triviality condition is open and closed on S.

**Hypotheses and carrier boundaries.**

- Both the group-action condition and, for the automorphism conclusion, the automorphism’s Pic⁰ condition are required.
- The divisor version requires D to meet every component.

**Construction or proof.**

1. On geometric fibres, the transitive component action and Pic⁰ condition reduce the action to translations on the standard polygon or smooth genus-one curve.
2. Use the section e to rigidify the possible structure and descend the fibrewise translation laws and extending action.
3. For the automorphism conclusion subtract the translation by α(e). The remaining identity-fixing automorphism acting trivially on Pic⁰ is the identity; this fails for inversion if the Pic⁰ hypothesis is omitted.

**Named declarations and API.**

- `TauCeti.ModularCurves.deligneRapoportStructureCriterion`: the stated theorem with precisely these hypotheses.

**Check.**

- For a smooth elliptic curve and G=1, inversion commutes with G but is not translation in characteristic zero.
- An ample subgroup on the standard polygon recovers its standard group/action.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Sources:** [dr](https://publications.ias.edu/sites/default/files/Number22.pdf), II Proposition 3.2, pp.193–194 — The structure criterion with the necessary automorphism condition; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.2.2 and Corollary 2.2.3, pp.7–8, corrected as E2 — The translation and divisor criteria.

### Finite subgroup quotients of generalized curves

**Target** `ModularCurvesPartII:R13.1/finite-subgroup-quotients` · construction. **Planet:** Finite polygon quotients.

For a finite locally free subgroup K⊂Eˢᵐ, construct the quotient E/K as a generalized elliptic curve with a finite surjective universally open homomorphism E→E/K whose smooth-locus restriction is the finite locally free group quotient by K. Its kernel is K and its formation commutes with arbitrary base change. If a geometric fibre of E is an m-gon, the quotient has m/h components, where h is the order of the image of K in its constant component group. On a split m-gon, quotient by μ_d in the identity component sends u↦u^d on every component and retains m components. The TOTAL curve map need not be flat at nodes.

**Hypotheses and carrier boundaries.**

- K is contained in the smooth locus and is finite locally free, including nonétale K.
- The target is S-flat; this does not say that the finite quotient morphism between complete curves is flat.

**Construction or proof.**

1. Work fppf locally with the split polygon and separate K∩G_m from its component image. Take diagonalizable invariants for the former and the free component quotient for the latter.
2. Check the invariant rings at the nodes and show compatibility with base change. Descend the resulting proper curve and its smooth group/action.
3. Recover the kernel and universal property on the smooth locus; equivariance and density give uniqueness on the complete curve.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.generalizedEllipticQuotient` | constructor | E/K with its quotient homomorphism. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_kernel` | characterisation | The smooth group kernel is K. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_universal` | universal-property | Factorization of homomorphisms killing K. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_baseChange` | functoriality | Formation commutes with arbitrary base change. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_components` | characterisation | The quotient component count is m/h. |

**Uses.**

- `ModularCurvesPartII:R13.2/contraction-maps-between-levels`: Provides the isogeny quotient needed alongside contraction.
- `ModularCurvesPartII:R13.3`: Supplies a quotient interface without making a Tate chart a prerequisite.

**Unit tests.**

- **degenerate**, `TauCeti.ModularCurves.generalizedEllipticQuotient_trivial`: Quotient by the identity subgroup is E.
- **computation**, `TauCeti.ModularCurves.generalizedEllipticQuotient_multiplicative`: C_m/μ_d retains m components and maps u to u^d.
- **computation**, `TauCeti.ModularCurves.generalizedEllipticQuotient_components`: Quotient C₆ by the constant subgroup of order three in its component group has two components.
- **non-example**, `TauCeti.ModularCurves.generalizedEllipticQuotient_nodeFlatness`: For d>1, u↦u^d on a one-gon is not flat at the node; its nodal fibre length differs from the generic degree d.

**Check.**

- Separate target flatness from flatness of the finite quotient morphism.
- The construction imports the ordinary elliptic quotient rather than replanning it.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`, `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [ces](https://arxiv.org/pdf/1511.07475v2), Theorem 2.2.4, Corollary 2.2.7 and Definition 2.2.8, pp.10–14 — General finite subgroup quotients and their base-change interface.

### Drinfeld structures on the smooth locus

**Target** `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity` · definition. **Planet:** Boundary Drinfeld structures.

A Drinfeld A-structure on Eˢᵐ is a homomorphism α:A→Eˢᵐ(S) for which D_α=∑_{a∈A}[α(a)] is a finite locally free subgroup and a relative effective Cartier divisor of rank #A. It is ample when D_α meets every geometric component. A cyclic subgroup of order N is a finite locally free subgroup locally admitting a Drinfeld Z/N-generator; its generator scheme is finite locally free of rank φ(N). For d|N its standard order-d subgroup and cyclic quotients are generator-independent and compatible with base change. These extend the existing MC3C/8B carriers to Eˢᵐ; they are not new definitions of general Drinfeld full sets.

**Hypotheses and carrier boundaries.**

- Repeated sections and nonétale subgroup divisors are allowed. “Basis” is not an assertion of injectivity on geometric points.
- For a full (Z/N)² structure require D_α=Eˢᵐ[N]; the torsion has rank N² only when N divides the polygon count.

**Construction or proof.**

1. Apply the imported full-set/divisor definition on the smooth relative curve and use the polygon torsion calculation on degenerate fibres.
2. Use torsion congruences and the extension node below to transfer the generator-scheme and cyclicity results from the ordinary elliptic locus.
3. Check standard subgroup and quotient identities by generator changes; descend using their generator independence.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.GeneralizedDrinfeldStructure` | structure | α together with the subgroup-divisor equality. |
| `TauCeti.ModularCurves.GeneralizedDrinfeldStructure.ample` | relation | The divisor meets every geometric component. |
| `TauCeti.ModularCurves.GeneralizedCyclicSubgroup.generators` | constructor | The Drinfeld-generator scheme G×. |
| `TauCeti.ModularCurves.GeneralizedCyclicSubgroup.standardSubgroup` | constructor | The canonical subgroup of each divisor order. |
| `TauCeti.ModularCurves.GeneralizedCyclicSubgroup.generators_rank` | characterisation | G× has finite locally free rank φ(N). |
| `TauCeti.ModularCurves.GeneralizedDrinfeldStructure.smoothComparison` | compatibility | On elliptic families it is exactly the imported level structure. |

**Uses.**

- `ModularCurvesPartII:R13.2/gamma-level-structures`: Defines full, Γ₁ and cyclic boundary levels.
- `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`: Provides the finite flat lifting and generator results.

**Unit tests.**

- **computation**, `TauCeti.ModularCurves.generalizedDrinfeldStructure_mu`: The generator scheme of μ_N is cut out by Φ_N and has rank φ(N).
- **degenerate**, `TauCeti.ModularCurves.generalizedDrinfeldStructure_p`: In characteristic p, repeated zero sections may be a valid full set for an infinitesimal p-subgroup.
- **non-example**, `TauCeti.ModularCurves.generalizedCyclicSubgroup_two`: For an elliptic curve in characteristic different from two, E[2] is not cyclic of order four.
- **compatibility**, `TauCeti.ModularCurves.generalizedCyclicSubgroup_ordinary`: In characteristic p, μ_p×Z/p may be cyclic in the Drinfeld sense; geometric-point injectivity is not the criterion.

**Check.**

- The generator locus is a scheme, including its nonreduced fibres.
- A cyclic subgroup’s standard subgroups are independent of a choice of generator.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`, `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`, `tauceti:TauCetiRoadmap/ModularCurves#8b-generator-schemes-and-the-cyclicity-theorem`, `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.3 and Theorem 2.4.5, pp.9–16, using E14’s replacement proof — Ample Drinfeld structures on generalized curves; [ces](https://arxiv.org/pdf/1511.07475v2), §4.2, pp.29–35 — Torsion congruences and full-set/cyclicity extension.

### Torsion congruences and level extension

**Target** `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension` · theorem.

The ordinary elliptic Drinfeld full-set and cyclicity results extend to generalized elliptic curves with torsion of the required rank. Locally on the base near an m-gon, when N|m the N-torsion agrees to every specified finite infinitesimal order with that of a suitable elliptic deformation; divisor/full-set identities, generator schemes, standard subgroups and their finite-flat ranks therefore extend across degeneration. In particular full Nm-structures reduce to full N-structures with finite locally free lifting rank |GL₂(Z/Nm)|/|GL₂(Z/N)|, full N-structures forget to ample Γ₁(N)-structures with rank Nφ(N), and cyclic order-N subgroups have finite locally free generator schemes of rank φ(N). When polygon counts differ, use the contraction/decontraction interface rather than an unproved smoothing of a prime-to-characteristic polygon.

**Hypotheses and carrier boundaries.**

- N,m≥1. Reduction of levels on a family includes the necessary contraction; an uncontracted N-frame need not be ample.
- Rank statements are statements about the relative level functors after the indicated contraction, not merely counts on geometric points.

**Construction or proof.**

1. Prove the torsion congruence using the local node deformation and smooth group; it concerns finite torsion and does not need a full Tate uniformization.
2. Apply the ordinary full-set theorems at each finite infinitesimal order, including nilpotent base rings. Use the infinitesimal finite-presentation criterion to descend the closed divisor identities and flatness.
3. Use standard subgroup and quotient identities, then contraction, to pass among polygon counts. Česnavičius’s proof removes the prime-to-characteristic restriction left in the older deformation argument.

**Named declarations and API.**

- `TauCeti.ModularCurves.torsionCongruencesAndLevelExtension`: the stated theorem with precisely these hypotheses.

**Check.**

- The mixed-characteristic case with p dividing the polygon count is included.
- At N=3, forgetting one vector of a full frame has rank 3φ(3)=6.
- At prime p, full lifting from level one has rank |GL₂(F_p)|=(p²−1)(p²−p).

**Direct prerequisites:** `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`, `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`, `ModularCurvesPartII:R13.1/formal-polygon-algebraization`, `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`, `tauceti:TauCetiRoadmap/ModularCurves#8b-generator-schemes-and-the-cyclicity-theorem`, `tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

**Sources:** [ces](https://arxiv.org/pdf/1511.07475v2), Theorem 4.2.1, Propositions 4.2.5/4.2.9/4.2.11/4.2.12, pp.29–35 — Torsion congruences and extension of ordinary Drinfeld results; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.4.5, pp.15–16, corrected proof as E14 — The finite flat level-forgetting targets.

### Algebraization of formal polygon families

**Target** `ModularCurvesPartII:R13.1/formal-polygon-algebraization` · theorem. **Planet:** Formal polygon algebraization.

Let A be Noetherian and complete for an ideal I of definition, and let E_r/A/I^(r+1) be a compatible system of generalized elliptic curves whose degenerate geometric fibres all have a fixed number m of components. There is a unique generalized elliptic curve E/A inducing this system, up to the uniquely compatible isomorphism. The construction and the equivalence on objects and isomorphisms use algebraization of proper curves and finite ample torsion data; they do not apply proper GAGA to the nonproper smooth group Eˢᵐ.

**Hypotheses and carrier boundaries.**

- m≥1 is fixed. The underlying proper formal curve and the compatible smooth-locus identities/actions are part of the system.
- This target concerns compatible objects and isomorphisms; it does not assert an unrestricted algebraization theorem for every nonproper group morphism.

**Construction or proof.**

1. The m-torsion on each m-gon is finite of rank m² and gives an ample divisor. Algebraize the proper curve with this ample marking by the imported formal-existence theorem.
2. Algebraize the finite torsion divisor, group law and its action using the proper marked-curve/finite-group data. Apply the translation structure criterion to recover the generalized elliptic structure.
3. Use the uniqueness part of proper formal algebraization and the rigidified action criterion to identify every E_r and all compatible isomorphisms.

**Named declarations and API.**

- `TauCeti.ModularCurves.formalPolygonAlgebraization`: the stated theorem with precisely these hypotheses.

**Check.**

- The case m=1 is included.
- The proof algebraizes proper data before defining the smooth group.
- Full Tate charts and Tate uniformization remain R13.3 targets.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`, `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`, `AdicSpacesPartII:F0`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `ModularCurvesPartII:R13.1/generalized-elliptic-curve`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Corollary 2.2.4, pp.8–9 — Formal algebraization through an ample torsion divisor; [ces](https://arxiv.org/pdf/1511.07475v2), Theorem 3.4.1 and proof, pp.26–27 — The generalized-curve formal algebraization statement.

### Polygon-count stacks and decontractions

**Target** `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions` · construction. **Planet:** Polygon-count stacks.

For m≥1 define Ell_m over Z to classify generalized elliptic curves whose degenerate fibres are m-gons. This is a proper smooth Artin stack of relative dimension one with finite diagonal. Its boundary is a reduced effective Cartier divisor, with standard-polygon inertia μ_m×Z/2, and its largest Deligne–Mumford open removes the boundary fibres at primes dividing m. For n,m≥1 contraction with respect to Eˢᵐ[n] defines Ell_nm→Ell_n, a proper flat finitely presented surjection with relative boundary inertia μ_m; it need not be representable. For E/S in Ell_n, its m-fold decontraction stack is the 2-fibre product S×_Ell_n Ell_nm, carrying the universal curve and contraction isomorphism. It commutes with arbitrary base change.

**Hypotheses and carrier boundaries.**

- On an nm-gon the n-torsion meets n components, so the contraction has n-gon target.
- The elliptic open is shared by all Ell_m. The largest DM open concerns the polygon stack, not the refined level stack.

**Construction or proof.**

1. Use an ample finite subgroup marking and the imported marked-curve Hilbert atlas. Its frame cover is a GL_r torsor, not a projective-space bundle. The structure criterion cuts out the generalized-curve data.
2. Use the nodal deformation parameter and finite polygon automorphism scheme to prove smoothness, boundary Cartier structure and the valuative properness statement.
3. Construct the contraction tower from the divisor contraction. Compute its kernel μ_m on a split polygon; prove properness/flatness locally and descend. The universal 2-fibre product gives decontractions and all their compatibilities.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.polygonCountStack` | constructor | Ell_m and its universal generalized elliptic curve. |
| `TauCeti.ModularCurves.polygonCountStack_boundary` | projection | The reduced Cartier boundary and standard-gon chart. |
| `TauCeti.ModularCurves.polygonCountStack_contraction` | functoriality | Ell_nm→Ell_n with the displayed properties. |
| `TauCeti.ModularCurves.polygonDecontractionStack` | constructor | The 2-fibre product of a curve with the contraction tower. |
| `TauCeti.ModularCurves.polygonDecontractionStack_universal` | universal-property | Objects are decontractions equipped with the specified contraction isomorphism. |
| `TauCeti.ModularCurves.polygonDecontractionStack_baseChange` | compatibility | Exact 2-fibre-product base-change compatibility. |

**Uses.**

- `ModularCurvesPartII:R13.2/coherent-cyclic-decontractions`: Provides the stack on which cyclic data descend.
- `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`: Supplies smooth polygon charts and contractions.

**Unit tests.**

- **computation**, `TauCeti.ModularCurves.polygonCountStack_one`: Ell₁ is DM over Z, with one-gon inertia Z/2.
- **non-example**, `TauCeti.ModularCurves.polygonCountStack_badPrime`: Ell_p has nonétale μ_p boundary inertia in characteristic p and is not DM there.
- **degenerate**, `TauCeti.ModularCurves.polygonDecontractionStack_identity`: For m=1 the decontraction is the identity 2-fibre product.
- **compatibility**, `TauCeti.ModularCurves.polygonCountStack_relativeInertia`: Ell₆→Ell₃ has boundary kernel μ₂, so it is not representable even over C.

**Check.**

- The generic curve-stack construction is imported; this node owns only the polygon-count specialization and tower.
- A proper flat stack morphism is not automatically representable or finite.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`, `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change`, `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`, `ModularCurvesPartII:R13.1/formal-polygon-algebraization`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `SchemeAndStackFoundations:SF.4`.

**Sources:** [ces](https://arxiv.org/pdf/1511.07475v2), Theorem 3.1.6, Corollary 3.1.7 and Theorem 3.2.4, pp.18–24 — The polygon-count stack, boundary and contraction tower; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §3.1, pp.18–22, corrected atlas wording as E4 — The proper stack construction.

## R13.2. Compactified level moduli

Construct the all-pairings, fixed-pairing and point compactifications and the exact cyclic moduli problem. At general level the naive ample cyclic subgroup stack and the refined normalization differ. Coherent cyclic data on labelled decontractions remove the relative scaling inertia. Regularity, properness, flatness, precise fine/DM ranges and ordinary agreement are stated separately from coarse-space construction.

### Integral full, point and cyclic level structures

**Target** `ModularCurvesPartII:R13.2/gamma-level-structures` · definition. **Planet:** Integral level structures.

On a generalized elliptic curve define: full Γ(N) level as an ample Drinfeld (Z/N)²-structure with divisor Eˢᵐ[N]; Γ₁(N) level as an ample Drinfeld Z/N-generator P; and naive Γ₀(N) level as an ample cyclic subgroup G⊂Eˢᵐ of order N. Full level forces an N-gon at degeneration. The point and naive cyclic levels permit exactly polygon counts dividing N. For arbitrary N,n≥1, a mixed Γ₁(N;n) structure is a cyclic order-N subgroup G with generator P and a cyclic order-n subgroup H, with [G_d+H_d]=Eˢᵐ[d] for d=gcd(N,n), and with [G+H] an ample Cartier subgroup divisor of rank Nn. The condition is on subgroup divisors, including nilpotents. Full fixed pairing is the determinant fibre described separately below.

**Hypotheses and carrier boundaries.**

- The mixed condition is allowed for all N,n, using the Česnavičius definition; the older Conrad restricted admissible pairs are only a comparison subcase.
- Ampleness is essential on generalized curves. No geometric-point order test replaces the Drinfeld divisor condition.

**Construction or proof.**

1. Use the generalized Drinfeld and cyclic-subgroup carriers. Apply the polygon torsion rank formula and ampleness to obtain the allowed component counts.
2. Form standard d-subgroups, impose their full d-torsion span and define the sum divisor locally from generators; use generator independence to descend.
3. On the elliptic open recover precisely the existing MC3C/8D full, point and cyclic levels.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.GeneralizedFullLevel` | structure | An ample full Drinfeld frame with the N-torsion divisor equality. |
| `TauCeti.ModularCurves.GeneralizedPointLevel` | structure | An ample Drinfeld generator of order N. |
| `TauCeti.ModularCurves.GeneralizedNaiveCyclicLevel` | structure | An ample cyclic order-N subgroup. |
| `TauCeti.ModularCurves.GeneralizedMixedLevel` | structure | P,G,H with the d-torsion span and ample sum divisor. |
| `TauCeti.ModularCurves.generalizedLevel_smoothComparison` | compatibility | The elliptic open is the imported ordinary level functor. |
| `TauCeti.ModularCurves.generalizedFullLevel_polygonCount` | characterisation | A degenerate full-level object has exactly N components. |

**Uses.**

- `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`: Defines the integral moduli groupoids.
- `ModularCurvesPartII:R13.2/coherent-cyclic-decontractions`: Supplies the naive data to refine.

**Unit tests.**

- **degenerate**, `TauCeti.ModularCurves.generalizedFullLevel_one`: At N=1 the full compactification has one-gon degeneration and no rigidifying level.
- **computation**, `TauCeti.ModularCurves.generalizedPointLevel_twoGon`: On C₂ over C, P=(1,1) gives an ample point of order two.
- **non-example**, `TauCeti.ModularCurves.generalizedCyclicLevel_ampleness`: μ_N in the identity component of C₂ is not ample, so it is not a naive Γ₀(N) boundary level.
- **compatibility**, `TauCeti.ModularCurves.generalizedMixedLevel_square`: For N=n=p², a full p²-torsion decomposition satisfies the mixed definition; it is not excluded by n being nonsquarefree.

**Check.**

- The three naive levels are kept separate from the refined Γ₀ model.
- Every allowed component count follows from torsion rank and ampleness.

**Direct prerequisites:** `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`, `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`, `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`, `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`, `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.4, pp.12–16; §3.2, pp.23–26 — The full, point and cyclic levels in the author’s admissible mixed range; [ces](https://arxiv.org/pdf/1511.07475v2), Definitions 4.3.1, 4.4.1 and 4.6.1, pp.35–46 — The unrestricted mixed definition and the compactified level conditions.

### Proper flat integral level stacks

**Target** `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin` · theorem. **Planet:** Proper integral level stacks.

The stacks Xfull(N), X₁(N), X₁(N;n) and X₀(N)^naive of the preceding levels are proper flat finitely presented Artin stacks over Z of relative dimension one, with finite diagonal, and are regular and Cohen–Macaulay. They are smooth after inverting their levels. Xfull(N) and X₁(N) are Deligne–Mumford over all of Z. The naive cyclic stack is DM over Z precisely when N is squarefree; for general N its largest DM open removes the boundary objects with nonétale relative polygon inertia. The mixed stack’s DM range is given by the separate small-level node; it is not characterized by n being squarefree.

**Hypotheses and carrier boundaries.**

- N,n≥1; no blanket fine-scheme assertion is part of this theorem.
- “Regular” refers to regular smooth atlases; Cohen–Macaulay and relative dimension are stack properties.
- The flat/proper conclusions include bad characteristics and nonreduced bases.

**Construction or proof.**

1. Construct the moduli via polygon-count stacks, the ordinary Drinfeld level functors and finite-presentation descent. Use finite-flat full-level covers and the contraction tower.
2. On the ordinary open apply MC7B’s Katz–Mazur deformation/local-ring contracts. On the boundary use the smooth Ell_m chart and the full-set lifting theorem; faithful flat covers transfer regularity to the other level problems.
3. Apply valuative extension and the generalized-curve contraction interface for properness; establish flatness and relative dimension on these same charts. Compute boundary inertia to identify the DM loci.

**Named declarations and API.**

- `TauCeti.ModularCurves.moduliStacksAreProperFlatArtin`: the stated theorem with precisely these hypotheses.

**Check.**

- Full and point stacks remain DM at bad primes, though they may have geometric automorphisms.
- The naive cyclic model at N=p² is Artin rather than DM at its p-gon boundary in characteristic p.
- No R13.3 Tate chart is assumed in constructing these stacks.

**Direct prerequisites:** `ModularCurvesPartII:R13.2/gamma-level-structures`, `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`, `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`, `tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `SchemeAndStackFoundations:SF.4`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorems 3.1.1/3.1.2, pp.18–20; Theorem 3.3.1, pp.27–30 — Properness, flatness and regularity of the compactified problems; [ces](https://arxiv.org/pdf/1511.07475v2), Theorems 4.3.5, 4.4.4 and 4.6.4, pp.38–47; Proposition 4.6.5 — The full/point/mixed stack properties without the older admissibility restriction.

### Coherent cyclic data on decontractions

**Target** `ModularCurvesPartII:R13.2/coherent-cyclic-decontractions` · definition. **Planet:** Coherent cyclic decontractions.

For N≥1 and each m|N put g(m)=gcd(m,N/m) and d(m)=m/g(m). A refined Γ₀(N) object is a generalized elliptic curve E/S, a cyclic order-N subgroup G on its elliptic open U, opens S_(m) covering S whose pairwise intersections for different m are U, and the following data on each S_(m): degenerate fibres are d(m)-gons, and on D_m=S_(m)×_Ell_d(m) Ell_m the universal m-gon decontraction carries an ample cyclic order-N subgroup G_(m) extending G. The subgroups are coherent: for any two decontractions over T, fpqc locally choose generators meeting matched components such that their multiples by N/m have the same image on E_T under the specified contraction identifications. The groupoid transition maps preserve these cyclic subgroups. Morphisms preserve E, the labelled opens, the generic subgroup and this decontraction descent datum.

**Hypotheses and carrier boundaries.**

- The label m is retained even when two distinct m have the same d(m).
- The generators in the coherence condition are local witnesses, not part of the object. Their multiples land on the retained smooth components.
- A decontraction is a stack object with a contraction isomorphism, not a chosen curve over S.

**Construction or proof.**

1. Define the decontraction stack by the preceding 2-fibre product and pull back its universal generalized curve.
2. Use the cyclic transport lemma: matched component generators with the stated multiple determine uniquely the cyclic subgroup on another decontraction. Check the cocycle condition by uniqueness.
3. Express coherence on the double groupoid presentation and descend the divisor subgroups. The standard subgroup of order (N/m)d(m) gives the common subgroup on the contracted curve.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.RefinedCyclicLevel` | structure | The curve, elliptic subgroup, labelled opens and coherent decontraction data. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.polygonLabel` | projection | The m label with d(m)-gon degeneration. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.decontractionSubgroup` | projection | The ample subgroup on the universal m-decontraction. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.coherence` | relation | Matched generators have equal N/m multiples on the contracted curve. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.transport` | characterisation | Unique coherent cyclic transport among decontractions. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.baseChange` | functoriality | Pullback of the groupoid descent datum and its coherence. |

**Uses.**

- `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli`: Constructs the normalized integral stack.
- `ModularCurvesPartII:R13.4a`: Supplies the exact stack whose coarse curve is constructed there.

**Unit tests.**

- **computation**, `TauCeti.ModularCurves.refinedCyclicLevel_squarefree`: If N is squarefree then g(m)=1 and d(m)=m for every divisor m.
- **computation**, `TauCeti.ModularCurves.refinedCyclicLevel_four`: For N=4, the labels m=1 and m=2 both have d=1 but are distinct labelled boundary loci.
- **degenerate**, `TauCeti.ModularCurves.refinedCyclicLevel_elliptic`: On U all decontraction stacks identify with U and the datum is just the cyclic subgroup G.
- **non-example**, `TauCeti.ModularCurves.refinedCyclicLevel_missingLabel`: A one-gon and a generic order-four subgroup without the m label and coherent decontraction data do not determine a refined Γ₀(4) object.

**Check.**

- At N=4, m=2 gives g=2 and d=1; the boundary curve is a one-gon with data on its two-gon decontractions.
- The full double-overlap coherence equation, not merely a generic subgroup, is retained.

**Direct prerequisites:** `ModularCurvesPartII:R13.2/gamma-level-structures`, `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`, `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`, `SchemeAndStackFoundations:SF.4`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Sources:** [ces](https://arxiv.org/pdf/1511.07475v2), Definitions 5.3/5.4, §§5.5–5.7 and Definition 5.9, pp.51–57 — The labelled decontractions, coherent subgroup transport and refined moduli datum.

### The normalized Γ₀ moduli stack

**Target** `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli` · construction. **Planet:** Normalized cyclic moduli.

Construct X₀(N) as the stack of refined cyclic levels. It is regular, proper flat and Deligne–Mumford over Z, of relative dimension one, with finite diagonal, and is the normalization of X(1)=Ell₁ in Y₀(N) over Z[1/N]. Its forgetful map to X(1) is representable. On the m-labelled chart its map to Ell_d(m) is representable by schemes, quasi-finite separated finitely presented and flat, and is étale after inverting N. The naive-to-refined map contracts an m-gon to a d(m)-gon and equips the result with coherent subgroup data. Its relative inertia is μ_g(m); it is proper flat but need not be representable. The chart square with Ell_m→Ell_d(m) is 2-cartesian. For squarefree N the naive and refined stacks agree; for nonsquarefree N they can differ even over C.

**Hypotheses and carrier boundaries.**

- X₀(N) denotes a stack here; its actual coarse scheme and its base-change limits are R13.4a outputs.
- Generic [−1] remains, so this Γ₀ stack is never claimed to be a fine elliptic-curve scheme.
- The normalization is taken in the generic ordinary moduli cover, not in a projective plane modular-polynomial equation.

**Construction or proof.**

1. Contract each naive m-gon along d(m)-torsion and use coherent transport to define the map. Prove the labelled chart square is 2-cartesian.
2. Use the polygon contraction tower to obtain the proper flat cover. On the contracted chart, coherence removes exactly the μ_g(m) automorphisms; the residual forgetful map is representable and its local charts give regularity and the DM property.
3. Compare the ordinary open with Y₀(N), apply properness and normality, and identify the normalization by the generic finite-cover universal property.

**Named declarations and API.**

| Declaration | Role | Required statement |
| --- | --- | --- |
| `TauCeti.ModularCurves.refinedGammaZeroStack` | constructor | X₀(N) with its universal refined cyclic datum. |
| `TauCeti.ModularCurves.refinedGammaZeroStack_normalization` | universal-property | Normalization of X(1) in the ordinary Γ₀ generic cover. |
| `TauCeti.ModularCurves.naiveToRefinedGammaZero` | functoriality | Contraction and coherent transport with kernel μ_g(m). |
| `TauCeti.ModularCurves.refinedGammaZeroStack_chartSquare` | compatibility | The labelled square with Ell_m→Ell_d(m) is 2-cartesian. |
| `TauCeti.ModularCurves.refinedGammaZeroStack_forget` | projection | The representable forgetful map to X(1). |
| `TauCeti.ModularCurves.refinedGammaZeroStack_squarefree` | equivalence | Agreement with the naive stack when N is squarefree. |

**Uses.**

- `ModularCurvesPartII:R13.4a`: The only Γ₀ stack supplied for its normalized coarse construction.
- `ModularCurvesPartII:R13.2/contraction-maps-between-levels`: Supplies the refined target and the nonrepresentable comparison map.

**Unit tests.**

- **degenerate**, `TauCeti.ModularCurves.refinedGammaZeroStack_one`: At N=1 it is Ell₁ and has generic inversion inertia.
- **compatibility**, `TauCeti.ModularCurves.refinedGammaZeroStack_prime`: For prime p the naive and refined models agree.
- **non-example**, `TauCeti.ModularCurves.refinedGammaZeroStack_four`: For N=4, the naive-to-refined map at an m=2 cusp has kernel μ₂ and is not an isomorphism over C.
- **computation**, `TauCeti.ModularCurves.refinedGammaZeroStack_badPrime`: In characteristic p at a naive p-gon of level p², the nonétale μ_p kernel is removed in the refined DM stack.

**Check.**

- At N=4 the two-gon naive chart contracts to a one-gon and loses μ₂ relative inertia, including over C.
- At N=1 the refined stack is X(1), not a fine scheme.

**Direct prerequisites:** `ModularCurvesPartII:R13.2/coherent-cyclic-decontractions`, `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`, `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`.

**Sources:** [ces](https://arxiv.org/pdf/1511.07475v2), Theorem 5.10, §§5.11–5.12 and Lemma 5.13, pp.57–62 — The refined stack, cartesian charts and proper-flat comparison with the naive model.

### The cyclotomic fixed-pairing compactification

**Target** `ModularCurvesPartII:R13.2/fixed-pairing-integral-components` · theorem. **Planet:** Integral pairing components.

The Weil-pairing determinant on the ordinary full-level locus extends to a map Xfull(N)→Spec Z[ζ_N], using the primitive cyclotomic algebra rather than the possibly nonreduced primitive-root subset of μ_N. Over this base the full-level stack is proper flat Cohen–Macaulay of relative dimension one and smooth near the boundary. Its characteristic-zero ζ fibre is the fixed-pairing curve of MC5B and its geometric fibres are connected. The proof uses generic connectedness from R12.4 and proper Stein factorization. It does not claim that the bad-characteristic fibres are geometrically irreducible or smooth everywhere.

**Hypotheses and carrier boundaries.**

- N≥1; Z[ζ_N] denotes Z[T]/(Φ_N), with the specified structural root.
- The all-pairings stack over Z and a geometric fixed-pairing component are distinct objects.
- At primes dividing N the cyclotomic base can be ramified; roots are not labelled by distinct geometric points there.

**Construction or proof.**

1. Extend the primitive pairing map from the ordinary invertible-level locus by normality of Xfull(N) and the integral closure defining the cyclotomic algebra.
2. Use the full-level boundary charts and the ordinary local-ring supplier to establish flatness over the cyclotomic base, Cohen–Macaulayness and boundary smoothness.
3. Use the geometrically connected generic determinant fibre and proper Stein factorization to obtain geometric connectedness of all fibres.

**Named declarations and API.**

- `TauCeti.ModularCurves.fixedPairingIntegralComponents`: the stated theorem with precisely these hypotheses.

**Check.**

- For N=5, its generic Z-base change to C has four connected pairing components.
- Bad fibres may have several irreducible components despite being connected.
- The extension is an algebraic target and does not use compact analytic uniformization.

**Direct prerequisites:** `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness`, `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `SchemeAndStackFoundations:SF.3`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1(3), pp.31–33, and Theorem 4.2.4, pp.36–37 — Cyclotomic structure and geometric connectedness; [ces](https://arxiv.org/pdf/1511.07475v2), §4.3, pp.35–41 — The full compact stack and its primitive-pairing base.

### Fine loci and bad-level inertia

**Target** `ModularCurvesPartII:R13.2/small-level-and-dm-boundaries` · theorem.

The compact full-level stack over Z is a fine scheme for N≥2 unless N is a prime power p^s or twice a prime power 2p^s; N=1 is an additional nonfine case. In the exceptional bad fibres there can be nontrivial automorphisms preserving a Drinfeld full set. A sufficient fine condition for compact Γ₁(N) over a base is that N have an invertible divisor d≥5 on that base; the open complex fine range N≥4 is not substituted at cusps. On an m-gon with an ample naive cyclic order-N subgroup, the relative scaling inertia is μ_gcd(m,N/m), commuting with inversion. Thus naive Γ₀(N) is DM over Z exactly for squarefree N. For arbitrary mixed Γ₁(N;n), deleting boundary fibres at primes with v_p(n)≥v_p(N)+2 gives a DM open; if v_p(n)≤v_p(N)+1 for every p, the forgetful map to X(1) is representable and the whole stack is DM. This includes N=n=p² and corrects the older “n squarefree” criterion.

**Hypotheses and carrier boundaries.**

- Fine means that the moduli stack is represented by a scheme with its universal object, not just that its coarse scheme exists.
- The full-level criterion is the corrected version of Česnavičius Proposition 4.3.6, adding the omitted N=1 exception.
- The mixed valuation criterion is a sufficient global DM/representability criterion, not an unproved converse for every deleted point.

**Construction or proof.**

1. Use rigidity of full sets on ordinary fibres and the explicit polygon action on boundary labels. At exceptional bad ordinary fibres, inspect inversion on infinitesimal torsion.
2. For point level use an invertible order-d generator to eliminate automorphisms, retaining the compact d≥5 hypothesis.
3. For cyclic and mixed levels compute which ζ^i scalings preserve the divisor data. The cyclic kernel is μ_gcd(m,N/m); the mixed calculation gives the valuation range of Česnavičius.

**Named declarations and API.**

- `TauCeti.ModularCurves.smallLevelAndDmBoundaries`: the stated theorem with precisely these hypotheses.

**Check.**

- Xfull(12) is fine over Z; Xfull(11) need not be fine in characteristic eleven.
- Xfull(1) has inversion inertia and is not a scheme.
- Γ₁(4) is fine on its complex elliptic open but its compact stack has an irregular cusp.
- For N=n=p² the mixed stack is DM although n is not squarefree.

**Direct prerequisites:** `ModularCurvesPartII:R13.2/gamma-level-structures`, `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`, `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli`, `tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures`.

**Sources:** [ces-published](https://msp.org/ant/2017/11-9/ant-v11-n9-p02-p.pdf), Proposition 4.3.6, pp.2052–2053, corrected as E13; Proposition 4.6.5, pp.2063–2064 — The compact fine and unrestricted mixed DM ranges; [ces](https://arxiv.org/pdf/1511.07475v2), §5.2, pp.50–51 — The naive cyclic boundary scaling kernel; [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 3.2.7, pp.25–26, corrected as E5; Theorem 4.2.1, pp.34–35 — The point fine range and the obsolete restricted mixed claim.

### Agreement on the ordinary and tame loci

**Target** `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes` · theorem. **Planet:** Ordinary moduli agreement.

Restricting the integral stacks to the elliptic locus recovers the exact ordinary Katz–Mazur level functors supplied by MC3C/7B/8D and their existing representing schemes where their fine hypotheses hold. After inverting the relevant level, the full and point compactifications agree with the normalizations of X(1) in those ordinary covers; the refined Γ₀ compactification is the corresponding normalization over all of Z. The resulting stack comparisons supply R13.4a, whose coarse construction is compared with the existing prime N≥5, Z[1/N] diamond-quotient model at R12.3.

**Hypotheses and carrier boundaries.**

- Use the exact level functor, structural cyclotomic base, and fine/coarse distinction on each overlap.
- The naive cyclic stack is not substituted for the refined normalization at nonsquarefree N.
- This is an identification of carriers and morphisms; no duplicate Katz–Mazur ordinary representability proof is planned.

**Construction or proof.**

1. Restrict the divisor/full-set conditions to a smooth proper elliptic family, where they are the imported definitions. Uniqueness of representing objects gives the ordinary identification.
2. Use normality, properness and the shared dense ordinary cover to identify the compact stack normalizations.
3. Keep the full cyclotomic base and the point/cyclic level carriers in these identifications. Export the stack agreement to the coarse construction; its comparison to MC Layer 10 is R12.3, not a prerequisite of this construction.

**Named declarations and API.**

- `TauCeti.ModularCurves.agreementWithKatzMazurSchemes`: the stated theorem with precisely these hypotheses.

**Check.**

- The existing prime-level Z[1/N] diamond quotient is reused.
- The all-pairings ordinary full moduli and a fixed-pairing fibre are compared on their respective bases.
- At N=4, naive and refined boundary objects remain distinct.

**Direct prerequisites:** `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli`, `ModularCurvesPartII:R13.2/fixed-pairing-integral-components`, `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`, `tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes`, `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`, `SchemeAndStackFoundations:SF.3`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1, pp.31–33; Theorems 4.2.1 and 4.2.4, pp.34–37 — Agreement of compact stacks with the ordinary moduli and tame fine schemes; [ces](https://arxiv.org/pdf/1511.07475v2), Theorems 4.3.5/4.4.4 and 5.10, pp.38–42 and 57–58 — Identification with the appropriate normalized stacks.

### Compactified level maps and their degrees

**Target** `ModularCurvesPartII:R13.2/contraction-maps-between-levels` · theorem.

Level reduction followed by contraction extends the ordinary maps Xfull(Nm)→Xfull(N), Xfull(N)→X₁(N), and X₁(N)→X₀(N)^naive. These maps are representable finite locally free, with ranks |GL₂(Z/Nm)|/|GL₂(Z/N)|, Nφ(N), and φ(N), respectively. The composite to the refined X₀(N) is obtained through the coherent naive-to-refined map. That comparison and the bare polygon tower are proper flat but may be nonrepresentable, so their degrees are not read as finite-cover ranks. All maps commute with arbitrary base change of the stack data and with the stated level row/diamond actions. After passing to coarse curves, account for generic stabilizers before inferring degrees: for N≥5 in characteristic zero X₁(N)→X₀(N) has coarse degree φ(N)/2. Pairing-changing row actions are maps between the indicated cyclotomic fibres.

**Hypotheses and carrier boundaries.**

- N,m≥1; the full-level ranks are for the all-pairings stacks. A fixed-pairing restriction has its determinant-compatible rank.
- The finite locally free claims apply to the three specified level maps, not to every proper flat contraction of stacks.
- Coarse formation is an R13.4a supplier and need not commute with arbitrary integral base change.

**Construction or proof.**

1. Construct the reduction and use subgroup-divisor contraction to restore ampleness. Apply the generalized full-set lifting and generator-scheme results for the three finite-flat ranks.
2. Use coherence to descend the cyclic datum to the refined model; compare the relative μ_g(m) inertia separately.
3. Check the identities on the ordinary open, then on the universal polygon charts; properness and uniqueness of contractions extend them everywhere. For the asserted characteristic-zero coarse degree, the open analytic comparison computes the effective congruence index φ(N)/2; the finite generic coarse extension has that same degree.

**Named declarations and API.**

- `TauCeti.ModularCurves.contractionMapsBetweenLevels`: the stated theorem with precisely these hypotheses.

**Check.**

- For N=3, full-to-point rank is six.
- For N=11, point-to-cyclic stack rank is ten while its complex coarse degree is five.
- For N=4,m_boundary=2 the naive-to-refined kernel is μ₂ and the map is not a finite locally free representable cover.
- All-pairings full reduction and fixed-pairing reduction have distinct determinant bookkeeping.

**Direct prerequisites:** `ModularCurvesPartII:R13.2/gamma-level-structures`, `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`, `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`, `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli`, `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`, `ModularCurvesPartII:R12.2/open-level-uniformization`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`.

**Sources:** [conrad-generalized-elliptic](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.4.5, pp.15–16; §§4.1–4.2, pp.31–37 — The specified finite-flat forgetful maps; [ces](https://arxiv.org/pdf/1511.07475v2), Proposition 4.2.11, pp.33–34; Lemma 5.13, pp.60–62 — Replacement lifting argument and proper-flat naive-to-refined comparison.

## Exact import contracts and integration gap

The following requests record the precise supplier interfaces. Entries marked “existing upstream interface” are imports from existing Tau Ceti roadmaps, not proposals to redevelop those roadmaps. Accepted cross-roadmap node ids are direct prerequisites in the targets above.

### SchemeAndStackFoundations:SF.2

Integrate PR196 Layers 0–2 as named analytic-space and analytification targets: locally C-ringed holomorphic-ideal models including nonradical ideals/nilpotents; analytic morphisms, open/closed subspaces, gluing and fibre products; finite-type complex scheme analytification and its universal locally ringed-space map, compatible with immersions/products; étale maps give local analytic isomorphisms and smooth schemes complex manifolds. Use the existing PresheafedSpace gluing API and align names with PR196 if it merges.

**Consumers:** `ModularCurvesPartII:R12.1/lattice-weierstrass-model`, `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `ModularCurvesPartII:R12.2/marked-torus-family`, `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.3/compact-modular-uniformization`.

### SchemeAndStackFoundations:SF.3

Proper-curve normalization and unique extension of generic finite curve maps; effective Cartier divisors, finite trace on regular differentials in characteristic zero, proper Stein factorization, and normality/geometric connectedness under field extension. The scheme/coarse carriers remain this supplier’s outputs.

**Consumers:** `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action`, `ModularCurvesPartII:R12.6/gamma-zero-rational-function-field`, `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change`, `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`, `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli`, `ModularCurvesPartII:R13.2/fixed-pairing-integral-components`, `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`, `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension`.

### SchemeAndStackFoundations:SF.4

Algebraic-stack groupoids, 2-fibre products, descent, finite diagonal and Artin/DM criteria from relative inertia; representability of the displayed moduli morphisms. No generalized elliptic structure is supplied here.

**Consumers:** `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`, `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R13.2/coherent-cyclic-decontractions`, `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli`.

### AlgebraicModuliForArithmeticGeometry:R09.1

The marked nodal-curve/Hilbert atlas with a GL_r frame torsor and its base-change properties.

**Consumers:** `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`.

### AlgebraicModuliForArithmeticGeometry:R09.2

The generic algebraic stack of proper marked nodal curves, its diagonal and descent/valuative interface, to specialize to genus one with polygon fibres.

**Consumers:** `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`, `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`.

### AlgebraicModuliForArithmeticGeometry:R09.3

Normalization exact sequence, dualizing sheaf and arithmetic-genus formula for reduced nodal curves, including self-nodes and nonreduced bases in families.

**Consumers:** `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change`.

### AlgebraicModuliForArithmeticGeometry:R09.4

Relative Cartier divisors, polarization and coherent cohomology/base change on nodal marked curves, sufficient for section-ring contractions and quotient charts.

**Consumers:** `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`, `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`, `ModularCurvesPartII:R13.1/finite-subgroup-quotients`, `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions`.

### AlgebraicModuliForArithmeticGeometry:R09.5

Generic relative Proj/curve contraction along a fibrewise nonnegative divisor, and its uniqueness/base-change interface; the extending smooth group and polygon-count contraction tower are owned by R13.1.

**Consumers:** `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`.

### AlgebraicModuliForArithmeticGeometry:R09.6

Formal existence/algebraization for proper marked curves and finite ample divisor/group-action data over an adic complete Noetherian base.

**Consumers:** `ModularCurvesPartII:R13.1/formal-polygon-algebraization`.

### AdicSpacesPartII:F0

Formal schemes and proper formal GAGA/algebraization over a complete Noetherian adic ring. Never apply it directly to the nonproper Eˢᵐ.

**Consumers:** `ModularCurvesPartII:R13.1/formal-polygon-algebraization`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1

The general finite locally free group/subgroup divisor and infinitesimal lifting interfaces used by Drinfeld torsion congruences; no duplicate general full-set theory is requested.

**Consumers:** `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`.

### AbelianSchemesAndArithmeticModuli:A5

Relative rank-one complex torus/abelian-scheme period comparison: integral homology marking, holomorphically varying periods, proper smooth torus families, and base change. It must supply a local inverse period map, beyond point classification.

**Consumers:** `ModularCurvesPartII:R12.2/marked-torus-family`, `ModularCurvesPartII:R12.2/open-level-uniformization`.

### ModularCurvesPartII:R13.3

Formal algebraic Tate boundary charts with the imported integral Weierstrass equation, group/isogeny structure and du/u differential; identify the finite-level boundary charts and their coarse invariants. The Tate construction uses R13.1/R13.2, and R12.3 only compares these supplied charts.

**Consumers:** `ModularCurvesPartII:R12.3/compact-modular-uniformization`, `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement`, `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`, `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`.

### ModularCurvesPartII:R13.4a

Construct the actual normalized proper coarse modular curves, including full/fixed and refined Γ₀ models, finite boundary algebras/cusp labels, and the integral cyclic modular polynomial monic of degree ψ(N). Supply characteristic-zero smooth fibres and rational Γ₀ source/target j maps. This precedes R12.3, never uses its comparison as existence proof.

**Consumers:** `ModularCurvesPartII:R12.3/compact-modular-uniformization`, `ModularCurvesPartII:R12.3/cusp-ramification-and-level-maps`, `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`, `ModularCurvesPartII:R12.5/weight-two-regular-differentials`, `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action`, `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`, `ModularCurvesPartII:R12.6/gamma-zero-rational-function-field`, `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent`, `ModularCurvesPartII:R12.6/generic-base-change-and-level-compatibility`.

### ComplexComparisonPartII:C2

Proper coherent comparison and flat field base change for O and Ω¹ on proper curves and for line powers; H⁰ and genus compatibility with analytification, including the differential/trace and family section-space interfaces.

**Consumers:** `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `ModularCurvesPartII:R12.5/hodge-line-automorphy`, `ModularCurvesPartII:R12.5/weight-two-regular-differentials`, `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`, `ModularCurvesPartII:R12.6/generic-base-change-and-level-compatibility`.

### tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality

Use the existing finite locally free group-scheme, Cartier duality and subgroup carrier; polygon torsion/quotients specialize it.

**Consumers:** `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`, `ModularCurvesPartII:R13.1/finite-subgroup-quotients`, `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`.

### tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out

Use the existing effective finite Galois descent and flat scalar-extension interface; supply invariance of geometric connectedness under Q̄→C for the finite-type smooth curve in MC5C’s contract.

**Consumers:** `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness`, `ModularCurvesPartII:R12.4/twisted-analytic-comparison`, `ModularCurvesPartII:R12.4/twisted-geometric-irreducibility`, `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing`, `ModularCurvesPartII:R12.5/perfect-hecke-pairing`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`, `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent`, `ModularCurvesPartII:R12.6/complex-conjugation-comparison`, `ModularCurvesPartII:R12.6/generic-base-change-and-level-compatibility`, `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change`, `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`, `ModularCurvesPartII:R13.1/finite-subgroup-quotients`, `ModularCurvesPartII:R13.1/formal-polygon-algebraization`, `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R13.2/coherent-cyclic-decontractions`, `ModularCurvesPartII:R13.2/fixed-pairing-integral-components`, `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension`.

### tauceti:TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models

Use the existing smooth projective Weierstrass curve with identity and projective-point dictionary.

**Consumers:** `ModularCurvesPartII:R12.1/lattice-weierstrass-model`, `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`.

### tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes

Use the invariant-differential line, dx/(2y+a₁x+a₃), coordinate-change multiplier and Weierstrass differential identities.

**Consumers:** `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `ModularCurvesPartII:R12.1/homothety-and-isogeny-compatibility`, `ModularCurvesPartII:R12.1/invariant-differentials-and-periods`, `ModularCurvesPartII:R12.5/hodge-line-automorphy`.

### tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law

Use the algebraic pointed elliptic group scheme and its translation-invariant differential; ordinary group laws are not reconstructed here.

**Consumers:** `ModularCurvesPartII:R12.1/lattice-weierstrass-model`, `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`.

### tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients

Use algebraic isogenies, finite subgroup quotients and their dual/kernel/degree/base-change API.

**Consumers:** `ModularCurvesPartII:R12.1/homothety-and-isogeny-compatibility`, `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action`, `ModularCurvesPartII:R13.1/finite-subgroup-quotients`.

### tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing

Use the Silverman-convention scheme Weil pairing, nondegeneracy, functoriality and determinant identity; its current library implementation is already available.

**Consumers:** `ModularCurvesPartII:R12.1/analytic-algebraic-weil-pairing`, `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`, `ModularCurvesPartII:R13.2/fixed-pairing-integral-components`.

### tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures

Use the ordinary elliptic Drinfeld full, point and cyclic level definitions/full-set theorems.

**Consumers:** `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`, `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`, `ModularCurvesPartII:R13.2/gamma-level-structures`, `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`.

### tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures

Use prime-to-characteristic agreement with naive torsion labels and exact full/point level rigidity ranges.

**Consumers:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.2/stabilizers-and-small-levels`, `ModularCurvesPartII:R13.2/small-level-and-dm-boundaries`.

### tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4

Use fine open Y₁(N) over Z[1/N] for N≥4 and its moduli/universal-object interface.

**Consumers:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.2/stabilizers-and-small-levels`.

### tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing

Use the ordinary full ordered-basis moduli, cyclotomic determinant fibre and fine fixed-pairing scheme for N≥3; do not assume connectedness before R12.4.

**Consumers:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.2/stabilizers-and-small-levels`, `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness`, `ModularCurvesPartII:R12.4/twisted-analytic-comparison`, `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent`, `ModularCurvesPartII:R13.2/fixed-pairing-integral-components`, `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension`.

### tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ

Use the paired finite-module symplectic-frame twist Y(ρ), its smooth finite-type quotient/descent, and its conditional geometric-irreducibility theorem. Its three missing comparison contracts are discharged separately in R12.4.

**Consumers:** `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness`, `ModularCurvesPartII:R12.4/twisted-analytic-comparison`, `ModularCurvesPartII:R12.4/twisted-geometric-irreducibility`, `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`, `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent`, `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension`.

### tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes

Use the existing Katz–Mazur ordinary local/deformation-ring and regularity statements at bad primes, with their stated hypotheses; the private Chapter 5 input has this owner.

**Consumers:** `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`, `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`.

### tauceti:TauCetiRoadmap/ModularCurves#8b-generator-schemes-and-the-cyclicity-theorem

Use generator schemes, finite locally free rank φ(N), cyclicity and standard subgroup/quotient identities on ordinary elliptic curves.

**Consumers:** `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`, `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`.

### tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n

Use the ordinary cyclicity locus and Y₀(N) level functor; boundary extension is R13.1/R13.2.

**Consumers:** `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action`, `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`, `ModularCurvesPartII:R13.2/gamma-level-structures`, `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli`, `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`.

### tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems

Use row action (P,Q)γ=(aP+cQ,bP+dQ) and exact full-to-point-to-cyclic quotient identifications; upper triangular labels act on P by a=d⁻¹.

**Consumers:** `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison`, `ModularCurvesPartII:R13.2/contraction-maps-between-levels`.

### tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients

Use finite group quotients and coarse moduli universal properties, preserving stack inertia versus coarse objects.

**Consumers:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.2/stabilizers-and-small-levels`, `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action`, `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`.

### tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n

Use the ordinary coarse j-line/Y₀(N) schemes and their source/quotient-invariant maps.

**Consumers:** `ModularCurvesPartII:R12.2/open-level-uniformization`.

### tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering

Use only the existing prime N≥5, Z[1/N] compact diamond-quotient coarse curve, its cusp/covering interface and its stated base; no composite/bad-level extension is inferred.

**Consumers:** `ModularCurvesPartII:R12.3/compact-modular-uniformization`.

### tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra

Use the native analytic full Hecke algebra/slash operators, commutativity, span/product relations and composite coefficient theorem including bad-prime blocks; retain the anchor’s normalization and character conventions.

**Consumers:** `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action`, `ModularCurvesPartII:R12.5/hecke-normalization-comparison`, `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing`, `ModularCurvesPartII:R12.5/perfect-hecke-pairing`.

### tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve

Use the analytic congruence quotient and compactification, effective cusp widths, local finite stabilizer charts, branched maps and orbit/genus input.

**Consumers:** `ModularCurvesPartII:R12.2/open-level-uniformization`, `ModularCurvesPartII:R12.2/stabilizers-and-small-levels`, `ModularCurvesPartII:R12.2/projective-prime-level-application`, `ModularCurvesPartII:R12.3/compact-modular-uniformization`, `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement`, `ModularCurvesPartII:R12.3/cusp-ramification-and-level-maps`, `ModularCurvesPartII:R13.2/contraction-maps-between-levels`.

### tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology

Use compact Riemann-surface integral homology, bilinear period relation/positivity, canonical cohomology and the genus computation; no new genus formula is planned.

**Consumers:** `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization`, `ModularCurvesPartII:R12.1/invariant-differentials-and-periods`, `ModularCurvesPartII:R12.2/projective-prime-level-application`, `ModularCurvesPartII:R12.5/weight-two-regular-differentials`.

### tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas

Use modular/cusp-form spaces as equivariant automorphy-line sections and the weight-two canonical differential dictionary, including finite stabilizer invariance.

**Consumers:** `ModularCurvesPartII:R12.5/hodge-line-automorphy`, `ModularCurvesPartII:R12.5/weight-two-regular-differentials`.

### RT-AREA-algebraicgeometry/3: analytic carrier ownership

RT-AREA-algebraicgeometry/3 is addressed by an exact SF.2 integration request and direct prerequisites, with the stage/PR196 edits proposed below. Neither pinned library provides the nilpotent analytic-space carrier. C0’s repaired comparison node still presupposes PR196 Layers 0–2, and current SF.2 has no explicit analytic targets. Implementation closure therefore requires the requested integration; this packet does not declare the absent carrier built.

Use the finding’s SF.2 integration option: own analytic spaces locally modelled on holomorphic ideals, retaining nilpotents; their morphisms, gluing and fibre products; and finite-type complex scheme analytification with its étale/smooth compatibility. This packet directly encodes SF.2 prerequisites and states the exact requested outputs. The manager/supplier updates must add SF.2 edges to C0, ShimuraVarieties:V2, ShimuraCompactifications:C2, PELModuli:M3 and R12.3, and list those five consumers on the PR196 external record with its stage dependency encoded. The proposal preserves the actual PR merge state and requires no change to the accepted modular comparison direction. Cross-file edits are outside this job’s four deliverables.

## Routed source coverage

### PAPER-BAKKER-TSIMERMAN-16

- **This part:** Projective-frame scalar quotient versus strict full level/rigidification, effective orbifold and component counts (R12.2).
- **This part:** Cusp inertia/ramification and fields (R12.3).
- **This part:** Pairing-component connectedness and paired twists (R12.4).
- **This part:** Polygon automorphisms/torsion and coherent boundary moduli (R13.1/R13.2).
- **This part:** Characteristic-zero cyclic/full-subgroup correspondence distinction and conjugation/descent (R12.5/R12.6).
- **Supplier or other part:** Full Tate uniformization and boundary Hecke integral charts: R13.3.
- **Supplier or other part:** Integral coarse/cyclic modular-polynomial construction: R13.4a; cycle-degree arithmetic export: R13.4b.
- **Supplier or other part:** Integral correspondences and Atkin–Lehner/Jacobian targets: R14.1/R14.2.

### PAPER-GROSS-ZAGIER-86

- **This part:** I §1, p.226: Q(X₀(N))=Q(j,j′), j′=j(Nτ), and rational 0/infinity cusps (R12.6/R12.3).
- **This part:** V §1, p.306: the full rational weight-two Hecke image and perfect first-coefficient pairing, with all bad-prime blocks (R12.5).
- **Supplier or other part:** Integral Φ_N: R13.4a.
- **Supplier or other part:** Corrected regular models and singular-fibre locus: R13.5.
- **Supplier or other part:** Atkin–Lehner involutions and integral correspondences: R14.1.
- **Supplier or other part:** Hecke/Jacobian faithfulness: R14.2.

### Other routed papers on issue #773

- **Supplier or other part:** Masser–Zannier: R13.4a/R13.4b.
- **Supplier or other part:** Balakrishnan–Dogra–Müller–Tuitman–Vonk: R13.5 (good reduction at 2 included).
- **Supplier or other part:** Calegari–Geraghty and Calegari–Dimitrov–Tang: R14.4. These stages are outside this part.

## Source findings and version discipline

The following findings use corrected statements in the targets above. They are written in our own words and await independent review; none carries a self-review verdict. Where the publisher did not serve the full text, the finding is expressly against the recorded author copy. An inaccessible errata endpoint is reported as an access failure, not as an inspected correction list.

### ModularCurvesPartII/E1 — error

**Locator:** Author copy, Example 2.1.2, p.5.

**Assertion checked:** The plane cubic used for the split one-gon over Z is y²z=x³−x²z.

**Correction:** Use the split nodal model y²z+xyz=x³, with distinct normalization node preimages in every characteristic.

**Reason:** The asserted model has tangent cone y²+x² and is not split over Z; in characteristic two the tangent cone is a repeated line. The replacement has tangent cone y(y+x).

**Reach:** a stated result. **Existing correction:** new

**Correction search:** Conrad author publication list and Math 248B handout index, opened 2026-10-13; no correction linked for this assertion. Cambridge DOI 10.1017/S1474748006000089 opened 2026-10-13: abstract/access controls only, so the finding is restricted to the author copy.

### ModularCurvesPartII/E2 — error

**Locator:** Author copy, Theorem 2.2.2, pp.7–8, automorphism conclusion.

**Assertion checked:** An automorphism commuting with the given translation action is declared to be a translation without a condition on its Pic⁰ action.

**Correction:** Require that automorphism to act trivially on Pic⁰, as in DR II Proposition 3.2, pp.193–194.

**Reason:** On a smooth elliptic curve, take G=1. Inversion commutes with G and fixes the identity, yet is not a translation in characteristic zero.

**Reach:** a stated result. **Existing correction:** The original DR II Proposition 3.2 supplies the missing condition; the author-copy formulation drops it.

**Correction search:** Conrad author publication list and Math 248B handout index, opened 2026-10-13; no correction linked for this assertion. Cambridge DOI 10.1017/S1474748006000089 opened 2026-10-13: abstract/access controls only, so the finding is restricted to the author copy. DR II Proposition 3.2 read in the public IAS scan on 2026-10-13.

### ModularCurvesPartII/E3 — misprint

**Locator:** Author copy, Theorem 2.4.5, p.16, proof for the generator map.

**Assertion checked:** After choosing Q′ with p^(r−e)Q′=Q, the proof assigns the lifted Z/p^r structure to Q.

**Correction:** Assign that Z/p^r structure to Q′; Q retains the reduced Z/p^e structure.

**Reason:** The immediately preceding lift equation and the subsequent full-basis argument use Q′ at level p^r. Q only generates the smaller subgroup when r>e.

**Reach:** the proof. **Existing correction:** new

**Correction search:** Conrad author publication list and Math 248B handout index, opened 2026-10-13; no correction linked for this assertion. Cambridge DOI 10.1017/S1474748006000089 opened 2026-10-13: abstract/access controls only, so the finding is restricted to the author copy.

### ModularCurvesPartII/E4 — misprint

**Locator:** Author copy, p.21, frame atlas after Theorem 3.1.6.

**Assertion checked:** The bundle of frames in the Hilbert-atlas argument is identified as a projective-space bundle.

**Correction:** It is the frame bundle, a GL_r torsor. Its smooth surjectivity is the property used.

**Reason:** A frame is an ordered basis and has GL_r choices; a projective-space point gives only a line. The atlas argument remains valid with the corrected smooth cover.

**Reach:** the proof. **Existing correction:** new

**Correction search:** Conrad author publication list and Math 248B handout index, opened 2026-10-13; no correction linked for this assertion. Cambridge DOI 10.1017/S1474748006000089 opened 2026-10-13: abstract/access controls only, so the finding is restricted to the author copy.

### ModularCurvesPartII/E5 — error

**Locator:** Author copy, Theorem 3.2.7, pp.25–26.

**Assertion checked:** The mixed Γ₁(N;n) stack is characterized as DM exactly when n is squarefree in the admissible range.

**Correction:** Use the valuation criterion of Česnavičius Proposition 4.6.5(b), published pp.2063–2064: v_p(n)≤v_p(N)+1 gives the global representable/DM range.

**Reason:** For N=n=p² the complementary full torsion data eliminate the μ_p polygon inertia; this mixed stack is DM even though n is nonsquarefree.

**Reach:** a stated result. **Existing correction:** Česnavičius Proposition 4.6.5(b) supplies the corrected unrestricted criterion.

**Correction search:** Conrad author publication list and Math 248B handout index, opened 2026-10-13; no correction linked for this assertion. Cambridge DOI 10.1017/S1474748006000089 opened 2026-10-13: abstract/access controls only, so the finding is restricted to the author copy. Česnavičius published pp.2063–2064 read and collated on 2026-10-13.

### ModularCurvesPartII/E6 — error

**Locator:** Math 248B modularcurves.pdf, Proposition 2.9, p.4.

**Assertion checked:** The relative ℘ function is treated as holomorphic into C on the entire product parameter domain.

**Correction:** Remove the relative lattice for the affine function; the projective Weierstrass map extends over that lattice with value O.

**Reason:** ℘ has a double pole at every lattice point, so it cannot be a holomorphic C-valued function there.

**Reach:** a stated result. **Existing correction:** new

**Correction search:** Conrad Math 248B handout index and author publication page, opened 2026-10-13; no correction to this assertion found. The handout at its recorded URL was read visually at the locator on 2026-10-13.

### ModularCurvesPartII/E7 — misprint

**Locator:** Math 248B modularcurves.pdf, proof of Theorem 17.1, p.37.

**Assertion checked:** The Tate-normal-form discriminant on that page is expressed as (a₁³−27a₃)a₁³.

**Correction:** It is a₃³(a₁³−27a₃), as computed from the native Weierstrass discriminant and as used on p.38.

**Reason:** Set a₁=0,a₃=1: the printed expression is zero while the discriminant is −27.

**Reach:** the proof. **Existing correction:** The following page uses the correct a₃ factor; the local misprint remains in the served copy.

**Correction search:** Conrad Math 248B handout index and author publication page, opened 2026-10-13; no correction to this assertion found. The handout at its recorded URL was read visually at the locator on 2026-10-13.

### ModularCurvesPartII/E8 — error

**Locator:** Math 248B classical.pdf, Proposition 3.1(1), p.3.

**Assertion checked:** The whole projection H→Γ\H is described as proper and finite.

**Correction:** Restrict that assertion to the local finite stabilizer quotient U→U/Γ_y. The global quotient by an infinite Γ is neither finite nor proper.

**Reason:** A generic orbit of an infinite finite-index congruence group has infinitely many points, while the fibres of a finite analytic map are finite.

**Reach:** a stated result. **Existing correction:** new

**Correction search:** Conrad Math 248B handout index and author publication page, opened 2026-10-13; no correction to this assertion found. The handout at its recorded URL was read visually at the locator on 2026-10-13.

### ModularCurvesPartII/E9 — error

**Locator:** MF v1.31, proof of Theorem 6.1, p.89, integer-coefficient step.

**Assertion checked:** The proof selects the smallest index with a nonintegral coefficient in a polynomial in j and extracts that coefficient from its Laurent expansion.

**Correction:** Select the largest nonintegral index after removing higher integral terms, then use the leading Laurent coefficient.

**Reason:** For a nonintegral scalar c, P=cj²−1488cj has q⁻¹ coefficient zero although its coefficient of j is nonintegral. The highest index instead gives the q⁻² coefficient c.

**Reach:** the proof. **Existing correction:** new

**Correction search:** Milne CourseNotes/mf.html opened 2026-10-13: v1.31 and revision history; no correction of this assertion found. A fresh attempt to open the MF errata URL failed (HTTP 406); targeted searches for the assertion and corrections found none. The recorded finding is scoped to MF v1.31.

### ModularCurvesPartII/E10 — error

**Locator:** MF v1.31, Example 8.9, p.100.

**Assertion checked:** The Legendre parameter is presented as a fine full-level-two moduli scheme with a universal family.

**Correction:** It gives the coarse curve A¹\{0,1}; the level stack retains inversion and has twists.

**Reason:** Over C(t), a generic Legendre curve and a nonsquare quadratic twist have the same parameter and rational two-torsion labels but need not be isomorphic.

**Reach:** a stated result. **Existing correction:** new

**Correction search:** Milne CourseNotes/mf.html opened 2026-10-13: v1.31 and revision history; no correction of this assertion found. A fresh attempt to open the MF errata URL failed (HTTP 406); targeted searches for the assertion and corrections found none. The recorded finding is scoped to MF v1.31.

### ModularCurvesPartII/E11 — error

**Locator:** Published Annals paper, §2.1, p.715, projective framing and cusp automorphisms.

**Assertion checked:** Scalar-equivalence full p-frames are treated as fine, and the bare p-gon automorphism count used at the cusp is p.

**Correction:** The scalar-frame stack retains central inversion. Use its coarse curve or specify μ₂-rigidification; the bare p-gon has automorphism scheme μ_p×Z/2, of order 2p in characteristic zero.

**Reason:** Inversion multiplies a frame by −1 and therefore fixes its scalar class. The two polygon factors act independently; an effective cusp order p follows only with the quotient/rigidification convention.

**Reach:** a stated result. **Existing correction:** new

**Correction search:** Bakker author publication page and Annals 184(3) article page opened 2026-10-13; published paper and linked erratum identified. All five pages of the author-hosted erratum were read; its corrections to Propositions 14 and 26 do not address this assertion.

### ModularCurvesPartII/E12 — error

**Locator:** Published Annals paper, §2.5, pp.716–717, Hecke definition and degree.

**Assertion checked:** The cyclic-kernel closure definition is combined with the σ₁(m) degree used for the full Hecke correspondence at arbitrary m.

**Correction:** Distinguish the cyclic correspondence of degree ψ(m) from the all-subgroup correspondence of degree σ₁(m).

**Reason:** At m=4 there are six cyclic order-four subgroups and one further order-four subgroup E[2]. Thus the two source degrees are six and seven.

**Reach:** a stated result. **Existing correction:** new

**Correction search:** Bakker author publication page and Annals 184(3) article page opened 2026-10-13; published paper and linked erratum identified. All five pages of the author-hosted erratum were read; its corrections to Propositions 14 and 26 do not address this assertion.

### ModularCurvesPartII/E13 — error

**Locator:** Published Proposition 4.3.6, pp.2052–2053.

**Assertion checked:** The fine-scheme criterion at N≥1 omits N=1 from the exceptional levels, retaining only prime powers and twice prime powers.

**Correction:** Add N=1 as nonfine, or state the criterion for N≥2.

**Reason:** At level one there is no rigidifying frame: Xfull(1)=X(1) has generic inversion inertia and cannot be represented by a scheme.

**Reach:** a stated result. **Existing correction:** new

**Correction search:** Česnavičius author publication page and arXiv:1511.07475v2, checked 2026-10-13. MSP published Proposition 4.3.6, pp.2052–2053, was visually collated against the preprint; both omit the level-one exception. No correction found.

### ModularCurvesPartII/E14 — gap

**Locator:** Author copy, proof of Theorem 2.4.5, p.16.

**Assertion checked:** The deformation reduction invokes DR III 1.2 while the mixed-level argument allows polygon count divisible by the residue characteristic.

**Correction:** Use Česnavičius Proposition 4.2.11 and the preceding torsion congruence results for the mixed/bad-characteristic case.

**Reason:** DR’s cited smoothing reduction has a prime-to-characteristic polygon-count restriction. Ampleness of the mixed point/subgroup data does not impose that restriction.

**Reach:** the proof. **Existing correction:** Česnavičius Proposition 4.2.11, preprint pp.33–34, explicitly supplies the replacement argument.

**Correction search:** Conrad author publication list and Math 248B handout index, opened 2026-10-13; no correction linked for this assertion. Cambridge DOI 10.1017/S1474748006000089 opened 2026-10-13: abstract/access controls only, so the finding is restricted to the author copy. Česnavičius §4.2 read in full, including the discussion of Conrad’s proof, on 2026-10-13.

## Sources read

Locators throughout refer to the editions below. The packet records SHA-256 hashes and the source-version access details. No source passage or section-by-section source digest is reproduced here.

- **[Arithmetic moduli of generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf)**, Brian Conrad. Author copy dated July 18, 2006, 49 pages; result numbers and printed pages refer to this copy. Published JIMJ 6 (2007), 209–278. Read 2026-10-13: §§2.1–2.4, pp.4–16; §§3.1–3.3, pp.18–30; §§4.1–4.2, pp.31–37; §4.4, pp.42–46. Results 4.3.6–4.3.7 read as interface leads only; full Tate charts are R13.3.
- **[Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf)**, Pierre Deligne and Michael Rapoport. Modular Functions of One Variable II, LNM 349 (1973), pp.143–316; public IAS scan, PDF page plus 142 is the printed page. Read 2026-10-13: II §§1.1–1.20, pp.173–184; II §3, pp.192–195; IV §§1.1–1.6, pp.205–209; VII §§4.1–4.8, pp.310–313. III Theorem 1.2 and §§1.3–1.4, pp.197–199, read to check the prime-to-characteristic deformation restriction in E14.
- **[A modular description of X₀(n)](https://arxiv.org/pdf/1511.07475v2)**, Kęstutis Česnavičius. arXiv:1511.07475v2, October 5, 2017, 67 pages; locators use its own page numbers. Read 2026-10-13: §§1–2.2, pp.1–15; §§3.1–3.4, pp.15–27; §§4.1–4.6, pp.27–49; §§5.1–5.13, pp.50–62. §6 coarse-space results are an R13.4a supplier, not replanned.
- **[A modular description of X₀(n), version of record](https://msp.org/ant/2017/11-9/ant-v11-n9-p02-p.pdf)**, Kęstutis Česnavičius. Algebra & Number Theory 11 (2017), 2001–2089; MSP PDF with two cover pages, printed page = PDF page +1998. Read 2026-10-13: Proposition 4.3.6 and proof, pp.2052–2053; introduction to and statement/proof of Proposition 4.6.5, pp.2063–2064, collated against the preprint.
- **[Modular curves and analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf)**, Brian Conrad. Stanford Math 248B course handout, modularcurves.pdf, 47 pages; undated file served on 2026-10-13. Read 2026-10-13: §§2–9, pp.2–21; §17, pp.37–41. The opposite-to-Silverman pairing convention in §§7–8 is accounted for explicitly.
- **[Classical analytic modular curves](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf)**, Brian Conrad. Stanford Math 248B classical.pdf handout, 13 pages. Read 2026-10-13: §§1–4, pp.1–11, including local quotient charts and the cusp parameter. Counts on pp.12–13 are not needed.
- **[The q-expansion principle](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf)**, Brian Conrad. Stanford Math 248B qexp.pdf handout, 6 pages. Read 2026-10-13: Complete handout, pp.1–6: coefficient descent and the flatness conditions in the integral principle.
- **[Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf)**, Henri Darmon, Fred Diamond and Richard Taylor. Author-hosted exposition dated September 9, 2007, 166 pages; internal page numbers. Read 2026-10-13: §1.1, pp.17–18; §1.2, pp.22–26, especially Lemma 1.12; §1.5, pp.36–39, especially Theorem 1.33; §1.6, p.39, Lemma 1.34.
- **[Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf)**, J. S. Milne. Version 1.31, March 22, 2017, 134 pages. Read 2026-10-13: §3, pp.41–47; §§6–8, pp.87–100, especially Theorem 6.1, Theorems 7.2/7.5, Lemmas 8.5/8.7, Theorem 8.8 and Example 8.9. §5, pp.67–75: lattice subgroups, Lemma 5.13, Remarks 5.14–5.15 and Proposition 5.16/Corollary 5.17; pp.76–77 read for normalization context.
- **[p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.pdf)**, Benjamin Bakker and Jacob Tsimerman. Annals of Mathematics 184 (2016), 709–744, published PDF; printed page = PDF page +708. Read 2026-10-13: §2.1–§2.6, pp.713–719, especially the projective full-level description, cusp inertia and Hecke degrees; these are the routed items within this part.
- **[Erratum to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf)**, Benjamin Bakker and Jacob Tsimerman. Author-hosted five-page erratum; version served on 2026-10-13. Read 2026-10-13: All five pages; corrections concern Propositions 14 and 26, not the moduli or composite-Hecke assertions used here.
- **[Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf)**, Benedict Gross and Don Zagier. Inventiones Mathematicae 84 (1986), 225–320; published scan with one GDZ cover page, printed page = PDF page +223. Read 2026-10-13: I §1, printed p.226 (PDF p.3), read visually: Q(j,j′), the two rational cusps; V §1, printed p.306 (PDF p.83), read visually: the full weight-two Hecke pairing. Other routed results belong to R13.5/R14.1/R14.2.

## Compact Lean suggestions

The companion suggested file follows the streamlined WORKERS shape dated 2026-10-12. It uses the native `PeriodPair` and `WeierstrassCurve`, with real bodies for the light lattice equation and split one-gon equation. It states the lattice discriminant and nonsingularity milestones and a selected coordinate test; additional native examples check the nodal equation, Tate-normal-form discriminant, cyclotomic degree and the existing irreducibility implication. Heavy analytic/moduli/groupoid definitions and their complete API and unit tests remain the targets in this document. The file elaborated at the pinned build, with only the three intended proof-placeholder warnings. This makes no implementation claim.

## Coverage and continuation

| Stage | Targets | Status |
| --- | ---: | --- |
| `ModularCurvesPartII:R12.1` | 5 | planned |
| `ModularCurvesPartII:R12.2` | 5 | planned |
| `ModularCurvesPartII:R12.3` | 4 | planned |
| `ModularCurvesPartII:R12.4` | 4 | planned |
| `ModularCurvesPartII:R12.5` | 6 | planned |
| `ModularCurvesPartII:R12.6` | 5 | planned |
| `ModularCurvesPartII:R13.1` | 11 | planned |
| `ModularCurvesPartII:R13.2` | 8 | planned |

The pass contains 48 targets, 107 named API items, 52 unit tests and 39 planets, with at most six planets per stage. All ten checkpoint node ids survive, with the erroneous conventions corrected. There is no unplanned in-scope target left; the precise remaining external work is the supplier contracts and SF.2/PR196 carrier integration, followed by independent mathematical review and packaging. Full Tate theory, coarse integral construction, bad regular models and integral/Jacobian Hecke theory retain their other stage owners.
