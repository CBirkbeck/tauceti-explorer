# Handoff: BP-GeometryOfNumbersAndQuadraticArithmetic--GN.5 (issue #9329)

Agent: Claude (session claude-sz7OS4), 2026-10-12. Follow-up part of the accepted plan BP-GeometryOfNumbersAndQuadraticArithmetic for stage GN.5, *Certified reductions and applications*.

Deliverables:

- `research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic--GN.5.json` (part `GN.5`, status `complete`, 33 nodes);
- `research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.5.md` (reader, items 5.5–5.12 continuing the package's Layer 5 numbering);
- `research/blueprint/suggested/GeometryOfNumbersAndQuadraticArithmetic--GN.5.lean`;
- this note.

## What is planned

The parent packet's 24 GN.5 nodes (package items 5.1–5.4) are cited by id and not edited. The part adds 33 nodes: 3 definitions, 3 constructions, 17 theorems, 7 lemmas, 1 comparison and 2 applications, with 38 API items, 25 unit tests and 2 planets. GN.5 now has 6 planets in total, the limit. Coverage of GN.5 is `planned`, with four refinements listed under *Remaining*.

- **Reconciliation and transition invariant (the parent's first remaining item).** `lll-step-relation` is a nondeterministic LLL step relation. Both Algorithm (1.15) (`lll-source-algorithm`, Fig. 1 with its conditional (*)) and the parent's native full-row variant are deterministic refinements of it. `lll-step-invariant` proves (1.16)–(1.17) and Remark (1.37) once for the relation, and `lll-step-termination` gives the swap count log_{4/3} D, plus finiteness for real lattices through Minkowski's first theorem. `lll-variant-reconciliation` proves that the two algorithms are in lockstep, with the same cursors, decisions and Gram–Schmidt vectors, as long as no swap follows an exact tie μ_{k,k−1} = ±1/2. At ties they really do diverge: on ((2,0),(1,1)) the outputs are ((1,1),(1,−1)) and ((−1,1),(1,1)), both reduced. I checked this with exact arithmetic.
- **Bit complexity (Proposition (1.26), which the parent left out because its proof ran past the page range it had read).** I read the whole of LLL §1, through reprint folio 37: `lll-denominator-integrality` (1.27)–(1.29), `lll-intermediate-size-bounds` (1.30)–(1.36) and `lll-arithmetic-complexity`, which gives O(n⁴ log B) operations on integers of binary length O(n log B), with explicit bounds on the stored integers.
- **Lattice bounds read off a reduced basis.** (1.7), (1.8)/(1.10), (1.9), (1.12)/(1.14), and the successive-minima comparison 2^{−i}λ_i² ≤ ‖b_i‖² ≤ 2^{n−1}λ_i², using GN.1's minima.
- **Routed BSTTTZ items** (`PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/primitive-prefix-extension` and `/reduced-basis-product`): `primitive-prefix-reduced-basis` and `primitive-prefix-basis-product`, with c_0 = A and c_i = 1 + (1/2)Σ_{j<i}c_j, which has the closed form c_i = (3/2)^{i−1}(1 + A/2) for i ≥ 1. The routed item also claimed that for A = 1 the basis is nondecreasing in length. That is **not** asserted, because the construction does not give it; BSTTTZ's ordering comes from Minkowski reduction (Siegel, Lectures X §6), which was not available. The product bound does not need the ordering.
- **Counts and representation tests.** These are the exact Fincke–Pohst enumeration (`quadratic-completion`, `quadratic-completion-gram-schmidt`, `fincke-pohst-enumeration`, `fincke-pohst-complete`), the count bound `ellipsoid-point-count`, and `certified-representation-number` for positive definite Tau Ceti `IntegralLattice`s. "Local representation tests" is read as finite, certified tests of representation by a positive definite lattice. The p-adic local densities stay with GN.2–GN.3, as the README says.
- **Irrational metrics.** `gram-comparison`, `entrywise-enclosure-comparison`, `loewner-det-monotone` and `reduction-transfer-under-comparison` cover the case where the Gram matrix is irrational, e.g. a number-field ideal or a real g ∈ GL_n(ℝ). An exact reduction of a rational model then transfers with factor κ = (1 + ε)/(1 − ε). Mathlib at the pin has no Loewner monotonicity of the determinant, so it is its own lemma.
- **Number-field adapters (the parent's third remaining item).** `ideal-euclidean-lattice` (Mathlib's Euclidean mixed space; no new metric), `euclidean-house-norm-bounds`, `integral-log-height-le-house`, `ideal-short-element`, `ideal-class-small-representative`, and `lll-simultaneous-approximation` (1.39).
- **Arithmetic-group adapters.** `lll-reduced-is-siegel-reduced` shows that LLL-reduced Gram matrices are (e, C_n)-reduced in AdelicAlgebraicGroups AA.3's sense, with C_n = 2^{n(n−1)/2} + 2^n. `lll-siegel-domain-certificate` shows that an LLL certificate γ puts γg in AA.3's standard Siegel domain Σ_n((1/2)(3/2)^{max(n−2,0)}, 2^{−1/2}), in AA.3's own convention: left action, coordinates v·diag(a)·k.

## The two routed arithmetic reduction uses

The parent's second remaining item asked to read "the two routed arithmetic reduction uses" and check that they need only the exported certificate and approximation factor. I read it as the stage's two consumers, plus the BSTTTZ route:

- **EffectiveDiophantineMethods ED.1** (`linear-form-lattice`, `reduced-basis-distance-lower-bound`, `short-vector-enumeration`, `exclusion-certificate`, `exclusion-certificate-sound`) cites only the parent's `unimodular-basis-certificate`, `lll-reduced`, `lll-gram-schmidt-growth`, `lll-short-vector-factor`, `lll-integer-potential`, `lll-exact-reduction` and `lll-original-lattice-verification`. These are exactly the exported certificate, factor and growth contracts. Arithmetic exclusion stays in ED.1/ED.2, as RS-03 decides.
- **DiophantineApproximationAndTranscendence DT.4** has no node that uses GN.5. Its effective bounds pass to ED.2 for certified search. The only GN.5-related input it needs is the house-to-height lemma, which now comes from here (see the moves below).
- **BSTTTZ** routes two items to GN.5; both are planned (above).

## Moves down, and what the owners must change

The tier rule applies: GN is tier 3, DT tier 4, ComputationalNumberTheory tier 15, EffectiveDiophantineMethods tier 17. A lower tier plans what it needs; a higher tier imports it.

- **Fincke–Pohst enumeration: ED.1 → GN.5.** ComputationalNumberTheory CN.4 requested exact enumeration with completeness from GN.5 (request and gap "Exact ellipsoid enumeration supplier absent", consumer `CN.4/effective-ellipsoid-cover`). CN.4 cannot import from ED.1. To repoint:
  - CN.4's request and gap: answer them with `GN.5/fincke-pohst-complete`, plus `GN.5/gram-comparison` and `GN.5/reduction-transfer-under-comparison` for its safety-factor cover.
  - ED.1's `short-vector-enumeration` and `short-vector-enumeration-complete`: make them imports of `GN.5/fincke-pohst-enumeration` and `GN.5/fincke-pohst-complete`. ED.1 keeps its Diophantine distance witnesses and exclusion certificates, consistent with RS-03's narrowing of ED.1.
  - ED.1's `short-vector-enumeration` lists `GN.5/lll-exact-reduction` as a prerequisite. That prerequisite is unnecessary: enumeration needs no reduction, which only changes the running time.
- **House-to-height lemma: DT.4 → GN.5.** `DT.4/log-height-of-algebraic-integer-bound` becomes an import of `GN.5/integral-log-height-le-house`.

No requests are open and no higher-tier roadmap is cited. AdelicAlgebraicGroups (AA.3 nodes `reduced-form`, `reduced-form-set`, `real-siegel-set`, `gln-real-reduction`) is a lower-tier roadmap already on TauCetiRoadmap.

## Red-team finding RT-AREA-algebraicnt-1/1

The finding asks for roadmap-level `prerequisites` and `consumers` metadata: QuadraticFormInvariants, GlobalQuadraticForms, AdelicAlgebraicGroups and Completed IntegralLattices on GN's side, reciprocated on theirs. That metadata lives in the roadmap record (atlas extract and data), which this job may not edit. In this part's scope:

- the AdelicAlgebraicGroups dependency is now machine-readable at node level, through the four AA.3 prerequisites of 5.12;
- the Tau Ceti integral-lattice dependency (`TauCeti.IntegralLattice`, `gramMatrix`, `IsPosDef`, `isPosDef_ofGramMatrix_iff`) is recorded in `baseline.declarations`;
- GN.5 uses neither QuadraticFormInvariants nor GlobalQuadraticForms.

The roadmap-level edit belongs to the orchestrator; the edges it lists, GN.2 to GlobalQuadraticForms, QuadraticFormInvariants and IntegralLattices, are untouched by GN.5.

## Source issue

`GeometryOfNumbersAndQuadraticArithmetic/E51` (new). BSTTTZ arXiv v1 §3, p. 4, equates the conjugate trace-pairing length with the usual Euclidean length on ℝ^r × ℂ^s. The two differ on complex places by a factor of 2 in the squared length; ℚ(i) shows it. The paper's uses are up to constants, so nothing is affected. I numbered it E51 to avoid the parent's E1–E15 and any numbers the concurrent GN parts may take.

## Suggested Lean file

The file compiled. `lean-check` exited 0 with 102 warnings, all of them `declaration uses sorry`, and no other warnings or errors (Mathlib 082e2d37e8, Tau Ceti f790474 build). It imports individual Mathlib modules and four pinned Tau Ceti modules (IntegralLattice Gram/Signature, Matrix Cholesky, Module Primitive).

- The parent's `lllCoefficient`, `IsLLLReduced` and `UnimodularBasisCertificate`, and the upstream AA.3 `RealSiegel.IsReduced` and Σ_n(u, t), are restated verbatim in a marked first section so that the file elaborates standalone. **The assembly must keep one copy of each.**
- Light definitions have real bodies: the step relation, invariant, potential, Gram comparison, Euclidean ideal lattice, `IsLLLReducedGram`, the c_i constants and the Siegel domain. The data constructions `LLL115.step`/`run`, `quadraticCompletion`, `fpEnumeration` and `lllCostedRun` are left as `sorry`-bodied signatures.
- A script confirmed that every packet API and unit-test name occurs in the file. Tests appear as `example`s under `-- Test <name>` comments.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic--GN.5.json` with `TAUCETI_BASELINE` set to the pinned index: 0 errors, 0 warnings. 58 baseline declarations, each read at the pinned commit.
- An exact-arithmetic script reran every worked example: both LLL variants on four bases, including the tie divergence; the enumeration counts 5 and 7; the representation numbers 4, 4, 0, 8 and 6; the ℚ(i) and ℚ(√−5) bounds; the |(N⁻¹)_{02}| ≤ 3/4 bound.

## Sources

Read:

- LLL 1982, §1 complete: scanned reprint, page images read, sha256 dabefb8b…f704.
- de Weger 1989, §3.4–3.6 (CWI).
- Belabas 2004, §§2, 4 (Numdam).
- Evertse, Chapter 2, §2.3.
- BSTTTZ arXiv v1, §3.
- Mathlib and Tau Ceti files at the pins.
- Tau Ceti current main, `RepresentationNumber.lean`.
- TauCetiRoadmap AdelicAlgebraicGroups AA.3 (README and Suggested.lean).

Not read:

- Fincke–Pohst 1985 in the publisher's text: the AMS site served a Cloudflare challenge to scripts. Its locators come through de Weger §3.6 and are listed under *Remaining*.
- Siegel's *Lectures on the Geometry of Numbers* and Cassels are not freely available, and they were not needed.
- Milne's ANT: the downloaded text extraction was incomplete, and the Mathlib proof of `exists_ideal_in_class_of_norm_le` served instead.

## Remaining (precisely)

1. Confirm the Fincke–Pohst locators of `quadratic-completion`, `fincke-pohst-enumeration` and `fincke-pohst-complete` against the publisher's text: (2.2)–(2.12), pp. 463–471.
2. At lemma level, write out the integral form of the update formulas (1.22) in d_i and d_jμ_ij; this fixes the cost model of `lll-arithmetic-complexity`.
3. The size bounds (1.30)–(1.36) are stated for Algorithm (1.15) only.
4. At lemma level, `lll-step-termination` (b) needs the intrinsic-volume form of GN.0's covolume identity for prefix lattices of lower rank.

The restructure entry proposes showing GN.5 as three sub-layers (certified reduction; enumeration and counts; arithmetic adapters) with their node lists. The package README of the roadmap (research/blueprint/packages/GeometryOfNumbersAndQuadraticArithmetic) should take in sections 5.5–5.12 at its next revision.
