# Handoff: ASM-PrismaticCohomology (issue #254)

This job assembles the roadmap *Prismatic cohomology: relative, absolute, Nygaard and log variants* (`PrismaticCohomology`) from its two parts:
- part PR.0, layers PR.0–PR.7, 278 nodes, written by BP-PrismaticCohomology--PR.0 (issue #978) and reviewed by REV-PrismaticCohomology--PR.0 (issue #475);
- part PR.8, the logarithmic layer, 76 nodes, written by BP-PrismaticCohomology--PR.8 (issue #979) and reviewed by REV-PrismaticCohomology--PR.8 (issue #476).

Both reviews (6 October 2026) corrected their packet in place and returned `needs_changes`; both packets are `partial`.

Worker: Claude, session claude-vFPrIQ. I took no part in either part or in either review.

## Files

- `research/blueprint/readmes/PrismaticCohomology.md`: the full roadmap document. It is new; no roadmap-level document existed.
- `research/blueprint/suggested/PrismaticCohomology.lean`: the two suggested files joined into one. It is new.
- `research/blueprint/handoff/ASM-PrismaticCohomology.md`: this note.

The part packets are not deliverables of this job. `queue.json` lists only the three files above, and the intake refuses any other path in the pull request. They are unchanged, and the edits they need are listed below for a job that owns them. ASM-EllipticRegulators, ASM-HabiroRings and ASM-PerfectoidSpaces made the same choice. The issue text allows "fix references in the part packets where the fix is clear"; doing so here would have stopped the automatic intake.

## What was done

**The roadmap document** is generated from the two packets as their reviews left them, so it agrees with them node for node.
- **Coverage.** It carries all 354 nodes with every statement, hypothesis, proof outline, use, API item (749), unit test (476), acceptance check, prerequisite, source excerpt (683) and proposed location. It also carries all 108 requests, 22 gaps, 89 source issues with their review verdicts, 9 coverage records, 4 structural proposals, 9 cross-roadmap notes, 36 routed paper items, the 138 Mathlib declarations, both source ledgers with versions and hashes, and both packets' records (summary, provenance, checks and review notes).
- **Scripted check.** 13,859 strings were checked: every node id, title, statement, hypothesis, step, acceptance item, use, API and test name and statement, prerequisite, locator, excerpt, match note, planet, request, gap, source issue, coverage item, proposal, note, red-team record, baseline declaration, source id and URL, and both review notes. All of them occur in the document verbatim, after the notation step below for the PR.0 layer.
- **Reader synchronisation.** Both reviews said the part readers lagged the corrected packets and needed a revision. The PR.0 review listed the derived crystalline comparison, the flat topology, framed q-PD data, formula (9.3) and Lemma 9.6, Lemma 3.9, Theorem 3.10's proof, the unbounded-torsion example, PR.4's status and the node counts of PR.6 and PR.0; the PR.8 review gave no list. Because every node entry is generated from the corrected packets, all of these are current in this document; no part reader's text is reused.
- **Open points of the reviews.** The 29 PR.0 nodes and 13 PR.8 nodes the reviews marked `unverifiable` carry an *Open point of the review* paragraph with the review's note (for PR.0, the text after "Open:").
- **New sections.**
  - An introduction: purpose; scope, granularity and status; boundaries; conventions; sources; layer overview; layer dependencies; how to read a node entry; the suggested Lean file.
  - The boundaries cover each supplier with the stages cited and what is imported, the consumers, the accepted restructurings RS-01, RS-05 and RS-10, the red-team findings, the reviewed library audit (AUDIT-38) and ownership in the neighbourhood.
  - A written overview for each of the nine layers.
  - The closing records, merged by part, each with *Assembly status* lines where the assembly found something.
  - A statement of what the blueprint does not claim.
- **Notation.** The δ-ring prefix of PR.0 (the first 54 nodes, Codex-written) writes delta, phi, lambda, epsilon, mu, ->, <=, >= in ASCII. Its prose is printed as δ, φ, λ, ε, μ, →, ≤, ≥, and "δ ring", "δ structure" and similar become hyphenated. A masking step protects node ids and slugs, every packet API, test and declaration name, Lean-style identifiers, code spans, URLs and excerpts. "pi" is left alone, because in that prefix it means p·i. The two parts otherwise use the same notation. The dictionary in Conventions covers the two differences: the Frobenius twist (φ_A^*Δ against PR.8's Δ^(1)) and the twist of A/I-modules.

**Cross-part prerequisites.**
- **Direction.** Part PR.0 never cites PR.8.
- **Stage-level citations.** PR.8 cites PR.0–PR.7 by 40 bare stage ids and 4 node ids. All 4 node ids exist. Each of the 40 stage citations was mapped, with a sub-agent reading both packets, to the PR.0–PR.7 nodes that state what the citing node uses: 31 clearly, 6 probably (a hypothesis or formulation difference, stated in the note), and 3 with no node of PR.0–PR.7 that states the key input. Every proposed id was checked to exist. The document prints each result as an *Assembly note* at the citing node, and the table under "Edits the part packets need" lists them.
- **Internal requests.** PR.8's two requests to its own roadmap are answered by part PR.0, except the smooth proper pushforward asked of PR.7. They carry *Assembly status* lines.
- **Acyclicity.** The node graph of the two packets is acyclic: as it stands, with the proposed replacements, and even with every stage citation expanded to all nodes of the stage.
- **Undrawn layer edges.** Six layer edges are used by node prerequisites but are not stage edges of the atlas: PR.5 → PR.4, PR.6 → PR.4, PR.4 → PR.8, PR.5 → PR.8, PR.6 → PR.8, PR.7 → PR.8. Promotion draws no stage edge inside one roadmap (`scripts/blueprints.py`), so the maintainer must declare them. With them, and with the 123 cross-roadmap stage edges that the two packets induce, the stage graph of `data/atlas.json` stays acyclic (3,619 edges checked). The document's "Dependencies between the layers" gives the full table.

**`check_blueprint.py`** (with the pinned declaration index) reports 0 errors and 0 warnings on both packets, which are unchanged. `intake.py check-files` passes on the three deliverables.

**The Lean file.**
- **Layout.** One header and one import block: the union of the two parts' blocks, 97 Mathlib modules, and no Tau Ceti imports. The parts' namespaces are kept: `TauCeti.Delta`, `TauCeti.Prismatic.*` (PR.0–PR.7) and `TauCeti.LogPrismatic` (PR.8). The PR.0 body comes first, then the PR.8 body, then a node index listing every node of both packets with the packet names typed for it.
- **Elaboration.** `lean-check` at the pinned Mathlib 082e2d3 exits 0. It reports no error, and its only warnings are 1,423 `declaration uses 'sorry'`. There is no `axiom`, no `True`, and no `Prop`-valued placeholder (`def … : Prop := sorry` or a `Prop` field standing for an unstatable condition).
- **Names.** Every node id and every API and test name of both packets (1,225 names) occurs in the file. Every declaration name of the two part files is kept.
- **PR.0–PR.7: the review's false statements.** REV-PrismaticCohomology--PR.0 refused acceptance partly because its suggested file stated theorems falsely. All 35 rows of its table "The suggested Lean file: statements that must change" are restated in the joined file, and a scan of PR.3, PR.4, PR.6 and PR.7 found 11 more of the same kinds. In summary:
  - **Imported data and arbitrary functors.** Theorems over structures of unconstrained "imported data" or over arbitrary functors (`Crystalline.comparison`, `DeRham.comparison`, `prismaticCohomology_baseChange`, `etaleLocalization`, `conjGr_iso_cotangentPowers`, `leta_frobenius_factorisation`, `etaleComparison_affine`/`_integral`, `tateTwist_perfectoid`, the theorems over `Imported`, `qCrystalline_crystalline_comparison`, `ainfOmega_comparison`, the `OKData` theorems, `relFilBaseChange`, `coordinateMap`) are stated for specific placeholder values or for new shared placeholders. Each placeholder's docstring names its owner: `completedBaseChange` (DD.1), `crystallineCohomology` (CR.2), `deRhamComplex` (DD.2), `imported`, `inputs`, `qrspData`, `cotangentPowers`, `AffineComparisonDatum.ofAlgebra`, `TateTwistDatum.ofPerfectoid`, `CrystallineInput.ofAlgebra`, `AOmegaData.ofAlgebra` and `OKData.ofRing`, the last with G the absolute Galois group of the fraction field of a complete DVR. `SiteData`'s Laurent ring and Frobenius are defined from its other fields, no longer free.
  - **Hypotheses added.** Classical (p, I)-completeness where the missing derived completeness made a statement false (`perfectPrism_hom_existsUnique`, `existsUnique_hom_of_perfect` and its tests, `pr7_laurent_char_p_zero`, the transversal-prism lemmas). Boundedness on every PR.2 statement. `0 < E.natDegree` for the Breuil–Kisin prism. Flatness of every reduction modulo (p, I)^n in `IsFlatCover` and of every R/p^n in `SmoothModP`. The p-completed `Ω^1` (`completedKaehler`) in the Hodge–Tate comparison. Surjectivity modulo p for Čech–Alexander presentations. The envelope hypotheses of the q-PD envelope. Injectivity on coordinates for morphisms of framed q-PD data. A generator adapted to a trivialisation of the twist in formula (9.3).
  - **Weak statements strengthened.** `reduce_fixedPoints` is now a distinguished triangle. `syntomicCohomology_completion` is Bhatt–Lurie 7.4.6 without its conclusion as hypothesis. The lattice uniqueness statements assert two-sided inverses. The prismatic logarithm takes values in the twist A{1}. The missing second part of `integer-cast-delta` is added.
  - **Left unchanged.** Four declarations whose missing conditions (quasiregular semiperfectoid, quasisyntomic, smoothness) are allowed omissions with no free data: `delta_fil_le`, `relFil_large`, `qDeRham_comparison` and `change_of_framing`.
  - **Signatures.** Some signatures gained arguments, with names kept: `breuilKisin`, `ChangeOfPrism`, `comparisonMap` and the envelope declarations.
- **PR.8: the review's untyped names.** REV-PrismaticCohomology--PR.8 found 292 of the 332 packet names only in comments.
  - **Rebase on PR.0.** The joined file replaces PR.8's local copy of the δ-structure by PR.0's `TauCeti.Delta.Structure`, `toFrobenius` and `wittSectionEquiv`. Prelog prisms are a PR.0 `Prism` with a δ_log-structure of the same δ, and boundedness and perfectness are PR.0's. `zLocalDelta`, `qNumber` and `completedExtendScalars` are abbreviations of PR.0's `TauCeti.Delta.intAtPrime`, `TauCeti.Prismatic.qAnalog` and `TauCeti.Prismatic.completedBaseChange`.
  - **Coverage.** It types 211 of the 332 names (147 of 202 API items, 64 of 130 tests) and the main declarations of 70 of the 76 nodes, over 99 placeholder carriers whose docstrings name their owners. The six untyped nodes are `cartier-type-cosimplicial-frobenius`, `log-qrsp-basis`, `log-quasisyntomic-descent`, `initial-log-prism-qrsp`, `kummer-tower-covers` and `semistable-crys-bdr-diagram`. They and the other 121 names stay in documentation comments with the packet statement and the reason.
  - **Examples strengthened.** The weak examples the review named now compute: δ_log(1 + p) in Z_(p), a specific monoid-algebra δ-structure, the free-ring Frobenius φ(x) = x^p(1 + p y_0), and φ_M(n) = p·n for Breuil–Kisin.
  - **Hypotheses changed.** Where a hypothesis of the source cannot be stated it is replaced by a stronger one: flat for completely flat, étale for completely étale, classical for derived completeness. Some scopes are restricted: PD ideal (p) in the crystalline part, trivial base monoid for the global étale comparison and the A_inf nodes. Comparisons are stated on global sections. Each docstring says so.
- **For the packets.** These Lean forms are proposals for the suggested file only. No packet API statement changed. A re-review of the suggested file should check the new placeholder values and the added hypotheses against the packets. The part files `PrismaticCohomology--PR.0.lean` and `--PR.8.lean` are unchanged and still contain the defects their reviews found.

## Findings for other owners

- **A stage-level cycle with PerfectoidQuotients.** Five nodes of `PerfectoidQuotients:Q0:integral-algebra` (in the accepted PerfectoidQuotients packet) cite PR.0 nodes, chiefly `PR.0/perfect-prisms-perfectoid-rings`. Meanwhile the atlas has Q0:integral-algebra → PR.0, and `PR.0/ainf-prism` and `PR.0/perfect-prisms-perfectoid-rings` cite Q0:integral-algebra. At node level the two packets are acyclic, but at stage level promotion of the PerfectoidQuotients packet gives a 2-cycle. RS-01 puts the integral prefix first. The citing nodes are `completely-etale-and-henselian-perfectoid`, `completed-root-polynomial-algebras`, `completed-root-stable-quotients`, `completed-perfectoid-tensor-products` and `perfectoid-cotangent-vanishing`.
- **Consumers whose requests do not match their prerequisites.** AInfCohomology--AI.6 cites 18 nodes of this roadmap in prerequisites with no request to it; PerfectoidQuotients has 12 such pairs.
- **Red-team discrepancies.** The fix report of RT-AREA-padic-2 (C6) makes PR.3 the owner of the prismatic logarithm, while part PR.0 plans `PR.4/prismatic-logarithm`; RT-RS-01/19, pending in FIX-RT-RS-01, would record an owner for it. The same report (C3) plans Bhatt–Scholze F-crystals Theorem 7.9 and Corollary 7.10 in R07.4, while PR.7 proves them in `PR.7/breuil-kisin-evaluation` (part PR.0's third structural proposal).
- **Findings recorded in neither part.** RT-AREA-padic-2/16, /23 and /46, and RT-RS-01/7, /16, /19, /21, /28 and /31 (the last six pending in FIX-RT-RS-01) concern this roadmap but are not recorded in either packet. The document's Boundaries section lists them.
- **RS-05 and PR.8.** RS-05 draws DD.0 → PR.8 for the classical cotangent complex, but the PR.8 part cites no DD.0 node; its cotangent inputs go through DD.6.

## Edits the part packets need (not deliverables here)

No packet was edited, and no node statement, hypothesis, prerequisite or verdict changed. Items 3 and 4 change node text, so the nodes concerned need a re-review.

1. **PR.8: replace the 40 stage citations by node ids** (PROTOCOL.md section 3). The PR.8 packet's own coverage record asks for this. The three rows marked `none` need a decision instead:
   - rows 5 and 31 (`prelog-prismatic-envelope`, `initial-log-prism-qrsp`) use prismatic envelopes of arbitrary, non-regular ideals (Bhatt's notes V Lemma 5.1; Bhatt–Scholze Proposition 7.2), which no node of PR.0–PR.7 states. Either restrict the nodes to the regular case of `PR.0/regular-prismatic-envelopes`, or keep the stage id and record a gap;
   - row 27 (`log-qrsp`) uses the non-log quasiregular semiperfectoid definition, which belongs to `DerivedDeRhamCohomology:DD.5`.

| # | PR.8 node | Stage cited | Replace by | Confidence |
|---|---|---|---|---|
| 1 | `PR.8/delta-log-free` | `PR.0` | `PR.0/delta-ring-category`, `PR.0/free-delta-ring`, `PR.0/delta-localization-criterion`, `PR.0/delta-completion-unique-fg` | clear |
| 2 | `PR.8/delta-log-completion-etale` | `PR.0` | `PR.0/delta-etale-extension` | clear |
| 3 | `PR.8/prelog-prism` | `PR.0` | `PR.0/prism`, `PR.0/prism-category`, `PR.0/rigidity-prism-ideal`, `PR.0/bounded-prism-complete-flatness` | clear |
| 4 | `PR.8/standard-log-prisms` | `PR.0` | `PR.0/prism-category`, `PR.0/ainf-prism`, `PR.0/perfect-prism-properties`, `PR.0/crystalline-prism`, `PR.0/breuil-kisin-prism`, `PR.0/rank-one-elements` | clear |
| 5 | `PR.8/prelog-prismatic-envelope` | `PR.0` | `PR.0/regular-prismatic-envelopes` | none |
| 6 | `PR.8/envelope-flatness-smooth` | `PR.0` | `PR.0/regular-prismatic-envelopes`, `PR.0/complete-regular-sequence`, `PR.0/bounded-prism-complete-flatness` | clear |
| 7 | `PR.8/perfectoid-monoid` | `PR.0` | `PR.0/ainf-prism` | probable |
| 8 | `PR.8/perfect-log-prism` | `PR.0` | `PR.0/prism-category`, `PR.0/prism-perfection`, `PR.0/ainf-prism`, `PR.0/rank-one-elements` | clear |
| 9 | `PR.8/perfect-log-prisms-perfectoid` | `PR.0` | `PR.0/perfect-prisms-perfectoid-rings`, `PR.0/ainf-prism`, `PR.0/perfect-delta-rings`, `PR.0/p-torsion-freeness-criteria` | clear |
| 10 | `PR.8/smooth-chart-covers` | `PR.0` | `PR.0/regular-prismatic-envelopes`, `PR.0/bounded-prism-complete-flatness` | clear |
| 11 | `PR.8/hodge-tate-group-lemma` | `PR.1` | `PR.1/hodge-tate-comparison`, `PR.1/cech-alexander-computes-cohomology` | probable |
| 12 | `PR.8/hodge-tate-group-lemma` | `PR.0` | `PR.0/regular-prismatic-envelopes`, `PR.0/bounded-prism-complete-flatness` | probable |
| 13 | `PR.8/delta-log-crystalline-vs-log-crystalline` | `PR.0` | `PR.0/pd-envelope-complete-flatness`, `PR.0/pd-envelope-as-delta-envelope` | clear |
| 14 | `PR.8/log-prismatic-site` | `PR.1` | `PR.1/relative-prismatic-site`, `PR.1/change-of-topology` | clear |
| 15 | `PR.8/log-prismatic-cohomology` | `PR.1` | `PR.1/prismatic-to-etale-morphism`, `PR.1/relative-prismatic-cohomology`, `PR.1/hodge-tate-cohomology`, `PR.1/frobenius-on-prismatic-cohomology` | clear |
| 16 | `PR.8/absolute-log-prismatic-site` | `PR.1` | `PR.1/prismatic-structure-sheaf`, `PR.5/absolute-prismatic-site` | clear |
| 17 | `PR.8/log-prismatic-weak-base-change` | `PR.1` | `PR.1/base-change-finite-tor-amplitude` | clear |
| 18 | `PR.8/log-prismatic-etale-localization` | `PR.1` | `PR.1/etale-localization` | clear |
| 19 | `PR.8/log-hodge-tate-map` | `PR.1` | `PR.1/hodge-tate-cohomology`, `PR.1/bockstein-differential`, `PR.1/hodge-tate-comparison-map` | clear |
| 20 | `PR.8/cartier-type-cosimplicial-frobenius` | `PR.1` | `PR.1/relative-frobenius-cosimplicial-lemma` | probable |
| 21 | `PR.8/local-crystalline-comparison` | `PR.1` | `PR.1/relative-frobenius-cosimplicial-lemma`, `PR.1/crystalline-comparison`, `PR.0/pd-envelope-as-delta-envelope` | clear |
| 22 | `PR.8/log-q-pd-triple` | `PR.6` | `PR.6/q-divided-power-operation`, `PR.6/q-pd-pair`, `PR.6/q-pd-homological-properties`, `PR.6/q-pd-envelope`, `PR.6/q-pd-envelope-base-change`, `PR.6/ainf-q-pd-pair` | clear |
| 23 | `PR.8/log-q-crystalline-site` | `PR.6` | `PR.6/q-crystalline-site`, `PR.6/q-crystalline-cech-alexander` | probable |
| 24 | `PR.8/log-q-crystalline-vs-crystalline` | `PR.6` | `PR.6/q-pd-homological-properties`, `PR.6/q-crystalline-crystalline-comparison` | clear |
| 25 | `PR.8/log-q-de-rham-complex` | `PR.6` | `PR.6/framed-q-pd-datum`, `PR.6/gamma-extension-to-q-pd-envelope`, `PR.6/framed-q-de-rham-complex`, `PR.6/q-de-rham-comparison` | clear |
| 26 | `PR.8/semistable-aomega-comparison` | `PR.6` | `PR.6/ainf-q-pd-pair`, `PR.6/ainf-omega-comparison-map`, `PR.6/ainf-omega-comparison` | clear |
| 27 | `PR.8/log-qrsp` | `PR.2` | — | none |
| 28 | `PR.8/derived-log-prismatic` | `PR.2` | `PR.2/derived-prismatic-cohomology`, `PR.2/conjugate-filtration`, `PR.2/derived-prismatic-etale-descent` | clear |
| 29 | `PR.8/derived-log-properties` | `PR.2` | `PR.2/derived-prismatic-cohomology`, `PR.2/derived-hodge-tate-comparison`, `PR.2/derived-prismatic-base-change`, `PR.2/kunneth-formula` | clear |
| 30 | `PR.8/initial-log-prism-qrsp` | `PR.2` | `PR.2/qrsp-prism`, `PR.2/perfectoidization-coconnective`, `PR.2/perfection-of-prismatic-cohomology`, `PR.2/connective-perfectoidization-perfectoid` | clear |
| 31 | `PR.8/initial-log-prism-qrsp` | `PR.0` | `PR.0/ainf-prism`, `PR.0/bounded-prism-complete-flatness`, `PR.0/prism-perfection` | none |
| 32 | `PR.8/log-nygaard-filtration` | `PR.3` | `PR.3/relative-nygaard-large-quasisyntomic`, `PR.3/relative-nygaard-filtration`, `PR.3/nygaard-filtration` | clear |
| 33 | `PR.8/log-nygaard-graded` | `PR.3` | `PR.3/relative-nygaard-graded-pieces`, `PR.3/relative-nygaard-large-quasisyntomic` | clear |
| 34 | `PR.8/nygaard-hodge-fiber-sequence` | `PR.5` | `PR.3/nygaard-hodge-comparison`, `PR.3/nygaard-completeness` | clear |
| 35 | `PR.8/log-l-eta-factorization` | `PR.3` | `PR.3/leta-frobenius-factorisation`, `PR.3/de-rham-comparison-general`, `PR.0/universal-oriented-prism`, `PR.1/crystallization-of-oriented-prism` | clear |
| 36 | `PR.8/log-frobenius-isogeny` | `PR.3` | `PR.3/image-of-frobenius` | clear |
| 37 | `PR.8/affine-kummer-etale-comparison` | `PR.4` | `PR.4/etale-comparison`, `PR.4/perfectoid-artin-schreier-witt`, `PR.4/frobenius-fixed-points` | clear |
| 38 | `PR.8/global-etale-comparison` | `PR.4` | `PR.4/etale-comparison-smooth`, `PR.4/etale-comparison-coefficients`, `PR.7/laurent-f-crystals-local-systems`, `PR.7/artin-schreier-riemann-hilbert` | probable |
| 39 | `PR.8/laurent-f-crystal` | `PR.7` | `PR.7/prismatic-crystal`, `PR.7/laurent-f-crystal`, `PR.7/crystal-descent` | clear |
| 40 | `PR.8/laurent-f-crystals-local-systems` | `PR.7` | `PR.7/laurent-f-crystals-local-systems`, `PR.7/crystal-descent`, `PR.7/artin-schreier-riemann-hilbert` | clear |

2. **PR.8: add missing prerequisites.**
   - `PR.8/delta-log-ring`: `PR.0/associated-frobenius`, `PR.0/delta-witt-section-equivalence`, `PR.0/rank-one-elements`.
   - `PR.8/delta-log-groupification`: `PR.0/delta-radical-localization`.
   - `PR.8/initial-log-prism-qrsp`: `PR.8/prelog-prismatic-envelope`.
   - `PR.8/local-crystalline-comparison`: `PR.0/pd-envelope-as-delta-envelope` (included in row 21).
   - `PR.8/log-l-eta-factorization`: `PR.0/universal-oriented-prism` and `PR.1/crystallization-of-oriented-prism` (included in row 35).
   - The acceptance tests of eleven PR.8 nodes quote trivial-log results of PR.0–PR.7; the document's Assembly notes name the nodes.
3. **PR.8: statement corrections** (re-review needed):
   - `delta-log-completion-etale` (2) must assume B derived I-complete, as Bhatt–Scholze Lemma 2.18 (`PR.0/delta-etale-extension`) does;
   - `perfect-log-prism` must use the completed perfection (A_∞, IA_∞) of `PR.0/prism-perfection`, not colim_φ A (`PrismaticCohomology/E82`);
   - `cartier-type-cosimplicial-frobenius` needs k an F_p-algebra in its last assertion and the extension of Lemma 5.4 to Laurent polynomial rings.
4. **PR.8: wrong stages and locators.**
   - `nygaard-hodge-fiber-sequence` cites PR.5, but uses `PR.3/nygaard-hodge-comparison` and `PR.3/nygaard-completeness`.
   - `absolute-log-prismatic-site` cites PR.1 for the absolute site, which is `PR.5/absolute-prismatic-site`.
   - Several locators use an older Bhatt–Scholze numbering. "Cor. 2.38" and "Lemma 2.42" are v4 Corollary 2.39 and Lemma 2.43; "Remark 4.4" is Construction 4.4; "Bhatt–Lurie Proposition 5.2.8" is Corollary 5.2.8; F-crystals "Example 3.4" is Proposition 3.4 or Example 3.5; and "BS22 Theorem 16.17" in `log-q-crystalline-vs-prismatic` is Theorem 16.18.
5. **PR.8: requests to its own roadmap.**
   - Close the request to `PrismaticCohomology:PR.4` and cite `PR.4/etale-comparison`, `PR.4/perfectoid-artin-schreier-witt` and `PR.4/frobenius-fixed-points` instead. Its premise, that PR.4 covers only smooth formal schemes, predates RT-AREA-padic-2/6.
   - Narrow the request to `PrismaticCohomology:PR.7` to the smooth proper pushforward of Laurent F-crystals, which PR.7 records only as acceptance checks. `PR.8/smooth-proper-pushforward` is in that request's `neededBy` but cites no node of PR.0–PR.7.
6. **Gaps.**
   - PR.8's gap "arc-descent for étale cohomology with torsion coefficients" and PR.0's gap "The arc_p-topology and arc_p-descent of étale cohomology of the generic fibre" are the same missing input (Bhatt–Mathew Corollary 6.17); merge them.
   - PR.8's gap "Suggested Lean signatures and discriminating examples" is answered in part by the joined Lean file (see the Lean section); its count should be updated when the PR.8 packet is revised.
   - PR.8's gap "Supplier hypotheses and interface extensions" is answered for PR.4 and PR.7 except the pushforward.
7. **Part PR.0.** The assembly needs no edit to it. Its review's 29 open points and the false statements in its own suggested file remain for its revision; the joined Lean file restates those statements (see the Lean section).
8. **Layer edges.** Declare PR.5 → PR.4, PR.6 → PR.4, PR.4 → PR.8, PR.5 → PR.8, PR.6 → PR.8 and PR.7 → PR.8 in the stages' `requires`. The PR.0 review asked about the first two in its first question to the orchestrator.

## Structural proposals of the parts

Part PR.0 records four proposals; part PR.8 records none. The document gives each in full with a status line.

| Proposal | Status |
|---|---|
| Rescope: give the comparison of prismatic Z_p(n) with Fontaine–Messing syntomic cohomology (AMMN Theorem F) an owner downstream of PR.4 and RT.3b (CohomologyComparisons CP.6 or RT.3b) | undecided; FIX-RT-RS-01 (pending) works in the same neighbourhood |
| Split QWittVectors QW.6 into a framing prefix (needing only DD.1 and AI.1), imported by PR.6 and HQ.1, and a remainder needing QW.5 (RT-AREA-etale/28) | undecided; RS-10 records no owner for the framed q-de Rham complex, and QWittVectors is not an atlas roadmap |
| Rescope PR.7 against R07.4: one owner each for full faithfulness of 𝔐 ↦ 𝒪_ℰ ⊗ 𝔐 and for restriction from G_K to G_{K_∞} | undecided; the RT-AREA-padic-2 fix report (C3) chose R07.4, part PR.0 keeps its proofs |
| Split PR.7 into sub-layers PR.7:crystals, PR.7:crystalline-lattices and PR.7:breuil-kisin | no decision recorded |

## Requests of the parts

There are 108 requests, all given in full in the document's "Requests to other roadmaps" section:

| Supplier | From PR.0 | From PR.8 |
|---|---|---|
| DerivedDeRhamCohomology | 28 | 2 |
| CrystallineCohomology | 16 | 3 |
| EnhancedDerivedSheaves | 10 | 1 |
| AInfCohomology | 8 | 4 |
| PerfectoidQuotients | 8 | 1 |
| SchemeAndStackFoundations | 7 | 0 |
| PadicHodgeTheory | 3 | 0 |
| ClassicalAdicEtaleCohomology | 2 | 0 |
| RefinedTraceMethods | 2 | 0 |
| DiamondEtaleCohomology | 1 | 1 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, LanglandsParameterStacks, PerfectoidSpaces, QWittVectors, VectorBundlesAndIsocrystals | 1 each | 0 |
| DiamondsAndVStacks | 0 | 3 |
| HodgeTateAndCanonicalSubgroups | 0 | 1 |
| PrismaticCohomology (internal: PR.4, PR.7) | 0 | 2 |

The suppliers whose stage text does not state what is asked are listed in the document's Boundaries section. They come from the PR.0 review's third question (DD.1, E5:abstract, DD.4, H0, LP1, QW.6) and the PR.8 review (T6:log-sites, CR.6, C0).

## For the orchestrator

- Neither part can be promoted on this assembly. Both packets need a revision round with a fresh independent review. This document can serve as their reader, since it is generated from the corrected packets; it would need regenerating after the revision.
- The PR.0 review's other questions remain open: the étale comparison over a general base prism in PR.4 (second question), and the collation of four findings against the published versions (fourth question).
- The corrected text of the 2026 Inoue–Koshikawa–Yao corrigendum is still needed for `PR.8/laurent-f-crystals-local-systems`.

## Checks run

- `python3 scripts/check_blueprint.py <packet> --index <pinned declarations.tsv>` on both part packets: 0 errors, 0 warnings each.
- The scripted verbatim check of the document against both packets: 13,859 strings, 0 missing.
- Cycle checks: the node graph of both packets, and the stage graph of `data/atlas.json` with the undrawn layer edges and the induced cross-roadmap edges. No cycle was found in either, beyond the PerfectoidQuotients cycle reported above, which needs that packet's edges.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean` (shared build, Mathlib 082e2d3; 103 GB memory available): exit 0, 0 errors, 1,423 warnings, all `declaration uses 'sorry'`. Name coverage: all 354 node ids and 1,225 packet API/test names occur.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
