# REV-PAPER-CASTELLA-ETAL-22: review of the Castella–Grossi–Lee–Skinner extraction

**Verdict: accept, after corrections made in place.**
- **Routes.** All nine are accepted. The RankOneConverse brief is narrowed.
- **Items.** Twenty-five items are corrected. No status changes.
- **Source issues.** E1–E13 are confirmed, five of them refined. Twenty-eight new issues are added. The most important are:
  - E33: Remark 5.2.4's proportions for 19a3 are unsupported;
  - E34: Corollary D lacks p ∤ D_K.
- **Paper.** Castella–Grossi–Lee–Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*, Invent. Math. 227 (2022) 517–580.
- **Extraction.** cc-39fac3, issue #1286.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The paper.** arXiv 2008.02571v2, whole, the authors' final version. The PDF and TeX source have the SHA-256 recorded by the extraction, and printed pages equal PDF pages. Unpaywall lists only the arXiv copy, and Crossref records no correction.
- **Other texts.**
  - Howard, *The Heegner point Kolyvagin system*, and Mazur–Rubin, *Kolyvagin systems*: for the citations in §3.
  - Bhargava–Klagsbrun–Lemke Oliver–Shnidman (Duke 2019): for Corollary 5.2.3 and Remark 5.2.4.
  - Hida (Ann. of Math. 2010): for item 10.
- **Method.** Three read-only helper agents of this session split the paper:
  - the Introduction and §1;
  - §3;
  - §§2, 4–5.

  They recomputed the §0.3 examples in PARI, as well as the §5 bookkeeping on (123a1)^{(37)} at p = 5 with K = Q(√−359) and Q(√−371). They also re-derived the §3 algebra with small Python checks. The reviewer checked every finding and every correction at the page image or in the text, and re-ran the PARI checks for E1 and E33.

## 1. Items

The extraction is careful: its statements are faithful, and its §3 analysis (E6–E12) is sound. Corrections made in place:

**Definitions and hypotheses:**
- **Item 2.** λ and μ on Λ^ur are defined by Weierstrass preparation over Z_p^ur (E14).
- **Item 9.** (1.4) with the Δ_θ-invariants (E16). The note's D_K ≠ −3, −4 is unnecessary for p split.
- **Item 15.** Gains the §2 standing hypotheses and the normalization 𝒫_w(θ) = 1 − θ(ℓ)ℓ^{−1}γ_w. It also notes that (2.8) is a mod-p identity (E37).
- **Item 16.** Defines S.
- **Item 17.** Defines I_n, G_n, 𝒩 and F(n). The paper never defines F^ℓ or F_ℓ.
- **Item 20.** Says "contains a submodule isomorphic to".
- **Item 21.** Records the bound exp M^{(k)}(1) ≤ ind(κ_1) + 3e, used in §3.3.3.
- **Item 26.** States the §3.2 setting, with D_K prime to Np.
- **Item 30.** Adds p ∤ D_K (E34).
- **Item 31.** Describes the Selmer group H¹_{F_ac} correctly.
- **Item 36.** The subfamily version of BKLOS comes from Thm. 2.1, not Thm. 2.6.
- **Item 38.** Restricted to curves with a twist of good reduction at 3 (E2). The unsupported 41.6%/25% claim is now flagged (E33) rather than asserted.

**Notes:**
- **Item 4.** The introduction's 𝔛_E is §1.4's dual Selmer group.
- **Item 10.** Hida's hypotheses hold here, including p = 3.
- **Item 19.** The Howard and Mazur–Rubin citations are corrected (E22–E24).
- **Item 24.** Control at γ − 1 (E32).
- **Item 25.** C/O_m.
- **Item 37.** The Cassels–Tate step (E39).
- **Item 39.** The (5.7) sign and the torsion (E35–E36).

**Locators.** Items 3, 4, 5, 7, 8, 9, 12, 13, 15, 16 and 31.

## 2. Statuses

Unchanged.
- **Item 1 (library).** Weierstrass preparation over Z_p[[T]]. `PowerSeries.exists_isWeierstrassFactorization`, `IsWeierstrassFactorizationAt` and `Polynomial.IsDistinguishedAt` exist in the pinned Mathlib, together with `IsWeierstrassFactorization.unique`. Extracting p^μ first is routine.
- **Planned items.** Every planned stage id exists in data/atlas.json, and the Tau Ceti Elliptic curves anchor exists. The cited stages plan what the items claim:
  - GZ.9 constructs the BDP L-function;
  - AutomorphicPadicLFunctions L3 constructs Katz's L-function;
  - HE.1 and HE.8 construct Heegner points and classes;
  - L4 covers Iwasawa modules.

## 3. Routes

Every missing item is routed exactly once (11 + 3 + 7 + 1 + 1 + 1 + 1 + 1 + 3 = 29). All nine routes are accepted.
- **Stages.** BSD.7a/BSD.7 name the Eisenstein-prime branch explicitly, and HE.8 refers its Eisenstein case to BSD.
- **Part II candidates.** Both keep the ids, parents, titles and areas already in use:
  - CMAllPrimeMainConjectures, as in PAPER-BURUNGALE-TIAN-26;
  - RankOneConverse, as in PAPER-SKINNER-20.
- **RankOneConverse brief.** Now asks for:
  - Corollary 5.2.3 only via the BKLOS subfamily version;
  - no statement of Remark 5.2.4's percentages;
  - the Cassels–Tate step.

## 4. Mistakes in the paper

**The recorded issues E1–E13 are confirmed.** Refinements:
- **E1.** The replacement 26b1 has rank 0. Its twists by D = 33, 41, 61 (7 inert, root number −1) have analytic rank 1; PARI shows D = 5, 17 give rank 0.
- **E2.** The affected class is every curve with no quadratic twist of good reduction at 3: v_3(j) < 0, or potentially good reduction of type other than I_0^*, such as 27a1 and all j = 0 curves. Even at good reduction, BKLOS Thm. 2.6 as cited counts all twists. The printed citation label is [BKLOS19].
- **E3.** The locator is (0.4), p. 15.
- **E7.** "27 | 3a" should read "81 | 3a". The repair must pair the two larger invariants in the diagonal case; a randomised test found no failure.
- **E8, E11.** Affects "the proof": each printed argument needs a (short) replacement.
- **E9.** The first example could not occur, because d_1(n_j) ≥ length/s(n_j) caps the growth. The reason now refutes the inference itself, and the second example's arithmetic is corrected.

**E33 (error, affects a stated result): Remark 5.2.4.**
- **What the paper claims.** "At least 41.6% of [19a3's] quadratic twists have analytic and algebraic rank equal to 1 and at least 25% have analytic and algebraic rank equal to 0."
- **Where the numbers come from.** BKLOS's figures are for all twists, and they count 3-Selmer rank 1 and algebraic rank 0.
- **Why the paper cannot reach them.** The paper converts these only through Corollary 5.2.2, which needs good reduction at 3 and φ|_{G_3} ≠ 1, ω. 19a3 has rational 3-torsion, so this means χ_d|_{G_3} unramified and non-trivial, i.e. d ≡ 2 mod 3. These twists have density 3/8: PARI gives 0.3751 up to |d| ≤ 3000. So at most 37.5% < 41.6% of twists can be certified.

**E34 (gap, affects a stated result): Corollary D.** Without (spl), p may ramify in K, but Theorem 4.1.2 is proved in the §3.2 setting, where D_K is prime to Np.

**Other gaps:**
- **E14.** λ and μ for 𝓛 ∈ Λ^ur via "an element of Λ generating the same Λ^ur-ideal", which need not exist: T − pζ with ζ ∈ μ_{p²−1} ∖ μ_{p−1}. It is repaired by Weierstrass preparation over Z_p^ur.
- **E32.** Corollary 3.4.2 uses control at 𝔓_0 = (γ − 1) without proof or citation.
- **E19.** The wrong H² is cited in Proposition 1.1.3(ii).
- **E23.** Howard's parity lemma uses his (H.5). The parity holds anyway by a Lagrangian argument.
- **E24.** Mazur–Rubin Lemma 3.5.4 also needs (H.6).
- **E31.** The no-CM reason given for Q(E[p^∞]) ∩ K_∞ = Q.
- **E39.** The Cassels–Tate step for Corollary 5.2.2 with r = 1.

**Misprints:**
- E15: Remark 1.2.3 names the wrong module.
- E16: (1.4) lacks the Δ_θ-invariants.
- E17: G_v/I_v.
- E18: the index set in Proposition 1.2.5.
- E20: "second part".
- E21: typos in the Introduction and §1.
- E22: [MR04, Lem. 2.2.1] does not exist.
- E25: κ_ℓ ∈ H¹_{F(ℓ)}.
- E26: the definition of ind.
- E27: Z_3 should be a preimage.
- E28: m′ ∈ M′, and the missing direction.
- E29: α_𝔓 = Ψ, and lengths in §3.4.
- E30: §§3.1–3.2.
- E35: the sign in (5.7).
- E36: torsion in ĥ(P_K).
- E37: (2.8) is a mod-p identity.
- E38: Σ in §5.1.1.
- E40: the D_K sign convention in §2.
- E41: typos in §§2, 4, 5.

**None changes Theorems C, D (with p ∤ D_K), E or F.**

**Numerical confirmation of the §5 formulas.** Take E = (123a1)^{(37)} (conductor 168387) at p = 5 and K = Q(√−359).
- L′(E, 1)L(E^K, 1)√|D_K|/(‖ω_E‖²Reg) = 2·75².
- (5.5) predicts ord_5 Ш(E/K) = 2, which equals ord_5(Ш_an(E)Ш_an(E^K)).
- Theorem F and the Greenberg–Vatsal rank-zero formula both hold on this example.

**Where corrections were sought.** For every new issue, the extraction's sources (the arXiv versions, Crossref) plus Unpaywall. None was found, so all are recorded as new.

## 5. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CASTELLA-ETAL-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: ok.
- Every missing item is routed exactly once (29).
- No file of this paper contained the reviewer's session id before the review.
