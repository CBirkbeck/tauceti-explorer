# Igusa varieties, compactified period fibers and torsion concentration

## Purpose and exact scope

Construct the reusable geometry and cohomological mechanisms of Caraiani–Scholze,
*On the generic part of the cohomology of non-compact unitary Shimura varieties*
(CSnc), §§2–6. This is the missing substantial continuation between perfectoid
Shimura representability and ACC+'s degree-shifting arguments. Ordinary canonical-
subgroup Igusa torsors are not a replacement for central-leaf Igusa varieties at
arbitrary Newton points. Finite-field purity alone is not a torsion-concentration
theorem.

The geometric branch uses the particular PEL unitary similitude datum of CSnc §2.1:
a CM field F, V=F^(2n), the split skew-hermitian form, and an O_F-lattice self-dual
for its trace alternating form. At principal level N≥3 take p unramified in F,
p∤N, and the integral model over Z[1/(N Δ_F)]. Its abelian objects have dimension
n[F:Q], O_F action, principal polarization and determinant condition. Prove the
comparison between the unitary subgroup G^0 and the similitude group G; they are
not the same adelic quotient. These geometric constructions do not assert results
for every Hodge-type or arbitrary Shimura datum.

The generic cohomology branch additionally requires F=F^+F_0 for an imaginary
quadratic subfield F_0, [F^+:Q]>1, and an auxiliary geometric prime p≠ell splitting
completely in F. Require the level N to be divisible by the specific sufficiently
large integer N_0 of CSnc Remark 5.4.5 (equivalently, sufficiently deep/small level
subgroups at the bad places), and choose its finite exceptional set S, including
character ramification. Constants
and local systems use ell-primary coefficients with ell≠p. ACC+ calls its
coefficient prime p and geometric prime l; export an explicit renaming dictionary.

## Owners and staged dependencies

- PELModuli M0–M3 is the canonical PEL functor/representability/integral-model owner;
  AbelianSchemesAndArithmeticModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheory
  and ShimuraCompactifications supply abelian schemes, p-divisible groups, integral
  toroidal/minimal charts and ordinary deformation primitives. IG.0–2 construct
  the additional central-leaf/Igusa structures on their actual objects.
- PerfectoidSpaces, AdicSpacesPartII, PerfectoidShimuraVarieties and
  HodgeTateAndCanonicalSubgroups supply their proven tower/period-map stages.
  DiamondEtaleCohomology and DiamondSixOperations supply coefficient-appropriate
  cohomology and canonical-compactification comparisons. EnhancedDerivedSheaves
  supplies the single enhancement; ArithmeticGaloisDuality R02.1–2 supplies
  general continuous Hochschild–Serre, applied to these towers here.
- EtaleDualityAndPerverseSheaves EDC.5–EDC.6 and LefschetzPencilsAndVanishingCycles
  LPV.6 supply early scheme perversity and nearby-cycle t-exactness. ET.2a only
  reexports that foundation; IG.4 does not import the later decomposition theorem.
  EndoscopicTransferAndUnitaryTraceComparison ET.5 and ET.7b supply the Igusa trace formula,
  and ET.6 classical GL_m/inner-form local transfer. Its early trace/transfer
  branches do not depend on IG.4–7. ET.5 consumes only IG.0–1 finite-level geometry.
- AutomorphicGaloisRepresentationsPartII supplies classical higher-rank Galois
  systems; TorsionCohomologyInfrastructure and IntegralHeckeAndGaloisDeterminants
  supply existing lower-rank torsion systems and determinant comparison for the
  boundary induction. These inputs do not depend on IG.7 concentration.
- ArithmeticLocallySymmetricSpaces owns the actual GL_r boundary complexes.
  PotentialAutomorphyInfrastructure consumes IG.7 and proves its Fontaine–Laffaille
  and ordinary degree-shifting applications; those applications are not inputs.

## IG.0. Newton strata, central leaves and local deformation data

Instantiate PELModuli M0–M3's actual integral-model objects for this split datum;
do not build a second PEL functor or repeat its representability proof. Construct
the additional unitary/similitude comparison on components,
levels and spherical Hecke operators (CSnc §2.1). Build the Newton map into
B(G_Qp,mu^(-1)), with the sign of mu recorded, from the common Dieudonne/isocrystal
objects. Prove admissible Newton points, slope decompositions and dimension
formulas in this PEL setting; do not import a Bun_G closure conjecture.

For a p-divisible group X over algebraically closed k of characteristic p with its
O_F and polarization structures, construct its central leaf C^X as a locally
closed smooth subscheme, not merely a set of geometric points. Supply descent,
isomorphism-versus-isogeny distinctions and the automorphism group scheme.
Construct the connected/formal and profinite parts of Aut(X); nonisoclinic Aut(X)
need not be reduced. Construct completely slope-divisible representatives after
isogeny and their finite-level truncations, with descent of all PEL tensors.

Develop the Serre–Tate deformation and quasi-isogeny comparisons used in CSnc
§§2.2–2.4, starting from the common finite-flat/p-divisible theory. This includes
effectivity and algebraization of the relevant isomorphism functors, not a new
unrelated moduli carrier. Acceptance: ordinary and nonordinary examples, dimensions,
and functorial action of the self-quasi-isogeny group J_b(Q_p).

## IG.1. Igusa towers and their actions

**Dependencies:** IG.0, with the same fixed PEL datum and central-leaf objects.

Construct Ig^X by trivializing the PEL p-divisible group over the leaf. Prove its
perfectness and the Γ_X=Aut(X)(k)-torsor over (C^X)_perf. Distinguish this profinite
torsor from the original generally nonreduced Aut(X)-torsor. For completely
slope-divisible X construct the smooth finite-level nonperfect models and their
finite étale transitions; identify their perfected limit with Ig^X.

Prove invariance of the open Igusa variety under compatible isogenies of X,
construct the J_b(Q_p) action and the prime-to-p Hecke action, and identify the
effective groups and stabilizers. Define the common compactly supported
cohomology complex as the specified filtered colimit over finite levels. Prove
coefficient change, action continuity, finite-level finiteness and the smooth-
representation realization. No rational virtual-character formula is used to
define the integral cohomology complex. Sources: CSnc §§2.2–2.4; CS17 §4;
Shin's counting paper finite-level constructions.

## IG.2. Partial compactifications and affineness

Construct well-positioned subsets/subschemes using the actual formal toroidal
charts; prove the property is independent of cone refinement and preserved by
the required Hecke maps. Prove central leaves are well-positioned and construct
their partial toroidal/minimal compactifications. Import ambient compactifications,
but prove these new subspace compactification statements (Lan–Stroh §§2–3).

Extend the Γ_X torsor uniquely over (C^(X,tor))_perf and construct Ig^(X,tor).
Build its explicit cusp labels, formal boundary charts, torus embeddings, and
quotients by cusp stabilizers; prove proper comparison to the partial minimal
model obtained by normalization. Isogeny invariance of the toroidal model keeps
the required isomorphism on étale quotients and compatible cones: it is not the
unrestricted invariance of the open tower.

Prove affineness of C^(X,*) and Ig^(X,*), following CSnc Lemma 3.3.8: construct
Ekedahl–Oort/G-zip strata and their Hasse sections; prove affineness for the minimal
strata via their ample Hasse invariant; prove existence of a fundamental/minimal
Ekedahl–Oort stratum in each relevant Newton stratum (Nie Proposition 1.5 and
Corollary 1.6); then transfer by the proved isogeny comparisons. These G-zip,
minimal-element and Hasse arguments are owned here, not assumed from general
perfectoidness. Sources: CSnc §3, Lan–Stroh, Boxer Theorem C and Nie.

Acceptance: describe each boundary stratum with all toric and abelian factors,
prove the partial-minimal-to-ambient map, and compute the ordinary case. Use the
Lan–Stroh erratum's separate powers of p on different lattice factors, not one
uniform exponent that need not exist.

## IG.3. Fibers of compactified Hodge–Tate maps

For a geometric flag point x=Spa(C,O_C)→Fl, identify its polarized p-divisible
group over O_C and special fiber X. Construct the canonical formal lift of the
perfect Igusa schemes to O_C and its perfectoid generic fibers. Construct the
actual maps from Ig_C^(X,tor) and Ig_C^(X,*) to the corresponding period-map
fibers, respecting all boundary filtrations and actions.

Prove that these maps are open immersions with the same rank-one points and
that the target is the canonical compactification of the source (CSnc Theorem
4.1.1/Corollary 4.1.2). Do not replace this by an unrestricted isomorphism of adic
spaces. Prove the induced étale-cohomology identifications using the supplier's
canonical-compactification theorem. For minimal fibers prove the affinoid
integral-section comparison and the required almost isomorphisms before removing
the almost qualification where justified. The toroidal-to-minimal argument must
use connected Stein fibers and the precise primitive comparison, not a false
assertion that arbitrary proper fibers have trivial cohomology.

Prove compatibility with prime-to-p Hecke action, passage between p-levels, flag
Newton strata, and the good-reduction open part. Sources: CSnc §§2.6–2.7,4.1–4.5;
Lan–Stroh nearby-cycle comparison, with its errata; corrected Scholze p-adic
Hodge comparison. The corrected pro-étale definition and its transfinite covers
are imported from AdicEtaleGeometry; no splitting of arbitrary profinite
surjections is used.

## IG.4. Nearby-cycle semiperversity and support bounds

Let d=n^2[F^+:Q]. Construct the cofinal formal models of the flag variety and
prove the exact source assertion
`Rψ(Rπ_HT,open,* F_ell) ∈ pD^(≥d)(Fl_k,F_ell)` (CSnc Theorem 4.6.1).
The perversity is on special-fiber schemes after nearby cycles, not an assumed
perverse t-structure on all analytic v-stacks. Extend the needed perverse
inequalities to nonconstructible filtered colimits with the exact stalk/costalk
criteria; bounded constructible theory alone is insufficient at infinite level.

Prove the ell-power-level boundary-killing argument: for the normal-crossings
boundary compute R^i j_* from exterior powers of local Kummer classes and show
transition maps kill positive degrees in the ell-level colimit. Compare the open
and toroidal HT pushforwards after this colimit. Prove affine formal-model descent
to finite special-fiber maps, preservation of perverse lower bounds by those
finite maps, and nearby-cycle t-exactness in the scheme setting. Prove the adic/
scheme nearby-cycle comparison and filtered-colimit/finite-level compatibilities.

Define `RΓ_(c-boundary)(Ig^b)=RΓ(Ig^(b,*),j!F_ell)`; this is not automatically
ordinary RΓ_c of Ig^b. From affineness and Artin vanishing prove the upper degree
bound i≤d_b. Using flag-stratum dimensions and a Newton point of minimal d_b
with nonzero localized cohomology, prove the lower bound i≥d_b in CSnc Lemma
2.8.4. Localization and nearby cycles must preserve the claimed lower bound by
proved exactness. Acceptance: retain the two different complexes: the upper bound
for H^i(Ig^(b,*),j!F_ell) is CSnc Proposition 2.8.2, whereas the lower bound at
minimal d_b is for ordinary H^i(Ig^b,F_ell)_m in Lemma 2.8.4. Do not combine these
bounds until IG.6 proves the boundary comparison (Theorem 2.8.7) and IG.7 checks
its localization hypotheses. Distinguish d_b from d and from the flag-stratum
dimension d−d_b throughout.

## IG.5. Rational Igusa trace comparison and genericity obstruction

Apply ET.5/ET.7b to the actual Igusa cohomology from IG.1 to compute its alternating
Q_ell-representation of J_b(Q_p)×T^S. Retain virtual multiplicities and possible
cancellation; this does not identify individual integral H^i. Apply the classical
global Galois systems from AutomorphicGaloisRepresentationsPartII and ET.6's local
GL_m/inner-form theorem to each surviving rational constituent, with the CSnc
§5.1 normalization, including the local |det|^(1/2−n) factor.

Prove the passage from mod-ell cohomology concentrated in one degree to a rational
constituent with the correctly dualized residual Hecke system, using integral
finiteness, duality, torsion-freeness in that degree and an actual lattice. Define
the double-coset anti-involution iota([KgK])=[Kg^(-1)K] and m^vee=iota(m).
The compact-support trace constituent obtained from ordinary cohomology localized
at m has Hecke ideal m^vee, not m. Reduce its actual lattice and return to rho_m
by contragredience and the source's |Art_F^(-1)|^(1−2n) twist, with Art_F sending
uniformizers to geometric Frobenius. Prove the characteristic-polynomial
dictionary: at v|p the dual ideal has eigenvalues p^(2n−1) alpha_(i,v)^(-1).
Thus the unramifiedness, length and no-ratio-p conditions survive this operation.
Prove CSnc Corollary 5.1.3's
obstruction: for p totally split, unramified residual eigenvalues with
α_i≠p α_j for i≠j force b ordinary. Treat p≡1 mod ell and p≠1 mod ell separately
using the local deformation argument; repeated eigenvalues are not forbidden
unless the stated ratio condition itself forbids them. This requires the
classical nontransfer of generic principal series to nontrivial division-algebra
inner forms, not just the existence of a semisimple FS parameter.

## IG.6. Equivariant Igusa boundary formula

For a rational parabolic of rank r and its associated parabolic P_b in J_b,
construct the filtration of the polarized p-divisible group and the lower-rank
Igusa datum b_P. Geometrically realize the boundary stratum as an induced space.
Construct the map of complexes as a cup product of the smaller Igusa factor
and the arithmetic GL_r factor, using its embedding in the punctured formal
neighborhood. Prove by toroidal local computation that the map is an isomorphism.

The exported formula is CSnc Theorem 6.1.1: compactly supported cohomology of the
stratum with i^*Rj_* coefficients equals smooth induction from P_b(Q_p)×P(A_f^p)
of the tensor product of GL_r arithmetic cohomology and smaller Igusa compact-
support cohomology. Specify unnormalized induction, the Levi action and every
cohomological/Tate normalization. Establish full J_b×G(A_f^p) equivariance, not
only an equality of dimensions or Euler characteristics. Import the underlying
GL_r complex and finite-level HS from ArithmeticLocallySymmetricSpaces.

Assemble the finite boundary filtration and prove convergence. Using lower-rank
torsion Galois systems and actual Hecke polynomial factorization, prove the
length obstruction of CSnc Theorem 2.8.7: if the partial-support-to-ordinary map
fails to be an isomorphism at a nonordinary b, the residual semisimple system has
at least three Jordan–Hölder constituents. Separate this from the hypothesis
that it has length at most two; do not assume “non-Eisenstein” when reducible
length-two systems are precisely the intended application.

## IG.7. Localized concentration and arithmetic handoff

Under the exact initial global hypotheses, fix m in the support of the specified
unramified Hecke algebra and an associated semisimple 2n-dimensional residual
representation ρ_m of length at most two. Require a completely split p≠ell at
which ρ_m is unramified and α_i≠p α_j for every i≠j. Combine IG.4, IG.5 and IG.6
by minimal-Newton-dimension induction to show only the ordinary flag locus
contributes. Descend from infinite level using the actual group actions and HS.

Prove the reusable source inequalities on the unitary arithmetic quotient:
`H^i(X_K,F_ell)_m=0` for i<d and `H_c^i(X_K,F_ell)_m=0` for i>d. The second
uses Poincaré duality and the dual Hecke ideal; prove its Frobenius-polynomial
and cyclotomic-twist conversion preserves genericity and residual length.
Do not claim ordinary and compactly supported cohomology both concentrate in
degree d in the reducible boundary case.

Derive the integral lattice/local-system versions by the exact coefficient and
level arguments; prove middle-degree torsion-freeness and the boundary exact
sequence. For an absolutely irreducible residual system prove boundary vanishing
and the stronger middle-degree concentration as a separate specialization.
Export ACC+ Theorem 4.3.3's middle-degree injection into rational cohomology and
surjection onto the boundary, with the source's level/ramification and [F^+:Q]>1
hypotheses. PA.1/PA.2 then own the degree-shifting applications.

## Validation and source control

Check ordinary, basic nonordinary and proper nonbasic Newton examples; distinguish
isogeny invariance of the open and toroidal objects; test the dual Hecke involution;
include residual length two with nonzero boundary; check every use of ell≠p.
The source's main concentration statement is a proved reusable supplier target,
not an axiom and not a claim of general GL_n torsion vanishing.

Primary organizing source: CSnc,
87-page author version; CS17
supplies earlier local/semiperversity arguments. Supporting papers and errata are
listed with hashes in the source register
and access notes.
Suggested.lean gives honest, nonexhaustive currently expressible
prototypes; this README specifies the missing geometric constructions.

## Implementation handoff: Support bounds on the correct complexes

**Stages:** IG.0, IG.2, IG.3, IG.4, IG.5, IG.6, IG.7. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Instantiate the PEL integral model before central leaves and Igusa torsors. IG.4 tracks separately the compact-boundary-support upper bound and the ordinary lower bound at a minimal nonzero Newton stratum; IG.6 supplies the actual boundary comparison before the bounds are combined. IG.5 rational lifting uses the dual Hecke ideal and the corresponding dual/twist conversion.

**Acceptance and consumer contract.** The noncompact endpoint checks every field, level, length≤2 and split auxiliary-prime hypothesis. Its genericity is α_i≠qα_j for i≠j, with unramifiedness separate; repeated eigenvalues are not automatically forbidden. Acceptance derives H^i=0 below d and H_c^i=0 above d, and must not silently strengthen this to ordinary cohomology concentrated in degree d without further boundary input.
