# GL₂ Modularity Lifting, R32.3–R32.6: revision 2 handoff

Complete target-level revision for **BP-GL2ModularityLifting--R32.3~2**, issue #6963. Codex, session `codex-F4ACrO`, 8 October 2026. This submission is ready for independent review.

The [packet](../packets/GL2ModularityLifting--R32.3.json), [reader](../readmes/GL2ModularityLifting--R32.3.md) and [suggested file](../suggested/GL2ModularityLifting--R32.3.lean) agree. All 28 reviewed nodes and their mathematical fields are preserved exactly. The packet's existing `review` object and E1's independent confirmation are unchanged, for the next reviewer to replace through the review workflow. Packet status is `complete`; all four scope stages are `planned`, none `closed`. All implementation statuses remain `unchecked`.

## Changes and correction checks

The completed independent [review report](../reviews/REV-GL2ModularityLifting--R32.3.md) identified reader synchronization as its remaining rejection. Each of its six correction groups is now represented in the reader:

1. Pan's pro-modularity uses the actual R31.3 pseudodeformation-to-Hecke quotient, spectrum image and kernel-containment interface. The Eisenstein maximal-ideal assumption and the constructor/characterization APIs for nice and potentially nice primes are explicit. The ordinary SW R21.4 predicate has a different carrier.
2. The obsolete statement-table parts (b), (c), (d) are removed. The arbitrary totally real dyadic proof uses the R04.4 general-field nonsolvable-image preservation request; the Q-only R32.1 lemma is not substituted.
3. At three, normalization chooses the actual unramified ordinary quotient's global residual character and twists by the inverse of its Teichmüller lift. Reversed residual summands are relabelled. The finite coefficient field, ordinary quotient, finite-order determinant character and precise crystalline weight interval are retained. The already corrected R21 supplier is imported without obsolete criticism.
4. The Pan bridge includes R06.2's coefficient/weight argument for absolute local irreducibility. The inherited determinant de Rham, residual-ratio extension and degree hypotheses are explicit. R04.3 supplies prime selection on component intersections without assuming they are finite over the ordinary weight algebra; R03.6 connectedness and R04.4 field selection are direct inputs where needed.
5. DP Definition 1.10's all-member de Rham and common regular weights are extra data on the historical KW compatible-system carrier, with the exact R24.5 request. The source-independence comparison keeps unresolved auxiliary-globalization proofs as an audit obligation.
6. All corrected locators, request consumers, gap consumers, coverage obligations and counts are synchronized. The reader contains 22 API items, including ten concrete prototype APIs. The suggested file's documentation now says explicitly that its `nice` set means potentially nice. Its executable fragment and indexed arithmetic omission manifest are retained.

The confirmed **RT-AREA-langlands-2/21** ownership correction is maintained: R32.6 owns modern transfer at a ramified reducible coefficient prime; R24.6 imports it and keeps its reduction/local-hypothesis statements. This part uses R24.5 and R01.5 without a dependency back through R24.6's bundled transfer node. The accepted RS-08 arrangement is respected. The added BCDT wild 3-adic source is routed to R22.5 in part R22.1, outside this scope.

The source-issue `printed` field for **GL2ModularityLifting/E1** now paraphrases the full determinant condition and its missing qualification. The finite-order correction and independent confirmation remain. The deliverables contain mathematical statements in the planners' own words, locators and bibliographic metadata; they contain no source excerpts. Historical source-reading dates and hashes are preserved, with this revision's recheck date and passages added separately.

## Sources and baseline checked

All nine public PDFs matched their recorded SHA-256 hashes. The following passages were read for this revision; locators use the specified PDF version, except Skinner–Wiles's printed page:

| Source | Passages rechecked |
| --- | --- |
| [Pan, arXiv v2](https://arxiv.org/pdf/1901.07166v2) | Theorem 1.0.2 p.3; Corollaries 3.5.10–3.5.12 pp.31–34; §4.1 pp.38–40; Theorems 5.1.2 and 6.1.2 pp.71,95–96; §§7.1–7.4 pp.111–124; Theorem 8.0.1 and Remark 8.0.4 pp.124–125. |
| [Tung, dyadic v3](https://arxiv.org/pdf/1908.06174v3) | Introduction pp.2–3; §4.3 pp.20–21; Lemma 5.3.2 pp.28–29; §6.3 pp.32–33; §§7.2–7.3 pp.36–37; §8 pp.38–39. |
| [Skinner–Wiles, Numdam](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) | Introduction theorem, printed p.6 / PDF p.3, checked on the page image. |
| [Dieulefait–Pacetti, arXiv v2](https://arxiv.org/pdf/2108.07577v2) | Theorems 1.4–1.7 pp.4–5; Definition 1.10 and Remark 4 pp.6–7; Paso 6 p.14. |
| [Dieulefait–Pacetti, published PDF](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf) | Theorems 1.4–1.7 pp.4–5; Definition 1.10 and Remark 4 p.7; Paso 6 p.14. |
| [Paškūnas, v2](https://arxiv.org/pdf/1509.00332v2) | Theorem 1.1 pp.1–2; §1.1.2 p.5. |
| [Tung, odd-prime v4](https://arxiv.org/pdf/1803.07451v4) | Theorem 4.7 and Remark 4.8 p.15. |
| [Emerton, 2011 draft](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf) | Theorem 3.3.22 p.28; §§7.3–7.4 pp.96–97. |
| [Hu–Tan, v2](https://arxiv.org/pdf/1309.1658v2) | Theorem 6.3 and proof p.35. |

The six reused Mathlib statements were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`: reflexive transitive closure, composition and the no-outgoing-edge characterization; spectrum comap; minimal primes; and their order equivalence with irreducible components. Tau Ceti searches used the git object at `f790474821cf4256814db967cb154e7af3d0c369`. Searches of both pinned libraries did not locate the required arithmetic interfaces. The reviewed library audit, actual R03/R21/R24/part-1 supplier statements, current supplier stage descriptions, touching atlas edges and link maps were checked. The two upstream style documents were Multiquadratic and SemisimpleAlgebras. No restricted source was needed.

## What remains

There are **26 supplier requests**, each with its exact direct consumers in the packet and reader. The two substantive gaps remain:

- **Independent auxiliary-globalization proofs:** R31.6 and R20.6 must audit the named Calegari 3.2, Snowden 8.2.1, KW II 6.1/3.5, Paškūnas 3.29, CEG+16/Emerton–Paškūnas/BLGG13 and Gee 4.4.12 inputs. The read passages identify these leaves but do not certify their uninspected proofs. Pan Remark 8.0.4 and Emerton §7.3's full-Serre paths stay excluded.
- **Arithmetic suggested signatures:** R01/R04/IHG/R06/R21/R30/R31 and the other named exports must supply the actual arithmetic objects, point sets and maps for the omitted signatures and the two prototypes' arithmetic specializations. The packet names all 28 consumers. In particular R24.5 must supply the explicit DP geometric extra-data comparison; system existence is not inferred from the disputed DP Theorem 1.11.

The next review should check synchronization and these honest limits, then replace the retained historical review object. Further supplier development belongs to the owning roadmaps. No source was inaccessible for this revision's correction pass; the uninspected supplier proofs above remain a separate recorded obligation.

## Validation and counts

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R32.3.json`: **0 errors, 0 warnings**.
- Embedded source-issue and source-version validators: passed.
- Reader consistency with every node statement, hypothesis, proof step, prerequisite, source locator, API, test, use and planet: passed. Suggested manifest/API/test name checks, coverage/gap consistency and all 26 request/direct-consumer equalities: passed.
- Exact preservation of the 28 packet nodes and both independent review objects: passed. All nine source hashes: passed. Explicit prerequisite traversal through current packet nodes: acyclic, with 1,818 reachable nodes; stage requests remain unimplemented exports.
- `lean-check research/blueprint/suggested/GL2ModularityLifting--R32.3.lean`: **exit 0**, exactly **17** expected proof-placeholder warnings and no errors or other warnings. The fragment uses only Mathlib imports at the pin. Available memory before compilation: 112 GB.
- `git diff --check`, deliverable-path and private-path checks: passed.

Final counts: **28 nodes** — 23 theorems, three definitions, one construction, one comparison; **22 API items**, **13 unit tests**, **12 planets**, **six baseline declarations**, **26 requests**, **two gaps**, **one confirmed source issue**. The target-level pass is complete; all four stages remain planned.
