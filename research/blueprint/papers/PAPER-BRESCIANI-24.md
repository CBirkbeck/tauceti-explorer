# Bresciani: birational lifting and section specialization

Codex — session `codex-c83e7a`, issue #1233, 2026-09-23. Continues PR #1924
by codex-hjdg0j and the earlier checkpoints. **Status: partial.**

This continuation supplies an explicit local analytic proof of the finite-K/Qp
Mattuck input used in Lemma 8, its finite-torsion consequence, and the ensuing
Tate-invariant and H1-injectivity arguments. It identifies the existing owners
of the generic logarithm and analytic-point constructions. The unresolved
parabolic reduction is retained; no claim that Theorems A–C are false is made.

There are now 168 items: 10 library, 9 planned and 149 missing, with every
missing item routed exactly once. Fourteen routes comprise eight source routes
and six Part II routes. The two newly referenced Part II IDs are existing
Caro–Pasten and Howe–Klevdal proposals. The five new constructions have 15 API
statements and 15 mathematical test contracts. The older prose API outlines
remain an explicit granularity task, not a claim of blueprint closure.

## Source scope

All 22 pages of the [published Bresciani paper](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf),
pp.129–150, were reread, including every proof, footnote and reference. Its
SHA-256 remains `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148`.

The [Mattuck scan](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf)
has SHA-256 `9d950c3d86f8c8cf1949ec34b42eff49a8f73cbebf199ccfbf01bc6dcd745f94`.
This pass read published pp.92–100 and 111–119, including the full printed proof
of Theorem 7 on pp.114–117 and its subsequent remarks. Page 114 was also viewed
as an image. Pages 101–110 were not read in this continuation. Mattuck proves
the result more generally over complete ultrametric characteristic-zero fields
and uses a Jacobian embedding. The replacement below proves the finite-K/Qp
case that Bresciani needs, with its own dependencies stated.

The January 2, 2022 author revision of
[Milne's Abelian Varieties](https://mail.jmilne.org/math/xnotes/AVs.pdf),
SHA-256 `bffdf81c57c77420b5454b31270007989d12f332abea62424be15c424079fc7c`,
was read on p.1 and throughout pp.9–12, including the complete projectivity
proof and symmetric ample-line-bundle consequence. This is a selected reading
of the 49-page revision. The inaccessible current `www` endpoint and the
downloaded but unread 1986 scan are not represented as additional readings.

## A local logarithm with a controlled radius

Fix a finite extension K/Qp and use the maximum norm on K^g. For a commutative
analytic group, coordinates at the identity give convergent series

`F(X,Y)=X+Y+O(2)`, `P(X)=[p](X)=pX+R(X)`.

Shrink to a closed ball B_r with radius in |K×| on which multiplication and
inverse are defined and preserve the ball. Convergent-series coefficient
bounds give one C such that, for every s≤r,

`|R(x)| ≤ C|x|²`, `|R(x)−R(y)| ≤ Cs|x−y|` on B_s.

The same quadratic bounds hold for F−X−Y. Choose r even smaller so that
ε=Cr/|p|<1. This works for every p, including 2, and every ramification index.
The linear term strictly dominates the remainder, so

`|P(x)−P(y)|=|p||x−y|`.

These bounds follow by factoring monomial differences and using the
ultrametric inequality. They are bounds in the weighted Gauss norm as well
as bounds on evaluated functions; that distinction controls analytic limits.
The fixed-radius Banach algebra is the existing
LocallyAnalyticDistributions:L0 supplier.

Define `L_n=p^(−n)P^[n]`, with superscript [n] denoting n-fold composition.
Then

`L_(n+1)−L_n = p^(−n−1) R∘P^[n]`,

whose norm at x is at most C|p|^(n−1)|x|². The Gauss-norm bound tends to zero,
so the sequence converges in the complete analytic Banach algebra to L.
Its constant term is zero and its linear term is identity. This does not
infer analyticity from pointwise convergence.

Commutativity makes P^[n] a homomorphism for F. Thus

`L_n(F(x,y))−L_n(x)−L_n(y)`

has norm at most C|p|^n max(|x|,|y|)². Its limit is zero, proving that L
intertwines the group law and addition. The telescoping differences have
Lipschitz constants at most Cr|p|^(n−1); hence h=L−id is ε-Lipschitz.
The strict inequality ε<1 gives

`|L(x)−L(y)|=|x−y|`.

For every y∈B_r, the map x↦y−h(x) preserves B_r and contracts. The pinned
`ContractingWith.exists_fixedPoint'` supplies its fixed point, which solves
L(x)=y. Isometry makes the inverse continuous. Applying the same iteration
inside the vector-valued Tate algebra yields an analytic inverse: the
coefficient bound gives the contraction for substitution in the Gauss norm,
and completeness supplies a convergent series. This is also compatible with
the analytic inversion theorem on Mattuck pp.97–98.

The resulting normalized germ is the already planned formal logarithm, not
a second object. Compose two normalized logarithms with an inverse; their
comparison is an additive characteristic-zero formal map, hence linear by
comparison of mixed coefficients. Its derivative is identity, so it is the
identity. No large-prime full-residue-disc assertion is used.

The p=2 distinction matters: in the multiplicative coordinate x=u−1,
F(x,y)=x+y+xy and x=−2 represents the torsion unit −1. The ball 2Z2 contains
it and cannot admit an injective logarithm. A smaller ball such as 4Z2 does.
Neither good reduction nor an integral model of A is needed for the identity
chart over K; arbitrary reduction is retained.

## From the local subgroup to the cohomology injection

For A/K smooth of dimension g, a standard smooth presentation and an analytic
implicit-function theorem supply an identity chart. Algebraic multiplication
and inverse become analytic there. The pinned strict inverse-function
construction provides the underlying local homeomorphism, while the analytic
comparison is a separate geometric supplier. Pulling B_r back to A(K) and
then applying L gives an open subgroup U≃O_K^g after scalar rescaling.

Compactness is proved separately. A(K) is projective by Milne Theorem 7.1.
For P^N(K), normalize a coordinate of maximal absolute value to 1; finitely
many copies of compact O_K^N cover its K-points. A projective closed subvariety
has a closed K-point locus, hence is compact. The cosets of U therefore have
a finite subcover, so [A(K):U] is finite. Since U is torsion-free, A(K)_tors
injects into the finite quotient. This does not equate its order with the
quotient's order.

Milne's field projectivity input uses the theorem of the square to construct
very ample divisors and descends a sum of conjugates from a finite extension;
tensoring with the pullback under [−1] gives a symmetric ample line bundle.
Its square, divisor-descent and very-ampleness suppliers remain explicit
blueprint leaves. No relative projectivity theorem over arbitrary bases is
asserted.

Let N annihilate the finite torsion group A(K)_tors. For a compatible family
a_n∈A[n](K), compatibility gives a_n=N a_(Nn)=0. Hence (TA)^G_K=0.
Finiteness of each individual A[n](K) would not suffice: the inverse system
Z/p^n with reduction maps has the nonzero compatible family 1.

Finally consider `0→TT→TJ→TA→0`. If a continuous TT-valued cocycle c dies in
H1(K,TJ), write c(σ)=σj−j for j∈TJ. The image of j in TA is invariant, hence
zero. Exactness puts j in TT, so c is already a TT-coboundary. This proves
the desired H1 injection directly. No unchecked inverse limit of long exact
cohomology sequences is needed.

## Ownership and verification

The local-points continuation retains only the abelian-variety application,
finite index and finite torsion. Its generic logarithm supplier is the
existing `AbelianSchemesAndArithmeticModuliPartIIFormalLieTheory` proposal
from Caro–Pasten. The generic smooth-point chart and projective compactness
use the early interfaces of Howe–Klevdal's existing
`AdicSpacesPartIIRigidZariskiGeometry` proposal. The finite-radius Banach
algebra stays in LocallyAnalyticDistributions:L0; field projectivity is a
source refinement of AbelianSchemesAndArithmeticModuli A1/A2. These pending
Part II interfaces are marked missing, not accepted planned stages.

The complete current abelian-scheme, adic Part II and locally analytic
distribution owner documents were read, along with the relevant candidate
briefs and AUDIT-08 A1/A2/A4 and AUDIT-25 L0. All eight inherited library
statements were reread at the pins, plus the two new fixed-point/inverse
inputs. The existing Lie exponential is over real normed spaces and does not
provide this p-adic logarithm. Earlier full upstream JacobianChallenge and
GlobalNumberFields readings retain their original provenance; a partial
LieGroups reread is not counted as a new complete reading.

The paper checker and three-file intake check passed. The custom audit checks
168 unique items, 34 explicitly recorded acyclic edges, one route per missing
item, preservation of all earlier IDs/findings, and the five new structured
API/test/use contracts. The edge count does not claim that all older prose
dependencies have been converted to graph edges.

Exact diagnostics passed 5,752 assertions: multiplicative-law iteration,
valuation bounds, finite-precision bijections on small balls, the 2-adic
torsion boundary, and countertests for missing Tate-invariant hypotheses.
These computations are not Lean proofs or geometric verification. No Lean
file was written or compiled.

The four recorded gaps retain the parabolic proof problem and other source
readings, and explicitly isolate the new supplier and inherited API closure
work. The seven earlier source findings remain unchanged, with no new
independent-review verdict. Current publisher/arXiv/correction searches found
no main-paper correction; no authors were contacted.

Ownership input snapshot: `5c2f7e81c0b65adb77ea28915eb921e23ba06a69`, 497 verified files.

## Retained mathematical detail and earlier reading provenance

The following material is retained from PR #1924 and its predecessor, with
their worker/date attribution. Its statements that Mattuck preparation remains
open are superseded by the decomposition above; recursive supplier closure
still remains open. Its source-access claims describe those earlier reads.

## Endpoints and hypotheses

Birational lifting means lifting a curve section to its function-field absolute Galois group. The **t-birational** condition requires this after base change to `k(t)`. Birational sections do not automatically base change to transcendental extensions.

Theorem A states that over fields finitely generated over Q, a section is geometric or cuspidal exactly when it is t-birationally liftable. Proposition 17 supplies the central rationality argument: a suitable lift through a pro-open diagonal complement gives a k-rational associated local point on `A1 minus {1,2}`. The change `y ↦ t−y`, Kummer theory and completed valuations force degree one for that point's minimal polynomial.

Theorem B quantifies over **every finitely generated extension K/k** of the field of a fixed hyperbolic curve. It equates universal geometric-or-cuspidal sections with universal birational lifting. Globally it proves equivalence of the section and cuspidalization conjectures, not their truth.

Theorem C equates the ordinary birational section conjecture with existence of sections on `(U×V) minus Δ` over V having prescribed specializations, for every number field, every birational P1 section and every nonempty open U. Hilbertian uniqueness makes the lifts compatible. Saïdi–Tyler's ordinary birational reduction is separate from Bresciani's quasi-t-birational reduction.

## Correctness findings

**Routed negative acceptance `/77`: the affine-parabolic assertion is false as printed.** Take `k=Q`, `barX=P1`, and remove the closed point defined by `T²−2`. The resulting X is smooth affine geometrically connected, with genus-zero completion and boundary degree two, hence parabolic. The point `0∈X(Q)` induces a geometric section. Its boundary has no Q-rational point, so there is no cuspidal section under the paper's definition. The projective completion is already split. Schmidt's actual Theorem A gives splitting and rational points, which does not make a deleted degree-two point rational. The claimed trivial parabolic reductions in Lemma 16 and t-b.l.⇒quasi-t-b.l. need a valid replacement argument. No replacement proof is claimed.

**Base change `/26`: use A.23, not A.18.** In the [published 2021 dependency](https://algebraicgeometry.nl/2021-2/2021-2-005.pdf), A.18 (p.262) concerns algebraic separable extensions; A.23 (p.264) concerns arbitrary extensions in characteristic zero for geometrically connected concentrated fibered categories. The latter is needed for `k(t)`. Both published statements were checked.

**Lemma 26 `/127`: omit the point before using cuspidal packets.** The image of a birational section on an open containing its associated rational point can be geometric. After identifying that point, use the cofinal opens omitting it. Stix Theorem17(1) gives cusp uniqueness, (2) packet injectivity and (3) disjointness from geometric sections, under the hyperbolic-curve and proper-section-injectivity hypotheses.

**Resolved `/58`: retain the Albanese torsor.** The proper pointed Jacobian construction does not supply the affine unpointed comparison in Lemma 8. The comparison is now established below using Spieß–Szamuely's curve specialization, Harari–Szamuely's arithmetic torsor interpretation, and Bresciani's band construction. The loop supplies a rational gerbe object and hence a neutralization; it does not supply a rational point of the curve or its Albanese torsor.

**Replacement proof closes `/29`.** Anderson Proposition5 has not been acquired, and the author/published goodness numbering remains unchecked. Neither is needed for the direct split-extension argument below. IG.1 owns the affine-curve application and imports a new generic completion Part II. No statement about arbitrary left exactness is made.

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
| Part II | Profinite and pro-p groups | Exactness of profinite completion for split extensions |

The new anabelian direction imports NC.0. NC.1's Mochizuki reconstruction and NC.2–NC.5's unipotent theory are different endpoints. Betts–Stix's period-map continuation is a sibling, not a supplier of these results.

Upstream JacobianChallenge explicitly excludes unpointed Pic1/Albanese torsors from its proper pointed v1. Generic semiabelian schemes remain in **ShimuraCompactifications C4**; the open-curve construction imports them. NeronModelsAndSemistableAbelianVarieties R11.4 instead treats nodal degeneration fibers. `/58`, `/150` and `/151` now belong to the generalized-Albanese Part II; generic neutralization `/152` belongs to SchemeAndStackFoundations SF.1.

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

The exact Stix book passages, Tamagawa's original proposition, Koenigsmann's original theorem and the larger prerequisite proof decompositions remain source tasks. Borne–Vistoli Definition3.4 and Propositions3.9–3.11 have now been read directly. Anderson is historical provenance for the original proof, not a dependency of the replacement proof.

## Earlier-checkpoint validation

The paper checker and intake `check-files` are run on the JSON, this report and the handoff; a custom audit checks IDs, statuses, routes and stage existence. No Lean file was requested or supplied; no Lean compilation was run. Preserve `partial`: these routes are checkpoint proposals, not ready for completed-job review or promotion.


## Continuation: split completion and finite gerbe presentations

This section records the new work of session codex-a71f92. Earlier source-ledger entries describe the inherited reading and are not claims that every prerequisite has now been fully reread. All 22 pages of Bresciani's published text, including every proof, were reread in this continuation.

### A direct proof of the completion step

The statement needed for Lemma 1 is considerably narrower than exactness for arbitrary extensions. Work first with abstract groups. Suppose G=N⋊H, where N is finitely generated and H is arbitrary.

1. Given a finite-index subgroup K of N, put n=[N:K]>0. Let C_n be the intersection of **all** index-n subgroups of N. There are only finitely many such subgroups: give N the discrete topology, use abstract finite generation to obtain topological finite generation, and apply the existing positive-index open-subgroup theorem. Thus C_n has finite index, lies in K, and is characteristic because every automorphism permutes the index-n subgroups. In particular it is normal.
2. H therefore acts on the finite group N/C_n. Let Q_n be the finite image of H in Aut(N/C_n). There is a surjective homomorphism
   G → (N/C_n)⋊Q_n, (a,h) ↦ (a mod C_n, action(h)).
   Its restriction to N has kernel C_n. This constructs finite quotients of G whose restriction kernels are cofinal among finite-index subgroups of N.
3. Consequently the map of completions hat N→hat G is injective. To see this without assuming N residually finite, separate two distinct completion points by a finite quotient N/K, choose C_n≤K, and use the extending quotient from step 2. The compact-to-Hausdorff injection is a topological embedding.
4. For **any** normal N in G, set L=closure(image(N→hat G)). The quotient hat G/L is profinite and has the universal property of hat(G/N): maps into a profinite P correspond precisely to homomorphisms G→P killing N. Thus the completed quotient map is surjective with kernel L. The compact image of hat N is exactly L. This is right exactness, not injectivity.
5. Extend the original section H→G to hat H→hat G by the completion universal property. Its composition with the quotient is the identity, checked on the dense unit image. Steps 3–4 identify its closed normal complement with hat N. Conjugation supplies the continuous action of hat H on hat N; the multiplication map gives the topological semidirect-product isomorphism. No independently constructed topology on Aut(hat N) is needed.

In the complex affine-base curve-family application, the base has the homotopy type of a finite wedge of circles. Its fundamental group is free and its second homotopy group vanishes; the fiber group is finitely generated. The homotopy sequence is short exact, and the free quotient splits by choosing preimages of its free generators. This is an **abstract group section**, not a rational or continuous geometric section of the family. Applying the preceding theorem proves the completion step of Lemma 1. Curve topology, local triviality of the family, Riemann existence, descent from C and passage to localized bases remain the separate IG.1 obligations already recorded in /27–/30.

The general theorem assumes neither residual finiteness nor goodness, and does not require H finitely generated. It does require a split extension and finite generation of N. The ordinary profinite completion used here must not be confused with /18's completion by power quotients: for a general abelian group those quotients need not be finite.

### A sharp negative test

Let N be the direct sum of C2 indexed by Z, with basis e_j, and let the shift generate H=Z. Let K be the kernel of the coordinate-zero character N→C2. In any finite quotient of N⋊Z, the image of the shift has some positive finite order t, so e_0 and e_t have the same image. Therefore e_0+e_t is in the restricted kernel but not in K.

No restricted finite-quotient kernel is contained in K. If hat N→hat G were injective, compactness would make it an embedding; the induced profinite topology would then supply such a restricted open neighborhood inside K, a contradiction. Thus completion fails to be injective even for this split extension when finite generation of N is removed. The original abstract inclusion remains injective. Item /146 is this valid negative theorem, not a purported counterexample to the finitely generated result.

### Baseline and ownership

The following actual statements were read at the pins, not inferred from declaration names:

- Tau Ceti Completion.lean: continuousMonoidHomEquiv (39), continuousMonoidHom_ext (66), and the finite quotient coordinate API. The whole file was read; the adjunction uses G and P in the same universe.
- Tau Ceti Group/Generation.lean: isTopologicallyFinitelyGenerated_of_fg (82).
- Tau Ceti Group/OpenSubgroup.lean: finite_openSubgroup_index_eq_of_ne_zero (71), including its proof. Unlike the later all-index version, it needs no compactness.
- Mathlib GroupTheory/Index.lean: finiteIndex_iInf (771).
- Mathlib FreeGroup/Basic.lean: lift (678), evaluation on generators and uniqueness.
- Tau Ceti Profinite/Basic.lean: instTotallyDisconnectedSpace for a quotient by a closed normal subgroup (236).

The four inherited library items were rechecked at their actual source statements: fpqc/fppf sites, stack descent, the abelian-variety carrier and compact cofiltered-limit nonemptiness. None supplies arithmetic fundamental gerbes or the section conjecture.

The complete upstream ProfiniteProPGroups document was read. AUDIT-22's Layer0 and Layers3–5 records were inspected. The library already supplies most of Layer0 and the finite-subgroup counts in Layer3; Layer5 discusses continuous profinite extensions, not the new completion-exactness statement. The new route is therefore **Profinite and pro-p groups, Part II: exactness of completion for split extensions**, parent tauceti:TauCetiRoadmap/ProfiniteProPGroups, in the group-theory galaxy. It owns /140–/146 only. Its brief imports the parent first, reuses /136–/139, and exports the theorem to the geometric application /29 in IG.1. It does not re-plan upstream, create a second completion, or take ownership of curve topology. Existing reservations for profinite arithmetic, powers and topological Aut/Out remain untouched.

The full parent AnabelianGeometryAndNonabelianChabauty, AbelianSchemesAndArithmeticModuli and FaltingsFinitenessAndIsogenyTheorems documents were also checked, together with the relevant NC.0, A3–A4 and R28.4 audit rows. The full JacobianChallenge document and the IG/SF/R02 source-owner descriptions were read in this claim/session. A3/A4 do not supply generalized open Jacobians; R28.4's rational comparison does not silently settle the integral/all-prime statement. The existing nine routes otherwise retain their boundaries. Current-main relevant atlas rows were compared with the local baseline at claim time.

### Direct verification of the gerbe input

Borne–Vistoli's published Definition 3.4 defines local fullness by faithful flatness of automorphism-group maps at field-valued objects. Proposition 3.9 gives canonical locally-full/faithful factorization. Proposition 3.10 identifies local fullness with surjectivity of fpqc Isom sheaves and with being a relative gerbe. Its factorization-proof paragraphs have a numbering typo: the argument concerns condition (4). Proposition 3.11 detects local fullness on a cofiltered target presentation, using the filtered colimit of the injective Hopf-algebra maps.

These statements and proofs were read directly. The extraction now separates the relative-gerbe theorem /35, factorization /147, limit detection /148 and finite-image refinement /149. For /149, replace each finite stage by the canonical image of the projection from the profinite gerbe. After a common fpqc neutralizing field extension this is the usual finite-image refinement of a profinite group presentation; the original and refined limits agree. Canonical factorization permits descent. A locally full map of finite étale gerbes is locally B ker(G→H), so is a proper étale relative gerbe. General affine-gerbe theory stays in SF.1.

This does not settle /58: the loop supplies a section neutralizing the abelianized gerbe, but the Galois-equivariant identification of its band with the generalized Jacobian Tate module, and the unpointed Albanese-torsor comparison, still require precise construction/source closure. No rational point of the curve or of the Albanese torsor is inferred from that gerbe section.

### New source ledger

Access date: 21 September 2026.

- [Bekka, arXiv:2305.04803v1](https://arxiv.org/pdf/2305.04803v1), SHA-256 c6bbcc281e33c4d4e90b3f2b53c1975a1243a8cf7e9fb9686a30088192770b17. Read the introduction pp.1–5, Proposition6(ii) with its full proof pp.9–10, and CorollaryC proof §4.1 p.15. CorollaryC independently states the split-completion endpoint. The representation-theoretic proof of TheoremB is not a claimed fully read input: the direct proof above avoids it.
- [Borne–Vistoli, Fundamental gerbes, published PDF](https://msp.org/ant/2019/13-3/ant-v13-n3-p01-s.pdf), SHA-256 64fca3767f3c6cbd02fbf84f1fb456c7fda30c7bc95ddc8c8c84cd3bd8629111. Read §3's relevant affine-gerbe setup, Lemma3.3, Definition3.4, Remarks3.5–3.7, Definition3.8 and Propositions3.9–3.11 with proofs, pp.537–541. Not a claim to have read all 46 pages.
- The Stix book's publisher endpoint returned HTML, not the requested PDF. Its table of contents was inspected, but Proposition75 and Lemma259 were not acquired or verified. This remains an explicit source task. No new access to Anderson is claimed.

### Checks and remaining work

The preceding continuation preserved the original 135 IDs and extended them through `/149`. The present continuation preserves all 149 inherited IDs and adds `/150`–`/152`: 8 library/8 planned/136 missing, with exactly one route for every missing item. Ten routes comprise six source routes and four Part II briefs. The compact finite regression below is retained and rerun; it tests finite formulas only, not the infinite or geometric theorems. No Lean code was requested, generated or compiled.

The checkpoint stays partial. The nonsplit degree-two boundary in /81 and /96 remains a real proof-repair task; routing the valid /77 counterexample does not discharge it. TheoremA is not claimed disproved. `/58` is resolved below. Complete the specified Stix/Tamagawa/Koenigsmann passages, Mattuck's proof and general analytic supplier, and the other prerequisite decomposition before declaring source closure.

The earlier split-completion finite regression remains attributed to that checkpoint; it was not rerun in this continuation.

## Continuation: the Albanese torsor comparison

Session `codex-hjdg0j`, 22 September 2026. This section supplies `/58` and records precisely what was checked. It does not close the unrelated parabolic reduction.

Let X/k be a smooth geometrically connected curve in characteristic zero, C its smooth proper completion, D=C−X with reduced structure, J its generalized Jacobian and a:X→P its generalized Albanese torsor. P is a J-torsor. The natural comparison is with P, before any neutralization.

1. **Geometric comparison `/150`.** In Spieß–Szamuely, *On the Albanese map for smooth quasi-projective varieties*, arXiv:math/0009017, Proposition 4.1 and its proof (pp.8–9) give the finite-coefficient comparison; Proposition 4.3 and its proof (p.10) give the exact sequence from the tame abelian fundamental group to the full Tate module. In characteristic zero all covers in question are tame. Its finite kernel is dual to the torsion of NS(C)/⟨boundary divisor classes⟩. Over the algebraic closure, NS(C) is Z via degree. With empty boundary the quotient is Z; with nonempty boundary a boundary point has degree one, so the quotient is zero. In either case the torsion vanishes. Thus the Albanese map induces π1(X_bar)^ab≃TJ_bar. This argument is specific to curves: the kernel cannot be discarded for arbitrary varieties.
2. **Descent and the torsor.** The morphism a is defined over k and induces Π_X/k^ab→Π_P/k. Check its equivalence after separable closure using step 1 and then descend full faithfulness and essential surjectivity. Harari–Szamuely, *Galois sections for abelianized fundamental groups*, §1 and the proof of Proposition 2.2 describe the arithmetic comparison with the Albanese torsor; Remark 2.4 explicitly extends it to the generalized semiabelian Albanese torsor for smooth quasi-projective varieties. That remark cites the **published Proposition 4.4** of Spieß–Szamuely; the downloaded arXiv version numbers the relevant result **4.3**. These locators must not be interchanged.
3. **The canonical band `/151`.** Bresciani, *Essential dimension and pro-finite group schemes*, arXiv:1904.00789v2, Lemma 5.8 and its proof (pp.19–20), construct the gerbe Ψ_n of liftings of P along [n]:J→J. Its band is J[n]. The tautological trivialization over P gives compatible maps P→Ψ_n. The resulting Π_P/k→lim_n Ψ_n is an equivalence, checked after a splitting extension. Its band is TJ. Translation changes a splitting point but acts trivially on this commutative band. This construction does not claim P(k) is nonempty.
4. **Neutralization `/152`.** For an fpqc gerbe G and s∈G(k), the functor x↦Isom(s,x) identifies G with B_k Aut(s). Isom(s,x) is locally a simply transitive torsor. Conversely twist s by an Aut(s)-torsor and descend the local copies of s and their arrows. These constructions are mutually inverse; s goes to the trivial torsor. For a commutative band the identification of Aut(s) with the band is unaffected by inner conjugation. Keep the fpqc topology when the group is profinite.
5. **The object actually supplied in Lemma 8.** Set s=γ(*) using the trivial torsor * of B_k Zhat(1). Its images s_ab and a(s) neutralize Π_X/k^ab and Π_P/k. The band of the latter is TJ by step 3, so γ induces the required Galois-equivariant homomorphism Zhat(1)→TJ. The same argument for the abelian quotient gives TA. This proves the interface used for the weight argument and the TT→TJ cohomology comparison. No rational point of X or P was selected.

Useful acceptance cases are: D empty and J the proper Jacobian; X=Gm with P and J trivialized by 1 and Tate module Zhat(1); three punctures on P1 giving rank two; and an unpointed curve, where P must remain a torsor until the gerbe object is chosen. Neutrality of its fundamental gerbe alone is not a claim that P is a trivial J-torsor. The exact sequence of generalized Jacobians, the band construction and generic gerbe neutralization have distinct suppliers, so this argument creates no duplicate foundational carrier.

The extra source reading does not certify every theorem used by those sources. In particular, the Picard 1-motive and duality inputs in Spieß–Szamuely Proposition 4.1 still require decomposition in the supplier blueprint. Lemma 5.17 of Bresciani's essential-dimension paper was also inspected, but its general torsion-kernel formulation was not substituted for the precise open-curve calculation above.

### Arithmetic finite-cover detection in Lemma 8

Item `/54` now records the arithmetic cover rather than an arbitrary geometric cover. Write the arithmetic group as E=G⋊s(G_k) using s=γ(*), and let f:Zhat(1)→G be the associated nontrivial equivariant homomorphism. The geometric curve group G is topologically finitely generated. Choose a characteristic open N⊂G detecting f; intersections of all subgroups of a fixed index provide cofinal such subgroups. The cyclic image C of f in G/N is s(G_k)-stable. Its inverse image H⊂G therefore gives E′=H⋊s(G_k), an open subgroup of E projecting onto G_k. It corresponds to a geometrically connected finite étale cover and contains the whole loop and the chosen section. H→C detects f in H^ab. Since the map on local section classes for a finite étale cover has finite fibers, the loop's finite local-image hypothesis survives. This is the missing arithmetic justification for the cover chosen in the printed proof.

### Source issues and corrected statements

The extraction now contains the `sourceIssues` required by §18. E1–E3 retain the identifiers already used by the separate errata job, with fresh checks against the published PDF. They record the arbitrary-base-change reference, the false parabolic sentence, and the cofinal-open correction in Lemma 26. This is incorporation of source findings, not an independent review of that job; its files and verdicts are untouched.

E4 records the absent torsor/neutralization choice in Lemma 8 and the repair above. E5 records the monic-polynomial qualification in Lemma 9, already used in `/66` but previously absent from the source-issue list. For the latter, R=Q[u]_(u), qbar=T and q=uT²+T give an explicit diagnostic. The factors T and uT+1 are comaximal, since (uT+1)−uT=1. Consequently R[T]/q≃R×R[1/u]=R×Q(u). Its second factor contains 1/u, which has negative valuation and is not integral over the DVR R, so the algebra is not finite over R. A monic same-degree lift has no extra generic component; irreducible separable reduction then gives the finite étale local algebra required by the argument.

E6 corrects the book reference in the opening of §6 to the density theorem used in Lemma 16. E7 concerns the dependency arXiv:1904.00789v2: the last sentence of the proof of Lemma 5.8 prints the semiabelian variety where its full Tate module is intended; the lemma statement and preceding construction already identify the correct band. The finding is limited to that version, without an unverified assertion about the published edition.

The publisher article, Crossref update relations, latest arXiv version and author institutional publication list were checked for corrections on 22 September 2026. No correction was located in those searches. The paper's v3 and published versions share the six inspected passages. An absent update relation is not evidence that no correction exists elsewhere.

### Reading provenance and verification

All entries below were fetched and inspected on 22 September 2026. Source files remain outside the repository.

| Source and inspected portions | URL | SHA-256 |
|---|---|---|
| Bresciani, published pp.129–150, entire text and proofs; pp.138/140 also visually checked | [Published PDF](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148` |
| Bresciani, v3, the six source-issue passages | [arXiv v3](https://arxiv.org/pdf/2108.13397v3) | `e23989fbac0cb38646d34a69f8c724611fd1f46a371122197e25f83f18cbb722` |
| Bresciani, essential dimension, Lemma 5.8 with proof and Lemma 5.17 | [arXiv v2](https://arxiv.org/pdf/1904.00789v2) | `ebd07168cf1f4788148a76fe5536fbdd35fc4994b38427bb7f23854d117c4427` |
| Bresciani, implications, A.18 and A.23 with the latter's proof | [Published dependency](https://algebraicgeometry.nl/2021-2/2021-2-005.pdf) | `768ca87a4659e905b2ae938db90a8224569de1776de6bc6aff05897a39372908` |
| Harari–Szamuely, §§1–2 comparison passages, Proposition 2.2 proof, Remark 2.4 | [Author PDF](https://pagine.dm.unipi.it/tamas/bash5.pdf) | `d03480351f96538230d37f23eeab59ee173cae5fa557004628a042398b63f8b2` |
| Spieß–Szamuely, §4 Propositions 4.1/4.3 and proofs, pp.8–10 | [arXiv PDF](https://arxiv.org/pdf/math/0009017) | `41844e2c52b48d8b0c90a113bfec455aa29966969cfd4fa48b8672d95a62144b` |

Read the upstream JacobianChallenge and GlobalNumberFields documents, the parent anabelian and abelian-scheme documents, and the precise C4/R11.4 neighboring layers. Rechecked reviewed audit entries SF.1, NC.0 and A4. Searched both full pinned library trees for Albanese, generalized Jacobian, fundamental gerbe and Tate-module carriers; the only relevant Albanese hit was a comment in the existing abelian-variety Hom-group API, which does not provide the construction. The eight inherited library-item statements were read again in their pinned source files. Searches of new roadmaps, packets and integrated decompositions did not supply the missing unpointed open-curve comparison.

Validation: `scripts/check_paper.py`, intake `check-files`, exact route/ID checks and `git diff --check`. The earlier finite regression is rerun unchanged. There is no suggested Lean file for this paper job and no Lean compilation claim. The JSON remains `partial` because the parabolic argument and named source tasks are still open, despite complete routing of the extracted items.
