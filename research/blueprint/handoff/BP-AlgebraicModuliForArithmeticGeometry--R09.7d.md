# Handoff: BP-AlgebraicModuliForArithmeticGeometry--R09.7d

Issue: #9912. Worker: Codex, session `codex-YhNZtu`. Complete planning pass;
independent review pending. This submission changes only the issue's packet,
reader, suggested Lean file and this handoff. No implementation is claimed.

## Delivered and coverage

The packet has two construction nodes, fourteen API clauses, nine geometric
unit tests, two new planets and nine pinned Mathlib baseline references.
`AlgebraicModuliForArithmeticGeometry:R09.7d` is **planned**, not closed.
The packet is **complete**, with no recorded mathematical gaps and one explicit
supplier request. Every node's implementation status remains unchecked.

The additions are the bounded smooth complex-point realization and the lift
of the punctured inverse chart to the prescribed original open. They import
the accepted R09.7 nodes `regular-coordinates`, `snc-boundary`,
`snc-compactification` and `analytic-polydisc`, without duplicating resolution,
compactification or the local polydisc theorem. R09.7a's boundary refinements,
cover compactification and monomial/meridian interfaces retain their owners.
Its four existing planets parented to R09.7d plus these two give the layer six.

The checks distinguish actual over-C points from arbitrary scheme points,
local étale inverses from global inverses, empty and zero-dimensional cases,
full from punctured charts, removal of both axes from removal of their
intersection, and preservation of the chosen smooth open of a singular closure.
The reader includes the affine-line, torus and nodal-cubic computations.

## Precise work for assembly and follow-up

1. **Inherited projective-closure request.** R09.7/snc-compactification still
   requests R09.1's chosen reduced projective closure with the prescribed dense
   open, and projectivity of the closure/blowup composite. The R09.1 packet read
   has no exact node for this. Reconcile that request with upstream PR853
   Layer 1's projective geometry, then replace the stage-level supplier by its
   exact contract. This is the packet's single request; projectivity is never
   inferred from properness alone.
2. **Move the small analytic input down.** Upstream
   [PR853](https://github.com/TauCetiProject/TauCetiRoadmap/pull/853), head
   `6f3a90dbb5188375dd083e1df9c87ef2bbf38c6c`, has the algebraic SNC
   compactification in §9.5, while its ownership table assigns general
   complex-scheme analytification to ComplexComparisonPartII C−1.1. WORKERS'
   tier rule requires this lower layer to own the smooth point/open/étale
   coordinate case it needs. Its owner is now
   `AlgebraicModuliForArithmeticGeometry:R09.7d/smooth-complex-points`.
   Point the smooth coordinate sub-interface of R09.7/analytic-polydisc's
   A0-extension request here. The higher general construction must identify
   its smooth case with this realization; singular/nonreduced analytic
   spaces and coherent GAGA remain above. Neither another packet nor an
   upstream proposal was edited in this job. The read PR853 README has SHA256
   `a858ba126ddef7b3a5f545a20599b4d8df74508fe2cd34b5e4207bcf12e739f3`.
3. **Realize the geometric targets.** Construct the topology and analytic
   manifold structure on the actual over-C scheme point set, prove the seven
   realization API clauses, and assemble the seven full geometric source-chart
   clauses with the specified immersion and commuting square. Prove all nine
   scheme/manifold fixtures. These are authoritative README targets, not
   implemented structures or proofs in the suggested file. Analytic claims
   require C, or a specified embedding of the ground field into C.

The BKT source item assigned to this stage is covered by the compactification
import and chart export. Buffered charts and finite refinements for
definability remain a consuming Hodge adaptation. Borel extension itself is
owned by ShimuraVarieties V3 and PELModuli M3. Deligne (4.4.3), p. 51, invokes
Borel; it is not a shortcut to that theorem. Sources routed by the issue to
other stages remain with those stages.

## Validation and the compact Lean boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.7d.json`:
  zero errors and zero warnings.
- The submission file check passed for all four deliverables. The admitted-data
  check passed, and a consistency check matched the reader to both node
  statements, all fourteen API clauses and all nine geometric tests, with all
  API/test names present in the Lean inventory.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.7d.lean`:
  elaborated successfully at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; the only warnings were five
  admitted theorem/example proofs. Tau Ceti's recorded baseline is
  `f790474821cf4256814db967cb154e7af3d0c369`; the file uses Mathlib imports.
- All nine cited Mathlib statements were read at the pin. The reviewed
  AUDIT-01 library coverage and accepted RS-27 were read. Current upstream
  AlgebraicVectorBundles and StableReduction were checked, along with the
  relevant AnalyticToricGeometry and RealAlgebraicGeometry interfaces and the
  current Tau Ceti library. Adic polydiscs do not supply this complex carrier.

WORKERS' current shape rule governs this file: 125 lines, no data definition
with an admitted body, no artificial analytic-space carrier, no development of
geometry. There is one conditional native topological lift signature and five
coordinate/inversion examples. The lift assumes the actual open embedding,
partial homeomorphism and exact image equality; its hypotheses and analytic
enhancement remain geometric obligations. The last example directly consumes
Mathlib's analytic inverse theorem. The inventory comments identify all API
clauses and geometric checks retained in the reader. Successful elaboration
checks these signatures, not the unimplemented constructions or admitted proofs.

## Sources read

All results are restated in our own words, with source locators. The packet
records the URLs, SHA256 hashes, editions and access date 2026-10-16.

- Serre, *Géométrie algébrique et géométrie analytique* (1956), §1 nos. 1–2
  and 4, pp. 3–6; §2 no. 5, Lemma 1 and Proposition 2, pp. 7–9; no. 6,
  pp. 9–11 for the scope boundary. Used only for the smooth local analytic
  realization and gluing.
- Bierstone–Milman (1997), full published article: SNC convention p. 213;
  Theorem 1.10, pp. 216–217; Remark 1.18, p. 225; §3.1–3.5, pp. 231–233;
  Theorems 11.14, 12.2 and 13.2, pp. 290–292 and 297–298. Coordinates feed
  the new smooth bridge; resolution feeds the existing compactification owner.
- Deligne, *Théorie de Hodge II* (1971), (3.1.2), p. 31; proof of (3.1.9),
  pp. 33–34; (3.2.1), pp. 34–35; (4.4.3), p. 51. Used for the local pair,
  the quasi-projective completion alternative and the Borel dependency check.
- Bakker–Klingler–Tsimerman (2020), arXiv:1810.04801v2, §4.1 p. 13,
  corresponding to published p. 928. Used only for the local source pair and
  restriction of a period map; no global definability claim is imported.

No missing or restricted source is needed for the targets in this pass. No
source passage or downloaded document is committed. Resume from the three
specific assembly/realization items above after independent review; no further
issue was claimed by this session.
