# Independent review: General algebraic K-theory, Part II

**Verdict: accepted after corrections in place.** This is acceptance of a complete target-level planning pass. All eleven layers remain `planned`, none `closed`, and every node remains `implementationStatus: unchecked`. Sixteen supplier extensions and the original Witt-action proof-audit gap G1 remain explicit obligations.

Reviewer: Codex, session `codex-SxcGXx`, 2026-10-19; issue #3537. The design was written by a different worker session, `codex-FSZ2Vz` (issue #3477). Reviewed the roadmap definition, packet, reader document and suggested Lean file. The packet records one individual verdict for every node under `independent-review-REV-DESIGN-GeneralAlgebraicKTheoryPartII`.

| Inventory | Count |
| --- | ---: |
| Layers | 11 |
| Nodes verified / corrected / added / unverifiable | 60 / 13 / 0 / 0 |
| Definitions / constructions | 8 / 9 |
| Theorems / comparisons / lemmas / applications | 30 / 7 / 5 / 14 |
| API items / discriminating tests | 68 / 51 |
| Planets | 45, at most 6 per layer |
| Pinned declarations confirmed / removed / replaced | 7 / 0 / 0 |
| Public source documents | 15 |
| Open supplier requests / proof-audit gaps | 16 / 1 |
| Source issues independently confirmed / rejected / added | 1 / 0 / 0 |

## Corrections

The following changes are present in the packet and reader. Changed target statements are also reflected in the roadmap's layer descriptions. No new mathematical node was necessary.

| Target | Correction and source |
| --- | --- |
| KII.0/ring-k-theory | Added its direct prerequisite KII.0/nonconnective-k. Added Land–Tamme Lemma 1.10, manuscript p.9, for the perfect-module identification with a chosen generator. Extension and finite-perfect restriction retain separate hypotheses. |
| KII.0/nonconnective-k | Replaced the ambiguous compact-part enlargement by FκC=(Indω C)^κ for uncountable regular κ; its countable sums supply the swindle. The suspension is the completed stable quotient. BGT Definitions 9.1 and 9.6, pp.806–808; Theorems 9.8 and 9.10 with proofs, pp.808–816. |
| KII.1/connective-plus | Removed an API assertion identifying relative K with plus applied to an arbitrary fiber. Use the natural square of acyclic plus comparisons and its relative homology estimates instead. Land–Tamme Lemma 2.4, pp.16–17; BGT Lemma 9.39 and Proposition 9.40, pp.819–820. |
| KII.1/a-theory | Full perfect modules compare to the stabilized **finitely dominated** retractive-space model. Homotopy-finite objects alone can miss K0 classes. Corrected the statement, hypotheses, model comparison and API, and replaced one test by the finite-versus-retract-completed K0 boundary. Added Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle, §4.4 opening p.84 and discussion before Lemma 4.4.11, pp.89–90. |
| KII.2/amalgam | Extended the Land–Tamme Theorem 1.3 proof locator from pp.6–12 to pp.6–14, where the pullback formula is completed. |
| KII.2/waldhausen-truncation | Restored the full coefficient hypothesis: a localization of Z or Z/m, with n≥1 in the connectivity estimate. Q and Z/p are consequences, not its entire domain. Land–Tamme Lemma 2.4, pp.16–17. |
| KII.3/bounded-t-structure | Corrected the AGH locator to §§2.1–2.2, Definitions 2.1, 2.4 and 2.7, pp.5–7; §2.1 alone does not contain the boundedness definition. |
| KII.3/stable-envelope | Made the idempotent-completeness justification explicit before comparing the thick stable envelope with the finite stable envelope used in group completion. No invariance of connective K0 under arbitrary idempotent completion is assumed. Hebestreit–Steimle §3.1, pp.17–19, and Corollary 8.1.3, pp.70–71. |
| KII.3/theorem-heart | Extended Barwick's proof locator through p.23 and AGH's through p.29. The nonconnective theorem still requires a noetherian heart. |
| KII.3/regular-localization | Restored AGH's complete regular/noetherian definition: π0 right regular noetherian, every πn finitely generated, and bounded coherent modules perfect. Added the finite compact generation of the module-localization kernel and retained its precise support criterion. The heart's G-theory becomes projective K-theory by regularity. AGH §4.2 and Proposition 4.4, p.34; Example 4.6, p.35. |
| KII.4/multiplicative-k | Replaced the unrelated CMNN Construction 3.14 citation by BGT's multiplicative K-theory theorem: Theorem 5.8, Proposition 5.9 and Corollaries 5.10–5.11, manuscript p.23. This supplies coherent connective and nonconnective products and their ring/module consequences. |
| KII.5/cmnn-vanishing | Distinguished the Tate-height converse (CMNN Theorem 4.6, pp.19–20) from the finite-localization vanishing theorem (Theorem 4.10, p.21) in the downloaded version. Corrected the source-reading description and node locator accordingly. |
| KII.4/nil-witt-action | The NK1 characteristic-series formula evaluates at **νx**, retaining the polynomial variable: a(t) acts on [1−νx] by [a(νx)]. Corrected the API and acceptance check and strengthened the dual-number test. Weibel Exercise 3.2, p.474. The finite-annihilator construction proof remains G1. |

Also corrected the introduction's LMMT Theorem A/Purity page to p.1013; the Weibel comparison locators to Theorems 5.1–5.2, p.484, and Corollary 5.4, p.485; and the bibliography's proof ranges. Added the two primary sources above, with public URLs and downloaded-file hashes, to both JSON source catalogs and the reader bibliography:

- [BGT, *Uniqueness of the multiplicative cyclotomic trace*](https://arxiv.org/pdf/1103.3923), p.23.
- [Calmès et al., *Hermitian K-theory for stable infinity-categories I*](https://bcalmes.perso.math.cnrs.fr/pro/recherche/publis/hermpoinc-one/HermKstableI.pdf), §4.4, pp.84, 89–90.

Completed review is no longer listed as unfinished work in `coverage.remaining`. Layers KII.2, KII.3 and KII.5 instead name their inherited foundation/supplier or G1 obligations. All stages retain honest planning status. Source issue E1 now has its required independent verdict; the reader records that verdict and the additional correction search. The bottom-height bookkeeping note now spells out “ordinary chromatic K(0)” to distinguish it from projective K0.

## Baseline and ownership

Independently read the actual declaration types at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Declaration | Confirmed scope |
| --- | --- |
| `SSet.Quasicategory` | Inner-horn filling, without a stable enhancement or K spectrum. |
| `CategoryTheory.Idempotents.Karoubi` | Ordinary objects with specified idempotent endomorphisms. |
| `CategoryTheory.Triangulated.TStructure` | Ordinary triangulated t-structure, requiring an enhanced lift here. |
| `CategoryTheory.Triangulated.TStructure.bounded` | Object-dependent upper and lower bounds. |
| `TauCeti.ExactStructure` | Quillen exact structure with the requisite composition, pullback and pushout axioms. |
| `TauCeti.finiteProjectiveModulesExactStructure` | The induced exact structure on finitely generated projective left modules; right modules use the opposite ring. |
| `TauCeti.finiteProjectiveModulesExactStructure_eq_split` | Equality with the split exact structure. |

No baseline citation was removed or replaced. Read the reviewed library coverage for parent K.1–K.7, H.5 and EDS, and the precise supplier-node statements, including split packet files. Stage-only imports remain contracts; the 16 requests identify the additional statements their current owners must supply. Checking such an interface does not certify a supplier's unaudited proof.

Read the current TauCetiRoadmap AlgebraicTopology and GrothendieckEulerForms README/suggested files, searched the nine roadmaps newer than the atlas snapshot, and searched the current Tau Ceti library. The roadmap checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing ordinary topology, exact structures and K0 keep their owners. No duplicate higher-K or chromatic target was identified. Neither read-only environment was built or changed.

The 73 extraction entries are accounted for: 72 map to targets and Question 3.10 remains a theorem boundary. The extra nonpositive nilinvariance target uses the existing K0 and Bass owners. All 17 definition/construction nodes have four proposed API items and three tests. Tests distinguish such errors as uncompleted quotients, noninvertible GL components, connective versus stable mapping spectra, the wrong affine line, finite versus finitely dominated A-theory, and a Witt formula losing its polynomial variable. No additional planet or renamed planet was needed.

## Proof order and source finding

The local dependency graph is acyclic. KII.0–KII.3 have no RT or CH inputs, even through local prerequisite paths. Theorem A precedes connective-cover/high-trace comparison, which precedes CMNN vanishing, which precedes purity. The CMNN base uses Mitchell; the high-trace induction step is only used when its height is at least two. Yuan's lower bound follows purity. The rational-transfer descent argument retains the ε-nilpotent tower needed for both fixed-point comparison maps. Neither arbitrary inverse-limit commutation nor a general telescope conjecture is assumed.

**E1 is confirmed.** Independently compared the [published LMMT text](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf), pp.1014 and 1016, with [BSY v1](https://arxiv.org/pdf/2207.09929v1), §9 pp.86–90 and Corollary 5.2 p.55. BSY works p-locally. At an odd coefficient prime, the characteristic-two one-periodic ring of BSY Remark 9.13 survives p-inversion, has no rational part, and has 2-torsion K-theory by additivity. This contradicts the unrestricted global height-zero formulation. The packet correctly requires nonzero rationalization in that case; positive-height redshift and purity retain their scope. No additional source issue was found. The packet records the version, hashes and correction searches; the independent searches found no linked correction on the arXiv history or the author publication pages checked.

## Validation and maintainer actions

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralAlgebraicKTheoryPartII.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/GeneralAlgebraicKTheoryPartII.lean`: exit 0, no diagnostics, after checking available memory. The 45-line suggested file needed no edits: its four real examples use only existing pinned carriers.
- Checked complete one-to-one review coverage, all reader target/API/test/source fields against the packet, roadmap target statements, source hashes, the local dependency graph, source-issue structure and whitespace.

No unresolved contradiction remains in the reviewed plan. G1 is an honestly recorded unaudited construction proof, so it does not become a claim of closure through this verdict. The maintainer should route G1 and the 16 supplier requests, and apply the existing RT.3 rescope proposal: generic localizing foundations import KII.0; generic truncating/excision foundations import KII.2; trace examples stay in RT.3 and accessibility refinements stay in RT.5. Those supplier files were not edited. E1 is ready for the source-follow-up process. No question blocks acceptance of this planning pass.
