# Independent package review: QuiverRepresentationsPartII

**Verdict: accepted with the corrections applied here.** The package is ready
for a draft TauCetiRoadmap pull request. This is acceptance of the mathematical
roadmap specification, not a claim that its proposed theory is implemented.

Reviewer: Codex, session `codex-SOKXvL`, 2026-10-14.
Job: [#9234](https://github.com/CBirkbeck/tauceti-explorer/issues/9234).
The reviewed package was written by the separate session `codex-gG1hGz`
in [#9601](https://github.com/CBirkbeck/tauceti-explorer/pull/9601).

## Scope, fidelity and form

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE and the expansion
protocol, the accepted packet, the complete package and the author's handoff.
The upstream QuiverRepresentations and AlgebraicVectorBundles roadmaps were
the two form and ownership models. Read the current smooth-representation
highest-derivative adapter for the final supplier contract.

All 35 accepted targets survive in the six README layers, in this mapping:

| Packet group | README locations | Content checked |
| --- | --- | --- |
| MS.0 | §§0.1–0.3 | Intervals, occurrence multisets, one-copy maxima |
| MS.1 | §§1.1–1.6 | Graded spaces, pairs, standard models, classification, actual images, reconstruction |
| MS.2 | §§2.1–2.9 | Centralizers, coefficients, both restrictions, polynomial topology, generic type, conormals, duality and involution |
| MS.3 | §§3.1–3.5 | Admissibility, image genericity, simultaneous restrictions, ramification and commutation |
| MS.4 | §§4.1–4.7 | Weighted cuts, occurrence posets, Dilworth, rank, grids, chain maxima and adjacent formula |
| MS.5 | §§5.1–5.5 | Peeling, chain decrement, canonical split, representation comparison and consumer example |

Checked the literal 63 API entries against the README; none is missing.
The packet checker reports 62 API items under its counting convention.
All 48 packet definition tests remain represented, with further discriminating
checks in the package. Each definition/construction subsection has at least
three mathematical checks. Their computed values and non-examples were read,
not accepted on the strength of their count.

The README starts with Summary, specifies scope and supplier contracts, then
builds in dependency order. It has exact hypotheses, named API, source
locators, examples and dependencies. It contains no job or packet narrative
and no source passages or section-by-section source summaries. The metadata
remains the single line `topic = "math.RT"`.

## Corrections made

1. Named `genericType_shift`, `genericLocus_shift`, `dual_shift` and `ram_shift`.
   The old image proof used genericity and image admissibility after shifting
   by −1, but did not expose that compatibility as an API target. Reindexing
   grades preserves the centralizer and polynomial ranks; the README now
   states the transport and its prerequisites explicitly. These are local
   consequences of the existing constructions, not additional representation
   classification.
2. Added a separated-singleton negative control for `Precedes`: strict endpoint
   increase alone does not supply the overlap inequality. Added it to Lean.
3. Added negative controls for reuse of either projection in the split matching
   graph, both in prose and in Lean. The existing positive control still allows
   the middle occurrence to appear once in each role.
4. Identified the current direct quiver equivalence and indexed Krull–Schmidt
   suppliers, including the multiplicity theorem and their finite-vertex and
   pointwise finite-dimensional hypotheses.
5. Explicitly deferred general algebraic bundle objects and total-space
   comparisons to AlgebraicVectorBundles L0/L2B. The retained conormal theorem
   identifies a particular tangent-annihilator family with that interface.
6. Replaced an unnecessary `simpa` in the occurrence-list bound proof with
   `simp`, removing the non-sorry warning exposed by compilation.

No target was deleted and no accepted packet was edited. No source locator
needed correction. The author had already used the correct grid endpoint and
the correct representation factor order; these were independently checked.

## Source verification

The following reproducible sample was selected with Python
`random.Random(9234).sample(packet["nodes"], 15)`. Each source was opened and
its printed locator read. AKY, MW, Z81, Z98 and DIL mean the public sources
linked in the package's References.

| Sampled target | Verified locator |
| --- | --- |
| MS.3/commute | AKY Proposition 3.5, pp.18–19 |
| MS.1/classification | AKY §3.1, p.15 |
| MS.2/involution | Z81 §4.3, p.20; MW II.7, p.169 |
| MS.1/pair | AKY §3.1, pp.14–15 |
| MS.2/conormal | Z81 §4.3, Proposition 4.4, pp.20–21; MW II.7, p.169 |
| MS.2/restrict-down | AKY Lemma 3.2(2), p.16; MW II.4, pp.160–161 |
| MS.2/dual | AKY §3.1, p.16; Z98 §2, p.410 |
| MS.2/generic | AKY §3.1, p.16; Z98 §2, p.410 |
| MS.4/grid | AKY Proposition 3.7 proof, pp.20–21 |
| MS.2/centralizer | AKY §3.1, pp.15–16 |
| MS.4/adjacent | AKY Proposition 3.7, pp.19–21; Z98 Theorem 1, pp.410–411 |
| MS.3/admissible | AKY paragraph before Lemma 3.3, p.16; Lemma 3.4, p.17 |
| MS.4/path-chain | AKY Proposition 3.7 proof, pp.20–21; Z98 Theorem 1, pp.410–411 |
| MS.0/interval | AKY §2.1, p.7; §2.3, p.8; §3.1, pp.14–15 |
| MS.5/truncate-peel | AKY Lemma 3.6, p.19 |

Also checked both author-flagged bridges and the factor-order concern:

- **Conormal bridge:** Z81 §4.3/Proposition 4.4, original pp.20–21, supports
  the finite-orbit correspondence and commuting trace description. Its §4.5
  is a representation conjecture, not a proof of the final comparison.
- **Algorithm and representation bridge:** MW II.1–II.3, pp.148–160;
  II.4, pp.160–161; II.6–II.7, pp.162–169; I.7.2–I.7.3, p.147;
  II.10.2–II.11, pp.172–175; II.13, pp.176–177. Checked the extraction,
  reversed embedding, greedy exclusion and reinsertion hypotheses against
  the source. Checked the generic affine-slice argument, including the
  nonempty-intersection qualification in II.6.1.
- **Factor order:** the rendered printed p.174 places the factors differently
  in Remark II.10.3. Its proof invokes II.10.2, and II.13 uses the right-induced
  product. The package correctly derives the needed exclusion for `Z(q) × α`
  from those statements. It does not rely on the reversed printed product.
- **Other controls:** Z98 §5, p.412, gives the second endpoint recursion;
  DIL Theorem 3, pp.6-1–6-2, and the split-poset argument p.6-3 give the
  finite chain/matching inputs. The seven-interval example was recalculated
  independently, retaining its original integer labels.

All retrieval was from public sources. No restricted book was used, and no
download or source passage is included in the deliverables. This review does
not claim a new official erratum or a published-version collation.

## Prerequisites and current-library overlap

Read the actual statements of the ten packet baseline declarations at
Mathlib `082e2d3` and Tau Ceti `f790474`, including the finite/free basis
hypotheses, image carriers and matrix rank. Read the additional graded-linear-map
API that Suggested.lean imports. `Homogeneous` is a specialization of the
existing predicate, not an invented degree theory.

The current read-only roadmap checkout was `0d144d0`; current Tau Ceti was
`a91d3aaf`. Searched the nine newer roadmaps and Completed roadmaps, and the
current library by mathematical objects, degree conditions, interval labels,
commuting operators, nilpotence, orbit/conormal constructions and decomposition
hypotheses. Read the relevant hits. No interval-specific target was found
already supplied. The coverage audit has no QuiverRepresentationsPartII or
parent layer entry. No build command was run in either read-only checkout.

Existing homogeneity, the path-algebra equivalence, indexed Krull–Schmidt,
general bundle presentations, and constructible-orbit local closedness remain
supplier contracts. Pointwise local nilpotence differs from this roadmap's
uniform exponent on a finite graded space. The Hopf-ideal conormal sequence
at a subgroup identity differs from the orbit conormal bundle. These retained
specializations add explicit structure and do not replan their suppliers.

Mathlib PR #40741 remains open at `fb338777`; its finite chain-cover/partition
interface is followed without pretending it is a pinned import. The package
has no `UPSTREAM:` or FoundationsAndLibraryIntegration prerequisites.
SmoothRepresentationsOfLocalGroups is already an upstream supplier (tier 2);
EndoscopicTransferAndUnitaryTraceComparison is only a consumer. The package
does not reinstate the packet's earlier upward ET request.

## Adversarial mathematics pass

Every target, definition and convention was checked. The grouping below
covers all 35 packet targets and the added transport statements.

| Statements checked | Instances and attack | Result/change |
| --- | --- | --- |
| Intervals, length, shortening, shift | Singleton, inclusive right endpoint, negative endpoints, shift −1 | Correct; no empty reversed interval |
| Multisets, dimensions, occurrences | Two equal blocks, zero multiset, cardinality versus length | Copies and grade counts preserved |
| Maximal part and remainder | Repeated maximum, nested intervals, disjoint singletons | Exactly one copy of each distinct maximum |
| Space, pair, isomorphism, nilpotence | Zero carrier, absent grades, identity in a single grade, E₂₁ | Degree and graded-isomorphism conditions are genuine |
| Standard models and classification | Duplicate blocks, reversed direction, finite-window extension | Interval labels and multiplicities retained |
| Ranks and reconstruction | `[0,2]` versus `[0,2]+[1,1]`, same image | Diagonal grade dimensions are necessary; integer rank differences correct |
| Actual images and shifts | VN `[0,2]` versus WL `[0,2]`, singleton image | VN image needs shift −1; added explicit shift API |
| Centralizer and coordinates | Self-block, adjacent/separated singletons, rectangular 2×3 block | Six independent coordinates; separated pair rejected in new test |
| Both restriction surjections | Deleted singletons, zero image, shortened source/target | Endpoint lifting works; WL follows grade reflection |
| Polynomial topology and generic type | One point, nonzero-scalar locus, usual unit disk | Explicit Zariski topology; no Euclidean genericity |
| Conormal symmetry | Zero space; incidence `nl=0`; E₂₁/E₁₂ commutator | Axis components and trace sign correct; actual algebraic dimension required |
| Dual and involution | Chain, adjacent singletons, missing middle grade, duplicates | Nonadditivity and direction preserved; transpose keeps labels |
| Admissibility and image genericity | Zero triple, nongeneric zero L, chain with zero fibre | Separate image condition retained; chart denominators nonzero |
| Simultaneous restrictions and ram | Nilpotence bound, zero later images, adjacent singleton ram | Same L supplies finite intersection; actual ranges used |
| Ram/truncation commutation | Chain, adjacent singletons, two overlapping length-two blocks | Common shift required and now named |
| Cuts and weighted chains | Meeting versus containing, outside support, full multiplicity | Natural subtraction has the needed bound |
| Endpoint posets, matching and Dilworth | Equal copies, equal endpoint, nested intervals, three-singleton path | Middle vertex allowed in opposite roles; both repeated-role failures added |
| Adjacent generic rank | 2×3 rank 2, no self-block, single-grade boundary | Independent coordinates justify minors only for adjacent ranks |
| Grid and path maximum | Invalid start, endpoint `(1,r)`, repeated terminal weight, r=1 | Interior-cut hypotheses retained; paths need not biject with chains |
| Truncation peeling and chain decrement | Duplicate maxima, vanished singleton, empty cut | Empty branch excludes false `0=0+1` |
| Canonical ram split | Adjacent singleton nonadditivity, repeated maximum | No arbitrary-sum additivity claimed |
| Representation adapter and MW inputs | GL₀, rank-one singleton, determinant/Steinberg, χ=`|·|²` | c=2; q>1 and nonzero χ-value justify logarithms; factor order correct |
| Consumers and worked example | Seven intervals of length 17 | Ram output has length 8 and the stated four intervals |

An independent disposable calculation enumerated all **3,876** multisets of
cardinality 0–4 from the fifteen intervals `−2≤b≤e≤2`. It made **171,858**
assertions with no failures. Independently coded right-endpoint MW and
left-endpoint Z98 recursions agree. Checks covered dual square, grade dimensions,
truncation length, both peeling identities, ram/truncation commutation, canonical
ram split, matching/weighted-width identity, adjacent dual counts, empty and
nonempty chain decrement at cuts −3 through 3, and all four grid cuts after
translation to `[1,5]`. Also checked coefficient lifting on all 225 interval
pairs, and computed the rank-17 example separately. These finite computations
are regression witnesses, not a proof of conormal or representation theorems.

## Lean and validation

Suggested.lean has 437 lines, real-bodied light definitions and 61 examples.
No sorry-filled data carrier, `True` target, hypothesis containing its
conclusion, or construction development occurs. Heavy constructions remain
in the README and its closing inventory.

Spot-checked these ten signatures against the prose: `Interval.shorten`,
`maximalPart`, `PairIso`, `Pair.nilpotent`, `centralizer`,
`polynomial_irreducible`, `commuting_range_stable`, `weighted_dilworth`,
`grid_path_chain_max`, and `chainWeight_peeling`. Also read both new matching
negative controls. Their hypotheses and generality agree with the README.

- `lean-check` on the corrected Suggested.lean: exit 0; only
  `declaration uses sorry` warnings. Memory exceeded the required threshold;
  only one compilation ran at a time.
- `python3 scripts/check_blueprint.py` on the unchanged accepted packet:
  0 errors, 0 warnings; all six stages planned, zero closed.
- `python3 research/blueprint/intake.py check-files` on all changed files,
  including the handoff: 0 problems.
- `git diff --check`: passed.

## What remains

No uncorrected package defect remains. The packet's two mathematical
implementation bridges are specified as work in the roadmap: §2.7 builds the
scoped algebraic conormal/dimension/projection/fibre comparisons, and §5.4
builds the exact MW extraction, involution-embedding, candidate and reinsertion
interfaces on the existing representation carrier. Those are substantial
implementation targets, not baseline theorems and not proved by this review.
Their explicit target decompositions satisfy the roadmap's prerequisite rule;
neither the packet nor its stage-closure statuses were changed.
