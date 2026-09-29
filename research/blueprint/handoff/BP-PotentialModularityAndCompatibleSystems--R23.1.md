# BP-PotentialModularityAndCompatibleSystems--R23.1: checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #976; the bot confirmed the claim. **Status: partial.**
- R23.1, R23.4, R23.5, R23.6, R24.1 and R24.2 are `source_decomposed`.
- R23.3 is `partial`.
- R23.2 is `not_read`.

## What this checkpoint did

1. **Used the unreviewed draft EXT-12 as a lead.** Its 34 nodes cover R23.1–R24.3. This checkpoint carries 15 of them
   (R23.1: 10; R23.3: the two KW nodes; R24.1: 2; R24.2: 1).
   - **Excerpts:** every one was re-verified against copies whose sha256 matches the draft's records (Moret-Bailly I, II;
     KW II; KW Annals). A NFKC skeleton match regenerated those whose text layers differ. Taylor 2002's damaged text
     layer contains the same words as the transcribed quotations.
   - **Statements:** spot-checked against Moret-Bailly §1 (1.1–1.5, and Σ ≠ ∅) and KW II §§6 and 10.
   - **Format:** the nodes were converted to blueprint form, with prerequisites from the draft's links and API and tests
     for the definition and the two constructions.
2. **Did not duplicate.** Two draft nodes are dropped: the global rings of §10.1 (GlobalGaloisDeformations R04.6) and
   the local rings with nonemptiness (LocalGaloisDeformationRings R08.6). The draft's R24.3 nodes are superseded by part
   R24.3 (#3864).
3. **Added four nodes:**
   - the deduction of Taylor's Theorem G from Moret-Bailly, which closes the draft's gap;
   - potential modularity of a given lift (R23.4);
   - control of the extension (R23.5);
   - exports and noncircularity (R23.6).

   None of R23.4–R23.6 cites R24, so the stage order holds.
4. **Deferred** Taylor's moduli problem (R23.2) and his potential-modularity theorems (4 R23.3 nodes). The 2000
   preprint's text layer loses ligatures and Greek letters, so these must be checked on the page images.

## Source issues

- **E2:** KW II p. 91 cites "part (c) of Theorem 6.1" for part (iii) b).
- **E3:** Moret-Bailly II p. 192 prints "LEMME 3.30.2" for 3.10.2.

Both were verified here (the draft had noted them).

**A correction to part R24.3 (#3864) found here.** KW Annals' "[27]" is Khare–Ramakrishna, *Finiteness of Selmer groups
and deformation rings*, Invent. Math. 154 (2003) 179–198, not Khare's paper with Böckle's appendix ([26]). Part R24.3's
`kw-annals-minimal-lifts` says "Khare's Inventiones 154 (2003) paper" for the §5.2 Remark. A checkpoint of #977 should
correct it.

## Requests (6)

- AlgebraicModuliForArithmeticGeometry R09.3;
- AutomorphicGaloisRepresentations R19.6;
- DeformationAndDerivedPatchingAlgebra R03.4;
- GL2AutomorphicRepresentationsAndTransfer R17.4 and R17.5;
- OrdinaryAutomorphicFormsAndModularityLifting R21.6.

## Lean

`suggested/PotentialModularityAndCompatibleSystems--R23.1.lean` imports Mathlib only. It checks:
- the fibre dimensions d + 1 − g − z in the curve case;
- the bound 2g + z − 1;
- tame killing at 7;
- the 4|S| − 1 framing variables;
- Proposition 4.5's dimension count.

It compiles with 0 errors, 0 warnings and no `sorry`.

## What a continuation should do

1. **Carry the draft's R23.2 (8) and remaining R23.3 (4) Taylor nodes,** re-verifying the excerpts on page images of
   `virtualmath1.stanford.edu/~rltaylor/fm.pdf` (sha e00ebd5…) and the Documenta 2006 paper (EMS Press, sha 6ec26bf…).
2. **Fix part R24.3's attribution** of the §5.2 Remark (issue #977).
