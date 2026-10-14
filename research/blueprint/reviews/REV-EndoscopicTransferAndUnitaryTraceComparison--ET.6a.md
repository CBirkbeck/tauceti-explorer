# REV-EndoscopicTransferAndUnitaryTraceComparison--ET.6a

Independent review of the blueprint packet
`research/blueprint/packets/EndoscopicTransferAndUnitaryTraceComparison--ET.6a.json`, its reader
`research/blueprint/readmes/EndoscopicTransferAndUnitaryTraceComparison--ET.6a.md` and its suggested
file `research/blueprint/suggested/EndoscopicTransferAndUnitaryTraceComparison--ET.6a.lean`
(stages ET.6a, ET.7, ET.7a and ET.7b). The plan was written by Codex, session `codex-D5P0JW`
(PR #9646). Reviewer: Claude (Opus 5.5), session `claude-8LvMpL`, 14 October 2026. The reviewer wrote
none of the plan.

**Verdict: `accepted`.** The plan is sound at target level, its four stages are honestly
`planned`, and its nine gaps are real and precisely stated. Everything the review found was
correctable in place; nothing needs a revision round. The corrections are listed below. The packet
now carries a `review` object with a verdict for each of the 50 nodes (17 verified, 33 corrected),
and the reader has been regenerated from the corrected packet.

## Scope and method

- I read the packet node by node and checked every node at its locator. All fourteen sources were
  fetched (public ones into scratch) or read in place (SW13, SW20 and LTXZZ from the cleared copies);
  every SHA-256 hash recorded in the packet matches the file read. Pages read:
  - Dat: §§2.1–2.2 (pp. 6–14), §3 (pp. 15–27) and §4.1 (pp. 28–30), together with its bibliography;
  - SW13: §§6–7 (pp. 54–73);
  - SW20: Lecture 24 (pp. 225–231) and the appendix to Lecture 21;
  - FS: IX.7.3–IX.7.4 (pp. 337–338);
  - CDN20: Proposition 4.8 (pp. 38–39);
  - CDN23: §0.2.1 (p. 4) and §3.1–Corollary 3.11 (pp. 32–36);
  - Pan v1: pp. 58–59 in full, and the statements of 5.3.4, 5.3.8, 5.3.9 and 5.3.20 on pp. 63–67;
  - Arthur–Clozel: Chapter I §6 (pp. 51–62) and Chapter III §§3, 4, 6 (pp. 201–217);
  - Mœglin–Waldspurger: introduction (pp. 605–606);
  - Shin: §4 (pp. 27–30), §5.1 (p. 30) and §5.5 (pp. 36–37);
  - LTXZZ: §3.2 (pp. 143–146), Appendix C.1 (pp. 351–352), C.2.5–C.3 (pp. 362–364) and D.2
    (pp. 368–371), with its references [42] and [72];
  - BCGP: §1.8.22 (p. 15), Proposition 7.5.3 (p. 175) and Lemma 10.2.4 (p. 213);
  - CS17: §4.3 (pp. 715–718) and §§5.4–5.5 (pp. 739–743);
  - CSnc: §§2.2–2.3 (pp. 14–20), §§5.2–5.7 (pp. 67–78), checked also against arXiv:1909.01898v2.
- I read the supplier statements the packet relies on: the PELModuli, FiniteFlat (R07.1),
  FarguesFontaineDiamonds (F4), AutomorphicSpectralTheory (AS.6) and ShimuraVarieties (V6) nodes,
  and the stage texts of D6, P5, S2, L0, H1, LPV.6, SR.0, SR.2, L0 (locally analytic), AF.2, AF.4,
  AF.5 and AS.4. I also read the FiniteFlat package README in `research/blueprint/packages/` (upstream as
  TauCetiRoadmap pull request #879) and the TauCetiRoadmap SmoothRepresentationsOfLocalGroups
  README.
- Duplication: TauCetiRoadmap main (0d144d04) and Tau Ceti a91d3aaf have no Lubin–Tate or
  Drinfeld tower, Igusa, Speh, Jacquet–Langlands or automorphic-induction carrier, and
  `data/library-coverage.json` has no row for these stages, as the packet says.
- Baseline: `Matrix.trace` (lines 45–46) and `Matrix.trace_diagonal` (lines 48–50) read at Mathlib
  082e2d37 in the pinned lean-check build.
- `python3 scripts/check_blueprint.py` with the baseline declaration index: 0 errors, 0 warnings.
- `lean-check` on the suggested file at the pins: elaborates; the only warnings are the four
  unproved API statements.

## Counts

| | before | after |
|---|---|---|
| nodes | 50 | 50 (none added, none removed) |
| definitions / constructions / theorems / comparisons / applications | 8 / 8 / 28 / 2 / 4 | unchanged |
| API items | 73 | 74 |
| unit tests | 48 | 49 |
| planets | 18 | 14 |
| baseline declarations | 1 | 2 |
| requests | 17 | 18 |
| gaps | 9 | 9 |
| source issues | 0 | 4 |
| stages planned / closed | 4 / 0 | 4 / 0 |

## Corrections

### Attribution

1. **Dat's Theorem 4.1.2 is Boyer's theorem.** Dat credits it to Boyer. Its proof translates
   between Harris–Taylor's and Boyer's nearby-cycle notation and then applies Boyer's computation
   (Dat's reference [12], the preprint arXiv:math/0511531, published in Invent. Math. 177 (2009)).
   The packet said Dat imports the Harris–Taylor realization directly. The matches of
   `raw-compact-unitary-cohomology`, `unitary-nearby-cycle-decomposition`, `global-extraction` and
   `supercuspidal-dat-sector` now say what Dat does. The Harris–Taylor gap is renamed "Harris–Taylor
   and Boyer primary proof access" and notes that Boyer's paper is freely available. The
   page locators move from pp. 26–29 and 27–29 to pp. 28–29: §4 starts on p. 28.
2. **LTXZZ Proposition 3.2.8 cites Shin, not only Labesse.** Its proof refers to Shin's cohomological
   base change for unitary similitude groups ([72], Theorem 1.1). Labesse ([42], Corollaire 5.3) is
   cited only for definite V. This is corrected in `weak-unitary-base-change`,
   `cohomological-base-change`, the gap "Primary pure-transfer and packet proofs" and the ET.7a
   coverage note.

### Statements

3. `stein-mittag-leffler`: CDN23 §3 works with the Lubin–Tate tower of GL_n(F) for any n (§3.1,
   p. 32), not only in rank two. The statement now has the source's generality.
4. `weak-unitary-base-change`: the definition now matches LTXZZ 3.2.3: a finite isobaric sum of
   *discrete* automorphic representations. The Shimura varieties of LTXZZ are attached to
   Res_{F+/Q}U(V). They are of abelian type, not PEL moduli of a similitude group, so the supplier
   `PELModuli:M3/complex-points` is replaced by `ShimuraVarieties:V6/abelian-canonical`, an accepted
   tier-13 node.
5. `signed-igusa-trace`: CSnc Theorem 5.6.1 is proved for acceptable φ. The hypothesis is restored;
   only the factorized expansion extends to all φ_p.
6. `red-trace-duality`: the local identity concerns acceptable φ_p. The Frobenius-twist extension is
   now placed on the global expansion, where CS17 and CSnc make it.
7. `cyclic-base-change`: Arthur–Clozel I, Proposition 6.7 (p. 59, the fibres of tempered lifting) and
   Lemma 6.10 (p. 62, lifts of supercuspidals) are added. The confirmed red-team finding lists them
   among the ET.4b inputs.
8. `twisted-spectral-normalization`: Shin's Remark 4.10 also gives 2^(r+1) at a maximal proper Levi.
   This is added, and "endoscopic blocks" is made precise as the components of vecn.
9. `equivariant-cohomology-comparison`: the Lubin–Tate and Drinfeld level systems do not correspond.
   "Compatible with finite-level pullback/trace" is therefore restated as compatibility with the
   smooth GL_n(E)×D× structure, hence with the Hecke operators of both towers. The match records
   that Dat credits Theorem 3.4.1 to Faltings and Fargues and cites Fargues for its proof.
10. `gross-hopkins-vector-fields`: the acting group is named (the Lie algebra of D×/F×), and the
    source's attribution to Gross–Hopkins is recorded. I verified the identity f_1f_2′−f_2f_1′=2f_3.
11. `oldform-dimensions`: the source proof's key step is now in the proof sketch. It passes to an
    auxiliary quadratic totally real extension in which Σ_min splits, Σ_lr is inert and the base
    change stays cuspidal, and uses Shin's definite-case dimension formula there. Matsushima's
    (g,K)-cohomology count is not part of AF.5 (comparison examples). The AF.5 request is narrowed
    to the definite case, and a new AF.4 request asks for the indefinite middle-degree count.
12. ET.7b uses the CS17 errata of the paper extraction explicitly:
    - `newton-reduction`, `red-trace-duality` and `local-factorization` use the twisted Red of
      PAPER-CARAIANI-SCHOLZE-17/E74;
    - `local-factorization` uses the coefficient systems Ξ(φ_vecn) at infinity (E77);
    - `hecke-character-separation` uses the aggregate form of Corollary 5.5.2 (E79).

    The plan's mathematics was already consistent with these corrections. It did not say so, and the
    issue required it.

### Locators

Corrected or completed in this pass:

- Dat: §2.2.1, §3.1.5, Fait 3.3.2 and §3.5; §3.3 runs to p. 24; Theorems 3.4.1–3.4.2 are on p. 24;
  Remark 2.1.14 is on p. 10.
- SW13: §6.1 is pp. 54–56; the Hodge–Tate map is Proposition 7.1.1 on p. 68; §7.3 starts on p. 71,
  where the inverse-transpose remark sits.
- Shin: Corollary 4.14 is on p. 30; §5.1 is pp. 30–31.
- LTXZZ: C.1 is pp. 351–352; C.2.5 is on p. 362.
- BCGP: the proof of 7.5.3 ends on p. 175.
- MW: §II.3 is pp. 647–649.
- CSnc: Definition 5.3.1 on p. 68 is added as a source of `csnc-test-functions`. The CSnc edition
  note is corrected: the author copy has 90 pages, and its page numbers agree with arXiv v2 at every
  cited place.

### Planets

The planets on `torus-measure-check`, `unramified-gl2-check`, `proper-endoscopy-check` and
`division-inner-form-check` are removed. They are acceptance checks, and section 14 excludes
checks. ET.7 is a joint export with no key definition of its own, so it now has no planet. The
other fourteen planets are key definitions or named theorems.

### Baseline and suggested file

The packet cited `mathlib:Matrix.trace`, but the ledger it supports never used it. The suggested
file's matrix example was unrelated to `comparisonTrace`. The ledger now has a compatibility API item
and test identifying it with the trace of a diagonal matrix: `comparisonTrace_eq_trace_diagonal`,
stated, and `comparisonTrace.matrixTrace`, proved by `simp`. `mathlib:Matrix.trace_diagonal` is
added to the baseline, read at the pin. No citation was removed. The suggested file follows the
2026-10-12 shape rule (existing carriers only). That is correct for this roadmap, whose carriers are
absent at the pins.

## Mistakes in the sources (section 18)

The packet listed none. Four are added, each with this review's verdict:

- **E2, Dat, misprint.** §3.2.2–3.2.3, pp. 18–19: the Lubin–Tate height components are indexed by h∈N
  (once by an undefined H). They range over Z, as on the Drinfeld side (p. 16).
- **E3, Dat, misprint.** Theorem 4.1.2, p. 28, is stated for 0≤i≤d−1, but its right side is defined
  only for i≤d_ρ−1 (Convention 2.1.13). The intended reading is that the cohomology vanishes for
  d_ρ≤i≤d−1, which is what the proof through Boyer gives. This is the concentration in degree n−1
  used by `supercuspidal-dat-sector`.
- **E4, CSnc, error.** Lemma 5.6.2 (p. 75) and the proof of Theorem 5.1.2 (p. 77) use CS17's untwisted
  Red, with φ_p^vecn taken from Shin 2010 (Definition 5.3.1(1)). They inherit
  PAPER-CARAIANI-SCHOLZE-17/E74. I did not determine whether the last clause of CSnc's Theorem 5.1.2
  needs the matching unramified twist; that is a question for the CSnc extraction.
- **E5, CSnc, error.** Lemma 5.6.2 (p. 75) says Π^vecn_∞ is cohomological for the trivial
  representation. As in PAPER-CARAIANI-SCHOLZE-17/E77, for proper vecn the coefficient system is a
  nontrivial Ξ(φ_vecn). In CSnc the two blocks are twisted by ϖ^{ϵ(n_i)} with ϵ(n_1)=ϵ(n_2) (p. 68),
  so the same centring argument applies. Later uses need only C-algebraicity.

E4 and E5 have the same text in arXiv:1909.01898v2. Neither the Annals page nor Crossref lists an
erratum. The atlas extraction PAPER-CARAIANI-SCHOLZE-24 does not record them. `sourceVersions` is
filled.

## Red-team findings handed to the blueprint

- **RT-AREA-langlands-1/1** (cyclic BC/AI before ET.6). Handled correctly: the BC/AI nodes have no
  ET.6 prerequisite, global-extraction forbids an ET.7a input, a gap records the ordering repair, and
  a restructure proposal moves them to ET.4b. The proposal now carries the finding's full ET.4b
  content: Arthur–Clozel I §6 (Theorem 6.2, Proposition 6.7, Lemma 6.10), III §§4 and 6, and
  Harris–Taylor §VI (VI.1.1, VI.2.1, VI.2.9–VI.2.10). It also has the ET.4b→R17.4 edge and the two
  ET.6 targets (Harris's non-Galois automorphic induction, Henniart's highly ramified twists).
- **RT-AREA-padic-1/25** (SW13 5.1.4/5.1.6/5.2.1 below T2). Handled correctly: no node cites T2. A
  request, a gap and a restructure proposal ask for an early finite-flat stage feeding T2, IG.3 and
  ET.6a. Updated: FiniteFlat is now TauCetiRoadmap pull request #879. Its R07.2 stops at Dieudonné
  theory over perfect valuation rings (R07.2.29) and has no Rapoport–Zink spaces or SW13 §5
  classification.
- **RT-AREA-geomlanglands/2** (owner of SW20 24.2.5/24.3.5). Handled correctly: ET.6a owns the narrow
  basic fibre and the tower comparison, and HS3 and ES7 consume it. The proposal now also deletes the
  atlas edge HS2→ET.6a, which no node uses, and points ES7's import and HS2's examples clause at
  `classical-tower-fibre-comparison`.

## Questions for the orchestrator

1. **Where SW13's classification of p-divisible groups over O_C goes.** FiniteFlat is upstream as
   pull request #879, so the requested early stage needs one of three things:
   - an addition to that pull request;
   - a FiniteFlat Part II below tier 14;
   - planning the classification in ET.6a, the lowest-tier consumer (ET tier 14, T2 tier 16,
     IG tier 19).

   The vector-bundle classification it needs (VectorBundlesAndIsocrystals VB1–VB2) is outside the
   Caraiani–Newton list.
2. **Same-tier citation.** `basic-modification-functor` cites FarguesFontaineDiamonds:F4, which is in
   the same tier (14) as this roadmap and not in its bundle. The citation is acyclic, and
   FarguesFontaineDiamonds' package is already accepted. I recommend ordering it before this roadmap
   rather than moving the untilt divisor down.
3. **Moves.** The four ownership proposals (ET.4b, an early finite-flat stage, the tower-comparison
   owner, ET.5a for the early rational Igusa object) need a decision before this roadmap is
   packaged. Until then ET.5 must not import the whole ET.7b stage.
4. **CSnc extraction.** PAPER-CARAIANI-SCHOLZE-24 could record E4 and E5, and check the last clause
   of CSnc Theorem 5.1.2 against E74.
