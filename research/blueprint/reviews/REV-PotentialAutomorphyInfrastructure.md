# Independent review: potential automorphy infrastructure

**Job:** REV-PotentialAutomorphyInfrastructure; **issue:** [#524](https://github.com/CBirkbeck/tauceti-explorer/issues/524).  
**Reviewer:** Codex — codex-8woYiG; **date:** 7 October 2026.  
**Verdict:** `needs_changes`. This independent review is finished. The reviewed plan was written by session codex-tK01RB in [#6874](https://github.com/CBirkbeck/tauceti-explorer/pull/6874); this reviewer did none of that work.

The packet and suggested file contain the clear corrections below. Acceptance still needs a coordinated reader revision and verified owner contracts for three nodes. The review does not reject the plan merely because its six stages are planned with recorded gaps. This is a completed review, not a checkpoint, and makes no implementation claim.

## Coverage and counts

| Item | Checked/result |
| --- | --- |
| Nodes | All 118: 60 verified, 55 corrected, 3 unverifiable |
| Definitions/constructions | All 27, with 110 API items and 82 test obligations |
| Planets | All 34; retained source-named definitions, constructions and theorems |
| Pinned baseline declarations | All 9 independently confirmed; none removed or replaced |
| Source findings | All 76: 75 confirmed, E3 rejected |
| Source coverage dispositions | All 153 reviewed against the target scope |
| Source excerpts re-anchored | 45; all 118 nodes now have physical PDF page anchors |
| Nodes added | 0; target-level granularity retained |
| Supplier requests | 35, including 9 added requests |
| Recorded gaps | 12, including 3 added gaps |
| Stages | PA.0–PA.5 planned; none closed; packet pass remains complete |
| Assigned red-team findings | All 4 checked against both packet and reader |

Each node has its own `review.checked` verdict and reason in the [packet](../packets/PotentialAutomorphyInfrastructure.json). Each source finding has its own `review` verdict, reason and reviewer. All `implementationStatus` values remain `unchecked`.

The target inventory accounts for integral coefficient/level/boundary comparisons; highest weights, degree shifting and Fontaine–Laffaille transfer; ordinary functors, Bruhat pieces and local–global flags; deformation/component/support contracts; both arithmetic patching constructions and lifting endpoints; compatible-system operations, controlled base change and rank-two consequences. Prerequisite chains end in pinned baseline declarations, exact imports/requests, or named gaps. The hidden transfer dependency cycle has been removed. Stage `remaining` lists now include the corrected supplier requirements. No stage satisfies the gap-free `closed` standard.

The definition APIs retain the appropriate constructors, characterizations, extensionality, simp, functoriality and compatibility statements for their objects. Every definition has at least three discriminating tests. In particular the tests distinguish inverse-increasing left shuffles, paired CTG sums across embeddings, contracting versus expanding torus rows, reversed ordinary weights, multiset multiplicities and determinant oddness. The eight concrete definition cores are faithful partial prototypes; arithmetic adapters remain disclosed obligations. The 34 planet names represent mathematical objects/results, rather than source locators. No API item, test or planet was added merely to pad the inventory.

## Sources and editions actually read

Only freely accessible primary texts were used. Exact URLs, read dates and SHA-256 digests are retained in `sources`/`sourceVersions`; the latter lists all eight documents actually compared.

| Text | Copy read and scope |
| --- | --- |
| Allen et al., *Potential automorphy over CM fields* | [Author-hosted published Annals PDF](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), 197 (2023), 897–1113; every cited node/finding passage and its proof context |
| Qian, *Potential automorphy for GL_n* | [NSF-hosted Springer online-first PDF](https://par.nsf.gov/servlets/purl/10388233), DOI 10.1007/s00222-022-01161-6; 37 physical pages, without printed journal pagination |
| Boxer–Calegari–Gee–Newton–Thorne, Bianchi Ramanujan/Sato–Tate | [2025 author PDF](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), §6.1 and symmetric-power transport |
| Boxer–Calegari–Gee–Pilloni, potentially modular abelian surfaces | [2021 author manuscript](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), definitions preceding and all parts of Lemma 9.1.10 |
| Chenevier, determinants/pseudorepresentations | [arXiv author text](https://arxiv.org/pdf/0809.0415), §1.17, Lemma 1.18(iii), §1.19 and Theorem 2.22 |
| Qian arXiv v1 | [2104.09761v1](https://arxiv.org/pdf/2104.09761v1), PDF 2, 24, 26; historical E71 and its later repair |
| Allen et al. arXiv v1 | [1812.09999v1](https://arxiv.org/pdf/1812.09999v1), historical numbering/page comparison for E72 |
| Allen et al. arXiv v2 | [1812.09999v2](https://arxiv.org/pdf/1812.09999v2), the other numbering/page comparison for E72 |

Qian's journal pages 1239–1275 are retained only as a concordance. Its nodes and findings now identify physical NSF PDF pages, and E71 separately scopes its accusation to arXiv v1 and its repair to the publisher text. A publisher online-first copy is not described as the later paginated journal PDF. The Bianchi and BCGP anchors are scoped to the actual author copies.

### Source-anchor correction inventory

The following 45 excerpts previously came from a contents page, introduction, unrelated clause, or a passage inconsistent with the stated locator. They now point to the actual declaration/construction. All other node excerpts were checked at their existing locator. Physical PDF pages were added to every node, including those whose excerpt was already correct.

| Node suffix | Corrected locator | Physical PDF pages |
| --- | --- | --- |
| `siegel-coefficient-retract` | §2.4.1, proof of Theorem 2.4.4, (2.4.7), pp. 945–946 | 50 |
| `kostant-shuffles` | §1.2 Notation, pp. 905–906 | 10 |
| `boundary-degree-retract` | §4.2, Theorem 4.2.1, pp. 968–970 | 72 |
| `integral-kostant-decomposition` | §4.2, Lemma 4.2.2(2), pp. 970–971 | 74 |
| `nilpotent-fontaine-laffaille-transfer` | §4.4, proof of Proposition 4.4.6, pp. 980–981 (determinant-kernel transfer) | 84 |
| `degree-reflection-duality` | §4.4, proof of Corollary 4.4.8, pp. 983–984 | 87 |
| `genericity-making-character-twist` | §4.4, proof of Corollary 4.4.8, p. 984 | 88 |
| `arithmetic-ordinary-summand` | §5.1, p. 990 | 94 |
| `ordinary-galois-characters` | §5.1, p. 990 | 94 |
| `positive-torus-monoid` | §5.2.1, pp. 992–993 | 96 |
| `lowest-weight-character` | §5.2.1, p. 993 | 97 |
| `completed-arithmetic-cohomology` | §5.2.10, (5.2.11)–(5.2.13), p. 998 | 102 |
| `completed-ordinary-cohomology` | §5.2.10, p. 999 | 103 |
| `unitary-ordinary-tower` | §5.2.19, pp. 1000–1001 | 105 |
| `ordinary-satake-homomorphism` | §5.2.19, p. 1001 | 105 |
| `unitary-completed-boundary` | §5.2.19, (5.2.20)–(5.2.27), p. 1002 | 106 |
| `bruhat-cell-induction` | §5.3, pp. 1003–1004 | 108 |
| `bruhat-filtration` | §5.3, Proposition 5.3.1 and (5.3.2), pp. 1004–1005 | 108 |
| `bruhat-orientation-character` | §5.3, p. 1008 | 112 |
| `determinant-torus` | §5.4, pp. 1018, 1020 | 122 |
| `taylor-wiles-selected-ideals` | §6.5.1, paragraph before Lemma 6.5.8, p. 1065 | 169 |
| `fontaine-laffaille-patching-verification` | §6.5.1, proof of Theorem 6.5.4, pp. 1067–1069 | 172 |
| `fontaine-laffaille-dimension-amplitude` | §6.5.1, proof of Theorem 6.5.4, pp. 1069–1070 | 174 |
| `neatness-auxiliary-places` | §6.5.12, proof of Theorem 6.1.1, pp. 1073–1074 (and §6.6.10, p. 1084) | 177, 188 |
| `ordinary-hida-complex` | §6.6.1, (6.6.3), (6.6.4), pp. 1076–1077 | 180 |
| `ordinary-taylor-wiles-levels` | §6.6.1, pp. 1078–1079 | 183 |
| `ordinary-patching-verification` | §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081 | 184 |
| `ordinary-support-at-lifting-point` | §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081 | 185 |
| `split-test-prime-image-preservation` | §6.5.12, proof of Theorem 6.1.1, p. 1072 (and §6.6.10, p. 1082) | 176, 186 |
| `fontaine-laffaille-base-change-fields` | §6.5.12, proof of Theorem 6.1.1, pp. 1072–1073 | 176 |
| `ordinary-base-change-fields` | §6.6.10, proof of Theorem 6.1.2, pp. 1082–1084 | 186 |
| `rank-two-adjoint-monodromy` | §7.1, proof of Lemma 7.1.3, facts (1)–(8), pp. 1088–1089 | 192 |
| `fontaine-laffaille-lifting-descent` | §6.5.12, proof of Theorem 6.1.1, pp. 1071–1074 | 178 |
| `ordinary-lifting-descent` | §6.6.10, proof of Theorem 6.1.2, pp. 1081–1084 | 188 |
| `integral-model-comparison` | §2.1.2, pp. 910–911 (groupoid/sheaf cohomology and Hecke actions); §2.2; §6.5.1, pp. 1064–1069 (finite normal levels and perfect cellular models) | 15 |
| `boundary-level-coefficient-comparison` | §2.4.1 Theorems 2.4.2 and 2.4.4 | 45 |
| `local-condition-mod-varpi-comparison` | §6.5.1, pp. 1062, 1068–1069 (variable-determinant Sχ and reduced coefficient comparison); §6.6.1, equation (6.6.4), p. 1077 | 166 |
| `arithmetic-component-dimension-input` | Proof of Theorem 6.5.4 pp. 1069–1070; proof of Theorem 6.6.2 pp. 1080–1081 | 174 |
| `arithmetic-derived-support-contract` | §6.3.5, Proposition 6.3.8 and Corollary 6.3.9, pp. 1052–1053 | 156 |
| `residual-lifting-hypothesis-restriction` | Remark after Definition 1.3, p. 1241; proof of Theorem 1.4, p. 1274 ('all conditions except decomposed genericity follows from the corresponding conditions of r̄'); NSF online-first PDF pp. 3 and 36 | 3 |
| `rank-two-symmetric-power-transport` | §6.2, proof discussion after Remark 6.2.2, author PDF p. 60 (parallel HT formula); the determinant formula is the imported symmetric-power calculation | 60 |
| `rank-two-weight-zero` | §9.1, definitions before Lemma 9.1.10, p. 251 | 251 |
| `rank-two-odd` | §9.1 definitions before Lemma 9.1.10, p. 251 | 251 |
| `strong-irreducibility-symmetric-square` | Lemma 9.1.10(2), pp. 251–252 | 252 |
| `corrected-rank-two-large-image` | Lemma 9.1.10(3), pp. 251–252, corrected by ACC Lemma 7.1.3 | 252 |

## Mathematical and dependency corrections

1. **Fontaine–Laffaille coefficient transfer.** `nilpotent-fontaine-laffaille-transfer` now uses a finite Artinian local coefficient algebra B killed by a power of the uniformizer, finite Fontaine–Laffaille module M, and an arbitrary coefficient homomorphism Ã→B. Chenevier Lemma 1.18(iii) gives kernel inclusion and a surjection B⊗_Ã M→B[G]/ker D_B. It does not require Ã→B to be onto or flat. Residual absolute irreducibility and non-isomorphism, Burnside/Nakayama and faithfulness of the product determinant identify the quotient with M_n(B)×M_n(B). Finite coefficients make B⊗M a quotient of a finite sum of M; projecting onto a matrix column supplies ρ. A multiplicity-free generalized matrix algebra alone is insufficient to assert a product. IHG.0 and IHG.1 now receive these exact contracts. The transfer node no longer depends on its arithmetic application; `middle-range-fontaine-laffaille` instead directly imports transfer. Both proof sketches were corrected, and the source-coverage statement was synchronized.

2. **Correct coefficient categories.** `patched-arithmetic-mod-varpi-comparison` explicitly distinguishes the stronger comparison proved in D(S∞/ϖ) from the valid printed restriction of scalars to D(S∞). E3 is rejected. E56 is classified as a gap affecting the proof: an equality after forgetting Δ_N is weaker than the diamond-equivariant datum needed by §6.4.1(2). Its notation slips remain confirmed. E57's actual mixed-category equality, missing prime and tensor notation are separately confirmed. The matching source-coverage statement and suggested inventory were synchronized.

3. **Variable global determinant.** `local-condition-mod-varpi-comparison` and the G8 request now keep the same framing and coefficient conventions while allowing the global determinant to vary, as in the source. Ordinary local determinant conditions remain. A globally fixed-determinant variant cannot inherit the source's presentation counts. The arithmetic count is g=qn−n²[F⁺:Q], framing contribution n²|S|−1, and dim R∞=dim S∞−ℓ₀. `fontaine-laffaille-dimension-amplitude` now directly imports the preceding patching verification and P9, since it uses the actual patched pair rather than merely a symbolic local dimension formula.

4. **Normal-closure genericity.** `ordinary-automorphic-galois-flag` now directly imports `genericity-normal-closure-restriction`. Its sketch chooses F′=FE with E/Q soluble Galois and disjoint from the normal closure of the residual-cyclotomic field, retaining the prescribed split local completions. Avoidance of only the residual kernel over F does not discharge the decomposed-genericity lemma. The separate residual-image restriction and split-local flag descent remain explicit.

5. **CTG arithmetic weights and endpoint.** `ordinary-ctg-weight-choice` now gives the equal-difference proof rather than the source's complementary-sum argument. Intrablock positive differences are k(M+1) and k(nM+1), with disjoint ranges. Mixed oriented differences have residues ±M/4 modulo M, bounded perturbations and injective leading coefficient nk−j. They cannot give n disjoint equal-difference pairs covering all 2n entries. This proves the needed local translate-split obstruction for n≥2. At degree i=0 the block exchange uses only its actual nonempty boundary; the nonexistent printed entry 2n+1 is omitted. The source-coverage statement and suggested inventory were synchronized. E42 is scoped to the lemma's parallel paired-sum hypotheses: it does not prohibit all rank-one CTG tables. E18 separately confirms the minus-to-plus correction in (4.3.7); its rank-one, two-embedding counterexample has unitary rows (1,1) and (0,0). The existing one-embedding perturbation sketch already uses the correct plus-sum criterion.

6. **Finite partition signature.** `shifted_partition_recovery` in the suggested file now uses Finset ℤ, four cardinalities m, m>0, separation D<C, the original and shifted union identities, and both union cardinalities 2m. The previous Multiset signature did not express the packet/source's disjoint-union hypothesis. The packet's mathematical statement already had the correct finite-set hypotheses.

7. **Algebraic PGL₂ facts.** `rank-two-adjoint-monodromy` states eight structural facts from ACC Lemma 7.1.3. Its old sketch described the subsequent arithmetic residual-image step. The replacement separates algebraic subdirect-product structure, Weil restriction with its Galois action, and forms/quasi-split classification. The direct dependencies are now upstream ReductiveGroups structure and RG2.0a; the finite Galois-composita node and compatible-system operation imports were removed from this purely algebraic assertion. The exact forms extension is a new gap affecting this node and its two residual-image consumers. The latter still retain their independent monodromy/maximality requirements.

8. **Correct supplier ownership.** Matsushima and rational automorphic realization belong to ALS.5, not ALS.3. The request and consuming nodes `middle-degree-satake`, `fontaine-laffaille-dimension-amplitude`, both good-level lifting nodes and both final lifting nodes now use ALS.5. Finite-level duality is requested as an early ALS.5 prefix and attached directly to `degree-reflection-duality`, `determinant-component-product` and `central-torus-cohomology-shifting`; the ALS.4 boundary request is retained. AG2.0 is restricted to its normalization/weight dictionary. `middle-range-fontaine-laffaille` requests actual unitary representations from AG2.2/AG2.3 and their polarized crystalline/HT comparison from AG2.6; it does not assume the nonselfdual rank-n comparison that PA.1 proves. `fontaine-laffaille-local-global` now imports the existing R24.5 character-system realization, with a separate prescribed crystalline-character existence gap. The ML.1 request is explicitly a proposed scope extension, because its read statement does not export general unpolarized GL_n soluble descent. No supplier file or upstream roadmap was edited.

These are all substantive node changes; the complete 17-node inventory is:

| Node suffix | Fields changed, apart from source anchors |
| --- | --- |
| `middle-degree-satake` | prerequisites |
| `middle-range-fontaine-laffaille` | prerequisites, proofSteps |
| `nilpotent-fontaine-laffaille-transfer` | prerequisites, proofSteps, statement |
| `degree-reflection-duality` | prerequisites |
| `fontaine-laffaille-local-global` | prerequisites |
| `ordinary-ctg-weight-choice` | proofSteps, statement |
| `determinant-component-product` | prerequisites |
| `central-torus-cohomology-shifting` | prerequisites |
| `ordinary-automorphic-galois-flag` | prerequisites, proofSteps |
| `patched-arithmetic-mod-varpi-comparison` | statement |
| `fontaine-laffaille-dimension-amplitude` | prerequisites |
| `fontaine-laffaille-lifting-at-good-level` | prerequisites |
| `ordinary-lifting-at-good-level` | prerequisites |
| `rank-two-adjoint-monodromy` | prerequisites, proofSteps |
| `fontaine-laffaille-automorphy-lifting` | prerequisites |
| `ordinary-automorphy-lifting` | prerequisites |
| `local-condition-mod-varpi-comparison` | statement |

Other edits are the top-level review and 118 individual verdicts; 76 source-finding verdicts and source/search/version provenance; the eight-document `sourceVersions` list and Chenevier source; nine new and corrected existing requests; three new and corrected existing gaps; stage `remaining` lists; the six duplicated source-coverage statements/locators for transfer, CTG weight choice, reduced patched comparison and Qian avoidance/restriction/composita; and the suggested file's matching statement/dependency/gap inventory. `baseline`, node APIs/tests/planets, target inventory, restructuring proposals and prototype-coverage disclosures were retained.

## Baseline, audit and granularity

All nine exact declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The mathematical provision was checked against the actual consuming nodes, rather than inferred from a name search. None was removed, replaced or strengthened; no near miss required a new local node.

| Declaration | Exact source module | Provision and limit |
| --- | --- | --- |
| `CategoryTheory.Retract` | [CategoryTheory/Retract](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Retract.lean) | Split inclusion/retraction; equivariance is separate |
| `CategoryTheory.Retract.map` | Same module | Functorial transport of the split relation |
| `DerivedCategory` | [DerivedCategory/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | Localization for an abelian coefficient category |
| `DerivedCategory.Q` | Same module | Localization functor; arithmetic comparisons still need proofs |
| `Module.support` | [RingTheory/Support](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean) | Nontrivial localizations, without ring equality or R=T |
| `Matrix.charpoly` | [Matrix/Charpoly/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean) | det(XI−M), matching the packet's sign convention |
| `Subgroup.goursat_surjective` | [GroupTheory/Goursat](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Goursat.lean) | Abstract quotient graph; arithmetic composita and algebraic-group forms remain separate |
| `Equiv.Perm.permGroup` | [Algebra/Group/End](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/End.lean) | Composition convention used by inverse-increasing left shuffles |
| `finAddFlip` | [Logic/Equiv/Fin/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Fin/Basic.lean) | Block exchange, including the zero and equal-block cases |

Tau Ceti source checks used `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed `data/library-coverage.json` has no dedicated PA-infrastructure entry. Its LP3 status does not supply the integral highest-weight modules: the existing characteristic-zero Schur/GL_n material does not discharge integral induced/Weyl/dual-Weyl, Donkin or good-filtration obligations. Upstream ReductiveGroups and RepresentationTheory/SemisimpleAlgebras documents were read completely to check the library/audience standard. Existing general definitions and constructions remain imports; target-level nodes specialize them to this arithmetic problem. No upstream roadmap was replanned.

## Source-finding verdicts

Every one of E1–E76 was checked individually at its stated passage, including the hypotheses and uses relevant to an error/gap. The packet carries the detailed reasons: **75 confirmed; E3 rejected**. Several verdicts deliberately limit what is established:

- E1 confirms the residue-field SL₂ overstatement by the quartic-character twist/projective-image counterexample; the replacement is the prime-field normal-closure theorem, not the disputed residue-field conclusion.
- E3 distinguishes valid restriction of scalars from the stronger statement available in the proof. E56 distinguishes a weaker valid equality from the stronger equivariant patching datum. E57 concerns genuine mixed-category/notation mistakes.
- E18 and E42 have the precise plus-sum and parallel-paired-sum scopes described above. Rank-one CTG with unequal paired sums is a valid test, although it cannot satisfy the arithmetic weight-choice lemma's purity condition.
- E69 confirms the missing l>n bound in Qian's cited lifting application; it asserts no counterexample to all smaller-prime potential automorphy.
- E71 is a historical v1 gap repaired by the publisher's ordinary-automorphic definition and Lemma 4.3. E72 was checked against both ACC preprints: the enormous-definition numbering fits v1/v2, symmetric-power Lemma 7.1.6 fits v2/published, and the cited page ranges mix v1 and v2.
- E73 requires care with semisimplified WD versus actual monodromy. E74 checks the sign under the stated geometric Artin/HT(ε)=−1 convention; it does not claim that the still-unread Geraghty primary source's general criterion has been verified. E76 limits the local-family remark to the missing residual hypotheses.

The supplied extraction's dated erratum-search history is recorded honestly. This review did not repeat database searches or establish a newer published correction. The underlying Henniart/Serre, Larsen–Pink/Larsen, finite PGL₂ classification, Geraghty and Varma source leaves that were not independently obtained/read remain explicit gaps rather than checked leaf theorems.

## Assigned red-team findings

| Finding | Packet and reader assessment |
| --- | --- |
| RT-AREA-langlands-1/7 | PA.4 contains both full ACC 6.1.1/6.1.2 lifting endpoints and their hypotheses. ML.2 consumes PA.1/PA.2/PA.4; it is not an input to these proofs. The reader's endpoint/direction proposal is correct. Its general descent supplier and Matsushima routing still need the revisions above. |
| RT-AREA-langlands-1/21 | G7 owns enormous Taylor–Wiles primes, eigenvalue selection and diamonds. PA.4 owns arithmetic auxiliary levels, complexes, bounds and diamond-linear actions. Both packet and reader retain the G7→PA.4 proposal. |
| RT-AREA-langlands-1/22 | PA.3 explicitly requests L7, L8, R08.2, G7, G8 and P9 with local reduction, generic-component lifting, dimensions and support contracts. Its support node is conditional; the actual pair comes from PA.4, avoiding a reverse cycle. Reader routing is substantially correct, but its fixed-determinant assertion/request and omission of direct patching/P9 prerequisites are corrected only in the authorized packet/suggested files. |
| RT-AREA-geomlanglands/24 | Packet and reader propose a single RG2.6 integral highest-weight owner, with LP3 retaining its LP1-dependent parameter assertions. RG2.6 is not fabricated as an existing stage. Its creation is an explicit gap; LP3's existing library status does not discharge it. The maintainer must apply the proposed owner/edge changes. |

## Remaining contradictions and questions for the orchestrator

The three `unverifiable` verdicts are `rank-two-adjoint-monodromy`, `fontaine-laffaille-lifting-descent` and `ordinary-lifting-descent`. The source assertions are identifiable, but their exact forms/descent exports are not supplied by the cited owner statements. The three new gaps are prescribed global crystalline-character existence, unramified PGL₂-product forms, and the owner contract for general unpolarized soluble automorphic descent. The nine earlier gaps remain precise, with consumer lists corrected where necessary.

1. Schedule the coordinated blueprint revision of the **reader, packet and suggested file**. The reader is input-only for this review. It still gives the generic transfer argument and reversed application dependency, ALS.3 Matsushima routing, AG2.0 construction request, a fixed global determinant (including its G8 request), the old PGL₂ proof sketch and E3 as a source misprint. It also needs the three new gaps and current source-finding/version scopes. Concrete reader locations include the transfer sections, `local-condition-mod-varpi-comparison`, `fontaine-laffaille-dimension-amplitude`, `rank-two-adjoint-monodromy`, supplier requests, and the E3/E56 register. The corrected packet inventory is the starting point; no file should be promoted before these contradictions are resolved.
2. Confirm a ReductiveGroups Part II owner for the exact forms/Galois-descent/quasi-split statement needed by ACC Lemma 7.1.3(7)–(8). RG2.0a provides Weil restriction, and RG2.5's integral dual groups do not provide this theorem.
3. Route general unpolarized soluble GL_n automorphic descent and all-finite-place compatibility to an exact owner/Part II. ML.1's current statement is a near miss; PL.0's polarized/ordinary direction needs the already-recorded unpolarized extension and primary-source normalization verification.
4. Route the prescribed crystalline CM character to ClassFieldTheory Part II, with complete local exponents and constant conjugate paired sums. Keep it distinct from the finite-character/generic-ratio construction and from realization of an already constructed character in R24.5.
5. Apply the shared RG2.6 owner/edges and reconcile the existing R24.5 all-member-Hodge carrier with its weakening/operation interfaces before full arithmetic signatures are written. The report does not amend those suppliers or close their jobs.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`: passed, zero errors and warnings.
- The section-18 source/version validator also passes when applied to the packet's source-finding projection; all 76 verdicts have the required provenance and reviewer.
- `lean-check research/blueprint/suggested/PotentialAutomorphyInfrastructure.lean`: exit 0; 59 `sorry` warnings and no other Lean warnings/errors. Available memory was checked before compilation and exceeded 20 GB. Compilation used the shared Mathlib at the exact pin. The shared Tau Ceti checkout differs from its source-audit pin; this file imports only individual Mathlib modules and no Tau Ceti modules.
- The compiled content comprises eight definition cores, the numeric ν part of the Hida twist, their available API/tests and the finite shifted-partition signature. The complete arithmetic name/statement/API/test inventory remains explicitly marked in comments because the owner carriers do not yet exist. Those comments do not elaborate, and no proposition-valued arithmetic stand-in was introduced.
- Independent finite arithmetic checks exercised all 393 displayed CTG weight choices for n=2,…,10, every degree 0,…,n² and M=128n: shuffle length, dominance, unique congruent shift and the absence of a translate split passed. The finite partition check examined 1,036 partitions for m=1,…,3 in {−3,…,4}; all 126 satisfying both union/cardinality hypotheses recovered the separated partition. These are consistency checks, not general proofs or Lean formalization.
- The final consistency pass checks complete node/finding verdict coverage, counts, declared names in the suggested inventory, preserved implementation status, authorized paths and whitespace. No atlas promotion, supplier edit or second job is performed by this review.
