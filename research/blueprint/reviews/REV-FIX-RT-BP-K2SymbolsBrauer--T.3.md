# Independent review of the T.3 K₂ fixes

Refs #5558. Codex — `codex-rtOQ9t`, 2 October 2026.
Reviewed fixer `codex-a71f92`, [PR #5603](https://github.com/CBirkbeck/tauceti-explorer/pull/5603),
commit `a5ee1849f2b91d6ce1b3bc5e0b03d7f4dbfe3347`, against current
base `5d0c3d3`. This session did none of that fix. Earlier work by this
session on the companion T.1 part is not the T.3 fix under review.
Claim 5945044035 was confirmed by bot 5945045248; the whole issue was
reread afterwards.

**Verdict: `needs_changes` for the packet; all five findings addressed.**
The targeted repairs are mathematically sound at blueprint/signature level.
They do not complete the older area review's outstanding proof and supplier
repairs. I retain its negative overall disposition, preserve its review
object verbatim in `reviewHistory`, and identify those remaining obligations
below. A successful schema check does not supply the missing arguments.
This is a completed independent review, not a checkpoint or a formalization.

## Finding-by-finding decisions

### /1 — Relative Dennis–Stein D3: corrected

The actual `relDSRel` definition now requires
`r ∈ I ∨ s ∈ I ∨ t ∈ I`. It derives all three generator-membership
witnesses from that condition by ideal multiplication. Pair admissibility
alone cannot enter this D3 clause. The packet's statement, quotient API,
descent proof outline and three regression tests agree with the definition.
D1 exchanges the ideal entry when the generator map needs it; the descent
outline explicitly splits D3 on the new witness. Bijectivity is still cited
with the unobtained completeness proof recorded as a gap.

The regression uses the actual iterated dual-number ring over `ZMod 3`,
with inner and outer epsilons x and y, and I = (xy). It does not replace
the ring by an unconstrained carrier. I independently checked the tensor
calculation: the maximal ideal kills I; after tensoring, the differential
relations from x², y² and xy vanish, leaving the two coordinates
xy⊗dx and xy⊗dy. The three detector images are (2,0), (1,1), (0,1),
and their D3 defect is (1,1).

A separate coordinate implementation enumerated the 81-element ring.
All 477 D1, 20,385 D2 and 56,889 guarded D3 instances have zero image;
12,960 of the 13,824 extra pair-admissible triples have nonzero image.
The triple (x,y,x+y) has all entries outside I and all pair products xy.
The corrected clause excludes it. The detector cannot establish the full
presentation theorem; it tests exactly the erroneous extra relations.

### /2 — Exponent-one reciprocity: corrected

The suggested global law uses the real sign only when m = 2, and uses 1
otherwise. The packet separates m = 1, m = 2 and the absence of real
embeddings for m > 2 under its primitive-root hypothesis. Its comparison
proof preserves the invariant coordinate map from m-torsion in ℚ/ℤ to
`ZMod m`; it does not multiply by m inside ℚ/ℤ and call the result an
exponent.

The exponent-one test states the entire product assertion for ℚ and
{−1,−1}. Its constant first-root family has empty multiplicative support;
the finite equalities use the pinned first-root subsingleton instance, and
every conditional real factor is 1. This test is independent of the
unresolved local-comparison sign. The separate quadratic test keeps the
real and dyadic values −1, whose product is 1. The source and normalization
gaps of the general comparison remain open.

### /3 — Real Hilbert test: corrected

The actual comparison now takes `r s : ℝˣ`, with explicit real coercions
in the negativity criterion. The packet's domain, API and acceptance
match. For nonzero coefficients, a positive coefficient supplies a
square-root solution; if both are negative the left side of the conic
equation cannot be 1. The separate total-helper test records its value
−1 at (0,0), where the strict-negative condition is false. This correctly
separates the total conic function from the Hilbert symbol's units domain.
The existing nonarchimedean local-field and invertibility hypotheses are
retained. No bilinearity over arbitrary fields is asserted.

### /4 — Infinite base change and residue-map localness: corrected

Both ramification signatures now cover arbitrary field embeddings with
normalized surjective discrete valuations, a positive index e and the
stated order identity. Neither asks for finite-dimensionality. Positivity
is also an explicit argument of `residueFieldMap` and every affected
caller, including `residueDegree` and the finite norm/residue sums.
For nonzero valuation-ring elements, positive orders are equivalent on
the two sides, so the restricted ring map is local. Zero is handled
separately; its Tau Ceti order value is 0 and does not characterize
invertibility. The e = 0 non-example correctly detects failure of localness
by the base nonunit 5 becoming a target unit.

The higher-degree proof reduces to all-unit symbols and symbols with one
uniformizer, writes its image as a unit times the target uniformizer to
the e-th power, and computes the residue. This calculation does not use
algebraicity. In degree two, the parity identity e² ≡ e mod 2 gives the
same sign on both sides; an independent grid over residue characteristics
3, 5, 7 and 11, positive indices 1–4 and signed orders −3–3 verified
the unit/sign formula.

The arbitrary constant-extension proof now separates places with
nontrivial restriction from those with trivial restriction. At a trivial
restriction every imported symbol has unit entries and zero residue;
there is no e = 0 residue-field map. In F(t) → F(u)(t), t−u supplies that
case because a nonzero p(t) over F evaluates nontrivially at transcendental
u. At infinity the index is 1. The positive-index formula supplies the
other finite places and the polynomial-factor multiplicities. The tests
use `RatFunc ℚ` for an infinite extension and state the Gauss valuation's
order condition explicitly; they do not claim its construction is already
implemented. Completion compatibility keeps index 1 and the same residue
field. Finite transfers and the finite all-places refinement remain finite.

The source's finite-extension statements are accurately distinguished
from this derived generalization. Merely deleting a finiteness assumption
would have been insufficient; the actual proof and interfaces now cover
the verifier's additional cases.

### /5 — Internal degree-two normalization: corrected

The projective-line and proper-curve proof steps now identify the packet's
degree-two higher residue directly with its tame symbol. The suggested
`milnorResidue_two` states that equality; the separately named source
comparison keeps the opposite convention. The ℚ-at-5 test distinguishes
the roadmap value 2 on {2,5} from its inverse 3. Source-convention examples
are labelled as such, and inverting all factors preserves product one.
This repairs the explanatory comparison without claiming a new proof of
general curve reciprocity.

## Why the overall packet still needs changes

The immediately preceding
[area review](REV-FIX-RT-AREA-ktheory-1.md) explicitly left T.3 unaccepted
for obligations beyond these five findings. I inspected the current
affected proof steps and their gaps/requests; those obligations remain:

1. `T.3/milnor-quillen-transfer-comparison` still requires the arbitrary-base
   change theorem for Quillen transfers, in addition to the now-correct
   Milnor supplier. `T.3/transfer-and-norm-residue` still lacks the general
   source-backed proof. Supplying the embedding-general residue formula
   does not establish either comparison.
2. `T.3/localization-boundary` still requires a determined upstream owner
   and supplied degree-one boundary normalization, with the module-action
   side fixed. The request to K.3 and K.7 is not an answered import.
3. `T.4/weil-reciprocity` still requires integral-closure finiteness for a
   general mixed inseparable function-field extension. Its separable and
   purely inseparable cases do not alone supply the general step.
4. `T.5/k2-of-the-integers` still imports an unobtained upper-generation
   computation. The nontrivial sign image gives a lower bound, not the
   generation proof; the dependent rational calculation remains conditional.
5. `T.7/local-comparison` and `T.7/chern-class-agreement` still need
   source-backed local and Chern normalizations. Neither the trivial m = 1
   law nor the quadratic regression determines the general comparison.

These are earlier review obligations, not newly discovered defects or a
rejection of the five successful repairs. They are retained in the current
11 gaps and 29 supplier requests. Closing them needs the corresponding
source decomposition and supplier decisions, followed by synchronized
packet/reader/signature updates and independent review. This issue does
not authorize editing the reader or supplier packets. I made no mathematical
changes and did not silently discard any earlier negative disposition.

## Sources, library checks and validation

Freshly read the public author-hosted
[K-book combined draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
dated 29 August 2013, SHA-256
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`:
PDF pp. 235, 237, 240–243, 254, 256 and 265–266, especially
III.5.11.1(b), Ex. III.5.14(a), III.6.2.1–6.3.1, III.7.3, III.7.5 and
Ex. III.7.7–7.9. The full red-team result, all five verifier decisions,
the complete fix report and the previous area review's T.3 obligations were
checked. This is not a fresh check of the published edition or its archived
errata, and no claim is made to have reread every source or all 81 baseline
entries of the pre-existing packet.

Read the reviewed `AUDIT-29` coverage for T.3–T.7, including the localization
sub-stage. It does not supply implemented K₂, Milnor residues, relative
presentations or reciprocity. Personally read all six added declarations
at [Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174):
`rootsOfUnity_one` (and its subsingleton instance), `DualNumber`,
`DualNumber.eps` (and square-zero identities), `IsLocalRing.ResidueField.map`
(and `map_residue`), `Ideal.mul_mem_left` and `Ideal.mul_mem_right`
(and the commutative two-sided instance). Also read the unconditional
exponent-one enough-roots instance. At
[Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Valuation/Discrete/Order.lean)
read the order/unit criterion and uniformizer decomposition: it imposes
surjectivity and a nontrivial value group, with no extension-degree condition.
These are supporting carriers and inputs, not proofs of the planned K₂ results.

Validation at the review base and final working tree:

- `check_blueprint.py` with the declaration index matching both pins:
  **0 errors, 0 warnings**; 62 nodes, 115 definition/construction API items,
  67 definition/construction tests, 81 baseline entries and 15 planets.
- Independent finite-ring and ramification-sign checks described above.
- All 11 targeted regression names occur in the packet and suggested file;
  source guards, units domain, positive-index callers and arbitrary embedding
  signatures checked directly.
- All 155 internal prerequisite pairs are preserved and acyclic. The actual
  assembler has 2,956 stages and 8,635 stage-dependency pairs, acyclic.
  The hypothetical check leaves the atlas unchanged; it is not promotion.
- Every planning field is unchanged: node IDs, statements, ownership,
  prerequisites, baseline, sources/source versions/source issues, API/tests,
  coverage, gaps, requests, planets and restructuring. The suggested file is
  byte-for-byte unchanged. Only review metadata/history and this report change.
- Intake validation and `git diff --check` pass for the two changed deliverables.

**Lean was not compiled.** The existing shared checkout is not at the required
pins and has no matching root artifacts. No project, cache download, library
build or language server was started. Historical elaboration of an older
file does not validate the edited signatures. Implementation remains unchecked.
