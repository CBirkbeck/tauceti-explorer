# Independent package review: Faltings finiteness and isogeny theorems

**Verdict: accepted after fixes.** Review issue #9214, job
`REV-PKG-FaltingsFinitenessAndIsogenyTheorems`; reviewer Codex, session `codex-gRdm3S`,
2026-10-14. The package was written by a different worker. This is a completed fixing
review, not a checkpoint. No unresolved source or interface defect remains in the
package. Its heavy constructions remain roadmap targets, and the representative Lean
statements remain unproved theorem signatures.

## Scope, baseline and shape

Read WORKERS.md, PROTOCOL.md, the expansion protocol, UPSTREAM_GUIDE.md and
PACKAGE_REVIEW.md. Read the full package and its author handoff, the six-layer packet,
the supplier contracts and the Caraiani–Newton tier ordering. Compared the document
with the upstream JacobianChallenge and RepresentationTheory/SemisimpleAlgebras
roadmaps, including their Suggested.lean files. The finished package retains its six
layers and full mathematical detail: exact hypotheses, proof routes, source locators,
named suppliers, definition APIs, discriminating checks and worked examples.

The current upstream roadmap baseline was commit
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The elaboration baseline was Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. These are different comparisons:
current upstream decides ownership; the pinned libraries decide which signatures can
be stated now. No build was run in either current upstream checkout.

There are 60 numbered subsections after removing two duplicate application targets.
The moved polarization-descent section and subsequent references are renumbered;
there are no removed-target stubs. README and Suggested.lean use upstream prose and
namespace conventions. Definition API lists have been recast as prose introductions,
and source results are described in the worker's own words. No source passage, source
file or section-by-section source summary is part of the deliverable.

## Corrections applied

- Moved `Polarization.descend` before `principalReduction_uniform`: the original
  Layer 1 proof needed a Layer 3 target. The new R28.1.12 supplies it, followed by
  R28.1.13; old R28.3.6–R28.3.9 become R28.3.5–R28.3.8.
- Repaired the homomorphism-extension argument. A generic fibre is dense but need
  not be open; generic data must first spread to a dense open before applying the
  normal-base extension theorem. Removed the invented finite-normalization argument.
- Repaired the correspondence construction's properness interface. A proper total
  space does not imply that an open projection is proper. The open graph projection
  uses the proper stable-curve stack; the all-prime integral compactification is the
  explicitly owned `CorrespondenceStack.compactify` target of Faltings' Lemma 2.
  Good-prime PEL compactifications are used only over the stated characteristic-zero
  bases and do not purport to supply the missing integral fibres.
- In Northcott's proof, rescale the continuous metric while retaining the integral
  sections; multiplying integral sections by an arbitrary real number is invalid.
- Corrected the tame/wild different convention, the zero-dimensional cases of Satz 1,
  Satz 5 and Satz 6, and the multiplication-by-negative-integer isogeny check.
- The degree-one polarization quotient is trivial, but semistable reduction and the
  finiteness of split forms still require proof. Likewise the whole Tate tower has
  constant height but is not maximal isotropic in positive dimension.
- Finite-index semisimplicity uses left coset representatives when the extension is
  nonnormal; only the endomorphism-descent part assumes a Galois extension.
- Distinguished the monic characteristic polynomial `det(X-F_v)` from the local
  factor `det(1-F_v T)`. The latter has constant coefficient one, and is not generally
  monic. Restricted the non-isogenous-Hom-vanishing example to elliptic curves;
  higher-dimensional varieties can share a simple factor.
- Added separate checks for all five real-bodied Lean definitions, including the
  order of coefficient action, blockwise sums, graph signs and fractional ideals.
  Right multiplication by `i` sends the third basis vector to minus the fourth.
  Stated the characteristic-zero Lean scope exactly and registered the
  characteristic-not-two dimension and recovery companions needed modulo odd primes.
- Strengthened `finite_stableLattices`: a stable starting lattice is an explicit
  hypothesis, and each member of the finite representative set is a stable lattice.
  Strengthened `hom_isogenous_cyclic` to a nonzero generator and unique integer
  coefficient, matching the infinite-cyclic README conclusion.
- Supplied an all-characteristic graph-descent route for Zarhin's trick from Zarhin's
  primary preprint. Milne's prime-to-characteristic Corollary 13.11 alone does not
  justify the stated arbitrary-field theorem. Non-étale kernels are counted by rank.
- Corrected the direct-factor supplier from Milne I Proposition 15.2 to Proposition
  15.4, p. 65, and restricted the idempotents to the integral order `End(A)`.
  Rational idempotents with unbounded denominators give a counterexample to the
  original integral-unit-orbit claim.
- Repaired rational Torelli descent: for a nonhyperelliptic curve the unique pair
  consisting of a sign and a curve isomorphism descends; a minus sign is absorbed
  by a curve automorphism only in the hyperelliptic case.
- Replaced the elliptic bridge's reliance on an uncleared Silverman source with the
  public Milne group-morphism and pointed-Jacobian results, together with the named
  lower-tier elliptic equivalence suppliers.
- Repaired the integral commutant interface. A finite extension can change both
  endomorphisms and the generated Galois algebra at infinitely many primes, so
  finite Galois descent requires averaging, excluding primes dividing its degree.
  Reduction of centralizers uses the named `order_centralizer_reduce` separability
  projector, not torsion-freeness of the Tate-map cokernel. The CM example now states
  the generated algebra rather than asserting equality of the image with a Cartan
  normalizer. The finite-field graph argument explicitly excludes characteristic two.
- Added every omitted heavy definition, including `metrizedDegree` and `auxBound`,
  to the Lean closing inventory. No sorry-defined carrier was introduced.

## Public source verification

Opened and read the only author-flagged source: Faltings' 1984 erratum,
Inventiones 75, p. 381, [publisher scan](https://link.springer.com/content/pdf/10.1007/BF01388572.pdf).
Its parts (a) and (b) give distinct eventual shifts: closure towers need not initially
be divisible, and the intersection defect can already occur on the generic fibre.
Satz 2 asserts eventual equality with the height at a sufficiently late stage, rather
than equality with the original height. The package's corrected R28.3.1–R28.3.4 matches
that statement. No flagged locator remains unchecked.

The random sample is reproducible: Python `random.seed(9214)`, then
`random.sample(original_numbered_subsection_headings, 15)`, with headings in original
README order. Old labels below identify the original sample even where a section moved
or became a boundary. All 15 were checked against public primary or author sources.

| Original sampled subsection | Source opened and locator confirmed | Mathematical check and resulting action |
| --- | --- | --- |
| R28.4.1 | Faltings 1983 §5, p. 361 | Four squares give minus one over the local field; the stronger integral witnesses include `l=2`. |
| R28.6.1 | Milne I Cor. 1.2, p. 9; III Prop. 6.1, p. 104 | An origin-preserving morphism is a group morphism; the pointed elliptic curve has its Jacobian universal property. Replaced the uncleared book locator. |
| R28.3.9 | Faltings §5, p. 361; 1984 erratum, p. 381 | Maximal isotropic quotients have fixed polarization degree; eventual height stationarity suffices. Now R28.3.8. |
| R28.6.2 | Faltings Satz 3, p. 360; Milne IV Thm. 1.2, p. 131 | Semisimplicity is for the rational Tate representation, not the residual representation. |
| R28.6.6 | Milne I Thm. 10.15, p. 49 | Hom is free of finite rank; composing with a nonzero reverse isogeny embeds it into the integer endomorphisms. The rank-one conclusion is derived, with nonzero generator and uniqueness. |
| R28.5.15 | Faltings §6, p. 365; Milne IV Thm. 4.3, p. 144 | The fixed genus is at least two; good curve reduction implies good Jacobian reduction. |
| R28.2.7 | Faltings §4, p. 360 | Local induction multiplies the Hodge–Tate exponent by the local field degree. |
| R28.1.10 | Faltings §3, p. 357 | Level three rigidifies polarized forms, unlike level two; semistability bounds the required ramification. |
| R28.2.2 | Faltings §4, p. 358 | The exponent bound includes `[K:Q]` and the differential contribution; a missing field-degree factor is false. |
| R28.4.2 | Faltings §5, p. 361; Milne I Thm. 13.12, p. 60 | Quaternion transpose identities and the two graphs agree with the isotropic construction; repaired the right-action witness and expanded the tests. |
| R28.6.5 | Faltings Satz 6, p. 363; Milne IV Thm. 1.1, p. 131 | Finiteness counts rational isomorphism classes in an isogeny class. |
| R28.2.6 | Faltings §4, p. 360 | The global character statement is over Q; the dyadic principal-unit subgroup is `1+4Z_2`. |
| R28.1.8 | Faltings Lemma 3, p. 356 | Logarithmic metric growth gives an error logarithmic in the ordinary height. Integral sections remain integral when the comparison metric is rescaled. |
| R28.6.8 | Faltings Bemerkung 1, p. 365 | The paper indicates the Siegel application without a precise new theorem. Removed the duplicate section; RP.4 owns Siegel's theorem. |
| R28.5.4 | Faltings §6, pp. 363–364 | Exterior-power characteristic polynomials are integral; the excluded exponent is exactly the root-weight exponent. |

The public scans used here are linked in the package's references: the
[Faltings 1983 scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf),
[Deligne's Bourbaki account](https://www.numdam.org/item/SB_1983-1984__26__25_0.pdf)
and [Milne's author notes](https://www.jmilne.org/math/CourseNotes/AV.pdf).
Additional direct checks were Deligne Thm. 2.7, p. 39, and Thm. 3.1, p. 40;
Milne I Thm. 15.3, p. 64, Prop. 15.4, p. 65, III Thm. 12.1 and Cor. 12.2,
pp. 120–121, and IV Thm. 4.2, p. 145; Kleiman Thm. 5.11 and Remark 5.12,
pp. 42–44; Raynaud Thm. 4.1.1, p. 272; Yu Thm. 1.1, p. 1, and Thm. 4.8(2),
pp. 13–14. For arbitrary-characteristic Zarhin descent, read the complete six-page
[Zarhin preprint](https://arxiv.org/abs/2010.07995), version 5, particularly
Thm. 1.1(ii), p. 2, and §4, pp. 4–5. Results imported from these texts are restated,
with hypotheses and locators, rather than reproduced as passages.

## Supplier and duplication audit

Every retained target was compared by mathematical content, including the current
upstream README and Suggested files, Completed roadmaps, and the current library.
The search included all nine newer roadmaps: AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory,
OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry, plus Completed ContourIntegration, EffectiveBounds,
OrthogonalL2Bases and RestrictedProducts. The closer Jacobian and semisimple-algebra
suppliers were read in detail. Searches used Tate modules, stable lattices, integral
orders and centralizers, Weil polynomials, Hodge lines, Jacobians, degree formulas
and quaternion constructions, rather than relying on target names.

| Ownership decision | Result |
| --- | --- |
| Old R28.5.16 `mordell` | Deleted as a target. HeightsRationalPointsAndObstructions RP.4 owns `RP.4/mordell-faltings` and the conditional Parshin implication. The detailed covering application survives as a worked example. |
| Old R28.6.8 Siegel remark | Deleted as a numbered section. RP.4 owns `RP.4/siegel-theorem`; its boundary cites Faltings Bemerkung 1. |
| Tau Ceti `QuadraticMap.euler_four_squares` | Existing quadratic-map identity is cited in the boundary. The retained variant is explicitly the matrix-transpose identity and the two-graph alternating-form construction. |
| JacobianChallenge Layers D–E | Jacobians and the theta principal polarization are imported, not replanned. Rational Torelli over the ground field is the separate kept assertion. |
| IntegralLattices and stable-lattice suppliers | Lattice carriers, local lattice theory and existence of invariant lattices do not assert finiteness of equivariant lattice classes for a semisimple representation. The latter target is retained. |
| ArakelovGeometryAndAbelianHeights R35.1–R35.4 | General degree, Hodge metric and isogeny-variation infrastructure are imported. The retained variant explicitly fixes Faltings' 1983 normalization and the existing fractional-ideal formula. |
| Double-centralizer suppliers | Rational/field double centralizers are imported. The integral centralizer base-change lemma is separately owned and proved by a separability projector. |

No exact target newly found in the current upstream/library was retained as a second
owner. The two removed application sections were duplicates of the lower-tier atlas
supplier, not claims that current Tau Ceti already contains Faltings' theorem.

Faltings is tier 17. The supplied stack theory, abelian schemes, arithmetic
representations, Néron theory, finite-flat groups, weights, PEL moduli,
compactifications and Arakelov heights are all below it in the named ordering.
RP.4 is tier 9: only its covering machinery and conditional implication are consumed;
this package discharges curve finiteness rather than citing a higher-tier theorem.
There are no `UPSTREAM:` or FoundationsAndLibraryIntegration suppliers. After moving
polarization descent, every internal prerequisite precedes its use. Newly exposed
interfaces are named targets here, rather than strengthened claims about a supplier.

## Definitions and signature audit

| Definition or construction | Three or more discriminating checks retained or added |
| --- | --- |
| Hodge line and its metric | Nonproper multiplicative-reduction model uses the zero section; elliptic norm is `Im tau`; genus-two product requires the positive parity factor; stable compact-type versus toric Picard fibres. |
| CorrespondenceStack | Genus at least two; quotient map need not be an isomorphism; all-prime integral compactification; proper open projection; saturation produces a subbundle. |
| metrizedDegree, modularHeight and fracIdealDegree | Unit ideal has degree zero independently of section; `(1/2)Z` has degree `log 2`; norm scaling by two lowers it by `log 2`; complex weight two cancels the index four; zero ideal is not a line bundle. |
| HasLogSingularities | Logarithmic metric qualifies; a power pole fails; empty boundary qualifies; Tate-curve norm grows by a square root of a logarithm. |
| Polarization kernel pairing and descent | Principal kernel zero; cyclic subgroup of `E[n]` gives a principal quotient; whole nontrivial `E[n]` fails isotropy and descent. |
| PolarizationReduction | Degree square root; degree-one quotient; whole-kernel rejection; extension required by irreducible mod-l action; pairing compatibility. |
| quatMatrix | Gram value 87; zero and identity matrices; right-i orientation fixes an entry with value minus one. |
| matAct | Identity fixes a supported vector; zero kills it; `E12 E21` and `E21 E12` project to different coordinates. |
| sumForm | Same block pairs to one; distinct blocks to zero; two blocks to two and eight coordinates to eight; zero form and symmetric-form nonexample. |
| QuaternionIsotropic.subspace | Zero and full subspaces give the minus and plus graphs; a symplectic-plane line gives `W^4 x W^4`; the identity graph has nonzero pairing two. |
| Frobenius test-set construction | Dependence only on fixed inputs; nonsplit unipotent extension defeats an isomorphism conclusion without semisimplicity; finite-algebra rank gives the degree bound. |
| Auxiliary polynomials and bound | Correct elliptic exterior polynomials; excluded weight exponent is necessary; integer coefficients make the divisibility exclusion meaningful. |
| ellipticBridge | Multiplication degrees agree; characteristic-zero kernels have order equal to degree; the degree-five map between the 11a curves has the same degree under the comparison. |

All five light Lean definitions have real bodies and one or two representative
examples. Heavy definitions and companion statements remain in the README and its
closing Lean inventory; no placeholder carrier, `True`, or sorry-defined data occurs.

The representative signature comparisons included:

| Signature | README agreement checked |
| --- | --- |
| fracIdealDegree_eq_of_mem | Number field, positive norm factors, nonzero section in the fractional ideal; absolute norm ratio and complex weights have the stated signs. |
| fracIdealDegree_smul | Positive scalar; coefficient is the full number-field degree. |
| quatMatrix_mul_transpose and transpose_mul | Both products over a commutative ring; norm is the sum of four squares. |
| exists_sum_four_squares_eq_neg_one | Prime local parameter, integral p-adics, dyadic prime included. |
| QuaternionIsotropic.subspace_isotropic | Alternation and `v v^T=-1`; no nondegeneracy needed for isotropy. |
| QuaternionIsotropic.finrank_subspace | Finite dimension, nondegenerate alternating form, characteristic zero and the quaternion identity. |
| QuaternionIsotropic.subspace_invariant | Representation, stable W, similitudes and nonzero multiplier; no isotropy assumption is accidentally required. |
| QuaternionIsotropic.map_recover_subspace | Characteristic zero makes one-half meaningful; `-v^T` is the inverse; image is exactly `W^4`. |
| finite_weilPolynomials | Monic integer polynomials, fixed natural degree and arbitrary real radius. |
| finite_stableLattices | Semisimplicity, a stable starting lattice, finite stable representatives and equivariant automorphism equivalence. |
| hom_isogenous_cyclic | Characteristic zero, both curves elliptic, target endomorphisms integer and a nonzero map; generator nonzero and integer coefficient unique. |
| finite_ellipticIsogenyClass | Number field, elliptic source and target, nonzero Tau Ceti Hom, isomorphism by an actual variable change. |

Pinned declarations read directly included `InfinitePlace.mult`,
`FractionalIdeal.absNorm`, `NumberField.prod_abs_eq_one`,
`NumberField.finite_of_discr_bdd`, `ZMod.sq_add_sq`, `hensels_lemma`,
`BilinForm.finrank_add_finrank_orthogonal`, Tau Ceti `Hom.add_comp`,
`Hom.comp_eq_zero_iff`, `Hom.degree_zsmul` and
`centralizer_centralizer_range`. In particular the orthogonal-dimension formula uses
nondegeneracy, Hensel requires its derivative inequality, integer multiplication
has `natAbs`-squared degree, and the double-centralizer result recovers the acting
algebra's range with its semisimplicity and finiteness hypotheses.

## Adversarial mathematics pass

The following covers every numbered subsection, including every defining API and
identity in it. A reference-supported general theorem was audited through its exact
hypotheses and proof interface; finite computations are witnesses and negative
controls, not a proof of the general theorem. Independent arithmetic computations
checked both quaternion Gram products, all pairings in the zero/line/full graph
examples, metric parity for dimensions zero through four, dyadic roots through
modulus `2^13`, odd-prime witnesses, point counts at small good primes, the six Weil
quadratics and nonnormal coset averaging.

| Statement(s) | Instances, hypothesis or denominator checked | Result / change |
| --- | --- | --- |
| R28.1.1 | Multiplicative reduction; elliptic `dz`; genus-two product; compact-type and nodal stable curves | Zero-section definition and parity factor retained; zero differential has norm zero, positivity is for nonzero input. |
| R28.1.2 | Generic point of Spec Z; identity and homomorphisms of a multiplicative model | Added dense-open spreading; normality retained. |
| R28.1.3 | `g=1`; Jacobian dimension larger than g; missing primes on `Z[1/N]` | Proper graph projection and all-prime compactification now have separate named contracts; image saturation retained. |
| R28.1.4 | Boundary point for a multiplicative elliptic curve; field extension | Uniform constant depends only on g; finite-place inclusions give the degree error `[K:Q] log e_g`. |
| R28.1.5 | Unit ideal, fractional half-ideal, section two in Q(i), norm factor two, zero ideal | Index/archimedean signs and complex weight checked; geometric formula excludes zero ideal and nonpositive scalars. |
| R28.1.6 | Empty boundary, log metric, power pole, local equation of norm one | Bounds are near the divisor with norm at most one-half, avoiding a zero logarithmic denominator. |
| R28.1.7 | Tate curve, good reduction, elliptic `du/u` | Squared norm is `-2 pi log|q|`; exponent for the norm is one-half. |
| R28.1.8 | Pole metric at `(N:1)`; common zero set; rescaling | Power growth defeats bounded-height finiteness; integral sections retained; the logarithmic comparison is sufficient. |
| R28.1.9 | Unramified `e=1`; wild Q(sqrt(2)) at two | Different exponent zero in the first case and three in the second; wild lower bound explicitly qualified. |
| R28.1.10 | Quadratic twists; level two versus three | Semistability restricts twists; minus one defeats level-two rigidity. |
| R28.1.11 | Dimension zero; polarization degree one; ramified twists | Zero variety has height zero; one class for nonnegative height bound, none for negative bound. |
| R28.1.12 | Principal polarization; cyclic order-n subgroup; whole E[n] | Principal quotient and degree relation hold only for isotropic H; nonisotropic quotient would require a fractional homomorphism. |
| R28.1.13 | `d=1`; elliptic degree `m^2`; varying bad set | Only the quotient is trivial at degree one; uniform extension still handles semistability and split forms. |
| R28.2.1 | `[n]`, including negative n; `[0]`; prime away from degree | Absolute values added; `[0]` excluded in positive dimension; differential and archimedean terms cancel. |
| R28.2.2 | Etale degree-p kernel and multiplicative dual; `[p]` | Valuations `+m`, `-m` and zero pin the field-degree factor and signs. |
| R28.2.3 | Good reduction; split/non-split Tate curve at l | Inertia is trivial on the quotient, not on its cyclotomic submodule. |
| R28.2.4 | Etale and multiplicative groups; supersingular elliptic group; ramified base | Counts use formal dimension and full local degree, not group height or residue degree. |
| R28.2.5 | Etale dimension zero; multiplicative dimension one | Determinant twists by `+1`; inverse sign conflicts with the global dimension identity. |
| R28.2.6 | Cyclotomic and quadratic characters; `l=2`; imaginary quadratic base | Principal units use modulus four at two; global base Q is essential. |
| R28.2.7 | K=Q; completely split and inert l | Local induction exponent is `m_i d_i`; transfer and determinant sign are accounted for. |
| R28.2.8 | Whole Tate module; good unramified auxiliary prime | Absolute determinant is `p^(mh/2)`; finite-order factor is not silently removed. |
| R28.2.9 | Quadratic inert supersingular example; split CM rank-one subgroup | Weighted dimensions give two and one respectively; missing local degree is false. |
| R28.3.1 | Saturated zero/full lattices versus `lZ_l`; initial defective levels | Eventual shift retained; an unsaturated sublattice is not an embedded divisible subgroup. |
| R28.3.2 | Good reduction; two distinct rational lattice lines with finite intersection defect | Generic defect has order l and disappears after a shift; independent from closure defect. |
| R28.3.3 | Whole ordinary/supersingular Tate tower; `n=0`; k below threshold | Counts are `l^(nmg)` or one for n zero; no premature differential formula. |
| R28.3.4 | Whole tower; initial height versus late height | Eventual stationarity retained, and sufficient for boundedness; whole tower constant does not imply isotropy. |
| R28.3.5 | Degree-one quotient; irreducible mod-l action; cyclic kernel; whole kernel | Correct square-root degree, necessary field extension and semistability separation. |
| R28.3.6 | k=1 and k=8; nonprincipal polarization | Product degree is the kth power; principal pairings give the required orthogonal sum. |
| R28.3.7 | Nonnormal S2 in S3; trivial infinite-index subgroup; CM extension | Three left-coset conjugates average to the all-one-third projector; Galois invariants appear only where justified. |
| R28.3.8 | Elliptic line; smaller isotropic dimension; irreducible representation | Nonmaximal quotient polarization degree grows; isomorphisms counted over K. |
| R28.4.1 | l=2; odd primes 3,5,7,11,13; rational field | Dyadic root of minus seven and odd Hensel witnesses work; rational sum of squares cannot be negative. |
| R28.4.2 | `(2,3,5,7)`; right-i; zero/identity matrix; three graph cases; characteristic two | Both Gram products give 87; orientation is minus fourth basis vector; field-characteristic-not-two companions registered for the residual argument. |
| R28.4.3 | Maximal isotropic tower; infinitely many isomorphic quotients | Limit lies in the algebra by closedness and surjectivity needs the second compactness argument; no false initial-height equality. |
| R28.4.4 | W zero/full; symplectic-plane line; recovery by one-half | Passage from the eightfold product back to A is explicit; idempotent lies in the endomorphism algebra. |
| R28.4.5 | CM elliptic curve over Q versus its CM field; rational to integral comparison | Uses End_K, not geometric End; torsion-free cokernel is the specified integral step. |
| R28.4.6 | Equal curves; nonisogenous elliptic curves; E^2 versus E x F | Restricted vanishing claim; shared higher-dimensional factor gives nonzero Hom. |
| R28.4.7 | 11a isogenous curves; 37a1/37b1 agree at seven and disagree at two | Small-prime point counts checked; almost-all local factors and semisimplicity are essential. |
| R28.4.8 | Single prime versus every prime; fixed degree d | Height bound uses uniformly bounded prime parts for every l; a single Tate-module comparison is insufficient. |
| R28.5.1 | Degree zero, radius zero/negative, degree-two radius sqrt(2), unbounded degree | Only one, X^n, empty positive-degree set, six quadratics, and infinite family respectively. |
| R28.5.2 | Two-dimensional unipotent extension; d positive; finite residual algebra | Traces separate semisimplifications; stable-lattice algebra rank yields the field-degree bound. |
| R28.5.3 | g zero; elliptic factor at two | Separate zero class; apply finiteness to the monic characteristic polynomial and then reverse it. |
| R28.5.4 | Exterior degrees zero/one/two; j=h/2; good prime two for 11a1 | Correct integer polynomials; excluding the weight exponent prevents zero evaluations and division by zero. |
| R28.5.5 | K=Q; quadratic K with odd h; semistable but not good reduction | Permutation-sign twist cancels induced ramification; unipotence suffices away from l. |
| R28.5.6 | l=2; l congruent to one or three modulo four; infinity | Residual dyadic target trivial; parity and allowable archimedean ramification agree with the cyclotomic character. |
| R28.5.7 | Unramified local base; mu_l and etale kernels; bound l>N | Raynaud's `e<=l-1` is present; local determinant exponents are one and zero. |
| R28.5.8 | l>N; l-power factorization; fixed auxiliary p | Distinct primes and nonzero polynomial evaluations enforced at every intermediate isogeny. |
| R28.5.9 | Trivial representation; zero V; unipotent two-dimensional representation | All trivial lattices equivalent; zero lattice unique; indices 1,3,9,27 distinguish nonsemisimple stable lattices. Stable representatives now explicit. |
| R28.5.10 | Isogeny prime to l; finitely many small l | Controls only each prime part; height need not be equal for isomorphic T_l. |
| R28.5.11 | g zero, d one/nonone; fixed bad set and degree | One or no zero-dimensional polarized class; global height bound combines large and small primes. |
| R28.5.12 | n=1; inseparable kernel; integral versus rational idempotents | Graph rank gives principal degree in all characteristics; unbounded rational denominators refute the original orbit claim. |
| R28.5.13 | Elliptic dimension one; unbounded polarization degrees | Fixed dimension suffices through the eightfold trick and direct-factor finiteness; fixed degree is not silently assumed. |
| R28.5.14 | Conic; genus-one torsor; hyperelliptic versus nonhyperelliptic sign | g>=2 retained; unique signed Torelli isomorphism descends, with minus absorbed only in hyperelliptic case. |
| R28.5.15 | Stable compact-type bad curve and its good Jacobian | Only the forward good-reduction implication is used; rational Torelli gives injectivity. |
| R28.6.1 | Multiplication maps; degree-five isogeny; characteristic zero | Group, point, degree and Tate identifications have named supplier contracts; no inseparable-degree claim at the wrong generality. |
| R28.6.2 | 11a1 at five; split/inert CM prime | Rational irreducibility is compatible with residual reducibility; inert CM module only splits over a quadratic coefficient extension. |
| R28.6.3 | E=E'; 11a1/11a3; 37a1/37b1 | Ranks one, one and zero; target is the equivariant Hom. |
| R28.6.4 | Isogenous 11a curves; quadratic twists; equal single-prime traces | Almost-all traces required; twist character changes nonzero traces at inert primes. |
| R28.6.5 | Finite 11a class; twists not generally in that class | Counts K-isomorphism classes; Lean uses variable changes, not equality of curve coefficients. |
| R28.6.6 | Identity generator; degree-five generator; CM over Q(i) | Degrees n^2 and 5n^2; CM rank two defeats missing integer-End hypothesis; unique coefficient now stated. |
| R28.6.7 | CM field extension; split/inert Cartan; dual-number order acting by lE12 | Added separability projector and genuine descent. Nonseparable order reduces to zero action and has a larger residual centralizer; saturation alone is insufficient. |
| Parshin worked example | Cover degree greater than two; fixed field and bad set; de Franchis | At least two branch points remain; conditional implication is imported, with curve-finiteness hypothesis discharged here. |

Convention controls also cover the trivial group and zero module, the unit ideal,
number-field versus local degree, polarization kernel rank versus square-root degree,
arithmetic Frobenius rather than inverse Frobenius, the cyclotomic twist sign,
complex-place weight two, proper generic fibre versus nonproper model, and left
cosets rather than an unjustified quotient group. Divisions in the proof routes are
by positive field degrees, nonzero sections or scalars, nonzero polynomial
evaluations, or invertible two with its characteristic restriction. No uniform
statement over ramified valuation rings is inferred from an unramified `Z_l` formula.

## Validation and remaining work

`lean-check Suggested.lean` exited **0**: 16 warnings, all declarations using
`sorry`, and no other warnings. The file contains 295 lines, five light real-bodied
definitions and representative target signatures, with no theory construction or
sorry-defined data. The final changes after that compilation affect the README and
Lean comments only; the compiled declaration bodies and signatures are unchanged.
The independent finite computations above passed. Whitespace checks passed, and
`python3 research/blueprint/intake.py check-files` on the changed deliverables and
handoff returned zero problems.

No unfinished correction or unchecked author-flagged source remains. The next step
is the upstream draft-PR lane for this accepted package. Formalization of the named
heavy interfaces—including the all-prime correspondence compactification, the
finite-flat graph descent, finite-field idempotent argument and integral-centralizer
base change—is subsequent Tau Ceti work; this review does not claim those proofs
have been implemented in Lean.
