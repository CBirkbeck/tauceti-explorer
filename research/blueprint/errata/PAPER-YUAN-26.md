# Mistakes in Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*

Job ERRATA-PAPER-YUAN-26. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-YUAN-26.json` beside this file. Reviewed by `REV-ERRATA-PAPER-YUAN-26` (issue #1763), Claude Code session `cc-7b31c4`, 23 September 2026: **all four confirmed**, none rejected, amended or added; the manuscript was re-fetched and reproduces the recorded SHA-256, and every quotation was found verbatim in it. The review is written up in [REV-ERRATA-PAPER-YUAN-26.md](../reviews/REV-ERRATA-PAPER-YUAN-26.md).

**Paper and version read.** Xinyi Yuan, Annals of Mathematics 203 (2026), 15–119, DOI 10.4007/annals.2026.203.1.2. The version read is the author manuscript of 21 August 2024, which is the journal's revision date. It is linked from the author's page (126 pages, SHA-256 `b36f4860…813e`, as the extraction records). Every passage below was re-read there. The final typeset text was not accessible.

**Earlier work.** The extraction PAPER-YUAN-26 (Codex, `codex-c83e7a`, continued by ChatGPT, `astra-ao-9c47e2`) is partial. It noted these mistakes in its items and in its report (§§5 and 8). It also checked the Theorem 4.19 statement against arXiv v4.

**Existing corrections.** None was found:
- the Annals article page links no erratum;
- arXiv 2108.05625 has v1–v4, all earlier than the manuscript read;
- the author's page lists no correction;
- a web search found nothing.

**Effect on the main results.** The uniform Bogomolov-type theorem (Theorem 1.1) and the bigness theorems (Theorems 1.2 and 1.3) are unaffected. The substantive finding, E1, concerns the function-field half of the relative Bogomolov examples in §4.6.4.

---

## E1. Theorem 4.19 over function fields needs non-isotriviality (error; a stated result)

**What the paper says.** Theorem 4.19 applies to K "either a number field or a function field of one variable", S a quasi-projective K-variety, and X → S a smooth genus-g curve "with maximal variation". It states that several morphisms, such as i_α^m : X^m/S → J^m/S for m ≥ dim S + 1, satisfy the relative Bogomolov conjecture: points of small canonical height are not Zariski dense. By the definition in §1.6, maximal variation means that the moduli morphism S → M_{g,K} is generically finite.

**Why it fails over function fields.**
- Take k algebraically closed of characteristic 0, K = k(t), S = Spec K, X = C₀ ×_k K for a smooth projective curve C₀/k of genus g > 1, and α of degree 1.
- The moduli morphism Spec K → M_{g,K} is a single point, hence generically finite, so the hypothesis holds.
- But every point of C₀(k) has canonical height 0 in the constant Jacobian, and these points are Zariski dense in X.
- So part (1) fails for m = 1 = dim S + 1, and constant products give the analogous failures for the other parts.

The proof itself notes the problem: "we need the bigness of the adelic line bundles over k instead of over K". A constant family, spread out over a model over k, has constant moduli map and no such bigness.

**Correction.** Over a function field K/k, assume maximal variation of a model over k, which excludes isotrivial families. Equivalently, assume the bigness over k that the proof uses. For number fields the statement stands. The main theorem, which excludes isotrivial families, is not affected.

## E2. The relative Bogomolov conjecture stated for function fields without excluding constant parts (error; affects nothing)

§4.6.3 lets K be a number field or a function field of one variable over k. It then "recalls" the relative Bogomolov conjecture of Dimitrov–Gao–Habegger: for an abelian scheme A → S and Y → A generically finite, with Y generating A generically and dim Y < g, the points of height at most ε are not Zariski dense for some ε > 0.

Over function fields this is false for constant data. If A = A₀ ×_k S and Y is a constant subvariety generating it, such as a constant curve of genus > 1 in its Jacobian, then the constant points have height 0 and are dense. Dimitrov–Gao–Habegger state the conjecture over number fields. The function-field version needs the usual exclusion of the constant part, for instance trivial trace.

Nothing in the paper depends on the conjecture itself. Its claimed function-field instances are E1.

## E3. A missing degree in the admissible Green equation (misprint; affects nothing)

In §A.1, a metric on a line bundle L is admissible when c₁(L, ‖·‖) = deg(L) dµ_Ar. The text then says that admissibility of ‖1‖ = exp(−g_D) on O(D) "is equivalent to (i/π)∂∂̄ g_D = dµ_Ar − δ_D". Since c₁(O(D), exp(−g_D)) = (i/π)∂∂̄ g_D + δ_D, the equation should read (i/π)∂∂̄ g_D = deg(D) dµ_Ar − δ_D. The printed version is the case of degree one, such as a point, which is how it is mostly used.

## E4. The definition of stable curves ignores self-nodes (error; affects nothing)

§1.6 calls a semistable curve of arithmetic genus g > 1 stable if "any rational irreducible component of C_k̄ intersects other irreducible components at three or more points". The standard (Deligne–Mumford) condition counts special points on the normalization, with both branches of a self-node counted. A rational curve with one node, attached at one point to a smooth curve of genus one, is a stable curve of genus 2. Yet its nodal rational component meets the other component only once, so the printed definition would call it unstable.

The paper relies on stable reduction and the moduli of stable curves from the literature, so the intended standard notion is clear, and no argument uses the narrower one.

## Not recorded

- **Finite-extension normalizations.** The formulas on p. 49 and in §A.5 (p. 116), which divide by the field degree after a finite extension, depend on conventions for weighted intersection degrees. The extraction left them as open normalization checks rather than mistakes (items 94 and 225), and this job did not settle them.
- **The genus-one case of Theorem A.1(2), p. 113.** With L = ω_C the integral in question is trivially constant, so no mistake was established.
- **The small-point deduction in §4.6.3.** Deducing non-density of {ĥ ≤ ε} from the height inequality of [YZ2, Thm. 5.3.5(1)] needs a positive margin. It is obtained in one line by adding a bundle of constant positive height, so this is not recorded as a gap.
- **Mistakes in cited sources.** The paper itself notes (p. 85) that the proof of Wilms's [Wil2, Cor. 1.4] is incomplete, because [Wil2, Cor. 1.2] does not cover all degeneration types. That is a mistake in Wilms's paper, corrected in print here; it belongs to that source's record.
