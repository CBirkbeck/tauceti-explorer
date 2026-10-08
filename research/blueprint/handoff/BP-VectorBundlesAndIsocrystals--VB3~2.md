# BP-VectorBundlesAndIsocrystals--VB3~2

Codex — `codex-yQWzkB`, 2026-10-08. Revision of issue #7016 on branch
`codex-yQWzkB-vb3-revision`.

The revision pass is complete. The packet has `status: complete`, with every
target represented by a declaration or an owner import. All five stages are
**planned**; none is closed. The ten inherited gaps remain explicit. This is
a completed target-level plan, not a claim that its geometry is formalized.

The independent review
[REV-VectorBundlesAndIsocrystals--VB3](../reviews/REV-VectorBundlesAndIsocrystals--VB3.md)
required synchronization of the reader with the corrected packet. That work
is done. Its entire top-level `review` object remains unchanged for the next
independent reviewer to replace. All 76 node identifiers, their order, scope,
prerequisites, coverage records, API items, tests and supplier requests are
preserved. The source-issue verdicts and reviewer identities are preserved;
three explanations were paraphrased to remove source quotations.

## Changes in this round

The reader now gives each node's corrected statement, hypotheses, proof route,
API, tests, consumers, direct imports, acceptance items and source locators.
The suggested file's contract index gives the same statements, hypotheses,
API, tests and direct imports. Its executable Lean declarations are unchanged
from the reviewed input.

| Review requirement | Revision delivered |
| --- | --- |
| CN standing assumptions | The introduction and all 25 CN contracts retain E=Q_p and C obtained by completing an algebraic closure of a complete discretely valued characteristic-zero K with perfect countable residue field. CN Introduction p. 2, §1.3.3 p. 8 and §3.1.1 footnote 6 p. 12 are identified. SW Definition 15.2.1 and Theorem 15.2.12 permit arbitrary complete algebraically closed C/Q_p; their regime is stated separately. |
| Positive resolutions and presentations | The field-case/semicontinuity argument of FS II.3.1, pp. 75–76, replaces the unrelated II.3.3(ii) argument. FS II.3.2–II.3.3, pp. 76–78, require fibrewise semistable kernels of the specified slopes. Their added imports appear in both documents. |
| Absolute BC geometry | FS II.3.7, pp. 81–83, gives spatial diamonds and cohomologically smooth scalar-quotient maps. The Frobenius identity holds on Perf_Fq; the further base change serves the contracting-action lemma. The negative-case HN stratification and pro-étale-torsor argument and its imports are recorded. |
| Punctured quotients | FS Remark II.3.10, p. 84, distinguishes the non-quasiseparated absolute π^Z-quotient from its map to the absolute base, which is representable in spatial diamonds. The E^×-quotient is Div^d. Non-perfectoidness from the proof of II.2.15, p. 71, is restricted to p-adic E; footnote 5 leaves equal characteristic unresolved. |
| Divisors and negative examples | The converse divisor construction uses II.2.19, and the sum-map proof uses the geometric-point II.2.9 input. FS II.3.6, p. 81, and Examples II.3.12–II.3.13, pp. 84–85, have their added imports. Quaternion and SL₂ quotients are absolute statements; passage to C is stated separately. |
| Relative HN and slope zero | FS II.2.19–II.2.20, pp. 74–75, includes classification in the convex-hull description, the rank-denominator correction for O(λ), cohomology and v-descent inputs, and H⁰(X_S,O)=underline E(S). The disconnected-base test distinguishes this from a single copy of E. |
| Robba semicontinuity | KL Theorem 7.4.5, p. 153, follows Proposition 4.2.16, Lemmas 7.1.2 and 7.4.4 and Proposition 7.4.3(a). The former exterior-power route is removed. The RD.2 request and imports also accompany constant-vertex splitting and negative cohomology detection. |
| Purity and ampleness | The duplicated pure-model fragment is removed. The full coefficient-ring distinctions, rank-zero convention and G-PATCH qualification remain. The KL ampleness inputs added by the review are included in the reader and index. |
| API and integral conventions | `BC.module`, `BC.exactSequence` and `PointwiseAmple.isOpen` appear with their complete contracts. SW §22.6, Theorem 22.6.1, p. 213, uses affinoid S and a fixed pseudouniformizer for Y_[0,r](S). |
| CN acceptance and source issues | All nine new concrete CN acceptance instances are retained. E16–E30 are marked independently confirmed and E31–E33 are included with their confirmations. No finding remains described as awaiting review. |
| Ownership | The CN h-functor additions remain routed to VectorBundlesAndIsocrystals, Part II. The misplaced note about that proposed roadmap is removed from `upstreamNotes`; the upstream ReductiveGroups integral extension remains there and in its supplier request. |

The user's standing source rule overrides the older excerpt instructions.
Every `excerpt` field has been removed. Statements, proof explanations and
source-issue assertions are in our own words, retaining formulas and locators.
No source passage, PDF or extracted source text is included in the deliverables.
Edition descriptions now identify each source individually. The seven fresh
downloads match the existing SHA-256 values; `accessDate` records this run.
The earlier `sourceVersions.read` dates retain the independent review's
October 6 reading history. The narrower October 8 rechecks are listed below.

## Stage coverage and counts

| Stage | Status |
| --- | --- |
| `VectorBundlesAndIsocrystals:VB3` | planned |
| `VectorBundlesAndIsocrystals:VB3:general-BC` | planned |
| `VectorBundlesAndIsocrystals:VB3:positive-basic-examples` | planned |
| `VectorBundlesAndIsocrystals:VB3:projectivized-properness` | planned |
| `VectorBundlesAndIsocrystals:VB4` | planned |

There are 76 nodes: 10 definitions, 3 constructions, 46 theorems, 13 comparisons,
3 applications and 1 lemma. They carry 70 API items, 52 unit tests and 18 planets.
The baseline cites 13 declarations. There are 69 target-coverage entries,
18 supplier requests and 10 gaps. Every implementation status is `unchecked`.

## What remains and where to resume

These are follow-up proof or supplier tasks, rather than unfinished reader
synchronization. Their exact consumers remain in the packet and reader.

| Gap | Required follow-up |
| --- | --- |
| G-LT | Derive the crystalline φ=π Hom comparison with O_E action and F=σ/π normalization. SW13 Theorem A is full faithfulness, not the displayed eigenspace calculation; supplier R07.2 must supply that calculation. |
| G-CONTRACT | For FS II.2.16, prove joint detection by finitely many untilt evaluations and a common contraction/escape bound on each quasicompact chart. The topological lemma alone does not establish this application. |
| G-SPATIAL | Obtain the exact two FS II.3.8 criteria from D5, including smallness, a surjective qcqs smooth cover, and a covering family of locally closed generalizing strata. |
| G-LEBRAS | Read the construction-level Le Bras source and establish hypercohomology full faithfulness and sympathetic-evaluation compatibility. SW/CN statements of the equivalence do not supply this construction. |
| G-HOM | Establish the graph-presentation bound for arbitrary VS morphisms into BdR, with image in t⁻ᴺBdR⁺. CN §4 remains unread here; avoid a cyclic import from the Part II h-exactness result. |
| G-PATCH | Verify the Witt/Robba fibre-product and intersection identities and Frobenius compatibility that would upgrade KL's nodal sheaf example to the stronger completed/bounded coefficient-ring counterexample. |
| G-INTEGRAL | Supply integral Z_p Tannakian reconstruction for smooth affine groups with connected fibres, including the Lang input. Upstream's field-valued reconstruction is insufficient. |
| G-COMPANION | Carry the companion's G-DM, G-GEOM, G-HN, G-GG and G-KEY obligations through every import. Its corrected node contracts are usable; its reader review still requires changes. |
| G-ORDER | Apply RS-15's parent-stage narrowing and stage-edge reversal atomically in a separate integration change. Do not mechanically promote internal node edges to stage edges. |
| G-LEAN | Supply the missing geometric carriers and interfaces and then replace the schematic signatures. The admitted component types do not prove the full geometric contracts. |

**RT-AREA-padic-1/21 is handled at this part's boundary.** Its early order is
RF3 chart maps → bundle descent and basic twist calculations → geometric-point
comparison and degree → quantitative relative ampleness → classification.
The positive basic calculations use no II.2.6, II.2.9 or classification input;
ordinary projectivized properness uses II.2.6 and remains independent of
classification. The divisor comparison uses the companion's geometric-point
II.2.9 node. VB4 uses properness and classification before the general positive
resolutions. The RF3 global-map blocker belongs to the companion. G-ORDER and
the reader now explain this, including the still-required RS-15 atomic change.

## Supplier requests retained

The exact 18 interfaces and their consumers are in the packet and reader.
This round synchronizes the reviewed requests; it does not claim the owners
have already implemented them.

| Supplier | Required interface |
| --- | --- |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` | Lubin–Tate π-divisible group, Tate module, logarithm and torsion sequence in covariant normalization. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` | Crystalline Hom/eigenspace comparison and integral Frobenius trivialization. |
| `VStackSheavesAndLisseCategories:VS1` | Divisor-to-Weil and local reciprocity comparison. |
| `DiamondEtaleCohomology:C4` | Taut partial properness, descent, valuative criteria and proper-surjective v-cover application. |
| `DiamondSixOperations:S4` | Smoothness descent and composition/extension with the ECD 23.13 hypotheses. |
| `DiamondSixOperations:S5` | Ball and locally profinite/scalar quotient dimensions and smoothness, including ECD 24.2. |
| `DiamondsAndVStacks:D5` | The two precise FS II.3.8 spatiality criteria. |
| `DiamondsAndVStacks:D3` | Pro-étale coefficient local systems and effective sheaf/tensor descent. |
| `PadicHodgeTheory:R06.1` | Period-ring functors on sympathetic algebras and compatible evaluation/filtration maps. |
| `PadicHodgeTheory:R06.2` | Supercuspidal rank-two realization and the representation input of CDN Lemma 2.7. |
| `PerfectoidSpaces:P3` | Tilting of finite étale sites, inverse perfection and completed-limit control. |
| `RelativeFarguesFontaine:RF0:integral-Y` | Integral boundary Y_[0,r], inverse Frobenius, and its period-ring comparison. |
| `RelativeFarguesFontaine:RF1` | Relative schematic curve/Proj comparison compatible with perfectoid pullback. |
| `SchemeAndStackFoundations:SF.0` | Generic torsion-pair heart, abelianness, triangular Hom/Ext¹ and hereditary torsion sheaves. |
| Upstream `ClassFieldTheory`, layer 8 | Arithmetic Lubin–Tate construction and reciprocity normalization. |
| Upstream `ClassFieldTheory`, layer 5 | Unramified coefficient field, arithmetic Frobenius and semilinear Hilbert 90. |
| Upstream `ReductiveGroups`, layer 1 / Part II | Representation/comodule dictionary and its required integral connected-fibre extension. |
| `PadicDifferentialEquationsAndRigidCohomology:RD.2` | Special-above-generic polygons and descent when polygons coincide, for perfect analytic fields with KL's slope/order conventions. |

## Source rechecks on October 8

URLs, hashes and editions are in the packet. This revision re-read the passages
needed to check the in-place corrections and paraphrase the affected contracts.
It also read the pinned baseline declaration statements, the relevant supplier
contracts, RS-15, the reviewed audit, links and the AdicSpaces and HodgeStructures
upstream examples.

| Public source | Passages rechecked in this round |
| --- | --- |
| Fargues–Scholze, author PDF | Proof of II.2.15 and II.2.16–II.2.20, pp. 71–75; II.3.1–II.3.13, pp. 75–85. |
| Scholze–Weinstein, Berkeley Lectures | Definition 15.2.1 p. 133 and Theorem 15.2.12 p. 139; §22.3 pp. 209–210 and Theorem 22.6.1 p. 213. PDF pagination is printed pagination plus ten. |
| Kedlaya–Liu, arXiv v5 | Lemma 7.1.2 p. 146; §§7.2–7.4 pp. 147–156; §8.5 comparisons/counterexamples pp. 173–175; ampleness results pp. 182–186. |
| Fargues–Fontaine, author copy | Colmez preface Theorem 2.12, pp. 16–17; main-text §8.4.1, pp. 245–247. These have separate pagination. |
| Colmez–Nizioł, CN5.pdf | Introduction p. 2; conventions §1.3.3 p. 8; BC/curvature/HN results §§3.1–3.2, pp. 12–19. |
| Colmez–Dospinescu–Nizioł, GPW5.pdf | §2.1.2–§2.1.4 and Lemma 2.7, pp. 21–23. |
| Scholze–Weinstein, arXiv v2 | Theorem A p. 3; Proposition 3.1.3 p. 22; Lemma 3.5.1 p. 29. |

The Duke version of CN was not read; the source findings remain scoped to the
author preprint. The original Le Bras construction and CN's §4 graph proof
remain source gaps as specified above. No restricted-library book was needed.
The independently confirmed E16–E33 corrections remain in place; this round
adds no new source finding.

## Validation

| Check | Result |
| --- | --- |
| `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystals--VB3.json` | 0 errors, 0 warnings; counts as above. Its source-issue validation passes. |
| `python3 research/blueprint/intake.py check-files` on the four deliverables | 0 problems. |
| Cross-file contract audit | All 76 statements and hypotheses, 70 API contracts, 52 tests, imports and reader anchors agree. The reader also contains every proof, acceptance item, gap and supplier contract. |
| Identity and ownership audit | Top-level independent review, node identifiers, scope, prerequisites, coverage and requests preserved; every source-issue verdict and reviewer identity retained. |
| Node graph | Both vector-bundle parts and their reachable blueprint imports are acyclic: 862 nodes visited with all packets loaded. |
| Source audit | Seven SHA-256 values match fresh public downloads; no excerpt fields, source passages or private local paths in the deliverables. |
| `git diff --check` | Passes. |
| `lean-check` of the suggested file | Exit 0, no errors, 154 warnings, all declarations using `sorry`. Subsequent changes affect comments only; executable content was compared with the compiled input. |

The shared Lean build uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti checkout is
`cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the packet pin
`f790474821cf4256814db967cb154e7af3d0c369`; all seven transitively imported
Tau Ceti modules were checked byte-for-byte against the pinned tree and agree.
Available memory was 112 GB before elaboration. No build, update, cache download
or language server was started. Compilation checks the component signatures;
it does not close G-LEAN or any mathematical gap. `BC.exactSequence` retains
the reviewed baseline-derived proof of its cohomology component.

The next independent review should check that the synchronization resolves its
prior `needs_changes` verdict. Further mathematical work resumes at the named
gaps and supplier interfaces above; it need not reconstruct this revision from
scratch files.
