# Review of PAPER-NIKOLAUS-SCHOLZE-18

**Job** REV-PAPER-NIKOLAUS-SCHOLZE-18 (issue #2193) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All six routes accepted; all 25 `sourceIssues` confirmed; three
of them corrected in place; nothing rejected and no item deleted.

Paper: Thomas Nikolaus and Peter Scholze, *On topological cyclic homology*,
[Acta Math. **221** (2018), 203–409](https://doi.org/10.4310/ACTA.2018.v221.n2.a1), with the
[correction in Acta Math. 222 (2019), 215–218](https://doi.org/10.4310/ACTA.2019.v222.n1.a2);
arXiv [1707.01799](https://arxiv.org/abs/1707.01799).

Reviewed: `research/blueprint/papers/PAPER-NIKOLAUS-SCHOLZE-18.result.json` and its report. The
machine-readable verdict is `PAPER-NIKOLAUS-SCHOLZE-18.review.json` beside the extraction.

## What I read

All three documents the extraction names, and all three hashes came back the same:

- the open-access Acta PDF, 207 pages, sha256 `8b1856fa8faefa3efebd64580249aa6fbc0c918f69820bba01410ab0ef1eb8ef`;
- the Acta correction, sha256 `0b98fb63029a31324ad23504f584e3f414b03f4734ba63f49b943b0bd5f27944`;
- arXiv v2, sha256 `12b6cdbd0d8ebb506284bd13f183affe80e41cc8890fef5fa21c922c2f80cec3`.

For the six findings that come from the correction I went further than the correction's text and
read the **content stream** of its PDF, because the corrections there are typesetting fixes whose
point is invisible in a text dump — both sides of each "replace X by Y" print the same characters.
That is where two of the three in-place corrections below come from.

## Locators

**169 of 180 name-and-page checks land on exactly the page given**, counting every item and finding
whose locator names a numbered statement together with a printed page. The other eleven are all the
same, benign case: the locator points at a *proof* that begins on the next page after the statement.
I read each one and they are right — Lemma II.5.10 is stated on p. 276 and E7's misprint is in the
sentence before it on p. 275; Theorem II.5.13 is stated on p. 277 and E8's "r = 0" is in its proof
on p. 278; Example A.10 runs from p. 370 onto p. 371; Proposition B.15 is stated on p. 391 and E16
is in its proof on p. 392; Lemma B.12 is on p. 388 and display (20) on p. 389; Proposition III.3.6
is on p. 300 and E24's line is in its proof on p. 301; and item 87's "Theorem III.1.7 (proof),
p. 289" is exactly where the text reads "Now, we know (by [80]) HF_p → T_p(HF_p) … is an
equivalence".

## Items, statuses and routes

**No item is `library`, and that is right.** Neither library has spectra, stable ∞-categories or the
cyclic category at the pinned commits. The report's list of nearest declarations — Mathlib's
`tateCohomology`, quasicategories and `Localization.Monoidal`, Tau Ceti's two-periodicity for cyclic
groups — is offered as "nearest", not as coverage, which is the right treatment.

**All 32 planned items name layers that exist.** They use six distinct layer ids, all present in
`data/atlas.json`.

**The routing is complete and admissible.** 153 items are routed: the 130 missing ones exactly once
each, plus 23 planned ones named as items the paper is a good source for, which section 16 allows a
source route to do. All seven stages named by the five source routes exist, and
`RefinedTraceMethods`, `EnhancedDerivedSheaves`, `StableHomotopyKTheory` and
`KTheoryFiniteLocalFields` all have origin `campaign`, so none is a Tau Ceti roadmap being
re-planned.

**The Part II route is correctly formed.** `PowerOperationsAndSegalConjecture` is proposed as
"Homotopy foundations for algebraic K-theory, Part II: power operations and the Segal conjecture for
C_p"; the atlas's title for the parent `StableHomotopyKTheory` is exactly "Homotopy foundations for
algebraic K-theory", so the title has the form section 16 requires. The area `topology` is a galaxy
id. The brief is 486 words, states the final theorems as the paper states them — Theorem III.1.7,
Theorem IV.1.15 with Proposition IV.1.16, Theorem IV.1.21, Proposition IV.1.12, Theorem IV.3.7 —
and is careful to write the Steenrod shifts in their corrected form, `HF_p[2i(p−1)]`, flagging the
printed ones as the misprint recorded in E5. The reason for a Part II rather than new layers in the
parent is checkable and correct: nothing in the atlas plans the Steenrod algebra, the Adams spectral
sequence, extended powers or power operations.

## The 25 recorded mistakes

**Every one of the nineteen new findings was checked against the text, and all nineteen hold.** The
three that matter most:

- **E1 (error, reaching a stated result).** Proposition II.3.4 on p. 259 prints
  `Cyc Sp = Sp^{BT} ×_{∏_p Sp^{BC_{p^∞}}} ∏_p Cyc Sp_p`, and the identification is false: Definition
  II.1.6(i) builds `Cyc Sp` as a lax equalizer over `∏_p Sp^{BT}`, so each φ_p is T-equivariant,
  while `Cyc Sp_p` (II.1.6(ii)) only records a C_{p^∞}-equivariant map. The extraction's
  counterexample survives checking: for `X = KU` with trivial action the two fibres are
  `Ω^∞W_p^{hT}` and `Ω^∞W_p^{hC_{p^∞}}`, and since `KU^{tC_p}` is rational (the paper's own Example
  I.2.3(iii)) the second is `Ω^∞W_p`, while the Gysin sequence and the non-zero T-equivariant map
  `KU → KU^{tC_p}` keep the first from agreeing with it. The paper's **Remark II.1.3** says the same
  thing in the same words — the comparison functor "is fully faithful when restricted to the
  subcategory of p-complete and bounded below objects" — which is exactly the range where the
  identification is safe. The correction's replacement functor (through §II.6 and Lemma II.5.8) is
  the right one.
- **E2 (gap, the proof).** The proof of Theorem B.3 covers `C = Δ/T` by `U_t := C[t, t+1)`, quoted
  correctly. Monotone Z-equivariant maps force a simplex's image into a *closed* window of length
  one, so the half-open family misses simplices whose image spans it; the closed intervals the
  correction proposes do cover, and `C[a,b] ≅ Δ/[k]` is contractible. The theorem is true and the
  repair is the natural one.
- **E16 (gap, the proof).** The proof of Proposition B.15 appeals to "filtered colimits of pointed
  spaces", but its colimits are indexed by `N(Λ_∞^op)`, which the paper's own Corollary B.4 proves
  **sifted**, not filtered. The correction (weakly contractible, in particular sifted, diagrams in
  S_* are computed in S) is right.

The sixteen misprints are quoted verbatim and correctly diagnosed. A sample of what I confirmed in
the text: Theorem 1.2 omits "surjective" from the Dundas–Goodwillie–McCarthy hypothesis (E3);
Example I.2.3(iii) writes `(x−1)^p − 1` for the p-series of the multiplicative formal group law
(E4); Theorem IV.1.15 writes `HF_p[i(p−1)]` where the Steenrod power lands in `[2i(p−1)]` (E5);
Lemma II.2.11's proof writes `V^H = 0` in all three homotopy colimits where the group is `G` (E6);
"Proposition II.5.9" is a Lemma (E7); "r = 0" should be `r = 1`, since the formula it specialises is
stated for `r` coprime to `p` (E8); the transfer ideal lies in `R^0(X × BΣ_p)`, not `R^0(BΣ_p)`
(E9); `P^k_p` appears where `P^n_p` is meant (E10); `ũv = p` is written with a capital `V` (E11);
"(2) of Proposition A.15 and (1) of Corollary A.14" reverses the two — A.14 is the Proposition and
A.15 the Corollary (E12); `F_j` appears where `F_i` is meant (E13); Example A.10 says "the
endofunctor G" where the endofunctor is `R` and `G` is the functor being extended (E14); "Definition
A.14" should be Definition A.8, which is where left derivability is defined with numbered conditions
(E15); display (20) writes `Hom^surj` and the next clause defines `Hom^inj` (E17); Definition C.4's
Bousfield–Kan homotopy colimit is written with `X(i_n)` where the string runs `i_0 → … → i_n` (E18);
and "passing to the limit … this filtered limit" describes a directed colimit (E19).

**E24 was checked in both directions.** The online Acta text at p. 301 already reads "E = C^⊗_act"
and "using the pointwise tensor product", while arXiv v2 still reads "Day convolution" — so the
finding is about the printed and arXiv texts, as its locator says, and the online version is
corrected. The same holds for E25's "namley", which is still in arXiv v2 and is "namely" in the
online PDF.

### Three corrections made in place

1. **E21's list of subscripts had one wrong entry.** The correction lists, in order, p. 215 third
   display, p. 216 first, p. 217 first and second, p. 218 first and second, with subscripts
   **G, δ, f, G, G, f**; the extraction had `Nm_f` in the fourth slot. Read glyph by glyph from the
   correction's content stream.
2. **E20 and E21 described the scripts as lost; they are misplaced.** The correction's own rendering
   of the rejected form draws the superscript minus *before* "HC" and 9.2pt above the baseline, and
   the accepted one after "HC" at 4.8pt; the rejected `Nm` subscript is detached to the right and
   6.4pt below the baseline against 1.5pt. That is what "technical typesetting problems" in the
   correction's preamble means, and both `printed` fields now say so.
3. **E22's locator conflated two things.** The correction lists exactly five occurrences —
   p. 240 line −9 and p. 260 lines 7, 8, −15, −3, each `"[?]"` for `"[91]"` — plus the bibliography
   entry. Pages 281 and 284, also in the locator, are places where the *online* version cites the
   reference (as [19] after renumbering); the correction does not list them. The locator now
   separates the two.

The report `.md` carries the same three changes, so it and the result agree.

## What this review did not do

- I did not re-derive the paper's main theorems. The verification of E1 rests on the paper's own
  Definitions II.1.1 and II.1.6, Remark II.1.3 and Example I.2.3(iii); E2 and E16 on the arguments
  as printed and the paper's Corollary B.4.
- The twenty prerequisite papers were read only as this paper cites them; none of the twenty is
  already covered in `papers.json`.
- No Lean file was written or compiled, and no library claim beyond "no item is library" was made.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NIKOLAUS-SCHOLZE-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
