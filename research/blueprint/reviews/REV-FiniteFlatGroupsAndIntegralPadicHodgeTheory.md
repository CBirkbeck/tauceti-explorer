# REV-FiniteFlatGroupsAndIntegralPadicHodgeTheory

Independent review of the complete blueprint pass for *Finite flat group schemes and integral p-adic Hodge theory* (stages R07.1–R07.6). Refs #408.

- **Reviewer:** Claude (Opus), session claude-Hr5kyH, 2026-10-13. This session wrote none of the blueprint: the passes were by cc-fb70e5 (checkpoints #3824–#3848) and claude-BrsoBP (#9351).
- **Verdict:** **accepted**, with the corrections below made in place.
- **Deliverables edited:**
  - the packet `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`;
  - the suggested file `research/blueprint/suggested/FiniteFlatGroupsAndIntegralPadicHodgeTheory.lean`.

  The reader document is not a deliverable of this review. It lags the corrections; see "Reader lag".

## Counts

| | Before | After |
|---|---|---|
| Nodes | 146 | 147 (1 added) |
| Node verdicts | — | 97 verified, 49 corrected, 1 added |
| Baseline declarations | 44 | 46 (2 added; 6 `provides` texts narrowed; 1 prerequisite removed as a near miss) |
| Requests | 14 | 16 (2 added for Tau Ceti layers; 2 narrowed) |
| Source issues | 17 | 17, all confirmed |
| Planets | 32 | 32 |
| `check_blueprint.py` (with the pinned index) | 0 errors, 0 warnings | 0 errors, 0 warnings |
| Suggested file | 1163 lines, 130 `sorry` warnings, 13 `Prop := sorry` and 9 `Type := sorry` placeholders | 785 lines, 46 `sorry` warnings, no placeholder predicates or types; `lean-check` exit 0 |

## What was checked

- **Sources.** Every locator of every node was located in its source and the numbered statement read.
  - **Free sources:** fetched into the scratch directory with their recorded URLs.
  - **Kisin's papers:** the author DVI files were decoded with a small DVI reader. Where a glyph mattered (E3, E7), the font table was read to tell ⩽, 𝔖 and S apart.
  - **Serre 1972 and Fontaine 1985:** checked on the page images, Proposition 12 and Théorème A and Remarque 2.2 in particular.
  - **Maintainer-cleared sources:** Pilloni, ACC, BMS, Scholze–Weinstein, Scholze 2015 and Česnavičius were read in place, with nothing copied.
  - **Delegation:** retrieval of the quoted statements was delegated to Haiku helpers; every verdict below is the reviewer's own, from the quoted lines.
- **Baseline.** All 44 declarations were read in the pinned trees (Mathlib 082e2d3, Tau Ceti f790474), with their hypotheses, against what each citing node needs.
- **Closure.**
  - Each node's proof steps were checked against its prerequisites.
  - Every cross-roadmap citation was resolved to an existing node or Tau Ceti layer anchor.
  - Every request's supplier was checked to be among the prerequisites of each node that needs it.
  - The node-level prerequisite graph over **all** packets is acyclic, including the new edges.
- **Duplication.** The packet was checked against current TauCetiRoadmap main (all roadmaps, including the nine newer than the atlas snapshot) and the current Tau Ceti library.
- **API, unit tests and planets.** Each test was checked for being true and discriminating. Planets were checked against PROTOCOL §14.
- **Red-team findings and source issues.** The red-team findings handed to the blueprint (§9a of the instructions) were checked, and so were the 17 source issues, each at its locator.

## Corrections to the mathematics

1. **R07.4/wach-breuil-kisin-comparison.** The acceptance example for μ_{p^∞} was false.
   - It claimed that Γ acts through the cyclotomic character on a basis of M(G). That is incompatible with the defining condition that Γ acts trivially on M/uM.
   - Replaced by the explicit Wach-module computation: basis u ⊗ e^∨, φ(e) = E·e, γ(e) = (γ(u)/(χ(γ)u))·e ≡ e mod u.
2. **R07.2/witt-frobenius-fixed-constants.** The negative control was false.
   - In k[ε], x^p = x already forces x ∈ F_p, because the ring is connected.
   - Replaced by the disconnected ring k × k, whose Frobenius-fixed Witt vectors are ℤ_p × ℤ_p.
3. **R07.6/illusie-obstruction-homomorphisms.** The stated special case "u = id gives the obstruction to deforming G" was wrong: the cone of the identity is zero.
   - Replaced by the case G = 0, with the class in Ext²(H, ℓ̌_H ⊗ J), which is the obstruction to deforming H.
   - Scholze's Theorem III.2.1 lists no special cases; this was the plan's addition.
   - **R07.2/bt-stack-smooth** used the same wrong special case in its proof. It now cites Illusie's Théorème 4.4 directly.
4. **R07.5/crystalline-01-inertia-types.** The proof step "G ≠ G⁰ ≠ 0" is false for supersingular reduction, where G = G⁰.
   - The property used is that G (height 2, dimension 1) is neither étale nor multiplicative.
   - ACC Lemma 7.1.8 was read; the statement itself is right.
5. **R07.2/frobenius-verschiebung.** Generalised from a field to any base of characteristic p (Stix §8.5.2, Proposition 51, §9.4). The BT₁ and Hasse-invariant nodes already used it over F_p-schemes.
6. **R07.2/de-jong-dieudonne-equivalence.** The unit-root part of R¹f_crys*O_A is the Dieudonné crystal of the étale quotient only where that quotient exists: constant p-rank, as in D'Addezio's use over a field. The statement now says so.
7. **R07.1/raynaud-tame-inertia (iii).**
   - Raynaud's Corollaire 3.4.4 needs only a strictly henselian base, with no bound on e.
   - The proof went through the e ≤ p − 1 integral statement. It now uses the generic Proposition 3.2.1 and schematic closure.
8. **R07.1/katz-mazur-groups.** "T_ε ≅ T_{ε′} iff ε/ε′ is a p-th power" holds for isomorphism *as extensions*. As bare group schemes T_ε ≅ T_{ε^a} for a ∈ F_p^×. Made explicit.
9. **R07.1/orthogonal-schematic-closure.**
   - The first acceptance example was garbled; it is now an explicit computation over ℤ_p[ζ_p].
   - The negative control was not meaningful; it is now the role of the DVR hypothesis.
10. **R07.1/raynaud-classification.** The supersingular example X₁^{p²} = pX₁ is the tuple (0, 1) in the variable X₁. It was printed as (1, 0) without saying which variable.
11. **R07.5/finite-flat-kummer-extensions.** The unsupported negative control (non-splitting over ℤ[1/N]) was replaced by the precise role of henselianity.
12. **R07.4/bk-integral-comparisons.** The acceptance examples now argue from the crystalline Frobenius at u = 0, which is robust. They no longer use the sign of the Breuil–Kisin twist 𝔖{±1}; see question 1.

## Duplication with Tau Ceti

**R07.5/tame-inertia-characters** re-planned the tame character I_K/P_K ≅ lim_{p∤m} μ_m.

- Tau Ceti owns it: TauCetiRoadmap LocalFieldsRamification, Layer 4, "The tame character and the twist".
- The current Tau Ceti library, newer than the pin, already has `TauCeti.inertiaTameCharacter` and `TauCeti.quotientWildInertiaSubgroupEquiv` in `NumberTheory/LocalField/Tame/Character.lean`.

What changed:

- The node now cites that layer, with a request.
- It keeps only what lies beyond the layer: the perfect-residue-field generality (Serre 1972), the level-n fundamental characters, the action on μ_p, and the two-dimensional statement (Serre 1987, Proposition 1).
- It gains the API item `tameInertiaIso_eq_inertiaTameCharacter` (compatibility).

**R07.6/fontaine-ramification-numbering** builds on LocalFieldsRamification Layer 3, which owns Herbrand functions, the upper numbering and the different. It is now a prerequisite. The node keeps only Fontaine's shifted normalisation.

No other Tau Ceti roadmap or library declaration duplicates a node. ModularCurves explicitly excludes Dieudonné theory and the Oort–Tate classification.

## Closure: prerequisites added or replaced

- **Tate–Sen.** R07.1/hodge-tate-p-divisible used Tate–Sen in its proof but listed no prerequisite.
  - Added the exact supplier `PadicHodgeTheory:R06.1/tate-sen-theorem`, which is stated for K/ℚ_p finite.
  - Added the stage `PadicHodgeTheory:R06.1`.
  - The request is narrowed to the perfect-residue-field generality Tate's Theorem 3 uses.
- **R07.4/breuil-s-modules** cited its own stage R07.2 as a placeholder for "the Dieudonné crystal over a base, not yet planned there". That was stale: CrystallineCohomology CR.7 owns the crystal and Grothendieck–Messing. It now cites `CR.7/dieudonne-evaluation` and `CR.7/messing-filtration-interface`.
- **Raynaud's embedding.** R07.4/finite-flat-classification, R07.4/dyadic-classification and R07.6/fontaine-ramification-bound use the embedding of a finite flat group into a p-divisible group. Their hypotheses called it "not planned elsewhere yet", but R07.1/raynaud-abelian-embedding plans it. It is now their prerequisite.
- **Prerequisites named in requests or hypotheses but missing from the prerequisite lists:**
  - ModularCurves 0B: p-divisible-group, p-divisible-cartier-dual, f-vector-scheme.
  - ModularCurves 0E: p-divisible-group, raynaud-classification, finite-flat-weight-two-criterion.
  - PadicHodgeTheory R06.1: bk-coefficient-rings, semistable-finite-height, tate-module-acris.
  - LocalFieldsRamification Layer 3: fontaine-ramification-numbering.
  - EllipticCurves Layer 4 (the Tate curve): multiplicative-torsion-inertia. A request was added.
- **R07.1/truncated-barsotti-tate-groups** defines BT₁ through F and V. R07.2/frobenius-verschiebung is now its prerequisite; this is a cross-layer dependency, recorded below.
- **R07.1/raynaud-tame-inertia** gains R07.1/schematic-closure-of-generic-subgroups.

## Node added

**R07.1/invariant-differentials-and-absolute-different** (lemma, `addedBy` this review). It has three parts:

- (i) ω_{G[p^v]} ≅ (R/p^v)^d for a p-divisible group of dimension d. Source: Fontaine 1985, proof of Théorème 1 (b), read on the page image.
- (ii) Raynaud's absolute different 𝔇(𝒢) is the 0th Fitting ideal of ω_𝒢, so v(𝔇) = length ω_𝒢. This combines Raynaud, Appendice, Définition 8, with Tate's theorem that the different of a flat quasi-finite lci algebra is its Kähler different (Stacks, Tag 0BWG). Finite flat group schemes are lci.
- (iii) The resulting discriminant recovers Tate's Proposition 2.

Why it was needed:

- RT-AREA-padic-2/5, as confirmed, asks for the invariant-differential length "derived, not relabelled".
- The FaltingsFinitenessAndIsogenyTheorems request for R28.5 names the comparison v(𝔇) = length ω as an unsourced step that Faltings uses tacitly.

R07.1/raynaud-determinant-tame-different and R07.6/fontaine-ramification-bound now use the new node.

## Baseline

- **mathlib:differentIdeal** was removed from R07.1/raynaud-determinant-tame-different. It is the ring-extension different, not the absolute different of a Hopf algebra: a near miss. It stays for R07.6/fontaine-ramification-numbering, where O_L/O_K fits.
- **`provides` texts narrowed:**
  - `CommAlgCat.FiniteEtale`: base change and the fibre functor are separate declarations, and there is **no GaloisCategory instance** at the pin. R07.1/etale-groups-as-galois-modules now takes the Galois-category structure from IG.0.
  - `PreGaloisCategory.functorToContAction`: needs `[GaloisCategory C] [FiberFunctor F]`.
  - `TruncatedWittVector`: the carrier only, not the group scheme.
  - `IsIntegrallyClosed`: no `IsDomain` included.
  - `differentIdeal`.
  - `Algebra.discr`.
- **Added:** `mathlib:PreTilt` and `mathlib:WittVector.fontaineTheta`, which are at the pin, for R, W(R) and θ in R07.3/fl-ring-S and R07.4/bk-coefficient-rings. This shrinks what those nodes need from PadicHodgeTheory R06.1.
- **Index bug.** `tauceti:FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` lacks the `TauCeti.` prefix of its true Lean name.
  - The pinned declaration index drops the prefix for every declaration of `CartierDuality/FiniteLocallyFree.lean` after the anonymous namespace at line 157.
  - The checker resolves refs against that index, so the ref keeps the index form. The `checked` field records the true name.
- All other 43 declarations exist under the cited names with the hypotheses the nodes use.

## Locators and source matches corrected

- **Oort–Tate Theorem 2** is in §2, not §3.
- **Wintenberger 1983:** pages corrected to 62, 65, 71 and 72 (printed page = PDF page + 57).
- **Savitt 2005:** Propositions 2.17 and 2.18 are in §2.2 (there is no §2.3).
- **Scholze–Weinstein 2013:**
  - Theorem A is on p. 3.
  - The integral full faithfulness is Theorem A, while Theorem 4.1.4 is only up to isogeny.
  - The exact sequence 0 → T_pG → G̃ → G attributed to Proposition 3.3.1 is not stated there. It is now derived from the level exactness.
- **Česnavičius**, arXiv v4: Theorem A.3 is on p. 15.
- **Pilloni p. 92** invokes Oort–Tate theory without the formulas G_{a,b}; the match was made accurate. Pilloni's Lemma 6.3.3.1 is stated in his height-4 setting; noted.
- **Kisin 2006:** the Fontaine citations are in the proof of Lemma (2.1.2). The integral equivalence over 𝒪_ℰ is stated in Kisin 2009 (1.1.12), which was added as a source.
- **Lipnowski–Tsimerman:** the matches were made accurate. The paper states the twisted-conjugacy condition; the ℤ_p-integrality is derived in the plan.
- **Schoof 2005 §2.4** gives an isomorphism criterion, not a classification.
- **Smaller fixes:**
  - FL82 §0.4 is on pp. 549–550, and §8.4 runs to p. 596.
  - Newton–Thorne 2026: pp. 39–41.
  - Raynaud §3.3: p. 268.
  - BCGP21 §4.5.1: pp. 99–100.
  - Caraiani–Scholze §4.2: the quasi-isogeny is in the set-up before Definition 4.2.1.
  - BMS: the Breuil–Kisin twist is Example 4.2.
  - de Jong: 2.3.3 is a paragraph, not a definition.
  - Scholze 2015: Corollary III.2.2 is on p. 32.
- **Haiku flags checked and rejected as misreadings:**
  - Stix Proposition 40(4) does state the splitting of an extension of a connected group by an étale one.
  - Kisin 2009 (1.1.12) does state the equivalence T, on p. 9.
  - Savitt's strongly divisible modules are defined at the end of §3.2, on p. 14.

## Source issues (PROTOCOL §18)

All 17 entries were checked at their locators and **confirmed**; each `review.reason` records what was read.

- **E3 and E7** were decided from the DVI font tables:
  - Theorem (0.1) prints msam10 ⩽.
  - (Mod FI/S) for 𝔐₁ uses the italic S (cmmi10 83), whereas (1.1.11) distinguishes Fraktur 𝔖 (eufm10 83).
- **E16** (AGHMP): the abbreviation M(H) := M(T_p(H)^∨) is the one compatible with items (1)–(3), whose reduction is the contravariant D(H)(W).

No further mistakes were found in the sources.

## Red-team findings handed to the blueprint

- **RT-AREA-langlands-2/7** (Savitt, Conrad–Diamond–Taylor): answered.
  - R07.5/savitt-reduction-principal-series covers Theorem 6.11. Residual reducibility forces case (1) or (2), since case (3) is irreducible already on inertia, and v_p(x_i) = 0 makes ρ itself reducible.
  - R07.5/savitt-residual-types covers Corollary 6.15(1),(2), Remark 6.17 and Gee 4.6.1, with the consumers R27.2, R26.3 and R24.6 recorded.
- **RT-AREA-padic-2/4** (Kisin functor): answered.
  - (1) The Kummer field of norms and Fontaine's equivalence are R07.4/kummer-field-of-norms and R07.4/etale-phi-modules-cohen-ring.
  - (2) phi-n-nabla-modules and breuil-s-modules.
  - (3) weakly-admissible-slope-zero, with Kedlaya's slope theory requested from RD.1.
  - (4) bms-kisin-functor and crystalline-restriction-full-faithfulness.
- **RT-AREA-padic-2/5** (Tate and Raynaud for Faltings): answered after this review's addition.
  - Tate's Proposition 2 is p-divisible-discriminant.
  - Tate's Theorem 2 is PadicHodgeTheory:R06.1/tate-sen-theorem, now a prerequisite.
  - Tate's Theorem 3 with its Corollary 2 is hodge-tate-p-divisible.
  - Tate's Theorem 4 is tate-generic-fibre-theorem.
  - Raynaud 4.1.1 and 4.2.1 are raynaud-determinant-tame-different and raynaud-det-tate-module.
  - The invariant-differential length and the different comparison are the new node.

## Suggested Lean file

The previous file broke PROTOCOL §13 ("never replaced by … `def _ : Prop := sorry`"):

- 13 predicates were `Prop := sorry`, for example `IsEtale`, `IsShortExact`, `Dominates`, `IsCommFormalGroupLaw` and `IsEquivariant`.
- 9 carriers were `Type := sorry` with `sorry` instances, for example `CK`, `tateModule`, `VSfrak`, `tameInertia` and `flFunctor`.
- Placeholders such as `rank := sorry` and `nsmulHom := sorry` stood for other roadmaps' objects.

The file was rewritten so that it states only what the pins carry:

- **Real bodies:**
  - `rank` is the rank of the coordinate Hopf algebra.
  - `IsEtale` is `Algebra.Etale` of the coordinate algebra.
  - `IsMultiplicative` is étaleness of the Cartier dual.
  - `IsConnectedLocal`, `genericFibre` and `Prolongation.Dominates`.
  - `absRamificationIndex` uses `IsDiscreteValuationRing.addVal`.
  - `frobeniusTwist` is base change along Frobenius.
  - `imageF`, the standard Dieudonné modules of ℚ_p/ℤ_p and μ_{p^∞}, and `DieudonneModule.zero`.
  - `FLModule.IsTorsion`, `FLModule.zero`, `KisinModule.rankOne` and `KisinModule.unit`.
  - `eisensteinUnramified`.
  - The peu ramifiée Kummer classes over ℚ_p.
- **Own constructions kept as signatures:** the Oort–Tate and Katz–Mazur groups, `Prolongation.sup`, Frobenius and Verschiebung, and the Dieudonné module.
- **Theorems** are stated against these.
- **Tests now evaluate real definitions.** The old trivial `IsPeuRamifieeClass p v := p ∣ v` tests were hollow. The new tests include:
  - Kisin E-heights 0 and 1, and the non-finite height of φ = p;
  - `FLModule.zero` in every range;
  - the classes of units and of p;
  - the Cartier biduality example from Tau Ceti.
- **The closing comment** lists, by stage, the 283 packet API and test names whose carriers the pins lack. 27 packet names are declared in Lean.
- **`lean-check`** passes: exit 0, 46 warnings, all of them `declaration uses 'sorry'`.
- **Left for the package.** Eight signatures of this roadmap's own constructions still have `sorry` bodies: `oortTateGroup`, `katzMazur`, `katzMazurIsoOfDiv`, `frobeniusHom`, `verschiebungHom`, `dieudonneModule`, `dieudonneMap` and `FLModule.unit`. PROTOCOL §13 allows them in a blueprint file. The package's `check_sorry_data.py` will flag them, so the package must give them bodies or turn them into README targets.

## Layer order (recorded in the coverage lists for the package)

The node graph is acyclic, but some nodes use later layers. The package should put Frobenius and Verschiebung of finite flat groups and the level-one tame character in its first layer, or move these targets after what they use.

- **R07.1 nodes that use R07.2:**
  - truncated-barsotti-tate-groups and bt-n-recognition use frobenius-verschiebung;
  - multiplicative-part-filtration uses canonical-decomposition;
  - henselian-lifting-p-divisible uses bt-stack-smooth.
- **R07.1 node that uses R07.5:** raynaud-determinant-tame-different uses tame-inertia-characters.
- **R07.3 node that uses R07.5:** fl-residual-weights uses the tame characters and peu/très ramifiée; it belongs with the residual types.
- **R07.2 and CR.7:**
  - Four R07.2 nodes use CrystallineCohomology CR.7: bt1-hasse-witt-duality, bt-stack-smooth, de-jong-dieudonne-equivalence and sw-dieudonne-semiperfect.
  - CR.7's own nodes cite the whole stage R07.2. There is no node-level cycle.

## Reader lag

`research/blueprint/readmes/FiniteFlatGroupsAndIntegralPadicHodgeTheory.md` was not edited. It is not a deliverable of this review.

- Its sections for the 49 corrected nodes and the new node lag the packet. The package job, which writes the README from the packet, should take the packet as definitive.
- The substantive lags are the twelve mathematical corrections above and the tame-inertia narrowing.

## Questions for the orchestrator

1. **Sign of the Breuil–Kisin twist.**
   - BMS Example 4.2 prints φ_{𝔖{1}}(x) = uEφ(x), which gives no pole.
   - Combined with Corollary 4.33 (ℤ_p(1) ↦ 𝔖{1}) and Proposition 4.34 (𝔐(T) ⊗ B⁺_cris = D_cris(V) ⊗ B⁺_cris), this appears to conflict with the covariant D_cris(ℚ_p(1)) having Frobenius p^{−1}.
   - The review rewrote the affected acceptance tests so that they do not depend on the sign. A dedicated check of BMS §4 (a possible source issue) is worth a short job; this review did not record one.
2. **Index bug.** The pinned declaration index drops the `TauCeti.` namespace for declarations after the anonymous namespace in `CartierDuality/FiniteLocallyFree.lean`. Every packet citing them must use the index form to pass the checker.
3. **Upward citations for the package.** FiniteFlat is tier 10. It still cites PadicHodgeTheory R06.1/R06.2 (tier 13) and RD.1 (tier 12); the package must move these down.
   - The Mathlib `PreTilt`/`fontaineTheta` citations added here cover R, W(R) and θ.
   - Tate–Sen (`R06.1/tate-sen-theorem`), A_cris/B_st and weak admissibility remain to move.
4. **FaltingsFiniteness follow-up.** FaltingsFinitenessAndIsogenyTheorems R28.2 and R28.5 should cite `R07.1/invariant-differentials-and-absolute-different` in place of their stage-level citation of R07.1 for the differential computations.
