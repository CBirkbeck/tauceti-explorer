# RT-PAPER-LAWRENCE-VENKATESH-20: red team of the extraction of Lawrence–Venkatesh, *Diophantine problems and p-adic period mappings*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4532).

**Target.** `PAPER-LAWRENCE-VENKATESH-20` extracts B. Lawrence and A. Venkatesh, *Diophantine problems and p-adic period mappings*, [Invent. Math. 221 (2020), 893–999](https://doi.org/10.1007/s00222-020-00966-7). The extraction has:

- 67 items: 3 library, 41 planned, 23 missing;
- 2 routes:
  - a Part II, `MordellLawrenceVenkateshPartII`, coalesced with Lawrence–Sawin's;
  - a source route to MordellLawrenceVenkatesh LV.1;
- 3 source issues.

**Who did what.**

- Claude Code `cc-39fac3` wrote the extraction (issue #2162, PR #4043).
- Claude Code `cc-fb70e5` wrote `REV-PAPER-LAWRENCE-VENKATESH-20` (PR #4471). It accepted both routes and confirmed E1–E3. It changed only verdicts, locators, `sourceVersions` and the gaps.
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.**

- This session wrote **FIX-RT-AUDIT-07**. Its finding /6 recorded that DT.2 misses MordellLawrenceVenkatesh:LV.6, the S-unit theorem, with a maintainer note, because LV.6 is not an atlas stage. **Finding 7 touches this.**
- This session red-teamed **PAPER-BETTS-STIX-25** (PR #4718).
  - Its confirmed finding /13 is the same kind of error as **finding 1** here: a period map planned at LV.3 beyond LV.3's generality.
  - It did not flag Betts–Stix route 2, which **finding 4** shows conflicts with this extraction's route 1.
- This session wrote **PAPER-DELIGNE-80**. Finding 5 cites its routing of purity to DWP.7 as the owner, and finding 9 is consistent with its LPV.5 route. Neither asks for a change to it.
- This session also wrote PAPER-SCHOLZE-13 and red-teamed PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 (PR #4742). No finding touches them.

**Result: 12 findings, 2 high, 3 medium and 7 low.** The machine-readable file is [RT-PAPER-LAWRENCE-VENKATESH-20.result.json](RT-PAPER-LAWRENCE-VENKATESH-20.result.json).

- **Where the work is sound.**
  - Every numbered result of §§2–12 has an item. The small count (67 items for about 100 pages) comes from bundling, not from skipped lemmas.
  - E1–E3 are right.
  - The routes create no cycle.
- **Where it breaks.**
  - *Statuses.* Seven planned items point at layers that do not plan them in the paper's generality.
  - *Imported inputs.* The theorems the proofs import have almost no items.
  - *Errata.* The roadmap's confirmed errata were not applied to the items.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v3 (25 October 2019), 76 pp., the last version | [arxiv.org/pdf/1807.02721v3](https://arxiv.org/pdf/1807.02721v3) | `e3013516…c6b9b` (matches) |
| Published article, 107 pp., printed page = PDF page + 892 | [bimsa.net journal PDF](https://bimsa.net/doc/publication/2578.pdf) | `588e450a…db43bd` (matches) |

- Both were fetched on 30 September 2026.
- **Later versions and errata.**
  - The arXiv API lists v3 as the last version, and `/abs/1807.02721v4` returns 404.
  - Crossref lists no update or relation for the DOI.
- **How I read it.**
  - Three parallel readers covered every line of arXiv v3: pp. 1–25, pp. 25–51, and pp. 51–76 with the bibliography.
  - Six pages were checked on rendered images: pp. 53, 58, 62, 63, 64 and 69.
  - I re-read every passage that a finding quotes, and located each in the published text, where all persist.
- Page numbers below are arXiv v3 pages.

## How statuses and routes were checked

- **The planned layers.** MordellLawrenceVenkatesh is a draft roadmap in `research/blueprint/roadmaps/`, with review `needs_changes`. It is not in `data/atlas.json`. PROTOCOL §16 allows it as a planned target.
- **What I read.**
  - All twelve LV stages.
  - The statements of every LV.2–LV.4 node in its 132-node packet, and all 73 supplier requests.
  - The owner layers of every other citation: LD.6 and its packet; R28.1 and R28.5 with their nodes; DT.2; RP.4; R01.1; R06.2, R06.5 and R06.6; CP.0–CP.6; DWP; R34; WC; LPV; LP2 and its packet.
- **Libraries.**
  - The three Mathlib citations were read at 082e2d3.
  - Tau Ceti f790474 has no Chebotarev density theorem (only preparatory lemmas), no flag varieties, no Lagrangian Grassmannian and no Eulerian numbers.
- **Cycles.**
  - No link, stage edge or packet link goes from an LV stage to another roadmap. So nothing the Part II or LV.1 imports can depend on them, and there are no cycles.
  - The Part II's design (DESIGN-MordellLawrenceVenkateshPartII) and its review are still pending, so there is no design to compare with.

## High

### 1. The §3 machinery is planned only for H¹ of abelian-by-finite families over curves, but the paper and the Part II need it in general

- **The paper's generality.** §3 is stated for any smooth proper family over a smooth base of any dimension:
  - p. 15: "Let Y be a smooth K-variety, and π : X → Y a proper smooth morphism";
  - p. 16: "Fixing a degree q ⩾ 0";
  - Proposition 3.4: "H a space of flags in V".
- **Where §§9–10 use it.**
  - §9.2 uses it for "the p-adic period map (9.2) Φ_p : residue disk around y₀ in Y(Q_p) → H*_{Q_p}".
  - §10 uses it for primitive H^d of the universal hypersurface family, whose base has dimension C(n+d, d) − 1.
- **What LV plans.** LV.2–LV.4 plan only a narrow case:
  - LV.2: "for polarized abelian schemes over a finite étale cover of the base";
  - LV.3: "specialized to the degree-one cohomology of abelian-by-finite families";
  - LV.4: Proposition 3.4 "for polarized abelian schemes over a curve";
  - every period-map node of the packet opens with "Setting P: … abelian-by-finite family";
  - its request to R06.5 ends "(the case i = 1 for abelian schemes suffices)".
- **What goes wrong.**
  - Six items are marked planned beyond their layers: /good-model-gm, /monodromy-group, /lemma-3-1, /lemma-3-3, /crystalline-transport and /prop-3-4.
  - The period domain H and its compact dual H*, the flag varieties of (self-dual) filtrations, have no item at all.
  - Route 1's brief tells the Part II to import "period maps and Gauss–Manin transport from MordellLawrenceVenkatesh LV.2–LV.3". Those layers do not provide them for hypersurface families.
  - Lawrence–Sawin's own brief says the LV roadmap runs the method "on the primitive cohomology of an abelian-by-finite family over a curve".
- **Fix.**
  1. Restrict the six statuses to the abelian H¹ case.
  2. Add missing items for:
     - general Gauss–Manin transport, period maps, Lemmas 3.1–3.3 and Proposition 3.4;
     - the period domains H and H*.
  3. Route both new items to the Part II, and correct the brief.
  4. Plan the general crystalline comparison at CP.2 and R06.5.
  5. Tell the design job that PAPER-BETTS-STIX-25 route 4 also sends a general v-adic period map to LV.3, so it must choose one owner.

### 2. Bakker–Tsimerman's Ax–Schanuel theorem has no owner

- **The claim.** Item /bakker-tsimerman (Theorem 9.1) is "planned" at LD.6, and route 1 imports it from there.
- **What LD.6 says.** It treats Ax–Schanuel as an input an application "must provide" ("independent Galois-orbit and Ax-Lindemann/Ax-Schanuel inputs"). Its 13-node packet has nothing on Ax–Schanuel or period maps. The item's own note concedes this.
- **The supplier that exists.** The supplier LD.6 lacks is the accepted Part II LogicAndDefinabilityPartII, from PAPER-MOK-PILA-TSIMERMAN-19. It covers only Shimura varieties.
- **Consequence.** The input on which Corollary 9.2, Lemma 9.3, Theorem 10.1 and Proposition 10.2 all rest has no owner.
- **Fix.**
  - Mark the item missing.
  - Route it to LogicAndDefinabilityPartII, adding Ax–Schanuel for variations of Hodge structure (Bakker–Tsimerman 2019, Theorem 1.1) as a second final theorem.
  - Change route 1's import.
  - PAPER-LAWRENCE-SAWIN-25/76 has the same error.

## Medium

### 3. The roadmap's confirmed errata are not applied to the items

PROTOCOL §18 says items use corrected statements. Six items copy statements corrected by confirmed entries of `research/blueprint/errata/MordellLawrenceVenkatesh.json`:

- **/lemma-2-8 (E3).** It keeps η²|_{K_v^×} = χ·Norm^w on all of K_v^×. This is false.
  - Take K = Q, v = p and η = χ_cyc, which is pure of weight 2.
  - Then η²/Norm² sends p to p^{−2}, which is not of finite order.
- **/lemma-2-12 (E22).** It keeps "for all i, j". This is unsatisfiable for i = j, so the item as stated is vacuous.
- **/lemmas-8-2-8-3 (E13, E14).** A curve bounding a disk has null-homologous preimages, so "linearly independent" fails.
- **/lemma-2-3 (E2).** It says "unramified outside S", with no place of S above p.
- **/prop-5-3 (E7).** It omits odd residue characteristic.
- **/lemma-6-3 (E10, E25).** It omits 0 ≠ W ≠ V, A ≠ ∅ and the similitude condition.

The review's gap says "The items planned in MordellLawrenceVenkatesh use that roadmap's corrected statements". The items in this file do not. The gap's item list also misses three of them.

### 4. Lemma 2.6 and G-irreducibility get two owners, and the brief ignores that the printed proof fails

- **Two owners.**
  - PAPER-BETTS-STIX-25 route 2 (accepted) sends "The symplectic form of Faltings's lemma ([LV20, Lemma 2.6]) and GSp-irreducibility" to LV.1.
  - This extraction sends the general Lemma 2.6, and G-irreducibility, G-complete reducibility and G-semisimplification, to the Part II.
  - LV.1 is upstream of the Part II, so the same lemma would be planned twice.
- **The proof.** Route 1's brief lists Lemma 2.6 as a result to import. Confirmed erratum E28 says the printed proof fails: the double cosets must be taken under the centralizer of L, not L(Q_p), and a further finiteness result is needed.
- **Fix.**
  - Choose one owner; LV.1 is recommended, with the Part II keeping only Lawrence–Sawin's disconnected-group version.
  - Record E27 and E28 in the item and the brief.
  - Add Richardson (1967) to the prerequisites.

### 5. The imported theorems have no items

Every numbered result has an item, but almost none of the external theorems the proofs import do.

**Planned elsewhere:**
- Chebotarev (§4.1, Theorem 5.4, Lemma 10.4), at Tau Ceti Chebotarev Layer 10.
- Weil's theorem and Deligne's purity, without which Lemmas 2.3 and 2.6 cannot be applied to ρ_y: DWP.1, DWP.4, DWP.7 and R34.5.
- Néron–Ogg–Shafarevich, at R11.5.
- D_cris full faithfulness and weak admissibility, at R06.2.
- Faltings's comparison [16], at CP.2.
- Berthelot–Ogus and crystalline Frobenius, at CR.2 and CR.3.
- Gauss–Manin [23], at C5.
- Fontaine–Laffaille theory and the Tannakian fibre functors of footnote 10, at R07.3.
- Strassmann's theorem, at LV.3.
- Riemann existence and GAGA, at IG.3 and C2.
- The Weil pairing on H¹_et, at EDC.2.

**Missing:**
- The trace formula in Lemma 12.1.
- Richardson's theorem and finiteness of H¹(Q_p, S) in Lemma 2.6.
- The analytic Nullstellensatz, Tate-algebra Noetherianity and Krull's intersection theorem in Lemma 9.3.

The prerequisites list also omits Faltings 1989, Katz–Oda 1968 and Richardson 1967.

## Low

6. **Library claims are too broad.**
   - Mathlib's `NumberField.finite_of_discr_bdd` is Hermite's theorem over Q for bounded discriminant. The form used is "bounded degree over K, unramified outside S", which is planned at the R28.1 node.
   - `Module.Grassmannian` is a single Grassmannian. The §3.4 flag variety and the §6 Lagrangian Grassmannian are not in Mathlib.
   - The /grassmannian locator copies erratum E26.
7. **The S-unit and Mordell statements already have owners.** These are DT.2, and RP.4 with the R28.5 node. LV.6 and LV.11 re-prove them, and should cite those owners. This relates to FIX-RT-AUDIT-07.
8. **G-complete reducibility is also planned at LP2.** The node LP2:semisimple-characters plans Serre's definition for L-parameters.
9. **The symplectic case of hypersurface monodromy is planned at LPV.5.** LPV.5 plans Deligne's open-image theorem for Lefschetz pencils with odd-dimensional fibres, so only the orthogonal case is missing.
10. **Eight items have unfaithful statements or locators.**
    - Theorem 10.1: "dense in" the identity component instead of "closure containing" it; V₀ is undefined; the unproved finiteness addendum is stated as a result.
    - Proposition 10.2: the item adds the Diophantine conclusion, says "moduli space" and "good reduction outside S", and loses the source's integral points of F_{n,d}.
    - Theorem 5.4: condition (ii) is replaced.
    - Lemma 4.2: conditions (ii) and (iii) on v are dropped.
    - /good-model-gm: says the horizontal sections have coefficients in O_(v).
    - /crystalline-transport: cites the wrong reference.
    - Locators of Lemma 10.5 and Proposition 5.3.
11. **Seven source mistakes are unrecorded.** None is in the extraction or the roadmap errata; all persist in print.
    - (i) *Gap in Lemma 2.10.* Its proof applies the crystalline Lemma 2.9 to an induced representation, which is not crystalline when L_u/K_v is ramified.
    - (ii) *Gap in Lemma 10.5.* It bounds Z(Frob), but its proof needs Z(Frob^ss), and Z(φ) ⊆ Z(φ^ss).
    - (iii) *Misprint on p. 26.* "any prime ℓ … less than 8[K:Q]" includes ℓ = 2, which no odd q satisfies.
    - (iv) *Misprint on p. 62.* The factor should be ℓ^d, not ℓ.
    - (v) *Misprint in Lemma 2.5.* "character" should be cocharacter.
    - (vi) *Gap in Lemma 9.3.* It allows p = 2, which the convergence argument of §3.3 excludes.
    - (vii) *Misprint on p. 57.* "adjoint square" should be alternating square.
12. **Lemma 2.2 belongs at R01.1.** It is general representation theory. R01.1 plans induction and restriction, and the LV packet already requests the half of the argument about restriction from R01.1.

## The review

- The review's published locators (pp. 971, 995–996, 941) are right.
- Its one error is the gap text in finding 3: the claim that the items use the roadmap's corrected statements.
- Its statement that "All compared statements match their items" is literally true, but only because both follow the printed text.
