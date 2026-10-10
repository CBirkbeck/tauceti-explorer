# REV-PKG-AbelianSchemesAndArithmeticModuliPartII

Completed independent package review for
[issue #7596](https://github.com/CBirkbeck/tauceti-explorer/issues/7596) on
2026-10-10 by Codex (GPT-6), session `codex-0NkeUt`. The
[bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7596#issuecomment-6100043113)
records this claim. Branch: `codex-0NkeUt-review-abelian-moduli`.
The package author was session `codex-4COpxf`; this session did none of
the package job.

## Delivered and verdict

The [review report](../reviews/REV-PKG-AbelianSchemesAndArithmeticModuliPartII.md)
and package `review.json` record **accepted**. All six required package
checks pass. All 115 accepted targets, 59 API items and 56 named checks
are retained. The final README is 135,245 bytes.

Corrections made:

- P2: restored explicit exact truncation sequences, completed unit
  identifications and the finite-level tensor comparison; retained the
  formal-pullback and inverse-limit distinctions.
- P4: explicitly restricted the Hodge retraction and projected connection
  to the `C_p` generic fibre; integral moment maps remain injections.
- F6: added the actual integer-polynomial counting signature, including
  finiteness and the accepted reciprocity/root hypotheses.
- F4: added the native abstract group-action orbit-counting signature,
  including finite-index and finite-quotient hypotheses; the local
  arithmetic realization remains a prerequisite.
- F4: added native number-field generator and ordered-root discriminant
  signatures, with derivative resultants and repeated-root occurrences.
- Removed “separately planned” from a README check.

The package has 22 targets with native signatures and 93 target
omissions tied to unavailable owner interfaces. Its 12 native examples
include nine accepted P0 checks and three additional torus checks. The
accepted plan's 47 proof/interface gaps and 37 supplier requests remain
mathematical construction requirements, not proof-completion claims.
No accepted packet, historical reader, upstream file or library was edited.

## Validation receipt

Final `lean-check` of the package Suggested.lean returned exit status 0:
zero errors, 58 warnings, all `declaration uses sorry`, and no other
warnings. The existing shared build uses Lean `v4.34.0-rc2`, Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and the imported Tau Ceti
source matches pinned commit `f790474821cf4256814db967cb154e7af3d0c369`.
Memory preflight reported 101 GB available. No background compile remains;
no language server, Lake build, update or cache operation was started.

The accepted plan passes `scripts/check_blueprint.py` with zero errors
and zero warnings. The package audit checked all target/API/test names,
source and prerequisite blocks, internal Markdown anchors, metadata,
size, process language, private paths and placeholder conditions.
The report contains the final artifact SHA-256 receipts. The final raw
compiler-log SHA-256 is
`ee809fd10b385e00d87a8bc5645133ea514ca6ceeaa5fdffd62218c11590bf1b`.
All 17 public source PDFs matched the accepted plan's version hashes.
Source PDFs, extracted text, audit scripts and compiler logs are
disposable scratch material and are not needed to resume.

## What remains

No package-review work remains. Promotion and any upstream publication
belong to the programme and maintainer. Implementation follows the
README's supplier dependencies and P0–P4, B0–B4 and F0/F2–F6 construction
order. The report identifies the conditional counting assumptions and
the source-version conventions that must survive implementation.

This run submits only this job and claims no second issue.
