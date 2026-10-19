# DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII

Worker: Codex (GPT-6), session codex-RlPrYD, 2026-10-19. Issue #3406. This is a completed target-level planning pass, submitted for independent review, not a checkpoint or an implementation claim.

The claim was confirmed by the swarm bot in [comment 6258023728](https://github.com/CBirkbeck/tauceti-explorer/issues/3406#issuecomment-6258023728), responding to this session's `/claim Codex — codex-RlPrYD`. The issue was reread after confirmation. No second job was claimed.

## Deliverables and coverage

The roadmap definition, packet, reader and suggested Lean file share the stem `FaltingsFinitenessAndIsogenyTheoremsPartII` in their respective blueprint directories. The reader is the full mathematical specification. Its 51 targets comprise 7 definitions, 3 constructions, 40 theorems and 1 application, with 47 API items, 41 discriminating tests, 41 planets and 6 baseline declarations. Every implementation status is unchecked. No definition or theory from another owner is claimed as new implementation.

QI.1 is closed as a planning boundary. QI.2, QI.3, QI.4, QI.5, QI.6, QI.7 and QI.8 are planned. All eight layers have their targets, prerequisites, source locators and acceptance conditions. There are 8 explicit gaps and 4 stage requests; the packet's coverage records propagate the gaps to their dependent layers. The job's instruction to stop refining once every layer is planned is satisfied. Independent review must assess the mathematics and boundaries before any integration.

The quantitative branch includes the full MW95 factorization chain and its polynomial field-degree argument, the geometric degree bound with dimension-only constants, the sharper quadratic elliptic rate, and the RY25 uniform integral bounds over number fields and finitely generated characteristic-zero fields. The degree-polynomial target makes the determinant and finite-grid steps explicit. Definitions retain the abelian/regular/reduced trace distinction, squared Hom cross-discriminants, stable height clamps, polarization map-degrees, and supported versus projected adelic subgroups.

The three open-image briefs form a distinct proof programme. The packet's split proposal assigns all their original item identities to six concrete layers OI.1–OI.6 of `OpenImageTheoremsForAbelianVarieties`, with the existing Faltings roadmap as parent. It preserves elliptic/surface images over arbitrary number fields, semistable End descent, integral lifting, RM hypotheses and density consumers. This is the issue-authorized roadmap-for-a-roadmap proposal; it is not an unrecorded omission or a claim to have proved/read those open-image arguments.

## Exact work remaining after review

- G1: acquire/decompose the original MW93 period-theorem auxiliary arguments and the matrix-height lower-period input.
- G2: verify the fixed rational cusp-form family, normalized value-height comparison and weak-region decay, including MW93 Lemmas 8.4/8.6 and Igusa Lemma 20 p. 104. The Igusa book was not accessed: it is not cleared in the supplied index.
- G3: resolve the CSA/cohomological-Brauer bridge and cyclic maximal subfield of degree equal to the index over the number-field center. Check the existing SemisimpleAlgebrasPartII SA.1 / QuadraticFormInvariants 7b boundary first. Do not rebuild the global Brauer sequence.
- G4: read/decompose Gaudron–Rémond Proposition 6.9 and its sharp slope input. The full elliptic §7 was read; a coarse period estimate does not justify the quadratic exponent in the field degree. Reconcile height normalization before exporting numerical constants.
- G5: acquire the primary MW95 residual-refinement chapter and decompose its bounded-extension, simultaneous-large-prime proof. The publisher endpoint returned no document.
- G6: assign an atlas stage address to the current upstream ProfiniteArithmetic Layer 0 native profinite-integer ring. That ring/product API already has an owner. The algebraic-span/product comparison has an explicit independence and finite-generator proof here; it is no longer an unread comparison gap.
- G7: acquire the finitely-generated-field Tate extension cited by Noot, Faltings–Wüstholz Chapter VI §3. The parent supplies the number-field theorem only.
- G8: locate the compact ℓ-adic Lie structure, finite generation, bounded-index subgroup finiteness and open Frattini input. The existing inverse-Galois criterion is conditional on this last property.

The four stage requests ask SemisimpleAlgebras Layers 2, 3 and 6 for the exact Artin–Wedderburn/module, faithful semisimple double-centralizer and Brauer/splitting interfaces, and ClassFieldTheory Layer 10 for the cohomological Brauer sequence. The strengthened cyclic-division-algebra conclusion remains G3. Requests and direct consumers are fully spelled out in the packet and reader. No stage contract silently claims more than its current source supplies.

No mathematics was moved out of a higher-tier roadmap. Existing qualitative Faltings finiteness/Tate, abelian-scheme A2–A6, Arakelov R35.1–R35.6, geometry of numbers, independence and Hilbert specialization are imported through exact supplier nodes. Generic lattice and profinite-integer theories were not replanned.

## Sources and upstream audit

The packet bibliography and reader retain public URLs, access dates, reading scope and SHA-256 receipts. No private source file, passage, source excerpt or section-by-section source summary is included. Primary source statements and arguments are restated in the worker's own words, with theorem/section/page locators.

Read: the full mathematical MW95 *Factorization estimates* argument, printed pp. 5–23; the complete 13-page MPI/91-51 *Endomorphism estimates* preprint; MW93 *Isogeny estimates* author-preprint §4 Lemmas 4.1–4.2 and §5 Lemma 5.1; MZ20 §2 Lemma 2.2, §4 and §5.3; Tsimerman Theorem 2.3; RY25 §2.1 and the complete §4.6 proofs; Gaudron–Rémond introduction and full §7; Noot §§1.1–1.6; Bost §§2.1–3.2 and §5.1; Deligne exposé 616 Theorem 2.7 p. 39 and adjacent reduction, checked in the original page image. Reading scope is deliberately narrower than the whole source where indicated. RY25's edition is IHÉS 141 (2025), 249–331. MPI author-preprint page numbers are distinguished from published pagination.

Missing or unread proofs are those in G1, G2, G4, G5 and G7, rather than assertions that their restatements supply a complete proof. The reader also records the three already-known source corrections: the MZ realification factor, conjugation in the Gram pairing, and the RY large-prime threshold. No new published erratum is claimed.

Read the current GlobalNumberFields and JacobianChallenge READMEs in full for style/ownership. Inspected current SemisimpleAlgebras, ClassFieldTheory, completed IntegralLattices and ProfiniteArithmetic interfaces and relevant suggested declarations. Checked the newer-than-snapshot roadmap owners and the current Tau Ceti source without edits or Lake commands there. The current upstream revisions checked were TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The packet records the reviewed parent, Arakelov and abelian-scheme library audits and the actual six baseline declarations read at the pins.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/FaltingsFinitenessAndIsogenyTheoremsPartII.json`: 0 errors, 0 warnings.
- Reader/packet/roadmap target agreement, exact source-route item identities, source hashes, unchecked statuses and per-layer planet limits checked mechanically.
- Exact arithmetic checks confirmed the Gaussian and nonmaximal order discriminants, Rosati determinants, regular discriminant of M₂(Z), cross-index square, CM-unit square and variable shear values.
- `lean-check research/blueprint/suggested/FaltingsFinitenessAndIsogenyTheoremsPartII.lean`: successful elaboration at the supplied pins, with only 14 admitted-proof warnings. An initially deprecated square-root import was replaced and the final file rechecked successfully. The 102-line file has one light, real-bodied matrix-trace definition, seven theorem signatures and seven examples; no admitted data, replacement structures, auxiliary-theory development or missing-carrier arithmetic declarations.
- Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Resume with independent review of this completed packet, then the exact follow-up boundaries above. Do not treat the matrix-only suggested file as proving an arithmetic layer. The scratch source downloads and working generator are disposable; the durable reading receipts, dependencies and mathematical specifications are in the deliverables.
