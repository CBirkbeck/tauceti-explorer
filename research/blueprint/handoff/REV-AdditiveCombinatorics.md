# Handoff — REV-AdditiveCombinatorics

Refs #545. **Codex, codex-A7zu36**, 11 October 2026.
Branch: `codex-A7zu36-review-additive-combinatorics`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/545#issuecomment-6105540690)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/545#issuecomment-6105541789)
before work. This session did not write the blueprint it reviewed and submits
exactly this one job.

## Done

**Complete independent review; accepted, not a checkpoint.**
The [packet](../packets/AdditiveCombinatorics.json) has an accepted review by
`independent-review-REV-AdditiveCombinatorics` and a verdict on each of its
100 nodes: 73 verified, 27 corrected, none added or unverifiable. Its six stages
are planned and none is closed. Eight proof/supplier gaps and fourteen precise
supplier requests remain; every implementation status stays unchecked.

The revised size is 286 API items, 131 planned tests, 31 planets and 51
confirmed baseline entries. All fourteen inherited source findings have an
independent confirmed verdict. E15–E20 add version-scoped findings: GGMT v2's
joint-entropy sign, Kai's conductor and Fourier-resolution signs, the
log-concavity justification for the boundary argument, the S-unit error sign
and consistent enlarged-box Gowers normalization. No priority claim is made.

The [review report](../reviews/REV-AdditiveCombinatorics.md) records every
correction, all baseline checks, source versions, supplier/finding treatment,
prototype limitations and the packaging synchronization. The
[suggested file](../suggested/AdditiveCombinatorics.lean) elaborates at the pins.
No other packet, atlas data or upstream file was changed.

## Checks

The packet checker reports 0 errors and 0 warnings. Source-finding/schema
checks report 0 problems. Intake checks the four deliverables with 0 problems,
and `git diff --check` passes. Final `lean-check` exits 0 with 0 errors and
470 warnings, all for declarations using `sorry`. Proofs and planned examples
remain unproved; no non-sorry warning was emitted. No Lean process was left
running.

## Resume with packaging and supplier work

The live issue lists only the packet, suggested file and review report, so the
[reader](../readmes/AdditiveCombinatorics.md) was inspected read-only. Include
its synchronization in the package job's authorized files. The corrected
packet/report contracts take precedence over stale reader wording:

- Reference distributions in the entropy minimizer interfaces are probability
  measures. Uniform factor approximation needs the LSS Lemma 3.8 large-N
  threshold; factor regularity comes from a shift at fixed resolution.
- Complex scalar homogeneity needs positive Gowers order. A bounded
  nilsequence observable must admit a finite nonnegative Lipschitz constant;
  the real infimum defining its displayed norm cannot enforce that condition.
- The new tests distinguish conjugate reflection using an imaginary point
  mass, fix U¹ of the constant 3i at 3, and reject a bounded non-Lipschitz
  observable despite the totalized infimum. The report gives exact locators.
- Consume existing `CommGroup.sum_monoidHom_apply_eq_ite`,
  `TauCeti.haarProb_eq_smul_count` and
  `TauCeti.hasSum_norm_sq_peterWeylCoeff`; the additive/unit-character and
  one-dimensional coefficient comparisons are explicit adapters. The
  Behrend module includes `Combinatorics/Additive`; ideal norm uses its native
  Dedekind-domain/infinite-ring assumptions.
- Update the corrected BSG, polynomial/Malcev, CFZ, ES.0, Kai boundary and
  GT-erratum locators, the three edition dates and the GGMT manuscript access.
  Keep the distinct-form subproduct argument and E16–E20's repaired proof
  steps. E15 is already corrected in the GGMT accepted manuscript.

Retain all eight explicit gaps: Bohr/lattice bookkeeping, Rahman's original
numerical proof, directed-cycle removal, inverse internal proof, nilsequence
calculus/reduction, relative counting/smooth analysis, sharp-cutoff moments,
and ideal Type I/II/vector counting. Do not upgrade planned to closed or treat
a prototype omission as a definition. The package must carry the full target
conditions described in `prototypeLimitations`.

The orchestrator applies the existing `restructure` proposals: AC.5's direct
AC.3/arithmetic links; the qualified AN.2 input; removal of unused SV.3 → AC.4;
ALS.2 importing the AC.3 carrier; ER.4 importing the AC.0 Fourier interface.
Missing global nilpotent/quotient facts extend LieGroups, and arbitrary
directed-cycle removal extends Regularity. No downstream owner was edited.
GN.1, FF.2, ES.3/ES.4 and fixed-modulus AN.2 supplier statements were checked;
AN.3/AN.4 and SV.1/SV.2 requests still require their stated contracts.

Public source URLs, hashes, edition dates, counterexamples and source verdicts
are in the packet and report. No scratch source or log is needed to continue.
The job scratch directory is deleted after opening the pull request.
