# Review of PAPER-LE-LEHUNG-LEVIN-ETAL-20

**Job** REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20 (issue #1403) · **Dates** 23 September 2026 (checkpoint and
completion) · Claude Code, session `cc-7b31c4` · **Verdict: accept.** All seven routes accepted; all
132 `sourceIssues` carry verdicts and all 132 are confirmed; one correction was made at the
checkpoint and none is needed now.

Paper: Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, *Serre weights and Breuil's
lattice conjecture in dimension three*,
[Forum of Mathematics, Pi **8** (2020), e5](https://doi.org/10.1017/fmp.2020.1), 135 pages.

This file replaces the checkpoint written when the first half of the job was submitted. The
structural section below is unchanged from it; everything from "The findings" on is new.

## Source

The recorded hash of the authors' copy of the published version reproduces as
`848f3b73d80dbfe24af8bf863207b2bd426b74851f3e13e95d8e89f152cbbec0`, and I re-extracted all 135 pages;
printed page numbers coincide with the PDF's.

The published PDF's fonts do not render mathematics into readable text in Tables 3–6, in the matrix
charts of §3.6.2 and in several displays of §§4–5. For those I also read the **arXiv v4 e-print**:
the PDF (`cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd`) and the LaTeX source from
the same submission, which settles every such quotation exactly. Where the two versions differ I say
so and take the published text as decisive — Lemma 5.1.6 is one such place, and the published text is
what confirms E83.

## Structure (from the checkpoint)

593 items (562 missing, 25 planned, 6 library). Every missing item is routed exactly once, all stage
ids of the five source routes exist, all 25 planned layer ids exist, both Part II parents exist and
both proposed titles reproduce their parents' atlas titles exactly, and `scripts/check_paper.py`
passes. All six library items' declarations resolve at the pins: `minimalPrimes`, Tau Ceti's `socle`
with `isSemisimpleModule_socle` and `le_socle_of_isSemisimpleModule`,
`Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`, `localCohomology` with `isoOfSameRadical`, and
`AlgebraicGeometry.tildeEquiv`.

**The one correction.** The `GenericGL3SerreWeightsAndLattices` route carried `"area": "modular"`,
which is the parent roadmap's atlas **group** and not a galaxy id; `PAPER-LE-LEHUNG-LEVIN-ETAL-23`,
which proposes the same roadmap id, uses `automorphic`. The area is now `automorphic`. The two files
still give that shared id different topic halves in the title — "generic GL3 weights and Breuil
lattices" here against "generic Breuil–Mézard, Serre weights and GL3 lattices" there — which the
design job will have to settle; the parent prefix matches in both.

**Locators.** Of 461 name-and-page checks, 401 land on exactly the page given once the paper's
small-caps theorem headers are normalised. I read a sample of the other 60 and they are right too:
they are deliberately precise rather than loose — "proof of Proposition 3.2.1, p.29" (statement on
p.28), "paragraph before Lemma 3.6.10, published p.58" (the lemma is on p.59), "proof of Theorem
4.2.1, Claim 2, published p.81". I found no locator error.

## The findings

All 132 are confirmed. For 113 the quoted `printed` text is located mechanically at its own locator
page in the published text. The other 19 are displays, matrix entries and symbol-heavy formulas that
the PDF's fonts do not extract, and every one of them is confirmed verbatim in the arXiv v4 source.

### Decided by internal contradiction

Several findings need no outside input at all, because the paper prints the same thing twice and the
two printings disagree.

- **E08.** Table 3 gives the `βα` row with first relation `c11c33 = 0`; Table 3 (continued) reprints
  the identical matrix with `c11c32 = 0`. Reducing that matrix mod `v` leaves
  `c11(c*31)^{-1}, c11c32, c13 / 0,0,0 / 0,0,c33`, whose only non-trivial constant `2×2` minor is
  `c11c33(c*31)^{-1}`; `c11c32 = 0` is strictly stronger and is not implied. The continuation is the
  misprint.
- **E06 and E07.** Table 3 prints the `αβ` matrix with `(1,1)` entry `c13c12(c*32)^{-1}` and the
  fourth relation with a minus sign; the body of §3.6.2 prints `c31c12(c*32)^{-1}` and (3.14) prints
  the plus sign, the next line uses the plus sign again, and the component `c_(0,1)` listed in the
  same table row has the plus sign. Three against one.
- **E05.** The `αβα` chart's units are `c*31, c*22, c*13`; `c*33` is not a coordinate of it, and
  Table 4's matching primed row prints `c′*22`.
- **E64.** Table 5 attaches `ω_- = t_{ε′2}` to the rows landing in `C` and `E` and `t_{ε′1}` to those
  landing in `D` and `F`; Table 6 attaches the tensor factor `L(ε′1)` to `C` and `E` and `L(ε′2)` to
  `D` and `F`. Both halves of each table, exactly transposed.
- **E11.** In the case `αt_1`, `R̄/c_(ε1,1)` has coordinates `c22, c23, c32, d22` and three units, the
  primed chart has `c′21, d′21, c′23, c′31` and three units, and the printed change of variables
  assigns six of the seven pairs, leaving `c22` and `c′21` unmatched. With `c22 = c′21` the primed
  relation becomes exactly the negative of the unprimed one, so the two ideals agree.
- **E12.** In the case `αβt_1` the primed chart is the `αβα` one, which has `c′23` and no `d′23`, and
  `c′23` is the one coordinate the printed list leaves out.
- **E46.** §3.6.2's own computation in the case `t_1` gives
  `R̄/𝔴_0 = F[[c13,c21,c31,c32,…]]/(c13((a−c)c*22c31 − (b−c)c32c21))`, whose non-`c13` factor is the
  corrected form of the identity row's component, with `(b−c)` and not `(a−b)`.
- **E42, E78, E36, E38, E26.** Five reference slips, each contradicted within a paragraph or two: the
  same result cited as "Proposition" and then as "Lemma" (`lemma:weight-combinatorics`,
  `prop saturation 1`), a Theorem cited as a Proposition (`fixedpoints`), a Lemma cited as a
  Proposition (`reducetoss`), and a `\ref` to this paper's own Theorem 3.5.3 sitting inside a
  `\cite` to [LLHLM18].

### Two checks that improve on the record

**E24.** The finding's counterexample is `w̃ = t_{(1,0,0)}`; the identity does just as well and is
simpler. With `Σ_0` as in Definition 2.3.2 and `r` the alcove-label flip,
`Σ_1 = Σ_0 ∩ r(Σ_0) = {(0,0),(ε1,0),(ε2,0),(0,1),(ε1,1),(ε2,1)}`, six elements, while `1 ∈ W_a` and
`Adm(η)X⁰ ⊂ W_a t_η X⁰`, which is disjoint from `W_a X⁰`. So the printed equivalence fails already
at the identity, and restricting the remark to `W_a t_η X⁰(T)` is the right repair.

**E67.** The finding argues from one row of Table 5; the conclusion survives without choosing a row.
Computing the dot action `w̃ t_ν · x = w(x + pν + η) − η` on every row gives, in the `(α1, α2, α0)`
pairings,

    A = (0,p)×(0,p)×(0,p)      C = (0,p)×(p,2p)×(p,2p)     D = (p,2p)×(0,p)×(p,2p)
    E = (0,p)×(p,2p)×(2p,3p)   F = (p,2p)×(0,p)×(2p,3p)

and none of `C, D, E, F` shares a face with `A`: the reflection of `A` in the wall
`⟨·,α2^∨⟩ = p` has `α1`-pairing `α0 − p < 0`, so it is none of them. Lemma 4.2.6 identifies the `3f`
Jordan–Hölder factors of `gr_1 Q_1(μ)` as the `L(w̃·μ)` of exactly these rows, and by (4.8) `Q_1(λ)`
is injective among `p`-bounded modules, so each such factor is a nonsplit extension class. Whichever
three rows carry the `gr_1` constituents for a given `μ`, Proposition 4.2.9's "only if" fails.

### The substantial gaps and errors

`E04` is an error in a stated result and the theorem supplies its own counterexample: Theorem 3.5.3
says the number of components of `R̄^τ_ρ̄` is `#W?(ρ̄,τ)`, so that ring is zero whenever
`W?(ρ̄,τ) = ∅` — which a 1-generic `τ` permits — and then `R^τ_ρ̄ = 0` is not a domain.
`E02` is the same shape: as printed, Proposition 3.3.9's right-hand condition is satisfied by the
Kisin module of its own hypothesis, independently of `ρ̄′`.
`E57` mis-states the hypothesis `p ≥ 2(h−1)` as `2(h−1) ≤ p − 2` and then concludes that `ω_κ` is in
the lowest alcove; `E68` applies Lemma 4.2.2 to `Q_1(λ⁰)⊗L(pω_λ)`, whose highest weight pairs with
`α_0^∨` to at least `4p` and which is therefore not `p`-bounded; `E69` applies Lemma 4.2.6 to
constituents of `V_μ|_G`, which Lemma 4.2.5 makes only `(n−2)`-deep. `E05`, `E61`, `E52` and `E16`
are three assertions and one definition that are true but unproved or under-hypothesised, each with
an elementary repair. `E44` is the multiplicity convention: `e(·)` is defined only for `R_∞`-modules
in the fixed dimension `d`, and (3.5) applies it to `R̄^τ_ρ̄`, which is not one — the same convention
that §6(12) of this paper corrects in [LLHLM18].

### Scope of the verdicts

Sixteen findings — `E101`–`E125` with `E129`–`E132` — concern §6, the paper's own **addendum** to
[LLHLM18]. I read the whole of §6 on pp. 128–133 and confirmed that each item is printed as quoted
and that the recorded correction restates it faithfully. These are the authors correcting their own
earlier paper, so the finding is the report, and the `known` fields say so. Checking each item
against [LLHLM18] is outside what a reading of this paper can do; the findings' own reasons already
record that boundary and it should stay.

Five further findings rest on computations I did not reproduce: `E62` and `E63` (fourteen-row
recomputations of Tables 5 and 6), `E79` and `E81` (case analyses over the admissible set), and `E86`
(Gröbner bases over `F_101` and `F_1009`). For each, the verdict in the JSON says exactly which part
I verified independently — the internal inconsistency, the hypothesis actually in force, the shape of
the claim against Corollary 2.3.11 — and which part I am taking from the record.

## Two housekeeping points for the errata worker

**`E89` and `E90` are the same finding.** Both quote the sentence "If `M` is a Cohen–Macaulay sheaf
on `X_∞(τ_S)`, then `j_*j^*M = M` since the codimension of `Z` is two" from the proof of Theorem
5.2.3, and both correct "Cohen–Macaulay" to "maximal Cohen–Macaulay (of full support)". `E89`'s own
locator records that it was "found while re-checking item T58", which is how the duplicate arose.
They should be merged, keeping `E90`'s kind `misprint`, since the printed statement is false — for
`M = O_C` with `C` a component meeting another along a divisor inside `Z`, `depth M = 1` there — and
not merely unproved.

**`E58` and `E133` are the same bibliography entry**, once at its citation in §4.2.2 and once at the
reference list. The source reads `\bibitem[AM01]{Andersen-Kaneda} Henning~Haahr Andersen and Kaneda
Masaharu`, so the surname-first form became "K. Masaharu" in print. They should be merged, keeping
both locators.

**One grading remark, not a change.** `E31` is recorded as affecting nothing, although the equality
it corrects is false as printed: the middle set has the central character of `F(μ)` and
`JH(R̄_s(μ+η))` that of `F(μ+1̲)`, which differ for `p ≥ 5`. `E02` is recorded as affecting a stated
result for the same kind of defect. I left the field as the extraction has it, because `E31`'s own
text argues that the downstream use is unaffected, and note the tension here rather than changing it.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.review.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
