# Handoff: REV-PKG-ArakelovGeometryAndAbelianHeights

Issue #9772. Reviewer: Codex, session **codex-m5RItY**, 2026-10-14.
Status: **complete; accepted with corrections**. The package author was Codex
session codex-zt51cz (#9769, PR #9813); this reviewer did not author the input.
No second job was claimed.

## Deliverables and result

The package README and Suggested.lean were corrected in place. The verdict is
in `research/blueprint/packages/ArakelovGeometryAndAbelianHeights/review.json`;
the full evidence, source-sample table and adversarial topic table are in
`research/blueprint/reviews/REV-PKG-ArakelovGeometryAndAbelianHeights.md`.
The single-line `metadata.toml` remains `topic = "math.NT"`.
The accepted packet and other jobs' files were not edited.

All 55 input topics, every input API name and every named input test remain
accounted for. There are now 54 numbered topics: the seven plain Hodge-line
API entries and their checks moved to Exact supplier contracts, under their
existing abelian-scheme, Néron-model and compactification owners. Old
§§2.2–2.11 became §§2.1–2.10, including internal references and Lean docstrings.
No library theorem was removed. The modular-line entries now specify the
additional metric and isometry on C5's imported underlying ample line.

The mathematical corrections concern the principal Green-current sign;
rational units and nonvanishing on every component; signed cycle multiplicities
and restriction for contained cycles; Mathlib's conjugate-first hermitian
convention; clearing denominators of a generic elliptic differential; and the
finite-part and ambient-divisible-group hypotheses of isogeny towers. The
good-reduction tower corollary uses the shifted base A_(n₀). The local Tate
pairing, Kummer exact sequence and uniform cokernel asymptotic already needed
by the arbitrary-reduction proof now have named target interfaces. Additional
checks cover disconnected rings, mixed pairings, rationalized lines, Picard
metrics, multiplication and twists. The reduction-prime export explicitly
bounds non-semistable primes; its conclusion permits multiplicative fibres.

## Baselines, sources and retained contracts

The Mathlib pin is `082e2d37e8b0463410cdb532e111cd43d5a66174` and the
packet's Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`.
Current read-only duplication baselines were TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, including Completed, and TauCeti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Generic bundles/determinants,
Gram covolumes and forms/integration remain their existing roadmap imports.
The dependency walk found no upward proof prerequisite. R28 is a downstream
consumer, including its global stabilization and descent arguments.

All 17 public source PDFs matched the packet's recorded SHA-256 digests. The
15-locator sample was generated with `random.Random(9772).sample(citations, 15)`
on the packet's 159 citations in node/source order. The report records every
locator and outcome. Faltings–Chai was read in place from the cleared library;
no book file or passage was copied. No sampled locator required correction.

Four inherited source limits remain explicit in the package and report:

- The numerical Bost bound uses identified public secondary statements;
  its primary Duke/report proof was not read, and no sharpness is claimed.
- The Silverman and Faisant–Philibert primary proofs were not read; the
  public Gaudron–Rémond and Bilu–Parent–Rebolledo statements were checked.
- The arbitrary-reduction dual-different proof is restricted to local fields
  with finite residue field and explicitly develops the abelian-variety
  pairing and Lie-filtration inputs, rather than silently importing Bégueri.
- The CM polynomial comparison assumes rank-one de Rham freeness and
  monogenicity; the primary Colmez freeness theorem was not read.

The integral level-one compactification, translated-theta basis,
unrestricted finite-flat dual-length identity, strict non-unit Lie determinant
and minimal Néron discriminant remain exact supplier contracts. The finite-flat
shift theorem is used only with its ambient divisible-group hypothesis.
The report explains these limits; none is a hidden conclusion of an unrelated
supplier.

## Validation and remaining work

- `lean-check` on the final **234-line Suggested.lean** exited **0**, with
  exactly **18** `declaration uses sorry` warnings and no other warnings or
  errors. Its eight definitions/abbreviations have real bodies. The new scalar
  and disconnected-ring examples are proved. Ten representative signatures
  and all eight definitions were checked against the README.
- `python3 scripts/check_blueprint.py` on the unchanged packet: **0 errors,
  0 warnings**, 55 nodes, 151 definition/construction APIs and 80 tests.
- `python3 research/blueprint/intake.py check-files` on the package files,
  verdict, report and this handoff: **0 problems**.
- Input API/test retention, definition/construction check counts, JSON parsing,
  metadata format and `git diff --check` passed.

No package-review work remains. The maintainer can use the accepted package
for its upstream draft; implementation of its targets is future Tau Ceti work.
The scratch sources and logs are disposable: all durable findings and source
locators are in the report and package, and source versions are in the unchanged
packet.
