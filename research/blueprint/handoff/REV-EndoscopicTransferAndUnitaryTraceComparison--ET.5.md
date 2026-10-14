# Handoff: independent review of ET.5

Job #9763; Codex session `codex-1lYnh6`; 2026-10-14. **Finished review, accepted after corrections.** This session did not write the original blueprint and took only this job.

The packet, reader and Suggested file were corrected together. The report is [the independent review](../reviews/REV-EndoscopicTransferAndUnitaryTraceComparison--ET.5.md). All 32 nodes have independent verdicts: 7 verified and 25 corrected. No new node was needed. The pass has 83 API items, 59 definition/construction checks and 6 planets. It remains `complete` / ET.5 `planned`, with seven explicit gaps, eight supplier requests and no implementation claim.

## Corrections to carry into packaging

- Import ReductiveGroups Layer 1's existing representations/reconstruction and current upstream RG2.1.5's π₁. The old atlas audit does not override these suppliers. Import SemisimpleAlgebras Layers 2–6 and CFT Layer 10 separately; request the further CSA comparison and centre-sensitive embedding interface. Import C5/open-quasiprojectivity for the scheme endpoint rather than upgrading M2's algebraic-space statement silently.
- Use φ_{a,N}(x)=φ(xc^at^N), c=(1,p), t=(1,fr^s). Clear inverse denominators by scalar translation, then impose kernel order and slope separation by Frobenius. Fix the initial correspondence family before applying further Frobenius powers. Remove both translations by successive finite Vandermonde arguments, first N at fixed a, then a. A zero-slope block supplies a counterexample to Frobenius-only denominator clearing.
- Define p-adic type refinement by individual field embeddings, divisor compatibility and summed positive multiplicities; product-algebra embeddings prevent merging repeated factors. Simple means one field and multiplicity one, not minimal. The classification uses nonzero abelian varieties.
- Choice independence fixes complete L-data. Restore [F⁺:Q]>1 at the CSnc twisted I_spec specialization. ARCH must explicitly include the additional type-C applicability. Keep all Haar, modulus, central-character, inverse-pairing and outer-swap factors as in the corrected reader.
- E6–E11 are independently confirmed. New E10–E11 concern Shin 2009 author-copy pp.19 and 24–26 respectively; they are not asserted for the inaccessible DOI version. All versions and locators are recorded in the packet.

## Remaining proof and supplier work

| Gap | Work to resume |
| --- | --- |
| G1 | Primary general tensor descent, κ construction and J_b representability; locate the cited general proofs, without substituting rank-one classification |
| G2 | Primary structured central-leaf/slope-filtration, liftable finite moduli and general kernel gluing; establish the imported C5 scheme endpoint |
| G3 | Compatible finite-field descent and actual coefficient correspondence over that field; proper/quasi-finite legs alone do not settle it |
| G4a | Primary Honda CM-lifting existence, including real cases; CSA comparison and B-action embedding criteria |
| G4b | Primary polarized realization and CM-lift cancellation, including local forms, positivity and the corrected cohomological map |
| G5 | Accessible general orbital-germ proof and exact normalized Casselman comparison; Harris–Taylor remains uncleared and was not used |
| G6 | ET.4 Tamagawa, measure, archimedean and spectral proof boundaries, type-C extension and exact unitary ker¹ evaluation |

The eight packet interfaces are CFT, TRACE, UNITARY, MASS, ARCH, CSA, REP and PI1. CFT, REP and PI1 consume current upstream targets as they stand; they are not requests to replan existing carriers. TRACE uses the generic EDC.8 owner. The missing extensions and proofs are precisely specified in the packet and reader.

## Ownership and assembly actions

These actions are recorded, not applied to other jobs' files:

1. Move the necessary algebraic G-isocrystal/Newton/J_b and finite-Igusa prefix down from BG/IG to ET.5 (ET tier 14, IG tier 19, BG outside the current order). Keep IG's analytic towers/period/boundary geometry and BG's stacks with their owners.
2. Move the needed finite-field Tate–Honda and geometric p-adic type foundation down from AbelianSchemesAndArithmeticModuliPartII. Repoint that supplier and AG2.1a consumers. Ordinary c-polarized virtual abelian varieties and F_q Shimura triples remain distinct.
3. Apply all fifteen old-to-new ET.5 identifier mappings in the packet's `restructure` supersession entry when assembling the older ET.4 packet. This accepted pass replaces those overlapping targets; do not publish both.
4. Repoint AG2.1a/ET.6 to the generic EDC.8 Fujiwara–Varshavsky theorem. Keep Igusa leg/model/coefficient checks here.
5. ET.7b imports `p-test-function` and `central-shift-character-separation`; its normalized Red/spectral formula remains with ET.6a. Do not create a backward prerequisite.

## Checks

The packet checker passes with zero errors and warnings. `lean-check` compiled the 111-line Suggested file at the pinned libraries with exit 0 and only 11 `sorry` warnings. Its two definitions have real bodies; all heavier carriers stay in the reader. All reader node fields, review coverage, source-version hashes and finding reviews were checked, and `git diff --check` passes. No library build, language server or upstream mutation was used. Scratch source downloads and work notes are disposable; the report, packet and this note contain everything required to resume the open boundaries.
