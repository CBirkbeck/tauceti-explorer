# Automorphic L-functions revision 2 — completed handoff

Issue: #6926. Worker: Codex, session `codex-zGTLaB`, 8 October 2026.
Scope: `AutomorphicLFunctionsAndLocalFactors:AL.0` through `AL.5`, target level.
Packet status: `complete`; all six coverage records are `planned`. No stage is
`closed`, and every implementation status remains `unchecked`.

## Result and review disposition

This revision reconciles the reader with the corrected packet and suggested
file. It preserves all 123 node IDs, statements, hypotheses, prerequisite
lists, proof routes, APIs, tests, planets, coverage records, gaps, requests and
structural proposals. The existing independent `review` and `reviewHistory`
objects are unchanged. Completion describes the planning pass; it supplies no
formalized proofs and does not certify the unresolved proof-source leaves.

The full report [REV-AutomorphicLFunctionsAndLocalFactors](../reviews/REV-AutomorphicLFunctionsAndLocalFactors.md)
and the applicable AL findings in
[REV-FIX-RT-AREA-automorphic-1~4](../reviews/REV-FIX-RT-AREA-automorphic-1~4.md)
were read. The second report confirms the intervening packet corrections but
identifies the reader's remaining stale statements. This revision incorporates
those corrections throughout the reader rather than leaving competing claims
in revision appendices:

- Multiplicative Haar rescaling multiplies both the zeta integral and its
  normalized distribution by the same scalar. The convention paragraph now
  retains that scalar and explains standard-vector and global-volume changes.
- The archimedean Rankin–Selberg realization uses Jacquet's bounded growth
  space. Equal rank retains its finite sum of completed tensors and Schwartz
  functions, and the reducible exceptions remain explicit.
- GLₙ Fourier reconstruction precedes the deductions of global genericity,
  Whittaker factorization and ordinary multiplicity one. The completed Flath
  input is requested from AF.2; AF.3 supplies the cuspidal carrier and rapid
  decay. Ordinary multiplicity one has its own declaration before strong
  multiplicity one.
- The rational-period comparison retains the Whittaker/cohomological rational
  structures, semilinear action and Gauss twisting obligations in G12. The
  GL₂/ℚ critical-value interface and the separately owned BSW number-field
  theorem have their actual ranges.
- Full-rank and reduced-rank converse theorems have separate reader entries,
  including the rank-two boundary, niceness of completed dual twists and the
  exceptional-set conclusion. Their proof interiors and unavailable native
  signatures remain G16.
- All acceptance checks, direct inputs and verified locators now accompany
  their declarations. The reader also includes all 16 gaps, 34 detailed
  supplier contracts and three structural proposals.

The suggested self-duality theorem previously quantified over every native
locally compact nontrivially normed field, beyond the packet's number-field
completion scope. Its elaborated signature now specializes to the native real
field. The named omission records the complex and finite-completion versions,
their trace/duality suppliers and the separate positive-characteristic input.
No arbitrary proposition carrier was introduced to stand in for missing data.

The packet adds attributed revision checks and scoped source-read records.
Two Yun–Zhang source-correction descriptions were restated in our own words.
No source passages, PDFs or extracted source texts are in these deliverables.

## Size and coverage

| Item | Count |
| --- | ---: |
| Definitions | 29 |
| Constructions | 2 |
| Theorems | 70 |
| Lemmas | 14 |
| Comparisons | 8 |
| Total nodes | 123 |
| Definition/construction API items | 137 |
| Definition/construction unit tests | 118 |
| API items including theorem interfaces | 143 |
| Tests including multiplicity/converse interfaces | 128 |
| Planets | 29 |
| Pinned baseline declarations | 68 |
| Sources | 33 |
| Routed source-coverage items | 39 |
| Named gaps | 16 |
| Supplier requests | 34 |

The packet checker reports the definition/construction API and test counts;
the larger totals include the extra theorem interfaces. Every definition or
construction retains at least three discriminating tests and its recorded uses.

| Stage | Status | Remaining named gaps | Planets |
| --- | --- | --- | ---: |
| AL.0 | planned | G1–G4 | 6 |
| AL.1 | planned | G3 | 6 |
| AL.2 | planned | G1, G5, G8, G9, G11, G14, G15 | 6 |
| AL.3 | planned | G1, G6–G13, G15, G16 | 6 |
| AL.4 | planned | G13, G15 | 2 |
| AL.5 | planned | G12, G13 | 3 |

## Sources and baseline checked in this run

All 68 baseline declaration statements were read from Git objects at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Fourier and tempered-distribution
theorems, native additive subgroup/character/measure APIs, meromorphic orders,
characteristic polynomials and the Tau Ceti conductor interfaces remain imports.
The reviewed six library-coverage rows and accepted RS-13 result/report were
read. All six target descriptions, 35 touching stage edges and four current
applicable upstream link records were checked. Upstream density comparisons
used the complete CompactGroups and InductionRestriction reader documents.
The revision audit distinguishes these current link records from the historical
count in the inherited audit.

Fresh mathematical source checks are attributed to this session in each
source's `readSections`. They cover 17 sources, restricted to these passages:

- Tate: §2.5, physical p.24; §4.4, physical pp.49–52.
- Kudla's published chapter: §3, pp.118–123, including Proposition 3.5 and
  (3.23)–(3.25).
- Zhang: §§11.1–11.2, published p.933.
- Yu: §5.1.2, pp.29–30; §6.1, p.43, Proposition 6.1.1 and Corollary 6.1.2.
- Yun–Zhang: Appendix B, pp.902–905, Proposition B.1, Theorem B.2 and Lemma B.3.
- Thorner–Zaman: §2B, p.1141, the primitive Hecke completion.
- Gross–Zagier: page image of IV §6, p.299, the gamma integral in the proof of
  Proposition (6.2).
- Raghuram: §2.5.2, pp.24–25, (2.37)–(2.39).
- Rodrigues Jacinto–Williams: Appendix B §B.2.1, pp.208–209, Theorem B.1.
- Chenevier–Taïbi: §§2.1 and 2.3, pp.274–275, including footnote 6.
- BCGP: Definition 1.8.25, p.16.
- Cogdell's Fields notes: Lecture 4 §§2–3, printed pp.31–34; Lecture 5 §1,
  Proposition 5.4, printed pp.41–42.
- Cogdell's integral survey: §1.1.3, pp.4–5.
- Humphries's archimedean survey: §§2.3.2–2.4.1, pp.5–6.
- Jacquet: §2, author pp.5–6 and 8–10, Theorems 2.6–2.7 and Remark 2.8.
- Borel: page images of pp.46–51 and 54–55, including Theorem 13.2 and §16.1.
- Cogdell's converse survey: §§2–3, pp.5–9, especially Theorems 3.1 and 3.3.

Twenty public PDFs were obtained in scratch and their hashes matched the
packet. The three additional hash checks do not assert fresh mathematical
reads. Earlier whole-paper reads, source findings and proof-source gaps remain
attributed to their original workers. The cleared private-library index was
consulted; this job required no private source. No uncleared book was acquired.

## What remains and where to resume

The completed reader gives each gap's full detail and affected nodes. These are
the precise outstanding obligations:

| Gap | Required next work |
| --- | --- |
| G1 | Supply the native arithmetic, representation, completed tensor and measure carriers before replacing their named signature omissions. |
| G2 | Establish the finite-completion duality inverse, continuity and trace/inverse-different comparisons. |
| G3 | Obtain or derive the point-supported distribution structure theorem and continuous invariant-distribution uniqueness. |
| G4 | Derive or source the K-Bessel order-derivative integral identity. |
| G5 | Refine finite-place Godement–Jacquet rationality, minimal denominator and global continuation from proof sources; supply the self-pair positivity convergence argument. |
| G6 | Read and refine the finite-place Rankin–Selberg proof interiors and their derivative-filtration interfaces. |
| G7 | Complete Jacquet's majorization, polar-part and induction proof leaves, retaining completed tensor continuity and K-finite exceptions. |
| G8 | Obtain the original general vertical-strip boundedness proof, with its precise representation hypotheses. |
| G9 | Obtain the requested AF classification/base-change extension and the descent proof leaves. |
| G10 | Establish the original boundary nonvanishing argument beyond the absolute-convergence half-plane. |
| G11 | Supply tensor l-adic cohomology, degree and alternating-duality outputs beyond finite-Galois Artin scope; handle the unitary degree twist. |
| G12 | Establish rational structures, comparison maps and the normalized Gauss-twist diagram from original proofs, with the actual critical-value dictionary and ownership ranges. |
| G13 | Supply ramified finite-place GLₙ parameter compatibility; keep the present comparison conditional. |
| G14 | Place and establish the general order-at-most-one/RH entire-function theorem in the AnalyticNumberTheory extension. |
| G15 | Supply multiplicative GLₙ Haar comparison, arbitrary-r Satake bounds and separate local diagonal-period multiplicity-one theorems. |
| G16 | Read and decompose the converse proof interiors, reductions, spectral inversion and exceptional-set modification; provide native global tensor/twisted-completion carriers and acquire the separate highly ramified variant. |

The 34 supplier requests remain in the packet and reader with their exact
contracts and `neededBy` nodes. They cover SR.1/3/4/5, AA.0/2, GlobalNumberFields
Layers 0/5/6/9/10, ClassFieldTheory Layer 7, LocalFieldsRamification Layer 3,
ArithmeticDirichletSeries Layers 3/8, AF.1/2/3/4, GS.6, FA.2/5, AN.2, RG2.5,
R01.2, R19.4, ModularSymbols L1/L2 and ALS.5. Repeated supplier stages represent
different contracts, including additive versus multiplicative Haar and
Whittaker uniqueness versus diagonal-period uniqueness. This run edited no
supplier and did not treat a request as an implemented theorem.

All three structural proposals are retained for maintainer integration: the
SR.1 Schwartz carrier boundary, the independent AL.3b converse prefix, and the
late rational-period/critical-value suffix. Until integration, current node and
stage IDs remain. An independent reviewer should check this reconciliation
against both reports and the source locators above; subsequent owners resume
the named gaps and contracts. No further node refinement is required by this
completed target-level revision.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicLFunctionsAndLocalFactors.json`:
  **0 errors, 0 warnings**; six stages planned.
- `lean-check research/blueprint/suggested/AutomorphicLFunctionsAndLocalFactors.lean`:
  **exit 0**, 183 warnings, every warning exactly `declaration uses sorry`.
  The file imports Mathlib modules only and was checked in the shared build at
  the exact Mathlib pin; it makes no claim to compile unavailable Tau Ceti
  supplier modules.
- Scratch consistency assertions passed for unchanged mathematical nodes and
  reviewer objects, all 123 reader declaration blocks, statements, hypotheses,
  acceptance checks and proof routes, every API/test name in the suggested
  declarations or omission manifest, all gap/request/proposal descriptions,
  the acyclic internal prerequisite graph and the 20 public PDF hashes.
- `git diff --check` passed. Only this issue's four authorized deliverables
  were changed. No compile or source-fetch process remains running.

All information needed to resume is in the packet, reader, suggested manifest
and this note. Scratch source copies and validation scripts are disposable and
are removed after submission.
