# PKG-HilbertModularVarietiesAndShimuraCurves

Completed by Codex (GPT-6), session `codex-lD9kHU`, on 10 October 2026.
Refs #7906. This is the package submission, with no changes to its input plans.

## Deliverables

The package contains `README.md`, `Suggested.lean` and `metadata.toml`
(`topic = "math.NT"`). The README includes all 133 targets from the two
accepted parts, all 206 API entries and all 157 tests. Every definition and
construction retains at least three tests. It is under the 200 KB limit.
The assembly's repeated proof steps, audit tables, producer requests and source
issue histories are not part of the reader roadmap.

The quaternionic sections follow construction order: local Drinfeld geometry,
generic connected PEL comparison, arithmetic uniformisation, integral models,
definite modules and coefficient cohomology. Thus the integral regular-model
target follows the uniformisation theorem it uses. Layer and target identifiers
are preserved. Every local prerequisite occurs earlier in the README.

The suggested file has one header and import block, consistent Hilbert and
quaternionic namespaces, and the arithmetic, matrix, coefficient-module and
point-set prototypes of the assembly. It now imports the pinned
`TauCeti.NumberTheory.NumberField.TotallyPositive` module and elaborates actual
Hilbert specializations of the parameterized unit quotients and connected limit.
The standard positive subgroup is not redefined.

The final signature comment includes every target, API and test with its full
mathematical hypotheses. Entries that need unavailable geometric or adelic
carriers are documentation, **not typed Lean declarations**. In particular,
the compiled point set of the Drinfeld half-plane is not its analytic space,
and the compiled weight module is not its adelic action or local system.
There are no dummy moduli objects or `Prop`-valued theorem fields.

## Validation

- Both input packets passed `scripts/check_blueprint.py`: 0 errors and
  0 warnings, respectively 75 and 58 targets. Neither packet was modified.
- `lean-check research/blueprint/packages/HilbertModularVarietiesAndShimuraCurves/Suggested.lean`
  exited successfully at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. All 120 warnings were
  `declaration uses sorry`; there were no errors or other warnings.
- Target/API/test membership, the three-test minimum, local prerequisite
  order, internal anchors and source page locators were checked mechanically.
  The metadata was parsed as TOML. The package contains no local filesystem
  paths, workflow language in the README, foundations-bookkeeping references
  or upward prerequisites to the five higher roadmaps listed below.
- `git diff --check` passed.

The current Tau Ceti roadmaps were checked read-only at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and the current library was
checked in addition to the pins. AlgebraicVectorBundles and DifferentialGeometry
were read in full. The nine roadmaps absent from the atlas snapshot were checked
for ownership; the package uses their general sheaf, tensor and coefficient
machinery. Current native twisted cohomology is cited by the exact
`TauCeti.LocalCoefficientSystem` names, not planned again.

Source checks included Birkbeck–Heuer–Williams, Deligne–Pappas,
Andreatta–Iovita–Pilloni, Taylor, Yuan–Zhang and the available dated erratum,
Carayol, Boutot–Carayol, Boutot–Zink, Khare–Wintenberger and the two
Colmez–Dospinescu–Nizioł texts. Allen et al. was read in the maintainer-cleared
copy. All repository prose states mathematics in our own words; no source
passage or private source file was copied.

Additional direct sources are Diamond §§3.1–3.2, pp.9–12 for open Hodge lines
and scalar descent; Dimitrov Theorem 8.6(iv), p.548 for the restricted
characteristic-zero cusp target; Badulescu–Renard Theorem 18.1(a)–(b),
pp.44–45 of the author preprint for quaternionic transfer; and Deligne,
Weil II, §3.3, pp.204 and 206 for purity of proper smooth coefficient cohomology.
Their statements and hypotheses were read before using them. AIP locators
now include pp.10–11 and 22–23. Allen citations use published pagination.

## Ownership moves for the maintainer

The tier order requires the following restricted constructions here. Redirect
the higher plans to these owners; general theories stay with their original
roadmaps. No higher packet was edited.

| Higher roadmap | New owner and scope |
| --- | --- |
| ShimuraCompactifications | `H5/quadratic-domain-boundary`: the characteristic-zero minimal cusp calculation with Dimitrov's precise tame hypotheses. `H6/twisted-component-descent`: the ample-line argument for the selected fine characteristic-zero component, using polarized moduli and the tensor of Galois conjugates. No general toroidal or integral compactification theory is moved. |
| AutomorphicBundles | `H5/hodge-splitting-descent` and `H5/algebraic-weights-units`: open characteristic-zero Hilbert Hodge factors, determinant twists and the exact scalar-stabilizer character criterion. `R18.2/arithmetic-hodge-line`: the quaternionic rational dualizing-line extension by norms. General bundle operations come from AlgebraicVectorBundles. |
| ArakelovGeometryAndAbelianHeights | `R18.2/arithmetic-hodge-line`: its specific hyperbolic metric and cover-norm/gluing construction. Arithmetic intersection heights are not moved. |
| GL2AutomorphicRepresentationsAndTransfer | `R18.3/definite-jl`: the quaternionic global transfer, its local normalization, compatible coefficient realizations and multiplicity one, including the division one-real-split case needed by `R18.4/definite-indefinite-comparison`. `R18.3/dyadic-sign-extension`: the local reduced-norm valuation/parity calculation. The split Hecke and norm-branch targets use AF.5 and AA.4 directly. General GL₂ classification is not moved. |
| AutomorphicGaloisRepresentations | `R18.3/residual-hecke-ideal`: formal polynomial evaluation and factorization under the explicit relation-ideal inclusion. `R18.3/tw-localised-control`: the Steinberg exclusion from the supplied characteristic-zero Galois/local compatibility data. These targets do not construct Galois representations or establish an automorphic eigensystem. |

The outside-tier structured ordinary Honda–Tate input is also made a construction
within `H6/hilbert-finite-local-points`: retain Taylor's CM order, Serre tensor,
Rosati-compatible trace polarization, norm-class ideal adjustment, both paired
markings and the selected component before using A4 lifting. The old reference
to the general simple isogeny class in AbelianSchemesAndArithmeticModuliPartII
is insufficient for these structures. This remains a mathematical construction
to prove, not a new existence assertion for arbitrary residual modules.

## Input qualifications that remain

The issue describes its plan as complete, but its accepted packets explicitly
record eight and seven gaps and mark no stage closed. Packaging does not certify
those gaps as solved. The roadmap preserves their scope and mathematical
conditions. Resume their mathematics at the named targets:

1. `H2/dp-integral-model` and `H2/hasse-formal-domains`: arbitrary-prime
   scheme representability for the μ_N functor. Until its proof, the global
   DP model is an algebraic space and formal constructions use étale charts.
   H1's final sentence was reconciled with that restriction.
2. `H4/integral-gamma0`: the ramified ideal-annihilator and flat-closure
   comparison for the naive finite-flat isotropic level problem.
3. `H3/hilbert-hecke-isogenies`: the precise finite-flat hypotheses and
   polarization-descent argument behind BHW Lemma 8.22/Kisin–Lai §1.9.
4. `H6/hilbert-finite-local-points`: Taylor's actual local CM-character
   hypotheses and the structured ordinary realization described above.
5. `H6/allen-finite-local-points`: compatible paired markings and component
   checks in both finite-flat cases. Allen Lemma 7.1.8(1), pp.1091–1092 uses
   ℤ_l coefficients and unramified base; its connected–étale refinement is
   explained on p.1105. The Frobenius scalar uses the actual residue degree,
   and the ordinary lift is the negative residual class of Lemma 7.2.2.
6. `R18.1/yz-component-comparison`, `R18.2/connected-pel-comparison` and
   `R18.2/finite-pel-comparison`: restore the exact comparison field,
   descent cocycle, norm-one quotient and tame-level dependence from Carayol.
   The geometric comparison does not itself prove descent over K. The
   arithmetic-uniformisation route using this bridge retains that condition.
7. `H4/connected-limit-finiteness`: downstream S5/O4 must use eventual
   **images**. At p=2 the projections to the full finite-level groups need
   not stabilize to isomorphisms. Neither false step in BHW Lemma 8.20 is
   used as a theorem here.
8. The missing relative moduli, finite-flat torsion, canonical-model,
   integral-crystal and formal Drinfeld carriers account for the two
   suggested-file omission gaps. Replace comments by actual signatures
   when the specified suppliers exist; compilation currently verifies only
   the typed cores.
9. `R18.2/integral-kodaira-spencer`: construct the saturated strict
   O_v-relative filtration at ramified places and its determinant comparison.
10. `R18.2/bridge-filtered-crystal` and `R18.2/bridge-determinant`: prove
    the ramified integral tensor law. Raw embedding quotients and the printed
    equality of O_E-linear and O_B-linear deformation Hom spaces do not prove it.
11. `R18.3/neatness-base-change`: collate the exact Khare Lemma 2.2 in
    Duke 134 (2006), 557–589. The differently numbered arXiv proposition
    does not establish the routed assertion. Actual stabilizer hypotheses
    remain explicit; global auxiliary-field selection is not imported upward.
12. `R18.4/cohomological-degeneracy`: the indefinite integral Ihara and
    saturation result needs its own proof with the actual weight/image/prime
    hypotheses. KW's definite Lemma 7.1 is cited as an analogue only.
13. `R18.4/integral-cohomology-control`: verify both localized residual
    H⁰ vanishings before exporting integral freeness and coefficient reduction.
    `R18.4/quaternion-purity` likewise requires the actual geometric projector;
    YZ §3.2 supplies the family, and Weil II supplies purity after that check.

No packet, source-issue record, consumer roadmap or upstream file was changed.
Independent package review is the next step; no further work from this job is
waiting in scratch space.
