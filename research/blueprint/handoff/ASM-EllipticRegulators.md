# Handoff: ASM-EllipticRegulators (issue #6418)

This job assembles the roadmap *Elliptic regulators, explicit K₂ classes and L-values* from its nine reviewed parts:

- ER.1–ER.8, written by BP-EllipticRegulators and accepted by REV-EllipticRegulators. Its Fourier nodes were later revised by FIX-RT-AREA-combinatorics~2, accepted by REV-FIX-RT-AREA-combinatorics~2, and its supplier boundaries by FIX-RT-AREA-ktheory-2~2 (commit 0ba7ef0).
- One follow-up part per layer, BP-EllipticRegulators--ER.1 to --ER.8, each reviewed by the matching REV job on 5–6 October 2026. Seven reviews accepted their part; REV-EllipticRegulators--ER.7 returned `needs_changes` (see below).

Worker: Claude, session claude-ITrolO. I took no part in any of the parts or in their reviews.

## Files

- `research/blueprint/readmes/EllipticRegulators.md`: the full roadmap document. It replaces the parent packet's document, which was a field-by-field dump of that packet.
- `research/blueprint/suggested/EllipticRegulators.lean`: the nine suggested files joined into one. It replaces the parent packet's file.
- `research/blueprint/handoff/ASM-EllipticRegulators.md`: this note.

The part packets are not deliverables of this job (`queue.json` lists only the three files above), and they are unchanged. Editing them would put non-deliverable paths in the pull request, and it would change files that have already been reviewed. The edits they need are listed below for a job that owns them. ASM-HabiroCyclotomicCompletions, ASM-HabiroRings and ASM-WeilConjectures made the same choice.

## What was done

**The roadmap document** is generated from the nine packets as their reviews left them, so it agrees with them node for node.
- **Coverage.** All 151 nodes are there (75 in the parent packet; 7, 5, 4, 11, 10, 11, 16 and 12 in the parts), with every statement, hypothesis, proof outline, API item (240), unit test (165), acceptance check, use, dependency, Lean record, certificate and source.
- **Scripted check.** Every node id, API and test name, prerequisite, request, gap, source issue, restructure entry and baseline declaration appears in the document, and all 236 source excerpts appear verbatim with their locators.
- **The parts' reader instructions.** Several reviews (ER.1, ER.2, ER.4, ER.5, ER.6, ER.7 and ER.8) asked that their part's reader be brought in line with the corrected packet at assembly. Generating the node text from the packets does this, so no part document's node text is reused.
- **New sections.**
  - An introduction: purpose and scope; boundaries, covering suppliers, consumers, owner decisions (RS-03, RS-06, RS-14, RS-18), confirmed red-team findings and reviewed links; conventions, with the dictionaries between the parts' normalisations; sources, with every alias id, version, hash and section read; the 120 pinned declarations; and a layer overview.
  - A written overview for each layer, saying what the parent plans, what the part adds and what is still open; the coverage records of both; and, for ER.3, ER.7 and ER.8, the part's target table.
  - Closing sections that merge the 32 source issues, the 29 gaps (each parent gap with a status line), the 75 requests (each parent request with a status line) and the 18 structural proposals (each with a status line). They also give the layer dependencies, with the node edges the atlas does not draw, and a list of what the blueprint does not claim.
- **Assembly notes.** Many nodes are followed by an **Assembly note**. A note carries a part's import record or proof-closure record, or a reviewer's instruction, into the parent node it concerns. No note changes a packet. They cover:
  - the ER.1 part's replacement of the deck-group alias by supplier contracts;
  - the ER.2 C5 correction and the ER.6 request for the Betti ℚ-structure;
  - the ER.3 and ER.4 parts' new proofs of three parent nodes;
  - the five ER.5 review instructions, including Γ_op = −Γ;
  - the ER.6 local-descent proof;
  - the ER.7 proof-closure records and qualifications;
  - the ER.8 refinements of the parent examples, including the 11a3 normalisation ω0 = (dx/(2y + 1))/Ω^+.
- **ER.7 planets.** As the ER.7 part's accepted rescope asks, the two inherited planets "Modular units u_f" and "Modular-unit symbols in K2(X1(N))" are not shown, and each node says why. Every layer shows at most six planets, 41 in all: ER.1 6, ER.2 4, ER.3 5, ER.4 6, ER.5 4, ER.6 6, ER.7 6, ER.8 4.
- **Notation.**
  - The ER.1 and ER.8 parts write Greek letters and operators in ASCII (omega, tau, gamma1, integral_, sum_, ->, *). Their prose is printed in the notation of the other parts (ω, τ, γ1, ∫_, Σ_, →, ·), with plain digits as in the parent (γ1, ω1). A masking step protects node ids, every packet name, Lean-style identifiers, code spans, URLs and excerpts.
  - Single capitals (Q, R, Z, C) are left as written, because C is also Bloch's level. The Conventions section records this.

**Cross-part prerequisites.**
- Every prerequisite of a part that points into another packet names an existing node id: 90 references into the parent packet, 3 from ER.5 into the ER.4 part, and 4 and 5 from ER.8 into the ER.1 and ER.2 parts. The parent packet never refers to the parts.
- The node graph of all nine packets is acyclic, also through every node of every packet on main that it reaches.
- Ten node prerequisites run to a layer that the atlas does not place upstream: ER.5, ER.6 and ER.7 → ER.8, and ER.6 → ER.7. None closes a cycle. Promotion draws no stage edge for a prerequisite in the same roadmap (`scripts/blueprints.py`). The ER.8 part's red-team disposition says its ER.5 imports give the ER.5 → ER.8 edge "under promotion"; that holds only for the E.6 → ER.8 edge. The document records this under Dependencies.
- Three parent nodes are proved by part nodes that they do not cite; the fixes are items 1–3 below.

**`check_blueprint.py`** (with the pinned declaration index) reports 0 errors and 0 warnings on all nine packets, which are unchanged. `intake.py check-files` passes on the three deliverables.

**The Lean file.**
- **Layout.** One standard note, one import block (the union of the nine, 50 Mathlib modules; no Tau Ceti imports) and one root namespace, `TauCeti.EllipticRegulator`. For each layer the parent's declarations come first, then the part in its own section; each part's scope and boundary notes are kept in its section docstring, together with the namespace change and the replacements made.
- **Namespaces.**
  - The ER.2 part's root `TauCeti.EllipticRegulators` becomes `TauCeti.EllipticRegulator` (keeping `Archimedean`).
  - ER.6's `TauCeti.EllipticRegulators.ER6` becomes `TauCeti.EllipticRegulator.ER6`.
  - ER.7's `EllipticRegulators.Modular`, which lacked the `TauCeti.` prefix, becomes `TauCeti.EllipticRegulator.Modular`.
  - The working namespaces `BP_ER4` and `BP_ER5` become the root that their packets record.
  - Relative names are unchanged (item 12 below).
- **Part-local copies replaced by the parent's objects.** Each pair was checked to be the same object.
  - ER.4: `torsionFourier` → `finiteFourier10`, `q` → `qParameter`, `character` → `torsionFourierCharacter`.
  - ER.5: its copies of `T`, `pairingO`, `fourierO` and `finiteFourier10` are dropped in favour of the existing ones.
  - ER.3: `complex_fourier_coefficients` uses the parent's `ellipticDilog` and `ellipticJ`.
  - ER.4's coordinate abbreviations (`T`, `x`, `w`, `B`, `H`, …) move with the part from its working namespace `BP_ER4` into the root namespace that the ER.4 packet records. An implementation may make them local.
- **Tau Ceti.** The shared build has no Tau Ceti object files, so ER.8's two `TauCeti.*` imports are removed.
  - `genericX` and `genericY` are restated over Mathlib's `WeierstrassCurve.Affine.FunctionField` as `ER8.genericX` and `ER8.genericY`. Their docstrings name the pinned Tau Ceti declarations that an implementation should use.
  - The two declarations that need Tau Ceti's places and Weil divisors (`quadraticFunctionT_principal` and its test) are a comment block that gives their signatures verbatim.
  - The original ER.8 file had never elaborated in the shared build. Its Mathlib-only form elaborates.
- **Names.** Every node id, API name, unit-test name and declaration name of the nine packets appears in the file, as a declaration under the namespaces above or, where a part records the signature as omitted, in that comment. Node ids that no original file mentioned are marked by `-- Packet node` comments. Nothing present in an original file is lost. No statement is `True`, and no `Prop`-valued placeholder is used.
- **Elaboration.** `lean-check` at the pinned Mathlib 082e2d3 exits 0. Its only warnings are 343 `declaration uses 'sorry'`. The originals give 69 + 52 + 27 + 18 + 29 + 24 + 25 + 42 = 286, and ER.8 adds 57; its two commented declarations account for the difference from its 59.

## The ER.7 part's review

REV-EllipticRegulators--ER.7 corrected the ER.7 packet in place and returned `needs_changes` for one reason only: the part's reader lagged the corrected packet. The review asks the orchestrator to give a revision the definitive reader as a deliverable, and to obtain a fresh independent acceptance.

This document is that definitive reader, generated from the corrected ER.7 packet. Each row of the review's synchronisation table is carried as follows:
- full-level integrality: `ER.7/full-level-modular-symbol-integrality`, with S.6 and the proper smooth-fibre units;
- the integral Beilinson subspace, the adjointness and the elliptic regulator line: their corrected statements, prerequisites and the R13.6 request;
- the Siegel proofs: the closure record and the Assembly note on `ER.7/kronecker-limit-formulas`;
- the inherited pushforward: the closure record and the Assembly note on `ER.7/regulator-under-finite-pushforward`;
- the supplier overview: the Boundaries section and the ER.7 overview;
- the R13.6, R16.5 (AL.3) and PS.1 requests, the last without 2πi: the Requests section;
- G2 and G6: the Gaps section.

The ER.7 packet's review status is still `needs_changes`, and I did not change it. **For the orchestrator:** the ER.7 packet needs a fresh independent review, with this document as its reader, before it can be promoted.

## Edits the part packets need (not deliverables here)

No reviewed mathematics changed in this job: no node statement, hypothesis, prerequisite or verdict of any packet was edited. Items 1–7 are the edits the part reviews asked the assembly to make in the parent packet; the document carries each as an Assembly note. Every added prerequisite below was checked to keep the node graph acyclic. Items 6, 7 and 9 change node text, so a re-review of those nodes is needed.

1. **`ER.3/fourier-and-kronecker-eisenstein`.** Add `ER.3/complex-fourier-reconstruction` to its prerequisites. The ER.3 part proves the complex identity directly, which answers source issue E3. Mark the parent's fourth gap answered for this node.
2. **`ER.3/steinberg-relation-on-the-projective-line`.** Add `ER.3/relative-projective-line-chow-bridge`; it proves the D-part, which is the parent's third gap except for collation with Lectures 5–6.
3. **`ER.4/bloch-theorem-10-2-1`.** Add `ER.4/direct-regularized-fourier-identity`, as REV-EllipticRegulators--ER.4 asks; its proof is the direct route times C³. The parent's fourth gap is then answered.
4. **ER.5** (REV-EllipticRegulators--ER.5's five instructions):
   - `ER.5/the-CM-setup-and-the-hecke-character`: the API item `cmHeckeCharacter_conductor` should read f̄O = fO (ideals); replace the stage prerequisite `AutomorphicLFunctionsAndLocalFactors:AL.1` and the parent's AL.1 request by the nodes `AL.1/unramified-local-theory` and `AL.1/ramified-local-theory`, with the unitary convention ψ(P)/N(P)^{1/2} at s − 1/2.
   - `ER.5/the-class-U`: state the real-structure compatibility of the chosen uniformisation in the descent API and tests, and that the Galois group acts through the ray representation (not necessarily all of it).
   - `ER.5/the-L-value-theorem`: add `ER.5/unit-factor-cancellation-certificate`, and name Γ_op = −Γ beside the printed-kernel sign.
   - `ER.5/nonvanishing-and-what-is-not-claimed`: replace `mathlib:EulerProduct.exp_tsum_primes_log_eq_tsum` by `ER.5/cm-ideal-series-at-two`, and remove the request to Tau Ceti ArithmeticDirichletSeries layer 0.
5. **ER.7 planets.** Remove the `planet` of `ER.7/modular-units-and-their-divisors` and of `ER.7/symbols-of-modular-units-in-K2`. Today the ER.7 layer has eight planets across the two packets; the checker enforces the limit of six only per packet.
6. **`ER.1/periods-and-the-comparison-isomorphism`.** Replace the deck-group alias and the imported-comparison part of the statement by the C5, C6 and AlgebraicTopology contracts of the ER.1 part, as its accepted restructure entry asks, and remove the gap 'Hurewicz comparison for the first homology of a torus'. This is a statement change.
7. **The remaining parent nodes.**
   - **`ER.6/potentially-good-reduction-integrality`.** Cite `ER.6/potentially-good-integrality-by-local-descent` as its proof. Replace the S.3 prerequisite and request by `SchemeKTheoryOperations:S.4/residue-composite-vanishes`, as that packet proposes. Remove the parent's fifth gap.
   - **`ER.2/the-deligne-cohomology-target`.** Replace the stage `ComplexComparisonPartII:C5` by the node `C5/repair-proper-de-rham-betti`.
   - **`ER.7/manin-drinfeld`, `regulator-under-finite-pushforward` and `the-pushforward-and-its-hypotheses`.** Add the prerequisites named in the ER.7 part's `inheritedProofClosures`: `cuspidal-hecke-separation`, `elliptic-regulator-adjointness` and `modular-elliptic-regulator-line`. Qualify the Galois-orbit descent step and the reduction to symbols {f, φ^*g}. Correct the description of Siegel's second limit formula in `ER.7/kronecker-limit-formulas`.
8. **The parent's gaps and coverage.**
   - **Gaps.** Gaps 2, 4, 5, 6, 9 and 11 are answered by the parts; gaps 3, 7, 8 and 10 are partly answered. The document's Gaps section gives each status.
   - **Coverage.** The parent's eight coverage records still read `partial`, with remaining items that the parts answer or restate; the parts' `planned` records are current.
9. **The source-issue id clash.** `EllipticRegulators/E24` is used twice: by the ER.2 part (Nekovář, H¹(U(ℂ), ℝ(2)) for ℝ(1)) and by the ER.7 part (Schappacher–Scholl 3.1.8, the residue φ(k)/w(k, K) for w(k, K)φ(k)). `research/errata/REGISTER.md` and `data/source-issues.json` carry both under the same id. Renumber the ER.7 finding `EllipticRegulators/E30`, the next free number after the ER.8 part's E28 and E29.
10. **The parent's fifth restructure entry** (ER.5's stage text) cites "EllipticRegulators/E1–E3" for the false formula; the findings are E7–E9.
11. **The parent packet's last edit.** The parent packet's supplier-boundary edit by FIX-RT-AREA-ktheory-2~2 (0ba7ef0) has no finished review for this packet: REV-FIX-RT-AREA-combinatorics~2 says it does not accept it, and REV-FIX-RT-AREA-ktheory-2~2 is pending and lists other packets. The document prints the packet as it stands.
12. **Namespaces.** For the packets to agree with the joined Lean file:
    - ER.2: `library.namespace` becomes `TauCeti.EllipticRegulator`; its names are relative and do not change.
    - ER.6: `TauCeti.EllipticRegulators.ER6` becomes `TauCeti.EllipticRegulator.ER6`, in `library.namespace`, in 11 qualified API and test names and in the `leanName` and `leanNames` fields.
    - ER.7: `EllipticRegulators.Modular` becomes `TauCeti.EllipticRegulator.Modular`, in `library.namespace`, in 42 qualified API and test names and in the `declarationName` fields.

## Structural proposals of the parts

All 18 are given in full in the document's "Structural proposals" section, each with its status.

| Proposal | From | Status |
|---|---|---|
| ER.1 keeps only the lattice-choice specialisation (RS-06) | parent | settled by RS-06; ER.1 stage text to say the uniformisation is imported |
| ER.2 specialises P.5's η and M.8's Deligne complex | parent | applied; stage-text amendment and early M.8 prefix awaited |
| ER.3 stage text conflates J_q with its regularisation | parent | stage-text edit awaiting the maintainer |
| Bloch readable; Brunault second source | parent | note; applied |
| ER.5's stage text pins a false formula | parent | awaiting the maintainer (the stage text still shows the printed (11.2.4)); cites E1–E3 for E7–E9 |
| Siegel units are KatoEulerSystems L0's | parent | settled by RT-AREA-ktheory-2/6 |
| ER.8 certificates are EllipticKTheory E.8's | parent | applied |
| p-adic elliptic integrals are ColemanIntegration L1's | parent | applied |
| ER.5 and ER.7 stage texts should classify their conclusions | parent | stage-text edit awaiting the maintainer |
| M.8 must not take ER.2's identifications back | parent | open; waits for the M.8 split |
| Early foundations before comparisons (RT-AREA-ktheory-2/7, 18, 24) | parent | maintainer note; open |
| Imports and retained elliptic work (RT-AREA-ktheory-2/5–12) | parent | record; applied |
| C5/C6 own the comparison; PS.0 uses C6 | ER.1 | applied here by an Assembly note; PS.0 has no packet |
| Split an early archimedean foundation from M.8 | ER.2 | awaiting the maintainer |
| AC.0 → ER.4 | ER.4 | settled by RS-03 |
| Import CM theory and correct the Bloch specialisation | ER.5 | applied; stage text awaited |
| Replace the ideal-series request by the pinned library result | ER.5 | applied in the part; parent request obsolete |
| Kato L0/L1 ownership; six ER.7 planets | ER.7 | ownership settled; planets applied in the document, packet edit item 5 |

## Requests of the parts

The nine packets file 75 requests, all tabulated in the document's Requests section with their consumers. The parent's requests carry status lines: refined by a part, replaced, or still open.

| Supplier | Requests | From |
|---|---|---|
| ModularCurvesPartII (R12.1, R12.3, R12.5, R12.6, R13.5, R13.6, R14.1, R14.6) | 12 | parent, ER.1, ER.7 |
| ComplexMultiplicationAndExplicitReciprocity (CM.1, CM.2, CM.4) | 8 | parent, ER.5, ER.8 |
| ComplexComparisonPartII (C5, C6) | 5 | parent, ER.1, ER.2 |
| Tau Ceti EllipticCurves layers 0, 1, 2, 3, 4 | 5 | parent, ER.6 |
| Tau Ceti GlobalNumberFields layers 9, 10 | 4 | parent, ER.5 |
| Tau Ceti ModularForms layers 0, 7, 8 | 4 | parent, ER.7 |
| KatoEulerSystems (L0, L1) | 4 | parent, ER.7 |
| MotivicEtaleKTheory (M.8, early prefix) | 3 | parent, ER.2, ER.7 |
| EllipticCurveModularity (R29.5, R29.6) | 3 | parent, ER.6 |
| GL2AutomorphicRepresentationsAndTransfer (R16.2, R16.4, R16.5) | 3 | ER.7 |
| PadicHodgeRegulators (D.2, D.5) | 3 | parent, ER.8 |
| ModularSymbolsPadicLFunctions (L1, L2) | 2 | parent |
| ColemanIntegration (L1) | 2 | parent, ER.8 |
| GrossZagierAndArithmeticHeights (GZ.2) | 2 | parent, ER.3 |
| Tau Ceti AlgebraicTopology stages 5, 6 | 2 | ER.1 |
| AutomorphicLFunctionsAndLocalFactors (AL.1, AL.3) | 2 | parent |
| one each: AdditiveCombinatorics AC.0, NeronModelsAndSemistableAbelianVarieties R11.6, SchemeKTheoryOperations S.3, WeilConjectures WC.5 and Tau Ceti AlgebraicCurves layer 12, ArithmeticDirichletSeries layer 0, JacobianChallenge layer F, StableReduction layer 5 (parent); PeriodsAndSpecialValues PS.1 (ER.7); EllipticKTheory E.6 and EllipticRegulators ER.2, internal (ER.6) | 11 | parent, ER.6, ER.7 |

No packet of another roadmap files a request with this roadmap or cites its nodes or layers as prerequisites. The one request with an ER supplier is internal: the ER.6 part asks ER.2 for the Betti ℚ-structure, and no node supplies it yet.

## For the maintainer

- **Stage texts.** Several atlas stage texts lag the accepted packets:
  - ER.1: the uniformisation is imported;
  - ER.2: the imports from P.5 and M.8;
  - ER.3: J_q versus J(q; ·);
  - ER.5: it still displays Bloch's printed (11.2.4) and kernel, which are false;
  - ER.5 and ER.7: the classification of their conclusions.

  The document's Structural proposals section gives the replacement texts.
- **Declared stage edges.** Add ER.5 → ER.8, ER.6 → ER.8, ER.7 → ER.8 and ER.6 → ER.7, so that the atlas shows the node dependencies the packets record. RT-AREA-ktheory-2/10 asks for the first. Promotion will not add them.
- **The early prefix of MotivicEtaleKTheory M.8** (real Deligne complex and universal regulator, with no ER input) is needed by ER.2, ER.6 and ER.7, and nothing plans it yet.
- **Suppliers without packets.** PeriodsAndSpecialValues has no packet, yet ER.7 cites PS.1 and the ER.1 part's proposal concerns PS.0. GL2AutomorphicRepresentationsAndTransfer R16.2, R16.4 and R16.5 have no packet either.
- **The superseded part documents.** `readmes/EllipticRegulators--ER.1.md` to `--ER.8.md` describe their packets before review corrections and are superseded by the assembled document. They are not this job's files and were not edited.
