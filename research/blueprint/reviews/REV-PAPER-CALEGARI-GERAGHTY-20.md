# Review: PAPER-CALEGARI-GERAGHTY-20 (Calegari–Geraghty, Minimal modularity lifting for nonregular symplectic representations)

Job `REV-PAPER-CALEGARI-GERAGHTY-20` (issue #1325), by Claude Code, session `cc-38267a`, 24 September 2026. The extraction was written by Claude Code, session cc-72825f. **Verdict: accept**, after the corrections below, which were made in place. All 27 routes are accepted.

## What was read

- **The published article.** The author copy of Duke's typeset version (Siegel.pdf, 96 pages, SHA-256 fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5), the extraction's file.
- **arXiv.** The TeX sources of the main text (1907.08691v1, CGMay2019.tex) and of the appendix (1907.08694v1, CGAppendixMay2019.tex), the only versions.
- **Method.** Eight checkers split the published pages: 800–813, 814–824, 825–836, 837–846, 847–858, 859–873, 874–884 and 885–896. Each:
  - compared every item and every recorded mistake in its range with the rendered page images and the TeX;
  - opened every cited declaration in Mathlib 082e2d3 and Tau Ceti f790474;
  - read every cited layer description and reviewed decomposition node, and searched the atlas for the missing items.

  I re-derived the substantive new findings in the TeX myself (E158–E161, E163) and the neatness observation (TeX ll. 855–880).
- **Sources the items depend on.** Checkers read:
  - Yamauchi, arXiv:1410.7894 v1 and v5 (the theta operators behind E95, E115 and E125);
  - the CG18 text and its reviewed extraction, where CG20 quotes CG18 (§§2–3 and Theorem 6.4);
  - the arXiv v1 wording of the appendix for the Ogus attribution.

  Harris–Lan–Taylor–Thorne, Mok, Arthur's classification and Lan–Suh were not read. The items that rest on them say so.

## Items

**Corrected: 66 items.** Each item's note says what changed. The material ones:

- **The Hasse-power surjections** (reduction-to-high-weight-by-hasse-power, thm-6-17-construction-of-r-m). The target is now the quotient by the annihilator of the β- or (α,β)-part (E160), and the idempotent follows E59's correction.
- **Definition 6.15 and the Taylor–Wiles labelling** (katz-modular-of-nonregular-weight, assumption-7-1-taylor-wiles-primes). η is nonzero (E158); α_xδ_x = β_xγ_x is imposed, not deduced (E159).
- **Theorem 7.11's bound** (thm-7-11-balanced) is p > a − 2 (E161).
- **The operators at p** (formal-q-expansion-operators-U-p, ext-tilouine-Tp-Up-congruences, ext-hasse-commutes-with-Up-operators). They are flagged with E52 and E53: T₂/p^{k+j−6} is not p-integral for j ≥ 4, and the (3, 3) congruence fails.
- **Neatness.** assumption-4-2-neatness and neatness-for-surjective-rbar record that Assumption 4.2 follows from H1: σ acts trivially on ad⁰r̄ and ε(σ) ≢ 1, so r̄(σ) is scalar. Hypothesis (5) of Theorem 9.1 is therefore redundant given (3).
- **§§7–9.**
  - lemma-7-6-H1-mod-varpi no longer cites a gap that nothing records; the reverse induction closes.
  - trace-map-and-dQ keeps only what is planned.
  - lemma-8-24 is mod p with j > 2 (E164).
  - sec-8-8-conclusion is restated.
  - thm-9-1-patching-datum, thm-9-1-step-a-diamond-operators and thm-9-1-conclusion-from-patching: the dual Selmer notation and the second clause of Proposition 3.3(a) are fixed, and H ≠ 0 is required.
- **Appendix.**
  - weight-one-adjoint-selmer-congruences gains minimality (E139).
  - hecke-completion-is-O-for-large-p reads W(k_m).
  - def-siegel-threefold-coherent-setup: π: A → X against Ω¹_{A/Y} (E165).
  - The Lan–Suh quotation and the Ogus attribution are corrected.
- **Library.** ext-group-theory-SL2-PGL2 was split. Mathlib at the pin has Matrix.SL2.commutator_eq_top and Matrix.ProjectiveSpecialLinearGroup.rank_two_simple, so SL₂(F_p) perfect and PSL₂(F_p) simple is the new library item sl2-perfect-psl2-simple. Only the automorphism and quotient statements stay missing.

  Notes now point to further library coverage the extraction missed:
  - Tau Ceti's Matrix.SpecialLinearGroup.map_intCast_zmod_prod_surjective (fourier-coefficient-gamma-bar-equivariance);
  - legendreSym.card_sqrts (ext-zeros-binary-quadratic-form-mod-p).
- **Other statements.**
  - ext-local-tate-duality lost 'of order prime to char'.
  - harish-chandra-parameterization pins w₀ to the paper's swap (E10).
  - socle-reduction-to-residue-field is restricted to the algebra its declarations give.
  - section-8-standing-setup-siegel-threefolds lost two statements recorded elsewhere as missing.
  - strata-Y-Z-S-notation's rejected sentence was replaced.
  - doubling-unramified-plane-from-alpha-and-beta-lines speaks of a submodule, not a summand.
  - Several claims are marked as the extraction's inferences: example-mod2-torsion-class-jacobian, hasse-multiplication-injective-prime-to-p-equivariant, base-change-surjectivity-high-weight.
- **Planners.**
  - The five R03.5 items now name the reviewed node DeformationAndDerivedPatchingAlgebra:R03.5/balanced-modules-and-module-patching.
  - def-weyl-groups-and-action-on-characters names ReductiveGroups L7 (LieGroups L6 is compact groups).
- **Names, locators and cross-references.**
  - formal-identity-Z2-equals-UZ-equals-ZU was renamed to what p. 859 prints.
  - The [56]/[58] Pilloni citations are fixed (E156).
  - There are five locator fixes and several dangling cross-references in notes.

**New: 18 items.** The totals are now 415 items: 6 library, 82 planned and 327 missing.

- **Library (1):** sl2-perfect-psl2-simple.
- **Planned (4):** each against a layer description that was read.
  - the torsion of a Weil restriction as an induced module (AbelianSchemesAndArithmeticModuli A6);
  - E[p] finite flat at good reduction (A3);
  - Galois representations for GL₂ forms and Hecke characters (AutomorphicGaloisRepresentations R19.1, R19.3);
  - crystalline versus étale Frobenius, Katz–Messing (PadicDifferentialEquationsAndRigidCohomology RD.7, CohomologyComparisons CP.2).
- **Missing (13):**
  - route 1: Theorem 1.2, Assumptions 6.12(2)/6.16, the non-simple-generic case of Proposition 6.8, the injectivity of the secondary Hasse invariant on S, and hypothesis (6) of Theorem 9.1 for a ≥ 4;
  - route 2: irreducibility of Sym^n under SL₂(F_p);
  - route 3: "π contributes to coherent cohomology" and the isotypic decomposition;
  - route 4: the large-p finiteness step of Lemma A.5;
  - route 5: endomorphisms of a semistable abelian variety over Q are defined over Q;
  - route 8: r̄ ≇ r̄ ⊗ ε̄;
  - route 9: the image of an induced r̄ over Q(ζ_{p^m});
  - route 15: the archimedean transfer to GL₄(R), and the unitary descent of Lemma 6.9.

## Routes

1. **New `GSp4NonregularModularityLifting` (area langlands): accept.** Nothing in the atlas does GSp₄ modularity lifting.
   - The reason's addendum records E158–E161 for the design job.
2. **Part IIs `SiegelModularFormsModPn`, `IntegralCoherentHeckeComplexes`, `AdjointSelmerGroupsFromModularityLifting` and `OpenImageTheoremsForAbelianVarieties` (routes 2–5): accept.** Each area is a galaxy id, and each brief is well over 60 words.
3. **Joined Part IIs (routes 3, 6 and 7): accept.** These share ids with CG18's routes. `research/blueprint/make_queue.py` appends one `DESIGN-<id>` job per route and does not merge same-id routes across papers, so the maintainer merges each pair of design jobs.
4. **Sources of existing layers (routes 8–27): accept.** The review added items to routes 8, 9 and 15.

## Mistakes in the paper (`sourceIssues`)

**Recorded by the extraction: E1–E156, without E124, which the extraction withdrew.** Each was checked at its locator on the page image and in the TeX. **146 are confirmed and 9 rejected.**

- **Rejected as duplicates (7).** In each case the mistake is confirmed in the entry named:
  - E39 is in E49;
  - E46 is E44(ii);
  - E47 is E40(2);
  - E69 is in E70;
  - E106 is E105;
  - E117 is E116;
  - E120 is in E119(2) and E90.
- **Rejected on the mathematics (2).**
  - E75: its headline 'not co-Cartesian' is withdrawn by its own correction. Its two real points are E76 and E77, and its reason contradicts the confirmed E72.
  - E104: 'U² − TU + ⟨p⟩ = 0' is the standard Hecke-polynomial notation.
- **Scope.** Parts that duplicated other entries are noted in the verdicts:
  - E7: its part (2) is E6;
  - E11: its K_{1,∞} remark is E12;
  - E14: its re-fixes are E13 and E15;
  - E21: its last sentence is E26;
  - E27: its part (b) is E29;
  - E33: its item 2 is E32;
  - E60: its closing paragraphs are E61;
  - E121: its trailing remark is E119(1);
  - E125: it overlaps E95.
- **Kind.** E17 is an error, not a misprint (exp(N₃) needs 1/6 while §4 allows p = 3), and it affects nothing.
- **Reasons corrected in the verdicts.**
  - E4: point (4) and the type-H example are withdrawn;
  - E36: three weight slips;
  - E57: λ(−I) = −1;
  - E58: the O/ϖ^m image, per E160;
  - E72: 4^{−#Q} can be ≡ 1;
  - E73: Klingen, not Siegel;
  - E91: determinant versus discriminant;
  - E107: its example is out of range;
  - E115: its weight-(j, 2) fix contradicts E95, and θ₁∘Z ≡ 0 is the route;
  - E125: 'cannot be closed' is overstated;
  - E139: the S₃ defence is withdrawn, and a misquote fixed;
  - E142: §9.5;
  - E145: §7.2;
  - E152: Theorem A.1;
  - E155: the page prints '(81)'.

**New: E157–E165.** One affects a proof, and I checked it and the other substantive ones in the TeX myself.

- **E160 (gap, the proof; proofs of Theorems 6.13 and 6.17, pp. 843, 846).** The paper's Hasse-power map gives "T_{μ′}(Q)^β_𝔪 ↠ T_μ(Q)^β_m/I_{μ,m}", where I_{μ,m} annihilates the whole space H⁰(X_1(Q), ω(a,b)(−∞)_{O/ϖ^m}).
  - T_{μ′} acts on the image of e′_β∘A^s, so its image is T^β/J, with J the annihilator of the β-part.
  - e_β is not in T_μ(Q), so the image of I can be strictly smaller than J. A toy example: T = O[t] on (K/O)³, t = diag(0, ϖ², ϖ), e = diag(1, 1, 0), m = 2.
  - Repair: use J throughout. The inverse limit still recovers T^β_𝔪, and no stated result changes.
- **E158 (Definition 6.15(2), p. 844).** η = 0 satisfies the printed condition, so η must be nonzero.
- **E159 (pp. 841, 845, 846).** "isotropic, and hence α_xδ_x = β_xγ_x" is wrong as stated. With four distinct characters, isotropy of ⟨α, β⟩ allows either pairing. The relation must be imposed, as §4 does on p. 815.
- **E161 (Theorem 7.11, p. 853).** "p − 2 > a" should be p > a − 2. Read literally, the printed bound excludes a = p − 2, which Theorem 9.1 needs.
- **The rest are misprint groups:**
  - E157 (§4: the duals of E[p] are the finite flat ones; 'Q ∪ {p}'; Π(x)^+);
  - E162 (§§8.6–8.7);
  - E163 (con lands in ⊗ det², by central characters);
  - E164 (Lemma 8.24's hypotheses; S(r̄) for S; the undefined f);
  - E165 (the appendix: Harris's affiliation, the Ogus attribution, π: A → X, 'discriminant').

**Not recorded:** low-confidence doubts the checkers could not settle. Among them:
- whether 'conjugate' in Assumption 4.3 is over k. If it is, type U2 splits into two classes, according to whether the binary form ω(x, Ny) is split or anisotropic;
- whether Lan–Suh (Theorem 5.1) applies to X_{K_1(Q)} as constructed;
- the scope of Lemma 8.8 for a = 3;
- Theorem 5.6(1)'s appeal to [9, Theorem 3.2.1] for non-tempered π_∞;
- Theorem 6.13 when T_μ(Q)^β_𝔪 = 0. The item adds the hypothesis;
- the irreducibility of r_f|G_F in Lemma 6.9;
- the vanishing order of the Koblitz section along Z (Theorems 8.10–8.11);
- the identification in the proof of Theorem A.4 with the localisation at m ∩ T^Q;
- the "2.7.1" numbering in Ogus.

**Published corrections:** none. Crossref for doi:10.1215/00127094-2019-0044 still has no update-to or updated-by record (re-checked 24 September 2026).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-20.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once, item ids are unique, and every Part II area is a galaxy id from `data/galaxies.json`.
- Every changed item carries a review note, and every source issue carries a review verdict.
- The result file keeps main's serialisation (one-space indent), so the diff shows only the review's changes.
- Lean: none (a review of an extraction).
