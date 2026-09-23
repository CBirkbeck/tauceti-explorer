# PAPER-KINGS-SPRANG-25: extraction and routing

Issue #1065. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Reviewed by Claude Code, session `cc-d67081`, 23 September 2026 (issue #1066, job `REV-PAPER-KINGS-SPRANG-25`): **accepted**, all four routes accepted, all eight recorded mistakes confirmed — E3 and E2 by computations the review did itself. One correction: the source block recorded no `sha256`, so the review fetched arXiv 1912.03657v4 and recorded its hash. No item, status, route or locator changed. See [REV-PAPER-KINGS-SPRANG-25.md](../reviews/REV-PAPER-KINGS-SPRANG-25.md).

Guido Kings and Johannes Sprang, *Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation*, Annals of Mathematics 202 (2025), no. 1, 1–109 (doi 10.4007/annals.2025.202.1.1; arXiv 1912.03657).

The result has **84 items**:

- 2 library items: Dirichlet's unit theorem and group (co)homology, both in Mathlib;
- 8 planned items: CM types (CM.0), existence of CM abelian schemes (CM.2), the dual abelian scheme and H^1_dR (A2, A4), algebraic Hecke characters and their L-functions (L0, AL.1), Deligne's periods (PS.0–PS.1), p-ordinary CM types (L3), the Mahler–Amice transform (PadicMeasuresIwasawaAlgebras L2), and the p-adic avatar with the ray-class Galois group (L0);
- 74 missing items, routed as follows:
  - 52 to a **Part II of AutomorphicPadicLFunctions**, *critical Hecke L-values of totally imaginary fields* (`AutomorphicPadicLFunctionsPartIICriticalHeckeValues`, area `iwasawa`);
  - 13 to a **Part II of AbelianSchemesAndArithmeticModuli**, *the universal vector extension and the completed Poincaré bundle* (`AbelianSchemesAndArithmeticModuliPartIIPoincareBundle`, area `arithmeticgeometry`);
  - 6 as a **source** of SchemeAndStackFoundations SF.2 (equivariant coherent cohomology, supports, local cohomology, derived limits, the Borel construction);
  - 3 as a **source** of ComplexMultiplicationAndExplicitReciprocity CM.0–CM.1 (the Serre construction, the CM decomposition and the period pairings).

Eight mistakes are recorded under `sourceIssues`:

- two sign errors in §3, each verified by an independent computation (E2, E3);
- a sign dropped in the proof of Theorem 5.27 (E6);
- a false nonvanishing claim in Corollary 4.15 and Remark 4.16 (E4);
- four misprints (E1, E5, E7, E8).

Apart from the nonvanishing claim of E4, none of them affects the integrality and algebraicity results of §4.

## What the paper proves

1. **Integrality and algebraicity (Theorem 4.10).**
   - The setting: L is a totally imaginary number field and χ an algebraic Hecke character of L with values in E, of conductor 𝔣 and critical infinity type β − α. (𝒜, ω(𝒜), ω(𝒜^∨)) is an abelian scheme with CM by 𝒪_L, with an 𝒪_L-structure and periods Ω, Ω^∨.
   - Then (α − 1̲)!(2πi)^{|β|}/(Ω^α Ω^{∨β}) · (χ(𝔠)N𝔠 − 1)L_𝔣(χ, 0) ∈ 𝒪_E R[1/(𝔣N𝔠)], with a variant for 𝔣 = 𝒪_L. In particular the normalized value lies in a number field.
   - This covers the fields that contain a CM field without being one. The CM-field case is due to Damerell, Shimura and Katz.
   - Consequences: Katz's conjectured generalization of Shimura's formula (Corollary 4.14), and Deligne's period relation modulo ℚ̄^× (Corollary 4.15).
2. **p-adic interpolation (Theorem 5.27).** For a p-ordinary CM type there is a p-adic measure on Gal(L(p^∞𝔣)/L) interpolating these values, with Katz's local factor and the Euler factors at p. This extends Katz's theorem for CM fields.
3. **The equivariant coherent Eisenstein–Kronecker class (§2).**
   - Let Γ ⊂ 𝒪_L^× and let 𝒟 be an étale torsion subscheme. A function f ∈ 𝒪[𝒟]^{0,Γ} gives a class EK_Γ(f) ∈ H^{d−1}(𝒜 ∖ 𝒟, Γ; 𝒫̂ ⊗ Ω^d). Here 𝒫̂ is the Poincaré bundle completed along the zero section of the dual (Theorem 2.20).
   - Differentiating with the connection of 𝒫̂^♮, specializing at a torsion point, applying the moment map, and capping with a canonical fundamental class (Proposition 2.27) gives numbers Eis^{β,α}_Γ(f, x). These are integral by the refined construction of Theorem 2.30 and Proposition 2.31.
4. **Computation over ℂ (§3).**
   - The class is represented by an explicit current φ with ∇″φ = δ_f vol, built from generalized Eisenstein–Kronecker series (Theorem 3.20, Corollary 3.22).
   - Fibre integration over BΓ turns these into Eisenstein series (Lemma 3.26), and those are partial Hecke L-values (Lemma 4.2). This gives the explicit formula of Theorem 3.27 and Corollary 3.28.
5. **The completed Poincaré bundle.** Four properties are used:
   - functoriality, the splitting principle and comultiplication (§2.2);
   - the identification of 𝒫̂^♮ with the de Rham logarithm sheaf (Scheider, Theorem 2.36);
   - its C^∞ description (Theorem 3.5);
   - over 𝒪_{ℂ_p}, a trivialization on the formal group (Proposition 5.9).
6. **p-adically (§5).** The trivialization turns the class into a function on a formal torus, which is a measure (Proposition 5.20, Theorem 5.22). A translation formula (Theorem 5.23) computes its integrals of locally constant functions through a partial Fourier transform (Corollary 5.25).

## Sources inspected

- **arXiv 1912.03657v4** (14 September 2024, "Final version. To appear in Annals of Mathematics") was read in full.
  - PDF, 85 pages: SHA-256 `fab8e605…c940fbb72`.
  - TeX source: SHA-256 `a1c5d683…dae36f`.
  - The statement numbers were simulated from the TeX counters and matched against every numbered heading of the PDF.
  - **Locators give the arXiv v4 numbering and pages.**
- **The Annals article** is paywalled and could not be read. The journal page confirms the title, authors and pages 1–109, and lists no erratum.
- **Crossref** has no correction or update relation for the DOI.
- **Follow-up papers** were checked for corrections:
  - the authors' survey (arXiv 2511.05198);
  - Gamarra Segovia (arXiv 2606.10626), which uses Corollary 3.28 as printed.
  
  Neither records a correction.
- The DOIs and arXiv identifiers of the prerequisites were checked on Crossref and arXiv.

All sources were accessed on 23 September 2026.

## Mistakes found (`sourceIssues`)

**Two sign errors in §3 (E2, E3).**

- **E2 (Lemma 3.16, pp. 37–38).**
  - The claim: ι_l̃(dι_l̃)^j vol = (−1)^j j!(2πi)^d/vol(𝒜) Σ_ε (l̄/r)^ε ω_ε.
  - The correct sign is (−1)^{j+1}. Each of the j + 1 operations on a factor dz_i ∧ dz̄_i contributes −l̄_i/r_i; the paper's own proof computes both of these factors.
  - Checked by hand for d = 2, j = 1, and by an exact exterior-algebra computation for d = 1, …, 5 and all j.
  - The proof of (c) also turns (−1)^{d−1} into −1, so the printed (c) is correct only for odd d.
  - As a result, formula (3.4.2) of Proposition 3.17 needs an overall minus sign.
- **E3 (proof of Theorem 3.20, p. 41).**
  - The expansion of (π‖l/√r‖² + l̃)^{−(j+1)} omits the binomial sign (−1)^b. So the current that actually solves ∇″φ = δ_f vol carries the prefactor (−1)^{j+b}; Definition 3.15 prints (−1)^j.
  - An independent check for d = 1, n = 1: the TSym^1-component of the equation forces c_1/c_0 = −1/(πl), but Definition 3.15 gives +1/(πl).
- **Reach.**
  - Together, E2 and E3 multiply the representative of Proposition 3.23 and the explicit formulas of Theorem 3.27 and Corollary 3.28 by (−1)^{|β|+1}.
  - Theorems 4.9–4.10 and Corollaries 4.13–4.15 are integrality and algebraicity statements, so they do not see the sign.

**A sign dropped in the proof of Theorem 5.27 (E6, p. 76).**

- Step 1 applies Theorem 3.27 but omits its factor (−1)^{d(d−1)/2}, which the proof of Theorem 4.9 keeps.
- That constant can be absorbed into the measure.
- The χ-dependent factor (−1)^{|β|+1} coming from E2–E3 cannot obviously be absorbed. The result file records this without deciding it.

**A false nonvanishing claim (E4, p. 54).**

- Corollary 4.15 concludes L_𝔣(χ, 0)/c^+ ∈ ℚ̄^×, and Remark 4.16 states Deligne's conjecture with E^×.
- Critical values at the centre can vanish. Take χ = ψ^{−1}, where ψ is the Hecke character of the elliptic curve C: y² = x³ − 25x over ℚ; χ is critical with α = 1̲ and β = 0. Then L_𝔣(χ, 0) = L(C, 1) = 0, because C has root number −1.
- The correct statements are ∈ ℚ̄ and ∈ E. The period relation itself is unaffected.

**Misprints, each with reach "nothing":**

- **E1 (Proposition 3.13, p. 35).** The functional equation should carry e^{2πi⟨w,z⟩}, as the theta transformation in the proof does, not e^{2πi⟨z,w⟩}. Checked numerically. The only later use has z = 0.
- **E5 ((5.6.1), p. 72).** σ(λ)^{μ(λ)} should be σ(λ)^{μ(σ)}.
- **E7 (proof of Theorem 5.27, Step 3, p. 78).** L_{𝔭̄}(χ, 0) should be L_{𝔭̄_Σ}(χ, 0).
- **E8 (Appendix A.1, p. 79).** "each γ ∈ G" should be "each γ ∈ Γ", and Hom_{Γ,𝒪_X}(𝒪_X, 𝒢) ≅ Γ(X, ℱ)^Γ should read Γ(X, 𝒢)^Γ.

## What the atlas and the libraries already have

- **Libraries.**
  - Mathlib has Dirichlet's unit theorem and group (co)homology; these are the two library items.
  - Mathlib also has the following, cited in notes:
    - the divided power algebra and symmetric powers;
    - adic completion;
    - sheaf cohomology on sites;
    - pretriangulated categories and Mittag-Leffler systems;
    - the two-variable Jacobi theta function;
    - Poisson summation on ℝ;
    - the Mahler basis.
  - Neither library has:
    - abelian schemes, their duals or Poincaré bundles;
    - formal groups of group schemes;
    - cohomology of 𝒪-modules on schemes;
    - currents;
    - Hecke L-functions of number fields.
- **Planned in the atlas.**
  - AutomorphicPadicLFunctions:
    - L0: ray-class groups with p-power conductor, the closure of the units, locally algebraic Hecke characters and their avatars;
    - L3: Katz's p-adic L-function for CM fields, including ordinary CM types, level structures and CM periods.
  - AutomorphicLFunctionsAndLocalFactors AL.1: continuation of Hecke L-functions.
  - AbelianSchemesAndArithmeticModuli A2–A5: the rigidified Poincaré bundle, isogenies and Weil pairings, H^1_dR with the Gauss–Manin connection and Serre–Tate, and complex uniformization.
  - ComplexMultiplicationAndExplicitReciprocity: CM types (CM.0) and the reciprocity theorem (CM.2).
  - PeriodsAndSpecialValues PS.0–PS.1: Deligne's periods and critical values.
  - PadicMeasuresIwasawaAlgebras L2: Mahler–Amice for ℤ_p^d.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1: p-divisible groups and Cartier duality.
- **Missing.**
  - The universal vector extension and the completed Poincaré bundle.
  - The logarithm sheaf. The Polylogarithms roadmap treats classical and Zagier-type polylogarithms only.
  - Equivariant coherent cohomology and derived limits.
  - Higher-dimensional Eisenstein–Kronecker series and currents.
  - The Serre construction for higher-dimensional CM abelian schemes.
  - Critical Hecke L-values of fields that contain a CM field without being one, and their p-adic interpolation.

## Routes

1. **Part II of AutomorphicPadicLFunctions** (52 items, area `iwasawa`). It covers the paper's main line:
   - critical types and the Γ-invariants of the coefficient modules (§1);
   - the Eisenstein–Kronecker classes and their integrality (§§2.3–2.6);
   - the computation over ℂ (§3);
   - periods, Theorem 4.9, the distribution relation and Theorem 4.10 with its corollaries (§4);
   - the p-adic construction through Theorem 5.27 (§5).

   AutomorphicPadicLFunctions plans Katz's CM-field case in L3 but nothing beyond CM fields, so this continues that roadmap in its own direction. The brief tells the formalizer to carry the sign corrections E2, E3 and E6 and to fix the orientation and trace conventions explicitly. Its tests are the case d = 1 (including signs) and Katz's CM-field case.
2. **Part II of AbelianSchemesAndArithmeticModuli** (13 items, area `arithmeticgeometry`). It covers:
   - TSym and divided powers;
   - the universal vector extension;
   - formal completions and moment maps;
   - the completed Poincaré bundles and their properties (Theorem 2.8 to Theorem 2.15);
   - Scheider's comparison with the logarithm sheaf;
   - the C^∞ description;
   - the p-adic trivialization (Proposition 5.9, Lemmas 5.11–5.14).

   A2 and A4 stop at the Poincaré bundle and H^1_dR themselves.
3. **Source of SchemeAndStackFoundations SF.2** (6 items). It covers:
   - Grothendieck's equivariant cohomology with its spectral sequences;
   - supports and the localization sequence;
   - local cohomology as a colimit of Ext (SGA 2), with Hartshorne's local Ext;
   - derived limits;
   - the Borel construction.

   These are general sheaf-cohomology statements, which SF.2 owns.
4. **Source of ComplexMultiplicationAndExplicitReciprocity CM.0–CM.1** (3 items). It covers:
   - the Serre construction 𝔞 ⊗ 𝒜 with the isogenies [𝔠];
   - the decomposition of Lie, ω and ℋ under the CM type (Proposition 1.11);
   - the period pairings (Corollaries 1.12–1.13).

   These are the higher-dimensional counterparts of CM.0 and CM.1.

## Judgement calls for the reviewer

- **Part II rather than new roadmap.** The main line extends L3 from CM fields to totally imaginary fields, and it reuses L0's ray-class machinery. A reviewer who prefers a new roadmap can move the 52 items unchanged.
- **Planned, though the paper's version is more general.** Three items are marked planned even though the paper generalizes the planned case:
  - the p-ordinary CM types (L3): the condition is the one on K;
  - Proposition 5.20 (PadicMeasuresIwasawaAlgebras L2): the coordinate-free form of Mahler–Amice for ℤ_p^{2d};
  - the p-adic avatar with the ray-class Galois group (L0).
- **The §1 items routed to the Part II.** The weight decomposition over 𝕋_{L,R} (SGA 3, I, 4.7.3) goes to the Part II. The Tau Ceti ReductiveGroups roadmap treats diagonalizable groups only over a field, and Tau Ceti roadmaps are never re-planned. The Hecke character types, the Γ-invariants and the standard datum also stay in the Part II.
- **E2, E3, E4 and E6 are new findings** and need a reviewer's check. The two computations behind E2 and E3 are described in the result file.
- **Not extracted as items:** the Introduction and the index of notation.

## Prerequisites not yet covered by the atlas

These are listed in the result file with verified links:

- Katz, *p-adic L-functions for CM fields* (1978) and *Another look at p-adic L-functions for totally real fields* (1981);
- Huber–Kings on the polylogarithm and Scheider's thesis on the logarithm sheaf;
- Sprang's two papers on the elliptic case;
- Levin's polylogarithmic currents;
- Mazur–Messing and Laumon on the universal vector extension;
- Grothendieck's Tôhoku paper;
- SGA 2 and Hartshorne's *Residues and duality*;
- Deligne (1979), Blasius (1986) and Kufner (2024);
- Nori (ICM 1994);
- Beilinson–Kings–Levin;
- Bannai–Kobayashi;
- Bergeron–Charollois–García;
- Damerell.
