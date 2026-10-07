# BP-HodgeTateAndCanonicalSubgroups--T0 — handoff

Agent: Claude (Claude Code), session claude-NMavRY, 2026-10-07. Refs #755; claim comment 6031356033, confirmed by the bot the same minute. No packet, document or suggested file existed for this part before this job.

## What is done

The packet `research/blueprint/packets/HodgeTateAndCanonicalSubgroups--T0.json` plans layers T0–T5 at target level and has status `complete`. Every stage in scope is `planned`.

- **Size:** 56 nodes: 11 definitions, 12 constructions, 25 theorems, 5 lemmas and 3 comparisons. They carry 129 API items, 78 unit tests and 25 planets (T0 6, T1 1, T2 5, T3 5, T4 3, T5 5).
- **Prerequisites:** 24 baseline declarations, 73 prerequisites on other packets' nodes, 16 stage-level prerequisites (each with a request entry), 9 requests and 4 gaps.
- **Checker:** `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned index.
- **Excerpts:** every excerpt is a literal line of the source text read. A script checked each one against the extracted text (whitespace-normalised).

By layer:

- **T0, 18 nodes.** The local half covers:
  - the conormal module and the finite-level Hodge–Tate map, built on Tau Ceti's `TauCeti.Bialgebra.CotangentSpace` and Cartier duality, with its compatibilities and its p-divisible and completed forms;
  - Fargues's cokernel bound;
  - Fargues's degree (properties, generic isomorphisms, the Harder–Narasimhan filtration, the divisor D_H and the different);
  - the multiplicative Hodge–Tate isomorphism and Pilloni's normalised pullback.

  The boundary half covers:
  - the divisor of an isogeny and δ_H;
  - semi-abelian torsion;
  - the semi-abelian Hasse invariant, its ordinary locus and its extension to the minimal compactification;
  - the toroidal extension of HT;
  - the Raynaud description of the Hodge–Tate filtration.
- **T1, 3 nodes.** The degree-one relative comparison, its graded piece identified with T0's map, and Hodge tensors.
- **T2, 7 nodes.** The Hodge–Tate sequences (p-divisible, abelian, relative), the flag point with its Lagrangian charts, filtered fibre functors of type μ, the PEL and Hodge-type flag conditions, the parabolic reduction P_HT, and M_dR ≅ M_HT.
- **T3, 9 nodes.** Hasse neighbourhoods, the lifting and rigidity lemmas, and weak and strong canonical subgroups. Existence covers all p (Scholze); the HN and HT characterisations need p ≠ 2 (Fargues). Also levels, duality, generic points, quotient radii, the HT map of the dual canonical subgroup, and the Hilbert canonical subgroup.
- **T4, 7 nodes.** Canonical and anticanonical loci, the canonical section, Atkin–Lehner and the Frobenius tower, the coordinate z with cz + d, the balls, and BHW Proposition 5.18 with c_p. A separate node proves the ramified-p case.
- **T5, 9 nodes.** Igusa torsors and their comparison with full level, ω^int and its properties, ω^mod, the modified minimal model, ω^{mod,+}, the AIP torsor, and the AIP–Hodge–Tate comparison.

The reader document `research/blueprint/readmes/HodgeTateAndCanonicalSubgroups--T0.md` (about 28,000 words) is generated from the packet, so the two agree. It adds a hand-written introduction, pinned conventions, layer overviews and acceptance tests per layer.

## Red-team findings handed to this job

- **RT-AREA-padic-1/22.** There is an owners entry naming PerfectoidShimuraVarieties:S3, formerly T2. T2 is narrowed as the finding says: the finite-level sequences, the pointwise flag point, the PEL and Hodge-tensor conditions, P_HT, its Levi torsor and the de Rham comparison. No node plans π_HT on the tower, the 𝒪(1) formula or the Res ℙ¹ identification.
- **RT-AREA-padic-1/23.** The four BCGP-25 4.4.1 items are not planned. A restructure entry repeats the finding's re-routing to TC.2 and BCGP-25 route 22.
- **RT-AREA-padic-1/25.** Caraiani–Scholze items 52, 53 and 143 are not planned in T2. A restructure entry proposes the new FiniteFlat stage after R07.2, importing VB1, VB2:ampleness and VB2:classification, with edges to T2, IG.3 and ET.6a.
- **RT-AREA-padic-1/26.** There is an owners entry naming FiniteFlat R07.2, formerly T0. Ha(G), LF, quasi-polarisations and the BT₁ HT sequence are requested from R07.2, together with the extension of Frobenius and Verschiebung from fields to arbitrary 𝔽_p-schemes. T0 keeps only the semi-abelian and boundary extension (`T0/semi-abelian-hasse-invariant`). A restructure entry lists the edges R07.2 → H2, C6, R15.3 and IG.2.

## Requests

There are nine requests: FiniteFlat R07.2; AbelianSchemesAndArithmeticModuli A2, A3 and A4; PadicHodgeTheory P8; ShimuraCompactifications C5; HilbertModularVarietiesAndShimuraCurves H2 and H4; and PerfectoidSpaces P9. Their exact statements are in the packet. A2–A4, P8, H2, H4 and the R07.2 items are not planned at node level by any packet yet.

## Gaps

1. Illusie's deformation theory of flat commutative group schemes and the co-Lie complex. This is the input to Scholze's lifting corollary, and nothing in the atlas plans it.
2. The p = 2 Hodge–Tate estimates of the dual canonical subgroup (AIP, *Le halo spectral*, Appendix, unread).
3. The Koecher principle and Λ²HT descent for normalised level-p^n models of GSp₄/F, which BCGP use without proof. The same need is requested from C5.
4. The CM-point propagation of Hodge tensors in the p-adic relative setting, cited from AutomorphicBundles B1.

## Restructuring and coordination

- **Restructure entries:** the four findings above; missing stage edges (C5 → T0, D3 → T2, PELModuli M0 → T2, T0 → T3, PELModuli M1 → T4, T2 → T4, PerfectoidShimuraVarieties S0 → T5; T1's 'ClassicalAdicEtaleCohomology C0' should read H0); and a split of T0 into the sub-layers T0:local and T0:boundary.
- **T6 asked T1 and T2 for interfaces.** T1 now pins the twist and weight conventions, through CohomologyComparisons CP.0 and ClassicalAdicEtaleCohomology H0. T2 supplies `T2/filtered-fibre-functor`, `T2/relative-hodge-tate-sequence`, `T2/hodge-tate-parabolic-reduction` and `T2/de-rham-hodge-tate-levi-comparison`. T6's next revision can cite these node ids instead of the stage ids T1 and T2.
- **Cycle avoided.** PerfectoidShimuraVarieties S5 consumes T5, so T5 cites S0's infinite-level tower, not S5's perfectoidness.
- **Boxer–Pilloni.** The author copy read does not contain the det Lie(f) divisor of an isogeny that the paper's route attributes to it. That divisor is planned from Pilloni 2020 §14 and BCGP §6.5.1.

## Source issues

There are 14 new findings, `HodgeTateAndCanonicalSubgroups/E14`–`E27`. E1–E13 belong to the T6 part.

- Fargues 2010: two misprints.
- Fargues 2011: three misprints.
- Boxer–Pilloni: one wrong citation.
- BHW:
  - the reversed inclusion in (7.1);
  - Lemma 7.2, false for g ≥ 2;
  - the level-n congruence overstated in §5.2;
  - the proof of Proposition 5.18 at ramified p, a gap repaired in T4/ramified-period-comparison;
  - the off-by-one m = k + r;
  - a wrong citation.
- BCGP: the truncated degree misprint and the Koecher gap.

Already-registered errata are used in corrected form and not re-recorded: PAPER-SCHOLZE-15/E3, E5, E17 and E25; PAPER-PILLONI-20/E47; and BHW Definition 7.1.

## Suggested Lean file

`research/blueprint/suggested/HodgeTateAndCanonicalSubgroups--T0.lean` **elaborates** with `lean-check` in the shared build at Mathlib 082e2d37e8. It exits with code 0, and its only warnings are 12 `declaration uses sorry`. The shared build has no oleans for the Tau Ceti modules this part needs (AffineGroupScheme, AlgebraicGroup/Tangent), so the typed components are written against Mathlib with the same definitions, and their docstrings name the Tau Ceti declarations to use instead. The typed components are:

- the conormal module (counit-kernel cotangent);
- the finite-level Hodge–Tate map on group-like elements;
- the degree of a cyclic presentation;
- the flag point in `Module.Grassmannian`;
- the automorphy factor and fractional-linear action, with the cocycle law and tests;
- ω^int, ω^mod and the AIP torsor as module-level constructions.

All 56 nodes, 129 API items and 78 tests then appear by name in a generated contract catalogue at the end of the file. 21 of these names have typed components; the rest are marked "not stated" (they need abelian schemes, p-divisible groups or adic spaces).

## Sources

Read: Fargues 2010 and 2011 (author copies); Scholze 2015 (arXiv v2, §III); BHW (arXiv v4, §§2–7); Pilloni 2020 (author copy, §§6, 7, 9, 12, 14); Pilloni–Stroh 2016 (author copy, §1 and App. A.5); Boxer–Pilloni (author copy, §§4.1–4.2, 6.1.8); BCGP 2021 (arXiv v3, §§4.3.6, 6.1–6.2, 6.5.1); Caraiani–Scholze (arXiv v1, §§2, 4.1–4.2); Scholze–Weinstein (arXiv v2); AIP Hilbert (author copy, §§3–4); and AIP Siegel (arXiv v1, §3 and Appendix). URLs and SHA-256 hashes are in the packet.

Not read:
- Bijakowski–Pilloni–Stroh (the publisher served a stub; its use is Fargues's degree, read at the source);
- the Fargues–Genestier–Lafforgue book (used through Fargues 2011 Théorème 2);
- AIP, *Le halo spectral* (gap 2);
- Lan 2017 (gap 3);
- Illusie's thesis (gap 1).

None of the published versions of the arXiv papers was collated.

## Where to resume

The packet is complete and goes to review. Its follow-up work is listed in the coverage `remaining` lists:

- the Siegel domain comparison requested by OverconvergentAutomorphicForms O8 (Diao–Rosso–Wu §3.6, p > 2g);
- the p = 2 dual-canonical-subgroup estimates;
- lemma-level refinements of the semi-abelian Hasse invariant's chart compatibilities;
- confirming that O6 owns the U_𝔭 partial-Hasse improvements.
