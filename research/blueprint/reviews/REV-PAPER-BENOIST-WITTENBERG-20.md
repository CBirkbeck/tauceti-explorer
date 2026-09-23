# REV-PAPER-BENOIST-WITTENBERG-20 — review of the extraction of Benoist–Wittenberg, *On the integral Hodge conjecture for real varieties, I*

**Verdict: accept. All seven routes accepted, coverage effectively complete, all ten recorded mistakes confirmed, nothing corrected in place and nothing added.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: issue #1296 — 193 items (7 library, 9 planned, 177 missing), 7 routes, 10 `sourceIssues`, status `complete`. The paper job carries `/claim` comments from `codex-a71f92`, `cc-7b31c4`, `codex-c83e7a` and `cc-442dc5`; **`cc-fb70e5` is not among them.**

Source: Inventiones mathematicae **222** (2020), 1–77, [doi:10.1007/s00222-020-00965-8](https://doi.org/10.1007/s00222-020-00965-8), read in the author-hosted published PDF.

## Provenance

The recorded `daeb43ec…` matches byte for byte. **77 pages** — taken from the linearization dictionary's `/N`, because this file's page tree sits in a compressed object stream and a `/Count` scan returns nothing; counting `/Type /Page` happens to agree here, but the `/N` is the authority.

I also fetched arXiv v3 for comparison (`25d11f43…`): a tar giving `partie_1.tex` (4856 lines), `partie_1.bbl`, and — a nice touch — `partie_2.aux`, the companion Part II's auxiliary file, shipped so that forward cross-references resolve.

## 1. The version discipline, which is the thing to record about this extraction

The extraction states that it read the author-hosted published version "with Inventiones pagination and DOI; **not** the 67-page revised preprint linked on Wittenberg's homepage". That sentence is doing real work.

Simulating the **arXiv v3** numbering — a standard `\newtheorem{thm}{Theorem}[section]` with thirteen environments sharing the counter — gives 83 statements with sections ending at 1.3, 2.22, 3.16, 4.23, 5.9, 6.10. Checked against the findings' locators, that looks like carnage: **Theorem 3.16** comes out a Question, **Lemma 2.14** a Proposition, **Example 4.4** a Lemma, **Lemma 3.4** a Remarks, and **Remarks 5.10 does not exist at all**, since §5 of the preprint ends at 5.9.

Every one of those locators is correct in the published text:

| locator | published text |
|---|---|
| Theorem 3.16 | **Theorem 3.16**, p. 55, with hypotheses `dim(X)>0`, `H²(X,O_X)=0`, RIHC for 1-cycles |
| Lemma 2.14 | **Lemma** 2.14 |
| Proposition 2.15 | **Proposition** 2.15 |
| Lemma 3.4 | **Lemma** 3.4 |
| Example 4.4 | **Example 4.4** "(with no real point) Let ζ be a primitive eighth root of unity" |
| Remarks 5.10(i) | **Remark 5.10(i)**, cross-referenced from the introduction |

**A reviewer who compared the preprint against the findings would have filed six false accusations.** Worth recording as a method note: when an extraction names its version, check that version.

(A smaller trap in the same family: a naive scan for "Corollary 4.4" finds one, but it is a **citation into another book** — "[…, Chapter IV, Corollary 4.4 …]" — not a statement of this paper.)

## 2. Coverage

**All 193 items carry a numbered locator**; none falls back on a section-level one.

A precise statement total cannot honestly be extracted from this PDF's text layer: it glues page and equation numbers onto statement names, so that "Lemma 1.5" followed by equation (1.43) reads back as "Lemma 1.43", and "Lemma 1.5" with the decomposition reference (1.26) reads as "Lemma 1.51". Both of those apparent statements are artefacts. Of the statement numbers that do resolve cleanly, the only genuinely uncited one is **Remark 2.7**. No substantive gap.

## 3. Statuses — twelve declarations, all verified

The library evidence lives in **`libraryAudit.actualDeclarationsRead`**, not in `baseline.declarations` — a thinner record than some extractions in this corpus keep, since it gives names, with a module and line range for only one item. It is nonetheless accurate:

- **Mathlib (10)**: `IsRealClosed` (`FieldTheory/IsRealClosed/Basic.lean:48`); `DerivedCategory`, `.Q`, `HasDerivedCategory` (`Algebra/Homology/DerivedCategory/Basic.lean:87/95/74`); `CategoryTheory.Sheaf.H` and `.equiv₀` (`CategoryTheory/Sites/SheafCohomology/Basic.lean:105/124`); `AlgebraicGeometry.AlgebraicCycle` (`AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`); `Rep.FiniteCyclicGroup.groupCohomologyIso₀`/`IsoEven`/`IsoOdd` (`RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:72/80/113`); `groupCohomology.coindIso` (`RepresentationTheory/Coinduced.lean:230`).
- **Tau Ceti (2)**: `HodgeStructureOn` and `HodgeStructure` at `TauCeti/Geometry/Hodge/Structure.lean:62` and `:75`, at the pinned `f790474`.
- The one detailed citation is **exact**: `Complex.normSq_eq_conj_mul_self` and `normSq_nonneg` at lines **544** and **554** of `Mathlib/Basic/Complex/Basic.lean`, inside the recorded range 544–555. That path looks wrong at a glance — there was no `Mathlib/Basic/` for years — but it is real in current Mathlib.

Two near-misses were my own tooling, recorded so the next reviewer does not repeat them: a `\b`-anchored grep fails after a subscript character, so `groupCohomologyIso₀` looked absent when it is at line 72; and truncating the Hodge file list dropped `Structure.lean`, so both Tau Ceti declarations looked absent when they are its first two declarations.

## 4. Routes — seven, all sound

Every stage id exists (SF.2, SF.5, MC.0, MC.2, MC.7). The shape looks unusual — two source routes into `SchemeAndStackFoundations` and three into `MotivesAndAlgebraicCycles` — but **several routes into one roadmap, split by stage, is the corpus convention**: 55 papers do it. The largest, MC.7 with 67 items, is the complex-side integral Hodge conjecture that this paper transposes, and keeping it in the parent rather than the new Part IIs is what separates what the paper imports from what it proves.

Both Part IIs are **joined proposals** with **PAPER-BENOIST-19** (*The period-index problem for real surfaces*), which proposes `EquivariantTopologyRealVarieties` (29 items) under the same parent `tauceti:TauCetiRoadmap/AlgebraicTopology` and `QuadraticFormsRealFunctionFields` (14 items) under `tauceti:TauCetiRoadmap/QuadraticFormInvariants`; the latter is also proposed by PAPER-JANNSEN-16. Both briefs say so outright — "Coalesce this proposal with the same ID from PAPER-BENOIST-19; it is not a second owner" — and both titles reproduce the parent's exactly before the colon, as PROTOCOL §15 requires.

(Method note: a glob that skips files matching `BENOIST` hides PAPER-BENOIST-19. That is how I first concluded the topology Part II was solo.)

## 5. Findings — ten confirmed, and one of them is a counterexample to a published theorem

**E1 is the significant one, and it holds.** Theorem 3.16(ii) is printed as an *if and only if*:

> "Assume that `dim(X)>0`, that `H²(X,O_X)=0` and that X satisfies the real integral Hodge conjecture for 1-cycles. … (ii) There exists a geometrically irreducible curve of even geometric genus in X **if and only if** the natural map `Pic(X)[2^∞] → Pic(X_ℂ)^G[2^∞]` is onto."

Take `X = E : y² = x³ − x` over ℝ. Every hypothesis holds: `dim X = 1 > 0`; `H² = 0` on a curve; and the real integral Hodge conjecture for 1-cycles is here the codimension-zero case, trivial because `H⁰_G(X(ℂ),ℤ(0)) = ℤ` is generated by the class of `[X]`. The **right-hand side holds** — the real point kills the Brauer obstruction in Hochschild–Serre, so `Pic(X) → Pic(X_ℂ)^G` is onto. The **left-hand side fails** — the only one-dimensional integral closed subscheme of a curve is the curve itself, and `E` has geometric genus 1, which is odd. So the "if" direction is false as printed, and the hypothesis must be `dim(X) ≥ 2` whenever `X(ℝ) ≠ ∅`. The introduction's **Theorem A** inherits it through `d ≥ 1`. The finding is also right that part (i) is untouched, and that Proposition 3.9 — which the proof of (ii) invokes — is where dimension at least two is actually used.

**E3** refutes a published construction. In Example 4.4, with `T(Q)(x) = conj(Q(f(x)))`, the weight-4 space `Λ₂` has basis `x₀x₄, x₁x₅, x₂², x₃²`, and `T` acts by `a ↦ −b, b ↦ a, c ↦ −d, d ↦ c`, so `T² = −id` and **no complex line is T-stable** — rescaling `T` cannot change that sign. An `f`-stable smooth complete intersection of four quadrics in `P⁶` has quadratic ideal exactly the span of `Q₀,…,Q₃`, whose weight-4 intersection is the line `ℂ·Q₂`, and stability would force `T(Q₂) ∈ ℂ·Q₂`. So the asserted Zariski-dense stable set cannot meet the asserted non-empty smooth locus. Correctly scoped: it refutes this construction, leaving the intended real-empty-surface consequence unproved rather than false.

**E10** is correctly a gap: Remarks 5.10(i) and (ii) state two `CH₁(X)` computations while describing them as obtained "at the price of a significantly more involved computation" and "we have verified", without giving them. Remark 5.10(i) is cross-referenced from the introduction, so the results are used rhetorically, but nothing else depends on them.

The seven misprints are confirmed verbatim: a missing minus sign in `δ = ι*(γ − π*α)` (E4); `k ≥ 0 be even` where both assertions fail at `k = 0` (E2); `φ = ψ∘cl : Pic(X) → M` where the domain outside the surface case is `CH₁(X)` (E7); `H^{2k}_G(P^k(ℝ),ℤ(k))₀` writing the **real** points inside an equivariant group, against the paper's own `H^*_G(X(ℂ),·)` convention (E8); "of those classes in `H^{2k}(X(ℂ),ℤ(k))`" for a subgroup of the **G**-equivariant group, in the sentence right after the cycle-class display (E9); `ψ` for `ψ′` in Lemma 3.4's proof, where the paper elsewhere keeps the two apart and `ψ′` is the map into `M*` (E6); and the final §1.2.6 push-forward printed with source `H^p(X(ℝ),ℤ/2ℤ)` for a map along `f : Y → X`, whose source must be `H^p(Y(ℝ))` (E5).

On E5 I confirmed the source and record that I could **not** read the target's exponent reliably from the text layer — it extracts as `p+c` where the entry says `p−c` — rather than claim it either way.

## What I did not do

I did not re-derive the paper's equivariant machinery, and my confirmation of E1 rests on checking the printed statement, its hypotheses, and each step of the proposed counterexample, not on refereeing §3 as a whole. Statement-level quotations from the published PDF are reconstructions from a pure-Python text extractor; where a point could be settled in the arXiv TeX and the two versions agree on the text in question, I settled it there and say so.
