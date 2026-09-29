# REV-ClassicalSerreModularity--R27.3 — independent review

Reviewer: Claude Code, session cc-fb70e5 (issue #370; claim comment 5881527733, confirmed by the bot). The work under review is
checkpoint 1 of BP-ClassicalSerreModularity--R27.3 (PR #3858), written by another session, Claude Code cc-39fac3. Date: 2026-09-29.

**Verdict: accepted after corrections.** All 32 nodes were checked (R27.1: 2, R27.3: 4, R27.4: 4, R27.5: 4, R27.6: 3, R33.1: 5,
R33.2: 4, R33.3: 4, R33.4: 2):

- 2 nodes were corrected, both in R33.2, over the dihedral local type at the auxiliary prime N.
- 30 nodes were verified.
- No node was added.

Source issues: E3–E7 were confirmed. Two were added, E8 (Dieulefait–Pacetti) and E9 (Khare–Wintenberger I).

## What was checked

- **Sources.** The four PDFs were downloaded at the cited versions, and every sha256 reproduces the packet's:
  - KW I preprint `results.pdf` (3c389dc3…);
  - Khare–Wintenberger, Annals 169 (154c0c2a…);
  - Dieulefait–Pacetti, arXiv:2108.07577v2 (0c6850da…);
  - Serre 1987, Duke (8048919d…).

  The packet has 90 excerpts, and all were compared with the extracted text:
  - 21 match verbatim after accents and ligatures are normalised;
  - 48 more match by runs of consecutive words;
  - the other 21 were read against the pages, and they differ only by layout (line breaks, sub- and superscripts, ligatures).

  The pages agree with the locators.
- **Closure and baseline.** `check_blueprint --index` (pinned declaration index) gives 0 errors and 0 warnings. The packet cites no
  baseline declarations.
  - All 13 requests were compared with their supplier layers' descriptions in the atlas, and each supplier covers what is asked.
    For example, R24.3 covers prescribed local lifts, R24.6 the change of residual characteristic, R32.5 the Skinner–Wiles p = 3
    branch, R17.5 Langlands–Tunnell, and Tau Ceti Chebotarev layer 10 the density statement.
  - The one Tau Ceti anchor appears only as a request.
- **Statements and proofs.** All 32 statements and proof sketches were read against KW I, KW's Annals paper, DP and Serre, and
  against their prerequisites.
- **Granularity, API and tests.**
  - The three construction nodes carry API and example, non-example and degenerate tests.
  - Each stage has at most 3 planets, 18 in all, and every planet is a theorem or a construction node.
- **Suggested Lean file.** It imports Mathlib only. `lake env lean` against Mathlib 082e2d37e (the pinned 082e2d3) compiles it with no
  errors, both before and after the change below. A probe with a false `Nat.Prime` claim appended was rejected, which confirms the
  check is live.

## Corrections

1. **`R33.2/dihedral-local-type-at-n`.** The node said that the image of τ_N = Ind κ is dihedral of order 2q. This holds only if κ is
   trivial on the Frobenius Art(N) attached to the uniformiser N.
   - Why: κ^{Frob} agrees with κ^N = κ^{−1} on the units, but it takes the value κ(Art(N)) at N. If κ(Art(N)) = ζ ≠ 1, then
     G_{ℚ_{N²}} maps onto µ_q × µ_q (the scalar ζ together with diag(ξ, ξ^{−1})), and the image has order 2q². The projective image is
     dihedral of order 2q in either case.
   - Change: the normalisation κ(Art(N)) = 1 is added to the statement, to the constructor's API entry and as a new characterisation,
     `levelTwoCharacter_artin`.
   - Also added: a proof step computing the image, a non-example test, and the corresponding line in the suggested file's comment
     block.
   - Unchanged: the inertial type, which is all that the consuming nodes use.
2. **`R33.2/dp-lift-existence-and-good-dihedral-insertion`.** The node said that the image of the Paso 2 lift ρ^{(2)}_q on D_N is
   dihedral of order 2q. That image is infinite: det ρ^{(2)}_q = ψχ_q, so det ρ^{(2)}_q(Frob_N) = ψ(N)·N, which is not a root of unity.
   - Change: the statement now gives what holds. The inertial type at N is that of Ind κ, ρ^{(2)}_q(I_N) is cyclic of order q, and
     the projective image of D_N is dihedral of order 2q. This is all that Lemma 2.1 uses, since its hypothesis is stated for the
     inertial type.
   - The node transcribed DP p. 11 (source issue E8).
   - The degenerate test on q = 5 gave the wrong reason and is restated. Dickson's step in Lemma 2.1 needs only that q does not
     divide 12 or 24; q = 5 is excluded by the choice q > 5 in Paso 2.

`R27.4/strong-form-by-minimal-lifts` was verified. Its first hypothesis now cites E9.

## Source issues

- **E3 (misprint), confirmed.** KW I, proof of Theorem 9.1, p. 19. Theorem 5.1(4) is applied at q = 2 to the mod-3 member, so the
  system lifts ρ̄₃. The order-3 type at 2 comes from Theorem 5.1(4) with almost strict compatibility; Theorem 5.1(2) prescribes the
  type at p.
- **E4 (misprint), confirmed.** DP p. 11: |𝔽_{N²}| = N², and the unit group has order (N − 1)(N + 1).
- **E5 (misprint), confirmed.** DP p. 11: the niveau refers to inertia at N; q is the coefficient characteristic.
- **E6 (gap), confirmed.** DP Remark 6, p. 13. A très ramifiée class becomes finite flat over ℚ₂(√x), whose ramification index is 2,
  so "flat over an extension with even ramification index" contradicts nothing. The argument needs KW I's statement that the class
  is flat over no extension of odd ramification index.
- **E7 (gap), confirmed.** DP p. 6 and pp. 12–13. The printed "minimal lift" allows the type at N to change by a tame character of
  p-power order, which exists because N ≡ 1 mod p. At p = 2 this can make the image of inertia at N of even order, which is what the
  proof of Lemma 2.1 excludes. KW I's minimal lifts avoid this.
- **E8 (misprint), added.** DP Paso 2, p. 11 prints: "Take a crystalline lift ρ^{(2)}_q of weight 2 with such a dihedral image of
  order 2q at the prime N".
  - As shown in correction 2, the image of D_N is infinite. The intended condition is the inertial type of Ind κ.
  - The proof of Lemma 2.1 uses "a ramified character of order q" in the same loose way, where only the restriction to inertia has
    order q.
  - New as far as found: the arXiv listing (v1, v2) records no journal reference.
- **E9 (gap), added.** KW I, §3.2 and the Remark after Theorem 3.4, p. 6.
  - KW I derive Theorem 1.2, which gives weight k(ρ̄) and level N(ρ̄), from Theorem 3.4, which gives only modularity. The proof of
    Theorem 3.4 (§8.4) lifts with Theorem 5.1(2), in weight 2.
  - The missing step uses only KW I's own results: Lemma 6.2(i) in the dihedral case, and otherwise Theorem 5.1(1) followed by
    Theorem 4.1. This is the step for the dyadic scalar case, which the introduction (pp. 2–3) says Theorem 1.2(2) fills.
  - The blueprint author noticed the step and supplied it in `R27.4/strong-form-by-minimal-lifts`, but chose not to record it. It is
    recorded here so that formalisers see that the printed proof omits it.
  - The published Invent. Math. version was not compared.

## Remarks for the orchestrator

- **R27.1 placement.** Two nodes are placed under R27.1, which is in the scope of part R26.1: Lemma 8.2 and the good-dihedral
  insertion. They discharge the R26.1 part's recorded remaining item ("the later prime-insertion application … RS-06 places here"),
  as RS-06's narrowed R27.1 allows. The R26.1 coverage record should be updated when the parts are assembled.
- **Gaps that remain.** The packet's three gaps remain recorded:
  - DP Theorem 1.7's second bullet against Skinner–Wiles;
  - the imported lifting theorems, which were not read in their primary sources;
  - KW I Theorems 4.1 and 5.1, which are used as stated, with their proofs in KW II.

  None is resolved by this review.
