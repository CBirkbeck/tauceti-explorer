# PKG-ExcursionOperatorsAndSpectralAction

Worker: Claude (Claude Code, Opus 5.5), session `claude-eaapd2`, 2026-10-19, branch `claude-eaapd2-pkg-excursion`, issue #11081. One sitting; the package is complete and goes to its independent review.

## Deliverables

`research/blueprint/packages/ExcursionOperatorsAndSpectralAction/`:

- `README.md` (about 218 KB). Summary, scope and ownership, conventions, exact supplier contracts, build order, then 15 layers with 112 targets, followed by worked examples, source corrections, downstream consumers and references. Every subsection carries its locators and a *Needs:* line, and every definition has at least three Checks.
- `Suggested.lean` (482 lines): `import Mathlib` only, namespace `TauCetiRoadmap.ExcursionOperatorsAndSpectralAction`. It has 8 real-bodied light definitions on Mathlib carriers: `heckeCompatibleCentre`, `IsSchurIrreducible`, `excursionCharacter`, `restrictCentre`, `twistedLeviCocycle`, `centerEvaluation`, `centralAnnihilator` and `centralSupport`. It has 23 theorem targets proved by `sorry`, and 12 proved `example`s (at most two per definition, none admitted). There is no sorry'd data, `True` placeholder or `Prop := sorry`.
- `metadata.toml`: `topic = "math.NT"`.

Inputs:
- the accepted packets `ExcursionOperatorsAndSpectralAction--ES0` (42 nodes, revision 4 accepted; revision 5 only added the ES5 import record), `--ES5` (21 nodes, accepted), `--ES6` (no nodes, accepted import reconciliation) and `--ES7` (50 nodes, accepted);
- their readers, the assembled reader, and the accepted packages of the suppliers.

## Layer order and renumbering

The stage ids are kept as layer names, so that neighbours' citations (`ES1:finite-ramification`, `ES6:functoriality`, ES2, ES3) resolve. The layers are ordered by dependency:

ES0 → ES0:classical-center → ES1:finite-ramification → ES1:spectral-center → ES2 → ES3 → ES5 → ES6:functoriality → ES7:parabolic → ES4 → ES6:duality → ES7:GLn-comparison → ES7:function-field-automorphic → ES7:equal-characteristic → ES7.

The README checks that no cross-reference points forward (all 112 `### ESx.n` anchors resolve).

Placement changes against the packets (no statement changed):

- The three ES0-stage targets that need finite-wild categories go into ES1:finite-ramification, as .3–.5: `excursion-algebra-to-bernstein-center`, `continuity-of-excursion-evaluations` and `discretisation-of-the-weil-group`. They depend on `ES1:finite-ramification/finite-wild-Hecke-category` and `uniform-wild-subgroup`, so leaving them in ES0 would have made ES0 and ES1:finite-ramification cyclic.
- The single-node stage ES1 becomes ES1:spectral-center.1, and the single-node stage ES6 (the coefficient policy) becomes ES6:functoriality.1.
- ES4 comes after ES7:parabolic because `basic-decomposition-of-an-elliptic-component` needs ES7:parabolic.6–.7. ES6:duality comes after ES4 because `bernstein-zelevinsky-duals` needs ES4.5.

## Duplication audit and removals

- **Removed:** `ES5/abstract-semisimple-parameter` (Fargues–Scholze, Corollary VIII.4.3). It is LanglandsParameterStacks LP2c.8 (*Parameters of Schur objects*) in the accepted LP package, stated for an abstract discrete-group datum. ES5.3 now cites LP2c.8. That node's open request (an arbitrary-discrete-W classifier) is answered by LP2c.8 with LP2c.2.
- **Recast:** `ES3/sifted-colimit-approximation`. The construction of `F♮` and its comparison `κ` are LP3.18's DVR approximation, whose text says ES3 reuses it. ES3.1 now owns only the universal evaluation on `F♮` (`perfApprox_evaluation`), and keeps its three Checks as checks of the evaluation.
- **No other duplication found.**
  - TauCetiRoadmap main at `79ff03ab`: read the READMEs of GeometricRepresentationCategories (affine Lie algebras at critical level, unrelated), DerivedModuleAlgebra, ClassFieldTheory, LocalFieldsRamification, ReductiveGroups, SchemeAndStackFoundations, RigidAnalyticGeometry, ProfiniteCohomology and the rest of the list. None plans excursion operators, centres of stable categories, spectral actions, `D`-elliptic sheaves, Euler–Poincaré functions on buildings or z-embeddings.
  - The read-only checkout `~/tauceti-roadmap-env` is a feature branch (`0d144d04`); its SmoothRepresentationsOfLocalGroups and ReductiveGroupsPartII are open PRs, not main. They are cited as atlas roadmaps by their package layer numbers.
  - The current Tau Ceti library at `a91d3aaf` has nothing on these topics.
  - Real Euler–Poincaré functions are AutomorphicSpectralTheory AS.6.19. The equal-characteristic building version stays here.
- **Ownership updated:** full equal-characteristic local reciprocity is FunctionFieldArithmetic FA.4 (*local-abelian-existence*). The ES5 packet had asked for a ClassFieldTheory Part II; FA.4 now owns this, and the README cites it.

## Gaps and requests, as the README states them

There is no process language in the README. The plan's open items appear as follows:

- **Supplier contracts** in the README's *Exact supplier contracts*: the requests to LP0, LP1, LP2c, LP3, LP4, HS1, HS2 (equal characteristic), VS3, VS4, VS5, E5, SR (all-coefficient admissibility, finite length, closed cocompact induction and the quotient lift), BunGAndNewtonStrata (torus `B(T)`, Kottwitz bridge, Hecke-equivariant inner twisting, the Layer 4 instability estimate), RelativeFarguesFontaine (the Lubin–Tate cover), ReductiveGroupsPartII (induced-torus resolutions, central pushouts, rational image), FA.6, AA.1 for function fields, and WC.2 (the open-curve functional equation and Laumon's product formula).
- **Proof obligations inside the owning targets**, worded as "proved here" or "part of this target":
  - the DVR tensor identity (ES3.3);
  - the elliptic `H²` vanishing and the whole-component claim (ES4.8);
  - the HS4.6 switched-kernel character computation (ES7:parabolic.6);
  - the equal-characteristic quasi-split reduction (ES7:parabolic.4);
  - scalar extension of excursion operators (ES7:parabolic.3);
  - maximal-order gluing (ES7:function-field-automorphic.1);
  - the Deligne–Kazhdan and Henniart inputs (ES7:function-field-automorphic.10);
  - the Drinfeld–Genestier representability (ES7:equal-characteristic.6);
  - the Berkovich quotient Hochschild–Serre (ES7:equal-characteristic.19);
  - Henniart's local-constant theorems (ES7:equal-characteristic.17–.18);
  - the Boyer and Hausberger transport (ES7:equal-characteristic.22).
- **Source corrections:** all 22 confirmed source issues of the packets (Fargues–Scholze seven, Henniart–Vignéras five, Laumon–Rapoport–Stuhler four, one of them the Kaiser correction, and Hausberger six) are in the README's *Source corrections* section, in own words and without labels.

## Checks run

- `lean-check research/blueprint/packages/ExcursionOperatorsAndSpectralAction/Suggested.lean`: exit 0, 23 warnings, all "declaration uses `sorry`", no errors. It was run in the shared pinned build (Mathlib 082e2d3, Tau Ceti f790474) with 77 GB of memory available. Final sha256 `6906b0b1…f6d8498`.
- `python3 scripts/check_sorry_data.py` on `Suggested.lean`: exit 0. The file has 482 lines.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- README scans:
  - process vocabulary (packet, node, request, gap, review, checkpoint, planned, job, sorry, deferred, optional, pending): no hits apart from mathematical uses ("elliptic packets");
  - no source-issue labels and no local paths;
  - every definition has at least three Checks, every subsection a source and a *Needs:* line, and all internal anchors resolve.
- Locators:
  - Fargues–Scholze: the author PDF (sha256 `9ab9efbd…`, the hash the plans used) was fetched and the type and page of 40 cited labels checked against its running headers. One fix: X.3.1 is a Proposition, not a Theorem. One page range was widened (Proposition IX.6.3 starts on p. 331). The conditions of Theorem IX.5.2 (`|π₀Z(G)|` invertible) and of VIII.5.1 and X.0.1 (`ℓ ∤ |π₁(Ĝ)_tors|`) were read in the source.
  - Kaletha arXiv v2: Definition 5.1 and Proposition 5.2 on p. 17, Fact 5.5 on p. 19.
  - Hausberger (AIF): Théorème 9.5 on p. 1337, Lemme 10.2 on p. 1339.
  - The other locators are the accepted plans' and were not re-read.
- Mathlib and Tau Ceti names cited at the pins were checked in the baseline declaration index. `TauCeti.wildInertiaSubgroup` and `TauCeti.tameQuotientEquiv` are current-main only, so the README cites TauCetiRoadmap LocalFieldsRamification Layer 4 instead.

## Mathematical notes for the reviewer

- The README's Conventions observe that, since `π₁(Ĝ) = X^*(Z(G))`, the centre-order condition and the good-prime condition differ only by powers of `p`. They are therefore equivalent for `ℤ_ℓ[√q]`-algebras in which `ℓ` is not invertible. The plan keeps them as distinct hypotheses, and so does the README.
- ES1:spectral-center.2 now says explicitly which invariant comparison is used in each case: LP2i.1–.2 when `ℓ ∤ |π₀Z(G)|`, and the rational LP2i.3 when `ℓ` divides `|π₀Z(G)|` and is therefore invertible in `Λ`.
- ES6:functoriality.2 had the pullback direction of the representation reversed in an early draft. It now reads `V = f̂^* V′`, as in HS4.3.
- The `Suggested.lean` statements are on ordinary categories (`CatCenter`) and abstract groups. Their README counterparts are the enhanced or geometric statements, and each docstring says so.

## Suspicious text

None found. No issue comment or fetched page contained instructions.

## Next

Independent package review (REV-PKG-ExcursionOperatorsAndSpectralAction).
