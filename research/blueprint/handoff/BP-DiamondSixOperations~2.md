# BP-DiamondSixOperations~2 — revision handoff

Issue #6955. Codex — codex-k3u5Fy. 10 October 2026.

This is a completed revision pass for independent review, not a checkpoint.
The packet is `complete`; S0–S6 are all `planned`, with none `closed`, in the
sense of PROTOCOL §0. All 90 received node ids and all 31 planets are preserved.
The received `review` object is unchanged so the next independent reviewer can
replace it. Every implementation status remains `unchecked`.

## What changed

The mathematical statements, proof sketches and reader now agree. The review's
corrected local dimension bounds, separatedness, arbitrary base-change leg,
nonzero/empty qualifications, coefficient reduction and normalized averaging
are retained. Invertible-object degree is cohomological degree, the negative
of the shift index; uniqueness excludes the zero coefficient ring. The four
strictly local criteria include arbitrary sums and the connected
Spa(C,C⁺) open-extension comparison. The practical criterion retains condition
(iii), uses F_ℓ and asks for a finite bound after each spatial test base change.
Its converse avoids the later global smooth twisted-pullback theorem.

S1 specifies the compact-Hausdorff slice over π₀X, the canonical product functor,
actual bounded-below topological sheaves, essential surjectivity and canonical
continuity maps/cocone. S2 specifies augmentation, simplicial maps, matching
v-covers, proper-support fibres, pullback coCartesian edges, relative Kan
universal properties and uniqueness, and canonical pasting identities. The
ball, O⁺, completed algebras, μ_n twist, Spd ℚ_p and the family of every relative
ball open are actual mathematical objects in the plan.

Removed `SupplierContext` and its unsupported geometric assertions. The
suggested file uses actual Mathlib/Tau Ceti carriers for relative factorization,
module adjunctions and scalar mates, ordinary derived categories and shifts,
compact groups and locally constant functions, valuation subrings and
topological module sheaves. No opaque replacement predicates are introduced.
Specializations are labelled as such and are not asserted to supply the full
diamond signatures. Their geometric comparisons remain explicit requirements.

Six of the review's ten missing API names now have meaningful specializations:
`upperShriek_restrictScalars`, `shriekTrace_comp`,
`IsInvertibleObject.of_reduction`, `dualizingComplex_restrictScalars`,
`averagingTransformation_baseChange`, and
`averagingTransformation_restrict_subgroup`. Full derived reduction and the
geometric tensor comparison are not claimed from their module specializations.
The four ball/twist APIs (`Ball.prod_affinoid`, `Ball.diamond_relativeBall`,
`Ball.openDisc`, `tateTwist_classical`) require unavailable geometric carriers
and are explicitly omitted under PROTOCOL §13, with statements and required
inputs recorded. They are not Lean declarations.

Concrete example signatures now include unequal component shifts, a rank-two
non-example, the negative cohomological shift sign, F₅ degree-two averaging,
finite-cyclic and ℤ₂ Haar computations, the ℤ₅/F₅ obstruction, and the Dirac
distribution outside the density image. Their hypotheses do not assume the
computation or obstruction. The distribution proof includes the germ argument
needed to rule out a rank-one local system, rather than just one comparison map.

## Closure and ownership

Read exact existing supplier contracts and replaced stale C0–C7, E0/E2/E3 and
P1 blanket requests with node imports. Four requests remain: E2 geometric
hypercover existence/common refinement, E3 Neeman's compact-generator/coproduct
criterion, D4 nonfree image-relation quotient geometry, and C8 diamond
fibre-dimension/compactification comparison. They specify the shortfall beyond
the current export and their precise consumers.

Two S6 detection gaps now have target-level proofs. Relative compactification
is an open fibre product of total compactification; the component projection,
limit preservation, C4 affinoid formula and C5 field-point topos comparison give
the required open residue-field valuation spaces. Compactified plus rings are
not assumed valuation rings. Minimal valuation refinements preserving a
finite-type subalgebra have residue field equal to the algebraically closed
ground field: local valuation domination and Zariski lemma prove this. They
give ambient closed specializations in each basic open. The final sheaf proof
uses the locally closed support of a nonzero section. No arbitrary
inverse-limit Jacobson assertion is used.

Four gaps remain: inherited H3 higher-rank/all-G duality, inherited H5
non-discrete local curve compactification, D4 nonfree quotient geometry, and C8
diamond dimension comparison. The H3 continuation's exact all-G and arbitrary
plus-ring contracts are consumed explicitly. Reading Huber supplies source
evidence, not completion of another owner's proof plan.

RT-AREA-padic-1/11 remains resolved by importing canonical compactification
from **DiamondEtaleCohomology:C4**, effective v-descent from
**DiamondsAndVStacks:D3**, and §§11–13 geometry from D5. S0 owns compactifiability
and its calculus. No ownership move, foreign packet edit, or upstream edit was
needed. Current TauCetiRoadmap main and current Tau Ceti were read alongside the
pins; existing profinite order, index and Lagrange results are cited.

## Sources and source findings

ECD arXiv:1709.07343v4 §§22–25, pp. 127–161, were read in full, with the cited
enhancement, compactification, constructibility, cohomological-dimension and
completeness dependencies rechecked. The received version hash is retained.
The cleared Huber reference was read only for Theorem 6.2.2 and Remark 6.2.4
(p. 329), Theorem 7.2.2 (p. 368), Proposition 7.4.4, Theorems 7.5.1 and 7.5.3,
and Lemma 7.5.4 with its relevant proof (pp. 387–395). No restricted reference
file or passage is reproduced. Statements and proof sketches are in our own
words, with theorem, section and printed page locators.

E1 remains confirmed and the ball's rational-open compactifiability check is
explicit. E2 remains rejected as a source-error claim; the alternate valuation
proof closes a planning gap without reinstating that claim. E3 remains rejected
and completeness is explicitly retained. E4 remains confirmed for v4's global
dimension wording; target locality and the disjoint-union example give the
corrected criterion. The historical source-issue reviews are preserved.

## Counts, checks and where to resume

The packet has 90 nodes (9 definitions, 10 constructions, 66 theorems, 5 lemmas),
141 API specifications, 73 mathematical unit-test specifications, 31 planets,
24 pinned baseline citations, four gaps and four requests. The suggested file
contains 47 distinct named declarations and concrete examples. Its occurrence
register distinguishes one typed-relative target and seven target
specializations from 91 omitted target signatures; seven typed-relative and
18 specialized API entries from 116 omitted API signatures; and 15 specialized
tests from 58 omitted tests. Two further example signatures are recorded.
Comment occurrences are not counted as declarations or passed tests.

`python3 scripts/check_blueprint.py research/blueprint/packets/DiamondSixOperations.json`
reports no errors or warnings. `lean-check` on the full suggested file exits
successfully at the pinned Mathlib/Tau Ceti build, with only declarations using
`sorry` as warnings. Scoped submission checks and `git diff --check` pass.
The original review, node-id set and planets were compared to the received
packet; source excerpts and local filesystem paths are absent.

The next independent review should assess the two new S6 closure arguments,
the refined supplier boundaries and the explicit signature omissions. Full
geometric signatures and the 58 omitted tests must be supplied on the actual
supplier carriers; they are not implemented by this pass. Every target's
`signatureCoverage`, the reader and the final Lean ledger give the mathematical
contract and input to use. Continue supplier work with the four requests;
continue H3/H5 proof obligations with their owners. No scratch artifact is
needed to resume.
