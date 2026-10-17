# PKG-GeneralizedHeegnerCycles~2 — blocked checkpoint

Worker: Codex, session `codex-cAfjK8`, 2026-10-17. Refs #9171.
Claim confirmed by bot comment [6241228400](https://github.com/CBirkbeck/tauceti-explorer/issues/9171#issuecomment-6241228400).
Branch: `codex-cAfjK8-generalized-heegner`.

**Status: incomplete, blocked by the three plan defects identified in REV-PKG-GeneralizedHeegnerCycles.** This checkpoint makes the permitted package corrections and records the remaining mathematical prerequisites. It does not close those defects, supersede the independent verdict, or certify upstream readiness. The issue permits only the package README, Suggested.lean, metadata and this handoff; it explicitly forbids packet changes and directs the worker to describe plan mistakes here. Fixing the missing owners and contracts requires coordinated plan changes outside those paths. No approval or permission is being inferred for them.

Submit this checkpoint as a **draft** for maintainer routing. `issues.py:deliverables_complete` has no package-specific mathematical completion predicate: existing output files fall through to success. A regular automatic intake can therefore mistake this blocked package for a completed revision. The existing independent `review.json` remains unchanged, with `needs_changes`. The earlier worker's draft [#9501](https://github.com/CBirkbeck/tauceti-explorer/pull/9501) is open and unmerged; this branch neither includes nor changes that worker's branch. This checkpoint additionally performs the required compact Lean rewrite and README form conversion.

## Changes saved

- Replaced the 2,138-line Suggested.lean by a 502-line file in `TauCetiRoadmap.GeneralizedHeegnerCycles`, importing Mathlib only. It has six light, real-bodied definitions: `CMCurve.etaOfOmega`, `stabilizedClass`, `iwasawaClass`, `correctedKolyvaginClass`, `criticalTwist`, and `howardTowerClass`. The full arithmetic constructions remain README requirements, with omitted definitions identified in the closing comment.
- Removed the partially constructed curve/isogeny/Coleman/norm-tower scaffolding, the sorry-bodied `cmOrderOne` and `IsogPair.idealAction`, ad hoc tensor-coordinate constructions, and routine auxiliary lemma chains. No theorem depends on a sorry-defined carrier. Remaining generic algebraic milestones explicitly concern existing modules and maps; they are not arithmetic regulator or cycle constructions.
- Retained the significant negative controls: full versus half unit count; changing only the bottom; unbounded integral denominators despite rational level isomorphisms; exact-conductor versus merely nontrivial characters; failure of character cancellation over Z/8; injectivity lost after quotient; scalar projection losing a second dimension; squared differential scaling; localization at an exceptional prime; and nonzero versus integral-unit comparison factors.
- Recast README in the required form: Summary, scope/ownership, conventions, library inputs, exact contracts, build order, nine layers with prose/API/Checks, per-layer Examples and Dependencies, and references. All 82 numbered targets, 66 named API bullets and 58 named Check bullets are retained, in order. No hypotheses or locators were discarded to shorten it.
- Corrected the false R14.3 geometry import, separated R19.1's classical projector from its geometry prerequisite, restricted L3 to its actual cyclotomic scope, and made GH.8.16 explicitly conditional on the separately required `auxiliaryRangeAdapter`. These are honest package boundary corrections, not completed supplier plans.
- Metadata remains exactly `topic = "math.NT"` plus newline. No packet, assembled reader, review verdict, queue, label, atlas data or upstream checkout was edited.

## Blocker 1: classical fiber-power geometry has no acyclic supplier

Read the current accepted `ModularCurvesPartII--R14.3.json` (43 nodes). Unlike the earlier review's snapshot, it now has an acceptance object. This status change does **not** supply the missing geometry. Its `relative-coefficient-system`, `parabolic-cohomology`, `boundary-exact-sequence`, `boundary-non-eisenstein` and `weight-two-tate-comparison` concern curve coefficients, boundary/localization and Jacobian realizations. In particular `boundary-non-eisenstein` explicitly restricts its proved source range to weight two and requests the symmetric-coefficient calculation separately.

The accepted `AutomorphicGaloisRepresentations:R19.1/scholl-projector` owns the rational signed classical projector, concentration and parabolic realization. Its prerequisite list includes `GeneralizedHeegnerCycles:GH.0`, and its geometry/boundary request points back to GH.0. Simply replacing R14.3 by R19.1 for the whole geometry would thus leave a cycle.

**Needed coordinated revision:** assign the canonical compactification/resolution and its boundary calculation a concrete foundational target in the geometric owner, before the classical projector. Keep the single classical Scholl-projector owner in R19.1. Include the good model over Z[1/N], the Gamma_1 versus full-level comparison, the translation/sign denominator, the separate Hecke congruence denominator, and auxiliary fine-level descent for small N with CM marks and degree bounds. Then repoint the affected GH.0 and R19.1 prerequisites so geometry → classical projector → CM product realization is acyclic. The package's `classical-fiber-power-contract` states the needed mathematics but is not a substitute for assigning that owner.

Fresh source reading: BDP13 §2.1, printed pp. 1055–1060, and Conrad appendix introduction, pp. 1139–1140; Scholl90 §§1.0–1.3, pp. 1–3, including Theorems 1.2.1/1.2.4 and the weight/boundary deduction in 1.3.4, plus §4.1, p. 8. Scholl's individual newform motive is homological; his Remark 1.2.6 does not license an unconditional individual Chow projector. The README retains this distinction.

## Blocker 2: the relative/family regulator extension has no supplier layer

Read current `PadicHodgeRegulators--L3.json`, particularly `crystalline-regulator` and `naturality-and-lattice`. Its source is H1_Iw(Q_p,V), via Wach/psi and Mellin, with finite flat coefficient naturality. Neither that map nor the remaining L3/L4 targets constructs the relative Lubin–Tate integral Omega map, ordinary deformation exponential on J, Yager trace module, or the two-variable family regulator.

**Needed coordinated revision:** a genuine Part II extension in the regulator owner, with individually named targets and dependencies for:

1. Integral relative Omega, twisting and finite local pairings, including the KO replacement for the ramified-conductor local condition.
2. Ochiai's ideal-restricted exponential, its pseudo-null error, and the different conductor-zero/positive interpolation factors.
3. The unramified trace limit, Yager covariance and inverse group-element convention.
4. The localized two-variable regulator, its nonexceptional domain and p-old dual-exponential range.
5. Anticyclotomic quotient descent: actual coefficient submodules, kernel/base-change calculation and nonzero functional on the ordinary crystalline line.
6. A regular model/moment at lambda=0, or a correctly scoped cleared-denominator identity.

Then replace the descriptive “L3 extension” prerequisites in GH.2.5, GH.4.4, GH.7.5–GH.7.9 and GH.8 consumers by those actual target identifiers. Do not re-plan the cyclotomic construction. An arbitrary injective map is not an arithmetic supplier, and injectivity before quotienting is insufficient.

Fresh source reading: Castella §§3.2–3.4, pp. 14–17, especially Theorem 3.4, Proposition 3.5, Theorem 3.7 and Corollary 3.9. Their ideal, trace and localization constructions are distinct. Relevant further locators retained from the accepted plan are Castella Lemma 5.1/Proposition 5.2, pp. 21–23; CH22 Theorem 5.1 and §5.3, pp. 21–25; KO Lemmas 4.7/4.10 and (4.47), (4.49)–(4.50), pp. 42, 44–45. This run does not claim to have reread all of KO or LZ14.

## Blocker 3: the nonsplit auxiliary-form export lacks its source-range adapter

Freshly read CH22 Hypothesis (H), pp. 1–2: every tame-level prime splits, with weight-dependent exclusion p not dividing 2(2r−1)!N phi(N). Freshly read the BSD erratum Theorem 2.3 and proof, pp. 3–4: it requires a nonsplit q exactly dividing the tame level, specified special local types and a condition at 2; its later congruence proof varies the weights. The accepted GH.2–GH.7 targets do not prove an extension from the former range to the latter. GH.5's LV16 admissibility also retains all-split level and a weight-dependent factorial exclusion.

**Needed coordinated revision:** construct a specific earlier `auxiliaryRangeAdapter` under exactly the erratum's auxiliary-form hypotheses, with corrected local conditions, a genuine integral leading-class unit, non-torsion and sufficient weight/lattice bounds. Collate the LV19 Theorem 4.7 actually cited by the erratum with the edition used by the roadmap (LV16 v1), or give an independently applicable theorem with a complete proof route. Do not treat LV16 as if that collation had occurred. Repoint GH.8.16 to this target. The current README conditionally states the desired export and identifies the adapter's content, without asserting its existence or changing the earlier all-split targets.

BSD.6a retains congruence/control, characteristic/Fitting-ideal transfer, both divisibilities and the limit. The multiplicative p-new elliptic point is not in the p-old range of Castella Remark 6.6, p. 29. No enlarged HE.8 point comparison is needed to disguise the higher-weight gap.

## Current upstream and duplication screen

Read the full JacobianChallenge and AlgebraicVectorBundles READMEs as form models, together with their Suggested interfaces. Screened the nine post-snapshot Suggested roadmap families named in WORKERS, including OperatorTheory's eight nested Suggested files, and the four specified Completed roadmaps. Read relevant current native symmetric-power representation and abstract divisor Abel–Jacobi declarations. Reused their scope in the boundaries section instead of re-planning generic symmetric-power functoriality or divisor classes. Neither that divisor-class API nor local multiplicative Kummer theory supplies the continuous Tate-module/higher-cycle comparison. No matching Kuga–Sato, generalized Heegner, Yager or family regulator construction was found by that mathematical-object screen.

Read the GH.0–GH.8 entries of the reviewed library audit. They do not close these three contracts. Current read-only upstream revision: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current symmetric-power APIs are noted as current library inputs; the compact Lean introduces no dependency on declarations absent from the prescribed pins.

## Adversarial pass

| Statements/operators | Instances and conclusion |
| --- | --- |
| CM pairing normalization | Pairing 1 leaves eta fixed; pairing 2 gives eta/2; zero pairing produces zero in the algebraic totalized inverse, outside the nonzero normalization theorem. |
| Stabilization and Iwasawa normalization | r=1 makes p^(2r−2)=1; p=5, alpha=2, z=3, predecessor=4 gives 1; level 1 of constant scalar 1 gives 1/2; level 0 is unchanged. Arithmetic use retains r≥1 and a unit root. |
| Differential scaling | m=2,j=0,a=2 gives 1/4, square 1/16; signed integer exponents retained; nonzero a assumed. |
| Kolyvagin correction | u=2, raw=6 gives 3 over Q; u=−1 negates; u=0 loses the class. Integral use requires a unit and separately proved local compatibility. |
| Critical twist and Howard normalization | Trivial/inverse characters; nebentypus −1 survives; t=0,1,2 give U_p X0, X1, U_p^-1 X2. Trace theorem assumes U_p nonzero and an already proved raw trace. |
| Initial conductor and rescaling | Exact p=5,alpha=2,a=9/2,u=1,d=4 model gives 1/4; replacing only u by 2 gives 1/8. Nonzero bottom and t≠1 are necessary for the obstruction. |
| Uniform comparison and limits | Common d bounds kernels and lifts d times compatible sections without limit exactness. d=2 need not be an integral isomorphism. Doubling transition on Z has zero limit despite rational levelwise isomorphisms. |
| Quotient and pairing injectivity | Multiplication by X on Q[X] loses injectivity mod X. A scalar projection on Q² loses (0,1); a nonzero functional on an identified one-dimensional space is injective. Exact preimage equality is explicit. |
| Primitive-character stabilization | Nontriviality on the last kernel is required; inflated C4 character leaves a lower term 4. Domain coefficients matter: 1+3=4 mod 8. Exact C9/F19 restriction has 1+4³+4⁶=0; torsion in the target module is allowed because cancellation is coefficientwise. |
| Positive trace, differential/reciprocity transport and coefficient maps | The Hecke polynomial and degree p apply only to repeated positive transitions. c=3/log=6 needs c^-2=1/9, not c^-1; c=0 loses AJ. A ring map preserves scalar identities, not characteristic ideals or nonvanishing under a killed multiplier. An inverted lambda cannot specialize to zero in a nontrivial ring. |

No arithmetic truth claim is based on successful elaboration of `sorry`.

## Validation and source receipts

Final checks on the saved revision:

- `lean-check research/blueprint/packages/GeneralizedHeegnerCycles/Suggested.lean`: exit 0 against pinned Mathlib 082e2d3; 61 warnings, all “declaration uses `sorry`”; no errors or other warnings. The file has 502 lines, six real-bodied definitions, 17 theorem signatures and 44 examples/negative controls. Available memory was 77 GiB before the final check; checks were sequential and no Lean process remains.
- A separate scratch file containing the six light definitions and 20 closed numerical/finite-ring controls elaborated with `norm_num`/`decide`, with no admissions or warnings. This only verifies those algebraic controls, not the arithmetic targets. Its statements are represented in the committed Suggested file and adversarial table; the scratch artifact is discarded.
- `python3 scripts/check_blueprint.py` on each of `GeneralizedHeegnerCycles--GH.0.json` and `GeneralizedHeegnerCycles--GH.8.json`: exit 0, zero errors and zero warnings. This structural success does not discharge their recorded mathematical gaps or the package review.
- `python3 research/blueprint/intake.py check-files` on all four authorized deliverables: four files, zero problems.
- Inventory comparison against the starting README: all 82 target headings and all 124 named API/Check bullets identical and in order (66 API items, 58 checks). All 94 explicit anchors are unique; all 188 internal anchor links resolve. Each of the nine layers has Examples and Dependencies.
- Metadata is exactly the required one-line category. `git diff --check` passes, and the changed paths are limited to the package README, Suggested file and this handoff.

Re-run with the prescribed `lean-check` wrapper after future Lean edits, never by creating a new build.

Freshly acquired public source PDFs matched these SHA-256 receipts; only the locators listed above were read for this revision, not all five works in full. No source files or passages are committed.

| Edition | SHA-256 |
| --- | --- |
| BDP13 Duke copy, 116 pages | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |
| Scholl90 author copy | `b3a28690b3ba4aff316ac52ea7003cca8da757bfa309b75a9aba9557a134def6` |
| CH22 July 2, 2022 author copy | `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba` |
| Castella Heegner author copy, 31 pages | `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d` |
| BSD erratum, five pages | `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf` |

## Where to resume

Resolve and independently review the coordinated owner/contract changes above first. Update the accepted packets and assembled reader through the jobs authorized to change them, including prerequisite/tier consistency. Then reconcile this package against those corrected inputs, recheck all 82 targets and every source range, and request a new independent package review. Preserve the compact-file shape and do not restore sorry-bodied data. This run claims no second job and leaves no changes in the read-only upstream repositories.
