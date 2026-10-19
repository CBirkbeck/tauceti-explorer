# BP-RefinedTraceMethods — full-scope continuation

Codex, session **codex-kaAOOx**, 2026-10-19. Refs #10827. The claim was confirmed by
[the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/10827#issuecomment-6273396559).
This is a completed target-level pass, submitted for independent review. It is
not an implementation or an assertion that the remaining proofs are closed.

## What the four deliverables contain

The accepted RT.1 part has 154 targets and the accepted RT.5 part has 84. Their
review provenance is preserved in the new main packet's `imports` field:
REV-RefinedTraceMethods--RT.1~3 and REV-RefinedTraceMethods--RT.5~2, both dated
2026-10-09. Those two packets are outside this issue's editable paths and are
unchanged. The main packet adds twelve targets, for **250 distinct targets**.
It is an additive continuation, not a second definition of their 238 IDs.

| Kind | Imported | New | Effective total |
| --- | ---: | ---: | ---: |
| Definition | 53 | 5 | 58 |
| Construction | 48 | 2 | 50 |
| Theorem | 122 | 4 | 126 |
| Comparison | 12 | 1 | 13 |
| Application | 3 | 0 | 3 |

The effective roadmap has **520 API items, 353 prose unit tests, 41 planets and
34 distinct pinned baseline references**. The continuation contributes 28 API
items and 23 tests. Every definition/construction has at least three tests.
There are no new planets; each existing layer has at most six and each label is
at most 60 characters. The full reader contains every effective statement,
hypothesis, source locator, proof route, API item, check, acceptance condition
and use. It also contains the exact supplier contracts and worked examples.

The suggested file was rebuilt to the maintainer's 2026-10-12 shape: seven
light definitions/structures over existing Mathlib carriers, four end theorem
statements, and nine proved examples. It imports Mathlib, uses
`TauCetiRoadmap.RefinedTraceMethods`, and has no admitted data definition or
invented spectral/infinity-categorical carrier. Missing higher carriers leave
those targets in the reader. The classical Cartier inverse theorem, arithmetic
cofinality and coefficient quotient maps are genuine statements at the pins.
The tests include the exclusion of 32 from the high-powered indices and the
actual relation in the polynomial quotient.

## How to reconstruct the effective packet

Take the disjoint union of the two `imports[].nodeIds` sets and the main
packet's `nodes`. Verify imported IDs against the named part, whose review is
recorded alongside the import. Apply each `amendments` entry: remove precisely
`removePrerequisites` and add precisely `addPrerequisites`. Imported statements,
hypotheses, APIs, tests, acceptance conditions and source locators are otherwise
unchanged. Imported requests and source ledgers remain part-qualified;
`requestUpdates` changes only the specified portion of a request.

`targetCoverage` explicitly lists the effective IDs for every scoped stage.
RT.4 in the current issue is the early topological alias: its display list is
exactly the 18 RT.4:topological targets. Older aggregate `realises` tags in the
accepted part are retained as history, without allowing arithmetic prerequisites
to enter an early topological consumer. The named q-Hodge and Habiro substages
retain all their own targets. This distinction is also explicit in the reader.

This representation is necessary because the checker rejects duplicated IDs
across packets of one roadmap, while allowing coverage through another part.
Do not flatten the 238 imported nodes into the main `nodes` list while their
original packets remain present. The full reader is assembled in mathematical
build order: RT.1, the early RT.5 categorical foundations, RT.2, RT.3, ordinary
RT.3b, the three RT.4 substages, refined RT.5 applications, RT.6 foundations,
graded RT.3b, then the final filtered RT.6 interface. Every internal exact-node
prerequisite precedes its consumer in that order.

The effective 250-node internal graph is acyclic, with no unresolved whole-stage
intra-roadmap edge. External requests remain explicit boundaries rather than
asserted theorems. This does not certify that every other roadmap's unresolved
supplier graph is closed.

## The new proof inputs and dependency repairs

Eleven targets in RT.2 provide the circle-equivariant one-prime category,
classical and topological Cartier modules, derived V-completeness, the
cyclotomic t-structure, the TR quotient/completion comparison, its Cartier
heart, TR detection of quasi-isogenies, the null-Frobenius product calculation,
and positively graded cyclotomic spectra with their connective convergence.

The convention matters: Antieau–Nikolaus and AMMN use a circle action, whereas
the existing NS p-typical target uses a C_{p∞} action. The reader states both
categories and the p-completed TC comparison. Rational Eilenberg–Mac Lane
objects distinguish their uncompleted TC formulas. FV=p is the Cartier axiom;
VF=p is not added. The quotient by V and all completions are derived. The
TR product for null Frobenius uses homotopy **orbits**, with degreewise uniform
bounds before taking its product. The graded theorem needs vanishing weight
zero and connectivity increasing with weight. Its output is degreewise
stabilization, not unrestricted strong convergence. TC quasi-isogeny
preservation uses the p-completed fiber of 1−F on TR; it does not assume a
false lower bound for uncompleted circle-equivariant TC.

RT.6/uncompleted-graded-trace supplies the missing polynomial extension of the
graded trace and the uniform-denominator refinement of χ_i. It imports only
the polynomial left Kan extension assertion of
PrismaticCohomology:PR.4/syntomic-connectivity. That supplier owns the algebraic
syntomic construction and its proof; RT.6 owns the trace factorization into
uncompleted p-derived de Rham. RT.3b/graded-beilinson-square now imports this
exact node, replacing the ambiguous whole RT.6 edge. The existing
RT.6/ammn-filtered-interface remains downstream of that square.

The effective prerequisites of RT.3b/reduction-quasi-isogeny now include TR
detection and the graded torsion theorem. RT.5/torsion-qhodge and
RT.5/pro-qhodge-idempotence import the exact existing H.6 compatible quotient
and multiplicative Moore targets. These changes do not claim their outstanding
proofs or the finite q-Hodge prime-2 comparison.

## Assigned red-team findings

All thirteen assigned claims and fixes were read. Accepted contracts handling
them were preserved, with the additional supplier repairs described above.

| Finding | Disposition |
| --- | --- |
| RT-AREA-ktheory-2/3 | RT.4:q-Hodge/image-of-j, /devalapurkar-raksit-thh and /devalapurkar-comparison distinguish j and j_{p,0}, keep p>2 in thesis Theorem 6.4.1, and keep the S¹×Z_p^×-equivariance. The prime-2 comparison is separate. |
| /28 | Refined ku/KU computations import the qualified RT.4 q-Hodge/Habiro comparisons and HQ.3; they do not rebuild q-Hodge theory in RT.5. |
| /29 | Compatible Moore structures now use H.6/burklund-quotient-tower and H.6/burklund-moore-multiplicative, beyond cofiber-only input. Their proof and finite q-Hodge/prime-2 compatibility remain explicit. |
| /30 | Perfect-even sites, even-flatness, homological evenness, Assumption R and synthetic finite norms are retained. Light solid spectral foundations remain a VS2 requirement; Mathlib's light abelian carriers are existing input. Unique étale E∞ lifting uses HA 7.5.0.6. |
| /31 | RT.4:Habiro-comparison/number-field-habiro imports HR.6/the-degree-zero-identification and HR.5-number-field-comparison/the-number-field-ring, retaining 6 and discriminant conditions. |
| /32 | Spectra, smash products, ring spectra and spectral modules come from H.5:spectra exact targets. KU is constructed from Bott/Snaith data rather than a postulated algebraic-K delooping. |
| /33 | RT.2 owns classical/genuine TR, R/F/V and the graded de Rham–Witt comparison. L.4 supplies the separate π₀ Witt convention. |
| /35 | RT.3 exports the nilpotent, rational and limit-tower comparisons. Full henselian rigidity and the K-theoretic Beilinson square are proposed for the henselian Part II; no reciprocal dependency is introduced. |
| /36 | Independent syntomic complexes and their polynomial extension are imported from PR.4; RT.6 proves the trace comparison and graded identification. |
| /37 | Integral derived HKR uses DD.0's cotangent complex/exterior powers and DD.2's de Rham construction, rather than restricting the derived filtration to characteristic zero. |
| /43 | Complex λ/Adams operations, Chern classes, BU and the Chern character remain here; real/equivariant and completion extensions are assigned to Part II. Stable Snaith Adams operations have target KU[1/k], whereas space-level operations remain integral. |
| /44 | Ordinary HH chains, normalization and DG Morita invariance are imported from DGAInfinity Layers 6/8/9. The retained variants specify mixed/cyclic enhancements; its Chern character is compared with the Dennis trace. |
| /46 | GeneralAlgebraicKTheory K.2 plus-construction, K.4 Perf/Waldhausen comparison, K.5 relative/excision and K.7 products remain imports; model comparisons are explicit supplier requirements. |

## Library and source evidence

All 34 distinct recorded baseline declarations were reread with their
surrounding hypotheses at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The main packet supplies exact pinned
file/line links and distinguishes elementary algebra/chain carriers from the
missing coherent spectral foundations. AUDIT-30's reviewed coverage remains
not built for the trace targets; ordinary carrier availability is not marked
as a trace implementation.

The current read-only TauCetiRoadmap checkout was also checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. DGAInfinity's full reader and suggested
file, and StablePeriodicCurved as a second nearby model, were read. Searches
included the nine post-snapshot roadmaps and completed roadmaps. No newly
landed THH/cyclotomic/mixed-complex/negative-cyclic/refined-trace implementation
was found. No build command was run in either read-only checkout.

Fresh source reading for the new targets:

- Antieau–Nikolaus, [Cartier modules and cyclotomic spectra](https://arxiv.org/pdf/1809.01714v2), arXiv v2: Theorem 2.1, Lemmas 2.10–2.11, Remark 2.5 and Warning 2.6, pp. 8–10; Definitions 3.1/3.6, Proposition 3.8, pp. 15–19; Definition 3.14 and Proposition 3.15, pp. 22–23; the TR adjunction/completion and Cartier heart, §§3.3–3.4, pp. 24–29; Theorem 6.14, p. 60. Bibliographic dates and hashes are recorded in the main packet. These are preprint page locators, not silently transferred journal pagination.
- AMMN, [On the Beilinson fiber square](https://arxiv.org/pdf/2003.12541v2), v2: Definition 2.18, p. 12; §3.1 and Propositions 3.1–3.3, pp. 15–16; Theorem 5.1(2), p. 25, Proposition 5.32 and Construction 5.33 with the polynomial extension proof, pp. 33–35; Construction 6.16 and the proof of Theorem 6.17, pp. 44–45. The v2 locator for Corollary 3.9 remains distinguished from v1.
- Meyer–Wagner, [q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4), introduction and §3.1, especially p. 30, for the high-powered arithmetic condition. This is a selected convention check, not a fresh audit of its full refined-invariant proof.
- BMS2, [published Numdam version](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Propositions 6.2–6.3 and their proof, pp. 245–247, for the coefficient presentation and can/Frobenius generator images.

Other source audits are **inherited from the two accepted parts**, not
represented as a new independent review or a fresh reading of every cited
paper. Their 44 source records, edition-specific locators, hashes, source
coverage ledgers and reviews remain available in those parts. The reader keeps
their bibliography labels distinct, including the published/preprint BMS2
pagination distinction. Their 24 plus 8 source-issue records are imported by
(packet name, issue ID): the E1–E8 strings collide between parts and must never
be merged by bare ID. The reader gives corrections and reasons in its own
words, without reproducing source passages. No new source-error verdict is
asserted. No private book or source file is added to the repository.

## Coverage and remaining work

Every scoped stage is **planned**, and none is closed:

| Stage | Effective target count | Remaining before closure |
| --- | ---: | --- |
| RT.1 | 20 | Coherent mixed-complex localization, Kan/totalization and derived HKR supplier interfaces. |
| RT.2 | 63 | EDS coherent action/Tate/t-structure machinery, spectral foundations and the orthogonal/genuine comparison proof. |
| RT.3 | 21 | K-theory model comparisons, Goodwillie/calculus and enriched finitary invariant tensor proof interfaces. |
| RT.3b | 8 | The independent syntomic polynomial-extension proof and other derived/descent suppliers; the two missing target contracts are now present. |
| RT.4 | 18 (alias) | Exactly the early topological targets; no arithmetic prerequisite enters this alias. |
| RT.4:topological | 18 | Spectra/space representability and graded rational HKR supplier interfaces. |
| RT.4:q-Hodge | 31 | Light solid spectra, coherent lifts/gluing, even filtrations and explicit sufficient flatness proofs. |
| RT.4:Habiro-comparison | 4 | Finite-cyclic cyclonic comparison, periodic reconstruction, multiplicative enhancement if used and HR.6 degree-zero input. |
| RT.5 | 35 | Relative multiplicative motives/rigidification proof, finite q-Hodge/prime-2 and compatible Moore proofs. |
| RT.6 | 50 | Coherent filtered/animated carriers, derived convergence, spectral coefficient realization and the announced site comparison. |

The main packet retains eleven gap records: orthogonal/genuine comparison;
light solid spectral reference; Wagner's sketched proof inputs; coherent
foundations; general rigidification; relative multiplicative motive
localization; compatible Moore/finite q-Hodge choices; the BM K-sheaf proof;
Habiro multiplicativity and periodic reconstruction; coefficient grading and
spectral realization; and unbounded derived convergence. Two inherited
missing-target gaps are now supplied: Cartier/TR detection and polynomial
extension of the uncompleted graded trace. This is target planning, not a
claim that the new proofs or their suppliers have been implemented.

There are 59 inherited request records and two new precise contracts: the
generic accessible/left-complete t-structure criteria from EDS E5:abstract,
and the independently prismatic polynomial left Kan assertion at
PR.4/syntomic-connectivity. The former whole-RT.6 residual request is replaced
by the new trace factorization; the Moore portion of an H.6 request is narrowed
to exact supplying nodes. The reader preserves the remaining contracts and
consumers. A follow-up should discharge these named proof/supplier requirements,
resolve the proposed Part II owners, and apply the proposed atlas display splits
without changing preserved IDs. There is no second job claimed by this run.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/RefinedTraceMethods.json`: zero errors and zero warnings, including the exact pinned declaration index.
- Both imported parts also pass the blueprint checker unchanged.
- Effective union: 250 unique IDs; all exact internal prerequisites resolve; topological sort succeeds; reader order respects every internal edge.
- Reader parity: every target, API/check name, hypothesis, source locator, proof route, acceptance condition and use is retained; links have unique local anchors.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/RefinedTraceMethods.lean`: passes.
- `lean-check research/blueprint/suggested/RefinedTraceMethods.lean`: exits 0 at the pinned shared build; only four theorem-body `sorry` warnings, no errors or other warnings. Available memory was above the 20 GiB threshold. No Lean server or independent Lake project was started.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: zero problems. No local paths, source files, extracted passages or application changes are submitted.

The independent reviewer should read the continuation and its amendments
alongside the already accepted parts. In particular check the circle-action
convention, the p-completed TC argument, the pre-Beilinson polynomial extension
and the remaining finite-torsion hypotheses; do not interpret the twelve-node
main `nodes` list as a replacement that deletes the 238 imported targets.
