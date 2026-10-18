# DESIGN-LocalFieldsRamificationPartII — completed target-level planning pass

Codex, session **codex-tBFwNl**, for **#3454**, 18 October 2026. The claim was confirmed by the claim bot. This submission completes the pass specified by PROTOCOL.md §0: every stage is planned, and the precise inputs that prevent proof closure are recorded. It is ready for independent review. It is not a claim of formalization or a closed packet.

## Deliverables and coverage

The roadmap definition, packet, reader document and suggested Lean file all use `LocalFieldsRamificationPartII`. The parent is `tauceti:TauCetiRoadmap/LocalFieldsRamification`; the area is `padic`. The coherent direction is arbitrary Krull ramification, culminating in Temkin Theorem 2.6.6, with the separable prime-supported export needed by alteration distillation.

There are **43 nodes**: **13 definitions, 5 constructions, 20 theorems, 4 comparisons and 1 application**. They carry **71 API items, 57 mathematical unit tests, 30 planets, 24 baseline declarations, 9 supplier requests and 2 gaps**. All implementation statuses remain `unchecked`. Every definition and construction has uses, an API and at least three discriminating tests. Planets by layer are 5, 3, 5, 4, 4, 6 and 3. The reader has approximately 13,500 words, including exact statements, proof routes, interfaces, source locators and worked cases.

| Stage | Coverage | Precise work before proof closure |
| --- | --- | --- |
| GF.0 | closed | None at target level. |
| GF.1 | planned | Supply the consolidated non-strict, integral-semilocal and filtered henselization interface. |
| GF.2 | planned | Discharge that local-ring request and the H1/local-field compatibility boundaries. |
| GF.3 | planned | Supply G1 and G2 and discharge the exact Sylow, cohomology and embedding-problem requests. |
| GF.4 | planned | Discharge the inherited Pank inputs and filtered henselization interface. |
| GF.5 | planned | Verify the specialization of the imported flattening theorem and discharge the local-ring input to the étale criterion. |
| GF.6 | planned | Close the inherited G1/G2 and supplier obligations before proving the general and separable endpoints. |

`routeCoverage` maps all **28** Temkin general-valued-field extraction items to nodes. `LocalFieldsPartIIGeneralValuedFields` is recorded as an alias, not another competing plan.

## Independent continuations preserved

The issue explicitly permits planning the first direction and proposing a split when its three briefs are independent. `restructure` proposes two other roadmaps; `continuationBriefs` preserves the full authored source briefs and all their item assignments:

- `LocalFieldsPartIIKatoSwanConductors`: Bright–Newton's **44** items and Bhatt–Mathew's **3** items. Preserve the Bright–Newton review gate and the E8/E9/E13 dependency-ledger repairs. Do not treat its extraction as an approved design. This direction includes the stated Kato/Bloch–Kato filtration and syntomic consumers.
- `LocalFieldsPartIIFiniteLengthModules`: Atobe–Kondo–Yasuda's **28** items. Start over an arbitrary DVR; impose finite residue field only on counting targets. Import `Module.equiv_directSum_of_isTorsion` for existence. Retain sorted exponent uniqueness, left zero-padding and the distinction between padded coordinate addition and direct sum. Audit the current IntegralLattices roadmap before activating it.

No files or stages belonging to those independent directions were created or edited. The proposed split is for the maintainer to apply.

## Ownership and supplier requests

The packet makes nine exact requests: one to ModularCurves 4D, three to ProfiniteProPGroups Layers 2/5/6, two to ProfiniteCohomology Layers 9/11, and three compatibility requests to LocalFieldsRamification Layers 2/3/4. These are records in the packet; no messages to other workers or authors were sent.

The ModularCurves request consolidates the overlapping draft PerfectoidSpaces P3 and H1/SF.2 requests. It extends the strict local-ring scope to non-strict henselization, EGA IV₄ 18.6.8 for an **integral semilocal** algebra (normalization need not be finite as a module), and 18.6.14 for filtered local colimits. This roadmap constructs henselized valued fields and proves their valuation properties; it does not introduce another local-ring henselization functor.

The two existing `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles` nodes supply strict localization and the strictly henselian arbitrary-rank tame quotient. Those dependency arrows point into this roadmap. General flattening is imported from `SchemeAndStackFoundations:SF.4/flattening-by-blowup`, not replanned. Its finite-height valuation specialization uses the open generic point and the fact that finitely generated nonzero ideals of a valuation ring are principal, so the admissible blowup is the identity. Stacks tag 054A gives an alternative finite-presentation proof.

Mathlib already defines `ValuationSubring.decompositionSubgroup` and `inertiaSubgroup`. GF.2 reuses those carriers, proving the missing absolute fixed-field comparisons. Coarsenings use `ofPrime`, `idealOfLE` and their inverse laws; height uses `ringKrullDim`. The compact suggested file uses existing field, algebraic closure, intermediate field and linear-disjointness carriers.

Consumer ownership updates to apply when the proposal is accepted:

1. PrimeToDegreeAlterations imports GF.2 for ramification classes and GF.6/separable-p-closed-tameness for the separable field input; its geometry retains the separability hypotheses.
2. DiamondEtaleCohomology C8 imports GF.5/abhyankar-and-rank for the algebraic inequality and retains its stronger analytic comparison.
3. The independent Kato and DVR-module routes use their proposed owners, rather than enlarging GF.0–GF.6.

## Two proof-closure gaps

**G1:** prove `cd_p(G_F) ≤ 1` for every characteristic-p field F, with all discrete p-primary coefficients. The current ProfiniteCohomology Layer 9 supplies the Galois-action/Hilbert 90/Kummer interface, not this calculation. The proposed route is Artin–Schreier exactness, additive normal-basis acyclicity, filtered passage and dévissage. The full primary proof and supplier interface have not been verified in this pass.

**G2:** if E→G is a continuous surjection of arbitrary profinite groups with pro-p kernel and `cd_p(G) ≤ 1`, construct a continuous homomorphic section; include its application to a closed subgroup of E still surjecting to G. Neither total group is assumed pro-p. Current ProfiniteProPGroups Layer 5 gives finite p-kernel embedding problems for arbitrary G but restricts its projectivity/inverse-limit interface to total pro-p groups. A compatible inverse-limit argument for arbitrary, potentially infinite-rank quotients remains to be established.

The packet proposes **ProfiniteCohomologyPartII** to supply G1/G2 on existing carriers. It does not fabricate supplier stage IDs. Kuhlmann–Pank–Roquette invokes these inputs on p. 44. They are known mathematical results whose proof closure and ownership remain to be supplied, not claims of unknown mathematics. GF.3 consumes them; GF.4 and GF.6 inherit them through Pank.

## Source checks and corrections

Public source URLs, inspected locators, access date and downloaded-file hashes are in the packet. The source set is:

- Temkin, published Annals 186 (2017): §2, pp. 103–112, statements and proofs; §3.2.1–3.2.6, pp. 115–116; Theorems 3.2.12/3.3.6 and Lemma 3.3.7 with proofs, pp. 118/120; Theorem 4.2.1 through Step 4, pp. 121–122. The published p. 108 image was inspected. The arXiv version listing was checked; the arXiv PDF was not compared in this run.
- Kuhlmann–Pank–Roquette (1986), pp. 41–45: conventions, Theorems 2.1/2.2, Lemma 2.3, Proposition 2.4, Corollary 2.5 and the henselian group-theoretic proof, read from page images.
- Temkin (2010), Proposition 2.2.2 and proof, author pp. 11–12: composed-valuation ring generation.
- Kuhlmann–Kuhlmann–Vişan (2016), Lemma 2.1 and inequality (12), author pp. 6–8: algebraic Abhyankar inequality.
- Ćmiel–Kuhlmann–Szewczyk (2023), Theorems 14/16 and proofs, author pp. 12–15: strict root-continuity bounds.
- Aïd, arXiv:2511.07177v1 (2025), Propositions 2.6/2.7/3.3/3.6/4.1–4.3 and Theorems 3.7/4.4, pp. 4–13: public normalization/prolongation and semilocality proofs, replacing an unread textbook dependency.
- Stacks tags 0ASF and 054A, the cited lemmas and proofs at the access-date numbering: valuation extensions and flat finite-type valuation algebras.
- EGA IV₄, 17.7.5(iv), 17.7.7, 18.6.8 and 18.6.14, pp. 80–81, 139, 141–142, read directly in the cleared reference copy. No file or passage was copied.

The source issues are E2/E3/E4/E6 and new E11. E2 corrects the direction and field labels in the proof of Lemma 3.3.7; E3 removes a nonexistent part number; E4 uses the **final** residue exponent in composed tameness; E6 supplies the separable field input while leaving the geometric repair to its owner.

**E11 is substantive:** the general nonhenselian group formulation in Temkin §2.4.6(4), p. 108 needs normality. The packet and reader give the finite counterexample: Q with its 2-adic valuation, and the S3 splitting field of X³−X−2, has decomposition and wild inertia C2, which is not normal. Thus the tame closure need not be Galois over the original field. Keep the direct field-theoretic equivalences; use subgroup factorization in general and a quotient/semidirect product only under normality, in particular for henselian fields. The main tameness proof uses the field formulation. No published correction was located in the recorded Annals/arXiv/title searches; that is not an exhaustive novelty claim.

Bourbaki, Endler, Serre and Neukirch were not read or used as verified proof inputs. The cleared Raynaud–Gruson scan did not yield readable extracted text; its Corollary 3.4.7 was not verified and is not claimed as a read supplier. The imported flattening theorem and public Stacks proof replace that boundary. No unread textbook is silently counted as a closed proof input.

## Baseline and validation

The exact implementation pins are Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The individual cited source statements were inspected, including the two existing ramification-subgroup carriers. The reviewed `data/library-coverage.json` was consulted. The current read-only roadmap checkout at **0d144d044dacebca17b654695b6f1ad58f159b27** was also screened, particularly LocalFieldsRamification, LocalGaloisGroups, ProfiniteArithmetic and the relevant ProfiniteProPGroups layers; the current Tau Ceti source tree at **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** was searched for overlap. No build ran in either current checkout.

Checks run:

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalFieldsRamificationPartII.json`: **0 errors, 0 warnings**, using the pinned declaration index.
- `lean-check research/blueprint/suggested/LocalFieldsRamificationPartII.lean`: **exit 0**, with **18 warnings, all declaration uses of `sorry`**, and no other warnings or errors. Available memory exceeded 20 GB before compilation.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/LocalFieldsRamificationPartII.lean`: passed. The file has **154 lines**, five real-bodied light definitions, ten theorem signatures and eight examples. The heavier objects, their full APIs and tests are README targets, following WORKERS.md's fixed shape.
- Submission-path/JSON checks, packet/reader/stage consistency, complete extraction-route coverage and the staged whitespace diff were checked before submission.

The next worker should begin with independent review of these five deliverables, particularly E11, the perfection comparison, the general pro-p-kernel section input and the finite-presentation specialization. Accepted planned stages can then receive their precise supplier/closure follow-ups. All information needed to resume is in the committed packet and this note; no scratch source or local log is required.
