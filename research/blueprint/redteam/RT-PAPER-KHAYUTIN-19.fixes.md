# RT-PAPER-KHAYUTIN-19: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4982, job FIX-RT-PAPER-KHAYUTIN-19).

- **Findings:** `RT-PAPER-KHAYUTIN-19.result.json`.
- **Verdicts:** `RT-PAPER-KHAYUTIN-19.review.json`, by Codex, session codex-a71f92. All eleven findings are
  confirmed. This job applies the seven the issue lists: four high (/1–/4) and three medium (/5–/7). The four low
  findings are not part of it. Among them, /8 is the missing `sourceVersions`; `check_errata.versions_checked`
  already reported it before this fix. Where the verifier corrected a fix, I applied its version.
- **Files changed:**
  - `papers/PAPER-KHAYUTIN-19.result.json`;
  - `papers/PAPER-KHAYUTIN-19.md`: a pointer at route 3 and a new closing section.
- **Result:**
  - 125 items (2 planned, 123 missing);
  - six routes;
  - 27 prerequisites (13 before);
  - 40 source issues (34 before).
- **Independence.** I did none of:
  - the extraction (cc-7b31c4);
  - its review (cc-39fac3 with cc-7b31c4);
  - the red team (cc-f805bf);
  - the verification (codex-a71f92).
- **What I read.** I re-fetched the arXiv v3 source archive; its SHA-256 d76399f1… is identical to the
  extraction's. From it I read:
  - the bibliography (`joint_cm_arxiv_v3.bbl`) for every new prerequisite;
  - §2.3 (line 599);
  - §10.4 (lines 4408, 4438, 4454).

  I checked each DOI I cite against Crossref. Linnik's book has no DOI there, so its entry has no link.

## /1 (high): Lemma A.6's dyadic clause

- **Item 104's p = 2 clause** now reads, with t = ord₂ 𝔣:
  - Nr Λ₂^× = Nr O_{E₂}^× if t = 1 and E₂/Q₂ is unramified (split included) or 4 ∥ d_E;
  - 1 + 4Z₂ if t = 2 and E₂ is unramified;
  - 1 + 8Z₂ otherwise.

  This is the verifier's formulation.
- **Independent check.** I computed Nr(Z₂ + 2^t O_E)^× modulo 64 for all eight quadratic étale Q₂-algebras and
  t = 1, 2, 3.
  - The corrected clause holds in all 24 cases.
  - The printed clause fails exactly when 8 ∥ d_E with t = 1, and when 4 ∥ d_E with t = 2.
- **Item 119** now says μ_wild depends on t and ord₂ d_E, not on whether 2 ramifies. D = −16 and D = −32 show it:
  2 ramifies in both, yet μ_wild is 1 and 2.
- **New source issue E35** (error, affects a stated result, known new). It records that Corollary A.7's formula,
  Proposition A.10, Lemma A.14 and Definition 8.6 use the index only abstractly and still hold.

## /2 (high): Propositions 9.25 and 9.26

- **Item 87** now has ρ_Q(k₀k₁l; k₁k₂). Proposition 9.25's hypothesis is now (R_max/k₀)^{θ_l} ≤ (A(E)/k₀²)^{1−3η}.
- **E36** (Proposition 9.26: error, affects a stated result) uses the verifier's witness l = 2 mod 3: Q = x² + 3y²
  has (1,1) on the left side, while ρ_Q(2; 3) = 0.
- **E37** (Proposition 9.25: gap, affects the proof) uses the verifier's integral witness: A = 10¹², R = 10⁷,
  k₀ = 10⁵, θ_l = 3/4, η = 1/10.
- **What still holds.**
  - Proposition 10.10 already uses the corrected density, so §10 is unaffected.
  - Proposition 9.26's own hypotheses give the repaired curvature condition.
  - The separate repair E25 stands, as the verifier asked.

## /3 (high): Lemma 8.33

- **Item 74:** the ratio is p₁^{2n} if n = 0 or a ∉ K_{p₁}, and (1 + p₁^{−1})p₁^{2n} if n ≥ 1 and a ∈ K_{p₁}. It
  always lies in [p₁^{2n}, (3/2)p₁^{2n}].
- This follows the verifier's correction at n = 0, where the two subgroups coincide.
- **E38** (error): Theorem 8.7 holds with a changed constant, and the bound used on p. 219 still has the needed
  direction.

## /4 (high): the reduced norm on double cosets

- **Item 8:**
  - "locally compact abelian groups", where print says compact;
  - the double-coset norm map is a bijection in both signatures, because −1 ∈ Q^×;
  - neither G(A)/G(A)^+ nor A^×/A^{×2} is compact.
- **Item 123**, following the verifier:
  - The volume bound at p. 254 argued from compactness of the fibres of ctr. Those fibres are isomorphic to
    G(A)/G(A)^+ and are not compact.
  - It now uses §7.2's volume definition. Conjugation by ξ₁ preserves Haar measure on G(A)^+, so the volume is
    m_{G(A)^+}(Ω ∩ cΩc^{−1})^{−1} with c = ctr(ξ), and factors through ctr(ξ).
- **E39** records the index-2 error (§2.3 p. 162 and the proof of Proposition 3.6 p. 172). It affects nothing,
  because Proposition 3.6 uses only ker(χ_{E₀}∘Nrd).
- **E40** records compactness as an error that affects the proof. It sits at p. 162 and at its use on p. 254 with
  footnote 11, as the verifier required, not as an innocuous misprint. I quote the printed text from the arXiv v3
  source, lines 599 and 4408.

## /5 (medium): Duke's theorem

- **New item 125,** "Duke's theorem for toral packets on [G(A)] (Linnik's form)", is missing and routed to route 1
  after item 27. It states:
  - G = PB^×, with (♠): the archimedean CM normalization and a fixed prime p₁ split in every E_i;
  - |D_i| → ∞, with periodic probability measures;
  - conclusions: tightness, and G(A)^+-invariant probability limits.
- **Locator:** p. 176. **Uses:** Corollary 3.5 (p. 171), Lemma 4.7 and Theorem 4.4 (p. 178), and Lemma 10.1
  (p. 238).
- **Its note** bridges to the Duke-type equidistribution at GN.4 routed by PAPER-DUKE-IMAMOGLU-TOTH-16. For B = M₂
  it imports that split input, without re-proving it.
- **Also changed:** the notes of items 1 and 27 point to item 125. Route 1's brief lists item 125 as an imported
  statement. Linnik [Lin68] is a new prerequisite.

## /6 (medium): the prerequisites and the overlap of ranges

- **Huxley's `why`** now gives the overlap condition, (2 − θ_l^{−1})/3 < 1/(2 + 2/(1 − θ)). It says the condition
  fails at θ_l = 2/3, θ = 1/2, where both sides are 1/6, and that either of two alternatives closes it:
  - Huxley's θ_l ∈ (131/208, 2/3) with θ = 1/2. At 131/208 the left side is 18/131 < 1/6.
  - A bound θ < 1/2 (Shahidi, Luo–Rudnick–Sarnak) with θ_l > 2/3 close to 2/3.

  Following the verifier, these are recorded as alternatives, not as simultaneous prerequisites.
- **Fourteen new prerequisites,** each with its `why`. Siegel and Gelbart–Jacquet are named in the paper's text but
  have no bibliography entry; for them I cite the standard references, verified on Crossref. The others are taken
  from the paper's bibliography:
  - Linnik [Lin68];
  - Siegel (1935);
  - Conrey–Iwaniec [CI00];
  - Landau [Lan18];
  - Gelbart–Jacquet (1978);
  - Shahidi [Sha88];
  - Luo–Rudnick–Sarnak [LRS99];
  - Clozel–Ullmo [CU04];
  - Clozel–Oh–Ullmo [COU01];
  - Sarnak [Sar91];
  - Burger–Sarnak [BS91];
  - Jacquet–Langlands [JL70];
  - Margulis–Tomanov [MT94];
  - Einsiedler–Lindenstrauss [EL10].
- **Route 1's brief** now plans more of the assembly:
  - the large-norm range (item 123);
  - the small-norm range (item 124): the EMV argument with Linnik's basic lemma for one-sided Bowen balls, the
    Hecke norm gap from θ and Jacquet–Langlands, Siegel's ineffective bound and the maximal-entropy bootstrap;
  - the overlap lemma, with its two alternative closing inputs: Huxley via GN.4 (route 5), or θ < 1/2 imported from
    the atlas's automorphic roadmaps.
- **Notes updated:** items 95 and 124.

## /7 (medium): genus theory for orders has one owner

- **The move.** The genus block (items 101–107, 119, 120) moves from route 3 (HE.0) to a new route 6: part-ii
  MultiquadraticPartII, with parent Tau Ceti Multiquadratic, joining PAPER-DUKE-IMAMOGLU-TOTH-16 route 10 under
  the same title and area.
- **Route 6's brief:**
  - extends the built maximal-order theory to arbitrary quadratic orders, with the corrected dyadic case;
  - imports the built declarations and proves the restriction to 𝔣 = 1 through the narrow-to-ordinary adapter;
  - imports orders and Picard groups from HE.0 and GlobalNumberFields L11, and Hilbert 90;
  - gives the D = −16/−32 tests.
- **Route 3** keeps items 10–15, 36, 37 and 114. The verifier noted that the finding's "keep only" list dropped the
  local-different items 36 and 37. Its reason is rewritten.
- **Near misses** (PROTOCOL §1) are cited per item, as the verifier required, not as exact specializations. I read
  each at Tau Ceti f790474.
  - Item 102 cites `TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one` (TwoRank.lean:155).
  - Item 106 cites `isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` (PrincipalGenus.lean:150) and
    `genusCharFun` (GenusCharacter/Basic.lean:212), with the adapters it needs.
  - Item 119 cites the 2-rank theorem.
  - Item 104 cites none: as the verifier noted, its non-maximal clause has no f = 1 case. Its note says no pinned
    declaration computes local norm groups.

**For the maintainer:** record a verdict for route 6 in `PAPER-KHAYUTIN-19.review.json`. This job may not edit that
file, and make_queue applies a route only once it has a verdict.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KHAYUTIN-19.result.json`: ok. Every missing item is
  routed exactly once.
- `source_issues.check_issues` on the 40 entries: no errors.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON keeps the file's own formatting (indent 2, UTF-8).
- The published Annals text was not read by me. Its page quotations are the red team's and the verifier's, and the
  same wording appears in the arXiv v3 source I re-read.
