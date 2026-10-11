# PKG-CrystallineLocalGlobalCompatibilityCM — supplier-blocked checkpoint

Codex (GPT-6), session `codex-xM64td`, 11 October 2026.
Refs [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Branch: `codex-xM64td-crystalline-package`.
Input: `8bc06a21c0192ff9ad96ce3c3c63bfa0a9edfc4a`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6108586417).
Only this job was claimed successfully. Attempts on #6219 and #5704 were
rejected because other sessions won them; neither was worked on.

## Outcome

**Blocked checkpoint, not a completed package.** Fresh source and library
checks confirm the previous handoff's integral-coefficient blocker. Only this
handoff changes. The packet, README and Suggested.lean are unchanged; metadata
remains absent. The accepted input has 97 targets, 103 API entries, 104 tests,
27 requests and 40 gaps: ten planned layers, none closed. Its review expressly
retains missing arithmetic types. Successful elaboration of the existing
signatures does not establish coverage of the omitted targets.

## Freshly checked mathematical blocker

Read Caraiani–Newton, [arXiv:2301.10509v3](https://arxiv.org/abs/2301.10509v3),
printed pp.17–18, including Lemma 2.1.12 and its proof. The coefficients are
integral dual-Weyl lattices, with finite-free reductions. Transitivity of
algebraic induction identifies the evaluation map. After reduction, restriction
of sections to a Schubert variety gives surjectivity; Nakayama then gives
integral surjectivity.

The missing signature is `CrystallineCM.coefficient_evaluation_surjective`,
node `CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12`. The input's
`REQ-INTEGRAL-WEYL`, `GAP-INTEGRAL-WEYL` and `GAP-PROTOTYPE-CL-0` record the
missing lattice, coefficient-change and evaluation interfaces.

Freshly read `TauCeti.YoungTableau.weylModule` at Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, in
`RepresentationTheory/ClassicalGroups/WeylModule.lean`, lines 114–126, and
at current commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, in
`WeylModule/Basic.lean`, lines 122–134. Both require `Algebra ℚ k` and construct
a rational Young-symmetrizer image. A nonzero characteristic-p residue field
cannot satisfy that assumption: p would be both zero and invertible.
Restricting scalars on the characteristic-zero representation supplies neither
the specified integral lattice nor its reduction comparison. The shared-build
source matches the pinned git object byte for byte, SHA-256
`1a702f1106242fa8fb0560f93e7337bf08097430b63f817bd47eb3f2e1e64411`.

Read the current upstream ReductiveGroups README, including Layer 9: integral
pinned groups, root maps and base change do not supply this integral
highest-weight interface. Read-only upstream head:
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`.

The current PotentialAutomorphyInfrastructure packet explicitly assigns
integral induced/Weyl/dual-Weyl modules to
`ReductiveGroupsIntegralRepresentationsPartII`, with no stage yet. A fresh
filename inventory finds no owner packet or export. Its grouped design issue
[#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357), named
`ReductiveGroupsPartIII`, is still `state:available`. Reconcile these names
when the design exports actual stage ids.

WORKERS.md limits edits to this package's deliverables. PROTOCOL §§13 and 15
require faithful signatures and one owner for the general theory. Constructing
that supplier here, or substituting arbitrary modules for the arithmetic
lattices, would not discharge this assignment. This blocker is independent of
the run's remaining time.

## Resume gate

Resume when the representation-theory owner exports the actual integral
lattices, base-change/reduction, Levi evaluation and splitting contracts.
Correctly typed signatures with admitted proofs suffice; implemented proofs
are not required. Replace the corresponding omission entries with their full
signatures, API and examples. A packet-authorized revision must reconcile the
supplier names and inherited locator correction.

The [input handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/8bc06a21c0192ff9ad96ce3c3c63bfa0a9edfc4a/research/blueprint/handoff/PKG-CrystallineLocalGlobalCompatibilityCM.md)
preserves the detailed remaining layer contracts, arithmetic corner comparisons,
qualified Barsotti–Tate endpoint, typed cores and earlier source checks.
Retain its smooth positive-monoid derived-functor and completed-tower supplier
requirements; those additional boundaries were not re-audited in this run.
No disposable scratch file is needed to resume.

For the maintainer: keep this package unavailable until the supplier exports
change. A checkpoint release does not supply them. Do not infer completion
from elaboration or add metadata while the required signatures remain absent.

## Fresh validation

- `check_blueprint.py`: zero errors and warnings. Counts above were freshly
  read from the input. The reviewed library audit has no entry for this new
  roadmap; ALS.6 explicitly records missing arithmetic towers and finite
  recovery rather than supplying them.
- Package `lean-check`: exit 0, no errors, 111 warnings, all uses of `sorry`.
  Available memory before checking: 77 GB. Mathlib build commit:
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. No language server, dependency
  build or update ran; no check remains running.
- Stock `issues.deliverables_complete`: false; metadata.toml is absent.
  This submission must be treated as a checkpoint.
- Packet SHA-256:
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
- README: 197,806 bytes; SHA-256
  `ee14120ed952a9ad2852032a7ca013a5ba74d6fe462d2f542d144df8cb628dda`.
- Suggested.lean SHA-256:
  `75a5404ab2a9767b1c4b1f8d11f899a1bc30ea53daee3d10449c92fa55e96c5d`.
- CN v3 public PDF retrieved 11 October 2026; SHA-256
  `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
  Only the cited pp.17–18 were read in this continuation. No source file,
  extracted text or source passage is submitted.

Submission-file and whitespace validation are recorded in the pull request.
