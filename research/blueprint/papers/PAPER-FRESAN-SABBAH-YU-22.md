# PAPER-FRESAN-SABBAH-YU-22: extraction and routing

Issue #1316. Checkpoint by Claude Code, session `cc-7b31c4`; completed by Claude Code, session `cc-442dc5`, on 22 September 2026. The extraction is complete. Nothing is claimed to be formalised, and no Lean file is a deliverable.

Javier Fresán, Claude Sabbah and Jeng-Daw Yu, *Hodge theory of Kloosterman connections*, Duke Math. J. **171** (2022), no. 8, 1649–1747 (doi [10.1215/00127094-2021-0036](https://doi.org/10.1215/00127094-2021-0036); arXiv 1810.06454).

The result has **92 items: 2 library, 10 planned and 80 missing**. Every missing item is routed exactly once, across six routes:

| Route | Target | Missing items taken | Planned items listed |
|---|---|---|---|
| new | `MixedHodgeModulesAndIrregularHodgeTheory` | 25 | — |
| new | `KloostermanMomentsAndPotentialAutomorphy` | 46 | — |
| source | ModularityAndLanglandsExtensions ML.2 | 2 | — |
| source | PadicDifferentialEquationsAndRigidCohomology RD.6, RD.7 | 5 | — |
| source | LefschetzPencilsAndVanishingCycles LPV.2 | 1 | 1 |
| source | ArithmeticGaloisRepresentations R01.2 | 1 | 1 |

Seven misprints are recorded under `sourceIssues`. None affects a stated result.

## What this completion did

The checkpoint read §1, §2.1 and §3.1 at proof level and the rest at statement level. It left four gaps; all four are now closed, with a resolution recorded on each.

**G-PROOFS-4-5.** §§2.2–2.3, 3.2, 4 and 5 were read line by line.

- Twenty-seven new items (66–92) name the inputs those proofs use:
  - the explicit bases, duality and formal structure of Kl₂, and Kl-tilde₂ as a localized Fourier transform (71);
  - Mochizuki's non-degenerate compactifications and the toric compactification X of G_m^k with its blow-ups X̄ and X-tilde (72);
  - the log-pole description of the irregular Hodge filtration, with its E₁-degeneration (73);
  - the closure 𝒦̄ of 𝒦 over Z (74), and the ordinary quadratic singularities of 𝒦 over F̄_p with the quadrics Q_{ap}, Q_{bp} and the non-ordinary point over F̄₂ (75);
  - V_{k,ℓ} (76), the Picard–Lefschetz and discriminant input (77), Illusie's non-ordinary case (78) and the resolution 𝒦' for even k (79);
  - the Fu–Wan and Yun factorization of Z_k(p;T) (80);
  - the local L-factors and conductors (81, 82);
  - the rigid cohomology through 𝒦 (83), Mieda's p-adic Picard–Lefschetz formula (84) and the p-adic comparison theorems (85);
  - Fu–Wan's determinant (86), Serre's gamma factor (87), and the Weil–Deligne and ε formalism (88);
  - Lemma 5.40 (89), the verification of the Patrikis–Taylor hypotheses (90), Serre's semisimplification theorem (91) and T. Saito's sign theorem (92);
  - Weil's bound (66), Katz's monodromy groups (67), Denef–Loeser (68), Katz's projector Π (69) and Matsui–Takeuchi–Sabbah (70).
- Items 45, 47, 49, 51, 53, 54, 59, 61, 62, 63 and 64 were restated exactly.
- In particular, Theorems 5.8 and 5.17 now carry their full statements: the characters ε_a, the Frobenius polynomial on E⁺, and the description of V_{k,ℓ}^{I_p} with the extension E.

**G-APPENDIX-PROOFS.** The appendix's proofs were read. They quote Saito and reprove nothing in his theory, so the decision is recorded in item 11 and in the brief of `MixedHodgeModulesAndIrregularHodgeTheory`. The roadmap builds mixed Hodge modules on smooth quasi-projective varieties to exactly the extent the paper uses:

- the six functors with Saito's weight bounds (4.5.2);
- the localization triangles (4.4.1);
- ψ and φ with can, var and the monodromy weight filtration;
- semisimplicity of pure polarizable objects;
- on curves, rk gr^p_F M = dim gr^p_F ψ M (3.2.1);
- additive convolution and Π lifted to MHM(A¹).

The decomposition theorem and mixed Hodge modules on singular varieties are not used and are out of scope.

**G-SOURCE-ISSUES.** The seven misprints are listed below.

**G-LIBRARY.** The declaration index at Mathlib 082e2d3 and Tau Ceti f790474 was searched. It has no D-modules or holonomic modules, perverse sheaves, Hodge modules, étale or rigid cohomology, nearby or vanishing cycles, Kloosterman sums, Weil–Deligne representations or motives. **Tau Ceti does have pure and mixed Hodge structures:**

- `TauCeti.Hodge.MixedHodgeStructure` in TauCeti/Geometry/Hodge/Mixed/Basic.lean:72;
- polarizations and Tate twists;
- Deligne strictness (`Hom.range_inf_F_eq_map_F`, `Hom.range_inf_WQ_eq_map_WQ`).

So item 2 is now `library`, not `planned`.

**Corrections to the checkpoint.**

- **Item 14** defined EMHS as the objects with no subobject or quotient supported at a point. That is false: j_!Q_{G_m}[1] lies in EMHS and contains i_{0*}Q. It now carries the paper's definition, vanishing global cohomology, equivalently N^H ≅ Π(N^H).
- **Wrong subsection numbers.** Several locators cited §§5.5–5.7, which do not exist; the paper's §5 has subsections 5.1–5.3 with subsubsections 5.1.1–5.1.5 and 5.3.1–5.3.3.
  - Items 6, 8, 61, 62 and 63 were corrected.
  - The route reasons for ML.2 and RD.6/RD.7 were corrected the same way.
  - Item 16 cited A.4 for the irregular Hodge filtration, which is in A.3.
  - Item 43 cited (3.4) for the definition of 𝑴_k, which is (3.1); (3.4) is the pairing.
- **Item 47** wrote j_{0!} where the paper's M-tilde is the inverse Fourier transform of the intermediate extension j_{0!*}.
- **Item 29** had a typo in the range of the symmetric-power sum.
- **Lemma 5.40** is general, so it was split out of item 59 and routed to R01.2.
- **Page locators.** Every locator now carries arXiv v5 page numbers, taken from the compiled PDF.

## What the paper proves

Let p be a prime, ψ a non-trivial additive character of F_p, and for a ∈ F_q^× let Kl₂(a;q) = Σ_x ψ(tr(x + a/x)) = −(α_a + β_a), with α_aβ_a = q.

- The symmetric power moments generate Z_k(p;T).
- M_k(p;T) is Z_k(p;T) with its trivial factors removed.
- L_k(s) is the Euler product of the M_k(p;p^{−s})^{−1}, completed with explicit bad factors and conductors.

**The main results.**

- **Theorem 1.2** (odd k): L_k(s) continues meromorphically and Λ_k(s) = Λ_k(k+2−s).
- **Theorem 1.3** (even k): the same up to a sign ε_k and an unknown local factor at 2.
- **Theorem 1.8**: the mixed Hodge structure H¹(G_m, Sym^k Kl₂) has weights ≥ k+1 and all its Hodge numbers are 0 or 1, with an explicit list. H¹_mid is pure of weight k+1 and equals W_{k+1}.

That every Hodge number is 0 or 1 is the regularity that makes Patrikis–Taylor's potential-automorphy theorem applicable.

**The route.**

1. **Over a finite field (§3.2).** Z_k(p;T) is the characteristic polynomial of Frobenius on H¹_{ét,c}(G_m, Sym^k Kl₂). M_k is its middle part, pure of weight k+1. Fu–Wan and Yun give the degrees and trivial factors.
2. **Over C (§2).** Kl_{n+1} = π_*E^f is the hypergeometric connection. It is the restriction of a Fourier transform of a regular holonomic module, and Thom–Sebastiani identifies H¹_dR of its symmetric powers with isotypic parts of H^{kn+1}_dR(G_m^{kn+1}, E^{f_k}).
3. **Classical mixed Hodge structures (§3.1).** These objects are a priori exponential mixed Hodge structures. After the cover z = t^{n+1} the function becomes t·g, and Theorem A.24 shows they are classical (Theorem 3.2). The middle one is a graded piece of the cohomology of the hypersurface 𝒦 = {g^{⊞k} = 0} (Theorem 3.8), which defines the Nori motive 𝑴_k.
4. **The Hodge numbers (§4).** For n = 1 they come from:
   - the nearby-cycle structure of M-tilde (Proposition 4.20, via Corollary A.31);
   - explicit bases in which the irregular Hodge filtration is read off, by the Newton filtration for odd k and by log forms on the compactification X-tilde for even k (Proposition 4.21).
5. **The arithmetic (§5).**
   - At bad primes the ℓ-adic realizations are computed by Picard–Lefschetz at the ordinary quadratic points of 𝒦 mod p, with the Galois action through the discriminant of a quadric: tame for odd k (Theorem 5.8), unipotent for even k (Theorem 5.17).
   - The p-adic realization is compared with rigid cohomology through Mieda's p-adic Picard–Lefschetz formula (Proposition 5.23). This gives Newton above Hodge, v_p(c_n) ≥ n(n−1).
   - The gamma and ε-factors follow.
   - Patrikis–Taylor applies to the semisimplification.

## Sources inspected

- [arXiv 1810.06454v5](https://arxiv.org/abs/1810.06454v5) (13 June 2022, "Final published version"; v1 15 October 2018, v2 9 December 2018, v3 16 November 2020, a substantial revision after referee reports, v4 21 April 2021).
  - Source archive SHA-256 `1bc77111…f288d44`, containing `kloosterman-revised10_published.tex` (3323 lines). PDF SHA-256 `835580aa…b1f20a`.
  - Read in full at proof level across the two sessions.
  - **Locators give arXiv v5 page numbers.**
- **The published text.** The Project Euclid page of the Duke article is by subscription and its full text was not read; v5 is the authors' final published version.
- **Corrections.** Crossref lists no correction or update for the DOI, and a Crossref search for an erratum found none.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

All seven are new misprints with reach "nothing". None was checked against the Duke typesetting.

| Id | Where (arXiv v5) | Printed | Should be |
|---|---|---|---|
| E1 | §3.2.1, p. 23 | Kl-tilde_{n+1} is the localized Fourier transform of Rg_*Q_ℓ(ζ)_{G_m^{kn}}[n] | G_m^n (g lives on G_m^n) |
| E2 | proof of Proposition 4.20, p. 33 | graded pieces "are the N-tilde^ℓ P_k" | N-tilde^ℓ P_{k−1}: the block has size k |
| E3 | §5.1.1, p. 40 | roots of M_k stable under α ↦ p^{(k+1)/2}α^{−1} | α ↦ p^{k+1}α^{−1} (weight k+1) |
| E4 | §5.1.2, p. 41 | "∂g₁/∂z₁ does not vanish on (z_r)" … "along (z₁⋯z_r)" … "r₁ ⩽ ⋯ ⩽ r_i" | on (g₁) ∩ (z_r); along (z₁⋯z_k); r₁ < ⋯ < r_i |
| E5 | Corollary 5.30, p. 52 | L_k(∞,s) = π^{−ms/2}∏Γ((s−j)/2) | Serre's Γ_V = ∏Γ_R(s−j) is π^{m(m+1)/4} times this; the constant does not affect the functional equation |
| E6 | Example A.3, p. 63 | i^*ᵖQ^H_U = H⁰i^*ᵖQ^H_U ≅ ᵖQ^H_D | i^*ᵖQ^H_U[−1] = H^{−1}i^*ᵖQ^H_U ≅ ᵖQ^H_D |
| E7 | Example A.27, p. 71 | "(tg)_* ∘ i_{𝒦,*} is the zero map" | (tg) ∘ i_𝒦 is the zero map |

**Leads checked but not recorded:**

- **Small typographic slips:**
  - an extra parenthesis in the proof of Proposition 2.4;
  - an unbalanced parenthesis in the proof of Theorem A.24(1);
  - "≤ im(β)^{G,χ}" for "≤ dim im(β)^{G,χ}" at the end of the proof of Theorem 5.17;
  - M₁^H for M^H in the proof of Corollary A.31.
- **Remark 5.28** calls the even-k Hodge polygons "strictly above" the polygon with vertices n(n−1). Figure 1 shows that they meet it at the intermediate vertices.
- **§5.3.1** calls det(ρ) "the non-trivial character" of Q_p(√±k!!), although that extension can be locally trivial.
- **The Picard–Lefschetz sign** (−1)^{k/2} in the proof of Theorem 5.17 was not checked against the conventions of SGA 7. LPV.2 plans that sign table.
- **Checked and found correct:**
  - the dimension formulas;
  - the determinant (k!!)²(−z)^{(k+1)/2} of Lemma 4.17;
  - the Hodge-symmetry bookkeeping in the proof of Theorem 1.8;
  - the discriminants and Legendre symbols in Theorems 5.8 and 5.17;
  - the local factors (5.13) and (5.22);
  - the conductors;
  - the ε-factor exponents (k²−1)/8 and v_p;
  - the a_k, b_k degree identity for p = 2.

## What the atlas and the libraries already have

**Libraries:**

- Mathlib: Dirichlet characters, the Legendre symbol, riemannZeta and Complex.Gamma (item 1). It also has additive characters and Gauss sums, but not Kloosterman sums.
- Tau Ceti: pure and mixed Hodge structures, polarizations, Tate twists and strictness (item 2).

**Planned in the atlas (10 items):**

- nearby and vanishing cycles (LPV.0, LPV.6, R34.3);
- the perverse intermediate extension and duality (EDC.5, EDC.2);
- Weil II (DWP.4, R34.5);
- rigid cohomology with Frobenius and weights (RD.4, RD.6);
- de Rham, semistable and crystalline representations (R06.5);
- weakly compatible systems (PA.5);
- Weil's bound for Kloosterman sums (FiniteFieldsAndCharacterSums FF.2);
- the Picard–Lefschetz formula for ordinary quadratic points, with the discriminant character (LPV.2);
- the p-adic comparison theorems (CohomologyComparisons CP.2–CP.4);
- Weil–Deligne representations and local ε-factors (R01.2, ET.6).

**Missing from the atlas:** everything on D-modules, Hodge modules, exponential mixed Hodge structures and the irregular Hodge filtration; Kloosterman sheaves, connections and their moments; and the specific inputs listed under the routes. The checkpoint's searches of `data/atlas.json` are unchanged.

## The routes

**1. New roadmap `MixedHodgeModulesAndIrregularHodgeTheory`** (area `motives`, 25 items). It holds the general machinery:

- D-modules and the Fourier transform on A¹;
- Saito's mixed Hodge modules, to the scope recorded above;
- exponential mixed Hodge structures and the irregular Hodge filtration, with its Newton and log-pole descriptions;
- the classicality criterion (Theorem A.24);
- the Hodge-theoretic Fourier transform (Theorem A.30, Corollary A.31).

The completion adds Katz's projector Π, Denef–Loeser's comparison of Gauss–Manin systems, the Matsui–Takeuchi–Sabbah weights at infinity, and the Yu / Esnault–Sabbah–Yu log-pole description.

**2. New roadmap `KloostermanMomentsAndPotentialAutomorphy`** (area `motives`, 46 items). It holds the application, from the Kloosterman sheaf and connection to Theorems 1.8, 1.2 and 1.3. The completion adds the explicit n = 1 structure, the toric compactifications, the arithmetic geometry of 𝒦 over Z and F̄_p, the realizations V_{k,ℓ}, the local factors, conductors and ε-factors, the determinant and gamma factor, and the inputs to Patrikis–Taylor. The remaining Broadhurst–Roberts values r_k = ⌊k/6⌋ and ε_k at 2 stay an open boundary.

**3. Source: ModularityAndLanglandsExtensions ML.2** (2 items). These are the Patrikis–Taylor theorem and its corollary: purity, the functional equation and strict compatibility (§5.3.2).

**4. Source: PadicDifferentialEquationsAndRigidCohomology RD.6, RD.7** (5 items):

- the Kloosterman F-isocrystal with Robba's dimension count;
- its middle rigid cohomology expressed through 𝒦;
- Mieda's formula and the semistable model;
- the comparison with the p-adic realization;
- Newton above Hodge.

**5. Source: LefschetzPencilsAndVanishingCycles LPV.2** (1 missing and 1 planned item).

- LPV.2 plans the ordinary quadratic case the paper uses, including the discriminant character. It is listed as planned.
- LPV.2 does not plan Illusie's theorem that the vanishing cycles at a *non-ordinary* isolated quadratic singularity are concentrated in the middle degree. The paper needs that theorem at p = 2 for odd k.

**6. Source: ArithmeticGaloisRepresentations R01.2** (1 missing and 1 planned item).

- Lemma 5.40 says that an ℓ-adic representation whose graded Weil–Deligne representation is pure is itself pure, with the same L- and ε-factors. It is general and goes with R01.2's Weil–Deligne and semisimplification material.
- The Weil–Deligne and ε formalism of §5.3.1 is listed as planned.

**Judgement calls for the reviewer:**

- **Theorem-level inputs in the Kloosterman roadmap.** Items 87 (Serre's gamma factor), 91 (Serre's semisimplification theorem) and 92 (T. Saito's sign theorem) are general theorems. They are routed with the application, their only consumer here. A reviewer may prefer to move them to a general L-function or Galois-representation layer.
- **Weil's bound as planned.** Item 66 is marked planned in FF.2, on the reading that FF.2's "rational exponential-sum bounds via curves" covers x + a/x. The definition of Kloosterman sums and their moments (item 29) stays missing.

## Prerequisites proposed for a later batch

The checkpoint listed 15 entries. This completion adds 21 papers that the proofs of §§3.2–5 and the appendix use:

- Illusie, *Perversité et variation*;
- Mieda, the p-adic Picard–Lefschetz formula;
- T. Saito, the discriminant of even-dimensional hypersurfaces, and T. Saito, the sign for orthogonal motives;
- Fu–Wan (2010), the determinant;
- Robba, symmetric powers of the p-adic Bessel equation;
- Crew, the Kloosterman F-isocrystal;
- Beilinson, the crystalline period map;
- Kedlaya, p-adic Weil II;
- Tsuzuki, the Gysin isomorphism; Le Stum, *Rigid cohomology*;
- Katz, *Gauss sums, Kloosterman sums, and monodromy groups* and *Exponential sums and differential equations*;
- Denef–Loeser; Yu (2014); Mochizuki (GKZ twistor property); Matsui–Takeuchi with Sabbah's appendix;
- Serre (2018) and Serre (1970);
- Deligne (1973, 1979).

DOIs were checked on Crossref, and the two Numdam links were checked directly.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result: 0 problems.
- Every missing item is taken by exactly one route; this was checked in the generator as well as by the checker.
- Every planned stage id was checked against `data/atlas.json` at 1b9d9bc.
- Every library citation was read at the pinned commits.
- The seven misprints were located in the compiled v5 PDF.
