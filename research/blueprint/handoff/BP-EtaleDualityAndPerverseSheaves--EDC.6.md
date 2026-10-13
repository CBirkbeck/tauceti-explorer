# Handoff: EDC.6 integral, analytic and diamond operation comparison

**Job:** BP-EtaleDualityAndPerverseSheaves--EDC.6, issue #9410.
**Worker:** Codex, session codex-KQ06rl; claim confirmed 2026-10-13.
**Result:** complete target-level planning pass; EDC.6 coverage **planned**.
This is a finished blueprint submission for independent review, not a checkpoint.
No implementation or source-decomposition closure is claimed.

## Deliverables and inventory

- [Packet](../packets/EtaleDualityAndPerverseSheaves--EDC.6.json): seven new
  nodes, six theorems and one construction; seven API items; four construction
  unit tests; four new planets; four pinned baseline declarations; four exact
  supplier requests and four gaps. All implementation statuses are unchecked.
- [Reader](../readmes/EtaleDualityAndPerverseSheaves--EDC.6.md): full target
  statements, coefficient/shift conventions, proof chains, locators, the new
  construction API/tests and geometric acceptance examples. Its coverage table
  accounts for every EDC.6 stage target, using imported nodes by original id.
- [Suggested Lean](../suggested/EtaleDualityAndPerverseSheaves--EDC.6.lean):
  55 lines, one categorical end theorem and three examples over native
  functors/adjunctions; no definitions, data holes or substitute carriers.

The new targets are strict operation reduction, mapping-limit transport of
integral trace/class maps, finite coefficient-extension compatibility,
Tate/orientation identification, supported Betti class/trace comparison,
analytic smooth trace on actual algebraic models, and diamond trace mates
with the exact essential-image condition.

The EDC.4 packet already holds twelve EDC.6 nodes. Their original ids are
imported, never copied. Its latest independent review remains needs_changes
because of its EDC.5 general semismall costalk proof; this job neither revises
that issue nor relies on that proof. The EDC.6 normalized-system, coefficient,
perverse-extension and comparison statements used here were checked against
the read sources. The EDC.0 accepted scope is EDC.0–3 and has no EDC.6
coverage record to overwrite.

## What the pass settles

Strict scalar reduction needs finite relative cohomological dimension, not just
a pro-object comparison. Exceptional reduction uses local closed/smooth
factorization and the localization/direct-image argument of Bhatt–Scholze
6.7.18, rather than a formal claim about right adjoints. Internal Hom uses
stratified dévissage; common strata and ordinary/Tor bounds remain explicit.

The derived mapping-limit identity yields a lim¹ shifted-Hom obstruction.
Finite geometric coefficient groups are Mittag–Leffler, so specified maps and
identities can be detected by reductions in that range. Over arithmetic
fields no unconditional reduction-only equality test is asserted. Integral
O/λ and ramified O→O′ examples retain Tor/Ext and tower reindexing.

The complex convention sends exp(2πi/ℓ^n) to the positive orientation of
(1,i). Root replacement, product and conjugation tests pin the sign/unit.
P¹, an open curve, and a smooth supported divisor test the actual trace/class
maps, including compact support before forgetting support.

Huber's all-dimensional smooth trace is 7.3.4, pp.378–382, not the curve
trace 7.2.2. Its construction and 7.5.3–7.5.4 compare the trace and purity on
actual algebraic analytifications, for residue-characteristic-prime torsion.
The broader direct-image coefficient range of 3.8.1 does not enlarge purity.

The diamond target gives the explicit mate/counit equation and Rc_* recovery.
Strong c^* exceptional/duality transport is conditional on essential-image
membership. Neither 27.7 full faithfulness nor Rc_* recovery supplies that
geometric theorem. In mixed characteristic use the ambient adjunction and
L6 units only on the specific finite constructible candidates, not an invented
right adjoint on bounded restrictions. During assembly, reconcile the inherited diamond node's
strong acceptance examples with this condition; do not retain them as
unconditional claims.

## Exact remaining inputs and routing

| Supplier request | What must be delivered |
| --- | --- |
| SchemeAndStackFoundations:SF.2 | Integrate the existing PR196 EllAdicRealization 0–10 and ComplexComparison 7,10–12 interfaces: coherent normalized ctf towers/common bounds and strata, mapping limits, geometric finiteness, scalar descent and normalized topological realization. The packet records the exact import map, not new generic constructions. |
| AlgebraicTopology Stage 6 | Consume its existing relative cohomology/products/local orientation; extend as Part II by supported Thom/Gysin for oriented normal bundles and noncompact finite/integral constructible compact-support duality. Compact-manifold duality and real de Rham duality do not cover this additional interface. |
| ClassicalAdicEtaleCohomology:H3 | Deliver the already proposed all-dimensional H3:smooth-duality suffix with Huber 5.7.2/5.7.5 proper support, 7.3.4 trace and 7.5.3/7.5.4 exceptional purity in their stated range. The packet corrects the inherited suffix locator in its own request; it does not edit H3. |
| AdicCoefficientsAndComparisons:L3 | For strong transport, prove geometric preservation of the essential image for the relevant exceptional and internal-Hom objects, with invertible counit and comparison compatibility. Keep the characteristic-p and complete-DVR coefficient/base conventions separate. |

The four gaps are (1) unregistered PR196 interfaces, (2) the additional
supported/noncompact finite/integral topological interface, (3) normalized
analytic integral/rational coefficient realization, and (4) strong diamond
image preservation. Gap (3) requests a Classical adic étale cohomology,
Part II with common strata/uniform bounds, strict Rf_!/f^! reduction and
coherent traces. No new analytic O/E theorem is inferred from finite-level
comparison. These are precise follow-up/import obligations, not unplanned
stage targets.

Maintainer actions recorded in the packet:

- Apply the missing L3→EDC.6 stage dependency (RT-AREA-etale/17); exact L3
  node ids and ECD 27.1–27.4 support it. Retain the separate L4/L6 and H5 routes.
- Keep the existing EDC.0 restructuring entries 0 and 1 for stacks and
  perfect/equivariant Part IIs (RT-AREA-etale/3 and /16). Route GS.1/GS.3,
  ET.2b, WC.6 DM purity, EDC.8 Yun–Zhang/Lafforgue stack items (including
  LAFFORGUE-18/48), ShtukaSpecialCyclesAndHigherSiegelWeil and
  RamifiedGeometricClassFieldTheory to the stacks extension. Perfect pfp
  model-independence and equivariant perfection import GS0:Witt-geometry and
  L2, with shared equivariant operations owned by stacks. Scheme-level Braden
  stays in the inherited perfect/equivariant extension.
- Resolve the two additional Part II requests in the existing topological and
  analytic directions; preserve all current upstream owners.
- At assembly retain the two inherited planets, **Normalized constructible
  adic systems** and **Comparison with complex-analytic sheaves**, plus the
  four new planets. This gives exactly six for EDC.6.

No atlas data, upstream roadmap or other worker's packet was edited.

## Sources, duplication screen and verification

Read Bhatt–Scholze arXiv:1309.1198v2 §§6.5–6.8 (pp.49–62), BBD
2.2.16–2.2.18 (p.73) and 6.1.2–6.1.4 (pp.149–152), ECD manuscript
14 April 2026 27.1–27.7/proofs (pp.163–168), and Huber 1996
3.7.1–3.8.1 (pp.225–228), 5.7.1–5.7.5 (pp.316–318),
7.3.4/proof (pp.378–382), 7.5.1–7.5.4 (pp.389–391).
The packet records editions, public links, read ranges and public-paper hashes.
The cleared Huber and Bhatt–Scholze copies were read in place; no restricted
files or extracted passages are in the repository. No publisher error was
established, so sourceIssues is empty. Inherited plan locator/scope problems
are described as plan integration notes, not publisher errata.

Read both full PR196 child readers and their suggested files at head
4bd72379658126cbe9be935656396f0c9dac4de0; PR196 was open when checked.
Read the full current AlgebraicTopology and AdicSpaces readers for upstream
shape, plus relevant DifferentialGeometry and AlgebraicVectorBundles
boundaries and the current Tau Ceti library for duplication. Current roadmap
commit was 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; these are duplication screens,
not the pinned baseline.

The four baseline declarations were read at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. The packet records their actual
modules/statements and the Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369.

Validation: blueprint checker **zero errors, zero warnings**; the suggested
file elaborated using `lean-check` at the pinned Mathlib with **one warning,
only for its unproved theorem**. The existing counit/full-faithfulness example
is checked directly from the native API. The new construction's full tests
remain in the README because its mathematical carriers are supplier targets.
The local submission-path/data-hole checks passed. A recursive cross-packet
screen reached 1,181 exact nodes without a cycle; the combined EDC.6 inventory
has six planets. These checks supplement the packet validator. Scratch retrieval material is disposable;
every integration decision the next worker needs is recorded here or in the
packet/reader.
