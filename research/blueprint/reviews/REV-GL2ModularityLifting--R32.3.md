# Independent review: GL₂ Modularity Lifting, R32.3–R32.6

**Verdict: needs_changes. Review completed.** Codex, session `codex-E1KQI4`, 6 October 2026. Refs #413. Reviewer identifier: `independent-review-REV-GL2ModularityLifting--R32.3`.

The packet and suggested file have been corrected in place. The remaining reason for this verdict is the reader document: it repeats the former statements and dependencies and is not an authorized deliverable of this review. The synchronization list below is concrete. This is a finished independent review, not a time-limit checkpoint.

The original complete pass was written by `codex-aAQwqQ` (BP handoff; merged #6741), continuing two earlier Claude checkpoints. This session wrote none of that work. Reviewed inputs are [the packet](../packets/GL2ModularityLifting--R32.3.json), [suggested Lean file](../suggested/GL2ModularityLifting--R32.3.lean), and [reader](../readmes/GL2ModularityLifting--R32.3.md). Binding instructions, upstream guide, reviewed library audit, current supplier packets/stage descriptions and accepted ownership arrangements were read.

## Counts and coverage

| Item | Result |
| --- | --- |
| Nodes | 28: 23 theorems, 3 definitions, 1 construction, 1 comparison |
| Node checks | 8 verified, 20 corrected, 0 added, 0 unverifiable |
| Source references | 42 after splitting the mixed SW/DP citation; all checked |
| Source files | 9; every downloaded PDF matches its recorded SHA-256 |
| Baseline | 6 declarations confirmed; 0 removed or replaced |
| API items | 16 → 22 |
| Unit tests | 13; every definition/construction has at least 3 |
| Planets | 12, within the stage limits |
| Supplier requests | 24 → 26; all consumer lists reconciled with direct edges |
| Direct prerequisites | 43 internal nodes, 13 other-packet nodes, 81 stage exports, 6 baseline references |
| Packet / stages | Complete target-level pass; all 4 stages planned, none closed |
| Gaps / source issues | 2 honest open gaps; 1 source finding confirmed |

R32.3 has typed specialization, totally real dyadic lifting and its Q consequence. R32.4 has the nice-prime bridge, all three local residual-ratio cases, seeded component connectivity, nonsplit-extension geometry and the nonordinary Hilbert theorem. R32.5 has the ordinary p=3 theorem, quotient-character normalization and crystalline weights 2/4 completion. R32.6 has all transfer branches, the ramified reducible coefficient-prime entry, compatible-system recognition and the source-independence comparison. These realize the current stage targets at target level; this review does not subdivide their source proofs into a lemma-level blueprint.

The auxiliary-globalization proof audit and missing arithmetic carriers remain recorded obligations. Neither alone forces rejection of a complete target-level pass under the issue's acceptance rule. The carrier gap now names every arithmetic consumer, including the two prototypes' arithmetic specializations; R32.5's remaining signature obligation is explicit. No declaration is marked implemented.

## Sources

The following public texts were independently obtained. Existing hashes and historical reading dates were preserved; this review's readings are recorded here. Page references are PDF pages unless stated otherwise.

| Source | Passages checked |
| --- | --- |
| [Pan, arXiv v2](https://arxiv.org/pdf/1901.07166v2) | Theorem 1.0.2 p.3; pseudo-representation reconstruction and comparison statements; Theorem 3.5.5, Corollaries 3.5.10–3.5.12 pp.29–34; complete §4.1 pp.38–40; ordinary theorems pp.71,95–96; §7.1–7.4 pp.111–124 and §8 pp.124–125. |
| [Tung, dyadic v3](https://arxiv.org/pdf/1908.06174v3) | Introduction pp.1–3; globalization pp.20–21; typed support/finiteness pp.28–29; Colmez finiteness/near faithfulness pp.32–33; ordinary construction pp.36–38; Theorems 8.0.1,8.0.3 and global proof pp.38–39. |
| [Skinner–Wiles, Numdam](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) | Introduction theorem, **printed p.6**, read from the scan rather than unreliable OCR; all three conditions and finite-order ψ. |
| [Dieulefait–Pacetti, arXiv v2](https://arxiv.org/pdf/2108.07577v2) | Theorems 1.4–1.7 pp.4–5; Definition 1.10 and Remark 4 pp.6–7; Paso 6 p.14. |
| [Dieulefait–Pacetti, published PDF](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf) | Lifting statements pp.4–5, Definition 1.10/Remark 4 p.7, Paso 6 p.14, compared with the preprint. |
| [Paškūnas, v2](https://arxiv.org/pdf/1509.00332v2) | Theorem 1.1 **pp.1–2**, including its local exclusion on p.2; §1.1.2 p.5. |
| [Tung, odd-prime v4](https://arxiv.org/pdf/1803.07451v4) | Theorem 4.7 and Remark 4.8 p.15: residual modularity remains a hypothesis and the theorem includes p=3. |
| [Emerton, 2011 author draft](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf) | Theorem 3.3.22 p.28; §7.3 p.96 and §7.4 p.97: distinguish unconditional promodularity from the weight-part use for an auxiliary known modular representation. |
| [Hu–Tan, v2](https://arxiv.org/pdf/1309.1658v2) | Theorem 6.3 and proof p.35: the lifting theorem assumes residual modularity; its unconditional consequence uses Khare–Wintenberger. |

Every node excerpt was checked at its passage, including the short locator excerpts. Corrected locators: Paškūnas's (iv)/conclusion extends to p.2; Tung's global theorem and proof are pp.38–39; DP's publisher Paso 6 is p.14 and Definition 1.10/Remark 4 are p.7. The normalization node no longer puts a DP locator under the Skinner–Wiles source identifier. These are locator corrections, not changes of downloaded version.

**Source issue GL2ModularityLifting/E1: confirmed as a citation gap.** Published DP Theorem 1.7 p.5 omits the finite-order qualification on ψ in its determinant condition; the cited SW theorem requires it. The same omission occurs in the arXiv statement. Without restricting ψ, defining it from the determinant makes that condition vacuous. This establishes that the cited theorem proves only the qualified statement; it does not purport to exhibit a counterexample to the unrestricted printed theorem. The nodes retain finite-order ψ. The publisher page, arXiv version record, exact-title/DOI correction searches and Dieulefait's publication page disclosed no correction. Pacetti's homepage returned no readable text; no clearance of that page is claimed. URLs and the independent verdict are in `sourceIssues.review`; the published text and its hash are in `sourceVersions`.

## Baseline and suppliers

Each positive citation was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, not inferred from a name. The shared Mathlib source tree is exactly that commit. Tau Ceti source searches used the git object at `f790474821cf4256814db967cb154e7af3d0c369`, independently of the shared checkout's newer HEAD.

| Confirmed declaration | Statement needed here |
| --- | --- |
| `Relation.ReflTransGen` | Reflexive finite reachability with refl/tail constructors. |
| `Relation.ReflTransGen.trans` | Compose finite chains. |
| `Relation.reflTransGen_iff_eq` | Under no outgoing edge from the initial point, reachability is equality. |
| `PrimeSpectrum.comap` | Inverse image of prime ideals under a ring homomorphism. |
| `minimalPrimes` | Minimal primes over zero. |
| `minimalPrimes.equivIrreducibleComponents` | Order equivalence with the order dual of irreducible components. |

The first three are in `Mathlib.Logic.Relation`; the last three in the individual spectrum/minimal-prime modules imported by the suggested file. No baseline citation was a near miss. The current reviewed coverage data has no direct GL2ModularityLifting entry. Searches of both pinned Lean source trees did not locate the required arithmetic modularity-lifting, pseudo-character deformation, reducibility-ideal or completed-cohomology interfaces; ordinary matrix Cayley–Hamilton results do not supply them.

The actual external node statements were read in the R22.1/R32.1–R32.2 packet, R03.6 and P7 packets, R21 packet, R24.3 packet and IHG packet. The remaining suppliers' current stage descriptions were read, and requests kept for precise additional exports rather than treating stage names as proofs. In particular:

- `R21.4/pro-modular-prime` belongs to SW's ordinary representation-deformation problem. It is not Pan's direct pseudo-ring prime-image predicate. Its three incorrect uses were replaced by the R31.3 request for the actual quotient, kernel containment and closed-image specialization.
- `R32.1/non-solvable-residual-image` is stated over Q. The totally real theorem now requests preservation for arbitrary F and solvable Galois F′/F from R04.4. Its normal-image/solvable-quotient proof is specified. The current statement table supplies only the odd-prime statement; obsolete (b),(c),(d) citations were removed.
- The R24.5 compatible-system carrier distinguishes historical KW almost-strict compatibility from DP's stronger all-member de Rham/common-weight premises. The latter are explicit extra data with a new R24.5 request. No general system-existence theorem is inferred from the supplier's disputed DP 1.11 citation.
- Corollary 3.5.12 requires **absolute** local irreducibility. The bridge keeps Corollary 4.1.8's irreducibility wording and requests the coefficient/Hodge-weight argument from R06.2: a reducible coefficient extension of an irreducible two-dimensional Q_p representation would have conjugate character constituents with equal weights, contrary to regularity.
- The R04.3 trace-cut export covers component intersections as well as the ordinary seed component; an arbitrary intersection is not assumed finite over Λ. R03.6 connectedness is directly requested for the irreducible ordinary-prime branch too. Degree enlargement, determinant de Rham data and residual-ratio extension are explicit in the inherited §7.1 setup.

Ten previously omitted request-consumer entries were supplied. All 26 requests now agree in both directions with direct stage edges. An explicit-node dependency traversal, including supplier packets, reached 1,316 nodes with no cycle. This is an explicit-node check; it does not certify unimplemented stage exports.

## Node checks and corrections

The packet's review object gives every full node identifier and verdict. The following table records every node, with IDs abbreviated after the roadmap name.

| Node | Verdict | Check / correction |
| --- | --- | --- |
| `R32.3/dyadic-de-rham-modularity-lifting` | corrected | Tung Theorem A and Paškūnas Theorem 1.1 checked. Removed obsolete statement-(b) dependency and clarified general-field preservation; Paškūnas locator now includes p.2 for hypothesis (iv). |
| `R32.4/pan-residually-reducible-fontaine-mazur` | corrected | Pan Theorem 1.0.2 checked, including the p=3 ratio exclusion and ordinary/nonordinary split. Removed obsolete statement-(c) citation to the now odd-only table. |
| `R32.4/pan-residually-irreducible-fontaine-mazur` | verified | Pan Theorem 8.0.1 and Remark 8.0.4 checked. The usable Q theorem explicitly retains residual modularity, cyclotomic absolute irreducibility, local absolute irreducibility and the p=3 exclusion; the full-Serre corollary is excluded. |
| `R32.5/p-three-residually-reducible-branch` | corrected | SW printed p.6 and DP Theorem 1.7 checked. Normalization now selects the actual unramified quotient; reversed summands are relabelled without cyclotomic twisting. Removed stale supplier/table claims, added the normalization edge and finite coefficient-field convention; finite-order determinant condition retained. |
| `R32.6/transfer-residually-irreducible-odd` | verified | DP Theorem 1.4 and Tung odd-prime Theorem 4.7 checked. Quadratic-to-cyclotomic absolute irreducibility supplier read; each direction gets residual modularity from the modular lift and uses regular de Rham monodromy. |
| `R32.6/transfer-dyadic` | verified | DP Theorem 1.5 checked. The known modular congruent lift supplies residual modularity; nonsolvable residual image and arbitrary distinct weights are preserved. No Barsotti–Tate substitution. |
| `R32.6/transfer-residually-reducible` | verified | DP Theorem 1.6 and Pan 1.0.2 checked. Characteristic-zero irreducibility is explicit, no residual modularity is manufactured, and the p=3 extension is only the nonexceptional Pan branch. |
| `R32.6/de-rham-lifting-and-almost-strict-systems` | corrected | DP Definition 1.10/Remark 4 and the actual R24.5 carrier checked. Replaced the false projection of all-member de Rham data from the historical KW carrier by explicit extra data and a precise R24.5 request. Good-prime recognition avoids the R24.6 back-edge. |
| `R32.6/globalisation-dependency-audit` | corrected | All seven cited source passages checked. Removed the unsupported blanket certification of KW II independence; exact auxiliary-globalization and weight-change leaves remain an explicit audit gap. |
| `R32.3/typed-component-specialisation` | corrected | Tung Lemma 5.3.2 and Theorem 8.0.1 checked, including both ordinary and nonordinary support. Finite typed modules, faithfulness, localization and Nakayama are retained; corrected §8 locators to pp.38–39. |
| `R32.3/totally-real-dyadic-lifting` | corrected | Tung Theorem 8.0.3 and proof checked. Replaced Q-only nonsolvable-image lemma by the arbitrary-F R04.4 restriction request; corrected pp.38–39 locator. |
| `R32.4/nice-prime` | corrected | Pan §4.1 and Definition 4.1.4 checked clause by clause. Added the actual Eisenstein maximal-ideal setup, scoped the away-p Frobenius condition to S, replaced the SW pro-modular prerequisite by the Pan R31.3 image interface, and added constructor/iff APIs. |
| `R32.4/potentially-nice-prime` | corrected | Pan §7.2.4 checked. Characteristic p, dimension one, irreducibility and finite away-p image remain separate from Hecke occurrence and constant lattice lifts. Added constructor/iff APIs. |
| `R32.4/nice-prime-component-bridge` | corrected | Pan Theorem 4.1.7/Corollary 4.1.8 and Corollary 3.5.12 checked. Imported Pan pro-modularity via R31.3 and added the R06.2 coefficient/weight argument needed for the absolutely irreducible local classicality input. |
| `R32.4/large-component-at-regular-point` | corrected | Pan Lemma 7.1.3 and §7.1.2 checked. Made inherited determinant de Rham, residual-character extension and degree-enlargement hypotheses explicit for downstream ordinary density and dimension cuts. |
| `R32.4/generic-ordinary-intersection` | verified | Pan Lemma 7.2.1/Corollary 7.2.3 checked with the corrected §7.1 setup inherited from the large-component node. Principal local ordinary ideals and finite Λ/dense modular arithmetic points are exact requests. |
| `R32.4/scalar-ordinary-intersection` | verified | Pan §7.3 checked. The scalar case retains a chosen character, two local parameters, three comparison equations and the ordinary orientation; density uses the corrected large-component setup. |
| `R32.4/potentially-nice-base-change` | corrected | Pan §7.2.4–7.2.5 and §7.3 checked. Removed the SW pro-modular citation and added the exact R04.3 trace-cut/finite-image prime-selection input. Solvable restriction and actual Hecke occurrence remain separate inputs. |
| `R32.4/good-component` | corrected | Pan Definition 7.4.1 checked. Seed must be potentially nice and lie in the ordinary arithmetic closure; finite reflexive reachability permits a one-component chain. Added a concrete extensionality API and clarified the imported arithmetic locus. |
| `R32.4/extension-components` | corrected | Pan Definition 7.4.21 checked: generic points in the spectrum image, not arbitrary component intersections. All three Mathlib spectrum citations are exact. Added composition/subset functoriality in both packet and Lean. |
| `R32.4/extension-component-control` | verified | Pan Lemmas 7.4.15–7.4.19/Corollary 7.4.20 checked. Exact duality and deformation comparisons are requested; reducible locus is distinguished from nilradical reduction, and completion/trace dimension gain is retained. |
| `R32.4/extension-component-propagation` | corrected | Pan Corollary 7.4.22 checked. The intersection need not be finite over Λ; added the general R04.3 trace-cut prime-selection export rather than applying an ordinary-only hypothesis to it. |
| `R32.4/cyclotomic-component-connectedness` | corrected | Pan Proposition 7.4.3 and its three branches checked. Added the direct R03.6 connectedness export for the irreducible ordinary-prime branch; extension comparison, B0/B1 passage and the height-one intersection remain explicit. |
| `R32.4/nonordinary-hilbert-modularity` | corrected | Pan Theorem 7.1.1/Lemma 7.4.2 checked. Added the direct R04.4 field-selection export for the preliminary degree enlargement and the common extension for the finite chain. Generic, scalar and cyclotomic routes retain distinct hypotheses. |
| `R32.5/ordinary-character-normalisation` | corrected | SW normalization checked against the actual R21.5 suppliers. Clarified that η is the lift and the twist is η^{-1}; split the mixed SW/DP source locator. Finite order preserves inertia quotient, weights and oddness. |
| `R32.5/crystalline-weights-two-four-completion` | corrected | DP Paso 6 and the R21.5 crystalline criterion checked at p=3,k=2 or 4. Added the direct p-three branch used in the proof and corrected the publisher Paso 6 locator to p.14. |
| `R32.6/ramified-reducible-coefficient-prime` | corrected | DP Definition 1.10/Remark 4 checked in both PDFs. Kept all-member de Rham/common weights as explicit additional data on the KW carrier via R24.5; corrected publisher locator to p.7. Pan uses no missing bad-prime WD comparison. |
| `R32.6/transfer-ordinary-three` | verified | DP 1.7 and finite-order quotient normalization checked. Both lifts must independently satisfy the normalized ordinary hypotheses; congruence alone supplies neither ordinarity nor the determinant condition. |

The two arithmetic predicates now have constructor and iff APIs in addition to their projections and comparisons. The two concrete geometric interfaces gained extensionality and composition/subset APIs, respectively. No duplicate arithmetic definition was introduced. Existing tests distinguish characteristic p from characteristic zero, nonsplit from split lattice witnesses, constant lifts from merely finite image, and potentially nice Galois conditions from Hecke occurrence. The concrete tests check a seeded chain, empty seed, a two-step chain, a non-nice intersection, identity spectrum incidence, a zero-ring target and a kernel obstruction.

The suggested file contains two actual definitions, ten API lemma signatures and seven examples. Every other definition/API/test/theorem is indexed in its omission manifest with exact names, statements, hypotheses and prerequisites. This is the packet's explicit carrier gap, not an executable arithmetic theorem with missing conditions or arbitrary proposition fields. The standard note and individual imports are retained. All 12 planets name central arithmetic objects or theorems; none is a raw source locator or the source audit. Multiquadratic and SemisimpleAlgebras provide the upstream density models.

## Handed red-team finding and reader synchronization

**RT-AREA-langlands-2/21 is resolved at the ownership boundary.** The verifier's confirmed finding, current R24.6/R32.6 stage descriptions and R24.6 supplier packet were read. R32.6 owns the modern de Rham transfer at a ramified coefficient prime with reducible residual representation. R24.6 imports it and retains reduction/local-hypothesis lemmas. This packet depends on R24.5 and R01.5, never on R24.6's bundled transfer node, so there is no back-edge. Both packet and reader state that missing bad-prime WD equality is unnecessary for the Pan branch. The erroneous projection of DP geometric data from KW, however, was present in both: the packet is now corrected; the reader still needs synchronization. The packet's ownership proposal remains for the maintainer, without editing base atlas data or another job's files.

Before acceptance, a revision job must synchronize the reader from the corrected packet and suggested file. Concrete anchors in the unchanged reader are:

1. Line 19 and the nice-prime/bridge/base-change sections: replace the SW pro-modular identification with Pan's R31.3 quotient-image interface; include the maximal Eisenstein ideal and the new APIs.
2. Lines 50,102,106,133,548 and their direct-input lists: remove obsolete table references and the Q-only supplier use in the arbitrary-F theorem.
3. The p=3 section, lines 541–570, and normalization line 576: select the actual quotient for finite-order twisting; relabel the reversed direct sum without cyclotomic twisting; retain the finite coefficient-field convention and explicit ordinary hypothesis; remove the obsolete criticism of the already corrected R21 supplier.
4. The bridge, large-component, prime-selection, extension-propagation and cyclotomic sections: synchronize the R06.2 absolute-irreducibility argument, explicit §7.1 hypotheses, R04.3 intersection selection and direct R03.6/R04.4 inputs.
5. Lines 724 and 781: retain DP de Rham/common weights as separate extra data with the R24.5 request, rather than project them from the KW carrier. Line 751 must retain the independence audit obligation instead of certifying unread KW proofs.
6. Sources, supplier handoffs, gap consumers, coverage and final counts: apply the locator corrections, complete consumer lists, 26 requests and 22 API items, including the two concrete APIs; retain both honest gaps and all four planned statuses.

The full per-node table above and packet diff supply the replacement text. The reader was mechanically compared with the original packet: every original statement, hypothesis and proof step was present, so these packet corrections identify the corresponding stale reader passages. The suggested omission manifest is synchronized to the corrected packet. No further node correction was identified in this pass; reader synchronization remains before acceptance. The orchestrator should route that work to a revision, then obtain an independent acceptance check. This review does not promote the packet.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R32.3.json`: **0 errors, 0 warnings**.
- Embedded section-18 findings and source-version validation: passed using the shared `source_issues.check_issues` and `check_errata.versions_checked` validators. The standalone `check_errata.py` CLI targets errata-job files, not blueprint packets.
- Source SHA-256 checks, request/edge agreement and explicit-node acyclicity: passed.
- `lean-check research/blueprint/suggested/GL2ModularityLifting--R32.3.lean`: **exit 0**, with exactly **17** `sorry` warnings and no other warning/error; Mathlib at the pin. Memory available before compilation: 105 GB. Subsequent manifest edits affect comments only. Only Mathlib imports are required by the compiled fragment.
- `git diff --check` and intake deliverable/private-path/JSON validation: passed.

Compilation checks the admitted fragment's types; it establishes neither its proofs nor the omitted arithmetic theorems. Persistent source URLs, hashes, exact obligations and the synchronization instructions are in the deliverables. Scratch downloads and logs are removed after submission under WORKERS.md.
