# PAPER-IYENGAR-KHARE-MANNING-24: Iyengar–Khare–Manning (2024), congruence modules in higher codimension

Srikanth B. Iyengar, Chandrashekhar B. Khare and Jeffrey Manning, *Congruence modules and the Wiles–Lenstra–Diamond numerical criterion in higher codimensions*, Inventiones mathematicae 238 (2024), no. 3, 769–864, [doi:10.1007/s00222-024-01292-y](https://doi.org/10.1007/s00222-024-01292-y), arXiv:2206.08212.

Job PAPER-IYENGAR-KHARE-MANNING-24 (issue #1222), Claude Code, session cc-72825f.

## The version read

The published article is closed access and was not read. The whole of arXiv v3 was read (29 September 2024, 84 pages; its arXiv comment says the article will appear in Inventiones), with every displayed formula that an item or a recorded mistake depends on checked on the rendered page. The Crossref record of the published article lists the same 57 references as v3, renumbered: published [3], [4], [5] are v3 [4], [5], [3], and the pairs [10]/[11] and [24]/[25] are swapped. This extraction cites the v3 numbers. arXiv v1 (June 2022) and v2 (November 2022) were searched for the history of each mistake recorded below. Hashes and dates are in the result file.

## What the paper proves

Let O be a discrete valuation ring with uniformizer ϖ. The paper's objects are pairs (A, λ) where A is a complete noetherian local ring and λ: A → O is a surjection whose kernel p_A is a prime at which A is regular. The height c of p_A is the *codimension*; these pairs form the category C_O(c). The classical theory of Wiles, Lenstra and Diamond is the case c = 0. There A is finite over O, and a ring map R → T onto a Hecke algebra is shown to be an isomorphism of complete intersections by comparing two numbers:

- the length of the cotangent module Φ = p/p²;
- the length of the congruence module O/λ(Ann p).

Patching in positive defect produces rings R∞ with c > 0. The Calegari–Geraghty setting of GL₂ over a field with complex places, or of weight-one forms, is an example. The paper extends the numerical criterion to every c:

- **Definitions.** Set F^i_A(M) := Ext^i_A(O, M)^tf and Φ_A := tors(p_A/p_A²). The *congruence module* is Ψ_A(M) := Coker(F^c_A(M) → F^c_A(M/p_A M)). The *Wiles defect* is δ_A(M) := rank_{A_p}(M_p) · length Φ_A − length Ψ_A(M) (§2). Ψ_A := Ψ_A(A) is torsion exactly when A is regular at p_A (Theorem 2.5, which rests on Lescot's criterion).
- **Theorem D (6.8).** For A in C_O(c), the torsion-free quotient of the Yoneda algebra Ext*_A(O, O) is the exterior algebra on Hom_O(p_A/p_A², O). This is an integral form of Serre's theorem for regular rings, proved with Tate's acyclic closures and Γ-derivations.
- **Theorem E (7.4).** Invariance of domain: Ψ_A(M) ≅ Ψ_B(M) for a surjection A → B in C_O(c) and a B-module M of depth ≥ c. Its closing clause about defects needs a rank hypothesis (E4 below).
- **Theorem C (8.2).** Deformation invariance: δ_A(M) = δ_{A/fA}(M/fM) for f ∈ p_A ∖ p_A^(2) that is M-regular. This reduces everything to c = 0.
- **Theorems A, B (9.6, 9.2), 9.5 and Corollary 8.3.** The numerical criteria. δ_A(M) ≥ 0. When depth M ≥ c + 1, δ_A(M) = 0 if and only if A is a complete intersection and M ≅ A^µ ⊕ W with W_p = 0. For A Gorenstein and M maximal Cohen–Macaulay of rank µ ≠ 0 at p_A, δ_A(M) = µ · δ_A(A) if and only if M ≅ A^µ ⊕ W with W_p = 0. Theorem J says that the defect of M∞/(y) over R∞/(y), for an M∞-regular sequence y ⊆ p, does not depend on y.
- **Part 2.** An account of ultrapatching of perfect complexes with derived Hecke actions (Theorem 10.6). The new result is that patching commutes with duality: P(C†) ≅ P(C)^∨ (Theorem 11.3).
- **Part 3.** Integral non-minimal R = T theorems in positive defect. The proof follows Wiles and Diamond, with the induction on the level carried out on the patched modules M_{Σ,∞}. Level raising (Ihara's lemma and self-duality) shows that the congruence module grows by µ·ν(λ(B_v)) at each new prime. Φ grows by the same amount, so δ = 0, and Theorems 9.2 and 9.5 give a free summand (Theorem 15.4). The two cases are:
  - Theorem F (PGL₂ over any number field, assuming Conjectures A–D). Theorem G is the Bianchi case: F imaginary quadratic, ℓ > 20, assuming Conjecture B only, since C and D are known there and Conjecture A is taken from Newton–Thorne (but see E64).
  - Theorems H and I (14.9, 14.10): unconditionally, R = T for weight-one forms on Shimura curves over Q, and a torsion Jacquet–Langlands correspondence comparing the weight-one Hecke algebras of Shimura and modular curves.

## What the libraries and the atlas already have

The extraction has 181 items. Four are in the libraries, 36 are planned in atlas layers, and 141 are missing. Every item was checked against Mathlib 082e2d3 and Tau Ceti f790474 (statements read in the Lean files) and against the atlas at tauceti-explorer 313b2ed.

**In the libraries.** Only the ground floor is in Mathlib:
- torsion submodules and freeness of torsion-free modules over a DVR;
- `Ideal.height` and `IsLocalization.AtPrime.ringKrullDim_eq_height`;
- `IsRegularLocalRing`;
- the cotangent module `Ideal.Cotangent`.

Mathlib also has pieces that are cited in the notes but do not make an item "library": Ext over `ModuleCat`, `DerivedCategory`, `ExteriorAlgebra`, an ungraded `DividedPowerAlgebra`, regular sequences with Rees's theorem, `Ideal.subset_union_prime`, `Algebra.H1Cotangent`, Hecke coset modules and `Filter.Germ`. Neither library has depth, Cohen–Macaulay or Gorenstein rings, dualizing complexes, the Koszul complex, symbolic powers, multiplicity, RHom on D(A), or anything on congruence modules, patching or deformation rings.

**Planned in the atlas.** The 36 planned items sit in the following layers:
- *DeformationAndDerivedPatchingAlgebra.*
  - R03.3: grade, Auslander–Buchsbaum, complete intersections, height and grade in O[[t]], associated primes of Hom.
  - R03.1–R03.2: completed tensor products and Schlessinger, for the global deformation rings.
  - P7: derived functors and minimal complexes. Tau Ceti's DGAInfinity layer 5 and StablePeriodicCurved layer 2 share the derived functors.
  - P8: the rings Λ_n and R_n, patching systems, framing, ultraproducts, limits of perfect complexes, the patched complex and rings, and Theorem 10.6. Its ACC+ §6.4 decomposition node constructs C∞.
  - P9: derived actions and Lemma 10.7, whose node is Calegari–Geraghty Lemma 6.2.
- *LocalGaloisDeformationRings* R08.1, R08.2, R08.4 and L7: framed, flat, unramified, minimally ramified, Steinberg and unipotent rings, and Proposition 12.1.
- *GlobalGaloisDeformations* R04.1–R04.6: the global functors, representability, Taylor–Wiles primes, Proposition 12.3 and Proposition 15.2. The standing global setup also uses ArithmeticGaloisRepresentations R01.1 and R01.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.
- *ArithmeticLocallySymmetricSpaces* ALS.0–ALS.5, with AdelicAlgebraicGroups AA.4, SmoothRepresentationsOfLocalGroups SR.1, IntegralHeckeAndGaloisDeterminants IHG.2–IHG.3 and Tau Ceti AlgebraicTopology stages 5–6: the manifolds Y_K, double-coset operators on complexes, Hecke algebras, and Verdier duality (Proposition 13.6).
- *HilbertModularVarietiesAndShimuraCurves* R18.1–R18.2, with PELModuli M2: the Shimura curves.
- *GL2AutomorphicRepresentationsAndTransfer* R17.3, with AutomorphicBundles B4: classical Jacquet–Langlands.
- *SerreWeightAndLevelOptimisation* R20.2, R20.3 and R20.5: level and weight optimisation.
- *DerivedDeRhamCohomology* DD.0: André–Quillen homology.

**Missing.** Nothing in the atlas plans any of the following:
- the congruence module Ψ_A(M), in any codimension, or the Wiles defect;
- the Wiles–Lenstra–Diamond criterion;
- the Tate-construction computation of Ext_A(O,O);
- duality of patching;
- positive-defect or weight-one R = T at non-minimal level.

AutomorphicCongruences L0, SerreWeightAndLevelOptimisation R20.1 and PadicFamilies L1 each use a codimension-zero congruence module of a particular Hecke module, and none of them owns the general notion. The R03.3 decomposition pins 'the exact complete-intersection criteria used in patching' to KW II's regular sequences, not to the Wiles–Lenstra criterion.

## The routes

**1. A Part II of DeformationAndDerivedPatchingAlgebra** (route 1, 75 items; proposed id CongruenceModulesHigherCodimension, area commutative). The title is "Commutative algebra for deformation theory and patching, Part II: congruence modules, Wiles defects and the numerical criterion in higher codimension".
- *Why a Part II, and why here.* Part 1 of the paper is new commutative algebra of augmented complete local rings. It lies squarely in the direction of DeformationAndDerivedPatchingAlgebra, which is 'about complete local commutative rings and modules' and owns depth, complete intersections and patching. It is too large to be a source of R03.3, and it goes beyond that layer's stated scope.
- *Single owner.* Section 15 of the protocol wants a general notion planned once, by its most foundational owner. This Part II is therefore the owner of congruence modules in every codimension. The codimension-zero Hecke-module instances in AutomorphicCongruences L0, SerreWeightAndLevelOptimisation R20.1 and PadicFamilies L1 import its c = 0 case (Proposition 2.10, the comparison with Diamond's module).
- *Scope.* The brief lists eight layers:
  1. definitions and Theorem 2.5;
  2. depth conditions and the defect formula;
  3. duality and Tate cohomology;
  4. presentations and complete intersections;
  5. Tate constructions and Theorem D;
  6. invariance of domain;
  7. deformation invariance;
  8. the numerical criteria.
- *Also here.* The Tate constructions, the Γ-derivations of Iyengar (2001) and the Ext-algebra theorem serve only this theory, so they are planned here too. They import the Koszul complex from DerivedDeRhamCohomology DD.1 (its owner under RS-10), André–Quillen homology from DD.0, and complete resolutions from tauceti:TauCetiRoadmap/StablePeriodicCurved layer 2. The Φ-computation for power series over ⊗̂ O[[A_v,B_v]]/(A_vB_v) is pure algebra and is also here.

**2. A Part II of GL2ModularityLifting** (route 2, 42 items; proposed id GL2ModularityLiftingPositiveDefect, area langlands). The title is "GL₂ Modularity Lifting, Part II: integral non-minimal R = T in positive defect and in weight one via congruence modules".
- *Why a Part II.* GL2ModularityLifting follows KW II: totally real fields, defect ℓ₀ = 0, Betti or étale modules, and generic-fibre conclusions at non-minimal level. Part 3 of the paper is GL₂ modularity lifting beyond that.
- *Contents:*
  - the PGL₂/F Hecke complexes with Calegari–Geraghty's Conjectures A–D as explicit hypotheses, and Ihara's lemma for Bianchi manifolds;
  - weight-one coherent cohomology of Shimura curves: the sheaf ω, Kodaira–Spencer, Hasse invariants, the doubling method without q-expansions, Serre duality, and the Diamond–Taylor Ihara lemma;
  - the self-dual patching systems and patched level-raising maps;
  - the congruence-module induction on the level (Theorem 15.4);
  - Theorems 15.1, F, G and H, and the torsion Jacquet–Langlands correspondence (Theorem I).
- *One Part II, not two.* Theorem 15.1 treats the two cases uniformly, so they share one Part II. The brief lists the imports from the patching layers, route 1, the deformation, locally-symmetric and Hecke roadmaps, and the Shimura-curve geometry.
- *Overlap with the Calegari–Geraghty job.* The queued extraction of Calegari–Geraghty (PAPER-CALEGARI-GERAGHTY-18) overlaps the PGL₂/F Hecke side. The brief tells the design job to import whatever that extraction routes and to plan only the remainder here.

**3–8. Source routes.**
- **Route 3 (DeformationAndDerivedPatchingAlgebra R03.3 and P7).** General local algebra that the paper uses and cites from Bruns–Herzog, Kaplansky, Lescot and Stacks:
  - the second symbolic power and the regular-quotient criterion;
  - regular local rings;
  - coset prime avoidance;
  - Lescot's criterion, next to Serre's criterion in the reviewed R03.3 node;
  - normalized dualizing complexes of complete local rings, local duality (4.2), Cohen–Macaulay duals and their exactness, and the facts 11.1;
  - Gorenstein rings and maximal Cohen–Macaulay modules (9.1);
  - Hilbert–Samuel multiplicity, trace ideals and Artinian Gorenstein socles.

  The DeformationAndDerivedPatchingAlgebra README makes it, not the Gorenstein homological-algebra roadmap, the owner of this local theory. PAPER-BHATT-ETAL-23 and PAPER-HACON-WITASZEK-23 already route Matlis duality and local cohomology to R03.3. The same two extractions send the *scheme-level* normalized dualizing complex to AnalyticStacks AS.1. The complete-local version belongs with local cohomology, so AS.1 should import it rather than plan a second one; a reviewer may want the two unreviewed routes reconciled.
- **Route 4 (P7–P9).** These layers already plan the paper's §10, and the eleven planned items name the paper as a source. Four items are missing:
  - Lemma 10.8;
  - the dual patching system C†;
  - Theorem 11.3, which says that patching commutes with duality;
  - the dimension of a complex, with Christensen–Iyengar's Proposition 6, which Lemma 10.7 uses over a Cohen–Macaulay base.
- **Route 5 (LocalGaloisDeformationRings R08.2, L7).** Proposition 12.1 (after Shotton) computes the level-raising local rings explicitly, for example R_v^uni ≅ O[[A_v,B_v,X_v,Y_v]]/(A_vB_v). All three items are already planned; the paper is named as a source.
- **Route 6 (GlobalGaloisDeformations R04.x).** Remark 12.2 on the supply of level-raising primes, with its hypotheses corrected (E41, E42), and the notion of a level-raising prime. Also the paper as a source for the global functors, Proposition 12.3 and Proposition 15.2.
- **Route 7 (ArithmeticLocallySymmetricSpaces ALS.0, ALS.3, ALS.5).** The PGL₂/F level subgroups with auxiliary t², the level-lowering maps π_{K,v} and their U_v-relation (corrected, E53), the functor (−)^†, and the Atkin–Lehner-twisted self-duality of Proposition 13.7. ALS.0 already keeps the orientation local system and ALS.5 keeps orientation twists; E65 shows that the paper needs them.
- **Route 8 (SerreWeightAndLevelOptimisation R20.3).** Companion forms in the exceptional case (Gross; Coleman–Voloch), which Theorem 14.10(1) uses; R20.3 plans only Edixhoven's non-exceptional case. This follows PAPER-BOXER-CALEGARI-GEE-25.

## Prerequisite papers the atlas does not cover

The result file lists forty. Every DOI there resolves in Crossref and every arXiv id in the arXiv API, to the work cited. Grouped by use:
- **Commutative algebra of congruence modules:** Tate (1957), Lescot (1983), Avramov (Infinite free resolutions), Bruns–Herzog, Avramov–Henriques–Şega, Blanco–Majadas–Rodicio, Iyengar (2001), Fakhruddin–Khare–Ramakrishna (Appendix A), Christensen–Iyengar, Gulliksen–Levin, Kaplansky, Lindo and Roberts. The precursors are Wiles (1995, Appendix), Lenstra, Darmon–Diamond–Taylor, Böckle–Khare–Manning (2021 and 2024) and Brochard–Iyengar–Khare.
- **Patching:** Khare–Thorne (2017), Hansen (2012), Scholze (2018, §9) and Manning (2021).
- **Deformation rings:** Clozel–Harris–Taylor, and Shotton (2016, 2018).
- **Hecke algebras:** Newton–Thorne (2016), Jarvis (1999), Ribet (1984), Calegari–Venkatesh and Klosin.
- **Weight one:** Calegari (2018), Boxer–Pilloni (2022), Buzzard (1997), Kassaei (2004), Boxer's thesis, Gross (1990), Coleman–Voloch (1992) and Diamond–Taylor (1994).
- **Not listed, because the programme already has them:** Allen et al. (PAPER-ALLEN-ETAL-23, queued), Calegari–Geraghty (PAPER-CALEGARI-GERAGHTY-18, queued), Boxer–Calegari–Gee–Pilloni (PAPER-BCGP18, routed to a new roadmap), and Diamond (1997) and Kisin (2009), which are in the atlas bibliography. The Stacks Project is a general reference.

## Mistakes found in the paper

`sourceIssues` records 65 mistakes: 40 misprints, 13 errors and 12 gaps. Of these, 4 affect a stated result, 10 affect a proof, and 51 affect nothing downstream.

**How they were checked.**
- Each entry was checked on the rendered page of v3, and in v1 and v2 at the same place.
- Every error and gap was given to independent verifiers who were asked to refute it. A candidate was dropped if they refuted it or disagreed.
- Crossref lists no correction or erratum for the article. The authors' later papers restate some of the results and mention no correction: Iyengar–Khare–Manning (Math. Res. Lett. 2024) and Iyengar–Khare–Manning–Urban (PNAS 2024).
- All 65 entries are marked new.

**Stated results affected.**
- **E4, Theorem 7.4 / Theorem E.** The clause "δ_A(M) = δ_B(M) iff length Φ_A = length Φ_B" fails when M has rank 0 at p. The correct statement is δ_A(M) − δ_B(M) = rank·(length Φ_A − length Φ_B), and there are counterexamples in codimension 0 and 1.
  - No later use is affected.
  - The same clause is in the c = 0 source (Brochard–Iyengar–Khare, arXiv v2) and in the sequel (Iyengar–Khare–Manning–Urban, Lemma 2.24).
  - arXiv v1 and v2 also printed the inequality the wrong way round.
- **E64, Theorem G.** The input "Conjecture A is known for ℓ > 20" cites Newton–Thorne Theorem 1.3, which constructs ρ only modulo a nilpotent ideal. The nilpotent-free Theorem 1.4 needs a strictly regular weight, and ℓ > 20 is its bound at the smallest regular weight. The trivial-coefficient complexes of §13 are not covered. Theorem G therefore also needs Conjecture A(ii).
- **E65, Proposition 13.6.** At a real place K∞ is disconnected, and Y_K can be non-orientable. For example, with F = Q and t = 5, the element γ = (7 2; 25 7) lies in the level K_0(1) of 13.4 and reverses orientation. Verdier duality then pairs C_K with C_K ⊗ or, not with itself, and Newton–Thorne treat CM fields only. Theorem F for F with a real place rests on this; Theorem G and Case (Wt1) do not.
- **E57, Theorem 14.5(ii) and Theorem 14.6.** At the weight-one Taylor–Wiles levels the level is cut out by the entry d, not by ad⁻¹. Δ_Q therefore acts through the central character, and the characteristic polynomial x² − T_v x + ψ(Frob_v) and the determinant-ψ map R^𝔇_{Σ,Q} ↠ T^𝔇_{Σ,Q} fail as printed. The printed ⟨d⟩_v is the identity (E56). The fix is to define the Taylor–Wiles levels through ad⁻¹ as in §13, or to twist as in Calegari–Geraghty.

**Proofs affected. Each result is expected to hold, and each entry gives a repair.**
- **E1:** the prime-avoidance step of Theorem 5.6 uses h generators instead of m. There is an explicit counterexample to the step.
- **E23:** C_O is defined on p. 16 without an O-algebra structure, which §§5–6 need.
- **E32:** the proof of Proposition 4.9 identifies the wrong map with η_M.
- **E34:** the finiteness of R∞ over S∞ in Theorem 10.6(1). Böckle–Khare–Manning Lemma 3.6 does not apply as cited.
- **E35:** 10.1 requires R_n to be finite over Λ_n, which §15 does not verify for the rings R_{Σ,Q_n}. The proof of Theorem 10.6 does not need it.
- **E39:** the proof of Theorem 11.3 uses Theorem 10.6(3) twice for "the same infinitely many n".
- **E51:** the class of levels on which φ_K is defined excludes the levels actually used.
- **E55:** Conjecture B(3) is stated only at level Q = ∅ and for v ∈ Σ, but it is used at every Taylor–Wiles level (Lemma 13.8) and for v ∈ T ∖ Σ (Proposition 15.5).
- **E58:** the proof of property (a) of Proposition 14.1 identifies the base change of C^𝔇_{K_Δ} to k with its base change to k[Δ].
- **E13:** "R_{Σ,∞} ⊗ O ≅ R_Σ" is asserted before Theorem 15.4, but it is a consequence of it.

**Errors and gaps that affect nothing downstream.** Eleven entries have a counterexample or a missing hypothesis in a statement that no later proof uses as printed:
- E2, the display of Ext_A(O,O) for complete intersections in 6.12. It keeps only the H_0 part of a Koszul complex, and A = O[[t1,t2]]/(ϖt1 − t2², ϖt2 − t1²) has O/ϖ ⊆ Ext³_A(O,O). The torsion-free conclusions drawn from it are right.
- E21, the c = 0 case of Coker(η_M) in the remark before Lemma 3.7.
- E22, "M∞ = R∞ (and hence R∞ is Cohen–Macaulay)" after Theorem J.
- E24, Corollary 8.3 and Theorem C when M_{p_A} = 0, which both still hold.
- E27, "one can take R = O" in 4.8, which needs M finite over O.
- E38, the reduction to j = 0 in the proof of Theorem 11.3.
- E41, the first claim of Remark 12.2. Its counterexample is the weight-one form of level 23 with ℓ = 5 and v = 11.
- E42, the second claim of Remark 12.2. It fails for ℓ = 5 when [k : F_5] is odd, for example with projective image A_5.
- E48 and E50, facts about the level subgroups at t and at v.
- E53, the matrix in the U_v-relation of 13.5. It is correct only for the ordering π_2 ⊕ π_1.

The items use the corrected statements. The remaining 40 entries are misprints.

**Candidates not recorded.** Several candidate mistakes were checked and not recorded, because the verifiers found a reading under which the paper is right, or split. Examples:
- a step in the proof of Lemma 3.10;
- the 'auto-equivalence' of Cohen–Macaulay duality in §4, which is right in each fixed dimension;
- the framed Hecke algebra T_Σ^□;
- the base case of Theorem 15.4;
- X^𝔇_∅ in the proof of Theorem 14.10.

## How this was done

The whole of arXiv v3 was read. Every item statement was then checked a second time against the paper, cluster by cluster, and the library status of every item was checked against the pinned trees and the atlas. The inputs the paper cites were read wherever a status or a mistake depended on them: Newton–Thorne, Böckle–Khare–Manning, Brochard–Iyengar–Khare, Fakhruddin–Khare–Ramakrishna, Darmon–Diamond–Taylor, Jarvis and Khare–Thorne.

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-IYENGAR-KHARE-MANNING-24.result.json` reports ok. `research/blueprint/intake.py check-files` passes on the two deliverables. No Lean was written; a paper extraction has no Lean deliverable, and nothing is claimed to be formalised.
