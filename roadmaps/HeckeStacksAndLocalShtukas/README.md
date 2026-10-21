# Hecke correspondences and local shtuka cohomology

This roadmap constructs the Hecke action on lisse sheaves on the stack of
bundles on the Fargues–Fontaine curve, and identifies its restrictions with
cohomology of local shtuka towers. Its reusable objects are the global Hecke
stack, bounded modifications and their chains, twisted period spaces, level
towers, solid Satake kernels, and compact-support complexes with commuting
group and Weil actions. The final layer supplies the coherent operations that
excursion operators and the spectral action consume.

The geometry is local-field geometry. Equal-characteristic local fields are
included in the general-field constructions; global function-field shtukas
belong to the global function-field roadmaps. Integral local models, integral
shtukas and the construction of general Rapoport–Zink deformation spaces belong
to `HeckeStacksAndLocalShtukasIntegralPartII`. The classical comparison below
specifies the interface to those spaces and to the independently constructed
Lubin–Tate and Drinfeld towers. It does not reconstruct them. Excursion algebras,
parameter stacks, spectral Bernstein centres and the finite-ramification theorem
belong to `ExcursionOperatorsAndSpectralAction`, particularly
`ES1:finite-ramification` and `ES6:functoriality`.

The relative curve, its divisor spaces and meromorphic torsor gluing come from
`RelativeFarguesFontaine`; isocrystals and vector bundles from
`VectorBundlesAndIsocrystals`; the stack of bundles, Newton strata and their
automorphism groups from `BunGAndNewtonStrata`. Local loop geometry, Schubert
varieties, convolution, fusion and the integral Satake equivalence come from
`GeometricSatakeAndFusion`. General solid and lisse categories and their
operations come from `VStackSheavesAndLisseCategories`, classical compact
support from `ClassicalAdicEtaleCohomology`, and diamond exceptional operations
from `DiamondSixOperations`. Smooth representation theory is imported from
`SmoothRepresentationsOfLocalGroups`. The targets here are the global Hecke
geometry, its action, local towers and their comparisons.

[Suggested.lean](Suggested.lean) proposes declarations, API lemmas and tests.
This README specifies the mathematics. The suggested declarations contain
admitted constructions and proofs and are not an implementation of the roadmap.

## Conventions

- Unless a target specifies $E=\mathbb Q_p$, $E$ is a nonarchimedean local
  field of either characteristic, with residue field $\mathbb F_q$ of
  characteristic $p$, uniformizer $\pi$, completed maximal unramified
  extension $\breve E$, and Frobenius $\sigma$. Put
  $k=\overline{\mathbb F}_q$; all v-sheaves and v-stacks are on
  $\mathrm{Perf}_k$. The notation $X_S$ means the relative
  Fargues–Fontaine curve and $\mathrm{Div}^1_E=\mathrm{Spd}\breve E/\varphi^{\mathbb Z}$.
  When annuli are used, $S=\mathrm{Spa}(R,R^+)$ is affinoid perfectoid with
  a chosen pseudo-uniformizer $\varpi$.
- $G/E$ is reductive. A $G$-bundle is an exact tensor functor from
  $\mathrm{Rep}_E(G)$ to vector bundles on the curve. For a geometric
  cocharacter class $\mu$, $F/E$ is its reflex field,
  $\breve F=F\breve E$, $\mu^\sharp\in\pi_1(G)_\Gamma$ is its
  Kottwitz image, and $\mu^\diamond$ is its Galois average. The inverse
  class $\mu^{-1}$ has dominant representative $-w_0\mu$.
  The corresponding notations $\mu^\natural$ and $\mu^\sharp$ in the
  API tables mean the same image in coinvariants.
- Changing a framing by $y\in G(\breve E)$ changes $b$ to
  $yb\sigma(y)^{-1}$. Write $J_b=G_b$ for the $\sigma$-centralizer.
  The full automorphism v-group is $\widetilde G_b=\mathrm{Aut}(\mathcal E_b)$.
  It equals the constant group $J_b(E)$ for basic $b$; in general it also
  has a positive unipotent part. Quotients by these two groups must be distinguished.
- The slope of $\mathcal E_b$ is opposite to the slope of the isocrystal:
  for $G=\mathbb G_m$, $\mathcal E_b=\mathcal O(-v_\pi(b))$, and
  $\mathcal O(1)$ corresponds to $\pi^{-1}\sigma$. Thus
  $c_1(\mathcal E_b)=-\kappa(b)$; for $\mathrm{GL}_n$,
  $\kappa(b)=v_\pi(\det b)$.
- A Hecke modification is $\alpha:\mathcal E_1\dashrightarrow\mathcal E_2$.
  Its type measures the **first** lattice relative to the second: after
  trivialization, $\widehat\alpha\in L^+G\,\mu(\xi)\,L^+G$, where
  $\xi$ is a uniformizer of $B^+_{\mathrm{dR}}$. For $\mathbb G_m$,
  $\mathcal L(-D)\hookrightarrow\mathcal L$ has type $1$. Consequently
  $\kappa(\mathcal E_1)=\kappa(\mathcal E_2)+\mu^\sharp$.
  Gluing $\xi B^+_{\mathrm{dR}}$ into the trivial second lattice gives
  $\mathcal O(-1)$ and Kottwitz invariant $+1$.
- Local shtukas use modifications $\mathcal E_1\dashrightarrow\mathcal E_b$
  from the trivial bundle, bounded by $\mu$. For one leg over $\mathbb Q_p$
  nonemptiness means $[b]\in B(G,\mu^{-1})$, equivalently
  $\kappa(b)=-\mu^\sharp$ and
  $\nu_b\le(\mu^{-1})^\diamond$. The period-point statements cited from
  Gleason–Lourenço and Gleason–Lim–Xu use the opposite cocharacter. In those
  statements we write $\lambda=\mu^{-1}$, so their condition is
  $[b]\in B(G,\lambda)$. This dictionary also changes the parabolic:
  $\mathrm{Fl}_{G,\mu}$ here uses
  $P_\mu^- =\{g:\lim_{t\to\infty}\mu(t)g\mu(t)^{-1}\text{ exists}\}$.
- Fix $\ell\ne p$, a square root $r=\sqrt q$, and a discrete
  $\mathbb Z_\ell[r]$-algebra $\Lambda$. Its condensed realization is
  $\mathbb Z_\ell\otimes_{\mathbb Z_{\ell,\mathrm{disc}}}\Lambda$.
  Half Tate twists use $r$. There is no additional good-prime assumption.
  A finite quotient $Q$ of $W_E$ carries the pinned action on the dual
  group $\widehat G$. The exact category
  $\mathrm{Rep}_\Lambda((\widehat G\rtimes Q)^I)$ consists of algebraic
  representations on finite projective $\Lambda$-modules. Tensor products
  in the derived categories are derived; $\otimes^\blacksquare$ denotes
  the solid tensor product.
- $D_\blacksquare$ is the enhanced stable category of solid sheaves and
  $D_{\mathrm{lis}}$ its lisse subcategory. Relative homology
  $f_\natural$ is the left adjoint of $f^*$ for maps of small v-stacks.
  It is denoted $f_\text{♮}$ in the API tables. For a Satake sheaf
  $S_V$, the solid kernel is $S'_V=\mathbb D(S_V)^\vee$, using
  Verdier duality relative to the leg base followed by solid duality.
  Identifications with $Rf_!S_V$ require the stated torsion and geometric
  hypotheses. The finite-level complex is $C_K=f_{K\natural}S'_W$.
- $K$ always means a compact open subgroup. Compactness and perfect
  invariant complexes require $K$ to be pro-$p$ where specified. The
  tower cohomology is a colimit along pullback. Traces point in the reverse
  direction. Normalize traces by an index only when that index is a unit in
  $\Lambda$.
- $W_E$ has the Weil topology: inertia is open and profinite, and the
  degree quotient is $\mathbb Z$. A continuous Weil action is a map of
  condensed groups to automorphisms in the enhanced category. For an
  extension $F/E$, $\varphi_F$ on $\mathrm{Spd}\breve F$ is the
  Frobenius of its $\mathrm{Spd}F$ factor, covering the
  $q_F$-Frobenius on the tilt; it is not silently identified with the
  field automorphism $\sigma_F$. In the constant-term formula the degree
  convention sends geometric Frobenius to $1$.

## Library interfaces and supplier contracts

Use Mathlib's `CategoryTheory.Adjunction`, `MonoidalCategory`,
`Functor.Monoidal` and `ExactPairing` for the categorical operations and their
coherences. `Condensed` and `CondensedMod` supply the sheaf carriers, not the
solid derived theory. `WittVector.Isocrystal` supplies a Frobenius-semilinear
automorphism over the fraction field of Witt vectors; finite dimension,
$G$-structure and ramified or equal-characteristic generalizations require
the isocrystal suppliers. Tau Ceti's `AffineGroupSchemeCat` supplies an affine
group scheme carrier; smoothness, connected fibres and a reductive generic
fibre are additional hypotheses on an integral model. Over the field $E$,
use `TauCeti.ReductiveAffineGroupSchemeCat E`, the full subcategory of
finite-type affine group schemes selected by geometric reductivity. It already
carries smoothness and geometric connectedness, and its morphisms are the
native group-scheme homomorphisms over $E$. The suggested abbreviation
`RedGrp` uses this carrier and its inherited category. Tau Ceti's `IsSmoothDiscrete` and
`SmoothDiscreteTopRep` supply the ordinary smooth discrete carrier, including
continuity of the scalar action for a topological coefficient ring.
`SmoothRepresentationsOfLocalGroups:SR.0:derived-extension` supplies the enhanced
derived category and the comparison with classifying stacks, rather than a
second definition of that carrier. These interfaces refer to Mathlib 082e2d3
and Tau Ceti f790474.

Every target below names its prerequisite layers. The following contracts
specify the extensions used at their boundaries; the consuming target depends
on the complete contract.

| Owner layer | Interface needed here |
| --- | --- |
| `RelativeFarguesFontaine:RF0`, `RF2:untilts`, `RF2:integral-divisors`, `RF4:G-torsors` | General-local-field period rings and annuli; degree-one untilts and divisor sums; Tannakian meromorphic modifications, completion and Beauville–Laszlo gluing, compatible with base change and change of group. |
| `BunGAndNewtonStrata:BG0`, `BG1`, `BG2:uniformization`, `BG3`, `BG4` | The Kottwitz set and its two invariants, pure inner twisting, small bundle stacks, full automorphism v-groups, strata and filtered-bundle charts. In `BG2:uniformization`, modifying the trivial target by the orbit $\mu(\xi)$ must give $\kappa=+\mu^\sharp$, image contained in $B(G,\mu)$, and equality for minuscule $\mu$; inversion supplies the $B(G,\mu^{-1})$ dictionary. For a general target $\mathcal E_b$, retain the relative identity $\kappa(\mathcal E_x)=\kappa(\mathcal E_b)+\mu^\sharp$. The same layer must supply bundle-stack Weil restriction for every finite separable extension, including ramified extensions, with modifications. |
| `BunGAndNewtonStrata:BG3` | Parabolic bundle stacks, the identification of the HN stratum with its parabolic reduction, and the dimension statements of [GL], Theorem 2.13 and Proposition 2.15. For standard Levis $M\subset L$, the relative dimension is $\langle2\rho_L-2\rho_M,\nu_b\rangle$. The nonempty fibres in Lemma 3.3 are torsors under unipotent automorphism diamonds of that dimension. Bounded self-modifications of sufficiently unstable bundles preserve the HN reduction. |
| `GeometricSatakeAndFusion:GS0:loop-geometry`, `GS0:Schubert-smoothness` | Ordered-leg Schubert bounds, finite `dim.trg`, proper surjective bounded convolution, and factorization off the diagonals. The Białynicki-Birula map descends to reflex fields, is equivariant under reduction of positive loops, is an isomorphism for minuscule classes, and is a bijection on points over finite extensions of $\breve F$. |
| `GeometricSatakeAndFusion:GS1`, `GS2:correspondences`, `GS3:fusion`, `GS4:integral-dual-group` | ULA recognition and duality; equivariant Demazure spaces with proper, spatial, finite-dimensional maps; generation **on the solid-dual side under arbitrary colimits** by their relative homology; convolution and coherent fusion. On chain spaces the twisted product is flat perverse and ULA with its specified extension from disjoint legs. The normalized integral Satake functor has its enhanced perfect-complex extension, bounded-weight resolution convergence, and naturality for adjoint maps, products, Levi maps and Weil restriction. |
| `GeometricSatakeAndFusion:GS4:integral-dual-group` | Pullback to $\mathrm{Div}^1_F$ corresponds to restriction from $W_E$ to $W_F$, including the action of all endomorphisms and idempotent summands. For residue degree $f$, the square root is $r^f$. Weil restriction pushes the inflated then induced representation's Satake sheaf forward along the corresponding closed immersion and finite étale leg map. Choosing the other square root changes the comparison by the unramified sign character on components of odd $\langle2\rho,\mu\rangle$. |
| `ReductiveGroupsIntegralRepresentationsPartII`, extending `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` | Integral highest-weight generation for **every** $\ell\ne p$, with no restriction on torsion in $\pi_1(\widehat G)$, the order of $Q$, or solvability of $Q$. Finite-projective $\widehat G^I$-representations belong to the thick subcategory of $\mathrm{Perf}(B\widehat G^I_\Lambda)$ generated by exterior products. Finite-projective $(\widehat G\rtimes Q)^I$-representations have resolutions by exterior products, possibly unbounded to the left, with only finitely many weights. The parent layer alone does not supply these statements. |
| `VStackSheavesAndLisseCategories:VS0`, `VS1`, `VS2`, `VS3`, `VS4`, `VS5` | Artin-stack sheaves; divisor–Weil maps and the Drinfeld fully faithful embedding; solid operations and relative homology with base change, projection formula, and an isomorphism for restriction of coefficients; lisse categories, geometric invariance and stratum adjoints; compact generation, ULA/admissibility, lisse and BZ duality, and Künneth. The chart calculation comparing cohomology with $[*/K]$ is required as an identity of condensed objects for every profinite parameter space. On classifying stacks relative homology is compact induction, with its level units and counits. Stratum extension by zero, excision, compactness and its dualizing-complex formula are required in addition to the left adjoint of stratum restriction. |
| `VStackSheavesAndLisseCategories:VS0` | For torsion coefficients, the smooth stacky map $\pi:\mathrm{Bun}_P^{b_N}\to\mathrm{Bun}_M^{b_M}$ has exceptional direct image inverse to the section's exceptional direct image, with composition and representable base change. Its classifying-stack fibres make the representable diamond formalism alone insufficient. The stacky dimension bounds in [GL], §2, require the fine-morphism formalism, or proofs through atlases giving those same bounds. |
| `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SR.1`, `SR.2`, `SR.3`, `SR.6` | Enhanced derived smooth representations, exact pro-$p$ invariants commuting with filtered colimits, admissible reflexive smooth duals, compact projective compact inductions, derived reciprocity and level trace identities. For $\overline{\mathbb Q}_\ell$, use noetherianity, finite global dimension, admissibility of irreducibles, and finite length of finitely generated admissible objects. For integral finite generation use [DHKM], Theorem 1.1 and Corollary 1.4, rather than extrapolating the characteristic-zero statements. |
| `ReductiveGroupsPartII:RG2.0` | Locally profinite $G(E)$, a cofinal basis of compact open pro-$p$ congruence subgroups, finite indices, and openness of rational-point maps induced by smooth surjective morphisms, including $G\to G/G^{\mathrm{der}}$. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | The topological Weil group and the continuous open embeddings $W_F\hookrightarrow W_E$ of index $[F:E]$, in both characteristics. Condensation and its use in sheaf categories occur here and in the v-stack suppliers. |
| `AdicEtaleGeometry:A2`, `AdicSpacesPartII:R0` | Smooth projective varieties analytify to smooth proper rigid spaces; spaces étale over smooth rigid spaces are smooth rigid spaces of the same dimension; finite étale covers remain rigid; partial properness follows from the diamond valuative criterion for separated analytic spaces locally of finite type. |
| `PadicHodgeTheory:R06.2` | Tate's invariants and twist vanishing, Galois-stable $B^+_{\mathrm{dR}}$-lattices versus filtrations, and the crystalline/weakly admissible tensor comparison over finite extensions of $\breve F$, which need not be finite over $\mathbb Q_p$. Use $D_{\mathrm{cris}}(\mathbb Q_p(1))=(\breve{\mathbb Q}_p,p^{-1}\sigma)$. Slope zero becomes triviality of a $G$-bundle only after its Kottwitz invariant also vanishes. |
| `ClassicalAdicEtaleCohomology:H3`, `DiamondSixOperations:S0`–`S5`, `AdicCoefficientsAndComparisons:L0` | Compactifications, proper-support direct image, finite étale traces, and compatible adic limits. The cross-theory contract identifies classical and diamond compact support on every quasicompact open of a separated taut rigid space, naturally in the torsion coefficients and traces. For a smooth map of pure dimension $d$, require the canonical dualizing isomorphism $Rf^!\Lambda=\Lambda(d)[2d]$. Equivalence of étale sites alone supplies neither comparison. |
| `HeckeStacksAndLocalShtukasIntegralPartII`; `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`; `IgusaVarietiesAndTorsionConcentration:IG.0`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` | Independent RZ deformation spaces and their level towers, period maps and period images; the Lubin–Tate and Drinfeld cases from `ET.6a`; the stated unramified PEL cases from `IG.0`; covariant Dieudonné and Grothendieck–Messing theory from `R07.2`. The integral continuation supplies the general $\mathrm{GL}_n$, ramified EL/PEL and non-hyperspecial parahoric representability interfaces, the $A_{\mathrm{cris}}$ comparison over $\mathcal O_C/p$, and extension of the parahoric torsor on the punctured $A_{\mathrm{inf}}$ spectrum. The continuation's layer interface is needed for these general cases. An $E'$-linear formal-module tower is compared here to $\mathbb Q_p$-shtukas for a Weil restriction; identifying it with $E'$-shtukas requires a further comparison. |

Additional geometric and finiteness hypotheses are needed where they occur below.
For connectedness and density, use a theorem about removing a closed subset
of smaller dimension from a connected, cohomologically smooth, partially
proper diamond, together with the separate assertion that a locally closed
subset of smaller $\ell$-dimension contains no nonempty open subset.
The exact hypotheses of the connectedness theorem must be checked against
Hansen's Corollary 4.11 cited by [GL], Theorem 3.2; [GL] does not supply an
independent density theorem. For non-minuscule nonemptiness, use existence
of a weakly admissible filtration of the prescribed type over a finite
extension of $\breve F$, with the precise hypotheses of the
Rapoport–Viehmann Proposition 3.1 cited by [HK], Proposition 7.3.3.
These are supplier theorems, not consequences of the definitions of dimension
or weak admissibility.

For transitivity with non-minuscule bounds, require open connected components
at one finite level. This can be supplied by local connectedness of the
Schubert diamond and its étale covers, or by an integral-model specialization
comparison; the transitivity statement keeps this hypothesis explicitly.
For the compactness of the level colimit for compact $\rho$, require compact
stalks of $Ri^b_*[\rho]$ on the finitely many relevant strata. [HHS],
Theorems 1.3.1 and 7.1.4, provide this for torsion coefficients; their formalism
does not establish the assertion for arbitrary $\Lambda$. The
$\overline{\mathbb Q}_\ell$ finite-length case has its own argument below.
For a nonbasic source stratum, the categorical operator is defined using its
chart adjoint. Identifying that operator with cohomology of framed
modifications requires a comparison through the chart and the positive
unipotent automorphism group. The basic-source comparison does not supply it.

## Sources

All sources below are freely readable. Page numbers refer to these versions;
the target citations distinguish a source statement from a consequence to
prove from the imported interfaces.

- **[FS]** Laurent Fargues and Peter Scholze,
  [*Geometrization of the local Langlands correspondence*](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  author-hosted 356-page text of arXiv:2102.13459v4, 27 November 2024.
  Printed and PDF page numbers coincide.
- **[SW]** Peter Scholze and Jared Weinstein,
  [*Berkeley Lectures on p-adic Geometry*](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf),
  print-ready version, 27 March 2020. Printed page equals PDF page minus 10.
- **[HK]** Sean Howe and Christian Klevdal,
  [*Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem*](https://arxiv.org/pdf/2308.11064v2),
  arXiv:2308.11064v2, 28 February 2025.
- **[GL]** Ian Gleason and João Lourenço,
  [*On the connectedness of p-adic period domains*](https://arxiv.org/pdf/2210.08625v2),
  arXiv:2210.08625v2, 28 December 2022, with the corrected Lemma 3.3.
- **[GLX]** Ian Gleason, Dong Gyu Lim and Yujie Xu,
  [*The connected components of affine Deligne–Lusztig varieties*](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf),
  *Inventiones mathematicae* **243** (2026), 805–861.
- **[DHKM]** Jean-François Dat, David Helm, Robert Kurinczuk and Gilbert Moss,
  [*Finiteness for Hecke algebras of p-adic groups*](https://arxiv.org/pdf/2203.04929v2),
  arXiv:2203.04929v2, 22 April 2022.
- **[HHS]** Linus Hamann, David Hansen and Peter Scholze,
  [*Geometric Eisenstein series I: finiteness theorems*](https://arxiv.org/pdf/2409.07363v1),
  arXiv:2409.07363v1, 11 September 2024. Its torsion-coefficient scope is
  specified in §1, p. 2, footnote 1.
- **[HI]** Linus Hamann and Naoki Imai,
  [*Dualizing complexes on the moduli of parabolic bundles*](https://arxiv.org/pdf/2401.06342v4),
  arXiv:2401.06342v4, 7 May 2025.

The layers build global geometry first (HS0), the solid/lisse Hecke action
(HS1), local shtuka geometry (HS2), its cohomology and representation theory
(HS3), and the coherent export to excursion and spectral constructions (HS4).
API tables describe operations to implement; test tables specify computations
and counterexamples that distinguish the intended objects from weaker ones.

## HS0 — Global modifications and Hecke geometry

Build the groupoid of global modifications and its bounded geometry before imposing coefficients. Chains supply the composition law used by the action and by Frobenius-collision charts.

<a id="hs0-1"></a>

### HS0.1 — Global Hecke stacks

Construct the groupoid-valued functor $\mathrm{Hck}^I_G$ whose objects are
legs $(D_i)$, bundles $\mathcal E_1,\mathcal E_2$, and a meromorphic
isomorphism $\alpha$ off their union. Meromorphy is tested on every
representation by extension after a sufficiently large divisor twist,
locally on the base. Morphisms intertwine $\alpha$ through isomorphisms of
both bundles. Give the source, target-with-legs, unit, inversion, and
completion-to-local-Hecke maps. For $a:I\to J$, pull back along the leg
diagonal and extend the indexing of the excluded legs to obtain
$\iota_a$; it is fully faithful, an equivalence for surjective $a$,
and its essential image consists of modifications that extend across the
unused legs. Empty legs recover $\mathrm{Bun}_G$. These constructions
are compatible with pullback in $S$, identities and composition of
finite-set maps.

**Prerequisites:** `RelativeFarguesFontaine:RF4:G-torsors`; `GeometricSatakeAndFusion:GS0:loop-geometry`; `RelativeFarguesFontaine:RF2:integral-divisors`; `RelativeFarguesFontaine:RF2:untilts`; `BunGAndNewtonStrata:BG2:uniformization`.

**Sources:** [FS], I.2, p. 16; III.3, p. 97; IX, introduction, p. 317; IX.2, proof of Proposition IX.2.1, p. 322; VI.9, p. 226; I.13, p. 44.

**API:**

| Name | Required behavior |
| --- | --- |
| `HckI` | For S ∈ Perf_k the groupoid of ((D_i)_{i∈I}, E_1, E_2, α) with α: E_1\|_{X_S∖⋃D_i} ≅ E_2\|_{X_S∖⋃D_i} meromorphic along Σ D_i; morphisms are the pairs (f_1,f_2) intertwining α; it is functorial in S by pullback. |
| `HckI.p1` | p_1: Hck^I_G → Bun_G, ((D_i),E_1,E_2,α) ↦ E_1. |
| `HckI.p2` | p_2: Hck^I_G → Bun_G × (Div¹)^I, ((D_i),E_1,E_2,α) ↦ (E_2,(D_i)). |
| `HckI.legs` | The leg map Hck^I_G → (Div¹)^I is the second component of p_2; e, sw and loc are maps over (Div¹)^I and ι_a is a map over (Div¹)^J. |
| `HckI.unit` | e: Bun_G × (Div¹)^I → Hck^I_G, (E,(D_i)) ↦ ((D_i),E,E,id); p_2∘e = id and p_1∘e = pr_1. |
| `HckI.swap` | sw(E_1,E_2,α) = (E_2,E_1,α⁻¹) is an involution of Hck^I_G over (Div¹)^I with p_1∘sw = pr_1∘p_2 and sw∘e = e. |
| `HckI.ext` | Two objects over the same legs are isomorphic iff there are f_1: E_1 ≅ E_1′ and f_2: E_2 ≅ E_2′ with α′f_1 = f_2α off the legs; a morphism (f_1,f_2) is determined by f_2, so the automorphism group of an object is the group of f_2 ∈ Aut(E_2) for which α⁻¹f_2α extends to an automorphism of E_1. |
| `HckI.repeat` | For a: I → J, ι_a: Hck^I_G ×_{(Div¹)^I,Δ_a} (Div¹)^J → Hck^J_G restricts α to the complement of all legs indexed by J; ι_id = id, ι_{b∘a} = ι_b∘(base change of ι_a), ι_a is fully faithful, and it is an equivalence for surjective a. |
| `HckI.repeat_image` | The essential image of ι_a consists of the objects of Hck^J_G whose α extends to an isomorphism over X_S∖⋃_{j∈a(I)}D_j; for a: ∅ → J it is the image of e. |
| `HckI.toLocal` | loc: Hck^I_G → Hck^{I,loc}_G sends (E_1,E_2,α) to (Ê_1,Ê_2,α̂), the completions along Σ D_i with the induced isomorphism over B_D(S); it commutes with pullback in S, with sw and with e (which goes to the unit section of the local Hecke stack). |
| `HckI.empty` | Hck^∅_G ≃ Bun_G through p_1, with inverse e. |
| `HckI.torus_point` | For G = 𝔾_m and one leg D over a geometric point Spa(C,C⁺), the isomorphism classes of objects over D are the pairs (deg L_1, deg L_2) ∈ ℤ², and every automorphism group is E^×, embedded diagonally in Aut(L_1) × Aut(L_2). |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `HckI.empty_test` | For I = ∅ the functor p_1: Hck^∅_G(S) → Bun_G(S) is an equivalence of groupoids for every S ∈ Perf_k; for G = 𝔾_m and S a geometric point its isomorphism classes are ℤ (the degree) and its automorphism groups are E^×. |
| `HckI.torus_test` | Let G = 𝔾_m, S = Spa(C,C⁺) a geometric point and D ⊂ X_S a degree-one divisor. The isomorphism classes of objects (D,L_1,L_2,α) of Hck^{∗}_{𝔾_m}(S) are in bijection with ℤ² through (deg L_1, deg L_2), all pairs occur, and the automorphism group of each object is E^× embedded diagonally in E^× × E^× = Aut(L_1) × Aut(L_2). |
| `HckI.repeat_test` | For the map a: {1,2} → {∗}, ι_a: Hck^{1,2}_G ×_{(Div¹)²,Δ} Div¹ → Hck^{∗}_G is an equivalence. For the map a: ∅ → {∗}, ι_a is the unit e: Bun_G × Div¹ → Hck^{∗}_G, which for G = 𝔾_m is not essentially surjective: over a geometric point its image consists of the classes with deg L_1 = deg L_2. |
| `HckI.trivial_group_test` | For G = 1, Hck^I_1 = (Div¹)^I, p_1 is the structure map to Bun_1 = ∗ and p_2 is the identity of (Div¹)^I. |
| `HckI.fibre_test` | Let S = Spa(C,C⁺) be a geometric point, D one leg with untilt C♯, and E_2 = 𝒪ⁿ the trivial GL_n-bundle. The pairs (E_1,α) with (D,E_1,𝒪ⁿ,α) ∈ Hck^{∗}_{GL_n}(S), up to isomorphisms of E_1 compatible with α, are in bijection with the B⁺_dR(C♯)-lattices in B_dR(C♯)ⁿ through (E_1,α) ↦ α(Ê_1); all lattices occur, not only those contained in B⁺_dR(C♯)ⁿ. |

<a id="hs0-2"></a>

### HS0.2 — Relative position and bounded Hecke substacks

Define relative position by the Cartan double coset of the completed
modification, with the first-lattice convention above. For a splitting field
$E'$, choice of embedding into the untilt gives a dominant cocharacter;
changing that embedding changes it by the Galois action. For split $G$,
define $\mathrm{Hck}^I_{G,\le\mu_\bullet}$ by bounding the position at
each geometric divisor by the sum of the bounds on the legs that coincide
there. Unordered bounds mean the union over their permutations.

For general $G$, finite Galois-stable downward-closed sets $W_i$ define
a bound over $(\mathrm{Div}^1_E)^I$; a tuple of individual cocharacters
defines one over $\prod_i\mathrm{Div}^1_{F_i}$. At a collision in
$\mathrm{Div}^1_E$, transport the cocharacters through their untilt
embeddings before adding them. Distinct lifts to a splitting field do not
turn such a collision into two independent positions. Prove closedness,
pullback from the local Hecke bound, monotonicity, and bounded factorization
of maps from quasicompact bases. Zero bounds give the unit; inversion uses
$-w_0\mu$; repetition adds the bounds in each fibre of $a$.

**Prerequisites:** [HS0.1](#hs0-1); `GeometricSatakeAndFusion:GS0:loop-geometry`; `RelativeFarguesFontaine:RF4:G-torsors`; `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D4`.

**Sources:** [FS], I.2, p. 16; VI.2, Definition VI.2.2, p. 197; VI.2, Definition VI.2.6, p. 200; VI.2, Proposition VI.2.7, p. 201; VI.10, p. 230; VI.2, proof of Proposition VI.2.4, p. 199; [SW], Lecture 19, Proposition 19.2.1, p. 172; Lecture 19, proof of Proposition 19.4.2, p. 177; Lecture 20, Definition 20.4.4, p. 187; Lecture 20, §20.2, p. 184.

**API:**

| Name | Required behavior |
| --- | --- |
| `HckI.relPos` | inv(E_1,E_2,α) ∈ X_*(T)⁺ for a geometric point of Hck^{∗}_G together with an embedding over E of E′ into the untilt of the leg: the μ with α̂(e_1) ∈ e_2·G(B⁺_dR)μ(ξ)G(B⁺_dR); it is independent of e_1, e_2 and ξ, and another embedding replaces it by a conjugate under Gal(E′\|E), so that for a point of Hck^{∗}_G it is defined up to Γ. |
| `HckI.Bounded` | The substacks Hck^I_{G,≤μ•} (G split, or over ∏ Div¹_{F_i} for the fields of definition F_i, with coincidence of legs taken in Div¹_E and each μ_i transported by the F_i-structure of its leg) and Hck^I_{G,W} (W_i finite, Γ-stable, closed under ≤) of Hck^I_G. |
| `HckI.Bounded.closed` | Hck^I_{G,W} → Hck^I_G is a closed immersion, equal to the preimage under loc of the closed substack of the local Hecke stack defined by the same condition; it is stable under the action of L⁺G on the fibres of p_2. |
| `HckI.Bounded.mono` | W_i ⊂ W′_i for all i implies Hck^I_{G,W} ⊂ Hck^I_{G,W′}; for G split, μ′_i ≤ μ_i for all i implies Hck^I_{G,≤μ′•} ⊂ Hck^I_{G,≤μ•}. |
| `HckI.Bounded.exhaust` | Every map S → Hck^I_G with S quasicompact factors through Hck^I_{G,W} for some W. |
| `HckI.Bounded.unit` | e: Bun_G × (Div¹)^I → Hck^I_{G,(0)} is an equivalence: an S-point has position 0 at all geometric points and legs iff α extends to an isomorphism E_1 ≅ E_2 over X_S. |
| `HckI.Bounded.swap` | inv(E_2,E_1,α⁻¹) = −w_0·inv(E_1,E_2,α), and sw(Hck^I_{G,W}) = Hck^I_{G,W*} with W*_i = −w_0W_i. |
| `HckI.Bounded.collision` | For G split and a: I → J, ι_a maps the pullback of Hck^I_{G,≤μ•} along Δ_a into Hck^J_{G,≤ν•}, ν_j = Σ_{a(i)=j} μ_i; for a: {1,2} → {∗} this is an equivalence onto Hck^{∗}_{G,≤μ_1+μ_2}. |
| `HckI.Bounded.cell` | For G split and one leg, Hck_{G,μ} = Hck_{G,≤μ} ∖ ⋃_{μ′<μ} Hck_{G,≤μ′} is open in Hck_{G,≤μ}; its geometric points are those of relative position exactly μ. |
| `HckI.Bounded.class` | μ′ ≤ μ implies μ′♯ = μ♯ in π_1(G); hence on Hck_{G,≤μ} (one leg, G split) the class of the relative position in π_1(G) is the constant μ♯. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `HckI.Bounded.zero_test` | For W_i = {0} for all i, e: Bun_G × (Div¹)^I → Hck^I_{G,(0)} is an equivalence; for G = GL_n and one leg, an object with α(Ê_1) ⊂ Ê_2 lies in Hck_{G,(0)} only if α(Ê_1) = Ê_2. |
| `HckI.Bounded.collision_test` | G = 𝔾_m, I = {1,2}, μ• = (a,c) ∈ ℤ²: p_2: Hck^{1,2}_{𝔾_m,≤(a,c)} → Pic × (Div¹)² is an isomorphism with inverse (L_2,D_1,D_2) ↦ (L_2 ⊗ I_{D_1}^a ⊗ I_{D_2}^c, L_2, can); over the diagonal D_1 = D_2 = D the relative position at D is a + c, and deg L_1 = deg L_2 − a − c. |
| `HckI.Bounded.GL2_test` | G = GL_2, one leg D over a geometric point with untilt C♯, E_2 fixed. The fibre of p_{2,≤(1,0)} over (E_2,D) is the set of lattices Λ with ξÊ_2 ⊂ Λ ⊂ Ê_2 and Ê_2/Λ of length one, in bijection with ℙ¹(C♯). The fibre of p_{2,≤(2,0)} is the set of lattices Λ ⊂ Ê_2 with Ê_2/Λ of length two: the cell of position (2,0), where Ê_2/Λ ≅ B⁺_dR/ξ², together with the single point Λ = ξÊ_2 of position (1,1). The lattice Ê_2 (position (0,0)) and the lattices of colength one are not in it. |
| `HckI.Bounded.nonsplit_test` | Let F\|E be the unramified quadratic extension and G = Res_{F\|E}𝔾_m, so X_*(T) = ℤ² with Γ acting through the swap. The set {(1,0)} is not Γ-stable and defines no substack of Hck_G over Div¹_E. For W = {(1,0),(0,1)} the fibre of p_{2,W} over (E_2,D), with D given by an untilt S♯ over E and Ê_2 trivialised, is Gr_{G,W} ×_{Spd E} S, where Gr_{G,W} ≅ Spd F is connected and finite étale of degree 2 over Spd E; after base change to Spd F it is the disjoint union of the two sections of positions (1,0) and (0,1). |
| `HckI.Bounded.twisted_collision_test` | Let F\|E be a separable quadratic extension with Gal(F\|E) = {1,γ} and G = Res_{F\|E}𝔾_m, so that G-bundles on X_S are line bundles on X_{S,F} = X_S ×_{Spa E} Spa F and Div¹_F is the space of degree-one divisors of X_{S,F}; let I = {1,2} and μ_1 = μ_2 = (1,0), with field of definition F. Then p_2: Hck^{1,2}_{G,≤μ•} → Bun_G × (Div¹_F)² is an isomorphism with inverse (L_2,D′_1,D′_2) ↦ (L_2 ⊗ I_{D′_1} ⊗ I_{D′_2}, L_2, can). At a geometric point with D′_2 = D′_1 the position at the common image in X_S is (2,0) = μ_1 + μ_2. At a geometric point with D′_2 = γ(D′_1) the two legs again have the same image x in X_S, the fibre is not empty, and the position at x is (1,1) = μ_1 + γμ_2, which is not ≤ (2,0). |

<a id="hs0-3"></a>

### HS0.3 — Descent, uniformization and bounded fibres

Prove that the global Hecke functor is a small v-stack. Complete the target
bundle along the total divisor; its positive-loop torsor makes the square
with the local Hecke stack and $\mathrm{Bun}_G$ times the leg base
2-Cartesian. The completion torsor is étale-locally trivial, and
Beauville–Laszlo gluing reconstructs the first bundle. For every finite
Galois-stable bound, the target-with-legs map is proper, representable in
spatial diamonds, and of finite `dim.trg`; inversion gives the corresponding
source-with-legs statement. For split $G$, one leg and an open Schubert
cell of type $\mu$, the fibres are cohomologically smooth of dimension
$\langle2\rho,\mu\rangle$. A minuscule cell is also proper. With
nonempty legs and nontrivial $G$, the unbounded Grassmannian fibre is
not quasicompact.

**Prerequisites:** [HS0.1](#hs0-1), [HS0.2](#hs0-2); `RelativeFarguesFontaine:RF4:G-torsors`; `DiamondsAndVStacks:D5`; `GeometricSatakeAndFusion:GS0:loop-geometry`; `BunGAndNewtonStrata:BG2:uniformization`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness`; `VectorBundlesAndIsocrystals:VB3:general-BC`; `RelativeFarguesFontaine:RF2:untilts`; `DiamondsAndVStacks:D3`; `DiamondSixOperations:S4`.

**Sources:** [FS], VI.1, proof of Proposition VI.1.7, p. 193; III.3, pp. 97–98; VI.2, Proposition VI.2.7, p. 201; VI.8, Remark VI.8.4, p. 226; II.1, Proposition II.1.21, p. 56; I.2, p. 16; VI.2, Proposition VI.2.4, p. 198; [SW], Appendix to Lecture 19, Proposition 19.5.3, p. 180.

<a id="hs0-4"></a>

### HS0.4 — Chains and composition of modifications

For an ordered partition $I=I_1\sqcup\cdots\sqcup I_m$, allowing empty
parts, construct chains $\mathcal E_0\dashrightarrow\cdots \dashrightarrow\mathcal E_m$ with the indicated legs at each step.
The defining fibre products identify the preceding target with the following
source. Composition forgets intermediate bundles and composes the
meromorphic isomorphisms in their order. Refinement, merging and empty
steps satisfy associativity and unit coherences. Composition is an
equivalence over the locus where different parts have disjoint divisors;
at a collision it is convolution, retaining intermediate lattices in its
source. For bounded chains prove that it lands in the summed bound and is
proper and v-surjective, using the bounded local convolution theorem.
Include Galois-stable bounds for nonsplit groups.

**Prerequisites:** [HS0.1](#hs0-1), [HS0.3](#hs0-3), [HS0.2](#hs0-2); `RelativeFarguesFontaine:RF4:G-torsors`; `GeometricSatakeAndFusion:GS0:loop-geometry`.

**Sources:** [FS], VI.9, proof of Definition/Proposition VI.9.4, p. 229; VI.8, p. 224; IX.2, p. 321; [SW], Lecture 20, Definition 20.4.2, p. 187; Lecture 20, Proposition 20.1.4, p. 183; Lecture 20, Proposition 20.4.5(2), p. 188.

**API:**

| Name | Required behavior |
| --- | --- |
| `ModificationChain` | For an ordered partition I = I_1 ⊔ … ⊔ I_m: legs (D_i)_{i∈I}, G-bundles E_0, …, E_m on X_S and modifications α_j: E_{j−1} ⇢ E_j, isomorphisms off D_{I_j} meromorphic along D_{I_j}; morphisms are compatible tuples of isomorphisms. |
| `ModificationChain.proj` | q_j: Hck^{I;I_1,…,I_m}_G → Hck^{I_j}_G, the chain ↦ ((D_i)_{i∈I_j}, E_{j−1}, E_j, α_j), and the maps to Bun_G remembering E_j, 0 ≤ j ≤ m. |
| `ModificationChain.fibreProduct` | (q_1,…,q_m) is an equivalence from Hck^{I;I_1,…,I_m}_G to Hck^{I_1}_G ×_{Bun_G} ⋯ ×_{Bun_G} Hck^{I_m}_G, the fibre products being over E_j on both sides. |
| `ModificationChain.compose` | c: Hck^{I;I_1,…,I_m}_G → Hck^I_G, the chain ↦ ((D_i)_{i∈I}, E_0, E_m, α_m∘⋯∘α_1 restricted to X_S∖D_I); it commutes with the maps to Bun_G remembering E_0 and E_m and with the leg maps. |
| `ModificationChain.assoc` | The merge maps c_j composing α_{j+1}∘α_j commute with one another, and every composite of merges from the partition (I_1,…,I_m) to (I) equals c. |
| `ModificationChain.unit` | For I_j = ∅ the chain stack is equivalent to the one without the j-th part, compatibly with c; inserting E_j = E_{j−1} with α_j = id is inverse to this equivalence. |
| `ModificationChain.compose_disjoint` | Over (Div¹)^{I;I_1,…,I_m}, where legs in different parts are disjoint, c is an equivalence; its inverse sends (E_0,E_m,α) to the chain whose E_j is E_m modified at D_{I_{j+1}}, …, D_{I_m} only. |
| `ModificationChain.convolution` | For parts {1}, {2} over the diagonal, the fibre of the chain stack over (E_2,D) with Ê_2 trivialised is LG ×^{L⁺G} Gr_G and c is the multiplication map to Gr_G; for m singleton parts it is the convolution Beilinson–Drinfeld Grassmannian of Scholze–Weinstein Definition 20.4.2 with P_r = E_{m−r} and S♯_r the leg of the part I_{m+1−r}. |
| `ModificationChain.bound_add` | If at a common leg E_{j−1} has position ≤ λ_j relative to E_j for all j, then E_0 has position ≤ Σ_j λ_j relative to E_m; c_{≤μ•}: Hck^{I;I_1,…,I_m}_{G,≤μ•} → Hck^I_{G,≤μ•} is proper, representable in spatial diamonds and surjective. |
| `ModificationChain.swap` | Reversing a chain, (E_0,…,E_m;α_j) ↦ (E_m,…,E_0;α_{m+1−j}⁻¹), is an equivalence onto the chain stack of the reversed partition, and c of the reversed chain is sw of c of the chain. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `ModificationChain.torus_collision_test` | G = 𝔾_m, I = {1,2} with parts {1}, {2}, S a geometric point with D_1 = D_2 = D. Isomorphism classes of chains (L_0,L_1,L_2;α_1,α_2) are the triples (deg L_2, b, a) ∈ ℤ³ with L_1 ≅ L_2 ⊗ I_D^b and L_0 ≅ L_1 ⊗ I_D^a, and c sends (deg L_2, b, a) to the class (deg L_0, deg L_2) = (deg L_2 − a − b, deg L_2) of Hck^{∗}_{𝔾_m}; so c is surjective on isomorphism classes with infinite fibres {(a,b) : a + b = n}. |
| `ModificationChain.torus_disjoint_test` | Same G and partition, S a geometric point with D_1 ≠ D_2: chains are classified by (deg L_2, b, a) ∈ ℤ³ with L_1 = L_2 ⊗ I_{D_2}^b and L_0 = L_1 ⊗ I_{D_1}^a; objects of Hck^{1,2}_{𝔾_m} over (D_1,D_2) are classified by (deg L_2, a, b) through L_0 = L_2 ⊗ I_{D_1}^a ⊗ I_{D_2}^b; and c is the identity in these coordinates, hence bijective on isomorphism classes. |
| `ModificationChain.GL2_test` | G = GL_2, one common leg at a geometric point with untilt C♯, E_2 fixed with Ê_2 trivialised, bounds μ_1 = μ_2 = (1,0). Bounded chains are the flags of lattices Λ_0 ⊂ Λ_1 ⊂ Ê_2 with both successive quotients of length one, a ℙ¹-bundle over ℙ¹(C♯). The map c, (Λ_0 ⊂ Λ_1) ↦ Λ_0, is onto the set of lattices with Ê_2/Λ_0 of length two; its fibre is one point if Ê_2/Λ_0 ≅ B⁺_dR/ξ² and is ℙ¹(C♯) if Λ_0 = ξÊ_2. |
| `ModificationChain.empty_part_test` | For the partition I = I ⊔ ∅ the chain stack is Hck^I_G ×_{Bun_G} Hck^∅_G ≃ Hck^I_G and c is this equivalence; for the partition with one part, c is the identity. |

<a id="hs0-5"></a>

### HS0.5 — Twisted period Grassmannians

First take $E=\mathbb Q_p$. For reductive $G$, arbitrary $b$,
and bounds with reflex fields $F_i$, define the twisted Grassmannian
over $\prod_i\mathrm{Spd}\breve F_i$. Its points are generic
$G$-torsors on $S\mathbin{\dot\times}\mathrm{Spa}\mathbb Q_p$,
a Frobenius isomorphism away from the untilts, and a framing on a large
annulus identifying Frobenius with $b\sigma$. Bound the position of
the torsor relative to its Frobenius pullback, equivalently the type of
the inverse Frobenius modification. Extend the framing uniquely away from
the nonnegative backward Frobenius translates of the legs, with meromorphic
extensions along those translates.

For one leg, completion identifies the space with the ordinary bounded
Grassmannian for every $b$. For two legs, construct the ordinary
Beilinson–Drinfeld chart away from nontrivial Frobenius collisions, and the
Frobenius pullback of a convolution chart around each collision with signed
iterate $m$. For positive $m$, the transition translates the first
lattice by $b_m=b\sigma(b)\cdots\sigma^{m-1}(b)$; negative $m$
exchanges the legs. For $b=1$ recover the gluing of [SW], Definition
23.4.1. Changing the framing realizes $\sigma$-conjugacy. Prove proper
spatial representability over the leg base. When two legs are globally
related by a positive backward iterate, describe the points as two-step
bundle modifications at their common image in $X_S$, with the intermediate
bundle part of the data. General local fields are treated in HS2.

**Prerequisites:** [HS0.4](#hs0-4), [HS0.2](#hs0-2); `RelativeFarguesFontaine:RF4:G-torsors`; `GeometricSatakeAndFusion:GS0:loop-geometry`; `RelativeFarguesFontaine:RF2:untilts`; `RelativeFarguesFontaine:RF0:annuli`.

**Sources:** [SW], Lecture 23, Definition 23.5.1, p. 223; Lecture 23, Definition 23.4.1, p. 221; Lecture 23, proof of Proposition 23.4.2, p. 222; Lecture 23, Remark 23.4.3, p. 222; Lecture 23, Proposition 23.5.2, p. 223; Lecture 23, proof of Proposition 23.5.2, p. 224; [FS], IX.3, p. 326.

**API:**

| Name | Required behavior |
| --- | --- |
| `TwistedPeriodData` | For S ∈ Perf_k with untilts S♯_i over F̆_i: triples (P_η, φ, ι) of a G-torsor on S ×̇ Spa ℚ_p, a meromorphic isomorphism φ: Frob_S^*P_η ⇢ P_η off ⋃ S♯_i, and a trivialisation ι near infinity carrying φ to b × Frob_S, with the position of P_η relative to Frob_S^*P_η at S♯_i bounded by Σ_{j: S♯_j = S♯_i} μ_j. |
| `TwistedPeriodData.frobenius` | The isomorphism φ: (Frob_S^*P_η)\|_U ≅ P_η\|_U on the complement U of the legs, meromorphic along the legs. |
| `TwistedPeriodData.framing` | The trivialisation ι, which extends uniquely to S ×̇ Spa ℚ_p ∖ ⋃_{i,n≥0} φ⁻ⁿ(S♯_i), meromorphically along these divisors, with φ = b × Frob_S in the extended trivialisation. |
| `TwistedPeriodData.ext` | Two triples over the same legs are equal iff there is an isomorphism of the torsors commuting with φ and compatible with ι on some Y_{[r,∞)}(S); it is then unique, and a triple is determined by the lattices of P_η relative to the extended ι along the divisors S♯_i. |
| `TwistedPeriodData.one_leg` | For m = 1 and every b, completion along S♯_1 is an isomorphism Gr^{tw,b}_{G,≤μ} ≅ Gr_{G,Spd F̆_1,≤μ}. |
| `TwistedPeriodData.toBD` | Over the open locus where S♯_i ≠ φⁿ(S♯_j) for all i ≠ j and n ≠ 0, completion along Σ_i S♯_i is an isomorphism of Gr^{tw,b}_{G,≤μ•} onto the Beilinson–Drinfeld Schubert variety Gr_{G,≤μ•} of Scholze–Weinstein Definition 20.4.4, for every b. |
| `TwistedPeriodData.collision` | For two legs, over the open locus where S♯_2 ≠ φ⁻ⁿ(S♯_1) for all n ≠ m (m > 0), Gr^{tw,b} is isomorphic to the pullback under (φ × 1)⁻ᵐ of the convolution Schubert variety; on the common locus this chart and the Beilinson–Drinfeld chart differ by the Frobenius identification composed with left translation by b_m = b·σ(b)⋯σ^{m−1}(b) at the first leg. |
| `TwistedPeriodData.sigma_conj` | For y ∈ G(L), (P_η,φ,ι) ↦ (P_η,φ,(y × id)∘ι) is an isomorphism Gr^{tw,b} ≅ Gr^{tw,y b σ(y)⁻¹}; for y, y′ it composes to the isomorphism for y′y. |
| `TwistedPeriodData.truncation` | Over a quasicompact open U of the base there is n_0 such that recording the modifications of the trivial torsor at φ⁻ⁿ(S♯_i), 0 ≤ n < n_0, is a closed embedding of Gr^{tw,b}_{≤μ•}\|_U into a Schubert variety of the Beilinson–Drinfeld Grassmannian over U × φ⁻¹(U) × ⋯ × φ^{−n_0+1}(U). |
| `TwistedPeriodData.proper` | Gr^{tw,b}_{G,≤μ•} → Spd F̆_1 ×_k ⋯ ×_k Spd F̆_m is proper and representable in spatial diamonds. |
| `TwistedPeriodData.chain` | For two legs with S♯_2 = φ⁻ᵐ(S♯_1), m > 0, the points are the bounded chains E ⇢ E′ ⇢ E_b on X_S at the common image of the legs, with E′ relative to E_b bounded by μ_1 and E relative to E′ bounded by μ_2. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `TwistedPeriodData.one_leg_test` | For m = 1 and any b, Gr^{tw,b}_{G,≤μ} → Gr_{G,Spd F̆_1,≤μ} is an isomorphism. For G = 𝔾_m and μ = n it is Spd F̆_1: the unique point over S is the line bundle P_η = 𝒪(−n·Σ_{j≥0} φ⁻ʲ(S♯_1)) on S ×̇ Spa ℚ_p, with ι the inclusion into the meromorphic functions and φ multiplication by b. |
| `TwistedPeriodData.no_leg_test` | For m = 0 and every b ∈ G(L), Gr^{tw,b}(S) is a single point for all S ∈ Perf_k, namely (G × Y_{(0,∞)}(S), b × Frob_S, id). |
| `TwistedPeriodData.torus_collision_test` | G = 𝔾_m, m = 2, μ• = (a,c) ∈ ℤ², b = 1: the map to Spd L ×_k Spd L is an isomorphism, and the unique point over S is P_η = 𝒪(−a·Σ_{n≥0} φ⁻ⁿ(S♯_1) − c·Σ_{n≥0} φ⁻ⁿ(S♯_2)) with ι the inclusion. At a geometric point with S♯_2 = φ⁻¹(S♯_1) the order of P_η along S♯_2 relative to ι is a + c, while its position relative to Frob_S^*P_η there is c. |
| `TwistedPeriodData.GL2_collision_test` | G = GL_2, μ_1 = μ_2 = (1,0), b = 1. Over a geometric point of the diagonal S♯_1 = S♯_2 the fibre is the set of lattices Λ ⊂ (B⁺_dR)² with quotient of length two, the Schubert variety of (2,0). Over a geometric point with S♯_2 = φ⁻¹(S♯_1) the fibre is the set of flags Λ_0 ⊂ Λ_1 ⊂ (B⁺_dR)² at S♯_2 with successive quotients of length one, a ℙ¹-bundle over ℙ¹, and the map (Λ_0 ⊂ Λ_1) ↦ Λ_0 to the first kind of fibre is not injective: its fibre over ξ·(B⁺_dR)² is ℙ¹. So over such a point the fibre of the twisted Grassmannian does not map isomorphically to the fibre of the Beilinson–Drinfeld Grassmannian of the images of the legs in X_S, and over the diagonal the fibre of the convolution Grassmannian does not map isomorphically to the fibre of the twisted Grassmannian: neither space describes the twisted Grassmannian over the whole base. |

<a id="hs0-6"></a>

### HS0.6 — Change of structure group and basic inner forms

Extend structure group along every morphism of reductive groups. This
commutes with the source and target maps, localization, units, inversion,
finite-set maps and chain composition; the new bound is the dominant
representative of the image cocharacter. Multiplication by a central
modification adds its central bound. The actual positions at the distinct
divisors satisfy
$\kappa(\mathcal E_1)-\kappa(\mathcal E_2)=\sum_x\mu_x^\sharp$,
or $c_1(\mathcal E_1)-c_1(\mathcal E_2)=-\sum_x\mu_x^\sharp$.
For split bounded substacks the Kottwitz change is $\sum_i\mu_i^\sharp$.

For basic $b$, construct the pure inner-form equivalence
$\tau_b:\mathrm{Bun}_G\simeq\mathrm{Bun}_{G_b}$ from the
$\mathcal E_b$-isomorphism torsor. It sends a modification to the one
induced contravariantly by its inverse, and carries the cocharacter class
through the inner-form dictionary without changing its bound. Check
compatibility with every Hecke operation. For nonbasic $b$, $G_b$
is a form of a proper Levi and this equivalence is not asserted. Use the
supplier's Beauville–Laszlo sign and inversion dictionary specified above.

**Prerequisites:** [HS0.1](#hs0-1), [HS0.2](#hs0-2), [HS0.4](#hs0-4); `RelativeFarguesFontaine:RF4:G-torsors`; `BunGAndNewtonStrata:BG0`; `BunGAndNewtonStrata:BG1`; `BunGAndNewtonStrata:BG2:uniformization`; `VectorBundlesAndIsocrystals:VB3:positive-basic-examples`.

**Sources:** [FS], III.4, Corollary III.4.3, p. 101; III.4, Proposition III.4.2, p. 101; III.4, Proposition III.4.1(ii), p. 100; IX.6.4, p. 333; IX.6, proof of Theorem IX.6.1, p. 331; III.3, Proposition III.3.6(ii), p. 100; III.2.2, p. 91; II.2, proof of Proposition II.2.3, p. 61; IX.7, p. 337; [SW], Lecture 23, proof of Corollary 23.3.2, p. 219; Lecture 24, Definition 24.1.1 and Proposition 24.1.2, p. 225.

## HS1 — The solid and lisse Hecke action

Pull the normalized Satake kernels to the global correspondence, construct their relative-homology operators, and prove the geometric, duality and continuous Weil properties. The categorical and all-prime representation interfaces in the supplier contracts are prerequisites throughout.

<a id="hs1-1"></a>

### HS1.1 — Solid Satake kernels

Construct the exact $\Lambda$-linear, $\mathrm{Rep}_\Lambda(Q^I)$-linear
monoidal functor $V\mapsto S'_V=\mathbb D(S_V)^\vee$ on the local
Hecke stack, then pull it to the global stack by completion. Extend from
$\mathbb Z_\ell[r]$ using the enhanced perfect-complex Satake interface.
The tensor operation on kernels is convolution; the unit is the relative
homology of the unit section. Preserve evaluations, coevaluations and duals,
and make the construction compatible with finite-set diagonal maps and
restriction of the pinned Weil action. A representation of $Q^I$ tensors
the kernel by its leg local system, which can be nonconstant. At a
minuscule one-leg bound of dimension $d$, fix
$S'_V=\Lambda[-d](-d/2)$. Convolution and coefficient extension must
carry coherent associativity and unit constraints.

**Prerequisites:** [HS0.1](#hs0-1), [HS0.4](#hs0-4); `GeometricSatakeAndFusion:GS4:integral-dual-group`; `VStackSheavesAndLisseCategories:VS2`; `EnhancedDerivedSheaves:E5:abstract`; `GeometricSatakeAndFusion:GS2:correspondences`.

**Sources:** [FS], IX.2, p. 321; VII.5, p. 264; IX.2, p. 322.

**API:**

| Name | Required behavior |
| --- | --- |
| `globalKernel` | For V∈Rep_Λ((Ĝ⋊Q)^I): the object S′_V=q_I^*(S′_V)^{loc}∈D_■(Hck^I_G,Λ), where for Λ=Z_ℓ[√q] the local object is D(S_V)^∨, D the Verdier dual relative to 𝓗ck^I_G→[(Div¹)^I/L⁺G] and A^∨=RHom_{D_■}(A,Λ), and for general Λ it is the value of the unique exact Rep_Λ(Q^I)-linear monoidal extension. |
| `globalKernel.map` | V↦S′_V is covariant, Λ-linear and exact: f: V→W induces S′_f: S′_V→S′_W with S′_{id}=id and S′_{g∘f}=S′_g∘S′_f; a short exact sequence 0→V′→V→V″→0 in Rep_Λ((Ĝ⋊Q)^I) gives a cofibre sequence S′_{V′}→S′_V→S′_{V″}. |
| `globalKernel.unit` | S′_1≅δ_♮Λ for the identity-modification section δ: Bun_G×(Div¹)^I→Hck^I_G; consequently RHom_{D_■}(S′_1,Λ)≅δ_*Λ. |
| `globalKernel.tensor` | Monoidal constraint S′_{V⊗W}≅S′_V⋆S′_W for the convolution of D_■(Hck^I_G,Λ) over (Div¹)^I, natural in V and W, with the associativity and unit coherences. |
| `globalKernel.weilLinear` | For U∈Rep_Λ(Q^I): S′_{U⊗V}≅p^*L_U⊗^■_ΛS′_V, where p: Hck^I_G→(Div¹)^I is the leg map and L_U the local system on (Div¹)^I attached to U through (Div¹)^I→[*/W_E^I]→[*/Q^I]; compatible with the monoidal constraints. |
| `globalKernel.restrictLegs` | For a map ζ: I→J of finite sets let ζ^*: Rep_Λ((Ĝ⋊Q)^I)→Rep_Λ((Ĝ⋊Q)^J) be restriction along (Ĝ⋊Q)^J→(Ĝ⋊Q)^I, ι_ζ: Hck^I_G×_{(Div¹)^I}(Div¹)^J→Hck^J_G the fully faithful map of HS0.1 (5), which restricts to a closed immersion on every bounded part (there it is a monomorphism between stacks that are proper over Bun_G×(Div¹)^J, by HS0.3 (c)), and pr_ζ the projection to Hck^I_G. Then S′_{ζ^*V}≅ι_{ζ♮}pr_ζ^*S′_V, compatibly with composition of maps of finite sets and with the monoidal constraints. |
| `globalKernel.dual` | S′_V is left and right dualizable for ⋆ with dual S′_{V^∨}; the evaluation and coevaluation are the images of those of V. |
| `globalKernel.switch` | After pullback to Spd C→(Div¹)^I and for V∈Rep_Λ(Ĝ^I): sw^*S′_V≅S′_{sw^*V}, where sw is the involution of the Hecke stack exchanging the two bundles and sw^* on Rep_Λ(Ĝ^I) is the Chevalley involution composed with conjugation by ρ̂(−1)∈Ĝ_ad (FS VI.12.1). |
| `globalKernel.support` | If the weights of V\|_{Ĝ^I} are bounded by a tuple μ_• of dominant cocharacters, then S′_V≅i_♮i^*S′_V for the closed bounded substack i: Hck^I_{G,≤μ_•}→Hck^I_G, on which p_2 is proper, representable in spatial diamonds and of finite dim.trg. |
| `globalKernel.geometricFibre` | The composite Rep_Λ((Ĝ⋊Q)^I)→D_■(Hck^I_G,Λ)→D_■(Hck^I_G×_{(Div¹)^I}Spd C,Λ) factors through the restriction functor to Rep_Λ(Ĝ^I). |
| `globalKernel.torsion` | For Λ₀=Z/ℓⁿ[√q] and V∈Rep_{Λ₀}((Ĝ⋊Q)^I) with pulled-back Satake sheaf S_V∈D_ét(Hck^I_G,Λ₀), and with D(S_V) the pullback along q_I of the Verdier dual of the Satake sheaf on the local Hecke stack relative to 𝓗ck^I_G→[(Div¹)^I/L⁺G]: S′_V=RHom_{D_■}(D(S_V),Λ₀), and D(S_V)≅RHom_{D_■}(S′_V,Λ₀) (biduality of FS VII.4.1, stated there for Z/n-coefficients). |
| `globalKernel.minuscule` | G split, I a singleton, μ a minuscule dominant cocharacter with d=⟨2ρ,μ⟩, i_μ: Hck_{G,μ}→Hck_G the closed stratum and V the minuscule representation with S_V=i_{μ*}Λ[d](d/2): then S′_V≅i_{μ♮}Λ[−d](−d/2). |
| `globalKernel.torus` | G=T a split torus, I a singleton, χ∈X^*(T̂)=X_*(T): S_χ=S′_χ is the constant sheaf Λ in degree 0, extended by zero, on the open and closed substack of Hck_T of modifications of position χ (HS0.2), which p_2 maps isomorphically onto Bun_T×Div¹. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `globalKernel.unit_test` | For every finite set I and the trivial representation 1 of (Ĝ⋊Q)^I: S′_1≅δ_♮Λ, where δ: Bun_G×(Div¹)^I→Hck^I_G is the identity modification, and RHom_{D_■}(S′_1,Λ)≅δ_*Λ. For I=∅ this reads S′_1=Λ on Hck^∅_G=Bun_G. |
| `globalKernel.minuscule_test` | For G=PGL_2, I a singleton, V the standard representation of Ĝ=SL_2 and i_μ: Hck_{G,μ}→Hck_G the minuscule closed stratum (a fibration in twisted forms of P¹ over Bun_G×Div¹): S_V=i_{μ*}Λ[1](1/2), D(S_V)≅S_V and S′_V≅i_{μ♮}Λ[−1](−1/2). |
| `globalKernel.torus_test` | For G=G_m, I a singleton and V_n the character z↦zⁿ of Ĝ=G_m: S′_{V_n} is the constant sheaf Λ in degree 0, extended by zero, on the open and closed substack of Hck_{G_m} of modifications L_1⇢L_2 with deg L_2−deg L_1=n, that is L_1=L_2(−nD), the modifications of position n in the normalisation of HS0.2; and S′_{V_n}⋆S′_{V_m}≅S′_{V_{n+m}}. |
| `globalKernel.weil_character_test` | For U∈Rep_Λ(Q^I) inflated to (Ĝ⋊Q)^I: S′_U≅δ_♮(pr_2^*L_U) with L_U the local system on (Div¹)^I attached to U. Its pullback to Spd C→(Div¹)^I is δ_♮ of a constant sheaf, but L_U is a constant local system on (Div¹)^I only if Q^I acts trivially on U. |
| `globalKernel.covariance_test` | For I a singleton and V∈Rep_Λ(Ĝ⋊Q) the coevaluation 1→V⊗V^∨ induces a map δ_♮Λ→S′_V⋆S′_{V^∨} and the evaluation V^∨⊗V→1 a map S′_{V^∨}⋆S′_V→δ_♮Λ, and these satisfy the two triangle identities. |

<a id="hs1-2"></a>

### HS1.2 — Hecke operators from relative homology

On $X_I=\mathrm{Bun}_G\times(\mathrm{Div}^1)^I$, write
$h_1=(p_1,\mathrm{legs})$, $h_2=p_2$. Construct the solid operator
$\widetilde T_V(B)=h_{2\natural}(h_1^*B\otimes^\blacksquare S'_V)$,
and $T_V(A)=\widetilde T_V(\mathrm{pr}^*A)$ for
$A\in D_\blacksquare(\mathrm{Bun}_G,\Lambda)$. Give its action on
morphisms and its base-change and finite-set comparisons. When $\Lambda$
is killed by a power of $\ell$, compare the eligible bounded
correspondence with $Rh_{2!}(h_1^*A\otimes S_V)$; properness of its
support also permits $Rh_{2*}$. These are comparisons, not a definition
of relative homology for general coefficients. Empty legs and finite
projective coefficient modules must give tensoring with that module,
including the idempotent direct-summand construction when it is not free.

**Prerequisites:** [HS1.1](#hs1-1), [HS0.1](#hs0-1), [HS0.3](#hs0-3); `VStackSheavesAndLisseCategories:VS2`; `VStackSheavesAndLisseCategories:VS3`; `mathlib:CategoryTheory.Adjunction`; `GeometricSatakeAndFusion:GS3:fusion`.

**Sources:** [FS], IX.2, p. 321; VII.3.1, p. 257; IX.2, p. 322; VII.5.2, p. 265; IX introduction, p. 317.

**API:**

| Name | Required behavior |
| --- | --- |
| `heckeOperator` | For a finite set I and V∈Rep_Λ((Ĝ⋊Q)^I): the functor T_V: D_■(Bun_G,Λ)→D_■(Bun_G×(Div¹)^I,Λ), T_V(A)=p_{2♮}(p_1^*A⊗^■_ΛS′_V), and its restriction to D_lis(Bun_G,Λ). |
| `heckeOperator.endo` | The endofunctor T̃_V of D_■(Bun_G×(Div¹)^I,Λ), T̃_V(B)=p_{2♮}(h_1^*B⊗^■_ΛS′_V) with h_1=(p_1,legs); it satisfies T_V(A)=T̃_V(pr^*A). |
| `heckeOperator.linear` | T_V and T̃_V are exact, Λ-linear and commute with all colimits; T̃_V is D_■((Div¹)^I,Λ)-linear: T̃_V(B⊗^■pr_2^*M)≅T̃_V(B)⊗^■pr_2^*M for M∈D_■((Div¹)^I,Λ). |
| `heckeOperator.map` | V↦T_V is a Λ-linear functor from Rep_Λ((Ĝ⋊Q)^I) to functors D_■(Bun_G,Λ)→D_■(Bun_G×(Div¹)^I,Λ), with T_{id}=id and T_{g∘f}=T_g∘T_f; a short exact sequence of representations gives a cofibre sequence of functors, and T_{V⊕W}=T_V⊕T_W. |
| `heckeOperator.unit` | T_1(A)≅pr^*A for the trivial representation 1, pr: Bun_G×(Div¹)^I→Bun_G. |
| `heckeOperator.baseChange` | For g: S→(Div¹)^I, (id×g)^*T_V(A)≅p_{2,S♮}(p_{1,S}^*A⊗^■S′_V\|_S) for the base change Hck^I_G×_{(Div¹)^I}S of the correspondence; similarly for T̃_V. |
| `heckeOperator.geometricFibre` | For the diagonal geometric point Spd C→(Div¹)^I the base change of T̃_V is an endofunctor of D_■(Bun_G×Spd C,Λ) that depends only on V\|_{Ĝ^I}; this defines T_W on D_■(Bun_G×Spd C,Λ) for every W∈Rep_Λ(Ĝ^I). |
| `heckeOperator.weilTwist` | For U∈Rep_Λ(Q^I) with local system L_U on (Div¹)^I: T_{U⊗V}(A)≅T_V(A)⊗^■_Λpr_2^*L_U; in particular T_U(A)≅pr_1^*A⊗^■_Λpr_2^*L_U. |
| `heckeOperator.torsion` | For Λ₀=Z/ℓⁿ[√q], V∈Rep_{Λ₀}((Ĝ⋊Q)^I) and A∈D_ét(Bun_G,Λ₀): T_V(A)≅Rp_{2!}(p_1^*A⊗^L_{Λ₀}S_V)=Rp_{2*}(p_1^*A⊗^L_{Λ₀}S_V) in D_ét(Bun_G×(Div¹)^I,Λ₀) (FS VII.5.2). |
| `heckeOperator.bounded` | If the weights of V\|_{Ĝ^I} are bounded by μ_•, then T_V(A)≅p_{2,≤μ_•♮}(p_{1,≤μ_•}^*A⊗^■i^*S′_V) for the restrictions of p_1, p_2 to the closed bounded substack i: Hck^I_{G,≤μ_•}→Hck^I_G. |
| `heckeOperator.minuscule` | G split, I a singleton, μ minuscule with d=⟨2ρ,μ⟩, V the minuscule representation with S_V=i_{μ*}Λ[d](d/2), h=p_2∘i_μ, g=p_1∘i_μ: T_V(A)≅h_♮g^*A[−d](−d/2)≅Rh_*g^*A[d](d/2). |
| `heckeOperator.torus` | G=T a split torus, I a singleton, χ∈X_*(T)=X^*(T̂): T_χ(A)=c_χ^*A, where c_χ: Bun_T×Div¹→Bun_T sends (E_2,D) to the unique T-bundle E_1 of position χ relative to E_2 at D (HS0.2); for T=G_m and χ=n, E_1=E_2(−nD). |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `heckeOperator.no_legs_test` | For I=∅: (Div¹)^∅ is a point, Hck^∅_G=Bun_G with p_1=p_2=id, Rep_Λ of the trivial group is the category of finite projective Λ-modules M, and T_M(A)=A⊗_ΛM, the direct summand of A^{⊕n} cut out by an idempotent n×n matrix over Λ with image M. In particular T_Λ=id and T_{Λ^n}(A)=A^{⊕n}. |
| `heckeOperator.unit_test` | For every finite set I and the trivial representation 1: T_1(A)≅pr^*A in D_■(Bun_G×(Div¹)^I,Λ), where pr: Bun_G×(Div¹)^I→Bun_G is the projection. |
| `heckeOperator.minuscule_test` | For G=PGL_2, I a singleton and V the standard representation of Ĝ=SL_2, let h=p_2∘i_μ: Hck_{G,μ}→Bun_G×Div¹ (proper, representable in spatial diamonds, cohomologically smooth of dimension 1, with fibres twisted forms of P¹) and g=p_1∘i_μ. Then T_V(A)≅h_♮g^*A[−1](−1/2)≅Rh_*g^*A[1](1/2), the second isomorphism by FS VII.3.5 with Rh^!Λ≅Λ[2](1). |
| `heckeOperator.torus_test` | For G=G_m, I a singleton and V_n the character z↦zⁿ of Ĝ=G_m: T_{V_n}(A)=c_n^*A for c_n: Bun_{G_m}×Div¹→Bun_{G_m}, (L,D)↦L(−nD): the kernel is supported on the modifications of position n, for which L_1=L_2(−nD) (HS0.2). Hence T_{V_n} carries sheaves supported on line bundles of degree d to sheaves supported in degree d+n, that is, from Kottwitz invariant a to a−n; T̃_{V_n} is pullback along the automorphism (L,D)↦(L(−nD),D) of Bun_{G_m}×Div¹, so it is an equivalence with inverse T̃_{V_{−n}}, and T̃_{V_n}∘T̃_{V_m}≅T̃_{V_{n+m}}. |
| `heckeOperator.weil_character_test` | For U∈Rep_Λ(Q^I) inflated to (Ĝ⋊Q)^I: T_U(A)≅pr_1^*A⊗^■_Λpr_2^*L_U, i.e. A⊗_ΛU with W_E^I acting on U through W_E^I→Q^I. If Λ is a field, I a singleton, U a nontrivial character of Q and A≠0, then T_U(A) is not isomorphic to T_1(A) in D_■(Bun_G×Div¹,Λ), although the two have isomorphic pullbacks to Bun_G×Spd C. |
| `heckeOperator.torsion_test` | For Λ₀=Z/ℓⁿ[√q], V∈Rep_{Λ₀}((Ĝ⋊Q)^I) and A∈D_ét(Bun_G,Λ₀): T_V(A)≅Rp_{2*}(p_1^*A⊗^L_{Λ₀}S_V) in D_ét(Bun_G×(Div¹)^I,Λ₀), the Hecke operator of the introduction of FS Chapter IX. |

<a id="hs1-3"></a>

### HS1.3 — Monoidal Hecke operators and fusion

For arbitrary solid kernels define
$K\star K'=c_\natural(\mathrm{pr}_1^*K\otimes^\blacksquare \mathrm{pr}_2^*K')$ on composable chains. Prove
$\Phi_{K\star K'}\simeq\Phi_{K'}\circ\Phi_K$ and the unit and
associativity coherences. The first kernel acts first; the product on
endofunctors at this stage is $F\cdot F'=F'\circ F$.
Composing with Satake yields $\widetilde T_{V\otimes W}\simeq \widetilde T_W\circ\widetilde T_V$; representation symmetry also
identifies this with the reverse order. Representations of $Q^I$
act by tensoring with their leg local systems.

For every finite-set map $a:I\to J$, pullback along its leg diagonal
intertwines $\widetilde T_V$ with the operator for the restriction of
$V$ along $(\widehat G\rtimes Q)^J\to(\widehat G\rtimes Q)^I$.
Require compatibility with composition of maps and monoidal constraints.
An exterior product of one-leg representations gives their iterated
operators in any order; restriction to the total diagonal gives the
operator of their tensor product. Geometric diagonal base change gives
the monoidal action on the solid category over $\mathrm{Spd}C$.

**Prerequisites:** [HS1.2](#hs1-2), [HS1.1](#hs1-1), [HS0.4](#hs0-4); `VStackSheavesAndLisseCategories:VS2`; `GeometricSatakeAndFusion:GS4:integral-dual-group`; `mathlib:CategoryTheory.MonoidalCategory`; `mathlib:CategoryTheory.Functor.Monoidal`.

**Sources:** [FS], IX.2, p. 321; VII.5, p. 267; Theorem IX.2.2, proof, p. 323; VI.9, p. 226.

<a id="hs1-4"></a>

### HS1.4 — Lisse preservation through Demazure generators

For a completed algebraic closure $C/E$ and the diagonal
$\mathrm{Spd}C\to(\mathrm{Div}^1)^I$, prove that the geometric Hecke
operator for $V\in\mathrm{Rep}_\Lambda(\widehat G^I)$ preserves
$D_{\mathrm{lis}}(\mathrm{Bun}_G\times\mathrm{Spd}C,\Lambda)$.
Geometric invariance of the lisse category then gives an endofunctor on
$D_{\mathrm{lis}}(\mathrm{Bun}_G,\Lambda)$. For
$(\widehat G\rtimes Q)^I$-representations this is the underlying
geometric operator after forgetting the Weil action.

Build the global Demazure correspondences from the local equivariant ones:
they are proper and spatial over the target bundle and cohomologically
smooth over the source bundle. Use the generation of dual ULA kernels
under colimits and the all-prime integral tensor-generation contract to
deduce lisse preservation. Finite-colimit generation with an Iwahori
retract is insufficient at torsion primes, so do not introduce a good-prime
assumption to bypass the required colimit argument.

**Prerequisites:** [HS1.2](#hs1-2), [HS1.3](#hs1-3); `GeometricSatakeAndFusion:GS1`; `VStackSheavesAndLisseCategories:VS3`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `VStackSheavesAndLisseCategories:VS2`; `VStackSheavesAndLisseCategories:VS4`; `GeometricSatakeAndFusion:GS0:loop-geometry`.

**Sources:** [FS], Proposition IX.2.1, p. 322; Proposition IX.2.1, proof, p. 322; Proposition VII.4.3, p. 263; Proposition VII.7.3, p. 273.

<a id="hs1-5"></a>

### HS1.5 — Adjoints and compactness

On the geometric lisse category, prove that $T_{V^\vee}$ is both left
and right adjoint to $T_V$. Their units and counits are the images of
the two evaluation and coevaluation pairings under the monoidal action;
prove both triangle identities with its coherence maps. Therefore
$T_V$ preserves all limits, all colimits and compact objects. For a
$(\widehat G\rtimes Q)^I$-representation the same assertions hold
after forgetting its Weil action. No hypothesis beyond the coefficient
conventions, in particular no good-prime restriction, is added.

**Prerequisites:** [HS1.4](#hs1-4), [HS1.3](#hs1-3); `mathlib:CategoryTheory.ExactPairing`; `mathlib:CategoryTheory.Adjunction`; `EnhancedDerivedSheaves:E5:presentability`.

**Sources:** [FS], Theorem IX.2.2, p. 322; Theorem IX.2.2, proof, p. 323; Theorem IX.0.1(i), p. 318.

<a id="hs1-6"></a>

### HS1.6 — Preservation of lisse ULA objects

For lisse $A$, use the definition of ULA through the internal-Hom
comparison on $\mathrm{Bun}_G\times\mathrm{Bun}_G$. Establish and
use the equivalent criteria: $R\mathrm{Hom}(B,A)$ is perfect over
$\Lambda$ for every compact $B$; or, at every Newton stratum
$b$, the invariants of $i^{b*}A$ under every open pro-$p$
$K_b\subset J_b(E)$ are perfect. The compact-preserving adjoint of
the Hecke operator then proves that $T_V(A)$ is ULA whenever $A$
is ULA. Track the stratum index on the invariant complex; it is the
complex attached to that stratum, rather than one fixed representation
for all $b$.

**Prerequisites:** [HS1.5](#hs1-5); `VStackSheavesAndLisseCategories:VS4`; `VStackSheavesAndLisseCategories:VS5`.

**Sources:** [FS], Theorem IX.2.2, proof, p. 323; Proposition VII.7.9, p. 275; Definition VII.7.8, p. 275; Theorem V.7.1, proof, p. 184.

<a id="hs1-7"></a>

### HS1.7 — Exchange with lisse and Bernstein–Zelevinsky duality

Let $\pi:\mathrm{Bun}_G\to *$, and let $\mathrm{sw}^*$ be the
Satake operation induced by interchanging the bundles. On the dual group
it is the Chevalley involution composed with conjugation by
$\widehat\rho(-1)$. For lisse $A,B$, prove
$\pi_\natural(T_V(A)\otimes^\blacksquare B)\simeq \pi_\natural(A\otimes^\blacksquare T_{\mathrm{sw}^*V}(B))$.
For compact $A$, deduce
$\mathbb D_{\mathrm{BZ}}T_V(A)\simeq T_{\mathrm{sw}^*V^\vee}(\mathbb D_{\mathrm{BZ}}A)$, using the
corepresenting definition of BZ duality. For every lisse $A$, prove
$R\mathcal Hom_{\mathrm{lis}}(T_V(A),\Lambda)\simeq T_{\mathrm{sw}^*V^\vee}(R\mathcal Hom_{\mathrm{lis}}(A,\Lambda))$.
Require naturality in the representation and the sheaf. Compactness is
needed for the BZ statement only.

**Prerequisites:** [HS1.5](#hs1-5), [HS1.1](#hs1-1), [HS1.2](#hs1-2); `GeometricSatakeAndFusion:GS4:integral-dual-group`; `VStackSheavesAndLisseCategories:VS2`; `VStackSheavesAndLisseCategories:VS3`; `VStackSheavesAndLisseCategories:VS5`.

**Sources:** [FS], Theorem IX.2.2, p. 322; Theorem IX.2.2, proof, p. 323; Proposition VII.7.6, p. 274; Proposition VI.12.1, p. 239.

<a id="hs1-8"></a>

### HS1.8 — Condensed enrichment and continuous equivariant objects

Give $D_\blacksquare(\mathrm{Bun}_G,\Lambda)$ its condensed
enhancement by evaluation on profinite $S$ as
$D_\blacksquare(\mathrm{Bun}_G\times S,\Lambda)$, with hyperdescent.
On extremally disconnected profinite sets take the corresponding full
lisse subcategory. The mapping anima are condensed animated
$\Lambda$-modules. Define continuous $W_E^I$-equivariant objects
by maps of condensed animated groups into their automorphisms and identify
them by descent with sheaves on $\mathrm{Bun}_G\times[*/W_E^I]$.
The lisse objects are those whose pullback to $\mathrm{Bun}_G$ is lisse.

Prove full faithfulness of their embedding into sheaves over the leg
space. For compact lisse $A$ and arbitrary lisse $B$, prove
$\mathrm{Hom}(A,B)\simeq\mathrm{Hom}(A,B)(*) \otimes_{\mathbb Z_{\ell,\mathrm{disc}}}\mathbb Z_\ell$.
Thus compact objects have the relatively discrete condensed structure
determined by their enhanced $\Lambda$-linear category. Use the
condensed chart-to-classifying-stack calculation, not just an equality
of abstract mapping sets.

**Prerequisites:** `VStackSheavesAndLisseCategories:VS2`; `VStackSheavesAndLisseCategories:VS3`; `VStackSheavesAndLisseCategories:VS4`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`; `mathlib:Condensed`; `mathlib:CondensedMod`; `EnhancedDerivedSheaves:E5:presentability`; `EnhancedDerivedSheaves:E5:abstract`.

**Sources:** [FS], IX.1, p. 320; Proposition IX.1.1, p. 320; Proposition IX.1.2, p. 320; Proposition IX.1.2, proof, p. 320.

**API:**

| Name | Required behavior |
| --- | --- |
| `condensedStructure` | For a profinite set S the ∞-category D_■(Bun_G×S,Λ); for S extremally disconnected its full subcategory D_lis(Bun_G×S,Λ). |
| `condensedStructure.pullback` | For g: S′→S the pullback functor (id×g)^*, with (id×id)^*=id and (id×(g∘g′))^*≅(id×g′)^*∘(id×g)^*; it preserves D_lis, and S↦D_■(Bun_G×S,Λ) is a hypersheaf. |
| `condensedStructure.point` | The evaluation at S=* is D_■(Bun_G,Λ), respectively D_lis(Bun_G,Λ). |
| `condensedStructure.hom` | The condensed mapping anima Hom(A,B): S↦Hom_{D_■(Bun_G×S,Λ)}(A\|_S,B\|_S), a condensed animated Λ-module, with composition Hom(B,C)×Hom(A,B)→Hom(A,C) and Hom(A,B)(*) the mapping anima of D_■(Bun_G,Λ). |
| `condensedStructure.equivariant` | For a finite set I the ∞-category D^{BW_E^I} of objects A with a map of condensed animated groups W_E^I→Aut(A); the forgetful functor to D is conservative and preserves limits and colimits. |
| `condensedStructure.trivialAction` | Pullback along Bun_G×[*/W_E^I]→Bun_G is the functor D→D^{BW_E^I} equipping A with the trivial action; its composite with the forgetful functor is the identity. |
| `condensedStructure.classifyingStack` | D_■(Bun_G×[*/W_E^I],Λ)≃D_■(Bun_G,Λ)^{BW_E^I}, compatibly with pullback along Bun_G→Bun_G×[*/W_E^I] and the forgetful functor. |
| `condensedStructure.lisse_equivariant` | FS IX.1.1: D_lis(Bun_G,Λ)^{BW_E^I}→D_■(Bun_G×[*/W_E^I],Λ)→D_■(Bun_G×(Div¹)^I,Λ) are fully faithful, and an object of D_■(Bun_G×[*/W_E^I],Λ) lies in D_lis(Bun_G,Λ)^{BW_E^I} iff its pullback to Bun_G lies in D_lis(Bun_G,Λ). |
| `condensedStructure.hom_relativelyDiscrete` | FS IX.1.2: for A∈D_lis(Bun_G,Λ)^ω and B∈D_lis(Bun_G,Λ), Hom(A,B)≅Hom(A,B)(*)⊗_{Z_ℓ,disc}Z_ℓ as condensed animated Λ-modules. |
| `condensedStructure.compact` | For A compact, B lisse and S extremally disconnected profinite: Hom(A,B)(S)≅Hom(A,B)(*)⊗^L_{Z_ℓ}C(S,Z_ℓ), C(S,Z_ℓ) the ring of continuous functions S→Z_ℓ. So on D_lis(Bun_G,Λ)^ω the condensed structure is determined by the Λ-linear stable ∞-category. |
| `condensedStructure.representations` | For G=1: D_lis(*,Λ)=D(Λ), and for a finite projective Λ-module M in degree 0 a W_E-equivariant structure on M is a homomorphism W_E→Aut_Λ(M) whose restriction to every profinite subset factors continuously through a finitely generated Z_ℓ-submodule of End_Λ(M) with its ℓ-adic topology. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `condensedStructure.point_test` | The evaluation at S=* is D_lis(Bun_G,Λ) with its mapping anima; the evaluation at the two-point set is D_lis(Bun_G,Λ)×D_lis(Bun_G,Λ); and for I=∅ the category D_lis(Bun_G,Λ)^{BW_E^∅} is D_lis(Bun_G,Λ). |
| `condensedStructure.continuous_functions_test` | For G=1, Λ=Z_ℓ[√q] (a finite free Z_ℓ-module) and A=B=Λ∈D_lis(*,Λ)=D(Λ): for S extremally disconnected profinite, Hom(A,B)(S) is concentrated in degree 0 and equals C(S,Λ)=C(S,Z_ℓ)⊗_{Z_ℓ}Λ, the continuous functions for the ℓ-adic topology. For S infinite this is strictly larger than the module of locally constant functions S→Λ. |
| `condensedStructure.hecke_algebra_test` | For K⊂G(E) open pro-p, j: [*/G(E)]→Bun_G the open immersion and A=j_♮c-Ind_K^{G(E)}Λ: Hom(A,A) is concentrated in degree 0 and Hom(A,A)(S)=Λ[K\G(E)/K]⊗_{Z_ℓ}C(S,Z_ℓ) for S extremally disconnected profinite. If Λ is killed by a power of ℓ this is the module of locally constant functions S→Λ[K\G(E)/K]. |
| `condensedStructure.continuous_representation_test` | For G=1, Λ=Z_ℓ[√q] and M a finite free Λ-module in degree 0, the W_E-equivariant structures on M∈D_lis(*,Λ) are exactly the Λ-linear actions W_E→GL_Λ(M) continuous for the ℓ-adic topology of M. In particular the base change to Λ of the Kummer extension of Z_ℓ by Z_ℓ(1) attached to a uniformizer of E, on which the inertia group acts through its tame ℓ-adic quotient by unipotent matrices of infinite order, is an equivariant object although no open subgroup of the inertia group acts trivially on it. |

<a id="hs1-9"></a>

### HS1.9 — Continuous Weil descent of the action

For $V\in\mathrm{Rep}_\Lambda((\widehat G\rtimes Q)^I)$ and lisse
$A$, prove that $T_V(A)$ descends from the leg space to
$\mathrm{Bun}_G\times[*/W_E^I]$ and that its underlying object is
lisse. Its image is therefore in
$D_{\mathrm{lis}}(\mathrm{Bun}_G,\Lambda)^{BW_E^I}$, with underlying
endofunctor $T_{V|\widehat G^I}$. For compact $A$, its automorphism
anima have the relatively discrete structure above, and the Weil action
is continuous in that structure. Reduce through bounded-weight
resolutions and their Satake convergence, retaining all primes
$\ell\ne p$.

The Drinfeld pullback is fully faithful for arbitrary solid sheaves on
every small v-stack, but its essential image need not be the whole
category over $(\mathrm{Div}^1)^I$. The equivalence with local
systems applies only to the objects that are v-locally constant with
perfect fibres. This restriction must be visible in the descent API.

**Prerequisites:** [HS1.8](#hs1-8), [HS1.4](#hs1-4), [HS1.5](#hs1-5), [HS1.3](#hs1-3); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `GeometricSatakeAndFusion:GS4:integral-dual-group`; `VStackSheavesAndLisseCategories:VS1`; `VStackSheavesAndLisseCategories:VS2`; `VStackSheavesAndLisseCategories:VS4`.

**Sources:** [FS], Corollary IX.2.3, p. 323; Corollary IX.2.3, proof, p. 323; Corollary VII.2.8, p. 256; Proposition IX.1.1, p. 320; Proposition IV.7.3, p. 165.

<a id="hs1-10"></a>

### HS1.10 — Coefficient change

For every homomorphism $\Lambda\to\Lambda'$ of
$\mathbb Z_\ell[r]$-algebras, prove that solid derived extension of
coefficients is symmetric monoidal, commutes with pullbacks and preserves
lisse objects. Put $V'=V\otimes_\Lambda\Lambda'$. Give natural
isomorphisms $S'_{V'}\simeq S'_V\otimes^\blacksquare_\Lambda\Lambda'$
and $T_{V'}(A_{\Lambda'})\simeq T_V(A)_{\Lambda'}$, also for
$\widetilde T$ on sheaves over the leg base. They must commute with
monoidal constraints, finite-set maps, $Q^I$-linearity and continuous
Weil structures. For restriction of scalars $r$, also prove
$rT_{V'}(B)\simeq T_V(rB)$. This last comparison uses the
supplier isomorphism for relative homology and restriction of scalars.
These natural comparisons are consequences to prove from the coefficient
and Satake interfaces; they are not a separately numbered theorem in [FS].

**Prerequisites:** [HS1.9](#hs1-9), [HS1.1](#hs1-1), [HS1.2](#hs1-2), [HS1.3](#hs1-3); `VStackSheavesAndLisseCategories:VS2`; `GeometricSatakeAndFusion:GS4:integral-dual-group`; `VStackSheavesAndLisseCategories:VS3`.

**Sources:** [FS], IX.2, p. 321; Proposition VII.3.1(ii), p. 257; Theorem IX.7.2, proof, p. 335.

## HS2 — Local shtuka spaces and period towers

Construct model shtukas over ℚ_p, compare them with framed modifications, and build the general-local-field level tower. Period geometry separates finite-level étaleness from the infinite-level pro-étale torsor and specifies the scope of classical points, nonemptiness and component results.

<a id="hs2-1"></a>

### HS2.1 — Framed integral-model shtukas over $\mathbb Q_p$

Let $\mathcal G/\mathbb Z_p$ be smooth affine with connected special
fibre and reductive generic fibre $G$; it need not be reductive or
parahoric. For arbitrary $b$ and a finite tuple of arbitrary bounds,
including the empty tuple, define shtukas as isomorphism classes of
$\mathcal G$-torsors $P$ on
$S\mathbin{\dot\times}\mathrm{Spa}\mathbb Z_p$, untilts over the
$\breve F_i$, Frobenius isomorphisms away from the untilts, and a
framing on $Y_{[r,\infty)}$ for some large $r$ identifying
Frobenius with $b\sigma$. Framings agree if they agree on a larger
annulus. Bound $\varphi_P^{-1}:P\dashrightarrow\mathrm{Frob}_S^*P$
by the sum of the cocharacters at equal untilts. In particular, for
$\mathrm{GL}_n$ and $\mu=(1^d,0^{n-d})$, the inverse extends to
an injection with locally free rank-$d$ cokernel on the untilt, while
$\varphi_P$ itself has a pole if $d>0$.

An isomorphism respects the Frobenius and large-annulus framing; it is
unique when it exists. Prove v-descent for this set-valued functor and
give its map to the product of reflex bases. Changing the framing by
$y$ implements $\sigma$-conjugacy, giving the continuous
$J_b(\mathbb Q_p)$-action. Retain the framing in the definition;
without it the moduli problem has automorphisms.

**Prerequisites:** [HS0.5](#hs0-5); `RelativeFarguesFontaine:RF4:G-torsors`; `BunGAndNewtonStrata:BG0`; `mathlib:WittVector.Isocrystal`; `tauceti:TauCeti.AffineGroupSchemeCat`; `GeometricSatakeAndFusion:GS0:loop-geometry`; `RelativeFarguesFontaine:RF0:integral-Y`; `RelativeFarguesFontaine:RF2:untilts`; `RelativeFarguesFontaine:RF0:annuli`.

**Sources:** [SW], Definition 23.1.1, p. 216; Definition 23.1.1, p. 217; Remark 23.1.3, p. 217; sentence after Theorem 23.1.4, p. 217; Proposition 19.5.3, p. 180; proof of Proposition 23.4.2, p. 222.

**API:**

| Name | Required behavior |
| --- | --- |
| `ShtukaDatum` | A point of Sht_{𝒢,b,μ•} over affinoid S ∈ Perf_k: a 𝒢-torsor P on S ×̇ Spa Z_p, untilts S_i♯ of S over F̆_i, an isomorphism φ_P : Frob_S^*P ≅ P over the complement of ⋃ S_i♯, meromorphic along ⋃ S_i♯ and such that the position of P relative to Frob_S^*P (the type of φ_P⁻¹ : P ⇢ Frob_S^*P) at S_i♯ is bounded by Σ_{j : S_j♯ = S_i♯} μ_j at all geometric rank-one points, and the germ at infinity ι of isomorphisms ι_r : P\|_{Y_[r,∞)(S)} ≅ G × Y_[r,∞)(S) carrying φ_P to b × Frob_S. |
| `ShtukaDatum.legs` | The structure map Sht_{𝒢,b,μ•} → Spd F̆_1 ×_{Spd k} ⋯ ×_{Spd k} Spd F̆_m sending a datum to its untilts. |
| `ShtukaDatum.frobenius` | The isomorphism φ_P from Frob_S^*P to P over (S ×̇ Spa Z_p) ∖ ⋃ S_i♯. It need not extend over the legs: at a geometric rank-one point it extends to an isomorphism across S_i♯ exactly when the position of P relative to Frob_S^*P there is trivial, and for 𝒢 = GL_n, μ = (1^d, 0^{n−d}) with d ≥ 1 it has a simple pole along S♯, while φ_P⁻¹ extends to an injection P ↪ Frob_S^*P. |
| `ShtukaDatum.ext` | Two data over S with the same untilts are equal in Sht_{𝒢,b,μ•}(S) if and only if there is an isomorphism of 𝒢-torsors P ≅ P′ compatible with φ_P, φ_{P′} and with ι, ι′ on Y_[r,∞)(S) for r large; such an isomorphism is unique. |
| `ShtukaDatum.isVSheaf` | Sht_{𝒢,b,μ•} is a v-sheaf on Perf_k (Scholze–Weinstein, after Theorem 23.1.4, from Proposition 19.5.3). That it is a locally spatial diamond (Theorem 23.1.4 of the source) is not part of the definition; it is proved through the period map. |
| `ShtukaDatum.framing_extends` | The framing ι_r extends uniquely to a φ-equivariant isomorphism P ≅ G × Y over Y_(0,∞)(S) ∖ ⋃_{i, n ≥ 0} φ^{−n}(S_i♯), meromorphic along the divisors φ^{−n}(S_i♯); with no legs it is an isomorphism over all of Y_(0,∞)(S) (Scholze–Weinstein, proofs of 23.2.1 and 23.4.2). |
| `ShtukaDatum.changeFrame` | For y ∈ G(L), (P,(S_i♯),φ_P,ι) ↦ (P,(S_i♯),φ_P,(y × id) ∘ ι) is an isomorphism c_y : Sht_{𝒢,b,μ•} ≅ Sht_{𝒢,y b σ(y)⁻¹,μ•} over the leg base, with c_1 = id and c_z ∘ c_y = c_{zy}. |
| `ShtukaDatum.sigmaCentralizerAction` | J_b(Q_p) = {y ∈ G(L) : y b σ(y)⁻¹ = b} acts on Sht_{𝒢,b,μ•} over the leg base by y ↦ c_y. |
| `ShtukaDatum.genericPart` | Restriction to S ×̇ Spa Q_p, (P,(S_i♯),φ_P,ι) ↦ (P\|_{S ×̇ Spa Q_p},(S_i♯),φ_P,ι), is a map π_GM : Sht_{𝒢,b,μ•} → Gr^tw_{G,∏ Spd F̆_i,≤μ•} to the twisted Grassmannian of HS0.5; it commutes with c_y. |
| `ShtukaDatum.diagonal` | Over the locus S_i♯ = S_j♯ (i ≠ j) a datum is, by the definition of the bound, a datum with m − 1 legs in which the i-th and j-th legs are replaced by one leg, after base change of the leg base to this locus. The locus is Spd(F̆_i ⊗_L F̆_j), a finite disjoint union of spaces Spd F′ with F′ a composite of F̆_i and of a conjugate of F̆_j over L. On the component where F′ is the composite F̆_iF̆_j inside the fixed algebraic closure, the common leg is bounded by the sum μ_i + μ_j of the dominant representatives; on the component of another conjugate, μ_j is replaced in this sum by the corresponding Galois conjugate class (as in HS0.2 (3)). |
| `ShtukaDatum.noLegs` | For m = 0: Sht_{𝒢,b,∅} = ∅ unless [b] = 1, and Sht_{𝒢,1,∅} ≅ underline{G(Q_p)/𝒢(Z_p)} × Spd k (Scholze–Weinstein, Proposition 23.2.1). |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `ShtukaDatum.noLegs_trivial_test` | For m = 0 and b = 1: Sht_{𝒢,1,∅} ≅ underline{G(Q_p)/𝒢(Z_p)} × Spd k, the constant sheaf on a discrete set; for 𝒢 = GL_n this set is the set of Z_p-lattices in Q_p^n and for 𝒢 = G_m it is Q_p^×/Z_p^× ≅ Z. |
| `ShtukaDatum.noLegs_nontrivial_test` | For m = 0, 𝒢 = G_m and b = p: Sht_{G_m,p,∅} = ∅. |
| `ShtukaDatum.gm_oneLeg_test` | For 𝒢 = G_m, one leg with μ(z) = z^d (d ∈ Z) and b ∈ L^×: Sht_{G_m,b,μ} is empty unless v_p(b) = −d; if v_p(b) = −d, the period map Sht_{G_m,b,μ} → Gr_{G_m,Spd Q̆_p,≤μ} = Spd Q̆_p is surjective and each of its geometric fibres is Q_p^×/Z_p^× ≅ Z. For d = 1: b = p⁻¹ gives a non-empty space and b = p the empty one. |
| `ShtukaDatum.lubinTate_test` | For 𝒢 = GL_2, μ = (1,0) and b the matrix with rows (0,1), (p⁻¹,0) (basic, κ(b) = v_p(det b) = −1): Sht_{GL_2,b,μ} is isomorphic over Spd Q̆_p to the diamond of the generic fibre of the Rapoport–Zink space of the one-dimensional formal group of height 2 over k (Scholze–Weinstein, Theorem 24.2.5), that is, of a disjoint union indexed by Z of open unit discs over Q̆_p; its period map to Gr_{GL_2,Spd Q̆_p,≤μ} = (P¹_{Q̆_p})^◇ is surjective with geometric fibres GL_2(Q_p)/GL_2(Z_p). |
| `ShtukaDatum.coincident_legs_test` | For 𝒢 = G_m, two legs with μ_1(z) = z, μ_2(z) = z⁻¹ and b = 1: the restriction of Sht_{G_m,1,(μ_1,μ_2)} to the diagonal Spd Q̆_p → Spd Q̆_p ×_{Spd k} Spd Q̆_p is underline{Q_p^×/Z_p^×} × Spd Q̆_p; the bound at the coincident leg is μ_1 + μ_2 = 0, so φ_P extends to an isomorphism across the leg and the no-leg computation applies. |
| `ShtukaDatum.nonminuscule_test` | For 𝒢 = GL_2, μ = (2,0) and b = p⁻¹·1_2: Sht_{GL_2,b,μ} is non-empty, and the fibre of its period map over each geometric point of the closed stratum Gr_{GL_2,(1,1)} ⊂ Gr_{GL_2,Spd Q̆_p,≤(2,0)} is GL_2(Q_p)/GL_2(Z_p). The target Gr_{GL_2,≤(2,0)} is the union of the 2-dimensional cell Gr_{(2,0)} and the point Gr_{(1,1)}; it is not the diamond of a flag variety of GL_2 (a point or P¹). |
| `ShtukaDatum.boundDirection_test` | For 𝒢 = G_m, one leg, μ(z) = z and b = p⁻¹: for every point (P, S♯, φ_P, ι) the framing identifies P\|_{Y_(0,∞)(S)} with the ideal sheaf of the divisor ⋃_{n≥0} φ^{−n}(S♯) in O_{Y_(0,∞)(S)}, with φ_P induced by p⁻¹·Frob_S; so φ_P⁻¹ is an inclusion P ↪ Frob_S^*P with cokernel O_{S♯}, and φ_P has a simple pole along S♯. The functor defined with inv(Frob_S^*P, P, φ_P) ≤ μ in place of inv(P, Frob_S^*P, φ_P⁻¹) ≤ μ is Sht_{G_m,b,μ⁻¹}, which is empty for b = p⁻¹ and non-empty for b = p. |

<a id="hs2-2"></a>

### HS2.2 — Framed modifications between two bundles

For arbitrary $b,b'\in B(G)$, define
$\mathrm{Mod}^I_{b,b',\le\mu_\bullet}$ as the 2-fibre of the bounded
Hecke stack at the two fixed bundles, over
$D_I=\prod_i\mathrm{Div}^1_{F_i}$. Its points are bounded meromorphic
isomorphisms $\mathcal E_b\dashrightarrow\mathcal E_{b'}$, with
no automorphisms. The full groups $\widetilde G_b$ and
$\widetilde G_{b'}$ act by
$(g,g')\alpha=g'\alpha g^{-1}$. Their quotient is the part of
the Hecke stack between the two Newton strata. Prove locally spatial
representability over $D_I$ and after pullback to
$\prod_i\mathrm{Spd}\breve F_i$. Inversion exchanges the bundles
and inverts the bounds; composition is invariant under the intermediate
automorphism group and equivariant for the outside groups.

For $b=1$, quotienting the source action by $K\subset G(E)$
gives the modification space used in the cohomology comparison. Over
$\mathbb Q_p$ with one leg, its reflex-base pullback is the
infinite-level shtuka space. The general two-bundle construction and
quotient description are consequences to prove from the global stack
and the full automorphism supplier, rather than definitions quoted
from a source treating only the trivial source bundle.

**Prerequisites:** [HS0.3](#hs0-3), [HS0.4](#hs0-4), [HS0.6](#hs0-6); `BunGAndNewtonStrata:BG3`; `BunGAndNewtonStrata:BG0`; `DiamondsAndVStacks:D5`; `BunGAndNewtonStrata:BG2:smooth-Artin`.

**Sources:** [FS], III.3, p. 97; proof of Proposition IX.3.2, p. 326; proof of Theorem IX.3.1, p. 324; proof of IX.7.2, p. 336; [SW], §23.3, p. 219.

**API:**

| Name | Required behavior |
| --- | --- |
| `FramedModification` | An S-point of Mod^I_{b,b′,≤μ•}: legs D_i ∈ Div¹_{F_i}(S) (i ∈ I) and an isomorphism α : E_b\|_{X_S ∖ ⋃D_i} ≅ E_b′\|_{X_S ∖ ⋃D_i} of G-bundles, meromorphic along ⋃D_i and bounded at D_i by Σ_{j : D_j = D_i} μ_j at all geometric points of S. |
| `FramedModification.legs` | The map Mod^I_{b,b′,≤μ•} → D_I, ((D_i), α) ↦ (D_i). |
| `FramedModification.ofHecke` | Mod^I_{b,b′,≤μ•} is the 2-fibre product Spd k ×_{x_b, Bun_G, p_1} Hck^I_{G,≤μ•} ×_{p_2, Bun_G, x_b′} Spd k: a map T → Mod^I_{b,b′,≤μ•} is the same as a point (E_1, E_2, (D_i), α) of Hck^I_{G,≤μ•}(T) with isomorphisms E_b ≅ E_1 and E_2 ≅ E_b′. |
| `FramedModification.sourceAction` | g ∈ G̃_b(S) = Aut(E_b\|_{X_S}) acts by α ↦ α ∘ g⁻¹; this is a left action over D_I. |
| `FramedModification.targetAction` | g′ ∈ G̃_b′(S) acts by α ↦ g′ ∘ α; it commutes with the source action. |
| `FramedModification.quotient` | [Mod^I_{b,b′,≤μ•}/(G̃_b × G̃_b′)] ≅ Bun_G^b ×_{Bun_G, p_1} Hck^I_{G,≤μ•} ×_{p_2, Bun_G} Bun_G^{b′}. |
| `FramedModification.locallySpatial` | Mod^I_{b,b′,≤μ•} → D_I is representable in locally spatial diamonds. |
| `FramedModification.inverse` | α ↦ α⁻¹ is an isomorphism Mod^I_{b,b′,≤μ•} ≅ Mod^I_{b′,b,≤μ•⁻¹} over D_I; it is an involution and intertwines the action of (g, g′) with that of (g′, g). |
| `FramedModification.comp` | For disjoint I, I′: (α, α′) ↦ α′ ∘ α is a map Mod^I_{b,b′,≤μ•} × Mod^{I′}_{b′,b″,≤μ′•} → Mod^{I⊔I′}_{b,b″,≤(μ•,μ′•)}; it is associative, and composition with the point id ∈ Mod^∅_{b,b} is the identity. |
| `FramedModification.changeGroup` | A homomorphism f : G → H with f(μ•) ≤ μ^H• induces Mod^I_{b,b′,≤μ•} → Mod^I_{f(b),f(b′),≤μ^H•}, α ↦ f_*α, equivariant along G̃_b → H̃_{f(b)} and G̃_b′ → H̃_{f(b′)} (HS0.6). |
| `FramedModification.noLegs` | Mod^∅_{b,b} = G̃_b, a bitorsor under G̃_b; Mod^∅_{b,b′} = ∅ for b ≠ b′. |
| `FramedModification.infiniteLevel` | For E = Q_p and one leg with reflex field F: Mod_{1,b,≤μ} ×_{Div¹_F} Spd F̆ is the sheaf of pairs (S♯, α : E_1 ⇢ E_b bounded by μ), which is Sht_{G,b,μ,∞}, with G̃_1 = underline{G(Q_p)} and J_b(Q_p) acting (Scholze–Weinstein, p. 219). |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `FramedModification.noLegs_test` | For I = ∅: Mod^∅_{b,b} = G̃_b with (g, g′) acting by h ↦ g′hg⁻¹, and Mod^∅_{b,b′} = ∅ for b ≠ b′ in B(G). For G = GL_2 and E_b = O ⊕ O(1): Mod^∅_{b,b}(S) is the set of triples (a, d, u) with a, d ∈ underline{E^×}(S) and u ∈ H⁰(X_S, O(1)), strictly larger than underline{E^× × E^×}(S) = underline{G_b(E)}(S). |
| `FramedModification.gm_test` | For G = G_m, one leg and μ(z) = z^d: with E_b = O(−v(b)), Mod_{b,b′,μ} is empty unless v(b) − v(b′) = d, and when v(b) − v(b′) = d it is a torsor over Div¹ under underline{E^×} = G̃_b acting on the source and equally under underline{E^×} = G̃_b′ acting on the target (c ∈ E^× multiplies α by c⁻¹ through the first action and by c through the second), an S-point being a leg D with an isomorphism E_b(dD) ≅ E_b′. For b = π, b′ = 1, d = 1 it is non-empty; for b = 1, b′ = π, d = 1 it is empty. |
| `FramedModification.oneBundle_test` | For G = G_m and μ(z) = z: Mod_{1,1,μ} = ∅, whereas the fibre of p_1 : Hck_{G_m,μ} → Bun_{G_m} over E_1 alone, with the target bundle not fixed, is Gr_{G_m,Div¹,μ} ≅ Div¹. |
| `FramedModification.shtuka_test` | For E = Q_p, G = G_m, μ(z) = z and b = p⁻¹: Mod_{1,b,μ} ×_{Div¹} Spd Q̆_p is the sheaf of pairs (S♯, α : O ⇢ O(1) of type μ at S♯), a Q_p^×-torsor over Spd Q̆_p, equal to Sht_{G_m,p⁻¹,μ,∞}; its quotient by Z_p^× has geometric fibres Q_p^×/Z_p^× ≅ Z. |
| `FramedModification.inverse_test` | Inversion identifies Mod_{b,1,≤μ} with Mod_{1,b,≤μ⁻¹}; for G = GL_2 and μ = (1,0) one has μ⁻¹ = (0,−1), and for G = G_m, μ(z) = z: Mod_{π,1,μ} ≅ Mod_{1,π,μ⁻¹}, both non-empty, while Mod_{1,π,μ} = ∅. |

<a id="hs2-3"></a>

### HS2.3 — Frobenius-equivariant integral torsors and lattice extension

Work over $\mathbb Q_p$, with $\mathcal G$ smooth affine with
connected fibres and reductive generic fibre, and a positive rational
radius $r$. Establish the equivalence between pro-étale
$\mathcal G(\mathbb Z_p)$-torsors on $S$ and
$\varphi^{-1}$-equivariant $\mathcal G$-torsors on
$Y_{[0,r]}(S)=\{|p|^r\le|[\varpi]|\}$. For an equivariant generic
$G$-torsor $P_\eta$ on $Y_{(0,r]}$, define
$\mathrm{Latt}(P_\eta)$ as integral equivariant extensions with a
specified identification on that punctured annulus.

Prove that this functor is a perfectoid space étale over $S$, with
image the open locus $S^a$ on which **both** $\nu$ and $\kappa$
vanish. Over it the generic torsor corresponds to a pro-étale
$G(\mathbb Q_p)$-torsor $\mathcal P_\eta$, and
$\mathrm{Latt}(P_\eta)=\mathcal P_\eta/\mathcal G(\mathbb Z_p)$.
It is surjective over $S^a$ and locally has fibre
$G(\mathbb Q_p)/\mathcal G(\mathbb Z_p)$, without requiring a
global section. For $\mathrm{GL}_n$, this is the usual functor of
$\mathbb Z_p$-lattices in the associated $\mathbb Q_p$-local
system, and the zero Newton polygon suffices. For general $G$,
zero Newton point alone does not characterize the admissible locus.

**Prerequisites:** `BunGAndNewtonStrata:BG1`; `DiamondsAndVStacks:D3`; `VectorBundlesAndIsocrystals:VB4`; `BunGAndNewtonStrata:BG2:uniformization`; `BunGAndNewtonStrata:BG0`.

**Sources:** [SW], Theorem 22.6.2, p. 214; Proposition 22.6.1, p. 213; §22.6, p. 213; Corollary 22.3.3, p. 209; Theorem 22.5.2, p. 212; proof of Theorem 22.6.2, p. 214.

**API:**

| Name | Required behavior |
| --- | --- |
| `LatticeSpace` | For S′ → S, Latt(P_η)(S′) is the set of isomorphism classes of pairs (P′, j) with P′ a φ⁻¹-equivariant 𝒢-torsor on Y_[0,r](S′) and j a φ⁻¹-equivariant isomorphism of P′\|_{Y_(0,r](S′)} with the pullback of P_η; such pairs have no non-trivial automorphisms. |
| `LatticeSpace.toBase` | The structure map Latt(P_η) → S is étale, with image the admissible locus S^a. |
| `LatticeSpace.admissibleLocus` | S^a = {s ∈ S : ν_{P_η}(s) = 0 and κ_{P_η}(s) = 0} is open in S and is the locus where the G-torsor on X_FF,S attached to P_η is trivial at geometric points. |
| `LatticeSpace.integralTorsors` | ℙ ↦ ℙ ×^{𝒢(Z_p)} (𝒢 ×_{Spa Z_p} Y_[0,r](S)) is an equivalence from pro-étale 𝒢(Z_p)-torsors on S to φ⁻¹-equivariant 𝒢-torsors on Y_[0,r](S); restriction to Y_(0,r](S) corresponds to ℙ ↦ ℙ ×^{𝒢(Z_p)} G(Q_p). |
| `LatticeSpace.genericTorsor` | Over S^a there is a pro-étale G(Q_p)-torsor ℙ_η, the sheaf of trivialisations of the fibre functor of P_η, with P_η = ℙ_η ×^{G(Q_p)} (G × Y_(0,r](S^a)). |
| `LatticeSpace.equivCosetBundle` | Latt(P_η) ≅ ℙ_η/𝒢(Z_p) = ℙ_η ×^{G(Q_p)} (G(Q_p)/𝒢(Z_p)) over S^a: a point over S′ is a pro-étale 𝒢(Z_p)-torsor ℙ with an identification ℙ ×^{𝒢(Z_p)} G(Q_p) = ℙ_η\|_{S′}. |
| `LatticeSpace.baseChange` | For T → S: Latt(P_η\|_T) = Latt(P_η) ×_S T and T^a is the preimage of S^a; this is compatible with composition of base changes. |
| `LatticeSpace.changeGroup` | A homomorphism f : 𝒢 → ℋ of such group schemes induces Latt(P_η) → Latt(f_*P_η), given on coset bundles by G(Q_p)/𝒢(Z_p) → H(Q_p)/ℋ(Z_p); for two models 𝒢′ → 𝒢 of the same G it is the projection ℙ_η/𝒢′(Z_p) → ℙ_η/𝒢(Z_p). |
| `LatticeSpace.glN` | For 𝒢 = GL_n, Latt(P_η) is the functor Latt(E_η) of Corollary 22.3.3 for the associated φ⁻¹-module E_η: it parametrises Z_p-lattices 𝕃 ⊂ 𝕃_η, and S^a is the locus where the Newton polygon of E_η is identically 0. |
| `LatticeSpace.trivial` | For P_η = G × Y_(0,r](S) with its standard φ⁻¹-structure: S^a = S, ℙ_η = underline{G(Q_p)} × S and Latt(P_η) = underline{G(Q_p)/𝒢(Z_p)} × S. |
| `LatticeSpace.independence` | Latt(P_η) is unchanged when r is replaced by a smaller r′ and P_η by its restriction, and does not depend on the pseudo-uniformizer ϖ. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `LatticeSpace.trivial_test` | For P_η = G × Y_(0,r](S) with its standard φ⁻¹-structure: Latt(P_η) ≅ underline{G(Q_p)/𝒢(Z_p)} × S. For 𝒢 = GL_n the coset g·GL_n(Z_p) is the φ⁻¹-module g·O^n_{Y_[0,r]} ⊂ O^n_{Y_(0,r]}; for 𝒢 = G_m, Latt(P_η) = ⊔_{m∈Z} S, the m-th copy being the extension p^m·O_{Y_[0,r]}. |
| `LatticeSpace.nonadmissible_test` | For 𝒢 = G_m, S non-empty and P_η the φ⁻¹-equivariant line bundle on Y_(0,r](S) corresponding to O_{X_FF,S}(d) with d ≠ 0: Latt(P_η) = ∅, although the underlying line bundle on Y_(0,r](S) extends to a line bundle on Y_[0,r](S). |
| `LatticeSpace.kappa_test` | Let 𝒯 be the norm-one torus of Z_{p²}/Z_p, T its generic fibre and b ∈ T(L) a representative of the non-trivial element of B(T) = X_*(T)_Γ = Z/2. For S non-empty and P_η the restriction to Y_(0,r](S) of the pullback of E_b: ν_{P_η} ≡ 0, because (X_*(T) ⊗ Q)^Γ = 0, but κ_{P_η} ≡ κ(b) ≠ 0, so S^a = ∅ and Latt(P_η) = ∅. |
| `LatticeSpace.gln_test` | For 𝒢 = GL_n and E_η = 𝕃_η ⊗_{Q_p} O_{Y_(0,r](S)} with 𝕃_η a pro-étale Q_p-local system of rank n on S: Latt(E_η)(S′) is the set of pro-étale Z_p-lattices 𝕃 ⊂ 𝕃_η\|_{S′}, the lattice 𝕃 corresponding to 𝕃 ⊗_{Z_p} O_{Y_[0,r](S′)}. |
| `LatticeSpace.twoModels_test` | For G = GL_2, 𝒢 = GL_2 and 𝒢′ the Iwahori group scheme with 𝒢′(Z_p) the matrices that are upper triangular modulo p (smooth with connected fibres), and P_η trivial: Latt_{𝒢′}(P_η) → Latt_𝒢(P_η) is underline{GL_2(Q_p)/𝒢′(Z_p)} × S → underline{GL_2(Q_p)/GL_2(Z_p)} × S, finite étale of degree p + 1. |

<a id="hs2-4"></a>

### HS2.4 — One-leg identification with bundle modifications

For $E=\mathbb Q_p$, identify a framed model shtuka with a quadruple
$(S^\sharp,\mathcal E,\alpha,\mathcal P)$: the untilt is over
$\breve F$, $\mathcal E$ is geometrically trivial on the curve,
$\alpha:\mathcal E\dashrightarrow\mathcal E_b$ has bound $\mu$,
and $\mathcal P$ is a $\mathcal G(\mathbb Z_p)$-lattice in its
torsor of trivializations. Obtain the first bundle from a small annulus,
the framed $\mathcal E_b$ from a large annulus, and glue the
modification between them. The lattice-extension equivalence recovers
the integral data.

Thus the model shtuka space is the quotient of
$\mathrm{Mod}_{1,b,\le\mu}\times_{\mathrm{Div}^1_F} \mathrm{Spd}\breve F$ by $\mathcal G(\mathbb Z_p)$; the map from
this infinite-level space is a pro-étale torsor. Only the subgroup of
rational points of the model is relevant. Inverting the modification
identifies the infinite-level space with
$\mathrm{Mod}_{b,1,\le\mu^{-1}}$ over the same base. Keep this
inversion in comparisons with sources whose tower is oriented in the
other direction. In our convention the one-leg nonempty datum has
$[b]\in B(G,\mu^{-1})$.

**Prerequisites:** [HS2.2](#hs2-2), [HS2.3](#hs2-3), [HS2.1](#hs2-1); `RelativeFarguesFontaine:RF4:G-torsors`; `BunGAndNewtonStrata:BG2:uniformization`.

**Sources:** [SW], Proposition 23.3.1, p. 218; proof of Proposition 23.3.1, p. 218; §23.3, p. 219; Definition 24.1.1, p. 225; [FS], proof of Theorem IX.3.1, p. 324; IX.3, p. 324.

<a id="hs2-5"></a>

### HS2.5 — The one-leg period map

Over $\mathbb Q_p$, complete the first bundle of a one-leg shtuka
along the untilt and use $\alpha$ to trivialize it after inverting
$\xi$. This defines the Grothendieck–Messing map to
$\mathrm{Gr}_{G,\mathrm{Spd}\breve F,\le\mu}$. Its admissible
open subfunctor consists of the points whose modified bundle is
geometrically trivial. Prove that the period map is étale with exactly
this image; its fibre is the sheaf of
$\mathcal G(\mathbb Z_p)$-lattices in the generic trivialization
torsor. The bounded Grassmannian is spatial, so these spaces are locally
spatial diamonds. The same description holds for every compact open
$K\subset G(\mathbb Q_p)$.

The infinite-level map is a pro-étale, hence quasi-pro-étale,
$G(\mathbb Q_p)$-torsor over the admissible locus. If that locus is
nonempty and $\dim G>0$, it is not étale, since the group is not
discrete. Empty loci are excluded from this last assertion.

**Prerequisites:** [HS2.4](#hs2-4), [HS2.3](#hs2-3); `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D5`; `GeometricSatakeAndFusion:GS0:loop-geometry`.

**Sources:** [SW], Proposition 23.3.3, p. 220; Remark 23.3.4, p. 220; proof of Proposition 23.3.3, p. 220; §23.4, p. 221.

<a id="hs2-6"></a>

### HS2.6 — Level towers, transitions and continuous group actions

From the pro-étale trivialization torsor $\mathcal P_\eta$, define
$\mathrm{Sht}_K=\mathcal P_\eta/K$ for every compact open $K$.
Its separated étale period map has the admissible locus as image. For
$K'\subset K$, the transition is finite étale and surjective of degree
$[K:K']$, and is a $K/K'$-torsor if $K'$ is normal. The
inverse limit over all levels, or over a neighbourhood basis of pro-$p$
levels, is $\mathcal P_\eta$.

The right torsor action is $\alpha\cdot g=\alpha g$; its left
version $g\cdot\alpha=\alpha g^{-1}$ carries level $K$ to
$gKg^{-1}$. The commuting target action is
$j\cdot\alpha=j\alpha$. Express both as actions of locally
profinite group v-sheaves. Extension of structure group gives maps of
towers whenever $f(K)\subset K_H$, compatible with composition.
Apply the quotient, transition and limit theory also to multi-leg
trivialization torsors and to framed two-bundle spaces, using compact
open subgroups of either source or target $J$-group. Prove the
degree and limit statements for those spaces as well.

**Prerequisites:** [HS2.5](#hs2-5), [HS2.2](#hs2-2); `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D5`; `ReductiveGroupsPartII:RG2.0`.

**Sources:** [SW], §23.3, p. 219; after Corollary 23.5.3, p. 224; [GLX], §3.4, p. 824; [FS], IX.3, p. 325.

**API:**

| Name | Required behavior |
| --- | --- |
| `LevelTower.level` | For a compact open K ⊂ G(Q_p): Sht_{G,b,μ,K} = ℙ_η/K; an S-point is a K-lattice ℙ in ℙ_η\|_S, i.e. a pro-étale K-torsor ℙ with an identification ℙ ×^K G(Q_p) = ℙ_η\|_S. |
| `LevelTower.period` | π_K : Sht_{G,b,μ,K} → Gr_{G,Spd F̆,≤μ} is separated étale with image the admissible locus; pro-étale locally on the admissible locus it is the projection from the product with the discrete set G(Q_p)/K. |
| `LevelTower.integralLevel` | Sht_{G,b,μ,𝒢(Z_p)} = Sht_{𝒢,b,μ}, the moduli space of HS2.1; it depends on 𝒢 only through 𝒢(Z_p). |
| `LevelTower.transition` | For K′ ⊂ K: t_{K′,K} : Sht_{G,b,μ,K′} → Sht_{G,b,μ,K}, ℙ ↦ ℙ ×^{K′} K, is finite étale surjective of degree [K : K′]; t_{K,K} = id, t_{K′,K} ∘ t_{K″,K′} = t_{K″,K}, and π_K ∘ t_{K′,K} = π_{K′}. |
| `LevelTower.transition_torsor` | If K′ is normal in K, then K/K′ acts on Sht_{G,b,μ,K′} over Sht_{G,b,μ,K} and t_{K′,K} is a K/K′-torsor. |
| `LevelTower.limit` | Sht_{G,b,μ,∞} = ℙ_η with the maps Sht_{G,b,μ,∞} → Sht_{G,b,μ,K} is the limit of the tower in v-sheaves: a compatible family of maps T → Sht_{G,b,μ,K} is a unique map T → ℙ_η. Each Sht_{G,b,μ,∞} → Sht_{G,b,μ,K} is a K-torsor, so Sht_{G,b,μ,K} = Sht_{G,b,μ,∞}/K. |
| `LevelTower.limit_points` | Sht_{G,b,μ,∞}(S) is the set of pairs (S♯, α) with S♯ an untilt of S over F̆ and α : E_1 ⇢ E_b a modification at S♯ bounded by μ. |
| `LevelTower.cofinal` | If 𝒦 is a set of compact open subgroups forming a neighbourhood basis of 1 in G(Q_p), then lim_{K∈𝒦} Sht_{G,b,μ,K} = Sht_{G,b,μ,∞}; the compact open pro-p subgroups form such a set. |
| `LevelTower.heckeAction` | g ∈ G(Q_p) induces isomorphisms Sht_{G,b,μ,K} ≅ Sht_{G,b,μ,gKg⁻¹}, compatible with transition maps and with composition in G(Q_p); on the limit this is the action of underline{G(Q_p)} on ℙ_η. |
| `LevelTower.sigmaCentralizerAction` | underline{J_b(Q_p)} acts on every Sht_{G,b,μ,K} and on Sht_{G,b,μ,∞}, compatibly with transition maps and commuting with the action of G(Q_p). |
| `LevelTower.map` | For f : G → H with f(K) ⊂ K_H: a map Sht_{G,b,μ,K} → Sht_{H,f(b),f∘μ,K_H}, compatible with transition maps on both sides and with composition of homomorphisms. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `LevelTower.noLegs_test` | For no legs and b = 1 (the case m = 0 of (f), where the twisted Grassmannian is Spd k and the torsor is underline{G(Q_p)} × Spd k): Sht_{G,1,∅,K} = underline{G(Q_p)/K} × Spd k, the transition map for K′ ⊂ K is induced by gK′ ↦ gK, and lim_K Sht_{G,1,∅,K} = underline{G(Q_p)} × Spd k, whose S-points are the continuous maps \|S\| → G(Q_p), not only the locally constant ones. |
| `LevelTower.torus_test` | For G = G_m, μ(z) = z^d, v_p(b) = −d, K_0 = Z_p^× and K_n = 1 + p^n Z_p (n ≥ 1): each geometric fibre of Sht_{G_m,b,μ,K_n} over Spd Q̆_p is Q_p^×/K_n ≅ Z × (Z/p^n)^×, and Sht_{G_m,b,μ,K_n} → Sht_{G_m,b,μ,K_0} is a (Z/p^n)^×-torsor, of degree (p−1)p^{n−1}. |
| `LevelTower.iwahori_test` | For G = GL_2, K = GL_2(Z_p) and K′ ⊂ K the subgroup of matrices that are upper triangular modulo p: Sht_{K′} → Sht_K is finite étale of degree p + 1 = \|P¹(F_p)\| and K′ is not normal in K, so no group K/K′ acts; for K″ = ker(GL_2(Z_p) → GL_2(F_p)) the map Sht_{K″} → Sht_K is a GL_2(F_p)-torsor of degree (p² − 1)(p² − p). |
| `LevelTower.integralLevel_test` | For K = 𝒢(Z_p): Sht_{G,b,μ,𝒢(Z_p)} = Sht_{𝒢,b,μ}. If 𝒢 and 𝒢′ are two smooth models of G with connected special fibres and 𝒢(Z_p) = 𝒢′(Z_p), then Sht_{𝒢,b,μ} = Sht_{𝒢′,b,μ}. |
| `LevelTower.hecke_test` | For g ∈ G(Q_p) the isomorphism Sht_K ≅ Sht_{gKg⁻¹} is, on the no-leg tower with b = 1 of (f) (points hK, h ∈ G(Q_p)), the map hK ↦ hg⁻¹·(gKg⁻¹); for g ∈ K it is the identity of Sht_K, and for g normalising K it is the right translation hK ↦ hg⁻¹K. |

<a id="hs2-7"></a>

### HS2.7 — Multi-leg period maps and representability

For model shtukas over $\mathbb Q_p$, restriction to the generic
period domain gives an étale map to the twisted Grassmannian. Its image
is the open locus where the bundle descending from a small annulus is
geometrically trivial. The model space, every $K$-level, and their
infinite-level torsor are locally spatial diamonds; the period target
is proper and spatial over the product of reflex bases. The level
structure map itself need be neither proper nor quasicompact: empty
legs and $b=1$ give $G(\mathbb Q_p)/K\times\mathrm{Spd}k$.

The infinite-level tower maps to the reflex-base pullback of
$\mathrm{Mod}^I_{1,b,\le\mu_\bullet}$. Prove it is an equivariant
isomorphism on the locus with no nontrivial Frobenius translates between
distinct legs. Equal untilts are allowed there. At a nontrivial
Frobenius collision, the shtuka retains intermediate modifications;
its image is their composition, and the ordinary bounded Hecke fibre
alone does not describe the source. No global multi-leg identification
with that fibre is asserted.

**Prerequisites:** [HS0.5](#hs0-5), [HS2.3](#hs2-3), [HS2.6](#hs2-6), [HS2.1](#hs2-1), [HS2.2](#hs2-2), [HS2.4](#hs2-4); `DiamondsAndVStacks:D5`.

**Sources:** [SW], Corollary 23.5.3, p. 224; Theorem 23.1.4, p. 217; Proposition 23.5.2, p. 223; after Corollary 23.5.3, p. 224; §23.4, p. 221; [FS], proof of Proposition IX.3.2, p. 326.

<a id="hs2-8"></a>

### HS2.8 — Empty legs and basic duality

Over $\mathbb Q_p$, prove that the no-leg model space is empty unless
$b$ represents the trivial class, and for $b=1$ is the constant
perfectoid space $G(\mathbb Q_p)/\mathcal G(\mathbb Z_p)$ over
$\mathrm{Spd}k$. For a basic one-leg datum, put
$\check G=J_b$, $\check b=b^{-1}$ under the inner-form identification
over $\breve{\mathbb Q}_p$, and $\check\mu=\mu^{-1}$.
Construct an infinite-level isomorphism to the tower of this dual datum,
over the same reflex base, exchanging the roles of
$G(\mathbb Q_p)$ and $J_b(\mathbb Q_p)$. Prove that applying
duality twice is the identity. Basicness is essential: otherwise
$J_b$ is a form of a proper Levi, so this dual datum is not defined.

**Prerequisites:** [HS2.6](#hs2-6), [HS2.1](#hs2-1), [HS2.3](#hs2-3), [HS2.2](#hs2-2); `BunGAndNewtonStrata:BG0`.

**Sources:** [SW], Proposition 23.2.1, p. 217; proof of Proposition 23.2.1, p. 218; Corollary 23.3.2, p. 219; proof of Corollary 23.3.2, p. 219.

<a id="hs2-9"></a>

### HS2.9 — Towers for a general local field

For general $E$, define the twisted period functor on
$Y_S=S\mathbin{\dot\times}\mathrm{Spa}\mathcal O_E \setminus V(\pi[\varpi])$, with $q$-Frobenius, arbitrary legs and
bounds, and a large-annulus framing to $b$. The position bound again
uses the inverse Frobenius modification. Prove proper spatial
representability over $\prod_i\mathrm{Spd}\breve F_i$, and the
ordinary Grassmannian identification for one leg. On a sufficiently
small annulus the torsor descends to a bundle on $X_S$; its
geometrically trivial locus is open and carries a pro-étale
$G(E)$-torsor of trivializations.

Define $\mathrm{Sht}_{(G,b,\mu_\bullet),K}$ as the quotient by
$K$ and prove the locally spatial, étale-period, finite-level and
limit assertions, with commuting continuous $G(E)$ and $J_b(E)$
actions. At $E=\mathbb Q_p$ and $K=\mathcal G(\mathbb Z_p)$
recover the integral-model functor. This spells out the construction
invoked for general fields in [FS], IX.3; it includes both
characteristics and imposes neither basicness nor minuscule bounds.
For $\mathbb G_m$, one leg of type $1$ is nonempty precisely
at $v_\pi(b)=-1$.

**Prerequisites:** [HS2.7](#hs2-7), [HS2.6](#hs2-6), [HS0.5](#hs0-5), [HS2.3](#hs2-3); `RelativeFarguesFontaine:RF4:G-torsors`; `RelativeFarguesFontaine:RF0`; `RelativeFarguesFontaine:RF0:integral-Y`; `RelativeFarguesFontaine:RF0:annuli`; `RelativeFarguesFontaine:RF2:untilts`; `GeometricSatakeAndFusion:GS0:loop-geometry`; `BunGAndNewtonStrata:BG2:uniformization`; `DiamondsAndVStacks:D5`; `VectorBundlesAndIsocrystals:VB3:positive-basic-examples`.

**Sources:** [FS], IX.3, after the proof of Theorem IX.3.1, pp. 325–326; IX.3, proof of Proposition IX.3.2, p. 326; [SW], Definition 23.5.1, p. 223; Corollary 23.5.3 and the paragraph after it, p. 224; Definition 11.1.2, pp. 90–91.

**API:**

| Name | Required behavior |
| --- | --- |
| `GeneralShtukaTower` | For (E, G, b, (μ_i)_{i∈I}, K) the v-sheaf Sht_{(G,b,μ•),K} on Perf_k whose S-points are tuples ((S_i♯), P_η, φ_P, ι_r, 𝒫): a point of Gr^{tw,a}(S) together with a K-lattice 𝒫 ⊂ 𝒫_η, that is a section of 𝒫_η/K. |
| `GeneralShtukaTower.legs` | f_K: Sht_{(G,b,μ•),K} → ∏_{i∈I} Spd F̆_i, ((S_i♯), …) ↦ (S_i♯). |
| `GeneralShtukaTower.periodMap` | π_K: Sht_{(G,b,μ•),K} → Gr^tw_{G,∏Spd F̆_i,≤μ•} forgets 𝒫; it is étale, separated, with image the open admissible locus, and its fibre over S → Gr^{tw,a} is 𝒫_η\|_S/K, which pro-étale locally on S is S × G(E)/K. |
| `GeneralShtukaTower.ext` | Two S-points are equal if and only if they have the same legs, there is an isomorphism of the pairs (P_η, φ_P) compatible with the germs of ι_r, and it carries one K-lattice to the other. |
| `GeneralShtukaTower.transition` | For K′ ⊂ K the map Sht_{(G,b,μ•),K′} → Sht_{(G,b,μ•),K}, 𝒫′ ↦ 𝒫′·K, is finite étale of degree [K:K′], a K/K′-torsor when K′ is normal in K; it is the identity for K′ = K, is compatible with composition for K″ ⊂ K′ ⊂ K, and commutes with π_K and f_K. |
| `GeneralShtukaTower.limit` | Sht_{(G,b,μ•),∞} = lim_K Sht_{(G,b,μ•),K} = 𝒫_η is a pro-étale G(E)-torsor over Gr^{tw,a}; over the complement of the Frobenius-twisted partial diagonals, the loci S_i♯ = φ^n(S_j♯) with i ≠ j and n ≠ 0, its S-points are the tuples ((S_i♯), α) with α: E_1 ≅ E_b an isomorphism away from the images D_i of the S_i♯ in X_S, meromorphic and bounded by μ•, that is by Σ_{j: S_j♯ = S_i♯} μ_j at D_i (for E = Q_p this is HS2.7 (e); the argument is the same for general E). |
| `GeneralShtukaTower.actions` | g ∈ G(E) = Aut(E_1) acts on 𝒫_η = Isom(E_1, E) by τ ↦ τ∘g⁻¹ and induces isomorphisms Sht_{(G,b,μ•),K} ≅ Sht_{(G,b,μ•),gKg⁻¹}, 𝒫 ↦ 𝒫·g⁻¹, compatible with transition maps and with products in G(E), as in HS2.6; j ∈ J_b(E) acts on every level by changing ι_r; the two actions commute and both commute with f_K. |
| `GeneralShtukaTower.oneLeg` | For \|I\| = 1, Gr^tw_{G,Spd F̆_1,≤μ_1} = Gr_{G,Spd F̆_1,≤μ_1} and, for E = Q_p, the tower is the one-leg tower of HS2.6. |
| `GeneralShtukaTower.integralModel` | For E = Q_p and K = 𝒢(Z_p), with 𝒢 smooth over Z_p with generic fibre G and connected special fibre, Sht_{(G,b,μ•),K} is the moduli space of framed 𝒢-shtukas on S ×̇ Spa Z_p (Scholze–Weinstein 23.1.1 and 23.5.3). |
| `GeneralShtukaTower.noLegs` | For I = ∅: Sht_{(G,b,∅),K} = ∅ if [b] ≠ 1 in B(G), and Sht_{(G,1,∅),K} is the constant sheaf G(E)/K. |
| `GeneralShtukaTower.lubinTate` | For G = G_m, one leg, μ = id and b = π⁻¹, so that E_b = O(1): Sht_{(G_m,b,μ),∞} is the sheaf of pairs (S♯, s) with s a section of O_{X_S}(1) whose divisor is the image of S♯, that is (BC(O(1)) ∖ {0}) ×_{Div¹} Spd Ĕ ≅ Z × Spd Ĕ_∞, with Ĕ_∞ the completion of the compositum of Ĕ and the Lubin–Tate extension E_∞ of E (Fargues–Scholze II.2.2–II.2.4). |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `GeneralShtukaTower.no_legs_test` | For I = ∅ and any E: Sht_{(G,b,∅),K} = ∅ when [b] ≠ 1; for b = 1 it is the constant sheaf G(E)/K, on which J_1(E) = G(E) acts by left translation. |
| `GeneralShtukaTower.qp_test` | For E = Q_p and K = 𝒢(Z_p) with 𝒢 a smooth model of G with connected special fibre, Sht_{(G,b,μ•),K} is the sheaf of quadruples (P, {S_i♯}, φ_P, ι_r) of Scholze–Weinstein, Definition 23.1.1, and Sht_{(G,b,μ•),K′} for K′ ⊂ G(Q_p) compact open is their Sht_{G,b,{μ_i},K′}. |
| `GeneralShtukaTower.lubin_tate_test` | For G = G_m, one leg and μ = id (the modification makes E_b the larger bundle): for b = π⁻¹ one has Sht_{(G_m,b,μ),∞} ≅ Z × Spd Ĕ_∞, Sht_{(G_m,b,μ),O_E^×} ≅ Z × Spd Ĕ and Sht_{(G_m,b,μ),1+π^nO_E} ≅ Z × Spd Ĕ_n, where Ĕ_n is the compositum of Ĕ with the field of π^n-torsion points of a Lubin–Tate formal O_E-module; for every b with v_π(b) ≠ −1 the tower is empty. |
| `GeneralShtukaTower.one_leg_test` | For \|I\| = 1 the map Gr^tw_{G,Spd F̆_1,≤μ_1} → Gr_{G,Spd F̆_1,≤μ_1}, sending (S♯, P_η, φ_P, ι_r) to the modification of the trivial torsor at S♯ defined by ι_r, is an isomorphism. |

<a id="hs2-10"></a>

### HS2.10 — Minuscule rigidification and local Shimura varieties

Let $E=\mathbb Q_p$ and $\mu$ be minuscule. The descended
Białynicki-Birula isomorphism identifies the bounded Grassmannian with
the diamond of $\mathrm{Fl}_{G,\mu,\breve F}$. Construct the unique
rigid space $M_{G,b,\mu,K}$ with a period map étale over this flag
variety and a specified diamond identification with $\mathrm{Sht}_K$.
It is smooth and partially proper; when nonempty its pure dimension is
$d=\langle2\rho,\mu\rangle$. It is nonempty exactly when
$[b]\in B(G,\mu^{-1})$. Its period image is the admissible open
rigid subspace, and its geometric fibres there are $G(\mathbb Q_p)/K$.

Lift every finite étale transition uniquely to rigid spaces, retaining
its degree, and lift both group actions. The period map is
$J_b(\mathbb Q_p)$-equivariant through its action on the flag variety.
The nonempty tower is the local Shimura variety. For non-minuscule
$\mu$, the Białynicki-Birula map is not an isomorphism, and this
construction supplies no rigid model.

**Prerequisites:** [HS2.5](#hs2-5), [HS2.6](#hs2-6); `GeometricSatakeAndFusion:GS0:Schubert-smoothness`; `DiamondsAndVStacks:D6`; `AdicEtaleGeometry:A2`; `AdicSpacesPartII:R0`.

**Sources:** [SW], Definition 24.1.1, p. 225; Proposition 24.1.2, p. 225; 24.1, after Proposition 24.1.2, p. 225; Definition 24.1.3, p. 226; Theorem 10.4.2, p. 81; Proposition 19.4.2, pp. 176–177; Lemma 19.1.4, p. 171; 24.2, after the proof of Theorem 24.2.5, p. 229; [FS], IX.3, before Theorem IX.3.1, p. 324.

**API:**

| Name | Required behavior |
| --- | --- |
| `Rigidification` | For a minuscule datum (G,b,μ) over Q_p and K ⊂ G(Q_p) compact open: a rigid space M_{G,b,μ,K} over F̆, an étale morphism π_K: M_{G,b,μ,K} → Fl_{G,μ,F̆}, and an isomorphism c_K: M_{G,b,μ,K}^♦ ≅ Sht_{G,b,μ,K} over Spd F̆ with BB ∘ π_GM ∘ c_K = π_K^♦. |
| `Rigidification.space` | M_{G,b,μ,K}: smooth and partially proper over F̆, of pure dimension ⟨2ρ,μ⟩ when non-empty, in general not quasicompact. |
| `Rigidification.periodMap` | π_K: M_{G,b,μ,K} → Fl_{G,μ,F̆} is étale; its image is the open subspace Fl^a whose diamond is the admissible locus, and its geometric fibres over Fl^a are G(Q_p)/K. |
| `Rigidification.comparison` | c_K: M_{G,b,μ,K}^♦ ≅ Sht_{G,b,μ,K}; it induces \|M_{G,b,μ,K}\| ≅ \|Sht_{G,b,μ,K}\| and an equivalence of étale sites. |
| `Rigidification.unique` | If (M′, π′, c′) is a second triple as in Rigidification, there is exactly one isomorphism M_{G,b,μ,K} ≅ M′ over Fl_{G,μ,F̆} carrying c_K to c′. |
| `Rigidification.lift` | For every rigid space U étale over Fl_{G,μ,F̆}, U ↦ U^♦ is a bijection from morphisms U → M_{G,b,μ,K} over Fl_{G,μ,F̆} to morphisms U^♦ → Sht_{G,b,μ,K} over Fl_{G,μ,F̆}^♦ (Scholze–Weinstein 10.4.2); and for every finite extension L of F̆, M_{G,b,μ,K}(L) = Sht_{G,b,μ,K}(Spd L), by full faithfulness of the diamond functor on seminormal rigid spaces (Scholze–Weinstein 10.2.3). |
| `Rigidification.transition` | For K′ ⊂ K: a finite étale morphism M_{G,b,μ,K′} → M_{G,b,μ,K} over Fl_{G,μ,F̆} of degree [K:K′], Galois with group K/K′ when K′ is normal in K; it is the identity for K′ = K and compatible with composition for K″ ⊂ K′ ⊂ K. |
| `Rigidification.heckeAction` | For g ∈ G(Q_p): an isomorphism M_{G,b,μ,K} ≅ M_{G,b,μ,gKg⁻¹} over Fl_{G,μ,F̆}, whose diamond is the isomorphism α ↦ α∘g⁻¹ of HS2.6, compatible with transition maps and with products in G(Q_p). |
| `Rigidification.framingAction` | J_b(Q_p) acts on M_{G,b,μ,K}, commuting with the Hecke action and the transition maps, and π_K is equivariant for the action of J_b(Q_p) ⊂ G(Q̆_p) ⊂ G(F̆) on Fl_{G,μ,F̆}. |
| `Rigidification.nonempty_iff` | M_{G,b,μ,K} ≠ ∅ if and only if [b] ∈ B(G,μ⁻¹). |
| `Rigidification.lubinTate` | For G = GL_n, μ = (1,0,…,0) and b basic with E_b ≅ O(1/n): M_{GL_n,b,μ,GL_n(Z_p)} is the generic fibre ∐_{h∈Z} D̊^{n−1} of the Lubin–Tate deformation space with quasi-isogeny, and π is the Gross–Hopkins period map onto P^{n−1}. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `Rigidification.lubin_tate_test` | For G = GL_2, μ = (1,0) and b the basic class with κ(b) = −1 (E_b ≅ O(1/2); b is the Frobenius of the covariant Dieudonné module of the formal group of height 2 and dimension 1 in the normalisation of Scholze–Weinstein, in which μ_{p^∞} has Frobenius p⁻¹σ): M_{GL_2,b,μ,GL_2(Z_p)} ≅ ∐_{h∈Z} D̊ with D̊ the open unit disc over Q̆_p; π: M → P¹_{Q̆_p} is surjective with every geometric fibre in bijection with GL_2(Q_p)/GL_2(Z_p); and for m ≥ 1 the map M_{GL_2,b,μ,1+p^mM_2(Z_p)} → M_{GL_2,b,μ,GL_2(Z_p)} is finite étale of degree p^{4(m−1)}(p²−1)(p²−p). |
| `Rigidification.orientation_test` | For G = GL_2, the same b (E_b ≅ O(1/2), κ(b) = −1) and the cocharacter μ⁻¹ = (0,−1) in place of μ = (1,0): the condition for (G, b, μ⁻¹) is [b] ∈ B(G,μ), which fails since κ(b) ≠ 1, and M_{GL_2,b,μ⁻¹,K} is empty for every K. |
| `Rigidification.torus_test` | For G = G_m, μ = id and b = p⁻¹: Fl_{G_m,μ} is a point, M_{G_m,b,μ,Z_p^×} ≅ ∐_Z Spa Q̆_p and M_{G_m,b,μ,1+p^mZ_p} ≅ ∐_Z Spa Q̆_p(ζ_{p^m}) for m ≥ 1; for p^m > 2 this is not the constant space (Q_p^×/(1+p^mZ_p)) × Spa Q̆_p. |
| `Rigidification.dimension_test` | For G = GL_n, μ = (1^d,0^{n−d}) and [b] ∈ B(G,μ⁻¹): M_{GL_n,b,μ,K} is smooth of pure dimension d(n−d) = ⟨2ρ,μ⟩ = dim Gr(d,n). |
| `Rigidification.nonminuscule_test` | For G = GL_2 and μ = (2,0): the Białynicki-Birula map Gr_μ → (P¹)^♦ has geometric fibres (A¹)^♦, and dim Gr_{≤μ} = ⟨2ρ,μ⟩ = 2 > 1 = dim Fl_{GL_2,μ}; statement (1) fails and the construction does not apply. |

<a id="hs2-11"></a>

### HS2.11 — Universal torsor and crystalline classical fibres

On the one-leg admissible locus over $\mathbb Q_p$, define
$\mathbb L_b$ by pairs $(x,\tau)$ with
$\tau:\mathcal E_1\simeq\mathcal E_x$. This is the universal
pro-étale $G(\mathbb Q_p)$-torsor and equals the infinite-level
tower; its $K$-quotients are the finite levels. Give the right
torsor action, its inverse left action on conjugate levels, and the
commuting $J_b(\mathbb Q_p)$-action. For every algebraic
$\mathbb Q_p$-representation $V$, the associated local system
is the one attached to $\mathcal E_x(V)$; this is an exact tensor
functor.

For a point over a finite extension $L/\breve F$, identify its fibre
with a conjugacy class of continuous crystalline
$\mathrm{Gal}(\overline L/L)\to G(\mathbb Q_p)$. Its isocrystal
is given by $b$. If the point lies in the cell of type
$\mu'\le\mu$, the Hodge filtration has type $(\mu')^{-1}$
and the Hodge–Tate filtration type $\mu'$. Boundary points need
not have type $\mu$. The torsor need not be globally trivial, or
trivial over a point defined over $L$.

**Prerequisites:** [HS2.5](#hs2-5), [HS2.6](#hs2-6); `PadicHodgeTheory:R06.2`; `DiamondsAndVStacks:D3`; `BunGAndNewtonStrata:BG2:uniformization`.

**Sources:** [GLX], §3.5, p. 828; §1.4, footnote 8, p. 812; [SW], proof of Proposition 23.3.3, p. 220; [HK], §7.2, after Definition 7.2.2, p. 42; proof of Theorem 7.2.3, p. 42.

**API:**

| Name | Required behavior |
| --- | --- |
| `admissiblePeriodTorsor` | 𝕃_b → Gr^a_{≤μ}: the sheaf of pairs (x, τ) with x a point of the admissible locus and τ: E_1 ≅ E_x a trivialisation of the modified bundle; a pro-étale G(Q_p)-torsor for the right action τ·g = τ∘g. |
| `admissiblePeriodTorsor.lift` | For every perfectoid S and x: S → Gr^a_{≤μ}, the sections of x^*𝕃_b over S are the isomorphisms E_1 ≅ E_x on X_S; a map S → Sht_{G,b,μ,∞} is the same as a pair (x, τ). |
| `admissiblePeriodTorsor.total_space` | 𝕃_b ≅ Sht_{G,b,μ,∞} over Gr^a_{≤μ}, equivariantly for G(Q_p) × J_b(Q_p), the projection being π_GM. |
| `admissiblePeriodTorsor.level_quotient` | 𝕃_b/K ≅ Sht_{G,b,μ,K} for K ⊂ G(Q_p) compact open, compatibly with transition maps, and 𝕃_b = lim_K 𝕃_b/K. |
| `admissiblePeriodTorsor.actions` | G(Q_p) acts on 𝕃_b on the right over Gr^a_{≤μ}, by τ·g = τ∘g; the associated left action g·τ = τ∘g⁻¹ is the one of HS2.6 (d) and induces 𝕃_b/K ≅ 𝕃_b/gKg⁻¹, while right translation by g induces 𝕃_b/K ≅ 𝕃_b/g⁻¹Kg. J_b(Q_p) acts on the left, covering its action on Gr^a_{≤μ}; the actions of the two groups commute. |
| `admissiblePeriodTorsor.localSystem` | V ↦ 𝕃_b ×^{G(Q_p)} V is an exact tensor functor from Rep_{Q_p}(G) to pro-étale Q_p-local systems on Gr^a_{≤μ}, with value at x the local system of global sections of E_x(V). |
| `admissiblePeriodTorsor.pushforward` | For f: G → H, the torsor 𝕃_b ×^{G(Q_p)} H(Q_p) is the pullback of 𝕃_{f(b)} along Gr^a_{G,≤μ} → Gr^a_{H,≤f∘μ}; compatible with composition of morphisms. |
| `admissiblePeriodTorsor.classical_point` | For L finite over F̆ and x ∈ Gr^a_{≤μ}(Spd L): x^*𝕃_b is the torsor of a crystalline ρ_x: Gal(L̄/L) → G(Q_p), with D_cris(V∘ρ_x) ≅ (V ⊗ Q̆_p, bσ) functorially in V and Hodge filtration BB(x). |
| `admissiblePeriodTorsor.torus` | For G = G_m, μ = id, b = p⁻¹: 𝕃_b is the torsor of bases of Q_p(1) over Spd Q̆_p, that is of non-zero sections of O(1) vanishing at the leg. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `admissiblePeriodTorsor.trivial_datum_test` | For μ = 0: Gr_{≤0} = Spd Q̆_p; for b = 1, 𝕃_1 = G(Q_p) × Spd Q̆_p with G(Q_p) acting by right translation and J_1(Q_p) = G(Q_p) by left translation; for [b] ≠ 1 the admissible locus and 𝕃_b are empty. |
| `admissiblePeriodTorsor.cyclotomic_test` | For G = G_m, μ = id and b = p⁻¹: Gr^a_{≤μ} = Spd Q̆_p, 𝕃_b ×^{Q_p^×} Q_p ≅ Q_p(1), the character of Gal(Q̄_p/Q̆_p) defined by 𝕃_b is the cyclotomic character, D_cris(Q_p(1)) = (Q̆_p, p⁻¹σ), and 𝕃_b/(1 + p^mZ_p) ≅ Z × Spd Q̆_p(ζ_{p^m}) for m ≥ 1. |
| `admissiblePeriodTorsor.tate_module_test` | For G = GL_n, μ = (1^d,0^{n−d}) and b the Frobenius of the covariant Dieudonné module of a p-divisible group X of dimension d and height n, in the normalisation of Scholze–Weinstein in which μ_{p^∞} has Frobenius p⁻¹σ: the pullback of 𝕃_b ×^{GL_n(Q_p)} Q_p^n to the generic fibre of the Rapoport–Zink space of X is the rational Tate module of the universal p-divisible group, and the lattice defining the map to Sht_{GL_n,b,μ,GL_n(Z_p)} is its Tate module. |
| `admissiblePeriodTorsor.level_test` | For K ⊂ G(Q_p) compact open the fibre of 𝕃_b/K = Sht_{G,b,μ,K} over a geometric point of Gr^a_{≤μ} is G(Q_p)/K, and pro-étale locally on S → Gr^a_{≤μ} the pullback of 𝕃_b/K is S × G(Q_p)/K. |
| `admissiblePeriodTorsor.boundary_test` | For G = GL_2, μ = (2,0) and b = p⁻¹·1: the closed stratum Gr_{(1,1)} = Spd Q̆_p lies in Gr^a_{≤μ}, and 𝕃_b restricts to it as the torsor of bases of Q_p(1)², of type μ′ = (1,1) in the sense of (4) and not of type μ = (2,0). |

<a id="hs2-12"></a>

### HS2.12 — Classical period points and weak admissibility

Use $\lambda=\mu^{-1}$ to state the comparison in the [GLX]
convention. Its Schubert cell is our cell of type $\mu$, and its
filtration variety uses the parabolic with
$\lim_{t\to0}\lambda(t)g\lambda(t)^{-1}$ defined. For every finite
extension $L/\breve F$, prove that Białynicki-Birula induces a
bijection between the cell's $\mathrm{Spd}L$-points and the flag
variety's $L$-points. For minuscule bounds this is an isomorphism
of diamonds; for general bounds only the classical-point assertion
holds.

Under $\kappa_G(b)=\lambda^\sharp=-\mu^\sharp$, restrict that
bijection to admissible cell points and weakly admissible filtrations,
where every algebraic representation gives a weakly admissible
filtered isocrystal $(V\otimes\breve{\mathbb Q}_p,b\sigma, \mathrm{Fil}_x)$. Retain the Kottwitz hypothesis: a norm-one torus
of a quadratic extension, zero cocharacter and its nontrivial
$B(T)=\mathbb Z/2$ class has a weakly admissible trivial filtration
and no admissible point. The comparison is for finite extensions of
$\breve F$, not for all geometric points of a non-minuscule flag
variety.

**Prerequisites:** [HS2.5](#hs2-5), [HS2.11](#hs2-11), [HS0.6](#hs0-6); `GeometricSatakeAndFusion:GS0:Schubert-smoothness`; `PadicHodgeTheory:R06.2`; `BunGAndNewtonStrata:BG1`.

**Sources:** [GLX], §3.6, p. 829; [SW], Proposition 19.4.2, pp. 176–177.

<a id="hs2-13"></a>

### HS2.13 — Adjoint-isomorphism comparison of period towers

Let $f:G\to H$ over $\mathbb Q_p$ map the centre to the centre
and induce an isomorphism of adjoint groups. For
$[b]\in B(G,\mu^{-1})$, put $b_H=f(b)$, $\mu_H=f\mu$,
with reflex field $F_H\subset F$. Prove that the bounded
Grassmannians are isomorphic after base change from
$\mathrm{Spd}\breve F_H$ to $\mathrm{Spd}\breve F$, and that
their admissible loci agree under this isomorphism. Extension of
structure group identifies the induced $H(\mathbb Q_p)$-torsor
$\mathrm{Sht}_{G,\infty}\times^{G(\mathbb Q_p)}H(\mathbb Q_p)$
with the base change of $\mathrm{Sht}_{H,\infty}$, equivariantly
for the target centralizers.

For compact open $K_H$, the level is the associated
$H(\mathbb Q_p)/K_H$-bundle; if the rational-point map is
surjective it is the quotient by $f^{-1}(K_H)$. Neither the reflex
base change nor the Kottwitz condition may be discarded. A torus map
to the trivial group can have empty source admissible locus and
nonempty target when that condition fails.

**Prerequisites:** [HS2.5](#hs2-5), [HS2.6](#hs2-6), [HS2.11](#hs2-11), [HS0.6](#hs0-6); `BunGAndNewtonStrata:BG1`; `GeometricSatakeAndFusion:GS0:loop-geometry`; `DiamondsAndVStacks:D4`; `BunGAndNewtonStrata:BG2:uniformization`.

**Sources:** [GLX], Definition 3.14, p. 829; Proposition 6.6(1), p. 849; proof of Proposition 6.6(1), Step 1, p. 850; proof of Proposition 6.6(1), Step 2, p. 850; proof of Proposition 6.6(1), Step 3, p. 850; §1, p. 807; repeated in Theorem 6.1, p. 845; proof of Proposition 6.7, p. 851.

<a id="hs2-14"></a>

### HS2.14 — Torus towers, products and determinant

Over $\mathbb Q_p$, the torus Grassmannian at a specified
cocharacter is $\mathrm{Spd}\breve F$. Its tower is empty unless
$\kappa_T(b)=-\mu^\sharp$; if this equality holds, its admissible
locus is the whole base and its infinite level is a pro-étale
$T(\mathbb Q_p)$-torsor. Over a complete algebraically closed
field this torsor is trivial, its components form a
$T(\mathbb Q_p)$-torsor, and level $K$ is the constant
$T(\mathbb Q_p)/K$-space.

For products and product levels, identify the tower with the product
of the factor towers after base change to the compositum of their
reflex fields, compatibly with actions and periods. For every group
morphism, give the tower map when $f(K)\subset K_H$, with its
reflex-base map and composition compatibilities. Apply it to
$G\to G^{\mathrm{ab}}$, proving that $K^{\mathrm{ab}}=\det(K)$
is compact open; it can be smaller than the maximal compact subgroup.
The product, morphism and determinant statements impose no
nonemptiness hypothesis on $b$.

**Prerequisites:** [HS2.6](#hs2-6), [HS0.6](#hs0-6), [HS2.11](#hs2-11), [HS2.5](#hs2-5); `BunGAndNewtonStrata:BG1`; `ReductiveGroupsPartII:RG2.0`.

**Sources:** [GLX], Proposition 6.4, p. 848; Proposition 6.4(2) and the paragraph after it, pp. 848–849; §3.4, ¶8, (3.6), p. 824; §3.4, (3.7), p. 824; Lemma 3.6, p. 824.

<a id="hs2-15"></a>

### HS2.15 — Nonemptiness, connectedness and density

For reductive $G/\mathbb Q_p$ and arbitrary $\mu$, prove that
the open Schubert cell and its closure have nonempty admissible loci
exactly when $[b]\in B(G,\mu^{-1})$. Under that condition the
admissible cell contains a point over a finite extension of
$\breve F$. After every complete algebraically closed extension
$C/\breve F$, the admissible cell is connected, and the admissible
locus in the bounded Grassmannian is connected and dense in it.

Use the corrected HN dimension estimates and unipotent fibre theorem
from `BG3`, and the connectedness and separate density contracts above.
For non-minuscule bounds, existence of a weakly admissible filtration
of prescribed type is an additional supplier theorem; the criterion
for a given filtered module is not enough. For minuscule bounds use
the supplier's sign-corrected modification-image theorem and the
rigid flag variety. [HK] treats connected linear groups more generally;
this target uses its reductive case only.

**Prerequisites:** [HS2.5](#hs2-5), [HS2.12](#hs2-12), [HS2.13](#hs2-13), [HS0.6](#hs0-6); `BunGAndNewtonStrata:BG1`; `BunGAndNewtonStrata:BG3`; `BunGAndNewtonStrata:BG2:smooth-Artin`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness`; `GeometricSatakeAndFusion:GS0:loop-geometry`; `BunGAndNewtonStrata:BG2:uniformization`.

**Sources:** [HK], Proposition 7.3.3, p. 43; proof of Proposition 7.3.3, p. 43; Proposition 7.3.4 and its proof, pp. 43–44; [GL], Theorem 1.1, p. 3; Theorem 3.1, p. 10; proof of Theorem 3.2, p. 10; Introduction, p. 4; Lemma 3.3, p. 12; [SW], Definition 24.1.1, p. 225.

<a id="hs2-16"></a>

### HS2.16 — Connected components and transitivity

Prove the topological lemma that a profinite group acting continuously
on a space with connected quotient acts transitively on its connected
components. Consequently $\pi_0(A)/K\to\pi_0(A/K)$ is bijective
for continuous profinite actions. For a locally profinite $H$,
prove the transitivity conclusion when $A/H$ is connected and,
for some compact open $K\subset H$, all components of $A/K$
are open.

Apply this to the nonempty one-leg tower over $\mathbb Q_p$ after
algebraically closed base change. For every $K$, finite-level
components are infinite-level components modulo $K$. For
minuscule $\mu$, prove transitivity of $G(\mathbb Q_p)$ on
infinite-level components using the rigid finite levels. For arbitrary
$\mu$, retain the hypothesis that components of one finite level
are open. The continuous translation action of $\mathbb Z$ on
$\mathbb Z_p\times\mathrm{Spa}C$ has connected quotient and is
not transitive on its components, so connectedness of the quotient
alone does not suffice for a locally profinite group.

**Prerequisites:** [HS2.15](#hs2-15), [HS2.6](#hs2-6), [HS2.10](#hs2-10), [HS2.11](#hs2-11); `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D4`; `DiamondsAndVStacks:D5`.

**Sources:** [GLX], Proposition 3.12, p. 828; proof of Proposition 3.12, p. 828; Lemma 3.2, p. 820; Theorem 3.11, p. 828; Theorem 3.9, p. 826; [SW], 24.1, after Proposition 24.1.2, p. 225.

<a id="hs2-17"></a>

### HS2.17 — Compactifiable structure maps

Factor each level structure map as its separated étale period map
followed by the proper spatial bounded twisted Grassmannian projection.
The latter has finite `dim.trg` on quasicompact opens of the leg base.
Prove that the composite is separated, representable in locally spatial
diamonds, compactifiable, and of locally finite `dim.trg`. These are
the geometric hypotheses needed for relative homology/compact-support
comparisons and torsion exceptional functors. Neither quasicompactness
nor properness of the level map follows.

Give the theorem for $\mathbb Q_p$-model towers and for general
local-field towers. For arbitrary two-bundle spaces, quotient by a
compact open subgroup of the target $J$-group and prove locally
spatial representability, compactifiability and locally finite
`dim.trg` over the divisor base; inversion gives the same assertions
for source levels. These two-bundle and dimension assertions are
consequences of the imported geometry to prove here.

**Prerequisites:** [HS2.7](#hs2-7), [HS2.6](#hs2-6), [HS0.5](#hs0-5), [HS0.3](#hs0-3), [HS2.9](#hs2-9), [HS2.2](#hs2-2); `DiamondSixOperations:S0`; `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D5`; `BunGAndNewtonStrata:BG3`; `BunGAndNewtonStrata:BG2:uniformization`; `VectorBundlesAndIsocrystals:VB1`.

**Sources:** [SW], Corollary 23.5.3, p. 224; Proposition 23.5.2, p. 223; [FS], VII.5, p. 264; IX.3, p. 326.

<a id="hs2-18"></a>

### HS2.18 — Weil descent datum of one-leg towers

For general $E$ and one leg, let $f$ be the residue degree of
$F/E$. Define $\varphi_F$ on $\mathrm{Spd}\breve F$ by
the Frobenius of the $\mathrm{Spd}F$ factor; it keeps the untilt
and changes its tilt identification by $\mathrm{Frob}_S^{-f}$.
It is absolute $q_F$-Frobenius composed with $\sigma_F^{-1}$.
The map to $\mathrm{Div}^1_F$ is a $\mathbb Z$-torsor.
Identify the one-leg tower with the pullback of its framed
modification quotient $M_K$ on that divisor base. Construct
$\psi_K=\mathrm{id}\times\varphi_F$ and the cocycle of all its
powers, commuting with levels and both group actions. The equivalent
isomorphism $w_K:\varphi_F^*\mathrm{Sht}_K\simeq\mathrm{Sht}_K$
corresponds to $\psi_K^{-1}$ after projection; retain this inverse
in formulas.

Prove period compatibility: on the Grassmannian the automorphism is
the canonical base Frobenius followed by translation by
$b_f=b\sigma(b)\cdots\sigma^{f-1}(b)$, evaluated through the
new base point's algebra structure. Its inverse first translates by
$b_f^{-1}$ and then applies inverse base Frobenius. A descent
datum need not be effective over $\mathrm{Spd}F$. Over a complete
algebraic closure $C/F$, the Weil torsor action is
$\tau\circ\mathrm{Frob}^{-\deg\tau}$; it supplies the commuting
$W_F$-action on geometric levels. For several legs the comparison
with the ordinary modification quotient holds off the nontrivial
Frobenius diagonals only, and does not give descent of the entire
shtuka space along the product of divisor quotients.

**Prerequisites:** [HS2.9](#hs2-9), [HS2.2](#hs2-2), [HS2.6](#hs2-6), [HS2.10](#hs2-10); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`; `RelativeFarguesFontaine:RF2:untilts`; `VectorBundlesAndIsocrystals:VB3:positive-basic-examples`; `VStackSheavesAndLisseCategories:VS1`.

**Sources:** [FS], IX.3, before Theorem IX.3.1, p. 324; IX.3, proof of Proposition IX.3.2, pp. 326–327; IV.7, before Proposition IV.7.1, p. 164; Corollary II.2.4, p. 61; [SW], Proposition 23.3.1 and its proof, p. 218.

**API:**

| Name | Required behavior |
| --- | --- |
| `WeilDescent.modificationSpace` | M_{(G,b,μ),K} → Spd F̆/φ_F^Z: the sheaf of triples (D, α, 𝒫) with D a point of Spd F̆/φ_F^Z, viewed as a degree-one Cartier divisor of X_S, α: E ≅ E_b a modification at D bounded by μ with E trivial at geometric points, and 𝒫 a K-lattice in Isom(E_1, E). |
| `WeilDescent.pullback` | Sht_{(G,b,μ),K} ≅ M_{(G,b,μ),K} ×_{Spd F̆/φ_F^Z} Spd F̆ over Spd F̆, compatibly with transition maps, with G(E) and with J_b(E). |
| `WeilDescent.datum` | The automorphism ψ_K = id × φ_F of Sht_{(G,b,μ),K}, covering φ_F, with ψ_K^n = id × φ_F^n for n ∈ Z; equivalently the isomorphisms w_K^{(n)}: (φ_F^n)^*Sht_{(G,b,μ),K} ≅ Sht_{(G,b,μ),K} over Spd F̆ with inverse y ↦ (ψ_K^n(y), f_K(y)), which satisfy w_K^{(m+n)} = w_K^{(m)} ∘ (φ_F^m)^*w_K^{(n)}; w_K = w_K^{(1)}. |
| `WeilDescent.datum_natural` | w_K commutes with the transition maps Sht_{(G,b,μ),K′} → Sht_{(G,b,μ),K}, with the isomorphisms induced by g ∈ G(E), and with the action of J_b(E). |
| `WeilDescent.datum_period` | π_K ∘ ψ_K = ψ_Gr ∘ π_K and π_K ∘ w_K = w_Gr ∘ φ_F^*π_K, where ψ_Gr is the automorphism of Gr_{G,Spd F̆,≤μ} covering φ_F induced by the Frobenius structure of E_b and w_Gr the corresponding isomorphism φ_F^*Gr_{G,Spd F̆,≤μ} ≅ Gr_{G,Spd F̆,≤μ}: ψ_Gr is the canonical automorphism (x, Λ) ↦ (φ_F(x), Λ) followed by left multiplication by b_f = b·σ(b)⋯σ^{f−1}(b), f the residue degree of F over E, through the F̆-algebra structure of φ_F(x). For F = E this is left multiplication by b after the canonical automorphism; for b = 1 it is the canonical one. |
| `WeilDescent.weilAction` | An action of W_F on Sht_{(G,b,μ),K} ×_{Spd F̆} Spd C covering the action τ ↦ τ∘Frob^{−deg τ} on Spd C; the inertia subgroup acts through its action on C; the action commutes with G(E) × J_b(E) and with transition maps. |
| `WeilDescent.rigid` | For E = Q_p and μ minuscule, let τ = σ_F⁻¹ be the automorphism of F̆ over F inverse to the lift of the q_F-Frobenius of k, so that φ_F is the composite of τ^♦ with the absolute q_F-Frobenius of Spd F̆ and pullbacks along φ_F and along τ^♦ are canonically identified. Then w_K is the diamond of a unique isomorphism τ^*M_{G,b,μ,K} ≅ M_{G,b,μ,K} of rigid spaces over F̆, lying over the isomorphism τ^*Fl_{G,μ,F̆} ≅ Fl_{G,μ,F̆} that corresponds to w_Gr under the Białynicki-Birula isomorphism. |
| `WeilDescent.lubinTate` | For G = G_m, μ = id, b = π⁻¹: M_{(G_m,b,μ),∞} = BC(O(1)) ∖ {0} ≅ Spd Ĕ_∞, on which O_E^× acts through the Lubin–Tate action and π as the Frobenius (Fargues–Scholze II.2.4). |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `WeilDescent.lubin_tate_test` | For G = G_m, μ = id and b = π⁻¹ (so F = E): M_{(G_m,b,μ),∞} ≅ Spd Ĕ_∞ has a single point, Sht_{(G_m,b,μ),∞} ≅ Z × Spd Ĕ_∞, the component of index m consisting of the pairs (s, x) of a point s of Spd Ĕ_∞ and a point x of Spd Ĕ with x = φ^m(p(s)), where p: Spd Ĕ_∞ → Spd Ĕ is the projection; ψ_K^n = id × φ^n maps the component of index m onto the component of index m + n; so the descent datum acts simply transitively on π₀(Sht_{(G_m,b,μ),O_E^×}) = Z. |
| `WeilDescent.not_effective_test` | In the same example there is no v-sheaf Y over Spd E with Y ×_{Spd E} Spd Ĕ ≅ Sht_{(G_m,b,μ),O_E^×} compatibly with w: a continuous action of the profinite group Gal(k/F_q) on the discrete set Z has finite orbits. The quotient Sht_{(G_m,b,μ),O_E^×}/π^Z by π ∈ J_b(E) is Spd Ĕ with w = φ, which descends to Spd E. |
| `WeilDescent.trivial_datum_test` | For μ = 0 and b = 1 (so F = E): M_{(G,1,0),K} = G(E)/K × Spd Ĕ/φ^Z, Sht_{(G,1,0),K} = G(E)/K × Spd Ĕ, the descent datum is id × φ and is effective with descent G(E)/K × Spd E, and W_E acts on Sht_{(G,1,0),K} × Spd C through Spd C only. |
| `WeilDescent.reciprocity_test` | For G = G_m, μ = id and b = π⁻¹, W_E acts on the E^×-torsor π₀(Sht_{(G_m,b,μ),∞} ×_{Spd Ĕ} Spd C) through a continuous homomorphism W_E → E^× which is the reciprocity isomorphism W_E^{ab} ≅ E^× of local class field theory, up to the normalisation τ ↦ τ^{±1}: inertia acts through the Lubin–Tate character onto O_E^× and an element of degree 1 by an element of valuation ±1. |

## HS3 — Cohomology and smooth representations

Use the solid kernel to define completed compact support, identify it with the Hecke action, and deduce compactness and adjunctions with their level and coefficient hypotheses. Classical spaces are imported through the independent deformation-theoretic interfaces.

<a id="hs3-1"></a>

### HS3.1 — Twisted Satake coefficients and partial Frobenii

For $W=\boxtimes_i V_{\mu_i}$, extend the Satake sheaf from the
locus without nontrivial Frobenius collisions to the twisted bounded
Grassmannian. Construct its flat perverse ULA extension, uniquely
among flat perverse ULA extensions with that restriction. On a
twisted convolution chart it is the pullback of the twisted exterior
product. Uniqueness among all ULA objects is not the assertion.
Pull it back along each étale period map to obtain $S_W$ on
$\mathrm{Sht}_K$, and put $S'_W=\mathbb D(S_W)^\vee$.
Give target-group equivariance and compatibility with level pullback.
For one minuscule leg, normalize
$S_W=\Lambda[d](d/2)$ and $S'_W=\Lambda[-d](-d/2)$.

If $F_i\ne E$, use the highest-weight representation of
$\widehat G\rtimes W_{F_i}$, not a nonexistent invariant weight
for $W_E$. Its kernel is the idempotent summand of the pullback
of the kernel of its induced representation; the restriction of
representations must act functorially on sheaf endomorphisms. Half
twists use $r^{f_i}$. Define a system of partial Frobenii as a
coherent action of $\prod_i\varphi_i^{\mathbb Z}$, including
pairwise commutation and higher coherences. Descent identifies such
objects with sheaves over $\prod_i\mathrm{Div}^1_{F_i}$.
Continuous Weil equivariance requires that the descended object lie
in the lisse equivariant subcategory; the cohomology comparison
below proves this for $C_K$.

**Prerequisites:** [HS0.5](#hs0-5), [HS2.9](#hs2-9), [HS1.9](#hs1-9), [HS2.7](#hs2-7), [HS1.1](#hs1-1); `GeometricSatakeAndFusion:GS3:fusion`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness`; `DiamondSixOperations:S3`; `GeometricSatakeAndFusion:GS4:integral-dual-group`.

**Sources:** [FS], IX.3, paragraph before Proposition IX.3.2, p. 326; Proposition IX.3.2, p. 326; [SW], Definition 23.4.1, p. 221.

**API:**

| Name | Required behavior |
| --- | --- |
| `satakeCoefficient` | S_W on Gr^tw_{G,∏_iSpd F̆_i,≤μ•}: the unique flat perverse universally locally acyclic extension of the Satake sheaf of W=⊠_iV_{μ_i} from the complement of the Frobenius-twisted partial diagonals. |
| `satakeCoefficient.restrict_offDiagonal` | On the complement of the twisted diagonals S_W is the Beilinson–Drinfeld Satake sheaf of W; restriction to this locus is fully faithful on flat perverse universally locally acyclic sheaves on Gr^tw, so S_W is determined by its restriction. |
| `satakeCoefficient.convolutionChart` | On the chart around the diagonal twisted by φ^m, m≠0, S_W is the pullback under the partial Frobenius of the twisted external product of the S_{V_{μ_i}} on the convolution Schubert variety. |
| `satakeCoefficient.oneLeg` | For I a singleton, Gr^tw=Gr_{G,Spd F̆,≤μ} and S_W=S_{V_μ}; for minuscule μ, S_W=Λ[d](d/2) with d=⟨2ρ,μ⟩. |
| `satakeCoefficient.map` | For fixed μ•, an endomorphism of the representation W=⊠_iV_{μ_i} of ∏_i(Ĝ⋊W_{F_i}) induces an endomorphism of S_W on Gr^tw_{≤μ•}, compatibly with identities and composition: it acts on the Satake sheaf off the twisted diagonals and extends uniquely by the full faithfulness of the restriction. Maps between representations with different bounds are not defined here, since S_W is constructed only for exterior tensor products of highest-weight representations, on the Schubert variety of their bounds. |
| `shtukaKernel` | S′_W=D(π_K^*S_W)^∨ on Sht_{G,b,μ•,K}, D relative to ∏_iSpd F̆_i, ^∨ the solid dual. |
| `shtukaKernel.level` | For K′≤K with π:Sht_{K′}→Sht_K one has π^*S′_{W,K}=S′_{W,K′}, compatibly with composition of level maps and with the action of J_b(E). |
| `shtukaKernel.minuscule` | For one minuscule leg S′_W=Λ[−d](−d/2), d=⟨2ρ,μ⟩. |
| `shtukaKernel.unit` | For W trivial, S_W=S′_W=Λ. |
| `shtukaKernel.torsion` | If ℓ^nΛ=0 then f_{K♮}(S′_W⊗B)≃Rf_{K!}(S_W⊗B) for B∈D_ét(Sht_K,Λ) (FS VII.5.2), so S′_W is the kernel whose relative homology is compactly supported cohomology with coefficients S_W. |
| `PartialFrobenius` | For A∈D_■(X×∏_iSpd F̆_i,Λ): an action of ∏_iφ_i^Z on A covering the action on the base, i.e. isomorphisms F_i:φ_i^*A≃A commuting up to the coherences of a group action. |
| `PartialFrobenius.descent` | Objects with partial Frobenii are equivalent, by pullback, to objects of D_■(X×∏_iSpd F̆_i/φ_i^Z,Λ). |
| `PartialFrobenius.weil` | D_lis(X,Λ)^{B∏_iW_{F_i}} is a full subcategory of D_■(X×∏_iSpd F̆_i/φ_i^Z,Λ) (HS1.9); objects in it are those with a continuous ∏_iW_{F_i}-action. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `shtukaKernel.minuscule_test` | G=GL_n over Q_p, one leg, μ=(1,0,…,0): Gr_{≤μ} is the diamond of P^{n−1} over Spd Q̆_p, d=n−1, S_W=Λ[n−1]((n−1)/2), its relative Verdier dual is again Λ[n−1]((n−1)/2), and S′_W=Λ[1−n]((1−n)/2). For n=1 both are Λ. |
| `satakeCoefficient.torus_test` | G=T a torus, any finite I and μ•: Gr^tw_{T,≤μ•}→∏_iSpd F̆_i is an isomorphism and S_W=S′_W=Λ in degree 0 on the whole base, including the Frobenius-twisted diagonals. |
| `satakeCoefficient.twisted_diagonal_test` | G=GL_2 over Q_p, μ_1=(1,0), μ_2=(0,−1). Over a geometric point with S_1♯=φ^m(S_2♯), m≠0, the fibre of Gr^tw_{≤μ•} is the convolution variety of Gr_{μ_1} and Gr_{μ_2}, a P¹-bundle over P¹, and S_W restricts to Λ[2](1). Over a point of the diagonal S_1♯=S_2♯ the fibre is the singular Schubert variety Gr_{≤(1,−1)} and S_W restricts to Rm_*(Λ[2](1)), m the convolution map, whose stalk at the point Gr_{(0,0)} is RΓ(P¹,Λ)[2](1), of total rank 2. |
| `satakeCoefficient.one_leg_test` | For I a singleton there are no twisted diagonals, Gr^tw is the Schubert variety Gr_{G,Spd F̆,≤μ} and S_W is the Satake sheaf of V_μ, with no extension step. |
| `PartialFrobenius.descent_test` | For X a point and I a singleton, the partial Frobenius structures on A=Λ over Spd F̆ are the isomorphisms F=u·id with u∈Λ^×; F=id descends to the constant sheaf on Spd F̆/φ^Z, and for u≠1 the descended rank-one object is not constant. For I={1,2} a pair (F_1,F_2) with F_1∘φ_1^*(F_2)≠F_2∘φ_2^*(F_1) is not a system of partial Frobenii. |

<a id="hs3-2"></a>

### HS3.2 — Completed compact support and tower complexes

For any compact open level, define $C_K=f_{K\natural}S'_W$ over
$[*/J_b(E)]$ times the product of reflex bases. The coefficient
sheaf is ULA of bounded Tor-amplitude. If $\ell^n\Lambda=0$,
prove $C_K\simeq Rf_{K!}S_W$. For every coefficient map give
$C_{K,\Lambda}\otimes^{L\blacksquare}_\Lambda\Lambda' \simeq C_{K,\Lambda'}$. Rational coefficients are obtained by
inverting $\ell$ in the completed integral object.

Specify classical compact support by
$R\Gamma_c(M,\mathbb Z_\ell)= \operatorname{colim}_{U}\,R\!\lim_mR\Gamma_c(U,\mathbb Z/\ell^m)$
over quasicompact opens. Complete at each open before extending
coefficients and taking the open-exhaustion colimit. Inverting
$\ell$ in the torsion system before completing gives zero.
For one minuscule leg over $\mathbb Q_p$, the classical
comparison identifies the geometric fibre of $C_K$ with
$R\Gamma_c(M_{K,C},\Lambda)[d](d/2)$.

Finite étale transitions give trace and pullback through their two
adjunctions. Define $C_\infty=\operatorname{colim}_K C_K$ along
pullback, with commuting source and target actions. The source
action is smooth: each image from level $K$ is fixed by $K$.
For pro-$p$ $K$, prove $C_K\simeq C_\infty^K$ using
averaging idempotents at normal refinements. This is not an inverse
limit along traces. The smoothness of the target action follows
from its lisse Hecke realization below.

**Prerequisites:** [HS2.6](#hs2-6), [HS1.2](#hs1-2), [HS3.1](#hs3-1), [HS1.10](#hs1-10), [HS2.17](#hs2-17), [HS2.10](#hs2-10), [HS2.9](#hs2-9); `ClassicalAdicEtaleCohomology:H3`; `AdicCoefficientsAndComparisons:L0`; `EnhancedDerivedSheaves:E5:abstract`; `VStackSheavesAndLisseCategories:VS2`; `DiamondSixOperations:S5`; `DiamondSixOperations:S4`; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`; `SmoothRepresentationsOfLocalGroups:SR.1`.

**Sources:** [FS], IX.3, definition before Theorem IX.3.1, p. 324; IX.3, paragraph before Proposition IX.3.2, p. 326; Proposition VII.5.2, p. 265; Proof of Theorem IX.3.1, p. 324.

**API:**

| Name | Required behavior |
| --- | --- |
| `compactSupportAtLevel` | C_K=f_{K♮}S′_W∈D_■([*/J_b(E)]×∏_iSpd F̆_i,Λ) for f_K:Sht_{G,b,μ•,K}→∏_iSpd F̆_i and S′_W=D(S_W)^∨. |
| `compactSupportAtLevel.torsion` | If ℓ^nΛ=0 then C_K≃Rf_{K!}S_W; more generally f_{K♮}(S′_W⊗B)≃Rf_{K!}(S_W⊗B) for B∈D_ét(Sht_K,Λ) (FS VII.5.2). |
| `compactSupportAtLevel.baseChange` | For a map Λ→Λ′ of Z_ℓ[r]-algebras, C_{K,Λ}⊗^{L■}_ΛΛ′≃C_{K,Λ′}. |
| `huberCompactSupport` | For a partially proper rigid space M over C: RΓ_c(M,Z_ℓ)=colim_U Rlim_m RΓ_c(U,Z/ℓ^m) over quasicompact opens U, and RΓ_c(M,Λ)=RΓ_c(M,Z_ℓ)⊗^L_{Z_ℓ}Λ. |
| `huberCompactSupport.torsion` | RΓ_c(M,Z_ℓ)⊗^L Z/ℓ^n≃colim_U RΓ_c(U,Z/ℓ^n), the compactly supported cohomology of M with Z/ℓ^n-coefficients. |
| `compactSupportAtLevel.minuscule` | For one minuscule leg over Q_p, C_K=f_{K♮}Λ[−d](−d/2), and its geometric fibre is RΓ_c(M_{K,C},Λ)[d](d/2), d=⟨2ρ,μ⟩ (the second identification is the statement of HS3.3, which rests on this node). |
| `compactSupportAtLevel.tr` | For K′≤K, tr_{K′,K}:C_{K′}→C_K, with tr_{K,K}=id and tr_{K′,K}∘tr_{K″,K′}=tr_{K″,K}. |
| `compactSupportAtLevel.pull` | For K′≤K, pull_{K,K′}:C_K→C_{K′}, with pull_{K,K}=id and pull_{K′,K″}∘pull_{K,K′}=pull_{K,K″}. |
| `compactSupportAtLevel.actions` | J_b(E) acts on Sht_K over ∏_iSpd F̆_i, so C_K lives over [*/J_b(E)]; tr and pull are J_b(E)-equivariant; g∈G(E) induces C_K≃C_{gKg⁻¹} compatibly with tr and pull. |
| `towerCompactSupport` | C_∞=colim_K C_K along pull, over compact open K (equivalently over open pro-p K), with its commuting smooth actions of G(E) and J_b(E). |
| `towerCompactSupport.invariants` | For K open pro-p the canonical map C_K→C_∞ identifies C_K with (C_∞)^K, the colimit over the open normal subgroups K′ of K of the summands e_{K/K′}C_{K′}, e_{K/K′}=[K:K′]⁻¹Σ_{γ∈K/K′}γ^*. |
| `compactSupportAtLevel.hecke` | C_K is the pullback to ∏_iSpd F̆_i of i^{b*}T_W(j_!c-Ind_K^{G(E)}Λ) (proved in HS3.4, which rests on this node). |
| `compactSupportAtLevel.torus` | For G=T a torus over Q_p, one leg μ and b the class with κ(b)=−μ^♮, the geometric fibre of C_K is c-Ind_K^{T(Q_p)}Λ in degree 0; for every other class b the tower is empty and C_K=0. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `compactSupportAtLevel.torus_test` | E=Q_p, G=T a torus, one leg μ∈X_*(T), b with κ(b)=−μ^♮ (the class for which the tower is nonempty), K⊂T(Q_p) compact open: the geometric fibre of Sht_{T,b,μ,K} is the discrete set T(Q_p)/K, d=0, S′_W=Λ, and the geometric fibre of C_K is Λ[T(Q_p)/K]=c-Ind_K^{T(Q_p)}Λ in degree 0, the finitely supported functions on T(Q_p)/K with J_b(Q_p)=T(Q_p) acting by translation; it is not the module of all functions on T(Q_p)/K. |
| `compactSupportAtLevel.trivial_leg_test` | E=Q_p, one leg with μ=0: for b=1, Sht_{G,1,0,K}=G(Q_p)/K×Spd Q̆_p and C_K=Λ[G(Q_p)/K]=c-Ind_K^{G(Q_p)}Λ in degree 0, constant along Spd Q̆_p, with J_1(Q_p)=G(Q_p) acting by left translation; for [b]≠1 the space is empty and C_K=0. |
| `compactSupportAtLevel.lubin_tate_test` | G=GL_2 over Q_p, μ=(1,0), b basic with κ(b)=−1, K=GL_2(Z_p): M_{K,C} is a disjoint union, indexed by Z, of open unit discs and d=1. Then RΓ_c(M_{K,C},Z_ℓ)=⊕_Z Z_ℓ(−1)[−2], f_{K♮}Z_ℓ=⊕_Z Z_ℓ in degree 0, and the geometric fibre of C_K is ⊕_Z Λ(−1/2)[−1]; as a representation of J_b(Q_p)=D^× (D the quaternion division algebra) it is c-Ind_{O_D^×}^{D^×}Λ(−1/2)[−1]. |
| `compactSupportAtLevel.completion_order_test` | G=G_m over Q_p, μ(z)=z, b with κ(b)=−1, K=Z_p^×, Λ=Z_ℓ[r]: the geometric fibre of C_K is ⊕_Z Λ. It is not the ℓ-adic completion of ⊕_Z Λ, which is what the limit over m taken after the colimit over U gives and which contains Σ_{n≥0}ℓ^nδ_n; and C_K for the coefficient ring Λ[1/ℓ] is ⊕_Z Λ[1/ℓ], not 0, which is what inverting ℓ before the limit over m gives. |
| `compactSupportAtLevel.torsion_test` | For Λ=Z/ℓ^n[r] and one minuscule leg over Q_p: C_K=Rf_{K!}(Λ[d](d/2)), whose geometric fibre is RΓ_c(M_{K,C},Λ)[d](d/2); it is not RΓ_c(M_{K,C},Λ)[3d](3d/2), which is what f_{K♮} applied to S_W instead of S′_W gives. |
| `towerCompactSupport.regular_test` | E=Q_p, b=1, one leg with μ=0: pull sends 1_{gK} to Σ_{k∈K/K′}1_{gkK′} and tr sends 1_{gK′} to 1_{gK}; C_∞ is the space C_c^∞(G(Q_p),Λ) of locally constant compactly supported functions with G(Q_p)×G(Q_p) acting by left and right translation, and (C_∞)^K=Λ[G(Q_p)/K]=C_K. The inverse limit of the Λ[G(Q_p)/K] along tr is not a smooth representation: for G(Q_p) replaced by an infinite compact open subgroup it is the completed group algebra, in which the Dirac measure at 1 is fixed by no open subgroup. |

<a id="hs3-3"></a>

### HS3.3 — Classical compact support and the dimension shift

Take a minuscule nonempty datum over $\mathbb Q_p$, its smooth
partially proper rigid $M_K$, completed algebraic closure
$C/\breve F$, and dimension $d$. For every quasicompact open
$j:U\hookrightarrow M_{K,C}$ and every $m\ge1$, prove that
classical $R\Gamma_c(U,\mathbb Z/\ell^m)$ agrees with the diamond
$Rf_{K!}(j_!\mathbb Z/\ell^m)$. Require compatibility in the open,
the coefficient exponent and finite étale trace. Prove the compatible
dualizing comparison $Rf_K^!\mathbb Z/\ell^m \simeq\mathbb Z/\ell^m[2d](d)$.

Deduce $f_{K\natural}\mathbb Z_\ell\simeq R\Gamma_c(M_{K,C},\mathbb Z_\ell)[2d](d)$, and the corresponding
formula after derived extension to $\Lambda$. The identifications
are equivariant for $J_b(\mathbb Q_p)$ and $W_F$, and commute
with level trace and pullback. This comparison depends on the
compactification and dualizing contracts as well as the equivalence
of étale sites.

**Prerequisites:** [HS2.10](#hs2-10), [HS3.2](#hs3-2), [HS2.18](#hs2-18); `DiamondsAndVStacks:D6`; `ClassicalAdicEtaleCohomology:H3`; `DiamondSixOperations:S3`; `DiamondSixOperations:S1`; `AdicCoefficientsAndComparisons:L0`; `DiamondSixOperations:S5`; `DiamondSixOperations:S4`.

**Sources:** [FS], IX.3, before Theorem IX.3.1, p. 324; Proof of Theorem IX.3.1, p. 324; [SW], Theorem 10.4.2, p. 81; 24.1, after Proposition 24.1.2, p. 225.

<a id="hs3-4"></a>

### HS3.4 — Hecke action realizes shtuka cohomology

Let $j:\mathrm{Bun}_G^1=[*/G(E)]\hookrightarrow\mathrm{Bun}_G$
and $i^b$ be the target stratum. Use its lisse equivalence with
$D(J_b(E),\Lambda)$, including the vanishing of the positive
Banach–Colmez automorphism kernel for nonbasic $b$. Prove that
the pullback to the reflex bases of
$i^{b*}T_W(j_!\operatorname{c-Ind}_K^{G(E)}\Lambda)$ is $C_K$.
When weights have larger reflex fields, $T_W$ means the
idempotent summand of the restriction of the induced Hecke operators,
as specified in the coefficient construction.

The comparison is equivariant for both group actions and carries
the compact-induction level maps to cohomological trace and pullback.
It endows $C_K$ with partial Frobenii and descent whose geometric
fibre is a smooth $J_b(E)$-representation complex with a continuous
$\prod_iW_{F_i}$-action. Construct the map from the shtuka tower
to the ordinary Hecke-fibre quotient: off nontrivial Frobenius
diagonals it is an isomorphism, while on a collision it forgets
intermediate modifications and is convolution on the period charts.
Use the kernel's convolution comparison to obtain the cohomological
identification across those loci. For one minuscule leg the kernel
is $\Lambda[-d](-d/2)$, giving the classical normalization
$R\Gamma_c(M_{K,C},\Lambda)[d](d/2)$ over $\mathbb Q_p$.

**Prerequisites:** [HS2.4](#hs2-4), [HS3.1](#hs3-1), [HS1.2](#hs1-2), [HS3.2](#hs3-2), [HS2.7](#hs2-7), [HS2.9](#hs2-9), [HS2.6](#hs2-6), [HS1.9](#hs1-9), [HS2.2](#hs2-2), [HS3.3](#hs3-3); `VStackSheavesAndLisseCategories:VS4`; `SmoothRepresentationsOfLocalGroups:SR.2`; `GeometricSatakeAndFusion:GS3:fusion`; `VStackSheavesAndLisseCategories:VS2`.

**Sources:** [FS], Proof of Proposition IX.3.2, p. 326; Proof of Proposition IX.3.2, p. 327; Proof of Theorem IX.3.1, p. 324; IX.7.3, proof of Theorem IX.7.4, p. 338; [SW], Proposition 23.3.1, p. 218.

<a id="hs3-5"></a>

### HS3.5 — Local Shimura cohomology: smoothness and finiteness

For a nonempty minuscule datum over $\mathbb Q_p$, prove that
$R\Gamma_c(M_{K,C},\mathbb Z_\ell)$ is a smooth
$J_b(\mathbb Q_p)$-representation complex with continuous
condensed $W_F$-action for every compact open $K$. For
pro-$p$ $K$, prove compactness in
$D(J_b(\mathbb Q_p),\mathbb Z_\ell)$, equivalently membership
in the thick subcategory generated by compact inductions from
open pro-$p$ subgroups. For all compact open levels, prove finite
generation of each smooth cohomology representation, using the
integral noetherian Hecke-algebra theorem and Hochschild–Serre from
an open normal pro-$p$ refinement.

The pro-$p$ condition cannot be removed from compactness. For
$G=\mathbb G_m$, $\mu=1$, $K=\mathbb Z_p^\times$, and
$\ell\mid p-1$, the degree-zero complex is
$\operatorname{c-Ind}_{\mathbb Z_p^\times}^{\mathbb Q_p^\times} \mathbb Z_\ell$, which is not compact. Nor does compactness
give finite $\mathbb Z_\ell$-rank: these compact inductions
have infinite rank when the coset space is infinite.

**Prerequisites:** [HS3.4](#hs3-4), [HS3.3](#hs3-3), [HS1.5](#hs1-5), [HS1.9](#hs1-9); `VStackSheavesAndLisseCategories:VS4`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.6`.

**Sources:** [FS], Theorem IX.3.1, p. 324; IX.3, sentence after Theorem IX.3.1, p. 324; IX.3, first paragraph, p. 324; [SW], Definition 24.1.1, p. 225; [DHKM], Theorem 1.1 and Theorem 1.2, p. 1; Corollary 1.4, p. 2; Lemma 3.1, p. 9; Remark 3.6, p. 11.

<a id="hs3-6"></a>

### HS3.6 — Compactness with arbitrary Satake bounds

For every local field $E$, arbitrary $b$ and finite tuple
of cocharacters, prove that $C_K$ is compact in
$D(J_b(E),\Lambda)$ for open pro-$p$ $K$, after forgetting
the Weil action. This is the consequence of the Hecke realization
and the compact-preserving action on compact induction. The
coefficient is the solid Satake kernel; a general non-minuscule
bound gives no compactness assertion for constant coefficients.
For one minuscule leg over $\mathbb Q_p$, recover the classical
compact-support statement with its dimension shift.

Test the level hypothesis on $G=\mathbb G_m$, zero bound,
$b=1$, $K=\mathcal O_E^\times$, and
$\Lambda=\mathbb F_\ell$ with $\ell\mid q-1$: the complex
is $\operatorname{c-Ind}_{\mathcal O_E^\times}^{E^\times} \mathbb F_\ell$, which is not compact. Thus source assertions
printed for every compact open level are used here with the
pro-$p$ hypothesis.

**Prerequisites:** [HS3.4](#hs3-4), [HS1.5](#hs1-5); `SmoothRepresentationsOfLocalGroups:SR.2`; `VStackSheavesAndLisseCategories:VS4`.

**Sources:** [FS], Proposition IX.3.2, p. 326; Proof of Proposition IX.3.2, p. 327; Proposition VII.7.4, p. 273.

<a id="hs3-7"></a>

### HS3.7 — Level trace, pullback and index normalization

For $K'\subset K$, define $\mathrm{pull}:C_K\to C_{K'}$
and $\mathrm{tr}:C_{K'}\to C_K$ from the finite étale
adjunctions. Prove $\mathrm{tr}\,\mathrm{pull}=[K:K']\mathrm{id}$;
if $K'$ is normal, prove
$\mathrm{pull}\,\mathrm{tr}=\sum_{\gamma\in K/K'}\gamma^*$.
Establish transitivity, conjugation compatibility and equivariance
for the target group and partial Frobenii. Under the Hecke comparison,
trace sends $1_{gK'}$ to $1_{gK}$ on compact inductions, while
pullback sends $1_{gK}$ to $\sum_{k\in K/K'}1_{gkK'}$.
Derived reciprocity identifies their contravariant effects with
inclusion of invariant complexes and corestriction.

When the index is a unit, its inverse times trace retracts pullback,
and its inverse times $\mathrm{pull}\,\mathrm{tr}$ is the
averaging idempotent cutting out $C_K$. For pro-$p$ $K$
the index is a power of $p$ and hence invertible. In general
it need not be: the Iwahori index in $\mathrm{GL}_2(\mathbb Z_p)$
is $p+1$. Use pullback for the colimit of $C_K$, and the
maps induced by trace for the colimit of $R\mathrm{Hom}(C_K,\rho)$.

**Prerequisites:** [HS2.6](#hs2-6), [HS3.4](#hs3-4), [HS3.2](#hs3-2), [HS3.1](#hs3-1), [HS2.9](#hs2-9); `SmoothRepresentationsOfLocalGroups:SR.1`; `DiamondSixOperations:S3`; `VStackSheavesAndLisseCategories:VS2`.

**Sources:** [SW], 23.3, text between Proposition 23.3.1 and Corollary 23.3.2, p. 219; After Corollary 23.5.3, p. 224.

<a id="hs3-8"></a>

### HS3.8 — Hecke adjunction, admissibility and duality

For $\rho\in D(J_b(E),\Lambda)$, define
$X(\rho)=i^{1*}T_{W^\vee}(Ri^b_*[\rho])$, including its
$\prod_iW_{F_i}$-action. For every pro-$p$ level, prove
$R\mathrm{Hom}_{J_b(E)}(C_K,\rho)\simeq X(\rho)^K$.
The map induced by trace is inclusion of invariants; their colimit
is $X(\rho)$ without an extra shift. For admissible $\rho$,
meaning perfect invariants at every open pro-$p$ target level,
prove perfectness of these complexes and admissibility of
$X(\rho)$. For a minuscule $\mathbb Q_p$ datum, rewriting
this with classical $R\Gamma_c$ inserts $[d](d/2)$.
Perfectness can fail at a non-pro-$p$ level: the trivial torus
datum and trivial $\mathbb F_\ell$-representation give
$R\Gamma(\mathcal O_E^\times,\mathbb F_\ell)$ when
$\ell\mid q-1$.

For admissible $\rho$ and smooth dual $\rho^\vee$, prove
$X(\rho)\simeq\mathbb D_{\mathrm{lis}} (i^{1*}T_{\mathrm{sw}^*W}(i^b_![\rho^\vee]))$ when $b$
is basic. For arbitrary $b$, insert
$[\rho^\vee]\otimes i^{b!}\Lambda$ inside the extension.
The stratum dualizing object is invertible and concentrated in
cohomological degree $2\langle2\rho_G,\nu_b\rangle$, including
its character; it need not be a trivial equivariant shift. For
$\Lambda=\overline{\mathbb Q}_\ell$ and finite-length smooth
$\rho$, prove that $X(\rho)$ is bounded with finite-length
cohomology, hence compact.

For general coefficients, compactness of $X(\rho)$ follows
when $Ri^b_*[\rho]$ restricts to a compact object on a
quasicompact open containing the finitely many strata reachable
from the trivial bundle within the given bounds. Retain this
hypothesis. [HHS] supplies compact stalks for compact $\rho$
in its torsion-coefficient range; it does not prove the assertion
for every $\Lambda$. Perfectness at each level is also not
finite generation of the entire colimit over $\Lambda$: for
the trivial weight and $b=1$, $X(\rho)=\rho$.

**Prerequisites:** [HS3.6](#hs3-6), [HS1.7](#hs1-7), [HS3.4](#hs3-4), [HS1.5](#hs1-5), [HS1.6](#hs1-6), [HS3.7](#hs3-7); `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`; `SmoothRepresentationsOfLocalGroups:SR.1`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; `VStackSheavesAndLisseCategories:VS4`; `BunGAndNewtonStrata:BG3`; `BunGAndNewtonStrata:BG2:smooth-Artin`; `VStackSheavesAndLisseCategories:VS5`; `VStackSheavesAndLisseCategories:VS3`; `VStackSheavesAndLisseCategories:VS2`.

**Sources:** [FS], IX.3, after the proof of Theorem IX.3.1, p. 325; IX.3, p. 325; Proposition IX.3.2, p. 326; Proposition VII.7.9, p. 275; [HHS], Theorem 1.3.1, p. 6; Theorem 7.1.4 and its proof, pp. 60–61; footnote 1, p. 2; [HI], Proposition 4.1, p. 24, with Proposition 1.1 (= Proposition 3.18), p. 2 (torsion coefficients, p. 7).

<a id="hs3-9"></a>

### HS3.9 — Comparison with independent classical RZ towers

This target compares supplied classical spaces; their deformation
theory and integral representability are owned by the integral
continuation and the classical tower suppliers. For a $p$-divisible
group $\mathbb X/k$ of height $n$ and dimension $d$,
use the Berkeley covariant normalization: the étale example has
Frobenius $\sigma$, the multiplicative example $p^{-1}\sigma$.
Thus $b$ has slopes in $[-1,0]$, $\kappa(b)=-d$, and
the bound is $\mu=(1^d,0^{n-d})$. The convention in which
$\mathrm{Lie}\mathbb X=M/VM$ uses Frobenius $pb\sigma$.
Identify the diamond of the independent RZ generic fibre with
$\mathrm{Sht}_{\mathrm{GL}_n,b,\mu,\mathrm{GL}_n(\mathbb Z_p)}$,
compatibly with periods and the tower at all compact open levels.
The map uses the modification with quotient
$i_{\infty*}\mathrm{Lie}X$ and the Tate-module lattice.

For EL/PEL data, require a finite-dimensional semisimple
$\mathbb Q_p$-algebra $B$ with field centre, a finite
$B$-module $V$, maximal order $\mathcal O_B$, and a
periodic lattice chain. In the PEL case require $p\ne2$,
a compatible nondegenerate alternating form and a self-dual chain.
Assume connected $G$, parahoric $\mathcal G=\mathrm{Aut}(\mathcal L)$,
minuscule $\mu$ of weights $0,1$, the identity similitude
cocharacter in the PEL case, and $[b]\in B(G,\mu^{-1})$.
Identify the generic fibre of the independent naive-local-model
admissible deformation space with the smooth local Shimura space
at $\mathcal G(\mathbb Z_p)$, including the lattice torsors
and towers over its open subgroups.

For $B=E'$, the one-embedding height-$n$ bound and basic
$b$ recover Lubin–Tate for
$\mathrm{Res}_{E'/\mathbb Q_p}\mathrm{GL}_n$; the division-algebra
EL datum of invariant $1/n$ recovers Drinfeld. Basic duality
exchanges their infinite levels and group actions. These are
$\mathbb Q_p$-shtuka comparisons for Weil restrictions; they
do not identify them with $E'$-shtukas without the further
supplier comparison. Their classical compact support is the
geometric fibre of $C_K[-\delta](-\delta/2)$, where
$\delta=\langle2\rho,\mu\rangle$, equal to $d(n-d)$ in
the $\mathrm{GL}_n$ case.

**Prerequisites:** [HS2.10](#hs2-10), [HS2.8](#hs2-8), [HS3.3](#hs3-3), [HS2.5](#hs2-5), [HS2.4](#hs2-4), [HS2.6](#hs2-6); `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `AInfCohomology:AI.2`; `IgusaVarietiesAndTorsionConcentration:IG.0`.

**Sources:** [SW], Theorem 24.2.5, p. 227; Proof of Theorem 24.2.5, p. 227; 12.1, footnote 1, p. 99; After the proof of Theorem 24.2.5, p. 229; 24.3, before Definition 24.3.3, p. 230; Corollary 24.3.5, p. 231; Appendix to Lecture 21, after Remark 21.6.7, p. 200.

<a id="hs3-10"></a>

### HS3.10 — Hecke operators between Newton strata

For arbitrary source $b'$ and target $b$, let
$L_{b'}=\pi_{b'\natural}q_{b'}^*$ be the chart-defined left
adjoint of stratum restriction. Define
$\Phi_V^{b',b}=i^{b*}T_VL_{b'}$ from
$D(J_{b'}(E),\Lambda)$ to
$D(J_b(E),\Lambda)^{BW_E^I}$, and
$C_{K'}^{b',b}(V)=\Phi_V^{b',b} (\operatorname{c-Ind}_{K'}^{J_{b'}(E)}\Lambda)$ for open pro-$p$
$K'$. Prove colimit preservation, compactness preservation,
naturality in $V$, and the level maps. The source Hecke algebra
acts functorially and commutes with the target and Weil actions.
Applying $\Phi$ to $C_c^\infty(J_{b'}(E),\Lambda)$ gives the
infinite-level object with the commuting right-translation source
action; it is the colimit along the inclusions of invariant
compactly supported functions, and its level objects are obtained
by source coinvariants.

For $b'=1$, recover the preceding cohomology comparison. For
basic $b'$, the inner-form equivalence reduces it to that case
for $G_{b'}$; the target class is represented by
$b''=b(b')^{-1}$ for Frobenius
$g\mapsto b'\sigma(g)(b')^{-1}$, and its centralizer is $G_b$.
For every $\rho$, prove
$R\mathrm{Hom}_{J_b(E)}(C_{K'}^{b',b}(V),\rho) \simeq(i^{b'*}T_{V^\vee}Ri^b_*\rho)^{K'}$, perfect when
$\rho$ is admissible.

For nonbasic $b'$, use $L_{b'}$, retaining its chart geometry
and unipotent automorphism part. The natural map
$L_{b'}M\to i^{b'}_!M$ is an isomorphism for basic sources,
and is not asserted to be one generally. Nor is a nonbasic
$C_{K'}^{b',b}$ identified here with cohomology of the ordinary
framed modification quotient. Its geometric identification needs
the chart/unipotent comparison contract above. Non-pro-$p$
source levels need not give compact objects or perfect Hom complexes.

**Prerequisites:** [HS1.9](#hs1-9), [HS1.5](#hs1-5), [HS1.2](#hs1-2), [HS0.6](#hs0-6), [HS3.4](#hs3-4), [HS1.3](#hs1-3); `VStackSheavesAndLisseCategories:VS4`; `BunGAndNewtonStrata:BG0`; `BunGAndNewtonStrata:BG3`; `BunGAndNewtonStrata:BG4`; `VStackSheavesAndLisseCategories:VS3`.

**Sources:** [FS], Proposition VII.7.2, p. 272; Proposition VII.7.4, p. 273; Proof of Theorem IX.3.1, p. 324; Proof of Theorem IX.7.2, p. 335.

**API:**

| Name | Required behavior |
| --- | --- |
| `heckeBetweenStrata` | The functor Φ^{b′,b}_V = i^{b*}∘T_V∘π_{b′♮}q_{b′}^*: D(G_{b′}(E),Λ) → D(G_b(E),Λ)^{BW_E^I}. |
| `heckeBetweenStrata.atLevel` | C^{b′,b}_{K′}(V) = Φ^{b′,b}_V(c-Ind_{K′}^{G_{b′}(E)}Λ) for K′ ⊂ G_{b′}(E) open pro-p. |
| `heckeBetweenStrata.map` | A morphism V → V′ of representations induces a natural transformation Φ^{b′,b}_V → Φ^{b′,b}_{V′}, compatibly with identities and composition. |
| `heckeBetweenStrata.preservesColimits` | Φ^{b′,b}_V commutes with all colimits. |
| `heckeBetweenStrata.compact` | Φ^{b′,b}_V sends compact objects to compact objects; C^{b′,b}_{K′}(V) is compact in D(G_b(E),Λ) for K′ open pro-p. |
| `heckeBetweenStrata.unit` | For I = ∅ and V = 1: Φ^{b,b}_1 ≅ id, and Φ^{b′,b}_1 = i^{b*}π_{b′♮}q_{b′}^*. |
| `heckeBetweenStrata.comp_trivial` | For b′ = 1: Φ^{1,b}_V(M) = i^{b*}T_V(j_!M), and C^{1,b}_K(V) is the object T_V(j_!c-Ind_K^{G(E)}Λ)\|_{Bun_G^b} of HS3.4. |
| `heckeBetweenStrata.basicTwist` | For b′ basic, under Bun_G ≅ Bun_{G_{b′}}: Φ^{b′,b}_V for G is Φ^{1,b″}_V for G_{b′}, b″ = b·b′⁻¹ ∈ G_{b′}(Ĕ) = G(Ĕ) the class of the image of E_b, with (G_{b′})_{b″} = G_b. |
| `heckeBetweenStrata.homAdjunction` | RHom_{G_b(E)}(Φ^{b′,b}_V(M), ρ) ≅ RHom_{G_{b′}(E)}(M, i^{b′*}T_{V^∨}Ri^b_*ρ), naturally in M and ρ; for M = c-Ind_{K′}Λ the right side is the derived K′-invariants. |
| `heckeBetweenStrata.heckeAlgebraAction` | Λ[K′\G_{b′}(E)/K′] acts on C^{b′,b}_{K′}(V), commuting with G_b(E) and W_E^I. |
| `heckeBetweenStrata.tower` | C^{b′,b}_∞(V) = Φ^{b′,b}_V(C_c^∞(G_{b′}(E),Λ)) with commuting actions of G_b(E), G_{b′}(E) and W_E^I; it is the colimit of the C^{b′,b}_{K′}(V) over open pro-p K′. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `heckeBetweenStrata.torus_unit_test` | For G = G_m, I = ∅, V = 1 and K′ ⊂ E^× open pro-p: C^{b′,b}_{K′}(1) ≅ c-Ind_{K′}^{E^×}Λ if b = b′ in B(G_m) = Z, and C^{b′,b}_{K′}(1) = 0 if b ≠ b′. Here G_b(E) = E^× ⊂ Ĕ^× for every representative b ∈ Ĕ^×, because Ĕ^× is commutative, and D(G_b(E),Λ) is identified with D(E^×,Λ) through this equality; two representatives of one class give the same identification. |
| `heckeBetweenStrata.torus_shift_test` | For G = G_m, I = {∗} and V the character z ↦ z^n of Ĝ = G_m, the object C^{b′,b}_{K′}(V) is non-zero for exactly one class b ∈ B(G_m), namely the one with κ(b) = κ(b′) − n (κ(b) = v_π(b), so that E_b = O(−κ(b))); for n = 1 and E_{b′} = O(−1) this is the trivial class, in agreement with FS IX.7.4, where T_std takes a sheaf on the stratum of O(−1/n) to Bun_G^1. Its underlying object is c-Ind_{K′}^{E^×}Λ, under the equalities G_b(E) = E^× = G_{b′}(E). |
| `heckeBetweenStrata.trivial_stratum_test` | For G = GL_2 over Q_p, b′ = 1, V = std, K = 1 + p^m M_2(Z_p) with m ≥ 1, and b the class with E_b = O(1/2): C^{1,b}_K(std) ≅ RΓ_c(M_{LT,K,C},Λ)[1](1/2), the shifted compactly supported cohomology of the Lubin–Tate tower of height 2 at level K, as a complex of smooth representations of D^× (D the quaternion division algebra over Q_p) with W_{Q_p}-action. |
| `heckeBetweenStrata.not_pro_p_test` | For G = G_m over Q_p with p odd, ℓ a prime dividing p − 1, Λ = F_ℓ, b = b′ = 1, V = 1 and the compact open subgroup K′ = Z_p^×, which is not pro-p: i^{1*}L_1(c-Ind_{Z_p^×}^{Q_p^×}F_ℓ) = c-Ind_{Z_p^×}^{Q_p^×}F_ℓ is not compact in D(Q_p^×,F_ℓ), because Ext^n(c-Ind_{Z_p^×}^{Q_p^×}F_ℓ, F_ℓ) = H^n(F_p^×, F_ℓ) ≠ 0 for all n ≥ 0. |

## HS4 — Coherent operations and comparison diagrams

Assemble the finite-set Hecke family, its dual-leg operations, and naturality in the group. Export the continuous categorical input to excursion operators and the spectral action, keeping their algebraic and finite-ramification theorems with their owner.

<a id="hs4-1"></a>

### HS4.1 — The coherent finite-set Hecke family

Assemble the action on compact lisse objects into exact
$\mathrm{Rep}_\Lambda(Q^I)$-linear monoidal functors
$T^I:\mathrm{Rep}_\Lambda((\widehat G\rtimes Q)^I)\to \mathrm{End}_\Lambda(D_{\mathrm{lis}}(\mathrm{Bun}_G,\Lambda)^\omega)^{BW_E^I}$.
The category has its relatively discrete condensed structure, and
the Weil action on an endofunctor is a map of condensed groups.
For every $a:I\to J$, intertwine restriction of representations
with restriction along $W_E^J\to W_E^I$, including identities,
composition and all higher monoidal coherences. Express the family
as a morphism of coCartesian fibrations over finite sets.

Make permutations, fusion, empty legs, unit insertion and iterated
modifications explicit. Unused Weil factors act trivially. Exterior
products give commuting compositions with separate Weil factors;
fusion restricts them to diagonal factors. With representation
symmetry the earlier reversed-composition convention gives the
usual isomorphism $T_{V\otimes W}\simeq T_V\circ T_W$ as well.

**Prerequisites:** [HS1.9](#hs1-9), [HS0.4](#hs0-4), [HS1.5](#hs1-5), [HS1.8](#hs1-8), [HS1.1](#hs1-1), [HS1.2](#hs1-2), [HS1.3](#hs1-3); `GeometricSatakeAndFusion:GS3:fusion`; `GeometricSatakeAndFusion:GS4:integral-dual-group`; `EnhancedDerivedSheaves:E5:abstract`.

**Sources:** [FS], Corollary IX.2.4, p. 323; Theorem IX.0.1(ii), p. 318; Theorem IX.0.1(iii) and the paragraph after it, p. 318; paragraph after Theorem IX.0.1, p. 318; Section VI.9, p. 226; Section VI.9, p. 227; Proposition IX.5.1, proof, p. 328.

<a id="hs4-2"></a>

### HS4.2 — Creation, annihilation and dual-leg triangles

Apply the monoidal action to coevaluation
$1\to V\otimes V^\vee$ and evaluation
$V^\vee\otimes V\to1$. Construct creation and annihilation
as $W_E$-equivariant natural transformations and prove the two
triangle identities with all associativity and unit constraints.
They give the adjunctions in both directions between $T_V$
and $T_{V^\vee}$.

The two-leg form $T_{V\boxtimes V^\vee}$ restricts to that
pair under diagonal Weil action. Creation and the symmetrized
annihilation are invariant under $(\gamma,\gamma)$, not
under independent Weil elements. Their composite with
$(\gamma_1,\gamma_2)$ depends only on
$\gamma_1\gamma_2^{-1}$; on the diagonal it is multiplication
by the rank of $V$. For general $I$, maps from and to the
unit of the restriction of $V$ to the diagonal $\widehat G$
give natural transformations of underlying endofunctors, with
their representation-morphism composition identities. No Weil
equivariance is claimed for these general maps. Excursion operators
are built from this interface in their owner roadmap.

**Prerequisites:** [HS4.1](#hs4-1), [HS1.2](#hs1-2), [HS1.10](#hs1-10); `GeometricSatakeAndFusion:GS3:fusion`; `mathlib:CategoryTheory.ExactPairing`; `mathlib:CategoryTheory.Functor.Monoidal`.

**Sources:** [FS], Theorem IX.2.2, proof, p. 323; Definition VIII.4.2 and the construction after it, p. 291; Definition VIII.4.2, p. 291; Proposition IX.6.5 and its proof, p. 333; paragraph after Theorem IX.0.1, p. 318.

**API:**

| Name | Required behavior |
| --- | --- |
| `createDualLegs` | For V ∈ Rep_Λ(Ĝ⋊Q): the W_E-equivariant natural transformation create_V = T_coev: id ≅ T_1 → T_{V⊗V^∨} ≅ T_V∘T_{V^∨}. |
| `annihilateDualLegs` | For V ∈ Rep_Λ(Ĝ⋊Q): the W_E-equivariant natural transformation annihilate_V = T_ev: T_{V^∨}∘T_V ≅ T_{V^∨⊗V} → T_1 ≅ id. |
| `dualLegs.annihilateSwapped` | annihilate′_V = T_{ev∘s}: T_V∘T_{V^∨} → id, where s: V⊗V^∨ ≅ V^∨⊗V is the symmetry of Rep_Λ(Ĝ⋊Q); it is the map β: V⊗V^∨ → 1, v⊗f ↦ f(v), of FS IX.6.5. |
| `dualLegs.leftTriangle` | The composite T_V ≅ id∘T_V → (T_V∘T_{V^∨})∘T_V ≅ T_V∘(T_{V^∨}∘T_V) → T_V∘id ≅ T_V, given by create_V and then annihilate_V, is the identity. |
| `dualLegs.rightTriangle` | The composite T_{V^∨} ≅ T_{V^∨}∘id → T_{V^∨}∘(T_V∘T_{V^∨}) ≅ (T_{V^∨}∘T_V)∘T_{V^∨} → id∘T_{V^∨} ≅ T_{V^∨}, given by create_V and then annihilate_V, is the identity. |
| `dualLegs.adjunction` | create_V and annihilate_V are the unit and counit of an adjunction T_{V^∨} ⊣ T_V in W_E-equivariant endofunctors; with V^∨ in place of V and V^{∨∨} ≅ V one gets T_V ⊣ T_{V^∨}. So T_{V^∨} is both left and right adjoint to T_V. |
| `dualLegs.diagonal_equivariant` | Under the fusion identification of T_{V⊗V^∨} with T_{V⊠V^∨} restricted to the diagonal of W_E²: (γ,γ)∘create_V = create_V and annihilate′_V∘(γ,γ) = annihilate′_V for every γ ∈ W_E. |
| `dualLegs.trace` | annihilate′_V∘create_V = rank_Λ(V)·id, an endomorphism of the identity functor; rank_Λ(V) ∈ Λ is the trace of id_V. |
| `dualLegs.excursion_quotient` | For γ_1, γ_2 ∈ W_E: annihilate′_V∘(γ_1,γ_2)∘create_V = annihilate′_V∘(γ_1γ_2^{-1},1)∘create_V. |
| `dualLegs.createAlong` | For a finite set I, V ∈ Rep_Λ((Ĝ⋊Q)^I) and α: 1 → V\|_Ĝ equivariant for the diagonal Ĝ: the natural transformation T_α: id → T_V of underlying endofunctors of D_lis(Bun_G,Λ). |
| `dualLegs.annihilateAlong` | For a finite set I, V ∈ Rep_Λ((Ĝ⋊Q)^I) and β: V\|_Ĝ → 1 equivariant for the diagonal Ĝ: the natural transformation T_β: T_V → id of underlying endofunctors. |
| `dualLegs.along_naturality` | For g: V → V′ in Rep_Λ((Ĝ⋊Q)^I): T_g∘T_α = T_{g∘α} and T_{β′}∘T_g = T_{β′∘g}; T_g commutes with the action of W_E^I. Hence T_β∘(γ_i)∘T_α is unchanged when (V,α,β) is replaced by (V′, g∘α, β′) with β = β′∘g. |
| `dualLegs.along_dual_pair` | For I = {1,2}, the representation V⊠V^∨, α = coev and β = ev∘s: T_α = create_V and T_β = annihilate′_V. |
| `dualLegs.unit` | For V = 1, create_1 and annihilate_1 are the unit constraints id ≅ id∘id of the monoidal functor T. |
| `dualLegs.map_coefficients` | For a map Λ → Λ′ of Z_ℓ[√q]-algebras, coefficient extension carries create_V and annihilate_V to create and annihilate of V⊗_ΛΛ′. |

**Tests:**

| Name | Required behavior |
| --- | --- |
| `dualLegs.rank_test` | For G = GL_n, Q = 1 and V the standard representation of Ĝ = GL_n over Λ: annihilate′_V∘create_V is multiplication by n on the identity functor of D_lis(Bun_{GL_n},Λ)^ω. For n = 2 it is 2. |
| `dualLegs.triangle_test` | For G = G_m and V = χ_1 the standard character of Ĝ = G_m, so V^∨ = χ_{−1}: create and annihilate are isomorphisms id ≅ T_{χ_1}∘T_{χ_{−1}} and T_{χ_{−1}}∘T_{χ_1} ≅ id, and the composite T_{χ_1} → T_{χ_1}∘T_{χ_{−1}}∘T_{χ_1} → T_{χ_1} is the identity. |
| `dualLegs.diagonal_test` | For V ∈ Rep_Λ(Ĝ⋊Q) and γ, γ_1, γ_2 ∈ W_E: (γ,γ)∘create_V = create_V as maps id → T_{V⊠V^∨} of underlying endofunctors, and annihilate′_V∘(γ_1,γ_2)∘create_V = annihilate′_V∘(γ_1γ_2^{-1},1)∘create_V. |
| `dualLegs.torus_excursion_test` | For G = G_m, V = χ_1, γ_1, γ_2 ∈ W_E and a smooth character χ: E^× → Λ^×, regarded as an object of D(E^×,Λ) ≅ D_lis(Bun^b_{G_m},Λ) for any b ∈ B(G_m) (the natural transformations extend from the compact objects to D_lis(Bun_{G_m},Λ), their Ind-completion, because the functors T_V commute with colimits; a character need not be a compact object): annihilate′_V∘(γ_1,γ_2)∘create_V acts on χ by the scalar χ(rec(γ_1γ_2^{-1})), where rec: W_E → E^× is the reciprocity map through which FS IX.6.4 identifies Z¹(W_E,G_m) with Hom(E^×,G_m). |
| `dualLegs.not_invariant_test` | For G = G_m, V = χ_1 and a smooth character χ of E^× with χ(rec(γ_0)) ≠ 1 for some γ_0 ∈ W_E: on the object χ, (γ_0,1)∘create_V = χ(rec(γ_0))·create_V ≠ create_V. So create_V is not invariant under W_E², only under its diagonal. |
| `dualLegs.unit_test` | For V = 1: create_1 and annihilate_1 are the unit constraints, and annihilate′_1∘(γ_1,γ_2)∘create_1 is the identity for all γ_1, γ_2 ∈ W_E. |

<a id="hs4-3"></a>

### HS4.3 — Adjoint-group morphisms and global Hecke diagrams

For $\eta:G'\to G$ inducing an adjoint-group isomorphism,
with no requirement of surjectivity or finite kernel, give the
commuting diagram of bundle stacks and Hecke correspondences.
Let $\pi$ be the bundle map, $\pi_H=qj$ its Hecke map,
and $V$ the restriction of $V'$ along the dual map.
Locally the map $j$ is the corresponding Grassmannian map;
prove $j_\natural S'_{V'}\simeq q^*S'_V$, and hence
$\pi_{H\natural}S'_{V'}\simeq h_1^*\pi_\natural\Lambda\otimes^\blacksquare S'_V$.

For lisse $A$, deduce
$(\pi\times\mathrm{id})_\natural T_{V'}(\pi^*A) \simeq T_V(A\otimes^\blacksquare\pi_\natural\Lambda)$.
The tensor on the right is only asserted solid. Also prove
$T_{V'}(\pi^*A)\simeq(\pi\times\mathrm{id})^*T_V(A)$
in the lisse Weil-equivariant category, using the local comparison
over the other bundle projection. Both comparisons are natural
and compatible with finite-set maps. The pushforwards here are
relative homology. The consequences for spectral centres and
L-parameters belong to `ExcursionOperatorsAndSpectralAction:ES6:functoriality`.

**Prerequisites:** [HS4.1](#hs4-1), [HS0.6](#hs0-6), [HS1.2](#hs1-2), [HS1.9](#hs1-9); `GeometricSatakeAndFusion:GS4:integral-dual-group`; `VStackSheavesAndLisseCategories:VS2`; `GeometricSatakeAndFusion:GS3:fusion`.

**Sources:** [FS], Theorem IX.6.1, proof, p. 331; Proposition VII.3.1, p. 257; Theorem VI.11.1, proof, p. 237.

<a id="hs4-4"></a>

### HS4.4 — Products and Künneth for the action

For $G=G_1\times G_2$, identify its bundle stack with the
product and its Hecke stack with the fibre product over the common
leg base. For exterior-product representations, prove that its
solid kernel is the tensor product of the pulled-back kernels,
and that the action on $A_1\boxtimes A_2$ is the exterior
product over the leg base of their Hecke actions. The geometric
Weil action is diagonal. Require naturality and finite-set
compatibility; a general representation is not assumed to be
a single exterior product.

For compact $A_i$, prove that $A_1\boxtimes A_2$ is compact,
that these products generate the lisse category, and that for all
$B_i$ the natural derived-Hom tensor map is an isomorphism.
Colimit preservation determines the exterior-product action on
those generators. Use the lisse version of [FS], VII.7.10, rather
than the category printed there as $D_{\mathrm{ét}}$.

**Prerequisites:** [HS4.1](#hs4-1), [HS1.2](#hs1-2), [HS0.1](#hs0-1), [HS1.9](#hs1-9); `GeometricSatakeAndFusion:GS4:integral-dual-group`; `VStackSheavesAndLisseCategories:VS2`; `VStackSheavesAndLisseCategories:VS1`; `VStackSheavesAndLisseCategories:VS5`.

**Sources:** [FS], Proposition IX.6.2, proof, p. 331; Proposition VII.7.10, p. 276; Proposition VII.3.1, p. 257.

<a id="hs4-5"></a>

### HS4.5 — Weil restriction and induced kernels

For finite separable $E'/E$ with a fixed embedding, reductive
$G'/E'$, and $G=\mathrm{Res}_{E'/E}G'$, identify
$\mathrm{Bun}_{G'}\simeq\mathrm{Bun}_G$ through the curve
base change. The leg map
$\rho:\mathrm{Div}^1_{E'}\to\mathrm{Div}^1_E$ is finite
étale of degree $[E':E]$. Construct the Hecke diagram and the
closed immersion of the upper correspondence into the pullback
of the lower one. Its composite $\psi$ with the finite étale
leg map is proper.

The dual group has one factor for each embedding of $E'$,
permuted by $W_E$. Inflate $V'$ along the chosen-factor
projection over $W_{E'}$, then induce to $W_E^I$, obtaining
$V$ of rank $[E':E]^{|I|}\mathrm{rank}(V')$.
Use $r' = r^f$, where $f$ is the residue degree. Prove
$\psi_*S_{V'}\simeq S_V$, equivalently
$\psi_\natural S'_{V'}\simeq S'_V$, and
$T_V(A)\simeq(\mathrm{id}\times\rho^I)_\natural T_{V'}(A)$.
This is induction of the continuous $W_{E'}^I$-equivariant
object. Require naturality and compatibility with fusion and
finite-set maps. Parameter-stack and excursion-algebra comparisons
are supplied to the excursion owner, not reconstructed here.

**Prerequisites:** [HS4.1](#hs4-1), [HS1.2](#hs1-2), [HS0.1](#hs0-1), [HS1.9](#hs1-9); `GeometricSatakeAndFusion:GS4:integral-dual-group`; `BunGAndNewtonStrata:BG2:uniformization`; `VStackSheavesAndLisseCategories:VS2`.

**Sources:** [FS], Proposition IX.6.3, proof, p. 332; Proposition IX.6.3, statement, p. 331.

<a id="hs4-6"></a>

### HS4.6 — Levi constant terms on an unstable stratum

Choose a parabolic $P\subset G$, Levi quotient $M$, and
Levi splitting. Construct $\mathrm{Hck}^I_{M,P}$ by restricting
the source of the $P$-Hecke stack to $\mathrm{Bun}_M$, with
$g:\mathrm{Hck}^I_{M,P}\to\mathrm{Hck}^I_M$. Its local
Grassmannian fibres describe the second bundle relative to the
first, so inversion is needed to use our target-fibre convention.

For $\ell$-power torsion $\Lambda$, compute the étale
kernel by base change from $Rp_!q^*(\mathrm{sw}^*S_V)$.
Let $\deg_P$ pair the sum of the Hecke types with
$2\rho_G-2\rho_M$. Prove that $Rg_!S_V[-\deg_P]$
is the $M$-Satake kernel of restriction along
$(m,w)\mapsto (m(2\widehat\rho_G-2\widehat\rho_M)(r)^{-|w|},w)$.
The cocharacter value is central in $\widehat M$.
The inverse twist and negative shift come from the switched
Grassmannian convention. Include fusion and nested-parabolic
compatibilities.

Assume in addition that $G$ is quasisplit and $b_N$ is
sufficiently unstable relative to the bound so that every bounded
self-modification preserves its HN reduction to $P$. For a
torsion étale object $A_N$ supported on that stratum, let
$A'_N$ be its object on $\mathrm{Bun}_P$, and put
$B_N=R\pi_!A'_N$ for $\pi:\mathrm{Bun}_P\to\mathrm{Bun}_M$.
Prove the diagram identity
$R\pi_!Rh'_{2!}(h_1'^*A'_N\otimes S_V) \simeq Rh_{2!}(h_1^*B_N\otimes Rg_!S_V)$, and identify the
restricted $G$-operator with the corresponding $P$-operator.
Use the exceptional stacky-map compatibility contract.

This is a torsion single-stratum theorem, not a global identity
for all lisse objects and coefficients. If $A'_N=\pi^*\sigma$,
then $B_N=\sigma\otimes R\pi_!\Lambda$. The latter includes
the character and shift of the unipotent classifying-stack
cohomology and is not generally the same representation. Its
character must be combined with the inverse twist above before
deducing an excursion normalization, even on components with
$\deg_P=0$.

**Prerequisites:** [HS4.1](#hs4-1), [HS1.2](#hs1-2), [HS0.1](#hs0-1), [HS0.2](#hs0-2), [HS1.1](#hs1-1); `GeometricSatakeAndFusion:GS3:fusion`; `GeometricSatakeAndFusion:GS4:integral-dual-group`; `BunGAndNewtonStrata:BG3`; `DiamondSixOperations:S2`; `VStackSheavesAndLisseCategories:VS0`; `RelativeFarguesFontaine:RF4:G-torsors`.

**Sources:** [FS], Theorem IX.7.2, proof, p. 337; Theorem IX.7.2, proof, p. 336; Theorem IX.7.2, proof, p. 335; Proposition VI.7.13, p. 223; [HI], Proposition 4.4, p. 25; Lemma 4.7, p. 26.

<a id="hs4-7"></a>

### HS4.7 — Tensor compatibility and continuous export

For compact lisse $A$, export the coherent family
$(I,V)\mapsto T_V(A)$, its relatively discrete condensed
endomorphism algebra and its continuous Weil action. Exterior
products give compositions with separate Weil factors; tensor
products restrict the exterior-product action to the diagonal.
The functor is exact and $\mathrm{Rep}(Q^I)$-linear, its unit
has trivial action, and exterior products of one-leg
representations give iterated actions. Dual Hecke operators are
adjoint in both directions with equivariant units and counits.

For an open subgroup $P$ of wild inertia, if $P^I$ acts
trivially on $T_V(A)$ and $T_W(A)$, prove triviality of
$P^{I\sqcup I}$ on $T_{V\boxtimes W}(A)$ and of
$P^I$ on $T_{V\otimes W}(A)$. The class descends to the
quotient by those powers of $P$ and is closed under finite
direct sums, direct summands, extensions and the specified
bounded-weight resolutions. No closure under arbitrary
subobjects, quotients or duals follows from these facts.

The tensor generator needed by the excursion roadmap must
generate every representation through tensor powers and those
justified operations. Controlling one such generator then reduces
the finite-ramification proof to one leg. Existence of that
generator is a representation-theoretic supplier input, and the
existence of a single $P$ controlling every $I,V$ is the
finite-ramification theorem of
`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`.
The target here is its continuous and tensor-compatible Hecke
input, without asserting that theorem.

**Prerequisites:** [HS4.2](#hs4-2), [HS1.8](#hs1-8), [HS4.1](#hs4-1), [HS1.5](#hs1-5).

**Sources:** [FS], Corollary IX.2.4, p. 323; Proposition IX.5.1, proof, p. 328.
