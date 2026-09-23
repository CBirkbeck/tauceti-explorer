# PAPER-SHANKAR-SHANKAR-TANG-ETAL-22: Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields

Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, [Forum Math. Pi 10 (2022), e21](https://doi.org/10.1017/fmp.2022.14); arXiv [1909.07473](https://arxiv.org/abs/1909.07473).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1393). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.result.json](PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.result.json): 97 items (4 library, 4 planned, 89 missing), 9 routes, 24 prerequisite entries and 6 recorded source issues.

**Source.** The published open-access PDF (49 pages), SHA-256 `11fbb97a4f7a9e651ea90e249974493aacabf6472daecc0737463c4f64e06d28`, read in full on 2026-09-22.

- Locators are journal pages.
- arXiv v3 (29 August 2022) is marked as the final version.
- Bruinier–Kühn's Theorem 4.11 (arXiv:math/0204100v2, pp.27–28) was also read, to check Lemma 5.3.

## What the paper proves

**Theorem 1.1.** Let X be a K3 surface over a number field with a smooth projective model over O_K, after a finite extension. Then ρ(X_𝔓̄) > ρ(X_K̄) for infinitely many 𝔓.

Consequences:
- **Corollary 1.3.** With potentially good reduction everywhere, X_K̄ has infinitely many rational curves, unless X has infinitely many supersingular reductions.
- **Theorem 1.4.** Abelian surfaces over O_K have infinitely many geometrically nonsimple reductions.
- **Theorem 1.6.** The Kuga–Satake factors B of Assumption 1.5 have infinitely many geometrically nonsimple reductions.
- **Corollary 1.7.** Unitary (r, 1) abelian schemes acquire CM elliptic isogeny factors at infinitely many primes.

All of these come from **Theorem 1.8** (and its refinement **Theorem 2.4**, with m ∈ D·□). Let M be the GSpin Shimura variety of a maximal even lattice of signature (b, 2), b ≥ 3, with its AGHMP integral model. Then a Hodge-generic point Y ∈ M(O_K) reduces into some special divisor Z(m) at infinitely many primes.

The proof compares the two sides of the arithmetic height h_Ẑ(m)(Y) = Σ_σ Φ_m(Y^σ) + Σ_𝔓 (Y.Z(m))_𝔓 log|O_K/𝔓|, summed over m ∈ D·□ in a dyadic range.
1. **The global height (§3).** Howard–Madapusi Pera modularity makes the height −(c(m)/2)h_ω(Y) + O(m^{(2+b)/4+ε}), so O(m^{b/2}).
2. **The archimedean term, first step (§5).**
   - Bruinier's explicit formula gives Φ_m = φ_m − b′_m(k/2), with b′_m(k/2) ≍ m^{b/2} log m (Bruinier–Kühn, local densities).
   - It also gives φ_m = A(m, x) + O(m^{b/2}), where A(m, x) = −2Σ log|Q(λ_x)| (Heath-Brown and Niedermowwe counts).
   - The resulting uniform diophantine bound is Theorem 5.8.
3. **The archimedean term, second step (§6).** A(m) = o(m^{b/2} log m) outside a set of logarithmic density 0. This uses the circle method for the main term, and a pigeonhole lemma with Theorem 5.8 for the singular term.
4. **The finite places (§7).**
   - The local multiplicity is Σ_n #{v ∈ L_n : Q(v) = m} for the shrinking lattices L_n of special endomorphisms mod 𝔓^n.
   - Their structure (Proposition 7.3), successive minima and local-density bounds give Σ_{m ∈ S_{D,X}} (Y.Z(m))_𝔓 = o(X^{(b+1)/2} log X).
5. **The contradiction (§8).** If only finitely many primes contribute, the sum over m is ≍ −X^{(b+1)/2} log X, against O(X^{(b+1)/2}).

§7.3 adds an illustrative transcendental point with exponential intersection numbers. §9 derives the applications.

## What the atlas already has

- **Library, Tau Ceti.** Integral lattices, dual lattices, the discriminant group, evenness and signature. Also the order isomorphism between even overlattices and isotropic subgroups of the discriminant form, which is the paper's maximality criterion.
- **Library, Mathlib.** Clifford algebras with their Z/2-grading and even part, the Gauss hypergeometric function ₂F₁, and Gamma.
- **Planned.**
  - PELModuli M1/M5: the unitary moduli M(r, 1).
  - AbelianSchemesAndArithmeticModuli A4: Serre–Tate and Grothendieck–Messing.
  - NeronModelsAndSemistableAbelianVarieties R11.1: the Néron mapping property.
  - SchemeAndStackFoundations SF.5: the Hodge index theorem.
- **Not in the atlas or the libraries.**
  - GSpin Shimura varieties and their integral models, Kuga–Satake, special endomorphisms and special cycles.
  - Borcherds–Bruinier Green functions and arithmetic modularity.
  - The height-counting argument, and K3 surfaces.

## Routes

1. **Part II of ShimuraVarieties: `OrthogonalIntegralModelsAndKugaSatake`** (21 items).
   - PAPER-CHARLES-16 proposed this candidate for good-prime orthogonal models and the Kuga–Satake map. This paper adds material in the same direction:
     - AGHMP's all-prime normal model (Proposition 2.1);
     - special endomorphisms, including those of p-divisible groups (Definitions 2.2–2.3), and Madapusi Pera's Tate-class isometries;
     - the stacks Z(m), Lemma 7.2, Proposition 7.3 and Lemma 7.10;
     - the interfaces used by the applications: Siegel threefolds for b = 3, Assumption 1.5, van Geemen, δ_0, the split example, and the unitary-to-orthogonal map.
   - ShimuraData D5's examples and the integral-model candidate `ShimuraVarietiesHondaTatePartII` do not cover GSpin data, Kuga–Satake or special cycles.
2. **Part II of GrossZagierAndArithmeticHeights: `GSpinSpecialDivisorHeights`** (42 items).
   - GZ.6–GZ.7 plan arithmetic generating series, Green functions and local intersection identities for CM cycles on Shimura curves. This Part II does the same for GSpin Shimura varieties:
     - the Weil representation ρ_L, Green functions and arithmetic divisors, heights and (3.1);
     - Theorem 3.1, E_0 and c(m), Proposition 3.2;
     - the lattice counts of §4.3 and all of §§5–6;
     - the counting half of §7, Theorems 2.4 and 1.8, and Theorems 1.4 and 1.6 and Corollary 1.7;
     - the illustrative §7.3.
   - The brief builds in the corrections E1–E3.
3. **New roadmap `K3SurfacesAndSymplecticBoundedness`** (5 items). PAPER-CHARLES-16 proposed this K3 roadmap. It takes the transcendental GSpin datum of a K3 surface, André's Kuga–Satake results, Theorem 1.1, Li–Liedtke's criterion and Corollary 1.3.
4. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.3** (9 items): the local-density package of §4.1 and Lemma 7.9. These are general statements about maximal lattices of rank ≥ 5.
5. **Source of GN.1 and GN.4** (3 items): successive minima, Minkowski's second theorem, and the Eskin–Katznelson/Schmidt lattice-point count.
6. **Source of ExponentialSumsAndCircleMethod ES.3 and ES.4** (6 items):
   - singular integrals and series;
   - Heath-Brown's weights, Theorem 4 and Corollary 1;
   - Niedermowwe's count;
   - Corollary 4.7.
7. **Source of QSeriesPartitionsAndMockModularForms QM.3** (1 item): vector-valued harmonic Maass forms and Bruinier's Hejhal–Poincaré series.
8. **Source of FaltingsFinitenessAndIsogenyTheorems R28.4** (1 item): Tate's isogeny theorem over finite fields.
9. **Source of AnalyticNumberTheory AN.2** (1 item): Mertens's first theorem, and Σ_{p | N} log p/p ≤ log log N + O(1).

## Source issues (`sourceIssues` E1–E6)

- **E1** (gap, affects the proof). This concerns b odd.
  - **The problem.** Lemma 5.3 and Proposition 5.2 are proved only for m with m/D a square: the proof uses that d_0 is independent of m. But Theorems 5.7 and 5.8 are stated for all m. Theorem 5.8 is then applied to arbitrary integers: to M = Q(λ) in Proposition 6.4 and to m = a_1(n)² in Lemma 7.6.
  - **Repair.** In Bruinier–Kühn's Theorem 4.11 (r odd), the d_0-dependent terms are log|4m/D_0²| − 2L′/L(χ_{D_0}, 3/2 − κ). By the functional equation these equal log m + 2L′/L(χ_{D_0}, κ − 1/2) + O(1). That derivative is bounded, since κ − 1/2 ≥ 2, so Lemma 5.3 and Proposition 5.2 hold for every represented m.
  - For b even there is no gap.
- **E2** (error, affects the proof of the §7.3 example).
  - **The problem.** The approximation gaps e^{e^{p^n}} do not give property (2) of Lemma 7.11, N_i ≥ e^{e^{D_i}}. The approximating sublattice has discriminant D_i ≥ x_n^{2c} ≥ p^{2cn}.
  - **Fix.** Use gaps of length exp(exp(C·p^{2c(n+1)})).
  - The example is not used for the main results.
- **E3** (misprint).
  - In §9.2, dim B = 2^n should be 2^{n−1}. For b = 3, B is an abelian surface and A^+ ~ B^4 has dimension 8.
  - The proof of Theorem 1.6 calls ker(s_B − [Dm]) "a nontrivial simple factor"; it is a proper nonzero abelian subvariety, not necessarily simple.
- **E4** (misprints).
  - The proof of Lemma 7.2 ends with a stray ".here".
  - In Lemma 7.11(2), L_{n_i} should be L_i.
  - In the proof of Theorem 7.1, three displays have ⌊e log_p X⌋ for ⌊(e/4) log_p X⌋.
- **E5** (harmless slips in estimates).
  - In the proof of Proposition 5.5, the N = 1 term (log N)^{−A} has log 1 = 0 in a denominator.
  - Lemma 6.3 has T² for (2T)².
  - In Proposition 6.4, the explicit constant 14 fails for b ≥ 5, though any constant depending on b works.
- **E6** (misprint). The printed title of [MST22] omits "over function fields".

**Also checked and correct:**
- Lemma 4.11 and Lemma 4.14, rederived.
- The factor 2 in c(m) = −2(2π)^k m^{b/2}Πμ_p/(√|L^∨/L| Γ(k)). It matches the constant term 2𝔢_0 of E_0: for U² ⊕ E_8 the formula gives −1008σ_5 = 2 × (−504σ_5).
- Corollary 4.3(1), by brute force for x_1x_2 + x_3x_4 + 3x_5² mod 27.
- The bound |z^kG(k/2, z) + (b/2)log(1 − z)| ≤ C on [1/2, 1), numerically.
- The split example of §9.2, by Hilbert symbols for b = 3, 11 and several d, with b = 5, 7 as controls. d is not specified in the paper.
- The counting and pigeonhole arguments of §§6–8, and the proof of Theorem 7.1 over S_{D,X}.

Crossref records no correction notice or update relation.

## Prerequisites not yet covered

- AGHMP18 and AGHMP17 (AGHMP18 is queued as #1143).
- Howard–Madapusi Pera, and Bruinier's Lecture Notes.
- Bruinier–Kühn, Bruinier–Kuss, Borcherds 1998, Bruinier–Yang.
- Madapusi Pera 2015 and 2016, and Kisin 2010.
- Heath-Brown 1996, Niedermowwe, Hanke.
- Eskin–Katznelson and Schmidt.
- Shankar–Tang and Charles 2018.
- Tayou 2020, André 1996, Li–Liedtke.
- Kudla–Rapoport 2000, van Geemen.
- BHKRY and Kudla–Rapoport 2014, and Sarnak.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item.
- Stage ids were checked against `data/atlas.json`, the accepted restructures and `data/roadmap-retirements.json`:
  - RS-07 touches AnalyticNumberTheory but keeps AN.2 as a supplier;
  - no other cited stage is restructured or retired.
- Library citations were read:
  - Tau Ceti `TauCeti/LinearAlgebra/IntegralLattice` at f790474: Basic.lean:61, Dual/Basic.lean:75, Discriminant/Group.lean:109, Even.lean:65, Signature.lean:81, Overlattice/Isotropic.lean:254 and :343;
  - Mathlib at 082e2d3: CliffordAlgebra Basic.lean:74, Grading.lean:32 and :111, Even.lean:54; OrdinaryHypergeometric.lean:71 and :81; Gamma/Basic.lean:287.
- Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.

## Review (REV-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1394), **accepted** this
extraction and all nine routes, with one correction in place. The full record is
[REV-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.md](../reviews/REV-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.md).

**Correction — provenance.** The SHA-256 recorded in `readSections` cannot be reproduced: the
Cambridge Core PDF is stamped per download, and two downloads seconds apart gave `c444920f…` and
`2897a064…`, neither equal to it. The same behaviour was documented for another Cambridge PDF in
`REV-PAPER-HE-18`. A `sha256Note` records the evidence and points to the DOI as the stable citation;
the content is unaffected and matched at every locator checked.

97 items, all 89 missing routed exactly once; all stage and planned layer ids exist; all fifteen
library declarations resolve at the pins; all 45 numbered environments are carried into items; 63 of
70 locator checks land exactly, the rest being proofs on later pages than their statements. Both
Part II titles reproduce their parents' atlas titles exactly and both ids are already proposed by the
sibling extractions; the new roadmap's id appears in no other extraction.

All six findings are **confirmed**. E3 is decided by the paper's own example (the Kuga–Satake variety
of dimension 16 with `C⁺(V) ≅ M₄(Q)` forces `dim B = 2 = 2^{n−1}`), E5 by the display itself (the
`N = 1` term has `log 1 = 0` in a denominator), and E2 and E4 are printed as quoted, `.here`
included. For E6 the corrected title is confirmed from Crossref; the printed side rests on the
extraction's reading, since the reference pages do not come through the reviewer's extraction.
