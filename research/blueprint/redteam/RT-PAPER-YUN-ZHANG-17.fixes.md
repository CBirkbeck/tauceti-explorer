# FIX-RT-PAPER-YUN-ZHANG-17

Codex, session `codex-J6LwjP`, 30 September 2026. Refs #5135.

The two assigned extractions and the YZ17 reader now implement all fourteen
confirmed findings within their permitted scope. Finding /3 was rejected and
its existing shared owner is preserved. The generated issue listed only the
medium findings; this repair also follows all seven low findings and the
verifier's qualifications. Queue-generator changes, unassigned companion
readers/reviews and the FYZ24 correction are exact maintainer handoffs below.

YZ17 now has 70 items: 5 library, 16 planned and 49 missing, with six routes.
All original IDs remain. YZ19 retains all 240 item IDs/statements/statuses,
all 71 source issues and its open proof gates; only ownership, briefs and
explanatory provenance change. Neither file claims new formalization or
independent acceptance of the changed routes.

## Findings and repairs

| Finding | Change and verification |
|---|---|
| /1, confirmed | YZ17 items 7–9 and 12–14 move from number-field GZ.5 to the shared function-field analytic/cycle tranche. All 18 YZ19 items in the old GZ.5 source route move to that same tranche, including /149 (= YZ17/28). Empty source routes are removed; GZ.5 is comparison only. Theorem 4.7 is proved by the function-field adapter, importing FA.2/FA.6 and generic AL.2/AL.3 inputs. |
| /2, confirmed | Both briefs say the shared cycle id is provisional and require the complete joint YZ17/YZ19/FYZ24 tranche. The current parent-grouping generator can still defer it; this tooling decision is handed off below, not falsely marked repaired in code. |
| /3, rejected | YZ19/116 stays in the SF.1/SF.5 source route. Its statement and missing status are unchanged; no duplicate Octahedron Lemma is created. |
| /4, confirmed | Item 41 is narrowed to scheme intersection theory. New /44 assigns the missing stack operations to the same SF.5 source owner as CANNING-LARSON-PAYNE-24/12, alongside existing Appendix A items. It retains the DM/representability, vector-bundle normal-cone, smooth-presentation, regular-immersion and dimension hypotheses of §A.2.10, rational coefficients and finite-flat-presentation conditions. The already-present Kresch [13] entry is augmented with p.489's DM deformation use; it was not absent from the current bibliography. FYZ24/32 is outside the assigned paths; see handoff. |
| /5, confirmed with qualification | Item 42 retains FA.6's existing fixed-level cuspidal finiteness and Satake foundation. New /45 exposes the function-field continued Eisenstein series and kernel decomposition; /46 exposes ordinary automorphic multiplicity one. Existing YZ19/233 remains the single strong-multiplicity-one contract, distinct from multiplicity inside the function space. |
| /6, confirmed | The AL source reason now carries entireness, order-at-most-one and field distinctions, B.1's non-polynomial restriction, the correct function-field pole clearer and the import of FA.5. No FA stage is put in an AL route. The analytic brief distinguishes J(0,1_K,s)=L(η,2s)+L(η,−2s) from J(∞,1_K,s)=2L(η,0). Lemma B.3's self-duality hypothesis is restored in the reason. |
| /7, confirmed with qualification | New /47 exposes canonical products, zero summability, locally uniform convergence and the order-at-most-one factorization used by B.1. It joins the existing AN.2 analytic proof debt, consumed by AL.2; there is one reusable supplier. Mathlib's zero-free Jensen circle-average result and Tau Ceti's averaged-derivative Hadamard factor are inspected and not miscredited. Constant/finite-product exceptions are explicit. |
| /8, confirmed with qualification | New /48–59 expose the eight families of geometric/cohomological inputs, distinguishing existing suppliers from missing adapters. The dependency fields connect them to the consuming items. The shared stacks proposal owns /35, /56–57 and YZ19/120, /227. The exact Picard Lang theorem remains GS.0 work; group/Frobenius descent /53 is a separate remaining input. The exterior-power comparison is the unramified specialization of YZ19/165, with YZ19/170 supplying the shared Picard-local-system adapter. DWP.7–8 is connected to Lemma 7.13's weight argument, separately from RH. |
| /9, confirmed with qualification | /60–63 expose FA.2 harmonic analysis, FA.6/GS.1 spherical Hecke/Satake, FA.4–5 reciprocity/Chebotarev and the exact GS.3/cuspidality-equals-hecke-finiteness node. The coefficient/lattice adapter remains explicit. /64 is the missing exact Whittaker/period normalization, not falsely covered by AL.3's generic unfolding statement. |
| /10, confirmed with qualification | New unreviewed E38 records Lemma 7.15(3) → (2); E39 records the harmless slips with the corrected p.821 locator. Actual novelty searches are recorded. The cuspidal/Eisenstein disjointness input is /70, linked to /24 and /29, without filing the paper's abbreviation as a new mathematical gap. |
| /11, confirmed | E28 drops the false p.824 smoothness accusation and retains its two genuine slips. The old complete entry and verdict are archived in `reviewHistory`; the narrowed entry has no fabricated current approval. /51 records the vector-bundle/norm/base-change proof. |
| /12, confirmed | Structured published provenance preserves the original author's-copy full reading on 22 September. Fresh Annals and v3 downloads/targeted checks are dated 30 September and reproduce both hashes. `collation.provenance` now returns `published`; generated collation outputs are left to intake/maintainer. |
| /13, confirmed | /65–69 credit the pinned arithmetic divisor, Riemann–Roch, canonical-degree, bounded-effective-divisor and class-number APIs. Relevant consumers link to them. The reader's blanket “Library. Nothing” is removed, while the necessary scheme/Picard comparisons remain explicit. |
| /14, confirmed with qualification | The AL reason and reader identify the pending GZ.5 unconditional PGL₂/Q central-value proposal as an overlap. The all-derivatives theorem remains at its actual conditional/entire-function scope. No GZ.5 → AL.2 edge is introduced. |
| /15, confirmed | Corrected the Hecke/shtuka balance distinction, Lemma 6.7 fundamental-cycle hypothesis, degree-bound-versus-smallness wording, both DM hypotheses of A.11, perverse and finiteness locators, and E9's missing exponent. Historical review language is flagged rather than silently given a new verdict. The misleading r=1 “specialization” of the even-r theorem is also replaced by the sequel's parity/level comparison. |

## Ownership and proof obligations

The YZ17 route counts are 33, 8, 3, 2, 1 and 2. Every missing item appears
once. The YZ19 routes contain 64, 1, 2, 2, 2, 129, 28 and 3 items; its 224
missing items each occur once, and its existing seven routed planned items
remain source contributions. Source routes never mix stages of different
roadmaps.

The scheme trace item /48 names EDC.8 only as the existing import boundary
for `UPSTREAM:CohomologicalPointCounting:TraceFormula:0-4` (PR196); the upstream
roadmap is not re-planned. The checked atlas does not index that upstream
identifier as a standalone stage. The same principle applies to EDC.0's
upstream Künneth import. Generic stack operations instead follow the existing
`EtaleDualityAndPerverseSheavesPartIIStacks` proposal in RT-AREA-etale/3,
including its Laszlo–Olsson/Liu–Zheng/Sun acquisition and boundedness contracts.
ST.0–ST.6 are provisional design keys. The published YZ17 small-map arguments
do not establish a general Artin-stack decomposition theorem; the exact
required DM consequence remains a source obligation.

The SF source route explicitly distinguishes SF.1 torsion-sheaf geometry,
SF.3 section/norm/Prym adapters and SF.5 stack intersection theory. Rational
coefficients, finite type/proper supports, finite flat presentations and the
§A.2.10 top-degree Gysin hypotheses are not replaced by an unrestricted
Artin-stack package. Generic cycle-class/duality compatibility uses the shared
stack sheaf owner. Existing Proposition A.5 and the Octahedron Lemma retain
their single source owner.

AN.2 already records an unclosed Hadamard/logarithmic-derivative input in
`AnalyticNumberTheory--AN.0.json` and the integrated decomposition. The new
source route is a concrete request to close that common complex-analytic
input, with AL.2 importing it. It does not certify that source proof or create
another factorization inside AL.2. Suggested later files and design examples
are in the relevant Part II briefs; actual API/proof decomposition is the
owning blueprints' work under PROTOCOL §§3–4,12–13,16.

## Required maintainer actions outside the assigned files

1. **Queue preservation (/2).** `make_queue.py:paper_designs` currently groups
   Part IIs by `("part-ii", parent)` and tells a designer to plan the first
   independent direction and propose a restructure for the rest. Preserve
   overlap reconciliation, but replace that deferral instruction for required
   tranches with: “Account for every accepted contribution and every dependency
   it supplies. Retain the joint YZ17/YZ19/FYZ24 special-cycle tranche in this
   design, or provide a coordinated split with explicit supplier, consumer and
   blocking-dependency records before any dependent design is complete.” A
   coordinated split may instead create a dedicated cycle job after checking
   overlaps. Blindly creating a job for every proposed id is not the requested
   fix. The current grouping preserves briefs; the defect is permissible
   deferral, not data loss. Regenerate the queue only after the maintainer's
   chosen mechanism is implemented.
2. **Route reviews and indexing.** The unassigned review files still describe
   the old routes. YZ17 old 1→1; old 2's items→1; old 3→2; old 4→3 with changed
   kind/owner; old 5→4; new 5 and 6 need review. YZ19 old 1→1; old 2's items→6;
   old 3→2; old 4→3; old 5→4; old 6→5 with changed kind/owner; old 7→6 except
   /227→5; old 8→7; old 9→8. These are reconciliation instructions, not
   acceptance verdicts. Run the independent fix review before using numeric
   entries in `accepted_routes` as approval of the new route set. The JSON
   `repairReviewScope` records this warning in both files.
3. **FYZ24/32 and its reader.** Narrow the existing planned SF.5 claim to
   scheme Chow/Gysin foundations. Add a missing stack-operation input with
   the actual source/morphism/coefficient conditions, coalescing with
   YZ17/44 and CANNING-LARSON-PAYNE-24/12 at the SF.5 source owner. Its general
   Octahedron import stays YZ17/34 = YZ19/116, not a new cycle theorem. Import
   the shared EDC stacks proposal for sheaf/trace operations. That file is
   not one of this issue's deliverables.
4. **YZ19 reader and generated outputs.** Synchronize its unassigned Markdown
   reader with the eight repaired routes and their current owners. Earlier
   `validation`, `coverage`, `completion` and `relatedExtractions` in its JSON
   are historical, explicitly scoped by `repairReviewScope`; this fix does
   not claim to repeat the original full-paper reading or its finite tests.
   Let normal intake/maintainer regeneration update the errata register and
   collation worklist. No generated atlas/queue/register file is edited here.

## Source evidence and scope

Downloaded the [Annals publication](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf)
and [arXiv v3](https://arxiv.org/pdf/1512.02683v3) on 30 September 2026:

- Published: 145 pages, SHA-256
  `b02ed5cbe5e6443a59360551cd41048ebb1e589d3c4cbe89f7fcbbbec50fc111`.
- v3: 97 pages, SHA-256
  `76bb3576bc75dc1c5214597197e3d8ef62abc10784e2b2625657a0e7ea1821ff`.

Both match the existing full-reading record. Fresh reading covered the
specific dependency/proof passages on published pp.789,791–792,795–796,
800–809,818,821,823–824,830,832,857,864,866–867,870,872–873,878,880–883,
889,896–897,902–905, and the typo contexts on pp.828,862. Rendered pp.824,
878 and 889 were checked to disambiguate hats, indices and Gysin hypotheses.
Targeted v3 checks confirm the bad 7.15(3) reference on p.77 and the two
missing prepositions on p.43. This is not another full-paper reading, nor a
fresh reading of every external reference cited by the paper.

For E38–E39, actually checked the Annals article page, Yun's research page,
Crossref work metadata (empty relation, no update fields), arXiv's version
history and targeted web searches. No separate correction was found in
those searches. Versions v1–v2 were not read; no such search is claimed.
E38/E39 and the narrowed E28 have no self-assigned review verdict.

Read the verifier in full, the relevant FA/GS/SF/EDC/DWP/AL stage contracts,
GS's exact Picard-Lang and Hecke-finiteness nodes, the existing stacks
proposal, the AN.2 gap and the pending GZ.5 positivity proposal. Checked
reviewed audits AUDIT-20 (FA.1), AUDIT-01 (SF.5), AUDIT-18 (EDC.8) and
AUDIT-06 (AN.2). Pinned library statements were read in:

- Tau Ceti `Divisor/Basic.lean`, `RiemannRoch/Basic.lean`,
  `Differential/CanonicalDivisor.lean`, `RiemannRoch/ClassNumber.lean` under
  `FieldTheory/FunctionField`, all at `f790474821cf4256814db967cb154e7af3d0c369`.
- Mathlib `Analysis/Complex/JensenFormula.lean`,
  `AnalyticOnNhd.circleAverage_log_norm_of_ne_zero`, at
  `082e2d37e8b0463410cdb532e111cd43d5a66174`: the zero-free analytic
  closed-ball circle average equals the central log norm.
- Tau Ceti `Analysis/Calculus/Hadamard.lean`: `hadamardFactor` is the average
  of the derivative along a segment, not an entire-function zero product.

## Validation

- Both `scripts/check_paper.py` checks pass.
- `research/blueprint/intake.py check-files` checks the four deliverables.
- Structural checks: original IDs retained; every missing item routed once;
  all YZ19 statuses/statements/source issues unchanged; rejected /3's owner
  preserved; all unrelated YZ17 source issues byte-equivalent as JSON values;
  the original E28 record archived intact; new/narrowed findings unreviewed.
- `source_issues.check_issues`, `check_errata.versions_checked` pass, and
  `collation.provenance` returns `published` without regenerating outputs.
- Independent sanity checks reproduce the negative second derivatives
  `−0.1299825549130117` and `−0.16011520959994918` at q=3 behind E15/E17,
  justifying the restrictions carried into the AL reason. The E28 dimension
  identity `(d−g′+1)+(g−1)=d−g+1`, with g′=2g−1, was also checked in 56
  admissible small cases. These computations are not substitutes for the
  source proofs.
- `git diff --cached --check`.

No Lean file is assigned and none was compiled. The remaining source/proof
closure obligations and maintainer-only changes above are explicit; no
mathematical implementation or tooling fix outside these four files is claimed.
