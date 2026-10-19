# DESIGN-PurityForFlatCohomology handoff

Issue #3360. Worker: Claude (Opus 5.5), session `claude-Q5c44Q`, 19 October 2026. The bot
confirmed the claim before work began. This is a complete design pass at target level, ready for
its independent review. It is a plan, not a formalisation, and it is not closed.

## Deliverables

- `research/blueprint/roadmaps/PurityForFlatCohomology.json`: new roadmap, area
  `algebraicgeometry`, seven stages PF.0–PF.6, status `draft`.
- `research/blueprint/packets/PurityForFlatCohomology.json`: status `complete`, 57 nodes
  (5 definitions, 2 constructions, 50 theorems), 51 API items, 33 unit tests, 24 planets
  (at most 6 per layer), 22 baseline declarations, 8 requests, 12 gaps, 6 source issues,
  4 restructure proposals, `routeCoverage` for all 80 route items, `upstreamImports` and
  `upstreamNotes`. `python3 scripts/check_blueprint.py --index <pinned declaration index>`
  reports 0 errors and 0 warnings.
- `research/blueprint/readmes/PurityForFlatCohomology.md`: reader document, about 30,000 words,
  generated from the packet. It was checked with a Python port of the atlas renderer's inline
  parser (no stray emphasis, mathematics or links) and with markdown-it (only the intended
  labels are emphasised).
- `research/blueprint/suggested/PurityForFlatCohomology.lean`: 314 lines. Real-bodied light
  definitions only (`puncturedSpectrum`, `puncturedSpectrumOpens`,
  `presentationVirtualDimension`, `IsParafactorial`), with ring-level theorems and tests that are
  statable at the pins. A closing register lists every other packet name. It **compiled** with
  `lean-check` (Mathlib 082e2d37e8, Tau Ceti f790474): 29 warnings, all `declaration uses
  sorry`. A `run_cmd` audit found no `sorry` in any statement and no `sorry`'d definition value.
  A script checked that every API and test name of the packet occurs in the file.

## Stages

| Stage | Contents | Status |
|---|---|---|
| PF.0 | punctured spectrum; fppf cohomology with supports and its local-to-global spectral sequence (CS24 7.1.1); regular-sequence vanishing; non-Noetherian Hartogs (CS24 7.2.7) | planned |
| PF.1 | virtual dimension (SGA 2 XIV 5.2–5.5, CS24 3.2.1–3.2.2); étale depth ≥ vdim (CS24 3.2.4); Zariski–Nagata for vdim ≥ 3 (CS24 3.3.1) | planned |
| PF.2 | depth vanishing for 𝔾_a, α_p, ℤ/p (4.1.10); root extraction (4.1.11); finite flat covers (4.1.12); characteristic p purity (4.1.13) | planned |
| PF.3 | Dieudonné side; Prop. 4.2.4, 4.2.7–4.2.10; Katz's lemma; Thm 5.5.1; key formula 6.1.1; perfectoid purity 6.1.2 | planned |
| PF.4 | Lemma 6.2.2; main theorems 6.2.3, 6.2.4, 6.2.7; Remark 6.2.6 | planned |
| PF.5 | global purity 7.1.2 (corrected); Auslander; torsors and gerbes 7.1.3; parafactoriality; Gabber's conjectures 7.2.1, 7.2.5; Remarks 7.2.2, 7.2.4, 7.2.6; Cor. 7.2.3; Grothendieck's 𝔾_m torsion and dimension-two results; multiplicative type 7.2.8–7.2.9 | planned |
| PF.6 | C19: strict-local Brauer purity (5.3); tori (1.4, 6.1); Brauer purity (1.1); coniveau spectral sequence; generic H² injectivity; intersection formula (6.2, 1.2); flasque tori and the norm-torus counterexample (6.3); residue maps and sequences (6.4) | planned |

No stage is closed: each rests on recorded gaps (below).

## Ownership decisions (checked against TauCetiRoadmap on 19 October 2026)

- **SchemeAndStackFoundations is on TauCetiRoadmap main** (f30bfe0a). It supplies sites,
  local cohomology (§2.7), the Kummer and Artin–Schreier sequences (§2.11), Gabber's affine proper
  base change (§2.15), Brauer groups of schemes (§2.22), Hartogs (§0.6) and henselian pairs (§0.14).
  These are imported (`upstreamImports`, and stage requests to SF.0/SF.1/SF.2/SF.4 marked
  "imported, no new content" where that is so).
- **Absolute purity** (CS24 3.1.3, C19 absolute-purity-input) is planned upstream in
  LefschetzPencilsAndVanishingCycles §0.10 (draft PR #873). It is imported here, and a restructure
  proposal tells the pending EtaleDualityAndPerverseSheavesPartII design to import it rather than
  plan it.
- **Zariski–Nagata purity for regular rings** (CS24 item 050, SGA 2 X 3.4(i)) is LocalPurity
  §§2.1–2.2 (PR #1102).
- **Local Grothendieck–Lefschetz** (SGA 2 XI 3.13(ii)) and its SGA 2 X–XI proof route, which are
  eleven of the PAPER-CESNAVICIUS-19 route items, are DeformationAndDerivedPatchingAlgebra §6.9
  `localCI_parafactorial` (PR #1034). They are not planned here, apart from the definition of
  (geometrically) parafactorial local rings. `upstreamNotes` records the inputs that the upstream
  proof needs, and the misprint in SGA 2 XI 3.17(e).
- **C19's main theorem** (Theorem 5.3) is planned through CS24, as CS24 itself does: CS24 6.2.7
  for μ_n in degree 3, Grothendieck in dimension 2, and the torsion of H²(𝔾_m). C19's own perfectoid
  route is not needed. Its inputs (C19 §§2–4) were routed to SchemeAndStackFoundations SF.1/SF.2
  "as sources", and that roadmap went upstream without them. Only C19 Corollary 2.4, for Theorem 1.4,
  is still needed (gap SF-PII-tori).
- **André's lemma**: the plan uses PerfectoidQuotients Q3/andre-flatness-lemma (BS22 7.14) with
  CS24 footnote 25. So the ind-syntomic André lemma (CS24 2.3.4, PQ Part II) is not a prerequisite.
- **Planned here although general**: classical fppf cohomology with supports (PF.0), the coniveau
  spectral sequence, Grothendieck's torsion of 𝔾_m-cohomology (Brauer II 1.4/1.8, which contains
  C19 Lemma 3.2), and the DVR residue map. None has an owner at the pins or upstream. The
  restructure entry asks SchemeAndStackFoundationsPartII to import them.

## Gaps (exact statements in the packet)

The gaps owned by the pending designs are the contracts those designs are to meet.

- **DESIGN-SchemeAndStackFoundationsPartII (#3361)**:
  - SF-PII-key-formula: CS24 4.1.4–4.1.9.
  - SF-PII-deformation: the Bégueri resolution, Česnavičius 2015 B.14 and CS24 5.1.13, 5.2.6 and 5.2.8.
  - SF-PII-continuity: CS24 5.3.5, 5.3.7 and 5.3.8.
  - SF-PII-excision: CS24 5.4.4, 5.4.5 and 5.5.3.
  - SF-PII-brauer: Gabber–de Jong, and Br = Br′ in dimension ≤ 2.
  - SF-PII-tori: groups of multiplicative type over schemes, flasque tori, and C19 2.1–2.5 and Appendix A.
  - SF-PII-algebraization: Stacks 0DXR, 0DX9 and 0EJP, and Ferrand–Raynaud 4.2.
- **DESIGN-PerfectoidQuotientsPartII (#3362)**: PQ-PII-towers, which covers CS24 (2.1.2.3),
  (2.1.3.2), Corollary 2.1.6, Proposition 2.1.9 (valuation rings) and Lemma 3.1.1 (= C19 5.1–5.2),
  with the tilt of the tower.
- **DESIGN-EtaleDualityAndPerverseSheavesPartII (#3363)**: EDP-PII-local-lefschetz, which is
  CS24 Lemma 3.2.3 with ILO XV 1.2.4, ILO XVII 0.2 and SGA 5 I.
- **Unowned, small**:
  - AVRAMOV: additivity of the complete-intersection defect. Only the general form of item 044
    needs it.
  - BURCH-KOHN: three-generated ideals of maximal projective dimension. Only CS24 Remark 3.2.2(b)
    needs it.
  - BR-RESIDUE-LANG: Br(K^unr) = 0.

## Requests

- SF.0, SF.1, SF.2 and SF.4: what each imports from SchemeAndStackFoundations, and what it needs
  beyond that roadmap.
- DeformationAndDerivedPatchingAlgebra:R03.3: Stacks 07DV, 09Q1 and 09Q7, and factoriality of
  regular local rings. It also covers §6.9, Avramov and Burch–Kohn.
- DerivedDeRhamCohomology:DD.1: CS24 Lemma 6.2.1 (Yekutieli), and the a-adic bounded-torsion
  criterion.
- InverseGaloisAndArithmeticFundamentalGroups:IG.0: SGA 1 V 6.9–6.10.
- LefschetzPencilsAndVanishingCycles:LPV.0: an import of §0.10, with no new content.

## Source issues

PurityForFlatCohomology/E1–E5 restate PAPER-CESNAVICIUS-SCHOLZE-24/E1, E4, E11, E12 and E13.
E1 is the d = 1 error in Theorem 7.1.2: the regular local rings must have dimension
≥ max(d − 1, 1). PF.5/global-flat-purity uses the corrected statement. E6 restates
PAPER-CESNAVICIUS-19/E1, the noncommutative gap in C19 Proposition 2.2.

I checked one apparent omission and found none: CS24's proof of 6.2.7 writes
R ≅ W(k)⟦x⟧/(p − f), and the equal-characteristic case is f = 0. The node now says so.

## Checks run

- `scripts/check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- `lean-check` on the suggested file: it compiles with sorry warnings only, and the `run_cmd`
  sorry audit is clean.
- A Sonnet supplier-contract cross-check of all 45 (citing node, foreign node) pairs. It raised 8
  mismatches and about 25 caveats. I verified each against the source and fixed the real ones:
  - Raynaud's embedding is now used through B[p^n] and B[p].
  - The Cohen presentation now uses a Cohen ring, R03.1/cohen-series-presentation.
  - The DD.1 bounded-torsion citation is now a stage request in a-adic form.
  - The PD.6 base change is stated as underived.
  - θ-naturality was added.
  - The perfectoidness of the valuation-ring factors and (A/p)_red was added to PQ-PII.
  - SGA 1 V 6.9–6.10 was requested from IG.0.
  - The strict henselization and localization of complete intersections were requested from R03.3.
- A Sonnet locator sweep of the 90 CS24/C19/SGA 2/EGA IV₄/Poonen locators against the source texts.
  85 rows were correct. I fixed the 5 it flagged:
  - SGA 2 XI 3.13 is on printed p. 105, not p. 113.
  - The parafactoriality definitions are now cited to SGA 2 XI 3.1–3.2, pp. 101–102, and not to C19.
  - A wrong CS24 7.2.5 locator was dropped.
  - Two wordings were softened: the punctured-spectrum match, and Poonen 6.8.4's "might suffice".

## Sources

Read for this job, all free:

- CS24: arXiv 1912.10932v3, SHA-256 2f9d3ee8…. Read §§1, 3, 4, 5.4–5.5, 6 and 7.
- C19: arXiv 1711.06456v4, SHA-256 a62a12bb…. Read §§1–3, 5–6 and App. A.
- SGA 2: arXiv math/0511279v1. Read X §3 and XIV §5.
- EGA IV₄ §21.13: the Numdam copy in the cleared library.
- Poonen, *Rational points on varieties*: author's version, §6.8.
- Stacks tags 07DV, 09Q7, 0DX9, 0DXR and 0EJP.
- The TauCetiRoadmap READMEs at the heads recorded in the packet.

Cited through CS24 and C19 and not read, because no free or cleared copy exists:

- Grothendieck, *Le groupe de Brauer* I–III.
- Avramov 1977.
- Katz 1973.
- Auslander 1962.
- Moret-Bailly 1985.
- Boutot 1978.
- Colliot-Thélène–Sansuc 1987.
- DeMeyer–Ford 1984.

Also not reread: Bouthier–Česnavičius and ILO, which are free on arXiv. The Auslander and Katz nodes
carry the standard arguments, which should be checked against those sources when they are available.

## Next steps

1. The independent review of this design.
2. The three pending Part II designs should take over the SF-PII, PQ-PII and EDP-PII gaps. When
   they land, the gaps here can be repointed to their node ids.
3. Re-check the PrismaticCohomologyPartII PD.6 node ids after that packet's revision, since its
   review status is `needs_changes`.
