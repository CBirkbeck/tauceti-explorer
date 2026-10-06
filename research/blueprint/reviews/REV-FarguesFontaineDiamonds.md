# REV-FarguesFontaineDiamonds

Accepted after corrections on 2026-10-06. Reviewer: Codex, session
codex-LdfTRW, issue #407. The original planning worker was Codex session
codex-pBCdzm, issue #730; this reviewer did not write that submission.

This is acceptance of a complete target-level planning pass under PROTOCOL
sections 0 and 2. All six stages remain **planned**, with three recorded gaps
and six supplier requests. None is closed or implemented. The per-node
evidence is in the packet's `review.checked`: 25 verified, 12 corrected,
zero added and zero unverifiable nodes.

| Measure | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 37 | 37 |
| Theorems / constructions | 27 / 10 | 27 / 10 |
| API items | 31 | 33 |
| Named construction tests | 30 | 31 |
| Planets | 16 | 16 |
| Pinned baseline declarations | 7 | 7 |
| Supplier requests / gaps | 5 / 3 | 6 / 3 |
| Planned / closed stages | 6 / 0 | 6 / 0 |

Every construction has at least three tests. F4 has six planets; each other
stage has fewer. All names meet the 60-character limit. No mathematical node
or planet was removed, and every implementation status remains `unchecked`.

The review read the packet, suggested file, blueprint reader, campaign brief,
atlas stage extract, accepted RS-20 result, the /8 finding and verifier,
relevant supplier statements and the reviewed library audit. The upstream
AdicSpaces and AnalyticToricGeometry documents supplied the specification
standard. The blueprint reader was inspected but is outside this review
issue's editable deliverables.

**Source verification.** All four independently downloaded public PDFs have
the packet's recorded SHA-256 hashes. Every node's locator and excerpt was
checked; the 15 distinct locator/excerpt combinations occur in the cited
passages after normalizing mathematical typography. Source statements and
proof interiors were read, rather than relying on excerpt matches alone.

| Public source | Passages checked |
| --- | --- |
| [Fargues–Scholze, Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | II.1.1–4, pp.47–50; II.1.15–18, pp.54–55; II.1.19's introductory boundary for Div¹ |
| [Scholze–Weinstein, Berkeley author draft, 27 March 2020](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | §5.3, pp.38–40; 11.2.1 and 11.3.1 with proofs, pp.92–95; 13.1.1 and adjacent statements, pp.108–109; 13.5.1, p.112 |
| [Scholze, ECD v4](https://arxiv.org/pdf/1709.07343v4) | 9.7, pp.47–48; 10.11(iii), pp.52–53; 11.1/11.3, pp.54–55; 14.13–16, p.88; 15.5/15.6 and proof, pp.91–92; 26.1–3, pp.161–162 |
| [Kedlaya–Liu, Foundations v5](https://arxiv.org/pdf/1301.0792v5) | 8.2.16–19, pp.162–163, including the finite étale algebra comparison and sheafiness warning |

The fixed-field specialization uses E=Q_p and S=Spa(F,O_F), with F complete,
rank one and characteristic-p perfectoid. Algebraic closedness is confined to
the geometric-fiber reduction and its examples. The larger integral analytic
domain in the source is restricted to D(p) intersect D([varpi]) for this curve.
The Berkeley algebraically closed example is supplementary evidence; the
general fixed-field statements use FS and the anchor's specified inputs.

**Corrections made.**

1. Corrected the four discrete-coefficient F5 source routes. ECD Remark 14.14
   supplies bounded-below agreement, and Proposition 14.15 supplies left
   completion. Proposition 14.16 detects membership on cohomology sheaves.
   Corrected the `completed_derived_equiv` use record as well as the node
   locators, match explanations and source reading ledger.
2. Added ECD Remark 26.3 to both adic-coefficient nodes and the reading ledger.
   It supplies operation and right-adjoint compatibility with finite-level
   reduction under the regular-sequence hypotheses. Proposition 26.2 supplies
   the enhanced limit equivalence.
3. Made F′'s complete rank-one characteristic-p perfectoid setting explicit in
   field-map naturality. Specified rank-one generalizations for the real radius
   in Frobenius equivariance; higher-rank window comparisons retain the
   anchor's order-theoretic interpretation. Synchronized the radius comment
   in the suggested file.
4. Read D0's complete quotient-stack node, including `quotient_descent`.
   Its abstract objects-over-a-quotient API does not explicitly establish
   effective descent for the pseudofunctor of étale sheaves. Added a precise
   request to DiamondsAndVStacks:D0 for sets and discrete-ring modules,
   covering objects, morphisms, associators and restriction compatibility.
   Added direct prerequisites to `sheaf_descent` and `finite_cover_descent`,
   corrected the supplied-contract wording and retained the obligation in F3's
   `remaining` list. This routes the general input to its owner; the cyclic
   application remains in F3.
5. Added `affinoid_product_ext` and `product_iso_ext`. Both retain the base and
   marked-untilt coordinates, so an API that silently forgets either fails.
   Added their Lean signatures without unfolding the proposed constructions.
6. Added `affinoid_product_compatible_roots`, the compatible-root-field example
   required by the campaign's completion brief. Its full contract specifies
   the non-algebraically-closed characteristic-p field, its mixed-characteristic
   untilt, the theta values of the roots, their p-power relations and both
   inverted elements. Its Lean fragment uses actual Fontaine theta and explicit
   marking/root equations; missing geometric types stay documented.
7. Added the required independent verdict to source issue E1, scoped its quoted
   sentence to FS, and distinguished Berkeley's different wording. Rejected
   it as an established published-source defect: the evidence identifies an
   implementation-level proof obligation, but exhibits no false step or
   inadequate use of the named classical principle. The boundary theorem,
   finite-root approximation and geometric-fiber passage remain planning gaps.
   This verdict does not close their proofs.
8. Replaced the generic baseline-check annotations with independent-review
   annotations. Corrected the audit gap's wording: RelativeFarguesFontaine is
   inspected as a consumer, not imported as a supplier. Added a prototype
   warning that generic signatures require specialization and restored
   supplier hypotheses before implementation.

No baseline citation was removed or replaced. No new node was needed at target
granularity; the missing general descent input is a supplier request.

**Pinned declarations.** Each name and surrounding variable context was read at
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 or Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. All seven citations provide the
limited input claimed by their consuming nodes.

| Declaration and pinned module | Statement checked and boundary of reuse |
| --- | --- |
| `TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`, `Spa/Analytic.lean` | Commutative topological Tate ring, explicit plus subring; analytic Spa equals Spa. Applied chartwise, with the ring and topology hypotheses. |
| `WittVector.map`, `WittVector/Basic.lean` | Ring homomorphism induced coefficientwise by a ring homomorphism between commutative rings. It supplies no topological assertion. |
| `WittVector.fontaineTheta`, `Perfectoid/FontaineTheta.lean` | Prime p, commutative R, `Fact (¬ IsUnit (p:R))` and `IsAdicComplete (span {p}) R`; map from Witt vectors of `PreTilt R p` to R. Boundedness, continuity and primitive kernel are P1 contracts. |
| `WittVector.fontaineTheta_teichmuller`, same module | With the same hypotheses, theta of [x] equals `PreTilt.untilt x`. The prototype uses the actual map and formula. |
| `WittVector.frobeniusEquiv`, `WittVector/Frobenius.lean` | Prime p, commutative characteristic-p perfect ring; Witt Frobenius is a ring equivalence. The anchor supplies its adic action and continuity. |
| `CategoryTheory.Equivalence`, `CategoryTheory/Equivalence.lean` | Bundled forward/inverse functors, unit, counit and triangle identity. Enhanced derived coherence is requested separately. |
| `TauCeti.ValuationSpectrum`, `AdicSpace/ValuationSpectrum.lean` | Distinct type of valuative relations on a commutative ring, with prime support. The F0 native fragment tests the product-open condition. |

**Closure and ownership.** Every target of F0–F5 is represented. Own-node
prerequisites are acyclic, and their chains end in pinned inputs, supplier nodes,
precise requests or the recorded gaps. Reading suppliers confirmed the A1
analytic Yoneda embedding/products, R0 completed-tensor and closed-subspace
contracts, R5 split-completion theorem, P1 untilt/primitive/theta contracts, P2
rational/tilting slice interfaces, and D0/D3/D4/D6 diamond interfaces. Some
supplier packets are drafts or retain review findings; these imports remain
mathematical contracts, with their limitations recorded.

The reviewed library audit has no F0–F5 entries. Its L0 entry (AUDIT-18) records
the missing derived-complete coefficient system and existing ordinary derived
infrastructure. F5 constructs comparison functors after C2/L0; it does not
replan the general derived completion assigned to foundational suppliers.
Direct pinned checks supplement this incomplete audit coverage.

Accepted RS-20 fixes the Part II title and AdicSpaces base. The packet imports
the actual Witt pair, annuli, radius, windows and adic quotient, then adds the
fixed-field comparisons. F0–F4 have no C2/L0 or six-operation prerequisite and
no reverse dependency on the relative curve. The relative roadmap consumes
this seed.

Confirmed RT-AREA-padic-1/8 is handled in both the packet and inspected reader:
marked untilts, primitive ideals, their classification and the theta kernel are
imported from the exact P1 nodes. F4 adds the analytic closed-image/Cartier
application. It does not introduce a second classification. The positive
Frobenius computation in F2 and the inverse marking shift after resetting a
graph's first coordinate in F4 agree with their respective conventions.

The F4 boundary argument is explicitly open. The planned reduction retains the
compatible roots, ordinary split completion, norm renormalization and checks
on every rational affinoid. The all-rational Cartier criterion and integral
recognition bridge are precise R0/Q0 requests. F5 separately retains ordinary
derived, bounded-below diamond and unbounded left-completed ranges, followed
by the regular-sequence adic limit and its actual comparison maps.

**Prototype assessment and validation.** PROTOCOL section 13 explicitly permits
leaving out a condition whose supplier type cannot yet be stated. The input
file already records these omissions, and the mathematical hypotheses remain
in the packet and adjacent comments. Its generic types and categories are
therefore assessed as signature shapes. They are not universally true
mathematical statements: an equivalence between arbitrary point sets need not
exist, and the multiplication bound needs its stated geometric boundary
conditions. Elaboration cannot validate those missing hypotheses, instantiate
the suppliers, or prove the admitted bodies. Acceptance does not authorize
using these shapes as polymorphic axioms.

All 37 declaration names, 33 API names and 31 test labels agree with the revised
packet. The examples test the available native fragments; their full geometric
contracts are displayed alongside them. Each construction's mathematical tests
would reject a plausible forgotten coordinate, marking, cocycle, quotient
convention or coefficient-completion convention.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FarguesFontaineDiamonds.json --json`:
  zero errors and zero warnings, using the available pinned declaration index.
- `lean-check research/blueprint/suggested/FarguesFontaineDiamonds.lean`:
  input and revised file both exited 0. The revised file emitted 102 intended
  `sorry` warnings and no other diagnostics. Available memory was 106 GB before
  each check. No language server or library build was started.
- Cross-file names, test counts, source hashes, prerequisite cycles, stage
  targets and planet limits were checked independently of the packet checker.
- `git diff --check` and deliverable-scope inspection passed.

The shared elaboration environment has the exact Mathlib pin and Tau Ceti
cf386627e9176a3827c1a5fe804989fd94a4d216. The directly imported Spa.Basic git
blob is unchanged from the Tau Ceti pin:
`b7513ba9169b693e94c3780b534fa2150fe737a1`. This was checked from git objects,
not the source stubs in the shared working trees. Spa.Analytic's object file is
unavailable, as the planning handoff records. The compilation is qualified
evidence for available signatures, rather than a full exact-pin Tau Ceti check.

There are no unresolved orchestration questions. Before treating the reader as
synchronized, its authorized owner must refresh the F5 source labels/use
paragraph, F3 descent-contract wording and remaining task, two new API entries,
compatible-root test, and baseline/audit annotations from this packet. This
review did not edit that read-only file. Preserve all three gaps and six requests
in promotion and follow-up work; the new D0 request belongs to D0, while the
fixed-curve specialization remains F3.
