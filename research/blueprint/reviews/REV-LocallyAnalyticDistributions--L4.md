# Independent review: LocallyAnalyticDistributions L4

Accepted as an ownership reconciliation, with six corrections to the import
index. This acceptance certifies the local mapping and its stated limits. It
does not certify the mathematics of TauCetiRoadmap PR #854 or its suppliers.

Reviewer: Codex, session `codex-3eXnd8`, 2026-10-16, for issue #9252,
`REV-LocallyAnalyticDistributions--L4`. The input was written by the distinct
session `codex-Hh7Abc` in atlas PR #10039; this session did not write it.

## Authority and review scope

The [maintainer's notice on #9294](https://github.com/CBirkbeck/tauceti-explorer/issues/9294#issuecomment-6147007852)
makes the existing upstream README authoritative. PROTOCOL §15 includes open
upstream roadmap pull requests among existing work. Accordingly, this review
checks the follow-up's ownership reconciliation rather than conducting a
second blueprint or an upstream mathematical review.

I compared all 221 inherited L4 entries with their original statements and
hypotheses and the linked upstream contracts. I checked the six inherited
remaining obligations, the reviewed L4 audit (`AUDIT-25`), the original
blueprint handoff, the confirmed compact-complex finding and its verification.
The packet's empty local `nodes` array is intentional. Its `review.checked`
entries refer to the inherited IDs in the import index; their verdicts concern
ownership mappings, not proofs of the inherited declarations.

The immutable sources checked are:

- [LocallyAnalyticDistributions README, PR #854](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fc6c8ae8b306e6d02566d030d5efcd56cef86cfe/TauCetiRoadmap/LocallyAnalyticDistributions/README.md),
  Layer 4 and its supporting contracts, commit `fc6c8ae8b306e6d02566d030d5efcd56cef86cfe`.
- [Its Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fc6c8ae8b306e6d02566d030d5efcd56cef86cfe/TauCetiRoadmap/LocallyAnalyticDistributions/Suggested.lean),
  at the same commit; its omission of unavailable carriers agrees with keeping
  the mathematical specification in the README.
- [CompactOperators §3.3, PR #932](https://github.com/TauCetiProject/TauCetiRoadmap/blob/724243bd565643c1367ea557271b8de4b572c8ec/TauCetiRoadmap/CompactOperators/README.md#L683),
  commit `724243bd565643c1367ea557271b8de4b572c8ec`, for the finite
  prescribed-rank multiplication interface.

All three content hashes agree with the packet. These are public roadmap
sources. References to Coleman, Urban, Pilloni and BCGP are source lineage
through those roadmaps, with the section, theorem and page locators retained
in the reader and packet. This review does not claim a fresh reading of those
papers. It adds no source excerpt or source-issue assertion.

## Corrections

The following names abbreviate inherited IDs with prefix
`LocallyAnalyticDistributions:L4/`.

| Inherited entry | Correction to the local import claim |
| --- | --- |
| `finite-coordinate-injection` | Changed the locator from the injectivity-only target to §4.1, line 1389, which also supplies the inverse norm bound. |
| `resolvent-series` | Changed the main locator to the analytic resolvent in §4.7, line 1936, with supporting recurrence and (Pr) entireness locators at lines 1832 and 1922. A formal identity alone does not supply convergence. |
| `evaluated-product-on` | Changed the main locator to the (Pr) adapter in §4.2, line 1589, and recorded chart/norm independence and the c₀ formula. The inherited statement uses a potentially orthonormalizable module. |
| `finite-coordinate-detection` | Qualified the import to the upstream Banach c₀ case. Its locator does not state the inherited arbitrary full-product result over every commutative Noetherian ring. |
| `fredholm-resolvent` | Qualified the import to monic polynomials with unit constant coefficient, the contract explicitly used by the upstream slope construction. The stronger arbitrary-monic inherited statement is not certified. |
| `spectral-factor-product` | Replaced the split root-product locator with the prescribed-rank product supplier in CompactOperators §3.3. Recorded its Banach-ring use without certifying an explicit arbitrary-commutative-ring supplier statement. Added that immutable source and the distinct entire-input product locator as supporting context. |

The last three qualifications are recorded in
`inheritedContractBoundaries`. They prevent an assertion that every older
statement survives in its full generality. They do not introduce new local
mathematical work, alter the inherited packet, or pronounce on the upstream
proofs. The proposed rescope continues to import the authoritative upstream
stage. Its `planned` coverage describes that plan; it is not proof closure.

I updated the packet's summary, coverage explanation, first obligation
boundary and counts, and reconciled the reader. I added the required review
object with 221 per-entry verdicts. The Lean file needed no correction.

The rational-cutoff restriction in the two exact-slope local-constancy entries
already appears in their inherited hypotheses. It therefore needs no
correction. The mappings retain rank-one fibres, inclusive finite-slope
endpoints and the distinction between an Euler characteristic and individual
cohomology dimensions.

## Counts and remaining boundaries

| Disposition | Count |
| --- | ---: |
| Direct upstream target | 175 |
| Replaced proof route | 20 |
| Subsumed proof step | 12 |
| Supplier import | 3 |
| Qualified supplier import | 1 |
| Renamed target | 3 |
| Subsumed API item | 2 |
| Library input through upstream | 2 |
| Qualified upstream contract | 2 |
| Classical part only; solid part excluded | 1 |
| **Total inherited entries** | **221** |

There are 215 verified mappings and six corrected mappings. There are no
unverifiable local mappings after the qualifications, no added mathematical
nodes, and no baseline declarations to remove, replace or certify. Local API
items, unit tests, planets, requests, gaps and source issues all remain zero.
API and example specifications belong to the existing owner; copying them
would create the parallel plan forbidden by §15.

`RT-AREA-iwasawa-2/5` is accounted for by the import of §§4.16–4.17: compactness
through a degreewise compact representative, the representative product,
numerical slopes, the finite perfect subcomplex, homotopy comparison, derived
base change and the Fréchet/Stein boundary. The representative product is not
promoted to a homotopy invariant. Underived cohomology base change retains its
extra hypotheses. Compact transition maps and factorizations are additional
data, and generic Stein geometry stays with AdicSpacesPartIII §R3.4.

The verified finding warns that the full BCGP25 solid localization cannot be
replaced by the classical Banach construction or ordinary inversion. The
original job explicitly excludes the solid formulation. The packet preserves
that exclusion and makes no claim to have supplied the full solid comparison;
acceptance here covers only the classical part.

For current ownership, I inspected the relevant current-main OperatorIdeals
and AdicSpaces boundaries and the current Tau Ceti restricted-series and
compact-Riesz interfaces. The current Riesz closed-range/cokernel interface
has an `IsRCLikeNormedField` restriction; it is not evidence that the p-adic
family theory is implemented. These current-head observations introduce no
pinned-baseline citations. The pinned baseline fields remain Mathlib
`082e2d3` and Tau Ceti `f790474`, with an empty declaration list.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocallyAnalyticDistributions--L4.json`:
  zero errors and zero warnings; zero nodes, one planned stage, none closed.
- Separate import-index audit: all 221 inherited IDs occur exactly once;
  all 226 primary/supporting locators exist at the recorded immutable
  versions; three source hashes, disposition counts and all 221 review
  verdicts agree. This checks bookkeeping, beyond the standard packet checker.
- `lean-check research/blueprint/suggested/LocallyAnalyticDistributions--L4.lean`:
  exit 0, no warnings, using the shared build at Mathlib `082e2d37e8`.
  Available memory exceeded the required 20 GB. This checks the native import
  only; no upstream suggested file was elaborated.
- Intake file validation and `git diff --check` pass.

No review repair remains. The maintainer still owns integration of the proposed
rescope and preservation of stage IDs. Future changes to the mathematical
specification belong on upstream PR #854; this acceptance should not generate
another local L4 blueprint or package. No atlas data or upstream file was
changed or promoted by this worker.
