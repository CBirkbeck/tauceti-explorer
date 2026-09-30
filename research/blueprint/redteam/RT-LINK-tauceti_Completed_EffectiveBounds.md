# Red team: Effective Bounds link map

Codex, session `codex-rtOQ9t`, 2026-09-30. Target:
`LINK-tauceti_Completed_EffectiveBounds`; issue #4357. The author
`cgp-a70a276fbaff` and reviewer `codex-hjdg0j` are independent of this worker.

**Result: no substantiated new finding.** This is a bounded audit of the link
map, not certification of every theorem in the surrounding roadmaps. The map's
existing requests R1–R4 retain real unresolved mathematics; they are not newly
discovered omissions and are not silently marked solved here.

## Snapshot and scope

Repository revision `9cabc408c64a980f8ab36c07106d42a5d5a8b903`; target SHA-256
`a1493c80585e5e41a95005979315013c4406ce3be31b57b9fd2fb8bc9c278805`.
Read the accepted target and original independent review, all four Effective
Bounds stages and its reviewed AUDIT-03 entries, the full Effective Bounds and
Multiquadratic documents, and the close consumer descriptions discussed below.
There is no fifth existing Effective Bounds stage: the Brauer–Siegel outlook
does not supply a quantitative theorem.

All seven link/overlap quotations match their named stage or owner document.
The third Multiquadratic quote occurs in the roadmap document, which §10
permits. Both overlaps preserve the direction and scope of the actual imports.

## Pinned declarations and attempts to break the claims

The following are statement-level reads at the required commits, including
surrounding parameters. All seven `baselineChecks` blob hashes match. URLs
were checked through the corresponding pinned local Git objects on 2026-09-30;
these are not claims of Lean compilation or a complete proof/axiom audit.

| Export checked | Evidence and result |
| --- | --- |
| Integral unit-square index | [Tau Ceti UnitSquares/Basic, line 62](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/UnitSquares/Basic.lean#L62). `NumberField.units_sq_index_le` bounds the index of squares in integral units by `2 ^ finrank ℚ F`. It is the precise number-field input named by Multiquadratic Layer 2. It does not bound the square-class group of the whole field or identify class-group two-torsion with its elementary-two quotient. The overlap appropriately reuses this implementation. |
| Coordinate packing and doubling | [Doubling, line 186](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean#L186), and line 343. The carrier is a finite coordinate space into ℂ, with positive radii. Packing requires strict separation and `0 < ε ≤ c`; doubling assumes finiteness at scale two. Constants are `(4c/ε)^(2#ι)` and `49^#ι`. GN.4's proposed reuse is conditional on coordinate and finiteness adapters; it supplies no general star-body error term, Siegel formula, Oppenheim theorem or equidistribution. |
| Effective Hermite count | [HermiteCount/Basic, lines 139–199](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean#L139). Fields are finite-dimensional intermediate fields in a fixed characteristic-zero ambient field. The bound is `(2C+1)^(D+1)D`. The preceding generator theorem supplies bounded integer-polynomial roots, so the implementation is stronger than a naked cardinality estimate. Nevertheless a complete executable field list, isomorphism quotient, automorphism weights, and local wild-discriminant bounds require further work. R3 correctly declines to infer these from the count alone. |
| Rank-zero regulator | [EffectiveBounds/Regulator](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/Regulator.lean). `one_le_regulator_of_rank_eq_zero` has the rank-zero hypothesis and follows from the empty-determinant normalization `R=1`. R1 correctly refuses to apply it to positive rank. |
| Regulator and family index | [Mathlib Units/Regulator, lines 254–383](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/Regulator.lean#L254). `regulator` is a covolume and is positive. `regOfFamily_div_regulator` holds for a rank-indexed family without a full-rank hypothesis: in the deficient-rank case the numerator and totalized infinite index are zero. Full rank is needed to interpret the identity as a positive-integer stopping certificate, exactly as R2 says. |

Independent normalization check: [LMFDB's ℚ(√5) page](https://www.lmfdb.org/NumberField/2.2.5.1)
(read 2026-09-30, unit-group section) gives the fundamental unit for
`x²-x-1` and regulator approximately `0.48121182506`. With
`φ=(1+√5)/2`, `1<φ<2<e`, so `0<log φ<1`. This breaks a hypothetical
positive-rank `1≤R` assertion, but the target explicitly disallows it.
Replacing a fundamental unit by its square gives index two and twice the
regulator; a finite index bound alone is not completeness. R2 preserves the
strict bound below two or a separate saturation argument.

Also read the pinned statements in Tau Ceti
`EffectiveBounds/Discriminant/Basic.lean` (`abs_discr_le_of_basis_isIntegral`),
`ClassNumber/Basic.lean` (`classNumber_le_bound`) and `IdealCount/Basic.lean`
(`card_ideal_absNorm_le`, requiring `X≥1`), and the square-element trace lemmas
in `TauCeti/FieldTheory/Trace.lean`. The ideal upper estimate is quadratic,
not the linear ideal asymptotic supplied by Arithmetic Dirichlet Series. A
square-element trace calculation is not generic Scharlau transfer for every
finite separable extension; the Quadratic Form Invariants Layer 9 consumer
retains that broader work and the general trace API.

## Fresh omission search

Screened 211 atlas extracts, nine new roadmap definitions, 143 research packets
and 51 integrated decompositions, including nodes, gaps and requests, and 429
roadmap Markdown files. Queries included exact export names, unit-square index,
effective Hermite/discriminant counts, regulator bounds and certificates,
polydisc packing and doubling. This is a catalogue-wide discovery screen,
followed by close reading of relevant candidates, not full mathematical review
of all 429 documents. Analytic Cauchy estimates, analytic compactification
charts, and nonarchimedean polydiscs do not by themselves consume this packing
engine.

* **Computational Number Theory CN.2 and Classical Arithmetic Completion CA.5:**
  full-rank units and an independently proved regulator lower bound give the
  proposed certificate. The CA.5 node
  `fundamental-units-from-regulator-bound` explicitly assumes maximal rank and
  a comparison `regOfFamily(u)<2L`. It uses the Mathlib ratio identity; it does
  not choose the still-unspecified positive-rank Effective Bounds inequality.
* **Small Ramification R25.1 and Faltings R28.1:** bounded-discriminant finiteness
  does not supply the required discriminant bound from fixed degree and a
  prescribed set of ramified primes. The wild-prime bounds and list-completeness
  arguments remain source-specific. No extra quantitative Hermite dependency
  was established by these consumer descriptions.
* **GN.4:** current packet gaps preserve the distinction between general lattice
  asymptotics and the exact coordinate-packing interface. Proposed metric/norm
  adapters are not existing additional Effective Bounds stages. The accepted
  conditional overlap and R4 cover the reusable subproblem without expanding a
  completed roadmap in place.
* **Arithmetic Statistics ST.0:** the partial, unreviewed research packet's node
  `number-fields-ordered-by-discriminant` lists the Tau Ceti explicit bound in
  both its statement and prerequisites. This is a real citation worth retaining
  in the audit record. However, its proof steps establish Northcott directly
  from `mathlib:NumberField.finite_of_discr_bdd`; no numerical count is an API
  conclusion. Read that actual [Mathlib declaration, line 496](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean#L496): it supplies finiteness of exactly the embedded carrier used in that step. The current node does not establish a mandatory quantitative dependency merely by listing the stronger theorem. In particular a bare `Set.ncard` bound is not itself a finiteness proof. If the ST.0 plan later exports a numerical bound or commits to that proof route, its ownership link should be recorded; no unconditional missing edge is asserted here. This provisional node is absent from the accepted integrated decomposition. Packet SHA-256: `6be349522aacb1581459d4bf0688b8ca8b05b22eb1f9c28518c3a88b708ed025`.

## Production graph and validation

Ran `scripts.build.assemble(require_distances=False)` in memory: 2840 stages
and 8007 distinct stage edges. The explicit EB Layer 1 → Multiquadratic
Layer 2 edge is present, as are both `alreadyRecorded` Number Field Arithmetic
edges (Layers 3 and 8), each also in the consumer's `requires` list. Thus the
sibling deduplication does not lose a production dependency. The Arithmetic
Dirichlet Series item is an overlap, not a suppressed directed edge.

Validation: `check_links.py` reports zero errors and warnings for the target;
`check_redteam.py` and the swarm submission checker pass for these two
deliverables; `git diff --check` passes. No generated atlas files changed and no
Lean compilation was needed or attempted for this report-only job. The result
has an empty finding list deliberately; requests already present in the target
and possible future proof choices have not been promoted into new defects.
