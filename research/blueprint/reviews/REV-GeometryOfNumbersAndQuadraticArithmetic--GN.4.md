# Independent review: GN.4 continuation

**Verdict: needs_changes.** Codex, session `codex-uuuIG0`, 2026-10-16,
issue #9286. This completes the independent review of the atlas deliverables;
it is not an acceptance of the proposed mathematics or a blocked checkpoint.

The input author was Claude session `claude-iKBZMu` (PR #9375). This reviewer
did none of that work. The bot confirmed the claim in
[comment 6218667132](https://github.com/CBirkbeck/tauceti-explorer/issues/9286#issuecomment-6218667132).
The current assignment explicitly selected this atlas review. Earlier ownership
checkpoints are superseded by this report for these deliverables only. Nothing
in this review changes or certifies the authoritative upstream
[TauCetiRoadmap PR #851](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851).

## Scope and counts

Inspected all 65 target nodes, their proof sketches and direct prerequisite
contracts, all 70 inherited baseline entries at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, the reader, suggested Lean, sources,
119 API entries, 67 definition/construction tests and six planets. The packet's
`review.checked` records 38 verified, 16 corrected and 11 unverifiable targets.
A corrected target can still depend on another target's explicitly open proof
contract; these records do not claim a completed formalisation.

No nodes were added or deleted. Two baseline near-misses were removed, leaving
68 entries. There are ten recorded gap groups and four supplier requests.
`complete` remains the inherited finished-pass status; GN.4's `planned` denotes
its target inventory, with an explicit remaining list and a nonaccepting review.
Neither status certifies closure. The eleven unverifiable targets are the
reason this plan is returned, rather than merely its honest inherited gaps.

## Errors corrected directly

- **Successive-minima count:** Henk, Theorem 1.5 and the convention before
  (1.3), pp.2–3 of arXiv:math/0204158v1, uses ceiling factors. The old proof
  silently substituted floors. The weaker displayed constant is retained with
  a valid product expansion. The Lean adapted-basis coordinate estimate now
  uses the explicit dimension-only constant instead of an existential constant
  allowed to depend on the lattice.
- **Skew matrix counts:** require positive diagonal parameters of product one.
  The singular count now assumes `Y ≥ 2`; a power of `log Y` cannot bound a
  positive fixed count uniformly as `Y` decreases to one.
- **Curvature API:** from `area E ≥ a²` one obtains `R_max/a ≥ 1/√π`, not
  `R_max/a ≥ 1`. Increasing the exponent requires increasing the constant by
  `π^((θ′−θ)/2)`. The API and proof now agree.
- **Quotient probability:** Haar measure must first be restricted to a
  fundamental domain. Pushing forward full Haar measure through an infinite
  discrete quotient cannot produce a finite probability by normalisation.
  Removed the Mathlib quotient-group Haar theorem: it requires a normal
  subgroup and cannot supply the homogeneous-space measure on `SL_n(ℝ)/SL_n(ℤ)`.
  The AA.2 request remains the exact needed quotient-integral contract.
- **Good functions:** the Lean predicate now requires positive `C, α` and
  tests every witnessed positive lower bound for the local supremum. An
  unbounded real `iSup` otherwise defaults to zero and can make the old
  condition vacuous. The zero-function and polynomial API now include their
  positivity and `k ≥ 1` assumptions; supremum closure includes boundedness.
- **Quantitative nondivergence:** Kleinbock–Margulis, (5.1) and Theorems
  5.2–5.3, pp.13–15, use the maximum exterior-coordinate norm, rather than
  Euclidean covolume. The unipotent constant is
  `2k³6^k(k²+1)^(1/k²)`, obtained by multiplying the polynomial-goodness
  constant by `k6^k`; the old packet and Lean had `2k3^k`.
  The Euclidean short-vector version follows by inclusion of exceptional sets.
- **Dynamics and Oppenheim:** the weak-limit proof now uses range and kernel,
  rather than concluding that an operator vanishes merely because it has no
  fixed vector. The column convention requires `g⁻¹Hg`, not `gHg⁻¹`, for the
  stabiliser of `Q = λ Q₀ ∘ g`. The ternary reduction no longer treats
  irrationality as open: the proof supplies opposite-sign integer vectors
  with an irrational value ratio and extends their nondegenerate plane.
- **Arithmetic carriers:** the CM probability API requires a negative
  discriminant, not an arbitrary negative integer. The geodesic displacement
  statement requires positive discriminant and positive Pell parameter `t`;
  primitive period and displacement for any positive Pell solution are
  distinguished. The `x²` sphere-average test requires both positive radius
  parameter and a nonempty sphere. Empty-sphere Lean sums are explicitly
  totalised to zero. The sup-norm transference comparison was corrected.
- **Suggested-file shape:** removed the sorry-valued `transposeHomeomorph`
  data definition. Its construction and API remain README targets. The
  suggested file has 716 lines and no sorry-valued data construction.

Every correction is reflected in the packet, reader and any corresponding
Lean statement. Source access dates, hashes and read locators were refreshed;
SSTT Proposition 7.7 and footnote 32 are on p.37 of the retrieved v3, not p.40.
Miller's printed pp.10–14 correspond to PDF pp.4–8.

## Remaining mathematical work

1. **Representation pairs: false original statement.** Fix `K = 2` and let
   `d > 2` run through primes. The solutions with `t₁=t₂=0` already number
   five, while the asserted bound's factor
   `2/√d + 4 log(2)/d` tends to zero. The all-`d` theorem has been replaced by
   an explicitly unresolved restricted target. Ghosh–Sarnak, proof of Lemma
   9.5, p.29, uses a restricted parameter regime. The public
   [Blomer–Granville author copy](https://dms.umontreal.ca/~andrew/PDF/quadraticforms.pdf),
   §1.1 pp.2–3 and Theorem 2 p.5, assumes fundamental discriminants and has
   additional errors. Derive the exact needed range and any nonfundamental
   reduction. This review does not certify that simply imposing `d ≤ K`
   repairs the statement.
2. **Semialgebraic lattice-uniform count:** Barroero–Widmer, Lemmas 2.2–2.4,
   do not suffice to replace arbitrary orthogonal projections by coordinate
   projection sums. Proposition 6.1, pp.17–20, depends on the Hausdorff-measure
   comparison of Lemma 5.8 and definable sections of Lemma 6.2. Give this
   key comparison an exact prerequisite chain and account for the boundary
   argument in §7, pp.20–21. This is not deferred splitting into small lemmas.
3. **Uniform unipotent Davenport:** the proposed superlevel-set induction
   does not prove uniform complexity at every stage. Iterated fibre volumes
   need not be semialgebraic. Specify the retained family and prove its
   uniform interval/variation bounds, or give another complete proof.
4. **Nondivergence:** the Mathlib AE disjoint-small-ball covering theorem
   removed from the baseline is not the prescribed-ball, bounded-multiplicity
   cover used in Kleinbock–Margulis §4, pp.9–13. State the covering contract
   and marked-poset estimate with length and local-finiteness hypotheses,
   then connect the primitive-subgroup flag through (5.1).
5. **Algebraic and Lie inputs:** the cited closed-subgroup/Lie-algebra
   supplier does not provide the invariant-line/stabiliser theorem used in
   Borel density (Morris, Theorem 4.5.2 and Proposition 4.7.1, printed
   pp.139–142), or irreducibility of the five-dimensional quotient used for
   `so(2,1)` maximality. General simple-group mixing likewise needs an exact
   contracting-subgroup/generation contract, or the base Howe–Moore input
   with its recorded gap.
6. **Other uniform estimates:** the planar survey's fixed-domain estimates
   do not by themselves establish the claimed uniform dependence solely on
   maximal curvature over all ellipses. The primitive-ball target's full
   parameter-uniform logarithmic error also exceeds its cited application.
   These contracts and the inherited Huxley method remain explicit gaps.

These findings concern the atlas plan's proof contracts. They do not allege
that the cited named mathematical theorems are false.

## Sources, ownership and source-issue verdicts

The packet records the exact public copies read and the locators supporting
individual targets. The Nelson–Venkatesh published archive copy was readable;
Lemma 27.8, pp.184–185, is an application of Borel density, not its proof.
Unavailable primary proofs remain identified as indirect citations; their
unseen arguments are not certified. BSW published-numbering corrections remain
attributed to the earlier extraction: this review read the arXiv §5 and does
not claim a new published/preprint collation.

**E401 rejected:** the shear example defeats one naive proof, without proving
that Bhargava–Shankar's assertion that Davenport's proof adapts is wrong. The
replacement induction is an atlas gap, not a confirmed source erratum.
**E402 confirmed for the inspected copies:** Morris Theorem 3.2.9, printed
p.103 in the arXiv copy and p.109 in the current author-hosted edition, has the
norm-product display. Indicator functions contradict it; the proof gives the
product of integrals. No claim about an uncollated printed edition is made.
Both source issues have independent verdict objects. The inherited Markoff
strip computation was checked: subtracting `1/144` from `1/36` yields `1/48`.

Checked the reviewed GN.4 library audit and the current read-only roadmap
checkout at `0d144d044dacebca17b654695b6f1ad58f159b27`, with current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing owners remain imports:
GlobalNumberFields 3A supplies fixed-lattice Lipschitz counting;
RealAlgebraicGeometry Layer 6 and current Tau Ceti supply CAD and projection
closure; IntegralLattices supplies binary-form class and automorphism theory;
AlgebraicCodingTheory supplies Construction A. The Golay implementation is
not a general prime-ary minimum formula. No existing carrier or CAD theory
was replanned and no ownership move or new supplier request was introduced.

RT-AREA-algebraicnt-1/1 is addressed locally by the supplier prerequisites,
requests and reader dependencies already present. Its actual roadmap-level
and reciprocal-consumer metadata lies outside this issue's deliverables; the
packet's restructure entry remains the assembly instruction. This review
does not certify that those external metadata files have been updated.

## Validation and next action

- `python3 scripts/check_blueprint.py` on the packet: zero errors and warnings.
- `lean-check` on the suggested file at the pins: success; 80 warnings, all
  declaration-uses-sorry warnings, no errors.
- Source-issue/version validation, intake path/JSON validation and
  `git diff --check`: passed.

The next revision should resolve the eleven named unverifiable targets and
then obtain an independent review. Any changes to the authoritative upstream
roadmap belong in its existing PR, with these atlas findings supplied to the
maintainer; this job neither opens another roadmap nor claims another task.
