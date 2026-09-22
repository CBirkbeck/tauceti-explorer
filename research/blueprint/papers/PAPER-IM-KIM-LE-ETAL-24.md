# PAPER-IM-KIM-LE-ETAL-24 — Zagier–Hoffman's conjectures in positive characteristic

Claude Code — session `cc-7b31c4`; issue #1358; read on 22 September 2026.

Bo-Hae Im, Hojin Kim, Khac Nhuan Le, Tuan Ngo Dac and Lan Huong Pham, *Zagier–Hoffman's conjectures in positive
characteristic*, Forum of Mathematics, Pi **12** (2024), `doi:10.1017/fmp.2024.18` (open access). Read in the
authors' public version, [arXiv:2205.07165v2](https://arxiv.org/abs/2205.07165v2) (10 June 2024, 60 pages, "the
details of proofs have been added") — in its **LaTeX source** (`AMZV_ZagierHoffman_arxiv_v2.tex`, source archive
sha256 `362cf73f…`), since `pdftotext` was unavailable here — together with the published text on Cambridge Core.

**On numbering.** The preprint leaves the introduction unnumbered, so its statements are numbered `0.k`; the
published version numbers the introduction as Section 1, shifting every section number by one (arXiv Remark 1.1 =
published Remark 2.1, arXiv Theorem 3.6 = published Theorem 4.6, and so on), verified statement by statement.
Theorems A and B keep their letters. Every locator gives the preprint number with the published number in
parentheses.

The paper has been extracted into **42 items**. One is in the pinned libraries, three are planned by existing
layers, and the remaining 38 are routed exactly once: **37 to a Part II** of *Drinfeld modules, t-motives and
characteristic-p special values* — the same Part II proposed by `PAPER-CHANG-CHEN-MISHIBA-23` — and **1** as a
source for that roadmap's stage DM.8.

## What the paper proves

Over `A = F_q[θ]` with `K = F_q(θ)`, `K_∞`, `C_∞` and `A_+` the monic polynomials, Thakur's multiple zeta values
are `ζ_A(s) = Σ a_1^{−s_1} ⋯ a_r^{−s_r}` over `a_i ∈ A_+` with `deg a_1 > ⋯ > deg a_r`, and Harada's *alternating*
values twist the summand by `ε_1^{deg a_1} ⋯ ε_r^{deg a_r}` for `ε ∈ (F_q^×)^r`. Write `Z_w` and `AZ_w` for the
`K`-spans in weight `w`.

* **Theorem A.** `dim_K AZ_w = s(w)`, where `s(w) = (q − 1)q^{w−1}` for `1 ≤ w < q`,
  `s(q) = (q − 1)(q^{q−1} − 1)` and `s(w) = (q − 1)Σ_{i=1}^{q−1} s(w−i) + s(w−q)` for `w > q`, with an explicit
  Hoffman-like basis. This has no counterpart in the literature and is, as the authors say, the harder of the two
  theorems.
* **Theorem B.** `T_w` — the values `ζ_A(s)` of weight `w` with `s_i ≤ q` for `i < r` and `s_r < q` — is a
  `K`-basis of `Z_w`; hence `dim_K Z_w = d(w)`, Todd's conjecture. This is Thakur's basis conjecture, proved
  independently and simultaneously by Chang, Chen and Mishiba.
* **Why alternating Carlitz polylogarithms.** Inside the theory of alternating multiple zeta values the algorithm
  of Ngo Dac gives only a *weak* Brown theorem — the generating set `AT_w` is too large to be a basis — because
  one can move forward but not backward, for lack of control on the coefficients. The paper therefore develops
  the algebraic theory of **alternating Carlitz multiple polylogarithms** `Li(ε; s)` (whose stuffle relations are
  simpler than the shuffle relations for `ζ_A`), obtains the same generating set `AT_w` for `AL_w`, and deduces
  the **bridge** `AZ_w = AL_w` (Theorem 4.9).
* **The three new ingredients.** (i) The Hoffman-like set `AS_w`, indexed by tuples with `q ∤ s_i`, of cardinality
  exactly `s(w)`; (ii) the **strong Brown theorem** (Theorem 1.11): `AS_w` generates `AL_w`, so
  `dim_K AL_w ≤ s(w)`; (iii) an improved linear-independence criterion (Theorem 2.4) which, from a relation in
  weight `w` and independence in lower weights, produces a controlled system of Frobenius difference equations.
* **The transcendental part.** Through dual `t`-motives and the ABP criterion, with a character-splitting lemma
  (Lemma 3.2) and a Kuan–Lin degree bound (Lemma 3.3), Theorem 3.4 determines *all* `K`-linear relations between
  ACMPL values: a non-trivial relation forces `(q − 1) | w`, and then there is exactly one. Theorem 3.6 concludes
  that `AS_w` is a basis of `AL_w`; the bridge gives Theorem A, and restricting to non-alternating indices gives
  the lower bound `dim_K Z_w ≥ d(w)` (Proposition 4.10) and hence Theorem B.
* **What the direct route gives.** Section 4.3 records the ad hoc arguments inside the AMZV theory: they give
  `dim_K AZ_w ≤ s(w)` for `w ≤ 2q − 2` and `≥ s(w)` for `w ≤ 3q − 3`, and the authors explain exactly where they
  break down — the best justification for the detour through ACMPLs.

## What the atlas already has

The reconnaissance is the same as for `PAPER-CHANG-CHEN-MISHIBA-23`, and the conclusion is the same.
`DrinfeldModulesAndTModules` plans the Ore ring and Drinfeld modules with the Carlitz module (DM.0), analytic
uniformisation and the period (DM.2), Anderson `t`-modules and effective `t`-motives (DM.4), Carlitz zeta values
and Goss/Taelman `L`-values (DM.6), and Papanikolas's Tannakian difference-Galois theory with Carlitz logarithms
(DM.8) — and stops at depth one. `PeriodsAndSpecialValues:PS.9` plans the classical multiple zeta values with
shuffle, stuffle, regularisation and the motivic basis/spanning results, which is where Zagier, Hoffman, Brown and
Deligne–Goncharov–Terasoma belong, including the classical alternating bound. Mathlib supplies `A`, `K`, `K_∞` and
the monic polynomials, and nothing else. Nothing anywhere plans multiple zeta values in characteristic `p`,
alternating or not, Carlitz polylogarithms, the `q`-shuffle or stuffle algebras, or the ABP criterion.

## The routes

### 1. Part II of *Drinfeld modules, t-motives and characteristic-p special values* — 37 items

`DrinfeldModulesAndTModulesPartII`, "…, Part II: multiple zeta values and Thakur's basis", area `functionfields`.
It plans Thakur's and Harada's values, Carlitz multiple polylogarithms and their alternating versions with the
power sums and Carlitz's identity, the combinatorics of tuples and arrays, the calculus of binary relations with
the operators `𝓑*` and `𝓒`, the weak and strong Brown theorems with `AT_w` and `AS_w`, the dual `t`-motive package
with the improved linear-independence criterion, the transcendental theorem on all relations between ACMPLs, and
the bridge with the two main theorems.

**This is deliberately the same Part II — same id, same title — that `PAPER-CHANG-CHEN-MISHIBA-23` proposes.** The
two papers prove Theorem B independently and at the same time (each acknowledges the other), and they share the
ABP criterion, the Frobenius difference systems, Carlitz's identity and the index sets; but each proves something
the other does not — the alternating dimensions here, the generating set of all `K`-linear relations there. The
brief asks the design job to plan the shared material once and then both routes, rather than creating two
roadmaps that would duplicate each other, which is what PROTOCOL section 15 requires.

### 2. Source for `DrinfeldModulesAndTModules` DM.8 — 1 item

The ABP criterion itself. DM.8 plans the Papanikolas theory that is built on it but does not state it; both this
paper and the Chang–Chen–Mishiba paper are sources for it, and both Part II routes import it.

## Prerequisites the atlas does not cover

Twelve entries. The ones that matter most: **Ngo Dac** (arXiv:2007.11060) for the algebraic part and the method;
**Harada** (arXiv:2004.07208) for the alternating values themselves; **Anderson–Brownawell–Papanikolas**
(arXiv:math/0207168) for the criterion; **Thakur**'s book and papers for the values, the shuffle relations and the
basis conjecture; **Chang** (arXiv:1207.4736) for Carlitz multiple polylogarithms and the Goncharov analogues;
**Chang–Chen–Mishiba** (arXiv:2205.09929), the simultaneous proof; **Todd** for the dimension conjecture;
**H.-J. Chen** for the shuffle formula; **Anderson–Thakur** for the period interpretation; **Papanikolas** for the
difference-Galois framework; **Lara Rodríguez–Thakur** for the relations behind the ad hoc sets; and
**Deligne–Goncharov**, **Terasoma** and **Brown** for the classical statements.

## Mistakes in the source

One misprint, recorded under `sourceIssues` and checked against the published text.

* **E1** (Section 0.2.2, the definition of the alternating multiple zeta values; published Section 1.2.2): the
  tuples are introduced as `𝔰 = (s_1, …, s_r) ∈ N^n` and `𝛆 = (ε_1, …, ε_r) ∈ (F_q^×)^n`, where the ambient sets
  must be `N^r` and `(F_q^×)^r` — the displayed tuples have `r` entries and the sum runs over `r`-tuples of monic
  polynomials; the letter `n` is not introduced there. The same objects are written correctly with exponent `r`
  in Section 0.3.2, where the alternating Carlitz multiple polylogarithms are defined. **Still present in the
  published version.** It affects nothing.

No erratum exists: arXiv 2205.07165 has versions v1 and v2 only, the Cambridge Core article carries none, and the
sequel (arXiv:2402.11539) does not correct this point.
