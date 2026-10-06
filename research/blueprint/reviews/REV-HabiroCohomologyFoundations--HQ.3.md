# Independent review of HQ.3

**Verdict: accepted as a complete planning pass, with the recorded gaps.**
Job `REV-HabiroCohomologyFoundations--HQ.3`, issue #6443; reviewer Codex,
session `codex-BRnBke`; 6 October 2026. The input was written by session
`codex-sFf91B` for issue #6491. This reviewer did none of that work.

The review covers the three local nodes in
`research/blueprint/packets/HabiroCohomologyFoundations--HQ.3.json`, its
suggested Lean file, and the reader's treatment of RT-AREA-etale/31. The
24 previously accepted HQ.3 nodes are imported interfaces, not newly certified
or replanned declarations. Their relevant supplier statements and the two
explicit import qualifications were checked. The prior HQ.1 packet was not
edited.

| Item | Result |
| --- | --- |
| Local nodes | 3 checked and corrected: 2 constructions, 1 comparison |
| New or removed nodes | 0 |
| Baseline declarations | All 9 confirmed; none removed or replaced |
| API items and tests | 16 API items; 7 tests checked |
| Planets | 6 inherited; 0 new |
| Supplier requests | 4 retained, with precise enhanced contracts |
| Gaps | 2 retained, plus explicitly inherited gaps |
| Coverage | HQ.3 planned; no stage closed |
| New source mistakes | 0; the three inherited corrections apply |

## Sources and corrections

Read the version-specific public [Wagner v2 PDF](https://arxiv.org/pdf/2510.04782v2)
and [source archive](https://arxiv.org/src/2510.04782v2). Their SHA256 values
match the packet: `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`
and `9c338455871808eb2265681199279607b4b179b3973752d48eca3f711bc25b47`.
Checked each local node's excerpt and locator against the TeX and the printed
PDF pagination. Definition 3.2 is on pp. 20–21; Theorem 3.11 on p. 25;
Construction 3.32 on p. 41; Construction 3.38 on pp. 42–44, with its final
functoriality paragraph on p. 44; Construction 3.42 and Proposition 3.43 start
on p. 45; Construction 3.45 and Lemma 3.46 are on p. 47; Theorem A.1 is on
p. 69; the relevant B.1–B.2 completion statements start on p. 77.

Corrections made in the packet:

1. Changed the Construction 3.38 range from pp. 43–44 to pp. 42–44, specifying
   p. 44 for the cited final paragraph.
2. Changed Construction 3.45 from p. 48 to p. 47 and the Lemma 3.46 proof
   locator from pp. 48–49 to p. 47.
3. Replaced the two uninformative excerpts at Definition 3.2 and Construction
   3.45 with distinctive literal fragments. Shortened the A.1 and 3.38 excerpts
   without changing their meaning. All resulting excerpts match the source.
4. Added `HabiroRings:HR.2/completeness-via-the-factorial-tower` as a direct
   prerequisite of the Habiro base-change node. Its statement supplies the
   completeness characterisation, adjunction and idempotence used there;
   the definition node alone delegates those facts to this theorem.
5. Reworded the base-change target label to the specified finite-projective
   range. The existing qualification still records that the comparisons
   depend on requested supplier exports.
6. Added the independent `review` object and updated Lean validation metadata.

The Stacks Project's [Lemma 10.78.2](https://stacks.math.columbia.edu/tag/00NV)
was checked, including conditions (2), (3) and their splitting proof. The
finite-projective retract argument is proposed here, not attributed to Wagner
as a base-change theorem for chosen pairs. A.1 assumes both coefficient rings
are p-torsion free and states a completed smooth comparison; the imported
HQ.2 node records its animated extension with that completion. Neither that
statement nor fixed-base functoriality in 3.38 establishes the full new
coefficient-change theorem by itself.

`sourceIssues` is empty, so no local finding needs a new per-finding verdict.
The inherited E3, E102 and E401 were checked against the relevant source
displays. They respectively correct the twisted-filtration symbol, retain
the degree-one quotient over A[q]/(q^m−1), and fix the convention for intrinsically
shifted animated graded pieces. This packet applies all three and adds no
second shift to G^i.

## Mathematical closure and ownership

For `finite-projective-base-change-of-chosen-filtrations`, finite projectivity
gives B as a retract of a finite free A-module. Thus scalar extension on
underlying enhanced modules preserves limits and colimits, and flatness gives
exactness and t-exactness. This argument is on modules; it does not assert that
animated algebra base change preserves arbitrary limits. The requested DD.1
export supplies the enhanced, B-linear and coherent form of the exchange
maps. Clauses (a), (b), (c) and each (c_p) are transported separately, together
with their diagrams and homotopies. Clause (c_p) is not inferred from (c).
The shifted filtered quotient uses multiplication from the preceding step.
The filtered DD.2 enhancement remains a request beyond its existing
unfiltered `derived-base-change-kunneth` node. Completion is removed from the
left of the modification comparison only in the stated finite-projective
range.

For `finite-projective-base-change-of-twisted-filtrations`, the relation
f ψ_A^d = ψ_B^d f and tensor associativity identify the coefficient twists;
there is no unnecessary cartesian Adams-square hypothesis. The prime-power
recursion compares the whole relative-Frobenius/Nygaard pullback, and the
global comparison compares the gluing arrows as well as their objects.
Finite products, pullbacks, completions, localisations and the factorial
N-limit are covered by the DD.1 request. PR.3 and AI.1 are the appropriate
owners of the exact Frobenius/Nygaard and filtered décalage exports. Reading
their supplier descriptions and available interfaces did not establish those
specific exports. The packet records that limitation explicitly, so this is
a conditional proof plan. The requested décalage argument uses torsion-free
representatives and flatness, not unrestricted exactness of Lη.

For `finite-projective-habiro-hodge-base-change`, the map is the canonical
functor–limit comparison followed by the limit of the stagewise comparisons.
Its projection formula has the correct order. Invertibility uses both
preservation of the limit and the preceding conditional twisted comparison;
constructing the map alone requires less. Completed partial descent at every
m, q−1-completion, reductions, and the colimit filtration follow from the
listed imports and exchanges. The added HR.2 theorem supplies the complete
object characterisation. The Künneth compatibility uses completed tensor
products of chosen pairs, rather than a categorical product of rings.

The unrestricted Λ-map gap is necessary: ℤ[[t]] tensored algebraically with ℚ
contains only series with a common denominator, while coefficients
1/(n+1)! have no common nonzero denominator. This excludes using flatness
alone to commute the relevant limits. It does not disprove a suitably
completed rational base-change theorem.

All HQ.3 targets are accounted for by imported declarations, these three
nodes, exact requests or precise gaps. Target-level granularity is appropriate;
no proof was split into a redundant lemma family. `complete` denotes a
finished planning pass; `planned` does not certify that the requested
enhanced results have been proved. The packet does not satisfy or claim the
stronger conditions for `closed`.

The accepted AUDIT-19 entries for HQ.2, HQ.3 and HQ.4 were checked. Searches
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` found no Habiro/q-Hodge/q-de Rham/q-Witt
target declaration. Ordinary module algebra and category theory are reused;
generic completion, filtered de Rham, prismatic and décalage theory remain
with their owners. No duplicate layer or upstream edit is proposed. The
upstream AdicSpaces and HodgeStructures documents were read for their API,
example and dependency standard.

## Baseline, API and suggested Lean

Read the actual declarations at the Mathlib pin, checking names, hypotheses
and the roles claimed in `baseline.declarations`:

| Declaration | Verified support |
| --- | --- |
| `Module.Finite` | Finite generation via `fg_top` |
| `Module.Projective` | Splitting of the free-module surjection |
| `CategoryTheory.Limits.limit.post` | Canonical comparison from E(lim X) to lim(X ⋙ E), without preservation |
| `CategoryTheory.Limits.limMap` | Map on limits from a natural transformation |
| `CategoryTheory.Limits.limMap_π` | Projection formula for that map |
| `CategoryTheory.Limits.limit.post_π` | Projection formula for the functor–limit comparison |
| `CategoryTheory.Limits.isIso_limMap` | An isomorphism of diagrams induces an isomorphism on limits |
| `CategoryTheory.preservesLimitIso` | Comparison isomorphism with the displayed preservation hypothesis |
| `CategoryTheory.preservesColimitIso` | Corresponding colimit isomorphism |

The modules cited in the packet are correct. These declarations support
ordinary categorical signatures and algebraic hypotheses, not an enhanced
scalar-extension theorem. The suggested file imports only pinned Mathlib;
the different Tau Ceti build head therefore has no effect on elaboration.

The two constructions have usable constructor, data, characterisation,
compatibility and identity/composition interfaces. Projection characterises
the Habiro map by the limit's universal property. Naturality of the chosen
pair functor is part of its constructor and natural diagram comparisons,
rather than an independent arbitrary choice on each input. The six existing
planets identify the central source constructions without creating a seventh
base-change planet.

The identity and split-extension tests catch failures of unit and two-copy
transport. The shifted-quotient test distinguishes the degree-one quotient
from degreewise quotients. The coordinate test distinguishes the scaled
Jackson differential from t times the usual derivative. The denominator test
guards the finite-projective range. These give three tests for the pair
construction and four for the Habiro map.

Corrections made in the suggested file:

1. `stepMul` now specifies actual multiplication by the power-series variable
   into the next ideal; its membership and linearity proofs still use `sorry`.
2. `qMinusOne` uses the stated `partialDescent` comparison;
   `cyclotomicFiltration` is the actual composite diagram; `kuenneth` is the
   tensor of the two maps followed by the supplied Künneth isomorphism.
3. The coordinate example now uses a concrete polynomial scaled differential,
   with q as inner variable and x as outer variable. It tests coefficient
   extension on arbitrary input polynomials and the explicit D(x²) formula,
   rather than only mapping the coefficient q²−1.

These helper calculations add no roadmap nodes or API names. All 16 API names
and seven named examples remain represented. The file explicitly omits
enhanced q-Hodge axioms, homotopies, Frobenius/Nygaard and gluing comparisons,
and some completion identifications. `PairShadow` is ordinary data, not an
∞-category of q-Hodge pairs. The ordinary limit-preservation theorem is only
one step of the twisted theorem. No opaque Prop field stands in for a missing
condition. Elaboration checks signatures, not the enhanced mathematical
comparison. All implementation statuses stay `unchecked`.

## Red-team finding and remaining owner work

RT-AREA-etale/31 is correctly handled in the packet and reader. The exhaustive
ascending filtration and uncompleted q-Witt graded pieces belong to
H/(q^m−1), where H is the Habiro–Hodge inverse limit. On qHdg/(q^m−1) they
are q−1-completed. The packet's new node, acceptance conditions, targetCoverage
and import qualifications, and the reader's cyclotomic, coordinate and
cohomology sections preserve this distinction. No reader change is needed.

For the orchestrator: retain the four supplier requests and both new gaps;
do not treat this acceptance as discharging them. The older HQ.1
`habiro-descent` inclusion gloss and `twistedQHodgeFil_mod` shift wording still
merit an owner correction. This pass expressly qualifies those imports and
does not depend on the incompatible glosses; the older packet is outside this
job's deliverables. There is no blocker for accepting the present pass.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundations--HQ.3.json`:
  **0 errors, 0 warnings**, using the provided pinned declaration index.
- `lean-check research/blueprint/suggested/HabiroCohomologyFoundations--HQ.3.lean`:
  **exit 0**, with **19 warnings, all declaration uses `sorry`**, after corrections.
  Memory was checked and exceeded 20 GB. No language server or build/cache/update
  command was used.
- JSON parsing, API/test name correspondence, exact deliverable scope and
  `git diff --check` were checked. No roadmap target was reported formalised,
  and no atlas promotion was performed by this worker.
