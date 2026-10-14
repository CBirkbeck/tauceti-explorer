# Independent review of NC.1, revision round 2

Job `REV-AnabelianGeometryAndNonabelianChabauty--NC.1~2`, issue #9273. Reviewer: Claude, session `claude-FY8epi`, 2026-10-14. The input is the revision `BP-AnabelianGeometryAndNonabelianChabauty--NC.1~2` by session `codex-KnjqSB` (PR #9653), which revised the plan of session `codex-qfrsuf` (PR #8645) after the review `REV-AnabelianGeometryAndNonabelianChabauty--NC.1` by session `codex-8q7kof`. This reviewer did none of that work.

Verdict: **accepted**, with corrections made in place. The packet is a complete target-level pass. The stage stays `planned` with its four gaps G1–G4, which are recorded honestly, and every node keeps `implementationStatus: unchecked`.

## What the first review asked for, and whether it was done

The first review withheld acceptance for one reason: the reader contradicted the corrected packet in two places, and it could not edit the reader. Both are repaired.

- **Completed differential comparison.** The reader no longer claims that the whole C_T,X embeds. It keeps the summand F_0=H¹(𝒳,O_𝒳) of M99 Proposition 11.3 (author copy, p. 61) and embeds only the quotient by the weight-zero kernel, as M99 says on p. 62.
- **Proposition 7.4.** The reader now assumes that the **target** family Y′ is irreducibly splittable and deduces the property for the source X′. This is the order of the hypotheses on M99 pp. 43–44, and Proposition 6.5 is then applied to the target.
- **Wider synchronization.** The stale R09.1 and R06.5 supplier sections are replaced by R09.2 and P8. A script confirmed that every statement, hypothesis, proof step, locator, use, prerequisite, API item, test, acceptance line, gap, request and source issue of the packet appears verbatim in the reader. A generator rebuilt from the packet reproduces all 46 node sections of the submitted reader exactly. After this review's corrections, the changed sections were regenerated with it, and the reader and packet agree again.

The revision changed one payload, the supplier of `geometric-outer-comparison`. That change is right. Current TauCetiRoadmap ProfiniteArithmetic §2.3 (read at commit `0d144d0`) gives the outer action E/N→ContinuousOut N of an extension and its continuity. It does not state that an extension with centre-free kernel is the pullback Aut(N)×_{Out(N)}E/N. That is T97 §7A, Lemma 7.1 (pp. 187–188), proved there by exactly this pullback. The first review's claim that §2.3 already supplies it was wrong, and the request to ProfiniteArithmetic, Part II, recorded in G4 and in the fifth restructure entry, is the honest way to record it.

## Counts

| | Before | After |
|---|---|---|
| Nodes | 46 (8 definitions, 3 constructions, 33 theorems, 2 comparisons) | 46, none added or removed |
| Review verdicts | — | 32 verified, 14 corrected |
| API items | 53 | 62 |
| Unit tests | 33 | 35 |
| Planets | 6 | 6 (4 renamed) |
| Baseline declarations | 10 | 10, all confirmed |
| Requests / gaps | 32 / 4 | 32 / 4 |
| Source issues | 3 | 4 (E1–E3 confirmed, E4 added) |

## Corrections made

All corrections were made in the packet, mirrored in the reader and, where they touch declarations, in the suggested file.

1. **`completed-differential-comparison`.** The packet called H_F "the kernel of the weight-zero quotient". In M99 §11 (p. 59) it is the module H_X^F of §6 (p. 37): the largest submodule with no nonzero torsion-free quotient on which an open subgroup acts trivially. The packet already uses "weight zero" for the Hodge–Tate sense, so the old wording was ambiguous. The uniform exponent of (∗)_℘ (p. 60) is independent of the closed point ℘, and each generalized Jacobian pinches x with one point ℘, not with a finite set. Statement, match, proof route and locator are corrected, and the matching wording is fixed in G2 and in the reader's conventions.
2. **`finite-field-tame-isom`.** T97 Lemma 4.1(ii) (p. 163) shows that the lifts of a scheme isomorphism to the universal tame covers differ by the whole arithmetic deck group Aut(Ũ_2/U_2)=Π_2. Theorem 4.3 therefore identifies scheme isomorphisms with group isomorphisms modulo all of Inn(Π_2). The packet said "modulo geometric deck transformations", which is wrong. The statement now says this and notes that refining to geometric conjugacy needs the centre of the base, as M96 does on p. 604. Lemma 4.1 is added to the locator and an acceptance line is added.
3. **`j-geometric-section`** and the new source issue **E4**. M99 §4 assumes a K-point before defining the canonical section of Definition 4.3, but Proposition 5.4 applies the definition to the target curve, which need not have one. The node now defines the test after a finite extension K′ with a Pic¹(K′) point. Restriction is injective on H¹ of the weight-zero quotient (corestriction after restriction is multiplication by [K′:K]), so the test does not depend on K′ and agrees with Definition 4.3 when Pic¹(K)≠∅. The Pic¹(K) characterization of Lemma 4.1, and the API `picard_iff`, are now asserted only under that hypothesis.
4. **`thickness-log-gluing`.** M96 §6 (pp. 599–600) assumes that X is stable, sturdy and untangled. The hypothesis is now stated, with the cofinal-cover route by which a general curve reaches it.
5. **`geometric-outer-comparison`.** The statement now gives the composite with `number-field-isom`, which is M96 Theorem 10.2. That composite is the only use of its prerequisite on `number-field-isom`; the comparison itself is group theory.
6. **Locators.**
   - `weight-zero-quotient`: Definition 3.4 is on p. 27, so pp. 22–26 becomes pp. 22–27.
   - `nondegenerate-section`: Lemma 9.2 is on p. 52, so pp. 48–51 becomes pp. 48–52.
   - `log-admissible-system`: M95 has no numbered "Proposition 3.11" or "Lemmas 3.12–3.13". These are unnumbered statements in paragraphs §3.11–§3.13, and the locator now says so.
7. **API completeness.**
   - `relative-outer-hom` and `relative-outer-isom` had no constructor. Added `ofHom`, `ofIsom`, the two relations `relativeHomSetoid` and `relativeIsomSetoid`, and the open locus `openClasses`; the suggested file already declared all of them.
   - Added `RelativeOuterIsom.trans`, the composition that the node's statement mentions.
   - Added the instance `relativeProPKernel_normal` and the two existence milestones `RelativeProP.projection_exists` and `RelativeProP.lift_exists_unique`, so the file's declarations are all named in the packet.
8. **Discriminating tests.**
   - The packet's main warning about relative Hom and Isom classes is not to quotient by arithmetic conjugators. None of the six earlier tests separated the two relations.
   - In fact, when the arithmetic projection is surjective and Γ has trivial centre, the two relations coincide, so a test needs a base with a centre.
   - Added `relativeHom_sign_test` and `relativeIsom_sign_test`. Over the sign map S_3→C_2, conjugation by a transposition inverts A_3, so it is not an A_3-conjugate of the identity; conjugation by all of S_3 would identify the two classes. Both are elaborated examples in the suggested file.
9. **Planets**, renamed to the sources' names:
   - Admissible fundamental group (M96 §2);
   - Logarithmic Grothendieck conjecture (M96 Theorem B, Theorem 7.4);
   - Profinite Grothendieck conjecture (M96 Theorem A, Theorem 10.2);
   - Pro-p Hom Grothendieck conjecture (M99 Theorem A).
   The other two planets, Geometric pro-p quotient and Canonical relations, are kept.
10. **Suggested file.** The two setoid definitions had their equivalence proofs admitted. They now have short real proofs, so no definition in the file carries an admitted term. The two sign-map examples were added, and the ledger gained `RelativeOuterIsom.trans`.
11. **Coverage.** The `remaining` list of the single coverage record is itemized: G1, G2, G3, G4 and the NC.2 Malcev split. The process sentence about a pending review has been removed.

No baseline citation was removed or replaced, and no node was added.

## Sources

The seven public PDFs listed in `sourceVersions` were downloaded on 2026-10-14 and match the recorded SHA-256 hashes. Page maps were built from the extracted text, and every labelled result cited in a node locator was checked against them. The only mismatches were the three in item 6. T97's text layer garbles Greek letters, so its pages were read as rendered images.

The node statements were read against the results they cite:

- **M99:** author-copy pp. 14–16, 22–38, 40–48, 52, 57–62, 69–73, 76–80 and 85–87.
- **M96:** the statements of every cited result of §§1–7 (pp. 575–607), with pp. 593–594 and 602–607 in full, and pp. 612–619 and 624–626.
- **T97:** Proposition 1.11 (p. 146), Proposition 2.8 (p. 151), §3 (pp. 156 and 161), Lemma 4.1 and Theorem 4.3 (pp. 163–164), Lemma 4.7 (pp. 167–168), the end of Lemma 4.16 (p. 175) and §7A (pp. 187–188).
- **M95:** §§3.9–3.13, author-copy pp. 22–25.

Nothing was quoted into the repository.

- **E1** confirmed (M99 p. 76). The finiteness and unramifiedness of the Hom scheme are argued for nonconstant maps only; the constant maps form a family isomorphic to the target.
- **E2** confirmed (M96 pp. 593–594, M96C correction (1)).
- **E3** confirmed (M95 §3.9, p. 22, against §3.10, p. 24). The identity covering of a nodal curve violates the printed strict bound.
- **E4** new, kind gap, affecting nothing once read as corrected (M99 Proposition 5.4, p. 34, with §4 pp. 28–31). The author's papers page lists only the June 2019 comments on M99, and those concern the appendix.

An errata-v1 wrapper of the four findings and seven source versions passes `scripts/check_errata.py`.

## Baseline

Ten declarations were checked.

- **Tau Ceti.** `MaximalProP.lean` fetched at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` is byte-identical to the shared pinned build (SHA-256 `76c40461…0b80`). Read there: `TauCeti.proPKernel` (line 82), `TauCeti.maximalProPQuotient` (line 90), `TauCeti.proPKernel_le_comap` (line 170; any continuous homomorphism) and `TauCeti.map_proPKernel_eq` (line 186; continuous multiplicative equivalences).
- **Mathlib.** Read in the pinned build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `ContinuousMonoidHom` (line 57), `ContinuousMonoidHom.comp` (line 152), `ContinuousMulEquiv` (line 310), `QuotientGroup.lift` (line 249), `MulAction.stabilizer` (line 515) and `LinearMap.ker` (line 60).

Each provides what its citing nodes use. The relative pro-p milestones of the suggested file were checked to be true from these declarations:

- the image of the pro-p kernel of the closed geometric kernel is closed and normal;
- the kernel identification is a continuous bijection from a compact space to a Hausdorff space;
- factorization follows from `proPKernel_le_comap`.

## Closure and suppliers

The 86 internal edges form an acyclic graph. There are 58 distinct external prerequisites:

- 27 are nodes of other packets, and their statements were read;
- 9 are atlas stage or sub-stage ids, each with a `requests` entry;
- 22 are Tau Ceti roadmap layer anchors, and each anchor exists in both the atlas snapshot and current TauCetiRoadmap main.

Current upstream ProfiniteProPGroups has no centre API, so the Part II request in the first restructure entry is still needed.

Two supplier points to note:

- `FunctionFieldArithmetic:FA.4/profinite-reciprocity` and `FA.4/local-abelian-existence` exist, but their packet's current review is `needs_changes`. Their statements are the standard ones T97 §4 needs; the consuming node should be rechecked when that packet is accepted.
- `number-field-isom` takes the trivial centre of G_K from `galois-centre-free`. That node is proved through the sub-p-adic chain of M99 Lemma 15.8, so the Isom endpoint inherits the whole Hom chain through this one input, although M96 (p. 625) only calls the fact well known. The order is acyclic, so this is not an error. A classical global-field centre theorem would decouple the two endpoints at assembly.

## Granularity, API, tests, suggested file

Granularity is right for target level. Every target of NC.1 (the three endpoints and their helpers) is a node with direct prerequisites and a sound sketch. The proof sketches were read against the cited arguments, and no hidden non-routine step needs its own node at this level.

All 11 definitions and constructions have at least three tests. Their APIs now cover constructor, relation, characterisation, functoriality and the universal property wherever the object has one.

`lean-check` on the corrected suggested file, in the shared pinned build, exits 0 with no errors. The only warnings are 20 `declaration uses sorry`; every other declaration is fully proved. The file declares 24 of the 62 API items and 11 of the 35 tests; the ledger names the other 38 API items, 24 tests and 35 theorem targets. A name check confirms that every API item, test and declaration of the packet appears in the file or its ledger. `scripts/check_sorry_data.py` passes.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.1.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.1.lean`: exit 0, 20 `sorry` warnings and nothing else. More than 100 GB of memory was available.
- `python3 scripts/check_sorry_data.py` on the suggested file: passes.
- `python3 scripts/check_errata.py` on an errata-v1 wrapper of the packet's findings: passes.
- Mechanical reader/packet agreement: full verbatim inclusion before the edits, and exact regeneration of all 46 node sections after them.

## Questions for the orchestrator

1. **ProfiniteArithmetic, Part II.** The centre-free pullback is a short lemma (T97 Lemma 7.1) plus the profinite topology of Aut(N) for topologically finitely generated N, which §2.2 already supplies. A whole Part II for this one lemma may be heavier than needed. It could be offered upstream as an addition to ProfiniteArithmetic §2.3, or carried in the proof sketch of `geometric-outer-comparison`.
2. **NC.2 split, function-field supplier and index.** Three earlier requests still stand:
   - split the NC.2 two-step Malcev foundation before assembly;
   - place FunctionFieldArithmetic below NC.1 in the tier order;
   - index ProfiniteArithmetic in the atlas so that the `geometric-outer-comparison` edge can be drawn.
3. **Centre of G_K for number fields.** Consider citing a classical source for this in `number-field-isom` at assembly, so that the Isom endpoint does not depend on the Hom chain.
