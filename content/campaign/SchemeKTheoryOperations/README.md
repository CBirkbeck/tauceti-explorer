# K-theory of schemes, localisation and operations

Perfect-complex K/G-theory, supports, descent and operations.

## Canonical ownership and interfaces

- Consume generic derived sheaf/enhancement infrastructure from EnhancedDerivedSheaves and scheme étale constructions from PR196 ConstructibleEtale and its EtaleBaseChange/EllAdicRealization companions. These are open proposed suppliers, not merged roadmaps. Perfect objects, the K/G comparison, support categories and Adams operations are owned here.
- Keep scheme hypotheses attached to each pushforward/descent theorem; an integral point class, a coherent sheaf and a perfect resolution become equal only after the actual Cartan/comparison map is constructed.

**Campaign dependencies:** [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md), [KTheoryLowDegrees](../KTheoryLowDegrees/README.md), [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** S. **Dependencies:** K, Z, U, coherent/quasicoherent sheaves, vector bundles and homological algebra. **References:** K-book V; Handbook II.1, II.2 and II.5; Thomason–Trobaugh.

## S.1 — Perfect complexes and enhancements

Construct complexes of sheaves of modules and quasi-isomorphisms using the existing sheaf and homological-complex categories. Define perfectness locally by bounded finite locally free complexes. Prove locality, closure under shifts/cones/retracts, and pullback stability. Establish essential smallness for the quasi-compact quasi-separated schemes in the main theory.

Choose an enhanced model suitable for K.4–K.6. Compare affine perfect complexes with perfect modules over the coordinate ring. Establish the vector-bundle comparison under a proved resolution property; do not identify every perfect complex on an arbitrary scheme with a globally bounded complex of vector bundles without justification. Singular schemes remain legitimate inputs.

## S.2 — K, G and maps

Define `K(X)` from perfect complexes and `G(X)` from coherent sheaves in the noetherian setting. Construct derived pullback on perfect complexes for arbitrary scheme maps in the specified universe. Construct proper pushforward for G-theory, and pushforward for K-theory under conditions ensuring that perfect complexes remain perfect, such as the appropriate proper perfect morphisms between the noetherian schemes used here.

Prove flat base change, projection formulas, composition, and affine scalar-extension/restriction comparisons. Construct the Cartan map `K(X) → G(X)` and prove it is an equivalence in the regular noetherian finite-dimensional cases used by arithmetic. No statement should make it an equivalence for singular schemes merely by definition.

## S.3 — Supports and localisation

Define `K_Z(X)` using perfect complexes acyclic off a closed subset Z. Construct the fibre sequence

\[
 K_Z(X)\to K(X)\to K(U),\qquad U=X\setminus Z,
\]

in the nonconnective theory with the appropriate quasi-compactness assumptions. Prove excision for supports, functoriality of connecting maps and the comparison with exact-category localisation.

For regular closed immersions between the regular schemes needed here prove dévissage identifying support K-theory with the appropriate theory on Z. In more general situations retain G-theory or the support category: `K_Z(X)=K(Z)` is not an unconditional identity.

Apply this to a DVR, Dedekind domain, regular curve and regular arithmetic surface. Identify boundaries on units and symbols with valuations and tame symbols. The surface case must retain codimension-two boundary terms.

## S.4 — Descent and coniveau

Prove Zariski and Nisnevich descent by constructing Mayer–Vietoris squares for the specified covers. Define the sheaves of K-groups and the descent spectral sequence with its convergence assumptions. Construct the codimension filtration and coniveau exact couple. Identify its first page with sums of residue-field K-groups wherever dévissage applies.

Prove the Gersten results required for smooth varieties over fields and for the explicit arithmetic local rings used later, respecting the different hypotheses in mixed characteristic. A general mixed-characteristic Gersten theorem is not inferred from the equicharacteristic proof. Where only the curve localisation sequence is needed, use it directly rather than assuming a stronger resolution.

## S.5 — Homotopy invariance and fundamental formulas

Prove homotopy invariance for regular noetherian schemes in scope. Prove the projective-bundle theorem with the actual generators given by powers of the tautological line bundle; compare with Z's `P¹` calculation. Prove the fundamental theorem for Laurent polynomial rings, including Nil terms when regularity is absent. Construct the blow-up formula in the regular-centre setting used to compare arithmetic integral parts.

For singular schemes distinguish ordinary K-theory and homotopy K-theory. Define the latter by algebraic-singular construction only if it is used, and never substitute it for ordinary K-theory in a theorem about a tame kernel.

## S.6 — Products, λ-operations and Adams operations

Extend the external products of K.7 to schemes, supports and relative theories. Prove graded commutativity and compatibility with flat pullback and proper pushforward. Construct λ-operations using a genuine higher K-theory construction, not just the exterior-power functor on objects. Establish Adams operations `ψ^k` and their multiplication law.

Prove the eigenvalue `ψ^k = k^j` on weight-j rational K-theory, where such an eigenspace decomposition is established. Construct rational projectors from finitely many Adams operations when the relevant weight range is bounded. Record weight shifts for residue and Gysin maps; operations are not blindly declared to commute with every boundary without a twist factor.

## S.7 — Cycle classes and Riemann–Roch

Use the scheme divisor and cycle constructions shared with AlgebraicCurves/JacobianChallenge. Construct Chern classes, the Chern character, the γ-filtration and the comparison with Chow groups in the regular setting. Prove the splitting principle through projective/flag bundles, including pullback injectivity where used. Develop the excess-intersection and deformation-to-the-normal-cone ingredients needed for Grothendieck–Riemann–Roch.

Prove Riemann–Roch with its Todd class and pushforward normalisation in the generality used by M and ER. Higher Chow groups and the higher Chern character belong to M, but must extend this degree-zero construction. The K/G distinction and denominators are retained throughout.

## Tests

Compare localisation for `A¹` minus the origin with the Laurent fundamental theorem. Verify the boundary of a unit and a Steinberg symbol. Check the projective-bundle basis and the blow-up class of an exceptional divisor. Exercise both a regular scheme, where the Cartan map is an equivalence, and a singular example, where no such instance is available. Every elliptic-curve K-group in E is a specialisation of this same theory.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-geometry"></a>

**KU-geometry — Finite locally free sheaves, curves and perfect-complex prerequisites.** Readiness checkpoint for original `geometry`: verify completion and map-level compatibility of [SchemeKTheoryOperations:S.1](README.md), [EllipticKTheory:E.1](../EllipticKTheory/README.md), `UPSTREAM:AlgebraicCurves-vector-bundles`. This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`. Missing proposed-supplier material remains construction work here.

<a id="stage-KU-schemek"></a>

**KU-schemek — Scheme K/G-theory, supports and descent.** Readiness checkpoint for original `schemek`: verify completion and map-level compatibility of [SchemeKTheoryOperations:S.1](README.md), [SchemeKTheoryOperations:S.2](README.md), [SchemeKTheoryOperations:S.3](README.md), [SchemeKTheoryOperations:S.4](README.md), [SchemeKTheoryOperations:S.5](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `geometry`, `nonconnective`. 

<a id="stage-KU-operations"></a>

**KU-operations — Operations, cycles and Riemann–Roch.** Readiness checkpoint for original `operations`: verify completion and map-level compatibility of [SchemeKTheoryOperations:S.6](README.md), [SchemeKTheoryOperations:S.7](README.md), [KTheoryLowDegrees:Z.5](../KTheoryLowDegrees/README.md), [KTheoryLowDegrees:Z.6](../KTheoryLowDegrees/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `schemek`, `k0classical`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `S.1` | Use a small enhanced category of perfect complexes; prove affine descent and compare globally bounded vector-bundle complexes only under a proved resolution property. |
| `S.3` | Construct the support-to-open fibre sequence, then the regular-immersion dévissage map. Keep a support category for singular closed subschemes where K(Z) is not the required source. |
| `S.6` | Prove residue/Gysin weight shifts and the Adams-operation comparison on complexes before projecting to rational eigenspaces; record all denominators in projectors. |

**Producer–consumer handoff.** MotivicEtaleKTheory M.6a consumes the support filtration and layer maps; EllipticKTheory E.6 consumes regular-model blow-up/localization comparisons.

**Acceptance.** Check a DVR valuation boundary, a codimension-two arithmetic-surface boundary and a singular K-to-G example; these use the same functorial carriers.

**Source-readiness boundary.** Mixed-characteristic Gersten variants need individually selected source statements; no unrestricted variant is certified here.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
