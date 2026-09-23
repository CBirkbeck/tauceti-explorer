# PAPER-PASKUNAS-QUAST-26: On local Galois deformation rings: generalised reductive groups

Vytautas Paškūnas and Julian Quast, *On local Galois deformation rings: generalised reductive groups*, [Forum of Mathematics, Pi 14 (2026), e15](https://doi.org/10.1017/fmp.2026.10030); arXiv [2404.14622](https://arxiv.org/abs/2404.14622).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1344). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-PASKUNAS-QUAST-26.result.json](PAPER-PASKUNAS-QUAST-26.result.json). It has:
- 84 items: 1 library, 3 planned, 80 missing;
- 6 routes: five sources of existing layers and one coalesced Part II;
- 14 prerequisite entries;
- 2 recorded source issues: one error and one misprint.

## Sources read

- **The published version** (open access, CC BY 4.0), read in full: 96 pages. Page numbers below are the journal's.
- **arXiv v2** (9 January 2026, "revised version after the referee report") was compared at the recorded passages; it has both.
- **Errata:** Crossref records no update, and the Cambridge Core page lists no correction.
- **Page images:** the text extraction drops bars (Ḡ, X̄) and super/subscripts, so every candidate mistake was checked on the page images. Two apparent inconsistencies turned out to be extraction artefacts.

## What the paper proves

**The setting.** Let F/ℚ_p be finite. Let G be a generalised reductive group scheme over O: smooth and affine, with reductive G^0 and finite G/G^0, and no condition on p. Let ρ̄ : Γ_F → G(k) be continuous.

**Theorem 1.1.** R^□_ρ̄ is a local complete intersection, O-flat of relative dimension dim G_k([F:ℚ_p] + 1), and reduced with normal generic fibre. So every ρ̄ lifts to characteristic zero, and the derived deformation ring is homotopy discrete.

**Theorem 1.2 (the Böckle–Juschka conjecture).**
- R^□_ψ → R^□_ρ̄ is flat, where ψ is the projection of ρ̄ to G/G′.
- If π_1(G′) is étale, this map is a bijection on irreducible components.
- The components are labelled by characters of μ = (μ_{p^∞}(E) ⊗ M)^{Gal(E/F)}.

**Theorem 1.3 and Corollary 1.4.** When π_1(G′) is étale:
- the components are complete-intersection normal domains, regular in codimension [F:ℚ_p];
- they are factorial when [F:ℚ_p] ≥ 3.

**Further results.**
- Everything holds with a "fixed partial determinant", which covers L-groups and C-groups (§16).
- R^ps_G, for V. Lafforgue's G-pseudocharacters, is equidimensional of dimension dim G_k[F:ℚ_p] + dim Z(G)_k + 1 (Theorem 1.5).
- Its non-special absolutely irreducible locus is dense (Theorem 1.6).

**The method.** It generalises the GL_d case of Böckle–Iyengar–Paškūnas.
1. **Generic matrices.** A space of generic matrices X^gen_{G,ρ̄^ss} is built inside Gᴺ × X^ps_{GL_d}. Continuity is expressed algebraically or through condensed sets, which makes the space independent of the embedding G ↪ GL_d (§§4–5, 8).
2. **GIT.** The GIT quotient X^git is a finite universal homeomorphism onto Spec R^ps_G (§7). Closed orbits correspond to G-completely reducible representations (Richardson, Bate–Martin–Röhrle; §6).
3. **Induction on dim G.** The special fibre is bounded by induction on dim G (§13), using:
   - the fibre bound through the spaces X^gen_{P,ρ} and the "defect" (§12);
   - W-special loci, where H⁰(Γ_F, W(1)) ≠ 0 (§13.2);
   - two group-theoretic facts (§10): a reductive subgroup not containing G′ has codimension ≥ 2, and (Lie G′_sc)^* has no G′-invariants;
   - Cotner's finiteness theorem for character varieties (§6);
   - a reduction to π_1(G′) étale (Proposition 2.30).
4. **Components and normality.** Components and normality follow from Serre's criterion (§§14–15), using the analysis of R-Levis of codimension 2 (§11).

## What the atlas already has

**The pending Part II.** The Böckle–Iyengar–Paškūnas extraction proposed `LocalGaloisDeformationRingsPartIIComponentsAndNormality` for exactly this theory in the GL_d case. Its brief lists this paper as the consumer that "should extend this Part II".

**Planned or library (4 items).**
- The complete-intersection criterion, Lemma 3.9 (DeformationAndDerivedPatchingAlgebra R03.3).
- Determinant laws and the Cayley–Hamilton quotient (IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1).
- L-groups (ReductiveGroupsPartII RG2.5).
- Condensed sets: Mathlib's `CondensedSet`, `Condensed.discrete` and `CondensedSet.isDiscrete_tfae`.

**Planned suppliers, cited in notes.**
- Framed GL_2 rings (LocalGaloisDeformationRings R08.1).
- Local duality (Tau Ceti ClassFieldTheory Layer 5, ArithmeticGaloisDuality D7) and the Artin map (Layer 7).
- Reductive groups and the dynamic method (Tau Ceti ReductiveGroups Layers 7–8).
- Invariant theory for parameter stacks (LanglandsParameterStacks LP2–LP3, Fargues–Scholze setting only).

**Not planned anywhere.**
- Non-connected generalised reductive group schemes, R-parabolics and G-complete reducibility.
- Cotner's finiteness theorem.
- The codimension results of §§10–11.
- The local Langlands correspondence for tori.
- C-groups.

## Routes

1. **Coalesced with `LocalGaloisDeformationRingsPartIIComponentsAndNormality`** (65 missing). This is the pending Part II of LocalGaloisDeformationRings from Böckle–Iyengar–Paškūnas; its id, title, parent, area and brief are kept.
   - **What it gains**, as layers following the GL_d ones:
     - generalised reductive groups: R-parabolics, G-semisimplification, Proposition 2.30;
     - continuity (§4);
     - the G-valued generic matrices, GIT and pseudocharacter comparison (§§5–9);
     - the group theory of §§10–11;
     - the fibre bounds and the induction (§§12–13);
     - the special locus (§14);
     - components and normality with fixed partial determinant (§15);
     - L-groups and C-groups (§16).
   - **Stated inputs:** the generalised-tori paper and Cotner's, Martin's, Richardson's and Seshadri's results.
2. **Source of LocalGaloisDeformationRings [R08.1]** (5 missing): G-valued framed functors over the coefficient rings Λ, representability with continuous sections, the presentation relative to φ : G → H, coefficient extension and completions, and central quotients.
3. **Source of DeformationAndDerivedPatchingAlgebra [R03.1, R03.3]** (3 missing, 1 planned).
   - **Missing:** Lemma 5.15, Lemma 14.2, and Serre's criterion with excellence, parafactoriality and miracle flatness.
   - **Planned:** Lemma 3.9.
4. **Source of IntegralHeckeAndGaloisDeterminants [IHG.0, IHG.1]** (5 missing).
   - Wang-Erickson's finiteness of E^u.
   - Lafforgue's G-pseudocharacters over O for non-connected G.
   - Quast's deformation theory.
   - Emerson–Morel's comparison.
   - Pseudocharacters of products.
   - This joins the routes of the Böckle–Iyengar–Paškūnas and Böckle–Harris–Khare–Thorne extractions.
5. **Source of ArithmeticGaloisDuality [D7]** (1 missing): local Tate duality and the Euler–Poincaré formula with finite, p-adic or characteristic-p local-field coefficients.
6. **Source of VStackSheavesAndLisseCategories [VS2]** (1 missing): the quasi-compact/quasi-separated condensed-set lemmas of Appendix A.

No new roadmap is proposed.

## Source issues (`sourceIssues` E1–E2)

- **E1 (error; affects a stated result, not the main theorems).** Proposition 11.5, pp. 55–56, is stated for an algebraically closed κ of any characteristic.
  - **Where the proof fails:** it uses "if ψ = ω^{±1} then ψ^{p−1} = 1", which holds only in characteristic p.
  - **Counterexample in characteristic 0:**
    - take G = PGL_2, P = B_2, κ = ℚ̄_p;
    - take a non-split ρ̃ = (1 b; 0 χ_cyc), so that ψ = ω^{−1};
    - hypotheses (1)–(3) hold;
    - but the line ē_{12} of (Lie SL_2)^*(1) is Γ_F-invariant, so h⁰ ≥ 1.
  - **Why the paper is unaffected:** the only use, Proposition 14.5, is on the special fibre, and Theorem 14.6 reduces all fibres to the special fibre.
  - **Correction:** add char κ = p to Proposition 11.5.
  - **arXiv:** v2 has the same text.
- **E2 (misprint), Lemma 5.5, p. 31.** "A ∈ R^ps_G-alg" should be R^ps_{GL_d}-alg. X^gen_{GL_d} lives over R^ps_{GL_d}, and R^ps_G is introduced only in §7.

## Prerequisites not yet covered

Fourteen entries, all with DOIs confirmed on Crossref except the arXiv preprints.

**The key inputs:**
- the companion paper on generalised tori (Forum Math. Sigma 2025), which gives the base case and the torus inputs;
- Quast's *Deformations of G-valued pseudocharacters* (Peking Math. J. 2026);
- Böckle–Juschka (Forum Math. Sigma 2023);
- Cotner (IMRN 2024).

**The others:**
- Martin 2003;
- Bate–Martin–Röhrle 2005;
- Richardson 1988;
- Seshadri 1977;
- Emerson–Morel;
- Wang-Erickson 2018;
- Alper 2014;
- Langlands 1997 and Birkbeck 2020 (tori);
- Galatius–Venkatesh 2018;
- Paškūnas–Quast's two 2025 preprints.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-PASKUNAS-QUAST-26.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.

## Review (REV-PAPER-PASKUNAS-QUAST-26, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1345), **accepted** this
extraction and all six routes, and made no correction beyond a source note. The full record is
[REV-PAPER-PASKUNAS-QUAST-26.md](../reviews/REV-PAPER-PASKUNAS-QUAST-26.md).

**Source.** The published Cambridge hash does not reproduce and cannot: a fresh download gave
`b336113e…` against the recorded `c265f54f…`, and every page of the new copy carries a footer with
the date and the requesting IP. A `sha256Note` now records that and names the arXiv e-print
(`05a2306e…`, `defG_REV.tex`, 6796 lines) as the reproducible pin — the sixth instance of this in the
corpus. Both findings are verbatim in that source.

**Structure.** 84 items with all 80 missing ones routed exactly once; all seven source stage ids and
all three planned ids resolve; the Part II title reproduces the parent's atlas title exactly and its
area `langlands` is a galaxy id; the library item's `CondensedSet`, `Condensed.discrete` and
`CondensedSet.isDiscrete_tfae` are all in Mathlib. 112 of 114 locator checks land exactly and the two
others are right too.

**Both findings are confirmed.** `E2` is a substitution slip. `E1` is an error in a stated result and
the review sharpens why: §11 assumes only that `κ` is algebraically closed, and the proof of
Proposition 11.5 disposes of `ψ = ω^{±1}` by "then `ψ^{p−1} = 1`", which holds because the reduction
of the cyclotomic character has order dividing `p − 1` — a characteristic-`p` fact. In characteristic
zero that step fails, and Lemma 11.4, to which the rest of the proof reduces, has `ψ ≠ ω^{±1}` as its
first hypothesis; so the case the proof handles separately is exactly the one its own lemma excludes.
The recorded `PGL₂` counterexample sits in that gap, and the correction's evidence checks out: the
proposition's only application, Proposition 14.5, works throughout on the special fibre, so
`char κ = p` there and nothing downstream is affected.

The review reports one provenance gap it did not fill: no `libraryPins` are recorded. It notes this
is the seventh extraction reviewed that day with the same gap, confirming it as a queue-level
omission.
