# RT-AUDIT-08 — red team of library audit AUDIT-08

**Result: 63 findings — 1 high, 35 medium, 27 low.** Every cited declaration exists at the pins.
Most of the findings are absence claims that the libraries contradict. Two layer verdicts should change from `not built` to
`partly built`:

- ArakelovGeometryAndAbelianHeights R35.1, whose product-formula target is in Mathlib exactly;
- AbelianSchemesAndArithmeticModuli A5, whose Riemann bilinear relations Tau Ceti proves.

In ArithmeticDynamics, the `partly built` verdicts of DY.0 and DY.1 have no fully present target. Either their targets or
their verdicts need to be made consistent (RT-AUDIT-08/61, low).

**Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1566).

**Target:** `AUDIT-08`, the library audit of five roadmaps, accepted by `REV-AUDIT-08` on 16 September 2026:

- `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries`;
- `AbelianSchemesAndArithmeticModuli`;
- `AnabelianGeometryAndNonabelianChabauty`;
- `ArakelovGeometryAndAbelianHeights`;
- `ArithmeticDynamics`.

**Baseline:** tauceti `f790474` and mathlib `082e2d3`, both read at exactly those commits.

**Eligibility:** `cc-2aeb03` wrote neither `AUDIT-08` nor `REV-AUDIT-08`.

## Method

- **Every declaration claim.** All 281 `declarations` entries (147 targets, 38 layers) were
  located at the pins, Mathlib at `082e2d3` and Tau Ceti with `git show f790474:<file>`. All exist in the cited file at the
  cited line.
- **What each declaration says.** For every target marked `mathlib`, `tauceti` or `partial`, each cited declaration was read
  at the pin and compared with the target and the note: generality, hypotheses and the `fit` label.
- **The absence claims.** Every target marked `absent` and every `not built` layer was searched for in both libraries under
  other names. The findings name the declarations found, with file and line at the pin.
- **Verdicts, summaries and duplicates.** Each layer verdict was checked against its targets, each roadmap summary against its
  layers, and each `duplicates` entry against the atlas: does it plan the same mathematics, or only consume it?

Each roadmap was attacked separately. The `checked` field of the result file records what was read, roadmap by roadmap.

## Findings


### tauceti:TauCetiRoadmap/ArithmeticDirichletSeries — 12 findings (4 medium, 8 low)

- **RT-AUDIT-08/1** (library-claim, medium). TauCeti.EulerProductData is cited with fit 'exact' for a target that requires it to store 'the prime-power local series, finite bad set, and hypotheses needed to transport the ideal product', and the note reports the package as present without qualification.
- **RT-AUDIT-08/2** (error, medium). The note says there is no `HasDirichletDensity (higherDegreePrimes K) 0` 'since Layer 7's predicate does not exist yet'. That is false.
- **RT-AUDIT-08/3** (error, medium). The note says 'The two prerequisites the roadmap names are now in place: the ideal Euler product of ζ_K on Re s > 1, and the uniform bound on the higher-degree-prime contribution', and cites primeIdealZetaSum_higherDegreePrimes_le for the second.
- **RT-AUDIT-08/4** (library-claim, medium). The summary says Mathlib contributes the ambient APIs 'but nothing ideal-indexed'. That is false at the pin.
- **RT-AUDIT-08/5** (error, low). The note says 'Estimates.lean imports no continuation and no Dedekind pole'. The second half is false.
- **RT-AUDIT-08/6** (other, low). The Layer 8 T2 note calls the missing abscissa equality 'the one gap in an otherwise finished layer', and the summary says Layer 8 is complete 'but for the ordinary-versus-absolute abscissa equality'. Yet the same layer's T4 (the cancellation rejection test) is marked 'partial', with the note that 'there is no declaration asserting the failure of HasCancellation'. Layer 8 therefore has two gaps, and the second depends on Layer 6.5.
- **RT-AUDIT-08/7** (library-claim, low). The note says the generalized-weight route primePowerSummatory_isLittleO_of_le_higherPrimePowerWeight 'demands nonnegativity, support and the growth bound as the layer requires'. It does not.
- **RT-AUDIT-08/8** (library-claim, low). exists_differentiableOn_exp_eq_LSeries is labelled fit 'exact', but it is narrower than the target in two ways.
- **RT-AUDIT-08/9** (missing, low). Two problems in the notes.
- **RT-AUDIT-08/10** (missing, low). The note names only Tau Ceti's finite Abel identity as the machinery available.
- **RT-AUDIT-08/11** (duplicate, low). Chebotarev layer 11.3(2) plans the residue-degree-above-one discard estimate as its own named theorem: O(√x) such primes below x, and weighted sum o(x). This is Layer 5.3's content, already proved here as primeTheta_higherDegreePrimes_isLittleO.
- **RT-AUDIT-08/12** (missing, low). Roadmap 5.1 asks for 'reusable polynomial bounds for ideal counts and the number of prime powers at most x'. The audit's Layer 5 targets cover only the ideal-count half.

### AbelianSchemesAndArithmeticModuli — 13 findings (1 high, 9 medium, 3 low)

- **RT-AUDIT-08/13** (missing, high). The target is marked library 'absent' with the note 'Absent.
- **RT-AUDIT-08/14** (library-claim, medium). The note ends 'The abelian-variety side and the equivalence itself are absent, as is any restriction to the weight `-1` types the layer names', and it cites only the generic polarization API (all fit 'related'). Tau Ceti has a weight-one sub-library that this reading misses.
- **RT-AUDIT-08/15** (missing, medium). The note says 'There is no Siegel upper half space in either library ... and no universal family', and cites nothing.
- **RT-AUDIT-08/16** (other, medium). A5 is verdicted 'not built'. Once the corrections above are made, two of its five targets are partial with real Tau Ceti content: the Riemann bilinear relations, and the Hodge side of the equivalence including the weight-one dictionary and the Tate twist to weight -1. A third has substantial related material (the period domain as Siegel space, the monodromy group). The audit's own calibration makes A3 'partly built' for three partial field-case targets (REV-AUDIT-08: 'the same kind of…
- **RT-AUDIT-08/17** (library-claim, medium). The target cites only field-level material: AbelianVariety.IsIsogeny over a field, and the function-field elliptic degree.
- **RT-AUDIT-08/18** (missing, medium). The notes say isogenies of abelian varieties 'carry no degree' (A3), that nothing is proved about the 'rank' of [n] (A3), and that there is 'no degree of an isogeny of abelian varieties (only the dimension-one TauCeti.Isogeny.degree of elliptic curves ...)' (A6). Mathlib defines the rank (degree) of a morphism of schemes over an arbitrary base and proves the facts the rank target is phrased in.
- **RT-AUDIT-08/19** (library-claim, medium). The same declaration is labelled 'more general' under A3 and 'related' under A4 for the same imported content, and neither label is right.
- **RT-AUDIT-08/20** (library-claim, medium). The A2 note states 'No Picard functor, Picard scheme or `Pic` of a scheme exists in either library — the only `Picard` declarations in Mathlib are `IsPicardLindelof` for ODEs'. The A0 note says 'neither library has ... a Picard functor or Picard scheme (the nearest object is Tau Ceti's `LineBundleClass X` ... still without inverses)'. The summary says there is no 'Picard functor ... anywhere'. All three are false as written.
- **RT-AUDIT-08/21** (library-claim, medium). The summary asserts there is no 'relative dimension ... anywhere', and the A1 note says 'no relative-dimension function exists'. Both A1 targets cite only field-level declarations, with notes such as '`baseChange` is along a field extension `K → L`, not along an arbitrary base change of schemes'. Mathlib has smoothness of a given relative dimension n for morphisms over any base, the constant case of the locally constant relative dimension A1 asks for.
- **RT-AUDIT-08/22** (library-claim, medium). The roadmap summary contains four statements that the layers (once corrected) and the libraries contradict.
- **RT-AUDIT-08/23** (library-claim, low). The target is marked 'partial', but none of its five named results exists in either library: finite generation and torsion-freeness, semisimplicity of End ⊗ ℚ, Poincaré reducibility, Rosati positivity, degree formulas.
- **RT-AUDIT-08/24** (missing, low). Several targets are correctly 'absent', but their notes omit the nearest existing material a builder would start from, and one note overstates.
- **RT-AUDIT-08/25** (duplicate, low). Four problems in the duplicates field.

### AnabelianGeometryAndNonabelianChabauty — 11 findings (7 medium, 4 low)

- **RT-AUDIT-08/26** (library-claim, medium). The note ends 'no `H¹` with values in a nonabelian group with action exists in either library.
- **RT-AUDIT-08/27** (library-claim, medium). The note says of the finite-étale fibre functor that 'nothing covers a non-affine scheme (the phrase 'finite étale' does not occur in `Mathlib/AlgebraicGeometry/`)', and the summary repeats 'nothing covers a non-affine scheme'. The phrase is indeed absent, but the conclusion is false.
- **RT-AUDIT-08/28** (missing, medium). Both targets are marked absent with no Mathlib citation ('No arithmetic path torsor or Galois section exists in either library.
- **RT-AUDIT-08/29** (duplicate, medium). The NC.0 duplicates list omits the Tau Ceti Belyi plan, which builds NC.0's second target for the very curve NC.0's acceptance test uses and draws the section/tangential boundary from its side.
- **RT-AUDIT-08/30** (error, medium). The target-2 note says 'Neither decomposition groups of a fundamental group nor linear systems on a curve exist;
- **RT-AUDIT-08/31** (duplicate, medium). The NC.3 duplicates list names only ArithmeticGaloisDuality:R02.6 and HeightsRationalPointsAndObstructions:RP.1. It omits three layers that own parts of NC.3's machinery.
- **RT-AUDIT-08/32** (error, low). The target-4 note says 'There is no Kummer map for a Jacobian or an abelian variety'. As written this is false: an elliptic curve is an abelian variety and its own Jacobian, and Tau Ceti at f790474 has its 2-Kummer map in explicit étale-algebra form.
- **RT-AUDIT-08/33** (missing, low). The note says only 'there is no Jacobian of a curve in either library ... and no Tate module to compare with'. That is true (no `TateModule`, no Jacobian variety), but it omits the object on the other side of the depth-one comparison, which Mathlib at 082e2d3 has: ℓ-adic cohomology Hⁿ(X, ℤ_ℓ) of an arbitrary scheme, defined as pro-étale sheaf cohomology.
- **RT-AUDIT-08/34** (missing, low). These targets carry no declarations.
- **RT-AUDIT-08/35** (error, low). The note says 'the only heights in the baseline are the naive and canonical archimedean heights of points on an elliptic curve (...) and the Néron–Tate pairing built from them'. This is false.
- **RT-AUDIT-08/36** (other, medium). The roadmap summary repeats the two false absence claims above ('nothing covers a non-affine scheme'; 'no nonabelian `H¹`'). Its list of 'genuinely usable inputs' also omits library material this audit's own targets need.

### ArakelovGeometryAndAbelianHeights — 14 findings (8 medium, 6 low)

- **RT-AUDIT-08/37** (error, medium). R35.1 is verdicted 'not built'. Its target 'the product formula, with archimedean factors' is library 'mathlib', citing NumberField.prod_abs_eq_one at fit 'exact', so that target is fully present, while the other four targets are absent or partial.
- **RT-AUDIT-08/38** (library-claim, medium). The note says 'the only invertible-sheaf theory in the baseline is Tau Ceti's `InvertibleSheaf`/`LineBundleClass` for schemes'. That is false.
- **RT-AUDIT-08/39** (missing, medium). The target is marked 'absent' with no declarations, and its note says only that 'arithmeticDegree has zero occurrences'. Mathlib has the two computations this comparison is made of.
- **RT-AUDIT-08/40** (missing, medium). This partial target cites only height declarations, all at fit 'related'. The degree formulas themselves are in Mathlib at the level of places, both archimedean and finite.
- **RT-AUDIT-08/41** (duplicate, medium). R35.1's duplicates omit tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula.
- **RT-AUDIT-08/42** (library-claim, low). Two citations carry fit 'exact' but are not the product formula. prod_archAbsVal_eq rewrites a multiset product over archAbsVal as a product over infinite places. totalWeight_eq_finrank counts the archimedean weights.
- **RT-AUDIT-08/43** (library-claim, medium). The note says there is 'no module of invariant differentials' and that 'the nearest object is the invariant differential of a Weierstrass curve'. The summary repeats 'no module of invariant differentials'. Both are false as stated.
- **RT-AUDIT-08/44** (missing, low). The note's claim is true: nothing integrates a form over the complex points of an abelian variety.
- **RT-AUDIT-08/45** (missing, low). The first note cites only PeriodPair, and the R35.5 target cites nothing.
- **RT-AUDIT-08/46** (missing, low). The note says only 'there is no semistable reduction theorem for abelian varieties'. It omits the carriers Tau Ceti already has for the extension-and-model independence part.
- **RT-AUDIT-08/47** (library-claim, medium). (1) Target 2's note says 'only the finite locally free side is present, through Tau Ceti's Cartier duality'. Tau Ceti has more of the finite-flat side than that, and it is the part that the local term at primes dividing the degree uses.
- **RT-AUDIT-08/48** (duplicate, medium). Six duplicates entries do not name layers that 'state the same targets', which is the field's definition.
- **RT-AUDIT-08/49** (missing, low). These notes cite only Projectivization heights and Northcott, and they miss three results.
- **RT-AUDIT-08/50** (missing, low). The note records Northcott over a fixed number field and the missing projective instance.

### ArithmeticDynamics — 13 findings (7 medium, 6 low)

- **RT-AUDIT-08/51** (library-claim, medium). The note says 'The other required example, the power map on `P¹`, has no carrier.' This is false for the height side of that example.
- **RT-AUDIT-08/52** (library-claim, medium). The note says: 'The scheme-theoretic layer is absent as well: iteration of a morphism of varieties as a morphism, and orbit maps as morphisms.' The first half is false.
- **RT-AUDIT-08/53** (library-claim, medium). The note says: 'There is no self-map of `P¹` presented by a pair of coprime homogeneous forms, no dynamical degree, no resultant of such a pair.' Two of these three are wrong.
- **RT-AUDIT-08/54** (missing, medium). The note says the elliptic content 'is stated for the group law, not for a Lattès map on `P¹`, and there is no power map on `P¹` at all.' Both halves understate the libraries.
- **RT-AUDIT-08/55** (error, medium). The note says 'there is no effective height bound or enumeration procedure in either library.' The first half is false.
- **RT-AUDIT-08/56** (missing, medium). The note says there is 'only general machinery'. It says the Galois-category API has 'no finite étale cover of a scheme to instantiate the latter with', which implies the continuous action waits on IG.0. Over a field it does not.
- **RT-AUDIT-08/57** (other, medium). Four summary statements are false or unsupported.
- **RT-AUDIT-08/58** (library-claim, low). For the elliptic instance the note cites only ingredients: the zero-height criterion and Northcott ('torsion points are exactly the points of canonical height zero, and Northcott makes any bounded-height set finite over a number field'). Tau Ceti proves the finiteness theorem itself.
- **RT-AUDIT-08/59** (error, low). The note says uniqueness among bounded-error refinements 'is used implicitly inside the limit argument (`tendsto_nhds_unique` at CanonicalHeight.lean:246) rather than exported.' That line is not the canonical height's uniqueness.
- **RT-AUDIT-08/60** (missing, low). The note cites only `Semiconj` and `IsPeriodicPt.map`. It misses three things.
- **RT-AUDIT-08/61** (other, low). Both layers carry verdict 'partly built', yet no target in either is present.
- **RT-AUDIT-08/62** (duplicate, low). These four entries are declared prerequisites of the DY stage that lists them (they appear in its 'requires'), and each note says so itself.
- **RT-AUDIT-08/63** (missing, low). The note says the general statement is absent 'because there is no ample line bundle, no `h_L`, and no polarized morphism in either library'. Target 4 is just 'Absent, as is the ample case.' Both omit that the polarisation isomorphism f*L ≅ L^{⊗d} itself, without ampleness, is expressible at the pins.


## For the verifier and the fixer

- **The high finding (A5).** `TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos`
  (`TauCeti/Geometry/Hodge/WeightOne/Polarization.lean:122` at `f790474`) proves that a nondegenerate alternating integral
  form polarizes an effective weight-one Hodge structure when it is Weil-invariant and positive on real points. The file's
  header calls this the Riemann bilinear relations. The complex torus as a space, and the algebraicity half, are still
  missing, so the target is `partial` and A5 is `partly built`.
- **The fixes.** They are to notes, `library`/`fit` labels, cited declarations, the two verdicts above and the `duplicates`
  lists, as each finding states.
