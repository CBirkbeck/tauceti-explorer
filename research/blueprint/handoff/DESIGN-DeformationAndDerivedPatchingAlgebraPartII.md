# DESIGN-DeformationAndDerivedPatchingAlgebraPartII — completed planning pass

Codex, session `codex-k5lYji`, claimed issue #3476 with the prescribed claim command; the bot confirmed it on 11 October 2026. Branch: `codex-k5lYji-cm-blowups`. No second job was claimed. No subagents were used.

The manager’s priority list had no eligible available issue. The available-issue screen also found no eligible higher-priority review, package, top or focus job. This available design continuation was selected under WORKERS.md. The scope is the five deliverables named by #3476; no other job’s files are changed.

## Result and coverage

The packet and roadmap are `complete`, ready for independent review. This is a finished target-level planning pass under the 9 October streamlined protocol, not a claim of mathematical implementation or gap-free closure. All fifteen accepted PAPER-CESNAVICIUS-21 items (34, 36, 37, 40–50, 86) are inventoried and realized. Smaller snake-lemma, colimit and spectral-sequence steps stay in the relevant target proof sketches.

- 67 nodes: 4 definitions, 2 constructions, 39 lemmas, 4 comparisons, 17 theorems and 1 application.
- 31 API items, all promoted to named typed items; 26 typed definition tests.
- 19 planets across five layers, at most six in each.
- 40 pinned baseline declarations, with full signatures and surrounding hypotheses read and mathematical matches in our own words.
- Five explicit source/interface gaps; four exact supplier requests.
- Every `implementationStatus` remains `unchecked`.

| Layer | Coverage | Remaining work |
|---|---|---|
| K0 | planned | Primary secant-torsion proof and exact R03.3/AS.1 interfaces |
| K1 | closed | None as a plan; implementations remain suggested |
| K2 | planned | Corrected Kawasaki primary induction and its generic secant interface |
| K3 | planned | SR4/L5 whole-sheaf comparison and overlap contracts |
| K4 | planned | Inherited K2, generic cohomology/depth and geometric gluing contracts |

The reader document is rewritten around these layers, full target statements, definitions’ APIs and discriminating tests, supplier boundaries and mathematical proof plans. The earlier checkpoint’s obsolete missing-signature and mandatory proof-leaf lists are removed. No source passage or source-by-source summary is added.

## Suggested file and meaningful boundaries

Every packet node, API item and test has a corresponding typed declaration or labelled example. The suggested file elaborates at the pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, with `sorry` as its only warning. Elaboration verifies types, not truth or proofs.

The actual carriers are native module quotients, local cohomology, localized modules, Rees algebras, Proj schemes, scheme module sheaves, affine tilde/pullback and chart image spans. There is no arbitrary Scheme with an assumed CM field and no arbitrary proposition standing in for a missing supplier condition.

The following limits are explicit beside the signatures and in the packet:

- R03.3 secant/CM predicates are expanded through actual support dimension and native local-cohomology vanishing. They are prototype adapters, not newly owned definitions.
- The duality-annihilator consequence takes an actual cochain complex with finite homology and a supplied local-duality isomorphism into an essential injective hull. Its eventual RHom identification and negative-degree zero convention require AS.1.
- `cm_locus_annihilator` and `nonequidimensional_defect` explicitly omit the currently unstateable normalized-dualizing hypothesis. They are **invalid at their displayed generality**. The roadmap statements retain that hypothesis. Do not treat their successful type check as mathematical validation.
- The strict-transform and two-ideal comparisons are typed on actual chart modules; whole-sheaf compatibility and gluing remain supplier obligations. The two-ideal centre is extended to the previous chart, rather than left in the original ring.
- Regular-element reduction compares module sheaves on the same blowup scheme. It does not assert a base change of that scheme to the quotient base.
- The depth induction and second claim retain the closed/maximal chart-point condition. A depth bound at every point of the closed fibre would be unjustified.

The annihilator product gained a fourth test distinguishing product from intersection, with the concrete mathematical realization M=k⊕R/(y) over k[[x,y]]. The suggested test uses the actual two local-cohomology annihilators and a typed inequality between their product and intersection.

## Source checks and new proof data

The source metadata identifies editions, URLs, hashes, sections and page/lemma locators. Files were read only in scratch; no source file or source passage is committed.

- Česnavičius, arXiv:1810.04493v2, §3 in full, pp. 9–17, including both Claims 3.14.5–3.14.6, plus §1.14 conventions on p. 4. The Duke version of record was not read. Inherited E4–E8 remain scoped to the author manuscript/arXiv v2 and keep their prior independent confirmation; the printed/correction fields are paraphrased.
- Kawasaki, RIMS Kôkyûroku 964 (1996), §§1–2, pp. 40–43. Definition 2.5 on p. 42 gives the type-(d−1) p-standard reversal directly. This closes the definition-source gap but does not supply the general auxiliary-quotient induction from Kaw00/Kaw02.
- Stacks 02IJ, Lemma 10.113.1 and its proof. Finite generation of the Rees algebra, the domain height bound and reduction to minimal primes prove dim Rees≤dim base+1 without an unread HIO citation or a catenarity assumption for the inequality.
- Stacks 0A7U and 0A7Z with their proofs. Coherent dual cohomology, normalized localization/coheight and the first nonzero degree give the general defect formula; unread Schenzel 2.4.6 is no longer a proof dependency.
- Stacks 052P and 080A with the relevant presentations/proofs. The module versions are developed from image localizations; generic scheme geometry remains imported.
- Heinzer–Johnston–Lantz–Shah author preprint, Example 3.6, p. 13, with context pp. 12–13. The explicit CM ring is the localization of k[x³,x⁵y³,x¹⁵y²,y⁷]. A monic presentation gives a free rank-21 module over k[x³,y⁷], proving CM. Its x³-chart becomes k[a,b,c,d] with exponents (3,0),(5,3),(14,2),(4,7); a,d are parameters, c² is nonzero modulo a and d c²=a b³c. This gives a surviving depth-one local chart. The packet includes the computations and the localization check.

The library index was read. Schenzel 1982 and HIO 1988 are not cleared; neither was read or copied. Public substitutes resolve the p-standard, defect, dimension and explicit-counterexample gaps. The remaining Schenzel torsion proof and corrected Kawasaki 2000/2002 induction are source gaps, not hidden assumptions.

## Ownership and overlap

The full reviewed R03.3 audit row was read before planning. Its generic commutative-algebra direction is imported. The accepted route.reason, rather than the stale brief, owns ordinary normalized dualizing complexes in AS.1. The current AS.1 description has topological/coherent formalisms and no packet supplying the exact ordinary-ring package, so the request records this scope gap.

The current L5 packet/package covers normal-crossing comparison and alterations. The L2 vector-bundle-extension target uses coherent extension and Fitting blowup strict transforms, but is not the general module strict-transform contract needed here. The accepted L5 ownership is retained as a precise request rather than falsely attributing it to an existing node.

Current StableReduction and AlgebraicVectorBundles were read for the relevant existing geometry and sheaf APIs. All nine roadmaps newer than the atlas snapshot and the current Tau Ceti library were screened. Current Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 already supplies Rees grading, affine blowup algebras and `affineBlowupι` charts with cover/base properties. These are recorded separately from the older pin and are not planned again. No builds were run in the read-only current environment.

The continuation is outside the presently listed upstream tiers. No higher-tier definition is moved. Reserved ids, drafts and links were screened; none supplies the requested ordinary-duality or generic module interface. The roadmap dependency closures of R03.3’s owner, AS.1’s owner and L5’s owner have no return path to this Part II. The local packet graph passes the acyclicity check.

## Validation and next step

`python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebraPartII.json`: **0 errors, 0 warnings**, against the installed pinned declaration index.

`lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebraPartII.lean`: **exit 0; only `sorry` warnings**. Memory availability was checked before each compilation; checks were serial and no language server or library build was started. A declaration/label scan verifies all 67 node names, 31 API names and 26 test labels occur in typed forms.

Next: an independent reviewer should assess this complete planning pass, especially the corrected closed-point scope, the explicit nonexample, the alternative defect/dimension arguments and the clearly limited supplier prototypes. Resolve the five named gaps with the owners or cleared primary proofs before claiming closure. Packaging follows review under the streamlined protocol; do not request artificial decomposition of every small proof step.

Scratch contains no required handoff artifact and can be deleted once the pull request is open. No background Lean process is left running.
