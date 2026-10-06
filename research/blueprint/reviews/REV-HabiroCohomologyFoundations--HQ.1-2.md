# Independent review: HabiroCohomologyFoundations--HQ.1-2

**Verdict: needs_changes.** Completed review of issue #6442 by Codex (GPT-6),
session `codex-cX2vY4`, on 2026-10-06. The author was the separate session
`codex-IqxHbS` (#6490). Reviewed input commit
`923cd73df04fe122bda89872f18f2bd8a1928ba4`. This is a completed review, not a
checkpoint.

The packet and suggested file have been corrected. The reader still contains
a reversed semilinearity assertion and an incorrect ownership statement.
[PROTOCOL §8](../PROTOCOL.md) requires the document to agree with the packet
before it goes live. Issue #6442 authorizes the packet, suggested file and
this report; it does not authorize the reader path. The exact remaining
document corrections are listed below. Acceptance must wait for those
corrections and an independent agreement check.

| Inventory | Result |
| --- | --- |
| Nodes | 7 checked: 3 verified, 4 corrected; 0 added or unverifiable |
| Baseline citations | 2 confirmed; 0 removed or replaced |
| Source references | All 12 node citations checked against 6 public sources |
| API items | 15 → 21, adding 6 items |
| Unit tests | 10 → 11; each definition/construction has at least 3 |
| Planets | 2 new; explicit assembly selection gives 6 with inherited planets |
| Coverage | HQ.1 planned; packet complete, not closed |
| Mathematical supplier requests | 4 precise open requests; no new unexplained proof gap |
| Source issues | Empty; no newly identified source error |

Read the packet, suggested file, approximately 6,000-word reader, author
handoff, accepted predecessor, HQ.1/HQ.2 reviewed library audit, stage
description, PLAN-HABIRO §6.5, accepted RS-10 round 2, the three confirmed
red-team findings and their verification, and the actual supplying node or
stage statements. Read the upstream HodgeStructures and AdicSpaces documents
for the required comparison of definitions, API and scope. No atlas,
upstream roadmap, supplier packet or earlier accepted packet was edited.

The public source texts were checked at the editions in the packet:

- [Wagner, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2), Theorem
  A.1, printed p.69, and A.11–A.14 with the theorem's proof, pp.74–76.
  The reduction and framed-object excerpts occur at their stated locators.
  A.1 assumes p-torsion freedom for every prime and a Λ-structure on A;
  perfectly covered bases are an admitted subclass. S and its étale
  extensions need no Adams operations. Finite presentation in the new
  descent theorem is an explicit restriction used for bounded forms.
- [Scholze, arXiv:1606.01796](https://arxiv.org/pdf/1606.01796), Definition
  7.3 and Remark 7.4, printed p.15, and Conjecture 7.5, p.16. The coordinate
  and conjecture excerpts match. This source motivates the imported ordinary
  connections; it proves neither the new discrete torus comparison nor
  independence of ordinary connection categories.
- [Lurie, DAG VIII, November 5, 2011](https://people.math.harvard.edu/~lurie/papers/DAG-VIII.pdf),
  §2.7, especially 2.7.6, 2.7.8, 2.7.10–15. Also read 2.6.14–15 and its
  proof, 2.7.19–24, the monoidal construction before 2.7.27, 2.7.28 and
  2.7.31–33 for the strengthened local-property references. The node excerpts
  match. Added these more precise locators and read sections to the packet.
  Proposition 2.7.18 is scoped to spectral Deligne–Mumford stacks and is
  correctly not substituted for the arbitrary prestack argument.
- [Stacks, derived completion, tag 091N](https://stacks.math.columbia.edu/tag/091N),
  Definition 15.93.4 and the following limit closure, and Lemma 15.93.20
  with its proof. The principal ideal is finitely generated as required.
- [Stacks, quasi-coherent étale cohomology, tag 03OY](https://stacks.math.columbia.edu/tag/03OY),
  Lemma 59.22.1 and Theorem 59.22.4 with the affine Amitsur and separated
  affine-cover arguments. These support the termwise argument; the bounded
  de Rham complex consequence is explained in the packet, not attributed
  verbatim to Stacks.
- [Stacks, ordinary quotient-groupoid modules, tag 06WT](https://stacks.math.columbia.edu/tag/06WT),
  Proposition 96.14.3 and its cocycle proof. This checks only the ordinary
  heart interpretation. It is not an enhanced derived descent theorem.

The three downloaded PDF SHA-256 values agree exactly with the packet.
Access date is 2026-10-06. No new mathematical error was found in these
passages. The previously recorded Wagner A.1 proof misprint is inherited
source provenance, not a newly discovered issue in this follow-up. The
unpublished V5A4 notes remain unavailable and their numbered assertions are
not treated as verified source statements.

Both baseline entries were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Pinned source and assessment |
| --- | --- |
| `AddMonoidAlgebra` | [Defs.lean, lines 59–69](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean#L59): native finitely supported coefficient carrier, with convolution from the imported Basic module. CommRing B and the lattice meet its weaker semiring/additive-monoid hypotheses. |
| `AlgEquiv` | [Equiv.lean, lines 28–35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Equiv.lean#L28): native invertible ring map commuting with coefficients, exactly the proposed scaling's target. |

The reviewed audit does not already provide any of the seven new targets.
Read `DerivedCategory` and `SheafOfModules.QuasicoherentData` /
`IsQuasicoherent` at the same pin: ordinary localization and a local sheaf
presentation predicate do not supply these enhanced limits. Read
`TauCeti.ConstantGroup.functionAlgEquiv` at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: it requires `[Finite G]` and
cannot replace the infinite discrete lattice sheaf. The pinned declaration
index search supports the disclosed missing enhanced interfaces. Native
carriers are reused and no generic completion, sheaf or quotient theory is
planned a second time.

The seven node assessments, at the requested **target level**, are:

1. **Global étale descent — verified.** h is regular in A[[h]] without a
   domain hypothesis. Its two-term finite free resolution identifies derived
   reduction with cofib(h). In the enhanced stable module category this is a
   finite limit operation, so it commutes with the Čech limit. Complete
   objects and the augmentation fibre stay complete; derived Nakayama then
   detects the equivalence. Étale base change identifies each form row with
   an Amitsur complex. Finite presentation gives a common finite number of
   rows, so the bounded double complex argument is valid. The differential
   is only A-linear. Finite products and covering families are handled by
   the same reduction argument. No rationalization is exchanged with an
   infinite totalization.
2. **Coherent framed descent — verified.** All diagram maps and higher
   homotopies are transported through chosen enhanced equivalences. Pointwise
   equivalences alone are not declared canonically natural. The E0
   straightening and limit nodes supply the stated diagram shapes and
   universal properties. Changing two or three choices gives the appropriate
   coherent comparison. No strict coordinate substitution, commutative dg
   model or ordinary connection-category conjecture is smuggled into it.
3. **Étale sheaf — corrected.** The affine-basis descent and finite-cover
   computation follow from the preceding theorem and the E2 request. Clarified
   that reduction of the sheaf is the de Rham sheaf complex, whereas reduction
   of its section object is hypercohomology. Added `qOmegaEtale.restrict`
   with identity/composition coherence and `qOmegaEtale.ext` with the
   mapping-space universal property of basis extension.
4. **Torus scaling — verified.** The character of the integer exponent
   lattice and convolution give the stated automorphism, inverse and action
   law. The native AlgEquiv fixes B. Negative integer powers are powers of
   the unit q, and the d=2 calculation gives exponent −5. No complete,
   arithmetic or faithful-action hypothesis is needed.
5. **Derived modified connections — corrected.** This contained the central
   error. With F_a(M)=C⊗_{C,σ_a}M and
   η_a(c⊗m)=σ_a⁻¹(c)m, a C-linear map M→F_a(M) gives inverse
   semilinearity. Corrected the linearization to **θ_a:F_a(M)≃M**, with
   Γ_a(m)=θ_a(1⊗m), θ_a(c⊗m)=cΓ_a(m), and coherent cocycle
   θ_{a+b}=θ_a∘F_a(θ_b). The relation 1⊗fm=σ_a(f)⊗m proves positive
   semilinearity. Added `linearization`, `fromStrict`, `mappingSpectrum`
   and `isLimit` APIs. Morphisms retain the conjugation action on mapping
   spectra; evaluation is not asserted faithful on homotopy-category maps.
   Only E5's arbitrary discrete-group part is imported; its profinite part
   is unused.
6. **Derived quotient — corrected.** Spec C is explicitly the affine functor
   corepresented by HC on connective E∞-rings, with enhanced
   Mod_HC≃D(C) and compatible pullback/tensor requested from LP1. Clarified
   that nerve degeneracies insert the zero label and use identity pullback
   on selected components. The action prestack is a colimit; QCoh converts
   it into the bar limit, and 2.7.14–15 permit fpqc sheafification. Infinite
   coproducts give products of module categories. The proof never calls the
   infinite-group atlas a quasi-compact fpqc cover. q=1 and roots of unity
   retain stabilizers.
7. **Heart and perfect objects — corrected.** Expanded the local-property
   argument and its exact DAG locators. On the prestack, base-change-stable
   properties are determined by the torus module; fpqc locality preserves
   this through sheafification. The t-exact action gives componentwise
   truncations on the limit. Heart mapping spaces are discrete, recovering
   the imported ordinary cocycle/skew-ring description. This does not imply
   an equivalence with the derived category of that heart. Vector bundles
   are underlying finite projectives, perfect complexes are underlying
   perfect objects, and perfectness is not identified with equivariant
   compactness.

No additional lemma node is needed at target level. The four generic requests
are assigned correctly: DD.1 owns completion and conservative regular
reduction, DD.2 owns ordinary smooth de Rham descent, E2 owns enhanced
affine-basis extension, and LP1 owns the enhanced affine/prestack quotient
interface and local properties. Read those supplier stages and existing
packets; no existing finer node supplies the entire requested interface.
The exact E0/E5 imports and accepted earlier HQ.1 definitions were read.
Their planning status is not a claim of implementation. Strengthened the
LP1 request to include HC and the local-property locators. Requests prevent
closed status but do not invalidate the specialized conditional proof plan.

The new `positiveScalarTwist` test uses B=Q, q=2, d=1. On the unit,
θ_1(1⊗x)=2x, while η_1(θ_1⁻¹(x))=x/2. This detects the reversal that
q=1 tests miss. The existing higher-cohomology test detects discarded
equivariance: Hom(unit,unit[1])=C although Ext¹_C(C,C)=0, computed by the
two-term Laurent group-ring resolution. Sheaf tests cover identity, disjoint
and nontrivial principal covers; scaling tests cover rank zero, q=1,
negative exponents and independent coordinates. There are 3, 4 and 4 tests
for the three definition/construction nodes.

The suggested file's omission inventory now matches all 21 API items and
11 tests. Six enhanced node signatures, 12 non-constructor enhanced API
items and 7 enhanced tests remain unstatable at the baseline and are named
with their full mathematical forms. They have no dummy Prop replacement.
The one native scaling constructor, its five lemmas and four examples
elaborate; all ten proofs remain honest `sorry` placeholders.

The confirmed findings were checked against both packet and reader:

- **RT-AREA-etale/28:** correct. The existing HQ.1 framing input is retained
  until an atomic transfer to an independent QW.6 framing prefix before
  QW.5. Its I=(h)/(p,h) complete lifting and division hypotheses are stated.
  PR.6 keeps q-PD envelopes, the site and twisted prismatic comparison.
- **RT-AREA-etale/29:** corrected in the packet. Ordinary connections and
  their heart are imported, and this follow-up supplies coherent derived
  torus descent. HQ.4 retains the uncompleted Habiro ring/Koszul construction
  and HQ.3 its descent and comparison. **HQ.2 retains twisted q-de Rham
  constructions and Nygaard applications**, as PLAN-HABIRO §6.5, the
  verifier's corrected finding and accepted RS-10's HQ.2 entry say. The
  reader's attribution of those applications to HQ.3 needs correction.
- **RT-AREA-etale/32:** correct. The explicit HR.1 Λ-ring declaration edge
  supplies the coefficient structure now, with atomic forwarding to QW.1
  only upon promotion. No second Λ-ring carrier or draft-only current
  supplier is introduced.

For the orchestrator, the revision must include
[the reader](../readmes/HabiroCohomologyFoundations--HQ.1-2.md) in its
authorized deliverables. The required work is precise:

1. In §5's statement, proof step 2 and first acceptance item, replace the
   positive-semilinear M→F_a(M) assertion with the corrected F_a(M)→M
   orientation, formulas and cocycle above. Add proof step 6, the four API
   items and the q=2 test from the corrected packet.
2. In the RT-AREA-etale/29 paragraph, retain HQ.4→HQ.3 for framed Habiro
   descent/comparison and explicitly keep twisted q-de Rham/Nygaard
   constructions and applications at HQ.2.
3. Synchronize §3's sheaf-versus-section reduction, its two API additions,
   §6's HC convention and degeneracies, §7's local-property proof/locators,
   the LP1 request and all inventory counts with the packet. Preserve the
   six-planet assembly selection and four disclosed requests.
4. Independently check reader/packet/suggested agreement before changing
   the review verdict. This report does not authorize promotion.

Validation: `python3 scripts/check_blueprint.py` reports **0 errors and
0 warnings**, using the available pinned declaration index. `lean-check`
completed successfully against pinned Mathlib with **only the 10 expected
`sorry` warnings**. Available memory exceeded 20 GB before the check. The
shared Tau Ceti checkout is newer than its audit pin, but this file imports
only pinned Mathlib modules. Compilation makes no assertion about the
omitted enhanced signatures. `git diff --check` passes. No library build,
cache download, Lean language server or background process was left running.
