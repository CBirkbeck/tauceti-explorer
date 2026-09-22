# PAPER-SMITH-24 — current handoff

Codex — `codex-a71f92`, issue #1081, 22 September 2026. **Partial checkpoint**. No Lean formalization or independent review is claimed.

This continuation preserves all 146 prior IDs/statuses/statements and the cc-fb70e5 separator proof. The inventory now has 155 items: 14 library, 2 planned, 139 missing; 47 definitions/constructions still have 141 proposed APIs and 141 proposed tests. Missing items are routed exactly once. The four route sizes are 62, 53, 15 and 11 (the GN route includes its two planned items).

Done: fresh full read of all 47 Smith v2 pages; read Serre Appendix B printed pp 14–18 plus references 18–19; read the entire pinned circle-average-log file and the relevant cosine-pushforward proof. Items 147–149 import existing suppliers. Items 150–154 give the normalized angular adapter, reciprocal-root potential including endpoints, half-Hölder estimate, log moment and inversion Jacobian. Item 155 checks all nonmonic integer polynomials using both integer leading and constant coefficients. The report supplies the written proofs; G8 is paper-proof-supplied, not implemented.

The exact-rational numerical certificate was rerun unchanged and passes. The embedded finite regression passes 3,205 exact rational assertions. The paper checker, intake path check, full DAG/route/API audit and all 23 pinned declaration file-hash checks passed. No Lean file was authorized or compiled.

Resume:

1. G7: acquire the final Annals text. The fresh official DOI and Project Euclid PDF attempts returned 1,161-byte HTML challenges, not PDFs. All theorem locators remain v2 locators.
2. G1: general energy minimization/equilibrium identification, capacity, weighted zero distribution, Remez and deeper Saff–Totik proofs. Do not conflate the new elementary pointwise potential computation with complete general potential theory.
3. G2: Minkowski second theorem and BLPS transference/Gaussian suppliers. Preserve the polytope, not simplex-only, route.
4. G3/G4: nonmonic algebra, fixed-size resultant, protected roots, real constant shift and same-component/gap estimates.
5. G5: compactness, singleton-component exhaustion and support exclusion. Item 114's positive-coefficient repair was already supplied by cc-fb70e5; do not reopen it by mistake.
6. G6: Honda–Tate, isomorphism finiteness and the modulo 4q claim. Preserve square prime powers and the larger-modulus caveat.
7. At blueprint stage, implement missing adapters 150–155 and the proposed tests. Do not re-prove existing circle-average or cosine-transfer theory. No generic library absence is asserted from a name search.

The prior source-reading scopes below remain historical; this continuation does not claim to have reread every old prerequisite. All old source issues and separate errata files are untouched. Claims about the published paper still require G7.

## Historical handoff (preserved verbatim)

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
