# BP-HabiroRings--HR.4 handoff

Issue #6500. Codex, session `codex-IS3oVl`, 6 October 2026. The bot confirmed
this session’s claim before work began. This is a completed target-level
planning pass, not a checkpoint. Only the issue’s packet, reader, suggested
file and this handoff are submitted.

## Result

The packet has status `complete`; its sole stage `HabiroRings:HR.4` has
coverage `planned`, not `closed`. It imports all twelve accepted parent HR.4
nodes without editing or duplicating them. Seven supporting nodes are added:
one definition, one construction, three theorems and two lemmas. They carry
24 API items, seven definition/construction tests, two planets, 19 checked
baseline declarations, four requests and two gaps. The reader has approximately
3,300 words. Every implementation status is `unchecked`.

The graph packages marked étale algebra objects, proves object existence
across an arbitrary quotient, supplies nilpotent marked rigidity, constructs
the ordinary completed lift and its natural map equivalence, states the
regular principal derived universal property, and refines the coherent ghost
comparison needed by Theorem 2.9. Existing complete-target map existence and
separated-target uniqueness are baseline imports, not duplicate targets.
The two new planets plus the parent’s four give six in the combined layer.

The parent’s three HR.4 gaps are accounted for separately. Accepted HR.1
supplies the Λ/big-Witt-coalgebra/Wilkerson interface. This seven-node graph
plans completed étale deformation conditional on precise generic suppliers.
The ordinary big-Witt étale/Frobenius-pushout input is retained as an explicit
QW.0 obligation. The supplier refinements and absence of enhanced/coefficient
Lean carriers prevent closed coverage; this is not a claim that the source’s
compressed deformation argument has been formalized.

## Where follow-up work resumes

1. Match or supply QW.0’s ordinary big-Witt étale and Frobenius-pushout theorem
   for every étale map, including the filtered finite-type descent removing
   F-finiteness. Remark 2.49 is a proof sketch importing literature results,
   not a completed library proof. Do not reconstruct this theory in HR.4.
2. Discharge the DD.1 request for generic derived completion, reduction
   invariance and Nakayama, with the regular principal and regular
   two-generator `(p, Φ_d)` ordinary-tower comparisons. The principal proof
   uses surjectivity only for its f-power tower. General completion
   t-exactness and divisor-transition surjectivity are not hypotheses.
3. Supply the proposed E1/E5:abstract refinements: actual static-ring
   embedding with discrete mapping spaces, enhanced fibre/Milnor APIs,
   commutative algebra objects, complete-base actions and compatibility with
   HR.3’s completed section mapping spaces. HR.3’s existing generic supplier
   gaps remain inherited. The packet’s four requests name exact statements
   and consuming nodes; foundational theory stays with those owners.
4. Instantiate the two enhanced mathematical omissions in the suggested file:
   `complete_principal_deformation_universality` and
   `cyclotomic_ghost_lift_coherence`. Their carriers must be the actual supplier
   types. Do not introduce opaque stand-ins or arbitrary proposition fields.
   All ordinary deformation/completion APIs and seven example signatures
   already elaborate against pinned Mathlib.
5. Assemble this supplement with the parent and accepted HR.1/HR.3 follow-ups.
   Preserve unrelated parent gaps and source-issue verdicts. The global
   staticity proof uses underlying-module cyclotomic cofibre reduction, which
   commutes with limits in the stable category, and HR.2 detection. It avoids
   assuming that a general completion reflector preserves arbitrary limits.

## RT-AREA-etale/27 and ownership

The issue repeats the older finding that RS-10 was awaiting revision and
proposes several reversed HQ/QW arrows. The actual accepted decision is
`RS-10.result.json`, accepted by `independent-review-REV-RS-10~2`; the parent’s
`FIX-RT-AREA-etale~2` review also confirms interim ownership. The packet and
reader follow that decision. HR.1/HR.4 are interim suppliers until atomic
QWittVectors installation; the draft QW roadmap has no packet and is not yet
installed. Existing exact parent nodes are used as current prerequisites.
The future QW.2–QW.4 supplier contracts are under `ownership.supplierContracts`,
not duplicate current proof requests. QW.0 remains requested because the
parent’s ordinary étale theorem is still unexpanded.

On installation, big Witt/Λ interfaces belong to QW.0/QW.1 and degree-zero
absolute/relative q-Witt theory and étale pushouts to QW.2–QW.4. HR.4 keeps
E_d, H_m, Theorem 2.9, staticity, reductions, transitions and naturality.
Current HR.4→HQ.4, HQ.4→HQ.3 and CR.4→HQ.4 directions are retained. No atlas,
parent packet or supplier file is edited by this job.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroRings--HR.4.json`:
  zero errors and zero warnings, using the configured pinned declaration index.
- `lean-check research/blueprint/suggested/HabiroRings--HR.4.lean`: exit 0,
  exactly 33 expected `sorry` warnings and no errors. This checks genuine
  ordinary algebra/completion carriers, all 24 API items, the object-lifting
  and nilpotent-rigidity signatures, and seven example signatures. The
  completion hom-equivalence API is promoted to its own lemma node. Compilation
  proves none of them and does not check the two enhanced comments.
- The shared Mathlib build is exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Shared Tau Ceti HEAD differs from
  the recorded pin, so no Tau Ceti declaration is imported for compilation.
  Tau Ceti source was inspected at the exact pin
  `f790474821cf4256814db967cb154e7af3d0c369` with commit-specific reads.
  Available memory exceeded 100 GB before this single compile. No language
  server, build, cache download or background compiler was started.
- The reachable node graph has 54 nodes and is acyclic. None of the four
  requested suppliers is reachable from HR.4 in the combined atlas/packet
  stage-consumer graph, so their supplier arrows introduce no stage cycle.
  All imported ids resolve; new node ids and the three new source-issue ids
  are disjoint from existing packets.
- API, unit-test and proposed-node names are aligned with the suggested file.
  The split test distinguishes its marked swap from identity; the localization
  test admits an étale algebra that is not a finite module; the power-series
  completion test admits coefficients with no common denominator bound.
- File intake validation, source-issue schema validation, JSON validation and
  whitespace validation were run before submission.

## Sources and limits of reading

The binding blueprint/expansion protocols, WORKERS, upstream guide, browser
instructions, complete issue and confirmed claim were read. The reviewed
AUDIT-17 HR.4 audit, stage description, parent nodes/reviews, accepted HR.1/2/3
follow-ups, draft QW contracts and accepted RS-10 were examined. For upstream
style, AdicSpaces and Multiquadratic were read in full. The public Zulip
getting-started view exposed only a login/shell; the repository mirror of
upstream guidance was read. No restricted-message inspection is claimed.

Current Mathlib work was checked. Open PR #41086, head
`a010cae47a32f30dafa2e9d241e4befab9e512a5`, concerns
HenselianLocalRing/residue-field lifting, not the arbitrary quotient-object
or complete marked deformation required here. It is not cited as baseline.
The nineteen cited Mathlib declarations were read at the pin, including
relative-dimension-zero presentations, formal lifting/uniqueness, finite-ideal
completion and smooth flatness. Pinned Tau Ceti searches supplied no missing
object-deformation or big/q-Witt interface.

Public source versions, accessed 6 October 2026:

- Wagner, [q-Hodge complexes over the Habiro ring, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2):
  printed pp.13–17, including Lemma 2.2, the full Corollary 2.4 proof,
  construction 2.7, Theorem 2.9 and its full proof, and Remark 2.10.
  SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.
- Wagner, [q-Witt vectors and q-Hodge complexes, arXiv:2410.23078v5](https://arxiv.org/pdf/2410.23078v5):
  §2.6, printed pp.33–35, statements and proofs of 2.48–2.52. The earlier
  coefficient sections are imported through reviewed extraction, not newly
  re-extracted. SHA-256
  `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01`.
- [Author q-Witt copy](https://ferdinand-wagner.github.io/papers/q-Witt.pdf),
  dated 14 January 2026: collation of the relevant §2.6 passages only.
  SHA-256 `6b8cb470137f83bb65e94c0e001e7bd9a458eb31af58a12da097e4f5fde10049`.
  No version of record was identified; findings are scoped to the read
  preprint and author copy.
- Stacks [04D1](https://stacks.math.columbia.edu/tag/04D1), Lemma 10.143.10:
  entire object-lifting statement and Jacobian proof. Live HTML SHA-256
  `11a0a6e46f55de460fce17a06dc9202700ba0c0cf36583839f4cc0993f37a85a`.
- Stacks [0ALI](https://stacks.math.columbia.edu/tag/0ALI), Lemma 15.11.2:
  entire statement and proof; the nilpotent category-equivalence specialization
  is used, not the additional henselian conclusion. Live HTML SHA-256
  `77f4af37f94371d067830836f2d56c59f8c87104c013130ed8ecb0b4e484f588`.

Parent source issues E2/E3/E12 are imported, with verdicts left in the parent.
Three new findings await independent review: E15 corrects the q-Witt name
and the Frobenius-module level in Lemma 2.50’s proof; E16 corrects the ordinary
Witt name and lower row of Remark 2.49’s Frobenius square; E17 makes the
Corollary 2.51 cokernel use proper divisors. For E15, at m=3 the qW_3(ℤ)
additive rank is three while W_3(ℤ) has rank two. For E17, m=1 gives a zero
printed cokernel because V_1=id, while the actual ghost is the identity of ℤ.
These findings were checked against the current author copy and arXiv history;
no correction was found on the author page or by public erratum searches.
No self-review verdict is assigned.

Source downloads, notes and compiler logs were scratch artifacts. Everything
needed for review or a following worker is recorded here and in the packet;
the scratch directory is deleted after submission checks. There is no need to
restore it or copy the repository.
