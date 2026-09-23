# PAPER-BOXER-CALEGARI-GEE-ETAL-25: The Ramanujan and Sato–Tate conjectures for Bianchi modular forms

George Boxer, Frank Calegari, Toby Gee, James Newton and Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, [Forum of Mathematics, Pi 13 (2025), e10](https://doi.org/10.1017/fmp.2024.29); arXiv [2309.15880](https://arxiv.org/abs/2309.15880).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1346). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BOXER-CALEGARI-GEE-ETAL-25.result.json](PAPER-BOXER-CALEGARI-GEE-ETAL-25.result.json). It has:
- 109 items: 5 library, 23 planned, 81 missing;
- 9 routes: six sources of existing layers, two new Part IIs and one coalesced candidate;
- 27 prerequisite entries;
- 13 recorded source issues (10 misprints, 2 errors, 1 gap). One error is already corrected by the authors.

## Sources read

- **The published version** (open access, CC BY 4.0), read in full. Page numbers below are the journal's. Every recorded mistake was checked on the page images.
- **arXiv v2** (6 November 2024) is the accepted text.
- **arXiv v3** (27 March 2025) was posted after publication and compared word by word with v2. It rewrites Remark 2.1.1 and carries the constant c through §2.2 (E2). Nothing else changes.
- **Errata:** Crossref and Cambridge Core record no correction.

## What the paper proves

**The main results.**
- **Theorem A (7.1.1), the Ramanujan conjecture.** Let π be regular algebraic cuspidal on GL_2 over an imaginary CM field, of parallel weight. Then every π_v is (essentially) tempered.
- **Theorem B (7.2.3), the Sato–Tate conjecture.** In the same setting, the classes [π_v] of a non-CM π are equidistributed in ST(π).
- **Bianchi modular forms (Theorems E–G).** Over imaginary quadratic fields every such π has parallel weight. So the paper also proves:
  - the bound |c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2} (Theorem E);
  - the same bound for Hecke eigenvalues on parabolic cohomology (Theorem F);
  - mass equidistribution for level-one forms, by Marshall's conditional theorem (Theorem G).
- **Theorems C, 6.2.1 and 7.2.1.** Both A and B follow from these. A rank-2 compatible system with Hodge–Tate weights {0, m} is pure, and all its symmetric powers are potentially automorphic.

**The first new ingredient: Theorem D (2.5.5, §2).** For p > n, the special fibre of every weight-0 crystalline lifting ring is generically reduced.
- **Where it is proved.** On the Emerton–Gee stack.
- **Step 1.** A weight-0 crystalline lift of a *generic* ρ̄ is ordinary (Theorem 2.3.2).
- **Step 2.** Generic means the extension classes avoid the images of crystalline rank-one Breuil-module extensions (Lemma 2.2.19, Definition 2.2.26).
- **Step 3.** So only the Serre-weight-0 component of the stack occurs, with multiplicity one (Theorem 2.5.2).

**The second new ingredient: Theorem 3.2.1 (§3).** An automorphy lifting theorem in weight 0 with p arbitrarily ramified.
- **It combines:**
  - Caraiani–Newton's local–global compatibility at p;
  - ACC+-style derived Ihara avoidance.
- **The role of Theorem D.** It supplies the unique generalisation of generic points needed at p (Lemma 3.2.4(2)).

**The third new ingredient: the p–r switch (§§4–6).** Proposition 6.2.3 compares Sym^{n−1}R ⊗ R_aux and Sym^{n−1}R ⊗ R_CM, then removes the CM factor by cyclic descent.
- **The auxiliary systems.**
  - R_aux and S_UA come from Qian's non-self-dual Dwork motives.
  - They are taken at p ≡ −1 mod N, a new unitary case (§4.4).
  - They are made crystalline ordinary by Drinfeld–Kedlaya (Proposition 4.2.6).
- **The construction.** Theorem 6.2.4 builds all the data over a tower of CM fields, using Moret-Bailly twice (Proposition 4.5.1).

## What the atlas already has

- **Library (5 items).** All are cited at the pinned Mathlib commit:
  - power sums over 𝔽_q^× (`FiniteField.sum_pow_units`);
  - Lucas's theorem (`Choose.choose_modEq_prod_range_choose`);
  - Hilbert 90 (`groupCohomology.exists_div_of_norm_eq_one`);
  - Goursat's lemma (`Subgroup.goursat_surjective`);
  - linear disjointness.
- **Planned (23 items).**
  - The endpoints: Theorems A, B, C and 6.2.1, the Sato–Tate group and Serre's criterion (ModularityAndLanglandsExtensions ML.2, ML.3; AnalyticNumberTheory AN.4).
  - Two more ML items: symmetric powers of elliptic curves (ML.3, ML.5) and cyclic base change (ML.5).
  - Kisin's lifting rings (LocalGaloisDeformationRings L7, R08.1, R08.3).
  - Breuil–Kisin modules (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4).
  - Decomposed genericity (AG2.7) and adequacy (G7).
  - ACC+'s deformation problems (L7, GlobalGaloisDeformations G8).
  - Locally symmetric spaces and Hecke algebras (ArithmeticLocallySymmetricSpaces; IntegralHeckeAndGaloisDeterminants).
  - Scholze's torsion Galois representations (TorsionCohomologyInfrastructure TC.4, IHG.5).
  - Compatible systems (PotentialAutomorphyInfrastructure PA.5, R24.5:operations), with Varma's local–global compatibility (AG2.5).
  - The Moret-Bailly theorem itself (PotentialModularityAndCompatibleSystems R23.1).

## Routes

1. **Source of ModularityAndLanglandsExtensions [ML.0, ML.2, ML.3]** (8 planned and 9 missing items).
   - **Planned:** the endpoints listed above.
   - **Missing:** items of the same kind.
     - The p–r switch: Proposition 6.2.3 and Theorem 6.2.4. PAPER-QIAN-23 routed its analogous endpoints to ML.2.
     - Purity from symmetric powers: Lemma 6.1.3 and the Jacquet–Shalika bound.
     - Parallel weight with Clozel's purity lemma.
     - The Bianchi applications E–G with their definitions.
2. **Source of ArithmeticGaloisRepresentations [R01.4, G7]** (7 items): the Taylor–Wiles big-image conditions, Lemmas 5.2.2–5.2.6 and the adequacy theorem of Guralnick–Herzig–Taylor–Thorne.
3. **Source of ArithmeticGaloisDuality [R02.2, R02.4]** (3 items): Lemma 5.3.1 (Grunwald–Wang), Remark 5.3.2 and Lemma 5.3.3 (m-th roots of characters).
   - PAPER-QIAN-23 routed its character-root obstruction here.
   - Tau Ceti's class field theory roadmap excludes Grunwald–Wang.
4. **Source of PotentialAutomorphyInfrastructure [PA.5]** (4 items):
   - weak automorphy of level prime to T;
   - Lemmas 6.1.4 and 6.1.5;
   - the trichotomy of ACC+ Lemma 7.1.2.
5. **Source of PotentialModularityAndCompatibleSystems [R23.1]** (1 planned and 1 missing item).
   - **Planned:** the first part of Proposition 4.5.1 (Moret-Bailly).
   - **Missing:** its refinement making a given finite quotient of π_1 surjective (Chebotarev for schemes, Jordan).
6. **Source of LocalGaloisDeformationRings [L7]** (5 items): the relation "connects", the models ρ_{n,m,0} and Lemmas 5.1.3–5.1.5.
   - These are component statements about L7's rings.
   - PAPER-BOXER-CALEGARI-GEE-25 routed "connects" to L7 too.
7. **New Part II `WeightZeroCrystallineLiftingRings`** (21 items; parent LocalGaloisDeformationRings, area padic).
   - **Title:** "Local Galois deformation rings and their components, Part II: generic reducedness of weight-zero crystalline lifting rings via Emerton–Gee stacks".
   - **What it carries:** all of §2:
     - Breuil modules and Theorems 2.1.4–2.1.5;
     - rank-one extension computations;
     - generic ρ̄ and Theorem 2.3.2;
     - the Emerton–Gee stack imports and Theorem 2.4.3;
     - Theorems 2.5.2 and 2.5.5.
   - **Why a new Part II.** The atlas plans the lifting rings and Breuil–Kisin modules. It does not plan Breuil's S-modules, Emerton–Gee stacks or any generic-reducedness statement.
8. **New Part II `WeightZeroCrystallineAutomorphyLifting`** (9 items; parent PotentialAutomorphyInfrastructure, area automorphic).
   - **Title:** "Reusable infrastructure for potential automorphy over CM fields, Part II: weight-zero crystalline automorphy lifting with p arbitrarily ramified".
   - **What it carries:**
     - Theorem 3.2.1;
     - the §3.2 setting;
     - Proposition 3.2.3 and Lemma 3.2.4;
     - the patched objects and Theorem 3.2.5;
     - Caraiani–Newton's inputs;
     - Miagkov–Thorne's ordinary theorem.
   - **Why not an existing candidate.** The pending lifting Part IIs are conditional (AutomorphyLiftingBeyondTaylorWiles) or polarized (PolarizedAutomorphyLifting). The review may merge the three.
9. **Coalesced with `PotentialAutomorphyDworkMotivesPartII`** (22 items; PAPER-QIAN-23's candidate).
   - **What it adds (§4):**
     - the Dwork family and Katz's hypergeometric sheaves;
     - the character Ψ;
     - Propositions 4.2.5–4.2.6;
     - finite unitary groups;
     - the unitary moduli spaces T({U}) and their monodromy;
     - Lemma 4.4.4.
   - **Also the switching construction of Theorem 6.2.4:** R_CM, the choice of primes, the local data (i)–(v) with Kisin's local constancy and Berger's theorem, and R_aux and S_UA.
   - **Why coalesce.** The candidate owns this family and forbids a second Dwork implementation.

## Source issues (`sourceIssues` E1–E13, checked on page images)

Items use the corrected statements.

**An error already corrected by the authors.**
- **E2** (p. 13, Remark 2.1.1). The claim "c = 1" is false: c, the image of φ(E(u))/p in S_𝔽, is a unit but need not be 1.
  - **Consequence:** the φ–N relation must read φ(u^eN(x)) = cN(φ(x)).
  - **Who corrected it:** footnote 2 of the published version says so, and arXiv v3 carries c and d = φ^{−1}(c) through Lemmas 2.2.3 and 2.2.7 and (2.2.9). Both thank Dat Pham.

**A new error.**
- **E7** (p. 37, Lemma 4.2.4). The proof's "V_{c(λ)} ≅ V_λ^∨(1 − N)" should be (2 − N), so the lemma's Ψ·c(Ψ) = |·|^{N−n} should be |·|^{N−n−1}.
  - **Why:** V_λ is an eigenpiece of H^{N−2} of the (N − 2)-dimensional fibres. By weights, V^∨(1 − N) has weight N, not N − 2, and Ψ has weight N − n − 1.
  - **Impact:** nothing later uses the exponent.

**A gap.**
- **E12** (pp. 49–50, Remark 5.3.2). To show that 16 is not an 8th power in ℚ_2(√−5), one must also exclude x² = −2.
  - **Why the stated facts do not suffice:** "neither 2 nor −1 is a square" does not exclude it; think of ℚ_2(√−2).
  - **The conclusion still holds:** −2 is not a square in ℚ_2(√−5).

**Misprints.**
- **E1** (p. 4, Theorem C(1)): "independent of v" should be "independent of λ".
- **E3** (p. 26): ur_ν takes Frobenius "to λ"; it should be "to ν".
- **E4** (p. 26): the très ramifiée convention sets k_{σ,d−i} − k_{σ,d+1−i}. It should set k_{σ,i} − k_{σ,i+1}, as the sentence before it says. The two differ for d ≥ 3.
- **E5** (p. 28): "Theorem 2.4.1" should be Proposition 2.4.1(4).
- **E6** (p. 36): "χ ∈ (χ_1, …, χ_N)" should be "χ = (χ_1, …, χ_N)".
- **E8** (p. 40): the exponent r_dq_v^{d−1} should be r_{d−1}q_v^{d−1}.
- **E9** (p. 43): H^{N−1} of the Fermat fibre should be H^{N−2}.
- **E10** (p. 46): PSU_n should be PSU_m.
- **E11** (p. 47): r̄_A ⊗ r̄_B should be Sym^{n−1}r̄_A ⊗ r̄_B.
- **E13** (p. 62, Theorem 7.2.3): S_π is "the set of places at which π is unramified"; it should be "ramified".

**A mistake in a cited source.** The paper reports that Emerton–Gee's monograph (§5.5) erroneously claimed extra constraints on the characters ω_{k,i}. The authors' errata correct this. It is a mistake of that book, not of this paper, so it is noted here and in the Serre-weight item, not in `sourceIssues`.

## Prerequisites not yet covered

Twenty-seven entries, all with DOIs confirmed on Crossref, except:
- Caraiani–Newton (arXiv only);
- Berger 2010 and Henniart 1982 (no DOI).

**The key inputs:**
- ACC+ 2023;
- Caraiani–Newton;
- Emerton–Gee's monograph and errata;
- Gee–Liu–Savitt;
- Emerton–Gee–Herzig; Herzig–Le–Morra;
- Liu; Caruso;
- CEGS;
- Drinfeld–Kedlaya;
- Katz;
- Miagkov–Thorne.

**Other inputs:**
- Geraghty; Kisin 1999; Berger;
- Katz–Messing;
- Marshall; Harder; Jacquet–Shalika;
- Dieulefait; Henniart;
- HSBT10; BLGGT14;
- Calegari 2012; Serre's *N_X(p)*;
- Artin–Tate;
- Thorne 2012 (with the GHTT appendix).

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-ETAL-25.result.json` reports no errors. Every planned stage id exists in `data/atlas.json`.
