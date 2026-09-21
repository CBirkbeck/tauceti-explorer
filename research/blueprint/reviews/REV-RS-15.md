# REV-RS-15 — isocrystals, Banach–Colmez spaces and B(G)

**Verdict: accepted with the corrections recorded in the proposal.** This accepts the ownership and dependency restructuring, including its atomic edge replacement. It does not certify a closed blueprint, accept every inherited source transcription, or claim formalization.

Reviewer: ChatGPT Pro — `cg-6b83f1`, review key `independent-review-REV-RS-15`. Date: 2026-09-21. Refs #829. The author was session `astra-20260921-f6b2d8`; I did not author RS-15. My own RS-12 and RS-25 proposals are not reviewed here.

Both roadmaps and all seventeen stage identities remain. The sole narrowing is `VB3:general-BC`: ordinary-bundle projectivized properness has one owner in `VB3:projectivized-properness`, and its nowhere-zero-section application has one owner in `VB4`. The stronger two-term theorem stays in general-BC. No anchor is changed; this family has no anchors and neither roadmap needs a Part II retitle.

## 1. The edge reversal is justified, but must be atomic

Use `VB` for `VectorBundlesAndIsocrystals` and `BG` for `BunGAndNewtonStrata` in this report. JSON endpoints retain their full identifiers.

The existing atlas lists general-BC as a prerequisite of VB4, while the VB4 document explicitly names the earlier properness branch. The source supports the document: Fargues–Scholze II.2.19 uses II.2.16 to obtain a closed nonvanishing locus and a suitable cover; II.3.1–5 then use the family HN results. I inspected the proof, not only the numbering of the statements.

Integration must perform exactly this replacement:

| Operation | Dependency |
| --- | --- |
| Remove | `VB3:general-BC -> VB4` |
| Retain | `VB3:projectivized-properness -> VB4` |
| Add | `VB4 -> VB3:general-BC` |

Apply it to `requires`, edge records, consumer lists and regenerated extracts together. The existing JSON layer reasons and link reason already state this requirement. Section 15 does not define a deletion field, so an invented JSON key is not a substitute for applying it. Retain all other native edges and the proposal's remaining positive links.

I independently ran the full graph, not only the author's affected slice. The replacement gives an acyclic graph. An additive-only application gives a cycle. All 713 pending link-map rows can also be added after the replacement without creating a cycle. This checks those link maps, not an automatic simultaneous application of every unaccepted restructuring proposal.

## 2. Four corrections applied

The original author's report is left unchanged as provenance. Amendments are in the proposal's operative stage contracts and its top-level review object. The inherited decomposition itself is outside this review's write scope; integration must reconcile the named statements without deleting their targets or IDs.

### Coefficient field, finite dimension and sign

The inherited `VB0/isocrystal-category-and-standard-block` title inverts the uniformizer, but its statement instead calls the ring of integers a vector-space coefficient field. The contract now fixes

`L = W_{O_E}(algebraic closure of F_q)[1/pi]`,

and in equal characteristic `L = k((pi))`, not `k[[pi]]`. This is essential for arbitrary rational slopes. It also fixes the translation from the roadmap's `phi^r = pi^s sigma^r` convention: isocrystal slope `s/r` corresponds to bundle slope `-s/r`, rank `r` and degree `-s`. The inherited block with `pi^(-d)` therefore has isocrystal slope `-d/h`, not `d/h`. Multiplicity of a simple block is distinguished from its rank.

Fresh inspection of the pinned Mathlib file confirms that `WittVector.Isocrystal` carries a semilinear equivalence but does not itself require finite dimensionality. `isocrystal_classification` supplies a rank-one existence statement over an algebraically closed characteristic-p field. It is not the full higher-rank or general-coefficient theorem. The proposal retains those genuine extensions and the required compatibility rather than redefining the p-typical carrier.

### A source typo: degree versus slope

The inherited `VB3:general-BC/positive-slope-resolution` repeats the phrase “semistable of degree 1/r” from FS II.3.1. I checked the printed page visually; it is not merely corrupted extracted text. The proof's own rank/degree bookkeeping forces **slope** `1/r` in this sentence.

Indeed, if the input has rank `n`, degree `d` and the kernel is a trivial bundle of rank `m = dr - n`, exactness gives middle-term rank `n+m = dr` and degree `d`. Its slope is therefore `d/(dr) = 1/r` when nonzero. For `n=d=1`, `r=2`, the middle term has rank two and degree one, not degree one-half. This argument diagnoses the transcription; it does not assert that numerical bookkeeping constructs the extension. The zero case remains separate.

The corrected contract retains the original locality and existence obligations. A finite rational-arithmetic regression check covered 1,002 admissible positive triples; that is a consistency test, not a Lean proof or a proof of the resolution theorem.

### The stronger Banach–Colmez object is not termwise sections

The general-BC contract now places `E_1` in cohomological degree minus one and `E_0` in degree zero, and names degree-zero **hypercohomology**. It is not just a cokernel on global sections. This prevents the retained two-term theory from collapsing to the earlier ordinary-bundle construction.

Three interface checks remain explicit: `[0 -> O(1)]` recovers positive sections; `[O(-1) -> 0]` recovers the negative bundle's first cohomology; and the zero complex gives the zero vector sheaf, with empty projectivization. These clarify the retained target rather than adding a duplicate owner.

### Slope-zero tests and disconnected bases

On a fixed-rank locus, a bundle whose geometric slopes are all zero has a horizontal polygon with fixed width. The inherited request for such a bundle with a nonconstant polygon is not a valid negative test. Replace it by nontrivial local-system monodromy, and by `O(1) ⊕ O(-1)` as a degree-zero bundle that is not slope-zero. This does not rule out different ranks on different connected components; handle those componentwise.

The contract also keeps the scalar **sheaf**: `H^0(X_S,O) = underline(E)(S)`, not an unconditional single copy of `E`. The disjoint union of two geometric points gives `E × E`. Likewise retain the derived pro-étale cohomology comparison, not a global-triviality assertion. These are the concrete versions of two cautions already identified in the author's report.

## 3. All family evidence was classified

The twenty directional records give eight unordered pairs. Numbers follow the family file, without reordering.

| Rows | Pair | Disposition |
| --- | --- | --- |
| 1, 2, 11, 12 | BG0 / VB0 | Linear tensor category versus reductive torsor and sigma-centralizer application. Import VB0; keep both. |
| 3, 15 | BG0 / VB2:classification | Misplaced overlap lead: the geometric G-bundle classification belongs to BG2:uniformization, not BG0. Do not add a classification dependency to early torsor recognition. |
| 4, 13 | BG1 / VB0 | Linear slopes normalize the GL_n case; general Kottwitz and Newton invariants remain in BG1. |
| 5, 14 | BG2 / VB1 | Actual vector-bundle descent and the linear functor supply, but do not equal, the G-bundle stack and uniformization theorem. |
| 6, 19 | BG2 / VB4 | A family HN input to reductive variation and classification, not a duplicate construction. |
| 7, 8, 16, 17 | BG3 / VB3 | Additive geometry is imported. The full automorphism group and its nonbasic connected kernel remain new BG3 work. |
| 9, 18 | BG3 / general-BC | Preserve the graded-piece supplier; it does not construct the noncommutative filtration or quotient by itself. |
| 10, 20 | BG3 / VB4 | Keep the family input and its forwarded application; do not identify geometric classification with a relative torsor trivialization. |

The two actual repeated proof packages within VB3 are precisely the two owner records. The ordinary properness theorem, its HN application, and the stronger two-term theorem are not merged into one statement.

## 4. Conservation of all stages and consumers

The seven omitted stages stay unchanged by section 15: BG2, BG2:smooth-Artin, BG4, VB2, VB2:ampleness, VB3 and VB3:positive-basic-examples. In particular the omitted aggregate stages are not extra owners, and omission does not delete their child results.

The other ten stages preserve their full scope: general-coefficient isocrystals and Brauer comparison; actual bundle descent and scoped cohomology; geometric classification without full faithfulness; early independent positive/properness branches; family HN and local systems; nonsplit reductive torsors, invariants, uniformization, strata and connected kernels. The general-BC narrowing keeps its family resolutions, pure-sign absolute results, topology-specific covers and bounded perfectoid-ball range. No entire Banach–Colmez space is newly claimed perfectoid just from its dimension.

The BG3 test `O ⊕ O(1)` continues to distinguish the full automorphism group from its locally profinite quotient: the off-diagonal positive section space must not be discarded. The later connected-kernel coefficient comparison remains a VS4 theorem. Similarly, the whole-stack dimension statement in BG2:smooth-Artin is not inferred from dimension-zero basic strata.

All twelve native external exports remain, reaching seven recipient stages:

| Recipient | Family suppliers preserved |
| --- | --- |
| ES7:parabolic | BG3, BG4 |
| GS0:loop-geometry | BG0 |
| HS0 | BG2:uniformization |
| HS2 | BG3 |
| RF4:G-torsors | BG0 |
| VS1 | VB1, general-BC, VB4 |
| VS4 | BG2:smooth-Artin, BG3, BG4 |

I read these recipient descriptions and checked all seven non-self forwarding obligations for the narrowed stage. The new direct inputs do not replace its stronger export. Negative-path checks also preserve the early torsor/late patching direction and the early Schubert return: neither RF4:G-torsors, completed Satake nor VS4 feeds back into the early constructor it is meant to use.

## 5. Sources, baseline and validation receipts

Source snapshot: repository Pages artifact at `7de7e5d38cea81cf2d4a14c25ad69e93e203f494`, run `35617180571`, artifact `10646855192`. GitHub's comparison through `e1d520110a3a3950d6011b1c762e0161f6f25e9b` contained queue/rule, paper-routing, naming and UI changes, but no change to the reviewed mathematical inputs, atlas or checker. The updated WORKERS rules were also read.

Read both complete member documents, all seventeen stage descriptions, the original proposal/report, the twenty evidence rows, the 23-node inherited inventory and its gaps, the recipient contracts and relevant supplier stages. The reviewed coverage file has accepted AUDIT-20 entries for the seven BG stages, all reported not built. AUDIT-39 remains pending; its VB observations are leads, not accepted library verdicts. I read the AUDIT-20 review and checked its relevant distinction between general infrastructure and the specific missing geometric objects. No fresh exhaustive Tau Ceti absence search is claimed.

Fresh primary-source checks:

- [Fargues–Scholze, Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf): II.2.16–20, II.3.1–5 and III.5.1–3. Printed pp. 74–75 and 104 were inspected visually; the requests for pp. 72 and 79–80 failed with a cache error, so the available parsed passages were used there. No successful screenshot of those failed pages is claimed. Access date: 2026-09-21; no fresh PDF byte hash.
- [Mathlib Isocrystal.lean at the pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean), lines 32–215, including surrounding variables, carrier, maps, standard block and rank-one theorem. Blob `cfe4966b0359b5af9d4fa01b62a89185e7bf8fe6`.

The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Input | Git blob |
| --- | --- |
| RS-15 family | `b815f7ea512233812d28e850dfd8389e9c60a952` |
| Original RS-15 report | `3962ab70aacb48701694161b2863fdbecab2f1f8` |
| VB document | `ba29f7617341b31714d15876cc79d790df129959` |
| BG document | `6044b82840c76eed502cc9670c377957e8c57b70` |
| Inherited VB decomposition | `c9262d3817dbddbd2ac97a460f20470a2d0f501d` |
| Reviewed coverage | `5e708cfc74a51b10e62149113872fe4e00eb5846` |

Actual checks:

`python3 scripts/check_restructure.py research/blueprint/restructure/RS-15.result.json` reports **ok**. The fifteen positive links are unique, non-self, have known non-retired endpoints, and include six new native edges. With the one required deletion, the full graph has 2,019 vertices and 3,513 edges and is acyclic; the native input has 1,968 stage records and 3,508 edges. The union with 713 pending link rows has 4,201 edges and is also acyclic. Adding the pending REV-RS-20 proposal's positive links to that graph also stays acyclic; this does not resolve that review's separate mathematical blocker.

The seven forwarding checks, twelve external-export checks, six negative-path checks and additive-only failure control passed. The rank/degree arithmetic checks passed in 1,002 cases. **Lean was not run**; no Lean file is a deliverable of this restructuring review. No git command, manual merge, label change, issue closure or atlas promotion was performed.

## 6. Handoff and limits of acceptance

Apply the edge replacement atomically, retain both owners and all stages, and reconcile the four inherited-statement corrections. Rerun the graph on current main. The accepted object is this restructuring proposal, not its inherited partial decomposition.

The full Dieudonné–Manin/Brauer source proofs, mixed-characteristic Lubin–Tate bridge and precise node placement of early carriers versus later cohomology remain blueprint obligations already recorded by the earlier work. The RF3 global-Proj covering/twist problem is separately recorded by REV-RS-20; this review does not erase it or add a circular reverse ampleness dependency. Those outstanding proofs do not justify duplicating the linear theory inside the reductive roadmap, nor deleting the stronger family theorem.
