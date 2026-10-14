# REV-PKG-AbelianVarietiesIsogenousToNoJacobian~2 — completed review

Refs [#9198](https://github.com/CBirkbeck/tauceti-explorer/issues/9198).
Codex, session `codex-OSUsu4`, 2026-10-14. Branch `codex-OSUsu4-review-9198`.
The review is finished with **needs_changes**; this submission is not an unfinished checkpoint.

## Completed work

Read the binding review/protocol instructions, all 117 package targets and the entire
suggested file, the accepted 95-node packet, previous review and revision handoff. The
original 85 API names and 57 test names are all retained. The report records the random
15-source audit, extra primary sources, adversarial witnesses, 10 signature comparisons,
library pins and exact remaining gaps. No packet, supplier package or upstream file was edited.

Fixed the arbitrary-compact definability claim (now compact semialgebraic), the factor two
in the Fourier period, the insufficiently supported CM period-field degree bound (a safe
genus-dependent factorial bound suffices), the unpolarized rigidity interface, the properness
argument for compact-type Torelli closure, the domain of a block image and the model-field
locator. Added tests/APIs for light helpers and six Lean example declarations.

The earlier R1 objection is superseded by the 2026-10-12 rule: geometric carriers absent at
the pins belong in README targets. Do not recreate admitted data definitions to satisfy
that older review. The former R2 supplier outputs now have statements, but their essential
proof prerequisites still need plans.

## Where the revision resumes

Eight `**Gap.**` paragraphs identify the open prerequisite contracts:

- §0.4: stable Torelli extension to Satake, its boundary characterization and compact-type
  relative Picard/Jacobian construction.
- §1.1: adelic Hermitian bundles, slopes/cubist metrics, auxiliary sections and quantitative
  interpolation, with their comparison to the stated height.
- §1.3: canonical isogeny representatives, endomorphism orders and the controlled
  period/discriminant construction, including descent.
- §1.6: orthogonal integral models, big CM cycles, special arithmetic divisors, Green
  functions, arithmetic intersection formulas and removal of the error term.
- §1.8: the polarized/unpolarized CM moduli-field comparison and primitive/maximal-order
  reduction. Level-three rigidity is a polarized-pair statement in this package.
- §2.2: the analytic/exponential model-completeness inputs for o-minimality of R_an,exp.
- §2.4: uniform reparametrization and determinant estimates underlying block counting.
- §6.3: absolute Hodge tensors of abelian varieties and their Galois comparison.

These are missing key theories or interfaces, rather than a demand to split every ordinary
proof refinement into a lemma. The report gives exact public source locators and what an
owner contract must provide. A revision must resolve them under PROTOCOL §15, with APIs
and unit tests for constructions. The quantitative arithmetic and functional-transcendence
Part II designs must reconcile ownership; broad citations to unplanned stages cannot
discharge the gaps. Keep both final supplementary research problems inactive and separate
from the arithmetic main theorem.

## Ownership and source notes

**Target removals: none.** Restored the actual IntegralLattices Layers 2D–2F contract that
the revision incorrectly redirected to GeometryOfNumbers. Squared minima give a length
product bound, and the independent witnesses need not form an integral basis. Current
Tau Ceti's covolume/discriminant theorems are now cited in the boundary section.

Current library semialgebraic predicates and conditional image/quantifier-elimination APIs
are also boundary imports. Their hypothesis `hproj` must not be mistaken for a proof of
Tarski–Seidenberg. Basic isogenies already have current library finite-surjective, composition
and base-change interfaces. The upstream/current-library revisions checked are
`0d144d044dacebca17b654695b6f1ad58f159b27` and
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` respectively.

No target was moved into a different atlas roadmap by this review. No automatic revision
of another package is requested. InverseGaloisAndArithmeticFundamentalGroups IG.2.5 now
actually supplies the integral thin-set estimate, and IG.2.6 has Frattini detection; the
older accepted packet's supplier gap on those outputs has become stale.

The CaraianiNewton 94-roadmap index does not include this roadmap or all its suppliers;
it does not certify their relative submission order. The report lists the indexed supplier
tiers and leaves the outside-index ordering explicit.

Public source URLs and precise read scope are in the report. Original MW93/MW94 and
Igusa proofs were not read from an uncleared book; indirect MZ locators were verified
without claiming that their original proof interiors were audited. Pila 2011's free
Theorem 3.6 still uses the 2009 block-counting input. GR23 was read from its full public
HAL author manuscript. No source passage or local source path is in a deliverable.

## Validation

`lean-check` before/after code changes: exit 0, respectively 60/66 warnings, all `sorry`;
no other warnings or errors. Subsequent Lean edits affect comments only. The pins are
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No proof of an admitted theorem is claimed.
`scripts/check_sorry_data.py` passes. The unchanged packet passes
`scripts/check_blueprint.py` with 0 errors/warnings. The deliverables pass
`intake.py check-files` and `git diff --check`.

The scratch PDFs, extracted texts and logs are temporary and are deleted after the PR
opens. Everything needed to resume is recorded here and in the review report.
