# Independent package review: AbelianSchemesAndArithmeticModuliPartII

**Verdict: accepted.** Reviewed on 2026-10-10 by Codex (GPT-6), session
`codex-0NkeUt`, for [issue #7596](https://github.com/CBirkbeck/tauceti-explorer/issues/7596).
The package author was a different session, `codex-4COpxf`, in
[PR #8506](https://github.com/CBirkbeck/tauceti-explorer/pull/8506).
This reviewer did none of that package job.

The mathematical input is the independently accepted
[Part II plan](../packets/AbelianSchemesAndArithmeticModuliPartII.json), including
its review corrections. The package preserves all 115 targets in 17 layers,
59 named API items and 56 named definition checks. Acceptance here concerns
the roadmap specification and its suggested signatures. It does not assert
that the mathematical constructions or proofs have been implemented.

## Corrections made in place

1. **P2 finite and completed sheaves.** Made the formal-pullback comparison,
   both exact truncation sequences, both completed unit identifications and
   the finite-level coefficient-tensor isomorphism explicit in the README.
   The previous account named these constructions but compressed the
   equations. The matching omitted geometric signature now carries the same
   statement. These are the accepted target's identities, located in
   Kings–Sprang, Definitions 2.4/2.7 and equations (2.1.4)–(2.1.5), linked
   v4 PDF pp.14–16. No interchange of an arbitrary tensor product with an
   inverse limit is introduced.
2. **P4 generic-fibre restriction.** Explicitly confined the Hodge retraction
   and projected connection comparison to the `C_p` generic fibre in both
   files. Integral moment maps remain injections. Kings–Sprang, Notation
   5.10 and Lemma 5.11, pp.60–61, distinguish these assertions from the
   integral trivialization of Proposition 5.9, pp.59–60.
3. **F6 polynomial count.** Replaced an unnecessary omission by
   `AbelianArithmetic.weilPolynomialCount`. Its carrier is an actual set of
   integer polynomials. Monicity, degree, constant coefficient,
   reciprocity and the complex-root norm condition are stated directly.
   The conclusion includes both finiteness and the README's bound
   `(4g+1)^g q^(g(g+1)/4)`. It assumes `q≥2` and `g≥1`, with no
   squarefreeness assumption and no invented isogeny carrier. This is the
   accepted adaptation of Lipnowski–Tsimerman, Lemma 2.1, v1 p.5.
4. **F4 abstract orbit count.** Replaced an unnecessary omission by
   `AbelianArithmetic.rationalOrbitCount`, using native group actions,
   stabilizers, conjugate subgroups and double cosets. Its assumptions
   explicitly include finiteness of the coarse orbit and double-coset
   quotients, containment of each stabilizer in a conjugate of the fixed
   level, and finite relative index at most `D`. Its conclusion is
   finiteness and the bound `D^3*h`. The README explains how the accepted
   finite-support local product hypotheses supply that relative index.
   This combines the AA.4 level-change and conjugation interfaces rather
   than rebuilding them. Native `Nat.card` and subgroup index can be zero
   for infinite quotients, so numerical bounds alone would be inadequate.
5. **F4 discriminant bounds.** Replaced the omission by two native
   signatures. `weilGeneratorDiscriminantBound` uses an actual number
   field, an integral primitive generator, its minimal polynomial and
   `NumberField.discr`. The absolute derivative resultant expresses the
   absolute polynomial discriminant without introducing a new carrier.
   `orderedRootProductBound` proves positivity, integrality and the norm
   bound for the product over unequal root values, including occurrence
   multiplicities. Neither needs an adelic lattice carrier. The
   number-field comparison specializes the EffectiveBounds integral-basis
   interface; its Weil-root estimate and repeated-root product are the
   accepted F4 adapter (Lee, §§2.1,3.1–3.2, pp.3,5–6).
6. Replaced the phrase “separately planned” in a definition check by a
   direct reference to the diagonal comparison below.

## The six package checks

### 1. Upstream form

The README has motivation, ownership boundaries, conventions, library
interfaces, a construction order, target statements with sources and
prerequisites, companion API and checks, and references. Its organization
matches the upstream specification style, including the current
ClassFieldTheory roadmap's separation of contracts, dependencies and
regression checks. It contains 135,245 UTF-8 bytes, below 200 KB. The README has 139
distinct heading anchors, and all internal links resolve.

The current upstream checkout was read at roadmap commit
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; the current Tau Ceti checkout
was inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither was
modified or built. In particular, the AlgebraicVectorBundles vector-space
variance and AA.4.4 finite-index level-change contracts agree with the
package's uses. The current general geometric, adelic and arithmetic
suppliers remain dependencies.

### 2. Fidelity, hypotheses and ownership

Matched the target statements individually, accounting for shortened
headings rather than relying on equal titles. Each of the 115 target
sections retains a source locator and a prerequisite block. All accepted
API and test names occur in both the README and Suggested.lean. Checked
the prerequisite references against the accepted plan and the current
supplier interfaces; the native auxiliary prerequisites and the independent
DWP Frobenius-bound dependency added by the package author are consistent
with the stated ownership.

| Branch | Targets checked | Conditions retained |
| --- | ---: | --- |
| P0–P4 | 23 | Invariants rather than coinvariants; shuffle multiplication; degree completion; free or finite-projective comparison hypotheses; extension of the dual; noetherian model before completed `O_Cp` base change; ordinary completed cohomology; characteristic-zero logarithm comparison; generic-fibre projected connection. |
| B0–B4 | 38 | Betti projection excludes the base; factor-two form normalization; twice total complex dimension; distinct actual/geometric traces and the two specialness notions; curve dominance; jumping modular fibres in global closedness; normalized weakly optimal quotient data; dominating fibre-product components and the stated fibre-power thresholds. |
| F0–F6 | 54 | Finite-field rational and integral Tate interfaces; common nonzero resultant tests over a general DVR; contravariant Dieudonné and opposite algebra; prime-field linear dual; marked transport by `C(f)⁻¹`; finite-support lattices; unequal root values with occurrence multiplicity; fixed-level class numbers and separate quaternion cases; odd-characteristic point-group restriction; Hermitian coefficient `1/2`; conditional uniform counting assembly. |

The arithmetic dependencies run F0 and F2 before F1, then F3–F6. The
power-sum bound keeps its enlarged interval constant and explicit
reciprocity condition. The DiPippo–Howe inequality retains the possibly
negative small-dimensional right side; logarithmic asymptotics use
eventual positivity. The unconditional unpolarized endpoint remains
`log B(p,g)=O_p(g²)`. The coefficient `69/4` requires the explicitly
uniform per-isogeny-class coefficient `17`; no `17/2` or `45/4`
unconditional claim appears. The ppav proportion excludes both repeated
simple factors and the real Frobenius factor `X²−p`.

The accepted plan has 47 proof/interface gaps and 37 supplier requests.
Their substantive work is retained in the named dependencies and the
17 layer construction requirements. These are obligations of the
roadmap, rather than assertions that the interfaces already exist. The
package does not change the accepted plan or certify these proofs closed.

### 3. Own words and citations

The document specifies mathematical interfaces across its three branches;
it is not a section-by-section source summary. Target prose is independently
phrased and carries theorem, section or equation identifiers and page
locators. The bibliography pins the linked versions and distinguishes
printed pages from PDF pages. No source passage, source PDF or restricted
library material is included in the deliverables.

Retrieved all 17 public PDFs from the accepted plan's URLs and verified
their SHA-256 values against its `sourceVersions`. Directly re-read the
Kings–Sprang completion/vector-extension and ordinary-CM passages, the
DGH Betti-form/rank passages and the Lipnowski–Tsimerman polynomial,
lattice, polarization and small-characteristic passages relevant to the
critical hypotheses. The package preserves the accepted corrections to
those sources. This is a package fidelity review, not a fresh audit of
every auxiliary proof in the accepted plan.

### 4. No process in the roadmap

The README contains no job identifiers, packet names, review history,
checkpoint text or coverage statuses. A text scan and direct reading also
found no private filesystem paths or placeholder supplier markers. Review
and validation information is confined to this report, `review.json`
and the handoff.

### 5. Suggested Lean signatures

Read the 13 cited baseline declarations with their hypotheses and compared
the native signatures with the README. The imported Tau Ceti
`LinearAlgebra/TensorProduct/Symmetric.lean` bytes match its pinned GitHub
commit `f790474821cf4256814db967cb154e7af3d0c369`; their SHA-256 is
`96082789ca2c4f7a86e8b381f72484729723430fa577f1a2919abfdc226e2893`.

The file now gives native typed signatures for 22 targets: six P0, seven
B2, five F2, two F4 and two F6 targets. Its remaining 93 target omissions
identify the actual geometric or arithmetic owner interfaces required and
retain the mathematical statement and source. Native field-level abelian
varieties, polynomials and torus fibres do not provide the relative sheaf,
Betti-family, Dieudonné or polarization interfaces needed for those
omissions. There are no substitute geometric carriers or
`Prop := sorry` conditions. Twelve native examples elaborate, including
the nine accepted P0 checks and three additional torus-annihilator checks;
the remaining named checks are explicitly recorded as omissions.

Final command:

```text
lean-check research/blueprint/packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean
exit status: 0
errors: 0
warnings: 58, all declaration uses sorry
other warnings: 0
```

The check used Lean `v4.34.0-rc2` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` in the existing shared build.
Memory preflight reported 101 GB available. Lean checks ran serially, and no
language server, Lake build, update or cache download was started. This
receipt establishes elaboration of proposed statements, not their proofs.

### 6. Metadata

The file is exactly `topic = "math.NT"` followed by a newline. Number
theory fits the arithmetic moduli, Frobenius classification and counting
endpoints.

## Validation and final artifacts

The accepted plan passes `scripts/check_blueprint.py` with zero errors
and zero warnings. Package checks found all targets, API and test names;
valid internal links; exact one-line metadata; no private paths or dummy
conditions; and clean whitespace. Changed paths are restricted to this
package, this report and this job's handoff.

| Artifact | SHA-256 |
| --- | --- |
| README.md | `93225f754925b420916e06eefd34486f6419f4021b72f44225632e77b4612928` |
| Suggested.lean | `b79332910ed452497fadc1443431a9db50266c4c77610949b00ac095f0e00048` |
| metadata.toml | `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7` |

No unresolved package correction requires another round. Future
implementation starts with the cited supplying interfaces and the
construction order in the README; the suggested forms do not replace
that mathematical contract.
