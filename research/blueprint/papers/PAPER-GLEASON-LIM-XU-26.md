# Gleason–Lim–Xu (2026): connected components of affine Deligne–Lusztig varieties, extraction and routing

Issue [#1205](https://github.com/CBirkbeck/tauceti-explorer/issues/1205). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** I. Gleason, D. G. Lim and Y. Xu, *The connected components of affine Deligne–Lusztig varieties*, Invent. Math. 243 (2026), 805–861 (open access, CC BY 4.0).
  - The published PDF was re-fetched; its SHA-256 (c40fe1fc…) matches the checkpoint.
- **Items.** The result has **153 items: 14 library, 24 planned and 115 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Seventeen are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**Items.**
- Proposition 5.4 (the generic filtration is Galois-invariant) had no item; it is now T55a.
- Theorem 1.19 and Corollary 1.20 are named on their body items.

**E01 rechecked.**
- **The lemma.** Lemma 3.2's formula π_0(F/K) = π_0(F)/K (p. 820) fails for noncompact K with dense orbits. Its proof assumes π_0 is a left adjoint that commutes with colimits.
- **What inherits the gap.** Proposition 3.12 (p. 828) is deduced from the lemma, and §6 uses both on pp. 855–856. G02 records this.
- **The main theorems.** No counterexample to them is claimed.

**Reclassified to affect nothing.**
- **E02.** G° is defined on p. 813 as G(Q_p)/Im G_sc(Q_p), and only that definition is used; "maximal abelian quotient" is a mis-description.
- **E04.** Definition 4.1 needs M proper.
- **E09.** Lemma 6.15 means "no proper open normal subgroup".

**Gaps.**
- G02, G05 and G07 are recorded as findings.
- The others are deferred as cited suppliers' proofs, design work or review.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded, including the paper's own proof gaps.

## Mistakes found (`sourceIssues`)

- **E01** (error; affects a stated result), Lemma3.2,p820;arXivv3PDF16–17; published57-page version, rendered page inspected unless stated otherwise. *Printed:* π₀(F)/K = π₀(G). *Correction:* Retain the underlying-space quotient theorem. Replace the component formula with separate valid restricted theorems for the locally spatial period torsors, compact level quotients and compact Galois descent actually used. A compact-only replacement is insufficient for Proposition3.12.
- **E02** (error; affects nothing), §1.5,p813,description ofG°; published57-page version, rendered page inspected unless stated otherwise. *Printed:* maximal abelian quotient *Correction:* Define G° only as G(Qp)/im Gsc(Qp) unless additional hypotheses establish maximal abelianity. The simply connected derived case identifies it with Gab(Qp), but the unrestricted assertion fails for anisotropic groups.
- **E03** (error; affects the proof), ProofLemma3.16(2),(3.23),p830; published57-page version, rendered page inspected unless stated otherwise. *Printed:* 0 → T(breve Zp) → T(breve Qp) → π₁(G)_I → 0 *Correction:* The torus quotient has target X_*(T)_I. The map onward to pi1(G)_I can have a coroot kernel. Prove rational Kottwitz surjectivity by its actual theorem (cited Zhou5.18), not this exact sequence.
- **E04** (misprint; affects nothing), Definition4.1,p831; published57-page version, rendered page inspected unless stated otherwise. *Printed:* there exists a φ₀-stable standard Levi subgroup M *Correction:* Require M to be proper in G.
- **E05** (error; affects the proof), ProofProposition4.11,(4.13),p834; published57-page version, rendered page inspected unless stated otherwise. *Printed:* we obtain an injective homomorphism *Correction:* Use the explicit uniformizer section lambda↦lambda(p)K to give an injection of sets, or choose and prove a compatible split torus with S(Zp)⊆K. Do not infer a quotient map from the reverse inclusion, and do not call G/K a group.
- **E06** (error; affects a stated result), Proposition5.7,(5.18)–(5.19),pp840–841;use(5.26); published57-page version, rendered page inspected unless stated otherwise. *Printed:* ∀τ∈Gal(E/K) *Correction:* Index the threshold by every DISTINCT Gamma_E-orbit contained in the full Gamma_K highest-weight orbit, or use all embeddings through a normal closure. Do not assume the reflex field E/K is normal.
- **E07** (error; affects the proof), (5.29),p843; published57-page version, rendered page inspected unless stated otherwise. *Printed:* v_O = sum_(τ∈Gal(E/K)) v_(O^E_(τλ)) *Correction:* Sum over the distinct refined isotypic components, not all automorphisms with repeated orbit labels. For orbit averages, use their actual sizes as weights.
- **E08** (gap; affects the proof), ProofProposition6.6(2),(6.9)–(6.11),pp850–851; published57-page version, rendered page inspected unless stated otherwise. *Printed:* Since Gsc(Qp) acts trivially *Correction:* Supply a valid two-direction descent argument for the torsor property; derived-cover triviality cannot be assumed before either torsor hypothesis has been imposed. Resolve also the component quotient step inherited from E01.
- **E09** (misprint; affects nothing), Lemma6.15 andpreceding sentence,p857; published57-page version, rendered page inspected unless stated otherwise. *Printed:* has no open normal subgroup *Correction:* Has no PROPER open normal subgroup; equivalently every open normal subgroup equals the whole group.
- **E10** (misprint; affects nothing), ProofLemma3.10,p827,before(3.15); published57-page version, rendered page inspected unless stated otherwise. *Printed:* Sht_mu1^K1(b1) → Sht_K2(b2) × Spd O_breveE → Sht_K1(b1) × Spd O_breveE *Correction:* Order the ambient arrows as bounded Sht1 -> ambient Sht1 -> ambient Sht2.
- **E11** (misprint; affects nothing), Diagram(3.15),p827; published57-page version, rendered page inspected unless stated otherwise. *Printed:* Sht_mu2^K1(b2) *Correction:* The upper-right integral bounded space uses K2, not K1.
- **E12** (misprint; affects nothing), EndLemma3.16proof,p830; published57-page version, rendered page inspected unless stated otherwise. *Printed:* c_(b,mu) π₁(Gtilde)_I^φ *Correction:* The target coset uses pi1(G)_I^phi.
- **E13** (misprint; affects nothing), Diagram(3.26),p830; published57-page version, rendered page inspected unless stated otherwise. *Printed:* π₀(X_mu^K_H(b)) *Correction:* Use the transported b_H and mu_H in the bottom-left H-ADLV.
- **E14** (misprint; affects nothing), §4,p831,definition ofK_Mprime andb_Pprime; published57-page version, rendered page inspected unless stated otherwise. *Printed:* K_Mprime(breve Qp) = Kp ∩ Mprime(breve Qp) *Correction:* Use the connected Levi parahoric integral points K_Mprime(breve Zp)=breve Kp∩Mprime(breve Qp); b_Pprime belongs to Mprime(breve Qp).
- **E15** (misprint; affects nothing), §4 paragraph11,p832; published57-page version, rendered page inspected unless stated otherwise. *Printed:* mu_H = mu ◦ f *Correction:* Use mu_H=f◦mu.
- **E16** (misprint; affects nothing), Right-handNewton square(4.6),p833; published57-page version, rendered page inspected unless stated otherwise. *Printed:* X_*(T)_Q^+ → X_*(T)_Q^+ *Correction:* Use X_*(T_H)_Q^+ at the right-hand target.
- **E17** (misprint; affects nothing), Paragraphafter(6.24),p858; published57-page version, rendered page inspected unless stated otherwise. *Printed:* Sht(G,bab,muab,Gab_par(Zp)) *Correction:* Use Gab as the group of this torus shtuka.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G01, Declaration and recursive source closure** (deferred). Declaration-sized splitting of recursive suppliers is design work; every numbered statement is now an item.
- **G02, Correct component descent** (recorded). E01, with the gaps it leaves in Propositions 3.12 and 6.6(2) and in §6; E08 records the second descent step.
- **G03, Integral v-sheaf foundations** (deferred). Gleason's integral v-sheaf theory is a cited supplier.
- **G04, Geometric original suppliers** (deferred). AGLR, Gleason–Lourenço and Gleason's local-model correspondence are cited suppliers.
- **G05, Generic filtration correction** (recorded). E06 and E07 record the nonnormal-reflex-field orbit formulas; item T56 carries the corrected statement.
- **G06, Crystalline Tannakian closure** (deferred). Chen's monodromy, Serre/Sen and Colmez–Fontaine are cited suppliers.
- **G07, Adjoint torsor property and local generation** (recorded). E08 records the adjoint-descent gap in Proposition 6.6(2).
- **G08, Global application closure** (deferred). Zhou, He–Rapoport, Hamacher–Kim, Shen–Yu–Zhang, Xu and Pappas–Rapoport are cited suppliers for the global applications.
- **G09, Independent source-issue review** (deferred). Independent review of the findings is the review pipeline's job.
- **G10, Ownership and Lean prototyping** (deferred). Ownership and Lean prototyping are later design work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## Gleason–Lim–Xu: connected components and the missing supplier proofs

Codex, session `codex-c83e7a`; issue #1205; 22 September 2026. Status: **partial, full-primary-reading checkpoint**.

The extraction has 152 items: 14 narrow pinned-library credits, 24 already-planned contracts and 114 missing contracts, each assigned to exactly one of 15 routes. All 57 published pages were read. The primary theorem inventory is recorded, but recursive proof and definition closure is not complete. Several theorem contracts remain gated by explicit source findings.

The source is Ian Gleason, Dong Gyu Lim and Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://doi.org/10.1007/s00222-025-01386-1), *Inventiones mathematicae* 243 (2026), 805–861. The version of record was published online on 12 November 2025. It is licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). This report attributes the source, paraphrases and reorganizes its mathematics, and identifies proposed corrections; it is not the authors’ text or an approved erratum.

### What the theorem says

For any connected reductive group over Qp, any parahoric level and any acceptable Hodge–Newton irreducible pair, the Kottwitz map identifies the connected components of the closed admissible-union ADLV with the affine coset `c_(b,mu) pi1(G)_I^phi`. The target is naturally a coset, not a canonically pointed group. The theorem has no tame, minuscule or odd-prime restriction. Restriction of scalars gives the stated finite-extension-of-Qp version; equal characteristic is not proved by this method.

| Group hypothesis | Infinite-level/monodromy statement |
|---|---|
| Quasisplit | All five conditions of Theorem6.1 are equivalent. |
| Adjoint factors all isotropic | HN irreducible → open derived crystalline image → G° component torsor → Iwahori component bijection → parahoric component bijection. |
| Arbitrary reductive | The first arrow and the last two arrows remain available; the general ADLV theorem uses a separate anisotropic argument. |

The five conditions are spelled out in M01–M04. The anisotropic case uses a unique normal Iwahori, a discrete quotient and determinant to a torus torsor. It does not prove the unrestricted converse to HN irreducibility or the unrestricted infinite-level torsor assertion. In particular, a central zero-bound inner-form example rules out the converse.

### Proof architecture and ownership

The geometric route runs from integral local models and connected tubes, through rich smelted kimberlite specialization, to finite-level ADLV components. The monodromy route starts with a generic flag over a finite extension of the completed maximal unramified field. Weak admissibility supplies a crystalline representation; corrected highest-weight and Newton inequalities force its Mumford–Tate group to contain the derived group. Serre–Sen gives an open derived image. Component stabilizers and their normalizers then connect the generic theorem to the infinite-level torsor.

These are distinct supplier chains. In particular, the connected tube theorem is not the false general quotient-of-components statement of Lemma3.2. A valid replacement for the latter is still needed at the noncompact G(Qp)-torsor applications. Likewise Proposition5.11 must be placed after the component equivalence it invokes; using it in the forward generic-monodromy proof would be circular.

The existing ADLV, integral-shtuka, local-model, integral-diamond and integral-Shimura candidate identifiers are reused. Arithmetic reductive descent supplies the algebraic generic-filtration and local generation facts. Only the generic crystalline-monodromy continuation is newly proposed. None of these candidate IDs is treated as an existing atlas stage.

#### Route 1: ReductiveGroupsPartII

`source` → `ReductiveGroupsPartII`. Use the existing local-field/rational-point, root datum, building, parahoric and decomposition owners. Add only the source-specific Frobenius, admissibility and compactness adapters; local arithmetic generation and G° belong to the arithmetic continuation.

Existing stages: `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.1`, `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`.

Items: D01, D02, T01, T02, D03, D04, T04, T28, T47, T48, T63, T72.

#### Route 2: BunGAndNewtonStrata

`source` → `BunGAndNewtonStrata`. The existing G-isocrystal and invariant layers own B(G),J_b,pi1,kappa,Newton,decency and z-extension class comparisons. Do not duplicate the GL_n isocrystal carrier or the scalar classification.

Existing stages: `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`.

Items: D05, D06, D07, D09, T03, D10, T07, T08.

#### Route 3: GeometricSatakeAndFusion

`source` → `GeometricSatakeAndFusion`. Bounded Witt affine flags, components and group-map geometry refine the early Witt stage. No Satake tensor or fusion theorem is required by the component argument.

Existing stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Items: T05, T27.

#### Route 4: DiamondsAndVStacks

`source` → `DiamondsAndVStacks`. General locally profinite torsors, small quotients and locally spatial limits belong to these existing layers. Treat E01 as a counterexample and prove the restricted component theorem actually needed, not the printed universal lemma.

Existing stages: `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D5`.

Items: D20, D21, T20, T21, T22.

#### Route 5: HeckeStacksAndLocalShtukas

`source` → `HeckeStacksAndLocalShtukas`. The generic tower, its level maps, period torsor and adjoint comparison use HS2. Add geometric period connectedness and BB/classical-point comparison there; integral formal models have their separate continuation.

Existing stages: `HeckeStacksAndLocalShtukas:HS2`.

Items: T29, D34, D36, T34, T35, T37, T70, T73, T74.

#### Route 6: PadicHodgeTheory

`source` → `PadicHodgeTheory`. The period-functor and admissibility layer already owns filtered isocrystals and Colmez–Fontaine. Add the G-valued fiber-functor and fixed-bound triviality interfaces here, without rebuilding period rings or integral displays.

Existing stages: `PadicHodgeTheory:R06.2`.

Items: D50, D51, T50, D52, T51.

#### Route 7: VectorBundlesAndIsocrystals

`source` → `VectorBundlesAndIsocrystals`. Reuse the unique owner of higher-rank rational slopes and isocrystal tensor classification.

Existing stages: `VectorBundlesAndIsocrystals:VB0`.

Items: S01.

#### Route 8: MotivesAndAlgebraicCycles

`source` → `MotivesAndAlgebraicCycles`. Neutral Tannakian reconstruction is shared; the pinned comparison starting from a known Hopf algebra does not close arbitrary reconstruction.

Existing stages: `MotivesAndAlgebraicCycles:MC.6`.

Items: S02.

#### Route 9: Pro-etale descent, diamonds and small v-stacks, Part II: integral recovery and kimberlite specialization

`part-ii` → `DiamondsAndVStacksIntegralPartII`. The existing integral recovery candidate is the same foundational direction; kimberlite specialization is a shared addition used by local models and shtukas.

First prerequisite: `DiamondsAndVStacks`. Galaxy: `padic`.

Continue DiamondsAndVStacksIntegralPartII from PAPER-KISIN-PAPPAS-ZHOU-26 rather than creating a second integral-diamond roadmap. Import Pro-etale descent, diamonds and small v-stacks (DiamondsAndVStacks D3–D6), SchemeAndStackFoundations SF.0 and the existing analytic/perfectoid foundations. Preserve the earlier full-faithfulness and integral-recovery targets. Add reduction and its adjunction, formally adic/closed/separated morphisms, formalization and specializing v-sheaves, the actual formal thickening functor and specialization map, prekimberlites, valuativity, smelted pairs, kimberlites and formal/tubular neighborhoods. A tube is the interior of the specialization inverse image for a constructible locally closed set. Define constructibly Jacobson, richness and topological normality separately. Prove Gleason4.53 and4.55: a rich pair has quotient specialization, and connected closed-point tubes imply a component bijection. Include rank-one patch density and locally Noetherian component control. The general quotient component issue E01 is owned by D3–D5 and must not become an axiom here. Test a formal disc, a rank>1 valuation point with empty tube interior, a nonrich pair and finite etale formal neighborhoods. Future suggested files: TauCeti/AlgebraicGeometry/Diamonds/Integral/{Reduction,Specialization,Kimberlite,Tubes}.lean. Original formal-thickening and descent closure remains G03.

Items: D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, D32, T23, T24.

#### Route 10: Geometric Satake over the Fargues–Fontaine curve, Part II: integral local models and tubular connectedness

`part-ii` → `GeometricSatakeLocalModelsPartII`. Local-model construction already has a shared continuation; add the source theorem there.

First prerequisite: `GeometricSatakeAndFusion`. Galaxy: `padic`.

Continue GeometricSatakeLocalModelsPartII from PAPER-KISIN-ZHOU-25 and PAPER-KISIN-PAPPAS-ZHOU-26. Import Geometric Satake over the Fargues–Fontaine curve (GeometricSatakeAndFusion GS0 loop/Witt geometry), ReductiveGroupsPartII RG2.1–RG2.3 and DiamondsAndVStacksIntegralPartII. Preserve their tangent and same-residue-field curve lanes. Add the general bound M_K,mu, its generic closed Schubert diamond and its admissible reduced special fiber. Prove the Gleason–Lourenco connected-tube theorem for every parahoric and every cocharacter bound over Qp, including nonminuscule bounds. For minuscule mu retain the scheme representability, normality and reduced-special-fiber theorem with the small-p completion, distinguishing the earlier AGLR range. Derive functorial local-model maps and their reduced admissible-locus maps. Do not infer a finite-dimensional local-model diagram from the infinite Witt-loop tube correspondence. Test hyperspecial GLn, torus bounds, a nonminuscule open cell versus closed Schubert variety, and the p=2,3 scope. Future file: TauCeti/AlgebraicGeometry/LocalModels/Tubes.lean. Exact original hypotheses and proof closure remain G04.

Items: D33, T25, T26.

#### Route 11: Hecke stacks and local shtukas, Part II: integral parahoric models and specialization

`part-ii` → `HeckeStacksAndLocalShtukasIntegralPartII`. The same integral model and crystalline comparison direction is already proposed; this paper adds specialization and PR representability.

First prerequisite: `HeckeStacksAndLocalShtukas`. Galaxy: `langlands`.

Continue HeckeStacksAndLocalShtukasIntegralPartII from PAPER-KISIN-PAPPAS-ZHOU-26 and PAPER-VANHOFTEN-24. Import Hecke stacks and local shtukas (HeckeStacksAndLocalShtukas HS2), DiamondsAndVStacksIntegralPartII, GeometricSatakeLocalModelsPartII, FiniteFlatGroupsWithTensorsPartII and the shared ADLV continuation. Define the integral bounded shtuka and its reduction, functorial group and level maps, and the rich smelted pair. Construct the actual infinite-dimensional connected positive-Witt-loop torsors comparing local-model and shtuka tubes. Prove specialization bijective on components for every parahoric and every bound with the stated base fields. Add the Hecke-orbit-to-component result only after the corrected noncompact torsor comparison is proved. For the separate PR global Hodge-type datum, construct the open-closed RZ comparison, verify U_x0 via a lifted point and its Hecke orbit, and prove the comparison is an isomorphism and the integral shtuka is formally representable in that context. Do not impose the intro tame/p>2 assumptions on the local theorem or remove PR global hypotheses. Formal uniformization is consumed by the Shimura continuation. Tests: torus, identity level change, nonnormal finite level, and a generic diamond without an integral model. Future file: TauCeti/AlgebraicGeometry/LocalShtukas/IntegralSpecialization.lean. G02–G04,G08 remain explicit gates.

Items: D35, T30, T31, T32, T33, T36, D62, A08, A09.

#### Route 12: Hecke stacks and local shtukas, Part II: affine Deligne–Lusztig geometry and components

`part-ii` → `HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig`. Components extend the already shared ADLV geometry lane; a separate copy of the ADLV moduli or a new component carrier would duplicate it.

First prerequisite: `HeckeStacksAndLocalShtukas`. Galaxy: `langlands`.

Continue the ADLV candidate shared by PAPER-HE-21, PAPER-VANHOFTEN-24 and PAPER-ZHU-17; retain its dimension, cordiality and rational-stratum targets. Import HeckeStacksAndLocalShtukas HS2, BunGAndNewtonStrata BG0/BG1, ReductiveGroupsPartII, GeometricSatakeAndFusion GS0:Witt-geometry, the integral-shtuka specialization continuation, the arithmetic reductive continuation and the new crystalline-monodromy continuation. Use the existing exact-stratum and closed-admissible-union objects, with an explicit notation comparison: GLX X_mu means the closed union. Construct strict HN-irreducibility, proper-Levi decomposability and translated open-closed Levi pieces. Prove the minimal Levi, central discrete alternative, adjoint/product transport and quasisplit converse. Final target M05: for every reductive G/Qp, every parahoric and acceptable HN-irreducible pair, pi0 X_mu^K(b) is its Kottwitz coset. Separately prove M01’s five-way equivalence for quasisplit G; only3=>4=>5=>1=>2 for isotropic adjoint factors; only5=>1=>2 and3=>4 for arbitrary G. Treat anisotropic factors through their normal unique Iwahori and determinant trivialization, not by asserting general infinite-level torsor behavior. G02 component descent and G07 adjoint torsor descent are proof gates. Prove compact stabilizer/normalizer and finite-field limit steps in order. Tests include torus, split GL2 basic/ordinary, central mu, anisotropic GL1(D), a shifted Kottwitz coset and a nonproper Levi rejected as a decomposition witness. Future files: TauCeti/AlgebraicGeometry/AffineDeligneLusztig/{HodgeNewton,Components}.lean.

Items: D08, D11, T06, T09, D40, D41, T40, T41, T42, T43, T44, T45, T46, T49, M01, M02, M03, M04, M05, M06, T71, T75, T76, T78, T79, T80, T81, T83, T84, T85, T86, T87.

#### Route 13: Reductive algebraic groups, Part II: arithmetic descent and local generation

`part-ii` → `ReductiveGroupsArithmeticPartII`. The arithmetic group continuation already owns descent and Mumford–Tate comparison interfaces; the new local group and algebraic generic-filtration suppliers belong there without rebuilding existing highest-weight theory.

First prerequisite: `tauceti:TauCetiRoadmap/ReductiveGroups`. Galaxy: `grouptheory`.

Continue ReductiveGroupsArithmeticPartII from PAPER-KISIN-MADAPUSIPERA-SHIN-22 and PAPER-KISIN-ZHOU-25. Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), Root systems and highest-weight theory from their existing Tau Ceti roadmaps, ReductiveGroupsPartII for local rational-point topology and buildings, and MotivesAndAlgebraicCycles MC.6 for tensor reconstruction. Preserve the global arithmetic conjugacy and absolute-Hodge targets. Add ad-isomorphisms, induced-torus z-extensions, local H1 vanishing/open central-isogeny images, and the quotient G°=G(Qp)/im Gsc(Qp). Do not call it the unrestricted maximal abelian quotient: E02 supplies an anisotropic counterexample. Prove the isotropic simply connected no-proper-open-finite-index and no-proper-open-normal subgroup theorems through local generation and Kneser–Tits, preserving the anisotropic exclusion. Add quasisplit Galois highest-weight descent, generic flag filtrations and their exact refined-orbit threshold over an arbitrary finite reflex field. Replace Aut(E/K) by distinct Gamma_E-orbits in the full Gamma_K orbit; never assume E/K is normal. Tests include Res_(Q(cuberoot2)/Q)Gm, repeated trivial components over a quadratic field, split highest weights, and the quaternion norm-one residue quotient. Future files: TauCeti/Algebra/AlgebraicGroup/Arithmetic/{LocalGeneration,GenericFiltration}.lean. The generic crystalline theorem is owned by the p-adic Hodge continuation, not here.

Items: D12, D13, D14, T10, D56, D57, T55, D58, T56, T88, T89.

#### Route 14: p-adic Hodge theory, Part II: generic crystalline monodromy

`part-ii` → `PadicHodgeTheoryGenericMonodromyPartII`. No inspected roadmap or existing candidate owns the generic crystalline derived-monodromy theorem. It extends the existing rational p-adic Hodge direction; the classical/absolute-Hodge Mumford–Tate lane in arithmetic reductive groups is a distinct imported supplier.

First prerequisite: `PadicHodgeTheory`. Galaxy: `padic`.

Build on p-adic Hodge theory (PadicHodgeTheory R06.1–R06.2), importing its period rings, admissibility and Colmez–Fontaine equivalence. Import ArithmeticGaloisRepresentations R01.1 for continuity, VectorBundlesAndIsocrystals VB0 for slopes, MotivesAndAlgebraicCycles MC.6 for Tannaka, BunGAndNewtonStrata BG0/BG1 for reductive invariants and ReductiveGroupsArithmeticPartII for generic filtrations and Galois highest-weight descent. Define crystalline Mumford–Tate and the finite-decent-field fiber functor, distinguishing full Zariski closure from its identity component. Prove Serre–Sen openness, Chen’s invariant-line criterion and inner-form comparison. Construct degree sums on nonzero vectors and prove the corrected orbit-average, Frobenius-sum and Newton lowest-weight inequalities. Main targets: GLX5.8(1) generic acceptable decent pairs are admissible;5.8(2) HN-irreducibility forces MT to contain Gder;5.9 gives a finite extension of breve Qp with crystalline image open in Gder. Prove the generic point existence using infinite transcendence and etale coordinates. The quasisplit converse5.11 is a LATER consumer of the ADLV component equivalence and must not create a proof cycle. Import the shared highest-weight carrier; no second period ring, filtered-isocrystal or tensor category is built. Tests: rank-one slopes, unstable filtered rank two, a Frobenius cycle with unequal jumps, the corrected nonnormal reflex-field minimum and strict HN positivity. Future files: TauCeti/NumberTheory/PadicHodge/GenericMonodromy.lean. Recursive Chen/Serre/Sen/DOR closure, connectedness of monodromy and corrected orbit proof remain G05–G06.

Items: D53, T52, D54, T53, D55, T54, T57, T58, T59, T60, T61, T62, T64, T65, T66, T77, T82.

#### Route 15: Complex Shimura varieties and canonical models, Part II: integral isogenies and uniformization

`part-ii` → `ShimuraVarietiesHondaTatePartII`. The integral Shimura continuation already owns these mod-p and reduction applications; generic canonical models remain upstream.

First prerequisite: `ShimuraVarieties`. Galaxy: `arithmeticgeometry`.

Continue ShimuraVarietiesHondaTatePartII shared by the Kisin, Kisin–Zhou, KPZ and Van Hoften extractions. Import Complex Shimura varieties and canonical models (ShimuraVarieties), the existing Hodge/PEL moduli and tensor-deformation suppliers, the shared ADLV component theorem and HeckeStacksAndLocalShtukasIntegralPartII. Under EXACT Assumption1.4 (Hodge type,p>2,tame splitting,p-prime derived fundamental group,stabilizer-parahoric), prove the unique tensor-compatible perfect isogeny map with phi mu and Frobenius conventions. With the extra quasisplit-at-p hypothesis prove injectivity of the global I_x(Q) quotient, existence of a CM lift in each indicated isogeny class, and normality of the closure/Siegel closed immersion. Under Assumption1.4 prove He–Rapoport axioms, the precise Hamacher–Kim almost-product structure and EKOR quasiaffinity. Decompose the original statements before claiming closure. In the separate PR global Hodge-type context, consume the RZ/integral-shtuka isomorphism and prove the formal uniformization quotient completed along the isogeny class, with the precise interpretation of PR4.10.6 and RZ6.23. Do not identify the two global hypothesis packages or assert all local integral shtukas formally representable. Tests: level conventions, contravariant phi mu, a tensor-nonpreserving quasi-isogeny rejected, and formal versus set-theoretic isogeny quotients. Future file: TauCeti/AlgebraicGeometry/Shimura/IsogenyUniformization.lean. G08 retains the substantial original-source closure obligations.

Items: D60, D61, A01, A02, A03, A04, A05, A06, A07, A10.

### Source findings awaiting independent review

The findings below are worker diagnoses, not confirmed errata. A false auxiliary lemma does not alone disprove a main geometric theorem. The report distinguishes a counterexample to a stated result, a failure of an intermediate argument, and a notation slip. Searches found no separate correction in the locations listed in the JSON; this limited search does not establish that none exists. No author contact was made.

#### E01: error — Lemma3.2,p820

Printed: `π₀(F)/K = π₀(G).`.

Correction or required proof: Retain the underlying-space quotient theorem. Replace the component formula with separate valid restricted theorems for the locally spatial period torsors, compact level quotients and compact Galois descent actually used. A compact-only replacement is insufficient for Proposition3.12.

Evidence: Let C be an algebraically closed characteristic-p perfectoid field, F=underline Zp times Spa(C,OC), and let the DISCRETE locally profinite group Z act by translations. Scholze11.12 realizes F as a perfectoid space; the free pro-etale relation coproduct_Z F defines a quotient diamond G and a Z-torsor. Scholze12.7–12.9 give |G|=Zp/Z with quotient topology. Every integer orbit is dense. Any nonempty saturated open has closed invariant complement, which would contain a dense orbit if nonempty; hence the quotient is indiscrete. It has more than one point (Zp is uncountable, Z countable), so it is connected, whereas pi0(F)/Z=Zp/Z has many elements. Proposition3.12 and6.6(2) use this false generality. This disproves the lemma, not by itself the geometric main theorems.

Effect: a stated result.

#### E02: error — §1.5,p813,description ofG°

Printed: `maximal abelian quotient`.

Correction or required proof: Define G° only as G(Qp)/im Gsc(Qp) unless additional hypotheses establish maximal abelianity. The simply connected derived case identifies it with Gab(Qp), but the unrestricted assertion fails for anisotropic groups.

Evidence: Take E=Q3(i), i²=-1, the unramified quadratic extension, and D=E⊕EΠ with Π²=3, Πa=sigma(a)Π. Nrd(a+bΠ)=N_E(a)-3N_E(b); its summands have different valuation parity, proving D is division. Norm-one elements have a integral unit and b integral, so reduction a mod3 defines a homomorphism SL1(D)->ker(N:F9×->F3×). The element i has norm1 and residue order4. Thus SL1(D)(Q3) has a nontrivial abelian quotient, although it is simply connected and G°=1.

Effect: a stated result.

#### E03: error — ProofLemma3.16(2),(3.23),p830

Printed: `0 → T(breve Zp) → T(breve Qp) → π₁(G)_I → 0`.

Correction or required proof: The torus quotient has target X_*(T)_I. The map onward to pi1(G)_I can have a coroot kernel. Prove rational Kottwitz surjectivity by its actual theorem (cited Zhou5.18), not this exact sequence.

Evidence: For split G=SL2 and its diagonal torus T≅Gm, pi1(G)=0 but T(L)/T(O_L)≅Z. The element diag(p,p^-1) lies in the kernel of the map to pi1(G) but not in T(O_L).

Effect: the proof.

#### E04: misprint — Definition4.1,p831

Printed: `there exists a φ₀-stable standard Levi subgroup M`.

Correction or required proof: Require M to be proper in G.

Evidence: Without properness, take M=G: every acceptable pair satisfies the displayed coroot-cone condition, contradicting Example4.2 and the subsequent notion of indecomposability.

Effect: a stated result.

#### E05: error — ProofProposition4.11,(4.13),p834

Printed: `we obtain an injective homomorphism`.

Correction or required proof: Use the explicit uniformizer section lambda↦lambda(p)K to give an injection of sets, or choose and prove a compatible split torus with S(Zp)⊆K. Do not infer a quotient map from the reverse inclusion, and do not call G/K a group.

Evidence: The proved inclusion is S(Qp)∩K⊆S(Zp); descending S->G/K through S/S(Zp) requires S(Zp)⊆K. In SL2(Q5), let g=(1,1/5;0,1), K=g SL2(Z5)g^-1 and s=diag(2,1/2)∈S(Z5). Then g^-1sg has upper-right entry3/10, so s∉K. The proposed quotient map is not well defined. The uniformizer-section repair suffices for infinitude.

Effect: the proof.

#### E06: error — Proposition5.7,(5.18)–(5.19),pp840–841

Printed: `∀τ∈Gal(E/K)`.

Correction or required proof: Index the threshold by every DISTINCT Gamma_E-orbit contained in the full Gamma_K highest-weight orbit, or use all embeddings through a normal closure. Do not assume the reflex field E/K is normal.

Evidence: Let K=Q, E=Q(cuberoot2), G=Res_(E/Q)Gm, mu the cocharacter of the distinguished embedding, and V=E with multiplication action. The three weights are a Gamma_K=S3 orbit; Gamma_E=S2 fixes one and permutes the other two, while Aut(E/K)=1. Choose the fixed weight as representative. The printed formula puts all V in Fil^1 because its pairing with mu is1. But V intersect the distinguished weight line of V_E is zero: a nonzero element of E has nonzero image under each embedding. The correct minimum over the1+2 refined orbits is0. Tori are quasisplit, so the stated hypotheses include this example.

Effect: a stated result.

#### E07: error — (5.29),p843

Printed: `v_O = sum_(τ∈Gal(E/K)) v_(O^E_(τλ))`.

Correction or required proof: Sum over the distinct refined isotypic components, not all automorphisms with repeated orbit labels. For orbit averages, use their actual sizes as weights.

Evidence: Already for a nontrivial quadratic reflex field and the trivial representation lambda=0, both automorphisms yield the same one-dimensional component. The displayed sum is v+v=2v, not v for nonzero v in characteristic zero. A quadratic reflex field occurs for the coordinate cocharacter of Res_(E/K)Gm.

Effect: the proof.

#### E08: gap — ProofProposition6.6(2),(6.9)–(6.11),pp850–851

Printed: `Since Gsc(Qp) acts trivially`.

Correction or required proof: Supply a valid two-direction descent argument for the torsor property; derived-cover triviality cannot be assumed before either torsor hypothesis has been imposed. Resolve also the component quotient step inherited from E01.

Evidence: Take G=SL2,b=1,mu=0. The period domain is a point and Sht_infty over Cp is the constant SL2(Qp)-torsor, whose component set has its nontrivial regular action. Thus the intermediate unconditional triviality assertion is false. Under condition(5) triviality is part of the hypothesis, so one direction may be repaired that way; it does not justify the asserted general formula or converse. No counterexample to Proposition6.6’s equivalence is claimed.

Effect: the proof.

#### E09: misprint — Lemma6.15 andpreceding sentence,p857

Printed: `has no open normal subgroup`.

Correction or required proof: Has no PROPER open normal subgroup; equivalently every open normal subgroup equals the whole group.

Evidence: The whole topological group is open and normal. The proof concludes K=G(Qp), which confirms the intended formulation.

Effect: a stated result.

#### E10: misprint — ProofLemma3.10,p827,before(3.15)

Printed: `Sht_mu1^K1(b1) → Sht_K2(b2) × Spd O_breveE → Sht_K1(b1) × Spd O_breveE`.

Correction or required proof: Order the ambient arrows as bounded Sht1 -> ambient Sht1 -> ambient Sht2.

Evidence: Extension of structure group maps ambient1 to ambient2; the written reverse ambient arrow is not provided.

Effect: nothing.

#### E11: misprint — Diagram(3.15),p827

Printed: `Sht_mu2^K1(b2)`.

Correction or required proof: The upper-right integral bounded space uses K2, not K1.

Evidence: The right vertical inclusion targets the ambient shtuka for K2 and b2.

Effect: nothing.

#### E12: misprint — EndLemma3.16proof,p830

Printed: `c_(b,mu) π₁(Gtilde)_I^φ`.

Correction or required proof: The target coset uses pi1(G)_I^phi.

Evidence: The map (3.24) and the lemma statement have target G.

Effect: nothing.

#### E13: misprint — Diagram(3.26),p830

Printed: `π₀(X_mu^K_H(b))`.

Correction or required proof: Use the transported b_H and mu_H in the bottom-left H-ADLV.

Evidence: The target Kottwitz coset is explicitly c_(b_H,mu_H).

Effect: nothing.

#### E14: misprint — §4,p831,definition ofK_Mprime andb_Pprime

Printed: `K_Mprime(breve Qp) = Kp ∩ Mprime(breve Qp)`.

Correction or required proof: Use the connected Levi parahoric integral points K_Mprime(breve Zp)=breve Kp∩Mprime(breve Qp); b_Pprime belongs to Mprime(breve Qp).

Evidence: A parahoric model evaluated on the generic field gives the entire Levi rational group, not its integral subgroup. The displayed intersection also mixes Qp and breve Qp levels; the subsequent piece is an Mprime-ADLV.

Effect: nothing.

#### E15: misprint — §4 paragraph11,p832

Printed: `mu_H = mu ◦ f`.

Correction or required proof: Use mu_H=f◦mu.

Evidence: The domains are Gm->G->H, so the printed composition is ill typed.

Effect: nothing.

#### E16: misprint — Right-handNewton square(4.6),p833

Printed: `X_*(T)_Q^+ → X_*(T)_Q^+`.

Correction or required proof: Use X_*(T_H)_Q^+ at the right-hand target.

Evidence: The upper-right object is B(H) and its Newton invariant takes values in the target torus.

Effect: nothing.

#### E17: misprint — Paragraphafter(6.24),p858

Printed: `Sht(G,bab,muab,Gab_par(Zp))`.

Correction or required proof: Use Gab as the group of this torus shtuka.

Evidence: The adjacent determinant target and the argument invoke the torus case.

Effect: nothing.

The rendered pages confirm that the underlined inertia-average cocharacter in (5.28), (5.33) and (5.34) is present; it is not an error. The inverse powers in a Frobenius pairing can also be reindexed after summing a complete period, so no false individual-term objection is filed. The normalizer’s openness in Lemma6.13 can be supplied by the central-isogeny open-image argument; this is recorded as an explicit proof step.

### Inventory with API and acceptance specifications

Each definition or construction has at least three source-driven API obligations, three concrete tests and a use-site explanation. A library status credits only its stated carrier or theorem; it does not certify the additional specialized API. Theorems list the proof input to be decomposed. All statements are mathematical specifications, not Lean declarations or proved implementations.

#### L01 — Witt-vector coefficient carrier

**definition; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

The pinned p-typical Witt-vector carrier is defined for a commutative coefficient ring. Perfect characteristic-p hypotheses are imposed separately for p-torsionfreeness and the geometry used here.

Pinned declarations: `mathlib:WittVector`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L01.ofCoefficients` (constructor): Reuse WittVector.mk on a coefficient sequence.
- `GLX26.L01.ext` (extensionality): Equality follows from equality of every coefficient.
- `GLX26.L01.fractionField` (compatibility): The map to L preserves the existing ring operations.

Acceptance tests:

- `L01.test1`: Equal coefficient sequences give equal vectors.
- `L01.test2`: Over F_p the fraction field specializes to Q_p after the standard comparison.
- `L01.test3`: Witt addition in positive coordinates is not coordinatewise addition in general.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L06 — Connected reductive group predicate

**definition; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

Reuse the finite-type commutative Hopf-algebra property expressing smoothness, geometric connectedness and trivial geometric connected normal smooth unipotent subgroups.

Pinned declarations: `tauceti:TauCeti.reductiveCommHopfAlgProperty`, `tauceti:TauCeti.reductiveCommHopfAlgProperty_iff`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L06.geometricRadical` (characterisation): Reuse the geometric normal-unipotent-subgroup characterization.
- `GLX26.L06.baseChange` (compatibility): Transport the predicate through permitted field extensions.
- `GLX26.L06.iso` (functoriality): Transport reductivity under Hopf-algebra isomorphisms.

Acceptance tests:

- `L06.test1`: G_m is reductive.
- `L06.test2`: GL_n is reductive in characteristic zero.
- `L06.test3`: The additive group is not reductive.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L07 — Algebraic torus predicate

**definition; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

A finite-type affine group over a field is a torus when its coordinate Hopf algebra becomes that of a finite-rank split torus after extension to an algebraic closure.

Pinned declarations: `tauceti:TauCeti.torusCommHopfAlgProperty`, `tauceti:TauCeti.torusCommHopfAlgProperty_iff`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L07.fromSplitting` (constructor): A geometric split-torus isomorphism proves the predicate.
- `GLX26.L07.geometricFiber` (compatibility): The geometric fiber has the specified finite rank.
- `GLX26.L07.iso` (functoriality): Transport the torus predicate along an isomorphism.

Acceptance tests:

- `L07.test1`: G_m is rank one.
- `L07.test2`: A norm-one quadratic torus need not be split.
- `L07.test3`: G_a is not a torus.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L08 — Geometric character lattice

**definition; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

Use the additive group of group-like elements of the geometrically extended coordinate Hopf algebra, with its absolute Galois action. For a torus this is X*(T).

Pinned declarations: `tauceti:TauCeti.CommHopfAlgCat.additiveCharacterGroup`, `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L08.galoisAction` (projection): Expose the action inherited from geometric scalar extension.
- `GLX26.L08.charactersAsMaps` (compatibility): Identify a character with a group-scheme map to G_m.
- `GLX26.L08.addCharacters` (simp): Addition of characters corresponds to multiplication of their values.

Acceptance tests:

- `L08.test1`: X*(G_m) is Z.
- `L08.test2`: Conjugation acts by minus one on a real norm-one torus.
- `L08.test3`: The trivial torus has zero character group.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L09 — Cocharacter lattice and pairing

**definition; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

For a torus use geometric group-scheme morphisms G_m to T, their integral-dual comparison to X*(T), and the evaluation pairing. Its Galois action is contragredient.

Pinned declarations: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLattice`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLatticeLinearEquivDual`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L09.dual` (equivalence): Use the integral-dual linear equivalence.
- `GLX26.L09.pairing` (projection): Evaluate a character on a cocharacter as an integer exponent.
- `GLX26.L09.galois` (compatibility): The dual action evaluates against the inverse Galois action on characters.

Acceptance tests:

- `L09.test1`: For G_m, exponents a and b pair to ab.
- `L09.test2`: The zero cocharacter pairs to zero.
- `L09.test3`: Simultaneous sign reversal on a norm-one torus preserves the pairing.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L10 — Perfect character-cocharacter pairing

**theorem; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

For a torus over a field, its integral character-cocharacter pairing is perfect.

Pinned declarations: `tauceti:TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

Proof: Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L16 — Finite free cocharacter lattice

**theorem; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

For a torus over a field its integral cocharacter module is finite free.

Pinned declarations: `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_free`, `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_finite`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

Proof: Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L17 — Galois invariance of the pairing

**theorem; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

For a multiplicative-type group, simultaneously applying a Galois automorphism to character and cocharacter leaves their integral pairing unchanged.

Pinned declarations: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

Proof: Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

Scope note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

#### L23 — Perfect coefficient-ring predicate

**construction; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

For a commutative ring R of characteristic p, PerfectRing R p asserts that x↦x^p is bijective. The pinned predicate is more general and needs only a power operation; its characteristic-p ring use is the present specialization.

Pinned declarations: `mathlib:PerfectRing`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L23.mk` (constructor): Supply injectivity and surjectivity of the p-power map.
- `GLX26.L23.characterisation` (characterisation): Every element has a unique pth root.
- `GLX26.L23.map` (functoriality): Ring maps between perfect characteristic-p rings commute with inverse Frobenius.

Acceptance tests:

- `GLX26.L23.test1`: A finite field is perfect.
- `GLX26.L23.test2`: The zero ring has a bijective power map.
- `GLX26.L23.test3`: Fp[t] is not perfect since t has no polynomial pth root.

#### L42 — Scheme carrier

**construction; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

A scheme is a locally ringed space locally isomorphic to Spec of a commutative ring; morphisms are locally ringed-space morphisms.

Pinned declarations: `mathlib:AlgebraicGeometry.Scheme`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L42.construct` (constructor): Reuse Scheme and Scheme.Hom.
- `GLX26.L42.characterise` (characterisation): Affine neighborhoods identify the structure sheaf.
- `GLX26.L42.transport` (functoriality): Use existing fibre products and morphism properties.

Acceptance tests:

- `GLX26.L42.test1`: Spec F_p is a scheme.
- `GLX26.L42.test2`: The empty scheme is allowed.
- `GLX26.L42.test3`: A sheaf-valued lattice functor is not a scheme without representability.

Scope note: Only the stated carrier or theorem is credited to the pinned library. Additional API/test specifications are not claims of existing formalization.

#### L43 — Fppf topology on schemes

**construction; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

Use the Grothendieck topology generated by jointly surjective flat locally finitely presented families.

Pinned declarations: `mathlib:AlgebraicGeometry.Scheme.fppfTopology`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

API:

- `GLX26.L43.construct` (constructor): Form covering families through fppfPrecoverage.
- `GLX26.L43.characterise` (characterisation): Each arrow is flat and locally of finite presentation.
- `GLX26.L43.transport` (functoriality): Base change and compose coverings using the existing instances.

Acceptance tests:

- `GLX26.L43.test1`: A surjective finite etale map gives a cover.
- `GLX26.L43.test2`: An identity is a cover.
- `GLX26.L43.test3`: A proper nonflat cover need not be fppf.

Scope note: Only the stated carrier or theorem is credited to the pinned library. Additional API/test specifications are not claims of existing formalization.

#### L47 — Tannaka comparison for a known Hopf algebra

**theorem; library**. §§2,3.1 and5.1: algebraic coefficient, group and Tannakian prerequisites.

For a field k and commutative Hopf k-algebra H, its group-valued functor of points is naturally isomorphic, with the specified universe lift, to the tensor-automorphism functor of the finite-comodule scalar-extension fibre functor.

Pinned declarations: `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`.

Use: §§2 and5.1 — Reuse the coefficient ring, reductive-group/torus or tensor carrier; none supplies diamonds, G-isocrystal classification or crystalline Mumford–Tate openness.

Proof: Use the pinned natural isomorphism. It begins with H and does not construct a Hopf algebra from an arbitrary neutral Tannakian category.

Scope note: Only this precise carrier or theorem is credited at the pin. Proposed specialized API and tests do not certify implementation of its geometric consumers.

#### L50 — Isocrystal carrier

**definition; library**. §5.1.

For prime p and perfect characteristic-p domain k, a K=Frac(W(k))-module V with bijective Frobenius-semilinear operator is a WittVector.Isocrystal. Finite dimension is an additional hypothesis, not a field of this class.

Pinned declarations: `mathlib:WittVector.Isocrystal`, `mathlib:WittVector.IsocrystalHom`.

Use: §5.1 and5.3 — Underlying carrier for filtered isocrystals; no higher-rank classification credit.

API:

- `GLX26.L50.construct` (constructor): Package the K-module and semilinear equivalence.
- `GLX26.L50.characterise` (characterisation): Read Frobenius bijectivity and semilinearity from the class.
- `GLX26.L50.transport` (functoriality): Use Frobenius-equivariant linear maps for isocrystal morphisms.

Acceptance tests:

- `GLX26.L50.test1`: The rank-one operator p^m sigma gives an isocrystal for each integer m.
- `GLX26.L50.test2`: The zero vector space with its unique equivalence is allowed.
- `GLX26.L50.test3`: The zero operator on a nonzero vector space fails bijectivity.

Scope note: Only the precise pinned carrier/theorem is credited. Specialized API and tests are future acceptance contracts, not certified implementations.

#### L51 — Connected-component quotient

**definition; library**. §3.1.

For any topological space X, ConnectedComponents X is the quotient by equality of connected components, equipped with the quotient topology.

Pinned declarations: `mathlib:ConnectedComponents`, `mathlib:ConnectedComponents.coe_eq_coe'`, `mathlib:Continuous.connectedComponentsMap`.

Use: §3.1 Lemma3.2 and all main theorems — The pinned quotient carrier does not justify commutation with arbitrary group quotients.

API:

- `GLX26.L51.construct` (constructor): Map x to its connected-component class.
- `GLX26.L51.characterise` (characterisation): Classes agree exactly when the representatives lie in one connected component.
- `GLX26.L51.transport` (functoriality): A continuous map induces a continuous map on connected components.

Acceptance tests:

- `GLX26.L51.test1`: A finite discrete n-point space has n components.
- `GLX26.L51.test2`: The empty space has no component.
- `GLX26.L51.test3`: A connected indiscrete two-point space has one component although its points differ.

Scope note: Only the precise pinned carrier/theorem is credited. Specialized API and tests are future acceptance contracts, not certified implementations.

#### D01 — Local reductive datum

**definition; planned**. §§1.1,2.

Fix a prime p, L=breve Qp with arithmetic Frobenius phi and inertia I, a connected reductive G/Qp, a geometric conjugacy class {mu}, b in G(L) with [b] in B(G,{mu}), a parahoric group scheme K over Zp and an Iwahori contained in K(Zp). Set breve K=K(breve Zp).

Existing owners: `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.3`.

Use: §§2–6 — Common quantified datum; all later local statements explicitly import it.

API:

- `GLX26.D01.construct` (constructor): Assemble the fields, Frobenius, group, bound and connected parahoric model.
- `GLX26.D01.characterise` (characterisation): Distinguish K(Zp), K(breve Zp) and the possibly larger facet stabilizer.
- `GLX26.D01.transport` (functoriality): Transport along a group map extending to the chosen models and carrying b and mu.

Acceptance tests:

- `GLX26.D01.test1`: GL2 with its standard Iwahori sits in GL2(Zp).
- `GLX26.D01.test2`: For a torus the parahoric model is unique.
- `GLX26.D01.test3`: A full facet fixer with disconnected special fiber is not automatically this connected parahoric.

#### D02 — Iwahori–Weyl group

**definition; planned**. §2.1.

For D01 choose the maximal L-split torus S over Qp and T=Z_G(S). The Iwahori–Weyl group is N_G(T)(L)/T(breve Zp), with exact sequence X_*(T)_I -> Wtilde -> W0 and affine Weyl subgroup Wa.

Existing owners: `ReductiveGroupsPartII:RG2.4`.

Inputs: D01, L09.

Use: §2 and4 — Controls the admissible locus and Levi decomposition.

API:

- `GLX26.D02.construct` (constructor): Form the normalizer quotient using the connected torus parahoric.
- `GLX26.D02.characterise` (characterisation): Identify translation kernel X_*(T)_I and quotient relative Weyl group.
- `GLX26.D02.transport` (functoriality): Compare under compatible group maps, base change and adjoint projection.

Acceptance tests:

- `GLX26.D02.test1`: For split SL2 the translation lattice is the coroot lattice.
- `GLX26.D02.test2`: For Gm the Weyl group is trivial and Wtilde=Z.
- `GLX26.D02.test3`: Replacing the actual cocharacter lattice by the full coweight lattice changes the group for SL2.

#### T01 — Length-zero component sequence

**theorem; planned**. §2.1.

For D02 and the chosen alcove, 1 -> Wa -> Wtilde -> pi1(G)_I -> 0 splits by the length-zero subgroup Omega. Bruhat comparison occurs inside one Omega component.

Existing owners: `ReductiveGroupsPartII:RG2.4`.

Inputs: D02.

Proof: Use the alcove stabilizer and affine Coxeter presentation; preserve the actual lattice.

#### T02 — Special-vertex splitting and Frobenius warning

**theorem; planned**. §2.1.

A chosen special vertex identifies Wtilde with X_*(T)_I semidirect W0, but the splitting need not be phi-equivariant. The gradient of the affine phi-action is its linear action.

Existing owners: `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.4`.

Inputs: D02.

Proof: Separate origin choice from the intrinsic affine action.

#### D03 — Quasisplit Frobenius action

**definition; missing**. §2.1 (2.4)–(2.5).

For D01, correct the original Frobenius by an adjoint Weyl element so that phi0 preserves the chosen Borel and special vertex; phi0 gives the action on the based root datum of the quasisplit inner form.

Inputs: D02.

Use: §§2.2,4,5.3 — Used for rational dominance averages and HN Levi stability.

API:

- `GLX26.D03.construct` (constructor): Construct the adjoint correction and its action on the apartment.
- `GLX26.D03.characterise` (characterisation): Compare affine phi with based-datum phi0 and its finite-order gradient.
- `GLX26.D03.transport` (functoriality): Show changing the pinning conjugates the construction without changing invariant classes.

Acceptance tests:

- `GLX26.D03.test1`: For a split group with stable alcove one can use the identity correction.
- `GLX26.D03.test2`: For a torus only the lattice action remains.
- `GLX26.D03.test3`: An inner form can have nontrivial affine translation although the based-datum action is trivial.

#### D04 — Admissible Weyl set

**definition; planned**. §2.1 (2.3).

For D01–D02, Adm(mu) consists of w in Wtilde satisfying w <= t^lambda for some lambda in W0 times the dominant inertia coinvariant mu-bar. Parahoric admissibility is the corresponding double-coset image.

Existing owners: `ReductiveGroupsPartII:RG2.4`.

Inputs: D02.

Use: §3.2 and4.3 — Defines bounds of local models and closed ADLV.

API:

- `GLX26.D04.construct` (constructor): Form the Bruhat lower union of the Weyl-conjugate translations.
- `GLX26.D04.characterise` (characterisation): Membership preserves the common Kottwitz component.
- `GLX26.D04.transport` (functoriality): Map the admissible locus through compatible parahoric or group maps.

Acceptance tests:

- `GLX26.D04.test1`: For Gm and mu=m the set is {t^m}.
- `GLX26.D04.test2`: For mu=0 the Iwahori admissible set is {1}.
- `GLX26.D04.test3`: An element in a different Omega component is never below t^mu.

#### D05 — Algebraic fundamental group and Kottwitz invariants

**definition; planned**. §2.2.

For reductive G, pi1(G)=X_*(T)/Q_G^vee with its Galois action. Distinguish kappa_G:G(L)->pi1(G)_I from the class invariant kappa:B(G)->pi1(G)_Gamma.

Existing owners: `BunGAndNewtonStrata:BG1`.

Inputs: D01, L09.

Use: §§3.7,4,6 — Target of component maps and z-extension reductions.

API:

- `GLX26.D05.construct` (constructor): Construct the coroot-lattice quotient and inertia/global coinvariants.
- `GLX26.D05.characterise` (characterisation): Identify the torus quotient with its cocharacter lattice; identify pi1 of simply connected semisimple G with zero.
- `GLX26.D05.transport` (functoriality): Prove naturality under products, central maps and Frobenius.

Acceptance tests:

- `GLX26.D05.test1`: pi1(GLn)=Z via determinant.
- `GLX26.D05.test2`: pi1(SLn)=0.
- `GLX26.D05.test3`: pi1(PGLn)=Z/n, so rationalizing loses information.

#### D06 — Sigma-conjugacy and sigma-centralizer

**definition; planned**. §§1.1,2.2.

For D01, B(G) is the set of phi-conjugacy classes in G(L), and J_b represents the group of automorphisms of the G-isocrystal defined by b; J_b(Qp)={g:g b=b phi(g)}.

Existing owners: `BunGAndNewtonStrata:BG0`.

Inputs: D01.

Use: §3.3 and6.13 — Supplies commuting actions and Newton classes.

API:

- `GLX26.D06.construct` (constructor): Construct the equivalence relation and the automorphism group functor.
- `GLX26.D06.characterise` (characterisation): Identify phi-conjugate representatives by a specified change of trivialization.
- `GLX26.D06.transport` (functoriality): Extend structure group, preserving the J_b action on modifications.

Acceptance tests:

- `GLX26.D06.test1`: For Gm, valuations classify B(Gm).
- `GLX26.D06.test2`: b=1 has J_b(Qp)=G(Qp).
- `GLX26.D06.test3`: Ordinary conjugacy does not replace phi-conjugacy over L.

#### D07 — Newton point and acceptable classes

**definition; planned**. §2.2 (2.6)–(2.8).

For D01, nu_b is the rational dominant Newton cocharacter; mu^natural is the image in pi1(G)_Gamma and mu^diamond is the finite phi0-average of the dominant inertia average of mu. B(G,{mu}) imposes kappa(b)=mu^natural and nu_b <= mu^diamond.

Existing owners: `BunGAndNewtonStrata:BG1`.

Inputs: D03, D05, D06.

Use: §§4–6 — HN conditions and generic monodromy inequalities.

API:

- `GLX26.D07.construct` (constructor): Construct inertia and Frobenius averages in the rational cocharacter space.
- `GLX26.D07.characterise` (characterisation): Compare Newton and Hodge bounds using the positive coroot cone and equal Kottwitz class.
- `GLX26.D07.transport` (functoriality): Prove functoriality for products and central/adjoint maps.

Acceptance tests:

- `GLX26.D07.test1`: For split GL2, mu=(1,0), basic nu=(1/2,1/2) satisfies the bound.
- `GLX26.D07.test2`: For a torus the Newton bound is equality.
- `GLX26.D07.test3`: The same Newton point with a different torsion Kottwitz invariant need not lie in B(G,mu).

#### D08 — Hodge–Newton irreducibility

**definition; missing**. Definition2.1.

For D01 and b in B(G,{mu}), HN-irreducibility means every coefficient of mu^diamond-nu_b in the basis of absolute simple coroots is strictly positive. Use the quasisplit based root datum; for a torus the condition is vacuous.

Inputs: D07.

Use: Theorems5.8,6.1,6.2 — Hypothesis of the main component theorem.

API:

- `GLX26.D08.construct` (constructor): Define strict positivity with the actual absolute simple coroot basis.
- `GLX26.D08.characterise` (characterisation): Translate to the equivalent relative condition using Galois-invariant coefficients.
- `GLX26.D08.transport` (functoriality): Show invariance under ad-isomorphisms and equivalence factor by factor.

Acceptance tests:

- `GLX26.D08.test1`: Split GL2 with mu=(1,0), nu=(1/2,1/2) is HN-irreducible.
- `GLX26.D08.test2`: Every acceptable torus pair satisfies the empty condition.
- `GLX26.D08.test3`: GL2 with mu=nu=(1,0) is not HN-irreducible.

#### D09 — Decent representative

**definition; missing**. Definition2.3.

For D01, b is s-decent for a positive integer s if (b phi)^s=(s nu_b)(p) phi^s with s nu_b integral. This entails compatible descent of b and nu to Qp^s after the specified normalization.

Inputs: D07.

Use: §5.1 and5.3 — Produces the finite-field fiber functor and Newton eigenspaces.

API:

- `GLX26.D09.construct` (constructor): Package s>0, the integral cocharacter and the semilinear identity.
- `GLX26.D09.characterise` (characterisation): Compare the s-fold operator in each algebraic representation with (s nu_b)(p).
- `GLX26.D09.transport` (functoriality): Enlarge s by a positive multiple and transport by compatible sigma-conjugacy.

Acceptance tests:

- `GLX26.D09.test1`: For a rank-one slope m, b=p^m is 1-decent.
- `GLX26.D09.test2`: b=1 has the identity decent equation for s=1.
- `GLX26.D09.test3`: s=0 must not trivialize the definition and its finite-field descent.

#### T03 — Existence of decent dominant representatives

**theorem; missing**. §2.2 after Definition2.3.

Every sigma-conjugacy class has a decent representative with dominant Newton cocharacter after choosing sufficiently divisible positive s.

Inputs: D06, D09.

Proof: Use the original Kottwitz classification and descent, not a choice from an unproved nonempty set.

#### T04 — Restriction of scalars local-field reduction

**theorem; planned**. Remark2.4.

The local component statement over a finite F/Qp reduces to that over Qp by restriction of scalars with compatible Frobenius, parahoric, cocharacter orbit and component invariants. No equal-characteristic conclusion follows from this reduction.

Existing owners: `ReductiveGroupsPartII:RG2.0a`.

Inputs: D01, D07.

Proof: Track the factors indexed by embeddings and the Frobenius permutation.

#### D10 — Component Kottwitz coset

**definition; missing**. §1.1 (1.1)–(1.2);§2.2.

For D01, define c_(b,mu) pi1(G)_I^phi as the nonempty fiber of (phi-1)kappa(g)=mu-bar-kappa(b). It is an affine coset in pi1(G)_I; a choice identifies it with the invariant group.

Inputs: D05, D07.

Use: Theorems1.2,6.1,6.2 — Prevents silently replacing the natural target by a group.

API:

- `GLX26.D10.construct` (constructor): Construct the affine solution set with its invariant-group torsor action.
- `GLX26.D10.characterise` (characterisation): Show every ADLV point maps to this fiber by the Kottwitz identity.
- `GLX26.D10.transport` (functoriality): Transport cosets under group maps and record the translation induced by left multiplication.

Acceptance tests:

- `GLX26.D10.test1`: For split Gm and b=p^m,mu=m the coset is all Z.
- `GLX26.D10.test2`: A trivial fundamental group gives a singleton target.
- `GLX26.D10.test3`: For nontrivial phi, a torsor need not have a canonical zero.

#### D11 — Witt affine flag and closed affine Deligne–Lusztig variety

**definition; missing**. §1.1;§3.1–3.2.

For D01, the mixed-characteristic perfect affine flag is LG/L+K. X_mu^K(b) is its reduced perfect subspace cut out by g^-1 b phi(g) in the union of parahoric double cosets indexed by Adm(mu). Here X_mu is the closed admissible union, not one exact stratum.

Inputs: D04, D06.

Use: §§3–6 — Geometric object whose connected components are computed.

API:

- `GLX26.D11.construct` (constructor): Construct the bounded perfect subfunctor using relative position and descent.
- `GLX26.D11.characterise` (characterisation): Identify geometric points with the specified admissible double-coset condition.
- `GLX26.D11.transport` (functoriality): Construct compatible level, product and group-change maps.

Acceptance tests:

- `GLX26.D11.test1`: For Gm,b=p^m,mu=m the space is discrete with points Z.
- `GLX26.D11.test2`: For b=1,mu=0 it is the discrete rational coset space in the cases of Proposition4.8.
- `GLX26.D11.test3`: Exact X_w and the closed admissible union have different incidence and component behavior.

#### T05 — Witt affine flag representability and component map

**theorem; planned**. §§1.1,3.1.

For D01 the affine flag is an ind-perfect algebraic space in the established bounded geometry, its connected components identify with pi1(G)_I, and kappa is locally constant.

Existing owners: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Inputs: D05, D11.

Proof: Import bounded Witt affine geometry and the component theorem with its actual group hypotheses.

#### T06 — ADLV nonemptiness and Kottwitz surjectivity

**theorem; missing**. §1.1 and§4.11.

For D01 with [b] in B(G,{mu}), X_mu^K(b) is nonempty and its Kottwitz component map surjects onto c_(b,mu) pi1(G)_I^phi. These are inputs, not consequences of bijectivity.

Inputs: D10, D11.

Proof: Retain the original nonemptiness/straight-element and rational Kottwitz proofs as separate recursive obligations.

#### D12 — Adjoint isomorphism

**definition; missing**. Definition3.14.

An ad-isomorphism f:G->H is a group morphism carrying centers to centers and inducing an isomorphism G_ad≅H_ad. Bounds, b and reflex fields must be transported along f.

Inputs: D01.

Use: §§3.7,4.9,6.2 — Controls the group-reduction steps.

API:

- `GLX26.D12.construct` (constructor): Package the centrality and adjoint isomorphism data.
- `GLX26.D12.characterise` (characterisation): Identify the common simply connected adjoint cover without asserting surjectivity on rational points of every central isogeny.
- `GLX26.D12.transport` (functoriality): Compose maps and construct compatible parahoric maps.

Acceptance tests:

- `GLX26.D12.test1`: GLn->PGLn is an ad-isomorphism.
- `GLX26.D12.test2`: An arbitrary homomorphism of tori has trivial adjoint groups and is an ad-isomorphism.
- `GLX26.D12.test3`: An inclusion SL2->SL3 is not an ad-isomorphism.

#### D13 — Z-extension

**definition; missing**. Definition3.15.

A z-extension Gtilde->G is a central extension with induced-torus kernel and simply connected derived group of Gtilde.

Inputs: D12.

Use: Lemma3.16 andProposition6.7 — Reduces the main theorem to simply connected derived group.

API:

- `GLX26.D13.construct` (constructor): Construct the extension together with the induced-torus presentation.
- `GLX26.D13.characterise` (characterisation): Use Hilbert90/Shapiro to prove rational-point surjectivity of this extension.
- `GLX26.D13.transport` (functoriality): Lift cocharacters and acceptable classes, comparing their adjoint images.

Acceptance tests:

- `GLX26.D13.test1`: GLn->PGLn has Gm kernel and simply connected derived group.
- `GLX26.D13.test2`: The identity of a torus is an allowed extension with trivial kernel.
- `GLX26.D13.test3`: SLn->PGLn has finite kernel and is not a z-extension as defined.

#### T07 — Lifting the bound and acceptable class

**theorem; planned**. Lemma3.16(1).

For a z-extension and b in B(G,{mu}), choose a lifted cocharacter class and a class btilde in B(Gtilde,{mutilde}) mapping to b. Use the fixed-bound bijections with the adjoint B-set.

Existing owners: `BunGAndNewtonStrata:BG1`.

Inputs: D13, D07.

Proof: Lift through exact cocharacter lattices of tori, then apply Kottwitz6.5.1 with its fixed-bound hypothesis.

#### T08 — Surjectivity of z-extension component cosets

**theorem; missing**. Lemma3.16(2).

For T07 the map c_(btilde,mutilde) pi1(Gtilde)_I^phi -> c_(b,mu) pi1(G)_I^phi is surjective.

Inputs: D10, D13.

Proof: Use rational-point surjectivity for the induced torus and the genuine rational Kottwitz surjectivity theorem. Printed (3.23) is false; E03 forbids that proof.

#### T09 — Adjoint comparison of ADLV components

**theorem; missing**. Proposition3.17 (3.26).

For an ad-isomorphism, transported b,mu and corresponding connected parahorics, the square of ADLV connected components and their Kottwitz cosets is Cartesian.

Inputs: D11, D12.

Proof: Import PR On integral local Shimura varieties, Lemma5.4.2, preserving model and component hypotheses.

#### D14 — Simply connected quotient of rational points

**definition; missing**. §1.3 p813.

Define G°=G(Qp)/im(Gsc(Qp)->G(Qp)). Use this normal quotient as written; it is not asserted to be the maximal abelian quotient for arbitrary anisotropic G.

Inputs: D12.

Use: Theorem6.1(5) — Corrects the overstatement about maximal abelian quotients.

API:

- `GLX26.D14.construct` (constructor): Form the normal image quotient with the locally profinite quotient topology.
- `GLX26.D14.characterise` (characterisation): When Gder=Gsc, use H^1(Qp,Gsc)=1 to identify G° with Gab(Qp).
- `GLX26.D14.transport` (functoriality): Induce quotient maps from ad-isomorphisms and compare the common simply connected cover.

Acceptance tests:

- `GLX26.D14.test1`: For GLn, G°=Qp× by determinant.
- `GLX26.D14.test2`: For simply connected semisimple G, G° is trivial.
- `GLX26.D14.test3`: SL1 of a quaternion division algebra over Q3 has nontrivial abelian residue quotient despite G°=1.

#### T10 — Rational local group vanishing and open central-isogeny image

**theorem; missing**. §6.2,6.6–6.7, implicit local group inputs.

For simply connected semisimple G/Qp, H^1(Qp,G)=1. A central isogeny of connected reductive Qp-groups has open finite-index image on rational points; it need not be surjective.

Inputs: D01, D13.

Proof: Read the local Galois-cohomology vanishing and analytic open-image theorem before closing the z-extension and determinant arguments.

#### D20 — Locally profinite sheaf

**definition; planned**. §3.1.

For a locally profinite space T, underline T on characteristic-p perfectoid spaces sends S to continuous maps |S|->T. For a locally profinite group this is a group v-sheaf.

Existing owners: `DiamondsAndVStacks:D3`.

Use: Lemma3.2 and§6.7 — Records continuity before torsor quotients.

API:

- `GLX26.D20.construct` (constructor): Sheafify the continuous-map functor with its pointwise operations.
- `GLX26.D20.characterise` (characterisation): For profinite T and algebraically closed perfectoid C, identify underline T times Spa(C,OC) with the continuous-function perfectoid construction.
- `GLX26.D20.transport` (functoriality): A continuous map T->U induces the corresponding v-sheaf map.

Acceptance tests:

- `GLX26.D20.test1`: Finite discrete T gives a finite coproduct of the base.
- `GLX26.D20.test2`: A singleton gives the terminal relative sheaf.
- `GLX26.D20.test3`: An abstract discontinuous homomorphism need not define this functorial map.

#### D21 — Small v-sheaf and its underlying topology

**definition; planned**. §3.1;Scholze ECD §§11–12.

A small v-sheaf admits a set-sized perfectoid cover with the stated small relation; its topological space is obtained from geometric points and the presentation quotient topology. A diamond admits a pro-etale equivalence-relation presentation.

Existing owners: `DiamondsAndVStacks:D4`.

Inputs: D20.

Use: Lemma3.2 — The unrestricted class in the source is larger than the applications.

API:

- `GLX26.D21.construct` (constructor): Construct a small quotient from an allowed atlas and relation.
- `GLX26.D21.characterise` (characterisation): Compare underlying spaces under atlas refinement.
- `GLX26.D21.transport` (functoriality): Form fiber products and the permitted group quotients, tracking smallness.

Acceptance tests:

- `GLX26.D21.test1`: A perfectoid space is a diamond.
- `GLX26.D21.test2`: The empty sheaf has empty underlying space.
- `GLX26.D21.test3`: A diamond need not be locally spatial: the dense Z-action quotient in E01 is an example.

#### T20 — Topology of a small v-sheaf quotient

**theorem; planned**. Lemma3.2 first assertion;Scholze12.7–12.9.

If F->H is a K-torsor for a locally profinite K and both sheaves are small, |H| is the quotient |F|/K with the quotient topology. The analogous assertion pi0(H)=pi0(F)/K is false without additional hypotheses.

Existing owners: `DiamondsAndVStacks:D4`.

Inputs: D20, D21.

Proof: Use the v-surjection quotient theorem. Keep the component comparison as the separate restricted obligation T21.

#### T21 — Component descent needed by the local-shtuka torsors

**theorem; missing**. Lemma3.2 andits uses in3.12,6.6,6.9,6.12,6.13.

For the actual locally spatial local-shtuka period torsors, compact parahoric quotients and compact Galois descent used in §§3.5,6.2,6.6–6.7, prove component-orbit comparison with sufficient geometric hypotheses. This is an unresolved restricted supplier contract, not the false universal statement of Lemma3.2.

Inputs: T20, L51.

Proof: First supply a correct theorem for each application. E01 gives a dense-action counterexample to the printed generality; a compact-only replacement does not cover G(Qp).

#### T22 — Locally spatial inverse-limit topology

**theorem; planned**. Lemma3.2 proof;§6.7 p855;Scholze12.17.

For a cofiltered inverse system of locally spatial diamonds with qcqs transition maps, the underlying space of the limit is homeomorphic to the inverse limit of underlying spaces. The general small-v-sheaf statement in Scholze12.17 supplies only the corresponding bijection without these spatial hypotheses.

Existing owners: `DiamondsAndVStacks:D5`.

Inputs: D21.

Proof: Apply the exact locally spatial clause. A further connected-component argument is needed in the geometric-to-finite-field passage.

#### D22 — Reduction of a v-sheaf

**definition; missing**. §3.1;Gleason Specialization §3.

For a v-sheaf F, its scheme-theoretic reduction on perfect Fp-algebras is F_red(Spec R)=F(Spd(R,R)), with adjunction map (F_red)^diamond->F. Representability by a perfect scheme is an additional property.

Inputs: D21.

Use: Theorem3.7 — Identifies the integral shtuka special fiber with an ADLV.

API:

- `GLX26.D22.construct` (constructor): Construct reduction on perfect algebras and the adjunction morphism.
- `GLX26.D22.characterise` (characterisation): Compare the reduction of a formal model with its reduced perfected special fiber.
- `GLX26.D22.transport` (functoriality): Prove reduction commutes with the finite limits used in formal-adic diagrams.

Acceptance tests:

- `GLX26.D22.test1`: The reduction of Spd Zp is Spec Fp in the perfected category.
- `GLX26.D22.test2`: A quasiseparated analytic diamond has empty scheme-theoretic reduction.
- `GLX26.D22.test3`: Reduction is not the underlying topological point set of an analytic diamond.

#### D23 — Formally adic and formally separated morphisms

**definition; missing**. §3.1;Gleason Definitions3.20,3.27.

A map F->H is formally adic when its square with the two reduction adjunction maps is Cartesian. A formally closed immersion is a closed immersion that is formally adic; F is formally separated when its diagonal is formally closed.

Inputs: D22.

Use: Gleason4.9–4.15 — Needed before specialization can descend.

API:

- `GLX26.D23.construct` (constructor): Form the Cartesian reduction condition and the diagonal instance.
- `GLX26.D23.characterise` (characterisation): Identify uniqueness of formalizations from formal separatedness.
- `GLX26.D23.transport` (functoriality): Prove base change and composition of formal-adic morphisms.

Acceptance tests:

- `GLX26.D23.test1`: The diagonal of Spd Zp is formally closed.
- `GLX26.D23.test2`: The identity map is formally adic.
- `GLX26.D23.test3`: Adicness of arbitrary Huber-pair maps is not equivalent to formal adicness of their v-sheaves.

#### D24 — Specializing v-sheaf

**definition; missing**. §3.1;Gleason Definitions4.5,4.6,4.11.

A small v-sheaf F is specializing if it is formally separated and v-formalizing: every perfectoid test map v-locally extends from Spa(R,R+) to Spd(R+,R+). Equivalently it is formally separated and v-locally covered by formal Huber pairs.

Inputs: D23.

Use: Gleason4.12–4.14 — Descent domain for the specialization map.

API:

- `GLX26.D24.construct` (constructor): Package the local extensions and formal separatedness.
- `GLX26.D24.characterise` (characterisation): Use uniqueness to identify competing formalizations.
- `GLX26.D24.transport` (functoriality): Pull back two specializing objects over a formally separated target.

Acceptance tests:

- `GLX26.D24.test1`: Spd Zp is specializing.
- `GLX26.D24.test2`: The empty v-sheaf satisfies the local condition vacuously.
- `GLX26.D24.test3`: A nonempty quasiseparated analytic diamond is not v-formalizing.

#### D25 — Specialization map

**construction; missing**. §3.1;Gleason4.12–4.14.

For a specializing F, sp_F:|F|->|F_red| is obtained by extending a geometric test point to its integral valuation ring and mapping the closed point of its reduction. It is independent of extensions and continuous.

Inputs: D24.

Use: Theorem3.9 and6.8 — Transfers connected components and level-map surjectivity.

API:

- `GLX26.D25.construct` (constructor): Construct the specialization using an integral formalization.
- `GLX26.D25.characterise` (characterisation): For Spa(A,A+), compute the ideal {a:|a(x)|<1}.
- `GLX26.D25.transport` (functoriality): Prove the naturality square for morphisms of specializing v-sheaves.

Acceptance tests:

- `GLX26.D25.test1`: For a complete rank-one valuation ring, every analytic field point specializes to its closed residue point.
- `GLX26.D25.test2`: An identity map gives a commuting specialization square.
- `GLX26.D25.test3`: Specialization is generally not injective: an entire disc can specialize to one closed point.

#### D26 — Prekimberlite

**definition; missing**. §3.1;Gleason4.15.

A prekimberlite is a specializing v-sheaf F whose reduction is represented by a perfect scheme and whose reduction adjunction is a closed immersion. Set F_an=F minus (F_red)^diamond.

Inputs: D22, D24.

Use: §3.3 integral shtukas — Carrier for smelted pairs.

API:

- `GLX26.D26.construct` (constructor): Package representable reduction and its closed immersion.
- `GLX26.D26.characterise` (characterisation): Identify the complementary analytic open.
- `GLX26.D26.transport` (functoriality): Restrict to formal neighborhoods with their corrected reduction.

Acceptance tests:

- `GLX26.D26.test1`: The eligible separated formal schemes in Gleason Convention1 give prekimberlites.
- `GLX26.D26.test2`: An empty special fiber does not by itself supply v-formalizing.
- `GLX26.D26.test3`: An analytic generic fiber alone forgets the required integral special fiber.

#### D27 — Valuative prekimberlite

**definition; missing**. Gleason4.30;GLX§3.1.

For a prekimberlite F, let SP_F:F->(F_red)^(diamond/circle) be Gleason’s formal specialization morphism. F is valuative when SP_F is partially proper. The formal thickening functor must be constructed, not replaced by its underlying space.

Inputs: D26.

Use: Gleason4.33–4.35 — Supplies specializing topology and smelted kimberlites.

API:

- `GLX26.D27.construct` (constructor): Construct SP_F using the formal thickening adjunction.
- `GLX26.D27.characterise` (characterisation): Express valuativity by extension over enlarged integral valuation rings.
- `GLX26.D27.transport` (functoriality): Preserve valuativity under the stated partially proper maps and formal neighborhoods.

Acceptance tests:

- `GLX26.D27.test1`: An eligible separated formal scheme has a valuative diamond.
- `GLX26.D27.test2`: An identity formal neighborhood preserves valuativity.
- `GLX26.D27.test3`: Continuity of sp alone does not prove the partial-properness condition.

#### D28 — Smelted kimberlite

**definition; missing**. Gleason4.35(1)–(2);GLX§3.1.

A smelted kimberlite is a pair (F,D) with F a valuative prekimberlite and D an open subsheaf of F_an that is a quasiseparated locally spatial diamond, with D->F partially proper.

Inputs: D27.

Use: Theorems3.7–3.9 — Exact hypotheses of specialization comparison.

API:

- `GLX26.D28.construct` (constructor): Package the pair and its partially proper open inclusion.
- `GLX26.D28.characterise` (characterisation): Restrict sp_F to |D|.
- `GLX26.D28.transport` (functoriality): Base change along the formal neighborhoods allowed by Gleason4.39/4.42.

Acceptance tests:

- `GLX26.D28.test1`: An integral local shtuka together with its bounded generic fiber is the main example.
- `GLX26.D28.test2`: Taking D empty does not imply richness.
- `GLX26.D28.test3`: An arbitrary open analytic subsheaf without partial properness is insufficient.

#### D29 — Kimberlite

**definition; missing**. Gleason4.35(3);GLX§3.1.

A prekimberlite F is a kimberlite when (F,F_an) is a smelted kimberlite and sp on the full analytic locus is quasicompact.

Inputs: D28.

Use: §3.2 — Local models provide the connected-tube supplier.

API:

- `GLX26.D29.construct` (constructor): Specialize the smelted pair to the full analytic locus.
- `GLX26.D29.characterise` (characterisation): Over affine reduction charts identify quasicompact specialization with spatial inverse-image diamonds.
- `GLX26.D29.transport` (functoriality): Transport through the formally closed immersions and formal-etale maps with their hypotheses.

Acceptance tests:

- `GLX26.D29.test1`: The bounded integral local model is a kimberlite.
- `GLX26.D29.test2`: A smelted pair does not require its chosen D to equal all F_an.
- `GLX26.D29.test3`: Quasiseparatedness of D alone does not give quasicompact specialization.

#### D30 — Tubular neighborhood

**definition; missing**. Gleason4.38–4.39;GLX§3.1.

For a smelted pair (F,D) and constructible locally closed S in |F_red|, its tube is F_/S times_F D, using the formal neighborhood. It corresponds to the INTERIOR of sp_D^-1(S), not in general the entire fiber.

Inputs: D28.

Use: Theorem3.8 andlocal model correspondence — Connected tubes are the normality input.

API:

- `GLX26.D30.construct` (constructor): Construct the formal neighborhood and its analytic fiber product.
- `GLX26.D30.characterise` (characterisation): Identify the underlying tube with the interior of the specialization inverse image.
- `GLX26.D30.transport` (functoriality): Compare nested locally closed sets and permitted base changes.

Acceptance tests:

- `GLX26.D30.test1`: For a closed point of a formal disc, the tube is the corresponding open residue disc.
- `GLX26.D30.test2`: The tube over the whole reduction is D.
- `GLX26.D30.test3`: For a rank>1 valuation pair, the closed-point specialization fiber can be nonempty with empty interior.

#### D31 — Constructibly Jacobson diamond

**definition; missing**. Gleason4.44;GLX§3.1 richness input.

A locally spatial diamond D is constructibly Jacobson when its rank-one points are dense in the constructible topology.

Inputs: D21.

Use: Gleason4.45–4.55 — Turns connected tubes into connected fibers.

API:

- `GLX26.D31.construct` (constructor): Package density of rank-one points in each patch-open subset.
- `GLX26.D31.characterise` (characterisation): Deduce density of a constructible tube in its full specialization fiber.
- `GLX26.D31.transport` (functoriality): Prove preservation for the stated etale maps, open immersions and surjective maps.

Acceptance tests:

- `GLX26.D31.test1`: Diamonds of finite-type adic spaces over a complete rank-one field satisfy the condition.
- `GLX26.D31.test2`: A perfectoid field with its rank-one valuation supplies the point example.
- `GLX26.D31.test3`: A higher-rank closed valuation point alone is not a dense rank-one locus.

#### D32 — Rich and topologically normal smelted pair

**definition; missing**. Gleason4.52;GLX§3.1.

A smelted pair (F,D) is rich if F is valuative, D is constructibly Jacobson, |F_red| is locally Noetherian and sp_D is surjective. A rich pair is topologically normal when every closed-point tube is connected.

Inputs: D28, D30, D31.

Use: Theorem3.9 — Hypotheses of the abstract component comparison.

API:

- `GLX26.D32.construct` (constructor): Assemble each finiteness, density and surjectivity hypothesis.
- `GLX26.D32.characterise` (characterisation): Characterize topological normality by the closed-point tubes.
- `GLX26.D32.transport` (functoriality): Preserve richness for constructible formal and formal-etale neighborhoods.

Acceptance tests:

- `GLX26.D32.test1`: The GLX local-model and integral-shtuka pairs satisfy these conditions.
- `GLX26.D32.test2`: A surjective specialization with disconnected closed tube is rich at best, not topologically normal.
- `GLX26.D32.test3`: Normality of an unrelated generic scheme does not prove this condition.

Scope note: Richness and topological normality are logically distinct properties; a design must expose both predicates and their individual API rather than one opaque combined class.

#### T23 — Rich specialization is a quotient map

**theorem; missing**. Gleason4.53.

For a rich smelted pair, sp_D is a quotient map.

Inputs: D32.

Proof: Use valuation lifts over irreducible components and the locally Noetherian finite-component reduction.

#### T24 — Topologically normal rich specialization compares components

**theorem; missing**. GLX3.9;Gleason4.55.

For a topologically normal rich smelted pair (F,D), pi0(sp_D):pi0(D)->pi0(F_red) is bijective.

Inputs: D32, T23.

Proof: Rank-one patch density makes the connected closed-point tube dense in its fiber; specialization and locally Noetherian component control give the clopen comparison. Keep this distinct from the false quotient lemma E01.

#### D33 — Bounded de Rham Grassmannian and integral local model

**definition; missing**. §3.2.

For D01, Gr_mu is the closed bounded B_dR affine Grassmannian over breve E, with open Schubert cell Gr_mu^circ. The integral parahoric local model M_K,mu is the v-sheaf closure of this bound in the Beilinson–Drinfeld Grassmannian.

Inputs: D01, D04, D29.

Use: Lemmas3.3–3.4 andTheorem3.8 — Supplies specialization geometry without requiring Satake sheaves.

API:

- `GLX26.D33.construct` (constructor): Construct the bounded generic moduli and integral closure.
- `GLX26.D33.characterise` (characterisation): Identify generic fiber Gr_mu and reduced special fiber the admissible locus.
- `GLX26.D33.transport` (functoriality): Construct maps from compatible homomorphisms of parahoric models.

Acceptance tests:

- `GLX26.D33.test1`: For hyperspecial GLn and minuscule mu, the usual Grassmannian is the model.
- `GLX26.D33.test2`: For a torus the bound has one geometric generic point.
- `GLX26.D33.test3`: For nonminuscule mu, the open cell and closed Schubert bound are different objects.

#### T25 — Integral local models and unibranch tubes

**theorem; missing**. §3.2 andTheorem3.8.

For every reductive G/Qp, parahoric K, geometric bound mu and breve E⊆F⊆Cp as in GLX3.8, the local-model smelted pair has connected tubes. It is a kimberlite; no minuscule restriction is imposed on the tube theorem.

Inputs: D33, D30.

Proof: Import AGLR local-model construction and Gleason–Lourenco Theorem1.3; preserve the field and formal-base conventions.

#### T26 — Minuscule local-model representability

**theorem; missing**. §3.2 p822.

For Qp and minuscule mu, the integral local model has the normal flat scheme representative described in §3.2, including the small-p cases supplied by Gleason–Lourenco. Do not import the p>=5 restriction from only the earlier AGLR result.

Inputs: D33.

Proof: Separate representability, normality and reduced special fiber, tracking the original theorem’s projectivity and finite-type hypotheses.

#### T27 — Functorial admissible loci

**theorem; planned**. Lemmas3.3–3.4.

A Qp-group morphism extending between chosen parahoric group schemes and carrying mu1 to mu2 induces the affine-flag map, carries the corresponding admissible locus into the target one, and induces a map of closed ADLV for b2=f(b1).

Existing owners: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Inputs: D11, D33.

Proof: Construct the local-model map, reduce it, and use the pointwise relative-position formula.

#### T28 — Criterion for extension to parahoric models

**theorem; planned**. Remark3.5.

Under the parahoric group-model setting of §3.2, the group map extends uniquely when it maps the indicated breve integral points into the target ones, as in Kaletha–Prasad2.10.10.

Existing owners: `ReductiveGroupsPartII:RG2.3`.

Inputs: D01.

Proof: Read the original extension criterion and its smooth affine model hypotheses.

#### T29 — Products and determinant at parahoric level

**theorem; planned**. Lemma3.6 and§3.3 (3.14).

Closed ADLV and local-model constructions commute with products for compatible data. A determinant map uses det(K) as the actual level; equality with the full torus parahoric requires a separate proof.

Existing owners: `HeckeStacksAndLocalShtukas:HS2`.

Inputs: D11, D33.

Proof: Use the product moduli description and the precise integral group map.

#### D34 — Local shtuka tower

**definition; planned**. §3.3.

For D01, Sht_(G,b,mu,infty) parametrizes bounded modifications of the prescribed G-bundles with infinite-level trivialization. Finite compact-open levels are quotients with their transition maps; retain commuting G(Qp),J_b(Qp) actions and reflex/Weil descent.

Existing owners: `HeckeStacksAndLocalShtukas:HS2`.

Inputs: D06, D33.

Use: §§3.5,6 — Analytic source of the component computation.

API:

- `GLX26.D34.construct` (constructor): Construct the Hecke-fiber moduli with the two trivializations.
- `GLX26.D34.characterise` (characterisation): Identify level quotient fibers and the infinite-level inverse limit under proved hypotheses.
- `GLX26.D34.transport` (functoriality): Extend structure group, change levels and compare products with commuting actions.

Acceptance tests:

- `GLX26.D34.test1`: For a torus the geometric infinite-level space is a T(Qp)-torsor over a point.
- `GLX26.D34.test2`: The identity level transition is the identity.
- `GLX26.D34.test3`: G(Qp) need not act on an individual finite nonnormal level; it acts through Hecke correspondences or the tower.

#### D35 — Integral parahoric shtuka space

**definition; missing**. §3.3.

For D01 and an integral reflex base, Sht_K,mu(b) is the integral bounded shtuka moduli with the parahoric extension data. Its reduction is X_mu^K(b); its generic fiber is the corresponding parahoric-level diamond.

Inputs: D34, D26.

Use: Theorems3.7,3.9 andCorollary6.3 — Connects the geometric component theorem to formal models.

API:

- `GLX26.D35.construct` (constructor): Construct bounded integral modifications and the specified Frobenius isogeny.
- `GLX26.D35.characterise` (characterisation): Compare reduction with the closed admissible ADLV and generic fiber with the tower level.
- `GLX26.D35.transport` (functoriality): Construct group-map and level-map morphisms before applying specialization.

Acceptance tests:

- `GLX26.D35.test1`: The torus case reduces to a discrete ADLV.
- `GLX26.D35.test2`: The identity group map gives the identity on integral and generic moduli.
- `GLX26.D35.test3`: A generic local shtuka diamond by itself is not a definition of an integral model.

#### T30 — Integral shtukas are rich smelted kimberlites

**theorem; missing**. Theorem3.7.

For the datum D01 and the field/base changes specified in §3.3, the integral shtuka with its generic level diamond is a rich smelted kimberlite, with reduced fiber X_mu^K(b) and continuous surjective specialization.

Inputs: D35, D32.

Proof: Use Gleason2.76 and its cited local-model correspondence, local Noetherian ADLV theorem and constructible-Jacobson inputs.

#### T31 — Tubular local-model correspondence

**theorem; missing**. §3.3 (3.10)–(3.11),footnote19.

At the corresponding closed points, shtuka and local-model tubes are connected through the diagram of torsors under the connected infinite-dimensional positive Witt loop group in (3.10), giving a bijection of their component sets.

Inputs: D30, D35, D33.

Proof: Construct both loop-group torsors and prove their connectedness effect. This is not a finite-dimensional smooth K-torsor local-model diagram.

#### T32 — Shtuka specialization component bijection

**theorem; missing**. Theorem3.9.

For D01 and breve E⊆F⊆Cp in the stated complete nonarchimedean setting, specialization induces pi0(Sht_(G,b,mu,K) times Spd F) ≅ pi0(X_mu^K(b)), functorially with the group and level maps.

Inputs: T24, T25, T30, T31.

Proof: Transfer connected tubes through the Witt-loop correspondence, then apply the rich-normal comparison.

#### T33 — Integral group-map specialization square

**theorem; missing**. Lemma3.10.

For a compatible map of parahoric models carrying b1,mu1 to b2,mu2, integral shtuka functoriality induces a commuting specialization square with the ADLV map of Lemma3.3.

Inputs: T27, D35, D25.

Proof: Extend the structure group on torsors and the Frobenius isogeny; correct the source’s order/index slips in (3.15).

#### D36 — Admissible period domain and universal crystalline torsor

**definition; missing**. §3.5 (3.17).

The Grothendieck–Messing map from Sht_(G,b,mu,infty) to Gr_mu is quasi-pro-etale. Its image Gr_mu^b is the b-admissible open, and the map is the universal G(Qp)-torsor L_b there. Classical finite-extension points pull back to crystalline G-representations with the corresponding bound.

Inputs: D34, D33.

Use: Theorem3.11 and§6.7 — Transfers generic crystalline monodromy to component stabilizers.

API:

- `GLX26.D36.construct` (constructor): Construct the period morphism and its admissible image.
- `GLX26.D36.characterise` (characterisation): Identify the infinite-level space as the universal torsor over this open.
- `GLX26.D36.transport` (functoriality): Pull back at a classical point and compare the resulting Galois representation and isocrystal.

Acceptance tests:

- `GLX26.D36.test1`: For a torus the geometric period domain is one point.
- `GLX26.D36.test2`: For mu=0,b=1 the period fiber is the constant G(Qp)-torsor.
- `GLX26.D36.test3`: A bound mu does not give exact Hodge type mu at a point outside the open Schubert cell.

#### T34 — Geometric connectedness of the admissible period domain

**theorem; missing**. Theorem3.11.

For D01, Gr_mu^b times Spd Cp is connected and dense in Gr_mu times Spd Cp. This includes nonminuscule bounds.

Inputs: D36.

Proof: Import Gleason–Lourenco On the connectedness of p-adic period domains with its admissible locus and geometric base change.

#### T35 — Transitivity on infinite-level components

**theorem; missing**. Proposition3.12.

For D01, G(Qp) acts transitively on pi0(Sht_(G,b,mu,infty) times Spd Cp). Retain as the source target; its printed derivation from unrestricted Lemma3.2 is gated by T21/E01.

Inputs: T34, T21.

Proof: A valid component theorem for this locally spatial noncompact-group torsor is required; connectedness of the quotient alone is insufficient.

#### T36 — Hecke orbit meets every ADLV component

**theorem; missing**. Corollary3.13.

For D01, a geometric point lifted to the infinite-level shtuka has a G(Qp) Hecke orbit whose image at parahoric level and then under specialization meets every component of X_mu^K(b).

Inputs: T35, T32.

Proof: Use transitivity and functorial specialization with consistent left/right quotient conventions; E01 remains a proof gate.

#### T37 — Bialynicki–Birula classical-point comparison

**theorem; missing**. §3.6.

The BB map Gr_mu^circ->Fl_mu is an isomorphism for minuscule mu. For general mu it still induces the stated bijection on points over finite F/breve E and identifies classical b-admissibility with the weakly admissible flag condition.

Inputs: D33, D36.

Proof: Use Viehmann5.2 and Colmez–Fontaine at classical points. Do not assert an isomorphism of the two nonminuscule diamonds.

#### D40 — Hodge–Newton decomposability

**definition; missing**. Definition4.1, corrected byE04.

For D01 with [b] in B(G,{mu}), the pair is HN-decomposable if there exists a PROPER phi0-stable standard Levi M containing the Newton centralizer M_nu such that mu^diamond-nu_b is in the nonnegative rational cone of the simple coroots of M. HN-indecomposable means no such proper M exists.

Inputs: D07, D08.

Use: Theorem4.3 andProposition4.11 — Controls the reduction of non-irreducible pairs.

API:

- `GLX26.D40.construct` (constructor): Construct a witness proper Levi and the coroot-cone certificate.
- `GLX26.D40.characterise` (characterisation): Negate existence to obtain HN-indecomposability.
- `GLX26.D40.transport` (functoriality): Transport the condition under the compatible adjoint and product reductions.

Acceptance tests:

- `GLX26.D40.test1`: A basic b is HN-indecomposable since M_nu=G.
- `GLX26.D40.test2`: For a torus there is no proper Levi and the pair is indecomposable.
- `GLX26.D40.test3`: Allowing M=G makes every acceptable pair decomposable, contradicting Example4.2.

#### D41 — Hodge–Newton Levi pieces

**construction; missing**. §4 (4.2)–(4.3).

For a decomposable datum with proper standard Levi M and associated P, index the pieces by the phi-stable parabolics Pprime conjugate to P modulo W_K^phi. For each choose h giving the transported Levi Mprime, bound mu_Pprime and b_Pprime=h^-1 b phi(h), with the corresponding parahoric.

Inputs: D40.

Use: Theorem4.3 and4.11 — Open-closed decomposition and coset obstruction.

API:

- `GLX26.D41.construct` (constructor): Construct the parabolic index set and transported data.
- `GLX26.D41.characterise` (characterisation): Identify the embedding of its ADLV by left multiplication by h.
- `GLX26.D41.transport` (functoriality): Compare Kottwitz invariants with the translation kappa(h).

Acceptance tests:

- `GLX26.D41.test1`: A single fixed parabolic gives its corresponding Levi inclusion.
- `GLX26.D41.test2`: Changing h by an allowed Levi/parahoric representative gives the same geometric piece after the prescribed identification.
- `GLX26.D41.test3`: Omitting the kappa(h) translation can put the piece in the wrong ambient coset.

#### T40 — Hodge–Newton decomposition

**theorem; missing**. Theorem4.3;GHN TheoremA.

For D40, X_mu^K(b) is the disjoint union of the Levi ADLV pieces D41, each embedded as an open and closed perfect subspace, with the indexing and translated data just specified.

Inputs: D41.

Proof: Import the full HN-decomposition theorem, its stable parabolic classification and geometric open-closed assertion.

#### T41 — Minimal Hodge–Newton Levi

**theorem; missing**. Lemma4.5.

There is a unique minimal phi0-stable standard Levi in the HN decomposition such that its resulting pairs are HN-indecomposable.

Inputs: D40, T40.

Proof: Use Zhou Proposition5.7 with the chosen based datum; retain uniqueness and every resulting piece.

#### T42 — Basic noncentral pairs in an adjoint simple group

**theorem; missing**. Example4.6.

If G is adjoint Qp-simple, [b] is basic and the Hodge coweight is noncentral, then the acceptable pair is HN-irreducible.

Inputs: D08.

Proof: A nonzero dominant positive-coroot combination has strictly positive coefficients on each connected relative simple factor.

#### T43 — Indecomposable but non-irreducible alternative

**theorem; missing**. Proposition4.7.

For adjoint Qp-simple G and an HN-indecomposable pair, either it is HN-irreducible or mu-bar is central and b is phi-conjugate to t^(mu-bar), with the conventions of Proposition4.7.

Inputs: D40, D08.

Proof: Import the precise GHN/Zhou combinatorial alternative; central means central in the specified relative datum.

#### T44 — Central-bound discrete ADLV

**theorem; missing**. Proposition4.8.

Suppose G_ad is Qp-simple, b is a representative of a basic element of B(G), mu-bar is central and [b] lies in B(G,{mu}). Then X_mu^K(b) is discrete and isomorphic to G(Qp)/K(Zp) as in Proposition4.8, with the required representative normalization.

Inputs: D11, T43.

Proof: Reduce the twisted condition to phi-fixed cosets and use the parahoric Lang argument; preserve any translated b representative.

#### T45 — Adjoint invariance of HN-irreducibility

**theorem; missing**. Proposition4.9.

For an ad-isomorphism and compatible bounds and classes, the source pair is HN-irreducible exactly when the target pair is.

Inputs: D08, D12.

Proof: Identify absolute simple coroot spaces and compare the rational Newton/Hodge differences.

#### T46 — Product criterion for acceptable and irreducible pairs

**theorem; missing**. Proposition4.10.

For G=product G_i, B(G,mu)=product B(G_i,mu_i), and HN-irreducibility holds exactly when it holds for each factor.

Inputs: D08.

Proof: Split Kottwitz, Newton and strict simple-coroot coefficient conditions factorwise.

#### T47 — Proper rational Levi has a Kottwitz kernel

**theorem; missing**. Lemma4.12.

For adjoint Qp-simple G and a proper rational parabolic with Levi M, pi1(M)_I^phi -> pi1(G)_I^phi is not injective.

Inputs: D05, D03.

Proof: Use rational invariants/coinvariants averaging and the nonzero positive central Levi coweight killed by G-coroots, then clear denominators.

#### T48 — Split torus proves rational coset infinitude

**theorem; missing**. Proposition4.11 proof (4.13),corrected.

If a nontrivial Qp-split torus S in a quasisplit adjoint Qp-simple G is used to test a compact open K, the uniformizer section lambda->lambda(p)K embeds an infinite cocharacter lattice in G(Qp)/K after the boundedness argument. This is a map of sets; G/K is not generally a group.

Inputs: D01.

Proof: From S(Qp)∩K⊆S(Zp), injectivity follows for uniformizer representatives. That inclusion alone does not define the printed quotient map S/S(Zp)->G/K.

#### T49 — Quasisplit component bijection forces HN-irreducibility

**theorem; missing**. Proposition4.11.

For D01 with G quasisplit, if the parahoric component Kottwitz map is bijective, then (b,mu) is HN-irreducible.

Inputs: T40, T41, T43, T44, T47, T48, T09.

Proof: Reduce to adjoint Qp-simple factors. A proper Levi piece would force the noninjective invariant fundamental-group map to be injective; in the central alternative an infinite rational coset set cannot biject with finite pi1(G)_I^phi.

#### D50 — Filtered isocrystal

**definition; planned**. §5.1.

For finite K/breve Qp, a filtered isocrystal is a finite-dimensional breve Qp-space with bijective phi-semilinear Frobenius and an exhaustive separated decreasing integer filtration on its K-base change. Morphisms commute with Frobenius and preserve filtration.

Existing owners: `PadicHodgeTheory:R06.2`.

Inputs: L50.

Use: §5.1 and5.8 — Crystalline representation supplier.

API:

- `GLX26.D50.construct` (constructor): Construct the finite-dimensional isocrystal and finite filtration.
- `GLX26.D50.characterise` (characterisation): Compute Hodge degree from graded dimensions and Newton degree from Frobenius slopes.
- `GLX26.D50.transport` (functoriality): Define tensors, duals and scalar extension with their induced filtrations.

Acceptance tests:

- `GLX26.D50.test1`: A rank-one slope m with one filtration jump m is weakly admissible.
- `GLX26.D50.test2`: The zero filtered isocrystal has both degrees zero.
- `GLX26.D50.test3`: Equality of total degrees alone does not imply weak admissibility in rank two.

#### D51 — Weak admissibility

**definition; planned**. §5.1.

For D50, weak admissibility requires equality of total Hodge and Newton degrees and the Hodge degree <= Newton degree inequality for every Frobenius-stable subobject with induced filtration.

Existing owners: `PadicHodgeTheory:R06.2`.

Inputs: D50.

Use: Theorem5.8(1) — Genericity lowers Hodge degrees of subobjects.

API:

- `GLX26.D51.construct` (constructor): Assemble the total equality and all subobject inequalities.
- `GLX26.D51.characterise` (characterisation): Check a faithful tensor realization with the theorem’s exact G-structure criterion.
- `GLX26.D51.transport` (functoriality): Preserve weak admissibility under the admissible tensor equivalence and allowed finite field extensions.

Acceptance tests:

- `GLX26.D51.test1`: Rank-one slope m and filtration jump m satisfy the criterion.
- `GLX26.D51.test2`: The direct sum of two weakly admissible objects is weakly admissible.
- `GLX26.D51.test3`: Slope-zero rank two with jumps 1,-1 and a Frobenius-stable positive line fails the subobject inequality.

#### T50 — Colmez–Fontaine equivalence

**theorem; planned**. §5.1.

Over finite K/breve Qp in the source setting, weakly admissible filtered isocrystals form the exact tensor category equivalent to crystalline Qp-representations via D_cris and V_cris. Preserve the coefficient, completeness and residue hypotheses in the original extension of the theorem.

Existing owners: `PadicHodgeTheory:R06.2`.

Inputs: D50, D51.

Proof: Construct the period-ring comparison and prove essential surjectivity; this is not supplied by the isocrystal carrier.

#### D52 — Admissible pair with reductive structure

**definition; missing**. §5.1 (5.1).

For D01 and finite K/breve Qp, a cocharacter mu_eta over K in {mu} defines (V,rho)->(V⊗breve Qp,rho(b)phi,Fil_mu_eta). The pair is admissible when this exact tensor functor lands in weakly admissible objects.

Inputs: D07, D51.

Use: Theorem5.8 — Connects the acceptable class to a chosen filtration.

API:

- `GLX26.D52.construct` (constructor): Construct the functor from each algebraic representation with its weight filtration.
- `GLX26.D52.characterise` (characterisation): Test admissibility with the original faithful-representation/tensor criterion.
- `GLX26.D52.transport` (functoriality): Transport simultaneously b and mu_eta under conjugacy and group maps.

Acceptance tests:

- `GLX26.D52.test1`: For Gm the condition equates the slope with the cocharacter weight.
- `GLX26.D52.test2`: The trivial bound and b=1 give the trivial filtered tensor functor.
- `GLX26.D52.test3`: A point of the flag variety can fail admissibility even when b lies in B(G,mu).

#### T51 — Triviality of the crystalline fiber-functor torsor

**theorem; missing**. §5.1;DOR11.4.3;Chen§3.2.

For an admissible pair D52 with [b] in B(G,{mu}), the Qp-fiber functor obtained through V_cris is isomorphic to the standard one. A choice produces a continuous G(Qp)-valued crystalline representation xi, unique up to G(Qp)-conjugacy.

Inputs: D52, T50.

Proof: Apply the fixed-bound torsor-triviality theorem; do not assume that every fiber functor is neutralized by an arbitrary choice.

#### D53 — Crystalline Mumford–Tate group

**definition; missing**. §5.1 Definition5.1 and (5.2).

For xi from T51, let H be the Zariski closure of its image and MT=H^0 as in GLX. The Tannakian group of the generated representation category is H. Comparing it with MT requires the connectedness justification or passage to the connected component; Chen3.2.2 defines the full H.

Inputs: T51.

Use: Theorem5.8 andProposition5.9 — The derived containment is a statement about the connected algebraic group.

API:

- `GLX26.D53.construct` (constructor): Construct the algebraic image closure and its identity component.
- `GLX26.D53.characterise` (characterisation): Describe the full closure by tensor automorphisms of the generated category.
- `GLX26.D53.transport` (functoriality): Compare under conjugacy and finite extension, retaining the possible component group.

Acceptance tests:

- `GLX26.D53.test1`: The trivial crystalline representation has trivial MT.
- `GLX26.D53.test2`: A crystalline character gives a torus or the trivial connected group.
- `GLX26.D53.test3`: For a general finite-image continuous representation the full closure need not equal its identity component; crystalline hypotheses must do the work.

#### T52 — Serre–Sen openness for crystalline image

**theorem; missing**. Theorem5.2;Chen3.2.1.

For xi as in T51, its image is open in the rational points of its Zariski closure; equivalently its intersection with the identity component is open there. In particular, if MT contains Gder, the image intersects Gder(Qp) in an open subgroup.

Inputs: D53.

Proof: Use the algebraicity of the p-adic Lie algebra of crystalline image and the Hodge–Tate cocharacter theorem; no such claim holds for every continuous representation.

#### D54 — Generated crystalline tensor category and finite-field fiber functor

**definition; missing**. §5.1;Chen3.3.1–3.3.3.

For D52 with b s-decent, form the tensor subcategory generated by its filtered isocrystals, closed under sums, tensors, duals and subquotients. The decent Frobenius supplies Chen’s fiber functor omega_s to Qp^s-vector spaces and its tensor automorphism group MT_cris,s.

Inputs: D09, D52, S01, S02.

Use: §5.3 — Transfers the derived containment from explicit invariant lines.

API:

- `GLX26.D54.construct` (constructor): Construct the generated subcategory and the finite-field fiber functor.
- `GLX26.D54.characterise` (characterisation): Identify omega_s on the input Rep(G) with ordinary scalar extension when b is decent.
- `GLX26.D54.transport` (functoriality): Compare the crystalline and etale fiber functors via period rings and their inner-form torsor.

Acceptance tests:

- `GLX26.D54.test1`: For a trivial representation both fiber functors are the trivial rank-one object.
- `GLX26.D54.test2`: Enlarging s compatibly base-changes the fiber functor.
- `GLX26.D54.test3`: An arbitrary nondecent b does not supply the asserted Qp^s realization without descent.

#### T53 — Inner-form comparison of crystalline and etale monodromy

**theorem; missing**. §5.1;Chen3.3.3.

Under D54, MT_cris,s and the full etale Tannakian group over Qp^s are inner forms, with the period-ring isomorphism of Chen3.3.3. Containment of the normal derived subgroup transfers through the compatible embedding into G.

Inputs: D54, S02.

Proof: Use the tensor-Isom torsor and preserve the ambient-group embedding; distinguish full group and identity component.

#### D55 — Filtration degree and decent invariant lines

**definition; missing**. §5.1 (5.3)–(5.5);Chen3.3.6.

For nonzero v in V⊗Qp Qp^s and a finite decreasing filtration from mu_eta, deg(v)=max{k:v in Fil^k}. Set d_s(v)=sum_(i=0)^(s-1)deg((rho(b)phi)^i v). The relevant nonzero vectors satisfy rho((s nu_b)(p))v=p^k v and d_s(v)=k.

Inputs: D09, D54.

Use: Theorem5.8(2) — Chevalley line criterion for the monodromy group.

API:

- `GLX26.D55.construct` (constructor): Construct degree on nonzero vectors, or use extended degree +infinity for zero.
- `GLX26.D55.characterise` (characterisation): Characterize the two equations defining the invariant-line tests.
- `GLX26.D55.transport` (functoriality): Compare degree under scalar multiplication and the cyclic Frobenius iterates.

Acceptance tests:

- `GLX26.D55.test1`: A rank-one slope m with jump m has d_s=s m and eigenvalue p^(s m).
- `GLX26.D55.test2`: Zero must be excluded or assigned +infinity explicitly.
- `GLX26.D55.test3`: Replacing the sum of s degrees by s times one degree fails when Frobenius permutes unequal jumps.

#### T54 — Chen invariant-line stabilizer criterion

**theorem; missing**. §5.1;Chen Proposition3.3.6(1)–(2).

Under D54, MT_cris,s is the subgroup of G_Qp^s stabilizing every line generated by a nonzero vector of D55, in every algebraic representation; tensor powers of a fixed faithful representation and its dual suffice in the source formulation.

Inputs: D55.

Proof: Classify rank-one objects after the Qp^s action and use Chevalley’s stabilizer theorem, strictness and Tannakian generation.

#### D56 — Generic filtration of a representation

**definition; missing**. §5.2 (5.6)–(5.9).

For a quasisplit reductive G over a characteristic-zero field K, a cocharacter class with finite reflex field E and V in Rep_K(G), intersect the mu-filtrations over Fl_mu(E), then intersect with V⊂V_E. The result is a G-stable decreasing filtration on V. E/K need not be Galois.

Use: Propositions5.6–5.7 — Computes the filtration degree at a generic point.

API:

- `GLX26.D56.construct` (constructor): Construct the intersection of all rational conjugate filtrations.
- `GLX26.D56.characterise` (characterisation): Characterize it as the largest G-subrepresentation inside the chosen filtration after base change.
- `GLX26.D56.transport` (functoriality): Compare conjugate bounds using embeddings of E in a common normal closure.

Acceptance tests:

- `GLX26.D56.test1`: For a split irreducible highest-weight representation, its sole jump is the lowest-weight pairing with mu.
- `GLX26.D56.test2`: The trivial representation has jump zero.
- `GLX26.D56.test3`: For Res_(Q(cuberoot2)/Q) Gm the reflex field can be nonnormal; Gal(E/K) does not enumerate all conjugates.

#### D57 — Generic flag point

**definition; missing**. Definition5.5.

For the flag variety Fl_mu over its reflex field E, a point Spec Kprime->Fl_mu is generic when its image is the scheme generic point. Kprime may be finite over breve Qp while having sufficient transcendence over the original reflex field.

Inputs: D56.

Use: Lemma5.10 andTheorem5.8 — Makes all subobject Hodge bounds minimal.

API:

- `GLX26.D57.construct` (constructor): Package a field-valued point with generic scheme image.
- `GLX26.D57.characterise` (characterisation): Test vanishing of a section at it by vanishing at the generic point of the integral flag variety.
- `GLX26.D57.transport` (functoriality): Preserve genericity under the simultaneous conjugacy changes in Theorem5.8.

Acceptance tests:

- `GLX26.D57.test1`: A point with algebraically independent affine big-cell coordinates is generic.
- `GLX26.D57.test2`: A zero-dimensional torus flag has its sole generic point.
- `GLX26.D57.test3`: A closed point over a finite extension of the original finite reflex field is not generic on a positive-dimensional flag.

#### T55 — Generic point realizes the generic filtration

**theorem; missing**. Proposition5.6.

For D56–D57, V intersect Fil_(mu_eta)^k(V_Kprime) equals the generic filtration step on V.

Inputs: D56, D57.

Proof: Use the filtered bundles on the flag variety: the vanishing locus of a constant section in a quotient is closed. The generic point detects it, and rational points of the quasisplit flag are dense.

#### D58 — Galois highest-weight orbit decomposition

**definition; missing**. §5.2 (5.15)–(5.17).

For quasisplit reductive G/K in characteristic zero, irreducible K-representations are indexed by Gamma_K-orbits of absolute dominant weights; their geometric constituents occur with multiplicity one. A general V decomposes into the corresponding isotypic pieces. Over E refine each full orbit into DISTINCT Gamma_E-orbits.

Inputs: D56, L08, L09, L17.

Use: Proposition5.7 and5.8 — Corrects the nonnormal-reflex and repeated-orbit formulas.

API:

- `GLX26.D58.construct` (constructor): Construct the full Galois orbit and its isotypic summand.
- `GLX26.D58.characterise` (characterisation): Form the rational orbit average and the distinct refined orbit decomposition.
- `GLX26.D58.transport` (functoriality): Compare field extension using subgroup orbits, without assuming Gamma_E is normal.

Acceptance tests:

- `GLX26.D58.test1`: An irreducible representation of a split group has a singleton Galois orbit.
- `GLX26.D58.test2`: The trivial representation has one constituent under every extension.
- `GLX26.D58.test3`: Summing one identical component for every automorphism of a nontrivial E/K counts it repeatedly.

#### T56 — Generic filtration highest-weight threshold

**theorem; missing**. Proposition5.7,corrected (5.18)–(5.19).

For D56 and a full Gamma_K orbit O of dominant weights, its isotypic summand is in generic Fil^k iff the lowest-weight pairing with mu is at least k for EVERY distinct Gamma_E-orbit Oprime in O; equivalently use the orbit average of Oprime since mu is Gamma_E-invariant.

Inputs: D58.

Proof: Decompose the representation over E into distinct refined isotypic pieces and test the lowest weight in each. E06 rejects indexing only by Aut(E/K) for nonnormal reflex E.

#### T57 — Generic degree bounded by orbit average

**theorem; missing**. §5.3 (5.23)–(5.29),corrected.

For the setup of5.8, a nonzero isotypic component v_O has generic degree equal to the minimum of the refined lowest-weight pairings. This minimum is at most their correctly weighted full-orbit average, equal to <w0 lambda, inertia-average(mu)>.

Inputs: T56, D55.

Proof: Use each distinct refined orbit exactly once and weight its average by orbit size; the underlined mu in (5.28) is printed correctly.

#### T58 — Frobenius-summed Hodge bound

**theorem; missing**. §5.3 (5.30)–(5.36).

For the decent setup of5.8 and every highest weight lambda occurring in v, d_s(v) <= s <w0 lambda,mu^diamond>.

Inputs: T57, D09.

Proof: Frobenius permutes the highest-weight orbits by phi0; sum a full period and reindex inverse powers. Do not mistake a sum reindexing for an individual pairing identity.

#### T59 — Newton lowest-weight inequality

**theorem; missing**. §5.3 (5.37)–(5.39).

For v satisfying the Newton eigenvalue equation of D55, every occurring weight chi has <chi,nu_b>=k/s. Dominance of nu and the lowest-weight bound give <w0 lambda,nu_b> <= k/s.

Inputs: D55, D58.

Proof: Decompose into torus weight spaces and use equality of the eigenvalues p^k over characteristic zero.

#### T60 — HN positivity forces central highest weights

**theorem; missing**. §5.3 end ofTheorem5.8.

If nu<=mu^diamond is HN-irreducible and an antidominant weight eta satisfies <eta,nu> <= <eta,mu^diamond>, then eta pairs to zero with every simple coroot. For eta=w0 lambda this makes the corresponding irreducible representation trivial on Gder.

Inputs: D08, T58, T59.

Proof: Each simple-coroot pairing is nonpositive and the coefficient in the HN difference is strictly positive; their sum can be nonnegative only if each vanishes.

#### T61 — Generic weak admissibility

**theorem; missing**. Theorem5.8(1).

For arbitrary reductive G/Qp, b decent with [b] in B(G,{mu}), and a generic mu_eta over finite Kprime/breve Qp, the pair (b,mu_eta) is admissible.

Inputs: D57, D51.

Proof: Follow Chen5.0.6(1): nonempty weakly admissible locus and upper semicontinuity minimize each subobject Hodge degree at the generic point. Replace the unramified existence input with DOR9.5.10.

#### T62 — Generic crystalline derived monodromy

**theorem; missing**. Theorem5.8(2).

Under T61, if (b,{mu}) is HN-irreducible then MT_(b,mu_eta) contains Gder.

Inputs: T61, T54, T53, T58, T59, T60.

Proof: Every defining invariant line is fixed pointwise by Gder using the lowest-weight inequalities; transfer the inclusion through the inner-form comparison. E06/E07 require corrected orbit indexing.

#### T63 — Infinite transcendence of the completed unramified field

**theorem; missing**. Lemma5.10 input;Chen Proposition2.0.3.

breve Qp has infinite transcendence degree over Qp.

Proof: Chen constructs Witt series with sufficiently separated finite-field generator degrees; complete its algebraic-independence proof rather than assuming cardinality suffices.

#### T64 — Generic flags over finite extensions of breve Qp

**theorem; missing**. Lemma5.10.

For a cocharacter flag variety as in §5, there exists a finite extension K/breve Qp with a K-point mapping to its generic point over the original reflex field.

Inputs: D57, T63.

Proof: Choose etale affine coordinates on a nonempty flag open and algebraically independent parameters in breve Qp; a nonempty etale fiber yields a finite extension. Preserve the nonempty image condition.

#### T65 — Existence of open derived crystalline image

**theorem; missing**. Proposition5.9.

For arbitrary G/Qp and an HN-irreducible acceptable pair, there exists finite K/breve Qp and a crystalline xi:Gamma_K->G(Qp) with invariants (b,{mu}) such that xi(Gamma_K) intersect Gder(Qp) is open in Gder(Qp).

Inputs: T62, T64, T52, T37.

Proof: Choose a generic admissible flag, use the classical BB bijection to a period point, and apply Serre–Sen openness.

#### T66 — Quasisplit converse to generic derived monodromy

**theorem; missing**. Proposition5.11.

For quasisplit G and the generic admissible pair of §5, if MT contains Gder then (b,{mu}) is HN-irreducible.

Inputs: T52, M01.

Proof: Apply the completed equivalence (4)=>(3) in Theorem6.1. This corollary must come AFTER the main theorem and cannot be an input to T62/T65.

Scope note: Place after M01. It is not an input to the forward generic-monodromy implication.

#### M01 — Quasisplit component and monodromy equivalences

**theorem; missing**. Theorem1.14(a)=6.1(a).

For D01 write (1) the Iwahori component Kottwitz map is bijective; (2) the map at the specified parahoric is bijective; (3) the pair is HN-irreducible; (4) some finite K/breve Qp has a crystalline xi of invariants (b,{mu}) whose image intersects Gder(Qp) openly; (5) the geometric infinite-level component set is a G°-torsor under its G(Qp) action. If G is quasisplit, all five conditions are equivalent.

Inputs: T49, T65, T80, T81, T86, T78.

Proof: Combine the separately proved implication lemmas, then descend through a z-extension. E01 andE08 remain proof gates, not counterexamples to the stated equivalence.

#### M02 — Main implications: (3)=>(4)=>(5)=>(1)=>(2)

**theorem; missing**. Theorem1.14(b,c)=6.1(b,c).

For D01 write (1) the Iwahori component Kottwitz map is bijective; (2) the map at the specified parahoric is bijective; (3) the pair is HN-irreducible; (4) some finite K/breve Qp has a crystalline xi of invariants (b,{mu}) whose image intersects Gder(Qp) openly; (5) the geometric infinite-level component set is a G°-torsor under its G(Qp) action. If G_ad has no anisotropic Qp-simple factor, (3)=>(4)=>(5)=>(1)=>(2) holds.

Inputs: T65, T86, T81, T80, T78.

Proof: Apply only the implication lemmas valid under the displayed group hypotheses.

#### M03 — Main implications: (5)=>(1)=>(2)

**theorem; missing**. Theorem1.14(b,c)=6.1(b,c).

For D01 write (1) the Iwahori component Kottwitz map is bijective; (2) the map at the specified parahoric is bijective; (3) the pair is HN-irreducible; (4) some finite K/breve Qp has a crystalline xi of invariants (b,{mu}) whose image intersects Gder(Qp) openly; (5) the geometric infinite-level component set is a G°-torsor under its G(Qp) action. If G is arbitrary, (5)=>(1)=>(2) holds.

Inputs: T81, T80, T78.

Proof: Apply only the implication lemmas valid under the displayed group hypotheses.

#### M04 — Main implications: (3)=>(4)

**theorem; missing**. Theorem1.14(b,c)=6.1(b,c).

For D01 write (1) the Iwahori component Kottwitz map is bijective; (2) the map at the specified parahoric is bijective; (3) the pair is HN-irreducible; (4) some finite K/breve Qp has a crystalline xi of invariants (b,{mu}) whose image intersects Gder(Qp) openly; (5) the geometric infinite-level component set is a G°-torsor under its G(Qp) action. If G is arbitrary, (3)=>(4) holds.

Inputs: T65.

Proof: Apply only the implication lemmas valid under the displayed group hypotheses.

#### M05 — Connected components of all parahoric ADLV

**theorem; missing**. Theorem1.2=6.2.

For every connected reductive G/Qp, every parahoric K and every acceptable HN-irreducible pair (b,{mu}), kappa induces a bijection pi0(X_mu^K(b)) -> c_(b,mu) pi1(G)_I^phi. No quasisplit, tame, minuscule or p>2 hypothesis is added.

Inputs: M02, T87, T09, T45, T46, T06.

Proof: Use z-extensions and products. The isotropic case follows the monodromy chain; the adjoint-anisotropic case uses the normal unique Iwahori and determinant trivialization separately.

#### M06 — Anisotropic converse fails

**theorem; missing**. §1.5 counterexample discussion.

For an anisotropic adjoint inner form G=GL_1(D) for a noncommutative central division algebra D, b=1 and mu=0, the component map can be bijective while HN-irreducibility fails, so the reverse implication (2)=>(3) is not claimed for arbitrary G.

Inputs: D08.

Proof: The unique parahoric quotient is measured by reduced-norm valuation; nu=mu=0 has no positive simple-coroot coefficients in the nontrivial absolute root system.

#### T70 — Torus infinite-level component torsor

**theorem; missing**. Proposition6.4(2).

For a torus T and [b] in B(T,{mu}), the geometric infinite-level local shtuka is a T(Qp)-torsor over Spd Cp, and its components are the same T(Qp)-torsor.

Inputs: D34, D14.

Proof: Use the one-point bounded torus period domain and the universal torsor; total disconnectedness identifies geometric components.

#### T71 — Torus finite-level component coset

**theorem; missing**. Proposition6.4(1),Lemma6.5.

For a torus with its unique connected parahoric Tpar and an acceptable pair, specialization identifies the finite-level component torsor T(Qp)/Tpar(Zp) with the ADLV Kottwitz coset c_(b,mu) pi1(T)_I^phi, equivariantly.

Inputs: T70, T32, D10, T72.

Proof: Smooth connected special fiber plus Lang and Hensel gives H1_et(Zp,Tpar)=0, allowing Frobenius invariants of the torus quotient.

#### T72 — Lang–Hensel parahoric torsor vanishing

**theorem; missing**. Lemma6.5 andProposition6.9.

For a smooth affine Zp-group scheme with connected special fiber, the etale torsors in the source situation are trivial over Zp: reduce by Hensel to the finite residue field and apply Lang. In particular the connected parahoric torus quotient commutes with Frobenius invariants.

Inputs: D01.

Proof: Keep smoothness and connected special fiber; a disconnected special fiber does not satisfy the same conclusion.

#### T73 — Adjoint invariance of bounded de Rham geometry

**theorem; missing**. Proposition6.6(1),Steps1–2.

For an ad-isomorphism with transported mu and a common reflex base, the closed de Rham Schubert diamonds identify, and their b-admissible opens identify.

Inputs: D12, D33, D36.

Proof: Use AGLR4.16 or the appropriate qcqs geometric-point criterion, then preserve basicness through the adjoint map. Properness and point-bijectivity alone need the diamond isomorphism hypotheses.

#### T74 — Adjoint contracted-product shtuka comparison

**theorem; missing**. Proposition6.6(1),Step3.

For T73, Sht_H is the contracted product Sht_G times^(G(Qp)) H(Qp), with the natural torsor actions.

Inputs: T73, D34.

Proof: Extend the universal torsor’s structure group; an equivariant morphism between torsors for the same group is an isomorphism.

#### T75 — Adjoint invariance of the geometric component torsor property

**theorem; missing**. Proposition6.6(2).

For an ad-isomorphism and the corresponding local data, pi0(Sht_G over Cp) is a G°-torsor iff pi0(Sht_H over Cp) is an H°-torsor.

Inputs: T74, T21, D14.

Proof: The printed proof assumes unconditionally that Gsc acts trivially and invokes Lemma3.2. Supply an independent two-direction argument; E08 gives a counterexample to the intermediate triviality claim.

#### T76 — Z-extension descent of component and HN conditions

**theorem; missing**. Proposition6.7 first reductions.

For a z-extension and lifted data, conditions (1),(2),(3) of M01 hold upstairs iff they hold downstairs.

Inputs: T07, T08, T09, T45.

Proof: Cartesian component square and surjective coset map give the first two equivalences; the adjoint coroot comparison gives the third.

#### T77 — Z-extension descent of crystalline openness

**theorem; missing**. Proposition6.7 crystalline step.

For the lifted data, condition (4) of M01 holds upstairs iff downstairs, after a finite extension containing the lifted reflex field when necessary.

Inputs: T73, T10, T51.

Proof: Lift the classical period point through the common admissible Grassmannian. Use open finite-index image of the finite central derived isogeny, not rational-point surjectivity.

#### T78 — Reduction of the main equivalences to simply connected derived group

**theorem; missing**. Proposition6.7.

For a z-extension, each of M01’s five conditions is equivalent upstairs and downstairs; thus the implication theorem reduces to Gder=Gsc, preserving quasisplitness and adjoint isotropy conditions.

Inputs: T76, T77, T75.

Proof: Combine the five distinct transports; the fifth remains gated by T75/E08.

#### T79 — Iwahori-to-parahoric ADLV surjectivity

**theorem; missing**. Theorem6.8.

For D01 the natural map X_mu^I(b)->X_mu^K(b) is surjective.

Inputs: T33, T30, D34.

Proof: The generic level map is finite etale surjective with finite fiber Kp/Ip. A lift of each specialization point gives surjectivity on the special fiber.

#### T80 — Iwahori component bijection descends to parahoric level

**theorem; missing**. §6.3.

For arbitrary D01, condition (1) implies condition (2) of M01.

Inputs: T79, T05, D10.

Proof: The level map surjects on components, and both affine flags have the same pi1(G)_I; injectivity at Iwahori level forces injectivity at K, with known coset surjectivity.

#### T81 — Infinite-level component torsor implies finite-level bijection

**theorem; missing**. Proposition6.9 andRemark6.10.

For arbitrary D01, condition (5) implies (1), and hence (2). After Gder=Gsc, det:I->Gab_par is surjective on Zp-points and pi1(G)=X_*(Gab); the component quotient becomes the torus parahoric quotient.

Inputs: T78, T71, T72, T21, T32.

Proof: Use exact Iwahori group schemes, Lang–Hensel and determinant equivariance. Compact-level component descent must use a correct restricted theorem.

#### T82 — Finite-field torsor component stabilizer is Galois image

**theorem; missing**. Lemma6.12 proof.

For a classical period point y over finite K/breve Qp, the stabilizer of a component of its G(Qp)-torsor is, up to conjugacy, the compact crystalline image xi_y(Gamma_K).

Inputs: D36, T21.

Proof: Trivialize after Cp; descend a closed compact Galois orbit and prove its connected-component characterization through the correct compact descent theorem.

#### T83 — Derived component stabilizers are open

**theorem; missing**. Lemma6.12.

Assume condition (4) over K and pass to any finite extension containing that point. For each component x of the whole infinite-level shtuka over this field, G_x intersect Gder(Qp) is open in Gder(Qp).

Inputs: T82, T35.

Proof: Use transitivity to map the crystalline torsor component into x; its open derived image is contained in the full stabilizer.

#### T84 — Finitely many sigma-centralizer orbits

**theorem; missing**. Lemma6.13 input;Hamacher–Viehmann Theorems1.1–1.2.

For bounded mixed-characteristic ADLV at Iwahori level in D01, the J_b(Qp)-orbit set of connected components is finite. The source separately uses local Noetherianity of its underlying topology.

Inputs: D11.

Proof: Import the original boundedness/finiteness theorem; this is not finiteness of the entire set of components.

#### T85 — Component-stabilizer normalizer has finite index

**theorem; missing**. Lemma6.13.

In the simply connected derived-group setting of6.7 and under crystalline openness, N_G(Qp)(G_x) has finite index in G(Qp). If every adjoint Qp-simple factor is isotropic it contains Gder(Qp).

Inputs: T83, T84, T35, T21, T10.

Proof: Commuting J_b and G actions and finitely many J_b orbits yield a surjection from finitely many compact Iwahori translates onto G/N. Prove N open using the center and an open derived subgroup, then compact-to-discrete gives finite index. Apply the isotropic simply connected finite-index theorem.

#### T86 — Open derived image gives the geometric component torsor

**theorem; missing**. Proposition6.11,Lemmas6.14–6.15.

If G_ad has only isotropic Qp-simple factors, condition (4) implies (5).

Inputs: T83, T85, T88, T89, T22, T70.

Proof: The derived stabilizer is open normal and hence the whole derived group; determinant gives the opposite inclusion. Descend across the finite-field system with a proved component-limit argument, not merely a point-space limit.

#### T87 — Anisotropic adjoint factor component calculation

**theorem; missing**. Proof6.2 pp857–858.

For D01 with Gder=Gsc and G_ad Qp-simple anisotropic, the unique Iwahori I is normal, contains Gder(Qp), and G(Qp)/I≅pi1(G)_I^phi≅Gab(Qp)/Gab_par(Zp). The finite-level period torsor is trivialized by determinant to the torus torsor; its component map is the Kottwitz coset bijection.

Inputs: T34, T71, T32, T72.

Proof: The building is a point. Use the normal-level action and equivariant determinant map to identify the torsor with the connected period domain times its discrete group, after a basepoint choice. This proof does not establish an unrestricted infinite-level G°-torsor.

#### T88 — No proper finite-index subgroup in the isotropic simply connected case

**theorem; missing**. Lemma6.13;Margulis II,5.1.

For semisimple simply connected G/Qp with only isotropic Qp-simple factors, G(Qp) has no proper open subgroup of finite index.

Inputs: D01.

Proof: Use the local isotropic generation theorem, with all simple factors covered; anisotropic compact groups are excluded.

#### T89 — No proper open normal subgroup in the isotropic simply connected case

**theorem; missing**. Lemma6.15,corrected.

For semisimple simply connected G/Qp with only isotropic Qp-simple factors, every open normal subgroup of G(Qp) equals the whole group.

Inputs: D01.

Proof: Reduce to simple factors; an open normal subgroup is unbounded, contains the subgroup generated by rational unipotent radicals, and equals G(Qp) by local Kneser–Tits. The word proper is needed in the negative wording.

#### D60 — Global stabilizer-parahoric Hodge datum

**definition; missing**. Assumption1.4.

For Corollaries1.5–1.10 fix a Hodge-type Shimura datum (G,X), p>2, G_Qp split over a tame extension, p not dividing |pi1(Gder)|, and Kp a stabilizer-parahoric, with the compatible Hodge embedding and integral models specified in§1.3.

Use: Corollaries1.5–1.10 — Prevents broadening the application hypotheses.

API:

- `GLX26.D60.construct` (constructor): Package each global and local hypothesis with the integral model.
- `GLX26.D60.characterise` (characterisation): Distinguish the connected parahoric equal to a pointwise facet stabilizer from a larger setwise fixer.
- `GLX26.D60.transport` (functoriality): Change the prime-to-p level through the prescribed tower.

Acceptance tests:

- `GLX26.D60.test1`: An eligible hyperspecial Hodge-type datum is included.
- `GLX26.D60.test2`: A torus has trivial derived fundamental group.
- `GLX26.D60.test3`: The local theorem allows p=2, but this global assumption does not.

#### D61 — Tensor-preserving rational quasi-isogeny group

**definition; missing**. §1.3 pp809–810;§6 p846.

For a special point x in either D60 or the PR global Hodge-type datum D62, I_x is the Q-subgroup of (End(A_x)⊗Q)^× preserving all prime-to-p etale tensors and the crystalline tensors in the contravariant Dieudonne module.

Use: Corollaries1.6,6.3 — Group acting in the isogeny-class quotient.

API:

- `GLX26.D61.construct` (constructor): Construct the simultaneous tensor stabilizer in rational automorphisms.
- `GLX26.D61.characterise` (characterisation): Compare its local realization with J_b and prime-to-p tensor automorphisms.
- `GLX26.D61.transport` (functoriality): Transport along a tensor-preserving quasi-isogeny.

Acceptance tests:

- `GLX26.D61.test1`: The identity preserves every tensor.
- `GLX26.D61.test2`: For a polarization tensor, the prescribed similitude convention determines the allowed stabilizer.
- `GLX26.D61.test3`: An arbitrary quasi-isogeny need not preserve all the chosen tensors.

#### A01 — Perfect tensor-compatible isogeny map

**theorem; missing**. Corollary1.5.

Under D60, for each special point x with its b, there is a unique morphism X_(phi mu)^K(b)->S_K,Fbarp^perf lifting the given Siegel isogeny map and preserving the specified crystalline tensors at every geometric point. It is equivariant for Phi(g)=(b phi)^r(g) and the stated geometric r-Frobenius on the target.

Inputs: M05, D60, D61.

Proof: Combine Zhou6.5,7.8 with the component theorem. Preserve the phi mu twist caused by contravariant Dieudonne conventions.

#### A02 — Injectivity of the isogeny-class quotient

**theorem; missing**. Corollary1.6(1).

Under D60 and the extra hypothesis that G_Qp is quasisplit, the isogeny map induces the injective map I_x(Q)\(X_(phi mu)^K(b)(Fbarp) times G(A_f^p))->S_K(Fbarp) at the prime-to-p tower level of Corollary1.6(1). At finite level include the quotient by K^p.

Inputs: A01, D61.

Proof: Use Zhou9.1 and retain all tensor and level compatibilities.

#### A03 — CM lift in every indicated isogeny class

**theorem; missing**. Corollary1.6(2).

Under D60 and quasisplit G_Qp, the isogeny class parametrized in A02 contains a point lifting to a special (CM) characteristic-zero point.

Inputs: A02.

Proof: Combine the component computation with Zhou9.4; do not assert that every special-fiber point itself has a CM lift.

#### A04 — He–Rapoport axioms for these integral models

**theorem; missing**. Corollary1.7.

Under D60 the He–Rapoport axioms of the cited stratification framework hold for S_K(G,X), with their actual level and Frobenius conventions.

Inputs: A01, M05.

Proof: Apply Zhou8.1(2). The individual axioms and their proofs remain an explicit recursive extraction gap, not an opaque implemented predicate.

Scope note: Source endpoint recorded faithfully, but the named original-source definitions and output diagram are not yet recursively split to declaration size. Partial status is mandatory.

#### A05 — Almost-product structure of Newton strata

**theorem; missing**. Corollary1.8.

Under D60, the Newton strata satisfy the almost-product theorem in Hamacher–Kim Theorem2 after the isogeny map of A01 verifies their AxiomA. Preserve the perfection, Igusa/Rapoport–Zink quotient and coefficient qualifications of that original theorem.

Inputs: A01.

Proof: This is a source-level endpoint; the exact original diagram and separate geometric outputs remain G08 and must be extracted before a closed blueprint is claimed.

Scope note: Source endpoint recorded faithfully, but the named original-source definitions and output diagram are not yet recursively split to declaration size. Partial status is mandatory.

#### A06 — Normal closure and Siegel closed immersion

**theorem; missing**. Corollary1.9.

Under D60 and quasisplit G_Qp, the closure model S_K(G,X)^minus is normal, so normalization is unnecessary and the displayed finite Hodge embedding map to the integral Siegel model is a closed immersion.

Inputs: A01, M05.

Proof: Use Xu Main Theorem with the component theorem replacing its residually-split input. Preserve the chosen embedding/model construction.

#### A07 — Quasiaffine EKOR strata

**theorem; missing**. Corollary1.10.

Under D60, every EKOR stratum in the special fiber of the integral model is quasiaffine.

Inputs: A04.

Proof: Apply Shen–Yu–Zhang TheoremC after verifying He–Rapoport axioms; original strata definitions and theorem qualifications remain G08.

Scope note: Source endpoint recorded faithfully, but the named original-source definitions and output diagram are not yet recursively split to declaration size. Partial status is mandatory.

#### D62 — Global Hodge-type Rapoport–Zink comparison datum

**definition; missing**. §6 beforeCorollary6.3.

For Corollary6.3 use a tuple (p,G,X,K) of global Hodge type in Pappas–Rapoport§1.3, its model S_K, algebraically closed residue k, x0 in S_K(k), connected parahoric group scheme and the dilated Hodge embedding of§4.5.2. Let RZ_G,mu,x0 be their formal scheme and c:RZ^diamond->M_int the comparison.

Use: Corollary6.3 — Separate global application context.

API:

- `GLX26.D62.construct` (constructor): Construct the PR formal RZ space and its comparison with integral shtukas.
- `GLX26.D62.characterise` (characterisation): Identify the open-closed immersion and the special-point surjectivity criterion for c to be an isomorphism.
- `GLX26.D62.transport` (functoriality): Compare Hodge embeddings and prime-to-p levels within PR’s hypotheses.

Acceptance tests:

- `GLX26.D62.test1`: The Siegel case uses the classical p-divisible-group RZ moduli.
- `GLX26.D62.test2`: The base special point supplies a nonempty formal component.
- `GLX26.D62.test3`: Do not substitute Assumption1.4 for the distinct PR global Hodge-type hypotheses without checking them.

Scope note: Source endpoint recorded faithfully, but the named original-source definitions and output diagram are not yet recursively split to declaration size. Partial status is mandatory.

#### A08 — PR uniformization condition from Hecke orbits

**theorem; missing**. Corollary6.3 first claim.

For D62, the comparison c is surjective on geometric special points and hence an isomorphism of v-sheaves.

Inputs: D62, T36.

Proof: Lift x0 to a finite extension by flatness, use Serre–Tate to obtain an RZ generic point, and use its Hecke orbit meeting every component together with the open-closed comparison. E01/T35 remain proof gates.

#### A09 — Formal representability of integral local shtukas in global Hodge type

**theorem; missing**. Corollary1.12=6.3 second claim.

For D62, M_int is represented by the formal scheme identified through A08 with RZ_G,mu,x0.

Inputs: A08.

Proof: Transport the known formal representative through the comparison isomorphism; no all-data formal representability assertion is made.

#### A10 — Isogeny-class p-adic uniformization

**theorem; missing**. Corollary1.12=6.3 (6.2).

For D62 and A09, the map I_x0(Q)\(M_G,b,mu times G(A_f^p)/K^p) -> (S_K completed-basechanged to O_breveE) completed along the isogeny class of x0 is the PR4.10.6 uniformization isomorphism of O_breveE-formal schemes, with the precise completion interpretation required by Remark1.13 and RZ6.23.

Inputs: A08, A09, D61.

Proof: Apply PR4.10.6 after U_x0. Formal completions, quotient existence and the PEL comparison interpretation remain separate supplier obligations G08.

Scope note: Source endpoint recorded faithfully, but the named original-source definitions and output diagram are not yet recursively split to declaration size. Partial status is mandatory.

#### S01 — Higher-rank Dieudonne–Manin classification

**theorem; planned**. §5.1 prerequisite.

Over the algebraically closed residue base of D01, finite-dimensional isocrystals admit their rational-slope decomposition and classification, with the stated Hom and endomorphism division-algebra descriptions. The pin only supplies the carrier and narrower rank-one results.

Existing owners: `VectorBundlesAndIsocrystals:VB0`.

Inputs: L50.

Proof: Import the shared isocrystal classification before decent finite-field fiber functors.

#### S02 — Neutral Tannakian reconstruction and fiber-functor twisting

**theorem; planned**. §5.1 prerequisite.

For the neutral rigid exact tensor categories used in§5 over characteristic-zero fields, reconstruct the affine group and its representation equivalence; tensor-Isom fiber functors form the relevant torsors and compare the groups by inner forms.

Existing owners: `MotivesAndAlgebraicCycles:MC.6`.

Inputs: L47.

Proof: The pinned known-Hopf-algebra comparison is only one input, not neutral reconstruction from an arbitrary category.

### Reading and pinned baseline

- Published PDF1–57,printed805–861: all main text,proofs,footnotes,acknowledgments and references.
- arXivv3 targeted PDF9,16–17: G° description andLemma3.2; not fully read.
- Scholze ECDv1 PDF51,55–56,67–72: quotient and limit statements.
- Gleason Specialization publishedPDF38–44,50–56: formal notions,smelted/rich pairs,tubes and4.55.
- Chen2014 PDF13,19–21,23–24,29–32: targeted generic and monodromy arguments;13 begins but does not finish transcendence proof.
- Gleason current author GeomConn.pdf PDF17,34–35:2.76–2.77 andsource-version comparison.

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Atlas/input baseline: `9b0a683c1de906f88d584df01a647d51d5afeb6f`. The JSON preserves file digests and exact declaration snippets. Reviewed audit entries were inspected where available; missing entries are explicitly recorded and do not prove absence.

The narrow credits include Witt vectors, the actual isocrystal carrier, connected-component quotient and functorial map, algebraic group/torus and character–cocharacter infrastructure, scheme/fppf carriers and the known-Hopf Tannaka comparison. The broad missing geometry is not certified by these algebraic prototypes. No full higher-rank isocrystal classification, arbitrary neutral Tannaka reconstruction, diamond geometry or crystalline image theorem is credited at the pins.

- [https://arxiv.org/pdf/2208.07195v3](https://arxiv.org/pdf/2208.07195v3): 56 PDF pages; SHA256 `d2249ddbe1ae2f4728000d27846d396adffc97b2f8b7b1c82c5d2701153fcb12`. Download is not a claim of full reading; the ranges above control coverage.
- [https://smf.emath.fr/system/files/2017-08/ens_ann-sc_47_723-764.pdf](https://smf.emath.fr/system/files/2017-08/ens_ann-sc_47_723-764.pdf): 43 PDF pages; SHA256 `7f0a33b3659ba049aadfeb571e150ae80a95a53e9cd3731cfbc7242600619698`. Download is not a claim of full reading; the ranges above control coverage.
- [https://ianandreigf.github.io/Website/GeomConn.pdf](https://ianandreigf.github.io/Website/GeomConn.pdf): 52 PDF pages; SHA256 `f4d60f22ac55ed41f76853c31e30b54410d026dd886c5e05f78bd45687e7838c`. Download is not a claim of full reading; the ranges above control coverage.
- [https://link.springer.com/content/pdf/10.1007/s00208-024-02952-3.pdf](https://link.springer.com/content/pdf/10.1007/s00208-024-02952-3.pdf): 69 PDF pages; SHA256 `ea9ffc7b7716fef590a2fabeb4abcea978ecc0f7cd9a9c5caa0968e6b0d7291b`. Download is not a claim of full reading; the ranges above control coverage.
- [https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf): 57 PDF pages; SHA256 `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485`. Download is not a claim of full reading; the ranges above control coverage.
- [https://arxiv.org/pdf/1709.07343v1](https://arxiv.org/pdf/1709.07343v1): 154 PDF pages; SHA256 `5dea07bbb81cc6d148168f22af040e2b7e635bbae70421a122281d4f5775ee38`. Download is not a claim of full reading; the ranges above control coverage.

### Validation and remaining work

- **dense_integer_orbits**: Integers surject on every residue quotient Z/p^n, p=2,3,5 and1<=n<=5; thus Z is dense in Zp. Infinite Zp/Z has multiple dense orbits and an indiscrete quotient. Diagnostic only; the infinite topological argument is in the report.
- **anisotropic_abelian_quotient**: The residue norm-one group has4elements, and i has order4. The explicit division-algebra norm gives a homomorphism from SL1(D) onto this nontrivial abelian group, whereas G°=1. Exact finite-field computation plus separate valuation proof in report.
- **nonnormal_reflex_field**: For E=Q(cuberoot2), the full3weight orbit splits into1+2under Gamma_E but Aut(E/Q)=1. The printed test at lambda0 gives1 while the required minimum is0. Exact permutation-orbit computation; torus realization explained in report.
- **repeated_isotypic_component**: For a nontrivial quadratic reflex field and the trivial representation, (5.29) sums v+v=2v, not v. Summation must run over distinct refined orbits. Exact rational computation.
- **torus_quotient_not_well_defined**: For g=(1,1/5;0,1), the upper-right entry of g^-1 diag(2,1/2)g is3/10, nonintegral at5. Two representatives of the same S/S(Z5) class yield different G/K cosets. Exact matrix arithmetic with valuation interpretation.
- **hn_strictness**: For mu=(1,0), basic nu=(1/2,1/2), the simple-coroot coefficient is1/2. For nu=mu it is0, so strict irreducibility fails. Allowing M=G in decomposability always admits the full cone. Exact GL2 root-coordinate computation.
- **antidominant_hn_inequality**: For sampled positive coroot coefficients and nonpositive weight pairings, a nonnegative product forces the weight pairing zero; the report supplies the coordinatewise general argument. Finite exact checks of the scalar sign step, not a general proof.
- **torus_kottwitz_exactness**: For SL2 the torus valuation quotient is Z while pi1(SL2)=0; p in T(L) maps to0 but is not in T(O_L). This contradicts the kernel in (3.23). Symbolic exact-lattice check.
- **regular_derived_action**: For SL2,b=1,mu=0 the geometric period domain is one point and Sht∞ is the constant SL2(Qp)-torsor. Left/right regular action is nontrivial on its discrete component set; this rejects the unconditional premise of6.6(2). Mathematical degenerate-case check.

The nine diagnostics include exact finite-field, permutation, rational-matrix and sign computations, plus explicitly identified mathematical degenerate-case checks. The finite shadows of the dense-action example are not presented as a proof of the infinite topological counterexample; its full argument appears in E01. No Lean file was supplied or compiled.

- **G01 — Declaration and recursive source closure**: All main57pages were read and inventoried. Recursive suppliers and several bundled auxiliary definitions still need declaration-sized splitting; no finite inventory here is certified exhaustive.
- **G02 — Correct component descent**: Repair E01 for the actual locally spatial noncompact G(Qp) torsors, compact parahoric quotients and compact Galois descent. Then prove the component-limit argument in6.11. Do not use the false universal lemma.
- **G03 — Integral v-sheaf foundations**: Complete the formal-thickening functor, reduction adjunction, formal neighborhoods and their descent. Gleason publishedPDF38–44 and50–56 were read, not the entire69-page paper.
- **G04 — Geometric original suppliers**: Read and split AGLR, Gleason–Lourenco period connectedness/tubes and Gleason’s full local-model correspondence; targeted original readings verify key contracts but not their recursive closure.
- **G05 — Generic filtration correction**: Prove the nonnormal-reflex-field corrected orbit formula T56 and the weighted orbit estimate; E06/E07 invalidate literal use of5.7/5.29. Highest-weight descent and invariant-line reconstruction need full source decomposition.
- **G06 — Crystalline Tannakian closure**: Chen defines the full Zariski closure, GLX its identity component. Supply the exact connectedness argument or take identity components explicitly; complete finite-field fiber functors, the original Serre/Sen theorem, Colmez–Fontaine/DOR hypotheses and generic transcendence proof.
- **G07 — Adjoint torsor property and local generation**: Repair the two-direction6.6(2) proof E08 without assuming derived-cover triviality. Check the local Kneser–Tits/Margulis and central-isogeny open-image sources, and the normalizer-open argument before compact-to-discrete finiteness.
- **G08 — Global application closure**: Extract Zhou6.5/7.8/8.1/9.1/9.4, He–Rapoport axioms, Hamacher–Kim Theorem2/AxiomA and its exact almost-product diagram, Shen–Yu–Zhang EKOR definitions/TheoremC, Xu closure theorem, and PR global-Hodge definitions/4.10.6 plus RZ6.23 completion interpretation. These contracts are not a complete global blueprint.
- **G09 — Independent source-issue review**: All sourceIssues are worker findings only. Review the dense-action diamond, anisotropic norm-one example, nonnormal torus and adjoint descent gap at the exact source pages before promoting anything to confirmed errata.
- **G10 — Ownership and Lean prototyping**: Routes are proposed for review; candidate IDs are not existing stage IDs. This paper issue supplies no Lean file and claims no compilation or formalization. A later design must produce the suggested declarations, APIs, genuine Lean examples and planets.

### Original-source queue

- [Gleason, Specialization maps for Scholze’s category of diamonds (2025)](https://doi.org/10.1007/s00208-024-02952-3): Reduction, formalization, kimberlites and component comparison; targeted original sections read, full recursive closure open.
- [Gleason, On the geometric connected components of moduli spaces of p-adic shtukas and local Shimura varieties](https://ianandreigf.github.io/Website/GeomConn.pdf): Integral shtuka richness and the positive-Witt-loop local-model correspondence; targeted current author version read.
- [Gleason–Lourenco, Tubular neighborhoods of local models](https://arxiv.org/abs/2204.05526): All-parahoric connected tubes, including the small-p completion of minuscule normality.
- [Gleason–Lourenco, On the connectedness of p-adic period domains](https://arxiv.org/abs/2210.08625): Geometric connectedness and density of the admissible locus.
- [Anschutz–Gleason–Lourenco–Richarz, On the p-adic theory of local models](https://arxiv.org/abs/2201.01234): Integral local models, functoriality and adjoint Schubert comparison.
- [Chen, Composantes connexes geometriques de la tour des espaces de modules de groupes p-divisibles (2014)](https://doi.org/10.24033/asens.2225): Generic filtration, decent fiber functors and invariant-line monodromy; targeted sections read, no unramified hypothesis silently generalized.
- [Dat–Orlik–Rapoport, Period Domains over Finite and p-Adic Fields](https://www.cambridge.org/core/books/period-domains-over-finite-and-padic-fields/A16137C27711D13349ABAE20C10B9CBA): Nonempty weakly admissible locus9.5.10 and fiber-functor triviality11.4.3 must be read at source.
- [Scholze, Etale cohomology of diamonds, v1 (2017)](https://arxiv.org/abs/1709.07343v1): Original quotient and inverse-limit statements checked at11.12 and12.7–12.17; restricted component replacement still needed.
- [Gortz–He–Nie, Fully Hodge–Newton decomposable Shimura varieties](https://arxiv.org/abs/1610.05381): Proper-Levi decomposition, stable parabolics and indecomposable alternatives.
- [Hamacher–Viehmann, Finiteness properties of affine Deligne–Lusztig varieties](https://arxiv.org/abs/1902.07752): Local Noetherianity and finite J_b orbit set, not finitely many components outright.
- [Zhou, Mod p isogeny classes on Shimura varieties with parahoric level structure](https://arxiv.org/abs/1707.09685): Rational Kottwitz surjectivity, HN reductions and tensor-compatible global isogeny/CM applications.
- [Pappas–Rapoport, On integral local Shimura varieties](https://arxiv.org/abs/2204.02829): Adjoint component Cartesian theorem and integral comparison.
- [Pappas–Rapoport, p-adic shtukas and the theory of global and local Shimura varieties](https://arxiv.org/abs/2106.08270): Global Hodge-type tuple, U_x0 and conditional formal uniformization.
- [Hamacher–Kim, l-adic etale cohomology of Shimura varieties of Hodge type with non-trivial coefficients](https://arxiv.org/abs/1711.07123): Exact almost-product theorem and AxiomA; original diagram not yet extracted.
- [Shen–Yu–Zhang, EKOR strata for Shimura varieties with parahoric level structure](https://arxiv.org/abs/1910.07785): EKOR definitions and quasiaffinity theorem.
- [Kaletha–Prasad, Bruhat–Tits Theory—A New Approach](https://doi.org/10.1017/9781108933049): Parahoric extension, normalizer boundedness, anisotropic building and component subgroup.
- [Prasad–Raghunathan, On the Kneser–Tits problem](https://doi.org/10.1007/BF02567402): Local unipotent generation under isotropic simply connected hypotheses; bibliographic DOI verified through Crossref, original proof not read.
