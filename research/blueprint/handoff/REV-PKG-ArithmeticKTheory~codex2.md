# ArithmeticKTheory independent review handoff

Job `REV-PKG-ArithmeticKTheory~codex2`, issue #11353. Agent: Codex,
session `codex-Ut7za3`. The claim bot confirmed this session's claim
on 2026-10-20. This is a complete submission of one independent review.

## Outcome

Accepted the package after checking the earlier adversarial report and
both fix handoffs independently against the sources, plan inventory and
current libraries. The complete evidence, source identities, adversarial
table, thirteen-signature audit and finite-certificate calculations are in
[the review report](../reviews/REV-PKG-ArithmeticKTheory~codex2.md).
`review.json` now names this independent review rather than a fix worker.

Corrections: Lemma VI.2.4 locator; public author-version links and matching
Groenewegen/FGV pagination; explicit distinction between current exact K₀
and the older elaboration pin; names and exact obligations for the sextic
certificate and conditional higher completion comparison. Removed two
standalone numerical Lean examples while retaining their README negative
controls. All general targets, thirteen theorem signatures, tables and
62 Checks lists remain. Metadata already has the correct one-line math.NT
topic and is unchanged. Packets and other roadmaps were not edited.

The issue's stale Mordell title and nonexistent earlier `~codex` report
were resolved using its final ArithmeticKTheory instructions and paths;
the actual earlier `~adv` report was read. No additional job was claimed.

## Obligations for eventual formalization

- `caputoSexticArithmeticCertificate` certifies the field, S-class group,
  unique prime above 3 and cyclotomic/local root data of §6.6.
  Caputo's PARI-reported class group was not independently certified in
  this review. The counterexample deduction is conditional on those
  explicit arithmetic inputs; the unconditional eventual theorem has its
  own finite-subgroup proof.
- `rawWildKernel_eq_symbol_of_localRestriction_eq_zero` takes the actual
  local-restriction vanishing hypothesis. Establishing that hypothesis in
  higher degrees is the open extension problem. The symbol theorem and
  its special-field obstruction are retained unconditionally in their
  stated source-supported scope.
- The exact H.3/H.6, hermitian, K.7, early M.7, RT.4 and Brauer supplier
  contracts remain planned exports. The three additional finite
  IntegralIwasawaTheory requests have explicit source proofs and action
  conventions. This review does not implement or edit their owners.
- Historical external packet synchronization is outside this issue. The
  package already avoids the full M.8 edge cycle and names the four later
  roadmaps only as downstream consumers, where mentioned.

Harris–Segal's and Keune's original articles were not obtained; their
explicit alternative constructions were checked through Mitchell and
Caputo. Hutchinson and Groenewegen locators refer to their author
preprints, not an uncollated journal edition. Washington was not cleared
by the library index and was not used. No private-library file or source
passage was copied. No suspicious fetched instructions were encountered;
source documents were treated as data and no fetched code was executed.

## Validation and reproducibility

- `lean-check` exited 0: seven real-bodied definitions, thirteen theorem
  targets, twelve proved examples, 225 lines, only thirteen intended
  `sorry` warnings. Available memory before compilation was 78 GB.
- `scripts/check_sorry_data.py`: exit 0.
- All eight ArithmeticKTheory input/assembly packets passed
  `scripts/check_blueprint.py` read-only with zero errors and warnings.
- Intake file checks and `git diff --check` passed. README stays below
  200 KB. All 62 Checks blocks have at least three bullets.
- Independently recomputed all eleven golden-field certificates using
  exact rational pairs, 173 relation equalities and 23 selected signed
  determinants. The report retains every determinant and the arithmetic
  rules needed to reproduce the check; it is not a formal certificate.
- Current read-only upstream commits checked: TauCetiRoadmap
  `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer families
  and four named Completed roadmaps were included. No further duplicate
  target was found; the existing golden-field arithmetic remains an
  input. No upstream checkout was changed or built.
- The local source blobs for the four pinned Tau Ceti S-integer/class-norm
  modules match the GitHub tree at
  `f790474821cf4256814db967cb154e7af3d0c369`; the shared build uses
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

No unfinished review item needs another worker. Source and calculation
scratch files are disposable; the durable findings are all in this
handoff and the report.
