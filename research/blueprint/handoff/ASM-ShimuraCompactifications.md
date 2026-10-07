# ASM-ShimuraCompactifications — assembly handoff

Job: ASM-ShimuraCompactifications. Issue: #258. Agent: Codex, session codex-KDixts.

## Completed deliverables

The [full reader](../readmes/ShimuraCompactifications.md) joins C0–C5 and C6 under the accepted RS-32 title and first prerequisite. It preserves all 142 mathematical node statements, hypotheses, proof steps, acceptance properties, 125 API items, 97 unit tests and 40 planets. It reconciles the torus/character conventions, mixed boundary filtration, distinct coefficient bases, trace-dual cusp lattice, scheme-theoretic boundary ideals, same-fan normalization versus further subdivision, and modular level scope. Sources, versions, pinned baseline interfaces, reviewed source issues and outstanding gaps are collected in the same document.

The [full suggested file](../suggested/ShimuraCompactifications.lean) has one standard note, eleven distinct imports in one block, one noncomputable section and the original native declarations. The two geometric omission ledgers remain explicit. No placeholder carrier or arbitrary proposition fills missing geometry. Part reader and part Lean files are unchanged; the assembled reader corrects their stale counts, finite-type semiabelian wording and pre-review source-issue narrative using the current packets.

## Review and mathematical scope

No review verdict, source-issue verdict, implementation status, node statement, hypothesis, proof step, acceptance property, API or test has changed. C0 still has its 2026-10-07 **needs_changes** independent verdict because 83 geometric declarations, 109 API items and 84 tests are comment-only omissions, not typed signatures. C6 retains its accepted independent verdict. This assembly does not supersede either review or declare any stage closed. All nine coverage entries remain planned; all nodes remain unchecked.

Only the C6 packet's prerequisites, gaps and coverage-remaining text change. Twenty coarse C0/C3/C4 prerequisites across sixteen consuming nodes are refined to exact ordinary ingredient nodes. These references do not assert that completion, all-prime moduli or finite lattice-map instantiation follows automatically. Three additional consuming-part gaps record the distinction. Fifteen C6 nodes retain their broad C5 supplier dependency: its good-prime theorem does not supply the all-prime Hilbert model. Lan 2017's separate projective normalized-blowup node depends on M4 and does not repair that moduli comparison by itself.

There is no change to a reviewed node's mathematical claim requiring a mathematical rewrite review. The normal independent assembly review should check the prerequisite matching and new gaps; original reviews remain intact. Completion here means completion of the assembly job, with the inherited planning/signature obligations still open.

## Checks and limits

- Both part packets: `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraCompactifications--C0.json research/blueprint/packets/ShimuraCompactifications--C6.json`: zero errors and zero warnings.
- Combined declaration graph: all 142 node IDs distinct, every internal exact-node prerequisite resolves, no internal declaration cycles. This is not a claim that unresolved external stage contracts have a closed global dependency graph.
- Reader catalogue: every packet node, statement, hypothesis, proof step, prerequisite, acceptance property, API and test is preserved in the corresponding entry; counts and stage order agree with both packets.
- Lean assembly: imports deduplicated; native part bodies preserved except the redundant second noncomputable section. No declaration-name edits, reproofs or added geometric signatures. The old source ledgers remain comments, not evidence of compilation.
- Cited baseline statements read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including source-generated additive interfaces. Reviewed library coverage and accepted RS-32 ownership were read. Library source access does not establish compiled availability.
- **Joined Lean file not compiled.** The existing shared build has pinned Mathlib, but its Tau Ceti checkout differs from the pin and lacks the required Tau Ceti object files. WORKERS.md prohibits setting up or building another environment; no Lean compiler, language server or Lake build/update/cache process was started by this assembly. The part reviews' Mathlib-only/native arithmetic checks are inherited evidence, not a check of the joined file.
- Source records preserve prior extraction and independent-review provenance. Assembly does not claim a new full reading of the listed papers or a new verification of the version of record.

## Cross-part prerequisite reconciliation

| Consuming C6 node | Old stage contract | Exact ordinary ingredients |
| --- | --- | --- |
| `ShimuraCompactifications:C6/meromorphic-cusp-support-bound` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/formal-universal-degeneration` |
| `ShimuraCompactifications:C6/hilbert-cusp-positive-support` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/relative-boundary-coordinates` |
| `ShimuraCompactifications:C6/hilbert-cusp-positive-support` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/formal-universal-degeneration` |
| `ShimuraCompactifications:C6/arithmetic-koecher` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/formal-universal-degeneration` |
| `ShimuraCompactifications:C6/admissible-fan-specialization` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/arithmetic-admissible-fan` |
| `ShimuraCompactifications:C6/uniformized-level-chart` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C4/endomorphism-extension`, `ShimuraCompactifications:C4/boundary-level-comparison` |
| `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/relative-boundary-coordinates` |
| `ShimuraCompactifications:C6/hilbert-boundary-etale-charts` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/relative-face-open` |
| `ShimuraCompactifications:C6/hilbert-regular-refinement` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/smooth-projective-refinement` |
| `ShimuraCompactifications:C6/hilbert-regular-refinement` | `ShimuraCompactifications:C3` | `ShimuraCompactifications:C3/refinement-map` |
| `ShimuraCompactifications:C6/hilbert-semiabelian-extension` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/homomorphism-extension`, `ShimuraCompactifications:C4/endomorphism-extension` |
| `ShimuraCompactifications:C6/hilbert-conormal-comparison` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/formal-universal-degeneration` |
| `ShimuraCompactifications:C6/hilbert-toroidal-proper` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/degeneration-effectivity` |
| `ShimuraCompactifications:C6/hilbert-q-expansion-comparison` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/relative-regular-coordinates` |
| `ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/relative-boundary-coordinates` |
| `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/boundary-level-comparison` |
| `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison` | `ShimuraCompactifications:C0` | `ShimuraCompactifications:C0/compatible-common-refinement`, `ShimuraCompactifications:C0/relative-torus-embedding` |
| `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison` | `ShimuraCompactifications:C3` | `ShimuraCompactifications:C3/level-datum-functoriality`, `ShimuraCompactifications:C3/choice-comparison` |
| `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/tate-degeneration-comparison` |
| `ShimuraCompactifications:C6/modular-formal-cusp-comparison` | `ShimuraCompactifications:C4` | `ShimuraCompactifications:C4/tate-degeneration-comparison`, `ShimuraCompactifications:C4/boundary-level-comparison` |

### Additional consuming-part gaps

#### Completed Hilbert charts and finite changed-lattice maps beyond ordinary C0 nodes

**neededBy.** ShimuraCompactifications:C6/hilbert-cusp-positive-support

ShimuraCompactifications:C6/admissible-fan-specialization

ShimuraCompactifications:C6/hilbert-boundary-formal-comparison

ShimuraCompactifications:C6/hilbert-boundary-etale-charts

ShimuraCompactifications:C6/hilbert-regular-refinement

ShimuraCompactifications:C6/hilbert-q-expansion-comparison

ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward

ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

**detail.** Assembly identifies ordinary ingredients by C0/relative-torus-embedding, relative-face-open, relative-regular-coordinates, relative-boundary-coordinates, arithmetic-admissible-fan, compatible-common-refinement and smooth-projective-refinement. These statements do not construct the completed arithmetic unit quotient, its module-valued support/localization description, or the finite normalization induced by a finite lattice map with its pullback fan. Apply the existing F0 completion/detection requests to the actual Hilbert cusp lattices and prove the residual C0 request. In regular local coordinates the boundary UNION ideal is (x_1 ... x_r), whereas the C0 intersection node has ideal (x_j : j in J). Derive the union formula from the monomial basis; do not identify these two ideals. Its quotient-basis/flat geometric-reducedness argument over the integral cusp base and the compatible changed-lattice finite map are explicit missing comparisons, not consequences of face-open or refinement properness alone.

#### Hilbert integral effectivity and minimal geometry outside the good-prime C5 scope

**neededBy.** ShimuraCompactifications:C6/hilbert-cusp-positive-support

ShimuraCompactifications:C6/arithmetic-koecher

ShimuraCompactifications:C6/hilbert-toroidal-model

ShimuraCompactifications:C6/hilbert-toroidal-proper

ShimuraCompactifications:C6/hilbert-hodge-semiampleness

ShimuraCompactifications:C6/hilbert-minimal-contraction

ShimuraCompactifications:C6/hilbert-minimal-finite-generation

ShimuraCompactifications:C6/hilbert-minimal-normal-projective

ShimuraCompactifications:C6/minimal-polarization-quotient

ShimuraCompactifications:C6/hilbert-minimal-cusps

ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres

ShimuraCompactifications:C6/hilbert-minimal-weight-extension

ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward

ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

ShimuraCompactifications:C6/modular-toroidal-minimal-comparison

**detail.** No C5 node supplies the full existing C6-to-C5 request over B=Z[1/N(n)] when the discriminant is not inverted. C5/integral-toroidal-space, formal-completion, valuative-properness and hodge-semiampleness require the good-prime PEL model (the first also a smooth compatible fan); C5/graded-section-finite-generation and integral-minimal-space build on that same model. They cannot be substituted for Hilbert toroidal/minimal existence, Hodge positivity, integral connected/reduced boundary fibres or their structure-sheaf comparison at discriminant primes. C5/projective-normalized-blowup supplies a different projective normalized model conditional on an M4 ramified interior/minimal/lattice-collection interface, not an identification with the H2 Deligne–Pappas model or a proof of its global B-model. Retain the exact C5 stage request, with H1/H2 moduli and local-model inputs. Establish its Hilbert specialization by the Dimitrov construction and the stated formal effectivity/descent, then export the precise determinant-section-ring, Veronese, cusp-fibre and coherent-base-change statements. Degree-one generic comparisons may use the characteristic-zero restriction, but this does not fill the integral all-prime request. No new compactification carrier or broader good-prime theorem is asserted.

#### Hilbert instantiation of generic C3 and C4 boundary morphisms

**neededBy.** ShimuraCompactifications:C6/hilbert-regular-refinement

ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison

ShimuraCompactifications:C6/modular-formal-cusp-comparison

**detail.** C3/refinement-map and level-datum-functoriality specify the generic characteristic-zero map contract and its separate C5 integral instantiation. C4/boundary-level-comparison supplies degeneration-level and Tate comparisons with M4 normalization inputs. After C6 identifies its actual Hilbert models, transport these map contracts to H1/H2/H4 cusp data: choose compatible fans for each lattice map, prove identity/composition on the completed models, and distinguish a finite pullback-fan normalization from a further proper nonfinite refinement. The discriminant-prime integral model identification and wild-level extension remain the existing H2/H4/C5 request. The referenced generic node does not establish that identification by itself.

## Collected supplier requests

All 56 requests below are preserved verbatim from the two packets. Same-roadmap requests still describe missing completion, arithmetic and instantiation interfaces after the ordinary ingredients have been matched. Resolving a stage name to a node does not discharge the remainder of its request.

### Part C0

#### C0.1: `AbelianSchemesAndArithmeticModuli:A2`

Existing relative abelian/group-scheme carriers, invariant differentials and family maps; fibrewise semi-abelian extension statements are new C4 targets.

**Needed by.**

- `ShimuraCompactifications:C1/boundary-torsor-tower`
- `ShimuraCompactifications:C4/semi-abelian-scheme`

#### C0.2: `AbelianSchemesAndArithmeticModuli:A3`

Dual abelian schemes and polarization/Rosati morphisms with their actual finite-kernel hypotheses; not a nonexistent dual of every semi-abelian scheme.

**Needed by.**

- `ShimuraCompactifications:C4/poincare-extension-classification`
- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `ShimuraCompactifications:C4/endomorphism-extension`
- `ShimuraCompactifications:C4/semiabelian-tate-module`

#### C0.3: `AbelianSchemesAndArithmeticModuli:A4`

Abelian finite torsion and full/primewise Tate modules with continuous Galois action in characteristic zero, their multiplication transition maps and functoriality. C4 imports these and only adds the semi-abelian torus-extension instance.

**Needed by.**

- `ShimuraCompactifications:C4/semiabelian-tate-module`

#### C0.4: `AbelianSchemesAndArithmeticModuli:A5`

Poincare/cubical biextensions, polarized complex-torus algebraization and relative line-bundle identities, plus the theta-generation input for the Hodge semiampleness theorem. These generic abelian constructions are imported rather than duplicated.

**Needed by.**

- `ShimuraCompactifications:C1/boundary-torsor-tower`
- `ShimuraCompactifications:C4/poincare-extension-classification`
- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `ShimuraCompactifications:C5/hodge-semiampleness`

#### C0.5: `AdelicAlgebraicGroups:AA.3`

Rational boundary arithmetic lattices, effective stabilizers, finite cusp double-coset sets and the AMRT reduction input used in Pink 6.19/6.22. Full arithmetic stabilizers may have infinite ineffective kernels.

**Needed by.**

- `ShimuraCompactifications:C1/cusp-label`
- `ShimuraCompactifications:C1/arithmetic-stabilizer`

#### C0.6: `AdicSpacesPartII:F0`

For the completed ordinary Igusa charts in BP 3.4.15–3.4.16, supply a basis of affine formal opens and the finite-thickening coherent sheaves, their local higher-cohomology vanishing and surjective/Mittag-Leffler transition maps. Apply F0/cohomology-of-mittag-leffler-limit only with ALL its local/global hypotheses; prove the comparison for the actual refinement before passing to completed cohomology. The formal-functions theorem alone does not imply chart acyclicity.

**Needed by.**

- `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`

#### C0.7: `AdicSpacesPartII:R2`

Normal formal/rigid geometry and exact ordinary/minimal open comparison, formal Hartogs for line bundles and verified special-fibre hypotheses; no unproved interchange of inverse limit and cohomology.

**Needed by.**

- `ShimuraCompactifications:C5/ordinary-koecher`
- `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`

#### C0.8: `AdicSpacesPartII:R3`

Pilloni coherent analytic comparison, partial ordinary/formal charts and Klingen correspondence compactification in the exact level/coefficient setting. The boundary factorization needed for first-arrow acyclicity remains explicit.

**Needed by.**

- `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`
- `ShimuraCompactifications:C3/klingen-correspondence-compactification`
- `ShimuraCompactifications:C3/klingen-correspondence-acyclicity`
- `ShimuraCompactifications:C5/ordinary-koecher`

#### C0.9: `ArithmeticGaloisDuality:R02.1`

Actual compact/profinite coefficient carrier, continuous Galois modules and exactness of inverse limits of the finite surjective torsion systems; full-versus-primewise product comparison. No private general inverse-limit or topological Galois cohomology theory is constructed in C4.

**Needed by.**

- `ShimuraCompactifications:C4/semiabelian-tate-module`

#### C0.10: `AutomorphicBundles:B3`

Integral good-prime and normalized canonical/subcanonical coefficient functors with their exact formal character-line form and finite coefficient filtration. The present characteristic-zero canonical-extension/refinement nodes supply that case only. Subcanonical pullback must use C3 derived boundary-ideal comparison.

**Needed by.**

- `ShimuraCompactifications:C5/integral-coefficient-extension`
- `ShimuraCompactifications:C5/good-boundary-cohomology-export`

#### C0.11: `AutomorphicBundles:B4`

Invariant Hodge bundle of the universal semi-abelian family, determinant line, Siegel rank-two coefficient functors, and normalized integral base change. The logarithmic Kodaira–Spencer and ample minimal-line instances belong to C4/C5, not a redefinition of the bundles.

**Needed by.**

- `ShimuraCompactifications:C3/coherent-cohomology-invariance`
- `ShimuraCompactifications:C4/tate-log-kodaira-spencer`
- `ShimuraCompactifications:C5/log-kodaira-spencer`
- `ShimuraCompactifications:C5/hodge-semiampleness`
- `ShimuraCompactifications:C5/minimal-hodge-ampleness`
- `ShimuraCompactifications:C5/integral-coefficient-extension`
- `ShimuraCompactifications:C5/siegel-canonical-bundle`

#### C0.12: `AutomorphicBundles:B5`

Exact Fourier–Jacobi coefficient, positivity/constant-term and finite-growth inputs for minimal boundary identification and Koecher. Consume these only after the early toroidal/properness construction; no return import of all C5 to an early C5 node.

**Needed by.**

- `ShimuraCompactifications:C5/integral-minimal-space`
- `ShimuraCompactifications:C5/normalized-koecher`

#### C0.13: `AutomorphicGaloisRepresentationsPartII:AG2.4`

The Lan–Stroh nearby-cycle/open comparison and etale duality for the hyperspecial good-reduction Siegel cohomology theorem. C5 exports the precise smooth proper boundary geometry; smoothness of a nonproper open does not prove unramified cohomology.

**Needed by.**

- `ShimuraCompactifications:C5/good-boundary-cohomology-export`

#### C0.14: `ComplexComparisonPartII:C2`

For an actual finite-type separated complex algebraic scheme or algebraic space, supply analytic properness/compactness equivalence with algebraic properness and compatibility with the nilpotent-preserving analytification carrier. For projective toroidal algebraization supply the compact analytic-space theorem with the actual positive/ample line, rather than assuming that every compact analytic space is algebraic. No matching C2 node was found, so these are requested interfaces, not verified existing results.

**Needed by.**

- `ShimuraCompactifications:C2/compactness-properness`
- `ShimuraCompactifications:C2/projective-algebraization`

#### C0.15: `ComplexComparisonPartII:C4`

Import C4/repair-proper-morphism-algebraicity only for its stated proper complex SCHEMES. Additionally supply Pink 12.4–12.5 algebraic-space algebraization from the compact toroidal charts/ample-cover data and the effective descent extension for algebraic spaces. The existing proper-scheme Hom comparison does not provide either existence of an algebraization or the algebraic-space extension. Specify the boundary canonical descent compatibility before using this interface for canonical models.

**Needed by.**

- `ShimuraCompactifications:C2/projective-algebraization`
- `ShimuraCompactifications:C2/minimal-boundary-map`
- `ShimuraCompactifications:C2/canonical-toroidal-model`

#### C0.16: `ModularCurvesPartII:R13.1`

The existing dimension-one generalized elliptic/Tate n-gon family, period q, invariant relative differential du/u, torsion and the actual isogeny/base-parameter maps. Also supply its normalized logarithmic Kodaira–Spencer comparison. The file named R13.3 currently contains only R14 targets, so no absent Tate node is invented.

**Needed by.**

- `ShimuraCompactifications:C4/boundary-level-comparison`
- `ShimuraCompactifications:C4/tate-degeneration-comparison`

#### C0.17: `ModularCurvesPartII:R13.2`

The existing dimension-one generalized elliptic/Tate n-gon family, period q, invariant relative differential du/u, torsion and the actual isogeny/base-parameter maps. Also supply its normalized logarithmic Kodaira–Spencer comparison. The file named R13.3 currently contains only R14 targets, so no absent Tate node is invented.

**Needed by.**

- `ShimuraCompactifications:C4/boundary-level-comparison`
- `ShimuraCompactifications:C4/tate-degeneration-comparison`

#### C0.18: `ModularCurvesPartII:R13.3`

The existing dimension-one generalized elliptic/Tate n-gon family, period q, invariant relative differential du/u, torsion and the actual isogeny/base-parameter maps. Also supply its normalized logarithmic Kodaira–Spencer comparison. The file named R13.3 currently contains only R14 targets, so no absent Tate node is invented.

**Needed by.**

- `ShimuraCompactifications:C4/boundary-level-comparison`
- `ShimuraCompactifications:C4/tate-degeneration-comparison`

#### C0.19: `NeronModelsAndSemistableAbelianVarieties:R11.3`

Binding RS-32 local Raynaud/lattice uniformization and semistable reduction with the exact complete-DVR/polarization hypotheses. Its current raynaud-extension-comparison text verbally imports early C4; resolve that ownership interface to give an independently usable local supplier before the C4 relative extension. Do not close a C4→R11.3→C4 carrier cycle. Checkpoint interface retained: Binding RS-32 transfer: C4 imports the existing local polarized Raynaud/lattice uniformization construction and proves its relative cusp/effectivity extension using the same carriers. No duplicate local uniformization, and no inference that the local result already constructs the universal PEL charts.

**Needed by.**

- `ShimuraCompactifications:C4/polarized-degeneration-data`
- `ShimuraCompactifications:C4/mumford-quotient`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `ShimuraCompactifications:C5/valuative-properness`

#### C0.20: `PELModuli:M1`

The existing PEL order, lattice, pairing, reflex field, endomorphism and Rosati data, with their compatibility on families. C4 constructs the universal degeneration; this request imports its PEL input rather than asking M1 to construct that degeneration again.

**Needed by.**

- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C4/endomorphism-extension`

#### C0.21: `PELModuli:M2`

The actual good-prime moduli stack/algebraic-space and universal abelian family, including the unramified-order, lattice/polarization-defect, quaternionic p=2 and prime-to-p-level restrictions. Supply smoothness over the arithmetic base, including for the lower-dimensional cusp moduli. Do not assume integral scheme representability or quasi-projectivity before C5.

**Needed by.**

- `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`

#### C0.22: `SchemeAndStackFoundations:SF.0`

Relative Spec of graded quasi-coherent character-line algebras; ordinary localization/closed ideal and arbitrary coefficient base change; generic valuative properness and relative-affine morphism criteria; smooth/log differential coordinates, finite group order-invertible etaleness and schematic/fibrewise density. Native quotient/ideal arithmetic already in this owner is imported, not replanned. Checkpoint interface retained: Reuse generic coordinate-algebra quotients/localizations, relative Spec of quasi-coherent algebras with its universal property and base change, base change of closed intersections, smooth polynomial/Laurent charts, smooth composition and etale locality. Supply the local sheaf test for schematic density from injectivity of localization, and the open-map density argument. Existing monoid algebras and ideal quotients remain native carriers. No tensor/inverse-limit interchange is requested.

**Needed by.**

- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/relative-face-open`
- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C0/relative-stratum-quotient`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`
- `ShimuraCompactifications:C0/relative-fan-properness`
- `ShimuraCompactifications:C2/normal-open-dense`
- `ShimuraCompactifications:C3/refinement-structure-sheaf`
- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `ShimuraCompactifications:C4/extended-isogeny-kernel`
- `ShimuraCompactifications:C4/tate-log-kodaira-spencer`
- `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`
- `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`
- `ShimuraCompactifications:C5/neat-stratum-closure-proper`
- `ShimuraCompactifications:C5/log-kodaira-spencer`
- `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`
- `ShimuraCompactifications:C5/prime-Q-subgroup-extension`
- `ShimuraCompactifications:C5/siegel-canonical-bundle`

#### C0.23: `SchemeAndStackFoundations:SF.1`

Effective etale/fpqc descent for relative affine algebras, ideals and families; character-line grading of a split torus torsor with coherent multiplication and pushout along quotient tori; finite group quotients/stacks/coarse spaces and finite-etale group Isom torsors; separated/proper algebraic-space criteria. Its algebraic-space/atlas carrier nodes are imported; these additional torsor, quotient and descent APIs are not supplied by the carrier alone. Checkpoint interface retained: Actual algebraic-space etale atlases and effective descent for quasi-coherent algebras, affine relative schemes, closed ideals and their maps. For a split torus torsor, supply its character-line grading with inherited coherent multiplication and its equivalence with the actual torsor; include pushout along a split quotient torus and compatible local trivializations. This generic input precedes C0 and is not imported from the C4 consumer. Also retain the C5 stratified etale descent and connected-regular component topology; the scheme-only baseline is not already the algebraic-space theorem.

**Needed by.**

- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/relative-face-open`
- `ShimuraCompactifications:C0/relative-stratum-quotient`
- `ShimuraCompactifications:C0/relative-boundary-coordinates`
- `ShimuraCompactifications:C0/relative-fan-properness`
- `ShimuraCompactifications:C1/boundary-torsor-tower`
- `ShimuraCompactifications:C2/quotient-separation`
- `ShimuraCompactifications:C2/projective-algebraization`
- `ShimuraCompactifications:C2/canonical-toroidal-model`
- `ShimuraCompactifications:C3/refinement-structure-sheaf`
- `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`
- `ShimuraCompactifications:C3/refinement-boundary-ideal`
- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `ShimuraCompactifications:C4/constructible-character-sheaf`
- `ShimuraCompactifications:C4/poincare-extension-classification`
- `ShimuraCompactifications:C4/mumford-quotient`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C4/homomorphism-extension`
- `ShimuraCompactifications:C4/extended-isogeny-kernel`
- `ShimuraCompactifications:C5/good-algebraic-model`
- `ShimuraCompactifications:C5/etale-chart-relation`
- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C5/valuative-properness`
- `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`
- `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`
- `ShimuraCompactifications:C5/neat-stratum-closure-component`
- `ShimuraCompactifications:C5/neat-stratum-closure-proper`
- `ShimuraCompactifications:C5/nonneat-boundary-descent`
- `ShimuraCompactifications:C5/minimal-hodge-ampleness`
- `ShimuraCompactifications:C5/open-quasiprojectivity`
- `ShimuraCompactifications:C5/higher-level-toroidal-normalization`
- `ShimuraCompactifications:C5/normalized-chart-finiteness`
- `ShimuraCompactifications:C5/prime-Q-subgroup-extension`
- `ShimuraCompactifications:C5/prime-Q-generator-cover`

#### C0.24: `SchemeAndStackFoundations:SF.2`

Proper algebraic-space coherent finiteness, formal-functions/projection formula and coefficient/filtered-colimit comparisons with exact module hypotheses; finite etale Stein factor and geometric-component detector for smooth proper closures with fibrewise-dense stratum opens; finite-generation/Stein application for a semiample line. Formal Hartogs and special-fibre S2/normality must be provided for the exact formal models, separately from generic-fibre Hartogs. The cohomology of a nonproper open is not inferred from the proper theorem. Checkpoint interface retained: After SF.1 spaces/descent and proper coherent cohomology, implement the generic smooth-closure detector: for smooth proper X over a regular Noetherian base and smooth proper closed W_a with opens Z_a fiberwise dense, total-component detection by Z_a implies geometric-fiber detection. Use the finite etale Stein factor, clopen images of W_a, and density on its discrete fibers. It is one foundations theorem, not a reverse import of B5 or all SF.2 into early SF.1.

**Needed by.**

- `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`
- `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`
- `ShimuraCompactifications:C3/refinement-boundary-ideal`
- `ShimuraCompactifications:C3/coherent-cohomology-invariance`
- `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`
- `ShimuraCompactifications:C3/klingen-correspondence-acyclicity`
- `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`
- `ShimuraCompactifications:C5/nonneat-boundary-descent`
- `ShimuraCompactifications:C5/hodge-semiampleness`
- `ShimuraCompactifications:C5/graded-section-finite-generation`
- `ShimuraCompactifications:C5/integral-minimal-space`
- `ShimuraCompactifications:C5/normalized-koecher`
- `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`
- `ShimuraCompactifications:C5/ordinary-koecher`
- `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`
- `ShimuraCompactifications:C5/siegel-canonical-bundle`
- `ShimuraCompactifications:C5/projective-normalized-blowup`

#### C0.25: `SchemeAndStackFoundations:SF.3`

Relative formal schemes and projective formal algebraization/effectivity over a complete Noetherian normal base; compatible completions and normalized finite chart comparison; Proj of the finite section algebra and ample line descent. Generic coherent duality/Proj infrastructure remains owned here, while the Shimura instance is in C5.

**Needed by.**

- `ShimuraCompactifications:C1/boundary-torsor-tower`
- `ShimuraCompactifications:C2/projective-algebraization`
- `ShimuraCompactifications:C4/mumford-quotient`
- `ShimuraCompactifications:C4/degeneration-effectivity`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C5/good-algebraic-model`
- `ShimuraCompactifications:C5/formal-completion`
- `ShimuraCompactifications:C5/graded-section-finite-generation`
- `ShimuraCompactifications:C5/integral-minimal-space`
- `ShimuraCompactifications:C5/minimal-hodge-ampleness`
- `ShimuraCompactifications:C5/open-quasiprojectivity`
- `ShimuraCompactifications:C5/higher-level-toroidal-normalization`
- `ShimuraCompactifications:C5/normalized-chart-finiteness`
- `ShimuraCompactifications:C5/etale-chart-relation`
- `ShimuraCompactifications:C5/projective-normalized-blowup`

#### C0.26: `ShimuraData:D3`

Existing polarizable Shimura variation and boundary representation input with the supplied Hodge carrier, not an assumed universal abelian scheme.

**Needed by.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`

#### C0.27: `ShimuraData:D4`

D4 supplies the AMBIENT pure Shimura datum and its algebraic morphisms (D4/shimura-datum and D4/datum-morphism). Its inspected nodes do not supply the rational boundary or mixed boundary datum: import the former from V2/rational-boundary and the parabolic/unipotent/Lie structure from ReductiveGroups Layer 7; C1 constructs the latter.

**Needed by.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`

#### C0.28: `ShimuraVarieties:V8`

Actual pure canonical tower/model for the datum and reflex field; C2 additionally needs the special mixed-boundary torus/abelian-torsor canonical models and dense special points of Pink 12.13–12.17. Pure canonical models alone do not canonically descend arbitrary mixed spaces.

**Needed by.**

- `ShimuraCompactifications:C2/canonical-toroidal-model`
- `ShimuraCompactifications:C3/level-datum-functoriality`

#### C0.29: `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`

The unchanged common cone/lattice/dual-monoid/regular-basis vocabulary, finite complex affine anchor, intrinsic dual-monoid equivalence for a regular cone and integral face-localization P_tau=P_sigma+N(-m). C0 adds arbitrary coefficient rings/torsors and arithmetic infinite cone collections; no second finite fan or cone definition. Checkpoint interface retained: Use the existing lattice/cone, primitive-ray, regular-basis, dual-monoid and finite-complex toric vocabulary. Require the intrinsic additive dual-monoid equivalence for a regular cone, and the integral supporting-character/face-localization identity P_tau=P_sigma+N(-m). The C0 extension changes the coefficient base and descends actual torus-torsor algebras; it does not define a second cone, lattice, finite fan or dual monoid. The arithmetic fan is not the finite Fan carrier, and admissible-refinement existence remains additional C0 work.

**Needed by.**

- `ShimuraCompactifications:C0/relative-torus-embedding`
- `ShimuraCompactifications:C0/relative-face-open`
- `ShimuraCompactifications:C0/relative-regular-coordinates`
- `ShimuraCompactifications:C0/relative-stratum-quotient`
- `ShimuraCompactifications:C0/arithmetic-admissible-fan`
- `ShimuraCompactifications:C0/compatible-common-refinement`
- `ShimuraCompactifications:C0/smooth-projective-refinement`
- `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`
- `ShimuraCompactifications:C1/boundary-incidence`
- `ShimuraCompactifications:C2/partial-boundary-charts`
- `ShimuraCompactifications:C2.general/general-toroidal-descent`
- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C3.general/general-map-descent`

#### C0.30: `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`

Finite regular complex analytic affine toric charts and monomial face maps. Singular/nonreduced relative boundary instances additionally require the analytic-carrier supplier and separate chart extension, not an inferred manifold chart.

**Needed by.**

- `ShimuraCompactifications:C2/partial-boundary-charts`
- `ShimuraCompactifications:C2.general/general-toroidal-descent`
- `ShimuraCompactifications:C3.general/general-map-descent`

#### C0.31: `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`

Finite complex fan gluing and its actual overlap cocycle; C2 adds arithmetic quotient gluing of these local charts, not another finite toric gluing theory.

**Needed by.**

- `ShimuraCompactifications:C2/partial-boundary-charts`
- `ShimuraCompactifications:C2/quotient-separation`
- `ShimuraCompactifications:C2/arithmetic-gluing`
- `ShimuraCompactifications:C2.general/general-toroidal-descent`
- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C3.general/general-map-descent`

#### C0.32: `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`

The finite regular complex torus actions, orbit strata and boundary comparison. C0/C2 use this as the complex specialization anchor; relative integral charts and finite arithmetic quotient strata retain their additional descent hypotheses. Checkpoint interface retained: Retain the finite regular complex orbit/coordinate-boundary comparison as a specialization anchor. Compare the new relative integral formulas after the specified trivialization and extension to C. This complex theorem alone is not the arithmetic quotient or geometric-fiber theorem.

**Needed by.**

- `ShimuraCompactifications:C2/partial-boundary-charts`
- `ShimuraCompactifications:C2/smooth-normal-crossings`
- `ShimuraCompactifications:C2.general/general-toroidal-descent`
- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C3.general/general-map-descent`

#### C0.33: `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`

Finite regular complex toric maps and support-properness/refinement comparison. C0/C3 extend to arbitrary coefficients and arithmetic quotients; integral PEL properness still uses degeneration and the valuative construction. Checkpoint interface retained: Retain the RS-32 finite regular complex support-properness and refinement-map supplier for C0/C3. The actual integral properness input in C5 comes from its degeneration/valuative construction, not from this special case.

**Needed by.**

- `ShimuraCompactifications:C0/relative-fan-properness`
- `ShimuraCompactifications:C3/refinement-map`
- `ShimuraCompactifications:C3/level-datum-functoriality`
- `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`
- `ShimuraCompactifications:C3.general/general-map-descent`

#### C0.34: `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`

Existing native mixed Hodge carrier, strict morphisms, induced graded filtration and tensor/representation compatibility. C1 constructs boundary instances through h1 and preserves the supplied F; no second generic mixed Hodge structure.

**Needed by.**

- `ShimuraCompactifications:C1/mixed-boundary-datum`
- `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`

#### C0.35: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`

Existing parabolic/unipotent/centralizer Lie and rational quotient-group structure needed for the mixed boundary group and its arithmetic action; C1 only enriches the existing rational boundary datum.

**Needed by.**

- `ShimuraCompactifications:C0/arithmetic-admissible-fan`
- `ShimuraCompactifications:C1/mixed-boundary-datum`
- `ShimuraCompactifications:C1/arithmetic-stabilizer`
- `ShimuraCompactifications:C1/boundary-incidence`

#### C0.36: `AdicSpacesPartII:F0/formal-direct-image-comparison`

For the ACTUAL BCGP normal formal toroidal-to-minimal contraction, transfer O_min≅pi_*O_tor through proper completion and the specified normalized/ordinary restriction. Check the F0 node's proper locally-Noetherian SCHEME hypotheses, extend to algebraic spaces only through a separately supplied comparison, and establish any special-fibre transfer rather than using generic normality. Supply the projection formula for its specified invertible sheaf. This is not a fan-refinement morphism.

**Needed by.**

- `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`

#### C0.37: `PELModuli:M4`

Beyond the inspected good-prime higher-level-normalization node, provide Lan 2017 reference [18] Proposition 6.1 ramified p-integral normalized interior with its indexed lattice families and Proposition 6.4 projective normal minimal model over Spec O_(F0,(p)), for H with neat H^p and the exact Section 2 lattice collection. No moduli interpretation at parahoric level is assumed. The wider input is presently absent and is recorded as a gap.

**Needed by.**

- `ShimuraCompactifications:C5/projective-normalized-blowup`

### Part C6

#### C6.1: `ShimuraCompactifications:C0`

Arithmetic Hilbert admissible fans: complete positive cone, locally finite away from zero, finite modulo effective units, regular equivariant refinements; completed t-adic toric charts, coefficient/support description, localization shifts and boundary-union ideal (t), retaining nilpotents. Existing relative regular-coordinate nodes are reused; this request is for their missing completion and arithmetic admissibility interfaces. Supply the toric boundary monomial quotient basis, flatness and geometric reducedness, and the morphism criterion for an actual cusp lattice map with compatible fans; finite lattice maps with pullback fans give the finite normalization.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-cusp-positive-support`
- `ShimuraCompactifications:C6/admissible-fan-specialization`
- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`
- `ShimuraCompactifications:C6/hilbert-regular-refinement`
- `ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`

#### C6.2: `ShimuraCompactifications:C4`

Relative polarized Mumford chart and its actual semiabelian family, compatible with R11.3 Raynaud uniformization, level exact sequence, face changes, cusp-unit/cyclotomic changes and invariant differentials. For F=Q supply the Tate comparison and character inclusions determining cusp widths. Generic degeneration and Raynaud carriers stay here/R11.3.

**Needed by.**

- `ShimuraCompactifications:C6/meromorphic-cusp-support-bound`
- `ShimuraCompactifications:C6/hilbert-cusp-positive-support`
- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C6/uniformized-level-chart`
- `ShimuraCompactifications:C6/hilbert-semiabelian-extension`
- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/hilbert-toroidal-proper`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`
- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`
- `ShimuraCompactifications:C6/modular-formal-cusp-comparison`

#### C6.3: `ShimuraCompactifications:C5`

Specialize the generic integral compactification effectivity to the Hilbert boundary presentation on B=Z[1/N(n)] with H2 local models at discriminant primes; supply extension to canonical minimal compactifications and specified finite normalizations of finite generic level maps, without claiming extension to unrelated toroidal fans. Supply determinant Hodge semi-ampleness, normalized section-ring/Veronese comparison, finite generation including finiteness over the Veronese, projectivity, normality, connected fibres, constancy of abelian parts, coherent pushforward/projection formula and the allowed base changes. Good-prime smoothness is not imported at a discriminant prime. Over B, compare the toroidal boundary with its finite étale cusp base: the map is proper flat with geometrically connected and geometrically reduced fibres, and its pushforward of O is O, with precisely permitted coherent base changes.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-cusp-positive-support`
- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/hilbert-toroidal-proper`
- `ShimuraCompactifications:C6/hilbert-hodge-semiampleness`
- `ShimuraCompactifications:C6/hilbert-minimal-contraction`
- `ShimuraCompactifications:C6/hilbert-minimal-finite-generation`
- `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`
- `ShimuraCompactifications:C6/minimal-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-minimal-cusps`
- `ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres`
- `ShimuraCompactifications:C6/hilbert-minimal-weight-extension`
- `ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`
- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`

#### C6.4: `ShimuraCompactifications:C3`

Cusp-equivariant regular refinements and comparison morphisms on actual arithmetic locally finite fans. The C6 specialization only identifies the Hilbert charts; generic refinement geometry remains C3. For level comparisons choose compatible source/target fans under the actual cusp lattice map and distinguish a pullback fan (finite normalization) from further subdivisions (proper, possibly nonfinite).

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-regular-refinement`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`

#### C6.5: `HilbertModularVarietiesAndShimuraCurves:H1`

The actual fine HBAV moduli scheme at the stated torsion-free tame level, its universal family, polarization module and trace/different convention f*=f⁻¹d⁻¹. Supply (R,n)-cusp data a,b,L,β, c=ab⁻¹, b′/b and X=cbb′; the latter is the level-image lattice, not cb² at every cusp. Identify the signed real trace pairing and elliptic moduli specialization at F=Q. Supply smoothness and geometric connectedness/irreducibility of the fixed c-component on the Δ-inverted weight base, as used by Dimitrov–Tilouine §7.

**Needed by.**

- `ShimuraCompactifications:C6/positive-exponents-on-charts`
- `ShimuraCompactifications:C6/meromorphic-cusp-support-bound`
- `ShimuraCompactifications:C6/hilbert-cusp-positive-support`
- `ShimuraCompactifications:C6/cusp-lattice-comparison`
- `ShimuraCompactifications:C6/uniformized-level-chart`
- `ShimuraCompactifications:C6/hilbert-regular-refinement`
- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`
- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`
- `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`

#### C6.6: `HilbertModularVarietiesAndShimuraCurves:H2`

Deligne–Pappas model and Rapoport/ordinary local model at all p prime to tame level, including ramification and p=2; intrinsic total Hasse ideal imported from R07.2 det(V*), compatible with conormal and polarization. Supply finite-presentation ordinary neighbourhoods, normalized admissible blowup with p-torsion removal, lift independence for ε<1, and exact permitted integral compactification comparisons. T3/T5 quantitative canonical subgroup and modified lattice results are not assumed here.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`
- `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`
- `ShimuraCompactifications:C6/hilbert-boundary-ordinary`
- `ShimuraCompactifications:C6/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`
- `ShimuraCompactifications:C6/hilbert-integral-differential-interface`

#### C6.7: `HilbertModularVarietiesAndShimuraCurves:H3`

Full cusp stabilizer: 0→X*→stabilizer→U_C→1 with effective action u²ε; congruences u−1∈n b′b⁻¹ and uε−1∈bb′⁻¹, as verified in Proposition 3.3(iv). Supply enlarged component stabilizers, finite cyclotomic H_C and H_C,1, finite-index U_C,1⊂O×, weight/root covariance and line descent. Supply finite tame Δ(N), free toroidal action at torsion-free tame level and possibly stabilizing minimal action. Do not identify the full stabilizer with its finite cyclotomic image.

**Needed by.**

- `ShimuraCompactifications:C6/meromorphic-cusp-support-bound`
- `ShimuraCompactifications:C6/hilbert-cusp-positive-support`
- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C6/cusp-lattice-comparison`
- `ShimuraCompactifications:C6/admissible-fan-specialization`
- `ShimuraCompactifications:C6/uniformized-level-chart`
- `ShimuraCompactifications:C6/toroidal-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-conormal-comparison`
- `ShimuraCompactifications:C6/minimal-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-minimal-cusps`
- `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-minimal-weight-extension`
- `ShimuraCompactifications:C6/hilbert-q-expansion-comparison`
- `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`
- `ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`

#### C6.8: `HilbertModularVarietiesAndShimuraCurves:H4`

Actual finite full/fixed-pairing/Γ1/Γ0 levels and mixed G-level problem; γ∨=det(γ)γ⁻¹ precomposition on dual level data, pairing components, effective finite groups and componentwise quotients. Supply finite period/character maps at cusps, and exactly the permitted integral models at wild levels; distinguish them from generic-fibre models and from the profinite infinite tower.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`
- `ShimuraCompactifications:C6/hilbert-integral-differential-interface`
- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`

#### C6.9: `AdicSpacesPartII:F0`

Formal completion, algebraization of the prescribed cusp étale relation and uniqueness from schematic density. On Noetherian models supply finite-pole presentation off an effective Cartier divisor, injectivity of completed coefficient description, detection of regularity/ideal membership, and formal functions for the proper contraction. Specify exactly when these commute with coefficient change; arbitrary completion/tensor interchange is not assumed. Supply the module-valued coefficient description and detection on the specified arithmetic thickenings, retaining torsion; no reduced-point test substitutes for this.

**Needed by.**

- `ShimuraCompactifications:C6/meromorphic-cusp-support-bound`
- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C6/hilbert-boundary-constant`
- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`
- `ShimuraCompactifications:C6/hilbert-minimal-cusps`
- `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`
- `ShimuraCompactifications:C6/hilbert-q-expansion-injective`
- `ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward`
- `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`
- `ShimuraCompactifications:C6/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/hilbert-integral-differential-interface`
- `ShimuraCompactifications:C6/modular-formal-cusp-comparison`
- `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`
- `ShimuraCompactifications:C6/hilbert-q-expansion-comparison`

#### C6.10: `AdicSpacesPartII:R2`

P-adic completion and generic-fibre comparison for the specified formal ordinary neighbourhoods; normality and codimension conditions for any formal Hartogs use remain explicit.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/modular-formal-cusp-comparison`

#### C6.11: `AdicSpacesPartII:R3`

Adic analytification of the finite-type generic models, its agreement with the p-adic completion generic fibre, coherent conormal pullback, and compatibility of the supplied level/cusp maps and Hasse rational domains.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-near-ordinary-model`
- `ShimuraCompactifications:C6/hilbert-integral-differential-interface`
- `ShimuraCompactifications:C6/modular-formal-cusp-comparison`

#### C6.12: `SchemeAndStackFoundations:SF.0`

Semiabelian/conormal and invertible-line boundary exact sequences, normal proper curve uniqueness, proper coherent pushforward and projection formula. For arbitrary coefficients supply H0 on qcqs finite-presentation models/lines commuting with filtered colimits of coefficient algebras; descend line, open immersion and section data to finitely generated subalgebras. This replaces invalid tensor/completion interchange. For q-expansion detection supply schematic density on prime-power thickenings of a smooth geometrically irreducible fibre, flat-line coefficient exactness and H0 on qcqs models commuting with filtered colimits of coefficient modules. Use directed unions of finitely generated submodules and the injective coefficient maps induced by an invertible line; full formal series need not commute with colimits. For the integral boundary-ideal comparison, supply O_C≅f_*O_D and coherent base change for proper flat finitely presented f:D→C with geometrically connected and geometrically reduced fibres; apply left exact pushforward to the boundary ideal sequence over B without inverting the discriminant.

**Needed by.**

- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C6/hilbert-boundary-constant`
- `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`
- `ShimuraCompactifications:C6/hilbert-minimal-weight-extension`
- `ShimuraCompactifications:C6/hilbert-q-expansion-injective`
- `ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward`
- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`
- `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`
- `ShimuraCompactifications:C6/hilbert-q-expansion-coefficient-descent`

#### C6.13: `SchemeAndStackFoundations:SF.1`

Effective étale and faithful-flat descent of the actual families, weight lines, ideals and sections; finite tame invariant quotients, including finite cyclotomic coefficient covers and normal projective coarse quotients. No exactness by division by a group order in a noninvertible integral coefficient ring.

**Needed by.**

- `ShimuraCompactifications:C6/arithmetic-koecher`
- `ShimuraCompactifications:C6/hilbert-boundary-constant`
- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/toroidal-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-semiabelian-extension`
- `ShimuraCompactifications:C6/minimal-polarization-quotient`
- `ShimuraCompactifications:C6/hilbert-boundary-ordinary`
- `ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient`

#### C6.14: `NeronModelsAndSemistableAbelianVarieties:R11.3`

Use the existing finite-separable-semistable-extension and positive-residue-characteristic rigid-uniformisation nodes. Additionally specify the split polarized period description needed for complete arithmetic valuation rings in the valuative proof, including equal/residue characteristic zero where the current rigid node does not apply; compatibility with C4 charts and uniqueness of the semiabelian extension remain explicit requests.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-toroidal-model`
- `ShimuraCompactifications:C6/hilbert-semiabelian-extension`
- `ShimuraCompactifications:C6/hilbert-toroidal-proper`

#### C6.15: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

As required by confirmed RT-AREA-padic-1/26, own the generic BT₁ invariant Ha(G)=det(V*) over F_p-schemes, LF and the BT₁ Hodge–Tate sequence; supply its abelian compatibility to H2. This is an additional requested interface to R07.2, not a claim that its current perfect-field Dieudonné description already proves it.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`

#### C6.16: `HodgeTateAndCanonicalSubgroups:T0`

Keep only the extension of the R07.2 differential/Hasse API to semiabelian degeneration charts, with the toric/abelian pieces and varying boundary height explicit. Supply split-torus Verschiebung determinant a unit and compatibility on overlaps; C6 consumes it to compare the actual Hilbert boundary, without moving generic Ha/LF ownership here.

**Needed by.**

- `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`
- `ShimuraCompactifications:C6/hilbert-boundary-ordinary`

#### C6.17: `ModularCurvesPartII:R13.4a`

Compactified coarse modular curves for full, fixed-pairing, Γ1 and refined Γ0 levels, with bases, normality/properness, cusps and moduli identification. Supply agreement with PR81 Layer 10 only for prime N≥5 diamond H≤(Z/N)×/{±1}, including finite normal j-line and schematic-density conditions.

**Needed by.**

- `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`
- `ShimuraCompactifications:C6/modular-formal-cusp-comparison`
- `ShimuraCompactifications:C6/prime-diamond-pr81-comparison`

#### C6.18: `ModularCurvesPartII:R13.4b`

Generic-fibre analytic comparison for R13.4a curves with component, determinant and cusp fields and the Tate cusp width parameter. Supply degeneracy/correspondence compatibility with its Hecke normalization and applicable stack-to-coarse descent.

**Needed by.**

- `ShimuraCompactifications:C6/modular-formal-cusp-comparison`

#### C6.19: `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`

Use the existing prime N≥5 diamond quotient construction, its cusp subscheme and normalization over the j-line, only through the agreement supplied by R13.4a. No upstream construction is re-planned.

**Needed by.**

- `ShimuraCompactifications:C6/prime-diamond-pr81-comparison`

## Collected restructuring proposals

The four proposals below retain the parts’ wording and existing IDs. They are proposals for the maintainer; assembly moves no atlas layer and edits no upstream roadmap.

### C0.1

**action.** split

**roadmaps.** ShimuraCompactifications

**detail.** Keep all current ids. Separate the early C1 mixed group/stabilizer exports needed for C0 admissible fans from late C1 arithmetic cusp/cone labels; their declaration graph is acyclic though coarse whole-stage edges can hide a cycle.

**proposal.** Propose C1.boundary-data and C1.labels modules without moving the rational boundary owner or changing scope ids.

### C0.2

**action.** split

**roadmaps.** ShimuraCompactifications

**detail.** Early C5 toroidal charts/properness supply B3/B5 coefficient inputs; late C5 minimal/positivity uses B5 constant terms. Whole-stage reverse imports can hide a cycle.

**proposal.** Keep C5 ids; propose early toroidal, normalized-level and late minimal/Koecher sublayers, with the listed declaration edges as the contracts.

### C0.3

**action.** extend

**roadmaps.** ComplexComparisonPartII

**detail.** RT-AREA-algebraicgeometry/3 requires the complex analytic carrier before comparison. Current repair node plans it but integration remains unfinished.

**proposal.** Place a first carrier/gluing/analytification layer before C0; it owns nonreduced analytic spaces and imports available ringed-space gluing. Record PR196 agreement and explicit outgoing consumers.

### C0.4

**action.** narrow

**roadmaps.** AnalyticToricGeometryNonarchimedeanPartII

**detail.** RT-AREA-algebraicgeometry/34 duplicates the arbitrary-ring finite-fan toric scheme.

**proposal.** Its first scheme target imports C0/arbitrary-ring-toric-charts and starts new work at formal completion/adic generic fibre/perfectoid geometry. The arithmetic introduction starts at coefficient/torsor/arithmetic quotient extension of the finite complex anchor.

## Where implementation and review resume

Begin with the native supplier carriers and the existing signature omissions, particularly the C0 needs_changes finding. Resolve the exact completed-coordinate/formal-detection contracts before extending Koecher geometrically; resolve the Hilbert model over the tame base, including discriminant primes, before replacing its C5 request. Keep finite pullback-fan normalization separate from a proper common refinement and specify any integral wild-level H2/H4 model separately. Preserve the source-provenance restrictions and the prime-diamond-only ModularCurves link.

The full list of 28 gaps is in the assembled reader and the packets. Implementation must discharge them and the requests above before changing any stage to closed. A compatible pre-existing build at both pins is needed to check the joined Lean file. No claim on another job is part of this run, and no scratch artifact is needed to resume from these deliverables.
