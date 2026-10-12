# Independent review of BP-GeometryOfNumbersAndQuadraticArithmetic--GN.5

**Accepted.** Claude session `claude-NDcF6s`, job `REV-GeometryOfNumbersAndQuadraticArithmetic--GN.5` (issue #9287), 12 October 2026. The part was written by session `claude-sz7OS4` (PR #9339); this session did none of it.

The packet is a complete pass for stage GN.5 with coverage `planned` and a precise `remaining` list. Its `review.checked` gives a verdict for every node: **17 verified, 16 corrected, none added, none unverifiable**. No gap was found and no request was needed. Every implementation status stays `unchecked`.

## What was checked

- **Sources, at every locator.** I fetched all five public sources again; their SHA-256 hashes match the packet. LLL 1982 was read from rendered page images (folios 28–37): (1.1)–(1.39), Fig. 1, the proof of (1.26) and Remarks (1.37)–(1.38). De Weger 1989 §3.6 was read on printed pp. 51–53 (printed = PDF − 7). Belabas 2004 §§2–4 was read on printed pp. 22–29 (printed = PDF + 18). Evertse ch. 2 §2.3 was read on pp. 27–30, and BSTTTZ arXiv v1 §3 on pp. 4–5. Fincke–Pohst 1985 was still refused to a script by the AMS site, so the packet's first `remaining` item stands.
- **Baseline.** I read all 58 original declarations in the pinned Mathlib (082e2d3) and Tau Ceti (f790474) source trees. One was a near miss and was replaced (below). There are now 61 declarations, all read at the pins and all in the pinned index.
- **Closure and suppliers.** I read the statement of every parent node cited from GN.0, GN.1 and GN.5. I read the AdelicAlgebraicGroups AA.3 packet nodes, the current TauCetiRoadmap AdelicAlgebraicGroups README (reduced forms; Σ_n(u, t) with its UAK convention) and its Suggested.lean (`RealSiegel.IsReduced`, `exists_reduced_GLZ`). I also read the consumers and moved-down nodes ED.1 `short-vector-enumeration(-complete)`, CN.4 `effective-ellipsoid-cover` (with its request and gap) and DT.4 `log-height-of-algebraic-integer-bound`. Each supplier provides what its consumer uses. The tier moves are legal: GN is tier 3, AA tier 2, DT tier 4, CN tier 15 and ED tier 17.
- **Duplication.** The GN package's Layer 5 contains only items 5.1–5.4, so nothing in this part repeats it. Current TauCetiRoadmap IntegralLattices (2A–2B) and current Tau Ceti main already own shells, finiteness, minima and representation numbers, so the representation-number node now cites them (below). No lower-tier package plans LLL, enumeration or the Siegel adapters.
- **Worked examples.** An exact-arithmetic script reran every example and confirmed them all:
  - both LLL variants on ((2,0),(0,1)), ((1,0),(1,1)), ((2,0),(1,5)) and ((2,0),(1,1)), including the tie divergence;
  - the enumeration counts 5 and 7 and the half-centre case;
  - the representation numbers 4, 4, 0, 8 and 6;
  - the c_i recursion and closed form;
  - the ℚ(i) and ℚ(√−5) bounds.
- **API, tests and planets.** Each of the six definitions and constructions has an API outline that serves its recorded uses, and four or five unit tests. The two planets (LLL running-time bound; Fincke–Pohst enumeration) bring GN.5 to six, the limit.
- **Suggested file.** I read every declaration and corrected the signatures listed below. `lean-check` at the pins exits 0. Its 103 warnings are all `declaration uses sorry`, with no other warning or error. A script confirmed that every API and unit-test name in the packet occurs in the file. The file has 871 lines; its SHA-256 is `bfd0e661…6750`.
- `python3 scripts/check_blueprint.py` with the pinned index reports 0 errors and 0 warnings.

## Corrections to the plan (packet and reader)

1. **Routed primitive-prefix basis (`primitive-prefix-reduced-basis`).** The routed BSTTTZ item asserts that the basis is nondecreasing in length: from b_1 on, and from b_0 when A = 1. The packet had dropped this, saying the construction does not give it. A greedy choice does give it: take each b_i shortest among lattice vectors whose class modulo the saturated prefix is primitive.
   - The rounding argument bounds that shortest vector by c_i‖w‖ for every w outside the prefix span. It uses `TauCeti.exists_eq_zsmul_isPrimitive` to divide w's class by its content.
   - b_{i+1} is a candidate at step i, so ‖b_i‖ ≤ ‖b_{i+1}‖.
   - Existence of the minimum uses `Metric.finite_isBounded_inter_isClosed`.

   I rewrote the statement, the proof, the prerequisites (GN.1/minimum-outside-subspace is no longer needed) and the tests, and added a nonprimitive test. The A = 3 example shows why the ordering starts at b_1.
2. **Representation numbers (`certified-representation-number`).**
   - Shells, their finiteness, r_L, r_L(m < 0) = 0, r_L(0) = 1 and the minimum are TauCetiRoadmap IntegralLattices 2A–2B. They are built on current Tau Ceti main (`IsPosDef.finite_vectorsOfNorm`, `representationNumber`, `IsPosSemidef.representationNumber_eq_zero_of_neg`, `representationNumber_zero_of_anisotropic`, `minimum`). The node now cites them and plans only the certified computation.
   - The baseline citation `isPosDef_ofGramMatrix_iff` was a near miss: it covers only lattices built by `ofGramMatrix`. It is replaced by `TauCeti.IntegralLattice.map_gramMatrix` together with Mathlib's `LinearMap.BilinForm.posDef_toQuadraticMap_iff_matrix`.
3. **AA.3 convention (`lll-reduced-is-siegel-reduced`).** Upstream's `RealSiegel.exists_reduced_GLZ` moves forms by b ↦ γᵀbγ. So the LLL certificate U is itself the witness γ; it is U^{−1} only for the action g·b = (g^{−1})ᵀbg^{−1}. The statement now pins this. The Siegel-domain node's γ = U^{−1} is right for the left action on GL_n(ℝ) and is unchanged.
4. **Locators.**
   - De Weger: the inhomogeneous variant is on pp. 51 and 53, since Figure 2 fills p. 52 (`fincke-pohst-complete`). Figure 2 itself is on p. 52 (`quadratic-completion`, `ellipsoid-point-count`).
   - E51: the BSTTTZ sentence is at the top of p. 5, not p. 4.
   - The packet's claim about Fincke–Pohst (2.8), which it never read, is now attributed to de Weger's Figure 2. That figure stops at the zero vector, so it lists one vector of each pair ±x and omits 0.
5. **Smaller corrections.**
   - `GramComparison.congr` needs a rational U.
   - `loewner-det-monotone`'s corollary needs G̃ positive definite.
   - `fpEnumeration` states its total-function convention: it is ∅ for a nonpositive pivot.
   - `IsLLLReducedGram` now says "strictly below the diagonal", not "subdiagonal".
   - A garbled acceptance sentence in `lll-orthogonality-defect` was rewritten.
   - The Belabas source matches of `entrywise-enclosure-comparison` and `loewner-det-monotone` were reworded to describe what Belabas does: he rounds the Cholesky factor, and his bound carries the factor det R^{(e)}/(2^{ne} det R).

The reader was brought in line with every change, edited only inside the affected node sections. Its supplier lists, Dependencies paragraph and misprint list were also updated.

## Corrections to the suggested file

These statements were false or unprovable as written:

- **`LLLStep.potential_of_case1`** did not assume independence. From the family (e, 2e), a size move and a swap reach (0, e), whose potential is 0. It now assumes independence.
- **`lllStep_swap_count`** asserted M ≤ (n − 1 : ℝ) + …, which is −1 for n = 0. It now uses the natural-number difference.
- **`LLL115.step_isStep` and `LLL115.data_spec`** did not assume that the stored μ and B are those of the family. They now do, together with independence.
- **`quadraticCompletion_det`** lacked symmetry. For a nonsymmetric G the algorithm reads only the upper triangle, so det G ≠ ∏ q_ii in general.

Several tests and signatures were too weak:

- The four number-field tests were bare arithmetic identities that never mentioned `euclideanIdealLattice`. They now state:
  - the covolume of the lattice and the length of i in ℚ(i), stated for any quadratic field containing a square root of −1;
  - the covolume of 2ℤ for ℚ;
  - the trace-form discrepancy in ℚ(i);
  - the trace-form identity on totally real fields.
- `quadraticCompletion_indefinite` now evaluates the completion.
- `lll115_tie_untouched` now checks that the run returns its input.
- `lll_step_exactLLL` now states which transition is a step.
- `lllCostedRun` returned an unexplained pair of numbers. It now records the operation count and the largest stored integer and operand, and `lll_arithmetic_complexity` states the packet's bounds n(4B)^{2n} and 2n²(4B)^{4n}.
- `primitive_prefix_reduced_basis` gained the ordering conclusions.
- `lll_certificate_isReduced` was added in upstream's convention.

## Source issues

- **E51** (BSTTTZ): confirmed at the corrected locator. Tr(x x̄) counts each complex place twice; in ℚ(i), i has trace length² 2 and usual length² 1.
- **E52** (de Weger, new, misprint): the text of §3.6 promises the lattice points of length at most C, and the inhomogeneous variant enlarges C by a length. But Figure 2 starts its running bound at C and compares it with squared lengths. As printed it lists |x|² ≤ C, so for ℤ² and C = 2 it omits (2,0). It affects nothing here, because 5.9.3 bounds squared lengths explicitly.
- **E53** (de Weger, new, misprint): in Figure 2, step (4), the sum defining U_i runs up to an undefined m instead of n.

`sourceVersions` now also records the de Weger PDF that was read.

## RT-AREA-algebraicnt-1/1

The finding asks for roadmap-level `prerequisites` and `consumers` metadata on GN and its suppliers. That lives in the atlas roadmap records, which this job may not edit, and its review directs the fix to supplier-stage links derived by the assembler. GN.5 handles its own part correctly:

- the AdelicAlgebraicGroups dependency is machine-readable through the AA.3 node prerequisites of 5.12;
- the integral-lattice dependency is recorded through the Tau Ceti baseline declarations and, after this review, through the IntegralLattices 2A–2B citation in 5.9.6 and the Dependencies section of the reader;
- GN.5 uses neither QuadraticFormInvariants nor GlobalQuadraticForms.

## Questions for the orchestrator

- The open GN.1 part (PR #9341) numbers its source issues E1 and E2, which collide with the parent packet's E1–E15. This part uses E51–E53.
- When the package README takes in items 5.5–5.12, it should use the greedy primitive-prefix construction and the corrected representation-number boundary.
- When the ComputationalNumberTheory and EffectiveDiophantineMethods plans are next revised, their CN.4 request and gap and their ED.1 enumeration nodes should be repointed to 5.9.3–5.9.4, as the authoring handoff describes.
