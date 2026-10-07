# Independent review: HabiroCohomologyFoundations--HQ.1-2, revision 2

**Verdict: accepted.** Completed review of #7055 by Codex (GPT-6), session
`codex-5tU60O`, on 2026-10-07. This session wrote neither the original plan
nor its revision. Reviewed input commit
`51e2733c8bb188e1c1be133f50076f8f4fbe3b38`, including the revision by the
separate session `chatgpt-5c67bc37a117` (#6968). This is a completed review,
not a checkpoint.

The revision resolves the [previous review's objections](REV-HabiroCohomologyFoundations--HQ.1-2.md).
The reader, packet and suggested file agree. Acceptance covers this complete
target-level planning pass: HQ.1 remains **planned**, with four precise open
generic supplier requests and six enhanced signatures that cannot yet be
expressed at the pins. It does not claim closed coverage or implementation.

| Inventory | Result |
| --- | --- |
| Nodes | All 7 verified; none corrected, added or unverifiable |
| Baseline entries | Both confirmed at the pinned Mathlib commit |
| Source references | All 12 checked afresh against 6 public sources |
| API items | 21, unchanged; all represented in the reader and suggested file |
| Unit tests | 11, unchanged; constructions/definition have 3, 4 and 4 |
| Planets | 2 new; explicit selection gives 6 after assembly |
| Coverage | Packet complete; HQ.1 planned, not closed |
| Requests and gaps | 4 open supplier contracts; no additional mathematical gaps |
| Source issues | Empty in this follow-up; no new source mistake found |
| Validation | Packet checker clean; native Lean subset elaborates with 10 `sorry` warnings |

Read all three deliverables, the previous review and revision handoff, the
accepted earlier HQ.1 packet, the reviewed HQ.1/HQ.2 library audit, the exact
imported declarations and supplier stages, PLAN-HABIRO §6.5, accepted RS-10
round 2, and the three confirmed étale red-team findings with their verification.
The upstream HodgeStructures and DGAInfinity documents were read in full for
the required comparison of scope, conventions, API density and discriminating
examples. Supplier files, the earlier accepted packet and atlas data are inputs
only.

## Resolution of the previous review

| Requested correction | Independent assessment of revision 2 |
| --- | --- |
| Sheaf reduction versus section reduction; restriction and extension API | Reader §3 gives the ordinary de Rham sheaf after reduction, and hypercohomology after reducing sections. Both `restrict` laws and the mapping-space `ext` property are present. |
| Positive semilinearity and coherent action | Reader §5 consistently uses θ_a:F_a(M)≃M. The tensor balance, inverse scalar identification, cocycle, sixth proof step, four added APIs and q=2 test agree with the packet. |
| Enhanced affine quotient interface and degeneracies | Reader §6 specifies HC, Mod_HC≃D(C), compatible pullback/tensor, the coproduct action nerve and degeneracies inserting the zero label. |
| Local finite freeness and perfection | Reader §7 includes the corrected proof and precise DAG VIII locators; perfection and equivariant compactness remain distinct. |
| Full LP1 contract, current counts and ownership | All four request texts agree. Counts are 21 APIs and 11 tests. HQ.2 retains twisted q-de Rham/Nygaard; HQ.4 retains the uncompleted framed construction; HQ.3 retains descent/comparison. |

No mathematical correction to the revision is necessary. This review replaces
the old top-level review object with seven `verified` assessments, refreshes
the six public-source access dates, links the current review and its fresh
compilation evidence in the reader, and removes the obsolete synchronization
qualification from the suggested file's standard opening note. The original
review report remains available as the history of its corrections. No node,
hypothesis, proof, API, test, request, planet or coverage status is changed.

## Primary sources

All sources were freshly obtained and their relevant passages read on
2026-10-07. The three PDF hashes exactly match the recorded versions:

| Public source | SHA-256 |
| --- | --- |
| [Wagner, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2) | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [Scholze, arXiv:1606.01796](https://arxiv.org/pdf/1606.01796) | `ce060b41e28fef16c011d3d3455c53a8bdc11cd8c98dc4dc6c2be178e1567273` |
| [Lurie, DAG VIII, November 5, 2011](https://people.math.harvard.edu/~lurie/papers/DAG-VIII.pdf) | `c9f1b4bb3fab1624c2c5d97e0c1701352912fc0ffda752e8345ab11bb70e0523` |

Wagner Theorem A.1, printed p.69, and A.11–A.14 with the proof, pp.74–76,
supply the global complete functor, reduction and underlying framed
equivalence. The three node references to its reduction/framed passages have
literal excerpts at the stated locators. The torsion-free Λ-ring base
hypothesis is retained; S and its étale extensions do not receive invented
Adams operations. Finite presentation in the new descent theorem is an
explicit restriction making the ordinary form degrees uniformly bounded.

Scholze Definition 7.3 and Remark 7.4, printed p.15, and Conjecture 7.5,
p.16, confirm both excerpts and the ordinary-connection motivation. The
coordinate-independent ordinary connection category remains conjectural.
Neither the source's conjecture nor its naive tensor product is used as an
enhanced quotient theorem.

DAG VIII §2.7 supplies the general prestack right-Kan construction,
Proposition 2.7.6, Definition 2.7.8, Remarks 2.7.10–12 and sheafification
invariance in Proposition 2.7.14/Remark 2.7.15. All three node excerpts match,
including the coherent-homotopy phrase across a page break. Also read
Definition 2.6.14, Proposition 2.6.15 and its proof; Definitions 2.7.19–21,
Example 2.7.23, Remark 2.7.24; the monoidal construction preceding 2.7.27;
and Propositions 2.7.28 and 2.7.31–33. These are the actual local-property
inputs. Propositions 2.7.17–18 retain their spectral Deligne–Mumford scope
and are not used to assert representability of the infinite-group quotient.

The [Stacks derived-completion section, tag 091N](https://stacks.math.columbia.edu/tag/091N),
Definition 15.93.4 and the following limit closure, and Lemma 15.93.20 with
proof, confirm the complete-limit and Nakayama input. The principal ideal is
finitely generated, as required. The excerpt occurs literally.
The [Stacks quasi-coherent cohomology section, tag 03OY](https://stacks.math.columbia.edu/tag/03OY),
Lemma 59.22.1 and Theorem 59.22.4 with their affine Amitsur and separated
affine-cover proofs, confirm both excerpts and support the bounded form-row
argument. The full de Rham complex consequence is proved in the packet,
rather than attributed verbatim to this source.
The [Stacks presentations section, tag 06WT](https://stacks.math.columbia.edu/tag/06WT),
Proposition 96.14.3 and its groupoid cocycle proof, confirms the ordinary
quotient-heart interpretation and excerpt. It is not an enhanced derived
descent theorem.

No new source mistake was found. The Wagner A.1 proof's R-for-S misprint is
already confirmed as E109 in the accepted predecessor's source provenance;
this follow-up neither conceals it nor duplicates its erratum. Unpublished V5A4
notes remain unavailable and their numbered analytic identifications are
outside this pass's verified theorem claims.

## Baseline and duplication

Both baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Pinned statement assessment |
| --- | --- |
| [AddMonoidAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean#L59) | Native finitely supported coefficient carrier. Its semiring hypotheses are weaker than CommRing B; convolution on the integer lattice is the required Laurent algebra. |
| [AlgEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Equiv.lean#L28) | Native invertible ring map commuting with the coefficient algebra map. Its weaker commutative-semiring base hypotheses provide exactly the scaling target. |

Also freshly read pinned `DerivedCategory` in DerivedCategory/Basic.lean,
lines 69–101, and `SheafOfModules.QuasicoherentData`/`IsQuasicoherent` in
Sheaf/Quasicoherent.lean, lines 204–254. Ordinary localization and local
module presentations do not supply coherent limits of enhanced categories.
At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read
`TauCeti.ConstantGroup.functionAlgEquiv` in ConstantGroup/Basic.lean,
lines 46–85: its `[Finite G]` assumption excludes using that function algebra
as the infinite discrete lattice sheaf. The reviewed audit and pinned
declaration index do not identify any of the seven targets as already built.
No native carrier or generic supplier theory is replanned here.

## Node proofs, closure and granularity

The node assessments below correspond to the packet's `review.checked` list.
All seven retain `implementationStatus: unchecked`.

1. **Global étale descent — verified.** Multiplication by h on B=A[[h]]
   is injective without a domain assumption. The two-term finite-free
   resolution makes derived reduction cofib(h), a finite limit operation
   in the enhanced stable category. It commutes with the Čech limit.
   Complete objects and the augmentation fibre stay complete. After
   reduction, étale base change and faithful-flat Amitsur exactness apply
   to each form row. Smooth finite presentation supplies a common finite
   form-degree bound. Derived Nakayama detects the original equivalence;
   the E∞ forgetful functor creates limits and detects equivalences.
   The differential is A-linear, and finite-product covers are handled.
   No rationalization/infinite-totalization exchange is invoked.
2. **Coherent framed descent — verified.** Wagner supplies underlying
   enhanced B-module equivalences. Transport the entire augmented diagram,
   including faces, degeneracies and higher homotopies, through them.
   The exact imported E0 straightening and limit statements supply the
   coherence and universal property. Two choices compare through the global
   diagram; three choices satisfy the coherent cocycle. A pointwise choice
   is not declared naturally canonical. Ordinary connection framing
   independence is not inferred.
3. **Étale sheaf — verified.** The preceding descent theorem and requested
   E2 basis extension produce the complete E∞ sheaf. Smooth separated finite
   presentation gives a finite affine open cover with affine intersections.
   Reduction commutes with section limits in this regular-principal case.
   Reduction of the sheaf and hypercohomology of its sections are correctly
   distinguished. The restriction laws and mapping-space extension property
   make its seven-item API usable without unfolding the construction.
4. **Torus scaling — verified.** The integer-lattice character
   m↦q^(Σa_i m_i) respects convolution, fixes B and has inverse −a.
   The action law is part of this construction's explicit statement.
   Negative powers are powers of a unit. The six API items include
   evaluation, identity, composition, inversion and uniqueness on generators.
   No framed differential calculus is repeated.
5. **Derived modified connections — verified.** For
   F_a(M)=C⊗^L_(C,σ_a)M, the identification
   η_a(c⊗m)=σ_a⁻¹(c)m gives the inverse scalar twist. The balance relation
   1⊗fm=σ_a(f)⊗m makes θ_a:F_a(M)≃M produce positive semilinearity.
   The coherent cocycle is θ_(a+b)=θ_a∘F_a(θ_b). The E5 discrete-action
   limit and requested LP1 pullback/tensor interface supply all higher
   coherence. The eight APIs include strict-action linearization, mapping
   spectra with the conjugation action, and the limit universal property.
   Conservative exact forgetting is not confused with faithfulness on
   homotopy-category morphisms.
6. **Derived quotient comparison — verified.** The affine object is
   corepresented by HC, with the requested enhanced Mod_HC≃D(C) compatibility.
   Each action-nerve level is a coproduct indexed by (Z^d)^n. Right-Kan QCoh
   turns that into a product of categories and the realization into its
   coherent limit. FPQC sheafification preserves QCoh by the general DAG
   theorem. Faces encode the action; degeneracies insert zero. Monoidal
   compatibility is explicit. No infinite-product affine ring, freeness,
   or quasi-compact fpqc atlas assertion replaces the discrete quotient.
7. **Heart and perfect objects — verified.** Each automorphism pullback
   is t-exact, so truncations preserve the coherent action and give the
   componentwise t-structure. The heart is the imported commuting invertible
   positive-semilinear module category and skew-group description. The DAG
   local properties are stable under base change and pass through
   sheafification. Vector bundles mean underlying finite projectives;
   perfect objects mean underlying perfect complexes. No derived-category
   equivalence with the heart or equivariant compactness assertion is made.

At the specified target level, the two target groups are fully represented:
three nodes for descent/sheafification and four for the derived torus
comparison. Their proofs need no new target or definition node. Proof
arguments are not split into auxiliary lemma nodes. No separate API fact is
used as an undeclared mathematical prerequisite: scaling's action law and
the coherent linearization are already part of the full parent statements.

Read the exact earlier HQ.1 global functor, properties, framed comparison,
cocycle, ordinary modified-connection and ordinary descent nodes; the HR.1
Λ-ring node; both E0 supplying nodes; and E5's coherent-group-action node.
Only its discrete-group limit assertion is used, not its unrelated profinite
filtered-colimit discussion. Stage-only references have these precise requests:

| Supplier | Contract and reason it remains a request |
| --- | --- |
| DD.1 | Enhanced regular-principal complete limits/fibres, conservative reduction and complete E∞ forgetful creation. Existing completion nodes do not export this entire coherent contract. |
| DD.2 | Bounded ordinary smooth de Rham Amitsur descent, finite products and separated affine-cover hypercohomology. Existing ordinary differential and complex nodes do not supply that full enhanced descent theorem. |
| E2 | Complete enhanced stable/E∞ sheaf extension from the affine étale basis and finite-cover section limits. Its stated generic descent scope covers the request; unrestricted hyperdescent is not presumed. |
| LP1 | Generic enhanced QCoh of arbitrary discrete-group prestack quotients, HC affine modules, sheafification, monoidal/mapping structure and local t-structure/perfectness. Parameter-specific nodes do not discharge the general contract. |

The ordinary effective fpqc/quotient interface belongs to SF.1, as the
confirmed geomlanglands finding 27 specifies; its verifier explicitly leaves
derived QCoh/Perf out of that transfer. LP1 is the requested enhanced
exporter, using the ordinary input. The LP packet's unaccepted E5 extension
proposal is not treated as an ownership decision. None of these generic
objects is constructed a second time in HQ.1. The checker resolves every
prerequisite and reports no cycle or missing reference. Open requests and
omitted enhanced signatures justify `planned`, rather than `closed`.

## Tests, suggested file, planets and confirmed findings

The three sheaf tests cover identity, disjoint components including the empty
case, and the D(x), D(1−x) cover of Spec Z[x] after reduction. The four scaling
tests cover rank zero, q=1, a negative exponent, and the two-coordinate
pairing (2,−1)·(−1,3)=−5. The four derived tests cover rank zero, unit
generators, higher equivariant cohomology at q=1, and positive scalar twist
at B=Q, q=2. The Laurent group resolution by t−1 gives
Hom(unit,unit[1])=C while Ext¹_C(C,C)=0. For the twist test, the unit sends
1⊗x to 2x, whereas its inverse is x/2 under η. These tests distinguish
plausible incorrect definitions, including a reversal invisible at q=1.

| Suggested-file inventory | Native signatures | Explicit omissions | Total |
| --- | ---: | ---: | ---: |
| Nodes | 1 | 6 | 7 |
| API items, including constructors | 6 | 15 | 21 |
| Tests | 4 | 7 | 11 |

Every API/test name occurs in the reader and suggested file, with matching
mathematical statements. The native subset is the scaling constructor,
five lemma signatures and four examples. All ten use honest placeholder
proofs. The six enhanced nodes, fifteen API entries and seven tests have
their exact mathematical forms in the omission inventory under PROTOCOL
§13. There are no dummy propositions, axioms or weakened substitute
conditions. Compilation validates only the native subset's signatures.

The two new planets are central descent/quotient theorems, named as
mathematical noun phrases. The six-item assembly selection combines them
with four inherited constructions. Its instruction retains the other
inherited nodes as declarations without adding extra display planets.

All three handed confirmed findings agree in packet and reader:

- **RT-AREA-etale/28:** reuse the accepted interim HQ.1 framed-calculus node
  until atomic promotion to the independent QW.6:framings prefix before QW.5,
  with forwarding IDs and both (h) and (p,h) completion hypotheses. PR.6
  keeps the q-PD/site/twisted comparison. No new duplicate calculus node.
- **RT-AREA-etale/29:** import ordinary and modified connections and their
  heart; supply the derived torus comparison here. HQ.4 owns the uncompleted
  framed Habiro ring, γ_i and Koszul construction; HQ.3 owns descent/comparison
  with HQ.4→HQ.3, as accepted RS-10 specifies. HQ.2 retains twisted q-de Rham
  and Nygaard, as PLAN-HABIRO specifies. Other-stage targets are not replanned.
- **RT-AREA-etale/32:** the actual HR.1 Λ-ring declaration supplies the
  arithmetic base structure. Forwarding to QW.1 remains conditional on
  atomic promotion; a draft owner is not used as a current supplier.

## Validation and continuation

Ran `python3 scripts/check_blueprint.py` on the reviewed packet: **zero
errors and zero warnings**, with the installed declaration index. The output
confirms 7 nodes, 21 APIs, 11 tests, 2 planets, 2 baseline declarations,
4 requests, zero gaps, and HQ.1 planned. Actual pinned statements were read
independently of the index.

After checking available memory above the WORKERS threshold, ran
`lean-check` on the suggested file in the existing pinned Mathlib build.
It exits successfully with exactly **ten warnings, all uses of `sorry`**,
and no errors. No Tau Ceti imports are used by the executable portion.
No library build, cache fetch or language server was started.
`git diff --check` is clean. Only this job's four authorized deliverables
and its handoff are changed.

This review has no unfinished review work. Mathematical continuation remains
the four supplier contracts: replace stage pointers with exact accepted
declaration IDs when supplied, then assemble with the earlier accepted HQ.1
packet while preserving its IDs and the six selected planets. The reader
and packet retain every contract and exclusion needed for that continuation.
