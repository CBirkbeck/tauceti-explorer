# Handoff: REV-PKG-RankZeroOneBSD

Completed independent package review for issue #9235, by Codex session
`codex-l0Zk2H` on 2026-10-13. Verdict: **accepted with corrections**. The package
was written by a different session, `codex-aO0QdW`. This run claimed one job.

## Deliverables and corrections

The verdict is in `packages/RankZeroOneBSD/review.json`; the complete source,
definition, signature and 153-target adversarial records are in
`reviews/REV-PKG-RankZeroOneBSD.md`, relative to `research/blueprint/`.
The README keeps all 153 retained targets and all 15 input gaps. The 12 input
nodes already deferred to EllipticCurveModularity or EllipticCurves were checked
and remain deferrals. No additional target was removed or ownership moved.

Corrected Wüthrich Lemma 17 to statement p.397/proof p.398, with Theorem 4 p.384;
clarified BFH's p.615 unnumbered lemma called Lemma 9.1 on p.616; removed two
duplicate source citations. Repaired Layers 5–7 and Layer 1 rationality
references, additive `addOrderOf` dependencies and the Layer 4 supplier wording.
The 32a2 point proof now uses its own nonsingularity, negation and vertical-tangent
cases. The exact 37a1 calculation 8P=(84/25,−52/125) is a consistency check in the
later saturation target, explicitly proving neither saturation nor Sha order.

Clarified that native number-field logHeight is relative, of total weight equal
to the field degree. Current Tau Ceti a91d3aaf uses the full x-height limit in
CanonicalHeight.Basic, while the pin divides by two; the README now prevents
applying the pinned regulator conversion to the current revision a second time.
Added computed normalization witnesses for heights/regulators, completion/sign,
period-lattice index, coefficient lengths/cardinalities, ideal direction,
pseudo-null/Fitting distinction, squared BDP, Euler substitution, dyadic
characters and rational reconstruction. Scoped arithmetic coefficient rings to
characteristic zero and finite residue cardinality where needed. Corrected the
11a1/11a3 comparison: both rational torsion orders are five. The rational 32a2
model explicitly adds dyadic BSD data to the existing finite-field equation.
Hida Theorem I, p.45, is now cited with the 2022 addendum replacing Lemma 3.17;
its exceptional condition is not omitted.

Suggested.lean and metadata.toml are unchanged. The Lean file has 241 lines,
five real-bodied data definitions/structures, no sorry-defined data or developed
auxiliary theory. Heavy arithmetic constructions remain fully specified in the
README and named in the closing Lean comment.

## Verification

The independent `lean-check` exited zero with 23 warnings, all uses of `sorry`.
The file remained unchanged after that run. Both accepted packets passed
`check_blueprint.py` with zero errors and warnings. The submission files passed
`intake.py check-files`; `git diff --check` passed. Inventory and dependency
checks confirm 165 inputs = 153 retained + 12 deferrals, no lost API entries,
and no missing/forward internal subsection prerequisite.

Source sample: Python Random seed 9235, sampling 15 of the 137 retained targets
with an external/library source, in the two packets' order. It reproduces the
15-item table in the review. Previously unread BFH, Gross and Gross–Zagier
locators were checked directly; original FH, Birch–Stephens and parts of the
Rubin/Hida–Tilouine chain remain explicitly marked source obligations. The
review records public URLs, access date and actual PDF SHA-256 digests. No
source files, passages or private paths were added.

Current upstream checked at 0d144d044dacebca17b654695b6f1ad58f159b27; current
Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Relevant statements at
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369 were read independently. These
checkouts were read only; no Lake build/update/cache or language server ran.

## Next step and limits

Ready for the maintainer's draft roadmap port. There is no unfinished review
fix or checkpoint to resume. Port/implementation must retain the exact supplier
extensions and all 15 mathematical/source gaps listed in the review and README.
They include the signed and higher-weight integral proofs, elliptic-unit owner,
KY ring/lattice/control comparisons, effective arithmetic certificates and
analytic interval replay. Existing narrower supplier roadmaps cannot be treated
as proving those stronger contracts. Rank equality, whole-Sha finiteness, one
prime-part equality and a complete full-formula certificate remain separate.

No mathematical claim is described as formalized. Scratch can be deleted:
everything needed by the next worker is in these deliverables and the package.
