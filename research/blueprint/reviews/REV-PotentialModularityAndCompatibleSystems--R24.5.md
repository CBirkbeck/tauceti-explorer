# Independent review of the R24.5 compatible-systems import packet

Job `REV-PotentialModularityAndCompatibleSystems--R24.5`, issue #9400.
Reviewer: Claude (Opus 5.5), session `claude-EFl2bi`, 2026-10-14. The packet,
reader and suggested file were written by Codex session `codex-0Y1GxJ`
(job `BP-PotentialModularityAndCompatibleSystems--R24.5`, issue #9429, PR #9573).
This session wrote none of them and none of the R24.3 owner work.

**Verdict: accepted after correction.** This is a finished target-level review,
not a checkpoint. The packet imports 30 accepted R24.3 targets with exact
contracts and adds no node. Its three stages are honestly `planned`, and its
proof leaves are recorded as gaps and requests. The corrections below are small
and were applied in place, so the plan does not need another round. Acceptance
covers this import plan only. It proves none of the supplier theorems, and it
does not accept the needs_changes PadicHodgeTheory P7 or package files.

## Scope and counts

| Item | Reviewed result |
| --- | --- |
| Stages | R24.5:operations, R24.5, R24.6: all `planned`; packet `complete`, `proofClosed` false |
| Local nodes | 0 (reuses 30 R24.3 targets: 14 definitions or constructions, 16 theorems or lemmas) |
| Imported API items / definition tests | 80 / 57; every definition and construction has at least four tests |
| Target verdicts | 21 verified, 9 corrected, 0 added, 0 unverifiable |
| Baseline declarations | 16 confirmed, 0 removed or replaced |
| Requests / gaps | 21 / 8; no new request; one request locator corrected and one `neededBy` extended |
| Source issues | 1 added (E13, confirmed); inherited E1–E5 rechecked at E1, E3, E5 |
| Planets | none new; the 10 inherited planets (6 + 3 + 1 per layer) remain with their owner |
| Suggested file | unchanged; `lean-check` elaborates, with warnings only at the 11 intentionally unproved statements |

## Sources

I opened all twelve public sources and checked that their SHA-256 values match
`sourceVersions`. I read every locator the import checks cite. The
Savitt corrected copy is behind a Cloudflare challenge; the arXiv text was read
at the same locators.

- Khare–Wintenberger I, author preprint: §5 pp.7–8, Theorem 5.1 and its remarks pp.9–10, Lemma 6.2(ii) p.11, §8.2 pp.13–15, §8.4 p.17, proof of Theorem 9.1 p.19, Theorem 10.1 and proof p.20, §1 p.2.
- Khare–Wintenberger II, author preprint: §10.3.2 pp.93–94, bibliography p.96.
- Dieulefait–Pacetti, arXiv v2: Theorem 1.9 p.6, Definition 1.10 and Theorem 1.11 pp.6–7, Remark 4 p.7, Lemma 1.14 p.9, Paso 5 p.14.
- BLGGT arXiv v4: §2.1 p.31, Theorem 2.1.1 pp.33–34, §5.1 pp.62–65 (p.62 checked on the page image, because text extraction drops the bars on M̄_λ), §5.2 pp.65–70, §5.3 pp.70–71, Lemma 5.4.5 p.76, §5.5 pp.77–79, Lemma A.1.5 p.85, A.2 p.87. The published page offsets (+500) were confirmed at §5.1, §5.5, Proposition 5.3.2 and A.1.5, and CCO 2013 Lemma 3.7.7 on p.576.
- Taylor (Documenta 2006) §6 pp.773–775; Skinner (Documenta 2009) pp.241–244; ACC+ published §7.1 pp.1084–1086 and 1092; Khare arXiv math/0504080v1 §3 pp.16–18; Dieulefait arXiv math/0304433v1 pp.1–2; Swinnerton-Dyer (LNM 350) p.15 and pp.31–33; Savitt arXiv pp.38–39.

All statements are in the worker's own words. The packet and reader carry no
excerpt, block quotation, local path, or "optional/deferred/later" wording.

## Corrections made (packet `importChecks` and reader, kept verbatim-consistent)

1. **`R24.5/constituents-essentially-self-dual`.** BLGGT v4 Lemma 5.4.5 (p.76)
   is stated for any subrepresentation s of r_λ|G_F′. The import added an
   irreducibility hypothesis and claimed that the last step needs it. In fact
   the last step uses multiplicity one of the constituents, which extreme
   regularity supplies, so the restricted pairing is perfect on every
   subrepresentation. The statement, hypothesis, proof step and source match
   now follow the source; the package review made the same correction on
   2026-10-09.
2. **`R24.5/kw-theorem-5-1-systems` and new source issue E13.** KW I p.10
   reports Diamond's list of level-two pairs and concludes that i = j + 1 never
   occurs. Solving i − j = 1 gives (q+1)(p^r − 2m) = p^r, which forces q = 2,
   p = 3, m = 1 and (i, j) = (1, 0). Those are exactly the order-3 characters
   that KW I §9.1 uses. The weight claim of Theorem 5.1(4) is made only for odd q,
   so no stated result is affected. The hypothesis, a verification sentence and
   the reader's worked check now say "for odd q", and E13 records the slip with
   the review's verdict (Crossref lists no erratum).
3. **`R24.5/almost-strict-compatibility`.** The rewritten statement had lost the
   WD comparison that KW II p.94 proves when q = ℓ ≠ 2 and r_q is unramified
   (Breuil, Berger); the statement now includes it again.
4. **`R24.5/compatible-system`.** The packet listed DP's all-member de Rham
   condition as the only difference between DP's almost strictness and KW's.
   There is a second: at a residually reducible odd coefficient prime with
   unramified WD_p, DP still demand the full comparison (6), while KW ask only
   for crystallinity. This is now recorded, and so is the fact that the Brauer
   systems meet the stronger condition.
5. **`R24.6/local-compatibility-at-the-coefficient-prime`.** Two acceptance
   items and a source match cited cases "(b)" and "(c)" that the statement does
   not define. They now name the odd unramified-parameter clause and the
   excluded residually reducible ramified case.
6. **`R24.6/linked-systems-modularity-transfer`.** RT-AREA-langlands-2/21 makes
   R32.6/ramified-reducible-coefficient-prime the owner of the modern
   ramified reducible transfer, and the verification already invokes the p = 3
   ordinary branch and the almost-strict de Rham bridge. Those three accepted
   GL2ModularityLifting nodes (in the R32.3 packet) are now prerequisites. The
   KW I locator now reads §8.2 pp.14–15: the linkage is glossed on p.14 and used
   on p.15.
7. **Continuous induction.** The `system-operations` verification and the reader's
   conventions table require R01.1/refined-induction-interface, but no target
   listed it. It is now a prerequisite of `system-operations`,
   `galois-grothendieck-ring` and `brauer-induction-system`, and the R01.1
   request's `neededBy` includes the Brauer target.
8. **Requests.** The Class field theory Part II request cited "ACC+ p.197", which is
   an author-copy page; it now cites §7.1, published p.1092, matching the source
   recorded for `acc-2023`.
9. **Coverage notes and reader.** The first paragraph of the atlas record of
   R24.5:operations is R23.1's Moret–Bailly field selection; the BCGP
   Proposition 9.1.12 route points here because of that paragraph. Both the
   coverage note and the reader now say that this material belongs to R23.1's
   accepted targets and is not planned here. The R24.5:operations coverage note
   also records the upstream-tier move-down (see the questions below).

## Baseline

All 16 declarations were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 in the
lean-check build tree: `Complex.Gammaℝ`, `Complex.Gammaℂ`,
`Complex.Gammaℝ_mul_Gammaℝ_add_one`, `Field.absoluteGaloisGroup`, `Representation`,
`Representation.IsSemisimpleRepresentation`, `Representation.IsIrreducible`,
`Representation.dual`, `NumberField.FinitePlace`, `NumberField.FinitePlace.embedding`,
`LinearMap.charpoly`, `Representation.ind`, `Rep.indResAdjunction`, `Matrix.det`,
`Matrix.charpoly` and `ZMod`. Each provides exactly the carrier or identity
claimed, and none is cited for an arithmetic theorem. The reader's remark on
`ContRepresentation` (continuity of each operator, not of the group variable)
matches the pinned docstring and structure. No citation was removed.

## Closure, requests and red-team findings

- I resolved every prerequisite id, request supplier and node id that the
  packet, the reader, the gaps or the requests name, against the packets, the
  decompositions and the stage list. All exist. The one non-accepted supplier
  is PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences, in the
  needs_changes P7 packet, which the accepted owner node already uses.
- No R24.5:operations target has an AutomorphicGaloisRepresentations,
  WeightsInEtaleCohomology, R23 or existence-layer prerequisite, so the generic
  layer really does precede the eigenform constructions.
- Supplier statements were read for R19.2 (normalisation dictionary;
  uniqueness, determinant, oddness and irreducibility), R19.3 (fixed eigenform
  family; monodromy-weight purity), R19.4, R19.5/skinner-full-hilbert-coefficient-prime,
  R17.4 (solvable base change, tower independence, descent), R17.6
  (compatible base change and descent) and every R32.6 node.
- The R17.6 overlap request is precise. The R17.6 stage text exports base-change
  and descent statements "for the compatible-system construction", and its
  compatible-descent node handles only one cyclic step. The norm-one argument
  is mathematically sound: by Gallagher, each Mackey summand is the invariant
  line of a finite character, and recognition makes that character independent
  of λ.
- **RT-AREA-langlands-2/10:** handled. The carrier stays in R24.5:operations,
  R19.3 imports it, and the R34.6 purity export keeps its guards (the upstream
  note records the owner split).
- **RT-AREA-langlands-2/21:** handled, with correction 6 above.
- **RT-AREA-langlands-2/30:** handled. `strict-brauer-system` takes
  KW strictness at every coefficient prime, including ℓ = 2 and reducible
  residual members, from Skinner through the decomposition-field descent of
  KW II p.93. The almost-strict theorem remains the KW-faithful variant.
- Library and duplication checks: `data/library-coverage.json` has no R24.5 or
  R24.6 record. TauCetiRoadmap main, Completed and the current Tau Ceti library
  contain no arithmetic compatible-system carrier; the "compatible system"
  hits concern profinite or Kummer data. No atlas roadmap plans Serre's general
  correspondence between algebraic Hecke characters and ℓ-adic characters
  (ComplexMultiplication CM.4 covers only CM abelian varieties), so the
  Class field theory Part II proposal is consistent with §15.

## Mathematics rechecked by hand

The Γ-factor of H¹ of an elliptic curve at a real place reduces to Γℂ(s), with
ε = −1. The cyclotomic and trivial completed L-functions came out as stated. The
dual polynomial X²−(5/6)X+1/6, the tensor collision {0,−1,1,0} and Sym-power
regularity in rank two all check. For polarizations I recomputed the signs and
multipliers: tensor μμ′δ with sign εε′, Sym^k and ∧^k μ^kδ^{k−1} with sign ε^k,
dual μ⁻¹. The norm-character extension takes the value +1 at every complex
conjugation, because χχ^c(c_v c_w) = 1. In the symmetric pairing
J(x, r(c)y) on H¹ of an elliptic curve over ℚ(i), μ(c) = −1. For Δ, τ(2) = −24,
reducibility occurs exactly at 2, 3, 5, 7, 691 and the dihedral prime 23 lies on
the boundary 2·11 + 1. The S₃ residual weight is ℓ. Diamond's divisibility
argument holds for every odd q. All eleven statements in the suggested file are
true, and the file states no sorry'd data.

## Questions for the orchestrator

1. **Upstream tier.** In the Caraiani–Newton order this roadmap is tier 22, but
   its generic R24.5:operations targets are cited upward:
   - WeightsInEtaleCohomology (tier 12) cites `weakly-compatible-system-rank-n` and `compatible-system-predicates`;
   - AutomorphicGaloisRepresentationsPartII (17) cites the operations layer, `polarized-system`, `character-system` and the linear-algebra operations;
   - AutomorphicGaloisRepresentations (18) cites `character-system` and the operations stage;
   - GL2ModularityLifting (21) cites `compatible-system` and `rank-two-reducibility-independent-of-lambda`.

   Under the tier rule these notions move down into a citing lower-tier
   roadmap when it is packaged, and R24.5:operations then imports them. The
   import contracts of this packet are the specification to move. This
   follows the RT /10 direction ("generic definitions below the existence
   constructions") at the tier level, which the atlas-graph fix alone does
   not achieve.
2. **Owner synchronisation.** The import checks refine their R24.3 owner nodes;
   the owner packet itself is unchanged. The refinements are the Brauer
   overlap hypothesis, the almost-strict wording, v4 numbering and proof
   route for the Grothendieck ring and density-one theorem, polarized total
   oddness, and this review's corrections. The atlas panels show the older
   R24.3 statements while this reader shows the refined ones, so the next
   package revision should take the R24.5 import checks as authoritative for
   these 30 targets.
3. **BCGP Proposition 9.1.12.** It needs Moret–Bailly over a totally real base,
   with a surjection onto a finite G, for Calegari's X_G.
   R23.1/surjective-specialisation-finite-quotient is stated for an imaginary
   CM base, following BCGNT Proposition 4.5.1. Whoever next reviews R23.1 or
   the package should confirm that the totally real case is covered.
4. **Identifier collision.** The R23.1 packet reuses the issue ids E2–E5, which
   the R24.3 packet also uses. This review numbered its issue E13 to avoid both
   ranges.

## Validation

- `python3 scripts/check_blueprint.py` on the packet, with and without
  `TAUCETI_BASELINE`: 0 errors, 0 warnings (3 planned stages, 21 requests, 8 gaps).
- `lean-check` on the suggested file (unchanged): elaborates at the pinned build;
  the only warnings mark the 11 intentionally unproved statements.
- A mechanical cross-check (Sonnet helper) confirmed that every API name, test
  name, locator and prerequisite in the import checks appears verbatim in the
  reader, with 30 sections for 30 targets; after the edits the reader again
  agrees with the packet.
