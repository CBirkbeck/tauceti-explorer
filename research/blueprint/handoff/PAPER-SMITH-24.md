# PAPER-SMITH-24 handoff

Codex — `codex-c83e7a`, issue #1081. **Partial checkpoint**, not a completed extraction. Read all 47 pages of arXiv 2111.12660v2. The final published Annals PDF was not obtained, so version reconciliation remains required.

The result contains 146 items (11 library, 2 planned, 133 missing), four disjoint routes, 20 pinned declaration records, and 47 definitions/constructions with 141 proposed API statements and 141 proposed tests. The report explains the proof chain, owner boundaries, source corrections and numerical certificate. No library files, atlas data, roadmap files or Lean files are changed.

Resume in this order:

1. G7: obtain the final Annals text and compare the preprint corrections. All current locators are preprint locators.
2. G1: read Saff–Totik I.3.1, III.1.9 and III.4.2 and their prerequisite proofs. Close logarithmic energy, domination, weighted equilibrium/zero distribution, Remez and interval equilibrium density. The Saff survey is evidence, not full closure.
3. G2: close Minkowski second theorem and the BLPS transference/Gaussian suppliers. The body in Smith 3.2 is a crosspolytope; use the polytope part of BLPS 2.4, not just the simplex corollary.
4. G3/G4: finish pinned Gauss/valuation and finite-grid adapters and split the protected-root construction further. Preserve the fixed-size resultant repair, nonmonic deflation integrality and the **real** final complementary-polynomial shift. Supply the same-component/gap argument for derivative bounds.
5. G5: close extended-integral compactness, singleton-component exhaustion and the support-exclusion proof. The positive-auxiliary-coefficient step, item 114, is DONE: Claude Code (cc-fb70e5) supplied its proof for compact and unbounded Σ. Do not use `Real.log 0`, discard only isolated points, or evaluate zero times negative infinity.
6. G6: read Honda/Tate/Waterhouse and finite-isomorphism-class proofs. Preserve the Schur-index cancellation and square-field restriction. Prove the claimed modulo-4q refinement; BCWLPS 5.8 only supplies its own larger modulus.
7. G8: close the analytic formulas underlying the trial measure. The report's standalone rational certificate already verifies the signs and first-moment bound conditional on those formulas.

Source hashes, exact read scopes, failed fetches, input snapshot and declaration excerpts are in the JSON. Full upstream reads: PDE and completed Orthogonal L2 Bases. NumberFieldArithmetic was read only at the relevant boundary and supplier sections; do not inherit a full-read claim for it. BLPS pp1–16, CSZ pp217–239, Kadets pp1–5, BCWLPS pp5/8–10/12, Serre pp3–6/25–27 and the listed Saff survey pages were read; their remaining pages and recursive suppliers remain open.

Validation: paper checker passed; custom item-DAG, exact-once routing, API/test and pinned-file checks passed; 569 exact finite assertions passed; the exact rational numerical certificate passed. The proposed 141 Lean tests were not executed. No Lean compilation or formalization is claimed. The intake path check passed for all three deliverables, and their existence was asserted separately.

Keep the item IDs. All three proposed Part II briefs remain proposals until independent review. Their generic suppliers must be imported, and the analytic construction/arithmetic preservation split in inward smoothing needs separate stages to avoid a roadmap-level cycle.

Continuation log: Claude Code, cc-fb70e5, 22 September 2026. Supplied item 114's proof: a perturbation with ε log|Q_j| and, for unbounded Σ, a convex split using (5.11). Its gates are now [G7]. No other item changed.
