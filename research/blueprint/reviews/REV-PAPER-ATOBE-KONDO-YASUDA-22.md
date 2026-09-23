# REV-PAPER-ATOBE-KONDO-YASUDA-22 — review of the extraction of Atobe–Kondo–Yasuda, "Local newforms for the general linear groups"

Job: #1396. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-ATOBE-KONDO-YASUDA-22.result.json`,
by session cc-442dc5, continuing codex-c83e7a.

**Verdict: accept.** No item, status or route changed. One recorded mistake is rejected,
two are amended, and the source block's provenance is corrected.

## What I read

H. Atobe, S. Kondo and S. Yasuda, *Local newforms for the general linear groups over a
non-archimedean local field*, Forum of Mathematics, Pi **10** (2022), e24, 1–56;
doi:10.1017/fmp.2022.17. Open access, all 56 pages. Published page = PDF page.

arXiv 2110.09070v4 was re-fetched and hashes to
`32326ab828c5cfb524cfb479e337fdd9834496cd9ec39409266c281c49883a6c`, matching the record
byte for byte.

## A provenance problem: the published hash cannot verify anything

The source block records a `sha256` for the published PDF. **It is not reproducible.**
Cambridge stamps each download: every page carries a line reading

> Downloaded from https://www.cambridge.org/core. IP address: …, on 23 Sep 2026 at
> 19:05:16, subject to the Cambridge Core terms of use …

and the PDF's `ModDate` is set at download time. I downloaded the article twice, eleven
seconds apart, and got two different hashes — `6aa1948f…fe41` and `786e7ce8…d0d3` —
differing *only* in that timestamp.

So the recorded hash certifies nothing beyond that one worker's one download. I recorded
this in `source.sha256Note`, and added a hash that **is** reproducible:
`publishedTextSha256 = c8beb4ee6815fcaff9c98e6762037519177fdd2820cddd538df98ce525fa1866`,
the SHA-256 of `pdftotext -layout` output with the stamp lines stripped, obtained
identically from both downloads. The `arxivSha256` remains the primary verifiable anchor.

## The rejected mistake

**E3 is rejected.** It claims to disprove Lemma 8.10 by exhibiting, for `n = m = 2` with
equal Satake parameters `(x,x)`, a second Hecke eigenfunction

    H(g) = (a−b)·q^{−(a−b)/2}·x^{a+b},   g = n·diag(ϖ^a, ϖ^b)·k.

It is not an eigenfunction. Write `k = a−b` and let `c_k` be the coefficient of
`q^{−k/2}x^{a+b}`. The spherical Hecke recursion is
`s_{k+1} = (x_1+x_2)s_k − x_1x_2 s_{k−1}`, which at `x_1 = x_2 = x` reads

    c_{k+1} = 2c_k − c_{k−1}.

I checked exactly that **both** `c_k = k+1` (the true Whittaker function,
`s_k(x,x) = (k+1)x^k`) and `c_k = k` (the candidate) satisfy this for `k ≥ 1`. They are the
two solutions of the same three-term recursion. What separates them is the **boundary**:
the Whittaker support condition forces `w_{−1} = 0`, and then `k = 0` gives
`q^{1/2}w_1 = λw_0 − x²w_{−1} = 0` whenever `w_0 = 0`, *for every eigenvalue λ*. The
candidate has `h_0 = 0` but `h_1 = q^{−1/2}x ≠ 0`. It extends to a solution of the
recursion only with `h_{−1} = −1/x ≠ 0` — precisely the solution the support condition
excludes, which is the standard reason the eigenspace is one-dimensional, exactly as
Lemma 8.10 asserts.

The finding's other route fails too. It proposes differentiating
`W^0(xe^t, xe^{−t})` at `t = 0`. But `s_k(xe^t, xe^{−t}) = x^k Σ_{j=0}^{k} e^{(2j−k)t}` is
invariant under `j ↦ k−j`, hence **even** in `t`, so the derivative at `0` is zero and
produces nothing.

The finding's separate aside — that the Geometric Lemma's multiplicities are miscounted when
parameters collide — is *not* assessed here and is not confirmed. If it is to be recorded it
needs its own statement and its own evidence, because the counterexample offered for it does
not exist.

## Two findings amended

- **E13's reason** appealed to "the flawed Lemma 8.10 argument". With E3 rejected, that
  clause is withdrawn; the finding now stands on its direct-integral point alone, which I
  confirm.
- **E19's correction** asserted flatly that "the uniqueness itself is false (E1)". Softened.
  E1's second solution rests on a Lapid–Mao construction this review did not verify, and an
  assertion that a published theorem is *false* must meet a higher bar than an assertion
  that its printed proof has a gap. E19's own `reason` field had already taken the careful
  line — recording that no counterexample to Theorem 2.1 is known — so the correction now
  matches it.

## What is confirmed about E1 and E19

Read on the page image, p. 50 prints:

> then `φ_Ze(u′g′) = Ψ(u′)φ_Ze(g′)` for `u′ ∈ N′` and `g′ ∈ G′`. Therefore, we have
> `W ∘ ι ∈ Π`.

Its only stated justification is the preceding clause: that `ι(G′)` normalises `V″` and
that the action of `ι(N′)` on `V″` preserves the invariant measure. **Measure-invariance is
not Ψ-equivariance**, and I verified by direct computation that `Ψ` is genuinely not
preserved. Since `E₁₃E₃₂ = E₁₂`,

    (1+tE₁₃)(1+bE₃₂)(1−tE₁₃) = 1 + bE₃₂ + tbE₁₂   (exactly),

so conjugating the `V″`-element `1+bE₃₂` by `ι(u′) = 1+tE₁₃` changes `Ψ(g) = ψ(g₁₂+g₃₄)` by
`ψ(tb)`.

Corollary 9.4, Propositions 9.5 and 9.6 and the uniqueness in Theorem 9.1 all run through
that one step, so for `σ = Sp(π,m)` with `L(s,π) = 1` and `n, m ≥ 2` the printed §9 argument
does not establish Theorem 2.1. **That is a statement about the proof.** Whether uniqueness
itself fails is not established here.

Worth recording, as the extraction notes: were the step valid, every `W∘ι` would be left
`N′`-invariant and square-integrable on `GL₂` by Theorem 8.2, hence zero — contradicting the
paper's own existence proof on p. 49, which uses [20, Cor. 3.15] to produce a nonzero such
vector.

## E2, confirmed more strongly than recorded

Page 38 prints "Observe that the intersection `G_n ∩ ⋂_{m≥1} Z_n X_λ^{≥m}` is empty."
Page 37 defines `X_λ ⊂ M_n(o)` by `a_{i,j} ≡ δ_{i,j} mod p^{λ_i}`. **For `λ = 0` that
congruence is modulo `p⁰ = o` and so is vacuous, giving `X_0 = M_n(o)`.** Then for any
`g ∈ G_n` and any `m`, taking `N` large makes `ϖ^N g` integral with
`det(ϖ^N g) = ϖ^{Nn} det g ∈ p^m`, so

    g = ϖ^{−N}·(ϖ^N g) ∈ Z_n X_0^{≥m}.

The intersection is therefore all of `G_n` — for **every** `n`, not only `n = 1` as the
finding says. The counterexample to the lemma stands too: for `n = 1`, `λ = 0` and `π` an
unramified character (cuspidal, there being no proper parabolic in `GL₁`), `1_{ϖo^×} ∈ a_0`
acts on the one-dimensional `V^{K_{1,0}}` by `π(ϖ) ≠ 0`, which is not nilpotent. The
extraction is right that Theorem 2.2 survives: in the ambient `L(s,π) = 1` application `π`
is ramified, so `V^{K_{n,0}} = 0` and `a_{0,V} = 0` trivially.

## The other confirmations

| id | how confirmed |
|----|---------------|
| E5 | the paper defines `h` with `Σ_{i=1}^{∞}` two lines above, so `F`'s printed `Σ_{i=1}^{n}` is wrong; read on the page image |
| E8 | p. 23 prints `+` where the surrounding algebra of `\|C\|` uses `∨` (Cor. 4.7 immediately below: `[M] = [M_1] ∨ ⋯ ∨ [M_r]`) |
| E9 | p. 25 names `L₁` twice; `o^n ⊃ ⊕p^{λᵢ}` is the inclusion `L₁ ⊃ L₂` |
| E12 | p. 49 defines `D = Vι(G′)` with a plain `V`; p. 50 prints `D = V′ι(G′)`, and `V = V′V″` — both read on page images |
| E15 | p. 7 prints `d ≥ 0`; `G₀` carries no cuspidal representation |
| E16 | p. 27's own construction uses the prefix `b_i`, not `n_i` |
| E17 | the final tensor factor is labelled `π_r` in a product running to `π_s` |
| E18 | p. 54 cites "Lemma 9.4"; 9.4 is a **Corollary** (read on the page image) |

For **E4, E6, E7, E10, E11, E13 and E14** I verified the quotation against the published
text but not the proposed correction, which depends on recomputing an example or
re-deriving a normalisation. Each verdict says so explicitly rather than implying a check I
did not make.

## Items, statuses and routes

- **8 library items**, all read at the pinned commits (Mathlib 082e2d3, Tau Ceti f790474)
  and all saying what the citing item claims. Nothing unresolved.
- **10 planned items**, all naming atlas layers that exist.
- **143 missing items, routed exactly once each.**
- **Run-together numbering repaired in 295 places**; the file grew by exactly 295
  characters.
- **8 routes, all accepted.** Four are source additions to
  `SmoothRepresentationsOfLocalGroups`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`,
  `AutomorphicLFunctionsAndLocalFactors` and `GL2AutomorphicRepresentationsAndTransfer:R16.2`.
  Four are Part IIs, each with a title that is an exact prefix extension of its parent's,
  each name free and none co-proposed by another paper. The split is well judged: §4's
  finite-length DVR module theory and §3's multisegment duality are reusable and are sent to
  the roadmaps that own local fields and quiver combinatorics respectively, rather than being
  buried in a newforms roadmap.

  **One caution for the design job** on
  `SmoothRepresentationsPartIIGeneralLinearNewforms`: the §9 items that rest on Theorem
  9.1's uniqueness are exactly the ones this review found to have an unjustified step
  (E1, E19). The brief should record that the printed proof of uniqueness is not complete,
  so that a builder supplies or replaces it rather than transcribing it.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ATOBE-KONDO-YASUDA-22.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
