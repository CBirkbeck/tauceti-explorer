# Geometric Satake over the Fargues–Fontaine curve: GS0–GS2

This document is the definitive mathematical plan for the first part of
`GeometricSatakeAndFusion`. It covers Beilinson–Drinfeld Grassmannians, early
Schubert smoothness, integral Witt geometry, semi-infinite geometry, relative
perversity, and convolution with duals. The packet beside this document records
the same declarations and their direct dependencies. The suggested Lean file
prototypes their algebraic and categorical interfaces against the pinned libraries.
Its comments specify which geometric hypotheses cannot yet be expressed.

The target-level pass is complete. Every target of the eight stages in scope is
planned, and none is closed. There are 59 nodes: 21 constructions, 2 definitions,
27 theorems, 8 comparisons and 1 application. The 23 objects have 71 API items and
69 unit tests. There are 25 planets, 29 pinned baseline declarations, 20 supplier
requests and 8 explicit gaps. Every implementation status is unchecked. Here
“planned” means that the target has a stated contract and its prerequisite chains
end in a library declaration, an existing roadmap node, a requested supplier
stage or a named gap. It does not mean that those suppliers are implemented or
that the suggested signatures prove the geometric theorem.

The second part owns symmetric fusion, tensor compatibility of the fibre
functor, rational Tannakian reductivity and dual-group reconstruction. They are
outside this document. Convolution closure and both duals precede symmetric
fusion: FS VI.8 proves them, and VI.9 uses them. The elementary two-leg collision
family in VI.8.1(ii) is an ingredient of the early closure proof and is included
here. It does not import the coherent symmetric fusion construction.

## Conventions and the library boundary

Fix a nonarchimedean local field E of residue characteristic p and a coefficient
prime ℓ different from p. Write O_E for its valuation ring. An integral reductive
model is fixed whenever a construction is made over integral divisors. A general
possibly ramified reductive group over E is handled on generic divisors by a
splitting extension and Galois descent; this does not produce a reductive O_E-model.
Parahoric and Iwahori integral models are distinct inputs. Their definitions,
root data, affine Weyl groups, Bruhat order, admissible sets and Kottwitz maps
belong to `ReductiveGroupsPartII:RG2.3`, `RG2.4` and `RG2.5`.

For an integral degree-d divisor D, B⁺_D and B_D are the completed and punctured
rings supplied by `RelativeFarguesFontaine:RF2:integral-divisors`. On the X version
of the divisor base use the affinoid basis on which D_S is affinoid. The ideal I
of the Cartier divisor is retained throughout finite congruence quotients. The
full positive loop group is an inverse limit. Finite jet quotients and its graded
pieces have finite cohomological dimensions; no finite dimension is assigned to
the whole inverse-limit group.

For a finite set of ordered legs, add their Cartier divisors. At a geometric
point with r distinct untilts there are r local factors, even when there are more
than r labelled legs. Bounds on legs with the same untilt add. The perverse shift
is the sum of the dimensions of these r local Schubert factors. On a single cell
labelled μ it is d_μ=⟨2ρ,μ⟩. This avoids counting a collision twice in the local
product while forgetting its summed relative-position bound.

A perfect-base GL_n Witt lattice Λ is an embedded finite projective W(R)-module
spanning W(R)[1/p]^n. Pole bounds are locally uniform. For a positive bound use
the quotient W(R)^n/Λ, whose determinant has the positive quotient convention.
Its geometric type is a sorted partition with fixed total length. Dominance is
equal total length together with all initial partial-sum inequalities; coordinatewise
comparison is different. Coordinate-ring perfection is the direct Frobenius
colimit. Mathlib’s `Perfection` is an inverse-limit construction and cannot supply
that interface. A pfp perfect scheme has finite-type models up to Frobenius, with
compatible dimensions and étale topoi supplied by SF.0.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed `AUDIT-21` entries of
`data/library-coverage.json` are the starting point. Their missing geometric
Satake targets are distinct from the abstract algebraic and categorical
substrates in those pins. The declaration statements cited below were inspected
at these commits. Witt vectors, ordinary module flatness, submodules, quotients,
t-structures and hearts, full subcategories, action categories and rigid categories
are reused. This part does not plan those notions again.

Tau Ceti’s `InvertibleSheaf` is the scheme line-bundle carrier, with its trivial
object. That carrier alone supplies neither positivity nor the needed Picard
tensor/descent calculus. Likewise the field-based `ReductiveAffineGroupSchemeCat`
does not provide an integral parahoric model, and `LeftRigidCategory` does not
assert right rigidity. The plan requests the missing interfaces from their owners.
The analytic scheme/adic comparisons are imported from L1/L3 and D6. Before
representability has been proved, a nonanalytic scheme-associated v-sheaf is not
called a diamond simply because its analytic restriction is one.

The initial coefficient setting is prime-to-p torsion, with compatible derived
adic systems supplied by L0. A Satake object is bounded, ULA, relative perverse
and coefficient-flat. Flatness means that derived tensor with every coefficient
module remains perverse. It does not follow from perversity or from a rational
cycle computation. The category of flat objects is used with its additive/exact
structure; it is not asserted to be abelian for integral coefficients. Rational
IC, decomposition and semisimplicity are imported where explicitly stated.

## Order of construction and ownership

The loop and torsor functors are constructed first using RF2’s existing completed
rings and bundle descent. RF4 supplies Beauville–Laszlo gluing for G-torsors and
the punctured A_inf extension used in the parahoric integral comparison. RF2’s
finite-projective completed-ring descent is cited by its existing node and is
not reconstructed under a different name.

Early generic bounded properness uses the generic divisor geometry. Integral
bounded properness also needs the special Witt fibre. It is therefore owned
only by GS0:Witt-geometry and follows the projectivity argument there; it is not
proved a second time in loop geometry. Smooth open-cell geometry is computed
from the opposite parabolic and finite congruence layers. The minuscule
Bialynicki–Birula identification matches the CS and FS sign conventions and
imports the period-sheaf connection and the finite-projectivity criterion where
its source proof needs them.

Witt projectivity follows the geometric determinant route of BS §§6–8. First
construct the filtration/Demazure resolution and prove connected cohomologically
trivial fibres. Descend the product of graded quotient determinants using the
supplier’s fibral line-bundle criterion. On fixed finite models apply the
Witt-specific positivity calculation and then Keel’s general criterion. SF.5
owns the general positivity vocabulary, exceptional locus, Kodaira decomposition,
Keel lemmas, Frobenius extension and Stein contraction. The two duplicate Keel
aliases in the routed paper extraction refer to that same supplier. GS owns the
application, not a second general positivity library.

One prerequisite of that induction needs a precise repair: before applying
Keel on the lower-bound union, construct its pfp proper representative using
closed intersections and finite pinching. This is an SF.1 request and a named
gap. The packet consequently does not treat the union’s representability as a
consequence of the very projectivity theorem being proved. Canonical weakly
normal models and the rank-two cone chart are separate source targets. Their
announced Hodge determinant comparison and corrected right-factor integrality
are stated as obligations. Normal/Cohen–Macaulay conjectures for nonperfect
canonical Schubert models are not assumptions of the established perfect-bound
projectivity target.

Semi-infinite strata and hyperbolic localization give normalized constant-term
functors. VS1 owns Braden’s comparison and the enhanced proper-relative ULA
kernel formalism. The Witt affine intersections, ULA criterion and one-leg
restriction comparison then supply the relative perverse structure. The early
scheme perversity/recollement supplier is EDC.5; EDC.4 is not its owner. GS1
receives L1/L3 directly for the scheme-to-v-sheaf comparisons. The lisse-category
stage VS3 is not needed for these torsion étale Satake constructions. EDC.7
occurs in the explicitly rational standard/costandard and weight refinements,
without being put in front of GS0 smoothness.

Finally define the full Satake subcategory and its total-cohomology fibre functor.
The semi-infinite filtration proves finite projectivity and exact faithfulness;
over a general leg base it does not give a canonical splitting or tensor
identification. Define convolution by the bounded proper Hecke correspondence.
EDS and VS supply coherent composition and the Ind extension, including the
associator, units and higher compatibility. ULA kernels compose, the elementary
collision family gives the nonpositive perverse bound, and duality supplies the
other aisle. Testing all coefficient modules proves flatness. Kernel adjunctions
then give evaluation and coevaluation with both triangle identities, and hence
both duals. Symmetry and the tensor fibre comparison have their specified owner
in the second part.

## Sources and passage ledger

The following public versions fix every locator. The listed passages were read
for the target pass; no claim of a full-paper reading is made beyond them. The
packet keeps the full SHA-256 values, source versions and short printed labels
identifying each declaration passage. Statements and proofs below are
paraphrased with the corrected hypotheses. Source findings remain candidates
for independent verification, with their original extraction provenance retained.

**FS-geometrization** — Laurent Fargues, Peter Scholze. [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; PDF page = printed page. Re-fetched and passages inspected 2026-10-07.

- VI.1–VI.8, printed pp. 190–226, including proofs.
- IV.2.23–IV.2.26, printed pp. 124–126; IV.6.1–IV.6.8 and IV.6.11–IV.6.14, pp. 155–159, 162–163.

**BS17-witt-grassmannian** — Bhargav Bhatt, Peter Scholze. [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/abs/1507.06490). arXiv:1507.06490v3, 61-page PDF; PDF page = printed page.

- §§2–4, 6–10 (geometric determinant route; §5 only a cited alternative), printed pp. 4–18, 21–39.

Publisher PDF endpoint returned an HTML paywall with access=No on 2026-10-07; final arXiv v3 is the source read. No published-text equivalence is asserted. The BS source findings are scoped to that final preprint.

**SW20-berkeley** — Peter Scholze, Jared Weinstein. [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Author-hosted Berkeley Lectures PDF dated March 27, 2020; PDF page = printed page + 10.

- Lectures 18–20, especially §§19.2–19.4 and 20.3–20.5; Lecture 21 §§21.1–21.5, printed pp. 191–197; Appendix 21.6 opening pp. 198–200.

**Zhu17** — Xinwen Zhu. [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Published Annals 185 (2017), pp. 403–492; PDF page = printed page − 402.

- §§1.1–1.4, 2.1–2.2, Appendices A and B, printed pp. 412–440, 464–488.

**CS17** — Ana Caraiani, Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Published Annals 186 (2017); PDF page = printed page − 648.

- §3 setup p. 675; §3.4 pp. 684–686.

**GLX26** — Ian Gleason, Dong Gyu Lim, Yujie Xu. [The connected components of affine Deligne–Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). Published Inventiones 243 (2026), pp. 805–861; PDF page = printed page − 804.

- §1.1 p. 806; §3.2–3.3 pp. 822–824.

**VH24** — Pol van Hoften. [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Published Cambridge PDF, PDF pages used as locators.

- §2.2.6–§2.2.15, PDF pp. 13–16 (Witt flags, admissible strata and torsor adapters).

**He21** — Xuhua He. [Cordial elements and dimensions of affine Deligne–Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf). Published Forum of Mathematics Pi 9 (2021), e9; PDF page = printed page.

- §2.2 p. 5; §§5.3–5.4 pp. 9–12.

The Keel paper is an SF.5 supplier source rather than a GS-owned general-theory source. The projectivity nodes read BS’s application and name the required Keel interface. BS §5’s higher K-theoretic determinant construction is an alternative to the geometric route and is not a prerequisite of that proof.

The `routedCoverage` ledger accounts for all 236 items handed to this job by the six routed papers. Its records retain the extraction item id, name and locator and name the covering node, supplier or part boundary. A source proof step shares its target’s node; it does not become a duplicate definition. The ledger is a coverage reconciliation, not acceptance of an extraction’s unverified implementation claim.

| Paper | Routed items |
| --- | ---: |
| PAPER-BHATT-SCHOLZE-17 | 95 |
| PAPER-CARAIANI-SCHOLZE-17 | 6 |
| PAPER-GLEASON-LIM-XU-26 | 2 |
| PAPER-HE-21 | 14 |
| PAPER-VANHOFTEN-24 | 7 |
| PAPER-ZHU-17 | 112 |

The two canonical-model conjectures and BS’s representation-theoretic open question retain their status. Alternative rational Chern-class and equivariant monoidality proofs are identified as alternatives, with their owning interfaces, rather than silently supplying an early geometric prerequisite.

## Coverage and acceptance

| Stage | Status | Remaining obligations |
| --- | --- | --- |
| `GeometricSatakeAndFusion:GS0` | planned | Resolve the SF/RF/RG supplier refinements inherited from the three substages. |
| `GeometricSatakeAndFusion:GS0:Schubert-smoothness` | planned | RG Lie-weight/parabolic computation and the CS finite-projectivity/period-sheaf supplier interfaces. |
| `GeometricSatakeAndFusion:GS0:Witt-geometry` | planned | Boundary pinching before Keel; corrected cone-factor integrality; sketch-only canonical Hodge determinant comparison.; Compatible bounded pfp flag models, local-model functoriality and componentwise adjoint fibre-dimension transfer. |
| `GeometricSatakeAndFusion:GS0:loop-geometry` | planned | RF4 torsor gluing/Anschütz extension and integral/parahoric RG refinements.; Exact geometric Lean signatures after supplier carriers are available. |
| `GeometricSatakeAndFusion:GS1` | planned | Model-dependent rational MV trace normalization and corrected quasi-minuscule/minimal-generation argument.; VS1 hyperbolic/ULA enhancement and EDS Ind t-structure extension. |
| `GeometricSatakeAndFusion:GS2` | planned | Resolve the coherent correspondence/stack-kernel refinements inherited from the two substages. |
| `GeometricSatakeAndFusion:GS2:Satake-closure` | planned | Proper-relative ULA evaluation/coevaluation with both triangle identities and the compatible one-leg comparison. |
| `GeometricSatakeAndFusion:GS2:correspondences` | planned | Enhanced associator/unit coherence and filtered finite-projective fibre comparison, with no canonical tensor splitting yet. |

Each layer is accepted only when its statements, hypotheses, direct dependencies, APIs and discriminating tests below agree with the specified sources. Closure additionally requires every named gap and supplier refinement to be resolved. The suggested file is a typed core prototype; narrowing away unsupported geometric hypotheses is recorded explicitly for each node and cannot satisfy this mathematical acceptance criterion by itself.

## Beilinson–Drinfeld Grassmannians and loop groups

`GeometricSatakeAndFusion:GS0`

This is the aggregate geometric target. Its nodes are owned by the loop-geometry, Schubert-smoothness and Witt-geometry substages and also realise GS0. The aggregate imports their existing targets; it does not create second Grassmannian, smoothness or properness nodes. Acceptance checks all three families, including the two-leg collision bound and the generic/integral properness distinction.

## Loop spaces and bounded modifications

`GeometricSatakeAndFusion:GS0:loop-geometry`

The three moduli objects are separated: loop evaluation, the Hecke groupoid with automorphisms, and the Grassmannian quotient sheaf with a chosen punctured trivialization. Ordered legs, generic Galois descent and generic bounded properness use these objects. The affine flag resolution is retained as a distinct construction. Finite congruence layers connect the moduli to Lie data without attributing a finite dimension to the complete positive loop group. Acceptance includes the diagonal stabilizer of the identity Hecke modification, the unit Grassmannian section, the GL₂ equal-degree dominance counterexample, and the empty reduced-word flag resolution.

### Positive and full loop spaces

`GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.positiveLoopSpace`.

For an affine O_E-scheme Z and a divisor D in Div^d_𝒴, L⁺Z(S)=Z(B⁺_D(S)) and LZ(S)=Z(B_D(S)) are v-sheaves over Div^d_𝒴. The generic E-scheme version is defined over Div^d_Y or Div^d_X. For X use the basis of affinoid S for which D_S is affinoid. For a group scheme these are group v-sheaves, with the natural inclusion L⁺G→LG.

**Hypotheses and conventions.** Z affine; d≥1; integral G is a split reductive O_E-model; generic G/E can be ramified.

**Construction or proof.**

1. Import completed rings, their functoriality and v-descent from RF2.
2. Evaluate the affine functor of points on those rings; v-descent of sections follows from affine equations and the structure sheaf.
3. Restrict to the affinoid-divisor basis over X and descend across its open covers.

**Direct prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `ReductiveGroupsPartII:RG2.3`, `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`, `DiamondsAndVStacks:D6/pre-adic-topological-comparison`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.5, p. 192.

**Consumers and design of the API.**

- FS VI.1.7–VI.1.9: Loop maps present both modification moduli.
- HeckeStacksAndLocalShtukas:HS0: Local modifications form the relative Hecke correspondence.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.positiveLoopSpace_eval` | characterisation | At a completed ring A, the positive loop space is the affine functor of points F(A); the full loop space uses A[1/ξ]. |
| `TauCeti.Suggested.GeometricSatake.positiveLoopSpace_map` | functoriality | A ring map induces the map F(f); identity and composition agree with those in the affine functor. |
| `TauCeti.Suggested.GeometricSatake.positiveLoopSpace_map_comp` | relation | Positive loop maps compose in the same order as ring maps. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.loop_gm_units` | computation | For G_m the evaluation at A agrees with the unit group of A. |
| `TauCeti.Suggested.GeometricSatake.loop_trivial` | degenerate | The trivial affine group has one loop at every ring. |
| `TauCeti.Suggested.GeometricSatake.loop_affine_evaluation` | compatibility | Affine evaluation uses the existing CommRingCat functor, not an underlying-set functor on schemes. |

**Acceptance.** For G=G_m the two groups are (B⁺)ˣ and Bˣ; for G=GL_n they are invertible matrices.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** This signature retains affine functor evaluation; completed-ring assignment, divisor sites, v-descent and group-valued structure are supplied by RF2/RG. Full loop evaluation is the same signature at the localized input ring.

**Planet:** Loop spaces.

### Local Hecke stack

`GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.localHeckeAction`.

Hck_G(S) is the groupoid of two G-torsors on Spec B⁺_D(S), together with an isomorphism of their B_D-restrictions. It is a small v-stack; its étale-stack presentation is [L⁺G\LG/L⁺G].

**Hypotheses and conventions.** The same divisor basis and group-model conditions as loop spaces.

**Construction or proof.**

1. Import descent of finite projective B⁺-modules from RF2; transfer it to G-torsors through the faithful exact tensor description.
2. Trivialize torsors étale-locally using the geometric DVR and smooth finite-level lifting/spreading.
3. Changes of the two trivializations give the double quotient; keep automorphisms, rather than taking only isomorphism classes.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`, `RelativeFarguesFontaine:RF4:G-torsors`, `ReductiveGroupsPartII:RG2.3`, `mathlib:CategoryTheory.ActionCategory`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.6–VI.1.7, p. 193.

**Consumers and design of the API.**

- FS VI.1.7: The double quotient must keep stabilizers.
- FS VI.8: The middle positive-loop action is divided out in convolution.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.localHeckeAction_formula` | characterisation | The double action is (h₁,h₂)·g=h₁gh₂⁻¹, and the quotient is an action groupoid. |
| `TauCeti.Suggested.GeometricSatake.localHeckeAction_groupoid` | compatibility | For the double action, the local quotient uses Mathlib ActionCategory with its Groupoid instance. |
| `TauCeti.Suggested.GeometricSatake.localHeckeAction_unit_stabilizer` | characterisation | The automorphism labels of the identity are exactly pairs (h,h), retaining the diagonal positive-loop group. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.hecke_trivial_group` | degenerate | For the trivial group there is one modification and one automorphism. |
| `TauCeti.Suggested.GeometricSatake.hecke_identity_automorphisms` | non-example | For the subgroup of all integer additive units encoded multiplicatively, the identity modification retains nontrivial diagonal automorphisms; the quotient is not the orbit set. |
| `TauCeti.Suggested.GeometricSatake.hecke_double_action` | computation | For G=H, (h,1) sends the identity to h, whereas (1,h) sends it to h inverse. |

**Acceptance.** At the trivial modification automorphisms are the diagonal L⁺G; for the trivial group the stack is the base.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The action groupoid is the local presentation. Stackification, ring-valued torsors and étale-local trivialization are not encoded by a new unknown predicate.

**Planet:** Local Hecke stack.

### Beilinson–Drinfeld Grassmannian

`GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.grassmannianQuotient`.

Gr_G(S) classifies a G-torsor on Spec B⁺_D(S) with a B_D-trivialization. It is a small v-sheaf and the étale sheafification of LG/L⁺G. Its map to Hck_G fixes the second torsor as trivial.

**Hypotheses and conventions.** Integral and generic group and divisor conventions as above.

**Construction or proof.**

1. Use the same effective torsor descent as Hck_G.
2. The B-trivialization kills all automorphisms; étale-local trivialization gives the quotient sheaf.
3. Apply imported Beauville–Laszlo gluing for the identification with modifications off D on the relative curve.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `RelativeFarguesFontaine:RF4:G-torsors`, `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`, `DiamondsAndVStacks:D6/pre-adic-topological-comparison`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.8–VI.1.9, pp. 193–194.

**Consumers and design of the API.**

- FS VI.2: Schubert cells live in the quotient sheaf.
- FS VI.7.9: Pullback from Hecke sheaves is fully faithful on the Grassmannian.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_eq` | compatibility | The trivialized local presentation is the existing right-coset carrier G/H; H need not be normal. |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_mk` | constructor | Every full loop gives its right-coset class and hence a trivialized modification. |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_eq_iff` | characterisation | Two trivializations define the same point precisely when g⁻¹g′ lies in H. |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_unit` | constructor | The unit section is the class of the identity full loop. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.grassmannian_zero` | degenerate | The unit section is the coset of the identity full loop. |
| `TauCeti.Suggested.GeometricSatake.grassmannian_all_subgroup` | computation | When H=G, the local quotient has exactly one point. |
| `TauCeti.Suggested.GeometricSatake.grassmannian_non_normal` | compatibility | Grassmannian cosets do not require H normal; the quotient is the existing set quotient even without a quotient-group structure. |

**Acceptance.** The unit section is the trivial torsor with identity trivialization.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the coset presentation is typed; étale sheafification and the Beauville–Laszlo comparison require the RF4 supplier. The unit example tests its naming, while the nonnormal API prevents imposing an incorrect normality requirement.

**Planet:** Beilinson–Drinfeld Grassmannian.

### Ordered legs and divisor base change

`GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.orderedLegCollision`.

For finite I, pull back Gr_G and Hck_G along (Div¹_𝒴)^I→Div^{∣I∣}_𝒴 given by addition of Cartier divisors. Formation commutes with base change. Over disjoint divisors the completed rings split as products and Gr factors as the product of the individual Grassmannians. Equal untilts are counted once in the product, but their cocharacters add in the bound.

**Hypotheses and conventions.** Split integral model; restrict to generic Y/X for a general G/E.

**Construction or proof.**

1. Import divisor addition, disjointness and completion base change from RF2.
2. Apply product decomposition of torsors and trivializations to the functor of points.
3. At a collision the ideal has repeated factors but its completion is the same adic ring; the relative-position bound is the sum.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`, `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.6 and preceding discussion, pp. 199–200.

**Acceptance.** Two equal legs have a single local factor bounded by μ₁+μ₂; two distinct legs have two factors.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The typed coweight core adds labels at collisions; divisor-completion base change and disjoint-product v-sheaf isomorphisms need RF2.

### Generic Schubert bounds

`GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.dominanceBound`.

After a splitting extension and choices T⊂B⊂G, define Gr_{≤μ} by geometric rank-one points whose Cartan coweight is ≤μ; Gr_μ has exact relative position μ. Over generic Div^d_Y and Div^d_X the bounded inclusions are closed and the projections proper and representable in spatial diamonds. Their filtered union in each π₁(G)-component is Gr. Bounds for a tuple of legs sum at collisions.

**Hypotheses and conventions.** μ dominant; μ−λ is a sum of positive coroots with the same π₁-class. General G/E descends its Galois-stable orbit of bounds.

**Construction or proof.**

1. Import Cartan decomposition and its functorial descent from RG2.4.
2. Use SW 19.2–19.4 and 20.4.5 for generic properness: the successive bounded convolution tower surjects, giving quasicompactness in addition to partial properness.
3. Detect closedness on geometric points; ordered covers and finite splitting descent give the Div^d versions. Integral properness is the distinct Witt node.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `ReductiveGroupsPartII:RG2.4`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `DiamondsAndVStacks:D6/pre-adic-diamondification`, `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`, `DiamondsAndVStacks:D6/pre-adic-topological-comparison`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.2–VI.2.3, pp. 196–197.

**Consumers and design of the API.**

- FS VI.2.2–VI.2.3: Bounds require Cartan labels and the same component.
- FS VI.8: Bounded convolution lands in the summed cocharacter bound.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.dominanceBound_iff` | characterisation | For GL_n, dominance means equal total degree and every initial partial sum of ν at most the corresponding sum of μ. |
| `TauCeti.Suggested.GeometricSatake.dominanceBound_refl` | relation | Every dominant cocharacter lies in its own bound. |
| `TauCeti.Suggested.GeometricSatake.dominanceBound_trans` | relation | Bounds are nested by transitivity of the dominance relation. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.bound_zero_component` | degenerate | For a torus of rank one the bound is equality, not the usual integer order. |
| `TauCeti.Suggested.GeometricSatake.bound_gl2` | computation | GL₂ coweight (1,1) is below (2,0). |
| `TauCeti.Suggested.GeometricSatake.bound_wrong_degree` | non-example | The cocharacter (1,0) is not below (2,0), despite its smaller partial sums. |

**Acceptance.** μ=0 is the unit section; a bound in one component does not include a coweight with another π₁-class.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The GL_n combinatorial core is a fully stated predicate, not a placeholder. Geometric relative-position maps, closedness and properness have their own theorem nodes and supplier requests.

**Planet:** Schubert bounds.

### Galois descent of bounded modifications

`GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.genericGaloisDescent`.

For finite E′/E splitting G, base change identifies loop spaces, torsor-modification functors and each Galois-stable union of Schubert strata with the split constructions over E′. Descent returns the orbit-labelled cell Gr_{μ̄} and bound Gr_{≤μ̄}; this asserts no reductive O_E-model for a ramified G.

**Hypotheses and conventions.** Generic divisors on Y or X; μ̄ a finite Galois orbit.

**Construction or proof.**

1. Import finite étale/v-descent of affine group data.
2. Apply descent to geometric Cartan labels and their stable unions.
3. Properness, local spatiality and cohomological smoothness descend along the splitting cover.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `ReductiveGroupsPartII:RG2.3`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2 opening and VI.8 final paragraphs, pp. 196, 226.

**Acceptance.** An individual μ not defined over E is retained only after splitting; its orbit descends.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only isomorphism detection is typed. Effective Galois descent and split orbit-bound data are omitted.

### Affine flags and Demazure spaces over Spd O_C

`GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.demazureChains`.

For split G and an Iwahori model 𝓘⊂G, Fl_G=LG/L⁺𝓘 over Spd O_C. Its projection to Gr has v-locally fibre (G/B)^⋄ and is proper and cohomologically smooth. For w=s₁⋯s_rω reduced in the extended affine Weyl group, the Demazure space is the contracted product of the minimal parahorics divided by L⁺𝓘, followed by ω. It is an iterated (P¹)^⋄-bundle, proper over the bound, and isomorphic over the open w-cell.

**Hypotheses and conventions.** Parahoric models and affine Weyl group from RG2.3–RG2.4.

**Construction or proof.**

1. Construct torsor quotients and their changes of trivialization.
2. Use each minimal parahoric quotient P_i/𝓘=(P¹)^perf on the special fibre and the corresponding integral flag diamond.
3. Multiply the factors; reducedness gives the open-cell isomorphism and the boundary normal-crossing strata needed for ULA generation.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.5.1–VI.5.7, pp. 209–211.

**Consumers and design of the API.**

- FS VI.5: Demazure pushforwards generate the ULA category.
- Zhu 1.4: Reduced-word towers prove parahoric projectivity.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.demazureChains_points` | characterisation | The point core consists of chains x₀,…,x_r with each consecutive pair in the specified simple-step relation. |
| `TauCeti.Suggested.GeometricSatake.demazureChains_endpoint` | projection | Multiplication forgets the intermediate flags and keeps the endpoints. |
| `TauCeti.Suggested.GeometricSatake.demazureChains_base_change` | functoriality | A map of flag spaces preserving each simple-step relation acts on every vertex of a Demazure chain. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.demazure_empty` | degenerate | An empty chain is one flag; its two endpoints coincide. |
| `TauCeti.Suggested.GeometricSatake.demazure_one_step` | computation | A one-step chain is the given simple-step incidence relation. |
| `TauCeti.Suggested.GeometricSatake.demazure_not_product` | non-example | If a simple-step relation is empty, there is no chain, even if the flag space is nonempty. |

**Acceptance.** The empty word gives the ω-cell; a simple reflection gives P¹ with its open A¹ cell.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The typed chain is the functor-of-points incidence core; contracted products, parahoric torsors and the iterated P¹-bundle structures need RG/SF/VS suppliers. This core does not prove representability.

**Planet:** Demazure spaces.

### Smooth scheme loops over a divisor

`GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.smoothSchemeLoopDimension`.

For a smooth quasiprojective Z→O_E of relative dimension n, the functor of maps D_S→Z is representable in locally spatial diamonds, partially proper and ℓ-cohomologically smooth of dimension dn over Div^d_𝒴. Étale maps to Z give representable étale maps of these functors.

**Hypotheses and conventions.** D_S affinoid on the chosen basis; ℓ≠p.

**Construction or proof.**

1. Étale-local coordinates reduce to affine space.
2. Use formal lifting over D and the filtration by successive vector groups.
3. Spread the étale lift near geometric points and descend through the divisor basis.

**Direct prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`, `ReductiveGroupsPartII:RG2.3`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.12–VI.1.13, pp. 195–196.

**Acceptance.** For A¹ and degree d the dimension is d.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the degree-times-relative-dimension arithmetic is typed; representability, partial properness and ℓ-cohomological smoothness are missing supplier notions.

### Congruence filtration of positive loops

`GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.congruenceFiltration`.

L⁺_mG=ker(L⁺G→G(B⁺/I^m)), m≥1, has successive quotients Lie(G)⊗_{O_E}I^m/I^{m+1}. For degree d these are vector-group diamonds of ℓ-dimension d·dim G. The reduction L⁺G/L⁺_1G is the functor of maps D_S→G; in degree one it is G^⋄. The geometry assertion is for the finite quotients and graded pieces, not for the entire inverse-limit group with a finite dimension.

**Hypotheses and conventions.** G split reductive O_E-model; ℓ≠p; I is the ideal of the degree-d divisor.

**Construction or proof.**

1. Linearize the group law modulo successive powers of I using smoothness of G.
2. Import the Cartier-module and geometric DVR descriptions.
3. Reduce degree d on the ordered-leg cover to vector-group layers; apply DSO smoothness and descent.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`, `ReductiveGroupsPartII:RG2.5`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.10–VI.1.11, pp. 194–195.

**Acceptance.** For GL_n the graded piece is M_n⊗I^m/I^{m+1}, with addition as group law.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The group kernel is concrete. The Lie/Cartier-line graded-piece isomorphism and finite-quotient smoothness require RG/RF/DSO interfaces.

**Planet:** Congruence filtration.

## Early Schubert smoothness

`GeometricSatakeAndFusion:GS0:Schubert-smoothness`

Work with finite jets on a bounded locus. Reduce the open-cell stabilizer to the opposite parabolic and its congruence pieces to Lie weights. Truncation at a sufficiently large positive depth removes the deep positive-loop action. The resulting smoothness calculation gives dimension ⟨2ρ,μ⟩. For minuscule μ its unipotent fibres disappear, yielding the flag-variety identification. Acceptance must reconcile μ(ξ) with CS’s μ(ξ⁻¹), retain the one-leg normalization, and use the finite-projectivity and connection inputs rather than declaring pointwise detection automatic.

### Truncated positive loop groups

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop`.

For m≥1, L^{+,<m}G(S)=G(B⁺_D(S)/I^m) is the finite congruence quotient of L⁺G as a v-sheaf. Reduction has smooth vector-group kernels Lie(G)⊗I^j/I^{j+1}, 1≤j<m. These quotients provide finite-dimensional group actions on bounded Hecke loci.

**Hypotheses and conventions.** Split smooth integral model; degree-d divisor; ℓ≠p.

**Construction or proof.**

1. Use smooth lifting across nilpotent thickenings to identify the quotient, not only its naive pointwise image.
2. Linearize each finite step and apply DSO smoothness.
3. Factor bounded actions using VI.2.8.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `ReductiveGroupsPartII:RG2.3`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.10–VI.1.11 and VI.2.8, pp. 194–195, 201.

**Consumers and design of the API.**

- FS VI.2.8: Bounded actions factor through this quotient.
- FS VI.7: Perverse descent uses smooth finite truncations.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop_eval` | characterisation | The finite loop quotient evaluates F on the ring A/I^m, rather than the subgroup ker(F(A)→F(A/I^m)). |
| `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop_reduction` | functoriality | Reduction of a positive loop gives a point in the m-th quotient; smoothness makes this locally surjective. |
| `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop_transition` | functoriality | For a≤b, reduction modulo I^b maps to reduction modulo I^a. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.truncation_one` | computation | At m=1 the quotient is G(A/I), not the congruence kernel. |
| `TauCeti.Suggested.GeometricSatake.truncation_trivial_group` | degenerate | Every finite quotient of the trivial group is trivial. |
| `TauCeti.Suggested.GeometricSatake.truncation_ring_quotient` | compatibility | The ring input is Mathlib Ideal.Quotient, preserving the ideal and its exponent. |

**Acceptance.** At m=1 only the reduction group remains.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Nilpotent lifting, v-local surjectivity and finite-dimensional smoothness are omitted from the core type; no finite dimension is assigned to the entire positive loop group.

**Planet:** Truncated positive loops.

### Open Schubert cell smoothness

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.schubertCellDimension`.

Gr_{G,μ} is ℓ-cohomologically smooth of dimension ⟨2ρ,μ⟩ over the degree-one divisor base. Its stabilizer in L⁺G reduces to P⁻_μ (weights ≤0); the m-th graded piece consists of Lie weights ≤m. The quotient maps to (G/P⁻_μ)^⋄ with successive positive-loop unipotent fibres. Galois-orbit cells descend over the generic base.

**Hypotheses and conventions.** G split for the computation; μ dominant; ℓ≠p. Integral statement requires the reductive model.

**Construction or proof.**

1. Compute L⁺G∩μ(ξ)L⁺Gμ(ξ)⁻¹ in a faithful representation; in GL_n, the upper entry A_ij is divisible by ξ^{k_i−k_j}.
2. Use SW 19.4.2 for the lattice subbundle test, then the root-weight stabilizer and DSO vector-group smoothness.
3. Sum positive weights for dimension; apply splitting descent for μ̄. No perverse or decomposition theorem enters.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `ReductiveGroupsPartII:RG2.5`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.4–VI.2.5, pp. 197–199; IV.1.18.

**Acceptance.** For GL₂, μ=(a,b), a≥b, the dimension is a−b; μ=0 has dimension zero.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the GL₂ root-pairing core is typed; cell stabilization and cohomological smoothness are not a predicate placeholder.

**Planet:** Schubert cell smoothness.

### Finite truncation of bounded actions

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.boundedLoopActionTrivial`.

If m>0 is at least every weight of μ on Lie G, then L⁺_mG acts trivially on Gr_{≤μ}. For ordered legs use the corresponding bound for the sum at each collision. The action and equivariant complexes on the bound therefore factor through L^{+,<m}G.

**Hypotheses and conventions.** Split G; dominant μ; finite Schubert bound.

**Construction or proof.**

1. Use normality of the congruence kernel and the stabilizer weight calculation on the open orbit.
2. For ν≤μ the maximum root pairing does not increase; conclude for all lower strata.
3. Check on geometric points and descend the trivial action on the v-sheaf.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`, `ReductiveGroupsPartII:RG2.5`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.8, p. 201.

**Acceptance.** For GL₂ μ=(a,b), m≥a−b and m>0 suffices.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** K must be the specified deep congruence subgroup on the specified bound; those absent geometric hypotheses are omitted.

### Minuscule Bialynicki–Birula isomorphism

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.minusculeBialynickiBirula`.

If μ has Lie weights in {−1,0,1}, the Bialynicki–Birula map Gr_μ→(G/P⁻_μ)^⋄ is an isomorphism. In GL_n it sends a B⁺_dR-lattice Λ to the ascending filtration Fil^m=((B⁺)^n∩ξ^{-m}Λ)/(ξ(B⁺)^n∩ξ^{-m}Λ). CS uses μ(ξ^{-1}); matching FS uses inversion of the coweight or of the chosen parabolic convention.

**Hypotheses and conventions.** Generic characteristic-zero untilt; minuscule μ; ℓ≠p for the smoothness consequence.

**Construction or proof.**

1. The stabilizer filtration has no additional fibre when μ is minuscule.
2. Alternatively use CS 3.4.4 on field points, 3.4.6 for pointwise detection and KL finite-projectivity to prove injectivity over reduced bases.
3. Surjectivity is supplied by the filtered integrable universal connection and Griffiths transversality; import its period-sheaf realization from P8.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `ReductiveGroupsPartII:RG2.5`, `RelativeFarguesFontaine:RF4:vector-bundles`, `PadicHodgeTheory:P8:local-rational`.

**Sources.** [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), 3.4.4–3.4.6, pp. 685–686.

**Acceptance.** For GL_n μ=(1^r,0^{n−r}) the cell is the Grassmannian of r-planes, with the sign dictionary fixed.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Cell/Flag must be the minuscule Grassmannian and its flag functor; the geometric minuscule hypotheses are omitted.

## Witt Grassmannians, determinant lines and perfect models

`GeometricSatakeAndFusion:GS0:Witt-geometry`

The lattice/type interface is the entry point. It supports the finite determinant-jet presentation, the original algebraic-space quotient, the Demazure filtration and its connected cohomological fibres. The geometric determinant line has a fibre-triviality descent proof, followed by the Witt-specific positivity and Keel application. Integral reductive and parahoric properness consume this projectivity; their coefficient and group-model hypotheses remain distinct. Canonical models, the cone chart, normalized SL_n determinants and section growth are separate targets. The routed flag work adds finite admissible unions, incidence correspondences and their ordinary/Demazure fibre estimates. Acceptance tests determinant sign, h>N, zero quotient type, a genuine nonempty dominance boundary, normalized base factors and bounded componentwise dimension transfer.

### Witt lattice functor

`GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.WittLattice`.

For a perfect F_p-algebra R let Λ be a finite projective W(R)-submodule of W(R)[1/p]^n with Λ[1/p]=W(R)[1/p]^n. Gr^W_GL_n is the v-sheaf of such lattices; a positive bounded piece Gr_{≤λ} has Λ⊂W(R)^n and quotient of type ≤λ. Negative bounds are obtained by translating by p^a. For O_E coefficients use RF0’s ramified Witt ring; for a general smooth model 𝓖 use 𝓖-torsors with a punctured trivialization.

**Hypotheses and conventions.** The two pole bounds on a lattice are locally uniform; coefficients perfect; quotient type has fixed total length.

**Construction or proof.**

1. Use finite projectivity and bounded denominators to define the functor.
2. Apply SF’s Witt vector-bundle v-descent to both finite levels and the formal limit.
3. Use the quotient/torsor comparison of BS 9.5 and Zhu 1.3; this construction does not assume projectivity.

**Direct prerequisites.** `mathlib:WittVector`, `mathlib:PerfectRing`, `mathlib:Module.Projective`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`, `SchemeAndStackFoundations:SF.4`, `ReductiveGroupsPartII:RG2.3`, `mathlib:Module.Finite`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 8.1 and 9.4–9.5, pp. 32, 36–37.

**Consumers and design of the API.**

- BS 7–8: Positive quotient-type bounds and their resolution use these embedded lattices.
- Zhu 1.2: The lattice functor is the GL_n affine Grassmannian.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.WittLattice_module` | projection | A lattice is a finite projective B-submodule of K^n whose K-span is the whole module. |
| `TauCeti.Suggested.GeometricSatake.WittLattice_standard` | constructor | The image of B^n in K^n gives the standard lattice when B→K is injective. |
| `TauCeti.Suggested.GeometricSatake.WittLattice_ext` | extensionality | Lattices are equal when their embedded submodules are equal; finite-projectivity proofs carry no extra moduli. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.lattice_rank_zero` | degenerate | There is only one rank-zero lattice. |
| `TauCeti.Suggested.GeometricSatake.lattice_standard_field` | compatibility | Over B=K the standard lattice agrees with the top Submodule of K^n. |
| `TauCeti.Suggested.GeometricSatake.lattice_span` | non-example | A purported rank-one lattice with zero embedded submodule is excluded over a nonzero field. |

**Acceptance.** For n=1 lattices are p^aW(R) locally on components; Λ=W(R)^n is the unit.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The generic imported coefficient algebra B→K is the ramified Witt ring and its localization in the intended application. The finite/projective/span conditions are concrete. A separate structure below records them; representing schemes are not defined by this point core.

**Planet:** Witt vector affine Grassmannian.

### Witt torsion module types

`GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.wittTypeBound`.

A finite p-power-torsion isogeny cokernel Q over W(R) has geometric type λ=(λ₁≥⋯≥λ_n≥0), meaning Q_x≅⊕W(k_x)/p^{λ_j}. Its row lengths are n_λ(i)=#{j:λ_j>i}. Dominance means equal total length and all partial sums bounded. Type ≤λ is a closed locus; on a constant-type locus the modules p^iQ/p^{i+1}Q are finite projective of ranks n_λ(i). An isogeny is a map of finite projective W-modules invertible after p-inversion.

**Hypotheses and conventions.** R perfect; a uniform p-power kills Q; the isogeny-cokernel criterion is projective dimension at most one, including Q=0.

**Construction or proof.**

1. Import projective module algebra, Fitting-ideal tests and reducedness of perfect rings from SF.
2. Apply BS 7.3, 7.5 and 7.7–7.9 to ranks of powers of p and the dominance inequalities.
3. Use the finite-rank argument in source correction E37; do not infer finite generation from projectivity alone without constant finite rank.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `SchemeAndStackFoundations:SF.0`, `mathlib:Module.Projective`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 7.1–7.9, pp. 27–32.

**Consumers and design of the API.**

- BS 7.2–7.13: Column ranks control the Demazure filtration.
- BS 8.3: Dominance induction controls the closed boundary.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.wittTypeBound_dominance` | compatibility | The quotient-type relation is GL_n dominance after embedding nonnegative parts in the integer coweight lattice. |
| `TauCeti.Suggested.GeometricSatake.wittTypeBound_columns` | data | The i-th graded quotient has rank equal to the number of parts λ_j exceeding i. |
| `TauCeti.Suggested.GeometricSatake.wittTypeBound_closed_under_dominance` | relation | A lower quotient type remains in any larger bound. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.witt_type_zero` | degenerate | The zero bound admits only zero nonnegative quotient parts. |
| `TauCeti.Suggested.GeometricSatake.witt_type_210` | computation | For λ=(2,1,0), the successive column ranks are two and one. |
| `TauCeti.Suggested.GeometricSatake.witt_type_not_component_order` | non-example | The quotient type (1,0,0) is not below (2,1,0), since its length is one rather than three. |

**Acceptance.** For Q=W(k)/p²⊕W(k)/p the type is (2,1), rows (2,1); a different total length is never a dominance comparison.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The type relation and column counts are concrete; elementary divisors for a finitely presented isogeny cokernel over a perfect family are an RG/SF refinement.

**Planet:** Witt module types.

### Zhu finite-jet presentation

`GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus`.

For λ=(N,0,…,0), V_N parametrizes W-matrices with determinant p^N times a unit. For h>N, V_{N,h} is the perfection of the truncated determinant locus det₀=⋯=det_{N−1}=0, det_N invertible. Gr̄_{N,h} adds a W_h-trivialization of the lattice and is an L^hGL_n-torsor over Gr̄_N. The stabilizer J={(A,γ):Aγ=A} gives Gr̄_{N,h}≅J after a chosen normalized lift.

**Hypotheses and conventions.** The isomorphism uses a choice of lifting; h>N, not h=N. Nonperfect Greenberg test rings use the ring scheme of O_E/ϖ^h, not a naive tensor formula.

**Construction or proof.**

1. Import Greenberg realization and perfect finite models from SF.
2. Zhu 1.9 produces the matrix cover; choose lifts as in 1.10–1.11.
3. Identify the stabilizer and verify the corrected compositions βε=A and γ=ε_A⁻¹α⁻¹ε. This is the original algebraic-space route.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `SchemeAndStackFoundations:SF.0`, `ReductiveGroupsPartII:RG2.3`.

**Sources.** [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 1.9–1.11, pp. 418–421.

**Consumers and design of the API.**

- Zhu 1.9–1.12: Finite-jet torsor quotients represent lattice bounds.
- Zhu B.4/B.11: The determinant equations define canonical models and the cone chart.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus_mem` | characterisation | The matrix jet lies on the determinant locus when det(A)=uπ^N for a unit u; the finite truncation and bound h>N are retained in the application. |
| `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus_right_invariance` | relation | Right multiplication by an invertible matrix preserves the determinant locus. |
| `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus_ring_map` | functoriality | A ring map takes the determinant locus to the corresponding locus with the image uniformizer. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.jet_level_zero` | degenerate | For N=0 the determinant is a unit. |
| `TauCeti.Suggested.GeometricSatake.jet_identity` | computation | The identity matrix is in the N=0 locus. |
| `TauCeti.Suggested.GeometricSatake.jet_zero_excluded` | non-example | A zero rank-one matrix is excluded at N=0 over a nonzero field. |

**Acceptance.** For N=0 the trivial lattice with a jet trivialization is L^hGL_n; the determinant-zero equations disappear.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The determinant equation is the matrix core. Finite Greenberg representability, the lift-kernel quotient and its perfect torsor are imported, not represented by an arbitrary smoothness predicate.

### Original perfect algebraic-space construction

`GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.zhuBoundPresentation`.

Each Gr̄_N and hence each bounded GL_n Witt Grassmannian is a perfectly finitely presented separated proper algebraic space; Gr is an increasing union of such pieces. For general reductive G a faithful representation with quasi-affine quotient gives a locally closed embedding into the GL_n Grassmannian; an affine quotient gives a closed embedding.

**Hypotheses and conventions.** Zhu published edition; perfect fields/rings; integral model assumptions pinned.

**Construction or proof.**

1. Use the affine jet presentation and effective quotient theorem A.29.
2. Import the published flatness proof A.30–A.31 from SF; the torsor fibre-product identity alone does not prove flatness.
3. Demazure properness supplies properness of the bounded spaces. No BS determinant/projectivity theorem is used in this original construction.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `SchemeAndStackFoundations:SF.1`, `ReductiveGroupsPartII:RG2.3`.

**Sources.** [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 1.12, 1.19–1.20; A.29–A.31, pp. 421, 425–426, 476–477.

**Acceptance.** The target is a perfect algebraic space before the separate projectivity proof.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Presentation must be Zhu's smooth determinant-jet cover. The quotient algebraic-space carrier is not available and is omitted; this signature asserts only the cover's affineness.

### Witt Demazure filtration space

`GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.wittFiltration`.

For Q of type ≤λ, Dem_λ(Q) classifies Q=Q₀⊃Q₁⊃⋯⊃0 with Q_i/Q_{i+1} locally free over R of rank n_λ(i). The global resolution Gr̃_λ classifies a lattice together with such a filtration of W(R)^n/Λ. It is a proper pfp perfect scheme obtained by successive perfected Grassmannian bundles. Its image is Gr_{≤λ}; over exact type the filtration is the p-adic filtration and the map is an isomorphism.

**Hypotheses and conventions.** λ sorted nonnegative; total length fixed; all quotient maps respect the Witt action; zero λ gives the vanishing locus.

**Construction or proof.**

1. Use SF’s perfected Quot/Grassmann bundles; recurse on the first quotient Q/pQ of rank n_λ(0), then λ shifted by one column.
2. BS 7.13 gives image, uniqueness and properness. Zhu 1.13–1.18 gives the lattice-chain presentation, including reversed dual bounds for reversed chains.
3. BS 8.6 produces a smooth projective finite-type model for the global tower.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `CrystallineCohomology:CR.1`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 7.10–7.13 and 8.4–8.6, pp. 29–34.

**Consumers and design of the API.**

- BS 7.13–7.14: Filtration fibres supply connectedness and structure-sheaf cohomology.
- BS 8.8: The determinant is the product of graded quotient determinants.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.wittFiltration_eval` | characterisation | The typed filtration consists of a decreasing chain of submodules starting at M and ending at zero. |
| `TauCeti.Suggested.GeometricSatake.wittFiltration_piece` | projection | Evaluation gives the i-th submodule in the chain. |
| `TauCeti.Suggested.GeometricSatake.wittFiltration_ext` | extensionality | Two filtration points are equal if all their submodules agree. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.filtration_length_zero` | degenerate | A length-zero filtration forces the module to be zero. |
| `TauCeti.Suggested.GeometricSatake.filtration_one_step` | computation | A length-one filtration has first piece top and all subsequently pieces zero. |
| `TauCeti.Suggested.GeometricSatake.filtration_direction` | non-example | The filtration decreases; increasing kernels of p must first be reverse-indexed. |

**Acceptance.** λ=0 gives the unit; λ=(1^r) is the perfected ordinary Grassmannian; λ=(2,1,0) has a P² boundary fibre.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The submodule-chain core omits prescribed locally free quotient ranks, annihilation by p, perfect-scheme representability and its lattice map. These conditions are written in the packet, not replaced by unknown proposition fields.

**Planet:** Witt Demazure resolution.

### Fibres of the Witt resolution

`GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.wittResolutionConnectedFibres`.

The fibres of Gr̃_λ→Gr_{≤λ} are geometrically connected and have RΓ(O)=k at geometric perfect fields. The resolution is an isomorphism over exact type. In Zhu’s full ω₁-chain resolution of Gr̄_N every lower-type fibre has positive dimension.

**Hypotheses and conventions.** Nonempty geometric fibres; Q an isogeny cokernel.

**Construction or proof.**

1. Apply BS 7.14 to filtered Grassmann incidence parameters; reverse the increasing kernels of multiplication by p to match its decreasing-filtration convention.
2. Induct on the filtration length for cohomology and connectedness.
3. For the full ω₁ resolution, use Λ_λ+p^iΛ₀, not the erroneous intersections in Zhu 1.18; projection to a nontrivial projective space detects positive dimension.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 7.13–7.14, pp. 30–32; Zhu 1.18, pp. 424–425.

**Acceptance.** For λ=(2,1,0), fibre above (1,1,1) is P²; exact-type fibres are points.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** X/Y/f must be the Witt resolution and bound; perfect structure-sheaf cohomology is omitted.

### Descent on Witt resolution fibres

`GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` — application. Proposed declaration: `TauCeti.Suggested.GeometricSatake.wittFibralDescent`.

Apply the supplier’s v-descent for finite/formal Witt bundles and its proper pfp connected-fibre criterion to Gr̃_λ→Gr_{≤λ}. Pullback on line bundles is fully faithful; a line bundle trivial on every geometric fibre descends. The stronger Rψ_*O=O criterion applies to the same resolution and commutes with base change.

**Hypotheses and conventions.** Proper surjective pfp perfect morphism; geometric connectedness alone is the weaker sufficient criterion, not an equivalence with Rψ_*O=O.

**Construction or proof.**

1. Import BS 4.1 and 6.1, 6.8, 6.13 from SF rather than reproduce their general theory.
2. Verify the proper pfp hypotheses and fibre computation from the resolution node.
3. Use the fibre criterion and full faithfulness for effective descent and uniqueness.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.3`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 6.1, 6.8, 6.13 and 8.5, pp. 21–26, 33.

**Acceptance.** Apply to λ=0, where descent is the identity; keep pfp in the statement.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the line-bundle full-faithfulness core is typed; effective fibre-trivial descent and proper pfp hypotheses belong to SF.

### Geometric determinant line

`GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine`.

There is a unique line bundle L on Gr_{≤λ} whose pullback to Gr̃_λ is ⊗_i det_R(Q_i/Q_{i+1}); these lines agree under lower bounds and hence form the determinant line on Gr_GL_n. Construct it geometrically using complete-flag refinements and fibre triviality, without the K-theoretic determinant.

**Hypotheses and conventions.** Positive quotient convention W(R)^n/Λ; determinant of a sublattice would reverse the line.

**Construction or proof.**

1. Refine filtrations to full flag towers as in BS 6.11 and 8.8.
2. On each geometric fibre the product of graded determinants identifies with the fixed determinant of the associated R-gradeds of Q.
3. Apply the fibral descent node and its full faithfulness to descend and reconcile lower-bound restrictions.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `SchemeAndStackFoundations:SF.3`, `KTheoryLowDegrees:Z.3`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 6.11 and 8.8, pp. 25, 33–34.

**Consumers and design of the API.**

- BS 8.9–8.11: Positive degrees and boundary sections prove projectivity.
- BS 10.1: The normalized SL_n line is built from these determinants.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine_pullback` | compatibility | On the Demazure resolution, the pulled-back line is the tensor product of the determinants of the graded quotients, with the positive quotient convention. |
| `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine_unique` | characterisation | Fibre-trivial descent is unique through the fully faithful pullback of invertible sheaves. |
| `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine_lower_bound` | functoriality | Restriction to a lower bound agrees with that bound’s determinant line. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.determinant_zero` | degenerate | The zero bound has the trivial invertible sheaf. |
| `TauCeti.Suggested.GeometricSatake.determinant_existing_carrier` | compatibility | The descended geometric line uses Tau Ceti InvertibleSheaf, rather than a rank-one module at a point. |
| `TauCeti.Suggested.GeometricSatake.determinant_quotient_sign` | computation | On a one-step quotient Grassmannian, the descended line pulls back to the graded quotient determinant; its sign is the quotient sign. |

**Acceptance.** For λ=(1,0,…), the line is O(1) on the projective Grassmannian; λ=0 gives the trivial line.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the existing invertible-sheaf carrier is typed. X must be the specified bounded Witt scheme, pull the specified resolution/restriction, and gradedDet its graded determinant. Those missing geometric conditions are omitted in these signatures and are not arbitrary new predicates.

**Planet:** Determinant line.

### Positivity of the determinant line

`GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.determinantCurveDegree`.

On Gr̃_λ, ⊗det(Q_i/Q_{i+1})^{a_i} is ample for a₀≫a₁≫⋯>0. Each determinant factor has sections nonvanishing on the exact-type open locus. The unweighted descended line has positive degree on every nonconstant proper curve in Gr_{≤λ}; its resolution pullback is nef and big, with exceptional locus contained in the lower-type boundary.

**Hypotheses and conventions.** Finite-type models fixed up to Frobenius; a_i integers with successive domination; effective divisors interpreted on these models.

**Construction or proof.**

1. Use BS 8.9 and Grassmann-bundle induction for weighted ampleness and explicit nonvanishing sections.
2. If the sum of nonnegative determinant degrees on a lifted curve were zero, all weighted degrees would be zero, contradicting ampleness (8.10).
3. Use an effective decomposition with ample weighted part to place the exceptional locus in the boundary (8.11); invoke only the supplier’s positivity notions.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `SchemeAndStackFoundations:SF.5`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 8.9–8.11, pp. 34–35.

**Acceptance.** For a one-step projective Grassmannian the line has degree one on a Schubert line.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** degree must be the determinant degree on a nonconstant proper curve in the specified bound. The missing curve/intersection API and hypotheses are omitted.

### Projectivity of the Witt Grassmannian

`GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.wittProjectiveBound`.

For every dominant positive λ, Gr_{≤λ} is the perfection of a projective F_p-scheme and its determinant line is ample on a finite Frobenius model. Consequently all pole-bounded GL_n lattice pieces are perfections of projective varieties.

**Hypotheses and conventions.** Use BS’s geometric determinant construction. Keel’s criterion, exceptional locus and Frobenius extension/descent are imported from SF.5; pfp/model theory from SF.0.

**Construction or proof.**

1. Induct on dominance. Realize the lower boundary as an iterated finite pushout of lower bounds along closed intersections, importing the missing representability argument from SF.1 (source E39).
2. The determinant is ample on boundary pieces; Keel’s union lemma and strict curve positivity make it ample on the boundary. Keel’s restriction criterion then makes ψ*L semiample because its exceptional locus lies there.
3. Take its Stein contraction on a finite model. Strict curve positivity and fibre triviality identify its equivalence relation with the Demazure quotient; hence the contraction is Gr_{≤λ}. Its descended line is ample.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.5`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 8.3 proof, pp. 35–36.

**Acceptance.** No Zhu representability input in this independent route; λ=(1) recovers projective space.

**Unclosed obligations.** Boundary representability before Keel; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only scheme properness is typed; X/f must be the finite model of the bound over the base field. Projectivity/ample line notions are imported from SF5 and omitted.

**Planet:** Witt projectivity theorem.

### Perfect models and étale realization

`GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.wittEtaleComparison`.

Pass from each pfp perfect bounded scheme or algebraic space to compatible finite-type models up to Frobenius. Perfection preserves fibre products and underlying topological dimension, and induces an equivalence of étale topoi. The associated v-sheaf maps by scheme diamondification to the special fibre of the integral Grassmannian.

**Hypotheses and conventions.** Coordinate perfection is a direct Frobenius colimit; Mathlib Perfection is an inverse-limit carrier and is not cited for this construction. Trace/cycle normalizations require a fixed model.

**Construction or proof.**

1. Import Zhu A.3, A.15–A.17 and BS 3 from SF.0–SF.1.
2. Import the characteristic-p scheme-diamond comparison from L1.
3. Evaluate the torsor/lattice functor on perfectoid R; B⁺ at a characteristic-p untilt is W_{O_E}(R), so both sheaves have the same functor of points.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`, `DiamondsAndVStacks:D6/pre-adic-diamondification`.

**Sources.** [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 20.3.1–20.3.4, p. 185.

**Acceptance.** A¹_perf has dimension one but is not finite type as an ordinary scheme.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** These categories must be the specified étale categories of a perfect Witt bound and its scheme diamond; supplier geometry is omitted.

### Integral bounded Grassmannian families

`GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.integralWittGenericComparison`.

The integral BD Grassmannian over Spd O_E (or Div^d_𝒴) interpolates between the generic B⁺_dR Grassmannian and the v-sheaf of the Witt Grassmannian. For a split reductive model, the geometric relative-position bounds are closed and proper and representable in spatial diamonds, also for ordered multiple legs with summed collision bounds; their componentwise filtered union is the full functor.

**Hypotheses and conventions.** Fixed integral reductive model; unramified cocharacter reflex extensions in SW 20.3–20.5; no ramified reductive O_E-model asserted.

**Construction or proof.**

1. Use SW 20.3.2 for the torsor/étale quotient description and the explicit characteristic-p comparison.
2. BS projectivity provides the special-fibre compact bounds; generic bounded properness and SW 20.3.6, 20.5.4 give proper relative diamonds.
3. For multiple legs build the bounded convolution tower and use its surjective multiplication map to establish quasicompactness and closedness.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`.

**Sources.** [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 20.3.6 and 20.5.4, pp. 186, 190.

**Acceptance.** At equal legs the bound is the sum, not their maximum.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the two functor-of-points fibre identifications are typed; the diamond base change and proper bounds are omitted.

### Witt affine flags and components

`GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.parahoricGeometricComponents`.

For a smooth affine O_E-model 𝓖 of a reductive generic fibre, the Witt affine Grassmannian is an ind-pfp perfect space with locally closed embedding into a GL_n Grassmannian and ind-quasiprojective bounds. If 𝓖 is parahoric its bounds are projective. Over k̄ its components are π₁(G)_I via Kottwitz, with residual Frobenius action retained. For an Iwahori, Schubert cells have dimension ℓ(w), closures are the Bruhat unions and reduced-word Demazure spaces are iterated perfected P¹-bundles.

**Hypotheses and conventions.** Parahoric/Iwahori notions supplied by RG2.3; inertia I, not the full absolute Galois group, labels geometric components.

**Construction or proof.**

1. Use the faithful representation with quasi-affine quotient and Zhu 1.20.
2. Zhu 1.4 and SW 21.1.1 use Iwahori Demazure towers; properness descends to other parahorics.
3. Use Zhu 1.21 and the corrected BS 9.7/SW 21.1.4 component identification.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`.

**Sources.** [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 21.1.1–21.1.4, pp. 191–192.

**Acceptance.** For a torus the geometric flag space is the discrete inertia-coinvariant coweight scheme with Frobenius action.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the Kottwitz label equivalence is typed, with geometric inertia coinvariants rather than full Galois coinvariants. Model representability and properness are omitted.

**Planet:** Parahoric Witt Grassmannians.

### Integral parahoric ind-properness

`GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.integralParahoricProperBounds`.

If 𝓖° is parahoric, Gr_{𝓖,Spd O_E} is an increasing union of closed proper subfunctors. A closed representation 𝓖→GL_n induces a closed immersion of integral Grassmannians. For minuscule bounds the closure is unchanged on replacing 𝓖 by 𝓖°, and central quasiparahoric isogenies identify the corresponding closures after reflex-field base change.

**Hypotheses and conventions.** Quasiparahoric models and component maps as in SW 21.2–21.5; minuscule hypothesis only for the closure comparisons.

**Construction or proof.**

1. Import Anschütz’s extension/triviality of torsors on punctured A_inf from RF4:G-torsors.
2. Use SW 21.2.3 to extend each geometric lattice and take products of uniformly bounded trivializations to obtain quasicompactness.
3. Apply the geometric-point and component tests in 21.4.3 and 21.5.1; do not claim the local-model conjecture from this argument.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `RelativeFarguesFontaine:RF4:G-torsors`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`.

**Sources.** [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 21.2.1–21.2.3, 21.4.3, 21.5.1, pp. 192–197.

**Acceptance.** For a torus the integral flag is the diamondification of the integral coweight scheme; special labels are inertia coinvariants.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only topological properness is typed; spaces/map must be a closed parahoric bound over the integral base. Spatial-diamond representability is omitted.

### Canonical determinant models

`GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.canonicalWittModel`.

For h>N, the finite-type truncated matrix locus det₀=⋯=det_{N−1}=0 with det_N invertible is a normal complete intersection. The normalized finite-jet quotient supplies Zhu’s canonical weakly normal model Gr′_μ. Compatible transition maps between these models may require Frobenius twists. The canonical Demazure model Gr̃′_N is a smooth projective model obtained from chains of p-divisible groups, with determinant comparison to the product of their Hodge lines.

**Hypotheses and conventions.** Fix model and Frobenius levels; do not infer normal Cohen–Macaulayness of every canonical Schubert model (Conjecture III). Dieudonné/crystal and p-divisible-group theory is imported.

**Construction or proof.**

1. Use Zhu B.4’s codimension and Serre-criterion argument for the matrix complete intersection, with the SF model API.
2. Descend the normalized jet quotient using SF effective quotients; use twisted transitions as in B.6.
3. Import B.7–B.9’s Dieudonné realization from the p-divisible-group owner and check the pullback of the Hodge determinant; the sketch-only comparison remains an explicit gap.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, `CrystallineCohomology:CR.1`, `CrystallineCohomology:CR.7`.

**Sources.** [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), B.4–B.9, pp. 484–486.

**Consumers and design of the API.**

- Zhu Appendix B: Canonical models fix trace and Hodge determinant normalizations.
- GS1 rational weight concentration: Cycle traces depend on a chosen model rather than perfection alone.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.canonicalWittModel_transition` | functoriality | A sufficiently deep finite-jet level has a transition to a shallower canonical model; compatibility can require a Frobenius twist. |
| `TauCeti.Suggested.GeometricSatake.canonicalWittModel_normalized_quotient` | compatibility | The canonical model is identified with the normalized jet quotient, not an arbitrary scheme having the same perfection. |
| `TauCeti.Suggested.GeometricSatake.canonicalWittModel_perfection` | compatibility | Its scheme perfection is the specified Witt Schubert bound. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.canonical_model_zero` | degenerate | The N=0 canonical bound agrees with its point model. |
| `TauCeti.Suggested.GeometricSatake.canonical_model_not_choice` | non-example | The comparison fixes the normalized quotient model; sharing a perfection does not specify the canonical model. |
| `TauCeti.Suggested.GeometricSatake.canonical_model_existing_scheme` | compatibility | The canonical model is an ordinary Mathlib Scheme, not a newly invented perfect-scheme carrier. |

**Acceptance.** For N=0 the canonical model is a point; a canonical model is not an arbitrary deperfection.

**Unclosed obligations.** Sketch-only canonical determinant and crystal comparison; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Finite-type, normalization, model perfection and Frobenius-twisted transition conditions are supplied by SF0/SF1. The typed target carrier and morphisms omit those conditions. The sketch-only Dieudonné comparison is a recorded gap; Conjecture III is not a theorem.

### Rank-two quadratic cone model

`GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.rankTwoConeClosedOrbit`.

For p>2, GL₂ and N=2, Gr̄₂ has an open chart equal to the perfection of Spec k[x,y,z]/(x²−yz), via A=((p+[x],−[y]),([z],p−[x])). Together with the open exact-type orbit it covers Gr̄₂. Its Demazure resolution is the perfection of P(O(1)⊕O(−1)). The open decomposition locus of W₃-matrices X with [λ]det X=p² is characterized by X=Ag with g∈GL₂(W₃); the representative A is unique.

**Hypotheses and conventions.** p>2; finite Witt truncation h=3; correct order g̃=Ã⁻¹X̃ and determinant det X=p²[λ]⁻¹.

**Construction or proof.**

1. Use the projective-bundle extension E/p and its splitting to identify the resolution model.
2. Use the determinant equations B.3.1 to solve uniquely for x,y,z on the locus det(X₁) invertible, then saturate by the right GL₂(W₃)-action.
3. Repair the displayed inverse order in B.11 and verify integrality of Ã⁻¹X̃ on this locus; source proof of this repair is recorded as a precise refinement gap. The jet torsor then identifies the open chart.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `SchemeAndStackFoundations:SF.0`.

**Sources.** [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), B.10–B.11, pp. 486–488.

**Acceptance.** At x=y=z=0, A=p·Id has determinant p² and maps to the unique closed orbit.

**Unclosed obligations.** Zhu B.11 corrected right-factor integrality; Sketch-only canonical determinant and crystal comparison; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the closed-orbit equation is typed. The perfect cone open immersion and the corrected W₃ right-factor integrality are recorded separately as a gap.

### Normalized determinant on SL_n lattices

`GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.normalizedDeterminant`.

On Gr_SL_n over the ramified Witt coefficient ring, lattices have determinant trivialization. For a≪0 define L_M as det̃(p^aW_{O_E}(R)^n/M)⊗det̃(p^aW_{O_E}(R)^n/W_{O_E}(R)^n)⁻¹, independent of a. It is ample on every proper bound. Translations differ from L only by a line on the base, giving a G_m-central extension of the loop group acting on L.

**Hypotheses and conventions.** The ordinary geometric determinant on filtered torsion modules agrees with the imported determinant calculus; the normalization factor is retained. This does not assert an honest LG-linearization.

**Construction or proof.**

1. Reduce the ramified coefficient module to W(R)^{ne} using a fixed coefficient basis, then use the GL_{ne} bound and determinant line.
2. Use tensor multiplicativity of determinants to cancel the standard-lattice factor under changing a.
3. Apply the finite embedding into a GL_{ne} bound for ampleness; compose translation-line isomorphisms for the central extension. The tame K₂ identification belongs to its supplier.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`, `KTheoryLowDegrees:Z.3`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 10.1 and discussion through 10.4, pp. 37–39.

**Consumers and design of the API.**

- BS 10.1: Ramified SL_n bounds inherit ampleness from GL_ne.
- BS 10.3–10.4: Translation lines form a loop-group central extension.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.normalizedDeterminant_trivial` | simp | At the standard lattice, the normalized determinant line is the tensor unit. |
| `TauCeti.Suggested.GeometricSatake.normalizedDeterminant_comparison` | compatibility | Normalization retains the inverse standard-lattice determinant factor. |
| `TauCeti.Suggested.GeometricSatake.normalizedDeterminant_translation` | relation | Translation gives a line from the base tensored with the original line; the compatible lines form a central extension rather than an honest action on the line. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.normalized_standard` | degenerate | The standard lattice has normalized determinant R. |
| `TauCeti.Suggested.GeometricSatake.normalized_zero_quotient` | computation | Two zero truncation quotients have the unit determinant. |
| `TauCeti.Suggested.GeometricSatake.normalized_tensor_carrier` | compatibility | Tensor products and determinant duals use existing ModuleCat and TensorProduct. |

**Acceptance.** For the standard lattice the normalized line is canonically trivial; translation by the identity gives the identity extension element.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** This is the pointwise module carrier for the normalized line. M and M₀ must be the specified finite filtered torsion quotients, and the geometric sheaf gluing is not yet typed. The translation statement omits that geometry, while keeping the indispensable base-line factor.

### Sections of the Witt determinant line

`GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.determinantSectionsRestriction`.

For the ample determinant line on Gr_SL_n, restriction of global sections to any proper closed bound is surjective, and the global section space is infinite dimensional whenever the Grassmannian has positive-dimensional bounds.

**Hypotheses and conventions.** Pass to fixed finite models and arbitrarily large Frobenius powers of their ample lines. This gives no answer to BS Question 10.6 about canonical modules or embeddings.

**Construction or proof.**

1. Use SF’s section-colimit description of line bundles on perfections.
2. Serre vanishing on finite models at large p^r powers gives restriction surjectivity.
3. Apply the same Frobenius powers to positive-dimensional bounds to obtain unbounded section dimensions.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.0`.

**Sources.** [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 10.5 and 10.6, pp. 39–40.

**Acceptance.** Zero-dimensional bounds have finite section spaces; the infinite-dimensional assertion has a dimension hypothesis.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The modules/map must be determinant global sections and restriction to the specified proper bound. Serre vanishing/Frobenius section-colimit hypotheses are omitted.

### Bounded admissible affine flag loci

`GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus`.

For a parahoric 𝓚 and a dominant cocharacter class μ, the admissible locus A_{𝓚,μ} is the finite closed union of affine Schubert strata labelled by the parahoric image of Adm(μ). Its reduced perfect structure is determined by geometric points. Under a morphism of parahoric models f:𝓚₁→𝓚₂ sending μ₁ to μ₂, the map of affine flags carries A_{𝓚₁,μ₁} into A_{𝓚₂,μ₂}.

**Hypotheses and conventions.** Admissible sets and affine Bruhat order from RG2.4; integral v-sheaf local-model existence/functoriality is an imported refinement, not inferred from Satake.

**Construction or proof.**

1. Use finite Bruhat unions and the representable flag spaces.
2. Identify this union with the reduced special fibre of the imported local model.
3. GLX 3.4 applies functoriality of local models and checks the containment on geometric points; GS supplies the ambient flag morphism.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `ReductiveGroupsPartII:RG2.4`, `SchemeAndStackFoundations:SF.4`.

**Sources.** [GLX26](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), 3.2–3.4, pp. 822–823; van Hoften §3.1.

**Consumers and design of the API.**

- GLX 3.4: Admissible special-fibre containment is functorial in the group model.
- van Hoften §2.2.6–2.2.15: The ambient parahoric flag space supplies the admissible locus.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus_mem` | characterisation | A flag lies in the admissible locus precisely when it is in one of the finitely many admissible Schubert strata. |
| `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus_mono` | functoriality | Increasing the admissible label set enlarges the locus. |
| `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus_map` | compatibility | An ambient flag morphism whose local-model comparison sends all admissible strata into the target locus restricts to the admissible locus. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.admissible_empty` | degenerate | The empty label set gives the empty locus. |
| `TauCeti.Suggested.GeometricSatake.admissible_singleton` | computation | A singleton label gives exactly its Schubert stratum. |
| `TauCeti.Suggested.GeometricSatake.admissible_nonlabel` | non-example | A point belonging to no admissible stratum is excluded, even when it lies in a different connected component. |

**Acceptance.** The zero admissible set in the torus is its corresponding component; identity group map fixes the locus.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module; Bounded affine-flag dimension and adjoint transfer.

**Prototype boundary.** This finite-union core records only membership and maps. Bruhat downward closure, reduced perfect structure and local-model functoriality belong to RG/SF suppliers.

### Relative-position flag correspondences

`GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.flagIncidence`.

For affine flags define O_w⊂Fl×Fl by relative position w. The two-step incidence C_{u,v}={(x,z,y):(x,z)∈O_u,(z,y)∈O_v} maps by forgetting z to Fl×Fl; pull back to O_{uv} or O_{u*v} to get the product and Demazure-product correspondences. Work on finite Schubert bounds over the first flag; these give pfp perfect models and compatible base changes.

**Hypotheses and conventions.** Relative position and Demazure product from RG2.4. The bounded twisted product is not an untwisted Cartesian product.

**Construction or proof.**

1. Construct the fibre-product incidence and its projection from the affine flag moduli.
2. Apply finite Bruhat closure bounds to z and y after an étale-local choice of the first flag, producing the proper bounded convolution tower.
3. Use SF compatible perfection models and dimension invariance for all pullbacks, including He’s X₂→X₃ and X₄→X₅.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `ReductiveGroupsPartII:RG2.4`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Sources.** [He21](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), 5.3–5.4, pp. 9–12.

**Consumers and design of the API.**

- He 5.6: Ordinary-product and Demazure-product fibre estimates apply to these projections.
- He proof of 5.5: Bounded pullbacks give X₂→X₃ and X₄→X₅.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.flagIncidence_points` | characterisation | Two-step incidence consists of (x,z,y) with (x,z) in the first relative-position orbit and (z,y) in the second. |
| `TauCeti.Suggested.GeometricSatake.flagIncidence_projection` | projection | The product projection forgets z and returns (x,y). |
| `TauCeti.Suggested.GeometricSatake.flagIncidence_fibre` | characterisation | The fibre over (x,y) is the set of middle flags satisfying both relative-position conditions. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.incidence_identity_left` | computation | If the first relation is the diagonal, z is uniquely x. |
| `TauCeti.Suggested.GeometricSatake.incidence_empty` | degenerate | An empty first relation gives empty incidence. |
| `TauCeti.Suggested.GeometricSatake.incidence_no_unrestricted_middle` | non-example | For both diagonal relations, a middle flag different from x cannot occur. |

**Acceptance.** C_{1,v} and C_{u,1} have a uniquely determined middle flag; finite bounds are required before dimension arguments.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module; Bounded affine-flag dimension and adjoint transfer.

**Prototype boundary.** The geometric fibre products, bounded pfp models and their dimensions are omitted from this pointwise core; no dimension is asserted for an unbounded ind-space.

### Affine flag convolution fibre bounds

`GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.flagConvolutionFibreBound`.

If ℓ(uv)=ℓ(u)+ℓ(v), the product-incidence projection C_{u,v}∣_{O_{uv}}→O_{uv} is an isomorphism. In general it is surjective with each geometric fibre of dimension ≥(ℓ(u)+ℓ(v)−ℓ(uv))/2. The Demazure-product projection is surjective with fibres of dimension ≥ℓ(u)+ℓ(v)−ℓ(u*v). These statements transfer to compatible pfp perfect models and their bounded pullbacks.

**Hypotheses and conventions.** Nonempty fibres and bounded pfp models; ordinary and Demazure products kept distinct. Adjoint transfer is componentwise and needs the corrected GHN hypothesis.

**Construction or proof.**

1. Use rank-one A¹/G_m convolution strata and induction on affine reduced words, as in GH10 2.4–2.5 cited by He 5.6.
2. Length-additive factors give uniqueness of the middle flag.
3. Transfer surjectivity and dimensions along perfected fibre products; for He’s dimension inequality use a finite cover of bounded components, not an unproved finite-component claim for the whole ind-space.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `ReductiveGroupsPartII:RG2.4`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`.

**Sources.** [He21](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), 5.6 and proof 5.5, pp. 10–12.

**Acceptance.** For u=v=s, ℓ(s)=1 and s*s=s: the Demazure fibre has dimension at least one, while the ordinary-product fibre lower bound is one.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module; Bounded affine-flag dimension and adjoint transfer.

**Prototype boundary.** Only the ordinary-product length/dimension inequality is typed; the bounded nonempty geometric fibre and length interpretations are omitted. The Demazure-product factor differs and is stated in the document.

## Semi-infinite geometry, ULA and relative perversity

`GeometricSatakeAndFusion:GS1`

Constant term is the plus pull–push functor with Braden’s minus comparison on eligible monodromic objects. Semi-infinite affineness and the rational MV description are geometric inputs, while integral ULA and flatness are proved through FS’s constant-term criterion. The relative perverse structure uses distinct geometric untilts and their cell shifts. EDC.5 supplies scheme perversity; L1/L3 transport the perfect scheme charts; EDS supplies the generated/Ind extension. Standard and costandard objects keep their integral map, with rational torsion comparison isolated. The MV node retains its integrated id beginning GS0:Witt-geometry for compatibility, but its parent stage and realised target are GS1. Acceptance includes the torus shift, a nonflat coefficient module, nonempty intersections, the quasi-minuscule infinity term and fixed-model trace normalization.

### Semi-infinite strata and constant terms

`GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.constantTerm`.

For a parabolic P⁺⊂G with Levi M and opposite P⁻, Hck_{P±}→Hck_G and Hck_{P±}→Hck_M give CT_P=R(p⁺)_!(q⁺)*. On bounded monodromic objects it identifies with R(p⁻)_*R(q⁻)!. For a Borel the geometric strata are S_λ=L U·λ(ξ), and the union of strata with cocenter weight ν′≤ν is closed as in VI.3.1; for a Borel this is the coroot order on all coweights, without requiring dominance; the attracting and repelling decompositions come from a regular central cocharacter of M.

**Hypotheses and conventions.** G split for labels; bounded quasicompact Schubert support; coefficients killed by an integer prime to p initially, with derived adic passage supplied by L0.

**Construction or proof.**

1. Use RG’s parabolic/Levi and Iwasawa decompositions to construct the locally closed strata.
2. Verify FS IV.6.1’s finite attracting/repelling decomposition on each bound.
3. Import the diamond hyperbolic-localization theorem, base change, duality and ULA preservation from VS1; apply it to the maps of Hecke stacks.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `ReductiveGroupsPartII:RG2.4`, `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`, `VStackSheavesAndLisseCategories:VS1`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category`, `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`, `AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits`, `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`, `VStackSheavesAndLisseCategories:VS0`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.3.1–VI.3.5, pp. 201–206.

**Consumers and design of the API.**

- FS VI.6.1: ULA is detected by constant terms after the weight shifts.
- FS VI.7.4/VI.7.7: Constant terms recognize perversity and coefficient flatness.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.constantTerm_formula` | characterisation | The plus constant-term functor is q-plus pullback followed by p-plus shriek pushforward. |
| `TauCeti.Suggested.GeometricSatake.constantTerm_minus_comparison` | equivalence | On bounded monodromic complexes the plus formula is naturally isomorphic to q-minus exceptional pullback followed by p-minus star pushforward. |
| `TauCeti.Suggested.GeometricSatake.constantTerm_map_comp` | functoriality | Constant term preserves composition of morphisms as a genuine functor. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.ct_torus` | degenerate | For G=T with identity correspondence, constant term is the identity functor. |
| `TauCeti.Suggested.GeometricSatake.ct_point_evaluation` | computation | The plus formula evaluates to p-shriek of q-star on every object. |
| `TauCeti.Suggested.GeometricSatake.ct_order` | compatibility | Composition agrees with Mathlib Functor.comp in pullback-then-pushforward order. |

**Acceptance.** For G=T the constant term is the identity; plus and minus formulas need monodromicity.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The plus/minus comparison omits monodromicity and the geometric correspondence hypotheses. The functor type and plus composition are concrete; hyperbolic localization is imported from VS1.

**Planet:** Constant term functor.

### Affine semi-infinite intersections

`GeometricSatakeAndFusion:GS1/semi-infinite-affineness` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.semiInfiniteBoundAffine`.

On the Witt special fibre, S_λ∩Gr_{≤μ} is affine and perfectly finitely presented. It is the nonvanishing locus of a section of a positive power of the ample determinant line on the appropriate closed weight-bound union. Nonempty intersections with the exact μ-cell are equidimensional of dimension ⟨ρ,μ+λ⟩.

**Hypotheses and conventions.** Split group; fixed perfect field; nonempty for the dimension assertion; integral coefficient freeness does not follow from cycle counting.

**Construction or proof.**

1. Use the faithful representation and a highest-weight determinant section to express the semi-infinite weight condition as a nonvanishing locus (VI.3.7).
2. Import A_inf lattice extension needed to define the section; then apply the GS0 determinant ampleness theorem.
3. Use VI.3.8 and the minimal convolution/flag argument for equidimensionality, keeping empty intersections separate.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `RelativeFarguesFontaine:RF4:G-torsors`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.5`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.3.7–VI.3.8, pp. 206–207.

**Acceptance.** For a torus the nonempty intersection is a point; λ outside the weights gives an empty intersection.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** X must be the specified nonempty semi-infinite intersection on its pfp model. General perfect-space affineness requires the SF model interface.

### Mirković–Vilonen intersections

`GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.mvCycleDimension`.

For the rational special-fibre category over k̄, the top-dimensional irreducible components of the nonempty S_λ∩Gr_μ give the weight-cycle description of H_c^{⟨2ρ,λ⟩}(S_λ,IC_μ). The intersection dimension is ⟨ρ,μ+λ⟩; unshifted constant coefficients on its open top-dimensional pieces occur in degree ⟨2ρ,μ+λ⟩. Cycle normalization is relative to a fixed finite model, since different perfection models can rescale trace classes by powers of p.

**Hypotheses and conventions.** Rational ℓ-adic coefficients; IC perverse normalization [⟨2ρ,μ⟩]; choose model; no assertion of a canonical integral cycle basis.

**Construction or proof.**

1. Use semi-infinite dimensions and the rational concentration theorem.
2. Apply top compact-support cohomology on fixed finite-type models and étale-topos invariance.
3. Normalize fundamental classes on those models; Zhu A.3.3 does not supply a model-independent trace under Frobenius.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`.

**Sources.** [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 2.8–2.9, pp. 434–436; A.3.3, pp. 479–480.

**Acceptance.** The nonempty torus case has one component and weight dimension one.

**Unclosed obligations.** Rational MV trace normalization on perfect models; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the normalized dimension equality is typed; the nonempty Schubert/semi-infinite intersection, MV components and rational trace model are omitted.

**Planet:** Mirković–Vilonen cycles.

### Prounipotent equivariance invariance

`GeometricSatakeAndFusion:GS1/prounipotent-equivariance` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.prounipotentEquivariance`.

For a group with a finite congruence filtration whose graded pieces are affine vector-group diamonds, forgetting equivariance gives an equivalence on bounded constructible derived categories with prime-to-p coefficients. Applied to L⁺_mG on a bounded Schubert locus, sufficiently deep congruence equivariance adds no data.

**Hypotheses and conventions.** Finite truncation/filtration and bounded support; torsion coefficients of order prime to p, then derived adic limit.

**Construction or proof.**

1. Use S-trivial compact-support cohomology of affine space and the equivariant descent nerve.
2. Induct on the finite filtration, then on degree-one layers in the ordered cover.
3. Apply the finite action truncation; do not apply finite-dimensional arguments directly to the full loop group.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`, `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`, `AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category`, `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`, `AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits`, `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.4.1, pp. 207–208.

**Acceptance.** A vector group has only the trivial bounded prime-to-p equivariant local system; this fails as an unrestricted p-torsion assertion.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** D/DEq must be the supplied bounded complex and prounipotent-equivariant categories. Smoothness and pro-unipotent hypotheses are omitted.

### Conservativity of constant terms

`GeometricSatakeAndFusion:GS1/constant-term-conservativity` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.constantTermConservative`.

For split G and a Borel B, CT_B is conservative on bounded Hecke complexes with quasicompact Schubert support. After a splitting extension this supplies the corresponding criterion for general G/E.

**Hypotheses and conventions.** Bounded support and monodromic/positive-loop equivariance; prime-to-p coefficients.

**Construction or proof.**

1. Use the closed semi-infinite filtration and choose an extremal nonzero stratum.
2. Prounipotent invariance and hyperbolic localization identify its detecting constant term.
3. Descend conservativity along the splitting cover.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/prounipotent-equivariance`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.4.2, pp. 208–209.

**Acceptance.** For a torus the detecting functor is identity; arbitrary unbounded support is excluded.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** CT must be the geometric torus constant term on the bounded-support category; its geometric hypotheses are omitted.

### ULA Hecke complexes

`GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory`.

D^ULA(Hck_G/S,Λ) is the full subcategory of complexes with bounded quasicompact Schubert support whose pullback to Gr_G is universally locally acyclic over S. Switching the two torsors preserves this condition. On one leg over Spd O_C this is equivalent to requiring that every open-cell restriction along a geometric section is locally constant with perfect fibre.

**Hypotheses and conventions.** Support can be locally bounded on the base; a fixed bound is used in each argument. General ULA and stack formalism imported from VS1.

**Construction or proof.**

1. Use the smooth truncated positive-loop quotient charts and VS1’s ULA descent.
2. VI.6.4 identifies ULA via constant terms. VI.6.5 reduces one-leg ULA to stratum restrictions.
3. Demazure generators and prounipotent invariance prove the reverse implication; no arbitrary collision-version of 6.5 is asserted.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/prounipotent-equivariance`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`, `mathlib:Action`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.1–VI.6.5, pp. 211–214.

**Consumers and design of the API.**

- FS VI.6.1–VI.6.5: CT criterion and Demazure generation control ULA objects.
- FS VI.8.1(i): Convolution composes proper relative ULA kernels.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory_finite_action` | compatibility | The typed equivariant-object core is Action DU H, where DU is the supplied ULA category and H is a finite jet group on the chosen bound. |
| `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory_forget` | projection | Forget positive-loop equivariance to the underlying ULA object, keeping its intertwining morphisms. |
| `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory_trivial_action` | constructor | A ULA object has the trivial finite-jet action whenever this is the desired equivariance. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.ula_trivial_group` | degenerate | For the trivial group, an equivariant object has no additional automorphism labels. |
| `TauCeti.Suggested.GeometricSatake.ula_intertwining` | non-example | A morphism between equivariant ULA objects must intertwine every group element; an arbitrary underlying morphism is insufficient. |
| `TauCeti.Suggested.GeometricSatake.ula_action_identity` | compatibility | The finite-jet action obeys the existing Action identity law. |

**Acceptance.** The unit complex is ULA; a locally constant but nonperfect coefficient complex is excluded; one-leg stratum recognition is not asserted at collisions.

**Unclosed obligations.** Stack enhancement and coherent Ind convolution; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** DU is imported as the ULA category, not defined by an unknown proposition. Action DU H is only the discrete equivariant-object core at a chosen level; smooth geometric action/descent, bounded supports, and enhanced ULA kernels are not encoded.

**Planet:** ULA Hecke complexes.

### ULA recognition by constant terms

`GeometricSatakeAndFusion:GS1/ula-constant-term-criterion` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.ulaConstantTermPerfect`.

For a bounded Hecke complex A, the following are equivalent: A is ULA; CT_B A is ULA; for every D→Div^d the torus constant-term pushforward over D is locally constant with perfect stalks. On one-leg or disjoint-leg bases the ULA category is stable under Verdier duality, tensor and internal Hom, cell !/* extensions and cell !/* restrictions.

**Hypotheses and conventions.** Split G and Borel for labels; the disjoint-leg restriction is essential for the complete cell calculus.

**Construction or proof.**

1. Use VI.6.3’s smooth recognition and finite truncated actions.
2. Prounipotent invariance, Demazure generators and conservative CT prove VI.6.4.
3. Apply VI.6.6 one leg at a time on the disjoint locus for VI.6.8.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `GeometricSatakeAndFusion:GS1/constant-term-conservativity`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.4–VI.6.6, VI.6.8, pp. 212–215.

**Acceptance.** No claim that all four cell functors preserve ULA over an arbitrary collision family.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the locally finite-projective coefficient core is typed; the bounded constant-term perfect complex, étale locality and ULA criterion are omitted.

### One-leg ULA special/generic comparison

`GeometricSatakeAndFusion:GS1/integral-family-comparison` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.oneLegULAComparison`.

For a split integral model and one leg, restriction induces equivalences D^ULA(Hck_{Spd O_C},Λ)≃D^ULA(Hck_{Spd C},Λ)≃D^ULA(Hck_{Spd k̄},Λ), compatible with finite Schubert bounds and coefficient change. The special side is identified with perfected scheme charts by the L1/L3 comparison; this is an actual restriction equivalence, not a formal analogy between lattice rings.

**Hypotheses and conventions.** Algebraically closed complete untilt C; split integral model; bounded quasicompact support; prime-to-p/derived adic coefficients.

**Construction or proof.**

1. Use the cellwise locally constant perfect criterion, whose restriction over the strictly local trait is an equivalence.
2. Induct on finite Schubert stratifications with gluing; Demazure generators give essential surjectivity.
3. Use VI.6.7, L1/L3 and perfection invariance to identify the scheme-valued special category.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness`, `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`, `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`, `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`, `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.7, p. 214; VI.7.4, pp. 217–219.

**Acceptance.** An arbitrary non-ULA complex is not transported by this equivalence; split model fixed throughout.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The supplied categories must be the one-leg ULA categories with compatible finite supports. Arbitrary multi-leg collisions are excluded in the document.

### Relative perverse t-structure

`GeometricSatakeAndFusion:GS1/relative-perverse-t-structure` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.relativePerverse`.

On the bounded-support derived category over a leg base S, define perverse ≤0 by the condition that at each geometric point with r distinct untilts and open-cell labels μ₁,…,μ_r, the restriction lies in ordinary degrees ≤−Σ⟨2ρ,μ_i⟩. The opposite aisle is obtained by the glued costalk inequalities. These form a t-structure; pullback in S is t-exact. On ULA objects the relative condition is detected on geometric fibres.

**Hypotheses and conventions.** Use distinct local factors at collisions; bounded support and locally finite Schubert stratification. Stable enhancement and presentability are imported from EDS.

**Construction or proof.**

1. Use the stable enhanced category and Lurie HA 1.4.4.11 to generate the aisle and right orthogonal.
2. Glue finite Schubert pieces; compare on special finite models with EDC.5 via L1/L3.
3. Use hyperbolic localization and ULA to prove the geometric-fibre criterion and base-change t-exactness.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:CategoryTheory.Triangulated.TStructure`, `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`, `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.1–VI.7.4, pp. 215–219.

**Consumers and design of the API.**

- FS VI.7.7–VI.7.8: Flat objects and Satake are defined in this relative heart.
- FS VI.8.1(ii): t-exact constant terms detect convolution bounds.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.relativePerverse_le` | characterisation | On ULA complexes, the nonpositive aisle is detected by the normalized torus constant term in nonpositive ordinary degrees. |
| `TauCeti.Suggested.GeometricSatake.relativePerverse_ge` | characterisation | On ULA complexes, the nonnegative aisle is detected by normalized torus constant term in nonnegative ordinary degrees. |
| `TauCeti.Suggested.GeometricSatake.relativePerverse_existing_heart` | compatibility | Its heart is the intersection of the two degree-zero aisles, using Mathlib TStructure.heart. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.perverse_torus` | degenerate | For a torus, normalized constant term is the identity and the relative perverse structure is the ordinary one. |
| `TauCeti.Suggested.GeometricSatake.perverse_zero` | computation | The zero object belongs to the relative perverse heart. |
| `TauCeti.Suggested.GeometricSatake.perverse_shifted_cell` | compatibility | A smooth d-dimensional cell uses the normalization Λ[d], and on a normalized torus constant term its degree is zero. |

**Acceptance.** On a smooth μ-cell the constant sheaf shifted by ⟨2ρ,μ⟩ is perverse; colliding legs use the cell label of their sum.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** D and DT denote the imported ULA categories with their triangulated structures; CT denotes the conservative normalized constant-term functor. The assumptions asserting that these data arise from the geometric Hecke family are omitted. This is an actual TStructure signature, not a proposition-valued stand-in.

**Planet:** Relative perverse t-structure.

### Equivariant perverse descent and constant terms

`GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.perverseConstantTermExact`.

Pullback of perverse Hecke objects to Gr is fully faithful. For A≤0 and B≥0 the derived Hom is connective. Shifted CT_B[deg⟨2ρ,−⟩] is t-exact and conservative, and the relative t-structure commutes with base change.

**Hypotheses and conventions.** Finite bounded charts and positive-loop equivariance; ordinary scheme perverse input is EDC.5, not EDC.7.

**Construction or proof.**

1. Use FS 7.3: for a connected cohomologically smooth map with section, H⁰Rf_*f*A→H⁰A is an isomorphism in the connective range.
2. Combine finite action truncation with perverse gluing for full faithfulness.
3. Apply MV dimensions and early affine perverse vanishing on the special fibre, then the one-leg comparison and general geometric-point criterion.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS1/constant-term-conservativity`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.2–VI.7.4, pp. 216–219.

**Acceptance.** For a torus the shift is zero; signs must make the μ-cell constant sheaf in perverse degree zero.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** CT must include the root-degree shift, and D the geometric ULA category. Smooth finite-jet stack descent and that identification are omitted.

### Flat perverse objects

`GeometricSatakeAndFusion:GS1/flat-perverse-objects` — definition. Proposed declaration: `TauCeti.Suggested.GeometricSatake.flatPerverse`.

A perverse object A is coefficient-flat if A⊗^L_Λ M is perverse for every Λ-module M. Among ULA objects this is equivalent to shifted torus constant terms having finite projective fibres concentrated in degree zero. Flatness defines a full subcategory; it is not automatic for integral perverse objects.

**Hypotheses and conventions.** Prime-to-p torsion rings and compatible adic systems; the ordinary tensor test uses every module, not just Λ itself.

**Construction or proof.**

1. Use t-exact conservative shifted CT and its compatibility with derived coefficient tensors.
2. Reduce to the algebraic condition that a perfect Λ-complex remains concentrated in degree zero after every tensor.
3. Use Module.Flat/projectivity on finite perfect fibres; retain the all-module test.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`, `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`, `mathlib:Module.Flat`, `mathlib:Module.Projective`, `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.7, pp. 220–221.

**Consumers and design of the API.**

- FS VI.7.7–VI.7.8: Satake imposes coefficient flatness in addition to perversity.
- FS VI.8.1(iii): Tensoring by arbitrary modules tests flatness after convolution.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.flatPerverse_iff` | characterisation | An object is flat perverse when it is in the heart and remains there after derived coefficient tensor with every R-module. |
| `TauCeti.Suggested.GeometricSatake.flatPerverse_module` | compatibility | On the one-point torus, coefficient flatness is Module.Flat: tensoring any injective linear map stays injective. |
| `TauCeti.Suggested.GeometricSatake.flatPerverse_heart` | projection | A flat-perverse object belongs to the Mathlib t-structure heart. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.flat_perverse_zero` | degenerate | The zero object is flat perverse when coefficient tensors preserve zero. |
| `TauCeti.Suggested.GeometricSatake.flat_module_field` | computation | Every vector space over a coefficient field is flat, agreeing with the point-torus test. |
| `TauCeti.Suggested.GeometricSatake.flat_module_integral_nonexample` | non-example | Z/2 as a Z-module is not flat; being concentrated in perverse degree zero does not suffice. |

**Acceptance.** Over Z/ℓ² the module Λ/ℓ has higher Tor and is not coefficient-flat.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The all-module derived tensor functors come from the coefficient supplier. The predicate is fully stated using the existing t-structure heart; the module compatibility specializes it to the existing injectivity characterization of Module.Flat. Derived tensor is not identified with ordinary tensor without flatness.

**Planet:** Flat perversity.

### Standard and costandard objects

`GeometricSatakeAndFusion:GS1/standard-costandard-objects` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.standardCostandard`.

For a one-leg μ-cell of dimension d_μ, Δ_μ=pH⁰j_{μ!}Λ[d_μ] and ∇_μ=pH⁰Rj_{μ*}Λ[d_μ]. These objects are ULA and flat perverse, commute with base/coefficients, and Verdier duality interchanges them with Tate twist d_μ. The canonical map Δ_μ→∇_μ is retained integrally.

**Hypotheses and conventions.** One-leg base, split model; IC has perverse normalization [d_μ], not [2d_μ].

**Construction or proof.**

1. Apply cell ULA calculus and perverse gluing.
2. Use shifted CT and affine perverse vanishing to prove finite free fibres.
3. Use relative duality on the smooth open cell for the Tate twist. The rational isomorphism and uniform torsion bound are a separate target.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/flat-perverse-objects`, `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.5 and VI.7.9, pp. 219–222.

**Consumers and design of the API.**

- FS VI.7.16–VI.7.19: Uniform bounded torsion compares standard and costandard objects.
- Zhu 2.2.2: Rational IC generation uses normalized minimal objects.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.standardCostandard_formula` | characterisation | The standard and costandard objects are perverse H⁰ of j-shriek and j-star of the shifted constant local system Λ[d], respectively. |
| `TauCeti.Suggested.GeometricSatake.standardCostandard_map` | data | Adjunction gives the standard-to-costandard map; its perverse image is the IC object. |
| `TauCeti.Suggested.GeometricSatake.standardCostandard_restriction` | compatibility | Both restrict to the same normalized local system on the open cell. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.standard_zero_cell` | degenerate | For a point cell with identity inclusions the pair is the same constant object. |
| `TauCeti.Suggested.GeometricSatake.standard_open_restriction` | computation | The costandard object restricts to Λ[d] on its own cell. |
| `TauCeti.Suggested.GeometricSatake.standard_h0_normalization` | non-example | The construction takes perverse H⁰ and the geometric dimension shift before forming the standard-to-costandard map; unshifted ordinary H⁰ is not substituted. |

**Acceptance.** At μ=0 both are the unit; over integral coefficients their canonical map need not be an isomorphism.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** jshriek/jstar, jpull, h0 and constant must be the indicated geometric functors and local system. Their geometric identities are omitted, while the existing shift/functor/object types fix the construction order.

**Planet:** Standard Satake objects.

### Rational parity and integral torsion bounds

`GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.standardCostandardBoundedTorsion`.

For fixed μ, Δ_μ→∇_μ is an isomorphism after rationalization, and over Z_ℓ its kernel and cokernel are killed by some ℓ^a uniformly under base change. The rational special-fibre equivariant perverse category is semisimple with simple IC_μ indexed by dominant coweights and constant equivariant local systems.

**Hypotheses and conventions.** Rational statement requires decomposition/parity and connected stabilizers; the integral category is not semisimple.

**Construction or proof.**

1. Import EDC.7’s rational proper direct-image decomposition and parity on Demazure generators.
2. Connected stabilizers rule out additional equivariant simple local systems.
3. Finite-generation and base-change compatibility of fixed-bound CT detect a uniform torsion exponent; this late result is not a prerequisite of early geometric smoothness or the ULA criterion.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/standard-costandard-objects`, `EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`, `ReductiveGroupsPartII:RG2.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.5 end, pp. 219–220; Zhu 2.1, pp. 429–430.

**Acceptance.** The assertion does not set a=0 and does not make integral extensions split.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** M must be the indicated finite cone cohomology on a fixed bound after rational comparison. Uniformity in coefficients/degree and the geometry are omitted.

### Rational special-fibre weights

`GeometricSatakeAndFusion:GS1/rational-weight-concentration` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.rationalWeightsFinite`.

For rational equivariant perverse A on the Witt Grassmannian, H_c^i(S_λ,A)=0 unless i=⟨2ρ,λ⟩. The resulting weight functors are exact. For μ minuscule the weight multiplicities are one at Weyl orbit weights; for quasi-minuscule μ the zero-weight multiplicity is the number of simple roots of the relevant highest-root length. General concentration follows by generation from minimal convolutions.

**Hypotheses and conventions.** k algebraically closed; rational coefficients only; CT normalization uses compact support.

**Construction or proof.**

1. Use Zhu 2.11’s minuscule flag and quasi-minuscule parahoric P¹ resolution; retain the section-at-infinity term missing in 2.2.13.
2. Use the corrected twisted external product and finite-jet U-torsor descent in 2.17.
3. Apply generation by minimal objects (2.16) and exact summands, plus early scheme semismallness for minimal convolution.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`, `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`, `ReductiveGroupsPartII:RG2.4`.

**Sources.** [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 2.7 and 2.11–2.17, pp. 434, 436–440.

**Acceptance.** For the SL₃ highest root, the zero-weight dimension is two; the missing infinity contribution would give the wrong answer.

**Unclosed obligations.** Rational MV trace normalization on perfect models; Quasi-minuscule infinity contribution and minimal generation; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** W must be the concentrated rational weight module of the specified IC object. Its MV basis and the degree-vanishing assertions require enhanced cohomology interfaces and are omitted.

## Satake objects and convolution

`GeometricSatakeAndFusion:GS2`

This aggregate has two substages: the objects/correspondences and their closure/duals. Every underlying target is recorded once with the substage as parent and GS2 in its realised stages. The aggregate accepts coherent bounded convolution and its restriction to all three Satake conditions. It neither imports symmetric fusion to prove closure nor asserts that the total-cohomology filtration has a canonical tensor splitting.

## Satake category, fibre functor and Hecke correspondences

`GeometricSatakeAndFusion:GS2:correspondences`

The full subcategory retains boundedness, ULA, relative perversity and coefficient flatness. Its fibre functor takes total cohomology in every integer degree and has finite projective locally constant fibres. The filtration by semi-infinite weights gives exact faithfulness. Verdier duality and normalized Levi constant terms preserve these objects. Convolution is first constructed in the enhanced ambient category, with proper finite bounds, a twisted external tensor and coherent associator/unit maps. The rational Witt special-fibre adapter proves semismallness and perversity with rational coefficients. Acceptance includes the zero object, exclusion of an object outside the heart, the torus sum of skyscraper labels, and the distinction between a bounded twisted product and an untwisted product.

### Satake category

`GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor` — definition. Proposed declaration: `TauCeti.Suggested.GeometricSatake.satakeCategory`.

Sat^I_G(S,Λ) is the full subcategory of the bounded-support Hecke derived category consisting of ULA, relative perverse, coefficient-flat objects. Equivariance is encoded by the Hecke stack. Pullback to Gr is fully faithful and the switch involution preserves the category. The category is additive and exact under sequences whose terms remain flat; it is not asserted to be abelian.

**Hypotheses and conventions.** Split integral or generic descended setting; all three conditions are required.

**Construction or proof.**

1. Intersect the ULA subcategory with the relative perverse heart and the all-module flatness condition.
2. Use VI.7.7 and perverse descent to obtain the finite-projective constant-term characterization.
3. Use the switch and relative duality for the involution.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `GeometricSatakeAndFusion:GS1/flat-perverse-objects`, `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`, `mathlib:CategoryTheory.Triangulated.TStructure.Heart`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.8–VI.7.9, pp. 221–222.

**Consumers and design of the API.**

- FS VI.8: Convolution must preserve all three conditions.
- HeckeStacksAndLocalShtukas:HS2: Satake complexes provide the Hecke kernel coefficients.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.satakeCategory_full_subcategory` | compatibility | Satake is the full subcategory of the supplied bounded ULA category whose underlying object is flat perverse. |
| `TauCeti.Suggested.GeometricSatake.satakeCategory_inclusion` | projection | The full-subcategory inclusion forgets only the Satake flat-perverse condition and is fully faithful. |
| `TauCeti.Suggested.GeometricSatake.satakeCategory_morphisms` | characterisation | A Satake morphism is the same underlying ULA morphism; no separate morphism condition is imposed. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.satake_zero` | degenerate | A zero ULA object whose underlying object is zero belongs to Satake. |
| `TauCeti.Suggested.GeometricSatake.satake_inclusion_fully_faithful` | compatibility | Morphisms agree with those in the existing Mathlib ObjectProperty full-subcategory construction. |
| `TauCeti.Suggested.GeometricSatake.satake_wrong_degree` | non-example | A ULA object outside the relative perverse heart is excluded from Satake. |

**Acceptance.** A ULA object in the wrong perverse degree is excluded; Λ/ℓ over Λ=Z/ℓ² is excluded by flatness; the unit lies in Satake.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** DU denotes the imported bounded-support ULA category and forgetULA its geometric inclusion. Boundedness is encoded in that input category, not in a new unknown proposition. The actual three-condition Satake subcategory uses Mathlib FullSubcategory.

**Planet:** Satake category.

### Satake cohomology functor

`GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.satakeFibre`.

F^I(A)=⊕_i H^iRπ_*(A∣Gr^I_G) is a locally constant sheaf of finite projective Λ-modules on the leg base. It is exact, faithful and conservative on Satake objects. It has the semi-infinite filtration whose graded pieces are shifted constant terms; over a general base this does not yet give a canonical splitting or a switch-invariant tensor identification.

**Hypotheses and conventions.** Bounded support; A Satake; locally constant finite projectivity is part of the result.

**Construction or proof.**

1. Use proper support, CT filtration and flat-perverse recognition.
2. The associated graded is finite projective concentrated in the normalized degrees, so the filtration proves finite projectivity and exactness.
3. Conservative CT proves faithfulness/conservativity; preserve the filtration until the GS3 tensor comparison.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS1/constant-term-conservativity`, `GeometricSatakeAndFusion:GS1/flat-perverse-objects`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `mathlib:Module.Projective`, `AdicCoefficientsAndComparisons:L0/rational-constructible-coefficients`, `mathlib:Module.Finite`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.10–VI.7.11, pp. 222–223.

**Consumers and design of the API.**

- FS VI.7.10–VI.7.11: The filtered constant-term comparison proves finite projectivity and exact faithfulness.
- GS3 and GS4: The next part equips this functor with tensor compatibility and Tannakian reconstruction.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_cohomology` | characterisation | The fibre at A is the direct sum of all integer-degree cohomology modules; bounded support makes only finitely many degrees nonzero. |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_finite_projective` | structure | The total cohomology module is finite and projective over the coefficient ring. |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_faithful` | structure | Conservative exact constant terms imply that total cohomology is a faithful functor on Satake. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.fibre_torus_rank_one` | computation | A torus skyscraper with one rank-one cohomology module has total cohomology R. |
| `TauCeti.Suggested.GeometricSatake.fibre_zero` | degenerate | If all cohomology modules vanish, total cohomology is the zero module. |
| `TauCeti.Suggested.GeometricSatake.fibre_existing_module` | compatibility | The fibre functor targets existing ModuleCat, and projectivity is the existing Module.Projective predicate. |

**Acceptance.** For a torus skyscraper at λ, F is Λ of rank one; a noncanonical filtration splitting is not advertised as canonical.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** S must be the actual Satake category and H the geometric cohomology functors. Finite support in degree and the CT filtration hypotheses are omitted from the finite-projectivity/faithfulness signatures. No canonical splitting or tensor identification is stated.

**Planet:** Satake cohomology functor.

### Verdier duality of Satake objects

`GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.satakeVerdierBiduality`.

Relative Verdier duality preserves Satake, the biduality map A→D(D(A)) is an isomorphism, and F(D(A)) identifies with the Λ-linear dual of F(A). Normalized Levi constant terms CT_P[deg⟨2ρ_G−2ρ_M,−⟩] preserve Satake and are transitive for nested Levis.

**Hypotheses and conventions.** ULA, flat perverse and bounded proper support; the normalization depends on the chosen parabolic.

**Construction or proof.**

1. Use ULA dualizability and biduality from VS1.
2. Use reversed hyperbolic action, the shifted CT characterization and finite-projective module duality.
3. Use proper relative duality for F and compose parabolic correspondences for transitivity.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `GeometricSatakeAndFusion:GS1/flat-perverse-objects`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `ReductiveGroupsPartII:RG2.5`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.12–VI.7.13, pp. 223–224.

**Acceptance.** On a one-leg smooth cell the dual of Λ[d] is Λ[d](d); the normalized Levi shift is zero for M=G.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** S must be Satake and dual the relative Verdier duality. Levi normalization and geometric coefficient hypotheses are omitted.

### Ambient Hecke convolution

`GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram` — construction. Proposed declaration: `TauCeti.Suggested.GeometricSatake.heckeConvolution`.

The two-step Hecke stack has maps a:Hck×^{L⁺G}Hck→Hck×Hck (an L⁺G-torsor) and b to Hck (composition of modifications). On bounded support b is ind-proper with proper finite bounds. Define A⋆B=Rb_*a*(A⊠B), equivalently Rb_! for those bounds. Composition in the enhanced correspondence 2-category and Ind-extension give a coherent ambient monoidal structure with the unit supported on the trivial modification.

**Hypotheses and conventions.** Use the stack quotient, not a naive product; derived external tensor over Λ; bounds required for pushforward. General correspondence coherence is supplied by EDS and VS0.

**Construction or proof.**

1. Build the stack of three torsors and two punctured isomorphisms; multiplication composes them.
2. Trivialize the intermediate torsor only locally; descent gives a and proper bounded b via GS0.
3. Apply proper base change and projection formula in the enhanced correspondence calculus, then extend across filtered support bounds.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`, `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`, `EnhancedDerivedSheaves:E3`, `VStackSheavesAndLisseCategories:VS0`, `DiamondSixOperations:S2/exchange-pasting-coherence`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8 opening, pp. 224–225.

**Consumers and design of the API.**

- FS VI.8.1: ULA, perversity and flatness are proved for this ambient operation.
- FS VI.8.2 and HS1: Proper ULA kernels provide convolution adjoints and Hecke functors.

| API declaration | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.heckeConvolution_obj` | characterisation | A⋆B is b-star of a-pullback of the derived external product of A and B, with b proper on the chosen bounds. |
| `TauCeti.Suggested.GeometricSatake.heckeConvolution_associator` | structure | The coherent correspondence calculus supplies the associator for convolution. |
| `TauCeti.Suggested.GeometricSatake.heckeConvolution_unit` | structure | The unit is the identity-modification kernel and its left and right unit maps are isomorphisms. |
| `TauCeti.Suggested.GeometricSatake.torusConvolutionLabels` | data | On a torus, convolution support is the Minkowski sum of the two finite coweight supports. |

| Unit test | Kind | Required outcome |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.convolution_unit` | degenerate | Convolving with the identity kernel returns the other kernel. |
| `TauCeti.Suggested.GeometricSatake.convolution_torus_labels` | computation | For a torus, two skyscraper labels convolve to the skyscraper at their sum. |
| `TauCeti.Suggested.GeometricSatake.convolution_twisted_diagram` | compatibility | The typed object formula keeps both a-star descent and b-star pushforward; substituting the external product alone does not satisfy it. |

**Acceptance.** The unit acts on either side; changing an intermediate trivialization does not change the resulting complex.

**Unclosed obligations.** Stack enhancement and coherent Ind convolution; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The input functors must arise from the bounded torsor correspondence. Their properness, external derived tensor, support bounds, coherent correspondence composition, and unit-kernel identifications are omitted. The arbitrary input symbols are functors, not proposition placeholders.

**Planet:** Hecke convolution.

### Associativity and unit of convolution

`GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.convolutionPentagon`.

Iterated composition supplies associator (A⋆B)⋆C≅A⋆(B⋆C), left/right unit isomorphisms, and the pentagon and triangle identities in the ambient bounded-support category, compatible with coefficient and base change when the six operations are defined.

**Hypotheses and conventions.** Enhanced coherence, rather than equality of iterated objects; proper finite bounds and derived tensors.

**Construction or proof.**

1. Use the common three-step Hecke stack and proper base-change/projection-formula isomorphisms.
2. Import coherent composition of correspondences from EDS rather than choosing unrelated associators.
3. The identity modification gives the diagonal kernel and the triangle identities.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `EnhancedDerivedSheaves:E3`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `DiamondSixOperations:S2/exchange-pasting-coherence`, `VStackSheavesAndLisseCategories:VS0`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8 opening, pp. 224–225.

**Acceptance.** Four-fold composition must satisfy the pentagon; associativity alone is not the full monoidal API.

**Unclosed obligations.** Stack enhancement and coherent Ind convolution; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** Only the standard monoidal pentagon is typed; the ambient convolution monoidal instance must be supplied by the enhanced correspondence calculus.

### Rational Witt convolution and semismallness

`GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.rationalConvolutionSemismall`.

On the rational Witt special fibre, the n-fold unbounded convolution Grassmannian is identified with Gr^n by cumulative modifications, but a bounded convolution locus is a twisted product. The bounded multiplication map to Gr_{≤Σμ_i} is proper and stratified semismall: over the λ-stratum fibre dimension is ≤⟨ρ,Σμ_i−λ⟩. Hence twisted convolution of rational equivariant perverse sheaves is perverse.

**Hypotheses and conventions.** k algebraically closed; dominant bounds; rational coefficients; no integral coefficient-flatness inferred from this statement.

**Construction or proof.**

1. Use the lattice-chain Demazure and bounded proper map.
2. Apply Zhu 2.3’s semi-infinite intersection estimate and EDC.5 semismall pushforward.
3. Identify the torsor descent of the twisted external product with the special-fibre restriction of the ambient Hecke convolution.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`, `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`.

**Sources.** [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 2.1.2 and 2.2–2.4, pp. 431–432.

**Acceptance.** For minuscule one-step bounds, twisted convolution still need not be the product of the two flag varieties.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** These dimensions must come from the bounded rational Witt convolution map and a target stratum. Properness and coefficient restrictions are omitted.

## Convolution closure and both duals

`GeometricSatakeAndFusion:GS2:Satake-closure`

Compose proper relative ULA kernels to preserve ULA. Prove the nonpositive aisle bound through the elementary two-leg collision family and normalized constant terms. Use duality for the opposite bound and every coefficient-module tensor for flatness. Proper-kernel adjunction then supplies sw*D(A) as a right dual, with evaluation and coevaluation satisfying both triangle identities; the switch produces the left dual. The one-leg restriction equivalence respects these bounded convolution diagrams. Acceptance is both rigidity structures and the compatible comparison, without symmetry or a fibre-functor tensor isomorphism.

### ULA preservation by convolution

`GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.convolutionULAKernelDual`.

If A and B are ULA bounded Hecke complexes, A⋆B is ULA over the leg base.

**Hypotheses and conventions.** Finite proper bounds; derived tensor; split and generic descended versions.

**Construction or proof.**

1. Use the VS1 ULA criterion as adjointability of kernels, including the proper-relative IV.2.24 variant.
2. Compose adjointable kernels; Verdier duality commutes with bounded proper convolution.
3. Descend across the positive-loop quotient and compatible support bounds.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`, `VStackSheavesAndLisseCategories:VS1`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.1(i), p. 225.

**Acceptance.** ULA preservation does not alone imply perversity.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** The typed core is dualizability of composed proper relative ULA kernels, using the existing rigid-category API; geometric ULA conditions are omitted.

### Nonpositive perverse convolution

`GeometricSatakeAndFusion:GS2:Satake-closure/convolution-perverse-nonpositive` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.convolutionPerverseNonpositive`.

For ULA A,B in relative perverse degrees ≤0, A⋆B is perverse ≤0. The proof uses an elementary two-leg collision family: away from the diagonal it is the external product, and its torus constant terms are locally constant perfect complexes, so the nonpositive bound extends to the collision fibre.

**Hypotheses and conventions.** Coefficient derived tensor and correct cell dimensions; this elementary family is distinct from the coherent symmetric fusion construction of VI.9.

**Construction or proof.**

1. Apply perverse tensor bounds on disjoint legs.
2. Use VI.8.1(ii)’s two-leg family and CT-local constancy to carry the bound across the diagonal.
3. Use conservative t-exact shifted CT to return to G. No GS3:fusion prerequisite is introduced.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula`, `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.1(ii), pp. 225–226.

**Acceptance.** A collision is tested by summed cocharacters; the proof has a geometric family but not a symmetric monoidal Satake theorem.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** D/conv must be the ULA Hecke category and its convolution. The two-leg family and geometric hypotheses are omitted; GS3 fusion is not assumed.

### Closure of Satake under convolution

`GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.convolutionFlatPerverse`.

Convolution of two Satake objects is Satake: it remains ULA, relative perverse and coefficient-flat. Derived tensors against arbitrary coefficient modules remain perverse, so the operation restricts to the flat subcategory.

**Hypotheses and conventions.** All Satake conditions retained; coefficients need not be fields.

**Construction or proof.**

1. ULA follows from VI.8.1(i). Apply the nonpositive result to A,B and their relative Verdier duals.
2. Bounded proper convolution commutes with relative duality, so the dual nonpositive bound yields the nonnegative bound.
3. Tensor by arbitrary coefficient modules and use the flat-perverse criterion to prove coefficient flatness.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-perverse-nonpositive`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`, `GeometricSatakeAndFusion:GS1/flat-perverse-objects`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.1(iii), pp. 225–226.

**Acceptance.** Over Λ=Z/ℓ² a nonflat perverse object is not admitted as a factor.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** D/conv/tensor must be the ULA Hecke category, geometric convolution and derived coefficient tensors. Those supplier conditions are omitted.

**Planet:** Satake convolution closure.

### Duals of Satake objects

`GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity` — theorem. Proposed declaration: `TauCeti.Suggested.GeometricSatake.satakeRigid`.

Every Satake object has both left and right duals for convolution. The right dual is sw*D(A); evaluation and coevaluation come from the adjunction of proper relative ULA kernels and satisfy the two triangle identities. Switching gives the other dual.

**Hypotheses and conventions.** Proper bounded support; ULA; use both left and right rigid structures in the library. No symmetry or fibre-functor monoidality is assumed.

**Construction or proof.**

1. Apply FS IV.2.24 to the bounded Hecke kernel, using the proper target.
2. Use VI.6.2 switch invariance and VI.7.12 Satake Verdier duality.
3. Restrict the resulting unit/counit to Satake using convolution closure and verify adjunction triangles; conclude VI.8.2.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`, `VStackSheavesAndLisseCategories:VS1`, `mathlib:CategoryTheory.RigidCategory`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.2, p. 226; IV.2.24, pp. 125–126.

**Acceptance.** The dual is sw*D(A), not D(A) without switching; it supplies GS3’s subsequently fusion argument.

**Unclosed obligations.** Stack enhancement and coherent Ind convolution; Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** S must be the actual Satake category with its convolution structure. Both duals are asserted; the switch-pullback Verdier formula is in the document.

**Planet:** Satake rigidity.

### One-leg Satake equivalence

`GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison` — comparison. Proposed declaration: `TauCeti.Suggested.GeometricSatake.oneLegSatakeComparison`.

The one-leg ULA restriction equivalence over Spd O_C restricts to equivalences of flat-perverse Satake categories on the generic and Witt special fibres. The functors commute with coefficient change, finite bounds and bounded convolution diagrams and carry the unit and the convolution duals to their corresponding objects.

**Hypotheses and conventions.** Split integral model; chosen C and k̄; the comparison is not asserted for arbitrary multi-leg collision ULA categories.

**Construction or proof.**

1. Use t-exact base change and the all-module tensor criterion on the ULA equivalence.
2. Compare the actual torsor convolution diagrams through the integral family and proper base change.
3. Compare switch, Verdier duality and the unit by their functorial constructions.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`, `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`, `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`, `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`.

**Sources.** [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.7, VI.7.4–VI.7.8 and VI.8, pp. 214, 217–226.

**Acceptance.** The special-fibre comparison imports early L1/L3, without requiring VS3 lisse categories.

**Unclosed obligations.** Typed geometric signatures and unavailable prebuilt line module.

**Prototype boundary.** These are the indicated one-leg flat-perverse ULA categories; the base change geometry and diagram compatibility are omitted.

## Baseline declarations reused

The following are baseline substrates, not already-built geometric Satake targets. Each entry records the exact pinned module and the limited interface it supplies. A similarly named carrier is not evidence for the missing geometric property.

| Declaration | Module at the pin | Interface reused |
| --- | --- | --- |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | The type of p-typical Witt vectors, indexed by a natural p. Its ring laws and perfect-ring properties are reused; ramified Witt coefficient comparison is RF0’s node, not a new definition here. |
| `mathlib:PerfectRing` | `Mathlib/FieldTheory/Perfect.lean` | Perfect rings of characteristic p. Bhatt-Scholze work throughout with perfect F_p-algebras, because for a general F_p-algebra W(R) has p-torsion and W(R)/p -> R need not be an isomorphism; this is the pinned carrier for that hypothesis. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The ordinary scheme carrier and category. Being a perfection of a projective model is a missing target; the existence of Scheme does not establish BS representability. |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Properness of a morphism of schemes. The representing object is a proper perfectly finitely presented scheme, and the fibral descent criterion is for proper maps. |
| `mathlib:ValuationRing` | `Mathlib/RingTheory/Valuation/ValuationRing.lean` | Valuation rings. The proof of the fibral descent criterion reduces to a base whose connected components are spectra of valuation rings. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | Invertible sheaves on a scheme. The line bundle L on the Witt vector affine Grassmannian, the Demazure bundle it descends from, and the line bundle I_S^m/I_S^{m+1} on the divisor are all of this type. Tau Ceti has the carrier; what it does not have is ampleness. |
| `mathlib:CoxeterSystem` | `Mathlib/GroupTheory/Coxeter/Basic.lean` | Abstract Coxeter-system combinatorics only. Affine root data, Cartan/Iwasawa decomposition and parahoric geometry require RG2.4. |
| `tauceti:TauCeti.TitsSystem.bruhatCell` | `TauCeti/GroupTheory/TitsSystem/Bruhat/Basic.lean` | Bruhat cells of a Tits system. Tau Ceti already has the Bruhat decomposition, which is the combinatorial shadow of the Schubert stratification this layer builds geometrically. |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | The abstract paired roots/coroots and their module dualities, not a built split reductive group, Lie-weight decomposition or affine Cartan theorem. |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean` | Reductive affine group schemes over a FIELD k, using [Field k]. This does not provide an integral O_E-model or parahoric group scheme; those are requested from RG2.3. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` | t-structures on a triangulated category, already in the pinned library with IsLE and IsGE. The relative perverse t-structure of GS1 is one of these, so the abstract notion is cited and only its normalisation is planned. |
| `mathlib:CategoryTheory.Triangulated.TStructure.Heart` | `Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean` | The Heart typeclass identifies a heart with a full subcategory of a pretriangulated category; TStructure.heart is the underlying object property. No generic abelian-heart theorem is claimed. |
| `mathlib:CategoryTheory.Pretriangulated` | `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` | Pretriangulated categories, the level at which the t-structure and the recollement of the Schubert stratification are stated. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The Verdier-localization carrier for the derived category of an abelian category, not the stable enhanced sheaf categories or six-operation coherence; EDS owns those extensions. |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | Sheaves valued in a category on a Grothendieck site; the diamond/v-site topology and geometric representability are not provided by this carrier. |
| `mathlib:CategoryTheory.GrothendieckTopology` | `Mathlib/CategoryTheory/Sites/Grothendieck.lean` | Abstract Grothendieck topologies; actual v/h/étale topologies and their descent properties are supplier work. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | Monoidal categories, the structure convolution puts on the bounded sheaf category and on the Satake category. |
| `mathlib:CategoryTheory.LeftRigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Left duals only. The conclusion that all Satake objects have both duals uses the separate RigidCategory carrier. |
| `mathlib:CategoryTheory.Equivalence` | `Mathlib/CategoryTheory/Equivalence.lean` | Equivalences of categories, the form of the special-fibre comparison of the ULA categories over Spd O_C, Spd C and Spd k. |
| `mathlib:CategoryTheory.Comma` | `Mathlib/CategoryTheory/Comma/Basic.lean` | Comma categories, the pinned form of the slice and correspondence categories over which the convolution 2-category is indexed. |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness. Flat perversity is half the definition of the Satake category, and it is what excludes the Tor obstruction to t-exactness of convolution. |
| `mathlib:Module.Projective` | `Mathlib/Algebra/Module/Projective.lean` | Projective modules. Finite projectivity of the cohomology of the fibre functor, of the graded pieces of the lattice filtration and of the local systems appearing in the ULA criterion are all statements at this level. |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. The lattice computation in the GL_n case of the open-cell stabilizer chooses a compatible basis, which is a freeness statement after localisation. |
| `mathlib:CategoryTheory.RigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Both left and right rigid structures. LeftRigidCategory alone cannot state VI.8.2. |
| `mathlib:CategoryTheory.ActionCategory` | `Mathlib/CategoryTheory/Action.lean` | The category of elements of a monoid action, with Groupoid for group actions. This is the local quotient presentation, not stackification. |
| `mathlib:Action` | `Mathlib/CategoryTheory/Action/Basic.lean` | Objects with a monoid homomorphism into their endomorphisms; morphisms intertwine the action. Only the discrete equivariant-object core. |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` | Full subcategories with the existing fully faithful inclusion; their object property must be stated mathematically. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules; paired with Module.Projective for lattice and fibre-functor finiteness. |
| `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness characterized by injectivity preservation of linear maps after tensor; the smallness universe condition is part of the source statement. |

## Supplier requests

The direct stage prerequisites below end the backward chain at their mathematical owner. Where an existing node supplies only part of an interface, the request names the strengthening, and closure remains open. The requested theory is not duplicated in this part.

### CrystallineCohomology:CR.1

Evaluate a locally free crystal on perfect Witt thickenings and obtain its finite projective values and quotient mod p, functorially in perfect bases; the sublattice Grassmannian construction uses this evaluation (Zhu 1.14).

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### CrystallineCohomology:CR.7

The Dieudonné-crystal and Hodge-determinant family interface for Zhu’s canonical Demazure models, compatible with R07’s conventions and the ramified coefficient summands. It does not reprove the classification in R07.2.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### EnhancedDerivedSheaves:E3

Enhanced coherent composition of pull–push correspondences with external tensor, higher associativity/unit maps and Ind extension, compatible with DSO exchange/pasting and VS0 Artin descent. A homotopy-category pentagon statement alone does not give the needed coherent ambient convolution.

Consumers: `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`.

### EnhancedDerivedSheaves:E5:presentability

Lurie HA 1.4.4.11 extension of a generated t-structure to the Ind category, with the small stable generators, closure and accessibility hypotheses checked for the relative perverse category. Existing universal-property-of-ind alone does not prove this extension.

Consumers: `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Dieudonné realization for the specified isogeny chains over perfect residue fields, with covariance, distinguished τ₀-summand, heights and Hodge filtration fixed as in Zhu B.7–B.8. General family crystal theory is requested separately.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6

P-divisible-group deformation and Hodge-line comparison on the smooth projective canonical Demazure family in Zhu B.8–B.9; prove the scheme-map comparison stated only as an appendix sketch.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### KTheoryLowDegrees:Z.3

Determinant of finite projective graded quotients, multiplicativity for short exact sequences and its Picard tensor comparison. This is the elementary determinant interface only; GS projectivity uses the geometric BS §6/§8 route, without BS §5’s K-theoretic determinant construction.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization`.

### PadicHodgeTheory:P8:local-rational

Corrected relative O𝔅⁺_dR period sheaf, filtered integrable universal connection and Griffiths transversality on minuscule flag varieties, with [Sch13c, 7.9] and its corrigendum conventions, yielding the CS 3.4.5 surjectivity construction.

Consumers: `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`.

### ReductiveGroupsPartII:RG2.3

Smooth affine integral/parahoric/Iwahori group models; faithful representations with quasi-affine quotient; compatible Greenberg jets, dilatations, finite-level torsor lifting and Weil-restriction comparisons. The field-only pinned reductive-group category is insufficient. Sources: Zhu 1.1/1.20; SW 19.4, 21.1–21.2; BS 9.2–9.6.

Consumers: `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`.

### ReductiveGroupsPartII:RG2.4

Affine Weyl and extended Weyl data, length/Bruhat order, admissible sets, Cartan and Iwasawa decompositions, rank-one ordinary/Demazure convolution, Kottwitz inertia-component labels, and componentwise adjoint flag comparison with p prime to ∣π₁(G_ad)∣ when required by the corrected GHN theorem. Sources: Zhu 1.4, He 5.6 and its GH10/GHN imports. These strengthen this stage’s existing direction.

Consumers: `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`.

### ReductiveGroupsPartII:RG2.5

Lie G decomposition under a cocharacter, root-pairing conventions, weights of the stabilizer (≤m), opposite parabolics/Levis and dimension sum ⟨2ρ,μ⟩. Minuscule means Lie weights in {−1,0,1}; CS and FS use opposite signs.

Consumers: `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`.

### RelativeFarguesFontaine:RF4:G-torsors

Beauville–Laszlo gluing and effective étale/v-descent for G-torsors on the completed divisor using the already-planned RF2 finite-projective descent, plus Anschütz’s punctured A_inf extension/triviality theorem in SW 21.2.2 with its group-model hypotheses. Do not define another completed divisor ring or another finite-projective descent node.

Consumers: `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`.

### RelativeFarguesFontaine:RF4:vector-bundles

The uniform Banach algebra finite-projectivity criterion [KL15, 2.8.4] used in CS 3.4.3–3.4.6: a finitely presented module with the required locally constant fibre rank is finite projective, and compatible sublattices are detected on geometric field points.

Consumers: `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`.

### SchemeAndStackFoundations:SF.0

Pfp perfect schemes/algebraic spaces and compatible finite-type models up to Frobenius, dimensions, base change and étale-topos invariance (BS 3; Zhu A.1–A.17), plus finite Greenberg realization and perfected Grassmann/Quot bundles. Coordinate-ring perfection is the DIRECT Frobenius colimit, not Mathlib’s inverse-limit Perfection.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`.

### SchemeAndStackFoundations:SF.1

Effective quotients of separated pfp perfect spaces by smooth perfect affine torsors (Zhu A.29–A.31), normalized finite-jet quotients, and finite pushouts/pinching of a finite union of lower Schubert bounds along closed representable intersections BEFORE applying Keel. This repairs BS E39’s boundary representability gap.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`.

### SchemeAndStackFoundations:SF.3

Proper pfp perfect connected-fibre full faithfulness/effective vector-bundle descent (BS 6.1, 6.8, 6.13), including the weaker connected-fibre criterion and compatibility with geometric base change; relative Grassmann structure cohomology, determinant/Picard tensor pullbacks and fibre-trivial line descent.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`.

### SchemeAndStackFoundations:SF.4

Finite/formal Witt vector-bundle v-descent and acyclicity (BS 4.1, 4.4, 4.6), with repaired blowup reduction; integral local-model existence and functoriality identifying the finite admissible Schubert union with the reduced special fibre (GLX 3.3–3.4), and compatible bounded pfp fibre-product models. Local models are an extension in SF’s moduli direction, not an ADLV or shtuka replanning.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`.

### SchemeAndStackFoundations:SF.5

General nef/big/ample/semiample line bundles, exceptional locus, Kodaira decomposition, Keel’s characteristic-p criterion and union/exceptional-locus lemmas, Frobenius-power extension/descent of sections, Stein contraction, Serre vanishing and section growth on perfections. GS keeps only the BS 8.9–8.11 application; all general positivity has this single owner.

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`.

### VStackSheavesAndLisseCategories:VS0

Enhanced six operations and smooth equivariant descent for Artin v-stacks, including nonrepresentable quotient-stack maps, finite congruence charts and coherent proper-kernel correspondences. DSO’s eligible representable operations alone do not cover [*/L⁺G].

Consumers: `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`.

### VStackSheavesAndLisseCategories:VS1

FS IV.6 hyperbolic localization for bounded monodromic Hecke correspondences, its base change/duality/ULA preservation, and FS IV.2.24’s proper-relative ULA-kernel adjointability/biduality refinement beyond the IV.2.23 criterion already in ula-dualizability-criterion. Include pro-unipotent equivariant invariance (VI.4), without confusing geometric unipotent groups with DSO S5’s profinite prime-to-ℓ averaging.

Consumers: `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`.

## Gaps and exact refinement work

### Boundary representability before Keel

BS 8.3’s induction calls the lower-bound union a pfp proper perfect algebraic space before proving it. The SF1 finite-pushout/model request must construct closed intersections and effective pinching in the chosen model, then prove it is the image v-sheaf. This proof must precede the positivity application.

Applies to `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`.

### Zhu B.11 corrected right-factor integrality

X=Ag requires g=A⁻¹X; the printed order XA⁻¹ is incorrect. Verify divisibility of A*X by p² on the displayed open W₃ determinant locus, and compatibility of arbitrary Witt lifts, before claiming that the corrected factor is integral/invertible. The cone statement is a source target with this exact open proof obligation.

Applies to `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`.

### Sketch-only canonical determinant and crystal comparison

Zhu B.1, B.9 and the closing B.3 paragraph are announced without proofs. The R07/CR7 interfaces and the map between the normalized jet model and the p-divisible chain model must prove the Hodge-line determinant comparison; no conjectural normal Cohen–Macaulay property is assumed.

Applies to `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`.

### Rational MV trace normalization on perfect models

Fix a finite model and its Frobenius power for fundamental classes; Zhu A.3.3’s model-independent scalar trace omits p-power degree. Require nonempty geometric intersections, geometrically irreducible components for a scalar trace, and the spreading step in the finite-field point-count route. The integral CT/perverse criterion uses FS instead of a rational MV basis.

Applies to `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`.

### Quasi-minuscule infinity contribution and minimal generation

For the quasi-minuscule P¹ resolution retain the section-at-infinity term absent from Zhu (2.2.13); in SL₃ the zero-weight multiplicity is two. Check the corrected parahoric in type A_n, the finite U-jet torsor/twisted external product in 2.17 and 2.16’s minimal-generation argument with the RG/EDC interfaces.

Applies to `GeometricSatakeAndFusion:GS1/rational-weight-concentration`.

### Stack enhancement and coherent Ind convolution

VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.

Applies to `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`.

### Typed geometric signatures and unavailable prebuilt line module

The suggested file gives concrete algebraic/category cores and identifies every omitted supplier-dependent geometric condition in prototypeNotes. It has no unknown Prop fields. The full file cannot elaborate in the provided shared build because TauCeti.AlgebraicGeometry.LineBundle.Basic has no prebuilt object; the Mathlib-only projection is checked separately. Once supplier carriers and the pinned Tau Ceti object are present, replace the narrowed signatures by the exact geometric statements, including dimensions, properness, ULA, perfect models and locally constant coefficients.

Applies to all 59 nodes.

### Bounded affine-flag dimension and adjoint transfer

The He/GH10 imported fibre argument must be proved on compatible bounded pfp models; the unbounded ind-space need not have finitely many components. RG2.4 supplies rank-one induction and corrected componentwise adjoint comparison; SF4 supplies local-model functoriality for GLX admissible containment. These are precise supplier obligations, not a whole affine-flag isomorphism.

Applies to `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags`.

## Source corrections to verify independently

The statements above use corrected conventions. These 19 findings preserve their original extraction ids and record the checked version. They are candidates, with no independent verdict added by this worker. Short printed fragments identify the fault; the correction and check explain its mathematical effect. BS findings are scoped to arXiv v3 because the publisher did not serve its PDF.

### GeometricSatakeAndFusion/E1 — misprint

Source: `Zhu17`, p412, coweight order. Provenance: `PAPER-ZHU-17/E2`.

Printed fragment/expression: positive roots

Correction: Use positive coroots in the coweight dominance order.

Check: The order is on X_*(T); roots belong to the dual character space. (cc-442dc5) Reclassified to affect nothing: a misprint whose intended form, given in the correction, is fixed by the types and conventions of the surrounding argument; the argument goes through with it.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E2. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E2.

### GeometricSatakeAndFusion/E2 — misprint

Source: `Zhu17`, p. 424, proof of Lemma 1.17, definition of X(R′). Provenance: `PAPER-ZHU-17/E8`.

Printed fragment/expression: Inv(𝓕_i ⇢ 𝓕_{i+1}) = μ_i^*

Correction: Inv(𝓕_i ⇢ 𝓕_{i−1}) = μ_{N+1−i}^* for i = 1, …, N, with maps oriented 𝓕_N ⇢ ⋯ ⇢ 𝓕_0 as in the quasi-isogeny 𝓕_N ⇢ 𝓕_0 used next. Equivalently, keeping the displayed orientation, Inv(𝓕_{i−1} ⇢ 𝓕_i) = μ_{N+1−i}.

Check: (Gr_{μ•})_R consists of chains 𝓔 = 𝓔_N ⇢ 𝓔_{N−1} ⇢ ⋯ ⇢ 𝓔_0 with Inv(β_i) = μ_i. Building it from 𝓕_0 = 𝓔 gives 𝓕_i = 𝓔_{N−i}. Then 𝓕_{i−1} ⇢ 𝓕_i is β_{N+1−i}, of position μ_{N+1−i}, and its inverse has position μ_{N+1−i}^*. The printed condition indexes by μ_i (μ_0 is undefined for i = 0, and the order is not reversed) and attaches the star to the displayed direction 𝓕_i ⇢ 𝓕_{i+1}. That is wrong even when all μ_i are equal: for μ_i = ω_1 the displayed map has position ω_1, not ω_1^*. The rest of the argument (the quasi-isogeny 𝓕_N ⇢ 𝓕_0 = 𝓔 ⇢ 𝓔_0 and the closed locus X_{ω_0}) goes through with the correction. The ledger's 'printed' field was a paraphrase; the quotation above is exact. The same text is in v2 and v3.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E8. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E8.

### GeometricSatakeAndFusion/E3 — misprint

Source: `Zhu17`, p488, determinant unit inB.11. Provenance: `PAPER-ZHU-17/E32`.

Printed fragment/expression: p²[λ]

Correction: Use p²[λ]⁻¹.

Check: Solving the defining equation for detX requires the inverse; for p=5 and unit2, 25·2 and 25·3 differ modulo125. (cc-442dc5) Reclassified to affect nothing: a misprint whose intended form, given in the correction, is fixed by the types and conventions of the surrounding argument; the argument goes through with it.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E32. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E32.

### GeometricSatakeAndFusion/E4 — misprint

Source: `Zhu17`, p. 488, proof of the claim in Lemma B.11 (display defining g̃). Provenance: `PAPER-ZHU-17/E33`.

Printed fragment/expression: g̃ := X̃Ã^{−1} = p^{−2}X̃Ã^*

Correction: g̃ := Ã^{−1}X̃ = p^{−2}Ã^*X̃ ∈ LGL_2. Then X̃ = Ãg̃, and g = (g̃ mod p³) satisfies X = Ag.

Check: Confirmed; the correction should fix both expressions in the display. With the printed order, X̃ = g̃Ã, which contradicts the conclusion X = Ag. The existing counterexample works: A = (p −1; 0 p) is of cone form (x = z = 0, y = 1), g = (1 0; 1 1), X = Ag = (p−1 −1; p p). X lies in W̃ (a_1d_1 − b_1c_1 = 1), and X A^{−1} has entry −1/p². With the corrected order, integrality follows from (B.3.2): X^*A ≡ 0 mod p² gives A^*X = adj(X^*A) ≡ 0 mod p² (for 2×2 matrices adj(adj X) = X), so p^{−2}Ã^*X̃ is integral. Its determinant is a unit.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E33. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E33.

### GeometricSatakeAndFusion/E5 — gap

Source: `Zhu17`, p. 482, Appendix B opening paragraph (not p. 484). Provenance: `PAPER-ZHU-17/E34`.

Printed fragment/expression: Proofs are generally omitted in this section.

Correction: Stated without proof: Prop. B.1, Lemma B.9, and the final paragraph of B.3 (Conjecture I for GL_2, N = 2). Prop. B.2 has a one-sentence justification. It also needs \tilde L_det to be trivial on the fibres of π, which follows from base-point-freeness and the second part of Prop. B.1. Lemma B.4, Lemma B.7 and Prop. B.8 ('Details are left to readers') have only sketches. Also unproved: the claims on p. 485 (that M_{N,h} is an irreducible component of the RZ-type space) and p. 486 (\mathring M_{N,h} ≃ Gr′_N), and the claim in Remark B.6. Lemmas B.10 and B.11 are proved in full on pp. 487–488, apart from the misprints E32 and E33; the appeal to Lemma 1.10 for surjectivity goes through. Bhatt–Scholze prove Conjectures I–II. The main results of §§1–3 do not depend on Appendix B.

Check: The quoted sentence is on p. 482. The existing correction wrongly lists B.10 and B.11 as unproved. Specific points: Prop. B.2's sentence ('the pushforward of \tilde L_det gives L_det') also needs \tilde L_det trivial on the fibres of π. That follows from base-point-freeness together with Prop. B.1's second part (degree 0 on fibre curves) and π_*O = O (Lemma A.21). The hint for B.4 also needs the fibres of V_{N,h} → \overline{Gr}_N to have constant dimension; this holds, since the stabilizer {γ: Aγ = A} has dimension nN everywhere. The main theorems do not depend on Appendix B. Remarks 1.15 and 1.16 point to B.3 and B.8, but they are remarks.

Effect: a stated result. Existing correction search: Previously recorded as PAPER-ZHU-17/E34. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E34.

### GeometricSatakeAndFusion/E6 — misprint

Source: `Zhu17`, p. 425, proof of Lemma 1.18 (positive dimension of fibres); also p. 425, proof of Lemma 1.18 (last paragraph). Provenance: `PAPER-ZHU-17/E44`.

Printed fragment/expression: some i; dim_k(Λ_λ ∩ p^iΛ_0/Λ_λ ∩ p^{i+1}Λ_0) > 1

Correction: Replace ∩ by +: for λ < Nω_1, dim_k((Λ_λ + p^iΛ_0)/(Λ_λ + p^{i+1}Λ_0)) > 1 for some i (e.g. i = 0). Every hyperplane 𝓔_1 ⊂ Λ_0 containing Λ_λ + pΛ_0 extends to a point of π^{−1}(p^λ), so the fibre surjects onto ℙ^{d−1,p^{−∞}} with d = #{j : l_j ≥ 1} ≥ 2. Also: Replace ∩ by + in both places: dim_k (Λ_λ + p^iΛ_0)/(Λ_λ + p^{i+1}Λ_0) > 1 (this holds at i = 0 when λ < Nω_1), and lines L in this space give the lattices Λ_λ + p^{i+1}Λ_0 + L̃, which extend to full chains. Equivalently, dim (p^{-1}Λ_λ ∩ Λ_0)/Λ_λ = #{j : m_j ≥ 1} ≥ 2, the fibre of π_2 from the preceding paragraph.

Check: For λ = (l_1 ≥ … ≥ l_n ≥ 0) with Σ l_j = N, Λ_λ ⊂ Λ_0 and Λ_λ ∩ p^iΛ_0 = ⟨p^{max(l_j,i)}e_j⟩, so the printed dimension is #{j : l_j ≤ i}. For n ≥ 2 this exceeds 1 for every λ once i ≥ l_1, including λ = Nω_1, whose fibre is a single point by the first part of the lemma. Moreover these subquotients lie inside Λ_λ, while points of π^{−1}(p^λ) are chains of lattices between Λ_λ and Λ_0, so lines in them do not give points of the fibre. With + the dimension is #{j : l_j ≥ i+1}, which for i = 0 is at least 2 exactly when l_2 ≥ 1, i.e. λ ≠ Nω_1. The intended argument is then correct. The same text is in v2 (with 𝓔_λ) and v3. It is classified as a misprint (∩ for +); a verifier could argue for 'error', since the step fails as printed.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E44. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E44.

### GeometricSatakeAndFusion/E7 — error

Source: `Zhu17`, p. 433, Proposition 2.5 (second sentence). Provenance: `PAPER-ZHU-17/E46`.

Printed fragment/expression: overline(S_λ ∩ Gr_{≤μ}) = ⋃_{λ′≤λ} S_{λ′} ∩ Gr_{≤μ}

Correction: Replace the second sentence by S̄_λ ∩ Gr_{≤μ} = ∪_{λ′≤λ}(S_{λ′} ∩ Gr_{≤μ}), which follows from the first. Or restrict to λ a weight of V_μ (equivalently S_λ ∩ Gr_{≤μ} ≠ ∅) and supply a proof of closure(S_λ ∩ Gr_{≤μ}) = S̄_λ ∩ Gr_{≤μ}.

Check: If S_λ ∩ Gr_{≤μ} = ∅ but some λ′ ≤ λ has S_{λ′} ∩ Gr_{≤μ} ≠ ∅, the left side is empty and the right side is not. Example: G = GL_2, μ = (1,0), Gr_{≤μ} = P^1, λ = (2,−1) = (1,0) + α^∨. S_{(2,−1)} ∩ Gr_{≤μ} = ∅, since its lattices contain p^{-1}(xe_1 + e_2) ∉ Λ_0. The right side is S_{(1,0)} ∩ P^1 ∪ S_{(0,1)} ∩ P^1 = P^1. The proof only cites [Zhu16, Prop. 5.3.6], which I checked: it proves S̄_λ = ∪_{λ′≤λ} S_{λ′} and says nothing about closures of the intersections with Gr_{≤μ}. For weights λ the refinement is plausible (I checked GL_2, μ = (2,0) and GL_3, μ = (1,0,−1) by hand) but it is not proved. subsequently arguments (Corollary 2.10, (2.2.11)) only use S̄_λ. The same wording is in arXiv v2 (Lemma 2.5) and v3.

Effect: a stated result. Existing correction search: Previously recorded as PAPER-ZHU-17/E46. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E46.

### GeometricSatakeAndFusion/E8 — misprint

Source: `Zhu17`, p. 434, Corollary 2.8; p. 439, Corollary 2.14. Provenance: `PAPER-ZHU-17/E47`.

Printed fragment/expression: equidimensional; dim(S_λ ∩ Gr_{≤μ}) = (ρ, λ + μ)

Correction: Add 'if nonempty, i.e. if λ is a weight of V_μ' to the dimension clause of Cor. 2.8, and 'if nonempty, i.e. if each λ_i is a weight of V_{μ_i}' to Cor. 2.14.

Check: For λ not a weight of V_μ (e.g. λ = μ + α^∨) the scheme is empty, so the dimension formula fails literally. The component count dim V_μ(λ) = 0 remains correct. This is the same kind of missing nonemptiness hypothesis as the recorded E19; keep the classifications consistent (I lean to misprint, since the intended reading is clear).

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E47. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E47.

### GeometricSatakeAndFusion/E9 — misprint

Source: `Zhu17`, p. 435, Corollary 2.9. Provenance: `PAPER-ZHU-17/E49`.

Printed fragment/expression: cycle classes; H^i_c(S_λ, IC_μ)

Correction: …form a basis of H_c^{(2ρ,λ)}(S_λ, IC_μ) = CT_λ(IC_μ).

Check: The index i is free. The cycle classes live in degree (2ρ,λ), which by Proposition 2.7 is the only nonzero degree.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E49. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E49.

### GeometricSatakeAndFusion/E10 — error

Source: `Zhu17`, p. 436, proof of Corollary 2.10. Provenance: `PAPER-ZHU-17/E51`.

Printed fragment/expression: Fil′_{<λ}H^*(A) = Im(H^*_{S⁻_{<λ}}(A) → H^*(A)); H^* = ⊕_λ H_c^*(S_λ, −)

Correction: Use Im(H^*_{S̄^-_λ}(A) → H^*(A)), as in [MV07, Th. 3.6]. Fix k = (2ρ,λ). Parity and degree give H^k_{S̄^-_λ}(A) = H^k_{S^-_λ}(A) and H^k(S̄_λ,A) = H^k_c(S_λ,A). The composite H^k_{S̄^-_λ}(A) → H^k(A) → H^k(S̄_{λ′},A) is the isomorphism of (2.2.10) (hyperbolic localization at ϖ^λ) for λ′ = λ. It is zero for λ′ ≠ λ of the same degree, since a nonempty closed G_m-stable S̄^-_λ ∩ S̄_{λ′} contains some ϖ^η with λ ≤ η ≤ λ′. Hence H^k(A) = ⊕_{(2ρ,λ)=k} Im(H^k_{S̄^-_λ}(A) → H^k(A)), which gives H^* ≅ ⊕_λ H^*_c(S_λ,−).

Check: By Proposition 2.5, S̄^−_λ − S^−_λ = ∪_{λ′>λ} S^−_{λ′}. By (2.2.10) and Proposition 2.7, H^k_{S^−_{λ′}}(A) = 0 unless k = (2ρ,λ′) > (2ρ,λ). So the printed Fil′_{<λ} vanishes in degree (2ρ,λ) and cannot split off the λ-piece. Morally it is ⊕_{λ′>λ}, which lies inside Fil_{≥λ} instead of complementing it. Counterexample to the claimed complementarity: GL_2, A = IC_{(1,0)} = Q̄_ℓ[1] on P^1, λ = (0,1). Here Fil_{≥λ} = H^*(A), because S_{<λ} ∩ P^1 = ∅. But Fil′_{<λ} is the image of H^*_{pt}(A) with pt = ϖ^{(1,0)}, which is H^1 ≠ 0. The corollary is right by the MV argument the proof cites. Same text in arXiv v3.

Effect: the proof. Existing correction search: Previously recorded as PAPER-ZHU-17/E51. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E51.

### GeometricSatakeAndFusion/E11 — error

Source: `Zhu17`, p. 437, item (2) before Lemma 2.12. Provenance: `PAPER-ZHU-17/E52`.

Printed fragment/expression: a maximal parahoric

Correction: Delete item (2), or state: Q_{1/2} is the parahoric of −θ/2, whose reductive quotient contains the SL_2 of the affine roots ±(θ^∨+1). It is maximal unless the simple factor containing θ is of type A_n with n ≥ 2.

Check: Q_{1/2} is the parahoric of −θ/2 (v2: 'the point −μ/2 is a vertex'). The affine roots vanishing there are ±(θ^∨ + 1) and the roots orthogonal to θ. These have full rank only if the roots orthogonal to the highest root have rank r − 1, which fails in type A_n, n ≥ 2, where they have rank n − 2. For SL_3, θ = (1,0,−1) pairs to 1 or 2 with every positive root. So −θ/2 lies on the single wall θ^∨ + 1 = 0, inside an edge, and Q_{1/2} is properly contained in the parahorics of the edge's two vertices. Type A is covered by the paper: θ ∈ M (p. 439) and Lemma 2.11 includes it. The claim is not used in any proof.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E52. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E52.

### GeometricSatakeAndFusion/E12 — error

Source: `Zhu17`, p. 439, proof of Lemma 2.11 (μ = θ): display for π^{-1}(S_0 ∩ Gr_{≤μ}) and (2.2.13). Provenance: `PAPER-ZHU-17/E53`.

Printed fragment/expression: RΓ_c(π⁻¹(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) = RΓ_c(⋃_{wμ<0} ŪwP̄_μ/P̄_μ, Q̄_ℓ[d − 2])

Correction: With Y = ∪_{wμ<0} ŪwP̄_μ/P̄_μ, π^{-1}(S_0 ∩ Gr_{≤μ}) = [φ^{-1}(Y) \ π^{-1}(∪_{wμ<0} S_{wμ} ∩ Gr_{≤μ})] ⊔ [π^{-1}(Gr_0) ∩ φ^{-1}(Ḡ/P̄_μ − Y)], where π^{-1}(Gr_0) ≅ Ḡ/P̄_μ is the section at infinity. So (2.2.13) should read RΓ_c(π^{-1}(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) = RΓ_c(Y, Q̄_ℓ[d−2]) ⊕ RΓ_c(Ḡ/P̄_μ − Y, Q̄_ℓ[d]); the sequence splits since all terms are in even degrees. Comparison with (2.2.12) then gives H^i(𝒞) = H^i_c(π^{-1}(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) for i ≠ 0 and H^0_c(S_0, IC_μ) ≅ Q̄_ℓ^{∣Δ_θ∣}.

Check: Cells of Ḡ/P̄_θ: for β = wθ > 0 the dimension is ht θ + ht β − 1; for β < 0 it is ht θ − ht(−β); and d = 2 ht θ. With the printed (2.2.13), H^i_c vanishes for i > 0, yet H^i(C) = H^{i+d}(Ḡ/P̄_μ) ≠ 0 whenever some positive β ∈ Wθ has height 1 + i/2. In degree 0 both sides have dimension ∣Δ_θ∣, which would give H^0_c(S_0, IC_μ) = 0. Check for SL_3: Ḡ/P̄_θ is the flag variety and C = Q̄_ℓ[2] ⊕ Q̄_ℓ^2 ⊕ Q̄_ℓ[−2]. The printed (2.2.13) gives Q̄_ℓ[2] ⊕ Q̄_ℓ^2, so H^0_c(S_0, IC_θ) = 0 and the degree-2 term would be negative. The corrected formula gives H^0_c = Q̄_ℓ^2 = V_θ(0). The final conclusion (and the [NP01, §8] computation it defers to) is right. The same display is in arXiv v2 and v3.

Effect: the proof. Existing correction search: Previously recorded as PAPER-ZHU-17/E53. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E53.

### GeometricSatakeAndFusion/E13 — misprint

Source: `Zhu17`, A.3.5, last paragraph, p. 482. Provenance: `PAPER-ZHU-17/E71`.

Printed fragment/expression: pro-unipotent pro-algebraic group

Correction: Require J_1 to be connected (as for the congruence subgroups L^+G^{(h)} used in the paper). Two admissible choices J_1, J_1' are then compared through the connected, normal, pro-unipotent subgroup J_1J_1' (or through J_1 ∩ J_1'), applying (A.3.4) to the connected groups J_1J_1'/J_1 and J_1J_1'/J_1', and (A.3.6) for cohomology.

Check: (A.3.4) is stated only for connected J_1, but the condition allows disconnected unipotent J_1 (finite p-groups are unipotent in characteristic p). Counterexample: J = Z/p (constant), X = Spec k. Both J_1 = J and J_1' = {1} satisfy the condition, but P_{J/J}(X) = Vect while P_{J/{1}}(X) = Rep_{Qlbar}(Z/p), which has p simple objects. This also conflicts with the earlier definition of P_J for pfp J. The cohomology half is fine, since (A.3.6) holds for any unipotent J_1 (l != p). In the paper J_1 is always a connected congruence subgroup, so nothing downstream is affected.

Effect: nothing. Existing correction search: Previously recorded as PAPER-ZHU-17/E71. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E71.

### GeometricSatakeAndFusion/E14 — misprint

Source: `BS17-witt-grassmannian`, arXivv3 Lemmas7.7–7.8 pp28–29; Definition7.10 convention. Provenance: `PAPER-BHATT-SCHOLZE-17/E10`.

Printed fragment/expression: projective dimension 1

Correction: Use projective dimension at most one, or separately exclude Q=0 when claiming equality one.

Check: The identity isogeny has cokernel zero and the zero R-module is projective; its projective dimension is not exactly one under the usual conventions. (cc-442dc5) Reclassified to affect nothing: 'projective dimension 1' is used as 'at most one' throughout Lemmas 7.7–7.8 and Definition 7.10, and the zero module causes no problem in the determinant construction.

Effect: nothing. Existing correction search: Previously recorded as PAPER-BHATT-SCHOLZE-17/E10. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E10.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

### GeometricSatakeAndFusion/E15 — misprint

Source: `BS17-witt-grassmannian`, arXiv v3, Lemma 7.9, p. 29. Provenance: `PAPER-BHATT-SCHOLZE-17/E12`.

Printed fragment/expression: Spec(R)_{≤λ} ⊂ {x ∈ Spec(R) ∣ λ(Q ⊗ W(k(x))) ≤ λ}

Correction: Spec(R)_{≤λ} := {x ∈ Spec(R) ∣ λ(Q ⊗ W(k(x))) ≤ λ} is a closed subset of Spec(R).

Check: The display defines the locus, and the proof on p. 32 shows that this whole set is closed (it is the image of Dem_λ(Q)). With '⊂' the statement would say nothing about which subset. The verdict is 'revised' only because the recorded 'printed' text paraphrased the display; the substance of E12 stands. Present in v1 and v2.

Effect: nothing. Existing correction search: Previously recorded as PAPER-BHATT-SCHOLZE-17/E12. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E12.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

### GeometricSatakeAndFusion/E16 — gap

Source: `BS17-witt-grassmannian`, p. 35, proof of Theorem 8.3, second paragraph. Provenance: `PAPER-BHATT-SCHOLZE-17/E39`.

Printed fragment/expression: By induction; L∣⋃_{μ<λ}Gr_{≤μ}

Correction: Before invoking Keel, show that Y = ∪_{μ<λ}Gr_{≤μ} is the perfection of a proper algebraic space. Here Y is the image sheaf of ⊔_{μ<λ}Gr_{≤μ}, equivalently the closed complement of Gr_λ. The map ⊔Gr_{≤μ} → Y is a v-cover. Its equivalence relation is given by the closed intersections Gr_{≤μ} ×_{Gr_{≤λ}} Gr_{≤μ'}. So Y is the iterated pushout of the Gr_{≤μ} along these intersections. Affine-locally this pushout is A1 ×_{A12} A2, which is perfect and satisfies A1 ⊗_A A2 = A12. On finite-type models the pushout is a proper algebraic space by [Ar70, 6.1]. Next, every subvariety of Y lies in some Gr_{≤μ}, where L is ample, so E(L∣_Y) = ∅. Keel's Lemma 1.8, applied inductively over the pieces, then makes L∣_Y semiample. Its morphism contracts no curve, hence is finite, so L∣_Y is ample. Alternatively, cite Zhu's Theorem 8.2, which makes Y a closed subspace of a proper perfect algebraic space; but then the proof is no longer independent of Zhu as claimed (p. 32).

Check: Keel's Lemma 1.8 is a gluing statement for semiampleness on a proper algebraic space X = X_1 ∪ X_2 with E(L) ⊂ X_1. To obtain ampleness it has to be combined with E(L) = ∅ and Nakai. Applying it requires Y = ∪_{μ<λ} Gr_{≤μ} to be (the perfection of) a proper algebraic space. The induction hypothesis makes each Gr_{≤μ} a projective perfect scheme, but not their union inside the v-sheaf Gr_{≤λ}, whose representability is what is being proved. The union is not a single Gr_{≤μ} in general: for n = 3, λ = (4,2,0), both (3,3,0) and (4,1,1) are maximal below λ and are incomparable. Applying Keel's lemma on the scheme ψ^{-1}(Y) instead does not work, since the exceptional locus there does not lie in one piece. Defence: the missing step is standard and fillable (pinching of perfect schemes along closed subschemes, or gluing sections as above). Theorem 8.3 itself is not in doubt.

Effect: the proof. Existing correction search: Previously recorded as PAPER-BHATT-SCHOLZE-17/E39. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E39.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

### GeometricSatakeAndFusion/E17 — error

Source: `BS17-witt-grassmannian`, p. 37, the sentence introducing Kottwitz' map and Proposition 9.7 ([Zhu14, Proposition 1.21]). Provenance: `PAPER-BHATT-SCHOLZE-17/E41`.

Printed fragment/expression: π₁(G)_{Gal_K}

Correction: Add the hypothesis 'k algebraically closed' (as in [Zhu14, §1.5.2]); then Gal_K is the inertia group. For a general perfect k: Kottwitz's map is κ: LG(k̄) = G(W_{O_K}(k̄)[1/p]) → π1(G)_{I_K}, where I_K ⊂ Gal_K is the inertia subgroup. It induces Gal(k̄/k)-equivariant bijections π0(LG_{k̄}) ≅ π0(Gr_{𝒢,k̄}) ≅ π1(G)_{I_K}. The connected components over k are the Gal(k̄/k)-orbits on π1(G)_{I_K}.

Check: §9 fixes only a perfect residue field k, but Zhu states Prop. 1.21 in a subsection (§1.5.2 of arXiv v1/v2, §1.4.2 of v3) that opens 'We assume that k is algebraically closed'. Kottwitz's map for the field W_{O_K}(k̄)[1/p] = K̆ lands in the inertia coinvariants π1(G)_{I_K}, not in π1(G)_{Gal_K}. Counterexample for finite k: let K'/K be unramified quadratic with residue field k', T = Res_{K'/K} G_m, and 𝒢 = Res_{O_K'/O_K} G_m its connected Néron model (parahoric). Then Gr_𝒢 = Res_{k'/k}(Z), whose geometric components form Z² with Frobenius swapping the factors, while π1(T)_{Gal_K} = Z²/(e1−e2) = Z. Neither the k-components (Frobenius orbits, e.g. {(0,0)} and {(1,−1),(−1,1)} both lying over 0) nor the geometric components (Z²) are in bijection with Z. Defence: for k algebraically closed, the case of Zhu's source, the statement is correct. The only subsequently use, in the proof of Proposition 10.3 for SL_n where π1 = 0, is unaffected. The same text appears in v1 and v2.

Effect: a stated result. Existing correction search: Previously recorded as PAPER-BHATT-SCHOLZE-17/E41. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E41.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

### GeometricSatakeAndFusion/E18 — gap

Source: `BS17-witt-grassmannian`, p. 37, Proposition 10.1 (second assertion) and its proof. Provenance: `PAPER-BHATT-SCHOLZE-17/E42`.

Printed fragment/expression: L = det̃_R(p^a W_{O_K}(R)^n/M)

Correction: Add the argument. Choose a W(k)-basis of O_K, so that W_{O_K}(R)^n = W(R)^{ne}. On a bounded piece X ⊂ Gr_{SL_n} (proper by Corollary 9.6), for a ≪ 0 the map M ↦ p^{-a}M ⊂ W(R)^{ne} sends X into some Gr_{≤λ} for GL_{ne}. The cokernel is Q = W(R)^{ne}/p^{-a}M ≅ p^aW_{O_K}(R)^n/M, killed by a bounded power of p, of constant length −ane. This map is proper and injective on points, hence finite (pass to finite-type models). By definition of det̃ on K(W_{O_K}(R) on R), L∣_X is the pullback of the Theorem 8.3 bundle det̃(Q). So L∣_X is ample by Theorem 8.3.

Check: The proof constructs L and notes independence of a, but never addresses the asserted ampleness. For ramified O_K the lattices are W_{O_K}(R)-lattices, and Theorem 8.3 (stated for W(R)-lattices in W(R)^n) does not apply without the restriction-of-scalars comparison. Proposition 10.5 (Serre vanishing, infinite-dimensionality) depends on this ampleness. The missing argument is short and the statement is true.

Effect: the proof. Existing correction search: Previously recorded as PAPER-BHATT-SCHOLZE-17/E42. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E42.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

### GeometricSatakeAndFusion/E19 — misprint

Source: `BS17-witt-grassmannian`, p. 37, last paragraph (after Proposition 10.1). Provenance: `PAPER-BHATT-SCHOLZE-17/E43`.

Printed fragment/expression: det_R(p^a W_{O_K}(R)^n/gW_{O_K}(R)^n)

Correction: det̃_R(p^aW_{O_K}(R)^n/gW_{O_K}(R)^n) (up to the canonically trivial factor det̃_R(p^aW_{O_K}(R)^n/W_{O_K}(R)^n)^{-1})

Check: p^a W_{O_K}(R)^n / g W_{O_K}(R)^n is not killed by p, hence not an R-module, so det_R is undefined. The extended determinant det̃_R of Theorem 5.7 and Proposition 10.1 is meant. The normalizing factor is a trivial line bundle, and the proof of Proposition 10.4 uses det̃_k correctly.

Effect: nothing. Existing correction search: Previously recorded as PAPER-BHATT-SCHOLZE-17/E43. The corresponding source passage was checked in this run; no separate published correction verified here.

Search record: The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E43.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

## Proposed structure and upstream observations

These changes are proposals in the packet. The atlas base and other roadmaps are not edited by this job.

- Make SF0/SF1 the single owner of perfect pfp models/effective quotient and boundary pinching theory, SF3/SF4 the owner of general bundle descent and SF5 the owner of all general positivity/Keel theory. GS0:Witt-geometry owns their determinant-line and projectivity application. Remove the old text “sub-obligation here” and add the supplier edges. RF2’s completed-ring descent is imported by its existing node, never reconstructed.
- GS0 imports L1 scheme diamondification and D6 pre-adic diamondification/topological comparison; do not declare nonanalytic v-sheaves diamonds without an additional representability theorem. GS1 imports early L1/L3 and EDC5 perversity/recollement. Drop EDC4 and VS3 lisse-category prerequisites here. EDC7 appears only in rational standard/costandard torsion refinement; it does not precede GS0 smoothness.
- Reverse the atlas edge GS3:fusion→GS2:Satake-closure. FS VI.8.1–VI.8.2 prove closure and duals first; VI.9 then uses dualizability. VI.8.1(ii) uses an elementary two-leg collision family, which is explicitly planned here, but not VI.9’s coherent symmetric fusion. Keep GS2:correspondences before closure and closure before GS3; generic bounded properness and integral Witt properness remain distinct targets.
- Refine existing supplier directions by the exact requests in this packet. In particular Scheme and stack foundations, Part II: perfect models, pinching and integral local-model functoriality extends SF0/SF1/SF4; Relative Fargues–Fontaine, Part II: punctured A_inf torsors extends RF4; V-stack sheaves and lisse categories, Part II: hyperbolic localization and proper relative ULA kernels extends VS1; Enhanced derived sheaves, Part II: coherent kernel correspondences extends E3/E5; Reductive groups, Part II already owns parahoric/affine-root and adjoint comparisons. These are extensions of the named owners, not new GS-owned general theories.

- `Mathlib/RingTheory/Perfection.lean at 082e2d3`: The existing Perfection carrier is the inverse limit under Frobenius; Zhu/BS coordinate perfection is the direct colimit. This is a baseline distinction for the maintainer, with no requested edit to an upstream Tau Ceti roadmap.
- `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean at f790474`: ReductiveAffineGroupSchemeCat is field-based. Integral reductive/parahoric models used here require the proposed RG2.3 extension; no change to an upstream roadmap is proposed.

## Suggested-file validation

The full suggested file imports the pinned Tau Ceti scheme line-bundle module. The supplied shared build lacks its prebuilt object, so the complete file has not elaborated. A projection retaining every Mathlib-supported block and excluding just that import and the two blocks using `InvertibleSheaf` elaborates at the Mathlib pin with only admitted-proof warnings. This validates the remaining core signatures and examples; it does not validate the two omitted blocks or their geometric hypotheses. No library build is required or attempted by this plan.
