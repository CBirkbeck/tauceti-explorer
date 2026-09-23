# Independent Effective Bounds link review

**Accepted**, with a scope clarification to the GN.4 overlap. Reviewer: **Codex — codex-hjdg0j**, independent of original worker **ChatGPT Pro — cgp-a70a276fbaff**. Job `REV-LINK-tauceti_Completed_EffectiveBounds`, issue #102, 2026-09-23. Snapshot: `e3c7ff7d56b58de8b106f0a28be718c4b26bafae`.

Retain **one link and two overlaps**. All **seven evidence quotations** are literal and relevant; no edge is added or removed. The scope of acceptance is the dependency screen, not the historical claim that every mathematical target is implemented.

## Reading and independence

Read the complete EffectiveBounds and Multiquadratic documents, all four own stage descriptions, the full GN.4 endpoint, the original packet and handoff, and the relevant reviewed AUDIT-03 coverage (REV-AUDIT-03: 198 checked, four corrections). The protocols are byte-identical to those read for the preceding job. The original worker is a different session/agent. This reviewer previously reviewed the ADS packet's related counting overlap; that does not make this independently authored EffectiveBounds packet the reviewer's own work.

Read the statements and surrounding parameters for all seven original `baselineChecks` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Also read the basis-discriminant and class-number bound statements for the additional completeness checks. This is targeted declaration-statement verification, not an exhaustive audit of proofs or axioms.

## Link and overlaps

| Record | Verdict | Reason |
|---|---|---|
| EffectiveBounds 1 → Multiquadratic 2 | Keep, explicit | The producer supplies `[O_K^×:(O_K^×)^2] ≤ 2^[K:Q]`; the target explicitly names `units_sq_index_le`. The pinned declaration has precisely the number-field/integral-unit carrier. It says nothing about arbitrary field square classes or identifying `Cl/Cl²` with `Cl[2]`. |
| EffectiveBounds 1 / Multiquadratic 2 | Keep `rescope` | Remove duplicate migration responsibility: use the existing bound, leaving ambiguous class numbers and genus theory to Multiquadratic. The source's completed status does not authorize reimplementing it. |
| EffectiveBounds 0 / GN.4 | Keep `rescope`, clarify scope | The specific coordinate-polydisc packing task can reuse the existing engine. Require coordinate and finiteness adapters before applying it. The packet now explicitly makes this conditional on that subproblem; GN.4's general covering, star bodies, asymptotic counting and dynamics do not all acquire a prerequisite on this estimate. |

The third link quotation, “shared with the effective-bounds roadmap,” occurs in the Multiquadratic document's migration-source paragraph; it is valid owner-document evidence rather than a quotation from Layer 2 itself. Both endpoint-stage descriptions were read in full.

## Pinned declaration checks

- [Unit-square bound](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/UnitSquares/Basic.lean): `NumberField.units_sq_index_le` assumes `[Field F] [NumberField F]` and bounds the index of `Subgroup.square (O_F)^×` by `2^[F:Q]`. The proof uses a fundamental system and torsion generator. It is already present and matches the link.
- [Packing and doubling](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean): finite coordinate type, positive radii and `0<ε≤c`; distinct points are strictly separated by `ε r_i < ‖x_i−y_i‖` in some coordinate. The packing estimate is `(4c/ε)^(2d)`. Doubling bounds the scale-two intersection by `49^d` times the scale-one intersection for an additive subgroup, with finiteness of the scale-two intersection explicitly assumed. Neither statement is a uniform asymptotic or a Haar-volume formula.
- [Quantitative Hermite–Minkowski](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean): for a characteristic-zero ambient field A and natural discriminant threshold N, `ncard_setOf_finiteDimensional_abs_discr_le_le` bounds the number of finite-dimensional intermediate fields of A/Q by `(2C+1)^(D+1)D`, with the named coefficient/degree bounds. Its preceding generating-root theorem is a stronger usable construction than the scalar count alone. Neither certifies an arbitrary proposed field list without enumeration and comparison.
- [Rank-zero regulator](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/Regulator.lean): `one_le_regulator_of_rank_eq_zero` requires `rank K = 0`; the underlying theorem gives `R_K=1`. The hypothesis cannot be dropped.
- [Mathlib regulator and index comparison](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/Regulator.lean): `regulator` is the unit-lattice covolume and is positive. For a `Fin (rank K)`-indexed unit family u, `regOfFamily_div_regulator` equals the index of `closure(range u) ⊔ torsion K`. The equality itself is unconditional on maximal rank; the infinite-index case is totalized to zero. A stopping certificate needs full rank/finite index before treating this as a positive integer bound.
- [Basis-discriminant bound](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean): a finite Q-basis consisting of algebraic integers gives `|d_K|≤|disc b|`; an arbitrary spanning order is not silently a maximal integral basis. [Class-number bound](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/ClassNumber/Basic.lean): `h_F≤|d_F|4^[F:Q]` is an upper estimate, not an exact class-group certificate.

The ideal-count statement was read in the immediately preceding ADS review at the same unchanged pin: `NumberField.card_ideal_absNorm_le` bounds the nonzero ideals of norm at most X by `X²2^[K:Q]` for X≥1. The separate positive two-sided linear package is also already present. This confirms the distinction in `alreadyRecorded`.

## Completeness

The atlas contains **four**, not five, stages for this roadmap. Reviewed every one and split Layer 1 into its distinct interfaces, giving seven focused supplier/consumer checks. The long-horizon Brauer–Siegel paragraph is not a fifth stage ID and was not invented as one.

Searched all 218 roadmap records and 2,007 stage descriptions, including exact export/module names and families for discriminants, Hermite–Minkowski, ideal/class counts, unit indices, regulators, packing and doubling. There are 217 active roadmaps after excluding retired FoundationsAndLibraryIntegration. Read plausible candidate stages in full, including GN.0–GN.2/GN.4, CN.2, ST.2, R25.1, NumberFieldArithmetic 3/8, QuadraticFormInvariants 9, BorelRegulators R.4 and Faltings R28.1. The GNF 3, ADS 5 and AN.4 texts are unchanged from the preceding review and their relevant full descriptions were already read.

| Own interface | Outcome |
|---|---|
| Layer 0 packing/doubling | GN.4 overlap retained. GN.0's covolume geometry, ST.2's cusp/uniform-tail counts and GNF 3's power-saving ray-class asymptotics are stronger/different tasks. AC.1's additive sumset doubling is not the subgroup-intersection estimate. |
| Layer 1 basis discriminant | NumberFieldArithmetic 3 already has an ownership edge in its packet, so do not duplicate it. Its exact primitive-element index formula still needs the target's named index and determinant comparison. R25.1's local upper/global lower discriminant exclusions are not supplied merely by this basis upper bound. |
| Layer 1 ideal count | Existing ADS 5 overlap is present. Neither linear ideal asymptotics nor a prime-power little-o estimate follows from the quadratic exponent. No new directed edge asserted. |
| Layer 1 class number | NumberFieldArithmetic 8 already records the source. An upper bound does not compute its invariant suite or certify CN.2's found class-group relations. |
| Layer 1 unit squares | Exact Multiquadratic 2 input retained. CN.2's arbitrary found-unit subgroup is not the square subgroup. |
| Layer 2 field count | R25.1 requires actual finite-list completeness and stronger discriminant exclusions. Qualitative Hermite/Minkowski references in finiteness applications do not require this numerical count. No new consumer of the exact polynomial-count bound was established. |
| Layer 3 regulator | CN.2's index certificate could use an explicit positive lower bound once specified, but the rank-zero theorem supplies no general positive-rank bound. Borel R.4 uses higher K-groups and is a different regulator. Mathlib already owns the covolume/class-number volume input recorded by AUDIT-03. |

QuadraticFormInvariants 9 explicitly names EffectiveBounds/TraceForm and the general FieldTheory/Trace library API, but its finite-separable Scharlau transfer is not a consequence of this roadmap's number-field square-root helper. A module path alone is not an additional stage-level proof dependency. Its general trace owner and carrier must be preserved.

All three `alreadyRecorded` entries were checked against the referenced packets. Their presence is confirmed; this review does not independently accept the two NumberFieldArithmetic edges or edit that worker's packet. No additional unrepresented direct link was justified by the search.

## Follow-up requests and limits

Confirm R1–R4: specify the positive-rank regulator lower inequality; use a full-rank family and a proved positive regulator lower bound for CN.2's stopping certificate; prove R25.1's list completeness rather than infer it from a count; and discharge GN.4's coordinate/finiteness adapters. In CN.2, if `regOfFamily(u)≤U` and `0<b≤R_K`, then the finite positive index is at most `U/b`; saturation or a bound below two is still needed to conclude index one.

Independently reopened [LMFDB field 2.2.5.1](https://www.lmfdb.org/NumberField/2.2.5.1) on 2026-09-23: it lists the polynomial `x²−x−1`, fundamental unit a and regulator approximately `0.48121182506`. The rank-one expression `log((1+√5)/2)<1` rejects an unrestricted `1≤R_K`. This is an external arithmetic check, not a Lean-certified example or a bound derived from a decimal. No byte hash is claimed.

AUDIT-03 marks Layers 0–2 built and Layer 3 partly built; it already assigns the volume computations to Mathlib. Retaining the source-document obligations does not reopen the completed estimates or license a second regulator definition.

## Validation

- Link checker: one link, two overlaps, 217 examined; zero errors/warnings.
- Intake validation: packet, report and own handoff passed.
- Independent checks: seven exact quotes, unique active catalogue coverage, valid non-retired endpoints, no duplicate pair, three existing references verified, whitespace passed.
- Graph including atlas, other packets and `requires`: acyclic before and after; 4,445 → 4,446 distinct edges, including 3,746 `requires` edges.

No Lean file changed or compiled. Archive/GitHub API workflow; no git command was run for this job. Only the authorized packet, review report and own handoff were changed.
