# EDC.6: integral, analytic and diamond comparison of operations

This layer compares the **specified maps** of scheme étale duality and cycle
classes: exceptional adjunction, trace, evaluation, biduality, cup product,
supported fundamental class and Gysin. An isomorphism between two cohomology
groups does not identify these maps. The integral part retains torsion, the
complex part fixes the Tate/orientation normalization, and the diamond part
states exactly which comparisons are recovered by a right adjoint.

The target-level planning pass is complete. EDC.6 is **planned**, with the four
external gaps recorded below. The packet adds six theorem targets and one
construction to the existing EDC.6 plan. All implementation statuses remain
unchecked. This README is the full specification; the compact suggested Lean
file states two categorical end milestones expressible at the pins.

## Owners, baseline and dependency boundary

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
at `f790474821cf4256814db967cb154e7af3d0c369`. The actual statements read in the
pinned Mathlib sources are:

| Declaration | What this layer consumes |
| --- | --- |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | The small étale Grothendieck topology. |
| `AlgebraicGeometry.Scheme.ellAdicSheaf` | The existing continuous Z_ℓ-valued pro-étale sheaf, through the imported constant-system realization. |
| `AlgebraicGeometry.Scheme.EllAdicCohomology` | Cohomology of that sheaf, with its universe lift; comparison specializes to this existing notion. |
| `CategoryTheory.Adjunction.isIso_counit_app_iff_mem_essImage` | For a full faithful left adjoint, invertibility of the counit at an object is equivalent to membership in its essential image. |

These declarations provide neither constructible adic six operations nor a
strong scheme/diamond exceptional-pullback comparison. Current Tau Ceti also
has singular cochains, relative/twisted cohomology and cup/cap operations.
These existing carriers and maps are consumed. Current
TauCetiRoadmap main was checked separately from the pins:
AlgebraicTopology owns relative cochains, products, local orientation and
compact-manifold duality; DifferentialGeometry owns the orientation/degree API
and noncompact **real de Rham** duality. AlgebraicVectorBundles supplies the
vector-bundle infrastructure; its Chern-class discussion is successor-roadmap
motivation, rather than a Chern-class target supplied by that roadmap.
The requested additional finite/integral supported and
noncompact topological interface does not replace any of those developments.

The exact generic coefficient and comparison owners are
CohomologicalPointCounting/**EllAdicRealization** and
**ComplexComparison**, read at open TauCetiRoadmap PR196 head
`4bd72379658126cbe9be935656396f0c9dac4de0`. They are imported through
`SchemeAndStackFoundations:SF.2` until their upstream layers have registered
atlas ids. In particular, the arbitrary-discrete pro-étale comparison and the
finite-free lisse-system comparison already in SF.2 do not by themselves
supply the entire normalized constructible category. EllAdicRealization at
this head explicitly uses Z_ℓ/Q_ℓ. The finite O/E constructible and topological
realizations, common-stratum enhanced equivalence and filtered algebraic-coefficient
descent needed here require an exact extension of that owner through SF.2.

The following ids already occur in
[the EDC.4 packet](../packets/EtaleDualityAndPerverseSheaves--EDC.4.json).
They keep their original ids and are not duplicated in this packet. All
suffixes in this table have prefix `EtaleDualityAndPerverseSheaves:EDC.6/`.

| Imported target | Interface used here |
| --- | --- |
| `normalized-adic-system` and `api-normalized-system-reduction`, `api-normalized-system-uniform-bounds`, `api-normalized-system-common-strata` | Coherent reductions, common strata, uniform ordinary and Tor bounds. |
| `classical-and-proetale-adic-categories` | Constructible integral/rational realizations and their equivalence, with bounded restriction witnesses. |
| `adic-transport-of-duality-and-classes` | Existing integral duality/class target, refined here by strict reductions and mapping limits. |
| `rational-perverse-coefficient-extension` | Finite-field-extension t-exactness, intermediate extension, IC and Hom base change. |
| `complex-analytic-comparison` | Finite/integral/rational constructible Artin comparison; rational essential image retains the stable-lattice condition. |
| `trace-orientation-comparison` | Existing comparison target, whose actual orientation and supported maps are specified below. |
| `scheme-adic-diamond-operation-comparisons-index` | The operation comparison matrix, with direct and right-adjoint comparisons distinguished. |
| `diamond-transport-of-duality` | Its stated **Rc_* recovery**. Its stronger acceptance examples need the essential-image input below. |

The additional inherited `complete-intersection-betti-comparison` is an
application target. This job supplies its comparison inputs without replanning
complete-intersection geometry.

Finite-level inputs are the existing EDC.0 coefficient change, constructible
ctf category, Tate twist, tensor/internal Hom and supported localization;
EDC.1 exceptional adjunction and biduality; EDC.2 smooth purity, trace and
integral/rational derived pairings; and EDC.3 smooth-pair purity, fundamental
classes, Gysin and cycle classes. Perverse categories, intermediate extension
and integral torsion tilting stay in EDC.5.

## Conventions and imported objects

Let ℓ be a prime invertible in the geometric field. Let E/Q_ℓ be finite,
O its ring of integers, λ a uniformizer, and O_n = O/λ^n for **n ≥ 1**.
The inherited normalized-system node uses n ≥ 0 and O/λ^(n+1); reindex it
once. All complexes are cohomological: H^q(K[r]) = H^(q+r)(K).
The positive Tate twist is the root-of-unity twist; smooth dimension d purity
is f^!Λ = f^*Λ(d)[2d]. The dualizing complex is K_X = a_X^!Λ and
D_XM = RHom(M,K_X), relative to the stated base.

### Normalized systems: exact imported definition and checks

A normalized constructible O-system consists of bounded constructible levels
K_n in the finite-Tor category over O_n, with specified equivalences

\[
K_m\otimes^L_{O_m}O_n\simeq K_n\qquad(m\ge n),
\]

homotopy-coherent identity, triple-reduction and higher coherences in the
enhancement of the **ambient unbounded** derived category. Morphisms use its
mapping-complex homotopy limit. Merely compatible morphisms between levels in
the homotopy categories do not capture the integral category when the Milnor
lim¹ obstruction is nonzero. The enhanced realization is an exact part of the
SF.2 extension request; this clarifies the inherited normalized-system interface
without introducing a second category owner. One ordinary cohomological interval,
one Tor interval, and one finite algebraic stratification must work at every
level. Tor bounds are tested against all degree-zero ambient coefficient
sheaves. On every stratum, all level cohomology sheaves are finite lisse.
Boundedness at each individual level is insufficient.

The integral constructible category is the imported realization of these
systems, equivalently the derived-complete pro-étale constructible category
with the stated perfect-stalk condition. Over the regular DVR O, bounded
finitely generated stalk complexes are perfect. For a general finite
coefficient ring, constructible and finite-Tor remain separate conditions.
Tensor and internal Hom are ambient derived operations with explicit witnesses
for restricting their outputs to bounded constructible categories.

The inherited API exposes canonical derived reduction, uniform ordinary
bounds, common strata and uniform finite-Tor amplitude through
`normalized_system_reduction`, `normalized_system_uniform_bounds`,
`normalized_system_common_strata` and `normalized_system_finiteTor`.
The inherited tests include the constant system, triple-reduction coherence,
failure of a proposed common interval, and the nonperfect module
(Z/ℓ²)/ℓ over a point: its self-tensor and self-Hom are unbounded in opposite
directions. They prevent treating unrestricted quotient-to-quotient reduction
as a functor between bounded constructible categories. The coherent system
from O/λ uses **derived** reductions and passes; a tower of degree-zero
quotient modules with ordinary tensor is not a substitute.

EllAdicRealization Layers 0–2 own derived inverse limits, the Milnor sequence,
Mittag–Leffler, scalar tensor comparisons and classical realization. Layers
3–5 own finite étale/pro-étale comparison, the native constant sheaf comparison
and constructible realization. Layer 6 supplies geometric finite generation
and perfectness. Layers 7–9 supply rationalization, Galois structures and
operation comparisons; Layer 10 owns normalized **topological** realization
and adic Artin comparison. Those existing targets have Z_ℓ/Q_ℓ coefficients.
The SF.2 request integrates them and extends EllAdicRealization in its own
direction by the precise O/E enhanced constructible, mapping-limit and
topological interfaces, with common strata/uniform bounds, and by filtered
algebraic-coefficient object/morphism/finite-diagram descent. Layers 7–9 do
not already state that full extension. EDC.6 imports the resulting interface.

Bhatt–Scholze, Proposition 6.6.11, p.54 and §§6.7–6.8, pp.55–62, give the
stratification and operation framework in this coefficient range. Repleteness
alone supplies none of the required finite-type bounds or constructibility.

## 1. Strict reduction of integral operations

**Node:** `operation-reduction-comparisons`. Proposed declaration: `integralOperation_reduction` in
`TauCeti.EtaleDuality.Comparison`.

Let f:X→Y be separated finite type between separated finite-type schemes over
a field k with ℓ invertible. For bounded constructible derived-complete
O-complexes with finite perfect stalks, write ρ_nK = K⊗^L_O O_n. The
canonical maps are isomorphisms

\[
\begin{aligned}
\rho_n f^!K&\simeq f_n^!\rho_nK,\\
\rho_n Rf_*M&\simeq Rf_{n,*}\rho_nM,\\
\rho_n Rf_!M&\simeq Rf_{n,!}\rho_nM,\\
\rho_n\operatorname{RHom}_O(M,N)&\simeq
  \operatorname{RHom}_{O_n}(\rho_nM,\rho_nN).
\end{aligned}
\]

Here RHom is **sheaf internal Hom**. Completed tensor and pullback commute
with reduction. Setting f=a_X identifies reduction of K_X with a_X^!O_n;
internal Hom then identifies reduction of D_X with finite-level Verdier
duality. Reduction carries the specified biduality map to finite-level
biduality, and derived-complete conservativity makes it an isomorphism.
All exchanges respect identities, composition and repeated reduction. Outputs
have a common finite stratification and ordinary/Tor bounds independent of n.

**Proof spine.** Finite-type schemes over k are excellent, noetherian and
finite dimensional. Bhatt–Scholze 6.7.1–6.7.2, p.55 give relative finiteness
and finite cohomological dimension. Lemma 6.5.11, p.51 then supplies a strict
scalar/direct-image comparison; the pro-object comparison of 6.5.9 alone
would not suffice. The relative cohomological bound is not an assertion that
arithmetic global cohomology over arbitrary k is finite.

Use compactification and 6.7.6–6.7.10, p.56 for Rf_!. This functor is not
obtained by deriving H^0f_! on the pro-étale site. For f^!, 6.7.18, pp.57–58
locally factors the map into a closed immersion and a smooth morphism.
Smooth purity handles the smooth factor. The closed factor uses localization
and strict scalar/direct-image comparison for its open complement. The
compatible limit and adjunction are 6.7.19, p.58. An appeal to “right adjoints
commute with reduction” would omit this step.

For internal Hom, 6.7.13, p.57 uses stratified dévissage, including exceptional
restriction to strata; a stratum-supported constructible object is not
necessarily globally tensor-dualizable. Common finite strata come from
6.6.11, p.54, and local perfect O-complexes give uniform Tor bounds of the
reductions. Coherence is that of the canonical enhanced exchanges imported
through SF.2, not a selection of unrelated finite-level isomorphisms.

**Check.** At a geometric point, M=O/λ in degree zero is allowed, and ρ_nM
has nonzero H^(−1) and H^0. Smooth f of relative dimension d reduces
f^!O=O(d)[2d] to the trace-normalized O_n(d)[2d]. A smooth divisor/open
complement tests the supported localization triangle, including its boundary.

## 2. Mapping limits and integral trace/class morphisms

**Node:** `mapping-limit-and-integral-class-transport`. Proposed declaration: `adicMappingComplex_limit` in
`TauCeti.EtaleDuality.Comparison`.

For X separated finite type over a **separably closed** k and normalized
M,N, put M_n=ρ_nM, N_n=ρ_nN. For derived global mapping complexes,

\[
\operatorname{RHom}_X(M,N)\simeq
R\!\varprojlim_n\operatorname{RHom}_{X,O_n}(M_n,N_n).
\]

Taking H^0 gives the exact sequence

\[
0\longrightarrow\varprojlim{}^1_n\operatorname{Hom}(M_n,N_n[-1])
\longrightarrow\operatorname{Hom}_X(M,N)
\longrightarrow\varprojlim_n\operatorname{Hom}(M_n,N_n)
\longrightarrow0.
\]

Finite-level shifted Hom groups are finite in this geometric range. The
images in each fixed finite group eventually stabilize, so the inverse system
is Mittag–Leffler and the lim¹ term vanishes. Thus coherent finite-level
trace, evaluation/biduality, cup, smooth-pair Gysin and supported-class maps
have unique integral maps with those reductions. Their finite-level
composition, naturality and projection identities hold integrally. The
classical/pro-étale realization equivalence identifies the actual maps, and
rationalization gives the E-valued maps.

**Proof spine.** Apply the preceding internal-Hom reduction and the imported
derived-complete/global-limit comparison to the mapping complex. Use the
Milnor sequence and geometric finiteness supplied by EllAdicRealization
Layers 0–2 and 6. Transition surjectivity is unnecessary: finiteness gives
stabilization of images. For functor-level transformations, specify the
enhanced compatibility and homotopies first; objectwise Hom-limit uniqueness
then checks their identities. Over an arithmetic field retain the lim¹
obstruction when invoking the imported mapping equivalence. Reduction
conservativity detects isomorphisms, not equality of arbitrary morphisms.
BBD 2.2.16, p.73 explicitly supplies this obstruction; Bhatt–Scholze 6.6.2,
p.52 and 6.7.13, p.57 give the complete/internal-Hom inputs.

Integral cohomology retains the imported EDC.2 derived-duality and Ext¹
sequence. For a perfect O-complex C, coefficient reduction has

\[
0\to H^q(C)\otimes_O O_n\to H^q(C\otimes^L_O O_n)
\to H^{q+1}(C)[\lambda^n]\to0.
\]

For a smooth pure-d-dimensional X and finite-free lisse F, the existing
EDC.2 integral pairing consequently has

\[
0\to\operatorname{Ext}^1_O(H_c^{2d-i+1}(X,F),O)
\to H^i(X,F^\vee(d))
\to\operatorname{Hom}_O(H_c^{2d-i}(X,F),O)\to0.
\]

This imports the existing integral pairing theorem. It does not replace it
with a rational vector-space argument.

**Check.** For C=O/λ in degree zero, RHom_O(C,O) has H^1=O/λ and H^0=0;
derived reduction of C has H^(−1)=H^0=O/λ. This distinguishes Ext from an
ordinary dual. On P¹, every reduction of the trace of c₁(O(1)) is 1 and the
integral trace is 1. An open curve tests compact-support localization, and a
smooth divisor tests the supported class before forgetting support.

## 3. Finite coefficient extension and algebraic closures

**Node:** `coefficient-extension-duality-and-classes`. Proposed declaration: `dualityAndClasses_coefficientExtension` in
`TauCeti.EtaleDuality.Comparison`.

For finite E⊂E′ with integer rings O⊂O′, finite free scalar extension
commutes with f^*, Rf_*, Rf_!, f^!, internal Hom, K_X and D_X in the
bounded constructible adic range of §1. It carries the actual trace,
evaluation, biduality, cup, Gysin and cycle-class maps to the corresponding
O′-maps. After inverting ℓ the same assertions hold for E→E′.

If λ′ is a uniformizer of O′ and e the ramification index, reduction uses

\[
O/\lambda^n\longrightarrow O'/\lambda^nO',
\qquad \lambda^nO'=(\lambda'^{en}).
\]

The λ^nO′ tower is cofinal in the λ′-adic tower. It is not generally the
level O′/(λ′)^n. The integral comparison records this cofinal reindexing
and the coefficient associators.

**Proof spine.** Finite free extension can be computed as a finite direct
sum after choosing a basis, proving invertibility of the canonical O-linear
operation exchanges. Apply §1 along the cofinal tower. Compare adjunction
units/counits and evaluation under these exchanges; their mates give the
trace and duality identities. The finite-level EDC.3 construction supplies
class compatibility. The resulting isomorphisms are independent of the basis.
Bhatt–Scholze 6.8.2, pp.58–59 and 6.8.14–6.8.15, pp.61–62 supply the coefficient
categories and finite descent; BBD 2.2.18, p.73 and 6.1.2(C′), pp.150–151
identify the rational constructible range.

These canonical enhanced operation and mate identities hold over arbitrary
k in the stated range. Their proof does not use the geometric Hom-limit
uniqueness consequence of §2, which requires separably closed k.

The algebraic-closure category is the imported filtered category over finite
subextensions E′/E. Every specified bounded constructible object, morphism
and finite diagram descends to one finite subextension, with its finite
coherence data. This does not mean all analytic local systems belong to the
rational Artin image: retain the stable-lattice restriction of the imported
comparison. Nor does coefficient extension preserve simplicity in general.

The existing `rational-perverse-coefficient-extension` supplies t-exactness,
j_!* and IC compatibility, and finite-extension Hom base change. Integral
reduction O→O/λ is different: it has perverse amplitude [−1,0] on the
integral heart in EDC.5's stated range and is not flat coefficient extension.

**Check.** O/λ extends to O′/λO′, of length e over O′; replacing it by
O′/λ′ loses torsion information. The P¹ Chern-class trace stays 1 in O′
and E′. A divisor tests extension of the supported boundary/Gysin map.

## 4. Tate coefficients and complex orientation

**Construction node:** `complex-tate-orientation-identification`. Proposed declaration: `tateOrientation_finite` in
`TauCeti.EtaleDuality.Comparison`.

Let X/C be smooth separated finite type, of pure complex dimension d.
Its analytification is a Hausdorff second-countable complex manifold of real
dimension 2d, with the local orientation system or_X supplied by the
existing topology owners. For ζ_n=exp(2πi/ℓ^n), define

\[
\theta_{X,n}:(\mathbf Z/\ell^n(d))^{an}\xrightarrow{\sim}
\mathrm{or}_X\otimes\mathbf Z/\ell^n
\]

by sending ζ_n^(⊗d) to the positive complex local orientation generator.
The intrinsic convention is Z(1)=2πiZ from the exponential sequence, and
Z(d) is its d-fold tensor. Identify this line with or_X. The normalized
topological realization of EllAdicRealization Layer 10 carries the compatible
θ_n to Z_ℓ, then to O,E and their finite extensions.

The coefficient sheaf is componentwise on disconnected X. A local orientation
system on a noncompact manifold does not supply a global ordinary-homology
fundamental class. In d=0 the constant-system comparison uses the actual
Mathlib `Scheme.ellAdicSheaf`; no second continuous-coefficient sheaf is
defined. Its cohomological specialization uses `Scheme.EllAdicCohomology`.

**Construction spine and locator.** The exponential/Kummer comparison
identifies the finite Tate generator with the reduction of 2πi. Complex
coordinates give the positive real ordered basis (1,i) in each complex
factor. Holomorphic changes of coordinates have positive real determinant,
so these local orientations glue. Their ordered products identify Z(d)
with or_X. Reduction and scalar extension use the imported normalized
realization. BBD 6.1.4, pp.151–152 gives precisely this Tate/orientation and
trace normalization. Finite/adic Artin comparison alone would leave a unit
ambiguity in a chosen untwisting.

Uses are the supported trace/class theorem in §5, the orientation/divisor
normalizations requested by `LefschetzPencilsAndVanishingCycles:LPV.6`, and
coefficient extension in §3. The proposed API serves these uses:

| Name | Mathematical interface |
| --- | --- |
| `tateOrientation_finite` | Expose θ_n and its value on ζ_n^(⊗d). |
| `tateOrientation_ext` | Coefficient-sheaf maps from the Tate line agree if they agree on ζ_n^(⊗d) in every stalk; the prescribed local-generator map is unique. |
| `tateOrientation_reduction` | Direct and repeated reductions of θ agree, including the triple-reduction coherence. |
| `tateOrientation_etalePullback` | Étale pullback between smooth pure-d-dimensional schemes preserves θ, with identity/composition compatibility. |
| `tateOrientation_product` | θ_(X×Y) is θ_X⊠θ_Y under the ordered real product orientation and Tate tensor identification. |
| `tateOrientation_coefficientExtension` | Extension Z_ℓ→O→O′ and E→E′ preserves the maps, through the existing constant-system realization. |
| `tateOrientation_changeGenerator` | Replacing a compatible generator ζ by ζ^u, u∈Z_ℓ^×, multiplies the fixed-positive-orientation untwisting map by u^(−d). |
| `tateOrientation_conjugation` | The antiholomorphic map X^an→(conjugate X)^an changes both generators by (−1)^d; the intrinsic twisted comparison commutes with it. No real descent is assumed. |

**Unit tests.**

1. `tateOrientation_point`: for a point, d=0 and θ is the identity, independently
   of roots. The integral constant realization agrees with the imported native
   continuous Z_ℓ-sheaf comparison.
2. `tateOrientation_line_sign`: on A¹(C), ζ_n maps to the orientation of
   (1,i). The ordered basis (1,−i) gives its negative.
3. `tateOrientation_product_two_lines`: on A²(C), the product of the two
   positive line orientations is the positive real four-dimensional orientation;
   simultaneous conjugation preserves it.
4. `tateOrientation_changed_root`: for d=1, ℓ=5 and ζ′_n=ζ_n², the new
   fixed-orientation map is 2^(−1) times the old map modulo 5^n. An unchanged
   map sends the new generator to 2 and fails the normalization.

## 5. Complex supported classes and compact-support duality

**Node:** `complex-supported-class-transport`. Proposed declaration: `artinComparison_supportedClasses` in
`TauCeti.EtaleDuality.Comparison`.

Let X/C be smooth separated finite type of pure dimension d and i:Z→X a
smooth closed immersion of pure codimension c. For Λ=Z/ℓ^n, O or E,
use finite Artin comparison from ComplexComparison Layers 10–12 and
normalized topological realization from EllAdicRealization Layer 10.
The Tate/orientation comparison identifies

\[
i^!\Lambda_X\simeq\Lambda_Z(-c)[-2c]
\]

with topological smooth-pair purity from the complex normal orientation.
The supported fundamental class

\[
\eta_Z\in H_Z^{2c}(X,\Lambda(c))
\]

corresponds to the supported Thom class. Forgetting support identifies
cl_X(Z), and the associated Gysin morphism agrees with the topological
Gysin map. Kummer c₁ corresponds to topological c₁. For a smooth divisor D,
both sides therefore identify cl_X(D) with c₁(O(D)).

The comparison identifies the smooth dualizing complex Λ(d)[2d], the
compact-support trace, cup/evaluation pairing and **derived** compact-support
duality. For nonproper X this uses local orientation and compact support. For
proper X it specializes to the oriented global fundamental class. Tensor and
evaluation inputs satisfy actual finite-Tor bounds; over O use its regularity.
The general singular-cycle extension is imported from EDC.3 with its
semi-purity and rational-equivalence hypotheses.

**Proof spine.** Finite Artin comparison preserves the closed/open localization
triangle and proper-support functor. BBD 6.1.2(A′–C′), pp.149–151 compares
constructible categories and their operations in the finite-Tor range.
For exceptional pullback start at finite coefficients: locally factor into
a closed immersion and a smooth map, use localization for the closed factor
and purity for the smooth factor, as in the proof of 6.1.2 on p.151.
Apply smooth purity and §4 to the absolute dualizing object.
For a smooth pair, local normal coordinates reduce the class to the positive
local generator of C^c. Glue through supported localization and the EDC.3
fundamental-class construction. BBD 6.1.4, pp.151–152 compares the trace with
local orientation integration; compatibility with cup/evaluation gives the
derived duality square. Pass the coherent finite-level exchanges through the
requested normalized topological O-realization, using strict reduction and
completeness; §2 verifies the specified integral maps over C. Rationalize and
extend finite coefficients via §3. At E-level retain the stable-lattice Artin
essential image of 6.1.2(C′). This argument does not require an equivalence with
all analytic E-local systems or a right adjoint between arbitrary bounded
restrictions. The divisor calculation
uses the Kummer/exponential diagram before support is forgotten.

**External input.** AlgebraicTopology Stage 6 supplies relative cochains,
products and local orientation. Its stated compact-manifold duality is not the
full noncompact finite/integral sheaf duality or normal-bundle Thom/Gysin API
used here. The exact **Algebraic topology, Part II: supported classes and
noncompact integral manifold duality** request is a recorded gap. The theorem
above is conditional on that interface, together with the registered generic
Artin/adic realization imports; this packet does not invent a general
category of topological six operations.

**Check.**

- P¹(C) has positive c₁(O(1)), with trace **+1** at finite, integral and
  rational levels.
- For U=P¹ minus r≥1 distinct points, H_c²(U,Λ(1))=Λ with trace 1 on the
  positive generator. Localization has Λ→Λ^r→H_c¹(U,Λ), with diagonal
  first map. Ordinary H²(U,Λ)=0. These assertions also distinguish A¹
  (r=1) from G_m (r=2).
- A smooth divisor in smooth proper X compares first in H_D²(X,Λ(1)):
  its positive supported/Thom class maps by both routes to c₁(O(D)). The
  un-twisted topological value uses θ and the chosen root convention.
- Trace on disconnected X sums component traces. A one-copy top-degree
  coefficient conclusion requires connectedness.

## 6. Analytic smooth trace on actual algebraic models

**Node:** `analytic-smooth-trace-comparison`. Proposed declaration: `analytification_smoothTrace` in
`TauCeti.EtaleDuality.Comparison`.

Let k be complete, nontrivially rank-one valued and nonarchimedean,
f:X→Y separated finite type and smooth of
pure relative dimension d between finite-type k-schemes. Use the actual
analytification over Spa(k,k°). Assume f^an is taut and its target is
quasi-separated. For Λ=Z/n with n prime to the **residue characteristic**,
and bounded-below L, the proper-support comparison identifies

\[
(Rf_!K)^{an}\simeq Rf^{an}_!(K^{an}).
\]

It carries the scheme smooth trace
Rf_!f^*L(d)[2d]→L to Huber's analytic trace. The trace-normalized adjoint
purity maps on the two sides agree. For bounded constructible duality restrict
to actual finite-Tor input. For a smooth algebraic closed pair, its supported
fundamental class and Gysin compare with the corresponding analytic maps.

**Proof spine and exact supplier.** Huber 5.7.2 and 5.7.5, pp.316–318
compare proper support on algebraic models and its pseudo-adic version.
The all-dimensional smooth trace is **7.3.4**, pp.378–382: its local étale
charts over affine space use the algebraic trace under the proper-support
comparison, and its normalizations/base-change/composition make them glue.
The curve trace 7.2.2 is not the locator for this dimension-d statement.
Theorem 7.5.3 and Lemma 7.5.4(ii) and its proof, pp.390–392 identify the trace with the
exceptional adjunction counit; taking its trace-normalized adjoint identifies
smooth purity. For a smooth closed pair, apply transitivity of exceptional
pullback to the two smooth structure maps and their purity formulas. The
closed/open localization comparison then identifies the EDC.3 supported
class/Gysin construction. This argument uses smooth pairs, not general
analytic absolute purity.

Import the actual fibre-product analytification from
`AdicSpacesPartII:R1/scheme-fibre-product-analytification`, and the nodes
`ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2` and
`ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1`.
H3 already supplies `general-analytic-smooth-trace`, including chart
independence, composition, pullback transformations and the P¹ normalization,
and `analytic-first-chern-class`, including its scheme Kummer comparison.
Import these exact nodes. The general shifted-constant trace exists in a
broader coefficient range; it does not assert arbitrary-sheaf duality.
The **H3:smooth-duality** request is narrowed to algebraic proper-support
comparison, comparison with Huber's normalized trace, and the full D⁺ smooth
adjunction of 7.5.3–7.5.4 in the stated prime-to-residue range. It passes through
the registered H3 stage; the extra interface is not claimed to be delivered.

Huber 3.7.2, pp.226–227 treats proper torsion comparison in a broader
coefficient range. The finite-type field direct-image theorem 3.8.1,
pp.227–228 requires prime-to-char(k) torsion in positive characteristic;
in characteristic zero its range can include residue-characteristic torsion.
This does not enlarge the coefficient range of smooth purity/trace.

**Check.** P¹_k has matching scheme/analytic finite trace of c₁(O(1)) equal
to 1. A¹_k and G_m,k test compact-support localization and the curve trace.
A smooth algebraic divisor tests the same supported class after actual
analytification. A rigid closed disc is not declared the analytification of
A¹_k, and an arbitrary analytic space is not assigned a model.

The extension to O or E is a separate exact gap: it needs a normalized
analytic coefficient realization, common strata and uniform ordinary/Tor
bounds, strict reduction of Rf_! and f^!, and coherent traces. Generic
scheme/pro-étale EllAdicRealization is not that analytic coefficient category.
The proposed **Classical adic étale cohomology, Part II: normalized analytic
coefficients and duality** owns this extension.

## 7. Scheme/diamond trace mates and the image condition

**Node:** `diamond-trace-mates-and-image-condition`. Proposed declaration: `diamondComparison_traceMates` in
`TauCeti.EtaleDuality.Comparison`.

Let f:Y→X be separated finite type between qcqs characteristic-p schemes,
or the perfection of such a morphism. Use the eligible discrete prime-to-p
or regular adic coefficients of AdicCoefficientsAndComparisons. The diamond
map is compactifiable, representable in locally spatial diamonds and of finite
dim.trg, as in ECD 27.4. Write F=Rf_!, F◇=Rf◇_!, and
c_X^*⊣Rc_X*, c_Y^*⊣Rc_Y*. The imported proper-support comparison and
its right-adjoint mate are

\[
\alpha:c_X^*F\simeq F_\diamond c_Y^*,\qquad
\beta:f^!Rc_X*\simeq Rc_Y*(f_\diamond)^!.
\]

This is not a c_Y^* exceptional-pullback identity. There is also a canonical
map δ_C:F Rc_Y*C→Rc_X*F◇C: its adjoint is α followed by
F◇ of the counit c_Y^*Rc_Y*C→C. For B on X◇, the equation of
exceptional counits is

\[
\varepsilon_{\mathrm{scheme},Rc_X*B}
=
Rc_X*\varepsilon_{\diamond,B}\circ
\delta_{(f_\diamond)^!B}\circ F(\beta_B).
\]

Each side has source F f^!Rc_X*B and target Rc_X*B. The right-hand side
recovers the **actual trace**, not just an exceptional object. For
Y→Spec k use B=c_k^*Λ with its actual diamond base. The unit of the
fully faithful c_k^* recovers K_Y. The imported internal-Hom identity

\[
Rc_Y*\operatorname{RHom}(c_Y^*M,C)
\simeq\operatorname{RHom}(M,Rc_Y*C)
\]

then recovers scheme Verdier duality and its evaluation morphism.

For A on X, the desired strong comparison

\[
c_Y^*f^!A\longrightarrow (f_\diamond)^!c_X^*A
\]

is formed from the scheme unit, β and the counit at the diamond exceptional
object. It is an isomorphism **precisely when that object is in the essential
image of c_Y^***, in the full-faithfulness range. The internal-Hom object
needed for strong duality has the same separate requirement. The pinned
Mathlib counit/essential-image criterion makes this condition explicit.

**Proof spine and locators.** Use the exact L3 nodes
`full-faithfulness-27-2`, `rf-shriek-comparison-27-4`,
`internal-Hom-right-adjoint`, and `commutation-and-adjoints-27-1-27-3`.
Adjunction mates and their triangle identities give the displayed counit
formula. ECD 27.1–27.4, pp.163–165 provide these comparisons; 27.1 provides
pullback/tensor, and 27.3 provides the right-adjoint internal-Hom/direct-image
identities. Neither full faithfulness nor Rc_* recovery proves geometric
preservation of the image.

Over a complete DVR with perfect residue field, use
`AdicCoefficientsAndComparisons:L4/proper-support-comparison-27-5` for α,β,
and the exact L6 `constructible-direct-image-comparison-27-6` and
`constructible-full-faithfulness-27-7` in their **bounded constructible finite
prime-to-residue-characteristic** range. ECD 27.5–27.7, pp.166–168 supplies
these statements. The characteristic-p and DVR constructions of (Spec k)◇
have different plus-ring conventions; retain the supplier's actual base.
Use the ambient adjunction and L6 to check the scheme unit on the particular
bounded constructible objects A and T=f^!A, with their actual constructibility
and finite-Tor witnesses. Put B=(f◇)^!c_X^*A. The unit at A and β give a
recovery isomorphism e:Rc_Y*B≃T. If the unit at T is invertible, the triangle
identities give the precise criterion

\[
c_Y^*T\longrightarrow B\text{ is invertible}
\quad\Longleftrightarrow\quad B\simeq c_Y^*T.
\]

This uses the **particular recovered candidate**, rather than membership in
the image of an unspecified nonconstructible scheme object. The second Lean
end milestone states this pointwise criterion without ambient full faithfulness.
Do not
postulate a right adjoint between restricted bounded constructible categories,
or global ambient full faithfulness in mixed characteristic. The
mixed-characteristic statement does not acquire arbitrary adic coefficients
from a finite-coefficient full-faithfulness theorem.

**Check.** For f the identity, the mates and recovered counit are identities.
For f étale, f^!=f^* and the pullback comparison gives strong transport in
this restricted case. For P¹ in characteristic p, recovery through Rc_*
carries the scheme trace of c₁(O(1)) to 1. It does not assert an unproved
absolute diamond dualizing-object formula.

A concrete categorical non-example is the inclusion of the zero-object
category in vector spaces: it is fully faithful and has a right adjoint
sending every vector space to the zero object. Its counit 0→V fails to be an
isomorphism for nonzero V. Right-adjoint recovery therefore cannot establish
membership in the essential image. The compact Lean milestone records this
exact criterion for a comparison built from a recovery isomorphism.

## Coverage, planets and routing

All four groups of the stage's targets are accounted for:

| Stage target | Existing import and new refinement |
| --- | --- |
| Normalized systems, limits/tensor and uniform bounds | Existing normalized-system/category nodes; §§1–2. |
| Integral torsion, classical/pro-étale duality and extension to algebraic coefficients | Existing adic/perverse/pairing nodes; §§2–3. |
| Complex trace, cycles, orientation, cup and compact-support duality | Existing complex comparison; §§4–5 and the exact topological extension request. |
| Scheme/adic/diamond operations, with actual models and source hypotheses | Existing operation index and Rc_* recovery; §§6–7. |

There are four new planets: **Integral reduction of Verdier duality**,
**Integral trace and Gysin comparison**, **Tate twists and complex orientation**,
and **Trace and fundamental class comparison**. Retain the two inherited
planets **Normalized constructible adic systems** and **Comparison with complex-analytic
sheaves**, using their original names/ids. The combined EDC.6 layer has six.

The four requests are: SF.2's PR196 integration and the precise
**Ell-adic realization, Part II: finite coefficient fields and coherent
constructible realization** extension; AlgebraicTopology Stage 6
with the additional supported/noncompact Part II interface; H3's additional
proper-support comparison/full D⁺ smooth-duality interface; and L3's geometric
exceptional/internal-Hom image theorem. The four gaps are: unregistered
PR196 interfaces and their finite O/E extension, the topological interface,
normalized analytic
integral coefficients, and strong diamond image preservation. EDC.6 is
planned with these precise inputs; it is not closed.

The packet records the missing **AdicCoefficientsAndComparisons:L3 → EDC.6**
edge requested by RT-AREA-etale/17. L4/L6 and H5 supply their distinct
comparison routes. Changing atlas links is the maintainer's action.

RT-AREA-etale/3 and /16 already have detailed Part II proposals in the EDC.0
packet's first two restructuring entries. Preserve those owners: the stacks
Part II owns enhanced six operations, perverse IC, DM decomposition and
correspondence traces on Artin/DM stacks. No blanket preservation of bounded
categories by all six operations on arbitrary Artin stacks is asserted:
retain stabilizer, representability, coefficient and support hypotheses at
each use. The perfect-space Part II owns
model-independent perfect pfp transport, characteristic classes and
finite-level equivariant perfection, importing GS0:Witt-geometry and L2.
Common equivariant operations are imported from stacks. Model independence
uses common finite-presentation models and canonical comparison maps;
equivariant descent remains finite-level. Scheme-level Braden
hyperbolic localization keeps its G_m-monodromic hypothesis and Zhu Appendix
A.3 normalization/connected-kernel inputs, and belongs to that extension; EDC.7
retains its finite-type inputs. These proposals route GS.1/GS.3, ET.2b,
WC.6 DM purity, EDC.8 items YUN-ZHANG-17/35, YUN-ZHANG-19/120 and LAFFORGUE-18/48,
ShtukaSpecialCyclesAndHigherSiegelWeil and RamifiedGeometricClassFieldTheory.
This packet supplies scheme comparison inputs to them without a second plan.

## Source versions and checks

The statements above are given in our own words. Source numbers use the
specified editions:

- Bhatt–Scholze, [*The pro-étale topology for schemes*, arXiv v2](https://arxiv.org/pdf/1309.1198v2):
  6.5.11 p.51; 6.6.2 p.52; 6.6.11 p.54; 6.7.1–6.7.19 pp.55–58;
  6.8.14–6.8.15 pp.61–62. Read the surrounding definitions and proofs.
- BBD, [*Faisceaux pervers*, Astérisque 100](https://www.numdam.org/item/AST_1982__100__1_0.pdf):
  §2.2 derived coefficient Tor formula p.72; 2.2.16–2.2.18 p.73;
  6.1.2–6.1.4 pp.149–152. Printed pages are one less
  than PDF pages in this scan.
- Scholze, [*Étale cohomology of diamonds*](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf),
  manuscript dated 14 April 2026: 27.1–27.7 and proofs, pp.163–168.
- Huber, [*Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*](https://doi.org/10.1007/978-3-663-09991-8),
  Vieweg 1996: 3.7.1–3.8.1 pp.225–228; 5.7.1–5.7.5 pp.316–318;
  7.3.4 and proof pp.378–382; 7.5.1–7.5.4 pp.389–392, including the proof of
  the counit identification in 7.5.4(ii). The maintainer-cleared
  copy was read in place; no source passages or files accompany this job.
- PR196 [EllAdicRealization](https://github.com/bwangpj/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md)
  Layers 0–10 and [ComplexComparison](https://github.com/bwangpj/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison/README.md)
  Layers 0–12: full readers and suggested files read as ownership/interface
  specifications, not as implemented theorems. Accessed 2026-10-13.

The blueprint checker reports zero errors and zero warnings. The suggested
Lean file elaborates at the pinned Mathlib with only two unproved-theorem
warnings. It has two end theorems and five examples over native functors and
adjunctions, no new definitions or stand-ins for unavailable carriers.
