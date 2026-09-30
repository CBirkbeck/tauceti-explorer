# PAPER-DADDEZIO-23: Parabolicity conjecture of F-isocrystals

Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*, [Annals of Mathematics 198 (2023), no. 2, 619–656](https://doi.org/10.4007/annals.2023.198.2.3); arXiv [2012.12879](https://arxiv.org/abs/2012.12879).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1097). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-DADDEZIO-23.result.json](PAPER-DADDEZIO-23.result.json). It has:
- 70 items: 7 planned, 63 missing;
- 6 routes:
  - one new Part II;
  - two Part IIs coalesced with the accepted proposals of PAPER-TSUZUKI-23 and PAPER-ABE-18 (designs pending);
  - three sources of existing layers;
- 17 prerequisite entries;
- 9 recorded mistakes: 8 misprints and 1 gap.

After the independent review (REV-PAPER-DADDEZIO-23, research/blueprint/reviews/REV-PAPER-DADDEZIO-23.md) the extraction has 70 items (7 planned, 63 missing) and 14 recorded mistakes, all confirmed. The review corrected it in place:
- **Route 1** adds RD.5, the first stage downstream of RD.1, RD.2 and RD.3. It owns Kedlaya's full faithfulness, docility and semistable reduction.
- **Route 3** moves from AnalyticNumberTheory AN.4, which is number-field only, to FunctionFieldArithmetic FA.5. Item 18 is restated for the curve case the paper uses.
- **Route 6's brief** states the final theorems with their hypotheses.
- **Items.** Remark 3.1.7 is no longer an item. Frobenius semisimplicity for abelian varieties over finite fields (item 71) is added. Twenty items gain statement, planned or note fixes.
- **Five new findings (E10–E14)**, among them an error in the statement of Lemma 4.4.7 that affects nothing (E13).

The two coalesced Part IIs below were accepted by the reviews of PAPER-TSUZUKI-23 (route 3) and PAPER-ABE-18 (route 2); their designs are pending. The sections below describe the extraction as submitted.

## Sources read

- **arXiv v4** (8 February 2023, "final version, to appear in Annals of Mathematics"), read in full: 30 pages. Item locators are v4's pages.
  - v4 was posted two days after acceptance (6 February 2023).
  - The published PDF is not freely served and was not compared.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Page images:** every mistake was checked on v4's page images.

## What the paper proves

**Main theorem (Theorem 4.4.12 = 1.1.1).**
- Setting: X smooth and geometrically connected over a perfect field, η a perfect point, and M† an overconvergent F^n-isocrystal with constant slopes.
- Crew's monodromy group G(M, η) is the subgroup of G(M†, η) stabilising the slope filtration of M_η.
- If M† is semisimple, G(M, η) is parabolic. This answers Crew's question of 1992.

**The key theorem (Theorem 4.1.3 = 1.2.2).** For N ⊆ M with M †-extendable, the †-hull N̄ (the smallest overconvergent subobject containing N) has S_1(N̄) = S_1(N).
- **Curves** (§4.2):
  - reduce to A^1 by Kedlaya's étale covers;
  - prove the statement at the generic point E (Proposition 4.2.2), using the dual description of the hull (Lemma 4.2.4) and de Jong's reverse slope filtration;
  - pass back from the generic point (Proposition 4.2.12) through integral models of the overconvergent rings.
- **Higher dimension** (§4.4): a new Lefschetz theorem (Theorem 4.4.3). For docile M† there is a curve C with ⟨M†⟩ ≃ ⟨M†|_C⟩.
  - It sharpens Abe–Esnault's full faithfulness to an equivalence, by extending rank-one objects through Lemmas 4.4.5–4.4.7 and a Bertini theorem.
  - Its proof uses the curve case, so the two proofs are intertwined, as the author notes.
- **From MS to parabolicity** (§§3, 4.3):
  - Chevalley's theorem and Saavedra's P_G(λ) give parabolicity for F^∞-monodromy (Proposition 4.3.2).
  - Isocrystals with a punctual Q_p^ur-lattice transfer this to Crew's groups: Propositions 3.2.8 and 3.3.2, Corollary 4.3.6.

**Applications (§5).**
- Semisimplicity of Gr^S R^1f_crys for abelian schemes over finite fields (Theorem 5.1.6).
- Finiteness of A(E^sep)[p^∞] under Albert-type hypotheses (Theorem 5.2.2).
- Kedlaya's conjecture (Corollary 5.3.1), and multiplicity one by minimal-slope Hecke eigenvalues via Abe's correspondence (Theorem 5.3.3).
- The PBS filtration (Corollary 5.4.2) and minimal †-compactifications (Corollary 5.4.4).

## What the atlas already has

**Planned (7 items).**
- PadicDifferentialEquationsAndRigidCohomology:
  - overconvergent and convergent F-isocrystals, and full faithfulness of restriction (RD.3);
  - (φ, ∇)-modules at the generic point (RD.1).
- Dieudonné–Manin: VectorBundlesAndIsocrystals VB0. Mathlib has the rank-one classification.
- Tannaka groups: MotivesAndAlgebraicCycles MC.6.
- Parabolic subgroups, tori and centralisers: Tau Ceti ReductiveGroups Layer 7.
- Weights of abelian varieties: WeightsInEtaleCohomology R34.2.

## Routes

1. **New Part II `PadicDifferentialEquationsPartIIMonodromyGroups`** (38 missing).
   - Title: "P-adic differential equations, rigid cohomology and p-adic weights, Part II: monodromy groups of F-isocrystals and the parabolicity conjecture". Area: `padic`.
   - **Contents:**
     - Crew's groups, observable functors and scalar extension;
     - Q_p^ur-structures (§3);
     - λ, P_G(λ), Chevalley and Saavedra, and Propositions 4.3.2–4.3.5;
     - the Lefschetz theorem and its lemmas, and the Bertini theorem;
     - MS in all dimensions and parabolicity;
     - all of §5.
   - **Why a new Part II:** no layer or proposal plans monodromy groups of F-isocrystals. The ℓ-adic companion Part IIs treat lisse sheaves.
2. **Coalesced Part II `PadicDifferentialEquationsPartIIMinimalSlope`** (13 missing), with PAPER-TSUZUKI-23's id, title, parent and area.
   - **Contents:**
     - the †-hull and MS, with Lemmas 4.1.4–4.1.8;
     - the curve proof: Proposition 4.2.2, Lemmas 4.2.4 and 4.2.7, the rings and integral models, Lemmas 4.2.10–4.2.11, Proposition 4.2.12, Theorem 4.2.13;
     - Kedlaya's étale covers;
     - the Abe–Esnault Lefschetz theorem.
   - **Why the split:** the higher-dimensional MS theorem goes to route 1. Its proof uses the monodromy theory, so putting it here would create a cycle.
3. **Coalesced Part II `GlobalShtukasPartIICrystallineCompanions`** (1 missing), with PAPER-ABE-18's id, title, parent and area. Abe's Langlands correspondence for isocrystals, consumed by Theorem 5.3.3.
4. **Source of PadicDifferentialEquationsAndRigidCohomology [RD.1, RD.2, RD.3]** (8 missing). The cited foundations, as PAPER-TSUZUKI-23 routes them:
   - generic slope filtrations;
   - Kedlaya's restriction theorem (4.1.6) and generic full faithfulness and freeness;
   - de Jong's reverse filtration;
   - Crew's unit-root correspondence;
   - docility and semistable reduction;
   - Étesse's overconvergence of R^1f_crys.
5. **Source of FiniteFlatGroupsAndIntegralPadicHodgeTheory [R07.2]** (2 missing). BBM's crystalline Dieudonné module of A[p^∞], and de Jong's full faithfulness for Barsotti–Tate groups.
6. **Source of AnalyticNumberTheory [AN.4]** (1 missing). Serre's Chebotarev density for schemes, as PAPER-SCHMIDT-STIX-16 routed it. (Corrected by the review: AN.4 is number-field only, and that precedent was rejected. The route now goes to FunctionFieldArithmetic FA.5, for the curve case the paper uses.)

## Source issues (`sourceIssues` E1–E9)

**E5 (gap, the proof of Proposition 4.2.12, p. 17).**
- The proof asserts that, "since Q_{W,n} is compact", inf{‖f_n(m)‖ : m ∈ Q_{W,n} ∖ pQ_{W,n}} = p^{−s_n} > 0. It deduces that the p^∞-torsion of P_W/f(Q_{W,n}) is killed by p^{s_n}.
- **Counterexample.** For the trivial rank-one module, Q_{W,n} = A_n and P_W = W⟨u⟩, and:
  - the element ū_n^j = p^j u^{nj} is not in pA_n, but has norm p^{−j};
  - so the infimum is 0, and W⟨u⟩/A_n has unbounded p^∞-torsion.
- **Consequence.** Lemma 4.2.11 does not apply, and the injectivity needed for the proposition requires another argument.
- **What survives.** Theorem 4.2.13, the only consumer, is proved independently by Tsuzuki [Tsu23, Prop. 6.1]. The main theorems are unaffected.

**Misprints (affect nothing).**
- E1: Isoc†(X)_F is called a subcategory of itself.
- E2: Lemma 3.1.3's proof writes ω_x, V and K for ω_η, V_M and K(Ω).
- E3: Theorem 4.2.6(i) has the index S_{m−i}/S_{m−i−1}. It should be S_{m+1−i}/S_{m−i}, as Lemma 4.2.7 uses.
- E4: Theorem 4.2.6(ii) writes M† for M†_alg.
- E6: "a simple normal divisor of D" should read "a simple normal crossing divisor D".
- E7: §4.4.10 takes Z ⊆ TX ×_X D′_S. The divisor D_S lies in Y, so it should be TY ×_Y D′_S, applied to each component.
- E8: the proof of Theorem 4.4.12 calls G(M, η) normal in G(M†, η). The normality used is that of G(M†, η) in the arithmetic group.
- E9: in Corollary 5.4.4, the identification M′_1 ≃ M′_2 carries ι to −ι.

## Prerequisites not yet covered

Seventeen entries:
- Crew (Ann. ÉNS 1992);
- Kedlaya: full faithfulness (2004), semistable reduction I (2007) and IV (2011), étale covers (JAG 2005), notes on isocrystals (JNT 2022);
- Tsuzuki (Invent. 2023);
- Abe–Esnault (Ann. ÉNS 2019);
- de Jong (Invent. 1998);
- Abe (JAMS 2018);
- D'Addezio (Selecta 2020), Ambrosi–D'Addezio (Alg. Geom. 2022), D'Addezio–Esnault (IMRN 2022);
- Saavedra (LNM 265);
- Étesse (Ann. ÉNS 2002);
- Berthelot–Breen–Messing (LNM 930);
- Drinfeld (Moscow Math. J. 2012).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DADDEZIO-23.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
- Both Mathlib citations were found in the pinned index at Mathlib 082e2d3.
