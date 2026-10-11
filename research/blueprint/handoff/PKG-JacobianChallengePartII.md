# PKG-JacobianChallengePartII — blocked supplier checkpoint

Refs #7593. Codex (GPT-6), session `codex-ng9hTD`, 11 October 2026.
Branch: `codex-ng9hTD-jacobian-package`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6105625082)
for claim comment `6105624017`. This run takes only this job.

**Blocked checkpoint.** The two missing supplier packages and the coupled-bundle
schedule remain unresolved. This continuation independently checked those gates
and validated the inherited Lean file and packet. Only this handoff changes.
The README and Suggested.lean remain inherited work; their successful checks
are not a claim that the omitted geometry has been prototyped or implemented.

## Evidence checked in this run

Atlas clone and remote main were
`98e12a03c5d9478e5c37363f8a3daa086ac341cd`; remote TauCetiRoadmap main was
`4b002f622e9d68b627bdce9f6224897305a68bdc`.
The [atlas package tree](https://github.com/CBirkbeck/tauceti-explorer/tree/98e12a03c5d9478e5c37363f8a3daa086ac341cd/research/blueprint/packages)
has 75 entries and the [upstream roadmap tree](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
has 50. Neither contains `AbelianSchemesAndArithmeticModuli` or
`StableReductionPartII`. The atlas's existing
`AbelianSchemesAndArithmeticModuliPartII` extends the missing parent; it does
not supply the required parent layers A1–A3.

The accepted parent packet's review is
`independent-review-REV-AbelianSchemesAndArithmeticModuli`, 2026-10-09.
Its A1 relative rigidity and cube/power comparisons and A2 normalized
Poincaré/biduality comparisons require arbitrary bases, including nilpotent
thickenings. JC2 and JC5 additionally consume A3 finite locally free
multiplication by every nonzero integer, including when that integer is not
invertible on the base. These contracts cannot be replaced by field-only
abelian varieties or by merely citing the imported R09.4 carriers.

The accepted curve-moduli packet's review is
`independent-review-REV-DESIGN-StableReductionPartII~2`, 2026-10-10.
Freshly read prerequisite lists give this exact sequence:

**JC1 relative Jacobian, base change and principal polarization → MC.4 full
level → MC.4 fine-level scheme → JC7 universal-level Jacobian.**

The fine-level scheme is the fixed symplectic component over
Z[1/N, ζ_N], for g≥2 and N≥3, with its universal smooth projective curve.
The MC.4 nodes explicitly consume JC1, and JC7 explicitly consumes both MC.4
nodes. The two packages therefore need a coupled bundle with this internal
order. Reciprocal dependencies between whole packages would create a cycle;
MC.4 must not become an input to the generic JC0–JC5 construction.

The current queue still has neither `PKG-AbelianSchemesAndArithmeticModuli`
nor `PKG-StableReductionPartII`. `PKG-JacobianChallengePartII` has `after: []`.
Neither `focus.json` nor `upstream/CaraianiNewton.md` names
`StableReductionPartII`; the upstream order document still reports the parent
abelian-scheme package as absent. These scheduling files and supplier outputs
are outside this issue's authorized paths.

The read-only upstream checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; the current Tau Ceti checkout is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This run read the full upstream
JacobianChallenge and AlgebraicVectorBundles READMEs, the reviewed A1–A3
library-audit entries, and the actual current `AbelianVariety` and
`rigidifiedPicardFunctor` declarations. `AbelianVariety` has a field base
`Spec K`. `rigidifiedPicardFunctor` requires a chosen section and constructs
a functor; it does not supply section-free Picard representability. The
field/pointed Jacobian and general tensor/dual/determinant ownership boundaries
remain intact. No Lake command ran in either read-only checkout.

The cleared-library index was read. BLR and MFK are not cleared, and this run
obtained no copy of either. No new primary-source verification or geometric
proof is claimed. Earlier source receipts and mathematical work remain
attributed to their workers in the
[predecessor handoff at the immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/98e12a03c5d9478e5c37363f8a3daa086ac341cd/research/blueprint/handoff/PKG-JacobianChallengePartII.md).

## Validation

- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0; 78 warnings, all `declaration uses sorry`; zero errors and zero
  other warnings.** Available memory was 100 GiB before checking. The shared
  wrapper designates Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Mathlib HEAD was independently
  checked. This run does not claim a new Git authentication of the shared Tau
  Ceti build tree. No compile or language server is left running.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  11 baseline declarations, 14 gaps and 13 requests. All eight layers are
  planned; none is closed. Existing acceptance remains
  `independent-review-REV-DESIGN-JacobianChallengePartII`, 2026-10-05.
- The inherited README is 100,860 bytes; Suggested.lean is 30,594 bytes.
  Its closing omission list and the predecessor's correspondence still leave
  42 geometric targets without their native signatures, plus the geometric
  identifications of the §2.6 and §5.2–§5.4 companions and supplier input in
  §5.6. Elaboration of the available signatures does not discharge these.
- `git diff --check` and the swarm `intake.py check-files` check are run on
  the handoff before submission; their results are reported in the PR.

**Metadata remains absent.** Fresh inspection of
`research/blueprint/issues.py:deliverables_complete` shows that a package is
classified complete when all its outputs exist; it does not inspect a blocked
handoff. Adding `topic = "math.AG"` now would misclassify this checkpoint.
Add it when the supplier and prototype requirements have been met.

## Required action and resumption

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) requires package
citations to use “the other roadmaps of its bundle and the layers of
lower-tier packages”. The issue says “Change no packet; if the plan has a
mistake, describe it in the handoff note” and authorizes only this package
and handoff. Completion currently requires supplier and scheduling work
outside that scope; this is why the run submits a checkpoint.

Before another continuation, arrange both missing supplier packages and the
coupled bundle, and gate this package job on those inputs. Reconcile their
final identifiers and contracts with the README's *Needs* paragraphs. Verify
the combined supplier graph with the JC1 → MC.4 → JC7 order. Then retain all
48 prose targets, express the remaining geometric definitions/API/tests against
their native supplying interfaces, and rerun Lean and submission checks.
Unavailable conditions must not become arbitrary `Prop` fields, empty
predicates or assumed geometric conclusions. Add metadata only at completion.

The inherited proof obligations remain: representability and properness;
polarization descent on nonreduced bases; relative Abel immersion; normalized
Poincaré signs/seesaw; arbitrary-degree-one theta pullbacks and curve-square
calculation; nonsymmetric cube recurrence; actual Picard algebraic equivalence
and relative autoduality; bi-Picard lifts preserving both conditions;
axis-normalized square comparison; and stable rank-g duality before determinants.
The predecessor handoff linked above records exact source locators, proof
receipts, unresolved auxiliary readings and native companion signatures.

## Retained target correspondence

| Package target | Accepted node suffix | Kind |
| --- | --- | --- |
| §0.1 | `degree-locally-constant` | lemma |
| §0.2 | `relative-degree-components` | definition |
| §0.3 | `picard-representability` | theorem |
| §0.4 | `picard-torsors` | construction |
| §1.1 | `jacobian-proper` | lemma |
| §1.2 | `relative-jacobian` | construction |
| §1.3 | `jacobian-base-change` | comparison |
| §1.4 | `principal-polarization` | construction |
| §2.1 | `section-free-abel-map` | construction |
| §2.2 | `degree-abel-map` | construction |
| §2.3 | `pointed-factorization` | lemma |
| §2.4 | `degree-one-closed-immersion` | theorem |
| §2.5 | `nonzero-degree-finite` | theorem |
| §2.6 | `curve-difference` | construction |
| §2.7 | `diagonal-base-change` | comparison |
| §3.1 | `jacobian-poincare` | construction |
| §3.2 | `degree-one-theta` | construction |
| §3.3 | `twice-theta` | construction |
| §3.4 | `theta-inverse-pullback` | theorem |
| §3.5 | `theta-pullback` | theorem |
| §3.6 | `poincare-addition-identity` | theorem |
| §3.7 | `poincare-curve-square` | theorem |
| §3.8 | `theta-doubling-formula` | lemma |
| §3.9 | `poincare-diagonal` | theorem |
| §3.10 | `geometric-twice-theta` | lemma |
| §3.11 | `twice-theta-symmetric` | lemma |
| §3.12 | `twice-theta-zero-rigidified` | lemma |
| §3.13 | `twice-theta-relatively-ample` | theorem |
| §4.1 | `actual-picard-zero` | definition |
| §4.2 | `actual-picard-bizero` | definition |
| §4.3 | `relative-autoduality-pullback` | comparison |
| §4.4 | `actual-to-relative-obstruction` | lemma |
| §4.5 | `actual-pullback-torsion-cokernel` | theorem |
| §4.6 | `bizero-lift-one-factor` | lemma |
| §4.7 | `bizero-pullback-torsion-cokernel` | theorem |
| §4.8 | `axis-normalized-picard` | definition |
| §4.9 | `pointed-square-picard-isomorphism` | comparison |
| §5.1 | `canonical-abel-map` | lemma |
| §5.2 | `universal-shift` | construction |
| §5.3 | `faltings-zhang` | construction |
| §5.4 | `shifted-faltings-zhang` | construction |
| §5.5 | `triangular-coordinate-equivalence` | construction |
| §5.6 | `shifted-power-factorization` | comparison |
| §6.1 | `picard-lie-cohomology` | comparison |
| §6.2 | `curve-jacobian-hodge-bundles` | comparison |
| §6.3 | `hodge-line-isomorphism` | comparison |
| §7.1 | `universal-level-jacobian` | application |
| §7.2 | `universal-faltings-zhang` | application |
