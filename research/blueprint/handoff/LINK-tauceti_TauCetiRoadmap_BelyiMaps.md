# Partial link audit: Belyi maps and dessins

## Identity and status

- Job: `LINK-tauceti_TauCetiRoadmap_BelyiMaps`; issue [#32](https://github.com/CBirkbeck/tauceti-explorer/issues/32).
- Author: **ChatGPT Pro — cgp-d0298acaa18a**.
- Claim: [5713543959](https://github.com/CBirkbeck/tauceti-explorer/issues/32#issuecomment-5713543959); workflow acceptance: [5713545627](https://github.com/CBirkbeck/tauceti-explorer/issues/32#issuecomment-5713545627), explicitly naming this session.
- Packet: `research/blueprint/links/tauceti_TauCetiRoadmap_BelyiMaps.json`.
- Status: **partial**, not a completed catalogue audit, approval, integrated result, or formalization. Implementation and pinned-declaration status remain **unchecked**. Six inbound links, no outbound links, no new overlap entries.
- Only the packet and this handoff are proposed for integration. No roadmap source, atlas, queue, reserved IDs, application code or another worker's files were edited. No local git command was run.

## Input provenance

The audit uses repository revision **`dbafc759460581dbd23999a3c112149fedefe2b5`**. All source paths below are relative to that revision unless explicitly stated otherwise.

Before submission, main was re-fetched at `66e35f2051d4e49644701ad398112de45095d315`. The GitHub commit comparison showed only six unrelated audit, review, ledger and queue changes; the audited documents, atlas, baseline and link inputs were unchanged. The isolated branch `browser/cgp-d0298acaa18a/link-belyi-maps` starts at that fresh main commit. The issue still had this session's uncontested acceptance, and a fresh PR search found no competing submission for this job ID.

The actual baseline file `research/blueprint/baseline.json` records:

| Library | Commit |
|---|---|
| Mathlib | `082e2d37e8b0463410cdb532e111cd43d5a66174` |
| Tau Ceti | `f790474821cf4256814db967cb154e7af3d0c369` |

Baseline blob: `fdb00afdfae8e5728e070f310f5a880707764bc2`. Focal README blob: `5c818fb6124600633f4d2e9ccec4ea29ce08fded`. PolynomialGaloisGroups README blob: `99bb62fea9ec25ac9468f1d0542f836fa1e03410`; its atlas extract blob: `01f24a3aabf24b84a51d634c4cde759eb7330abb`.

The updated `BROWSER_AGENTS.md` was re-read; its blob was `e4854be9cb94f4e9fe6f4ac76a5468f56c53d3a0`. The blueprint and expansion protocols and upstream guide were read. Atlas extracts, not a silently substituted current library, were used for stage identifiers and descriptions.

No cited Mathlib or Tau Ceti declaration was opened at the two baseline commits in this audit. Names occurring in the roadmap evidence describe the **requested interfaces**, not verified existing declarations. No positive or negative library-availability claim is made. Books and the maintainer's private provenance ledger were not inspected; their theorem citations in the roadmap are not independently verified here. The elementary counterexample below is checked directly and does not depend on those citations.

## Read material and source locators

The focal `content/tau-ceti/BelyiMaps/README.md` was paginated through all fifteen layers and EOF. Its full-stage input/output ledger is retained below. The focal atlas extract is `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_BelyiMaps.json`.

The following partner documents and stage descriptions were read for the decisions in this packet. Reading these sources is **not** a claim that every possible pairing with their other stages has been decided.

| Document | Relevant checked passage | Disposition |
|---|---|---|
| `content/tau-ceti/PolynomialGaloisGroups/README.md` | Layer 0, fullCycleType API; Layer 6, reference subgroups, label predicates and classification. Layer 6 begins within lines 1140–1250 and continues into 1250–1450. | Two inbound links, the label link explicitly restricted to degrees 1–5. |
| `content/tau-ceti/RepresentationTheory/CharacterTheory/README.md` | Standing conventions; Layers 1, 3, 4. Layer 3/4 source passages are in lines 235–400. | Three inbound links to Belyi 3.2. |
| `content/tau-ceti/AlgebraicTopology/README.md` | Stage 1: van Kampen through the fundamental groupoid; natural cocone, based two-open corollary and presentations. | One inferred inbound link with a map-level export request. |
| `content/tau-ceti/UniversalCovers/README.md` | Covering, universal-cover, action and classification contracts. Its existing link packet was also read. | Existing covering links/associated-cover recommendation retained, not duplicated. No van Kampen supplier found there. |

The packet quotes both endpoints of every proposed dependency. The exact stage IDs come from the corresponding per-roadmap atlas extracts, not from guessed heading slugs. In particular, AlgebraicTopology's source ends in `#stage-1-van-kampen-through-the-fundamental-groupoid`, and Belyi's counting stage ends in `#layer-3-finite-enumeration-and-character-theoretic-counts`.

## Decisions and requests

### R1. Reuse the full-cycle partition API

PolynomialGaloisGroups Layer 0 supplies a generic finite-permutation construction including fixed points and compatibility with conjugacy and transport. Belyi 0.5 consumes exactly that construction. The polynomial separability assumptions of neighbouring statements are not assumptions on this generic API. Belyi retains the merge/split transposition lemma, sign bookkeeping and topology-independent Euler bound; none is discharged merely by importing a definition.

### R2. Repair the degree-range mismatch

Belyi **1.6** requests label semantics for `n <= 11`. PolynomialGaloisGroups **6** explicitly supplies theorem-backed representatives and classification only for degrees **1 through 5**; its current document does not provide the cited Layer 7. The packet's link covers only this valid restricted part.

Required maintainer decision: either restrict Belyi 1.6 and downstream catalogue claims to the proved reference degrees, or commission a separately owned, proved reference dictionary and conjugacy-completeness/disjointness theorems in degrees 6–11. Do not change the supplier's scope by implication. Abstract isomorphism type or group order is not a substitute for the conjugacy class of the permutation subgroup: the regular C4 and V4 subgroups already distinguish those notions in degree four.

### R3. Preserve all three character-theory interfaces

For a finite group G and its conjugacy classes, Belyi 3.2 first converts product-one triples to class-algebra structure constants, then uses column orthogonality and central-character normalization. These are separate Layer 1, 3 and 4 exports. The character identity here is over the complex numbers, with a natural-number count cast into that field. It is not an executable evaluation of a complex-valued character table.

The order convention is `z*y*x = 1`: the count-to-structure-constant conversion uses `C1`, then `C0`, and the inverse of `Cinf`. The resulting raw count does not impose generation or identify simultaneous-conjugacy classes. Subgroup recursion and normalizer-orbit/stabilizer corrections remain Belyi 3.3–3.4. No dependency on the full Dixon–Schneider executable algorithm, Brauer splitting or Burnside applications is asserted.

### R4. Redirect canonical van Kampen to the actual supplier

Belyi **5.5–5.6** assigns generic van Kampen to UniversalCovers, but AlgebraicTopology **Stage 1** has the matching map-level groupoid/pushout contract. Use its based two-open corollary for open A,B covering X, with basepoint in their path-connected intersection; require that intersection to be simply connected for the free-product specialization.

The requested declaration-sized exports are:

1. The homomorphism from the free product induced by the two inclusion maps.
2. Its bijectivity under the stated connectivity and simple-connectivity hypotheses.
3. The resulting group equivalence.
4. Equality of its underlying homomorphism with the inclusion-induced map, hence the two generator-value formulas after specializing to the punctured-plane cover.

An abstract existence of an isomorphism cannot support the peripheral-generator calculations. The edge is `inferred` because the focal text names a different supplier. This is a correction request, not an assertion that these declarations already exist at the baseline.

### R5. Correct disjoint-sum monodromy before blueprinting

Focal **0.6(2)** asks for disjoint sums with “monodromy the product acting componentwise.” Taken to assert the full direct product, this is false.

Take both summands to be the degree-two cyclic triple `(a,1,a)`, with `a=(01)`. On four points the sum is `((01)(23),1,(01)(23))`. Its monodromy is generated by the simultaneous swap and has order **2**, whereas the independent product of the two monodromy groups has order **4**. Coordinate projections are surjective, but independent choices in the factors do not follow.

Replace the product claim by the image of the diagonal free-group representation in the product of the summand monodromy groups, a subdirect product. Full-product equality requires an additional independence hypothesis. Cycle concatenation and Euler-characteristic additivity do not require that hypothesis and remain valid. A finite permutation-closure calculation in the session scratch reproduced the orders 2 and 4.

## Focal input/output ledger for continuation

This is a reading ledger, not a completed proof or a claim that all supplier obligations have been discharged.

| Layer | Inputs to search for | Outputs and boundaries |
|---|---|---|
| 0 | Finite permutations/actions; full cycle partitions including fixed points. | Product-one triples; nonzero-degree connectedness; simultaneous conjugacy; monodromy and centralizer automorphisms; integer Euler characteristic and combinatorial genus. Keep the Euler bound independent of later topology; repair R5. |
| 1 | Layer 0; block/stabilizer API; reference subgroup labels. | Ordered passports; normalizer orbit description; block quotient/primitivity; finite label semantics. No canonical primitivization or identification with Galois orbits; repair R2. |
| 2 | Layers 0–1; finite incidence fibers and cycle permutations. | Bipartite oriented ribbon dessins and triple equivalence; genus; branch-point operations on isomorphism classes. Do not identify the branch S3 action with complex conjugation or require surface classification here. |
| 3 | Layers 0–1; class sums, column orthogonality, central characters. | Finite enumeration; raw Frobenius counts; generation recursion; normalizer/centralizer corrections. Separate computed finite data from noncomputable character identities. |
| 4 | Group presentations; finite permutation representations; matrix geometry. | Triangle groups, dividing-order versus exact-order representations, regular triples and normal subgroups; infiniteness conclusions. Infiniteness alone is not faithful discrete uniformization. |
| 5 | Punctured convex-domain loops; covering/basepoint machinery; canonical based van Kampen. | Affine thrice-punctured-sphere model; based free rank-two group with peripheral values and infinity relation. Canonical maps, not unnamed abstract isomorphisms; repair R4. |
| 6 | Layer 5; universal covers, deck actions, associated covers and classification. | Fiber-numbered, pointed and unpointed finite covers and their different classifying quotients; centralizer/deck formula. Generic associated-cover ownership is already addressed in the UniversalCovers packet. |
| 7 | Finite punctured-disc covers and peripheral cycles; Layer 6. | Point filling, compactification and topological ramification charts; one filled point per cycle. Avoid using holomorphic orders before Layer 8. |
| 8 | Layer 7; complex-manifold substrate and local power forms; analytic Riemann–Hurwitz. | Analytic Belyi maps, complex structure on filled covers, analytic comparison and genus reconciliation. No general uniformization theorem is requested by this route. |
| 9 | Algebraic function fields, valuations/places, divisors, models; compact-surface Riemann–Roch. | Algebraic Belyi pairs, meromorphic-field degree, points/places comparison and algebraization. Check exact constants, hypotheses of local analytic normalization and model/field anti-equivalence. |
| 10 | Ramification towers, constant extension, finite triple classification, polynomial branch reduction. | Belyification; existence over Qbar and descent of complex Belyi pairs. Check the termination measure and constant-extension carrier; do not substitute a blanket arbitrary-curve full-faithfulness claim. |
| 11 | Algebraic pairs and number-field models; finite Galois descent. | Galois action, fields of moduli and definition, cocycle descent and orbit-degree data. Field of moduli need not automatically be a field of definition. |
| 12 | Profinite/free-group comparison, finite cover categories, inertia and cyclotomic action. | Field-extension geometric/arithmetic fundamental groups and outer action; branch-cycle compatibility. Distinguish the finite-cover category from its connected subcategory; no scheme-etale comparison or unproved outer-action continuity is silently imported. |
| 13 | Free pro-prime quotients, characteristic kernels and outer/powering interfaces; polynomial Belyification. | Pro-prime refinements and genus-zero faithfulness. Unit-to-automorphism existence is not a canonical homomorphic section. The focal faithfulness route is polynomial, not an elliptic-curve argument. |
| 14 | Finite triples/passports and labels; algebraic equations and descent/orbit certificates. | Record assertion semantics and evidence replay. Distinguish stored counts from actual orbit counts; no claim of catalogue completeness or private-ledger verification. |

## Deduplication and scope of the search

The atlas `stage-edges.json` at the input revision was searched for `BelyiMaps`, with no matches. The link directory at that revision had no PolynomialGaloisGroups, CharacterTheory or AlgebraicTopology owner packet; those are the only new source owners here. Under the links-v1 focal-incidence rule, another valid owner's packet cannot contain one of these six pairs unless its owner is one endpoint. The existing UniversalCovers packet contains relevant covering links and an associated-cover ownership recommendation, which this packet deliberately omits.

The atlas index and new-roadmap directory were inspected for discovery. The names `BelyiAnalyticCovers`, `BelyiAlgebraicAndDescent`, `BelyiArithmeticActions` and `ProfiniteArithmetic` in the focal prose are **not resolved to validated supplier stage IDs in this audit**; do not invent IDs from those names. This is not a proof of absence from every repository or branch.

The required search over every same-area roadmap, every other upstream Tau Ceti roadmap and every object-mentioning campaign document is **not complete**. In particular, the absence of outbound links and new overlaps in this partial packet does not assert that none exist.

## Remaining work, in order

1. Run the official full-input validator and reconcile any source drift, stage-ID errors, evidence warnings or newly added duplicate links. Obtain an independent agent's review; this author must not review this submission.
2. Finish the named analytic/algebraic supplier contracts: ConformalMapping Layer 0; ModularForms 10B; AlgebraicCurves function-field, place, ramification, constant-extension and model stages. Read both endpoint descriptions fully and check the existing AlgebraicCurves packet before adding links.
3. Follow the profinite dependencies into ProfiniteProPGroups and resolve the requested generic profinite arithmetic/outer-automorphism owner. Do not confuse finite discrete groups, profinite groups and pro-prime quotients.
4. Decide genuine outbound uses, especially three-point specializations in InverseGaloisAndArithmeticFundamentalGroups and any AnabelianGeometry consumer. Do not turn shared vocabulary or a stronger general theorem into an unproved dependency.
5. Complete the mandatory all-Tau-Ceti and diophantine/neighbouring-area catalogue scan using the atlas area shards. Record every actually read roadmap in `examined`, including negative decisions. Check new roadmap definitions and all applicable link packets.
6. Resolve R2, R4 and R5 with the responsible owners without modifying their source files in this job. Then revisit all unresolved mathematical-generalization questions in Layers 9–13, using public primary sources and the exact library baseline when claiming existing API.
7. Only after that work and independent review should the packet become `complete`. Do not mark issue #32 done merely because a partial PR exists.

## Validation at submission preparation

Executed from session scratch/output root:

- `python3 -m json.tool research/blueprint/links/tauceti_TauCetiRoadmap_BelyiMaps.json`: **passed**.
- `python3 scratch/check_partial.py`: **passed** JSON/schema-subset checks, two endpoint evidence objects, focal incidence, six unique links, five unique examined entries, and absence of an in-packet directed cycle. Also reproduced R5's finite groups of orders 2 and 4.

These are limited local checks, **not** the repository validator and not mathematical certification. Endpoint IDs and evidence were manually compared with the GitHub atlas extracts; no complete local atlas was available for automated membership or global duplicate/cycle checking.

The applicable command was read from the issue and `scripts/check_links.py`:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_BelyiMaps.json
```

It has **not been run locally**: the complete repository/input snapshot was unavailable, and direct container download failed at DNS resolution. The GitHub extract reader did work; this is not the earlier input-access blocker. Full validation is pending CI or the maintainer. The validator itself checks structure, not the correctness of the mathematical reasoning. Record actual CI results on the submission; do not infer success from PR creation.

## Handoff and coordination

This checkpoint is offered as a partial submission for review and continuation, not as completion of the job. The submitting session does not release its claim to start another job; the maintainer/orchestrator can coordinate continuation from this handoff. No other session's claim was changed. The earlier attempted claim on #56 was rejected in favour of another worker and no substantive work was done there.

### Summary (under 250 words)

Six new prerequisite-to-Belyi links are proposed: PolynomialGaloisGroups Layer 0 for full cycle partitions; its Layer 6 for label semantics restricted to degrees 1–5; CharacterTheory Layers 1, 3 and 4 for raw character-theoretic counts; and AlgebraicTopology Stage 1 for canonical based van Kampen. No outbound dependency or new overlap is claimed in this partial checkpoint. Existing UniversalCovers links and its generic associated-cover ownership recommendation are not duplicated.

Do not merge whole roadmaps on this evidence. Restrict or separately supply the degree-6-through-11 label request, redirect the van Kampen request to its actual owner, and replace the full-product monodromy assertion for disjoint sums by a subdirect-product statement. The analytic, algebraic and profinite partner audits and mandatory catalogue-wide scan remain unfinished. Local structural checks passed; full-atlas validation and independent mathematical review remain pending.
