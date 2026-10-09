# Handoff: characteristic-zero resolution and compactification

Job #673, `BP-AlgebraicModuliForArithmeticGeometry--R09.7a`.
Worker: Codex, session `codex-ci69Li`, branch `codex-ci69Li-673-resolution`.
This is a complete target-level planning pass submitted for independent review, not an implementation or a closed roadmap.

## Deliverables and coverage

- [Packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json): authoritative target contracts, dependencies, sources, APIs, tests, planets and gaps.
- [Reader](../readmes/AlgebraicModuliForArithmeticGeometry--R09.7a.md): mathematical route and the same contracts in reading order.
- [Suggested Lean file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.7a.lean): elaborated local algebra and data projections, with explicit omissions for unavailable geometric interfaces.

The packet has 40 targets: 11 definitions, 7 constructions, 19 theorems and 3 applications. The definitions and constructions have 55 API items and 54 named discriminating tests, with recorded uses. There are 23 planets and 12 baseline declarations. All implementation statuses are unchecked.

| Stage | Targets | Planets | Coverage | Remaining |
| --- | ---: | ---: | --- | --- |
| R09.7a | 7 | 6 | planned | Bind the global marked-transform, SNC and Cartier interfaces to StableReduction suppliers. |
| R09.7b | 14 | 6 | planned | Turn exact presentation/invariant contracts into global typed carriers, APIs and examples. |
| R09.7c | 10 | 5 | planned | Replace tower data with actual permissible blowup towers; formalize the persistent-maximum termination proof. |
| R09.7d | 9 | 6 | planned | Complete projective closure, stack/model descent and complex-point gluing; obtain the independent monodromy supplier. |

No stage is closed. Every target is accounted for by a node, an imported owner or a recorded gap. The three gaps and five supplier requests are in the packet and reader. This pass stops at target granularity; smaller lemmas belong inside the proof sketches.

## Binding overlap finding and ownership

Accepted RS-27 and RT-AREA-algebraicgeometry/13 are handled by importing general Rees blowups, their universal property, projectivity, pivot charts, strict-transform saturation and flat base change from:

`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

This part does not plan that package again. It retains marked total/controlled/weak transforms, order, SNC boundaries, permissible centres, equivalence tests and the resolution algorithm. The one-step smooth comparison uses flatness; it is not a proof of full smooth-functorial resolution.

The current upstream StableReduction Layer 2 supplies coherent/Cartier/relative-Proj interfaces:

`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`

AlgebraicVectorBundles supplies coherent tensor/dual and invertible-sheaf operations. General moduli stacks, coarse spaces, Picard theory and the issue's additions routed to A0-extension or R09.1–6 retain their owners.

Current Tau Ceti, inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, has affine blowup charts in `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean`, including `Ideal.affineBlowup`, `AlgebraicGeometry.affineBlowupι`, its open range, covering supremum and structural-map identity. These postdate the pin. StableReduction should reuse them; they are not imported into this pinned prototype and do not supply the full resolution algorithm.

The nine post-snapshot roadmaps were screened: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Relevant smooth/analytic material was inspected in DifferentialGeometry and RealAlgebraicGeometry; it does not supply the history-sensitive algebraic invariant. OperatorTheory has no Suggested file in the inspected checkout. The current toric analytic boundary normal form is a special case, not the general SNC comparison.

## Tier moves for the manager

R09.7 is tier 4. ComplexComparisonPartII is tier 5, so it cannot supply a prerequisite here. Elementary reduced-complex-point realization and the SNC holomorphic-chart comparison are planned in `R09.7d/complex-realization` and `R09.7d/snc-holomorphic-charts`. Retarget the corresponding elementary C0 interfaces to these nodes. Coherent GAGA, proper GAGA, Chow and de Rham comparison keep their existing higher owner.

The geometric carrier currently packaged inside `HodgeStructuresPartII:H.5/boundary-monodromy-data` moves to `R09.7d/good-compactification`. H.5 imports that carrier and retains monodromy. H.7 retains buffered charts, sectors and BKT period-map analysis. This avoids a compactification-to-Hodge-to-compactification cycle. No other packet was edited.

## Supplier requests

The exact consumer lists are in the packet.

1. StableReduction Layer 4: global relative blowup, exceptional invertibility, charts, strict saturation, universal property and flat comparison, reusing the newer affine-chart library when the pin advances.
2. StableReduction Layer 2: arbitrary-scheme effective Cartier divisors and regular sections, invertible ideal arithmetic, relative Proj O(1), the regular degree-one Rees sections, and composition of projective morphisms. The existing integral-scheme Cartier carrier alone is too narrow for Boxer–Pilloni.
3. AlgebraicModuliForArithmeticGeometry R09.1: reduced projective closure of a chosen quasi-projective embedding, dense-open factorization, coherent complement ideal and finite/projective composition.
4. R09.4: algebraicity and smooth separated DM structure of M_g,n, proper stable-pointed compactification, ordinary NC boundary, finite étale scheme covers and étale descent of boundary-stratum blowups. Tame, proper and separated are distinct properties.
5. R09.5: representable scheme models or suitable coarse/level compactifications for normalization and projectivity, with the correct dense-open identification. A coarse map is not automatically étale.

Finite normalization and excellent finite-type examples import the existing SchemeFoundations SF0 nodes. The finite-cover application does not assume that normalization of a smooth cover is already smooth.

## Mathematical review points

- Weak tests (i,ii), strong tests (i,ii,iii) and restricted s* tests are separate. Exceptional tests use total pullback. The µ_H and residual equivalence conclusions retain their restricted-test hypotheses.
- Maximal contact uses a chosen derivative that is a unit in a direction outside the boundary; µ=1 alone is insufficient. Old-boundary augmentation and the derivative persistence hypotheses are stated.
- Coefficients use derivative order q<d and mark d−q. Residualization retains the additional monomial pair for 0<ν<1, and distinguishes terminal zero from infinity.
- The jet-minor node states the five formal presentation hypotheses, including supported division and the essential-variable Jacobian condition. Its threshold ideal is the cumulative sum through the specified degree.
- Hilbert–Samuel means the entire complement-count function, not multiplicity. BM97 Remark 9.15(3) gives the explicit embedding-dimension padding and reindexing. Paired-stage count, not total tuple entry count, is bounded by ambient dimension.
- Old exceptional blocks use birth of truncated invariants. The chronological refinement chooses a smooth component; blowing up the unrefined intersecting maximum is not substituted.
- Minimal monomial centres decrease an auxiliary bounded-denominator value. Finite global termination also needs the persistent-maximum argument and Hilbert–Samuel stabilization; arbitrary decreasing rational sequences do not prove it.
- Reduced embedded resolution, nonreduced smooth-support resolution, principalization and preservation of resolved points have distinct contracts. BM97 §13 supplies local-isomorphism universality; all-smooth-morphism functoriality is not asserted.
- Boxer–Pilloni Cartier separation is for arbitrary schemes, including mixed characteristic. The plan proves regularity of the residual sections, disjointness and the balancing divisor identity, not just a ratio formula.
- Smooth projective SNC compactification is stated for smooth quasi-projective input over a characteristic-zero field. The stack boundary refinement is a conditional application with its own descent obligations.

## Sources read and missing

The packet and reader contain public URLs, exact theorem/section/page locators and concrete matches in original wording. No source passages, PDFs or extracted source text are committed; no uncleared book was used.

- Bierstone–Milman, Inventiones 128 (1997), pp. 207–302: full published paper, relevant definitions and proofs in §§3–13, examples and Theorem 1.10. The older 30-page arXiv announcement cannot support the later proofs.
- Bierstone–Milman, *Uniformization of analytic spaces*, JAMS 2 (1989), Theorem 5.2.1 and Corollary 5.2.2 with proof, pp. 820–821. The original AMS PDF was inaccessible; the primary paper's full text was read at the public ResearchGate page recorded in the packet. The complement-count/diagram stabilization proof was read, so this is not a missing Hilbert–Samuel proof gap.
- Boxer–Pilloni, *Higher Hida theory for Siegel modular forms*, §4.1.10 and Proposition-construction 4.1.11, author PDF p. 42.
- Landesman–Litt, arXiv:2205.15352v4, Lemma 8.3.3 and proof, pp. 40–41.
- Landesman–Litt–Sawin–Salter, *Surface bundles and the section conjecture*, §2.1, Lemma 2.1.1 and proof, author PDF pp. 6–8.
- Bakker–Klingler–Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*, §4.1 and Theorem 4.1, author preprint p. 13.
- Serre, GAGA, §1 nos. 1–2, pp. 3–5; §2 no. 5, Lemma 1 and Proposition 2, pp. 7–9; nos. 6–7 and Proposition 6, pp. 9–12. Only the elementary complex-point realization is used here.
- Current StableReduction and AlgebraicVectorBundles roadmap definitions and suggested interfaces.

The missing original topological proof is Asada–Matsumoto–Oda, *Local monodromy on the fundamental groups of algebraic curves along a degenerate stable curve*, J. Pure Appl. Algebra 103(3) (1995), pp. 235–283, Theorem 2.2, cited by LLSS. Its plumbing/Dehn-twist proof was not read. MappingClassGroupsAndCanonicalRepresentations currently has a design job and no valid supplier layer id. Its future plan must supply inertia, commuting twists, conjugacy and cover powers. This packet records the gap and the local coordinate winding computation without inventing a dependency id.

## Validation and where to resume

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Actual baseline declarations and hypotheses were read in the shared pinned build. The structural checker was run with the installed pinned declaration index:

`python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json --index <pinned-declarations.tsv>`

Result: **0 errors, 0 warnings**; four planned stages, zero closed stages.

The suggested file was compiled with `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.7a.lean`: **exit 0**, 89 warnings, all admission warnings; no errors or other warnings. It contains 46 `example` declarations and 42 theorem declarations, plus concrete definitions and structures. All packet API and test names occur in the file; some are explicit omitted-signature comments.

Compilation validates the retained local contracts and data projections. It does not validate the omitted global SNC, legal-test, analytic-gluing or permissible-tower conditions. These are enumerated in each node's `leanPrototype` and the first gap. Before packaging, replace the projections and omitted comments with the full global signatures, APIs and examples when their supplier interfaces can be expressed. Do not treat the data-only tower or compactification structure as the complete geometric definition.

An independent reviewer should start with the mathematical review points above, then check the three gap records and five requests against their owners. A follow-up expands the global signatures and proves the conditional stack/topological interface; it does not replan imported general blowups. No second job was claimed in this run.
