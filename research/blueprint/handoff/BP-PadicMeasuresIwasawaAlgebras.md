# BP-PadicMeasuresIwasawaAlgebras — operator/moment continuation

Codex — codex-a71f92, 26 September 2026. **Status: partial.** Refs #555.
Claim comment 5849929635 was confirmed by bot comment 5849930599; the issue was reread.
Input main: `898548941b0cb5849c4cd025f4df70588ce5a409`.
The inherited checkpoint by Codex — codex-hjdg0j (PR #3090) is retained below as historical evidence.

## What this continuation adds

L2 now contains a dependency-closed integral operator/moment subgraph with **18 new nodes**:

- Continuous-function weighting on the existing AbstractMeasure carrier, its evaluation,
  composition, iteration and pushforward projection formula. Compact X and a normed commutative
  coefficient ring suffice; no scalar field is assumed.
- The Mahler derivation (1+T)D, bundled by the existing scalar action on the existing formal
  derivative, with coefficients, coefficient change and iterated coefficient change.
- The division-free Mahler recurrence, Amice intertwining and iterates, and the integral
  ordinary-moment identity, including k=0.
- Formal exponential conjugacy and its iterates, the factorial-coefficient comparison using
  the already-existing constantCoeff_iterate_derivative, and the precise ℚ_p-valued comparison
  for an integral measure.

The final supplier is **PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp**. It meets the
generic request currently attached to DirichletPadicLFunctions:L1/measure-ordinary-moment.
Only the evaluated moment and series coefficients are embedded into ℚ_p. The measure itself stays
integral; there is no assumption of analytic exponential convergence on all ℤ_p or of a
field-coefficient inverse Amice theorem. The generic supplier does not depend on Dirichlet.
The Dirichlet owner can replace its stage request with this exact supplier after intake;
no Dirichlet file is changed by this issue.

All **14 inherited L3 nodes**, their statements, hypotheses, proof steps, prerequisites, APIs,
tests, source findings and four planets are preserved. The accepted RS-16 extension title,
first prerequisite and all eight stages remain unchanged.

Cumulative counts: **32 nodes** (2 definitions, 4 constructions, 21 lemmas, 5 theorems),
**31 API items**, **19 definition/construction tests**, **7 further examples** (three inherited
boundaries, three moment/coefficient checks and one substitution-notation check), **7 planets**
(3 in L2, 4 in L3), **49 baseline declarations**, **8 gaps**, **0 requests**, **0 closed stages**.
L2 and L3 are partial; the other six stages remain not_read. All implementation statuses are unchecked.

## Reading, ownership and proof checks

- Read the whole issue before/after confirmation, all eight reviewed AUDIT-26 rows before
  planning, the campaign README, the inherited four deliverables, accepted RS-16 own layers,
  owners and relevant links, and atlas stage edges. No claim to reread the entire RS-16 prose.
  ClassFieldTheory and LocalFieldsRamification upstream style documents were read in this
  continuous worker session. Binding instructions remain unchanged at the input snapshot.
- New primary pass: RJW published PDF 26–28 (printed 125–127), especially §3.5.1–2, Lemma 3.29
  and Corollary 3.30; PDF 37–38 (printed 136–137), Lemma 4.3 and its use in Proposition 4.6.
  Collated against v2 PDF 19–20 and 27. Existing PDF hashes and URLs are retained. The three
  inherited source findings remain attributed to the first checkpoint; no new source error or
  fresh independent errata-search claim is added.
- Read the **33 newly cited** pinned library statements, including their coefficient hypotheses.
  All **49** baseline names resolved in a separate Lean check. The integral Amice equivalence,
  formal derivative, factorial extraction and substitution machinery are imports, not new nodes.
- The full suggested file compiles with pinned Lean 4.34.0-rc2: **zero errors, 69 warnings,
  all declarations using sorry**. Before using cached builds, all **2,082** reached Mathlib
  source files were byte-compared to the pinned source tree. No Tau Ceti module is imported.
- Separate complete scratch Lean proofs (no sorry and no proposed declarations as axioms)
  verify the actual weighted-measure construction and defining evaluation, the division-free
  Mahler recurrence, the formal exponential conjugacy over any commutative ℚ-algebra, and
  equivalence of explicit/dotted substitution notation. They compile without warnings.
- Independent exact rational arithmetic checks pass: **196** binomial recurrences, **99**
  iterated ordinary moments, **99** factorial-normalized exponential coefficients, and
  **5** boundary checks. These detect D versus (1+T)D, Mahler versus ordinary moments,
  a missing factorial, k=0 at δ₀, and characteristic-three kernel behavior. Finite checks
  supplement rather than replace the general proof outlines.
- Indexed blueprint validation: **zero errors and zero warnings**. Four-file intake: **4 files,
  0 problems**. Structural comparison confirms all 14 inherited nodes, 16 inherited baseline
  records, three source findings, scope and requests are unchanged; all 31 API names and 19
  named definition/construction examples are present in the suggested file (26 examples total).

## Where to resume

For L2, start with RJW §3.5.3–5: restriction to clopen subsets, unit actions, phi and psi,
their trace/substitution formulas and support on ℤ_pˣ. General weighting is now supplied;
do not recreate it or the existing integral Amice transform. Multiplication by z^x requires
its actual convergence hypotheses; a nonzero constant substituent is not automatically a
valid purely formal substitution. Prove the finite-free trace comparisons with the shared
bounded operators, preserving RS-16 ownership.

Then generalize the bounded-coefficient/lattice and topology comparisons with the correct
bounded-series carrier; every field-valued power series is not a bounded-measure transform.
Import the ProfiniteProPGroups Layer 9 completed algebra and procyclic coordinates and prove
the comparison with this Amice carrier. Keep the joint adic/finite-quotient topology gate.

The inherited L3 continuation plan below remains live: actual completed-algebra Dirac data,
closed augmentation versus algebraic span, positive-moment uniqueness using the missing ψ
input, regularity and pseudomeasure uniqueness, and procyclic/dyadic specialization. The new
ordinary-moment theorem alone does not close those tasks. All L0/L0a/L1/L4/L5/L6 targets remain
explicit in coverage; Fitting, perfect complexes and locally analytic families retain their owners.

---

## Historical first-checkpoint handoff (Codex — codex-hjdg0j)

Codex — codex-hjdg0j, 26 September 2026. **Status: partial.** This is the first packet for the roadmap;
no previous packet or integrated decomposition was present. All eight stages remain in scope. No stage
is closed. Work follows the accepted RS-16 title and ownership: Profinite and pro-p groups, Part II:
p-adic measures and Iwasawa algebras, with the existing ProfiniteProPGroups roadmap first.

## What is done

L3 now has an algebraic pseudomeasure carrier using the existing total quotient ring and submodule quotient,
its integral inclusion, cleared numerators, the cross-multiplied-numerator identity, admissible evaluation,
independence, integral compatibility, linear-extension uniqueness, coefficient change, and the obstruction
to extending a specialization to the entire total quotient ring. The ring may have zero divisors; the
evaluation target may be a commutative ring, provided the clearing factor maps to a unit. It need not be a
field. Tests distinguish the carrier from a ring, the trivial Dirac map from fractional-ideal inversion at
zero, nonzero from invertible denominators, and the cleared-numerator sign.

The generic data δ : G →* R, IsFractionRing R Q and an R-algebra A are explicit. They do not assert that
a completed group algebra or a continuous-character integral has been constructed. No baseline definition
has been re-planned. Promoted API lemmas give a dependency graph entirely within this algebraic subproblem
and the pinned library. Its absence of external requests is not a claim to have supplied the arithmetic
comparison maps: those are named gaps.

Counts: **14 nodes** (1 definition, 3 constructions, 8 lemmas, 2 theorems), **15 API items**, **12 unit
tests** for definitions/constructions, **3 further boundary examples**, **4 planets**, **16 baseline
declarations**, **8 gaps**, **0 requests**, **8 stages in scope and 0 closed**. All implementation statuses
are `unchecked`.

## Where to resume

Start with L3's precise comparison gap. Obtain the actual Dirac homomorphism and completed group algebra
from ProfiniteProPGroups Layer 9 and L1, and prove that the algebraic carrier coincides with the intended
pseudomeasures. Do not identify the algebraic span of Dirac differences with the completed augmentation
kernel without proving the topology/closure statement. Add a precise supplier request if the necessary
comparison has no blueprint node. Construct the continuous-character specialization that supplies the
R-algebra A; then the conditional evaluation API applies.

Next decompose the already-read Lemma 3.36 into positive-moment uniqueness, nonvanishing moments imply
regularity, and pseudomeasure moment uniqueness. The first uses the L2 Mahler/ψ input; the third needs an
infinite-order integer such as p+1, not an arbitrary a≠1 prime to p. Decompose Lemma 3.38's principal
augmentation argument and prove the denominator regular before forming its fraction. Treat ℤ₂ˣ ≅ C₂×ℤ₂
separately; its integral C₂ group ring is not a product of integral character components.

Every unprocessed L0, L0a, L1, L2, L4, L5 and L6 target is retained in coverage and gaps. Their source
decomposition has not been done in this checkpoint. Reuse AbstractMeasure and the existing partial
Mahler/Amice work, general Weierstrass preparation, and the accepted owners of Fitting ideals, perfect
complexes and locally analytic family actions. Do not reverse the RS-16 L0a/LAD:L4 dependency. Preserve
the topology gate: finite quotient kernels ((1+T)^(p^n)−1), with p-power coefficient reduction, cannot
simply be replaced by pure T-adic kernels. Completeness alone does not establish compactness.

## Source findings

Three findings against the version of record await independent verification:

- E1: Remark 3.35's whole-total-quotient extension is false. The nontrivial character on ℤ₃ with generator
  value 4 gives T↦3 and kills the regular element T−3. Formula (3-11) still defines admissible
  pseudomeasure evaluation, as the corrected nodes explain.
- E2: the last term of the independence calculation uses μ in place of λ.
- E3: Lemma 3.36(iii)'s proof allows a=−1, whose even moments vanish. Taking a=p+1 repairs the step;
  the lemma is not withdrawn.

The published PDF pages 30–32 (printed 129–131) and arXiv v2 pages 21–23 were read and collated, including
the complete Lemma 3.36/3.38 proofs. Published PDF 33, Remark 3.39 and its surrounding text, was also read
for evaluation inside the open unit disc. Published pages 31–32 were visually checked. The packet records
both version URLs and hashes. The journal landing page, arXiv version list, both authors' publication
pages and Crossref update relations were checked on 26 September 2026; no correction was found in that
bounded search. These are worker findings, not confirmed independent-review verdicts. No author contact.

## Evidence and validation

- The entire campaign README, all eight reviewed AUDIT-26 rows, accepted RS-16 decisions/owners/links
  for this roadmap and its relevant prose/topology gate, the three relevant blueprint link entries,
  ProfiniteProPGroups Layer 9 prerequisites, and the consuming DirichletPadicLFunctions:L1 and
  IntegralIwasawaTheory:I.1 contracts were read. This does not claim the entire 46 KB RS-16 prose or the
  full ProfiniteProPGroups roadmap was reread. The previously read GrothendieckEulerForms and
  JacobianChallenge upstream style documents were checked byte-identical to the current snapshot.
- Every cited baseline statement was read at Mathlib 082e2d3, with its source blob verified against the
  pinned tree; the packet records files and line ranges. Reviewed audit and source distinctions are
  preserved. The Tau Ceti pin is f790474; this suggested file imports no Tau Ceti module.
- Indexed blueprint validation: **zero errors and zero warnings**. The internal prerequisite graph is
  acyclic, and every API signature and named example is present in the suggested file.
- The actual suggested file **compiled** with Lean 4.34.0-rc2: **35 warnings, all `declaration uses
  sorry`, zero errors**. Across the suggested and verification imports, 1,415 reached Mathlib sources
  were checked identical to the pinned source tree before using cached builds. All 16 cited names
  resolved in Lean.
- Separate scratch proofs, using no `sorry` and no proposed declarations as axioms, compiled without
  warnings: the general nonextension criterion, its polynomial-evaluation consequence at every rational
  point (covering 0 and 3), the nonunit integer denominator, and the vanishing even moment at −1.
  These are checks of the failure modes, not an implementation of the blueprint or the p-adic example.
