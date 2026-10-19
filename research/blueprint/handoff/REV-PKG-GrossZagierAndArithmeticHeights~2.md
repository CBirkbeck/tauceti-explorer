# REV-PKG-GrossZagierAndArithmeticHeights~2 — completed fixing review

Issue #10902; Codex, session `codex-vSNenZ`; 19 October 2026.
Claim confirmed by the swarm bot on
[comment 6269444147](https://github.com/CBirkbeck/tauceti-explorer/issues/10902#issuecomment-6269444147).
This is the completed independent package review, not a checkpoint. No second
job was claimed. The reviewed package revision was by session `codex-ggn0g7`.

The [report](../reviews/REV-PKG-GrossZagierAndArithmeticHeights~2.md) records the
287-target adversarial pass, 15 reproducible source samples, ten Lean signature
checks, supplier/duplication audit, corrections and exact remaining defects.
The [review.json](../packages/GrossZagierAndArithmeticHeights/review.json)
verdict is **needs_changes**. The package is not ready for its upstream draft.

## Applied corrections

- Opposite ψ characters in the contragredient Whittaker pairing (§5.6), with
  real-place support and conjugate-norm negative controls.
- General K_v Frobenius statement uses q=p^f and linear φ^f (§9.20).
- Exact quasi-canonical endomorphism-lifting thresholds, their standard
  field-of-definition ramification, nonempty strata and quotient-exponent
  convention (§7.2); source ARGOS, Vollaard Chapter 11 Theorems 2.1, 2.3,
  pp. 114–115. Checks include q=3,s=1 with lengths 2,6,8.
- Earlier Eisenstein definitions, convergence domain and zero-pair exclusion
  (§§6.29–6.30, 6.41); fixed the dependency order.
- Removed accidental links from Chapter III equation numbers to unrelated
  Layer 9 targets; corrected Yuan–Zhang Lemma 9.5/Proposition 9.2 locators.
- Positive n,l in §6.73; r_A(m)=0 handled without κ/r in §7.91; tangent
  extension required for intersecting divisors in §8.6.
- Extra-unit CM point comes from owned §0.5, not HE.1's excluded range.
  Current ModularCurves Layer 7F ST-1 explicitly supplies elliptic Serre–Tate
  equivalence; coordinates and lengths remain owned here.
- Discriminating optimal-order/U-fixed tests in §8.5; public CST locators
  for book-referenced interfaces; six explicit source/interface gaps.
- Suggested.lean names omitted geometric definitions in its closing comment
  and tests `bdpEulerFactor 1 2 = 0`.

No target was removed in this review. The earlier package revision already
removed its graph-measure duplicate. Metadata is unchanged. Packets, reader
documents, supplier packages and atlas data were not edited.

## What the package repair must do

1. **R1, §7.25:** state the exact good-place local identities. Give the actual
   Schwartz functions, lattice/level/conductor conditions, different and measure
   normalizations, and normalized equations in the split, inert, ramified and
   division cases needed by the global proof. State the archimedean projected
   comparison separately. “Under the source's assumptions” is not an interface.
2. **R1, §7.47:** specify the exceptional set S and construct the nearby coherent
   Φ(v) with their bad-place comparison equations. Density extends an existing
   automorphic equality; it does not create a wild/bad-place comparison.
3. **R2:** obtain an allowed accessible source for §§1.1, 7.4, 7.5, 7.25,
   7.47 and 8.1, verify the exact hypotheses/locators, and correct the statements
   if needed. The displayed §7.4 inequalities are already present; the defect
   there is their unverified source and global nonvanishing restrictions, not
   their absence. The 2011 draft's linked download returned 403; author-mirror
   attempts did not provide it. The 2013 book is not in the cleared library.
4. Reconnect §8.1 and its unrestricted quaternionic consequences to those exact
   inputs. A public statement of the final theorem and the independent modular
   route do not fill this local proof gap.

The earlier supplier diagnosis is not repeated wholesale: the new Arakelov
package contains concrete targets, and the specific HE/GH cycles can be
ordered through their geometric inputs before height consequences. The report
explains the distinction. CaraianiNewton.md does not put GZ/HE/GH in its 88-unit
order, so no GZ tier was invented. A future upstream port needs an explicit
supplier schedule, including the p-adic suppliers excluded from that CN order.

## Evidence and checks

Current upstream audit: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the relevant current height,
regulator, ModularCurves Serre–Tate and restricted-series preparation statements;
searched all current and Completed roadmap files, including the nine newer
roadmaps. None supplied another retained arithmetic target verbatim.

Source sample is reproducible from the target-anchor order with Python
`random.Random(10902).sample(targets,15)`. The report lists all fifteen exact
locators and outcomes. The cleared BLR §7.5 Theorem 4, p. 187 was read in place;
no restricted file or passage was copied. Public PDFs and scratch audit scripts
are temporary and are deleted after PR submission; all repair information
needed by the next worker is in this note and the report.

- `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti
  `f790474`: exit 0, 26 warnings, all `sorry`. Suggested.lean: 196 lines,
  eight light real-bodied definitions, no sorry'd data or theory development.
- Available memory before elaboration: 82 GB. No build remains running.
- `check_blueprint.py` on the existing main, GZ.0 and GZ.8 packets: each
  0 errors, 0 warnings, read-only checks.
- Internal audit: 287 targets, 85 API-bearing definition blocks with at least
  three Checks, no unresolved internal target links, no Needs cycle.
- Final `intake.py check-files`: 0 problems. `git diff --check`: clean.

No proof is claimed formalized. The successful Lean and structural checks do
not change the explicit `needs_changes` verdict.
