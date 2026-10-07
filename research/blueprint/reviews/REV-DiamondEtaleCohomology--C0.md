# REV-DiamondEtaleCohomology--C0

**Verdict: accepted after corrections, 7 October 2026.**

- Reviewer: Claude, session claude-th7POo (issue #386).
- Under review: the packet and suggested file written by Claude, session claude-Ow9Ujk (issue #709, PR #6855). This reviewer wrote none of that work.
- Granularity: this accepts a complete target-level planning pass (PROTOCOL sections 0 and 2). The roadmap's distance puts it at target level.
- Stages: all eight (C0–C7) stay **planned** and none is closed. Two gaps remain recorded:
  - an E46 gap carried over from the packet;
  - a new gap found by this review.

  The packet's other gap (E60) is closed.
- Every implementation status remains `unchecked`.
- The per-node evidence is in the packet's `review.checked`: 32 nodes verified, 86 corrected, 1 added.

| Measure | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 118 | 119 |
| Definitions / constructions / theorems / lemmas | 13 / 19 / 71 / 15 | 13 / 19 / 72 / 15 |
| API items | 191 | 218 |
| Unit tests | 137 | 140 |
| Planets | 37 | 36 |
| Pinned baseline declarations | 20 | 21 |
| Supplier requests / gaps | 9 / 2 | 9 / 2 (E60 closed, 20.13 added) |
| Source issues (own / inherited) | 0 / 21 | 8 / 22 |
| Restructure entries | 4 | 6 |
| Planned / closed stages | 8 / 0 | 8 / 0 |

Checks run:

- `python3 scripts/check_blueprint.py` on the reviewed packet: 0 errors, 0 warnings.
- An errata-v1 projection of the packet's `sourceIssues` passes `scripts/check_errata.py`.
- `lean-check` elaborates the revised suggested file in the shared build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Its only warnings are `declaration uses sorry` (657; the input had 636).
- A script confirms that every API and test name in the packet occurs in the file.
- No pinned declaration index is installed on this machine. Every baseline declaration was therefore read in the Mathlib source tree at the pinned commit.

## Method

The packet was checked stage by stage. Five stage passes covered C0, C1–C2, C3–C4, C5–C6 and C7, with a sixth pass comparing the suggested Lean file against the packet. Each pass read the ECD statements and proofs, the errata and every cited supplier node. I then rechecked each proposed correction against its evidence (the ECD passage, the supplier node's statement or the Mathlib source) before applying it. Only one finding was rejected (C4 F11 below). The corrections were applied with a script that asserts every replaced string occurs once, so each change is reproducible.

## What was read

| Source | Version and hash | Passages checked |
| --- | --- | --- |
| [Scholze, Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4) (ECD) | arXiv v4; SHA-256 `78ca42bb…3efc`, matching the packet | §14, §16–§20 in full, statements and proofs. For the cited inputs also §§7.16–7.23, 8 (p. 41), 9.5, 10.4, 10.9–10.10, 11.23–11.31, 12.11, 12.15, Lemma 4.1 and p. 130. |
| [Stacks Project](https://stacks.math.columbia.edu) | online, 7 October 2026 | Tags 0652, 0658, 066E (Tor amplitude and perfect complexes) |

All 214 original excerpts were found verbatim in the extracted ECD text (NFKC- and whitespace-normalised). For 7 of them the extraction flattens sub- and superscripts (for example `λ∗Y`, `Uy`), and those were confirmed by hand. The excerpt of the added node was checked the same way.

The supplier nodes were opened and compared with how each citing node uses them:

- DiamondsAndVStacks: D0–D5.
- PerfectoidSpaces: P2–P7.
- EnhancedDerivedSheaves: E1–E3. The E2 nodes are stated for abelian sheaves, which confirms the module-coefficient request.
- ClassicalAdicEtaleCohomology: H1, H2, H3 and H4.
- The C8 part's point-quotient, specialization-stabilizer, point-sheaf and strictly-disconnected-acyclic nodes.
- DeformationAndDerivedPatchingAlgebra P7 and SchemeKTheoryOperations S.1.

Also read: the stage texts of C0–C7, SF.2 and H3; the reviewed audit AUDIT-36, which records C0–C7 as not built, so nothing is planned that the libraries contain; RS-05; and RT-AREA-padic-1 with its two fix reports.

## Baseline

All 20 cited declarations exist under their names at the pinned commit, and each provides what its citing nodes need:

- `CategoryTheory.Adjunction`, `Functor.IsCocontinuous`, `Functor.IsContinuous`
- `GrothendieckTopology`, `GrothendieckTopology.Point`
- `IsFinitelyPresentable`, `MonoidalCategory`, `MonoidalClosed`
- `ObjectProperty.IsTriangulated`, `Sheaf`, `Sheaf.H`, `DerivedCategory`
- `IsClosedMap`, `IsNoetherianRing`, `IsProperMap` (with `isProperMap_iff_universally_closed` and `isProperMap_iff_isCompact_preimage` in neighbouring files)
- `Module.Finite`, `ModuleCat`, `SpectralSpace`, `TopCat.Sheaf`, `Topology.IsConstructible`

None was removed. One was added: `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system` (`Mathlib/Topology/Category/TopCat/Limits/Konig.lean`). It shows that the limit map in the two repleteness towers is surjective.

## Corrections

The full list, node by node, is in `review.checked`. The substantive ones follow.

**C0 (§14.1–14.11).**
- **Repleteness.** The countable lifting-tower proofs of repleteness, for both the v-site and the quasi-pro-étale site, are valid. They replace ECD's weakly contractible basis, as the stage text asks. Only the surjectivity of the limit map needed a citation.
- **14.7.** The approximation step applied the hull formula to fibre powers of X′, which are not strictly totally disconnected. It now goes through the comparison square, 14.7/14.8 in degree 0, and continuity 14.9, and the approximation by rational subsets of balls is written out.
- **E46 gap.** The second recorded repair route for this gap does not work as described: λ° of a hypercover can fail to be a hypercover over Spa(C, O_C). The route is restated with the input it lacks. The gap now also lists `unbounded-comparison-std` and the three C2 nodes that inherit it.
- **14.2.** The generating families were not stable under fibre products. This fails for non-quasiseparated Y on the étale site, and for strictly totally disconnected objects on the v-site.
- **14.8.** The proof cited a filtered-colimit node instead of the Čech-to-derived comparison that ECD 8.5 and BS15 5.1.6 use.
- **Smaller fixes:**
  - the hull fibre-product surjectivity now cites D4;
  - the local-isomorphism argument in `std-etale-acyclic` is repaired;
  - cancellation for étale maps now cites ECD 10.4(ii) (D3), not 11.30;
  - "κ-small" is now defined for small v-sheaves;
  - geometric stalks get an independence API;
  - the cutoff transitions now commute with countable products;
  - the relative form of 14.9 keeps the degree ranges.

**C1 (§16).**
- **16.1.** The three cases of 16.1 keep their exact hypotheses.
- **Reduction step.** The fibrewise step needs continuity, which is the stage's "continuity steps". The dévissage step needs filtered colimits of constructible sheaves, whose graded pieces are i_!M rather than j_!M.
- **Lemma 16.3.** This is ClassicalAdicEtaleCohomology H2's lemma. H2 proves it through Scholze 2012, Corollary 7.18, so the D6 dependency the stage text names (ECD Lemma 15.6) is not needed. This is now recorded in C1's coverage. The bridge from H2's perfectoid étale site to the diamond étale site is cited. E51 was added to the inherited issues.
- **API.** `base-change-transformations` gained the composition and pasting laws and the slice isomorphism that 16.9 uses. X̃ must be strictly totally disconnected in every "final statement".

**C2 (§14.12–14.16, 17.1–17.4).**
- **Circularity.** The proof of 14.15 used the cohomology-sheaf criterion 14.16, which is proved from it. Closure under Postnikov limits is now proved directly.
- **Left completion.** It was ambiguous: the 1-category of towers loses the lim¹ term. It now names E2's construction. The enhancement and cutoff compatibility claimed in the statement (and requested by the C8 part) now has a proof step.
- **`etale-test-on-one-cover`.** It assumed that Y′ ×_Y X is locally spatial over a small v-stack; the proof now passes to a strictly totally disconnected cover. The unproved "≠" clause was removed and recorded as not planned.
- **Bounded formula for R_Yét.** This formula (item 381, asserted in ECD) is true. The supplied second step was invalid and is replaced by the truncation-adjunction argument.
- **17.3 and 17.1.** Hyperdescent is now stated at a cutoff, with the change-of-cutoff and pullback compatibility the stage text demands. The pullback functoriality of 𝒟_ét was added.

**C3 (§17.5–17.9).**
- **Base change for v-stacks.** The transformation g^∗Rf∗ → Rf̃∗g′^∗ that Proposition 17.6 inverts was constructed only for locally spatial diamonds. It is now `push.baseChange`, together with `pull_twoCell`.
- **Rf_v∗.** Rf_v∗ for maps that are not 0-truncated had no owner; it is now `vPush`.
- **Tensor product.** The derived tensor product is stated at each cutoff (the uncut colimit is not presentable), and it now supplies the v-internal Hom that `internal-hom` uses.
- **Smaller fixes:**
  - `push_globalSections` confused a sheaf on ∗ with cohomology of Y;
  - the classifying-stack test relied on D_ét(Spd F̄_p) ≃ D(Λ), which is available only later and inherits a gap;
  - the change-of-coefficients proof passed to right adjoints from the wrong side;
  - two tests used C5's j_! before C5.
- **Checked as right:**
  - the composition law `pull (g ≫ f) ≅ pull f ⋙ pull g`;
  - E92 and E93;
  - 17.6's hypotheses;
  - no node identifies v-internal Hom with étale internal Hom.

**C4 (§18).**
- **18.9 is false as stated** (new issue DiamondEtaleCohomology/E4):
  - Spa(C, O_C) → ∗, with C the completed algebraic closure of F_p((t)), is partially proper but not quasicompact;
  - its only closed sub-v-sheaves are ∅ and itself, so it is not a filtered colimit of proper maps along closed immersions.

  The direction ⇒ now assumes Y quasiseparated. The only use, 18.10, has Y spatial.
- **Remark after 18.4.** The remark replacing "separated" by "0-truncated and quasiseparated" needs unique lifts (E5; counterexample: two copies of Spa(C, C⁺) glued along a neighbourhood of the rank-one point).
- **Open question stated as fact.** A test asserted that envelopes of spatial diamonds need not be spatial. ECD p. 130 says this is unknown. It is replaced by two checkable tests.
- **Additions:**
  - the universally-closed predicate, which the stage asks to keep distinct from properness;
  - the relative affinoid formula, a stage target used by C5;
  - injectivity of Y′ → Ȳ′^{/Y};
  - the surjectivity statement VB3 needs, which is ECD 12.11, not `proper-image-closed`.
- **Smaller fixes:** R⁺ ⊂ R° made explicit (E6), and the D5 request re-scoped (qcqs v-sheaves need not have spectral |Y|).
- **Checked as right:** the supplied proofs of `locally-compact-hausdorff-proper` (item 411) and `pushforward-locally-spatial` (item 387), and E58/E59.
- **Rejected finding (F11).** One pass proposed dropping the prerequisite `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms` because H3 is not upstream of C4. It stays: H3 owns the definition of taut spaces, and the edge creates no cycle.

**C5 (§19.1–19.4).**
- **Cycle.** The construction of f_! cited the base-change node that depends on it. The perfectoid base change is now proved inside 19.1, as in ECD.
- **19.1 acceptance.** It was false for higher-rank geometric points; only global sections vanish. Base change for Rf∗ along open immersions was added.
- **19.2.** Its proof had a mistyped quasi-pro-étale step and assumed connected X′.
- **Lemma 19.4.** The limit inputs are now spelled out: the normalisation in K′ as a limit of models, limits of étale topoi, and constructible sheaves from a finite stage. The D0 request is extended accordingly.
- **Restructure.** An entry replaces the marker UPSTREAM:ECD:SCH_BC by SF.2.

**C6 (§19.5).**
- **E60 gap closed.** The recorded repair route was circular: comparing Ȳ′_n^{/Y} and Y′_n for all sheaves pulled back from Y is equivalent to the vanishing itself. The gap is closed instead:
  1. In the restricted case C⁺ = O_C, so Y′ = Y ×_k Spa(C, O_C) is partially proper over Y.
  2. The canonical compactifications of the annuli satisfy Y′_n ⊂ Ȳ′_n^{/Y} ⊂ Y′_{n+1} inside Y′, and they are proper over Y.
  3. Theorem 19.2 applies to them, and RΓ(Ȳ′_n^{/Y}, F_ℓ) = RΓ(Y′_n, F_ℓ) because the rank-one points coincide.

  I checked each step. Theorem 19.5 (i) and (ii) no longer depend on a gap.
- **`annulus-exhaustion`.** It gains the hypothesis nΛ = 0, which the base change of 17.6 to stalks needs.
- **Planets.** They now use ECD's phrase "invariance under change of algebraically closed base field". Two planets are kept on 19.5, down from three.

**C7 (§20 without 20.9, 20.10, 20.17).**
- **20.13.** ECD's reduction to an affinoid pro-étale cover is false as stated (new issue E11). Corollary 7.22 needs an embedding, which fails for Spa(C′, C′⁺) of rank 2 over Spa(C, O_C).
  - Noetherian Λ: 20.13 now follows from 20.5 and 20.12.
  - General commutative Λ: recorded as a new gap, with the λ° route.
- **Proof order.** The proof of 20.16 needs objects (perfect local systems) to spread along limits, not only maps. The new node `C7/perfect-local-system-limit` isolates the case "A = L" of 20.15. The order is then: full faithfulness → spreading → 20.16 → essential surjectivity, with no cycle.
- **Tor-amplitude target.** The stage target "locally bounded Tor-amplitude conditions" had no node. It is now part (iii) of the stalk criterion, with its proof from Stacks 0652, 0658 and 066E. The criterion now also says that geometric stalks include the higher-rank points; there is a Z/4 example showing why.
- **False items:**
  - the Gauss-point disc test (the Gauss point has rank-2 specialisations, so its complement is not open);
  - "perfect local systems are not closed under cones";
  - a support-restriction test.
- **Constructibility on spectral spaces.** Lemma 20.4 relied on closure properties stated only for small v-stacks, and on a general spectral space extensions of constant sheaves need not be constant (pseudo-circle). The closure properties are now proved on spectral spaces.
- **Perfect local systems** are now defined étale-locally, as ECD means.
- **Coefficients.** Λ is commutative throughout.
- **Restructure.** An entry adds C5 to C7's requires (§20 uses j_! throughout).

## Requests, gaps and restructuring

- **Requests (still nine).**
  - D0 is extended to Deligne's theorem (enough points of locally coherent topoi) and to sheaves on limits of spectral spaces.
  - The D5 request for sub-v-sheaves of generalizing subsets is re-scoped.
- **Gaps.**
  - Gap 1 (E46) is kept, with a corrected repair plan.
  - The E60 gap is closed.
  - A new gap records ECD 20.13 for non-noetherian Λ.
- **Restructure.** Two entries were added: SF.2 for UPSTREAM:ECD:SCH_BC, and C5 → C7.

## Red-team finding RT-AREA-padic-1/11 (item 9a)

Handled correctly. The packet plans ECD §18 in C4 and imports nothing about the compactification from D5. C4 uses D5 only for its spatial and representability geometry. Restructure entry 1 asks the maintainer to correct RS-05, with the same edits as the fix report `RT-AREA-padic-1.fixes.md`:

- the §18 owner becomes C4;
- the D5 keep reason becomes ECD §§11–13;
- effective descent becomes D3's.

The reader document states the same thing in its boundaries paragraph and in C4's coverage. RS-05.result.json on main still names D5, which is the maintainer's to apply.

## Mistakes in ECD

- **Packet's own `sourceIssues`.** The packet listed none. This review adds eight, each with its verdict:

  | Issue | Location | Kind |
  | --- | --- | --- |
  | E4 | 18.9 | error, affects a stated result |
  | E5 | remark after 18.4 | misprint |
  | E6 | R⁺ ⊂ R° in 18.3 and 18.4 | misprint |
  | E7 | footnote 4 (presentability) | misprint |
  | E8 | "open immersion" in the proof of 14.5 | misprint |
  | E9 | "simplicial" for "cosimplicial" in the proof of 19.2 | misprint |
  | E10 | A for j′_!A in the proof of 19.2 | misprint |
  | E11 | the reduction in 20.13 | gap, affects the proof |

- **Inherited issues.** The 21 PAPER-SCHOLZE-17 errata were checked at their nodes and are used in corrected form. E51 was added.
- **For the maintainer.**
  - The correction text of PAPER-SCHOLZE-17/E60 suggests the circular route; it could point to the compactified annuli instead.
  - The correction text of E91 uses "open subset" where the set need not be open (see E8).

## The suggested Lean file

The revised file adds 253 lines.

**Statements corrected:**
- **Perfect stalks.** `HasPerfectStalks` tested only one-point (rank-one) geometric points. That makes the iff of 20.12 false: for Λ = Z/4, take i_{s∗}(Z/2) on a rank-2 Spa(C, C⁺). It now tests every connected strictly totally disconnected point, through RΓ.
- **16.1 hull forms.** The four `.hull` forms of 16.1/16.4 lacked "X̃ strictly totally disconnected" and were false without it.
- **Quasicompactness and quasiseparatedness.** `algebraicTopoi` encoded "U quasiseparated" as "U → ∗ quasiseparated". `IsQuasicompactMap` went through compactness of |·|. Both now use `IsQuasicompactV` and `IsQuasiseparatedV` (quasicompactness and quasiseparatedness of a small v-stack as an object). Spatial hypotheses use `QuasiSeparatedSpace`.
- **Geometric points.** They are now connected strictly totally disconnected spaces. Before, `geometricStalk.toPoint` discharged false obligations for non-algebraically-closed field pairs.
- **18.9.** It gains the quasiseparatedness hypothesis.
- **Compactified annuli.** The annulus statements use the compactified annuli.
- **Perfect local systems.** These are étale-local and closed under cones.
- **Constructible stalks.** `IsConstructible.stalk_fg` now uses points of every rank.

**Added:** every new API item, test and node, prototyped where typable. `pull_twoCell`, `squareBaseChange.paste` and four tests need data that `Carriers` lacks (2-cells, gluing, residue fields), so they are comments.

**Not changed, and recommended for the assembly job:**
1. **Redeclared objects.** The later parts of the file redeclare objects from C0–C1 as unrelated constants (`vPush`/`vPushD`, `qpPull`/`qpPullD`, `etPushDer`/`etPushD`, `IsSurjectiveMap`/`IsVCover`). Later statements therefore cannot be linked to earlier ones.
2. **Vacuous tests.** About fifteen tests hold by definition or restate an API item.
3. **`contSheaf`.** It lacks a topological-ring hypothesis on Λ.
4. **`canonicalCompactification.fac`.** It could carry the separatedness hypothesis.

## Reader document

The reader document is not a deliverable of this review, and it no longer matches the packet. A sync must regenerate it from the reviewed packet. This brings in:
- the new node;
- the closed E60 gap and the new 20.13 gap;
- the source issues;
- the Tor-amplitude statement;
- every changed statement listed above.

The "Gaps" and "Source issues" sections of the handoff note `BP-DiamondEtaleCohomology--C0.md` are also out of date.

## Questions for the orchestrator

1. Apply RS-05's owner correction for §18 (restructure entry 1). Then consider the two new restructure entries: SF.2 replacing UPSTREAM:ECD:SCH_BC in C5's requires, and C5 added to C7's requires.
2. Queue a follow-up for the 20.13 gap, descent along X̃ → λ°(X̃) over non-noetherian Λ. It blocks the general-Λ case of 20.15–20.16, but not the noetherian case.
3. The E46 gap (14.7 in degrees ≥ 2) remains. The C2 nodes that inherit it are now recorded.
4. The new source issues E4 (18.9) and E11 (20.13) are mathematical and may interest the author. Nothing has been sent.
