# REV-PKG-EllipticCurveModularityPartII

Issue #7515. Worker: Codex — codex-0YinSk. Date: 2026-10-09. Branch: codex-0YinSk-review-elliptic-modularity-package.

The independent package review is complete, with verdict **needs_changes** in the package's review.json. This is not a checkpoint. The reviewer did none of PKG-EllipticCurveModularityPartII. The report records the six required checks, every one of the 31 target blocks, the eight displayed definition interfaces, source and baseline evidence, corrections and precise remaining requirements.

## Completed corrections

- Replaced F/G/H API source citations with Kraus §3.1, equations (7)–(9), pp.1143–1144. Bennett–Siksek's later threshold displays omit the square roots.
- Clarified that the Cartan/Chen/winding/modular-abelian extensions are required supplier inputs, and removed two instances of process wording from source notes.
- Joined six Mathlib-expressible prototypes from EllipticModularityEffectiveComparisons in its existing namespace: localTerms, martinValue, krausG, krausLocalFilters, lemosNumerator and lemosIntegralJ; included 20 API lemmas and 23 examples labelled with the supplier's planned test names. They are a standalone suggested presentation, not a second development or ownership claim.
- Added a proposed general two-sided number-field norm signature with the actual ring of integers, prime ideal contraction and all complex embeddings. Preserved the seven proved arithmetic theorem checks, their private helpers and the polynomial non-example.

## Validation

The final `lean-check research/blueprint/packages/EllipticCurveModularityPartII/Suggested.lean` exited 0 with zero errors and 50 warnings, all `declaration uses sorry`. Available memory exceeded 20 GB. Checks were sequential, with no language server, build, update or cache command. No compiler remains running.

Mathlib's shared checkout equals the required 082e2d37e8b0463410cdb532e111cd43d5a66174. The shared Tau Ceti checkout is cf386627e9176a3827c1a5fe804989fd94a4d216, rather than f790474821cf4256814db967cb154e7af3d0c369. The suggested file imports only Mathlib; elaboration makes no claim about unexpressed or unavailable Tau Ceti interfaces.

The unchanged accepted packet passes `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartII.json` with zero errors and warnings. All 31 README targets, 68 supplying identifiers, 27 API names and 29 test names match the accepted import plan and supplier. Metadata is exactly `topic = "math.NT"`. JSON, README size, authorized paths and whitespace were checked.

Six public source editions were fetched afresh and matched their recorded SHA-256 values. The report records exact source versions and statement/proof locators; no source passage or file was added to the repository. Independent exact arithmetic reproduced the local/dimension examples, Martin's finite bound/equality checks for levels 1–1521, selected native-index values, five monic numerator degrees/constant terms and signed-divisor j-set cardinalities 25,13,8,6,4, including the explicit level-13 set. No restricted book was needed. Temporary source downloads and arithmetic notes are disposable; the next worker needs only the report and revised package.

## Required revision

F/H remain without definitions, seven APIs and six examples. They must use the native trivial-character newspace dimension; martinValue is not a replacement for its dimension comparison. Only G and the general norm estimate have complete signatures among the 31 main targets. Arithmetic polynomial and matrix results do not identify modular j-maps or construct elliptic isogenies. The report lists each missing newform, conductor, Galois, isogeny, Cartan, winding, integral-model and universal image interface.

Add meaningful supplier signatures under their existing names or import implemented supplier declarations, preserving the exact hypotheses. Do not weaken requirements into arbitrary proposition parameters, phantom carriers, conclusion fields or arithmetic substitutes. Rerun lean-check and inventory actual declarations with comments removed.

The accepted plan is an import index with zero owned nodes and zero closed layers; its merger proposal and the owner's nine gaps remain untouched. This review does not demand proof completion or reopen the accepted plan. The negative verdict is the package's explicit signature requirement. No upstream document, supplier file, packet, link map, queue or atlas data was edited.

No second job was claimed. There is no unfinished review work to resume; the next programme step is a package revision.
