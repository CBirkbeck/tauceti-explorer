# Review: PAPER-CLOZEL-THORNE-17 (Clozel–Thorne, Level-raising and symmetric power functoriality, III)

Job `REV-PAPER-CLOZEL-THORNE-17` (issue #1337), by Claude Code, session `cc-38267a`, 23 September 2026. The extraction was written by Claude Code, session cc-442dc5. **Verdict: accept**, after the corrections below, which were made in place. There are now eight routes, all accepted: routes 1–4 are the extraction's, route 2 reduced, and routes 5–8 were added by the review.

## What was read

- **The accepted manuscript** (10 December 2015, 53 pages), read in full: the Cambridge repository copy (https://www.repository.cam.ac.uk/items/478eb67b-3840-4089-a5f7-360592d61a4b), SHA-256 fb88e83c3c056c2fa6100d1fbb4d0853c4ec636cc68a33548ac4259336094742, the file the extraction read. The published Duke article was not accessible, as for the extraction.
- **Method.** Three checkers split the paper: §§1–2, pp. 1–18; §§3–4, pp. 18–37; §§5–7, pp. 37–53. Each:
  - compared every item with the page images;
  - listed what no item covers;
  - checked the recorded mistakes and looked for new ones.

  I re-derived the substantive findings myself (see "Mistakes"). For the n = 9 Hecke matrices I checked by hand the invariant 2×2 block that fails. I then reran a symbolic check of every quadratic, braid and Bernstein relation, both as printed and as corrected.
- **Libraries.** The extraction's baseline was confirmed at Mathlib 082e2d3 and Tau Ceti f790474:
  - Mathlib has `CoxeterSystem` (GroupTheory/Coxeter/Basic.lean:157);
  - Tau Ceti has `TitsSystem` (GroupTheory/TitsSystem/Basic.lean);
  - neither has Iwahori–Hecke algebras, their presentations, admissible representations or anything else an item states.
- **The atlas.** I read, in `data/atlas.json`, the description of every layer cited by a route or a planned item. I also read the briefs of the pending candidates the routes now use: PolarizedAutomorphyLifting, SmoothRepresentationsPartIIParahoricCenters (PAPER-KISIN-PAPPAS-18, PAPER-HE-21) and SymmetricPowersByUnitaryLevelRaising (this paper's, extended by PAPER-NEWTON-THORNE-21 and -26).

## Items

**Corrected: 35 items.** Each item's note says what changed. The material ones:

- **006, Iwahori–Matsumoto.** The paper's relation is (T_s − 1)(T_s + q) = 0; it should be (T_s − q)(T_s + 1) = 0 (E6).
- **013, Kazhdan–Lusztig's Theorem 2.4.** Condition (a) as printed forces u = 1. The tempered form of s was restored (E8). The Jacquet-module formula became its own item (063).
- **026, Proposition 3.7.** π_H is the packet of the (1, n − 1) endoscopic datum, not the packet of (3.7).
- **048.** π′_2 is ramified at the non-split places above u_0. The item was split into 048, 059 and 060.
- **055.** Split: BLGGT14 Theorem 4.2.1 and Lemma 1.4.3 became item 058.
- **002.** ι-ordinarity became item 057, and PA.2 (unpolarized ordinary parts) was removed from its planned layers.
- **046, the congruence.** Printed only for l = 7 on p. 2. "Large image" was made precise, and the decomposition was checked by linkage.
- **Moderate:**
  - 021: the sign table is a labelling convention, not a conclusion;
  - 024: the removal steps, and the cuspidal case;
  - 025: ∆_II;
  - 028: strong base change is a remark after the proof;
  - 033: ȷ, and the undefined N;
  - 038: Π′, not Π_0;
  - 039: further Thorne 2015 and Geraghty inputs;
  - 043, 044.
- **Minor:** 003, 004, 014–017, 019, 036, 040, 045, 049, 051.
- **Locators:** 010–012, 029, 032, 042, 052.

**New: 25 items.** The totals are now 81 items: 17 planned and 64 missing.

- **Planned (8)**, each against a layer description that was read:
  - Borel–Casselman (SR.1) and the §1.1 notation (SR.2, R01.1–R01.2);
  - archimedean transfer (ET.4);
  - weak base change and Galois representations for the unitary group (AG2.2, ET.7a);
  - singleton packets at split and unramified places (ML.4);
  - soluble base change and descent (ML.5, ET.7a);
  - Dickson (R01.4);
  - Fontaine–Laffaille inertia (R07.3, R01.2).
- **Missing (17):**
  - route 1: the reduction of Theorem 6.1 to Theorem 6.2, the odd extension R̄, and the silent equivalence of "not CM-induced" with "Sym²π cuspidal";
  - route 4: the §2.3 definitions, the duality for Y, the U(4) Jacquet lemma, the Jacquet form of (3.7), the membership of X′ and Y′ in Π_φ, the corrected semistability argument ([CT15, Lemma 4.3]), and the preliminary reductions of Theorem 5.1;
  - route 5: ι-ordinarity, BLGGT14 Theorem 4.2.1, [CT14] Lemma 2.6 and Proposition 2.9, and the Thorne 2015 inputs of Lemma 5.3 and D₀;
  - route 6: the Kazhdan–Lusztig standard modules;
  - route 8: [CHT08, Lemma 4.1.4] and the automorphy of coefficient conjugates.

**Prerequisites.** Eleven were added, with DOIs checked on Crossref where they exist:
- CHT08, Guerberoff, Labesse, Taylor–Yoshida, Casselman;
- Gelbart–Jacquet, Kim, Blasius–Rogawski;
- Arthur 2003, Procter, Fontaine–Laffaille.

## Routes

The review applies the owner choices of the three Newton–Thorne reviews, so that the Clozel–Thorne–Newton–Thorne series uses one owner for each shared input.

1. **Source of ML.0/ML.2/ML.3: accept**, with three items added. BLGGT14 Theorem 4.2.1 moved to route 5.
2. **Source of SmoothRepresentationsOfLocalGroups: accept, reduced.**
   - It keeps Casselman's Lemma 2.1 (SR.2/SR.3) and names Borel–Casselman and the notation.
   - The presentations and Kazhdan–Lusztig moved to route 6. SR.1 plans Hecke algebras over rings and their corners, and SR.3 states that "classification is not assumed".
3. **Source of LocalGaloisDeformationRings L7: accept.** L7 plans "semistable, Steinberg and minimally ramified analogues away from p for rank n, preserving the nilpotent monodromy operator".
4. **Part II `SymmetricPowersByUnitaryLevelRaising`: accept.**
   - The owner question the extraction left open is settled. Thorne 2015's inputs go to route 5; Theorems 5.1 and 5.7 stay here.
   - The congruence moved to route 7.
   - Seven items were added.
   - An addendum to the brief records the other two sources that now extend this candidate and the corrections the design job must respect.
5. **Coalesced PolarizedAutomorphyLifting: added.** It takes Thorne 2015 as §5 uses it, ι-ordinarity, [CT14], and BLGGT14 Theorem 4.2.1 with Lemma 1.4.3.
6. **Coalesced SmoothRepresentationsPartIIParahoricCenters: added.** It takes the Iwahori–Matsumoto and Bernstein–Lusztig presentations and Kazhdan–Lusztig's classification with its standard modules. That candidate already owns the Iwahori Bernstein presentation.
7. **Source of ArithmeticGaloisRepresentations G7/R01.4: added.** The congruence (1.1) is the r = 2 case of the decomposition that PAPER-NEWTON-THORNE-26 routes to G7.
8. **Source of AutomorphicGaloisRepresentationsPartII AG2.0/AG2.2: added.** It takes [CHT08, Lemma 4.1.4] and coefficient conjugation, as in PAPER-NEWTON-THORNE-26.

## Mistakes in the paper (`sourceIssues`)

**Recorded by the extraction: E1–E5, all confirmed on page images.**
- In E1 the quotation was corrected: the paper prints −1/ϖ, which is right, since ϖ̄ = −ϖ.
- E3 was confirmed by the m = 3 endoscopic identity and by the Jacquet module of n-Ind(St_{3,E} ⊗ 1).

**New: E6–E23.** Each was checked on the page image; I re-derived the substantive ones myself.

- **E7 (error, p. 14; p. 16).** In the n = 9 matrix T_{s₂}, the (10,10) entry must be −1/(1+q), not 1 + q.
  - The invariant block ⟨e₁₀, e₁₁⟩ has trace (1 + 2q + 2q²)/(1+q), but the quadratic relation needs q − 1.
  - As printed, the quadratic relation for T_{s₂}, two braid relations and the Bernstein relation for s₂ fail. With the correction all the relations hold.
  - The relation for e₁₁ on p. 16 changes accordingly.
  - Proposition 2.6 stands.
- **E8 (error, p. 10).** Theorem 2.4(a) as printed puts s in a compact subgroup. Then sus^{−1} = u^q forces u = 1, excluding the Steinberg-type parameters that Theorem 2.5 uses.
- **E10 (error in a proof step, p. 26).** The induced representation of (3.9) does not have a unique irreducible submodule.
  - The paper's own argument for Z′ also embeds Y, since [1, 0, 2, 1] is the only exponent of j(Y) with e₁ + e₂ = 1.
  - The identification of Z survives: the member of {Z, W} that embeds is not Y.
- **E20 (gap, p. 43).** Primitivity of r_{𝔭₀} is asserted but not shown. Irreducibility of r_𝔭 follows instead from Clifford theory and n₁ ≠ n₂.
- **E21 (gap, Lemma 5.3).** The proof imposes R¹_v at R₀, so it covers only unipotent conditions there. The one application has R₀ = ∅.
- **E22 (gap, Theorem 6.2).** The proof never verifies Theorem 5.7(4). By Dickson, it can fail only when [F(ζ_l) : F] = 2 and the quadratic subfield of F(proj ρ̄) is F(ζ_l).
  - The hypotheses of Theorem 6.2 do not exclude this case.
  - Theorem 6.1's hypothesis F ∩ Q(ζ_l) = Q does, provided the reductions of [CT15, §6] preserve it.
  - No example of failure was constructed.
- **E23 (gap, Theorem 7.1).** The descent is determined only up to η_{E/F}. The repair is to fix Π at a place where the twist is visible.
- **E14 (gap):** N is used in §4.2 but never defined.
- **Misprints:** E6 (the Hecke relation), E9 (p. 6), E11–E13, E15–E19.

**Not recorded:** low-confidence doubts the checkers could not settle, each needing an external source to decide:
- a convention-dependent sign in ψψ^c = r_ι(χ) (p. 45);
- "irreducible by property (3)" in Theorem 5.7;
- a going-down step in Lemma 5.4;
- Kim's Sym⁴ at 2 and 3;
- the functional equation at infinity in Theorem 7.1;
- Guerberoff's unramifiedness assumption.

**Published corrections:** none found. Crossref records no update for doi:10.1215/00127094-3714971, and zbMATH notes no erratum.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CLOZEL-THORNE-17.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once, and every planned and route stage id exists in the atlas.
- Lean: none (a review of an extraction).
