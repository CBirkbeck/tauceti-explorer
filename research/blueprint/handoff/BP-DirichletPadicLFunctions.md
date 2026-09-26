# BP-DirichletPadicLFunctions — second checkpoint

Codex — codex-a71f92, 26 September 2026. **Status: partial; no stage closed.**
Continues Codex — codex-hjdg0j's checkpoint PR #3098 without replacing its 18 node IDs or mathematical
statements. Input main: `57a499d0005414b528aa6a4c5b865a45d26727db`.
Claim comment 5849750543 was confirmed by bot comment 5849751602. Only the four issue deliverables change.

## New work

Seven declarations add the arithmetic formal-series route from the integral F_a to its Bernoulli
coefficients, ordinary-moment formula, smoothed integrality and complex normalization. The denominator
factorization is transported through exp−1; rescaling the existing Bernoulli identity gives the
denominator comparison; the integral cleared equation gives X F_a(exp−1)=B−B_a. Coefficient k+1 gives
the factorial-normalized Bernoulli formula with B₁=−1/2, including k=0.

The four new formal-series nodes use only exact pinned/local inputs. The complex comparison is a
specialization of the already existing negative-zeta formula. The ordinary-moment node and its
integrality consequence are **not dependency-closed**: they need the exact generic comparison in the
single packet request to PadicMeasuresIwasawaAlgebras:L2. No generic moment construction is duplicated,
and no theorem takes its desired conclusion as a hypothesis. No analytic convergence of the p-adic
exponential on all ℤ_p, scalar extension of measures, Mellin continuation, unit restriction or
pseudomeasure construction is inferred.

Counts: **25 nodes** (1 definition, 2 constructions, 16 lemmas, 5 theorems, 1 comparison),
**22 API items**, **16 definition/construction tests** plus **1 comparison test** and the retained
**1 nonunit rejection example**, **5 planets**, **45 baseline declarations**, **6 gaps**, **1 request**.
All five scope IDs and their remaining targets survive. Every implementation status is unchecked.

## Exact continuation

1. Fill the PMIA:L2 request: for every integral μ, its kth ordinary moment embedded in ℚ_p equals
   k! times the kth coefficient of the coefficient-extended Amice transform after formal substitution
   exp−1. The request gives the actual carrier, maps and zero-constant substitution condition.
   Replace the stage prerequisite with the supplier's exact node once it exists. The arithmetic
   moment proof then uses the existing transform and coefficient-map nodes followed by the new
   Bernoulli coefficient theorem. Its scalar output is the image of a rational number.
2. L0 still requires RJW's actual Mellin continuation, decay and differentiation proof. The formal
   coefficient route and existing complex zeta values do not erase that accepted RS-14 requirement.
3. Resume Lemma 4.7's ψ-invariance and Proposition 4.8's unit restriction, with exact generic
   operator requests. Check the source's intermediate 1/T operator domain. Then construct
   x⁻¹ Res(μ_a), prove regularity/smoothing compatibility, and use the precise shared pseudomeasure
   nodes. Preserve the k=1 zero Euler factor, dyadic unit-group branch and qualified congruences.
4. Retain all L0/L2/L3/L4 obligations and scalar-extension/descent boundaries from the first
   checkpoint; none was silently removed by this increment.
5. Ownership reconciliation: the concurrent Coleman PR #3099 introduced the same cyclotomic
   denominator as a finite geometric sum while #3098 introduced q_a here. This L1 is the upstream
   owner. Coleman:L2 must import q_a and keep the finite-sum equality as a comparison/API,
   not introduce a second carrier. Do not add a reverse L1→Coleman:L2 prerequisite. This job
   does not edit Coleman deliverables; a separate correction to that worker's own PR is required.

## Fresh evidence and checks

Read the inherited packet, reader, suggested file and handoff; refreshed the reviewed five-layer audit,
campaign scope and all 30 atlas stage edges, accepted RS-14 ownership, and the two relevant
blueprint-link screens. The binding protocol files match the versions read in this continuing session.
Upstream ClassFieldTheory and LocalFieldsRamification documents were read in full earlier in this
session; the first worker's different upstream reading remains attributed in the historical record.

Fresh primary-source reading: published §3.4 final paragraphs and §3.5.1 including Lemma 3.29 and
Corollary 3.30 (printed pp.125–126 / PDF26–27), and §4.1 through Proposition 4.6 (printed pp.136–137 /
PDF37–38). The same published and arXiv-v2 PDFs and hashes are retained. The arXiv version list was
refreshed and lists v2, 19 December 2024. The five inherited source findings, their version collation
and bounded erratum searches are preserved; no fresh exhaustive source reading or independent review
is claimed. No new source error was added.

- Indexed blueprint validator: **0 errors, 0 warnings**.
- Actual suggested file compiled with Lean 4.34.0-rc2: **42 warnings, all declaration uses sorry,
  zero errors**. There are 18 suggested examples.
- **8,482 Mathlib source dependencies** were byte-checked against the pin before using the compiled
  cache. No Tau Ceti module was imported.
- Separate #check file resolves **all 45 baseline names**; the exact requested generic-moment
  signature also elaborates (its one placeholder warning is not a proof).
- Independent finite rational arithmetic: **269 exact series checks**, **665 smoothed p-integrality
  checks**, and **2 denominator obstructions**. Parameters a=1,…,12, moment degrees 0,…,18,
  primes 2,3,5,7. The a=2 degree-two moment and degree-three factorial distinguish Mahler,
  exponential and ordinary coefficients. These computations are tests, not a proof for all parameters.
- API/test/reader concordance and preservation of all 18 original mathematical node records checked;
  internal dependencies are acyclic. Official four-file intake check is recorded in the PR.
- The first worker's standalone proof experiments below are retained as historical evidence, not
  presented as experiments rerun by this worker.

## First checkpoint record (historical)

The following is the original handoff by Codex — codex-hjdg0j; its counts and statements of remaining
work describe PR #3098, before the second-checkpoint increment above.

### BP-DirichletPadicLFunctions — first checkpoint

Codex — codex-hjdg0j, 26 September 2026. **Status: partial.** No prior packet, document, suggested file,
handoff or integrated decomposition was present. All five issue stages L0–L4 are retained; none is closed.
The accepted RS-14 scopes and ownership remain binding. The packet does not redefine shared Bernoulli,
character, Amice, pseudomeasure or modular-form carriers.

## What is done

L1 has a complete declaration-level plan for the integral smoothing subproblem and its concrete measure:

- The auxiliary q_a has coefficient choose(a,n+1), constant coefficient a and Tq_a=(1+T)^a−1.
- If a is a unit in the coefficient ring, construct F_a=b_a/q_a integrally, where b_a has coefficient
  choose(a,n+2). Prove cancellation, uniqueness, the constant coefficient and finite coefficient
  recurrence, functoriality under coefficient maps and comparison with the rational expression only
  in a receiving field where T has nonzero image. No inverse of T is used in the integral construction.
- For p∤a, construct the specific ℤ_p-valued measure μ_a using the already existing Mathlib Amice
  inverse. Its transform, Mahler coefficients and uniqueness are specified. This works at p=2 for odd a.

Counts: **18 nodes** (1 definition, 2 constructions, 13 lemmas, 2 theorems), **16 API items**, **9
definition/construction tests**, **1 further nonunit rejection example**, **3 planets**, **31 baseline
declarations**, **5 gaps**, **0 requests**, **5 stages in scope and 0 closed**. Every implementation
status remains `unchecked`. No implementation or source-complete layer claim is made.

## Where to resume

1. Prove Proposition 4.6's ordinary polynomial moments. Obtain the actual smoothed Mellin computation
   from L0 and the Amice differential-operator comparison from PadicMeasuresIwasawaAlgebras:L2. The
   current Mahler-coefficient theorem is not that moment formula.
2. Decompose Lemma 4.7's ψ-invariance and Proposition 4.8's unit restriction. Require the exact generic
   operator contracts. The source proof applies operators to 1/T; establish the domain/extension used
   there before treating those operations as integral-series maps.
3. Construct x⁻¹ Res(μ_a), establish arithmetic regularity and smoothing compatibility, and apply the
   precise available PadicMeasuresIwasawaAlgebras:L3 nodes. Its newly merged algebraic evaluation
   packet supplies conditional pseudomeasure machinery, not the completed-group-ring comparison or
   the arithmetic hypotheses. Add explicit supplier requests only for the exact missing inputs used
   by the new consuming nodes. Do not reconstruct generic localization or evaluation here.
4. Prove interpolation for every k≥1, independence of a, odd-prime parity/descent, and qualified Kummer
   congruences. At k=1 the Euler factor vanishes while ζ(0)=−1/2. Keep the dyadic unit group separate:
   integrality of the present F_a and μ_a does not construct a pseudomeasure on ℤ₂ˣ or split ℤ₂[C₂].
5. Preserve every remaining L0/L2/L3/L4 target listed in coverage and the verbatim RS-14 keeps recorded
   in the gaps. L0 requires actual Mellin and algebraicity/residue comparisons; L2 requires all tame
   and p-power characters; L3 requires the logarithm/value/pole and coordinate comparisons; L4 requires
   actual stabilized modular forms and their measure-valued expansion. General geometric family
   realization remains PadicFamilies' work. Series coefficient change is not yet a measure scalar-
   extension or descent theorem.

There are no requests because every input used by the current eighteen declarations exists in the pinned
library. The missing comparison nodes have not been manufactured with raw stage edges or proposition
placeholders. A continuation must add the precise requests when it adds those consuming nodes.

## Source findings awaiting independent review

- E1: the final geometric expansion in Proposition 4.4 has a missing minus sign. The a=2 constant term
  +1/2 detects it. Integrality remains true.
- E2: §4.1's recalled derivative for ζ(−k) has the wrong derivative order and factor; the Bernoulli
  expression in that same sentence is correct.
- E3: §4.1's decay assertion needs a positive integer, not an arbitrary integer prime to p; a=−1
  gives the constant function −1. The related §10.2 polynomial aside also needs positivity:
  ((1+T)^−1−1)/T=−1/(1+T) is not a polynomial. The arithmetic plan uses a>1.
- E4: Proposition 4.11's parity argument omits k=1. Its zero Euler factor repairs the proof.
- E5: Corollary 2.8's displayed negative-zeta formula fails at n=0 with the paper's B₁=−1/2 convention.
  The corrected all-n formula already exists in the pinned Mathlib and is not a new node.

Published PDF 37–40 (printed 136–139) was read in full, including all §4 proofs, and collated with arXiv
v2 PDF 26–28. Published PDF 12–13 (printed 111–112) was read to check the Bernoulli convention and
Corollary 2.8; v2 PDF 9 was collated for that corollary. Published PDF 66 (printed 165) was read for the
Coleman consumer, including Lemma 10.3, Proposition 10.4 and Lemma 10.5; no v2 collation of that additional
page is claimed. Published pages 112, 136, 137 and 139 were visually checked. Exact version hashes and
bounded erratum searches are in sourceVersions/sourceIssues. The journal page, arXiv list, author pages,
Crossref and targeted searches yielded no correction in this session. The campaign already flags the
ζ(0)/k=1 boundaries; recording their published locators is not a claim of first discovery. No author contact.

## Inputs and checks

Read all five reviewed AUDIT-24 rows, the entire campaign README, all scoped atlas descriptions and
thirty stage edges, accepted RS-14's own-layer decisions and all relevant owners/links, its complete
prose, and the two blueprint-link entries mentioning this roadmap's stages. The reviewed JSON supersedes
the prose's stale AnalyticNumberTheory:AN.1 references. Read the complete ArithmeticDirichletSeries and
AnalyticToricGeometry upstream documents for style and the exact ColemanPowerSeries:L2 consumer contract.
The binding worker/protocol files were unchanged from this session's previous read. No AGENTS.md found.

Every cited pinned statement was read in its source file and its blob checked against the pinned tree.
Searches of both pinned libraries confirmed the arithmetic smoothing target was not supplied under the
searched names, while the exact general Amice inverse and power-series operations were found and reused.
The suggested file imports no Tau Ceti module.

- Indexed blueprint check: **0 errors, 0 warnings**; all **31 baseline names** resolve in Lean.
- The actual suggested file **compiled** with Lean 4.34.0-rc2: **27 warnings, all `declaration uses
  sorry`, zero errors**. The proposed signatures and all sixteen API items/nine named tests agree with
  the packet. Its ten examples include the separate nonunit rejection statement.
- **2,049** Mathlib source files were reached by the suggested imports. The union with the scratch
  verification imports reaches **8,482** files; all were checked identical to the pinned sources before
  using the build cache. No Tau Ceti module was needed.
- Separate scratch proofs, without `sorry` or proposed declarations as axioms, compiled with no
  warnings: the denominator constant coefficient, generic integral cancellation, the cleared equation,
  the generic F_a constant coefficient, its a=2 rational sign and a=3 dyadic specialization, the
  nonunit parameter 2 in ℤ₂, and ζ(0)≠+1/2. These checks do not implement the rest of the blueprint.
- The internal prerequisite graph is acyclic. Only the issue's four deliverables are submitted.
