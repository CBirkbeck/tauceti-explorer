# PKG-ConformalMappingPartII~2

Completed revision of issue [#9163](https://github.com/CBirkbeck/tauceti-explorer/issues/9163), by Codex, session `codex-C9UOVZ`, on 14 October 2026. Branch: `codex-C9UOVZ-conformal-package-9163`. The [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/9163#issuecomment-6160932093) identifies this session. This is a complete package submission, ready for an independent package review, rather than a checkpoint.

## Deliverables and accepted-plan fidelity

Rewrote the README in the binding upstream form: opening Summary, scope and ownership, conventions, exact supplier contracts, build order, ten numbered layers with numbered subsections, Examples and Dependencies in every layer, downstream consumers and references. The accepted input has 98 targets, 68 API items and 54 test statements. There are 96 numbered target subsections: the two existing suppliers listed below have been removed from the target sequence and their agreements and all six checks retained under scope. All other target subjects, all 62 remaining planned API items, the six supplier agreements and all 54 planned test statements remain. Additional germ-space, companion, representative and convention checks strengthen the interfaces.

The suggested file was written as a compact statement file, following `PACKAGE_REVIEW.md`, “Shape of a roadmap (2026-10-12)”, which supersedes the earlier exhaustive-signature requirement applied by the 10 October review. It is 453 lines, with 13 real-bodied definitions, three structures over existing carriers, 19 milestone/end theorems and 34 examples. It has no auxiliary proof chains, admitted data definitions, classes, instances, abbreviations or `lemma` declarations. It imports Mathlib and the individual Tau Ceti Möbius module used for the native disc carrier. Heavy constructions remain fully specified in the README and are named in the closing Lean comment.

`metadata.toml` remains exactly `topic = "math.CV"`. The accepted packet, its reader and suggested file, the prior review report and `review.json` are unchanged. The next independent reviewer replaces the prior verdict.

## Resolution of the prior review

| Prior requirement | Result in this revision |
| --- | --- |
| `MeromorphicBasisMonodromy.identityMonodromy` | §0.5 specifies a basis of the genuine deleted-neighbourhood solution-germ space, meromorphic extensions, the deleted-domain guard and identity continuation around an actual small punctured loop on the full ordinary-point solution space. This carrier construction belongs in the README. |
| Cover projection, charts and topology comparison; three cover tests | The generic lifted atlas is already in current Tau Ceti. Scope names the native projection, complex manifold instances and local-diffeomorphism theorem, with the disc, annulus and overlap-transition checks. No replacement atlas is planned. |
| `PowerStabilizer.discConjugate` | §6.4 specifies the actual action `z ↦ C⁻¹(g(C(z)))`, preservation of composition/inversion and the resulting subgroup isomorphism. |
| `TriangleSupergroup.triangle`, `.orientation`, and two-area check | §6.8 specifies the determinant-one half-rotation matrix, the geodesic half-plane intersection, measurable covering translates and disjoint interiors, native hyperbolic measure, the two areas and the exclusion of the actual antiholomorphic reflection. The N=2 check gives π and π/2. |
| `ExceptionalCuspSet.horoballContainment` | §8.5 specifies the union of actual translated half-plane horoballs, its height `2N²M(1−ε)/π²`, and the effective threshold with all quantifiers. The exclusion specialization is M₀=2, ε=1/2. |
| Initial-value theorem weaker than the germ-space linear isomorphism | §0.2 specifies `solutionGerms E x₀ ≃ₗ[ℂ] (Fin n → ℂ)`, its complex-linear inverse and standard-jet basis. The Lean milestone states germ existence/uniqueness; the subspace and linear equivalence are construction targets in prose. |
| Companion correspondence only one way | §0.1 specifies the superdiagonal/last-row matrix and the full equivalence with analytic vector solutions. The constant vector (0,1) for y″=0 is a negative control. No admitted companion-space construction is introduced into Lean. |
| Pointed-cover Schwarz statement lacked lift and equality characterization | `PointedCover.extremal` now states the holomorphic based lift, its uniqueness on the disc, the derivative inequality and equality exactly for a rotation of the lift. §1.2 also states the reusable based-lifting API. |
| Many theorem targets only Lean specification comments | All remain exact README targets. The new Lean file contains only statements whose carriers exist at the pins, without pretending that the geometric, germ-space or continuation constructions are already present. This is the binding 12 October shape. |

The reviewed negative controls remain: the essential singularity `exp(1/z)`, removable scalar spike, centre pole, boundary pole, boundary Blaschke factor, missing constant phase, rotated exceptional set, genuine rational pole despite totalized division, and the matrix-action sign. The normalized Riemann-map comparison explicitly consumes `TauCeti.IsNormalizedRiemannMapOn`, with the domain-to-disc direction and reciprocal derivative.

## Ownership and library audit

Read the current ConformalMapping and FuchsianOrbifolds READMEs and suggested files, UniversalCovers' carrier/deck/lifting stages, DifferentialGeometry's cover-atlas scope, and the native complex universal-cover, Cayley and Shimizu modules. ConformalMapping L2–L4, UniversalCovers Stages 0–2 and FuchsianOrbifolds Layers 0, 2 and 3 are the named suppliers. Surface uniformization of the abstract analytic universal cover is a target here; planar Riemann mapping does not discharge it.

The two removals from the target list are:

1. `U0/cayley-coordinate`: `TauCeti.Analysis.Complex.UpperHalfPlane.Cayley` already owns the rational coordinate, native bijection and inverse identity. Its normalization and three tests are supplier agreements under scope.
2. `U0/cover-complex-structure`: `TauCeti.Geometry.Manifold.Instances.UniversalCover` already owns `TauCeti.UniversalCover.instChartedSpace`, `instIsManifold`, `isLocalDiffeomorph_proj` and the lift-regularity criterion `contMDiff_iff`; the complex specialization and topology/chart agreements are consumed under scope. General cover-atlas compatibility belongs to DifferentialGeometry Layer 2.3.

The generic Shimizu inequality is likewise consumed from `Subgroup.inv_le_abs_apply_one_zero_of_upperRightHom_mem` in `TauCeti.Analysis.Complex.Fuchsian.Shimizu`. §8.4 keeps only its roots-specific full-group matrix-entry consequence, including c=0. Hyperbolic areas use `(MeasureTheory.volume : Measure UpperHalfPlane)` and `UpperHalfPlane.volume_def`, not an invented area carrier or a nonexistent `UpperHalfPlane.volume` constant.

Screened the nine post-snapshot roadmaps by mathematical object and hypotheses, including nested OperatorTheory files: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Also screened Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Beyond the cover-atlas supplier, no overlap with the retained roots-cover, Schwarzian, hypergeometric or disc-growth targets was found. The library coverage audit marks the base ConformalMapping direction as built; this package extends it.

Read the native derivative/analytic, divisor/order/trailing-coefficient, circle-average/proximity/Jensen, ordinary hypergeometric, Gamma/digamma and normalized-map interfaces. The native proximity power law is reused; the new characteristic power target additionally compares the compact disc-local pole divisor. The local value-distribution wrappers require no global meromorphic extension.

Current read-only checkouts examined:

- TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`.
- Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

The elaboration build uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Current-only supplier modules were read, cited and never copied or built. No target was moved to a higher-tier roadmap.

## Source receipt and limits

Personally read the author-hosted published offprint of Calegari–Dimitrov–Tang, [The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), JAMS 38 (2025), 627–702, [DOI 10.1090/jams/1053](https://doi.org/10.1090/jams/1053), accessed 14 October 2026. SHA-256:

`867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`.

Read §1.1.6, p.632; the meromorphic-monodromy discussion and proof of Corollary 2.0.5, p.636; Lemma 2.3.1 and Remark 2.3.3 with their proofs, pp.639–641; all of §5, pp.667–678; and §6 through the uniform mean-growth argument, pp.679–684. Checked printed journal page numbers, not PDF page offsets. In particular, the Gauss-equation verification is in the proof of Lemma 5.1.16, p.672; the descended differential equation is (5.1.17), p.671. Corrected the fixed-puncture Tsuji locator to the opening of §6, pp.678–679, which follows Lemma 5.2.18 rather than preceding it.

No original Hempel, Abramowitz–Stegun, Goluzin, Carathéodory, Elstrodt–Grunewald–Mennicke, Tsuji or Kraus–Roth proof was independently read in this run. The README cites the verified CDT invocations and explicitly makes those mathematical inputs proof targets, including analytic continuation/parameter tails and effective fixed-level growth for the entire radius range. This receipt certifies the stated reading and source locations, not unread originals or a formal proof. The accepted plan's 15 proof gaps and eight requests remain mathematical work to carry out in the roadmap's named targets, rather than hidden or assumed inputs. No book files or source passages were copied into the repository.

## Adversarial mathematics pass

Checked all 96 numbered targets, the two supplier agreements, all definition APIs/checks and the Lean signatures. The grouped rows below cover every target subsection; they record the diagnostic instances and the retained or strengthened guards.

| Statements checked | Instances and denominators | Result/change |
| --- | --- | --- |
| Scope, conventions, native Cayley/atlas agreements | C(0)=i, C(1/2)=3i; z=1 outside the coordinate domain; disc versus nontrivial annulus; identity chart transition | Native coordinate direction, quotient topology and atlas compatibility fixed. The boundary coordinate is not assigned an interior value. |
| §§0.1–0.4: ODE, jets, companion, continuation, global solutions | n=0 excluded; n=1 constants; n=2 affine solutions; n=3 jet of x² is (0,0,2); coefficient 1/x at zero; nonzero a₀ with exp(−x); companion vector (0,1) fails y″=0 system | Positive order, connected open domain, complex analyticity, unscaled jet and germ/domain uniqueness retained. The full linear equivalence and companion correspondence are specified. |
| §§0.5–0.6: meromorphic basis and clearing | Ordinary point, c/x with pole order one, exp(1/x) with identity topological monodromy, deleted domain absent at α outside Ω, non-Galois-saturated algebraic image set | Actual deleted-neighbourhood guard and exhausting basis retained. Identity monodromy is weaker than the meromorphic-basis condition. Finite minimal-polynomial powers allow rational simultaneous clearing. |
| §§1.1–1.5: uniformization, pointed covers, radius, extremality, monotonicity | Empty/disconnected domains; ℂ∖{0}; identity and dilation by two; square map; based lift z↦az for norm a below/equal to one; normalized map z↦z/2 | Existence needs two omitted points and a component/base point. Surjectivity is an actual record field. Rotation equality and unique lift included. Radius is two for the radius-two disc and is the reciprocal domain-to-disc derivative. |
| §§1.6–1.11: roots covers, derivative, equivariance, descent, deck realization | N=0 gives an empty target; N=1 not hyperbolic; N=2 omits ±1; source boundary versus interior root-one value; z and −z give the same descended value; nonzero derivative at zero | N≥2 retained. Descent is an existence/uniqueness theorem, not admitted chosen data, and has derivative F′(0)^N. Actual topological deck transformations become the projective subgroup. |
| §§2.1–2.4: Schwarzian, chain rule, invariance, solution quotient | Affine map, x² at x≠0, inversion with weight x⁻⁴, critical point x=0, independent solution pair and nonzero denominator | Sign −3/(2x²), squared chain weight and coefficient one half in the ODE fixed. Analytic square roots are local with w′ nonzero. |
| §§2.5–2.9: accessory parameters, constraints, symmetric inverse equation | Infinity unpunctured versus a puncture; cancellation of X⁻¹,X⁻²,X⁻³; N=2 gives S(ψ₂)(0)=3/2; roots excluded from rational denominator | Distinct finite punctures, infinity convention, branch descent/rationality and normalized solution quotient remain explicit proof obligations. |
| §§3.1–3.3: factors/products/zero removal | a=0, a=±1, empty product, double zero at zero, boundary-only product, g=z−1 | Boundary factors are constants. Strict disc image requires a positive interior multiplicity. Boundary zeros survive zero removal; no zero-free closed-disc assertion is made for them. |
| §§3.4–3.9: Herglotz, derivative, phase, smoothing, quotient and optimality | g=i, g=h=1, boundary zero g=z−1, g=0 handled separately, R>0 and evaluation strictly inside | Constant phase i is required. Bounds are on logarithmic suprema. Radius enlargement avoids boundary zeros. Native closed-disc Jensen suffices, avoiding a forward Layer 7 dependency. |
| §§4.1–4.8: Gauss/transformed equations, germs and continuation estimates | a₊=3/4,a₋=1/4 for N=2; quotient coefficient 1/4; J₂‴(0)=3/2; denominator one at zero; ψ(1)=−γ; a=1/2,k=1 gives 2 log 2−1 | Native convergence disc and pole exclusions retained. Continued branches are compared on an overlap. The leading constant is −2γ−2ψ(a) and the coefficient uses k+1. Added M₀>0 explicitly to the uniform remainder. |
| §§5.1–5.8: Gamma radius, positivity, cusp limit, log-Gamma, odd zeta, positive remainder | N=1 totalized value zero; N=2 and 3 Gamma values; positive Gamma arguments for N≥2; N⁻³,N⁻⁵ log terms and positive N⁻⁶ exponential term | All denominator nonvanishing arguments retained. The remainder is positive and uniformly O(N⁻⁶). Existential Lean constants do not by themselves encode the README's effectivity. |
| §§6.1–6.8: polygon, full primitive cusp, free group, power group, quadrilateral, half rotation, triangle | N=2 gives h₂=2 and areas 2π,π,π/2; nontrivial rotation fixes i so is not a deck transformation; N=3 at τ=2i; antiholomorphic reflection | The displayed matrix gives ζ₃⁻¹/3 after Cayley inversion, with value −1/6−i√3/6. The full cusp stabilizer, projective sign independence, actual regions and native measure are required. Half rotation of either sign gives the same involution after squaring. |
| §§7.1–7.4: local divisor/count/characteristic and regularity criteria | f=1/z has N_D=log r<0 and T_D=0; constants and identity; boundary pole at r=norm a; scalar spike value two versus punctured limit one | Centre correction and open-disc criterion retained. Continuity of the scalar representative is required for pointwise analyticity; a totalized centre value is insufficient. |
| §§7.5–7.11: local circle integrability, Jensen, first main, translation, powers, monotonicity | f=az with nonzero a; identically f=a excluded from the translated theorem; n=0 power law; 0<r≤ρ<1 | Uses the actual finite nonzero trailing coefficient and zero-minus-pole sign. Added positive radius and nonzero germ at zero explicitly to integrability. No global extension is assumed. |
| §§8.1–8.4: uniform cusp ratio/height, horoball and Shimizu consequence | Positive M₀; 0<ε<1; identity matrix and D=1; matrix and its negation; a²+c²>0; c=0 versus c≠0 | Diameter is 2/(1+D(a²+c²)), with reciprocal bound. Specified the precise closed horodisc intersection with 𝔻 and excluded tangent point. Native Shimizu and the full stabilizer cover both cases. |
| §§8.5–8.7: exceptional sets, exclusion, maximum growth | M>0 excludes zero; large values go into sS, not S; M=N/(1−r); threshold N>A; r approaching one | Exact translated horoballs and effective quantifiers retained. Diameter ≤A(1−r)/N yields exclusion. The maximum theorem is only large N; no claim for all N≥2 is inferred from this proof. |
| §§9.1–9.6: kernel, L1 logarithm, entropy, derivative bound and small-radius transfer | Constant g=1; 0<r<R; entropy region of zero measure; ρ=max(r,1/4); r=3/4 gives R=7/8 | Probability mean, constant log 2+1/e and nonzero g/r/R−r guards fixed. Outer radius is (1+r)/2, ensuring ρ<R. |
| §§9.7–9.10: pivot and lower bound | p₂(2)=4/3; partial fraction (2/2)(1+1/3)=4/3; root one has totalized value zero but order −1; z=0 chain identity; f=1−F_N^N | Factor 1/N and chain-identity sign fixed. Cover étaleness and omitted roots make its denominators nonzero; lower bound uses the native characteristic power law plus the local divisor. |
| §§9.11–9.19: fixed-level bounds, equivalent means, reciprocal derivative, pivot upper bound, absorption and completion | F_N zeros simple; f=1−F_N zero-free; leading coefficient of F_N^N−1 is −1; 0<r≤1/4; N/(N−1)≤2; finite levels below N₀ | Correct Tsuji invocation locator. Fixed-level constants must cover small radii and be effective. Large-level constants are combined with their finite maximum; final estimates hold for every N≥2 and any source rotation. |

The packet remains read-only. Its Cayley/atlas ownership and the strengthened radius/domain/trailing-coefficient statements should be reconciled if a later job updates that input; this revision makes the package's intended statements explicit without silently editing the accepted plan.

## Validation and next step

- `lean-check research/blueprint/packages/ConformalMappingPartII/Suggested.lean`: **exit 0**, no errors, **53 warnings**, all `declaration uses sorry`; no other diagnostics. Final Lean SHA-256: `37c8dc05bbb68022782b245776b415f4d1a61a8fed2338c5709270d5a381e9ee`.
- Memory was checked before elaboration (over 20 GiB available). Each Lean run was serial and used the shared pinned build; no language server, Lake update/build/cache operation or read-only-checkout build was run.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ConformalMappingPartII.json`: **0 errors, 0 warnings**, 98 nodes, 68 API items, 54 unit tests. This validates the unchanged accepted input, not a formal proof of the package.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ConformalMappingPartII/Suggested.lean`: **exit 0**, no offenders.
- README target/API/test inventory, per-layer shape, native-supplier mappings, metadata, private-path, intake and whitespace checks passed. Elaboration establishes typing of the admitted statements, not their mathematical truth.

No package-writing work remains. Resume with an independent review against the binding 12 October shape, checking the full construction interfaces in the README and the typed representative milestones in Lean. Formal proofs, continuation constructions and effective constants are work for the resulting roadmap's contributors.
