# Handoff: BP-PadicDifferentialEquationsAndRigidCohomology--RD.6

Job: issue #9748, blueprint of the RD.6 follow-up (trace formula, Fourier transform and p-adic weights).
Worker: Claude (session claude-oL1sdf), 14 October 2026. Status of the packet: `complete`; RD.6 coverage `planned`.

## Deliverables

- `research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.6.json`: 27 nodes (12 theorems,
  10 lemmas, 3 constructions, 2 definitions), 33 API items, 22 unit tests, 6 planets, 13 pinned Mathlib
  declarations, 8 gaps, 4 requests, 1 new source issue. `scripts/check_blueprint.py` with the pinned
  declaration index: 0 errors, 0 warnings.
- `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.6.md`: the document for this part
  (about 18,000 words), generated from the packet so the two agree, with framing prose, conventions,
  dependencies, the wiring into the first part, inputs still to be supplied, planets and acceptance tests.
- `research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.6.lean`: compiled with
  `lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474): exit 0, the only warnings are the 20
  `declaration uses sorry` warnings. It contains the statable subset (Dwork character, Kummer trace function,
  Kloosterman sums with the Weil and Deligne bounds, rational descent, the Dwork multiplier identity, weight
  normalisation, the linear-algebra core of middle purity); overconvergent F-isocrystals, rigid cohomology,
  Robba rings, the Weyl algebra and Tannakian categories have no carriers at the pins and stay document targets.

## What is closed

The parent packet (accepted, 67 RD.6 nodes) left these RD.6 items as gaps; each now has nodes (the packet's
`parentGapResolutions` lists them with the parent node each one serves):

- p-adic GOS: `RD.1/christol-mebkhout-local-index` (Christol–Mebkhout Astérisque 279, Théorèmes 14.11 and 14.13:
  generalized index on the annulus equals Irr; index on the Robba ring is 0),
  `RD.6/christol-mebkhout-global-euler-characteristic` (Théorème 1.2), `RD.6/highest-break-equals-ramification-break`
  (Kedlaya overview 5.4.10–5.4.11), `RD.6/irregularity-equals-swan`.
- Tsuzuki's rank-one theorem: `constant-f-line`, `rank-one-isoclinic-twist`,
  `unit-root-isocrystals-and-p-adic-representations`, `katz-lang-geometric-finiteness`,
  `rank-one-finite-geometric-monodromy` (Crew 1992 Corollary 1.5 for curves; Abe arXiv:1111.2479 Lemma 6.1 in
  general), `rank-one-purity-via-curves`.
- Tannakian input: `neutral-tannakian-recognition` (Deligne–Milne 2.11, 2.20), `coefficient-category-is-neutral-tannakian`.
- Finite-field arithmetic and conventions: `dwork-additive-character`, `kummer-isocrystal`,
  `dwork-kummer-sign-dictionary`, `closed-points-and-zeta-function`, `rational-descent-of-power-series`.
- Kloosterman (rigid part of Fresán–Sabbah–Yu §3.2.2): `middle-cohomology-is-pure`, `kloosterman-f-isocrystal`,
  `kloosterman-local-monodromy-and-purity`, `symmetric-power-kloosterman-middle-cohomology`.
- Parent proof steps: `fourier-frobenius-extension` and `fourier-comparison-is-frobenius-equivariant` (Remark 4.2.3),
  `weight-normalising-constant-line`, `local-monodromy-weight-purity` (Crew 1998 Theorem 10.8, Deligne Weil II 1.8.4),
  `nonnegative-slopes-constant-coefficients-on-curves`, `nuclear-trace-on-complexes` (van der Put (1.5)).
- Étesse–Le Stum is no longer an input: the parent's Kedlaya–van der Put chain plus the nuclear-trace node proves
  the trace formula with coefficients.

Important correction found while planning: over the Robba ring a solvable module with Frobenius structure has
index 0 (Christol–Mebkhout 14.13; Kedlaya's Proposition 4.4.5 relies on H^0_loc = H^1_loc = 0); the
irregularity appears as a generalized index on the annulus (14.11) and in the global formula, not as the
Robba-ring index.

## Wiring the assembly must do (the parent packet was not edited)

- Add `RD.6/christol-mebkhout-global-euler-characteristic` and `RD.6/irregularity-equals-swan` to the prerequisites of
  parent `RD.6/grothendieck-ogg-shafarevich-formula`.
- Add `RD.6/rank-one-finite-geometric-monodromy` and `RD.6/rank-one-purity-via-curves` to parent `RD.6/rank-one-isocrystals-are-pure`.
- Add `RD.6/neutral-tannakian-recognition` and `RD.6/coefficient-category-is-neutral-tannakian` to parent `RD.6/global-monodromy-group`.
- Replace "RD.6 local finite-field zeta arithmetic (a recorded gap)" in parent `RD.6/l-function-of-overconvergent-f-isocrystal`,
  `RD.6/lefschetz-trace-formula`, `RD.6/l-function-rationality` by `RD.6/closed-points-and-zeta-function` and
  `RD.6/rational-descent-of-power-series`; replace the local additive-character gaps in parent `RD.6/dwork-isocrystal`
  by `RD.6/dwork-additive-character`.
- Add `RD.6/fourier-comparison-is-frobenius-equivariant` to parent `RD.6/fourier-transform-rank-and-irreducibility`,
  `RD.6/local-monodromy-weight-purity` to parent `RD.6/local-invariants-strongly-mixed`,
  `RD.6/nonnegative-slopes-constant-coefficients-on-curves` to parent `RD.6/nonnegative-slopes-of-h1c-on-curves`,
  `RD.6/nuclear-trace-on-complexes` to parent `RD.6/trace-formula-without-rational-points`.
- Planets: RD.6 now has twelve (six from each part). The packet's `restructure` proposes four sub-layers
  (RD.6:trace-formula, RD.6:coefficients, RD.6:fourier-and-conductors, RD.6:weights) with at most five planets each.

## Red-team findings

- **RT-AREA-padic-2/34**: planned (see above). The local Christol–Mebkhout theorems are an RD.1-parented node in this
  packet (`RD.1/christol-mebkhout-local-index`, `realises` empty), because the RD.1 follow-up job (#9743) was not handed
  the finding; the global formula sits at RD.6 because it needs rigid cohomology and finiteness (RD.4, RD.5).
  Edge ArithmeticGaloisRepresentations:R01.3 → RD.6 proposed; R01.3 already covers equal-characteristic local fields
  (R01.3/breaks-and-swan-conductor, /swan-from-breaks, /artin-schreier-*), so no extension is requested.
- **RT-AREA-etale/9**: every weight notion is imported from DeligneWeightsAndPurity DWP.0; RD.6 defines only pointwise
  purity of isocrystals (parent node). Restructure proposes the edge DWP.0 → RD.6 and RD.6 in the DWP.0 owner's
  'formerly' list (the DWP.0 packet's own restructure already implements its side).
- RT-AREA-padic-2/32 (Grosse-Klönne comparison) was handed to the RD.4 job (#9746); this packet only proposes the export
  edge RD.6 → AutomorphicGaloisRepresentationsPartII:AG2.4 for weights.

## Moves down and new edges (for the order file and the owners)

- Neutral Tannakian recognition moves down from MotivesAndAlgebraicCycles:MC.6 (outside the cited roadmaps) to RD.6.
- Katz–Crew–Tsuzuki unit-root correspondence for curves and Katz–Lang finiteness are planned here (no lower-tier owner);
  their natural lower home is InverseGaloisAndArithmeticFundamentalGroups IG.1 (gap 2 says so).
- New stage edges proposed: IG.1 → RD.6, ClassicalArithmeticCompletion:CA.6 → RD.6, LefschetzPencilsAndVanishingCycles:LPV.1 → RD.6,
  AdicSpacesPartII:R3 → RD.6, DWP.0 → RD.6, R01.3 → RD.6, RD.6 → AG2.4. All go from lower to higher tier.

## What remains (precisely)

1. Christol–Mebkhout IV, Corollaire 5.0-12: the global deduction of the Euler–Poincaré formula (not freely available;
   Poineau–Pulita V Theorem 3.5.2 is a possible public route).
2. Geometric class field theory for curves over F_q behind Katz–Lang (Jacobian isogenies, Lang's theorem).
3. Higher-dimensional inputs of Abe's Lemma 6.1 (alterations, Shiho's log extension, Berthelot 2.1.11); not needed by the
   Weil II argument, which uses rank one only on curves.
4. Kloosterman F-isocrystal: overconvergence on all of G_m and fibrewise base change of the relative rigid cohomology
   (Sperber, Berthelot via Crew 1994 §1.5).
5. Intrinsic rigid purity of Kl_{n+1} (the sources go through Deligne's ℓ-adic theorem, owned by FiniteFieldsAndCharacterSums FF.2,
   which RD may not cite).
6. Verification of Kedlaya's Remark 4.2.3 extension of ρ to F and of the Frobenius-equivariance of the Fourier comparison.
7. Nuclear trace theory on LF spaces from LocallyAnalyticDistributions L4 (request kept).
8. The localized Fourier transform description of tensor powers of Kl_{n+1} used by Fresán–Sabbah–Yu (3.13).
9. The D_st/D_crys comparison and dimension formula of Fresán–Sabbah–Yu §5.1.5 are RD.7 targets, not RD.6.

## Requests made

LocallyAnalyticDistributions:L4 (LF nuclear traces), InverseGaloisAndArithmeticFundamentalGroups:IG.1 (π_1 of curves over F_q,
inertia, Frobenius elements), Tau Ceti ReductiveGroups Layer 1 (comodules), Tau Ceti JacobianChallenge Layer F (Jacobians).

## Source issue

`PadicDifferentialEquationsAndRigidCohomology/E-RD6-1`: Xu–Zhu §2.1.5 (ii) pairs ∇ = d − a dx/x with the multiplier
t^{(q−1)a}, horizontal only in the module-to-pullback direction, the same direction issue as the parent's E68 for the
Dwork part. The parent's E69 corrects the p-for-q misprint correctly but states the logarithmic derivative with the
wrong sign; its reviewer may want to amend E69's reason.

## Sources read (public; hashes in the packet)

Kedlaya Weil II (arXiv math/0210149v3) §§4.2–4.4, 6.1, 6.4, 6.7; Kedlaya, Notes on isocrystals (arXiv 1606.01321v6) §§3, 8–9;
Kedlaya, local monodromy overview (math/0501361v2) §§4.7, 5.4; Kedlaya, Swan conductors I (math/0611835v3) §3.5;
Christol–Mebkhout, Astérisque 279 (Numdam) Chapters I and IV; Crew 1992 (Numdam) §1; Crew 1994 (Numdam) §1;
Crew 1998 (Numdam) §§9–10; Deligne Weil II (Numdam) §§1.6, 1.8; Deligne–Milne Tannakian categories (Milne's 2018 copy) §2;
Abe arXiv:1111.2479v1 §6; Abe–Marmora arXiv:1104.1563v3 §3; Poineau–Pulita V arXiv:1309.3940v3 §2.4, Theorem 3.5.2;
Xu–Zhu arXiv:1910.13391v2 §2.1.5; Fresán–Sabbah–Yu arXiv:1810.06454v5 §3.2; van der Put (maintainer library, Numdam) §§1, 3.
Not read (cited through the above): Christol–Mebkhout IV, Tsuzuki (Compositio 1998; Duke 2002), Matsuda (Compositio 2002),
Crew (Math. Ann. 2000), Katz–Lang (Enseign. Math. 1981; e-periodica serves page images only), Sperber.
