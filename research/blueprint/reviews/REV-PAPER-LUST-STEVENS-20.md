# REV-PAPER-LUST-STEVENS-20: review of the extraction of Lust–Stevens, *On depth zero L-packets for classical groups*

**Verdict: accept, after corrections made in place.**

- **Routes.**
  - The single `part-ii` route is split in two. Both halves are accepted.
  - The 102 p-adic items stay in SmoothRepresentationsPartII (route 1).
  - The 52 items of finite-group Lusztig theory (§7, with its inputs from §§3 and 6) move to ModularRepresentationsOfFiniteReductiveGroups (route 2). That is the atlas's single owner of Deligne–Lusztig theory.
- **Published version.** The extraction could not fetch the version of record. The review read it: it is open access, and the UEA repository serves it. Every finding is collated with it.
- **Mistakes.** All 34 recorded mistakes are confirmed. Print corrects seven of them and part of an eighth. Four new ones are added: two in the arXiv text that survive into print, and two that appear only in print.
- **Statuses and statements.** One status changes, from library to missing. Several item statements now use the corrected statements, as PROTOCOL.md §18 requires.
- **Prerequisites.** Two cited the wrong paper and are replaced; three are added.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-f805bf` (PR #4609, issue #4589). It had 158 items (1 library, 4 planned, 153 missing), one `part-ii` route and 34 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Sources:

- **Preprint.** arXiv:1611.08421v1, the only arXiv version. PDF SHA-256 `c1c8bd2f…d489`, matching the recorded hash. I also read the LaTeX source (SHA-256 `b8f1fb18…0c37`).
- **Version of record.** Proc. London Math. Soc. (3) **121** (2020) 1083–1120, doi:10.1112/plms.12340.
  - Crossref lists it under CC BY 4.0.
  - Wiley refuses scripted downloads (HTTP 403), but the University of East Anglia repository (eprint 74421) serves the published PDF: 38 pages, SHA-256 `bd8295cf…4c55`.
  - Printed page p is PDF page p − 1082.
  - Scripts and tildes are lost in its text layer, so every passage where they matter was checked on a rendered page image.

## 1. Items

I read the whole arXiv source (§§1–9) against the 158 items. Every numbered statement, and every unnumbered result of §§1, 8 and 9, has an item. Statements and locators agree with arXiv v1, with the exceptions corrected below.

**Version of record.** The printed text differs from arXiv v1 in structure. The items keep their arXiv locators, and `source.readSections` now records the correspondence.

- **§7 is renumbered.**
  - Lusztig's [32, Lemma 8.9] becomes a stated Lemma 7.3.
  - arXiv Lemmas 7.3, 7.4, 7.7, 7.8, Proposition 7.9 and Corollary 7.10 become Lemmas 7.4, 7.5, 7.8, 7.9, Proposition 7.10 and Corollary 7.11.
  - Displays (7.5) and (7.6) become (7.6) and (7.7).
- **§8 gains a remark.** A new Remark 8.2 discusses the opposite inequality, and arXiv Remark 8.2 becomes Remark 8.3.
- **The introduction changes.**
  - Result (i) is stated as the inequality Σ⌊s_π(ρ)²⌋ n_ρ ⩾ N_Ĝ (1.4), not the equality (1.3). This is the substance of E33.
  - Two new subsections describe the algorithm and the proof.

**Items corrected to their correct statements** (PROTOCOL.md §18: items use corrected statements):

- **s1-main-thm-i** becomes the printed result: ⩾ in (1.3), with the depth-zero terms summing to N_Ĝ (8.1). It had the unconditional equality that arXiv v1 claims but does not prove.
- **s3-depth-zero-gl-classification** had "ρ is self-dual iff τ is self-dual", which is false (E35, new). It now reads: ρ self-dual ⇒ τ self-dual, and a self-dual τ gives exactly two self-dual unramified twists.
- **s7-lemma-7.4-i** takes the hypothesis s ∈ ℒ* (E16).
- **s7-7.7-unitary-parameter-formula** has degree n_Q = m (E24).
- **s7-7.1-self-dual-root-criterion** now counts roots with multiplicity (E38, new).
- **s9-def-E-e-e0** takes the definitions with positive integers and odd positive integers (E25).
- **Examples 9.3, 9.4, 9.6, 9.7, 9.8 and 9.9** carry the recomputed IRed multisets (E26, E27) and the characteristic polynomial (X − 1)P(X)^6 (E28). They had carried the printed values marked "as printed".
- **Notes.** Two notes lose the phrase "outside this range" / "in this range", left from the extraction's batching. The note of s2-eps-hermitian-witt-decomposition no longer contradicts its planned status.

## 2. Statuses

- **Library.** s7-7.5-mackey-formula is not in the library, and it is now missing.
  - I read `Rep.mackeyDecomposition` at Tau Ceti f790474 (TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean:390). It is the general decomposition Res_K Ind_H^G A ≅ ⊕_{KsH} Ind Res(^sA).
  - Display (7.5) needs more: Clifford theory for Res^{ℒ̃}_ℒ τ̃, and the splitting of Harish-Chandra induction Ind^𝒢_{ℒ,𝒫} τ into ℓ = 1 or 2 constituents according to whether w normalizes τ. That splitting is the Howlett–Lehrer theory of s6-howlett-lehrer-lusztig-parameter, and neither library has it.
  - The item goes to route 2.
- **Planned.** The four planned items hold.
  - s2-base-fields-setup rests on LocalFieldsRamification layer 0.
  - s4-induced-rep-def rests on SR.2 (normalized induction).
  - s5-bernstein-subcategories rests on SR.3 (Bernstein decomposition).
  - s2-eps-hermitian-witt-decomposition rests on Tau Ceti QuadraticFormInvariants layer 1 for quadratic forms and on GN.2, which plans "quaternionic/hermitian variants" of the local theory.
- **Missing.** I searched the atlas stage texts, and every blueprint packet and decomposition on main (11,764 nodes). The search terms were Lust, Stevens, depth zero, level zero, Lusztig series, Jordan decomposition, Howlett, Harish-Chandra, cuspidal unipotent, reducibility point, self-dual polynomial, Moy–Prasad, Bushnell–Kutzko covers, self-dual lattice, Silberger, Jordan set and Clifford group. No node plans any missing item; the few hits are unrelated. The missing statuses stand.

## 3. Routes

**Route 1 (SmoothRepresentationsPartII) is accepted, reduced to its p-adic items.**

- **Why this owner.**
  - SmoothRepresentationsPartII is the candidate Part II of SmoothRepresentationsOfLocalGroups proposed by PAPER-FINTZEN-21 (route accepted) for types, depth and the construction of supercuspidal representations.
  - The route joins it with byte-identical id, parent, title and area, as the maintainer's note in `papers.json` asks.
  - Its p-adic items belong there: the lattice model of maximal parahorics, Morris's depth-zero classification, Silberger's theorem, the Miyauchi–Stevens covers with Blondel's formula, §6, §8 and §9.
- **Why §7 cannot stay there.** As submitted, the route also put all of §7 into this Part II: Lusztig series and the Jordan decomposition for finite classical and similitude groups, Harish-Chandra and Howlett–Lehrer theory, cuspidal unipotent representations, and the SO-to-O extension.
  - That Part II's own accepted brief (PAPER-FINTZEN-21) says "No Deligne–Lusztig classification is required."
  - The atlas already has a Part II that builds Deligne–Lusztig representations: ModularRepresentationsOfFiniteReductiveGroups. Its extractions (LLHLM20, LLHLM23) ask for "one foundation for Deligne–Lusztig … not two".
  - Section 7 is general character theory of finite reductive groups, needed beyond this paper (PAPER-LIU-ETAL-22 uses Deligne–Lusztig characters of finite unitary groups). PROTOCOL.md §15 plans such a notion once, in the most foundational owner.
- **The brief is corrected.**
  - Result (i) is the printed inequality, and result (iii) carries the even orthogonal caveat.
  - §7 is an import from route 2.
  - "Tau Ceti Reductive algebraic groups (finite groups of Lie type, layer 9)" becomes ReductiveGroupsPartII RG2.2–RG2.3 for buildings and parahorics. Layer 9 of the Tau Ceti roadmap is pinned Chevalley–Demazure group schemes over ℤ.
  - "Witt theory of ε-hermitian forms from QuadraticFormInvariants layer 1" is split. That layer plans quadratic forms only; the hermitian variants are GN.2's.
  - Arthur/Mœglin packets remain statements from ML.4, and GL_m local Langlands comes from ET.6. I checked every stage id the brief names against `data/atlas.json`.

**Route 2 (ModularRepresentationsOfFiniteReductiveGroups) is added and accepted.**

- **Its items.** It takes the 52 finite-group items:
  - all of §7;
  - Green's classification, the existence of self-dual polynomials and Lusztig's classification from §3;
  - the definition of the full finite classical group and the Howlett–Lehrer parameter from §6.
- **Its identity.** It is a `part-ii` route with the id, parent (tauceti:TauCetiRoadmap/ReductiveGroups), title and area of the route accepted in the LLHLM20 review.
- **Its brief.** The brief states exactly Lemma 7.3, Lemma 7.4 (with s ∈ ℒ*), Proposition 7.9 and the parameter tables of §7.6 and §7.7. It lists what the roadmap must add to its Deligne–Lusztig layer. It names the imports:
  - finite classical groups from the Tau Ceti roadmap;
  - `Rep.mackeyDecomposition` from Tau Ceti;
  - `CliffordAlgebra` from Mathlib (Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:74 at 082e2d3, read);
  - GL₂(𝔽_q) from Tau Ceti CharacterTheory layer 9 as the test case.
- **Its consumer.** Route 1 is the consumer, through the parameters f_τ.

Every missing item is routed exactly once: 102 + 52 = 154.

## 4. Mistakes

I checked every finding at its locator in the arXiv source and in the version of record. Page images were used where scripts or tildes matter.

**All 34 are confirmed.** The recomputations behind the substantive ones:

- **E5.** Ramified U(1): J/J^1 = {±1}, but the display gives the trivial group.
- **E6.** An anisotropic 4-dimensional space: two SO(2,0) factors, yet J° is maximal.
- **E7.** SO(1,1): two almost self-dual lattices with the same stabilizer 𝔬_F^×, whose normalizer F^× is not compact.
- **E16.** Under 𝒢*_s ⊆ ℒ*, Harish-Chandra induction preserves irreducibility, so Lemma 7.4 is vacuous. "As in Section 7.2" gives s ∈ ℒ*.
- **E18.** Conjugating diag(g, h, μ(h)g^{−1}) by w.
- **E20.**
  - In the fermionic model of the 6-dimensional example, x₁x₂x₃ + y₁y₂y₃ commutes with s̃, but its square is not zero. So the printed argument fails.
  - The odd commutant there has no invertible element, so the conclusion survives in that case. A proof is still needed.
- **E25–E28.** Examples 9.3–9.9 recomputed from (7.2), the §7.6 table and §8.
- **E33 and E34.** Checked against §8, §9.3 and the printed introduction.

**Print status.**

- The version of record corrects E8, E12, E13, E14, E22, E32 and E33. Their `known` fields cite the printed page.
- It corrects E21 only in part: τ̃^c is fixed, but the stray comma in "On the other, hand" remains.
- The other 26 are unchanged in print. Every locator now also gives the printed page.

**Four new mistakes.**

- **E35** (§3, p. 8; p. 1091). "ρ is self-dual if and only if τ is self-dual" is false.
  - For F = F_o and n = 1, an unramified χ with χ(ϖ_F) = i has trivial τ, which is self-dual, but χ is not.
  - Only the forward implication holds. A self-dual τ gives exactly the two self-dual twists ρ, ρ′ of §§1 and 4.
- **E36** (print only, p. 1087). The new "Structure of the algorithm" lists ([ω₁], 2|m₋^{(1)} + m₋^{(2)}| − 1) where §8.1 gives 2|m₋^{(1)} − m₋^{(2)}| − 1. For Example 9.4 the printed formula counts ([ω₁], 3) twice.
- **E37** (print only, p. 1085). "there we give": a word left over from the arXiv sentence "there is an explicit description".
- **E38** (§7.1, p. 13; p. 1096). The root criterion for self-dual polynomials ignores multiplicities. Over 𝔽₇, (X − 2)²(X − 4) satisfies it but is not self-dual. The paper applies it only to irreducible P.

**Where corrections were looked for.**

- The arXiv listing (v1 only).
- The version of record.
- A web search for errata or corrigenda.
- The UEA repository record, which lists only the accepted and published versions.

The cited Blondel paper has a published erratum (Ann. Inst. Fourier 62 (2012) 2385). It corrects that paper, not this one.


## 5. Prerequisites

I checked every link with Crossref and every citation against the paper's bibliography.

- **Replaced: Moy–Prasad.** The paper's [MP] is *Unrefined minimal K-types for p-adic groups*, Invent. Math. 116 (1994), doi:10.1007/BF01231566. The extraction had listed their *Jacquet functors and unrefined minimal K-types* (Comment. Math. Helv. 1996), which the paper does not cite.
- **Replaced: Blondel.** The paper's [Blb], the source of formula (5.1), is *Représentation de Weil et β-extensions*, Ann. Inst. Fourier 62 (2012), doi:10.5802/aif.2724, with an erratum at doi:10.5802/aif.2753. The extraction had listed *Quelques propriétés des paires couvrantes* (Math. Ann. 2005), which the paper does not cite.
- **Kept: Morris, *Level zero G-types* (1999).** The paper attributes the depth-zero description, and in print the covers, to Morris without a reference; its bibliography has only Morris's 1991 filtrations paper and Kutzko–Morris. The prerequisite now says so.
- **Added.** None of these is cited in the atlas:
  - Howlett–Lehrer, Invent. Math. 58 (1980), doi:10.1007/BF01402273 (cited in print);
  - Lusztig, *Characters of reductive groups over a finite field* (1984), doi:10.1515/9781400881772 (Theorem 8.6 and Proposition 8.3);
  - Silberger, Ann. of Math. 111 (1980), doi:10.2307/1971110 (Theorem 4.1(ii)).

## 6. Checks

- `python3 scripts/check_paper.py` passes on the corrected result.
- `scripts/errata.py` and `scripts/collation.py` run on it without error.
- `research/blueprint/intake.py` file checks: 0 problems on the four files.
- A local check confirms that every missing item is taken by exactly one route.
- Nothing was compiled; a paper review has no Lean file.

## Findings

| Finding | Kind | arXiv v1 | Print | Status |
|---|---|---|---|---|
| E1 | misprint | §1, after (1.3), p. 3 | p. 1085 | new |
| E2 | misprint | §2, definition of G_n^+, p. 5 | p. 1089 | new |
| E3 | misprint | §2, definition of the dual lattice, p. 6 | p. 1089 | new |
| E4 | misprint | §2, p. 6, after definition of almost self-dual | p. 1089 | new |
| E5 | error | §2, identification of 𝒢 = J/J^1, p. 6 | pp. 1089–1090 | new |
| E6 | error | §2, p. 6, maximality of J° | p. 1090 | new |
| E7 | gap | §2 p. 7 and §3 p. 8, the case G = SO(1,1) ≃ GL_1 | pp. 1090–1092 | new |
| E8 | misprint | §5, p. 10 | p. 1093 | corrected in print |
| E9 | misprint | §6, p. 12 | p. 1095 | new |
| E10 | misprint | §2, residual forms, p. 6 | p. 1089 | new |
| E11 | misprint | §7.2, (7.1), p. 14 | p. 1097 | new |
| E12 | misprint | §7.2, p. 14, last line | p. 1098 | corrected in print |
| E13 | misprint | §7.2, before (7.2), p. 15 | p. 1098 | corrected in print |
| E14 | misprint | §7.3, recollection of [13, Thm 8.27], p. 17 | p. 1100 | corrected in print |
| E15 | misprint | §7.3, p. 17 | p. 1100 | new |
| E16 | error | §7.3, set-up before Lemma 7.4, p. 18 | p. 1101 | new |
| E17 | misprint | §7.3, p. 18 and first line of p. 19 | pp. 1101–1102 | new |
| E18 | misprint | §7.3, even orthogonal case n = 1, p. 19 | p. 1103 | new |
| E19 | misprint | §7.5, statement of Proposition 7.9, p. 20 | Proposition 7.10, p. 1104 | new |
| E20 | gap | §7.5, proof of Proposition 7.9, p. 21 | proof of Proposition 7.10, p. 1104 | new |
| E21 | misprint | §7.5, proof of Proposition 7.9(i), p. 21 | proof of Proposition 7.10(i), p. 1104 | partly corrected in print |
| E22 | misprint | §7.5, proof of Corollary 7.10, p. 22 | proof of Corollary 7.11, p. 1106 | corrected in print |
| E23 | misprint | §7.5, end of proof of Corollary 7.10, p. 22 | proof of Corollary 7.11, p. 1106 | new |
| E24 | misprint | §7.7, p. 24 | p. 1107 | new |
| E25 | misprint | §9, definitions of E(π) and e_0(π), p. 27 | p. 1111 | new |
| E26 | misprint | §9, Examples 9.3 (p. 30), 9.4 (p. 30), 9.6 (p. 33), 9.8 (p. 33), 9.9 (p. 34) | pp. 1113–1118 | new |
| E27 | error | §9.3, Example 9.7, p. 33 | p. 1117 | new |
| E28 | misprint | §9.3, Example 9.9, p. 34 | p. 1118 | new |
| E29 | misprint | §9.3, Example 9.8, p. 34 | p. 1117 | new |
| E30 | misprint | §9.3, Example 9.9, p. 34 | p. 1118 | new |
| E31 | misprint | §9.1, Example 9.3, p. 30 | p. 1113 | new |
| E32 | misprint | §8, p. 25 | p. 1108 | corrected in print |
| E33 | gap | Theorem (i), §1 p. 4, against §8 p. 24 | Introduction (1.4), p. 1086, and Remark 8.2, p. 1108 | corrected in print |
| E34 | error | Theorem (iii), §1 p. 4, against §9.3 p. 32 and Example 9.6 | Introduction, p. 1086; §9.3, p. 1116 | new |
| E35 | error | §3, p. 8 | p. 1091 | new |
| E36 | misprint | not in arXiv v1 | Introduction, "Structure of the algorithm", p. 1087 | new, print only |
| E37 | misprint | not in arXiv v1 | Introduction, item (ii) of the symplectic results, p. 1085 | new, print only |
| E38 | error | §7.1, p. 13 | p. 1096 | new |
