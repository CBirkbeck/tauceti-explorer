# Explicit K₃ and Bloch groups

Integral K₃ and Bloch groups with torsion retained.

## Canonical ownership and interfaces

- Give quotient lifts, relation certificates, generator calculations and functoriality for every comparison. Suslin's antisymmetric tensor quotient is distinct from the exterior square.
- The finite-coefficient Chern/cyclic-dilogarithm normalization is sharpened in HabiroNumberFields using Hutchinson's computation; never infer an integral Bloch comparison from agreement of real regulators.

**Campaign dependencies:** [StableHomotopyKTheory](../StableHomotopyKTheory/README.md), [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md), [K2SymbolsBrauer](../K2SymbolsBrauer/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** V. **Dependencies:** H, K, U, T; L and N for arithmetic specialisations. **References:** K-book IV §1 and VI §5; Handbook I.5 and II.3; Suslin.

## V.1 — A concrete homological model

Prove that the stable Steinberg group is superperfect in the required sense, and compare its plus construction with the appropriate connected cover of the K-theory space. Apply Hurewicz in the first nonzero degree to obtain

\[
 K_3(A)\cong H_3(\operatorname{St}(A),\mathbb Z).
\]

Develop bar cycles, boundaries, chain maps and the evaluation of the comparison on representatives. This gives a genuine explicit model for K₃; it is not enough to define it again as `π₃` and postpone every example. Prove naturality under ring maps and compatibility with stabilisation.

## V.2 — Decomposable and indecomposable parts

Construct the product map from Milnor K₃ to Quillen K₃ and define

\[
 K_3^{\mathrm{ind}}(F)=\operatorname{coker}(K_3^M(F)\to K_3(F)).
\]

The decomposable part is the image, not a subgroup identified with Milnor K₃ unless injectivity has been proved. Supply quotient maps and exactness. Explain the arithmetic specialisation: Milnor K₃ of a number field is controlled by its real places and is torsion, whereas Quillen K₃ can have a free part of rank r₂. Tensoring by Q loses precisely the information that must be retained for integral finite-regulator applications.

## V.3 — Bloch-group conventions

Construct the pre-Bloch group with its precise five-term relations. Use Suslin's convention for the integral K₃ comparison and define the target of the boundary map as the antisymmetric tensor quotient

\[
 (F^\times\otimes_{\mathbb Z}F^\times)
 /\langle a\otimes b+b\otimes a\rangle.
\]

This quotient need not kill `a⊗a`; it is not automatically the exterior square. Define the boundary on `[x]` by the chosen sign of `x⊗(1−x)`, and prove that every five-term relation maps to zero. Define the corresponding Bloch group as its kernel.

Separately construct the conventions used by Bloch, Goncharov and Calegari–Garoufalidis–Zagier. Prove the comparison maps, their exact small torsion corrections and their rational identifications. Do not erase 2- or 3-torsion merely because the real dilogarithm kills it. Small finite fields require separate definitions/calculations; no infinite-field theorem is used without its hypothesis.

## V.4 — Suslin's exact sequence

For infinite fields prove the Bloch–Wigner/Suslin exact sequence

\[
0\to\widetilde{\operatorname{Tor}}_1^{\mathbb Z}(\mu(F),\mu(F))
\to K_3^{\mathrm{ind}}(F)\to B_{\mathrm{Sus}}(F)\to0.
\]

Construct the enhanced torsion term with its characteristic-dependent convention; it is not the ordinary Tor group with a tilde used as decoration. Develop the configuration complex for points in the projective line, its group action and spectral sequence, the cross-ratio map, and the identification of the homology terms. Prove exactness and the functoriality needed by extension of fields and regulators.

This is a substantial proof, separate from defining five-term relations. Record which homology-stability and configuration-acyclicity lemmas it uses, and prove them here when they are not supplied by H. Its degree-three map must agree with V.1 and with the indecomposable quotient.

## V.5 — Concrete K₃ calculations

Use Quillen's finite-field calculation to construct `K₃(F_q) ≅ Z/(q²−1)`, including q=2 and q=3. Do not deduce these cases from a Bloch-group presentation that excludes them. Compute restriction and transfer through the finite-field model.

Prove `K₃(Z) ≅ Z/48` and `K₃(Q) ≅ Z/48`, with the latter comparison induced by localisation and the appropriate arithmetic theorem. Track the decomposable class and the resulting indecomposable quotient separately. Include `K₃(Q(i)) ≅ Z ⊕ Z/24` as an arithmetic test once N and R are available. The free summand is an existence of a basis, not an arbitrarily declared canonical generator.

## V.6 — Explicit elements and certificates

Give constructors for a Bloch element from a finite combination of field elements together with a proved vanishing boundary. Give a certificate format for expressing a relation as a finite combination of five-term relations. Connect these certificates with bar cycles whenever the integral comparison requires them.

A single root-of-unity symbol `[ζ]` is not automatically in every chosen integral Bloch group. Define the appropriate multiple, quotient class, or coefficient-localised class and prove it is valid before applying a regulator. This distinction is essential for D and HB.

Export a rational Bloch/K₃ comparison, an integral comparison retaining torsion, and finite-coefficient comparisons with their own hypotheses. Prove that P's real regulator and D's p-adic regulator agree with the abstract K-theory regulators under these comparisons.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-blochk3"></a>

**KU-blochk3 — Homological K3 and Suslin/Bloch comparison.** Readiness checkpoint for original `blochk3`: verify completion and map-level compatibility of [K3BlochGroups:V.1](README.md), [K3BlochGroups:V.2](README.md), [K3BlochGroups:V.3](README.md), [K3BlochGroups:V.4](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `pluscomparison`, `k2classical`, `homotopy`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `V.3` | Use admissible nonzero, nonunit field elements for the pre-Bloch generators; give explicit comparison homomorphisms to the exterior-square convention and compute their 2-primary discrepancy. |
| `V.4` | Decompose the configuration-complex proof into acyclicity, homology stability, edge maps and the enhanced Tor extension. An ordinary Tor kernel does not satisfy the integral contract. |
| `V.6` | Separate a five-term relation certificate, a vanishing-boundary certificate and a lift to indecomposable K3; prove how each transports through finite coefficient reduction. |

**Producer–consumer handoff.** HabiroNumberFields HB.1–2 consumes the integral convention and finite Chern comparison; Polylogarithms P.2 consumes its real scalar comparison only.

**Acceptance.** Test q=2 and q=3 through the finite-field theorem, and a root-of-unity symbol requiring a multiple before it lies in the chosen Bloch kernel.

**Source-readiness boundary.** The Suslin enhanced-torsion extension and small-field conventions require full source decomposition.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
