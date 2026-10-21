# Handoff: PKG-ArithmeticQuantumTopology~2

Issue [#10757](https://github.com/CBirkbeck/tauceti-explorer/issues/10757), revision round 2 of the
ArithmeticQuantumTopology package. Agent: Claude (Opus 5.5), session `claude-z5uQ0F`, 2026-10-21.
**Complete revision**, not a checkpoint. Files changed: the package `README.md` and `Suggested.lean`
and this note. `metadata.toml` (`topic = "math.GT"`), `review.json`, the packet and every other
package were left unchanged.

The previous round's draft checkpoint PR #11042 (Codex, `codex-BfwF5f`) was never merged. This
round starts from the merged package on main. It used that PR only as a list of leads and verified
each point independently. This revision covers what #11042 attempted, so #11042 can be closed.

## What this round changed

The review REV-PKG-ArithmeticQuantumTopology left three defects, R1–R3, all outside the package.
Since that review, every atlas supplier except QSeriesPartitionsAndMockModularForms has become an
accepted package (all accepted 2026-10-19/20). HabiroCyclotomicCompletions and PolylogarithmFunctions
are TauCetiRoadmap PRs #1314 and #1320. The README now cites each supplier by its package section
and declaration names, not by the old plan ids (HB.x, V.x, P.x, QM.x), which no longer appear.

**R1, ideal geometry and the tetrahedron volume: closed.** Polylogarithms §2.4 now supplies the
missing geometry: `upperHalfHyperbolicModel` (identified with GeometricTopology Layer 7's bundled
metric, with its completeness, curvature −1 and ideal boundary ℙ¹(ℂ)), the SL₂(ℂ) action,
`idealRegion` with `idealRegion_finiteVolume` and `signedIdealVolume`, `lobachevsky`, and
`idealTetrahedron_volume`. Polylogarithms does not depend on this roadmap, so there is no cycle.

The README states the convention conversion as a target. The shape of the ordered tetrahedron
(v₀,v₁,v₂,v₃) here (Neumann's) equals Polylogarithms' r(v₁,v₀,v₂,v₃): the two conventions exchange
the first two vertices. §5.1 gains the API items `shape_eq_polylogCrossRatio` and
`volume_eq_blochWigner`, and the Check `shape_convention_witness` at (0,∞,1,i). The scope, the
supplier contracts and §§5.1, 5.3, 5.10–5.13 now cite §2.4 in place of the "missing supplier"
wording.

**R2, full finite étale Habiro descent: closed at this roadmap's level.** HabiroNahmSeries §6.4
now states `nondegenerateNahm_habiroMembership` over the full B = R[T]/(δT²−1), split components
included, on orders prime to Δ. That theorem's proof carries the module extension to B and the
effective descent of HabiroNumberFields §3.10 (`indexedLine_effectiveDescent`) as explicit
obligations. §6.8 was rewritten to consume that theorem with every comparison it lists:
- §5.6 there: `gaussianGlobalNormalisation`, `gaussianMixedRegularity`,
  `formalGaussian_identification`;
- §6.1 there: `fullCoefficientDivisibilityTransfer`;
- §6.4 there: `nahmConstant_kummerOrientation`;
- §6.5 there: `unpoweredProduct_integralGluing`;
- HabiroNumberFields §§3.10 and 3.16.

The identification with the normalised geometric NZ series stays a separate target here. §6.8
gains three Checks: the split-δ case, the (−3)^(−1/4) root extension, and excluded orders.

**R3, supplier packages and ordering: closed except for Q-series, which is removed as a supplier.**
Every remaining supplier is an accepted package that does not cite this roadmap; the supplier
section now says so. The Q-series citations were removed:
- **QM.0** (q-Pochhammer symbols, Bernoulli numbers, infinite products) is replaced by:
  - HabiroCyclotomicCompletions §1.1, which now owns elementary q-calculus;
  - Mathlib `bernoulli` and `Polynomial.bernoulli`;
  - Mathlib `tprod` with `Complex.multipliable_one_add_of_summable`, for the analytic product
    (x;q)_∞ in the Faddeev product formula (§6.10) and in §7.1.
- **QM.5** is not needed. The knot statements of Layer 7 are written out explicitly, and the
  denominator and matrix cocycle identities (§§7.7, 7.13) are proved directly. The scalar quantum
  modular forms are now described as given downstream by Q-series.

**Other corrections found this round:**
1. HabiroCyclotomicCompletions owns no formal q-exponential pentagon. The ownership claim in the
   scope and in §6.12 was false and is removed; §6.12 now says only that it is an operator
   identity.
2. HabiroCyclotomicCompletions forbids its consumers to describe evaluation uniqueness by "a set
   with a limit point". The supplier contract and §4.5 now use the adjacency of §4.1 and the
   selected-root uniqueness of §4.4, with the 6, 15, 35, 77, … non-example and an adjacency Check.
3. **Duplicate removed:** `LocalDistribution`. Mathlib at the pin already has `TestFunction`
   (𝓓(Ω,F) with its LF topology) and `Distribution` (𝓓′), with `Distribution.delta`. §6.16 now uses
   them. The new targets there are `testToSchwartz` (𝓓 → 𝓢, absent from Mathlib) and
   `restrictTempered`. The Lean closing comment was updated to match.
4. §7.1's s(α) is now identified as the Dedekind sum of HabiroNahmSeries §2.2. I read [BD] (1.4)
   and Theorem 1, p. 2: BD's form, with first factor n/c, has the same value.
5. §6.4 now imports the algebraic dictionary N = I − B⁻¹A from HabiroNahmSeries §7.4. It keeps here
   the parity condition, the Hessian–discriminant comparison and the Bloch class.
6. §5.6 records that over ℂ the three Bloch kernels coincide: ⋀²ℂˣ is torsion-free and ℂˣ is
   2-divisible.
7. "Downstream consumers" listed HabiroCyclotomicCompletions, HabiroNahmSeries, K3BlochGroups and
   Polylogarithms as consumers, but all four are suppliers. Only QSeriesPartitionsAndMockModularForms
   consumes this roadmap (its QM.5 uses QT.3–QT.4).
8. Mentions of HabiroRings layers for Wheeler's invariant (not a supplier) no longer carry layer
   ids. The References block, which had run all its entries into one paragraph, is a list again.
9. Suggested.lean:
   - Removed the q=2 trefoil arithmetic example and the bare matrix non-commutativity example.
     Both were plain calculations on library objects, which the 2026-10-19 rule forbids; their
     Checks stay in the README.
   - Added a proved example that pins the conjugation order of `knotMatrixCocycle`
     (J(T·0)⁻¹J(0) = A, not A⁻¹).

## Cross-package issues for the maintainer (outside this job's files)

1. **Q-series cycle.** QSeriesPartitionsAndMockModularForms QM.5 (the Lawrence–Zagier
   Poincaré-sphere nodes) cites ArithmeticQuantumTopology QT.3 and QT.4. Two of this roadmap's
   suppliers, HabiroNahmSeries and HabiroNumberFields, cite Q-series QM.0–QM.1. So at roadmap level
   the chain runs AQ → HabiroNahmSeries/HabiroNumberFields → Q-series → AQ. This package no longer
   cites Q-series, which removes its own half. The rest belongs to Q-series's revision (#11524):
   split its Poincaré-sphere WRT nodes off into a later roadmap or Part II, or move its QM.0–QM.1
   exports down. Q-series is still not packaged.
2. **Split quadratic extension in HabiroNumberFields.** HabiroNahmSeries §6.4 (and its supplier
   contracts and downstream note) consumes "the scalar extension of H_(R,ξ) to B ... including the
   split determinant case" from HabiroNumberFields Layer 3. HabiroNumberFields has field pullback
   with scalar equivalence (§3.16) and the norms (§3.18), but no explicit statement for
   B = R[T]/(δT²−1) when δ is a square, where B ≅ R×R. It is a componentwise step:
   H_(B,ξ|B) = H_(R,ξ) × H_(R,ξ) in the split case, and §3.16 with E = K(√δ) otherwise. It should be
   stated as a target there, or in HabiroNahmSeries §6.4.
3. **Polylogarithms §2.4 orientation sign.** Polylogarithms defines `signedIdealVolume` as
   sign(Im r) times the volume, so (∞,0,1,z) with Im z>0 gets +D(z). With the orientation
   dx∧dy∧dh that same section fixes, the ordered tuple (∞,0,1,z) is negatively oriented, as a
   chord-determinant check suggests. (0,∞,1,z) is positive, which is Neumann's convention used
   here. This is internally consistent as a definition, but that roadmap's owner should confirm the
   intended sign. This package uses only the unsigned volume and the explicit vertex exchange, so
   it is unaffected.
4. PolylogarithmFunctions' downstream note says the volume interpretation is this roadmap's own;
   it is now Polylogarithms §2.4's. HabiroNahmSeries' downstream section names HabiroNumberFields
   and K3BlochGroups as its consumers, though both are its suppliers. Both are wording issues in
   those packages.

## Checks run

- `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean` (pinned Mathlib
  082e2d3, Tau Ceti f790474; 82 GB memory available): **exit 0, exactly 19 warnings, all
  "declaration uses `sorry`", no errors.** The new `knotMatrixCocycle` example is proved by `simp`.
  The file has 632 lines, with no sorry'd data definitions.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  0 errors, 0 warnings (packet unchanged).
- `python3 research/blueprint/intake.py check-files` on the three package files and this note: 0
  problems.
- A Sonnet subagent cross-checked every supplier section number and supplier declaration name cited
  in the README against the six supplier package READMEs. All 300 section/layer citations and 95
  supplier identifiers resolve to the cited sections. Three *Needs* lines in which a section of this
  roadmap followed a supplier citation were reordered so that they cannot be misread.

## Sources read

- The six supplier packages on main (2026-10-21): HabiroCyclotomicCompletions,
  HabiroNahmSeries, HabiroNumberFields, K3BlochGroups, PolylogarithmFunctions, Polylogarithms; and
  the QSeriesPartitionsAndMockModularForms packet, for its AQ prerequisites.
- Pinned Mathlib: `Analysis/Distribution/{Distribution,TestFunction,TemperedDistribution}.lean`,
  `Analysis/SpecialFunctions/Log/Summable.lean`, `NumberTheory/Bernoulli*.lean`. Pinned and current
  Tau Ceti for the cited knot-theory and hyperbolic declarations. Current TauCetiRoadmap 0d144d0 for
  the upstream supplier layer numbers.
- [BD] arXiv:1905.02045v2, pp. 1–2, (1.4) and Theorem 1 (read 2026-10-21).

No suspicious instructions were found in the issue thread or in PR #11042, which was read as data.
