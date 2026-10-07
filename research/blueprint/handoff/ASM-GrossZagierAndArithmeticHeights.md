# Handoff — ASM-GrossZagierAndArithmeticHeights

Codex, session `codex-TsmTls`, 7 October 2026; Refs #236. Branch
`codex-TsmTls-asm-gross-zagier`. The bot confirmed the claim at
[comment 6037488969](https://github.com/CBirkbeck/tauceti-explorer/issues/236#issuecomment-6037488969).

The assembly is complete. The unified reader preserves all 277 current packet
nodes, 317 API items, 225 mathematical tests and 43 planets, with one introduction,
normalization dictionary, layer overview and source ledger. It supersedes the
stale part readers for the assembled view. Four broad prerequisites in three
GZ.8/GZ.9 nodes now name precise GZ.1/GZ.5/GZ.6/GZ.7 suppliers. The unified Lean
file has one note and 34 unique imports, with scoped part bodies. Both packets
pass with zero errors/warnings. The combined Mathlib diagnostic passes with 473
`sorry` warnings; full elaboration is unavailable because the shared build lacks
the Tau Ceti canonical-height object. Both inherited `needs_changes` verdicts
and every mathematical gap remain. This completes one assembly job; it is not
a claim that the underlying plans are accepted or closed.

## Inputs and durable provenance

- [GZ.0 packet](../packets/GrossZagierAndArithmeticHeights--GZ.0.json),
  [independent review](../reviews/REV-GrossZagierAndArithmeticHeights--GZ.0.md),
  [review handoff](REV-GrossZagierAndArithmeticHeights--GZ.0.md).
- [GZ.8 packet](../packets/GrossZagierAndArithmeticHeights--GZ.8.json),
  [independent review](../reviews/REV-GrossZagierAndArithmeticHeights--GZ.8.md),
  [review handoff](REV-GrossZagierAndArithmeticHeights--GZ.8.md).
- [Unified reader](../readmes/GrossZagierAndArithmeticHeights.md) and
  [unified suggested file](../suggested/GrossZagierAndArithmeticHeights.lean).

The completed reviews are negative reviews, not missing inputs. GZ.0 remains
a complete target-level pass with eight planned stages; GZ.8 remains partial
with two partial stages. No stage is closed and every implementation status is
unchecked. The reader was rebuilt from the current statements, hypotheses,
proof steps, uses, prerequisites, API, tests and acceptance fields rather than
copying the part readers' pre-review assertions. The exact source versions and
mistake decisions retain their provenance in the packets. This assembly did
not independently certify those sources or change either review verdict.

The introduction follows the nearby upstream EllipticCurves and ModularForms
documents; it reconciles the actual EllipticCurves and ClassFieldTheory link
boundaries and identifies the proposed GlobalQuadraticForms interface as an
unresolved Hasse-invariant dictionary. The reviewed `data/library-coverage.json`
was read for the height, pairing, model, theta, toric and Petersson boundary.
All 63 distinct cited baseline declarations' pinned source files were opened;
the height, Northcott, regulator, number-field weight, polarization, trace,
Gamma and Petersson statements were used to check the common conventions.
The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Cross-part prerequisite changes and re-review scope

The following are the only packet changes. No mathematical statement,
hypothesis, proof outline, source, API, unit test, planet, implementation
status, coverage or review object was edited. The direct dependency refinements
should be checked in the independent assembly review. They narrow the reviewed
graph, so this note explicitly identifies all affected nodes for re-review.

- Consumer `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`: replace `GrossZagierAndArithmeticHeights:GZ.1` with `GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height`, `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`.

- Consumer `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`: replace `GrossZagierAndArithmeticHeights:GZ.5` with `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`.

- Consumer `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`: replace `GrossZagierAndArithmeticHeights:GZ.6` with `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform`, `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-coefficients`, `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality`, `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection`.

- Consumer `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`: replace `GrossZagierAndArithmeticHeights:GZ.7` with `GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-height-sum`.


The GZ.1 character space has eigenvalue χ, while GZ.8's A(χ) has eigenvalue
χ⁻¹. The reader transports the pairing by A(χ)=V_{χ⁻¹}, with the inverse
dual component and the respective projector normalizations. It also identifies
GZ.8's M-valued `coeffPairing` prototype as the GZ.1 input, leaving its genuine
L-base-change/restriction adapter open. It does not introduce another owner or
rename stable packet APIs. The existing coefficient/carrier gaps remain.

The classical coefficient identity now names the projected derivative form,
its coefficients, height-series cuspidality, prime-to-level detection, and
both total local height sums. Existing generic kernel prerequisites remain.
The quaternionic CM period consumer now names coherent specialization as well
as the existing Waldspurger theorem. This still does not certify Brooks's local
constants, CST Proposition 2.1, Maass–Shimura/CM-period transport, or integral
Jacquet–Langlands normalization. These consuming gaps were already explicit in
GZ.8's supplier-scope gap and are preserved, rather than claiming the newly
precise references resolve them.

All 49 prerequisites from the second packet into the first are now exact node
references. The union of the 277 nodes has an acyclic direct-node prerequisite
graph. Coarse references within a part and unresolved external-owner contracts
retain their packet status. In particular, an acyclic displayed graph does not
repair the hidden p-adic measure-existence proof cycle recorded in the review.

## Lean assembly and validation

The two part bodies retain their existing fully qualified declaration names,
prototype statements and explicit signature omissions. Separate named sections
prevent the first part's local instances and `open` commands from changing the
second part's elaboration environment. The original part suggested files were
not edited. The unified file has one copyright block, import block and standard
note; no Lean source was created outside its authorized suggested path.

- Both `python3 scripts/check_blueprint.py <part packet>` checks report zero
  errors and zero warnings. There are 241 + 36 nodes, 267 + 50 API entries,
  197 + 28 tests, 33 + 10 planets, 65 + 15 requests and 9 + 7 gaps.
- Reader parity checks preserve every exact node statement, hypothesis,
  proof step, use, API/test name and statement, acceptance item, prerequisite
  and source locator. Review objects, mathematical payloads and all unaffected
  packet fields match the committed inputs. All eight planned and two partial
  coverage states are retained.
- The full `lean-check research/blueprint/suggested/GrossZagierAndArithmeticHeights.lean`
  attempt fails at import processing: the compiled
  `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight` module is absent.
  A complete compiled Tau Ceti baseline at the required pin is unavailable.
  No library build, update, cache fetch or language server was started.
- A sequential Mathlib-only diagnostic temporarily excluded the two Tau Ceti
  imports, the `WeierstrassCurve.Affine` height section, and `heightConventions`
  from the same authorized file. It completed with exit code 0, 473 `sorry`
  warnings, no errors and no other warnings. The full file was restored.
  This validates the combined remaining signatures and scoping, not the full
  file, the excluded height signatures, or any arithmetic theorem.
- Available memory was checked above the required 20 GB before elaboration.
  The wrapper used pinned Mathlib and its 20-minute cap. No compiler remains
  running. The final whitespace and submission-file checks are recorded in
  the PR, together with its Swarm submission check result.

The part reviews' omitted signatures and unavailable API/tests remain visible
in the suggested file and gaps. No scalar surrogate was substituted for an
arithmetic carrier. Source correction IDs overlap between parts: the reader
qualifies them by GZ.0 or GZ.8, preserving their separate records and verdicts,
including GZ.0/E47's rejection and GZ.0/E86's ordinary-derivative correction.

## What remains and where to resume

Begin with the two independent review reports and each packet's `review.checked`
entries. Resolve literal/publication evidence, exact supplier scope and actual
carrier/API/test correspondence before changing either verdict. The unified
reader already includes the review corrections to Northcott, relative field
weight, Poincaré sign, component periods, Rankin convergence/reflection, CM
squaring fibres and tangent stabilizers. It also retains the corrected p-adic
Euler factor, squared logarithm, Iwasawa-unit, tame-character and de Rham
conventions. Revisions should update the owning packet and the unified reader
and suggested file together; do not restore the older part-reader claims.

The remaining primary-source gates include the exact 2013 YZZ proofs and
erratum/volume convention, the 2026 Yuan publication versus its 2024 manuscript,
Colmez published erratum, half-weight/definite period normalization, and the
actual Burungale bounded-measure construction. GZ.9 also needs an acyclic
construction/comparison order, the tame-to-Γ transport, general abelian
logarithm and BLR cotangent statement, semistable Coleman integration, and the
correct Tate-module/de Rham/Kummer transport. These are underlying plan
revisions, not unfinished assembly tasks.

The claim issue explicitly authorizes editing the two part packets to refine
references, but the current queue's assembly `outputs` lists only the three
unified deliverables. Consequently the intake's exact-path auto-merge rule
may hold this PR for the maintainer because of the authorized GZ.8 packet
change. The change must remain in the submission to satisfy task 2. This job
does not edit the queue or change labels, merge or close anything by hand.

The following full request and restructure inventories are durable. No scratch
file or local path is needed by a subsequent worker; scratch is discarded after
submission. Only issue #236 was claimed.

## Collected supplier requests

Identifiers match the unified reader. Every input request is carried below,
including unresolved contract statuses and review refinements.

### GZ.0/R01 — `AutomorphicLFunctionsAndLocalFactors:AL.3`

For GL₂ and a quadratic torus character with matching centre, construct the local base-change epsilon factors and prove the Rankin-over-F comparison by ηv(−1), with fixed ψv and self-dual measures. Existing GL_n×GL_{n−1} factors are not this quadratic base-change interface.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`, `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`.

### GZ.0/R02 — `HeightsRationalPointsAndObstructions:RP.0`

General line-bundle Weil heights on projective abelian varieties; bounded-error tensor and pullback laws; the canonical quadratic limit for symmetric L; its uniqueness, positivity for ample L and torsion zero locus using Northcott; compatible relative/absolute normalization and finite-extension local-degree formula. Supply rational scalar extension of the quadratic form. Existing height-class nodes do not yet provide this machine.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`, `GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational`.

### GZ.0/R03 — `AbelianSchemesAndArithmeticModuli:A2`

The dual abelian variety and its rigidified Poincaré biextension, tensor laws, pullback under homomorphisms and theorem-of-the-square identity for a symmetric polarization. The completed Poincaré sheaf in Part II is not the algebraic biextension interface.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`.

### GZ.0/R04 — `HeightsRationalPointsAndObstructions:RP.1`

General Mordell–Weil finite generation for A over a number field from weak descent and the Northcott height argument; reduce the descent height step to Mathlib AddCommGroup.fg_of_descent'.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`.

### GZ.0/R05 — `ArakelovGeometryAndAbelianHeights:R35.1`

Hermitian rational line bundles, Green arithmetic divisors, finite/infinite arithmetic degrees and the product formula with conjugation-compatible metrics; GZ.2 specializes this infrastructure to curve intersections.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`.

### GZ.0/R06 — `AbelianSchemesAndArithmeticModuli:A2`

Canonical principal polarization of the Jacobian and comparison of its theta bundle with the rigidified Poincaré bundle; the full polarization is one half of that for Θ+[-1]*Θ.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`.

### GZ.0/R07 — `ModularCurvesPartII:R14.6`

For modular X₀(N), logarithmic Hodge divisor, cusp and elliptic-stabilizer weights, finite-level pullback/push-forward and differential q-expansion comparison, compatible with the imported quaternionic Hodge line.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`.

Recorded contract refinement: The requested arithmetic/logarithmic Hodge line is not supplied by its bad-prime/patching contract. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R08 — `GL2AutomorphicRepresentationsAndTransfer:R17.3`

Weight-two Shimura-Jacobian constituent comparison: rational Hecke summands and Hom⁰(J_U,A), their multiplicity one, coefficient field degree equal to dim A, End_F⁰(A) and compatibility with the rational Jacquet–Langlands model. The existing rational-model node supplies transfer descent but not this geometric realization.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization`.

### GZ.0/R09 — `AutomorphicFormsOnReductiveGroups:AF.3`

Weight-two Hodge realization of the quaternionic automorphic constituent with Petersson/Tamagawa pairing and restricted tensor factorization, compatible with the rational Hecke realization and geometric curve volume.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`.

Recorded contract refinement: A cusp-form space alone does not give rational Hodge realization or its Petersson-composition comparison. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R10 — `NeronModelsAndSemistableAbelianVarieties:R11.1`

The minimal invariant differential lattice of an elliptic Néron model, pullback under isogenies and its local valuation; needed to compare Manin constants across an isogeny class.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `GrossZagierAndArithmeticHeights:GZ.3/manin-isogeny-twist-transfer`.

### GZ.0/R11 — `ModularCurvesPartII:R14.1`

Proper cycle push-forward with generic residue-degree multiplicities, base-change/push-pull and the passage from divisor correspondences on X×X to Hom(J,J∨). Use existing algebraic cycles, rather than replacing a cycle by its reduced image.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`.

### GZ.0/R12 — `ModularCurvesPartII:R14.2`

Hecke double-coset correspondences on finite-level modular/Shimura curves, their convolution with multiplicities and action on Pic⁰, with level compatibilities.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`.

### GZ.0/R13 — `HeegnerPointEulerSystems:HE.1`

CM points on the finite-level quaternionic tower, their connected-component labels, ring-class field of definition, reciprocity and Hecke/level transport, with the chosen Artin convention.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`.

### GZ.0/R14 — `ModularCurvesPartII:R14.4`

Curve-level Chow/Picard operations, diagonal restriction, Hecke q-series/cohomology comparison and cusp boundary terms sufficient to prove modularity of the actual Picard-valued Hecke series; not an abstract modular-height-series hypothesis.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`.

Recorded contract refinement: Ihara/level change does not itself prove Picard-valued generating-series modularity. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R15 — `AutomorphicSpectralTheory:AS.3`

Meromorphic continuation of the mixed incoherent Eisenstein kernel, compact-parameter derivative bounds, regularized torus integration and its constant-term subtraction, including justification of all derivative/integral exchanges.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`.

### GZ.0/R16 — `AutomorphicSpectralTheory:AS.4`

Holomorphic/cuspidal constituent projection with Petersson adjunction, annihilation of constants/Eisenstein/old components in the new constituent, and compatibility with the relevant theta/correspondence kernels.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting`, `GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity`.

### GZ.0/R17 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`

CM elliptic/formal-group deformation and lifting-length calculations, ordinary Serre–Tate comparison and the characteristic-zero dyadic/wild ranges needed for toric arithmetic intersections; exact local models and residue weights.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity`.

Recorded contract refinement: Serre-weight results do not supply the requested CM deformation lengths. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R18 — `AutomorphicFormsOnReductiveGroups:AF.1`

The approximation/density principle used by YZZ §1.5.10: precise conditions on S, centre, topology and automorphic transformation law that promote equality on 1^SGL₂(A^S) to a global equality. Verify the source’s GL₂ density claim with its central-character quotient rather than invoking unrestricted strong approximation for the determinant.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation`.

Recorded contract refinement: Real representation/globalization does not provide the requested adelic density or scalar modular-form growth interfaces. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R19 — `TropicalAndBerkovichArithmetic:TB.3`

Connected compact metric-graph Laplacian Δf=−f″dx−Σ outgoing slopes δv; existence and symmetry of the normalized Green kernel for a probability measure; effective resistance, bridge infinity and edge-subdivision compatibility. GZ.2 supplies the genus-weighted canonical-divisor admissibility condition, not this generic graph theory.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`, `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`.

### GZ.0/R20 — `TropicalAndBerkovichArithmetic:TB.2`

Skeleton inclusion and retraction for split semistable curves over a complete discretely valued field not assumed algebraically closed, with finite-Galois descent and unit edge normalization. The existing TB.2 skeleton nodes assume an algebraically closed base and are insufficient as stated.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

### GZ.0/R21 — `TropicalAndBerkovichArithmetic:TB.6`

Model metric and Chambert-Loir Chern measure comparison c₁(O(f))=−i*(Δf) for norm ‖1‖=eK^(−f∘r), including finite-extension normalization and approximation of graph functions.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`.

### GZ.0/R22 — `AutomorphicSpectralTheory:AS.4`

The compact Riemann-surface Green operator with logarithmic singularity, zero-mean inverse of ddᶜ on zero-mass currents, self-adjointness and smooth off-diagonal regularity; holomorphic one-form hermitian pairing.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence`, `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`.

### GZ.0/R23 — `AutomorphicSpectralTheory:AS.4`

Petersson projection onto parallel-weight-two cuspidal forms in each central-character component, its pairing characterization, the regularized Whittaker integral formula and growth hypotheses used by YZZ Proposition6.12. Apply under the two-split-place assumption; do not assume the derivative is square integrable without that growth argument.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log`.

### GZ.0/R24 — `AutomorphicSpectralTheory:AS.2`

GL₂ local/adelic Iwasawa functions δ_v([[a,b],[0,d]]k)=|a/d|_v^(1/2), ρ_v=e^(iθ) with a>0 at real places; δ=Πδ_v and ρ∞=Πρ_v. Include well-definedness and (ρ∞δ∞)([[1,0],[N,1]])=(1+iN)^(−[F:ℚ]).

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison`, `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`.

Recorded contract refinement: The Iwasawa carrier request belongs to GL2 function-space specialization, not solely intertwining operators. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R25 — `MetaplecticAutomorphicForms:MP.5`

Extended Weil action r(g,(t₁,t₂)) on S̄(V×A×), its Gaussian real factors, orthogonal-direct-sum factorization, complement discriminant characters, Fourier/Hecke action and theta convergence for the unit-quotient positive-definite and incoherent quaternionic data.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison`, `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta`.

### GZ.0/R26 — `AutomorphicSpectralTheory:AS.2`

Meromorphic Eisenstein/Green-resolvent families and Legendre Q_s(t)=∫₀∞(t+√(t²−1)cosh u)^(−1−s)du, t>1; the CM Green sum initially convergent for Re s>0 with simple-pole continuation at zero. Include zero/nonzero Whittaker branch intertwiner continuation.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-archimedean-derivative-kernel`.

### GZ.0/R27 — `AutomorphicLFunctionsAndLocalFactors:AL.1`

Local additive-character different and self-dual measures, Weil-index/L-factor normalizations, quadratic norm cosets including wild ramification and representation-density Whittaker shell formula. The local norm-congruence shell counts require exact quadratic norm lattices, Haar shell volumes, wild different exponents and finite-support estimates. These are requested extensions of the local quadratic-character/density interface; RP.2 Brauer–Manin evaluation does not supply them.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-local-whittaker-series-for-incoherent`.

### GZ.0/R28 — `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Gross canonical/quasicanonical lifting with endomorphism filtration O_E+π_E^(m−1)O_B, and wild norm conductor v(D); derive the corrected half-valuation ramified CM multiplicity. Distinguish this reusable deformation input from GZ’s weighted height series.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified`.

### GZ.0/R29 — `HeegnerPointEulerSystems:HE.2`

CM-point reduction and ordinary intersection multiplicities on quaternionic Shimura curves: Zhang’s upper/lower-unipotent formula, plus compatibility with finite-level projection and residue-prime weights.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`.

### GZ.0/R30 — `HilbertModularVarietiesAndShimuraCurves:R18.5`

Finite-level CM class quotient, field-of-definition reciprocity and unramifiedness above division places; compact coarse Q-factorial integral models after permitted unramified base change; chosen maximal order containing O_E; regular small-away-v covers with U′v=Uv and stabilizer multiplicity e; split-fibre component decomposition.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-split-zero`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and`.

### GZ.0/R31 — `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`

Čerednik–Drinfeld formal/integral upper-half-plane uniformization at division places, components GL₂(Fv)/Fv×GL₂(Ov), their local intersections and CM fixed sections; conventions for nearby B(v).

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal`.

### GZ.0/R32 — `AutomorphicFormsOnReductiveGroups:AF.1`

Automorphic density principle in the GL₂ central-character category used in the pseudo-theta Vandermonde argument, with the corrected fixed complement characters along rational unipotent translates.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-automorphic`.

Recorded contract refinement: Real representation/globalization does not provide the requested adelic density or scalar modular-form growth interfaces. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R33 — `HeightsRationalPointsAndObstructions:RP.0`

Canonical Jacobian height for 2Θ, positivity modulo torsion and complex Hermitian extension; specialize the general ample canonical-height machine, without redefining it in GZ.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality`, `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights`, `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula`, `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`.

### GZ.0/R34 — `HeegnerPointEulerSystems:HE.1`

Ideal-class CM points and Hecke correspondences on X₀(N), field-of-definition and Artin reciprocity with the source ideal-inverse convention.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`, `GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`, `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`.

### GZ.0/R35 — `AbelianSchemesAndArithmeticModuli:A6`

Hom/End of chosen cyclic N-isogeny diagrams over complete local and Artinian bases; degree equality, finite positive-degree fibres, free sign action and faithful stabilizer action. Do not assert choice-independent Hom for arbitrary coarse Artinian points with extra automorphisms.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-to-p-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization`.

### GZ.0/R36 — `HeegnerPointEulerSystems:HE.2`

Quasicanonical CM lifting/isogeny intersection calculation over W, including the prime-to-p degree decomposition and the valuation normalization used in the classical Hom sum.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-degree-one-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`.

### GZ.0/R37 — `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Exact negative-norm coset/congruence lifting count in the quaternionic CM deformation order, including ramified and dyadic ranges.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### GZ.0/R38 — `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Canonical ordinary CM lifting and fullness of reduction on CM Hom/End; prove the classical new-Hom vanishing at split places.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### GZ.0/R39 — `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`

Quaternionic norm-positive/anti-linear decomposition compatible with the embedded K and reduced norm, including norm/degree ratio for connecting Hom ideals.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### GZ.0/R40 — `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Gross canonical-lift endomorphism filtration over W/π^n, in the source uniformizer convention; distinguish inert and ramified lengths and state the dyadic exceptions.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### GZ.0/R41 — `GL2AutomorphicRepresentationsAndTransfer:R16.1`

Connecting ideals between optimal CM Eichler orders and their orientation identity; provide both 𝔟R=S𝔟 and R𝔟=𝔟S conventions and the induced anti-linear coefficient ratio.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice`.

Recorded contract refinement: Global function-space specialization does not give local Jacquet-Langlands or connecting Eichler ideals. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R42 — `AutomorphicFormsOnReductiveGroups:AF.1`

Scalar modular forms of weight 2k and polynomial growth at every cusp, trace of levels and Petersson integrability against cusp forms; import their actual classical realization.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`.

Recorded contract refinement: Real representation/globalization does not provide the requested adelic density or scalar modular-form growth interfaces. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R43 — `AnalyticNumberTheory:AN.4`

Genus characters of the ideal class group, ordered fundamental discriminant factorizations, quadratic character evaluations and theta transformation under ramified ideals.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum`, `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`, `GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter`.

### GZ.0/R44 — `AnalyticNumberTheory:AN.4`

The norm representation and genus criterion with Nn+l≡0 mod D and l a norm from the specified class. This hypothesis is necessary for the divisor complement identities.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum`, `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`, `GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter`.

### GZ.0/R45 — `AutomorphicSpectralTheory:AS.4`

Regularized Petersson holomorphic projection in weight two with logarithmic cusp growth, Fourier Mellin finite parts, continuation bounds and orthogonality of boundary Eisenstein families.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection`.

### GZ.0/R46 — `HeegnerPointEulerSystems:HE.1`

The field-of-definition and complex conjugation of classical Heegner points and their modular images, in the source Artin/Fricke convention.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/classical-twist-real-period`.

### GZ.0/R47 — `AutomorphicLFunctionsAndLocalFactors:AL.3`

Identify the arithmetic ideal-class character sum with the GL₂/K base-change Rankin L-function, including every p|N Euler factor and the arithmetic weight-2k shift s↦s−k+1/2. Supply its analytic continuation and exact completed gamma factors. Include the arithmetic-to-unitary coefficient normalization and absolute convergence for Re(s)>k+1/2, for both the ideal-class series and character Euler product, with the ideal-count bound r_A(n)≪_ε n^ε and a strict convergence margin.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence`.

### GZ.0/R48 — `AnalyticNumberTheory:AN.4`

Integral ideal counts by class/norm, finite Fourier inversion, ordered discriminant genus characters, norm/genus congruence criterion and the corrected prime-log decomposition. The genus/sign inputs are general arithmetic; GZ owns only the coefficient/kernel formulas consuming them.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`.

### GZ.0/R49 — `AutomorphicSpectralTheory:AS.2`

Scalar level-N weight-one-character Eisenstein families and their zero/nonzero Fourier coefficients; hyperbolic Legendre resolvent with eigenvalue s(s−1), residue −12/[SL₂(ℤ):Γ₀(N)], cusp continuation and CM evaluation. Keep PSL₂ quotient, cusp widths, phases and squared-log normalization explicit.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient`.

### GZ.0/R50 — `MetaplecticAutomorphicForms:MP.7`

Classical ideal-class theta series of weight one and character ε, constant r_A(0)=1/w, their ramified cusp transforms and the half-integral-weight/GL₂ theta correspondence used by the arithmetic Rankin kernel.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`.

### GZ.0/R51 — `ModularCurvesPartII:R14.5`

Hecke algebra/Fourier coefficient perfect pairing for weight-two cuspidal forms and the Jacobian, trace adjunction, newform orthogonal projection and prime-to-level detection on the newform subspace.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction`, `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection`, `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality`.

### GZ.0/R52 — `ModularCurvesPartII:R14.2`

Finite-level compactified X₀(N), both marked cusps and their widths, cyclic-isogeny diagrams, integral Deligne–Rapoport level model and stabilizer-aware orbifold differential/discriminant tensor.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification`.

Recorded contract refinement: The Jacobian/Hecke contract does not by itself construct the general compactified integral level model and orbifold discriminant tensor. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R53 — `HeightsRationalPointsAndObstructions:RP.0`

Local Néron symbols for degree-zero divisors, with principal-divisor law, tangent extension at common support and its parameter-change law; regular-model comparison with −intersection·log(q_v); relative field-height comparison.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula`, `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights`.

### GZ.0/R54 — `AutomorphicLFunctionsAndLocalFactors:AL.0`

Generic special-function realization of the terminating polynomial p_(k−1)(t)=Σ_(r=0)^(k−1) binom(k−1,r)(−t)^r/r! and the decaying q_(k−1)(t)=∫₁∞(x−1)^(k−1)x^(−k)e^(−xt)dx, with gamma/Mellin/Legendre continuation identities and permitted differentiation. Confirm the polynomial source normalization before choosing a pinned polynomial API.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization`.

### GZ.0/R55 — `MetaplecticAutomorphicForms:MP.7`

Baruch–Mao 2010 Theorems1.2,1.4, the Kohnen-plus Maass eigenline correspondence including its Hecke operator at 2, and the local real/2-adic Whittaker-normalization comparison. DIT’s unit half-weight vector uses coefficient b(d) and factor 12π; the corresponding GL₂ parameter is r and the half-weight parameter r/2.

Needed by: `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`.

### GZ.0/R56 — `AutomorphicLFunctionsAndLocalFactors:AL.3`

Finite Maass twist L(s,φ⊗χ_d), its ramified Euler factors and both signed real gamma factors; distinguish its finite Dirichlet series from the completed automorphic L-function.

Needed by: `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`.

### GZ.0/R57 — `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

Dual graph of a semistable fibre, vertex component genera and residue-field/Galois action; incidence valences and bridge/loop convention compatible with the metrized graph.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

### GZ.0/R58 — `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Finite arithmetic-surface intersection of horizontal and vertical Cartier divisors, projection formula, vertical intersection matrix with kernel the total fibre; admissible vertical correction modulo that fibre.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection`.

### GZ.0/R59 — `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`

Regular/minimal proper curve models over complete and number-field DVRs, finite-level model changes, blow-up invariance of the corrected degree-zero pairing.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`.

### GZ.0/R60 — `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`

Semistable reduction and base change of component/intersection data, including non-split Galois descent and edge-length change by ramification.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

### GZ.0/R61 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

Jacobian Pic⁰ and Abel–Jacobi map over the actual ground field, descent for rational degree-one divisor classes, normalized Hodge class ξ and compatibility with Hecke correspondences.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`, `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`.

### GZ.0/R62 — `SmoothRepresentationsOfLocalGroups:SR.2`

χ-equivariant continuous/smooth toric Hom functor on an admissible local representation and contragredient, with invariants and scalar extension; real/complex topological conditions are separate.

Needed by: `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`.

### GZ.0/R63 — `GL2AutomorphicRepresentationsAndTransfer:R16.1`

Local GL₂/quaternionic Jacquet–Langlands representations and toric restriction, including real discrete series, coefficient realization and connecting Eichler ideals.

Needed by: `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`, `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice`.

Recorded contract refinement: Global function-space specialization does not give local Jacquet-Langlands or connecting Eichler ideals. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R64 — `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

Local Tunnell–Saito distinction theorem in both GL₂ and division forms, with epsilon factor ψ and the corrected base-change root-number sign.

Needed by: `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`.

Recorded contract refinement: The generic local transfer contract does not state Tunnell-Saito distinction; GZ.4 owns that theorem and needs an actual source proof. This is an unresolved ownership/statement refinement, not an established prerequisite.

### GZ.0/R65 — `HeegnerPointEulerSystems:HE.0`

The imaginary quadratic order, its ideal-class group and Hilbert/ring-class extension, with Artin reciprocity in the inverse-ideal convention used here. This supplies order and class-field data; the CM-point and Hecke construction is separately requested from HE.1.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions`, `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum`, `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`, `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`.

Status: open.

### GZ.8/R01 — `GeneralizedHeegnerCycles:GH.1`

State BDP Theorem 5.13 in the generality of BDP Assumption 5.12 (any class number, odd conductor c prime to N d_K, characters of finite type (c, 𝔑, ε_f), all 0 ≤ j ≤ r), not only under the three simplifying hypotheses of the decomposition node GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images, and include the r = 0 cycle Δ_φ − ∞ explicitly. GZ.9 imports the r = j = 0 case and does not plan Theorem 5.13 itself (resolution of RT-AREA-iwasawa-1/11: GH owns BDP Theorem 5.13 for every r).

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`.

### GZ.8/R02 — `AutomorphicPadicLFunctions:L3h`

Export the F = ℚ, n⁻ = 1 specialisation of Hsieh's square-root distribution as Castella–Hsieh's measure L_{p,ψ}(f) on Γ̃ = Gal(K_{p^∞}/K) with coefficients in R, with its interpolation formula (Castella–Hsieh Proposition 3.8) including the factors 2^{#A(ψ)+3}, c_o, ε(f), u_K², √D_K and φ(𝔑^{-1}), and its extension to p-new f (Euler factor 1 − a_p p^{-1} φ(p)). GZ.9 squares it; it does not construct it.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`.

### GZ.8/R03 — `AutomorphicPadicLFunctions:L0`

p-adic avatars ψ̂ of anticyclotomic Hecke characters of K of infinity type (n, −n) and their algebraic avatars ψ^alg, the crystalline (unramified at p) condition, and the set Σ_cc of JSW §5.1 as a subset of characters of Γ.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`.

### GZ.8/R04 — `AutomorphicPadicLFunctions:L3`

CM periods: the complex period Ω_∞ and the p-adic (Serre–Tate / formal-group) period Ω_p ∈ R^× of an elliptic curve with CM by O_K at a split prime, their dependence on the trivialisation of the formal group, and the algebraicity of the CM values of nearly holomorphic forms via the unit-root splitting at ordinary CM points.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`.

### GZ.8/R05 — `PadicMeasuresIwasawaAlgebras:L1`

The completed group ring R⟦Γ⟧ for R the completion of O·ℤ_p^ur (a complete DVR with algebraically closed residue field), its identification with R⟦T⟧ for a topological generator γ, and evaluation at continuous characters ψ : Γ → R^× as the ring map T ↦ ψ(γ) − 1; restriction along Γ̃ → Γ.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`.

### GZ.8/R06 — `PadicHodgeRegulators:L1`

For an abelian variety A over a finite extension of ℚ_p with good reduction: H¹_e = H¹_f for V_p A, and log_BK ∘ κ = log_A on A(K_v) ⊗ ℚ under D_dR(V_p A)/Fil⁰ ≅ Lie(A) ⊗ K_v (Bloch–Kato Example 3.10.1), with the sign convention of the exponential fixed.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`.

### GZ.8/R07 — `AbelianSchemesAndArithmeticModuli:A4`

The p-adic logarithm log_A : A(F_v) → Lie(A/F_v) of an abelian variety over a finite extension F_v/ℚ_p: a homomorphism with kernel the torsion subgroup, an isomorphism after ⊗ℚ onto its image, functorial (log_B ∘ φ = dφ ∘ log_A), and log_ω = ⟨ω, log_A⟩ the unique locally analytic homomorphism with d log_ω = ω for ω ∈ H⁰(A, Ω¹). No roadmap plans this general notion; Tau Ceti's EllipticCurves Layer 1 plans only the elliptic formal logarithm. Scope warning: the present A4 stage covers degree-one realizations and Serre–Tate deformation, not the general p-adic Lie logarithm or the BLR direct-summand theorem. These requested extensions need an explicit ownership/rescope decision before they count as prerequisites.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`, `GrossZagierAndArithmeticHeights:GZ.9/logarithm-detects-heegner-point`, `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`.

### GZ.8/R08 — `ColemanIntegration:L1`

In the good-reduction setting of L1, identify Coleman integration of a holomorphic form over a degree-zero divisor with the Jacobian logarithm, independently of the base point. L1 does not supply the semistable non-crystalline case at p ∥ N; that supplier is a recorded scope gap.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`.

### GZ.8/R09 — `HilbertModularVarietiesAndShimuraCurves:R18.1`

Canonical quaternionic Shimura curves X_U over their reflex fields, their complex uniformization and comparison with the split rational modular curve, with datum, level and stabilizers fixed. CM reciprocity and Hodge/Jacobian data are imported from HE.1 and GZ.3. The integral model and extension of Hecke maps are requested separately from R18.2, not from R18.1.

Needed by: `GrossZagierAndArithmeticHeights:GZ.8/rational-shimura-curve-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.8/totally-real-trace-point-nontorsion`, `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`, `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`.

### GZ.8/R10 — `GL2AutomorphicRepresentationsAndTransfer:R17.3`

Global Jacquet–Langlands for weight two: f ↦ f_B on Γ₀^B(N⁺) with the Hecke eigenvalues of f away from N⁻, unique up to scalar, normalised to be defined over ℤ(f)_(p) and nonzero mod p; and the identification of the local components needed for CST's admissible orders. Scope warning: rational-structure transfer does not itself identify the p-integral lattice or prove a primitive mod-p normalization; specify the integral comparison separately.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector`.

### GZ.8/R11 — `AutomorphicLFunctionsAndLocalFactors:AL.3`

For GL₂ over a totally real F and a CM extension K/F: the base-change Rankin L-function L(s, π_K ⊗ χ) with analytic continuation, functional equation and local root numbers ε(1/2, π_{K,v} ⊗ χ_v); the Rankin–Selberg-over-F root numbers and their comparison ε_RS = η_v(−1) ε_BC (Langlands λ-factor); the adjoint L-value L(1, π, ad); and the relation L(f, ψ^alg, s) = L(π_K × ψ^alg, s − 1/2).

Needed by: `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`, `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`, `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`.

### GZ.8/R12 — `AutomorphicGaloisRepresentations:R19.1`

The Ramanujan–Petersson bound |σ(a_p)| ≤ 2√p for weight-two newforms at p ∤ N, or equivalently ∏_σ (1 + p − σ(a_p)) = #Ã_f(𝔽_p) for the Eichler–Shimura abelian variety, giving 1 + p − a_p ≠ 0.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`.

### GZ.8/R13 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

The Hasse bound and a_p = p + 1 − #Ẽ(𝔽_p) for an elliptic curve with good reduction at p, so that 1 + p − a_p = #Ẽ(𝔽_p) ≥ 1.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`.

### GZ.8/R14 — `DiophantineApproximationAndTranscendence:DT.3`

Burungale–Skinner–Wan, arXiv:2603.20886v2: the p-adic analytic subgroup theorem for an algebraic point on an abelian variety (their Theorems 3.1–3.2), and its consequences Theorem 1.1 (for A/ℚ̄ with a field F ⊂ End⁰(A), dim A = [F : ℚ] and F with a real embedding, log_ω(x) ≠ 0 for every non-torsion x and every nonzero F-eigendifferential ω) and Theorem 2.8 (χ-twisted points, E totally real). GZ.9 imports Theorem 1.1 and Theorem 2.8(i); this is PAPER-SKINNER-20 items 79–81, routed to DT.3. PAPER-SKINNER-20 routes this here, but the current DT.3 description does not state the abelian p-adic analytic subgroup theorem. The request is a scope extension, not an already verified export.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing`.

### GZ.8/R15 — `HilbertModularVarietiesAndShimuraCurves:R18.2`

The smooth integral model of X_{N⁺,N⁻} at p ∤ N and extension of the relevant Hecke maps, with its coarse/fine moduli and level hypotheses and comparison to the canonical generic fibre. These are R18.2 targets; Serre–Tate coordinates on the appropriate moduli cover and descent to the coarse curve still require a precise construction.

Needed by: `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`, `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`.

## Collected restructuring proposals

All six proposals remain proposals; no owner or upstream roadmap was changed.

### GZ.0/S01 — rescope

Roadmaps: `GrossZagierAndArithmeticHeights`, `HeightsRationalPointsAndObstructions`, `RankZeroOneBSD`.

Issue: GZ.1’s general line-bundle heights and Mordell–Weil overlap RP.0/RP.1; BSD.1 currently routes general Mordell–Weil through GZ.1.

Proposal: GZ.1 keeps the YZZ Poincaré/full-polarization convention, coefficient-valued χ-pairings and elliptic comparison. Import general canonical/local heights and Northcott from RP.0, general Mordell–Weil from RP.1, and reroute BSD.1’s general Mordell–Weil input to RP.1. Northcott alone suffices for the torsion zero-locus argument.

### GZ.0/S02 — rescope

Roadmaps: `GrossZagierAndArithmeticHeights`, `tauceti:TauCetiRoadmap/StableReduction`.

Issue: The proposed GZ.2 regular-model and finite intersection infrastructure duplicates upstream StableReduction.

Proposal: GZ.2 imports Layers 1, 4, 5 and 7 for dual graphs, regular/minimal models, vertical intersection matrices and their fibre kernel, projection formulas and semistable base change. It keeps admissible archimedean metrics, arithmetic graph measures, global admissible gluing and Faltings–Hriljac.

### GZ.8/S01 — rescope

Roadmaps: `GrossZagierAndArithmeticHeights`, `GeneralizedHeegnerCycles`, `AutomorphicPadicLFunctions`.

Issue: RT-AREA-iwasawa-1/11: GZ.9 planned the GL₂ BDP square-root distribution (also planned by AutomorphicPadicLFunctions L3h) and the weight-two case of BDP Theorem 5.13 (also stated by the accepted decomposition node GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images).

Proposal: Owners: L3h owns the square-root distribution for every totally real F (specialised to F = ℚ, n⁻ = 1 for GZ.9); GH.1 owns BDP Theorem 5.13 for every r ≥ 0; GZ.9 imports both (bdp-square-root-comparison squares the L3h measure; bdp-weight-two-heegner-formula imports Theorem 5.13 at r = j = 0) and owns what is new in weight two: Brooks's quaternionic construction and Proposition 8.13 (= JSW Proposition 5.1.6), JSW Proposition 5.1.7, the multiplicative-prime formula, the formal-logarithm and Bloch–Kato/Kummer comparisons and the isogeny/differential compatibilities. Add the stage edges AutomorphicPadicLFunctions:L3h → GZ.9 and GeneralizedHeegnerCycles:GH.1 → GZ.9; both are acyclic (no path from GZ.9 to either in research/blueprint/atlas/stage-edges.json).

### GZ.8/S02 — rescope

Roadmaps: `GrossZagierAndArithmeticHeights`, `ModularSymbolsPadicLFunctions`.

Issue: The stage edge ModularSymbolsPadicLFunctions:L2 → GZ.9 (p-stabilised modular-symbol measures) is not used: neither the BDP nor the Brooks construction uses modular symbols, and no GZ.9 node needs L2.

Proposal: Drop the edge ModularSymbolsPadicLFunctions:L2 → GrossZagierAndArithmeticHeights:GZ.9. Add instead the edges actually used: AutomorphicPadicLFunctions:L0 and L3 → GZ.9 (character avatars, CM periods), HilbertModularVarietiesAndShimuraCurves:R18.1 and R18.2 → GZ.9 (canonical Shimura curves X_{N⁺,N⁻} and their integral models), GL2AutomorphicRepresentationsAndTransfer:R17.3 → GZ.9 (Jacquet–Langlands), ColemanIntegration:L1 → GZ.9, AbelianSchemesAndArithmeticModuli:A4 → GZ.9, GrossZagierAndArithmeticHeights:GZ.5 → GZ.9 (the CM-value Waldspurger formula) and HeegnerPointEulerSystems:HE.1 → GZ.8.

### GZ.8/S03 — rescope

Roadmaps: `GrossZagierAndArithmeticHeights`, `GeneralizedHeegnerCycles`, `RankZeroOneBSD`.

Issue: GZ.9's stage text asks for 'a multiplicative exceptional-zero formula ... with its Tate-period/L-invariant term whenever consumed by the corrected BSD multiplicative branch'. The weight-two BDP formula at a multiplicative prime has the nonvanishing factor (1 − a_p p^{-1})² and no exceptional zero (Castella, Theorem 2.11; Castella CJM Theorem 3.2), and that formula is what the multiplicative BSD branch (Castella CJM Theorem A, in RankZeroOneBSD BSD.6a) consumes; it is planned here as multiplicative-prime-formula. The L-invariant appears only in the derivative formula for Howard's big Heegner points at an exceptional weight-two point (Castella, Theorem 3.11), a Hida-family statement.

Proposal: Replace GZ.9's exceptional-zero clause by: 'the weight-two formula at a multiplicative prime p ∥ N split in K (no exceptional zero)'. The exceptional-zero derivative formula for big Heegner points, with the L-invariant 𝓛_p(f, K), belongs to GeneralizedHeegnerCycles GH.7. PadicHodgeTheory R06.6's recorded use 'the Tate-period/L-invariant term of the multiplicative exceptional-zero formula' should name GH.7 instead of GZ.9.

### GZ.8/S04 — rescope

Roadmaps: `GrossZagierAndArithmeticHeights`, `GeneralizedHeegnerCycles`.

Issue: The unreviewed GeneralizedHeegnerCycles--GH.8 checkpoint plans weight-two comparisons (weight-zero-cycle, differential-evaluation) that coincide with GZ.9's weight-two-abel-jacobi-is-logarithm and isogeny-and-differential-compatibility. GZ.9 precedes GH.8 in the stage graph (GZ.9 → HE.8 → GH.8), so GZ.9 cannot import them.

Proposal: GH.8 imports GZ.9/weight-two-abel-jacobi-is-logarithm and GZ.9/isogeny-and-differential-compatibility and keeps only its family-specific comparisons (stabilised classes, corestriction, uniform lattices, Hida specialisation).

## Collected upstream notes

- `tauceti:TauCetiRoadmap/EllipticCurves`: The Layer 6 text around line 1179 describes the full x-height limit, while CanonicalHeight at f790474 uses one half of that limit and the associated halved polar form. The code fixes this packet’s convention: the YZZ full polarization is twice neronTatePairing, with regulator factor 2^r. Pass this text/code discrepancy to the upstream maintainer; this job does not edit the upstream roadmap.
