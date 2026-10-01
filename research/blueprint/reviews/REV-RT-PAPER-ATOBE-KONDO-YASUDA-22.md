# REV-RT-PAPER-ATOBE-KONDO-YASUDA-22

Independent verification of the red team RT-PAPER-ATOBE-KONDO-YASUDA-22 (Codex, session `codex-J6LwjP`, PR #5043) for
issue #4243.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-a71f92`, `codex-c83e7a`, `cc-442dc5`);
- its review (`cc-d67081`);
- the red team.

**Result: both findings confirmed.** Finding /1 (high) reverses the accepted review's rejection of E3.

## What I read

**The paper.** Atobe–Kondo–Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*,
Forum of Mathematics, Pi 10 (2022), e24:
- the published open-access PDF from Cambridge
  (<https://doi.org/10.1017/fmp.2022.17>), downloaded 2026-10-01, pp. 45–48;
- arXiv 2110.09070v4 (<https://arxiv.org/pdf/2110.09070v4>), SHA-256 `32326ab8…83a6c`. This equals the hash the
  extraction and its review recorded, and v4 is still the latest version.

The Cambridge file is stamped per download, so its byte hash (`be5e9a30…2b90` today) differs from the red team's and
the extraction's.

**The atlas side:**
- the extraction's E3 and E13 records with their review verdicts;
- the red-team findings, their summary and its `checked` record.

## /1 (high, error): E3 was wrongly rejected. Confirmed.

**The source.** On p. 47 the formal family lives on G′ = G_{(n−1)m}, with P′ = L′U′ and L′ ≅ G_{n−1}^m. It is

> W⁰_Ze(ulk; x) = Ψ⁻¹(u) δ_{P′}^{1/2}(l) ∏_i W⁰(l_i; x_{i,1}, …, x_{i,n−1}),

and the paper notes "(Here, we note that Ψ(u) = 1 for u ∈ U′.)". Lemma 8.10 asserts:

> The Hecke eigenspace in Ind_{N′}^{G′}(Ψ)^{K′} with Hecke eigenvalues determined by (s₁, …, s_{(n−1)m}) is spanned by
> W⁰_Ze(x) for x … such that {q^{−s_i}} = {x_{i,j}} as multisets.

**The counterexample (n = m = 2).**
- **The space.** G′ = GL₂, L′ is the diagonal torus, and N′ = U′, so Ψ is trivial on N′. The space consists of
  N′-invariant, right-K′-invariant functions. Such a function is determined by its values F(a,b) at diag(ϖ^a, ϖ^b) for
  *all* integers a, b. There is no Whittaker support condition.
- **The family.** W⁰_Ze(x₁,x₂)(diag(ϖ^a, ϖ^b)) = q^{−(a−b)/2} x₁^a x₂^b.
- **The Hecke operator.** K′diag(ϖ,1)K′ is the union of the q + 1 cosets [ϖ u; 0 1]K′ (u ∈ 𝔬/ϖ) and diag(1,ϖ)K′. With
  Ψ trivial, every u contributes the same value, so T f(a,b) = q·f(a+1,b) + f(a,b+1).
- **Two eigenfunctions.** Take x₁ = x₂ = x, F = q^{−(a−b)/2}x^{a+b} and H = (a−b)F. I checked symbolically (sympy) that:
  - T F = 2√q·x·F and T H = 2√q·x·H;
  - the central element ϖ acts on both by x²;
  - H is the t-derivative at 0 of the family at (xe^t, xe^{−t}).

  So H lies in the same eigenspace of the spherical Hecke algebra C[T₁, T₂^{±1}].
- **Independence.** H(1) = 0, while H(diag(ϖ,1)) = q^{−1/2}x ≠ 0. So H is a nonzero eigenfunction independent of F.
- **Conclusion.** The only assignment is x = (x, x), so the claimed span is one-dimensional, but the eigenspace has
  dimension at least two. Lemma 8.10 is false when parameters coincide.

**Why the accepted review went wrong.** It computed with the generic GL₂ Whittaker function, W⁰(diag(ϖ^k,1)) =
q^{−k/2}s_k(x₁,x₂). That function's nontrivial character forces w_{−1} = 0 and makes the family even in t, so both of
its arguments (no derivative, and a boundary contradiction) used a function the paper does not define in this case.

**Where the printed proof slips.** The Geometric Lemma count is right *with multiplicity*: a GL₂ principal series has a
2-dimensional Jacquet module. But the spanning set is indexed by distinct assignments.

**The fix stands as proposed:**
- record E3 as a confirmed error affecting a stated result;
- correct the extraction's verification, its embedded review, the review file and REV-PAPER-ATOBE-KONDO-YASUDA-22's E3
  record;
- keep /spherical-collision, the corrected /spherical-span, G4 and the open all-parameter repair.

E13's review withdrew the clause "then uses the flawed Lemma 8.10 argument". That clause should be restored, with this
scope: the counterexample shows that the spanning claim fails at collisions. It does not refute the direct-integral
argument in general, or the main newform theorem.

## /2 (low, missing): no `sourceVersions`. Confirmed.

The extraction has no top-level `sourceVersions`. Three of its 19 source issues (E1, E3, E19) are marked "affects: a
stated result", and §18 asks for the record as soon as a finding quotes a stated result.

The provenance exists elsewhere in the file: the source block, the continuation records, and the published and v4
hashes. So this is a bookkeeping omission, and "low" is right.

**Fix.** Copy those records into `sourceVersions` with their original dates and scope. Mark the Cambridge PDF as a
per-download-stamped file: its byte hash varies (mine differs from both earlier ones), and normalized-text hashes are the
stable identifier.

## Check

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-ATOBE-KONDO-YASUDA-22.review.json`: ok.
