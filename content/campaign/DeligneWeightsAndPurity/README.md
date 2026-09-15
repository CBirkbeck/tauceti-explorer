# Deligne weights, purity and the Weil bounds

Construct the reusable proofs behind Deligne's Weil I and Weil II theorems. The
first endpoint is the Riemann hypothesis for **smooth projective** varieties over
finite fields. The later endpoint is the mixed-sheaf direct-image theorem, its
smooth proper consequences, geometric semisimplicity and absolute hard Lefschetz.
These are different theorems at different construction stages. Neither the trace
formula alone nor an abstract “Weil cohomology” structure proves the Weil bounds.

## Canonical ownership and coefficient conventions

Reuse the proposed PR196 scheme étale/constructible/ℓ-adic realization and trace
APIs, [EtaleDualityAndPerverseSheaves](../EtaleDualityAndPerverseSheaves/README.md)
EDC.0–4 for duality, cycle classes, blowups and **weak** Lefschetz, and
[LefschetzPencilsAndVanishingCycles](../LefschetzPencilsAndVanishingCycles/README.md)
LPV.0–5 for the actual local/global pencil geometry and monodromy. The generic
perverse category and IC carrier are EDC.5; IC-weight statements, relative perverse
hard Lefschetz and the BBD decomposition theorem are the **later EDC.7 owner**.
No EDC.7 theorem is an input to the original Weil I proof here.

AbelianSchemesAndArithmeticModuli A6 owns Rosati positivity and polarized isogeny
algebra. PR196 TraceFormula Layer8 owns the curve/Jacobian trace comparison.
This roadmap proves their weight consequences; it does not reconstruct them.
WeightsInEtaleCohomology R34's historical generic weight targets are transferred
here/EDC/LPV by the integration audit; its arithmetic application layer remains a
consumer. [WeilConjectures](../WeilConjectures/README.md) owns zeta-polynomial
integrality, ℓ-independence, functional equations and final endpoint packaging.

Fix a finite field k₀ with cardinality q=p^a, a>0, and ℓ≠p. Use its actual
field/cardinality API, not `ZMod q` as a field when q is not prime. Work first with
finite extensions of ℚ_ℓ and their algebraic closure, rational constructible
coefficients and bounded constructible complexes. Lattices and finite-level
torsion are imported for realization/comparison, but do not inherit a rational
weight filtration or semisimplicity theorem without a separate proof.

For the trace-formula operator use **geometric Frobenius**: ℚ_ℓ(1) has eigenvalue
q⁻¹ and weight −2. Prove comparison with q-power geometric Frobenius pullback and
the inverse arithmetic Galois action, rather than inferring it from a name. At a
closed point x use q_x=q^deg(x). Restriction from k₀ to k₀' of degree r raises the
operator/eigenvalues to r-th powers; both the base cardinality and eigenvalues
change. The integral-rational polynomial in WC uses this same operator.

Keep distinct: (i) algebraicity over ℚ; (ii) algebraic integrality; (iii) purity at
every complex embedding of an algebraic eigenvalue; (iv) ι-purity for a fixed,
not necessarily continuous, coefficient-field embedding/isomorphism into ℂ.
Weil II's ι-weights may be real. They do not automatically imply algebraicity or
integral weights. Statements for all embeddings are obtained with the algebraicity
and embedding-comparison arguments included, not by treating ℚ_ℓ as a subfield of
ℂ with compatible topology.

<a id="dwp-0"></a>
## DWP.0. Eigenvalue weights and functorial linear algebra

**Milestone:** `DWP.0`

Define Weil q-numbers of an integer weight on actual algebraic-number carriers and
their all-embeddings absolute-value property. Define the separate ι-weight
predicate on nonzero coefficient-field elements with real weights. Prove
independence of a finite splitting field, extension of embeddings, uniqueness of
weight for q>1, products, duals, tensor powers, Tate twists and finite-field base
extension. Integrality remains a separate predicate; q⁻¹ is pure of weight−2 but
is not an algebraic integer.

On an actual finite-dimensional vector space with an invertible endomorphism,
define weights via the roots of its characteristic polynomial over a splitting
field. Prove preservation under invariant subobjects, quotients and extensions,
charpolynomial multiplicativity, tensor/dual spectra and the reciprocal pairing
of eigenvalues induced by a Frobenius-equivariant perfect pairing. Use generalized
eigenspaces, not an assumed eigenbasis. Prove that different pure weights have
disjoint eigenvalue sets and hence no nonzero intertwiner. Include explicit
Jordan-block examples: purity controls absolute values, not Jordan blocks.

**Dependencies:** EDC.0 coefficient/Frobenius conventions; existing Mathlib
finite-dimensional linear algebra, polynomial roots and algebraic extensions.
**Sources:** Weil I §§1.4–1.7/3.1; Weil II §§1.2/1.6; no general weight theorem.

<a id="dwp-1"></a>
## DWP.1. Curves and abelian varieties: the initial Weil estimate

**Milestone:** `DWP.1`

For a polarized abelian variety over k₀, compare Frobenius and Verschiebung under
Rosati, prove π†π=[q], and apply A6's positivity to the commutative algebra generated
by π. Construct the argument that every complex embedding of a Frobenius
eigenvalue on the appropriate Tate realization has absolute value √q. Identify
exactly when the realization is the Tate module or its dual; normalize H¹ and
geometric Frobenius explicitly. Prove the finite-field characteristic polynomial
and realization comparisons needed in this argument, importing A6's generic
degree/endomorphism results and not assuming the Tate isogeny theorem as a shortcut.

Use the actual Abel–Jacobi/Picard correspondence and PR196 TraceFormula Layer8 to
identify H¹ of a smooth proper geometrically connected curve with its Jacobian
realization. Prove H⁰/H² weights, all-power point-count bounds and compatibility
under finite base extension. Treat disconnected curves by components/permutation
Frobenius rather than requiring every component to be rational over k₀. These
curve/abelian results are reusable early examples and inputs where the chosen
proof needs them; they are not disguised applications of DWP.4 or hard Lefschetz.

**Dependencies:** DWP.0; AbelianSchemesAndArithmeticModuli A2/A6; EDC.2–3;
JacobianChallenge and PR196 TraceFormula Layer8.
**Sources:** Weil's polarized-Jacobian argument; the supplied Freitag–Kiehl/Milne
curve discussion, checked against its actual Frobenius/duality conventions.

<a id="dwp-2"></a>
## DWP.2. Weil I's fundamental estimate, with its actual hypotheses

**Milestone:** `DWP.2`

Prove Weil I Theorem3.2 as a reusable local-system theorem. Here U₀ is an open of
ℙ¹ over k₀, F₀ is a nonzero lisse ℚ_ℓ-sheaf, it has a nondegenerate alternating
pairing F₀⊗F₀→ℚ_ℓ(−β) for β∈ℤ, its **geometric** monodromy image is open in the
corresponding symplectic group, and every local polynomial det(1−T F_x,F₀) has
rational coefficients. Prove that F₀ is punctually pure of weight β. Rationality
and open image are hypotheses of this general theorem and are separately proved
for pencil systems at DWP.3/LPV.5; neither follows merely from a pairing.
Keep the theorem over ℚ_ℓ or with an explicitly descended ℚ_ℓ-model. An image open
in Sp(V)(ℚ_ℓ) need not become open in Sp(V⊗E)(E) after a finite coefficient
extension; obtain the extended-coefficient conclusion by proved scalar extension,
not by reasserting the stronger open-image hypothesis.

Construct the even tensor-power argument: local trace powers are rational and
nonnegative after complex embedding; logarithmic derivatives and exponentiation
give nonnegative local Euler-factor coefficients. Prove the positive-series
coefficient/radius-of-convergence and meromorphic-pole lemmas used in §§3.3–3.6.
Prove the symplectic tensor invariant/coinvariant calculation by contraction
pairings (the required finite-rank invariant theory belongs here unless already
available from the representation owner). Use Poincaré duality to calculate
H²_c of these tensor powers and the actual trace formula to locate possible
global poles. Establish the resulting bound with an error tending to zero as the
tensor power grows; reciprocal eigenvalues from the pairing give the lower bound.

Prove Corollaries3.8–3.9 with their **coarse**, not final Weil II, weight intervals
for H¹_c(U,F) and H¹(ℙ¹,j_*F). Include algebraicity from rational local factors,
absolute convergence of the Euler product and the boundary exact sequence.
The half-unit error in the exponent is retained for the later tensor-power
argument; do not replace it with the desired final purity theorem.

**Dependencies:** DWP.0; EDC.0–2; PR196 TraceFormula Layers11/14 and compact support;
ordinary real/complex analysis and symplectic invariant theory.
**Sources:** Weil I §3, especially Theorem3.2 and Lemmas3.3–3.7.

<a id="dwp-3"></a>
## DWP.3. Pencil local-factor rationality and the radical quotient

**Milestone:** `DWP.3`

For a Lefschetz pencil on a smooth projective variety of **even total dimension**,
use LPV.5's odd-dimensional fiber monodromy. Construct the vanishing local system
E, its orthogonal E⊥ in middle cohomology, the radical E∩E⊥ and the quotient
E/(E∩E⊥). Prove all Frobenius/descent compatibility and identify the alternating
pairing and twist on this quotient. LPV.5 supplies absolute irreducibility/open
symplectic image when the quotient is nonzero; prove the hypotheses for that
application and handle the zero quotient separately.

Prove **Weil I Theorem6.2**, rationality of every local characteristic polynomial
of the quotient. This is not the already known rationality of the whole variety's
zeta function. Construct §6's comparison with geometrically constant factors,
finite families of eigenvalues and their powers, and the auxiliary compact
ℓ-adic group/density argument. Prove the needed product/eigenvalue separation
lemmas and the exceptional-root exclusions, retaining multiplicities and finite
base extension. Do not infer ℓ-independence of an arbitrary subquotient from a
rational alternating cohomological product.

Construct the function-field closed-point Chebotarev/density input in §6.13,
including conjugacy classes in finite étale quotients and the degree congruences
imposed by the constant-field extension. Use DWP.1's curve estimates on the
appropriate covers/twists to produce closed points with the required Frobenius,
and pass to density in the compact ℓ-adic image. Number-field Chebotarev is not
automatically this theorem. This curve-specific construction is owned here;
export it for future geometric monodromy/rationality consumers.
Prove the stronger measure/density conclusion needed by6.13: the Frobenius
classes in a closed Haar-measure-zero exceptional set have density zero, by
approximation with finite-quotient neighborhoods and the compatible
closed-point Dirichlet-density statement. Topological density alone does not
justify discarding a measure-zero set of exceptional eigenvalue conditions.

Apply DWP.2 to obtain Corollary6.3 for H¹ of the quotient's j_* extension. Retain
the radical and its geometrically constant terms: proving it is zero by hard
Lefschetz would introduce a circular dependency.

**Dependencies:** DWP.0–2; EDC.2–4; LPV.3–5; PR196 trace/rationality for the
underlying varieties, with no WC RH-polynomial factorization input.
**Sources:** Weil I §§5.8–5.11/6.1–6.13.

<a id="dwp-4"></a>
## DWP.4. Weil I: dimension induction and tensor-power removal of the error

**Milestone:** `DWP.4`

Prove Weil I Lemma7.1 by induction on even dimension, with the intermediate bound
q^(d/2−1/2)≤|α|≤q^(d/2+1/2) on middle cohomology. Descend/extend the chosen
projective embedding, pencil, singular values and vanishing cycles after a finite
extension, and prove transfer back by taking powers of Frobenius. Use the blowup
cohomology comparison and Leray spectral sequence. Analyze all three contributing
terms H²(base,R^(d−2)), H¹(base,R^(d−1)) and H⁰(base,R^d), including the zero
vanishing-cycle case and the nonzero-radical filtrations of §7.1. Subquotient weight
bounds do not require degeneration or a splitting of that spectral sequence.

Apply Künneth to even Cartesian powers X^k: α^k occurs in middle degree kd, and
the fixed half-unit error becomes 1/(2k). Prove the real-analysis limiting step
to obtain |α|=q^(d/2), algebraicity and every complex conjugate, not just one
chosen embedding. Reduce arbitrary cohomological degrees to middle degree by
**weak** Lefschetz, duality and smooth hyperplane sections; handle components and
finite-field descent. Export Weil I Lemma1.7 for every smooth projective X₀.

This stage does not use DWP.5–9, a general pure-direct-image theorem, an invariant
cycles result whose proof needs hard Lefschetz, BBD decomposition, or arithmetic
Frobenius semisimplicity. WC may now separate roots by weight and prove integer
cohomological factors independent of ℓ using Weil I's argument1.7⇒1.6. General
smooth **proper nonprojective** varieties belong to the later DWP.7 consequence.

**Dependencies:** DWP.3; EDC.2–4; LPV.0–5; PR196 Künneth, Leray and ℓ-adic realization.
**Sources:** Weil I §7, with the explicit non-hard-Lefschetz dévissage on page300;
§1.6–1.7 supplies the WC handoff.

<a id="dwp-5"></a>
## DWP.5. Weil II local weights and the analytic preparation

**Milestone:** `DWP.5`

Construct punctually ι-pure/ι-mixed lisse and constructible sheaves, their finite
filtrations and weight classes modulo ℤ. Work with genuine finite coefficient
fields/lattices before extending scalars; distinguish Weil descent from continuous
Galois descent. Prove the coefficient-embedding and twist reductions used when
weights are real. A formal real twist is not automatically a motivic Tate twist.

Import LPV's inertia, nilpotent logarithm and monodromy-filtration carriers. Prove
the local weight theorem for a punctually pure lisse sheaf on an open curve,
including the weights of the monodromy graded pieces and the weights of boundary
invariants of j_*F. Include quasi-unipotent reduction, finite covers, tensor and
dual compatibility and the Frobenius–N relation. State the curve/equal-
characteristic hypotheses; this is not the general mixed-characteristic
weight–monodromy conjecture for varieties over a p-adic field.

Construct Weil II's generalization of the fundamental estimate for ι-real
systems, irreducible constituents and compatible pairings, then the
Hadamard–de la Vallée-Poussin positivity argument and the strict initial H¹ weight
bound needed to start §3.2. Prove convergence, poles, multiplicities, tensor-power
compatibility and the weight-integrality detection step. The boundary estimates
and strict bound are proved here, not imported from DWP.7's desired result.

**Dependencies:** DWP.0/DWP.2/DWP.4; EDC.1–2; LPV.0–2; PR196 sheaf L-functions.
**Sources:** Weil II §§1.2–1.11/2.1–2.2, especially1.8.4 and2.2.10.

<a id="dwp-6"></a>
## DWP.6. Pure local systems on curves and the square-improvement argument

**Milestone:** `DWP.6`

For j:U₀↪C₀ with C₀ smooth proper and F₀ lisse punctually ι-pure of weight w,
prove H^i(C,j_*F) pure of weight w+i (Weil II3.2.3). Reduce via finite covers to
the stated unipotent/tame situation, proving trace-splitting and the resulting
injection/direct-summand statements with ℚ_ℓ coefficients. Prove the correct
duality for j_*F; do not substitute Rj_*F without its boundary comparison.

Construct the external-product system on C×C and a sufficiently general pencil
after finite base extension. Import LPV's geometric existence and local
vanishing-cycle operations; prove the **coefficient-specific** local calculation
of Weil II3.1 for the possible singularities of this sheaf. Analyze Leray and
the weight-integral constituents of R¹f_*. The constant constituents on ℙ¹
contribute no H¹. Use the strict initial estimate of DWP.5 and the §3.2 iteration
δ↦δ/2, with all inequalities/rounding justified, to get the sharp upper bound.
Apply duality to get the matching lower bound. No general Rf_! bound is assumed.

Export both the fixed-ι real-weight theorem and the algebraic all-embeddings
integer-weight theorem. Retain the boundary monodromy weights needed to pass from
j_*F to compact support on U.

**Dependencies:** DWP.5; EDC.1–4; LPV.0–5; PR196 Künneth/base change/Leray.
**Sources:** Weil II §§3.1–3.2, including3.2.3–3.2.15.

<a id="dwp-7"></a>
## DWP.7. The fundamental direct-image theorem and sharp cohomological bounds

**Milestone:** `DWP.7`

For a separated finite-type morphism f:X₀→Y₀ over a finite field and a mixed
constructible rational sheaf F of weights≤w, prove R^i f_!F mixed of weights≤w+i.
Construct Weil II3.3.1's dévissage in sheaf, source and target, finite/universal-
homeomorphism reductions, generic smooth relative curves, finite covers and
spreading out of the boundary. Verify all finiteness and base-change hypotheses
at each step and propagate bounds through exact sequences/Leray. Give the
corresponding fixed-ι real-weight version, including the allowed weights moduloℤ;
do not infer integer weights from that version alone.

Deduce H^i_c(X,F) weights≤w+i. For X₀ smooth and F lisse of weights≥w, use
Poincaré duality to prove H^i(X,F) weights≥w+i. Therefore for smooth X and lisse
pure F the image of H^i_c→H^i is pure of weight w+i; for smooth **proper** X the
whole H^i is pure. State all smoothness/lissity assumptions: a pure stalk
condition on an arbitrary singular-space sheaf does not by itself give the same
ordinary-cohomology lower bound.

For constant coefficients export the smooth proper nonprojective extension used
by WC (3.3.9). Integrality and the extra lower bounds0 and2(i−dim X) in3.3.3–4
require the separately supplied integrality/denominator theorem of SGA7 XXI5;
prove that theorem's exact application or omit the extra bound from a consumer.
ι-mixed real-weight sheaves do not inherit those integrality conclusions.

**Dependencies:** DWP.6; EDC.1–2; PR196 constructibility, proper/base-change,
compactification and cohomological dimension. SGA7 XXI5 is an explicit additional
source for the optional integral-eigenvalue refinement, constructed here when used.
**Sources:** Weil II3.3.1–3.3.11.

<a id="dwp-8"></a>
## DWP.8. Mixed complexes, weight filtrations and geometric semisimplicity

**Milestone:** `DWP.8`

On the existing bounded constructible derived category define K of weights≤w
by H^i(K) having stalk weights≤w+i; define weights≥w by DK of weights≤−w,
using EDC.1's actual dualizing complex. Purity means both bounds. Prove that
F[m] tensor ℚ_ℓ(r), for pure lisse F of weight w, has complex weight w+m−2r on the smooth
base. A stalkwise pure sheaf on a singular base need not be pure in this duality
sense. Keep ordinary cohomological and perverse indexing distinct.

Prove stability of the mixed category under six operations with finite-type and
coefficient hypotheses, then the directional estimates: f* and Rf_! preserve
upper weights; f^! and Rf_* preserve lower weights; duality reverses weights;
tensor products add upper bounds; internal Hom takes upper/lower to the
corresponding difference lower bound. Proper direct image preserves purity by
duality. Derive these estimates from DWP.7 and the actual comparison morphisms,
not assumed exactness of a six-functor package. Do not claim both bounds are
preserved by every functor or that every pure complex splits canonically.

Prove Weil II3.4.1: weight-class decomposition moduloℤ; the unique functorial
strict weight filtration on lisse mixed sheaves with integral weights; and
geometric semisimplicity for punctually ι-pure lisse sheaves on a **normal** base.
Construct the Ext¹/Hochschild–Serre comparison and use the H¹ lower bound to kill
geometrically nontrivial extensions of equal weights. The conclusion is after
base change to the algebraic closure. Nontrivial unipotent Frobenius on a constant
geometric sheaf over Spec(k₀) is a counterexample to arithmetic semisimplicity.
In particular, purity does not prove Frobenius semisimple on arbitrary smooth
proper cohomology.

**Dependencies:** DWP.7; EDC.0–2; ArithmeticGaloisDuality R02.2 for the shared
continuous Hochschild–Serre comparison; no EDC.7 decomposition input.
**Sources:** Weil II3.4.1–3.4.13,6.1.1–6.1.12,6.2.1–6.2.6.

<a id="dwp-9"></a>
## DWP.9. Absolute hard Lefschetz after weights

**Milestone:** `DWP.9`

For X projective smooth of pure dimension d over an algebraically closed field
of characteristic≠ℓ and an ample line bundle L, construct η=c₁(L) and prove
η^r:H^(d−r)(X,ℚ_ℓ)→H^(d+r)(X,ℚ_ℓ)(r) is an isomorphism. Reduce to very ample
L and a suitable pencil. Use induction, restriction/Gysin adjunction and weak
Lefschetz; prove nondegeneracy on the invariant part from **geometric** complete
reducibility. The invariant-cycle input is LPV's late theorem proved using
DWP.7–8, or the precisely scoped lower-dimensional induction statement of
Weil II4.1.3; it must not assume the d-dimensional hard Lefschetz conclusion.
For arbitrary algebraically closed ground fields prove spreading out and smooth
proper base change from the finite-field result instead of assuming every object
has a finite-field model.

Prove the source-qualified extension for a pure lisse coefficient system using
Weil II6.2.13. More generally, construct the absolute theorem for a projective
X and a potentially pure bounded complex K satisfying both explicit
support-dimension inequalities below; specify a genuine model witnessing
potential purity and retain the shift n. Do not replace those bounds by an
unqualified statement for every pure complex. EDC.7 constructs pure IC complexes
and relative perverse hard Lefschetz/decomposition from these prerequisites; it
is not a dependency of this absolute proof.

Precisely, for every j require dim Supp H^j(K)≤n−j and
dim Supp H^j(DK[−2n])≤n−j, with dim∅=−∞. For every integer r≥0 prove the
actual cup-product map η^r:H^(n−r)(X,K)→H^(n+r)(X,K)(r) is an isomorphism.
The Tate twist is restored from the source's temporary geometric trivialization.

Export primitive Lefschetz decompositions, nondegenerate primitive pairings and
odd-Betti parity under the appropriate smooth projective hypotheses. This is
hard Lefschetz, not the Hodge-standard positivity conjecture in positive
characteristic; no algebraic inverse Lefschetz correspondence is asserted.

**Dependencies:** DWP.7–8; EDC.2–4; LPV.7:invariant-cycles, whose proof imports
DWP.7–8 but not this stage; no EDC.7 theorem.
**Sources:** Weil II4.1.1–4.1.6,4.3,6.2.8–6.2.13; SGA7 XVIII/XIX for the
explicit induction-compatible pencil comparison.

<a id="dwp-10"></a>
## DWP.10. Arithmetic interfaces and acceptance checks

**Milestone:** `DWP.10`

Export weight statements for actual Hecke-stable cohomological subquotients,
coefficient extensions, duals and Tate twists to R34.6 and the automorphic Galois
owners. Separate a proved weight from compatibility/algebraicity across different
ℓ: the latter needs a rational compatible realization or the WC factor theorem,
not arbitrary eigenspace selection. Provide point-count error bounds only after
the relevant degree-zero/top-degree and component contributions are identified.

Supply LPV's late invariant-cycle and semistable-curve applications with exact
weight/monodromy statements. Equal-characteristic curve-local monodromy purity,
semistable-curve weight calculations, and general p-adic weight–monodromy are
distinct. The last is not assumed or made a universal theorem target here.

Acceptance examples: ℙ^n; a smooth proper curve and Jacobian; ℂ-valued conjugate
weights of a quadratic Weil number; ℚ_ℓ(1) with weight−2; a pure system with a
nonsemisimple arithmetic Frobenius; G_m with different ordinary/compact-support
weights; a nodal degeneration with its graded monodromy weights; and a smooth
proper nonprojective input using DWP.7 rather than DWP.4. Check every Tate twist,
cohomological shift and finite-field base change on the same public realization.

**Dependencies:** DWP.4/DWP.7–9; LPV late applications and existing arithmetic
realization owners, as consumers rather than foundational inputs.

## Sources, planning evidence and Lean seeds

Weil I, Publications IHÉS43 (1974),273–307,
and Weil II, IHÉS52 (1980),137–252, are
the primary theorem contracts. Page/section references above were checked against
the acquired source text, including the explicit avoidance of hard Lefschetz in
Weil I §7. The supplied SGA4, SGA4½, SGA7II and BBD files support the named EDC/LPV
interfaces; the source registers remain owned by the campaign integrator.

The user's `upstream/WeilConjectures` snapshot is useful planning evidence, not a
mathematical authority or an importable implementation. Its packets and
Freitag–Kiehl/Milne copies help locate proof dependencies. Placeholder `True`
endpoints, an arbitrary cohomology axiom package, `ZMod q` for prime-power q and
unverified claims of completed proof are not carried into this roadmap. No private
repository file is modified or republished.

Suggested.lean contains actual algebraic-number, norm, polynomial
and matrix interfaces. `sorry` denotes an unproved roadmap theorem. Missing
advanced sheaf/cohomology carriers are precise construction contracts in comments,
not axioms or unconstrained proposition fields asserting the desired conclusion.

## Completion contracts added on 2026-09-15

**Applies to:** `DWP.2`, `DWP.3`, `DWP.4`, `DWP.7`, `DWP.8`, `DWP.9`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Decompose DWP.3's density step into finite quotient Chebotarev with constant-field congruences and approximation of a closed Haar-null exceptional subset by open neighborhoods. DWP.4 must list the three Leray contributions and their inherited filtrations, including the zero-cycle/radical cases. In DWP.7 identify the map in each support-devissage triangle and track the weight shift through the curve reduction.

### Producer–consumer contract

Each weight output records arithmetic versus geometric Frobenius, fixed embedding versus all embeddings, cohomological degree, and coefficient field. The hard-Lefschetz output is the cup-product map with both support bounds from Weil II 6.2.13; purity alone does not select an inverse algebraic correspondence.

### Acceptance and source route

A pure Jordan block, G_m with different H^1 and H_c^1 weights, a finite constant-field extension and the radical quotient of a pencil are mandatory independent tests.

**Source route:** Weil I 5.8–5.11/6.13/7; Weil II 3.3.1 and 6.2.13. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
