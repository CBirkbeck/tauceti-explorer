# Red team: ClassFieldTheory link map

**Target:** `LINK-tauceti_TauCetiRoadmap_ClassFieldTheory`

**Issue:** #4349

**Worker:** Codex, session `codex-5ebb6f`, 2026-09-30

**Status:** complete; **findings:** none.

The accepted map has no supported defect in this audit. Its 91 emitted links,
eight references to already-recorded links and eleven overlap recommendations
survive checks of both endpoint contracts, evidence locations, direction,
coefficient/field restrictions, duplication and catalogue candidates. This
result concerns the link map; it does not certify every assertion in the
surrounding roadmaps.

## Inputs and method

The explorer snapshot is `6480cbe61a8cc144b1e67a6d23a8faad23a5aa39`.
The accepted target is
`research/blueprint/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json`, SHA-256
`e732ef18670fa399c08d1ac38d25de93daa9b87e1d0eb4d7a083a7c8d3f689db`.
I also read its independent `REV-LINK` report. The companion result records
the input manifest, pinned-library source checks, all link/overlap identifiers
and every full-stage read. The target packet remains unchanged.

I read all 82 distinct endpoint/overlap stages across 41 owners, including
the fifteen focal stages, and the focal roadmap's scope, ownership and
consumer sections. Each link was assessed against the supplier construction
and the consumer's remaining work. All 223 quoted evidence occurrences were
located: 208 in the named stage description and fifteen only in the owning
roadmap document. I read those fifteen in their document context and checked
their named stages separately; a document-wide statement was not silently
treated as stage-local evidence.

The catalogue screen covered the checker world: 221 roadmaps and 2,028
stages, combining the atlas and proposed roadmap definitions. It searched
class-field, Artin, Weil, Tate–Nakayama, ray/ring/Hilbert-class,
Brauer-invariant, local/global-duality or reciprocity, and norm-index
language. It yielded 71 matching stages and 52 matching roadmap documents.
I read the stage matches, including thirty outside the endpoint set, and
matching document contexts for all seventeen owners without an endpoint.
Fifteen additional full-stage reads are enumerated in the result. This is a
bounded omission search, not a claim to have read all 221 documents in full.

## Attempts to break the contracts

| Boundary tested | Evidence and result |
| --- | --- |
| Finite versus continuous Tate cohomology | CFT0's finite integer-degree Tate carrier is distinct from the continuous low-degree interface. CFT1–4 retain coefficient transport, invariants and scaled inflation in the formation and Artin–Nakayama construction. A built carrier is not a built Tate–Nakayama theorem. |
| Local duality and existence | CFT5 names `tateDualityPairing_perfect_mixed`; its unrestricted finite-module duality is for finite extensions of Q_p. CFT8 distinguishes this from prime-to-residue-characteristic equal-characteristic existence. HL2/3 retain wild characteristic-p and higher-dimensional work. No full equal-characteristic wild supplier is inferred. |
| Cup coefficients and normalization | CFT5 constructs the pairing from `Hom(A,μ_n) × A → μ_n`. Primitive-root and twisted-coefficient comparisons remain necessary; μ_n tensor μ_n is not silently identified with μ_n. CFT7 keeps arithmetic Frobenius and the inverse unit-norm cyclotomic convention. |
| Weil topology and abelianization | CFT9 uses the topology with inertia open and its specified profinite topology; it is not the absolute-Galois subspace topology. The topological abelianization comparison remains restricted to its mixed-characteristic theorem. |
| Global Brauer and formation inputs | CFT10 includes real places and the sum of local invariants. CFT10/11 retain relative Brauer kernels and the H3 obstruction; they do not assert general surjectivity of H2(I_L)→H2(C_L). CFT-L34/L87 preserve this distinction rather than obtaining a cyclic global formation directly from arbitrary relative Brauer groups. |
| Norm groups and conductors | CFT12's norm-intersection/distinctness statements carry their abelian hypotheses. The least conductor includes prime powers and real places, rather than merely a set of ramified primes. |
| Quadratic orders versus relative CM orders | CFT13's ring-class-field wrapper is quadratic over Q. CFT-O08 and CFT-L103 leave HE.0 to build and compare the general relative order/idele quotient before using CFT12's number-field correspondence. GNF11 supplies invertible/proper ideal Pic groups, not an arbitrary class monoid. |
| Quadratic versus higher reciprocity | CFT14's Hilbert product formula is quadratic. CFT-O09 leaves higher-power twisted-symbol and primitive-root comparisons with T.7/M.3 and restricts the CFT10 zero-sum input to number fields. A local symbol defined for arbitrary n does not already prove the global higher-power theorem. |
| Cycles and forbidden suppliers | CFT-O04/O05 keep the mandated CFT-to-QFI direction. CFT-O06 recognizes the elementary auxiliary-prime overlap but admits no unaudited Chebotarev dependency into the reciprocity proof. |
| Downstream comparisons | RP.2 retains evaluation, finite support and the algebraic/cohomological Brauer comparison before rational-point orthogonality. ET.0 retains torus/lattice and modified-real-place work beyond its Tate–Nakayama input. Finite-module local duality does not by itself supply torus or p-adic derived duality. |

The overlap entries are therefore useful scoped proposals, not evidence that
an existing frozen interface may be deleted. All seven `keep` and four
`rescope` recommendations retain the comparisons or genuinely new mathematics
needed at their consumers.

## Omission and duplicate probes

All eight `alreadyRecorded` pairs still occur in their designated
GlobalQuadraticForms, EllipticCurves, NumberFieldArithmetic or
LocalFieldsRamification packets. None of the 91 emitted pairs duplicates a
pair emitted in another current link packet. No endpoint was unresolved;
in particular, pending MordellLawrenceVenkatesh stages resolve through the
proposed-definition world used by the checker.

The plausible unmatched candidates do not establish additional direct edges:

- SelmerIwasawaCohomology L1 imports its duality package from
  ArithmeticGaloisDuality R02. PadicHodgeRegulators L1 requires Bloch–Kato and
  Hodge-period-ring comparisons. Their general local-duality language does
  not replace those named suppliers with finite-module CFT alone.
- HE.1 and Shimura V5 require the main theorem of complex multiplication and
  canonical-model reciprocity. V5 explicitly says, “Class field theory alone
  does not supply the theorem of complex multiplication.” HE.5's local
  reciprocity is the finite/singular Euler-system relation, with its stated
  ES and AGD suppliers. ES.0/ES.7's Hilbert/ray-class fields occur inside
  source-qualified admissibility and ambient-extension hypotheses.
- FunctionFieldArithmetic FA.6 imports its own FA.4 reciprocity supplier.
  HL.5–7 require higher adeles, higher global reciprocity and comparison
  theorems. The reviewed removal of a CFT12 number-field correspondence
  transfer to the unrestricted higher/function-field setting remains sound.
- ProfiniteCohomology Layer 11's local-field cohomological-dimension ownership
  remark does not name a corresponding CFT stage target. It is not evidence
  for an invented exact-stage edge. The prospective LocalGaloisGroups owner
  is not a current atlas endpoint.
- Generalized-Heegner explicit reciprocity, automorphic Weil/LLC consumers,
  and generic deformation-document class-field references require their
  named intermediate suppliers or an actual new interface before a direct
  link can be asserted. ColemanPowerSeries points toward a later Iwasawa
  consumer, not an incoming CFT requirement for its own construction.
- Norm-indexed summation, degrees as sums of local multiplicities, Brauer
  algebra invariant theory, orthogonal sums of invariant representations,
  and local Kähler potentials are lexical false positives.

The reviewed roster is historical. Since that review, three additional
active geometry roadmaps appear in this snapshot; their screened content
does not supply a CFT interface. FoundationsAndLibraryIntegration is retired
and correctly does not justify restoring the removed links. Historical
coverage counts are not defects merely because the catalogue has grown.

## Pinned library checks and validation

I read the cited interfaces, with their standing assumptions, at mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti
`f790474821cf4256814db967cb154e7af3d0c369`:

- Mathlib `RepresentationTheory/Homological/TateCohomology/Basic.lean`,
  lines 40–63 and 110–148: finite-group integer-degree carrier.
- TauCeti `RepresentationTheory/Homological/TateCohomology/LowDegree.lean`,
  lines 21–100 and 289–319: `H0IsoNormQuotient` and the integral trivial-
  coefficient `HNegTwoAddEquivAbelianization`.
- TauCeti `NumberTheory/ClassFieldTheory/Formation/Basic.lean`, lines
  90–135: `Formation` packages `SmoothDiscreteTopRep`.
- TauCeti `FieldTheory/GaloisCohomology/Coefficients.lean`, lines 54–122:
  `UnitsCoeff` and `KummerCoeff`, with discrete topology and a continuous
  Galois action.
- Mathlib `NumberTheory/LegendreSymbol/QuadraticReciprocity.lean`, lines
  97–122: `legendreSym.quadratic_reciprocity` with prime, oddness and
  distinctness assumptions. CFT's planned Hilbert-product derivation is
  separate from this built elementary theorem.

The existing CFT0/1/5/14 audit distinctions agree with these positive source
checks. I make no new exhaustive library-absence assertion.

`scripts/check_links.py` reports zero errors and zero warnings. A separate
acyclicity check of recorded atlas stage edges plus the 91 emitted links
processes all 2,079 vertices and 3,599 distinct edges, including virtual
UPSTREAM vertices. This check does not include all unpromoted prerequisite
lists. The result/report pass `scripts/check_redteam.py` and intake file
scope validation. **No Lean compiled.**
