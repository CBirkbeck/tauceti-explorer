# PAPER-GAO-HABEGGER-19: Heights in families of abelian varieties and the Geometric Bogomolov Conjecture

Ziyang Gao and Philipp Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*, [Annals of Mathematics 189 (2019), 527–604](https://doi.org/10.4007/annals.2019.189.2.3); arXiv [1801.05762](https://arxiv.org/abs/1801.05762).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1135). Status: **complete**. The whole of arXiv v3 was read and every missing item is routed once. The machine-readable extraction is [PAPER-GAO-HABEGGER-19.result.json](PAPER-GAO-HABEGGER-19.result.json): 75 items (1 library, 9 planned, 65 missing), 9 routes, 15 prerequisite entries and 17 recorded source slips.

**Source.** arXiv v3 (28 January 2019, the latest version; 64 pages), [PDF](https://arxiv.org/pdf/1801.05762v3), SHA-256 `ffe408dc6ba034b2a635488600decace1e89d61ad04860c391bef9409f2fd34e`, read in full on 2026-09-22. The typeset Annals PDF was not accessible, so locators refer to v3 and the published text was not collated.

## What the paper proves

Let π : 𝒜 → S be an abelian scheme over a smooth curve over Q̄.

- **Theorem 1.4 (height inequality).** For every closed irreducible X ⊆ 𝒜 there is c with h_S(π(P)) ≤ c(1 + ĥ_𝒜(P)) on X*. Here X* is X minus its *generically special* subvarieties: those whose geometric generic fibre is a finite union of (constant part) + (torsion coset). Proposition 1.3 shows that X* is Zariski open.
- **Theorem 1.4′.** The same bound holds with the naive height h_{𝒜,L′}(P) in the middle.
- **Theorem 1.1 (Geometric Bogomolov Conjecture).** Take the function field K of a curve over Q̄, and X ⊆ A with X ⊗ K̄ not of the form B + (Z ⊗ K̄). Then the points of X of Néron–Tate height ≤ ε are not Zariski dense. Appendix A extends this to any algebraically closed constant field of characteristic 0 using Moriwaki heights.

The proof has five parts:

1. **Special subvarieties (§3, Appendix B).** Proposition 3.1 classifies subvarieties with dense V₀(k) × A_tor points. Its inputs are uniform Manin–Mumford, Lang–Néron and the finiteness of étale covers of bounded degree.
2. **Degeneracy (§§4–5).** The Betti map over a curve (Proposition 4.1) is built from an Ehresmann trivialization and holomorphic periods.
   - Monodromy transport along Betti fibres (Proposition 5.4) makes a degenerate subvariety virtually monodromy invariant.
   - Deligne's semisimplicity, the Tits alternative, the Theorem of the Fixed Part and Zarhin's Hodge-generic points supply a rank-two free subgroup of monodromy with no invariants.
   - Semi-rational Pila–Wilkie and Ax's theorem (Lemma 5.2) then give Theorem 5.1: degenerate implies generically special.
3. **Auxiliary variety and lattice points (§§6–7).** A generic linear section Z of complementary dimension has transversal Betti image (Proposition 6.1), and only finitely many of its fibres contain cosets (Proposition 6.9, via a Bézout bound for long intersections, Proposition 6.7). Blichfeldt's theorem counts points of N·b(X) − b(Z) in a lattice (Proposition 7.2).
4. **Degree and height (§§8–9).** These give ≥ cN^{2 dim X} isolated points of X′ ∩ [N]^{-1}(Y) (Proposition 8.1, via auxiliary sets of intersections with torsion translates). Habegger's degree–height lemma then yields h([2^N]Q) ≥ c4^N h(Q) − c′(N) (Proposition 9.1).
5. **Killing Zimmer constants (§§10–11).** Silverman–Tate with N fixed large gives Proposition 10.1, and Theorem 1.4 follows by induction on dim X. Silverman's height limit theorem along the section of a small point then gives Theorem 1.1.

## What the atlas already has

- **Library.** Mathlib has the Weil height on projective space (`Projectivization.logHeight`).
- **Planned.**
  - HeightsRationalPointsAndObstructions RP.0: the height machine, and naive and Néron–Tate heights.
  - RP.5: Manin–Mumford.
  - NeronModelsAndSemistableAbelianVarieties R11.1 (Néron models) and R11.5 (Néron–Ogg–Shafarevich).
  - AbelianSchemesAndArithmeticModuli A5 (abelian varieties versus Hodge structures) and A6 (Poincaré reducibility).
  - GeometryOfNumbersAndQuadraticArithmetic GN.1 (Blichfeldt).
  - LogicAndDefinabilityInNumberTheory LD.6 (the o-minimal structure ℝ_an).

## Routes

1. **Source of HeightsRationalPointsAndObstructions RP.0, RP.1 and RP.5.** The function-field part of the height layers is not planned, so the paper is a source for:
   - heights over k(S̄) and the function-field Néron–Tate height, whose kernel is trace plus torsion;
   - Chow's trace and the Lang–Néron theorem;
   - Silverman's comparison and specialization theorems (Crelle 342, Theorems A and B) and his 2011 estimate for dominant maps;
   - the quartic description of [2] and uniform Manin–Mumford (Theorem 3.2);
   - the David–Hindry stabilizer bound and Bogomolov's degree bound on maximal cosets;
   - Appendix C, a quantitative Brotbek theorem for abelian varieties.
2. **Source of AbelianSchemesAndArithmeticModuli A2 and A6.** It covers Raynaud's projective presentation over a curve, and Grothendieck's theorem extending monodromy-equivariant homomorphisms.
3. **Source of SchemeAndStackFoundations SF.0 and SF.5.** It covers Proposition 6.7 (the degree of the top-dimensional part of any number of intersections is ≤ δ^{n−k}) with Faltings' Lemma 6.8, Bertini through a point, Bézout, conservation of number, and flatness over a curve.
4. **Source of LogicAndDefinabilityInNumberTheory LD.6.** It covers the semi-rational Pila–Wilkie theorem in families (Habegger–Pila, Cor. 7.2) and Ax's theorem giving Ax-type images.
5. **Source of InverseGaloisAndArithmeticFundamentalGroups IG.0.** It covers Lemma B.2: π₁ of a smooth variety over an algebraically closed field of characteristic 0 is topologically finitely generated, so there are finitely many étale covers of bounded degree.
6. **Part II `AbelianSchemesBettiMapsPartII`**, the id of GAO-GE-KUHNE-26 and DIMITROV-GAO-HABEGGER-21. It takes the Betti map over a curve, degeneracy, Theorem 5.1 and its lemmas (5.2–5.6, 5.8), the Tits alternative (no atlas owner), and Lemma 6.2. This paper is the one-parameter predecessor of the Betti-rank theory already in that brief.
7. **Part II `DegeneratingHodgeStructures`**, the id of BAKKER-KLINGLER-TSIMERMAN-20 and BENOIST-19. It takes the local period map (Ehresmann and Griffiths), Deligne's semisimplicity and Theorem of the Fixed Part, and Zarhin's Hodge-generic extendable points. These are theorems about variations, which Tau Ceti HodgeStructures does not cover.
8. **Part II `ArakelovGeometryAndAbelianHeightsPartII`**, the id of YUAN-26. It takes Moriwaki heights over finitely generated fields with their height machine, the Moriwaki Néron–Tate height, and Wazir's Silverman theorems. Yuan–Zhang adelic heights contain these.
9. **Part II `HeightsRationalPointsAndObstructionsPartII`**, the id of YUAN-26, GAO-GE-KUHNE-26 and DIMITROV-GAO-HABEGGER-21. It takes generically special subvarieties, Propositions 1.3, 3.1, B.1 and B.3, and admissible immersions. It also takes the whole height-inequality machine (Propositions 6.1, 6.9, 7.2, 8.1, 9.1 and 10.1, Lemmas 6.3–6.6, 7.1, 8.2 and 9.2–9.4), Theorems 1.4, 1.4′, 1.1 and A.3, and the essential-minimum descent.

No new roadmap id is minted. Every Part II coalesces with a route another paper already proposed.

## Source slips (`sourceIssues` E1–E17)

Two items are genuine gaps. Both have short repairs, and neither affects a stated theorem.

- **E8** (gap, affects the proof): Lemma 5.8's induction on dim 𝒜 is stated for relative dimension ≥ 1. It misses two subcases where the auxiliary abelian scheme has relative dimension 0:
  - in Case 1 with B_s = 0: here Y is a component of 𝒜[N], and [N] works;
  - in Case 2 with B_s = 𝒜_s: here Y = 𝒜, and the zero map works.
- **E12** (gap, affects the proof): Proposition 6.9 applies Proposition 6.7, which is stated for irreducible V_i, to the possibly reducible translates Z_s − [k]σ(s).
  - Expanding the union into irreducible intersections gives ℓ-dependent counts.
  - The repair: Proposition 6.7 holds when each V_i is reducible with total degree ≤ δ, because unions are cut out by products of equations.
  - In the application to Proposition 6.1 the fibre Z_s is irreducible or finite, so only the general statement needs this.

The rest are misprints:

- **E1** Theorem 3.2: "V ∩ ({v} × A)" should be "Y ∩ ({v} × A)".
- **E2** Proof of Proposition 3.1: "S ∖ Z" should be "S′ ∖ Z".
- **E3** Proof of Proposition 3.1: "ψ(v,t) = (v,[N]∘φ(P))" should be "φ(t)".
- **E4** Proof of Lemma 5.2: c₁ = max{2, |γ₁|₂, |γ₁|₂} must bound γ₁^{±1} and γ₂^{±1}.
- **E5** Proof of Lemma 5.2: "γ ∈ G" should be "γ ∈ Γ".
- **E6** Proof of Proposition 5.4: "β" should be "b₁".
- **E7** Proof of Lemma 5.8: "kernel has dimension φ(Y)" should be "dim φ(Y)".
- **E9** Proof of Theorem 5.1: "U ∖ Σ" should be "π(U) ∖ Σ".
- **E10** Proof of Lemma 6.4: "ℝ^{2g}" should be "ℝ^{2k}".
- **E11** Proof of Proposition 6.9: "Z may now longer be irreducible" should be "Z′ may no longer be irreducible".
- **E13** §7: φ_{2j}(w,x) should be φ_{2j}(w,y); δ(z₀) should be δ₀(z₀); z̃_n should be z̃_m.
- **E14** Proof of Lemma 8.2: "(x,y,z)" should be "(w,x,y)"; "ψ_N(w^α,x^α,w^α)" should have y^α.
- **E15** §10.2: "the first inequality in (1.1)" refers to Theorem 1.4′ and h_{𝒜,L′}.
- **E16** Proof of Theorem 11.1: "h_{S′}(ρ(t)) → ∞" and "h_S(t) → ∞" should both be "h_{S′}(t) → ∞".
- **E17** Appendix C: "H⁰(ℙⁿ, 𝒪(d))" should be "H⁰(ℙ^M, 𝒪(d))".

Each slip was checked against the page images of v3. No erratum is listed on the Annals page and Crossref has no correction relation. The findings are recorded against arXiv v3, since the published text was not accessible.

## Prerequisites not yet covered

- Silverman 1983 (Crelle 342) and Silverman 2011.
- Habegger 2013 (Crelle 685), and Habegger–Pila 2016.
- Conrad's trace paper, and Deligne's Hodge II.
- Zarhin 2008, and Tits 1972.
- Scanlon and Raynaud on Manin–Mumford.
- Moriwaki 2000, and Wazir 2006.
- David–Hindry 2000, Faltings 1991, Bogomolov 1981 and Gubler 2007.
- Dimitrov–Gao–Habegger 2021, which generalizes Theorem 1.4 and is already extracted.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAO-HABEGGER-19.result.json`: ok.
- Every missing item appears in exactly one route, and no source route takes a planned or library item. The four briefs are 152–239 words.
- Planned layer ids were checked against `data/atlas.json`. The Mathlib citation was read at 082e2d3 (`NumberTheory/Height/Projectivization.lean:51`). Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.
