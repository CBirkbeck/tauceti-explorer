# Independent review: Hodge structures, Part II — H.3

**Verdict: accepted with corrections.** This is a completed review of the H.3 planning pass, not a checkpoint or a claim of formal implementation. Packet status remains `complete`; stage coverage remains `planned`, with five gaps and twenty-three requests. None of the retained gaps hides a contradictory mathematical assertion. The exact remaining work belongs to the stated supplier interfaces and the suggested signature ledger.

Job `REV-HodgeStructuresPartII--H.3`, issue #7027; reviewer `independent-review-REV-HodgeStructuresPartII--H.3`; agent Codex, session `codex-YfuMXN`; 2026-10-08. The input was written for BP-HodgeStructuresPartII--H.3, issue #6941, by a different worker. The packet's `review.checked` gives an individual finding for every node.

## Counts and scope

| Item | Reviewed result |
| --- | --- |
| Nodes | 43: 35 verified, 8 corrected, 0 added, 0 unverifiable |
| Kinds | 4 definitions, 9 constructions, 13 lemmas, 13 theorems, 3 comparisons, 1 application |
| Planning API | 54 items across 13 definition/construction nodes |
| Discriminatory tests | 39; at least three for each definition/construction |
| Planets | 6, retained |
| Baseline declarations | 28 independently confirmed; 0 removed, replaced or added |
| Public source versions | 7; all recorded SHA-256 hashes matched |
| Source issues | 3 independently confirmed; 0 rejected or added |
| Gaps / supplier requests | 5 / 23, retained and clarified |
| Named omitted signatures | 35 reduced to 33 by typing two existing test plans |

The stage brief requires compact-dual charts, represented Mumford–Tate subdomains, the full ambient carrier, tensor constraints and components, holomorphic period maps and trace/Kodaira–Spencer derivatives. Nodes cover all these targets. At the stipulated target granularity, the existing thirteen promoted API lemmas provide useful named intermediate interfaces; no further proof-step splitting was needed.

The upstream Hodge Structures and Representation Theory/Lie Groups reader documents were read in full. The reviewed library-audit rows were Hodge L0–L3, AlgebraicModuliForArithmeticGeometry R09.1 and ShimuraData D3. The Part II stage order was checked: H.3 imports H.0/H.2 and common variation suppliers, then exports derivatives to H.4, period geometry to H.6/H.7 and filtration symbols to H.8. No consumer result is used to establish its own H.3 input.

## Corrections made in place

1. **Fixed tensor derivatives.** `orbit-hodge-tensors` previously described a period-symbol evaluation vanishing in tensor-violating normal directions. The corrected assertion concerns derivatives **along the orbit**: they satisfy the linearized tensor equations and have zero normal class. This does not say that arbitrary normal tangent directions have zero derivative. Its Klingler locator is now §2.4, Lemma 2.5, printed p.8, rather than §2.3. The fixed rational type-(0,0) tensor, explicit Tate twists and conditional stabilizer/component converse remain intact.
2. **Clarified logarithmic base naturality.** `log-curve-kodaira-spencer`'s API and `log-kodaira-spencer-base-change` now specify a holomorphic map between smooth analytic bases. The map need not be a smooth morphism. The proof uses a natural diagram whose relative tangent terms agree and whose base term maps by the differential. It no longer asserts that pulling back identifies the two absolute tangent sequences. This is the naturality consequence of the connecting map in Landesman–Litt Definition A.1.5 and Remark A.1.6, p.56.
3. **Used finer H.2 nodes.** `curve-hodge-filtration` now directly imports `H.2/canonical-extension` and `H.2/log-comparison`. Their actual analytic SNC/absolute comparison statements were read. The relative analytic curve-family comparison, unitary complex-coefficient degeneration, evaluation and direct-image fibre/base-change statements are stronger; they remain in the H.2 stage request and the existing gap. No canonical extension or comparison is defined a second time.
4. **Separated source statements from deductions.** `negative-exponential-map` and its promoted `exponential-filtration` lemma no longer combine a Pink source id with a Schmid locator. Pink Proposition 1.7, printed p.13, supplies the homogeneous tangent quotient. Exponential action on the filtration is an authored consequence of the explicitly supplied complex exponential and representation action; the local inverse theorem is a separate conditional result.
5. **Repaired and strengthened suggested tests.** `markedPeriod_steps` now compares two supplied families whose filtration steps differ and concludes their marked points differ. It previously repeated the projection formula. `negativeOrbit_shear` is now a typed square-zero continuous-endomorphism example, with literal matrix-exponential and action compatibility; it detects a nonzero parameter sending the reference line to a different line. `horizontal_twoStep` is now a typed five-dimensional symmetric-form example with a Q-skew grade −2 operator whose nonzero quotient class is outside the horizontal image. The scalar exponential test is supported by an explicit all-integer Tate Lie-filtration calculation. These helper fixtures are tests, not new roadmap nodes.
6. **Corrected source and ownership metadata.** Pink's old www.math.ethz.ch chapter URL returns 404. The people.math.ethz.ch URL serves the same SHA-256 and now appears throughout the packet and reader. The complete BKT erratum reading range is §§1.1–1.6. A stale R09.4 sentence in the trace/moduli gap now names the already-requested StableReductionPartII MC.2 analytic deformation/cotangent dictionary.
7. **Reconciled the reader and verification receipts.** Replaced its three verbatim source quotations with paraphrases, retaining exact locators, mathematical checks and corrections. Added the three independent source-issue verdicts. The reader agrees with every corrected node, API/test statement, supplier request and gap. The planner's historical extracted Mathlib-only Lean check is attributed to the planner and is not presented as an independently reproduced check or a whole-file compile. Dates, source-version/hash verification, baseline confirmation and the 33-name omission count are explicit.

The eight corrected node ids, after the shared `HodgeStructuresPartII:H.3/` prefix, are `negative-exponential-map`, `marked-period-map`, `log-curve-kodaira-spencer`, `orbit-hodge-tensors`, `curve-hodge-filtration`, `exponential-filtration`, `log-kodaira-spencer-base-change` and `horizontal-subspace`. All other nodes have individual verified entries. Metadata and reader corrections also apply where those objects are cited.

## Mathematical checks and source evidence

The review checked the needed mathematics against the public versions in the packet, rather than treating source names as evidence. Full target proof routes were read where supplied: [Schmid](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3, printed pp.221–228; [Pink](https://people.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), Propositions 1.7/1.10 and Lemma 1.8, printed pp.13–15; [Landesman–Litt](https://arxiv.org/pdf/2205.15352v4), §5.1, pp.27–29, and Appendix A, pp.54–57; and [Gao–Habegger](https://arxiv.org/pdf/1801.05762v3), §4 through (4.2), pp.15–17. [Klingler](https://arxiv.org/pdf/1711.09387v1), §§2.3–2.6 and §§3.1–3.2, printed pp.7–11, supplied the tensor/represented-period conventions. The selected period setup of [Bakker–Klingler–Tsimerman](https://par.nsf.gov/servlets/purl/10200187), §1.3, p.920, §4.2, pp.928–929, and §4.4, p.931, was checked with its [complete erratum](https://benjamin-bakker.github.io/DefArithErr.pdf). Packet `readLimits` records the invoked general results whose proofs were not read. No private library source was used.

The sensitive distinctions hold after correction:

- Compact-dual flags impose the first bilinear relation, while native domain points also impose opposedness and the pinned strict polarization factor. All integer filtration indices, including the Tate jump at −m, are retained.
- A represented CM torus orbit is a point, whereas the weight-one ambient domain has a positive-dimensional component. A connected MT orbit is open in its own complex orbit. The positive scalar centre is ineffective; compact isotropy belongs to the normalized/effective isometry action.
- The tangent quotient has all negative grades, whereas horizontal tangent has only grade −1. A grade −2 direction is not automatically horizontal. Pink Proposition 1.10 gives the separate criterion for a tautological variation.
- The period derivative is the quotient connection symbol, with its ordinary Leibniz term killed modulo the filtration. Its passage to the graded Higgs operator requires transversality and uses the exact H.0 supplier nodes.
- The unitary complex logarithmic curve map uses Grassmannian **quotient** rank r−s and does not infer an integral lattice. The derivative has the positive Kodaira–Spencer cup/evaluation sign with the specified convention. The alternate fibre-holomorphic lift requires actual F¹ fibre base change, evaluation and a smooth split logarithmic one-form sequence; mere smooth-bundle local triviality would not justify it.
- Trace multiplication lands in ω²(D), not ω²(2D). Vector-bundle Serre duality gives the intrinsic factor κ dual before an analytic stable-moduli cotangent identification. Rank equality requires injectivity of that factor on the trace image; it does not hold for every family. Row-normalized abelian periods and the right cycle-marking block formula preserve their chosen convention.

All foreign node statements were read: H.0 filtration/Higgs nodes, the existing H.2 extension/comparison nodes, ShimuraData D1/D3, SF.2 proper Serre duality, and StableReductionPartII key/MC.0/MC.2. Requested stage contracts were checked against their owner scope. ShimuraData and StableReduction supplier review/readiness limitations are retained. Upstream real Lie groups and G/B do not silently supply the stronger complex exponential and general parabolic analytic quotient. The existing one-owner Lie groups Part II proposal remains appropriate; no upstream or supplier file was changed.

## Baseline audit

Every cited declaration was read with its ambient variables and hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists all twenty-eight names, modules, lines and individual independent receipts. No citation was removed or replaced.

The audit confirms the native Hodge structure/type/polarization, fixed-form period point and Tate carriers, tensor/dual/internal-Hom operations, integral base change and isometry groups. Mathlib supplies the Grassmannian functor with quotient rank, group-action orbit carrier, linear quotient maps/equivalences, determinant-unit matrix inverse and Banach-algebra exponential. The packet accurately states their limits: additive sheaf cohomology is not a ready coherent C-linear analytic dictionary; orbit sets and Grassmannian carriers are not complex manifolds; the algebra exponential is not an already-supplied generic complex Lie exponential. Near misses therefore remain supplier gaps, without redefining existing library objects.

## Validation and implementation boundary

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.3.json` reports **zero errors and zero warnings**. The embedded `source_issues.check_issues` and `check_errata.versions_checked` checks also pass. Independent name/reader reconciliation checked all 43 node statements, hypotheses, proof routes and source locators, all 54 APIs and 39 tests, all 23 requests and five gaps, the unique per-node verdict set and unchanged `unchecked` implementation statuses.

The suggested omission ledger contains **33 distinct names**: two constructions, six additional API items, eight tests and seventeen global results. Each has its mathematical statement and a precise supplier/interface gap. Typing them awaits actual represented analytic, coherent/cohomological or moduli types. They are not declarations proved by placeholders, and acceptance does not imply that the file has every global signature elaborated.

The prescribed `lean-check` was attempted with more than 20 GB available memory. It stops at the first import because `TauCeti.Geometry.Hodge.PeriodDomain.olean` is absent. The supplied build has the exact Mathlib pin but Tau Ceti checkout `cf386627e9176a3827c1a5fe804989fd94a4d216`, beyond the packet's pin. No compatible ready build was found, and no library build, cache fetch or language server was started. **The whole suggested file did not compile; none of its signatures was independently elaborated through this attempt.** All proof placeholders and implementation statuses remain honest.

## Questions for the orchestrator

There is no unresolved question blocking acceptance. The ordinary follow-up machinery should retain the five gaps and precise `coverage.remaining` list. Ownership still needs the recorded generic complex Lie groups Part II extension; the analytic stable-curve dictionary belongs to MC.2/C0/C2, not a second M_g,n construction in H.3. The confirmed source issues are available for the programme's normal errata routing. This review opens no additional job and changes no atlas data by hand.
