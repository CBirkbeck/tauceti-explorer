# RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19: red team of the Böckle–Harris–Khare–Thorne extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4314).

**Target.** `PAPER-BOCKLE-HARRIS-KHARE-ETAL-19` extracts G. Böckle, M. Harris, C. Khare and J. A. Thorne, *Ĝ-local systems on smooth projective curves are potentially automorphic*, [Acta Math. 223 (2019), 1–111](https://doi.org/10.4310/acta.2019.v223.n1.a1), with two appendices by D. Gaitsgory. The preprint is [arXiv:1609.03491](https://arxiv.org/abs/1609.03491).

**Who did what.**
- Claude Code `cc-fb70e5` wrote the extraction (issue #1468, PR #1993).
- `REV-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19` (`cc-d67081`, issue #1469, PR #2470) accepted it unchanged. It added the published text and published page numbers.
- I did neither job, and the string `cc-f805bf` occurs in none of the four target files.

**Disclosure.** This session wrote two extractions that bear on findings here:
- PAPER-FARGUES-SCHOLZE-21 routes to `ExcursionOperatorsAndSpectralAction` and `LanglandsParameterStacks`. It marks FS Proposition VIII.3.8 planned at `LP2:semisimple-characters`, and **finding 3** concerns that stage.
- PAPER-DELIGNE-80 routes to `DeligneWeightsAndPurity` and `LefschetzPencilsAndVanishingCycles`. **Finding 6** cites DWP.6–DWP.7 as the owners of the Weil II input it uses.

**Result: seventeen findings.** None is high, ten are medium and seven are low. The machine-readable file is [RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json](RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json).

- **Where the work is sound.**
  - Item by item, the statements are faithful.
  - All sixteen recorded mistakes hold. I re-derived the corrections of E3, E8 and E13.
  - The Part II's name and title are in order.
- **Where it breaks.** Ownership and status:
  - one item duplicates a stage that PAPER-LAFFORGUE-18 already feeds;
  - the Ĝ-pseudocharacter theorem now has three homes;
  - the Ĝ-valued deformation functor duplicates another accepted Part II;
  - three "planned" items contain mathematics no stage plans;
  - several key inputs have no item and are not imported;
  - the brief sets tests the roadmap cannot pass.
- **What the paper still hides.** I found further mistakes in it, among them two substantive ones: Theorem 11.9 forgets its matching condition, and Appendix A's strong-regularity reduction is false in general.

## Source

Fetched on 30 September 2026.

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v2 (77 pp., 29 Aug 2019) | [arXiv](https://arxiv.org/pdf/1609.03491v2) | `ec54cf92…43b9` (matches the extraction) |
| Published (111 pp.) | [International Press](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf) | `15c4b966…ba2c` (matches the review) |

- **Versions.** arXiv has only v1 and v2. Crossref has no correction record.
- **Numbering.** The statement numbering of v2 and of the published text agrees. Locators below are v2 pages; every paper mistake filed here is also in the published text.
- **How I read it.**
  - Four parallel section passes read the paper line by line: §§1–4; §§5–7; §8; §§9–11 with the appendices.
  - Page images were rendered at 150–300 dpi wherever hats and bars matter.
  - I re-checked every finding at its page.
  - I re-derived the counterexamples myself: Q₈ (findings 1, 13), G₂ (finding 11) and the Poitou–Tate computation (finding 14).

## Findings

### 1. The Theorem 4.10 hypothesis is not "Schur's lemma for GL_n" (medium, error)

**The claim.** Item 11, the summary, route 3's reason and the brief all say that the hypothesis "centralizer of ρ̄ in Ĝ^ad scheme-theoretically trivial" is, for GL_n, Schur's lemma, so the theorem is Carayol's.

**Why it is false.** Take l odd and Q₈ ⊂ SL₂(F̄_l).
- It is absolutely irreducible.
- Its image in PGL₂ is the abelian Klein group V₄, which centralizes itself.
- So the Ĝ^ad-hypothesis fails, although Carayol's theorem applies.

**Where it comes from.** The paper's §1 sentence concerns a different condition, the centralizer in Ĝ. That sentence is itself inexact (finding 13).

### 2. The integral excursion algebra is already owned by GS.5 (medium, duplicate)

**The problem.** Item 34 routes Proposition 8.10 and Corollary 8.11 into the new Part II.
- The paper proves Proposition 8.10 "from [Lafa, Proposition 13.1]" with "the recipe of [Lafa, Lemme 10.5]".
- Corollary 8.11 is Theorem 4.5 applied to the result.
- The accepted PAPER-LAFFORGUE-18 already routes Proposition 13.1 and Theorem 13.2 (item /41) to GS.5.

**The note is wrong twice.** It says Lafforgue's §13 lacks the integral algebra, and that Corollary 8.11 is where §3.2 is used. In fact §3.2 enters through Theorem 4.10.

**Fix.** Mark item 34 planned at GS.5 and import it in the brief.

### 3. The pseudocharacter reconstruction has three homes (medium, duplicate)

**The split.**
- Items 7–9 go to IHG.0/IHG.1.
- PAPER-LAFFORGUE-18 routes the characteristic-l reconstruction to LP2/LP3 (/42, whose proof it defers to "the proof of Theorem 4.5 of [BHKT16]"), together with its pseudo-characters (/36).
- LP2:semisimple-characters and GS.5 plan the local and global special cases.

The extraction noticed this ("cite one proof, not three") but did not resolve it.

**Fix.** Choose one owner, and add links from it to LP2:semisimple-characters and GS.5. *(Touches LP2:semisimple-characters, where this session's PAPER-FARGUES-SCHOLZE-21 plans FS VIII.3.8.)*

### 4. Item 21's "planned" status is unsupported (medium, error)

**What the item contains.** The Iwahori–Hecke algebra with its Bernstein presentation over O, Casselman's π^{U₀} ≅ r_N(π)^{T(O)}, Lemma 7.2 and Lemma 7.1.

**What the stages plan.** SR.1, SR.2 and SR.4 plan general Hecke algebras, induction and Jacquet functors, and spherical Satake.
- No atlas stage mentions an Iwahori–Hecke algebra or the Bernstein presentation.
- Neither pinned library has an "Iwahori" or "Satake" declaration.

**Fix.** Mark item 21 missing and route it to SmoothRepresentationsOfLocalGroups.

### 5. Items 32 and 33 hide unplanned, unrouted statements (medium, missing)

Each item's own note concedes that part of it is planned nowhere:
- **Item 32** contains Proposition 8.3, Chevalley restriction over Z. The note says it "is recorded in the source route to LP3", but it is not in that route.
- **Item 33** contains Definition 8.7 and Lemma 8.8, the excursion-algebra notion of "automorphic" and its equivalence under Zariski density. Lemma 8.8 is used twice in the proof of Theorem 11.4, and GS.5's acceptance line excludes it.

**Fix.** Split both items and route the unplanned parts.

### 6. Key inputs have no item and no import (medium, missing)

**Planned elsewhere, but not imported in the brief:**
- L. Lafforgue's Théorème VII.6, planned at GS.6.
- The Weil II weight bound, planned at DWP.6–7. *(Stages fed by this session's PAPER-DELIGNE-80.)*
- The function-field Euler characteristic and Poitou–Tate duality. PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22/6 routes these to ArithmeticGaloisDuality R02.3/R02.4.

**Planned nowhere:**
- de Jong's conjecture (Gaitsgory);
- Chin's independence of l;
- Larsen's maximality in the form of Snowden–Wiles Proposition 7.1;
- Völklein's vanishing of H¹.

**Never constructed in the paper.** The mod-l Galois representations of the proper Levis, which Proposition 8.12 takes as input.

**Fix.** Add these as items with their statuses, and add GS.6, DWP.6–7 and R02.3/R02.4 to the brief's imports.

### 7. Ĝ-valued deformation functors are planned twice (medium, duplicate)

**The problem.** Item 12 is deformation theory for an arbitrary profinite Γ satisfying Φ_l, and nothing in it is function-field-specific.
- GlobalGaloisDeformations R04.1/R04.2 own the GL_n form.
- The accepted FKP22 Part II `GlobalGaloisDeformationsPartIIGValuedLifting` plans G-valued lifting functors over global fields, function fields included, in its layer (0).
- Route 1's reason rejects GlobalGaloisDeformations only because it is "over number fields", which does not apply to this item.

**Fix.** Route item 12 and Lemma 5.9 to GlobalGaloisDeformations, or name one owner in both briefs.

### 8. The brief misstates the scope and sets impossible tests (medium, error)

**Scope.** The brief says "for every reductive group". The theorem is for split semisimple G, and Ĝ is semisimple from §5 on.

**Tests.** None of the three can be met:
- "GL_n/PGL_n must recover L. Lafforgue with K′ = K": GL_n is not semisimple, and the method only gives some finite K′.
- "a torus must recover class field theory": tori are excluded.
- "r = 0": that means Ĝ is trivial.

### 9. Item 3's library and upstream owners are missing (low, library-claim)

**What exists.** Mathlib has `RootDatum` (Defs.lean:109), `RootPairing.flip` (:127), `RootPairing.IsReduced` (Reduced.lean:50) and `RootPairing.Base` (Base.lean:70).

**Who owns the rest.** Split reductive groups over a base, central quotients, the adjoint group and parabolics belong to upstream ReductiveGroups Layers 6, 7 and 9, not to RG2.5.

### 10. Theorem 11.9 never ties π to φ (medium, missing source issue)

Conclusion (ii) is only "a cuspidal automorphic representation π … such that π^{G(Ô_K)} ≠ 0". Without the matching, the theorem does not strengthen Theorem 10.11 as its proof claims ("This is the same as Theorem 10.11, except …"). Item 31 copies the statement.

### 11. Appendix A's strong-regularity reduction is false in general (medium, missing source issue)

**The claim.** Appendix A says E_Ť₁ "is automatically strongly regular. This follows from the fact that the derived group of G₁ is simply connected."

**Counterexample: G = G₂.**
1. Take an elliptic curve whose Frobenius acts on X[2] with order 3.
2. Let E_Ť be the resulting Ť[2]-torsor, with Frobenius matched to a Coxeter element w.
3. The induced Weil Ǧ-local system is irreducible.
4. But w′ = −1 fixes Ť[2], so E_Ť^{−1} ≅ E_Ť and strong regularity fails.

**Why the paper is unaffected.** For Coxeter parameters, Stab_W(v) = 1 gives strong regularity directly. Item 28 nevertheless presents the reduction as valid.

### 12. Theorem 5.13's proof needs l > 2 (low, missing source issue)

The proof says "hence l > 2 (because we work in very good characteristic)". But l = 2 is very good for SL₃, and Gaitsgory's theorem needs l > 2. Separately, item 16 writes GL_n(k̄((t))) where the paper has GL_n of the algebraic closure of k((t)).

### 13. The introduction misdescribes the key hypothesis (low, missing source issue)

This is the §1(i) sentence behind finding 1.

### 14. Proposition 5.19 is proved only for S = ∅ (low, missing source issue)

**The problem.** The Poitou–Tate kernel is Ш¹_{S∪Q}, not H¹_{Q-triv}. The Q = ∅ equality therefore becomes h¹(Γ_S, ĝ) = dim Ш¹_S(ĝ^∨(1)) ≤ h¹(Γ_S, ĝ^∨(1)), so parts (i) and (iii) need S = ∅ or H⁰(K_v, ĝ) = 0.

**Why it is harmless in the paper.** The only use has S = ∅. Item 18 copies the statement.

### 15. Nine smaller verified slips (low, missing source issues)

1. **Proposition 5.12's proof:** "semisimple, because Ĝ is semisimple" (N(T) ⊂ SL₂ is a counterexample; the conclusion survives).
2. **Very good characteristic:** "very good ⇒ 𝔤 semisimple" holds only for semisimple G.
3. **Theorem 9.3(ii):** "for each place w" should read "for some w".
4. **Proof of Proposition 10.2:** the claim of "distinct roots" is false in type D₂ₘ.
5. **Lemma 7.3:** U/U_p should be U₀/U_p.
6. **Proof of Proposition 3.13:** "étale at i(1, x)" should be at π_{X′}(i(1, x)).
7. **Lemma 8.8:** π^{G(O_{K_v})} should be π_v.
8. **Lemma 3.11:** it applies Lemma 3.12 to an extension that is not algebraic.
9. **Proposition 8.12:** it applies Definition 3.5(ii) over an extension field.

### 16. Item statements that drift from the paper (low, error)

- **Items 4 and 6:** item 4 drops Proposition 3.7(i)'s hypotheses; item 6 drops Proposition 3.10(v)'s hypotheses, which leaves it vacuous.
- **Notes to items 13 and 15:** item 13's is wrong about the numerical hypotheses on l; item 15's is wrong about "dimension zero".
- **Item 26:** the locator is off by a page.
- **Item 27:** it writes "over K" where the group is over F_q.
- **Item 35:**
  - it calls the Eisenstein series "geometric" when they are pseudo-Eisenstein series;
  - it omits Proposition 8.12's data.
- **Item 36:**
  - it says ρ "is then automorphic", where Corollary 8.21 proves only that some Π exists;
  - it drops the minimal-prime condition and ψ;
  - it leaves q undefined.

### 17. Provenance and presentation (low, other)

- **Authorship.** The review names the extraction's author as `cc-442dc5`; it was `cc-fb70e5`.
- **Access to the published text.** `readSections` and the .md still say the published text "could not be consulted".
- **Route 5.** The .md says R23.1 "already asks for the function-field case", which it does not.
- **E4.** Its quotation drops the bar on ρ̄_m.

## What held

- **Items.** Checked against the paper and faithful:
  - Theorem 1.1 and its hypotheses;
  - Theorems 3.4, 3.8, 4.5, 4.8, 4.10, 5.14, 8.17, 8.20, 10.11 and 11.4;
  - the §8.4 hypotheses (i)–(iv);
  - Definitions 5.16, 5.18, 10.3 and 10.9;
  - Propositions 6.6, 6.7, 9.5, 10.2, 10.7 and 10.10;
  - Lemma 10.12;
  - the different hypotheses of the two appendices.
- **Locators.** All are right except item 26's.
- **Recorded mistakes.** E1–E16 are confirmed in both texts. The review's annotation of E14(b) and E16(b) as v2-only slips is right.
- **Library.** The items marked missing are absent from Mathlib `082e2d3` and Tau Ceti `f790474`:
  - Tau Ceti's "Coxeter" declarations are Coxeter and Artin groups;
  - its "Chebotarev" declarations are for number fields only;
  - its "excursion" declarations are combinatorics.
- **Routes.**
  - The Part II id is free and its title is an exact prefix extension.
  - It does not collide with the nine sibling Part IIs of GlobalShtukasAndFunctionFieldLanglands.
  - Routes 4 (to R01.1) and 5 (to R23.1) are sound.
- **Prerequisites.** All 43 resolve to the cited works.
