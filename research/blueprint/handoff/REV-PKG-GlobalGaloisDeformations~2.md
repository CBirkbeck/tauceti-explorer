# REV-PKG-GlobalGaloisDeformations~2

Refs #9216. Codex, session `codex-TPVLTj`, 2026-10-14.

**Complete. Verdict: accepted after in-place corrections.** The package is ready for the
maintainer's draft TauCetiRoadmap PR under the binding October 12 shape. The packet and the
previous review report were not edited. No second job was claimed.

## Deliverables and validation

- Updated package README and Suggested.lean, and replaced review.json with
  `independent-review-REV-PKG-GlobalGaloisDeformations~2`, status `accepted`.
- Full review report: `research/blueprint/reviews/REV-PKG-GlobalGaloisDeformations~2.md`.
  It records all 66 target checks, the reproducible random sample of 15 source targets,
  current supplier boundaries and ten Lean signature comparisons.
- Suggested.lean: 632 lines, all data definitions and proof fields have real bodies,
  32 proved examples. Final `lean-check`: exit 0, zero errors and exactly five warnings,
  all `declaration uses sorry`. The admitted proofs are `Def.mk_eq_mk_iff`,
  `strict_of_full`, `PhiP.open`, `phiP_of_fg`, and
  `exists_unique_nthRoot_of_residue_eq_one`.
- Packet checker: zero errors and warnings; sorry-data checker: no offenders;
  intake file checker: zero problems; internal links, all 91 plan API names and
  71 plan test names, exact metadata, JSON and whitespace checks pass.

## Corrections to carry upstream

The report gives the precise witnesses. The main corrections are:

1. Forgetting residual identification does not identify distinct rank-one characters;
   restriction of strict classes is already well defined, while a local frame supplies
   a matrix-valued lift. Corrected the forgetful ring-map direction.
2. A non-Schur representation need not have a nonrepresentable functor. Added the actual
   H4 failure for trivial rank two on ℤ_p. The trivial group's functor is represented by 𝒪.
3. Trace generation uses finite cotangent space and complete Nakayama (Gee Exercise 3.8,
   p. 13); the finite restriction fibre uses integral traces of a finite group image.
4. Formal quotient dimensions use the group's relative dimension. Truncated inverse
   systems have a common compatible Noetherian source. A rank-two fixed-determinant
   fibre is preserved by T[2], independently of the deeper torsion giving action chunks.
5. The induced strict self-twist counterexample is dyadic, with its quadratic character
   factoring through the permitted twisting group.
6. Characteristic-zero points miss nilpotents; k itself is not a counterexample to
   factorization. Rank-one character-ring examples now require unrestricted local data.
   The explicit global torsion example is ℚ, p=3, S={3,7}, not an inference from local
   roots of unity or class-group torsion alone.
7. The polarized obstruction statement requires chosen local lifts across the small
   extension, exactly as CHT Lemma 2.2.11. Liftability outside T is required for the
   relation bound. Added a failed-local-lift Check.
8. The continuous pseudodeformation ring's finite quotient system explicitly requires
   continuous universal determinants. Its reducible comparison example uses a transverse
   extension direction, not a scalar-rescaled extension.

Three new proved Lean witnesses pin the mapping-fibre minus sign over 𝔽₃, a nonzero
square-zero element, and strictness of diag(1,−1) modulo two versus four.

## Current ownership receipts

TauCetiRoadmap main: `0d144d044dacebca17b654695b6f1ad58f159b27`.
Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Open upstream supplier heads read: AGR #856 `e95c677e32e7748dfe5f6368ceadb941645a43b7`,
AGD #858 `7dce743a33f51ea80d463a0ec7c3da8b75f9a7e3`,
Selmer #869 `c883651676be47d63fcb8d13195fd7d245df00b9`.

No whole target was newly removed. Existing deferrals of tangent comparisons, trace
conjugacy/centralizers, henselian reconstruction, local TW cohomology, KW prime sets,
local tensor properties, CHTGroup and residual-image notions remain in place.

Newly recorded library boundary: ordinary diagonalizable groups' unit-valued character
functor already belongs to `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic`,
`TauCeti.DiagonalizableGroup.pointEquiv` and `pointsMulEquiv`. Target 4.5 keeps only its
formal identity completion (principal units) and truncation comparison. This is a
partial component deferral, not a new duplicate construction.

Local Φ_p for arbitrary residue characteristic uses ClassFieldTheory Layer 5 `finite_H`;
LocalGaloisGroups Layer 3 supplies its ℚ_p case only. The current bundle partner's
8.17 anchor resolves, so the previous revision handoff's duplicate-anchor warning is obsolete.

## Maintainer reconciliation and next step

The packet still reflects the pre-package ownership split: the revision handoff's list
of two removed targets and partial deferrals should be preserved when the orchestrator
updates the packet. Continuous pseudodeformation rings (2.11) remain the added target
serving the bundle partner; IHG explicitly does not own continuous representability.

AGD's dyadic auxiliary-prime statement takes the Kummer disjointness hypothesis, while
its proof sketch also mentions proving it. This package's 5.3 discharges that hypothesis.
When reconciling upstream PRs, choose its single owner; do not delete 5.3 merely because
of a proof-sketch phrase. D8's general Selmer comparison does not supply H² duality from
local tangent subspaces alone; keep this package's actual complexes and source-specific
duality hypotheses.

The previous review's demand for heavy native Lean carriers is superseded by the binding
October 12 shape. Do not restore sorry-bodied data to satisfy that old inventory. All
heavy definitions, complete statements, APIs and Checks remain in the README and the
closing comment names their definition families.

Resume with the maintainer's draft upstream PR and its independent gate. No worker
implementation or further job is pending from this run. No scratch artifact is needed.
