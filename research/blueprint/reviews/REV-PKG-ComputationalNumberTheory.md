# Independent package review: ComputationalNumberTheory

Verdict: **needs_changes**. Reviewer: Codex (GPT-6), session
`codex-xEvWtK`, issue #7601, 2026-10-10. I did not write the package.
The review is complete; the outstanding finding below prevents acceptance.

The mathematical statements faithfully preserve the accepted plan. The package
has one blocking dependency conflict with the subsequently adopted upstream
order. I corrected the clear reader-document defects, leaving the substantive
ownership decision visible rather than replacing it with an unsupported claim.

## Required checks

1. **Upstream form: passes.** The final README is 149,978 UTF-8 bytes,
   below 200,000 bytes. Its introduction, ownership table, conventions, native
   interfaces, six layers, target statements, construction requirements, APIs,
   worked tests and bibliography follow UPSTREAM_GUIDE. I compared the form
   with current ClassFieldTheory and the relevant RealAlgebraicGeometry and
   IntegralLattices roadmaps. CN.5 states finite-data binding and replay
   requirements without introducing another mathematical carrier.
2. **Plan fidelity and admissible dependencies: fails on the ownership
   finding below.** All 108 target titles/declarations occur once; all 187 API
   names and 185 named tests occur in their target blocks and Suggested.lean.
   Each of the 61 definition/construction nodes has at least three tests.
   The target statements preserve the input exclusions, coefficient fields,
   normalizations and hypotheses. Changes from the plan remove internal
   commentary or clarify notation, without strengthening conclusions.
   The six imported-target groups, 19 supplier requests and 28 recorded gaps
   remain represented by ownership or construction requirements. However,
   preserving the old ED.3 supplier route conflicts with the binding tier rule.
3. **Own words and precise sources: passes.** The text specifies a
   mathematical development, rather than reproducing passages or summarizing
   sources section by section. Target citations give theorem/section/formula
   and printed or explicitly identified PDF pages. I downloaded the 14 public
   source versions independently; each SHA-256 matches the accepted plan.
   The independent statement checks are listed below. No source files or
   passages are submitted.
4. **No atlas process in the package: passes after correction.** Removed
   the Gram-checker's handoff-provenance sentence and replaced its coverage
   wording by enumeration completeness. Removed the CG13 bibliography's
   review-process remark, retaining the exact preprint version/date. Replaced
   “accepted” in the FF.3 import description by the actual supplier contract.
   Fixed eleven doubled full stops in elementary prerequisite paragraphs.
   A final package scan found no packet/job/review/checkpoint/handoff or
   coverage vocabulary. Mathematical certificate acceptance remains.
5. **Suggested Lean: passes.** The required
   `lean-check research/blueprint/packages/ComputationalNumberTheory/Suggested.lean`
   exited 0, with exactly 449 warnings, all `declaration uses sorry`, and no
   errors or other warnings. The pins were Mathlib
   `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
   `f790474821cf4256814db967cb154e7af3d0c369`. All 185 examples are present.
   Structures and theorem statements agree with the README; the file clearly
   distinguishes its semantic/admitted signatures from the finite verifier
   and termination proofs required by the README. It has no dummy admitted
   proposition definitions. The Lean file was unchanged by this review;
   its SHA-256 is
   `5fc958b46db305b0e8881b69c26df18ea1f1fea8cd32ba7e94cb165364c490c9`.
6. **Metadata: passes.** The file is exactly `topic = "math.NT"` followed
   by a newline, 18 bytes. This fits the mathematical subject.

## Blocking finding: ED.3 is an upward input

WORKERS.md, “Upstream tiers”, permits a package to cite only native libraries,
its own layers, its bundle, and lower-tier packages. The order in
`research/blueprint/upstream/CaraianiNewton.md` places ComputationalNumberTheory
in the tier-15 bundle with ColemanIntegration and DirichletPadicLFunctions,
and EffectiveDiophantineMethods in tier 17.

The README's ownership table and CN.3 construction requirements nevertheless
make **EffectiveDiophantineMethods, ED.3** the supplier of finite local-image
and saturation algorithms, including soundness, completeness and termination.
This agrees with the older accepted plan and the
`ED.3 → CN.3` edge in `RS-03.result.json`, but does not satisfy the newer
package ordering rule. ED.0 in the consumers paragraph is a downstream use,
not the problematic input.

I inspected current EllipticCurves Layers 6–7 and their Suggested.lean, and
current Tau Ceti's MordellWeil/LocalCondition.lean. They supply the intrinsic
local conditions and descent framework. In particular,
`WeierstrassCurve.Affine.localCondition` is the inverse image of the local
`μ`-image under `localRes`; `mem_localCondition_iff` states that binding.
Those declarations are not an algorithm returning a complete finite local
image, and I found no native replacement for the advertised saturation
service. Naming this framework in place of ED.3 would silently drop the
algorithmic requirements.

**Required correction:** place the missing finite algorithms below their
CN.3 consumer, as WORKERS requires. Specify their exact domains, output
certificates, soundness/completeness/termination, APIs, tests and source
locators in CN.3, or import an established lower-tier owner with those precise
contracts. Preserve the existing upstream elliptic carriers and foundations.
Record the ownership move so the ED.3 plan can consume the new supplier and
its old forwarding edge can be reconciled. Replacing the name alone, or
removing the requirements, would not resolve the finding.

This change needs mathematical target decomposition and coordination of the
older accepted route. It is not a clear editorial correction; foreign packets
and link maps are outside this review's authorized files. I have therefore
left the two occurrences intact and recorded `needs_changes`.

## Independent mathematical checks

Fresh source checks included:

- Shoup, Theorem 10.3, pp.309–310: the strong-liar bound and its prime-power/CRT
  cases. Chapter 21, Figure 21.1 and Theorems 21.2–21.4, pp.550–551:
  the AKS search bound and the stated RAM cost. The package retains the
  separate RAM-to-bit simulation obligation.
- Stein, Algorithm 2.18 and Lemma 2.20, pp.19–21; Theorem 9.18,
  pp.171–172: normalized integral Miller bases and the congruence Sturm
  theorem. Characteristic-zero Sturm equality is a distinct native import.
- Stevenhagen, Proposition 9.3 and the preceding Frobenius computation,
  p.235: multiplier improvement and the dimension-dependent nilpotence
  bound. The package does not infer a finite-field kernel algorithm from
  integer HNF/SNF or use the source's reversed radical-power sentence.
- Guàrdia–Montes–Nart, Definition 1.6, p.7, Theorems 1.15 and 1.19,
  pp.11–14, and Corollary 1.20, pp.14–15: the polygon/residual distinction
  and the exponent-one irreducibility condition. Repeated residual factors
  remain a refinement obligation.
- Caruso, Definition 2.1.2, Proposition 2.1.3 and Equation (2.5),
  pp.II–17–II–19: addition precision, multiplication's minimum of two
  valuation-shifted precisions, and inversion's loss of twice the valuation.
- BCG, §2.3, pp.513–515, and Remark 3.3, p.518;
  Citro–Ghitza §§6–7, pp.11–12 and appendix p.14: the coefficient at 107,
  common companion eigensystems and the ordinary/nonordinary lists.
  The twist is exponent 81 at weight 82; the excluded weights 52 and 100
  at prime 151 have gcd 3.
- Chenevier–Lannes, French preprint Proposition 3.17 and numerical comments,
  pp.304–307; Chenevier–Taïbi, §2.4.3, pp.280–282 and Proposition 4.4,
  pp.298–299: the eight scalar formulas, Fourier normalization and tails.
  The G formulas themselves have no GRH hypothesis; the automorphic
  positivity application has a separate conditional supplier contract.
- Théry, Theorems 6.1–6.2, p.9: partial-factor Pocklington data. The package
  uses `F² > N`, retaining the mathematically necessary square omitted in
  the source's second theorem statement.
- Platt, Theorems 7.1–7.2, pp.14–15, and Bennett–Siksek §7, p.376:
  the finite conductor/height ranges and their use for real-zero exclusions.
  The height split is by modulus parity, and central nonvanishing is a
  separate finite computation.

I independently computed the coefficient of ΔE₄²E₆ at 107 as
35830422465487817813321292, with residue −1 modulo 107. Exact truncated
q-series and integral triangular basis elimination gave the weight-38
T₇₉ matrix modulo 79 as `[[3,17],[25,10]]`, whose determinant is zero.
I also checked all six ordinary-list gcds, both excluded prime-151 gcds,
signed interval multiplication/inversion, outward dyadic rounding,
unique-integer boundary cases, negative-denominator RAM division, the
negative-valuation p-adic multiplication example, and the Gram multiplicity
identity on an exact rational two-block example. These are independent spot
checks, not a replay of the complete finite datasets or Lean proofs.

I read the library audit and inspected the 33 cited pinned declaration
statements, including Lucas/converse, native factor lists, regulator index,
p-adic truncation, Frobenius/radical, Minkowski ideal representatives, modular
recurrence/Sturm, continuation and functional equations. Current upstream
RealAlgebraicGeometry owns Sturm–Tarski, subresultants and multiplicity-sensitive
root matching; the package imports these and adds finite rational certificates.
Current IntegralLattices/EffectiveBounds and the current library do not turn
LLL into the required complete ellipsoid enumeration. The GN.5, finite-field
kernel-basis and intrinsic CT comparison obligations remain explicit.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/ComputationalNumberTheory.json`:
  zero errors and warnings; 108 nodes, 187 API entries and 185 tests. The
  accepted plan was not edited.
- Target/API/test/source-name inventory, public-source hashes, metadata,
  size and package process-language checks: pass.
- Required `lean-check`: exit 0, 449 sorry warnings only.
- `python3 research/blueprint/intake.py check-files` on all four changed
  deliverables: zero problems. `git diff --check`: passes.
- Complete CT, Platt and companion datasets were not replayed. Root-count
  algorithms, certified special-function evaluation and discovery costs remain
  specified development tasks, not implemented results.

Acceptance requires resolving the ED.3 tier conflict and reviewing the resulting
mathematical supplier contracts. This report completes #7601's independent
review; it is not a checkpoint or an implementation certificate.
