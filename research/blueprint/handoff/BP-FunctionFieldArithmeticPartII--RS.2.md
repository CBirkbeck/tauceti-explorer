# BP-FunctionFieldArithmeticPartII--RS.2 — issue #8918

Agent: Codex — codex-p4L8sW. Date: 2026-10-14.
Branch: `codex-p4L8sW-8918-root-stack-towers`.
Claim confirmed by the swarm bot in
[comment 6163415667](https://github.com/CBirkbeck/tauceti-explorer/issues/8918#issuecomment-6163415667).

## Result and closure

The target-level planning pass is complete. RS.2 is **planned**, with no
implementation or mathematical closure claimed. The packet contains 20
targets: 5 constructions, 2 definitions, 9 theorems, 3 comparisons and
1 application; 32 API items, 23 definition/construction tests and
11 exact-pin baseline declarations. The reader also contains seven worked
boundary cases and explicit acceptance conditions for the comparisons.
The six existing parent planets are retained; this continuation adds none,
keeping the combined RS.2 layer within its display limit.

Only the four issue deliverables changed:

- `research/blueprint/packets/FunctionFieldArithmeticPartII--RS.2.json`
- `research/blueprint/readmes/FunctionFieldArithmeticPartII--RS.2.md`
- `research/blueprint/suggested/FunctionFieldArithmeticPartII--RS.2.lean`
- this handoff.

The accepted parent packet and its 409 RS.2 affine/algebraic declarations are
preserved. New native geometric target IDs carry `refines` links to the parent
obligations. The native Spec limit, tensor base change, character coaction and
chart injections are imported rather than replanned. No generic quotient,
two-limit, vector-bundle pullback or flat-cohomology theory gets another owner.

The plan specifies the actual root pseudodiagram and compatible-family
groupoid, factorial reindexing on objects/arrows/cocycles, effective fpqc
descent and base change, normalized coframe torsors and their represented
limit, and both directions of the infinite quotient equivalence. It also
specifies the intrinsic DVR pair, residual gerbe, finite Kummer coordinates,
actual torsor-tower equivalence, class lifting and isomorphism detection,
change of origin and a roots-of-two fpqc torsor without fppf trivialization.

Important conventions to preserve in review and implementation:

- Positive divisibility indices, including degree 1; factorial sequence starts
  at 1!. Tensor-power comparisons are coherent isomorphisms.
- Infinite torsors are fpqc; finite μn torsors are fppf even in wild degrees.
- A normalized coframe is β:M→O with β^n=φ. LEFT scaling evaluates the section
  with weight +1, matching the parent chart coaction. Root scalar automorphisms
  act on coframes with the inverse scalar.
- The band-preserving classification uses `Isom(x_λ,y)`, the inverse coframe
  torsor. For φ(e^n)=aλ its finite coordinate is [a^−1]. With λ′=vλ the new
  coordinate multiplies by [v]. For π′=uπ the normal-line frame scales by u^−1.
- The full closed fibre has nonzero nilpotent root coordinates. Its radical
  ideal has no uniform nilpotence exponent. The zero-section gerbe is the
  reduced-chart quotient. Wild inertia remains a group scheme; no general
  reduction functor for infinite fpqc stacks is assumed.
- K_m→K_n sends [a]_m to [a]_n. The power on torsor coordinates does not
  raise the Kummer representative. Finite nonempty isomorphism sets have a
  compatible element by the existing cofiltered-section theorem, without
  requiring surjective transition maps.

## Precisely what remains

The packet records three gaps and five requests. The follow-up must resolve
these supplier contracts, then type and prove the native targets and their
checks. It must not resume the accepted affine micro-lemma expansion.

1. **RS2-NATIVE-CARRIERS:** actual finite root groupoids, fpqc quotient fibres,
   compatible-limit stacks, pullback transformations/modifications and universe
   lifts. This uses **RS2-JAC-A** at `SchemeAndStackFoundations:SF.3`,
   **RS2-ORDINARY-STACKS** at `DiamondsAndVStacks:D0`, and
   **RS2-LIMIT-TYPING** at `AlgebraicModuliForArithmeticGeometry:R09.4`.
   The definitive signatures, APIs and tests are in the reader. Unavailable
   carriers are not replaced by opaque data, arbitrary predicates or point
   groupoids in Lean.
2. **RS2-AFFINE-LIMIT-PROOF:** resolve **RS2-TOWER-AFF** at
   `SchemeAndStackFoundations:SF.1`: effective affine descent, faithful-flat
   inverse limits, action-square and finite-kernel quotient comparisons,
   tensor/colimit base change, and the finite-residue closed-point input.
   Apply these exact hypotheses to the root coframes and Kummer torsors.
3. **RS2-FLAT-COHOMOLOGY:** resolve **RS2-KUMMER-FINITE** at
   `SchemeAndStackFoundations:SF.2`: all-positive flat Kummer, Pic of a field,
   finite torsor class/quotient compatibility and fpqc H1 torsor-class typing.
   Then complete lifting/detection, the group-class comparison and signed
   neutralization change with their specified band convention.

These are existing owner contracts, not newly opened implementation issues.
No restructuring or upward tier dependency was introduced. Current upstream
AlgebraicVectorBundles L0A/L0B section and pullback targets are imported through
SF.3; the current nine post-snapshot roadmaps do not supply this RS.2 geometry.

## Verification receipts

- `TAUCETI_BASELINE=… python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--RS.2.json`:
  zero errors and zero warnings, with the exact-pin declaration index.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--RS.2.lean`:
  exit 0, zero errors, 11 admitted-proof warnings, zero other warnings.
  The 124-line file contains only two real-bodied light abbreviations,
  three statable coordinate milestones and eight examples. It imports
  Mathlib modules only; no new Tau Ceti carrier is asserted.
- Mathlib source HEAD in the shared build was
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The baseline Tau Ceti source
  statements were read at `f790474821cf4256814db967cb154e7af3d0c369`.
  Available memory before compilation was 111 GB. No language server or
  library build was started.
- Suggested file SHA-256:
  `ecca6faf31e3906b34b96d1a83951fc164cb2d34895be1c9e8b8f765b991c085`.
  Successful compile log SHA-256:
  `4b37da2fbd66042b7911a5ae81a00de7ef4a1fc07fd54a15a2ca4d06b32b8285`.
- Reader target IDs, API items and tests were checked against the packet.
  Submission file checks, the data-body shape check and staged whitespace
  checks passed before the PR opened.

## Sources and upstream check

All source statements and arguments in the deliverables are in the worker's
own words. Public PDFs were read in scratch, with versions, page locators,
date and SHA-256 recorded in the packet and reader. No source file or passage
is included in the repository and no unavailable source was needed.

- **TV17**, arXiv:1410.1164v2, §3/§3.1 pp.12–16, including the statements and
  proofs of Propositions 3.2, 3.4, 3.5, 3.10, Remark 3.6, Definition 3.8,
  Remark 3.9, Lemmas 3.7 and 3.12, and Corollary 3.13. Fine-saturated
  logarithmic hypotheses are distinguished from the authored arbitrary-pair
  extension via coframes and effective descent.
- **AGV08**, arXiv:math/0603151v2, Appendix B.1–B.2 pp.52–54, including finite
  line roots, sections, full zero fibre and quotient comparisons. Parent
  finding E12, the unbound section-power exponent, was directly reconfirmed
  and retained as an inherited preprint misprint. No published-version
  correction claim was made.
- **B24**, version of record, Invent. Math. 235 (2024), p.133 and §3
  pp.135–136. The source's noncanonical reduced-fibre and Kummer identification
  are expanded into torsor-groupoid, lifting and detection obligations.
  Wild characteristic and the signed origin formula are marked authored
  extensions. The roots-of-two counterexample is also an authored deduction.

Read current upstream AlgebraicVectorBundles README and relevant Suggested
section/pullback signatures, and JacobianChallenge README as an upstream
style/density example. Current upstream commit:
`0d144d044dacebca17b654695b6f1ad58f159b27`. The roadmap/library searches and
reviewed foundation audit boundary are recorded in packet `auditEvidence`.

Scratch is disposable: all source receipts, conventions, outstanding supplier
contracts and reproduction commands needed by the next worker are above or in
the deliverables. This worker takes no second job.
