# Completed independent review: hyperbolic curve volumes and gonality

Issue [#1726](https://github.com/CBirkbeck/tauceti-explorer/issues/1726), Codex session `codex-Sw7hjQ`, 11 October 2026. Claim [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/1726#issuecomment-6106119638). Branch `codex-Sw7hjQ-review-hyperbolic-gonality`. **The review is complete, with verdict `needs_changes`; this is not a checkpoint.** This session did not write the design and claimed no second job.

The corrected design remains partial. The [review report](../reviews/REV-DESIGN-HyperbolicCurveVolumesAndGonality.md) gives every node verdict, correction, exact-pin baseline check, supplier boundary and missing API/test name. The [packet](../packets/HyperbolicCurveVolumesAndGonality.json) contains the authoritative 76-entry `review.checked` object, public source editions/URLs/hashes, four confirmed source findings and all remaining gaps. The [roadmap](../roadmaps/HyperbolicCurveVolumesAndGonality.json) and [suggested file](../suggested/HyperbolicCurveVolumesAndGonality.lean) have the clear corrections applied.

## Review result and corrections

- 76 nodes: 33 verified, 14 corrected, 29 unverifiable, 0 added. There are 152 API items, 120 tests, 38 planets, 24 confirmed baseline declarations, 20 supplier-stage requests, two current-upstream request records and 11 gaps. Eight tests were added. All implementations remain `unchecked`.
- Fixed the double diagonal to pair corresponding coordinates across the two X² blocks, with two Lean examples detecting the previous definition. Added positive disc-measure and parametrized-volume examples; the old test suites admitted zero models.
- Replaced the diagonal-value-only μ stub with the leading factor asymptotic `μ(z,w)/|z−w|² → 1/[4(1−|z|²)²]` on the punctured neighborhood. Preserve curvature −1 distance as twice the pinned PoincareDisc distance; UnitDisc’s own metric is Euclidean.
- Corrected compact-ball claims: `r<ρ` gives an injective local isometry and center-distance preservation; pairwise ambient distance equality uses `r<ρ/2`.
- Corrected real-current degree bounds, pushforward degree shift and parity. With unsigned pushforward pairing, `d(f_*T)=(-1)^(n−m)f_*(dT)`; complex direct images commute. ChartCurrent now bounds its degree instead of allowing natural subtraction to produce a wrong out-of-range scalar current.
- Specified countability/exhaustion for manifold test forms and distinguished globally proper test-form pullback from support-proper current pushforward. Added psh nontriviality and radial-mollifier conditions.
- Singular Stokes now allows logarithmic potentials tending to −∞ with finite limiting slope. Its boundary-flux variant applies to an independently positive potential even when the scalar profile is concave. Preserve this distinction for the conjugate-diagonal argument.
- Split source locators, replaced generic source-match notes, restored Osserman smoothing-family hypotheses, and specified the special-fibre aspect map. Source-version kinds use the protocol enum.
- Confirmed existing BT findings E1/E2. Added E3 (Demailly’s real-current pushforward sign) and E4 (Osserman’s dimension-r linear series needs rank r+1). The exact texts, arguments and existing-correction searches are in `sourceIssues`; all four have this review’s confirmed verdict.

## Ownership to preserve

The current TauCetiRoadmap main at `070dc2becd74419e76303ede84b465ed4a69461f` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read only. No upstream build or edits were made. All 24 baseline statements were separately read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- Reuse current `riemannianVolume` and the half-plane comparison. The quotient atlas is imported; invariant quotient-metric descent, normalization/chart comparisons and extension over the finite exceptional set are new contracts, not a named Fuchsian2 descent theorem or another general smooth measure.
- DifferentialGeometry owns smooth forms, ordinary Stokes, de Rham, Brouwer/no-retraction (Layer10), and gradient/Green identity (Layer12). Its LaplaceBeltrami is `div∘grad`; the nonnegative analytic operator is its negative. Closed Dirichlet-form realization and compact spectrum are not supplied by this layer.
- ComplexComparison C0 owns Noetherian analytic germs and the holomorphic-bundle dictionary; C1 uses the shared Chern connection. C5 already owns analytic-cycle integration, finite-mass closed-current extension and general Chern/intersection comparison. These are imported. HV.3 retains weighted normalization and hyperbolic/ddᶜ adapters.
- R09.1 uses quotient Grassmannians; obtain rank-two subbundles via the complementary quotient rank. R09.2 represents Hom through fixed graph-polynomial pieces; it does not own Picard schemes and its full Hom scheme is not finite type.
- JacobianChallenge C/D supplies smooth-family cohomology/Picard inputs. D’s integral-fibre hypothesis excludes the reducible compact-type case; request fixed-multidegree components as an extension. The union of all total-degree multidegrees is not asserted proper.
- AlgebraicCurves12 supplies algebraic models and function-field/cohomology comparisons, explicitly excluding compact Riemann-surface comparison. Fuchsian5 supplies analytic degree/topological genus. ModularForms10B supplies analytic RR/meromorphic sections and analytic/topological genus, explicitly excluding algebraic comparison. Proper GAGA alone does not algebraize an arbitrary compact Riemann surface. G12 records the required adapter rather than assigning it to those excluded scopes.

## Design revision worklist

1. Use G11 and the report’s complete inventory to construct actual global signatures. There are 84 API names and 58 test names absent across 20 definition/construction nodes; present local signatures may also be only specializations. Complete the named global volume, pencil and spectral theorem signatures. Do not hide the missing hypotheses in records that assume estimates.
2. Close G1’s universal-denominator/analytic-closure normalization inputs. Local-ring Noetherianity is already imported from C0. Reconcile the actual analytic-cycle/current carriers with C5, not a parallel carrier system.
3. Close G12: projective algebraization and actual analytic/algebraic local-order, degree and genus adapters, using imported analytic RR and GAGA. Retain C5’s existing integration/Chern ownership.
4. Close G4’s regularized-max/tie-interface positive-current limit for the codimension-two double diagonal. Use point multiplicity there, never a Cartier intersection with Δ₂. The conjugate diagonal remains totally real and has no algebraic divisor pairing.
5. Close G5 with explicit linked-Grassmannian incidence/exactness/open-density/tangent-dimension and endpoint-fibre contracts, marked genus-zero/one base cases, fixed-multidegree Picard components and regular smoothing. The primary Osserman construction and relevant proofs are accessible and were read; full general endpoint stratification still needs decomposition.
6. Close G6’s equatorial-sphere conformal geometry; G7’s cusp/elliptic closed-form-domain cutoff convergence; G10’s closability, Friedrichs correspondence and compact positive eigenvalue/Rayleigh realization. Finite energy by itself does not establish domain membership.
7. Resolve G9’s current-upstream stage encoding without duplicating those roadmaps. Keep the automorphic application conditional until design [#1699](https://github.com/CBirkbeck/tauceti-explorer/issues/1699) supplies the actual congruence-gap stage (G8).
8. Obtain cleared readable originals or an explicit amendment for G3. HT02: *Volumes of complex analytic subvarieties of Hermitian symmetric spaces*, AJM124 (2002),1221–1246, DOI `10.1353/ajm.2002.0038`, publisher endpoint `https://muse.jhu.edu/article/1000/pdf`. HT12: *Injectivity radius and gonality of a compact Riemann surface*, AJM134 (2012),259–283, DOI `10.1353/ajm.2012.0007`, publisher endpoint `https://muse.jhu.edu/article/464633/pdf`. Endpoints returned metadata/verification pages; the cleared-library index lists neither. BT’s alternative diagonal proof is checked, but does not close the original point-volume proof obligation.

The reader `research/blueprint/readmes/HyperbolicCurveVolumesAndGonality.md` is outside this review’s allowlist and was not edited. An authorized revision must synchronize the corrected current signs/degree bounds, Stokes pole and concave-profile conditions, compact-ball radius, coordinate pairing, supplier boundaries and G10–G12. The old design handoff is historical; use this report/packet for the current findings.

## Validation receipt

- Final packet checker: **0 errors, 0 warnings**.
- Source findings/version payload checked through an `errata-v1` scratch wrapper: **ok**; the packet keeps its blueprint protocol.
- Final `lean-check`: **exit 0, 153 warnings, all declaration uses of `sorry`**, no other diagnostics. Mathlib in the shared build is at the pin, and all 55 transitive Tau Ceti source imports match f790474 byte-for-byte. No claim of implemented proofs follows from elaboration. Memory was above 20 GB; no compiler or language server remains running.
- Changed-file intake and whitespace checks passed. The submission changes exactly the issue’s four deliverables and this required handoff.

Scratch material is disposable. All evidence and continuation requirements needed by a later worker are retained in the report, packet and this note; no source PDF or passage is committed.
