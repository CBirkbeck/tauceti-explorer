# Red team: PAPER-KALETHA-16 (Kaletha, *Rigid inner forms of real and p-adic groups*)

Job `RT-PAPER-KALETHA-16` (issue #4126), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-KALETHA-16.result.json`, in the format of PROTOCOL section 17.

**Result:** 13 findings: 1 high, 4 medium and 8 low.

- **The extraction.** It is careful and thorough: 157 items (21 library, 24 planned, 112 missing), 7 routes and 15 source issues.
  - Its library items check out at the pins.
  - It follows the author's errata correctly.
  - E07 re-derives independently. The §3.4 claim that H¹ → H¹_ab is bijective when H¹(Γ, G_sc) = 1 fails for SL₂/R.
- **What breaks.**
  - The routing makes the parent roadmap depend on its own Part II.
  - The rigid theory already has a second proposed owner, in Hansen–Kaletha–Weinstein 22.
  - Two load-bearing classical inputs have no item: Kottwitz's H¹ theorem, and degree-2 Tate–Nakayama for tori.
  - The real Harish-Chandra characters are routed to a layer that does not plan them.

## Independence

- **Who did the work.**
  - The extraction was begun by Codex `codex-a71f92` and `codex-c83e7a` (PRs #1968 and #2053, 22–23 September). It was completed by Claude Code `cc-442dc5` (PR #2118, 23 September).
  - The review, REV-PAPER-KALETHA-16, is by Claude Code `cc-d67081` (issue #1191, PR #2571, 24 September).
  - These are the only session ids in the result, the report, the review JSON and the review report. `cc-f805bf` appears in none of them.
  - There is no `research/blueprint/errata/` file for this paper. Its confirmed findings reach the register through the extraction itself.
- **Disclosure.**
  - This session wrote PAPER-FARGUES-SCHOLZE-21, which routes B(G), the Kottwitz map on B(G) and L-parameter stacks to BunGAndNewtonStrata and LanglandsParameterStacks.
  - It also red-teamed PAPER-HE-18 (PR #4839), PAPER-KISIN-PAPPAS-18 (PR #4721) and PAPER-MERKURJEV-SCAVIA-26 (PR #4702).
  - Finding 3 is about Kottwitz's map on H¹(F, G) (Kottwitz 1986), not the B(G) map that FS21 routes.
  - Finding 2 leaves HKW22's B(G) items 006–007 where they are.
  - No finding relies on those earlier deliverables.

## What was read

- **The version of record.** Annals of Math. 184 (2016) 559–632, from the Annals site.
  - Its SHA-256 `55fc2ed2…7c2b` reproduces the review's hash.
  - Read in full through pdftotext. Printed p. 586 was rendered as an image to settle finding 7.
  - Crossref records no update or correction, and the Annals article page mentions none.
- **arXiv 1304.3292v5.** Its hash `8f88e61e…` reproduces the extraction's. There are five versions and v5 is the latest. It was compared at every passage the findings use.
- **The author's errata** (`errata.pdf`, `31e5f2d4…`, reproduced). Read in full at §3, this paper, and §4, the isocrystal paper.
- **The repository.**
  - All 157 items, the 7 routes and the route-7 brief, the 15 source issues, the gaps, the report and the review.
  - The owner stages: RG2.0a and RG2.5; AGD R02.1, R02.2 and D7; ET.0–ET.7; AF.1; SR.0, SR.2 and SR.3.
  - Tau Ceti ClassFieldTheory layers 0, 2, 3, 5 and 9, and ProfiniteCohomology layers 0–13.
  - The overlapping extractions: HKW22, Hansen 26, FS21, He 18, Kisin–Pappas 18, Merkurjev–Scavia 26, Kisin 17 and Liu–Zhu 17.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`. Every cited declaration was resolved, the load-bearing ones were opened, and the index was searched for what is marked missing.

## What holds up

- **E01–E06.** They match the errata's six §3 headings one for one. Finding 7 records the one exception: E04's quotation.
- **E07.** Re-derived independently.
  - For SL₂/R with Z = μ₂ the rigid set has 3 classes: the Corollary 3.8 remark puts two of them over the compact form.
  - H¹_ab ≅ Y₊,tor ↪ π₀(Z(\hat{\bar G})⁺)^* has 2 elements, since Z(\hat{\bar G})⁺ = μ₂ and every character kills the trivial norm image.
  - So the printed criterion fails, although H¹(R, SL₂) = 1.
- **E08–E14.** They hold at their locators.
- **E15.** The review's rejection is right. Corollary 5.4 pairs with the dual side, and for Z(G_sc) → G_sc the group π₀(Z(\hat{\bar G})⁺) is Z([Ĝ]_sc).
- **Statements.** T15, D07 and T44 carry the H¹_ab correction. T42 matches Theorem 5.2 and T53 matches the Q₈ example.
- **Routing coverage.** Every missing item is routed exactly once, and `check_paper.py` reports ok.
- **Owners.** No owner layer has a packet yet, so no route lands in a finished blueprint.

## Findings

### High

1. **The parent depends on its own Part II** (routes 3, 4 and 7).
   - **The Part II's prerequisites.** EndoscopicTransferRigidInnerFormsPartII (route 7) takes ET as its first prerequisite and imports ET.0/ET.1 at 21 prerequisite edges.
   - **What route 4 puts into ET.1.**
     - It sends D33 (the rigid factor (5.1)), T51/T52 (Proposition 5.6), D36 ((5.10)), G05 and G09 to ET.1.
     - D33 needs D23, T44 and D31, which are route-7 items.
     - Route 7's R18 and G10 in turn need D36 and G09, so ET.1 and the Part II each need the other.
   - **What route 3 puts into ET.0.** It sends D34 to ET.0, although D34 needs D23. The planned item P12 lists the real Weil group R01 (route 7) as a prerequisite.
   - **The brief builds the cycle in.** It tells the Part II to "export the rigid torus pairing to ET.1" and to "Export these to ET.1's unconditional adelic product".
   - **Why it matters.** PROTOCOL §15 says a Part II "starts where the existing roadmap stops".
   - **Fix.** Move those seven items into route 7, which then imports D32 and P12. Drop R01 from P12. Rewrite the two "export" sentences.

### Medium

2. **Rigid inner forms have two owners.**
   - **HKW22's plan.** HKW22 route 1 (HeckeStacksAndLocalShtukasKottwitzPartII) has these missing items:
     - 008: rigid H¹, Corollary 3.8 and Corollary 5.4;
     - 009: the refined LLC;
     - 010: S_φ⁺ and Z(\hat{\bar G})⁺.
   - **This extraction's plan.** Route 7 plans the same objects as D05/D06, T13, T44, D27/D35 and C01/C02.
   - **Nobody reconciled them.**
     - HKW22's report says its items should move once this Part II is accepted.
     - This extraction read the HKW22 result (it is in its baseline list) but no route, report or review mentions it.
   - **The two plans differ.** HKW 008 is p-adic only and lacks the errata's H¹_ab form of Corollary 5.4.
   - **Fix.** Make route 7 the single owner. HKW22's items 008–010 become planned against it. HKW22 keeps 007 and 011–014.

3. **Kottwitz's theorem [Kot86, Th. 1.2] has no item.**
   - **What it is.** The map H¹(F, G) → π₀(Z(Ĝ)^Γ)^D, a bijective group isomorphism for p-adic F.
   - **Where the paper uses it.**
     - The p-adic bijectivity in Corollary 3.8.
     - The proof of Lemma 4.9, which feeds Theorem 4.11 for every F, including R.
     - The group structure announced in §4.7.
     - Corollary 5.4's last sentence: "If Z = {1}, this pairing coincides with the one defined by Kottwitz".
     - The last step of Lemma 5.7.
   - **What the extraction has.** Kot86 appears only as a prerequisite paper and in the deferred GAP04. T44 drops the Z = {1} clause, and T31 omits the group structure.
   - **Fix.** Add an item at ET.0, which plans the "Kottwitz invariants" and to which Kisin 17 already routes Borovoi and Kneser. It needs the statement used for F = R. Restore the two clauses.

4. **Degree-2 Tate–Nakayama for tori has no item.**
   - **What is used.** The isomorphism X_*(S)^Γ/N → H²(Γ_{E/F}, S(E)), injectivity of inflation to H²(Γ, S), and H²(Γ, S) = 0 for anisotropic S.
   - **Where.**
     - Theorem 4.8's five-lemma needs its fourth vertical map to be injective. The paper derives that injectivity from exactly these facts (p. 587).
     - Corollary 3.7(1) needs the vanishing for anisotropic S (p. 575).
   - **What the extraction has.** P12 states only degree −1 → 1.
   - **Fix.** Extend P12, citing ClassFieldTheory layers 0 and 3 and ET.0, with the sign λ ↦ λ ∪ c_k⁻¹. Add it to the prerequisites of T27, T12 and T28.

5. **Real characters go to the wrong layer** (route 5, P18).
   - **What the route claims.** Route 5 cites AF.1's "character foundation".
   - **What AF.1 has.** AF.1 plans (g,K)-modules, globalizations and relative Lie algebra cochains, but no distribution characters.
   - **Who owns them.** ET.1 says: "These require the real character/Paley–Wiener ... arguments ... Construct them here from AF.1's real representation foundation."
   - **Fix.** Route P18 to ET.1.

### Low

6. **A gap in the proof of Corollary 3.8 (p-adic) is not recorded.**
   - **What the printed proof shows.** A trivial kernel, and that H¹(Γ, G) → H¹(Γ, G_ad) is injective. Neither gives injectivity of the rigid map: the paper's own real remark shows non-neutral fibres can be nontrivial.
   - **What is missing.** By twisting, each fibre is the image of H¹(Γ, Z) in H¹(Γ, G_z). The printed argument kills this only for G_z = G, which has a split maximal torus.
   - **The result survives.**
     - H¹_ab(G_z) = H¹(Z(G_sc) → Z(G)) is the same for every inner form.
     - So H¹(Γ, Z) → H¹_ab(G_z) factors through H¹ of a split torus of G, which is trivial.
     - H¹(G_z) → H¹_ab(G_z) is injective for p-adic F by Kneser.
   - **Fix.** Add a source issue (gap, affects the proof). Give T14 the missing prerequisites.
7. **The review misquoted E04.**
   - **What the review wrote.** When it replaced every printed field by "a verbatim quotation of the published text", it gave E04 the errata's quotation of the old display, ending "⊔ δ_e".
   - **What the published p. 586 has.** "φ_{λ̄,k}(p(x)α_k(σ)) · (l_k c_k ⊔ n_k λ̄)(σ)". This half of the correction is already in print; arXiv v5 still has δ_e.
   - **Why it matters.** E04's own reason and GAP07 say exactly this.
   - **Fix.** Quote the published last display, which is the part still open.
8. **T54 states only one direction of Lemma 5.7**, which is an "if and only if" statement. The proof of Proposition 5.9 needs both directions.
9. **P04 has the wrong owner.** The five-term sequence and the transgression of Lemma 3.3 are Tau Ceti ProfiniteCohomology layer 5, whose degree-one part is already built (L33). They are not the proposed ArithmeticGaloisDuality R02.2.
10. **P02 is partly built.** The pin has degree-one Shapiro (`explicitShapiro1`, Shapiro.lean:372), finite-quotient colimits in degrees 0 and 1 (`explicitFiniteQuotientColimit0/1`) and degree-one corestriction (`explicitCor1`). Only the Shapiro–norm compatibility remains planned.
11. **Two Kottwitz inputs have no item.**
    - Kot82, Cor. 2.2: stable conjugates in the quasi-split form, and rational embeddings of tori. D33, T41 and R02 need it.
    - The Kottwitz sign e(G) [Kot83], with e(M₁′) = e(G′). C02, R17, R19 and R20 use it.
12. **A misprint in the proof of Theorem 3.1 is not recorded.** p restricted to the diagonal μ_{n_k} is the [E_k:E_j]·(n_k/n_j)-power map, not the (n_k/n_j)²-power map. The two agree only when n_k = [E_k:F]. Over R the conclusion still holds, because H²(R, μ_n) is killed by 2.
13. **No `sourceVersions`**, although E05 and E07 quote stated results.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-KALETHA-16.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
