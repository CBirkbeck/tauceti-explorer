# PKG-GlobalGaloisDeformations~2

Issue #9172. Claude (Opus 5.5), session `claude-MulJPV`, 14 October 2026.

**Status: complete, ready for the independent package review.** Revision round 2 of the package.
Changed only `research/blueprint/packages/GlobalGaloisDeformations/README.md`, `Suggested.lean`
and this handoff. `metadata.toml` is already exactly `topic = "math.NT"`. `review.json` is left in
place for the next reviewer. No packet was changed.

## What the revision does

1. **Shape.** Both deliverables are rewritten to PACKAGE_REVIEW.md, "Shape of a roadmap
   (2026-10-12)", which supersedes the previous review's blocking finding (77 of 91 API contracts
   not native Lean). That finding asked for universal rings, local problems, global types,
   Taylor–Wiles data and patching systems as Lean declarations; under the binding shape those
   carriers are not at the pins and are README targets. The old Suggested.lean also had sorry'd data
   (`Lift.map := sorry`, `Def.map`, `Lift.twist`, `liftDualNumbersEquiv`, `defDualNumbersEquiv`,
   `Def.restrict`, sorry'd proof fields of `Lift.conj` and the instances); all of that is gone.
2. **README** in the upstream form, modelled on the accepted ArithmeticGaloisDuality package (layer
   ids kept as headings, so the 76 consumer citations of `GlobalGaloisDeformations:<layer>/<anchor>`
   still resolve): `**Summary.**`, layer table, Scope and ownership, Conventions, Exact supplier
   contracts, How to read the build, eight layers of prose subsections with API lists,
   `*Proof sketch.*`, `*Needs:*`, `**Checks.**` and `*Lean:*` lines, per-layer Examples and
   Dependencies, Downstream consumers, References. No field-list catalogue scaffolding. 66 targets
   (67 − 2 imported + 1 added), 158 KB. All 91 plan API names and all 71 plan test names occur; every
   target has a page locator and `*Needs:*`; every target with an API list has at least three Checks;
   all internal links resolve; every old anchor survives (removed targets keep theirs on a boundary
   entry in *Scope and ownership*).
3. **Suggested.lean**, 588 lines, namespace `TauCetiRoadmap.GlobalGaloisDeformations`, `import
   Mathlib` plus `TauCeti.Topology.Algebra.Group.Generation`. Real-bodied light definitions only:
   `strictKernel`, `Lift`, `Lift.conj` (with its `MulAction`), `Def`, `Def.mk`, `LiftDet`,
   `liftDetSubMulAction`, `DefDet`, `IsSchur`, `Lift.map`, `Def.map` (descent proved),
   `Lift.restrict`, `PhiP`, `TFramedLift` (with its action), `TFramedLift.localLift`,
   `UnrestrictedTFramedDef`, `scalarFrameCokernel`, `Lift.twist`. Every proof field is proved. Five
   theorem signatures are `sorry`: `Def.mk_eq_mk_iff`, `strict_of_full`, `PhiP.«open»`,
   `phiP_of_fg`, `exists_unique_nthRoot_of_residue_eq_one`. The other theorems and all 32 examples
   are proved (regressions carried over from the old file: the `𝔽₃[ε]` strict conjugator, the
   integral `S₃` nonlocal counterexample and its `ℤ/25` repair, the `S₃` sign line over `𝔽₅`, the
   scalar-frame cokernel dimensions, the dyadic and numerology identities).

## Corrections of the previous review kept

The eight in-place corrections of REV-PKG-GlobalGaloisDeformations (nonzero character in
`moddef_needs_iota`; inversion action in both semidirect-product examples; the concrete `𝔽₃[ε]`
example for `defProblem_not_conj_stable` and `fixed_matrix_not_problem`; the dihedral regression
hypotheses; `twSystem_not_p2`; unramified-outside-`S` in `GlobalDeformationProblem.IsOfType`; the
unrestricted framed quotient kept distinct from `TFramedDef`; `PhiP.open`) are all retained.

## Duplications removed (cite instead) — for the re-review and for the plan's owner

Checked against the current TauCetiRoadmap checkout (main `0d144d0`), the open TauCetiRoadmap pull
requests whose README is authoritative (ArithmeticGaloisDuality #858 at `f5fe9b6`,
ArithmeticGaloisRepresentations #856 at `5d38094`), the bundle partner's accepted package and the
current Tau Ceti library (`a91d3aaf`).

| Plan node | Now owned by | Treatment here |
| --- | --- | --- |
| R04.1/tangent-spaces | ArithmeticGaloisDuality D8, *First-order Galois cocycle comparison* (+ trace-zero duality) | removed; anchor on a Scope entry; framed count used in 2.3, 2.6, R04.3 |
| R04.2/carayol-trace-theorem (conjugacy, centralizer, descent parts) | AGR §5.10 `GaloisRep.carayol_conj_of_trace_eq`; AGR §7.2 `GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`; IHG `coefficient_descent` | 2.7 keeps only trace generation of `R_ρ̄` (proof via those imports) |
| R04.2/determinant-comparison-isomorphism (surjectivity) | IHG `Determinant.exists_ofMatrix_eq_of_henselian` (the packet's `Theorems.henselian_irreducible` no longer exists under that name) | 2.8 cites it; it is stated on `A[G]`, its proof passes through `CH(D)` |
| R04.5/taylor-wiles-local-cohomology | AGD R02.6, *Local cohomology at a Taylor–Wiles prime* and *Odd-prime Taylor–Wiles auxiliary sets* | removed; anchor on a Scope entry |
| R04.5/odd-taylor-wiles-primes (KW branch), R04.5/taylor-wiles-generator-count (KW count) | AGD R02.6, *Odd-prime Taylor–Wiles auxiliary sets* | 5.7, 5.8 cite it and keep Gee's branch and count (checked against Gee arXiv v2, Proposition 5.10 and proof, pp. 38–39) |
| R04.5/dyadic-taylor-wiles-primes, properties (1)–(4), (6), (7) | AGD R02.6, *Dyadic auxiliary primes and the cyclotomic residual* | 5.4 cites them and proves the ring statements (5) and (8) |
| R04.6/kw-deformation-data, local tensor ring properties | LocalGaloisDeformationRings 8.17 | 6.1 cites them, keeps the global data |
| G7/polarized-deformation-problem, `GroupGn`, `polarizedLift_equiv_triple` | AGR §7.4 `CHTGroup` and its triple correspondence | named in 8.1 as AGR's, not redefined |
| R04.5/image-hypotheses predicates | AGR §4.6 `GaloisRep.IsBadDihedral` and cyclotomic criterion, §4.7 `GL2Subgroup.sl2_submodules_charTwo`, §7.10 `ResidualImage.IsEnormous` | 5.2 defines the three hypotheses through them |
| R04.2/phi-p-condition ingredients | Tau Ceti `IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`, `maximalProPQuotient` (pins); `topologicalGeneratorRankNat_le_of_openSubgroup`, `IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`, `finite_continuousZModDual` (current) | 2.1 keeps the predicate and the two assembled statements |
| KW Lemma 7.10 root existence (in 4.4) | AGD R02.6, *Finite-order determinant twists* | cited |

Renumbering inside R04.5: 5.3 dyadic disjointness, 5.4 dyadic sets and counts, 5.5 `Δ_Q`-structure,
5.6 shared selection, 5.7 odd primes, 5.8 generator counts. Anchors are unchanged.

## Added target

- **2.11 Continuous pseudodeformation rings** (anchor `pseudodeformation-rings`). The bundle
  partner's accepted package cites `GlobalGaloisDeformations:R04.2/pseudodeformation-rings` (its 3.8,
  block pseudodeformation rings), and both it and upstream IHG leave continuous pseudodeformation
  representability to this roadmap; the anchor did not exist. Stated from Chenevier arXiv:0809.0415v2,
  §3.1, Lemma 3.2, Proposition 3.3 and Remark 3.5, pp. 41–42, and Proposition 3.7, Example 3.6 and
  Lemma 3.8, p. 43 (read at those pages). It also serves GL2ModularityLifting R32.3's request to R04.2.

## Mathematical changes to reviewed nodes (please re-review)

2.7 reduced to trace generation; 2.8 proof sketch via IHG; 2.11 new; R04.5 restructured as above;
6.1 local properties cited; 8.1 triple correspondence cited; 1.9 locator corrected to Chenevier §3.1,
p. 41 (the old p. 42 citation of Proposition 3.3 is representability, now 2.11). New or rewritten
Checks (each verified by hand): `strict_of_full_not_schur`, `strict_of_full_nonlocal` (integral `S₃`
witness), `isSchur_absIrred`, `restrict_*`, `phiP_finite`, `phiP_GQS` (now `p` odd; `p = 2` gives
dimension two), `phiP_absolute_fails`, `phiP_local_rank`, `univLiftRing_*` (the `1 ⊕ 1` framed ring
over `ℤ_p` is a free power-series ring, no relation), `univDefRing_*`, `framed_*`, `traceGen_*`,
`detIso_*`, `nthRoot_*`, `changeRing_*`, `ideal_*`, `globalRing_*`, `relTangent_*`,
`presentation_*` (Artinian obstruction witness `k[t]/(t³) → k[t]/(t²)`), `dimBound_*` (explicit
count over `ℚ`), the R04.4 checks (`resRing_not_flat` reproved: lifts land in the pro-`p` group
`1 + 𝔪_A`), `chebyshev_R4` (Chebyshev compositions commute, so no "not in general" claim), `y_relation`,
`dyadic_*`, `count_KW_vs_gee` (difference `2` = archimedean relative dimension), G8/G7 checks
(`polarized_centralizer_trivial` via `(c,1)j(c,1)⁻¹ = (c²,1)j`).

## Adversarial pass (summary)

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| `strict_of_full` (Lean) | `n = 0`; non-Schur `1 ⊕ 1`; nonlocal `ℤ → 𝔽₅`; local `ℤ/25` | hypotheses locality, `ker π = 𝔪`, surjectivity, Schur all needed and present |
| `PhiP`, `phiP_of_fg`, `PhiP.open` | `p = 0, 1` (homs to `ℤ` with open kernel from profinite are trivial); `(∏ℤ/p) ⋊ ℤ/2`; `∏ℤ/p` | true for all `p`; definition quantifies over open subgroups |
| `exists_unique_nthRoot_of_residue_eq_one` | `ℤ/p²`; `p ∣ n` (excluded, cube-root check in char 3); `n = 0` (excluded by `¬ p ∣ 0`) | filtration argument valid with infinite residue field |
| 3.6 dimension formula | rank one, `T` empty / one / two frames | `|T| − 1` only for nonempty `T`; examples pin `k²/diag k` |
| 3.8 / 6.5 counts | `F = ℚ`, `S = {p, ∞}`; dyadic `S = {2, ∞}`; negative `t` | integer identities; nonnegativity proved before indexing |
| 5.4 (5), (8) | substitution of (4), (7), `h⁰(G_F, Ad) = 1` | identity in `ℤ` |
| 5.8 Gee count | `F = ℚ`, `T = {p}` | `r ≥ 1` so count `≥ 0`; differs from KW by `2` |
| 8.2 frame count | `n = 2`, `|T| = 1` | `4` variables (trivial polarized centralizer, odd `p`); `p = 2` excluded |
| 8.6 | `ζ_p ∈ F` | excluded (scalar summand has `H⁰`) |

## Notes on the plan and suppliers (packet unchanged; for the orchestrator)

- The packet's R04.1/tangent-spaces, R04.5/taylor-wiles-local-cohomology and parts of
  R04.5/odd-taylor-wiles-primes, R04.5/dyadic-taylor-wiles-primes, R04.2/carayol-trace-theorem and
  R04.6/kw-deformation-data duplicate lower-tier or bundle suppliers (table above); the packet should
  be pointed at them.
- AGD R02.6 *Dyadic auxiliary primes* lists the Kummer disjointness of KW Proposition 5.6 as a
  hypothesis while its proof sketch says it proves it. This package keeps 5.3 (the disjointness) as
  the target discharging that hypothesis; if AGD's final README proves it, 5.3 becomes a citation.
- AGD R02.6 *The group-theoretic input to Taylor–Wiles primes* is stated over `ℚ` only; Gee's branch
  (5.7) needs the analogous vanishing over a totally real `F` unramified at `p ≥ 5` with
  `SL₂(𝔽_p) ⊆ ρ̄(G_F)`, which Gee proves inside Proposition 5.10 (p. 39); 5.7's proof sketch carries
  it.
- Bundle partner anomaly: in `packages/LocalGaloisDeformationRings/README.md` the heading "8.17" is
  preceded by `<a id="t8-3"></a>` (a duplicate of 8.3's anchor) while 8.18 cites `#t8-17`; for its
  next revision.
- Open requests addressed to this roadmap by other packets, not covered by this package (they would
  extend the plan): AutomorphicCongruences L5b (R04.6 minimal modular lift, Fujiwara 6.11);
  AutomorphicGaloisRepresentations (R04.3 ring `R_Σ` with flat/ordinary/semistable condition);
  AutomorphyLiftingBeyondTaylorWiles (R04.5 rank-`n` primes under bigness, CG18 Prop. 8.5);
  CrystallineLocalGlobalCompatibilityCM (R04.5 AKT Appendix A without enormous image);
  GL2ModularityLifting R32.3 (Pan's comparisons at reducible points, R04.3/R04.4 items; the
  representability part is now 2.11); OrdinaryAutomorphicFormsAndModularityLifting (R04.3 Mazur's
  unframed presentation `g′ = h¹(ad⁰)`, `r′ ≤ h²(ad⁰)`; R04.5 Skinner–Wiles Prop. 6.10 over
  `k[[λ]]`); PadicFamilies (R04.3 `H¹_g` refined deformations); PotentialAutomorphyInfrastructure
  (G7/G8 items, already planned in substance); PotentialAutomorphyInfrastructurePartII (G7 extensions:
  NT23 Lemma 2.26, rank-one polarized ordinary finiteness, square-zero modules);
  PotentialModularityAndCompatibleSystems R23.1 (R04.6 restriction finiteness after soluble CM
  extension, BG19 Prop. 4.2.6); WeightZeroCrystallineAutomorphyLifting (G7 Part II adequate-image
  primes). Most come from higher tiers and fit a Part II.
- No higher-tier citation and no FoundationsAndLibraryIntegration or `UPSTREAM:` id remains; all
  suppliers are Mathlib, Tau Ceti, Tau Ceti roadmaps, lower tiers (DeformationAndDerivedPatchingAlgebra
  t10, ArithmeticGaloisDuality and SelmerIwasawaCohomology t8, ArithmeticGaloisRepresentations t7,
  IntegralHeckeAndGaloisDeterminants t3) or the bundle partner.

## Validation

- `lean-check research/blueprint/packages/GlobalGaloisDeformations/Suggested.lean` at the pinned
  build (Mathlib `082e2d37e8`, Tau Ceti `f790474`): exit 0, no errors, 5 warnings, all
  `declaration uses 'sorry'` (the five theorems listed above), no other warnings. Memory was checked
  first; no language server or build was started.
- `python3 scripts/check_sorry_data.py` on the file: no offenders. 588 lines.
- `python3 scripts/check_blueprint.py research/blueprint/packets/GlobalGaloisDeformations.json`:
  0 errors, 0 warnings (packet unchanged).
- `python3 research/blueprint/intake.py check-files` on the three changed files: 0 problems.
- No source passage is quoted; locators were kept from the accepted plan except where corrected above,
  and the new or restructured statements were checked at Gee arXiv:2202.05818v2 pp. 37–39 and
  Chenevier arXiv:0809.0415v2 pp. 34, 41–43.

## Where the next step resumes

Independent package review (REV-PKG-GlobalGaloisDeformations~2). Points worth its attention: the
import table above (each import should be confirmed at the cited supplier heads), target 2.11, and
the R04.5 split between this roadmap and ArithmeticGaloisDuality R02.6.
