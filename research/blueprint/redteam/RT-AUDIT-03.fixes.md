# RT-AUDIT-03: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #3998, job FIX-RT-AUDIT-03).
- **Findings and verdicts.** `RT-AUDIT-03.result.json` and `RT-AUDIT-03.review.json`. The red team made 4 findings (/1 high; /2, /3, /4 medium). The review confirmed all 4 and rejected none.
- **Scope.** All four confirmed findings are fixed here. There are no low-severity findings.
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-03.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Verdict and library-value changes.**
  - IntegralLattices Layer 1 goes from `built` to `partly built`.
  - Chebotarev 7.4's ramification row is split in two: a descent row (`partial`) and a new-ramification row (`absent`).
  - A new `absent` target for rational form scaling is added to IntegralLattices Layer 1.
  - Every other layer verdict and library value is unchanged.

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name.
- **Line correction.** The review cites the ring-of-integers integrality instance at `Mathlib/NumberTheory/NumberField/Basic.lean:369`. That line is the docstring. The declaration `NumberField.RingOfIntegers.extension_algebra_isIntegral` is at line 370, and that is the line cited.
- Every target has at most five declarations, so no citation was displaced.
- No duplicates entries are added or changed.

## RT-AUDIT-03/1 (high, error): the residue of L_1 (Chebotarev 12.1)

**Target text.** "simple pole with the same residue" is replaced by the corrected statement:
- L_1 = ζ_K·P_S with P_S(s) = ∏_{p∈S}(1 − Np^(−s)).
- The residue at s = 1 is κ_K·∏_{p∈S}(1 − 1/Np), which is not κ_K when S is nonempty.
- −L_1'/L_1 = −ζ_K'/ζ_K − P_S'/P_S has principal part 1/(s−1), because P_S'/P_S is regular at 1.
- The target keeps its boundary-continuity clause.

**Citation added.** `NumberField.dedekindZeta_residue_pos` (DedekindZeta.lean:65, related). The three existing citations are kept, and the target now has four.

**Note.** The note now says:
- The deleted factors multiply the residue by P_S(1) ∈ (0, 1).
- The rational example: `riemannZeta_residue_one` (RiemannZeta.lean:242) gives residue 1, while (1 − 2^(−s))ζ(s) has residue 1/2.
- The residue-one statement belongs to the logarithmic derivative.
- The intended density constant κ = 1/#Gal(F/K) is unchanged.
- The roadmap's own 12.1 needs the same correction.

**Unchanged.** The target stays `partial`, and Layer 12 stays `not built`. The missing continuation and boundary package stays missing.

**Maintainer note.** `content/tau-ceti/Chebotarev/README.md` 12.1 says that L_1 "inherits the simple pole with the same residue". This is false for a nonempty set of ramified primes, and the roadmap text needs the same correction. I did not edit the roadmap, since this job may change only the audit. The review agrees with the finding here.

## RT-AUDIT-03/2 (medium, library-claim): rational form scaling (IntegralLattices Layer 1, summary)

**Target "Form scaling, negation and orthogonal direct sums…".**
- The target now begins "Integer form scaling (the Z-action), negation and orthogonal direct sums".
- Its citations and `tauceti` value are kept.
- Its note adds that scaling is the integer action `IntegralLattice.scale` (Scaling.lean:74).

**New target (`absent`).** "Form scaling by a nonzero rational r under the explicit integrality hypothesis…", with the bundled invariants and transport along isometries. It cites:
- `TauCeti.IntegralLattice.ofSubmodule` (IntegralLattice/Basic.lean:164, related).
- The generic scalar-signature lemmas `QuadraticForm.sigPos_smul_of_pos` (QuadraticForm/Signature.lean:82) and `QuadraticForm.sigPos_smul_of_neg` (:106), both more general.
- `TauCeti.IntegralLattice.dualCarrier_smul` (Dual/Scaling.lean:71, related).

Its note says:
- `scale`, `signature_smul_of_neg` and `dualCarrier_smul` are integer-only, and Scaling.lean:20–23 defers rational scalars.
- The rational unit in `dualCarrier_smul` does not act on bundled lattices.
- The missing piece is small: `ofSubmodule` under the integrality hypothesis, plus the generic lemmas. The note names `sigNeg_smul_of_pos` (:96) and `sigNeg_smul_of_neg` (:114).
- On ℤ, (1/2)(2xy) is integral while (1/2)xy is not, so no unconditional rational action exists.
- The integer action is not to be replanned.

**How the review shaped the fix.** Following the review, the remainder is kept small: the new target reuses `ofSubmodule` and the generic lemmas, and needs no new carrier.

**Layer verdict.** `built` → `partly built`.

**Summary.** The summary is qualified in three places:
- "fully built" becomes "built in Tau Ceti except for one Layer 1 item".
- "scaling" becomes "integer scaling".
- "Nothing required is missing." is replaced by a sentence naming rational form scaling under an integrality hypothesis as the one missing required piece.

## RT-AUDIT-03/3 (medium, library-claim): ramification in the compositum (Chebotarev 7.4)

The single `absent` row is split in two.

**"7.4 Ramification in the compositum (descent)…" (`partial`).**
- Citations:
  - `Algebra.IsUnramifiedAt.of_liesOver` (RamificationInertia/Unramified.lean:83, more general).
  - `Ideal.nonempty_primesOver` (Ideal/GoingUp.lean:334, related).
  - `NumberField.RingOfIntegers.extension_algebra_isIntegral` (NumberField/Basic.lean:370, related; line corrected from the review's 369).
- The note records the bridge to the target: take R = O_K, S = O_L or O_{K(ζ_q)} and T = O_M. The rings of integers supply the hypotheses, and lying-over turns the primewise lemma into the all-primes statement. That specialization is not stated in the library.
- As the review says, the note also records that `IsUnramifiedAt.of_restrictScalars` changes the base and is not this result.

**"7.4 Ramification in the compositum (new ramification)…" (`absent`).** This row keeps the statement that primes ramified in M but not in L lie above q. Its note says the descent lemma does not give it.

**Library value.** I chose `partial` rather than `mathlib` for the descent row, following the audit's convention: 11.4, for example, is `partial` when a more-general lemma exists but its specialization is not stated.

**Layer verdict.** Layer 7 stays `partly built`.

**Summary.** "the compositum ramification statements" now reads "the compositum ramification statement that new ramification lies above q (descent of unramifiedness follows from Mathlib's general tower lemma)", to stay consistent with the split.

## RT-AUDIT-03/4 (medium, library-claim): conductors (Chebotarev Layer 4)

**Target "Identify the conductor modulus through Global Number Fields".**
- It is kept strictly as the missing GlobalNumberFields bridge and stays `absent`. The review allows this and says the target need not be widened.
- Citations added, both special case: `DirichletCharacter.conductor` (DirichletCharacter/Basic.lean:246) and `IsCyclotomicExtension.Rat.mem_intermediateFieldEquivSubgroupChar_iff_conductor_dvd` (Cyclotomic/Galois.lean:219). The two Tau Ceti citations are kept, and the target now has four.

**Note.** The blanket "no conductor … is defined" is replaced by the precise boundary:
- Mathlib has the natural-number Dirichlet conductor, with `conductor_dvd_level` (:251) and `factorsThrough_conductor` (:253), and the rational cyclotomic field/character dictionary.
- Tau Ceti has moduli and ray class groups of a general number field.
- Missing are the conductor of a general K as a GlobalNumberFields modulus, with its infinite component, and its comparison with those moduli.
- The note does not claim that any general ray conductor is formalized.

**Layer verdict.** Layer 4 stays `partly built`.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-03.result.json research/blueprint/redteam/RT-AUDIT-03.fixes.md`: 0 problems.
- **Edits.** All edits were applied by one script. Each text substitution was asserted to match exactly once, and the replaced 7.4 row was asserted equal to its original. The script also asserted at most five declarations per target and an unchanged `review` object. The JSON was re-dumped in its original format (indent 1, no trailing newline).
- **Citations.** Every added citation resolves in the pinned `declarations.tsv` at the stated file and line, and the source line there is the declaration.
- No Lean file is involved, so nothing was compiled.
