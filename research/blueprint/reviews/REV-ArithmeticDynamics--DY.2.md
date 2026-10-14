# Independent review: Arithmetic dynamics DY.2

**Accepted as a complete target-level planning pass with planned coverage.** Six gaps remain explicit; the layer is not closed and no theorem is claimed implemented. The issue permits acceptance of a correct pass whose prerequisite chains terminate in recorded gaps. All 31 targets have justified source statements, all 16 pinned baseline declarations were read and confirmed, and the corrections leave no unresolved contradiction.

Reviewer: Codex, session `codex-SL7Vxv`, job `REV-ArithmeticDynamics--DY.2` (#9274), 14 October 2026. The author of the input was a different session, `codex-rwzYQG`; this is an independent review.

## Counts

| Item | Result |
| --- | --- |
| Nodes | 28 → 31: 14 verified, 14 corrected, 3 added; none unverifiable |
| Kinds | 3 definitions, 24 theorems, 3 comparisons, 1 application |
| Baseline declarations | 14 retained and confirmed; 2 added and confirmed; 0 removed |
| Definition API and tests | 20 API items; 12 tests, four per definition |
| Suggested Lean | 7 real-bodied light definitions, 18 API declarations and 11 examples; 2 analytic compatibility APIs and 2 carrier-dependent tests remain explicit reader targets |
| Planets | 6 retained; each is a key definition or named central theorem |
| Sources and findings | 6 public editions; E801/E802 confirmed, E803 added and confirmed |
| Closure | 8 precise supplier requests; 6 explicit gaps; DY.2 planned, not closed |

## Corrections and additions

1. **Exceptional points in arbitrary characteristic.** The parent critical-point divisor theorem assumes characteristic zero. Its use in classification was too strong for the Frobenius alternative. The corrected proof uses three totally invariant points of an iterate, binary-form factorization, separable degrees and the simple fixed-point equation for a purely inseparable map (Benedetto Theorem 1.11(a), pp.6–7; FRL §2.3, p.14).

2. **General nonarchimedean disc estimates.** The parent residue-disc expansion is for good reduction. It cannot provide all local expansions in the arbitrary rational-map disc criterion or multiplier dichotomy. These now consume the exact general TB.1 contract; the integral polynomial jet theorem needs no such expansion hypothesis. The omission proof follows the expanding-return, wandering-disc and invariant-return cases of Benedetto Theorem 4.29 and Lemma 4.30, pp.41–42, with the omitted-two-values bound of Theorem 4.27/Corollary 4.28, p.41.

3. **Berkovich iteration.** Finite fibres alone did not justify passing from stability for an iterate to stability for the map. Added `berkovich-julia-iterate`, justified by parent escape-rate iteration, equality of canonical measures and the support theorem. The basic invariance theorem now proves open-set image/preimage stability using its omitted set, and treats finite exceptional cycles and Frobenius separately (Benedetto Proposition 6.15, p.63). This order has no dependency cycle.

4. **Complex key prerequisites and inverse branches.** Added `complex-repelling-periodic-density`, the classical density theorem Lyubich states on p.355 and uses on p.356. Its reverse-inclusion proof remains an explicit gap. The corrected blowing-up sketch uses a repelling return neighborhood and compact exceptional-free backward-invariant sets. Inverse branches are normal without a disjoint-image hypothesis; shrinking requires their domain to meet Julia and is uniform on compact subdomains. Added the quantitative branch deficit and the existing ConformalMapping L0 Hurwitz supplier (Lyubich Propositions 1–4, pp.356–358).

5. **Measure support and comparison.** Transfer-limit measures are constructed on compact backward-invariant sets outside E. Taking that set to be J proves support containment; positivity after uniform blowing up proves the reverse inclusion. This replaces an unsupported zero-Fatou-mass shortcut (Lyubich Theorem 1 proof, pp.361–362). Baker–Rumely Proposition 3.36(B), p.18, is now cited for the actual archimedean comparison. DKY §2.4, p.9, is identified as a Legendre Lattès consuming instance wherever cited.

6. **Entropy.** Added `complex-bowen-net-bound`, including the finite-set variable-radius covering argument and the O(m⁵d^m) full-sphere net count (Lyubich §6, pp.368–376). For the fixed omitted spherical net in that construction, spherical Montel supplies a uniform branch modulus after normalizing source discs; a new Koebe theory is unnecessary for this specialization. The bound is an explicit prerequisite of entropy and maximal-entropy uniqueness. The native entropy target uses `Set.univ`, natural logs and EReal. Its lower-bound sketch uses fibre entropy directly, without invoking the downstream entropy-equality endpoint.

7. **Zieve composition.** Generic weighted coefficient divisibility precedes the valuation recursion; it must not depend on that consequence. It now uses native `Polynomial.comp`, `Polynomial.coeff` and `Nat.iterate`. Read the rendered author thesis pages for Lemmas 29–30,39–42, Propositions 31–32, Theorem 33 and the rational-cycle adapter. The odd-prime preparation gap and the explicit p=2 argument remain honest.

The reader mirrors every corrected statement, proof step, prerequisite, request, gap and finding. The suggested file adds the three new reader targets to its omission inventory; no placeholder carrier or assumed endpoint was introduced.

## Baseline and ownership audit

Each inventory entry was checked in the source at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, including its surrounding hypotheses. No Tau Ceti implementation declaration is asserted; the Tau Ceti pin stays `f790474821cf4256814db967cb154e7af3d0c369`.

| Confirmed declaration | Module and relevant scope |
| --- | --- |
| `mathlib:Nat.iterate` | `Mathlib/Logic/Function/Iterate.lean` — Native iterates, including the identity at n=0; Function.iterate_* supplies the laws. |
| `mathlib:UniformEquicontinuousOn` | `Mathlib/Topology/UniformSpace/Equicontinuity.lean` — One entourage bound simultaneously for all iterates and pairs in a specified neighborhood; stronger than pointwise EquicontinuousAt. |
| `mathlib:uniformSpaceOfCompactR1` | `Mathlib/Topology/UniformSpace/OfCompactT2.lean` — The unique compatible uniformity of a compact Hausdorff carrier, used locally on OnePoint C; it is not a global instance. |
| `mathlib:OnePoint.equivProjectivization` | `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean` — Set equivalence OnePoint K with Projectivization K (Fin 2 → K), mapping finite z to [z:1] and infinity to [1:0]. Does not provide a complex manifold or a projective-line homeomorphism. |
| `mathlib:MeasureTheory.Measure.support` | `Mathlib/MeasureTheory/Measure/Support.lean` — Native support of a measure on a topological measurable space; use instead of defining a second dynamical support. |
| `mathlib:MeasureTheory.Measure.isClosed_support` | `Mathlib/MeasureTheory/Measure/Support.lean` — Support is closed without assuming second countability. |
| `mathlib:MeasureTheory.Measure.support_mem_ae_of_innerRegular` | `Mathlib/MeasureTheory/Measure/Support.lean` — Inner regularity supplies conull support on a Hausdorff Borel space; nonempty support of a probability follows without a countable basis. |
| `mathlib:MeasureTheory.ProbabilityMeasure` | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean` — Native probability measures, underlying Measure and weak topology defined by continuous bounded test functions. |
| `mathlib:Dynamics.coverEntropy` | `Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean` — Native EReal-valued topological entropy on a uniform space, using limsup covering growth; the global sphere target uses Set.univ. |
| `mathlib:BoundedContinuousFunction.arzela_ascoli₁` | `Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean` — Closed equicontinuous sets of bounded continuous maps from a compact domain into a compact metric target are compact. Restrict to compact subdomains before applying to local normal families. |
| `mathlib:RealRMK.rieszMeasure` | `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean` — Radon measure of a positive linear functional on compactly supported continuous real functions of a locally compact Hausdorff Borel space. Compact sphere continuous functions identify with this space. |
| `mathlib:MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported` | `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean` — Regular measures agreeing on all compactly supported continuous real tests are equal. |
| `mathlib:RealRMK.integral_rieszMeasure` | `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean` — The representing measure integrates each compactly supported continuous real function to the value of the positive functional. |
| `mathlib:ArzelaAscoli.isCompact_of_equicontinuous` | `Mathlib/Topology/UniformSpace/Ascoli.lean` — An equicontinuous family of continuous maps compact in the pointwise topology is compact in the compact-open topology; native uniform-space formulation. |
| `mathlib:Polynomial.comp` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean` — Polynomial substitution over a semiring; iterate the function H↦H.comp f for composition powers, rather than ring powers. |
| `mathlib:Polynomial.coeff` | `Mathlib/Algebra/Polynomial/Basic.lean` — Native coefficient finitely supported function, used over the generic integer coefficient ring and its reductions. |

The original 14 citations supply the advertised native iterates, uniformity/equicontinuity, set-level projective equivalence, support, weak probability topology, topological entropy, Ascoli and real Riesz–Markov interfaces. They do not supply a sphere manifold, measure-valued Laplacian or Berkovich analytic carrier. Those limits are retained explicitly.

Read the relevant parent ArithmeticDynamics node statements and the actual TB.0/TB.1, PM.4 and ConformalMappingPartII V0 contracts. Their unplanned extensions remain requests and gaps. Read the complete current ConformalMapping and FuchsianOrbifolds README and Suggested files as neighboring models; checked BelyiMaps retained §8.1, PDE lane C and OperatorTheory’s family scope. The read-only current TauCetiRoadmap main was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The reviewed `data/library-coverage.json` audit does not mark these dynamics as built. No existing sphere, local holomorphic degree, normal-family or parent canonical-measure construction is re-planned here.

## Source findings

E801 (Benedetto Proposition 6.15(a), p.63) is a carrier misprint: the proposition concerns the analytic line. E802 (Proposition 6.24(f), p.69) reverses the filled-Julia boundary relation; the good-reduction power map supplies a direct counterexample. Both are confirmed against the 9 March 2010 AWS notes, not attributed to the later book.

Added E803: the Zieve author-PDF proof headings after Lemma 47 on p.37 and Theorem 50 on p.38 both name Lemma 46. Their mathematical contents identify the intended results; this is a misprint affecting no result. The author pages/publications, original source archives and the Benedetto book errata were checked for existing corrections. The packet records exact public editions, hashes and searches. No source passages or private source files were copied into the repository.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamics--DY.2.json`: 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0 at the pinned Mathlib, only 29 `declaration uses sorry` proof warnings. Available memory was 111 GB before compilation; no language server or Lake build was started.
- Checked all packet statements, proof steps, APIs and test names against their reader blocks and suggested-file declarations or explicit omission comments.
- Source issue shape/version checks and reader/API/endpoint inventory comparison passed; the local dependency graph is acyclic. Intake validation: 5 files, 0 problems. The light-definition checker and `git diff --check` passed.

## Actions for the orchestrator

Keep the parent’s 55 DY.2 nodes authoritative and preserve planned coverage. Route the five existing gap contracts: sphere Riesz/Laplacian, spherical Montel, complex Banach splitting, generic measure entropy and nilpotent quadratic preparation. Honor the additional TB analytic-interface requests. Resolve the new ArithmeticDynamics repelling-density proof gap before claiming closed coverage. The retained Belyi sphere request must follow the current BelyiAnalyticCovers successor when its public supplier id is available. No parent or supplier file was changed by this review. The exact continuation steps are in the handoff.
