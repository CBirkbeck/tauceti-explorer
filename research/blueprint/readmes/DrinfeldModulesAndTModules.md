# Drinfeld modules, t-motives and characteristic-p special values

**Summary.** This roadmap develops Drinfeld modules over the ring A of functions on a smooth projective curve over F_q that are regular away from a fixed closed point ∞, together with Anderson t-modules and their motives over F_q\[t]. Its nine layers cover rank, isogenies and kernels (DM.0); torsion and Tate modules (DM.1); analytic uniformization by A-lattices over C∞ and the Carlitz period (DM.2); Drinfeld modular varieties, their Satake compactifications, modular forms and Hecke operators (DM.3); Anderson t-modules, effective A-motives and dual t-motives (DM.4); the Tate theorem for Drinfeld modules (DM.5); Taelman's class formula for special L-values (DM.6); elliptic sheaves and the shtuka they give (DM.7); and Papanikolas's Tannakian theory of rigid analytically trivial dual t-motives, which proves that Carlitz logarithms of algebraic arguments that are linearly independent over F_q(θ) are algebraically independent over its algebraic closure (DM.8). The plan has 123 targets, each with its exact statement, hypotheses, proof route, sources and prerequisites; every definition and construction has an API and at least three discriminating unit tests. Every layer is planned and none is closed: the open inputs are listed in [Gaps and open inputs](#gaps-and-open-inputs). Nothing here is claimed to be formalised.

## Purpose

Drinfeld modules are the function-field counterparts of the multiplicative group and of elliptic curves. The Carlitz module t ↦ θ + τ plays the role of G_m: its torsion points generate the Carlitz cyclotomic function fields, which give explicit class field theory for F_q(θ) (Carlitz, Hayes), and its exponential has kernel F_q\[θ]·π̃, as the complex exponential has kernel 2πiℤ. Higher-rank Drinfeld modules have Tate modules with Galois actions, a Tate theorem for their homomorphisms, moduli spaces that carry modular forms and Hecke operators, and, through elliptic sheaves and shtukas, the geometry that realises the Langlands correspondence for GL_r over function fields.

Two further theories make the subject a testing ground for conjectures that are out of reach over number fields. Taelman's class formula expresses the L-value L(E/R) of a Drinfeld module over the integers R of a finite extension of F_q(θ), which for the Carlitz module over F_q\[θ] is ζ\_A(1), as the product of a regulator and the order of a finite class module: an analogue of the analytic class number formula. Papanikolas's theorem proves the function-field analogue of Grothendieck's period conjecture for the rigid analytically trivial dual t-motives of his category: the transcendence degree of the period field equals the dimension of the motivic Galois group. Its application to Carlitz logarithms is the analogue of the conjecture, open over ℚ, that logarithms of algebraic numbers linearly independent over ℚ are algebraically independent.

This roadmap builds the objects those results need, in the generality the sources use, and states the results with all their hypotheses. It is the foundation for the function-field Langlands roadmaps that consume elliptic sheaves (GlobalShtukasAndFunctionFieldLanglands, ExcursionOperatorsAndSpectralAction), and for the multiple zeta values of its proposed Part II.

## Scope and boundaries

### What this roadmap owns

- **DM.0.** Drinfeld A-modules over fields and over arbitrary F_q-algebras (relative modules on a line bundle), the rank theorem for general A, morphisms and isogenies with rank invariance, kernels as finite group schemes, standardization over nonreduced bases, and the Carlitz module with its denominator products D_i and ℓ\_i.
- **DM.1.** Ideal torsion as a finite locally free group scheme of degree #(A/I)^r, étale exactly when γ(I) generates the unit ideal, geometric torsion bases, Tate modules T_λ for primes λ away from the characteristic with their continuous Galois action, and the characteristic-place realization as an effective local shtuka.
- **DM.2.** The completed algebraic closure C∞, projective A-lattices, lattice exponentials, the lattice-to-module construction, Drinfeld uniformization and its morphisms, the Carlitz exponential, logarithm and period, the Anderson–Thakur function Ω, and the coefficient Frobenius twist on power series (placed here at assembly; see [Assembly reconciliation](#assembly-reconciliation)).
- **DM.3.** Prime-to-characteristic level structures, the moduli stack and its fine level schemes, generalized Drinfeld modules, Pink's generic Satake compactification, the principal-level reciprocal model, algebraic Drinfeld modular forms, Hecke correspondences and the arithmetic Satake compactification of Hartl–Yu.
- **DM.4.** Anderson t-modules and A-modules, effective A-motives, the contravariant motive functor and the abelian anti-equivalence, purity and weights, uniformizability, Carlitz tensor powers, effective dual t-motives, the star anti-isomorphism between the τ and σ conventions, and the dual realization of t-module points.
- **DM.5.** Rational motives and their Tate realization, the Tate Hom map with its injectivity, local algebraization, the period ring, integral saturation, the Tate theorem for Drinfeld modules over finitely generated fields, and semisimplicity of the rational Tate representation.
- **DM.6.** Monic cardinalities of finite F_q\[t]-modules, Taelman's integral models, the Euler-product L-value, the exponential unit lattice, the class module, lattice covolumes, finite-field nuclear determinants, the trace formula, the tangent determinant identity, Taelman's class formula, depth-one Carlitz power sums and the Carlitz and nonzero-class-module examples.
- **DM.7.** Elliptic sheaves on the global curve, their normalized form, the elliptic sheaf of a Drinfeld module, the anti-equivalence with standard Drinfeld modules, the two-leg global shtuka export, and the comparisons of realizations away from and at the characteristic.
- **DM.8.** Semilinear fixed-vector descent, the analytic coefficient interface (algebraic entire series, the radius-one Tate algebra, exact constant fields and separability), rigid analytic triviality and its Betti realization, the neutral Tannakian category of rigid-trivial pre-t-motives, difference Galois groups and their torsors, the identification with the motivic Galois group, the Anderson–Brownawell–Papanikolas lifting criterion, period transcendence, and algebraic independence of Carlitz logarithms.

### What it imports

Every prerequisite outside the roadmap is a pinned library declaration, a node or layer of another roadmap, or a layer of a TauCetiRoadmap roadmap. The table lists the owners and the layers that use them; [Supplier contracts](#supplier-contracts) states each requested interface exactly.

| Owner | What this roadmap uses | Layers |
| --- | --- | --- |
| Mathlib (pinned 082e2d37e8) | skew polynomials and finite-field Frobenius, polynomial evaluation, ideals, completions and normed fields, restricted power series, fixed submodules and scalar extension, linear independence, matrices, intermediate fields, algebraic independence and transcendence degree, Hopf algebras, sheaves of modules on schemes | DM.0–DM.2, DM.4, DM.6–DM.8 |
| Tau Ceti library (pinned f790474) | the additive group as a functor of points and kernels of Hopf-algebra maps as group schemes (DM.0); smoothness of geometrically reduced commutative Hopf algebras and the points/tensor-automorphism comparison for a given Hopf algebra (DM.8). Fitting ideals (DM.6) and one-variable Weierstrass preparation (DM.8) are in current Tau Ceti, after the pin, and are imported where cited | DM.0, DM.6, DM.8 |
| FiniteFieldsAndCharacterSums FF.4 | the Frobenius Ore ring over a commutative F_q-algebra, evaluation of q-linearized polynomials, separability of q-linearized polynomials, subspace polynomials | DM.0–DM.4, DM.6 |
| SchemeAndStackFoundations SF.0–SF.3 (now also a TauCetiRoadmap roadmap) | relative Proj and its base change, finite normalization, excellent rings, dimension of finite-type schemes, Jacobson rings, fpqc descent of affine schemes and quasi-coherent sheaves, torsors, finite group quotients, the étale–Galois dictionary, Hilbert 90, Serre vanishing for ample bundles, degree bounds for line bundles | DM.0, DM.1, DM.3–DM.5, DM.7, DM.8 |
| TauCetiRoadmap AlgebraicCurves, Layers 2, 3, 5 | the Dedekind affine model of a curve minus a point, divisors and Riemann–Roch spaces, completions at places and residue degrees | DM.0–DM.2, DM.4–DM.7 |
| TauCetiRoadmap JacobianChallenge, Layers A–C | line bundles and degree on curves, Riemann–Roch and Serre duality, relative coherent cohomology and base change | DM.7, DM.8 |
| TauCetiRoadmap AlgebraicVectorBundles, L0B and L2B | finite locally free and invertible sheaves, the total space of a vector bundle (recorded as upstream imports; the roadmap postdates the atlas snapshot) | DM.0, DM.3, DM.4, DM.7 |
| TauCetiRoadmap AdicSpaces, Layer 0; RestrictedPowerSeries; NewtonPolygons | Tate algebras and restricted series; on current main, Gauss norms, Weierstrass preparation, entire series, zero counts and entire products | DM.2, DM.4, DM.8 |
| TauCetiRoadmap StableReduction, Layer 0 | Fitting ideals and their base change (current Tau Ceti declarations) | DM.6 |
| MotivesAndAlgebraicCycles MC.6 | neutral Tannakian reconstruction over an arbitrary field, finite-type recognition, fibre-functor torsors | DM.8 |
| FunctionFieldArithmetic FA.0 | the rational function field with its place at infinity, curves of finite separable extensions, the p-basis separability criterion, transport of the finite-field Lang theorem | DM.8 |

### What it leaves to other roadmaps

- Generic q-linearized polynomials, the Frobenius Ore ring and its comparison with F_q-linear endomorphisms of G_a over any commutative F_q-algebra belong to FiniteFieldsAndCharacterSums, layer FF.4, which this roadmap imports. The valued skew-field normal forms behind Maurischat's abelian-equals-A-finite theorem are proposed as FiniteFieldsAndCharacterSums, Part II (see [Restructuring proposals](#restructuring-proposals)).
- Curves, divisors, Riemann–Roch and completions at places are TauCetiRoadmap AlgebraicCurves (Layers 2, 3 and 5) and JacobianChallenge (Layers A–C); locally free sheaves and vector bundles are TauCetiRoadmap AlgebraicVectorBundles (L0B, L2B). Schemes, fpqc descent, quotients, Proj and the étale–Galois dictionary are SchemeAndStackFoundations (SF.0–SF.3), itself now a TauCetiRoadmap roadmap.
- Restricted power series and Tate algebras are AdicSpaces Layer 0; on current TauCetiRoadmap main, RestrictedPowerSeries owns Gauss norms, Weierstrass preparation and the entire-series ring, and NewtonPolygons owns zero counts and entire products. Fitting ideals are current Tau Ceti library declarations, imported through StableReduction.
- Neutral Tannakian reconstruction over an arbitrary field, and the recognition criteria for group maps, belong to MotivesAndAlgebraicCycles, layer MC.6. The finite-field Lang theorem is TauCetiRoadmap ReductiveGroupsPartII (RG2.3.7); FunctionFieldArithmetic FA.0 transports it to the coefficient-Frobenius setting.
- General global G-shtukas, their moduli and the function-field Langlands correspondence belong to GlobalShtukasAndFunctionFieldLanglands, which imports the elliptic-sheaf realization of DM.7 as an optional specialised case (restructuring RS-22). Equal-characteristic local shtukas belong to HeckeStacksAndLocalShtukas; the characteristic-place comparison of DM.1 and DM.7 records the exact interface it needs as a gap.
- Multiple zeta values in positive characteristic, Thakur's basis conjecture and the Zagier–Hoffman analogues (Chang–Chen–Mishiba, Ngo Dac, Im–Kim–Le–Ngo Dac–Pham) are routed to DrinfeldModulesAndTModulesPartII, whose design job is queued; they import DM.8's difference-equation interface, in particular DM.8/constant-denominator. A candidate Part II on gamma values and CM periods (Wei) is withheld by its paper review. Transcendence in characteristic zero is DiophantineApproximationAndTranscendence, a different theory.

## Conventions

- **The coefficient ring.** F is a finite field with q = p^m elements. C is a smooth projective geometrically connected curve over F with a closed point ∞ of degree δ, A = Γ(C − ∞, O_C), and Q = Frac(A). For nonzero a ∈ A, deg_A(a) = −δ·ord_∞(a) = log_q #(A/(a)). In the polynomial case A = F\[t]. A coefficient algebra is an F-algebra R with an F-algebra map γ : A → R, the characteristic map; its characteristic is ker γ, and γ injective is generic characteristic. Over F\[t] write θ = γ(t), so that the letter t is the algebraic variable and θ its image.
- **Ore rings.** R{τ} is the ring of twisted polynomials with τc = c^q τ. It acts on R by q-linearized polynomials, and multiplication is composition. The differential of an element is its τ^0 coefficient. Evaluation on the points of a finite field need not be faithful, so identities of twisted polynomials or of group-scheme maps are never replaced by equalities of functions on one finite set of points.
- **Inverse twists and dual motives.** On a perfect coefficient field, σ(c) = c^(1/q). On power series and matrices σ acts coefficientwise and fixes the variable t; f^(n) = σ^(−n)(f) is the n-fold coefficient q-Frobenius. Twisting never substitutes t^q for t. The ring L\[t, σ] has σc = c^(1/q)σ and σt = tσ. The star map sends Σ a_i τ^i to Σ a_i^(1/q^i) σ^i and reverses products; on matrices it also transposes.
- **Variance.** The τ-motive of a t-module E is contravariant: M(E) = Hom(E, G_a) as F-module schemes, with A acting through E and τ by q-Frobenius on values. The dual motive of a coordinate t-module is the row module L\[σ]^(1×d), and an intertwiner U induces h ↦ hU\*, so the dual construction is covariant.
- **Analytic normalizations.** C∞ is the completion of an algebraic closure of the completion K∞ of Q at ∞, with |a| = q^(deg_A a); for F\[θ] this gives |θ| = q. The Carlitz module is C_t = θ + τ. Its exponential is exp_C(z) = Σ z^(q^i)/D_i, entire, and its logarithm log_C(z) = Σ z^(q^i)/ℓ\_i converges exactly on |z| < q^(q/(q−1)), where it inverts exp_C. Fix ρ with ρ^(q−1) = −θ. The period π\_BP = θρ∏\_(i≥1)(1 − θ^(1−q^i))^(−1) generates ker exp_C as an F\[θ]-module and has |π\_BP| = q^(q/(q−1)); the Ngo Dac normalization is π\_ND = −π\_BP. The Anderson–Thakur function Ω(t) = ρ^(−q)∏\_(i≥1)(1 − t/θ^(q^i)) satisfies Ω^(−1) = (t − θ)Ω and Ω(θ)^(−1) = −π\_BP. Papanikolas's period π̃ = −1/Ω(θ), used throughout DM.8, is therefore π\_BP.
- **Difference equations.** In DM.8, T is the radius-one restricted power series ring in C∞\[\[t]], L its fraction field, E the ring of entire series whose coefficients are algebraic over k = F_q(θ) and generate a finite extension of k∞, K = k̄(t), and the fixed field of σ on L is F_q(t). For a motive with basis column m, σ(m) = Φm; a fundamental matrix satisfies σ(Ψ) = ΦΨ; its columns span the solutions of the vector equation, while Ψ^(−1)m is a basis of the Betti realization. The difference torsor is built from Ψ\_1^(−1)Ψ\_2 with right multiplication.
- **Two notations for the polynomial case.** DM.0–DM.7 write F for the finite field and θ = γ(t). DM.8 follows Papanikolas: A = F_q\[θ] and k = F_q(θ) are the coefficient rings inside C∞, t is an independent variable, and some DM.8 statements write F for F_q(t), as each says. The two readings agree through γ.
- **Hypotheses are explicit.** Rank, generic characteristic, abelianness, A-finiteness, purity, uniformizability and rigid analytic triviality are separate conditions, stated wherever they are used. In particular not every t-module is abelian or uniformizable, and not every pre-t-motive is rigid analytically trivial.

## Layer overview

Each layer is planned at target level (PROTOCOL.md section 2). The dependency column lists the layers whose targets a layer cites; it is acyclic. DM.1 cites DM.4 because the finite torsion and characteristic-place realizations are stated through effective A-motives.

| Layer | Title | Targets | Uses layers | Planets |
| --- | --- | --- | --- | --- |
| [DM.0](#layer-dm-0) | Drinfeld modules, relative families and Carlitz arithmetic | 11 | — | Drinfeld module; Drinfeld rank; Carlitz module; Drinfeld isogeny; Drinfeld kernel; Relative Drinfeld module |
| [DM.1](#layer-dm-1) | Ideal torsion, Tate modules and characteristic completion | 7 | DM.0, DM.4 | Drinfeld torsion; Finite flat torsion theorem; Drinfeld Tate module; Tate Galois representation; Characteristic local shtuka |
| [DM.2](#layer-dm-2) | Analytic uniformization and period conventions | 11 | DM.0 | C infinity; Drinfeld lattice; Drinfeld exponential; Drinfeld uniformization theorem; Carlitz exponential; Carlitz period |
| [DM.3](#layer-dm-3) | Level moduli, Satake compactification and modular forms | 9 | DM.0, DM.1 | Drinfeld level structure; Fine Drinfeld moduli scheme; Generalized Drinfeld module; Drinfeld Satake compactification; Drinfeld modular form; Drinfeld Hecke correspondence |
| [DM.4](#layer-dm-4) | Anderson modules, effective motives and dual conventions | 10 | DM.0, DM.2 | Anderson t-module; Effective A-motive; Anderson motive anti-equivalence; Pure t-motive; Carlitz tensor power; Effective dual t-motive |
| [DM.5](#layer-dm-5) | The integral and rational Tate theorem | 8 | DM.0, DM.1, DM.4 | Tate Hom comparison; Drinfeld Tate theorem; Tate semisimplicity theorem |
| [DM.6](#layer-dm-6) | Euler values, regulators and Taelman class modules | 13 | DM.0, DM.2 | Monic module cardinality; Taelman L-value; Exponential unit lattice; Taelman class module; Finite-field nuclear determinant; Taelman class formula |
| [DM.7](#layer-dm-7) | Normalized elliptic sheaves and shtuka comparisons | 7 | DM.0, DM.1, DM.4, DM.5 | Elliptic sheaf; Normalized elliptic sheaf; Drinfeld elliptic-sheaf construction; Elliptic-sheaf shtuka realization |
| [DM.8](#layer-dm-8) | Rigid analytic motives, periods and Carlitz logarithms | 47 | DM.2, DM.4 | Rigid analytic triviality; Neutral Tannakian category; Difference Galois torsor; ABP lifting criterion; Period transcendence degree; Carlitz logarithm independence |

Within each layer, targets are numbered k.n in reading order, and each carries its packet id, so that the [suggested Lean file](../suggested/DrinfeldModulesAndTModules.lean) and the packets can be matched against this document. A **Needs** line lists direct prerequisites; **Used by** lists the targets of this roadmap that cite it. Text in the targets is the planned mathematics; nothing is implemented.

<a id="layer-dm-0"></a>

## Layer DM.0: Drinfeld modules, relative families and Carlitz arithmetic

A Drinfeld module over a field is an F-algebra map φ : A → L{τ} whose differential is γ and which is not the scalar map. The general rank theorem shows that deg_τ φ\_a = r·deg_A(a) for a unique integer r ≥ 1, without assuming that ∞ is rational; this is proved before rank is used for torsion or moduli. Over an arbitrary F-algebra the module lives on a line bundle, and a linear change of frame is distinguished from the nonlinear standardization needed over nonreduced bases. The Carlitz module and its products D_i and ℓ\_i fix the conventions used by every later layer.

<a id="dm-0-drinfeld-module"></a>

### 0.1 Drinfeld modules

**Target** `DrinfeldModulesAndTModules:DM.0/drinfeld-module` (definition). **Planet:** Drinfeld module.

Fix a finite field F of size q, a smooth projective geometrically connected curve C/F, a closed point ∞ of degree δ, A=Γ(C−∞,O_C), and an F-algebra field L with characteristic map γ:A→L. A Drinfeld module is an F-algebra map φ:A→L{τ} with ∂φ\_a=γ(a), not equal to the scalar map C∘γ. The q-Frobenius Ore ring and its identification with F-linear polynomial group endomorphisms are supplied by FF.4. The characteristic is ker γ; generic characteristic means γ injective. The rank theorem below supplies r rather than imposing a potentially circular definition.

**Hypotheses.** F finite; L field; A as specified, with exact constant field F.

**Proof route.**

- Import the FF.4 composition-ring comparison.
- Define the characteristic using the constant-coefficient homomorphism; evaluate on every commutative L-algebra to obtain the group-scheme action.
- Use the rank theorem to reconcile this field definition with constant positive rank.

**Needs:** `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-eval-linear`; `mathlib:RingHom.ker`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.3, p. 5: The survey gives the differential convention and permits rank zero; the positive-rank non-scalar condition is supplied by Hartl Definition 3.7.
- [HARTL-2017](#source-hartl-2017), Definition 3.7, p. 10: Positive rank excludes the scalar action.

**API.**

- **`DrinfeldModule.map`** (projection): The F-algebra map φ:A→L{τ}.
- **`DrinfeldModule.constantCoeff_map`** (simp): ∂φ\_a=γ(a).
- **`DrinfeldModule.charIdeal`** (data): charIdeal φ=ker γ.
- **`DrinfeldModule.baseChange`** (functoriality): Coefficient extension along an injective F-algebra field map carries φ to a Drinfeld module; identity and composition hold.
- **`DrinfeldModule.ext`** (extensionality): Over fixed coefficients and characteristic map, equality of every action polynomial gives equality of Drinfeld modules.

**Checks.**

- **`DrinfeldModule.test_carlitz`** (computation): For C_t=θ+τ, C_t(x)=θx+x^q.
- **`DrinfeldModule.test_scalar_rejected`** (non-example): The map a↦C(γ(a)) fails the non-scalar condition.
- **`DrinfeldModule.test_special_characteristic`** (degenerate): Over F, φ\_t=τ has characteristic (t), even though φ itself is injective.

**Acceptance.**

- C_t=θ+τ has characteristic evaluation at θ.
- The action on group-scheme points is natural in the value algebra.

**Uses.**

- DM.1: Forms torsion kernels.
- DM.4: Produces a one-dimensional abelian Anderson module.

**Used by:** [0.2](#dm-0-rank-polynomial-ring), [0.3](#dm-0-rank-general), [0.5](#dm-0-carlitz-module), [0.6](#dm-0-drinfeld-module-hom), [2.5](#dm-2-lattice-drinfeld-module), [4.1](#dm-4-t-module).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-rank-polynomial-ring"></a>

### 0.2 Rank over the polynomial ring

**Target** `DrinfeldModulesAndTModules:DM.0/rank-polynomial-ring` (theorem). **Planet:** Drinfeld rank.

For A=F\[t] and φ\_t=θ+g_1τ+⋯+g_rτ^r with g_r≠0, r≥1, every nonzero a∈F\[t] satisfies deg_τ φ\_a=r deg_t a. If d=deg a, its leading coefficient is lc(a)·g_r^(Σ\_{i=0}^{d−1}q^(ri)), with empty exponent sum zero.

**Hypotheses.** L field; φ a Drinfeld F\[t]-module.

**Proof route.**

- Expand a(φ\_t) using the polynomial algebra-map universal property.
- FF.4’s Ore multiplication gives the leading coefficient of each power.
- The maximal degree term is unique; field nonzero coefficients preclude cancellation.

**Needs:** [`DM.0/drinfeld-module`](#dm-0-drinfeld-module) (0.1); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; `mathlib:Polynomial.aeval`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.3, p. 5: The polynomial-ring rank is the τ-degree of the image of t.

**Acceptance.**

- For nonzero constants the degree is zero and leading coefficient is the constant.
- For C_t=θ+τ and a=t² the image is θ²+(θ+θ^q)τ+τ².

**Used by:** [0.4](#dm-0-rank), [0.5](#dm-0-carlitz-module).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-rank-general"></a>

### 0.3 The general rank theorem

**Target** `DrinfeldModulesAndTModules:DM.0/rank-general` (theorem).

For A=Γ(C−∞,O_C) with arbitrary δ=deg∞, a field Drinfeld A-module has a unique integer r≥1 such that deg_τφ\_a=r deg_A(a), where deg_A(a)=−δ ord∞(a)=log_q #(A/(a)), for all a≠0. A rational ∞ is not assumed. The assertion includes integrality of r.

**Hypotheses.** The curve and field hypotheses of drinfeld-module.

**Proof route.**

- τ-degree is additive on products and gives an infinity valuation on Frac(A).
- Import the function-ring degree and Riemann–Roch facts.
- Identify L{τ} with the finite projective A⊗F L motive of the one-dimensional module; its rank supplies the integer r. The final finite-projectivity/integrality input is recorded as a gap rather than inferred from proportional valuations alone.

**Needs:** [`DM.0/drinfeld-module`](#dm-0-drinfeld-module) (0.1); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Lemma 1.4, p. 4; Definition 3.7 and Theorem 3.9, pp. 10–12: The source normalizes degree by the residue-field degree at infinity and compares rank-r Drinfeld modules with dimension-one abelian Anderson modules.

**Acceptance.**

- The degree of a depends on δ.
- For F\[t], recover rank-polynomial-ring.

**Used by:** [0.4](#dm-0-rank), [2.6](#dm-2-uniformization).

**Open input:** [General rank integrality](#gap-general-rank-integrality).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-rank"></a>

### 0.4 The rank invariant

**Target** `DrinfeldModulesAndTModules:DM.0/rank` (construction).

Define rank φ as the unique r supplied by rank-general, normalized by log_q|A/(a)|. Its value is locally constant in relative families; over F\[t] it is the nonzero τ-degree of φ\_t.

**Hypotheses.** A and L as in drinfeld-module.

**Proof route.**

- Use uniqueness in rank-general to choose r.
- Field extension preserves nonzero leading coefficients and hence the degree formula.

**Needs:** [`DM.0/rank-general`](#dm-0-rank-general) (0.3); [`DM.0/rank-polynomial-ring`](#dm-0-rank-polynomial-ring) (0.2).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 3.7, p. 10: The leading-degree formula specifies the relative rank.

**API.**

- **`DrinfeldModule.rank`** (data): The integer r with deg_τφ\_a=r deg_A(a).
- **`DrinfeldModule.rank_pos`** (characterisation): 0&lt;rank φ.
- **`DrinfeldModule.rank_baseChange`** (functoriality): rank(baseChange φ)=rank φ.

**Checks.**

- **`DrinfeldModule.rank_test_carlitz`** (computation): rank(C)=1.
- **`DrinfeldModule.rank_test_tau_square`** (computation): rank(φ\_t=τ² over F)=2.
- **`DrinfeldModule.rank_test_infinity_degree`** (non-example): At a point ∞ of degree δ, using −ord∞(a) alone yields δr, and fails the normalization whenever δ>1. (stated here only)

**Acceptance.** The invariant is positive and unchanged by field extension.

**Uses.**

- DM.1: Sets the rank of the Tate module.
- DM.3: Specifies each moduli component.

**Used by:** [0.7](#dm-0-isogeny-rank).

**Suggested file.** The native rank signatures specialize to F\[t]. General A and the degree-δ normalization require the AlgebraicCurves Layers 2–3 function-ring contract and the integral-rank gap.

**Open input:** [General rank integrality](#gap-general-rank-integrality).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-carlitz-module"></a>

### 0.5 The Carlitz module

**Target** `DrinfeldModulesAndTModules:DM.0/carlitz-module` (construction). **Planet:** Carlitz module.

For θ∈L, C:F\[t]→L{τ} is the F-algebra map with C_t=θ+τ. Its characteristic is evaluation at θ, rank is one, and C_t acts as x↦θx+x^q. Generic characteristic holds exactly when θ is transcendental over F.

**Hypotheses.** L field containing F.

**Proof route.**

- Apply the polynomial algebra-map universal property to Cθ+τ.
- The constant coefficient is evaluation at θ; degree one proves the non-scalar property.

**Needs:** [`DM.0/drinfeld-module`](#dm-0-drinfeld-module) (0.1); [`DM.0/rank-polynomial-ring`](#dm-0-rank-polynomial-ring) (0.2); `mathlib:Polynomial.aeval`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.2, pp. 3–5: The modern Carlitz sign is plus τ; its exponential and torsion use this convention.

**API.**

- **`carlitz`** (constructor): The Drinfeld module C determined by C_t=θ+τ.
- **`carlitz_map_X`** (simp): C_t=Cθ+τ.
- **`carlitz_rank`** (compatibility): rank(C)=1.
- **`carlitz_constantCoeff`** (simp): ∂C_a=a(θ).

**Checks.**

- **`carlitz_test_square`** (computation): C_t²=θ²+(θ+θ^q)τ+τ².
- **`carlitz_test_theta_zero`** (degenerate): At θ=0, C_t=τ and C\[t]=Spec L\[X]/(X^q).
- **`carlitz_test_noncommuting`** (non-example): The τ-coefficient of C_t² is θ+θ^q, not 2θ unless θ^q=θ.

**Acceptance.** C_t²=θ²+(θ+θ^q)τ+τ².

**Uses.**

- DM.2: Fixes the exponential recurrence and period.
- DM.6: Tests the class formula and depth-one sums.

**Used by:** [0.11](#dm-0-carlitz-products), [6.2](#dm-6-integral-model).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-drinfeld-module-hom"></a>

### 0.6 Morphisms and isogenies

**Target** `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom` (definition). **Planet:** Drinfeld isogeny.

For φ and ψ over the same (L,γ), Hom(φ,ψ) consists of u∈L{τ} with uφ\_a=ψ\_a u for every a. It is an A-module through a·u=ψ\_a u=uφ\_a. Composition is Ore multiplication. A field isogeny is a nonzero such u; an isomorphism is a scalar u=Cc with c∈L×. End(φ) is an A-algebra, potentially noncommutative in special characteristic.

**Hypotheses.** Same A, coefficient field and characteristic map.

**Proof route.**

- Take the simultaneous equalizer of the intertwiners.
- Closure under addition and the A-action follows from commutation.
- The Ore degree theorem identifies units as invertible constants.

**Needs:** [`DM.0/drinfeld-module`](#dm-0-drinfeld-module) (0.1); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.3, p. 5; §2.4, pp. 6–7: Intertwining polynomials are the morphisms, and scalar conjugation describes isomorphisms.

**API.**

- **`DrinfeldModule.Hom`** (constructor): The intertwiner A-module.
- **`DrinfeldModule.Hom.comp`** (structure): v∘u=v u; identity is 1.
- **`DrinfeldModule.Hom.smul`** (simp): a·u=ψ\_a u.
- **`DrinfeldModule.isogeny_iff`** (characterisation): Over a field, u is an isogeny iff u≠0.
- **`DrinfeldModule.Hom.ext`** (extensionality): Two morphisms are equal when their underlying Ore polynomials agree.
- **`DrinfeldModule.Hom.id`** (constructor): The identity morphism is the Ore constant 1.
- **`DrinfeldModule.Hom.comp_assoc`** (structure): Composition of intertwiners is associative, with Hom.id as its two-sided identity.

**Checks.**

- **`Hom_test_identity`** (degenerate): 1 belongs to Hom(φ,φ).
- **`Hom_test_scalar_conjugation`** (compatibility): Cc∈Hom(φ,ψ) iff ψ\_a=Cc φ\_a C(c⁻¹), for c≠0.
- **`Hom_test_extra_endomorphism`** (computation): For φ\_t=τ² over F_{q²}, τ and every scalar in F_{q²} are endomorphisms; they need not commute.

**Acceptance.** Identity and composition satisfy category laws.

**Uses.**

- DM.5: Provides the source of the Tate comparison.
- DM.7: Requires bounded shifts on elliptic-sheaf morphisms.

**Used by:** [0.7](#dm-0-isogeny-rank), [0.8](#dm-0-kernel-scheme), [2.7](#dm-2-exponential-morphisms), [5.2](#dm-5-tate-hom-map), [5.6](#dm-5-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-isogeny-rank"></a>

### 0.7 Rank invariance and separability

**Target** `DrinfeldModulesAndTModules:DM.0/isogeny-rank` (theorem).

A nonzero intertwiner u:φ→ψ over a field forces rank φ=rank ψ. Its kernel has scheme order q^(deg_τu); it is étale iff ∂u≠0. In generic characteristic ∂u≠0 for every nonzero u. In special characteristic a Frobenius isogeny may have ∂u=0.

**Hypotheses.** φ and ψ have the same characteristic map.

**Proof route.**

- Compare τ-degrees in uφ\_a=ψ\_a u.
- FF.4 identifies the derivative of the kernel polynomial as ∂u.
- If the first nonzero coefficient has index i>0, commutation gives γ(a)^(q^i)=γ(a) for all a; generic γ(A) is infinite, a contradiction.

**Needs:** [`DM.0/drinfeld-module-hom`](#dm-0-drinfeld-module-hom) (0.6); [`DM.0/rank`](#dm-0-rank) (0.4); `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-separable-iff`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Lemma 3.8(b), p. 10; Corollaries 5.11 and 5.17, pp. 20 and 23: The source controls leading degrees and separability of isogenies.

**Acceptance.**

- τ:φ\_t=τ²→φ\_t=τ² over F is inseparable.
- A nonzero scalar has degree zero and trivial kernel.

**Used by:** [3.8](#dm-3-hecke-correspondence).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-kernel-scheme"></a>

### 0.8 Drinfeld kernel schemes

**Target** `DrinfeldModulesAndTModules:DM.0/kernel-scheme` (construction). **Planet:** Drinfeld kernel.

For a nonzero intertwiner u with q-linearized polynomial P_u, define ker(u)=Spec L\[X]/(P_u), with the inherited additive Hopf structure and A-action. It is the general affine group-scheme kernel already provided by Tau Ceti, specialized to the map u of G_a. Its coordinate algebra is free of rank q^(deg_τu); geometric points alone need not determine it.

**Hypotheses.** L field; u≠0; the kernel of the zero map is G_a and is not finite.

**Proof route.**

- Use FF.4 to obtain the additive group-scheme endomorphism.
- P_u is primitive, so its principal ideal is a Hopf ideal.
- Apply kernelSpec and divide by the invertible leading coefficient to obtain the monic basis 1,…,X^(q^deg−1).

**Needs:** [`DM.0/drinfeld-module-hom`](#dm-0-drinfeld-module-hom) (0.6); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; `tauceti:TauCeti.CommHopfAlgCat.kernelSpec`; `tauceti:TauCeti.AdditiveGroup.gaPointsMulEquiv`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 5.1, p. 15; §6, pp. 23–24: Isogenies have finite locally free scheme-theoretic kernels, and torsion uses these kernels.

**API.**

- **`DrinfeldKernel.coordinateAlgebra`** (constructor): L\[X]/(P_u).
- **`DrinfeldKernel.points`** (characterisation): For an L-algebra B, points are x∈B with P_u(x)=0.
- **`DrinfeldKernel.baseChange`** (functoriality): Kernel formation commutes with coefficient extension.

**Checks.**

- **`DrinfeldKernel_test_scalar`** (degenerate): ker(Cc)=Spec L for c≠0.
- **`DrinfeldKernel_test_frobenius`** (computation): ker(τ²)=Spec L\[X]/(X^(q²)); its order is q² and its geometric point set has size one.
- **`DrinfeldKernel_test_etale`** (compatibility): At θ≠0, ker(C_t) has order q and is étale.

**Acceptance.** Scheme order and root count agree only in the étale case.

**Uses.**

- DM.1: Principal ideal torsion is this kernel.
- DM.3: Level structures identify finite étale group schemes.

**Used by:** [1.1](#dm-1-ideal-torsion), [5.3](#dm-5-tate-injectivity).

**Suggested file.** Native affine quotient coordinates and points are given. Their closed group-scheme structure and natural base-change comparison import Tau Ceti Hopf kernels and the relative vector-group interface.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-relative-drinfeld-module"></a>

### 0.9 Relative Drinfeld modules

**Target** `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module` (definition). **Planet:** Relative Drinfeld module.

Over an A-scheme S, take the additive group of an invertible O_S-module E and a ring map φ:A→End_F(E) with differential γ. Locally in a linear trivialization, φ\_a=Σ b_i(a)τ^i; for a≠0 its highest nonzero degree is r deg_A(a), its coefficient is a unit, and all higher coefficients vanish. Rank r is positive and locally constant on S. Changes of linear frame by u∈O_S× send b_i to u^(1−q^i)b_i. The invertible sheaf and its vector group are imported from AlgebraicVectorBundles, not reconstructed.

**Hypotheses.** S an A-scheme; standard form; rank can vary between open-and-closed components.

**Proof route.**

- Import invertible sheaves, their pullbacks and relative vector groups.
- Glue the local Ore actions using the coefficient transformation law.
- Check the degree and differential conditions are invariant under linear frames.

**Needs:** `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`; `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`; `SchemeAndStackFoundations:SF.2/hilbert-90`.

**Sources.**

- [PINK-2012](#source-pink-2012), Definitions 3.1–3.2, p. 10; Proposition 3.4, pp. 11–12; Definition 3.5, p. 12: Pink specifies the line-bundle version in standard form, with fibrewise rank and coefficient conditions.

**API.**

- **`RelativeDrinfeldModule.pullback`** (functoriality): Pull back the line bundle and action along a map of A-schemes.
- **`RelativeDrinfeldModule.coeff_changeFrame`** (relation): b_i becomes u^(1−q^i)b_i.
- **`RelativeDrinfeldModule.rank_fiber`** (compatibility): The rank of each geometric fibre is the specified locally constant rank.
- **`RelativeDrinfeldModule.ext`** (extensionality): On a fixed invertible sheaf, two actions agree when their restrictions on every affine open agree for every a∈A. Families on different line bundles use a compatible line-bundle isomorphism. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`RelativeDrinfeldModule_test_field`** (compatibility): Over Spec L with E=O, recover the field definition and rank. (stated here only)
- **`RelativeDrinfeldModule_test_nonunit`** (non-example): φ\_t=θ+sτ over F\[θ,s] fails rank one at s=0 and is not a rank-one family on the whole base.
- **`RelativeDrinfeldModule_test_frame`** (computation): For rank-one C_t=θ+τ, a frame change by u gives θ+u^(1−q)τ.

**Acceptance.** The field fibre recovers drinfeld-module.

**Uses.**

- DM.3: Defines the moduli functor.
- DM.7: Descent of the one-dimensional underlying group.

**Used by:** [0.10](#dm-0-relative-standardization), [1.1](#dm-1-ideal-torsion), [3.2](#dm-3-moduli-functor), [3.4](#dm-3-generalized-drinfeld-module), [7.1](#dm-7-elliptic-sheaf).

**Suggested file.** Affine standard actions, actual frame conjugation and fibre rank are native. The full relative line-bundle vector group, twisted coefficient sheaves and scheme pullbacks use the existing bundle supplier.

**Open input:** [Native geometric and analytic signature integration](#gap-native-geometric-and-analytic-signature-integration).

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`; `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l2b--geometric-vector-bundles`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-relative-standardization"></a>

### 0.10 Standardization over nonreduced bases

**Target** `DrinfeldModulesAndTModules:DM.0/relative-standardization` (theorem).

The relative definition that allows nilpotent coefficients above r deg_A(a) is equivalent to the standard line-bundle definition: locally a unique additive coordinate change with constant coefficient one removes the higher nilpotent terms. Between standard forms, invertible intertwining coordinate changes are scalar. This theorem is required before treating arbitrary additive coordinates as linear frames.

**Hypotheses.** Positive rank; affine local charts; nilpotent higher coefficients as in Hartl Definition 3.7.

**Proof route.**

- Use the standardization input of Hartl Lemma 3.8(a).
- For a standard intertwiner compare its top coefficient in the commutation relation as in Lemma 3.8(b).
- Scalar transition cocycles give the invertible sheaf by descent.

**Needs:** [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9); `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 3.7 and Lemma 3.8, p. 10; Theorem 3.9, pp. 10–12: The source distinguishes nilpotent higher terms from standard form and derives linear transitions.

**Acceptance.** Over dual numbers, (1+ετ) conjugates a standard family to a possibly nonstandard one; this is not a linear frame.

**Used by:** [3.3](#dm-3-fine-moduli-scheme), [7.3](#dm-7-drinfeld-to-sheaf).

**Suggested file.** The unique nonlinear nilpotent Ore conjugation is a mathematical target. Its native relative automorphism signature is omitted until the standardization proof and line-bundle interface are fixed.

**Open input:** [Nilpotent-base standardization](#gap-nilpotent-base-standardization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-carlitz-products"></a>

### 0.11 Carlitz denominator products

**Target** `DrinfeldModulesAndTModules:DM.0/carlitz-products` (construction).

For A=F\[θ], set \[i]=θ^(q^i)−θ, D_0=ℓ\_0=1, D_i=∏\_{j=0}^{i−1}(θ^(q^i)−θ^(q^j)) and ℓ\_i=∏\_{j=1}^i(θ−θ^(q^j)). Then D_i=\[i]D_{i−1}^q and ℓ\_i=−\[i]ℓ\_{i−1} for i≥1. These are polynomial identities; inverse denominators require transcendental θ or localization.

**Hypotheses.** F finite; θ an indeterminate for nonvanishing claims.

**Proof route.**

- Expand the products and use q-power Frobenius.
- Keep the sign in ℓ\_i distinct from the unsigned product of \[j].

**Needs:** [`DM.0/carlitz-module`](#dm-0-carlitz-module) (0.5); `mathlib:FiniteField.frobeniusAlgHom`.

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), §2.2, p. 7; §4.2, p. 17: These products normalize Carlitz factorials and the depth-one power sums.

**API.**

- **`carlitzBracket`** (constructor): \[i]=θ^(q^i)−θ.
- **`carlitzD`** (constructor): The product D_i, with D_0=1.
- **`carlitzEll`** (constructor): The signed product ℓ\_i, with ℓ\_0=1.
- **`carlitzD_succ`** (relation): D_(i+1)=\[i+1]D_i^q.
- **`carlitzEll_succ`** (relation): ℓ\_(i+1)=−\[i+1]ℓ\_i.

**Checks.**

- **`carlitzProducts_test_zero`** (degenerate): D_0=ℓ\_0=1 and \[0]=0.
- **`carlitzProducts_test_two`** (computation): D_2=(θ^(q²)−θ)(θ^(q²)−θ^q).
- **`carlitzProducts_test_sign`** (non-example): ℓ\_1=−D_1, which differs from D_1 in odd characteristic.

**Acceptance.** D_1=θ^q−θ and ℓ\_1=θ−θ^q.

**Uses.**

- DM.2: Exponential and logarithm coefficients.
- DM.6: Γ\_n and S_d(s) normalizations.

**Used by:** [2.8](#dm-2-carlitz-exponential), [6.12](#dm-6-small-power-sum).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-1"></a>

## Layer DM.1: Ideal torsion, Tate modules and characteristic completion

Torsion is scheme-theoretic: the I-torsion of a rank-r module is finite locally free of degree #(A/I)^r for every nonzero ideal I, principal or not, and it is étale exactly when γ(I) generates the unit ideal of the base. Tate modules use primes λ away from the characteristic and carry a continuous Galois action. At the characteristic place the connected part of the torsion is invisible in separable points, so the realization there is an effective local shtuka with its own Frobenius and dimension bound, obtained by completing the motive; this layer uses the effective A-motives of DM.4.

<a id="dm-1-ideal-torsion"></a>

### 1.1 Ideal torsion

**Target** `DrinfeldModulesAndTModules:DM.1/ideal-torsion` (construction). **Planet:** Drinfeld torsion.

For a nonzero ideal I⊂A and a relative rank-r Drinfeld module E/S, define E\[I]=⋂\_{a∈I}ker φ\_a as an A-stable closed subgroup scheme. Finite generators give the same scheme independent of their choice. E\[A] is the zero group; E\[(a)]=ker φ\_a. Coprime ideals give E\[IJ]≅E\[I]×E\[J].

**Hypotheses.** I nonzero; S an A-scheme; E relative in standard form.

**Proof route.**

- On affine charts quotient O_S\[X] by the q-polynomials for generators of I.
- Use additive intertwiners and the ideal identity to prove independence.
- Bézout idempotents give the Chinese-remainder splitting.

**Needs:** [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9); [`DM.0/kernel-scheme`](#dm-0-kernel-scheme) (0.8); `mathlib:Ideal.span`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 6.1, p. 23; Lemma 6.3, p. 24: The source defines ideal torsion and establishes principal and coprime-ideal comparisons.

**API.**

- **`DrinfeldModule.idealTorsion`** (constructor): The closed subgroup E\[I].
- **`DrinfeldModule.idealTorsion_principal`** (compatibility): E\[(a)]=ker φ\_a.
- **`DrinfeldModule.idealTorsion_baseChange`** (functoriality): Base change of E\[I] equals the I-torsion of the pulled-back family.
- **`DrinfeldModule.idealTorsion_crt`** (equivalence): For I+J=A, E\[IJ]≅E\[I]×E\[J].

**Checks.**

- **`idealTorsion_test_unit`** (degenerate): E\[A] is the zero group scheme of order one.
- **`idealTorsion_test_carlitz`** (computation): C\[(t)]=Spec L\[X]/(θX+X^q).
- **`idealTorsion_test_scheme_points`** (non-example): At θ=0 this scheme has length q, although its geometric points form the zero group.

**Acceptance.** The unit ideal has degree one, not zero.

**Uses.**

- DM.1: Forms the λ-power inverse system.
- DM.3: Defines level structures as scheme isomorphisms.

**Used by:** [1.2](#dm-1-finite-flat-torsion), [3.1](#dm-3-level-structure), [3.8](#dm-3-hecke-correspondence), [5.6](#dm-5-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-finite-flat-torsion"></a>

### 1.2 Finite locally free torsion

**Target** `DrinfeldModulesAndTModules:DM.1/finite-flat-torsion` (theorem). **Planet:** Finite flat torsion theorem.

E\[I] is finite locally free over S of degree #(A/I)^r for every nonzero ideal I. This holds without I being principal and without invertibility of γ(I). The corresponding effective motive satisfies Dr_q(M/IM)≅E\[I] in the finite-shtuka/strict-group comparison.

**Hypotheses.** E rank r; I nonzero.

**Proof route.**

- For principal I use the monic q-polynomial quotient basis.
- For arbitrary I use the finite-shtuka comparison for the finite locally free O_S-module M/IM.
- Hartl Theorem 6.4 gives flatness; geometric fibres and the Dedekind ideal norm give the degree.

**Needs:** [`DM.1/ideal-torsion`](#dm-1-ideal-torsion) (1.1); [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 6.4 and proof, pp. 24–26: This is the finite locally free ideal-torsion theorem and motive comparison.

**Acceptance.**

- A nonprincipal ideal still has degree #(A/I)^r.
- At characteristic, flatness does not imply étaleness.

**Used by:** [1.3](#dm-1-etale-torsion).

**Suggested file.** Principal affine coordinates are native; the nonprincipal finite locally free group-scheme degree uses the strict finite-shtuka supplier.

**Open input:** [Strict finite F-module / finite-shtuka realization](#gap-strict-finite-f-module-finite-shtuka-realization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-etale-torsion"></a>

### 1.3 The prime-to-characteristic condition

**Target** `DrinfeldModulesAndTModules:DM.1/etale-torsion` (theorem).

E\[I] is étale over S iff γ(I)O_S=O_S. Over a field this means I is coprime to ker γ. For a principal ideal the derivative is γ(a). An isogeny has an invertible differential exactly when its kernel is étale.

**Hypotheses.** Nonzero I; E a relative Drinfeld module.

**Proof route.**

- Use the conormal or co-Lie description in the finite-shtuka comparison.
- For a principal generator compute the q-polynomial derivative by FF.4.
- Localize on S to reduce the ideal condition to a generator with unit image.

**Needs:** [`DM.1/finite-flat-torsion`](#dm-1-finite-flat-torsion) (1.2); `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-separable-iff`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 6.4(b) and proof, pp. 24–26: Invertibility of the characteristic ideal image characterizes étaleness.

**Acceptance.** For C_t=τ at θ=0, t-torsion is connected; (t−1)-torsion is étale.

**Used by:** [1.4](#dm-1-geometric-torsion-basis), [1.6](#dm-1-continuous-galois-action), [3.1](#dm-3-level-structure), [5.6](#dm-5-tate-image-saturation).

**Suggested file.** Derivative and principal polynomial tests are native. The full relative finite-étale morphism theorem uses the scheme-level torsion interface.

**Open input:** [Strict finite F-module / finite-shtuka realization](#gap-strict-finite-f-module-finite-shtuka-realization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-geometric-torsion-basis"></a>

### 1.4 Geometric torsion bases

**Target** `DrinfeldModulesAndTModules:DM.1/geometric-torsion-basis` (theorem).

If I is prime to the characteristic and Ω is a separably closed coefficient field, E\[I](Ω) is a free A/I-module of rank r. For its motive, (M/IM)^τ is free of the same rank; the realization of E\[I] is its finite-field dual, with the dualizing A/I-module Hom_F(A/I,F) made explicit.

**Hypotheses.** I nonzero and γ(I) generates the unit ideal.

**Proof route.**

- Hartl Lemma 6.5 supplies Frobenius frames using Lang’s morphism for restriction of scalars of GL_r.
- Apply the perfect pairing of Theorem 6.6; use the finite-field trace dual rather than identifying variance silently.

**Needs:** [`DM.1/etale-torsion`](#dm-1-etale-torsion) (1.3); [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Proposition 6.5 and Theorem 6.6, p. 26: The source proves freeness and the duality of torsion with motive invariants.

**Acceptance.**

- Rank r gives #(A/I)^r geometric points.
- The assertion is false at the characteristic prime.

**Used by:** [1.5](#dm-1-tate-module), [3.1](#dm-3-level-structure), [5.3](#dm-5-tate-injectivity).

**Suggested file.** The full nonprincipal ideal-quotient basis and finite-shtuka dualizing pairing require the shared strict finite-group realization interface.

**Open input:** [Strict finite F-module / finite-shtuka realization](#gap-strict-finite-f-module-finite-shtuka-realization).

**Open input:** [Finite étale torsion bases and compatible limits](#gap-finite-tale-torsion-bases-and-compatible-limits).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-tate-module"></a>

### 1.5 Drinfeld Tate modules

**Target** `DrinfeldModulesAndTModules:DM.1/tate-module` (construction). **Planet:** Drinfeld Tate module.

For a nonzero prime λ≠ker γ, put A_λ=lim A/λ^n and define the λ-adic Tate module from the λ-power torsion over L^sep. For general A use the canonical division-module description Hom_A(K_λ/A_λ,E\[λ^∞](L^sep)), or identify it with the inverse system after choosing a local uniformizer and proving independence of that choice. Transition maps are not multiplication by a nonexistent global generator of a nonprincipal ideal. T_λE is free of rank r over A_λ; V_λE=Frac(A_λ)⊗T_λE.

**Hypotheses.** λ a nonzero prime away from characteristic; K_λ=Frac(A_λ).

**Proof route.**

- Use geometric-torsion-basis at λ^n.
- Surjectivity of division maps and compatible lifted bases give the completed free module.
- Identify coordinate choices with the canonical division-module model.

**Needs:** [`DM.1/geometric-torsion-basis`](#dm-1-geometric-torsion-basis) (1.4); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [STALDER-2008](#source-stalder-2008), Definitions 2.26 and Proposition 2.28, pp. 12–14: Motive Tate modules are Frobenius invariants; the Drinfeld torsion realization uses their dual.

**API.**

- **`DrinfeldModule.tateModule`** (constructor): The canonical A_λ-module T_λE.
- **`DrinfeldModule.tateModule_mod`** (compatibility): T_λE/λ^nT_λE≅E\[λ^n](L^sep), with the division-coordinate convention fixed.
- **`DrinfeldModule.tateMap`** (functoriality): u acts on torsion and induces T_λu; identity and composition hold.
- **`DrinfeldModule.tateModule_rank`** (characterisation): T_λE is free of rank rank E.
- **`DrinfeldModule.tateModule.lift`** (universal-property): A compatible system of λ^n-torsion points defines an element of T_λE, uniquely determined by its finite-level coordinates. The native lift uses a principal ell coordinate. (a coordinate model in the suggested file)
- **`DrinfeldModule.tateModule.ext`** (extensionality): Elements of the Tate inverse limit agree if all finite-level coordinates agree.

**Checks.**

- **`tateModule_test_carlitz`** (computation): For C and λ≠char, rank_Aλ T_λC=1.
- **`tateModule_test_tau_square`** (computation): For φ\_t=τ² over F and λ=(t−1), rank T_λφ=2.
- **`tateModule_test_isogeny`** (compatibility): A nonzero isogeny induces an injection with finite torsion cokernel, hence a rational Tate isomorphism.
- **`tateModule_test_char_rejected`** (non-example): For φ\_t=τ, the t-power separable torsion is zero; it cannot be a rank-one t-adic Tate module.

**Acceptance.** For a principal λ=(ℓ), points satisfy φ\_ℓ(x_(n+1))=x_n.

**Uses.**

- DM.5: Tate Hom comparison.
- DM.7: Elliptic-sheaf realization comparison.

**Used by:** [1.6](#dm-1-continuous-galois-action), [5.1](#dm-5-rational-motive-realization), [5.2](#dm-5-tate-hom-map), [7.6](#dm-7-tate-realization).

**Suggested file.** The native inverse limit uses a chosen element ell; the quotient and rank signatures specialize to principal prime ideals. The full A_lambda action and nonprincipal division-coordinate independence need AlgebraicCurves completion and finite-shtuka limits.

**Open input:** [Finite étale torsion bases and compatible limits](#gap-finite-tale-torsion-bases-and-compatible-limits).

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-continuous-galois-action"></a>

### 1.6 The continuous Tate representation

**Target** `DrinfeldModulesAndTModules:DM.1/continuous-galois-action` (construction). **Planet:** Tate Galois representation.

The natural G_L-action on T_λE is A_λ-linear and continuous for the inverse-limit topology. It gives ρ\_λ:G_L→Aut_Aλ(T_λE), and a choice of basis gives GL_r(A_λ). Modulo λ^n its action is the finite torsion action; each stabilizer is open because a finite separable extension splits that torsion.

**Hypotheses.** L a coefficient field; λ away from characteristic.

**Proof route.**

- The finite étale coordinate algebra produces finite continuous Galois sets.
- Take compatible actions in the inverse limit and use the inverse-limit basis of neighborhoods.
- Naturality of torsion maps makes every T_λu equivariant.

**Needs:** [`DM.1/tate-module`](#dm-1-tate-module) (1.5); [`DM.1/etale-torsion`](#dm-1-etale-torsion) (1.3); `SchemeAndStackFoundations:SF.2/etale-galois-comparison`.

**Sources.**

- [PAPIKIAN-2017](#source-papikian-2017), §3.2, pp. 12–14: Finite torsion representations and their Tate limit carry the Galois action.

**API.**

- **`DrinfeldModule.tateGaloisAction`** (structure): The continuous A_λ-linear G_L-action.
- **`DrinfeldModule.tateGaloisAction_mod`** (compatibility): Reduction modulo λ^n agrees with the torsion action.
- **`DrinfeldModule.tateMap_equivariant`** (functoriality): T_λu commutes with G_L.

**Checks.**

- **`tateGaloisAction_test_sepclosed`** (degenerate): For separably closed L, the Galois action is trivial.
- **`tateGaloisAction_test_finite_field`** (computation): Over F_{q^m}, arithmetic Frobenius acts on torsion by x↦x^(q^m).
- **`tateGaloisAction_test_basis`** (compatibility): Changing a Tate basis by B replaces every action matrix R by B⁻¹RB.

**Acceptance.** A basis change conjugates ρ; the representation is intrinsically basis free.

**Uses.**

- DM.5: Forms equivariant Hom and tests the Frobenius centralizer.

**Used by:** [5.2](#dm-5-tate-hom-map), [7.6](#dm-7-tate-realization).

**Suggested file.** Coefficient automorphism actions and their coordinate equivariance are native. The continuous absolute-Galois representation, topology and completed coefficient-module action require AlgebraicCurves completion and the finite-shtuka limit interface.

**Open input:** [Finite étale torsion bases and compatible limits](#gap-finite-tale-torsion-bases-and-compatible-limits).

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-characteristic-local-realization"></a>

### 1.7 The characteristic-place realization

**Target** `DrinfeldModulesAndTModules:DM.1/characteristic-local-realization` (construction). **Planet:** Characteristic local shtuka.

Fix a characteristic prime p, residue field F_p of size qhat=q^f, an F_p-algebra R, and a characteristic map A→R whose local uniformizer image is nilpotent. Complete the rank-r, dimension-one effective A-motive of a Drinfeld module at p. Split F_p⊗F R into its f coefficient factors and take the distinguished characteristic factor; τ^f induces a qhat-Frobenius linearization on a locally free R\[\[z]]-module of rank r. It becomes invertible after z−γ(z) is inverted and has a cokernel locally free of rank one over R and annihilated by z−γ(z), inherited from dimension one. The finite reductions correspond to p-power strict finite group schemes, including the connected part. The equal-characteristic local-shtuka and strict finite-group comparison inputs are recorded as gaps; HS2 does not supply this category.

**Hypotheses.**

- The coefficient splitting, nilpotent characteristic parameter and finite locally free motive are required.
- The F_p→R coefficient embedding is the one induced by the completed characteristic map and gives the distinguished residue factor. Freeness holds only after a local frame is chosen.

**Proof route.**

- Apply the completion and coefficient-factor decomposition of Hartl §7.
- Iterate Frobenius f times to return to the characteristic factor.
- Compare the finite reductions by the finite-shtuka functor, keeping the connected–étale decomposition separate from separable points.

**Needs:** [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 7.1 and Example 7.2, p. 27; Theorems 7.4 and 7.6, p. 28: The local object uses a residue-degree Frobenius and a distinguished coefficient factor.

**API.**

- **`DrinfeldModule.charLocalRealization`** (constructor): The distinguished completed module with τ^f. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModule.charLocalRealization_rank`** (compatibility): Its R\[\[z]]-rank is r. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModule.charLocalRealization_mod`** (compatibility): The finite reductions realize the full characteristic torsion group schemes. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`charLocal_test_supersingular`** (computation): For φ\_t=τ² over F, φ\[t^n]=Spec F\[X]/(X^(q^(2n))) is connected of order q^(2n).
- **`charLocal_test_residue_degree`** (non-example): For degree-f p, the characteristic factor is preserved by τ^f, generally not by τ.
- **`charLocal_test_points_insufficient`** (non-example): Replacing φ\[t^n] by its separable points turns all these connected kernels into the zero group.

**Acceptance.** For φ\_t=τ² and p=(t), the p-power kernels retain nonzero scheme length despite having one geometric point.

**Uses.**

- DM.7: The characteristic local comparison retains the effective bound.

**Used by:** [7.7](#dm-7-characteristic-comparison).

**Suggested file.** The connected affine kernels and a residue-degree Frobenius calculation are native tests. The completed characteristic factor, bound and finite-shtuka comparison require the equal-characteristic local-shtuka and strict finite-group gaps; no separable-point representation replaces them.

**Open input:** [Native geometric and analytic signature integration](#gap-native-geometric-and-analytic-signature-integration).

**Open input:** [Strict finite F-module / finite-shtuka realization](#gap-strict-finite-f-module-finite-shtuka-realization).

**Open input:** [Equal-characteristic effective local-shtuka input](#gap-equal-characteristic-effective-local-shtuka-input).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-2"></a>

## Layer DM.2: Analytic uniformization and period conventions

C∞ is normalized by |a| = q^(deg_A a). An A-lattice is a finitely generated projective A-submodule of C∞ with finitely many elements in each bounded ball; mere discreteness is not enough. Lattice exponentials are infinite products, taken as limits over finite F-subspaces; the lattice-to-module construction and uniformization identify rank-r Drinfeld modules over C∞ in generic characteristic with rank-r lattices up to homothety. The Carlitz exponential, logarithm, period and the function Ω pin the signs and normalizations that DM.6 and DM.8 use.

The coefficient Frobenius twist on power series, first planned with DM.8, sits in this layer: Ω and the dual motives of DM.4 are stated with it, and DM.8 uses it throughout. Its id `DrinfeldModulesAndTModules:DM.8/coefficient-twist` is unchanged.

<a id="dm-8-coefficient-twist"></a>

### 2.1 Coefficient Frobenius twist

**Target** `DrinfeldModulesAndTModules:DM.8/coefficient-twist` (construction).

For a perfect coefficient field C of characteristic p, q=p^m with m≥1, σ\_C is the inverse of the m-fold p-Frobenius. Its coefficientwise extension to C\[\[t]] is a ring automorphism fixing t. Write f^(n)=σ^(−n)(f) for n∈Z. Extend it entrywise to matrices and to the σ-stable polynomial, entire and restricted-series rings and their fraction fields. In particular twisting never raises the variable t to a q-th power.

**Proof route.**

- Use the native iterated Frobenius equivalence and its inverse on coefficients.
- Apply the native power-series coefficient map and prove its inverse by coefficient extensionality. Restrictedness is preserved because coefficient norms are raised to the positive power 1/q; fraction-ring extension is by its universal property.

**Needs:** `mathlib:iterateFrobeniusEquiv`; `mathlib:PowerSeries.map`.

**Sources.**

- [PAP-v2](#source-pap-v2), §2.2.5 pp.7–8: Coefficient q-Frobenius and its integer iterates act on series while leaving the variable t fixed; the negative iterate is inverse coefficient Frobenius. This is the convention used in the difference equation and is represented by the native ring automorphism, not substitution t↦t^q.
- [ABP-v1](#source-abp-v1), §2.2 p.6: The source defines coefficient q-Frobenius on formal series and its integer twists, leaving t fixed; the (-1)-twist is its inverse. This supplies the operator used in the ABP equation.
- [IKLNP-v2](#source-iklnp-v2), §2.1 p.26: The consumer sets f^(n) by twisting coefficients through q^n while fixing t, and states its lifting equation with (-1). This independently checks the shared inverse-Frobenius convention, not a new twist construction.
- [ABP-published](#source-abp-published), §2.2 p.244: The published coefficient-twist definition agrees with the preprint: integer coefficient Frobenius fixes t, and (-1) denotes the inverse. Its normalization supports the same native automorphism here.

**API.**

- **`TauCeti.Difference.Periods.twist_coeff`** (simp): The n-th coefficient of σ(f) is σ\_C of the n-th coefficient of f.
- **`TauCeti.Difference.Periods.twist_X`** (simp): σ(t)=t.
- **`TauCeti.Difference.Periods.twist_C`** (simp): σ(C(a))=C(σ\_C(a)).
- **`TauCeti.Difference.Periods.twist_mul`** (compatibility): σ(fg)=σ(f)σ(g), and entrywise twist commutes with matrix multiplication.
- **`TauCeti.Difference.Periods.twist_inverse`** (equivalence): The coefficient map of σ\_C inverse is inverse to σ on series.

**Checks.**

- **`TauCeti.Difference.Periods.test_coefficient_twist_1`** (computation): The series t is fixed, including in positive characteristic.
- **`TauCeti.Difference.Periods.test_coefficient_twist_2`** (computation): For an element a not fixed by σ\_C, the constant series C(a) is not fixed.
- **`TauCeti.Difference.Periods.test_coefficient_twist_3`** (non-example): The coefficient twist of (t−a)(t−b) is (t−σ\_C(a))(t−σ\_C(b)); this distinguishes coefficient twist from substituting t^q.

**Acceptance.**

- The series t is fixed, including in positive characteristic.
- For an element a not fixed by σ\_C, the constant series C(a) is not fixed.
- The coefficient twist of (t−a)(t−b) is (t−σ\_C(a))(t−σ\_C(b)); this distinguishes coefficient twist from substituting t^q.

**Uses.**

- CCM §4.1 p.13; IKLNP §2.1 p.26: Provides one shared twist interface for every displayed difference equation.

**Used by:** [2.10](#dm-2-omega), [4.8](#dm-4-inverse-twist-dual-motive), [4.9](#dm-4-star-adapter), [8.12](#dm-8-twisting-limit), [8.13](#dm-8-analytic-fixed-fields), [8.16](#dm-8-fundamental-matrix), [8.33](#dm-8-entire-from-equation), [8.35](#dm-8-abp-lifting), [8.39](#dm-8-carlitz-deformation), [8.47](#dm-8-constant-denominator).

**Placement.** Layer DM.2 since the assembly ASM-DrinfeldModulesAndTModules: DM.2/omega, DM.4/inverse-twist-dual-motive and DM.4/star-adapter use this twist, so placing it in DM.8 made DM.2 and DM.4 depend on DM.8 while DM.8 depends on both. The id and the mathematics are unchanged.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.twistSeries`.

<a id="dm-2-c-infinity"></a>

### 2.2 The analytic coefficient field

**Target** `DrinfeldModulesAndTModules:DM.2/c-infinity` (construction). **Planet:** C infinity.

Let K=Frac(A), K_∞ its completion at ∞, choose its real-valued absolute value normalized by |a|=q^(deg_A(a)), and extend it to an algebraic closure. C_∞ is the completion of that normed algebraic closure. It is a complete algebraically closed nonarchimedean field of characteristic p containing K; for F\[θ] and rational ∞, |θ|=q. The choice of norm extension is unique up to the appropriate isometric K_∞-isomorphism.

**Hypotheses.** A as in DM.0; fixed norm extension and completion.

**Proof route.**

- Import the normalized completion from AlgebraicCurves Layer 5 and the explicit extending-norm input recorded in the completed-coefficient gap.
- Use the spectral norm for algebraic extensions.
- For algebraic closedness in characteristic p, first prove perfectness of the completion by Cauchy p-th roots, then apply the simple-root perturbation/Krasner argument of Crew Corollary 1.2.8.5. Do not apply a characteristic-zero Mathlib theorem.

**Needs:** `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`; `mathlib:UniformSpace.Completion`; `mathlib:NormedField.instCompletableTopField`.

**Sources.**

- [CREW-2019](#source-crew-2019), Proposition 1.2.8.4 and Corollary 1.2.8.5, pp. 34–35: The completion argument applies in positive characteristic; the perturbation step uses separable roots.

**API.**

- **`CInfty`** (constructor): Completion of the normed algebraic closure of K_∞.
- **`CInfty.norm_algebraMap`** (compatibility): The embedding preserves the chosen norm on K_∞.
- **`CInfty.isAlgClosed`** (instance): C_∞ is algebraically closed.
- **`CInfty.complete`** (instance): C_∞ is complete.

**Checks.**

- **`CInfty_test_theta`** (computation): For F\[θ], ‖θ‖=q.
- **`CInfty_test_qroot`** (characterisation): Every c∈C_∞ has a unique q-th root.
- **`CInfty_test_generic`** (non-example): No nonzero a∈A maps to zero; a finite coefficient field is not a substitute for C_∞.

**Acceptance.** The embedding A→C_∞ has generic characteristic.

**Uses.**

- DM.2: Convergence and surjectivity of exponential functions.
- DM.8: Analytic coefficient field for periods and twists.

**Used by:** [2.3](#dm-2-a-lattice), [4.6](#dm-4-uniformizability), [8.10](#dm-8-entire-series), [8.11](#dm-8-tate-analytic-interface), [8.14](#dm-8-analytic-separability).

**Suggested file.** The native type is the uniform completion of an algebraic closure equipped with an explicitly supplied extending norm. AlgebraicCurves Layer 5 supplies the normalized infinity field; the extending norm remains an input in the completed-coefficient gap. No new completion type is planned.

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-a-lattice"></a>

### 2.3 Projective A-lattices

**Target** `DrinfeldModulesAndTModules:DM.2/a-lattice` (definition). **Planet:** Drinfeld lattice.

An A-lattice in C_∞ is a finitely generated projective A-submodule Λ⊂C_∞ of positive rank such that {λ∈Λ:‖λ‖≤R} is finite for each finite R≥0. Its rank is the dimension of K⊗AΛ. In the category of lattices of a fixed positive rank r, morphisms are scalars c∈C_∞ with cΛ⊂Λ′; isomorphisms are homotheties by nonzero c. Bounded-ball finiteness is required; mere topological discreteness is insufficient.

**Hypotheses.** Generic embedding A⊂C_∞; A Dedekind.

**Proof route.**

- Use the native Submodule, Module.Finite and Module.Projective notions.
- Finite generation and torsion-freeness over Dedekind A give projectivity.
- Define the scalar morphism category and homothety relation.

**Needs:** [`DM.2/c-infinity`](#dm-2-c-infinity) (2.2); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.4, pp. 6–7: The lattice correspondence uses finite projective modules and scalar homotheties.

**API.**

- **`ALattice`** (constructor): A positive-rank projective A-submodule with finite bounded intersections.
- **`ALattice.rank`** (data): dim_K(K⊗AΛ).
- **`ALattice.scale`** (functoriality): cΛ is a lattice for c≠0.
- **`ALattice.quotient_card`** (relation): For a≠0, #(a⁻¹Λ/Λ)=#(A/(a))^(rank Λ).
- **`ALattice.ext`** (extensionality): Two lattices with the same submodule carrier are equal; finiteness and projectivity are proof data.

**Checks.**

- **`ALattice_test_principal`** (computation): For A=F\[θ], A is a rank-one lattice.
- **`ALattice_test_nonprincipal`** (compatibility): For a nonprincipal ideal I⊂A embedded in K_∞, I is a rank-one projective lattice and is not free as an A-module. (stated here only)
- **`ALattice_test_discrete_constants`** (non-example): The algebraic closure of F inside C_∞ is discrete but has infinitely many elements of norm one; it fails the bounded-ball condition.

**Acceptance.**

- Nonprincipal ideal lattices must be accepted.
- A scalar inclusion between different ranks is not admitted as a morphism in the fixed-rank uniformization category; finite index must not be inferred from such an inclusion.

**Uses.**

- DM.2: Weierstrass product and inverse uniformization.
- DM.6: The unit lattice is in K_∞-type spaces with the same discrete/cocompact distinction.

**Used by:** [2.4](#dm-2-lattice-exponential), [2.9](#dm-2-carlitz-period).

**Suggested file.** The native positive-rank finite projective submodule uses finite bounded-ball intersections. Principal and algebraic-constant tests are stated. The nonprincipal ideal example needs the AlgebraicCurves Layers 2–3 function ring and AlgebraicCurves completion embedding and norm data.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-lattice-exponential"></a>

### 2.4 Lattice exponential

**Target** `DrinfeldModulesAndTModules:DM.2/lattice-exponential` (construction). **Planet:** Drinfeld exponential.

For an A-lattice Λ define e_Λ(z)=z∏\_{0≠λ∈Λ}(1−z/λ), as the limit over finite F-subspaces exhausting Λ. It is an entire F-linear function with derivative one and kernel exactly Λ. The product converges uniformly on every bounded disk, and e_Λ is surjective on C_∞.

**Hypotheses.** Λ an A-lattice; C_∞ as constructed above.

**Proof route.**

- Finite subspace polynomials from FF.4 give normalized additive partial products.
- Bounded-ball finiteness makes each tail factor uniformly approach one.
- The analytic zero/product and nonarchimedean Newton-polygon input gives the kernel and surjectivity. This analytic input is requested explicitly.

**Needs:** [`DM.2/a-lattice`](#dm-2-a-lattice) (2.3); `FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`; `mathlib:PowerSeries.IsRestricted.subring`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.4 and Theorem 2.1, pp. 6–7: The normalized product constructs the exponential in the Drinfeld–lattice correspondence.

**API.**

- **`ALattice.exp`** (constructor): The entire normalized product e_Λ.
- **`ALattice.exp_add`** (structure): e_Λ(x+y)=e_Λ(x)+e_Λ(y), and e_Λ(cx)=c e_Λ(x) for c∈F.
- **`ALattice.exp_ker`** (characterisation): e_Λ(z)=0 iff z∈Λ.
- **`ALattice.exp_scale`** (functoriality): e_(cΛ)(cz)=c e_Λ(z) for c≠0.
- **`ALattice.exp_smul`** (structure): For a compatible scalar tower F→A→C_∞, e_Λ(cx)=c e_Λ(x) for c∈F.

**Checks.**

- **`latticeExp_test_derivative`** (characterisation): The coefficient of z is one.
- **`latticeExp_test_kernel`** (compatibility): For nonzero λ∈Λ, e_Λ(λ)=0, while e_Λ(z)≠0 for z∉Λ.
- **`latticeExp_test_scaling`** (computation): Replacing Λ by cΛ conjugates the exponential by z↦cz; omitting its initial z factor fails the derivative test.

**Acceptance.** e_(cΛ)(cz)=c e_Λ(z).

**Uses.**

- DM.2: Constructs φ\_Λ and identifies morphisms.

**Used by:** [2.5](#dm-2-lattice-drinfeld-module).

**Open input:** [Analytic surjectivity and general-A kernel rank](#gap-analytic-surjectivity-and-general-a-kernel-rank).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-lattice-drinfeld-module"></a>

### 2.5 The module of a lattice

**Target** `DrinfeldModulesAndTModules:DM.2/lattice-drinfeld-module` (construction).

For a≠0, define φ^Λ\_a(X)=aX∏\_{0≠v∈a⁻¹Λ/Λ}(1−X/e_Λ(v)), and set φ^Λ\_0=0. This is independent of representatives, is q-linearized, and e_Λ(az)=φ^Λ\_a(e_Λ(z)). The scalar factor a gives the required derivative a. The map a↦φ^Λ\_a is a rank-r Drinfeld module with r=rank Λ.

**Hypotheses.** The generic embedding of A; lattice rank r.

**Proof route.**

- Use the finite F-subspace e_Λ(a⁻¹Λ/Λ) and its subspace polynomial.
- Compare normalized entire functions with equal simple zeros; the finite quotient determines the degree.
- Surjectivity of e_Λ proves the additive and multiplicative laws for φ.

**Needs:** [`DM.2/lattice-exponential`](#dm-2-lattice-exponential) (2.4); [`DM.0/drinfeld-module`](#dm-0-drinfeld-module) (0.1); `FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`.

**Sources.**

- [PAPIKIAN-2017](#source-papikian-2017), Theorem 2.3 and proof, pp. 6–7: The theorem states the functional equation; its displayed finite product needs the factor a, as recorded under sourceIssues.

**API.**

- **`ALattice.drinfeldModule`** (constructor): The Drinfeld module φ^Λ.
- **`ALattice.exp_functionalEquation`** (relation): e_Λ(az)=φ^Λ\_a(e_Λ(z)).
- **`ALattice.drinfeldModule_rank`** (compatibility): rank(φ^Λ)=rank Λ.
- **`ALattice.drinfeldModule_scale`** (functoriality): φ^(cΛ)\_a(X)=c φ^Λ\_a(c⁻¹X).

**Checks.**

- **`latticeModule_test_one`** (degenerate): φ^Λ\_1(X)=X.
- **`latticeModule_test_linear`** (non-example): For nonconstant a, the coefficient of X is a, not one.
- **`latticeModule_test_carlitz`** (compatibility): For Λ=πA with the Carlitz period normalization below, φ^Λ=C.

**Acceptance.** φ^Λ\_a has derivative a and degree |A/(a)|^r.

**Uses.**

- DM.2: Inverse functor for uniformization.
- DM.3: Analytic points of level moduli.

**Used by:** [2.6](#dm-2-uniformization).

**Suggested file.** The native construction specializes to F\[t]. The general A action, rank and scalar-change comparisons require the function-ring interface and the uniformization proof gap.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-uniformization"></a>

### 2.6 Drinfeld uniformization

**Target** `DrinfeldModulesAndTModules:DM.2/uniformization` (theorem). **Planet:** Drinfeld uniformization theorem.

Every rank-r Drinfeld A-module φ over C_∞ in generic characteristic has a unique entire F-linear exponential exp_φ with derivative one and exp_φ(az)=φ\_a(exp_φ(z)). It is surjective; its kernel is a projective A-lattice of rank r. These functors give an equivalence between rank-r field Drinfeld modules over C_∞ and rank-r A-lattices with scalar morphisms. No automatic statement is asserted for arbitrary t-modules or families.

**Hypotheses.** C_∞, generic characteristic, rank r≥1.

**Proof route.**

- For F\[t], the coefficient recurrence is α\_0=1 and (θ^(q^i)−θ)α\_i=Σ\_{j=1}^{min(r,i)}g_j α\_(i−j)^(q^j).
- Establish infinite radius and simple zeros from the analytic input.
- The functional equation gives the A-module kernel; quotient torsion counts and the infinite-place finiteness input give projective rank r.
- For general A, restrict along a separating F\[t]⊂A and recover the full A-action by uniqueness; the exact general-A kernel-rank input is recorded.

**Needs:** [`DM.2/lattice-drinfeld-module`](#dm-2-lattice-drinfeld-module) (2.5); [`DM.0/rank-general`](#dm-0-rank-general) (0.3); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), Theorem 2.1, p. 7; §2.5, pp. 7–8: The Drinfeld–lattice classification is stated with rank and the field setting.

**Acceptance.**

- A nonprincipal ideal lattice stays projective, not artificially free.
- The exponential of a general t-module may be nonsurjective.

**Used by:** [2.7](#dm-2-exponential-morphisms), [2.8](#dm-2-carlitz-exponential).

**Suggested file.** The full general-A analytic surjectivity and projective kernel theorem is a mathematical target; its exact native signature awaits the existing AlgebraicCurves function-ring/completion interfaces and the stated analytic proof input.

**Open input:** [Analytic surjectivity and general-A kernel rank](#gap-analytic-surjectivity-and-general-a-kernel-rank).

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-exponential-morphisms"></a>

### 2.7 Morphisms in uniformization

**Target** `DrinfeldModulesAndTModules:DM.2/exponential-morphisms` (comparison).

For φ,ψ of the same positive rank r over C_∞, differentiation gives a bijection Hom(φ,ψ)≅{c∈C_∞:cΛ\_φ⊂Λ\_ψ}; the corresponding polynomial u satisfies u(exp_φ(z))=exp_ψ(cz). It is compatible with A-actions, identities and composition. In particular scalar homothety classifies isomorphisms.

**Hypotheses.**

- Generic characteristic over C_∞.
- The two lattices have the same A-rank r. For c≠0 this makes Λ\_ψ/cΛ\_φ finite; different-rank scalar inclusions are excluded.

**Proof route.**

- For c≠0 use equal ranks and finite generation to prove the scalar inclusion has finite index; form the corresponding finite F-subspace polynomial. The zero scalar gives the zero morphism separately.
- Construct u from the finite quotient when c≠0 and use the normalized product.
- Differentiating gives ∂u=c; uniqueness follows from surjectivity.
- Use the functional equations to verify intertwining.

**Needs:** [`DM.2/uniformization`](#dm-2-uniformization) (2.6); [`DM.0/drinfeld-module-hom`](#dm-0-drinfeld-module-hom) (0.6).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.4, pp. 6–7 (equal-rank lattices): The Weierstrass–Drinfeld dictionary matches intertwiners with lattice scalars.

**Acceptance.**

- A nonzero morphism is separable; c=0 corresponds only to u=0.
- For A=F\[t], take Λ=A and Λ′=A+Aα with α∈F_(q²)∖F⊂C_∞ (so α∉Frac(A)) and the usual infinity embedding. The scalar 1 gives Λ⊂Λ′, but cannot be the differential of a nonzero Ore intertwiner between ranks one and two. This rejects the omitted equal-rank hypothesis.

**Suggested file.** The general-A scalar/morphism dictionary requires the general-A uniformization object; the coordinate Ore intertwiners are already native.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-carlitz-exponential"></a>

### 2.8 Carlitz exponential and logarithm

**Target** `DrinfeldModulesAndTModules:DM.2/carlitz-exponential` (construction). **Planet:** Carlitz exponential.

For transcendental θ with ‖θ‖=q, exp_C(z)=Σ\_{i≥0}z^(q^i)/D_i is entire and satisfies exp_C(θz)=θ exp_C(z)+exp_C(z)^q. The local inverse is log_C(z)=Σ z^(q^i)/ℓ\_i on its convergence disk, in particular at z=1. The logarithm is not declared entire.

**Hypotheses.** A=F\[θ]; C_t=θ+τ; the norm normalization above.

**Proof route.**

- Use carlitzD_succ for the exponential recurrence and degree(D_i)=i q^i for infinite radius.
- Use carlitzEll_succ for the logarithm recurrence.
- The normalized local inverse theorem identifies the two series on a sufficiently small disk.

**Needs:** [`DM.0/carlitz-products`](#dm-0-carlitz-products) (0.11); [`DM.2/uniformization`](#dm-2-uniformization) (2.6).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.2, pp. 3–5: The source gives the exponential coefficients, Carlitz equation and period setting.
- [PAP-v2](#source-pap-v2), §1.2.2, p. 4: The Carlitz logarithm is introduced as the inverse series of the Carlitz exponential, with the denominators (θ−θ^q)⋯(θ−θ^(q^i)), and is said to converge exactly where ‖z‖ is below ‖θ‖^(q/(q−1)); this supplies the disk of the inverse identity.

**API.**

- **`carlitzExp`** (constructor): Σ z^(q^i)/D_i.
- **`carlitzExp_functionalEquation`** (relation): exp_C(θz)=θexp_C(z)+exp_C(z)^q.
- **`carlitzLog`** (constructor): The local inverse series Σ z^(q^i)/ℓ\_i.
- **`carlitzExp_log_one`** (example): exp_C(log_C(1))=1.
- **`carlitzExp_carlitzLog`** (characterisation): For ‖z‖<‖θ‖^(q/(q−1)), which is q^(q/(q−1))=‖π\_BP‖ under the normalization ‖θ‖=q, the series log_C(z) converges and exp_C(log_C(z))=z; log_C is the compositional inverse of exp_C on this open disk.

**Checks.**

- **`carlitzExp_test_coeff`** (computation): The z^q coefficient is (θ^q−θ)⁻¹.
- **`carlitzExp_test_zero`** (degenerate): exp_C(0)=log_C(0)=0.
- **`carlitzExp_test_log_sign`** (non-example): The z^q coefficient of log_C is (θ−θ^q)⁻¹; using D_1 gives the wrong sign in odd characteristic.

**Acceptance.** log_C converges at one because ‖ℓ\_i‖ grows rapidly.

**Uses.**

- DM.6: The Carlitz unit lattice and ζ\_A(1).
- DM.8: Period and logarithm inputs.
- DM.8/carlitz-deformation and DM.8/logarithm-division: A small algebraic argument α with ‖α‖&lt;q^(q/(q−1)) has a convergent logarithm with exp_C(log_C(α))=α; the deformation series specializes to it at θ and larger logarithms are divided down to it.

**Used by:** [2.9](#dm-2-carlitz-period), [6.4](#dm-6-unit-lattice), [6.12](#dm-6-small-power-sum), [6.13](#dm-6-carlitz-class-examples), [8.39](#dm-8-carlitz-deformation), [8.44](#dm-8-logarithm-linear-relations), [8.45](#dm-8-logarithm-division).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-carlitz-period"></a>

### 2.9 The Carlitz period

**Target** `DrinfeldModulesAndTModules:DM.2/carlitz-period` (construction). **Planet:** Carlitz period.

Choose ρ∈C_∞ with ρ^(q−1)=−θ. Set π\_BP=θρ∏\_{i≥1}(1−θ^(1−q^i))⁻¹. Then ker exp_C=π\_BP A and ‖π\_BP‖=q^(q/(q−1)). Changing ρ by ξ∈F× changes π\_BP by ξ. The source-selected Ngo Dac period is π\_ND=−π\_BP; it generates the same lattice.

**Hypotheses.** A=F\[θ], generic characteristic, chosen ρ.

**Proof route.**

- The factors converge as θ^(1−q^i)→0.
- The product formula for exp_C and the minimal nonzero zero identify the lattice generator.
- Compute the norm and the root-of-unity dependence.

**Needs:** [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) (2.8); [`DM.2/a-lattice`](#dm-2-a-lattice) (2.3).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.2, pp. 4–5: The source uses π\_BP; the sign adapter to Ngo Dac’s Ω normalization is specified here.

**API.**

- **`carlitzPeriod`** (constructor): The product π\_BP with the chosen root ρ.
- **`carlitzPeriod_ker`** (characterisation): exp_C(z)=0 iff z∈π\_BP A.
- **`carlitzPeriod_norm`** (data): ‖π\_BP‖=q^(q/(q−1)).
- **`carlitzPeriod_changeRoot`** (functoriality): Replacing ρ by ξρ replaces π by ξπ.

**Checks.**

- **`carlitzPeriod_test_zero`** (characterisation): π\_BP≠0 and exp_C(π\_BP)=0.
- **`carlitzPeriod_test_sign`** (compatibility): π\_ND=−π\_BP gives the same A-lattice.
- **`carlitzPeriod_test_norm`** (computation): For q=2, ‖π\_BP‖=4.

**Acceptance.** The lattice is independent of multiplication by F×.

**Uses.**

- DM.2: Normalizes Ω(θ) and π^(q−1).
- DM.8: Carlitz period supplier contract.

**Used by:** [2.10](#dm-2-omega), [2.11](#dm-2-period-power), [6.13](#dm-6-carlitz-class-examples), [8.42](#dm-8-carlitz-group), [8.45](#dm-8-logarithm-division).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-omega"></a>

### 2.10 The Anderson–Thakur Omega function

**Target** `DrinfeldModulesAndTModules:DM.2/omega` (construction).

For the same root ρ, define Ω(t)=ρ^(−q)∏\_{i≥1}(1−t/θ^(q^i)). It is entire in t and a unit of the radius-one Tate algebra. Coefficientwise inverse q-twist, fixing t, satisfies Ω^(−1)=(t−θ)Ω. Its simple zeros are θ^(q^i), i≥1, so Ω(θ)≠0 and Ω(θ)⁻¹=π\_ND=−π\_BP.

**Hypotheses.** A=F\[θ]; fixed ρ; inverse coefficient twist from DM.8/coefficient-twist, which sits in this layer; restricted-series algebra imported from Mathlib and the existing AdicSpaces roadmap.

**Proof route.**

- Uniform convergence on every disk gives the entire product.
- The zero locations lie outside the unit disk; the restricted-series criterion gives a Tate unit.
- Shift the product under the inverse coefficient twist and use ρ^(q−1)=−θ.
- Evaluate at θ and compare products, retaining the sign.

**Needs:** [`DM.2/carlitz-period`](#dm-2-carlitz-period) (2.9); [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`; `mathlib:PowerSeries.IsRestricted.subring`.

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), §4.2, pp. 17–18: The product, inverse-twist equation and choice 1/Ω(θ)=π fix the normalization.

**API.**

- **`carlitzOmega`** (constructor): The entire product Ω(t).
- **`carlitzOmega_twist`** (relation): Ω^(−1)=(t−θ)Ω.
- **`carlitzOmega_at_theta`** (compatibility): Ω(θ)⁻¹=−π\_BP.
- **`carlitzOmega_zeros`** (characterisation): The zeros are exactly θ^(q^i), i≥1, each simple.

**Checks.**

- **`carlitzOmega_test_constant`** (computation): Ω(0)=ρ^(−q).
- **`carlitzOmega_test_theta`** (characterisation): Ω(θ)≠0 but Ω(θ^q)=0.
- **`carlitzOmega_test_tate_unit`** (non-example): Ω has no zeros on ‖t‖≤1; being a Tate unit does not mean being a zero-free entire function.

**Acceptance.** Twisting does not replace the variable t by t^q.

**Uses.**

- DM.8: Rigid trivialization of the Carlitz dual motive.
- Characteristic-p multiple-zeta consumers: They import Ω and its normalization from here.

**Used by:** [4.7](#dm-4-carlitz-tensor-power), [8.18](#dm-8-integral-trivialization), [8.40](#dm-8-logarithm-matrices), [8.42](#dm-8-carlitz-group), [8.44](#dm-8-logarithm-linear-relations).

**Suggested file.** The native function is a power series with all disk restrictions and the inverse-twist equation. Its entire/Tate interpretations import restricted-series analytic comparisons and the DM.8 coefficient-twist convention.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-period-power"></a>

### 2.11 The invariant Carlitz period power

**Target** `DrinfeldModulesAndTModules:DM.2/period-power` (theorem).

π\_BP^(q−1)=π\_ND^(q−1)=−θ^q∏\_{i≥1}(1−θ^(1−q^i))^(−(q−1)) belongs to K_∞×. It is independent of the root ρ. The period itself need not lie in K_∞ when q>2.

**Hypotheses.** The period/root convention above.

**Proof route.**

- Raise the defining product to q−1 and substitute ρ^(q−1)=−θ.
- The scalar sign between the two periods has (q−1)-st power one.
- Every factor is in K_∞ and their product converges there.

**Needs:** [`DM.2/carlitz-period`](#dm-2-carlitz-period) (2.9).

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), §4.2, p. 17; §2 notation, pp. 5–7: The period normalization supplies the root-independent power used in depth-one special values.

**Acceptance.** For q>2 the valuation −q/(q−1) excludes π from K_∞, whose valuation group is Z.

**Suggested file.** The exact normalized product identity is stated mathematically; its K-infinity membership signature requires the AlgebraicCurves completion embedding rather than an arbitrary coefficient-field membership predicate.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-3"></a>

## Layer DM.3: Level moduli, Satake compactification and modular forms

The fine moduli scheme with prime-to-characteristic level, Pink's Satake compactification of its generic fibre and the arithmetic Satake compactification of Hartl–Yu have different bases and hypotheses, and are stated separately. Generalized Drinfeld modules, which may degenerate at the boundary, give the compactification; the modular line bundle is the dual of the Lie line, and Drinfeld modular forms are its sections. Weak separation, normalization and the exact fine-level condition are retained in every compactification statement.

<a id="dm-3-level-structure"></a>

### 3.1 Prime-to-characteristic level structures

**Target** `DrinfeldModulesAndTModules:DM.3/level-structure` (definition). **Planet:** Drinfeld level structure.

For a nonzero proper ideal N⊂A and an A\[1/N]-scheme S, a full level-N structure on a rank-r Drinfeld module E is an A-linear isomorphism of finite étale S-group schemes (N⁻¹/A)^r_S→E\[N]. Here A\[1/N]=Γ(Spec A−V(N),O); no generator of N is chosen. For N′⊂N, restriction to N-torsion forgets the extra level. The domain is canonically an ideal-quotient module, not a chosen (A/N)^r basis.

**Hypotheses.** Rank r fixed; all primes dividing N inverted on S.

**Proof route.**

- Use ideal torsion and its étaleness in DM.1.
- Define the isomorphism functor and its finite étale torsor of frames.
- Restrict along N⁻¹/A⊂N′⁻¹/A and check identity and successive restrictions.

**Needs:** [`DM.1/ideal-torsion`](#dm-1-ideal-torsion) (1.1); [`DM.1/etale-torsion`](#dm-1-etale-torsion) (1.3); [`DM.1/geometric-torsion-basis`](#dm-1-geometric-torsion-basis) (1.4); `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`.

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), §2, equation (2.4) and Theorem 2.3, pp. 7–8: The good open base uses a group-scheme isomorphism from the fractional-ideal quotient.

**API.**

- **`DrinfeldLevel`** (constructor): An A-linear finite étale group-scheme isomorphism (N⁻¹/A)^r_S≅E\[N]. (stated here only; not a declaration of the suggested file)
- **`DrinfeldLevel.pullback`** (functoriality): Pullback of E and the level along an A\[1/N]-scheme map. (stated here only; not a declaration of the suggested file)
- **`DrinfeldLevel.forget`** (functoriality): Restrict a level-N′ structure to N-torsion for N′⊂N. (stated here only; not a declaration of the suggested file)
- **`DrinfeldLevel.change`** (structure): GL_r(A/N) acts by precomposition after the ideal-quotient identification; the intrinsic frame group is Aut_A((N⁻¹/A)^r). (stated here only; not a declaration of the suggested file)
- **`DrinfeldLevel.ext`** (extensionality): For the same underlying Drinfeld family, level frames are equal when their finite étale group-scheme maps agree. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`DrinfeldLevel_test_rank_one`** (computation): For Carlitz and (t) away from θ=0, a nonzero t-torsion section gives a full level.
- **`DrinfeldLevel_test_basis`** (non-example): For rank two, sending both basis vectors to the same nonzero torsion point is not a level structure.
- **`DrinfeldLevel_test_characteristic`** (non-example): For φ\_t=τ at characteristic (t), the length-q connected kernel is not isomorphic to the étale constant F-group scheme.

**Acceptance.** For A=F\[t] and N=(t), the level is an ordered F-basis of ker φ\_t.

**Uses.**

- DM.3: Fine moduli, change of level and Hecke correspondences.
- DM.7: Level data transports across the elliptic-sheaf dictionary.

**Used by:** [3.2](#dm-3-moduli-functor), [3.3](#dm-3-fine-moduli-scheme).

**Suggested file.** PointDrinfeldLevel is the split geometric-point specialization. DrinfeldLevel and its pullback/forget/change API are finite-étale group-scheme isomorphisms, which require the fractional-ideal constant-group and relative torsion supplier.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-moduli-functor"></a>

### 3.2 The Drinfeld moduli stack

**Target** `DrinfeldModulesAndTModules:DM.3/moduli-functor` (construction).

For r≥1, define the groupoid over each A-scheme S of rank-r relative Drinfeld modules and their isomorphisms, with pullback along base maps. It is an fpqc stack and a smooth Deligne–Mumford stack of relative dimension r−1 over Spec A. On A\[1/N], full level-N objects define its frame cover; the quotient groupoid of the fine level scheme by Aut_A((N⁻¹/A)^r) recovers the unlevelled stack. Its set of isomorphism classes is not its stack structure.

**Hypotheses.** Fixed A, rank r and standard relative convention; N nonzero proper on the stated good open.

**Proof route.**

- Descend line bundles, q-linearized action maps and level frames using SF.1/qcoh-fpqc-descent and affine-fpqc-descent; the finite-level torsion supplier has its own recorded gap.
- Construct the fine cover on each good open by fine-moduli-scheme.
- Use two coprime nonzero ideals to cover Spec A; quotient presentations glue and prove the stack assertions.

**Needs:** [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9); [`DM.3/level-structure`](#dm-3-level-structure) (3.1); [`DM.3/fine-moduli-scheme`](#dm-3-fine-moduli-scheme) (3.3); `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`; `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`; `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`.

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Theorem 2.3 and §2 equations (2.7)–(2.9), pp. 8–9; Proposition 2.8, pp. 10–11: The fine-level cover and its finite quotient give the stack presentation; the source states scheme-level results, and stack gluing is a supplier input.

**API.**

- **`DrinfeldModuli`** (constructor): The fibred groupoid of rank-r relative Drinfeld modules. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModuli.pullback`** (functoriality): Base pullback with identity/composition coherence. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModuli.levelAtlas`** (compatibility): The fine level scheme gives an étale atlas on A\[1/N]. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModuli.quotientPresentation`** (equivalence): The quotient stack of the level atlas by the frame group is the unlevelled stack on that base. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`DrinfeldModuli_test_rank_one`** (computation): The unlevelled Carlitz object has the scalar automorphism group F×; a full nontrivial good level has trivial stabilizer. (stated here only)
- **`DrinfeldModuli_test_dimension`** (characterisation): Relative dimensions at ranks one and two are zero and one. (stated here only)
- **`DrinfeldModuli_test_iso_classes`** (non-example): Replacing each groupoid by its set of isomorphism classes loses the automorphism group when q>2. (stated here only)

**Acceptance.** Rank-one scalar automorphisms F× remain in the unlevelled groupoid.

**Uses.**

- DM.3: Locates fine level schemes and coarse quotients.
- DM.7: Transports the relative moduli interpretation.

**Suggested file.** The groupoid/stack, descent, atlas and quotient tests need the SF.1 fibred-category and relative line-bundle interfaces. Sets of isomorphism classes are explicitly insufficient.

**Open input:** [Native geometric and analytic signature integration](#gap-native-geometric-and-analytic-signature-integration).

**Open input:** [Fine moduli chart and deformation proof](#gap-fine-moduli-chart-and-deformation-proof).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-fine-moduli-scheme"></a>

### 3.3 Fine level representability and smoothness

**Target** `DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme` (theorem). **Planet:** Fine Drinfeld moduli scheme.

For any nonzero proper N⊂A, the full level-N functor over Spec A\[1/N] is represented by an affine smooth scheme M_r(N) of finite type and relative dimension r−1, with universal family. For a compact open K⊂GL_r(Â), call K fine if its image in some GL_r(A/p) is unipotent. Write N_K for the largest ideal with K(N_K)⊂K. The K-level moduli scheme over A\[1/N_K] is a fine smooth moduli scheme when K is fine; for general K it is coarse. These assertions do not require the two-prime condition needed for an all-characteristics level functor over Spec A.

**Hypotheses.** r≥1; A as in DM.0; level primes inverted; K fine for a universal family.

**Proof route.**

- Construct principal-level charts from the standard coefficient and torsion equations.
- Infinitesimal deformations give a formally smooth rank-r−1 space; finite presentation supplies smoothness.
- Use finite quotients and descent. A scalar fixing a fine level acts both semisimply and unipotently on torsion, hence is one.
- The precise chart/deformation proof in Drinfeld §5 is an explicit source proof gap; Hartl–Yu states the result and proves the fine-subgroup extension.

**Needs:** [`DM.3/level-structure`](#dm-3-level-structure) (3.1); [`DM.0/relative-standardization`](#dm-0-relative-standardization) (0.10); `SchemeAndStackFoundations:SF.1/finite-group-quotient`; `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`.

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Theorem 2.3, p. 8; Definition 2.6, Lemma 2.7 and Proposition 2.8, pp. 10–11: The source gives the good-open smoothness, level rigidity, and fine/coarse distinction.

**Acceptance.**

- At A=F\[t], level (t), rank one is zero-dimensional over F(t).
- At rank two the principal-level generic fiber is a smooth affine curve.

**Used by:** [3.2](#dm-3-moduli-functor), [3.5](#dm-3-satake-compactification), [3.9](#dm-3-integral-compactification).

**Suggested file.** The native universal-family representability signature requires DrinfeldModuli and exact SF.1 descent and quotient nodes; the exact principal-level chart/deformation proof is a recorded gap.

**Open input:** [Fine moduli chart and deformation proof](#gap-fine-moduli-chart-and-deformation-proof).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-generalized-drinfeld-module"></a>

### 3.4 Generalized Drinfeld modules

**Target** `DrinfeldModulesAndTModules:DM.3/generalized-drinfeld-module` (definition). **Planet:** Generalized Drinfeld module.

A generalized Drinfeld A-module of rank ≤r over S is a line bundle E with an F-linear A-action, differential γ, every field fiber a Drinfeld module of positive rank ≤r, and the global degree bound φ\_a=Σ\_{i=0}^{r deg_A(a)}b_iτ^i. Coefficients b_i are sections of E^(1−q^i). Isomorphisms preserve the line-bundle structure. Weakly separating means that for each algebraically closed field L over the base, any fixed Drinfeld-module isomorphism class occurs at only finitely many points of S(L). The global bound cannot be replaced by a fiberwise bound on nonreduced bases.

**Hypotheses.** S an A-scheme; fixed integer r≥1; standard F-linear line bundle.

**Proof route.**

- Glue the bounded q-linearized coefficient descriptions under line-bundle changes.
- Define field-fiber positivity and weak separation independently of level.
- Pullback preserves generalized families; weak separation is a condition on the resulting classifying map, not invariant under arbitrary positive-dimensional base change.

**Needs:** [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`.

**Sources.**

- [PINK-2012](#source-pink-2012), Definitions 3.1–3.2, p. 10; Definition 3.9, p. 13: Generalized families permit rank drops, while weak separation controls compactification uniqueness.

**API.**

- **`GeneralizedDrinfeldModule`** (constructor): Bounded F-linear action on a line bundle with positive-rank field fibers. (stated here only; not a declaration of the suggested file)
- **`GeneralizedDrinfeldModule.coefficient`** (projection): b_i(a)∈Γ(S,E^(1−q^i)). (a coordinate model in the suggested file)
- **`GeneralizedDrinfeldModule.pullback`** (functoriality): The degree-bound and fiber conditions survive base pullback. (a coordinate model in the suggested file)
- **`GeneralizedDrinfeldModule.isWeaklySeparating`** (characterisation): Every geometric isomorphism class has a finite fiber in S(L). (stated here only; not a declaration of the suggested file)
- **`GeneralizedDrinfeldModule.ext`** (extensionality): On a fixed line bundle, equality of all action coefficients on a trivializing cover determines the generalized family; no equality from geometric fibres alone is asserted over a nonreduced base. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`generalized_test_boundary`** (computation): Over F(θ)\[g], φ\_t=θ+τ+gτ² has generic rank two and rank one at g=0; it is generalized of rank ≤2.
- **`generalized_test_scalar`** (non-example): At a point where all positive τ-coefficients vanish the fiber is scalar, so the family is rejected.
- **`generalized_test_nilpotents`** (non-example): Over F(θ)\[ε]/(ε²), θ+τ+ετ³ has fiber rank one but fails the rank-≤1 global degree bound.
- **`generalized_test_constant_family`** (non-example): A constant family over a positive-dimensional affine line is not weakly separating. (stated here only)

**Acceptance.** Boundary rank drops are positive; a scalar action alone is not allowed.

**Uses.**

- DM.3: Defines generic and arithmetic Satake compactifications and their universal family.

**Used by:** [3.5](#dm-3-satake-compactification), [3.6](#dm-3-reciprocal-compactification), [3.9](#dm-3-integral-compactification).

**Suggested file.** The native trivialized affine action retains the global degree bound and positive fibre ranks. Twisted line-bundle coefficients and weak separation require the full classifying stack; weak separation is not asserted stable under arbitrary base change.

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`; `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l2b--geometric-vector-bundles`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-satake-compactification"></a>

### 3.5 The generic Satake compactification

**Target** `DrinfeldModulesAndTModules:DM.3/satake-compactification` (construction). **Planet:** Drinfeld Satake compactification.

For fine K, a Satake compactification of M_r(K)/K_0, where K_0=Frac(A), is a normal integral proper K_0-scheme containing M_r(K) densely, together with a weakly separating generalized Drinfeld module extending its universal family. It exists, is projective, and is unique together with the extension up to unique isomorphism restricting to the given family. This is a generic-fiber theorem; it neither supplies arbitrary integral base change nor an explicit general boundary stratification.

**Hypotheses.** r≥1; fine compact open K⊂GL_r(Â); generic base K_0.

**Proof route.**

- The normalized closure of the diagonal compares two candidates; extension of isomorphisms and weak separation make its projections finite and hence isomorphisms.
- Construct the F\[t], (t)-level case by reciprocal-compactification.
- Use normalization for coefficient restriction and finite quotients for change of level, exactly as Pink Lemmas 4.4–4.5 and Theorem 4.2.

**Needs:** [`DM.3/generalized-drinfeld-module`](#dm-3-generalized-drinfeld-module) (3.4); [`DM.3/fine-moduli-scheme`](#dm-3-fine-moduli-scheme) (3.3); [`DM.3/reciprocal-compactification`](#dm-3-reciprocal-compactification) (3.6); `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`; `SchemeAndStackFoundations:SF.0/excellent-examples`; `SchemeAndStackFoundations:SF.1/finite-group-quotient`.

**Sources.**

- [PINK-2012](#source-pink-2012), Definition 4.1 and Theorem 4.2, p. 14; proof, pp. 14–16: The universal property uses normality, weak separation and extension of the generic family.

**API.**

- **`DrinfeldSatake`** (constructor): The normal proper generic compactification with its generalized family. (stated here only; not a declaration of the suggested file)
- **`DrinfeldSatake.openImmersion`** (projection): M_r(K)↪M̄\_r(K), dense. (stated here only; not a declaration of the suggested file)
- **`DrinfeldSatake.unique`** (universal-property): A unique compatible isomorphism joins any two such compactifications. (stated here only; not a declaration of the suggested file)
- **`DrinfeldSatake.changeLevel`** (functoriality): A finite level map extends uniquely to the compactifications, compatibly with compositions. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`satake_test_rank_one`** (degenerate): The compactification equals the zero-dimensional rank-one moduli scheme. (stated here only)
- **`satake_test_rank_two`** (computation): For F\[t] and level (t), its generic rank-two compactification is P¹ with q+1 cusps. (stated here only)
- **`satake_test_general_boundary`** (non-example): Normal projectivity and weak separation alone do not provide a named disjoint union of every lower-rank moduli stratum. (stated here only)

**Acceptance.**

- At rank one there is no smaller positive-rank boundary.
- At rank two and A=F\[t], level (t), the compactification is P¹ and has q+1 missing rational points.

**Uses.**

- DM.3: Carries the modular-form line and compact Hecke maps.

**Used by:** [3.7](#dm-3-modular-forms), [3.8](#dm-3-hecke-correspondence).

**Suggested file.** The normal proper generic compactification, dense immersion, extended family and uniqueness require the native moduli, scheme and bundle interfaces. General boundary stratification and unrestricted arithmetic base change are not inferred.

**Open input:** [Reciprocal-ring normality proof input](#gap-reciprocal-ring-normality-proof-input).

**Open input:** [Native geometric and analytic signature integration](#gap-native-geometric-and-analytic-signature-integration).

**Open input:** [Projective finite quotients and section-ring comparison](#gap-projective-finite-quotients-and-section-ring-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-reciprocal-compactification"></a>

### 3.6 The principal-level reciprocal model

**Target** `DrinfeldModulesAndTModules:DM.3/reciprocal-compactification` (construction).

Let V=F^r, S=Sym_F V and Q(V)=Frac(S). In Q(V), let R(V) be generated by 1/v for nonzero v∈V, graded with deg(1/v)=1. Q_r=Proj R(V) is normal, integral and projective. On A\[1/t] for A=F\[t], its open principal-level scheme is the complement of all F-rational hyperplanes in P^(r−1), embedded by reciprocals. The generalized action is φ\_t(X)=tX∏\_{v≠0}(1−(1/v)X) on the line O(−1), and its Lie dual is O(1). It is weakly separating. This model supplies both generic and arithmetic construction seeds.

**Hypotheses.** r≥1; q-linearized finite-subspace product imported from FF.4; in the integral model t is inverted.

**Proof route.**

- Use the reciprocal relations 1/(cv)=c⁻¹/v and (1/v)(1/w)=(1/(v+w))(1/v+1/w) when v,w,v+w≠0.
- Construct Proj and identify its dense open by localization.
- Normality of R(V) is the Pink–Schieder input cited by the source; record its uninspected proof as a precise gap.
- The nonvanishing of some degree-one reciprocal at each Proj point prevents rank zero; finite permutations of reciprocal values prove weak separation.
- Expand the product using unordered subsets, one term for each subset of V∖{0}. Do not use the ordered-tuple sum in Hartl–Yu (3.7), p. 18: source issue E8 explains its factorial overcount.

**Needs:** [`DM.3/generalized-drinfeld-module`](#dm-3-generalized-drinfeld-module) (3.4); `FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`; `SchemeAndStackFoundations:SF.0/relative-proj`; `SchemeAndStackFoundations:SF.0/proj-base-change`.

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Lemma 3.10 and Proposition 3.11 with proof, pp. 17–19: The model works over A\[1/t], and the source reduces normality to Pink–Schieder.

**API.**

- **`DrinfeldReciprocalRing`** (constructor): The graded reciprocal subalgebra R(V)⊂Frac(Sym_F V). (a coordinate model in the suggested file)
- **`DrinfeldReciprocalScheme`** (constructor): Q_r=Proj R(V). (stated here only; not a declaration of the suggested file)
- **`DrinfeldReciprocalScheme.universalAction`** (data): The bounded action tX∏(1−X/v) on O(−1). (stated here only; not a declaration of the suggested file)
- **`DrinfeldReciprocalScheme.lieDual`** (compatibility): Lie(E)∨≅O(1). (stated here only; not a declaration of the suggested file)

**Checks.**

- **`reciprocal_test_rank_one`** (computation): For r=1, the reciprocal ring is a polynomial ring in one degree-one generator, so Proj is a point.
- **`reciprocal_test_rank_two`** (computation): Q_2 is P¹ and its open removes the q+1 F-rational points. (stated here only)
- **`reciprocal_test_product_scalar`** (non-example): Removing the factor t from φ\_t gives derivative one rather than t and fails the characteristic-map condition.

**Acceptance.** At rank one Q_1 is Spec F; at rank two Q_2 is P¹.

**Uses.**

- DM.3: The existence proof starts with this explicit principal-level model.

**Used by:** [3.5](#dm-3-satake-compactification), [3.7](#dm-3-modular-forms), [3.9](#dm-3-integral-compactification).

**Suggested file.** Reciprocal.ring is the native ungraded subalgebra of a fraction field and has reciprocal relations. The grading, Proj, universal O(-1) action, Lie dual and rank-two geometric test require the exact SF.0 Proj/normalization and SF.1 finite-quotient inputs plus the recorded projectivity gap; the normality proof is a recorded input.

**Open input:** [Reciprocal-ring normality proof input](#gap-reciprocal-ring-normality-proof-input).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-modular-forms"></a>

### 3.7 Algebraic Drinfeld modular forms

**Target** `DrinfeldModulesAndTModules:DM.3/modular-forms` (definition). **Planet:** Drinfeld modular form.

On the generic Satake compactification for fine K, set ω=Lie(E)∨ and M_k(K)=H⁰(M̄\_r(K),ω^⊗k), k≥0; a cusp form vanishes on the reduced boundary. The multiplication of sections makes ⊕\_k M_k(K) a graded K_0-algebra. The line ω is ample and the section ring is a finitely generated normal integral domain whose Proj recovers M̄. For nonfine K use invariants at a fine normal sublevel, not a nonexistent universal line on coarse moduli. These are algebraic modular forms; their agreement with analytic holomorphy is a separate comparison.

**Hypotheses.** Generic base; k a nonnegative integer; fine K for the line-bundle formulation.

**Proof route.**

- Identify the Lie dual under standard coordinates.
- Pull back to the reciprocal model and use finite-surjective descent of ampleness.
- Import SF.2/ample-serre-vanishing under its proper Noetherian ample hypotheses and SF.0/relative-proj. Use the existing AlgebraicVectorBundles Lie-dual interface. The finite-quotient projectivity and normal section-ring/Proj comparisons are separate recorded inputs.
- Take fine-level invariants to make level-independent spaces for general K.

**Needs:** [`DM.3/satake-compactification`](#dm-3-satake-compactification) (3.5); [`DM.3/reciprocal-compactification`](#dm-3-reciprocal-compactification) (3.6); `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`; `SchemeAndStackFoundations:SF.0/relative-proj`.

**Sources.**

- [PINK-2012](#source-pink-2012), Lemma 5.1, p. 19; Theorem 5.3, Definition 5.4, Proposition 5.5 and Theorem 5.6, p. 20; Theorem 5.7, p. 21: The ample Lie-dual line defines algebraic forms, and coarse levels are handled by invariants.

**API.**

- **`DrinfeldModularForm`** (constructor): Global sections of ω^⊗k. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModularForm.mul`** (structure): Weight-k and weight-l sections multiply to weight k+l. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModularForm.cusp`** (characterisation): Kernel of restriction to the reduced boundary. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModularForm.levelInvariants`** (compatibility): At a fine normal sublevel K′, M_k(K)=M_k(K′)^(K/K′). (stated here only; not a declaration of the suggested file)
- **`DrinfeldModularForm.ext`** (extensionality): Global modular-form sections are equal when their restrictions on an open cover agree. Evaluation at geometric points is not used as extensionality on a possibly nonreduced base. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`modularForm_test_one`** (degenerate): The constant section 1 is a weight-zero form. (stated here only)
- **`modularForm_test_rank_two`** (computation): At A=F\[t], level (t), rank two, ω has degree q and dim M_k=qk+1; for k≥1 the q+1 cusp vanishing conditions give dim cusp forms qk−q. (stated here only)
- **`modularForm_test_boundary`** (non-example): A section on the open moduli scheme with a pole at a cusp is not a global section on the compactification. (stated here only)

**Acceptance.** Weight zero is the ring of global functions of the projective compactification.

**Uses.**

- DM.3: Hecke pullback, trace and graded ring.
- Function-field modular-form consumers: Algebraic form spaces with a precise line convention.

**Used by:** [3.8](#dm-3-hecke-correspondence).

**Suggested file.** Global sections, tensor multiplication, reduced-boundary restriction and level invariants require the Satake scheme and its native invertible sheaf. The full section and dimension tests are omitted until those interfaces are fixed.

**Open input:** [Projective finite quotients and section-ring comparison](#gap-projective-finite-quotients-and-section-ring-comparison).

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-hecke-correspondence"></a>

### 3.8 Drinfeld Hecke correspondences and operators

**Target** `DrinfeldModulesAndTModules:DM.3/hecke-correspondence` (construction). **Planet:** Drinfeld Hecke correspondence.

For g∈GL_r(A_f) with entries in Â and compact open K, put K′=K∩g⁻¹Kg. The correspondence is M_r(K)←J_1 M_r(K′)→J_g M_r(K), using quotient isogenies. Its maps extend finitely to the generic Satake compactifications. The induced operator on weight-k forms is T_g=(J_g)\_\*∘J_1^\*, with pullback composed with the isogeny’s Lie-dual identification and pushforward defined by the finite coset trace. It depends only on KgK. For gK′g⁻¹⊂K, (J_g)\_\*J_g^\*=\[K:gK′g⁻¹] id; the integer is viewed in characteristic p and may be zero.

**Hypotheses.** Generic-fiber moduli; g integral at every finite place for the specified line normalization; use fine sublevels and invariants if K is not fine.

**Proof route.**

- Construct quotient isogenies from ideal torsion, and identify the Lie line in generic characteristic.
- Extend the finite maps and isogenies by Satake uniqueness and generalized-family extension.
- Use a common normal fine level and sum translates to define trace; independence follows from subgroup transitivity.
- Double-coset convolution follows from the finite correspondence decomposition, without dividing by its degree.

**Needs:** [`DM.3/modular-forms`](#dm-3-modular-forms) (3.7); [`DM.3/satake-compactification`](#dm-3-satake-compactification) (3.5); [`DM.1/ideal-torsion`](#dm-1-ideal-torsion) (1.1); [`DM.0/isogeny-rank`](#dm-0-isogeny-rank) (0.7); `SchemeAndStackFoundations:SF.1/finite-group-quotient`; `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`.

**Sources.**

- [PINK-2012](#source-pink-2012), Propositions 2.6–2.7, pp. 6–7; Proposition 4.11, p. 18; Lemma 5.1, p. 19; §6 equations (6.1)–(6.9), pp. 21–23; Proposition 6.10, pp. 23–24: The normalization is pullback by J_1 followed by trace along J_g; degree is not inverted.

**API.**

- **`DrinfeldHecke`** (constructor): The pair J_1,J_g from K∩g⁻¹Kg. (stated here only; not a declaration of the suggested file)
- **`DrinfeldHecke.pullback`** (functoriality): The section map using the Lie-dual identification. (stated here only; not a declaration of the suggested file)
- **`DrinfeldHecke.trace`** (data): The coset sum pushforward. (stated here only; not a declaration of the suggested file)
- **`DrinfeldHecke.operator`** (data): T_g=(J_g)\_\*J_1^\*. (stated here only; not a declaration of the suggested file)
- **`DrinfeldHecke.doubleCoset`** (characterisation): KgK=KhK implies T_g=T_h. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`Hecke_test_identity`** (degenerate): For g=1 and K′=K, T_1=id. (stated here only)
- **`Hecke_test_level_trace`** (compatibility): For a fine normal sublevel K′⊂K, trace∘pullback=\[K:K′] id. (stated here only)
- **`Hecke_test_characteristic_index`** (non-example): If p divides \[K:K′], that composite is zero on forms; a normalized trace dividing by the degree is undefined. (stated here only)

**Acceptance.** A change of level with g=1 has pullback followed by trace equal to its finite index.

**Uses.**

- DM.3: Computes modular-form change of level and Hecke actions.

**Suggested file.** The compact finite correspondence, trace on the form line and double-coset composition require the Satake and section interfaces; no abstract set map substitutes for the finite geometric trace.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-integral-compactification"></a>

### 3.9 The arithmetic Satake compactification

**Target** `DrinfeldModulesAndTModules:DM.3/integral-compactification` (theorem).

For every fine compact open K⊂GL_r(Â), with N_K the largest ideal satisfying K(N_K)⊂K, M_r(K) over Spec A\[1/N_K] has a normal integral projective flat Satake compactification carrying a weakly separating generalized Drinfeld module extending the universal family. Both are unique up to unique compatible isomorphism, and the Lie-dual line is ample. For fine K′⊂K, the level map extends to a finite surjective open map after extending the base to A\[1/N_K′], and pulls back the family and Lie-dual line. No flatness of this finite level map or normality/Cohen–Macaulayness of every special fiber is asserted.

**Hypotheses.** r≥1; fine K; excellent Dedekind A; the indicated good open base, not Spec A with level primes retained.

**Proof route.**

- Use the explicit reciprocal model over F\[t,1/t] as the seed.
- For coefficient restriction, normalize the closure of the fine moduli image in that seed; generalized action maps extend over a normal base.
- Take the finite quotient at a principal sublevel; fineness descends the line bundle, normality and weak separation.
- Dedekind-base torsion-freeness gives flatness; finite-surjective descent gives ampleness.
- Normalized diagonal uniqueness and common-level quotients prove level functoriality.

**Needs:** [`DM.3/reciprocal-compactification`](#dm-3-reciprocal-compactification) (3.6); [`DM.3/fine-moduli-scheme`](#dm-3-fine-moduli-scheme) (3.3); [`DM.3/generalized-drinfeld-module`](#dm-3-generalized-drinfeld-module) (3.4); `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`; `SchemeAndStackFoundations:SF.0/excellent-examples`; `SchemeAndStackFoundations:SF.1/finite-group-quotient`.

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Definition 3.1, Theorem 3.2 and Lemmas 3.3, 3.6–3.8 with proofs, pp. 12–16; Proposition 3.11, pp. 18–19: This is the separately sourced integral extension; the source explicitly distinguishes finite level maps from flat maps.

**Acceptance.**

- For F\[t], level (t), the model is Q_r×Spec F\[t,1/t].
- Its generic fiber is Pink’s compactification by the defining universal property.

**Suggested file.** The integral normal/projective/flat compactification and finite surjective open level maps require the exact SF.0 Proj/normalization and SF.1 finite-quotient inputs plus the recorded projectivity gap and the extended generalized family. Special-fibre normality or Cohen–Macaulayness is not asserted.

**Open input:** [Reciprocal-ring normality proof input](#gap-reciprocal-ring-normality-proof-input).

**Open input:** [Projective finite quotients and section-ring comparison](#gap-projective-finite-quotients-and-section-ring-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-4"></a>

## Layer DM.4: Anderson modules, effective motives and dual conventions

An Anderson t-module of dimension d acts on G_a^d with differential θ·I + N, N nilpotent. Abelianness (finite generation of the motive), Ore-freeness, purity and uniformizability are separate properties. The contravariant motive functor is fully faithful on abelian modules with image the effective A-motives that become Ore-free after a faithfully flat extension. On the dual side, effective dual t-motives over a perfect field are related to the τ-motives by the star anti-isomorphism, and over perfect fields an Anderson module is abelian exactly when it is A-finite (Maurischat). The rational category of pre-t-motives that DM.8 needs is not yet planned here; it is recorded as the gap [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

<a id="dm-4-t-module"></a>

### 4.1 Anderson t-modules

**Target** `DrinfeldModulesAndTModules:DM.4/t-module` (definition). **Planet:** Anderson t-module.

For A=F\[t] and an F-algebra field L with γ(t)=θ, a d-dimensional t-module is the F-algebra map Φ:F\[t]→Mat_d(L{τ}) acting on G_a^d such that dΦ\_t=θI_d+N with N nilpotent. More intrinsically, an Anderson A-module over R is fpqc-locally G_a^d as an F-module scheme and satisfies (dΦ\_a−γ(a)I)^d=0 for every a∈A. Morphisms are matrices U with UΦ\_a=Ψ\_aU. Abelianness means that its contravariant motive is finite locally free over A⊗F R; it is an additional hypothesis.

**Hypotheses.** d≥1 for nontrivial examples; polynomial-ring field coordinate version and relative Anderson version distinguished.

**Proof route.**

- Use FF.4 entrywise to identify F-linear polynomial maps with matrices over the Ore ring.
- Use the polynomial algebra-map universal property; the nilpotent differential at t implies the required condition for every a.
- Define the matrix intertwiners and their category laws.
- Descend the coordinate description to fpqc forms, using SF.1 affine and quasicoherent fpqc descent.

**Needs:** [`DM.0/drinfeld-module`](#dm-0-drinfeld-module) (0.1); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; `mathlib:Module.End`; `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`; `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 1.2, p. 2; Definition 3.1, p. 7; Lemma 3.2 and Remark 3.3, p. 8: The relative definition records the nilpotent differential and abelianness; the coordinate motive is a row module.

**API.**

- **`TModule`** (constructor): The matrix Ore action with nilpotent differential at t.
- **`TModule.differential`** (projection): The constant-coefficient matrix dΦ\_t.
- **`TModule.Hom`** (constructor): Polynomial intertwiners UΦ\_t=Ψ\_tU.
- **`TModule.isAbelian`** (characterisation): M(Φ) is finite locally free over L\[t].
- **`TModule.ofDrinfeld`** (compatibility): The dimension-one matrix action of a Drinfeld F\[t]-module.
- **`TModule.ext`** (extensionality): In fixed affine coordinates over F\[t], equality of the action of t determines the t-module.
- **`TModule.Hom.id`** (constructor): The identity intertwiner is the identity Ore matrix.
- **`TModule.Hom.comp`** (structure): Compose intertwiners by matrix multiplication; associativity and identity laws follow from the native matrix laws.

**Checks.**

- **`TModule_test_carlitz`** (compatibility): For d=1 and Φ\_t=θ+τ the differential is θ and the motive has rank one.
- **`TModule_test_nilpotent`** (computation): For Φ\_t=θI_2+\[\[0,1],\[0,0]], the nilpotent part squares to zero and is allowed.
- **`TModule_test_semisimple_differential`** (non-example): A diagonal differential diag(θ,θ+1) fails the nilpotence condition.
- **`TModule_test_nonabelian`** (non-example): The scalar action Φ\_t=θI_d is a t-module but, for d>0, its row motive is not finite over L\[t].

**Acceptance.** Rank-one Drinfeld modules are dimension-one Anderson modules, while motive rank need not equal dimension.

**Uses.**

- DM.4: The motive functor and tensor-power examples.
- DM.8: Only abelian/A-finite, analytically trivial eligible objects enter period theorems.

**Used by:** [4.3](#dm-4-contravariant-motive), [4.6](#dm-4-uniformizability), [4.9](#dm-4-star-adapter).

**Suggested file.** The native affine-coordinate t-module and matrix Hom are given. The full relative vector-group version imports existing bundles; differential is theta times identity plus a nilpotent matrix.

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l2b--geometric-vector-bundles`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-effective-a-motive"></a>

### 4.2 Effective A-motives

**Target** `DrinfeldModulesAndTModules:DM.4/effective-a-motive` (definition). **Planet:** Effective A-motive.

Put A_R=A⊗F R, σ=id_A⊗Frob_q,R and J=ker(A_R→R, a⊗b↦γ(a)b). An effective A-motive of rank r and dimension d is a finite projective A_R-module M of rank r with an injective A_R-linear map τ\_M:σ\* M→M whose cokernel is locally free of rank d over R and annihilated by J^d. Without specifying dimension, Hartl calls a motive effective when some J^n kills the cokernel; this weaker condition alone does not define dimension d over a nonreduced base. Here σ\*M=M⊗\_(A_R,σ) A_R. Morphisms are A_R-linear maps commuting with this linearized Frobenius. For polynomial A over a field, coker dimension is d and (t−θ)^n kills it for some n; d also bounds a nilpotence exponent. No perfection of R is required.

**Hypotheses.** A as in DM.0; commutative F-algebra R and characteristic map γ; locally constant r,d.

**Proof route.**

- Define scalar extension along σ with native tensor products and its linearized map.
- Form the module cokernel and support at J.
- Over nonreduced or imperfect coefficients use linearization, not the raw semilinear image; scalar extension is essential.
- Retain J^d coker τ\_M=0 in the dimension-d structure. Over a field the dimension bound follows from nilpotence on a d-dimensional vector space; that argument does not extend to an arbitrary nonreduced R.

**Needs:** `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`; `mathlib:Module.End`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 1.1, p. 2; Definition 2.1, p. 4; Proposition 2.3, pp. 5–6; Proposition 2.4, p. 6: Finite projectivity, the linearized map and relative cokernel distinguish effective motives from arbitrary difference modules.

**API.**

- **`EffectiveAMotive`** (constructor): Finite projective M with τ\_M:σ\*M→M and the specified cokernel. (stated here only; not a declaration of the suggested file)
- **`EffectiveAMotive.rank`** (data): The A_R-module rank. (a coordinate model in the suggested file)
- **`EffectiveAMotive.dimension`** (data): The R-rank of coker τ\_M. (a coordinate model in the suggested file)
- **`EffectiveAMotive.baseChange`** (functoriality): Coefficient extension carries the linearized Frobenius and its support ideal. (a coordinate model in the suggested file)
- **`EffectiveAMotive.matrix`** (compatibility): For free L\[t]^r, a matrix Θ with det Θ=c(t−θ)^d, c∈L×, gives rank r and dimension d; the cokernel nilpotence must be checked. (a coordinate model in the suggested file)
- **`EffectiveAMotive.dimension_bound`** (characterisation): For dimension d the cokernel is locally free of R-rank d and J^d annihilates it. An unspecified annihilating power is a weaker effective condition. (stated here only; not a declaration of the suggested file)
- **`EffectiveAMotive.matrix_ext`** (extensionality): For free polynomial-ring motives in the same fixed basis, equality of Frobenius matrices determines the coordinate object; abstract projective motives use Frobenius-compatible isomorphisms. (a coordinate model in the suggested file)

**Checks.**

- **`EffectiveAMotive_test_carlitz`** (computation): For M=L\[t], τ\_M is multiplication by t−θ after q-coefficient twist; rank=dimension=1.
- **`EffectiveAMotive_test_tensor`** (computation): Multiplication by (t−θ)^n on rank-one L\[t] has dimension n.
- **`EffectiveAMotive_test_support`** (non-example): Multiplication by t−b with b≠θ has cokernel at the wrong characteristic point.
- **`EffectiveAMotive_test_linearization`** (non-example): Over an imperfect L, the set of values of the raw q-semilinear τ need not be an L-submodule and cannot be used directly as its module cokernel.
- **`EffectiveAMotive_test_nonreduced_bound`** (non-example): For R=F\[ε]/(ε²), γ(t)=0 and τ\_M multiplication by t−ε on R\[t], coker τ\_M≅R has rank one and is killed by t², but not by t. It is effective in the unspecified-dimension sense and fails Hartl’s dimension-one condition.

**Acceptance.** The Frobenius fixes A and raises only coefficient-ring elements to q-th powers.

**Uses.**

- DM.4: Contravariant anti-equivalence.
- DM.5: Rational motive category and Tate realizations.
- DM.1 and DM.7: Characteristic completion and torsion comparisons.

**Used by:** [1.2](#dm-1-finite-flat-torsion), [1.7](#dm-1-characteristic-local-realization), [4.3](#dm-4-contravariant-motive), [4.4](#dm-4-abelian-antiequivalence), [4.5](#dm-4-purity), [4.8](#dm-4-inverse-twist-dual-motive), [5.1](#dm-5-rational-motive-realization).

**Suggested file.** EffectiveTMotive is the finite-free F\[t]-coordinate presentation with an injective linearization and characteristic-supported cokernel. General projective A-tensor modules and their matrix-localization/descent API need AlgebraicCurves and AlgebraicVectorBundles; the scope is not silently replaced by the free case. The additional nonreduced-base example is a native polynomial-ideal test. The field coordinate type’s unspecified support exponent is sufficient only in its stated field scope, where the exponent is bounded by cokernel dimension.

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-contravariant-motive"></a>

### 4.3 The contravariant motive functor

**Target** `DrinfeldModulesAndTModules:DM.4/contravariant-motive` (construction).

For an Anderson A-module E/R, set M(E)=Hom_(F-module schemes/R)(E,G_a,R). A acts by precomposition with φ\_a and R acts by postcomposition with scalars; τ acts by postcomposition with q-Frobenius. When E is coordinate G_a^d this is the row module R{τ}^{1×d}. For a morphism f:E→E′, M(f):M(E′)→M(E) is precomposition by f. If E is abelian of rank r and dimension d, this is an effective A-motive and coker τ\_M≅Hom_R(Lie E,R).

**Hypotheses.** The relative abelianness condition for the effective-motive conclusion; coordinate description valid without it.

**Proof route.**

- Entrywise FF.4 gives the row representation.
- The A-action is right composition with φ\_a and commutes with left τ and R.
- Differentiation kills the linearized τ-image, producing the Lie-dual quotient.
- Finite projectivity and support at J follow from abelianness and the nilpotent differential.

**Needs:** [`DM.4/t-module`](#dm-4-t-module) (4.1); [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Remark 3.3, p. 8; Theorem 3.5 and proof, pp. 8–9: Precomposition makes the functor contravariant; the explicit proof fixes the source display’s reversed Hom convention.

**API.**

- **`TModule.motive`** (constructor): M(Φ)=L{τ}^{1×d} with right-composition t-action.
- **`TModule.motiveMap`** (functoriality): For U:Φ→Ψ, M(U):M(Ψ)→M(Φ), m↦mU.
- **`TModule.motiveMap_comp`** (structure): M(VU)=M(U)∘M(V).
- **`TModule.motiveLieDual`** (compatibility): coker τ\_M≅(Lie Φ)∨ in the abelian range.

**Checks.**

- **`motive_test_carlitz`** (computation): With generator 1, the Carlitz relation is τ·1=(t−θ)·1.
- **`motive_test_variance`** (non-example): A map Φ→Ψ produces a map M(Ψ)→M(Φ), not one in the original direction.
- **`motive_test_dimension_rank`** (computation): The n-th Carlitz tensor power has motive rank one and Lie-dual quotient dimension n.
- **`motive_test_scalar_not_finite`** (non-example): For Φ\_t=θ on G_a, each τ^i is a t-eigenvector of eigenvalue θ^(q^i); the row motive is not finitely generated over L\[t].

**Acceptance.** An intertwiner U is sent to right multiplication by U on row motives.

**Uses.**

- DM.4: Recovering the Anderson module.
- DM.5 and DM.7: Transports Hom and realization comparisons.

**Used by:** [1.4](#dm-1-geometric-torsion-basis), [4.4](#dm-4-abelian-antiequivalence), [4.7](#dm-4-carlitz-tensor-power), [5.1](#dm-5-rational-motive-realization), [5.8](#dm-5-tate-semisimplicity), [7.3](#dm-7-drinfeld-to-sheaf).

**Suggested file.** The native coordinate motive, reversed maps and linearized tau-image Lie-dual quotient are given. General A-projectivity and relative descent use the effective A-motive supplier.

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`; `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l2b--geometric-vector-bundles`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-abelian-antiequivalence"></a>

### 4.4 The abelian Anderson anti-equivalence

**Target** `DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence` (theorem). **Planet:** Anderson motive anti-equivalence.

The contravariant functor E↦M(E) is fully faithful from abelian Anderson A-modules over R to effective A-motives. Its essential image consists exactly of effective motives that become finite free left R′{τ}-modules after a faithfully flat coefficient extension R→R′. Rank over A_R is the Anderson rank, and coker τ\_M has R-rank equal to the group dimension. For polynomial A over a field, the corresponding category is effective L\[t]-motives finite free over L{τ}; this is not the category of all effective A-motives.

**Hypotheses.** Same coefficient algebra and characteristic; abelianness and fpqc-local Ore freeness; no generic-characteristic assumption in the relative theorem.

**Proof route.**

- Choose an Ore basis after faithfully flat extension.
- Right matrices for the A-action reconstruct φ; the cokernel condition gives its nilpotent differential.
- Intertwiner matrices identify Hom in the reversed direction.
- Use effective fpqc descent of affine groups and morphisms to descend the reconstructed object.

**Needs:** [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3); [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2); `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`; `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`.

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 3.5 and proof, pp. 8–9: The theorem gives full faithfulness and the precise fpqc-local Ore-free essential image.

**Acceptance.**

- The n-th Carlitz tensor motive reconstructs an n-dimensional t-module.
- A general effective motive without local Ore freeness is not assigned an Anderson module.

**Used by:** [4.5](#dm-4-purity), [4.7](#dm-4-carlitz-tensor-power), [5.7](#dm-5-tate-surjectivity), [7.4](#dm-7-elliptic-antiequivalence).

**Suggested file.** The general relative effective A-motive anti-equivalence is a full mathematical target. The native affine motive and its variance do not by themselves supply the strict group/sheaf reconstruction.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-purity"></a>

### 4.5 Purity of polynomial-ring motives

**Target** `DrinfeldModulesAndTModules:DM.4/purity` (definition). **Planet:** Pure t-motive.

For an abelian t-motive M of rank r over L\[t], extend it to L((1/t)). It is pure if there are positive integers u,v and an L\[\[1/t]]-lattice H of rank r such that t^uH=τ^vH, interpreted via v-fold linearized coefficient Frobenius. The weight is u/v, independent of this choice, and equals d/r for a nonzero pure effective motive of dimension d. Purity is additional data/property, not part of the definition of every t-module or every effective motive.

**Hypotheses.**

- Polynomial A; pure effective finite-rank motive; the positive-dimension weight statement is in this range.
- The raw Frobenius-image lattice formulation in the Suggested coordinate model uses perfect L; over imperfect coefficients use the linearized scalar-pullback formulation, not an unlinearized image.

**Proof route.**

- Specify the infinity lattice and iterate of the linearized map.
- Compare determinants of τ^v on the lattice to identify u/v=d/r.
- A common iterate compares two choices and proves weight independence.

**Needs:** [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2); [`DM.4/abelian-antiequivalence`](#dm-4-abelian-antiequivalence) (4.4); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §4.1, p. 15: Purity uses a Frobenius-stable infinity lattice and fixes the rank/dimension weight convention.
- [MAURISCHAT-2026](#source-maurischat-2026), Definition 7.1, p. 35: Weight is d/r and agrees with u/v for every purity-lattice witness; raw Frobenius is used over perfect coefficients.

**API.**

- **`EffectiveTMotive.isPure`** (characterisation): Existence of an infinity lattice with t^uH=τ^vH.
- **`EffectiveTMotive.weight`** (data): Define weight as d/r; for a pure nonzero motive it equals u/v for every purity-lattice witness.
- **`EffectiveTMotive.weight_eq`** (compatibility): For every purity lattice with positive u,v, weight=u/v=d/r; therefore the witness does not change the weight.
- **`EffectiveTMotive.pureTensor`** (functoriality): Tensor products of pure motives are pure with weights added.
- **`EffectiveTMotive.PureLattice`** (characterisation): A specified pair of positive integers u,v and an infinity lattice H satisfy the spanning, rank and equality t^uH=τ^vH conditions.

**Checks.**

- **`purity_test_carlitz`** (computation): Carlitz has r=d=1 and weight one.
- **`purity_test_tensor_power`** (computation): The n-th Carlitz tensor power has r=1,d=n and weight n.
- **`purity_test_mixed`** (non-example): The direct sum of Carlitz and its second tensor power has different slopes one and two and is not pure.

**Acceptance.** Carlitz tensor power n has weight n, not 1/n.

**Uses.**

- DM.4: Distinguishes eligible analytic motives.
- DM.8: Purity hypotheses must be retained when a period theorem uses them.

**Used by:** [4.7](#dm-4-carlitz-tensor-power).

**Suggested file.** The native infinity lattice uses Laurent series and an actual semilinear matrix. Its raw-image formulation uses perfect coefficients; an imperfect-field version needs the linearized scalar pullback. General A and purity descent use the function-ring/infinity interfaces.

**Open input:** [Native geometric and analytic signature integration](#gap-native-geometric-and-analytic-signature-integration).

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-uniformizability"></a>

### 4.6 Uniformizable t-modules

**Target** `DrinfeldModulesAndTModules:DM.4/uniformizability` (definition).

For an abelian t-module E over C_∞ with differential θI+N, its unique normalized entire exponential exp_E:C_∞^d→E(C_∞) intertwines dΦ\_t with Φ\_t. Uniformizable means this map is surjective. Its kernel Λ\_E is discrete and carries the differential A-action. Export this predicate and the exponential to DM.8, whose rigid-triviality comparison identifies it with analytic triviality under the abelian hypotheses. The rigid predicate and its comparison are owned by DM.8; they are not prerequisites for defining exp_E or uniformizability here.

**Hypotheses.**

- C_∞; abelian t-module, generic characteristic, exact analytic hypotheses of the selected theorem.
- In the normed coordinate prototype, 1<‖θ‖ is an argument of the exponential and the predicates themselves; no arbitrary special-characteristic exponential is posited.

**Proof route.**

- Solve the matrix coefficient recurrence; the nilpotent differential gives unique coefficients and infinite radius.
- Form the kernel and the surjectivity predicate using the actual exponential map.
- Export the normalized exponential, its kernel and the surjectivity predicate to the DM.8 rigid-triviality comparison; its proof is the consumer’s responsibility. No circular prerequisite on that comparison is introduced.

**Needs:** [`DM.2/c-infinity`](#dm-2-c-infinity) (2.2); [`DM.4/t-module`](#dm-4-t-module) (4.1); `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), §3.1, pp. 8–10; Theorem 4.2, §4.1, p. 16: The source makes surjectivity a separate property and states the analytic triviality equivalence in the abelian setting.

**API.**

- **`TModule.exp`** (constructor): The normalized entire differential-intertwining exponential.
- **`TModule.exp_functionalEquation`** (relation): exp_E(dΦ\_t z)=Φ\_t(exp_E z).
- **`TModule.isUniformizable`** (characterisation): Function.Surjective exp_E.
- **`TModule.periodLattice`** (data): ker exp_E with the differential A-action.

**Checks.**

- **`uniformizable_test_drinfeld`** (compatibility): For d=1 and a Drinfeld module over C_∞, the exponential and lattice agree with DM.2.
- **`uniformizable_test_tensor_power`** (computation): Every positive Carlitz tensor power is uniformizable.
- **`uniformizable_test_predicate`** (non-example): For an object whose exponential image is a proper subgroup, the surjectivity predicate is false even if its exponential is entire.

**Acceptance.** Every field Drinfeld module in DM.2 is uniformizable, but the definition for general t-modules retains surjectivity as a condition.

**Uses.**

- DM.4: Uniformization of Carlitz tensor powers.
- DM.8: Eligibility for period and logarithm statements.

**Used by:** [4.7](#dm-4-carlitz-tensor-power).

**Suggested file.** The native exponential, its functional equation and surjectivity predicate are coordinate statements. The full general-A projective period lattice and its rank require the analytic input; rigid triviality is an outgoing DM.8 comparison. The native exponential, uniformizability and kernel definitions all take 1<‖θ‖ explicitly, as does their functional equation.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-carlitz-tensor-power"></a>

### 4.7 Carlitz tensor powers

**Target** `DrinfeldModulesAndTModules:DM.4/carlitz-tensor-power` (construction). **Planet:** Carlitz tensor power.

For n≥1 define C^⊗n on G_a^n by Φ\_t=θI_n+N_n+E_(n,1)τ, where N_n has ones on the superdiagonal. It is abelian, uniformizable and pure. Its contravariant motive is free of rank one over L\[t], with τ m=(t−θ)^n m; its group dimension is n and motive rank is one. Under tensor products of motives, these rank-one motives multiply their exponents.

**Hypotheses.** n≥1; θ generic and coefficient extension to C_∞ for uniformizability.

**Proof route.**

- Construct the nilpotent matrix and its bottom-left Frobenius term.
- Use the row-generator relations to compute the cyclic L\[t]-motive and its cokernel.
- The infinity-lattice relation gives purity and weight n; analytic trivialization imports the Carlitz Ω supplier to show uniformizability.

**Needs:** [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3); [`DM.4/abelian-antiequivalence`](#dm-4-abelian-antiequivalence) (4.4); [`DM.4/purity`](#dm-4-purity) (4.5); [`DM.4/uniformizability`](#dm-4-uniformizability) (4.6); [`DM.2/omega`](#dm-2-omega) (2.10).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §3.3, pp. 10–11; §4.3, pp. 16–17: The matrix has nilpotent superdiagonal and bottom-left τ, and the motive has rank one.

**API.**

- **`carlitzTensor`** (constructor): The n-dimensional matrix t-module.
- **`carlitzTensor_differential`** (simp): dΦ\_t=θI+N_n, with N_n^n=0.
- **`carlitzTensor_motive`** (compatibility): M(C^⊗n)≅L\[t], τ m=(t−θ)^n m. (a coordinate model in the suggested file)
- **`carlitzTensor_rank_dimension`** (data): Motive rank one and dimension n.

**Checks.**

- **`carlitzTensor_test_one`** (compatibility): n=1 is the Carlitz module.
- **`carlitzTensor_test_two`** (computation): For n=2, t·(x,y)=(θx+y,θy+x^q).
- **`carlitzTensor_test_rank`** (non-example): For n=2 the motive rank is one, not two, while its τ-cokernel has L-dimension two.

**Acceptance.** At n=1 recover θ+τ.

**Uses.**

- DM.4: Checks motive and dual conventions.
- DM.8: Period matrix Ω^n and positive-characteristic special values.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-inverse-twist-dual-motive"></a>

### 4.8 Effective dual t-motives

**Target** `DrinfeldModulesAndTModules:DM.4/inverse-twist-dual-motive` (definition). **Planet:** Effective dual t-motive.

Over a perfect coefficient field L containing F, let L\[t,σ] have σc=c^(1/q)σ and σt=tσ. An effective dual t-motive is a finite free L\[t]-module H with inverse-q-semilinear σ and (t−θ)^ℓ(H/σH)=0 for some ℓ≥0; the image here is an L\[t]-submodule because L is perfect. In the finite-dimensional t-module correspondence also require H finite free over L\[σ], of rank d; call that condition A-finiteness on the dual side. These two versions are distinguished explicitly. The Ngo Dac source uses the first, broader effective definition.

**Hypotheses.** L perfect; generic θ in period applications; the L\[σ]-freeness condition is not silently added to Ngo Dac Definition 4.1.

**Proof route.**

- Import inverse coefficient twisting from DM.8.
- Define the Ore module with variable t fixed by the twist.
- Use its σ-cokernel to express characteristic support; maintain the stronger Ore-freeness eligibility as a separate condition.

**Needs:** [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2); [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1).

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), Definition 4.1 and §4.1, pp. 16–17: The effective definition fixes σ-direction and characteristic support, without requiring L\[σ]-freeness.

**API.**

- **`EffectiveDualTMotive`** (constructor): Finite free L\[t]-module H with inverse-twist σ and characteristic-supported quotient.
- **`EffectiveDualTMotive.matrix`** (projection): In a basis, σh=Φh with inverse coefficient twist.
- **`EffectiveDualTMotive.isAFinite`** (characterisation): The corresponding row Ore module is finite free over L\[σ].
- **`EffectiveDualTMotive.baseChange`** (functoriality): Perfect coefficient extension preserves the defining matrix and support condition.
- **`EffectiveDualTMotive.ext`** (extensionality): In a fixed polynomial basis and with fixed inverse Frobenius, equality of the Frobenius matrices determines the dual motive.

**Checks.**

- **`dualMotive_test_carlitz`** (computation): For H=L\[t], σh=(t−θ)h, the quotient has dimension one.
- **`dualMotive_test_tensor`** (computation): σh=(t−θ)^n h gives rank one and quotient dimension n.
- **`dualMotive_test_twist`** (non-example): Using q-th coefficient powers instead of q-th roots changes σc=c^(1/q)σ and fails the inverse-twist relation.

**Acceptance.** A rank-one Carlitz dual motive has σh=(t−θ)^n h.

**Uses.**

- DM.4: The star adapter and point realization.
- DM.8 and characteristic-p multiple-zeta consumers: Difference equations with the Ngo Dac σ convention.

**Used by:** [4.9](#dm-4-star-adapter), [4.10](#dm-4-dual-realization), [8.15](#dm-8-rigid-triviality), [8.17](#dm-8-fundamental-betti-basis), [8.18](#dm-8-integral-trivialization), [8.19](#dm-8-betti-exact-tensor), [8.20](#dm-8-neutral-category), [8.32](#dm-8-tannakian-identification), [8.36](#dm-8-specialization-rank), [8.40](#dm-8-logarithm-matrices), [8.41](#dm-8-logarithm-motive-membership), [8.47](#dm-8-constant-denominator).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-star-adapter"></a>

### 4.9 The star anti-isomorphism

**Target** `DrinfeldModulesAndTModules:DM.4/star-adapter` (construction).

For a scalar Ore polynomial f=Σ a_iτ^i set f\*=Σ a_i^(1/q^i)σ^i. Then (fg)\*=g\*f\*. For matrices also transpose: (U\*)\_(ij)=(U_(ji))\* so that (UV)\*=V\*U\*. Given a coordinate t-module Φ, its row dual motive is L\[σ]^{1×d} with t acting on the right by Φ\_t\*. An intertwiner U:Φ→Ψ induces h↦hU\* from the row module for Φ to that for Ψ, so this dual construction is covariant. Finite freeness over L\[t] is a separate A-finiteness hypothesis.

**Hypotheses.** L perfect; fixed q; coordinate t-modules; matrix sizes match.

**Proof route.**

- Check σc=c^(1/q)σ on scalar monomials.
- Extend additively and reverse multiplication; transpose accounts for matrix order.
- Apply the operation to UΦ\_t=Ψ\_tU and derive the dual right-module intertwiner.

**Needs:** [`DM.4/t-module`](#dm-4-t-module) (4.1); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §4.4, pp. 17–18: The star operation relates τ-polynomial t-modules and σ-polynomial dual motives; abelian and A-finite conditions are distinguished.

**API.**

- **`oreStar`** (constructor): Σ a_iτ^i↦Σ a_i^(1/q^i)σ^i.
- **`oreStar_mul`** (relation): oreStar(fg)=oreStar(g)oreStar(f).
- **`matrixOreStar`** (constructor): Entrywise star followed by transpose.
- **`TModule.dualMotive`** (constructor): The row L\[σ]-module with t acting by Φ\_t\*.
- **`TModule.dualMotiveMap`** (functoriality): U induces right multiplication by U\*, in the same direction on t-modules.

**Checks.**

- **`oreStar_test_scalar`** (degenerate): (Cc)\*=Cc.
- **`oreStar_test_monomial`** (computation): (aτ²)\*=a^(1/q²)σ².
- **`oreStar_test_order`** (non-example): (τ·a)\*=aσ, whereas τ\* a\*=σa=a^(1/q)σ; multiplication order must reverse.
- **`oreStar_test_matrix`** (compatibility): A d′×d intertwiner becomes a d×d′ matrix after star-transpose.

**Acceptance.** The scalar polynomial θ+τ has star θ+σ.

**Uses.**

- DM.4: Covariant dual motive and point realization.
- DM.8: Reconciles σ- and τ-matrix equations without changing conventions.

**Used by:** [4.10](#dm-4-dual-realization), [8.15](#dm-8-rigid-triviality).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-dual-realization"></a>

### 4.10 Dual motives and t-module points

**Target** `DrinfeldModulesAndTModules:DM.4/dual-realization` (comparison).

For the row dual module H=L\[σ]^{1×d} associated to Φ over a perfect field, define δ₁(Σ h_iσ^i)=Σ h_i^(q^i) coordinatewise. It induces an F-linear A-module isomorphism H/(σ−1)H≅E(L), with the t-action inherited from Φ\_t\*. The denominator means the F-linear image of σ−1, not an L-linear submodule. For an effective dual motive finite free over both L\[t] and L\[σ], this reconstructs its A-finite t-module; over perfect L this is abelian as well: Maurischat Theorem 6.6 proves abelian iff A-finite, and Corollary 8.1 extends this equivalence to Anderson A-modules by restriction along a finite extension A/F\[t]. This theorem concerns finite generation of the motive of an actual Anderson module; it does not add Ore-finiteness to the broader effective dual-motive definition.

**Hypotheses.** Perfect L; finite Ore rank d; use A-finiteness for a finite L\[t]-rank dual motive.

**Proof route.**

- Reduce σ-degree using (σ−1) and inverse coefficient twist.
- δ₁ is zero on this image and each row has a unique constant representative in the quotient.
- The star relation identifies the t-action with the original coordinate action.
- For a matrix D defining Φ\_t, use the left and right block-power rank criteria of Propositions 6.4 and 6.5. Theorem 4.1 identifies both criteria with positive slopes of the last invariant factor of tI−D over the complete valued skew field L({σ}); Proposition 6.1 turns either criterion into both finite-generation conclusions. This Laurent σ=τ⁻¹ convention is distinct from the literal star dual module.
- For general A choose a nonconstant t by Riemann–Roch; A is finite over F\[t], so finite generation over A⊗F L is equivalent to finite generation over L\[t]. Retain perfect coefficients; no relative nonperfect-base theorem is asserted.

**Needs:** [`DM.4/star-adapter`](#dm-4-star-adapter) (4.9); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [BP-RAPID](#source-bp-rapid), Theorem 4.3, §4.4, p. 18; §4.5, pp. 18–19: The δ₁ quotient uses Frobenius-adjusted coefficients and only F-linearity.
- [MAURISCHAT-2026](#source-maurischat-2026), Theorem 6.6 and proof, pp. 34–35; Corollary 8.1 and proof, p. 43: Over a perfect field, finite generation of the motive and dual motive are equivalent, including general A by finite coefficient restriction.

**Acceptance.** For H=L\[t], σh=(t−θ)h, the quotient realizes Carlitz points; using an L-linear quotient destroys the point action.

**Used by:** [8.20](#dm-8-neutral-category), [8.41](#dm-8-logarithm-motive-membership).

**Open input:** [Valued-skew-field proof inputs](#gap-valued-skew-field-proof-inputs).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-5"></a>

## Layer DM.5: The integral and rational Tate theorem

For Drinfeld modules over a field finitely generated over F_q and a prime λ away from the characteristic, the map Hom(φ, ψ) ⊗ A_λ → Hom_Galois(T_λφ, T_λψ) is injective with saturated image, and it is an isomorphism: the Tate theorem of Taguchi and Tamagawa, planned along Stalder's proof, which allows finitely generated coefficient fields of any transcendence degree and both generic and special characteristic. The route through rational motives factors coefficient extension through a rational local coefficient algebra and then through the completed one; the period ring provides the second algebraization step. Integral saturation and the simplicity input for semisimplicity remain explicit proof inputs.

<a id="dm-5-rational-motive-realization"></a>

### 5.1 Rational motives and their Tate realization

**Target** `DrinfeldModulesAndTModules:DM.5/rational-motive-realization` (construction).

Let K_0=Frac(A) and L a coefficient field with fixed γ. Rationalize the effective A-motive category by Hom⁰(M,N)=K_0⊗A Hom(M,N). For λ≠ker γ put L_(λ)=the total quotient ring Frac((F_λ⊗F L)\[\[z]]) after a residue-field splitting, where F_λ=A/λ and z is a local parameter. Complete M to this coefficient ring and take τ-invariants after L→L^sep; this gives its rational Tate realization V_λ(M) over K_0,λ. For a Drinfeld module E, V_λ(E) is canonically dual to V_λ(M(E)); the dual changes the motive’s Hom direction back to the group’s direction. The precise finite-level pairing is supplied by the finite-shtuka realization.

**Hypotheses.**

- Effective finite-rank motives with characteristic λ avoided; splitting factors are retained, not discarded.
- Frac for the split completed coefficient algebra denotes its total quotient ring, with every residue-field factor retained; it is generally a product of fields. The rational scalar extension K_0,λ,L=Frac(K_0,λ⊗F L) is not replaced by the full Laurent-series completion.

**Proof route.**

- Localize Hom at nonzero elements of A and prove well-defined composition.
- Complete the module and its linearized Frobenius; it is invertible at λ.
- Use finite-shtuka pairing and passage to inverse limits for the dual identification.

**Needs:** [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2); [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3); [`DM.1/tate-module`](#dm-1-tate-module) (1.5); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [STALDER-2008](#source-stalder-2008), Definitions 2.1–2.2, pp. 5–6; Definition 2.26, pp. 12–13; Proposition 2.28, pp. 13–14; Proposition 4.7, p. 24: The rational motive category and its completed Frobenius realization fix the coefficient rings. The Drinfeld point duality is read with Hartl §6.

**API.**

- **`AMotive.HomIsogeny`** (constructor): K_0⊗A Hom(M,N). (stated here only; not a declaration of the suggested file)
- **`AMotive.rationalTate`** (constructor): The completed τ-fixed rational realization. (stated here only; not a declaration of the suggested file)
- **`AMotive.rationalTateMap`** (functoriality): A motive morphism acts covariantly on τ-invariants. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModule.motiveTateDual`** (compatibility): V_λ(E)≅V_λ(M(E))∨ with equivariant finite-level pairing. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`rationalMotive_test_identity`** (degenerate): The identity motive morphism realizes as the identity. (stated here only)
- **`rationalMotive_test_isogeny`** (compatibility): A nonzero Drinfeld isogeny becomes an isomorphism after rationalization. (stated here only)
- **`rationalMotive_test_carlitz_dual`** (non-example): The rank-one Carlitz motive realization has inverse character to the Carlitz point realization; identifying them without dualization reverses the Galois character. (stated here only)

**Acceptance.** Dualizing twice restores the Drinfeld Hom direction.

**Uses.**

- DM.5: The Tate comparison and semisimplicity proof route.

**Used by:** [5.4](#dm-5-local-algebraization), [5.5](#dm-5-period-ring), [5.7](#dm-5-tate-surjectivity), [5.8](#dm-5-tate-semisimplicity), [7.6](#dm-7-tate-realization).

**Suggested file.** The rational A-isomotive category, completed residue factors, fixed-module realizations and point/motive duality require the recorded completion and finite-shtuka inputs. The literal completion of point Hom below is not a period-ring substitute.

**Open input:** [Strict finite F-module / finite-shtuka realization](#gap-strict-finite-f-module-finite-shtuka-realization).

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-hom-map"></a>

### 5.2 The Tate Hom map

**Target** `DrinfeldModulesAndTModules:DM.5/tate-hom-map` (construction). **Planet:** Tate Hom comparison.

For Drinfeld modules E,E′ over the same (L,γ) and λ≠ker γ, define α\_λ:A_λ⊗A Hom_L(E,E′)→Hom_(A_λ,G_L)(T_λE,T_λE′) by b⊗u↦b·T_λu. It is A_λ-linear, commutes with composition and identities, and becomes the corresponding K_0,λ-linear rational comparison after inverting λ. It is defined over any coefficient field, but the Tate isomorphism below requires finite generation over F.

**Hypotheses.** Same characteristic map and nonzero finite prime away from it; no finite-generation hypothesis needed just to define α.

**Proof route.**

- Use the torsion-induced maps of DM.1.
- Bilinearity gives the tensor-product lift.
- Equivariance and composition hold at every finite level and hence in the limit.

**Needs:** [`DM.1/tate-module`](#dm-1-tate-module) (1.5); [`DM.1/continuous-galois-action`](#dm-1-continuous-galois-action) (1.6); [`DM.0/drinfeld-module-hom`](#dm-0-drinfeld-module-hom) (0.6).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 5.16, p. 34: The integral and rational Hom maps are the natural realization maps, under the selected fixed-characteristic hypotheses.

**API.**

- **`DrinfeldModule.tateHomMap`** (constructor): α\_λ(b⊗u)=b T_λu.
- **`DrinfeldModule.tateHomMap_pure`** (simp): The image of 1⊗u is T_λu.
- **`DrinfeldModule.tateHomMap_comp`** (functoriality): The comparison respects composition.
- **`DrinfeldModule.tateHomMap_rational`** (compatibility): Scalar extension to K_0,λ is the rational comparison. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`tateHom_test_identity`** (degenerate): α\_λ(1⊗id)=id.
- **`tateHom_test_scalar`** (computation): For a∈A, α\_λ(1⊗φ\_a)=a·id.
- **`tateHom_test_extra_endomorphisms`** (non-example): For φ\_t=τ² over F_{q²}, λ=(t−1), both τ and F_{q²} scalars are endomorphisms; the domain is not assumed cyclic over A.

**Acceptance.** For a scalar a∈A the induced action is multiplication by a.

**Uses.**

- DM.5: Injectivity, saturation and Tate surjectivity.

**Used by:** [5.3](#dm-5-tate-injectivity), [5.6](#dm-5-tate-image-saturation).

**Suggested file.** The native completed-tensor Hom map targets coefficient-automorphism-equivariant principal Tate modules. Its full absolute-Galois and rational-motive formulation uses the recorded completion and finite-shtuka inputs.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-injectivity"></a>

### 5.3 Injectivity of the Tate comparison

**Target** `DrinfeldModulesAndTModules:DM.5/tate-injectivity` (theorem).

The natural integral Tate comparison α\_λ is injective for field Drinfeld modules with λ away from characteristic. In particular a morphism acting as zero on every λ-power torsion scheme is zero. The tensor statement uses finite torsion-freeness of the Hom A-module, not only pointwise injectivity of u↦T_λu.

**Hypotheses.** The field, characteristic and prime hypotheses of tate-hom-map.

**Proof route.**

- A nonzero q-polynomial cannot kill torsion of unbounded scheme order.
- Boundedness and lattice arguments make Hom a finite torsion-free A-module.
- If a completion-linear combination acts trivially, reduce modulo λ^n and use λ-divisibility of Hom: vanishing on E\[λ^n] implies factorization through the ideal isogeny. This integral division input is recorded with tate-image-saturation.

**Needs:** [`DM.5/tate-hom-map`](#dm-5-tate-hom-map) (5.2); [`DM.0/kernel-scheme`](#dm-0-kernel-scheme) (0.8); [`DM.1/geometric-torsion-basis`](#dm-1-geometric-torsion-basis) (1.4); [`DM.5/tate-image-saturation`](#dm-5-tate-image-saturation) (5.6).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 2.28, pp. 12–14: Faithful integral and rational realizations and finite Hom bounds.
- [PAPIKIAN-2017](#source-papikian-2017), §3.1, pp. 10–12: The Drinfeld Tate map and its injectivity route in the public lecture notes.

**Acceptance.** Any nonzero scalar endomorphism induces a nonzero Tate map.

**Used by:** [5.7](#dm-5-tate-surjectivity).

**Open input:** [Integral Tate image saturation](#gap-integral-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-local-algebraization"></a>

### 5.4 Local algebraization of motive maps

**Target** `DrinfeldModulesAndTModules:DM.5/local-algebraization` (theorem).

Let L be finitely generated over F. Put K_0,L=Frac(K_0⊗F L), K_0,λ,L=Frac(K_0,λ⊗F L), and L_(λ)=Frac((F_λ⊗F L)\[\[z]]). A restricted module means a finite projective module with invertible Frobenius linearization; at λ it has a finite-projective integral lattice with invertible Frobenius. Extension K_0,L→K_0,λ,L is K_0,λ/K_0-fully faithful on such modules and preserves semisimple objects. Extension K_0,λ,L→L_(λ) is fully faithful on the λ-restricted objects and preserves semisimple objects. Thus completed Frobenius-equivariant maps are algebraized over the rational coefficient ring. The first ring is not the full completed Laurent-series ring unless L is finite.

**Hypotheses.**

- Finitely generated coefficient field L, hence finitely many roots of unity; K_0,λ/K_0 separable; the λ-restricted integral model condition is explicit.
- Frac for the split completed coefficient algebra denotes its total quotient ring, with every residue-field factor retained; it is generally a product of fields. The rational scalar extension K_0,λ,L=Frac(K_0,λ⊗F L) is not replaced by the full Laurent-series completion.

**Proof route.**

- For scalar extension, reduce to finite and one-variable transcendental extensions; Frobenius-fixed denominators descend to the constant field.
- Prove separability of the function-field completion by a separating local parameter.
- Use the period ring and its two fixed-ring identities to construct a full faithful left-adjoint realization functor.
- Every invariant subobject is quasigeometric; the descended lattice supplies the λ-restricted condition.

**Needs:** [`DM.5/period-ring`](#dm-5-period-ring) (5.5); [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [STALDER-2008](#source-stalder-2008), Theorem 3.11 with proof, pp. 18–21; Theorem 4.8 and Proposition 4.9, pp. 25–26; Theorem 5.15, p. 33: The two scalar extensions separate constant completion from coefficient completion, and each has its own full-faithfulness argument.

**Acceptance.** When L is finite the two local coefficient rings agree; for positive transcendence degree they need not.

**Used by:** [5.7](#dm-5-tate-surjectivity), [5.8](#dm-5-tate-semisimplicity).

**Suggested file.** The exact finite-generation and scalar-extension full-faithfulness theorem is a mathematical target; the rational coefficient field and complete Frobenius-module native interfaces are not replaced by arbitrary types.

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-period-ring"></a>

### 5.5 The Tate period ring

**Target** `DrinfeldModulesAndTModules:DM.5/period-ring` (construction).

For finitely generated L/F choose a projective normal F-model X of its function field and compatible extensions of each prime-divisor valuation to L^sep. Inside L_(λ)^sep, let B⁺ be the Laurent series whose coefficients have valuation bounded below at every compatible prime divisor and are integral outside a finite set of divisors of X. Let S consist of invertible integral local series s with σ(s)/s∈K_0,λ⊗F L. Set B=B⁺\[S⁻¹]. It has B^σ=K_0,λ and B^G_L=K_0,λ,L, contains every τ-fixed solution of a λ-restricted finite-rank system, and yields B⊗\_(K_0,λ) V_λ(M)≅B⊗\_(K_0,λ,L)M. Full completion cannot replace B in the algebraization argument.

**Hypotheses.**

- L finitely generated over F; normal proper model; valuation extensions normalized by ramification; finite residue factors retained; σ is q-coefficient Frobenius fixing z.
- Frac for the split completed coefficient algebra denotes its total quotient ring, with every residue-field factor retained; it is generally a product of fields. The rational scalar extension K_0,λ,L=Frac(K_0,λ⊗F L) is not replaced by the full Laurent-series completion.
- Projective normal finite-type F-models exist by projective closure and finite normalization. Transcendence degree need not be one; bounded-pole section spaces use proper coherent finiteness in any dimension.

**Proof route.**

- Choose a projective normal F-model, of any transcendence degree. Cover the finitely many exceptional prime-divisor supports by an effective Cartier divisor using a nonzero homogeneous section of a projective embedding, and raise its power to bound the coefficient poles. The coefficients then lie in H^0(X,O_X(nD)), finite-dimensional by proper coherent finiteness (SF.2/ample-serre-vanishing with a chosen ample line). A curve-only Riemann–Roch statement is not used for higher-dimensional models.
- Construct integral Frobenius units and invert them; the formal functional equations move all solutions into B.
- Prove the σ-fixed and Galois-fixed ring identities before applying invariant tensor arguments.
- The semilinear fixed-vector basis gives the comparison isomorphism. The construction and properties are proved in Stalder §6, not posited as fields in a structure.

**Needs:** [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`; `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`; `SchemeAndStackFoundations:SF.0/excellent-examples`; `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`.

**Sources.**

- [STALDER-2008](#source-stalder-2008), Claim 5.2 and Lemma 5.3, p. 27; Theorem 5.4 and Definition 5.5, p. 28; Definition 6.6, p. 37; Definition 6.10, p. 38; Propositions 6.14 and 6.21, pp. 40 and 43; Theorem 6.23, p. 43: The valuation-defined subring provides both exact fixed rings and contains the Frobenius solutions.

**API.**

- **`TatePeriodRing`** (constructor): The valuation-bounded ring B⁺ localized at the specified Frobenius units. (stated here only; not a declaration of the suggested file)
- **`TatePeriodRing.sigmaFixed`** (characterisation): B^σ=K_0,λ. (stated here only; not a declaration of the suggested file)
- **`TatePeriodRing.galoisFixed`** (characterisation): B^G_L=K_0,λ,L. (stated here only; not a declaration of the suggested file)
- **`TatePeriodRing.comparison`** (equivalence): B⊗V_λ(M)≅B⊗M for λ-restricted systems. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`TatePeriodRing_test_constants`** (compatibility): The scalar K_0,λ embeds into B and is σ-fixed. (stated here only)
- **`TatePeriodRing_test_galois`** (non-example): The fixed ring is K_0,λ,L, not all of L_(λ), when L has positive transcendence degree. (stated here only)
- **`TatePeriodRing_test_solution`** (characterisation): Every coordinate of a τ-fixed basis vector for a λ-restricted system lies in B. (stated here only)

**Acceptance.** The Galois-fixed ring is the rational coefficient ring K_0,λ,L, not the larger completed ring L_(λ).

**Uses.**

- DM.5: The second local scalar extension and Tate surjectivity.

**Used by:** [5.4](#dm-5-local-algebraization).

**Suggested file.** The two distinct fixed rings, divisor-by-divisor valuation bounds, localization and semilinear comparison require the AlgebraicCurves completion/rational-motive coefficient interfaces. An unconstrained series ring would state a different theorem.

**Open input:** [Native geometric and analytic signature integration](#gap-native-geometric-and-analytic-signature-integration).

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-image-saturation"></a>

### 5.6 Integral Hom division and saturation

**Target** `DrinfeldModulesAndTModules:DM.5/tate-image-saturation` (theorem).

For E,E′ over the same coefficient field and λ away from characteristic, the image of A_λ⊗A Hom_L(E,E′) in Hom_(A_λ,G_L)(T_λE,T_λE′) is saturated. Equivalently, if z·h is in the image for a local uniformizer z and h is an integral equivariant Tate map, then h is in the image. Prove this by finite-level kernel factorization/divisibility of algebraic intertwiners, using descent of the quotient isogeny. Rational surjectivity alone does not prove this assertion.

**Hypotheses.** Same characteristic; prime-to-characteristic torsion; finite-projective Hom; local uniformizer chosen only in the completed DVR.

**Proof route.**

- If a morphism kills a finite ideal-torsion subgroup, factor it through the corresponding quotient Drinfeld module.
- Translate divisibility in the completed Hom lattice to the corresponding λ-adic torsion kernels, without assuming λ principal in A.
- Use inverse-limit completeness to identify the full integral lattice. The selected Tate source invokes saturation without proof; this exact input is a recorded gap.

**Needs:** [`DM.0/drinfeld-module-hom`](#dm-0-drinfeld-module-hom) (0.6); [`DM.1/ideal-torsion`](#dm-1-ideal-torsion) (1.1); [`DM.1/etale-torsion`](#dm-1-etale-torsion) (1.3); [`DM.5/tate-hom-map`](#dm-5-tate-hom-map) (5.2).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 5.16(a) and proof, p. 34: The source passes from rational to integral Hom using a saturation statement it calls known but does not prove.

**Acceptance.** For a rank-one Carlitz module the completed endomorphism lattice is A_λ, so division by λ is visible directly.

**Used by:** [5.3](#dm-5-tate-injectivity), [5.7](#dm-5-tate-surjectivity).

**Suggested file.** The native principal divisibility statement is given. The nonprincipal integral Hom-lattice result retains the explicit saturation proof gap.

**Open input:** [Integral Tate image saturation](#gap-integral-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-surjectivity"></a>

### 5.7 The Drinfeld Tate theorem

**Target** `DrinfeldModulesAndTModules:DM.5/tate-surjectivity` (theorem). **Planet:** Drinfeld Tate theorem.

Let L be finitely generated over F, let E,E′ be Drinfeld A-modules over the same (L,γ), and let λ≠ker γ. The comparison α\_λ:A_λ⊗A Hom_L(E,E′)→Hom_(A_λ,G_L)(T_λE,T_λE′) is an isomorphism. Inverting λ yields the rational version. The theorem allows both generic and special characteristic; it does not permit different characteristic maps, an algebraically closed infinite coefficient field in place of a finitely generated one, or λ equal to the characteristic.

**Hypotheses.** Exact fixed-characteristic and finitely generated coefficient-field hypotheses.

**Proof route.**

- Pass contravariantly to effective motives and dualize their Tate realizations.
- Apply local-algebraization to the rational motive Hom category, whose embedding is fully faithful after coefficient localization.
- Combine rational bijectivity with integral injectivity and tate-image-saturation.
- The integral last step remains a named proof input; neither the rational theorem nor Tamagawa’s earlier sketch supplies it by itself.

**Needs:** [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1); [`DM.5/local-algebraization`](#dm-5-local-algebraization) (5.4); [`DM.5/tate-injectivity`](#dm-5-tate-injectivity) (5.3); [`DM.5/tate-image-saturation`](#dm-5-tate-image-saturation) (5.6); [`DM.4/abelian-antiequivalence`](#dm-4-abelian-antiequivalence) (4.4).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 5.16(a,b) and proof, p. 34; Proposition 4.2, p. 22; Theorem 5.15, p. 33: This public source treats finitely generated coefficient fields of arbitrary transcendence degree; its integral saturation step is kept explicit.

**Acceptance.**

- For a finite coefficient field, equivariant endomorphisms are the centralizer of arithmetic Frobenius on T_λE.
- For φ\_t=τ² over F_{q²}, the Tate centralizer must retain its extra endomorphisms, not be forced to dimension one.

**Open input:** [Integral Tate image saturation](#gap-integral-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-semisimplicity"></a>

### 5.8 Semisimplicity of rational Tate representations

**Target** `DrinfeldModulesAndTModules:DM.5/tate-semisimplicity` (theorem). **Planet:** Tate semisimplicity theorem.

For finitely generated L/F and λ away from characteristic, the rational Tate realization of a semisimple A-isomotive is a semisimple K_0,λ-representation of G_L. In particular the rational Tate representation of every Drinfeld module is semisimple. The latter uses the separate fact that a Drinfeld motive is simple in the rational motive category; a general effective Anderson motive is not assumed semisimple.

**Hypotheses.** Finitely generated L; fixed characteristic avoided by λ; motive semisimplicity for the general version.

**Proof route.**

- The rational motive category embeds faithfully in restricted Frobenius modules and preserves semisimplicity.
- Each of the two local scalar extensions preserves semisimple objects by local-algebraization.
- The local Frobenius/Galois equivalence transfers semisimplicity to the representation.
- The Drinfeld-motive simplicity proof, derived from its Ore-module rank-one presentation and degree, is a precise remaining source input. Duality preserves the semisimplicity of the Drinfeld point realization.

**Needs:** [`DM.5/local-algebraization`](#dm-5-local-algebraization) (5.4); [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1); [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Theorem 1.1, pp. 2–3 and proof, pp. 33–34; Proposition 4.2, p. 22: The theorem assumes a semisimple A-isomotive; its Drinfeld consequence also needs simplicity of the associated motive.

**Acceptance.** A representation with a nonzero nilpotent Jordan extension is not semisimple merely because it is a Tate realization of some effective motive.

**Suggested file.** The finitely generated coefficient-field theorem uses the rational motive realization and its semisimplicity input; the unconditional Drinfeld-motive implication is an explicit proof gap.

**Open input:** [Drinfeld semisimple-motive input](#gap-drinfeld-semisimple-motive-input).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-6"></a>

## Layer DM.6: Euler values, regulators and Taelman class modules

Taelman's L-value of a Drinfeld module E over the integral closure R of F_q\[θ] in a finite extension is an Euler product in the Laurent-series field of the place at infinity, built from monic cardinalities of the finite modules E(R/p). The exponential unit lattice U(E/R) = exp_E^(−1)(E(R)) and the finite class module H(E/R) both enter the class formula L(E/R) = \[R : U(E/R)]·|H(E/R)|, in which \[R : U] is a normalized covolume and |H| a monic cardinality; it is proved through nuclear determinants over finite fields, the trace formula and the tangent determinant identity. The Carlitz module recovers its zeta value at 1, and a scaled Carlitz model has a nonzero class module, which checks that the class factor is kept.

<a id="dm-6-fitting-polynomial"></a>

### 6.1 Monic module cardinalities

**Target** `DrinfeldModulesAndTModules:DM.6/fitting-polynomial` (definition). **Planet:** Monic module cardinality.

For a finite-dimensional F-vector space M with A=F\[t]-action, define |M|=det_(F\[T])(T−t_M), equivalently the unique monic generator of Fitt_0(M) after renaming t as T. This is a polynomial, not the integer cardinality. It is multiplicative in short exact sequences; |0|=1 and #M=q^(deg |M|). The variable T is kept distinct from the coefficient θ used in the integral model.

**Hypotheses.** F finite; M finite as a set, with an F\[t]-module structure.

**Proof route.**

- Use the native determinant of the t-endomorphism and its characteristic polynomial.
- Import the current Tau Ceti fittingIdeal and its presentation/base-change API cited by the existing IntegralHeckeAndGaloisDeterminants roadmap, then use rational canonical decomposition over F\[t] to compare its monic generator with the characteristic polynomial. Fitting ideals themselves are not planned here.
- Block-triangular determinants prove exact-sequence multiplicativity.

**Needs:** `mathlib:Module.End`; `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`; `mathlib:LinearMap.charpoly`.

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Finite-module notation, p. 369 and §2, p. 376: The determinant is the monic module cardinality entering every local Euler factor and the class term.

**API.**

- **`finiteModuleCardinality`** (constructor): det(T−t_M).
- **`finiteModuleCardinality_zero`** (simp): |0|=1.
- **`finiteModuleCardinality_exact`** (structure): For 0→M′→M→M″→0, |M|=|M′||M″|.
- **`finiteModuleCardinality_fitting`** (compatibility): The ideal generated by |M| is Fitt_0(M), under t↦T. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`cardinality_test_cyclic`** (computation): For M=F\[t]/(t²+t+1), |M|=T²+T+1.
- **`cardinality_test_zero`** (degenerate): The zero module has |0|=1, not zero.
- **`cardinality_test_integer`** (non-example): For M=F\[t]/(t), |M|=T whereas #M=q; these are different invariants.

**Acceptance.** F\[t]/(a) has cardinality polynomial a(T) when a is monic.

**Uses.**

- DM.6: Local Euler factors, covolumes, determinants and the class formula.

**Used by:** [6.3](#dm-6-euler-l-value), [6.5](#dm-6-class-module), [6.6](#dm-6-lattice-covolume), [6.7](#dm-6-nuclear-determinant), [6.10](#dm-6-tangent-determinant).

**Suggested file.** The native characteristic-polynomial cardinality is given. Its Fitting-generator compatibility imports current Tau Ceti fittingIdeal, absent from the pinned build; that signature is omitted at the pin without reimplementing Fitting ideals.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-integral-model"></a>

### 6.2 Taelman integral Drinfeld models

**Target** `DrinfeldModulesAndTModules:DM.6/integral-model` (definition).

Fix A=F\[t], a finite field extension K/F(θ), R the integral closure of F\[θ] in K, and γ(t)=θ. An integral model is E_t=θ+r_1τ+⋯+r_nτ^n with r_i∈R and r_n≠0. A positive n is the generic rank; the zero-rank scalar model is included as a determinant-theory test. No unit condition on r_n is imposed. Put K_∞=R⊗\_(F\[θ])F((1/θ)), a product of the finite completed fields at infinity, with R discrete and cocompact. This model can have bad reduction, unlike the constant-rank relative family of DM.0.

**Hypotheses.** Finite K/F(θ), including inseparable finite extensions; full integral closure R; chosen integral coefficients.

**Proof route.**

- Use the polynomial action defined by E_t on each R-algebra.
- Import normalization and completion from FunctionFieldArithmetic.
- Keep Lie(E)=R with scalar t-action θ separate from the E-action on the same additive set.

**Needs:** [`DM.0/carlitz-module`](#dm-0-carlitz-module) (0.5); `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definition 2 and Remarks 1–2, p. 371: The theorem’s definition explicitly permits a nonunit leading coefficient and the rank-zero case.

**API.**

- **`TaelmanModel`** (constructor): The integral Ore polynomial θ+Σ r_iτ^i with the indicated generic rank.
- **`TaelmanModel.points`** (structure): The F\[t]-module E(B) on the additive group of any R-algebra B.
- **`TaelmanModel.lie`** (compatibility): The tangent A-module has scalar t-action θ.
- **`TaelmanModel.reduce`** (functoriality): Coefficient reduction to R/m supplies the local finite A-module.
- **`TaelmanModel.ext`** (extensionality): The action polynomial of t determines the integral model, with fixed coefficient ring and θ.

**Checks.**

- **`TaelmanModel_test_carlitz`** (compatibility): r_1=1 gives the everywhere-good Carlitz model.
- **`TaelmanModel_test_bad_reduction`** (computation): For q=2, E_t=θ+θ³τ has rank one generically and scalar rank-zero reduction at (θ).
- **`TaelmanModel_test_zero_rank`** (degenerate): With n=0 the exponential is the identity and all local cardinality ratios are one.

**Acceptance.** At a bad prime, the reduction may have smaller rank, including rank zero.

**Uses.**

- DM.6: Defines the scope of every class-formula object.

**Used by:** [6.3](#dm-6-euler-l-value), [6.4](#dm-6-unit-lattice), [6.8](#dm-6-trace-formula).

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-euler-l-value"></a>

### 6.3 The model-dependent L-value

**Target** `DrinfeldModulesAndTModules:DM.6/euler-l-value` (construction). **Planet:** Taelman L-value.

For the chosen Taelman integral model, define L(E/R)=∏\_(m maximal in R)|R/m|/|E(R/m)| in 1+T⁻¹F\[\[T⁻¹]], with θ renamed T in cardinality polynomials. The product converges. Include every maximal ideal, with the finite reduced t-action actually given by the model, even if the leading coefficient vanishes there. The value is characteristic-p valued and depends on the integral model; it is not automatically a complex Artin L-value or a canonical bad-reduction Goss factor of the generic module.

**Hypotheses.** The full integral-model hypotheses above; fixed coefficient/series variable convention.

**Proof route.**

- Compute each finite module determinant for multiplication by θ and the E_t action.
- The difference is a q-Frobenius operator with the local degree bound; finite primes of bounded residue degree are finite in number.
- The nuclear trace formula proves convergence and identifies the product with one determinant.

**Needs:** [`DM.6/integral-model`](#dm-6-integral-model) (6.2); [`DM.6/fitting-polynomial`](#dm-6-fitting-polynomial) (6.1); [`DM.6/trace-formula`](#dm-6-trace-formula) (6.8).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definition following Remark 2, p. 371; Remark 5, pp. 373–374; §5, pp. 388–389: The Euler product retains bad primes and records dependence on the chosen integral model.

**API.**

- **`TaelmanModel.localFactor`** (constructor): |R/m|/|E(R/m)|.
- **`TaelmanModel.lValue`** (constructor): The convergent product over all maximal ideals.
- **`TaelmanModel.lValue_constant`** (simp): Its T⁰ coefficient is one. (stated here only; not a declaration of the suggested file)
- **`TaelmanModel.lValue_carlitz`** (compatibility): For Carlitz, L(C/R)=ζ\_R(1). (stated here only; not a declaration of the suggested file)

**Checks.**

- **`lValue_test_scalar`** (degenerate): The scalar rank-zero model has L=1.
- **`lValue_test_carlitz_prime`** (computation): At R=F\[θ], a degree-one prime (θ−b) gives factor (T−b)/(T−b−1).
- **`lValue_test_bad_prime`** (computation): For q=2, E_t=θ+θ³τ, the factor at (θ) is one, not T/(T−1).

**Acceptance.** For Carlitz, the local denominator at a monic irreducible P is P(T)−1.

**Uses.**

- DM.6: The left side of the class formula.

**Used by:** [6.11](#dm-6-class-number-formula).

**Suggested file.** The native local factors keep the point and Lie actions separate. Global Euler-product convergence, constant term and the Carlitz zeta comparison require a finite global-field/integral-model interface; no convergence is asserted for arbitrary commutative rings.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-unit-lattice"></a>

### 6.4 The exponential unit lattice

**Target** `DrinfeldModulesAndTModules:DM.6/unit-lattice` (construction). **Planet:** Exponential unit lattice.

For a Taelman model the coefficient recurrence gives an entire continuous open exponential exp_E:K_∞→E(K_∞), A-linear from the scalar differential action to the E-action and derivative one. Define U(E/R)=exp_E⁻¹(E(R)). It is a discrete cocompact A-lattice in K_∞, free of rank \[K:F(θ)]. This does not assert surjectivity of exp_E on K_∞; the coefficient field is not C_∞. The periods in K_∞ are contained in U.

**Hypotheses.** The integral-model setting, including its product of completions and scalar A-action on the source.

**Proof route.**

- Solve the recurrence on every infinity factor and prove uniform local inverse estimates.
- Openness and discreteness of R imply discreteness of its exponential preimage.
- Compact quotient and the near-identity local exponential give cocompactness.
- Use the PID lattice structure in the finite-dimensional local vector space for finite freeness and rank.

**Needs:** [`DM.6/integral-model`](#dm-6-integral-model) (6.2); [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) (2.8); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Propositions 2–3 and proofs, pp. 371–372: The exponential is continuous and open; its preimage lattice is discrete and cocompact.

**API.**

- **`TaelmanModel.exp`** (constructor): The normalized entire functional-equation exponential on K_∞.
- **`TaelmanModel.units`** (constructor): The scalar-action submodule exp_E⁻¹(E(R)).
- **`TaelmanModel.units_mem`** (characterisation): x∈U iff exp_E(x)∈E(R).
- **`TaelmanModel.units_rank`** (data): rank_A U=\[K:F(θ)].
- **`TaelmanModel.exp_linear`** (compatibility): exp_E(θx)=E_t(exp_E(x)).

**Checks.**

- **`units_test_scalar`** (degenerate): For the scalar rank-zero model, U=R.
- **`units_test_carlitz`** (computation): For C/F\[θ], U=A log_C(1).
- **`units_test_scaled_carlitz`** (computation): For q=2 and E_t=θ+θ³τ, U=(π/θ³)A, a rank-one lattice whose generator has norm 1/2.

**Acceptance.** The unit lattice rank is the field-extension degree, not the Drinfeld rank.

**Uses.**

- DM.6: The regulator/covolume factor and exact sequence for the determinant proof.

**Used by:** [6.5](#dm-6-class-module), [6.9](#dm-6-tangent-comparison).

**Suggested file.** The native exponential inverse image is an A-submodule. Full lattice/rank and examples use the one-place polynomial-integral specialization; the finite-product infinity-field version needs AlgebraicCurves completion.

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-class-module"></a>

### 6.5 The Taelman class module

**Target** `DrinfeldModulesAndTModules:DM.6/class-module` (construction). **Planet:** Taelman class module.

For a Taelman model define H(E/R)=E(K_∞)/(E(R)+exp_E(K_∞)), as an A-module. It is finite: quotienting by E(R) gives a compact group, and quotienting by the open exponential image gives a discrete one. The denominator is an additive A-submodule; it is generally not a K_∞-linear subspace. Its monic cardinality |H| is the class factor.

**Hypotheses.** The integral-model and exponential setting above.

**Proof route.**

- Use the scalar/E-action linearity of exp_E to form the A-submodule sum.
- Show the quotient is both compact and discrete, hence finite.
- Form its native finite-module cardinality polynomial.

**Needs:** [`DM.6/unit-lattice`](#dm-6-unit-lattice) (6.4); [`DM.6/fitting-polynomial`](#dm-6-fitting-polynomial) (6.1).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definition preceding Proposition 5 and its proof, p. 373: The class module retains the failure of the integral points and exponential image to fill E(K_∞).

**API.**

- **`TaelmanModel.classModule`** (constructor): E(K_∞)/(E(R)+exp_E(K_∞)).
- **`TaelmanModel.classModule_finite`** (instance): The class module is finite.
- **`TaelmanModel.classCardinality`** (data): The monic Fitting polynomial of H.
- **`TaelmanModel.classModule_exact`** (structure): 0→K_∞/U→E(K_∞)/E(R)→H→0, with the first map induced by exp_E. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`classModule_test_scalar`** (degenerate): For the scalar rank-zero model H=0 and |H|=1.
- **`classModule_test_carlitz`** (compatibility): For C/F\[θ], H=0.
- **`classModule_test_nonzero`** (computation): For q=2 and E_t=θ+θ³τ over F₂\[θ], H≅F₂\[t]/(t), represented by the class of θ⁻¹, and |H|=T.

**Acceptance.** A nonzero class module must remain visible in the main formula.

**Uses.**

- DM.6: The class factor and the split exact sequence used in the tangent determinant identity.

**Used by:** [6.11](#dm-6-class-number-formula).

**Suggested file.** The native quotient is by the sum of integral points and exponential image. Finiteness/cardinality specialize to F\[t]; the global exact sequence needs the compact quotient topology and finite-product interface.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-lattice-covolume"></a>

### 6.6 Normalized lattice covolumes

**Target** `DrinfeldModulesAndTModules:DM.6/lattice-covolume` (definition).

Let V be a finite-dimensional F((1/θ))-vector space and Λ₁,Λ₂ discrete cocompact F\[θ]-lattices. Choose σ∈GL(V) with σΛ₁=Λ₂. Define \[Λ₁:Λ₂] as the monic representative of F×·ι(det σ), where ι renames θ as T. This does not depend on σ. For lattices contained in a common over-lattice Λ, it equals |Λ/Λ₂|/|Λ/Λ₁|. It is continuous in both lattices and multiplicative in successive pairs. The class formula uses \[R:U], in that orientation.

**Hypotheses.** Full-rank discrete cocompact lattices in the same local vector space; monic means leading Laurent coefficient one.

**Proof route.**

- Free lattice bases provide σ.
- Changing lattice bases changes its determinant by an F×-unit.
- Diagonal PID quotients prove the common-over-lattice formula, while continuity extends it to all pairs.

**Needs:** [`DM.6/fitting-polynomial`](#dm-6-fitting-polynomial) (6.1); `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Proposition 4 and proof, pp. 372–373: The monic determinant orientation is \[Λ₁:Λ₂]=|Λ/Λ₂|/|Λ/Λ₁|.

**API.**

- **`latticeCovolume`** (constructor): The normalized determinant \[Λ₁:Λ₂].
- **`latticeCovolume_self`** (simp): \[Λ:Λ]=1.
- **`latticeCovolume_trans`** (relation): \[Λ₁:Λ₃]=\[Λ₁:Λ₂]\[Λ₂:Λ₃].
- **`latticeCovolume_index`** (compatibility): For a common over-lattice, the stated ratio of monic cardinalities. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`covolume_test_one`** (degenerate): \[A:A]=1.
- **`covolume_test_scalar`** (computation): \[A:θA]=T, while \[θA:A]=T⁻¹.
- **`covolume_test_scaled_period`** (computation): For q=2, \[A:(π/θ³)A]=ι(π/θ³), with leading term T⁻¹.

**Acceptance.** For Λ₂=aΛ₁ with a monic, the ratio is a(T)^dim V.

**Uses.**

- DM.6: Regulator term and tangent determinant identity.

**Used by:** [6.9](#dm-6-tangent-comparison), [6.10](#dm-6-tangent-determinant), [6.11](#dm-6-class-number-formula).

**Suggested file.** The native normalized determinant is on a finite-free F\[t] lattice with chosen infinity coordinate. The common-over-lattice finite-index comparison needs the quotient-module cardinality interface; general projective A-lattices are not assigned an arbitrary determinant normalization.

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-nuclear-determinant"></a>

### 6.7 Finite-field nuclear determinants

**Target** `DrinfeldModulesAndTModules:DM.6/nuclear-determinant` (construction). **Planet:** Finite-field nuclear determinant.

Let V be a compact topological F-vector space. A continuous F-linear endomorphism is locally contracting if on some open invariant subspace U its norm decreases by a constant c<1. For Φ=Σ\_(n≥1)φ\_nZ^n with locally contracting coefficients define det_(F\[\[Z]])(1+Φ|V) modulo Z^N using a common contracting nucleus for φ₁,…,φ\_(N−1) and the determinant on the finite quotient V/U; the compatible residues define the series. It is independent of the common nuclei for the fixed norm. Exact-sequence multiplicativity holds. For continuous endomorphisms a,b, Taelman’s cyclic theorem gives det(1−abZ)=det(1−baZ) when a, ab and ba are all locally contracting; the plus-sign variant follows by replacing a by −a. No arbitrary-series cyclic theorem or unrestricted norm-invariance assertion is made. This finite-field compact-vector-space theory differs from the complex Banach nuclear-operator theory already owned by OperatorTheory.

**Hypotheses.**

- F finite; compact V; continuous endomorphisms; norm/topology chosen as in Taelman §2; each coefficient locally contracting and no constant coefficient.
- The compact F-vector space is normed, with its nonarchimedean norm inducing the topology and the trivial norm on F. Local contraction is measured in this norm.

**Proof route.**

- Every finite coefficient list admits a common nucleus.
- On a smaller common nucleus, the contracting piece contributes determinant one modulo the required power of Z.
- Finite-dimensional determinant identities descend to the inverse limit of truncations.
- Prove invariance under equivalent compact norms and functorial conjugation.
- For the cyclic law apply Taelman Theorem 2 with its three contraction assumptions. Its proof chooses common nuclei and bounds the intermediate images; nuclearity of the two products alone is not the cited hypothesis.

**Needs:** [`DM.6/fitting-polynomial`](#dm-6-fitting-polynomial) (6.1).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definitions 3–5 and Propositions 6–10, pp. 377–379; Theorem 2, p. 380: Nuclearity is coefficientwise local contraction and the determinant is a compatible finite-quotient limit.

**API.**

- **`FiniteFieldNuclearDet`** (constructor): The finite-nucleus limit det(1+Φ|V).
- **`FiniteFieldNuclearDet_trunc`** (characterisation): Modulo Z^N it is the finite quotient determinant at any common nucleus.
- **`FiniteFieldNuclearDet_exact`** (structure): Multiplicativity for invariant short exact sequences in the nuclear range.
- **`FiniteFieldNuclearDet_cyclic`** (relation): For continuous a,b with a, ab and ba locally contracting, det(1+abZ)=det(1+baZ). This is Theorem 2 with a replaced by −a; the contraction hypothesis on a is retained.

**Checks.**

- **`nuclearDet_test_zero`** (degenerate): The zero operator series has determinant one.
- **`nuclearDet_test_finite`** (compatibility): For V=F and Φ=aZ, det(1+Φ)=1+aZ.
- **`nuclearDet_test_infinite_identity`** (non-example): The identity on F\[\[u]] is not locally contracting; it is not a nuclear coefficient under this definition.

**Acceptance.** For finite-dimensional V, recover the ordinary determinant.

**Uses.**

- DM.6: Trace formula and infinitely tangent comparison determinants.

**Used by:** [6.8](#dm-6-trace-formula), [6.10](#dm-6-tangent-determinant).

**Suggested file.** The native compact finite-field determinant, common-nucleus truncation and exact-sequence law are given. The cyclic signature is the linear-in-Z instance; the complete operator-series law needs the common-nucleus series-composition interface.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-trace-formula"></a>

### 6.8 The finite-field trace formula

**Target** `DrinfeldModulesAndTModules:DM.6/trace-formula` (theorem).

For R and K_∞ in the integral-model setting, a finite projective R-module M with q-Frobenius-semilinear τ\_M, and Θ∈R{τ}\[\[Z]]·τZ acting through τ\_M, the product over maximal ideals satisfies ∏\_m det(1+Θ|M/mM)=det(1+Θ|(M⊗R K_∞)/M)⁻¹. The right-hand coefficients are nuclear. Both sides converge in F\[\[Z]]. The Frobenius-divisibility condition on Θ is essential; scalar multiplication alone is not this trace formula.

**Hypotheses.** Finite projective M over R; τ\_M semilinear with respect to r↦r^q; Θ has no Z⁰ or τ⁰ term.

**Proof route.**

- Prove local contraction for positive-Frobenius operators on the compact quotient.
- Use localization exact sequences to isolate finite primes.
- Apply Anderson’s commutator factorization to reduce arbitrary nuclear Θ to finite local factors.
- Use determinant exactness/cyclic invariance to pass to the Euler product.

**Needs:** [`DM.6/nuclear-determinant`](#dm-6-nuclear-determinant) (6.7); [`DM.6/integral-model`](#dm-6-integral-model) (6.2).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), §3 setup, pp. 381–382; Theorem 3 and proof, pp. 382–384: The formula applies to positive-Frobenius series on finite projective modules, with the inverse on the compact quotient.

**Acceptance.** Specializing Θ=(1−E_tT⁻¹)/(1−θT⁻¹)−1 gives the L-value determinant, after taking the inverse of each local factor.

**Used by:** [6.3](#dm-6-euler-l-value), [6.11](#dm-6-class-number-formula).

**Suggested file.** The global nuclear trace formula requires the actual compact quotient, continuous coefficient operators, common nuclei and their local factor comparisons. These operators are specified mathematically, not encoded by an unknown proposition.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-tangent-comparison"></a>

### 6.9 Infinitely tangent comparison maps

**Target** `DrinfeldModulesAndTModules:DM.6/tangent-comparison` (definition).

For lattices Λ\_i⊂V and finite A-modules H_i put M_i=(V/Λ\_i)×H_i. A continuous F-linear map γ:M₁→M₂ is N-tangent to the identity on V if, on some open U⊂V avoiding both lattices, its V/Λ₂ component restricts to an isometry and its local lift obeys ‖γ(v)−v‖≤‖θ^(−N)‖‖v‖. It is infinitely tangent if this holds for every N≥1, with U allowed to vary. For a continuous F-linear isomorphism γ define Δ\_γ=Σ\_(n≥1)(θ−γ⁻¹tγ)θ^(n−1)T^(−n) on M₁, where θ denotes the source t-action in this operator formula.

**Hypotheses.** Finite-dimensional local V, full lattices, finite H_i; local comparison in quotient charts; γ need not be A-linear.

**Proof route.**

- Define the local lifts after avoiding lattice translates and require the isometry explicitly.
- The differential-one entire exponential is infinitely tangent by shrinking its inverse-function neighborhood for each N.
- Transport t-actions across γ to obtain the operator series.

**Needs:** [`DM.6/lattice-covolume`](#dm-6-lattice-covolume) (6.6); [`DM.6/unit-lattice`](#dm-6-unit-lattice) (6.4).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definitions 6–7, Proposition 12 and the definition of Δ\_γ, pp. 385–386: The norm estimate alone is not the whole condition: an isometry on a common open chart is required.

**API.**

- **`InfinitelyTangent`** (characterisation): For each positive N, the specified isometric local estimate holds.
- **`tangentDelta`** (constructor): Σ(t−γ⁻¹tγ)t^(n−1)T^(−n).
- **`InfinitelyTangent.exp`** (compatibility): A normalized everywhere-convergent q-linear exponential is infinitely tangent on admissible lattice quotients. (stated here only; not a declaration of the suggested file)
- **`tangentDelta_identity`** (simp): For identity comparison with equal t-action, Δ=0.

**Checks.**

- **`tangent_test_identity`** (degenerate): The identity is infinitely tangent and has Δ=0.
- **`tangent_test_additive_exponential`** (compatibility): A series x+Σ\_(i≥1)e_ix^(q^i) of infinite radius obeys the N-tangent estimate on a sufficiently small disk for each N.
- **`tangent_test_wrong_derivative`** (non-example): For c≠1, scalar x↦cx is not infinitely tangent: its first-order error cannot satisfy all N-estimates.

**Acceptance.** Infinitely tangent maps can compare distinct t-actions and need not be module homomorphisms.

**Uses.**

- DM.6: The covolume/class determinant identity.

**Used by:** [6.10](#dm-6-tangent-determinant).

**Suggested file.** The native estimates use a common local chart; tangentDelta has actual continuous-linear operator coefficients. InfinitelyTangent.exp on different admissible lattice quotients requires the compact quotient-chart interface; the normalized Carlitz estimate is the stated coordinate test.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-tangent-determinant"></a>

### 6.10 The tangent determinant identity

**Target** `DrinfeldModulesAndTModules:DM.6/tangent-determinant` (theorem).

For a continuous F-linear isomorphism γ:(V/Λ₁)×H₁→(V/Λ₂)×H₂ infinitely tangent to the identity on V, the series Δ\_γ is nuclear and det(1+Δ\_γ|M₁)=\[Λ₁:Λ₂]·|H₂|/|H₁|. This fixes the covolume orientation and the class numerator. No determinant of an arbitrary infinite-dimensional automorphism is used.

**Hypotheses.** The tangent-comparison hypotheses; γ an isomorphism; H_i finite A-modules.

**Proof route.**

- Compute when Λ\_i have a common over-lattice and the comparison is an admissible local identity.
- Approximate an arbitrary lattice by one sharing such an over-lattice, modulo a prescribed T-adic precision.
- N-tangency makes the nuclear determinant unchanged to that precision; pass through all precisions.

**Needs:** [`DM.6/tangent-comparison`](#dm-6-tangent-comparison) (6.9); [`DM.6/nuclear-determinant`](#dm-6-nuclear-determinant) (6.7); [`DM.6/lattice-covolume`](#dm-6-lattice-covolume) (6.6); [`DM.6/fitting-polynomial`](#dm-6-fitting-polynomial) (6.1).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Theorem 4 and proof, pp. 386–388: The identity gives \[Λ₁:Λ₂]|H₂|/|H₁|, with no hidden degree normalization.

**Acceptance.** An identity comparison with equal lattices and finite modules yields determinant one.

**Used by:** [6.11](#dm-6-class-number-formula).

**Suggested file.** The full nuclear determinant identity uses the compact quotient comparison and its common-nucleus proof; a same-chart scalar estimate alone does not state that theorem.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-class-number-formula"></a>

### 6.11 Taelman’s class formula

**Target** `DrinfeldModulesAndTModules:DM.6/class-number-formula` (theorem). **Planet:** Taelman class formula.

For every Taelman integral model E/R, including nonunit leading coefficient and rank zero, L(E/R)=\[R:U(E/R)]·|H(E/R)| in F((T⁻¹)). All local factors are those of the chosen integral model. The formula is not generalized here to arbitrary A, arbitrary higher-dimensional t-motives, or complex L-values.

**Hypotheses.** Exactly integral-model; exponential, lattice and monic-cardinality normalizations fixed above.

**Proof route.**

- The trace formula identifies L with det(1+Θ|K_∞/R), Θ=(1−E_tT⁻¹)/(1−θT⁻¹)−1.
- The exponential gives 0→K_∞/U→E(K_∞)/E(R)→H→0.
- Split the finite quotient continuously as an F-vector space; compare to (K_∞/U)×H by an infinitely tangent isomorphism.
- Apply tangent-determinant with Λ₁=R, Λ₂=U, H₁=0, H₂=H.

**Needs:** [`DM.6/euler-l-value`](#dm-6-euler-l-value) (6.3); [`DM.6/class-module`](#dm-6-class-module) (6.5); [`DM.6/lattice-covolume`](#dm-6-lattice-covolume) (6.6); [`DM.6/trace-formula`](#dm-6-trace-formula) (6.8); [`DM.6/tangent-determinant`](#dm-6-tangent-determinant) (6.10).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Theorem 1, p. 373; §5 proof, pp. 388–389: The theorem treats the chosen integral model and keeps its finite class module.

**Acceptance.**

- For Carlitz recover ζ\_A(1)=log_C(1).
- For E_t=θ+θ³τ over F₂\[θ], retain |H|=T and recover L=ι(π/θ²).

**Used by:** [6.13](#dm-6-carlitz-class-examples).

**Suggested file.** The native class formula specializes to F\[t] in one infinity completion. The full finite global-field version and nuclear proof retain the AlgebraicCurves completion quotient/operator contracts.

**Open input:** [Completed coefficient and analytic quotient interfaces](#gap-completed-coefficient-and-analytic-quotient-interfaces).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-small-power-sum"></a>

### 6.12 Depth-one Carlitz power sums

**Target** `DrinfeldModulesAndTModules:DM.6/small-power-sum` (theorem).

For A=F\[θ] let A_(d,+) be its finite set of monic degree-d polynomials and S_d(s)=Σ\_(a∈A_(d,+))a^(−s). For d≥0 and 1≤s≤q, S_d(s)=ℓ\_d^(−s) with ℓ\_d=∏\_(i=1)^d(θ−θ^(q^i)). Frobenius gives S_d(ps)=S_d(s)^p for p=char F. In particular ζ\_A(1)=Σ\_dℓ\_d⁻¹=log_C(1). The formula ℓ\_d^(−s) is not asserted for every s.

**Hypotheses.** Integer s≥1; θ transcendental; the small-exponent formula requires s≤q.

**Proof route.**

- The Carlitz generating product/partial fraction identity computes the small-degree coefficient.
- Use the product denominators from DM.0, retaining their sign.
- Apply characteristic-p Frobenius to extend along p-power exponents, while keeping its exact range.
- The d-sum converges in K_∞ and matches the Carlitz logarithm at one.

**Needs:** [`DM.0/carlitz-products`](#dm-0-carlitz-products) (0.11); [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) (2.8).

**Sources.**

- [THAKUR-2009](#source-thakur-2009), §§2.2–2.3, pp. 536–537: The depth-one generating identity gives the small-exponent specialization; its range is retained.

**Acceptance.**

- For q=2,d=1,s=3, S₁(3)=(θ²+θ+1)/(θ(θ+1))³ differs from ℓ₁⁻³.
- For d=0, the only monic constant is one, so S₀(s)=1.

**Used by:** [6.13](#dm-6-carlitz-class-examples).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-carlitz-class-examples"></a>

### 6.13 Carlitz and a nonzero class module

**Target** `DrinfeldModulesAndTModules:DM.6/carlitz-class-examples` (theorem).

For Carlitz over F\[θ], H=0, U=A log_C(1), and L(C/A)=ζ\_A(1)=log_C(1), after renaming θ as T. For q=2, define E_t=θ+θ³τ over F₂\[θ]. Then exp_E(x)=θ⁻³exp_C(θ³x), U_E=(π/θ³)A, H_E≅F₂\[t]/(t), and L(E/A)=ι(π/θ²). The class is represented by θ⁻¹ and t annihilates it. Thus |H_E|=T is indispensable.

**Hypotheses.** First example the Carlitz integral model; second q=2, K=F₂(θ), R=F₂\[θ], π the DM.2 period lying in K_∞ in this case.

**Proof route.**

- At q=2, ‖π‖=4 and π∈K_∞. Reduce any x modulo πA to degree ≤1 by cancelling leading terms.
- On the degree-≤1 ball, exp_C is an isometric bijection: higher terms are strictly smaller, and the complete-field contraction argument gives its inverse. Hence exp_C(K_∞)=θF₂\[\[θ⁻¹]].
- Scalar conjugation by θ³ yields exp_E(K_∞)=θ⁻²F₂\[\[θ⁻¹]]. Its intersection with A is zero, and the quotient modulo A has the single basis class θ⁻¹.
- E_t(θ⁻¹)=1+θ lies in A, proving H_E≅A/(t); the unit lattice is θ⁻³ker exp_C.
- Away from (θ), the reduction is conjugate to Carlitz; at (θ), its local factor is one. Thus L(E/A)=ζ\_A(1)(T−1)/T=ι(π/θ²), also matching regulator times T. The period relation at q=2 is π=(θ²+θ)log_C(1), obtained from the Carlitz torsion equation and the monic product normalization.

**Needs:** [`DM.2/carlitz-period`](#dm-2-carlitz-period) (2.9); [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) (2.8); [`DM.6/class-number-formula`](#dm-6-class-number-formula) (6.11); [`DM.6/small-power-sum`](#dm-6-small-power-sum) (6.12).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Example 3, p. 373; Definition 2 and Remark 2, p. 371: The first case is stated in the paper. The scaled q=2 example is derived here from these definitions and the sourced Carlitz period, with every calculation shown; it is not attributed as a source example.

**Acceptance.** Dropping the class term in the second example gives a Laurent series with leading term T⁻¹ instead of the Euler product’s leading term one.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-7"></a>

## Layer DM.7: Normalized elliptic sheaves and shtuka comparisons

Elliptic sheaves are chains of vector bundles on the original global curve C, with Frobenius acting on the coefficient base, a pole at ∞ and a zero at the characteristic, and periodicity under twisting by O(∞). Normalization, transverse quotients and the bounded index shift of morphisms are part of the dictionary with standard Drinfeld modules. The two-leg shtuka datum is what general global shtukas consume, and the realization comparisons hold away from and at the characteristic.

<a id="dm-7-elliptic-sheaf"></a>

### 7.1 Elliptic sheaves on the global curve

**Target** `DrinfeldModulesAndTModules:DM.7/elliptic-sheaf` (definition). **Planet:** Elliptic sheaf.

On C×F S put σ=id_C×Frob_q,S. A rank-r elliptic sheaf consists of vector bundles E_i, i∈Z, and injections j_i:E_i→E_(i+1), τ\_i:σ\*E_i→E_(i+1), satisfying j_(i+1)τ\_i=τ\_(i+1)σ\*j_i and a compatible periodicity E_(i+rδ)≅E_i(∞). Each j_i cokernel is supported on ∞×S and its pushforward to S is a line bundle; each τ\_i cokernel is supported on the graph of the characteristic c:S→C−∞ and its pushforward is a line bundle. Maps are bounded-shift compatible chain maps E_i→E′\_(i+n), with n≥0 independent of i, identified under further j-shifts. For the Drinfeld correspondence use the normalized/transverse subcategory below. These are bundles on the original global curve C.

**Hypotheses.** C smooth projective geometrically connected over F; ∞ closed of degree δ; r≥1; characteristic leg disjoint from ∞; coherent injections and finite-flat length-one cokernels as specified.

**Proof route.**

- Import native coherent locally free sheaves and effective divisor twists from the existing AlgebraicVectorBundles and AlgebraicCurves roadmaps via SF.0.
- Build the integer-indexed periodic diagram with the Frobenius pullback and its commutative squares.
- Define bounded-shift morphisms and compose by adding shifts; fixed-index maps alone miss nonconstant Drinfeld isogenies.

**Needs:** [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9); `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`; `mathlib:AlgebraicGeometry.Scheme.Modules`; `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`; `mathlib:SheafOfModules.IsLocallyFree`; `mathlib:SheafOfModules.IsFinitePresentation`.

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Definition 5.1, p. 72; Propositions 5.5 and Lemma 5.7, pp. 73–74; §5.4, pp. 80–84: The diagram, r·deg∞ periodicity and quotient line conditions are explicit; the normalized transversality identifies the characteristic support.

**API.**

- **`EllipticSheaf`** (constructor): The global vector-bundle chain with j, τ and rδ-periodicity. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.periodic`** (data): E_(i+rδ)≅E_i(∞), respecting j and τ. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.characteristic`** (projection): The finite characteristic leg c determined by the τ-cokernel. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.Hom`** (constructor): Compatible chain morphisms with a uniform bounded index shift, modulo further inclusions. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.baseChange`** (functoriality): Pullback preserves the chain, characteristic and quotient-line conditions. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.Hom.ext`** (extensionality): Two bounded-shift morphisms agree if their component bundle maps agree after passage to a common index shift; use the quotient-by-further-inclusions convention of the target. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`EllipticSheaf_test_rank_one`** (computation): For F\[t], C=P¹ and Carlitz, E_i=O(i), j is the infinity inclusion, and τ is multiplication by t−θ from σ\*O(i) to O(i+1). (stated here only)
- **`EllipticSheaf_test_rank_two`** (compatibility): At r=2, δ=1 the twist by ∞ advances two indices, not one.
- **`EllipticSheaf_test_curve`** (non-example): Bundles on a Fargues–Fontaine curve do not define this chain on C×S. (stated here only)
- **`EllipticSheaf_test_frobenius`** (non-example): Replacing σ=id_C×Frob_S by the absolute Frobenius of C×S changes the degree of every E_i and fails periodicity compatibility. (stated here only)

**Acceptance.** For rational ∞ and rank one, E_(i+1)=E_i(∞); for rank two, E_(i+2)=E_i(∞).

**Uses.**

- DM.7: Normalized Drinfeld dictionary and Tate/local comparisons.
- GlobalShtukasAndFunctionFieldLanglands:GS.2: Consumes this special-case export, without owning this definition.

**Used by:** [7.2](#dm-7-normalized-elliptic-sheaf).

**Suggested file.** EllipticSheafDiagram is a native module-sheaf diagram component: injections, Frobenius squares and periodic isomorphisms. Full rank, divisor twist, finite-flat quotient-line support, periodic-map compatibility and base change require the existing curve/bundle suppliers; no full EllipticSheaf is defined by this component.

**Open input:** [Native geometric and analytic signature integration](#gap-native-geometric-and-analytic-signature-integration).

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-normalized-elliptic-sheaf"></a>

### 7.2 Normalized elliptic sheaves

**Target** `DrinfeldModulesAndTModules:DM.7/normalized-elliptic-sheaf` (definition). **Planet:** Normalized elliptic sheaf.

The normalized Drinfeld subcategory consists of elliptic sheaves with χ(E_(−1),s)=0 on every field fiber and with τ\_i inducing isomorphisms σ\*(E_i/E_(i−1))≅E_(i+1)/E_i. Equivalently, the images of E_i and σ\*E_i span E_(i+1) and intersect in σ\*E_(i−1). In this subcategory, H⁰(E_(−1),s)=H¹(E_(−1),s)=0; for i≥0, H¹(E_i,s)=0 and dim H⁰(E_i,s)=i+1. Thus pr_S\*E_0 is a line bundle and the normalized degree is deg E_(−1)=r(g−1).

**Hypotheses.** Same disjoint characteristic leg; exact scalar-field/Frobenius pullback; fiberwise Euler characteristic and the transverse diagram condition.

**Proof route.**

- Use the exact transverse square to obtain 0→σ\*E_(i−1)→E_i⊕σ\*E_i→E_(i+1)→0.
- Apply fiberwise Riemann–Roch and the first nonzero section argument to locate index zero.
- Import cohomology and base change to produce the pushforward line and the finite-step sections.

**Needs:** [`DM.7/elliptic-sheaf`](#dm-7-elliptic-sheaf) (7.1); `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`; `mathlib:AlgebraicGeometry.Scheme.Modules`; `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`; `mathlib:SheafOfModules.IsLocallyFree`; `mathlib:SheafOfModules.IsFinitePresentation`.

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Definition 5.9, Lemma 5.12, Corollary 5.13 and Proposition 5.14, pp. 75–77: Euler normalization and transverse quotients give the section dimensions used by the inverse functor.

**API.**

- **`NormalizedEllipticSheaf`** (constructor): An elliptic sheaf with χ(E_(−1))=0 and transverse τ/j quotients. (stated here only; not a declaration of the suggested file)
- **`NormalizedEllipticSheaf.sections`** (data): The filtered family pr_S\*E_i. (stated here only; not a declaration of the suggested file)
- **`NormalizedEllipticSheaf.h0`** (characterisation): Fiber dimensions max(i+1,0). (stated here only; not a declaration of the suggested file)
- **`NormalizedEllipticSheaf.h1`** (characterisation): H¹ vanishes on fibers for i≥−1. (stated here only; not a declaration of the suggested file)
- **`NormalizedEllipticSheaf.line`** (compatibility): pr_S\*E_0 is invertible; its dual is the underlying Drinfeld line. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`normalized_test_carlitz`** (computation): On P¹, E_(−1)=O(−1) has H⁰=H¹=0, and E_0=O has one section. (stated here only)
- **`normalized_test_shift`** (non-example): Shifting the Carlitz chain to E_i=O(i+1) gives χ(E_(−1))=1 and fails normalization. (stated here only)
- **`normalized_test_direction`** (compatibility): The inverse Drinfeld line is (pr_S\*E_0)∨ because the sections are the contravariant motive generator, not its point line. (stated here only)

**Acceptance.** Normalization fixes an index and cannot be dropped without changing the moduli category.

**Uses.**

- DM.7: Recovering the Drinfeld module and fixing the degree/index convention.

**Used by:** [7.3](#dm-7-drinfeld-to-sheaf), [7.4](#dm-7-elliptic-antiequivalence).

**Suggested file.** Normalization uses fibre Euler characteristic, the transverse square, cohomology/base change and the dual section line. The native diagram component contains no fabricated cohomology or support field.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-drinfeld-to-sheaf"></a>

### 7.3 The elliptic sheaf of a Drinfeld module

**Target** `DrinfeldModulesAndTModules:DM.7/drinfeld-to-sheaf` (construction). **Planet:** Drinfeld elliptic-sheaf construction.

For a standard relative rank-r Drinfeld A-module E on S, its contravariant motive M is finite locally free of rank r over A⊗F O_S and locally free of rank one over O_S{τ}. Filter a local Ore presentation by τ-degree. On a local coefficient algebra R, inside M⊗A K define the infinity lattice E_(i,∞) by deg_τ(m⊗a)=deg_τ(m)−rδ ord∞(a)≤i. Glue this with the motive on (C−∞)×S to obtain E_i. Inclusion gives j_i, left τ gives σ\*E_i→E_(i+1), and multiplication by a local inverse uniformizer gives E_(i+rδ)=E_i(∞). These bundles form a normalized elliptic sheaf.

**Hypotheses.** Relative standard rank r, general A and ∞; the gluing is on the original global curve, with fpqc/Zariski coordinate descent.

**Proof route.**

- Finite generators for the infinity-degree filtration and its successive quotient line prove finite presentation.
- Prove projectivity over R⊗O_(C,∞), using field fibers, the nilpotent-base flatness argument and finite coefficient descent.
- Glue the finite projective modules across the punctured infinity neighborhood using the existing vector-bundle patching interface.
- Check the characteristic quotient and transverse squares; sections recover the τ-degree filtration and the normalized cohomology.
- Coordinate changes act contravariantly on the motive; a degree-n intertwiner shifts the filtration by at most n.

**Needs:** [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3); [`DM.0/relative-standardization`](#dm-0-relative-standardization) (0.10); [`DM.7/normalized-elliptic-sheaf`](#dm-7-normalized-elliptic-sheaf) (7.2); `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`.

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), §§3.4–3.6, Propositions 3.10 and Lemmas 3.11–3.17, pp. 40–48; §5.3.3, pp. 79–80; §5.4.1, pp. 81–82: The infinity filtration, projectivity, gluing and arbitrary-base line-bundle version are spelled out.

**API.**

- **`DrinfeldModule.ellipticSheaf`** (constructor): The glued chain from the Ore-degree filtration. (stated here only; not a declaration of the suggested file)
- **`DrinfeldModule.ellipticSheaf_affine`** (compatibility): Its restriction to C−∞ is M(E). (stated here only; not a declaration of the suggested file)
- **`DrinfeldModule.ellipticSheaf_periodic`** (compatibility): An rδ-index shift equals tensoring by O(∞). (stated here only; not a declaration of the suggested file)
- **`DrinfeldModule.ellipticSheafMap`** (functoriality): A degree-n u:E→E′ gives a bounded-shift chain map from the sheaf of E′ to that of E. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`toSheaf_test_carlitz`** (computation): The Carlitz motive L\[t] gives E_i=O(i) and Frobenius factor t−θ. (stated here only)
- **`toSheaf_test_rank_two`** (characterisation): A rank-two Drinfeld module yields bundles of rank two, although its Ore module is rank one. (stated here only)
- **`toSheaf_test_isogeny_shift`** (non-example): A positive-degree isogeny cannot in general be represented by maps E_i→E′\_i for every i; bounded shifts are required. (stated here only)

**Acceptance.** The construction’s affine restriction is M(E), not a new free rank-r τ-module.

**Uses.**

- DM.7: The anti-equivalence and special-case shtuka export.

**Used by:** [7.4](#dm-7-elliptic-antiequivalence), [7.5](#dm-7-shtuka-export).

**Suggested file.** The full filtered-motive gluing on the global curve, infinity residue factors and bounded-shift maps require the existing AlgebraicCurves, AlgebraicVectorBundles and JacobianChallenge interfaces. The affine matrix tests do not construct the full chain.

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-elliptic-antiequivalence"></a>

### 7.4 The normalized elliptic-sheaf dictionary

**Target** `DrinfeldModulesAndTModules:DM.7/elliptic-antiequivalence` (comparison).

The contravariant filtered-motive construction gives an anti-equivalence between standard relative Drinfeld A-modules of rank r and normalized transverse elliptic sheaves of rank r with bounded-shift morphisms. The inverse uses the line (pr_S\*E_0)∨ and the Ore module Γ((C−∞)×S,E_0), locally free of rank one over O_S{τ}; right A-action reconstructs the Drinfeld map. Equivalently, this is a covariant equivalence with the opposite elliptic-sheaf category; no self-duality identification of that category is asserted. Characteristic and rank are preserved, and good-open level structures transport through the finite-shtuka pairing.

**Hypotheses.** The normalized/transverse/disjoint-leg conditions and morphism convention above; standard relative Drinfeld objects.

**Proof route.**

- Use the normalized cohomology to identify the generator line and its Frobenius iterates.
- The affine sections form the Ore module; multiplication by a∈A respects the filtration and has unit leading term.
- Construct the inverse action locally and descend the line-bundle maps.
- The two constructions recover the same filtered module; evaluate the morphism maps to verify reversed composition and natural inverse isomorphisms.

**Needs:** [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3); [`DM.7/normalized-elliptic-sheaf`](#dm-7-normalized-elliptic-sheaf) (7.2); [`DM.4/abelian-antiequivalence`](#dm-4-abelian-antiequivalence) (4.4); `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`; `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`.

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Theorem 5.10 and proof, pp. 75–84; Proposition 5.21, pp. 78–79; §5.4.2, pp. 82–84: The source calls the categories equivalent; the contravariant Hom-to-G_a convention fixes the opposite category here. Bounded-shift morphism reconciliation is an explicit source gap.

**Acceptance.** The generator of sections is dual to the point-line generator, as in the motive functor.

**Used by:** [7.6](#dm-7-tate-realization), [7.7](#dm-7-characteristic-comparison).

**Suggested file.** The normalized anti-equivalence uses the full elliptic-chain category and line reconstruction. Bounded-shift variance and non-rational infinity residue-factor descent remain explicit proof gaps.

**Open input:** [Elliptic-chain morphism category](#gap-elliptic-chain-morphism-category).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-shtuka-export"></a>

### 7.5 The two-leg global shtuka export

**Target** `DrinfeldModulesAndTModules:DM.7/shtuka-export` (construction). **Planet:** Elliptic-sheaf shtuka realization.

From the elliptic chain take E_0 and α=j_0⁻¹τ\_0:σ\*E_0|\_U≅E_0|\_U, where U=(C×S)−((∞×S)∪Γ\_c). The τ- and j-cokernels provide the characteristic zero and infinity pole bounds of a GL_r-modification. At rational ∞ they are length-one modifications; at general δ the pole support and residue factors are retained as the specified infinity chain rather than replaced by a rational leg. Export this datum to the independently defined global G-shtuka category in GS.2. The global category does not supply elliptic sheaves back to this construction.

**Hypotheses.** Normalized elliptic sheaf, characteristic disjoint from infinity; use its actual bound and coefficient ring.

**Proof route.**

- Restrict where both injections are isomorphisms and compose in the stated Frobenius direction.
- Pass from the rank-r vector bundle to its GL_r frame torsor using existing vector-bundle APIs.
- Record the two modifications with their cokernels and preserve levels by restriction.
- GS.2 consumes the resulting datum; no dependency on its elliptic-sheaf-realisation node is introduced.

**Needs:** [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3).

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Definition 5.1 and Remark 5.2, pp. 72–73; §5.4, pp. 80–84: The two injections and their disjoint quotient supports give the rational Frobenius modification.

**API.**

- **`EllipticSheaf.shtukaDatum`** (constructor): E_0 with α=j_0⁻¹τ\_0 away from its legs. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.shtukaDatum_zero`** (data): The characteristic modification and its effective length-one cokernel. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.shtukaDatum_pole`** (data): The infinity modification inherited from j_0 and the periodic chain. (stated here only; not a declaration of the suggested file)
- **`EllipticSheaf.shtukaDatum_baseChange`** (functoriality): The construction commutes with coefficient-base pullback. (stated here only; not a declaration of the suggested file)

**Checks.**

- **`shtukaExport_test_carlitz`** (computation): For Carlitz on P¹, α is multiplication by t−θ on the affine trivialization. (stated here only)
- **`shtukaExport_test_legs`** (characterisation): The zero leg is t=θ and the pole is ∞. (stated here only)
- **`shtukaExport_test_direction`** (non-example): The inverse (t−θ)⁻¹ swaps zero and pole data and is not the selected Frobenius direction.

**Acceptance.** The Frobenius acts on S, leaving the global curve fixed.

**Uses.**

- GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack: Embeds this GL_r special case.
- GlobalShtukasAndFunctionFieldLanglands:GS.2/elliptic-sheaf-realisation: Imports the definition and dictionary from DM.7.

**Suggested file.** The full two-leg modification and its pole/zero bounds require the elliptic chain and the GS.2 consumer interface. The scalar nonunit test checks direction only; it is not a constructed global shtuka.

**Open input:** [Register the existing AlgebraicVectorBundles imports](#gap-register-the-existing-algebraicvectorbundles-imports).

**Imports from current TauCetiRoadmap:** `tauceti:TauCetiRoadmap/AlgebraicVectorBundles#l0b--quasicoherent-and-finite-locally-free-sheaves`.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-tate-realization"></a>

### 7.6 Prime-to-characteristic realization comparison

**Target** `DrinfeldModulesAndTModules:DM.7/tate-realization` (comparison).

For a normalized elliptic sheaf attached to E and λ away from the characteristic, complete its affine motive M at λ. Its τ-fixed completed realization is canonically dual to T_λE, with the A_λ-linear Galois pairing obtained at each λ^n level from the finite-shtuka functor. The pairing is compatible with all Drinfeld morphisms, bounded shifts of elliptic-chain maps, base extension and prime-to-characteristic level frames.

**Hypotheses.** Field coefficient L for Galois realization, λ away from ker γ; full completed residue factors; contravariant motive convention.

**Proof route.**

- Reduce M modulo λ^n and apply the strict finite-shtuka/group-scheme anti-equivalence.
- Identify the torsion points with the dual Frobenius-fixed module by the evaluation pairing.
- Pass through the chosen division coordinates to the Tate limit and duality.

**Needs:** [`DM.7/elliptic-antiequivalence`](#dm-7-elliptic-antiequivalence) (7.4); [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1); [`DM.1/tate-module`](#dm-1-tate-module) (1.5); [`DM.1/continuous-galois-action`](#dm-1-continuous-galois-action) (1.6).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 6.1, p. 23; Theorem 6.4, pp. 24–26; Proposition 6.5 and Theorem 6.6, p. 26: Finite-shtuka torsion realizes the motive reductions; inverse limits give the prime-to-characteristic comparison.

**Acceptance.** For Carlitz the point Tate character and the motive-fixed character are inverse, as required by the pairing.

**Suggested file.** The full elliptic-motive/point Tate pairing needs the completed finite-shtuka realization and bounded-shift naturality interfaces.

**Open input:** [Strict finite F-module / finite-shtuka realization](#gap-strict-finite-f-module-finite-shtuka-realization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-characteristic-comparison"></a>

### 7.7 The effective characteristic local comparison

**Target** `DrinfeldModulesAndTModules:DM.7/characteristic-comparison` (comparison).

For characteristic p and an F_p-algebra R with nilpotent uniformizer image γ(z), completing the affine motive of the elliptic sheaf and selecting the characteristic residue factor gives the same rank-r effective local shtuka as DM.1, with q^(deg p)-Frobenius and the dimension-one cokernel bound. Its finite reductions correspond to the full p-power strict finite group schemes. This is a comparison of completed motives and finite torsion, not a characteristic-place rank-r separable-point Tate representation or an unrestricted crystalline/étale comparison.

**Hypotheses.** Nilpotent characteristic parameter; residue coefficient algebra F_p; all completion/splitting and effectiveness hypotheses of DM.1/characteristic-local-realization; the exact equal-characteristic category is a recorded input, with a locally free R\[\[z]]-module and a rank-one R-cokernel killed by z−γ(z).

**Proof route.**

- Identify affine motive restrictions through the elliptic dictionary.
- Complete and split coefficient factors; iterate τ by the residue degree.
- Apply the same strict finite-group correspondence used in DM.1, retaining connected torsion and its bound.

**Needs:** [`DM.7/elliptic-antiequivalence`](#dm-7-elliptic-antiequivalence) (7.4); [`DM.1/characteristic-local-realization`](#dm-1-characteristic-local-realization) (1.7).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 6.4, pp. 24–26; Definition 7.1 and Example 7.2, p. 27; Theorems 7.4 and 7.6, p. 28: The finite realization and local completion need the specified characteristic factor and effective Frobenius bound.

**Acceptance.** For φ\_t=τ² over F, connected length q^(2n) at level t^n is preserved under this comparison.

**Suggested file.** The effective characteristic local comparison retains the connected group schemes, characteristic residue factor and residue-degree Frobenius. Its native local-shtuka interface is recorded as an equal-characteristic local-shtuka gap, not replaced by separable points.

**Open input:** [Strict finite F-module / finite-shtuka realization](#gap-strict-finite-f-module-finite-shtuka-realization).

**Open input:** [Equal-characteristic effective local-shtuka input](#gap-equal-characteristic-effective-local-shtuka-input).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-8"></a>

## Layer DM.8: Rigid analytic motives, periods and Carlitz logarithms

The layer builds Papanikolas's comparison between difference equations, their solution torsors and the Betti realization of rigid analytically trivial motives. Its principal arithmetic result is that, for an eligible fundamental matrix Ψ, the transcendence degree of k̄(Ψ(θ)) over k̄ equals the dimension of the motivic Galois group. Its application: Carlitz logarithms of algebraic arguments that are linearly independent over k = F_q(θ) are algebraically independent over k̄. The scope is the generic-characteristic Carlitz and dual-motive setting of Papanikolas, with the shared difference-equation inputs used by the routed multizeta papers; no algebraic-independence statement for arbitrary higher-rank Drinfeld modules is asserted.

The construction proceeds from native fixed-vector descent and the analytic constant field to the Betti comparison; exactness and tensor compatibility give the neutral category. Independently, an admissible difference equation gives its solution ring and comparison algebra; ideal descent, simplicity and the three-factor cocycle give a group scheme and torsor; relative algebraic closure and separability give smoothness and the dimension; invariant fields and subobjects identify this group with the motivic one. The ABP criterion then lifts specialized linear relations, and bounded monomial spans turn that into equality of transcendence degrees. The two ideal-descent results stay separate: descent over the ambient field proves simplicity of the solution ring, and descent over the solution ring, proved afterwards, gives the torsor.

### Native fixed-vector descent

Here F ⊂ L are arbitrary fields, V is an L-vector space, σ is an F-algebra automorphism of L with exact fixed field F, and f is F-linear with f(av) = σ(a)f(v). Exact constants and a merely fixed subfield already differ for complex conjugation on ℂ over ℝ. Finite dimensionality is assumed over L only where stated.

<a id="dm-8-fixed-coefficients"></a>

### 8.1 Coefficients of a fixed linear combination

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-coefficients` (lemma).

For a finite index type I, let v_i∈V be fixed by f and L-linearly independent. If c_i∈L and the vector Σ\_i c_i·v_i is fixed by f, then σ(c_i)=c_i for every i. Equality of the constant field with F is not needed for this lemma.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.

**Proof route.**

- Apply f to the finite sum and use additivity, semilinearity and fixedness of each v_i to get Σ\_i σ(c_i)·v_i=Σ\_i c_i·v_i.
- Subtract the two sums. Apply the finite-relation criterion for L-linear independence to the coefficients σ(c_i)−c_i.

**Needs:** `mathlib:linearIndependent_iff'`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: The minimal-relation proof compares a relation between fixed vectors with its coefficient twist; independence forces each coefficient to be fixed. This isolated step works for an arbitrary field automorphism and semilinear map, beyond the analytic pre-t-motive setting of the lemma, and does not yet require identifying the constant field.

**Acceptance.**

- With the singleton vector 1 in C and conjugation, a fixed coefficient is real.
- The empty family gives a vacuous conclusion.
- Independence is necessary: with two copies of 1, the zero combination i·1+(−i)·1 is fixed although neither coefficient is fixed.

**Used by:** [8.2](#dm-8-fixed-span-descent), [8.9](#dm-8-fixed-basis-coordinates).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.fixed_coefficients`.

<a id="dm-8-fixed-span-descent"></a>

### 8.2 Descent of the span of an independent fixed family

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-span-descent` (lemma).

Assume exact constants. For a finite L-linearly independent family v_i fixed by f and a fixed vector w, w lies in the L-span of the v_i if and only if it lies in their F-span.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- For the forward implication use Submodule.mem_span_range_iff_exists_fun to choose L-coefficients of w. The fixed-coefficients lemma makes each coefficient σ-fixed.
- Use exact constants to choose coefficients in F. Scalar-tower compatibility turns the same finite sum into an F-linear expression for w.
- For the reverse implication, map the F-coefficients into L and use scalar-tower compatibility.

**Needs:** [`DM.8/fixed-coefficients`](#dm-8-fixed-coefficients) (8.1); `mathlib:Submodule.mem_span_range_iff_exists_fun`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: In the same relation argument, fixed coefficients belong to the exact constant field F. This gives the intersection of an L-span with fixed vectors as the F-span. The packet abstracts the argument from pre-t-motives to arbitrary semilinear modules, retaining exact constants and independence of the family.

**Acceptance.**

- Conjugation on C with the singleton family 1 gives precisely the real axis.
- With the empty family, a fixed w belongs to either span exactly when w=0.
- For σ=id on C with F=R and v=1, w=i is fixed and in the C-span but outside the R-span, demonstrating the exact-constants requirement.

**Used by:** [8.3](#dm-8-finite-fixed-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.fixed_mem_span_iff`.

<a id="dm-8-finite-fixed-independence"></a>

### 8.3 Independence descent for finite fixed families

**Target** `DrinfeldModulesAndTModules:DM.8/finite-fixed-independence` (lemma).

Assume exact constants. If v:Fin(n)→V is F-linearly independent and each v_i is fixed by f, then v is L-linearly independent, for every n≥0.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- Induct on n. The empty family has no nonzero relation.
- Use linearIndependent_finSucc over F to separate the tail and its first vector. By induction the fixed tail is L-linearly independent.
- If the first vector were in the L-span of the tail, fixed-span descent would put it in the F-span, contradicting the F-independence criterion. Apply linearIndependent_finSucc over L.

**Needs:** [`DM.8/fixed-span-descent`](#dm-8-fixed-span-descent) (8.2); `mathlib:linearIndependent_finSucc`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: The lemma proves that a finite F-independent family of fixed vectors remains L-independent by a shortest relation and coefficient descent. The packet isolates this finite step over arbitrary semilinear modules; it needs exact constants, but neither finite dimension nor invertibility of the module map.

**Acceptance.**

- n=0 and n=1 are included; in the singleton case independence means the vector is nonzero.
- The pair (1,1) over Q is rejected at the independence premise.
- The R-independent pair (1,i) is not a fixed family for conjugation, and must not pass as a C-independent family.

**Used by:** [8.4](#dm-8-fixed-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.linearIndependent_fin_of_fixed`.

<a id="dm-8-fixed-independence"></a>

### 8.4 Linear independence of fixed vectors

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-independence` (theorem).

Assume exact constants. For any index type I, an F-linearly independent family v:I→V whose members satisfy f(v_i)=v_i is L-linearly independent.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- Use linearIndependent_iff_finset_linearIndependent to reduce the conclusion to an arbitrary finite subfamily. Restrict F-independence and fixedness to it.
- Reindex that finite set by Fin(card) and apply finite-fixed-independence. Transport independence back along the bijection.

**Needs:** [`DM.8/finite-fixed-independence`](#dm-8-finite-fixed-independence) (8.3); `mathlib:linearIndependent_iff_finset_linearIndependent`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: The source establishes scalar-extension independence of Betti vectors in its analytic setting. The packet extends the finite-relation argument to an arbitrary index set by restricting to finite subfamilies, over arbitrary fields with the specified automorphism and exact constants.

**Acceptance.**

- The theorem has no finite-dimensional hypothesis on V and no finite-order hypothesis on σ.
- Exact constants and the fixed-vector premise are independently necessary: σ=id on C fails the former for F=R; conjugation fixes the latter field but not i.
- The theorem supplies independence of an arbitrary F-basis of the fixed submodule before its finiteness is known.

**Used by:** [8.5](#dm-8-betti-comparison-injective), [8.6](#dm-8-fixed-space-finite), [8.22](#dm-8-solution-space).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.linearIndependent_of_fixed`.

<a id="dm-8-betti-comparison-injective"></a>

### 8.5 Injectivity of the Betti comparison map

**Target** `DrinfeldModulesAndTModules:DM.8/betti-comparison-injective` (lemma).

Assume exact constants. Set W=f.fixedSubmodule, using the native F-submodule. The native L-linear map κ=(W.subtype).liftBaseChange L:L⊗\_F W→V, given by κ(a⊗w)=a·w, is injective. No finite-dimensional hypothesis is required.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- Choose an F-basis b of W using Module.Free.chooseBasis. Its image in V is F-linearly independent by the native injective inclusion and LinearIndependent.map'. Every image vector is fixed.
- Apply fixed-independence to conclude that the image family is L-linearly independent.
- Use the native scalar-extended basis b.baseChange L of L⊗\_F W. Its i-th vector is 1⊗b_i, whose κ-image is the same image vector.
- Identify κ with the linear map prescribed on that basis and apply Module.Basis.injective_constr_of_linearIndependent.

**Needs:** [`DM.8/fixed-independence`](#dm-8-fixed-independence) (8.4); `mathlib:LinearMap.fixedSubmodule`; `mathlib:LinearMap.mem_fixedSubmodule_iff`; `mathlib:Submodule.subtype`; `mathlib:Submodule.subtype_injective`; `mathlib:LinearIndependent.map'`; `mathlib:Module.Free.chooseBasis`; `mathlib:Module.Basis.linearIndependent`; `mathlib:Module.Basis.baseChange`; `mathlib:Module.Basis.baseChange_apply`; `mathlib:LinearMap.liftBaseChangeEquiv`; `mathlib:LinearMap.liftBaseChange_tmul`; `mathlib:Module.Basis.injective_constr_of_linearIndependent`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7 and Proposition 3.3.8, pp.12–13: The lemma supplies independence of fixed vectors after extending scalars, and the proposition uses it to inject the scalar-extended Betti space into the analytic motive. The packet expresses that comparison using the native tensor lift; the argument applies to any semilinear module satisfying the stated constant-field hypothesis.

**Acceptance.**

- For conjugation on C the map C⊗\_R R→C is bijective.
- For f=2·id on Q the fixed space is zero and κ is injective but not surjective.
- For the zero vector space κ is the map between zero spaces.

**Used by:** [8.7](#dm-8-fixed-dimension-bound), [8.8](#dm-8-betti-comparison-dimension), [8.19](#dm-8-betti-exact-tensor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.bettiComparison_injective`.

<a id="dm-8-fixed-space-finite"></a>

### 8.6 Finite dimensionality of the fixed submodule

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-space-finite` (lemma).

Assume exact constants and that V is finite-dimensional over L. Then the native fixed submodule W=f.fixedSubmodule is finite-dimensional over F; V itself is not assumed finite-dimensional over F.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- V is finite-dimensional over L.

**Proof route.**

- Choose an F-basis b of W; include it into V as in betti-comparison-injective.
- Use fixed-independence to make it an L-independent family in the finite-dimensional L-space V. LinearIndependent.finite makes its index type finite.
- Apply Module.Basis.finiteDimensional_of_finite to the original F-basis of W. This establishes finiteness before any finrank equality criterion is used.

**Needs:** [`DM.8/fixed-independence`](#dm-8-fixed-independence) (8.4); `mathlib:LinearMap.fixedSubmodule`; `mathlib:LinearMap.mem_fixedSubmodule_iff`; `mathlib:Submodule.subtype`; `mathlib:Submodule.subtype_injective`; `mathlib:LinearIndependent.map'`; `mathlib:Module.Free.chooseBasis`; `mathlib:Module.Basis.linearIndependent`; `mathlib:LinearIndependent.finite`; `mathlib:Module.Basis.finiteDimensional_of_finite`.

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.8, pp.12–13: The proposition bounds the Betti space by the rank of the analytic motive. A chosen F-basis remains L-independent by the preceding lemma, so finite L-dimension makes its index set finite. The packet abstracts this proof without assuming fixed-space finiteness in advance.

**Acceptance.**

- Conjugation on C has fixed space of real dimension 1.
- Multiplication by 2 on Q has zero-dimensional fixed space.
- Finite-dimensionality is proved, not inferred from the numerical value of finrank, which is zero for infinite-dimensional spaces.

**Used by:** [8.7](#dm-8-fixed-dimension-bound), [8.8](#dm-8-betti-comparison-dimension), [8.20](#dm-8-neutral-category).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.finite_fixedSubmodule`.

<a id="dm-8-fixed-dimension-bound"></a>

### 8.7 The dimension bound for fixed vectors

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-dimension-bound` (lemma).

Assume exact constants and finite-dimensionality of V over L. Then dim_F(f.fixedSubmodule)≤dim_L(V).

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- V is finite-dimensional over L.

**Proof route.**

- Use betti-comparison-injective and the native dimension bound for an injective map into V.
- Rewrite the dimension of L⊗\_F W using Module.finrank_baseChange. The fixed-space-finite lemma separately certifies that this is the dimension of a finite space.

**Needs:** [`DM.8/betti-comparison-injective`](#dm-8-betti-comparison-injective) (8.5); [`DM.8/fixed-space-finite`](#dm-8-fixed-space-finite) (8.6); `mathlib:LinearMap.finrank_le_finrank_of_injective`; `mathlib:Module.finrank_baseChange`.

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.8, pp.12–13: The proposition bounds the dimension of the Betti space by the motive rank. After proving that the fixed space is finite, native scalar-extension dimension and injectivity give the packet's corresponding inequality for arbitrary finite-dimensional semilinear modules.

**Acceptance.**

- Conjugation on C realizes equality 1≤1.
- The invertible operator 2·id on Q realizes the strict inequality 0<1.
- For the zero space both sides are zero.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.finrank_fixedSubmodule_le`.

<a id="dm-8-betti-comparison-dimension"></a>

### 8.8 The dimension criterion for the Betti comparison

**Target** `DrinfeldModulesAndTModules:DM.8/betti-comparison-dimension` (theorem).

Assume exact constants and finite-dimensionality of V over L. The native comparison κ:L⊗\_F f.fixedSubmodule→V is bijective if and only if dim_F(f.fixedSubmodule)=dim_L(V). In the pre-t-motive application this is the numerical criterion for rigid analytic triviality, once the actual scalar field and operator are supplied.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- V is finite-dimensional over L.

**Proof route.**

- Establish finite-dimensionality of W by fixed-space-finite; a finite F-basis extends to a finite L-basis of L⊗\_F W.
- The forward implication packages κ as a linear equivalence and uses finrank invariance and Module.finrank_baseChange.
- For the reverse implication, base-change dimension makes source and target have equal finite dimension. Use betti-comparison-injective and LinearMap.injective_iff_surjective_of_finrank_eq_finrank to prove surjectivity.

**Needs:** [`DM.8/betti-comparison-injective`](#dm-8-betti-comparison-injective) (8.5); [`DM.8/fixed-space-finite`](#dm-8-fixed-space-finite) (8.6); `mathlib:Module.Basis.baseChange`; `mathlib:Module.Basis.finiteDimensional_of_finite`; `mathlib:Module.finrank_baseChange`; `mathlib:LinearEquiv.finrank_eq`; `mathlib:LinearMap.injective_iff_surjective_of_finrank_eq_finrank`.

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.8, pp.12–13: The source characterizes rigid triviality by achieving the full rank of the analytic motive. The comparison is already injective; equality of finite dimensions makes it surjective. This linear-algebra consequence is stated for the packet's more general semilinear setting.

**Acceptance.**

- Identity on Q and conjugation on C have bijective comparison maps.
- The zero-dimensional object is admitted.
- The invertible operator 2·id on Q has no nonzero fixed vector and fails surjectivity; invertibility alone does not imply triviality.
- The actual DM.8 applicability check still needs L^σ=F_q(t) and the supplied analytic field; this generic criterion does not establish either.

**Used by:** [8.15](#dm-8-rigid-triviality).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.bettiComparison_bijective_iff`.

<a id="dm-8-fixed-basis-coordinates"></a>

### 8.9 Constant coordinates in a fixed basis

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-basis-coordinates` (lemma).

Assume exact constants. Let b:I→V be an L-basis indexed by a finite type, with f(b_i)=b_i. For w∈V, f(w)=w if and only if there is a unique family c:I→F with Σ\_i algebraMap(c_i)·b_i=w.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- b is an L-basis indexed by a finite type; every basis vector is fixed.

**Proof route.**

- A basis spans V, so express w with L-coefficients. If w is fixed, fixed-coefficients and exact constants lift each coefficient uniquely to F, the latter uniqueness using injectivity of a field embedding.
- L-independence of b makes the lifted coefficient family unique by subtracting two expansions.
- Conversely, an F-coefficient combination of fixed vectors is fixed by F-linearity.

**Needs:** [`DM.8/fixed-coefficients`](#dm-8-fixed-coefficients) (8.1); `mathlib:Module.Basis.linearIndependent`; `mathlib:Module.Basis.span_eq`; `mathlib:Submodule.mem_span_range_iff_exists_fun`; `mathlib:linearIndependent_iff'`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.1.6, p.22, with Lemma 3.3.7: The solution-coordinate argument shows that coefficients of a solution relative to a fundamental matrix are fixed by the coefficient automorphism. Together with the fixed-vector lemma, this supplies unique F-coordinates for a fixed L-basis. The packet states this basis consequence abstractly rather than attributing an arbitrary-module theorem to the source.

**Acceptance.**

- The singleton basis 1 of C with conjugation has exactly real fixed coordinates.
- For the empty basis and zero space the unique coefficient function is empty.
- This is the coordinate step in the fundamental-solution argument; no analytic matrix or general solution space is newly defined here.

**Used by:** [8.17](#dm-8-fundamental-betti-basis).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`, declaration `TauCeti.Difference.FixedVectors.fixed_iff_existsUnique_coordinates`.

### The analytic coefficient interface

The restricted-series carrier is existing library material. This group specifies the arithmetic entire subring E, the interface to the Tate algebra T, and the constant-field and separability statements that motives need. Evaluation of E at θ is legitimate although |θ| > 1, because E is restricted at every radius. A fraction of restricted series and an arbitrary Laurent series have different fixed fields and are not exchanged.

<a id="dm-8-entire-series"></a>

### 8.10 Algebraic entire series

**Target** `DrinfeldModulesAndTModules:DM.8/entire-series` (construction).

Let C=C∞, k=F_q(θ), and k∞=F_q((1/θ)) with the specified embeddings. E is the subring of C\[\[t]] consisting of f=Σ a_n t^n whose coefficients are algebraic over k, for which Σ converges at every finite radius, and for which k∞(a_n:n≥0) is finite-dimensional over k∞. The convergence condition is equivalently: for every real r>0, ||a_n|| r^n tends to zero. Evaluation at z∈C is the sum Σ a_n z^n. E embeds in the native radius-one restricted-series subring T.

**Proof route.**

- The finite coefficient-field condition is retained separately from entire convergence. A compositum of two finite coefficient fields controls sums and products.
- Use native restrictedness at each positive radius, and completeness plus the ultrametric summability criterion to obtain evaluation as a ring homomorphism.
- Algebraicity of each coefficient over k is required for ABP. The larger analytic entire ring in Papanikolas can be distinguished, but this plan uses the ABP subring throughout specialization.

**Needs:** [`DM.2/c-infinity`](#dm-2-c-infinity) (2.2); `mathlib:PowerSeries.IsRestricted.subring`; `mathlib:IntermediateField.adjoin`.

**Sources.**

- [PAP-v2](#source-pap-v2), §2.2.3–2.2.4 p.7: Papanikolas distinguishes the analytic entire ring by convergence at every radius. The packet deliberately uses the narrower ABP arithmetic subring, adding algebraic-over-k coefficients and a finite coefficient field over k∞; those additional hypotheses come from ABP, not from this analytic definition alone.
- [ABP-v1](#source-abp-v1), §2.4 p.7: The arithmetic entire ring requires coefficients algebraic over k, convergence at every finite radius and finite degree of the coefficient field over k∞. The packet preserves all three conditions and uses evaluation on this ring in lifting.
- [ABP-published](#source-abp-published), §2.4 p.244: The published definition has the same arithmetic entire-series conditions: algebraic coefficients, all-radius convergence and a finite coefficient extension of k∞. These are the narrower conditions selected by the packet.

**API.**

- **`TauCeti.Difference.Periods.entire_mem`** (characterisation): Membership is exactly coefficient algebraicity, restrictedness at every positive radius, and finite dimension of the coefficient-generated field over k∞.
- **`TauCeti.Difference.Periods.entire_eval`** (projection): Evaluation E→C sends f to Σ a_n z^n and is a ring homomorphism.
- **`TauCeti.Difference.Periods.entire_polynomial`** (constructor): Every polynomial with algebraic-over-k coefficients lies in E.
- **`TauCeti.Difference.Periods.entire_restricted`** (compatibility): The inclusion E→C\[\[t]] factors through the native restricted subring at radius one.
- **`TauCeti.Difference.Periods.entire_eval_polynomial`** (simp): Entire evaluation agrees with polynomial evaluation, including evaluation of t at z.

**Checks.**

- **`TauCeti.Difference.Periods.test_entire_series_1`** (computation): Zero is in E and evaluates to zero.
- **`TauCeti.Difference.Periods.test_entire_series_2`** (computation): Every constant with an algebraic-over-k coefficient is in E and evaluates to that coefficient.
- **`TauCeti.Difference.Periods.test_entire_series_3`** (non-example): The series Σ t^n over the chosen C is excluded: its coefficients do not tend to zero at radius one.

**Acceptance.**

- Zero is in E and evaluates to zero.
- Every constant with an algebraic-over-k coefficient is in E and evaluates to that coefficient.
- The series Σ t^n over the chosen C is excluded: its coefficients do not tend to zero at radius one.

**Uses.**

- ABP Theorem3.1.1 pp.7–8; PAP Theorem5.2.2 p.33: Ensures specialization is defined at θ outside the unit disk and that the arithmetic auxiliary-function estimates apply.

**Used by:** [8.33](#dm-8-entire-from-equation), [8.35](#dm-8-abp-lifting), [8.39](#dm-8-carlitz-deformation).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.entireSubring`.

<a id="dm-8-tate-analytic-interface"></a>

### 8.11 The one-variable analytic interface

**Target** `DrinfeldModulesAndTModules:DM.8/tate-analytic-interface` (comparison).

T is the existing radius-one restricted-series subring of C∞\[\[t]], equipped with its Gauss norm; L is its fraction field. The norm is complete, ultrametric and multiplicative. A nonzero f∈T has a finite zero divisor on |t|≤1, and f=λ·P·u with P the monic polynomial of those zeros, u=1+Σ\_{n≥1}b_n t^n, sup||b_n||<1 and b_n→0. The corresponding signed divisor gives the same factorization for a nonzero element of L. Thus T is a principal ideal domain, and its maximal ideals are (t−a) with ||a||≤1. These are adaptations of existing restricted-series and Weierstrass theory, not a new Tate-algebra definition.

**Proof route.**

- Reuse current TauCeti.PowerSeries.norm_eq_gaussNorm, norm_coeff_mul_pow_le and norm_le_iff on the native restricted-series subring. Import TauCeti.PowerSeries.IsDistinguished.exists_isUnit_isMonicOfDegree_mul_eq and existsUnique_isUnit_isMonicOfDegree_mul_eq (Weierstrass/Preparation.lean), isUnit_iff_isDistinguished_zero, and TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring (Weierstrass/Ideal.lean). Their complete ultrametric normed-field hypotheses hold for C∞ and radius 1>0. These exports postdate f790474; generic preparation, unit detection and the principal-ideal theorem are existing library results, not new DM.8 or AdicSpaces work.
- Over algebraically closed C∞, factor the distinguished polynomial into linear factors. Unit normalization isolates a constant and a strict-norm tail. Pass to fractions to obtain a finite signed zero/pole divisor.
- Check the pinned/current discrepancy recorded in the audit before implementation; generic restricted-series theory remains with its existing owner.

**Needs:** `mathlib:PowerSeries.IsRestricted.subring`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`; [`DM.2/c-infinity`](#dm-2-c-infinity) (2.2).

**Sources.**

- [PAP-v2](#source-pap-v2), §2.2.4 p.7: The source defines the radius-one Tate algebra and its fraction field and describes a nonzero element through its zeros and normalized unit. The packet translates that analytic description to the existing restricted-series carrier. Preparation, unit detection and the principal-ideal result are imported from current Tau Ceti; the C∞ zero/pole normalization is the comparison still to supply.

**Acceptance.**

- A factor t−a is a unit exactly when ||a||>1.
- A nonzero determinant in L does not imply it is a unit in T.
- The constant 1 has no zero divisor and Gauss norm 1.

**Used by:** [8.12](#dm-8-twisting-limit), [8.13](#dm-8-analytic-fixed-fields), [8.18](#dm-8-integral-trivialization), [8.33](#dm-8-entire-from-equation).

**Open input:** [Analytic and dimension supplier matching](#gap-analytic-and-dimension-supplier-matching).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.tate_analytic_interface`.

<a id="dm-8-twisting-limit"></a>

### 8.12 Limits under positive Frobenius twists

**Target** `DrinfeldModulesAndTModules:DM.8/twisting-limit` (theorem).

For f∈T with Gauss norm at most 1 there exist s≥1 and a polynomial P with coefficients in the algebraic closure of F_q inside C∞ such that f^(ns) tends to P in Gauss norm as n→∞. Moreover P≠0 exactly when ||f||=1. At coefficient level, a with ||a||<1 tends to 0 under a↦a^(q^(ns)); if ||a||=1, an s can be chosen so its residue is fixed and the sequence tends to its unique constant residue representative. The limiting coefficients need not lie in F_q itself.

**Proof route.**

- Use that the residue field is the algebraic closure of F_q; choose a finite common Frobenius period for the finitely many residues in the normalized factorization.
- The strict-norm unit tail tends to 1 uniformly. Norm<1 forces the constant factor to 0; norm 1 preserves a nonzero constant factor.

**Needs:** [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11); `FunctionFieldArithmetic:FA.0`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemmas 2.2.6–2.2.7 p.8: The coefficient lemma makes strictly small coefficients tend to zero and unit coefficients tend to constant residue representatives along a suitable Frobenius subsequence. The series lemma then gives a polynomial limit for norm at most one, nonzero precisely at norm one. Residues lie in the algebraic closure of F_q, so the limit need not have coefficients in F_q itself.

**Acceptance.**

- For a constant in F_{q^2} not in F_q the limit lies in F_{q^2}, so s=2 can be needed.
- A strict-norm series tends to 0.
- A radius-one unit of norm 1 has a nonzero polynomial limit.

**Used by:** [8.18](#dm-8-integral-trivialization).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.twisting_limit`.

<a id="dm-8-analytic-fixed-fields"></a>

### 8.13 Exact analytic constant fields

**Target** `DrinfeldModulesAndTModules:DM.8/analytic-fixed-fields` (theorem).

For inverse coefficient q-Frobenius σ, T^σ=F_q\[t] and L^σ=F_q(t), with the natural polynomial and rational-function embeddings. Also the σ-fixed elements of k̄(t) are F_q(t), and F_q(t)∩T=F_q\[t]. The same assertions for σ^n replace F_q by F_{q^n}. These assertions concern the actual C∞ Tate fraction field, not the full formal Laurent-series field, whose constants are F_q((t)).

**Proof route.**

- A fixed restricted series has coefficients in finite F_q and tending to 0; only finitely many are nonzero.
- For a fixed fraction the finite polar divisor is σ-stable. Its monic denominator has coefficients in F_q. Multiplying clears poles and reduces to the restricted-series statement.
- For a rational function use its normalized numerator/denominator, or compare a monic minimal polynomial for the algebraic-constant extension. Repeat for σ^n.

**Needs:** [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11); `mathlib:RatFunc`; `FunctionFieldArithmetic:FA.0`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.2 p.12; §2.2.5 pp.7–8: The source computes exact constants of the Tate algebra and its fraction field as F_q\[t] and F_q(t), using normalized zero/pole factorization; rational functions over bar(k) have the same fixed rational field. Replacing q by q^n gives the higher-power constant fields. Restrictedness excludes infinite constant-coefficient series.
- [CCM-v2](#source-ccm-v2), §4.1 p.13: The consumer uses coefficient twisting on the Tate algebra and its fraction field with exact rational constants, alongside its entire ring. This is a use of the shared analytic field interface; its multizeta objects are not additional DM.8 targets.

**Acceptance.**

- t and 1/(t−1) are fixed fractions.
- A fixed formal series with infinitely many nonzero finite-field coefficients is not in T.
- F_q(t)∩T contains no element with a pole in the closed disk.

**Used by:** [8.14](#dm-8-analytic-separability), [8.15](#dm-8-rigid-triviality), [8.18](#dm-8-integral-trivialization), [8.20](#dm-8-neutral-category), [8.29](#dm-8-relative-algebraic-closure), [8.31](#dm-8-difference-invariants), [8.42](#dm-8-carlitz-group), [8.47](#dm-8-constant-denominator).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.analytic_fixed_fields`.

<a id="dm-8-analytic-separability"></a>

### 8.14 Separability of the analytic fraction field

**Target** `DrinfeldModulesAndTModules:DM.8/analytic-separability` (theorem).

The triple F_q(t)⊂k̄(t)⊂L is σ-admissible: σ fixes F_q(t), its restrictions to k̄(t) and L have exact constants F_q(t), and L/k̄(t) is separable in the general field-extension sense. It is not asserted to be finite or algebraic.

**Proof route.**

- The constant-field claims come from analytic-fixed-fields.
- Use the characteristic-p separability criterion with the p-basis {t} of k̄(t): in the ambient Laurent series field no p-th root of t exists, since its order would be 1/p. This proves linear disjointness from k̄(t^(1/p)), hence separability. Record the exact criterion as an FA.0 request.

**Needs:** [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13); [`DM.2/c-infinity`](#dm-2-c-infinity) (2.2); `FunctionFieldArithmetic:FA.0`; `mathlib:Algebra.IsGeometricallyReduced`.

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.1 p.21: The source verifies that its analytic field tower is admissible, including separability of the possibly transcendental extension, by the characteristic-p structure of the function variable. The packet records the p-basis/geometric-reducedness route and requests its general field criterion; algebraic IsSeparable would impose an inappropriate extra hypothesis.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.29](#dm-8-relative-algebraic-closure).

**Open input:** [Analytic and dimension supplier matching](#gap-analytic-and-dimension-supplier-matching).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.analytic_separability`.

### Betti comparison and the rigid-trivial category

The comparison map is the scalar extension of the inclusion of the fixed submodule. It is always injective when constants are exact; rigid triviality adds surjectivity, equivalently equality of dimensions, and invertibility of the difference operator alone does not give it. The category T generated by the rational images of rigid-trivial dual Anderson motives is distinguished both from all effective dual motives and from the category R of all rigid-trivial pre-t-motives.

<a id="dm-8-rigid-triviality"></a>

### 8.15 Rigid analytic triviality

**Target** `DrinfeldModulesAndTModules:DM.8/rigid-triviality` (definition). **Planet:** Rigid analytic triviality.

For a pre-t-motive M supplied by DM.4, let V=L⊗\_{k̄(t)}M with its induced semilinear σ operator f, viewed as an F_q(t)-linear endomorphism. Set M^B=fixedSubmodule(f). M is rigid analytically trivial precisely when the native comparison L⊗\_{F_q(t)}M^B→V, a⊗v↦av, is bijective. This condition includes surjectivity; an injective comparison is automatic and alone is insufficient.

**Proof route.**

- Reuse native fixedSubmodule and subtype scalar extension; introduce only the bijectivity predicate.
- DM.4 supplies the actual motive scalar extension and compatibility with its τ convention; this predicate is meaningful without a new copy of the motive type.

**Needs:** [`DM.8/betti-comparison-dimension`](#dm-8-betti-comparison-dimension) (8.8); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); [`DM.4/star-adapter`](#dm-4-star-adapter) (4.9); `DrinfeldModulesAndTModules:DM.4`; [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13).

**Sources.**

- [PAP-v2](#source-pap-v2), §3.3.1 p.12; Proposition 3.3.8 p.13: Rigid analytic triviality means that scalar extension of the Betti space recovers the analytic motive. The proposition identifies this with the full-rank condition after proving comparison injectivity. The packet uses native comparison bijectivity as its definition, so its dimension characterization is a theorem rather than a substitute definition.

**API.**

- **`TauCeti.Difference.Periods.rigid_iff`** (characterisation): Rigid triviality is equivalent to bijectivity of the native lifted fixed-submodule inclusion.
- **`TauCeti.Difference.Periods.rigid_finrank`** (characterisation): For finite-dimensional V with exact constants, rigid triviality is equivalent to dim_F V^f=dim_L V.
- **`TauCeti.Difference.Periods.rigid_invariant`** (compatibility): An L-linear equivalence intertwining the semilinear operators preserves and reflects rigid triviality.

**Checks.**

- **`TauCeti.Difference.Periods.test_rigid_triviality_1`** (computation): The identity on Q has bijective comparison and is rigid trivial.
- **`TauCeti.Difference.Periods.test_rigid_triviality_2`** (computation): The zero-dimensional identity is rigid trivial.
- **`TauCeti.Difference.Periods.test_rigid_triviality_3`** (non-example): Multiplication by 2 on Q is invertible but is not rigid trivial, since its fixed space is zero.

**Acceptance.**

- The identity on Q has bijective comparison and is rigid trivial.
- The zero-dimensional identity is rigid trivial.
- Multiplication by 2 on Q is invertible but is not rigid trivial, since its fixed space is zero.

**Uses.**

- PAP Proposition 3.3.9 pp.13–15: The bijective comparison is equivalent to a fundamental matrix and supplies the integral trivialization criterion.
- PAP Propositions 3.3.11–3.3.14 pp.15–16: Closure under subquotients, tensor products and duals makes Betti realization an exact faithful tensor functor.

**Used by:** [8.17](#dm-8-fundamental-betti-basis), [8.19](#dm-8-betti-exact-tensor).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.IsRigidTrivial`.

<a id="dm-8-fundamental-matrix"></a>

### 8.16 Fundamental solution matrix

**Target** `DrinfeldModulesAndTModules:DM.8/fundamental-matrix` (definition).

For fields F⊂K⊂L with σ-admissible structure and Φ∈GL_r(K), a fundamental matrix is Ψ∈GL_r(L) satisfying σ(Ψ)=ΦΨ, after embedding Φ in L. A rigid analytic trivialization over T is such a matrix in GL_r(T), with equation read in T. A matrix with determinant merely nonzero in L does not meet the integral condition.

**Proof route.**

- Use the native general linear group (matrix units) and an explicit entrywise equation.
- The generic definition applies to any coefficient automorphism; the analytic specialization uses inverse q-Frobenius.

**Needs:** [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); `mathlib:Matrix.GeneralLinearGroup`.

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.6 p.22; Proposition 3.3.9 p.13: A fundamental matrix is invertible and satisfies σΨ=ΦΨ. The motive proposition and solution-coordinate lemma identify its columns with solutions and its inverse with fixed motive coordinates. A change of motive basis acts on the left, whereas a second fundamental matrix differs on the right by an invertible constant matrix.
- [NGO-HAL](#source-ngo-hal), §4.1 printedp.17; §5.2 printedpp.20–21: The consumer builds inverse-twist polynomial systems and explicit analytic matrices satisfying the fundamental equation, then applies the shared period and ABP machinery. Its specialized multizeta extensions consume this matrix interface and remain with their existing owner.

**API.**

- **`TauCeti.Difference.Periods.fundamental_equation`** (characterisation): Fundamentality is exactly the entrywise equation σ(Ψ)=ΦΨ.
- **`TauCeti.Difference.Periods.fundamental_change_basis`** (compatibility): Changing the motive basis by B sends Φ to σ(B)Φ B^−1 and Ψ to B Ψ.
- **`TauCeti.Difference.Periods.fundamental_right_constant`** (constructor): Right multiplication by C∈GL_r(F) preserves fundamentality.
- **`TauCeti.Difference.Periods.fundamental_unique`** (characterisation): If X is any rectangular solution of σ(X)=Φ X, there is a unique constant matrix C over F with X=Ψ C; if X is square invertible then C is invertible.

**Checks.**

- **`TauCeti.Difference.Periods.test_fundamental_matrix_1`** (computation): For Φ=1 the identity matrix is fundamental.
- **`TauCeti.Difference.Periods.test_fundamental_matrix_2`** (computation): The empty identity matrix is fundamental for rank 0.
- **`TauCeti.Difference.Periods.test_fundamental_matrix_3`** (non-example): Under σ=id over Q, no invertible scalar matrix is fundamental for Φ=2.

**Acceptance.**

- For Φ=1 the identity matrix is fundamental.
- The empty identity matrix is fundamental for rank 0.
- Under σ=id over Q, no invertible scalar matrix is fundamental for Φ=2.

**Uses.**

- Ngo Dac §5.2 pp.20–21; CCM Lemma5.1.1 proof pp.23–24; IKLNP Theorem2.4 proof p.33: Turns a second block solution into a constant matrix, including rectangular solutions.

**Used by:** [8.17](#dm-8-fundamental-betti-basis), [8.22](#dm-8-solution-space), [8.23](#dm-8-solution-ring), [8.37](#dm-8-degree-span).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.IsFundamental`.

<a id="dm-8-fundamental-betti-basis"></a>

### 8.17 Fundamental matrices and Betti bases

**Target** `DrinfeldModulesAndTModules:DM.8/fundamental-betti-basis` (comparison).

For M of k̄(t)-dimension r with column basis m and σ(m)=Φ m, M is rigid trivial iff Φ has a fundamental matrix in GL_r(L). If Ψ is one, the entries of Ψ^−1m form an F_q(t)-basis of M^B. The columns of Ψ form an F_q(t)-basis of the vector solution space σ(v)=Φ v; these are two different coordinate conventions.

**Proof route.**

- An inverse fundamental matrix turns the motive basis into fixed vectors. Conversely a fixed L-basis gives a matrix whose inverse solves the equation.
- Apply fixed-basis-coordinates for exact constants and uniqueness. Do not identify column solutions with the motive-basis rows without inversion.

**Needs:** [`DM.8/fundamental-matrix`](#dm-8-fundamental-matrix) (8.16); [`DM.8/rigid-triviality`](#dm-8-rigid-triviality) (8.15); [`DM.8/fixed-basis-coordinates`](#dm-8-fixed-basis-coordinates) (8.9); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `DrinfeldModulesAndTModules:DM.4`.

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.9(a, b) p.13; §4.1.6 p.22: The proposition proves that Ψ⁻¹ times the motive basis is a Betti basis and that rigid triviality is equivalent to existence of a fundamental matrix. This fixes the orientation: solution columns belong to Ψ, but fixed motive vectors use Ψ⁻¹.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.18](#dm-8-integral-trivialization), [8.19](#dm-8-betti-exact-tensor).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.fundamental_betti_basis`.

<a id="dm-8-integral-trivialization"></a>

### 8.18 Integral analytic trivializations

**Target** `DrinfeldModulesAndTModules:DM.8/integral-trivialization` (theorem).

If a rigid-trivial pre-t-motive has a polynomial σ matrix Φ∈Mat_r(k̄\[t]) with det Φ=c(t−θ)^s, c∈k̄^× and s≥0, it has a fundamental matrix Ψ∈GL_r(T). For the corresponding integral DM.4 dual Anderson motive, its T-fixed module is free over F_q\[t] of rank r, its basis gives Ψ^−1m, and the integral and rational notions of rigid triviality agree.

**Proof route.**

- Clear denominators of fixed vectors by σ-fixed polynomials, giving an integral fixed lattice with rationalization M^B.
- The determinant of a lattice basis is a constant times Ω^s times a polynomial over F_q. If that polynomial has positive degree, a normalized polynomial relation modulo it, its Frobenius limits and a finite-field trace give a smaller-degree fixed relation, contradicting the lattice basis.
- Hence the determinant is a T-unit. Use DM.2 Ω and DM.4 freeness/rationalization interfaces.

**Needs:** [`DM.8/fundamental-betti-basis`](#dm-8-fundamental-betti-basis) (8.17); [`DM.8/twisting-limit`](#dm-8-twisting-limit) (8.12); [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13); [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `DrinfeldModulesAndTModules:DM.4`; [`DM.2/omega`](#dm-2-omega) (2.10).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.9(c) pp.13–15; Proposition 3.4.7 p.19: For polynomial Φ with determinant supported at t=θ, the proposition clears analytic denominators and produces an invertible Tate-algebra trivialization. It also relates the free integral fixed module over F_q\[t] to its rationalization. The later proposition transfers this to the dual Anderson motive; polynomiality alone does not imply eligibility.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.38](#dm-8-period-transcendence).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.integral_trivialization`.

<a id="dm-8-betti-exact-tensor"></a>

### 8.19 Exact tensor Betti comparison

**Target** `DrinfeldModulesAndTModules:DM.8/betti-exact-tensor` (theorem).

For an exact sequence 0→P→Q→R→0 of pre-t-motives, rigid triviality of Q implies rigid triviality of P and R. On rigid-trivial objects Betti realization is exact and faithful, and the canonical maps P^B⊗\_F Q^B→(P⊗\_K Q)^B and (P^B)^∨→(P^∨)^B are isomorphisms. Here F=F_q(t), K=k̄(t); tensoring Betti spaces uses F and tensoring motives uses K.

**Proof route.**

- Use left exactness of fixed vectors and scalar-extension exactness. An isomorphism for Q forces the comparisons for the subobject and quotient to be isomorphisms, by injectivity and dimensions.
- For faithfulness, a morphism zero on a spanning Betti basis is zero on the scalar extension and therefore on the motive.
- Kronecker products of fundamental matrices supply tensor comparison; inverse transposes supply dual comparison. The natural maps, not just equal dimensions, must be identified.

**Needs:** [`DM.8/rigid-triviality`](#dm-8-rigid-triviality) (8.15); [`DM.8/fundamental-betti-basis`](#dm-8-fundamental-betti-basis) (8.17); [`DM.8/betti-comparison-injective`](#dm-8-betti-comparison-injective) (8.5); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `DrinfeldModulesAndTModules:DM.4`.

**Sources.**

- [PAP-v2](#source-pap-v2), Propositions 3.3.11–3.3.14 pp.15–16: The propositions prove exactness through subobjects and quotients and compatibility of the Betti functor with tensor products and duals. The packet retains these as combined target-level milestones and corrects the independent tensor-factor ranks in the displayed proof notation, without duplicating the motive constructions owned by DM.4.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.20](#dm-8-neutral-category).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.betti_exact_tensor`.

<a id="dm-8-neutral-category"></a>

### 8.20 The neutral category of rigid-trivial motives

**Target** `DrinfeldModulesAndTModules:DM.8/neutral-category` (theorem). **Planet:** Neutral Tannakian category.

The strictly full subcategory R of the DM.4 pre-t-motive category consisting of rigid-trivial objects is rigid, abelian and F_q(t)-linear; its unit has endomorphism field F_q(t), and ω(M)=M^B is an exact faithful F_q(t)-linear tensor functor to finite-dimensional vector spaces. Thus R is neutral Tannakian over the imperfect field F_q(t). Let T be the strictly full tensor subcategory generated by the rational images of rigid-trivial dual Anderson motives; it too has this fibre functor. T is this generated subcategory, not all effective dual motives and not an assumption that every t-module is trivial.

**Proof route.**

- Import the rigid abelian motive category, its unit, tensor and dual constructions from DM.4. Closure and exactness come from betti-exact-tensor.
- Identify End(1) using exact constants. The arbitrary-field neutral reconstruction is already planned as MC.6/neutral-tannaka-reconstruction; instantiate it over F_q(t), with no characteristic-zero assumption.
- Define T by the generic tensor-generation construction supplied with MC.6; its chosen generating family is the DM.4 rational image. The effective Frobenius modules of IKLNP are supplied by DM.4 and are not automatically Anderson-free over k̄\[σ].

**Needs:** [`DM.8/betti-exact-tensor`](#dm-8-betti-exact-tensor) (8.19); [`DM.8/fixed-space-finite`](#dm-8-fixed-space-finite) (8.6); [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); [`DM.4/dual-realization`](#dm-4-dual-realization) (4.10); `DrinfeldModulesAndTModules:DM.4`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6`.

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 3.3.15 pp.16–17; Definition 3.4.10 p.19: The theorem establishes a neutral Tannakian category of rigid analytically trivial pre-t-motives with Betti fiber functor over F_q(t); the definition takes the tensor subcategory generated by the dual Anderson image. The packet imports general arbitrary-field reconstruction from MC.6 and keeps formation of these particular motive categories here.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.32](#dm-8-tannakian-identification), [8.41](#dm-8-logarithm-motive-membership), [8.42](#dm-8-carlitz-group).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.neutral_category`.

### Solution algebras, the group and the torsor

These targets hold for any admissible field triple. The coordinate algebra of the solution scheme contains the inverse determinant, and the comparison algebra lives in a tensor ring that can have zero divisors. The Hopf structure is an output of descent, not extra data, and the structure maps and torsor identity are checked on all base algebras, not only on rational points.

<a id="dm-8-admissible-fields"></a>

### 8.21 Admissible difference fields

**Target** `DrinfeldModulesAndTModules:DM.8/admissible-fields` (definition).

A σ-admissible triple consists of field embeddings F⊂K⊂L, an F-algebra automorphism σ\_K of K and an F-algebra automorphism σ\_L of L compatible with K→L, exact fixed fields K^σ=L^σ=F, and a separable extension L/K. F is fixed pointwise. No algebraic closure of F, finite extension or characteristic-zero hypothesis is included.

**Proof route.**

- Package only the complete mathematical predicate on specified field and automorphism data.
- The embeddings and algebra towers are native. Compatibility is an equation, exact constants are the two explicit range equalities, and separability is expressed by the native geometric-reducedness property for the field extension. It is not Algebra.IsSeparable, which would incorrectly force algebraicity.

**Needs:** `mathlib:Algebra.IsGeometricallyReduced`; `mathlib:AlgEquiv`; `mathlib:IsScalarTower`.

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.1 p.21: Admissibility consists of a compatible coefficient automorphism on F⊂K⊂L, exact constants F in both K and L, and separability of L/K. The packet records the full tower, using geometric reducedness for the general extension property rather than requiring an algebraic extension.

**API.**

- **`TauCeti.Difference.Periods.admissible_compat`** (projection): σ\_L(algebra Map K L a)=algebra Map K L(σ\_K a).
- **`TauCeti.Difference.Periods.admissible_constants`** (projection): σ\_L a=a iff a is in the image of F; the same holds in K.
- **`TauCeti.Difference.Periods.admissible_separable`** (projection): L/K is geometrically reduced, the native formulation of general separability here.

**Checks.**

- **`TauCeti.Difference.Periods.test_admissible_fields_1`** (computation): F=K=L=Q with identity automorphisms is admissible.
- **`TauCeti.Difference.Periods.test_admissible_fields_2`** (computation): F=K=R, L=C with identity on R and conjugation on C is admissible.
- **`TauCeti.Difference.Periods.test_admissible_fields_3`** (non-example): The same tower with identity on C is not admissible, because its fixed field is too large.

**Acceptance.**

- F=K=L=Q with identity automorphisms is admissible.
- F=K=R, L=C with identity on R and conjugation on C is admissible.
- The same tower with identity on C is not admissible, because its fixed field is too large.

**Uses.**

- PAP §§4.2–4.3 pp.22–27: Exact constants control invariant-ideal descent and uniqueness; general separability supplies geometric reducedness for the solution group.
- PAP §4.4 pp.27–28: The power-admissible algebraic-closure instances identify the geometric fixed field without assuming density of rational points over F.

**Used by:** [8.22](#dm-8-solution-space), [8.23](#dm-8-solution-ring), [8.25](#dm-8-invariant-ideal-descent).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.IsAdmissible`.

<a id="dm-8-solution-space"></a>

### 8.22 The solution space of a difference system

**Target** `DrinfeldModulesAndTModules:DM.8/solution-space` (construction).

For σ-admissible F⊂K⊂L and Φ∈Mat_r(K), Sol(Φ) is the native F-submodule of L^r cut out by σ\_L(v)=Φ v. It has F-dimension at most r. If Φ is invertible and Ψ fundamental, every solution is uniquely Ψ c with c∈F^r. For rectangular solution matrices the same description holds columnwise.

**Proof route.**

- The coefficient twist and matrix multiplication are F-linear, so their equalizer is an F-submodule.
- For invertible Φ rewrite the equation as fixedness for Φ⁻¹σ and apply the existing fixed-vector chain. For singular Φ, let W be the L-span of solutions. Compatibility gives σ(W)=Φ(W); the coefficient automorphism preserves dim_L W, so Φ restricts to an injection on W. Twisting a minimal relation and cancelling this restricted Φ gives coefficient fixedness, hence F-independence implies L-independence and the bound r. This extends the source's invertible-matrix statement without asserting that Φ is invertible on all L^r.

**Needs:** [`DM.8/admissible-fields`](#dm-8-admissible-fields) (8.21); [`DM.8/fundamental-matrix`](#dm-8-fundamental-matrix) (8.16); [`DM.8/fixed-independence`](#dm-8-fixed-independence) (8.4); `mathlib:Submodule`.

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.3–4.1.6 pp.21–22: The source defines solutions of σv=Φv for invertible Φ and obtains constant coordinates from a fundamental matrix. The packet additionally bounds solutions for singular square Φ: on their L-span W, σ(W)=Φ(W) and dim σ(W)=dim W, so Φ is injective on W and the same minimal-relation descent works. Rectangular solution arrays apply the vector equation columnwise.

**API.**

- **`TauCeti.Difference.Periods.solution_mem`** (characterisation): v lies in Sol(Φ) iff σ(v)=Φ v.
- **`TauCeti.Difference.Periods.solution_finrank`** (structure): Sol(Φ) is finite-dimensional over F and its dimension is at most r.
- **`TauCeti.Difference.Periods.solution_coordinates`** (universal-property): A fundamental Ψ identifies F^r linearly with Sol(Φ), c↦Ψ c.

**Checks.**

- **`TauCeti.Difference.Periods.test_solution_space_1`** (computation): With σ=id, Φ=1 over Q the solution submodule is the whole space.
- **`TauCeti.Difference.Periods.test_solution_space_2`** (computation): With σ=id, Φ=2 in rank 1 over Q the solution submodule is zero.
- **`TauCeti.Difference.Periods.test_solution_space_3`** (non-example): A repeated nonzero solution column is linearly dependent even though each column is a solution.

**Acceptance.**

- With σ=id, Φ=1 over Q the solution submodule is the whole space.
- With σ=id, Φ=2 in rank 1 over Q the solution submodule is zero.
- A repeated nonzero solution column is linearly dependent even though each column is a solution.

**Uses.**

- PAP §4.1.6 p.22: A fundamental matrix gives a constant-coordinate basis for all solutions, including rectangular solution matrices.
- CCM Lemma 5.1.1 proof pp.23–24: The same solution-coordinate statement turns an auxiliary block solution into a constant matrix before denominator descent.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.solutionSpace`.

<a id="dm-8-solution-ring"></a>

### 8.23 The solution ring and field

**Target** `DrinfeldModulesAndTModules:DM.8/solution-ring` (construction).

Fix an admissible triple, Φ∈GL_r(K) and Ψ∈GL_r(L) fundamental. Define Σ=K\[Ψ\_ij, det(Ψ)^−1] as the native K-subalgebra of L generated by these elements, Λ=K(Ψ\_ij) as the native intermediate field, and Z=Spec Σ, a closed K-subscheme of GL_r. The evaluation homomorphism K\[X_ij, det(X)^−1]→L has image Σ and kernel the defining ideal of Z. Λ is the fraction field of Σ.

**Proof route.**

- Use native adjoin, matrix determinant, localization and spectrum; include the inverse determinant among generators.
- The difference equation makes Σ stable under σ and σ inverse. The field generated by matrix entries already contains the inverse determinant.
- The generator evaluation gives the quotient/image dictionary and its fraction field.

**Needs:** [`DM.8/fundamental-matrix`](#dm-8-fundamental-matrix) (8.16); [`DM.8/admissible-fields`](#dm-8-admissible-fields) (8.21); `mathlib:Algebra.adjoin`; `mathlib:IntermediateField.adjoin`; `mathlib:Matrix.det`; `mathlib:AlgebraicGeometry.Spec`; `mathlib:AlgebraicGeometry.IsClosedImmersion.spec_of_surjective`.

**Sources.**

- [PAP-v2](#source-pap-v2), §4.2.1 p.22: The source constructs the K-algebra generated by entries of Ψ and det(Ψ)⁻¹, its fraction field and the associated affine subscheme of GL_r. The determinant inverse is essential. The packet uses native algebra adjoin and Spec, with the closed immersion supplied by the surjective coordinate-ring map.

**API.**

- **`TauCeti.Difference.Periods.solutionRing_entry`** (constructor): Every entry Ψ\_ij and det(Ψ)^−1 belongs to Σ.
- **`TauCeti.Difference.Periods.solutionRing_le`** (universal-property): Σ≤A iff a K-subalgebra A contains all entries and the inverse determinant.
- **`TauCeti.Difference.Periods.solutionField_fraction`** (compatibility): Λ is the fraction field of the native generated subalgebra Σ.
- **`TauCeti.Difference.Periods.solutionRing_twist`** (structure): σ restricts to a semilinear ring automorphism of Σ.

**Checks.**

- **`TauCeti.Difference.Periods.test_solution_ring_1`** (computation): For Ψ=1 in rank 1, Σ=K and Λ=K.
- **`TauCeti.Difference.Periods.test_solution_ring_2`** (computation): For the empty identity matrix, Σ=K, with empty determinant 1.
- **`TauCeti.Difference.Periods.test_solution_ring_3`** (non-example): For a transcendental scalar z in rank 1, Σ=K\[z, z^−1]; omitting det^−1 gives the wrong ring.

**Acceptance.**

- For Ψ=1 in rank 1, Σ=K and Λ=K.
- For the empty identity matrix, Σ=K, with empty determinant 1.
- For a transcendental scalar z in rank 1, Σ=K\[z, z^−1]; omitting det^−1 gives the wrong ring.

**Uses.**

- PAP Theorem 4.2.11 p.26: The ring is the coordinate algebra of the particular solution torsor; its tensor-square is compared with the group coordinate ring.
- PAP Lemma 4.5.2 and Theorem 4.5.3 pp.28–29: It contains fundamental matrices for tensor subquotients of the chosen generator and makes their Betti comparisons available over every F-algebra.

**Used by:** [8.24](#dm-8-comparison-algebra), [8.26](#dm-8-solution-ring-simple), [8.29](#dm-8-relative-algebraic-closure).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.solutionRing`.

<a id="dm-8-comparison-algebra"></a>

### 8.24 The comparison coordinate algebra

**Target** `DrinfeldModulesAndTModules:DM.8/comparison-algebra` (construction).

In L⊗\_K L form Ψ\_1=(Ψ\_ij⊗1), Ψ\_2=(1⊗Ψ\_ij), and D=Ψ\_1^−1Ψ\_2. Define Δ=F\[D_ij, det(D)^−1], a native F-subalgebra of L⊗\_K L. Let Γ=Spec Δ. The diagonal σ action fixes D entrywise, but L⊗\_K L need not be a domain. Γ is initially a closed subscheme of GL_r/F; its group structure is a theorem, not part of this definition.

**Proof route.**

- Map native matrix units along the two tensor-product algebra maps, invert the first and multiply by the second.
- The equation σΨ=ΦΨ cancels Φ in σ(D). Apply native F-algebra generation in the tensor ring; retain determinant inversion.

**Needs:** [`DM.8/solution-ring`](#dm-8-solution-ring) (8.23); `mathlib:Algebra.TensorProduct.includeLeft`; `mathlib:Algebra.TensorProduct.includeRight`; `mathlib:Algebra.adjoin`.

**Sources.**

- [PAP-v2](#source-pap-v2), §4.2.1–4.2.2 p.22: Two tensor copies of Ψ give D=Ψ₁⁻¹Ψ₂, fixed by coefficient twist; its entries and inverse determinant generate the constant comparison algebra. The tensor ring need not be a domain. The source constructs the algebra before establishing its Hopf structure, matching the packet's dependency order.

**API.**

- **`TauCeti.Difference.Periods.comparisonMatrix_formula`** (data): D is Ψ\_1^−1Ψ\_2, in that order.
- **`TauCeti.Difference.Periods.comparisonAlgebra_le`** (universal-property): Δ is the least F-subalgebra containing the entries of D and det(D)^−1.
- **`TauCeti.Difference.Periods.comparisonMatrix_fixed`** (relation): The diagonal coefficient automorphism fixes D.
- **`TauCeti.Difference.Periods.comparisonMatrix_cocycle`** (relation): In the three-fold tensor product, D_12 D_23=D_13.

**Checks.**

- **`TauCeti.Difference.Periods.test_comparison_algebra_1`** (computation): For Ψ=1, D=1 and Δ consists of scalar constants.
- **`TauCeti.Difference.Periods.test_comparison_algebra_2`** (computation): For the empty identity, D is the empty identity and Δ consists of constants.
- **`TauCeti.Difference.Periods.test_comparison_algebra_3`** (non-example): For a scalar z, D=z^−1⊗z; its order distinguishes right multiplication from the reversed torsor convention.

**Acceptance.**

- For Ψ=1, D=1 and Δ consists of scalar constants.
- For the empty identity, D is the empty identity and Δ consists of constants.
- For a scalar z, D=z^−1⊗z; its order distinguishes right multiplication from the reversed torsor convention.

**Uses.**

- PAP Propositions 4.2.8–4.2.10 pp.25–26: The three-factor comparison cocycle descends multiplication, inversion and the identity to its spectrum.
- PAP §6.2 pp.35–36: Computing the comparison matrix of the logarithm extension places its group in the scalar-action triangular subgroup.

**Used by:** [8.28](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.comparisonAlgebra`.

<a id="dm-8-invariant-ideal-descent"></a>

### 8.25 Invariant ideals descend to constants

**Target** `DrinfeldModulesAndTModules:DM.8/invariant-ideal-descent` (theorem).

In L\[X_ij, det(X)^−1] let σ\_0 act on coefficients and fix the variables. Extension and contraction give inverse bijections between ideals over F and σ\_0-stable ideals over L.

**Proof route.**

- Choose a finite-support expression in an F-basis and normalize one coefficient to 1. Subtract twists to reduce support; exact constants complete induction.

**Needs:** [`DM.8/admissible-fields`](#dm-8-admissible-fields) (8.21); `mathlib:Ideal.map`; `mathlib:Ideal.comap`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.2.3 p.23: The lemma descends coefficient-twist-stable ideals in a localized polynomial ring from L to the exact constant field using finite-support coefficient relations. The packet expresses the same coefficient argument as a tensor-algebra interface. No solution-ring simplicity or later Σ-descent result is assumed here.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.26](#dm-8-solution-ring-simple), [8.27](#dm-8-solution-invariant-ideal-descent), [8.28](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.invariant_ideal_descent`.

<a id="dm-8-solution-ring-simple"></a>

### 8.26 Difference simplicity of the solution ring

**Target** `DrinfeldModulesAndTModules:DM.8/solution-ring-simple` (theorem).

The solution ring Σ has no proper nonzero ideal stable under σ; equivalently the kernel of generator evaluation is maximal among proper σ\_1-stable ideals, where σ\_1 applies coefficient σ and sends X to Φ X. Stability by inclusion suffices because the coordinate ring is noetherian.

**Proof route.**

- Translate by Ψ to turn σ\_1 into coefficient σ\_0. Extend a putative invariant ideal to a maximal ideal over constants, obtaining a finite field extension E/F and a second fundamental matrix.
- Its ratio to Ψ lies in GL_r(E). Noetherian stabilization and faithful flatness of scalar extension force the old defining ideal and the larger one to coincide.
- Only the L-valued invariant-ideal clause is used here; the Σ clause is proved afterward, avoiding a logical cycle.

**Needs:** [`DM.8/solution-ring`](#dm-8-solution-ring) (8.23); [`DM.8/invariant-ideal-descent`](#dm-8-invariant-ideal-descent) (8.25); `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`.

**Sources.**

- [PAP-v2](#source-pap-v2), Corollary 4.2.5 p.24: The corollary proves that the solution ring has no proper nonzero twist-stable ideal using the earlier L-coefficient descent and a constant maximal-ideal specialization. The packet makes the noetherian passage from inclusion stability to equality explicit and imports affine descent without using the later solution-ring ideal-descent theorem circularly.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.27](#dm-8-solution-invariant-ideal-descent), [8.28](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.solution_ring_simple`.

<a id="dm-8-solution-invariant-ideal-descent"></a>

### 8.27 Ideal descent over the solution ring

**Target** `DrinfeldModulesAndTModules:DM.8/solution-invariant-ideal-descent` (theorem).

Every coefficient-σ-stable ideal in Σ\[X_ij, det(X)^−1] is generated by its intersection with F\[X_ij, det(X)^−1]. Extension and contraction are inverse on these ideals. This is asserted for the σ-simple solution ring Σ, not for an arbitrary difference algebra.

**Proof route.**

- Use a minimal nonzero support modulo the contracted ideal. Its leading-coefficient ideal is σ-stable and nonzero, so simplicity supplies coefficient 1. Subtract twists and apply exact constants to contradict minimal support.

**Needs:** [`DM.8/solution-ring-simple`](#dm-8-solution-ring-simple) (8.26); [`DM.8/invariant-ideal-descent`](#dm-8-invariant-ideal-descent) (8.25); `mathlib:Ideal.map`; `mathlib:Ideal.comap`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.2.7 p.25: The lemma extends invariant-ideal descent from L-coefficients to solution-ring coefficients after σ-simplicity has been established. Finite-support relations and simplicity control the coefficient module. The tensor formulation retains coefficient-only twist and the base-field scalar actions.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.28](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.solution_invariant_ideal_descent`.

<a id="dm-8-difference-torsor"></a>

### 8.28 The difference Galois group and its torsor

**Target** `DrinfeldModulesAndTModules:DM.8/difference-torsor` (theorem). **Planet:** Difference Galois torsor.

For every admissible triple and fundamental Ψ, Δ admits the Hopf structure inherited from GL_r, with comultiplication D_ij↦Σ\_k D_ik⊗D_kj, counit D_ij↦δ\_ij and antipode D↦D^−1. Therefore Γ=Spec Δ is a closed F-subgroup scheme of GL_r. Z=Spec Σ is a right Γ\_K-torsor: the map (u, v)↦(u, u^−1v) induces Z×\_K Z≅Z×\_K Γ\_K, equivalently an isomorphism Σ⊗\_K Σ≅Σ⊗\_F Δ. Also Z_L≅Γ\_L via u↦Ψ^−1u. These are scheme and coordinate-ring isomorphisms, not just bijections on rational points.

**Proof route.**

- Conjugate defining ideals by the translation X↦Ψ^−1X and use invariant-ideal descent over L and Σ.
- The cocycle formula on three tensor factors gives multiplication; identity and factor swap give counit and inverse. Descend the resulting diagrams by faithful flatness.
- The field inclusions make Σ faithfully flat over K and F; use the supplier affine descent interface to prove the torsor statement.

**Needs:** [`DM.8/comparison-algebra`](#dm-8-comparison-algebra) (8.24); [`DM.8/invariant-ideal-descent`](#dm-8-invariant-ideal-descent) (8.25); [`DM.8/solution-invariant-ideal-descent`](#dm-8-solution-invariant-ideal-descent) (8.27); [`DM.8/solution-ring-simple`](#dm-8-solution-ring-simple) (8.26); `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`; `SchemeAndStackFoundations:SF.1/torsor`; `mathlib:CommHopfAlgCat`.

**Sources.**

- [PAP-v2](#source-pap-v2), Propositions 4.2.4 and 4.2.8 pp.23–25; Theorem 4.2.11 p.26: The propositions identify the comparison algebra after base change and construct coproduct, counit and antipode from matrix multiplication, identity and inversion. The theorem proves the solution scheme is a torsor under the resulting affine group scheme. The packet records coordinate-ring isomorphisms and fpqc descent, rather than relying only on rational-point identities.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.30](#dm-8-difference-smooth-dimension), [8.31](#dm-8-difference-invariants), [8.32](#dm-8-tannakian-identification).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.difference_torsor`.

### Dimension and motivic identification

The analytic field triple supplies relative algebraic closure of K in its solution field; K itself is not algebraically closed. The fixed-field theorem uses the algebraic closures and all powers of σ. Full faithfulness and descent of subobjects identify the difference Galois group with the motivic one; matching dimensions or a faithful representation alone would not.

<a id="dm-8-relative-algebraic-closure"></a>

### 8.29 Relative algebraic closure in the analytic solution field

**Target** `DrinfeldModulesAndTModules:DM.8/relative-algebraic-closure` (theorem).

For the actual analytic triple (F_q(t), k̄(t), L), k̄(t) is algebraically closed in Λ=k̄(t)(Ψ). Namely every element of Λ algebraic over k̄(t) lies in k̄(t). This is a relative-algebraic-closure assertion, not that k̄(t) is an algebraically closed field.

**Proof route.**

- Adjoin all twists of a relatively algebraic element; the resulting intermediate field H is finite and separable over k̄(t), since Λ is finitely generated.
- Use the function-field/curve correspondence and a σ-invariant effective divisor above infinity. Riemann–Roch supplies a finite-dimensional stable space of functions generating H.
- Apply Lang to GL_m over F_q, base changed to k̄, to produce a σ-fixed basis. Exact constants put every basis function in F_q(t), forcing H=k̄(t).

**Needs:** [`DM.8/solution-ring`](#dm-8-solution-ring) (8.23); [`DM.8/analytic-separability`](#dm-8-analytic-separability) (8.14); [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13); `FunctionFieldArithmetic:FA.0`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`; `SchemeAndStackFoundations:SF.3/line-bundle-degree-bounds`; `SchemeAndStackFoundations:SF.3`.

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 4.3.3 pp.26–27: For K=bar(k)(t), the proposition turns a finite twist-stable subextension of the solution field into a curve over perfect bar(k). A large divisor gives a finite-dimensional stable section space, Lang normalizes its semilinear action, and exact constants eliminate the extension. The packet separates the curve/Frobenius transport, Riemann–Roch bounds and Lang base extension needed for this proof.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.30](#dm-8-difference-smooth-dimension).

**Open input:** [Analytic and dimension supplier matching](#gap-analytic-and-dimension-supplier-matching).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.relative_algebraic_closure`.

<a id="dm-8-difference-smooth-dimension"></a>

### 8.30 Smoothness and dimension of the difference group

**Target** `DrinfeldModulesAndTModules:DM.8/difference-smooth-dimension` (theorem).

If K is relatively algebraically closed in Λ for an admissible triple, Γ is geometrically integral and smooth over F, Z is geometrically integral and smooth over K, and dim_F Γ=trdeg_K Λ. In the analytic triple the extra hypothesis follows from relative-algebraic-closure. The proof of smoothness uses the finite-type group structure: geometric reducedness alone is not a smoothness criterion for arbitrary schemes.

**Proof route.**

- Separability and relative algebraic closure imply geometric integrality of Σ. Transfer geometric reducedness and irreducibility across the torsor after an algebraically closed extension.
- Apply the native finite-type Hopf-algebra smoothness criterion to Γ; smoothness of Z follows by the torsor local trivialization and descent.
- Use dimension invariance under field extension and the affine-domain dimension/transcendence theorem for Σ.

**Needs:** [`DM.8/difference-torsor`](#dm-8-difference-torsor) (8.28); [`DM.8/relative-algebraic-closure`](#dm-8-relative-algebraic-closure) (8.29); `tauceti:TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced`; `SchemeAndStackFoundations:SF.1/torsor`; `SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension`.

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 4.3.1 p.26; Corollary 4.3.4 p.27: The theorem identifies group dimension with the solution-field transcendence degree and proves smoothness/geometric connectedness in the analytic case; the corollary supplies relative closure there. The packet states the general admissible-field result with relative algebraic closure as an extra hypothesis and uses the native finite-type Hopf-algebra smoothness criterion, not an arbitrary-scheme reducedness shortcut.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.31](#dm-8-difference-invariants), [8.38](#dm-8-period-transcendence), [8.43](#dm-8-logarithm-group-linear).

**Open input:** [Analytic and dimension supplier matching](#gap-analytic-and-dimension-supplier-matching).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.difference_smooth_dimension`.

<a id="dm-8-difference-invariants"></a>

### 8.31 The difference Galois action and its fixed field

**Target** `DrinfeldModulesAndTModules:DM.8/difference-invariants` (theorem).

Right multiplication gives Γ(F)≅Aut_σ(Σ/K)≅Aut_σ(Λ/K). For geometric fixed-field assertions choose an extension of σ to an algebraic closure of L, write F_n for its σ^n-fixed field and assume (F_n, K̄, L̄) is σ^n-admissible for every n and F̄=⋃F_n. On the corresponding geometrically integral solution field Λ̃, the elements fixed by Γ(F̄) are precisely K̄, and Λ∩Λ̃^{Γ(F̄)}=K. The analytic triple has this property. No density of Γ(F) over the imperfect F is assumed.

**Proof route.**

- A σ-commuting automorphism sends Ψ to Ψγ; exact constants imply γ∈GL_r(F), and preserving the solution ring gives γ∈Γ(F).
- For a geometric invariant rational function, use SF.0/jacobson-finite-type after extension to an algebraically closed field: closed points of this finite-type scheme are rational and dense. Reducedness and the torsor identity then equate its two pullbacks on their domain of definition, forcing it to be constant.
- Use relative algebraic closure to descend the intersection with Λ. Do not replace the union-of-fixed-fields hypotheses by a claim about rational points over F.

**Needs:** [`DM.8/difference-torsor`](#dm-8-difference-torsor) (8.28); [`DM.8/difference-smooth-dimension`](#dm-8-difference-smooth-dimension) (8.30); [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13); `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`; `SchemeAndStackFoundations:SF.0/jacobson-finite-type`.

**Sources.**

- [PAP-v2](#source-pap-v2), §4.4.1–4.4.5 pp.27–28; Theorem 4.4.6 p.28: The source identifies algebra-valued group actions with difference automorphisms and computes invariant fields after passing to algebraically closed constants, including the higher-twist constant fields. The packet retains the geometric-point argument and subsequent descent to K; it does not assume that Γ(F) is Zariski dense over the imperfect constant field.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.32](#dm-8-tannakian-identification).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.difference_invariants`.

<a id="dm-8-tannakian-identification"></a>

### 8.32 Identification with the motivic Galois group

**Target** `DrinfeldModulesAndTModules:DM.8/tannakian-identification` (comparison).

For M∈T with chosen Φ and fundamental Ψ, Γ\_Ψ is isomorphic over F_q(t) to Γ\_M=Aut^⊗(ω|⟨M⟩). Every N∈⟨M⟩ has a fundamental matrix over Σ; hence Σ\_R⊗\_F N^B→Σ\_R⊗\_K N is bijective for every F-algebra R. The induced tensor functor⟨M⟩→Rep_F(Γ\_Ψ) is fully faithful, realizes every stable Betti subspace as a submotive, and tensor-generates the representation category. The induced homomorphism is faithfully flat and a closed immersion, hence an isomorphism of group schemes.

**Proof route.**

- Construct the action using Ψ→Ψγ on Σ and the Betti basis Ψ^−1m. Check functoriality on arbitrary F-algebras, not just geometric points.
- For fullness reduce Hom(P, N) to Hom(1, Hom(P, N)); invariant coefficient functions descend to K by difference-invariants.
- For stable subspaces row-reduce defining equations; uniqueness forces their coefficients to be invariant, hence in K. The block matrix gives a rigid-trivial submotive.
- The faithful generator M^B supplies all representations as tensor subquotients. Import MC.6 faithfully-flat and closed-immersion criteria.

**Needs:** [`DM.8/neutral-category`](#dm-8-neutral-category) (8.20); [`DM.8/difference-torsor`](#dm-8-difference-torsor) (8.28); [`DM.8/difference-invariants`](#dm-8-difference-invariants) (8.31); `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tannaka-finiteness-recognition`; `MotivesAndAlgebraicCycles:MC.6`; [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `DrinfeldModulesAndTModules:DM.4`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.5.2 and Theorem 4.5.3 pp.28–29; Propositions 4.5.6–4.5.9 pp.30–31; Theorem 4.5.10 p.32: The source lets the difference group act on Betti realizations over arbitrary constant algebras, proves fullness and realizes stable subspaces as motive subobjects, then identifies ΓΨ with ΓM. The packet imports neutral reconstruction from MC.6 and requests only the remaining tensor-generation/group-map criteria, with the source kernel matrix interpreted in its correct vertical shape.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.38](#dm-8-period-transcendence), [8.43](#dm-8-logarithm-group-linear).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.tannakian_identification`.

### Specialization of algebraic relations

ABP starts from linear relations among the values of an entire solution vector whose difference matrix has determinant c(t − θ)^s. It lifts linear relations, not every polynomial relation at once; the bounded tensor-monomial system linearizes the polynomial relations degree by degree. The arithmetic and analytic estimates are part of the proof chain.

<a id="dm-8-entire-from-equation"></a>

### 8.33 Restricted solutions become entire

**Target** `DrinfeldModulesAndTModules:DM.8/entire-from-equation` (theorem).

If Φ∈Mat_r(k̄\[t]), det Φ(0)≠0, and ψ∈T^r satisfies σ(ψ)=Φψ, then every component of ψ lies in E, including coefficient algebraicity and the finite coefficient-field condition. This requires invertibility at 0; the determinant-only-at θ condition implies it because θ≠0.

**Proof route.**

- Use Lang on Φ(0) to normalize its constant term to 1. The coefficient recursion makes every coefficient algebraic over k.
- On the sufficiently small coefficient tail solve inverse-Frobenius differences by convergent sums of positive twists. The fixed difference is zero because it is strictly small. This bounds the coefficient field over k∞.
- The same recursion, multiplied by arbitrary C^n, bounds C^n||a_n|| for every C>1, giving infinite radius.

**Needs:** [`DM.8/entire-series`](#dm-8-entire-series) (8.10); [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11); `FunctionFieldArithmetic:FA.0`.

**Sources.**

- [ABP-v1](#source-abp-v1), Proposition 3.1.3 pp.9–10: ABP proves that a restricted-series solution of a polynomial inverse-Frobenius equation belongs to its arithmetic entire ring when the matrix is invertible at zero. Its proof first gives algebraic coefficients in a finite extension over k∞, then improves convergence at every radius. The packet keeps these conclusions separate and records the Lang normalization input.
- [PAP-v2](#source-pap-v2), Proposition 5.1.3 p.32: The proposition invokes ABP Proposition 3.1.3: a Tate-algebra solution of a polynomial system invertible at zero is entire. The packet also retains ABP's arithmetic coefficient/finite-field conclusions required for the later lifting theorem.
- [ABP-published](#source-abp-published), Proposition3.1.3 pp.247–248: The published proposition proves the same polynomial-system result with invertibility at zero. Its coefficient recursion and convergence argument give both membership in the arithmetic entire ring and the finite coefficient extension used here.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.38](#dm-8-period-transcendence), [8.40](#dm-8-logarithm-matrices).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.entire_from_equation`.

<a id="dm-8-abp-estimates"></a>

### 8.34 Arithmetic estimates for relation lifting

**Target** `DrinfeldModulesAndTModules:DM.8/abp-estimates` (theorem).

Let k⊂K_0⊂K⊂k̄ with K_0/k finite separable of degree d, K the perfect closure of K_0 inside k̄, and O its integral closure of A=F_q\[θ]. Let size(x) be the maximum of the infinite-place norms of its k-conjugates; use coefficient maxima for matrices and polynomials. Nonzero x∈O satisfies ||x||∞≥size(x)^(1−d). For a nonzero f=Σ a_i z^i∈O\[z], any nonzero root λ of multiplicity ν satisfies ||λ||∞^ν≥(max_i size(a_i))^(−d). For C>1 and 0&lt;r&lt;s, a matrix M∈Mat_{r×s}(O), or M∈Mat_{r×s}(O\[t]), with size(M)&lt;C has a nonzero kernel vector x over the same ring with size(x)&lt;C^(r/(s−r)). The polynomial statement imposes no fixed degree bound on x.

**Proof route.**

- The product of conjugates of an integral element bounds its distinguished norm; perfect-closure extraction transports the estimate. Translate a polynomial by λ and use its first nonzero term for the multiplicity-sensitive Liouville bound.
- Riemann–Roch counts bounded integral elements in O_0 and gives the growth rate of bounded elements in O_0^{q^(−n)}. Pigeonhole produces a small nonzero kernel vector.
- For polynomial matrices write the bounded-degree multiplication map in coefficient bases; increase the source degree until its row/column ratio is close to r/s, then apply the matrix estimate.

**Needs:** `FunctionFieldArithmetic:FA.0`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

**Sources.**

- [ABP-v1](#source-abp-v1), ABP §§3.2–3.3 pp.10–13, especially Lemmas 3.3.3–3.3.6: The arithmetic lemmas bound nonzero integral elements using all conjugates over a finite separable coefficient field, bound nonzero polynomial roots, and find small kernel vectors for r&lt;s. These are norm/size estimates on the integral perfect closure, not degree bounds on a polynomial solution. They feed the auxiliary-function proof with the stated strict dimension and nonzero hypotheses.
- [ABP-published](#source-abp-published), §§3.2–3.3 pp.248–252, especially Lemmas3.3.3–3.3.6: The published arithmetic lemmas agree with the preprint's conjugate-size lower bound, nonzero-root norm bound and small-kernel-vector estimate for r&lt;s in the integral perfect closure. The packet retains the finite separable coefficient field and the strict size hypothesis.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.35](#dm-8-abp-lifting).

**Open input:** [Analytic and dimension supplier matching](#gap-analytic-and-dimension-supplier-matching).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.abp_estimates`.

<a id="dm-8-abp-lifting"></a>

### 8.35 Anderson–Brownawell–Papanikolas lifting

**Target** `DrinfeldModulesAndTModules:DM.8/abp-lifting` (theorem). **Planet:** ABP lifting criterion.

Let Φ∈Mat_r(k̄\[t]) have determinant c(t−θ)^s with c∈k̄^×, s≥0. Let ψ∈E^r satisfy σ(ψ)=Φψ. For every row ρ∈k̄^r with ρψ(θ)=0, there exists a polynomial row P∈k̄\[t]^r such that P ψ=0 as an entire function and P(θ)=ρ. The determinant is nonzero and has no roots apart from θ. The coefficients of P need not be constant or lie in F_q\[t].

**Proof route.**

- For rank 1 propagate a zero along the distinct inverse-Frobenius orbit of θ; bounded-disk analytic zero finiteness forces the entire function to vanish.
- For larger rank clear arithmetic denominators and use the small-kernel estimate to construct bounded-size polynomial rows with a long interval of prescribed orbit zeros. Obtain a bounded-size scalar difference equation for the auxiliary function.
- If the auxiliary function never vanishes identically, its leading coefficient has a uniform lower bound by Liouville; Schwarz–Jensen gives an exponentially decreasing upper bound. Contradiction.
- Twist a vanishing auxiliary row through adjugate matrices. Its nonzero value at θ lies on the specified ρ-line; rescale to make that value exactly ρ.

**Needs:** [`DM.8/entire-series`](#dm-8-entire-series) (8.10); [`DM.8/abp-estimates`](#dm-8-abp-estimates) (8.34); [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

**Sources.**

- [ABP-v1](#source-abp-v1), Theorem 3.1.1 pp.7–8; proof §3.4 pp.13–16: For polynomial Φ with det Φ=c(t−θ)^s and an arithmetic entire solution vector ψ, the criterion lifts every algebraic row relation at θ to a polynomial row relation whose value at θ is prescribed. The full proof builds a small auxiliary relation, controls its zeros and forces it to vanish. The packet retains the special determinant, arithmetic coefficients and entire-vector hypotheses.
- [PAP-v2](#source-pap-v2), Theorem 5.1.1 p.32: This theorem recalls ABP lifting with a polynomial matrix whose determinant is a nonzero scalar times a power of t−θ and an entire solution vector. It supplies the specialization interface; the full proof and arithmetic entire conditions are supplied by ABP.
- [CCM-v2](#source-ccm-v2), Theorem 4.1.1 p.13: The consumer restates ABP lifting for an arithmetic entire solution vector of the special-determinant polynomial equation. This checks the shared criterion used by its later multizeta relation argument, without moving those specialized applications into DM.8.
- [IKLNP-v2](#source-iklnp-v2), Theorem 2.2 p.26: The consumer's Theorem 2.2 uses the same special determinant and arithmetic entire vector to lift a row relation at θ to a polynomial relation. It is another application of the shared lifting criterion, not a stronger universal specialization theorem.
- [ABP-published](#source-abp-published), Theorem3.1.1 pp.245–246; full proof §3.4 pp.252–256: The published criterion and complete auxiliary-function proof retain the preprint's polynomial matrix, special determinant, arithmetic entire vector and prescribed row specialization. The packet's lifting statement matches those hypotheses and conclusion.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.36](#dm-8-specialization-rank).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.abp_lifting`.

<a id="dm-8-specialization-rank"></a>

### 8.36 Specialization preserves relation rank

**Target** `DrinfeldModulesAndTModules:DM.8/specialization-rank` (theorem).

Under ABP hypotheses, the k̄\[t]-rank of the submodule of E generated by the components of ψ equals the k̄-dimension of their specialized span at θ. Equivalently the k̄-dimension of the specialized relation space equals the k̄(t)-dimension of the rational-function relation space. Evaluation of polynomial relation rows is surjective onto all specialized relations.

**Proof route.**

- The polynomial relation kernel is saturated in a finite free module over k̄\[t], because its quotient embeds in the domain E and is torsion-free. Thus it is a direct summand; its basis specializes to independent rows.
- ABP supplies all specialized relations, giving equality of kernel dimensions and then equality of generated-span dimensions.
- The statement is about finite free relation modules; arbitrary specialization of ranks is not claimed.

**Needs:** [`DM.8/abp-lifting`](#dm-8-abp-lifting) (8.35); `mathlib:Module.finrank`; `mathlib:Submodule.span`; [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 5.1.5 pp.32–33: The proposition turns ABP lifting into equality of specialized-span dimension and rational-function rank. Its polynomial relation module is saturated and hence a direct summand over the PID bar(k)\[t], so a relation basis specializes independently; lifting supplies all specialized relations. It does not assert rank preservation for arbitrary polynomial matrices.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.38](#dm-8-period-transcendence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.specialization_rank`.

<a id="dm-8-degree-span"></a>

### 8.37 Bounded monomial spans

**Target** `DrinfeldModulesAndTModules:DM.8/degree-span` (construction).

For a finite family x:I→A in an F-algebra and d≥0, define D_d(x) as the native F-submodule spanned by products∏\_i x_i^{e_i} with e:I→N and Σ\_i e_i≤d. This includes the constant monomial 1. It is the image of the degree-at-most-d multivariate-polynomial subspace under evaluation, is finite-dimensional, and D_d⊆D_{d+1}. For all entries of Ψ, the vector formed by 1 and all columns of tensor powers Ψ^{⊗n}, 1≤n≤d, spans exactly D_d over K; its specialization spans D_d(Ψ(θ)) over k̄.

**Proof route.**

- Use native polynomial evaluation and exponent functions; repetitions among tensor-entry monomials do not change the span.
- The block system is \[1] plus Φ^{⊗n} repeated r^n times, with exactly 1+Σ\_{n=1}^d r^{2n} coordinates. This formula also works for r=1 and rank 0, avoiding the preprint geometric-series division.

**Needs:** `mathlib:Submodule.span`; `mathlib:MvPolynomial.aeval`; [`DM.8/fundamental-matrix`](#dm-8-fundamental-matrix) (8.16).

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 5.2.2 proof p.33: The period proof places 1 and all bounded-degree tensor-entry monomials in one difference system. Their spans are the generator filtration used for transcendence degree. The packet uses 1+Σₙ₌₁ᵈr²ⁿ as its block length, valid also at rank one and rank zero, instead of the source's geometric quotient that is undefined at rank one.

**API.**

- **`TauCeti.Difference.Periods.degreeSpan_zero`** (simp): D_0(x) is the F-span of 1.
- **`TauCeti.Difference.Periods.degreeSpan_mono`** (relation): d≤e implies D_d(x)≤D_e(x).
- **`TauCeti.Difference.Periods.degreeSpan_polynomial`** (compatibility): D_d is the image of degree-at-most-d multivariate polynomials under evaluation.
- **`TauCeti.Difference.Periods.degreeSpan_finite`** (structure): For finite I, D_d is finite-dimensional over F.

**Checks.**

- **`TauCeti.Difference.Periods.test_degree_span_1`** (computation): D_0 contains 1 even for an empty family.
- **`TauCeti.Difference.Periods.test_degree_span_2`** (computation): For the singleton x=0, every D_d is the span of 1.
- **`TauCeti.Difference.Periods.test_degree_span_3`** (non-example): For a transcendental singleton x, 1, x, x² have dimension 3 in D_2; constants or repeated coordinates alone cannot give this dimension.

**Acceptance.**

- D_0 contains 1 even for an empty family.
- For the singleton x=0, every D_d is the span of 1.
- For a transcendental singleton x, 1, x, x² have dimension 3 in D_2; constants or repeated coordinates alone cannot give this dimension.

**Uses.**

- PAP Theorem 5.2.2 proof p.33: ABP applies to the block system of all bounded tensor-entry monomials, so specialization preserves each filtered span dimension.
- DM.8/period-transcendence: The imported degree-growth criterion converts equality of these filtered dimensions into equality of function-field transcendence degrees.

**Used by:** [8.38](#dm-8-period-transcendence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.degreeSpan`.

<a id="dm-8-period-transcendence"></a>

### 8.38 Period transcendence degree and Galois dimension

**Target** `DrinfeldModulesAndTModules:DM.8/period-transcendence` (theorem). **Planet:** Period transcendence degree.

Let M∈T have σ matrix Φ∈Mat_r(k̄\[t])∩GL_r(k̄(t)) with det Φ=c(t−θ)^s, c≠0, s≥0. Let Ψ∈GL_r(T) have entries in E and σΨ=ΦΨ. Then trdeg_{k̄} k̄(Ψ\_ij(θ))=dim_{F_q(t)}Γ\_M. Equivalently this equals trdeg_{k̄(t)}k̄(t)(Ψ\_ij). Polynomial determinant plus rigid triviality ensures an eligible Ψ exists by integral-trivialization and entire-from-equation. The theorem does not apply to a pre-t-motive lacking such a trivialization.

**Proof route.**

- Construct the bounded tensor-monomial block system. Its determinant remains a nonzero constant times a power of t−θ; its entries are entire.
- Specialization-rank equates dim_K D_d(Ψ) and dim_k̄ D_d(Ψ(θ)) for every d. Use the requested SF.0 bounded-generator filtration growth theorem to identify their transcendence degrees, and SF.0/algebraic-scheme-dimension for Krull dimension and field-extension invariance. The dimension theorem alone does not imply the growth comparison.
- Difference-smooth-dimension and tannakian-identification identify this dimension with Γ\_M. No algebraic-independence conclusion for arbitrary matrix entries is inferred merely from a dimension equality.

**Needs:** [`DM.8/degree-span`](#dm-8-degree-span) (8.37); [`DM.8/specialization-rank`](#dm-8-specialization-rank) (8.36); [`DM.8/entire-from-equation`](#dm-8-entire-from-equation) (8.33); [`DM.8/integral-trivialization`](#dm-8-integral-trivialization) (8.18); [`DM.8/tannakian-identification`](#dm-8-tannakian-identification) (8.32); [`DM.8/difference-smooth-dimension`](#dm-8-difference-smooth-dimension) (8.30); `SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension`; `SchemeAndStackFoundations:SF.0`.

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 5.2.2 p.33: The theorem identifies the transcendence degree of the specialized entire trivialization with the motivic Galois-group dimension. ABP preserves every bounded-monomial span, filtered growth compares transcendence degrees, and the difference/Tannakian comparison identifies the group. The packet retains Ψ∈GL_r(T) and the special polynomial determinant; the suggested field equality now also requires determinant invertibility in T.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.42](#dm-8-carlitz-group), [8.44](#dm-8-logarithm-linear-relations), [8.46](#dm-8-carlitz-logarithm-independence).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Open input:** [Analytic and dimension supplier matching](#gap-analytic-and-dimension-supplier-matching).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.period_transcendence`.

### Carlitz logarithms and shared denominator descent

The deformation series L_α is defined for small algebraic α, where the principal Carlitz logarithm converges. Arbitrary logarithms with algebraic exponential reduce to these by division points and the period lattice, and logarithms with exponential zero are handled through the period. The independence hypothesis is over k and the conclusion over k̄. The last target, constant denominators, is the shared input that the multizeta papers import.

<a id="dm-8-carlitz-deformation"></a>

### 8.39 Deformations of small Carlitz logarithms

**Target** `DrinfeldModulesAndTModules:DM.8/carlitz-deformation` (construction).

For α∈k̄ with ||α||&lt;q^(q/(q−1)), define L_α(t)=Σ\_{i≥0} α^(q^i)/∏\_{j=1}^i(t−θ^(q^j)), the empty denominator being 1. It defines a restricted series and converges on ||t||&lt;q^q. It satisfies σ(L_α)=σ(α)+L_α/(t−θ) and L_α(θ)=log_C(α), where log_C is the chosen local inverse supplied by DM.2. L_α itself need not be entire; Ω L_α is entire once its difference system is used.

**Proof route.**

- Each denominator factor has nonzero constant coefficient, so use native formal power-series inversion for its expansion. The norm bound gives coefficientwise and disk convergence of the sum.
- Shift the summation index after inverse twist to prove the functional equation; specialization gives the Carlitz logarithm series from DM.2.

**Needs:** [`DM.8/entire-series`](#dm-8-entire-series) (8.10); [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) (2.8); `FunctionFieldArithmetic:FA.0`.

**Sources.**

- [PAP-v2](#source-pap-v2), §6.1.1 p.34: The source defines the deformed logarithm by its explicit denominator series for a small algebraic α, proves its inverse-twist recurrence and its value log_C(α) at θ, and observes that ΩLα is entire. Lα itself need not be entire. The packet retains the strict convergence bound and the nonzero condition for the nonvanishing assertion.

**API.**

- **`TauCeti.Difference.Periods.carlitzDeformation_zero`** (simp): L_0=0.
- **`TauCeti.Difference.Periods.carlitzDeformation_add`** (relation): L_{α+β}=L_α+L_β whenever all arguments are in the small disk; it is F_q-linear there.
- **`TauCeti.Difference.Periods.carlitzDeformation_twist`** (relation): σ(L_α)=σ(α)+L_α/(t−θ).
- **`TauCeti.Difference.Periods.carlitzDeformation_value`** (compatibility): At θ its convergent sum agrees with log_C(α).

**Checks.**

- **`TauCeti.Difference.Periods.test_carlitz_deformation_1`** (computation): The zero argument produces the zero series.
- **`TauCeti.Difference.Periods.test_carlitz_deformation_2`** (computation): For β in the small disk, L_{−β}=−L_β.
- **`TauCeti.Difference.Periods.test_carlitz_deformation_3`** (non-example): For nonzero α in the small disk, L_α has nonzero constant coefficient; the source excludes zero when using the logarithmic extension.

**Acceptance.**

- The zero argument produces the zero series.
- For β in the small disk, L_{−β}=−L_β.
- For nonzero α in the small disk, L_α has nonzero constant coefficient; the source excludes zero when using the logarithmic extension.

**Uses.**

- PAP §6.1.2 and Proposition 6.1.3 pp.34–35: Its Frobenius equation gives the lower-left logarithm-system entries; multiplication by Omega produces entire entries.
- PAP Theorem 6.3.2 pp.36–37: Evaluation at theta turns the linear torsor equations into relations among the period and the small principal logarithms.

**Used by:** [8.40](#dm-8-logarithm-matrices), [8.44](#dm-8-logarithm-linear-relations).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.carlitzDeformation`.

<a id="dm-8-logarithm-matrices"></a>

### 8.40 The Carlitz logarithm extension matrices

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-matrices` (construction).

For r small algebraic arguments α\_i, use index {0}⊔Fin r and define Φ by Φ\_00=t−θ, Φ\_i0=σ(α\_i)(t−θ), Φ\_ii=1 for i>0, with all remaining entries zero. Define Ψ by Ψ\_00=Ω, Ψ\_i0=Ω L_{α\_i}, Ψ\_ii=1 for i>0 and zeros elsewhere. Then det Φ=t−θ, det Ψ=Ω, σΨ=ΦΨ and Ψ∈GL_{r+1}(T) has entire entries. The represented pre-t-motive X fits 0→C→X→1^r→0 in the column-basis convention.

**Proof route.**

- Construct the matrices by native block constructors and verify their entries, determinant and equation using the Ω and L equations.
- Use entire-from-equation to prove Ω L entries are entire, instead of asserting L itself entire. DM.4 realizes the invertible rational matrix as a pre-t-motive.

**Needs:** [`DM.8/carlitz-deformation`](#dm-8-carlitz-deformation) (8.39); [`DM.8/entire-from-equation`](#dm-8-entire-from-equation) (8.33); [`DM.2/omega`](#dm-2-omega) (2.10); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `DrinfeldModulesAndTModules:DM.4`.

**Sources.**

- [PAP-v2](#source-pap-v2), §6.1.2–Proposition 6.1.3 pp.34–35: The matrices form a lower-triangular Carlitz extension with det Φ=t−θ and det Ψ=Ω; the recurrence proves σΨ=ΦΨ and ΩLα provides entire entries. The sequence is 0→C→X→1^r→0. The packet includes m₀ in the rank-(r+1) basis column, correcting the omitted coordinate in the source notation.

**API.**

- **`TauCeti.Difference.Periods.logPhi_entries`** (simp): Φ has the displayed first column and identity lower-right block.
- **`TauCeti.Difference.Periods.logPsi_entries`** (simp): Ψ has first column (Ω, Ω L_i) and identity lower-right block.
- **`TauCeti.Difference.Periods.logMatrices_det`** (relation): det Φ=t−θ and det Ψ=Ω.
- **`TauCeti.Difference.Periods.logMatrices_equation`** (compatibility): The Ω and L equations imply σΨ=ΦΨ.

**Checks.**

- **`TauCeti.Difference.Periods.test_logarithm_matrices_1`** (computation): With r=0, Φ=t−θ and Ψ=Ω give the Carlitz object.
- **`TauCeti.Difference.Periods.test_logarithm_matrices_2`** (computation): With one zero argument the matrices split as Carlitz plus unit.
- **`TauCeti.Difference.Periods.test_logarithm_matrices_3`** (non-example): Two copies of the same argument give equal off-diagonal entries; this setup cannot certify their linear independence.

**Acceptance.**

- With r=0, Φ=t−θ and Ψ=Ω give the Carlitz object.
- With one zero argument the matrices split as Carlitz plus unit.
- Two copies of the same argument give equal off-diagonal entries; this setup cannot certify their linear independence.

**Uses.**

- PAP Proposition 6.1.3 pp.34–35: The explicit matrix realizes the Carlitz extension; tensoring with Carlitz supplies an effective lattice and proves membership in T.
- PAP §6.2 pp.35–36; Theorem 6.3.2 pp.36–37: The comparison matrix constrains the Galois group, whose linear equations determine the logarithm-span dimension.

**Used by:** [8.41](#dm-8-logarithm-motive-membership).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.logPhi`.

<a id="dm-8-logarithm-motive-membership"></a>

### 8.41 Membership of the logarithm extension in T

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-motive-membership` (theorem).

For the logarithm matrices, X is an object of the chosen category T, not merely of R. Indeed C⊗X is the rationalization of a rigid-trivial dual Anderson motive M over k̄\[t], with σ matrix (t−θ)Φ. It lies in 0→C^{⊗2}→M→C^r→0; it is finite free over k̄\[t] and k̄\[σ], and (t−θ)^n M⊂σ M for n≥2. Since T contains C^∨ and is closed under tensor products, X∈T.

**Proof route.**

- The explicit σ matrix gives the exact sequence and the power-annihilation condition.
- Import DM.4 finite generation and freeness over k̄\[σ] for this lattice, including ABP Proposition 4.3.2; do not manufacture freeness from the polynomial rank alone.
- The fundamental matrix and integral/rational criterion give rigid triviality; tensor with C^∨ yields X.

**Needs:** [`DM.8/logarithm-matrices`](#dm-8-logarithm-matrices) (8.40); [`DM.8/neutral-category`](#dm-8-neutral-category) (8.20); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); [`DM.4/dual-realization`](#dm-4-dual-realization) (4.10); `DrinfeldModulesAndTModules:DM.4`.

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 6.1.3 pp.34–35: The proposition proves that X belongs to the tensor category generated by dual Anderson motives by showing C⊗X is such a motive. It checks polynomial and σ-module finite freeness and the nilpotence condition using the ABP criterion. The packet requires this σ-generation argument; polynomial freeness of X alone would not suffice.
- [ABP-v1](#source-abp-v1), Proposition 4.3.2 p.21: The criterion gives finite freeness over the skew polynomial ring from the polynomial-module structure and the sufficiently strong (t−θ)-nilpotence condition. Papanikolas checks it for C⊗X, supplying the dual Anderson membership needed here.
- [ABP-published](#source-abp-published), Proposition4.3.2 pp.262–263: The published criterion has the same polynomial-module and nilpotence hypotheses and yields skew-polynomial finite freeness. It validates the σ-generation step for C⊗X rather than treating polynomial freeness as motive membership.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.43](#dm-8-logarithm-group-linear).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.logarithm_motive_membership`.

<a id="dm-8-carlitz-group"></a>

### 8.42 The Carlitz motivic Galois group

**Target** `DrinfeldModulesAndTModules:DM.8/carlitz-group` (theorem).

For the Carlitz object C with σ matrix t−θ and fundamental Ω, Hom_T(C(m), C(n)) is F_q(t) for m=n and zero otherwise, and Γ\_C≅G_m over F_q(t). The distinction between weights uses Ω∉C∞(t), which follows from its infinitely many zeros. In particular the Carlitz period π̃=−1/Ω(θ) is transcendental over k̄ by period-transcendence.

**Proof route.**

- The one-dimensional difference equation for Hom(C(m), C(n)) has solutions constant times Ω^{m−n}. A nontrivial power of Ω has infinitely many zeros or poles, so is not rational.
- The generated category is the integer-weight graded finite-dimensional category over F_q(t). Instantiate MC.6/neutral-tannaka-reconstruction and the requested graded-category computation of its group as G_m.
- Apply period-transcendence to the eligible rank-one Carlitz matrix.

**Needs:** [`DM.8/neutral-category`](#dm-8-neutral-category) (8.20); [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13); [`DM.2/omega`](#dm-2-omega) (2.10); [`DM.2/carlitz-period`](#dm-2-carlitz-period) (2.9); `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6`; [`DM.8/period-transcendence`](#dm-8-period-transcendence) (8.38).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.5.3 and Theorem 3.5.4 pp.20–21: The source computes morphisms between Carlitz tensor powers and identifies their generated category with integer-weight graded F_q(t)-vector spaces, giving G_m as the Carlitz group. Ω has infinitely many zeros, and period specialization gives Carlitz-period transcendence. The packet corrects the printed graded coefficient field and imports general reconstruction instead of rebuilding it.
- [ABP-v1](#source-abp-v1), §3.1.2 p.8: The rank-one application specializes the entire Carlitz function and derives transcendence of the Carlitz period from lifting and its infinitely many zeros. This supports the period normalization/transcendence input, not the separate Tannakian graded-category computation.
- [ABP-published](#source-abp-published), §3.1.2 p.246: The published rank-one application gives the same Carlitz-period transcendence argument and Ω specialization. Its role is the analytic transcendence input; the graded-category G_m computation is in Papanikolas.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.43](#dm-8-logarithm-group-linear).

**Open input:** [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.carlitz_group`.

<a id="dm-8-logarithm-group-linear"></a>

### 8.43 The linear Carlitz logarithm kernel

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-group-linear` (theorem).

For the logarithm object X, Γ\_X is a smooth geometrically connected closed subgroup of G={\[\[a, 0], \[v, I_r]]:a invertible}. The projection a gives a faithfully flat homomorphism π:Γ\_X→G_m. Its kernel V is a vector subspace of G_a^r over F_q(t), as a group scheme, and π is smooth. A proof must establish separability of this particular projection before claiming V is smooth. This does not follow for an arbitrary surjective morphism of smooth groups. Consequently if F_1, …, F_s are homogeneous linear forms defining V and γ=(b_0, b)∈Γ\_X(F) with b_0∉F_q, the ideal of Γ\_X is generated by G_i=(b_0−1)F_i(v)−F_i(b)(a−1).

**Proof route.**

- The comparison matrix places Γ\_X in G; the subobject C makes π faithfully flat. Scalar conjugation preserves V.
- Over a perfect closure, verify the particular scalar-action projection is separable. Then V is smooth, its geometric points are stable under all scalars, and their closure is a linear space. Descend its linear ideal. The verification of separability is recorded as an explicit gap rather than treating all smooth group surjections as smooth.
- With V vectorial, additive Hilbert 90 gives a rational γ over F. Its cyclic closure and translation by V generate Γ\_X, providing the linear G_i equations.

**Needs:** [`DM.8/logarithm-motive-membership`](#dm-8-logarithm-motive-membership) (8.41); [`DM.8/carlitz-group`](#dm-8-carlitz-group) (8.42); [`DM.8/tannakian-identification`](#dm-8-tannakian-identification) (8.32); [`DM.8/difference-smooth-dimension`](#dm-8-difference-smooth-dimension) (8.30); `SchemeAndStackFoundations:SF.1/torsor`; `SchemeAndStackFoundations:SF.1`.

**Sources.**

- [PAP-v2](#source-pap-v2), §6.2.1–6.2.4 and Propositions 6.2.3, 6.2.5 pp.35–36: The source analyzes the scalar-triangular group of the logarithm motive and proves its kernel is linear before constructing a rational lift and a dense cyclic subgroup. The packet limits this to that particular group: it retains the open separability/Lie-surjectivity verification and uses vector-group torsor splitting only after the kernel is proved vectorial.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.44](#dm-8-logarithm-linear-relations).

**Open input:** [Particular Carlitz kernel separability](#gap-particular-carlitz-kernel-separability).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.logarithm_group_linear`.

<a id="dm-8-logarithm-linear-relations"></a>

### 8.44 Linear relations and logarithm group dimension

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-linear-relations` (theorem).

Let N be the k=F_q(θ)-linear span of π̃, log_C(α\_1), …, log_C(α\_r) for small algebraic arguments. Then dim_F Γ\_X=dim_k N. More precisely each linear form F=Σ c_i v_i defining V and γ=(b_0, b_i) as above yields (b_0(θ)−1)Σ c_i(θ)log_C(α\_i)−Σ c_i(θ)b_i(θ)π̃=0, and these span all k-linear relations. Evaluation F_q(t)→F_q(θ) is denominator-safe since θ is transcendental over F_q; the auxiliary rational torsor coefficient is separately proved regular at θ.

**Proof route.**

- The linear G_i equations translate to torsor equations H_i=G_i−f_i a. A σ equation propagates any putative pole of f_i at θ along an infinite twist orbit; hence f_i and its twist are regular there.
- Divide the torsor equation by Ω and evaluate using π̃=−1/Ω(θ). Independent linear forms provide r+1−dim Γ\_X independent k-linear relations.
- Conversely trdeg≤linear-span dimension, while period-transcendence gives this trdeg=dim Γ\_X. Equality proves completeness of the relations.

**Needs:** [`DM.8/logarithm-group-linear`](#dm-8-logarithm-group-linear) (8.43); [`DM.8/period-transcendence`](#dm-8-period-transcendence) (8.38); [`DM.8/carlitz-deformation`](#dm-8-carlitz-deformation) (8.39); [`DM.2/omega`](#dm-2-omega) (2.10); [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) (2.8).

**Sources.**

- [PAP-v2](#source-pap-v2), §6.3.1 and Theorem 6.3.2 pp.36–37: The theorem identifies the logarithm-group dimension with the k-linear span dimension of the Carlitz period and small logarithms. Constant rational-function relations are evaluated at θ after denominator descent, and pole propagation controls rational coefficients in the converse direction. The packet keeps k-linearity distinct from bar(k)-algebraic independence.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.46](#dm-8-carlitz-logarithm-independence).

**Open input:** [Particular Carlitz kernel separability](#gap-particular-carlitz-kernel-separability).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.logarithm_linear_relations`.

<a id="dm-8-logarithm-division"></a>

### 8.45 Reduction to small algebraic logarithms

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-division` (theorem).

For λ∈C∞ with exp_C(λ)∈k̄^×, there exist n≥0, α∈k̄^× with ||α||&lt;q^(q/(q−1)), and f∈F_q\[θ] such that λ=θ^n log_C(α)+f π̃. If exp_C(λ)=0, λ itself lies in F_q\[θ]π̃. Thus any finite family of logarithms with algebraic exponentials is contained in the k-linear span of π̃ and finitely many small principal algebraic logarithms.

**Proof route.**

- If the exponential is already small, take it as α and n=0; otherwise solve θ x+x^q=β repeatedly in k̄. Newton polygon bounds shrink division points until the local inverse applies.
- Carlitz equivariance gives exp_C(θ^n log_C(α))=exp_C(λ); the kernel period lattice gives f π̃.
- Handle exp_C(λ)=0 separately; the printed nonzero-exponential lemma alone cannot cover such λ.

**Needs:** [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) (2.8); [`DM.2/carlitz-period`](#dm-2-carlitz-period) (2.9); `FunctionFieldArithmetic:FA.0`.

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 6.4.1 pp.37–38; §1.2 pp.3–4: For an arbitrary logarithm with nonzero algebraic exponential, the lemma divides by a large power of θ until the principal logarithm is small and expresses the remaining ambiguity as a k-multiple of the Carlitz period. The packet treats zero exponentials separately by the period kernel, because the division lemma does not cover them.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.46](#dm-8-carlitz-logarithm-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.logarithm_division`.

<a id="dm-8-carlitz-logarithm-independence"></a>

### 8.46 Algebraic independence of Carlitz logarithms

**Target** `DrinfeldModulesAndTModules:DM.8/carlitz-logarithm-independence` (theorem). **Planet:** Carlitz logarithm independence.

Let λ\_1, …, λ\_r∈C∞ with exp_C(λ\_i)∈k̄ for all i. If this family is linearly independent over k=F_q(θ), it is algebraically independent over k̄. The linear field is k, not k̄. There is no fixed choice of principal branch for arbitrary λ\_i. A nonzero period with exponential zero is eligible. The result is only for Carlitz logarithms, not for all higher-rank Drinfeld modules.

**Proof route.**

- Reduce to a finite-dimensional k-space N generated by the period and small principal logarithms. The previous two theorems give trdeg_{k̄}k̄(N)=dim_k N.
- Choose a k-basis of N; its size equals the transcendence degree, so it is algebraically independent over k̄. Extend the given independent family to such a basis using an invertible k-linear change of coordinates.
- Discarding extra basis vectors preserves algebraic independence. This argument handles zero-exponential periods and avoids an incorrect nonzero-only reduction.

**Needs:** [`DM.8/logarithm-division`](#dm-8-logarithm-division) (8.45); [`DM.8/logarithm-linear-relations`](#dm-8-logarithm-linear-relations) (8.44); [`DM.8/period-transcendence`](#dm-8-period-transcendence) (8.38); `mathlib:AlgebraicIndependent`; `mathlib:Algebra.trdeg`; `FunctionFieldArithmetic:FA.0`.

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 6.4.2 p.38; Theorem 1.2.6 p.4: The theorem deduces bar(k)-algebraic independence of k-independent Carlitz logarithms with algebraic exponentials by reducing to a basis of the span containing the period and principal logarithms. The packet explicitly supplies the zero-exponential period case missing from the cited division step and uses basis extension rather than assuming the chosen logarithms span the whole space.

**Acceptance.**

- A single nonzero Carlitz logarithm with algebraic exponential is transcendental, including π̃.
- The pair(λ, λ) fails the linearity hypothesis and has polynomial relation X_1−X_2.
- An invertible pre-t-motive with no analytic trivialization cannot be used to assert period independence.

**Open input:** [Particular Carlitz kernel separability](#gap-particular-carlitz-kernel-separability).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.carlitz_logarithm_independence`.

<a id="dm-8-constant-denominator"></a>

### 8.47 Frobenius-invariant common denominators

**Target** `DrinfeldModulesAndTModules:DM.8/constant-denominator` (theorem).

Let Φ\_i∈Mat_{r_i}(k̄\[t]) have det Φ\_i=c_i(t−θ)^{s_i}, c_i≠0, s_i≥0, i=1, 2. If B∈Mat_{r_1×r_2}(k̄(t)) satisfies σ(B)Φ\_2=Φ\_1B, its monic least common denominator belongs to F_q\[t]. Thus a nonzero polynomial over F_q clears all entries. The matrix B is rational; the polynomial domain printed in CPY Proposition 2.2.1 is corrected in source issue E-DM8-8, reusing PAPER-NGODAC-21/E10.

**Proof route.**

- The denominator of σ(B) divides den(B)(t−θ)^{s_2}. If it has a pole at θ, repeated Frobenius shifts force infinitely many distinct poles, using both determinant conditions.
- Therefore the monic denominator is σ-fixed and lies in F_q\[t]. This also proves rationalized Hom compatibility for DM.4 without redefining the motives.

**Needs:** [`DM.8/coefficient-twist`](#dm-8-coefficient-twist) (2.1); [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13); [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) (4.8); `mathlib:RatFunc`.

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.4.5 pp.18–19: The proposition shows that the monic least common denominator of a rational motive morphism is fixed by inverse Frobenius and hence lies in F_q\[t], using both polynomial matrices with determinant supported at θ. The packet keeps rational matrix entries before clearing denominators; the result does not claim every rationalized morphism is polynomial.
- [CPY-v2](#source-cpy-v2), Proposition 2.2.1 p.6: The proof transports a morphism between rationalized motives to a constant matrix using their fundamental solutions, then uses determinant support to force its monic denominator into F_q\[t]. The printed polynomial type for the starting matrix is corrected to rational entries, as confirmed by the 1/t identity example.
- [CCM-v2](#source-ccm-v2), Lemma 5.1.1 proof p.24: In the auxiliary block argument, constant solution coordinates and a rational basis change lead to denominator descent over F_q\[t]. This is a concrete consumer of the shared rational-matrix lemma, not a claim that the starting morphism has polynomial entries.

**Acceptance.** Check every field, scalar extension and twist convention in the statement.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`, declaration `TauCeti.Difference.Periods.constant_denominator`.

<a id="assembly-reconciliation"></a>

## Assembly reconciliation

The roadmap was planned in two parts: DM.0–DM.7 in one packet and DM.8 in another, each reviewed and accepted on its own. Joining them changed the following, and nothing else.

- **The coefficient Frobenius twist moved to DM.2.** `DM.8/coefficient-twist` was a DM.8 target, but DM.2's Ω and DM.4's dual motives use it, so DM.2 and DM.4 depended on DM.8 while DM.8 depended on both. Its layer is now DM.2; its id, statement, API and tests are unchanged. The layer graph is acyclic.
- **DM.8's layer-level citations of DM.2 and DM.4 became target citations.** DM.8 had cited the stages DM.2 and DM.4, with requests to them, because the DM.0–DM.7 plan did not yet exist. The table below gives the replacements. The request to DM.2 is fully answered by DM.2 targets. The request to DM.4 is answered for dual t-motives, the τ–σ dictionary and the abelian image; the rational category of pre-t-motives is not yet a DM.4 target, so the affected DM.8 targets keep DM.4 as a layer-level prerequisite and the gap [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4) records exactly what is missing.
- **The Carlitz logarithm got its disk.** DM.8 needs log_C(α) and exp_C(log_C(α)) = α for every algebraic α with |α| < q^(q/(q−1)). The DM.2 target `DM.2/carlitz-exponential` now carries this as the API item `carlitzExp_carlitzLog`, with Papanikolas §1.2.2, p. 4, as its source; the suggested file states it.
- **A promised comparison is recorded as remaining work.** `DM.4/uniformizability` defines the exponential and uniformizability of an abelian t-module and says that DM.8 identifies uniformizability with rigid analytic triviality. That is Anderson's theorem (BP-RAPID Theorem 4.2, p. 16; on the dual side Papanikolas §1.1.4, p. 2), and no DM.8 target states it. No target cites it either, since DM.8's period theorems assume rigid triviality directly, so it is not a gap; it is listed under DM.8 in [Remaining work by layer](#remaining-work-by-layer), to be planned with the pre-t-motive category.
- **Current upstream owners are recorded.** RestrictedPowerSeries and NewtonPolygons are on TauCetiRoadmap main (350e970ce) but not in the atlas snapshot. They now own the Weierstrass, entire-series and zero-count inputs that DM.2, DM.4 and DM.8 request from AdicSpaces Layer 0; both packets list them under upstream imports, and the AdicSpaces layer stays the recorded prerequisite until the atlas registers them.

| DM.8 target | Cited layers | Now cites |
| --- | --- | --- |
| [`DM.8/entire-series`](#dm-8-entire-series) | DM.2 | [`DM.2/c-infinity`](#dm-2-c-infinity) |
| [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) | DM.2 | [`DM.2/c-infinity`](#dm-2-c-infinity) |
| [`DM.8/analytic-separability`](#dm-8-analytic-separability) | DM.2 | [`DM.2/c-infinity`](#dm-2-c-infinity) |
| [`DM.8/integral-trivialization`](#dm-8-integral-trivialization) | DM.2, DM.4 | [`DM.2/omega`](#dm-2-omega), [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), layer DM.4 for pre-t-motives |
| [`DM.8/carlitz-deformation`](#dm-8-carlitz-deformation) | DM.2 | [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) |
| [`DM.8/logarithm-matrices`](#dm-8-logarithm-matrices) | DM.2, DM.4 | [`DM.2/omega`](#dm-2-omega), [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), layer DM.4 for pre-t-motives |
| [`DM.8/carlitz-group`](#dm-8-carlitz-group) | DM.2 | [`DM.2/omega`](#dm-2-omega), [`DM.2/carlitz-period`](#dm-2-carlitz-period) |
| [`DM.8/logarithm-linear-relations`](#dm-8-logarithm-linear-relations) | DM.2 | [`DM.2/omega`](#dm-2-omega), [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential) |
| [`DM.8/logarithm-division`](#dm-8-logarithm-division) | DM.2 | [`DM.2/carlitz-exponential`](#dm-2-carlitz-exponential), [`DM.2/carlitz-period`](#dm-2-carlitz-period) |
| [`DM.8/rigid-triviality`](#dm-8-rigid-triviality) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), [`DM.4/star-adapter`](#dm-4-star-adapter), layer DM.4 for pre-t-motives |
| [`DM.8/fundamental-betti-basis`](#dm-8-fundamental-betti-basis) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), layer DM.4 for pre-t-motives |
| [`DM.8/betti-exact-tensor`](#dm-8-betti-exact-tensor) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), layer DM.4 for pre-t-motives |
| [`DM.8/neutral-category`](#dm-8-neutral-category) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), [`DM.4/dual-realization`](#dm-4-dual-realization), layer DM.4 for pre-t-motives |
| [`DM.8/tannakian-identification`](#dm-8-tannakian-identification) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), layer DM.4 for pre-t-motives |
| [`DM.8/specialization-rank`](#dm-8-specialization-rank) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) |
| [`DM.8/logarithm-motive-membership`](#dm-8-logarithm-motive-membership) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive), [`DM.4/dual-realization`](#dm-4-dual-realization), layer DM.4 for pre-t-motives |
| [`DM.8/constant-denominator`](#dm-8-constant-denominator) | DM.4 | [`DM.4/inverse-twist-dual-motive`](#dm-4-inverse-twist-dual-motive) |

<a id="supplier-contracts"></a>

## Supplier contracts

These are the interfaces this roadmap requests from other roadmaps, with the targets that consume them. Where the supplier already plans part of a need, the request says which part it reuses and which it requires in addition; nothing here is planned twice.

### `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`

Use the existing AdicSpaces Tate-algebra and restricted-series targets, together with Mathlib PowerSeries.IsRestricted.subring. Supply the nonarchimedean Weierstrass/Newton-polygon and normalized infinite-product arguments needed for lattice exponentials and Ω. This is an analytic extension contract, not a new Tate-algebra definition.

Consumers: [`DM.2/lattice-exponential`](#dm-2-lattice-exponential) (2.4), [`DM.2/omega`](#dm-2-omega) (2.10), [`DM.4/uniformizability`](#dm-4-uniformizability) (4.6).

Supply only the C∞ comparison and estimates beyond current Tau Ceti: normalized one-variable zero/pole factorization over complete algebraically closed rank-one C∞ and zero-count/growth (Schwarz–Jensen) for an entire function on a bounded disk. Reuse the native restricted-series carrier and current TauCeti.PowerSeries Weierstrass preparation, its uniqueness and unit criterion, and isPrincipalIdealRing_isRestricted_subring; generic preparation and the principal-ideal result are already implemented at a91d3aa, not additional requested milestones.

Consumers: [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11), [`DM.8/abp-lifting`](#dm-8-abp-lifting) (8.35).

### `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`

Import the shared Fitting-ideal presentation and base-change theory already in current Tau Ceti (a91d3aaf), as used by StableReduction and IntegralHeckeAndGaloisDeterminants. At the older pinned build these declarations are absent. DM.6 adds only the characteristic-polynomial/monic-generator comparison for finite F\[t]-modules, and must not re-plan the generic Fitting ideal.

Consumers: [`DM.6/fitting-polynomial`](#dm-6-fitting-polynomial) (6.1).

### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`

Consume finite normalization over F\[t], the Dedekind affine/holomorphy-ring bridge, and place/prime/residue equivalences. Apply the RR choice of a nonconstant function with only an infinity pole to identify A=Γ(C−∞,O_C), finite quotients and finite integral extensions; do not re-plan these in FA.1.

Consumers: [`DM.0/rank-general`](#dm-0-rank-general) (0.3), [`DM.1/finite-flat-torsion`](#dm-1-finite-flat-torsion) (1.2), [`DM.2/a-lattice`](#dm-2-a-lattice) (2.3), [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2), [`DM.4/dual-realization`](#dm-4-dual-realization) (4.10), [`DM.6/integral-model`](#dm-6-integral-model) (6.2).

### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`

Consume divisors, L(D), divisor/fractional-ideal comparison and normalized residue-degree degree formulas. In particular deg_A(a)=−deg(∞)ord_∞(a).

Consumers: [`DM.0/rank-general`](#dm-0-rank-general) (0.3), [`DM.1/finite-flat-torsion`](#dm-1-finite-flat-torsion) (1.2), [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3).

### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`

Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.

Consumers: [`DM.0/rank-general`](#dm-0-rank-general) (0.3), [`DM.1/tate-module`](#dm-1-tate-module) (1.5), [`DM.2/c-infinity`](#dm-2-c-infinity) (2.2), [`DM.2/uniformization`](#dm-2-uniformization) (2.6), [`DM.4/purity`](#dm-4-purity) (4.5), [`DM.4/dual-realization`](#dm-4-dual-realization) (4.10), [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1), [`DM.5/local-algebraization`](#dm-5-local-algebraization) (5.4), [`DM.5/period-ring`](#dm-5-period-ring) (5.5), [`DM.6/integral-model`](#dm-6-integral-model) (6.2), [`DM.6/unit-lattice`](#dm-6-unit-lattice) (6.4), [`DM.6/lattice-covolume`](#dm-6-lattice-covolume) (6.6).

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`

Consume line bundles, divisor twists and their degree on smooth proper curves; use the current divisor-to-invertible-sheaf interface in the infinity chain.

Consumers: [`DM.7/elliptic-sheaf`](#dm-7-elliptic-sheaf) (7.1), [`DM.7/normalized-elliptic-sheaf`](#dm-7-normalized-elliptic-sheaf) (7.2), [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3).

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`

Consume curve Riemann–Roch, Serre duality and H^0=L(D) comparisons for smooth proper geometrically connected curves.

Consumers: [`DM.7/normalized-elliptic-sheaf`](#dm-7-normalized-elliptic-sheaf) (7.2), [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3).

Use the current roadmap Riemann–Roch targets for smooth projective curves: sufficiently large divisors above infinity give finite-dimensional function spaces containing field generators; the arithmetic version gives bounded integral-element counts used by ABP. Supply the compatibility with the coefficient Frobenius transport through the FA.0 curve interface.

Consumers: [`DM.8/relative-algebraic-closure`](#dm-8-relative-algebraic-closure) (8.29), [`DM.8/abp-estimates`](#dm-8-abp-estimates) (8.34).

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`

Consume proper flat finitely presented coherent cohomology/base change and semicontinuity under their actual hypotheses, to prove the normalized elliptic-chain pushforward line and cohomology statements.

Consumers: [`DM.7/normalized-elliptic-sheaf`](#dm-7-normalized-elliptic-sheaf) (7.2), [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3).

### `MotivesAndAlgebraicCycles:MC.6`

Reuse the existing arbitrary-field MC.6/neutral-tannaka-reconstruction and tannaka-finiteness-recognition nodes, and tensor-iso-torsor after transporting along reconstruction. The remaining exports are: formation of the strictly full tensor subcategory generated by a family; for a compatible exact tensor functor between neutral categories, full faithfulness plus closure of its image under subobjects iff the induced group map is faithfully flat, and tensor generation of the target iff it is a closed immersion; and the computation of the tensor-automorphism group of integer-weight graded finite-dimensional F-vector spaces as G_m. State these over any field F, including imperfect F_q(t). The existing diagram-specific pro-algebraic-approximation and characteristic-zero connectedness criterion are insufficient for these remaining uses. Do not reconstruct an already planned neutral group again.

Consumers: [`DM.8/neutral-category`](#dm-8-neutral-category) (8.20), [`DM.8/tannakian-identification`](#dm-8-tannakian-identification) (8.32), [`DM.8/carlitz-group`](#dm-8-carlitz-group) (8.42).

### `FunctionFieldArithmetic:FA.0`

Supply the chosen rational function field F_q(θ), exact constant field and its infinite-place normalization, and the smooth projective curve corresponding to a finite separable extension of the one-variable field over the perfect constant field bar(k). Export compatibility of the field/curve correspondence with the coefficient Frobenius automorphism, as needed in Papanikolas Proposition 4.3.3. Keep the analytic completion at DM.2 and the difference-field constant calculation at DM.8. For arbitrary field extensions, supply the equivalence of separability with native geometric reducedness and the characteristic-p p-basis/linear-disjointness criterion. Algebra.IsSeparable is algebraic separability and must not replace this general extension property. Import current TauCetiRoadmap ReductiveGroupsPartII RG2.3.7 Lang.lang_surjective and export its semilinear GL_r matrix specialization; the general Lang theorem is already owned upstream. The current Lang.lang_surjective Lean signature is on AlgebraicClosure F for finite F. Before applying it to a matrix with entries in bar(k), export surjectivity of the Lang morphism after base extension to that larger algebraically closed field and derive the inverse-Frobenius GL_r matrix normalization there. Its entries need not be algebraic over F_q.

Consumers: [`DM.8/twisting-limit`](#dm-8-twisting-limit) (8.12), [`DM.8/analytic-fixed-fields`](#dm-8-analytic-fixed-fields) (8.13), [`DM.8/analytic-separability`](#dm-8-analytic-separability) (8.14), [`DM.8/relative-algebraic-closure`](#dm-8-relative-algebraic-closure) (8.29), [`DM.8/entire-from-equation`](#dm-8-entire-from-equation) (8.33), [`DM.8/abp-estimates`](#dm-8-abp-estimates) (8.34), [`DM.8/carlitz-deformation`](#dm-8-carlitz-deformation) (8.39), [`DM.8/logarithm-division`](#dm-8-logarithm-division) (8.45), [`DM.8/carlitz-logarithm-independence`](#dm-8-carlitz-logarithm-independence) (8.46).

### `SchemeAndStackFoundations:SF.3`

Reuse SF.3/line-bundle-degree-bounds, which imports JacobianChallenge Riemann–Roch: on a smooth projective geometrically connected curve over bar(k), a sufficiently large effective divisor above infinity gives finite-dimensional L(D) containing any chosen finite set of field generators. The additional export is functorial transport of the curve, divisor and section space by the coefficient automorphism for Papanikolas Proposition 4.3.3. Generic Riemann–Roch remains with AlgebraicCurves/JacobianChallenge.

Consumers: [`DM.8/relative-algebraic-closure`](#dm-8-relative-algebraic-closure) (8.29).

### `SchemeAndStackFoundations:SF.1`

Reuse SF.1/affine-fpqc-descent and SF.1/torsor for affine group diagrams, torsor isomorphisms and smoothness descent. The remaining export needed for the logarithm-group rational lift is: every fpqc torsor under the vector group G_a^r over any field F has an F-rational point (additive Hilbert 90, or faithfully flat descent for quasi-coherent modules). Apply only after the particular kernel is proved to be a vector group; this is not a splitting assertion for arbitrary unipotent groups over an imperfect field.

Consumers: [`DM.8/logarithm-group-linear`](#dm-8-logarithm-group-linear) (8.43).

### `SchemeAndStackFoundations:SF.0`

Reuse SF.0/algebraic-scheme-dimension for finite-type domain dimension versus fraction-field transcendence degree and invariance under field extension. Supply the remaining filtered growth form: for a finitely generated domain A=k\[a_1,...,a_n], with A_≤d the k-span of generator monomials of total degree at most d, dim_k A_≤d is eventually a polynomial in d of degree trdeg_k Frac(A), with positive leading coefficient; include A=k, whose polynomial is the constant 1. Thus equality of these dimensions for all d implies equality of transcendence degrees even when the coefficient fields differ. This generic commutative-algebra dimension interface belongs with SF.0, not the SF.1 descent layer. It does not require extending the motives or moduli roadmaps.

Consumers: [`DM.8/period-transcendence`](#dm-8-period-transcendence) (8.38).

## Imports from current upstream roadmaps

TauCetiRoadmap main has roadmaps that postdate the atlas snapshot. Where they already own an input, this roadmap imports it rather than planning it; the atlas cannot yet cite them as prerequisites, so they are recorded here and in the packets' upstream imports.

- **[AlgebraicVectorBundles, l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves)** (commit `070dc2bec`): Consume finite locally free sheaves, locally constant rank, rank-one invertible sheaves, tensor/dual/pullback and the affine finite-projective equivalence from current main; no duplicate sheaf foundations in SF.0. Used by: [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9), [`DM.3/generalized-drinfeld-module`](#dm-3-generalized-drinfeld-module) (3.4), [`DM.3/modular-forms`](#dm-3-modular-forms) (3.7), [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2), [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3), [`DM.7/elliptic-sheaf`](#dm-7-elliptic-sheaf) (7.1), [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3), [`DM.7/shtuka-export`](#dm-7-shtuka-export) (7.5).
- **[AlgebraicVectorBundles, l2b--geometric-vector-bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/AlgebraicVectorBundles/README.md#l2b--geometric-vector-bundles)** (commit `070dc2bec`): Consume totalSpace(E)=linearSpec(E∨), its section-valued universal property and its vector-bundle/pullback compatibility. Retain the dual convention when identifying line-bundle sections with additive-group points. Used by: [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9), [`DM.3/generalized-drinfeld-module`](#dm-3-generalized-drinfeld-module) (3.4), [`DM.4/t-module`](#dm-4-t-module) (4.1), [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3).
- **[RestrictedPowerSeries, layer-4-weierstrass-theory-over-banach-rings](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RestrictedPowerSeries/README.md#layer-4-weierstrass-theory-over-banach-rings)** (commit `350e970ce`): Gauss norms at every positive radius (Layer 1), Weierstrass division and preparation with uniqueness (§§4.2–4.3), and the entire-series subring with evaluation and division by a polynomial (§7.2), all on native PowerSeries. These are the restricted-series inputs the lattice exponential, Ω and the t-module exponential need; they are imported, not planned here. Used by: [`DM.2/lattice-exponential`](#dm-2-lattice-exponential) (2.4), [`DM.2/omega`](#dm-2-omega) (2.10), [`DM.4/uniformizability`](#dm-4-uniformizability) (4.6).
- **[NewtonPolygons, layer-5-convergence-and-entire-products](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/NewtonPolygons/README.md#layer-5-convergence-and-entire-products)** (commit `350e970ce`): Exact zero counts in closed discs (§4.3) and entire factorisation (§5.3): an entire series over a complete algebraically closed field is the product of (1−X/α) over its nonzero zeros, a locally finite family defines an entire product with exactly that zero divisor, and entire units are the nonzero constants; with the product formula, a nonconstant entire series takes every value. This supplies the product formula and surjectivity of e_Λ and the zeros of Ω; the general-A kernel rank remains the recorded gap. Used by: [`DM.2/lattice-exponential`](#dm-2-lattice-exponential) (2.4), [`DM.2/uniformization`](#dm-2-uniformization) (2.6), [`DM.2/omega`](#dm-2-omega) (2.10).
- **[RestrictedPowerSeries, layer-7-open-disc-entire-and-overconvergent-series](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RestrictedPowerSeries/README.md#layer-7-open-disc-entire-and-overconvergent-series)** (commit `350e970ce`): The entire-series subring of native PowerSeries, its evaluation homomorphism and division by polynomials (§7.2), and the unit-radius Tate algebra with Weierstrass preparation (§4.3), distinguished coordinates and unique factorisation (§§5.1–5.2). E is the subring of these entire series whose coefficients are algebraic over k and generate a finite extension of k∞; T is the radius-one restricted algebra. Used by: [`DM.8/entire-series`](#dm-8-entire-series) (8.10), [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11), [`DM.8/entire-from-equation`](#dm-8-entire-from-equation) (8.33).
- **[NewtonPolygons, layer-4-disc-factors-slope-factors-and-analytic-zeros](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/NewtonPolygons/README.md#layer-4-disc-factors-slope-factors-and-analytic-zeros)** (commit `350e970ce`): Gauss norms as supporting values of the Newton polygon (§2.2), disc factors and exact zero counts with multiplicity in closed discs (§§4.1–4.3), and entire products with the polynomial criterion for entire functions with finitely many zeros (§5.3). These give the finite zero divisor on the unit disk, the bounded-disk zero finiteness and zero-count growth bound used in the ABP lifting, and Ω∉C∞(t). Used by: [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11), [`DM.8/abp-lifting`](#dm-8-abp-lifting) (8.35), [`DM.8/carlitz-group`](#dm-8-carlitz-group) (8.42).

<a id="gaps-and-open-inputs"></a>

## Gaps and open inputs

Every layer is planned: each target is a node whose prerequisites end in the libraries, in other roadmaps or in one of the inputs below. No layer is closed. The gaps name the exact missing input and the targets that need it.

<a id="gap-general-rank-integrality"></a>

### General rank integrality

Establish that a non-scalar field Drinfeld action has integral positive proportionality factor deg_τ φ\_a/deg_A(a). The displayed valuation proportionality alone gives a rational number. Use the finite projective A_L-module route of Hartl Theorem 3.9, or inspect a full direct integrality proof, without assuming the rank definition as its proof.

Needed by: [`DM.0/rank-general`](#dm-0-rank-general) (0.3), [`DM.0/rank`](#dm-0-rank) (0.4).

<a id="gap-nilpotent-base-standardization"></a>

### Nilpotent-base standardization

Hartl Lemma 3.8(a), p. 10, cites Drinfeld and Matignon for the unique normalized nonlinear Ore conjugation. Inspect that proof or give the finite nilpotent-induction argument. The current pass establishes the exact statement and its distinction from linear frame change.

Needed by: [`DM.0/relative-standardization`](#dm-0-relative-standardization) (0.10).

<a id="gap-analytic-surjectivity-and-general-a-kernel-rank"></a>

### Analytic surjectivity and general-A kernel rank

The BP survey states Theorem 2.1 but does not provide the complete nonarchimedean zero/surjectivity and general-A projective kernel-rank proof. The requested AdicSpaces analytic input and a full uniformization proof must discharge these steps. Finite-subspace products, normalization and the exponential recurrence are specified.

Needed by: [`DM.2/lattice-exponential`](#dm-2-lattice-exponential) (2.4), [`DM.2/uniformization`](#dm-2-uniformization) (2.6).

<a id="gap-reciprocal-ring-normality-proof-input"></a>

### Reciprocal-ring normality proof input

Hartl–Yu Proposition 3.11 imports Pink–Schieder Theorems 1.9 and 1.11 for the normality of the reciprocal Proj seed. Inspect those proofs or establish the stated normality in the supplier. The arithmetic extension/gluing and finite-quotient route of Hartl–Yu Theorem 3.2 has been read.

Needed by: [`DM.3/reciprocal-compactification`](#dm-3-reciprocal-compactification) (3.6), [`DM.3/satake-compactification`](#dm-3-satake-compactification) (3.5), [`DM.3/integral-compactification`](#dm-3-integral-compactification) (3.9).

<a id="gap-integral-tate-image-saturation"></a>

### Integral Tate image saturation

Stalder Proposition 5.16(a), preprint p. 34 and published p. 588, asserts saturation as known. Supply the exact integral argument: λ-divisibility of a realized Hom map descends to divisibility in Hom_A(E,F), using finite-shtuka torsion and the quotient isogeny; retain nonprincipal λ. Rational full faithfulness is proved by the inspected period-ring route.

Needed by: [`DM.5/tate-injectivity`](#dm-5-tate-injectivity) (5.3), [`DM.5/tate-image-saturation`](#dm-5-tate-image-saturation) (5.6), [`DM.5/tate-surjectivity`](#dm-5-tate-surjectivity) (5.7).

<a id="gap-drinfeld-semisimple-motive-input"></a>

### Drinfeld semisimple-motive input

Stalder Theorem 1.1 assumes a semisimple A-isomotive. Prove that the rational motive of a field Drinfeld module is simple, or inspect the precise reference supplying it, before deducing unconditional semisimplicity of its point Tate representation.

Needed by: [`DM.5/tate-semisimplicity`](#dm-5-tate-semisimplicity) (5.8).

<a id="gap-elliptic-chain-morphism-category"></a>

### Elliptic-chain morphism category

Wiedmann Theorem 5.10 and proof use an equivalence convention with affine-module morphisms. Reconcile it fully with the bounded-shift chain morphisms and the contravariant Hom(E,G_a) convention stated here. The object construction, infinity projectivity/gluing, normalized cohomology and inverse line have been read. At a non-rational infinity point, verify the residue-factor/descent normalization of each length-one quotient in the degree filtration, including how Frobenius permutes the factors, before claiming the unrestricted relative correspondence. The period rδ and the pushforward-to-S line condition are explicit, rather than replacing infinity by a rational leg.

Needed by: [`DM.7/elliptic-antiequivalence`](#dm-7-elliptic-antiequivalence) (7.4).

<a id="gap-native-geometric-and-analytic-signature-integration"></a>

### Native geometric and analytic signature integration

The Suggested file distinguishes elaborated native signatures, coordinate restrictions and exact omissions under the packet names. The full relative line-bundle action, absolute-Galois continuity, characteristic local objects, scheme-level frames, moduli/Satake/forms/Hecke, general-A motives, rational period rings, global-product Taelman convergence and trace/tangent quotient constructions, and normalized elliptic-chain support/cohomology require the recorded shared supplier interfaces. C-infinity completion, restricted series and polynomial-case purity lattices already have native coordinate signatures; those do not discharge the omitted general statements. No unknown proposition encodes an omitted condition.

Needed by: [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9), [`DM.1/characteristic-local-realization`](#dm-1-characteristic-local-realization) (1.7), [`DM.3/moduli-functor`](#dm-3-moduli-functor) (3.2), [`DM.3/satake-compactification`](#dm-3-satake-compactification) (3.5), [`DM.4/purity`](#dm-4-purity) (4.5), [`DM.5/period-ring`](#dm-5-period-ring) (5.5), [`DM.7/elliptic-sheaf`](#dm-7-elliptic-sheaf) (7.1).

<a id="gap-valued-skew-field-proof-inputs"></a>

### Valued-skew-field proof inputs

Theorem 4.1 and §6 of Maurischat have been inspected, but the left/right invariant-factor and Newton-decomposition proofs in §3 remain to be read and implemented by the future shared valued-skew-algebra supplier (FiniteFieldsAndCharacterSums, Part II; no such stage is claimed to exist). The perfect-field abelian iff A-finite statement is planned using the exact positive-slope criterion, without treating the generic Ore adapter as its proof.

Needed by: [`DM.4/dual-realization`](#dm-4-dual-realization) (4.10).

<a id="gap-fine-moduli-chart-and-deformation-proof"></a>

### Fine moduli chart and deformation proof

Hartl–Yu Theorem 2.3 states good-open affine smooth representability and cites Drinfeld §5 for the principal-level chart and infinitesimal deformation argument. The fine-subgroup extension in Proposition 2.8 has been read; a full chart/deformation proof remains an exact input to the Drinfeld-specific moduli target, using exact SF.1 descent/quotient inputs and the stated stack consequence.

Needed by: [`DM.3/fine-moduli-scheme`](#dm-3-fine-moduli-scheme) (3.3), [`DM.3/moduli-functor`](#dm-3-moduli-functor) (3.2).

<a id="gap-strict-finite-f-module-finite-shtuka-realization"></a>

### Strict finite F-module / finite-shtuka realization

SF.2 plans sites and cohomology, not this anti-equivalence. The missing shared input is the category of finite locally free shtukas (N,τ:σ\*N→N), strict finite F-module schemes with their deformation action, Dr_q and its inverse, exactness, the étale criterion, co-Lie identification and the torsion evaluation pairing. Read Hartl Definitions 4.1–4.2, pp. 12–13, Definition 4.5, pp. 13–14 and Theorem 4.7, pp. 14–15. Route the shared theory to SchemeAndStackFoundations, Part II; until that owner is planned, this is a gap, not an SF.2 theorem.

Needed by: [`DM.1/finite-flat-torsion`](#dm-1-finite-flat-torsion) (1.2), [`DM.1/etale-torsion`](#dm-1-etale-torsion) (1.3), [`DM.1/geometric-torsion-basis`](#dm-1-geometric-torsion-basis) (1.4), [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1), [`DM.7/tate-realization`](#dm-7-tate-realization) (7.6), [`DM.1/characteristic-local-realization`](#dm-1-characteristic-local-realization) (1.7), [`DM.7/characteristic-comparison`](#dm-7-characteristic-comparison) (7.7).

<a id="gap-equal-characteristic-effective-local-shtuka-input"></a>

### Equal-characteristic effective local-shtuka input

HS2 uses the Fargues–Fontaine setting and does not supply Hartl’s equal-characteristic category. Needed are locally free R\[\[z]]-modules, σhat-linearization, inversion of z−γ(z), effective cokernel bounds and the finite-flat characteristic torsion comparison, with the compatible F_p-algebra embedding and τ^deg(p) on the characteristic factor. See Hartl Definition 7.1 and Example 7.2, p. 27, Theorems 7.4 and 7.6, p. 28. Request an equal-characteristic Part II of HeckeStacksAndLocalShtukas or an explicit single-owner reassignment; no fabricated supplier stage is cited.

Needed by: [`DM.1/characteristic-local-realization`](#dm-1-characteristic-local-realization) (1.7), [`DM.7/characteristic-comparison`](#dm-7-characteristic-comparison) (7.7).

<a id="gap-finite-tale-torsion-bases-and-compatible-limits"></a>

### Finite étale torsion bases and compatible limits

The abelian-sheaf/Galois comparison in SF.2 is not the strict-group theorem or a basis theorem. Supply the Frobenius/Lang solution argument for a finite étale shtuka over a separably closed field, with residue-field factors, A/a-module freeness of rank r, and compatible lifts for a nonprincipal prime-adic inverse system. Hartl Proposition 6.5 and Theorem 6.6, p. 26 give the exact torsion statements. The finite-shtuka realization and the nonprincipal inverse-limit argument must both be available.

Needed by: [`DM.1/geometric-torsion-basis`](#dm-1-geometric-torsion-basis) (1.4), [`DM.1/tate-module`](#dm-1-tate-module) (1.5), [`DM.1/continuous-galois-action`](#dm-1-continuous-galois-action) (1.6).

<a id="gap-projective-finite-quotients-and-section-ring-comparison"></a>

### Projective finite quotients and section-ring comparison

The cited SF.0 normalization theorem requires a qcqs reduced Nagata base and finite generic algebra; A and finite-type A-schemes meet this through excellent-examples. SF.1/finite-group-quotient requires every orbit to lie in an affine open and supplies the scheme quotient, not all normal/projective descent claims. Supply the ample-line-bundle norm/descent argument for finite constant-group quotients and the normal integral graded section-ring/Proj comparison used by Pink Theorem 4.2, pp. 14–16 and Theorem 5.7, p. 21. SF.2/ample-serre-vanishing supplies finiteness and eventual vanishing under proper Noetherian ample hypotheses, not this entire comparison. These extensions belong to SchemeAndStackFoundations, Part II.

Needed by: [`DM.3/satake-compactification`](#dm-3-satake-compactification) (3.5), [`DM.3/modular-forms`](#dm-3-modular-forms) (3.7), [`DM.3/integral-compactification`](#dm-3-integral-compactification) (3.9).

<a id="gap-completed-coefficient-and-analytic-quotient-interfaces"></a>

### Completed coefficient and analytic quotient interfaces

AlgebraicCurves Layer 5 supplies normalized DVR completions and uniformizer/residue compatibility. The remaining integration includes finite-residue coefficient sections and Laurent coordinates, decomposition after tensoring with coefficient fields, the induced extending norm on an algebraic closure, nonprincipal A_λ inverse-limit scalar actions, and compact quotients/lattice coordinates for the finite product of infinity completions. These are exact adapters to existing completion, finite-normalization and restricted-product theory, not a request to rebuild FA.1 or FA.2. Record any extension beyond the current owners as their Part II.

Needed by: [`DM.1/tate-module`](#dm-1-tate-module) (1.5), [`DM.1/continuous-galois-action`](#dm-1-continuous-galois-action) (1.6), [`DM.2/c-infinity`](#dm-2-c-infinity) (2.2), [`DM.2/uniformization`](#dm-2-uniformization) (2.6), [`DM.4/purity`](#dm-4-purity) (4.5), [`DM.5/rational-motive-realization`](#dm-5-rational-motive-realization) (5.1), [`DM.5/local-algebraization`](#dm-5-local-algebraization) (5.4), [`DM.5/period-ring`](#dm-5-period-ring) (5.5), [`DM.6/integral-model`](#dm-6-integral-model) (6.2), [`DM.6/unit-lattice`](#dm-6-unit-lattice) (6.4), [`DM.6/lattice-covolume`](#dm-6-lattice-covolume) (6.6), [`DM.6/class-number-formula`](#dm-6-class-number-formula) (6.11).

<a id="gap-register-the-existing-algebraicvectorbundles-imports"></a>

### Register the existing AlgebraicVectorBundles imports

Current TauCetiRoadmap main 070dc2becd74419e76303ede84b465ed4a69461f already provides AlgebraicVectorBundles L0B finite locally free/invertible sheaves and the affine finite-projective equivalence, and L2B totalSpace(E)=linearSpec(E∨) and its section-valued universal property. These nine newer roadmaps are absent from the atlas stage registry. Exact owner references and contracts are retained in upstreamImports, not mislabelled as declarations at the pinned library commits. Register these existing roadmap layers and turn these catalogue endpoints into normal imports. This is bookkeeping, not a new mathematical plan.

Needed by: [`DM.0/relative-drinfeld-module`](#dm-0-relative-drinfeld-module) (0.9), [`DM.3/generalized-drinfeld-module`](#dm-3-generalized-drinfeld-module) (3.4), [`DM.3/modular-forms`](#dm-3-modular-forms) (3.7), [`DM.4/effective-a-motive`](#dm-4-effective-a-motive) (4.2), [`DM.4/contravariant-motive`](#dm-4-contravariant-motive) (4.3), [`DM.7/elliptic-sheaf`](#dm-7-elliptic-sheaf) (7.1), [`DM.7/drinfeld-to-sheaf`](#dm-7-drinfeld-to-sheaf) (7.3), [`DM.7/shtuka-export`](#dm-7-shtuka-export) (7.5), [`DM.4/t-module`](#dm-4-t-module) (4.1).

<a id="gap-particular-carlitz-kernel-separability"></a>

### Particular Carlitz kernel separability

PAP Proposition6.2.3 invokes a Lie-algebra surjectivity verification for the particular scalar-action logarithm group. A general smooth group surjection need not be separable. The plan states the exact scalar-action theorem and records this verification before inferring a smooth linear kernel; no generic smoothness inference is used.

Needed by: [`DM.8/logarithm-group-linear`](#dm-8-logarithm-group-linear) (8.43), [`DM.8/logarithm-linear-relations`](#dm-8-logarithm-linear-relations) (8.44), [`DM.8/carlitz-logarithm-independence`](#dm-8-carlitz-logarithm-independence) (8.46).

<a id="gap-the-pre-t-motive-category-of-dm-4"></a>

### The pre-t-motive category of DM.4

DM.4 plans effective dual t-motives over a perfect field with the inverse-Frobenius σ (DM.4/inverse-twist-dual-motive), the τ-to-σ star dictionary for coordinate t-modules (DM.4/star-adapter) and the abelian-iff-A-finite image (DM.4/dual-realization). No DM.4 node yet defines the rational category these DM.8 targets live in: pre-t-motives over k̄(t), that is finite-dimensional k̄(t)-vector spaces with a bijective σ-semilinear operator, their morphisms, the rationalization functor H ↦ k̄(t)⊗H from effective dual t-motives (full on Hom after tensoring with F_q(t), by DM.8/constant-denominator), tensor products over k̄(t) with diagonal σ, internal Hom and duals given by inverse-transpose matrices, the unit object, the Carlitz object C with σ-matrix t−θ and its twists C(n) with σ-matrix (t−θ)^n (the rationalized dual motives of the Carlitz tensor powers of DM.4/carlitz-tensor-power), and scalar extension to the analytic fraction field L (Papanikolas §§3.2–3.4, pp. 10–19). Plan these as a DM.4 definition node with its API and tests; until then these targets keep the DM.4 stage as a prerequisite. MC.6 already plans arbitrary-field neutral reconstruction and finite-type recognition; its remaining tensor-subcategory and group-map comparison criteria are requested precisely. The suggested file omits category-valued signatures until these interfaces can be instantiated; native fixed-module, matrix and coordinate-algebra forms remain.

Needed by: [`DM.8/rigid-triviality`](#dm-8-rigid-triviality) (8.15), [`DM.8/fundamental-betti-basis`](#dm-8-fundamental-betti-basis) (8.17), [`DM.8/integral-trivialization`](#dm-8-integral-trivialization) (8.18), [`DM.8/betti-exact-tensor`](#dm-8-betti-exact-tensor) (8.19), [`DM.8/neutral-category`](#dm-8-neutral-category) (8.20), [`DM.8/tannakian-identification`](#dm-8-tannakian-identification) (8.32), [`DM.8/logarithm-matrices`](#dm-8-logarithm-matrices) (8.40), [`DM.8/logarithm-motive-membership`](#dm-8-logarithm-motive-membership) (8.41), [`DM.8/carlitz-group`](#dm-8-carlitz-group) (8.42), [`DM.8/period-transcendence`](#dm-8-period-transcendence) (8.38).

<a id="gap-analytic-and-dimension-supplier-matching"></a>

### Analytic and dimension supplier matching

Instantiation at the pin of current univariate/multivariate restricted-series Gauss norms, the C∞ normalized zero/pole comparison and AdicSpaces bounded-disk zero/growth estimates beyond the existing Tau Ceti preparation/unit/principal-ideal results, FA.0 general separability, curve transport and Lang base extension, and the requested SF.0 filtered growth theorem remains. SF.0 already plans the dimension/transcendence and base-extension statements; SF.1 already plans affine descent and torsors. Only the additional exact interfaces stated in requests are missing; the existing theories are imported. TauCetiRoadmap main 350e970ce now has RestrictedPowerSeries (Gauss norms, Weierstrass preparation, unit-radius Tate algebras, the entire-series subring) and NewtonPolygons (disc factors, exact zero counts, entire products with a prescribed zero divisor). These own the normalized zero/pole factorization and the bounded-disk zero counts requested here from AdicSpaces; see upstreamImports. Neither roadmap is yet registered in the atlas, so the AdicSpaces stage stays as the recorded prerequisite.

Needed by: [`DM.8/tate-analytic-interface`](#dm-8-tate-analytic-interface) (8.11), [`DM.8/analytic-separability`](#dm-8-analytic-separability) (8.14), [`DM.8/relative-algebraic-closure`](#dm-8-relative-algebraic-closure) (8.29), [`DM.8/abp-estimates`](#dm-8-abp-estimates) (8.34), [`DM.8/difference-smooth-dimension`](#dm-8-difference-smooth-dimension) (8.30), [`DM.8/period-transcendence`](#dm-8-period-transcendence) (8.38).

<a id="remaining-work-by-layer"></a>

### Remaining work by layer

Beyond the gaps above and the [supplier contracts](#supplier-contracts), the coverage records of the packets list the following remaining work.

**DM.4** (planned).

- The pre-t-motive category (Papanikolas §§3.2–3.4): finite-dimensional k̄(t)-spaces with bijective σ-semilinear operator, rationalization of effective dual t-motives, tensor, internal Hom, duals, unit, the Carlitz object and scalar extension to the analytic fraction field. DM.8 consumes it (gap: The pre-t-motive category of DM.4); plan it as a DM.4 definition node.

**DM.8** (planned).

- Plan the DM.4 pre-t-motive category (gap: The pre-t-motive category of DM.4), reconcile it with the generated category T, and instantiate the neutral arbitrary-field MC.6 interface.
- Instantiate the existing restricted-series norms at the pinned analytic types, discharge the C∞ zero/pole comparison and bounded-disk zero/growth (now owned upstream by RestrictedPowerSeries and NewtonPolygons) and FA.0 separability/curve/Lang transport inputs, and supply the precise SF.0 filtered-growth export.
- Verify separability of the particular logarithm-group projection in Proposition6.2.3 and complete its scheme-level linear-kernel argument.
- Replace the documented supplier-dependent suggested-signature omissions once the actual motive/category interfaces are available.
- Anderson's comparison, which DM.4/uniformizability assigns to this layer: the t-module of an abelian t-motive over C∞ is uniformizable if and only if the motive is rigid analytically trivial (BP-RAPID Theorem 4.2, p. 16, citing Anderson's t-Motives, Theorem 4; on the dual side, Papanikolas §1.1.4, p. 2). No DM.8 target states it, and no target of the plan cites it, since DM.8's period theorems use rigid triviality directly. Plan it as a DM.8 comparison target once the DM.4 pre-t-motive category exists, stated in both the τ and σ conventions through DM.4/star-adapter.

## Corrections to the sources

The plan found these mistakes in its sources and states the targets in corrected form. Each records the place, what is printed, the correction and its reason, in this roadmap's own words, and the review verdict.

- **E1** (misprint), [PAPIKIAN-2017](#source-papikian-2017), Public lecture notes, Theorem 2.3 proof, p. 7. Printed: The displayed finite product for φ\_a has initial X and factors (1−X/e_Λ(λ)), with no initial scalar a, while the argument requires differential a. Correction: Use aX∏\_(0≠λ∈a⁻¹Λ/Λ)(1−X/e_Λ(λ)). Reason: The displayed product has derivative one at zero. The functional equation e_Λ(az)=φ\_a(e_Λ(z)) has derivatives a on the left and φ\_a′(0) on the right. The correction also gives φ\_c=cX for constants c. Affects the proof; status new; review: confirmed.
- **E2** (misprint), [HARTL-2017](#source-hartl-2017), arXiv:1706.06807v1, proof of Theorem 3.5, display (3.5), p. 9; published display (3.5), p. 1440. Printed: The preprint display gives the target Hom(M,M′) while the map takes m′ to m′∘f for f:E→E′. Correction: The target is Hom(M(E′),M(E)); the published display gives this corrected target. Reason: Composition m′∘f starts with a function on E′ and produces a function on E, reversing the objects. The surrounding preprint proof already uses this direction. Affects nothing; status Corrected in the published Annali XIX (2019) display (3.5), p. 1440, inspected on 2026-10-11.; review: confirmed.
- **E3** (misprint), [STALDER-PUBLISHED](#source-stalder-published), Compositio 146 (2010), recap after Proposition 6.21, p. 595; arXiv:0809.0224v1, p. 43. Printed: The recap identifies B^G with the full completed coefficient ring F_(K,λ), although Proposition 6.21 identifies it with the smaller rational coefficient extension F_(λ,K). Correction: Use B^G=F_(λ,K)=Frac(F_λ⊗F_q K), retaining the distinction from Frac((F_λ,res⊗F_q K)\[\[z]]). Reason: Proposition 6.21 proves the smaller equality, and Claim 5.2 requires exactly that equality for local algebraization. For infinite K the rational scalar extension and full coefficient completion differ. Affects nothing; status new; review: confirmed.
- **E4** (misprint), [HARTL-YU-2025](#source-hartl-yu-2025), arXiv:2009.13934v2, Proposition 3.11 and proof, pp. 18–19. Printed: Three line-bundle subscripts use A\[1/r] for the reciprocal compactification that the same proposition defines over A\[1/t]. Correction: Use Q_(r,A\[1/t]) in the O(1) and O(−1) subscripts. Reason: r is the rank integer, while the coefficient element inverted throughout the construction and its base is t. The surrounding line-bundle construction is over Q_r⊗F_q A\[1/t]. Affects nothing; status new; review: confirmed.
- **E5** (misprint), [WIEDMANN-2005](#source-wiedmann-2005), Revised English thesis, proof of Proposition 5.15, p. 77. Printed: The proof attributes cohomology/section conclusions to Proposition 5.15 itself. Correction: Use Proposition 5.14 for the normalized cohomology and section dimensions. Reason: Proposition 5.14, immediately preceding, proves the required vanishing and dimensions; Proposition 5.15 is the conclusion presently being proved. Affects nothing; status new; review: confirmed.
- **E6** (misprint), [HARTL-PUBLISHED](#source-hartl-published), Published Lemma 3.8(b), proof, p. 1442; arXiv:1706.06807v1, p. 10. Printed: After choosing f∈1+I with fI=0 and I contained in every prime, the proof calls 1−f a unit. Correction: Use f itself as the unit; multiplying fI=0 by f⁻¹ gives I=0. Reason: Here I lies in the nilradical, so f=1+i is invertible while 1−f=−i is nilpotent and is generally not invertible in a nonzero ring. The corrected argument gives exactly the stated conclusion. Affects the proof; status new; review: confirmed.
- **E7** (misprint), [BP-RAPID](#source-bp-rapid), §2.4, immediately after equation (2.2), p. 6. Printed: The action is identified with the derivative-one sublattice polynomial evaluated at z, although the preceding functional equation evaluates it at az. Correction: Use φ\_Λ(a)(z)=P_\[Λ:aΛ](az). Reason: The normalized P has derivative one; the action must have derivative a. The preceding scalar-lattice formula and the next page’s ψ(c) formula both contain the scalar in the argument. Affects the proof; status new; review: confirmed.
- **E8** (misprint), [HARTL-YU-2025](#source-hartl-yu-2025), arXiv:2009.13934v2, equation (3.7), p. 18. Printed: The coefficient is indexed by ordered pairwise-distinct tuples, which counts each elementary-symmetric monomial (q^i−1)! times. Correction: Sum once over subsets S⊂V_r∖{0} of cardinality q^i−1, with summand γ(t) times the product of λ(v)⁻¹ for v∈S. Reason: Expand the finite product in (3.6). For q=2, r=2, i=2 the printed ordered sum has six identical terms and vanishes, while the leading coefficient is the nonzero product of the three reciprocals times γ(t). The sign is one in characteristic p. Affects a stated result; status new; review: confirmed.
- **E9** (misprint), [STALDER-2008](#source-stalder-2008), arXiv:0809.0224v1 artifact, Proposition 6.4 proof, p. 36. Printed: One branch of the induction changes the Frobenius exponent in the denominator from m to the unrelated residue-degree letter d. Correction: Keep the denominator q^m−1 in that branch. Reason: The preceding inequality is q^m v_x(f_ir)≥q^m C/(q^m−1). Division by q^m gives C/(q^m−1), in agreement with the proposition and the other branch. Affects nothing; status new; review: confirmed.
- **E10** (misprint), [STALDER-2008](#source-stalder-2008), arXiv:0809.0224v1 artifact, Theorem 5.4 proof, p. 28. Printed: The final Hom identification dualizes the source realization a second time. Correction: Identify (V_λ(M)∨⊗V_λ(N))^G with Hom_G(V_λ(M),V_λ(N)). Reason: The tensor-Hom correspondence for finite-dimensional representations places a single dual on M in the tensor product. The fully faithful functor has source M and target N, so the displayed Hom source must be V_λ(M). Affects nothing; status new; review: confirmed.
- **E-DM8-1** (misprint), [PAP-v2](#source-pap-v2), arXiv math/0506078v2 (29 June 2007), Proposition 3.3.14 proof, p.16. Printed: The proof assigns both independently chosen trivializations Ψ\_P and Ψ\_Q to GL_r(L), although P and Q have independent ranks. Correction: Use Ψ\_P∈GL_r(L), Ψ\_Q∈GL_s(L) for the independently chosen ranks r and s; their tensor matrix has size rs. Reason: The proposition permits P and Q of different ranks; choosing ranks 1 and 2 makes the shared r annotation incorrect. The tensor/dual argument itself is unchanged. Affects the proof; status new (no correction located in the recorded searches; finding limited to PAP-v2); review: confirmed.
- **E-DM8-2** (misprint), [PAP-v2](#source-pap-v2), arXiv math/0506078v2 (29 June 2007), §3.4.1, p.17, and Proposition 3.4.7, p.19. Printed: The σ-representing matrix Φ is annotated as r×1 in the two indicated places. Correction: The representing matrix is r×r. Reason: It multiplies the r×1 basis column, and its determinant is used immediately. For r=2 the printed matrix product and determinant have the wrong types. Affects the proof; status new (no correction located in the recorded searches; finding limited to PAP-v2); review: confirmed.
- **E-DM8-3** (misprint), [PAP-v2](#source-pap-v2), arXiv math/0506078v2 (29 June 2007), Theorem 3.5.4 proof, p.21. Printed: The graded-vector-space equivalence is assigned coefficient field bar(k)(t). Correction: The coefficient field of the graded-vector-space category in this argument is F_q(t). Reason: Lemma 3.5.3 gives endomorphisms of each Carlitz tensor power equal to F_q(t), and the fibre functor in the same sentence takes values in Vec(F_q(t)); a bar(k)(t)-linear equivalence would change that endomorphism field. Affects the proof; status new (no correction located in the recorded searches; finding limited to PAP-v2); review: confirmed.
- **E-DM8-4** (misprint), [PAP-v2](#source-pap-v2), arXiv math/0506078v2 (29 June 2007), Lemma 4.5.7 proof, p.30. Printed: The kernel basis-column matrix is annotated Mat_{m×s}(Λ), and written using a transpose incompatible with the block widths. Correction: Use the vertical block column with −C above I_(s−m), of size s×(s−m), as the kernel basis matrix; its product with \[I_m,C] is zero. Reason: C has m rows and s−m columns. Stacking −C above I_{s−m} gives s rows and s−m columns and makes its product with \[I_m,C] defined. Affects the proof; status new (no correction located in the recorded searches; finding limited to PAP-v2); review: confirmed.
- **E-DM8-5** (misprint), [PAP-v2](#source-pap-v2), arXiv math/0506078v2 (29 June 2007), Theorem 5.2.2 proof, p.33. Printed: The concatenated tensor-monomial vector length is given by (r^(2d+2)−1)/(r²−1) without excluding r=1. Correction: Use N=Σ\_{n=0}^d r^(2n); the quotient expression is only for r≠1, and N=d+1 for r=1. Reason: The proof includes rank-one motives. At r=1 the printed quotient is 0/0, whereas the concatenated vector has d+1 entries. This changes no theorem hypothesis. Affects the proof; status new (no correction located in the recorded searches; finding limited to PAP-v2); review: confirmed.
- **E-DM8-6** (misprint), [PAP-v2](#source-pap-v2), arXiv math/0506078v2 (29 June 2007), Proposition 6.1.3 proof, p.34. Printed: After choosing basis m_0,...,m_r, the column used in the σ equation starts with m_1 and omits m_0. Correction: Use m=\[m_0,m_1,…,m_r]^tr in the equation σm=(t−θ)Φm. Reason: The module has rank r+1 and Φ is an (r+1)×(r+1) matrix; the printed vector omits its first coordinate. The subsequent submodule C tensor C is generated in that coordinate. Affects the proof; status new (no correction located in the recorded searches; finding limited to PAP-v2); review: confirmed.
- **E-DM8-7** (gap), [PAP-v2](#source-pap-v2), arXiv math/0506078v2, Theorem6.4.2 proof p.38, invoking Lemma6.4.1 pp.37–38. Printed: The proof applies Lemma6.4.1 to each λ\_i, while the theorem permits exp_C(λ\_i)=0 and the lemma assumes a nonzero algebraic exponential. Correction: Separate exp_C(λ)=0: the Carlitz kernel theorem gives λ in F_q\[θ]·π̃. Apply division only to the nonzero exponentials, then choose a k-basis of the span of π̃ and the resulting small logarithms. Reason: The single-element family λ\_1=π̃ is linearly independent over k and satisfies the theorem, but does not satisfy the division lemma’s nonzero-exponential hypothesis. DM.8/logarithm-division and carlitz-logarithm-independence already state the separate period case, so no target theorem is weakened. Affects the proof; status new (no correction located in the recorded searches; finding limited to PAP-v2); review: confirmed.
- **E-DM8-8** (misprint), [CPY-v2](#source-cpy-v2), arXiv1411.0124v2, Proposition2.2.1 p.6 (rendered page checked). Printed: The matrix of the homomorphism between rationalized motives is placed in Mat_(r1×r2)(bar(k)\[t]). Correction: Place it in Mat_(r1×r2)(bar(k)(t)); retain both determinant conditions and the conclusion that its monic common denominator lies in F_q\[t]. Reason: On two trivial rank-one motives, multiplication by 1/t commutes with σ and is a rationalized-module homomorphism, although its matrix is not polynomial. The proof immediately treats rational denominators and proves the intended corrected statement. Affects nothing; status Already recorded and independently confirmed as PAPER-NGODAC-21/E10 in research/blueprint/papers/PAPER-NGODAC-21.result.json; this is reuse, not a new claim.; review: confirmed.

## Sources

The sources are the versions read, with their hashes. Every locator above refers to them. NGODAC-2021 and NGO-HAL are the same HAL manuscript, hal-03298790v1, downloaded on different dates with different byte hashes; the two parts cite it under these two ids.

- <a id="source-bp-rapid"></a>**BP-RAPID**: W. Dale Brownawell and Matthew A. Papanikolas, [A rapid introduction to Drinfeld modules, t-modules, and t-motives](https://arxiv.org/pdf/1806.03919v1). arXiv:1806.03919v1, 11 June 2018. Read: §§1–2.5, pp. 1–8; §§3.1–3.5, pp. 8–13; §§4.1–4.6, pp. 13–20. Read for the definitions, analytic formulas and motive conventions used here. SHA-256 `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d`.
- <a id="source-pink-2012"></a>**PINK-2012**: Richard Pink, [Compactification of Drinfeld modular varieties and Drinfeld modular forms of arbitrary rank](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf). Author copy of arXiv:1008.0013v4, 16 March 2012. Read: §1, pp. 3–4; Propositions 2.6–2.7, pp. 6–7; §3, pp. 9–13; §4, pp. 13–18; §§5–6, pp. 19–24; §7, pp. 25–27. SHA-256 `408d485d17dbede3ae02b9b90f132a37947d567e8f2697bdcb6c6cb8c41c9639`.
- <a id="source-hartl-2017"></a>**HARTL-2017**: Urs Hartl, [Isogenies of abelian Anderson A-modules and A-motives](https://arxiv.org/pdf/1706.06807v1). arXiv:1706.06807v1, 22 June 2017. Read: Lemma 1.4 and §2, pp. 3–6; §3, pp. 7–11; §4 definitions, pp. 11–13; Corollaries 5.11–5.19, pp. 19–23; §6, pp. 23–26; §7 definitions and local completion, pp. 27–28. The proof of the finite-shtuka equivalence is a supplier request, not asserted as read. SHA-256 `bca3f51ed9bf5f215a12bdf2390b4718cb3a951a3e71c01fb87541fefafcd31f`.
- <a id="source-papikian-2017"></a>**PAPIKIAN-2017**: Mihran Papikian, [An overview of the theory of Drinfeld modules](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf). Public lecture notes, last modified 9 October 2017. Read: §2.2, pp. 6–7; §3.1, pp. 10–12; §3.2, pp. 12–14. These are lecture notes, not the uncleared book. SHA-256 `6c10dd09df294795f41228ee5ba8b24232c43d7ed1c6485ba0bdb6ad8da21c43`.
- <a id="source-taelman-2012"></a>**TAELMAN-2012**: Lenny Taelman, [Special L-values of Drinfeld modules](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf). Annals of Mathematics 175 (2012), 369–391. Read: §1 definitions and Theorem 1, pp. 369–374; §§2–5 determinant theory, trace formula and class-formula proof, pp. 375–389. SHA-256 `46699398350f09a5e9baf53ae7b414102633fa86c0fc1abc11dee82ee6d0032d`.
- <a id="source-wiedmann-2005"></a>**WIEDMANN-2005**: Stefan Wiedmann, [Drinfeld modules and elliptic sheaves](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf). Revised English thesis, 26 August 2005. Read: §§3.4–3.6, pp. 40–48; §4.6, pp. 69–71; §5, pp. 72–84; §6.1, p. 85. The infinity construction and normalized cohomology were read; bounded-shift variance and non-rational infinity residue-factor descent remain precise gaps. SHA-256 `dfb9028260ce487088763691bf55b9644a9598976fa9db183b936c491fec828d`.
- <a id="source-tamagawa-1994"></a>**TAMAGAWA-1994**: Akio Tamagawa, [Generalization of Anderson’s t-motives and Tate conjecture](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0884-17.pdf). RIMS Kokyuroku 884 (1994), 154–159. Read: §§0–3, pp. 154–158, including the fixed characteristic requirement and local algebraization sketch. SHA-256 `f88b80a69f4fc13dec1db2a88081adeb9f8666283893ea232ed11076b6205aec`.
- <a id="source-stalder-2008"></a>**STALDER-2008**: Nicolas Stalder, [The Semisimplicity Conjecture for A-Motives](https://arxiv.org/pdf/0809.0224v1). arXiv:0809.0224v1; downloaded artifact carries the date 23 November 2018. Read: Theorem 1.1, pp. 2–3; Definitions 2.1–2.2, pp. 5–6; Definitions 2.26 and Proposition 2.28, pp. 12–14; Theorem 3.11 and proof, pp. 18–21; §4 realization and coefficient-extension route, pp. 21–26; §§5–6, pp. 26–43. Proposition 5.16(a) is inspected and its integral saturation proof input remains recorded. Published Proposition 5.16, p. 588, and Proposition 6.21 and following recap, p. 595, were separately collated. SHA-256 `ba000e658d82e781d46e5f550c221e100516c46ea881cd23c68bae5da063142a`.
- <a id="source-ngodac-2021"></a>**NGODAC-2021**: Tuan Ngo Dac, [On Zagier-Hoffman’s conjectures in positive characteristic](https://hal.science/hal-03298790/document). HAL hal-03298790v1, manuscript dated 29 March 2021; not collated against Annals 194 (2021), 361–392. Read: Notation and depth-one power sums in §2, pp. 5–7; Definition 4.1 and §4.2, pp. 16–18. Only items routed to DM.0, DM.2, DM.4 and DM.6 are developed here; DM.8 machinery is imported. SHA-256 `f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d`.
- <a id="source-thakur-2009"></a>**THAKUR-2009**: Dinesh S. Thakur, [Power sums with applications to multizeta and zeta zero distribution for F_q\[t]](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf). Finite Fields and Their Applications 15 (2009), 534–552. Read: §§2.2–2.3, pp. 536–537: depth-one sums, generating function, and its small-exponent specialization. SHA-256 `d31f4a4be1e6cb1aaf9bdc574070066b1057f043df3ec437cd71784c0933168f`.
- <a id="source-crew-2019"></a>**CREW-2019**: Richard Crew, [Local Class Field Theory](https://people.clas.ufl.edu/rcrew/files/LCFT.pdf). Public author notes, 6 April 2019. Read: Proposition 1.2.8.4 and Corollary 1.2.8.5, pp. 34–35; algebraic closedness of completion in positive characteristic. SHA-256 `aa902052096f5d11095b0f57100d96f79cde4e560c9e2ffd51de1b3302545b42`.
- <a id="source-hartl-yu-2025"></a>**HARTL-YU-2025**: Urs Hartl and Chia-Fu Yu, [Arithmetic Satake compactifications and algebraic Drinfeld modular forms](https://arxiv.org/pdf/2009.13934v2). arXiv:2009.13934v2, 8 January 2025; not collated against the 2025 journal version. Read: Definitions 2.1–2.6, Theorem 2.3 and Proposition 2.8, pp. 7–10; Definition 3.1, Theorem 3.2, Lemmas 3.3 and 3.6–3.8 with proofs, pp. 12–16; Lemma 3.10 and Proposition 3.11 with proof, pp. 17–19. General special-fiber Cohen–Macaulayness is a conjecture and is not a target here. SHA-256 `7c4fe158c3503fc2e7096ea237c1e1932dfa074b3a62416e6040c92d773da2af`.
- <a id="source-hartl-published"></a>**HARTL-PUBLISHED**: Urs Hartl, [Isogenies of abelian Anderson A-modules and A-motives](https://journals.sns.it/index.php/annaliscienze/article/download/668/654/886). Annali della Scuola Normale Superiore di Pisa XIX (2019), 1429–1470. Read: Theorem 3.5 and proof, pp. 1439–1441, especially display (3.5), p. 1440; Lemma 3.8 and proof of (b), pp. 1441–1443. Part (a) cites earlier proofs; it is not claimed discharged. Targeted collation only. SHA-256 `a0f16971c626d020451f7d872399e15c06786c1ce3d0cab739639649d1dcc75f`.
- <a id="source-stalder-published"></a>**STALDER-PUBLISHED**: Nicolas Stalder, [The semisimplicity conjecture for A-motives](https://www.research-collection.ethz.ch/bitstreams/47bc6b90-ad56-4a15-a6c8-46b7da8de09f/download). Compositio Mathematica 146 (2010), 561–598. Read: Proposition 5.16 and proof, p. 588; Proposition 6.21, its proof and following recap, p. 595. Targeted collation only. SHA-256 `d1e133a5465ec129bbfc6c6f8fe1df8e35bc23d1b9381f1c1a7a0f43ff48aacf`.
- <a id="source-maurischat-2026"></a>**MAURISCHAT-2026**: Andreas Maurischat, [Abelian equals A-finite for Anderson A-modules](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf). Annales de l’Institut Fourier, online-first 26 January 2026, DOI 10.5802/aif.3754. Read: §4, Theorem 4.1 and proof, pp. 22–24; §5 conventions, pp. 25–27; §6, Propositions 6.1, 6.4, 6.5 and Theorem 6.6 with proofs, pp. 28–35; §8, Corollary 8.1 and proof, p. 43. The §3 skew-field normal-form/Newton inputs are a supplier contract. SHA-256 `4cf80d50c882ee43b71f9e6fbe9a50eb1e88d94efb8afae17dcd9ae51bb2201e`.
- <a id="source-pap-v2"></a>**PAP-v2**: Matthew A. Papanikolas, [Tannakian duality for Anderson–Drinfeld motives and algebraic independence of Carlitz logarithms](https://arxiv.org/pdf/math/0506078v2). arXiv math/0506078v2, 29 June 2007; preprint of Invent. Math. 171 (2008), 123–174. Read: Revision-two independent review: entire preprint pp.1–39; all node locators and proof chains. Rendered pp.16,17,19,21,30,33,34,38 checked for matrix ranks, overbars, block dimensions and the zero-exponential case. §1.2, pp. 3–4: the Carlitz exponential, its kernel and the Carlitz logarithm with its disk of convergence. Read for the DM.2 logarithm interface consumed by DM.8; the rest of the paper is DM.8's source. SHA-256 `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`.
- <a id="source-abp-v1"></a>**ABP-v1**: G. W. Anderson, W. D. Brownawell, M. A. Papanikolas, [Determination of the algebraic relations among special Γ-values in positive characteristic](https://arxiv.org/pdf/math/0207168v1). arXiv math/0207168v1; preprint of Annals160(2004),237–313. Read: Revision-two independent review: §§2.1–2.5 pp.6–7; §3 pp.7–16, including the complete lifting proof and Proposition3.1.3; Proposition4.3.2 and proof pp.21–22. Collated with the corresponding published sections. SHA-256 `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2`.
- <a id="source-ngo-hal"></a>**NGO-HAL**: Tuan Ngo Dac, [On Zagier–Hoffman’s conjectures in positive characteristic](https://hal.science/hal-03298790/document). HAL hal-03298790v1, submitted 24 July 2021; cover/version and document bytes accessed 2026-10-14. Read: Revision-two independent review: §§4.1–4.3 printedpp.16–18 (PDFpp.17–19), and §5.2 printedpp.20–21 (PDFpp.21–22). These specialize and consume the shared interface; no specialized multizeta target is added. SHA-256 `3141c9337b19447ee970498d30fd10cdcdb6333bb54f8a264440adf3ec513096`.
- <a id="source-ccm-v2"></a>**CCM-v2**: Chieh-Yu Chang, Yen-Tsung Chen, Yoshinori Mishiba, [On Thakur’s basis conjecture for multiple zeta values in positive characteristic](https://arxiv.org/pdf/2205.09929v2). arXiv2205.09929v2. Read: Revision-two independent review: §4.1 p.13; Lemma5.1.1 and complete proof pp.22–24. SHA-256 `05e1f6d6b1ef37068f73709928a9dcc7a0e50874aced170f0c92e07f0cd7413b`.
- <a id="source-iklnp-v2"></a>**IKLNP-v2**: B.-H. Im, H. Kim, K. N. Le, T. Ngo Dac, L. H. Pham, [Zagier–Hoffman’s conjectures in positive characteristic](https://arxiv.org/pdf/2205.07165v2). arXiv2205.07165v2 (10June2024). Read: Revision-two independent review: §2.1/Theorem2.2 p.26; §2.2.1 pp.27–28; uniqueness/denominator application p.33. SHA-256 `74a40b2e45b54760765247a010811d278e48f0b30f361bf3d9ca8cb92fd4b43e`.
- <a id="source-cpy-v2"></a>**CPY-v2**: Chieh-Yu Chang, Matthew A. Papanikolas, Jing Yu, [An effective criterion for Eulerian multizeta values in positive characteristic](https://arxiv.org/pdf/1411.0124v2). arXiv1411.0124v2. Read: Revision-two independent review: §§2.1–2.2 pp.4–6, Proposition2.2.1 and complete proof, and rendered p.6. Adjacent Ω/period sign compared with PAP; chosen normalizations need the DM.2 adapter. SHA-256 `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549`.
- <a id="source-abp-published"></a>**ABP-published**: G. W. Anderson, W. D. Brownawell, M. A. Papanikolas, [Determination of the algebraic relations among special Γ-values in positive characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p06.pdf). Annals of Mathematics 160 (2004), 237–313; version of record. Read: Revision-two independent review: §§2–3 printedpp.244–256, including the complete lifting proof, and Proposition4.3.2 with proof pp.262–263. Target hypotheses agree with ABP-v1. SHA-256 `5668a9496609eb02380d0038f0f67b200c4142eb01fadca48fef6d1f232f62ca`.

## Pinned baseline

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each declaration below was read at the pins by the part plans and their reviews; it provides the stated input and does not certify any planned target.

| Declaration | Module | Provides |
| --- | --- | --- |
| `mathlib:SkewPolynomial` | `Mathlib/Algebra/SkewPolynomial/Basic.lean` | SkewPolynomial R := SkewMonoidAlgebra R (Multiplicative ℕ); the twist φ is read off a MulSemiringAction (Multiplicative ℕ) R, which the user must supply. Its docstring names the q-power Frobenius and Papikian's Drinfeld-module book as the motivating case. |
| `mathlib:SkewPolynomial.monomial_mul_monomial` | `Mathlib/Algebra/SkewPolynomial/Basic.lean` | monomial n r \* monomial m s = monomial (n + m) (r \* φ^\[n] s): the twisted multiplication rule. |
| `mathlib:FiniteField.frobeniusAlgHom` | `Mathlib/FieldTheory/Finite/Basic.lean` | For a finite field K of cardinality q and a commutative K-algebra R, the K-algebra endomorphism x ↦ x^q of R (coe_frobeniusAlgHom). |
| `mathlib:FiniteField.coe_frobeniusAlgHom` | `Mathlib/FieldTheory/Finite/Basic.lean` | ⇑(frobeniusAlgHom K R) = (· ^ q). |
| `mathlib:Polynomial.aeval` | `Mathlib/Algebra/Polynomial/AlgebraMap.lean` | Evaluation R\[X] →ₐ\[R] A at an element of any R-algebra A, commutative or not: the universal property of R\[X]. |
| `mathlib:Polynomial.algHom_ext` | `Mathlib/Algebra/Polynomial/AlgebraMap.lean` | R-algebra maps out of R\[X] agreeing on X are equal. |
| `mathlib:Polynomial.Separable` | `Mathlib/FieldTheory/Separable.lean` | p is separable: p and its derivative are coprime. |
| `mathlib:Polynomial.card_rootSet_eq_natDegree` | `Mathlib/FieldTheory/Separable.lean` | A separable polynomial that splits in K has exactly natDegree roots there. |
| `mathlib:Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean` | The ring of R-linear endomorphisms of a module. |
| `mathlib:RingHom.ker` | `Mathlib/RingTheory/Ideal/Maps.lean` | The kernel ideal of a ring homomorphism. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set. |
| `tauceti:TauCeti.CommHopfAlgCat.kernelSpec` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Kernel.lean` | For a Hopf-algebra map H→K, the affine group-scheme kernel is quotientSpec K by kernelHopfIdeal. The map is contravariant on spectra; this already constructs the general kernel. |
| `tauceti:TauCeti.AdditiveGroup.gaPointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/AdditiveGroup/Basic.lean` | The convolution group of algebra maps from SymmetricAlgebra R R is multiplicatively equivalent to the additive group of a commutative R-algebra. This supplies the additive-group functor of points. |
| `mathlib:PowerSeries.IsRestricted.subring` | `Mathlib/RingTheory/PowerSeries/Restricted.lean` | For a normed commutative ultrametric ring R and radius c, the restricted power series form a subring of PowerSeries R; restricted means that norm(coeff n) times c^n tends to zero. This carrier is reused, not redefined as a Tate algebra. |
| `mathlib:LinearMap.charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | For an endomorphism of a finite free module over a commutative ring, its characteristic polynomial is the matrix characteristic polynomial in a chosen basis. DM.6 specializes this native operation to finite-dimensional F-vector spaces. |
| `mathlib:UniformSpace.Completion` | `Mathlib/Topology/UniformSpace/Completion.lean` | The separated quotient of Cauchy filters on a uniform space. The native completion field and normed-field instances in Mathlib/Analysis/Normed/Module/Completion.lean were also read and are reused; the extended norm on the algebraic closure remains an explicit input. |
| `mathlib:NormedField.instCompletableTopField` | `Mathlib/Analysis/Normed/Field/Instances.lean` | Every normed field is a completable topological field; this supplies the completion-field instance in the C-infinity prototype. |
| `mathlib:AlgebraicGeometry.Scheme.Modules` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | For a scheme X, X.Modules is the category SheafOfModules X.ringCatSheaf, with its native categorical morphisms. |
| `mathlib:AlgebraicGeometry.Scheme.Modules.pullback` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | For f:X→Y, pullback f is the functor Y.Modules→X.Modules, left adjoint to the native pushforward. |
| `mathlib:SheafOfModules.IsLocallyFree` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean` | A module sheaf is locally free when it admits local generator data whose maps from the corresponding free sheaves are isomorphisms. Finite rank is a separate condition. |
| `mathlib:SheafOfModules.IsFinitePresentation` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean` | A module sheaf is finitely presented when it admits local quasicoherent presentations with finitely many generators and relations. This is already Mathlib, also reused by Tau Ceti FinitelyPresentedSheaf. |
| `mathlib:LinearMap.fixedSubmodule` | `Mathlib/LinearAlgebra/FixedSubmodule.lean` | For an F-linear endomorphism f, the native F-submodule of vectors v satisfying f(v)=v. |
| `mathlib:LinearMap.mem_fixedSubmodule_iff` | `Mathlib/LinearAlgebra/FixedSubmodule.lean` | Membership is exactly the equation f(v)=v. |
| `mathlib:LinearMap.fixedSubmodule_eq_ker` | `Mathlib/LinearAlgebra/FixedSubmodule.lean` | The fixed submodule is the kernel of f−id. |
| `mathlib:LinearMap.fixedSubmodule_eq_top_iff` | `Mathlib/LinearAlgebra/FixedSubmodule.lean` | The fixed submodule is all of V exactly when f=id. |
| `mathlib:Submodule.subtype` | `Mathlib/Algebra/Module/Submodule/LinearMap.lean` | The native linear inclusion of a submodule. |
| `mathlib:Submodule.subtype_injective` | `Mathlib/Algebra/Module/Submodule/LinearMap.lean` | The inclusion of a submodule is injective. |
| `mathlib:LinearMap.liftBaseChangeEquiv` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | F-linear maps W→V correspond to L-linear maps L⊗\_F W→V when V is an L-module. The native abbreviation liftBaseChange applies this equivalence. |
| `mathlib:LinearMap.liftBaseChange_tmul` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | The scalar extension of j sends a⊗w to a·j(w). |
| `mathlib:LinearMap.range_liftBaseChange` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | The image of the lifted map is the L-linear span of the original image. |
| `mathlib:Submodule.mem_span_range_iff_exists_fun` | `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean` | For a finite family, membership in its span is equivalent to a finite coefficient expansion. |
| `mathlib:linearIndependent_iff'` | `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean` | Linear independence is equivalent to every finite relation having zero coefficients. |
| `mathlib:linearIndependent_finSucc` | `Mathlib/LinearAlgebra/LinearIndependent/Lemmas.lean` | A Fin(n+1)-family is independent iff its tail is independent and its first vector is outside the tail span. |
| `mathlib:linearIndependent_iff_finset_linearIndependent` | `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean` | An arbitrary family is independent iff all finite subfamilies are independent. |
| `mathlib:LinearIndependent.restrict_scalars'` | `Mathlib/LinearAlgebra/LinearIndependent/Basic.lean` | Independence descends from L to F under faithful scalar restriction, the reverse direction to the new fixed-vector theorem. |
| `mathlib:LinearIndependent.map'` | `Mathlib/LinearAlgebra/LinearIndependent/Basic.lean` | A linear map with zero kernel preserves linear independence. |
| `mathlib:Module.Free.chooseBasis` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | A basis indexed by ChooseBasisIndex for a free module; vector spaces are free. |
| `mathlib:Module.Basis.linearIndependent` | `Mathlib/LinearAlgebra/Basis/Basic.lean` | The family supplied by a basis is linearly independent. |
| `mathlib:Module.Basis.span_eq` | `Mathlib/LinearAlgebra/Basis/Basic.lean` | The range of a basis spans the whole module. |
| `mathlib:Module.Basis.injective_constr_of_linearIndependent` | `Mathlib/LinearAlgebra/Basis/Basic.lean` | The map prescribed on a basis is injective when the prescribed images are independent. |
| `mathlib:Module.Basis.baseChange` | `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | An F-basis gives the L-basis of L⊗\_F W by scalar extension. |
| `mathlib:Module.Basis.baseChange_apply` | `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | The scalar-extended basis vector is 1⊗b_i. |
| `mathlib:LinearIndependent.finite` | `Mathlib/LinearAlgebra/Dimension/Finite.lean` | An independent family in a finite module has finite index type. |
| `mathlib:Module.Basis.finiteDimensional_of_finite` | `Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean` | A basis indexed by a finite type proves finite dimensionality. |
| `mathlib:Module.finrank_baseChange` | `Mathlib/LinearAlgebra/Dimension/Constructions.lean` | The L-dimension of L⊗\_F W equals the F-dimension of W. |
| `mathlib:LinearMap.finrank_le_finrank_of_injective` | `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean` | An injective linear map into a finite module bounds the domain finrank by the codomain finrank. |
| `mathlib:LinearMap.injective_iff_surjective_of_finrank_eq_finrank` | `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean` | For finite-dimensional spaces of equal dimension, a linear map is injective iff surjective. |
| `mathlib:LinearEquiv.finrank_eq` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | A linear equivalence preserves finrank. |
| `mathlib:Complex.conjAe` | `Mathlib/LinearAlgebra/Complex/Module.lean` | Complex conjugation as an R-algebra automorphism, with its R-linear map for acceptance examples. |
| `mathlib:Complex.basisOneI` | `Mathlib/LinearAlgebra/Complex/Module.lean` | The real basis 1,I of C; supplies a counterexample when exact constants or fixedness is omitted. |
| `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean` | Audit boundary only: for an existing commutative Hopf algebra over a field, the point functor is naturally isomorphic to the tensor-automorphism functor of its finite comodules. It does not reconstruct a Hopf algebra from an arbitrary neutral category. |
| `mathlib:iterateFrobeniusEquiv` | `Mathlib/FieldTheory/Perfect.lean` | Iterated p-Frobenius equivalence on a perfect characteristic-p ring; its inverse supplies the inverse coefficient q-twist. |
| `mathlib:PowerSeries.map` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Coefficientwise ring homomorphism on formal power series, leaving the variable unchanged. |
| `mathlib:IntermediateField.adjoin` | `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean` | Native intermediate field generated by a set in an extension field. |
| `mathlib:RatFunc` | `Mathlib/FieldTheory/RatFunc/Defs.lean` | Native rational-function type, equivalent to the fraction ring of a polynomial ring. |
| `mathlib:Algebra.IsGeometricallyReduced` | `Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean` | Native geometric-reducedness class; over a field it means reducedness after algebraic-closure scalar extension and expresses general field-extension separability. |
| `mathlib:Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | Native general linear group as units of the square matrix ring. |
| `mathlib:AlgEquiv` | `Mathlib/Algebra/Algebra/Equiv.lean` | Native algebra equivalence with compatibility with the specified scalar map. |
| `mathlib:IsScalarTower` | `Mathlib/Algebra/Group/Action/Defs.lean` | Compatibility of successive scalar actions, used for the field and tensor towers. |
| `mathlib:Submodule` | `Mathlib/Algebra/Module/Submodule/Defs.lean` | Native submodule of a module, used for solution and degree spans. |
| `mathlib:Algebra.adjoin` | `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean` | Least native subalgebra containing a specified generator set. |
| `mathlib:Matrix.det` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Determinant of a finite square matrix over a commutative ring. |
| `mathlib:Algebra.TensorProduct.includeLeft` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | The left tensor-product algebra map sending a to a tensor 1. |
| `mathlib:Algebra.TensorProduct.includeRight` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | The right tensor-product algebra map sending b to 1 tensor b. |
| `mathlib:Ideal.map` | `Mathlib/RingTheory/Ideal/Maps.lean` | Extension of an ideal along a ring homomorphism. |
| `mathlib:Ideal.comap` | `Mathlib/RingTheory/Ideal/Maps.lean` | Contraction of an ideal along a ring homomorphism. |
| `mathlib:CommHopfAlgCat` | `Mathlib/Algebra/Category/CommHopfAlgCat.lean` | Native category of commutative Hopf algebras, used only after the Hopf structure is proved. |
| `tauceti:TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced` | `TauCeti/Algebra/AlgebraicGroup/Smooth/GeometricallyReduced.lean` | Finite-type geometrically reduced commutative Hopf algebras over a field are smooth; this is a group criterion, not a general scheme criterion. |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | Natural-valued finite rank of a module, used only with explicit finite-dimensional hypotheses. |
| `mathlib:Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean` | Native scalar span of a set. |
| `mathlib:MvPolynomial.aeval` | `Mathlib/Algebra/MvPolynomial/Eval.lean` | Multivariate-polynomial algebra evaluation into a specified algebra. |
| `mathlib:AlgebraicIndependent` | `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean` | Injectivity of multivariate-polynomial evaluation, the native notion of algebraic independence. |
| `mathlib:Algebra.trdeg` | `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean` | Cardinal-valued transcendence degree of an algebra. |
| `mathlib:ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | Krull dimension of a commutative ring, valued in the extended natural numbers with bottom. |
| `mathlib:AlgebraicGeometry.Spec` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The native scheme spectrum of a commutative ring; supplies Z=Spec Σ without a new scheme definition. |
| `mathlib:AlgebraicGeometry.IsClosedImmersion.spec_of_surjective` | `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean` | For commutative rings and a surjective ring homomorphism, Spec.map is a closed immersion; apply to the generator-evaluation map with codomain its image Σ. |

<a id="restructuring-proposals"></a>

## Restructuring proposals

- **rescope** (FiniteFieldsAndCharacterSums). The existing FF.4 Ore/composition theory is the single owner. Maurischat’s newly collated abelian/A-finite proof additionally requires generic valued-skew-field normal forms and Newton decomposition absent from its four reviewed nodes. Proposal: FiniteFieldsAndCharacterSums, Part II extends FF.4 with the complete valued-skew-field invariant-factor, Newton-decomposition and block-rank criterion of Maurischat §§3–4. DM.4 imports that extension and retains only the Anderson-module comparison. No new Drinfeld owner of Ore theory is introduced.

In addition, the rational pre-t-motive category should become a DM.4 definition target, and DM.8's layer-level citations of DM.4 then become target citations; see [The pre-t-motive category of DM.4](#gap-the-pre-t-motive-category-of-dm-4).

## Notes for the Tau Ceti maintainers

- **AlgebraicVectorBundles.** Current main L0B and L2B already own finite locally free/invertible sheaves, finite-projective affine comparison, pullbacks and totalSpace(E)=linearSpec(E∨). Exact imports replace SF.0 stage requests. JacobianChallenge A–C owns divisor twists and relative cohomology. No foundations are duplicated.
- **AdicSpaces.** Restricted-series and Tate-algebra foundations are imported here. DM.8/tate-analytic-interface now cites DM.2/c-infinity and the AdicSpaces/native restricted-series input. The Weierstrass, zero-count and entire-product inputs requested from AdicSpaces Layer 0 are now owned on TauCetiRoadmap main by RestrictedPowerSeries and NewtonPolygons (upstreamImports). Uniformizability and its exponential are defined in DM.4; the rigid-triviality comparison is an outgoing DM.8 consumer, avoiding a cycle.
- **IntegralHeckeAndGaloisDeterminants.** Its current Layer 6 already cites current Tau Ceti fittingIdeal, fittingIdeal_eq_minorsIdeal_ker, fittingIdeal_quotient_zero and fittingIdeal_baseChange. These declarations were read at Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; they are absent at the pinned f790474 build. DM.6 defines only monic finite-module cardinalities and imports their Fitting compatibility. The Suggested compatibility signature is explicitly omitted at the old pin rather than reimplementing Fitting ideals.
- **SchemeAndStackFoundations.** Review removed SF.2 as the claimed owner of strict finite F-module schemes/finite shtukas: current SF.2 is sites/cohomology. The exact shared realization is a gap for Part II. SF.4 was also replaced by actual SF.0 Proj/normalization and SF.1 quotient nodes; projective quotient and normal section-ring comparisons remain explicit extensions.
- **HeckeStacksAndLocalShtukas.** HS2 is not the equal-characteristic R\[\[z]] category used in Hartl §7. A precisely stated Part II/reassignment gap replaces both imports; retain local freeness, the characteristic residue factor and Frobenius q^deg(p).
- **FiniteFieldsAndCharacterSums.** RT-AREA-finitefields/13 is satisfied: FF.4 alone owns the commutative-coefficient Ore/composition comparison. The three older field-only evaluation/separability/subspace nodes keep their actual field hypotheses; they do not supply an arbitrary-ring theorem. Generic valued-skew-field Newton/invariant-factor theory is a Part II gap, not an existing FF.4 target.
- **FunctionFieldArithmetic.** Review bypasses broad FA.1/FA.2 supplier claims: finer existing packets do not provide the requested entire affine/Dedekind/completion foundation. Current AlgebraicCurves Layers 2, 3 and 5 own these inputs. Extra coefficient, norm and analytic quotient integration is recorded separately.
- **tauceti:TauCetiRoadmap/ReductiveGroupsPartII.** Current main RG2.3.7 and its Lang.lang_surjective signature already own the general finite-field Lang theorem. FA.0 is requested only to transport its GL_r specialization to the coefficient-Frobenius field/curve interface; DM.8 does not plan a second Lang theorem.
- **tauceti:TauCetiRoadmap/AdicSpaces.** Current Tau Ceti a91d3aa already provides the native univariate restricted-series norm and coefficient/Gauss-norm bounds in RingTheory/PowerSeries/TateAlgebra.lean, together with IsDistinguished.exists_isUnit_isMonicOfDegree_mul_eq, existsUnique_isUnit_isMonicOfDegree_mul_eq and isUnit_iff_isDistinguished_zero in Weierstrass/Preparation.lean, and isPrincipalIdealRing_isRestricted_subring plus noetherianity in Weierstrass/Ideal.lean. Reuse these complete ultrametric normed-field results. They postdate f790474 and must not be planned again. DM.8 still needs the C∞ normalized zero/pole comparison and bounded-disk entire zero/growth estimates.

## The suggested Lean file

The [suggested file](../suggested/DrinfeldModulesAndTModules.lean) joins the two parts' files under one note and one import block. It elaborates at the pins with `sorry` as its only warning. DM.0–DM.7 live in `TauCeti.Drinfeld`; DM.8 lives in `TauCeti.Difference.FixedVectors` and `TauCeti.Difference.Periods`, as the packets' library homes record. The coefficient twist `TauCeti.Difference.Periods.twistSeries` comes first because DM.2 states Ω's difference equation with it. Every definition, API item and unit test of the packets appears under its packet name, either as a declaration or an `example`, or in the closing comment, which lists the targets whose carriers (relative line bundles, moduli stacks, compactifications, completed realizations, elliptic sheaves, the pre-t-motive category) are not available at the pins, with their full statements here. The file states and does not develop; it claims no implementation.

For the roadmap package, the file's sorry-bodied data definitions (for example the Taelman exponential and class module, the finite-field nuclear determinant and the base change of dual motives) become README targets, as PACKAGE_REVIEW.md, "Shape of a roadmap", requires, and the DM.8 statements that restate the Carlitz exponential and logarithm by their series should use the DM.2 declarations `carlitzExp` and `carlitzLog` directly.

## Status

123 targets in nine layers: 59 definitions and constructions with 260 API items and 185 unit tests, and 64 theorems, lemmas and comparisons; 48 planets; 19 gaps and 15 supplier requests. Every layer is planned and none is closed. The two parts were accepted by the independent reviews REV-DrinfeldModulesAndTModules--DM.0 (11 October 2026) and REV-DrinfeldModulesAndTModules--DM.8~2 (14 October 2026); the changes of the [assembly](#assembly-reconciliation) await their own review.
