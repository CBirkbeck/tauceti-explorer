# REV-PKG-AdicSpacesPartII — fixing review

Reviewer: Claude Code session `cc-cc0fde` (independent-review-REV-PKG-AdicSpacesPartII), 2026-10-09.
Package by session `cc-bab806` (`research/blueprint/packages/AdicSpacesPartII/`). Verdict: **accepted**
with the fixes below applied.

## What was checked

1. **Form against the upstream bar.** Read `UPSTREAM_GUIDE.md`, the AdicSpaces and two further upstream
   READMEs and `Suggested.lean` files, and the sibling package AdicEtaleGeometry. The README's front matter
   (purpose, layer table, prerequisites and boundaries, twelve conventions) is in upstream form; the target
   entries were not (see fix 1).
2. **Sources.** The six targets the author flagged as written from request texts (F0.64, F0.65, R2.88, R3.73,
   R5.43, F1.77) were checked against public sources (Stacks tags; EGA II and III₁ and de Jong on Numdam;
   Scholze–Weinstein arXiv:1211.6357; Kedlaya–Liu arXiv:1301.0792; Conrad's two papers from his page). A
   random sample of 15 other locators (R0.8, R0.9, R0.11, R0.15, R0.17, R0.24, R0.44, R0.126, R1.31, R1.32,
   R1.42, R2.12, R3.1, R3.2, R3.3) was read in the GDZ OCR of Huber 1994 (scan page = printed page + 8) and
   in Wedhorn's arXiv text: 15/15 confirmed.
3. **Gaps.** Every `Needs` token outside the roadmap was listed: `AdicEtaleGeometry A1`,
   `PerfectoidSpaces P1/P2`, `DiamondsAndVStacks D0` (the bundle), six Tau Ceti declarations (all verified to
   exist in a91d3aaf: `cohomologyMapBaseLinear`, `IsOpenQuotientMap.isStronglyNoetherian`,
   `isStrictMap_of_module_finite`, `IsLocallyFreeData.isFinitePresentation`), and the cited lower-tier
   roadmaps. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` ids remain.
4. **Unit tests.** All 133 definitions and constructions have ≥ 3 tests in the plan, of at least two kinds
   (626 tests: 162 non-example, 143 computation, 133 degenerate, 123 compatibility, 65 characterisation);
   the README now shows every one with its statement.
5. **Lean.** `lean-check research/blueprint/packages/AdicSpacesPartII/Suggested.lean` (the swarm checker, Tau Ceti f790474 + Mathlib 082e2d3)
   → exit 0, 912 `declaration uses sorry` warnings, nothing else (run seven times during the restructuring;
   first and last runs identical in warning count). Ten signatures compared with the README (R0.1, R0.3,
   R0.21, R0.26, R0.38, R3.5, R5.1, F1.2, F0.2, R2.1): all carry the README's hypotheses; no `True` or
   `Prop := sorry` placeholders, no `#check`/`#eval`/`#print`, no `lemma`.
6. **Own words.** No quoted passage longer than a few words; the one Huber phrase in R0.1 is seven words.
7. `python3 research/blueprint/intake.py check-files` on the three package files → 0 problems; no `/home/`
   paths.
8. **Duplication.** Three sweeps by mathematical object over Tau Ceti a91d3aaf, the current upstream roadmaps
   (including the nine newer ones and `Completed/`) and Mathlib, one per layer group, covering all 133
   definitions and constructions.

## What was fixed

1. **Truncation (README).** The author condensed the 3.6 MB plan tenfold to meet the 200 KB cap: statements
   were cut after one or two clauses (`A is of noetherian type if (i) A admits a pair of definition (A₀ …`),
   64 of the 97 hypothesis lists were cut mid-word, API lists showed four names and test lists three. That
   fails the bar (exact hypotheses; tests a wrong definition fails). The 231 non-lemma entries were
   regenerated from the accepted plan with the full statement, the full hypothesis list, every API name and
   every test with its one-line statement, keeping the author's headers, source strings, prerequisites and
   the four variant clauses added after truncation markers. The 309 lemma entries remain one line (title and
   source); their statements are in `Suggested.lean` where typable and otherwise only in the packet.
   **Size:** README 194 KB → 556 KB. Upstream has no cap (largest existing README: BelyiMaps, 303 KB); the
   orchestrator should decide whether to keep the full test statements (names-only tests would give 431 KB).
2. **Planning residue (README).** The packet node ids and stage ids inside statements, hypotheses, API and
   tests replaced by README numbers (`R3/noetherian-rod-acyclicity-finite-modules` → `R3.3`); other roadmaps'
   node ids reduced to `Roadmap Layer`; `tauceti:TauCeti.X`, `mathlib:X`, `TC:X` prefixes replaced by plain
   citations; `this node`, `node <slug>`, `packet sourceIssue E28/E31`, `the packet constructs` rewritten
   (the two source-issue references now carry the mathematical content inline); the heading `### R3.5a The
   sheaf of continuous differentials` lost its stray label; F0.2's header named the projection
   `IsAdicRing.exists_isAdic` instead of the class `IsAdicRing`; `Huber.IsSheafyPair` (does not exist)
   → `Huber.IsSheafyForEveryPresentation` in the three statements that still used it.
3. **Moved-down targets (README).**
   - F0.64: EGA II 4.4.3/4.6.8 and Stacks 01Q4 did not say what they were cited for; now EGA II 4.2.3,
     3.5.3, 4.6.11, EGA III₁ 2.2.1, 2.2.2, 2.3.1–2.3.2, 3.2.1, Stacks 0B5U, 02O5; the "uniform in the graded
     pieces" clause restated as the (TF) statement of EGA III 2.3.1.
   - F0.65: the dévissage sentence was wrong (closure under extensions and kernels is not EGA III 3.1.2's
     two-out-of-three; "all coherent sheaves supported on Z" is not the one-test-module hypothesis);
     restated; Cor. 5.6.2 added for the projective case.
   - R2.88: Conrad-MR Thm 4.1.1 is about Hasse loci, not representability; re-cited to Conrad, Arithmetic
     moduli of generalized elliptic curves, Thms 3.2.7, 3.3.1, 4.2.1(2) (new source key Conrad-GEC) and
     Conrad-MR Ex. 4.1.2; the Deligne–Rapoport section numbers are marked unverified (book not public).
   - R3.73: confirmed; KL15 Def. 2.3.2, Thm 2.3.4, Rem. 2.3.11(b) added.
   - R5.43: the statement was not Scholze–Weinstein 2.4.1/2.4.2 (those need qcqs transition maps and give the
     affinoid criterion for a direct system with compatible rings and ideals of definition, with no
     dense-image or plus-ring hypothesis); restated accordingly, with Prop. 2.4.3 for pullbacks.
   - F1.77: de Jong 6.5 assumes X integral, separated, flat, finite type (not proper) and alters into an open
     of a projective strictly semistable scheme; restated, with the proper case as a consequence.
   - Sources section: Conrad-GEC added; URLs added for EGA II, de Jong, Scholze–Weinstein.
4. **Locator precision (README).** R0.17 → Huber94 (1.3), p. 526; R3.3 → pp. 525–529; R1.32 → Prop.
   4.5(ii)–(v); R0.44 → Wedhorn Rem. 8.57 covers only the adic/weakly-finite-type/quasi-compact clauses, so
   Huber94 Prop. 3.7 was added for the locally-finite-type clause.
5. **Duplication (README).** No target duplicates an existing declaration outright, so none was deleted.
   Eleven targets overlap existing declarations and now say in one clause what the overlap is and what is new:
   R0.13 (Tau Ceti `reesAlgebra.grade`, `affineBlowupι` are the ideal case), R0.80 (clause (i) in the Tate
   case is `IsTateRing.isModuleTopology`, `completeSpace_moduleTopology`, `isClosed_of_isNoetherian`), F0.2
   (two lemmas are Mathlib's `IsAdic.isTopologicallyNilpotent_iff_mem_radical`, `IsAdic.isLinearTopology`),
   F0.4 (Tau Ceti `completionLocalization` is the general A⟨T/s⟩; this is T = {1} with the `AdicCompletion`
   carrier), F0.60 (parts (a), (b), (d) are `SheafOfModules.ihom`, `ihomObjEquiv`,
   `Presentation.pullbackTensorIso`, `tildeMonoidal`), R2.1 (`IsTopologicallyFiniteType` is the tft half),
   R2.15 (`affineBlowupι` charts), R2.60 (`fittingIdeal`, `Scheme.Modules.fittingIdeal`), R2.79
   (`IsRadiusLowerBound`/`IsRadiusUpperBound` are the case f = [ϖ], g = p), R3.27 (`SheafOfModules.IsLocallyFree`),
   R3.64 (`Scheme.Hom.finrank`), R5.19 (`IsCompactModule`), F1.2 (`MvPowerSeries.IsRestricted.subring`).
   R0.33's predicate renamed `AdicSpace.Hom.IsAdic` (Tau Ceti's `PreAdicSpace.isAdic` is the object
   property). The three sweeps also confirmed absence of: a trace of endomorphisms of finite projective
   modules, a Gel'fand spectrum of a Banach ring, a perfectoid-Tate-ring predicate, completed tensor
   products, continuous Kähler differentials, dagger algebras, formal schemes, analytification.
6. **`_root_.TauCeti.Huber.` declarations (Suggested.lean).** The author declared 95 declarations
   (`Pair.uniformization`, `Pair.completedTensor.*`, `Pair.Hom.IsFinite`, `PairOfDefinition.completionTensorEquiv`,
   …) inside the library namespace so that `S.uniformization` elaborates. That is not acceptable for an upstream
   file: the file must live in `TauCetiRoadmap.AdicSpacesPartII` (maintainer's binding form), declaring into
   `TauCeti.Huber` would collide with the library the moment any of these names lands, and upstream
   `Suggested.lean` files use `_root_.` only to refer to root names. The sibling package AdicEtaleGeometry
   made the same change at review. All 95 were moved into `TauCetiRoadmap.AdicSpacesPartII.Huber` (three
   that sat at the file's root namespace as `Huber.…`) and the 76 dot-notation uses rewritten to explicit
   application (`Pair.uniformization S`, `Pair.Hom.IsFinite φ`, `PairOfDefinition.completionTensorEquiv M P`,
   `Huber.IsPseudoUniformizer.isWeightFamily_singleton_pow hϖ`); the module docstring now says so.
7. **Empty section headers (Suggested.lean).** 287 `/-! ### Rk.n … -/` headers had no declaration under
   them (planning residue of the removed stubs); removed. The closing comment was regenerated from the
   README: 334 targets stated only in the README, now including the six moved-down ones, which were in
   neither the file nor the list.

## What remains (not fixable here)

- Huber 1996 (Étale cohomology of rigid analytic varieties and adic spaces) and Deligne–Rapoport (LNM 349)
  are not public; the 1996 locators were taken over from the accepted plan unchecked, and R2.88 says so.
- R0.44's locally-finite-type, +weakly-finite-type and finite-presentation clauses rest on Huber 1996 Cor.
  1.2.3 (unverifiable), as the plan's gap record already notes.
- Lemma statements (309 targets) are not in the README; 334 targets of all kinds have no Lean statement
  because their carriers (adic spaces as a category with structure sheaf, formal schemes, rigid and dagger
  spaces, étale sites, coherent sheaves) are not in the pinned libraries. Both are structural, not defects.
- README size (556 KB) exceeds the packaging cap; see fix 1 for the alternative.
