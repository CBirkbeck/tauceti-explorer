# RT-AUDIT-05: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4000, job FIX-RT-AUDIT-05).
- **Findings and verdicts.** `RT-AUDIT-05.result.json` and `RT-AUDIT-05.review.json`. The red team made 40 findings. The review confirmed all 40 and rejected none.
- **Scope.** This job covers the 12 confirmed findings of high or medium severity: /1, /2, /13, /14, /15, /24, /25, /26, /28, /34, /35, /36. The 28 confirmed low-severity findings (/3–/12, /16–/23, /27, /29–/33, /37–/40) are outside the fix job (PROTOCOL.md section 17).
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-05.result.json`; no other file changes. The audit's `review` object is unchanged. Layer verdicts and library values change only where a confirmed finding, as qualified by the review, says so:
  - ContourIntegration Layers 1 and 2 go from `built` to `partly built`.
  - ConformalMapping L5 goes from `partly built` to `built`.
  - Library values change on eight targets, listed under each finding below.
  - One target is added to QuadraticFormInvariants 6A.

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name.
- The index records `TauCeti.realCliffordZeroTwoEquivQuaternion` at line 698 (the `def` line); the finding's :699 is the line holding its type.
- Every target has at most five declarations. Where a finding adds more, the displaced citations are named in the note with file and line.

## RT-AUDIT-05/1 (medium, library-claim): fullCycleType is Mathlib's partition (PolynomialGaloisGroups Layer 0, summary)

**Target "fullCycleType with its full API…".**
- **Library value.** `tauceti` → `both`.
- **Citations added.** `Equiv.Perm.partition` (Mathlib/GroupTheory/Perm/Cycle/Type.lean:571, exact) and `Equiv.Perm.partition_eq_of_isConj` (:592, more general, a complete conjugacy invariant).
- **Citations kept.** `fullCycleType`, `fullCycleType_permCongr` and `count_one_fullCycleType`, which are Tau Ceti's own transport and count API.
- **Displaced into the note.** `sum_fullCycleType` (Partition.lean:286) and `fullCycleType_eq_cycleType_iff` (:325). The finding's third Mathlib declaration, `Equiv.Perm.parts_partition` (Type.lean:581), is named in the note as the defining equation, to stay within five.
- **Note.** It now says that `fullCycleType` is a named wrapper of `(Equiv.Perm.partition σ).parts` and that Mathlib has the sum and the iff form of conjugacy invariance. Following the review, it also says that Mathlib does not supply the rest of the requested API: Tau Ceti adds the permCongr transport, inverse invariance, edge cases, the fixed-point count and the cycleType comparison.

**Summary.** `Equiv.Perm.partition` is added to the Mathlib contributions the roadmap does not credit, with the same division of labour.

## RT-AUDIT-05/2 (medium, library-claim): the monic lift exists (PolynomialGaloisGroups Layer 9, Milestone 4)

- **Library value.** `absent` → `partial`.
- **Citations added.**
  - `Polynomial.lifts_and_natDegree_eq_and_monic` (Mathlib/Algebra/Polynomial/Lifts.lean:189, more general).
  - `Polynomial.mem_lifts_of_surjective` (:88, related).
  - `ZMod.prodEquivPi` (Mathlib/Data/ZMod/QuotientRing.lean:78, related).
  - `ZMod.chineseRemainder` is kept.
- **Note.** It replaces "nothing lifts it coefficientwise". Following the review, the remaining obligation is the coefficientwise assembly over ZMod 30 of a monic polynomial of the common prescribed degree n from the reductions at 2, 3 and 5, together with the compatibility of those reductions with the lift. The note says this is not yet a compiled application.
- **Layer verdict.** Unchanged (`not built`). The finding does not ask for a change, and this layer already had a `partial` target under that verdict before this job.

## RT-AUDIT-05/13 (high, library-claim): the binary quaternion lemma is composable (QuadraticFormInvariants Layers 3 and 5, summary)

**Layer 3 target "The binary quaternion lemma…".**
- **Library value.** `absent` → `partial`. The review chose `partial` over the finding's `mathlib`, because the named wrapper is still missing.
- **Citations added.**
  - `CliffordAlgebraQuaternion.equiv` (Mathlib/LinearAlgebra/CliffordAlgebra/Equivs.lean:318, more general).
  - `CliffordAlgebra.equivOfIsometry` (Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:382, more general).
  - `CliffordAlgebraQuaternion.Q` (Equivs.lean:233, related).
  - `TauCeti.realCliffordZeroTwoEquivQuaternion` (TauCeti/LinearAlgebra/CliffordAlgebra/RealForm.lean:698, special case), the in-library precedent.
- **Citations kept and displaced.** `QuaternionAlgebra.equivalent_normForm_weightedSumSquares` is kept. `TauCeti.equivalent_binary_iff` (TauCeti/LinearAlgebra/QuadraticForm/Binary.lean:233) moves into the note to stay within five.
- **Note.** It is replaced by the composition ℍ[K,a,b] ≃ Cl(⟨a,b⟩) ≃ Cl(⟨c,d⟩) ≃ ℍ[K,c,d], with the coordinate transport along `LinearEquiv.finTwoArrow`, and it names the precedent's isometry (RealForm.lean:684). Two points follow the review:
  - The note says the Mathlib declarations need no unit or invertible-2 hypothesis, while the roadmap keeps its own field and unit conventions.
  - The note claims no compilation. The review did not adopt the red team's reported Lean check, and this job compiled nothing.

**Layer 5.** Rank-two support is added as `related`, and the note says that neither the invariant nor the property is assembled:
- **"The quaternion symbol [(a,b)] in Br(K)…".** Cites `CliffordAlgebraQuaternion.equiv`. The note links the bullet on invariance under binary equivalence to this lemma. Mathlib's `BrauerGroup` (Mathlib/Algebra/BrauerGroup/Defs.lean:99) moves into the note to stay within five.
- **"The Clifford invariant…".** Cites `CliffordAlgebraQuaternion.equiv` as the rank-two case of the Lam V.3.20 comparison. `CliffordAlgebra` (Basic.lean:74) moves into the note.

**Summary.** A sentence says that Layer 3's binary quaternion lemma is not absent: it composes from Mathlib and lacks only a named wrapper.

**Not done.** The finding's optional remark that Layer 2's four-fold criterion direction (4)⇒(1) reduces to built pieces is not added. The review warns against implying that the four-fold criterion has been assembled.

## RT-AUDIT-05/14 (medium, missing): the square-class dictionary (QuadraticFormInvariants 6A, 7A)

**6A.**
- **New target.** "The square-class dictionary Subgroup.square Kˣ = (powMonoidHom 2).range, consumed", with library `tauceti` and citation `TauCeti.square_eq_powMonoidHom_two_range` (TauCeti/Algebra/Group/PowMonoidHom.lean:111, exact).
- **Position.** It is placed before the local-square-theorem target, following the README's 6A order.
- **Note.** It says that the lemma is stated for every CommGroup, and that the Tau Ceti name differs from the contract name `square_eq_range_powMonoidHom`. It also names `TauCeti.powerSubgroup` (PowerClassGroup.lean:34) and `TauCeti.kummerClassMap` (Kummer.lean:279).
- **Layer verdict.** Stays `partly built`.

**7A target "The μ₂ coefficient identification…".**
- **Citation added.** The same lemma, as related.
- **Note.** The sentence "not specialized or connected to SquareClassGroup" is replaced. The new text says that the lemma connects the domain of `kummerClassMap K 2` with `MultiplicativeSquareClassGroup` at the level of subgroups. Following the review, it adds that a subgroup equality is not the cohomological isomorphism: specializing still needs `IsUnit (2 : K)`, the μ₂ ≃ ZMod 2 identification and Hilbert-90 surjectivity, and `h2MuToUnits` is still missing.
- **Library value.** Stays `absent`.

## RT-AUDIT-05/15 (medium, library-claim): finite index is not proved (QuadraticFormInvariants 6A)

**Target "The local square theorem…"** (stays `partial`).
- **Note, first change.** "with openness and finite index of the power subgroup" becomes "openness and closedness of the power subgroup (`isOpen_range_powMonoidHom_of_isUnit`, `isClosed_range_powMonoidHom_of_isUnit`), and openness of any subgroup whose index is a unit of 𝒪[K] (`isOpen_of_isUnit_index`)". The note says that the last result runs from index to openness.
- **Note, second change.** The Missing list gains the finiteness of Kˣ/(Kˣ)². Following the review, it is restricted to the roadmap's characteristic-not-two local-field regimes. The note records why Mathlib's `Subgroup.finiteIndex_range_powMonoidHom_of_fg` (Mathlib/GroupTheory/FiniteAbelian/Basic.lean:204) does not settle it: it needs finite generation.

## RT-AUDIT-05/24 (high, library-claim): Props 2.2 and 2.3 only off the basepoint (ContourIntegration Layer 1)

- **Library values.** Targets "HW Prop 2.2 (winding decomposition)…" and "HW Prop 2.3…": `tauceti` → `partial`.
- **Notes.** Each adds the missing basepoint case γ a = γ b = z₀. That case needs a cyclic re-basing lemma, or a form of the statement that counts the join crossing once. The note records that `basepointAngle` (TauCeti/Analysis/Contour/RegularityConditions.lean:121) exists but is used only by ConditionB. In the Prop 2.2 note, the phrase "a WLOG normalisation for a closed curve" is removed.
- **Fits.** `isBounded_image_realWindingIntegrand_of_interior_crossings` (OnCurve.lean:444) and `intervalIntegrable_realWindingIntegrand_of_interior_crossings` (:456) go from `more general` to `related`. The note explains that h_interior excludes a crossing at either endpoint.
- **Main theorem.** Following the review, the note also says that `windingNumber_eq_real_integral_of_closed_interior_crossings` weakens the regularity hypothesis but adds the basepoint restriction. So it is ordered against the proposition in neither direction, and it stays `related`.
- **Layer verdict.** `built` → `partly built`. The proved restricted results stay cited.

## RT-AUDIT-05/25 (medium, library-claim): the piecewise-C¹ arc FTC (ContourIntegration Layer 2)

- **Library value.** Target "FTC along an arc…": `tauceti` → `partial`.
- **Citation added.** `MeasureTheory.integral_eq_of_hasDerivAt_off_countable` (Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean:406, related).
- **Citation displaced.** `intervalIntegral.integral_eq_sub_of_hasDerivAt` (FundThmCalculus.lean:1148) moves into the note, to stay within five.
- **Note.** It adds the missing FTC for a general primitive along a piecewise-C¹ curve with corners. It names the route through `TauCeti.Contour.IsPiecewiseC1On.exists_countable_differentiableAt` (PiecewiseC1On.lean:220). As the review requires, the stated form keeps continuity of G ∘ γ and interval integrability of the integrand, and the note says these must be kept or proved, not dropped.
- **Layer verdict.** `built` → `partly built`.

## RT-AUDIT-05/26 (medium, other): the ContourIntegration summary

- **Opening.** "Everything … is built" becomes "Nearly everything … is built". A sentence names the two partly built layers.
- **Built list.** "HW Props 2.2 and 2.3" now reads "HW Props 2.2 and 2.3 off the basepoint".
- **Closing sentence.** It is split into two lists:
  - Missing within scope: the cyclic re-basing lemma, needed for Layer 1 as stated because the basepoint restriction is pinned only for HW Thm 3.3; and the piecewise-C¹ FTC for a general primitive.
  - Missing and outside the pinned scope: HW Thm 3.3 for accumulation-free sets and essential singularities, cycle-level Props 2.2/2.3, and the signed-curvature API.
- **Not verified.** The file and declaration counts ("123 files, about 1150 declarations") are the audit's original figures and are kept unchanged. As the review notes, neither the review nor this job re-verified them.

## RT-AUDIT-05/28 (medium, library-claim): the Chebyshev basis is not a B2 output (OrthogonalL2Bases B2, Part C)

**B2 target "Element-level export coe_*".**
- **Note.** It now names the coe lemmas that are specializations of the bridge. These are the Hermite ones, `coe_hermiteHilbertBasis` and `coeFn_gaussianHermiteHilbertBasis`, and the envelope basis's `coeFn_chebyshevTEnvelopeHilbertBasis` (Chebyshev/Envelope.lean:175).
- **Chebyshev milestone.** The note says that `coe_chebyshevTHilbertBasis` comes from `HilbertBasis.coe_mkOfOrthogonalEqBot` instead.
- I checked in the source that the two Hermite lemmas are derived from the bridge's coe lemmas.

**Part C milestone target.**
- **Citations added.** `TauCeti.chebyshevTHilbertBasis_mapₗᵢ` (Chebyshev/WeightIsometry.lean:126, related) and `TauCeti.chebyshevWeightL2Isometry` (:69, related).
- **Citation displaced.** `normalizedChebyshevTLp` (Chebyshev/Measure.lean:262) moves into the note.
- **Note.** It records the deviation from the roadmap's route. The basis is `mkOfOrthogonalEqBot` of directly proved orthonormality and B1-based completeness, while B2 is exercised by `chebyshevTEnvelopeHilbertBasis` (Envelope.lean:161). The two bases are identified through the weight isometry.
- **Library value and verdict.** Both stay (`tauceti`, `built`), as the finding and the review say: this is a difference of assembly route, not a missing theorem.

## RT-AUDIT-05/34 (high, library-claim): L5's closure homeomorphism is built (ConformalMapping L5, L6, summary)

**L5 target "The boundary correspondence…".**
- **Library value.** `partial` → `tauceti`.
- **Citations added.** `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` (Jordan/Approach.lean:213, exact) and `TauCeti.injOn_closedBall_of_isJordanCurve_frontier` (:198, exact).
- **Citations kept.** `image_frontier_eq_frontier_image`, `closureHomeomorph` and `bijOn_closure_closure_image`.
- **Citations displaced into the note.** `injOn_closure_of_injOn_frontier` (ClusterSet.lean:208) and `not_eqOn_const_inter_sphere_of_injOn` (ArcConstancy.lean:271).
- **Note.** Rewritten as the finding asks. It explains why boundary injectivity needs no boundary hypothesis and names the inverse-cluster step `injOn_closedBall_of_isPreconnected_image_approach` (Inverse/BoundaryCluster.lean:229). It also says that the "What is not claimed" paragraph of Caratheodory.lean predates Approach.lean.

**L5 verdict.** `partly built` → `built`. The prime-ends target stays `absent`, with its out-of-scope remark.

**L6 note.** "which is itself only conditional" is replaced. The note now says that L5's correspondence is available for Jordan domains, and that the global injectivity of the Schwarz–Christoffel map and the identification of its image remain open. This keeps the separate L6 problem, as the review asks.

**Summary.** The L5 clause now says that L5 is complete for Jordan domains, with prime ends out of scope, and that L6 is what remains unfinished. Following the review, nothing implies that the other partial targets (L6, and L2 under /36) are resolved.

## RT-AUDIT-05/35 (medium, library-claim): the Mathlib RMT lemmas are module-private (ConformalMapping L3, summary)

- **L3 target "The Riemann mapping theorem…".**
  - **Citations.** Both Mathlib citations stay at `related`.
  - **Note.** It adds that both lemmas are module-private at 082e2d3: the file has no public section, and its docstring says the lemmas are private. They are therefore prior art, not consumable API, and Tau Ceti re-derives the step in DiscInjection.lean.
  - **Evidence used.** The module text only. As in the review, no elaboration result is claimed.
- **Summary.** `Complex.exists_injective_not_dense_image_deriv_ne_zero` is removed from the list of what Mathlib supplies. The summary now says that RiemannMapping.lean holds two module-private partial RMT steps that no importer can name.

## RT-AUDIT-05/36 (medium, library-claim): no derivative-form rigidity (ConformalMapping L2)

- **Library value.** Target "The derivative form of Schwarz–Pick, and the rigidity/equality case": `tauceti` → `partial`.
- **Note: what is proved.** The inequality, its attainment by the standard automorphisms, and two-point rigidity.
- **Note: what is missing.** The arbitrary-point derivative equality case. Mathlib has only the centre case, `Complex.affine_of_mapsTo_ball_of_norm_dslope_eq_div` (Mathlib/Analysis/Complex/Schwarz.lean:291), which is named in the note because the target already has five citations.
- **Note: the RMT dependency.** The claim is corrected: the RMT maximizer uses `TauCeti.norm_deriv_lt_one_of_not_injOn` (Conformal/Schwarz.lean:89), not this rigidity.
- **Layer verdict.** Stays `built`.
  - The review corrects the finding here: a `partial` in-scope target would force `partly built`. To keep `built`, the arbitrary-point request has to be explicitly separated from the stage contract.
  - The L2 stage text in `data/atlas.json` asks only for Schwarz–Pick, the Poincaré metric and Aut(𝔻). The note therefore says that this rigidity goes beyond the L2 stage text and does not hold the verdict back. This follows the same pattern as the out-of-scope prime-ends target of L5.
- **Fits.** The two two-point rigidity theorems keep their fits, since the finding does not ask to change them.

## Maintainer notes

- **PolynomialGaloisGroups Layer 9 verdict.** It stays `not built` although it now has two `partial` targets. The strict convention would make it `partly built`, but this layer already mixed `partial` with `not built` before this job, and no confirmed finding asks for a change.
- **Low findings.** The 28 confirmed low findings remain open. /12, /23, /39 and /40 touch summaries edited here, so a later pass should reconcile them with the text as it now stands.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-05.result.json`: `1 file(s), 0 problem(s)`.
- All 14 declarations added resolve in the pinned `declarations.tsv` at the cited library, full name, file and line, and every citation in the file resolves. Eight citations were displaced into notes, each named with its file and line.
- Every target has at most five declarations, and the `review` object is byte-identical.
- Every text substitution was asserted to match exactly once. The file is re-dumped with indent 1 and `ensure_ascii=False`; the unedited file round-trips byte for byte.
- No Lean file is involved, so nothing was compiled.
