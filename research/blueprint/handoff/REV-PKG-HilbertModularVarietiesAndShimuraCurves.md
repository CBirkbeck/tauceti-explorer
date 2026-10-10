# REV-PKG-HilbertModularVarietiesAndShimuraCurves

Completed independent review by Codex (GPT-6), session `codex-DzeQVX`,
2026-10-10. Refs #7934. Verdict: **needs_changes**. This is the finished
review job, not a checkpoint of the package job. The reviewer did not write
the input package (`codex-lD9kHU`, #7906).

The report and `review.json` record all six checks. All 133 README targets,
206 API entries and 157 tests were checked against the two accepted parts;
all 52 definitions/constructions retain at least three tests. The README is
193,639 bytes. Internal links resolve and local prerequisites occur earlier.
Metadata remains the single `math.NT` line.

Three typed signatures were corrected: finite scalar-determinant membership
requires a prime and positive level; residual evaluation factors uniquely;
trace-family parameter additivity includes the zero law. The README and
suggested-file comment distinguish a geometric finite-level component over
Carayol's completed class field from its connected arithmetic component over
the unramified completion, with source locators p.155 and §§4.5.1–4.5.5,
pp.188–189. General descent data are not certified by that clarification.

Initial and final `lean-check` both exited 0 with exactly 120 warnings, all
`declaration uses sorry`, at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Both packet validators exited
0 with zero errors/warnings; `git diff --check` passed. No packet or other
job's file was changed, and no source file or passage was copied into the repo.

## Where the revision resumes

The block comment beginning “Full mathematical signatures and carrier
requirements” is the missing Lean work. There are 93 native named
declarations and 47 native examples, and 154 of 206 README API names are not
Lean declarations. Start with `H1/c-polarization`, `H1/tame-level-functors`,
`H2/dp-integral-model`, `R18.1/canonical-quaternionic-curve` and the analytic
APIs of `R18.5/drinfeld-half-plane`, as detailed in the report. Use actual
supplier interfaces and concrete tests, without arbitrary proposition fields
or dummy geometry. The packet gaps and the package author's mathematical
qualifications remain; this review does not turn validator success into
closure.

The existing ownership moves listed in the package author's handoff still
apply. Current upstream roadmaps were screened read-only, including the nine
newer than the snapshot and OperatorTheory's nested suggested files. The
current roadmap tree was refreshed at
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native current twisted
cohomology is an existing dependency, not a new target here. The old
ClassFieldTheory link screen does not reflect the explicit restricted
CM-character input now cited by this package; the maintainer can refresh it
without changing reciprocity's owner.

## Public source receipts

Accessed 2026-10-10, read in scratch only; scratch copies are discarded after
submission. These hashes identify the versions actually fetched, not source
files to add to the repository.

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| Carayol | [Numdam](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf) | `22c01e577504a9963168e78373286d8ecac6ecc8178db64262cf8d473b91b3b3` |
| Yuan–Zhang | [Annals version of record](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507` |
| Diamond | [arXiv v2](https://arxiv.org/pdf/2011.14128v2) | `2d8f8fd3d1e1e468d57183bcd0eef454e1e8fff4a7e143c8a0e48e490692e3c2` |
| Badulescu–Renard | [Author preprint](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf) | `dc3aad1d249fda35f40f33f7b688537f226e509ed6879fe36dd5d07a15839c88` |

Dimitrov's [author copy](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf)
was read through the public PDF viewer, Theorem 8.6(iv), p.548. A direct
download timed out; no downloaded-file hash is asserted.
