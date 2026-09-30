# RT-AREA-padic-2: fixes, round 2

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5152, job FIX-RT-AREA-padic-2~2).

**Scope.**
- **Findings:** `RT-AREA-padic-2.result.json` (red team by Claude Code, cc-39fac3). **Verdicts:**
  `RT-AREA-padic-2.review.json` and `reviews/REV-RT-AREA-padic-2.md` (Codex, codex-hjdg0j). This job covers the 36
  confirmed high and medium findings, /1–/36.
- **Round 1:** `RT-AREA-padic-2.fixes.md` (Claude Code, cc-48533a). Its only deliverable was that report, so it wrote
  every fix as exact edits for the file's owner.
- **This round:** it applies round 1's edits to the three finished blueprints the issue lists: Faltings finiteness,
  PerfectoidSpaces P0 and AdicSpacesPartII. It applies each edit with round 1's cross-finding adjustments (C1–C2).
  Where round 1 wrote an edit against a base decomposition in `data/`, it is applied to the packet's copy of the same
  node, since an accepted packet replaces the base decomposition of the layers it covers.

**Independence.** I did none of:
- the red team;
- its verification;
- round 1;
- the three blueprints and their reviews (Faltings by cc-7b31c4, reviewed by cc-2aeb03; PerfectoidSpaces--P0 last
  written by cc-e94dc5, reviewed by Codex codex-hjdg0j; AdicSpacesPartII by cc-e94dc5, reviewed by cc-39fac3).

**Files changed.**
- `packets/FaltingsFinitenessAndIsogenyTheorems.json`, `readmes/FaltingsFinitenessAndIsogenyTheorems.md` and
  `suggested/FaltingsFinitenessAndIsogenyTheorems.lean` (docstrings only).
- `packets/PerfectoidSpaces--P0.json` and `readmes/PerfectoidSpaces--P0.md`.
- `packets/AdicSpacesPartII.json` and `readmes/AdicSpacesPartII.md`.

Each file was edited by a script that asserts each replaced string occurs once, and each keeps its own JSON format.
Nothing in `content/campaign/` or `data/` was touched.

## Where each finding went

The issue hands the findings on unwritten blueprints to the jobs that will write them. This round writes no packet for
them:

| Blueprint job | Findings |
|---|---|
| BP-AInfCohomology--AI.0 | /1, /3, /9, /10, /11, /15, /17 |
| BP-AInfCohomology--AI.6 | /13 |
| BP-AutomorphicGaloisRepresentations | /22 |
| BP-AutomorphicGaloisRepresentationsPartII--AG2.0 | /32 |
| BP-AutomorphicGaloisRepresentationsPartII--AG2.6 | /22 |
| BP-CohomologyComparisons | /3, /4, /23 |
| BP-CrystallineCohomology--CR.0 | /2, /8, /12, /16, /36 |
| BP-CrystallineCohomology--CR.5 | /14 |
| BP-DerivedDeRhamCohomology | /7, /35, /36 |
| BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory | /4, /5 |
| BP-IgusaVarietiesAndTorsionConcentration | /3 |
| BP-PadicDifferentialEquationsAndRigidCohomology | /31, /32, /33, /34 |
| BP-PadicHodgeTheory--P7 | /3, /18, /19, /20, /21 |
| BP-PadicHodgeTheory--R06.5 | /22 |
| BP-PrismaticCohomology--PR.0 | /4, /6, /24–/30 |
| BP-RelativeFarguesFontaine--RF0 | /21 |

Round 1's edits to the three finished blueprints come from /5, /17, /20, /21 and /32, and the sections below apply
them. I searched round 1 for every other edit that names a node, stage text or file of these three roadmaps:
- /9 moves three PadicHodgeTheory P8:local-rational nodes to AI.3. The PerfectoidSpaces P2, P3 and P7 links into them
  are records of the PadicHodgeTheory decomposition, and the P0 packet names none of those nodes, so nothing changes
  here.
- /25, /29, /31 and /33 mention AdicSpacesPartII only as a path in the build graph, or as F1's existing ownership of
  the dagger carrier. They ask for no change to this packet.

## /5 and /20 (with C1 and C2): Tate's and Raynaud's inputs to Faltings finiteness

Round 1's /5 edit 8, /20 edit 6 and C1–C2 are applied to the Faltings packet. C2 drops /20 edit 7, because /5 edit 8
removes the gap that edit 7 would have rewritten.

**Tate's paper.** Round 1 removes the gap on Tate's paper because the FiniteFlatGroupsAndIntegralPadicHodgeTheory
packet has read it (source Tate67, a public Purdue scan). I read the page the erratum cites, p. 182, on the page image
of that scan, which has the same SHA-256 as Tate67. It is Tate's proof of Proposition 12: "Let D_i be the affine
algebra of E_{i+1}/E_i. … the D_i constitute an increasing sequence of orders in a finite separable K-algebra. Hence
there is an i_0 such that D_i = D_{i+1} for i ≥ i_0." The packet gains the source `tate-1967-p-divisible-groups`,
whose readSections say what was read in this job and what was not.

**The packet's own node texts.** The reviewer of the Faltings packet (cc-2aeb03) had already corrected the node texts
that round 1 quotes from `data/`. So the edits are made to the packet's own wording:
- **Local differential count** (R28.2): the count is imported from R07.1's invariant-differentials lemma, derived from
  Proposition 2 (a discriminant formula) and its Lemma 1. It is no longer taken from R35.4, which drops out of the
  node's prerequisites and out of request 19. (L1.)
- **Global determinant identity** (R28.2): Tate's Theorem 2 is the local Tate–Sen theorem of R06.1:tate-sen. The
  proof step adds round 1's remark that the global finite-order step is the class-field-theory step. The prerequisite
  R06.2 becomes R06.1. (L2.)
- **Hodge–Tate determinant** (R28.2): the Hodge–Tate decomposition is requested from R07.1, not T0, following round
  1's "the decomposition is R07.1's Hodge–Tate node" and /5 edit 10 (T2 proves its sequence compatible with R07.1's).
  The finite-image triviality comes from R06.1:tate-sen.
- **Determinant at the decomposition group** (R28.2) follows the same R06.2 → R06.1 change.
- **Closure tower** (R28.3): the shift n_0 is Tate's Proposition 12, requested from R07.1, with the p. 182 excerpt as a
  new source record.
- **Raynaud's determinant character** (R28.5): Théorème 4.1.1 and the comparison v(𝔇̄) = length s*(Ω¹) are requested
  from R07.1, which becomes a prerequisite. (L3.)

**Requests.** Links L1–L3 are decomposition links. In a packet they are prerequisites and requests:
- **Request 23 (Tate's Theorem 2):** its supplier changes from R06.2 to R06.1. Round 1 names the proposed sub-stage
  PadicHodgeTheory:R06.1:tate-sen, but that stage is not yet in the atlas, and `check_blueprint.py` accepts only
  existing stages or nodes. The request therefore names the parent R06.1, which contains the sub-stage and is already
  upstream of R28.2. Its need text says to re-point it when the sub-stage exists.
- **Request 24 (Hodge–Tate decomposition):** its supplier changes from T0 to R07.1.
- **Two new requests to R07.1:**
  - the invariant differentials of the levels and Tate's Proposition 12;
  - Raynaud's Théorème 4.1.1 with the different comparison. For the comparison, the request records that no source has
    been read, as round 1's edit 7 does.

**Gaps.** The two gaps are removed: "Tate's p-divisible groups paper … is unread" and "Raynaud's Théorème 4.1.1 has no
supplier stage". The coverage notes of R28.2 and R28.5 name the new suppliers.

**The reader document** gets the same changes in its versions of these nodes, loses the two gap sections, and gains a
closing "Fixes" section. In the suggested file, three docstrings name the new suppliers.

The reader document predates the packet review: it still describes 32 nodes where the packet has 56, and the packet's
review status is needs_changes on the document. I changed only the passages these fixes touch. The rest is left for the
document revision the review asks for.

## /21 and /17: the θ-kernel theorem is P1's

Round 1 edits the PadicHodgeTheory decomposition and the P7 packet so that R06.1 imports P1's theorem instead of
proving it again. Edits 2c–2e change the links between PerfectoidSpaces P1 and
R06.1/bdr-plus-of-perfectoid-affinoid-algebras. In the P0 packet those links are the `uses` records, which now match:
- **P1/tilt-of-perfectoid-tate-ring** no longer lists R06.1/bdr-plus-of-perfectoid-affinoid-algebras (edit 2d). Its
  reason, R♭+/π ≅ R+/π♯, served only the generation step that R06.1 no longer proves.
- **P1/fontaine-theta-and-primitive-kernel's** record for R06.1 says what R06.1 imports: surjectivity and generation by
  any primitive element, parts (a)–(c). R06.1 proves only that Scholze's ξ is primitive (edit 2c).
- **P1/fontaine-theta-and-primitive-kernel** gains a record for AInfCohomology AI.0. AI.0 specializes the
  principal-kernel theorem to O_C through Q0:integral-algebra, and Mathlib lists that theorem as a TODO (/17's
  verdict).
- **P1/distinguished-element-criterion** gains a record for R06.1's node: part (a), that the image of ξ is a
  nonzerodivisor (edit 2e).

The reader document's *Uses.* lists change to match. The node statements are unchanged: round 1 checked that the P0
packet's copy of P1/fontaine-theta-and-primitive-kernel already has parts (b) and (c).

## /32: F1 supplies the dagger complexes; the comparison with rigid cohomology is RD.4's

Round 1's edit 2 rewrites F1's stage text. Rigid-cohomology comparisons and finiteness belong to RD.4 and RD.5, and
F1's compact-support variants are complexes. In the packet and reader document:
- **F1's coverage note** says the compact-support and logarithmic complexes are carriers. Their comparison with rigid
  cohomology of the special fibre (Grosse-Klönne's Theorem 5.1, as HLTT Lemma 6.8 uses it) is planned at RD.4,
  finiteness at RD.5 and Frobenius weights at RD.6, and AG2.4 imports all three. The note already placed
  Grosse-Klönne's Theorems 3.5 and 5.1 with RD.4.
- **The AG2.4 `uses` records** of F1/compact-support-log-complex and F1/dagger-de-rham-complex say what AG2.4 does
  with the hypercohomology:
  - it identifies it with rigid cohomology through RD.4's comparison, for the dagger tube of the special fibre;
  - it imports finiteness and weights.
- **Records for RD.4/grosse-kloenne-dagger-comparison,** the node round 1 plans for the RD blueprint job (edit 5a), are
  added to F1/dagger-space, F1/dagger-de-rham-complex and F1/weak-completion. These are the three F1 prerequisites that
  edit 5a names, and I checked that all three ids exist in this packet.
- **The reader document's boundary paragraphs** no longer say that AG2.4 owns the ordinary-locus rigid cohomology.
  AG2.4 forms that cohomology from F1's complexes and imports the comparison, finiteness and weights. It keeps the
  boundary-stratum adapter (HLTT Lemma 6.21) and the slope comparisons.

## Not applied, and why

- **Edits to files outside this job.** All of round 1's other edits go to the stage texts, `data/atlas.json`, other
  packets and the restructuring files, and they stay with the owners named there.
- **The stage R06.1:tate-sen** is not created here, since that is an atlas edit. Request 23 names its parent until it
  exists.
- **Moving AdicSpacesPartII:R2/hasse-loci-admissible-opens.** Round 1's /5 notes that this node, which rests on
  ModularCurvesPartII:R13.2 ("an elliptic-curve application placed in a foundational layer"), makes the path R07.1 →
  R13.2 → R2 → R3 → R06.1 in the build graph. No confirmed finding asks to move it, and round 1 calls the Tate–Sen
  sub-stage "correct either way". It is left in place and listed for the maintainer.

## For the maintainer

- **Request 23.** When PadicHodgeTheory:R06.1:tate-sen is added to the atlas (/20 with C1), re-point request 23 of the
  Faltings packet to it, together with the prerequisites of the three R28.2 nodes that now name R06.1.
- **R07.1 node ids.** When the FiniteFlatGroupsAndIntegralPadicHodgeTheory packet is reviewed, the Faltings requests to
  R07.1 can cite its nodes:
  - R07.1/p-divisible-discriminant;
  - R07.1/hodge-tate-p-divisible;
  - R07.1/closure-of-generic-p-divisible-subgroups;
  - the invariant-differential and Raynaud nodes that /5 edit 7 asks that packet to add.
- **The Faltings reader document** still predates its packet's review. That is outside these findings.
- **AdicSpacesPartII:R2/hasse-loci-admissible-opens** is a modular-curve application inside a foundational layer. The
  maintainer may want it moved to ModularCurvesPartII.

## Checks

- `python3 scripts/check_blueprint.py` on each of the three packets: 0 errors, 0 warnings. The Faltings packet goes
  from 14 gaps and 35 requests to 12 gaps and 37 requests.
- `research/blueprint/intake.py check-files` on the deliverables: no problems.
