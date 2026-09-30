# Red team: Classical Serre modularity, R33.5–R33.6

Codex, session `codex-J6LwjP`, 2026-09-30. Refs #4433. **Complete**: five findings, three medium and two low. I neither wrote nor reviewed the target. Base snapshot: `a172a5d`. The target remains a partial blueprint, with an explicitly conditional external independence audit; this report does not treat that admitted gap as a new error.

## Evidence and scope

Read all eight nodes, their proof steps, prerequisites, acceptance checks, fifteen source excerpts, six requests, gap, coverage and independent-review corrections, together with the README, suggested Lean, handoff and review report. Checked the assigned roadmap stages, relevant supplier/consumer contracts, RS-06 ownership, reviewed library audit and finer supplier packets. The findings' full identifiers and actionable corrections are in the accompanying result JSON.

The two PDFs were read on 2026-09-30:

| Source | Version and passages read | Reproduced SHA256 |
|---|---|---|
| [Dieulefait–Pacetti](https://arxiv.org/pdf/2108.07577v2) | v2, 3 May 2022; Introduction; Theorems 1.4–1.11, Definition 1.10, Remark 4; §3 | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |
| [Khare–Wintenberger I](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | authors' preprint; §§1/1.1, compatible-system definitions in §5 and Theorem 5.1, physical pp. 2–3, 8–9 | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |

The UCLA host failed certificate verification in this environment; I retrieved the public PDF with certificate verification disabled and checked its exact recorded hash. All fifteen packet excerpts match their cited pages after normalising ligatures, whitespace and punctuation. This checks the cited preprint versions, not a separate journal edition.

Positive library evidence was read directly at the two required commits:

- [Mathlib modular forms](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean#L74): the full `ModularForm` and `CuspForm` structures.
- [Tau Ceti old/new spaces](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L103): `TauCeti.cuspFormsOld` and its actual cusp-form carrier.
- [Tau Ceti multiplicity one](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean#L87): `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`, with fixed level, weight, nebentypus and agreement at **all** coprime indices outside a finite set. It is not cited as an arbitrary-level or prime-only comparison theorem.

## 1. The modern export imports the classical proof — medium

The statement and suggested Lean correctly intend a theorem parameter `h : StrongSerre`. The dependency list instead includes both the unconditional classical theorem and its unconditional finite-flat consequence. A concrete path is:

```text
R33.6/elliptic-curve-export-via-either-route
  -> R27.6/full-classical-serre-theorem
  -> R27.4/theorem-1-2
  -> R27.3/double-induction-assembly
```

Going through the other listed export has the same problem. The source theorem is true; the error is in the promised proof route. A reference to a theorem's statement in prose can be harmless, but a `prerequisites` edge is an actual construction dependency under PROTOCOL §3.

I rebuilt the local graph from `data/decompositions/ClassicalSerreModularity.json`, overlaid with the nodes in all three `ClassicalSerreModularity--*.json` packets, then recursively followed `prerequisites`. External references were retained as terminal references, not expanded into completed-stage dependencies.

| Starting node | Distinct references reached | References in R26 or R27.2–R27.6 |
|---|---:|---:|
| R33.5/qualitative-serre-theorem | 44 | 0 |
| R33.6/strong-form-by-the-modern-route | 52 | 1: minimal-lifts refinement |
| R33.6/elliptic-curve-export-via-either-route | 116 | 34 |

Separate the shared proposition and the conditional export from either proof, preserve R27.6's ownership, and instantiate the conditional result here with the modern proof. Test the export's closure after that change. Merely removing one classical edge leaves the other path.

## 2. Irreducibility across coefficient characteristics needs a bridge — medium

The auxiliary-prime lemma quantifies over an almost strictly compatible system through the dyadic lift. Its second proof step invokes Chebotarev/Brauer–Nesbitt directly from reducibility of a p-adic member to reducibility of the 2-adic one. First one needs continuous 2-adic companions of the two p-adic characters. An abstract change of algebraically closed coefficient fields does not preserve the relevant topology; equality of Frobenius polynomials does not perform that construction.

The distinction is visible in DP Remark 4: Deligne's companion system is supplied before the same-prime comparison. For the present inference, classify the geometric rank-one characters over Q and construct their companions, including the determinant character, before comparing at 2. This is a supplier result for R24, not a new definition in this packet. R24.6/residual-members assumes characteristic-zero irreducibility; it cannot justify it.

There is a simpler adequate repair for this application: choose the KW I Theorem 5.1 system, which explicitly supplies oddness and irreducibility of every member. `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems` already records exactly that interface. Narrowing the auxiliary lemma to this supplied system avoids the overgeneral proof step. Do not confuse this issue with residual irreducibility: the residual reduction may be reducible, and the packet correctly keeps that branch.

## 3. Use the existing finer supplier interfaces — medium

The current snapshot has exact supplier nodes behind several broad stage requests. This is a present closure/traceability problem; some suppliers are newer partial checkpoints and their presence is not evidence that the original worker ignored them.

| Need | Existing supplier to use |
|---|---|
| Dyadic prescribed lifts | R24.3/theorem-5-1-part-1-minimal-crystalline and /theorem-5-1-part-2-weight-two |
| Compatible-system existence | R24.5/dieulefait-families, or /kw-theorem-5-1-systems for the narrower repair above |
| DP Remark 4 | R24.6/linked-systems-modularity-transfer |
| Independence audit | GL2ModularityLifting:R32.6/globalisation-dependency-audit |
| Exact newform definition of modularity | AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular |

The R24.6 request currently bundles system **existence** with modularity **transfer**, obscuring the former's R24.5 supplier. The R32.6 audit is partial: it still identifies unaudited inputs in Tung's global construction and Gee's prescribed lifts. Referencing its node must preserve those obligations, not turn an existing plan into a completed independence proof. Similarly, retain unmatched requests; the R20.6 case table alone is not a proof of every requested weight-four optimisation, and R17.6's input remains needed.

## 4. The README retains a rejected independence claim — low

The review corrected the JSON's assertion that KW dependence starts exactly at the scalar dyadic exception. The README's two-routes paragraph still says that. It should distinguish shared KW lift-existence input, the minimal-lift refinement actually chosen in the plan, and the historical fact that the scalar dyadic refinement was the missing case. KW I §1.1 supports the last assertion, not the stale stronger claim.

The source-issues paragraph also needs its cross-reference updated: revised nodes explicitly cite E9 in part R27.3, while the README mentions only E3–E7. No new source erratum is alleged here.

## 5. Modular forms exist at the pins — low

The Lean preamble says that modular forms are absent. The pinned structures and newform theorem above contradict that statement, as does the reviewed R27.6 audit. Qualify the missing part to the residual Galois/modularity interface. Keeping the theorem signatures commented is appropriate until that interface exists; these positive library witnesses do not formalise Serre's theorem.

## Checks that did not produce findings

- The bound p > 3 and the reducible branch use p ≥ 5 correctly. The nonsolvable dyadic closure needs dyadic **lift existence**, not an unnecessary application of the dyadic modularity lifting theorem. The solved odd-characteristic theorem supplies the other branch.
- Crystallinity outside S is supplied by DP Definition 1.10(4); the almost-strict exception affects the Weil–Deligne comparison and does not delete conditions (1)–(5) in DP's definition.
- The theorem parameter's **mathematical** finite-flat consequence retains the p ≥ 5 character step. R27.6/finite-flat-weight-two-export explicitly calls Carayol; it does not infer equality of nebentypus from equality of its residual character alone. No extra p-coprimality-to-phi(N) restriction is imposed by this report.
- The globalisation gap is declared, not concealed. The local closure counts above do not settle that external audit.
- No definition/construction nodes occur, so no missing definition API/unit-test finding applies. The four Lean examples are finite arithmetic/matrix checks, and are not evidence for the Galois assertions. The three theorem planets and second-proof ownership are consistent with this part's scope.

`check_blueprint.py` reports zero errors and zero packet warnings; it separately reports no installed declaration index, and the target has no baseline references. Intake `check-files` and `git diff --check` pass. I did not compile Lean: no existing build at the required pins was available, and no build, cache download or language server was started. The earlier review's compilation claim is not a new compilation claim by this worker.

**Submission tooling defect:** the required `check_redteam.py` CLI reports six errors because its `name = path.name.split(".")[0]` truncates the mandated job ID at `R33.5`, expecting `RT-BP-ClassicalSerreModularity--R33`. This is unrelated to the five findings. Calling the existing `check(result, "RT-BP-ClassicalSerreModularity--R33.5")` function returns an empty error list. The submission workflow invokes the affected CLI, so it also needs the parser repair before this PR can pass. I kept the correct issue-mandated filenames and IDs and did not edit the checker outside the two-file job scope.

The maintainer's repair should remove the known suffix `.result.json` or `.review.json`, preserving dots within the job ID. In the review branch, `path.with_name(f"{name}.result.json")` then locates the correct companion automatically. Regression cases should cover both a dotted result and its review, alongside an ordinary undotted job. This report's mathematical review is complete; automatic intake is pending that tooling repair.
