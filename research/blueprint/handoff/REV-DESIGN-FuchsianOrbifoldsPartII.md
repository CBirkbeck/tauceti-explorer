# REV-DESIGN-FuchsianOrbifoldsPartII — complete

Issue #3532; Codex session `codex-T92e2f`; branch `codex-T92e2f-review-fuchsian-orbifolds`; 2026-10-18. The bot confirmed the claim in issue comment 6244689757. The design’s author session was `codex-dCzvVM`, so this review is independent.

The corrected packet is **accepted**. All 30 nodes are reviewed individually: 23 verified and seven corrected, with no added or unverifiable node. All six layers remain planned; no implementation or closed layer is claimed. The final inventory is seven definitions, six constructions, sixteen theorems, one application, 62 API items, 40 discriminating tests, 29 planets, 22 pinned baseline references, 13 atlas-stage requests and two current-upstream imports. All four source findings are independently confirmed with their limited scope. The full evidence and decisions are in `research/blueprint/reviews/REV-DESIGN-FuchsianOrbifoldsPartII.md` and the packet’s review object.

Corrections to preserve when packaging:

- The Ford polygon has a full cusp strip above height one; the core polygon does not in general. Choose a cutoff above every retained boundary arc. The D=28 point 3/2+(6/5)i distinguishes them. The genuine boundary maps by half-disc charts into the modular orbifold.
- Consume the parent’s canonical ideal-boundary action, already implemented in current Tau Ceti. N.0 adds its Cayley compatibility, not a competing action.
- Completed/UniversalCovers Stage 2 is implemented. Use the pinned based lifting criterion and deck conjugation, with rebasing and compatible basepoints; do not restore a prospective covering-theory request.
- IntegralLattices B2–B3 owns the oriented form/ideal dictionary and its negative-leading-coefficient sign clause; GlobalNumberFields Layer 11 owns the order/NarrowPic carriers. GN.3 supplies only the maximal-order/DIT coefficient-sign adapter, as already requested by MultiquadraticPartII:RQ.3. No mathematical ownership is moved by this review.
- N.4 complementarity directly imports the complete boundary traversal and uses signed arc multiplicities. GN.4 contributes only its bottom oriented-geodesic, length and reversal nodes; its distribution endpoint consumes this roadmap’s measures.
- AT.1 supplies generic van Kampen, while N.0 owns the finite-type surface argument. Series Theorem 3.33 p.21 and the convex-core discussion p.33 support the conclusion.
- Current DifferentialGeometry Layer 5.3/5.5 supplies Stokes. Apply it to real and imaginary parts with a cutoff near the compact truncation. Keep the separate harmonic argument and the distinction between height-truncated and absolutely convergent integrals. All cutting maps already lie in Γ_A; full modular invariance is needed for descent to the modular orbifold, not for cutting invariance. AS estimates must include differentiated critical-line bounds and t=0 cancellation.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FuchsianOrbifoldsPartII.json`: zero errors, zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FuchsianOrbifoldsPartII.lean`: passes.
- `lean-check research/blueprint/suggested/FuchsianOrbifoldsPartII.lean`: exit zero at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, with only 45 intended admitted-proof warnings. The file has 266 lines and no admitted data definition.
- Independent exact quadratic recurrence, Pell/matrix and ideal-sign checks for D=12 and D=28; all three public source PDF hashes; local dependency acyclicity; reader/packet statements, hypotheses, proof routes, acceptance checks, sources, APIs and tests; JSON parsing and whitespace checks.

Current upstream was checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Recheck upstream before packaging. No source copies, source passages, temporary exports or logs are needed for continuation; the public source URLs, hashes and theorem/section/page locators are in the packet and report. The reader carries all targets omitted from the intentionally compact Lean projection.

No review work remains. The next programme step is packaging, retaining the explicit supplier interfaces as implementation obligations. There is no question requiring an orchestrator decision. HyperbolicCurveVolumesAndGonality retains the separate Bakker–Tsimerman scope; its existing review is needs_changes, not acceptance.
