# FIX-RT-PAPER-TEMKIN-17

Codex, session `codex-rtOQ9t`, 2026-09-30. Refs #4988. Applies all **17** confirmed findings in [the verification](RT-PAPER-TEMKIN-17.review.json), including its corrections to the proposed fixes. The issue's main list contains only the first ten; the seven confirmed low-severity findings are also addressed.

Only the extraction result, its reader and this report are changed. There are 79 items (8 library, 3 planned, 68 missing), four routes, thirteen cited prerequisites and ten source issues. Every missing item is routed once. All 64 original IDs remain; the original three route positions are preserved and the SF.4 source route is appended.

## Dispositions

| Finding | Applied correction |
|---|---|
| /1 | E5 records the missing projectivity in §4.1.4 and the separate exact-boundary gap. The universal-resolvability item uses the projective convention explicitly as a repair; Theorem 1.2.5 and route 1 no longer claim that (ii) alone proves it. The identity-map example on a regular excellent two-dimensional local scheme has an snc enlargement of a closed point while the point itself is not a divisor. The blueprint must prove the inverse-image property from the construction, as the verifier requires. |
| /2 | E6 records the separability gap. Added the separably P-closed/P-tame input and separate field/alteration distillation variants, with **separable input** hypotheses. Their outlines use perfection and a maximal separable P-extension, then the existing compactness argument. All affected theorem notes and the briefs carry the obligation. The unrestricted printed theorems are preserved. |
| /3 | Flattening, normalization and semistable-curve alteration become missing. The exact Stacks 081R flattening contract includes quasi-separatedness and the quasi-compact open. The first two go to SF.4. The non-proper stable-modification input goes to the alterations Part II and cites Temkin 2010 Theorems 1.1/1.5 and Corollary 1.6, with L5's accepted de Jong 5.8 node as its narrower base case. |
| /4 | New route 4 sends general flattening, universally Japanese normalization and Cossart–Piltant/Lipman embedded resolution to SF.4 under accepted RS-25; it coalesces with the exact PAPER-BHATT-18 081R item and existing general-scheme requests. Cossart–Piltant is removed from route 1, which now imports it. The Lipman special case explicitly builds on StableReduction Layer 4. |
| /5 | H1:valuation-nearby-cycles owns the strictly henselian arbitrary-rank pro-p/tame quotient. The valued-fields Part II imports it and passes to k^u. Notes and brief name LocalFieldsRamification **Layers 2–4**, its exact Layer-4 anchor, and ProfiniteProPGroups Layer 2 as the group supplier. |
| /6 | Henselization and the two consumer lemmas import ModularCurves 4D's strict henselisation. The broader non-strict semilocal/filtered-colimit API is an explicit supplier request, not a false claim that 4D's text already includes it. The Part II keeps valuation-ring comparisons only. Consolidation with PerfectoidSpaces:P3 and H1/SF.2 is recorded below. |
| /7 | The RZ construction and comparison import the affine dominant-point Huber theorem at H1:henselian, also consumed by C5, with the same Spv carrier. The dependency is **H1:henselian → PrimeToDegreeAlterations**, correcting the red team's reversed direction. |
| /8 | `absolute-rz`, `composed-valuations` and `split-towers` remain **missing**, as the verifier requires. Exact pinned library support is credited and the remaining adapters/existence statements are named. Spv, spectrality, patch compactness and continuous comap are described as built. |
| /9 | Added quasi-excellent, universally Japanese/Nagata and regular-scheme items, the regular-noetherian snc extension, and finite-group quotient gluing/inertia. The first two route to SF.4; regular schemes stay planned at ModularCurves 4D on Mathlib's regular-ring classes; snc extends R09.7a through CR.5. Quotient gluing imports the 0C affine case and retains its finiteness hypotheses. New definition/construction items include API and semantic-test outlines. |
| /10 | Added the log Abhyankar lemma and log-smooth-over-log-regular theorem to CR.5, and boundary log smoothness of semistable multipointed curves to the alterations Part II. SGA 1 V §1 / XIII §5 is added to the bibliography; Kato 8.2 is identified in the existing Kato entry. The curve item includes the boundary over the non-smooth fibres. |
| /11 | Added four library items: valuation domination, flat-lfp openness, constructible image and constructible compactness. Each retains the exact pinned hypotheses and declaration names. |
| /12 | E7 records that an étale presentation polynomial need not be minimal; the lemma note applies the minimal-polynomial repair. For f=t(t−1), f′(0)=−1 while the standard étale algebra has a nonzero idempotent killed by evaluation. The quotient identity (2t−1)²=1 confirms localization at f′ does not remove this counterexample. |
| /13 | E8 records the doubled-origin/non-dominant-point counterexample to the converse of separatedness; E9 corrects the internal lemma reference; E10 defines T̄ and distinguishes a log-smooth morphism from its log-regular source, with the corrected target. |
| /14 | E1's reason and the specified sentence in its nested review reason now state the actual Exposé X assumption: ℓ is invertible on S. The theorem note/brief recommend char(S) ⊆ P, the scope used downstream. E1's alternative descent sketch is preserved as a sketch requiring proof. |
| /15 | Cossart–Piltant now cites its 2019 publication and states the embedded universal-resolution input invoked by Temkin. Following the verifier, projectivity is a supplier proof obligation, not inserted as an established consequence of the unchecked citation. |
| /16 | The finite tame degree formula uses the order of the quotient of **value groups**, and explicitly assumes the extension finite. |
| /17 | The general Abhyankar inequality is owned by the general-valued-fields Part II, with a Part II → C8 import. C8 retains the separate comparison with modified topological transcendence degree; this import does not claim to close that stronger gap. |

## Sources actually read

The fix's target is the published text, not an unseen version of record. Fresh downloads agree with the original extraction's hashes:

| Source | SHA-256 | Read in this fix |
|---|---|---|
| [Temkin, Annals 186 (2017)](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf), 30 pages | `1f4ac06f2f31430abdd984d8e635a324defb6de340f6a599f708c04996fbfba4` | Published pp. 104, 113, 115, 117–119, 121–124; rendered images at 117 and 123. |
| [arXiv:1508.06255v2](https://arxiv.org/pdf/1508.06255v2), 24 pages | `24f67ac306b7af4bf058c086a76f29bbd8854639354bcb241275d8e2dd43a435` | Affected passages in pp. 16–18 and 21–23 compared. The existing 29 September full-read provenance is unchanged. |
| [Travaux de Gabber, arXiv:1207.3648](https://arxiv.org/pdf/1207.3648), 418 pages | `18a6193d6b71ff5ac91eae4443e1c8a54ab8f27f2173fda200d4bec547e3644a` | Exposé X printed pp. 159–160, 162, 164 (PDF 165–166, 168, 170): §3.3.3, Theorem 3.4 Steps 1–3, Remark 3.4.1 and the Theorem 3.5 reduction/induction. |
| [Temkin, Stable modification of relative curves, author copy](https://math.huji.ac.il/~temkin/papers/Stable_Modification.pdf), 60 pages | `be5332912dc4b6839c7a6df971dc19155796ab25d14b8bb9b504a6357a878bd9` | pp. 2–4: multipointed curves, Theorems 1.1, 1.5 and Corollary 1.6. |

Also read Stacks [081R](https://stacks.math.columbia.edu/tag/081R), [07QS](https://stacks.math.columbia.edu/tag/07QS), and the definitions at [033S](https://stacks.math.columbia.edu/tag/033S), [032E](https://stacks.math.columbia.edu/tag/032E) and [0CBN](https://stacks.math.columbia.edu/tag/0CBN). Cossart–Piltant's publication metadata was checked at the [publisher](https://www.sciencedirect.com/science/article/pii/S0021869319301061); its full proof was not read. Kato/SGA statements here are the explicit cited inputs of the source/verification, left as blueprint proof tasks under §16, not claimed as freshly proved.

Novelty checks on 30 September: the Annals landing page has no erratum; the Crossref work record has empty `relation`, no `update-to` and no `updated-by`; arXiv lists v2 of 21 February 2017 as latest. The author publication page and a title/erratum search disclosed no correction. This is not an exhaustive novelty claim. E5 credits the projective convention already present in Exposé X; no invented independent review is attached to E5–E10.

## Pinned declaration audit

Read with `git show` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, not at the current working checkout.

| Declaration | File and scope checked |
|---|---|
| `TauCeti.ValuationSpectrum`, `continuous_comap` | `TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum.lean`, structure and line 241; commutative rings, ring-hom pullback. |
| `ValuationSpectrum.compactSpace_patchTopology`, `SpectralSpace` instance | `TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:196,225`; compact patch topology and spectral topology of Spv. |
| `ValuationSubring.ofPrime`, `idealOfLE`, `idealOfLE_ofPrime`, `ofPrime_idealOfLE` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean:288–338`; prime localization and overring inverse laws, not the full residue-valuation composition. |
| `IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable` | `Mathlib/FieldTheory/PurelyInseparable/Tower.lean:99`; the purely inseparable/separable tower, not existence of a separable distillation. |
| `IsRegularLocalRing`, `IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51,92`; noetherian local predicate and regular localizations. |
| `LocalSubring.exists_le_valuationSubring` | `Mathlib/RingTheory/Valuation/LocalSubring.lean:118`; domination of a local subring of a field. |
| `AlgebraicGeometry.Flat.generalizingMap`, `isOpenMap_of_generalizingMap` | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:131,107`; flatness and local finite presentation imply openness. |
| `AlgebraicGeometry.Scheme.Hom.isConstructible_image` | `Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean:161`; quasi-compact/locally finitely presented morphism to qcqs target. |
| `compactSpace_withConstructibleTopology` | `Mathlib/Topology/Spectral/ConstructibleTopology.lean:142`; compact, quasi-sober, prespectral and quasi-separated hypotheses. |

Reviewed coverage of SF.4, L5, H1:henselian, H1:valuation-nearby-cycles and R09.7a was read. It distinguishes existing ring/normalization constructions from absent finiteness, henselisation and log-geometric theorems. Tau Ceti's pinned `NormalizationFinite.lean` also records the absent Nagata/Japanese/excellent predicates. Layer text and accepted RS-25 establish the chosen owners; draft packet promises were not treated as completed proofs.

## Dependency and maintainer handoff

At base `ae36f8a`, the assembled graph has 2,840 stages and 8,258 edges. Read-only prospective checks use two new design vertices and add the following edges in supplier-to-consumer direction. All ten are acyclic together:

- H1:henselian, L5, SF.4 and CR.5:log-algebra → PrimeToDegreeAlterations.
- H1:valuation-nearby-cycles, ModularCurves 4D, LocalFieldsRamification Layer 4 and ProfiniteProPGroups Layer 2 → LocalFieldsPartIIGeneralValuedFields.
- LocalFieldsPartIIGeneralValuedFields → PrimeToDegreeAlterations and DiamondEtaleCohomology:C8.

The existing H1:henselian → L5 path was independently confirmed. Reversing the RZ supplier edge would introduce a cycle. These checks concern the proposed imports; they do not claim the future blueprint's internal graph has been built.

Maintainer/design follow-through, outside this three-file scope:

1. Add an explicit accepted disposition for the new **route 4** during review; do not reuse route 3's positional verdict. The original paper-review file is intentionally unchanged. Its route-1/2 explanations are superseded by the verified corrections.
2. Consolidate SF.4/L5 claims with PAPER-BHATT-18's exact flattening item, PAPER-BHATT-SCHOLZE-17 and the MotivesAndAlgebraicCycles request; retain L5's source-scoped applications.
3. Consolidate the H1/SF.2 and PerfectoidSpaces:P3 local-ring henselisation requests at ModularCurves 4D. The broader semilocal/non-strict/filtered-colimit contract remains requested, not already built or promised by a strict-only heading.
4. Record the three principal imports H1:valuation-nearby-cycles → valued-fields Part II, H1:henselian → alterations Part II, and valued-fields Part II → C8. C8 still owes its analytic comparison.
5. Preserve the R09.7a snc boundary carrier when CR.5 extends its scope, and the 0C affine quotient when the Part II glues it. No Tau Ceti roadmap or link between two Tau Ceti roadmaps is edited here.

## Validation

- Paper validator and `research/blueprint/intake.py check-files` on all three deliverables.
- Guards: all original IDs retained; only the three verified status changes; main theorem statements retained; all 68 missing items routed exactly once; only Cossart–Piltant moves out of an original route; original route identities/positions preserved; source findings E2–E4 and their reviews unchanged; E1 changes limited to its confirmed explanation correction; source-version records preserved.
- Source-version validation via `scripts.check_errata.versions_checked`; graph reachability checks above; exact standard-étale counterexample calculation; `git diff --check`.

No Lean file is requested or changed, and no Lean compilation or build was run. Remaining projectivity, exact-boundary, supplier and proof/API obligations are recorded for the blueprints as §16 requires; they do not make this extraction incomplete.
