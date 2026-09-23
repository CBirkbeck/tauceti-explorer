# REV-PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26

**Verdict: revise.** Independent review by Codex `codex-hjdg0j`, 23 September 2026, issue #1204. Original extractor: Claude Code `cc-39fac3`, issue #1203. The claim was bot-confirmed before work and the full issue reread. This review is complete; it is not a checkpoint. The corrected extraction remains partial because of the explicit G1–G3 obligations below.

Reviewed at repository base `aa1dd90ac4615e31afae06b83782c9a9e1b72e5b`. Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Outcome

All 44 original items are preserved and checked. The corrected extraction has 59 items: 3 library, 13 planned, 43 missing, with 14 definition/construction APIs and 42 planning tests. Every missing item is routed once. The review confirms each original finding independently and adds the affine-coset error, for seven findings in total. Two were already fixed in print. No conclusion that the main theorem is false follows from these findings.

The central correction is the scope of the dyadic rescaling. It proves a construction after a new choice of r; the old extraction treated it as a proof for the original r of Proposition 2.5. That implication is not established. The finite-prime-triple argument now uses a quantitative count, removes fixed proportional lines and then removes the finitely many unit-ratio families before invoking valuations modulo ell. The three separate logical transfer operations, ample-height hypothesis, nonzero S-unit coefficient, nonzero ideal and degree-one prime conditions are now explicit.

## Route decisions

- **Route 1: accept.** ES.3/ES.4 owns local densities and the separate prime-weighted endpoint. The corrected route includes the affine I-lattice, exact Kai input and quantitative non-proportional refinement, with the fixed exceptional families removed.
- **Route 2: reject.** Ownership in AN.4 is plausible, but item 33 is not an exact Mitsui theorem. G1 requires the archimedean/angular and uniform modulus/error contract before this source can be used.
- **Route 3: accept.** AC.5 owns finite-complexity prime patterns. Item 35 now states Kai v5 Theorem 13.1 with its actual lattice, weighted count and local-density hypotheses.
- **Route 4: accept.** A6 owns the Weil-restriction/isogeny comparison. General quadratic descent and the rational plus/minus proof are explicit in 59/58; Mordell–Weil and descent foundations are imported, and the elliptic-only near miss is no longer overstated.
- **Route 5: reject.** The proposed LD.4 successor has the right direction, but the fixed-r dyadic proof G3 and the Eisenträger reduction G2 remain unresolved. The corrected brief names both and preserves exact target statements.

## All original item checks

| Item | Result | Check or correction |
|---|---|---|
| 1 | corrected | Generalized to tuples and separated single-equation reduction. |
| 2 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 3 | corrected | Separated the three distinct logical transfer operations and made coefficient encoding explicit. |
| 4 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 5 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 6 | corrected | Added finite-extension descent and the already-totally-real case. |
| 7 | corrected | Distinguished original F from the cyclotomic base field. |
| 8 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 9 | corrected | Retained the published conclusion with explicit source gap G2. |
| 10 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 11 | corrected | Narrowed the library claim to disjointness; separated base change. |
| 12 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 13 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 14 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 15 | corrected | Pinned coordinate transport and the pushforward/pullback character convention; limited the Kummer citation to injectivity. |
| 16 | corrected | Corrected elliptic-only degree citation and supplied the actual kernel/degree proof outline. |
| 17 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 18 | corrected | Explained the cyclotomic rank comparison and conversion to ordinary rank. |
| 19 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 20 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 21 | corrected | Corrected the general isogeny Kummer source to B(F_v)/phi A(F_v). |
| 22 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 23 | corrected | Required r nonzero and checked the square-twist parametrization and protected-prime induction in Yu. |
| 24 | corrected | Made ell-adic inclusion exact and imported existing S-units. |
| 25 | corrected | Required compatible coefficient identifications for comparison. |
| 26 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 27 | corrected | Retained fixed-r statement and exposed G3; corrected the E6 dependency. |
| 28 | corrected | Specified a symmetric ample height. |
| 29 | corrected | Used the published fixed-Jacobian Northcott argument; removed blanket certification of the older proof. |
| 30 | corrected | Restricted affine formula to y≠0 and added projective extension. |
| 31 | corrected | Promoted the non-torsion step to explicit items 54–55. |
| 32 | corrected | Required I nonzero and residue degree one. |
| 33 | corrected | Marked schematic Mitsui statement as G1. |
| 34 | corrected | Fixed nonzero I and gave precise alternative Kai proof. |
| 35 | corrected | Replaced slogan with actual weighted theorem and its hypotheses. |
| 36 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 37 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 38 | corrected | Added c≠0. |
| 39 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 40 | corrected | Restricted rescaling repair to the changed r and retained only odd ramified-prime unit conditions. |
| 41 | checked | Statement and locator checked against the published article; retained with the supplier/search evidence below. |
| 42 | corrected | Narrowed library claim to finite class group; split supported construction. |
| 43 | corrected | Added separated base-change dependency. |
| 44 | corrected | Required removal of proportional/associate exceptional families. |

## Library checks and ownership

The statements, not just names, were read at the pins:

| Declaration | Read location | Conclusion |
|---|---|---|
| `NumberField.linearDisjoint_of_isGalois_isCoprime_discr` | Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:134 | Coprime discriminants, first field Galois; use the cyclotomic field first. |
| `IsCyclotomicExtension.Rat.discr_prime` | Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:651 | Supplies the cyclotomic discriminant. |
| `IsCyclotomicExtension.inf_eq_bot_of_unramified` | TauCeti/NumberTheory/NumberField/Cyclotomic/IrreducibleOfUnramified.lean:216 | Intersection form, not the complete base-change claim. |
| `NumberField.RingOfIntegers.instFintypeClassGroup`, `NumberField.classNumber` | Mathlib/NumberTheory/NumberField/ClassNumber.lean:58,64 | Finite class group; separate its gamma application. |
| `Set.unit`, `Set.unit_valuation_eq_one` | Mathlib/RingTheory/DedekindDomain/SInteger.lean:108,117 | Exact arbitrary-set S-unit carrier. |
| `Dioph`, `Dioph.pow_dioph` | Mathlib/NumberTheory/Dioph.lean:245,667 | Natural-valued Diophantine sets/exponentiation; not arbitrary rings or full MRDP. |
| `TauCeti.kummerClassMap` | TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:279 | Injective power-class map; surjectivity explicitly remains missing. |
| `TauCeti.Isogeny.degree` | TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99 | Takes affine Weierstrass curves; old general-abelian claim rejected. |
| `WeierstrassCurve.quadraticTwistPointEquiv` | TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean:809 | Elliptic-only point equivalence. |
| `WeierstrassCurve.Affine.Point.canonicalHeight` | TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean:124 | Elliptic height, not Northcott on arbitrary abelian varieties. |
| `TauCeti.GlobalNumberFields.RayClassGroup`, `rayClassToClassGroup`, `card_ker_rayClassToClassGroup_mul_index` | Global/RayClass/Basic.lean:180, Exact.lean:99, ClassNumber.lean:73 | Existing carriers and kernel cardinality, not global reciprocity. |
| `TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` | TauCeti/RingTheory/Henselian.lean:46 | Requires the exponent a unit; not the wild ell-adic case. |
| `Set.unit_fg` | TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:149 | Requires finite S and finite generation of ordinary units. |

Every original planned layer and source-route layer was read: LD.4, RP.0/RP.1, A6, R11.5, DT.2, ES.3/ES.4, AN.4, AC.5; upstream Elliptic Curves Layer 7, Class Field Theory Layers 5/12/13, Chebotarev Layer 10, and Local Fields Layer 1. The added Abel-map input uses the read Jacobian Challenge Layers A/B/D–F; A3 supplies the general degree formula for multiplication. The reviewed library coverage for RP.0/RP.1, A6, R11.5, DT.2, AC.5, ES.3/ES.4, AN.4 and BSD.1 was checked, with no replacement of general missing inputs by elliptic special cases.

Independent searches covered every original missing item in both full pinned Lean trees and all loaded atlas/roadmap documents, including proposed roadmaps under research/blueprint/roadmaps. Queries and hit counts are in `itemReview`; hits were filtered for actual mathematical scope. The searches found no ready general CM-hyperelliptic family, silent-prime twisting theorem, arbitrary-ring Diophantine theory, Mitsui/Kai prime-pattern theorem or general quadratic rank identity. Existing S-unit, class-group, cyclotomic, elliptic and field-Kummer results are imported or explicitly recorded as near misses. Added items reuse these search families: logical reductions (1/3/6), prime lattice/counting (32/34/35), cyclotomic base change (11), Abel-map input (14/31), support construction (42) and general quadratic descent (13/15).

## Source-finding verification

**E1: confirmed.** Confirmed algebraically for ell=3,5,7,11 and by the general substitution x^ell=(1−2rb y^ell)/a. The published p. 1135 has y^(−2); the old version has y^(−1).

**E2: confirmed.** Confirmed by comparing v1 introduction p. 2 with published p. 1131 and substituting (1,1): the missing b changes the Fermat equation. The published version repairs it.

**E3: confirmed.** Confirmed the printed dyadic inference fails. Independently checked all 12^6 unit choices in Z[zeta_3]/4 and gave the valuation argument. The proposed rescaling preserves the isomorphism class and Selmer vanishing, but loses the dyadic unit condition on r and does not prove the original fixed-r X is infinite. Those limitations are now explicit.

**E4: confirmed.** Confirmed by counting unit pairs modulo q^n for q=3,5,7,11 and n=1,2,3. The printed factor grows as q^(2n−2); dividing by that factor gives 1−(q−1)^(−2) away from beta.

**E5: confirmed.** Confirmed by trace duality and the explicit Q(zeta_3), C=3 example x=1+2zeta_3: x is not in 3O but Tr(alpha x) is divisible by 3 for all alpha∈O. The inverse-different character lattice is required.

**E6: confirmed.** Confirmed as a missing inference, not a counterexample to Proposition 2.5. Infinitude modulo global units does not imply infinitely many ratios. For beta=2, (pi,−pi,−pi) has multiplicity ell and fixed ratios. Item 52 derives the stronger count from the exact Kai statement and removes the finitely many associate-prime families using the S-unit theorem.

**E7: confirmed.** Checked the published wording, the explicit nonzero residue example, the CRT translation, and Kai v5 Theorem 13.1 allowing affine-linear maps.

The E3 finite-ring calculation uses zeta²=−zeta−1 and enumerates all twelve units, every unit beta/2, both coefficients and all three unit coordinates. The general valuation proof explains why it fails. E5 also has a concrete witness: with C=3 in Z[zeta_3], x=1+2zeta_3 is not divisible by 3 but Tr(alpha x) is divisible by 3 for every alpha, so the printed trace character sum does not impose the stated modulus.

At E7, translating the congruence set to its lattice repairs the wording and is allowed by Kai’s affine theorem. This does not require a new theorem replacing Kai. The published cover and the explicit rational point were checked by symbolic substitution for ell=3,5,7,11 and by the displayed general identity; E6 is a logical insufficiency repaired by the stronger count, not an assertion that the final infinitude theorem is false.

Version/correction search: the publisher’s eleven-page PDF and landing page, arXiv (only v1), Wei Ho’s writing page, Ari Shnidman’s current page, the old author-hosted preprint, Crossref REST metadata (no update relation), and targeted erratum searches. The exact public URLs and PDF hashes are in the extraction/report. The main article was read in full; prerequisite reading is scoped explicitly and the inaccessible thesis proof remains a gap. No author contact was made.

## Required next work

- **G1:** Mitsui’s major-arc input remains a schematic description. Obtain a primary statement and proof with the element-height/angular region, ideal class, residue condition, growing modulus range and exact error before accepting route 2. Route 1 can instead use the precise Kai theorem.
- **G2:** Eisenträger thesis Chapter 7 full proof was not obtained. Verify the reduction for every infinite finitely generated commutative Z-algebra, including zero divisors and positive characteristic. The published paper states the consequence but does not supply this proof; no contrary result is alleged.
- **G3:** The supported-delta repair changes r and therefore X. It repairs the existential choice used in Theorem 1.1, but does not establish Proposition 2.5 for the originally fixed r. Supply the dyadic residue argument for that fixed r, or explicitly formulate and prove the rescaled-r version while keeping the original statement’s proof gap visible.

## Validation

- Run `scripts/check_paper.py` on the revised extraction and `research/blueprint/intake.py check-files` on the four deliverables plus own handoff.
- Additional checks enforce 59 unique IDs, all original IDs preserved, acyclic dependencies, valid supplier stages, exactly one route for each of 43 missing items, five route verdicts, seven independent finding verdicts, 14 APIs/42 planning tests, and exact five-file scope against the downloaded base archive.
- Mathematical scratch checks pass for the cover identities, all dyadic unit cases, normalized density counts, trace pairing, proportional multiplicities and affine-coset example. They support the written mathematics; they do not certify Lean implementations.
- No Lean file was required, written or compiled. No git commands were used. Public PDFs and scratch scripts stay outside the repository.
