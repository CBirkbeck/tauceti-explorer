# BP-PotentialModularityAndCompatibleSystems--R23.1: checkpoint 3 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #976; the bot confirmed the claim. **Status: partial.**
- R23.1, R23.4, R23.5, R23.6, R24.1 and R24.2 are `source_decomposed`.
- R23.2 and R23.3 are `partial`.

## Checkpoint 3: Taylor 2006 §5 (6 nodes) and a correction

**Read** on the page images of the Documenta paper (sha 6ec26bf…): §1 Lemmas 1.3–1.4 and Corollary 1.5 with the Hecke
algebras (pp. 740–743), and §5 in full (pp. 763–771). This closes most of the gap "Taylor 2006 Lemmas 1.3, 5.3, 5.6 are
unread".

**R23.3 (6 nodes, module `…/TaylorWeights`):**
- Lemma 1.3 (Jacquet–Langlands and ρ_𝔪);
- Lemma 1.4 with Corollary 1.5 (Fontaine–Laffaille shape at split x | l);
- Lemma 5.1 with Corollary 5.2 (a variant of Buzzard's argument via 𝐕_{ϖ_x});
- Lemma 5.3 (weight shift by l + 1);
- Lemmas 5.4–5.6 with Corollary 5.5;
- Theorem 5.7, split out of the Proposition 4.1 node (planet).

KW II Theorem 6.1 and KW Annals Theorem 2.1 cite Theorem 5.7.

**Correction.** In Taylor 2006, [SW1] is Skinner–Wiles, *Base change and a problem of Serre* (Duke 2001), and [SW2] is
their 2001 Toulouse paper. Checkpoint 2 read the alternative route "the main theorem of [SW1], theorem 3.3 of this paper
and a standard descent argument" as going through SW 1999. The gap and the readme are fixed. The E11 gap now notes
Skinner's unpublished correction (Khare–Wintenberger I [41]).

**New gaps:**
- Skinner–Wiles' Duke paper, used by Corollary 5.5;
- the Taylor 2006 gap is reduced to Khare's Lemma 2.2 and Conrad–Diamond–Taylor 3.1.1 and 4.2.4.

**New requests:**
- GL2AutomorphicRepresentationsAndTransfer R17.3 (Jacquet–Langlands);
- AutomorphicGaloisRepresentations R19.2 (Hilbert Galois representations and Wiles' ordinary shape).

**Lean.** New checked tests: a⁵ = a in F₅, which the X^lY − XY^l identity uses, and the weight bookkeeping of Theorem 5.7.

**Totals.** 35 nodes, 9 planets, 10 requests and 8 gaps. `check_blueprint.py`: 0 errors, 0 warnings.

## Checkpoint 2: Taylor's moduli problem and potential modularity (10 nodes)

**Carried from EXT-12.** Ten draft nodes, each re-verified on the page images:
- Taylor 2002 (fm.pdf, sha e00ebd5…), §1, printed pp. 6–16;
- Taylor 2006 (Documenta, sha 6ec26bf…), pp. 755–763, 770–771 and 776–777.

Every excerpt was found on its stated page by a letters-only match, because the 2002 text layer drops digits and Greek.

**R23.2 (6 nodes):**
- `taylor-auxiliary-data-p-L-psi-N-M` (construction, 5 API items, 4 tests);
- Lemma 1.1;
- Lemma 1.2;
- Lemmas 1.3–1.4;
- the local points and the Moret-Bailly point over E;
- `taylor-2006-lemmas-4-4-4-5-descent-and-the-cm-point`, the draft's twisted-moduli node recast as a lemma.

**R23.3 (4 nodes):**
- Lemma 1.5;
- the modularity of the auxiliary abelian variety and its transfer to ρ̄;
- Theorem 1.6 with Corollary 1.7 (planet);
- Taylor 2006 Proposition 4.1, Corollary 4.6 and Theorem 5.7 (planet).

KW II Theorem 6.1 and KW Annals Theorem 2.1 now cite them.

**Not carried (RS-23).** The draft's M-HBAV definition and the moduli spaces X and X_{R,ψ} belong to
HilbertModularVarietiesAndShimuraCurves H6, which "retains the twisted moduli/local-point input" for R23.2. A request
to H6 lists what is needed, including quasi-projectivity, which Taylor does not state.

**Taylor and Skinner–Wiles 2001.**
- Taylor 2002 (p. 15) applies SW 2001 Theorem 5.1 to a residual representation induced from the CM field LE, split
  above p.
- Taylor 2006 (pp. 762–763) does the same with FM, split at p₁.
- Both are exactly the case where SW 2001's Lemma 2.2 fails (OrdinaryAutomorphicFormsAndModularityLifting/E11, PR
  #3873), so this is recorded as a gap.
- Taylor 2006 names an alternative route: [SW1], his Theorem 3.3 and descent. [SW1] is Skinner–Wiles' Duke base-change
  paper, not SW 1999; checkpoint 3 corrects this.

**Source issues (Taylor's 2000 preprint):**
- **E4:** Lemma 1.5's proof ends "χ₁|_{I_x} = ω" for ω^{−1}. The excluded case is n = 1, checked in Lean.
- **E5:** ψ_x for ψ_y in Lemma 1.1's proof.
- **E6:** λ for λ₀ (p. 7), and End(A/k(v)) and ℚ(α) for End(A₀/k(v)) and ℚ(β_v) (p. 11).

**New requests:**
- HilbertModularVarietiesAndShimuraCurves H6 (the moduli);
- OrdinaryAutomorphicFormsAndModularityLifting R21.5 (SW 2001 Theorem 5.1).

The R17.5 request now also covers automorphic induction and the soluble branch.

**Gaps:**
- the SW 2001/E11 dependency;
- Lemma 1.3 and Corollary 1.7 have no printed proof;
- the "not yet carried" gap is removed.

Checkpoint 1's source editions carried the draft's private catalogue ids. They are removed here.

**Totals.** 29 nodes, 8 planets, 8 requests, 7 gaps and source issues E2–E6. `check_blueprint.py`: 0 errors,
0 warnings.

## What a continuation should do (after checkpoint 2)

1. Revisit the SW 2001 gap once OrdinaryAutomorphicFormsAndModularityLifting/E11 is settled; Skinner's correction is
   unpublished. The two nodes already cite `R21.5/nearly-ordinary-irreducible-lifting`, merged in #3873. Alternatively,
   plan Taylor 2006's route through [SW1] (Skinner–Wiles' Duke base change) and his Theorem 3.3.
2. Read Taylor 2006 Lemmas 5.1–5.6 and Khare's Lemma 2.2 (the p = 3 extension used by KW II).
3. Compare the published JIMJ numbering with the preprint, if a readable copy exists.

## Checkpoint 1

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

## What checkpoint 1 left (done in checkpoint 2 and #977 checkpoint 2)

1. Carry the draft's Taylor nodes (done above).
2. Fix part R24.3's attribution of the §5.2 Remark (done in #3869).
