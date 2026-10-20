# BorelRegulators third fix round: checkpoint

Issue #11298; job `FIX-PKG-BorelRegulators~adv3`; Codex, session
`codex-wWjBMF`; 2026-10-20. **Incomplete: `needs_changes`.** The sole remaining
finding, F1 of `REV-PKG-BorelRegulators~codex.md`, requires a maintainer
decision about ownership of the multiplicative-group measure comparison.

## Finding and changes

| Finding | Change | Disposition |
|---|---|---|
| F1: §6.2 attributes the norm-one idele-class volume to AutomorphicLFunctionsAndLocalFactors AL.1, but its current roadmap has no such target. | Removed this attribution in Scope, Exact supplier contracts and §6.2, including the assertion that AL.1 supplies the degree-one zeta residue. Deleted the unsupported `tamagawaNumber_multiplicativeGroup` conversion bullet. | False supplier contract removed; the mathematical input remains unavailable. |
| F1: the missing value is on the proof path of the norm-one Tamagawa number and the period theorem. | Added a precise missing-input paragraph in §6.2. Kept the reduced-norm fibration and its identity τ(GL₁(D))=τ(SL₁(D))τ(𝔾_m); marked its numerical conclusion conditional on the missing input. Marked the inner special-linear induction's dependence on the same base case. Named §§6.3, 7.1 and 7.2 as affected. | Gap exposed, not resolved. |
| F1: Mathlib's class-number formula is insufficient as an idelic measure contract. | Distinguished the positive arithmetic expression `NumberField.dedekindZeta_residue` and its ideal-series limit from the missing quotient-measure comparison. Retained the ℚ Check as a special case, without claiming that it proves the result over every number field. | Generality preserved; a special case does not replace the general obligation. |

The §6.2 opening now matches the existing `generalLinearOne_tamagawaNumber`
target's e≥2 hypothesis. The e=1 norm-one group is trivial and its Tamagawa
number is handled directly, without invoking a multiplicative-group volume.
No other target, hypothesis, Check or source locator was removed. In
particular, the division-zeta decomposition, reduced-norm image, all-number-field
and all-odd-degree regulator theory, and exact Bloch–Wigner coefficient remain.
`Suggested.lean` and `metadata.toml` are unchanged. The packet and earlier
review reports are outside this job's edits.

## Why this is blocked

The independent review already identified this as requiring a maintainer
decision. I checked its supplier claims against the following current texts:

- [AutomorphicLFunctionsAndLocalFactors, PR #924](https://github.com/TauCetiProject/TauCetiRoadmap/pull/924),
  head `d1996dc1edb1a6f095caec7bd8768245888b7a7c`: AL.1 covers local
  eigendistributions and Hecke L-functions; it does not supply κ, an
  idele-class quotient volume or τ(𝔾_m).
- [AdelicAlgebraicGroups, PR #792](https://github.com/TauCetiProject/TauCetiRoadmap/pull/792),
  head `58ecae28ee3ce7862650f8d3305b1000bf804b39`: §2.4 defines the
  normalised Tamagawa measure and number and computes the trivial group;
  §5.1 identifies the multiplicative-group quotient and its compactness,
  without giving its measure.
- [GlobalNumberFields on current main](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalNumberFields/README.md),
  Layer 6: compactness of the norm-one idele class group. Algebraic-group
  quotient measures are expressly outside its scope. The current Tau Ceti
  library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` likewise has no
  multiplicative-group Tamagawa-number or norm-one idele-class-volume theorem.
- At the pins, Mathlib `NumberTheory/NumberField/DedekindZeta.lean`,
  `NumberField.dedekindZeta_residue` and
  `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, lines 56–84:
  the arithmetic residue and its ideal-series limit are available. They do
  not identify that residue with the mass of an idelic quotient.

The Tate's-thesis rule in [PACKAGE_REVIEW.md](../PACKAGE_REVIEW.md), dated
2026-10-19, prohibits package targets for the norm-one idele-class volume.
In the prescribed normalization, supplying τ(𝔾_m)=1 is the same missing
measure comparison. Introducing it here under another name or silently
assigning it to another roadmap would not settle that restriction. I asked
the maintainer whether this roadmap may own a geometry-of-numbers proof or
whether the explicit supplier gap should remain; no decision had arrived
when this checkpoint was prepared.

The source argument confirms the need rather than removing it:
[Mars, exposé 351](https://www.numdam.org/item/SB_1968-1969__11__79_0.pdf),
§3, Lemme, pp.82–83, and §4, pp.83–84, separates the fibration from the
two zeta-volume computations, for the field and the division algebra.
[Borel 1977](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf),
§2.3 and Proposition 2.4, pp.618–619, uses the norm-one Tamagawa value;
its proof needs at least positive rationality. With τ(GL₁(D))=1, even that
rationality still requires positive rationality of τ(𝔾_m).

## Adversarial pass on the touched statements

| Statement or contract | Instances tried | Result and change |
|---|---|---|
| AL.1 supplies the missing volume | Current PR #924 versus the stale explorer copy; continuation/functional equation versus quotient measure | No volume target in the current supplier. Removed the contract rather than inferring it from analytic continuation. |
| `generalLinearOne_tamagawaNumber` opening | e=1 versus e=2; e=0 | The existing proof target has e≥2. The opening now agrees. e=1 would introduce the very missing field case; e=0 is not the degree of a central division algebra. The e≥2 proof was preserved. |
| `divisionZeta_residue` boundary | e=1 versus e≥2 | e=1 remains outside its statement. Deleted only the nonexistent AL.1 supplier assertion; no degree-one theorem was added. |
| `normOne_tamagawaNumber` | e=1; archimedean-split e≥2; the rational quaternion algebra ramified at 2 and ∞ | e=1 is the trivial group. For e≥2 the fibration still yields the product identity, with an undetermined base mass. The real sign-index compensation remains: both relevant indices are 2 in the definite quaternion example. Numerical conclusion now explicitly depends on the missing input. |
| `specialLinearDivision_tamagawaNumber` | m=1; m=2 with D=F; m≥2 with e≥2 | m=1 is the norm-one base case. The split m=2 stabiliser is unipotent. For e≥2 the induction inherits F1; this is now explicit. No restriction on m or D was added. |
| Multiplicative-group normalization Check | F=ℚ; a general field with Δ_F≠1; scaling a Haar measure by c>0 | Over ℚ the domain {1}×∏ℤ_p^× has mass 1. This does not determine the general-field mass. Omitting Δ_F^(−1/2) changes it by Δ_F^(1/2); arbitrary positive rescaling preserves compactness but changes mass, so compactness alone cannot imply rationality. The existing discriminant Check is retained. |
| Residue versus quotient volume | Positive ρ_F with no measure identification; q=2 versus q=1; characteristic p | Positivity of the arithmetic expression does not give the quotient's mass. q=2 is allowed; q=1 is not a residue-field cardinality. The statements concern number fields, so characteristic p is outside their hypotheses. No false substitute target or numerical Lean example was introduced. |

No new definition or convention was introduced. The affected Tamagawa objects
remain README targets because they are not statable with the carriers at the
pins. No Lean declaration was changed; its eight proved examples and the
previously reviewed trace proof remain intact.

## Validation

- `lean-check research/blueprint/packages/BorelRegulators/Suggested.lean`:
  exit 0, 11 `declaration uses sorry` warnings and no other warnings or errors.
  Ran against Mathlib `082e2d37e8` and Tau Ceti `f790474`; available memory
  exceeded 20 GB. The file remains 253 lines.
- `mech_check.py research/blueprint/packages/BorelRegulators`: exit 0;
  18 named Lean declarations, no missing README labels, no unnamed bold
  targets. The 13 README-only light-definition API items are unchanged;
  the empty Layer 1 section contains the two library `#check`s. The reported
  word `continuation` is an analytic term, not a round label.
- `depcheck.py --candidate …/BorelRegulators --only BorelRegulators`:
  exit 1 solely for `NOT IN ORDER.txt: BorelRegulators`, which this issue
  expressly says to ignore. No dependency cycle or upward-edge error reported.
- `python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json`:
  0 errors, 0 warnings; packet unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/BorelRegulators/Suggested.lean`:
  exit 0.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverables: 0 problems. `git diff --check`: clean. README: 196,817 bytes,
  below the previous review's 200 KB ceiling.

Both PDFs above were read on 2026-10-20, only for these locators and the
dependency in question. SHA-256: Mars
`468d9f2f475086055bb86755c2e1ad80550fd10f4ac7d5c540258dd34c98bb73`;
Borel `f27dc4622583423cdcfc66671cffd38904f3ecf4d97b8b1352fcf3dbf3a295b5`.
No source passage was added to the repository. No suspicious instructions
were encountered in the untrusted source or supplier texts.

## Exact restart

1. Obtain the maintainer's ownership decision and, where necessary, an
   explicit exception to the Tate's-thesis target restriction. Candidate
   placements identified by the independent review are AdelicAlgebraicGroups
   §5.1 or a local geometry-of-numbers proof in BorelRegulators. No target was
   assigned to another job by this checkpoint.
2. Establish the all-number-field quotient-measure comparison in the exact
   normalization of AdelicAlgebraicGroups §2.4. A reference to the analytic
   class-number formula alone is insufficient: identify the relevant
   fundamental domain, unit and torsion factors, discriminant factor, and
   norm-direction disintegration. Do not restrict to ℚ or to quaternion
   algebras, and do not revive the removed global Tate-integral target.
3. Once an admissible supplier or authorized local proof exists, replace
   §6.2's missing-input paragraph by its precise contract/proof and discharge
   the norm-one and inner special-linear consequences. Recheck §§6.3, 7.1
   and 7.2; retain the confirmed decomposition and §8.5 coefficient.
4. Repeat the touched-statement pass and package checks. Only after F1 is
   actually resolved may `review.json` change from `needs_changes`.
