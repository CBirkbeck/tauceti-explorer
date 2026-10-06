# REV-HabiroRings--HR.3

Independent review for issue #6451 by Codex, session `codex-wEmpzl`,
6 October 2026. The input was written by Codex session `codex-1W5Jdw`
for BP-HabiroRings--HR.3, issue #6499. I did not write that input.

**Verdict: accepted after the corrections below.** This is a completed
target-level planning pass. HR.3 remains `planned`, with five open supplier
requests and two recorded gaps. Acceptance does not discharge those requests,
close the parent categorical gap, or certify any formalization.

## Scope and counts

I reviewed the packet and suggested file, and read the companion reader, the
five imported HR.3 nodes in the parent packet, its independent reviews and
latest accepted fix review, the reviewed AUDIT-17 library entry, the HR.3 stage,
and the relevant supplier stages and available packet nodes. I followed the
blueprint and expansion protocols, WORKERS and UPSTREAM_GUIDE; the upstream
AlgebraicTopology and AnalyticToricGeometry roadmap documents were read for
the planning standard. The parent, suppliers, reader and atlas data were not
edited.

| Item | Input | Reviewed result |
|---|---:|---:|
| Nodes | 5 | 7 |
| Definitions / constructions / lemmas / theorems | 1 / 2 / 1 / 1 | 1 / 2 / 3 / 1 |
| API items on definitions and constructions | 23 | 22 |
| Unit tests | 11 | 12 |
| Baseline declarations | 6 | 11 |
| New planets | 3 | 3 |
| Open requests / gaps | 5 / 2 | 5 / 2 |
| Planned / closed stages | 1 / 0 | 1 / 0 |

The API count changes by +1 for the inclusion-order characterization and −2
for results promoted to lemma nodes. Their existing suggested theorem
signatures are retained. Together with the parent's two HR.3 planets there
are five planets, within the six-planet limit. All seven implementation
statuses are `unchecked`.

## Corrections, including added nodes

1. Added `CyclotomicIndex.le_iff_subset` and
   `CyclotomicIndex.test_incomparable_singletons`, including their suggested
   signatures. At m=2, `{1}` and `{2}` are incomparable even though 1 divides
   2. The original vertex tests would not reject an incorrect arrow order.
2. Added five pinned Mathlib citations for p-free factorization, multiplicity
   and divisibility. The proof now names the nonzero hypotheses, uniqueness
   argument and strict exponent bound needed for consecutive prime edges.
   The suggested import changes from Factorization.Defs to Factorization.Basic.
3. Promoted the two API results used by the mapping-space theorem to
   `HabiroRings:HR.3/finite-index-height-one` and
   `HabiroRings:HR.3/prime-edge-factorisation`. Each has
   `addedBy: REV-HabiroRings--HR.3`, its own statement, hypotheses, proof,
   direct prerequisites, source match and acceptance cases. The mapping-space
   node now cites both. This exposes cross-node API dependencies as required
   by section 4; it does not split the categorical proof into routine lemmas.
4. Made invariance of derived Koszul reduction under the completion unit
   explicit in the DD.1 request, the conservativity proof and the suggested
   mathematical signature. This supplies the implication from vanishing
   completion to vanishing reduction, before using Nakayama on the original
   f-complete object.
5. Expanded E0's request to include mapping spaces of coherent sections, the
   height-one incidence homotopy equalizer and elimination of the common
   chain-component map. These are the precise generic inputs used by the
   prime-edge formula.
6. Added HA Corollary 3.2.2.4 as the direct fixed-category specialization of
   3.2.2.3, in the source reading record, E5:abstract request and suggested
   comments. Kept it distinct from the limit of varying monoidal categories.
7. Clarified that HTT locators use printed pages, with PDF page offset +18.
   Added the independent `review` object, this report and the required handoff.

No original baseline citation was removed or replaced. No source issue was
added; `sourceIssues` was empty. The parent's already recorded source
corrections remain in that packet.

## Every node checked

**Finite descent index — corrected.** Wagner's Corollary 2.4 proof, p. 15,
defines the inclusion-ordered subposet of singleton divisors and maximal
prime-power chains. The locator and short literal excerpt match. The finite
enumeration uses prime factors of m; singleton chains at primes outside m
are represented by the singleton vertices, rather than tagged copies.
Vertices are actual subsets. The inherited order, positive-divisor convention,
nonemptiness, inclusion in Q and ordinary index nerve all agree with Mathlib.
The added order test discriminates inclusion from divisibility.

**Height one — added and verified.** This is an explicit consequence of the
source index and the parent's reviewed intersection classification, not a
new theorem attributed verbatim to Wagner. Distinct nontrivial maximal chains
are incomparable; so are distinct singletons. Every strict arrow is therefore
singleton-to-chain, and two strict arrows cannot compose. The m=6 incidence
cycle consequently has no nondegenerate 2-simplex. Its statement agrees with
the existing `CyclotomicIndex.height_one` suggested signature.

**Prime-edge factorization — added and verified.** The source's comparisons
and maximal-chain reduction are located in Corollary 2.4 and its proof,
pp. 14–15; the excerpt matches. This node states the arithmetic justification
of that reduction, rather than claiming a separately named source theorem.
From pd dividing positive m, d is nonzero. The p-free decomposition gives
d=d₀p^i, multiplicities determine i uniquely, cancellation determines d₀,
and divisibility gives i<v_p(m). The pair is consecutive in its unique
maximal p-chain. The proposed Lean signature is unchanged.

**Coherent completion diagram — verified.** Setup 2.1 and Remark 2.3,
pp. 13–14, support the reflector diagram and its monoidal construction;
the locator and excerpt match. If I_S is contained in I_U, the complete
subcategory D_U is contained in D_S. Adjoint reversal consequently gives
the covariant transition L_(I_U) restricted to D_S. Its tensor is the
completed derived tensor and its unit is completed B. Chain identifications
use the imported radical calculation. Accessibility, coherent composition,
monoidal localization and categorical limits are explicit supplier inputs.
Although the chapter fixes a perfectly covered Lambda-ring A, this finite
argument uses only a commutative ring: Remark 2.3 is stated for a ring and the
arithmetic and completion specialization uses no Adams operation, flatness
or torsion hypothesis. The packet's stated generality is thus justified by
the proof. Later relative Habiro constructions retain their own hypotheses.

**Finite localization contract — corrected.** The cited Lemma 2.2 proof sketch
and Corollary 2.4 proof, pp. 14–15, contain the finite conservative-descent
argument; the excerpt matches. For a fibre N whose cyclotomic completions
vanish, reduction invariance implies N/Φ_d=0. Multiplication by every Φ_d
is then an equivalence, hence so is their product f. Nakayama on the
f-complete N gives N=0. Exactness permits completion to cross this finite
homotopy limit. The stable cube contraction and coherent completion
composition are requested explicitly. Completeness is closed under limits,
so the section's reconstructed limit is f-complete. Right Kan extension
uses `(S ↓ j)`: empty for discarded intersections, initial S for an included
vertex, and the unique containing maximal chain for a surviving nonsingleton
outside P. General limits here use an initial object. There is no assertion
of arbitrary limit preservation by a left adjoint.

**Reconstruction functor — verified.** The essential-surjectivity step in
Lemma 2.2's proof sketch and Corollary 2.4's proof supplies the cited source
match. Extend the section from P to Q, then take the finite ambient E∞
B-algebra limit through the lax monoidal inclusions. The underlying-object
limit theorem and the finite localization contract identify the completions,
unit and counit. Functoriality and triangle homotopies are coherent cone
properties. The contractible solution space consists of pairs with a specified
equivalence to the input section; it does not assert that an unmarked algebra
has no automorphisms. The m=1, prime, canonical unit and m=4 tests correctly
exercise these constructions.

**Prime-edge mapping spaces — verified.** The final categorical limit and
unravelling in Corollary 2.4, p. 15, together with Lemma 2.2 justify this
derived universal property; the excerpt matches. Both maps V→W have target
Map(E_pd completed at p, F_d completed at p): their composites are respectively
the completed d-map after h_E and h_F after the completed pd-map. A specified
path between these composites is required. The path-space homotopy equalizer
retains all higher homotopies. Eliminating each chain-component map leaves
its consecutive prime-edge paths by the two promoted lemmas and the precise
E0 request. At m=6 there are four edge paths and no extra cycle equation.
Joint conservativity detects equivalences componentwise.

## Baseline verification

Every declaration below was read in its cited module at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The statement and relevant
conventions supply the claimed input; new arithmetic citations were also
checked with their proofs. Tau Ceti remains pinned at
`f790474821cf4256814db967cb154e7af3d0c369`; this packet cites no Tau Ceti
declaration.

| Declaration | Module below Mathlib | What was confirmed |
|---|---|---|
| `Nat.divisors` | NumberTheory/Divisors.lean | Finite positive divisors; divisors of 0 are empty. |
| `Nat.primeFactors` | Data/Nat/PrimeFin.lean | Membership means prime and dividing a nonzero integer. |
| `Nat.factorization` | Data/Nat/Factorization/Defs.lean | Finitely supported prime multiplicities, with the existing zero convention. |
| `CategoryTheory.Nerve.quasicategory` | AlgebraicTopology/Quasicategory/Nerve.lean | Ordinary-category nerve instance, used only for the index. |
| `Polynomial.cyclotomic` | RingTheory/Polynomial/Cyclotomic/Basic.lean | Existing cyclotomic polynomial over a ring. |
| `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` | RingTheory/Polynomial/Cyclotomic/Basic.lean | Positive n and a commutative coefficient ring give the divisor product formula. |
| `Nat.exists_eq_pow_mul_and_not_dvd` (added) | Data/Nat/Factorization/Basic.lean | Nonzero n and p≠1 give n=p^e n₀ with p not dividing n₀. |
| `Nat.factorization_mul` (added) | Data/Nat/Factorization/Defs.lean | Both factors nonzero give additive multiplicities. |
| `Nat.Prime.factorization_pow` (added) | Data/Nat/Factorization/Defs.lean | A prime power has the indicated single nonzero multiplicity. |
| `Nat.factorization_eq_zero_of_not_dvd` (added) | Data/Nat/Factorization/Defs.lean | Nondivisibility forces zero multiplicity. |
| `Nat.factorization_le_iff_dvd` (added) | Data/Nat/Factorization/Defs.lean | For nonzero d,n, multiplicity comparison is equivalent to divisibility. |

The reviewed HR.3 AUDIT-17 entry says `not built`. Its existing cyclotomic
arithmetic is reused, ordinary adic completion is not mistaken for derived
completion, and the derived categorical machinery is requested from its
generic owners. HC.1/HC.4, HQ.4 and EDS/DD.1 ownership is not duplicated.

## Closure, API, tests and remaining questions

All HR.3 targets are represented: intersection arithmetic and fracture pieces
are imported; the actual coefficient diagram and conservative descent
contract are explicit; right Kan reduction and the categorical comparison use
the imported morphism-level theorem; reconstruction and its mapping-space
universal property are new target nodes. The parent five nodes are retained
by reference. The reachable prerequisite graph contains 35 nodes and has no
cycle. This check does not re-certify every baseline leaf of previously
reviewed supplier packets. There is no reverse HR.3-to-supplier path for any
of the five requested stages in the current atlas/packet stage graph.

The existing E0/E5 nodes define some foundational objects but do not supply
all these exact theorems; DD.1's current packet has no DD.1 node and leaves
that stage `not_read`. Those boundaries remain requests and gaps. E0 owns
finite-poset sections, mapping spaces and cubes; E3 owns coherent adjoints
and the full-inclusion right Kan theorem; E5:abstract owns monoidal
localization and the two distinct algebra-limit results; E5:presentability
owns adjoint reversal and presentable categorical limits; DD.1 owns generic
derived completion. The parent's arbitrary-site theorem is not closed by
this finite accessible application.

The index's seven API items, the diagram's seven and reconstruction's eight
cover their recorded uses. They fix constructors, vertex/order
characterizations, structure, completed unit/tensor, coherent functor laws,
evaluation, comparisons and universal properties. Definitions and
constructions have respectively five, three and four tests. These reject
incorrect vertices, arrow order, plain tensor units, retained zero
intersections, and extra m=4 comparison data. The suggested file represents
all 22 API and 12 test names. Its actual finite-index signatures elaborate;
the enhanced statements remain explicitly named mathematical omissions
because the necessary carriers are unavailable. No arbitrary proposition
field or opaque substitute makes them vacuous.

Questions for the orchestrator, none blocking this review's acceptance:

1. Schedule the already proposed EDS ownership refinements and match actual
   supplier nodes against these five exact contracts, including reduction
   invariance and the section mapping-space formula.
2. At assembly, synchronize the read-only companion reader's original
   counts and API organization with this review: seven nodes, 22 API items,
   12 tests and 11 baseline declarations. Its existing mathematical
   descriptions remain valid; the added order characterization/test and
   promoted nodes are recorded in this report and the packet. The review
   issue does not authorize editing that reader.
3. When real enhanced carriers are supplied, replace the documented omitted
   signatures and tests with actual Lean forms, then revisit closure.

## Checks and public source record

* Packet checker: 0 errors, 0 warnings, against the configured pinned
  declaration index.
* `lean-check` on the suggested file: exit 0, only twelve expected `sorry`
  warnings. It checks two finite-index definitions, seven theorem signatures
  and five example signatures, not the enhanced comments or any proofs.
  Available memory was 97 GB before compilation; one compiler was run and
  completed, with no language server.
* Independent bounded enumeration for m=1 through 90: 23,016 nonempty
  divisor subsets. Checked vertex containment, maximal-chain
  incomparability, height one, unique consecutive prime-edge factorization
  and all right-Kan slices. P(1), P(4), P(6) have 1, 4, 8 vertices; P(6)
  has 8 incidence arrows and 4 prime edges. This checks combinatorial
  conventions, not ideal arithmetic or categorical proofs.
* Dependency and declaration-name checks cover the seven review entries,
  both promoted signatures, all API/tests, distinct baseline citations and
  unchanged implementation status. File intake and whitespace validation
  pass for the four deliverables.

All three public PDFs were downloaded and their hashes agree with the input.
No required source was inaccessible.

| Source/version | SHA-256 |
|---|---|
| [Wagner, arXiv:2510.04782v2, 8 October 2025](https://arxiv.org/pdf/2510.04782v2) | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [Lurie, Higher Algebra, 18 September 2017](https://www.math.ias.edu/~lurie/papers/HA.pdf) | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |
| [Lurie, Higher Topos Theory, 9 April 2017](https://www.math.ias.edu/~lurie/papers/HTT.pdf) | `58855f3a0ad6d9c470ded74a38938b9468927592e9ae1209bab6a068e67ede6e` |

Read Wagner §1.22(c)–(d), pp. 11–12, and §2.1–2.6, pp. 13–15, including
the full Corollary 2.4 proof and Lemma 2.2 proof sketch. Read HA 1.2.4.15
and 2.2.1.9 with proofs, 2.1.3.1, and 3.2.2.1–4 statements with the short
corollary proofs. Read HTT 3.2.0.1's statement, 3.3.3.2 with proof, and
5.5.3.2–5 and 5.5.3.12–13 with the cited short proofs. HTT pages are printed
pages (PDF +18). The long straightening and HA 3.2.2.1 proofs were not
audited; their implementation remains with the supplier requests. The
companion paper's ideal arithmetic is imported from the reviewed parent
intersection node rather than re-extracted here.
