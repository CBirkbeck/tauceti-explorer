# PKG-LanglandsParameterStacks — regular tuple tests and blocked checkpoint

**The package remains incomplete.** Codex, session `codex-FDXs8m`, claimed
issue #7909 on 10 October 2026. The bot confirmed
[claim 6100501272](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6100501272)
in [reply 6100502387](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6100502387).
The issue was reread after confirmation. None of the manager's priority issues
was available; this focus package was the first eligible fallback under
WORKERS.md and the manager's allowed job kinds. No second job was taken.

Branch: `codex-FDXs8m-langlands-parameter-package`. Input atlas commit:
`a3279f24dc57c6b98c8594d730aea3d20385470d`.
[The preceding handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/a3279f24dc57c6b98c8594d730aea3d20385470d/research/blueprint/handoff/PKG-LanglandsParameterStacks.md)
records the coarse-quotient tests and earlier blocker inventory. This note
records this run's additions and enough information to resume without scratch.

## Completed in this checkpoint

Added regular-coordinate examples for three LP2c.1 tests. The new
`ParameterTupleChecks` fixture specializes the existing free-cocycle Hopf
coaction to Q=1. Its tuple algebras are actual conjugation equalizers;
reindexing and ordered fibre multiplication use explicit free-group words,
and evaluation uses the coproduct universal property. Its unique component
idempotent is the unit. The coordinate diagram is supplied concretely.

- `projected_rank_one` evaluates Laurent monomials against Γ→Aˣ over any
  commutative R-algebra A, using the existing Laurent-polynomial Hopf algebra
  and `LaurentPolynomial.eval₂`. Negative exponents are retained.
- `projected_conjugate` compares the entire tuple-evaluation families under
  simultaneous H(A)-conjugation. This is the Q=1 case; finite Q still needs
  the generic IHG coordinate interface.
- `projected_unipotent` uses the imported
  `TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2` and
  `TauCeti.SpecialLinear.pointsMulEquiv`. Over every ℚ-algebra field K, the
  integer k maps to U(k)=[[1,k],[0,1]]. For each integer tuple, the curve
  [[1,kᵢt²],[0,1]] uses the common conjugator diag(t,t⁻¹) off the origin.
  Signatures state that conjugacy and evaluation at both endpoints. Every
  regular invariant pulls back to a constant polynomial, so the complete
  tuple families agree with the trivial representation. The example also
  excludes a conjugator sending all U(k) to 1.

The new proofs are honest `sorry` suggestions, not implementations. The README
states their constructions and proof routes and compresses the existing
identity-component explanation while retaining its mathematical distinctions.
Its final size is 199,076 bytes. Only the package README, Suggested file and
this handoff change. No general IHG reconstruction, enhanced-category supplier
or quotient-stack owner was rebuilt. Metadata remains absent for a checkpoint.

## Sources and library inputs checked

Read Fargues–Scholze,
[Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
§VIII.3.1, Definition VIII.3.1, Proposition VIII.3.2 and proof, pp.285–287;
VIII.3.7–VIII.3.8, pp.288–290; and the §VIII.5.4 setup, Proposition VIII.5.20
and proof, pp.311–313. These check orbit specialization, tuple relations
and enhanced mapping approximations. Access date: 10 October 2026. SHA-256:
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

Read Böckle–Harris–Khare–Thorne,
[G-hat-local systems on smooth projective curves are potentially automorphic](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf),
Acta Mathematica 223 (2019), §3.1, Definitions 3.3 and 3.5, Theorem 3.4 and
Proposition 3.6, pp.11–13; §4, Definition 4.1, Remark 4.2, Lemmas 4.3–4.4
and Theorem 4.5, pp.19–20. The representation-to-invariant-evaluation
construction and conjugacy invariance justify the connected fixtures;
general reconstruction remains imported. Access date: 10 October 2026.
SHA-256: `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`.
No source file or passage is committed. The cleared-library index was read;
no restricted book was needed.

Read the current upstream AlgebraicVectorBundles and ReductiveGroups READMEs
in full and relevant Suggested declarations, and all eight LP audit records
in `data/library-coverage.json`. Upstream roadmap commit:
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti source:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A bounded name search across both
found none of `SymMonInftyCat`, `AnimatedAlg`, `DerivedParameterStack`,
`ParameterMappingApproximation`, `CocartesianFibration` or
`StableInftyCategory`. This is not exhaustive for every possible model.
Neither read-only checkout was changed or built.

At Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`, read `AlgHom.pi`,
`AlgHom.pi_comp`, `LaurentPolynomial.eval₂`, its constant and monomial laws,
and `Matrix.SpecialLinearGroup.map`. At Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, read the special-linear coordinate
Hopf quotient, coordinate map, `pointsMulEquiv`, and the general-linear
point/matrix construction it uses. Existing coordinate rings are imported.

## Confirmed blocker

The accepted LP packet has 79 nodes, 140 APIs, 90 tests, eight planned but
unclosed stages, five gaps and sixteen requests. Its review explicitly retains
enhanced-signature omissions. A planning pass does not fulfill the complete
package contract in PROTOCOL §§13 and 20.

Read the full LP1 derived-parameter-stack and LP3 mapping-approximation entries,
including hypotheses, prerequisites, APIs and tests. LP1 needs the mapping
stack over BQ, its framed fibre, H-quotient, classical comparison and perfect
pullback; W=1 must retain BH and its automorphisms. LP3 needs coherent linear
stable categories, animation/left Kan extension, comparison to actual Perf
and enhanced Ind-completion. The bad-prime test separates induced perfect
complexes from all perfect complexes. The packet assigns the general inputs
to E5:abstract, E5:animation, E5:presentability, SF.1 and S.1. Rebuilding those
owners here violates PROTOCOL §15 and the editable-file restriction.

Read the checked-in `EnhancedDerivedSheaves--E5.lean` carrier declarations:
the monoidal projection, cocartesian and Segal fields are `True`, `CAlg` and
`AnimatedAlg` are `Unit`, and `IndInfty` is a proof of `True`. E5 is partial,
with 22 nodes, ten gaps and sixteen requests. These carriers cannot express
the LP contracts.

The proposed supplier repair [PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
was still OPEN and unmerged when checked, at head
`b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`. Read its header and carrier
definitions. It explicitly omits cocartesian/operadic axioms, preservation,
accessibility, higher triangle homotopies and internal linearity. `HEquiv`
is a homotopy-category equivalence; `SymMonData.segal` uses that shadow and
the projection has no cocartesian-fibration condition. It does not supply
the LP interface. This was a dependency check, not a review of that job.

G1 reductive/highest-weight supplier registration, G4 finite-Q relatively
discrete characteristic-zero continuity and G6 field-GIT/external edge
reconciliation also remain unresolved. G2 is the explicitly unclaimed full
torsion-sensitive independence question. No gap is discharged here.

## Validation

- Final `lean-check`: exit 0, 317 warnings, all `declaration uses sorry`;
  no errors or other warnings. Available memory before launch: 102 GB.
  Every check finished; no background Lean remains.
- LP and E5 packet checkers: zero errors and zero warnings each; neither changed.
- `git diff --check` passed. Intake's file checker reports three files and
  zero problems; the actual job's allowed-path screen has no extra files.
  No private filesystem paths occur in the deliverables.
- README size: 199,076 bytes, below 200,000.
- Identifier-boundary screening finds 37 of 90 test names absent, down from
  40. This includes comments, so presence is not semantic coverage.
  `projected_conjugate` has its connected specialization only;
  `projected_trivial_group` remains only a component check.
- The actual queue `deliverables_complete` predicate returns false with
  metadata absent; do not mark this submission complete.

## Resume here

The 37 absent test names belong to thirteen nodes:

| Node | Absent tests |
| --- | --- |
| LP0/condensed-cocycles-and-L-parameters | parameter_char_l; parameter_not_discrete_Ql |
| LP0/extended-wild-parameters | extended_wild_unramified; extended_wild_conjugacy; extended_wild_forget |
| LP1/finite-presentation-over-Z-invert-p | scheme_l_adic |
| LP1/derived-parameter-stack | derived_stack_trivial_group; derived_stack_free_group; derived_stack_gauge |
| LP1/singularities-and-singular-support | singularities_smooth; singularities_torus_Ql; singularities_torus_mod_l; singularities_dual |
| LP2:excursion-presentation/complete-reducibility | cr_torus; cr_unipotent; cr_GL |
| LP2:semisimple-characters/semisimple-parameters-and-closed-orbits | semisimple_split_GL; semisimple_unipotent |
| LP2:excursion-presentation/categorical-hecke-datum | hecke_empty_set; hecke_fold; hecke_zero_category |
| LP2:excursion-presentation/excursion-datum | datum_zero_alpha; datum_tensor_operator |
| LP3/good-filtration-t-structure | good_torus; good_zero; good_induced; good_shift_sign |
| LP3/induced-perfect-complexes | induced_point; induced_trivial_group; induced_retract; induced_not_all_bad_prime |
| LP3/mapping-approximation | approx_point; approx_coproduct; approx_bad_prime |
| LP4/rep-action-on-perf | rep_bundle_unit; rep_bundle_at_parameter; rep_bundle_tensor |

An authorized shared-owner repair must provide coherent stable monoidal and
linear categories, animation, enhanced Ind/module-category base change and
quotient-stack QCoh/Perf descent. The defining conditions and comparison types
must themselves be expressible; `sorry` constructions and proofs are allowed.
The previous LP3.18 clarification still needs its plan/reader repair outside
this issue's scope. Then reconcile all 79 targets, 140 APIs and 90 tests
semantically against exported interfaces, complete the finite-Q tests, add
`topic = "math.NT"` metadata and rerun checks.

No notion moved to a different owner. The mathematics and continuation inventory
are committed; no disposable scratch file is needed to resume.
