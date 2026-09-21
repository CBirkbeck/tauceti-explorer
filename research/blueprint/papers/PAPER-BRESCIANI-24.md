# Bresciani: birational lifting and section specialization

Agent: Codex. Session: `codex-c83e7a`. Issue: #1233. **Partial checkpoint.**

The published paper was read completely. The extraction contains 135 items: 4 library, 8 planned and 123 missing. Of the missing items, 120 have exactly one proposed route; three remain unrouted. A false preliminary sentence about affine parabolic curves is the main correctness obstacle. This does **not** establish that the main theorem is false.

## Source

Giulio Bresciani, *On the birational section conjecture with strong birationality assumptions*, Inventiones mathematicae 235 (2024), 129–150, [DOI](https://doi.org/10.1007/s00222-023-01220-6). The [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) was fetched on 21 September 2026 at 17:48 UTC: SHA-256 `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148`. Online publication: 26 September 2023. The institutional endpoint failed; the publisher PDF succeeded. ArXiv v3 was downloaded but is not the source of record.

Read all 22 published pages, pp.129–150: introduction, §§2–7, every numbered result, Theorems A–C, all proofs, footnote 1 and references. The parabolic paragraph on p.141 was also inspected visually.

## Endpoints and hypotheses

Birational lifting means lifting a curve section to its function-field absolute Galois group. The **t-birational** condition requires this after base change to `k(t)`. Birational sections do not automatically base change to transcendental extensions.

Theorem A states that over fields finitely generated over Q, a section is geometric or cuspidal exactly when it is t-birationally liftable. Proposition 17 supplies the central rationality argument: a suitable lift through a pro-open diagonal complement gives a k-rational associated local point on `A1 minus {1,2}`. The change `y ↦ t−y`, Kummer theory and completed valuations force degree one for that point's minimal polynomial.

Theorem B quantifies over **every finitely generated extension K/k** of the field of a fixed hyperbolic curve. It equates universal geometric-or-cuspidal sections with universal birational lifting. Globally it proves equivalence of the section and cuspidalization conjectures, not their truth.

Theorem C equates the ordinary birational section conjecture with existence of sections on `(U×V) minus Δ` over V having prescribed specializations, for every number field, every birational P1 section and every nonempty open U. Hilbertian uniqueness makes the lifts compatible. Saïdi–Tyler's ordinary birational reduction is separate from Bresciani's quasi-t-birational reduction.

## Correctness findings

**Unrouted `/77`: the affine-parabolic assertion is false as printed.** Take `k=Q`, `barX=P1`, and remove the closed point defined by `T²−2`. The resulting X is smooth affine geometrically connected, with genus-zero completion and boundary degree two, hence parabolic. The point `0∈X(Q)` induces a geometric section. Its boundary has no Q-rational point, so there is no cuspidal section under the paper's definition. The projective completion is already split. Schmidt's actual Theorem A gives splitting and rational points, which does not make a deleted degree-two point rational. The claimed trivial parabolic reductions in Lemma 16 and t-b.l.⇒quasi-t-b.l. need a valid replacement argument. No replacement proof is claimed.

**Base change `/26`: use A.23, not A.18.** In the [published 2021 dependency](https://algebraicgeometry.nl/2021-2/2021-2-005.pdf), A.18 (p.262) concerns algebraic separable extensions; A.23 (p.264) concerns arbitrary extensions in characteristic zero for geometrically connected concentrated fibered categories. The latter is needed for `k(t)`. Both published statements were checked.

**Lemma 26 `/127`: omit the point before using cuspidal packets.** The image of a birational section on an open containing its associated rational point can be geometric. After identifying that point, use the cofinal opens omitting it. Stix Theorem17(1) gives cusp uniqueness, (2) packet injectivity and (3) disjointness from geometric sections, under the hyperbolic-curve and proper-section-injectivity hypotheses.

**Unrouted `/58`: retain the Albanese torsor.** The proper pointed Jacobian construction does not supply the affine unpointed comparison in Lemma 8. The loop gives a rational gerbe section, hence a neutralization, but its comparison with the generalized Jacobian's Tate module must be constructed. Do not assert a canonical pointed Jacobian gerbe beforehand.

**Unrouted `/29`: completion exactness needs its exact input.** Anderson Proposition5 has not been acquired. The 2007 author version of Grunewald–Jaikin-Zapirain–Zalesskii has surface goodness at Proposition3.6, whereas the published locator cited here is3.7. These facts do not by themselves prove that arbitrary profinite completion preserves exact sequences. Lemma1 also requires the affine/localized-curve base.

**Integral versus rational Faltings comparison `/110`.** The coherence argument uses completed integral Hom over a finitely generated field. Existing R28.4 explicitly plans the rational Q_l comparison. The stronger statement is therefore a missing source refinement of that layer, with integral saturation and field-scope obligations.

Other checks retain the restricted completed product in footnote1; the failure of unique-specialization⇒constant-loop; and density-one versus adelic integrality. Construct Corollary10's directed divisors by applying Lemma9 after removing the previous divisors: arbitrary intersecting finite unions need not be étale. Preserve monicity and degree in Lemma9's polynomial lift.

## Routes and ownership

The fresh atlas snapshot is `a92b3b71cc3b9ae610697abe3add3d2ff6d9e716`. Nearby full README documents, relevant reviewed audits, links and available integrated decompositions were inspected. All new definitions/constructions have API and test notes.

| Route | Owner | Scope |
|---|---|---|
| Source | SchemeAndStackFoundations SF.1 | Gerbes, classifying/root stacks, tame valuative and extension criteria |
| Source | InverseGaloisAndArithmeticFundamentalGroups IG.0–IG.1 | Fundamental gerbes of the existing finite-cover theory, family exactness and relative comparisons |
| Source | InverseGaloisAndArithmeticFundamentalGroups IG.2 | Hilbertian finite-cover criteria and nonthin generation |
| Source | ArithmeticGaloisDuality R02.1 | Compact Kummer theory, completed units/valuations and inverse-limit exactness |
| Source | SchemeAndStackFoundations SF.3 | Étale divisors, curve projections and the cover mapping to a constant elliptic curve |
| Source | FaltingsFinitenessAndIsogenyTheorems R28.4 | Integral/all-prime Hom comparison and finitely-generated-field scope |
| Part II | AnabelianGeometryAndNonabelianChabauty | Birational lifting, specialization, Proposition17 and TheoremsA–C |
| Part II | tauceti:TauCetiRoadmap/JacobianChallenge | Generalized Jacobians, Albanese torsors, full Tate modules and weight vanishing |
| Part II | AbelianSchemesAndArithmeticModuli | Mattuck's local subgroup and finite torsion |

The new anabelian direction imports NC.0. NC.1's Mochizuki reconstruction and NC.2–NC.5's unipotent theory are different endpoints. Betts–Stix's period-map continuation is a sibling, not a supplier of these results.

Upstream JacobianChallenge explicitly excludes unpointed Pic1/Albanese torsors from its proper pointed v1. Generic semiabelian schemes remain in **ShimuraCompactifications C4**; the open-curve construction imports them. NeronModelsAndSemistableAbelianVarieties R11.4 instead treats nodal degeneration fibers. Unresolved `/58` is excluded from the routed item list pending its source check.

A1–A6 has no Mattuck local-point theorem. Raynaud degeneration uniformization is a different result. The local-points Part II imports the existing abelian-variety carrier and exports finite torsion to compact cohomology. Its detailed logarithm/formal-group owner audit remains unfinished.

## Pinned libraries

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` full archives were searched. Relevant reviewed targets from AUDIT-01, -02, -08, -09 and -10 were read. Missing specialized arithmetic constructions were not inferred from a single name search.

Actual declarations read and cited:

- `AlgebraicGeometry.Scheme.fpqcTopology`, `fppfTopology`, `fppfTopology_le_fpqcTopology`: Mathlib `AlgebraicGeometry/Sites/Fpqc.lean`, lines53–83.
- `CategoryTheory.Pseudofunctor.IsStack`, `isEquivalence_toDescentData`: Mathlib `CategoryTheory/Sites/Descent/IsStack.lean`, lines49–73.
- `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`: Mathlib `Topology/Category/TopCat/Limits/Konig.lean`, line126.
- `TauCeti.AlgebraicGeometry.AbelianVariety`: Tau Ceti `AlgebraicGeometry/AbelianVariety/Basic.lean`, line94.

Abstract Galois-category prorepresentability was also read; it does not construct an arithmetic fundamental group. Existing sites, abstract stack descent and an abelian-variety carrier do not constitute geometric gerbes, root stacks or Tate modules.

## Dependency reading and provenance

All downloads are dated 21 September 2026. Only the listed portions count as read; the JSON prerequisite list supplies links and future proof-decomposition obligations.

| Source | Read | SHA-256 |
|---|---|---|
| Bresciani–Vistoli 2210.03406v1 | pp.3–4, root stacks/Theorem3.1 | `344e8988a7be217368f92fc01579e8fdfd2a81947dd5b0afb6ace6ae108eb149` |
| Bresciani, published AG8(2021) | Lemma6.5, start of Theorem7.2, A.18/A.23; supporting arXiv pp.14–15,17,34,36 | `768ca87a4659e905b2ae938db90a8224569de1776de6bc6aff05897a39372908` |
| Bresciani 1904.00789v2 | pp.27–28, maximal-open extension conditions | `ebd07168cf1f4788148a76fe5536fbdd35fc4994b38427bb7f23854d117c4427` |
| Bresciani 1911.03234v3 | pp.7–10, extension/coherence/finite and abelian reductions | `afb4928d25f9ab687c24621db5ca1b8f1e36ab5981205f52bce60b45f7ce11e6` |
| Stix 1203.3236v3 | pp.1–5, TheoremsA/B, local points and adelic definitions | `0a1cfac490f6543e5308a9489c13f1e398091b2db3e4ee127d0e64c6ef7f5146` |
| Stix, author cuspidal PDF | p.8, Theorem17 with hypotheses | `5bd02d94605289e8a2f74d408f5155c66d24bb4b3331a42d154e217ea998173d` |
| Mattuck original scan | p.114, Theorem7 | `9d950c3d86f8c8cf1949ec34b42eff49a8f73cbebf199ccfbf01bc6dcd745f94` |
| Schmidt 1503.08108v1 | pp.1–2, actual TheoremA | `50588809107082c3710fd614ba47eaf2b975bedb85d7d2153cab650dd3309ae2` |
| Saïdi–Tyler 1909.12099v3 | pp.1–2,4–5, TheoremC and outline | `0d6f716ec09b02edf64f8d318f821d76cec618417a367449886e11c952ee654f` |
| Grunewald et al., author 19Oct2007 | Lemma3.3, Proposition3.6 pp.6,8–9 | `7991e01ad4468cd96f5909b47d722e617b71c0c0f98546c3347f88a385104b16` |

Anderson, the exact Stix book passages, Tamagawa's original proposition, Koenigsmann's original theorem and the full Borne–Vistoli gerbe inputs remain source tasks.

## Validation

The paper checker and intake `check-files` are run on the JSON, this report and the handoff; a custom audit checks IDs, statuses, routes and stage existence. No Lean file was requested or supplied; no Lean compilation was run. Preserve `partial`: these routes are checkpoint proposals, not ready for completed-job review or promotion.
