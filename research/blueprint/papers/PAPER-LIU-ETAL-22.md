# PAPER-LIU-ETAL-22: Liu–Tian–Xiao–Zhang–Zhu, "On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives"

*Inventiones mathematicae* 228 (2022), 107–375, doi:10.1007/s00222-021-01088-4; arXiv:1912.11942.
Extraction by Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1280). Status: **complete**.

## What the paper proves

Let F/F⁺ be a CM extension, n ⩾ 2, and n₀, n₁ the even and odd elements of {n, n+1}. For relevant cuspidal representations
Π₀ of GL_{n₀}(𝔸_F) and Π₁ of GL_{n₁}(𝔸_F) with a strong coefficient field E, the paper studies the Rankin–Selberg motive
ρ_{Π₀,λ} ⊗ ρ_{Π₁,λ}(n). Its main results:

- **Theorem 1.1.5 (§8.2, Theorem 8.2.2):** if L(1/2, Π₀ × Π₁) ≠ 0, the Bloch–Kato Selmer group
  H¹_f(F, ρ_{Π₀,λ} ⊗ ρ_{Π₁,λ}(n)) vanishes for every admissible prime λ. Admissibility is defined by conditions (L1)–(L7) of
  Definition 8.1.1.
- **Theorem 1.1.9 (Theorem 8.3.2):** if the Abel–Jacobi class of the diagonal cycle, projected to the Π-isotypic part, is
  nonzero, then the Selmer group has rank one.
- **Theorem 1.1.1 (Corollary 8.2.3):** the rank-zero result for Sym^{n−1}A ⊗ Sym^n A′ of two non-isogenous elliptic curves
  over F⁺, for all but finitely many ℓ.
- **Theorem 1.1.7 (Corollary 8.2.5):** a rank-zero family, Steinberg at a very special inert prime, for all but finitely
  many λ.

The method is arithmetic level raising on unitary Shimura varieties:

- **Geometry of the special fibres** (§§4–5, Appendix A). At an inert prime 𝔭, the integral models of unitary Shimura
  varieties have a smooth reduction for self-dual level (§4) and a strictly semistable one for almost self-dual level (§5).
  Their basic loci are described by unitary Deligne–Lusztig varieties.
- **Explicit Hecke and representation theory** of unitary groups (Appendices B–C).
- **Tate classes and arithmetic level raising** (§6).
- **Two geometric reciprocity laws** (§4.6, §5.11) and **two explicit reciprocity laws** (§7).
- **A Kolyvagin-type argument** (§2.6, §8). Level-raised cohomology classes are paired against a hypothetical Selmer class
  at auxiliary primes chosen by Chebotarev.

## Reading

**The published article.** The source is the NSF-hosted copy of the published article (269 pages, SHA-256 `dd821abd…`,
identical to the checkpoint's). It was read in eleven consecutive page ranges, every page as a rendered image, statements
and proofs.

**Versions.** arXiv v1, v2 and v3 were compared at every recorded mistake and at every result that was renumbered between
versions.

**Cited papers.** The companion paper arXiv:2108.06998 (reference [51]) and arXiv:1511.08268 §2 (reference [47]) were read
where the paper cites them.

## Items: 739

- **12 `library`:**
  - Tau Ceti's continuous H¹ and inflation–restriction;
  - Mathlib's adjugate, Schur–Zassenhaus, Goursat and Smith-normal-form results;
  - Tau Ceti's norm and invariant maps;
  - Tau Ceti's abelian varieties and Mathlib's hermitian matrices, which the paper uses without defining them.
- **32 `planned`.** Examples:
  - Selmer structures and local conditions (SelmerIwasawaCohomology L0–L4);
  - Galois representations of relevant Π and their local–global compatibility (AutomorphicGaloisRepresentationsPartII
    AG2.0–AG2.7);
  - PEL data and unitary abelian schemes (PELModuli M0–M4);
  - the Satake transform (SmoothRepresentationsOfLocalGroups SR.4);
  - Serre–Tate and Grothendieck–Messing (AbelianSchemesAndArithmeticModuli A4);
  - Dieudonné modules (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2);
  - toroidal compactification (ShimuraCompactifications C2);
  - the fundamental lemmas (EndoscopicTransferAndUnitaryTraceComparison ET.3);
  - Shin's and Arthur–Clozel's base change (ET.7a);
  - Taylor–Yoshida purity (AG2.5);
  - the projective-bundle formula (EtaleDualityAndPerverseSheaves EDC.4);
  - the semistable weight spectral sequence (LefschetzPencilsAndVanishingCycles LPV.7);
  - Rankin–Selberg L-functions (AutomorphicLFunctionsAndLocalFactors AL.3);
  - the Bloch–Kato conjecture (PeriodsAndSpecialValues PS.6).
- **695 `missing`**, each routed once.

**What changed from the checkpoint (#2239).**

- **Ids.** The checkpoint had 214 items. Every id is kept except `Z08`, which cited a 2025 survey rather than this paper.
  Each item is restated exactly from the page, and bundled results are split into separate items; each of the eleven page
  ranges gained 30–70 items.
- **Keys moved.** `S23`, `S24` and `localization-selmer` now carry the paper's own Lemma 2.6.4, Proposition 2.6.6 and
  Proposition 2.6.7. The corrected statements that earlier versions of this extraction had stored under those keys move
  to `S23-formula`, `S24-conditional` and `S25-onesided`.
- **Kept corrections.** These keys and the other items whose locator says "not in the paper" (`S23-*`, `S24-*`, `S25-*`) are
  the corrected statements for E1 and E2. They are kept because they were checked again here and found correct: the exact
  image q(N^α), the scaled inverse, the norm isomorphism, the row selection and the one-sided rank-two localization.
- **Companion theorem.** `companion-rt` now states Theorem 3.6.3 of [51] with its hypotheses (D1)–(D4).
- **Corrected labels.** Many locators had wrong labels. Examples: the §8.1 results are Lemmas, not Propositions; 5.10.13 is a
  Notation; Proposition B.3.5 and Lemma B.3.6 were swapped; the §6.4 results are Proposition 6.4.1 and Lemma 6.4.2.

## Routes

The checkpoint's 21 routes are kept, with the same ids and order. Every reason and brief is rewritten against the full
reading.

**Source routes: the paper supplies content for existing layers.**

1. **SelmerIwasawaCohomology L0–L2, L4** (§§2.1–2.2, 2.4). Weakly semisimple modules, singular and nonsingular local
   conditions, the Fontaine–Laffaille condition and integral Bloch–Kato Selmer groups.
2. **EulerSystemsAndKolyvaginSystems ES.1, ES.4** (§§2.3, 2.6). Reducibility depth, the Selmer field F_S and θ_S,
   γ-associated places and abundance. This is Kolyvagin-style simultaneous localization, not an Euler system. The route
   carries Lemma 2.6.4 and Propositions 2.6.6–2.6.7 together with their corrections (see below).
3. **GlobalGaloisDeformations G7** (§2.5). The group 𝒢_N and j-polarizations; Carayol's lemma.
4. **LocalGaloisDeformationRings R08.2, L7** (§§6.3–6.4). Rigidity and the level-raising local deformation problems of [51].
5. **AutomorphicGaloisRepresentationsPartII** (§1.1, §3.2). Relevant representations, coefficient fields, ρ_{Π,λ}, and
   Hypothesis 3.2.10 kept as an explicit hypothesis.
6. **SmoothRepresentationsOfLocalGroups SR.4** (§3.1, Appendices B.1–B.3). Unitary Satake parameters, the genericity
   conditions and explicit Satake transforms.
7. **PELModuli M0–M4** (§§3.3–3.5). CM types, reflex fields and the reflexive closure, unitary abelian schemes and their
   deformations, and the auxiliary CM moduli.
8. **IgusaVarietiesAndTorsionConcentration IG.5, IG.7** (Appendix D.1). Vanishing of Hecke-localized torsion cohomology off
   the middle degree. The compact case is also the subject of the Part II proposed by PAPER-CARAIANI-SCHOLZE-17.
9. **QSeriesPartitionsAndMockModularForms QM.0.** Gaussian binomials and the q-binomial identities of Appendix B.
10. **LefschetzPencilsAndVanishingCycles LPV.7.** The semistable weight spectral sequence and Saito's monodromy input.
11. **MotivesAndAlgebraicCycles MC.2.** The projected Abel–Jacobi class of the diagonal.
12. **EndoscopicTransferAndUnitaryTraceComparison ET.4, ET.7a** (§3.2, Appendices C.1, C.3, D.2). Base change, the
    endoscopic classification (Mok; Kaletha–Minguez–Shin–White), transferable levels and old-form dimensions.

Routes 19–21 are one planned item each: EDC.4, AL.3 and PS.6.

**Part II and new routes: nothing in the atlas plans these.**

13. **UnitaryRapoportZinkSpacesAndRSZModels**, Part II of PELModuli (213 items: §§4–5, Appendix A).
    - *Shared:* PAPER-ZHANG-21, PAPER-LI-ZHANG-22-B, PAPER-LI-LIU-21/22 and PAPER-HE-LI-SHI-ETAL-23 already propose this
      id for unitary integral models.
    - *What this paper adds:* their special fibres at an inert prime, the Deligne–Lusztig description of the basic loci
      (Theorems 4.3.5, 5.3.4, 5.4.4, 5.5.3), the intersections of §5.7, the special morphisms between ranks, and the
      resolution of the product in §5.11.
14. **UnitaryLevelRaisingTypesAndHeckeOperators**, Part II of SmoothRepresentationsOfLocalGroups (49 items: Appendices
    B.2–B.4 and C.2, §§5.6, 5.8, 6.1). Tate–Thompson types, the non-quasi-split special representations and their base
    change, and the two-parahoric intertwining operators and their relations.
15. **PolarizedAutomorphyLifting**, Part II of PotentialAutomorphyInfrastructure, an id shared with five other papers. It
    carries [51]'s R = T theorem.
16. **SemistablePotentialMaps**, Part II of LefschetzPencilsAndVanishingCycles. Liu's potential map ([47] §2), including the
    extension to non-proper schemes and O_λ coefficients that the paper assumes (E93).
17. **GanGrossPrasadConjecturesForClassicalGroups**, a new roadmap whose id is shared with five papers. It carries Lemma
    8.2.1, taken from Beuzart-Plessis–Liu–Zhang–Zhu, and Conjecture 8.3.1.
18. **ArithmeticLevelRaisingAndBipartiteEulerSystems**, Part II of SelmerIwasawaCohomology (198 items: §§1, 2.7, 4.4, 4.6,
    5.8–5.9, 5.11, 6–8).
    - *Content:* the method itself — incidence maps, the localized weight-spectral-sequence analysis, Tate classes,
      arithmetic level raising, both reciprocity laws and the pairing arguments.
    - *Its brief states the main theorems exactly*, including the scope corrections below.
    - *Name:* the id is kept from earlier versions and does not assert Euler-system norm relations.

## Mistakes: 126 recorded

The 126 mistakes (E1–E126) split as 75 misprints, 30 gaps and 21 errors. Of these:

- **16 reach a stated result.**
- **13 reach only a proof.**
- **97 reach nothing downstream.**

**How they were checked.**

- **Checkpoint findings.** The 16 findings from earlier versions (E1–E16) were all re-checked on the page image and are kept.
  E2 is reclassified from gap to error. E8 is reclassified as an error that reaches Lemma 5.9.3(6). E5 and E12 reach
  nothing.
- **New findings.** Of the 110 new ones, 40 claims were checked a second time, independently: every error and every
  mistake that reaches a proof or a stated result.
  - **Rejected:** one. The paper openly leaves the construction (4.13) to the reader, which is routine.
  - **Merged:** two, which restate E9 and E10 at the place where the faulty lemma is used.
- **E1 cluster.** E1, E2 and E23 were checked twice more. One of those checks was told to argue the authors' side.

**Errata search.**

- The Crossref record of the DOI shows no correction or update.
- arXiv v3 (August 2021) is the last version.
- Wei Zhang's publication page lists no correction.
- Every mistake is therefore recorded as `known: "new"`.

### The Selmer argument (§2.6 and §8)

- **E1: Lemma 2.6.4 is false when [F:F⁺] = 2.**
  - *Example:* take F = ℚ(√5, i), ℓ = 3, R = ℤ₃(1) with j = 2, S the Kummer class of the golden-ratio unit, and γ
    induced by complex conjugation. Every lift of γ squares to 1, so G_{S,γ} = {1}, whereas the lemma predicts all of
    ℤ/3^m.
  - *The exact set:* G_{S,γ} is q(N^α), the part fixed by conjugation by a lift of γ, not the h_γ-fixed part. The
    printed inclusion ⊆ holds, and the lemma is correct when [F:F⁺] = 1, the setting of Liu (2016) from which the argument
    comes.
  - *Consequence:* Proposition 2.6.6 fails with it (E23).
- **E2: the first part of Proposition 2.6.7 is false.** An abundant tuple need not admit a diagonalizing basis, for
  example the matrix [[λ, 1], [0, λ]]. The rank-one proof in §8 needs only a one-sided version, which follows from
  abundance with the same constant, so the threshold m > m_per + m_lat + m_Σ + 8𝔯_R + m_dif stands.
- **E102: the §8 proofs choose γ without regard to S.** The proofs of Theorems 8.2.2 and 8.3.2 take γ from (L5-2) without
  regard to the Selmer module S.
  - *Where it bites:* when R_ℚ ≅ R_ℚ^𝔠, which covers all of Theorem 1.1.1 and base-change pairs in the other theorems, a
    class in one 𝔠-eigenspace localizes to zero at every γ-associated prime. The contradiction is then not reached.
  - *Repair where available:* in rank zero, choose γ of the right sign. In rank one, use γ at 𝔭₁ and a sign-flipped γ at
    𝔭₂ (as in Bertolini–Darmon). For the elliptic curves of Theorem 1.1.1 the flip is multiplication by a central
    element.
  - *Unrepaired:* where no such element exists (Theorem 1.1.7, and general admissible λ with base-change pairs), a further
    hypothesis or argument is needed.
  - *No main theorem is shown false.*
- **E21: Lemma 2.3.5(b) is false when O_λ/λ ≠ 𝔽_ℓ.** There is an 𝔽₂₅ counterexample. The proof treats End(R̄) ⊗ k as
  a direct sum of copies of End(R̄), but it is a sum of Frobenius twists; the hypothesis must be taken over 𝔽_ℓ.
  Theorems 1.1.5 and 1.1.9 rely on it for admissible λ of residue degree greater than 1.
- **E4, E25, E3: Proposition 2.7.2 and Lemma 2.7.1.**
  - Proposition 2.7.2(3) needs 𝒫 ≠ 0 (E4).
  - Its proof miscomputes ξ and h_γ, as −a^{−t} and a Frobenius-twisted square (E25); the statement survives with a
    correct choice of g.
  - Lemma 2.7.1 must raise the whole triple to one common power, as v1/v2 did (E3).
- **E13, E101: Lemma 8.1.7 (change of level) is asserted integrally from freeness alone.** The repair is the intertwining
  composite, which is a unit by intertwining genericity and is Hecke-linear.
- **E106:** (8.5) and (8.14) at ℓ-adic places need Faltings' comparison.

### Scope of the main theorems

- **E30: Hypothesis 3.2.10 rests on unpublished work.** For N ⩾ 3 and F⁺ ≠ ℚ, Proposition 3.2.11 defers the hypothesis
  to Kisin–Shin–Zhu [37], "in preparation". The published arXiv:2110.05381 proves only a trace formula. Since n₁ ⩾ 3,
  every unconditional main theorem depends on it.
- **E105: the corollaries overstate their condition (c).** Corollaries 8.2.3 and 8.2.5 state (c) as "F⁺ ≠ ℚ if n ⩾ 3",
  but their proofs need F⁺ ≠ ℚ always. arXiv v1 covered n = 2 with "weakly admissible" primes; v3 removed them but kept
  (c). Theorems 1.1.1 and 1.1.7 in the introduction correctly assume F⁺ ≠ ℚ.
- **E32: the Chebotarev choice of primes in §8 fails under the printed Definition 3.3.2.**
  - *The change:* between v3 and print, the reflexive closure changed from a composite to an intersection of reflex
    fields.
  - *The failure:* under the printed definition, a very special inert prime need not satisfy (PI3). An explicit W(B₄)
    example is recorded.
  - *Related:* footnote 11's criterion is wrong in both directions (E31).

### Geometry and level raising

- **Lemma 5.11.3 (E74):** the exceptional stratum is the ℙ¹-bundle ℙ(pr₀*N₀ ⊕ pr₁*N₁), which is not trivial. Its later uses
  need only a bundle with a section. This settles the checkpoint's investigation U1.
- **Theorem 5.7.8(2) (E65):** false for odd N; it is used only for even N.
- **Theorem 4.3.5(2) (E39):** the restriction of ι is unramified, not locally a closed immersion. Nothing later depends on
  the difference.
- **Theorem 4.6.2 (E51):** false when the graph is read as a characteristic function; the pushforward, which §7.3 uses,
  is right.
- **Lemma A.1.4(4) (E9):** needs the pair to descend to 𝔽_{p²}. Its one use, Lemma 5.6.2(3), then needs that check.
- **E10 (Appendix C.2 and Definition 5.6.3):** primitive cohomology at N = 2 is the trivial representation plus Steinberg,
  not Steinberg alone.
- **Lemma 5.9.3(6) (E8, E68):** its right exactness is unproven for torsion coefficients. The hypothesis should be
  #𝔽_p^Φ − 1 invertible, not p² − 1. Only the injection is used later.
- **Theorem 6.3.4(5) (E89):** false unless Π is level-raising special modulo λ^m at Σ⁺_lr. The main theorems use it only
  where this holds.
- **Proposition 7.2.7 (E93):** applies [47] outside its hypotheses of properness and ℚ_ℓ or ℤ/ℓ^ν coefficients.
- **Other gaps:** Proposition A.2.4(2) (E113), Proposition D.1.3 (E124) and Theorem 6.3.4(3) (E87).
- **The arrows after Notation 5.10.13:** printed in the wrong direction (a misprint). This settles U2.

The remaining 97 are misprints and small gaps whose intended meaning is clear, each with its correction. Two examples:
(p + 3) printed for p³ + 1 on pp. 229, 342 and 343 (E6), and a missing Tate twist in the proof of Theorem 6.3.4(4).

## Judgement calls

- **Keeping the corrected-statement items.** The corrected statements for E1 and E2, supplied by earlier versions of this
  extraction, stay as items with "not in the paper" locators and are routed with ES.1/ES.4. The protocol asks items to use
  corrected statements, and they were re-derived here. The design job should read them as the corrected lemmas, not as
  results of the paper.
- **Classifying E1 and E102.** E1 is recorded as an error in a stated result: the lemma is false. Its effect on the main
  theorems is recorded separately as a gap in their proofs (E102). No main theorem is claimed false.
- **Top-level fields.** Removed:
  - the checkpoint's `continuation`, `continuationEvidence`, `normalClosureContinuation` and `obstructionContinuation`
    records, which are superseded; the history is in git;
  - `openInvestigations`, both of which are now settled findings.

  Updated: `coverage`, `validation`, `readLedger` (the older entries are kept, marked superseded) and two `contexts`
  entries. Kept: `baseline`, `coalescence` and `inputScreen`.
- **The unpublished dependency.** The paper's dependence on [37] is recorded as a gap (E30) and in the arithmetic Part II
  brief. It is not treated as settled.

## Prerequisites (18)

These are papers the paper builds on that the atlas does not yet cover:

- **The companion papers** [51] (R = T) and [47] (potential maps).
- **Kisin–Shin–Zhu** [37].
- **Integral models and geometry:** Rapoport–Smithling–Zhang [62], Xiao–Zhu [75] and Lan–Stroh [43].
- **The level-raising method:** Liu (2016) [46] and Bertolini–Darmon [5].
- **Endoscopic classification:** Kaletha–Minguez–Shin–White [33] and Mok [53].
- **Gan–Gross–Prasad** [25].
- **Finite and local representation theory:** Deligne–Lusztig [24], Hotta–Matsui [31] and Moy–Prasad [55].
- **Other inputs:** Nizioł [59], Serre (1972 [68] and 1994 [69]) and Guralnick [30].

Caraiani–Scholze (2017) and Beuzart-Plessis–Liu–Zhang–Zhu are already in the paper registry.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIU-ETAL-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 0 problems.
- Lean: none.

## Review (REV-PAPER-LIU-ETAL-22, 24 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1281](https://github.com/CBirkbeck/tauceti-explorer/issues/1281). **Verdict: accept.** All
twenty-one routes accepted; all 126 findings confirmed.

- **The source is verified.** The published text re-fetched from the NSF public-access mirror hashes
  to `dd821abd…9d97`; 269 pages, printed page = PDF page + 106, pp. 107–375.
- **All 126 findings located and confirmed** — 99 by automatic prose match at the recorded page, the
  other 27 (displayed formulas) by hand. **Not one locator was wrong.**
- **Eight of the twenty-nine substantive findings were examined in depth, five re-derived
  independently:** E2 (the matrix `[[λ,1],[0,λ]]` cannot be diagonalised by a change of basis, so the
  "obvious" first part of Proposition 2.6.7 does not follow), E4 (`𝒫(ξ)` invertible is unsatisfiable
  for `𝒫 = 0`), E8 (`H¹_cont(Ẑ, M) ≅ M` for a trivial action, so the asserted vanishing means the
  module vanishes), E10 (at `N = 2` the kernel is all of `H⁰ ≅ 𝟙 ⊕ St`, not irreducible), E13
  (rationally isomorphic lattices need not be integrally isomorphic). For E1, E3 and E9 the verdicts
  say which part rests on the extraction's page-image re-derivation rather than mine.
- **Corrected in place:** two Part II titles that were not exact prefix extensions of their parents'
  atlas titles — "Lefschetz pencils **and** vanishing cycles…" → "Lefschetz pencils, **nearby cycles
  and** vanishing cycles…", and "**Selmer and Iwasawa cohomology**…" → "**Selmer groups, continuous
  integral cohomology, and Iwasawa cohomology**…". Neither is co-proposed elsewhere; the second one's
  `coalescence` identity, which came from this paper's own earlier checkpoint (PR #2181), was updated
  with it, and the corrected form now matches PAPER-DISEGNI-LIU-24 for the same parent. Three item
  ids repeated inside one route's array were de-duplicated.
- **Items and routes:** 739 items (12 library, 32 planned, 695 missing), each missing item routed
  exactly once; every stage id and all 27 planned targets present.

Full report: `research/blueprint/reviews/REV-PAPER-LIU-ETAL-22.md`.
