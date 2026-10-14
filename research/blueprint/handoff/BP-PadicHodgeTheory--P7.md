# BP-PadicHodgeTheory--P7 — completed planning pass

Agent: Codex, session codex-gqQ5AR, 14 October 2026. Refs #968.

This is a **complete target-level planning pass at the 300-node budget**, not a
checkpoint, accepted review or closed roadmap. The packet awaits an independent
review. All 242 previous node ids are preserved, 58 targets are added, and every
node retains implementationStatus unchecked. The part remains P7, covering the
eight stages in the issue; R06.5 and R06.6 belong to the other part.

## Deliverables and counts

- Packet: `research/blueprint/packets/PadicHodgeTheory--P7.json`.
- Reader: `research/blueprint/readmes/PadicHodgeTheory--P7.md`, containing every
  target, hypothesis, proof route, prerequisite, source locator, API item, test,
  use and acceptance check, together with the gaps and supplier contracts.
- Companion: `research/blueprint/suggested/PadicHodgeTheory--P7.lean`, 152 lines.
  The reader carries the full mathematics; the companion has two light,
  real-bodied coefficient formulas and statements on genuine pinned carriers.

| Kind | Count |
| --- | ---: |
| definition | 43 |
| construction | 49 |
| lemma | 74 |
| theorem | 128 |
| comparison | 4 |
| application | 2 |

There are **641 API items, 372 proposed unit tests, 44 planets, 75 baseline
references, 24 gaps, 48 supplier requests, 20 ownership/stage proposals, 43 source
issues and 40 source records**. The tests in the reader are specifications for
future formalization, not 372 implemented tests.

| Stage | Targets | Coverage |
| --- | ---: | --- |
| R06.1 | 47 | planned |
| P7:annulus-foundations | 27 | planned |
| P8:local-rational | 57 | planned |
| R06.2 | 56 | planned |
| P7 | 37 | partial |
| R06.3 | 25 | planned |
| R06.4 | 11 | planned |
| P8 | 40 | partial |

No stage is closed. Planned means that its targets have nodes with prerequisite
chains or recorded gaps; it does not mean its proofs or supplier requests are
settled. P7 still needs complete Wach–Breuil–Kisin and normalized
Herr–Iwasawa comparison targets. P8 still needs the full non-étale cohomological
comparison/descent and the logarithmic boundary comparison described in coverage.

## Baselines, existing roadmaps and Lean

The pins remain Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and
Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. AUDIT-37 and the recorded
baseline statements were checked before extending the packet. All 73 inherited
baseline statements were reread at the pins. Two existing algebraic normalized
trace declarations, `Algebra.normalizedTrace` and
`Algebra.normalizedTrace_trans`, are now explicit prerequisites, bringing the
count to 75. Tate's analytic estimates extend that algebraic input; they do not
replan the algebraic normalized trace.

The current read-only TauCetiRoadmap and current Tau Ceti library were checked
separately from the pinned build. The nine roadmaps newer than the atlas
snapshot were considered. AdicSpaces and LocalGaloisGroups were read as the two
nearby models. In particular the continuous cyclotomic character and the Artin
normalization already planned in LocalGaloisGroups are imports. No changes to
those roadmaps, their links, the atlas or another worker's packet are included.

`lean-check research/blueprint/suggested/PadicHodgeTheory--P7.lean` **passed** at
the pins: exit code 0, **16 warnings, all declaration uses sorry**, no other
warnings. Memory was checked before the run. No build, update, cache download or
language server was started.

The old 4,213-line companion contained fake carriers and sorry-bodied data and
instances. It has been replaced in the shape required by the current WORKERS.md:

- `laurentConvergesOn` and `gaussNorm` have real formula bodies on Z-indexed
  coefficient families. Convolution uses Mathlib's actual discrete convolution.
- The radius-one compatibility statement uses Tau Ceti's existing
  `twoSidedRestrictedSubmodule`; six examples distinguish finite support,
  geometric-series convergence and Gauss norms from point evaluation.
- Completeness, nonunit and Frobenius statements use Mathlib's actual
  `PadicComplexInt`. The DVR/theta milestones use `BDeRhamPlus` itself.
- Required completeness/nonunit instances are hypotheses where used. Missing
  Galois representations, analytic rings, sheaf categories, filtered modules and
  comparisons remain fully specified reader targets. No missing carrier or
  action is implemented by sorry, and there is no Lean code in the packet.

Elaboration establishes only that these statements are well typed. It proves
none of the planned mathematics.

## Main mathematical changes

**Rational ring ownership.**
`R06.1/bdr-plus-of-perfectoid-affinoid-algebras` imports integral theta and its
principal nonzerodivisor kernel from PerfectoidSpaces P1, with the cyclotomic
specialization from AI.0. It owns rational localization/completion, filtration
and graded invertible lines on Mathlib's actual carrier. The geometric complete
DVR is stated for arbitrary complete algebraically closed C/Q_p. General
relative affinoids do not acquire an unspecified Galois action or canonical
Tate trivialization. RF2 owns the relative untilt divisor and descent, importing
this input. Reconcile the proposed R06.1 → RF2:untilts link with pending RS-20;
this job does not apply that family decision.

**Primitive comparison is early.** Twelve targets add nested strict toric
covers, finite-image spectral-sequence propagation, local and global almost
finiteness, mod-p primitive comparison, relative primitive comparison, integral
perfectness, the almost A_inf and B_dR+ lifts, étale/pro-étale comparison,
singular proper comparison and geometric Hodge–Tate pushforwards. The preserved
`P8/affinoid-k-pi-one-for-p-torsion` id now belongs to and realizes the early
local-rational stage. The proof chain uses AI.3, perfectoid almost theory and
site/cohomology infrastructure, with no CP.3, CP.4, AI.4 or AI.5 dependency.

The finite-image rectangle and Frobenius-compatible almost-free limits remain
explicit supplier-contract gaps. Classical Witt and BMS derived-completed
A_inf sheaves are distinguished, including the stronger W(m_C-flat)
annihilator in the BMS formulation. Resolution/descent is requested for the
singular proper extension. Smooth primitive comparison alone does not supply
resolution or the logarithmic compact-support theorem.

**Colmez–Fontaine has an actual proof target.** R06.2 keeps the proposition;
R06.3 adds Berger's filtered-module modification, the slope/filtered-subobject
criterion and `colmez-fontaine-proof-via-robba`. Finite-Q_p consumers list that
proof in addition to the proposition. The proof imports RD.2 and PG.2 and the
P7 period dictionary. Berger's Remark V.2.2 avoids taking de Rham ⇒ potentially
semistable as an antecedent, but its argument still uses analytic monodromy;
that dependence is retained. The node graph has no cycle.

A whole-stage edge R06.3 → R06.2 would create a cycle. The required follow-up is
a split into early filtered definitions and later essential-surjectivity
consumers, with the proof between them. The finite-Q_p proof does not settle
the perfect-residue-field version used over the completed maximal unramified
field. That generality and the fixed-bound reductive-group torsor are gaps.

**Classical and ordinary interfaces.** R06.2 now includes the rank-n regular
ordinary definition, crystalline and maximal-monodromy criteria with their
actual hypotheses, descent, crystalline characters, dual filtered modules,
classical fundamental complexes/B-pairs and reductive-group admissibility.
Regular weights use geometric Artin reciprocity; crystalline characters use
arithmetic Artin reciprocity on all units. An algebraic restriction only on an
open subgroup of units gives potential crystallinity, not crystallinity.
The maximal-monodromy criterion needs consecutive weights; maximal N alone is
insufficient. Fontaine's B_dR block classification includes higher-dimensional
simple Sen blocks, not just scalar rank-one blocks. Its division-algebra
construction remains a precise gap.

R06.4's rank-two statements use D*(V), record coefficient-field restrictions,
and distinguish crystalline unit-root and semistable noncrystalline branches.
All parts of **Khare–Wintenberger II Lemma 3.5(i–iii)** are included: the small
crystalline range over unramified F, the extra Q_p endpoint, weight-two
semistable noncrystalline ordinarity, and the weight-two representation
crystalline over Q_p^nr(mu_p). The BLZ and BCDT integral suppliers are explicit
gaps/requests; the global Skinner–Wiles argument stays in R21.5. R08.5, R08.6
and R21.5 import the local implications.

**Relative objects and consumers.** The P8 additions specify completed de Rham
lattices, associated filtered-connection local systems, relative primitive and
Hodge–Tate comparison, completion descent for horizontal morphisms, de Rham-pair
proper pushforward, relative Witt/overconvergent rings, phi-modules, relative
Fargues–Fontaine bundles, B-pairs, pure loci, analytic-family fibers and their
cohomology. All-module equivalences are kept distinct from étale objects/local
systems. KL's pure-locus theorem is stated for its actual C-tilde coefficient
ring; arbitrary bounded-ring assertions are not inferred. Its local-system
cohomology theorem is not cited as the all-module theorem. The latter uses
8.7.13 and 8.9.6(a) chartwise and still requires derived descent.

Betts–Stix requires completion descent before proper pushforward. Heuer's
coherent-coefficient higher-direct-image statement is pro-étale, not a v-site
claim. The relative Hodge–Tate filtration retains the lissity hypotheses.
Howe–Klevdal's diamond comparison has explicit diamond suppliers. Disegni–Liu's
completed Breuil/Tsuji rings and edge comparison are targets with their missing
presentation proof recorded. The unresolved open factorization in Remark B.15
is not asserted as a theorem.

## Source reading and discrepancies

Sources were read to the extent needed for these target statements and proof
routes; this is not a claim to have reconstructed every imported proof.
The new records give exact copy/version hashes and locators. Public copies
were used for the newly routed papers; cleared library papers were read in
place. No library file or passage was copied. No source excerpt or verbatim
quotation remains in the packet or reader. All source-issue descriptions,
including the inherited ones, are paraphrases.

This pass checked the relevant primitive proof and integral lift in Scholze
and BMS; KL I's relative objects, equivalences and cohomology, including the
8.7.13/8.9.6 chart inputs; Berger's finite-Q_p Colmez–Fontaine route; the cited
classical filtered-object sections of Colmez–Niziol; Qian, BLGHT and BIP's
ordinary/character statements; KW II Lemma 3.5; Ding and Fontaine's B-pair/B_dR
interfaces; and the routed statements of Disegni–Liu, Gleason–Lim–Xu,
Betts–Stix, Caraiani–Scholze, Heuer, Howe–Klevdal, Zavyalov, Fargues–Fontaine,
BCGP and CDN. Pan and Dospinescu–Le Bras's differential-module consumers were
checked against the preserved P7/R06.3 dictionary. Their results beyond the
present scope are not newly planned here.

Inherited source readings retain their earlier dates; a record dated this run
identifies the portions newly checked. Unread proof dependencies remain gaps,
including Brinon's memoir, Fontaine's Barsotti–Tate construction, the precise
transcendence input, full Herr/Liu duality normalization, the simple-Sen division
algebra construction, the labelled crystalline-character classification and
the general fixed-bound torsor theorem. The DOR book is not cleared by the
maintainer's library index and was not obtained from another copy.

Four findings were added, subject to independent verification:

- **E40:** Brinon–Conrad Example 4.4.4 claims the cyclotomic element mu
  generates the theta kernel at p=2. The BMS Example 3.16 factorization has
  a nonunit multiplier, so mu is not a generator at any prime. The integral
  theorem remains imported from P1/AI.0; this is a source-discrepancy record.
- **E41:** KL I Lemma 9.3.4's blanket acyclicity claim for the positive Witt
  sheaf fails on a cyclic p-cover: H² detects a trace quotient, and reduction
  modulo p contradicts almost acyclicity. The actual de Rham period-sheaf
  calculations are not replaced by this claim.
- **E42:** Qian's Dwork preprint arXiv:2103.00106v1, Lemma 4.2, omits the
  consecutive-weight condition present in BLGHT Lemma 2.2(2). Rank-two
  semistable noncrystalline representations of weight spread greater than one
  give the recorded obstruction. This is a different paper from Qian's
  published Potential automorphy for GL_n.
- **E43:** KL I Corollary 9.3.14's all-module B-pair argument cannot use only
  the étale equivalence 9.3.13. The all-module route uses 9.3.12 with 8.7.8 and
  9.3.10. The correction is a proof-reference repair, not a restriction of the
  corollary to étale objects.

E1–E39 and their known errata/convention records remain, with wording and
ownership corrections. In particular E32 retains Berger's analytic-monodromy
dependency. No new finding is presented as an author-confirmed erratum.

## Review and ownership work still needed

The old handoff claimed that acceptance of REV-RS-01 settled the family. The
latest independent REV-FIX-RT-RS-01 instead returned needs_changes on /30 on
10 October 2026. This packet does not inherit certification from that review
or the 242-node checkpoint.

The independent reviewer should prioritize the following:

1. The finite-Q_p Colmez–Fontaine proof chain and its supplier hypotheses;
   resolve the global stage split and the perfect-residue-field extension.
2. RT-RS-01/30: decide where Fontaine–Laffaille's rational admissibility proof
   belongs relative to R07.3/R06.4 and which general CF supplier R07.4 imports.
   Existing stage ordering prevents silently reversing the import direction.
3. Reconcile rational de Rham ownership with RS-20 and the proposed
   R06.1 → RF2:untilts link. Integral theta-kernel theory stays with P1/AI.0.
4. Close the exact almost finite-image/Frobenius contracts, affinoid
   crystalline injectivity and PD presentation, and semistable/logarithmic
   sheaf descent. The 24 gap entries name every affected node.
5. Read the remaining full Herr/Liu and Fontaine simple-Sen inputs, and finish
   the P7 Wach–Breuil–Kisin/Herr–Iwasawa and P8 all-module derived comparison
   targets. The proposed T6:log-primitive cut needs DLLZ Theorem 6.2.1 and its
   proof; it is not an existing supplier stage.
6. Check the new source discrepancies independently and the ordinary
   normalization on finite coefficient extensions. In particular the Q_p-only
   slope parity shortcut must not be generalized to arbitrary E.

Other existing handoffs are retained in the packet: RD.2's solution-space
constant field is F'_L, possibly larger than L intersect F^nr; Kisin's functor
belongs to R07.4; constant-coefficient de Rham comparison belongs to CP.3.
Only the owning workers/family lead should apply those cross-packet changes.

## Validation

- `scripts/check_blueprint.py` on this packet: **0 errors, 0 warnings**.
- Source-issue schema and source-version checks: **passed**.
- Intake check on the four allowed paths: **passed**.
- Custom consistency checks: all 242 previous ids retained; 300 unique ids;
  acyclic internal node graph; complete reader/API/test coverage; at most six
  planets in each scoped stage; no quote/excerpt fields or source quotation
  blocks; only the four authorized paths changed.
- `git diff --check`: **passed**.
- Lean: **elaborated, only the 16 expected sorry warnings**, as detailed above.

The scratch directory contains no necessary continuation artifact and is deleted
after submission checks. Resume from this handoff, the packet's coverage/gaps and
the exact supplier contracts, not from an alleged closed status.
