# Handoff — BP-ArithmeticDynamics--DY.2

Completed planning pass, 14 October 2026. Issue #9316; agent Codex (GPT-6),
session `codex-rwzYQG`, branch `codex-rwzYQG/arithmetic-dynamics-dy2`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9316#issuecomment-6162171032)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/9316#issuecomment-6162172839).
This submission finishes the target-level blueprint pass and goes to independent
review. It makes no implementation or independent-review claim.

## Deliverables and coverage

- [Packet](../packets/ArithmeticDynamics--DY.2.json): `status: complete`,
  `part: DY.2`, scope exactly `ArithmeticDynamics:DY.2`.
- [Reader](../readmes/ArithmeticDynamics--DY.2.md): exact target statements,
  hypotheses, proof routes, source locators, ownership, API and tests.
- [Suggested Lean](../suggested/ArithmeticDynamics--DY.2.lean): compact
  signatures over native carriers, light definitions with real bodies, named
  omissions for statements requiring unavailable interfaces.

**28 nodes:** 3 definitions, 21 theorems, 3 comparisons and 1 application.
**20 API items, 12 packet tests, 6 planets, 14 baseline declarations,
5 gaps, 7 requests and 5 restructuring proposals.** All node implementation
statuses are `unchecked`.

| Stage | Status | Remaining |
| --- | --- | --- |
| ArithmeticDynamics:DY.2 | planned | Close the five named supplier gaps and receive the analytic-line, sphere and finite-degree interfaces; then integrate the parent dependency refinements below. |

No stage is closed. Every remaining target has a node and every missing generic
input has a supplier request or precise gap. The accepted parent’s 55 DY.2
nodes remain their owners; this submission does not edit or replace them.

## What this pass establishes at planning level

Classical Fatou/Julia uses uniform equicontinuity on an open neighborhood with
the chordal uniformity. Berkovich Fatou/Julia uses infinite omitted complement
on the native analytic line with its weak topology. Neither `OnePoint K` nor
the strong tree metric substitutes for that carrier. The predicates have four
tests each; the same good-reduction map has empty classical Julia set and a
type-II Gauss Julia singleton.

The arbitrary-characteristic support route is preimage equidistribution,
support containment, blowing up and minimality, then support equality. It
counts inseparable local degrees. Pure Frobenius has infinite classical
exceptional set and is handled by the direct Gauss argument. Radon regularity,
native measure support and the parent’s no-type-I-atom statement replace any
countability or metrizability assumption on the analytic line.

The complex route supplies the Lyubich transfer limit, identifies it with the
parent measure by balance and dominated convergence, and proves Julia support.
The transfer operator is first restricted to a compact backward-invariant set
disjoint from the exceptional set. Uniform conditional inverse-fibre weights
give the measure-entropy lower bound; the native topological upper bound gives
equality. The uniqueness target quantifies over all invariant probabilities,
using the positive-set entropy argument, rather than only balanced measures.

Zieve’s public author thesis resolves the parent’s source-access obstacle.
Weighted coefficient divisibility, sharp jet growth and integral polynomial
realization of a rational cycle expose its proof route. The reader supplies
the short two-jet argument for residue characteristic two. The odd-prime
nilpotent preparation input remains a precise algebra gap.

## Exact gaps and routing

1. **Sphere Riesz measures and normalized distributional Laplacian.** On the
   native complex sphere, define the measure Laplacian on differences of
   subharmonic potentials; supply positivity, mass zero, Poincaré–Lelong,
   potential-limit continuity, local-degree pullback, harmonic uniqueness and
   continuous-potential atomlessness. Preserve Δlog⁺|z|=ω−δ∞. Current PDE lane C
   does not supply this distributional measure theory. Proposed owner: PDE,
   Part II, complex potential theory.
2. **Spherical meromorphic Montel.** Three omitted sphere values imply normality
   in the compact-open spherical topology, allowing the constant-infinity
   limit. Current bounded holomorphic normal-family theory is insufficient.
   Extend ConformalMappingPartII:V0, with the exact normality/equicontinuity
   comparison.
3. **Almost-periodic Banach contraction splitting.** Relatively compact orbits
   split into peripheral eigenspaces and iterates tending to zero. Lyubich’s
   compact-group/Haar/character proof is not the current Hilbert self-adjoint
   OperatorTheory contract. Proposed owner: OperatorTheory, Part II.
4. **Generic measure entropy.** Finite partitions, Kolmogorov–Sinai entropy,
   conditional inverse-fibre lower bound, measure/topological inequality,
   Shannon–McMillan–Breiman positive-set Bowen bound and ergodic entropy
   decomposition. Keep PM.4’s existing Birkhoff owner; propose Probabilistic
   and metric number theory, Part II for the missing entropy machinery.
5. **Nilpotent quadratic preparation.** Zieve Lemma 41, pp.29–30, needs a monic
   quadratic factor of the generic displacement polynomial over
   F_p[u,b_1,…,b_D,b_2⁻¹]/(b_1^(p−1)), with b_0=u b_1², prescribed coefficient
   ideals, an injective extension and a root in (b_1). The valued-field
   Weierstrass theorem does not supply this nilpotent-ring statement. A finite
   ideal-lifting proof must be planned by a suitable commutative-algebra owner;
   no nonexistent stage id is claimed.

The packet gives each exact contract and its consuming node ids. Independent
review should check these leaves as carefully as the dynamical targets.

Seven requests are recorded, rather than sent to other workers:

- **TB.0:** native compact Hausdorff analytic line, type-I/Gauss points and
  finite open rational-map analytification with inseparable multiplicities.
- **TB.1:** image discs, separating type-II points, annulus stretching and
  finite-grand-orbit geometry; local-degree Radon pullback, support formula,
  BDV Laplacian, singular-potential Hartogs and weak convergence. This extends
  the parent request; it does not duplicate the carrier or potential theory.
- **FuchsianOrbifolds Layer 5:** the current compact-surface finite holomorphic
  degree, multiplicity and inverse-branch interface.
- **BelyiMaps Layer 8 retained §8.1:** native sphere charts and meromorphic
  comparison. Current ownership is BelyiAnalyticCovers, absent from the atlas
  snapshot. Route to that successor when its stage id is published; the old
  commented Suggested chart instances are not built declarations.
- **ConformalMappingPartII:V0:** the Montel extension above.
- **PDE lane C:** route the sphere-potential extension to PDE, Part II.
- **PM.4:** import current ergodic APIs and route missing generic entropy to
  its Part II.

The five restructuring entries preserve existing stage ids, separate
arithmetic dynamics from its generic suppliers, and propose the extensions
above. No roadmap or stage is created or changed by this job.

## Parent refinement map and where to resume

After independent review and supplier planning, an authorized integration or
follow-up edits the parent, keeping its declaration ids:

| Parent node, prefixed ArithmeticDynamics: | Dependency refinement |
| --- | --- |
| DY.2/archimedean-canonical-measure | Import the sphere Riesz/Laplacian contract, with its correct domain and normalization. |
| DY.2/archimedean-canonical-measure-properties | Use that same supplier for positivity, probability, balance and atomlessness, with the native sphere and finite-degree interfaces. |
| DY.2/archimedean-canonical-measure-is-maximal-entropy-measure | Import this part’s archimedean-measure-identification, complex-canonical-measure-entropy and complex-maximal-entropy-uniqueness. |
| DY.2/zieve-period-exponent-bound | Cite Zieve Theorem 50, p.38, through zieve-rational-cycle-adapter → zieve-jet-growth → zieve-weighted-coefficient-divisibility; retain the preparation gap. |

Do not make the parent measure construction depend on the comparison that
already consumes it. Topological entropy consumes the generic conditional
lower bound, not the full measure-entropy endpoint that consumes topological
entropy. These dependency directions keep the graph acyclic.

The previous broad maximal-entropy gap is replaced by the explicit Montel,
Banach and entropy contracts. Zieve access is resolved, while its algebra
preparation is open. The other parent stages and gaps are outside this job.

## Validation and suggested-file boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamics--DY.2.json`:
  **0 errors, 0 warnings**, 1 planned stage, 0 closed stages.
- `lean-check research/blueprint/suggested/ArithmeticDynamics--DY.2.lean`:
  **exit 0**, **29 declaration-uses-sorry warnings**, no other diagnostics, at
  pinned Mathlib `082e2d3`. Available memory exceeded 20 GB before compilation.
  No build, update, cache download, language server or read-only environment
  mutation was performed.
- Packet/reader/Lean inventory agrees: every node id is represented in the
  reader and declaration or omission inventory; every API and test name is
  represented in both. All 3 definitions have 4 discriminating packet tests.
- The Lean file has **7 light real-bodied definitions, 18 API signatures and
  11 examples**. Its two unavailable compatibility APIs and two unavailable
  tests are named reader targets. The power-map test has both affine and sphere
  examples. Rational-map specialization and the other 25 heavy endpoints are
  explicitly inventoried as reader targets. No assumed-conclusion carrier or
  data definition with a missing body is introduced.
- Submission file checks and whitespace checks pass; only the four authorized
  deliverables are submitted. Source-issue records and version metadata pass
  their validators. No source passage, PDF, image, extracted text, scratch log
  or private absolute path is included.

## Sources and current-main audit

All six sources are freely public, with URLs, editions, SHA-256 hashes and
read locations in the packet. No cleared private source was needed and no
source is missing for this pass. The relevant proofs were read on
14 October 2026; the repository states their results in new words.

- **Benedetto, AWS notes dated 9 March 2010:** Theorem 1.11, pp.6–7;
  §§4.4–4.5, pp.36–43; §6.4, pp.62–69.
- **DeMarco–Krieger–Ye, arXiv v2:** §2.4, p.9, local canonical measures and
  Julia support.
- **Favre–Rivera-Letelier, arXiv:0709.0092v3:** Theorem A, pp.2–4;
  §§2.2–2.4, pp.12–19; §§3.1–3.2, pp.20–25, including all characteristic cases
  in the convergence proof.
- **Lyubich, publisher PDF, ETDS 3 (1983):** §2, pp.352–354; §§3–4,
  pp.354–364; §5, pp.366–367; §6, pp.375–376; §7, pp.379–384.
- **Baker–Rumely, arXiv:math/0407426v2:** Theorem 2.1, p.4, and
  Proposition 3.36, p.18.
- **Zieve, 1996 Berkeley thesis, University of Michigan author copy:**
  §2.1, pp.5–9; §2.3, pp.21–31; §§2.4–2.5, pp.32–38. Its custom text encoding
  required reading rendered pages. No rendered page or passage is submitted.

Two source findings concern only Benedetto’s standalone 2010 lecture notes:
**E801**, the wrong ambient carrier in Proposition 6.15(a), p.63; **E802**, the
reversed filled-Julia boundary relation in Proposition 6.24(f), p.69. They do
not accuse the 2019 book. The AWS archive, author homepage and author’s book
errata dated 31 August 2026 were checked; no correction of these note locators
was located. The second finding does not introduce a filled-Julia target.

The current read-only TauCetiRoadmap main was audited at
`0d144d044dacebca17b654695b6f1ad58f159b27`. Full ConformalMapping and
FuchsianOrbifolds documents supplied neighboring style and ownership models;
the BelyiMaps sphere contract, OperatorTheory family scope and current Tau Ceti
library were checked for the needed interfaces. Their existing or planned
mathematics is imported. No higher-tier notion was moved and no existing
roadmap was re-planned. The required baseline remains Mathlib `082e2d3` and
Tau Ceti `f790474`; implementation remains unchecked.
