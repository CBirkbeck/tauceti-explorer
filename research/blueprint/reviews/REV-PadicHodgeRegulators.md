# Independent review: PadicHodgeRegulators

Job **REV-PadicHodgeRegulators**, issue **#10797**. Reviewer: **Codex / GPT-6**, session **codex-sZYuIo**, 19 October 2026. The reviewed blueprint was written by a different worker, session codex-O1RFZ4, in #10826 / #11029.

**Verdict: needs_changes.** The review is complete. The intended mathematical view is substantially careful, but the canonical assembly drops mathematical corrections. This leaves a concrete contradiction between the reader and the declarations that the atlas merger consumes. The 21 explicitly recorded mathematical/supplier gaps are not the reason for this verdict.

## Blocking finding: the intended assembly is not implemented

The root packet contains one node, imports 131 nodes from two unchanged accepted parts, and specifies 27 correction records for 26 distinct imported targets. Its source aliases also distinguish Berger's published numbering from his preprint and identify the supplied Rubin text correctly.

`scripts/blueprints.py:merge_blueprints` collects only each packet's `nodes`. It does not read `imports`, `importedNodes`, `targetCorrections` or `assembly.sourceAliases`. `scripts/promote.py:stage` copies the packet after removing source excerpts; it does not resolve those fields. The blueprint handoff acknowledges the missing correction application, but a manual instruction is not an implemented promotion path.

A read-only invocation of the actual merger with a minimal ten-stage snapshot gave:

| Input | Declarations | Result |
| --- | ---: | --- |
| Root packet alone | 1 | The imported contracts are absent. |
| Both parts and root | 132 | All 27 correction records and aliases are ignored. |
| Intended resolved view | 132 | Obtained only by explicitly applying the root's resolution instructions outside the merger. |

For a concrete example, `L1/dual-exponential` declares the Tate pairing with first argument in H¹(K,V), then writes an adjunction whose first argument is exp of the dual twist. Those arguments do not have the declared order. The root correction introduces the correctly ordered pairings P_W and Q_W, matching LZ §2.4, p.5 and Appendix B.6, pp.39–40. The reader uses that correction; the merged planet still has the old formula. Likewise the root's `L4/good-wach-basis` ownership/kind correction is lost, leaving the generic theorem duplicated rather than imported from PG.6.

The following read-only reproducer can be run from the repository root; it does not promote or write anything:

```python
import json
from pathlib import Path
from scripts.blueprints import merge_blueprints

rid = 'PadicHodgeRegulators'
root = json.loads(Path('research/blueprint/packets/' + rid + '.json').read_text())
packets = [(Path(i['packet']).stem, json.loads(Path(i['packet']).read_text()))
           for i in root['imports']]
packets.append((rid, root))
ids = root['scope']
snapshot = {'roadmaps': [{'id': rid, 'stages': ids.copy()}],
            'stages': [{'id': s, 'owner': rid} for s in ids],
            'stageEdges': [], 'edges': []}
out = merge_blueprints(snapshot, packets, {})
print(out['roadmaps'][0]['blueprint']['declarations'])  # 132
print(merge_blueprints(snapshot, [(rid, root)], {})
      ['roadmaps'][0]['blueprint']['declarations'])     # 1
nid = rid + ':L1/dual-exponential'
planet = next(s for s in out['stages'] if s['id'] == nid)
expected = next(c['fields']['statement'] for c in root['targetCorrections']
                if c['target'] == nid and 'statement' in c['fields'])
print(planet['expansion']['statement'] == expected)    # False
```

A separately scoped change must either implement and validate assembly or migrate the canonical definitions coherently. Simply copying all 132 nodes into this root collides with the unchanged parts' canonical IDs. Editing the merger or either part is outside this review's permitted deliverables. No such edits or promotion were made.

## Inventory and completeness

All 132 intended statements, hypotheses, proof routes, uses and source matches were read. The review checks the intended corrected view while withholding canonical acceptance for the 26 overlay-dependent targets. The per-node receipts are in `review.checked`: **106 verified, 26 unverifiable pending assembly**. “Unverifiable” here concerns the canonical corrected representation, not an assertion that every associated source theorem is unknown.

| Item | Count |
| --- | ---: |
| Definitions / constructions / comparisons | 16 / 33 / 23 |
| Theorems / lemmas / applications | 42 / 17 / 1 |
| API items / tests, definitions and constructions | 260 / 183 |
| API items / tests, all node kinds | 280 / 196 |
| Planets | 34, at most six per stage |
| Pinned baseline declarations confirmed | 31 |
| Supplier requests / supplier-audit entries | 32 / 14 |
| Existing mathematical/supplier gaps | 21 |
| Additional assembly blocker | 1 |
| Source issues | 25: 24 confirmed, one rejected |
| New mathematical nodes added by this review | 0 |

The pre-existing root's one new residue-function definition is retained; it was not added by this review. The two part hashes were verified exactly against the root's import records. No part file was changed.

| Stage | Intended targets | Closure assessment |
| --- | ---: | --- |
| L0 | 3 | Imported period carriers and convention interfaces; no second period theory. |
| L1 | 11 | Local-condition, exponential, integral and semilocal ranges are distinguished. Period cohomology/Euler-characteristic supplier obligations remain explicit. |
| L2 | 9 | Representation-level integral Iwasawa comparison; CC cocycle normalization, pole estimate and Kummer sign remain obligations. |
| L3 | 22 | Euler singularities, fractional analytic targets, growth and determinant/pairing gaps remain separate. |
| L4 | 37 | Genuine evaluation kernels and row transport; integral image descent and general Robba comparisons remain open. |
| D.1 | 8 | Upstream local-field imports and explicit Coleman/Bloch-descent boundary. |
| D.2 | 11 | Special-unit formulas; external early classical syntomic producers; divided and undivided comparisons kept distinct. |
| D.3 | 12 | Derived completion, integral comparison, independent rank, admissible values and difference-spanning are separate inputs. |
| D.4 | 8 | Global export retains normalization; local isomorphism does not prove global injectivity. |
| D.5 | 11 | Curve coordinates and scalar actions, relative hypotheses, and continuous/discrete semistable components remain distinct. |

Every listed planned-stage target exists in the intended view. None of the ten stages claims closure. `status: complete` records a finished planning pass, not a formalisation or closed prerequisite graph; it need not be changed merely for the honestly stated mathematical gaps.

## Sources and corrections

All 35 source identities were inspected at the target/issue passages used, with hypotheses and convention translations checked. `sourceInspection` now separates this review's receipts from the blueprint worker's seven earlier receipts, and retains the exact public URLs and locators. It does not assert whole-paper reading. No source passage or private source file was copied into the repository.

Two corrections were made in place:

- The LLZ Corollary 1.12 page in the logarithmic-elementary-divisors correction and reader is **1107**, not 1103. The other two locators remain Theorem 2.10, p.1114, and Corollary 3.2, p.1117. Canonical application still requires the assembly repair.
- E117's current explanation now matches AC20 Remark 3.2(1), p.15: it prints **Remark 8.6.3**. The proper item is **Besser2000 Proposition 8.6(3), author pp.26–27**, also identified as a proposition by BdJ2003 p.21. The inherited review's claim about a nonexistent Proposition 8.6.6 was a misreading. Earlier verdicts remain historical records, superseded by the current review.

Each of the 22 inherited source issues received this review's own verdict and mathematical reason. E103 remains rejected: the higher-weight factorial comparison has not identified the two input-symbol normalizations and therefore does not establish a source error. The other 21 are confirmed at their stated versions. This does not claim that every allegation applies to all later editions, or that a proof gap disproves a theorem.

Three known GSWZ findings were absent from this roadmap's register and were added with independent confirmation:

| Added issue | Locator | Finding | Earlier paper record |
| --- | --- | --- | --- |
| E118 | Example 4.3, (273), p.54 | Second root label is exponent two. | E56 |
| E119 | Proposition 3.3, (179), p.38; Theorem 9, p.39 | Every root component must differ from one. | E38 |
| E120 | Theorem 9 proof, p.39; Lemma 3.1, p.38 | Completed integral containment requires an independent argument before root generation. | E39 |

The earlier records are in `PAPER-GAROUFALIDIS-SCHOLZE-WHEELER-ETAL-24.result.json`. These are additions to this packet's register, not claims of newly discovered errata. They were already accommodated in the intended mathematical plan. The reader now includes all 25 current verdicts. Earlier workers' publication/errata searches remain attributed to those workers; this review makes no new general publisher-search or author-contact claim.

## Baseline, ownership and suppliers

All **31** declarations were opened at their full pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their statements support the limited `provides` claims. The finite Kummer map, Teichmüller section, polynomial/linear algebra and elementary periods do not provide continuous cohomology, completed Chern maps or the regulator engine. No baseline citation was removed or replaced; each has an independent confirmation receipt.

The reviewed library audit and the current read-only upstream library were checked. The screen also included the nine newer upstream roadmaps named by WORKERS.md and the four named completed roadmaps. The relevant current interfaces are LocalFieldsRamification Layers 1–2 and NumberFieldArithmetic Layer 5. No generic unit, unramified-field or semilocal tensor/product theory is planned a second time here.

One further ownership note was added: current **LocalGaloisGroups Layer 7, Steps 1–2** already specifies the completed multiplicative module A(L), its transitions, Z_p-action, Galois action and torsion/free quotient. The Selmer supplier should reuse it for continuous Kummer theory; the cohomological limit comparison remains additional work. Upstream roadmap `0d144d04` and Tau Ceti `a91d3aa` were read without building or editing them. These signatures are not misreported as completed library implementations.

The **184 named cross-roadmap supplier statements** and **24 stage-only contracts** were read against the dependencies and 32 requests. In particular, actual PG/LAD/PHT contracts are imported where they exist; proposed CS.0–CS.3, relative filtered/Ext, general differential-Robba and Vologodsky/index producers remain requests or named gaps. A statement-only supplier and its recorded proof gap are not treated as an implementation. No upward ownership move or new generic carrier was introduced.

The four handed-over findings are handled correctly in the intended view:

| Finding | Assessment |
| --- | --- |
| RT-AREA-iwasawa-1/19 | Keep Bloch–Kato input at Selmer L4; generic Selmer L2 does not acquire period-ring prerequisites. |
| RT-AREA-iwasawa-2/3 | D2 consumes an early external classical log-syntomic prefix; rejected CN/CDN routes are not reinstated. Modified twists, divided small-weight bounds and undivided bounded comparisons remain distinct. |
| RT-AREA-ktheory-2/15 | The K3BlochGroups V4 → D2 → D3/D4 → Habiro HB7 chain is retained. |
| RT-AREA-ktheory-2/18 | Generic finite Soulé classes/products are routed through the early M7-dependent producer, avoiding a D2 → late M8 cycle. Habiro retains its special class/character interface. |

## APIs, tests, planets and Lean

All 49 definitions/constructions have at least three discriminating tests and usable APIs. The tests distinguish, among other failures, a nonunit integral shear, incorrect inverse transport of coefficient rows, the excluded root one, an unjustified ordinary K-group tensor completion, and loss of the semistable discrete component. Heavy arithmetic objects remain detailed reader targets; the suggested file does not replace them with arbitrary carriers.

The 34 planet choices are named mathematical definitions/constructions/theorems, remain within the six-per-stage cap, and retain their IDs. No planet or mathematical node was added or removed. The canonical planet for the dual exponential is one direct witness of the assembly defect above.

The unchanged **192-line** suggested file elaborated through `lean-check` at the pinned build: **exit 0**, with only the **nine intended `sorry` warnings**. It contains four genuine light definitions, six proved examples and nine admitted theorem milestones. The finite-free unramified-regulator theorem is explicitly conditional on its integral map and residue-spanning inputs; it does not pretend to construct completed K₃. No library build or language server was started.

The cubic example was independently recomputed in `(Z/5^20)[a]/(a^3−a^2+1)` using Teichmüller iteration, the depleted dilogarithm expansion and integration on special-unit residue discs. Source digits were comparison targets, not numerical inputs. All 12 recorded digits of ζ, the three root regulator values divided by 25, the value at ξ divided by 25 and the three solved coordinates match. The root-value matrix has determinant 3 modulo 5. Reflection and inversion pass modulo 5^14 at a and 1−a². This is finite-precision verification, not a Lean proof or a proof of global injectivity. The reader already contains the reproducible formula, bounds and output digits needed to repeat it.

## Validation and handoff to the orchestrator

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeRegulators.json`: passed, zero errors/warnings. It checks the root's one node, not its unsupported imports/corrections.
- An isolated 132-node resolution, verifying both hashes and applying aliases/corrections, passed the same schema/graph checker with zero errors/warnings after removing the old canonical PHR definitions from the in-memory context. This hypothetical replacement establishes consistency of the intended view; it is not a supported live migration.
- The actual merger reproducer above confirms that correction application is absent.
- `lean-check research/blueprint/suggested/PadicHodgeRegulators.lean`: passed as described above.
- `git diff --check`: passed.

The required next action is a separately scoped assembly/canonical-migration repair, followed by a comparison of every corrected target field, source identity, coverage entry and planet against this reader. The existing correction records and precise hashes provide its migration specification. Keep the current review verdict until that path works. There is no request to solve the 21 honest mathematical gaps as a condition of accepting the planning pass.

The orchestrator should also route the LocalGaloisGroups carrier reuse to the Selmer supplier and retain the existing CS/relative/integration owner requests. No second issue was claimed, no atlas data was edited, and nothing was promoted.
