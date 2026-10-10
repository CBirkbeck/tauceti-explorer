# Independent review of R03.2

Issue #6273; job `REV-DeformationAndDerivedPatchingAlgebra--R03.2`.
Reviewer: Codex, session `codex-Zdkxyy`, 2026-10-10. The original planning
session was `codex-qzhMNk`; I did not write its deliverables.

**Verdict: accepted after corrections.** All ten nodes are justified at target
level. The packet is a complete planning pass, and R03.2 remains **planned**,
with an explicit supplier gap and ownership reconciliation in its remaining
work. Acceptance does not close the stage or assert an implementation.
`detail.json` and the current WORKERS.md select target level, superseding the
generated issue's older lemma-level instruction.

| Final count | Value |
| --- | ---: |
| Nodes | 10: 2 comparisons, 6 constructions, 1 definition, 1 theorem |
| Node verdicts | 6 corrected, 4 verified |
| Nodes added or removed | 0 |
| API items | 47, up from 42 |
| Discriminating unit tests | 26, up from 25 |
| Planets | 6, unchanged |
| Confirmed pinned baseline declarations | 16, up from 11 |
| Source issues | 4, all confirmed; one existing R03.1 finding added here |
| Gaps / requests | 1 / 4 |

## Corrections made

1. **Coefficient comparison:** added the missing complete-coefficient category
   equivalence to the packet's declarations and Suggested. The complete
   augmentation boundary carries Noetherianity and actual maximal-ideal adic
   completeness; it does not require Artinianity. Both classical category
   structures now expose augmentation-preserving algebra maps, identities and
   composition. Previously the Artinian category instance's placeholder also
   hid its morphism type. These are supplier-interface comparisons, not new
   coefficient-category targets.
2. **Smoothness citation:** added Stacks Lemma 8.6, tag 06HL, pp. 21–22, which
   directly supplies the represented ring/power-series criterion. Listed the
   already prototyped `smooth_prorep_series_iff` declaration.
3. **Obstruction-source precision:** corrected the source matches for the
   presentation obstruction and relation bound. Stacks Definition 98.22.1
   allows general obstruction functors on kernel modules. It does not by
   itself supply one finite vector space tensored with every socle kernel.
   Example 98.22.4 evaluates relations modulo changes of variable lifts. This
   packet proves its completed, minimal-presentation specialization and
   explicitly requests the stronger general SF.4 interface.
4. **Relation-bound citation:** distinguished Gee's Lemma 3.13, p. 13, which
   bounds relations, from Proposition 3.24(2), p. 18, which gives the tangent
   variable count. Added the existing `relation_bound_generators` signature
   to the packet's declaration list.
5. **Hull automorphism:** added four API items and their Lean signatures for
   substitution by X+X², its value on X, its residue-preserving coefficient
   map, and invariance of the orbit map under precomposition. Added a test
   that this automorphism differs from the identity over every field. The
   original statement and acceptance criteria already required this example;
   its automorphism was absent from Suggested.
6. **Library reuse:** added five direct pinned maximal-pro-p citations to the
   continuous framed node and its proof sketch. Narrowed the existing
   ProfiniteProPGroups Layer 3 request to generating-set calculus. Kernel
   construction, closedness, invariance and factorization are already in the
   pinned library and are not requested as new work. Added the existing
   `continuousFramed_proP_represents` signature to the API, separating its
   representing conclusion from the kernel-killing statement.
7. Added the required independent verdict to each original source issue.
   Also recorded the Stacks 06SC exact-generator proof error already
   confirmed in R03.1, reusing its canonical E5 identifier and pointing to
   that packet. The corrected congruence proof is the input used here.
8. Added the top-level review with an individual verdict and explanation
   for each node.

No baseline citation was removed: all eleven original citations are valid.
No source excerpt was introduced. The reader document is outside this review
issue's deliverables and was not edited; its mathematical statements agree
with these refinements. Assembly should synchronize its API and count listings
with the corrected packet.

## Mathematical and dependency checks

The coefficient comparisons preserve the specified residue label, actual
Artinian pullbacks and quotient towers. The represented tangent is the dual of
the **relative** cotangent m_R/(m_R²+m_ΛR). In particular the base Λ has zero
relative tangent even in mixed characteristic. SF.4 supplies the Schlessinger
criterion and the formal-element/hull distinction. The surjectivity of Λ→k
makes Der_Λ(k,k) zero, so the additional derivation condition in the general
Stacks criterion is automatic here. A hull provides existence of compatible
isomorphisms; prorepresenting pairs provide uniqueness.

Lifting a relative cotangent basis gives the minimal presentation. Its correct
kernel condition is J⊆m_S²+m_ΛS. It is not J⊆m_S²: over a DVR the residue ring
has no relative variables but still has the uniformizer relation. The matrix
construction evaluates words in the native free group and quotients by their
matrix-entry relations. Noetherianity permits an infinite relation set. The
empty-relation, zero-generator and characteristic-dependent involution tests
distinguish this from a quotient imposed without the intended equations.

The relation space is the actual module quotient E=J/m_SJ, with its residue
field action descended through S→k. Nakayama lifts a basis to ideal generators.
It is not J/J² and is not intrinsic to a nonminimal presentation. In a socle
extension, evaluating a minimal relation gives a map E→I. A change of variable
lift contributes an element of I multiplied by a maximal-ideal or base
maximal-ideal factor, hence contributes zero. This also handles mixed
characteristic. Vanishing is exactly factorization through R, and transporting
lifts proves naturality. Finite duality then gives E*⊗I.

Artin–Rees gives N with J∩m_S^N⊆m_SJ. Consequently the quotient extension
S/(m_SJ+m_S^N)→S/(J+m_S^N) is Artinian and has socle kernel canonically E. Its
relation-evaluation obstruction is the identity of E. Quotienting its kernel
by ker λ for a nonzero λ:E→k produces a principal small extension with a
nonliftable represented point. This avoids evaluating an Artinian-only
functor on S/m_SJ, which need not be Artinian. Pulling a complete obstruction
theory back along a smooth hull preserves completeness. Contracting its
universal obstruction ω∈O⊗E gives E*→O; naturality and the nonliftable quotient
points prove injectivity. The dimension and generator bounds follow. This
argument requires the recorded full tensor/naturality hypothesis; a
zero/nonzero detector for principal extensions does not prove it.

For the orbit example, principal units act trivially on dual-number tangent
vectors. Smoothness follows by lifting a representative and a correcting
principal unit. In the genuine self-pullback over k[t]/t², the two components
of a principal unit have equal first-order coefficients. They cannot change
(t,t) into (t,t+t²), although the component orbits agree. This proves failure
of H4 in every characteristic. The substitution automorphism fixes each
orbit because x+x²=(1+x)x; its degree-two coefficient proves it is nonidentity.

Continuous framed representability uses the free **profinite** group and all
elements of its closed kernel. Finite-word equations alone do not discharge
this target. Finite k makes the positive Artinian coefficient quotients and
their matrix groups finite; compatibility and the coefficient inverse limit
produce the universal continuous representation. For the extended result,
the Artinian matrix congruence kernel is a finite p-group by its maximal-ideal
filtration. Native maximal-pro-p factorization kills the indicated subgroup
in every lift. Invariance under conjugation and closedness permit the ambient
quotient. Finite generation of its open pro-p kernel and its finite residual
quotient gives a finite generating tuple, to which the direct construction
applies. Arithmetic Φ_p verification and Galois cohomology stay with the
Galois deformation owners.

Every direct R03.1 prerequisite was read in its accepted packet, including the
small-extension factorization, actual pullback, complete quotient, positive
truncation, quotient limit, relative cotangent, series evaluation/presentation
and formal smoothness results. The five cited SF.4 nodes were also read.
SF.4's current packet review is `needs_changes`, not accepted; its classical
category, functor, hull and criterion statements support the comparisons, but
its principal-only obstruction interface and detector prototype do not
provide the stronger relation-bound input. The explicit request and gap
correctly preserve that distinction.

The campaign's R03.2 targets are all covered: criterion transport and tangent
finiteness; supplied ring pullbacks; hulls, formal elements and compatible
uniqueness; the framed construction; and presentation relations versus
obstructions. Prerequisite chains end in confirmed libraries, exact supplier
nodes, existing upstream stage requests or the recorded gap. No upward
arithmetic dependency or duplicate Schlessinger theorem was introduced.

## Sources and pinned baseline

The packet preserves URLs, access date 2026-10-10 and hashes for the five PDFs;
the downloaded hashes agree with the register. All source text used in this
review is public. The locators were checked against printed page numbers:

- [Schlessinger's published scan](https://math.uchicago.edu/~amathew/schlessingerdef.pdf):
  §1 pp. 208–210; Proposition 2.5 and tangent/hull definitions pp. 211–212;
  Proposition 2.9, Remark and Lemma 2.10, and Theorem 2.11 pp. 211–215;
  Remark 2.15 pp. 213–214. Both Remark 2.10 and Lemma 2.10 really occur on
  printed p. 212; the repeated numbering was preserved.
- [Stacks Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf),
  version ed88ff78, compiled 14 July 2026: §§3–4 pp. 4–13 and §7 pp. 15–20;
  the smoothness locators in §§8–9 pp. 20–25; Lemma 12.2 p. 35;
  Theorem 15.5 and Remark 15.6 pp. 46–47; Theorem 18.2 p. 55.
- Stacks [Definition 98.22.1, 07YG](https://stacks.math.columbia.edu/tag/07YG)
  and [Example 98.22.4, 07YI](https://stacks.math.columbia.edu/tag/07YI):
  general obstruction-functor and relation-evaluation interfaces. The source
  matches now distinguish them from the packet's finite tensor specialization.
- [Kisin's Lecture 1](https://people.math.harvard.edu/~kisin/notes/notes.pdf),
  pp. 1–4: Proposition (1.2.1)(1) and proof p. 2, Remark (1.1.2)(1) p. 1,
  and Exercise 1 p. 4. Its arithmetic setting motivates the generic
  construction; the packet states and proves its different coefficient-base
  and closed-relator hypotheses explicitly.
- [Gee, arXiv:2202.05818v2](https://arxiv.org/pdf/2202.05818v2):
  §3, particularly Lemma 3.13 p. 13 and Proposition 3.24(2) p. 18.
- [Khare–Wintenberger II, author final copy](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf),
  30 May 2009: Lemma 4.4 pp. 41–42 and Lemma 4.6 with its proof pp. 43–45.
  The packet independently supplies the finite Artinian test extension and
  abstract contraction argument; it does not transfer an arithmetic pairing
  to an arbitrary functor.

Source issues E1–E3 are confirmed. E1 omits the all-open-subgroup quantifier
that Kisin's Exercise 1 supplies; the odd-p inversion semidirect-product
counterexample is valid. E2 gives each matrix-entry index n² values instead
of n; the displayed matrix has n² entries in total. E3 references item 2.6
where Proposition 2.5(ii),(iii) supplies the smoothness rules. E2 and E3 were
also checked visually in the PDFs. These confirmations add no assertion about
an erratum beyond the packet's existing version and search records.

E5 records the proof error in Stacks Lemma 4.5, tag 06SC, p. 11: relative
cotangent representatives do not necessarily generate m_S. For Λ=S=Z_p
the list is empty but p is nonzero. Congruence modulo m_ΛS+m_S² suffices,
since derivations kill this denominator. This is the same finding already
confirmed in R03.1, not a new distinct erratum. It remains in the current
online proof; R03.1 supplies the corrected argument used by this packet.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read the declarations
and enclosing binders for `FreeGroup`, `FreeGroup.lift`,
`Ideal.exists_pow_inf_eq_pow_smul`, `Matrix.GeneralLinearGroup` and its `map`,
`MvPowerSeries` and `MvPowerSeries.X`,
`Submodule.exists_injOn_mkQ_image_span_eq_of_span_eq_map_mkQ_of_le_jacobson_bot`,
`Submodule.hasQuotient`, and `TensorProduct`. Their carrier conventions and
hypotheses provide the claimed word evaluation, Artin–Rees, matrices, series,
Nakayama, quotient and tensor inputs.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, the dual-number
equivalence supplies derivations at the specified algebra-tower point; the
residue map installs that point here. In `Profinite/MaximalProP.lean`,
`proPKernel`, `isClosed_proPKernel`, `map_proPKernel_eq`, `proPKernel_le_ker`
and `existsUnique_continuousMonoidHom_maximalProPQuotient` provide exactly the
kernel and continuous factorization inputs. The dual-number and maximal-pro-p
source files were compared byte for byte with their pinned GitHub raw files.
All sixteen final baseline citations are confirmed.

The reviewed library audit was checked for R03.2 and its overlaps. Current
TauCetiRoadmap was inspected read-only at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the relevant
ProfiniteProPGroups contract and Layers 0, 3 and 4, and the nearby
AlgebraicVectorBundles and AdicSpaces documents, and inspected ModularCurves'
deformation-test-algebra boundary. A search of current Suggested files,
including the nine roadmaps absent from the atlas snapshot, and the current
library found no existing generic target that this packet replans. The
current free-profinite API belongs to its upstream group owner and is
imported. No commands built or changed those trees.

Mathlib PR 37940 remains open at its recorded head
`6fa3d6e048f5dbcbab6648d673f0520eae6e2e06`; its LocExtCat and BaseCat boundaries
agree with the packet's design note, including the zero-kernel allowance in
`IsSmallExtension`. It remains a design lead, not a pinned theorem. The FLT
discussion likewise remains a lead for arithmetic consumers.

## Validation and handoff

`python3 scripts/check_blueprint.py` on the corrected packet reports
**0 errors and 0 warnings**. Every packet API and listed declaration has a
named signature in Suggested; all 26 test names label concrete examples.
Every definition/construction has at least three discriminating tests.
The six planets name mathematical objects or central results and require no
changes.

The final Suggested file elaborated using `lean-check` at the recorded pins:
**exit 0, 134 warnings, all declaration-uses-sorry warnings, no other
diagnostics**. Available memory exceeded 100 GB before elaboration. These
are signature and example statements with admitted proofs, not implemented
or executable proof tests. No library build, dependency update, cache fetch
or language server was used.

The orchestrator should supply and independently verify SF.4's full finite
socle-extension tensor interface, then replace this request by exact node
citations. Keep the current upstream group imports, using the five pinned
kernel declarations directly. Point R04.2's generic universal-lifting-ring
target at R03.2/continuous-framed-representability; R04.2 and R08.1 retain
their arithmetic specializations. Synchronize the reader's API/count listings
at assembly. No additional mathematical correction is left unresolved in the
reviewed packet.
