# PKG-LanglandsParameterStacks — blocked checkpoint

Issue: #7909. Worker: Codex (GPT-6), session `codex-G3dxqt`.
Date: 2026-10-10. Claim confirmed by the swarm bot at comment 6092054318.

## Outcome

This is a checkpoint, **not a completed package**. The roadmap README contains
all 79 retained targets, all 140 API items and all 90 definition/construction
tests. Its suggested file elaborates, but contains ordinary algebraic and
continuous signatures rather than the full enhanced signatures required by
PROTOCOL §§13 and 20. In particular, a successful Lean check does not establish
agreement with every definition, theorem, API item and test of the accepted
plan. No mathematical result is claimed implemented.

`metadata.toml` is intentionally absent. Package completion in
`research/blueprint/issues.py` is detected from existence of all output paths;
writing that last file would incorrectly send this incomplete package to
independent package review. On completion its content should be
`topic = "math.NT"`.

Only these deliverables were changed:

- `research/blueprint/packages/LanglandsParameterStacks/README.md`
- `research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`
- this handoff note

The accepted packet, reader document, original suggested file, other owners,
atlas and source-issue register are unchanged.

## Blocking condition and required resolution

The accepted input explicitly records `LanglandsParameterStacks:G3`:
animated parameter/quotient stacks, stable infinity-category Perf/IndPerf,
full cotangent complexes, coherent singular support, relatively discrete
condensed coefficient tensors, geometric parabolics and admissible complex
enhancements are missing from its suggested signatures. Its trailing
comment inventory is not a typed declaration or a Lean example. Joining the
ordinary part of that file cannot satisfy the every-name requirement of
PROTOCOL §13.

The requested general supplier interface is not yet usable for those types.
In `research/blueprint/suggested/EnhancedDerivedSheaves--E5.lean`,
`SymMonInftyCat` has `True` fields at lines 79–81, `CAlg` is `Unit` at
line 104, stability has `True` fields at lines 113–115, compactness and
Ind-completion are `True` at lines 141 and 145, and `AnimatedAlg` is `Unit`
at line 199. Those cannot serve as the claimed enhanced carriers.
The quasicategory carrier earlier in that file does not supply its missing
monoidal, stable, animation and descent interfaces. Neither the pinned
libraries nor the current upstream search supplies a replacement.

This is a **design/signature blocker**, not a request for formal proofs of
the whole supplier. To unblock it, settle faithful carrier and coherence
contracts at the existing suppliers, then use them here. General animation,
stable monoidal infinity categories, derived quotient-stack descent and
singular support must retain their existing owners; constructing another
general framework inside this package would violate PROTOCOL §15 and the
accepted scope. An ordinary category, arbitrary coordinate family or split
matrix model may continue to document an ordinary shadow, but must not be
renamed as the full requested object.

### Continuation checklist

The canonical declaration names, all API items and all tests are in the
unchanged accepted packet and are now readable in the corresponding README
sections. The following table describes the missing full interfaces; it is
not a declaration-count claim based on text matching.

| Targets | Interface to settle and then use |
| --- | --- |
| LP0 condensed parameters and finite wild ramification | `condensedCoefficients`, natural coefficient functors, the finite-type module condition and full `LParameter.matrixCriterion`, `ext`, finite-wild existence and continuity tests. Ordinary continuous maps alone are insufficient. |
| LP0 wild parameters and enhancements | Actual Weil/L-group projection and finite-image conditions; canonical central identification, quotient representations and conjugacy transport; admissible complex extending parameters with the SL₂ factor; `ExtendedWildParameter`, `WildParameterClasses` and restriction of enhancements. The current subgroup quotient only takes a supplied central subgroup. |
| LP1 framed schemes and derived stacks | `IntegralCocycleScheme` with representability, universal cocycle and base-change/presentation API; `DerivedParameterStack` and its framed/quotient comparison, classical truncation and enhanced perfect pullback. Then state the geometric dimension, flatness, lci and derived-comparison theorems. |
| LP1 deformation and support | Continuous derived Weil cochains, Tate duality, full cotangent dual with its shift and Tate twist; `ParameterSingularities` and coherent support with smooth descent and relative Hochschild action. The current GL nilpotent-cone subset has no coherent-support comparison. |
| LP1 Weil–Deligne comparison | General pinned-dual cocycles with monodromy in its Lie algebra and the transported geometric Frobenius degree, followed by quasi-unipotent/logarithmic comparison. The current signature is explicitly split GLₙ. |
| LP2 quotient and closed-orbit classification | Actual scheme-invariant coordinate diagrams, coarse quotient and universal quotient maps; genuine parabolic/Levi families, absolute and strong reducibility, and semisimple-parameter API. The coaction equalizer and supplied-subgroup predicates do not state these geometric theorems. |
| LP2 free excursion construction | `FreeCocycleIndex.coordinateDiagram`, the derived free-resolution colimit, the canonical excursion/coarse-quotient comparison and group transport, with the universal-homeomorphism theorem. The ring-colimit prototype currently takes an arbitrary supplied diagram. |
| LP2 Hecke and invariant-function constructions | Coherent finite-set stable monoidal datum, creation/annihilation/reindexing and `ExcursionDatum.operator`; categorical independence of presentation and the enhanced excursion universal property. The matrix coefficient currently has an ordinary representation input. |
| LP2 projected pseudocharacters and trace comparison | A fibre adapter over the actual IHG coordinate/point interface, including `ofLift`, component evaluation and all reconstruction/continuity comparisons. Join the group-basis trace adapter to IHG's algebra-linear pseudocharacter, with representation and coefficient-change API. The supplied-coordinate and group-trace shadows are not those owner adapters. |
| LP3 | All enhanced good-filtration t-structure, induced-perfect subcategory, bar, adjoint-unit, fixed-locus, mapping-approximation, gerbe and generation signatures; regular reductive/group-scheme structural inputs for the centralizer and slice theorems. The native fixed-subgroup examples alone do not state a scheme fixed-locus or generation theorem. |
| LP2 integral invariants and LP4 | Derived invariants with continuous/condensed coefficients, higher cohomology and base change; universal representation bundles as exact monoidal functors; enhanced generation and module-category equivalences. Keep their good-prime hypotheses. |

Once these contracts are available, replace or clearly separate shadows,
state every retained theorem with its actual types, include every accepted
API signature and named example, and run `lean-check` again. Do not fill
missing statements with unconstrained `Prop` fields, `True`, or `Unit`.
Complete the metadata only after this agreement audit passes.

## What this checkpoint establishes

The README gives the upstream roadmap introduction, coefficient/Frobenius/
shift conventions, ownership boundaries, prerequisites, targets, proof
routes, source locators, API and discriminating tests. It has seven build
groups: LP0, LP1, LP2 excursion presentation, LP2 semisimple characters,
LP3, LP2 integral invariants and LP4. The derived free-cocycle colimit is
placed before the excursion comparison that needs it. Internal target
prerequisites link to the earlier named targets. External roadmap links use
the current upstream `TauCetiRoadmap/` directory layout.

Ten previously delegated targets stay delegated: eight Chapter X universal
action/application targets belong to ExcursionOperatorsAndSpectralAction,
and the two generic finite-anchor/reconstruction targets belong to IHG.
They have not been rebuilt as local nodes. The generic highest-weight
theory likewise stays with ReductiveGroupsIntegralRepresentationsPartII.

The suggested file strengthens the executable ordinary portion materially:

- crossed-cocycle gauge, restriction, coefficient-map and orbit laws,
  including a genuine nontrivial action test;
- ordinary continuous gauge and coefficient maps, and semidirect-product
  lifts with the prescribed projection;
- finite-wild inflation and the twisted-centralizer subgroup/projection;
- the scheme-coaction equalizer's injection and universal factorization,
  including the characteristic-two test distinguishing scheme invariants
  from invariance under rational points;
- the free-index coproduct maps and universal laws, siftedness, and ordinary
  colimit maps and uniqueness, with free-group and constant-diagram tests;
- explicit projected-coordinate compatibility and continuity shadows;
- group-basis linear extension/restriction and cycle normalization that
  includes fixed one-cycles;
- the split GLₙ Weil–Deligne scaling and matrix counterexample tests;
- restored baseline `TauCeti.fixedSubgroup` point checks.

The old omission inventory is absent from Suggested.lean; the present
header and this handoff explain the limitations. Names appearing only in
README or this note are not counted as Lean signatures.

## Source and mathematical checks

All seven public PDFs were downloaded afresh and their SHA-256 hashes match
the accepted packet's `sourceVersions` entries. Sources and public links
are in the package bibliography. No restricted book was needed or copied.
The source readings supporting the retained targets were:

| Source | Readings in this run (printed pagination) |
| --- | --- |
| Fargues–Scholze, author Geometrization PDF | VIII.1–VIII.5, pp.278–315, including all retained parameter, invariant and generation statements and their arguments. |
| Lafforgue, arXiv:1209.5352 | Lemma 10.1, pp.133–135; Lemma 10.6 and Proposition 10.8, pp.138–139; §11, pp.141–147, including Proposition 11.7, Remark 11.8 and Lemmas 11.9–11.10. |
| BHKT, Acta 223 (2019) | §§3–4, pp.10–24; Proposition 8.3, p.53. |
| Zhu, arXiv:2008.02998 | §3.1, pp.31–36, including Lemmas 3.9–3.10, Corollary 3.11 and Proposition 3.12. |
| Dat–Helm–Kurinczuk–Moss, arXiv:2009.06708 | Introduction, pp.4–7; Theorem 4.1 and Corollary 4.2 with proofs, pp.29–31. |
| Kurinczuk–Skodlerack–Stevens, arXiv:1611.02667 | §§1.20–1.21 and equation (1.1), pp.8–9. |
| Quast, author copy dated 23 October 2023 | Definition 3.1, Lemmas 3.4–3.6, Theorem 3.7 and its proof, pp.11–15; beginning of the continuity argument for Theorem 3.8. |

The package preserves these distinctions:

- `σ⁻¹τσ=τ^q` with geometric degree `deg(σ)=1` gives the monodromy
  scaling `q⁻¹`, whereas arithmetic Frobenius is `σ⁻¹`.
- Cotangent duality uses the dual Lie algebra with its Tate twist, without
  assuming a canonical self-duality of the integral adjoint module.
- The map from degree-one cotangent-dual cohomology to relative Hochschild
  degree two does not identify all Hochschild degree two with singularity
  operators.
- Finite-Q disconnected algebraic reconstruction and the all-characteristic
  closed-orbit/universal-homeomorphism route have no good-prime or
  prime-to-|Q| hypothesis. The integral isomorphism, cohomology/base-change
  and generation upgrade carries the stated fundamental-group restriction.
- Quast's Theorem 3.8 proof assumes compactness of the reconstructed image
  before deriving its continuity. That proof is not used to supply the
  missing relatively discrete condensed extension.
- Wild enhancement uses the twisted centralizer and the Weil-fixed centre;
  replacing it by the component group of the ordinary wild centralizer
  loses the prescribed projection. The complex scope requires admissibility
  and an extending SL₂ factor, and does not assert irreducibility of every
  restricted enhancement.
- Integral Chevalley restriction here is for the group, at all primes,
  rather than an unrestricted Lie-algebra Chevalley theorem.
- Formal slices require trivial scheme stabilizers. Finite-group mapping
  approximations retain their torsor data.
- The normalization construction uses the relative algebraic closure of
  the base fraction field in the ambient field, not a transcendental
  extension as the finite normalization input.

### Input corrections to route to the plan owner

1. In `LP3/bad-prime-fixed-counterexample`, the statement and hypotheses
   correctly describe the order-two swapping example in characteristic
   two. Its source `match` text incorrectly presents this as establishing
   necessity of the fundamental-group restriction. Fargues–Scholze
   VIII.5.18, p.308, violates the **prime-to-characteristic order of P**
   assumption. The package describes that actual obstruction and does not
   claim it establishes necessity of the separate π₁ hypothesis.
2. The joint Lafforgue locator for Lemma 10.1 and Proposition 10.8 omits the
   beginning of Proposition 10.8 on p.138. The package cites pp.133–135,
   138–139. No packet edit was made.

### Other recorded gaps

G1 remains the registration/design problem for structural reductive
extensions, integral highest-weight supplier stage IDs and complex
enhancements. Do not report the extra fixed-point, centralizer and
representation statements as already proved by RG2.5.

G4 remains the finite-Q characteristic-zero relatively discrete continuity
calculation, with preservation of finite-type ℤ_ℓ modules on compact
inertia. Its disconnected algebraic reconstruction part is already routed
to the accepted IHG revision; the latter is different from current
upstream's connected/GL prototypes.

G6 remains reconciliation of the external generic IHG prerequisites and
shared field-GIT ownership. The field route must not inherit the entire
good-prime LP3 generation layer. No external edge was edited here.

G2 is the source's open question about independence of the **full**
excursion algebra at arbitrary bad primes. The package only plans the
established torsion-free independence assertion. Do not unblock this
checkpoint by inventing the stronger independence theorem.

## Baseline and current upstream audit

Read the LanglandsParameterStacks entries of the reviewed library audit
and all 31 baseline declaration statements. Their shared-build source
files were checked byte-for-byte against the corresponding pinned git
objects, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Read the current upstream ReductiveGroups and ProfiniteArithmetic READMEs
in full, with their relevant suggested signatures. Searched the nine
roadmaps added after the atlas snapshot—AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory,
OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry—including all OperatorTheory suggested parts, for
overlap with the retained parameter-stack targets. Used their carriers as
prerequisites rather than replanning them.

The upstream checkout advanced from
`37769f03c170a7bc3e1082df70522a0ad59c5ffd` to
`d6f707516e7ede3181dac4b2420ba25c0799d22d` during this run. Audited the
affected IHG and ReductiveGroupsPartII README/Suggested interfaces again:
RG2.5 owns the dual Hopf algebra, actual torus/root groups, pinned finite
action and L-group; IHG.0 owns actual Hopf-point invariant coordinates and
compatible pseudocharacters; IHG.6.4's good filtrations are the GL₂ Ribet
inputs, not the general enhanced parameter-stack t-structure. These do
not supply G3's enhanced categories. The current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was also searched for the missing
carriers. All current upstream/library checkouts were read only.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json`:
  passed, zero errors and zero warnings. Input unchanged.
- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  final exit status 0; 136 warnings, each exactly a declaration using
  `sorry`; zero errors and no other warning class. This validates the
  submitted ordinary signatures, **not** the omitted enhanced ones.
- README agreement check: 79 target headings, 79 source blocks, 79
  prerequisite blocks, all 140 accepted API names and all 90 test names;
  internal prerequisite anchors resolve. README is below the 200 KB limit
  and contains no job/packet/review/checkpoint ledger.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverables: passed, three files and zero problems.

No library was rebuilt, no Lake project or language server was started,
and no source PDF or extracted source text is included in this submission.
Scratch notes and downloaded public sources can be discarded after the
pull request opens; the continuation information is retained here.
