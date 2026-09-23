# Review of PAPER-CHENEVIER-TAIBI-20

**Job** REV-PAPER-CHENEVIER-TAIBI-20 (issue #1453) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All twelve routes accepted; all eleven `sourceIssues` confirmed;
nothing corrected, rejected or deleted.

Paper: Gaëtan Chenevier and Olivier Taïbi, *Discrete series multiplicities for classical groups over
ℤ and level 1 algebraic cusp forms*,
[Publ. Math. IHÉS **131** (2020), 261–323](https://doi.org/10.1007/s10240-020-00115-z) (open
access), whose recorded hash reproduces as
`ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de`.

## How this one had to be reviewed

Most of the recorded findings are claims about the authors' **computations**, not about their prose:
counts of elements in a search, the value attached to one archimedean parameter, the range of
dimensions in a list, the parameters of a run. Confirming those from the paper alone is impossible,
so I fetched the primary material the bibliography points to — the data and source archive
`levelone_src_data.tar.gz` from `otaibi.perso.math.cnrs.fr/levelone/` — and the arXiv TeX of
1907.08783. Every one of the eleven findings then checks out against `log_w23_mult1`,
`contradict_vect/db_w23_mult1`, `gp/sheet_w23_grh.gp`, `gp/qfminim_trie.gp`, `gp/testfin.gp` or
`mot23.tex`. One finding I checked by writing my own program instead.

## Structure

151 items: 134 missing, 12 planned, 5 library. Every missing item is routed exactly once, all eleven
source stage ids exist, all twelve planned layer ids exist, and `scripts/check_paper.py` passes. All
twelve declarations behind the five library items resolve at the pins — `Matrix.symplecticGroup`,
Tau Ceti's `specialOrthogonalGroup` and `orthogonalGroup`, Kronecker's theorem as
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, the three `CliffordAlgebra` spinor-norm
declarations, the two cyclotomic evaluation lemmas, and the three Deligne Γ-factor declarations.

**Locators.** 63 of 65 name-and-page checks land on exactly the page given; the two others are E4's,
where Theorem 3 and Proposition 4.1 are stated on p.295 and proved from p.296.

**The new roadmap.** `LevelOneAutomorphicFormsForClassicalGroups` has a 1069-word brief stating
Theorems 1–7 as the paper does, the area `automorphic` is a galaxy id, and the id appears in no other
extraction. I searched every layer description in the atlas for level one forms and Siegel modular
forms: the only hits are the Tau Ceti `ModularForms` roadmap's SL₂ material and unrelated "level"
terminology in `BelyiMaps`. Nothing owns this direction, so a new roadmap rather than a Part II is
right.

## The eleven findings

**E1 — I recomputed it.** Definition 3.1 makes `P(G)` the degree-`n_G` products of cyclotomic
polynomials in which `X+1` has even multiplicity, and `∼` is `P(X) ∼ (−1)^{n_G}P(−X)`, which on
multisets swaps `Φ₁ ↔ Φ₂` and `Φ_n ↔ Φ_{2n}` for odd `n ≥ 3` and fixes `Φ_n` for `4 | n`. Counting
multisets of total degree 14 gives 2257, of which 59 are fixed, so there are `(2257+59)/2 = 1158`
classes. The same program reproduces **every other entry** of Table 2 on p.288 — 3, 12, 32, 92, 219,
530 and 2521 — and differs only at `Sp₁₄`, where the table and both sentences on p.293 print 1157.

**E4, E5, E6, E7, E8 — from the authors' own files.**

- `log_w23_mult1` records `#lw23` as `%13 = 12293` for `liste_qfminim(9.74, 23, 1)`, and
  `db_w23_mult1` has exactly 12293 lines: 12106 with a negative value and **187** without. So p.296's
  "an explicit set `U₁` with 12230 elements" is a transposition, and "12293 − 187 = 12106" is right.
- Those 187 are the unresolved elements of the `δ = m = 1` run, i.e. of `U₁`, not of `U₂` (`U₂` is a
  different file, `db_w23_mult2`) — E5. Exactly six of them contain `I₂₃` only once, which is the
  "six multiplicity free" ones the same sentence mentions.
- The entry for `U_(1) = I₁+I₇+I₁₃+I₁₇+I₂₁+2I₂₃` is `[0, 0, 1, 7, 13, 17, 21, 23, 23]` with value
  **+0.036042** at `ℓ = 6.5`: non-negative, so the `δ = m = 1` computation does **not** exclude it —
  E6. The GRH worksheet then opens with "First eliminate the U of Prop. 4.1 (1) with multiplicity >1"
  on exactly that vector, which is what the proof needs.
- The remaining **181** — those with `I₂₃` at least twice — are the set `V` of Proposition 4.1(2), and
  their dimensions run from **10** (e.g. `I₅+I₁₁+I₁₉+2I₂₃`) to **38**, not the printed 14 to 42 — E7.
- The worksheet runs `testfin_liste(li, …, 2, pc[1..26], 1, 3)` and prints `testtovec(·, 0, 2)`;
  `CFnorm(test,l,m) = CFnorminit(testtovec(test, m==1, m), l)` sets `δ = 0` whenever `m ≠ 1`, so
  "δ = m = 2" should be `δ = 0, m = 2` — E8.

**E2 and E10 — from `ex_poids_connus()`.** That table has 26 entries, one of which, `[[0,0,23], 2]`,
carries multiplicity two: 27 known elements, 26 parameters, which is footnote 13's `|S| = 26`. Its
explanation should cite `dim S₂₄(SL₂(ℤ)) = 2`; `S₂₃(SL₂(ℤ))` is zero, the weight being odd — E2. The
same collapse makes the "set `S` of 15 elements of `Π_alg` having motivic weight ≤ 23 and dimension
≤ 4" a set of 15 *parameters* and 16 elements — E10; I listed them from the table.

**E3 — from the definition the code uses.** Page 280's `ρ(e_l) = (1/√m_l) Σ_{i∈P_l} e_i` is indeed an
isometry for the standard Euclidean structures; what fails is the next claim,
`β^F_Q(ρx, ρy) = β^F_{Q′}(x, y)`. `CFnorminit` computes the diagonal term as `Σ_i v_i²/m_i`, so for
one block of size two the form is `((1−K, −K), (−K, 1−K))` while `β_{Q′}(x,x) = x²(1/2 − K)`, giving
`β_Q(ρe₁, ρe₁) = 1 − 2K = 2β_{Q′}(e₁, e₁)`. The right statement is
`β_Q(ρx, ρy) = β_{Q′}(Dx, Dy)` with `D = diag(√m_l)`, and since `μ_Q = 2μ_{Q′}` here the sign
conclusion drawn from Lemma 2.8 survives — which is what the correction says.

**E9 — a dimension count.** The proof of Theorem 5 ranges over multiplicity-free `U` with
`dim U ≤ 16`; self-dual `π` of even motivic weight are orthogonal, so odd dimensions `2g+1` are
counted through `Sp_{2g}`, and `2g+1 ≤ 15` needs `Sp_{2n}` up to `2n = 14`, not 8.

**E11 — visible in the TeX.** `mot23.tex` line 1358 cites the tail estimates as `\cite[(3)
p.127]{CheLan}` and line 2559 cites the same estimates as `\cite[(3) p. 277]{CheLan}`.

## What this review did not do

I read §§1–4 around the findings and the statements of every result the routes cite, not all 63 pages
line by line. I add no finding of my own. I did not re-run the authors' PARI/GP or Sage computations
end to end: I read their logs, certificate files and scripts, and recomputed only Table 2 and the
small linear algebra of E3 myself.
