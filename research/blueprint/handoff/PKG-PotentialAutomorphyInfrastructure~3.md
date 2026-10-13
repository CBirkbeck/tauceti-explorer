# Potential automorphy infrastructure package, revision 3

Done by **Claude (Opus 5.5) — claude-i3qceo**, 2026-10-13, for issue #9187,
`PKG-PotentialAutomorphyInfrastructure~3`. The claim was confirmed on the issue
before any edit. This session wrote neither earlier package round nor either
review. The package is complete for a fresh independent package review;
`review.json` is left in place for that reviewer.

## Response to the second review

The second review (codex-QiWdWR, 2026-10-10) passed items 1–4 and 6 and failed
item 5 only: it counted Lean signatures for every definition, API item, check
and theorem, as the older section 13 asked. The binding rule is now
PACKAGE_REVIEW.md, "Shape of a roadmap (2026-10-12)", and PROTOCOL.md §§13 and
20 as revised: the README carries the full detail, and `Suggested.lean` states
only light real-bodied definitions over carriers that exist at the pins, the
milestones statable there, and a few discriminating examples. A statement whose
carriers are not at the pins is a README target and must not appear in the
Lean. The arithmetic definitions and theorems that the review listed as
missing signatures (`ArithmeticOrdinarySummand`, `LocalOrdinaryParts`, the
completed cohomology complexes, both local–global theorems, the patching
verifications and both lifting theorems, …) all need arithmetic cohomology,
Hecke algebras, Galois representations of number fields, automorphic
representations or deformation rings, none of which exist in Mathlib 082e2d3 or
Tau Ceti f790474. They are therefore README targets only, each with its
statement, hypotheses, locator, prerequisites and (for definitions) API and
Checks, and the closing comment of the Lean file lists them.

## Suggested.lean

The file was rewritten to the 2026-10-12 shape (676 → 574 lines).

- It failed `scripts/check_sorry_data.py`: `EquivariantRetract.map` and
  `EquivariantRetract.refl` were `def … := by sorry`. Both now have real bodies
  (`Retract.map`, `Retract.refl`, with their commuting equations proved).
- Chains of API lemmas that restate definitions were removed
  (`inclusion_comm`, `first_block`, `iff_witness`, `RankTwoWeightZero.iff`,
  `det_eq`, `mem_iff`, `unit_eval`, `on_units`, …); the README keeps every API
  item. Kept theorems: `EquivariantRetract.idempotent`,
  `UnitaryLeviWeight.dominant_iff`, `KostantShuffle.minimal_representative`,
  `shifted_partition_recovery`, `simple_galois_composita` (new: the Layer 2
  milestone whose carriers exist in Mathlib), `IwahoriLevelTower.diamondQuotient`,
  `RelativeBruhatCells.open_union`, `TaylorWilesArithmeticLevels.diamond_quotient`
  and `trace_scalar`. Each kept definition has one to three discriminating
  examples; proof fields of `Submonoid`, `Subgroup` and `MonoidHom` structures
  are `sorry` (allowed: they are propositions), every data field is real.
- Final `lean-check research/blueprint/packages/PotentialAutomorphyInfrastructure/Suggested.lean`:
  exit 0 at Mathlib 082e2d37e8, 47 `declaration uses sorry` warnings, no other
  warnings, no errors. `python3 scripts/check_sorry_data.py` reports nothing.

## README

The README grew from 199,597 to 269,294 bytes; nothing was dropped. All
123 accepted targets, 122 API names and 90 test names of the accepted plan
occur (checked by script), plus the auxiliary-extension target of round 2 and
the ten new targets below.

- Opening **Summary.** paragraph added (required by the 2026-10-12 shape);
  the paragraph on the suggested file now describes what the Lean states.
- Scope and ownership rewritten. SmoothRepresentationsOfLocalGroups,
  IntegralHeckeAndGaloisDeterminants and ReductiveGroupsPartII are now Tau Ceti
  roadmaps (TauCetiRoadmap main 0d144d0); every claim made of them was checked
  against their READMEs and Suggested.lean, and the supplier rows now cite their
  actual layers: SR.0/SR.0d (the README's "SR.0:derived-extension" does not
  exist upstream), SR.1.4, SR.1.5, SR.2.1–2.2, SR.3.4, SR.4.3, SR.6.5; IHG
  Layer 0 (§0.3), Layer 1 (§§1.2–1.3), §2.3, §6.4; RG2.0a, RG2.3, RG2.4.
  The names `StableOperator.split`, `StableOperator.invertiblePart`,
  `Theorems.factorial_powers` and `Theorems.ordinary_finite` are not upstream
  declarations (only the predicate `StableOperator` is); the README now cites
  the predicate and the "Factorial powers" and "Ordinary finiteness" paragraphs
  of IHG §2.3. ClassFieldTheory global reciprocity is its Layer 11 (the README
  said Layer 12). `TauCeti.LocalFieldsRamification.isSolvable_algEquiv` exists in
  the current Tau Ceti library (`TauCeti/NumberTheory/LocalField/Solvable.lean`)
  but not at f790474; the README says so.
- Wrong locator fixed: ACC Lemma 5.2.4 is on p. 992, not pp. 996–997.
- Every statement that cited ACC's internal numbering (Theorem 4.5.1,
  Proposition 6.5.3, Lemma 6.6.5, §6.5.1 (1)–(17), …) now names the target of
  this roadmap or the supplier layer instead; bracket keys such as [KT17],
  [Ger19], [Eme10b], [BT65], [Che51], [Tay08], [BC09], [CHT08], [Clo90], [NT16],
  [Jan03] became author references, listed in the References.
- Source parentheticals "(Proof: …)", "(Remark 6.1.x, folded here …)",
  "(Asserted without proof.)" were replaced by route paragraphs and sentences
  in our own words. The statements of `siegel_coefficient_retract`,
  `coefficient_satake_descent`, `ramified_satake_descent`, `boundary_degree_retract`,
  `degree_reflection_duality`, `genericity_making_character_twist`,
  `shifted_partition_recovery`, `rank_two_system_trichotomy`, `IwahoriLevelTower`,
  `ArithmeticOrdinarySummand`, `UnitaryOrdinaryTower`, `bruhat_filtration` and
  `TaylorWilesArithmeticLevels` were rewritten.
  An 8-word-shingle comparison of the README with the text of ACC, BLGGT, BCGP,
  BCGNT, Khare–Thorne, Chenevier, Newton–Thorne and Qian now finds no English
  run longer than 14 words outside formula strings and reference titles.
- A `*Route.*` paragraph (proof sketch) was added to 83 theorems that had none,
  from the accepted plan's proof steps with stage identifiers replaced by
  target names.
- Forward reference fixed: `hida_weight_independence` and
  `hida_weight_specialization` (Layer 4) cited "Layer 5"; they now cite
  `WeightIndependentHidaTwist`, `OrdinaryHidaComplex`,
  `completed_ordinary_weight_control` and DP:P7. A script check of every
  *Needs:* list finds no reference to a later target or higher layer.
- Checks added to both lifting theorems for the plan's acceptance properties
  (no polarization assumed; the rank-one branch is class field theory).

## Notions moved down into this roadmap (record for the plan)

The cross-check against current upstream showed that several contracts asked
of Tau Ceti roadmaps are not stated there, and two owners named by the plan do
not exist (ReductiveGroupsIntegralRepresentationsPartII and
ReductiveGroupsArithmeticPartII have no plan and are not in the
Caraiani–Newton tier order). Following WORKERS.md ("the notion moves down"),
these are now README targets here, each with locators read in the source:

| New target | Layer | Source (checked) | Replaces |
| --- | --- | --- | --- |
| `IntegralDualWeylModule` (definition, API, 4 Checks) | 0 | ACC §2.2.1 p. 918; Newton–Thorne §2.2.7 pp. 12–13 | ReductiveGroupsIntegralRepresentationsPartII |
| `dual_weyl_levi_splitting` | 0 | Newton–Thorne Prop. 2.10(2), Cor. 2.11, pp. 13–14 | same |
| `dual_weyl_bottom_alcove_duality` | 0 | Jantzen II.5.5–5.6, pp. 220–221; ACC p. 983 | same ("[Jan03, Cor. II.5.6]") |
| `positive_monoid_hecke_restriction` | 0 | ACC Lemmas 2.1.10, 2.1.11, 2.1.14, pp. 913–915 | SR.1 (only 2.1.12–2.1.13 upstream) |
| `residually_distinct_split_image` | 1 | Chenevier Thm 2.22, PDF p. 34; ACC p. 980 | IHG.1 two-block product |
| `pgl2_product_forms` | 2 | Platonov–Rapinchuk–Rapinchuk Thm 2.15 p. 78; ACC Lemma 7.1.3 facts (4), (7), (8) | ReductiveGroupsArithmeticPartII |
| `frobenius_polynomials_determine_semisimple` | 2 | Chenevier Thm 2.12, PDF p. 28; Chebotarev | Chebotarev row |
| `pure_unramified_principal_series_irreducible` | 2 | Zelevinsky Thm 4.2, p. 184; BCGNT p. 59 | SR.3 |
| `SmoothMonoidModules` (definition, API, 3 Checks) | 3 | ACC (5.2.2)–(5.2.3), Lemma 5.2.4, p. 992 | SR.0 "derived-extension" |
| `taylor_wiles_residual_iwahori_hecke` | 5 | Khare–Thorne §5, Lemmas 5.1–5.4, pp. 25–27 | SR.1 (KT §5) |

The plan's gap "Integral highest-weight owner ReductiveGroupsIntegralRepresentationsPartII
has no stage yet" is resolved this way for the package. If that Part II is
designed later, it should import these Layer 0 targets (or take them over if it
lands in a lower tier). The accepted packet was not changed; a plan revision
should add these ten nodes and repoint the four prerequisites recorded in that
gap.

## Remaining source obligations (stated in the README, not hidden)

- Geraghty Lemmas 5.2 and 5.7 (twisted Steinberg eigenvalues; transport of
  ordinarity under a soluble base change not split above p) have not been read;
  `twisted_steinberg_ordinarity_criterion` and `iota_ordinary_soluble_base_change`
  say so.
- `genericity_making_character_twist` is used by ACC without proof; its proof is
  an open obligation of that target.
- The Bernstein presentation over arbitrary rings is flagged upstream (SR.1.5)
  as an integral proof obligation; `taylor_wiles_residual_iwahori_hecke` relies
  on it.

## Sources read (public copies fetched to scratch, not to the repository)

Accessed 2026-10-13; SHA-256 of the fetched files:

- Khare–Thorne, Cambridge repository manuscript (README link):
  744c31b9e5b28e1c5ea5f5322992d40b1e398c7fcecf5765a0a61238c0a3e579
- BCGNT, author PDF (README link):
  cf0c334f106dc17aa39a77d97341ebe96743ac8dd1858006c99936d303efe915
- Zelevinsky 1980, https://www.numdam.org/item/10.24033/asens.1379.pdf:
  663c79f2ee236626385d242d83107410c1a3291ba5584d4b8abee9cf8af428ac
- Newton–Thorne, https://arxiv.org/pdf/1511.04913:
  2df7b65ab99a206a222ec133a866739187d64f193d9f295944a48dedfc9b49bd
- Chenevier, https://arxiv.org/pdf/0809.0415:
  f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953
- BLGGT, https://arxiv.org/pdf/1010.2561:
  c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24
- Qian, NSF copy (README link):
  77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8
- BCGP, author PDF (README link):
  1bbaa5c4f55fd2e15523953d40f41e518695025d758285eabd5ac829932c8051

From the maintainer's cleared library, read in place and not copied: ACC
(author copy of the Annals paper), Jantzen, *Representations of Algebraic
Groups* (Part II, 5.5–5.6, pp. 220–221), and Platonov–Rapinchuk–Rapinchuk,
Volume I (§2.2, Theorem 2.15, p. 78). The README cites them by statement and
page.

## Checks run

- `lean-check` on the package Suggested.lean: exit 0, 47 sorry warnings only.
- `python3 scripts/check_sorry_data.py`: no offender.
- `python3 research/blueprint/intake.py check-files` on the three package files:
  0 problems.
- Script checks: all accepted targets, API names and test names present; no
  forward prerequisite; no process vocabulary (packet, stage, review, gap,
  checkpoint, coverage, atlas) in the README.
- A Sonnet subagent produced the claim-by-claim cross-check of the upstream
  supplier rows; I read the upstream table of contents of SR and IHG and the
  IHG §§1.2 and 6.4 passages myself, and took the remaining verdicts from that
  cross-check, which quotes the upstream line numbers.

Only the package README.md and Suggested.lean and this note changed;
metadata.toml (`topic = "math.NT"`) and review.json are unchanged.
