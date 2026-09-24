# REV-RT-AREA-ktheory-2 — verification of the red team on Algebraic K-theory, part 2 of 2

**All 52 findings verified: 51 confirmed, 1 rejected.** Every structural claim this red team makes held, several at a granularity a coarser check would have passed over. The single rejection rests on an inference from route reasons rather than on the atlas text — which is the one class of claim here that needed watching.

Verifier: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `research/blueprint/redteam/RT-AREA-ktheory-2.result.json` — 52 findings (3 high, 43 medium, 6 low) on part 2 of the Algebraic K-theory area, seven roadmaps and 68 stages. **Eligibility:** `cc-fb70e5` appears 0 times in that file and in `RT-AREA-ktheory-2.md`; I wrote neither.

## What I checked, and what I did not

I opened the atlas evidence for **every** finding rather than sampling: each cited stage's text, its `requires`, and the ancestry relations the claim turns on. For the ownership claims ("no stage plans X") I searched both roadmap directories — `research/blueprint/atlas/roadmaps/` and `research/blueprint/roadmaps/` — under several descriptions of X, not just the name the finding uses.

**The ancestry checks were run against a graph I built once**, indexing all four stage-id forms (bare `key`, `roadmapId:key`, `filename:key`, short-name:key). That precaution matters: files under `research/blueprint/roadmaps/` store keys **bare** (`key: 'LV.0'`, `id: null`) while references qualify them, and a single-form index produces phantom "unresolvable reference" results — a trap I had hit in an earlier job this session.

**What I did not verify:** the quotations from published sources. This red team cites Weibel's K-book chapter PDFs, arXiv versions of Hutchinson, CGZ, Wagner, Nikolaus–Scholze and Liu–Wang, and Devalapurkar's thesis, with URLs and read dates. Those quotations are the half of its evidence I could not open, and where a finding's atlas half holds but its source half is load-bearing I say so in the verdict (findings /2, /3, /50). A second verifier with source access should re-check those.

## The three high findings — all confirmed

**/1 (EllipticKTheory:E.5).** E.5's text does own the finite-curve theorem "includ[ing] its finite-generation, cohomology and Frobenius inputs", its only finite-generation ancestor is the *number-field* `N.3:finite-generation`, and the missing inputs are genuinely unowned (`Grayson` 0 files, `Geisser` 0 files; the two `Levine` hits are the Levine/Friedlander–Suslin spectral-sequence model). **One correction for the fix job:** fix (b) sends Bass–Tate to T.5, but `K2SymbolsBrauer:T.4` already says "Prove the **Bass–Tate sequence** for `F(t)`". The claim survives — a sequence for `F(t)` is not the vanishing `K^M_n(F) = 0` over a global function field — but **T.4 is the natural owner**.

**/2 (HabiroNumberFields:HB.2).** Confirmed, and I checked the fix target rather than assuming it: `HB.5.requires` is exactly `[HB.4, HB.5a, HB.2]`, the three inputs the fix relies on. The cycle argument also holds — `plans/HABIRO.md` line 868's HB.4 row ends "**add HB.2, HC.1**". `Andrews–Gordon` and `Rogers–Ramanujan` return 0 files.

**/3 (RefinedTraceMethods:RT.4:q-Hodge).** Confirmed, with the sharpest corroboration being an asymmetry: `Wagner`, whose theorem the stage must prove, is cited in **7** roadmaps, while `Raksit`, `image of J`, `j_{p,0}` and `THH(Z_p…)` each return **0**.

## The one rejection

**/34 (Bökstedt periodicity, L.5 / RT.6) — rejected.** Five things point one way:

1. **`Bökstedt` appears in no roadmap file at all**, and none of RT.2, RT.3, RT.6 or L.5 contains it, `THH(F_p)`, `F_p[u]` or `periodicity`. Neither owner plans it by name; both are inferred from routes.
2. The accepted extraction that supplies the material names **one** owner: `PAPER-NIKOLAUS-SCHOLZE-18` → L.5 says "Bökstedt periodicity and the TC(F_p) computation, **already planned there**, are included."
3. What RefinedTraceMethods receives is a **different object** — the same paper's RT.2 route lists "the **Bökstedt construction** and the co[mparison of the two THH]" among what the paper supplies beyond RT.2's scope. Construction in the general trace machinery, periodicity in the finite-field calculation, is a correct split.
4. `PAPER-LIU-WANG-22` states the ownership twice: "Record this alternate source **without replanning the same results**", and "**L.5 owns finite-field TC computations**".
5. RT.6's text is an **acceptance example**, and its wording — "the finite-field THH comparison **consumed by** local K-theory" — describes a supplier/consumer relation.

Acting on this finding would redirect or delete an acceptance example that is correctly placed. I checked it twice in both directions, because the route evidence does mention Bökstedt on both sides; reading the full route text resolves it.

## Where the findings are more precise than a coarse check

Four confirmations turn on stage-level rather than roadmap-level granularity, and a reviewer testing "is the roadmap reachable?" would have passed all four:

- **/15** — HB.7 *does* reach `PadicHodgeRegulators:D.2`, but **not D.1**, which owns Coleman's p-adic dilogarithm in GSWZ's normalisation.
- **/31** — `RT.4:Habiro-comparison` *does* reach `HabiroRings` (HR.1–HR.5 and HR.5-number-field-comparison), but **not HR.6**, where the q-Hodge/relative-Habiro identification lives.
- **/32** — `RT.4:topological` reaches `H.5:spectra` but not `H.5:S-delooping`, which supplies the smash product.
- **/43** — all eight `Adams operation` mentions are *algebraic*; the topological ψ^q on KU is unowned, and `KTheoryFiniteLocalFields:L.1` **uses** it ("Compare the homotopy fibre of the relevant Adams operation with the plus-construction model") with nothing constructing it.

Two findings are also **stronger** than stated: **/37** (`DerivedDeRhamCohomology` is not reachable from RT.1 *at all*) and **/4** (E.3 has *no* ArithmeticKTheory and *no* KTheoryFiniteLocalFields ancestor whatever).

## Corrections and narrowings the fix jobs need

Confirmed high and medium findings become fix jobs, so scope matters as much as verdict:

| finding | correction |
|---|---|
| /1 | Send Bass–Tate for global function fields to **T.4**, not T.5 — T.4 already owns the Bass–Tate sequence for `F(t)`. |
| /17 | V.3 **is** an ancestor of HB.1, so the fix is "HB.1 imports V.3's comparison", not "choose between two owners". |
| /19 | This is a **different** gap from /1's: T.4 owns the sequence; the global-function-field vanishing and the number-field computation `K^M_n(F) ≅ (Z/2)^{r_1}` are separately missing. |
| /21 | Only **restriction and transfer** duplicate. V.5's K₃(F_q) value is explicit consumption — "**Use** Quillen's finite-field calculation". |
| /26 | A **missing-edge** defect, not duplicated planning: P.6 defines the map, L4 proves abelian Leopoldt, I.2 weak Leopoldt. Add edges; delete nothing. |
| /23 | The part I would fix first is not the duplication but that V.6 undertakes to prove something about **P's** regulator while having no Polylogarithms ancestor. |
| /41 | This is a **scheduling** defect: an unused edge makes the whole S.1–S.6/K.1–K.7 chain M.4's entire ancestry and serialises every M.4 consumer behind it. |
| /44 | Keep RT.1's **cyclic/simplicial packaging** (faces, degeneracies, circle action) — layer 8 does not provide it, and deleting it would break RT.2. Only the Hochschild chain complex duplicates. |
| /45 | Keep S.1's **scheme-specific** content (locality, pullback stability, qcqs essential smallness, singular schemes). Only the arbitrary-ring affine part duplicates; RS-18 directs identification with P7 only, leaving the DGAInfinity overlap unaddressed. |
| /49, /52 | Wording and metadata fixes with no mathematical content: the pre-Bloch generators should be "other than 0 and 1"; RT.4's parent title should be its own section title, not its first sub-stage's. |

## One correction of my own

I nearly rejected **/17** on a search error. V.3's opening only says "Use Suslin's convention", and a grep for `CGZ` in V.3 returns nothing — which looked like the finding attributing to V.3 something it does not plan. V.3's full text settles it: "Separately construct the conventions used by Bloch, Goncharov and **Calegari–Garoufalidis–Zagier**. Prove the comparison maps, their **exact small torsion corrections**…". V.3 spells out the names HB.1 abbreviates. Confirmed, and recorded here because the same abbreviation trap could mislead the fix job.

## Assessment of the red team as a whole

This is careful work. Its 57 `checked` entries are specific, its quotations of atlas text are verbatim wherever I could check them, and it distinguishes cases that invite conflation — it correctly describes the three pairs where an edge *does* exist ("L.4, **which already imports RT.2**, again plans…"; V.5 reaching L.1 "only indirectly"), rather than asserting "no edge" everywhere. Where I disagreed, once, the disagreement was about what the routes license rather than about what the atlas says.

52 findings in one area is a large number, and a reader may reasonably ask whether the bar was set too low. On the evidence it was not: 45 of the 51 confirmations are either an unowned input that a stage's own text demands, or a dependency the stage states in prose with no edge recording it. The six low findings are correctly graded as presentational.
