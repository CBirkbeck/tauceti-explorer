# Review of PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19

**Job** REV-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 (issue #2174) · **Date** 2026-09-23 · Claude Code,
session `cc-7b31c4` · **Verdict: accept.** All four routes accepted; all eight `sourceIssues` confirmed;
one quotation corrected in place, one version note and one library declaration added; nothing rejected
and no item deleted.

Paper: J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman and J. Vonk, *Explicit Chabauty–Kim for the
split Cartan modular curve of level 13*,
[Ann. of Math. **189** (2019), 885–944](https://doi.org/10.4007/annals.2019.189.3.6); arXiv
[1711.05846](https://arxiv.org/abs/1711.05846).

Reviewed: `research/blueprint/papers/PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json` and its report.
The machine-readable verdict is `PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.review.json` beside the extraction.

## What I read

Both files the extraction names, and both hashes it records came back the same:

- the published text, `https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf`,
  60 pages, sha256 `e1aa5f9662b4875404e25e45dd808e2b73223d562191018242ef357a13dff1f8`;
- arXiv 1711.05846v1, sha256 `77c57b0307c8915959a771c15bc89c6c46ae4c2d3b344c81ce898cfa9b90c917`.

I also read two things the extraction did not have to hand in machine-readable form: the **LaTeX e-print of
arXiv v1** (`Cartan.tex`, 160 kB), which settles the arXiv side of every quotation exactly, and the e-print of
the authors' sequel, **BDMTV, Compositio Math. 159 (2023)** (arXiv 2101.01862v4), which is where Lemma 4.7 is
retracted. The published PDF uses object streams, so its text was extracted glyph by glyph with the positions
kept, which is what makes the check of E3 below possible.

## Locators

**Every named result is on the page the locator gives.** Mechanically, for each of the 51 locators that name a
Theorem, Lemma, Corollary, Proposition, Remark or Definition together with a published page, the numbered
statement occurs on exactly that page of the PDF: 51 hits, no misses, no adjacent-page near misses. The paper
runs two numbering sequences that collide — §4.1 and Remark 4.1 are both on p.909, §2.3 and Theorem 2.3 both
on p.899 — and the extraction's locators name the object, not just the number, throughout.

**The arXiv renumbering is right.** Eleven locators claim a different number in arXiv v1. I read each one in
the arXiv text and they all hold: Theorem 2.3 is arXiv Lemma 2.3 (Balakrishnan–Dogra); Theorem 4.2 is arXiv
Theorem 4.1 (Kim); Theorem 4.5 is arXiv Theorem 4.4 (Hadian); Lemma 4.7 is arXiv Lemma 4.5; §5.2.1's transport
is arXiv Lemma 5.3; Lemma 5.5 is arXiv Lemma 5.4; Lemma 5.7 is arXiv Lemma 5.5; Theorem 6.5 is arXiv Theorem
6.6 (Edixhoven); Theorem 6.6 is arXiv Theorem 6.7; Corollary 6.7 is arXiv Corollary 6.8; Proposition 6.2 is
arXiv Proposition 6.3.

## Items and statuses

**The one library item** is item 81, the normalised Fricke involution. All three declarations exist at Tau Ceti
`f790474` in `TauCeti/NumberTheory/ModularForms/Fricke/Normalized.lean` and say what is claimed, including the
`Even k` hypothesis the note flags. One thing the item did not carry: the paper applies `W_169` to
S_2(Γ_0(169)), while the cited declarations are about S_k(Γ₁(N)). The bridge is in the library —
`frickeOperatorCusp_mem_cuspFormCharSpace` (`Fricke/CharacterSpace.lean`, line 106) sends the χ-nebentypus
space into the χ⁻¹ one, and at the trivial character that is the stability of S_2(Γ_0(169)) — so I added that
declaration to the item and said in its note why it is needed. The status stays `library`.

**All 22 planned items name layers that exist.** The 19 distinct layer ids they use all resolve in
`data/atlas.json`, including the two Tau Ceti `ModularCurves` layers and the two `ModularForms` ones.

**The 69 missing items.** I checked the statuses that could plausibly be wrong rather than all of them. At the
pinned commits, `declarations.tsv` has no declaration matching Chabauty, Coleman, Nekovář, Tannakian,
Néron–Severi, mixed extension or p-adic height in either library. The two near misses both fail: Mathlib's
`WittVector.Isocrystal` is an isocrystal in the Dieudonné sense over a perfect field, not an overconvergent
isocrystal on a rigid space, so items 54–56 are rightly missing; and the 67 Selmer declarations are Tau Ceti's
2-descent Selmer group of a Weierstrass curve, not a Selmer variety, so item 16 is rightly planned rather than
library.

**Routing arithmetic.** 75 items are routed, 69 of them the missing ones — each exactly once — and 6 planned
ones named as items the paper is a good source for, which section 16 explicitly allows a `source` route to do.

## Routes

The maintainer's guide in `papers.json` names two routes, NC.5 and ED.6, and the paper's note says to route the
rest "to those layers and to other existing roadmaps". The extraction did exactly that: four `source` routes,
no new roadmap and no Part II. All four target layers exist and all three roadmaps have origin `campaign`, so
none is a Tau Ceti roadmap being re-planned. The individual reasons are in the review JSON; in short, NC.5 and
ED.6 are the guide's, NC.2 is the companion layer in the same roadmap that holds the Tannakian and comparison
machinery NC.5 consumes, and R13.5 is the bad-fibre layer that owns semi-stable models of modular curves.
R13.5 keeps its cases as an explicit list drawn from the level-lowering argument, so this route widens that
list; that is work for the roadmap's blueprint, not a reason to send the items elsewhere, and nothing else in
the atlas computes models of X_0(ℓ²) at ℓ.

## The eight recorded mistakes

All eight are confirmed in the published text. What I did for each:

- **E1** (misprint). Display (40) on p.921 prints `w(ω_0, …, ω_{2g+2d−2})` while the sentence immediately after
  it takes words in {T_0, …, T_{2g+d−2}} and writes `w(ω_0, …, ω_{2g+d−2})`. The e-print confirms the arXiv side
  of the locator exactly: `2g+2d-2` occurs in both displays of C_n and nowhere else.
- **E2** (misprint). Confirmed from the paper alone. (29) on p.915 prints `dΩ_x = −ω`, `dg_x = Ω_x^T Z dΩ_x − η`;
  (30) on p.916 prints `Res_x(Ω_x^T Z dΩ_x − η) = 0`; step (i) on p.918 prints `dΩ_x^T Z Ω_x − η`. Since Z is
  antisymmetric the two differ by the sign of the first term, so they determine different η unless those
  residues vanish. The extraction's claim about the authors' code holds: `hodge.m` in `jtuitman/Cartan13` builds
  `omegaZOmega = ω^T Z Ω` and solves `Σ_j η_j Res_x(ω_{2g+j}) = −Res_x(ω^T Z Ω)`, which is (30) once its Ω = ∫ω
  is matched with the paper's Ω_x = −∫ω, and not step (i). The sequel repeats the printed form: Compositio 2023
  (4.1) says `dΩ_x^T Z Ω_x − η` has vanishing residues.
- **E3** (error, affects the proof) — **the one finding whose quotation I corrected.** The substance is
  confirmed twice over. §5.3.1 on p.922 says the transport is obtained by applying (44) to "the integrals
  I(x, x_0) and I(b_0, b)", while (41) on p.921 defines τ_{b,x}(v) = I(x_0,x)·v·I(b,b_0); and the displayed
  product on p.923 has (2,1) entries ∫_x^{x_0}ω and ∫_{b_0}^b ω, both reversed. arXiv v1 (24) on p.25 prints
  the same orientation, `s_0^{-1}(x)∘s^φ(b,x) = I(x,x_0)∘s_0^{-1}(x_0)∘s^φ(b,x_0)`, and `U1.m` in the authors'
  code transports the other way, `parallel_transport(teichpoints[i], Qppoints[i], …) * frob_equiv_iso(…)`.
  The correction: the extraction quoted the (3,1) entry of the first matrix as ∫_x^{x_0}η + ∫_x^{x_0}ω^T Zω,
  but the paper prints the second summand as **∫_{x_0}^{x}ω^T Zω** — in the PDF the superscript glyph is `x`
  at y = 840.2 and the subscript `x_0` at y = 831.6, against `x_0` above `x` in the η term beside it. So that
  entry is inconsistent with its own first summand, and one of its four integrals is already in the orientation
  the correction asks for. I fixed the `printed` field and said this in the `correction`; the finding, its kind
  and its reach are unchanged.
- **E4** (gap). §4.1 on p.909 asks only that ω_0, …, ω_{2g−1} be of the second kind and symplectic. §4.5 then
  uses more: N = (0_g, 1_g)^T is called the matrix of Fil⁰V_dR ↪ V_dR (p.916), the proof of Theorem 4.11 needs
  Ω_x − NN^TΩ_x to have entries in L[[t_x]] and Z to have lower right block 0_g (p.917). Both hold only for a
  basis adapted to the Hodge filtration, that is with ω_0, …, ω_{g−1} holomorphic. The correction's parenthetical
  is right: the basis chosen in §6 on p.930 begins (1, x, y) dx/Q_y, the three holomorphic differentials of the
  plane quartic.
- **E5** (error, reaching a stated result). The statement is as quoted on p.913. The `known` field is verbatim:
  Compositio 2023 §3.5.2 prints "need not equal the dimension of ∧²H¹_dR(X_{Q_p})^{φ=p} ∩ Fil¹, as was
  erroneously claimed in [BDMTV19, Lemma 4.5]", with the lattice-rank reason the extraction gives. One thing the
  extraction did not record and I added: **arXiv v1's Lemma 4.5 concludes in Pic(X × X) ⊗ Q_p** (`Cartan.tex`,
  line 1363) and the published Lemma 4.7 drops the ⊗ Q_p, so the correction's last sentence is about the
  published text only.
- **E6** (misprint). Theorem 4.2 on p.910 says "any section v of V" and invokes §A.1; Definition A.1 on p.935
  defines a pointed object as (V, v) with v ∈ ω(V), a vector in the fibre. The counterexample in the reason is
  correct: a morphism f out of A_0^dR(Y) = (O_Y, d) has f(1) horizontal, hence constant, so no f sends 1 to a
  non-constant function.
- **E7** (misprint). p.933 constructs "two matrices T′_i(u)" and then takes "the zeroes of det(T′_1(u)) and
  det(T_2(u′))". u′ is never defined.
- **E8** (gap). The proof of Lemma 3.7 on p.907 prints "By assumption, we have r = g and H¹_f(G_T,V) ≃
  H¹_f(G_p,V) ≃ H⁰(X_{Q_p},Ω¹)*", but §1.4 on p.890 assumes only that r = g and that the p-adic closure of J(Q)
  has finite index in J(Q_p), which gives J(Q) ⊗ Q_p ≃ H⁰(X_{Q_p},Ω¹)* and not the global comparison; the extra
  input is the finiteness of Ш(J/Q)[p^∞]. The reason's second half checks out too: §2.1 on p.898 defines the
  Selmer variety by cutting H¹_f(G_T,U_n^ét) down to classes "whose projection to H¹_f(G_T,V) lies in the image
  of J(Q) ⊗ Q_p", which is what carries the ≤ r bound quoted in the sketch of Theorem 2.3 on p.899. For this
  curve the hypothesis is available from Kolyvagin–Logachev, the theorem the paper already uses for
  Proposition 6.2, so `affects: nothing` is right.

**No ninth finding.** I looked for one in the places a reviewer can check cheaply — the arXiv e-print has no
duplicated label and no undefined cross-reference, and the published text's numbering is internally consistent
— and found nothing to add beyond the E3 quotation above.

## What I computed myself

The extraction records direct computations in its `G-computations` gap. I redid them from the printed models
rather than trusting the note:

- **The two plane models agree.** Substituting the inverse of (X:Y:Z) ↦ (X−Y : X+Y : X+Z) into the first model
  of p.930 gives exactly Q/16, so the stated change of coordinates is right and the Y⁴-coefficient of Q is 1
  as the paper says.
- **The seven listed points** (1:1:1), (1:1:2), (0:0:1), (−3:3:2), (1:1:0), (0:2:1), (−1:1:0) all satisfy
  Q = 0.
- **Reduction.** Q is smooth modulo 3, 5, 7, 11, 17, 19, 23 and singular modulo 2 and 13 — "good reduction away
  from 2 and 13", as printed — and the first model is singular only modulo 13, matching "good reduction away
  from 13".
- **#X(F_17) = 20**, the count the extraction's gap note claims, and 17 is a prime of good reduction.
- **The CM count behind Corollary 1.3.** Of the thirteen imaginary quadratic orders of class number one, 13
  splits in exactly six (discriminants −3, −4, −12, −16, −27, −43) and is inert in exactly seven (−7, −8, −11,
  −19, −28, −67, −163), which is the six CM points of Theorem 1.1 and the seven of Corollary 1.3.

## What this review did not do

- The Magma computations of §6 were not re-run: the Tate classes from T_7 and T_11, η, β_Fil, γ_Fil, the
  Frobenius structures and the zero tables. That is the extraction's `G-computations` gap and ED.6's work. Two
  files of the authors' code were read, for the two findings that cite them, not executed.
- The cited theorems (Kim, Hadian, Olsson, Chiarellotto–Le Stum, Kim–Tamagawa, Nekovář, Besser, Edixhoven,
  Raynaud, Bilu–Parent–Rebolledo, Baran, Chen, Kolyvagin–Logachev, Ribet) were read only as the paper states
  them, as `G-inputs` records; the prerequisite list that carries them was checked against `papers.json` and
  none of the twenty is already covered.
- No Lean file was written or compiled, and no library or roadmap claim beyond the statuses above was made.

## Changes made in place

- `PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json`: E3's `printed` now quotes the (3,1) entry as the paper
  prints it and its `correction` says which integral is already in the corrected orientation; E5's `searched`
  gains the arXiv-v1 `⊗ Q_p` note; item 81 gains
  `tauceti:TauCeti.frickeOperatorCusp_mem_cuspFormCharSpace` and the note explaining the Γ_0(169) reading.
- `PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.md`: the same three changes, so the report and the result agree.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
