# PAPER-ABDURRAHMAN-VENKATESH-25: Symplectic L-functions and symplectic Reidemeister torsion (mod squares)

Amina Abdurrahman and Akshay Venkatesh, *Symplectic L-functions and symplectic Reidemeister torsion (mod squares)*, [Inventiones mathematicae 241 (2025), 717–839](https://doi.org/10.1007/s00222-025-01349-6); arXiv [2303.13436](https://arxiv.org/abs/2303.13436).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1209). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-ABDURRAHMAN-VENKATESH-25.result.json](PAPER-ABDURRAHMAN-VENKATESH-25.result.json). It has:
- 93 items: 1 library, 7 planned, 85 missing;
- 6 routes: 4 source routes, 1 new roadmap and 1 Part II;
- 13 prerequisite entries;
- 25 recorded source issues.

## Sources read

- **arXiv v1** (the only arXiv version, 98 pages) was read in full, both the TeX source and the PDF. Statement numbers and pages below are those of v1.
  - A background agent read Appendices A–D line by line and checked them. I verified each finding recorded here by hand, and the B.10 counterexample by an independent computation.
- **The published version** (Invent. Math., 123 pages) is not open access and was not read, so it may differ from v1.
- **Errata:** Crossref records no correction.

## What the paper proves

**Main theorem (Theorem 3.1).** Let X be a smooth projective curve over F_q and ρ : π_1(X) → Sp_{2r}(ℓ) a geometrically surjective local system, ℓ a finite field.
- **Hypotheses:** #ℓ ≡ ±1 (mod 8); q ≡ 1 (mod 8); q is a square in the prime field of ℓ and prime to #Sp_{2r}(ℓ).
- **Conclusion:** the central value L(X, ρ, q^{−1/2}) is, modulo squares, trace_X(ρ^*c_et). Here c_et ∈ H^3(Sp_{2r}(ℓ), ℓ^×/2) is Soulé's étale Chern class.
- **Degenerate case:** if the central value vanishes, it is replaced by L^*, the spinor norm of the normalized Frobenius.

**The topological theorem (Theorem 2.1).** For a closed oriented 3-manifold with a symplectic local system over any field of characteristic ≠ 2, (−1)^{χ_{1/2}/2}·RT(M, ρ) = ∫ρ^*c_et.
- **The torsion class (§2.3, App. B).** The Reidemeister torsion square class RT is defined with careful sign conventions for determinant functors.
- **Bordism invariance (Theorem 2.2).** It makes RT a functional 𝔑 on H_3(BSp(R), Z)/2.
- **Identifying 𝔑 with c_et (§§2.7–2.16).**
  - Over finite fields both sides live in groups of order 2 (Lemmas 2.7.1–2.7.2).
  - Goodness is transferred between finite fields through characteristic-zero rings carrying c_et-liftable classes. These come from K_3 of number fields: Suslin, Hutchinson–Tao, Merkurjev–Suslin.
  - A controlling-field argument shows that the good primes have density 1. Its one input computed by hand is an explicit local system over Q(i) with nonsquare torsion (App. C).
- **Mapping tori (corollary (1.5)).** The spinor norm of a mapping class on H^1 of a surface is a trace of c_et on the mapping torus.

**From topology to arithmetic (§§4–6).**
- **Step A.** On the Hurwitz stack 𝔐^{G*}_g of Sp_{2r}(ℓ)-covers of curves, the classes computing c_et and L agree on the complex fibre by (1.5). Irreducibility (Lemma 5.1.1) then makes their difference a Dirichlet character χ_{r,ℓ}. Odd-degree covers remove the dependence on the genus.
- **Step B.** Slicing Hilbert–Siegel modular varieties (§6) produces pairs over F_{p^j}, j odd, on which both sides are trivial.
  - A totally real field is built with controlled unit reductions (§6.1).
  - A moment computation with Guralnick–Tiep's criterion gives slices with nonzero central value (Lemma 6.4.1).
  - Together these show χ_{r,ℓ} is unramified outside 2ℓ. Quadratic reciprocity then finishes the proof.

**Other results.**
- **§3.10:** a corollary for compatible systems.
- **App. D:** numerical evidence with quaternionic covers of genus-2 curves, outside the theorem's hypotheses.

## What the atlas already has

**Library (1 item).** Mathlib's group (co)homology, quadratic reciprocity, discriminants of quadratic forms and Sylow subgroups.

**Planned (7 items).**
- The spinor norm (SpinRepresentations Layer 2).
- Discriminants and the Witt group (QuadraticFormInvariants Layers 1, 4).
- The étale Chern class (MotivicEtaleKTheory M.8) and Merkurjev–Suslin at 2 (M.7).
- The Hilbert–Siegel moduli with their Baily–Borel and Lan compactifications (PELModuli M1–M2, ShimuraVarieties V2, ShimuraCompactifications C5).
- Tame specialization of π_1 (InverseGaloisAndArithmeticFundamentalGroups IG.1). RS-29 keeps IG.1's specialization content.
- Weil II weights and semisimplicity (DeligneWeightsAndPurity DWP.7–DWP.8).

**Not in the atlas.** Nothing plans:
- Reidemeister torsion, algebraic Poincaré complexes or determinant functors with their signs;
- oriented bordism;
- L-functions and Deligne ε-factors with torsion coefficients, or central values modulo squares;
- Hurwitz stacks of unramified covers of higher-genus curves, or the Livingston–Dunfield–Thurston classification;
- the paper's moment-method slicing.

**Related candidates.**
- UniversalHypersurfaceMonodromy (from PAPER-BROWNING-SAWIN-20) and MappingClassGroupsAndCanonicalRepresentations (from PAPER-LANDESMAN-LITT-24) are close in spirit. They are not routed to, because their scopes are specific to their papers.

## Routes

1. **Source → KTheoryFiniteLocalFields:L.1** (2 items). Lemmas 2.7.1 and 2.7.2 are degree-three cases of Quillen's finite-field calculation:
   - H_3(Sp_{2r}(F_q), Z)/2 ≅ H_3(SL_{2r}(F_q), Z)/2 ≅ Z/2;
   - c_et is an isomorphism onto F_q^×/2.
2. **Source → K3BlochGroups:V.1, V.4** (2 items).
   - Suslin's theorem: K_3(F) → H_3(SL(F)) is onto with kernel {−1}·K_2(F).
   - Hutchinson–Tao's surjection H_3(SL_2(F)) → K_3(F)^ind.
3. **Source → AnalyticNumberTheory:AN.4** (1 item). Chebotarev density for normal integral rings of finite type over Z (Serre). PAPER-SCHMIDT-STIX-16 sends the same theorem here.
4. **Source → FunctionFieldArithmetic:FA.5** (1 item). The L-function of a Galois representation with finite-field coefficients, with its cohomological formula mod ℓ. FA.5 plans exactly these Euler products and Artin factors.
5. **New → SymplecticReidemeisterTorsionModSquares**, "Symplectic Reidemeister torsion mod squares and the étale Chern class" (41 items; area `topology`).
   - **Contents:** the topological half of the paper.
     - Appendices A and B: Poincaré complexes, determinant functors, Lagrangian volume classes, RT over fields and rings, bordism invariance, Zassenhaus's formula.
     - Appendix C: mapping tori and the Q(i) example.
     - §2: Thom's comparison, 𝔑, the transfer lemma, Lemma 2.10.1, controlling fields, density one, and Theorem 2.1.
     - The vanishing of c_31 on Sp_{2r}(R) and corollary (1.5).
   - **Why new:** nothing in the atlas goes in this direction. The nearest roadmaps supply only inputs, and the Tau Ceti topology roadmaps cannot be re-planned.
6. **Part II → SymplecticLFunctionsModSquares**, "Global function fields, reciprocity and automorphic foundations, Part II: central values of symplectic L-functions mod squares" (38 items; parent FunctionFieldArithmetic, area `etale`).
   - **Contents:** the arithmetic half of the paper.
     - §3: ε-factors with torsion coefficients, L^*, the square discriminant, trace maps, the main theorem, and compatible systems.
     - §§4–5: Step A, with Hurwitz stacks, Dunfield–Thurston, 𝔜 and 𝔜′, odd covers and raising the genus.
     - §6: Step B, with real fields, compatible systems and H^1 vanishing on the Hilbert–Siegel variety, Lemmas 6.3.1–6.3.2, slicing, Poonen, Guralnick–Tiep, and Lemmas 6.4.1 and 6.5.1–6.5.2.
     - Appendix D as tests.
   - **Why a Part II:** FunctionFieldArithmetic plans L-functions of curves over finite fields but not their central values. The Part II imports route A for Theorem 2.1 and (1.5).

## Source issues (`sourceIssues` E1–E25)

All are in arXiv v1. The published version was not checked. Pure typography (duplicated labels, repeated words, stray brackets) is not recorded.

**Reaching the main theorem.**
- **E4 (error, Lemma 5.1.1, p. 40; hence Theorem 3.1 for r = 1, #ℓ = 9).**
  - **Problem:** the proof uses H_2(Sp_{2r}(ℓ), Z) = 0, but H_2(SL_2(F_9), Z) = Z/3, and #ℓ = 9 satisfies the theorem's hypothesis #ℓ ≡ ±1 (mod 8).
  - **Consequence:** the mapping class group invariant φ_*[Σ] ∈ H_2(G, Z) splits the Q̄-fibre of 𝔐^G_g into at least three components for every large g, so Step A's H^0 = Z/2 fails.
  - **Fix:** exclude that case, or argue component by component.
- **E25 (gap, Lemma 5.2.1, pp. 41–42).**
  - **Problem:** the proof applies (1.5) to local systems with finite coefficients. The paper derives (1.5) through Lemma C.2.1 and the circle formula (B.30), both proved only in characteristic 0 (Jacobson–Morozov and log A).
  - **Fix:** prove (B.30) over every field of characteristic ≠ 2. The authors say the characteristic-zero assumption "very likely could be removed", and the orthogonal Jordan-type decomposition does hold in odd characteristic.
- **E19 (error, Appendix B.10, pp. 85–86).**
  - **Problem:** base change for RT over normal rings is false as stated. It holds for the normalized class (−1)^{χ_{1/2}/2}RT, which is what §2.4 uses.
  - **Counterexamples:**
    - A genus-2 mapping torus over Z_(3): the characteristic polynomial of the monodromy is (x² + x + 1)² over Q, and h = 2 over F_3. This was computed independently, and with Theorem 2.1 it forces RT_{F_3} = −image(RT_Q).
    - An orthogonal circle family, using the paper's own (B.30).

**Harmless errors.**
- **E3 (Lemma 2.7.1, p. 16; Lemma 3.5.1, p. 30).**
  - **Problem:** "vanishing integral H_2" fails for SL_2(F_9).
  - **Checks:** Schur multiplier of A_6; independently, Swan's theorem on a Sylow 3-subgroup (F_9, +), on which the torus acts by N(t)² = 1.
  - **Effect:** odd order suffices for both uses.
- **E7 (§5.5, p. 46).**
  - **Problem:** Hom(class group, A) → ∏ Hom(k_x^×, A) is surjective, not an isomorphism, because Pic(X) is infinite. The bound in (a) should be on #Pic^0.
  - **Effect:** surjectivity is all that is used.
- **E12 (Appendix A.6.1, p. 66).**
  - **Problem:** "a perfect pairing on the cokernel of d" should be on the image. K →0 K is a counterexample to the printed sentence.
- **E20 ((C.2), p. 87).**
  - **Problem:** δ must be the discriminant on the generalized 1-eigenspace. On the literal fixed space the form is degenerate when T is not semisimple.
- **E8 (gap, §6.4, (6.18) and Lemma 6.4.2, p. 58).**
  - **Problem:** the smallest D with E ≥ 6N need not satisfy Poonen's D ≥ r − 1.
  - **Fix:** take D ≥ max(D_E, 2N − 1), which Lemma 6.4.1's "D ≥ D_0" already allows.

**Misprints.**
- **E1 (§1.5, p. 8):** the standard form should have ⟨e_i, e_j⟩ = ⟨f_i, f_j⟩ = 0, not 1; g should read r.
- **E2 (Theorem 2.2, p. 14):** "4r-manifold" should be a manifold of dimension ≡ 0 (mod 4).
- **E5 (§3.3, p. 28):** the middle expression for ε should be (−qt)^{dim H^1} det(F)^{−1}.
- **E6 (§3.10, p. 33):** Sp_{2r}(o_λ) should be Sp_{2r}(k_λ), and (d) should be (c).
- **E9 ((6.16), p. 57):** the sign; Lefschetz gives 𝔣(h) = −Σ f(x).
- **E10 (p. 60):** the invariants meant are those on ρ_λ ⊗ ρ_λ.
- **E11 (Lemma 6.5.1, p. 60):** "unramified outside m" should be "unramified at m".
- **E13–E18:** slips in Appendices A.7 and B.3–B.9:
  - the degree table;
  - θ_n, (B.14) and a reference;
  - the Lagrangian in B.6(a), the swapped D_1/D_2 and dim D_i;
  - two wrong cross-references in B.7–B.8;
  - formula slips in (B.33)–(B.36);
  - the remark before (B.37).
- **E21 (App. C):** (C.8)–(C.9), and the unstated convention that words in the Dehn twists apply the leftmost twist first. Only this reading reproduces the printed matrices.
- **E22–E24 (App. D):** χ(h)^{−1}; β′(z ∪ −1); Pic(X̃) and "nontrivial" in D.5–D.6.

The items use the corrected statements.

## Prerequisites not yet covered

1. Soulé, *K-théorie des anneaux d'entiers de corps de nombres et cohomologie étale* (Invent. Math. 55, 1979).
2. Weibel, *Étale Chern classes at the prime 2* (NATO ASI C 407, 1993).
3. Merkurjev–Suslin, *The group K_3 for a field* (Math. USSR Izv. 36, 1991).
4. Hutchinson–Tao, *The third homology of the special linear group of a field* (JPAA 213, 2009).
5. Thom, *Quelques propriétés globales des variétés différentiables* (Comment. Math. Helv. 28, 1954).
6. Deligne, *Les constantes des équations fonctionnelles des fonctions L* (LNM 349, 1973).
7. Dunfield–Thurston, *Finite covers of random 3-manifolds* (Invent. Math. 166, 2006).
8. Livingston, *Stabilizing surface symmetries* (Michigan Math. J. 32, 1985).
9. Guralnick–Tiep, *Decompositions of small tensor powers and Larsen's conjecture* (Represent. Theory 9, 2005).
10. Poonen, *Bertini theorems over finite fields* (Ann. of Math. 160, 2004).
11. Larsen, *Maximality of Galois actions for compatible systems* (Duke 80, 1995).
12. Bass, *Clifford algebras and spinor norms over a commutative ring* (Amer. J. Math. 96, 1974).
13. Sawin–Wood, *Finite quotients of 3-manifold groups* (Invent. Math., 2024).

DOIs were checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ABDURRAHMAN-VENKATESH-25.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- **Restructures:** RS-26, RS-28, RS-29 and RS-32 touch the imported roadmaps but not the cited stages' content. RS-29 keeps IG.1's specialization maps.
- **Checked by hand:**
  - §2: Lemmas 2.9.1, 2.11.2–2.11.3, 2.12.1–2.12.3 (including the δ_{k+1} ≤ δ_k − δ_k³/16 estimate), §§2.13–2.15.
  - §3: the ε computation in §3.3; Lemma 3.5.1; §3.10.
  - §§4–5: (4.1); §§5.3–5.5 (Riemann–Hurwitz and the choice of the primes m).
  - §6: §6.1, Lemmas 6.3.1–6.3.2, and the moment computation of Lemma 6.4.1.
- **Checked by computer:**
  - the Appendix C examples (the 6 × 6 matrices, det(1 − T̃) = 4 and 8, charpoly x⁴ + 1);
  - Zassenhaus's identity (B.31) on random examples;
  - the four curves of Appendix D.7 (class groups and all admissible α);
  - the B.10 counterexample.
- **Not checked:** the explicit strict-Poincaré structure in A.5 and the sign (B.27) are not written out in the paper.
- No Lean was written or compiled; this is an extraction.
