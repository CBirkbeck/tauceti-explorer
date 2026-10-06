# Handoff: BP-AdelicAlgebraicGroups

Worker: Claude (session claude-NwZ48p), issue #667, 6 October 2026.

## Deliverables

- `research/blueprint/packets/AdelicAlgebraicGroups.json`: status `complete`, `part: null`, scope
  AA.0–AA.5. 201 nodes (26 definitions, 22 constructions, 80 theorems, 73 lemmas), 216 API items,
  144 unit tests, 25 planets, 88 baseline declarations, 21 requests, 6 gaps, 8 source issues, two
  sub-layer proposals. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings against
  the pinned declaration index.
- `research/blueprint/readmes/AdelicAlgebraicGroups.md`: the reader document (about 42,600 words).
  It opens with an introduction (scope, how RS-04 and the red-team findings are handled,
  conventions, dependencies, sources) and gives each layer an overview. A generated specification
  of every node follows, with its statement, hypotheses, proof outline, prerequisites, API, unit
  tests, uses, acceptance and sources. It closes with requests, gaps, source issues, proposed
  sub-layers and coverage. The node specifications are generated from the packet, so the document
  and the packet agree.
- `research/blueprint/suggested/AdelicAlgebraicGroups.lean`: about 2,650 lines. It contains every
  definition, API item and unit test of the packet under the packet's name (unit tests as
  `example`s headed `-- Test <name>`), plus the named theorems. The closing section states the
  elementary lemmas added in the second refinement: the fundamental-domain existence, the
  `GL_n`/`SL_n` local counts and the convergence of `∑_v q_v^{-2}`, the rank of finite-index unit
  subgroups, and `division-algebra-no-unipotent`, which is proved outright.

## Did the suggested file compile?

Yes. `lean-check` ran `lake env lean` in the shared build at Mathlib 082e2d3. The file elaborates.
The only warnings are 385 `declaration uses 'sorry'`, with no other warnings and no errors.

The file imports only Mathlib modules. The shared build has Mathlib at the pin but does not
contain Tau Ceti's algebraic-group, adele or Hecke modules, so they could not be imported. Where
the plan rests on Tau Ceti, the file restates the needed object as a clearly named stand-in. These
are:

- `AdelicPoints.pointsGroup`. This is the convolution group on `WithConv (H →ₐ[F] R)`, which is
  Tau Ceti's `HopfAlgebra.points`. Mathlib's `AlgHom.convGroup` cannot be used: its section
  variables add `[Bialgebra R C]` on the target, so the instance does not apply when `C` is the
  adele ring. That is a note for Mathlib, not a planning issue.
- `AdelicPoints.pointsTopology`. This is the affine-points topology requested from RG2.0.
- `NumberField.ideleNorm`, `adeleProj`, `adeleInfAlg`, `adeleFinAlg`, `localAbs`. These are
  requested from GlobalNumberFields layers 0, 4 and 6.
- GL_n, G_m and SL_n appear as hypotheses giving natural isomorphisms of points. Tau Ceti provides
  these as `GeneralLinear.pointsMulEquiv` and `MultiplicativeGroup.pointsMulEquiv`.

A few carriers are left unconstructed as `def … : Type := sorry`, each with a docstring saying
what it is: `CentralCharL2` and its Hilbert-space instances. No `Prop` stand-ins are used, and no
statement contains `sorry`.

## Stage status

Every stage is `planned`, and its `remaining` list in the packet is precise. In summary:

- **AA.0** (21 nodes, narrowed by RS-04 to the measure layer on Mathlib's topology). Remaining:
  - promote the countable-additivity step of `restricted-haar-product` to its own node;
  - local compactness of the finite adeles waits on GlobalNumberFields layer 4.
- **AA.1** (29 nodes). Remaining:
  - the affine-points topology over arbitrary topological rings is requested from RG2.0; once
    RG2.0 has nodes, replace the stage prerequisite with them;
  - split `restricted-product-comparison` into its bijection and its topological half.
- **AA.2** (35 nodes). Three gaps remain:
  - the p-adic change-of-variables formula for gauge-form measures;
  - Artin L-functions at s = 1 when the Galois action on the characters is nontrivial;
  - Steinberg's order formula.

  The split-character and semisimple cases avoid the second and third gaps, and for `GL_n` and
  `SL_n` the convergence of the local factors is checked by counting
  (`tamagawa-convergence-gln`). Also remaining: decompose `tamagawa-restriction-scalars` further.
- **AA.3** (55 nodes). Remaining:
  - decompose `siegel-covering-adelic` into the `GL_n` step, the self-adjoint embedding step
    (Borel 4.5) and the finiteness of closed orbits (Borel 5.4);
  - read Borel–Ji, Orr–Schnell and Klingen at first hand (the real Siegel-set nodes use the
    reviewed extraction PAPER-BAKKER-KLINGLER-TSIMERMAN-20 and the BKT erratum, read here), and
    decompose `orr-schnell-containment` and `incompatible-morphism-obstruction`;
  - Borel–Tits theory over a number field is requested from RG2.1.
- **AA.4** (49 nodes). Remaining: the general case of `strong-approximation-sufficiency`
  (Platonov–Rapinchuk §7.4). Gaps: Cartan's closed-subgroup theorem, Borel density, and the
  Kneser/Harder–Chernousov theorems, which are stated but not decomposed.
- **AA.5** (12 nodes). Remaining: the explicit Eichler mass value.

## Red-team findings handed to this job

- **RT-AREA-automorphic-1/7** (high). Strong approximation is stated with both hypotheses:
  `strong-approximation-sufficiency`, `-necessity` and `-theorem` (semisimple, Arthur 2.1(a)).
  - Sufficiency follows Platonov's argument as Rapinchuk §2.6 gives it. Its steps are the
    finite-places reduction, the S-arithmetic lattice property, nondiscreteness, Borel density,
    openness of the closure, finite index, and Kneser–Tits.
  - Kneser–Tits is a `requests` entry to ReductiveGroupsPartII:RG2.4, naming the sub-stage
    `RG2.4:kneser-tits` that RT-AREA-automorphic-1.fixes.md proposes. That stage does not exist in
    the atlas yet, so the request names RG2.4.
  - Positive characteristic is not assumed.
- **RT-AREA-automorphic-1/28** (medium). Neatness is planned in AA.4, and `restructure` proposes
  the sub-layer `AA.4:neat-levels`. The nodes are:
  - `neat-element` (Milne's definition);
  - `neat-representation-independence`, `neat-stability` and `neat-torsion-free`;
  - `neat-level`, with the convention that all rational intersections must be neat;
  - `neat-criterion-one-prime`, with the p-adic ball lemma;
  - `neat-level-exists`, which gives neat normal open subgroups of finite index in every compact
    open subgroup, and Borel's statement for arithmetic subgroups.

  ShimuraData D5, ShimuraVarieties V0 and ALS.0 should import these nodes. The edits to their
  layer texts are in the fix report and are not part of this job.
- **RT-AREA-geomlanglands/12** (medium). AA.0's restricted Haar product is stated for arbitrary
  locally compact groups with compact open subgroups, so ES7's function-field adelic measures
  import it. The `uses` of `restricted-haar-product` record that.
- **RT-AREA-automorphic-1/38** (low, read for consistency). The archimedean factor of the adelic
  height comparison is imported from AF.1 (a `requests` entry), not from AA.3 → AF.1.

## Maintainer-added sources

- **Khayutin.** Items 8, 17 and 21 are covered:
  - `plus-subgroup`, `residual-quotient`, `quaternion-reduced-norm-image`,
    `reduced-norm-components`, `torus-image-residual`, `homogeneous-measure-pushforward`,
    `chabauty-limit-kernels`, `residual-joint-limit`;
  - the corrections E39, E40 and E10 of the reviewed extraction are recorded as source issues E5,
    E6 and E7.
- **Calegari–Geraghty §8.2.** Covered by `gl1-XQ-components`, `gl1-component-dimension`, `gl1-H0`
  and `gl1-hecke-action`. Extraction E160 is source issue E8. The component group statement makes
  explicit that `K_∞` lies in `U_Q`.
- **Lipnowski–Tsimerman §3.2.** Covered by `double-coset-level-map`,
  `double-coset-level-cardinality`, `double-coset-conjugate-level`,
  `finite-support-product-index`, and `class-set-abelianization` (their (21), with its
  noncompactness hypothesis). Strong approximation stays qualified.
- **Bakker–Klingler–Tsimerman.** Covered by the 23 real Siegel-set nodes of AA.3. The source
  issues are E1 (basis change), E2 (fixed K, known erratum), E3 (left action) and E4 (quantifier).
  The two Hodge-form-map items are planned as general orbit-map statements; the Hodge-theoretic
  specialization belongs to DegeneratingHodgeStructures.
- **Harpaz–Wittenberg item 93.** Covered by `group-torsor`, `kneser-local-torsor`,
  `hasse-principle-simply-connected` and `weak-approximation-simply-connected` (property ⋆). Weak
  approximation is never derived from an unqualified strong-approximation claim.

## Requests made

There are 21 requests, all recorded in the packet:

- ReductiveGroupsPartII RG2.0, RG2.0a, RG2.1, RG2.3 and RG2.4 (two requests on RG2.4: the Cartan
  and Iwasawa decompositions, and Kneser–Tits);
- GlobalNumberFields layers 0, 1, 4, 5, 6 and 8;
- NumberFieldArithmetic layer 4;
- LieGroups layer 9;
- Chebotarev layer 11 (two requests);
- ClassFieldTheory layer 12 and GlobalQuadraticForms layer 5;
- AutomorphicFormsOnReductiveGroups AF.1;
- ModularCurvesPartII R12.2.

## Consumers' requests answered

- AbelianSchemesII F4: AA.1 compact-open products and finite support, AA.3 class-number finiteness,
  and AA.4 level maps and class-set abelianization.
- AnalyticNumberTheory AN.8: the finite-adele measure, the GL_2 quotient measure and local factors.
- AutomorphicLFunctions AL.0/AL.1: the restricted Haar product, box and factorizable-integral
  formulas, and Fubini.
- BorelRegulators R.1/R.6: restriction of scalars, gauge-form measures, compact-open volumes,
  Tamagawa measures, compactness for anisotropic groups, and strong approximation with the
  noncompactness hypothesis. Division-algebra specifics stay in R.6.
- ES7: AA.0 and AA.1.
- GeometryOfNumbers GN.2–GN.4: quotient measures, `L²` and reduction.
- Metaplectic MP.0: model-independent adelic points.
- ShimuraData D2: `G(ℝ)` comes from RG2.0.
- AbelianVarietiesIsogenousToNoJacobian MZ0: Siegel sets and reduced forms.

## Sources

Read for this job (URL, SHA-256 and sections are recorded in the packet):

- Arthur, *An introduction to the trace formula*;
- Borel, IHÉS 16 (1963);
- Conrad, *Weil and Grothendieck approaches to adelic points*;
- Rapinchuk (arXiv:1207.4425);
- Milne, *Introduction to Shimura varieties* (2017);
- Rosengarten (arXiv:1806.10723);
- Sutherland, 18.785 Lecture 23;
- BKT (arXiv:1810.04801v2) and the 2023 erratum;
- Khayutin (arXiv:1710.04557v3);
- Calegari–Geraghty (arXiv:1207.4224v2);
- Lipnowski–Tsimerman (arXiv:1511.02212v1);
- Harpaz–Wittenberg (arXiv:1802.09605v2).

Not available or not read:

- Borel–Serre, *Corners and arithmetic groups*: the e-periodica link returned HTML.
- Platonov–Rapinchuk.
- Borel, *Introduction aux groupes arithmétiques*.
- Borel–Harish-Chandra (1962).
- Weil, *Adeles and algebraic groups*.
- Oesterlé, Orr–Schnell, Borel–Ji, Klingen and BGST, except through the reviewed extractions and
  the BKT erratum.

The steps these would supply are recorded as gaps or as remaining work. All excerpts were checked
programmatically against the downloaded texts. The scanned Borel paper has OCR damage to its
mathematical symbols, so those excerpts reproduce the words exactly and normalize the symbols.

## For the reviewer

- **Conventions to check first.**
  - Δ_{P(𝔸)} = δ_P in Mathlib's modular-character convention (verified on the Borel subgroup of
    GL_2).
  - `G(𝔸)^1` versus dividing by `A_G(ℝ)^0` is a theorem, and fails for `Z(F_∞)^0`.
  - The volume decomposition uses `G(F_∞)/A_G(ℝ)^0`, not `G(F_∞) ∩ G(𝔸)^1`.
  - Neat levels quantify over all rational intersections.
  - Siegel sets in `G(ℝ)` use one fixed `K`.
- **Local unimodularity** of reductive groups is proved without gauge forms. The proof uses the
  Cartan decomposition and the W-invariance of the modular character on a maximal split torus, so
  it does not depend on the p-adic change-of-variables gap.
