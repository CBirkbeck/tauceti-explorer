# BP-SieveMethodsAndPrimePatterns — finite sieve checkpoint

Refs #1036. Author: Codex; session codex-a71f92. Claim comment 5852081973 was confirmed by bot comment 5852082785 before work. The whole issue was reread after confirmation. Snapshot base: 63091de06f3ecc0458e3a3d3f8c6b35f7ec8d9a8.

## Delivered

Eight declaration-sized SV.0 results on the existing BoundingSieve carrier: weighted divisor interchange, exact Legendre identity, Euler-product main term with signed remainder, absolute Legendre error, a relative lower coefficient inequality, its main-minus-error estimate, a coefficient-cutoff remainder bound, and the first Bonferroni lower bound. Four lemma nodes, four theorem nodes, three planets, 25 verified baseline declarations. No new definitions or constructions; their API/test requirements therefore do not apply. Ten discriminating theorem examples appear in the suggested file.

All six stages remain in scope. SV.0 and SV.1 are partial; SV.2–SV.5 are not_read. Seven explicit gaps and no open cross-roadmap requests: the finite nodes need only the baseline, while analytic routes do not yet have specified consuming nodes. All implementation statuses remain unchecked. This is a partial checkpoint, not a claim to complete the roadmap.

No earlier four deliverables or integrated decomposition existed at the snapshot. No existing node IDs are replaced.

## Sources and ownership

Read the reviewed six-stage audit before planning, the full accepted AUDIT-07 review, the campaign document and atlas extract, and the accepted RS-07 family decision/report/review. The two upstream style documents were EffectiveBounds and ArithmeticDirichletSeries. All matching link-map entries and exact current consumer mentions in ArithmeticStatistics and FiniteFieldsAndCharacterSums were inspected. AN.0's current packet was read in this session and byte-compared; AN.8 was absent. The routed Bennett–Siksek extraction item 45 was read, but its paper proof was not, so SV.2 retains that source gap.

Read all 405 lines of pinned Mathlib SelbergSieve and the cited arithmetic-function, divisor and prime-factor statements. The existing upper sieve bounds, lambdaSquared construction and Selberg diagonalization are imported, not planned anew. The lower condition is an explicit finite hypothesis, not a new one-line predicate. RS-07's SV.2-to-AN.3 ownership direction is retained.

Kedlaya's live Chapter 11 was read completely, including proofs and exercises. Heath-Brown arXiv math/0209360v1 was read through p.8, the statement of Lemma 2.1, not its proof or the remaining pages. Rendered pp.1–4 were inspected for source findings. Exact URLs, acquisition dates and SHA-256 values are in the packet.

Eight source findings are recorded, without independent-review verdicts. Six concern the Heath-Brown preprint's ranges, endpoints, multiplicity, primitive representations and asymptotic regime. Two concern the live Kedlaya proof's missing cutoff verification and insufficient displayed dimension estimate. The latter do not assert Brun's theorem is false. The Bonner 2003 publication was identified in primary bibliographies but its body was not acquired; no finding is attributed to its uninspected text. The historical Kedlaya edition was not equated with the live HTML.

## Validation

- Suggested file: Lean 4.34.0-rc2, eight signatures plus ten examples, exactly 18 required proof-placeholder warnings and no others. All 1,394 transitive Mathlib source files matched the pin.
- Scratch proof checks: all eight proposed statements, a Möbius-divisor specialization and five examples proved with no placeholders or warnings; 8,482 tactic-environment Mathlib sources matched the pin. These proof probes are not submitted and do not change implementation status.
- Exact rational tests: 1,280 cases each for divisor interchange, Legendre identity, Euler main/remainder and error, lower coefficient/main-error estimates, and first Bonferroni; 9,200 cutoff cases.
- Source-example regressions: 1,542 strict-cutoff prime-count cases plus explicit Goldbach image/index, complementary-factor cutoff, primitive-square, residue-cutoff and normalization-error witnesses.
- Official blueprint checker with the pinned declaration index: zero errors and warnings.
- Source-issue/version checker on a scratch-only errata-v1 envelope: zero errors.
- Four-deliverable intake path and JSON checks; no private paths or source/proof artifacts in the submission.

## Resume

Start with the SV.0 general-residue bridge. Preserve the existing carrier, distinguish arbitrary bad residue classes from divisibility of values, and preserve multiplicities in any polynomial-value pushforward. Explicitly treat zero local densities rather than assuming the carrier allows them.

Then decompose Chapter 11's dimension, Rankin, divisor-tail and quantitative sieve estimates, checking all uniform constants and the hypotheses identified by E7–E8. A coefficient-support parameter is not a distribution theorem. Resolve required AN.0 inputs at their exact statements and add requests only for actual consumers.

SV.1 needs the remaining Selberg proof, optimizer and estimates beyond baseline diagonalization, and the Brun/fundamental-lemma route. SV.2 needs the original Bennett–Siksek proof, large-sieve/duality/Vaughan sources and the exact quadratic-symbol and polynomial Farey consumer statements. SV.3 needs the full Bombieri–Vinogradov quantifiers and AN.3 analytic suppliers. SV.4 requires Maynard's original proof, and SV.5 requires separate original beta/Chen/affine-sieve sources and their distinct hypotheses. The packet's coverage and gaps are the detailed checklist.

