# Handoff: independent EllipticRegulators package review

Job `REV-PKG-EllipticRegulators~codex2`, [issue #11372](https://github.com/CBirkbeck/tauceti-explorer/issues/11372). Codex, session `codex-8mZIR4`, 2026-10-20. Branch `codex-8mZIR4-review-elliptic-regulators`.

**Complete independent review; verdict needs_changes.** This is a completed negative review, not a checkpoint. The preceding fix worker's self-acceptance is replaced by `independent-review-REV-PKG-EllipticRegulators~codex2`. The original package, preceding independent review and intervening fix were written by different sessions. No second job was claimed.

The complete review is [REV-PKG-EllipticRegulators~codex2.md](../reviews/REV-PKG-EllipticRegulators~codex2.md). It contains the source/version audit, seeded fifteen-locator sample, all-layer adversarial pass, signature comparisons and current-library duplication audit. No source passages are reproduced in the deliverables.

## Files and work completed

- Updated the package README with the corrections below and visible mathematical gaps. No target was deleted and no packet was edited.
- Updated only the closing comment in Suggested.lean to name the new heavy targets. Its 27 theorem signatures and proved examples are unchanged.
- Replaced review.json with the independent needs_changes verdict.
- Added the review report and this handoff. Metadata remains `topic = "math.NT"`.

The package inventory was checked against all 75 parent and 76 follow-up nodes in the parent/eight layer packets, and all 143 numbered subsections were walked. The stale report path in the issue does not exist; the preceding independent report is `REV-PKG-EllipticRegulators~adv.md`. The issue's stray Mordell title was not treated as its mathematical scope.

## Corrections to retain

1. Real-period normalization needs an integral shear of the second basis cycle, even after choosing the primitive fixed cycle (§1.2).
2. The theta-truncation proof now avoids both zeros and poles on its boundary, uses phases `±(R−Nε)`, counts multiplicity-bearing clusters over a common translate range, and restricts the companion estimate to the correct annulus (§§3.11–3.14). The balanced quotient `(w−2)(w−3)/((w−1)(w−6))` disproves the former global uniform bound. Subtracting a constant cannot simplify an ℘ double pole.
3. The CM support vanishing uses strict ideal containment `(f) ⊊ (d) ⊆ O` (§5.6), excluding the conductor endpoint. The Gaussian endpoint test has `H(1+i)=1+i`, not zero.
4. The potentially-good integrality proof explicitly supplies the number-field Adams-weight-two bridge, local integral-image APIs over every finite extension of every ℚ_p, finite-extension reflection and the global–local test (§6.7). It uses Scholl I §1.3.3/Cor.1.3.4 p.8 and Prop.1.3.6 p.9; rational degree division is not an integral lift without a multiple.
5. The Manin-cycle Checks now include a nonzero level-11 period, rejecting the identically zero definition (§7.17).
6. Both Merel versions print the same residue coefficient, four times too small. The corrected coefficient is `8πi`, not their `2πi` (§7.23). The prior report incorrectly said the author article already corrected the appendix. A computation in this run gives 0.1473411600116475 from the printed coefficient and 0.5893646400465900 from the corrected one; an independent coefficient-square sum distinguishes the latter residue scale. These are diagnostics, not interval proofs.
7. Supplier contracts now give actual sections, especially EllipticKTheory §3.7, §§5.1–5.11, §§6.1–6.10 and §§7.1–7.9, and BorelRegulators §3.12 and §§8.2–8.5. The stable number-field factor `r_Bo=2r_Be` is distinguished from the curve factor `r_D=2r_E`; the elliptic target dimension is not a Borel rank. Other repaired citations include ComplexComparisonPartII C5.1/C5.3/C5.4, MotivicEtaleKTheory §12.2 and the two different polylogarithm suppliers.

## What prevents acceptance and where to resume

**First: close general CM real-structure transport (§5.1).** The real involution for `Λ=ΩO` is `z↦u·conj(z)`, `u=conj(Ω)/Ω`. The old u=1 convention misses rational twists. On the square torus u=1 has two fixed circles and u=i has one, as reflected by `y²=x³−x` versus `y²=x³+x`. Gaussian unit changes cannot make u=±i equal1. Derive an explicit all-twist class, conjugation/descent proof and real-period scalar for `cmRealStructureTransport`, including its new `blochClassU_twisted_conjugation`, `blochClassU_twisted_descent` and `cmLValue_realPeriod` APIs. It must recover the compatible calculation of §§5.9–5.15 and cover both curves. Free historical accounts do not give the needed formula, and the preceding worker's three CM numerical examples cannot replace it.

**Second: close the general ramified transfer comparison (§7.25).** `symbolRegulator_finite_transfer` retains all function-field K₂ classes, identity/composition and no degree scalar. The projection-formula calculation for a pulled-back entry does not justify reduction of every symbol to that case. Construct the supported/open-curve comparison, transfer and logarithmic boundary terms. The separate `compactRegulator_finite_transfer` follows from universal proper covariance and integration duality and supplies the modular application; do not weaken the general target to obtain acceptance.

**Third: settle whole-roadmap supplier order.** CaraianiNewton.md does not position this package or several K-theory suppliers among its 94 roadmaps; focus.json's K-theory list is not an order. Accurate section ownership does not authorize a prefix split. MotivicEtaleKTheory's full dependencies include the later Borel/period/syntomic returns. Establish an allowed bundle or a valid order of whole packages, resolving ownership edges rather than asserting that an early section suffices. No supplier, bundle or order file was changed by this job.

**Also retain the explicit §6.6 graph-proof gap.** The residue diagram, norms and incidence conventions, including wild fibres at2,3, still need a proof. Scholl's alternate endpoint proof does not establish this additional route. The cited p-adic comparison remains explicitly p>2 and good reduction; neither a p=2 nor a bad-reduction extension is inferred from it.

## Source access and versions

The cleared-library index does not authorize Bloch CRM11. It was not fetched from another copy. The package correctly avoids claims about its printing, and retains only locators explicitly attributed through Brunault pp.23–24. No unsupported book erratum was restored.

The review report lists public URLs and exact locators for Brunault's thesis, Goncharov–Levin, Zagier, DJZ, Schappacher–Scholl, Scholl I/II, Schneider, Nekovář, Deninger–Scholl, Goncharov, Siegel, Shimura, Merel, Brunault 2007, Asakura–Chida and Besser–de Jeu. Shimura pp.211–214 were read as page images. The random fifteen-paragraph sample used seed11372. Key source identity: Brunault thesis SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`; the Asakura–Chida accepted copy read in this run has SHA-256 `8686fbb0a15cb2799323c4f4ed87729f34368a25c7b132ca77636c68a12e9b40`, different from the preceding report's copy. Its printed pages are one less than PDF page numbers. ArXiv v2's interpolation Th.2.3 already includes the inverse-eigenvalue power; the distinct distribution condition is Th.2.2(1).

No fetched text or other worker's narrative was treated as instructions. No suspicious instruction was encountered. Scratch sources and computations are disposable; all information needed to resume is in this handoff and report.

## Duplication and validation

Current roadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`. Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked all nine roadmaps newer than the atlas snapshot and the four named Completed roadmaps, including nested OperatorTheory suggested files, as well as the actual current library. Reviewed AUDIT-28's eight-layer entries. No additional elliptic target duplicate was found; **removals: none**. Existing generic forms, Fourier, contour, determinant and elliptic-curve inputs remain deferrals. The two contour-counting declarations were also read at the pinned f790474 commit. Neither upstream checkout was modified or built.

- Final lean-check: exit0, exactly27 warnings, all `declaration uses sorry`; no errors or other warnings. Memory was checked. No background Lean process is left.
- Nine input packets: each check_blueprint result is 0 errors, 0 warnings.
- check_sorry_data: exit0.
- intake check-files on the five changed files: 0 problems.
- git diff --check: clean. JSON parses; metadata unchanged.

Submission is the normal completed review for #11372. A later package fix must address the defects above before another independent acceptance; the package is not ready for TauCetiRoadmap.
