# Number-field Habiro rings, finite regulators and K₃-graded modules

Frobenius-glued number-field rings and K₃-graded modules, within the standalone [Habiro rings and cohomology family](../HabiroRings/README.md). The ring construction below remains the explicit arithmetic owner; relative étale generalization and its comparison theorem are HR.1–5, not a duplicate of HB.6. Only the regulator and K₃-module stages require the K-theory track.

## Canonical ownership and interfaces

- Classical cyclotomic completions belong to HabiroCyclotomicCompletions. Number-field rings use local Frobenius gluing and the actual K₃ group from K3BlochGroups.
- Reusable ring/module constructions and analytic q-series applications have distinct canonical owners; source conventions and excluded-prime hypotheses remain explicit.

**Campaign dependencies:** [HabiroCyclotomicCompletions](../HabiroCyclotomicCompletions/README.md), [K3BlochGroups](../K3BlochGroups/README.md), [ArithmeticKTheory](../ArithmeticKTheory/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## HB.1 — Integral Bloch conventions and finite Chern classes

Compare CGZ's Bloch group with V's Suslin convention. Define the actual maps and identify the bounded 2-/6-primary differences rather than treating the names as identical integrally. Construct finite-coefficient K₃ and its Chern class using the Bockstein sequence, the Tate twist and Galois cohomology from M.

For a number field F, define the finite set of excluded primes/integers in the precise CGZ statement. Prove the claimed injectivity/isomorphism results only with its hypotheses on n, roots of unity, the discriminant and K₂(O_F). Identify the χ^{-1}-eigenspace in cyclotomic units with the chosen cyclotomic-character convention. When an eigenspace projection uses division by a group order, invert that order or use the integral kernel formulation.

Formalise the cohomological theorem used in CGZ §3 rather than assuming it: the required norm-residue/Chern comparison, the finite-coefficient exact sequence and the arithmetic finiteness inputs are owned by M, V and N. This makes the later Nahm-sum theorem independent of an unproved K-theoretic hypothesis.

## HB.2 — The cyclic quantum dilogarithm

Construct the cyclic dilogarithm in the appropriate Kummer extension, show its change under an n-th-root choice, and define the resulting class in units modulo n-th powers. Prove the five-term identity, distribution, Galois action and well-definedness on the stated Bloch quotient. Establish CGZ's comparison with the finite Chern class under the precise good-n assumptions.

CGZ Theorem 1.6 initially allows an invertible universal power. Prove Hutchinson's refinement R_ζ=c_ζ² for odd N with its stated field/root-of-unity hypotheses (arXiv:2104.14413v4, §§2–4, Theorem 3.1). Construct cyclic bar cycles, the Bott element and Soulé's Chern-product formula. This does not set the scalar to one; outside the refinement's hypotheses retain the source's weaker comparison. Keep the maps into units, S-units, Kummer classes and their quotients distinct.

The interface exported to GSWZ includes the units ε_m(ξ), their Kummer classes, the choice torsors for m-th roots, and coherence under change of m. Index ξ by the actual K₃/Bloch comparison and the stated localisation, not by an unrelated symbol type.

## HB.6 — The number-field Habiro ring

For `R=O_F[1/Δ]`, with Δ divisible by the discriminant, construct the compatible root-of-unity coefficient rings, their p-adic completions and the Frobenius endomorphisms at primes not inverted. Define the families of power series and the Frobenius-twisted Taylor-gluing condition of GSWZ Definition 1.1. Prove that substitution by `ζ_{pm}−ζ_m` exists in the required completion; it is not an arbitrary formal substitution by a nonzero constant.

Prove the ring operations preserve gluing and compare the construction with the usual Habiro completion when F=Q and Δ=1. For general F the Frobenius acts on the completed coefficient algebra; it need not be a global automorphism of F. Do not give H_R the naive R-algebra structure by constant coefficient families without proving those families glue. The abelian-Q scalar construction is a separate result.

When primes have been inverted, retain the source's restrictions on root orders and the resulting decomposition phenomena. In particular, do not assert that H_R is an integral domain merely because O_F is one.

Export this explicit ring and its Taylor/Frobenius maps to HabiroRings HR.5, which proves the relative étale construction specializes to it (Wagner Corollary 2.13). HB.6 can be constructed first; the later HR comparison is not an input to HB.6. Keep full cyclotomic coefficient algebras or all finite étale local factors in p-adic comparisons, not an unjustified single residue field.

## HB.7 — K₃-indexed Habiro modules

Construct the local invertible L_p(ξ)-sections and the global modules H_{R,ξ} of GSWZ Definitions 1.3 and 1.4. The definitions use HB.2's Kummer units/root choices and D.4's p-adic regulator with its normalisation. Prove independence of permitted choices and the local-to-global compatibility.

Develop multiplication, change of index, scalar extension, Galois action, root-order restriction and evaluation, with exactly the invertibility/localisation hypotheses proved in GSWZ. Do not assume every module is globally free or that every multiplication map is an isomorphism just because the local description resembles a line.

Include the ring case ξ=0, tensor/power comparisons where proved, and the compatibility of Frobenius gluing with the K₃ transfer. The unramified p>3 regulator theorem is D.3; inverted primes and the treatment of 2 and 3 must agree with Δ.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-finitereg"></a>

**KU-finitereg — Finite Chern and cyclic-dilogarithm maps.** Readiness checkpoint for original `finitereg`: verify completion and map-level compatibility of [HabiroNumberFields:HB.1](README.md), [HabiroNumberFields:HB.2](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `blochk3`, `arithmeticstructure`, `etalehigher`. 

<a id="stage-KU-habiroring"></a>

**KU-habiroring — Number-field Habiro ring and Taylor gluing.** Readiness checkpoint for original `habiroring`: verify completion and map-level compatibility of [HabiroCyclotomicCompletions:HC.1](../HabiroCyclotomicCompletions/README.md), [HabiroCyclotomicCompletions:HC.2](../HabiroCyclotomicCompletions/README.md), [HabiroCyclotomicCompletions:HC.3](../HabiroCyclotomicCompletions/README.md), [HabiroNumberFields:HB.6](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`, `continuous`. 

<a id="stage-KU-habiromodules"></a>

**KU-habiromodules — K3-indexed Habiro modules.** Readiness checkpoint for original `habiromodules`: verify completion and map-level compatibility of [HabiroNumberFields:HB.7](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `habiroring`, `padicreg`, `finitereg`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `HB.1` | Maintain a concrete exceptional integer for finite Chern comparison, including discriminant and torsion contributions; prove the good-order predicate for every order used by a q-series consumer. |
| `HB.6` | Construct Frobenius on the full p-completed coefficient algebra; explicitly compare each local factor and the root-change re-expansion, without selecting a global Frobenius of F. |
| `HB.7` | Form the root-choice torsor and regulator correction for each K3 index, prove their gluing cocycle, then derive multiplication/index-change maps only in the proven coefficient localization. |

**Producer–consumer handoff.** HabiroNahmSeries HB.9 must prove each defining membership condition in this module; RefinedTraceMethods RT.4:Habiro-comparison additionally inverts 6.

**Acceptance.** Distinguish discriminant-only ring construction from p>3 regulator use; test a non-Galois field and ξ=0 against the ring case.

**Source-readiness boundary.** Finite Chern/cyclic-dilogarithm scalar and global module invertibility require their own exact proof checks.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
