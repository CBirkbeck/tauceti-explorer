# K-theory of curves and elliptic curves

Scheme and K-theory Part II of EllipticCurves.

## Canonical ownership and interfaces

- The general regular-curve rank/determinant theorem is KTheoryLowDegrees Z.5; E.2 specializes it through the origin-dependent Picard dictionary.
- General integral models and degeneration machinery are supplied by StableReduction and the campaign's semistable-model owners. Here construct the regular arithmetic surface and prove the K-theoretic vertical-residue/model-independence comparisons.

**Campaign dependencies:** [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md), [SchemeKTheoryOperations](../SchemeKTheoryOperations/README.md), [KTheoryLowDegrees](../KTheoryLowDegrees/README.md), [K2SymbolsBrauer](../K2SymbolsBrauer/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** E. **Dependencies:** K, S, T, V, M; AlgebraicCurves, EllipticCurves, and the finite locally free/coherent-sheaf interfaces. **References:** Weibel V; Handbook II.2 and II.3; Bloch, *Higher regulators*, Lectures 8–11; Thomason–Trobaugh.

The objects are schemes and their perfect complexes. The K-theory of the affine Weierstrass coordinate ring, the K-theory of the function field, and the K-theory of the proper elliptic curve are three different objects, connected by localisation maps.

## E.1 — The scheme and the existing elliptic-curve carriers

For an elliptic Weierstrass equation over a field F, construct its smooth projective scheme with the specified section at infinity. Prove the affine-chart equations, smoothness, properness, geometric connectedness, regularity and the identification of its function field. Compare scheme-valued F-points and their group law with the existing Weierstrass point group.

Construct the comparison between the existing function-field isogenies and the corresponding scheme morphisms; include the zero morphism separately, since it does not induce a function-field embedding. Identify the degree, separability, kernels, pullbacks of divisors and invariant differentials under this comparison.

AlgebraicCurves remains the owner of general places, divisors and the regular-projective-curve/function-field dictionary. E supplies the elliptic scheme specialisation and the comparison with EllipticCurves. Neither roadmap currently supplies all this merely by having an arithmetic point group.

## E.2 — K₀ of a curve and of an elliptic curve

Import KTheoryLowDegrees Z.5's rank–determinant isomorphism for a connected regular noetherian curve X with the stated finiteness assumptions

\[
 K_0(X)\xrightarrow{\sim}\mathbb Z\oplus\operatorname{Pic}(X).
\]

Identify the class of a closed point, the class of a line bundle, the degree map, Euler characteristic and pushforward to the base. On an elliptic curve with its rational origin, prove the Picard decomposition by degree and the identification `Pic⁰(E)≃E(F)`. Consequently obtain the group description

\[
 K_0(E)\simeq\mathbb Z\oplus\mathbb Z\oplus E(F).
\]

State that this is a group isomorphism with the chosen origin; provide the multiplication induced by tensor product rather than interpreting the right side as a product ring. Rationality of the origin is used in the Picard comparison and descent. Do not identify every Galois-invariant geometric line-bundle class with a line bundle over F without controlling its descent obstruction.

## E.3 — Localisation in degrees zero through three

Construct the map-level localisation sequence for all closed points x of X, not just F-rational points. For a smooth integral curve with function field F(X), include the segment

\[
\begin{aligned}
 K_3(X)&\longrightarrow K_3(F(X))
 \longrightarrow\bigoplus_xK_2(k(x))
 \longrightarrow K_2(X)\longrightarrow K_2(F(X))\\
 &\xrightarrow{\partial}\bigoplus_x k(x)^\times
 \longrightarrow K_1(X)\longrightarrow F(X)^\times
 \xrightarrow{\operatorname{div}}\bigoplus_x\mathbb Z\\
 &\longrightarrow K_0(X)\longrightarrow\mathbb Z\longrightarrow0.
\end{aligned}
\]

The boundary on symbols is T's tame symbol with the same order/sign convention. Give exactness at each term and naturality for open immersions and finite maps, including residue-field norms and ramification multiplicities.

The kernel of the tame-symbol map on K₂(F(X)) is the **image** of K₂(X), not necessarily K₂(X) itself. Over a number field, each K₂(k(x)) is torsion, so restriction becomes injective after tensoring with Q. Over a finite field each K₂(k(x)) is zero, giving an integral injectivity theorem in that case. These are comparison theorems, not definitional identifications.

## E.4 — K₁, SK₁ and the coniveau description of K₃

For a proper geometrically connected curve with `H⁰(X,O_X)=F`, identify the image of K₁(X) in F(X)× with F×. Define the curve's SK₁ as the kernel of this map to F×, and identify it with the cokernel of the preceding tame-symbol map. Prove the constant-unit splitting and the compatibility with a rational base point. Keep this curve invariant distinct from the stable-matrix SK₁ of an affine ring.

For K₃, construct the two-column coniveau spectral sequence of a curve, its filtration and the exact sequence between the cokernel of residues from K₄(F(X)) to the sum of K₃(k(x)) and the kernel of residues from K₃(F(X)) to the sum of K₂(k(x)). Prove that these maps agree with the localisation sequence. Do not drop the left filtration term.

Apply S's Adams operations and M's rational motivic comparison. Export the weight components as actual eigenspaces/subquotients, with finite-coefficient versions and all base-change maps. In particular, distinguish the field's indecomposable K₃ contribution from the additional geometry of the curve.

## E.5 — Functoriality and initial examples

Construct K-theory pullback for arbitrary scheme morphisms and pushforward for the proper perfect morphisms used here; compare finite flat maps with transfer of modules. Prove projection formulas. For an isogeny, compute the pull–push composite using its degree and the appropriate K₀ class of the finite locally free algebra; reduce it to multiplication by the degree only under a proved condition making that class equal to its rank.

This qualification matters: the general projection formula is `f_*f^*(a)=[f_*O_X]·a`, not automatically `deg(f)·a` in integral K-theory. Prove the rational or special elliptic simplifications where they apply.

Compute P¹ using the projective-bundle theorem, and an elliptic curve over a finite field using the Frobenius action on its Jacobian/Tate module. Recover `K₁(E/F_q)≃F_q×⊕F_q×`, the finite positive-degree groups and their prime-to-characteristic property through the precise finite-curve theorem. The proof of that theorem includes its finite-generation, cohomology and Frobenius inputs; it is not a consequence of the finite-field calculation alone.

## E.6 — Arithmetic surfaces and the integral part

Construct a regular proper flat model 𝓔 over O_{F,S} of E/F. Supply the required arithmetic-surface resolution/minimal-regular-model results, local charts, vertical components and intersection multiplicities. A smooth group scheme of finite type such as a Néron model is not a substitute for a proper regular model; a singular Weierstrass model requires G-theory or a resolution before using a regular-scheme comparison.

Define the rational integral part by

\[
 K_2(E)_{\mathbb Z,\mathbb Q}
 =\operatorname{im}\bigl(K_2(\mathcal E)\otimes\mathbb Q
                         \longrightarrow K_2(E)\otimes\mathbb Q\bigr)
\]

for a model over the full arithmetic base, and define the S-integral variant separately. Prove model independence by comparison of regular models and the blow-up/localisation formulas with their exact hypotheses. Establish the equivalent vertical-residue description where applicable, using the residue fields of vertical components and the codimension-two compatibility.

An unramified symbol on the generic curve need not be integral on an arithmetic model. A rational subspace called the “integral part” is not automatically a finitely generated integral lattice. Prove lattice properties only in the precise subspace and theorem where they are available.

## E.7 — Certified symbol constructions

Represent a candidate by a finite sum `∑{f_i,g_i}` in K₂(F(E)), with rational functions from the existing coordinate/function-field API. Compute divisors and local leading units. Produce finite-support certificates that the product of tame symbols is one at every closed point; prove all unlisted points have zero valuations. Where a class in the integral part is required, also supply the vertical certificates.

Construct rational functions attached to torsion divisors by the Picard/Riemann–Roch criterion, not by an assumed existence field. Formalise Bloch's Proposition 10.1.1: when the divisors are supported on rational C-torsion, multiplication by C and explicit constant-symbol corrections remove the tame residues. Construct his classes S_a with their independence modulo torsion and constants. Over number fields this yields rational K₂ classes through E.3.

For non-rational torsion points, pass to a finite extension where the construction is defined, then use transfer and prove the corresponding norm/descent formulas. A Galois-invariant formal expression is not automatically the restriction of an integral K₂ class. The regulator comparison for these constructions is ER's responsibility.

## E.8 — Completion criterion

For every elliptic curve covered by the general scheme construction, the public API supplies K₀, K₁, K₂ and K₃ from the same K-theory functor; the K₀ computation; localisation and coniveau descriptions; functoriality; and rational and arithmetic-integral symbol interfaces. At least one nontrivial symbol certificate, one non-rational closed-point residue, and one bad-fibre integrality calculation must be worked out.

No target here asserts finite generation or a complete explicit abstract-group classification of every K-group of every elliptic curve over a number field. The programme develops the general groups and proves the specific structural, construction and regulator theorems stated here and in ER.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-curvek"></a>

**KU-curvek — Curve K0–K3 and localisation.** Readiness checkpoint for original `curvek`: verify completion and map-level compatibility of [EllipticKTheory:E.1](README.md), [EllipticKTheory:E.2](README.md), [EllipticKTheory:E.3](README.md), [EllipticKTheory:E.4](README.md), [EllipticKTheory:E.5](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `schemek`, `k2classical`, `blochk3`, `finitegeneration`, `tate2`. 

<a id="stage-KU-models"></a>

**KU-models — Regular arithmetic models and integral parts.** Readiness checkpoint for original `models`: verify completion and map-level compatibility of [EllipticKTheory:E.6](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `curvek`, `operations`. Includes resolution/comparison of arithmetic surfaces and bad fibres.

<a id="stage-KU-symbols"></a>

**KU-symbols — Explicit elliptic symbol classes and transfer.** Readiness checkpoint for original `symbols`: verify completion and map-level compatibility of [EllipticKTheory:E.7](README.md), [EllipticKTheory:E.8](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `curvek`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `E.3` | Produce the torsion-kernel proof from the preceding direct sum of residue-field K2 groups; distinguish an integral lift from a rational lift of a tame-unramified symbol. |
| `E.6` | For each regular-model modification prove invariance of the rational integral image using blow-up/localization. Record vertical components and the codimension-two relation controlling their residues. |
| `E.7` | Construct torsion-divisor functions with Riemann–Roch, then correct horizontal tame symbols, then test vertical residues; transfer only after proving the norm diagram. |

**Producer–consumer handoff.** EllipticRegulators ER.2 uses the rational K2 lift and torsion-killing real regulator; ER.6 requires the additional arithmetic-model membership proof.

**Acceptance.** Work one non-rational closed point and one bad fibre. Compare isogeny pull–push with [f_*O] multiplication before any degree simplification.

**Source-readiness boundary.** Source-qualified finite-curve K-group computations and regular-model independence require separate full proofs.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
