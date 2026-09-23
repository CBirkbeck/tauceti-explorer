# Review of PAPER-BREUIL-ETAL-23

**Job** REV-PAPER-BREUIL-ETAL-23 (issue #1242) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All three routes accepted; the single `sourceIssue` confirmed;
three corrections made in place.

Paper: Christophe Breuil, Florian Herzig, Yongquan Hu, Stefano Morra and Benjamin Schraen,
*Gelfand–Kirillov dimension and mod p cohomology for GL₂*,
[Inventiones mathematicae **234** (2023), 1–128](https://doi.org/10.1007/s00222-023-01202-8), read in
[arXiv:2009.03127v7](https://arxiv.org/abs/2009.03127) (112 pages, 9 June 2023, marked final), whose
recorded hash reproduces byte for byte:
`8f06c68bbb85aa3d13420181197167b3ce9158dc117e96da6299718765f99e7a`. The second checkpoint's correction
of the version label from v4 to v7 is right — the file at that hash is v7. The published Inventiones
text is paywalled and was not compared, as the extraction records.

Extraction by Claude Code, sessions `cc-442dc5` and `cc-d67081` (issue #1241); different sessions from
mine, as the job requires.

## Coverage

I extracted every numbered label (`Theorem`/`Proposition`/`Lemma`/`Corollary`/`Definition`/`Remark`/
`Conjecture` *N.N.N*) from the source: **142 distinct ones**. All but one appear in an item locator or
name. The exception, "Theorem 14.8", is a citation to Breuil–Paškūnas inside the proof of Lemma 6.3.7
("see Theorem 14.8 in loc. cit."), not a statement of this paper. So every numbered statement of the
paper is carried into the extraction.

The introduction's theorems are all present with their body attributions, and I checked each
attribution against the source: 1.4 = Theorem 6.4.7, 1.5 = Proposition 6.4.6, 1.6 = Corollary 5.3.5,
1.7 = Corollary 7.3.4, 1.8 = **Theorem** 8.3.9 (see the finding), 1.9 = Theorem 8.4.2,
1.10 = Theorem 8.4.1.

## Statements: two corrections

I read the printed statements of Corollary 5.3.5, Proposition 6.4.6, Theorem 6.4.7, Lemma 8.3.8,
Corollary 8.3.10, Theorem 8.3.11, Theorem 8.4.3 and Lemma 3.3.1 against their items. Six are faithful,
in places verbatim. Two were not.

**`iwahori-mult-one`** stated the hypothesis as "(i) and (ii) of **Theorem 6.4.7**". The paper's
Theorem 1.5 — which this item is — cites (i) and (ii) of **Theorem 1.4**, and those are different
conditions: Theorem 1.4(i) asks for an isomorphism `π^{K₁} ≅ D₀(r̄_v^∨)^{⊕r}` of `GL₂(k)`-representations,
while Theorem 6.4.7(i) asks only that `JH(soc_K π) = W(ρ̄)` up to multiplicity. The extraction's own
`local-gk` item says correctly that 1.4 is the special case of 6.4.7, so the two items contradicted each
other. **Corrected to Theorem 1.4**, with the reason recorded in the item note.

**`graded-iwahori`** said only that the graded ring "is computed explicitly (Theorem 5.3.4); it is not
commutative, since `I₁/Z₁` is not uniform". That is a description, not a statement a blueprint can
consume, and what is consumed downstream is definite: `gk-bound` lists this item among its
prerequisites, and Corollary 5.3.5's proof uses the Auslander-regularity, the central regular sequence
`(h₀, …, h_{f−1})` and the identification of the quotient with a polynomial ring in `2f` variables.
**Transcribed Theorem 5.3.4's actual content**, keeping the non-commutativity remark.

## The finding, and a third correction

**E1 is confirmed**, and the paper settles it against itself: the introduction prints
"Theorem 1.8 (**Corollary** 8.3.9)", while p. 101 carries "**Theorem** 8.3.9." and the only corollary in
that neighbourhood is Corollary 8.3.10; the introduction itself says three pages earlier that the result
"is ultimately proven in **Theorem** 8.3.9", and §8.3 refers to "the proof of Theorem 8.3.9". No
statement in the paper is numbered Corollary 8.3.9.

The same mislabel is repeated **inside the extraction**: route 3's brief listed the final theorems as
"Corollaries 8.3.9, 8.4.4, 8.4.6, 8.5.1 and Theorems 8.4.1–8.4.2". I checked the labels — 8.4.4, 8.4.6
and 8.5.1 are corollaries, 8.4.1 and 8.4.2 are theorems — and **moved 8.3.9 to the Theorems list**.

## Structure

110 items, all `missing`, each routed exactly once; 3 routes, one `new` and two Part II. Both Part II
titles reproduce their parents' atlas titles exactly (including the Title Case the atlas itself carries
for `HilbertModularVarietiesAndShimuraCurves`), all three areas are galaxy ids, and all three roadmap
ids are free in `data/atlas.json`.

**One cross-extraction inconsistency, left for the design job.** The `new` roadmap
`ModpRepresentationsOfGL2OverLocalFields` is co-proposed by `PAPER-COLMEZ-DOSPINESCU-NIZIOL-23` with the
same id and the same title, which this route's reason and brief both acknowledge ("so both papers feed
one roadmap"). But the two give it **different areas**: `langlands` here, `representations` there. Both
are galaxy ids, so neither route is wrong on its own; one roadmap cannot sit in two galaxies, and
neither brief reconciles them. I have changed neither, since the choice belongs to the design job that
merges the briefs. On the content — Gelfand–Kirillov dimension, Iwasawa algebras, blocks, admissible
representations, and on the Colmez–Dospinescu–Nizioł side finiteness conditions and the ordinary part —
`representations` is the better fit.

## Two observations about the census

Neither is a defect, but a design job should know both.

- **There are no `library` and no `planned` items at all.** I checked the pinned libraries for the
  obvious candidates and the all-`missing` census holds: the declaration index at Mathlib `082e2d3` and
  Tau Ceti `f790474` has no Gelfand–Kirillov dimension, no Lazard theory of uniform pro-`p` groups, and
  no Weierstrass preparation for power series over a complete DVR — which is what the proof of
  Lemma 3.3.1 actually uses. Nothing here is already formalised. (With no library citations there is
  nothing for a `libraryPins` block to pin, so I did not add one.)
- **Atlas layers are named in the briefs rather than on the items.** The job asks that an item planned by
  a layer name that layer; this extraction instead records its imports route-by-route — completed group
  algebras from `PadicMeasuresIwasawaAlgebras`, smooth representations from
  `SmoothRepresentationsOfLocalGroups`, Kisin modules from
  `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, patching algebra from
  `DeformationAndDerivedPatchingAlgebra`, global deformation rings from `GlobalGaloisDeformations`. The
  imports are the right ones; the consequence is that the design jobs must read the briefs to find them.

## What this review did not do

I did not read all 112 pages line by line: I read the introduction in full, the statements named above
with their surrounding argument, and the section structure. I did not compare the published Inventiones
text. I add no finding of my own beyond the two item corrections and the brief correction above.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-BREUIL-ETAL-23.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BREUIL-ETAL-23.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BREUIL-ETAL-23.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
