# Handoff: REV-PKG-ComputationalNumberTheory~2

Codex, session `codex-C9WySH`, 2026-10-14. Refs
[#9205](https://github.com/CBirkbeck/tauceti-explorer/issues/9205).
The independent review is complete and **accepted after fixes**. Resume from
the final package and [review report](../reviews/REV-PKG-ComputationalNumberTheory~2.md).
No packet, foreign package or ownership/link file was edited.

## Completed

- Read the package, original independent rejection and revision handoff;
  checked the accepted plan, source sample, dependencies, definition tests,
  signatures and current upstream duplication.
- Fixed linear Rabin remainder comparison; rational-factorization source and
  monic reduction; positive relation-quotient order; local-image index and
  existence proofs; good-prime norm supplier; representatives at two and
  quotient-generation in saturation; p-adic precision tests and locators;
  CT zero conventions; translated-centre/pivot conditions in Fincke–Pohst.
- Removed exactly one native duplicate: old CN.2 target 2.2
  `OrderBasisCertificate.isIntegral`, now supplied by
  `TauCeti.GlobalNumberFields.NumberFieldOrder.isIntegral` in
  `NumberTheory/NumberField/Global/Orders/Basic`. Renumbered CN.2 and removed
  stale prerequisite references. The surviving general `multiplierRing`
  variant explicitly accepts arbitrary integer submodules rather than only
  fractional ideals of an order.
- Kept 128 targets, 69 definition/construction subsections, all 187 original
  API names, and at least three Check bullets for each definition. The Lean
  file is 1,272 lines with 59 examples and no sorry'd data definitions.
- Final `lean-check` exited 0 with 106 sorry warnings and no other warnings
  or errors at the required pins. Blueprint, sorry-data, intake and diff
  checks pass. Metadata remains `math.NT`.

## Ownership records for the maintainer

The revision already moved the services down; this review checked and refined
their mathematics. The old input packet and RS-03 routes still describe the
previous ownership. Reconcile those foreign records rather than reintroduce
their upward inputs:

| Old supplier / record | Final package supplier |
| --- | --- |
| ED.3 `local-descent-image`, `local-image-completeness`, `local-quotient-cardinality`, `good-place-local-image` | CN.3 3.18–3.21; lower RP.1 supplies the local multiplication index. |
| ED.3 `p-saturated`, `saturation-certificate` | CN.3 3.22–3.26, including the quotient-generating criterion in 3.23. |
| FF.0 presentation, embedding and change-of-presentation | CN.0 0.15–0.17. |
| FF.3 factorization/Hensel/point-count services | CN.1 1.22–1.26 and CN.3 3.17; native point count is imported. |
| GN.5 Fincke–Pohst request | CN.4 4.26–4.27 while the current GN package supplies LLL only. |
| CA.3 field kernel request | Pinned `TauCeti.kernelBasis` and its kernel/span/independence API. |
| ModularForms Layer 8 eigensystem lifting | Lower-tier R15.5 Deligne–Serre lifting. |
| Order-basis integrality node | Native order integrality, with the finite certificate-to-order adapter retained in 2.1. |

ED keeps the 2-Selmer group, rank bounds, heights, index bounds and
Mordell–Weil bases and imports these CN algorithms. RS-03's ED.3-to-CN.3
supplier direction must be reversed; the tierless FF roadmap consumes the
moved-down services. If GN later supplies the same exhaustive enumeration,
replace CN.4's target by a boundary citation at that point.

## RP.1 source finding

The lower RP.1 `local-division-index` node had an unverified Mattuck Theorem 7
locator. I read the public published article: the theorem is on printed
**p.114**, in Annals of Mathematics 62 (1955), 92–119, available through the
[university-hosted PDF](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf).
It supplies the finite-index local subgroup for the index proof. The package
now cites it and spells out finite-quotient cancellation; FPS §7,
pp.16–17, is explicitly a dimension-two application adapted here to elliptic
curves. This source evidence can be used when resolving RP.1's pending
review; that foreign review status was not changed.

## Limits

Acceptance covers the roadmap specification and its representative Lean
signatures. The theorem proofs, algorithms and complete published finite
datasets have not been implemented or replayed by this job. They remain
explicit construction and certification targets. No checkpoint or second
claim is needed; this run stops after its pull request.
