# Roadmap: automorphic bundles and classical automorphic forms

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose

Construct algebraic automorphic vector bundles, their canonical and subcanonical extensions, and their spaces of sections on Shimura varieties. Supply an intrinsic coefficient formalism usable by both classical and p-adic constructions. Explicitly identify the modular and Hilbert Hodge bundles and their weight conventions.

The references are Milne's *Canonical Models of (Mixed) Shimura Varieties and Automorphic Vector Bundles*, Harris's work on canonical extensions, and Lan's treatment of automorphic bundles; Lan's example-based introduction §4.2.7 describes the distinction between toroidal and minimal compactifications. The Tannakian torsor formulation is chosen to support Hodge–Tate comparison and vector-valued weights.

## Inputs and conventions

Consume D3, V4–V8, C0–C6, and A4–A5 where a moduli interpretation is used. Use the common torsor and associated-bundle construction from ReductiveGroups. The base of definition includes the reflex field and the field needed to define the coefficient representation. A complex representation or highest weight is not automatically defined over the reflex field.

Account for the central subgroup acting ineffectively on the arithmetic quotient. Construct the standard central quotient `Gᶜ` used for canonical automorphic bundles, together with its maps and the criterion for a representation to factor through it. Equivalently, at a fixed quotient verify trivial action of the actual ineffective stabilizers. Define `Z_s(G)` as the minimal central subtorus for which `Z(G)°/Z_s(G)` has equal split ranks over `ℚ` and `ℝ`, prove existence and uniqueness, and put `Gᶜ=G/Z_s(G)`, following Lan §5.3. It is not the whole centre of `G`.

The Hodge-filtration parabolic, the opposite parabolic used in the Hodge–Tate convention, and their common Levi are related by named maps. They are not identified by using the letter `P` for all three.

## Milestones

<a id="b0"></a>

### B0. Associated bundles and coefficient descent

**Dependencies:** D3 and the torsor supplier.

Import the generic associated-bundle construction for torsors and representations from ReductiveGroupsPartII, including tensor products, duals, determinants and pullback. Prove the geometric/analytic descent comparison for the canonical automorphic torsors used here. Prove the equivariant-function description of sections with the chosen left/right action. Extend the construction to representations over coefficient extensions with semilinear descent data.

Construct the equivariant bundles on the compact dual, the homogeneous Hodge torsor over the complex domain, and the descended analytic bundle at a neat level. Prove exactly when a coefficient descends through the ineffective central subgroup or a finite coarse quotient. A coherent pushforward to a coarse space is not assumed locally free.

<a id="b1"></a>

### B1. Canonical principal bundles over number fields

**Dependencies:** B0, V4 and the relevant class-specific V8 instance, A4–A5. The general-data instance also uses V7; the Hodge/abelian instances do not.

Construct the canonical principal bundle and its filtration reduction over the appropriate number field. The proof includes the special-point/CM description, compatibility with Hecke actions, algebraicity, and descent. In Hodge type, construct the tensor description using the Betti, de Rham, and étale realizations of Hodge tensors. Prove the required absolute-Hodge and comparison statements rather than identifying arbitrary Hodge classes with algebraic cycles.

Prove the Hodge- and abelian-type instances before the general instance; those are sufficient for the Hilbert construction. For general data, additionally consume V7 and implement the canonical principal-bundle theorem in Milne's formulation, including its compatibility with connected components and conjugation. This is a new theorem beyond the existence of the base canonical model. The base variety being defined over the reflex field does not itself descend an arbitrary analytic vector bundle.

<a id="b2"></a>

### B2. Automorphic bundles and realizations

**Dependencies:** B1.

Define the bundle attached to an algebraic representation of the appropriate parabolic/Levi form, construct its canonical-model descent, and compare it with B0's analytic bundle. Define the local system attached to a representation of `Gᶜ` and its de Rham bundle with integrable connection and Hodge filtration. Prove the tensor and Hecke compatibilities needed by T6.

A representation of the Levi gives a holomorphic automorphic bundle; a representation of the whole group gives extra flat-connection structure. Do not assign that extra structure to every automorphic bundle. Include both the highest-weight description over a splitting field and the coordinate-free construction over its actual coefficient field.

<a id="b3"></a>

### B3. Canonical and subcanonical extensions

**Dependencies:** B2 and C1–C6.

Construct the canonical extension on a toroidal compactification through its degeneration charts and prove gluing. For the reduced boundary divisor `D`, construct the subcanonical extension `𝒱ᶜᵃⁿ(-D)`. Prove compatibility with refinements and independence of spaces of sections from the chosen sufficiently fine admissible fan. Establish extension of the logarithmic connection for bundles coming from whole-group representations.

Define the pushforward to the minimal compactification as a coherent sheaf and prove the exact properties used later. It is not generally a vector bundle. Where a line bundle does descend as an invertible sheaf, state and prove that additional result separately.

<a id="b4"></a>

### B4. Classical forms and explicit weights

**Dependencies:** B3, H0–H4 for the Hilbert bundle identification, and ModularForms. H5 is a subsequent assembled example test; it is not a prerequisite of B4.

Define classical modular and cuspidal forms as sections of the canonical and subcanonical extensions. Prove the analytic transformation-law comparison, including the growth condition and the actual cocycle identity `j(γ₁γ₂,z)=j(γ₁,γ₂z)j(γ₂,z)` for a left action. Derive the appropriate right-action formula rather than reusing it unchanged.

For `GL₂`, identify the Hodge line and show that its k-th tensor power recovers the established weight-k modular forms after the specified level, coefficient, and cusp conditions. For Hilbert varieties over a splitting coefficient field, identify the factors `ω_τ`, determinant twists, and the parity/central-character condition for arithmetic weights. Before splitting, define the same coefficient using `𝒪_F⊗𝒪`-linear tensors and descent.

For Siegel data, identify the Hodge vector bundle, its determinant, and Schur-functor weights. For a unitary PEL example, calculate the Hodge summands and Levi representation. These examples must use the generic bundle construction, not private definitions later declared isomorphic without preserving operations.

<a id="b5"></a>

### B5. Hecke action and Fourier expansions

**Dependencies:** B3–B4 and the correspondence/trace suppliers.

Construct pullback, coefficient identification, and trace along Hecke correspondences. State all scalar normalizations and prove composition against the existing abstract Hecke algebra. Treat non-neat levels through equivariance/descent, not division by a group order that may be noninvertible.

Construct q-expansions at modular and Hilbert cusps and Fourier–Jacobi expansions at the relevant higher-dimensional boundary components. Prove the expansion principle with the necessary connectedness, base, and coefficient assumptions. Identify cuspidality with the appropriate boundary vanishing condition. These expansions provide normalization tests for the p-adic comparison, not a new definition unrelated to the sheaves.

## Completion conditions

Classical forms are usable over number fields and the specified integral PEL/Hilbert models; all coefficient-field restrictions are visible. The bundles have functorial tensor, dual, pullback, Hecke, and boundary APIs. The elliptic and Hilbert comparison theorems identify the actual differential bundles used in the moduli problems. General locally analytic weights are not defined by pretending they are algebraic representations; that is the work of OverconvergentAutomorphicForms.


## Implementation handoff: Coefficient descent and boundary extension

**Stages:** B0, B1, B2, B3, B5. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct the coefficient representation over its field of definition, verify triviality on the ineffective center, and form the associated sheaf from the actual canonical torsor. Record Hodge versus opposite-Hodge–Tate parabolics and the named comparison. For every boundary chart construct the canonical extension and its subcanonical boundary twist before proving refinement invariance.

**Acceptance and consumer contract.** Compare GL₂ weight k and a nonscalar Siegel representation, including Hecke pullback/trace normalization. A Levi representation supplies no automatic flat connection. Pushforward to the minimal compactification is tested as coherent before any stronger locally-free claim. When coefficients have torsion, finite-quotient descent cannot use averaging by a nonunit group order.

## Source anchors and prototype coverage

- AutomorphicBundles source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

<a id="stage-B1.general"></a>

## B1.general. General-data completion interface

**Dependencies:** B1 and ShimuraVarieties V7.

Prove the general canonical principal-bundle/conjugation theorem described in B1, beyond the early Hodge/abelian case.

<a id="stage-B2.general"></a>

## B2.general. General-data completion interface

**Dependencies:** B2 and B1.general.

Construct associated bundles and realization comparisons from the general canonical principal bundle, with its actual G^c representation category.

<a id="stage-B3.general"></a>

## B3.general. General-data completion interface

**Dependencies:** B3, B2.general and ShimuraCompactifications C3.general.

Construct canonical/subcanonical extensions for the general-data bundle on its toroidal compactification, retaining the logarithmic connections and comparison maps.
