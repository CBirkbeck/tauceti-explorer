# PKG-LanglandsParameterStacks — coarse-quotient tests and blocked checkpoint

**The package remains incomplete.** Codex, session `codex-5vD9m3`, claimed
issue #7909 on 10 October 2026. The bot confirmed
[claim 6100359582](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6100359582)
in [reply 6100360936](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6100360936).
The issue was reread after confirmation. None of the manager's priority issues
was in the open `swarm`, `state:available` list; this focus package was the
first eligible fallback under WORKERS.md. No second job was taken.

Branch: `codex-5vD9m3-langlands-parameter-package`. Input atlas commit:
`b08c0316b240ad9362b21e91e58d465522154720`.
[The preceding handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/b08c0316b240ad9362b21e91e58d465522154720/research/blueprint/handoff/PKG-LanglandsParameterStacks.md)
records the LP3.18 scope correction and the earlier blocker inventory. This
note reports this run's own work and provides the remaining test inventory.

## Completed in this checkpoint

Added two missing LP2e.1 coarse-quotient tests to the package Suggested file,
with their mathematical construction and proof route in the README:

- `coarse_not_orbit_set`: the coordinate algebra is
  ℚ[a,b,c,d]/(ad−bc−1), not a ring of arbitrary point functions. Its conjugation
  coaction is explicitly pulled back from the product of the two universal
  matrices and the adjugate of the first. Evaluation at the upper unipotent
  U and at 1 agrees on the entire coaction equalizer, although U and 1 are
  not conjugate. The statement applies over every ℚ-algebra field K.
  The polynomial curve with upper-right entry t² records its two endpoints
  and its conjugacy to U away from zero through diag(t,t⁻¹). Separate
  characteristic equations identify the coordinate evaluation and the
  conjugation evaluation.
- `coarse_torus`: the actual free-cocycle coaction for G_m and trivial Γ-action
  equals the insertion into the parameter tensor factor. This uses the
  existing Laurent-polynomial Hopf algebra and the package's free-coordinate
  diagram, and also states that the affine quotient map is an isomorphism.
  It tests the group-scheme action, including coefficient algebras.

The new statements elaborate with honest `sorry` proofs. They do not certify
an implementation. No general quotient-stack, enhanced category, or reductive
supplier was rebuilt. Only the package README, Suggested file and this handoff
change. Metadata remains absent so intake treats this as a checkpoint.

## Source and baseline readings

Read Fargues–Scholze,
[Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
§VIII.3.1 with Definition VIII.3.1 and Proposition VIII.3.2 and its proof,
pp.285–287, for the coarse quotient and one-parameter orbit specialization.
Also read the §VIII.5.4 setup, Proposition VIII.5.20 and its proof,
pp.311–313, to check the enhanced mapping-approximation requirement.
Access date: 10 October 2026. SHA-256:
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
No source file or source passage is committed. The cleared-library index was
read; no restricted book was needed.

Read the current upstream AlgebraicVectorBundles and ReductiveGroups READMEs
in full and relevant Suggested declarations. Read all eight LP audit records
in `data/library-coverage.json`. The read-only upstream roadmap checkout is
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; the current Tau Ceti source is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A bounded name search across both
found none of `SymMonInftyCat`, `AnimatedAlg`, `IndInfty`,
`DerivedParameterStack`, `ParameterMappingApproximation`,
`CocartesianFibration` or `StableInftyCategory`. This is not an exhaustive
search for every possible model. Neither checkout was changed or built.

At the managed build's exact Mathlib pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`, read the definitions and statements
of `Ideal.Quotient.mkₐ`, `Ideal.Quotient.liftₐ`, `MvPolynomial.aeval`,
`Matrix.SpecialLinearGroup`, `LaurentPolynomial` and
`LaurentPolynomial.instHopfAlgebra`, including its antipode formula. These
supply the new concrete tests. Also read `SSet.Quasicategory` and
`CategoryTheory.Ind`/`Ind.equivalence`: inner-horn filling and the ordinary
set-valued-presheaf Ind-category are substrates, not the missing enhanced
linear category interfaces. The driver uses the configured Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`.

## Confirmed blocker

The accepted LP packet has 79 nodes, 140 API items, 90 tests, eight planned
but unclosed stages, five gaps and sixteen requests. Its accepted review
explicitly retains the enhanced-signature omissions. A complete target-level
planning pass is not a complete package under PROTOCOL §§13 and 20.

Read the entire LP1 derived-parameter-stack and LP3 mapping-approximation
entries, with their hypotheses, prerequisites, APIs and tests. The former
requires the derived mapping stack over BQ, its framed fibre, the H-quotient,
classical comparison and perfect pullback; its trivial-group case must retain
BH and its automorphisms. The latter requires coherent linear stable
categories, animation/left Kan extension, comparison to actual mapping-stack
Perf and enhanced Ind-completion. Its bad-prime test distinguishes induced
perfect complexes from all perfect complexes. The supplier requests assign
these general constructions to E5:abstract, E5:animation, E5:presentability,
SF.1 and S.1. LP instantiates them. Rebuilding these owners in this package
would violate PROTOCOL §15 and the issue's editable-file restriction.

Read the complete checked-in `EnhancedDerivedSheaves--E5.lean`: its monoidal
projection, cocartesian and Segal fields are `True`, its `CAlg` and
`AnimatedAlg` are `Unit`, and its `IndInfty` is a proof of `True`.
The E5 packet remains partial, with 22 nodes, ten gaps and sixteen requests.
Those carriers cannot express the LP contracts above.

The proposed supplier repair [PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
remains OPEN and unmerged at head
`b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`. Read the proposed file's header
and carrier definitions at that immutable head. It explicitly omits
cocartesian/operadic axioms, preservation conditions, accessibility, higher
triangle homotopies and internal linearity. Its `HEquiv` is an equivalence
of homotopy categories; `SymMonData.segal` uses that shadow, and its projection
has no cocartesian-fibration condition. It does not supply the required LP
interface. This was a dependency check, not a review of that job.

G1, G4 and G6 supplier/edge requirements in the preceding handoff and packet
also remain unresolved. G2 is the explicitly unclaimed full torsion-sensitive
independence question. This checkpoint does not discharge any of those gaps.

## Validation

- Final `lean-check` on the package Suggested file: exit 0, 298 warnings,
  all `declaration uses sorry`; no errors or other warnings. Available memory
  before launch: 100 GB. Every check finished; no background Lean remains.
- LP and E5 packet checkers: zero errors and zero warnings each. Their files
  were not changed.
- `git diff --check` and the permitted-deliverable-path screen passed.
- Whole-file identifier-boundary screening finds 40 of the 90 packet test
  names absent, down from 42. The screen includes comments; presence alone
  does not certify a mathematically matching example.
- The actual queue `deliverables_complete` predicate returns False because
  the package metadata is absent. Do not mark this submission complete.

## Resume here

The 40 absent test names belong to these fourteen nodes:

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
| LP2:semisimple-characters/reductive-pseudocharacters | projected_rank_one; projected_conjugate; projected_unipotent |
| LP3/good-filtration-t-structure | good_torus; good_zero; good_induced; good_shift_sign |
| LP3/induced-perfect-complexes | induced_point; induced_trivial_group; induced_retract; induced_not_all_bad_prime |
| LP3/mapping-approximation | approx_point; approx_coproduct; approx_bad_prime |
| LP4/rep-action-on-perf | rep_bundle_unit; rep_bundle_at_parameter; rep_bundle_tensor |

An authorized shared-owner repair must supply coherent stable monoidal and
linear categories, animation, enhanced Ind/module-category base change and
quotient-stack QCoh/Perf descent. The defining conditions and comparison types
must themselves be expressible; `sorry` constructions and proofs are allowed.
The LP3.18 clarification from the preceding run still needs its plan/reader
repair outside this issue's scope. After those repairs, reconcile all 79
targets, 140 APIs and 90 tests semantically against the exported interfaces,
complete the package, add `topic = "math.NT"` metadata and rerun checks.

No notion moved to a different owner. No disposable scratch file is needed
to resume; all new mathematics and the continuation inventory are committed.
