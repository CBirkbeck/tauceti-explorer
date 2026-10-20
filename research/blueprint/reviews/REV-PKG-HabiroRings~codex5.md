# Independent package review: HabiroRings

Issue #11499 · Codex · session `codex-3ZlRas` · 2026-10-20.

**Verdict: accepted.** Independently reviewed the result of #11490/#11498 against codex4 R1 and the accepted packet contracts. The general deformation gap is closed by the ownership alternative authorized in #11490. This is a completed review, not a checkpoint.

## R1 and preservation

README §§0.1–0.6 now state the six general targets, all ten `EtaleDeformation` operations, fourteen `CompletedEtaleLift` operations and seven named checks. The hypotheses have the required separation:

| Target | Retained generality |
| --- | --- |
| Marked object and reduction of maps | Arbitrary commutative B and ideal I; actual marking, with reduction conjugated by both markings; étale need not be module-finite. |
| Object existence | Arbitrary I; no nilpotence, finite generation or Noetherianity. |
| Reduction equivalence | Locally nilpotent I, including the nilpotent specialization and marked comparison laws. |
| Ordinary completed lift and maps | Finitely generated I; every quotient level and maps to any ordinary complete target, without target flatness or étaleness. |
| Principal derived uniqueness | Regular f; actual derived reduction marking; contractible marked comparison fibre, without a connectivity bound on the proposed complete algebra. |
| General finite descent, §3.5 | Finite exact tensor-compatible localizations, joint conservativity and specified coherent overlap equivalences; mapping spaces, algebras, refinements and sheaves retained. |

The ordinary and derived proofs use existing completion/lifting machinery and the explicit DD/E suppliers. HCF §§0.1–0.3 still proves and supplies its specialized reflection, cyclotomic descent and coefficient lifts independently; it does not import these HR generalizations. Within the ring/cohomology family, inputs remain HC, QW.0–QW.4 and HCF I. RefinedTraceMethods and HCF II remain downstream. The already accepted generic enhanced, homotopy, conditional solid and HB arithmetic inputs remain explicit.

Compared the fix with codex4's accepted version: every pre-existing numbered subsection other than the expanded §3.5 is unchanged, all anchors survive, and all prior Lean declarations retain their signatures. This preserves Laurent/scalar restriction, ordinary/derived and spherical distinctions, denominator cofinality, full Taylor coefficient algebras, zero-algebra map direction, conditional solid hypotheses and actual arithmetic-line certificates. No mathematical correction was needed. Restored the deleted closing Lean inventory of README-only definitions, extending it to Layer 0 and the general descent datum.

## Adversarial checks

| Statement families | Instances and result |
| --- | --- |
| Markings, existence and rigidity | Split swap moves (1,0); localization at 2 is not finite; the infinite square-zero-variable ideal is locally nilpotent without a uniform exponent. The two lifts over ℤ[t] exclude arbitrary-ideal rigidity. |
| Completed objects and maps | I=0, I=B, zero algebra, nilpotent I; ℤ[1/2][[t]] contains Σtⁿ/2ⁿ, unlike ℤ[[t]][1/2]. ℤ₂→𝔽₂ is allowed; its reduced isomorphism does not make the map invertible. |
| Derived universality | Static 𝔽₂ has nonzero π₁ after derived reduction by 2; f=0 on ℤ is excluded; a unit f and the zero ring give zero. The surjective quotient tower removes lim¹ without a connectivity assumption. |
| Descent and index | Identity, repeated, disjoint and empty covers; conservative identity restrictions with zero overlap fail the overlap hypothesis. At m=6 retain four edge paths, without an invented cycle cocycle. |
| Completion and spectral tensors | Positive Laurent factors over 𝔽₂, order zero excluded; P₂=P₁²(1+q); q=−1 rejects reversed divisibility. Completed scalar extension and the full solid tower/resolution conditions survive. |
| Arithmetic and lines | Gaussian order-four and four Φ₅ factors modulo 11; cubic Frobenius at 5; prime-inverted components; zero/negative evaluators and nonlocal R=ℤ×ℤ. No coefficient action or global line is inferred from local rank one. |

## Verification

Read the public Stacks tags [04D1](https://stacks.math.columbia.edu/tag/04D1), [0ALI](https://stacks.math.columbia.edu/tag/0ALI) and [0920](https://stacks.math.columbia.edu/tag/0920), including their cited chapter pages; Q Theorem 2.9, pp.16–17; HA Proposition 7.1.3.18, p.1219; and the monoidal/algebra-limit locators. Independently checked fifteen legacy locator blocks using seed 11499; details and source receipts are in the [handoff](../handoff/REV-PKG-HabiroRings~codex5.md). The explicit solid supplier condition remains a condition.

Checked the reviewed library audit, pinned declarations and current Tau Ceti/roadmaps, including the nine newer and named Completed roadmaps. No additional duplicate target was found. AdicSpaces and DGAInfinity supplied form comparisons. README content follows the current binding shape rule, which supersedes the inherited 200 KB note; metadata is `math.NT`.

Ten Lean declarations were matched to the README. Final `lean-check` exited 0 with exactly seven `declaration uses sorry` warnings and no other warnings/errors. All six unchanged packet checks, sorry-data check, JSON/TOML parsing, local links, whitespace and intake checks passed. No remaining finding.
