# Independent review of ArithmeticStatistics ST.3

**Verdict: accepted as a completed planning pass.** The stage remains
`planned`, with 21 gaps and 27 supplier requests; no proof closure or
formalisation is asserted. Reviewer: Codex, session `codex-v5ZMy0`, job
`REV-ArithmeticStatistics--ST.3`, issue #6313, 2026-10-10. The input was
authored by session `codex-HHjyzZ` in PR #8626, commit
`2dcf63e495611a0010432de49bbd72a3afce64b5`.

The packet's `review.checked` records an individual conclusion for every
node. Here, `verified` means that the planning statement, conventions and
proof contracts were checked, including its expressly unresolved inputs.
It does not certify an unread original proof or a Lean proof containing
`sorry`.

## Counts and scope

| Item | Reviewed result |
| --- | --- |
| Nodes | 76: 8 definitions, 3 constructions, 65 theorem targets |
| Node verdicts | 60 verified, 16 corrected, 0 added, 0 unverifiable |
| Baseline declarations | 23 confirmed; none removed or replaced |
| Public source versions | 20 independently obtained; all recorded SHA256 digests match |
| Accepted target imports | 33 retained without duplicate planning |
| Routed source results | 227 retained |
| API entries and unit-test specifications | 74 and 42; every definition/construction has at least 3 tests |
| Suggested signatures | 13 native, 11 partial, 52 omitted |
| Explicit API/test omissions | 15 API entries and 4 tests |
| Planets | 5 appropriate definitions, constructions or named theorem targets |
| Open contracts | 21 gaps and 27 requests; 2 gaps and 3 requests added by this review |
| Source findings | 46 independently reviewed: 44 confirmed, 2 rejected; 4 findings added |

Target-level granularity is appropriate. The proof sketches retain routine
intermediate steps, while the non-routine conductor, analytic, homological,
geometric and arithmetic interfaces have explicit suppliers or gaps. The
stage is not marked closed. Packet `status: complete` means one finished
planning pass under PROTOCOL section 0.

## Corrections to nodes

Node suffixes below are relative to `ArithmeticStatistics:ST.3/`. The packet
records the corresponding statement, hypotheses, prerequisites, proof steps
and acceptance checks.

| Node | Correction and evidence |
| --- | --- |
| `quadratic-order-three-torsion-bound` | Replaced the false factor `3^ω(f)` by `3^(ω(f)+1)`, retaining `3^ω(f)` when `3∤f` and equality at conductor 1. At `K=Q(√−39), f=9`, the base class group has three-torsion 1, while the order has three-torsion 9. The residue-unit quotient is `C₃²`. BBP Lemma 3.3, p.12, only requires a bounded additive rank term. The conductor-sequence contract must handle local rank at most two at 3. |
| `secondary-cubic-lattice-coefficient` | Identified `N(L;X)` as BST's averaged fundamental-domain count for a noninvariant lattice or translate. An invariant locus recovers the weighted orbit count. Retained the translate residue average and `m⁴≤X` hypothesis: BST Theorem 27 and Remark 3, pp.19–20. |
| `cubic-root-weighted-sieve-identity` | Applied the same averaged convention to individual projective-root conditions; the sum over roots is invariant. Retained the zero reduction's `p+1` multiplicity: BST Proposition 33, pp.27–29. |
| `refined-cubic-sieve` | Stated the small, middle and large estimates for `E_n(X/2,X)`, including main-term factors `1/2` and `1−2^(−5/6)`. The choices `δ₁=1/24`, `δ₂=1/30` give saving `1/48`; dyadic summation supplies the cumulative remainder: BST Lemmas 34–36 and (91)–(94), pp.29–35. |
| `cubic-secondary-orbit-integral` | Required a rank-three integral order with étale generic fibre, rather than an étale integral algebra. This permits ramified orders in BST Lemma 37, pp.35–36. Primitive Haar measure remains normalised to one. |
| `low-degree-s-integral-parametrization` | Made the discriminant identity an equality of fractional `O_S` ideals and made inversion of 2 explicit in degree 2. Requested the missing degree-two squareclass representation from ST.1: BSW Theorems 3.1–3.4, pp.9–12. |
| `quartic-class-group-two-torsion-fibre` | Restricted characters to those annihilating extended base classes; the fibre has size `h₂(L/F)−1`, with its narrow analogue. Added the splitting prerequisite. Pullbacks of base quadratic characters instead produce product closure groups: BSW proof of Theorem 6(b), pp.29–30. |
| `low-degree-class-group-mass-ratios` | Corrected the displayed means to relative torsion. Absolute means acquire the respective fixed base factors `h₃(F)`, `h₂(F)`, `h₂⁺(F)`. Made matching finite resolvent-lift specifications explicit and added splitting: BSW Theorem 6 and (43)–(44), pp.4–5,28–30. The rational-base constants are unchanged. |
| `quadratic-four-rank-conic-formula` | Required positive squarefree divisors `b`, with `b′` the signed squarefree part of `D/b`. At `D=5`, allowing negative `b` doubles the answer: FK Theorem 5, pp.9–10. |
| `quadratic-four-rank-jacobi-expansion` | Specified all six sign/congruence families, including their characters at −1 and 2, prefactors, product cutoffs and mod-4 restrictions: FK Lemmas 17,28,34,39,41,43, pp.14–16,35,42,45,48,51. |
| `rank-moments-determine-rank-law` | Replaced an invalid use of full finite-p-group moment uniqueness. Gaussian inversion gives elementary-abelian-test moments only. Requested the precise rank-marginal uniqueness export from ST.5, with growth/tightness conditions; DJ Theorem 5 at `ℓ=1`, pp.6–8, supports the target. The alternate geometric-zero proof input remains open. |
| `relative-torsion-splitting` | Added the narrow norm-kernel version and its cardinal factorisation, with descent through total positivity and norm after extension equal to the degree power. Requested the absent native narrow maps. Ordinary maps are already present; suggested coverage is now partial: LOWW p.7 and BSW Theorem 6(b), pp.4–5,29–30. |
| `uniform-small-degree-field-bound` | Corrected the locator to LOWW Lemma 3.5, p.11. Its published statement already includes `h₂(F)`; Lemma 5.8, p.25, gives the quadratic refinement. |
| `relative-three-torsion-propagation` | Corrected locators to LOWW Lemmas 3.13–3.14 and Proposition 3.15, pp.16–18, with Proposition 3.12, pp.16,18. Kept the corrected order weight and wild-conductor proof contract. |
| `nonabelian-low-degree-known-moments` | Corrected the BSW locator to Theorem 8, p.5, and section 10.2, pp.30–31. Alberts's closure-type qualifications and constants remain intact. |
| `binary-form-arithmetic-bertini` | Corrected the associated source finding to `ζ_(P¹_Z)(3)⁻¹=ζ(3)⁻¹ζ(2)⁻¹`, since the scheme has dimension 2. The statistical statement already had the correct inverse factors: BSW binary, p.3. |

The new requests are: ST.1's degree-two squareclass parametrisation;
ClassFieldTheory's narrow norm/extension and base-character filter; and
ST.5's elementary-test rank-marginal uniqueness specialisation. The new
gaps explicitly track the latter two interfaces. The existing ring-class
gap now records the wild counterexample and safe bound. The coverage
`remaining` list and suggested omission reasons were reconciled with these
changes.

No unrelated theorem was added to another owner's plan. The suggested file
changed only explanatory comments: the conductor-bound omission, the
rank-law omission, the narrow splitting/cardinality omissions and the
document-status header. It introduces no opaque arithmetic carrier or
placeholder proposition.

## Baseline, ownership and current upstream

All 23 declarations and their surrounding hypotheses were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The 14 cited module files match
the pinned public files byte for byte. Each baseline entry now records this
independent check. No baseline name, module or mathematical claim required
replacement.

Checks which matter for the conventions include:

- `RegularWreathProduct.inl` includes the acting group; `rightHom` projects
  to it. Native Goursat requires both coordinate projections to be
  surjective.
- `NumberField.finite_of_discr_bdd` applies to finite-dimensional
  intermediate fields of a fixed characteristic-zero extension. It gives
  finiteness, not a new counting asymptotic.
- Ordinary class-group extension/norm and their degree composite are
  present. They require the domain/Dedekind/finite torsion-free hypotheses
  supplied by rings of integers. Their existence does not imply native
  narrow norm maps.
- The narrow class group, forgetful map and finite instance are present.
  The elementary-two quotient cardinal comparison uses finite class groups.
- Frobenius existence and uniqueness are usable with the stated Galois,
  prime-above and unramified guards. The Klein-four cardinal/normality
  statements have the required four-element permutation carrier.

The reviewed library audit contains no existing ST.3 statistical
asymptotics to replan. Existing rank carriers, norms, Frobenius, finiteness,
wreath products and Goursat are imported. The accepted parent targets,
ST.1/ST.2/ST.5 refinements, InductionRestrictionPartII RS.1/RS.4/RS.6 and
InverseGaloisAndArithmeticFundamentalGroups IG.4 contracts were read for
their stated exports. Their planned mathematical or implementation gaps
remain with their owners.

Current upstream was read at TauCetiRoadmap commit
`070dc2becd74419e76303ede84b465ed4a69461f`:
IntegralLattices README Layer 2, milestones 2E–2G, and
`Suggested.lean`'s `finite_classes_of_posDef`/covolume statements;
GlobalNumberFields README's ownership interfaces and Layer 11 orders/Picard
groups; and ClassFieldTheory's Layer 13 norm/class-field interface.
Integral-Gram finiteness does not provide the arbitrary real-Gram,
well-separated, uniform compact-set reduction contract needed here. The
existing IntegralLattices Part II request is retained, and its check receipt
now records the current commit. Orders/Picard groups and class-field
correspondences remain imports from their existing owners. No upstream or
library file was modified or built.

## Public sources and source findings

Every packet source was obtained from its recorded public URL and checked
against `sourceVersions`. Source locators use their displayed page numbering;
journal pagination is retained for Wood, Alberts, Schmidt, EV and
Bhargava–Shnidman. Normalised two source-version `kind` values to the protocol
enum: Bhargava–Shnidman is `published`, Cohen–Morra is `preprint`; their
exact URLs and hashes are unchanged. Relevant statements and proof inputs were read, including
all six FK congruence-family formulas. The original inputs named in the
packet's gaps remain unverified; reading a later paper that invokes them
does not close those gaps. No restricted book was used.

The packet gives a separate independent `review` for all 46 source issues,
with locator-specific reasons. Earlier reviewer records are preserved as
`priorReview`/`inheritedFrom`; narrowed descriptions retain `priorFinding`.
The results include these necessary changes to inherited findings:

- **E3 rejected:** LOWW Lemma 3.5, p.11, already has the `h₂(F)` factor.
  The claimed omission and old Lemma 2.4 locator do not describe the
  published statement.
- **E9 rejected:** LOWW Lemma 3.13, p.16, explicitly requires equal
  discriminants. The claimed missing hypothesis is not present as an error.
- **E4 narrowed:** the missing `2^(−r₂(F))` affects the displayed `C_G`
  count constant on p.30. The `C_m` constant and final average on p.37
  already have that weight.
- **E5 locator corrected:** the zero-exponent issue is in LOWW Lemma 2.1,
  p.7. Positive exponents are needed to avoid a vacuous norm condition.
- **E10 narrowed:** a fixed discriminant does not determine all local
  quadratic characters. The intermediate fibre bound needs their
  multiplicity; the subsequent `n^ε h₂(F)` estimate can already absorb it,
  so its final exponent is not refuted.
- **E26 locator and scope refined:** the binary full-row lattice `Λ`
  differs from the restricted counted subset. The rank/determinant issue
  requires the appropriate restricted-tail repair; it does not by itself
  refute the final tail bound.
- **E30 corrected:** the LOWW fractional-ideal display already has negative
  exponents. Its error is the paired exponent labels, rather than missing
  inverse signs.
- **E40 corrected:** the prose misses an inverse, but the inherited
  proposed evaluation at 2 was also wrong. The scheme zeta evaluation is
  at 3, and the next source display already evaluates it correctly.

The remaining inherited findings are confirmed at the stated locators,
with qualification where an unsupported proof input is a gap rather than
a disproved theorem. In particular the fixed-resolvent cubic estimate
must separate `Q(√−3)`, whose logarithm is proved in Cohen–Morra and
Bhargava–Shnidman. The source-error records do not assert a failed final
result merely because its printed argument is incomplete.

Four new misprints were recorded for the pinned BSW global v2:

| Issue | Locator | Correction |
| --- | --- | --- |
| E43 | section 10.1, p.28 | An index-three subgroup count divides `h₃−1` by 2, not 3. The later count already uses 2. |
| E44 | section 10.1, p.29 | A quadratic extension of a cubic field has degree 6; its normal closure has group `S₄`. It is not itself an `S₄` Galois extension. |
| E45 | section 10.2, pp.30–31 | Part (b) uses `n=3,4,5`, agreeing with Theorem 8, p.5; the harmonic sum also needs its second discriminant in the second term. |
| E46 | section 10.1, p.29 | The complex-place algebra dimensions and the quartic/cubic table headings reverse field names; the mass values already use the intended degrees. |

The current arXiv record still identifies v2 as latest. The available author
file dated June 2017 is older. Bounded title/erratum/corrigendum searches
found no applicable correction; no novelty claim is made. These findings
are recorded in this review job, not treated as a separate errata job.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.3.json`:
  zero errors and zero warnings.
- Suggested-file elaboration through `lean-check`: exit 0 at the shared
  pinned build, with 109 `declaration uses sorry` warnings and no other
  warning or error. The only later file edit was its opening comment.
- Signature ledger audit: all 76 nodes covered exactly once; all 74 API
  names and 42 test names are represented or explicitly omitted. The 11
  definitions/constructions have 3 or 4 discriminating tests each. The
  typed tests remain proof specifications, not completed test proofs.
- Source-issue and source-version schema checks: zero errors, using the
  validators from `source_issues.py` and `check_errata.py` on the packet data.
- Exhaustive quartic discriminants modulo 9: 42,768 of 59,049 coefficient
  tuples, giving `176/243`.
- Wild conductor counterexample: 54 units modulo 9 divided by 6 scalar
  units give a quotient of order 9 and exponent 3; the four reduced forms
  of discriminant −39 give base class number 4. Compute in
  `(Z/9)[t]/(t²−t+10)` with unit norm `a²+ab+10b²`; the reduced forms are
  `(1,1,10)`, `(2,−1,5)`, `(2,1,5)` and `(3,3,4)`.
- `D=5` conic regression: the two positive divisors have rational points;
  the two incorrectly included negative divisors also do, exposing the
  doubling error.
- Bhargava–Shnidman discriminant regressions: 100 substitutions in each
  of the two displayed families confirm the corrected multiplier −3
  rather than 9. For the second family, `a=r=d′=1` gives −192 rather
  than 576. The first checks `(a,b,c,d)=(a,3r²d,3rd,d)` for
  `a,r,d∈{−2,…,2}`, `d≠0`, with discriminant
  `−[9d(r³d−a)]²/3`. The second checks
  `(a,b,c,d)=(a,r²d′,3rd′,3d′)` for `a∈{−2,…,2}`, `r∈{1,2}`,
  `d′∈{−5,…,5}\{0}`, with discriminant `−3[d′(r³d′−9a)]²`.
  These are finite checks alongside the algebraic identity.
- Independent numerical evaluation of the cubic two-torsion exponent:
  `0.27843374265622195`.
- Submission file/path validation and `git diff --check` pass for the
  four authorised deliverables, including this report and the required
  handoff.

## Orchestrator handoff

The reader document is outside this review issue's deliverables and was
not edited. Before packaging, reconcile its statements for all 16 corrected
nodes above, in particular the ring-class bound, averaged/dyadic counts,
relative character filters/means, positive conic divisors, six Jacobi
families and rank-marginal uniqueness contract. Carry the narrowed/rejected
source findings into the reader as well. The packet and this report are the
reviewed records for those corrections.

The next assembly/package should preserve all 33 accepted imports and
their owners, bind the three new requests to supplier exports, and keep
the 21 gaps and native-signature omissions explicit. No expansion of the
roadmap's scope, planet renaming or change to an upstream roadmap is
requested. The remaining work is future implementation/source-contract
closure and reader reconciliation, not another unfinished pass of this
review.
