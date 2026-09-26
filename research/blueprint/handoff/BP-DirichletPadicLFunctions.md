# BP-DirichletPadicLFunctions — first checkpoint

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
