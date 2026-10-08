# Independent review — HodgeStructuresPartII H.4

**Accepted, after corrections made in place, as a complete target-level planning pass.** H.4 remains **planned**, not closed: gaps G1–G6 and three supplier requests are open and recorded precisely. No node is implemented, and every `implementationStatus` remains `unchecked`.

Reviewer: Claude, session `claude-3pY6pQ`, job `REV-HodgeStructuresPartII--H.4`, Refs #7061. Date: 8 October 2026. The input was written by Codex session `codex-XTNtJa` for #6942 (PR #7318); this reviewer did none of that work. The bot confirmed this session's claim before the review began.

Files reviewed and corrected: the [packet](../packets/HodgeStructuresPartII--H.4.json), the [reader](../readmes/HodgeStructuresPartII--H.4.md) and the [suggested Lean file](../suggested/HodgeStructuresPartII--H.4.lean), as they stood at commit `fd3033287`.

## Counts

| Item | Input | Reviewed result |
| --- | ---: | ---: |
| Nodes | 29 | 30: 27 corrected, 3 added, 2 removed as duplicates |
| Definitions / constructions / theorems / comparisons / lemmas | 5 / 6 / 8 / 2 / 8 | 5 / 7 / 9 / 1 / 8 |
| API items | 41 | 96 |
| Unit tests | 44 | 70 |
| Planets | 6 | 6 (one renamed) |
| Baseline declarations | 10 | 8, all re-read; 2 removed as no longer cited |
| Gaps / requests | 4 / 6 | 6 / 3 |
| Source issues | 6 | 8: six confirmed, two added and confirmed |

`python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings. `lean-check` on the suggested file at the pinned Mathlib: exit 0; its only warnings are the 170 declarations with unfinished proofs.

## Corrections made in place

1. **Duplicate of an H.3 node removed.** `trace-pairing` and `trace-pairing-perfect` planned the pairing B_E:(E⊗K(D))×(E∨⊗K)→K²(D) and its perfection. `HodgeStructuresPartII:H.3/trace-multiplication` plans the same sheaf pairing, from the same equation LL24 (5.5), including perfection, and H.3 needs it for the period-map derivative. H.3 precedes H.4, so it is the owner. Both H.4 nodes were removed. `trace-section-map` now cites the H.3 node and keeps the H.4-specific section map at a vector, its sheaf kernel and its rank. The pairing's naturality and the off-diagonal and E=0 tests that H.4 had written are recorded below for H.3's review.
2. **A missing key theorem, misdirected to H.2.** Proposition 5.2.3 of LL24 is applied to the parabolic bundle of the canonical extension of a unitary system on a fibre. The proof needs that bundle to have parabolic degree zero and to be semistable (LL24 Remark 5.2.2 and the proof of Theorem 1.7.1). The packet requested this from H.2, but H.2 has no parabolic notions and precedes H.4, so it cannot state it. Two nodes were added (`addedBy` the review):
   - `connection-parabolic-structure`: the parabolic structure of a logarithmic connection (LL22 Definition 3.3.1), with API and tests distinguishing generalized from ordinary eigenspaces and fractional parts from raw real parts.
   - `unitary-parabolic-semistable`: degree zero from the residue theorem deg E=−Σ tr Res, which holds for every local system; semistability, in fact polystability, from Mehta–Seshadri (MS80 §1) for unitary systems. H.1's accepted harmonic correspondence gives the case D=∅. The identification of Mehta–Seshadri's Fuchsian-model bundle with the canonical-extension structure rests on Simpson 1990 Theorem 5 and AHL19 Proposition 5.4. Neither proof was read, so this is the new gap G6.
3. **A construction used but never made.** E⋆⊗L appears in the statements of `dual-twist-semistable`, `coparabolic-dual-twist` and `trace-rank-bound` and in the degree API, but nothing constructed it. Added `parabolic-twist` (LL22 Definition 2.6.3 with a trivially structured line). Its tests distinguish the twist from a weight shift and check the rank factor in the degree.
4. **Suppliers made exact.** The stage prerequisites `HodgeStructuresPartII:H.2` and `HodgeStructuresPartII:H.3` were replaced by the nodes that supply what is used, after reading their statements:
   - from H.2: `canonical-extension`, `residue-monodromy`, `unitary-curve-fiber`, `unitary-curve-family`, `unitary-bigrading`, `irreducible-real-form`, `irreducible-evaluation`, `isotypic-hodge` and `gauss-manin`;
   - from H.3: `curve-hodge-filtration`, `derivative-connection`, `trace-period-derivative` and `trace-derivative-rank`;
   - for the moduli stack: the reserved key definition `StableReductionPartII:key/moduli-curves` and `StableReductionPartII:MC.2/pointed-dm-theorem`.

   Four requests are resolved by these nodes and were removed: canonical extension, VMHS and fixed part, trace derivative, and the R09.1 Grassmannian (which H.3 already requests). Two requests were added or re-scoped:
   - H.2 is asked to define unitary local systems. H.2 already uses the notion, and the only definition (`H.5/unitary-representation`) sits downstream of H.4.
   - The Artinian-coefficient request now asks H.2 to extend `gauss-manin` to local systems with an action of a finite-dimensional ℂ-algebra, with the projection formula.

   G3 was narrowed to the analytic versal-family and classifying-map interfaces. A new gap G5 records that H.2 states admissibility, and hence the fixed part, only under quasi-unipotent boundary monodromy (H.2's own G6/G15), while LL24 uses an arbitrary unitary V.
5. **A false description of the dual.** The packet said the dual weights sit on the dual annihilator flags. At a mark carrying both weight 0 and a positive weight, the fibre of the dual's underlying bundle (Ê₀)∨(−D) is an extension of (E/E²)∨ (weight 0) by (E²)∨⊗T*_x (weights 1−α). It is not E(x)∨; see `parabolicDual.mixed_rank_two`. The statement and API were corrected, following LL22 Definition 2.6.1 and Lemma 2.6.2.
6. **Locators and boilerplate.** Corrected locators:
   - dual and dual degree: LL22 Definition 2.6.1 and Lemmas 2.6.2, 2.6.5, p.15 (they cited the unrelated Lemma 6.3.3);
   - twist degree: Definition 2.6.3 and Lemma 2.6.5;
   - degree additivity and the quotient criterion: Lemma 2.4.5, p.14;
   - degree bounds: Lemma 6.3.3, p.40;
   - Lemma 6.1.1: p.33.

   Every `match` was the same boilerplate sentence, as were the `uses` of every definition and the `acceptance` of every definition and lemma. All were rewritten, in the reviewer's words, to say what each cited place proves and where each object is used. The induced-quotient statement's clash of notation between flag steps and kernel was removed, and the quotient criterion was stated exactly.
7. **API and discriminating tests.** A user could not work with the parabolic objects without unfolding them, and several tests caught no plausible wrong definition. In particular, none of the four semistability tests used a weight. Added:
   - the ℝ-filtration E_α with E_{α+1}=E_α(−D), its threshold steps and extensionality;
   - parabolic morphisms, direct sums, adapted frames and the shift E[ε];
   - the dual's underlying lattice, functoriality, exactness on induced sequences and twist compatibility;
   - the coparabolic bridge Ê₀=E_ε, and the trace-section sheaf map with the rank–deficit identity.

   New tests, each hand-checked, catch:
   - the weighting by dim Fᵢ instead of graded dimension;
   - weights counted without multiplicity;
   - the minimum-weight rule, on a two-dimensional subbundle of ℂ³;
   - ordinary semistability or the minimum rule, using O⊕O on ℙ¹ with weights 0, 1/2, which is not semistable;
   - weights that stabilize, using O⊕O(−1) on ℙ¹ with three marks and weights 0, 1/3, which is semistable although O⊕O(−1) is not;
   - the reversed slope inequality;
   - the mixed-mark dual;
   - generic sheaf rank in place of section rank.
8. **Planet name.** "Sublocal-system rank bound" became "Sub-local system rank bound", the source's term.

## Sources and findings

Re-downloaded LL24 (arXiv 2205.15352v4), LL22 (arXiv 2202.00039v3), BPGN97 (arXiv alg-geom/9511003v1) and Litt's errata page, and reproduced all four recorded SHA-256 values. Read, with proofs:
- LL24 Theorem 1.7.1, Notation 1.10.1, §§2.1 and 2.4, §§4.1–4.2, §§5.1–5.2 and §§6.1–6.2;
- LL22 §§2.1–2.6, Definition 3.3.1 with Proposition 3.3.2, and §§6.1–6.3;
- BPGN97 Theorem 2.1;
- the P04 and P05 erratum entries.

Added two sources to the packet with hashes:
- MS80, Mehta–Seshadri, read §1 in the Indian Academy of Sciences repository copy of the published article;
- AHL19, arXiv 1801.02562v3, read §§4–5.

Simpson's 1990 paper is served only behind a browser challenge and was not read, and neither was Brunebarbe's account, to which AHL19 refers its proof. That boundary is G6.

Verdicts on the packet's findings (the `review` object of each entry):
- **E-H4-1** confirmed. "Stable" for "semistable" in the proof of Proposition 5.2.3 and Remark 5.2.5. Its `known` was changed to `new`: the adopted P04 erratum leaves it out. The previous wording made the errata register list it as corrected in print.
- **E-H4-2** confirmed. The vector of Lemma 6.1.1 lies in an isomorphic copy L′ of L, not in L. Example: L sitting diagonally in L⊗Q with Q of types (1,0) and (0,1) meets F¹ trivially. `known` changed to `new` for the same reason.
- **E-H4-3** and **E-H4-4** confirmed, as corrected by the P04 erratum (the realification identity, and g≥1 in Lemma 2.4.2).
- **E-H4-5** and **E-H4-6** confirmed: the missing −δ in the intermediate goal, and the HN index range, in the proof of LL22 Proposition 6.3.6. Their `known` text, a search note, was set to `new`, with the note moved to `searched`; otherwise `scripts/errata.py` files them as corrected in print.
- The `printed` fields of E-H4-3 and E-H4-4 were rewritten to say what the source asserts.

Added findings, both of kind misprint and affecting nothing:
- **E-H4-7.** In the proof of LL22 Lemma 6.3.4 (p.41) the ε-shift of a bundle of parabolic slope r+n is said to have slope r+n−ε. Shifting lowers the parabolic degree by ε·rank at each of the n marks, so the slope is r+n−nε. A weight-zero line with two marks has shift O(−D) with weights 1−ε, of parabolic degree −2ε. Only the limit ε→0 is used.
- **E-H4-8.** LL24 p.30 calls Ê₀⊂E a subbundle. It is a full-rank locally free subsheaf with skyscraper cokernel, for example E(−D) for the trivial structure.

## Baseline

Every declaration was read in its module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:
- `Submodule`, `Module.finrank` (zero on infinite rank; also used for the free ℂ⟦t⟧-lattice of `coparabolic-rank`, so its `provides` text was widened);
- `LinearMap.range`, `PowerSeries.coeff` (ring implicit), `Representation`, `Subrepresentation`;
- `Representation.invariants`, `SheafOfModules.IsLocallyFree`.

All are accurate for their citing nodes. Two were removed because no node cites them after the corrections:
- `Module.evalEquiv` was cited only by the removed trace nodes.
- `Module.Grassmannian` (quotient-rank convention) belongs to H.3's period map.

`finrank` and `range` were added to the nodes whose Lean forms use them. The reviewed library coverage has no record for this roadmap, and no audited layer records parabolic bundles, Mehta–Seshadri, vector-bundle HN or vector Clifford as built.

## Structure, closure and ownership

- **Cycles.** A node-level search over all packets from every new external prerequisite never reaches H.4. The only stage that depends on H.4 is H.5. A simulation of the atlas assembly gives no `skippedLinks`; the StableReductionPartII links appear once that roadmap is promoted.
- **Closure.** Every target of the stage description is realised. Every prerequisite chain ends in a library declaration, an existing node, a requested stage or a recorded gap:
  - G1: vector HN and Clifford, and generic global generation;
  - G2: LL24 Lemma 2.4.2, routed to the pending MappingClassGroupsAndCanonicalRepresentations design;
  - G3: analytic versal-family interfaces;
  - G4: global Lean carriers;
  - G5: unrestricted admissibility;
  - G6: the open-curve Mehta–Seshadri comparison.
- **Route accounting.** The packet's new `routeAccounting` maps the PAPER-LANDESMAN-LITT-24 items 8, 44–50, 121 and 122 to nodes. Only the direction of Mehta–Seshadri that LL24 uses is planned; the converse is not needed and not planned.
- **Granularity.** Target level, as set. No proof was split into lemmas beyond the eight API facts that other nodes cite.

## Suggested Lean file

The input file elaborated. A static check found no false statement, but several tests were off-target or tautological:
- `inducedQuotient.native_map` and the dual-weight tests tested auxiliary scalars;
- `coparabolic_distinct` used a literal;
- `quotient_iff` and `IsParabolicallySemistable.iso` were bare arithmetic or equality transport.

These were restated on the objects. The restated `iso` needs equal ranks as a hypothesis, since with no marks nothing else forces them. The duplicate trace pairing was replaced by the fibre model `LinearMap.applyₗ`. Signatures, API items and labelled tests were added for the three new nodes and for the new API and tests: a formal-disc model of E_α for α≥0, fibre-level morphisms, direct sums, shifts and the numerical dual and twist identities.

Sixteen packet names need global curve, sheaf or section carriers and have no declaration; they are listed in `prototypeMap.omittedSignatures` and in the file's closing inventory. A parity script confirms that every other packet name occurs. As in the other parts of this roadmap, the named geometric theorems keep only their numerical or linear portion, and the inventory says what each omits.

## Questions and notes for the orchestrator

1. **H.3's review (#7027).** H.3 now owns the only trace pairing. H.4's former items should be absorbed there:
   - naturality under isomorphisms;
   - the adjoint form of perfection;
   - the tests at E=0 and on an off-diagonal basis pair.
2. **H.2's review (#7026).** Two requests now point at H.2:
   - the definition of unitary local systems;
   - the Artinian-coefficient extension of `gauss-manin`.

   The H.0 route accounting assigns PAPER item 121 to H.2, but it is now planned in H.4.
3. **H.5 (consumer of H.4; for its owner):**
   - After its review (#7341), `versal-unitary-rigidity` cites `artinian-vanishing` and `low-rank-pvhs-unitary` cites `parabolic-semistability` and `parabolic-clifford-rank`; all three ids are kept here. Where `low-rank-pvhs-unitary` uses that the canonical parabolic extension of a unitary system is semistable, the supplier is now `unitary-parabolic-semistable`.
   - The text of `versal-unitary-rigidity` still says that versal families are supplied through H.4. That is inaccurate: G3 points at StableReductionPartII.
   - Its claim "cohomologically rigid for every good compactification" (still present) is the sentence the P04 erratum deletes from LL24 Proposition 8.2.1, since it needs quasi-unipotent boundary monodromy.
   - Any owner of the open-curve tame harmonic theory (G6) must precede H.4, or the stages form a cycle.
4. **Ownership proposals:**
   - Ordinary Harder–Narasimhan theory for bundles on curves over finite fields is already routed to GlobalShtukasAndFunctionFieldLanglands:GS.0. The Algebraic curves Part II proposal in `restructure` should plan it once, over any base field.
   - The MappingClassGroupsAndCanonicalRepresentations design must put LL24 §§1.10–2.4 in a stage that does not require H.4, because H.4 needs Lemma 2.4.2 from it.
5. **Errata register.** `PAPER-LANDESMAN-LITT-24/E10` still says `new`, although the P04 erratum adds g≥1 to Lemma 2.4.2. The register currently lists E-H4-1 and E-H4-2 under "already corrected in print"; with `known: new` they will move on the next run of `scripts/errata.py`.
