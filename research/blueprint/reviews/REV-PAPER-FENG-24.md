# Review of PAPER-FENG-24

**Job** REV-PAPER-FENG-24 (issue #1355) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All four routes accepted; all seven `sourceIssues` confirmed; no
correction needed.

Paper: Tony Feng, with an appendix by Tony Feng and Gus Lonergan, *Smith theory and cyclic base
change functoriality*, [Forum of Mathematics, Pi **12** (2024)](https://doi.org/10.1017/fmp.2023.32).

## Source

The recorded arXiv v6 e-print hash reproduces byte for byte —
`9b813ef62f781c49163ff3930129c72c2b983134f15fb42a6f6f2d497ad9210d` — and the archive holds the
recorded `Smith_base_change.tex`, 3549 lines, which I read. All seven findings are in that text, so
the statement-by-statement agreement between the published and preprint numbering that the extraction
records is not load-bearing for them; I checked it independently at the places the findings use.

## Structure

107 items: 89 missing, 15 planned, 3 library. Four routes — one new roadmap, two Part II, one source.
Every missing item is routed exactly once, all four source stage ids resolve, all 15 planned ids
resolve, and `check_paper.py` passes.

| route | kind | roadmap | area | items |
| --- | --- | --- | --- | --- |
| 1 | new | `SheafTheoreticSmithTheory` | `geomlanglands` | 40 |
| 2 | Part II of `GlobalShtukasAndFunctionFieldLanglands` | `ShtukaTateCohomologyAndGlobalBaseChange` | `functionfields` | 23 |
| 3 | Part II of `SmoothRepresentationsOfLocalGroups` | `ModPBernsteinCentersAndLocalBaseChange` | `langlands` | 26 |
| 4 | source | `GS.1`, `GS.2`, `GS.4`, `GS.5` | — | 8 |

Both Part II titles reproduce their parents' atlas titles exactly, all three areas are galaxy ids,
and the new roadmap's id is free — it appears in neither `data/atlas.json` nor
`research/blueprint/roadmaps/` nor `reserved-ids.json`.

**The three-way split is the substantive judgement and it is right.** Sheaf-theoretic Smith theory,
the Tate construction on constructible sheaves, parity sheaves in the Satake category and the base
change functor built from them have no home in the atlas and become a new roadmap; the global and
local applications extend two existing roadmaps whose parents own exactly the theory the paper
consumes; and the eight items that belong to the shtuka roadmap itself go back to it as a source
route rather than being absorbed into the Part II, which is what §15 asks for.

**Library.** All 15 declarations resolve: Mathlib's `tateCohomology`, `Rep.tateNorm`,
`TateCohomology.δ`, `exact₁` and `exact₃`, `WittVector` with `frobenius`, `teichmuller` and
`isDiscreteValuationRing`, `MonoidAlgebra`, `Module.Flat` and `Module.free_of_flat_of_isLocalRing`,
and Tau Ceti's `TateCohomology.H0IsoNormQuotient`, `HNegOneIsoNormKernelQuotient` and
`Rep.FiniteCyclicGroup.periodicIso`.

**Locators.** I rebuilt the paper's numbering from its thirteen `\newtheorem` declarations, all
sharing one counter, with the appendix relettered. **104 of the 105 statement references resolve to a
statement of exactly the cited kind and number.** The one that does not, item 74's `Theorem 5.2`, is
labelled in its own locator "quoted from Kaletha–Prasad Theorem 5.2.1". The reconstruction also
confirms the numbering the findings rely on: `B.1` is a Proposition, `B.3` a Lemma, `5.5` a
Definition, `6.3` a Proposition, `6.27` a Remark. No locator error.

## The seven findings

All confirmed verbatim in the source. Three are settled by the paper contradicting itself within a
line or two.

**E1.** "Let `E_v/F_v` be a finite Galois **assumption** such that `Gal(E_v/F_v)` has order coprime to
`ℓ`" — two sentences earlier, in the paragraph this subsection continues, the same object is
introduced as "a finite Galois **extension**".

**E2.** "`Z_F = Z_H(S_H)`", one clause after "`Z_E := Z_G(S_G)`". I counted the occurrences of the
symbol `S_H` in the whole file: there is exactly one, this one. It is never defined, and the torus
just introduced is `S_F`.

**E7.** "Proposition `\ref{B: eichler-shimura}`", twice, where the label sits on `\begin{lemma}`. The
counter reconstruction confirms the rest of the finding's reasoning: `B.1` is the Proposition (Xue's
Eichler–Shimura relation for ordinary cohomology) and `B.3` the Lemma, its Tate-cohomology analogue,
which is the statement §B.3 needs. Only the word is wrong.

**E5 and E6 are missing words.** "It is evident from the definition that `Z(Br)` through the
quotient …" has no verb, and the sentence after it composes `Z(Br)` with the Tate diagonal, which is
what factoring through that quotient licenses. "We say will be called *automorphic* if …" has no
subject; the preceding paragraph of the same definition gives the parallel clause in full.

**E3 and E4 are index slips inside one proof.** "the Cartan decomposition implies that double cosets
`U_0 \ G_v / U_0` are represented by `z ∈ 𝒵_F`" — everything in that sentence lives in `H_v`
(`U_0 ⊃ H(F_v)_{x,0}`, `𝒵_F ⊂ Z_F(F_v) ⊂ H(F_v)`), the Cartan decomposition quoted in §6.2.2 is the
one for `H(F_v)`, and the proposition being proved concerns `U_r \ H_v / U_r → K_r \ G_v / K_r`; it
is the *next* sentence, `K_0z_1K_0 = K_0z_2K_0`, where `G_v` enters (E3). And "`Gal(E_r/F_r)`",
twice in one sentence, for fields that occur nowhere in the paper — the group meant is
`Gal(E_v/F_v)`, and the subscript has been copied from `K_r` (E4).

All seven are correctly graded `affects: nothing`.

## One provenance gap, not filled

No `libraryPins` are recorded, so there is no commit against which the 15 declarations were checked.
I verified them against the index this lane uses and they are there. This is the **sixth** extraction
reviewed today with that gap — after `PAPER-BHATT-MATHEW-23`, `PAPER-WOOD-19`,
`PAPER-HACON-WITASZEK-23`, `PAPER-CANNING-LARSON-PAYNE-24` and `PAPER-IM-KIM-LE-ETAL-24` — and six in
one day is a queue-level omission rather than six independent oversights.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-FENG-24.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-FENG-24.result.json research/blueprint/papers/PAPER-FENG-24.review.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
