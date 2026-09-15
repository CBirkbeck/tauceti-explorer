# Explicit K₂: symbols, residues and reciprocity

Steinberg K₂, symbols and residues shared by regulators and Kato.

## Canonical ownership and interfaces

- KatoEulerSystems L1 imports symbols, tame residues and norm formulas here; its new work is applying them to modular units. The finite Chern map belongs to MotivicEtaleKTheory.
- The Brauer/Hilbert-symbol comparison imports local/global reciprocity and finite duality from ClassFieldTheory. Finite-rank stable-range hypotheses remain visible in every presentation theorem.

**Campaign dependencies:** [KTheoryLowDegrees](../KTheoryLowDegrees/README.md), [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** T. **Dependencies:** U, module and valuation theory; H/K for homotopy comparison; M for Galois comparison. **References:** K-book III; Handbook I.5 §5.2; Milnor; Matsumoto; Tate (1976).

## T.1 — Stable Steinberg groups

<a id="stage-T.1:classical"></a>

**Classical construction (T.1:classical).** Construct the Steinberg group from generators `x_ij(a)` and the Steinberg relations, with distinct-index hypotheses made explicit. Construct stabilisation, the stable group `St(A)`, and the surjection to E(A) sending generators to elementary matrices. Prove centrality of its kernel in the stable range and the universal-central-extension property of the stable map. Define classical K₂ as this kernel.

Keep the finite-rank and stable objects distinct. No assertion that the finite-rank kernel is central for every ring and every rank should follow from the stable theorem. The existing Lie-theoretic “Steinberg” endomorphisms in Tau Ceti are different objects and do not implement this group.

<a id="stage-T.1:plus"></a>

**Comparison with homotopy K₂ (T.1:plus).** Use the universal central extension to compare K₂ with `H₂(E(A),Z)`. Combine Hurewicz and plus construction to identify this group with the second homotopy group of the K-theory space, naturally in A.

## T.2 — Steinberg symbols and Matsumoto

<a id="stage-T.2:symbols"></a>

**Classical field presentation (T.2:symbols).** For a field F construct the Steinberg symbol in K₂ from explicit lifts of diagonal matrices. Prove bilinearity and the Steinberg relation `{a,1-a}=0` when both entries are nonzero. Define Milnor K-theory as the tensor algebra of `Fˣ` modulo the homogeneous Steinberg ideal, and obtain `K₂ᴹ(F)`.

Prove Matsumoto's theorem that the resulting map `K₂ᴹ(F) → K₂(F)` is an isomorphism. Prove the normal-form and presentation arguments, not just the fact that the map respects relations. Derive `{a,b}=-{b,a}`, `{a,-a}=0`, and the correct formula for `{a,a}`. Antisymmetry does not say that `{a,a}=0` integrally.

<a id="stage-T.2:graded-map"></a>

**Later product comparison (T.2:graded-map).** Construct the natural graded map `K_*ᴹ(F) → K_*(F)` from products. Its degree-two isomorphism is special; no general isomorphism in degree three or above is asserted.

## T.3 — Discrete valuations and tame symbols

<a id="stage-T.3:symbols"></a>

**Classical residue map (T.3:symbols).** For a discrete valuation v with residue field k define

\[
 \partial_v\{f,g\}=(-1)^{v(f)v(g)}
 \overline{f^{v(g)}/g^{v(f)}}\in k^\times.
\]

The quotient inside the bar has valuation zero. Implement it using unit parts, so the residue operation is never applied to a nonintegral element. Prove independence from the uniformiser, bilinearity and the Steinberg relation. With this convention

\[
 \partial_v\{u,\pi\}=\bar u,\qquad
 \partial_v\{\pi,u\}=\bar u^{-1}.
\]

<a id="stage-T.3:localization-comparison"></a>

**Later localization comparison (T.3:localization-comparison).** Identify this with the connecting map of the K-theory localisation sequence, fixing any sign at the comparison rather than silently reversing the symbol formula. Prove finite support of residues of a symbol and of a finite sum of symbols.

Develop higher Milnor residues, specialisation with a uniformiser, and their product signs. For finite extensions construct transfer and prove the norm/residue formula with residue degrees and ramification handled correctly. Field restriction followed by transfer multiplies by the extension degree on K-theory, with the appropriate projection formula.

## T.4 — Rational function fields and reciprocity

Prove the Bass–Tate sequence for `F(t)` and use it to construct Milnor transfers and their transitivity. Include the valuation at infinity; polynomial primes alone do not give the projective-line reciprocity formula.

For a proper regular curve prove Weil reciprocity in the form

\[
 \prod_{x\in X^{(1)}}N_{k(x)/F}(\partial_x\{f,g\})=1.
\]

Prove that only finitely many factors differ from 1. Compare the divisor valuation with the valuation already used in AlgebraicCurves. This is used in E and ER to construct and descend regulator classes.

## T.5 — Tame kernels and explicit arithmetic

Define the unramified subgroup of K₂(F) by the simultaneous vanishing of finite-place tame symbols. For a number field identify it with K₂ of its ring of integers by the genuine localisation theorem, including injectivity in this case. Prove

\[
0\to K_2(\mathcal O_F)\to K_2(F)
\xrightarrow{\oplus\partial_{\mathfrak p}}
\bigoplus_{\mathfrak p} k(\mathfrak p)^\times\to0.
\]

For S-integers allow residues at S and obtain the exact sequence comparing their tame kernel with the integral one. Give certified finite presentations using explicitly verified relations, residue maps and finite generation. An upper bound and a surjective presentation must not be reported as an isomorphism without a matching lower bound or complete kernel argument.

Prove `K₂(Z) ≅ Z/2` with generator `{−1,−1}`, `K₂(F_q)=0`, and the compatible calculation of K₂(Q). The latter contains the direct sum of residue-field unit groups and is not finite. Include a nontrivial arithmetic example with a verified presentation in N.

## T.6 — Rings with symbols and relative groups

Develop Dennis–Stein symbols under their `1+ab` invertibility hypothesis. Prove their relations and comparison with Steinberg symbols where entries are units. Give presentation theorems only under the stable-range/local-ring hypotheses used in the source. Include square-zero ideals and nilpotent relative examples as tests of K.5, without falsely extending field Matsumoto to arbitrary rings.

## T.7 — Tate's comparison and Hilbert symbols

Import the norm-residue map constructed in MotivicEtaleKTheory M.3 and compare its symbol formula with the cup product of the two Kummer classes:

\[
 K_2(F)/m\longrightarrow H^2(F,\mu_m^{\otimes2}),
 \qquad\{a,b\}\longmapsto(a)\smile(b).
\]

Prove it agrees with the étale Chern class. For local and global fields prove the applicable Tate comparison, and extend it to S-integers with primes dividing m inverted. Compare the ring statement through the actual étale localisation sequence, not through a blanket assertion that the étale cohomology of any scheme is Galois cohomology of its function field.

Fix a primitive root only when identifying a twist with a scalar coefficient module. Under that choice compare with the Hilbert norm-residue symbol and local invariant; prove the change-of-root rule and global reciprocity. The source correspondence with Tate's 1976 work is recorded in SOURCES; M supplies both the required arithmetic proof and the more general norm-residue theorem.

## Completion

K₂ has equivalent Steinberg-kernel, group-homology and homotopy descriptions, with field symbols and arithmetic residues all referring to these same groups. A tame-symbol kernel definition for a curve is only the image of its global K₂ until E proves the necessary injectivity statement.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-k2classical"></a>

**KU-k2classical — Steinberg groups, symbols and tame residues.** Readiness checkpoint for original `k2classical`: verify completion and map-level compatibility of [K2SymbolsBrauer:T.1:classical](README.md), [K2SymbolsBrauer:T.2:symbols](README.md), [K2SymbolsBrauer:T.3:symbols](README.md), [K2SymbolsBrauer:T.4](README.md), [K2SymbolsBrauer:T.5](README.md), [K2SymbolsBrauer:T.6](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `matrices`, `existing`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `T.2:symbols` | Use F× × F× as the generator type of the Milnor presentation. Prove the symbol universal property, then construct the map to the stable Steinberg kernel and both inverse identities in Matsumoto. |
| `T.3:localization-comparison` | Compare valuation-unit-part residue with the actual connecting map, fixing the sign on {u,π}; prove the norm/residue square including ramification and residue-degree factors. |
| `T.7` | Keep the cup-product target μ_m tensor μ_m until choosing a primitive root. Construct the change-of-root scalar and finite Chern comparison before exporting a Brauer-valued symbol. |

**Producer–consumer handoff.** KatoEulerSystems L1 consumes the symbol/norm square for modular units; EllipticKTheory E.7 consumes finite support and closed-point residues.

**Acceptance.** No zero-entry generator exists in the seed presentation. Check {a,a} need not vanish, and distinguish a tame-kernel image from an integral K2 isomorphism.

**Source-readiness boundary.** Match the final Matsumoto and arithmetic Tate maps to the selected K-book/Tate source editions.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
