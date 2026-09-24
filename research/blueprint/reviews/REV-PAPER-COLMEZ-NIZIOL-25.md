# Review of PAPER-COLMEZ-NIZIOL-25

**Job** REV-PAPER-COLMEZ-NIZIOL-25 (issue #1307) · **Date** 24 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All seven routes accepted; **all 36 `sourceIssues` confirmed**; two
corrections made in place. I add no finding of my own.

Paper: Pierre Colmez and Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, II: The
C_st-conjecture*, [Duke Math. J. **174** (2025), 2203–2301](https://doi.org/10.1215/00127094-2024-0074).
Extraction by Claude Code, session `cc-fb70e5` (issue #1306) — a different session, as the job requires.

**Both recorded hashes reproduce byte for byte:** the authors' PDF
`webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf`,
`bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a` (61 pages), and arXiv:2108.12785v4,
`83c6afdc8a377e38dced9dd8b400cb3461a2d47de2664a094e81a04332051361`, which the extraction records as
textually identical to it. I also fetched the v4 LaTeX e-print. Every check below was made against that
61-page text, whose folios and statement numbers are the extraction's locators. The published Duke text
is paywalled and was not consulted, as the extraction states — it is explicit that production
copy-editing may have corrected some of these, and each finding's `searched` field says so.

## The 36 findings

**All 36 confirmed**: 29 misprints, 5 errors, 2 gaps. I located every quoted string in the source and
checked every argument. Not one failed.

### The five errors and two gaps

**E1 — the degree has the wrong sign, twice.** Page 32 prints `deg(M) := t_N(M) − t_H(M)`, once for
rank 1 and once for rank `r`, so it is a convention rather than a slip. Three things force `t_H − t_N`:

1. §3.2.2 (p. 14) defines semistability as `μ(E′) ≤ μ(E)` for strict subobjects, and Definition 5.1
   makes *weakly admissible* mean *semistable of slope 0*; Fontaine's condition is
   `t_H(M′) ≤ t_N(M′)`, which is `deg(M′) ≤ 0` only for `deg = t_H − t_N`.
2. Remark 5.5(ii) makes acyclicity equivalent to `H¹` of the associated bundle vanishing, and
   Definition 5.1 makes acyclic mean HN slopes `≥ 0`.
3. **The rank-one example settles it, and I redid this computation independently.** For `M = F` with
   `φ(e) = pe` and a single jump at `0`: `X_st(M) = (M ⊗ B_st)^{N=0,φ=1} = B_cris^{φ=p^{-1}} = 0`, while
   `X_dR` is nonzero — so `H⁰ = 0`, `H¹ ≠ 0` and `M` is **not** acyclic. The printed formula gives
   `deg = 1 − 0 = +1 ≥ 0` and would call it acyclic.

**E3 — Corollary 3.21(iv) is refuted on its own page.** It says "a quotient of height 0 of a BC of
curvature ≥ 0 has curvature 0". Footnote 9, on the same page, records that for `x ≠ ∞` the object
`𝕌₁/Q_p t_x` has `ht = 0` and curvature `> 0`. It is a quotient of itself and has curvature `≥ 0`, so
(iv) would give it curvature 0 — i.e. make it a successive extension of `𝕍₁` (Definition 3.5), which for
a nonzero object admits a nonzero map to `𝕍₁`, while §3.2.7 computes `Hom_BC(𝕌₁/Q_p t_x, 𝕍₁) = 0`.

**E4 — one-sided slope hypotheses cannot bound an extension.** The fourth bullet of §3.2.2 (which also
opens with an untranslated French "Il") fails at once on the Fargues–Fontaine curve: `λ₁ = 0`, `λ₂ = 1`,
`E₁ = O(5)` has slopes `≥ 0`, `E₂ = O` has slopes `≤ 1`, and the split extension has a slope `5 ∉ [0,1]`.

**E5 — Lemma 4.24(i) contradicts its own proof.** The statement asserts `Ext¹_TVS(𝕌_d, 𝕎) ≅ W`; the
proof sets `h¹(−) := Ext¹_TVS(−,𝕎)` and concludes "`h¹(𝕌_d) = 0`". Part (ii), "a direct consequence of
(i) and the exact sequence of Ext's", needs the vanishing.

**E31** — Corollary 3.20(b) omits a nonvanishing hypothesis (the zero object has curvature `< 0` and
height 0); a degenerate case, but a formalisation must carry it. **E32** — the reduction of Lemma 3.16
to `λ > 0` does not exclude a `𝕌₀ = Q_p` summand, since `Q_p` is a *subobject* of `𝕍₁`, not a quotient.
**E36** — Lemma 4.29 claims `C`-linearity for all `c ∈ O_C`, while its proof opens the second half with
"let `c ∈ O_C^*`" and chooses an isomorphism sending `X ↦ cX`, which needs `c` invertible.

### Three findings settled by counting

These are the kind a reader can only confirm by exhausting the text, so I did:

| finding | what I counted in the 61 pages |
|---|---|
| **E8** | the natural sign `♮` of `Ext^{1,♮}` occurs **exactly once**, at the spot the finding names |
| **E13** | "spherically closed" **once** (Proposition A.4) against **four** of "spherically complete" |
| **E15** | "Topological Pair" **once** against **thirteen** of "Topological Vector Space" |

### The remaining twenty-six misprints

Each is contradicted by the paper's own neighbouring text, and I checked each in place: the reversed
inequality closing Lemma 3.16's proof against the goal stated three lines earlier; `𝔹_st` for `𝔹⁺_st` in
Proposition 5.20, where the printed map is not even defined; a filtration "containing" where Lemma 5.3
supplies one *contained*; `M_K` for `M^*_K` in Example 5.11; a stray tower index in (8.7), whose fully
indexed companion is (8.8); a reference to (6.11) where only (8.8) can be inverse-limited; perfectness
attributed to the outer complex rather than the coefficients in Lemma 8.13; `b_{i,k−1}` for `b_{i,k−i}`;
`H^r_ét` for `H^r_proét` in Corollary 6.19, which is about Stein and affinoid varieties; `J_j` for `J_i`
and `h_i` for `h_j` in §7; `f_i` for `f_r` and `H^i_dR` for `H^r_dR` in the proof of Theorem 6.4; the
lattice in Remark 6.13(i); the unsatisfiable range `0 ≤ j ≤ j − 1` in Lemma 2.10; `V` for `V₁` in Lemma
5.12; `𝔹_m` for `𝔹₁` in §3.2.7; mismatched indices in Remark 4.20; "is" for "if" with the wrong index in
Lemma 5.4; a summation index in Proposition 4.27; the leftmost entry of the diagram in Proposition 5.23,
fixed by the sentence right after it; a bound `τ` against a free `σ` in Proposition 4.10; a rebound `j`
in Corollary 2.9; `Hom_F(M,F)` where the `F^nr`-dual is meant; and an undefined `Y` in the proof of
Proposition 8.4.

## Two corrections made in place

1. **The Part II title.** It read *"Isocrystals, vector bundles and Banach**-**Colmez spaces, Part II: …"*
   with a hyphen where the parent's atlas title has an en dash in *Banach–Colmez*. PROTOCOL §15 asks for
   the parent's title reproduced, so I restored the dash. That single character was the only difference.
2. **The pins.** The extraction recorded no `baseline` block. It cites **no library declaration at all**,
   and I checked that this is right — the items are Banach–Colmez spaces, qBC's, period sheaves and the
   Hyodo–Kato and syntomic cohomology of dagger varieties, none of which the pinned libraries contain,
   and the two items whose names mention Banach or topological vector spaces are the paper's *own*
   categories (Definition 4.1, Appendix A), not Mathlib's. I added `baseline` with Mathlib `082e2d3` and
   Tau Ceti `f790474` and recorded that finding there.

Nothing else was changed.

## Structure

**177 items** (173 missing, 4 planned, **no library**) and **seven routes**: 1 new, 1 Part II, 5 source.

- Every missing item is routed exactly once; the 4 planned items appear only on **source** routes, which
  §16 expressly allows.
- All eleven source-route stage ids resolve in `data/atlas.json`; all five planned references resolve.
- Both proposed roadmap ids — `CstConjectureForDaggerVarieties` and `VectorBundlesAndIsocrystalsPartII`
  — are **free** and carried by no other extraction; both areas are galaxy ids.

**Coverage.** Of the **147** distinct statement labels appearing anywhere in the 61-page text, **139**
are named in item locators or names. The eight that are not are all Remarks (1.7, 4.6, 5.19, 5.22, 6.10,
7.5, 8.11, 9.2). Every numbered theorem, proposition, lemma, corollary, definition, example and fact is
carried.

**The briefs** state the final theorems with their numbers and hypotheses — the fundamental diagram and
its bicartesian property, the equivalence with acyclicity of `(H^i_HK, F⁰H^i_dR(X/B_dR))`, the cases
proved, and the converse recovery of Hyodo–Kato and de Rham cohomology from pro-étale cohomology — and
name what to import. The design jobs should carry E1 (the degree sign), E3 (restate Corollary 3.21(iv)
in terms of the Harder–Narasimhan slope) and E5 (the Ext¹ vanishing).

## What this review did not do

I did not consult the published Duke text, so no finding here is checked against the version of record
and a production correction would not show up. I did not re-derive the paper's proofs: I read §§1, 3.2,
4.2–4.3, 5.1–5.3, 6.4, 7.3, 8.1–8.3, 9.2 and Appendix A around the findings, every statement the routes
cite, and every passage a finding names with enough of its surroundings to judge it.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-COLMEZ-NIZIOL-25.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-COLMEZ-NIZIOL-25.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-COLMEZ-NIZIOL-25.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
