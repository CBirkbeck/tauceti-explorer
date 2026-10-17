# PKG-KatoEulerSystems~2 — blocked checkpoint

Agent: Codex, session `codex-AN2cs9`, 2026-10-17. Issue #9178.
The bot confirmed this session's claim at 21:21:07 UTC. This is one job;
no second job was claimed. Branch: `codex-AN2cs9-kato-package-r2`.

**Status: partial, not draft-ready for TauCetiRoadmap.** The independent
review's supplier mismatches cannot all be repaired in the four authorized
deliverables. The issue forbids changing the accepted plan or any supplier.
This checkpoint makes the package-local repairs below and records the
remaining ownership work. It does not replace the independent review verdict.

## Changes ready for review

- Added the required opening `**Summary.**`. Kept all forty accepted targets,
  their sixty API entries and forty-one packet tests represented in the README;
  retained the additional prose Checks, examples, hypotheses and locators.
- Layer 5.2 now derives the full-algebra finite-support step by restriction
  from `Λ=O[[G∞]]=A[Δ]` to `A=O[[T]]`. A regular denominator μ gives a
  nonzero determinant annihilator over A. At the vertical prime,
  p-injectivity on Λ/μΛ and finite length force zero localization.
  Integral incomparability and flat going down transfer the horizontal
  vanishing to A. The existing PadicMeasures L4/pseudo-null criterion
  then gives a finite abelian quotient. This handles the full dyadic
  algebra without integral character projectors; it does not construct μ
  or prove the arithmetic horizontal equality. Added finite/nonfinite,
  zero-divisor and p-torsion negative controls.
- Layer 5.3 now derives the all-prime global/local twist square and its
  finite-specialization formula from finite-coefficient cup naturality
  and the corestriction projection formula. Work at a cyclotomic level
  deep enough to trivialize the coefficient twist, corestrict to the
  desired level, then pass through the integral limit comparison and
  invert p. The same roots are used locally and globally. The formula
  asserts no untwisted isomorphism at a shallow level. Added dyadic
  inverse-character and conjugation-sign controls. These two local
  derivations address two review rows mathematically, subject to the
  next independent review; they do not alter the packet's gap count.
- Reduced Suggested.lean from 763 to 473 lines: 21 real-bodied light
  definitions, eight named algebraic milestones and 49 examples. Each
  definition has one or two representative examples; the remaining
  examples check coefficient, pairing, torsion and length conventions.
  Removed 32 routine helper theorems rather than developing their API in
  Lean. Every API remains in the README. `upperUnipotent` now uses native
  `Matrix.toLin'` instead of a linear-map structure with sorry'd proof
  fields. Heavy geometric/arithmetic carriers remain README targets.
- Preserved Mathlib's regular-scalar meaning of `Module.IsTorsionFree`,
  the full algebra at two, literal integral duals, all endpoint hypotheses,
  and the separation between geometric nonvanishing and the canonical map.
  Metadata remains the required single line `topic = "math.NT"`.

## Why completion needs work outside this job

The review report is `research/blueprint/reviews/REV-PKG-KatoEulerSystems.md`.
The following is the refreshed supplier audit, rather than an assertion that
an unproved Lean implementation blocks a correctly specified roadmap.
These exact statements are missing or have incompatible hypotheses.

| Required export / README consumers | Current supplier evidence and remaining work |
| --- | --- |
| Big-local reciprocity / 3.4, then 4–7 | `PadicHodgeRegulators--D.1.json` **does contain D.2 nodes**. Its rigid syntomic models assume perfect residue fields; its finite-local comparison and proper semistable exponential do not give Kato's non-perfect-residue-field Theorem 4.3.1, square 10.9.5 or the §11 modular comparison. Stage that precise generality, sign and normalization. Merely creating a D.2 filename does not solve this. |
| Early CM structure and length bound / 4.4, 5.1, 7.1–7.2 | No staged `CMAllPrimeMainConjectures` early owner was found. Supply elliptic-unit H² torsion and H¹ rank one before the Kato map, including p=2, ℚ(i), and Kato 15.14's contained-cyclotomic branch. Separately supply 15.13–15.17's local-length comparison and the needed one direction of 15.2. H² torsion alone gives no length inequality. |
| Nonsplit image branch / 4.1, 4.3–4.4, 7.2 | `AutomorphicGaloisRepresentations:R19.3/ribet-momose-classical-large-image` retains quaternion-valued openness. A division quaternion algebra has no nontrivial unipotent. Supply the alternative rational weak-Leopoldt/bound argument at division places; do not replace openness by split SL₂ at every place. |
| Open modular coefficient comparison / 1.5, 3.1 | The current `ModularCurvesPartII--R14.3.json` is broader than the review's weight-two description: it includes all-weight relative coefficients, parabolic cohomology, boundary sequences and finite-coefficient Artin comparison. Those are useful prerequisites. It still does not export the required open Y(M,N), two-index trace/affine-edge and all-weight log de Rham comparison identifying the critical filtration with the **full** M_k, including Eisenstein forms. |
| Full-level Borel–Moore moment / 2.5 | `CompletedCohomologyPartII:CC.6` includes homological hyperTor descent, untwisting and a classical-to-completed-invariants evaluation map. CC.7 supplies boundary/duality. None states Nakamura Lemma 2.10/§3.1.4's integral literal-dual Borel–Moore-to-classical moment with its coefficient, Hecke and conductor compatibilities. The named R31.2 owner must supply that map, not an integral self-duality isomorphism. |
| Modular Iwasawa complex / 4.3–4.4, 7.2 | `SelmerIwasawaCohomology:L3/iwasawa-cohomology` is a generic continuous complex with explicit finiteness/limit hypotheses. It does not identify the modular étale complex, strict H² kernel and local correction, or establish the all-prime rank-one/integral freeness passage. Supply the actual modular adapter. |
| Parabolic exponential injectivity / 3.5, 5.4 | Supply Nakamura Lemma 3.4, p.221, on X(N), j_*V_k, with full level, all weights/twists, conductor Iwasawa torsion-freeness and the inverse-limit loc/exp* injectivity. Neither local exp* nor the generic cohomology constructor implies this global statement. |
| Period dictionary / 3.2, 6.2 | `ModularSymbolsPadicLFunctions:L1` has period lines, integral period lattices and an RJW/B.1 comparison, but no complete identification with Kato's differential and Betti basis. Supply the character inversion, Gauss sum, conductor p-power, factorial, U_p and period normalization comparison. |
| De Rham and integral ordinary regulator / 6.1–6.3, 7.5 | `PadicHodgeRegulators:L3/crystalline-regulator` is crystalline. `L4/derham-regulator` is on a high-conductor ball m>m(Δ). Neither gives all of Kato 16.4's finite-character domain nor 17.5/17.8–17.10's exact ordinary integral image with the good lattice and singular Euler domains. |
| Dyadic regulator / 6.1–6.3, 7.4–7.5 | The inspected L3 regulator/growth/scalar/Coleman statements require odd p. The new twist derivation removes no such regulator hypothesis. Supply dyadic statements, or authorize a plan revision restricting the affected conclusions. The current package must preserve its accepted all-prime endpoints. |
| Integral elliptic control / 7.6–7.7 | Selmer L3/derived-control assumes actual derived local base change and retains its correction terms. L3/greenberg-structure-hypotheses lists genuine arithmetic conditions, not their elliptic verification. Supply formal-group norm freeness, bad-place local-torsion removal and the exact ordinary control factor, including the claimed dyadic applicability. |
| Critical arithmetic family / 6.3 only | The comparison remains expressly conditional. ModularSymbols L3/family-comparison-principle assumes the arithmetic section and its specialization/normalization. Construct them at an authorized owner, or revise the plan's endpoint. Do not introduce PadicFamilies as an upstream prerequisite: it consumes Kato and creates a cycle. Sections 7.1 and 7.5 already avoid this family assumption. |

The unchanged plan has fourteen recorded gaps and thirty-one requests.
Its additional two-index K₂ transfer, normalized Eisenstein/real regulator
and elliptic Serre requests also need exact supplier contracts. No request
is marked discharged merely because its subject appears in a supplier title.

KatoEulerSystems is outside the ninety-four-roadmap CaraianiNewton tier list.
No lower-tier status can be inferred for all its K-theory, Euler-system,
big-local and CM suppliers. The maintainer must schedule the actual suppliers
or authorize ownership moves and the corresponding plan changes. This job's
file restriction prevents implementing those repairs in their proper owners.

## Sources and library nonduplication

Read the binding protocols and package-review shape rules. Read the current
upstream AlgebraicVectorBundles and ArithmeticDirichletSeries READMEs in full
as form models, and inspected their suggested forms. The current roadmap
checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti
library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were read only.
Checked current roadmap/library ownership before adding the adapters;
AlgebraicVectorBundles' tensor/dual operations and ProfiniteCohomology
Layer 12's cup naturality/projection formula are imported, not replanned.

Read the Kato entries in `data/library-coverage.json`. Re-read the seventeen
baseline declarations in the accepted packet at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, plus `Module.Basis.constr`
and `Matrix.toLin'`. The pinned Tau Ceti is
`f790474821cf4256814db967cb154e7af3d0c369`. The current field Kummer
map/isomorphism/restriction/corestriction statements were read with their
field, invertibility and finite-extension hypotheses. The extra current
exports are not advertised as present at the older pin. No field Kummer
result is substituted for a scheme K₂ Chern map.

Public primary sources checked for the new arguments, accessed 2026-10-17:

- Kato 2004, [Numdam PDF](https://www.numdam.org/item/AST_2004__295__117_0.pdf),
  12.1, pp.219–220; 13.12 and display (13.12.5), pp.231–233. Page images
  were inspected at printed pp.219 and 231. SHA-256:
  `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.
- Stacks, [10.36.20 / 00GT](https://stacks.math.columbia.edu/tag/00GT),
  [10.39.19 / 00HS](https://stacks.math.columbia.edu/tag/00HS),
  [10.62.1 / 00L0](https://stacks.math.columbia.edu/tag/00L0), and
  [10.62.2 / 00L4](https://stacks.math.columbia.edu/tag/00L4): integral
  incomparability, flat going down and finite-module support via prime
  filtrations. Stacks has stable tags, not fixed printed pages.

All new repository prose is original mathematical description, not source
excerpts or a section-by-section digest. No private-library source was used.
The private library index was checked; no book or passage was copied.

## Validation and resumption

- `lean-check research/blueprint/packages/KatoEulerSystems/Suggested.lean`:
  **exit 0**, 57 warnings, all and only declarations using `sorry`.
  The shared build at the pins was used after checking available memory;
  no language server or library build was started.
- A separate scratch Lean file proves eleven adversarial controls without
  `sorry`, errors or warnings: the column unipotent, C₂ multiplication
  determinant, dyadic Fourier determinant, failure of integral sign
  projectors, nonunit two, C₂ zero divisors, regular-scalar product-ring
  torsion-freeness, inverse-character normalization, odd negative parity,
  injectivity versus nilpotence, and double-minus transport. This validates
  elementary controls, not the missing arithmetic supplier theorems.
- The unchanged Kato packet passes `scripts/check_blueprint.py` with zero
  errors and zero warnings: forty nodes, sixty API entries, forty-one tests,
  fourteen gaps and thirty-one requests.
- All forty numbered target headings and all sixty packet API names remain.
  README has no packet, checkpoint, review or job-id process tokens.
  `intake.py check-files` on the three package files and this handoff reports
  **four files, zero problems**. `git diff --check` is clean. Only the
  authorized README, Suggested.lean and this handoff differ; metadata and
  review.json are unchanged.

Resume with the supplier table above and the unchanged independent review.
First obtain authorized owner/plan integration for the early CM and big-local
inputs; do not spend another revision restating their desired conclusions as
hypotheses. Independently check the two new local derivations, then reconcile
the full remaining request list and dependency schedule before claiming
draft readiness. The previous session's draft PR #9497 remains separate and
unmerged; this run did not alter it or reuse its branch. No scratch artifact
is needed to continue from this handoff.

Submit this as a **draft checkpoint for maintainer handling**. The intake's
`issues.py:deliverables_complete` checks existence for package jobs, including
this handoff; it cannot distinguish this blocked revision from a complete one.
A ready PR would therefore risk automatic completion despite the explicit
blockers. No intake code or queue state is changed by this job.
