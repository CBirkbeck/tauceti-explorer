# Independent review: HodgeStructuresPartII H.0

**Verdict: accepted.** Issue #7023; review job REV-HodgeStructuresPartII--H.0.
Reviewer: Codex — codex-lFwWtr, 8 October 2026. This session did none of the
planning in BP-HodgeStructuresPartII--H.0 (#6937, codex-RILLLp).

Acceptance covers a complete target-level planning pass. H.0 has coverage
`planned`, with seven explicit gaps and four supplier requests; it is not
closed or implemented. The part adds seven targets to the accepted parent's
569-node plan and preserves the parent identifiers rather than recreating its
objects. No unresolved contradiction remains in the seven new specifications.

| Measure | Reviewed result |
| --- | --- |
| Nodes | 7: two constructions, one lemma, four theorems |
| Node verdicts | 4 verified, 3 corrected, 0 added, 0 unverifiable |
| Construction API items | 13, including one added naturality equation |
| Construction unit tests | 11: eight shuffle, three residue |
| Additional theorem acceptance examples | 3 |
| Direct pinned baseline declarations | 38: 30 confirmed, 8 added |
| Baseline citations removed or renamed | 0 |
| Target groups / routed extraction dispositions | 14 / 149 |
| Direct H.0 / sibling-stage source dispositions | 5 / 144 |
| Inherited omitted global signatures | 36, explicitly retained |
| New / inherited H.0 planets | 0 / 6 |
| Open gaps / supplier requests | 7 / 4 |
| Implementation status | All seven nodes remain unchecked |

## Corrections made in place

1. Removed seven literal source-anchor quotations from the reader. The source
   locators and own-word explanations remain. The packet contains no source
   excerpt fields.
2. Expanded the field-rank induction at dimension one. A common-kernel line
   then fills the space, so every coefficient operator is zero directly. At
   larger dimensions the quotient field is reconstructed from the descended
   operators and the finite coefficient basis before applying induction. This
   avoids applying a positive `max(1,dimension)` bound at quotient dimension
   zero as though it were a length-zero bound. The theorem statement is
   unchanged.
3. Added the exact finite-basis, line-dimension and quotient-dimension
   declarations to the field-bound dependency list. Added basis-cardinality,
   prime-quotient domain, fraction-ring injectivity and quotient-kernel
   declarations to the reduced-ring proof. All seven statements and their
   ambient hypotheses were read at the Mathlib pin.
4. Added `parameterResidue_natural`, its recorded use and
   `Submodule.mapQ` baseline. Linear maps preserve the multiplication-by-t
   images. On quotient generators, the intertwining equation gives the
   naturality square; quotient surjectivity extends it to all classes. The
   Lean signature uses the native quotient maps with their explicit
   preservation proofs. These proof arguments follow from linearity and
   impose no additional geometric hypothesis. The existing three residue
   tests remain sufficient to distinguish the construction from a zero map
   or a parameter-one evaluation.
5. Corrected the E0 supplier's review status. At this review's input revision,
   EnhancedDerivedSheaves--E0 is partial and has no review object. The CR.0
   and DerivedDeRhamCohomology packets have needs-changes reviews. This does
   not discharge any of the requested ordinary sheaf or Rees interfaces.
6. Updated the reader's counts, public-source access receipts and the packet's
   exact-file elaboration receipt. The packet review lists every node and its
   individual outcome. No theorem hypotheses were weakened and no gap was
   removed.

## Mathematical checks

The shuffle construction uses the two increasing subset enumerations, the
native disjoint-sum indexed tensor equivalence and reindexing by the inverse
slot equivalence. It agrees with the parent's newest-coefficient-at-slot-zero
recursion. The empty power is the tensor unit. The proof works for arbitrary
coefficient modules, including ones whose duals do not separate tensors.

The summand-vanishing lemma uses the parent's monotonicity theorem to kill
one factor before applying a native tensor map. The expansion induction
partitions subsets according to membership of the new slot zero; relative
order within each factor is unchanged and every summand occurs once. Native
binary and indexed tensor generation extend the elementary-tensor equations.
For positive N,M, cardinality forces at least one factor to have reached its
bound at degree N+M−1. These arguments require neither integrability nor a
commuting coefficient family nor division by binomial coefficients.

The torsion-dual example detects an invalid contraction-only proof. In the
characteristic-two example the two different coefficient orders survive in
an ordered tensor even though a symmetric binomial expression could cancel.
The slot, mixed-order, empty-unit and zero-factor examples detect reversed
slots, introduced signs and a false zero-degree convention.

For the field bound, a longest nonzero coefficient word applied to a vector
produces a nonzero common-kernel vector. All words of length at least the
specified N vanish; no commuting-family assumption is used. The line has
dimension one and the quotient loses one dimension. Dimension zero is the
zero module with positive bound one; dimension one is handled directly.
The rank-three Jordan example shows sharpness at positive rank.

For the reduced finite-free bound, each prime quotient is a domain. After
extension to its fraction field, the field theorem kills the coefficient
word matrices at degree max(1,r). Injectivity detects zero in the quotient;
the quotient-kernel criterion puts the original entries in every prime.
They are nilpotent and reducedness makes them zero. The displayed finite
bases detect the original ordered tensor. This is not reflection along one
arbitrary nonflat extension. The rank-one Z/4 example shows why reducedness
cannot be dropped. The zero ring and the rank-zero module are included.

For the residue, the target quotient kills the derivative correction and
makes the composite additive operator linear. The formula for D(te) then
kills the source multiplication-by-t image, even if d(t) is nonzero. Native
`liftQ` gives descent; the generator equation gives uniqueness, equality
criterion and the new naturality square. The quotient at t=1 vanishes and
must not be identified with a polynomial family's fiber at t−1. The integer
modulo-two test is nonzero. No period lattice, sheaf tensor comparison or
exterior-curvature transport is inferred from this elementary argument.

## Sources and attribution

All four public sources were freshly retrieved on 8 October 2026 and the
selected passages below were read. The three PDF hashes match the packet's
previous receipts. Reading did not extend to whole correspondence proofs or
to the sibling stages' papers. The new shuffle, rank and residue results are
own deductions from the native algebra and imported contracts, with the
source papers cited for their intended geometric uses.

- Esnault–Groechenig, [author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf),
  §2.1, printed pp.5–6, and §4.2, pp.23–24, including Lemmas 2.1 and 4.9
  and their printed proofs. The Higgs integrability equation, scaling,
  parameter Leibniz equation and zero/one fibers match the reader. The
  fixed-determinant trace convention is not made part of every Higgs object.
  The source permits a regular-function parameter; relative constancy is
  the roadmap's explicit restriction. This 44-page edition was not collated
  with the Acta edition. SHA-256:
  `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`.
- Liu–Zhu, [arXiv v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1 and
  setup, printed pp.6–8; Lemma 2.15 and its proof, pp.18–19; Definitions
  3.5–3.6, pp.21–22; Remark 3.2, p.24. The actual smooth rigid-space,
  period, Galois and Tate data are retained as source hypotheses. The source
  proves its nilpotence premise by its Galois argument; the rank theorem
  here starts with an ordered nilpotence premise. Negative filtration powers
  live after localization, and the t-connection is compared with its quotient
  through the still-missing graded-base/Tate adapters. SHA-256:
  `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`.
- Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf),
  Definition 1.2(2), p.262; Definition 2.1 and following explanation,
  pp.267–268; Definition 4.1 and Remark 4.2, pp.297–298. The Tate-valued
  Higgs coefficient and symmetric action match the inherited interface.
  Coherence of the image algebra and twisting by an invertible image-algebra
  module retain their analytic context in G7; they are not generic-site
  theorems here. SHA-256:
  `7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd`.
- Stacks Project, [tag 07J5](https://stacks.math.columbia.edu/tag/07J5),
  opening definitions and Lemma 60.15.1 with its proof. The additive ordinary
  connection, exterior extension and integrability agree with the reader.
  A crystal supplies a connection in the stated crystalline setting; this
  does not establish an equivalence on every ringed differential site.
  Retrieved HTML SHA-256:
  `f76cdf52eac191ad0baa040bc0160491838ec725db3579837fac2e60d874ceea`.

The part's `sourceIssues` list is empty. No error in a selected source was
found, and no new issue is asserted. The parent's source findings remain in
its accepted packet. An algebraic generalization here is not a correction to
one of the sources.

## Pinned libraries, ownership and closure

Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti to `f790474821cf4256814db967cb154e7af3d0c369`. Every direct baseline
statement and its ambient assumptions were inspected at the pin. The table
below accounts for all 38 citations; names are existing library declarations,
not new targets. Semilinear declarations are specialized to linear maps where
needed. The dimension facts are applied over fields, where their free,
strong-rank and rank-nullity hypotheses hold.

| Pinned Mathlib module | Confirmed declarations |
| --- | --- |
| `Mathlib/LinearAlgebra/TensorPower/Basic.lean` | `TensorPower`, `TensorPower.algebraMap₀` |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean` | `PiTensorProduct.tmulEquiv`, `PiTensorProduct.tmulEquiv_apply`, `PiTensorProduct.reindex`, `PiTensorProduct.reindex_tprod`, `PiTensorProduct.map`, `PiTensorProduct.map_tprod`, `PiTensorProduct.ext`, `PiTensorProduct.induction_on` |
| `Mathlib/Data/Finset/Sort.lean` | `Finset.orderIsoOfFin`, `Finset.orderEmbOfFin` |
| `Mathlib/LinearAlgebra/TensorProduct/Map.lean` | `TensorProduct.map`, `TensorProduct.map_tmul` |
| `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | `TensorProduct.induction_on` |
| `Mathlib/LinearAlgebra/TensorProduct/Associator.lean` | `TensorProduct.tensorTensorTensorComm`, `TensorProduct.tensorTensorTensorComm_tmul` |
| `Mathlib/LinearAlgebra/Basis/Defs.lean` | `Module.Basis`, `Module.Basis.coord`, `Module.Basis.forall_coord_eq_zero_iff` |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | `Module.finrank` |
| `Mathlib/RingTheory/Finiteness/Defs.lean` | `Module.Finite` |
| `Mathlib/Algebra/GroupWithZero/Basic.lean` | `IsReduced` |
| `Mathlib/RingTheory/Nilpotent/Lemmas.lean` | `nilpotent_iff_mem_prime`, `nilradical_eq_zero` |
| `Mathlib/LinearAlgebra/Quotient/Defs.lean` | `Submodule.mkQ`, `Submodule.mkQ_surjective`, `Submodule.Quotient.eq` |
| `Mathlib/LinearAlgebra/Quotient/Basic.lean` | `Submodule.liftQ`, `Submodule.mapQ` |
| `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | `Matrix.toLin'` |
| `Mathlib/LinearAlgebra/Dimension/Free.lean` | `Module.finBasis` |
| `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean` | `finrank_span_singleton` |
| `Mathlib/LinearAlgebra/Dimension/RankNullity.lean` | `Submodule.finrank_quotient_add_finrank` |
| `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean` | `Module.finrank_eq_card_basis` |
| `Mathlib/RingTheory/Ideal/Quotient/Basic.lean` | `Ideal.Quotient.isDomain_iff_prime` |
| `Mathlib/RingTheory/Localization/FractionRing.lean` | `IsFractionRing.injective` |
| `Mathlib/RingTheory/Ideal/Quotient/Defs.lean` | `Ideal.Quotient.eq_zero_iff_mem` |

The reviewed library-coverage rows for the existing HodgeStructures L0–L3,
EnhancedDerivedSheaves E1 and ShimuraData D3 were read with their targets,
evidence and duplication notes. At the Tau Ceti pin,
`TauCeti.Hodge.HodgeStructureOn` already defines the opposed bounded
filtration with a supplied conjugation; it remains existing work. No
fibrewise Hodge carrier, module tensor, basis, quotient, pure/mixed Hodge
linear algebra or variation carrier is planned again. The bounded exact-pin
Geometry/LinearAlgebra/RingTheory and Mathlib LinearAlgebra/ModuleCat searches
found no Higgs, parameter-connection or ordered-shuffle implementation; this
is not a universal absence claim.

The two upstream style documents inspected were HodgeStructures and
AdicSpaces. The new roadmap definition, its nine ordered stages and accepted
parent plan were checked. H.0 precedes its variation, period and rigidity
consumers; the existing Hodge roadmap is the first prerequisite. The accepted
joining routes retain H.8 real Noether–Lefschetz work. All 149 extraction
identifiers resolve, and their names and stage dispositions were checked
against the stage scopes. The five H.0 items match the freshly read source
passages. No sibling result is silently moved into H.0 or treated as proved.

Exact parent contracts for ordered iterates, their unit/successor/monotonicity,
all-order finite-basis detection, tensor fields and scalar-extension
contraction/word transport were read before use. The reachable local/parent
graph is acyclic with 34 nodes. All fourteen target groups resolve. The part
keeps the exact 36 parent signature omissions and six planet names. No seventh
planet, new layer or duplication of a supplier is introduced. The vanishing
lemma is a reusable target consumed by the bound; routine slot and generator
calculations stay in the construction API instead of becoming a proof's
sequence of lemma nodes.

The four requests remain mathematically specific. CR.1 must supply the
ordinary general-site comparison; E1 the actual ordinary sheaf tensor,
exterior, quotient and descent interfaces; DD.1 the finite ordinary Rees
and unbounded filtered-algebra interfaces; D3 the underlying filtered flat
variation bundle. The relevant current supplier statements were inspected
and do not already provide these full contracts. The p-adic consumer's
correspondence theorem is not made a reverse prerequisite.

## Validation and next work

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.0.json`:
  zero errors and zero warnings, including the available declaration index.
- `lean-check research/blueprint/suggested/HodgeStructuresPartII--H.0.lean`:
  exit 0, 36 declaration-admission warnings and no other warnings or errors.
  The shared build used the pinned Mathlib; available memory was 113 GB
  immediately before the check. Final file SHA-256:
  `ac03e6a498eb19729ef9a013602d1b806473b0eeb66dab17fe51e131f280fedc`.
  No compilation remains running. This checks types and admitted examples,
  not theorem proofs or the 36 omitted intrinsic signatures.
- All thirteen API and eleven unit-test names agree across packet, reader and
  suggested file; the three extra theorem acceptance instances are present.
  All target, route, omission and inherited-planet identifiers resolve.
- JSON, whitespace and authorized-path checks pass. No source passages,
  private paths, copied books or library build artifacts are submitted.

There are no blocking questions for the orchestrator and this review is
complete. The next H.0 work is the precise G1–G7 contracts, starting with the
ordinary sheaf carriers and gluing in G2 and the G1/G3 comparisons. Global
nilpotence must retain a uniform exponent or bounded-rank premise (G6).
Determinant, unbounded period/Tate and analytic image/twist comparisons retain
G4, G5 and G7. Acceptance must not turn any of these gaps into a closed-stage
or implementation claim.
