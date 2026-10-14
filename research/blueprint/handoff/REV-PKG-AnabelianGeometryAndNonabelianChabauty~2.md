# REV-PKG-AnabelianGeometryAndNonabelianChabauty~2

Completed independent package review for #9857. Codex, session `codex-mk4VvI`, 2026-10-14. **Verdict: accepted after in-place fixes.** This is a completed review, not a checkpoint. No second job was taken.

## Deliverables

- `research/blueprint/reviews/REV-PKG-AnabelianGeometryAndNonabelianChabauty~2.md`: scope, G1–G18 dispositions, 15-node source sample, adversarial mathematics table, duplication check and signature checks.
- `research/blueprint/packages/AnabelianGeometryAndNonabelianChabauty/review.json`: accepted verdict, with this review's exact job identity.
- The package README and Suggested.lean: mathematical corrections described below. The metadata was already correct and is unchanged.

## Corrections to retain

1. Continuous π₁-to-étale comparison: the converse to higher-direct-image vanishing needs all finite coefficient modules, not one fixed M.
2. Unipotent extension length: n+1 graded layers; length zero means trivial action. The Lean theorem and examples now agree with C₀ in the README.
3. Mixed extensions: descending block direction; right torsor of maps from the split graded object into M; period classifications require admissible graded pieces; Hom vanishing removes automorphisms, not the class-set bijection; finite-type representability also needs finite cohomology.
4. Heights: a section of the Hodge quotient has isotropic image, not an informative isotropic-kernel condition. Kummer coefficients use the rationalized pro-p completion.
5. Added `nekovar-semistable-local-height`: a full cohomological construction on adjacent-finite mixed extensions, restricting to the promised semistable domain. It uses the finite/unrestricted cohomology rows, the Hodge/Frobenius section and the independent formula w′(x)=u(w(y))+k. It has central-translation, crystalline-agreement and noncrystalline Kummer tests. Source: Besser arXiv:math/0209006v1 §4 pp. 6–7 and §6 p. 10. The global-height target now consumes it.
6. Correspondences: trace-equals-cup action, graded swap −flip, adjoint compatibility, diagonal −id and graph direction. A light symplectic-plane definition and two Lean examples pin the convention.
7. Weil restriction: positive cohomological degree, geometric connectedness and the ramification-set condition. Added the quadratic-extension H⁰ dimension counterexample.
8. Proper-curve H² estimate: boundary rank max(s−1,0) and proper Hodge–Tate multiplicities (g,g). Witt formulas explicitly start at n≥1.
9. Hyperbolic Hom properness: extend ramified generic maps by resolving and contracting rational exceptional curves; finite-étale-cover extension alone is insufficient.
10. Four BD II locators, 17 process bullets posing as Checks, two empty Check headings and a central-induction phrase corrected.

No mathematical target, named API or named test was removed. The new semistable-height construction is owned by Layer 6 here; no new upward ownership move or exact upstream duplicate was found. Preserve the previous revision's ownership moves and boundary citations.

## Verification

- All 535 accepted anchors, 650 API entries (643 distinct names) and 465 named tests retained.
- All accepted definitions/constructions and the added definitions/constructions have at least three discriminating Checks; the report records the tests inspected.
- Internal links resolve; no duplicate anchor. All 19 linked atlas suppliers are lower tier.
- `lean-check` on Suggested.lean: exit 0, 58 warnings, all `declaration uses sorry`. Final Lean: 543 lines, 18 real-bodied definitions, two structures, 17 theorems, 41 examples.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `python3 research/blueprint/intake.py check-files` on all six package/review/handoff files: zero problems.
- `git diff --check`: clean.

The current-roadmap/library commits and the pinned-build commits are recorded in the report. No lake command was run in the read-only upstream environment. Source files and extracted texts stayed in scratch and are not needed to resume: the report gives the public sources and precise locators. The original Faltings and Nekovář papers were inaccessible; the report distinguishes the independently read Mochizuki and Besser statements from unverified original pagination. No source passages were committed.

No requested work remains. The maintainer can use the accepted package for its upstream draft. The earlier review's optional maintainer questions about Kim's survey convention and the EllipticCurves/PELModuli boundary remain informational; they do not block this verdict.
