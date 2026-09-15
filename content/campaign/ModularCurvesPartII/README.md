# Roadmap: Modular Curves PartII

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Identify the algebraic modular curves of #81 with the analytic modular curves already used by ModularForms and FuchsianOrbifolds. This supplies the missing unconditional connectedness input for #81's twisted curves and makes analytic Hecke theory available on the algebraic construction.

## Existing material and ownership

Use #81's actual affine Y₁(N), Y_full(N), fixed-pairing Y(N,ζ) and Y(rho). Its Layer 10 compactifies only Y_H = Y₁(N)/H for prime N≥5 and H≤(ℤ/Nℤ)ˣ/{±1}. It does not supply arbitrary-level X₁/X₀, full-level or fixed-pairing compactifications. Those are constructed here at R13.4a; their analytic comparison is R12.3 and their late compatibility is R13.4b. Use the existing analytic quotient and compact Riemann-surface carriers, not a third modular curve. ComplexComparison in PR196 owns general analytification and Artin comparison. ComplexComparisonPartII C2–C5 constructs the coherent GAGA, Chow and algebraic de Rham comparisons consumed here. General complex-manifold/tori work in #279/#280 is a supplier, not another curve-moduli owner.

## Conventions

Y_full(N) has a determinant map to primitive Nth roots and is not generally geometrically connected. Connectedness belongs first to a fixed-pairing component Y(N,ζ). Match #81's row-vector right action and Weil-pairing convention. A complex isomorphism is first an analytic isomorphism; algebraic descent and GAGA are later theorems.


<a id="r12-1"></a>

## R12.1. Uniformisation of elliptic curves

**Milestone:** `R12.1`

Construct the complex analytic manifold associated to a smooth projective Weierstrass curve and prove its uniformisation by C/Λ, compatibly with the distinguished point and group law. Prove the converse Weierstrass construction from a lattice and invariance under homothety. Compare the algebraic invariant differential, periods and scheme-theoretic Weil pairing with the analytic formula. This is the elliptic-curve uniformisation explicitly excluded by the arithmetic roadmap.

**Dependencies:** the existing mathematical suppliers identified in the ownership section.

<a id="r12-2"></a>

## R12.2. Level structures and quotient identification

**Milestone:** `R12.2`

Classify full, Γ₁ and Γ₀ level structures under uniformisation, and derive the corresponding analytic quotient with its functorial action. Identify the ordered-basis determinant with the chosen root of unity. Treat automorphisms at elliptic points and the fine/coarse distinction, especially small levels. Prove that the resulting analytic map is an isomorphism, not just a bijection of complex points.

**Dependencies:** R12.1 (preceding layer).

<a id="r12-3"></a>

## R12.3. Cusps and compactification comparison

**Milestone:** `R12.3`

Construct the local parameter at each cusp, compare its width with the Tate parameter and identify the compact analytic curve with the analytification of the algebraic compact curve. On PR81 Layer 10's prime-N≥5 diamond-quotient class, use its existing normalization compactification. At composite/small/full/fixed-pairing levels use R13.4a's independently constructed coarse curve, not a nonexistent PR81 object. Prove extension of the affine isomorphism and identify the scheme-theoretic cusp locus. Do not repeat the PR81 construction on its actual class or assert that the coarse cusp fibre is always reduced. Prime-level two-cusp and Shimura-cover formulae are not exported to arbitrary composite level.

**Dependencies:** R12.2; R13.4a for the general-level algebraic compactification; R13.3 for its formal cusp charts. No dependency on R13.4b or R12.6 is allowed here.

<a id="r12-4"></a>

## R12.4. Connectedness and twisted curves

**Milestone:** `R12.4`

Prove connectedness of the fixed-pairing analytic quotient and transfer it to geometric connectedness of the algebraic curve via analytification/base change. Use #81's smoothness and connected-implies-irreducible result to obtain geometric irreducibility. Identify the base change of the twisted curve with the correct fixed-pairing curve, thereby discharging its named conditional input. Record the determinant compatibility required to define the twist.

Discharge PR81 §5C as three named statements: (i) prove invariance of geometric connectedness under the algebraically closed extension Qbar→C, using the actual finite-type curve and the standard geometric-component base-change theorem; (ii) construct the analytic isomorphism of the complex twisted curve with its upper-half-plane congruence quotient by R12.2 and the algebraic twisting comparison; (iii) apply ComplexComparisonPartII C4's smooth affine curve connectedness comparison. These are separate lemmas with different hypotheses, not one assertion that analytification preserves every topological property.

**Dependencies:** R12.2; PR81's fixed-pairing/twisting and smoothness stages; ComplexComparisonPartII C4. This open-curve connectedness proof does not require the compactified comparison R12.3.

<a id="r12-5"></a>

## R12.5. Differentials and Hecke normalisation

**Milestone:** `R12.5`

Identify weight-two cusp forms with regular differentials on the compact curve and the Hodge bundle with the automorphy factor on the upper half-plane. Check the q-expansion of f(q)dq/q and all scalar conventions. Compare pullback and trace along the basic isogeny correspondences with the arithmetic Hecke action. The general integral correspondence and cohomology theory is R14; analytic newform theory remains ModularForms.

**Dependencies:** R12.3; R12.4; ComplexComparisonPartII C5.

<a id="r12-6"></a>

## R12.6. Descent and compatibility statements

**Milestone:** `R12.6`

Prove compatibility of the comparison with changes of level, diamond operators, complex conjugation and the chosen rational cusp. State the precise fields of definition of components and of the canonical cusp. Supply a named theorem to replace #81's conditional geometric-connectedness supplier and the analytic/algebraic comparison needed by R14 and R15.

**Dependencies:** R12.5 (preceding layer).

## Required examples and checks

Check the j-line, the two components distinguished by determinant at a small full level, and X₀(11) with its rational cusp. A test must reject the false assertion that Y_full(N) is geometrically connected for every N.



## References

KM, DR, SERRE_GAGA, SHIMURA71. The bibliography records what was inspected and what remains to be transcribed.

## Additional strand: Integral compactified modular curves and boundary moduli


Continue #81 from coarse compactification away from the level to the boundary moduli and bad-characteristic geometry needed for modularity. The construction must work with the correct moduli problem at composite level, not an unverified naive extension of the prime-level picture.

## Existing material and ownership

#81 already constructs the affine integral level problems; its compactifications over Z[1/N] are only the prime-N≥5 diamond quotients specified in Layer 10. R13.2–R13.4a supply the other compactifications. R09 supplies algebraic stacks, quotients and normalisation; R05 formal geometry; R07 finite-flat groups. Consume the existing curve stable-reduction and divisor/cohomology theories. R11 owns general Néron and semistable-Picard theory; R14 consumes its applications to modular curves.

## Conventions

Distinguish the compactified moduli stack, its coarse space, a regular model and a semistable model after base extension. None is assumed smooth at primes dividing the level. Use Deligne–Rapoport/Katz–Mazur level conventions, and the refined Γ₀(n) description where needed. Arbitrary composite level is not justified by a formula proved only for prime level.


<a id="r13-1"></a>

## R13.1. Generalised elliptic curves

**Milestone:** `R13.1`

Define proper flat families with smooth elliptic or polygonal geometric fibres, the group law on the smooth locus and its action on the whole curve. Construct n-gons, contraction/decontraction and the ampleness condition on level structures. Prove descent and compatibility with the elliptic-scheme object of #81 on the smooth locus. An arbitrary pointed genus-one nodal family does not automatically supply the required group action.

**Dependencies:** [AdicSpacesPartII F0](../AdicSpacesPartII/README.md#f0); [AlgebraicModuliForArithmeticGeometry R09.5](../AlgebraicModuliForArithmeticGeometry/README.md#r09-5); [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-1).

<a id="r13-2"></a>

## R13.2. Compactified level moduli

**Milestone:** `R13.2`

Construct compactified full and Γ₁ level problems, and the correct Γ₀(n) problem at general n. Follow Česnavičius' refined description when the naive cyclic-subgroup formulation fails; include the extra boundary data and contraction compatibility. Prove algebraicity/representability in the precise ranges, properness and normality, and identify the open substack with the affine level problem already owned by #81.

**Dependencies:** R13.1 (preceding layer).

<a id="r13-3"></a>

## R13.3. Tate curves and formal neighbourhoods of cusps

**Milestone:** `R13.3`

Extend the Tate curve to the generalised-elliptic setting, classify boundary level data and compute completed local rings, cusp widths and the Hodge line. Prove the formal comparison used in the q-expansion principle. Record ramification and stabilisers, including characteristics 2 and 3. The finite-flat cusp fibre, its reduced locus, and its Cartier structure are distinct assertions.

**Dependencies:** R13.2 (preceding layer).

<a id="r13-4"></a>

## R13.4. Integral coarse spaces and comparison with #81

**Milestone:** `R13.4`

This completed interface is the combination of R13.4a and R13.4b, not an indivisible prerequisite of R12.3.

**Dependencies:** R13.4a; R13.4b.

<a id="r13-4a"></a>

### R13.4a. Algebraic coarse construction before analytic comparison

Construct coarse compactified curves from R13.2's actual stack presentations, with the necessary finite-inertia quotient, normalization and existence arguments. Treat full, fixed-pairing, Γ₁ and refined Γ₀ level separately, with their bases and stabilizers. Prove properness, normality and the allowed base-change statements. Identify their affine opens with PR81 by the moduli universal property. For prime N≥5 diamond quotients, prove agreement with PR81 Layer 10 after inverting N by normalization uniqueness. This construction does not use analytic uniformization, connectedness or R12.6. It supplies the algebraic input to R12.3.

**Dependencies:** R13.3; AlgebraicModuliForArithmeticGeometry R09.5.

<a id="r13-4b"></a>

### R13.4b. Generic-fibre and correspondence compatibility

Using R12.3/R12.6, prove the generic-fibre analytic comparison for R13.4a's curves, including components, determinant and cusp fields. Extend degeneracy maps as scheme/stack morphisms or correspondences and prove compatibility with the generic-fibre Hecke normalization. A coarse-space morphism is not substituted for a stack correspondence without the applicable descent theorem.

**Dependencies:** R13.4a; R12.6.

<a id="r13-5"></a>

## R13.5. Bad fibres and regular/semistable models

**Milestone:** `R13.5`

Compute the local models and supersingular intersections required by the proof, construct Igusa components where used, and give the resolution or base extension needed for a regular/semistable model. Begin with the prime-to-p level and one p-factor cases used by level lowering, then treat every higher p-power/composite-level case actually invoked by the Serre weight-and-level argument. Keep those cases as an explicit finite list to be audited against R20.

**Dependencies:** R13.4 (preceding layer).

<a id="r13-6"></a>

## R13.6. Boundary and degeneration outputs

**Milestone:** `R13.6`

Export the dual graphs, component maps, cusp sections and formal parameters used by R11/R14/R20. Prove Hecke/degeneracy compatibility on bad fibres and the inputs to nearby-cycle and character-group computations. An assertion that the geometry is “semistable” must identify the exact model and base. The generic-fibre modular curve remains the same object used throughout the programme.

**Dependencies:** R13.5 (preceding layer); [WeightsInEtaleCohomology R34.3](../WeightsInEtaleCohomology/README.md#r34-3).

## Required examples and checks

Check prime level away from and at that prime, level p², and a composite level with nontrivial boundary contraction. Include a characteristic-2 or 3 stabiliser example and explicitly reject arbitrary base change for coarse spaces.



## References

DR, KM, CONRAD07, CESNAVICIUS17. The bibliography records what was inspected and what remains to be transcribed.

## Additional strand: Hecke correspondences, modular-curve cohomology and modular quotients


Construct the algebraic and cohomological Hecke modules needed for R=T, weight and level optimisation, and the modular parametrisation of an elliptic curve. The endpoint includes modular quotients as actual abelian varieties, independently of a theorem identifying their Galois representations.

## Existing material and ownership

ModularForms owns analytic Hecke operators, newforms, multiplicity one, coefficient fields and L-functions. #81/R12/R13 supply the same modular curves algebraically and analytically. JacobianChallenge/R10 supply Jacobians and abelian-variety quotients, R11 their reduction theory, and #196 the general étale cohomology/comparison. This roadmap supplies correspondences and their actions, not a second analytic theory.

## Conventions

Use the arithmetic Hecke normalisation of ModularForms. Pullback then trace/pushforward must have a fixed order on divisors, differentials and cohomology. Diamonds are indexed by units; U_p at a bad prime agrees with the existing T_p notation by a theorem. Distinguish the full Hecke algebra from its away-from-level-and-p subalgebra.


<a id="r14-1"></a>

## R14.1. Algebraic Hecke correspondences

**Milestone:** `R14.1`

Construct the isogeny correspondences at good and bad primes, degeneracy maps and diamond operators from the moduli interpretation. Extend them to compactifications in the appropriate sense. Prove composition, double-coset and adjoint formulas, and compare their q-expansion action with ModularForms. Trace maps through inseparable or ramified situations require the correct coherent/étale formulation rather than a naive division by the degree.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A3](../AbelianSchemesAndArithmeticModuli/README.md#a3); [ModularCurvesPartII R12.6](README.md#r12-6); [ModularCurvesPartII R13.4](README.md#r13-4).

<a id="r14-2"></a>

## R14.2. Jacobians and integral Hecke actions

**Milestone:** `R14.2`

Construct the induced maps on Picard/Jacobian objects by pullback and norm. Prove the Hecke relations and the polarisation adjointness statements. Define the integral Hecke algebra through its faithful action on an actual finite module and show finiteness over the coefficient ring. Identify the action on differentials using R12 and on Tate modules using functoriality, without yet assuming an automorphic Galois representation theorem.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A6](../AbelianSchemesAndArithmeticModuli/README.md#a6); [ModularCurvesPartII R14.1](README.md#r14-1); [NeronModelsAndSemistableAbelianVarieties R11.4](../NeronModelsAndSemistableAbelianVarieties/README.md#r11-4).

<a id="r14-3"></a>

## R14.3. Cohomological realisations and pairings

**Milestone:** `R14.3`

Construct integral étale and Betti H¹, parabolic cohomology and the local systems required at finite level. Prove comparison, Poincaré duality, trace and change-of-level compatibility. Treat the nonproper boundary and distinguish ordinary, compactly supported and parabolic cohomology. Prove the torsion/freeness and finite-generation properties actually used after localising at a non-Eisenstein maximal ideal.

**Dependencies:** R14.2 (preceding layer).

<a id="r14-4"></a>

## R14.4. Ihara and level-change statements

**Milestone:** `R14.4`

Prove the Ihara-lemma and degeneracy-map injectivity/saturation statements in the exact modular-curve settings consumed by R20/R22. Include torsion, residual characteristic, level and exceptional-image conditions, and the proof using the relevant group/tree geometry or geometric character groups. Characteristic-zero injectivity alone does not prove integral saturation or a mod-p level-lowering theorem.

**Dependencies:** [ModularCurvesPartII R13.5](README.md#r13-5); [ModularCurvesPartII R14.3](README.md#r14-3).

<a id="r14-5"></a>

## R14.5. Modular quotients

**Milestone:** `R14.5`

For a normalised cuspidal newform f of weight exactly two and primitive level N, construct its Hecke ideal and the quotient A_f of J₁(N), or J₀(N) for trivial character, as an abelian variety over Q. Prove its dimension equals the degree of the coefficient field, identify the differential eigenspaces and explain the effect of oldforms. Prove the quotient map and Abel–Jacobi composite are nonzero where required. For K_f the coefficient field, V_ℓ(A_f) has Q_ℓ-dimension 2[K_f:Q]; its λ-component for λ|ℓ is the two-dimensional K_{f,λ}-representation. Proving that comparison belongs to AutomorphicGaloisRepresentations R19.1/R19.6; it is not a defining property of A_f. For weight k>2, R14.3 supplies parabolic cohomology with Sym^{k−2} of the relative degree-one local system and its Hecke action to R19.1, or the explicitly constructed Kuga–Sato realization. No quotient of a modular-curve Jacobian is asserted for general higher weight. The weight-two quotient construction is described in [Stein, modular abelian varieties](https://wstein.org/msri06/problems/html/node30.html); the higher-weight cohomology and Hecke comparison is [Deligne, Bourbaki 355, §3, especially (3.11), (3.19)–(3.20)](https://www.numdam.org/item/SB_1968-1969__11__139_0/).

**Dependencies:** R14.4 (preceding layer).

<a id="r14-6"></a>

## R14.6. Bad-prime and patching interfaces

**Milestone:** `R14.6`

Compute the character-group and monodromy exact sequences from R13/R11, with degeneracy maps and Hecke action. Supply the special-fibre Eichler–Shimura relation and the finite-level freeness statements needed for Taylor–Wiles modules. Supply the rational cusp and normalised Abel–Jacobi map used by R29. No modular parametrisation is asserted until the isogeny theorem has identified A_f with the target curve.

**Dependencies:** R14.5 (preceding layer).

## Required examples and checks

Check T_ℓ on q-expansions, the adjoint formula on a Jacobian, X₀(11)'s weight-two quotient, and an oldform at raised level. Verify that a non-Eisenstein localisation is an actual localisation of the constructed Hecke module.



## References

DELIGNE69, SHIMURA71, RIBET90, DIAMOND97. The bibliography records what was inspected and what remains to be transcribed.

## Ownership, order and shared coefficients

Build on the actual ModularCurves PR81 snapshot d42392849aab0f6c1d577e9159751d85b2db3c71: its affine integral level problems, relative elliptic Picard/Poincaré theory and coarse compactifications over Z[1/N] stay there. R12 supplies complex uniformization and connected fixed-pairing components; R13 supplies generalized elliptic curves, boundary moduli and bad fibres; R14 supplies Hecke correspondences, cohomology and modular quotients. Their single canonical curve is the PR81 object, with explicit comparison isomorphisms after every base change.

The earlier elliptic uniformization R12.1 consumes AbelianSchemesAndArithmeticModuli A5 only for its elliptic specialization, not PEL canonical models; R12.2–R12.6 then supplies the GL₂ comparison in ShimuraVarieties V8. R13.1–R13.3 supplies dimension-one degeneration to ShimuraCompactifications C4. General scheme étale sites/derived cohomology come from the existing CohomologicalPointCounting proposal and the campaign's shared derived sheaf theory, with classical analytic comparisons from ClassicalAdicEtaleCohomology. R14 constructs their modular coefficient systems and compares the pullback–trace operators; it never rebuilds the general six operations.

Absorb p-adic L-functions ModularGaloisRepresentations L0–L2: construct the universal-curve system H=R¹π_*Z_p, its dual/Tate twist, Sym^(w−2)H, integral lattice and compact-support/parabolic sequence; identify it with the analytic polynomial local system and period lines used by modular symbols. Prove the Hochschild–Serre edge-map comparison using ArithmeticGaloisDuality's spectral sequence, and saturation/base change at the actual Hecke localization. Deligne eigenspace extraction is AutomorphicGaloisRepresentations R19.1.

For bad-level geometry, the required class is every positive level used by classical weight/level optimization: prime-to-p level times p^r for all r≥0, including composite tame level and p=2,3. Build the general contraction/local-model formula with induction in r; specialize the finite exceptional cases of each lowering theorem explicitly. A prime-level crossing diagram is not a replacement for this class.


## Implementation handoff: Weight-sensitive Hecke realizations

**Stages:** R13.2, R13.5, R14.3, R14.4, R14.5, R14.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

R14.3 constructs the symmetric-power coefficient local systems on the open fine modular curve, their extension/parabolic cohomology and Hecke correspondences before taking eigencomponents. Level descent, compact support versus ordinary cohomology and the dual/Tate twist must be proved. R14.5 constructs abelian quotients only for weight-two newforms; for a coefficient field of degree d their rational Tate modules have dimension 2d.

**Acceptance and consumer contract.** Separate the integral Ihara/degeneracy statements by residual prime, tame/wild level and localization assumptions. Bad prime-power levels require their own model and exact sequence, not the prime-level two-cusp formulas. Compare weight two with coefficients of degree greater than one and a weight greater than two whose realization remains cohomological. R29 receives a rational cusp, a nonzero quotient map and exact normalization.

## Source anchors and prototype coverage

- ModularCurveUniformisation source targets.
- IntegralCompactifiedModularCurves source targets.
- ModularCurveHeckeCohomologyAndQuotients source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
