# PKG-ErdosProgressionPowers — complete

Agent: Codex (GPT-6), session `codex-V6vo5Q`, 2026-10-10. Issue: #7538.

## Delivered

- `research/blueprint/packages/ErdosProgressionPowers/README.md`: a self-contained roadmap with motivation, ownership boundaries, signed conventions and eight layers. All 49 accepted targets, 56 API items and 59 discriminating tests are retained. Each target has hypotheses, prerequisites and section/theorem/page citations. The generic supplier contracts and quantitative/geometric integration requirements are explicit. No programme history or source passages are included.
- `research/blueprint/packages/ErdosProgressionPowers/Suggested.lean`: the accepted suggested declarations and examples, joined under one standard opening note, import block and namespace. Native objects are preserved; omitted signatures are described rather than replaced by proposition fields or assigned conductors.
- `research/blueprint/packages/ErdosProgressionPowers/metadata.toml`: `topic = "math.NT"`.

Neither the input packet nor the reader document was edited.

## Input reconciliation

The accepted packet is the 49-target plan reviewed by `independent-review-REV-DESIGN-ErdosProgressionPowers` on 2026-10-05. The reader document still contains earlier counts and planning history; these do not appear in the package.

The packet's first gap, “Missing named Legendre supplier”, is stale. The accepted `research/blueprint/packets/EllipticLegendreCharacterInterfaces.json` now designates LG.0–LG.5. The package cites these layers for the six labelled root orderings, good-prime units/conductor support, native halving, corrected scaled-twist point, and trace comparisons. It retains only progression-specific normalization, case projections and character choices locally. No generic elliptic interface is replanned. That supplier is an accepted plan, not an implemented library API or an already submitted upstream package.

The other accepted boundaries remain intact: the certified Roth cutoff is `exp(exp(10^7))`, the harmonic dispatch uses `c1 = 1/20000`, character lower bounds are absolute, the principal pole is excluded from zero witnesses, and divisibility counts retain their rounding loss. The first-family equation has discriminant `16(abc)^2`; the Darmon–Granville elimination uses coefficients `j-1,j-2` with its one-based indexing. The rejected claim about absent absolute-value bars is not repeated. The coefficient-prime bridge's source locator additionally gives pp. 360–365.

## Evidence and checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ErdosProgressionPowers.json`: zero errors and zero warnings.
- Final `lean-check research/blueprint/packages/ErdosProgressionPowers/Suggested.lean`: elaborates at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` in the shared pinned Tau Ceti environment; zero errors, 140 `declaration uses sorry` warnings, zero other warnings. These are suggested signatures and admitted examples, not implemented proofs or executed mathematical tests.
- Target/API/example correspondence: 49 README target headings, all 56 named API contracts, all 59 named tests; every definition/construction with an API has at least three tests. The native suggested boundary remains 39 targets and 55 API signatures, plus 59 examples.
- Read the 24 cited library declarations at the pinned Mathlib and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` revisions, including the nonzero-factor hypotheses of `padicValInt.mul` and the native Stirling declarations. The reviewed library-coverage file has no direct ErdosProgressionPowers entry. Inspected current upstream roadmap/library material for overlap, including the nine newer roadmap directories. Read ArithmeticDirichletSeries and JacobianChallenge READMEs in full as neighbouring upstream examples.
- Re-read the critical Bennett–Siksek arithmetic/modular, character, sieve and addendum passages and Darmon–Granville Corollary 2.1, pp. 520–521. Public source bytes match the accepted versions: BS20 SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`; DG95 SHA-256 `2a77462524aebdce6a34c540e99afb3913c2c6113b597af9792bed6c82376aca`. The README links their publisher/author URLs. No source file or passage is committed.
- File-scope, metadata, source-locator and whitespace checks pass. Only the four issue deliverables are changed.

## Mathematical implementation boundary and next step

Packaging is complete; the next pipeline step is independent package review. No further package authoring is needed to preserve the accepted plan.

The accepted suggested file omits ten geometric target signatures: the two reduced-level results, coefficient-prime bridge, Kraus threshold, comparison curve, good-trace comparison, the two case projections, positive Case-II normalization and CM exclusion. It also omits generic-Frey equality, both local minimality/valuation clauses, and the character odd-conductor divisibility into the native reduced level. Their full mathematical contracts are in the README. Reconcile them with their owners' native conductor, residual, reduction, Legendre and CM signatures during implementation; do not fill these omissions with surrogate fields.

The primary quantitative analytic proofs and finite nonvanishing certificate, exact quantitative Roth proof, signed diagonal-curve smoothness/connectedness and primitive-lift adapter, and effective cutoff ledger are still proof obligations of the accepted plan and its suppliers. This package does not certify those proofs, turn the conjecture or smooth-multiplier announcement into a theorem, or claim effective enumeration of Faltings points. Sending the roadmap upstream remains the maintainer's decision after its dependency packages are ready.
