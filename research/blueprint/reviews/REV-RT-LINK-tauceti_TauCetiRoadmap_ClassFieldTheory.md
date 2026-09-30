# Verification of the Class Field Theory link-map red team

Job: REV-RT-LINK-tauceti_TauCetiRoadmap_ClassFieldTheory.
Issue: #4348. Verifier: Codex — codex-a71f92, 30 September 2026.

Result: the target contains no findings, and the review therefore has an
empty findings array. No fix job is requested. This is a verification of the
submitted result with independent integrity and selected mathematical checks,
not a second claim to have performed its entire 82-endpoint red-team audit.

## Independence and inputs

The original link-map author was Claude Opus 5; its independent reviewer
was Codex session codex-c83e7a. The red team was Codex session codex-5ebb6f.
This verifier did none of those three jobs. The claim bot confirmed this
session's comment 5912716970 before work began.

Verification snapshot: b839872d67b387cdfcb084424bc86a2c047dd8fb.
Target red-team snapshot: 6480cbe61a8cc144b1e67a6d23a8faad23a5aa39.

Read the red-team report, its checked/provenance/limits and five library-check
records, and the original independent review, including its correction and
overlap ledgers. Parsed the complete result and link packet; checked the
entire identifier/evidence ledger mechanically. The empty finding list was
verified from the JSON itself, not inferred from the report title.

The accepted link packet is
research/blueprint/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json,
SHA-256 e732ef18670fa399c08d1ac38d25de93daa9b87e1d0eb4d7a083a7c8d3f689db.
All 50 entries of the red team's input manifest were independently hashed at
its recorded snapshot and at this verification snapshot. All match.
The source packet and underlying manifest inputs therefore have not drifted
between these two audits.

## Reproduced structural checks

Using the repository's actual link checker, with the atlas plus proposed
roadmap definitions from the verification snapshot and all current link
packets, obtained zero errors and zero warnings.

- All 99 link-ledger entries correspond exactly to the 91 emitted and eight
  already-recorded pairs, with matching identifier, section and endpoints.
- All eleven overlap identifiers occur in the overlap ledger.
- All 223 literal evidence occurrences resolve: 208 in their named stage
  description and fifteen in the owning roadmap document. Per-link
  stage/document counts agree with the red team's ledger. Literal matching
  verifies location; it does not by itself verify mathematical sufficiency.
- All eight already-recorded pairs still occur in their named owner packets.
  The 91 emitted pairs are distinct and duplicate none emitted by another
  current link packet.
- Reproduced topological elimination on the native atlas edges plus these
  91 links: 3,599 distinct edges, all 2,079 vertices processed, including
  isolated registry stages and virtual upstream vertices.
  This does not assert acyclicity of all unpromoted prerequisite lists.
- The target's 216-entry examined roster is a historical review record.
  This verification does not reinterpret it as a fresh claim to have read
  every current document.

## Selected mathematical checks

Read both full endpoint descriptions for CFT-L34, L82, L85, L102 and L103:
ten distinct stages. Read each selected edge's evidence and reason.
These probes address field regime, coefficient transport and theorem
strength rather than only matching terminology.

| Link | Independent check |
| --- | --- |
| CFT-L34 | GlobalNumberFields Layer 8 supplies continuous placewise actions and norms, not the global norm-index theorem. CFT Layer 10 explicitly retains the H3 obstruction and refinement before descending its invariant. The link reason correctly uses relative local Brauer kernels rather than unrestricted local Brauer groups at a fixed finite layer. |
| CFT-L82 | CFT Layer 5 distinguishes roots-of-unity coefficients, the tensor-square cup target and the named primitive-root/evaluation pairing. M.3 explicitly has the tensor-square twist and separate field/S-integer hypotheses. The link leaves their comparison and excluded equal-characteristic cases to the consumer. |
| CFT-L85 | CFT Layer 0 places the generic Tate–Nakayama theorem in its generic supplier. ET.0 still constructs the torus and two-term-complex pairings with the common arithmetic-duality supplier. A free cocharacter lattice discharges the indicated Tor obstruction only for that component, not every torus-complex or real-place comparison. |
| CFT-L102 | CFT Layer 8 exports full correspondence for finite extensions of Q_p and only the prime-to-residue-characteristic correspondence in general. HL.3 retains its higher-dimensional kernel/completion/existence theorem and source decomposition. The link does not infer wild equal-characteristic existence or injectivity from density. |
| CFT-L103 | CFT Layer 12 is a number-field correspondence. HE.0 retains construction of the relative CM order/idele quotient, openness/index and norm/conductor-change data. The link does not manufacture a higher-degree version of the separate quadratic ring-class-field wrapper. |

The CFT Layer 10 example also makes the obstruction concrete: for
Q(sqrt(13),sqrt(17)), its relative idele-layer H2 is killed by two, while the
idele-class H2 is cyclic of order four. The accepted reason does not claim
surjectivity of the former onto the latter. This check uses the roadmap's
explicit contract, not a new proof audit of its global arithmetic theorem.

## Pinned library statements

Verified all five library-file hashes recorded in the target and confirmed
the checkout commits before reading the indicated declarations and standing
hypotheses:

- [Mathlib Tate cohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean),
  lines 40–63 and 110–148: finite-group representations over a commutative
  ring, with the integer-graded carrier and functor.
- [Tau Ceti low-degree Tate identifications](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean),
  lines 21–100 and 280–319: H0IsoNormQuotient and
  HNegTwoAddEquivAbelianization; the latter has trivial integral coefficients.
- [Tau Ceti formations](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ClassFieldTheory/Formation/Basic.lean),
  lines 90–135: Formation abbreviates SmoothDiscreteTopRep with the stated
  compact, totally disconnected topological-group assumptions.
- [Tau Ceti Galois coefficients](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean),
  lines 54–122: UnitsCoeff and KummerCoeff use discrete topology and a
  continuous Galois action; they are not interchangeable trivial modules.
- [Mathlib quadratic reciprocity](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean),
  lines 97–122: legendreSym.quadratic_reciprocity retains prime, oddness and
  distinctness assumptions.

These positive reuse checks support the red team's stated boundaries.
They do not prove general Tate–Nakayama, local duality or class-field
correspondence, and they are not an exhaustive library-absence search.
No external mathematical paper needed to be fetched to adjudicate a finding:
there are no findings with source claims requiring a verdict.

## Validation and limits

The review result passes scripts/check_redteam.py against its exact target.
The two deliverables pass intake path, JSON and privacy checks, and the
publication diff passes git diff --check. The target result and accepted
link packet remain unchanged.

No Lean file is requested or changed. No Lean compilation, library build,
cache download or language server was used. This verifier did not repeat the
red team's whole-catalogue omission search or read all 82 of its endpoints.
The completed scope is the empty finding-set verification, full mechanical
ledger/input reproduction and the ten-stage/five-library-interface probes
described above.
