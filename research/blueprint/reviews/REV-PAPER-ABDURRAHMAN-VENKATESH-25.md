# Review of PAPER-ABDURRAHMAN-VENKATESH-25

**Job** REV-PAPER-ABDURRAHMAN-VENKATESH-25 (issue #1210) · **Date** 23 September 2026 · Claude Code,
session `cc-7b31c4` · **Verdict: accept.** All six routes accepted; all 25 `sourceIssues` confirmed;
one correction made in place. I add no finding of my own.

Paper: Amina Abdurrahman and Akshay Venkatesh, *Symplectic L-functions and symplectic Reidemeister
torsion (mod squares)*, [Invent. Math. **241** (2025), 717–839](https://doi.org/10.1007/s00222-025-01349-6),
read in [arXiv:2303.13436v1](https://arxiv.org/abs/2303.13436). Extraction by Claude Code, session
`cc-39fac3` (issue #1209) — a different session, as the job requires.

**Both recorded hashes reproduce byte for byte**: the PDF
`3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306` and the LaTeX e-print
`e18e82663000a365452b439e971bb49d05a7ea6ce03201309166120e30a44c9e` (`ReidemeisterPaperArxiv.tex`,
10 889 lines). Every check below was made against the authors' own source, and each verdict cites a TeX
line. The published text is paywalled and was not read, as the extraction states. I rebuilt the
numbering from the source — Theorem, Proposition, Remark and Example by section; Lemma and Definition
by **subsection**; equations by section — and every statement the extraction cites lands on an
environment of the right kind.

## The 25 findings

**All 25 confirmed**: 17 misprints, 6 errors, 2 gaps. Three matter.

### E3 + E4 — Theorem 3.1 is not proved for `r = 1`, `#ℓ = 9`

Lemma 2.7.1 asserts that `Sp_{2r}(F_q)` and `SL_{2r}(F_q)` have **vanishing integral `H₂`** for odd `q`.
The Schur multiplier of the universal Chevalley group `A₁(q)` is nontrivial for exactly `q = 4` and
`q = 9`, and `SL₂(9) = 2·A₆` has `H₂ = Z/3`, because the universal central extension of `A₆` is `6·A₆`.
(`q = 4` is even, hence outside the lemma.) Inside Lemma 2.7.1 nothing is lost — only `H₂/2 = 0` is
used, and odd order suffices.

The consequence is **Lemma 5.1.1**, which deduces irreducibility of the geometric fibre of the Hurwitz
stack from Dunfield–Thurston *"since `H₂(G,Z)` is trivial in the case at hand"*, with
`G = Sp_{2r}(ℓ)` for an arbitrary finite field `ℓ` of characteristic `≠ 2, p`. For `r = 1`, `#ℓ = 9`
the fibre has **at least three components**, by the Livingston / Dunfield–Thurston classification of
mapping class group orbits by the invariant `φ_*[Σ_g] ∈ H₂(G,Z)` that the proof itself invokes.

And the case is inside Theorem 3.1, not vacuously: `9 ≡ 1 (mod 8)` as its hypothesis requires, and
admissible pairs exist — take `q = 73`, which is `≡ 1 (mod 8)`, prime to `#SL₂(F₉) = 720`, and a square
in the prime field `F₃` since `73 ≡ 1 (mod 3)`. So **the proof of step (A), and with it Theorem 3.1,
does not cover `r = 1`, `#ℓ = 9`.** The design job must exclude that case or run the argument component
by component — which the extraction's route brief already instructs.

### E25 — a characteristic-zero input used in positive characteristic

The corollary (1.5) of the topological theorem is applied in the proof of Lemma 5.2.1 to
`ρ : π₁(M) → Sp_{2r}(ℓ)` with `ℓ` the **finite** field of `G = Sp_{2r}(ℓ)`. The chain that proves (1.5)
— Lemma C.2.1 and the circle formula (B.30) — assumes characteristic zero, through Jacobson–Morozov and
`M = −log(A)`; §2.3.2 says as much ("true when the characteristic of `K` is zero, and likely holds in
general"). A genuine gap, and the brief already tells the design job to plan (B.30) and Lemma C.2.1 over
every field of characteristic `≠ 2`.

### E19 — Appendix B.10's base change needs the normalized class

**I verified this myself, in the paper's own setting**, rather than relying on the computer calculation
the extraction reports. Take `V = H ⊕ H` over `R = Q[s]_(s)` with `A_s = diag(1+s, (1+s)^{-1})` on the
first hyperbolic plane and the identity on the second. Generically `h = 2`, `W` is the first plane,
`det(1−A)|_W = −s²/(1+s) ≡ −(1+s)` and `disc(V⁺) = disc(H) = −1`, so the paper's formula (B.30) gives
`RT = (−1)^{h/2}·spinor(A) = −(1+s)`. At `s = 0` the automorphism is the identity, `h = 4`, `W = 0`,
`spinor = disc(H⊕H) = 1` and `RT = +1` — while the image of `−(1+s)` is `−1`, a nonsquare.

So `RT` is **not** compatible with base change; the discrepancy is exactly the normalizing sign
`(−1)^{(h_S − h_K)/2}` of Theorem 2.2, and it is the normalized class that base-changes. The printed
proof's "sign depending only on the dimension data of the complexes" is too weak: it depends on the rank
of the middle differential, which jumps under specialization. *Limit of my check:* this witness is
orthogonal, while B.10 is stated for skew-symmetric `ρ` with `k` even (the paper says the other case
"should be identical"); the symplectic witness the extraction gives rests on a computation I did not
redo. The main text uses only the normalized class, so nothing downstream is affected.

### The other errors

| id | what |
|---|---|
| **E7** | `Pic(X)` is infinite, so the displayed map to the local Homs is **surjective**, not injective — which is all the argument needs, once (a) bounds `m` by the class number |
| **E12** | the skew form `⟨dx,y⟩` descends to the **image** of `d` (its radical is `ker d`), not to the cokernel; what follows is that `rank d` is even, which is what (A.11) needs |
| **E20** | `δ` must be the discriminant on the **generalized** 1-eigenspace, as Zassenhaus's formula gives; on the actual fixed space the form is degenerate whenever `T` is not semisimple there |
| **E8** | the smallest `D` with `E ≥ 6N` can be `1`, and distinct points need not impose independent conditions on hyperplanes; Poonen's Lemma 2.1, which the paper cites, needs `D ≥ r − 1` |

### The misprints

All seventeen are contradicted by the paper's own neighbouring text: the non-alternating form in §1.5
(`⟨e_i,e_i⟩ = 1`); "`4r`-manifold" where `r` is the half-rank of `ρ`; the ε-factor missing an inverse
(I redid the functional-equation computation: `ε(t) = (−qt)^n det(F|H¹)^{-1}`, and the printed middle
term is `q^n` too large, though the conclusion is right); `(d)` cited for what `(c)` says; the missing
sign in Grothendieck–Lefschetz; invariants of `ρ_λ` where `ρ_λ ⊗ ρ_λ` is meant; "unramified outside `m`"
against the parallel lemma's "at `m`"; the degree shift in the Appendix A.7 table; four slips in
Appendix B (including two `\eqref` of a *subsection* label, which print as equation numbers); the
left-hand side of (B.30) for its right-hand side; `χ(g)` where `χ` is defined only on `H`; `β'` applied
to a class of the wrong degree; and, in the numerical appendix, `Pic(X)` for `Pic(X̃)` together with
"trivial" for "nontrivial" — the latter flatly contradicted three lines later by the step that uses it.

## Structure

**93 items** (85 missing, 7 planned, 1 library) and **six routes**: 4 source, 1 new, 1 Part II.

- Every missing item is routed exactly once; no routed id is unknown, non-missing or duplicated.
- All five source-route stage ids resolve; all twelve planned references resolve (nine atlas refs,
  three of the external `tauceti:` form).
- The Part II title reproduces its parent's atlas title — *Global function fields, reciprocity and
  automorphic foundations* — exactly. Both proposed ids are **free** and carried by no other
  extraction; both areas are galaxy ids.
- **Coverage is complete for numbered statements**: the paper has 37 numbered environments and every
  one is named in an item. The other items carry unnumbered statements, which is right for a paper that
  states most intermediate results in running text.

**One correction made in place.** The extraction recorded **no pinned commits at all** — neither a
`baseline` block nor `libraryPins` — so its single library item was unpinned. I added `baseline`
(Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`)
and re-read all five cited declarations there: `groupHomology`
(`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:230`), `groupCohomology`
(`…/GroupCohomology/Basic.lean:186`), `legendreSym.quadratic_reciprocity`
(`Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107`), `QuadraticForm.discr`
(`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1280`) and `Sylow`
(`Mathlib/GroupTheory/Sylow.lean:55`). All five resolve. Nothing else was changed.

## The briefs

These are the best part of the extraction, and worth saying so. Both state the final theorems with
their hypotheses and numbers, and both already carry the corrections the findings imply: the Part II
brief records that the proof does not cover `r = 1, #ℓ = 9` and that Lemma 5.2.1 needs the topological
corollary with finite coefficients; the new-roadmap brief instructs that the circle formula and Lemma
C.2.1 be planned in every characteristic `≠ 2`. The design jobs should also carry E19: Appendix B.10's
base change holds for the **normalized** class.

## What this review did not do

I did not read the published version, so no finding here is checked against the version of record. I did
not re-derive the paper's proofs: I read the introduction, §§2.7, 3.1–3.3, 3.7, 3.10, 5.1–5.2, 5.5,
6.4–6.5 and Appendices A.6–A.7, B.3–B.10, C and D in the LaTeX, together with every passage a finding
names. I did not redo the computer calculation behind the symplectic witness of E19, and say so in that
verdict.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-ABDURRAHMAN-VENKATESH-25.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-ABDURRAHMAN-VENKATESH-25.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-ABDURRAHMAN-VENKATESH-25.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
