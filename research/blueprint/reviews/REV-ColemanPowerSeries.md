# REV-ColemanPowerSeries

Accepted, 5 October 2026. Independent reviewer: Codex — `codex-QbO9eb`, issue #374, claim comment 6000175633 confirmed by bot comment 6000178713. This session did none of the planning work being reviewed.

The acceptance covers the finished 300-node planning pass. It does not close the roadmap or certify an implementation. L0 and L1 remain partial; L2, L3 and L4 are planned with explicit supplier requests and refinements. No stage is closed. These statuses satisfy PROTOCOL §0: the remaining original-Coleman/unramified arithmetic source and canonical structure comparisons are recorded boundaries, rather than asserted results.

## Counts and scope

| Item | Checked result |
|---|---:|
| Nodes | 300: 251 corrected, 49 verified, 0 added, 0 unverifiable |
| Kinds | 2 definitions, 51 constructions, 181 lemmas, 44 theorems, 22 comparisons |
| Baseline declarations | 283 confirmed: 280 Mathlib, 3 Tau Ceti |
| Exact external node suppliers | 56 distinct statements checked |
| External stage leaves | 5, each backed by precise requests |
| API items | 223 total; 216 on definitions/constructions |
| Unit tests | 249 total; 167 on definitions/constructions |
| Definition/construction nodes | 53, each with an API and at least three tests |
| Suggested examples | 251: 249 packet tests and 2 additional examples |
| Planets | 23 |
| Requests / gaps | 13 / 6 |
| Source findings | 13 confirmed; none rejected or newly duplicated |
| Accepted paper-correction references | 7, including 3 added cross-references |

The node-by-node verdict and proof-critical check are in the packet's complete `review.checked` ledger. Every mathematical statement, hypothesis, proof sketch, prerequisite, API signature and test statement was checked. All 300 mathematical statements, proof sketches, prerequisite lists, API items and test statements are preserved. The 251 corrected verdicts reflect source evidence, test tags or acceptance-note corrections, not replacement mathematical claims.

| Stage | Nodes | Planets | Coverage |
|---|---:|---:|---|
| L0 | 97 | 4 | partial |
| L1 | 81 | 6 | partial |
| L2 | 44 | 4 | planned |
| L3 | 48 | 4 | planned |
| L4 | 30 | 5 | planned |

## Sources and conventions

Fresh public copies were downloaded and their hashes matched all three recorded editions:

- [Rodrigues Jacinto–Williams, publication](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Essential Number Theory 4 (2025), 101–216, DOI 10.2140/ent.2025.4.101. SHA256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`. Read complete printed pp.161–189, plus operator passages pp.126–129 and pp.136–139. Rendered and inspected printed pp.137, 168, 170, 183 and 184.
- [Rodrigues Jacinto–Williams, arXiv v2](https://arxiv.org/pdf/2309.15692v2), 19 December 2024. SHA256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`. Read p.21, pp.26–28, pp.48–52 and pp.57–65 to collate the operators, findings and terminal conventions.
- [Coates–Sujatha, public publisher-layout copy](https://www.math.mcgill.ca/darmon/courses/16-17/gs/Coates-Sujatha.pdf), Springer 2006. SHA256 `38178a8a147169c3750b7693c46c7453954790b101b37c2690f8e8cda91b0789`. Read printed p.1 and pp.13–22; rendered and inspected p.15. This covers all cited book passages, not the whole book.

All 309 node-source objects now have literal identifying excerpts of at most 300 characters. For the first 251 nodes, weak excerpts such as single variable names and generic proof labels were replaced by the relevant statement, formula or proof passage. This also fixes the Lemma12.12 locator paired with a Lemma12.11 excerpt and the 36 nonliteral unit-lifting excerpts in nodes158–193. The source matches distinguish arbitrary-ring, all-prime and native-carrier worker derivations from the sources' odd-prime arithmetic assertions. Lemma10.5 was added explicitly to the raw-sign node's locator. Historical reading provenance remains attributed to its original workers.

A bounded 5 October check of the arXiv history, both authors' pages and the Springer book page identified no linked correction. The inspected URLs and limited scope are recorded in `provenance.independentReview`; no exhaustive novelty claim or author contact is asserted.

The crucial conventions are consistent throughout: source level n+1 corresponds to packet level n; the determinant norm and trace are base-valued; the scalar Frobenius algebra is distinct from its target ring; the raw composite `Col0` is negative on the independent Dirichlet numerator, and the packet chooses `Col = −Col0`; the terminal cokernel is the first moment, not total mass; and full units retain their prime-to-p torsion while principal units alone receive the p-adic module structure.

## Baseline and ownership

Every baseline declaration was opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Checks included ambient section hypotheses and native carriers/topologies, rather than just declaration names. Examples requiring special care were the finite-dimensional continuity hypotheses, complete receiving-ring evaluation assumptions, the cyclotomic automorphism's irreducibility hypothesis, the four fields of `PowerBasis`, the valuation-integer certificate, and the nonarchimedean-local-field assumptions on Tau Ceti's Teichmüller API. Their arithmetic specializations either satisfy these hypotheses or name the precise canonical adapter request.

No citation was removed or replaced, and no near miss required a new node. One description was corrected: `IsDiscreteValuationRing.irreducible_of_span_eq_maximalIdeal` proves irreducibility of a **nonzero principal generator of the maximal ideal** in a local domain/commutative semiring. It does not assert that every maximal ideal equals the canonical one; its namespace also does not impose a DVR instance. The citing cyclotomic argument has the required nonzero generator and ideal equality.

The reviewed library audit, the five Coleman layer contracts, accepted RS-16 and its review, and the relevant supplier/consumer documents were read. The two upstream comparison documents were LocalFieldsRamification and Multiquadratic; ProfiniteProPGroups was additionally read at the requested pro-p/module interfaces. PMIA, Dirichlet L1, Integral Iwasawa L0/I.8 and the Euler-systems consumer boundaries were checked against their actual statements. Coleman does not re-plan their measure operators, generic Weierstrass preparation, global cyclotomic generators, completed algebra or general pro-p module theory.

All 56 distinct external node statements and the five stage leaves were checked. The full reachable graph has 553 nodes and 2,457 prerequisite edges and is acyclic. The exact stage leaves are DirichletPadicLFunctions L1 and PadicMeasuresIwasawaAlgebras L0, L1, L3 and L5. Their outstanding receiving-ring, action, coefficient-lattice, plus-pseudomeasure and completed-tensor interfaces remain explicitly requested.

## Corrections made

1. Replaced the source excerpts described above; refreshed source reading/version metadata with independent provenance.
2. Changed eighteen invalid test-kind labels to the protocol vocabulary: thirteen `value` and four `concrete` labels became `computation`; one `invariance` label became `compatibility`. Names and mathematical test statements are unchanged.
3. Corrected the baseline description and appended the independent pinned-source check to all 283 entries.
4. Updated nine stale acceptance notes: constant norm-fixed units, the restricted logarithmic kernel, fixed-space topology, conditional image lifting, residue-image equivalence, reduction-kernel maximality, the integral norm bound, arithmetic compatibility and the residue map. They now point to the later nodes that supply the formerly outstanding result. Canonical owner comparisons remain open.
5. Updated the integral-closure/source matches to identify the subsequent topology and valuation specializations instead of suggesting they had never been planned. Full-unit source matches now cite the accepted E62 correction explicitly.
6. Removed the contradictory final sentence in the PMIA L2 request: Coleman already supplies its intrinsic unit-weighting comparison from the exact PMIA weight, support and inverse-Mahler identities. Added the L3 and L4 finite-flat comparison nodes to the PMIA L0 coefficient-lattice request's consumers.
7. Added independent `confirmed` verdicts and specific reasons to all thirteen source findings. Reused accepted paper findings E62, E76 and E105, alongside the existing E73/E74/E75/E107 references; the paper extraction keeps errata ownership.
8. Updated two stale suggested-file comments to point to subsequent fragments. Made `realPrincipalUnitQuotient` an `abbrev` of the native submodule quotient so its native instances are available through reduction. No new carrier, theorem statement or purported proof was introduced.

No nodes or planets were added; no mathematical node statement, ownership boundary, stage status or gap was removed.

## Source findings

| Finding | Independent confirmation / repair |
|---|---|
| E1 | Theorem10.15 has the raw Coleman sign wrong; use the recorded negated convention. |
| E2 | Root translations require receiving-ring scalar extension, followed by descent. |
| E3 | A negative integral exponent gives a unit power series, not a polynomial. |
| E4 | Lemma10.11 congruences first live in the receiving integer ring. |
| E5 | The geometric-sum formula has the wrong sign; a=3 detects it. |
| E6 | The decay assertion fails at a=−1; retain the positive smoothing range. |
| E7 | The zeta-zero assertion misses k=1, where the Euler factor vanishes instead. |
| E8 | Bounded psi cannot be applied to the pole 1/T without a justified extension. |
| E9 | The arbitrary-unit expansion must include its constant coefficient. |
| E10 | The preparation/finite-zero assertion requires a nonzero series. |
| E11 | The book's root congruence also requires the receiving integer ring. |
| E12 | The first nonconstant Frobenius coefficient has factor p^r, not p. |
| E13 | The logarithmic kernel is μ_(p−1), not μ_p. |

The terminal repairs are substantive: `(1−a)/2` gives the real generator; finite cyclotomic cyclicity uses closure of global powers rather than a false equality of algebraic power subgroups; all p-adic Tate exponents survive the inverse limit; the adjusted principal generator includes its Teichmüller correction; and principal augmentation is identified before multiplication by the pseudomeasure. The finite-flat Coleman sequence tensors all four terms, including both endpoint lattices. The real comparison retains the actual local-unit quotient on the left.

## Validation and elaboration limit

- Pinned-index `scripts/check_blueprint.py`: **0 errors, 0 warnings**.
- Source-finding data, exported to a filename-correct scratch input for `scripts/check_errata.py`: **passed**.
- Four deliverable paths checked with `research/blueprint/intake.py check-files`: **0 problems**.
- Literal excerpts, unchanged mathematical content, full 300-entry review ledger, API/test-name parity, minimum test counts, allowed test kinds, planet counts and expanded dependency graph: **passed**.
- Independent exact arithmetic: **66 checks passed**, covering determinant norms at p=2,3,5, trace basis values, cyclotomic ratios, reduction and precision, rational weighted derivatives, negative exponents and the p=5 real-generator powers. Three negative controls detect plausible wrong conventions. These finite computations certify no infinite limit, topology or formal proof.
- `git diff --check`: **passed**.

The suggested file **did not elaborate**. Both `lean-check` attempts stop at the existing missing object for `TauCeti.RingTheory.MvPowerSeries.Substitution`, before checking the file's signatures. The prepared Mathlib matches the pin; the prepared Tau Ceti is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the recorded Tau Ceti pin. Proposed supplier modules are also unprepared. No dependency, native module or language server was built or started. The final file SHA256 is `b5355a7276b9cfba78547f288662b4f8c6c96f46ad74cf4b1d792b9d1f5d0469`. Static parity is checked; full-file elaboration remains an explicit limitation, and all nodes remain `implementationStatus: unchecked`.

## Orchestrator follow-up

No question blocks acceptance. Preserve the partial/planned statuses and route their precise `remaining` lists to follow-up work. The unread original-Coleman/unramified or semilocal arithmetic coefficient variant is separate from formal finite-flat tensor transport. Prepare the pinned native and supplier modules before accepting any implementation claim. Keep the existing global, PMIA, Dirichlet and upstream local-field/pro-p ownership; retain the actual real local-unit quotient and both Tate endpoints when refining the final interfaces.
