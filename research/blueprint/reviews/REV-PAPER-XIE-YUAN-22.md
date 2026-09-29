# REV-PAPER-XIE-YUAN-22: review of the extraction of Xie–Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*

**Verdict: accept.** All four routes are accepted, and all 15 recorded mistakes are confirmed. The review finds no further mistakes. One note was added; nothing else changed.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #1270 (PR #4182). It has 65 items (4 library, 9 planned, 52 missing), 4 routes and 15 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: [arXiv:2108.09722v1](https://arxiv.org/abs/2108.09722), 22 August 2021, the only arXiv version, whose SHA-256 `2587e703…` matches the record. The Inventiones version (229 (2022), 607–637, [doi:10.1007/s00222-022-01112-1](https://doi.org/10.1007/s00222-022-01112-1)) is subscription-only; Crossref lists only a text-and-data-mining licence. So, like the extraction, this review is scoped to arXiv v1, and the open gap `published-version` stays open. The arXiv listing and Crossref record no correction (29 September 2026).

## 1. Items: complete

I read all 29 pages, and every numbered statement and display appears in an item locator. The proofs were checked line by line. Two steps the paper leaves implicit hold:

- **Proposition 5.4.** It replaces h*[𝒯] by the numerical class a[h*ℒ_{𝒜′}]^{dim A′}. This is legitimate, although numerical equivalence is not preserved by pullback in general. By the projection formula, h*α·[𝒴]·[ℒ_ℬ]^{e+1} = α·h_*([𝒴]·[ℒ_ℬ]^{e+1}), and that pushforward is a divisor class on 𝒜′.
- **Lemma 5.3.** Its r is unique once dim X ≥ 1. The translated sums X′_m increase strictly until they stabilize, and a torsion X_m with m < r would force dim X_{2m} = dim X_m.

## 2. Statuses: all hold

The four library citations resolve at the pins: Tau Ceti's `AbelianVariety` with `prod`, `baseChange`, `mulBy` and `IsIsogeny`, and Mathlib's `Algebra.trdeg`.

The nine planned items hold against the full stage text:

- **HeightsRationalPointsAndObstructions RP.5**: translates and stabilizers.
- **SchemeAndStackFoundations SF.5**: Chow groups and intersection products, including Serre multiplicities.
- **MotivesAndAlgebraicCycles MC.0**: numerical equivalence.
- **AbelianSchemesAndArithmeticModuli A3**: [n] "is étale precisely under the appropriate invertibility condition".
- **AbelianSchemesAndArithmeticModuli A6**: Poincaré complete reducibility.
- **NeronModelsAndSemistableAbelianVarieties R11.1**: "Compare good reduction with an abelian-scheme model".
- **NeronModelsAndSemistableAbelianVarieties R11.3**: semistable reduction after a finite extension.

Tau Ceti's 229 abelian-variety declarations contain no trace, torsion-scheme, duality or reducibility results, and neither library has function-field heights. The 52 missing items are rightly missing.

## 3. Routes: all four accepted

1. **Source → RP.0, RP.1, RP.5.** Geometric heights, the trace, quotients and Manin–Mumford. This follows PAPER-GAO-HABEGGER-19's accepted routing of function-field heights to RP.0.
2. **Source → SF.0, SF.4, SF.5.** §2's non-proper intersection theory, Bertini integrality and the pencil blow-up.
3. **Source → A1, A2.** Lemma 4.1 comes from the theorem of the cube (A1) and from polarization positivity (A2).
4. **Part II `HeightsRationalPointsAndObstructionsPartII`.** GH19, DGH21, Gao–Ge–Kühne 2026 and Yuan 2026 proposed it, and all their reviews accepted it; DESIGN-HeightsRationalPointsAndObstructionsPartII is pending. RP.5 plans Bogomolov only over number fields, so the function-field conjecture in every characteristic has no other owner. The design should carry the repairs of E1–E5.

## 4. Mistakes in the paper: 15 of 15 confirmed

Every entry was checked at its locator on the page images of arXiv v1.

- **E1** (error, the proof; Proposition 3.6, first case). The printed "if" direction fails. Take k′ ⊇ k_A, so A ∼ A₀ ⊗ K with A₀ over k′. Let C ⊂ A₀ be a curve over k′ with trivial stabilizer that generates A₀, and set X = C_K + P with P ∈ A₀(K) ∖ A₀(k′). Then Stab⁰(X) = 0 and T_X = A, but X is not special over k′, because a torsion translate of something defined over k′ would force P ∈ A₀(k′). The recorded repair, running the second case over A₀ with Corollary 3.5(ii), restores the proposition.
- **E2** (gap). Proposition 5.4 is stated for all torsion t, but the proof uses a multi-section of order prime to char K, and it needs one: 𝒯 must be smooth for Proposition 2.1. Prime-to-p torsion suffices for §5.3.
- **E3** (gap). §5.3 needs "height 0 ⇒ dense small points", the converse of Lemma 5.2. I read it in Gubler's arXiv:math/0609387v2, Corollary 4.4: "h_L(X) = 0 if and only if e₁(X, L) = 0". That is the paper's own [Gub07].
- **E4** (error, a stated result). Lemma 5.3 fails for dim X = 0, where no r exists. The lemma is only used after that case is settled.
- **E5** (gap). Lemma 3.7's "infinitely many k′" is asserted but not proved, and Proposition 3.1 needs two distinct fields. Two pencils s₁/s₀ and s₂/s₀ that are algebraically independent give distinct fields, and such pencils exist because dim S ≥ 2.
- **E6–E15** (misprints, affect nothing). Each is confirmed on the page image:
  - E6: indices and a V for X (Prop 2.4);
  - E7: f*H_i for g*H_i (Prop 2.1);
  - E8: ⊆ I for ∈ I (Cor 3.5);
  - E9: π₁ to P¹ instead of S (Lemma 3.7);
  - E10: the missing "not" (Prop 3.1);
  - E11: ℒ for ℳ (Prop 4.2);
  - E12: p₂ to B instead of C (Lemma 5.3);
  - E13: a spurious factor a (Prop 5.4);
  - E14: the missing "= 0" (Prop 5.4);
  - E15: m for π (§1.1).

**Manin–Mumford (Theorem 5.1).** I checked the citation for positive characteristic. Pink–Roessler's ICM paper (arXiv:math/0212408) is about characteristic 0. Scanlon's *Positive characteristic Manin–Mumford theorem* (arXiv:math/0303340), Theorem 2.2, covers all torsion, p-power torsion included; its reference [7] is the paper's [PR04]. With trivial trace its special subvarieties are torsion translates, so Theorem 5.1 holds as stated. A note on `manin-mumford` tells the blueprint to derive it that way.

## 5. Checks

`scripts/check_paper.py` passes. The changes are the 15 `review` verdicts, the note on `manin-mumford`, and the report's section "Corrections by the independent review".
