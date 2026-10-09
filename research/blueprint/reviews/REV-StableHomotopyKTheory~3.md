# REV-StableHomotopyKTheory~3 — completed independent review

**Verdict: accepted.** Issue #7555, Codex, session `codex-I4iLco`, 9 October 2026. This reviewer authored none of the three blueprint rounds. This is a finished review, not a checkpoint. The five requested round-3 prototype repairs are present and mathematically faithful. Additional clear corrections were applied to the packet, suggested file and reader.

There are **223 nodes: 206 verified, 15 corrected, 2 added, none unverifiable**. The packet has 24 definitions, 36 constructions, 73 lemmas, 84 theorems, 4 comparisons and 2 applications. It contains 367 API items and 250 tests in all; restricting those counts to definitions and constructions gives 346 API items and 249 tests. Every definition/construction has at least three tests. There are 36 planets, 117 baseline declarations, 16 sources, 25 source issues, 14 requests and 45 gaps. All eight stages remain planned, none closed; every implementation status remains unchecked.

Acceptance concerns the correctness of a completed source-level planning pass. It does not assert implementation or closed proof dependencies. The named proof gaps, prospective commented signatures and explicit requested supplier extensions remain open under PROTOCOL §§0, 3 and 13. The packet's fresh `review.checked` records every node. Historical reviews remain in `reviewHistory`; their verdicts are not this review's verdict.

## The five requested contracts

| Node | Independent result |
| --- | --- |
| `H.1/category-homology-derived-colimit` | The suggested comparison is a natural isomorphism of coefficient functors, with projective resolutions explicit. The representable contraction is a separate helper. Quillen §1, LNM p.91 (PDF7), supports the intended comparison; the Gabriel–Zisman proof import remains open. |
| `H.1/maximal-tree-presentation` | The arbitrary connected-category quotient universal property is now typed. All objects remain vertices even when the edge set is empty. The relation order matches Mathlib's path multiplication. Weibel IV Lemma 3.4 and proof, pp.IV.27–28. |
| `H.3/plus-pi2-universal-central-extension` | The contract permits any perfect normal subgroup P of G, and gives π₁=G/P and π₂=H₂(P;ULift ℤ). It includes a case with nonperfect ambient G. Weibel IV Proposition 1.7 and proof, pp.IV.9–10; the classical UCE universe extension is an explicit supplier request. |
| `H.4/segal-gamma-space-delooping` | The zero-level loop-space components form the Grothendieck group; the ℕ→ℤ rank test detects the previous pre-completion mistake. Level one is Core C, and iteration uses the Γ-space delooping. Carlsson §1.2, Definition 1, Proposition 2 and Theorem 3, printed pp.6–8 (PDF4–6), with E16's corrected convention. |
| `H.6/exact-couple` | The zero-E example says i is invertible and all pages vanish, while retaining D. The two-stage example retains the kernel/cokernel short exact extension without a splitting. The non-example has i²≠0. Bidegrees agree with Higher Algebra §1.2.2, pp.47–53. |

## Corrections made here

| Node | Correction |
| --- | --- |
| `H.1/filtered-colimits-of-categories` | List the closed-subcomplex embedding used to make compact finite-support lifts continuous; the finite-subcomplex lemma is already a direct input. |
| `H.1/filtered-colimit-homology` | Filtered exactness is supplied by the pinned AB5 instance for ModuleCat, including integral coefficients, rather than left as an uncited step. |
| `H.1/pi0-classifying-space` | Make finite compact support and cellular approximation direct inputs to the edge-path argument. |
| `H.2/mapping-path-space-fibration` | Use variable-length concatenation so the Hurewicz lift agrees exactly with the prescribed initial lift; record continuity and endpoints. |
| `H.2/fibre-to-homotopy-fibre` | List the mapping-path-space homotopy equivalence used to identify the absolute homotopy groups in the fibration comparison. |
| `H.2/long-exact-sequence` | List the mapping-path-space homotopy equivalence used to identify the absolute homotopy groups in the fibration comparison. |
| `H.2/bisimplicial-fibration-pi-kan` | Replace the misidentified general definition by §B.3’s based-horn condition. Retain B.3.1 only with its simple-level hypothesis and cite the newly read primary Theorem B.4. |
| `H.5:spectra/semistable` | List naive cone exactness as the input for mapping-cone closure of semistability, independently of true-group exactness. |
| `H.5:spectra/naive-isomorphism-is-stable-equivalence` | Use the new naive cone sequence to prove naive isomorphisms stable; this removes the implicit cycle through true groups and their long exact sequence. |
| `H.5:spectra/cofibre-long-exact-sequence` | Move naive exactness into two independent earlier theorem nodes; retain the true-group theorem and its stable-invariance consequence here. |
| `H.5:spectra/fibre-cofibre-shift` | Use the naive cone sequence and naive fibre sequence in the proof of a naive isomorphism, rather than the later true-group sequence. |
| `H.5:spectra/finite-biproducts` | Use the naive cone sequence in the proof of a naive isomorphism, rather than the later true-group sequence. |
| `H.5:spectra/eilenberg-maclane-ring` | Make HM a right HR-module from a right R-module, matching the existing M∧R action. Use Module Rᵐᵒᵖ M in Lean and add carrier, zero and noncommutative-order tests. |
| `H.5:spectra/sequential-homotopy-colimit` | Restore the sums-to-products hypothesis in the cohomological Milnor statement and hypotheses, matching Lemma II.5.6 and the existing API. |
| `H.2/levelwise-fibration-realisation` | Update the proof provenance after reading B.4; distinguish its connected bisimplicial comparison from the undecomposed proper-topological translation. |

The missing naive-versus-true prerequisite was visible in the proof prose even though the original explicit prerequisite graph was acyclic. The naive-isomorphism theorem referred to the later mixed long exact sequence; the latter used true groups, which depended on the naive-isomorphism theorem. The repair makes the required naive inputs explicit rather than merely deleting the reference.

## Nodes added

- `H.5:spectra/naive-cofibre-long-exact-sequence`: boundary induced by the cone projection and inverse suspension, exactness in all integer degrees, without stable replacement. Schwede I (2.11), Proposition 2.12 and proof, printed pp.26–28 (PDF27–29).
- `H.5:spectra/naive-fibre-long-exact-sequence`: levelwise unstable exactness followed by exact filtered colimits, with Kan levels or functorial level replacement explicit. Schwede I (2.15), Proposition 2.17 and proof, printed pp.29–30 (PDF30–31).

Both have `addedBy: REV-StableHomotopyKTheory~3`. Their typed boundaries and three exactness positions elaborate. Cone semistability, naive-isomorphism stability, fibre/cone comparison and finite biproducts now use the earlier naive inputs. The true-group theorem retains its own role.

## Baseline, sources and scope

All 116 original baseline entries were independently opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their actual statements, implicit variables and conventions provide the claimed interfaces; none was removed. Tau Ceti statements were read at the pin rather than at the working checkout's different HEAD.

One baseline entry was added: `CategoryTheory.AB5OfSize`, in `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean`. Its `ofShape` field supplies exact filtered colimits. The relevant ModuleCat instance was read in `Mathlib/Algebra/Category/ModuleCat/AB.lean`; temporary synthesis in the suggested file returned `instAB5ModuleCat ℤ`. The declaration index omits that anonymous generated name and the class field, so the packet cites the indexed class and records the instance file and synthesis evidence explicitly. This supplies filtered exactness rather than planning it again. The temporary synthesis command was removed.

The 15 original public PDFs were fetched independently and their SHA-256 hashes matched. Each node/source-issue locator was read, including statements and the arguments used in its proof outline. This does not claim a complete reading of each book or of undecomposed imports named in the gaps. The newly added primary source is Bousfield–Friedlander, *Homotopy theory of Γ-spaces, spectra, and bisimplicial sets*, LNM 658 (1978), pp.80–130, using the public scan linked in the packet. Appendix B, printed pp.119–128 (PDF40–49), gives the general based-horn condition §B.3, the simple-level criterion B.3.1 and Theorem B.4 with its Reedy proof. The matching-object lemmas and proper-topological translation remain proof work.

The reviewed library audit, RS-33 result and independent restructuring review, Tau Ceti AlgebraicTopology and UniversalCovers supplier stages, and all 14 requested supplier contracts were checked. Generic upstream topology, the stable-category abstract interface, classical UCE algebra and Waldhausen additivity are imported rather than redeveloped. The ordinary stage-5 Serre spectral sequence is distinguished from the stronger arbitrary-total-local-coefficient version. Type-0 classical UCE statements are distinguished from their requested universe-polymorphic extension. Every explicit local dependency is acyclic after the corrections.

The reader was regenerated from the corrected node fields and ancillary packet records, preserving its layer introductions. Node statements, hypotheses, proof outlines, API, tests, sources, prerequisites, baseline, source issues and current review agree with the packet. The 36 planet names denote key definitions, constructions or named theorems and respect the per-stage limit.

## Confirmed red-team findings

The eight handed findings and their verifier reasons were read independently.

| Finding | Result in this packet |
| --- | --- |
| RT-AREA-ktheory-1/4 | Additivity and relative-S delooping are supplied by early K.4:construction; H.5:S-delooping assembles the spectrum after the concrete spectrum foundation. Biexact products remain K.7. The older live relative-S wording still needs integration attention below. |
| /5 | Simple-space homology Whitehead, the H-space simplicity bridge and the scoped obstruction argument are present in H.3, with direct H.4 consumers. General-target plus uniqueness is a named gap. RS-33's accepted ownership puts the generic Cartan–Serre input in H.3. |
| /15 | The realised fibre map/basepoint and connected total/base hypotheses are retained. B.3's general condition is now exact; the proper-space/Reedy proof remains explicit unfinished work. |
| /16 | Chain-complex Eilenberg–Mac Lane spectra, grading/sign comparisons, HR-module comparison, cohomology representability, truncations and connective covers have their own generic spectrum nodes. |
| /22 | Nerve, realisation and ordinary local systems use the pins; Kan/cubical comparison and relative homotopy remain upstream. The twisted Serre extension is precise. |
| /23 | H.6 owns generic filtered spectra, exact couples and convergence. SchemeKTheoryOperations:S.4 supplies its geometric filtration and verifies the particular convergence assumptions. |
| /30 | H.3 imports the independent classical UCE recognition/H₂/naturality package, with perfectness and the requested universe extension explicit. It supplies the topological comparison. |
| RT-AREA-ktheory-2/29 | H.6 contains the scoped Burklund quotient and Moore-multiplicativity statements, importing the abstract E_n interface. Prime/power bounds and the S/8 example are retained. |

## Source issues

All 17 existing source issues were checked at their locators and receive fresh confirmed verdicts in this reviewer's own words; previous verdicts are retained as history. Eight further issues were found and recorded, confined to the exact public versions identified in `sourceVersions`. Existing corrections were sought in the repository's source-issue/errata records, the authors' pages and targeted web searches; no correction for these passages was found. This is not a claim that every later version has been collated.

| Issue | Locator and check |
| --- | --- |
| E18 | Schwede II after Proposition 5.21, printed p.264: the connective specialisation is n=0, not n=−1. |
| E19 | Schwede II before Theorem 8.3's proof, printed p.297: the Postnikov target is coconnected, not connected. |
| E20 | Schwede II Theorem 9.9(iii) proof, printed p.305: the multiplication-by-p injection has target ℤ/p^{n+1}, not ℤ/p^{n−1}. |
| E21 | Schwede II Theorem 9.9(iv) proof, printed p.305: π_n(S^{1−k}∧X)=π_{n+k−1}X. |
| E22 | Schwede II Remark 9.3, printed p.301: ℚ contains the nonrational subgroup ℤ, so arbitrary subgroups/quotients of local groups are not local. Kernels/cokernels of maps between local groups suffice for the intended triangle argument. |
| E23 | Lurie Proposition 1.2.2.7 proof, pp.50–51: incoming differential degree is (p+r,q−r+1), and the last boundary targets degree p+q−1. |
| E24 | Schwede I Proposition 2.17 proof, printed p.30, page image checked: the displayed homotopy has an unbound parameter and omits x. The corrected evaluation ω((2−2x)/(2−t)) on x≥t/2 pastes to the basepoint and has the required endpoint maps. |
| E25 | Schwede II Theorem 8.3 proof, printed p.297: the Postnikov tower ending at P₀ is indexed by n≥0; its two n≤0 labels conflict with increasing-degree stabilisation. |

## Validation and limitations

`python3 scripts/check_blueprint.py research/blueprint/packets/StableHomotopyKTheory.json` passes with zero errors and zero warnings against the pinned declaration index. The suggested file elaborated with `lean-check` against the shared pinned Mathlib build, exit 0, with 645 warnings, all declarations using admitted proofs. Memory was checked before each elaboration and exceeded 20 GB available. No Lean language server or library build/update/cache command was used.

The shared build has the adic part of Tau Ceti rather than its topology imports. The suggested file therefore uses the explicitly described compatibility stubs and does not claim to compile the full pinned Tau Ceti topology modules. The Waldhausen and operad carriers also retain partial data, with their missing supplier axioms stated openly. Those permitted prototype omissions do not establish formal versions of the affected contracts. The new right-module signature and naive exactness signatures elaborate; an admitted declaration is still a proposed signature.

## Notes for the orchestrator

1. The older live `data/decompositions/GeneralAlgebraicKTheory.json` node `K.4/relative-S-construction-fibration-and-delooping` reverses the constant C and projected S_n B roles. The newer `research/blueprint/packets/GeneralAlgebraicKTheory--K.1.json` supplier has the correct roles and early construction owner. Reconcile the live integration with that corrected supplier contract and E4. The newer K.1 packet currently carries a needs_changes review, so this note does not assert that the packet as a whole is accepted. No foreign deliverable was edited here.
2. Tau Ceti AlgebraicTopology stage 8 item 1 presently says based NDR pairs; H.2 needs relative groups and the pair exact sequence for arbitrary based subspaces, including fibration fibres. The packet request already asks for this extension; a new upstream note makes the distinction visible. The upstream document was left unchanged.
3. Retain the 45 gaps and precise request extensions in subsequent implementation work. Reading a primary theorem, or accepting this planning pass, is not closure of its Reedy, operadic, local-coefficient or model-category proofs.
