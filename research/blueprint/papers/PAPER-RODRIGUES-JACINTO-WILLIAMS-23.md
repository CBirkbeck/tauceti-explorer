# Rodrigues Jacinto–Williams, *An introduction to p-adic L-functions*

*Paper job `PAPER-RODRIGUES-JACINTO-WILLIAMS-23` (issue #4512). Worker: Claude Code, session `cc-e94dc5` (Claude Opus 5.5), with one subagent per section group. Extraction: `PAPER-RODRIGUES-JACINTO-WILLIAMS-23.result.json`, status `complete`.*

## What was read

The version of record: Joaquín Rodrigues Jacinto and Chris Williams, *An introduction to p-adic L-functions*, Essential Number Theory **4** (2025), no. 1, 101–216, DOI [10.2140/ent.2025.4.101](https://doi.org/10.2140/ent.2025.4.101).
- The journal serves it freely at [msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf) (SHA-256 `78d0479b…44a6`).
- It was read in full, including proofs, footnotes and both appendices.
- Locators give the published section, statement number and printed page.

The authors' LaTeX of [arXiv:2309.15692v2](https://arxiv.org/abs/2309.15692v2) (19 December 2024, "To appear in Essential Number Theory") has the same numbering. It was used for formulas and collated at every recorded mistake. The two agree in mathematical content throughout; the only differences are wording and one index, noted at issue E72.

## What the paper proves

These are expository notes on the Kubota–Leopoldt p-adic zeta function and the foundations of cyclotomic Iwasawa theory, for an odd prime p. They give three constructions of ζ_p and show that they agree.

1. **Analytic.**
   - §3 develops p-adic measures, the Iwasawa algebra, Mahler and Amice transforms, pseudomeasures and locally analytic distributions.
   - §4 builds ζ_p from the smoothed Bernoulli measure µ_a (Theorem 4.1).
   - §5 proves the interpolation of L(χ, 1 − k) for every Dirichlet character (Theorems 5.1, 5.7, 5.20).
   - §6 gives Leopoldt's formula for L_p(θ, 1) and Coleman's formula at positive integers.
   - §7 computes the residue at s = 1, and §8 builds the p-adic Eisenstein family.
2. **Arithmetic.**
   - The Coleman map sends norm-compatible local units to measures (§10).
   - It sends the cyclotomic units to ζ_p (Theorem 10.15).
   - The cokernel is Iwasawa's theorem, U_{∞,1}^+/C_{∞,1}^+ ≅ Λ(Γ^+)/I(Γ^+)ζ_p (Theorems 11.9, 12.23).
3. **Algebraic.**
   - The Main Conjecture ch(𝒳_∞^+) = I(Γ^+)ζ_p (Theorem 13.8) is stated and attributed to Mazur–Wiles.
   - It is proved when p is a Vandiver prime (Theorem 13.11).
   - §13.5 and Appendix B survey Selmer groups, Greenberg's conjectures, and modular forms (Kato, Skinner–Urban).
   - Appendix A proves Iwasawa's growth formula e_n = µp^n + λn + ν.

## The atlas already follows these notes

The maintainer's note says the p-adic L-function and Iwasawa roadmaps were built as a formalisation of these notes, and the atlas bears this out. Their layer texts cite "RJW" by statement number: IntegralIwasawaTheory L0 "is RJW Theorem 11.7", and DirichletPadicLFunctions L4's acceptance is "all named results in RJW §§2–8 except Theorem 6.7". Nine blueprint packets already cite the notes, in 1,006 node sources.

Of the **539 items**:

| Status | Count |
|---|---|
| library | 71 |
| planned | 458 |
| missing | 10 |

| Sections | Items | Library | Planned | Missing |
|---|---|---|---|---|
| §§1–2 | 63 | 19 | 42 | 2 |
| §§3.1–3.5 | 65 | 19 | 44 | 2 |
| §3.6–§4 | 54 | 5 | 48 | 1 |
| §5 | 51 | 4 | 47 | 0 |
| §§6–8 | 53 | 8 | 43 | 2 |
| §§9–10 | 80 | 9 | 71 | 0 |
| §§11–12 | 60 | 2 | 56 | 2 |
| §13 | 59 | 4 | 54 | 1 |
| Appendices A–B | 54 | 1 | 53 | 0 |

### In the libraries (Mathlib `082e2d3`, Tau Ceti `f790474`)

Every declaration cited below was opened at the pinned commit, and every one of the 247 cited names resolves in the pinned trees.

**Mathlib** covers the classical inputs:
- the Euler product, continuation, residue and functional equation of ζ and of Dirichlet L-functions;
- ζ(−n) through Bernoulli numbers, in the corrected form of Corollary 2.8;
- Gauss sums and their identities;
- the ideles;
- p-adic Banach-space duals;
- C(G, L) and abstract measures, and Mahler's theorem (`PadicInt.mahlerEquiv`);
- the Amice transform (`amiceTransformEquiv`, for ℤ_p);
- Weierstrass division and distinguished polynomials;
- cyclotomic fields with their ramification and Galois groups;
- the Pontryagin dual.

**Tau Ceti** adds:
- continuous H¹ and the Kummer sequence;
- the Teichmüller lift;
- the augmentation ideal of a finite group ring;
- the Dedekind-zeta Euler product.

Neither library has anything specific to Iwasawa theory: there is no Iwasawa algebra, pseudomeasure, Coleman map, cyclotomic-unit module or p-adic L-function. A case-insensitive search for "Iwasawa" in Tau Ceti finds no file.

### Planned

The 458 planned items are spread over these roadmaps:

| Roadmap | Items | Covers |
|---|---|---|
| PadicMeasuresIwasawaAlgebras | 166 | §3 and the Λ-module theory |
| DirichletPadicLFunctions | 122 | §§2, 4–8 |
| ColemanPowerSeries | 97 | §§10–12 |
| IntegralIwasawaTheory | 86 | its layers L0–L4 cover §§9, 11, 13 and Appendix A |
| SelmerIwasawaCohomology | 34 | §§10.5, 13.5 |
| ColemanIntegration | 32 | §6 |
| LocallyAnalyticDistributions | 32 | §§3.7, 5.3 |
| EulerSystemsCyclotomicMainConjecture | 26 | Theorem 13.8 and Euler systems |

A few items are planned in other roadmaps: ModularIwasawaMainConjectures, KatoEulerSystems, PadicHodgeRegulators, ModularSymbolsPadicLFunctions and Tau Ceti's ProfiniteProPGroups, LocalFieldsRamification, GlobalNumberFields and ClassFieldTheory.

Each planned item's note names the packet node that realises it, or quotes the stage text where no node exists yet.

### Left out, and why

- Nine restatements in §10 of objects defined earlier are not repeated as items: ∂, F_a, µ_a, φ, ψ, 1 − φ∘ψ, the Amice transform, θ_a/ζ_p and D^la. Their §3–§4 items carry them.
- Five survey sentences are not items: those of Appendix B.2.1 (infinite slope) and B.3 (GL(3) and symmetric squares; GL(2n), Siegel and Rankin–Selberg constructions; the elliptic-unit, diagonal-cycle and GSp(4) Euler systems and their reciprocity laws). These sentences only point to the literature and state no theorem. Their papers are listed under `prerequisites` instead.

## The routes

All ten missing items (nine after the review, which found Vandiver's conjecture planned) are small, and each lies in the stated direction of a layer of a roadmap built from these notes. So every route is a **source** route; no new roadmap or Part II is proposed.

A source route also names the planned items that a layer's text covers but its packet has not yet decomposed into nodes. The paper is the natural blueprint source for those nodes.

1. **PadicMeasuresIwasawaAlgebras** (L0, L0a, L1, L2, L3, L5; 21 items). The missing items:
   - Remark 3.6's reflexivity of B* for the weak topology (item 74) and Remark 3.13's unbounded real Haar distribution (item 84), both with L0's duals and bounded measures;
   - the integer topological generator of ℤ_p^× (item 148), L3's change of generator;
   - Lemma 11.2, Λ(Γ)^+ ≅ Λ(Γ^+) (item 369), L1's functoriality;
   - Lemma 11.3, the odd-moment criterion (item 370), L3's positive-moment separation.

   The planned items without nodes are orthonormal bases, the measure–Iwasawa-algebra equivalence, principal augmentation ideals, weight space, and exactness and Nakayama for compact Λ-modules.
2. **DirichletPadicLFunctions** (L0, L2, L3, L4; 29 items). The missing items:
   - the transcendence of L(θ, 1) (footnote 10, item 246), an L0 corollary of Leopoldt's formula, Mathlib's nonvanishing at 1, and Baker's theorem from DiophantineApproximationAndTranscendence:DT.3;
   - the fact that k ↦ p^k is interpolated by no measure (item 285), L4's motivating obstruction, with its hypothesis corrected.

   The planned items without nodes are the idelic dictionary of Propositions 2.9 and 2.11, Theorems 2.15–2.16, 5.1, 5.7 and the branches of 5.20, the §7 residue computation and Theorem 8.2(a).
3. **ColemanPowerSeries** (L0–L4; 26 items). Its L4 ("the end of the proof") has no nodes. The paper supplies:
   - Theorems 10.2 and 10.13, the Coleman map, and Theorem 10.15 with its sign corrected;
   - the Λ(Γ)-linearity of the Coleman map, Theorem 12.17(ii), and Lemmas 12.20–12.22;
   - the splitting C_{∞,1} = ℤ_p(1) × C_{∞,1}^+ that the proof uses without proof, and Theorems 12.23(i) and 11.9.
4. **IntegralIwasawaTheory** (L0–L4; 33 items after the review). These layers are titled after "the notes", and only L0 has nodes (11, in the I.8 packet). No item here is missing: the statement of Vandiver's conjecture (Remark 13.17, item 462) is planned at packet node ArithmeticKTheory:N.7/vandiver-separation, and L3 defines Vandiver(p) and uses it only as a named hypothesis (corrected by the review). The planned items are the Galois-module side:
   - 𝒳_∞, 𝒴_∞ and their Λ-action, the class field theory sequence (13-1), and Leopoldt for ℚ(µ_{p^n}) with its rank corrected;
   - control (Propositions 13.15, A.5–A.8), Corollary 13.16 and Theorem 13.11;
   - Corollary A.13, Ferrero–Washington, and Greenberg's Conjecture A.15, stated for p-parts.
5. **EulerSystemsCyclotomicMainConjecture** (L0, L3, L4; 3 items): the Main Conjecture as known for every prime (§2.2.4), and Definition 10.16 and the Appendix B.3 notion of an Euler system.
6. **ModularIwasawaMainConjectures** (L1, L3, L5; 5 items). Remark 2.3 states three things:
   - the Mazur–Tate–Teitelbaum p-adic BSD conjecture (item 36);
   - Greenberg–Stevens' trivial zeros;
   - Schneider's theorem that the p-adic Main Conjecture implies p-adic BSD when the p-adic height is nondegenerate (item 37).

   L5 is charged to state "the Greenberg and Coates–Perrin-Riou conjectural generalizations from RJW as mathematical propositions with all their inputs", and these statements join it. **Its blueprint imports their inputs: the p-adic height pairing from SelmerIwasawaCohomology, Part II: p-adic height pairings and bi-extensions of cycles (SelmerComplexesAndPadicHeights, accepted in the review of PAPER-DISEGNI-LIU-24), and the Tate period for the ℒ-invariant from Tau Ceti EllipticCurves Layer 4; it defines the ℒ-invariant itself.** (Corrected by the review; the extraction said no atlas layer builds these.) Also named: the Main Conjecture for elliptic curves (§2.2.2) and the Coates–Perrin-Riou existence conjecture.
7. **LocallyAnalyticDistributions** (L3; 3 items): weight space as p − 1 discs, Amice's description of measures on ℤ_p^×, and the Mellin transform of §5.3.

## Mistakes in the paper

**103** mistakes are recorded under `sourceIssues`.

| Kind | Count |
|---|---|
| misprints | 52 |
| errors | 34 |
| gaps | 17 |

| Reach | Count |
|---|---|
| a stated result | 24 |
| the proof only | 27 |
| nothing | 52 |

- **62 records** had been made against these notes by earlier packet workers. Each was re-checked at the published text:
  - They yield 51 confirmed findings. Several records describe the same mistake and are merged, and some are reclassified.
  - 5 are not mistakes: for example, the congruences of Lemma 10.11(iii) are correct as printed.
- **The other 52 findings are new.**
- **No correction has been published.** I searched the journal page, Crossref, the later issues of Essential Number Theory, both arXiv versions and both authors' pages; each finding lists where.

These are the corrections a formaliser most needs. Items use the corrected statements.

- **E57, Theorem 10.15.** From the paper's own definitions, Col(c(a)) = −θ_a·ζ_p. The same sign runs through the seven-step procedure before Definition 10.14 and through the proof of Theorem 12.23 (E76).
- **E49, Theorem 6.7(ii).** The printed right-hand side has the wrong parity. The statement is L_p(θω^{1−k}, k) = (1 − θ(p)p^{−k}) G(θ^{−1})^{−1} Σ θ^{−1}(c) Li_{k,p}(ε_N^c), as in Coleman.
- **E2, Corollary 2.8.** ζ(−n) = −B_{n+1}/(n + 1) is false at n = 0 with B_1 = −1/2. The correct formula is ζ(−n) = (−1)^n B_{n+1}/(n + 1).
- **E45, Lemma 6.4 and §6.2.** These are false for characters of pure p-power conductor (tame part D = 1). Theorem 6.1(ii) remains true through ζ_p.
- **E77, Theorem 13.1 and Definition 13.3.** The µ-part is Λ/(ϖ^{n_i}) for a uniformiser ϖ of O_L, not Λ/(p^{n_i}). Uniqueness of the invariants is needed but not stated (E78).
- **E24, §4.1.** The smoothing integer a must be positive; for a = −1 the function f_a is constant and Lemma 4.2 fails.
- **E20, Remark 3.35.** The character map does not extend to the whole total quotient ring: with p = 3 and χ(x) = 4^x, the regular element T − 3 goes to 0.
- **E60, §10.5.** The printed cyclotomic elements c_m are roots of unity, so the displayed "Euler system" is torsion.
- **E61, §10.5.** The Kummer isomorphisms need p-adic completion, and "inverse limits are exact" is false as stated.
- **E89, Example 13.22.** ∂ⁿζ_p is not in Λ(Γ^+), so read literally Greenberg's conjecture would contradict Theorem 13.8. The correct ideal is Tw_n(I(Γ^+))·∂ⁿζ_p.
- **E91, Conjecture A.15.** "#Cl(F_n) bounded" must be the p-parts.
- **E90, Theorem A.3.** ν can be negative: Λ/(T⁴ − 3) at p = 3 gives exponent 4n − 1.
- **E54, Theorem 8.2(a).** A_0 = xζ_p/2 is not a pseudomeasure; x^{−1}A_0 is.
- **E36, Definition 5.16.** The branch ζ_{p,p−1} has a pole at s = 1, so its domain is not all of ℤ_p.

## For the maintainer: atlas texts that repeat a mistake

These were noticed while checking statuses. They are recorded here, not fixed, since this job edits only its own files.

- **Packet node SelmerIwasawaCohomology:L4/greenberg-conjecture-tate-twists** repeats the claim E89 corrects. EulerSystemsCyclotomicMainConjecture:L3/tate-twisted-selmer-formulation has the correct form.
- **Packet node SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology** uses the torsion c_m of E60.
- **Stage text ColemanIntegration:L3** still quotes the uncorrected Theorem 6.7(ii), although its packet node is corrected.
- **Stage text DirichletPadicLFunctions:L4** calls A_0 = xζ_p/2 a pseudo-measure (E54).
- **Packet node PadicMeasuresIwasawaAlgebras:L4/cyclotomic-weierstrass-polynomials** derives O⟦T⟧ = lim O⟦T⟧/(ω_n) from ⋂ ω_n O⟦T⟧ = 0. That shows only that the map is injective; surjectivity needs completeness for the ω_n-adic topology.
- **Tau Ceti's ProfiniteProPGroups Layer 9** speaks of an "X-adic filtration" where the kernels are (ω_n).
- **The ColemanPowerSeries packet** indexes its level n as ℚ_p(µ_{p^{n+1}}), the paper's K_{n+1}. The item notes flag this where it matters.
- **The DirichletPadicLFunctions packet** builds ζ_p with a = p + 1, which is not a topological generator. It proves the pseudomeasure property without Lemma 3.38. This is a different route, not a mistake, but Lemma 3.38 itself is planned only in stage text.

## Prerequisites the atlas does not cover

`prerequisites` lists 20 entries, with the reason each is needed. None is a paper in `papers.json`.

- **For stated results:**
  - Mazur–Wiles 1984 (the unconditional Theorem 13.8);
  - Rubin's *Euler Systems*;
  - Wiles 1990;
  - Coleman 1982 (Theorem 6.7);
  - Ferrero–Washington 1979 (Theorem A.14);
  - Kato 2004 and Skinner–Urban 2014 (Appendix B);
  - Mazur–Tate–Teitelbaum, Greenberg–Stevens and Schneider (Remark 2.3);
  - Greenberg 1989 and Coates–Perrin-Riou (§13.5);
  - Perrin-Riou 1995 (§10.5);
  - Huber–Kings 2003;
  - Amice–Vélu and Višik, and Pollack–Stevens and Bellaïche (Appendix B.2).
- **The works behind the survey sentences left out above.**

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-RODRIGUES-JACINTO-WILLIAMS-23.result.json`: ok.
- Every planned stage id is an atlas stage id, and every cited packet node id exists.
- Every library citation was read at the pinned commits, and all 247 cited names resolve in the pinned Mathlib and Tau Ceti trees, checked by name and namespace.
- Every source issue was checked at the published text and the arXiv v2 LaTeX. Rendered page images were used where the extracted text was garbled, and small numerical checks were run where a formula was in question (Lemmas 5.5, 5.9, 5.10, Remark 5.3(i) at n = 2, Theorem A.3's example).

## Corrections by the independent review

REV-PAPER-RODRIGUES-JACINTO-WILLIAMS-23 (Claude Code, session `cc-f805bf`, 29 September 2026) made these changes. After them the extraction has 540 items (72 library, 459 planned, 9 missing) and 110 source issues.

- **Source issues.** A `review` verdict is added to each of E1–E103; all 103 are confirmed at their locators in the published text (page images for every formula in question). E60's correction now leads with Rubin's c̃_m, since the smoothed family (ξ_m^a − 1)/(ξ_m − 1) fails Definition 10.16's p-relation at n = 0, and it spells out the multiplicative norm relations.
- **Seven new issues**, E104–E110, all confirmed on page images:
  - E104 (gap): the proof of Lemma 5.10 sums a divergent geometric series.
  - E105 (misprint): Lemma 10.11(iii) works modulo 𝔭_1ℤ_p⟦T⟧ where 𝒪_{K_1}⟦T⟧ is meant.
  - E106 (gap): §12.1, 'fixes 1 ∈ µ_{p−1}, so it stabilises 𝒰_{∞,1}'.
  - E107 (gap): the proof of Proposition 11.5 needs I(Γ) to be principal.
  - E108 (gap): the proof of Corollary 13.16(iii) says 'by definition' where the order of closure and intersection must be exchanged.
  - E109 (misprint): Appendix A defines r_2 as the number of complex embeddings.
  - E110 (misprint): B.2.1 writes v_p(α) for v_p(α_p).
- **Statuses.**
  - Item 147 (principal augmentation ideal of a finite cyclic group ring) is library: Mathlib `Rep.FiniteCyclicGroup.leftRegular.range_applyAsHom_sub_eq_ker_linearCombination`.
  - Item 462 (Vandiver's conjecture) is planned at ArithmeticKTheory:N.7/vandiver-separation, and leaves route 4.
- **New item 540**, the norm compatibility of the cyclotomic unit groups that Definition 11.8 needs. It is planned at ColemanPowerSeries:L4 and added to route 3.
- **Statements.**
  - Item 3: A_0 = xζ_p/2 is not a pseudomeasure (E54).
  - Items 1, 2 and 241: the conventions of E35, E36 and E44.
  - Item 222: the compatible choice of roots of unity in the Gauss-sum factorisation.
  - Item 247: the parity argument no longer repeats the k = 1 slip of E34.
  - Item 262: an integral domain.
  - Items 286–288: a broken sentence.
  - Item 351: stated at finite level.
  - Item 355: the Euler system is Rubin's c̃_m.
  - Item 456: n = 0 is not trivial.
  - Item 489: cites E109.
  - Item 506: finiteness hypothesis.
  - Item 507: p odd dropped; the lemma holds for p = 2.
  - Item 522: in the θ-critical case Bellaïche's function vanishes at classical characters and does not satisfy Theorem B.1's formula.
- **Locators.** Items 140–150 are on printed pp. 130–131, not 131–132. Also corrected: items 242 (Remark 3.47 is on p. 135), 373, 404, 405 (p. 182) and 534 (§13.5.3 is on p. 198).
- **Notes.**
  - Item 446 cited a node that does not exist; it now cites EulerSystemsCyclotomicMainConjecture:L3/cyclotomic-main-conjecture.
  - Dangling 'E/E4' and 'E/E6' references in items 333 and 351 are fixed.
  - Nearest library results are added to items 42, 74, 87 and 369.
  - Item 457 is marked as the same statement as item 500.
- **Routes.**
  - Route 4's reason no longer claims a missing item.
  - Route 6's reason no longer says that no atlas layer builds the p-adic height. The accepted Part II SelmerComplexesAndPadicHeights plans Nekovář's height, and Tau Ceti EllipticCurves Layer 4 has the Tate curve.

