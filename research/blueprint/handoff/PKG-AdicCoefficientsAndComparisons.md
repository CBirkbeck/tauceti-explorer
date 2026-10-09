# PKG-AdicCoefficientsAndComparisons — handoff

Job: roadmap package of `AdicCoefficientsAndComparisons` (issue #7454), by Claude (Opus 5.5),
session claude-UvCss8. Status: complete, submitted for the independent package review.

## Deliverables

- `research/blueprint/packages/AdicCoefficientsAndComparisons/README.md` (135,930 bytes).
  It has a purpose section, scope and ownership (owned, consumed, consumers and boundaries,
  outside), conventions, starting points in Mathlib and Tau Ceti, and the construction order.
  It then gives the seven layers L0–L6 with all 46 targets of the accepted plan. Each target has
  its statement with hypotheses, a proof route where useful, its API and tests, a source locator,
  its prerequisites and the suggested Lean names. Then come the required examples, the corrections
  to the sources (nine items), the policy of the suggested file, and the references. Target labels
  are the plan's ids (`L2/compactification`, …), so consumers' citations resolve. All 80 API items
  and 57 tests appear under their plan names.
- `research/blueprint/packages/AdicCoefficientsAndComparisons/Suggested.lean` (4,549 lines). Every
  definition, construction, API item, unit test and theorem of the plan has a declaration under its
  plan name; tests are `example`s introduced by a "Test `Name`" comment.
- `research/blueprint/packages/AdicCoefficientsAndComparisons/metadata.toml`: `topic = "math.AG"`.

## Checks run

- `lean-check research/blueprint/packages/AdicCoefficientsAndComparisons/Suggested.lean` (shared
  build, Mathlib `082e2d37e8`): exit 0, **0 errors, 419 warnings, all "declaration uses `sorry`"**,
  no other warnings.
  - The file imports individual Mathlib modules and one Tau Ceti module,
    `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic`.
  - The shared build's Tau Ceti checkout is newer than the pin, but that file's source is identical
    at `f790474` and at the build's head.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Coverage scripts (in scratch): every node id has a target in the README with its exact packet
  prerequisites, and every API and test name occurs in the README and in the Lean file. A
  process-word scan of the README is clean, and the README is under 200 KB.
- Two independent read-only review passes before submission.
  - README against the plan and ECD §§26–27: 0 high, 8 medium and 10 low findings. 17 were applied.
    One was declined: the reviewer read the BP cofilteredness remark as unsupported, but the plan
    records it as a confirmed source issue (its E3), so §7 item 7 stays.
  - Lean file against the plan: 3 high, 4 medium and 8 low findings, all applied except two lows
    that are documented instead.
    - The high findings were a continuity theorem missing its limit and compatibility hypotheses,
      a coefficient-change statement quantified over arbitrary functors, and a vacuous refinement
      test. All three are fixed.
    - The comparison theorems of 27.4 and 27.5 now assert that named canonical exchange maps are
      isomorphisms. The right-adjoint statements are the conjugates of those maps.

## Relation to the accepted plan

- The packet is the source of truth. The reader document
  `research/blueprint/readmes/AdicCoefficientsAndComparisons.md` predates the last revision of the
  packet: it has 78 API items and 56 tests, and lacks `L0/adic-forms-of-introduction-theorems` and
  several API items (`SchemeDiamond.charP_baseChangeField`, `SchemeDiamond.overDVR_representable`,
  test `SchemeDiamond.notDiamond`). The package follows the packet.
- No packet was changed. Plan points worth a later revision of the plan:
  1. `AdicSpacesPartII` cites `AdicCoefficientsAndComparisons:L5/de-jong-6-5-strictly-semistable-alteration`.
     That id no longer exists: the alteration theorems moved to `SchemeAndStackFoundations:SF.4`.
     The citation should point to SF.4, or to `L5/alteration-hypercover-descent` if the descent is
     what is meant.
  2. Mathlib at the pin has native étale cohomology once the small étale site gets the
    `IsGrothendieckAbelian` instance that Mathlib itself gives the pro-étale site in
    `ElladicCohomology`. The suggested file adds it, and states `L2/etale-cohomology-continuity`
    with `CategoryTheory.Sheaf.H`. The plan's baseline list does not mention this, nor Mathlib's
    `AlgebraicGeometry.Scheme.ellAdicSheaf`, the native pro-étale `ℤ_ℓ`, which the README names as
    the object the completed constant lattice of `L1/scheme-adic-category` must agree with.
  3. Mathlib also has `Proj` with properness over the degree-zero part, `SheafOfModules.IsLocallyFree`
     and `Scheme.IdealSheafData`. The suggested file uses them for the `ℙ¹` test,
     `L2/vector-bundle-extension-cofinal` and `L2/cartier-boundary-cofinal`, which the plan had
     left as unstatable.

## Notes for the reviewer and the maintainer

- **Stand-ins.** Objects owned by other roadmaps are opaque data in the suggested file. Each
  docstring names the owning target. The objects are small v-stacks and v-sheaves, perfectoid
  spaces, diamonds, adic spaces and the diamond functor, marked untilts, `D(Y_v, Λ)`, the discrete
  `D_ét` with its operations, the pro-étale and étale derived categories of schemes, constructible
  complexes, eligibility and smoothness data, analytification, alteration hypercovers and
  semistable models.
- **Predicates.** Predicates on stand-ins are defined from data: an essential image, `Nonempty` of
  a witness type, or `IsIso` of a unit. There is no `Prop`-valued placeholder and no axiom.
- **Homotopy categories only.** The stand-ins are homotopy categories. Enhanced statements (the
  limit of categories in 26.2, the coherence of operations) go through stand-ins for the enhanced
  constructions. README §8 lists what the signatures leave out.
- **Documented low items** of the Lean review, not changed:
  - the adic Theorem 1.10 states invertibility of `Rf^!Λ̂`, not its v-local form `Λ̂[d]`;
  - `AdicSix.reduce` asserts some identification rather than naming the canonical one;
  - the associativity coherence of `SchemeSupport.compose` is a target the file does not state.
- **Source corrections.** README §7 restates the plan's nine source issues in prose (ECD Theorem
  1.8(iii), the mixed-characteristic functor, the proofs of 27.5–27.7, and BP §2.1.1 and Lemmas
  2.1.5–2.1.6). It adds nothing new.
