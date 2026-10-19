# Independent review: Local fields and ramification, Part II

**Accepted after correction.** Review job `REV-DESIGN-LocalFieldsRamificationPartII`, issue #3561; Codex, session `codex-fDBiIF`, 19 October 2026. The original design was written by Codex session `codex-tBFwNl` for #3454; this session did not contribute to it.

This is acceptance of a complete target-level planning pass under PROTOCOL §0. It is not proof closure or formalization. Every one of the 43 nodes has a justified `verified` or `corrected` verdict; every baseline declaration was read at its recorded pin; no unresolved contradiction remains. G1/G2 and the nine supplier requests remain explicit. GF.0 remains closed as a plan; GF.1–GF.6 remain planned with precise `remaining` lists, as the review issue permits.

## Counts

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 43 | 43 |
| Definitions / constructions | 13 / 5 | 13 / 5 |
| Theorems / comparisons / applications | 20 / 4 / 1 | 20 / 4 / 1 |
| API items | 71 | 71 |
| Discriminating mathematical tests | 57 | 58 |
| Planets | 30 | 30 |
| Baseline declarations | 24 | 28 |
| Supplier requests / explicit gaps | 9 / 2 | 9 / 2 |
| Source issues | 5 | 6 |

There are **33 verified and 10 corrected nodes**, with none added, removed or left unverifiable. All 18 definitions/constructions have uses, an API and at least three discriminating tests. Planets per layer remain 5, 3, 5, 4, 4, 6 and 3. All implementation statuses remain `unchecked`. The independent continuation briefs, their review gates, the route alias and the 28 Temkin item assignments are preserved; they are not activated as extra stages of this plan.

## Sources and baseline

All node locators and their `match` descriptions were checked against primary texts. The source catalogue records the versions and hashes; `reviewed: 2026-10-19` distinguishes this reading from the design's earlier access dates. Statements, review evidence and corrections are in our own words.

- Temkin, [published Annals article](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf), §§2.1–2.6, pp. 103–112; §§3.2.1–3.2.6, pp. 115–116; Theorems 3.2.12 and 3.3.6, pp. 118 and 120; Lemma 3.3.7, p. 120; Theorem 4.2.1 through proof Step 4, pp. 121–122, for the separable export and geometric boundary.
- Kuhlmann–Pank–Roquette, [author-hosted scan](https://www.fvkuhlmann.de/KPR.pdf), conventions p. 41, Theorems 2.1–2.2, Lemma 2.3 and Proposition 2.4, pp. 42–43, Corollary 2.5 and proof of Theorem 2.2, p. 44, and the restricted Schur–Zassenhaus argument p. 45. The scan was read as page images, not treated as empty OCR text.
- Temkin, [2010 author copy](https://math.huji.ac.il/~temkin/papers/Stable_Modification.pdf), Proposition 2.2.2 and proof, pp. 11–12; Kuhlmann–Kuhlmann–Vişan, [author copy](https://www.fvkuhlmann.de/symmval.pdf), Lemma 2.1, pp. 6–7 and inequality (12), p. 8.
- Ćmiel–Kuhlmann–Szewczyk, [author-hosted copy](https://www.fvkuhlmann.de/CoRfinal.pdf), Theorems 14 and 16, Example 15 and proofs, pp. 12–15; Aïd, [arXiv v1](https://arxiv.org/pdf/2511.07177v1), Propositions 2.6–2.7, pp. 4–5, Propositions 3.3/3.6 and Theorem 3.7, pp. 5–9, Propositions 4.1–4.3 and Theorem 4.4, pp. 10–13.
- Stacks [0ASF](https://stacks.math.columbia.edu/tag/0ASF), Lemmas 15.125.2–6, and [054A](https://stacks.math.columbia.edu/tag/054A), Lemmas 15.26.2–4 and 15.26.6. In particular the latter includes a finite-presentation theorem that the original étale proof hid behind an oversized supplier request.
- The cleared EGA IV₄ reference, [bibliographic record](https://www.numdam.org/item/PMIHES_1967__32__5_0/): Lemma 17.7.5(iv), **pp. 73–74**, Proposition 17.7.7, **pp. 74–75**, Proposition 18.6.8, p. 139, and Proposition 18.6.14, pp. 141–142. The earlier pp. 80–81 were wrong. This reference was read in place; no file or passage was copied.

The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All **24 original baseline names and statements are confirmed**, including the value group with zero, the actual `RankOne` and complete-space Krasner hypotheses, `Valuation.HasExtension` as compatibility rather than existence, `ringKrullDim`, the existing decomposition/inertia carriers, and scalar-extension étale descent. No baseline citation was removed. `IntermediateField.LinearDisjoint` is a protected **abbreviation**, and its catalogue kind is corrected accordingly.

Four declarations already at the Tau Ceti pin are added to the baseline, rather than requested as new work:

| Declaration | Module under TauCeti/Topology/Algebra/Group/Profinite/Sylow | Actual scope used |
| --- | --- | --- |
| `TauCeti.IsProPSylow` | `Basic.lean` | Closed pro-p subgroup with prime-to-p finite-quotient index; primality is required by the later theorems, not the predicate. |
| `TauCeti.exists_isProPSylow` | `Existence.lean` | Prime p; compact, totally disconnected topological group. |
| `TauCeti.IsProPSylow.exists_map_conj_eq` | `Conjugacy.lean` | Conjugacy with the same prime and topological hypotheses. |
| `TauCeti.IsProPSylow.eq_of_normal` | `Conjugacy.lean` | A normal Sylow pro-p subgroup is the unique Sylow pro-p subgroup. |

The library audit was checked against actual source statements. Current TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti main at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also screened. The two nearby full roadmap documents read were LocalFieldsRamification and LocalGaloisGroups, with their suggested carrier/signature interfaces; ProfiniteArithmetic and the profinite suppliers were screened for overlap. No existing local-field, Demushkin or profinite development is replanned here. In particular `TauCeti.IsProPSylow.map_of_surjective` is absent at the pin but present in current main, so the Layer 2 boundary now requests only that adapter and directs its import when the baseline advances.

## Corrections and supplier contracts

1. **Use the existing ordinary henselization owner.** The strict-henselization scope of ModularCurves 4D does not cover the original non-strict/semilocal/filtered request. `SchemeAndStackFoundations:key/henselization` already imports the single `PerfectoidSpaces:P3/henselisation-of-pairs` carrier; `SF.0/ordinary-local-henselization` gives the local comparison, and P3 already includes filtered colimits. Seven nodes' dependency lists, layer edges, reader and introduction now respect these exact contracts. GF.2 reuses H1's wild subgroup rather than proposing another carrier.
2. **Name the remaining ring inputs.** There are now two precise SF.0 requests: the integral semilocal tensor product formula of EGA 18.6.8, including non-module-finite normalization; and valuation/Prüfer finite presentation together with the source-side finite-presentation/étale descent used in the pointed diagram. The latter is not the pinned scalar-extension descent theorem. The proof restricts to the open image at the selected point, so faithful flatness and the quasi-compact/quasi-separated conditions are not omitted.
3. **Use the exact profinite scope.** Existence, conjugacy and normal uniqueness move to the baseline. Only surjective Sylow images remain at Layer 2, used in henselian Pank. The revised proof compares ordinary cd_p on Sylow subgroups directly, removing the unnecessary free-pro-p assertion and its finite-generation issue. The redundant ProfiniteCohomology Layer 9 request is removed; the absolute Galois carrier is already baseline material, while the field dimension calculation remains G1.
4. **Pin the fixed-field ambient.** The tower API now takes fixed fields inside K^s. The added trivially valued F_p(t) test has W=1 but K^a strictly larger than K^s; it catches an implementation that silently computes fixed fields in the full algebraic closure.
5. **Keep the root bounds correct.** The supporting continuity theorem gives root-distance value at least its threshold. GF.4 chooses that threshold strictly beyond all conjugate-closeness values, or enlarges it before asking for a strict distance bound. This preserves the Krasner argument and records supporting-source misprint E12.
6. **Keep the reader synchronized.** Every changed proof step, source, input, API sentence and test was mirrored in the reader. All 43 target statements are present in the roadmap definition. Source catalogue and introductory reader content agree exactly. The compact suggested file requires no signature change: none of these corrections changes its existing-carrier statements.

Supplier contracts were read, not inferred from their stage titles: both H1 valuation-nearby-cycles nodes, the SF key/local nodes, P3 henselisation, SF.4 flattening, LocalFieldsRamification Layers 2–4, ProfiniteProPGroups Layers 2/5/6, and ProfiniteCohomology Layers 9/11. The SF master packet is accepted; the P3 packet and SF.4 packet currently have `needs_changes` reviews. Their precise contracts are legitimate planned imports, not claims of available implementations or acceptance of those supplier packets. In particular the explicit finite-height valuation specialization of SF.4 flattening is valid: the generic point is quasi-compact open, admissible finitely generated ideals are principal, and the flat strict transform is the original algebra.

G1 and G2 remain actual proof-closure gaps. KPR p. 44 invokes them; the inspected existing stages do not supply the required generality. The proposed ProfiniteCohomology Part II must provide the characteristic-p bound for arbitrary fields and all discrete p-primary coefficients, and continuous sections of arbitrary profinite surjections with pro-p kernel, including the relative form and infinite-rank compatibility. Acceptance here does not count either proof as established.

## Per-node verdicts

The packet contains the same verdicts and evidence. No new target needed an `addedBy` marker because no node was added.

| Node (relative to LocalFieldsRamificationPartII:) | Verdict | Evidence and disposition |
| --- | --- | --- |
| `GF.0/prime-supported-degree` | verified | Temkin §2.1.1, p. 103: positivity and prime support give the empty-set, zero and singleton tests; no normality condition is present. |
| `GF.0/p-extensions` | verified | Temkin §2.1.1, p. 103: finite subextension degrees, tower multiplication and finite descent justify the algebraic definition; the S3 example correctly rejects normal-closure and compositum variants. |
| `GF.0/p-closed` | verified | Temkin §2.1.1, p. 103 and Remark 2.4.7, p. 108: finite testing includes inseparable extensions; closure-independence follows from algebraic-closure embeddings. |
| `GF.0/maximal-p-extension` | verified | Temkin §2.1.1 and proof of Theorem 2.6.6, p. 112: chain unions and degree multiplication give Zorn maximality and closedness; the degree-q purely inseparable test proves perfection only when q is allowed. |
| `GF.0/split-tower` | verified | Temkin §2.1.2, p. 103 and pinned LinearDisjoint tensor-field theorem: prescribed multiplication, linear disjointness and compositum equality are all needed; intersection alone fails in S3. |
| `GF.0/separably-p-closed` | verified | Derived interface from Temkin Remark 2.4.7, p. 108: the separate separability quantifier is essential; no perfection conclusion is used for an imperfect separably closed field. |
| `GF.1/normalization-and-prolongations` | verified | Temkin Lemmas 2.3.2/2.3.4, pp. 104–105 and Aïd Propositions 3.3/3.6, Theorem 3.7, pp. 5–9, Theorem 4.4, pp. 12–13: integral semilocal normalization and the overring argument suffice without module finiteness. |
| `GF.1/valued-henselization` | corrected | Replaced the strict-only ModularCurves edge by exact SF key/henselization and ordinary-local nodes, which import the existing P3 carrier. Made the local HenselianRing adapter explicit. Temkin §2.3.1, p. 104 and Stacks 0ASF Lemmas 15.125.5–6 give the valued specialization. |
| `GF.1/henselian-tensor-decomposition` | corrected | Replaced the oversized strict-henselization request by a precise SF.0 integral semilocal product request. Read EGA IV₄ 18.6.8, p. 139: no finite-module hypothesis is needed. Inverting base nonzero elements yields Temkin Lemma 2.3.2, pp. 104–105, including inseparable finite extensions. |
| `GF.2/unramified-etale-criterion` | corrected | Corrected EGA pages and separated source-side descent from pinned scalar-extension descent. Added precise SF.0 finite-presentation/étale-descent requests; Stacks 054A Lemma 15.26.6 supplies the valuation-local input. The proof applies descent on the open image at the selected point, with finite height used only for actual étaleness. |
| `GF.2/ramification-tower` | corrected | Imported the pinned Sylow carrier/existence/conjugacy/normal uniqueness and removed the unnecessary Layer 2 request here. Confirmed the two H1 contracts, applying the strictly henselian tame theorem over K^u. Specified K^s in the fixed-field API and added an imperfect trivially valued field test to exclude K^a as the ambient carrier. |
| `GF.2/unramified-extension` | verified | Temkin §§2.2.3/2.3.7, pp. 104–105: the finite residue classification is applied after henselization with a selected prolongation; unchanged value group does not replace the separability and defectless conditions. |
| `GF.2/strictly-unramified-extension` | verified | Temkin §2.3.7, p. 105 and Lemma 2.4.2, p. 107: the induced residue map is an isomorphism, not a separable-closure choice; the subextension-of-henselization characterization is compatible with the tests. |
| `GF.2/tame-extension` | verified | Temkin §§2.2.5–2.2.6/2.3.7, pp. 104–105 and H1 strictly henselian quotient: separable residue, prime-to-p index and absence of defect are all retained in the finite henselian degree formula. |
| `GF.2/henselian-extension` | verified | Temkin §2.3.10 and Lemma 2.3.11, p. 106: uniqueness concerns prolongations to L, not henselianity of L. Identity and split-prime examples distinguish the two notions. |
| `GF.2/henselian-disjointness` | corrected | Replaced the filtered-colimit extension request by the existing P3 node. Read Temkin Lemma 2.3.11, p. 106 and EGA 18.6.14(ii), pp. 141–142: the finite tensor decomposition and compatible filtered passage give the algebraic comparison. |
| `GF.2/totally-ramified-extension` | verified | Temkin §§2.2.4/2.3.12, pp. 104/106: disjointness from K^u is equivalent to unique prolongation and purely inseparable residue extension. Residue degree one is confined to the local-field comparison. |
| `GF.2/purely-wild-extension` | verified | Temkin §§2.2.7/2.3.12, pp. 104/106: the disjointness definition allows defect; for henselian fields the residue and p-primary value criteria agree through the supplied wild group. The p=1 branch is separated. |
| `GF.2/tame-field` | verified | Temkin §2.3.9, p. 106: the equality uses K^a, contains no henselianity assumption and does imply perfection because nontrivial purely inseparable extensions cannot be tame. |
| `GF.2/separably-tame-field` | verified | Temkin §2.3.9, p. 106 and Remark 2.4.7, p. 108: the equality uses K^s; the imperfect separably closed example correctly prevents deducing perfection. |
| `GF.2/tower-laws` | corrected | Replaced the filtered-henselization extension request by the existing P3 contract. Temkin Lemma 2.4.2, p. 107 supplies all six transitivity/union laws; compatible compositum maps and essentially étale/Kummer descriptions justify the two base-change laws without degree preservation. |
| `GF.2/local-field-comparison` | verified | Read current LocalFieldsRamification Layers 2–4: henselianity, perfect residue and defectless ef specialize the general predicates. The comparison retains arithmetic Frobenius and imports the existing local theory rather than extending its scope. |
| `GF.2/perfection-tame-tower` | verified | Derived comparison used in Temkin Theorem 2.5.5, p. 110: separable/purely inseparable disjointness and a finite Frobenius twist preserve separable degrees, tame towers and the two closedness predicates. The Artin–Schreier non-example excludes loss of wild ramification. |
| `GF.3/maximal-ramification-extension` | verified | Temkin Lemma 2.4.2(iii), p. 107 and Remark 2.4.7, p. 108: union closure gives upper bounds for every specified subset of properties, including the separate K^s construction. The API does not require uniqueness of a maximal field. |
| `GF.3/elementary-complements` | verified | Temkin Lemma 2.4.4, pp. 107–108: residue enlargement and missing prime-to-p radicals contradict maximality, giving the two multiplication maps; the disjointness halves are retained separately. |
| `GF.3/splitting-equivalences` | verified | Temkin §2.4.6 and Remark 2.4.7, p. 108: checked the direct four-field-condition argument and the corrected normality restriction. The explicit S3 example confirms E11 and prevents using a nonexisting nonhenselian quotient. |
| `GF.3/henselian-pank` | corrected | Removed redundant PC Layer 9 and the unnecessary free-pro-p criterion. The revised Sylow cd comparison needs no finite generation, and uses pinned Sylow results plus the existing Layer 2 image adapter. KPR Theorems 2.1–2.2 and Corollary 2.5/proof, pp. 42–44 identify G1/G2 explicitly; this is verified as a conditional plan with those honest open proof obligations. |
| `GF.4/rank-one-krasner` | corrected | Corrected the supporting root-continuity match and proof: root distance is at least the chosen threshold, which must exceed conjugate distances. CKS Theorems 14/16, pp. 12–15 and Example 15 justify this, with local misprint E12 recorded. The noncomplete henselian IsKrasner bridge remains an owned target, not an application of the complete-space baseline theorem. |
| `GF.4/rank-one-decompletion` | corrected | Replaced the filtered-ring extension request by the exact existing P3 contract. Temkin Lemma 2.5.2, pp. 109–110: finite degree equality and the maximal compatible-pair argument supply the separable infinite statement; unrelated finite descents are not unioned. |
| `GF.4/maximal-wild-henselization` | verified | Temkin Corollary 2.5.3, p. 110: decompletion descends a finite further separable wild extension; disjointness retains degree and proves the maximality equivalence at height one. |
| `GF.4/rank-one-pank` | verified | Temkin Theorem 2.5.5, p. 110: the perfect case uses henselian Pank and tensor associativity; perfection and the corrected field equivalences give every maximal choice over imperfect fields. Inherits G1/G2 honestly. |
| `GF.4/rank-one-p-closed` | verified | Temkin Corollary 2.5.6, p. 110: maximal pure wildness is a p-extension, so p-closedness kills the complement. The p=1 convention and failure of Q_p to be p-closed are correct. |
| `GF.5/composed-valuation` | verified | Temkin §2.6.1, p. 110 and pinned ofPrime/idealOfLE inverse laws: the residue pullback satisfies the valuation alternative and gives the convex-kernel value sequence. No second localization API is introduced. |
| `GF.5/finite-height-chain` | verified | Temkin §§2.6.1–2.6.2, pp. 110–111: total ordering of primes identifies finite Krull dimension d with d+1 primes and unique coarsenings of each height. The residual height is d−i, not i. |
| `GF.5/abhyankar-and-rank` | verified | KKV Lemma 2.1, pp. 6–7 and inequality (12), p. 8: independent values and residues give the transcendence bound; representatives of convex layers bound height by rational rank. The prime-field rank contribution and algebraic torsion quotient are included, without an analytic equality. |
| `GF.5/unramified-composition` | corrected | Removed the redundant ModularCurves edge. Temkin Lemma 2.6.3(i), p. 111 and Temkin 2010 Proposition 2.2.2, pp. 11–12 match the generation/maximal-ideal argument. Read the exact SF.4 flattening contract: finite-height generic point is quasi-compact open, finitely generated valuation ideals are principal, and flatness identifies the strict transform. |
| `GF.5/tame-composition` | verified | Temkin Lemma 2.6.3(ii), pp. 111–112: the radical/degree argument needs no coarse p-torsion with p the final residue exponent. Checked Q_p((t)) and confirmed the correction E4; the condition is automatic only when the exponents agree. |
| `GF.5/tame-field-composition` | verified | Temkin Corollary 2.6.4, p. 112: the algebraically closed value quotient has no p-torsion precisely when the original coarse group is p-divisible; both tame-field hypotheses and the final-prime convention are retained. |
| `GF.6/p-closed-residue-divisibility` | verified | Temkin Theorem 2.6.6 proof, p. 112: prime-degree binomial irreducibility gives p-th roots and value divisibility; integral monic lifts of irreducible residue polynomials give residue p-closedness. Characteristic-zero coarse residues are treated separately. |
| `GF.6/finite-height-tameness` | verified | Temkin Theorem 2.6.6 proof, p. 112 and Corollary 2.5.6, p. 110: height zero, height one and the composed smaller-height steps are covered; no induction is made with the wrong residue prime. |
| `GF.6/finite-height-descent` | verified | Temkin Theorem 2.6.6 final paragraph, p. 112: relative algebraic closure in perfect K is perfect and regular, preserving finite tensor degrees and p-closedness; finite transcendence degree, rather than finite generation after closure, gives the height bound. |
| `GF.6/general-tameness` | verified | Temkin Theorem 2.6.6, p. 112: finite-height descent followed by arbitrary compatible valued base change and finite-subextension testing removes the height bound. No completeness, henselianity or perfect-residue hypothesis has been added. |
| `GF.6/separable-p-closed-tameness` | verified | Temkin Lemma 3.2.5, p. 116 gives the full statement; the derived separable export follows by Frobenius descent to perfection and the tame-tower comparison. Checked the imperfect separably closed non-example and restricted residue primes to P, retaining the geometric consumer boundary. |

## Source-issue verdicts

All five original findings were read at their locators and receive `review.verdict: confirmed`. None was rejected.

| Finding | Independent check |
| --- | --- |
| E3 | Published Temkin p. 112 cites a nonexistent part of Corollary 2.5.6; the corollary on p. 110 is a single assertion. |
| E4 | Published Temkin pp. 111–112 uses the coarse residue characteristic at the final degree step; Q_p((t)) distinguishes it from the needed final residue exponent. |
| E6 | Published Temkin Theorem 4.2.1 Step 4, p. 122 invokes unrestricted distillation in a separable branch. GF.6 supplies the separable field export, while the geometric repair remains with PrimeToDegreeAlterations. No claim is made that the final theorem is false. |
| E11 | Published Temkin §2.4.6(4), p. 108 uses a quotient without sufficient normality. Independently checked the S3 splitting field of X³−X−2 at 2: its ramified quadratic decomposition/wild subgroup has order two and is nonnormal. The four field conditions have the corrected direct proof. |
| E2 | Published Temkin Lemma 3.3.7, p. 120 interchanges the implication directions and field/valuation labels; the ascent argument concerns the Galois closure formed from the transported conjugates. |
| E12 (added) | The author-hosted CKS proof of Theorem 16(c), p. 14 claims a strict distance bound at the computed threshold. For f=X, g=X−2 over Q_2 the threshold and distance both equal 1. The theorem statement on p. 13 has the correct non-strict bound; this is a local misprint affecting no mathematical result. |

E12 is explicitly scoped to the identified author copy; no unchecked publisher PDF is represented as read. Its source version, SHA-256, correction search and independent verdict are recorded. The author publication list, accessible DOI record and title/author/erratum searches revealed no correction; that search is not asserted exhaustive. All six issues carry the review job identity.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalFieldsRamificationPartII.json`: **0 errors, 0 warnings**. This includes the source-issue schema, references, internal acyclicity, coverage and planet limits. The final packet remains `complete`, not `closed`.
- `lean-check` on the existing 154-line suggested file: **exit 0**, with exactly 18 declaration-uses-`sorry` warnings and no other warnings or errors. The shared build is at the two atlas pins; the directly imported Tau Ceti absolute-Galois source was also compared with the pinned file. Memory availability exceeded the required 20 GB. No language server or new build was started.
- Direct consistency check: all 43 reader targets contain their packet statements, proof steps, acceptance checks, API statements, tests and prerequisite ids; all 43 statements occur in the definition's own layer; the introduction and source catalogue agree. All 18 definitions/constructions meet the test count and all layer planet counts are at most six.
- `git diff --check`: passed. Only this issue's three corrected design documents, this review report and this job's handoff are changed. The suggested file was reviewed and compiled unchanged. No source excerpt or private path is introduced.

## Questions and handoffs for the orchestrator

1. Route the two exact SF.0 requests to its existing commutative-algebra/scheme-morphism owner. Preserve P3 as the single ordinary pair-henselization carrier and ModularCurves 4D as the strict owner; do not revive the oversized consolidated strict-stage request.
2. Activate the proposed ProfiniteCohomology Part II for G1/G2 before proof closure or upstream packaging. Its ordinary cohomology and finite-embedding-problem carriers must be imports, not new variants. The current supplier reviews of P3 and SF.4 must also be resolved in the normal upstream order.
3. Retain the original proposed split: the Kato/Swan and DVR-module briefs are independent continuations with their existing review gates. Their creation and any IntegralLattices audit belong to subsequent jobs, not this review. Point PrimeToDegreeAlterations and DiamondEtaleCohomology to the exact existing exports recorded in the packet.

These are routing and proof-closure obligations, not unresolved contradictions in the accepted target statements. No promotion, supplier edit, label change or upstream modification was performed.
