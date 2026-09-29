# RT-AUDIT-16: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4011, job FIX-RT-AUDIT-16).
- **Findings and verdicts.** `RT-AUDIT-16.result.json` and `RT-AUDIT-16.review.json`. The red team made 3 findings, all of high severity. The review confirmed all 3 and rejected none.
- **Scope.** This job covers the 3 confirmed high-severity findings: /1, /2, /3. There are no medium or low findings.
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-16.result.json`; no other file changes. The audit's `review` object, every layer verdict and every target `library` value are unchanged: each finding corrects a hypothesis in a target statement and asks that the classification be kept. No citation is added or removed, and no duplicate is added.

**Verification.**
- Each correction was checked against the pinned sources (Mathlib 082e2d3 / Tau Ceti f790474) and the source roadmaps at the stated lines.
- The declarations newly named in notes, `TauCeti.DenseGraphLimits.finiteGraphGraphon` (StepGraphon/FiniteGraph/Basic.lean:89), `TauCeti.cuspFormsOld` (Newforms/Basic.lean:103) and `TauCeti.cuspFormsOld_one` (:148), were read at those lines and resolve in the pinned `declarations.tsv` under those full names.

## RT-AUDIT-16/1 (high, error): Construction A odd-modulus obstruction (AlgebraicCodingTheory layer 6)

**Target "Unimodular iff C = C^perp; …"** (now "For m >= 2 and self-orthogonal C …").
- "q_m and even iff q_m vanishes on C; odd m never even" is replaced by: for even m, the lift-independent q_m and "even iff q_m vanishes on C"; for odd m and a nonempty coordinate type, never even (m e_i has norm m); for empty coordinates, the zero lattice P_m(C) = {0} is even.
- Following the review, the target also keeps the context of the standing conventions visible: m ≥ 2, and C self-orthogonal so that P_m(C) is integral.
- The source roadmap already states both restrictions (AlgebraicCodingTheory README, the q_m and odd-m bullet of Layer 6), so no roadmap change is needed.

**Kept.** The note and the three related gluing citations are unchanged. As the review says, those citations are not evidence that Construction A is implemented. The target stays `absent`, and the layer stays `not built`.

## RT-AUDIT-16/2 (high, error): finite-graph compatibility needs a nonempty host (DenseGraphLimits layer 1)

**Target "homDensity t(F,W) with t in [0,1], …".**
- The formula now reads "t(F, W_G) = hom(F,G)/|V(G)|^{|V(F)|} for |V(G)| > 0".
- The note now records that `homDensity_finiteGraphGraphon` takes `hm : 0 < m` while `finiteGraphGraphon` (FiniteGraph/Basic.lean:89) is defined at every host size. It also records the exception the review describes: for the empty host and a nonempty edgeless pattern, the graphon density is 1 but the finite density is 0/0 = 0. The empty pattern gives 1 on both sides, so it is not an exception.

**Kept.** The citation of `homDensity_finiteGraphGraphon` (Basic.lean:205, exact) is unchanged. The target stays `tauceti`, and the layer stays `built`.

## RT-AUDIT-16/3 (high, error): the fixed-character oldspace sum omits M ≠ N (ModularForms layer 3)

**Target "Fixed-character refinement with exact indexing …".**
- The sum now runs over "M | N with M != N and cond chi | M and d | N/M". The descended characters χ_M and V_d are unchanged.
- The note now says that the sum is over proper divisors, as in the proved definition `cuspFormsOld` (Newforms/Basic.lean:103), which requires d·M | N and M ≠ N. It also gives the reason: the term M = N, d = 1 would be all of S_k(N, χ), and `cuspFormsOld_one` (:148) proves that the level-one oldspace is zero although S_12(SL₂(ℤ)) is nonzero.

**Kept.** The four citations are unchanged. As the review says, the target stays `partial`: Newforms/Nebentypus.lean proves the relative orthogonal complement and the character decomposition, but not the conductor-indexed sum. The layer stays `partly built`.

**Maintainer note (PROTOCOL.md section 15; not applied here).** The same omission is upstream and should be patched as documentation only. The existing Tau Ceti owner and the proved `cuspFormsOld` stay as they are, and nothing is replanned.
- `content/tau-ceti/ModularForms/README.md:509`, the displayed fixed-character formula: add M ≠ N, or equivalently M < N with M | N and N > 0, to `Σ_{M ∣ N, cond χ ∣ M} Σ_{d ∣ N/M} V_d S_k(M, χ_M)`. The preceding bullet already says "proper divisors".
- The module docstring of `TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean` (lines 35–38 at f790474) repeats the same formula as the unproved roadmap statement. It needs the same restriction when that file is next edited. The pinned library code is not changed by this job, and its proved definition is correct.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-16.result.json`: 0 problems. The file parses, and every target has at most five declarations.
- The edit script asserted that each substitution matched exactly once, and that the `review` object, all layer verdicts and all target `library` values were unchanged.
- `git diff --stat`: only `AUDIT-16.result.json` (5 lines changed: three targets and two notes), plus this new report.
- No Lean file is involved, so nothing was compiled.
