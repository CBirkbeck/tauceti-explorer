# Review: PAPER-BOXER-CALEGARI-GEE-ETAL-25 (Boxer–Calegari–Gee–Newton–Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms)

Job `REV-PAPER-BOXER-CALEGARI-GEE-ETAL-25` (issue #1347), by Claude Code, session `cc-38267a`, 23 September 2026. The extraction was written by Claude Code, session cc-39fac3. **Verdict: accept**, after the corrections below, which were made in place. All nine routes are accepted.

## What was read

- **The published version** (Forum Math. Pi 13 (2025), e10, open access, 65 pages), read in full. For this download the SHA-256 is b752deb0ec2a129feb6d3e30e04e31c4d3085e3f0862f70a805acbe0b809313b; Cambridge stamps a per-download footer, so the hash differs from the extraction's.
- **The arXiv v3 TeX source**, https://arxiv.org/e-print/2309.15880v3, SHA-256 7f32dbaf7992205af8da121e6b5e21250f180f586ee58b77a17d149a4e5fa835.
  - v3 (27 March 2025) is the last version. It postdates the published text and corrects E2.
- **Method.** Three checkers split the paper: §§1–2, pp. 1–29; §§3–4, pp. 30–44; §§5–7, pp. 44–65. Each compared every item with the page images and the TeX, listed what no item covers, and checked every recorded mistake and looked for new ones. I verified the substantive findings myself, on page images or by computation (see "Mistakes").
- **Libraries.** Every library item was read at Mathlib 082e2d3:
  - `FiniteField.sum_pow_units` (FieldTheory/Finite/Basic.lean:290);
  - `Choose.choose_modEq_choose_mul_prod_range_choose` and `Choose.choose_modEq_prod_range_choose` (Data/Nat/Choose/Lucas.lean);
  - `groupCohomology.exists_div_of_norm_eq_one` (Hilbert 90);
  - `Subgroup.goursat` and `goursat_surjective`;
  - `IntermediateField.LinearDisjoint`.

  All five match the paper's uses.
- **The atlas.** I read, in `data/atlas.json`, the description of every layer cited by a route or a planned item. I also read the briefs of the pending candidates the routes use: PotentialAutomorphyDworkMotivesPartII (PAPER-QIAN-23), PolarizedAutomorphyLifting and AutomorphyLiftingBeyondTaylorWiles.

## Items

**Corrected or annotated: 54 items.** Each item's note says what changed. The material ones:

- **6.** The Bianchi coefficient system is Sym^{k−2}ℂ² ⊗ \overline{Sym^{l−2}ℂ²}, with the complex conjugate, which the item dropped.
- **33.** Remarks 2.5.6–2.5.7 are conditional on the Breuil–Mézard conjecture.
- **53.** E_λ = j^*(F₁ ∗_! ⋯ ∗_! F_n)[n − 1], a pullback, not j_*.
- **80, 83.** Lemmas 5.2.4 and 5.2.6 concern 𝔽_p- and 𝔽_{p²}-valued representations, which their proofs use.
- **86.** Lemma 5.3.3 needs F totally imaginary; it fails for totally real F.
- **98.** Proposition 6.2.3 omitted hypotheses the proof uses: S_aux and S_UA away from X₀ ∪ {v | pr}, the m = 2 disjointness, and the residual-triviality conditions in (15) and (16).
- **105.** The construction of R_aux claimed the image GU_m(𝔽_{p²}), which is false (E29). The second F^avoid is too small (E32).
- **Locators.** Items 16–24 ran about a page late throughout §2.2. Items 5, 11, 15, 26 and 101 were also corrected.
- **Minor.** Items 1, 7, 10–12, 19–21, 29–31, 35, 37, 38, 42, 44, 50, 54, 55, 58, 59, 66, 67, 69, 70, 73, 74, 81, 82, 88, 91, 92, 97, 103, 106 and 107.
  - Item 38 silently corrected a misprint, now E20.
  - Item 55's pointer to CM.4 was wrong: CM.4 concerns CM abelian varieties, and Henniart's theorem is now item 127.

**New: 37 items.** The totals are now 146 items: 5 library, 36 planned and 105 missing.

- **Planned (13):**
  - Kisin's Breuil–Kisin modules (R07.4);
  - peu/très ramifiée classes (R07.5);
  - CHT08's ordinary deformation problem (L7);
  - stack charts and versal rings (R09.4, R09.6);
  - components of completed tensor products (R03.3, R03.6);
  - Kisin's weight-0 rings and the ACC+ rings R¹_v and R^χ_v (L7);
  - Henniart (AG2.0, AF.5);
  - Fontaine–Laffaille reduction of characters (R07.3, R01.2);
  - the Sato–Tate analytic step (ML.3, AN.4);
  - Chebotarev (Tau Ceti Chebotarev Layer 10, AN.4);
  - symmetric powers of compatible systems (PA.5);
  - Bernstein–Zelevinsky irreducibility (ET.6).
- **Missing (24):**
  - route 7: Breuil submodules; the functor T; Liu's strongly divisible modules; multiplicative lifting; Ext¹_{BrMod^cr}; CEGS22b Lemma A.4; the corrected Emerton–Gee realisation; formal smoothness at generic points;
  - route 8: Caraiani–Newton's support propagation; the ACC+ §6.5.12 reduction;
  - route 9: Qian's Hodge–Tate and monodromy inputs; Lewis; the Fermat cohomology; the Poincaré-duality pairing; HSBT10 Lemma 2.2; the m = 2 construction the paper leaves to the reader;
  - route 6: Geraghty's ordinarity criterion; the ρ_{n,m,0} identities; ∼ and ordinarity under Sym and ⊗;
  - route 1: Jacquet–Shalika; the ACC+ inputs of Theorems 6.2.1 and 7.1.1;
  - route 2: big-image bookkeeping; group theory.

**Prerequisites.** Three were added: Kisin 2006, DMOS82 and Lewis 1982.

## Routes

1. **Source of ML.0/ML.2/ML.3: accept.** The p–r switch is a potential automorphy assembly, and PAPER-QIAN-23 routed it the same way.
2. **Source of ArithmeticGaloisRepresentations R01.4/G7: accept.**
3. **Source of ArithmeticGaloisDuality R02.2/R02.4: accept.**
4. **Source of PA.5: accept.**
5. **Source of R23.1: accept.**
6. **Source of L7: accept.** BLGGT14's ∼ stays in L7, as in PAPER-BOXER-CALEGARI-GEE-25. My reviews of PAPER-NEWTON-THORNE-21-B and PAPER-NEWTON-THORNE-26 placed it in PolarizedAutomorphyLifting. L7, the owner of local components, is the better home for a local relation, so those two placements should be moved to L7 by a later fix.
7. **Part II `WeightZeroCrystallineLiftingRings`: accept.** No layer plans Breuil's S-modules with monodromy, the rank-one extension computations, the Emerton–Gee stacks or generic reducedness.
8. **Part II `WeightZeroCrystallineAutomorphyLifting`: accept, kept separate.** The extraction invited a merge with the other two lifting Part IIs, but they are different settings:
   - PolarizedAutomorphyLifting is polarized (definite unitary groups);
   - AutomorphyLiftingBeyondTaylorWiles is conditional lifting over arbitrary number fields;
   - Theorem 3.2.1 is unconditional and unpolarized, and rests on Caraiani–Newton's weight-0 local–global compatibility.
9. **Coalesced PotentialAutomorphyDworkMotivesPartII: accept.** The brief addendum records the corrections the design job must respect: E7, E21–E24, E29, E31 and E32.

## Mistakes in the paper (`sourceIssues`)

**Recorded by the extraction: E1–E13, all confirmed on page images.**
- **E2.** The checkers checked the mathematics. c = φ(ḡ) = ḡ^p is a unit and a p-th power but not 1 in general: E = u² + pu + p gives c = 1 + u^p. The conclusions survive, as arXiv v3 shows.
- **E7.** I re-derived it. V_λ has weight N − 2 and V_{c(λ)} ≅ V_λ^∨(2 − N), so Ψ has weight N − n − 1; a Hodge-number check of the Fermat eigenlines agrees. The correction is now stated without a sign convention: Ψ·c(Ψ) ↔ ε^{n+1−N}.
- **E12.** I re-derived it. From x⁸ = 16, x² = ±2, and −2 is not a square in ℚ₂(√−5).

**New: E14–E32.** The substantive ones, each verified by me:

- **E29 (error, Proposition 6.2.3(13) and the proof of Theorem 6.2.4).** For m > 2, hypothesis (13) asks the image of r̄_{aux,𝔭} to be GU_m(𝔽_{p²}), but (8b) forces its determinant into 𝔽_p^×. GU_m(𝔽_{p²}) contains diag(u, 1, …, 1) with u^{p+1} = 1 and u ≠ ±1, whose determinant is not in 𝔽_p^×. So the proposition is vacuous as printed, and the proof of Theorem 6.2.4 asserts a false image. Only r̄_{aux,𝔭}(G_{F(ζ_p)}) = SU_m(𝔽_{p²}) is needed, which is what Proposition 4.4.2 gives.
- **E30 (gap, Proposition 6.2.3).**
  - A very weakly compatible system is crystalline only outside a density-zero set of primes (Definition 6.1.1).
  - The proof applies Theorem 3.2.1 at 𝔯, which needs r_𝔯 crystalline at v | r, and nothing in (1)–(17) says so.
  - Theorem 6.2.4 supplies it.
- **E28 (error, Lemma 5.2.6).** "Irreducible" must be "absolutely irreducible". Adequacy requires it, and an 𝔽_p-rational induced representation can be irreducible without it.
- **E27 (error in a proof step, Lemma 5.2.6).** A matrix of PSL₂(𝔽_p) with rational eigenvalues has square eigenvalue ratio, so α must be a square, as in Lemma 5.2.4.
- **E31 (gap, Lemma 5.2.4, m = 2).** Disjointness of H_A and H_B does not give disjointness of their Galois closures, which the proof uses.
- **E32 (gap, proof of Theorem 6.2.4).** The second F^avoid = B′F₅ does not contain the field of r̄_aux, so the image over F₆(ζ_p) is not controlled.
- **E23 (gap, Proposition 4.4.2).** In the unitary case the moduli space is empty unless η_i is compatible with the induced pairings on ∧ⁿ, which Definition 4.4.1 does not require.
- **E18, E19 (gaps, Theorem 2.4.3(4)).**
  - E18: as printed, Theorem 2.4.3(4) is vacuous; T must be dense.
  - E19: the cup-product step must discard zero subspaces.
- **E24 (gap, proof of Proposition 4.2.5(1)).** Integrality of Q_v does not follow from Katz–Messing through the Ψ-twist. It holds by a different argument.
- **Misprints:**
  - E14–E17 (§2);
  - E20 (the sign of P_v);
  - E21 (R^{N−2}π_*, not π_*);
  - E22 (places of M, not of ℚ(ζ_N));
  - E25, E26 (grouped slips).

**Not recorded:** several low-confidence doubts that need external texts to settle. Examples:
- the Lubin–Tate sign convention;
- Arthur–Clozel for composite m;
- the totally real case of Theorems 3.2.1 and 7.2.1;
- a few misprints the checkers reported but that I could not locate in the text.

**Published corrections:** only E2, which footnote 2 of the published version acknowledges and arXiv v3 corrects. Crossref records no update for doi:10.1017/fmp.2024.29.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-ETAL-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once, and every planned and route stage id exists in the atlas.
- Lean: none (a review of an extraction).
