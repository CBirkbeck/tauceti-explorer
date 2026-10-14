# BP-SerreWeightAndLevelOptimisation — completed planning pass

Issue [#989](https://github.com/CBirkbeck/tauceti-explorer/issues/989), by Codex (GPT-6), session codex-PxpFTs, 14 October 2026. The claim was confirmed by the bot before work began. This submission continues the existing packet: all 43 prior node IDs survive, and 18 targets are added. Only this issue's packet, reader, suggested file and handoff are changed.

The packet has status `complete` in the target-level planning sense of PROTOCOL §0. Every target of all six stages is specified with hypotheses, source locators, proof outline, direct prerequisites and Checks. All chains end at a verified baseline declaration, an existing supplier node, a precisely requested supplier stage or the recorded proof-source gap. Every implementation status remains `unchecked`. No theorem is represented as formalised.

## Inventory and stage status

There are 61 nodes: 41 theorems, 7 lemmas, 4 definitions, 2 constructions, 5 comparisons and 2 applications. The six definitions/constructions have 25 API items and 21 discriminating unit tests. There are 26 planets, 11 baseline declarations, 32 supplier requests and one proof-source gap.

| Stage | Status | What it delivers | Precise remaining work |
| --- | --- | --- | --- |
| R20.1 | planned | Integral degeneracy quotient, level-change gluing, the IHG congruence application, residual Hecke support and eigenvalue descent | Deliver IHG.1's generic congruence extension and verify the specialized integral pairing comparison. |
| R20.2 | planned | Full conductor interface, joint auxiliary prime, geometric raising/lowering, monodromy and local exponent-defect dispatch | Read the primary full general-character lowering proof recorded below; check its nonsquarefree and characteristic-three cases. |
| R20.3 | planned | Ordinary/supersingular local forms, extension-sensitive weight endpoint, companions, minimum-weight realisation, full-Hecke multiplicity inputs and localized Hasse injection | Match supplied coherent and torsion-coefficient interfaces to the nilpotence, Picard and coefficient conventions. |
| R20.4 | planned | Congruent-character replacement, four coefficient-prime removal milestones, weight-two passage and finite-flat optimisation | Verify delivery of the finite-flat recipe and the separately requested characteristic-three elliptic coefficient-prime branch. |
| R20.5 | planned | Universal dyadic multiplicity, its nonscalar theorem, corrected Buzzard lowering, Q(i) branch, dihedral application and scalar boundary | Deliver the geometric dyadic multiplicity inputs and integral congruent-character quaternionic transfer used for the supercuspidal defect; retain the downstream scalar non-dihedral completion at R27.4. |
| R20.6 | planned | Reduced elliptic level and traces, residual-only large-good-prime export, case manifest and all assigned KWII §8 optimisation targets | Match delivered determinant, coefficient, neatness and local-type inputs to every KW case; retain R27.4/.6 as downstream manifest suppliers. |

No stage is closed. This is a complete planning pass with explicit source and supplier boundaries, rather than a checkpoint with unenumerated stages.

## Ownership and the confirmed finding

RT-AREA-langlands-1/27 is handled by requesting the codimension-zero augmented-algebra congruence functor and ideal once at `IntegralHeckeAndGaloisDeterminants:IHG.1`. The request and rescope proposal name all four consumers: `AutomorphicCongruences:L0`, `SerreWeightAndLevelOptimisation:R20.1`, `PadicFamilies:L1` and `IntegralIwasawaTheory:I.5`. The generic functor uses the annihilator-to-torsion-free-quotient map of IKM24 §2.2/§3.8, with a specified augmentation. The old R20 congruence-definition ID is kept as its Hecke application. R20 defines only the distinct level-change quotient H/(P+Q), and does not assert an unconditional identification of the two objects. A torsion coherent weight-one Hecke algebra is not assumed finite flat or generically étale.

The accepted RS-06 scope is followed. R01 owns the full conductor; R15 owns the weight recipe and operations; R11 owns character groups and monodromy; R14 owns integral Jacobian/cohomology comparisons. Their former specialized R20 definition IDs remain as comparisons or applications where appropriate. Wiese's dihedral Katz construction is imported from the existing R17.6/unramified-katz and R17.5/q-weight-one targets. The current upstream ModularForms layer 8W supplies weight-one lattices and coefficient fields; that work is not planned again.

The totally real targets added in R20.6 are KWII Theorem 8.2, Lemma 8.3, Theorem 8.4, the application of Kisin Corollary 3.1.11 and the tower method of Kisin **Lemma** 3.5.3. These consume R18/R17.4, determinant and global-character suppliers; no R22 modularity-lifting theorem enters their prerequisites. The reader gives the determinant table, p-local cases, simultaneous A/B/C restriction, support/Gram hypotheses, and final removal of unramified quadratic twists. This addresses the cycle identified in the paper routing.

The large-good-prime elliptic theorem assumes modularity of E[ℓ], rather than characteristic-zero modularity of E. The conditional Bennett–Siksek reduced-level result separately takes a weight-two modularity witness for E. Neither uses R29's final all-elliptic-curves result. R27.4 and R27.6 occur only in the case manifest, with no early proof edge.

## Source gap and correction

The one gap is the full proof of Diamond, *The refined conjecture of Serre*, Hong Kong proceedings (1995), Theorem 1.1, pp. 22–37. Wiese04 Theorem 10(a), pp. 131–132 gives the exact full odd-characteristic result and points to that proof. Ribet94 proves the trivial-character weight-two core and explicitly leaves the general-character extension open. Public author and publisher searches did not yield the full proof, and that proceedings volume is not cleared in the maintainer's library index. A follow-up must read a cleared primary full proof or a complete primary replacement, then verify general nebentypus, higher conductor exponents, characteristic three, and coefficient/character transport. The dependent nodes and stage remaining fields identify the uses; the reader does not attribute the full theorem's proof to the narrower Ribet result.

The packet's source issue E1 records a missing hypothesis in the published statement of Buzzard Theorem 2.8, p. 103: unramifiedness at the removed odd prime q. Its proof uses that condition on p. 105. The corrected node includes it, and Ribet–Stein Theorem 3.19, author pp. 49–51 gives the explicitly unramified formulation. The published PDF, author DVI dated 1 October 1999 and later Ribet–Stein draft are recorded with hashes and reading dates. Author/publisher and exact-title erratum searches found no separate publisher correction. `printed` in the source-issue record is a paraphrase under the standing prohibition on source passages.

## Source reading and verification

Sixteen primary sources are recorded with permanent URLs, SHA-256 hashes, versions and exact locators in the packet. The reader's bibliography gives the same versions. Read the relevant statements and connected proof chains in:

- Ribet94 §§1–8, particularly the coefficient-prime proof, Theorem 5.1, the §6 monodromy and §7 two-prime contradiction, and §8 Mazur principle.
- Buzzard00 published §§1–3 and the author DVI; Edixhoven's rendered 1998 author DVI §§2,4,6,8,9 and the imported-operation portions of §§3,7.
- Gross90 Propositions 8.18, 9.3, 12.9–12.10, 13.8 and Theorem 13.10; Coleman–Voloch92 introduction, Theorem 1.1 and §6 proof. The unchecked Gross reverse-compatibility input is not asserted as a general proved theorem. The two-sided companion statement uses Coleman–Voloch's range 2<k≤p, while the one-way splitting criterion permits 2≤k<p.
- Wiese04 Theorems 9–10 and their proof inputs; Wiese07 Situation 1.1, Picard normalization and §4 multiplicity proof chain.
- Bennett–Siksek20 §2, equation (3), Theorem 3 and Lemma 2.1; CG18 §3.4 and §4.1/Theorem 4.8 proof; CG20 Lemma 8.14 and its torsion/socle argument.
- Boxer–Calegari–Gee25 §2.3/proof of Theorem 2.4, printed p. 515: the weight-26 form at 107 and its weight-82 companion. The higher-rank theorem is not attributed to R20.
- KWII §7.6.2 and §§8.1–8.4; Kisin09 §3.1 and Lemma 3.5.3's proof; KWI §1 and Lemma 6.2(i); Ribet–Stein's corrected dyadic formulation; IKM24's generic congruence functor and Proposition 2.10.

Only own-word statements, formulas and source locators are in the repository. No source file, extracted passage or private library text is included. The bibliography distinguishes Edixhoven's author-copy Coleman–Voloch update from the 1992 printing.

The existing reviewed audit has no direct R20 stage entry. Library and ownership checks therefore read actual pinned statements, the accepted RS-06 proposal/review and relevant supplier nodes rather than presenting a negative name search as an audit. Current ModularForms, ModularCurves and LocalGaloisGroups roadmaps and the current Tau Ceti tree were inspected. The baseline's levelRaise description explicitly distinguishes the target subgroup's HasDetOne condition from the determinant d of the scaling matrix.

## Checks and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/SerreWeightAndLevelOptimisation.json`: 0 errors, 0 warnings, using the provided declaration index at the recorded pins.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- The suggested file elaborated through the shared `lean-check` build at Mathlib 082e2d3, exit 0, with only the expected `sorry` warnings. It has 154 lines, two real-bodied light definitions, seven theorem signatures and eight examples. Memory availability was checked before compilation; no build or language server was started.
- Packet/reader cross-check: all 61 target statements, source locators, hypotheses, proof outlines, API items and 21 definition tests appear in the reader; all 43 previous IDs are preserved; all six coverage records are planned; all nodes remain unchecked; all six layers stay within the six-planet limit.
- The adversarial pass checks quotient zero/index/noncomplement cases, valuation and coefficient-prime inclusion, wild conductor exponents, companion endpoint and extension classes, scalar versus Jordan Frobenius, full versus anemic ideals, characteristic-three exceptions, simultaneous KW local types, nonzero source support, residue-degree-two coefficient dimensions, Gram sign and final quadratic-twist removal. The eight Lean examples are representative statements, not proofs of these mathematical targets.
- `git diff --check` passes. The branch contains only the four authorized deliverables.

Next work is independent review of this complete pass. Review should concentrate on the proof-source boundary for the full general-character lowering theorem and on whether each requested supplier delivers the exact coefficient, saturation and local-type hypothesis. Supplier refinement is recorded per stage above; it must not recreate the generic congruence object, the current weight-one lattice work, R17's dihedral construction, or the final R27/R29 results inside R20.
