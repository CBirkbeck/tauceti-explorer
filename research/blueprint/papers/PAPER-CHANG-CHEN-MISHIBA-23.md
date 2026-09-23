# PAPER-CHANG-CHEN-MISHIBA-23 — On Thakur's basis conjecture for multiple zeta values in positive characteristic

Claude Code — session `cc-7b31c4`; issue #1380; read on 22 September 2026.

Chieh-Yu Chang, Yen-Tsung Chen and Yoshinori Mishiba, *On Thakur's basis conjecture for multiple zeta values in
positive characteristic*, Forum of Mathematics, Pi **11** (2023), `doi:10.1017/fmp.2023.26` (open access). Read in
the authors' public version, [arXiv:2205.09929v2](https://arxiv.org/abs/2205.09929v2) (11 July 2022) — in its
**LaTeX source** (`Basis_Submit_v2.tex`, source archive sha256 `6336dfc5…`), since `pdftotext` was unavailable
here — together with the published text on Cambridge Core, which was used to check the three source issues below.

**On numbering.** The preprint numbers statements by subsection (Theorem 1.2.4) and the published version by
section (Theorem 1.5). The numbered statements correspond one to one and in the same order — 43 of them, the
published version adding one remark at the end of Section 5 — so every locator in the extraction gives the
preprint number with the published number in parentheses.

The paper has been extracted into **51 items**. One is in the pinned libraries, three are planned by existing
layers, and the remaining 47 are routed exactly once: **45 to a Part II** of *Drinfeld modules, t-motives and
characteristic-p special values*, and **2** as a source for that roadmap's stage DM.8.

## What the paper proves

Let `A = F_q[θ]`, `k = F_q(θ)`, `k_∞ = F_q((1/θ))` and `A_+` the monic polynomials — the function-field analogue
of the positive integers. Thakur's multiple zeta value at an index `s = (s_1, …, s_r)` is
`ζ_A(s) = Σ 1/(a_1^{s_1} ⋯ a_r^{s_r})` over `a_i ∈ A_+` with `|a_1|_∞ > ⋯ > |a_r|_∞`; it converges, and is
non-zero by a theorem of Thakur. Write `Z_w` for the `k`-span of the MZVs of weight `w`.

* **The main theorem (Theorem 1.2.4 = published Theorem 1.5).** For every `w ≥ 1`, Thakur's basis conjecture
  holds: `{ζ_A(s) : s ∈ I^T_w}` is a `k`-basis of `Z_w`, where `I^T_w` consists of the indices of weight `w` with
  `s_i ≤ q` for `i < r` and `s_r < q`. Since `|I^T_w| = d'_w`, this gives Todd's dimension conjecture
  `dim_k Z_w = d'_w`, the analogue of Zagier's conjecture, where `d'_w = 2^{w-1}` for `w < q`,
  `d'_q = 2^{q-1} − 1` and `d'_w = Σ_{i=1}^q d'_{w-i}` for `w > q`.
* **All linear relations (Theorem 5.4.2 = published Theorem 5.3).** The kernel of the realisation map
  `H_w ↠ Z_w` is spanned by `[s] − U^ζ(s)` for `s ∈ I_w \ I^T_w`, where `U^ζ` is the explicit rewriting operator
  of Definition 3.2.2. This answers, in its `q`-shuffle form, a conjecture of Todd, and gives an effective
  algorithm expressing any MZV in Thakur's basis.
* **Method: from MZVs to CMPL values.** By Carlitz's identity `1/L_d^s = Σ_{a ∈ A_{+,d}} a^{-s}` for `s ≤ q`, one
  has `ζ_A(s) = Li_s(1)` on Thakur's index set, where `Li_s` is the Carlitz multiple polylogarithm. The paper
  works on a formal weight-graded `k`-space `H` with basis the set of indices, carrying the harmonic product
  `*^{Li}` and the `q`-shuffle product `*^ζ` (built from H.-J. Chen's formula with its correction terms
  `Δ^{[j]}_{s,n}`), and three realisation maps `𝔏^•_d`, `𝔏^•_{<d}`, `𝔏^•` which are algebra maps
  (Proposition 2.3.5). The stuffle relations for CMPLs and the `q`-shuffle relations for MZVs thereby become one
  formal statement.
* **Generation (Theorem 3.2.4, Corollary 3.2.5, Theorem 3.2.6).** The operator `U^•`, defined from the
  decomposition `s = (s^T, q^{{m}}, s')`, the box-plus operator and the maps `α_q`, satisfies
  `𝔏^•(U^•(P)) = 𝔏^•(P)` and, after finitely many iterations, carries any element of `H` into the span of
  Thakur's indices. This reproves Ngo Dac's generating theorem — effectively, and simultaneously for both
  realisations — and yields the second generating set `{Li_s(1) : s ∈ IND_w}`, indexed by tuples with `q ∤ s_i`.
* **Independence (Theorem 4.3.5, Lemma 5.1.1, Theorem 5.2.1).** Through the period interpretation of CMPL values
  and the **ABP criterion**, a relation `Σ α_s(θ) Li_s(1) = 0` produces a solution of an explicit system of
  Frobenius difference equations `(E_w)` indexed by initial segments of the indices in `IND°_w` — the tuples whose
  entries after the first are divisible by `q − 1`, the shape dictated by the simultaneously Eulerian phenomenon
  of Chang–Papanikolas–Yu. The solutions are rational and degree-bounded (Lemmas 4.2.2, 4.2.3), and the solution
  space `X_w` has `F_q(t)`-dimension `1` if `(q − 1) | w` and `0` otherwise (Theorem 4.3.5); this forces the
  relation to be trivial, so `{Li_s(1) : s ∈ IND_w}` is a basis, and `|IND_w| = |I^T_w|` (Proposition 2.1.1)
  transports the conclusion to Thakur's basis.

## What the atlas already has

* **The roadmap `DrinfeldModulesAndTModules`** ("Drinfeld modules, t-motives and characteristic-p special
  values") plans exactly the objects this paper is built on, and stops at depth one: DM.0 the Ore ring and
  Drinfeld modules with the Carlitz module as the rank-one example; DM.2 analytic uniformisation, the Carlitz
  exponential and the period; DM.4 Anderson `t`-modules and effective `t`-motives with the `τ`-action and rigid
  analytic triviality; DM.6 Goss and Taelman `L`-values, which must recover the explicit Carlitz zeta value; DM.8
  the Tannakian category of rigid analytically trivial motives, the Frobenius-difference Galois group and the
  algebraic independence of Carlitz logarithms after Papanikolas.
* **The classical analogue** is planned at `PeriodsAndSpecialValues:PS.9` — real multiple zeta values with
  shuffle, stuffle, regularisation and the mixed-Tate category, including "selected motivic basis/spanning"
  results, which is where Zagier's and Hoffman's conjectures belong. Three items of the extraction are `planned`
  against these layers (the classical conjectures; the Carlitz zeta values; and the field `C_∞`, which DM.2 and
  FA.0 presuppose).
* **One library item.** Mathlib has polynomial rings over a finite field, rational functions and Laurent series
  with monic polynomials (`Polynomial`, `RatFunc`, `LaurentSeries`, `Polynomial.Monic`), which is `A`, `k`, `k_∞`
  and `A_+`. It has nothing about Carlitz theory.
* **Nothing else.** Searches of every stage description return no hit for "multiple zeta" outside PS.9 and
  AnalyticNumberTheory, and none at all for polylogarithms in characteristic `p`, `q`-shuffle relations, the ABP
  criterion or Thakur's basis.

## The routes

### 1. Part II of *Drinfeld modules, t-motives and characteristic-p special values* — 45 items

`DrinfeldModulesAndTModulesPartII`, "…, Part II: multiple zeta values and Thakur's basis", area `functionfields`.

The parent roadmap goes exactly this way and stops before the higher-depth theory: it plans the Carlitz module,
its period, `t`-motives and Carlitz logarithms, and DM.6 plans the depth-one zeta values. Thakur's multiple zeta
values, Carlitz multiple polylogarithms, the `q`-shuffle algebra on indices with its two realisations, the
rewriting calculus that produces Thakur's basis and the description of all linear relations, and the Frobenius
systems that prove linear independence, are new layers in that direction — a Part II by PROTOCOL section 15, not a
new roadmap. The brief lists the imports (DM.0, DM.2, DM.4, DM.6, DM.8, FA.0, and PS.9 for orientation on the
classical side) and flags two inputs the paper uses without proof that deserve their own layers: the
Anderson–Thakur interpolation formula with the Anderson–Thakur polynomials, and the period interpretation of CMPL
values that produces the matrices entering the ABP criterion.

### 2. Source for `DrinfeldModulesAndTModules` DM.8 — 2 items

DM.8 plans Papanikolas's Tannakian difference-Galois theory, the analytic trivialisation matrix and the
specialisation criterion. That theory is built on two things the layer does not state: the standard twisting
setting (the `n`-fold Frobenius twist on `C_∞((t))`, the Tate algebra, the ABP ring `E` of entire functions with
algebraic coefficients, and the fixed rings `F_q[t]` and `F_q(t)`), and the **Anderson–Brownawell–Papanikolas
criterion** itself. Both belong inside DM.8 and this paper is a good source for them; the Part II then imports
them. Routing the general machinery to the parent layer and the multiple-zeta-value theory to the Part II keeps
the two apart, as PROTOCOL section 15 asks.

## Prerequisites the atlas does not cover

Twelve entries are listed. The ones that matter most: **Anderson–Brownawell–Papanikolas** (arXiv:math/0207168) for
the criterion; **Anderson–Thakur** for the Carlitz polylogarithms, their interpolation formula and the period
interpretation of MZVs; **Chang** (arXiv:1207.4736) for Carlitz multiple polylogarithms, the descent of
`k̄`-linear relations to `k`, and the period interpretation used in step (II-1); **Thakur**'s book and papers for
the values themselves, their non-vanishing, the `q`-shuffle relations and the basis conjecture; **Ngo Dac**
(arXiv:2007.11060) for the generating theorem; **Chang–Papanikolas–Yu** (arXiv:1601.01927) for the Frobenius
systems and the simultaneously Eulerian phenomenon; **H.-J. Chen** for the product formula defining the
`q`-shuffle; **Papanikolas** (arXiv:math/0506078) for the difference-Galois framework DM.8 plans; **Todd** for the
dimension conjecture and the conjecture on relations; and **Im–Kim–Le–Ngo Dac–Pham** (arXiv:2205.07165) for the
simultaneous and independent treatment of alternating MZVs, which the roadmap will want alongside this one.

## Mistakes in the source

Three misprints, recorded under `sourceIssues`; each was compared with the published text on Cambridge Core.

* **E1** (Section 2.2, the definition of the power sums, before Definition 2.2.2): `S^ζ_d(s)` is defined as
  `Σ_{a ∈ A_{+,d}} 1/a^{d}`, where the exponent must be `s` — otherwise the symbol would not depend on `s`, and
  Remark 2.2.12, which states Carlitz's identity `1/L_d^s = Σ_{a ∈ A_{+,d}} 1/a^s`, would not match. **Still
  present in the published version.**
* **E2** (Section 2.3, the definition of `Δ^{[j]}_{s,n}` in Chen's formula): the condition is printed
  "(q − 1) | k", where `k` is the function field; it must be `(q − 1) | j`. With the corrected reading Remark
  2.3.4 (`Δ^{[j]}_{s,n} = 0` for all `j` when `s + n ≤ q`) is exactly right: the only admissible `j` is `q − 1`
  with `s + n = q`, and the two binomial terms then cancel. **Corrected in the published version**, which prints
  `(q − 1) | j`.
* **E3** (Remark 1.2.5, the displayed upper bound): "dim_{w} Z_w ≤ d'_w" should be `dim_k Z_w ≤ d'_w`; the paper
  writes `dim_k` everywhere else, and `dim_w` is not defined. **Still present in the published version.**

No erratum exists: arXiv 2205.09929 has versions v1 and v2 only, and the Cambridge Core article carries none.

## Independent review (`REV-PAPER-CHANG-CHEN-MISHIBA-23`, issue #1381)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept**, both routes accepted, all three
findings confirmed, **one finding added**. The full review is in
[`reviews/REV-PAPER-CHANG-CHEN-MISHIBA-23.md`](../reviews/REV-PAPER-CHANG-CHEN-MISHIBA-23.md).

The recorded e-print hash matches byte for byte, and recording no hash for the Cambridge PDF is right:
Cambridge Core watermarks each download, so no such hash is reproducible. The numbering needed care —
every statement environment hangs on the `equation` counter with `\numberwithin{equation}{subsection}`, so
numbered displays consume numbers too. A display-aware simulation gives **43 numbered statements** and
reproduces the extraction's numbers exactly, including the appendix's A.1.1–A.3.8 once `\appendix` is
handled. **Coverage is complete.** The dual numbering the extraction carries (preprint by subsection,
published by section) was checked in the published text for Theorem 1.5, Remark 1.6, Proposition A.1,
Theorem A.5 and Theorem A.7; carrying both numbers in every locator is what makes the file checkable
against either version. The `library` item's four declarations exist at pinned Mathlib `082e2d3`, and all
cited layers exist. The Part II reproduces its parent's title verbatim and is a joined proposal with
`PAPER-NGODAC-21` and `PAPER-IM-KIM-LE-ETAL-24`.

All three findings are confirmed verbatim and each is settled by the paper against itself: `S^ζ_d(s)`
defined with exponent `d` beside `S^{Li}_d(s)` with exponent `s`; the condition `(q−1) | k` where `k` is
the function field and the divisibility belongs on the index `j`; and `dim_w Z_w` where every other
statement writes `dim_k`.

**One finding added (E4).** An audit of all **89** `<word>~\ref{…}` citations against the target
environment found two mismatches. The one that survives into the version of record is E4 — the appendix
proof says "It follows by **Theorem A.4**" of a statement printed "**Proposition A.4**", which §1.3 cites
correctly. The other is preprint-only (§1.3's "See Theorem …" for Proposition 2.3.5, reworded to
"stated as Proposition 2.7" in the published version), so it is recorded in the review rather than as a
finding. No duplicate labels, no undefined references.
