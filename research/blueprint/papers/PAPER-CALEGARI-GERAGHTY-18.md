# PAPER-CALEGARI-GERAGHTY-18: Calegari–Geraghty (2018), modularity lifting beyond the Taylor–Wiles method

Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Inventiones mathematicae 211 (2018), no. 1, 297–433, [doi:10.1007/s00222-017-0749-x](https://doi.org/10.1007/s00222-017-0749-x), arXiv:1207.4224. Correction: Invent. Math. 227 (2022), 855–856, [doi:10.1007/s00222-021-01095-5](https://doi.org/10.1007/s00222-021-01095-5).

Job PAPER-CALEGARI-GERAGHTY-18 (issue #1298), Claude Code, session cc-72825f.

## The version read

**The published article.** Calegari's research page links a copy of the Springer PDF (137 pages, pp. 297–433; PDF page n is printed page 296 + n). It was read in full, and every locator in this extraction is a page of the published article.

**The accepted version.** arXiv:1207.4224v2 (16 July 2017, 101 pages) is the accepted version. It was compared with the published text word by word. They agree up to layout, hyphenation and copy-editing, with three differences:
- The bibliography is numbered in order of citation, where v2 uses alphanumeric labels.
- The subsections of §9 are renumbered, though the statement numbers agree.
- In 47 places the published article prints the power-series brackets ⟦ ⟧ as single brackets [ ].

The authors' 2022 Correction lists those 47 places, and it was read in full. The items use the corrected brackets, and the 12 items of the Correction are recorded as known misprints.

**Earlier and other versions.** arXiv v1 (July 2012) is the first of the two preprints merged at the editor's request. It was consulted for the history of individual passages. The author-hosted "merge.pdf" of June 2017 matches v2.

## What the paper proves

**The problem.** The Taylor–Wiles method proves R = T when the relevant automorphic forms contribute to a single degree of cohomology. This is the defect l0 = 0 case. In it, patching produces a module of full codimension over a regular ring, and Wiles's numerical coincidence makes the tangent space of the patched deformation ring fit. The method fails in two familiar cases:
- GL₂ over a field with a complex place (Bianchi forms, with l0 = 1);
- weight-one modular forms, which contribute to both H⁰ and H¹ of the coherent sheaf ω on a modular curve.

In both cases the patched deformation ring R∞ has dimension l0 less than the patched group ring S∞.

**The key idea.** If the localised cohomology lives in exactly l0 + 1 degrees, then one can patch perfect complexes of that length, and the commutative algebra forces the patched top cohomology to have codimension exactly l0. That gives maximal depth over R∞, and hence freeness or near faithfulness.

**Part 1 (l0 = 1)** works with modules. The algebra is the notion of a *balanced* module (Definition 2.2) and a patching criterion (Proposition 2.3). There are two applications.

**Weight-one forms over Q, unconditionally (§§3–4).**
- Theorem 3.11: local–global compatibility for Galois representations attached to Katz forms of weight one over O/ϖ^m. The representation is unramified at p. The proof goes through a "doubling" argument with the Hasse invariant, and in the scalar case through the ordinary deformation ring R̃† of Snowden.
- Theorem 1.4 (Theorems 3.26 and 3.30): R^min ≅ T_m for the Hecke algebra of H¹(X_U, ω ⊗ L_σ), and freeness. The vector bundles L_σ handle vexing primes.
- Corollaries 1.5–1.6: minimal deformations unramified at p are modular of weight one, so they have finite image.
- Theorem 4.8: the multiplicity of ρ̄ in J₁(N*)[m] is two exactly when ρ̄ is unramified at p with ρ̄(Frob_p) scalar. The proof computes that R̃† and T_m are Cohen–Macaulay of type 3.

**Bianchi forms (§5).** Theorems 1.2, 1.3 and 5.11 give minimal R = T and freeness for PGL₂ over an imaginary quadratic field, *assuming Conjecture A* (the existence of Galois representations on the torsion Hecke algebras, with local–global compatibility).

**Part 2 (arbitrary l0)** patches complexes (Theorem 6.3, via Lemma 6.2) and constructs them (§7.1 for Betti cohomology, §7.2 for coherent cohomology).
- §8 is the Galois side for GL_n over any number field. It includes the invariants l0 and q0 and the numerical coincidence (Proposition 8.5), which now has l0 fewer variables.
- §9 states **Conjecture B**: Galois representations, local–global compatibility at p, at Taylor–Wiles primes and at R, and vanishing of the localised cohomology outside [q0, q0 + l0].
- Lemma 9.6 proves the Taylor–Wiles part of Conjecture B for n = 2, and §9.4 sketches it in general.
- Theorem 9.19 gives near faithfulness, combining Taylor's Ihara avoidance with the patched complexes.
- Theorem 5.16 follows: conditional modularity lifting for GL_n over an arbitrary number field.
- Theorem 1.1 (§10) follows from that: *assuming Conjecture B*, every elliptic curve over every number field is potentially modular and satisfies Sato–Tate.

**Later work.** The conjectures are only partly known today:
- Scholze constructed Galois representations modulo a nilpotent ideal. Newton–Thorne and Caraiani et al. improved this in cases.
- ACC+ and Caraiani–Newton proved local–global compatibility under hypotheses.
- The vanishing conjecture B(4) is open. ACC+ avoids it, and it has been proved only for GL₂ over some CM fields in a preprint of Gholami.

No later work found reports a mathematical error in the paper.

## What the libraries and the atlas already have

The extraction has 495 items: 8 are in the libraries, 221 are planned in atlas layers, and 266 are missing. Every item was checked against Mathlib 082e2d3 and Tau Ceti f790474, reading the statements in the Lean files, and against the atlas at tauceti-explorer c7008c0.

**The libraries** have only conventions and small general facts:
- local fields, uniformisers and residue fields, and the Teichmüller lift (Tau Ceti);
- homology of complexes;
- polynomial and group algebras (the universal Hecke algebra T^univ);
- representations and their duals;
- lifting chain maps out of bounded complexes of projectives (Stacks 08FQ);
- right-exactness of top-degree cohomology;
- inflation–restriction for finite-index subgroups (Tau Ceti's continuous cohomology).

Neither library has Galois deformation rings, patching, depth, Hecke operators on cohomology, modular curves over O with coherent cohomology, Katz forms, locally symmetric spaces or anything specific to the paper.

**Planned in the atlas.** The planned items are spread over about forty roadmaps. The main owners are:
- *DeformationAndDerivedPatchingAlgebra* (78 references to its layers).
  - R03.5 plans balanced modules and Proposition 2.3. Its reviewed decomposition node balanced-modules-and-module-patching transcribes §2 from this paper.
  - P7–P9 and R03.6 plan patching of complexes, Lemma 6.2, Theorems 6.3–6.4 and Proposition 6.6. P9 names "the balanced-dimension conclusions used in Calegari–Geraghty".
  - R03.3 plans depth and Auslander–Buchsbaum.
- *GlobalGaloisDeformations* (78) and *LocalGaloisDeformationRings* (52). Definition 3.1, R_Q, Selmer groups and Taylor–Wiles primes over Q and imaginary quadratic fields, and the GL_n problems of §8.5 including the numerical coincidence (Proposition 8.5). Also the Fontaine–Laffaille rings and Taylor's R¹_v and R^χ_v.
- *ArithmeticLocallySymmetricSpaces* (45), with *AdelicAlgebraicGroups* and *IntegralHeckeAndGaloisDeterminants*. Arithmetic orbifolds Y(K), bounded finite projective chain models (Lemma 7.1), Hecke operators on complexes (Lemma 7.2), the boundary and Poincaré duality.
- *ArithmeticGaloisDuality* (41). The Greenberg–Wiles formula, Poitou–Tate and dual Selmer groups.
- *ModularCurvesPartII* (34) and *AlgebraicModularFormsAndSerreWeights* (19). Modular curves over O, the Hodge bundle ω, Kodaira–Spencer, degeneracy maps, diamond operators and Katz forms.
- Smaller contributions:
  - OrdinaryAutomorphicFormsAndModularityLifting: Galois representations of ordinary forms of weight n, and Lemma 3.15's sequence.
  - AutomorphicGaloisRepresentations.
  - GL2AutomorphicRepresentationsAndTransfer: multiplicity one.
  - ModularityAndLanglandsExtensions.
  - Tau Ceti's ModularCurves, ClassFieldTheory, Chebotarev and AlgebraicTopology roadmaps.

**Missing.** No layer plans:
- R = T in defect l0 = 1: the balanced homology of weight-one forms and of Bianchi manifolds, and minimal R = T for either;
- local–global compatibility at p for torsion weight-one Hecke algebras (Theorem 3.11), including the doubling argument;
- the vexing-prime bundles L_σ;
- the multiplicity-two theorem;
- Conjectures A and B and the conditional GL_n lifting theorems;
- integral coherent cohomology of automorphic bundles with Hecke operators on perfect complexes;
- the local block computation of §9.4.1;
- the canonical-module and Hilbert-series algebra of §4.1;
- the structure of Snowden's ring R̃†.

## The routes

**1. A Part II of GL2ModularityLifting** (route 1, 110 items; proposed id GL2ModularityLiftingDefectOne, area langlands). Title: "GL₂ Modularity Lifting, Part II: minimal R = T in defect one for weight-one forms over Q and Bianchi forms".

- *Why a Part II.* GL2ModularityLifting follows KW II with defect 0. Part 1 of the paper is GL₂ modularity lifting in the next case, l0 = 1, where the Hecke modules are balanced rather than free and need not be O-flat.
- *Scope.* The brief lists seven layers:
  1. weight-one Hecke modules on modular curves, with coherent homology, duality and Hecke algebras;
  2. Taylor–Wiles levels in weight one (Lemmas 3.5–3.7, Proposition 3.8);
  3. Galois representations over torsion weight-one Hecke algebras (Theorem 3.11 and doubling);
  4. minimal R = T in weight one (Theorem 3.26, Theorem 1.4, Corollaries 1.5–1.6);
  5. vexing primes (L_σ, Theorem 3.30);
  6. multiplicity two (Theorem 4.8);
  7. Bianchi forms, with Conjecture A as an explicit hypothesis (Theorem 5.11, Theorems 1.2–1.3).
- *Relation to the IKM Part II.* PAPER-IYENGAR-KHARE-MANNING-24 proposed GL2ModularityLiftingPositiveDefect for the non-minimal continuation: weight one on Shimura curves, and PGL₂ over any number field under Conjectures A–D. Its brief says it imports what this extraction routes. So the minimal-level theory is planned here once. It has a distinct id because the queue does not merge design jobs across papers.

**2. A Part II of PotentialAutomorphyInfrastructure** (route 2, 34 items; proposed id AutomorphyLiftingBeyondTaylorWiles, area langlands). Title: "Reusable infrastructure for potential automorphy over CM fields, Part II: conditional automorphy lifting for GL_n over arbitrary number fields".

- *Why here.* Part 2 of the paper is the conditional ancestor of the unconditional CM-field method that the parent plans after ACC+.
- *Contents:*
  - the Hecke algebras on cohomology mod ϖ^n of Definition 9.1;
  - Conjecture B, stated as explicit hypotheses, never as conclusions;
  - Lemma 9.6 (condition (5) for n = 2, by amalgams) and the §9.4 route to condition (5);
  - the complexes D̃_N;
  - Theorem 9.19 and Theorem 5.16.
- *What it reuses.* It imports the planned patching (P8, P9, R03.6), the ALS and IHG complexes, and the GL_n Galois side of GlobalGaloisDeformations and LocalGaloisDeformationRings. It must not duplicate the parent's PA.3–PA.4.
- *What the design job must add.* The paper writes no deduction of Theorem 5.16 from Theorem 9.19; the design job must supply it (see E203 and the item note on Theorem 5.16).

**3. A Part II of AutomorphicBundles** (route 3, 10 items; proposed id IntegralCoherentHeckeComplexes, area langlands). Title: "Automorphic bundles and classical automorphic forms, Part II: integral coherent cohomology and Hecke-equivariant perfect complexes".

- *Contents.* This is §7.2:
  - coherent homology over O/ϖ^n;
  - Nakajima's Čech complexes, made perfect over O/ϖ^n[Δ];
  - Hecke operators defined by the Faltings–Chai trace-free pairing on toroidal compactifications;
  - their lift to the complexes, and localisation.
- *Why a Part II.* AutomorphicBundles stops at sections in characteristic zero. Both this paper's coherent case and IKM's weight-one Shimura-curve complexes need this material.

**4–23. Source routes**, one per roadmap:

- **Existing roadmaps whose layers the paper already feeds:**
  - **DeformationAndDerivedPatchingAlgebra** R03.3, R03.5, P7 (19 items). Canonical modules, Lemmas 4.1–4.2, Hilbert series and Lemma 4.4, O[Δ] as a complete intersection, BLGHT's completed tensor product lemma, the defect via coinvariants, and Lemmas 7.5–7.6.
  - **LocalGaloisDeformationRings** L7, L8, R08.1, R08.2 (20). Snowden's ring R̃†: the unramified and doubling ideals, Lemma 3.22 (J = I) and Theorem 4.3 (normal, Cohen–Macaulay, type 3). Also Lemma 4.11 on the rings R_{v,φ}.
  - **AlgebraicModularFormsAndSerreWeights** R15.2, R15.3 (9). Coherent Hecke operators on H⁰ and H¹, W_x, Edixhoven's twisted duality, and Gross's weight-one T_p.
  - **SerreWeightAndLevelOptimisation** R20.1–R20.3 (5). The weight-one ideal m∅ from Serre's conjecture and companion forms, and the J₁(N*) inputs to Theorem 4.8.
- **Galois side:**
  - **GlobalGaloisDeformations** R04.2, R04.5 (5): Lemma 4.14 and the GL₁ example.
  - **ArithmeticGaloisDuality** R02.3, R02.5, R02.6 (3): Selmer numerics, including Σ_{v|∞} dim H⁰(F_v, ad⁰V) = [F:Q]n(n−1)/2 + l0.
  - **ArithmeticGaloisRepresentations** R01.2, G7 (2): λ(α) and oddness.
- **Automorphic and locally symmetric side:**
  - **ArithmeticLocallySymmetricSpaces** ALS.0, ALS.3, ALS.4 (5): level subgroups and Eisenstein ideals.
  - **AutomorphicFormsOnReductiveGroups** AF.1, AF.4 (6): l0, q0 and Borel–Wallach.
  - **IntegralHeckeAndGaloisDeterminants** IHG.1, IHG.2 (2).
  - **GL2AutomorphicRepresentationsAndTransfer** R16.2, R16.3 (2): the Conrad–Diamond–Taylor types.
- **Local representation theory:** **SmoothRepresentationsOfLocalGroups** SR.0, SR.5 (17), all of §9.4.1:
  - Vignéras's mod-ℓ correspondence;
  - the block of an unramified regular principal series, and Corollary 9.13;
  - Theorem 9.16, H^k(G(O_x), M) ≅ e_α H^k(U₀(x), M).
- **Endpoints:** **ModularityAndLanglandsExtensions** ML.0–ML.3 (9). Theorem 1.1 and its §10 proof are recorded as a conditional endpoint: under Conjecture B, potential modularity and Sato–Tate for every elliptic curve over every number field. ML.1's acceptance forbids claiming this unconditionally.
- **Small single-item or two-item routes:**
  - SchemeAndStackFoundations SF.2: the flat Kummer sequence;
  - AlgebraicModuliForArithmeticGeometry A0-extension: Grothendieck duality with trace in relative dimension d;
  - KTheoryLowDegrees U.4: the congruence subgroup property;
  - ModularCurvesPartII R14.4: Lyndon's sequence for amalgams;
  - ReductiveGroupsPartII RG2.2: Ihara's amalgam for PSL₂(F_x);
  - AdelicAlgebraicGroups AA.5: the GL₁ quotient;
  - PotentialModularityAndCompatibleSystems R24.1: Thorne's finiteness theorem.

## Prerequisite papers the atlas does not cover

The result file lists 45. Every DOI resolves in Crossref to the work cited. Five entries have no DOI: Mazur–Ribet (Astérisque), two theses, Harris's 1990 chapter, and Reduzzi's note, which is linked by URL. Grouped by use:
- **Weight one:** Gross (1990), Coleman–Voloch, Katz (1977), Wiese (2007, 2014), Carayol (1989, 1994), Edixhoven (1997, 2006 with Mestre's appendix), Buzzard–Taylor, Buzzard (2003), Mazur–Ribet, Ribet–Stein, Calegari (2011).
- **Local deformation rings:** Snowden, Geraghty, Kisin (CDM 2005), Reduzzi.
- **Vexing primes:** Conrad–Diamond–Taylor and Diamond (1996, 1997).
- **Deformation theory, the Galois side and potential automorphy:**
  - Darmon–Diamond–Taylor (Chapter 2), Wiles.
  - Clozel–Harris–Taylor and Taylor (2008), Thorne (2012).
  - BLGHT (2011), HSBT (2010).
- **Bianchi and GL_n homology:** Calegari–Venkatesh, Harder, the theses of Taylor and Berger, Bass–Milnor–Serre, Serre's *Trees*, Vignéras, Emerton–Helm.
- **Coherent cohomology:** Harris (1990), Lan–Suh, Lan (2012), Nakajima.
- **Algebra and foundations:** Hartshorne, Milne, Eisenbud, Herzog–Kunz, Kaplansky.
- **Not listed because the programme already has them:**
  - Borel–Wallach, Deligne–Serre, Diamond (1997), Kisin (2009), Katz–Mazur, Deligne–Rapoport, Conrad (2007), Mazur (1989), Edixhoven (1992), Serre (1987), Faltings–Chai, the Stacks Project: in the atlas bibliography or as decomposition sources.
  - Khare–Wintenberger, Scholze (2015), Harris–Lan–Taylor–Thorne and Lan's book: sources of existing roadmaps.

## Mistakes found in the paper

`sourceIssues` records 217 mistakes: 153 misprints, 43 errors and 21 gaps. Of these, 28 affect a stated result, 26 affect a proof, and 163 affect nothing downstream.

**How they were checked.**
- Twelve are the items of the authors' 2022 Correction: the power-series brackets ⟦ ⟧ printed as [ ] in 47 places. They are recorded as known (E12, E15, E36, E47, E59, E71, E73, E74, E88, E131, E197, E205).
- The other 205 are new. They were collected by ten section readers, ten independent statement checkers and three whole-paper hunts: 304 candidates, which reduced to 231 after de-duplication.
- Every candidate was checked again on the rendered page of the published version and in arXiv v2. Each error and gap had two independent verifiers, one reading the printed text and the mathematics, the other trying to defend the paper and tracing the consequences. Misprints had one verifier each.
- 24 candidates were rejected because the paper is right under its own conventions (for example, "rank" in the definition of l0, or deliberate reuse of notation). Six verdicts were split. Two of them were not recorded: "Serre modular" in Theorem 5.16(8)(b), whose meaning §5.4 fixes, and "finite free" in §7.1, where the §7 introduction makes R local. The other four were recorded at the kind the verifiers' arguments support.
- No later work found reports any of these.

**Stated results affected.**
- **The introduction's theorems:**
  - Theorem 1.3 omits a local hypothesis at the ramified primes that the proof needs through §5.1(3) (E5).
  - Theorem 1.4 omits the §3.1 standing hypothesis ρ̄^{I_x} ≠ 0 at reducible primes (E6).
  - Corollary 1.5's hypothesis (1) does not force minimality up to twist (E9).
  - The multiplicity-two claim of the abstract and introduction omits Theorem 4.8's twist-minimality hypothesis (E1).
- **Weight one:**
  - Theorem 3.11 needs x ≡ 1 mod p at the primes of Q (E35).
  - Lemma 3.15(4) calls the character ε^{n−1}λ(⟨p⟩U_p^{−1}) unramified (E41).
  - The level groups of §3.9 at primes of S(ρ̄) − (T(ρ̄) ∪ P(ρ̄)) are wrong unless d has p-power order (E51).
  - Theorem 3.30 mixes σ and σ* (E61).
- **§4.1 algebra:**
  - Lemma 4.2's "Moreover" needs B or C flat over O (E72).
  - Lemma 4.4's first "if and only if" is false in the non-graded case; the paper's own example after the proof shows it (E75).
- **Bianchi forms:**
  - The level Γ_p(v^c) at type-P primes does not cut out the minimal inertial type (E106).
  - Lemma 5.6 needs U_v ≢ ±1 mod m at Taylor–Wiles primes (E111).
  - The remark after Theorem 5.11 that μ = 1 in characteristic zero fails when S(ρ̄) contains a prime of type P, M or H (E121).
- **Patching:**
  - Lemma 6.2 needs H*(P) ≠ 0 (E130).
  - Theorem 6.3's hypothesis (2) needs H non-zero and finite (E134). Its hypothesis (c) can hold only for n ≤ N (E132, which affects the proof).
  - Conclusion (iii) and Theorem 6.4(3) should read P∞^□ (E138, E140).
  - Proposition 6.6 needs a compatibility of its isomorphisms across levels (E142).
- **Complexes:**
  - Lemma 7.2 needs the double coset stable under K₀(Q)-conjugation for the lifted operators to be O[Δ]-linear (E143).
  - Lemma 7.4 states its length bound in terms of the O-coefficient homology, which is wrong: the minimal complex's length is governed by homology mod m_R. For example O --ϖ--> O has homology in one degree but no perfect model of length 0 (E148).
- **Part 2's Galois side:**
  - The oddness test Trace(c_v) ∈ {−1, 0, 1} is not equivalent to balanced eigenspaces in small residue characteristic (E164).
  - Lemma 8.2 needs r̄ trivial at v ∈ R, and gives only characteristic-zero minimal primes rather than p-torsion-freeness (E165, E169).
  - The characters χ_{v,i} of §8.5.1 must be defined on O_{F_v}^× (E168).
- **Conjecture B and Theorem 5.16:**
  - The normalisation T_{𝔞,k} = N(𝔞)^{−k}T_{α,k} conflicts with the Hecke polynomial of Conjecture B (E180).
  - Theorem 5.16 is not stated under the hypotheses that §9.5 actually uses (E125, E126, E203).

**Proofs affected; the results are expected to hold.**
- **Weight one and vexing primes:**
  - Remark 3.4's transitivity of the diamond operators on the cusps is false (E23), and so is its reuse in the proof of Theorem 3.30 (E66).
  - The identity x^{−1}π₁*∘tr(π₁)∘W_x = U_x + x^{−1}W_x is justified by "π₁* is fully faithful" (E27).
  - T_{n,m} → T̃_{n,m̃} need not be injective when α = β (E38).
  - The scalar case of Theorem 3.11 needs a twist before R̃† applies (E44).
  - The rank-one argument after Theorem 3.26 splits the cases by the wrong invariant (E49) and uses an unproved identification of Frob_x with U_x (E50).
- **Multiplicity two:**
  - Theorem 4.8's exceptional set of primes is wrong (E85).
  - Lemma 4.11 misses the mod-p Steinberg case v ≡ −1 mod p (E89).
  - T_m ≅ T_{1,m} ⊗ O[Φ] needs its proof through generators (E94).
  - The final count is an inequality before it is an equality (E95).
- **Bianchi forms:**
  - Lemma 5.9(1) uses H₃(Y₀(Q), k) = 0 where only the localised group vanishes (E116).
  - Conjecture A(4) is misprinted (E115).
  - q is the dual Selmer dimension (E120).
- **Patching:**
  - Theorem 6.3's patching data need O-flat quotients O^□/I (E137).
  - The sequence (M_i, N_i) must have N_i → ∞ (E139).
- **Complexes:**
  - The singular chain complex in Lemma 7.1 is not bounded, so Mumford's lemma does not apply as cited (E144).
- **Conjecture B and Theorem 9.19:**
  - Conjecture B lacks the local–global compatibility at Taylor–Wiles primes that the patching in §9.5 uses (E181).
  - The proof of Lemma 9.6 leaves several steps to the reader (E189).
  - The proof of Lemma 9.12 contains a false claim about constituents (E198).
  - The χ-twisted duality needs χ^{−1} (E207).
  - The surjections from R^i_∞ must be chosen compatibly mod ϖ (E209).
- **§10:**
  - The bound on N₂ in the proof of Theorem 1.1 must be N₂ > 2n + 1 (E213).
  - The reduction of Sato–Tate to potential modularity needs a common extension for ρ and its symmetric powers (E214).
  - The roles of p and q are switched in the general case (E216).

**Errors that affect nothing downstream.** These include:
- §2's description of S_N as "non-reduced", where non-regular is meant (E14);
- W_x² = x^n⟨x⟩ in weight n (E21);
- the parenthetical of Theorem 3.14 at primes of Q (E40);
- Lemma 6.1, which needs N finitely generated (E129);
- the lift in Lemma 7.2, which exists only up to homotopy (E147);
- the trace in §7.2, which is not an isomorphism (E154);
- several statements in the GL₁ example of §8.2 (E156, E160);
- the choice of ξ (E170) and dim L_v at a prime of Q with N(v) ≢ 1 mod p (E172);
- the type statement after Conjecture B (E186);
- "circle bundles" in §9.4 (E194).

The misprints include a mis-cited reference: "[29], A1.3.17" for Kodaira–Spencer is Katz, LNM 350 (1973), not LNM 601 (E19). They also include garbled author names in the published bibliography, [27], [37] and [60], which are correct in arXiv v2 (E217).

## Notes for the reviewer

- **Coordination with PAPER-IYENGAR-KHARE-MANNING-24.** Its GL2ModularityLiftingPositiveDefect Part II is the non-minimal continuation of route 1 of this extraction. Its Conjectures A–D for PGL₂/F are the n = 2 cases of this paper's Conjecture B (route 2) and include this paper's Conjecture A. It also needs route 3's coherent complexes for Shimura curves. The briefs of routes 1–3 say so, and IKM's own brief already says it imports what this extraction routes.
- **The reviewed patching nodes.** The DeformationAndDerivedPatchingAlgebra decomposition nodes that take §§2 and 6 from this paper reproduce the printed hypotheses of Theorem 6.3(c)–(d), Lemma 6.2 and Theorem 6.4(3). E130, E132, E134, E137, E138 and E140 should be carried into them when that roadmap is next revised.
- **§9.4.1** is sent to SmoothRepresentationsOfLocalGroups SR.5 as a source route rather than as a new Part II for mod-ℓ representations. SR.5 owns the ℓ ≠ p integral theory of GL_n after Helm, and §9.4.1 is a regular-block special case. A reviewer who prefers a separate Part II for Vignéras's correspondence could split it off.
- **Theorem 1.1** is routed to ModularityAndLanglandsExtensions as a conditional endpoint, because ML.0 registers endpoints with an explicit status. It must never be registered as unconditional.
- **Scholze's torsion theorem** is cited only as context and is not used in any proof, so it is not an item. TorsionCohomologyInfrastructure deliberately does not plan it.

## How this was done

**Reading the paper.** The published article was read in full, in ten overlapping section clusters:
- For each cluster, one reader extracted every definition, construction and key result with its exact statement and published locator.
- A second reader checked the statements independently against the page images; 90 statements were corrected and missing items were added.
- A third reader decided library and atlas status, reading the Lean declarations at the pinned commits and the atlas stages and reviewed decomposition nodes.
- Duplicates across cluster boundaries and proof-internal steps were then removed, leaving 495 items.

**Mistakes and inputs.**
- Mistakes were found and verified as described above.
- The later literature was searched for corrections and for the status of Conjectures A and B.
- All 82 references of the paper were checked against Crossref and the arXiv API, and against the atlas bibliography and queue.
- The status of Conjectures A and B was read in Scholze, Newton–Thorne, Caraiani et al., ACC+, Caraiani–Newton and Gholami. The versions and hashes are listed in the result file.

**Checks and Lean.**
- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-18.result.json` reports ok.
- `research/blueprint/intake.py check-files` passes on the two deliverables.
- No Lean was written. A paper extraction has no Lean deliverable, and nothing is claimed to be formalised.
