# PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22: Lifting and automorphy of reducible mod p Galois representations over global fields

Najmuddin Fakhruddin, Chandrashekhar Khare and Stefan Patrikis, *Lifting and automorphy of reducible mod p Galois representations over global fields*, [Inventiones mathematicae 228 (2022), 415–492](https://doi.org/10.1007/s00222-021-01085-7); arXiv [2008.12593](https://arxiv.org/abs/2008.12593).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1282). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json](PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json). It has:
- 94 items: 8 planned, 86 missing;
- 5 routes: one new Part II, three sources of existing layers, and one coalesced candidate;
- 15 prerequisite entries;
- 7 recorded misprints.

## Sources read

- **arXiv v5** (15 October 2021), read in full. Its arXiv comment calls it the "final version, to appear in Invent. Math". Page numbers below are v5's.
- **The published version** (online 12 November 2021) is paywalled and was not read.
  - The Springer article page shows no correction notice.
  - Crossref records no update and no work that updates the article.
- **Pan's Theorem 1.0.2** (arXiv 1901.07166v2) was read to check its p = 3 hypothesis against the use in Theorem 7.4. It does not bite: Pan is used only when χ̄|_{Γ_{ℚ_p}} = 1, and for p = 3 that is ≠ ω.
- **Other cited papers** were not read. Items resting on them (FKP19 above all) state them as the paper uses them.

## What the paper proves

**The main theorem (Theorem 5.2 = Theorem E).** Let:
- G be a smooth group scheme over ℤ_p with G^0 split reductive and π_0(G) of order prime to p;
- F be a global field (a number field or a function field) of characteristic ≠ p;
- ρ̄ : Γ_{F,S} → G(k) be a residual representation, possibly reducible.

Assume:
- p ≫_G 0;
- Assumptions 3.1, 4.1 and 5.1:
  - H¹(Gal(K/F), ρ̄(𝔤^der)^*) = 0 for K = F(ρ̄, μ_p);
  - no invariants in ρ̄(𝔤^der) or ρ̄(𝔤^der)^*;
  - no surjection from ρ̄(𝔤^der) onto a subquotient of ρ̄(𝔤^der)^*;
  - local lifts exist at S, de Rham and Hodge–Tate regular above p;
- for number fields, F totally real and ρ̄ odd.

Then ρ̄ has a geometric lift with:
- the given multiplier;
- image containing Ĝ^der(O′);
- restriction at each v ∈ S congruent to the given local lift and lying on a chosen irreducible component.

**How it is proved.** The paper extends the authors' earlier irreducible theory (FKP19, Duke 2021):
- **§3 (mod ϖ²).** The doubling method of Khare–Larsen–Ramakrishna and Hamblen–Ramakrishna is rebuilt on cyclic submodules M_Z ⊂ ρ̄(𝔤^der). Lemma 3.4 minimises Ш, and extra primes t_b, t_0 are inserted in advance. Together these make the fixed fields of the auxiliary cocycles linearly disjoint (Lemma 3.7) even though ρ̄(𝔤^der) is not semisimple (Propositions 3.6 and 3.8).
- **§4 (mod ϖ^N).** The same method gives lifts mod ϖ^N with controlled ramification (Theorem 4.4).
- **§5 (relative deformation theory).** FKP19's relative deformation theory (Lemma 5.3, Proposition 5.4) turns these into a characteristic-zero lift. For 𝔤^der = 𝔰𝔩_2, p ≥ 3 suffices (Corollary 5.5).
- **§6 (the residually split case).** ρ̄ is first made a non-split extension inside a parabolic (Lemmas 6.3–6.5), and then conjugated back (Lemma 6.1). This gives Corollary 6.6.

**The applications.**
- **Theorem 7.4 = Theorem B.** Every odd reducible ρ̄ ∼ (χ̄ ∗; 0 1) : Γ_ℚ → GL_2(k), with p ≥ 3 and χ̄ ≠ κ̄^{−1}, arises from a newform.
  - It arises in every weight r ≥ 2, and in Serre's weight with level prime to p.
  - The statement is about the actual ρ̄, not only its semisimplification (Wiles's question).
  - Proof: the lift of Theorem E is modular by Skinner–Wiles, or by Pan when χ̄|_{Γ_{ℚ_p}} = 1.
  - It improves Hamblen–Ramakrishna (Theorem A).
- **Proposition 7.7 and Remark 7.8.** Minimal lifts need not exist, so the Khare–Wintenberger method cannot reach these ρ̄.
- **Function fields (Theorem 8.1, Corollaries 8.3 = Theorem C and 8.4).** Many reducible GL_n-valued ρ̄ are automorphic, via L. Lafforgue.
- **GSp_2n (Proposition 9.1).** Some reducible GSp_2n-valued ρ̄ lift to compatible systems with Zariski-dense image. The proof uses BLGGT14, Allen–Newton–Thorne and Dynkin.
- **Appendix A.** Group-theoretic criteria for the Assumptions, for GL_n, the group G_n, maximal parabolics and Borels.
- **Appendix B.** Ordinary components of G-valued potentially semistable rings, following Geraghty.
- **Conjecture D** predicts lifting and automorphy for all odd L-homomorphisms.

## What the atlas already has

**Planned (8 items).**
- Čebotarev: Tau Ceti's Chebotarev roadmap, Layer 10, and FunctionFieldArithmetic FA.5.
  - Tau Ceti already has `NumberField.Chebotarev.frobeniusPrimeSet` and `NumberField.exists_auxiliaryPrime`, but not yet the density theorem.
- Tame inertia: ArithmeticGaloisRepresentations R01.2 and FunctionFieldArithmetic FA.3.
- Serre's weight: AlgebraicModularFormsAndSerreWeights R15.4.
- Skinner–Wiles: OrdinaryAutomorphicFormsAndModularityLifting R21.5.
- Pan: GL2ModularityLifting R32.4, with R21.5.
- Serre's conjecture: ClassicalSerreModularity R27.6.
- L. Lafforgue's correspondence: GlobalShtukasAndFunctionFieldLanglands GS.6.
- Borel subgroups over a base (Proposition B.1): Tau Ceti ReductiveGroups, Layers 7–8.

**Planned suppliers, cited in notes.**
- Lattices and Brauer–Nesbitt (R01.1).
- ρ_f and local–global compatibility at p (AutomorphicGaloisRepresentations R19.1, R19.5).
- Number-field Poitou–Tate and Greenberg–Wiles (ArithmeticGaloisDuality R02.3–R02.6).
- Kisin's rings (LocalGaloisDeformationRings R08.3, L7).
- The Bruhat–Tits tree (ReductiveGroupsPartII RG2.2).
- Moret-Bailly (PotentialModularityAndCompatibleSystems R23.1).
- Kronecker–Weber (Tau Ceti ClassFieldTheory, Layer 13).

**Library.** Nothing is in a library at the needed level.
- Mathlib's abstract Jordan–Hölder theorem (`JordanHolderLattice`, `CompositionSeries.jordan_holder`) does not cover the operator-group form of Lemma A.3.

**The gap.** The atlas has no Ramakrishna-style lifting at all. GlobalGaloisDeformations builds deformation rings for patching (GL_2 in R04, polarized in G7, determinant-variable in G8), over number fields only.

## Routes

1. **New Part II of GlobalGaloisDeformations** (67 missing): `GlobalGaloisDeformationsPartIIGValuedLifting`, "Global Galois deformation rings, Part II: lifting G-valued residual representations over global fields, including the reducible case" (area `modular`).
   - **What it holds:**
     - the standing G-valued set-up;
     - the FKP19 inputs the paper uses as black boxes;
     - §§3–6 in full;
     - Appendix A;
     - the applications of §§7–9, which are corollaries of Theorem E consuming planned layers, with Conjecture D as a conditional statement.
   - **Suggested layer order:**
     - FKP19 foundations first (FKP19 should be extracted before the design job, as Pan's first paper was for DESIGN-PAN);
     - then cyclic-module cohomology, doubling, relative deformation theory, the split case, the criteria and the applications.
   - **Why a Part II of this roadmap:**
     - it is new work in GlobalGaloisDeformations' direction: deformation problems, Selmer and dual Selmer groups, auxiliary primes;
     - it is not automorphy lifting (PotentialAutomorphyInfrastructure, PolarizedAutomorphyLifting), which the applications only consume;
     - it is not Böckle–Harris–Khare–Thorne's proposed GValuedDeformationsAndPotentialAutomorphy, whose Khare–Wintenberger finiteness method Remark 7.8 shows cannot reach reducible ρ̄.
2. **Source of LocalGaloisDeformationRings [R08.2, R08.6, L7]** (14 missing).
   - **R08.2 (away from p):**
     - the equal-characteristic generic-fibre theory (§2);
     - local lifts away from p (Lemma 7.2(1));
     - Booher's minimally ramified GSp_2n lifts and Steinberg points;
     - equal-characteristic local lifts after Clozel–Harris–Taylor §2.4.4.
   - **R08.6 (local statements for the global arguments):** the ordinary and Serre-weight crystalline lifts of Lemma 7.2(2), (3).
   - **L7 (fixed Hodge-type rings):**
     - the G-valued rings R^{□,μ,τ,v} (Balaji, Bellovin–Gee Theorem A);
     - Appendix B: the canonical torus and χ_λ, Definition B.2, Lemma B.3, R^{△λ}, Lemma B.4 (1)–(3).
     - Boxer–Calegari–Gee's extraction already sent Lemma B.4 to L7.
3. **Source of ArithmeticGaloisDuality [R02.3, R02.4, R02.6]** (1 missing): local duality, Euler characteristics, Poitou–Tate and Greenberg–Wiles over global function fields.
4. **Source of ModularityAndLanglandsExtensions [ML.2]** (2 missing):
   - BLGGT14 Theorem 3.1.2, with the Steinberg place added to the Moret-Bailly conditions;
   - the compatible-system argument of BLGGT14 Theorem 5.5.1.
5. **Coalesced with `PolarizedAutomorphyLifting`** (2 missing): Thorne's ι- and ξ-ordinarity, and Allen–Newton–Thorne Theorem 1.1 as Proposition 9.1 uses it.
   - This is the pending Part II of PotentialAutomorphyInfrastructure, proposed by Boxer–Calegari–Gee and extended by Newton–Thorne; its id, title, parent, area and brief are kept.

## Source issues (`sourceIssues` E1–E7, all misprints, checked on page images)

None affects a result.

- **E1** (p. 32, proof of Lemma 7.1): "χ̄ ≠ κ^{−1}" should read χ̄ ≠ κ̄^{−1}.
- **E2** (p. 32, same proof): "such an equality with χ̄κ̄^{−1}" should read χ̄^{−1}κ̄, the character in the list just given.
  - The parity argument is unaffected.
- **E3** (p. 44, before Lemma A.3): the factors of the chain are indexed i = 1, …, n; they should be i = 0, …, n − 1.
- **E4** (p. 47, Lemma A.10(1)): "i = 1, 2 …, r" should be i = 1, …, s. The letter r is carried over from Lemma A.9.
- **E5** (pp. 49–50, Definition A.13 and Example A.17): "Γ′_F" should be Γ_{F′}.
- **E6** (p. 55, proof of Lemma B.4): h²(Γ_{F_v}, r(𝔤_0)) should be h²(Γ_{F_v}, r(𝔟_0)), as on the line before and in the conclusion.
- **E7** (p. 55, same proof): "y ∈ Spec(R^{△λ}[1/p])^∧_y)" should be y ∈ Spec(R^{△λ}[1/p]), with components of (R^{△λ}[1/p])^∧_y. The parentheses in the printed text do not balance.

Two candidates were rejected on the page images: in Proposition 7.7, both GL_2(k̄) and χ̄ are printed correctly (the text extraction had lost the bars).

## Prerequisites not yet covered

Fifteen entries, all with DOIs confirmed on Crossref, except:
- Balaji's thesis (MR 3152673);
- Conrad's *Reductive group schemes* (author's PDF).

**The key input.** FKP19 (Duke Math. J. 170 (2021)), which the paper uses as a black box in §§3–5. It is not in the paper queue and should be extracted first.

**The others:**
- Hamblen–Ramakrishna 2008;
- Khare–Larsen–Ramakrishna 2005;
- Bellovin–Gee 2019;
- Balaji 2012;
- Booher 2019 with Booher–Patrikis 2019;
- Thorne 2015;
- Allen–Newton–Thorne 2020;
- BLGGT14;
- Geraghty 2019;
- Conrad 2014;
- Guralnick 1999;
- Bellaïche–Chenevier 2014;
- Berger–Klosin 2019;
- de Jong 2001 with Gaitsgory 2007.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json` reports no errors. Every planned and route stage id exists in `data/atlas.json`.
