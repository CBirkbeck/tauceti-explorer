# BP-LocallyAnalyticDistributions — Hasse-calculus continuation

Codex — codex-7e92bd. Issue #641. Winning claim comment 5852701268,
confirmed by bot comment 5852702029; full issue reread after confirmation.
Status remains partial, with L0–L4 in scope and no closed stage.

This checkpoint adds ten L4 declarations to the 35-node predecessor: the native
power-series Hasse construction; comparison with existing polynomial Hasse
derivatives; formal product formula; coefficient bound; entireness; evaluated
operator-valued Hasse construction; the two-sided resolvent recurrence;
operator-norm polynomial closure; commutation; and the explicit inverse of a
root of an entire series with constant coefficient one.

Totals: **45 nodes** (3 definitions, 7 constructions, 17 lemmas, 12 theorems,
6 comparisons), **36 API entries**, **45 tests and typed Lean examples**,
**6 planets**, **42 baseline references**, **8 gaps**, **5 requests**.
The ten definitions/constructions account for 32 API entries and 31 tests.
All 35 preceding statements and hypotheses, 34 complete node objects, all
thirteen integrated reviewed IDs and nineteen links are preserved. Only the
Riesz node's prerequisites and first proof steps are refined. Every
implementationStatus remains unchecked.

## Mathematical boundary

The construction is characteristic-free and admits a noncommutative coefficient
semiring. Polynomial differentiation is imported from Mathlib. The coefficient
bound uses radius 2R and proves decay at every positive radius. Operator values
are limits in the existing complete normed ring of continuous K-linear maps;
A-linearity passes to the limit. The convergence signatures explicitly retain
completeness and a bounded A-action with constant C, without assuming C=1.
The zero-constant counterexample explicitly requires a nonzero ring.

The resolvent's adjugate coefficient estimate remains an unresolved dependency;
the formal recurrence does not prove entireness. This checkpoint also does not
close the finite-projective rank/determinant argument over a nonreduced algebra,
completed tensors, spectral resultants or the distribution-family construction.
The complete-continuity predicate stays imported from AdicSpacesPartII:R3,
with its affinoid-to-Noetherian-Banach generality request intact. No second
predicate or strict-complete-continuity theorem is introduced.

## Reading and verification

Read the roadmap/audit inputs, preceding packet and reader, integrated
decomposition and review, relevant accepted RS-16 ownership decisions and
touching link records. Previously read protocols and the two upstream examples
were byte-checked unchanged. The current AdicSpacesPartII:R3 supplier statement
was inspected. Concurrent PMIA changes add clopen/unit-restriction interfaces
at L0/L2 and change source/acceptance records; none supplies this new L4 bridge.
The refreshed source registry and errata register contain no LAD entry.

Freshly fetched and read Buzzard's full manuscript pp. 22–24, SHA-256
`0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d`,
and Serre printed pp. 78–81 (PDF pp. 11–14), SHA-256
`67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402`.
Serre printed p. 81 was also rendered to verify the formulas. Earlier source
reads remain predecessor provenance. The Coleman PDF was downloaded without
claiming a fresh reading; BGR remains unacquired. No new source error is asserted.
All fifteen added baseline statements and their surrounding hypotheses were
read at the pin. The generated norm_nsmul_le is cited through its indexed
multiplicative source declaration; no index is edited.

The actual suggested file compiles with Lean 4.34.0-rc2: **zero errors and
111 proof-placeholder warnings only**. All **1,882** transitive Mathlib source
imports were byte-compared with the pinned checkout; no Tau Ceti module is
imported. Seven complete scratch Lean proofs check the native coefficient
construction, additive and polynomial adapters, degree boundary and
characteristic-two distinction. **51,363 exact arithmetic assertions** check
420 pairs of noncommutative matrix polynomials over Z/2, Z/3, Z/4, Z/5, Z/6,
Z/8 and Z/11, the left/right resolvent recurrences, commutation, finite root
inverses and sign/diagonal controls. These finite checks do not establish
infinite-dimensional convergence or formalize the roadmap.

Indexed blueprint validation: **zero errors and warnings**. Four-file intake:
**zero problems**. The source-issue wrapper passes. Preservation, scope,
reader/API/test parity, source hashes and the 138-edge dependency graph pass.
The graph is acyclic and ends at baseline declarations and the explicit
AdicSpacesPartII:R3 supplier request.

Final guard: all 21 captured inputs and four predecessor outputs
match main `85cad46b3d86f72afb4f43b9a52f9d9148508442`; the issue body and
winning claim are unchanged. Exactly the four authorized deliverables are
published through Git Data REST.

## Exact continuation

Start at resolvent-series: promote the operator adjugate-minor coefficient
estimate to its own declaration and typed signature, retaining the finite
coordinate truncation and zero-extension comparisons. Then decompose the
finite-projective determinant/rank, Cayley-Hamilton and Riesz/slope algebra
without proving polynomial equality only on residue fields. Complete the
remaining Riesz and finite-slope signatures after their interfaces exist.

Acquire and decompose the BGR finite-module topology, closedness, inverse norm
bound and completed-tensor statements; finish the (Pr) exercises and Coleman
spectral-resultant transport. Audit inherited prototype assumptions as their
remaining signatures are filled. The completed-tensor base-change API is still
omitted for its stated carrier/hypothesis reason.

L0–L3 sources, L4's actual analytic/distribution families, uniform universal
character radii, semigroup bounds and specialization remain unconstructed.
Use the current PMIA node IDs when those layers are decomposed. Preserve the
RS-16 scalar-weight/family-action boundary, PadicFamilies consumers and all
six existing planets. This checkpoint has no independent-review verdict.
