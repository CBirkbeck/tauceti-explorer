# REV-PKG-VectorBundlesAndIsocrystals~2

Completed by Codex, session `codex-DvVDth`, 2026-10-09.
Issue: [#7942](https://github.com/CBirkbeck/tauceti-explorer/issues/7942).
Branch: `codex-DvVDth-review-vector-bundles-package`.
Claim: [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7942#issuecomment-6091176611).

**Accepted; complete independent package review.** This session wrote neither
package version. No work remains for this job. The maintainer controls the
upstream submission; this worker opens only the atlas review PR.

The [review report](../reviews/REV-PKG-VectorBundlesAndIsocrystals~2.md)
records all six checks, prior signature failures and their repairs, source
editions, baseline checks and limits. The package's
[review.json](../packages/VectorBundlesAndIsocrystals/review.json) records the
accepted verdict. The README retains 127 targets, 168 APIs and 124 tests; all
121 hypothesis entries and 549 original prerequisites transfer. Its final
size is 196,551 bytes.

Two current-upstream clarifications were made in the README and suggested
contract comments:

- Import the completed unramified field, extended arithmetic Frobenius and
  fixed field from ReductiveGroupsPartII RG2.0.4; retain LocalFieldsRamification
  Layer 2 and RF0 for their respective unramified and ramified-Witt inputs.
- Import smooth affine integral models from RG2.3.1 and Lang's theorem from
  RG2.3.7. The stronger integral tensor-fibre-functor reconstruction is an
  explicit ingredient of the existing integral-group-torsor target, with
  SW Theorems 19.5.1–19.5.2, pp.178–180. The current Part II roadmap does not
  supply that reconstruction. No existing model or Lang target is duplicated.

For the next authorized integration: the accepted packets remain unchanged.
Reconcile their generic `CurveBundle` entries with AlgebraicVectorBundles
L0A–L0C and current `FiniteLocallyFreeSheaf`, their completion references with
RG2.0.4, and their older integral-dictionary supplier request with the local
reconstruction ingredient above. No new general ReductiveGroups Part II
extension is proposed here. Current upstream was inspected read-only at
`618e0b30d21791d6a492ce88ba8602745697b21a`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Validation:

- Independent whole-file `lean-check research/blueprint/packages/VectorBundlesAndIsocrystals/Suggested.lean`:
  exit 0, no errors, **156 warnings, all sorry**; 102 GB available before the
  final run. Review edits affect comments only. No language server or
  build/update/cache command was run.
- Both unchanged accepted packets passed `scripts/check_blueprint.py` with
  0 errors and 0 warnings each.
- All 29 baseline statements were read at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. The shared build's Mathlib has the
  exact pin; seven transitive Tau Ceti source imports match the pin byte-for-byte.
- All 127 target anchors are unique, 387 local target links and 157 source
  references resolve. JSON/TOML, submission-path and whitespace checks pass.

The geometric interfaces and proof ingredients retained in omission contracts
remain implementation requirements, including crystalline Hom normalization,
uniform contraction/escape, actual local-system comparisons, Le Bras
equivalence and arbitrary-VS bounded-image control. A successful prototype
check proves none of those admitted results. Disposable sources and logs are
unneeded for continuation; the report records editions and reproducible checks.

Only the authorized README, Suggested.lean comments, verdict, report and this
required handoff changed. No input packet, component file, atlas data, link
map, upstream roadmap or library was modified.
