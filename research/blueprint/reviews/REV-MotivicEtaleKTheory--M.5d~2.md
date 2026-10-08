# Independent review of MotivicEtaleKTheory M.5d–M.8, revision 2

**Accepted at target level.** Codex — codex-jgCHl7 independently reviewed revision 2 on 2026-10-08 for issue #7076. This reviewer wrote neither the original plan nor its revision. The packet contains a current verdict for every node. Acceptance concerns a finished planning pass: all six stages remain planned, none is closed, and every implementation remains unchecked.

| Item | Result |
| --- | --- |
| Nodes | 67: 61 verified, 6 corrected, 0 added, 0 unverifiable |
| Definitions / constructions | 2 / 18 |
| API items / named examples / planets | 67 / 61 / 30; one API item added |
| Baseline declarations | All 30 confirmed; none removed or replaced |
| Scoped reviewed audit targets | 26 across six stages |
| Proof/source gaps / supplier requests | 11 / 36; duplicate BL gap merged |
| Source issues | 10: 9 confirmed, 1 rejected; 2 new findings |
| Assigned red-team findings | All four independently checked |
| Reader source quotations | 84 locator quotes removed; no source passages added |

## Evidence and limits

Read the packet, suggested file and reader; the earlier independent review and revision handoff; both binding protocols and worker/upstream guidance; the six scoped AUDIT-30 records; accepted RS-08, RS-28 and RS-33 ownership boundaries; current supplier declarations and stage contracts; and both HodgeStructures and GrothendieckEulerForms upstream reader examples. The reader's node statements, hypotheses, proof steps, prerequisites, APIs, examples, uses, acceptance conditions and source locators were checked against the corrected packet.

Downloaded all 15 active public source PDFs and independently reconfirmed their recorded SHA-256 values. Read each node's cited definition/theorem passage and the relevant proof steps. The packet supplies the exact URLs, versions and locators. This is not a claim to have read every paper in full or independently compared every alternative edition recorded by earlier workers. The original Kato elimination input, resolution-free Geisser–Levine argument, global filtered comparison, full multiplicative moving argument, arithmetic tower extension, original Thomason descent, coherent transfer, Suslin neighbourhood/stability inputs, Gillet/Gillet–Soulé and Huber constructions, and selected local/determinant refinements remain explicit gaps.

All 30 baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including surrounding hypotheses and `to_additive` exports. Their statements provide the actual derivation, semilinear pullback, tensor/exterior, quotient, prime-subfield, torsion, p-adic, norm, finite-dimensional and linear-equivalence operations cited here. In particular, fixed-point membership does not require a finite ambient field; quotient descent requires the kernel condition; norm uses the source module hypotheses; and `LinearEquiv.ofBijective` retains the supplied map. No near miss was promoted to a baseline theorem. The shared build lacks the compiled Tau Ceti semilinear-map module, so the suggested file continues to pass its genuine semilinear type and derivation law as supplier inputs.

The target-level proof outlines end in existing primitives, exact supplier exports or named gaps. They do not replan generic spectra, exact couples, cycle complexes, scheme operations, real topological K-theory, motives, Selmer complexes or determinant functors. The internal 67-node prerequisite graph is acyclic. Every audited target is represented by nodes or precise supplier requests. All 20 definition/construction nodes retain at least three examples and an API derived from their recorded uses. Planets remain named mathematical objects or results. PROTOCOL §13's permission to omit unavailable geometric conditions is respected; the packet and reader retain those conditions as binding requirements.

## The nine earlier revision requirements

| Requirement | Independent result |
| --- | --- |
| Global filtered comparison | `AugmentedTowerIso` now includes level equivalences, transition squares and the common K(X) augmentation. It is a homotopy-category shadow of the required coherent comparison; the geometric zigzag remains a gap. |
| Exact couple | Actual i/j/k maps have range–kernel exactness. The raw differential is j∘k, its square is zero by exactness, and the derived page uses its cycles/boundaries quotient. Raw-to-motivic indexing is r=s+1. |
| Filtered Adams action | Tower endomorphisms commute with transitions and augmentation; their base map is tied to the supplied scheme Adams operation. Induced page actions commute with the actual boundary. |
| Rational degeneration | The same pages carry the differential and equivariant scalar-weight actions. Distinct rational weights force vanishing; the finite filtration and projectors retain their own hypotheses. |
| Motivic sequence and examples | Pullbacks commute with the actual differential and E₂ cycle identifications. Identity/composition and diagonal, zero-weight and finite-field tests use the same field scheme and its supplied models. |
| Chern weight comparison | The comparison is on the simultaneous eigenspace, with compatible Adams action and normalization on actual spanning cycle generators. It is not an arbitrary map on all rational K-theory. |
| Norm families | Soulé's fixed-base unit–Bott family has coefficient-reduction transitions; varying-ring families instead use reduction followed by norm. The genuine C/R norm of 2 is 4 and distinguishes these transitions. |
| Fundamental-line inputs | Independent MC.2 realizations, PS.0 period spaces and L5 determinants replace the circular whole-PS.4 input. Their transitive stage prerequisite sets have 10, 11 and 6 visited stages respectively, with no M.8 ancestor. |
| Regulator determinant | The equivalence is induced from the actual bijective regulator map. The same determinant operation and specified period equivalence define the comparison. Rational trivialization does not imply an integral basis. |

These nine requirements are satisfied. Kato's [§§1–2.1, pp.163–168](https://arxiv.org/pdf/math/0304233v1) does not prove general zeta-element existence; the revised conditional determinant interfaces retain that boundary.

## Corrections in this review

1. **Witt map normalization.** `wittSymbol_symbol` previously quantified over an unrelated tuple map. The new `wittLogWedge` API fixes the CR.4 Teichmüller logarithmic wedge independently of the symbol. Restriction preserves those wedges; coefficient reduction preserves quotient representatives; insertion sends [x] to [p^(r−1)x]; and the logarithmic insertion sends a length-one wedge to p^(r−1) times the length-r wedge. These expressible laws now appear in the signatures. The degree-zero equivalence must preserve the genuine unit section. An arbitrary sign-changed equivalence or transition no longer satisfies the test's hypotheses. The underlying route remains [Bloch–Kato Corollary 2.8, pp.117–118](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), with the genuine logarithmic sheaf from [Illusie I §5.7, pp.595–598](https://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf).
2. **Well-connectedness.** The packet incorrectly concentrated multirelative semilocal simplex spectra in degree zero. [Levine Definition 6.1.1, p.30](https://arxiv.org/pdf/math/0510334) concentrates the *zeroth layer of each T-loop iterate over a field*. Proposition 6.3.4, pp.34–35, uses multirelative π₀ vanishing for positive simplex dimensions as its proof criterion. Theorem 6.4.1, pp.35–36, verifies it for K; Theorem 6.4.2, pp.36–37, identifies the cycle layers. Corrected statement, hypotheses, proof steps and locators; the prototype now separately types support connectivity, field-layer concentration and positive-dimensional multirelative π₀ vanishing. Also corrected 6.4.1 to 6.4.2 in the global-model gap's layer citation.
3. **Adams and projector source cautions.** The already correct positive-weight action is now explicitly reconciled with the source's misindexed Theorem 12.12(3). The rational splitting acceptance conditions also record the independently confirmed projector and filtration issues E6/E7.
4. **Transfer locator.** The relevant [FGV Proposition 2.15, Remark 2.16 and proof](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf) are on pp.15–16, before §2.8. Replaced the inaccurate pp.16–17 locator. The finite étale scope and ramified dualizing-line caveat are unchanged.
5. **Deligne locator and Newton sign.** [Burgos Remark 4.25](https://www.icmat.es/miembros/burgos/files/brbr.pdf) is in §4.5, p.32. Definition 4.21 and Proposition 4.20 in §4.4, pp.30–31, determine the signed suspension. The packet now specifies (−1)^(j−1) for its fixed Newton/Chern convention and records E9 below. The early Deligne class continues to precede the Borel factor-two comparison.
6. **Reader and provenance.** Refreshed every declaration's direct prerequisites, including the current assembled M.1/M.4/M.5a–c and MC.4 imports that the reader lacked. Synchronized all corrections and source verdicts, merged the duplicate Beilinson–Lichtenbaum gap while retaining its fuller assembly qualifications, and removed 84 source-label quotations under the standing own-words rule. Source descriptions, mathematical explanations and locators remain. Historical review evidence stays separate from this review's current audit.

## Source findings

Each finding now has this job's independent verdict. The reasons and mathematical counterexamples are in our own words in both packet and reader.

| Finding | Verdict and check |
| --- | --- |
| E1 | Confirmed: KF p.40 gives a same-degree target for tame residue; BK (2.3), p.114, separates degree-lowering residue from specialization. |
| E2 | Rejected: the p.40 arrow is unlabeled, not asserted to be quotient projection; A2 pp.35–36 already defines its Cartier/Artin–Schreier meaning. |
| E3 | Confirmed: KF pp.36–37's componentwise order cannot place (1,4) and (2,3) in a strict chain; BK Proposition 2.4 uses lexicographic order. |
| E501 | Confirmed: KF p.31's differential presentation omits additivity. The valuation map on Q(t) satisfies its product/base-scalar relations but fails the sum relation. |
| E502 | Confirmed: KF p.33 introduces an unbound coefficient in the second symbol relation; the dlog product rule fixes the same coefficient in both summands. |
| E504 | Confirmed: KF pp.38–39 omit one p-basis element in the extension degree, producing a negative complement size already for p=2, n=2. |
| E6 | Confirmed: Levine Lemma 14.6(1), p.72, drops the projected argument in two eigenidentities. Two rational weights and an element in the other weight give 0=e₁ as a counterexample to the printed identity. |
| E7 | Confirmed as a proof gap: Lemma 14.6(2), pp.71–72, proves the filtration inclusion in the direction already assumed, rather than its claimed reverse inclusion after clearing denominators. The lemma itself is not disproved. |
| E8, new | Confirmed: Theorem 12.12(3), p.58, has the wrong Adams exponent for its displayed second-page coordinate. The weight-one hyperplane class on P¹ requires ψ²=2; Theorem 14.7, pp.73–74, uses the consistent convention. |
| E9, new | Confirmed: Burgos Remark 4.25, p.32, omits the alternating Newton sign in the primitive coefficient and suspension. Definition 4.21 gives pr₂=b₁²−2b₂, so the b₂ coefficient of ch₂ is negative; the final Bott pairing remains ±(2πi)². |

The KF checks use the [exact publisher appendix](https://msp.org/gtm/2000/03/gtm-2000-03-003p.pdf), and the Levine checks use the [author-hosted preprint](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf). Limited public title/errata/theorem-number searches and the author catalogue located no corrigendum for these findings. No novelty or comprehensive edition-search claim is made. Correcting individual errors does not certify the entire supplementary BGK proof or the printed denominator induction.

## Red-team routing and orchestrator notes

All four assigned findings are addressed at the authorized scope:

- **RT-AREA-ktheory-1/2:** the field motivic-complex bridge, smooth Beilinson–Lichtenbaum truncation and separate Dedekind node explicitly precede the étale comparisons. The resolution-free original proof remains a gap.
- **RT-AREA-ktheory-1/3:** Suslin real comparison precedes the mod-2 table and dyadic arithmetic output. The current RT.4 contract supplies complex KU; the requested real BO/KO Part II supplies the real carrier and extensions.
- **RT-AREA-ktheory-1/13:** differential BGK imports DD.3, CR.4 and Milnor residue inputs without a motivic M.5a–c dependency. HL.2 consumes this independent node.
- **RT-AREA-ktheory-2/18:** finite étale Chern classes are an early export for HB.1/HB.2/D.2, without late D.2/R.7 inputs. Universal finite product factors and Bott/Kummer normalization are preserved.

No unanswered question blocks acceptance. The orchestrator should preserve declaration-level early Chern/Deligne links, the independent realization/period/determinant prefix, and the listed source/supplier refinements. Whole-stage reverse edges can conceal the early/late distinction; the packet's upstream notes identify the required routing. No supplier roadmap, atlas data, label or promotion was edited by this worker.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.5d.json` reports **0 errors and 0 warnings**. Additional correspondence checks cover every node/API/example name in the suggested file and all reader node fields; the internal prerequisite DAG has 67 nodes and no cycle.

`lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.5d.lean` exits **0** at the pinned Mathlib, with **170 warnings, all declaration uses of `sorry`**, and no other warnings or errors. Available memory before compilation was 110 GiB. Only one wrapper-controlled check ran. Elaboration validates types, not the geometric or arithmetic theorems. The packet records the final suggested-file hash and compile evidence.
