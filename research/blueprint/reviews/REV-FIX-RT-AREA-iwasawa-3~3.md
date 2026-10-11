# Independent review of the third Iwasawa fix round

Refs #5869. Codex (GPT-6), session `codex-EozIdh`, 11 October 2026.
Input commit `1c06f95484a07926ea860dbcec1344dc75b9c275`;
branch `codex-EozIdh-review-5869`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6107789204)
was confirmed by bot comment 6107790396. This session did none of the fixes
being reviewed and claimed exactly one issue.

**Motives verdict: needs_changes. Submission: checkpoint pending scope repair.**
This is a bounded independent review of the eight confirmed findings and
third-round fixes, including their affected owner contracts. It does not
replace the exhaustive blueprint audits attributed to earlier reviewers.
The complete preceding codex-tpWtXb packet verdict is archived unchanged in
`reviewHistory`. Its [report at the input revision](https://github.com/CBirkbeck/tauceti-explorer/blob/1c06f95484a07926ea860dbcec1344dc75b9c275/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-3~3.md)
retains the older reports and their provenance.

## Findings and independent decisions

Read the original finding, verified evidence and round-three disposition for
each entry in RT-AREA-iwasawa-3. The arithmetic pairs were inspected read-only:
the live issue does not authorize editing them. Their existing owner-review
markers remain their authors' decisions, rather than this review's verdicts.

| Finding | Decision and source evidence |
| --- | --- |
| /1: CM product model | **Partly repaired.** GH.0/cm-product-good-model requires separate models of the factors and tests a good product and a bad CM twist. GH.1/p-adic-abel-jacobi-map still attaches p∤cNd_K parenthetically to good reduction. BDP §2.2, p.1060 defines the product over a field defining the CM factor; §3.2, pp.1067–1068 independently assumes finite unramified F/Q_p and supplied smooth proper models. The chosen-CM conductor application must be stated separately. Conrad's appendix, pp.1139–1140 supplies the Kuga–Sato factor. |
| /2: moment twist | **Selected repair holds.** Kato §8.4, p.182 gives T_pE=H_p(1). The owner's coefficient statement retains Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2); adding 2−r gives k−r. The weight-four, r=1 check gives 3, separating the incorrect orientation that weight two hides. |
| /3: Euler factors | **Euler repair holds; its Hecke supplier is still incorrect.** Kato Proposition 8.7(2), p.184 and Theorem 9.5, p.188 require the linear scalars ℓ^(−r), p^(−r). The owner retains these, the quadratic exponent k−1−2r and the p∣M identity branch. Lemma 8.8(1), p.185 instead has n^(r′−1); the owner Hecke statement and acceptance item 0 have r−1. Inverse Hecke transport plus the first diamond contributes −(r′−1)+(r′−1−r)=−r. For r=1,r′=2,ℓ=2 the correct scalar is 1/2; the wrong exponent gives 1. The generic Lean scalar parameter does not select the correct normalization. |
| /4: filtration target | **Selected repair holds.** Kato (9.2.2), p.187 and §9.4, p.188 concern filtration steps, with F^i=0 for i≥k. The current contract retains the endpoint and distinguishes the equal nonzero interior steps from their zero graded quotients. At k=4, F¹=F²=F³ implies gr¹=gr²=0. |
| /5: interpolation twist | **Selected repair holds.** Kato Theorem 12.5(1), p.221 twists the Iwasawa class by k−r before specialization, localization and dual exponential. The owner preserves this order and action, f*, the p-imprimitive value and the sign. At k=2,r=1 the target is V(f)(1). |
| /6: integral limit | **Selected repair holds.** Kato Lemma 8.5, pp.183–184 passes from inertia-cohomology invariants to the Pontryagin dual of residue-field H¹ and uses direct restriction there. The owner preserves the dual and its relation to inverse corestriction. It does not claim vanishing of an undualized inverse limit; its μ_p example away from p distinguishes those systems. |
| /7: theta divisor | **Selected repair holds.** Kato §1.10, p.124 uses pushforward under multiplication by a prime to c and compatibility with the norm. The owner rejects pullback. For c=5,a=2, the pulled-back divisor is 25E[2]−E[10]; its coefficient at a nonzero 2-torsion point is 24, while the desired divisor has coefficient zero. |
| /8: effective/full periods | **Presentation and comparison-law repairs hold; full typed torsor adapters remain missing.** HMS Definition 2.8, p.10 and Theorem 2.10, p.11 distinguish effective presentation from Tate localization. Lemmas 3.1–3.2, p.12 and Theorem 3.3/Corollary 3.4, p.13 give the full fibre-functor/torsor setting. The prototype retains explicit inverse identities, both edge laws, unit/product laws, rank-one Tate nonvanishing and the separately conditional Tannakian context. The full localized comparison and compatible heap/actions remain the packet's explicit gap. |

## Correction made in the permitted packet

MC.6/period-point's proof sketch still applied tensor-isomorphism
representability to the effective comparison before extending through Tate
localization. That contradicted its own final warning and its corrected
`periodPoint` API. A field comparison on effective good pairs does not
supply rigidity of that effective category.

Reordered the five proof steps to match the valid construction:

1. Construct effective algebra evaluation by the generator/edge relations and
   the typed comparison's linearity, unit and product laws.
2. Transport it through the effective comparison-algebra identification;
   retain tensor compatibility on good pairs without inferring effective
   isomorphism representability.
3. Use rank-one nonvanishing of the Tate period to extend through localization.
4. Interpret the result as a full torsor point only after extending fibre
   functors and tensor comparison to the full neutral Tannakian category.
5. Retain the obligation to type the full comparison, heap and actions;
   conditional effective prototypes do not fulfill it.

Added an HMS source locator for the fourth and fifth steps: Lemmas 3.1–3.2,
p.12; Theorem 3.3 and Corollary 3.4, p.13. No new target or definition is
introduced, so no new definition API or three-test obligation arises.
The current suggested file already separates effective evaluation from its
Tate-localized extension and therefore needs no signature change for this
proof-sketch correction.

The existing gap **Full localized comparison and period-point torsor
adapters are not typed in the prototype** remains decisive. In particular,
`formalPeriods_eq_comparison` concludes an effective algebra equivalence,
while `FormalPeriods.localizeComparison` compares two localized rings; the
latter does not identify its codomain with the full Nori comparison algebra.
Finish that adapter using the existing MC.5 localization and full rigidity
suppliers, then thread the fibre functors, comparison, heap and actions.
Do not infer effective rigidity or recreate PS.2's integration application.
The separate relative Beck and abstract-reconstruction gaps remain intact.

## Baseline and ownership

Read the pinned Mathlib Away inverse, unit and lift statements and
`IsLocalization.algEquivOfAlgEquiv` at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. They supply ring localization and
extension of evaluation; they do not supply Nori fibre-functor adapters.
The packet's Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` is
unchanged. The Motives and Kato files import Mathlib; compiling the GH.0
prototype also checks its existing Tau Ceti imports in the shared build.
This is not a fresh inventory audit of the full pinned libraries.

Read the reviewed PS.2 library audit (AUDIT-27), current upstream
ReductiveGroups layer 1 and its suggested signatures, and
Completed/HodgeStructures. Also read current Tau Ceti's
`TauCeti.Tannaka.fgPointTensorIsoEquiv`: it starts with a specified Hopf
algebra and identifies its points with automorphisms of its comodule fibre
functor. That existing target is imported, rather than planned again; it does
not discharge the missing Nori adapter. The current upstream root commit was
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`, and current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were read-only; no build was
run there.

## Public source receipts

Accessed 11 October 2026. No restricted source was needed. Statements in this
review and its packet correction are authored descriptions, with no source
passage reproduced in the repository.

| Public version | Locators checked | SHA-256 |
| --- | --- | --- |
| [HMS arXiv v5](https://arxiv.org/pdf/1105.0865v5) | Definitions 2.8/B.18; Theorems 1.6,2.6,2.10; Lemmas 3.1–3.2/B.21; Corollary 3.4; Proposition B.22; pp.5,10–13,24–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10; §8.4; Lemmas 8.5/8.8; Proposition 8.7; §§9.2–9.5; Theorem 12.5(1); pp.124,182–185,187–188,221; printed pp.184–185,187–188,221 also inspected as page images | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [BDP, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §2.2, p.1060; §3.2, pp.1067–1068; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

## Validation and preservation

- All three inspected packets: checker exit 0, zero errors/warnings. Final
  Motives check after the correction: 182 nodes, 463 API items, 261 tests,
  47 planets, 113 baseline declarations, 24 gaps and 16 requests.
- Full `lean-check` runs: Motives 817, Kato 135, GH.0 242 warnings, all
  admitted-proof warnings; exit 0 and no errors or other warnings.
- Twelve fresh proved scratch examples: `lean-check` exit 0, no diagnostics.
  They check the moment orientation, correct and incorrect Hecke scalars,
  central diamond and Euler exponents, theta-divisor coefficient and doubled
  unit comparison. These scalar models do not certify the geometric or
  cohomological constructions. The Motives file also contains proved
  effective-zero/localized-nonzero and shared-sign model checks.
- No Lean file was changed. Each full compile ran sequentially through the
  shared pinned-Mathlib wrapper after a memory check; no language server or
  library build/update/cache command was started.
- Only period-point `proofSteps` and its added source locator change among
  mathematical node fields. All 181 other nodes, prerequisites, API/tests,
  sources, baseline, gaps, requests, coverage, implementation statuses and
  previous histories are preserved. The preceding review is archived exactly.
- Arithmetic owner packets and their existing review markers remain unchanged.
  No source-excerpt field is present in the edited packet.

## Dispatch blocker and exact resumption

The bot-confirmed live issue authorizes this report and the Motives
packet/suggested pair. WORKERS.md says to edit only the issue's named files.
The queue additionally lists four arithmetic owner paths, and
`issues.py:deliverables_complete` requires this review's genuine marker in
all three packets. It accepts a finished `needs_changes` review: the
negative mathematical verdict is not the dispatch blocker.

An explicit scope extension was requested while the independent checks
continued; it has not been authorized. No omitted owner file or queue entry
was edited. This submission is consequently a checkpoint. Resolve the scope
before another continuation: authorize the four queue-listed owner paths or
align the queue with the live Motives-only review. The handoff lists the
exact corrections and completed checks. Reader synchronization is also
separate work because its path is absent from the live deliverables.
