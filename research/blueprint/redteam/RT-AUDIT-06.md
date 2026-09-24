# RT-AUDIT-06 — red team of library audit AUDIT-06

**Result: 69 findings — 3 high, 28 medium, 38 low.** Every cited declaration exists at the pins.
The three high findings each change what gets built:

- **FuchsianOrbifolds layer 2.** It says no covolume of a Fuchsian group exists, but Mathlib's generic `MeasureTheory.covolume` is
  exactly that.
- **FuchsianOrbifolds layer 3.** It says Mathlib literally has the full cusp stabilizer wℤ, but Mathlib has only the lattice of
  translations.
- **AnalyticNumberTheory AN.3.** It cites three private declarations for contour-shift bookkeeping, and misses Tau Ceti's residue
  theorem and argument principle.

The most common medium error is library material marked absent because the audit searched only the roadmap's own directories.

**Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1562).

**Target:** `AUDIT-06`, the library audit of four roadmaps: OneParameterSemigroups, FuchsianOrbifolds, OptimalTransport and
AnalyticNumberTheory. It is read as it stands after its review's 46 corrections (`REV-AUDIT-06`).

**Baseline:** tauceti `f790474` and mathlib `082e2d3`, both read at exactly those commits.

**Eligibility:** `cc-2aeb03` wrote neither `AUDIT-06` nor its review.

## Method

- **Every declaration claim.** All 702 `declarations` entries (351 targets, 50 layers) were
  located at the pins. Mathlib was read at `082e2d3`, and Tau Ceti with `git show f790474:<file>`. All exist at the cited line.
  Four are anonymous Tau Ceti instances, cited under their auto-generated names, in FuchsianOrbifolds layer 0; each was read at
  its line.
- **What each declaration says.** For every target marked `mathlib`, `tauceti`, `both` or `partial`, each cited declaration was
  read at the pin and compared with the target and the note: generality, hypotheses, privacy and the `fit` label.
  - For the built layers of OneParameterSemigroups, the Tau Ceti files behind every cited file were checked for `sorry` and
    axioms; none has either.
- **The absence claims.** Every target marked `absent` and every `not built` layer was searched for in both libraries under
  other names, outside the roadmap's own directories as well as inside them.
- **Verdicts, summaries and duplicates.** Each layer verdict was checked against its targets, each roadmap summary against its
  layers, and each `duplicates` entry against the atlas and the other roadmaps' stages.

No Lean was run. Whether an instance applies was judged by reading its hypotheses at the pin.

## Findings


### tauceti:TauCetiRoadmap/OneParameterSemigroups — 9 findings (2 medium, 7 low)

- **RT-AUDIT-06/1** (other, low). Both targets bound the resolvent of the generator, R(λ,A) = LinearPMap.resolvent S.generator λ. The citations labelled 'exact' bound a different operator, the Laplace-integral operator S.resolvent hb λ hλ (ContractionSemigroup.resolvent_norm_le likewise). The two agree only through the bridge generator_resolvent_eq, which is not cited for these targets.
- **RT-AUDIT-06/2** (other, low). The complex target cites complexify (a semigroup on Complexification X) and complexGenerator and isClosed_complexGenerator.
- **RT-AUDIT-06/3** (library-claim, low). StronglyContinuousSemigroup.ofMultiplication_generator is labelled fit 'exact' for the multiplication-semigroup example.
- **RT-AUDIT-06/4** (library-claim, medium). The target is labelled `tauceti` and cites only Tau Ceti declarations, but Mathlib at 082e2d3 already contains the Kolmogorov (Moore–Aronszajn) decomposition, in greater generality: operator-valued positive-semidefinite kernels on an arbitrary index type, with density of the kernel vectors and uniqueness up to isometry.
- **RT-AUDIT-06/5** (error, medium). The target is labelled `tauceti`, yet its own note says 'the identifications are not recorded as separate named statements'. Two of its three checks are stated nowhere in Tau Ceti.
- **RT-AUDIT-06/6** (library-claim, low). The target is labelled `tauceti`, but Mathlib at 082e2d3 states the conversion itself: the characteristic function of a measure is its 2π-convention (fourierChar) Fourier integral at −(2π)⁻¹ t. The Tau Ceti lemma restates it in the fourierAtom notation.
- **RT-AUDIT-06/7** (library-claim, low). (a) The target cites a private declaration, `TauCeti.exists_probabilityMeasure_integral_fourierAtom_eq`, as 'exact', although public theorems proved by the same route exist.
- **RT-AUDIT-06/8** (error, low). The target is marked 'exact' with no warning, but the roadmap's composition claim is false for the roadmap's own IsCompletelyMonotone (C^∞ on the closed [0,∞)), just as the audit says of the Bernstein milestone's converse.
- **RT-AUDIT-06/9** (other, low). The summary says 'Mathlib contributes only AbsolutelyMonotoneOn, LinearPMap, charFun and Matrix.PosSemidef'. For parts B and C this is not accurate.

### tauceti:TauCetiRoadmap/FuchsianOrbifolds — 18 findings (2 high, 7 medium, 9 low)

- **RT-AUDIT-06/10** (library-claim, high). The note says 'What is absent is a `covolume` of a Fuchsian group ...; grep for `covolume` finds only `ZLattice.covolume`', and the roadmap summary lists covolume among what is 'genuinely missing' ('no hyperbolic polygons, Gauss--Bonnet, Poincaré polygon theorem, Dirichlet domains, triangle groups or covolume'). Both are false: Mathlib defines the covolume of an arbitrary group action with a fundamental domain, which applied to Γ acting on ℍ with UpperHalfPlane.volume is exactly the covolume of a Fuchsian group, together with the `HasFundamentalDomain` class and the theorem that any fundamental domain computes it;
- **RT-AUDIT-06/11** (library-claim, high). The note says 'the key statement it demands — "the conjugated full stabilizer is exactly wℤ" — is literally Mathlib's `strictPeriods_eq_zmultiples_strictWidthInfty` together with `strictWidthInfty_pos`', and cites both with fit 'exact'. That is false on two counts.
- **RT-AUDIT-06/12** (library-claim, medium). Mathlib's whole cusp API (`IsCusp`, `cuspsSubMulAction`, `CuspOrbits`, `strictPeriods`, `strictWidthInfty`) takes a `Subgroup (GL (Fin 2) ℝ)`. The roadmap's public Fuchsian input is a `Subgroup PSL(2,R)` ('A subgroup of `PSL(2,R)` is the public Fuchsian-group input'), and every Tau Ceti Fuchsian declaration uses that carrier.
- **RT-AUDIT-06/13** (missing, medium). The target is marked 'absent', but its topological half is in Mathlib: the coarse quotient Γ\ℍ of a properly discontinuous action on a locally compact Hausdorff space is Hausdorff by a Mathlib instance, and it is second countable by a Mathlib theorem.
- **RT-AUDIT-06/14** (missing, medium). The target is marked 'absent', and the note says the level-one valence formula is the closest material, encoding the m-fold relation 'for the level-one group only'. But the local order formula the target names is already proved in the model chart, for holomorphic and for meromorphic functions.
- **RT-AUDIT-06/15** (library-claim, medium). The note credits Mathlib with the whole chain and says 'Missing is only the *pole* branch', citing `exp_decay_of_zero_at_inf` for the zero branch.
- **RT-AUDIT-06/16** (missing, medium). The note says 'the elliptic points `i` and `ρ` are identified with their stabilizer orders through the valence formula' and cites `UpperHalfPlane.norm_eq_one_of_mem_ellipticPoints`, which only says the three points lie on the unit circle.
- **RT-AUDIT-06/17** (duplicate, medium). The layer's duplicates record ModularForms 10B, FunctionFieldArithmetic FA.3 and BelyiMaps 8, but not the AlgebraicTopology roadmap, which plans the very inputs that layer 5's first target lists as mathematics of this layer.
- **RT-AUDIT-06/18** (duplicate, medium). The record says BelyiMaps layer 4 covers triangle groups, 'their presentation and uniqueness up to PSL(2,ℝ)-conjugacy; that is the same target as item 6 of this layer, and the two roadmaps should agree on a single owner'. BelyiMaps layer 4 plans no uniqueness up to conjugacy: it cites Remark 2.29 only as a source.
- **RT-AUDIT-06/19** (library-claim, low). `isCoveringMapOn_npow` is labelled fit 'exact' for 'local biholomorphism away from zero', but it is a topological statement: covering map on {0}ᶜ, hence a local homeomorphism.
- **RT-AUDIT-06/20** (library-claim, low). The note calls `discCoordinateEquiv` 'the Cayley biholomorphism ℍ ≃ unit disc' and cites it with fit 'exact', then says its holomorphy is not stated '(only that it is an `Equiv` with continuous coercions)'. At the pin it is a bare `Equiv`: DiscCoordinate.lean proves no continuity of `discCoordinate` or its inverse, and no other file does.
- **RT-AUDIT-06/21** (other, low). Two cited declarations are private: `SubMulAction.isQuotientMap_powRestrict` (fit 'exact') and `TauCeti.ModularForm.quotientFunc_T_pow_apply` (fit 'related'). Private declarations cannot be used outside their file.
- **RT-AUDIT-06/22** (library-claim, low). The note says 'Finiteness is available only indirectly: `surjective_cosetToCuspOrbit` ... giving finiteness for finite-index subgroups of `SL(2,ℤ)`'. Mathlib states finiteness directly as an instance, right after the surjectivity lemma.
- **RT-AUDIT-06/23** (other, low). The note says 'nothing connects `UpperHalfPlane.volume` to a `MeasureTheory.Measure.riemannianVolume` or to the metric Mathlib puts on ℍ'. This reads as if `riemannianVolume` existed.
- **RT-AUDIT-06/24** (other, low). The note says 'The only Riemann--Hurwitz anywhere in the atlas is the function-field/valuation-theoretic one planned in FunctionFieldArithmetic FA.3'. That is false, and it contradicts the same layer's duplicates, which record ModularForms 10B's analytic Riemann-Hurwitz.
- **RT-AUDIT-06/25** (library-claim, low). The note calls `qParam_left_inv_mod_period` qParam's 'h-periodicity' and labels it fit 'exact'. It states that invQParam ∘ qParam is the identity modulo hZ, which is injectivity modulo the period, not invariance of q under translation, and Mathlib has no periodicity lemma for qParam.
- **RT-AUDIT-06/26** (missing, low). Related library material that the builder should start from is not cited on these partial or absent targets.
- **RT-AUDIT-06/27** (other, low). The note, as corrected by the review, says 'the corresponding `PSL(2, ℤ)` instance is at line 189'. At the pin the instance is declared at line 188; line 189 is its first field.

### tauceti:TauCetiRoadmap/OptimalTransport — 29 findings (14 medium, 15 low)

- **RT-AUDIT-06/28** (library-claim, medium). The note says: 'The atom obstruction is proved only in its `mongeCost = ∞` form, for a target null on singletons' and lists as missing 'the general inequality `ν({T x}) ≥ μ({x})`'. That is false.
- **RT-AUDIT-06/29** (library-claim, medium). The target is marked 'tauceti', all five citations are 'exact', and the note says the transform is 'Built with the prescribed `EReal`-style extended codomain'. Roadmap Layer 2 item 2 asks for 'the finite-real and extended-cost infimal `c`-transform interfaces'. The audit's target text drops 'extended-cost'. Tau Ceti builds only the finite-real-cost slice, and its own docstring says the extended-cost interface is not built.
- **RT-AUDIT-06/30** (library-claim, medium). Roadmap Layer 1 item 4 ends 'Include a reusable theorem for costs bounded below by integrable marginal terms'. The audit's target text omits this half.
- **RT-AUDIT-06/31** (missing, medium). The target is marked 'absent'. The note says that 'Mathlib/Analysis/Convex/ has no conjugate file' and that the OT Rockafellar potential is 'not the classical cyclically-monotone-set theorem on a dual pair'. Two of the seven pieces are in the libraries.
- **RT-AUDIT-06/32** (error, medium). The note says the target is 'blocked twice over: it needs the PDE roadmap's weighted Sobolev spaces and Rellich--Kondrachov, which are also unbuilt'. This misstates the prerequisites.
- **RT-AUDIT-06/33** (error, medium). The summary says 'Layers 0--4 are largely done', lists 'the whole `c`-transform/`c`-concave/contact-set tower' among the built material, says of Layer 5 on that 'only the Gaussian matrix toolkit exists ... everything else is missing', and closes with 'Within Layers 0--4 the notable residual gaps are ...'. That list omits whole absent targets of the audit's own layers: Layer 4 has four of its six targets absent (T2 is in the list as Pratelli, but T3 the AGS graph-plan theorem, T4 the abstract twist theorem and T5 measurable selection with a.e. uniqueness are not), and Layer 2 T7 (the post-Villani Borel-cost regimes) and Layer 3 T11 (the measured-metric carrier) are absent.
- **RT-AUDIT-06/34** (library-claim, low). `TauCeti.rockafellarPotential` is cited with fit 'exact' in L2 T9 and 'related' in L5 T0, but it is a `private def`. It is not usable under that name outside its file, and its file says the potential is deliberately exposed only through the existential representation theorem.
- **RT-AUDIT-06/35** (missing, low). The target explicitly includes 'a reusable theorem that analytic subsets of a Polish space are measurable in η.completion', and the note says the target is 'Built exactly as specified'. But the three citations are all c-transform-specific.
- **RT-AUDIT-06/36** (library-claim, low). The note says 'basepoint independence is the "for one ⟺ for every" form', which points at the cited `hasFiniteMoment_iff_forall_hasFiniteMoment_iff_wassersteinEDist_ne_top`. That theorem does not state basepoint independence.
- **RT-AUDIT-06/37** (missing, low). The target lists 'generalized inverse, pushforward of uniform measure', and the note says only that 'The coupling is constructed from Mathlib's `ProbabilityTheory.cdf`'. Both pieces are separate Tau Ceti theorems, and neither is cited: the generalized inverse with its Galois characterization and measurability, and inverse transform sampling (the quantile pushes the uniform law on (0,1) forward to μ). A worker would not learn from the audit that these two of the four sub-items are done.
- **RT-AUDIT-06/38** (error, low). The note says 'no declaration in either library mentions Kantorovich--Rubinstein'. Two Tau Ceti declarations do.
- **RT-AUDIT-06/39** (missing, low). The note says 'there is no measurable-selection layer in the OT tree (the Jankov--von Neumann uniformization that Layer 8 also needs is likewise missing)'. That is true, but the case this item needs does not require uniformization: the contact set has singleton fibres.
- **RT-AUDIT-06/40** (other, low). All five citations are 'exact', and the note presents finite-chain gluing as done.
- **RT-AUDIT-06/41** (missing, low). The audit turns the acceptance checks of Layers 0 and 1 into targets (L0 T7, L1 T7) but has no acceptance-check target for Layers 3, 4 and 5, although each of these roadmap stages ends with an 'Acceptance checks:' paragraph.
- **RT-AUDIT-06/42** (library-claim, medium). The target is marked 'absent' ('Absent. ... the uniformization theorem itself and the whole dynamic-plan layer are missing'). Its first two components are in Mathlib at the pin: the space of continuous maps C(X, Y) carries the Borel sigma-algebra of the compact-open topology as an instance, every evaluation map f ↦ f x is measurable, and for second-countable locally compact X and second-countable regular Y that sigma-algebra is the one generated by the evaluations, with the criterion 'g : Z → C(X, Y) is measurable iff every z ↦ g z x is'. C(X, Y) is also second countable and complete.
- **RT-AUDIT-06/43** (library-claim, medium). The target is marked 'absent' with the note 'Absent; neither library has the Skorokhod space.' The Skorokhod space and the Abedi--Li--Schultz theorems are indeed absent, but two of the four named components are in Mathlib.
- **RT-AUDIT-06/44** (library-claim, medium). The target is marked 'absent' with the note 'Absent.' Roadmap item 4 asks to 'first build continuous positive-definite and universal-kernel predicates on compact spaces', and the audit's paraphrase of the target leaves that step out.
- **RT-AUDIT-06/45** (duplicate, medium). Layer 13 has no duplicates, and 13A lists only its own parent layer.
- **RT-AUDIT-06/46** (duplicate, medium). Layer 6 records no cross-roadmap duplicates, and 6C records only its parent.
- **RT-AUDIT-06/47** (duplicate, low). Layer 11 lists OneParameterSemigroups Part A as a consumption boundary, but not the PDE roadmap, which it names twice.
- **RT-AUDIT-06/48** (library-claim, medium). The note says 'Absent; neither library defines Γ-convergence in any form', and the summary lists 'no ... Γ-convergence'. Abstract Γ-convergence is indeed absent.
- **RT-AUDIT-06/49** (library-claim, medium). The target cites `TauCeti.realPlans_nonempty`, which is a `private` theorem.
- **RT-AUDIT-06/50** (other, medium). These three targets are marked 'partial', but in each case the target's own note says that nothing of the target exists, only inputs the layer consumes.
- **RT-AUDIT-06/51** (library-claim, low). Four citations carry fit 'exact' although they are not the target or any named part of it.
- **RT-AUDIT-06/52** (missing, low). Roadmap Layers 8, 9 and 12 say to consume 'metric curve length, length spaces, and constant-speed geodesic spaces from the shared API owned by the Hopf--Rinow roadmap, Layer 4'. That metric API is built in Tau Ceti at the pin, in exactly the file the Hopf--Rinow roadmap names.
- **RT-AUDIT-06/53** (library-claim, low). The note says 'Mathlib defines `AbsolutelyContinuousOnInterval` for curves in a pseudometric space, with bounded variation and a.e. differentiability'. The definition and the bounded-variation theorem hold for pseudometric targets, but Mathlib proves a.e. differentiability only for real-valued functions.
- **RT-AUDIT-06/54** (missing, low). Several targets marked 'absent' with bare notes leave out library results that a builder would consume directly.
- **RT-AUDIT-06/55** (other, low). The three sub-layer entries have one copied note and one copied pair of citations (`TauCeti.Coupling`, `InformationTheory.klDiv`), which do not match the items they cover. 13B ('items 7--10') says 'Only the two ingredients — the bundled coupling space and Mathlib's klDiv — exist', but the parent layer's own entries for items 8 and 10 are 'partial' and cite `TauCeti.TransportMatrix`, Mathlib's `doublyStochastic` and Birkhoff's theorem, and `finiteDualValue_eq_kantorovichDualValue`. 13C…
- **RT-AUDIT-06/56** (other, low). The summary says 'From Layer 5 on, only the Gaussian matrix toolkit exists ...; everything else is missing.' That contradicts its own previous sentence, which credits Mathlib with klDiv's chain rule and data processing (Layer 11), Arzelà--Ascoli and metric AC curves (Layer 8), the Brownian predicates (Layer 13) and ghDist and levyProkhorovEDist (Layer 15). It also contradicts the 'partial' targets of Layers 8, 9, 11, 12, 13 and 15. It omits the general inputs found in this red team: Mathlib's Borel structure on C(X, Y), BV curves with their variation measures, positive-semidefinite kernels and RKHS;

### AnalyticNumberTheory — 13 findings (1 high, 5 medium, 7 low)

- **RT-AUDIT-06/57** (library-claim, high). All three cited declarations are `private` to TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean.
- **RT-AUDIT-06/58** (missing, medium). Both notes leave out the general contour tools that exist, so they overstate how much of the route has to be built.
- **RT-AUDIT-06/59** (missing, medium). Mathlib already proves the analytic input of PNT and of PNT in a fixed progression.
- **RT-AUDIT-06/60** (error, medium). The note misstates what the cited Mathlib lemma `ArithmeticFunction.vonMangoldt.not_summable_residueClass_prime_div` proves.
- **RT-AUDIT-06/61** (library-claim, medium). The target is marked `absent`, with the note 'Absent from both libraries'. Tau Ceti has at the pin the L-series half for completely multiplicative characters on ideals.
- **RT-AUDIT-06/62** (missing, low). The note says 'there is no Artin L-function'. Tau Ceti builds, for any degree-one character χ of Gal(L/K), its Frobenius coefficients as a multiplicative ideal weight.
- **RT-AUDIT-06/63** (other, medium). The summary disagrees with the libraries on the points above.
- **RT-AUDIT-06/64** (library-claim, low). The cited `NumberField.Chebotarev.finite_ramifiedPrimes` is `private`. Its own docstring directs consumers to the public Finset and membership lemma instead.
- **RT-AUDIT-06/65** (library-claim, low). Several fit labels say `exact` for declarations that do not provide the target.
- **RT-AUDIT-06/66** (error, low). The note says 'Tau Ceti adds only a decay-weight application (`TauCeti/NumberTheory/AbelSummation.lean`)'. Tau Ceti also has Abel summation for sums indexed by ideals or prime ideals and cut off by the norm, with the exact π/ϑ identities.
- **RT-AUDIT-06/67** (missing, low). Three built targets lack the declaration that provides the part their title names.
- **RT-AUDIT-06/68** (missing, low). The note says only that 'Mathlib has `ArithmeticFunction.sigma` but no divisor-summatory asymptotic'. Mathlib also has Dirichlet's exact identity ∑_{n≤N} d(n) = ∑_{n≤N} ⌊N/n⌋, the general convolution partial-sum identity behind it, and a TODO for the hyperbola method.
- **RT-AUDIT-06/69** (error, low). The note's formula `expZeta a s = Φ(e^{2πia},s,1)` is off by a factor z = e^{2πia}. Mathlib's `expZeta a s` continues ∑_{n≥1} e^{2πina}/n^s = Li_s(z), whereas Φ(z,s,1) = ∑_{n≥0} z^n/(n+1)^s. So expZeta a s = z·Φ(z,s,1).


## For the verifier and the fixer

The three high findings were checked at the pins:

- **FuchsianOrbifolds layer 2.** Mathlib `082e2d3` has `MeasureTheory.covolume`
  (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:679`), the volume of a fundamental domain of any action, and
  `IsFundamentalDomain.covolume_eq_volume` (`:695`). The latter needs `Countable G`, `MeasurableConstSMul` and
  `SMulInvariantMeasure`. Tau Ceti `f790474` provides the last two for `PSL(2, R)` acting on ℍ
  (`TauCeti/Analysis/Complex/UpperHalfPlane/PSLAction.lean:145` and `:153`). What remains missing is the existence of a
  fundamental domain for an arbitrary discrete group, which Mathlib records as a TODO (`:654`).
- **FuchsianOrbifolds layer 3.** Mathlib's `Subgroup.strictPeriods` (`Mathlib/NumberTheory/ModularForms/Cusps.lean:227`) is
  "the additive group of `x : R` such that `[1, x; 0, 1] ∈ 𝒢`": the translations, not the full stabilizer of ∞.
  `strictWidthInfty_pos` (`:402`) assumes `[𝒢.IsArithmetic]`. The general form is `strictWidthInfty_pos_iff` (`:379`).
- **AnalyticNumberTheory AN.3.** The three cited declarations are `private` in
  `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean` (`:321`, `:329` and `:356`), and so is their integrand
  `perronFn` (`:258`). `TauCeti.Contour.classicalResidueTheorem_starConvex` and `argumentPrinciple_starConvex` are public, at
  `TauCeti/Analysis/Contour/StarConvex.lean:193` and `:210`. No file under `TauCeti/Analysis/Contour/` contains `sorry`.

Several findings apply a precedent set by the audit's own review, and say so. In particular, an acceptance-check target whose
identifications are not stated as declarations is `partial`, as in the review's correction to OptimalTransport layer 0.

The fixes are to notes, `library`/`fit` labels, cited declarations, the `duplicates` records and the summaries, as each finding
states. No layer verdict changes, except for the two OneParameterSemigroups layers whose acceptance-example target becomes
`partial`.
