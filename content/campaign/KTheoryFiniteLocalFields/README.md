# K-theory of finite and local fields

Finite/local K-groups with integral and completed carriers separated.

## Canonical ownership and interfaces

- RefinedTraceMethods owns L.4's Hochschild, THH, cyclotomic-spectrum, TC and trace foundations and relative-comparison theorems. This roadmap owns the field/DVR/TR calculations using them.
- Local-field arithmetic and Witt vectors retain existing carriers. Ordinary integral K-groups, their derived p-completions and finite coefficients have separate declarations and explicit comparison maps.

**Campaign dependencies:** [StableHomotopyKTheory](../StableHomotopyKTheory/README.md), [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md), [RefinedTraceMethods](../RefinedTraceMethods/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** L. **Dependencies:** H, K, T, M; local fields and ramification. **References:** Handbook I.3 and I.5 §§5.3–5.6; K-book IV and VI; Quillen; Hesselholt–Madsen; Suslin; Geisser–Hesselholt.

## L.1 — Quillen's finite-field calculation

Prove, for every finite field with q elements and every j≥1,

\[
 K_0(\mathbb F_q)=\mathbb Z,\qquad
 K_{2j}(\mathbb F_q)=0,\qquad
 K_{2j-1}(\mathbb F_q)\cong\mathbb Z/(q^j-1).
\]

Construct the finite-field K-theory model used in Quillen's proof. Develop the stable finite-general-linear-group cohomology, Brauer lifting and the Adams/Frobenius comparison, together with topological complex K-theory and Bott periodicity imported from RefinedTraceMethods RT.4:topological, which precedes its later Habiro comparison. The stable finite-group and Brauer-lifting calculations are proof obligations here; none follows just from knowing the order of a finite general linear group. Compare the homotopy fibre of the relevant Adams operation with the plus-construction model, and identify its homotopy groups.

Construct the restriction and transfer maps for finite extensions and prove their formulas in the functorial model. Choosing a cyclic generator may introduce choices; the product/transfer formulas must not depend on pretending such a generator is canonical. Recover determinant in degree one and the field-symbol calculation in degree two.

## L.2 — Henselian local rings away from the residue characteristic

Prove rigidity with coefficients prime to the residue characteristic for the required henselian pairs. For a henselian DVR `O` with fraction field `L` and finite residue field k, construct localisation and compare `K(O;Z/m)` with `K(k;Z/m)` when m is invertible in k.

Deduce the prime-to-residue-characteristic part of local-field K-theory. Check the Bockstein exact sequence and do not infer the integral groups from finite coefficients without a divisibility argument. Uniformiser-dependent splittings are explicitly marked as such.

## L.3 — Integral K₂ of local fields

Use local symbols to construct the map from K₂ of a nonarchimedean local field to its roots of unity, with the full collection of Hilbert-symbol components. Prove the structure theorem separating the divisible part from the finite quotient, in the characteristic-zero case in particular the uniquely divisible kernel and the finite roots-of-unity quotient. Compare the ring-of-integers subgroup and the tame-symbol quotient.

Keep the canonical short exact sequence separate from a noncanonical direct-sum decomposition. State residue-characteristic and characteristic-zero variants individually, including the modifications to the roots-of-unity term. Check consistency with the local norm-residue map and the residue-field unit group.

## L.4 — Trace constructions

Import the Hochschild/cyclic/THH/TC and cyclotomic-trace constructions from [RefinedTraceMethods](../RefinedTraceMethods/README.md), including the nilpotent relative theorem with completion/connectivity hypotheses and the rational relative comparison. Construct the comparison to the classical TR/Frobenius convention used in Hesselholt–Madsen's field/DVR calculations, verify its input hypotheses and prove the localization square.

## L.5 — Witt vectors and residue-characteristic calculations

Consume existing Witt-vector algebra. Import ordinary de Rham–Witt complexes, Frobenius, Verschiebung and restriction from CrystallineCohomology CR.4; own the logarithmic/DVR comparison needed by the calculation here, with its ramification data and map-level comparison. Do not define a second ordinary de Rham–Witt complex. Prove the calculation of THH/TR/TC for perfect fields, truncated polynomial rings and the complete DVRs required for local-field K-theory. In mixed characteristic retain the necessary logarithmic/ramification data.

As concrete tests prove the relative calculation for `k[t]/(t^e)` with k perfect of positive characteristic, and the characteristic-zero square-zero comparison with differential forms. Keep integral, p-completed and finite-coefficient statements distinct. The Handbook's different hypotheses for p=2 and odd p are preserved until a separately proved theorem removes them.

## L.6 — Local higher K-groups

Combine localisation, trace calculations and M's étale comparison to obtain the local-field descriptions in Handbook I.5 §5.6. For finite extensions of Q_p, extract the rank `[L:Q_p]` of `K_{2j−1}(L;Z_p)` for j≥2 and identify its torsion using the specified Galois-cohomology groups; identify the even groups' p-primary finite components by their twist and duality formulas.

Provide a separate account of the divisible components of the integral K-groups. Do not turn the finite generation of a completed group into finite generation of `K_n(L)` as an abelian group. Establish the exact comparison maps and their kernels/cokernels. Extend the appropriate statements to equal-characteristic local fields using their own de Rham–Witt arguments.

## L.7 — Local-to-global compatibility

Prove compatibility of local restriction/transfer, arithmetic Chern classes, Hilbert symbols, and cyclotomic traces with completion of a number field at a finite place. This supplies N's local conditions and D's regulator map. The unramified p>3 K₃ regulator theorem is owned by D, using the completed K₃ model established here.

## Completion

The finite-field table is proved in all degrees, local K₂ has its integral structure and explicit symbols, and higher local calculations distinguish integral/divisible data from completed/cohomological data. All maps consumed by N and D are compared with the general K-theory construction.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-finitefields"></a>

**KU-finitefields — Bott/Brauer lifting and finite-field K-theory.** Readiness checkpoint for original `finitefields`: verify completion and map-level compatibility of [KTheoryFiniteLocalFields:L.1](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `spectra`, `pluscomparison`, `fundamental`. 

<a id="stage-KU-rigidity"></a>

**KU-rigidity — Henselian rigidity away from residue characteristic.** Readiness checkpoint for original `rigidity`: verify completion and map-level compatibility of [KTheoryFiniteLocalFields:L.2](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `finitefields`, `continuous`. 

<a id="stage-KU-localp"></a>

**KU-localp — Local residue-characteristic calculations and completion.** Readiness checkpoint for original `localp`: verify completion and map-level compatibility of [KTheoryFiniteLocalFields:L.3](README.md), [KTheoryFiniteLocalFields:L.5](README.md), [KTheoryFiniteLocalFields:L.6](README.md), [KTheoryFiniteLocalFields:L.7](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `traces`, `etalehigher`, `finitefields`, `rigidity`, `tate2`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `L.1` | Make Brauer lifting and Bott periodicity precede the computation of the Adams-operation fibre; prove restriction and transfer on that fibre rather than selecting unrelated cyclic generators. |
| `L.2` | Construct finite-coefficient rigidity as a map of spectra and compare its Bockstein sequence with localization. Specify the coefficient modulus is invertible in the residue field. |
| `L.6` | Separate the integral divisible subgroup, finite torsion quotient, derived p-completion and H1/H2 comparison. Supply a map and kernel/cokernel statement for each passage. |

**Producer–consumer handoff.** ArithmeticKTheory N.2 consumes finite-field transfer/boundary compatibility; PadicHodgeRegulators D.3 consumes the same completed K3 carrier and product decomposition.

**Acceptance.** An unramified local-field computation must not instantiate a ramified statement. Verify the finite-field K1 formula agrees with the ordinary field norm.

**Source-readiness boundary.** Check each Hesselholt–Madsen calculation against its ramification and small-prime range.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
