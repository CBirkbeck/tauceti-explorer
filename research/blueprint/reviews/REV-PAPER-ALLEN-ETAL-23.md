# Review of PAPER-ALLEN-ETAL-23

**Job** REV-PAPER-ALLEN-ETAL-23 (issue #1094) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All thirteen routes accepted; the sources, the numbering claim
and the locators verified; a sample of the 108 findings checked against the text; nothing corrected,
rejected or deleted.

Paper: Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James
Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, *Potential automorphy over CM fields*,
[Ann. of Math. (2) **197** (2023), 897–1113](https://doi.org/10.4007/annals.2023.197.3.2).

At 330 items with **108 recorded mistakes** over 217 pages, this is the largest extraction in the
corpus by both measures.

## The sources, and the numbering claim

All three hashes reproduce: the published PDF the extraction read (from the author's page,
`c5429e4f…`), the arXiv v2 PDF (`7c882c4d…`) and the arXiv v2 TeX (`94711e86…`).

The source block makes a claim that matters well beyond this paper: **the published numbering runs
one ahead of arXiv v2 from §2.2 on**, because print numbers displays and statements in one counter.
I checked its two examples and both are exact:

- arXiv v2 **Lemma 2.2.3** ("Let R be a (possibly non-commutative) Z-algebra, let C• ∈ D(R) …") is
  the published **Lemma 2.2.4**, word for word;
- arXiv v2 **Lemma 6.2.25** ("We assume that our deformation problem S and T ⊆ S satisfy the
  following … T is a disjoint union S_p ⊔ R ⊔ S_a") is the published **Lemma 6.2.26** — and arXiv v2
  has its own 6.2.26 with different text, so this is a genuine shift and not a coincidence.

Any extraction elsewhere in the atlas that cites v2 numbers for this paper is therefore off by one
in places, exactly as the source block warns. That warning is worth propagating.

## Locators

Of the 324 checks, **252 land on exactly the page given**. The other 72 are not errors: this
extraction's locators point at **where the cited content is**, not at the statement's label —
"proof of Proposition 3.2.2, p. 959" where the statement is on 958, "after Theorem 4.2.1, p. 969"
where the theorem is on 968, "paragraphs after Corollary 6.5.5, (6.5.6), (6.5.7), pp. 1064–1065"
where the corollary is on 1063.

I read the two that looked doubtful, and both are right:

- item 68, "Theorem 2.3.3, p. 936": the theorem begins at the foot of p. 935 and its parts (a)–(c),
  which the item is about, are on p. 936;
- item 214, "Lemma 6.2.27(2), p. 1043": the lemma begins at the foot of p. 1042 and part (2), which
  the item is about, is on p. 1043.

## Structure

All stages named by the twelve source routes exist in `data/atlas.json`; all **93** distinct planned
layer ids exist; the 78 missing items are routed exactly once, with no duplicates. The single
library item cites `NumberField.IsCMField`, `NumberField.IsTotallyReal` and
`NumberField.maximalRealSubfield`, all present at the pinned commit. The Part II route is
well-formed: its title reproduces the parent's atlas title exactly ("Integral Hecke actions,
determinants and interpolation"), its area `langlands` **is** a galaxy id, and its brief is 649
words.

## The 108 findings

Checking 108 findings individually is not something a review can do honestly, so I sampled: the
**fifteen** that reach a stated result or a proof, and within those the two sharpest were verified
against the printed text.

- **E23 (gap, a stated result)** holds. Theorem 2.4.11 on p. 951 states its hypotheses — a highest
  weight with a non-existence condition on cuspidal automorphic representations, a maximal ideal in
  the support, ρ̄ a sum of irreducibles — and **carries no hypothesis that F contains an imaginary
  quadratic field**. Theorem 2.3.3 on p. 935, the source of the Galois representations its proof
  uses on p. 953, begins "Suppose that F contains an imaginary quadratic field." The finding's
  repair — add the hypothesis, or give another source for the representations attached to U(m,m) —
  is the right one.
- **E100 (error, a stated result)** holds. Lemma 7.1.8(2) on p. 1091 reads "Suppose that K is a
  number field in which l is unramified and that r : G_K → GL_2(Z_l) is a crystalline representation
  with Hodge–Tate numbers {0,1}…", with **no l > 2**, exactly as the finding says; and the finding is
  careful to note that for l = 3 the conclusion still holds by a separate argument.

The rest of the sample is the same kind of work: a missing hypothesis (E33, E39, E60, E90, E106), an
index range that does not say what the proof needs (E35, E62), or a step that does not follow as
written (E25, E49, E58, E67, E74, E105), each with a specific repair. The reaches are recorded
honestly — 87 of the 108 are misprints affecting nothing.

## What this review did not do

- I did not verify all 108 findings, and I did not re-read the 217 pages. What is checked is stated
  above.
- The sixteen prerequisites were read only as this paper cites them.
- No Lean file was written or compiled; the only library claim is the three citations above.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ALLEN-ETAL-23.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
