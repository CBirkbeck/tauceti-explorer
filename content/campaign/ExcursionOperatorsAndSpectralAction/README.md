# Roadmap: excursion operators and the spectral action

Build the natural endomorphism algebra and categorical action furnished by coherent
Hecke operators. The goal is reusable spectral infrastructure, including its integral
hypotheses, not the conjectural full categorical local Langlands equivalence.
Dependencies: [HeckeStacksAndLocalShtukas](../HeckeStacksAndLocalShtukas/README.md),
[LanglandsParameterStacks](../LanglandsParameterStacks/README.md),
[VStackSheavesAndLisseCategories](../VStackSheavesAndLisseCategories/README.md),
[EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md), and
[SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md).
For the proved GL_n comparison only, import
[EndoscopicTransferAndUnitaryTraceComparison ET.6/ET.6a](../EndoscopicTransferAndUnitaryTraceComparison/README.md#et-6a).
The exact geometric imports are HS1+HS4's coherent Hecke family, VS4's compact
generation and stratum embedding, and GS4's dual-group/Weil normalization. LP2 supplies
excursion characters and LP4 the separate categorical universal property.

The general theorem has a small idempotent-complete Lambda-linear stable infinity
category C and a coherent finite-set family of exact Rep_Lambda(Q^I)-linear monoidal
Hecke functors Rep_Lambda((dual G semidirect Q)^I) → End_Lambda(C) with continuous
W_E^I action. Q is the finite quotient defining the pinned action. For Bun_G use the
compact subcategory of D_lis (VS4). Include a chosen square root of q in the normalized
coefficient field. **For ES3's integral categorical-action theorem**, coefficients are integers in a finite extension of
Q_ell(sqrt(q)), with ell != p and ell not dividing |pi_1(dual G)_tors|. The rational
version allows every ell != p without that torsion-order restriction. These restrictions
are not imposed on every earlier stage: HS1/ES0 work with Z_ell[sqrt(q)]-algebras;
ES5's Schur-irreducible theorem works over algebraically closed L of characteristic
different from p, including characteristic ell. Spectral-center maps carry their
separate |π₀Z(G)|-invertibility condition; otherwise use excursion algebras.

## ES0. Centers and excursion algebra

Inputs: HS1, HS4, VS4, LP2:excursion-presentation, E5:abstract and SR.0's category.
No Perf action, semisimple assignment or characteristic-zero Bernstein decomposition
is assumed here.

Define the algebra of natural endomorphisms of the identity, its centrality and scalar
structure on the chosen enhanced category. Compare the degree-zero center with the
ordinary smooth-representation Bernstein center in the exact domain where used.
Separate an endomorphism of one object from a natural endomorphism of all objects.

Construct excursion operators from a finite leg set, a matrix coefficient/invariant
function, creation by a coevaluation map, the prescribed tuple of Weil elements and
annihilation by evaluation. Prove independence of the representation realizing the
function using the parameter algebra's presentation. Establish linearity, multiplication,
reindexing, unit insertion and composition relations, including twisted conjugation
for nonsplit G. Prove continuity in Weil variables in the specified topology.

<a id="stage-ES0:classical-center"></a>
### ES0:classical-center — A coefficient-qualified comparison return

After the operator construction, compare with SR.3's classical Bernstein-block
description over complex coefficients, through the stipulated characteristic-zero
coefficient dictionary. This return imports ES0 and SR.3; neither the ES0 operator
construction nor ES5's characteristic-ell parameter theorem imports this comparison.
The center of the smooth category itself is already defined over the coefficients
allowed in SR.0 and does not require a complex block classification.

## ES1. Spectral center and finite ramification

<a id="es1-finite-ramification"></a>
<a id="stage-ES1:finite-ramification"></a>
### ES1:finite-ramification — Objectwise cutoffs and components

From ES0/HS4 prove IX.5.1's single wild subgroup P for all representations V and
finite leg sets on each compact A: reduce to a tensor generator and use compactness
in the condensed endomorphism algebra. Construct the component decomposition of
compact D_lis as a direct sum and of its Ind-category as a product; do not assert
that every noncompact object has one finite-wild cutoff.

<a id="es1-spectral-center"></a>
<a id="stage-ES1:spectral-center"></a>
### ES1:spectral-center — The conditional invariant-coordinate map

When |π₀Z(G)| is invertible in Λ, use LP2:integral-invariants to construct the map from functions on the parameter
stack to the categorical center, then to the relevant Bernstein center through the
stratum and smooth-representation comparison. Prove compatibility with Hecke functors,
coefficient change and passage between finite-wild pieces. For every compact object
prove factorization through a single sufficiently small wild-inertia quotient; finite
ramification is a theorem, not a global finite-type assertion about the whole parameter
stack (FS IX.5.2). Without that condition retain the excursion-algebra map, sufficient
for ES5. The semisimple assignment and its proven properties are ES5–ES7, not an
unstated consequence of a universal full Weil–Deligne classification.

## ES2. Rational categorical action

Inputs: ES0, ES1:finite-ramification, LP4 and E5:abstract/E5:presentability. Agreement
with the spectral center uses ES1:spectral-center in its valid coefficient range.

For characteristic-zero coefficients prove the universal theorem of FS X.1: coherent
finite-set Hecke data gives an action of Perf of the derived mapping/parameter stack.
Construct the action through the finite-free-group and affine quotient presentations;
prove descent, independence, exactness, monoidal coherence and the unit. Conversely
recover the Hecke family from the universal parameter and prove the two constructions
are inverse as spaces of coherent data, not just bijections of isomorphism classes.

Establish compact support object by object over the non-quasicompact parameter union.
Prove agreement of the degree-zero action with ES1, and compare representation bundles
with the Satake/Hecke operations already constructed. The existence of this action
does not construct an equivalence from all sheaves on Bun_G to coherent spectral sheaves.

## ES3. Integral categorical action

Inputs: ES0, ES1:finite-ramification, LP3–LP4 and E5:abstract/E5:presentability.

Prove the finite-free-group descent and generation statement using LP3–LP4's integral
good-filtration and Donkin-subgroup results. Carry the assumption
ell not dividing |pi_1(dual G)_tors| at every step requiring it. Construct the integral
Perf action and its equivalence with coherent Hecke data in FS X.0.1–X.0.2/X.3, including
derived reduction and comparison with rationalization. The proof cannot invert ell
to discharge an integral generation or base-change theorem.

Construct the compatibility maps for change of coefficient extension, finite pinned
action quotient and finite-wild cutoff. Verify that all comparisons use the same
universal parameter and the same normalized Hecke kernels. A fully faithful action
or a categorical Langlands equivalence is not inferred from a monoidal action functor.

## ES4. Spectral support and reusable consequences

Inputs: ES1's eligible center map, ES2 or ES3 according to coefficients, VS5, GS4
duality, and HS3 for local-shtuka applications. It is not a prerequisite of ES5.

Construct support of an object via annihilators/central functions on finite-wild pieces,
functoriality under exact triangles, retracts and coefficient change, and the associated
localization/decomposition operations in the cases justified by the parameter-stack
geometry. Prove compatibility of duality with the Chevalley/contragredient involution.
For local shtuka cohomology recover the resulting commuting excursion operators and
their compatibility with the two smooth group actions through the Hecke comparison.

These are general infrastructure theorems. Identifying a particular classical packet,
proving a full categorical equivalence, or proving a conjectural eigensheaf statement
is outside this roadmap's acceptance conditions.

## ES5. The proved semisimple parameter assignment

Inputs: ES0, LP2:semisimple-characters and VS4. For an algebraically closed
Z_ell[sqrt(q)]-field L and A in D_lis(Bun_G,L) with `End(A)=L` as **condensed
algebras**, construct FS Definition/Proposition IX.4.1's continuous semisimple
parameter `φ_A:W_E→dual G(L)⋊Q` with its prescribed projection. Uniqueness means
uniqueness up to dual-G conjugacy, not a canonical representative. Prove the defining
identity for every excursion datum `(I,V,α,β,(γ_i))`: the creation–Weil–annihilation
endomorphism of A equals the scalar obtained by evaluating V on `(φ_A(γ_i))`.

Produce the excursion character using the Schur condition, prove its relations and
continuity, then apply LP2's geometric character theorem. Prove invariance under
isomorphism of A and coefficient transport through specified algebraically closed
extensions when Schur irreducibility is retained. Do not assert that extension of
scalars preserves irreducibility automatically.

For every irreducible smooth L-representation π of G_b(E), use VS4's fully faithful
stratum embedding (left adjoint of i_b* as in VII.7.2) to obtain a Schur object and
define `φ_(G,b,π)`. Prove the Schur/condensed scalar-endomorphism fact on the actual
representation category and independence of the eligible embedding at the center
level. At b=1 write φ_π. The theorem is valid in every characteristic ≠p; do not
import the good-prime condition of ES3. It yields semisimplified Weil data, not a
nilpotent monodromy operator, packets, surjectivity or categorical LLC.

## ES6. Functorial properties of the assignment

<a id="es6-functoriality"></a>
<a id="stage-ES6:functoriality"></a>
### ES6:functoriality — Isogenies, products, restriction, tori and characters

Inputs: ES5, HS4, GS4:integral-dual-group, BG0/BG2 and local class field theory.
Construct the actual maps of Bun/Hecke correspondences and compare their kernels
before evaluating any character. Prove FS IX.6.1–IX.6.5:

- For G'→G inducing an adjoint-group isomorphism, parameters of Schur-irreducible
  constituents of pullback are composed with dual G→dual G'; retain the constituent
  hypothesis, since pullback need not itself be irreducible.
- Product groups give product parameters for Schur-irreducible constituents of
  exterior products, through the product Hecke diagram.
- For finite **separable** E'/E and G=Res_(E'/E)G', construct nonabelian Shapiro
  equivalence, the corresponding Bun identification and the excursion-algebra
  comparison using finite-index subgroups of finite free groups. Prove Weil-restriction
  compatibility including the chosen Weil embeddings.
- For a torus, resolve by induced tori and reduce to G_m. Compute the two-leg
  standard/dual excursion using the explicit line-bundle calculation. Prove the
  spectral-to-geometric torus center map is diagonal and φ_χ equals local class
  field theory with the fixed geometric-Frobenius normalization.
- Derive twisting through G→G×(G/G_der) and central-character compatibility through
  Z×G→G; for disconnected center construct and compare z-embeddings as in IX.6's
  final paragraph and Kaletha §5. These z-embedding and rational-point-surjectivity
  lemmas are obligations here on BG0's reductive carriers, not an assumed functorial LLC.

For center-level diagrams impose |π₀Z(G)| invertible (and the analogous conditions
for participating groups) wherever IX.5.2 is used. Prove their excursion-algebra
versions without that restriction, yielding the field-valued statements for all ℓ≠p.

<a id="es6-duality"></a>
<a id="stage-ES6:duality"></a>
### ES6:duality — Contragradients with the correct proof return

Use VS5 and GS4's Chevalley/sw comparison to prove IX.5.3 for the Bernstein–Zelevinsky
dual and hence parameters of supercuspidal smooth duals. The general smooth-dual
compatibility additionally imports ES7:parabolic and the existing representation-theoretic
duality/induction theorem. ES7:parabolic imports only ES6:functoriality, not this late
return. Preserve the Chevalley involution in the dual parameter.

## ES7. Bernstein-stratum normalization and the classical GL_n comparison

<a id="es7-parabolic"></a>
<a id="stage-ES7:parabolic"></a>
### ES7:parabolic — Stratum maps and parabolic induction

Construct Ψ_G and Ψ_G^b from ES1:spectral-center and VS4's stratum embeddings
(IX.7.1). When the center-order condition fails construct the same diagrams with
excursion algebras. Using ES6:functoriality, BG1–BG4, HS4 and GS4's Levi constant
term, prove IX.7.2: the Ψ_G^b map factors through Ψ_(G_b) with the **twisted**
Levi cocycle inclusion
`φ(w) ↦ (2ρ_(dual G)−2ρ_(dual G_b))(sqrt(q))^deg(w) · φ(w)`,
where deg sends geometric Frobenius to 1. Prove this is a cocycle for the fixed
pinned actions. Basic-inner-form invariance is the basic case, not the general case.

Construct the increasingly unstable sequence b_N, prove bounded self-modifications
eventually preserve its canonical parabolic, and identify the constant-term Hecke
diagram. Track the degree shift and why excursion creation/annihilation lies in the
degree-zero component. Deduce IX.7.3 for **unnormalized** parabolic induction and
every irreducible subquotient. Then prove the dictionary with the local-group owner's
normalized induction (SR.1–SR.2): the square-root modulus and cyclotomic twist must
cancel in precisely the stated convention. Do not silently call the source formula
normalized induction or omit the twist.

<a id="es7-gln-comparison"></a>
<a id="stage-ES7:GLn-comparison"></a>
### ES7:GLn-comparison — Proved characteristic-zero agreement

For E/Q_p import ET.6's independent classical LLC/Jacquet–Langlands and
ET.6a's **two-tower cohomological realization**, plus HS2–HS3's identification of
the minuscule Hecke fibres with these moduli. For π supercuspidal and σ=JL(π) on
the division algebra of invariant 1/n, identify the two Hecke operations with
π⊗ρ_π and σ⊗ρ_π^∨, including shifts [n−1] and the half Tate twist. Identify the
unit/counit scalars by evaluation at the identity Weil tuple, and prove the two-leg
excursion equals trace(ρ_π). Use semisimple trace determination and ES5 uniqueness
to obtain φ_π=ρ_π^ss. Extend to **all** irreducible smooth Qbar_ell-representations
by ES7:parabolic and classical segment classification (FS IX.7.4). This does not
recover N or assert integral/mod-ℓ agreement with a stronger correspondence.

<a id="stage-ES7:function-field-automorphic"></a>
### ES7:function-field-automorphic — The required characteristic-p global supplier

Construct the adelic and automorphic theory needed for LRS's central division
algebra over the function field of a smooth projective geometrically connected
curve over a finite field. Define restricted products from curve places, integral
orders, the diagonal embedding, degree/central quotients and compatible Haar
measures. Prove discreteness and compactness modulo center for the division-algebra
quotient; deduce the discrete spectral decomposition, finite multiplicities,
factorization and the kernel trace identity with justified integrability. Reuse
SR.0–2's locally profinite carriers and AS.0's abstract functional analysis, **not**
AF.2–3/AS.6's number-field automorphic theorems. No archimedean Lie-algebra or
moderate-growth definition is silently transported to this field.

Build the Euler–Poincaré/weakly cuspidal local functions and their orbital/character
identities used in LRS §13 and §15. Prove the required simple trace comparison,
local-to-global existence with prescribed supercuspidal places, and the specific
GL_n/inner-form transfer used to select the globalizations in §15. This is a
construction in the stated division-algebra/simple-trace range, not a general
function-field Arthur invariant trace formula. Retain the auxiliary-place,
central-character and local-transfer assumptions until each is proved. In
particular LRS's remarks concerning an unproved general global Jacquet–Langlands
correspondence cannot be used as theorems. For the local realization use the
selected globalizations in the proven transfer image; do not assert multiplicity
one or arbitrary automorphic isotypic concentration for every division-algebra
constituent. This also avoids treating the source's unpublished invariant ample
class argument as an available proof. Generic finite-field purity, duality and
functional equations are imported from DWP.7–9, EDC.2/8 and WC.2, with the
individual uses (including the corrected dual isotypic pairing) identified below.

<a id="es7-equal-characteristic"></a>
<a id="stage-ES7:equal-characteristic"></a>
### ES7:equal-characteristic — Separate realization for E=F_q((t))

The general-E conclusion requires the equal-characteristic classical realization,
not ET.6's p-divisible-group construction. Own that additional proof route here:
construct D-elliptic sheaves and level moduli over a function-field curve, their
Frobenius/Hecke correspondences and local deformation spaces; prove the required
uniformization by Drinfeld/local-shtuka towers; calculate the supercuspidal
isotypic compact-support cohomology with its three commuting actions by the
Laumon–Rapoport–Stuhler/Hausberger Drinfeld–Carayol argument. Include purity,
finiteness, automorphic decomposition and the local character identity before the
realization is exported; import ES7:function-field-automorphic and the specified
DWP/EDC interfaces. The specialized D-elliptic moduli, uniformization and
comparison proofs are not assumed in the number-field automorphic roadmaps.
Transport this realization to HS3 and repeat ES7:GLn-comparison's trace argument.
Sources: LRS93, *D-elliptic sheaves and the Langlands correspondence*, Invent.113,
217–338, especially §§4–6 (moduli), §14 (global cohomology) and the local consequences;
Hausberger 2005, *Uniformisation
des variétés de Laumon–Rapoport–Stuhler et conjecture de Drinfeld–Carayol*,
Ann. Inst. Fourier55, 1285–1371: Parts I–II construct formal modules and the
uniformization, §§9–10 construct the three-action cohomology, its global comparison
and cuspidal Hochschild–Serre degeneration. Import the general continuous
Hochschild–Serre construction from ArithmeticGaloisDuality R02.2 and prove this
geometric quotient application here.

The LRS scan must be used with
Kaiser's author-hosted erratum:
an automorphic eigenspace is not self-dual unless its representation is self-dual
up to the required character twist. Replace the L-factor in Corollary 14.11 by
the contragredient expression, and use the amended Lemma 14.14/Proposition 14.17
in Theorem 14.12. The geometric pairing pairs the appropriate dual isotypic
components, not an arbitrary component with itself. The source-access
ledger distinguishes acquired texts from the still required precise proof expansion.
This substantial equal-characteristic extension is not marked delivered merely
because FS IX.7.4 states its result for all E.

## Acceptance and sources

Tests: trivial Hecke representation, torus character parameter, two-leg creation and
annihilation, fusion/reindexing along a noninjective finite-set map, one compactly induced
smooth representation, and integral-to-rational comparison. Test the abstract universal
action theorem separately from its Bun_G application. ES3's integral categorical-action
tests retain ell != p and ell not dividing |pi_1(dual G)_tors|; ES5's geometric-character
tests allow every algebraically closed coefficient field of characteristic different
from p. Test a forbidden ES3 prime without suppressing the still-defined ES5 assignment.
Spectral-center tests separately retain their |π₀Z(G)| condition.

Source: FS VIII.4,
IX.1–IX.7 (especially IX.4.1, IX.5.1–IX.5.3, IX.6.1–IX.6.5 and IX.7.1–IX.7.4)
and X.1–X.3. ES5–ES7 complete the proved semisimple-theorem package, not Conjecture
X.1.4 or the full categorical correspondence. The abstract invariant/derived-stack foundation is LP0–LP4 and
E5, the geometric kernel foundation is GS/HS, and the representation category is the
single local-group roadmap. No endpoint is supplied by a field asserting a spectral
action with unproved properties.

## Completion contracts added on 2026-09-15

**Applies to:** `ES0`, `ES1:finite-ramification`, `ES3`, `ES5`, `ES7:parabolic`, `ES7:equal-characteristic`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For an invariant function construct its realization by representation coefficients and prove independence using the full finite-leg excursion relations. In finite ramification first choose a tensor generator and one compact object, then obtain a uniform wild subgroup across all leg sets; do not choose a subgroup separately for each V. In ES5 prove the condensed Schur endomorphism comparison before extracting a scalar character.

### Producer–consumer contract

The output is a conjugacy class of semisimple Weil parameters. The integral Perf action carries the dual-fundamental-group prime restriction; its existence gives neither full faithfulness nor a categorical equivalence. GlobalShtukasAndFunctionFieldLanglands supplies reusable global geometry; the older ES7 D-elliptic two-tower realization remains a separately required local comparison.

### Acceptance and source route

A nonsplit torus checks twisted cocycles, a forbidden integral prime checks separation from ES5, a noncompact direct sum checks finite-wild cutoffs, and Steinberg checks that semisimplification has not reconstructed N.

**Source route:** FS I.9.6, IX.4–IX.7 and X.0.1; LRS/Hausberger with Kaiser erratum. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
