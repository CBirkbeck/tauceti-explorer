# PKG-ShimuraCompactifications — handoff

Issue #9886. Agent: Claude (Opus 5.5), session claude-GauUJT, 16 October 2026. The package is complete
and goes to its independent review.

## Deliverables

- `research/blueprint/packages/ShimuraCompactifications/README.md` (about 240 KB, 3,650 lines): the
  roadmap in TauCetiRoadmap form. It has a summary, scope and ownership, conventions, exact supplier
  contracts and how to read the build, then nine layers (C0, C1, C2, C2.general, C3, C3.general, C4,
  C5, C6) with 155 subsections, then worked examples, downstream consumers and references. Every
  definition keeps its API and Checks; every theorem keeps its hypotheses, source locator and *Needs*.
- `research/blueprint/packages/ShimuraCompactifications/Suggested.lean` (353 lines): `import Mathlib`
  and `TauCeti.NumberTheory.NumberField.TotallyPositive`, in namespace
  `TauCetiRoadmap.ShimuraCompactifications`. It contains the face submonoid predicate, the off-face
  ideal, the face projection (a real-bodied `AlgHom` with sorry'd proof fields), the regular chart
  algebra and boundary monomial, the Hilbert-cusp arithmetic of C6.1–C6.8, and the cyclotomic phases
  of C6.15–C6.19 (with the real-bodied `tracePhaseFun`). There are 29 declarations and 9 examples, and
  a closing comment lists the README-only targets by layer.
- `research/blueprint/packages/ShimuraCompactifications/metadata.toml`: `topic = "math.AG"`, as for the
  base roadmap AnalyticToricGeometry.

## Checks run

- `lean-check research/blueprint/packages/ShimuraCompactifications/Suggested.lean`: exit 0 at Mathlib
  082e2d3 / Tau Ceti f790474. There are 33 warnings, all `declaration uses sorry`; no errors and no
  other warnings.
- `python3 scripts/check_sorry_data.py` on the Lean file: passes (no sorry'd data; only proof fields of
  `faceProjection` use `sorry`).
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems; no local
  paths.
- Cross-checks by script: every unit-test name of the 148 plan nodes appears in the README; every API
  item appears, under its name or the renamed form noted below; all 29 Lean declarations are named in
  the README; every internal reference `Ck.n` resolves to a subsection; no cross-layer forward
  dependency remains.
- Supplier citations were located in the supplier packages: three Haiku retrieval passes over SF,
  AdicSpacesPartII, HBAV, PEL, ShimuraVarieties, AdelicAlgebraicGroups, AbelianSchemes, Néron,
  FiniteFlat, ModularCurvesPartII, ComplexComparisonPartII and ArithmeticGaloisDuality, plus a final
  Sonnet pass over every citation in the README. It found no missing ids; I read the three loosely
  described headings it flagged (AdicSpacesPartII R2.79, HBAV H2.5–H2.8 and H4.4) and corrected their
  descriptions.
- The current-upstream duplication check was done against the read-only TauCetiRoadmap checkout and
  the current Tau Ceti library. Current Tau Ceti has affine toric schemes, the fan scheme and relative
  Spec, all over `ℂ`; none of these are at the pin. They are cited in *Scope and ownership*. C0.16 is
  the arbitrary-coefficient extension and agrees with them over `ℂ`. Nothing in the README restates
  an upstream roadmap.

## Source of truth and structure

The source of truth is the accepted whole-roadmap packet `ShimuraCompactifications.json` (148 nodes,
review accepted 2026-10-13). The part packets `--C0` and `--C6` are superseded by it, and its nodes
continue theirs. The README numbers subsections `Ck.n` in packet order. There is one exception: the
compactified Klingen correspondence nodes (packet C3.11–C3.12) depend on the C4 level comparison, so
they moved to the end of C4 as **C4.16–C4.17**, removing the only cross-layer forward edge. The
mapping from plan node ids to README subsections is the table at the end of this note. The
AutomorphicBundles package cites this roadmap by node slug, so this table translates those
citations.

Declaration names were cleaned up, removing layer ids from namespaces and module paths: for example
`ArithmeticFan`, `ToroidalSpace`, `IntegralToroidalModel`, `HilbertModular.*`, `HilbertCusp.*`,
`CyclotomicPhase.*`. The C0 coefficient algebra uses the Lean names (`FaceProjection.*`). Renamed API
items: `Toric.finiteFan_*` became `finiteFanScheme_*`, and `SemiAbelianScheme.abelianEmbedding`
became `SemiAbelianScheme.ofAbelian`.

## Targets owned here that the plan requested from suppliers (moves down)

The plan had 42 supplier requests and 25 recorded gaps. Each request was checked against the
lower-tier packages. Items the suppliers lack became targets here, or explicit hypotheses:

| Need (plan request / gap) | Supplier finding | Resolution in the package |
| --- | --- | --- |
| Character-line grading of split-torus torsors, pushout along quotient tori (SF.1) | not in SF | new **C0.21** `TorusTorsor.characterDecomposition` |
| Nilpotent-preserving complex analytic carrier (G1) | AMAG §7.10.1 `ComplexAnalyticSpace` | cited; G1 closed |
| Cartan quotients by properly discontinuous actions | not in suppliers | owned inside **C2.2** |
| Proper ⇔ compact analytification (CC C2) | not in CC | owned inside **C2.5** (SGA 1 XII 3.2) |
| Pink 12.4–12.5 algebraization existence (G19) | not in CC | **C2.7** restated with Pink's route: Ch. 8 ample bundles, 9.21–9.24 and Chow's theorem (CC C4.2), and 9.34–9.35 for algebraic spaces |
| Special mixed canonical models, Pink 12.13–12.17 (G3) | not in ShimuraVarieties | new **C2.10** `MixedShimura.canonicalModel_exists` (Pink 11.1–11.18; existence is 11.18) |
| Integral toric Čech vanishing, including the boundary ideal (G4) | proof owned | **C3.5** now states the boundary-ideal version too (KKMS I §3) |
| Igusa chart towers (plan C3.10) | upward citation | **C3.10** restated as local completed comparisons under explicit hypotheses on towers (F0.8, F0.39, F0.41, F0.44); Igusa roadmaps apply it |
| Klingen compactification and rigid comparison (R3) | not in AdicII R3 | **C4.16–C4.17** built algebraically from C3.2–C3.3; rigid form via AdicII R1.15 and proper GAGA R3.53–R3.55 |
| Local Raynaud supplier ownership (G6) | NS 3.13–3.14 are independent local statements | cited; no cycle |
| Frobenius and Verschiebung of smooth commutative group schemes (A0, R42) | not in A0 | new **C4.18** `GroupScheme.verschiebung` (SGA 3 VII_A §4) |
| Full versus primewise Tate modules, inverse-limit exactness (G16) | R02.1.1 has Tate's inverse-limit theorem | proof inside **C4.14** |
| Hodge semiampleness for semi-abelian families over normal bases (A5, G10, G25) | not in A5 | new **C5.32** `SemiAbelianScheme.hodgeLine_generated` (FC V.2.1, V.3; Moret-Bailly IX 2.1) |
| Isotriviality on curves of degree zero (FC V.2.2) | not in A5 | new **C5.33** |
| Artin approximation for good models (G8) | AMAG Layer 6 | cited in **C5.1** |
| Stein/finite generation for a semiample line (SF.2, SF.3) | Stein in SF.4; rest absent | proved in **C5.14** (FC V proof of 2.3) |
| Generic smooth-closure component detector (SF.2) | not in SF | proved in **C5.10** |
| Non-neat branch coverage (G9) | — | **C5.11** restated with a neat normal subgroup and the transitivity argument |
| Formal Hartogs and special-fibre depth (G13, G17) | not in AdicII | **C5.26** carries an explicit depth hypothesis on the special fibre, with algebraic Hartogs on thickenings (EGA IV₂ 5.10.5); **C5.24** follows from C5.22 on the ordinary open |
| Ramified minimal models of Lan [18] Props 6.1/6.4 (R33, G18) | not in PELModuli M4 | **C5.31** takes the minimal model as an explicit hypothesis; it is unconditional at good primes (normalization of C5.16) |
| Same-fan normalization versus normalized blow-up (G11, G18) | — | **C5.20(c)** proves the comparison through universal properties of normalization and blow-up |
| Full Hilbert cusp stabilizer, `H_C`, `U_{C,1}` (H3, R36) | H3 has only `Δ(N)` | new **C6.54** `HilbertCusp.stabilizer_exact` (Dimitrov Prop. 3.3(iv)–(v)) |
| Cusp data `(a, b, L, β)` and lattice `X = cbb′` (H1) | partial in H1 | owned in **C6.13** |
| Dimitrov 5.11 arithmetic formal gluing (SF.3, G25) | not in SF | new **C6.55** `FormalGluing.effective` (Rapoport 1978 Thm 3.5; Dimitrov 5.8–5.11) |
| Universal global functions of proper flat families (SF.0) | not in SF | proved in **C6.53** (Stacks 0E0L, Lemma 36.32.6) |
| Wild-level integral models (G21) | H2–H4 only | **C6.48** keeps exactly the models H2–H4 give, plus normalization |

No prerequisite of the package points to a roadmap of a higher tier. The higher-tier roadmaps named
in the plan (HodgeTateAndCanonicalSubgroups T0/T3/T5, AutomorphicGaloisRepresentationsPartII AG2.4,
the Igusa owner, PR81) now appear only as downstream consumers, or not at all. The plan's "PR81
Modular Curves Layer 10" is TauCetiRoadmap ModularCurves Layer 10 (C6.52).

## Supplier id translation (plan stage ids → supplier package sections)

NeronModels R11.3 → 3.10, 3.13, 3.14, and Layer 1 for Néron models. ModularCurvesPartII R13.1–R13.3 →
3.6, 3.7, 4.8; R13.4a/b → 3.11, 5.2, 5.13, 9.1, Layer 6. ShimuraVarieties V0/V2/V8 → 0.5, 2.1–2.7,
Layer 8 (8.4, 8.22–8.23). PELModuli M2 → M2.8–M2.10; M4 → M4.5–M4.6. FiniteFlat R07.2 → R07.2.21.
AdelicAlgebraicGroups AA.3 → AA.3.2–AA.3.6. AdicSpacesPartII F0/R2/R3 → F0.8, F0.39, F0.41, F0.44,
F0.53, F0.56–F0.57, R1.15, R2.72, R2.79, R2.82, R3.53–R3.55. SchemeAndStackFoundations by named
targets (`relative-spec`, `relative-proj`, `coherent-hartogs`, `qcoh-fpqc-descent`, `torsor`,
`finite-group-quotient`, `cohomology-filtered-colimits`, `ample-serre-vanishing`, `stein-factorization`,
`formal-completion`). Formal-scheme items the plan put under SF.3 are under SF.4 in that package.
HodgeStructures Milestone L2 → the Tau Ceti library at the pin (`TauCeti/Geometry/Hodge/Mixed`).

## Locators checked in this job, and those for the reviewer

Checked here in public copies: Pink's table of contents and Chapters 8–12 (chapter page ranges;
9.21, 9.24, 12.4, 12.5, 11.18 statements); Dimitrov author copy (Théorème 5.11 on p. 540, Lemme 5.8
on p. 539, Proposition 3.3 on p. 533, Théorème 7.2 on p. 541, 7.4–7.7 on p. 544, 8.3 and 8.5 on
p. 547, 8.6 on p. 548). Stacks Tag 0E0L was checked online. In the cleared library copy of
Faltings–Chai, V.2.1–2.3 (pp. 149–152) were read; nothing was copied.

Not opened in this job (standard references cited by statement), for the reviewer's sample: SGA 3
Exp. I §4.7 and Exp. VII_A §4; Demazure–Gabriel IV §3.4; SGA 1 Exp. VIII 5.2 and XII 3.2; EGA IV₂ 5.10.5;
Cartan 1957; KKMS I §3; Rapoport 1978 Thm 3.5; Moret-Bailly IX 2.1 and 4.5; Lan's *Higher Koecher's
principle* Thm 2.3; Lan's ramified-characteristics paper Props 6.1 and 6.4. All other locators come
from the accepted plan.

## For the maintainer

- C5.31 (normalized blow-ups at ramified primes) is conditional on Lan's ramified minimal models. No
  atlas roadmap plans them. A PELModuli Part II or a later layer here would own them if the ramified
  case is wanted.
- AutomorphicBundles's "Missing ramified Hilbert boundary geometry" (Pappas–Rapoport splitting-model
  charts) is outside this plan and is not supplied here.
- The plan's undeclared stage edges are now internal: C1→C4 (C4 uses C1.3) and C4→C3 (resolved by the
  C4.16–C4.17 move).

## Plan node → README subsection

The pattern is `Ck/roadmap/<slug>` → `Ck.n`,
in packet order within each layer, except that `C3/roadmap/klingen-correspondence-compactification` →
C4.16 and `C3/roadmap/klingen-correspondence-acyclicity` → C4.17. New subsections without plan
nodes: C0.21, C2.10, C4.18, C5.32, C5.33, C6.54, C6.55.

<details><summary>Full table (148 rows)</summary>

| Plan node | README | Title |
| --- | --- | --- |
| `C0/roadmap/face-projection` | C0.1 | The integral face projection |
| `C0/roadmap/face-projection-coeff` | C0.2 | Coefficients of the face projection |
| `C0/roadmap/face-projection-section` | C0.3 | A section of the face projection |
| `C0/roadmap/face-projection-kernel` | C0.4 | The monomial ideal of the face complement |
| `C0/roadmap/face-quotient` | C0.5 | The integral stratum quotient algebra |
| `C0/roadmap/face-projection-coefficient-change` | C0.6 | Coefficient change commutes with face restriction |
| `C0/roadmap/face-kernel-coefficient-change` | C0.7 | The face ideal commutes with coefficient change |
| `C0/roadmap/relative-torus-embedding` | C0.8 | Relative torus embeddings |
| `C0/roadmap/relative-face-open` | C0.9 | Face charts are open subschemes |
| `C0/roadmap/relative-regular-coordinates` | C0.10 | Integral regular coordinates |
| `C0/roadmap/relative-stratum-quotient` | C0.11 | The scheme-theoretic relative toric stratum |
| `C0/roadmap/relative-boundary-coordinates` | C0.12 | Coordinate ideals of boundary intersections |
| `C0/roadmap/arithmetic-admissible-fan` | C0.13 | Arithmetic cone systems |
| `C0/roadmap/compatible-common-refinement` | C0.14 | Common refinements |
| `C0/roadmap/smooth-projective-refinement` | C0.15 | Smooth projective refinements |
| `C0/roadmap/arbitrary-ring-toric-charts` | C0.16 | Toric schemes over arbitrary commutative rings |
| `C0/roadmap/relative-fan-properness` | C0.17 | Relative toric maps and the support criterion |
| `C1/roadmap/mixed-boundary-datum` | C1.1 | Mixed boundary datum |
| `C1/roadmap/boundary-mixed-hodge-structure` | C1.2 | Boundary weight and Hodge filtrations |
| `C1/roadmap/boundary-torsor-tower` | C1.3 | Pure quotients and boundary torsors |
| `C1/roadmap/cusp-label` | C1.4 | Cusp labels |
| `C1/roadmap/arithmetic-stabilizer` | C1.5 | Effective arithmetic stabilizers and finite overlap |
| `C1/roadmap/boundary-incidence` | C1.6 | Positivity cones and boundary incidence |
| `C2/roadmap/partial-boundary-charts` | C2.1 | Partial compactifications of boundary torsors |
| `C2/roadmap/quotient-separation` | C2.2 | Arithmetic quotient neighbourhoods and separation |
| `C2/roadmap/arithmetic-gluing` | C2.3 | Arithmetic toroidal gluing |
| `C2/roadmap/normal-open-dense` | C2.4 | Normality and the dense interior |
| `C2/roadmap/compactness-properness` | C2.5 | Complete cone systems give compact toroidal spaces |
| `C2/roadmap/smooth-normal-crossings` | C2.6 | Smooth cone systems at neat level |
| `C2/roadmap/projective-algebraization` | C2.7 | Algebraization |
| `C2/roadmap/minimal-boundary-map` | C2.8 | The map to the minimal compactification |
| `C2/roadmap/canonical-toroidal-model` | C2.9 | Canonical models of toroidal compactifications |
| `C2.general/roadmap/general-toroidal-descent` | C2.general.1 | Toroidal canonical models for general pure data |
| `C3/roadmap/refinement-map` | C3.1 | Refinement maps |
| `C3/roadmap/level-datum-functoriality` | C3.2 | Level and datum maps |
| `C3/roadmap/hecke-span` | C3.3 | Toroidal Hecke correspondences |
| `C3/roadmap/choice-comparison` | C3.4 | Independence through common refinements |
| `C3/roadmap/toric-structure-sheaf-vanishing` | C3.5 | Toric acyclicity of refinements |
| `C3/roadmap/refinement-structure-sheaf` | C3.6 | Structure-sheaf pushforward along refinements |
| `C3/roadmap/refinement-higher-structure-sheaf` | C3.7 | Higher direct images along refinements |
| `C3/roadmap/refinement-boundary-ideal` | C3.8 | The boundary ideal along refinements |
| `C3/roadmap/coherent-cohomology-invariance` | C3.9 | Coherent cohomology does not depend on the cone system |
| `C3/roadmap/partial-ordinary-formal-invariance` | C3.10 | Completed local comparisons |
| `C3/roadmap/klingen-correspondence-compactification` | C4.16 | The compactified Klingen correspondence |
| `C3/roadmap/klingen-correspondence-acyclicity` | C4.17 | Acyclicity of the Klingen first projection |
| `C3.general/roadmap/general-map-descent` | C3.general.1 | Maps of general toroidal canonical models |
| `C4/roadmap/semi-abelian-scheme` | C4.1 | Semi-abelian schemes |
| `C4/roadmap/constructible-character-sheaf` | C4.2 | Character sheaves and homomorphisms from tori |
| `C4/roadmap/poincare-extension-classification` | C4.3 | Torus extensions of abelian schemes |
| `C4/roadmap/polarized-degeneration-data` | C4.4 | Polarized degeneration data |
| `C4/roadmap/mumford-quotient` | C4.5 | Mumford's construction |
| `C4/roadmap/degeneration-effectivity` | C4.6 | The degeneration equivalence |
| `C4/roadmap/formal-universal-degeneration` | C4.7 | The universal degeneration on a cusp chart |
| `C4/roadmap/homomorphism-extension` | C4.8 | Extension of homomorphisms |
| `C4/roadmap/endomorphism-extension` | C4.9 | PEL endomorphisms across the boundary |
| `C4/roadmap/boundary-level-comparison` | C4.10 | Level structures at the boundary |
| `C4/roadmap/extended-isogeny-kernel` | C4.11 | Isogenies at the boundary |
| `C4/roadmap/tate-degeneration-comparison` | C4.12 | The Tate curve |
| `C4/roadmap/tate-log-kodaira-spencer` | C4.13 | Logarithmic Kodaira–Spencer for the Tate curve |
| `C5/roadmap/good-algebraic-model` | C5.1 | Good algebraic models of formal boundary charts |
| `C5/roadmap/etale-chart-relation` | C5.2 | The étale relation on boundary charts |
| `C5/roadmap/integral-toroidal-space` | C5.3 | Integral toroidal compactifications |
| `C5/roadmap/formal-completion` | C5.4 | Formal completion along boundary strata |
| `C5/roadmap/valuative-properness` | C5.5 | Properness |
| `C5/roadmap/neat-boundary-intersection-smooth` | C5.6 | Smooth boundary intersections |
| `C5/roadmap/neat-boundary-open-fiberwise-dense` | C5.7 | Exact strata are dense in every geometric fibre |
| `C5/roadmap/neat-stratum-closure-component` | C5.8 | Components of labelled strata |
| `C5/roadmap/neat-stratum-closure-proper` | C5.9 | Closures of strata are proper |
| `C5/roadmap/neat-strata-detect-geometric-components` | C5.10 | Strata detect components of geometric fibres |
| `C5/roadmap/nonneat-boundary-descent` | C5.11 | Non-neat levels |
| `C5/roadmap/log-kodaira-spencer` | C5.12 | Logarithmic Kodaira–Spencer |
| `C5/roadmap/hodge-semiampleness` | C5.13 | Semiampleness of the Hodge line |
| `C5/roadmap/graded-section-finite-generation` | C5.14 | Finite generation of the Hodge section algebra |
| `C5/roadmap/hodge-line-fourier-jacobi-expansion` | C5.15 | Fourier–Jacobi expansions of Hodge-line sections |
| `C5/roadmap/integral-minimal-space` | C5.16 | The integral minimal compactification |
| `C5/roadmap/minimal-hodge-ampleness` | C5.17 | The Hodge line on the minimal compactification |
| `C5/roadmap/open-quasiprojectivity` | C5.18 | Quasi-projectivity of PEL moduli at good primes |
| `C5/roadmap/higher-level-toroidal-normalization` | C5.19 | Finite normalizations at higher p-level |
| `C5/roadmap/normalized-chart-finiteness` | C5.20 | Charts of normalized models |
| `C5/roadmap/integral-coefficient-extension` | C5.21 | Formally canonical coefficient sheaves |
| `C5/roadmap/normalized-koecher` | C5.22 | The Koecher principle on normalized models |
| `C5/roadmap/siegel-koecher-arbitrary-coefficients` | C5.23 | The Siegel Koecher principle with arbitrary coefficients |
| `C5/roadmap/ordinary-koecher` | C5.24 | The Koecher principle on the ordinary locus |
| `C5/roadmap/hilbert-siegel-boundary-codimension` | C5.25 | Codimension of the Hilbert–Siegel minimal boundary |
| `C5/roadmap/formal-hilbert-siegel-koecher` | C5.26 | The formal Hilbert–Siegel Koecher principle |
| `C5/roadmap/prime-Q-subgroup-extension` | C5.27 | The cyclic level group at the boundary |
| `C5/roadmap/prime-Q-generator-cover` | C5.28 | The generator cover of a cyclic level group |
| `C5/roadmap/siegel-canonical-bundle` | C5.29 | The canonical bundle of a Siegel threefold |
| `C5/roadmap/good-boundary-cohomology-export` | C5.30 | Good-reduction geometry for étale cohomology |
| `C4/roadmap/semiabelian-tate-module` | C4.14 | Tate modules of semi-abelian varieties |
| `C5/roadmap/projective-normalized-blowup` | C5.31 | Normalized blow-ups of minimal compactifications |
| `C6/roadmap/finite-index-cusp-unit-contraction` | C6.1 | A contracting unit |
| `C6/roadmap/negative-cusp-exponent` | C6.2 | A negative embedding |
| `C6/roadmap/negative-trace-orbit` | C6.3 | Unbounded negative traces along unit orbits |
| `C6/roadmap/coefficient-unit-orbit` | C6.4 | Unit covariance preserves nonvanishing |
| `C6/roadmap/bounded-cusp-support` | C6.5 | Koecher support for coefficient families |
| `C6/roadmap/positive-exponents-on-charts` | C6.6 | Totally positive characters are positive on boundary rays |
| `C6/roadmap/constant-term-covariance` | C6.7 | The constant coefficient |
| `C6/roadmap/constant-term-vanishing` | C6.8 | Vanishing of the constant term |
| `C6/roadmap/meromorphic-cusp-support-bound` | C6.9 | A pole bound on a cusp chart |
| `C6/roadmap/hilbert-cusp-positive-support` | C6.10 | Positive support of meromorphic expansions |
| `C6/roadmap/arithmetic-koecher` | C6.11 | The arithmetic Koecher principle |
| `C6/roadmap/hilbert-boundary-constant` | C6.12 | Cusp forms and the boundary ideal |
| `C6/roadmap/cusp-lattice-comparison` | C6.13 | Cusp data, lattices and the trace pairing |
| `C6/roadmap/admissible-fan-specialization` | C6.14 | Admissible Hilbert cusp fans |
| `C6/roadmap/trace-exponent-integral` | C6.15 | Integral trace exponents |
| `C6/roadmap/trace-exponents-congruent` | C6.16 | Congruence of exponents |
| `C6/roadmap/phase-independent-of-lift` | C6.17 | Phases do not depend on the lift |
| `C6/roadmap/phase-additive-in-character` | C6.18 | Phases are additive |
| `C6/roadmap/uniformization-phase-character` | C6.19 | The phase character |
| `C6/roadmap/uniformized-level-chart` | C6.20 | The universal family on a cusp chart |
| `C6/roadmap/hilbert-toroidal-model` | C6.21 | The fine Hilbert toroidal compactification |
| `C6/roadmap/toroidal-polarization-quotient` | C6.22 | Polarization quotients of toroidal models |
| `C6/roadmap/hilbert-boundary-formal-comparison` | C6.23 | Formal neighbourhoods of the boundary |
| `C6/roadmap/hilbert-boundary-etale-charts` | C6.24 | Étale toric charts at the boundary |
| `C6/roadmap/hilbert-regular-refinement` | C6.25 | Smooth refinements over the good base |
| `C6/roadmap/hilbert-semiabelian-extension` | C6.26 | The universal semi-abelian scheme |
| `C6/roadmap/hilbert-conormal-comparison` | C6.27 | Invariant differentials |
| `C6/roadmap/hilbert-toroidal-proper` | C6.28 | Properness |
| `C6/roadmap/hilbert-hodge-semiampleness` | C6.29 | Semiampleness of the determinant Hodge line |
| `C6/roadmap/hilbert-minimal-contraction` | C6.30 | The minimal contraction |
| `C6/roadmap/hilbert-minimal-finite-generation` | C6.31 | Finite generation of the section ring |
| `C6/roadmap/hilbert-minimal-normal-projective` | C6.32 | Normal projective minimal models |
| `C6/roadmap/minimal-polarization-quotient` | C6.33 | Polarization quotients of minimal models |
| `C6/roadmap/hilbert-minimal-cusps` | C6.34 | Cusps of the minimal model |
| `C6/roadmap/hilbert-minimal-boundary-fibres` | C6.35 | Boundary fibres of the contraction |
| `C6/roadmap/hilbert-minimal-formal-comparison` | C6.36 | Toroidal completion over a minimal cusp |
| `C6/roadmap/hilbert-minimal-weight-extension` | C6.37 | Weights that extend to the minimal model |
| `C6/roadmap/hilbert-q-expansion-comparison` | C6.38 | The geometric q-expansion map |
| `C6/roadmap/hilbert-q-expansion-module-injective` | C6.39 | q-expansion detection with coefficient modules |
| `C6/roadmap/hilbert-q-expansion-injective` | C6.40 | The q-expansion principle |
| `C6/roadmap/hilbert-q-expansion-coefficient-descent` | C6.41 | Descent of coefficients |
| `C6/roadmap/hilbert-boundary-ideal-pushforward` | C6.42 | Cusp ideals on the minimal and toroidal models |
| `C6/roadmap/hilbert-ordinary-model-comparison` | C6.43 | Models at all primes prime to the level |
| `C6/roadmap/hilbert-hasse-boundary-comparison` | C6.44 | The Hasse ideal on the boundary |
| `C6/roadmap/hilbert-boundary-ordinary` | C6.45 | The boundary is ordinary |
| `C6/roadmap/hilbert-near-ordinary-model` | C6.46 | Hasse neighbourhoods |
| `C6/roadmap/hilbert-ordinary-polarization-quotient` | C6.47 | Polarization quotients of ordinary neighbourhoods |
| `C6/roadmap/hilbert-p-level-boundary-comparison` | C6.48 | Finite-level maps at the boundary |
| `C6/roadmap/hilbert-integral-differential-interface` | C6.49 | The natural integral lattice of differentials |
| `C6/roadmap/modular-toroidal-minimal-comparison` | C6.50 | Degree one: modular curves |
| `C6/roadmap/modular-formal-cusp-comparison` | C6.51 | Cusp parameters of modular curves |
| `C6/roadmap/prime-diamond-pr81-comparison` | C6.52 | Comparison with the prime-level diamond quotients of ModularCurves |
| `C0/roadmap/regular-boundary-union` | C0.18 | The integral toric boundary |
| `C0/roadmap/completed-regular-chart-support` | C0.19 | Completed regular charts |
| `C0/roadmap/integral-changed-lattice-comparison` | C0.20 | Finite toric maps for a change of lattice |
| `C4/roadmap/semiabelian-hasse-boundary-comparison` | C4.15 | Verschiebung on the Hodge line at the boundary |
| `C6/roadmap/hilbert-boundary-global-functions` | C6.53 | Global functions on the boundary |

</details>
