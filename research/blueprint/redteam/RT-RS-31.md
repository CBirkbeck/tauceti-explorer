# RT-RS-31 — independent red-team report

Complete; no new substantiated finding. Agent: Codex — `codex-hjdg0j`,
2026-09-24, issue #1631. The RS-31 author was `codex-c83e7a` and its
reviewer was `codex-a71f92`; neither was this worker. Claim comment
5805563876 was confirmed by bot comment 5805565241 before work began.

The target is the accepted proposal **after** REV-RS-31's corrections,
including its external ShimuraData D1 narrowing. The original report's
six-owner/35-link validation describes its earlier version. The review
explicitly adds the seventh owner and two links; those historical counts
are not the current result. Programme baseline:
`ec19e9e415faad54e28ab4133babc44b382212c0`.

## Target preservation and ownership attacks

Read the family input, full result and report, independent review, complete
member and anchor documents, and complete ShimuraData document. All seven
member and ten anchor descriptions match the documents after whitespace
normalization. There are exactly eight action keys: seven member stages and
the explicit external D1 correction. No upstream stage is changed. The
extension title uses the exact upstream title, “Reductive algebraic groups”,
and explicitly places that anchor first among prerequisites.

| Target | Attempted failure and result |
| --- | --- |
| RG2.0 | An algebraic points equivalence cannot supply point topology. Chart independence, functoriality, products/immersions, local compactness/Hausdorffness for separated finite-type schemes, continuous group operations, integral compactness and smooth congruence neighborhoods remain. The GL_n integral test requires **unit** determinant and the new topology comparison. |
| RG2.0a | Neither a torus predicate nor module restriction of scalars constructs an affine representing scheme. The representing algebra, basis independence/descent, adjunction/evaluation, products/composition/base change and coherence remain. Finite presentation has its own hypothesis; smoothness/connectedness/reductivity descent is restricted to finite separable fields. Every stated affine-space, quadratic GL_1, norm-torus and character test survives. |
| RG2.1 | “Relative” alone does not separate its scope from upstream Layer 7, which explicitly includes nonsplit relative roots. The proposal imports those roots and retains valued root groups, actual filtration indices, multipliable cases, commutator/conjugation formulas, unramified compatibility, affine roots/apartments and independence of choices. |
| RG2.2 | Algebraic roots do not build a building. Apartment gluing, axioms/actions, apartments through pairs, reduced/enlarged comparison, facets/fixers, compactness modulo center, qualified fixed-point results and GL_n/SL_2 examples all remain. |
| RG2.3 | A reductivity predicate is not a parahoric construction. The connected smooth affine integral model, root charts, generic fiber/integral points, special-fiber reductive quotient, reduction/pro-unipotent data, pro-p congruence groups, compact openness, nested facets and unramified base change remain. Full fixers, component quotients and hyperspecial models are not conflated. |
| RG2.4 | Abstract Tits-system covering cannot prove every local decomposition. The local subgroups and Tits hypotheses, Iwasawa/Cartan/Iwahori–Bruhat in their actual ranges, component handling, relative cocharacters, affine/extended Weyl indices, stabilizers, index formulas and nonsplit/rank-one examples remain. Compactness gives finiteness of the single cosets in one compact double coset; it does not make the entire GL_1 valuation-indexed Cartan set finite. |
| RG2.5 | Combinatorial dualization and a generic pinned group do not construct the induced action. Upstream Layer 9 explicitly handles arbitrary root data, so its integral construction can be imported. The dual-datum identification, finite-image pinning action, semidirect L-group/projection, action law, pinning change, Levi inclusions and product/isogeny/Weil-restriction comparisons remain here. Satake reconstruction stays downstream; a square-root normalization is not built into the integral group. |
| ShimuraData D1 | The common algebraic Deligne torus moves to RG2.0a. D1 retains the equivalence with finite sums of pure real Hodge structures, rational-weight criterion, tensor/dual/Tate twists, opposed filtrations and all four examples. General representations are not forced to have one weight. The 1979 sign convention, inverse weight on the diagonal and h(i)=C^(-1) comparison remain. |

All seven owners actually state their assigned target. In particular, the
group-scheme dictionary is upstream Layer 0, the smooth/connected/trivial
geometric-unipotent-radical definition is Layer 6, unvalued structure theory
is Layer 7, and explicit pinned integral construction is Layer 9. No assertion
of an implemented parahoric or L-group is substituted for those planned inputs.
The nonsplit torus, unramified unitary, ramified non-hyperspecial and
fixer/parahoric examples and cross-cutting transport obligations survive.

## Consumers, other owners and cycles

Read all 15 external consumer stages: AA.0/AA.1; BG0/BG1; ET.0;
ES6:functoriality; FA.6; GS0:Schubert-smoothness, GS0:loop-geometry and
GS4:integral-dual-group; LP0/LP3; D0; SR.0:abelian-category and SR.4.
All 21 original external RG2 edges remain. Checking suppliers of every
narrowed stage, including D1, gives 24 direct-consumer handoff checks.
Added upstream edges carry the algebraic part while the old RG2 edges still
carry local geometry or the dual action. RG2.0a → D1/D2 leaves D1 → D2
and RG2.0a → D0 intact; D2 still gets its Hodge theorem from D1.

Checked the four LocalFieldsRamification links against the full Layer 0 and
Layer 2 descriptions: normalized valuation/topology and finite extensions
are Layer 0 inputs; unramified extension and base-change compatibility are
Layer 2 inputs. Neither claims the valued-group compatibility theorem itself.

Inspected relevant packet/decomposition references and reserved IDs, and
screened stage descriptions for competing Weil-restriction, Deligne-torus,
valued-root, parahoric and pinned-group ownership. The specific ambiguities
were resolved against the actual descriptions:

- R09.1 and upstream ModularCurves 0G construct projective subgroup parameter
  spaces via relative Grassmannians. They do not discharge RG2.0a's affine
  representing-algebra obligation.
- AbelianSchemes A6 separates algebraic-space representability from its
  finite-étale abelian-scheme theorem and the field-level Tate-module
  induction comparison. The affine RG2.0a target does not replace these.
- The Satake integral-dual-group comparison and Hecke IX.6 geometric
  compatibilities consume a group construction; they do not replace its
  upstream owner. The reverse Satake → RG2.5 direction fails a cycle control.
- AutomorphicBundles B0 and the LieGroups overlap request generic
  torsor-associated bundles, tensor/dual/determinant/pullback. Neither RG2.0
  nor RG2.0a supplies that target. Both the original report and accepted
  review **already identify this unassigned supplier** and require a precise
  owner before B0 closure. This audit does not count their recorded open
  obligation as a newly discovered correction, or claim it has been fixed.

The graph check unions raw atlas stage edges, every roadmap extract's stage
edges/requirements/consumers, and link packets. It has 4,213 distinct baseline
endpoint pairs; 37 unique proposed links include four old pairs and 33 new
ones, giving 4,246. Every endpoint and owner handoff resolves. For each new
edge u → v, a search for v → u in the complete union returns no path.
Two negative controls, GS4:integral-dual-group → RG2.5 and D1 → RG2.0a,
each produce a cycle. This establishes no **new-edge** cycle; it does not
claim that the legacy catalogue is globally acyclic. Historical graph counts
in the author/reviewer reports used different snapshots.

## Pinned library and source checks

Read all eight cited declarations/structures and their surrounding hypotheses
in the five files below. Freshly fetched bytes match the local copies read
and every SHA-256 value in RS-31's fetched-source table. Access: 2026-09-24.

| Pinned source | Statement checked and boundary |
| --- | --- |
| [GeneralLinear/FunctorOfPoints.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/FunctorOfPoints.lean#L232) | pointsMulEquiv (232) and pointsNatIso (357) identify convolution points naturally with matrix GL_n over commutative base/value algebras. They supply no point-topology comparison. |
| [Matrix/NonsingularInverse.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean#L127) | isUnit_iff_isUnit_det, finite square matrices over a commutative ring. Nonzero integral determinant is insufficient. |
| [RootSystem/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean#L127) | RootPairing.flip (127), flipEquiv (142), with paired modules over a commutative ring; RootDatum uses the integer specialization and finite/free mixins. These exchange root/coroot data, not integral groups. |
| [TitsSystem/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/TitsSystem/Basic.lean#L48) | The TitsSystem structure includes generation, normality, simple-reflection and double-coset axioms. A local application still constructs and verifies those data. |
| [TitsSystem/Bruhat/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/TitsSystem/Bruhat/Basic.lean#L374) | bruhatCells_eq_univ (374), doubleCosetMk_surjective (404): covering and surjectivity for an existing Tits system. Neither quoted theorem asserts affine-index injectivity, local stabilizer formulas or local group construction. |

Read [Stacks 05Y8](https://stacks.math.columbia.edu/tag/05Y8) and
[05YF](https://stacks.math.columbia.edu/tag/05YF), including the latter's
proof using the Hom functor. The finite-locally-free representability result
gives an algebraic space. It alone does not supply the affine presentation
and coherence retained in RG2.0a, nor unrestricted nonaffine scheme
representability or inseparable preservation of reductivity.

Reviewed coverage has no member/anchor entries; AUDIT-41 is pending review.
Its seven member entries supplied leads only. Searches of both full pinned
trees for Weil restriction, Deligne torus, Bruhat–Tits and parahorics are
screening, not an exhaustive absence proof. This report endorses no new
whole-library absence claim. Bruhat–Tits I/II and Casselman proof interiors
were not audited here; their precise fixed-point, decomposition and
fixer/parahoric hypotheses remain explicit future blueprint obligations.

## Validation and scope

`scripts/check_restructure.py` passes on the accepted input.
`scripts/check_redteam.py` passes on this result, and
`research/blueprint/intake.py check-files` passes for both deliverables.
Independent checks cover all action keys, owner and link endpoints, unique
links, target-preserving handoffs, original consumer edges and new-edge cycle
controls. Publication is confined to these two files and rechecks the input
snapshot against the publication base. No Lean file was changed or compiled;
this is a restructuring audit, not a formalization certificate.
