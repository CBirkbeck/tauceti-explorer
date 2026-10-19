# Handoff: DESIGN-BETTS-STIX (GaloisSectionsPadicPeriodMaps)

Refs #952. Claude — session **claude-q6eBsS**, 19 October 2026. Branch `claude-q6eBsS-design-betts-stix`.
Submission: **complete** design (packet status `complete`), for its independent review REV-DESIGN-BETTS-STIX.

## What was done

- New roadmap `GaloisSectionsPadicPeriodMaps`, "Anabelian geometry and nonabelian Chabauty, Part II: Galois sections and p-adic period mappings", area `arithmeticgeometry`, parent `AnabelianGeometryAndNonabelianChabauty`, ten layers SPM.0–SPM.9 (`roadmaps/GaloisSectionsPadicPeriodMaps.json`).
- Packet `packets/GaloisSectionsPadicPeriodMaps.json`: 59 nodes (14 definitions, 5 constructions, 31 theorems, 7 lemmas, 2 applications), 123 API items, 81 unit tests, 30 planets, 14 baseline declarations (all read at Mathlib 082e2d3 / Tau Ceti f790474), 15 requests, 2 gaps, 10 source issues, 4 restructure proposals, 2 upstream notes. Coverage: SPM.0 and SPM.3 closed; SPM.1, SPM.2, SPM.4–SPM.9 planned, each with its outstanding supplier requests listed in `remaining`.
- `python3 scripts/check_blueprint.py --index <baseline declarations.tsv> …`: 0 errors, 0 warnings. `research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- Reader `readmes/GaloisSectionsPadicPeriodMaps.md` (about 31,000 words), generated from the packet with the src/markdown.js escapes (`\\ * $ ` _`; `|` in table cells; brackets and `<` not escaped).
- Suggested file `suggested/GaloisSectionsPadicPeriodMaps.lean` (compact shape, 224 lines): the divisibility input of local injectivity, `SymplecticModule` with `IsIsotropic`/`IsLagrangian` and the standard plane, `IsSelfConjugate`/`AreConjugate` on primes of `𝓞 K` through Mathlib's `IsCMField.ringOfIntegersComplexConj` (with the no-CM case proved), `smallOrbitProportion`/`IsTypeC`, `kodairaParshinRelDim` (genus-3 values 55 and 25 checked by `rfl`), the Lemma 6.13 dimension count, `IsGoodParameter` with the Dirichlet existence statement, the ζ(2g) < 9/8 bound and the Proposition 6.20 inequality, and the count of seven quadratic/cubic subfields of `AlgebraicClosure ℚ_[p]` for p ≥ 5. **`lean-check` passed: exit 0, only `sorry` warnings (12).** No sorry'd data definitions.

## Sources read

- Betts–Stix, arXiv:2204.13674v1 (SHA-256 7d4b7d49…, the hash the extraction records): §§1, 2, 4, 6, 7 in full, §3.1, §3.5 in full, the statements of §§3.2–3.4 and §5 with the proof of Proposition 5.3. The Annals version is not openly available, so locators are v1's.
- Harari–Stix, arXiv:1005.1302v2 (SHA-256 0279e8dd…): Introduction, §1, Theorem 2.1 (Betts–Stix's [HS12, Theorem 11] is this theorem in the published numbering).
- Stoll, arXiv:math/0606465v3 (SHA-256 83b87354…): §2, §5 (Definitions 5.2, 5.4, Lemma 5.8, Proposition 5.9), Conjecture 9.1.
- Stix, arXiv:0809.0017v1 (SHA-256 b456de5e…): Appendix B, Theorem 45 and Remark 46 (local fields have no divisible points, by compactness).
- Inputs: the reviewed extraction PAPER-BETTS-STIX-25 (with its review and red team RT-PAPER-BETTS-STIX-25, its verdicts and fixes); the accepted packets of AnabelianGeometryAndNonabelianChabauty NC.6, MordellLawrenceVenkatesh, PadicHodgeTheory (whole-roadmap packet), CohomologyComparisons, InverseGalois…, ArithmeticGaloisRepresentations, HeightsRationalPointsAndObstructions; the explorer packages of AnabelianGeometryAndNonabelianChabauty, PadicHodgeTheory, NeronModels…, MordellLawrenceVenkatesh; TauCetiRoadmap main (read-only checkout) for LocalFieldsRamification, LocalGaloisGroups and ClassFieldTheory.

## Item map (route 1 of PAPER-BETTS-STIX-25, all 48 items)

| Item | Node |
| --- | --- |
| /2 | SPM.0/selmer-sections |
| /3 | SPM.9/theorem-a |
| /5 | SPM.0/harari-stix-finite-descent |
| /6 | SPM.9/theorem-b |
| /7 | SPM.9/obstruction-comparison |
| /8 | SPM.6/non-symplectic-locus |
| /9 | SPM.1/sections-restrict-local-systems |
| /19 | SPM.2/restriction-induction |
| /20 | SPM.2/automorphism-group |
| /21 | SPM.2/orbit-lemma |
| /22 | SPM.2/automorphism-dimension-bound |
| /23 | SPM.3/self-conjugate-place |
| /24 | SPM.3/conjugate-places-weights |
| /25 | SPM.3/self-conjugate-character-restriction |
| /26 | SPM.3/average-hodge-tate-weight |
| /31 | SPM.4/period-maps-control-dpst |
| /32 | SPM.4/period-map-controls-local-representations |
| /46 | SPM.4/horizontal-de-rham-transport (+ SPM.4/horizontal-transport-polyannulus) |
| /47 | SPM.4/polydisc-reduction |
| /54 | SPM.1/symplectic-pair (+ SPM.1/fibre-symplectic-pair for Example 4.5) |
| /56 | SPM.5/p-adic-hodge-symplectic-pair |
| /60 | SPM.5/lagrangian-period-modules |
| /61 | SPM.5/abelian-by-finite-period-diagram |
| /62 | SPM.5/period-domain-decomposition |
| /71 | SPM.1/adelic-lv-locus |
| /72 | SPM.6/s-good-pair + SPM.6/lawrence-venkatesh-locus |
| /73 | SPM.6/period-domain-lv-locus |
| /74 | SPM.6/adelic-locus-in-lv-locus |
| /75 | SPM.9/lv-locus-finite |
| /76 | SPM.6/rational-points-in-lv-locus + SPM.9/mordell-reproved |
| /77 | SPM.6/fibre-algebra-points |
| /78 | SPM.6/principal-trichotomy |
| /79 | SPM.6/trichotomy-loci |
| /80 | SPM.7/type-a-period-non-density |
| /81 | SPM.7/type-a-locus-finite |
| /82 | SPM.7/type-a-classes + SPM.7/type-a-classes-finite |
| /83 | SPM.7/type-a-factor-non-density |
| /84 | SPM.7/type-b-period-non-density |
| /85 | SPM.7/type-b-locus-finite |
| /86 | SPM.7/type-b-factor-non-density |
| /89 | SPM.8/type-c-empty |
| /90 | SPM.8/small-extension-count |
| /91 | SPM.8/kodaira-parshin-choice |
| /93 | SPM.8/parameter-comparison |
| /94 | SPM.1/relative-symplectic-pair |
| /95 | SPM.1/section-symplectic-pair |
| /96 | SPM.1/selmer-pair-interpolates |
| /97 | SPM.1/selmer-sections-in-lv-locus |

Items routed elsewhere: /1 (NC.6/section-classes), /4 (RP.3/descent-set, with the modified locus planned here in SPM.0/modified-finite-descent-locus), /10 (R34.1), /11 (LV.1/abelian-variety-cohomology-properties; R01.6), /12–/13 (requested at LV.1), /14–/18 (R06.2/R06.3/R06.5 nodes; Theorem 2.9 requested at R06.3), /27–/29 and /63–/70 (requested at LV.3, except /59 and /68 imported from LV.3), /30 (ComplexComparisonPartII C5/gauss-manin-connection), /34–/44 and /98–/103 (PadicHodgeTheory P8 nodes associated-de-rham-pairs, de-rham-pair-derived-pushforward, completion-on-period-local-system-image, de-rham-pair-pushforward-compatibilities, filtered-derived-period-interface, horizontal-relative-periods, horizontal-and-local-system-monodromy), /45 (CP.6), /48–/50 (requested at P8: D^∇_pst, Shimizu Lemma 4.4, the polyannulus Galois category), /51 (LV.2/abelian-by-finite-family), /52–/53, /55, /57–/58 (requested at LV.2), /87 (requested at LV.7), /88 (LV.8/kodaira-parshin-family, LV.10; K_v-point fibres requested at LV.8), /92 (Mathlib Nat.forall_exists_prime_gt_and_eq_mod).

## Requests made

- **MordellLawrenceVenkatesh LV.1, LV.2, LV.3, LV.7, LV.8** (designed and accepted, not upstream): the model-free forms Betts–Stix need — symplectic Faltings lemma and GSp-irreducibility; fibre symplectic structures over a field (Lemmas 4.2, 4.6, 4.7 with π proper, 4.8); the v-adic period map on rigid neighbourhoods of K_v-points with the complex comparison (Def. 3.1, Prop. 3.2, Lemmas 5.1–5.6, Prop. 5.3, Lemma 5.9, Cor. 5.10, Remark 5.11 for proper Y); the isotropic four-Lagrangian Sublemma 6.18; Kodaira–Parshin fibres over K_v-points. The accepted routes 2–5 send these to LV, but LV's packet plans only the good-model forms. Gap 2 records this; restructure 2 offers moving them into this roadmap if LV is frozen.
- **PadicHodgeTheory P8 and R06.3** (TauCetiRoadmap pull request #1062): "Part II (PadicHodgeTheoryPartII, not yet designed)" requests for Shimizu's specialisation and D^∇_pst, the polyannulus Galois category, and the full faithfulness of D_pH. Gap 1 records this.
- Tau Ceti layers cited as they stand: ReductiveGroups Layers 0 and 3, ClassFieldTheory Layers 7 and 11, LocalFieldsRamification Layers 0, 2 and 4, Chebotarev Layer 10.

## Notes for the reviewer

- Proposition 2.19 is planned through the LV.1 infinity-type nodes (pure-character-conjugation-relation, infinity-type-factorization) rather than the paper's Serre-torus argument; both use that the character is Q_p^×-valued, as the red team insisted (RT/2).
- The trichotomy (SPM.6/principal-trichotomy) states (c) with #Σ_A (extraction E1); Definition 6.8's type (c) keeps dim A, evaluated only on split algebras.
- Local injectivity of the section map at finite places (needed for loc_u to be defined) is not in NC.6, which proves only the number-field case; SPM.0/local-section-map-injective plans it from Stix, Remark 46. Restriction of sections to decomposition groups at completions (SPM.0/local-section-restriction) is likewise new here.
- The packet's sourceIssues E1–E9 are the low-severity paper mistakes confirmed by REV-RT-PAPER-BETTS-STIX-25 (findings /6, /8(1)–(7), /12) but never added to the extraction; each was re-checked on the arXiv v1 page. E10 records that Stix's Remark 46 (no divisible points over local fields 'by compactness') holds only for non-archimedean local fields. The extraction's own E1–E8 are not duplicated; the reader has a corrections table citing both.
- The queue's DESIGN-AnabelianGeometryAndNonabelianChabautyPartII duplicates this job (RT/1); restructure 1 asks to retire it.

## Remaining (for follow-ups)

- The requests above; when the suppliers state them, SPM.1, SPM.2, SPM.4–SPM.9 can be closed.
- A lemma-level pass later: e.g. the cup-product and base-change compatibilities of the transport isomorphisms are in proof sketches only.

## Cross-checks

Two read-only Sonnet agents checked every node against the source text (all locators confirmed; no high-severity statement error except a missing genus ≥ 1 qualifier, fixed). Their low findings were applied: morphisms of symplectic pairs as in Definition 4.4, Stoll's Conjecture 9.1 worded as 'every curve is very good', the genus-3 least-q argument of Remark 6.23(III), the extra elliptic-family coincidence of the two loci marked as this roadmap's own observation, and the crystalline-transport comparison removed (it needs a comparison of Scholze's c_dR with the crystalline one, which Betts–Stix Remark 3.4 says is not available). An automatic label-on-page check over all locators passed.

## Timing

Claimed 01:56Z; packet, reader, roadmap and Lean file first passed their checks at about 02:45Z.
