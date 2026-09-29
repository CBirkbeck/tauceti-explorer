# Gross–Zagier, *Heegner points and derivatives of L-series*

*Paper job `PAPER-GROSS-ZAGIER-86` (issue #4498). Worker: Claude Code, session `cc-e94dc5` (Claude Opus 5.5), with one subagent per chapter group. Extraction: `PAPER-GROSS-ZAGIER-86.result.json`, status `complete`.*

## What was read

The published paper: Benedict H. Gross and Don B. Zagier, *Heegner points and derivatives of L-series*, Inventiones mathematicae **84** (1986), 225–320, DOI [10.1007/BF01388809](https://doi.org/10.1007/BF01388809).

- **Source text:** the job's link serves the Göttingen Digitisation Centre (GDZ) scan, a 97-page image PDF with no text layer.
- **Prose** was read in GDZ's page OCR.
- **Formulas** were read on the page images at 1,400 px, fetched from GDZ's IIIF server, with zoomed crops where a subscript or bar mattered. The coarser images first rendered from the PDF drop the overbars of complex conjugation. Every mistake recorded below was re-checked at the higher resolution.
- **Locators** give chapter, section, numbered statement and printed page.
- **Later work:** B. Conrad's *Gross–Zagier revisited* (with W. R. Mann's appendix, 2004) was read alongside it. It re-proves Chapter III, and several findings agree with it.

## What the paper proves

Setting:
- f is a weight-2 newform on Γ₀(N);
- K is an imaginary quadratic field of odd discriminant D prime to N, in which every prime dividing N splits;
- χ is a character of the class group.

**The Gross–Zagier formula** (Theorem I.6.3):

L′(f, χ, 1) = 8π²(f, f)·ĥ(c_{χ,f}) / (h u² √|D|),

where c_{χ,f} is the (f, χ)-component of the Heegner divisor class. Equivalently (Theorem I.6.1), the heights ⟨c, T_m c^σ⟩ are the Fourier coefficients of a cusp form g_𝒜, with (f, g_𝒜) = u²√|D|·L′_𝒜(f, 1)/(8π²).

**The proof** computes each side explicitly and compares the results in Chapter V:

| Chapter | What it computes | Main tools |
|---|---|---|
| II | archimedean local heights | Green's functions G_{N,s}, built from Legendre functions, evaluated at Heegner points |
| III | finite local heights | intersection theory on the integral model of X₀(N), Deuring's reduction theory, deformations, explicit Eichler orders |
| IV | Fourier coefficients of a Rankin kernel θ_𝒜·E_s | Rankin's method, holomorphic projection |

**Consequences:**
- **BSD in rank one** (Theorem I.7.3): for a modular E/ℚ with L′(E, 1) ≠ 0, the Heegner point has infinite order and BSD holds up to a rational factor.
- **An analytic-rank-3 curve** (Proposition I.7.4). With Goldfeld's theorem this gives the effective class-number bound h(D) > κ(ε)(log|D|)^{1−ε} (Theorem I.8.1).
- **Higher weight** (Chapter V §4): the weight-2k analogue of the main identity, and the algebraicity conjecture (4.4) for higher Green's functions at Heegner points.

## Coverage

There are **319 items**:

| Status | Count |
|---|---|
| library | 22 |
| planned | 142 |
| missing | 155 |

| Pages | Items | Library | Planned | Missing |
|---|---|---|---|---|
| Chapter I (225–233) | 53 | 7 | 36 | 10 |
| Chapter II §§1–3 (233–248) | 39 | 3 | 19 | 17 |
| Chapter II §§4–5, III §§1–4 (248–258) | 45 | 1 | 26 | 18 |
| Chapter III §§5–9 (258–267) | 34 | 0 | 27 | 7 |
| Chapter IV introduction (267–269) | 3 | 0 | 1 | 2 |
| Chapter IV §§1–3 (270–282) | 48 | 7 | 1 | 40 |
| Chapter IV §§4–5 (282–294) | 37 | 3 | 5 | 29 |
| Chapter IV §6 and Chapter V (294–320) | 60 | 1 | 27 | 32 |

Four items stated twice were merged: a main theorem as announced in Chapter I and as proved in Chapter V, and Proposition III.(4.4) with its proof. The Chapter IV introduction on pp. 267–269 fell between two chunks. It was read at integration and its three items added: the genus-character factorization (0.4), the functional equation of the twisted Hecke L-series, and the genus characters themselves.

### In the libraries

Mathlib `082e2d3` and Tau Ceti `f790474` supply the arithmetic and modular-form background:
- class groups and units;
- genus theory (2-rank and the principal genus theorem);
- newforms and the Petersson product (Tau Ceti's is conjugate-linear in the first argument, the opposite of the paper);
- the Atkin–Lehner main lemma;
- spaces of forms with character, and the trace and U_n operators;
- the Dedekind η function;
- the digamma and ζ constants behind λ_N;
- hyperbolic distance;
- Legendre polynomials;
- Weierstrass quadratic twists.

Neither library has heights on Jacobians of modular curves, Heegner points, Green's functions of X₀(N), Rankin kernels or holomorphic projection.

### Planned

**GrossZagierAndArithmeticHeights** plans 117 of the items. Its layers follow Yuan–Zhang–Zhang's adelic proof on Shimura curves, of which this paper is the classical case. GZ.8 plans the X₀(N) specialisation ("Specialize to X₀(N)"), so the main theorems are planned. Many of the paper's local computations are planned only as a method, in GZ.2, GZ.6 and GZ.7; each such item's note says so.

The rest of the planned items are spread across:
- ModularCurvesPartII (29): the integral model, cusps, Hecke correspondences;
- HeegnerPointEulerSystems (23): Heegner points and their reductions;
- RankZeroOneBSD (20): Theorem I.7.3 and the BSD consequences;
- Tau Ceti's ModularCurves (16) and ModularForms (12);
- AutomorphicSpectralTheory, ComplexMultiplicationAndExplicitReciprocity, AbelianSchemesAndArithmeticModuli (Serre–Tate), and QuadraticFormInvariants.

## The routes

**The classical proof itself is what the atlas lacks.** The Gross–Zagier roadmap names "Gross–Zagier, Chapters II–IV" as a primary source contract, but its layers are written in Yuan–Zhang–Zhang's setting, and no stage plans:
- the Green's functions G_{N,s} or their values at Heegner points;
- the Eichler-order models of Chapter III;
- the Rankin kernel θ_𝒜E_s with its Fourier expansion;
- the explicit coefficient formulas (Theorems IV.5.5–5.8 and IV.6.9).

These fall inside the layers' direction, so the main route is a source route.

1. **Source → GrossZagierAndArithmeticHeights (GZ.0–GZ.3, GZ.5–GZ.8; 212 items).**
   - Chapter II's archimedean heights and Chapter III's finite heights go to GZ.7.
   - Chapter IV's kernel, functional equations and holomorphic projection go to GZ.6. So do the classical analytic inputs that no other layer plans: non-holomorphic Eisenstein series of Γ₀(M) with character, K-Bessel and Legendre functions, Poisson summation over ideal lattices, and the cusps and coset representatives of Γ₀(ND)\Γ₀(N).
   - Chapter V's coefficient identity and corollaries go to GZ.8, the Hecke-algebra pairing argument to GZ.3, and the Waldspurger–Vignéras square statement to GZ.5.
   - The route also names the planned items of those layers, since the paper supplies their classical statements.
2. **Source → ComplexMultiplicationAndExplicitReciprocity (CM.3, CM.5; 4 items):** Deuring's classification and reduction theorems, and Kronecker's congruence for the modular polynomial.
3. **Source → GeometryOfNumbersAndQuadraticArithmetic (GN.3; 2 items):** the theta series of an ideal class, and its modularity in weight one at level |D| with character ε.
4. **Source → AnalyticNumberTheory (AN.1, AN.4; 4 items):** the root number of L(s, ε), the sign of the quadratic Gauss sum, and the class number formula L(1, ε) = πh/(u√|D|).
5. **Source → ModularCurvesPartII (R13.5; 1 item):** the regularity statement Proposition III.(1.4).
6. **Source → RankZeroOneBSD (BSD.5; 2 items):** Conjecture V.(2.3) on torsion dividing the Heegner index, and the N = 11 and N = 65 examples.
7. **New → EffectiveClassNumberProblem, "The effective class number problem after Goldfeld, Gross and Zagier" (area `analytic`; 6 items).**
   - Its items: Proposition (7.4), Goldfeld's theorem, Theorem (8.1), Oesterlé's inequality (8.2), Mestre's conductor-5077 curve, and "the largest |D| with h(D) = 3 is 907".
   - No stage mentions Goldfeld's method, Oesterlé's bound or effective class-number bounds.
   - The brief states the theorems as printed. It imports the Gross–Zagier formula (GZ.8), L-functions and analytic rank (BSD.0, BSD.3), modularity, and Dirichlet L-functions (AN.1, AN.4).
8. **Part II → GrossZagierAndArithmeticHeights, Part II: higher weight, Heegner cycles and higher Green's functions (8 items).**
   - Chapter V §4's Theorem (4.1)/(4.2), Corollary (4.3), Conjecture (4.4), the relations λ, the expansion (4.5) and the numerical examples.
   - The parent roadmap is weight two only. GeneralizedHeegnerCycles builds Heegner cycles for p-adic and Kolyvagin-system purposes, but plans neither their complex heights nor higher Green's functions.
   - The Part II imports Kuga–Sato varieties and Heegner cycles from GH.0–GH.1.

## Mistakes in the paper

**59** mistakes are recorded under `sourceIssues`, every one checked on the high-resolution page images.

| Kind | Count |
|---|---|
| misprints | 41 |
| errors | 12 |
| gaps | 6 |

| Reach | Count |
|---|---|
| a stated result | 6 |
| the proof only | 4 |
| nothing | 49 |

**No correction has been published.** I searched Crossref, Springer's article page and Conrad's re-examination, which records conventions but no erratum. The paper's own self-correction on p. 307 concerns its earlier announcement, not this paper. Items use the corrected statements.

The mistakes a formaliser must know, **none of which changes the main theorems**:

- **E38, the Chapter IV kernel (Proposition 4.5, Theorem 5.8).** The third term must carry σ_𝒜(−n), not σ_𝒜(n). The same term recurs, and is corrected in the items, in §6 (p. 303), Theorem 6.9(ii) (p. 305) and the archimedean height formula of Chapter V §1 (p. 307).
  - Numerical check (Δ, D = −7): with σ_𝒜(−n), the coefficient ratios are exactly τ(2)/τ(1) = −24 and τ(3)/τ(1) = 252, and the known Petersson norm is recovered.
  - With the printed sign the ratios come out as −23.99… and 253.77…, not the coefficients of any modular form.
- **E42, E43, Theorems IV.5.5 and IV.5.6.** Theorem 5.5 needs (2k−2−r)! in place of (2k−2−2r)!. Theorem 5.6 has a spurious factor (k−1)!, which is harmless only for k ≤ 2. Both corrections are confirmed numerically against known Petersson norms.
- **E37, Proposition IV.4.6(b).** It omits hypothesis (4.2), which its proof needs. D = −15, N = 1, n = 7 is a counterexample.
- **E5, Proposition II.(3.11).** It needs the ideals 𝔞₁, 𝔞₂ prime to D. For D = −7, N = 2, m = 3, its count doubles.
- **E21, Chapter III, (7.4), (8.5) and §9.** The class representative 𝔞 must be prime to p, and to 𝔡 for the congruences of (9.3) and (9.8); otherwise the sums depend on the representative. Conrad's Theorem 10.5 carries this hypothesis.
- **Chapter III, (8.1) and p. 264.** These contain two opposite slips that cancel: α is inverted in (8.1), and (N)^u stands for (N)^{−u}. The printed (8.6) is right, and the items record both slips.
- **Chapter II.**
  - The cross-term of (3.5) is wrong as printed: it fails 2,694 of 3,000 random tests, and the corrected form fails none.
  - The Heegner-point labelling (1.3)–(1.5) represents the conjugate point for the branch √D = i√|D|.
  - In (5.6), λ_N + 2κ_N should be λ_N − 2κ_N.
- **Chapter IV introduction (p. 268).** The factor L^{(N)}(2s+2k−1, ε) is written twice for the L^{(N)}(2s−2k+1, ε) of (0.1).

Two errors do not reach a result:
- **The moduli problem of Chapter III §1** is the naive one, which is wrong at the cusps when N is not squarefree.
- **Hom_S** is not independent of the diagrams at points with extra automorphisms. The paper uses only reductions of W-diagrams, where this does not arise.

## Prerequisites the atlas does not cover

`prerequisites` lists 12 works, with the reason each is needed; none is in `papers.json`. Every link was checked on Crossref or Numdam; three entries with no verifiable link are listed by citation only.

- **The class-number application:** Goldfeld 1976 and Oesterlé 1984 (the core of the new roadmap), and Mestre 1985.
- **The N = 1 case and the Chapter II method:** Gross–Zagier, *On singular moduli* (1985).
- **Chapter III:**
  - Gross, *On canonical and quasi-canonical liftings* (1986), for deformations;
  - Deuring 1941, for reduction theory;
  - Eichler's Tata lectures, for Eichler orders.
- **Chapter IV:** Sturm 1980, for holomorphic projection.
- **Chapters I and V:**
  - Gross, *Heegner points on X₀(N)* (1984);
  - Waldspurger 1985 and Vignéras 1981 (Theorem 7.3; the square statement of V §3);
  - Kramer 1981 (the N = 65 example);
  - Hejhal 1983 (the Green's-function normalisation).

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GROSS-ZAGIER-86.result.json`: ok.
- Every planned stage id is an atlas stage id, and every library citation resolves in the pinned Mathlib and Tau Ceti trees by name and namespace.
- Every missing item is taken by exactly one route.
- Formulas behind every recorded mistake were read at 1,400 px. Numerical checks covered the main constants (6.3), (6.5) and (9.2), (3.5), Proposition (3.11), Theorems IV.5.5–5.8, Proposition IV.4.6, and the p. 318 examples (D = −43, −163).
