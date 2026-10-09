# REV-FIX-RT-AREA-langlands-2~3

Current blocked checkpoint: Codex session `codex-kwYBrA`, 9 October 2026,
issue #5871, base `3e12579277aaf8a219cbe13d27e660a621c7124e`.
All seven authorized files are unchanged since merged checkpoint PR #7776.
This continuation confirms the intake-scope blocker and preserves the existing
mathematical verdicts and reviewer objects.

Completed independent review for issue #5871 by Codex, session `codex-t0EaB3`, 7 October 2026.
Base: `5f858d95`. Work reviewed: FIX-RT-AREA-langlands-2~3, Claude `claude-c9TlsS`, #5870,
PR #6724 (`ea48bbee`). I did none of the fixes or red-team work. This continues the merged
Claude `claude-hd6PQ0` checkpoint, PR #7024, after rechecking its evidence and correcting its report.

## Verdicts

| Packet | Verdict | Reason |
| --- | --- | --- |
| ClassicalSerreModularity--R27.3 | **accepted** | Round-three corrections are right; corrected six test classifications and the suggested positive-level newform parameter. |
| GlobalGaloisDeformations | **accepted** | Round-three corrections are right after specifying the Cayley–Hamilton quotient and exact reconstruction owner, narrowing the reducible examples, and correcting thirty test classifications. |
| GL2ModularityLifting--R22.1 | **needs_changes** | Round-three mathematics is right after correcting the final dyadic field step. Its never-accepted base review still requires typed APIs/tests and promotion of API lemmas used elsewhere. |

These are fix-review verdicts. They do not close unread-source gaps, certify implementation, or
certify corrections outside the three allowed packets. Eleven findings have correct local repairs;
twenty-nine remain routed to other jobs. Five of the eleven also have an external part.
The review job is complete even though GL2 needs another revision.

## Scope and evidence

Read WORKERS, both binding protocols, UPSTREAM_GUIDE and BROWSER_AGENTS; used the complete
SemisimpleAlgebras and InductionRestriction upstream documents as the planning-density examples.
Read the forty findings and confirmations, round-two review, round-three fix report, the merged
checkpoint report/handoff and the GL2/CSM own reviews. Compared the round-three commit node by node:
CSM four new/eleven changed nodes; GL2 five new/fourteen changed; Global one new/one changed.
Also checked the subsequent CSM R33.3 correction and the five Global nodes changed by #5719.
Read the concrete suppliers of the changed declarations and the stage-only supplier requests;
an open request is not a supplied formal theorem.

All thirty-six baseline records were checked against exact declaration statements and section
hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular: Maschke needs a field,
finite group and invertible group order; the simple-root Hensel argument needs completeness,
locality and the nonzero residual derivative, not just Polynomial.Splits; the cohomology B1
carrier is an algebraic range and acquires continuous coboundaries only under the action hypotheses.
Read the relevant reviewed library-audit rows for CSM and its algebra/quaternionic suppliers;
that audit has no GL2/Global rows. No missing arithmetic is replaced by a baseline ingredient.

Sources were fetched afresh with certificate validation. All six hashes reproduce the packets' records.

| Source | Passages checked | SHA-256 |
| --- | --- | --- |
| [Khare–Wintenberger I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), author preprint | Theorems 3.1/4.1, Lemma 8.2 and §8.4, §9 and §10, pp. 6–7, 17–21 | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), author final | Lemmas 4.3/4.4/4.6 and Proposition 4.5; Lemmas 5.2/5.3; soluble branch of Theorem 6.1; §7.6 and §8 statements/proofs; Theorem 9.7; §10.2, pp. 40–44, 47–48, 54, 68–78, 89–92 | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| [Clozel–Harris–Taylor](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), published | Lemmas 4.1.1/4.1.2 and proofs, pp. 116–117 | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| [Chenevier, arXiv:0809.0415v2](https://arxiv.org/pdf/0809.0415v2) | §§1.17–1.23, Definition 2.19, Theorem 2.22/proof and Corollary 2.23, Example 3.4, pp. 16–19, 33–35, 42 | `f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953` |
| [Gee, arXiv:2202.05818v2](https://arxiv.org/pdf/2202.05818v2) | §3.23 complexes/long exact sequence and §3.24, pp. 16–18 | `878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5` |
| [Dieulefait–Pacetti, arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2) | Theorem 1.9 and Paso 2, pp. 6, 10–11 | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |

Compared the seven CSM and fifteen GL2 new/changed excerpts verbatim after NFKC normalization,
whitespace and overline removal. Checked occurrences on their individual PDF text pages and
locators: KW I pp. 7, 20–21; KW II pp. 54, 68, 92; CHT p. 116. Also verified the reused
Global Example 3.4 quotation on p. 42 and the new Theorem 2.22 hypothesis quotation on p. 34.
No claim of checking the published KW pagination or every PDF page image is made.

Not independently read here: Khare's IMRN paper/corrigendum, Gross, Coleman–Voloch,
Edixhoven, Taylor's icosahedral paper, Kisin's Durham paper and Diamond's paper.
Their imported contracts and recorded gaps remain explicit.

## Every confirmed finding

“Right” certifies the repair inside these packets. “Handed on” records its correct external
owner from the verified finding and fix report; it does not independently accept that owner's work.

| Finding | Verdict | Reason |
| --- | --- | --- |
| /1 (high) | Right; stage edit remains | Lemma 8.2 now has R01.3, R01.4/dickson-classification-and-the-dyadic-refinement and Chebotarev Layer 10 as prerequisites, and its new compatibility step is right: the first three conditions make Frob_q trivial on every quadratic subfield of the cyclotomic field (on ℚ(√p) because q ≡ −1 mod p and p ≡ 1 mod 4), the fourth on L because ρ̄_proj(c) ∈ PSL₂(𝔽_p) (KW I pp. 17–18). R33.1's three nodes and GL2's R32.1/quadratic-cyclotomic-irreducibility cite R01.4 and R15.4 instead of the mixed KW I §6 node. Recomputed: no node of R33.1–R33.4 has an ancestor in R26, in R27.1b (good-dihedral-prime-insertion, dickson-and-the-dyadic-solvable-refinement) or in R27.2–R27.6. On the assembled stage graph R33.2–R33.5 still have R26.1–R26.6 as ancestors; deleting the one edge R26.6 → R27.1 removes them all from R33.1–R33.5, and R33.6 keeps them, as the finding allows. The split entry agrees with part R26.1's. The stage edit is the maintainer's. |
| /2 (high) | Handed on | BP-AutomorphicGaloisRepresentations. The new GL2 nodes cite R19.2 only for the attached representation of a base change, and do not supply Taylor's construction. |
| /3 (high) | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1. Its Theorem 8.2 input is R22.1/theorem-8-2-minimal-modular-lifts. |
| /4 | Handed on | BP-GL2AutomorphicRepresentationsAndTransfer--R17.3 and BP-AutomorphicGaloisRepresentations. GL2's base-change uses go through the exact R17.4 request. |
| /5 | Handed on | BP-AutomorphicGaloisRepresentations (R19.1). |
| /6 | Handed on; related consumer corrected | The AGR reconstruction remains outside scope. Global now explicitly applies Theorem 2.22(i) to A[G]/CH(D), with henselian A and split absolutely irreducible residue. Its exact planned supplier is IHG.1/henselian-irreducible, rather than IHG.0 or Theorem B; the supplier remains an open request while its own review needs changes. |
| /7 | Handed on | BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.5) and part R26.1. |
| /8 | Right; ML.1's side remains | Corollary 10.2(ii) is planned in full in R27.6, from layers before it, and nothing is imported from ML.1. I checked the four new declarations step by step: (a)–(d) of artin-reductions-of-serre-type, including exactness of invariants and Maschke for ℓ ∤ |G|, equality of conductors from equal invariants of the ramification groups, k(ρ̄_λ) = ℓ and Edixhoven weight 1, and P_c; the weight-one step, with ordinarity from Fontaine's supersingular form, the Frobenius eigenvalues from Deligne's ordinary form, and Gross's companion form at k = ℓ under a_ℓ² ≠ ε(ℓ) (R20.3/companion-forms states that case); finiteness of the torsion of H¹ of the cusp sheaf and flat base change; and the descent (Deligne–Serre lifting, restriction of eigensystems, pigeonhole over primes of 𝒪_{E′}[1/N′], weight-one newforms, Chebotarev). The suppliers in R15.1, R15.2, R15.4, R15.5, R15.6, R19.1, R20.3, R01.1, R01.3 and R01.5 state what is used, and the three new requests ask for what they do not. The acceptance items for the S₃ representation of conductor 23 are right. ML.1's narrowing is BP-ModularityAndLanglandsExtensions'. |
| /9 | Handed on | BP-ModularCurvesPartII--R14.3 and BP-AutomorphicGaloisRepresentations. |
| /10 | Handed on | BP-PotentialModularityAndCompatibleSystems--R24.3, BP-WeightsInEtaleCohomology, BP-AutomorphicGaloisRepresentations. |
| /11 | Handed on | Part R26.1 (R26.3 and R27.2 are not in these packets). |
| /12 | Right; R24.4 and stage texts remain | The three new GL2 nodes are right against KW I Theorem 4.1 (p. 7) and KW II §10.2 with its Remark (p. 92): Theorem 9.7 covers (2)(i) except k = p + 1 with k(ρ̄) = 2, and (2)(ii) when ρ restricted to ℚ_p(μ_p) is semistable of weight 2. The node's own reduction of the case N ≠ 0 is right: the Weil–Deligne representation is sp(2) ⊗ η, η\|_{I_p} comes from a Dirichlet character of p-power conductor, and the twist by its inverse is semistable non-crystalline of weight 2, so of type (C). Potentially crystalline weight 2 is potentially Barsotti–Tate (Kisin's node). The ordinary weight-p + 1 case is requested from R21.4, where KW II cite Diamond [16]; the non-ordinary case, Kisin's Durham paper [38], is an honest gap, and none of the four consumers in R27.3 needs it (Theorem 3.1 works with k(ρ̄) = 2, and the strong form uses lifts of weight k(ρ̄)). alpha-beta-from-modularity-over-q follows KW II p. 54 and p. 92. The R24.4 nodes, the RS-08 keeps and the R22.5 stage text are outside these packets; the GL2 `restructure` entry records them. |
| /13 | Right after review corrections | The §7.6/§8 nodes match KW II pp. 68–73. allowable-base-change-existence is proved correctly from CHT Lemma 4.1.2 (with the real places, E_v = ℝ, and one auxiliary place with the unramified quadratic extension for evenness), and its quadratic clause (5) correctly by weak approximation and a place z split completely in D; disjointness from K(μ_p) gives both image conditions. Lemma 8.1's construction gives every bullet of KW II's statement; an absolutely irreducible or weight-p + 1 ρ̄\|_{D_p} is ramified, so E_p = ℚ_p there. alpha-beta-under-allowable-base-change is right (cuspidality from absolute irreducibility; conductor exponents ≤ 1 are kept along unramified extensions). Lemma 7.10's dyadic branch is right, given a finite-order character from CHT Lemma 4.1.1; the correction (below) makes the request say where finite order comes from. Theorem 8.2's initial field step agrees with KW II p. 72; I corrected its final dyadic U-eigenvalue step to a further allowable extension, not a necessarily split extension above 2 (p. 73). The definitions are typed in the suggested file with every API item and test under their packet names. The Kisin and Gee prescribed-type contracts remain open requests, as before. |
| /14 | Handed on | BP-AutomorphicGaloisRepresentations and BP-LocalGaloisDeformationRings. GL2 requests KW II Lemma 7.7 from R19.5. |
| /15 | Right (round 2); rechecked | R01.4 is a prerequisite of three R04.5 nodes, and the R01.4 request names the exact KW II Lemma 4.3 content. |
| /16 | Handed on | BP-LocalGaloisDeformationRings (R08.1). |
| /17 | Handed on | BP-PadicHodgeTheory--P7, BP-LocalGaloisDeformationRings, BP-OrdinaryAutomorphicFormsAndModularityLifting. |
| /18 | Handed on | BP-LocalGaloisDeformationRings. |
| /19 | Right (round 2); rechecked | R22.2 imports R18.3's freeness and twists through R18.6 and restates neither. |
| /20 | Right (round 2); rechecked | The three R27.5 nodes that need (H) cite R22.6/hypothesis-h; the RS-06 keeps for R27.5 are the maintainer's. |
| /21 | Handed on | Part R32.3 of GL2ModularityLifting (R32.6) and BP-PotentialModularityAndCompatibleSystems--R24.3. |
| /22 | Right (round 2); links remain | The three G8 nodes name PA.3 as their consumer and `consumerContracts` gives the contract. The links L7, L8, G8 → PA.3 and L7's text are outside this packet. |
| /23 | Handed on | R23.2 applies H6's twisted moduli; remove its duplicate construction and retired R10 reference at that owner. |
| /24 | Handed on | Narrow R23.5 to its field-selection application, importing solvable base change/descent from R17.4/R17.6. |
| /25 | Handed on | R23.1 needs Moret–Bailly with the separate split, unramified and algebraic-local-open conditions, not only split places. |
| /26 | Right on the consumer side; R23.1 remains | The request to R23.1 states CHT Lemmas 4.1.1–4.1.2 as printed (checked on pp. 116–117), with its refinements; the stage prerequisite R23.1 → R22.1 is acyclic (R23.1's only stage requirement is AlgebraicModuliForArithmeticGeometry R09.3), and the dry assembly adds it without skipping. R23.1's packet has to plan the two lemmas. |
| /27 | Handed on | R23.1 needs its Chebotarev finite-avoidance/Frobenius-generator input. The CSM density request is a different consumer. |
| /28 | Handed on | The BCGP route needs Snowden's potential residual modularity over arbitrary totally real fields at R23.2/R23.3/H6; a conditional α/β witness is not that theorem. |
| /29 | Handed on | R24.1's CG application needs the Thorne/ordinary finiteness theorem beyond the KW local-ring scope, or a precise unplanned gap. |
| /30 | Handed on | BP-PotentialModularityAndCompatibleSystems--R24.3. |
| /31 | Handed on | Coordinate the Wach/(φ,Γ) input PG.6 → the early local BLZ owner R06.4 with /17. |
| /32 | Handed on | IntegralIwasawaTheory L4 owns Washington's non-p cyclotomic class-group bound, distinct from Ferrero–Washington μ = 0; R21.5 consumes it. |
| /33 | Handed on | Add the actual R17.4 solvable totally real automorphic descent input to the R21.5 application. |
| /34 | Handed on | R21.6 needs the BLGG13 ordinary prescribed modular lift, retaining local and cyclotomic hypotheses; ordinary R=T alone does not construct it. |
| /35 | Handed on | BP-AutomorphicCongruences--L5b. |
| /36 (low) | Handed on | Part R26.1 and the PotentialModularityAndCompatibleSystems parts. |
| /37 (low) | Right (round 2); rechecked | R04.3 cites KW II Lemma 4.4, Lemma 4.6 and Proposition 4.5, and its two mentions of Corollary 4.7 attribute that application to R24.2 with R03.4. |
| /38 (low) | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting. |
| /39 (low) | Right (round 2); rechecked | The R33.2 node is Paso 2 only, with R24.3, R24.6 and Paso 1 as prerequisites. |
| /40 (low) | Handed on | The extraction PAPER-LE-LEHUNG-LEVIN-ETAL-20, item `cited-base-change`. |

Counts: eleven local repairs (/1, /8, /12, /13, /15, /19, /20, /22, /26, /37, /39),
twenty-nine external handoffs. The finding identifiers above cover 1–40 exactly once.

## Corrections in this continuation

1. **Global R04.2 determinant comparison.** Theorem 2.22(i) assumes a Cayley–Hamilton
   determinant. Apply it to `A[G]/CH(D)` with its induced determinant; the raw group algebra
   need not be Cayley–Hamilton. Residual splitness comes from the given representation.
   The two residual representations factor through the same matrix-algebra quotient and
   differ by an inner matrix-unit identification; a lifted conjugator fixes the reduction.
   Trace-pairing coordinates give continuity, and Carayol gives strict injectivity.
   Removed the unsupported appeal to a “uniqueness part” of Theorem 2.22.
2. **Exact reconstruction owner.** IHG.0 owns determinant laws. The existing
   `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible` node already plans this
   quotient/reconstruction theorem. Added its fine prerequisite and an open supplier request,
   rather than planning it again. Its packet currently needs changes, so this remains a
   requested planned interface. The dry accepted assembly adds no new IHG.1 stage link because
   the existing graph already has it; it adds the IHG.0 law-input link to Global R04.2.
3. **Reducible acceptance examples.** The old unconditional `1 ⊕ 1` non-injectivity claim
   fails for groups with vanishing H¹, including the trivial group. Specified `G = ℤ_p`,
   a nonzero continuous additive `x : ℤ_p → 𝔽`, and the lift
   `ρ_x(g) = [[1, εx(g)], [0, 1]]`. Every characteristic polynomial of an element of the
   group algebra agrees with the constant lift (upper-triangular diagonal entries agree),
   hence so does the determinant law. Conjugation fixes the constant identity representation,
   so the nonconstant lift cannot be strictly equivalent to it.
4. **GL2 Theorem 8.2.** The final dyadic U-eigenvalue adjustment uses further allowable base
   change (KW II p. 73). A suitable nontrivial unramified local degree removes a quadratic
   sign; requiring that extension to split above 2 would not do so. Corrected the proof step.
5. **GL2 sketch and missing-test count.** Removed the stale claim that noncrystalline
   potentially semistable weight-two lifts are an additional gap: the packet supplies the
   finite-order Weil–Deligne twist to type (C). The genuine unread nonordinary
   `k = p + 1`, `k(ρ̄) = 2` Durham case remains a gap. Corrected the typed-interface gap to
   **53 APIs and 46 tests**; `dyadicDet_smul` occurs only in a comment, so it was wrongly
   counted as present in the checkpoint's 45-test total.
6. **Protocol §12.** Corrected all 56 invalid test kinds to the permitted classifications:
   six CSM, twenty GL2, thirty Global. Computations remain computations; empty/identity cases
   are degenerate; transport/comparison tests are compatibility; other structural cases are
   characterisation. This classification repair does not turn an untyped test into Lean code.
7. **CSM newform sketch.** The pinned Tau Ceti Newform takes a level with `NeZero N`.
   The dependent-sum comment now uses `N : ℕ+`, rather than an unrestricted natural level.
8. **Reviews and receipts.** Preserved the previous review objects verbatim in reviewHistory,
   replaced the current objects with this session's verdicts, and added final suggested-file
   receipts. Preserved the checkpoint's correct finite-order-character and typed-p-star fixes.

## Prior reviews and outstanding work

CSM follows its accepted own-fix review of 7 October and the merged checkpoint. Global follows
its accepted base reviews and the checkpoint. I checked the five #5719 edits for mathematical
errors: locality/strict conjugacy, the integral S₃ matrix example, Gee's full-adjoint mapping
fibre and rank-one two-framing count, and the KW image/adjoint hypotheses. Their separate
red-team-fix review #5720 retains its own finding verdicts.

GL2 follows the never-accepted own review of 30 September and the needs_changes round-two
review. Its fifteen remaining definitions/constructions are still supplier-dependent comments.
A lexer excluding the large supplier-sketch block shows that all **53 APIs and 46 tests** below
lack active signatures/examples. The four typed §8 definitions and arithmetic p-star are excluded.

| Node suffix | Missing APIs | Missing tests |
| --- | ---: | ---: |
| R22.1/minimal-level-data | 4 | 3 |
| R22.1/deformation-to-hecke-map | 4 | 3 |
| R22.1/framed-hecke-module | 4 | 3 |
| R22.2/auxiliary-level-groups | 4 | 3 |
| R22.2/auxiliary-hecke-algebra | 5 | 4 |
| R22.2/taylor-wiles-module-system | 3 | 3 |
| R22.2/dyadic-twists-of-forms | 4 | 3 |
| R22.3/arithmetic-patching-data | 3 | 3 |
| R22.4/ihara-avoidance-comparison | 3 | 3 |
| R22.5/strong-residual-modularity | 3 | 3 |
| R22.6/dyadic-patched-ring | 4 | 3 |
| R32.1/lifting-statement-table | 3 | 3 |
| R32.1/dyadic-lifting-proposition | 3 | 3 |
| R32.1/residually-reducible-lifting-proposition | 3 | 3 |
| R32.1/ordinary-three-lifting-proposition | 3 | 3 |
| Total | 53 | 46 |

Resume those exact nodes under PROTOCOL §13 using real supplier types or explicitly scoped
stand-ins, packet-named APIs and discriminating examples. Under §4, promote API lemmas used
by other nodes into prerequisites: e.g. the auxiliary `γ_α(π_v) ↦ U_v` comparison used by
delta-actions-agree, and framed ring/module properties consumed in patching. The recorded
three bundles (auxiliary-hecke-algebra, framed-hecke-module, delta-freeness-at-taylor-wiles-level)
identify the unsplit constructors/properties. All three roadmaps are target-level plans;
§2 does not require blanket declaration-sized splitting. Only actual imported API lemmas
and the typed-interface obligation are protocol blockers here.

CSM and Global also have legacy supplier-dependent API/test sketches predating this fix.
These accepted fix verdicts do not certify a fresh exhaustive base-plan review. The checkpoint's
exact “131 of 162” Global missing-name count is not repeated: substring occurrence in comments
is not evidence of an active stub. The legacy correspondence needs its own revision or assembly.

Maintainer/external tasks remain explicit: /1 remove the R26.6 → R27.1 stage edge and apply
any R27.1a/b split; /12 narrow R24.4 and remove the “assembled in R24” R22.5/RS-08 text;
/20 reconcile R27.5's RS-06 keep; /22 add L7/L8/G8 → PA.3; /37 reconcile the R04.3 RS-08 keep.
R23.1 must plan CHT's character/completion lemmas, including the finite-order refinement;
other CSM parts must repoint their old KW references; ML.1 must consume R27.6's weight-one chain.
The twenty-nine other owners and /40's exact paper target are in the table. No upstream Tau Ceti
roadmap, source graph or ownership record is modified by this job.

## Validation

- Three `check_blueprint.py` runs with the pinned declaration index: **zero errors and warnings**;
  37 CSM, 73 GL2, 67 Global nodes. Source-version validation and all test-kind checks pass.
- Final `lean-check` for all three Mathlib-only files at the pinned Mathlib: **zero errors**,
  only `declaration uses sorry` warnings: CSM 23, GL2 13, Global 18. Checked memory before
  each, compiled sequentially, and ran no language server or Lake build/cache/update.
  Supplier sketches in comments were not elaborated.
- Declaration registry under both precedence orders, overriding all 177 reviewed nodes:
  27,694 nodes; 2,120 concrete ancestors reached with packets first, 1,024 with decompositions
  first; **no reachable cycles** and no forbidden concrete R26/R27 ancestors of R33.1–R33.4.
  Stage-only references and open requests are not thereby discharged.
- Read-only atlas assembly with all three packets swapped in: 65 added links, no skipped
  links and no cycle. With only accepted CSM/Global swapped in: one added IHG.0 → Global R04.2
  link, no skipped links and no cycle. Nothing was written to the atlas.
- R04.2 → R04.1 and R33.3 → R32.2 back-edges are absent. The coarse R26.6 → R27.1 edge
  still gives R26.1–R26.6 ancestors to R33.2–R33.5. Removing it in memory removes all six
  there, while R33.6 retains them as intended.
- Prior review objects preserved verbatim; forty findings covered exactly once; node IDs,
  partial packet statuses, source-issue verdicts and unchecked implementation statuses retained.
  Final path/intake checks and `git diff --check` pass. No link map or restructuring proposal
  is an issue deliverable, so their dedicated checkers are inapplicable.

## Automation scope mismatch

The live issue #5871 and its full instructions authorize the seven deliverables reviewed here.
The committed queue entry still lists **27 outputs**: thirteen packets, thirteen suggested files
and this report. `issues.deliverables_complete` consequently returns false against the committed
queue, as it did for PR #7024. The same function returns true with the live issue's seven outputs.
This is a completed review of the authorized scope; automatic completion is blocked by the stale
queue definition. A maintainer must reconcile that entry with issue #5871 before intake can mark
this job complete. Editing other jobs' review objects or the queue is outside this issue's allowlist.


## Intake continuation audit, 8 October 2026

Codex session `codex-FXDpCC`, issue #5871, base `4642101e10a075fc258ca4781e463e6b40e80112`.
The three packets, three suggested files and this report were identical to the
completed-review commit `0ca7bd10c` before this audit was appended. This run
rechecked completion and structural validity; it does not claim a new source
review or change the mathematical verdicts above.

All three packet checks again report zero errors and warnings. All 177 nodes
remain unchecked, the packets contain no source excerpts, and the finding table
covers 1–40 exactly once. Unchanged suggested files were not recompiled; the
completed review's successful compilation receipts remain the applicable evidence.

The completion function still returns false for the queue's 27 outputs and true
for the live issue's seven. Ten extra packets correctly name other review jobs.
The parent fix's queue entry is marked done but lists 40 outputs; queue generation
derives the review list from that fix scope. The handoff now gives the exact
seven-output correction, a read-only reproduction, the generation code to
investigate, and the separate intake allowlist restriction on queue edits.
Only the maintainer can reconcile those files within the current issue scope.

## Supplier continuation and blocked intake, 8 October 2026 — codex-CiCHr3

This continuation follows the completed review in [PR #7265](https://github.com/CBirkbeck/tauceti-explorer/pull/7265)
and the intervening intake checkpoints. Re-read all forty finding claims,
their verified evidence, the fix report and the completed finding table. The
table still gives exactly one disposition for each finding. Compared every
authorized packet and suggested file against completed-review commit `0ca7bd10c`:
CSM and Global are unchanged; the only later changes are five GL2 packet edits
and an eleven-line suggested-file block comment in
[PR #7714](https://github.com/CBirkbeck/tauceti-explorer/pull/7714).
This is a continuation of that completed mathematical review, not a claim to
have fetched and reread all of its unchanged primary sources.

### Current changes for /13 and /26

Read the complete supplier nodes
`PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension` and
`R23.1/cht-soluble-prescribed-completions`, and the three GL2 consumers affected
by the new fine prerequisites. Independently fetched the public CHT and KW II
PDFs and read CHT Lemmas 4.1.1–4.1.2 with their proofs, pp. 116–117, and KW II
Definition 7.9 and Lemma 7.10 with its proof, pp. 68–69. Their SHA-256 values
match the CHT and KW II rows in the source table above.

- `allowable-base-change-existence` and `solvable-base-change-reduction` now
  name the prescribed-completion node. CHT Lemma 4.1.2 permits a finite soluble
  Galois extension disjoint from a specified finite Galois avoidance field,
  with all requested Galois local completions. Real completions give total
  reality. A separate auxiliary unramified quadratic completion forces even
  degree; no prescribed global degree is asserted. The quadratic clause
  remains the consumer's weak-approximation argument, with a place split in
  the avoidance field and inert in the constructed quadratic field.
- `lemma-7-10-determinant-adjustment` now names the character-extension node.
  CHT Lemma 4.1.1 itself states continuous extension. Its proof supplies the
  finite-order refinement here: for finite local image, the constructed open
  subgroup has finite-index character kernel, and extension through the
  resulting finite quotient uses divisible roots of unity. Taking the
  p-primary component preserves p-primary local data; no bound on the global
  character order is imposed. For odd p, squaring is invertible on the finite
  p-primary image. For p = 2, local square roots at the designated places and
  at Frobenius representatives give a totally real cyclic ratio-kernel field
  split there and disjoint from the avoidance field, as KW II Lemma 7.10 needs.
- The allowable-base-change locator now names both the statement page 116
  and the proof page 117. The request note correctly keeps the supplier's
  S-unit congruence, reciprocity and ray-class finiteness interfaces open.
  These are planned contracts; the new references do not certify Lean
  implementation or discharge those supplier requests.

These changes are right. They supersede the historical statement above that
R23.1 has not yet planned the two CHT lemmas. The broader /26 finding also has
R23.5 consumers outside this issue; their full review is not certified here.
No change to the inherited verdicts is warranted: **CSM accepted**, **Global
accepted**, **GL2 needs_changes**. The GL2 suggested addition is entirely a
comment. Its fifteen remaining definitions/constructions still lack the
**53 active API signatures and 46 tests** listed above, and the used-API
prerequisite promotions remain necessary. Updated the three top-level review
objects to this session's date and evidence, preserving their previous objects
in `reviewHistory`. This run makes no new mathematical correction.

### Fresh validation

- Re-read all 36 baseline records (35 distinct declarations, since
  `Module.Free` occurs twice) at the exact pinned commits. Confirmed section
  hypotheses, including Maschke, continuous low-degree cohomology and
  `HasRankNullity` for the quotient finrank identity. Re-read the applicable
  reviewed CSM library-audit rows; no GL2 or Global row exists in that audit.
- All three packet checks: **zero errors and warnings**. All 177 nodes remain
  unchecked and packets remain partial. No packet contains an `excerpt` key.
- Sequential fresh `lean-check` runs at pinned Mathlib: **zero errors**, only
  `sorry` warnings (CSM 23, GL2 13, Global 18). Memory was above the required
  threshold before each run. Commented supplier sketches were not elaborated.
- Current declaration registry, forcing the three reviewed packets in both
  packet/decomposition precedence orders: 28,671 declarations, respectively
  2,645 and 1,540 concrete nodes reachable from the 177 roots, **no reachable
  cycles**. No R33.1–R33.4 node acquires a forbidden concrete R26/R27 ancestor.
  This concrete-node check does not discharge stage references or requests.
  The earlier full atlas assembly receipts remain historical evidence; this
  continuation does not claim a fresh stage-graph repair or full assembly.

### Why this submission remains a checkpoint

Reproduced `issues.deliverables_complete`: **false** for the committed review
job's 27 outputs, **true** with only `outputs` replaced in memory by the live
issue's seven authorized files. All outputs exist. The ten additional packets
properly name other review jobs, so their reviewer objects cannot be reassigned
to this review. A `needs_changes` verdict is a completed review outcome and
is not the cause of this failure.

The queue and its generator are outside this issue's editable paths. The
handoff supplies the exact output list and read-only reproduction. At this
base, `make_queue.py`'s `fix_rounds` begins at line 1909, derives review outputs
from `current_outputs` at lines 1940–1944, and can recompute a historical round
instead of keeping `previous_jobs` when `missing` or `sent_back` is true at
line 1955. The fallback at lines 1965–1966 propagates the enlarged output list.
The parent fix is already done but now lists 40 files despite its report's
explicit three-blueprint scope. The maintainer must reconcile both historical
scopes and preserve them through regeneration. This diagnosis is not a tested
generator repair. Further checkpoints alone cannot resolve it.

## Unchanged-input checkpoint, 9 October 2026 — codex-mcC1YQ

Claim confirmed by the bot for [comment 6073551013](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6073551013).
Base `a1104cfa91a4d7c018a57f802e807267dcba3695`. Read the live issue, the
previous report and handoff, and the completion and queue-generation code.
Compared each of the seven live-issue deliverables byte for byte against the
last merged checkpoint, commit `aa5770f7f` (PR #7718): all are unchanged before
this report update. There is no new mathematical diff to review. The existing
packet review objects and verdicts remain untouched: CSM accepted, Global
accepted, GL2 needs_changes. GL2's negative verdict is a completed review
outcome; its next mathematical revision is described above.

Fresh checks of all three packets report zero errors and zero warnings, for
37, 73 and 67 nodes. Verified that all 177 implementation statuses remain
unchecked, no packet contains an excerpt field, and the report gives one
disposition for each finding /1–/40. The three suggested files were not
recompiled because they are unchanged. The preceding run's successful
`lean-check` receipts remain applicable; this run does not claim fresh Lean
compilation, primary-source reading or a graph audit.

Parsed the seven deliverable paths from the freshly fetched live issue body.
`issues.deliverables_complete` returns **false** for the committed job's 27
outputs and **true** with only its outputs replaced in memory by those seven
paths. All 27 files exist. Each of the ten extra packets names another review
job; replacing those reviews would exceed this issue's scope. Both
`research/blueprint/queue.json` and `research/blueprint/make_queue.py` fail
`intake.ALLOWED` and are outside the binding editable-file list.

This is a blocked checkpoint, not another mathematical revision. The exact
seven-output reconciliation, historical parent-fix scope and read-only
reproduction are in the handoff. The maintainer must repair that metadata and
preserve the historical scope through queue regeneration before another
continuation can finish. No scratch file is needed to resume.

## Scope-blocker verification, 9 October 2026 — codex-4L7DNo

The bot confirmed this session's claim at
[comment 6073792886](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6073792886).
Re-read the live issue after confirmation, both protocols, the worker and
upstream guidance, the previous handoff/report, and the completion, intake
allowlist and queue-generation code. All seven authorized deliverables are
byte-for-byte identical to checkpoint PR #7768, commit
`e958deaba4ac4c1565417d6f5cb35c81a969c1e4`, before this report update.
There is no new mathematical diff requiring review.

Parsed the seven authorized paths directly from the live issue. Reproduced
`deliverables_complete(job) = false` for its committed 27-output queue entry
and `deliverables_complete({**job, "outputs": authorized}) = true`.
All 27 outputs exist; each of the ten extra packets correctly names a
separate review job. The parent fix still lists 40 outputs. Neither
`research/blueprint/queue.json` nor `research/blueprint/make_queue.py` passes
`intake.ALLOWED`, and neither is an authorized deliverable. This session
cannot repair the blocking metadata within the binding scope.

Fresh packet checks report zero errors and zero warnings for all three
packets (37 CSM, 73 GL2, 67 Global nodes). All 177 nodes retain unchecked
implementation status; no packet contains an excerpt field; the report has
forty distinct dispositions covering findings /1–/40. Retained CSM accepted,
Global accepted and GL2 needs_changes. A negative review verdict is a
completed review outcome, as the scoped completion result confirms.
The unchanged suggested files were not recompiled; prior successful
`lean-check` receipts remain historical compilation evidence. No fresh
primary-source review, Lean compilation or graph audit is claimed.

This checkpoint changes only the report and handoff. The handoff retains
the exact seven-output correction and historical parent-fix reconciliation,
with a read-only reproduction. Maintainer metadata repair is required before
this job can finish; additional unchanged-input checkpoints cannot supply it.

## Current scope verification, 9 October 2026 — codex-Y6eAq2

The bot confirmed this session's claim at
[comment 6073892388](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6073892388).
Re-read the live issue after confirmation and continued from the merged
handoff. Before this update, all seven issue deliverables are byte-for-byte
identical to PR #7773, commit `18b9d9bb5`. The three packets and suggested
files therefore have no mathematical changes to review since that checkpoint.
This continuation preserves the preceding independent review and its packet
objects; it claims no fresh primary-source or pinned-declaration reading.

Parsed the seven permitted outputs from the freshly fetched issue body.
The committed review still expects 27 outputs, all present, including ten
extra packets whose reviewer objects name other review jobs. The parent
fix still expects 40 outputs. Read the completion function, intake allowlist
and `fix_rounds` generation path, and reproduced these results without
changing any metadata:

- `deliverables_complete(job)`: **false**.
- The same call with only `outputs` replaced by the issue's seven paths:
  **true**.
- Both `research/blueprint/queue.json` and
  `research/blueprint/make_queue.py`: excluded by `intake.ALLOWED` and absent
  from the issue's permitted files.

All three packet checkers pass with **zero errors and zero warnings**.
The packets contain 37, 73 and 67 nodes; all 177 implementation statuses are
unchecked, no packet contains an excerpt field, and the finding table covers
/1–/40 exactly once. Existing verdicts remain CSM **accepted**, Global
**accepted**, GL2 **needs_changes**. The scoped completion result confirms
that GL2's negative verdict is a completed review outcome.

The unchanged suggested files were not recompiled. Their successful pinned
compilation receipts above remain historical evidence. No new graph audit
is claimed. This checkpoint changes only this report and the handoff; the
metadata reconciliation recorded there remains the required next action.

## Intake blocker reconfirmed, 9 October 2026 — codex-kwYBrA

The bot confirmed this session's claim at
[comment 6074053525](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6074053525).
Re-read the issue after confirmation and continued from its merged handoff.
All seven authorized outputs match the merge commit of
[PR #7776](https://github.com/CBirkbeck/tauceti-explorer/pull/7776),
`c2c3c3ad58dd8d62b68d30cb8efd20b8a4947d2f`, byte for byte before this update.
There is no new mathematical change to review.

Parsed the seven paths from the live issue and re-ran the handoff's read-only
completion reproduction. The committed review has 27 outputs; completion is
**false**. Replacing only its output list in memory with the issue's seven
paths gives **true**. All 27 files exist, and the ten extra packets correctly
name other review jobs. The completed parent fix still lists 40 outputs.
Read the completion function, intake allowlist and historical-round generator
path: both the queue and generator are outside this issue's permitted edits
and fail `intake.ALLOWED`. The historical scopes must be repaired by the
maintainer as specified in the handoff.

All three packet checks report **zero errors and zero warnings** (37 CSM,
73 GL2 and 67 Global nodes). Verified all 177 nodes remain unchecked, no
packet contains an excerpt field, and the report's finding table covers all
40 confirmed findings exactly once. Existing verdicts remain CSM **accepted**,
Global **accepted**, GL2 **needs_changes**; that negative verdict is a completed
review outcome, as the scoped completion result confirms.

This blocked checkpoint changes only the report and handoff. The unchanged
suggested files were not recompiled; earlier successful compilation receipts
remain historical evidence. No fresh primary-source reading, pinned-library
review or graph audit is claimed. The next action remains maintainer repair
of the metadata, rather than another unchanged-input continuation.
