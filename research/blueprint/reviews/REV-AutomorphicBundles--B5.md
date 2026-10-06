# Independent review: AutomorphicBundles B5

**Verdict: accepted at target level.** Issue #356; reviewer Codex, session
`codex-DgBbon`; 6 October 2026. This session contributed none of the planning
work, including the completed pass by session `codex-DMxf9a`.

The packet is one completed planning pass under PROTOCOL section 0. Its sole
stage, `AutomorphicBundles:B5`, is **planned**, with five precise remaining
items, twelve gaps and nineteen owner requests. Every target has a node and
prerequisite chains ending in pinned declarations, exact owner nodes, requested
stages or explicit gaps. Acceptance certifies these specifications and their
honest dependency boundaries. It does not certify formal closure, the complete
underlying comparison proofs, or implementation. All implementation statuses
remain `unchecked`; no stage is marked closed.

## Counts and changes

| Item | Reviewed result |
| --- | --- |
| Nodes | 28: 1 definition, 5 constructions, 7 lemmas, 12 theorems, 3 comparisons |
| Per-node verdicts | 18 verified, 10 corrected, 0 added, 0 unverifiable |
| Definition/construction API | 26 items, including 3 constructors added by this review |
| Definition/construction tests | 18, three for each of the six objects |
| Planets | 6, unchanged |
| Baseline declarations | All 19 confirmed; none removed or replaced |
| Owner requests / gaps | 19 / 12; scopes clarified rather than declared closed |
| Source findings | 3 independently confirmed, with version and inference limits |

Every node has an individual explanation in `review.checked`. Corrections made
in the allowed deliverables are:

1. Replaced the inaccessible publisher PDF for **LAN-HIGHER** with the inspected
   [author-hosted preprint](https://www.kwlan.org/articles/Koecher.pdf).
   Its cover identifies the published reference, but its pagination differs.
   The packet now cites §2 on pp.2–3, Proposition 5.6 and its proof on pp.11–13,
   Remark 5.7 on p.13, and Corollaries 5.8–5.9/Definition 5.10 on p.13.
   Corollary 5.8 is included where the excerpt refers to the locally free
   coefficient sheaf. Replaced the URL, edition description, read-section list,
   SHA-256 and corresponding version record; corrected both vector nodes'
   locators. The old publisher bytes/hash were not independently verified.
2. Corrected two literal Stacks excerpts: `filtration by` in tag
   [00L0](https://stacks.math.columbia.edu/tag/00L0), and `finite presentation`
   in [0GQZ](https://stacks.math.columbia.edu/tag/0GQZ). Their mathematical
   uses are unchanged. Extended the non-neat descent locator to include
   Diamond §6.2, p.25, where `taking invariants` actually occurs.
3. Corrected the prime modular correspondence acceptance test to degree
   **ℓ+1**. With ν=ℓ⁻¹ its weight-zero constant value is (ℓ+1)/ℓ. The formula
   already had this value; calling the correspondence degree ℓ was inconsistent.
4. Added the exact existing
   `ShimuraCompactifications:C0/relative-face-open` prerequisite for ordinary
   face localization and
   `ShimuraCompactifications:C5/neat-strata-detect-geometric-components` for
   neat-level fiber detection. Read their statements and hypotheses, including
   the latter's four boundary intersection/closure prerequisites, in the C0
   packet. Updated proof, request, gap and suggested-file dependency ledger.
   These are planned supplier nodes; their existence does not implement them.
5. Narrowed the C6 request by identifying its existing tame,
   discriminant-inverted Hilbert expansion/component/boundary nodes as imports
   on their overlap. Their Dimitrov hypotheses do not supply Diamond's full
   ramified, including p=2, weight-(k,m) statement. The request retains precisely
   that extension and its transport requirements.
6. Added named constructors `FourierJacobi.localExpansion`,
   `FourierJacobi.expansion` and `VectorFourierJacobi.expansion` to their API
   outlines and the suggested-file omission ledger. Their inputs are the
   actual imported geometric maps and bundles. They are not new opaque Lean
   carriers. Updated the suggested-file header with this review's exact
   elaboration boundary.
7. Added independent verdicts and reasons to all three `sourceIssues`, removed
   E6813's stale description as unreviewed, and recorded the complete packet
   review. Updated fresh source access provenance; Milne's working author URL
   uses the `www` host and serves the recorded hash.

No node, theorem hypothesis, planet or implementation status was removed.
No new lemma nodes were needed at the assigned target granularity.

## Sources and statement checks

The review read the source passages for all 28 nodes, rather than relying on
the planner's excerpts. Public versions inspected include:

- [Lan's 14 March 2021 author revision](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf):
  §§7.1.1–7.1.2 and the relevant formal-chart, boundary and Hecke passages in
  §§6.2.5, 6.4.1, 6.4.3 and 5.4.3. Rendered pp.533 and 536 were checked for
  the source findings. [Errata](https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf)
  items 71–77 and the relevant notation were checked. The
  [introduction](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7,
  supplies the canonical/subcanonical section interpretation.
- [Higher Koecher's principle, author preprint](https://www.kwlan.org/articles/Koecher.pdf):
  the neat good-prime setup and finite-projective representations in §2;
  Proposition 5.6 with its proof, Remark 5.7 and Corollaries 5.8–5.9/Definition
  5.10. The bundle is on the actual abelian torsor. Its filtration need not
  descend through the stabilizer quotient. Only degree-zero expansions are
  used by B5.
- [Diamond, arXiv:2211.06922v1](https://arxiv.org/pdf/2211.06922v1):
  the coefficient/model conventions and §§6.1–6.5, especially Proposition
  6.2.1 and its Iwahori warning, unit-invariant constant terms, equation (6.1)
  and Proposition 6.5.1/Remark 6.5.2. The fractional degree lattice,
  determinant-weight line and normalized adelic Hecke formula are retained.
- [Boxer–Calegari–Gee–Pilloni, arXiv:2502.20645v1](https://arxiv.org/pdf/2502.20645v1):
  the transposed correspondence convention in §1.8, classical smooth bundles
  and Tate normalization in §§4.6.1–4.6.2, and both displays of Theorem 4.8.2.
  All four coherent weights, parity, dominance, degree shifts and Tate twists
  match. Every compact-support summand has the boundary twist.
- [Milne's corrected 2018 notes](https://www.jmilne.org/math/xnotes/AA.pdf),
  VII.4.1: the general formal identity is explicitly a conjecture. The packet
  requires a proven owner interface, rather than treating the conjecture as
  an integral theorem.
- [EGA I, Numdam scan](https://www.numdam.org/article/PMIHES_1960__4__5_0.pdf),
  10.8.11 and 10.9.1–10.9.3: formal restriction detects vanishing near a closed
  subset for coherent sheaves on locally Noetherian schemes; extending a
  morphism to completions requires the actual closed-subset/ideal data.
  The imported F0 statements were read in that scope.
- Stacks [00L0](https://stacks.math.columbia.edu/tag/00L0),
  [00IP](https://stacks.math.columbia.edu/tag/00IP),
  [00NX](https://stacks.math.columbia.edu/tag/00NX),
  [0GQZ](https://stacks.math.columbia.edu/tag/0GQZ) with the site hypotheses
  in [0GQU](https://stacks.math.columbia.edu/tag/0GQU), and the Noetherian
  algebraic-space Stein factorization in
  [0A18](https://stacks.math.columbia.edu/tag/0A18)/[0E0D](https://stacks.math.columbia.edu/tag/0E0D).

These are relevant section readings, not whole-paper readings. The underlying
Rapoport proof cited by Diamond and FC90 proof cited by BCGP remain explicitly
unread inputs. The derived vector expansion principle retains its additional
local-freeness and prime-reduction component hypotheses. It is not presented
as a verbatim scalar theorem from Lan. The complete upstream
JacobianChallenge and GrothendieckEulerForms documents were read for the
planning standard; ModularForms/ModularCurves passages were used as interfaces.

## Baseline and ownership

All nineteen statements and ambient assumptions were independently read at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Their modules are individually
recorded in `baseline.declarations`.

| Declaration | Verified scope relevant to B5 |
| --- | --- |
| `ModularForm.trace` | Analytic unnormalized trace; finite relative index via the intersection, without a subgroup-containment assumption |
| `CuspForm.trace` | The corresponding analytic trace preserving all-cusp vanishing |
| `HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime` | Positive level, prime coprime to level, actual nebentypus function; analytic prime normalization |
| `PowerSeries.isUnit_iff_constantCoeff` | A ring-valued formal series is a unit iff its constant coefficient is a unit |
| `CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono` | Preadditive balanced category, exact source row, monic first row maps and outer vertical maps; no final-row epimorphism |
| `IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime` | Finite module over a commutative Noetherian ring, actual prime-quotient filtration |
| `IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime` | Subsingleton, prime-quotient linear equivalence and short exact coefficient sequence cases, with module universes retained |
| `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` | Finite module, Noetherian local ring, proper ideal |
| `IsHausdorff.of_isLocalRing` | The same local finite/proper-ideal separatedness |
| `AdicCompletion.of_injective` | Injectivity under the actual separatedness assumption |
| `HeckeCosetModule.instRingHeckeRing` | Existing convolution ring under `IsHeckeTriple` |
| `HeckeRing.GL2.heckeRingHomCharSpace` | Existing complex analytic character-space ring action |
| `UpperHalfPlane.qExpansion` | Existing cusp-function Taylor coefficients; positive strict period required by its analytic lemmas |
| `ModularForm.qExpansion_injective` | Fixed integer weight, positive strict period; analytic scope |
| `ModularForm.isCuspForm_iff_coeffZero_eq_zero` | The full modular group, not arbitrary level with one chosen cusp |
| `Algebra.trace_algebraMap_of_basis` | Actual finite basis; local scalar trace equals cardinality times scalar |
| `AlgebraicGeometry.Scheme.Modules` | Actual category of module sheaves on a scheme |
| `AlgebraicGeometry.Scheme.Modules.tensorProduct` | Tau Ceti's sheafified tensor; no global-sections/tensor interchange |
| `AlgebraicGeometry.tilde.isoTop` | Affine tilde sheaf/global-section isomorphism with its actual scalar restriction |

The reviewed library audit is respected: analytic q-expansions, analytic
traces, prime filtration and the abstract Hecke ring/action are imports.
The new nodes construct geometric instances and comparisons. The five R15
supplier statements were checked for Tate/Hodge differential normalization,
all-weight analytic comparison, integral q-expansion, integral Hecke operators
and the cuspidal exact sequence. AA.4 owns the correspondence and degree
theorems. Its Cartesian result needs its stated product/level hypotheses;
normality of a finer subgroup alone is insufficient.

Every requested stage was checked against its supplier description. C0–C5,
F0, SF.0–SF.2 and B1–B4 retain their actual geometric/foundational ownership.
H2/H3 and C6 supply the ramified Hilbert model, weights, units and components.
T6 supplies the foundational logarithmic comparison. Existing pending VB and
BGG directions have no invented stage identifiers. C5's early toroidal inputs
must remain separate from its late minimal endpoint consuming B5; the packet
records that whole-atlas stage validation is still open.

The internal node graph is acyclic. Coefficient rows are left exact, invariants
use unique lifts without averaging, and arbitrary coefficients reduce by one
finite-section lift without commuting infinite products with colimits.
Finite-thickening base change does not assert tensor commutes with arbitrary
inverse limits. These distinctions are required for sound closure sketches.

## Independent source findings

All three findings are **confirmed with their existing limited scope**. The
packet now contains a `review` verdict, reason and reviewer on each entry.

- **E6811, author p.536:** the displayed dual-cone inclusion makes the printed
  reverse difference empty. The extra sigma1 degrees must instead vanish;
  each displayed quotient must also use its own cone's stabilizer. This is a
  transcription finding and does not repair E6812.
- **E6812, author p.536:** ordinary face localization alone cannot induce the
  stated direct map between different stratum completions. A coordinate map
  from k[[x,y]] to k[y,y⁻¹][[x]] would send the unit 1−y to a nonunit, detected
  by constant-x coefficient and y=1. The common boundary completion is a
  possible repair requiring actual geometric maps. The example tests the
  generic inference; it is not claimed to realize all PEL hypotheses or
  disprove the global support theorem.
- **E6813, author p.533:** a finite module that is a directed union of free
  submodules would itself be free. Nonprincipal invertible Dedekind ideals
  contradict that generic deduction from flatness. The retained-prime notation
  does not impose a finite semilocal base. The already reached finite-projective
  case can be handled by a direct summand of a finite free module. This does
  not supply the separate toric cohomology theorem or construct a PEL
  counterexample.

The author errata inspected did not resolve these findings. Novelty and the
uninspected publisher edition remain unverified. No author communication is
part of the review.

## Suggested file and validation

The file has 30 actual algebraic/local examples and 10 declaration checks,
plus an explicit omission ledger for the missing full geometric signatures.
All 26 API names and 18 test names appear. Six definition/construction objects
each retain three tests that reject plausible mistakes: finite support,
averaging in characteristic p, scalar replacement of vector coefficients,
trace normalization, or omission of Hilbert unit/weight lines. The six planets
are central named constructions/theorems and satisfy the count/name rules.

The omission ledger is not an elaborated geometric implementation. PROTOCOL
section 13 permits leaving out conditions whose actual carriers cannot yet be
stated. The packet and coverage explicitly require those signatures and tests
once the suppliers exist; no fake `Prop` field replaces them. Actual prototypes
use existing module/sheaf/series types and prove only their stated local or
linear specializations.

For the independent elaboration check, the three Tau Ceti imports and their
three `#check` lines were temporarily commented in the **same suggested file**.
`lean-check` elaborated all remaining code against pinned Mathlib with exit 0,
zero errors and 22 warnings, all `sorry` warnings. The file was then restored.
Subsequent edits change comments only. No separate Lean file/project was
created, no library was built, and no language server was started.

**The full suggested file was not compiled at both pins.** The available
prebuilt environment has the exact Mathlib pin, but not the required Tau Ceti
object files at f790474. Reading the exact Tau Ceti source statements confirms
the baseline citations; it does not certify their imports elaborate together
in this expanded file. Memory exceeded 20 GB before the check and no compile
remains running.

Final checks: `python3 scripts/check_blueprint.py
research/blueprint/packets/AutomorphicBundles--B5.json` reports **0 errors,
0 warnings**. API/test name agreement, review coverage, unchecked statuses,
unique node identifiers, JSON validity, allowed deliverable paths and
`git diff --check` were checked.

## Orchestrator follow-up

The review issue does not authorize editing the reader document. Synchronize
its degree-ℓ typo on line 423 to degree-(ℓ+1), its LAN-HIGHER journal-page
citations/source metadata on lines 641/666 to the inspected preprint locators,
and its API/dependency inventory to the three constructors and exact C0/C5
imports. These are identified review corrections, not a request to re-plan B5.

For closure, resume at the packet's five coverage items: actual common formal
charts and non-neat component transport; coefficient-sensitive refinement and
boundary exactness; finite-projective trace/refined correspondence descent;
the general and ramified Hilbert source interfaces; and assigned VB/BGG,
FC90/logarithmic comparison carriers and the early/late C5 split. The existing
neat C5 theorem should be imported with its exact hypotheses. A later worker
must not recreate it in B5 or extend the tame C6 theorem silently to Diamond's
ramified setting.
