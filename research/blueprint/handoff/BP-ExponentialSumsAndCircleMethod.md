# BP-ExponentialSumsAndCircleMethod — bounded-modulus continuation

Agent: Codex — `codex-a71f92`. 27 September 2026. Refs #1040.
Claim 5853565566 was confirmed by bot 5853567087 at 06:55:23 UTC.
Whole issue read before and after confirmation.
Working snapshot: edcb85158937f27d14742663d16b82ceab330ddd.
The preceding ArithmeticDynamics PR #3199 merged at 06:56:57 UTC.

Status remains partial. All twenty-one inherited nodes are preserved exactly;
all six stages remain partial and every node remains unchecked.

## What changed

Five new ES.0 nodes, in dependency order:

1. `smooth-divisor-window`: extract a divisor in [T,T²] under the prime-factor
   bound, without assuming squarefreeness.
2. `squarefree-modulus-blocks`: repeatedly extract pairwise-coprime full blocks,
   with a positive residual below T and exact product identity.
3. `bounded-crt-modulus-blocks`: pack an odd squarefree part Q and a squarefree
   exclusion R, absorb the bounded factor a ≤ 8 into Q's residual, delete unit
   factors, and retain a distinguished odd squarefree q in [T,T²]. At most two
   small blocks survive, including when R = 1.
4. `bounded-factor-count`: the two exceptions and product bound k^(2c) give
   r ≤ (64/7)c + 2 < 10c + 2.
5. `graham-ringrose-interval-threshold`: the modulus cap gives
   R₀ ≤ k^(63/64) < k/2 for the explicit strict threshold k > 2⁶⁴.

The new central planet is Bounded CRT modulus blocks, making six ES.0 planets.
Fifteen additional baseline statements are cited. No new definition or
construction carrier, API inventory, character structure or supplier request
is introduced. The existing List, Squarefree and coprimality notions suffice.

Current totals: 26 nodes, comprising 16 lemmas and 10 theorems; zero
definition/construction API items or tests; 48 suggested contract examples;
six planets; 65 baseline declarations; eight gaps; zero requests.
Sources, source-version objects, all three reviewed source findings, all
twenty-one prior nodes and every ES.1–ES.5 coverage entry are unchanged.

## Source and ownership boundary

Freshly reread the complete selected Bennett–Siksek published §8.1 argument,
printed pp.376–379, and inspect a rendering of p.378 for the factor count,
R₀, nested exponents and c₃. The PDF matches the existing published SHA-256.
The earlier extraction and accepted reviews are reused only after input
comparison. In particular the reviewed E11 allows an empty principal family;
do not reintroduce the rejected missing-case allegation or enlarge the
source's r−2 bound unnecessarily.

The five additions expose arithmetic steps of Case 1; the source does not
name all these as separate lemmas. The two-residual packing theorem is about
integer moduli. It does NOT supply CRT maps on characters, a theorem about
quadratic conductors, or the external Graham–Ringrose estimate. The complete
proof of that estimate has not been read. Existing Iwaniec–Kowalski PDF leads
were previously only front matter; their presence is not proof coverage.

Read all six reviewed audit rows before planning. Binding instructions and
the 28 related links are unchanged. The 61-path comparison found 57 identical
inputs, three known absences and only the Sieve supplier changed; that blob
equals this session's fully read/written merged PR #3193. Thus the preceding
complete RS-03/RS-07, campaign/atlas, extraction/review, source and upstream
style readings still apply. Search both pinned libraries and packet ownership
for divisor windows and prime-block packing; no exact supplier was found.
Generic smooth-number and character constructors are reused, not replanned.
All fifteen new baseline statements were read with their ambient hypotheses.

## Checks

- Pinned-index packet checker: zero errors and zero warnings.
- Complete suggested Lean file: 74 expected placeholder warnings, no other
  diagnostics, Lean 4.34.0-rc2. All 8,482 reached Mathlib source files match
  the pin; no Tau Ceti imports.
- Scratch: five fully proved general statements and twelve examples, with
  zero placeholders, errors or warnings. These prove divisor extraction,
  squarefree packing, factor count, interval threshold and the residual cap.
  The combined two-family packing has a complete mathematical proof outline,
  a checked interface and exact regressions; a complete Lean proof of that
  assembly is not claimed.
- Exact regressions: 2,763 divisor windows, 952 squarefree packings and 43,912
  two-family packings, including 2,960 empty principal families and 11,691
  decompositions with exactly two small blocks. Five boundary checks reject
  missing smoothness, missing squarefreeness, only one permitted residual,
  a non-strict interval threshold, and three exceptional factors.
- Source-issue envelope: zero errors. Source findings and versions compare
  equal to the inherited packet.
- Four-file intake: zero problems. Immutable-snapshot preservation: all 21
  inherited nodes unchanged; all 21 prior signatures and 36 examples preserved
  verbatim. Fresh-main guard: 69 consulted paths, 66 present and three known
  absences, no changed inputs or new matching links. Only the four
  named deliverables belong in the PR; no proof probes, PDFs, scripts, build
  artifacts or private paths are included.

Finite regressions do not establish general theorems; the blueprint remains
planning work, not an implementation claim.

## Resume here

1. Preserve the arithmetic packing and its two-residual count. Match the
   reusable quadratic-conductor classification: primitive conductor aQ with
   a ≤ 8, odd squarefree Q, and the source lower bound implying Q ≥ k^(7/32).
   Do not duplicate another owner's classification.
2. Build the character CRT restriction/reconstruction adapters on the selected
   pairwise-coprime moduli. Prove the distinguished factor primitive and the
   product identity at every integer, including the exclusion mask. R = 1
   yields an empty principal family, not a missing case.
3. Read and decompose a legally accessible complete Graham–Ringrose proof,
   checking the exact hypotheses of the displayed estimate. Its statement
   in Bennett–Siksek is insufficient source coverage.
4. Import the existing AN.5 divisor estimate and derive a uniform threshold
   for τ(q)^(r²) < q^(1/2) using the bounded r. Absorb constants uniformly in c;
   the printed universal divisor inequality remains false.
5. Combine the analytic estimate, these size bounds and the preserved
   small-conductor theorem to prove the actual Proposition 8.2 endpoint.
   Preserve real interval lengths and the existing floor conventions.
6. Continue the unrelated ES.0–ES.5 source targets recorded in the packet.
   No stage has been closed and no independent review is requested.

## Historical primitive-product checkpoint

# BP-ExponentialSumsAndCircleMethod — primitive-product continuation

Agent: Codex — codex-a71f92. Date: 27 September 2026. Refs #1040.

Status: partial. All thirteen inherited node objects are preserved exactly. Eight additional adapters decompose the primitive product and its excluded-prime mask and apply the existing small-conductor threshold to the original quadratic product. All twenty-one nodes are unchecked; all six ES stages remain partial.

## Read and ownership checks

The full issue was read before claim 5852886177, bot confirmation 5852887062 at 05:12:55 UTC, and reread after confirmation. Working snapshot: 9259a46d027f801a362476a366170bdee9033db9. Binding protocols were unchanged. All six reviewed AUDIT-07 rows were read before planning. RS-03/RS-07 ownership, the complete campaign, atlas, accepted extraction and both full paper/errata reviews were checked. All 28 ES-related link records remain unchanged from the preceding read checkpoint.

The 61-path input comparison found 57 unchanged paths, three known absences and only the Sieve supplier changed; that blob exactly matched this session's fully read and written merged PR #3168. The AN.5 divisor supplier's exact nodes remain the dependencies, not a new ES proof. General finite-field character bounds remain FF.2; quadratic conductor classification and the bound by eight times the odd part are not replanned here.

Freshly read the complete selected Bennett–Siksek §8.1 proof on printed pp.376–379 and checked page 377 as an image. The published PDF hash is unchanged. This is not a fresh reading of the entire paper or the externally quoted Graham–Ringrose proof. Read pinned DirichletCharacter/Basic through the full general conductor/product section and the complete Tau Ceti character file, quadratic-character predicates, prime-factor products and the needed coprimality statements. Searches of both libraries and existing packets were negative for the exact new adapters.

## Mathematical changes

Write M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), η=χ1.primitive_mul χ2, and R the product of primes of M absent from q. These are existing constructions and local expressions, not new carriers.

1. Ambient product evaluation agrees with χ1(a)χ2(a) for all integers, including nonunits and negative arguments.
2. The primitive conductor and excluded-prime product are coprime.
3. qR divides M. Equality is not asserted: χ8χ−8=χ−4 gives M=8, q=4, R=1.
4. The exact primitive mask is σ(a)=η(a) on arguments coprime to R and zero otherwise. This includes principal characters and conductor 1.
5. With primitive inputs, R divides gcd(N1,N2). The proof uses reverse conductor bounds from A=(AB)B⁻¹ and B=(AB)A⁻¹, not an unsupported cancellation assertion. Quadraticity is unnecessary here.
6. Primitive reduction preserves quadraticity, via the existing square-to-principal criterion and injective change level.
7. Distinct primitive quadratic characters have nonprincipal primitive product. Distinctness means different values on some integer, not different moduli.
8. One threshold depending only on c bounds the original product sum by the square root of k in the small-conductor regime q≤8k^(7/32), Ni≤k^c. R≤min(N1,N2) keeps the exponent c; no prime-smoothness hypothesis is needed for this branch.

Item 94 is now decomposed. Item 97's existing thirteen-node chain is applied to the original product. Item 93's primitive construction was already baseline. Items 92, 95 and full Proposition 8.2/item 44 remain open. Existing reviewed source findings and source-version objects are preserved exactly; no new source defect is asserted.

## Deliverables and verification

Only the authorized packet, reader, suggested Lean and this handoff are submitted.

- Twenty-one nodes: thirteen lemmas and eight theorems; twenty-one interfaces and thirty-six distinct contract examples.
- Five ES.0 planets, fifty exact pinned declarations, eight gaps, no supplier requests, six partial stages.
- No new definition/construction. The checker counters for such APIs/tests are therefore zero.
- Suggested Lean elaborates at the pins with exactly 57 expected unproved-declaration warnings and no errors or other warnings; 8,482 reached Mathlib source files byte-checked, no Tau Ceti imports.
- Seventeen complete scratch Lean checks: five general conductor lemmas and all twelve new contract examples, with no unproved declarations, warnings or errors. The five general proofs cover coprimality, reduced-period divisibility, common cancelled-prime support, quadraticity and nonprincipality. The all-integer mask remains a blueprint obligation, not a claimed implementation.
- New exact regressions: 188 quadratic character tables; 729 ordered primitive pairs including 702 distinct nonprincipal pairs; 470,087 signed masked evaluations; 4,212 interval bounds. Conductor computed independently by factorization through unit reduction. Nonquadratic conjugate order-three characters supply a negative test.
- Inherited regressions rerun: 33,966 periodic intervals, 3,900 divisible reindexings, 5,200 Möbius identities, 43,560 excluded-character intervals and 129 2-adic product checks.
- Pinned-index checker: 0 errors and 0 warnings. Source-issue envelope: 0 errors. Four-file intake: 4 files and 0 problems.
- Fresh-main guard: 69 consulted paths, 66 present and three known absences; no consulted input or matching-link changes between the working snapshot and publication base caccea9110cda7d3df23faec83c6d7dbf53c3658. All thirteen inherited nodes and source-finding/version objects compare equal; precisely the four authorized tracked files changed. The winning claim was reconfirmed.

No source PDF, extracted text, private machine path, scratch proof, script or build artifact is submitted. Finite regressions are not general proofs.

## Resume here

1. Preserve all twenty-one node objects and the primitive/nonprincipal/mask boundaries. Recheck current main and reviewed ownership.
2. Read the complete Graham–Ringrose proof before decomposing item 92. The source's quotation is insufficient.
3. Decompose CRT prime-block packing, item 95, with exact first-block and interval-length constraints. Preserve the accepted E11 correction: the principal-factor family may be empty when R=1. Do not invent a missing-case source defect.
4. Assemble full Proposition 8.2 only after the large-conductor branch, smoothness bounds, thresholds and constant dependencies are supplied. The new theorem completes only its small-conductor product application.
5. Continue full-proof source decompositions for the other ES.0–ES.5 targets, including differencing/completion, torus counting, arc geometry, decoupling, local densities, prime-weighted endpoints and determinant-method uniformity.

This checkpoint does not close any stage and is not ready for a closed-packet verdict.
