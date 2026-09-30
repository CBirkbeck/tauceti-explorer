# RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5009, job FIX-RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19).

**Scope.**
- **Findings:** `RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json`, by cc-f805bf.
- **Verdicts:** `RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19.review.json` and
  `reviews/REV-RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19.md`, by Claude Code session cc-58621d. All twenty findings are
  confirmed.
- **This job:** the issue lists four high (/1–/4) and six medium (/5–/11) findings. This job applies them. The nine low
  findings (/12–/20) are not part of it.
- **Corrections:** where the verifier corrected or qualified a fix, I applied its version. Each section says how.

**Files changed.**
- `papers/PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json`, edited by a script that asserts each replaced string occurs
  once. The file keeps its own format (indent 2, UTF-8).
- `papers/PAPER-BREUIL-HELLMANN-SCHRAEN-19.md`. Its routing list is rewritten, because /7 asks for the report's claim
  about eigenvarieties to be corrected, and a closing section is added.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 135 (12 planned, 123 missing) | 149 (8 planned, 141 missing) |
| Routes | 7 | 8 (4 and 6 replaced in place, 8 added) |
| Prerequisites | 21 | 22 |
| Source issues | 11 | 13 (E12, E13) |

**Independence.** I did none of:
- the extraction (cc-fb70e5);
- its review (cc-d67081);
- the red team (cc-f805bf);
- the verification (cc-58621d).

**What I read, on 30 September 2026.**
- **The published Numdam PDF** (sha256 `34ffd697…3967a`, matching), at pp. 305, 315, 381–384, 386–390, and the
  bibliography.
- **In the atlas:** I checked the ids and titles of CompletedCohomologyPartII CC.1/2/5/8, GlobalGaloisDeformations G7,
  PadicMeasuresIwasawaAlgebras L0a, AutomorphicGaloisRepresentationsPartII AG2.3, PadicFamilies L2a, PadicHodgeTheory
  R06.1 and P7, and Tau Ceti ReductiveGroups Layers 3 and 7. For their texts I relied on the red team's and verifier's
  quotations.
- **The P7 packet's node list.**
- **The four routes this fix joins:** BCGP-25 route 3, FF-18 route 5, DING-25 route 1 and BIP-23 route 7. All are
  accepted, and their design jobs (#3373, #3426, #3411, #3459) are still available.
- **The Tau Ceti declarations** VermaModule, irreducibleQuotient, CoxeterSystem.bruhatPartialOrder,
  TauCeti.longestElement and TauCeti.dotAction.
- **Crossref**, for this paper and for Brylinski–Kashiwara, and the **arXiv API**.

**How the routes were renumbered.** `make_queue.accepted_routes` matches review verdicts by route number. Deleting routes
4 and 6 would shift the verdicts of routes 5 and 7 onto other routes. So route 4 (P7 source) is replaced in place by the
PadicHodgeTheory Part II join, and route 6 (R31 source) by the LocallyAnalyticRepresentationsOfLocalGroups join. The
LieHighestWeight Part II join is appended as route 8. Routes 1, 2, 3, 5 and 7 keep their numbers.

## /1 (high, missing): category O and Kazhdan–Lusztig theory have no owner

**Following the verifier's adjusted fix.**
- **Item 2.4-category-O** becomes Verma modules and L(μ) only. It stays planned at LieHighestWeight Layer 3 and is not
  marked library. Its note cites tauceti:TauCeti.VermaModule (Verma.lean:196) and irreducibleQuotient (:416) with their
  limits, which I read in the file: a non-degenerate Killing form, and "What is *not* proved here is that `M(lam)` is
  nonzero".
- **New missing items** `2.4-category-O-block`, `2.4-kl-polynomials` and `2.4-kl-theorem` go to a new route 8. It is keyed
  exactly like PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 3 (LieHighestWeightPartIICompletedCategoryO, same title, parent
  and area), so they join DESIGN-LieHighestWeightPartII (#3373).
- **The Kazhdan–Lusztig theorem** is stated as an imported input.
- **D-module foundations.** A new item `2.4-dmodules` is routed to route 1; Beilinson–Bernstein and characteristic
  cycles were already items there.
- **Route 1's brief** imports category O and Kazhdan–Lusztig theory from route 8 and builds the D-modules.
- **Prerequisites.** Brylinski–Kashiwara (doi:10.1007/BF01389272, checked) is added. Beilinson–Bernstein and Humphreys
  are already prerequisites.

**A dependency the design jobs must order.** The Kazhdan–Lusztig theorem's proof by localisation needs the D-modules and
Beilinson–Bernstein that route 1 builds, while route 1's cycle theorems use the Kazhdan–Lusztig theorem. The briefs of
routes 1 and 8 and item 2.4-kl-theorem's note say that the D-module layers must come first, or the theorem be kept as a
stated input.

**PAPER-DING-25's route 1 brief** makes the same assumption; see the maintainer notes.

## /2 (high, error): the trianguline variety is built in route 2

- **Item 3.7-xtri** is missing and moves from route 5 to route 2.
- **Route 2's brief** now asks for X_tri(r̄) as the closure (3.29), with reducedness and equidimensionality (BHS 2017,
  Th. 2.6). It imports R08.1, PG.7 (KPX), PadicMeasuresIwasawaAlgebras L0a for T^n_L (the verifier's addition), and the
  rigid generic fibre.
- **Item 3.6-galois-groupoids** keeps X_r and X_r → X_V at R08.1. Following the verifier, its note says that this matches
  R08.1 only by analogy, and that Kisin's identification [53, Lemma 2.3.3, Prop. 2.3.5] is stated by no node.
- **The trianguline groupoids and X_V ≅ X_D** form the new item `3.6-trianguline-galois-groupoids` in route 2.
- **Route 5** keeps stage R08.1 only, with a rewritten reason.
- **Route 2's reason** no longer says R08.3 supplies the ring.
- **PAPER-DING-25/4.1-xtri** has the same error (maintainer note).

## /3 (high, error): Fontaine's theory and Berger's functors get one owner

Following the verifier, only the first option is consistent: B_dR-representations already have an owner through FF-18
item 941.

- **Items 3.1-bdr-reps, 3.1.1-equivalence and 3.3.5-WdR** are now missing.
- **Items 3.1-bpdr and 3.1.4-coefficients** leave route 2.
- **A new item `3.5-bpairs-berger`** is taken out of 3.5.1: B-pairs and Berger's equivalence with coefficients.
- **These six items** go to route 4, now a part-ii keyed exactly like PAPER-FARGUES-FONTAINE-18 route 5
  (PadicHodgeTheoryPartIIEquivariantBundlesOnTheCurve), which merges into DESIGN-PadicHodgeTheoryPartII (#3426).
- **3.1-bdr-reps' note** cites PadicHodgeTheory:P7/sen-module for the Sen weights. The node exists in the P7 packet.
- **Route 2's reason** takes B_dR from R06.1, Sen theory from P7 and the rest from the Part II, and its brief imports
  them.
- **PAPER-DING-25 items 2.1-bpairs and 2.2-fontaine-bdr** make the same P7 claim (maintainer note).

## /4 (high, error): the codimension of the character-fibre cycles

**The check.**
- In the published PDF, the printed "Z^{[K:Q_p] n(n+3)/2}" appears in Theorem 1.9 (p. 305), Conjecture 4.3.4 (p. 381),
  (4.12) (p. 382) and the proof of Theorem 4.3.8 (pp. 382–384). Remark 4.3.5 (p. 381) has "n² + [K:Q_p]n(n−3)/2".
- I redid the verifier's count, using only the paper's own dimensions.
- The case n = 1, [K:Q_p] = 2 is decisive. X_tri is then the ambient 3-dimensional space and the fibre over δ is a point,
  so the codimension is 3. The printed value is 4.

**E12** is new: an error that affects a stated result, with the correction codimension [K:Q_p]n(n+1)/2 + n and fibre
dimension n² − n + [K:Q_p]n(n−1)/2. Its searches were refreshed: Crossref has no update relation, and arXiv has v1 only.
I did not check the authors' web pages, and the entry does not claim I did.

**Where the number was stated.** Following the verifier, it is corrected in the three items that state it
(1-thm19-breuil-mezard, 4.3-cycles-setup and 4.3.4-conjecture, together with the latter's fibre dimension), in
`conventions.cycles` and in the gap two-cycle-families. Items 4.3.7 and 4.3.8 get notes that they inherit it. Route 2's
brief states the corrected codimension.

## /5 (medium, duplicate): completed cohomology

Following the verifier, the item is split in three.
- **Item 5.1-completed-cohomology** covers Ŝ(U^p,L), T^S and localisation. It is planned at CompletedCohomologyPartII
  CC.1 (tame Hecke), CC.2, CC.5 and CC.8.
- **A new item `5.1-deformation-ring`** is planned at GlobalGaloisDeformations G7.
- **A new item `5.1-locally-analytic-vectors`** is missing, and routed with /8's items to route 6.

**Other changes.**
- R31.2 is dropped, since route 6 is replaced.
- Route 3's brief imports these.
- Route 3's reason no longer says the parent owns completed cohomology.

## /6 (medium, error): the patched module and the patched eigenvariety

Item 5.1-patched is split as the finding proposes, and R31.5 is dropped.
- **Item 5.1-patched** is missing. It keeps the patched eigenvariety X_p(ρ̄) and (5.8), and moves to route 3 beside
  1-patched-eigenvariety.
- **A new item `5.1-patched-module`** (R_∞, M_∞, Π_∞ for GL_n) goes to route 3. That route has the same parent as
  PAPER-BOCKLE-IYENGAR-PASKUNAS-23 route 7, so both are in design #3459.
- **Route 3's brief** names Emerton's Jacquet functor (route 6) and the trianguline variety (route 2) as imports.

## /7 (medium, duplicate): the eigenvariety

Following the verifier, the object is duplicated but the construction is not.
- **Item 5.1-eigenvariety's note** cites AutomorphicGaloisRepresentationsPartII AG2.3 on PadicFamilies L2a, and
  PadicMeasuresIwasawaAlgebras L0a for the weight space. It keeps Emerton's Jacquet-module construction, which also
  defines X_p(ρ̄), with a comparison to AG2.3 wherever the two are identified.
- **Route 3's reason and brief, and the report's routing section,** no longer say that nothing plans a definite-unitary
  eigenvariety.
- **PAPER-DING-25/4.2-eigenvariety-U** is a maintainer note.

## /8 (medium, missing): the locally analytic inputs

- **Four new missing items:** `5.2-orlik-strauch-functor`, `5.2-orlik-strauch-jh` (the source of m_{δ,Π} and of
  multiplicity one in Proposition 4.3.6), `5.2-emerton-jacquet` and `5.2-emerton-adjunction`.
- **With `5.1-locally-analytic-vectors`,** they go to route 6. It is now a new route keyed exactly like PAPER-DING-25
  route 1 (LocallyAnalyticRepresentationsOfLocalGroups, same title and area), so they merge into
  DESIGN-LocallyAnalyticRepresentationsOfLocalGroups (#3411), which has not landed.
- **Route 6's brief** carries Remark 5.1.2's product-of-groups extension. The gap orlik-strauch-over-products now names
  that owner.
- **Lemmas 5.2.1–5.2.6.** Following the verifier, they are general (p. 390: any very strongly admissible Π^an). They stay
  in route 3, stated in that general form, and route 3's brief no longer says "Develop the Orlik–Strauch functor".

I checked the references in §§5.1–5.2: Emerton's Jacquet functor is their [32], Orlik–Strauch [58] and Breuil [16].
Emerton's adjunction is stated at the level of Emerton's "Jacquet modules … II" and its use through Breuil [16] in Lemma
5.2.1. I did not read Emerton II, so the item gives no theorem number.

## /9 (medium, error): the flag variety

- **Item 2.1-setting** is planned at Tau Ceti ReductiveGroups Layer 7, plus Layer 3 for the quotient G/H, which the
  verifier asked to cite. LieGroups Layer 8 is no longer named.
- **Its note** cites CoxeterSystem.bruhatPartialOrder (Bruhat.lean:240), TauCeti.longestElement (LongestElement.lean:194)
  and TauCeti.dotAction (DotAction.lean:108) as pointers only, with the verifier's caveats: an abstract Coxeter system,
  and a root system's Weyl group rather than N_G(T)/T.
- **A new item `2.1-flag-variety`** covers G/B as a smooth projective scheme, the orbits U_w and their closures. It is
  routed with its consumer in route 1, which the verifier accepts. The note records the alternative: a Part II of Tau
  Ceti ReductiveGroups, joining DESIGN-ReductiveGroupsPartIII.
- **Route 1's reason** is corrected.

## /10 (medium, error): miracle flatness

- **Item 2.3.2-miracle-flatness** is restated with the local dimension equality (Matsumura, CRT Theorem 23.1, as the
  verifier corrected the finding's "Matsumoto"; EGA IV 6.1.5). It adds the condition under which the global hypothesis
  implies that equality, and the note lists the uses, including p. 408.
- **E13** is new: an error that affects nothing, with the Spec k ⊔ A¹ → A¹ counterexample.

## /11 (medium, error): E8's correction

- **E8's correction** now reads "finite projective A⊗_{Q_p}K-modules (for A in C_L, τ-components finite free A-modules)".
- **E8's reason** loses its rank-one sentence and gains the τ-dependent-jump argument.
- **E8's embedded review**, which endorsed "free", is not rewritten. A dated bracket is appended saying that the confirmed
  correction was too strong and has been replaced.
- **Item 3.2.2-filtered-equivalence** states the corrected condition.
- **The register.** The verifier notes that E8's old correction has reached `research/errata/REGISTER.md`. It will change
  when the register is regenerated.

## Not applied, and why

- **The nine low findings (/12–/20)** are outside this issue.

## For the maintainer

- **Verdicts.** Record verdicts in `PAPER-BREUIL-HELLMANN-SCHRAEN-19.review.json` for:
  - route 4 (now the PadicHodgeTheory Part II join) and route 6 (now the LocallyAnalyticRepresentationsOfLocalGroups
    join), whose recorded "accept" verdicts describe the old P7 and R31 source routes;
  - the new route 8;
  - route 5, which dropped R08.3 and item 3.7-xtri.

  Until then the old verdicts of routes 4 and 6 apply to the new routes.
- **PAPER-DING-25 makes the same assumptions.** Its route 1 brief imports category O from LieHighestWeight (/1). It marks:
  - item 4.1-xtri planned at R08.3 (/2);
  - items 2.1-bpairs and 2.2-fontaine-bdr planned at P7 (/3);
  - item 4.2-eigenvariety-U planned at O0/L2, while its own note says nothing plans it (/7).
- **Regenerate the errata register** so that E8's corrected text and E12–E13 appear.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/*.result.json`: every extraction ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- Every missing item is routed exactly once. Routes 4, 6 and 8 match their partner routes' keys (id, title, parent,
  area).
