# Classical local GLₙ and inner-form comparison

## Purpose and scope

Construct classical local Langlands for every GLₙ(F), with F finite over Qₚ,
through independent geometric character identities. The first endpoint is a
semisimple Weil representation. The final endpoint is a Frobenius-semisimple
Weil–Deligne object with its nilpotent monodromy operator. The distinction is
observable already for the trivial and Steinberg representations of GL₂: their
semisimple Weil representations agree, but their Euler factors and conductors
do not. The complete construction supplies ET.6a, the global compatibility
layers AG2.1b/AG2.2/AG2.5, and the geometric comparison in
ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison.

The inner-form endpoint has three separate interfaces. Classical
Jacquet–Langlands is an essentially square-integrable bijection. Badulescu’s
Langlands–Jacquet map is a surjection of finite-length Grothendieck groups and
can have signed or zero values. The parameter of an actual GLᵣ(D)
representation is defined from its unique Langlands standard data. Character
transfer of a virtual class must not be used as a bijection of all
irreducibles. A principal-series nontransfer calculation checks this boundary.

This document specifies exactly EndoscopicTransferAndUnitaryTraceComparison:ET.6.
The embedded ET.6a description in the atlas is a successor: degree concentration,
full two-tower equivariance and the Drinfeld/Lubin–Tate geometric duality belong
there. Equal-characteristic local fields require their own proof. No mixed
characteristic p-divisible deformation space is relabelled as an
 equal-characteristic object.

The authoritative target ids and source receipts are in the
[packet](../packets/EndoscopicTransferAndUnitaryTraceComparison--ET.6.json).
Every statement below is a target, with implementation status unchecked. There
are 33 targets, ten definitions/constructions, 45 API items, 30 discriminating
unit tests and six planets. Independent review accepted this planning pass on
14 October 2026. Coverage is planned: the exact supplier contracts
and five primary-proof gaps at the end remain requirements for closure.

## Existing owners and the baseline

The formal baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The reviewed AUDIT-32 result records all five ET.6 target families as absent; its accepted review is not yet merged into data/library-coverage.json.
The matrix definitions
Matrix.diagonal, Matrix.trace and Matrix.charpoly, and the theorem
Matrix.trace_diagonal, were read at these pins. Searches of the pinned and
current libraries did not locate full WD, classical LLC or local JL carriers.
The suggested file therefore states only a small matrix normalization projection.

Current TauCetiRoadmap main was checked at 0d144d044dacebca17b654695b6f1ad58f159b27;
current Tau Ceti was checked at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.
An existing roadmap is a mathematical supplier, not a claim that its targets
are already formalized at the baseline.

- [SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/SmoothRepresentationsOfLocalGroups/README.md)
  owns the early abelian smooth category, normalized induction/Jacquet,
  admissibility, the SR.3.3 standard-data framework and SR.5.3
  highest-derivative-adapter. That last target includes the segment and
  multisegment conventions, their classifications and the Zelevinsky
  involution. Import all of them. Ascending segments in its Z convention
  need not be essentially square-integrable; the adapter explicitly selects
  the essentially square-integrable segment constituent. All-rank newvectors
  and character theory require its Part II extension.
- ArithmeticGaloisRepresentations:R01.2 owns WD objects, morphisms, direct sum,
  tensor product, dual, special objects, Frobenius semisimplification and
  special-block classification. R01.2/local-euler-factor and
  R01.2/local-epsilon-factor own the factors; R01.3 owns the conductor
  dictionary. This document builds adapters and comparisons on those objects.
- [ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/ClassFieldTheory/README.md)
  Layers 7 and 9 own local reciprocity, its arithmetic/geometric convention,
  and the local Weil topology. Its explicit exclusion of global Weil groups
  requires a Part II bridge for the global induction argument.
- [GlobalNumberFields](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/GlobalNumberFields/README.md)
  Layers 9–10 own Hecke characters and algebraic infinity types;
  AutomorphicFormsOnReductiveGroups:AF.5/gl1-dictionary identifies their
  automorphic realization. AF.1/archimedean-llc-gln is the infinite-place LLC
  supplier. None of these notions is constructed again.
- [InductionRestriction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/RepresentationTheory/InductionRestriction/README.md)
  Layers 5–6 own finite-group Clifford theory and Brauer induction. Arithmetic
  R01.1 supplies their finite-inertia Weil applications.
- AF.1 and AF.5 have needs_changes reviews; their requested targets remain planning inputs.
- AL.1–AL.3 own analytic integrals and functional equations. The accepted
  AL.3/rs-induced-factor-product covers generic irreducible inductions. The
  nongeneric Langlands-quotient product contract below is stronger and must
  be supplied explicitly.
- AG2.1a owns the early raw compact-unitary cohomology, Weil/Hecke actions and
  projectors. The auxiliary simple point count below is a calculation on
  those shared objects. It does not import global local-compatibility,
  torsion concentration or a noncompact Igusa theorem.

## Conventions and build order

Write q for the cardinality of κ_F, Φ for geometric Frobenius and
ω(w)=q^{deg(w)} with arithmetic degree +1, hence ω(Φ)=q⁻¹. Geometric
reciprocity sends a uniformizer to Φ. All inversions of reciprocity occur in
the topological abelianization, not as a homomorphism on the nonabelian Weil
group. Fix the positive square root of q and normalized parabolic induction.

The character-defined rec_un and the unitary Weil parameter satisfy
σ_ss(π)=rec_un(π)⊗ω^{(1−n)/2}. Write LLC_WD for the final WD object and
LLC_D for an inner-form parameter. The underlying semisimple Weil class of
LLC_WD is σ_ss; its N must be retained. Use the imported raw special block
Sp(ℓ) with weights 1,ω,…,ω^{ℓ−1} and N sending each basis vector to the next.
The normalized unitary block is ω^{(1−ℓ)/2}Sp(ℓ). The terminal line is ker N.

For all local constants choose the same nontrivial ψ and its self-dual
additive measure, and use the AL.1 Tate s-variable. Multiplicative maximal
compacts have volume 1. L(s,D) is the reciprocal determinant on (ker N)^I,
not on the whole inertia-invariant Weil space. Deligne epsilon includes the
monodromy determinant. Rational test-function values allow denominators;
integer virtual Weil multiplicities require an independent argument.

The construction runs in the following order:

1. Import the early character and cyclic-base-change prefixes. Establish the
   independent classical essentially square-integrable JL endpoint.
2. Instantiate strict O-module deformation levels and finite nearby cycles;
   prove norm transfer, geometric descent and harmonic descent.
3. Count the auxiliary simple compact unitary model on raw cohomology, obtain
   positive rational Weil traces, and prove integer multiplicities by the
   compact-group virtual tower comparison and a newvector type.
4. Construct rec_un, then prove restricted global Weil extraction, the five
   functorial properties and the supercuspidal bijection.
5. Prove Harris solvable non-Galois induction and Henniart functional-equation
   isolation, yielding supercuspidal pair-factor compatibility.
6. Import the two multiset classifications, attach full special monodromy,
   prove all Langlands-quotient factors and the full WD correspondence.
7. Construct additive inner-form transfer, its quotient/Jacquet compatibility
   and the actual inner-form standard-data parameter; run the nontransfer tests.

Early ET.4b is proposed after AS.6, ET.3 and ET.4. It supplies cyclic lifting,
global cyclic base change/induction and the restricted Harris–Taylor unitary
input. ET.7a consumes this prefix and ET.6. The characters Part II starts
after SR.3, ET.1 and RG2.0 and supplies ET.4 and ET.6. These directions avoid
using either consumer as its own supplier.

## Targets and checks

Each anchor below is the suffix of its ET.6 node id. “Needs” lists its direct
prerequisites; prerequisites from this part link to their anchors. Proof steps
are requirements for the target, including any explicitly identified supplier
or source-access requirement. Every definition and construction has a usable
API, its consumer uses and three tests that reject plausible wrong definitions.

## A. Normalization and the independent character endpoint

<a id="normalization-dictionary"></a>

### The classical normalization dictionary

**Definition target.** Fix F/Q_p finite, residue cardinality q, a uniformizer ϖ, geometric Φ in W_F, and ω(w)=q^{deg(w)}, with arithmetic degree +1 and deg(Φ)=−1. Use Art_geo:F×→W_F^ab sending ϖ to Φ; it equals arithmetic reciprocity composed with inversion on the abelianization. Fix the positive complex square root of q, and put σ(π)=rec_un(π)⊗ω^{(1−n)/2}. Normalized parabolic induction uses δ_P^{1/2}. For a WD object D=(V,r,N), L(s,D)=det(1−q^{−s}r(Φ)|(ker N)^I)^{−1}; ε(s,D,ψ) is the imported Deligne local constant with its monodromy determinant, with ψ-self-dual additive Haar measure. All analytic and Galois ε-functions use the same AL.1 Tate s-variable, not an unspecified scalar normalization.

**Hypotheses.** n≥1; complex coefficients; nontrivial continuous additive ψ; multiplicative maximal compact volume 1.

**Needs:** `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`; `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`; `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Construction/proof.**

1. Import the local Weil group and both reciprocity normalizations from current ClassFieldTheory, and the existing WD factor definitions from ArithmeticGaloisRepresentations.
2. Compute the half-twist once: rec_un=σ⊗ω^{(n−1)/2}; compare every induction, dual and similitude factor with this equation.
3. At rank one identify Deligne’s constant with AL.1’s Tate epsilon, including the Haar measure and s-variable.

**API.**

- `ClassicalNormalization.weilTwist` (constructor): The scalar character ω^t evaluates at geometric Φ as q^{−t}.
- `ClassicalNormalization.recToUnitary` (equivalence): σ=rec_un⊗ω^{(1−n)/2}, with inverse twist ω^{(n−1)/2}.
- `ClassicalNormalization.factorDictionary` (compatibility): The imported Arithmetic L polynomial is the reciprocal of the analytic L-function after X=q^{−s}; both epsilon normalizations agree at rank one.
- `ClassicalNormalization.reciprocity` (compatibility): Art_geo(x)=Art_arith(x)^{-1} in W_F^ab; this does not define inversion as a map on nonabelian W_F.

**Uses.** Scholze Theorem 6.4 and Corollary 11.3: Track induction and tower duals. ET.6a, AG2.1b and ES7:GLn-comparison: Supply a fixed comparison convention before any tower or global compatibility theorem.

**Unit tests.**

1. `ClassicalNormalization.gl1` (computation): An unramified χ with χ(ϖ)=α has L(s,σχ)=(1−αq^{−s})^{−1}.
2. `ClassicalNormalization.gl2Twist` (computation): rec_un for the trivial GL_2 representation is 1⊕ω, whereas σ is ω^{−1/2}⊕ω^{1/2}.
3. `ClassicalNormalization.inductionShift` (characterisation): An n_i-dimensional induction block rec_un,i enters rec_un,n with twist ω^{(n−n_i)/2}; a uniform dimension-free twist fails this identity.

**Check.** For a rank-one χ, σ(χ)=χ∘Art_geo^{-1}; a uniformizer acts through χ(ϖ).

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2(a)–(b), p.3; Notation p.6. The character-defined rec differs from the unitary parameter by a dimension-dependent half twist. [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §1.1–1.2, pp.588–589; §2.3–2.4, p.594. Geometric reciprocity, absolute-value twists and full WD factors fix the comparison conventions.

<a id="esi-jacquet-langlands"></a>

### Jacquet–Langlands for essentially square-integrable representations

**Theorem target.** For D/F a central division algebra of index d and n=rd, classical JL is a bijection from essentially square-integrable irreducible GL_r(D) representations to essentially square-integrable GL_n(F) representations, characterized by Θ_{JL(π′)}(g)=(−1)^{n−r}Θ_{π′}(g′) on corresponding regular semisimple classes whose characteristic polynomials agree. In particular it has this identity on matched elliptic classes. It commutes with central-character twists. For r=1,d=n this is the division-algebra correspondence used by the local tower argument; existence is independent of the LLC constructed here.

**Hypotheses.** Characters are the locally integrable Harish-Chandra functions; the normalization fixes maximal compact volumes. The independently proved all-r,D classical theorem is a recorded source-access gap.

**Needs:** `SmoothRepresentationsOfLocalGroups:SR.3`; `EndoscopicTransferAndUnitaryTraceComparison:ET.3/inner-form-transfer`; `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

**Construction/proof.**

1. Import untwisted character integrability/local constancy and elliptic character orthogonality from the proposed character prefix.
2. Use the classical Deligne–Kazhdan–Vignéras theorem, as restated with this sign and matching in Badulescu §3.1. Its proof is not replaced by Scholze’s rank-one-division tower comparison.
3. Use character independence for uniqueness and the classical theorem for existence and surjectivity.

**Check.** For a quaternion division algebra and n=2,r=1, the transfer of its trivial representation is unitary St_2 and the character sign is −1.

**Sources.** [Alexandru Ioan Badulescu, Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), §3.1, p.13. Restates the independently established essentially square-integrable bijection for all r,d with sign (−1)^{n−r}. [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition before Corollary 11.3, p.29. Uses its r=1 division-algebra case, rather than proving the all-inner-form theorem.

**Planet:** Jacquet–Langlands correspondence.

## B. Strict deformation geometry and local test functions

<a id="drinfeld-deformation-instance"></a>

### Strict O-module deformations with Drinfeld levels

**Construction target.** For r≥1 and β∈GL_n(O_r)diag(ϖ,1,…,1)GL_n(O_r), let H_β be the height-n, dimension-one strict ϖ-divisible O-module over κ_r with relative contravariant Dieudonné F=βσ. Instantiate its marked deformation ring R_β and Drinfeld level-m cover R_β,m: the n sections X_i of H[ϖ^m] satisfy the full relative Cartier-divisor identity ∑_{a∈(O/ϖ^m)^n}[∑a_iX_i]=[H[ϖ^m]]. Then R_β≃O_r[[T_1,…,T_{n−1}]] noncanonically; the finite level cover is regular and generically étale with GL_n(O/ϖ^m)-action. The formal level space may have several components. It has an equivariant finite-type algebraization along a finite special-fibre subscheme, as in Scholze Theorem 2.4.

**Hypotheses.** The O-action on Lie H agrees with the structural O-action; κ_r has the specified κ-embedding; marked deformations preserve that strict action.

**Needs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `ClassicalAdicEtaleCohomology:H1`.

**Construction/proof.**

1. Apply the contravariant Dieudonné supplier with its requested strict relative O-linear extension. Relative F=βσ and the étale norm parameter F=β⁻¹σ₀ use different β conventions and opposite endomorphism algebras; both are contravariant.
2. Use the formal O-module deformation and Cartier-level representability supplier; connected–étale splitting reduces regularity and dimension to the connected case.
3. Use strict truncated-O-module algebraization, Artin approximation and normalization as in Theorem 2.4; request these exact deformation exports rather than duplicate their general owners.

**API.**

- `DrinfeldDeformationInstance.ofDieudonne` (constructor): A chosen integral σ-conjugator, hence a chosen isomorphism of H_β, transports marked deformation problems; identity and composition of isomorphisms give the corresponding transport laws. Changing the conjugator by an automorphism changes the transport by that automorphism.
- `DrinfeldDeformationInstance.levelAction` (structure): Changing the ordered sections gives the GL_n(O/ϖ^m)-action and commutes with reduction of level.
- `DrinfeldDeformationInstance.forgetLevel` (functoriality): Level m+1→m is induced by multiplying sections by ϖ and composes with forgetting all levels.
- `DrinfeldDeformationInstance.genericTorsor` (compatibility): The generic-level fibre is the torsor of bases of the étale O/ϖ^m-module, agreeing with the supplier’s Tate-module bases.

**Uses.** Scholze Theorems 2.5–2.6: Define finite nearby-cycle traces. ET.6a: Use the same local formal-module supplier; this node adds the finite residue-field trace instance.

**Unit tests.**

1. `DrinfeldDeformationInstance.heightOne` (computation): At n=1, R_β has no deformation variables; the connected level-m generic fibre has (O/ϖ^m)× acting on generators.
2. `DrinfeldDeformationInstance.zeroSections` (characterisation): For n=1,m≥1 the all-zero sections fail the level condition on the geometric generic fibre, where H[ϖ^m] has q^m distinct points. On the geometric special fibre of a connected height-one formal O-module they satisfy it: both Cartier divisors are q^m[0].
3. `DrinfeldDeformationInstance.etaleBoundary` (characterisation): At connected height k<n, geometric level components are indexed by surjections (O/ϖ^m)^n→H_et[ϖ^m]; they cannot be collapsed to one local component.

**Check.** The relative deformation dimension is n−1; the GL_n(O/ϖ^m)-torsor assertion concerns the generic fibre.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definitions 2.1–2.2, Proposition 2.3 and Theorem 2.4, pp.7–8. Defines strict O-action and Cartier-divisor levels, and proves the deformation and algebraization properties.

**Planet:** Drinfeld level structures.

<a id="nearby-trace-function"></a>

### The nearby-cycle test function

**Construction target.** Let τ∈Φ^r I_F with r≥1, h∈C_c^∞(GL_n(O),Q), and ℓ≠p. Form [RΨ_β]=∑_i(−1)^i lim_m H^0(R^iψ_{Spf R_β,m} Q̄_ℓ), with commuting W_{F_r} and compact-group actions. Set h∨(g)=h((g^{-1})^t) and φ_{τ,h}(β)=tr(τ×h∨|[RΨ_β]) on the preceding β-coset, zero elsewhere. Interpret the convolution trace at a finite level fixing h. Define f_{τ,h} as any cyclic-transfer representative with matching twisted orbital integrals, an element of the orbital-integral quotient rather than a distinguished test function.

**Hypotheses.** Choose Q̄_ℓ≃C only after rationality; compact-group Haar volume is 1; τ has positive geometric Frobenius exponent.

**Needs:** [Strict O-module deformations with Drinfeld levels](#drinfeld-deformation-instance); `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`; `ClassicalAdicEtaleCohomology:H1`; `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction/proof.**

1. Use the formal-to-adic nearby-cycle comparison and finite-level cohomology, then pass through level invariants.
2. Take alternating traces with the inverse-transpose h convention; transfer using the accepted cyclic fundamental-lemma/transfer node.
3. Independence of the transfer representative on representation traces uses the requested p-adic character and density theory.

**API.**

- `NearbyTraceFunction.value` (simp): On the β-coset its value is the finite-level alternating trace; off the coset it is zero.
- `NearbyTraceFunction.levelIndependent` (compatibility): Increasing m once h is biinvariant preserves the value by finite-cover invariants.
- `NearbyTraceFunction.linear` (structure): The assignment h↦φ_{τ,h} is Q-linear.
- `NearbyTraceFunction.transferClass` (characterisation): Matching twisted orbital integrals determine f_{τ,h} modulo the common orbital-integral kernel and hence determine its admissible traces.

**Uses.** Scholze Theorem 1.2(a): Characterize the Weil parameter. Scholze §9 and §11: Use the same test function in the global count and the local virtual tower comparison.

**Unit tests.**

1. `NearbyTraceFunction.zero` (degenerate): h=0 gives φ=0 and a transfer class with zero traces.
2. `NearbyTraceFunction.offSupport` (non-example): For n=1, a unit β has valuation 0 and φ_{τ,h}(β)=0, since support has valuation 1 in F_r.
3. `NearbyTraceFunction.dualInvolution` (characterisation): For a compact-group character χ, tr(h∨|χ)=tr(h|χ∨); an unramified geometric generator does not remove this compact dual.

**Check.** Do not replace the alternating trace by a single-degree trace.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.1 and definition before it, p.3; Theorems 2.5–2.6, p.8. Defines the virtual nearby-cycle trace and the orbital-integral interpretation of its transferred function.

**Planet:** Nearby-cycle test functions.

<a id="test-function-regularity"></a>

### Rationality and local constancy of the test function

**Theorem target.** For every preceding τ,h, φ_{τ,h} is compactly supported, locally constant, Q-valued and independent of ℓ and the embedding Q̄_ℓ≃C. For a fixed normal level K under which h is biinvariant, its trace is the finite sum vol(K)∑_{g∈GL_n(O)/K}h(g)tr(τ×g∨|RΨ_β^K). Thus denominators are permitted for rational h and normalized convolution; integrality of a virtual Weil multiplicity is a separate result, not integrality of every rational-valued test function.

**Hypotheses.** Strict deformation algebraization from the preceding node; finite nearby-cycle cohomology in degrees 0,…,n−1.

**Needs:** [The nearby-cycle test function](#nearby-trace-function); `ClassicalAdicEtaleCohomology:H1`.

**Construction/proof.**

1. Use Berkovich comparison at the finite algebraization to establish finiteness and bounded degrees.
2. Apply the congruence-near-identity cohomology invariance theorem to prove local constancy in β.
3. Twist by the finite compact-group action and apply the ℓ-independent alternating trace theorem; the rational trace argument is Scholze Theorem 2.6. The controlled-cohomology variant gives the same mechanism in Deformations Propositions 3.15, 4.2–4.3.

**Check.** Scaling h by a rational denominator scales φ by that denominator; no unconditional integer-valued claim survives this test.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorems 2.5–2.6, p.8. Establishes finite nearby cycles, local constancy, rational values and ℓ independence. [Peter Scholze, The Langlands–Kottwitz method and deformation spaces of p-divisible groups](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf), Theorem 2.8 pp.9–10; Proposition 3.15 pp.17–18; Propositions 4.2–4.3 pp.19–21. Supplies the controlled-cohomology and congruence-action proof interfaces.

<a id="etale-dieudonne-norm"></a>

### Dieudonné norms in the étale and basic cases

**Construction target.** For a finite semisimple Q_p-algebra A with maximal order O_A, integral σ₀-conjugacy classes of β∈(O_A⊗Z_{p^r})× parametrize étale O_A^op-linear p-divisible groups H over F_{p^r} for which H[p] is free of rank one over O_A^op/p. The contravariant Dieudonné module is O_A⊗Z_{p^r}, with F=β⁻¹σ₀. The geometric descent operator γ=α∘Frob_H^{−r} determines an O_A×-conjugacy class Nβ. The characteristic polynomials of Nβ and ββ^{σ₀}⋯β^{σ₀^{r−1}} agree; this does not specify an element-valued norm in a noncommutative algebra. For the relative basic case let D/F have invariant 1/n, normalize v_D(ϖ)=n, and let B_r be the basic β in the deformation coset. Marking the unique geometric height-n formal O-module gives descent in D_{−r}; invert it to obtain the O_D×-conjugacy class Nβ in D_r={d:v_D(d)=r}.

**Hypotheses.** r≥1; σ_0 is arithmetic Witt Frobenius; σ is relative arithmetic Frobenius in the O-module case.

**Needs:** [Strict O-module deformations with Drinfeld levels](#drinfeld-deformation-instance); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`.

**Construction/proof.**

1. Track contravariance, the opposite endomorphism algebra and the inverse β parameter when passing from relative F=βσ to the étale F=β⁻¹σ₀ description; no covariant Dieudonné functor is used.
2. Use integral Dieudonné classification for the étale case; conjugate marked lattices produce the same norm class.
3. In the basic case classify geometric formal modules, identify endomorphism height with v_D, and invert the negative-height descent operator.

**API.**

- `DieudonneNorm.class` (constructor): Send an integral σ₀-class to its geometric Frobenius descent class up to O_A×-conjugacy; in the basic case send an integral σ-class to its inverted descent class up to O_D×-conjugacy.
- `DieudonneNorm.changeMarking` (compatibility): Changing a marking conjugates Nβ and leaves invariant test-function values unchanged.
- `DieudonneNorm.basicValuation` (simp): For β∈B_r the inverted descent norm has v_D(Nβ)=r.
- `DieudonneNorm.splitProduct` (compatibility): The norm class and the ordered product ββ^{σ₀}⋯β^{σ₀^{r−1}} have equal characteristic polynomials. For commutative A the construction agrees with the ordinary extension norm.

**Uses.** Scholze Propositions 4.3 and 4.7: Match orbital integrals by counting marked lattices. Scholze Corollary 11.3: Identify d=Nβ in the Lubin–Tate trace formula.

**Unit tests.**

1. `DieudonneNorm.rankOne` (compatibility): For A=Q_p and β∈Z_{p^r}×, Nβ is the usual norm Z_{p^r}×→Z_p×.
2. `DieudonneNorm.basicRankOne` (computation): For n=1 and β=ϖu in F_r, v_F(Nβ)=r, rather than −r.
3. `DieudonneNorm.quaternionValuation` (computation): For n=2, v_D(ϖ)=2 and a height-one basic β with r=1 has norm valuation 1; using the central-field valuation as v_D fails.

**Check.** The arithmetic Witt Frobenius is distinct from the geometric Weil element in the trace.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Proposition 4.2 pp.11–12; Proposition 4.6 pp.12–13. Constructs the norm by étale and basic descent; the inverse in the basic case changes the valuation sign.

<a id="basic-norm-integrals"></a>

### Norm comparison of orbital integrals and traces

**Theorem target.** For h invariant under maximal-order units, φ_h(β)=h(Nβ) has matching twisted/ordinary orbital integrals in both the étale integral-algebra case and the basic B_r↔D_r case. Choose maximal compact volume 1 on the ambient groups and compact stabilizer volume 1 on each centralizer. Then ∫φ_h=∫h, with the integration domains respectively the unit groups or B_r,D_r. The basic identity is restricted to basic classes and the matched centralizer measures.

**Hypotheses.** Étale h compactly supported on O_A×, or basic h compactly supported on D_r and invariant under O_D× conjugacy.

**Needs:** [Dieudonné norms in the étale and basic cases](#etale-dieudonne-norm); `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction/proof.**

1. Write both orbital integrals as sums over marked integral Dieudonné lattices modulo the common quasi-isogeny group.
2. Use the fact that each lattice stabilizer is maximal compact to identify the same weighted sum.
3. Apply the requested untwisted and twisted Weyl integration formulas to obtain the integral equality.

**Check.** At n=1 this reduces to integration along the field norm with its compact normalization.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Proposition 4.3 and Corollary 4.5 p.12; Proposition 4.7 and Corollary 4.8 p.13. The same lattice count gives norm transfer and integrated equality in the two regimes.

<a id="geometric-descent-formula"></a>

### Connected–étale descent of nearby cycles

**Theorem target.** For H_β=H_β^0×H_β^et of connected height k, 1≤k≤n, level-m components are indexed by surjections v:(O/ϖ^m)^n→H_β^et[ϖ^m]. For a fixed rank-k kernel V, its stabilizer is P_V(O/ϖ^m). The corresponding formal pieces are power-series extensions by n−k variables of the connected height-k deformation space. Nearby cycles are canonically the connected nearby cycles tensored with the finite regular representation of GL_{n−k}(O/ϖ^m), inducing a virtual compact-group identity [RΨ_β]=Ind_{P_k(O)}^{GL_n(O)}([RΨ_{β^0}]⊗C_c^∞(GL_{n−k}(O))). In the final h-trace formula the étale norm acts by right multiplication by (Nβ^et)^{-1}; retain the transposed action on the undualized sheaf.

**Hypotheses.** Use the contravariant β convention and inverse-transpose h; no k=0 formal dimension-one object occurs.

**Needs:** [Strict O-module deformations with Drinfeld levels](#drinfeld-deformation-instance); [The nearby-cycle test function](#nearby-trace-function); [Dieudonné norms in the étale and basic cases](#etale-dieudonne-norm); `SmoothRepresentationsOfLocalGroups:SR.2`; `ClassicalAdicEtaleCohomology:H1`.

**Construction/proof.**

1. Separate connected and étale torsion and classify surjective level maps and their kernels.
2. Use formal smoothness of the connected-part projection and invariance of nearby cycles under a formal disc.
3. Induce over the compact group and dualize the compact action to obtain the specified right multiplication in the trace.

**Check.** k=n gives the original connected nearby cycles and a trivial étale factor; k=1<n retains the finite regular étale factor.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Proposition 5.1(i)–(vi), pp.13–14. The component, formal-disc, equivariant nearby-cycle and induced trace calculations are distinct parts of descent.

<a id="harmonic-descent-formula"></a>

### Harmonic descent and normalized induction

**Theorem target.** Assume the character-parameter construction in all ranks below n. For π=i_P^{GL_n}(π_1⊠⋯⊠π_t), t≥2, with irreducible blocks of ranks n_i, the transferred test trace is tr(f_{τ,h}|π)=tr(τ|⊕_i rec_un(π_i)⊗ω^{(n−n_i)/2})tr(h|π). The trace on an induced finite-length representation is additive; the constituent-level conclusion uses the type-and-density reduction. In the unnormalized Jacquet-module calculation each connected height-k term carries the modulus factor q^{(n−k)r}, where q=|κ_F|.

**Hypotheses.** Normalized induction and unnormalized intermediate Jacquet modules are explicitly distinguished; r≥1.

**Needs:** [Connected–étale descent of nearby cycles](#geometric-descent-formula); [Norm comparison of orbital integrals and traces](#basic-norm-integrals); [The classical normalization dictionary](#normalization-dictionary); `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

**Construction/proof.**

1. Use the geometric descent formula on a block diagonal β and the norm integral for the étale block.
2. Apply twisted character–Jacquet compatibility and twisted Weyl integration to the unnormalized Jacquet-module constituents.
3. Insert δ_P^{1/2} and the lower-rank character identities; compare exponents to obtain the direct sum. The p printed in the 2010 Lemma 6.1 prefactor is interpreted by the corrected residue-cardinality computation recorded in sourceIssues.

**Check.** For n=2,n_1=n_2=1 both rec_un blocks have twist ω^{1/2}; multiplying by ω^{−1/2} gives the unitary parameter sum.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Lemmas 6.1–6.3 and Theorem 6.4, pp.15–16. Geometric descent, twisted Jacquet characters and the Weyl formula give the induction half-twists.

<a id="quasi-el-test-function-comparison"></a>

### The auxiliary quasi-EL test-function calculation

**Comparison target.** For the local auxiliary datum O= M_n(O_F)^op×O_{D′}^op with D′ a semisimple product, the associated structured p-divisible group has deformation ring R_H≃R_β and level space R_H,m≃R_β,m×(O_{D′}/p^m)× for its étale generators. The nearby cycles factor as RΨ_β⊗C_c^∞(O_{D′}×). Consequently φ_{τ,h,h′} is associated to f_{τ,h}∨×h′ in the GL_n×D′× factors. The central G_m/similitude factor is kept separately with its reciprocity character and p^{−r′}-coset; it cannot be absorbed into the GL_n parameter.

**Hypotheses.** The local datum arises at a rational prime split in the auxiliary imaginary quadratic field; h,h′ compactly supported at integral level.

**Needs:** [The nearby-cycle test function](#nearby-trace-function); [Norm comparison of orbital integrals and traces](#basic-norm-integrals); [The classical normalization dictionary](#normalization-dictionary); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `PELModuli:M2`.

**Construction/proof.**

1. Use the requested structured p-divisible-group carrier and identify δ_0 up to σ-conjugacy with ((β^{-1})^t,1,β′).
2. Compare the ordered level bases to strict O-module levels and the étale generator set.
3. Tensor nearby cycles, use the étale norm identity, and apply inverse transpose to the first factor. Track the central character through Deformations Proposition 4.10 and Remark 4.11.

**Check.** For n=1 the extra étale generator factor persists, even though the connected deformation space is zero-dimensional.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition 7.1, Propositions 7.2–7.3, Corollary 7.4 and Lemma 7.5, pp.17–19. Proves the local comparison used inside the auxiliary unitary count. [Peter Scholze, The Langlands–Kottwitz method and deformation spaces of p-divisible groups](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf), Proposition 3.14 p.17; Proposition 4.10 and Remark 4.11 p.22. Separates the quasi-EL deformation factor and its central reciprocity factor.

<a id="auxiliary-geometric-trace"></a>

### The simple unitary point count on raw cohomology

**Comparison target.** On the shared early raw compact-unitary cohomology H_ξ, specialize Scholze’s auxiliary CM division data: F=F_0K, [F_0:Q] even, unitary signature (1,n−1) at one infinite place and compact at the others, D division only at the chosen conjugate split pair x,x^c, and p split in K with the selected local factor w≠x,x^c. The alternating trace tr(τ×h∨h′e_{Z_p×}f^p|H_ξ) is the weighted sum of effective Kottwitz triples with coefficient trace tr ξ(γ_0) and twisted orbital integral of φ_{τ,h,h′}. Replacing that local function by its matched transfer gives n·tr(τ×h∨h′e_{Z_p×}f^p|H_ξ)=tr(f_{τ,h}∨h′e_{p^{−r′}Z_p×}f^p|H_ξ), r′=r[κ_F:F_p]. The PEL generic fibre is a disjoint union indexed by ker^1(Q,G), not a canonically single Shimura variety.

**Hypotheses.** Use proper flat closure and sufficiently small level; either the special simple division model or the precise properness contract of Deformations Theorem 5.7.

**Needs:** `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`; `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`; [The auxiliary quasi-EL test-function calculation](#quasi-el-test-function-comparison); `AutomorphicGaloisRepresentationsPartII:AG2.1a`; `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; `PELModuli:M4`; `ClassicalAdicEtaleCohomology:H1`.

**Construction/proof.**

1. Instantiate AG2.1a’s raw PEL tower, coefficient projectors and commuting Weil/Hecke actions in the auxiliary data.
2. Identify formal neighbourhoods and their level covers by Serre–Tate, and count fixed points with effectivity, centralizers, volumes and coefficient traces.
3. Use only ET.4’s independent simple compact trace comparison and the local function comparison; no AG2.1b, AG2.5, ET.6a concentration, or ES7 agreement is an input.

**Check.** Discarding ker^1(Q,G), the similitude coset, the factor n, or the effective-triple invariant must fail the normalization check.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), §8 pp.19–22; Lemmas 9.1–9.2, Theorem 9.3 and Corollary 9.4 pp.23–25. Constructs the auxiliary data and proves the point count and transferred trace identity. [Peter Scholze, The Langlands–Kottwitz method and deformation spaces of p-divisible groups](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf), Theorem 5.2 p.24; Propositions 5.4–5.5 p.25; Theorem 5.7 pp.26–27; §§6–7 pp.27–32. Gives the exact generic-fibre multiplicity, completed-local comparison and raw trace theorem.

## C. Actual semisimple Weil representations

<a id="positive-weil-traces"></a>

### Positive Weil traces from early unitary globalization

**Theorem target.** For an essentially square-integrable π of GL_n(F), or a generalized Speh representation in Scholze Lemma 3.2(ii), globalize π∨ so that π_w=π∨⊗χ with χ unramified. Write W for the alternating cohomological multiplicity and a=dim(W)/n, a nonzero signed integer. Corollary 10.1 gives tr(f∨_{τ,h}|π_w)=a⁻¹tr(τ|W⊗χ_sim)tr(h∨|π_w). Using tr(f∨|π_w)=tr(f|π_w∨), the correct positive rational class is rec_un(π)=a⁻¹W⊗χ_sim⊗χ, where local characters are interpreted through geometric reciprocity. Since W occurs in a single parity, sign(a)W is effective of dimension |a|n. This yields a positive rational Weil class of dimension n. The dualized formula in the proof of Corollary 10.3 of the 2010 author copy is replaced by this direct trace calculation, as recorded in E-ET6-3.

**Hypotheses.** Globalization may change π by an unramified character; signed versus actual cohomology is fixed before positivity is asserted.

**Needs:** [The simple unitary point count on raw cohomology](#auxiliary-geometric-trace); `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; [The classical normalization dictionary](#normalization-dictionary).

**Construction/proof.**

1. Use the auxiliary geometric trace and isolate the automorphic finite part through unitary multiplicity one and restricted unitary-to-GL base change.
2. Use Harris–Taylor VI.2.3, VI.2.5 and VI.2.11 for the essentially square-integrable and Speh cases; these are explicit supplier/source-access requirements.
3. Take f_{τ,h} supported on determinant valuation r. If χ(ϖ)=u and τ lies over Φ^r, then tr(f∨_{τ,h}|π_w)=u^{−r}tr(f_{τ,h}|π), while tr(h∨|π_w)=tr(h|π). Multiplying Corollary 10.1 by u^r gives a⁻¹W⊗χ_sim⊗χ. Its positivity uses the common parity of W and the sign of a, without later local duality or global compatibility.

**Check.** Choose u with u≠u⁻¹ in the unramified-twist trace calculation: removing u^{−r} must multiply the Weil trace by u^r. A virtual alternating class alone does not give positivity; the common-parity input is required.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Corollary 10.1, Theorem 10.2 and Corollary 10.3, pp.26–27. Corollary 10.1 and globalization give positivity after explicit inversion of the automorphic trace. The printed Corollary 10.3 proof formula has the dualization error recorded in E-ET6-3.

<a id="local-lubin-tate-virtual-comparison"></a>

### The compact-group Lubin–Tate virtual comparison

**Theorem target.** Let D/F have invariant 1/n and ρ an irreducible D× representation whose classical transfer π=JL(ρ) is supercuspidal. Extend the alternating nearby-cycle tower class from K×(D××W_F)^0 to K×D××W_F by compact induction, with K=GL_n(O) and v_D(d)=deg(τ), with arithmetic degree deg(Φ)=−1. Define M(ρ)=Hom_{D×}(ρ,c-Ind[RΨ]). Then M(ρ)=(−1)^{n−1}π∨|_K⊗rec_un(π) as a virtual K×W_F representation. The ρ argument is fixed by the character projector in the proof of Corollary 11.3; the extra dual on ρ in its printed statement is recorded in E-ET6-4. Here rec_un(π) initially denotes the positive rational class furnished by globalization. This identity asserts neither concentration in one degree nor a full GL_n(F)-equivariant realization.

**Hypotheses.** Use 0≤i≤n−1 nearby cycles, the inverse norm action d^{-1}, and the same Haar measures as the norm identities.

**Needs:** [Positive Weil traces from early unitary globalization](#positive-weil-traces); [Norm comparison of orbital integrals and traces](#basic-norm-integrals); [The nearby-cycle test function](#nearby-trace-function); [Jacquet–Langlands for essentially square-integrable representations](#esi-jacquet-langlands); `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction/proof.**

1. The basic deformation tower is independent of β over the completed maximal unramified base; bounded finite-level cohomology gives its admissible compact action.
2. Use local cyclic base change and its twisted character identity for π; its twisted character vanishes off the basic locus in this comparison.
3. Insert classical JL with sign (−1)^{n−1} and integrate over the basic norm correspondence. The integral of tr(d⁻¹|R)Θ_ρ(d) projects to Hom_{D×}(ρ,R), not Hom_{D×}(ρ∨,R). The remaining h∨ trace then yields π∨|_K; independence of compact and Weil characters identifies the virtual class.

**Check.** For n=1 the sign is +1. A character ρ of order greater than two distinguishes the ρ and ρ∨ projectors: averaging ρ(d)ρ(d⁻¹) gives 1, whereas averaging ρ(d)² gives 0 on a finite quotient where ρ² is nontrivial.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 11.1, Proposition 11.2, Corollary 11.3 and Remark 11.4, pp.28–29. Proposition 11.2 and the final character integral in the proof of Corollary 11.3 prove the corrected ρ-multiplicity formula. This virtual compact comparison suffices for integrality and is weaker than a later tower realization.

<a id="compact-type-integrality"></a>

### Integral Weil multiplicities from newvectors

**Lemma target.** For every supercuspidal π, rec_un(π) is an integral virtual W_F representation. For an irreducible generic GL_n(F) representation with ψ of conductor O, the requested newvector theorem gives a least c≥0 with dim π^{K_1(c)}=1 and vanishing at smaller nonnegative levels; c is the exponent of q^{−s} in its epsilon monomial. Since K_1(c) is compact open in K=GL_n(O), the compact restriction π∨|_K has an irreducible K-type of multiplicity one. Projecting the preceding virtual identity to that type proves integer multiplicities, independently of positivity.

**Hypotheses.** K_1(0)=K and for c>0 K_1(c) is the integral subgroup whose last row is (0,…,0,1) modulo ϖ^c; supercuspidals are generic.

**Needs:** [The compact-group Lubin–Tate virtual comparison](#local-lubin-tate-virtual-comparison); `SmoothRepresentationsOfLocalGroups:SR.3`; `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction/proof.**

1. Import the all-rank generic newvector theorem, with its corrected essential-vector argument, from the smooth-representation extension.
2. Decompose the compact K-restriction: a one-dimensional K_1(c)-fixed space selects precisely one type and one multiplicity.
3. Take the type-isotypic alternating nearby-cycle class; its integer coefficients equal (−1)^{n−1}rec_un(π).

**Check.** For an unramified character of GL_1, c=0 and the trivial O× type has multiplicity one.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Corollary 11.5 and proof, p.30. The multiplicity-one compact type supplies the independent integrality input. [Hervé Jacquet, Ilya Piatetski-Shapiro and Joseph Shalika, Conducteur des représentations du groupe linéaire](https://www.math.columbia.edu/~hj/conducteur.pdf), §5.1 theorem and §5.2, pp.211–212. Gives the generic conductor and one-dimensional first newvector space. [Hervé Jacquet, A correction to Conducteur des représentations du groupe linéaire](https://msp.org/pjm/2012/260-2/pjm-v260-n2-p09-s.pdf), Theorem 1 p.517; §§2–3 pp.519–524, especially Remark 1 p.523. Replaces the incomplete essential-vector proof used by the original newvector argument.

<a id="type-and-density-reduction"></a>

### Type isolation and the trace-to-parameter reduction

**Lemma target.** Let ρ be a unitary supercuspidal representation of GL_d(F), t≥2 and n=dt. Its generalized Speh Langlands quotient S is formed from ρ[(t+1)/2−i], 1≤i≤t. There is h∈C_c^∞(GL_n(O)) with tr(h|S)≠0 and tr(h|θ)=0 for every tempered irreducible θ outside the properly induced family formed from t unitary unramified twists of ρ. In particular h has zero trace on every square-integrable representation. Separately, a test function whose traces vanish on all tempered nonsquare-integrables and all generalized Speh representations has zero trace on every irreducible smooth representation. With the lower-rank character construction, Scholze Lemma 3.2 therefore reduces rank n to proper-induction traces, positive rational Weil traces for essentially square-integrable and Speh representations, and integral virtual Weil multiplicities for supercuspidals. Positivity and integrality then give actual dimension-n semisimple Weil representations.

**Hypotheses.** Characteristic-zero admissible representations; the compact type is finite-dimensional; the density statement applies to all finite-length test traces.

**Needs:** `SmoothRepresentationsOfLocalGroups:SR.3`; [Harmonic descent and normalized induction](#harmonic-descent-formula); [Positive Weil traces from early unitary globalization](#positive-weil-traces); [Integral Weil multiplicities from newvectors](#compact-type-integrality).

**Construction/proof.**

1. Request the Schneider–Zink type that occurs in S and in exactly the indicated properly induced tempered family, and Kazhdan density. The compact test separates S from square-integrables; it does not isolate an essentially square-integrable unramified family.
2. For the vanishing criterion, take normalized constant terms along proper parabolics and apply Kazhdan density on their Levi factors. The alternating segment/Speh relation then treats square-integrables, followed by density on GL_n.
3. For Lemma 3.2, import the current SR.3 Bernstein centre and universal-unramified-twist APIs. The trace scalar varies regularly on each cuspidal component and descends through self twists and Weyl identifications, yielding a central multiplier. Proper induction and the compact Speh test compare its trace with f_{τ,h}; the vanishing criterion extends the identity to every constituent.
4. Use independence of semisimple Weil characters. Positive rational coefficients become nonnegative integers only after the independent supercuspidal integrality input.

**Check.** The compact separator has nonzero trace on S and zero trace on all square-integrables. A positive rational multiplicity 1/2 still fails the actual-representation conclusion until integrality is imposed.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Lemmas 3.1–3.2 and their proofs, pp.9–11. Separates generalized Speh from square-integrables, applies Kazhdan density, and uses Bernstein-centre regularity to pass from the three rank-induction inputs to constituent traces. The rank/supercuspidal-symbol misprints are recorded in E-ET6-5.

<a id="semisimple-trace-parameter"></a>

### The character-defined semisimple Weil parameter

**Construction target.** For every irreducible smooth complex π of GL_n(F), construct the unique n-dimensional semisimple continuous W_F representation rec_un(π), with finite inertia image, satisfying tr(f_{τ,h}|π)=tr(τ|rec_un(π))tr(h|π) for all τ projecting to a positive power of geometric Frobenius and compact h on K. Its unitary normalization σ_ss(π)=rec_un(π)⊗ω^{(1−n)/2} is additive on supercuspidal support. This construction specifies a Weil representation only; it carries no operator N and does not recover the usual L-factor of an arbitrary constituent from that support.

**Hypotheses.** F is finite over Q_p, n≥1; finite-length traces and transferred orbital-integral classes are defined through the character supplier.

**Needs:** [Type isolation and the trace-to-parameter reduction](#type-and-density-reduction); [Rationality and local constancy of the test function](#test-function-regularity); [The classical normalization dictionary](#normalization-dictionary).

**Construction/proof.**

1. Proceed by rank, using harmonic descent in lower ranks; type and density reduce the new rank to essentially square-integrable/Speh positivity and supercuspidal integrality.
2. Combine positive rational coefficients with integral multiplicities to obtain an actual dimension-n representation; use the type-and-density lemma to extend the character identity to each constituent.
3. Uniqueness follows from semisimple Weil-character independence on the positive Frobenius cosets. Use the induction formula to identify the cuspidal-support sum.

**API.**

- `ClassicalWeilParameter.ofIrreducible` (constructor): Construct rec_un on isomorphism classes of irreducible admissible representations.
- `ClassicalWeilParameter.traceIdentity` (characterisation): All transferred test traces equal the specified Weil trace times tr(h|π).
- `ClassicalWeilParameter.dimension` (simp): The actual semisimple Weil dimension is n.
- `ClassicalWeilParameter.supportSum` (compatibility): σ_ss of each irreducible subquotient of normalized induction is the sum of the σ_ss of the inducing blocks.

**Uses.** Scholze Theorem 10.6 and §12: Obtain restricted global Weil extraction and functoriality before bijectivity. ES7:GLn-comparison: Provide the classical semisimple parameter as an output comparison endpoint.

**Unit tests.**

1. `ClassicalWeilParameter.rankOne` (compatibility): For a GL_1 character χ, the geometric Frobenius trace is χ(ϖ).
2. `ClassicalWeilParameter.sameSupport` (non-example): For unitary St_2 and trivial GL_2, σ_ss=ω^{−1/2}⊕ω^{1/2}; semisimple traces do not distinguish their monodromy.
3. `ClassicalWeilParameter.rationalNotIntegral` (characterisation): A rational class with a constituent of coefficient 1/2 fails the integral-multiplicity test and is not the constructed actual Weil representation.

**Check.** The trivial and unitary Steinberg GL_2 representations have equal σ_ss but will have different full monodromy and L-functions.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2(a)–(b) p.3; Lemma 3.2 pp.9–10; Corollaries 10.3 and 11.5 pp.26–30. Builds the semisimple Weil representation through three separate induction, positivity and integrality inputs.

<a id="restricted-global-weil-extraction"></a>

### Restricted global Weil extraction without monodromy

**Theorem target.** For a cuspidal Π on GL_n over the auxiliary CM field with Π∨=Π^c, regular algebraic infinity and Π_x essentially square-integrable, there is an actual ℓ-adic Galois representation R(Π) of dimension an for some a≥1. At every finite v∤ℓ its semisimple Weil restriction is a copies of rec_un(Π_v). In the regular L-algebraic convention it is a copies of σ_ss(Π_v), after the explicitly chosen global Hecke-character twist. This is an equality of semisimple Weil classes, with no N statement. Every local essentially square-integrable π can be globalized up to unramified twist with Π_x supercuspidal.

**Hypotheses.** The character construction and normalized-induction formula have already been proved; use the specific auxiliary division group and retain its similitude character.

**Needs:** [The character-defined semisimple Weil parameter](#semisimple-trace-parameter); `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; `AutomorphicGaloisRepresentationsPartII:AG2.1a`; `AutomorphicFormsOnReductiveGroups:AF.5`.

**Construction/proof.**

1. Apply the early restricted unitary-to-GL globalization to Π∨, so the split GL_n component is Π_v∨. With W the resulting multiplicity class and a its signed multiplicity, set A=|a| and R(Π)=sign(a)W⊗χ_ψ. This is effective of dimension An; the positive χ_ψ follows directly from Corollary 10.1 as in E-ET6-3.
2. Use the established local trace identity at split places and Chebotarev. For a general v, choose a real quadratic R linearly disjoint from F, with the rational prime below x split in R and the completions of R and K at the prime below v isomorphic. Over FR/F₀R the place above v is split and its completion is still F_v. Cyclic base change preserves the hypotheses; Chebotarev compares the normalized global restrictions. This is not an imaginary quadratic extension split at v.
3. Use the separate essentially square-integrable globalization from Harris–Taylor VI.2.6; use a conjugate-self-dual Hecke character to pass to the L-algebraic normalization.

**Check.** An equality of semisimple Weil traces cannot be used to infer Steinberg N≠0.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorems 10.5–10.7, pp.27–28; Corollary 13.2 p.33. The proof uses only the already-established trace and induction identities, restricted base change and early geometric cohomology.

## D. Bijection and factor compatibility

<a id="functorial-weil-parameter"></a>

### Functoriality of the semisimple parameter

**Theorem target.** The maps σ_ss satisfy: rank-one geometric reciprocity; normalized-induction constituent sum; σ_ss(π⊗χ∘det)=σ_ss(π)⊗σ_ss(χ); and for cyclic prime-degree E/F and supercuspidal π, σ_ss(BC_{E/F}π)=σ_ss(π)|_{W_E}, with the lift allowed to be nonsupercuspidal. They commute with field isomorphisms. If σ_ss(π) is unramified, π has an Iwahori-fixed vector, equivalently its supercuspidal support consists of unramified rank-one characters.

**Hypotheses.** The local cyclic-lift normalization is fixed by its twisted character identity; no full WD base-change theorem is used.

**Needs:** [The character-defined semisimple Weil parameter](#semisimple-trace-parameter); [Restricted global Weil extraction without monodromy](#restricted-global-weil-extraction); [The compact-group Lubin–Tate virtual comparison](#local-lubin-tate-virtual-comparison); `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; `ClassicalAdicEtaleCohomology:H1`; `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction/proof.**

1. Prove rank one by the height-one tower and twists by restricted global extraction; use its cyclic global comparison for prime-degree local lifting.
2. The induction sum has already been proved. For the Iwahori criterion reduce to supercuspidals of rank ≥2 and show σ_ss(π)^I=0.
3. Average φ_{τ,h} over inertia. Use (1−q^r)tr_ss=tr on derived inertia invariants and the requested β-independent nearby-cycle description, then compact JL orthogonality; request this exact all-F extension rather than assume it from the Q_p calculation.

**Check.** Unramified σ_ss implies Iwahori invariants, not necessarily hyperspecial invariants: St_2 is the basic counterexample.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 12.1 and proof, pp.30–31, including footnote 8. States the five functorial properties and spells out the extra inertia-average calculation.

<a id="cuspidal-weil-bijection"></a>

### Supercuspidal local Langlands

**Theorem target.** For each n≥1, π↦σ_ss(π) is a bijection from supercuspidal irreducible smooth complex GL_n(F) representations to irreducible continuous n-dimensional complex W_F representations with finite inertia image. The proof uses only the five functorial properties and local cyclic lifting; it does not use numerical LLC or the factor-compatibility theorem being proved below.

**Hypotheses.** F/Q_p finite; the local lift supplier includes existence, ambiguity by cyclic characters, and nonsupercuspidal-lift decomposition.

**Needs:** [Functoriality of the semisimple parameter](#functorial-weil-parameter); `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; `ArithmeticGaloisRepresentations:R01.1`; `SmoothRepresentationsOfLocalGroups:SR.3`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`.

**Construction/proof.**

1. Choose a prime-cyclic tower making the parameter unramified. At its first loss of supercuspidality, Arthur–Clozel I Lemma 6.10 decomposes the lift as the orbit induction of pairwise distinct lower-rank supercuspidals. Rank induction and Clifford theory prove irreducibility.
2. For a given irreducible Weil representation descend from the first reducible restriction: realize its orbit constituents in lower rank and lift their normalized induction.
3. Descend through the remaining cyclic steps using I Theorem 6.2; match the unique cyclic character twist on the Weil side and use I Proposition 6.7 for uniqueness.

**Check.** A rank-two irreducible Weil induction from a noninvariant quadratic character corresponds to a supercuspidal; a reducible sum of two characters cannot.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition 12.2 and Theorem 12.3 with proof, pp.31–32. The rank/cyclic descent argument proves the bijection without numerical counting. [James Arthur and Laurent Clozel, Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter I Theorem 6.2 pp.51–57, Proposition 6.7 pp.59–60, Lemma 6.10 pp.62–64. Supplies exactly the local lifting and orbit-decomposition inputs.

**Planet:** Supercuspidal local Langlands.

<a id="potential-abelian-automorphic-pair"></a>

### Potentially abelian automorphic–Weil pairs

**Definition target.** A potentially abelian pair over a number field L consists of a cuspidal automorphic Π of GL_n/L and a continuous n-dimensional global Weil representation Σ, with σ_ss(Π_v)=Σ|_{W_{L_v}} at every finite place and archimedean LLC agreement at every infinite place. The word pair retains Σ, rather than just a predicate on Π. An algebraic Σ restricts at each complex embedding to characters z^p z̄^q with integral p,q. Regular L-algebraic Π means Π_∞⊗|det|^{(n−1)/2} is regular algebraic in the cohomological convention. Algebraic global Weil representations have ℓ-adic realizations matching all v∤ℓ.

**Hypotheses.** Global Weil groups, their localizations and algebraic Weil-to-ℓ-adic realizations are requested from ClassFieldTheory Part II through Arithmetic R01.1. Current GlobalNumberFields supplies Hecke characters and infinity types; AF.1 supplies the planned archimedean LLC target. No general global Langlands correspondence is assumed.

**Needs:** [Supercuspidal local Langlands](#cuspidal-weil-bijection); `AutomorphicFormsOnReductiveGroups:AF.5`; `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`; `ArithmeticGaloisRepresentations:R01.1`.

**Construction/proof.**

1. Use the already-proved local σ_ss at finite places, and the existing archimedean LLC endpoint.
2. Construct ℓ-adic realizations for algebraic characters by global class field theory and then use finite-extension descent for Σ.
3. Import the realization and global Hecke-character twist APIs at their owners; finite-place comparison is stable under isomorphism of either member.

**API.**

- `PotentiallyAbelianPair.finiteComparison` (structure): Supply the equality of semisimple Weil isomorphism classes at each finite place.
- `PotentiallyAbelianPair.infiniteComparison` (structure): Supply the archimedean LLC association at every infinite place.
- `PotentiallyAbelianPair.algebraicRealization` (compatibility): For algebraic Σ and ι:Q̄_ℓ≃C, its ℓ-adic realization agrees at every v∤ℓ.
- `PotentiallyAbelianPair.characterCase` (constructor): An algebraic rank-one Hecke character and its class-field Weil character give a pair.

**Uses.** Scholze Theorem 13.5: Upgrade almost-everywhere association and descend cyclic pairs. Scholze Lemma 14.2: Globalize local Brauer-induction terms for the functional equation.

**Unit tests.**

1. `PotentiallyAbelianPair.rankOne` (compatibility): For an algebraic Hecke character, both local endpoints equal the local reciprocal character, including ramified finite places.
2. `PotentiallyAbelianPair.almostEverywhere` (non-example): A record with finite agreement only outside a finite set fails finiteComparison at a missing place.
3. `PotentiallyAbelianPair.archimedeanIntegral` (non-example): At a complex embedding a character z↦|z|^{√2} fails the integral-weight algebraicity condition.

**Check.** Agreement only at almost all places does not satisfy the definition; upgrading it needs the following theorem.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition 13.1, Corollary 13.2 and Lemmas 13.3–13.4, p.33. Fixes all-place association, the L-algebraic normalization and the auxiliary ℓ-adic realization input.

<a id="harris-solvable-induction"></a>

### Harris non-Galois automorphic induction

**Theorem target.** Let F_{30}⊃F_{20}⊃F_{10} be totally real fields of even degrees over Q, with F_{30}/F_{10} solvable Galois. Put F_i=F_{i0}K for an imaginary quadratic K and n=[F_{20}:F_{10}]. Let x of F_1 split over F_{10} and be inert in F_3. For an algebraic Hecke character χ of F_2 require χ^c=χ^{-1}, infinity characters z^{p_τ}z̄^{−p_τ} with pairwise distinct integers p_τ, and stabilizer of χ_x∘Norm_{F_3/F_2} in Gal(F_3/F_1) exactly Gal(F_3/F_2). Then there is a potentially abelian cuspidal automorphic representation of GL_n/F_1 associated to Ind_{W_{F_2}}^{W_{F_1}}χ at every place; its x-component is supercuspidal. This is the specified solvable-closure theorem, not arbitrary non-Galois induction.

**Hypotheses.** A chosen embedding and place identify the local induced character; regularity and stabilizer hypotheses are essential.

**Needs:** [Potentially abelian automorphic–Weil pairs](#potential-abelian-automorphic-pair); [Restricted global Weil extraction without monodromy](#restricted-global-weil-extraction); `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; `AutomorphicFormsOnReductiveGroups:AF.5`; `AutomorphicFormsOnReductiveGroups:AF.5/gl1-dictionary`.

**Construction/proof.**

1. First prove Scholze Theorem 13.5: compare ℓ-adic realizations using restricted global extraction and Chebotarev, and fix a cyclic descent twist through its supercuspidal x-component.
2. Induct on the solvable Galois degree and choose a prime-cyclic F_4/F_1. If F_4⊂F_2 use cyclic automorphic induction; otherwise base change to F_4 and descend its invariant cuspidal representation.
3. Use strong multiplicity one, the x-component and the conjugate-self-duality correcting Artin character to select the descended representation; apply the all-place upgrade.

**Check.** At n=1 this is the original Hecke character; a χ with larger stabilizer fails the irreducible x-component hypothesis.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorems 13.5–13.6 and proofs, pp.34–35. Presents Harris’s solvable-closure non-Galois construction and the necessary descent normalization. [James Arthur and Laurent Clozel, Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter III Theorem 4.2 pp.202–203 and Theorem 6.2 pp.215–216. States the cyclic base change/descent and automorphic induction supplied by the early prefix.

<a id="highly-ramified-isolation"></a>

### Henniart’s highly ramified functional-equation argument

**Lemma target.** For two local supercuspidal terms whose Weil representations are induced from characters, choose simultaneous potentially abelian cuspidal globalizations with the required local factors up to unramified twist. At the finitely many unwanted ramified places choose a global Hecke character η, trivial at the distinguished place and sufficiently ramified elsewhere. The required analytic and Weil stability contract says that, once dimensions and determinants match, the twisted pair L-factors there are 1 and their epsilon factors agree with the same ψ and Haar measures. The two global pair functional equations then isolate the L/epsilon identity at the distinguished place. Brauer induction makes this reduction available for every pair of virtual supercuspidal terms.

**Hypotheses.** The simultaneous globalization and stability contract are explicit unverified primary-source inputs, recorded as gaps; this node does not claim that their proof has been read.

**Needs:** [Harris non-Galois automorphic induction](#harris-solvable-induction); [Functoriality of the semisimple parameter](#functorial-weil-parameter); `AutomorphicLFunctionsAndLocalFactors:AL.1`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`; `AutomorphicLFunctionsAndLocalFactors:AL.3`; `AutomorphicFormsOnReductiveGroups:AF.5`.

**Construction/proof.**

1. Use the solvable-induction theorem and the local-to-global embedding/character approximation construction for both induced Weil terms.
2. Identify determinants by global class field theory and strong multiplicity one. Use the supplier’s local highly ramified stability and a global character with prescribed trivial distinguished component.
3. Divide analytic and Weil global functional equations, cancel the matching unramified and archimedean factors, and separate the remaining rational L-factor and epsilon monomial with the local functional equation.

**Check.** A character ramified at the distinguished place does not isolate the original local pair; its component must be trivial there.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 14.1, Lemma 14.2 and proof, pp.35–36. Identifies the globalization and highly ramified twisting inputs, citing Harris–Taylor VII.2.10 and Henniart 2000 Corollary 2.4.

<a id="cuspidal-pair-factors"></a>

### Supercuspidal pair-factor compatibility

**Theorem target.** For supercuspidal π_1,π_2 of GL_{n_1}(F),GL_{n_2}(F), σ_ss respects duals and central characters and satisfies L(s,π_1×π_2)=L(s,σ_ss(π_1)⊗σ_ss(π_2)) and ε(s,π_1×π_2,ψ)=ε(s,σ_ss(π_1)⊗σ_ss(π_2),ψ). The same identities hold multiplicatively on the free abelian group of supercuspidals in all ranks. This virtual cuspidal-support extension is not the usual L-function of a general irreducible GL_n representation.

**Hypotheses.** The two epsilon sides use the rank-one dictionary and the same nontrivial ψ/self-dual measure.

**Needs:** [Supercuspidal local Langlands](#cuspidal-weil-bijection); [Henniart’s highly ramified functional-equation argument](#highly-ramified-isolation); `ArithmeticGaloisRepresentations:R01.1`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Construction/proof.**

1. Apply Brauer induction to finite-inertia Weil classes to reduce to virtual induced-character terms; import the precise induction theorem from arithmetic representation theory.
2. Use highly ramified isolation for pairs of such terms and multiplicativity to recover arbitrary pairs.
3. Use the global determinant comparison for det σ_ss=ω_π; detect duality by the pole of the pair L-function.

**Check.** For supercuspidals of unequal ranks the pair L-function is 1; rank-one equality is Tate’s local identity.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 14.1 and footnote 9, pp.35–36. The factor theorem concerns supercuspidal generators; its footnote excludes identifying virtual-support L with arbitrary irreducible L.

## E. Full monodromy and the classical WD endpoint

<a id="segment-wd-adapter"></a>

### The segment-to-monodromy adapter

**Construction target.** Import the GL_n segment classification from current SmoothRepresentations SR.5.3, highest-derivative-adapter, and the existing Arithmetic R01.2:wd special objects. For a segment Δ=[ρ⊗|det|^a,…,ρ⊗|det|^b], with ℓ=b−a+1 a positive integer, send its essentially square-integrable constituent D(Δ) to σ_ss(ρ)⊗ω^a⊗Sp(ℓ). Here Sp(ℓ) has weights 1,ω,…,ω^{ℓ−1} and N e_i=e_{i+1}, N e_{ℓ−1}=0, as in the imported unnormalized special object. The normalized unitary Steinberg block is ω^{(1−ℓ)/2}Sp(ℓ). This node defines only the adapter, not another multisegment classification or WD carrier.

**Hypotheses.** a,b may include the fixed half-integral normalization; the SR segment orientation must select the essentially square-integrable constituent, independently of its Z/L naming convention.

**Needs:** [Supercuspidal local Langlands](#cuspidal-weil-bijection); `ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object`; `ArithmeticGaloisRepresentations:R01.2/weil-deligne-tensor-product`; `SmoothRepresentationsOfLocalGroups:SR.5`; `mathlib:Matrix.diagonal`; `mathlib:Matrix.trace`; `mathlib:Matrix.trace_diagonal`; `mathlib:Matrix.charpoly`.

**Construction/proof.**

1. Use the existing segment endpoint, essentially square-integrable classification and standard-data uniqueness from SR.5.3.
2. Tensor the imported irreducible Weil representation with its twist and special block; use the imported monodromy covariance, not a newly invented WD record.
3. Verify the arithmetic-Frobenius two-dimensional projection F(t)=diag(1,t), N=[[0,0],[1,0]] in the pinned matrix carrier. This projection is a normalization check, not a full WD implementation.

**API.**

- `SegmentWDAdapter.ofSegment` (constructor): Attach the tensor special block to the imported segment class.
- `SegmentWDAdapter.dimension` (simp): Its dimension is ℓ·dim σ_ss(ρ).
- `SegmentWDAdapter.weilRestriction` (compatibility): Forgetting N gives the sum of the ℓ cuspidal twists, matching σ_ss(D(Δ)).
- `SegmentWDAdapter.monodromyLength` (characterisation): N has length ℓ on each Weil multiplicity block, so the top nonzero power is N^{ℓ−1} when ℓ>0.
- `RawSpecialBlock2.frobenius` (constructor): The light pinned projection sends t to diag(1,t).
- `RawSpecialBlock2.monodromy` (constructor): The light projection has N e_0=e_1 and N e_1=0.
- `RawSpecialBlock2.covariance` (compatibility): F(t)N=t NF(t), the arithmetic-Frobenius covariance in the imported special object.

**Uses.** Henniart §2.9: Extend the supercuspidal correspondence to all irreducibles. ET.6a, AG2.1b and the inner-form parameter: Retain full special-block monodromy and its normalization.

**Unit tests.**

1. `SegmentWDAdapter.lengthOne` (compatibility): Sp(1) is trivial with N=0 and D([ρ]) maps to σ_ss(ρ).
2. `SegmentWDAdapter.lengthTwo` (computation): For ℓ=2, ker N is the second basis line and N²=0 while N≠0.
3. `RawSpecialBlock2.sameWeilDifferentMonodromy` (non-example): The same F(t) with N and with 0 has identical trace and characteristic polynomial, but their kernels have dimensions 1 and 2.

**Check.** The unitary GL_2 Steinberg block has N≠0, one-dimensional ker N and Frobenius weights ω^{−1/2},ω^{1/2}.

**Sources.** [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.2–2.3 pp.593–594; §2.5–2.6 p.595. Matches indecomposable WD special blocks with segment representations using the unnormalized exponent convention.

<a id="special-block-factor-formulas"></a>

### Full special-block factors and conductors

**Theorem target.** For W=σ_ss(ρ) and the raw block B=W⊗ω^a Sp(ℓ), L(s,B)=L(s+a+ℓ−1,W) and a(B)=ℓa(W)+(ℓ−1)dim W^I. For raw Sp(ℓ)⊗Sp(m), the decomposition is ⊕_{j=1}^{min(ℓ,m)}ω^{j−1}Sp(ℓ+m+1−2j). Consequently L(s,B⊗B′)=∏_j L(s+a+a′+ℓ+m−1−j,W⊗W′). Its gamma factor is ∏_{i=0}^{ℓ−1}∏_{k=0}^{m−1}γ(s+a+a′+i+k,W⊗W′,ψ); recover epsilon by ε=γ L(s)/L(1−s,dual), retaining the imported monodromy determinant. The formulas are identities of rational/meromorphic functions, including poles, with the rank-one Tate s-variable.

**Hypotheses.** ℓ,m≥1; Frobenius-semisimple WD, finite inertia; conductors are the imported Artin/Swan conductors.

**Needs:** [The segment-to-monodromy adapter](#segment-wd-adapter); `ArithmeticGaloisRepresentations:R01.2/weil-deligne-tensor-product`; `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`; `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`; `ArithmeticGaloisRepresentations:R01.3/wd-from-monodromy`.

**Construction/proof.**

1. Take inertia invariants of ker N: only the terminal raw special weight survives.
2. Use the special-block tensor decomposition to compute the pair L-polynomial; multiplicativity of gamma on WD short exact sequences computes gamma from the Weil weights.
3. Use the full Deligne epsilon definition and a(B)=Sw(r)+dim V−dim(ker N)^I to derive the conductor and epsilon identities.

**Check.** For normalized St_2 twisted by unramified χ(ϖ)=α, L(s)=(1−αq^{−s−1/2})^{-1} and conductor 1; the zero-monodromy object with the same Weil weights has two Euler factors and conductor 0.

**Sources.** [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.3–2.4, p.594. Gives the terminal-weight and pair special-block L/gamma formulas. [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2(d) p.3 and footnote 9 p.35. The full factor endpoint must be reconstructed after the semisimple character construction.

<a id="langlands-quotient-factors"></a>

### Analytic factors for segments and Langlands quotients

**Comparison target.** For essentially square-integrable segment representations δ,δ′, the analytic standard and pair L/gamma/epsilon factors equal the special-block formulas of the preceding node after replacing W,W′ by their supercuspidal analytic endpoints. For every irreducible π=L(δ_1,…,δ_t) in ordered Langlands standard data, L(s,π)=∏_i L(s,δ_i), and for π′=L(δ′_1,…,δ′_u), each pair L,γ,ε factor is the product over i,j of the corresponding δ_i×δ′_j factor. This includes nongeneric quotients and their canonical analytic factor definitions; it is stronger than multiplicativity for irreducible generic normalized inductions.

**Hypotheses.** δ_i are essentially square-integrable, ordered by decreasing real exponent; use the imported unique Langlands quotient, not an arbitrary irreducible subquotient of the same induced module.

**Needs:** [Full special-block factors and conductors](#special-block-factor-formulas); [Supercuspidal pair-factor compatibility](#cuspidal-pair-factors); `SmoothRepresentationsOfLocalGroups:SR.5`; `AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-induced-factor-product`; `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction/proof.**

1. Import the exact analytic segment formulas and nongeneric Langlands-data extension from AL.3; its accepted generic induced-factor product alone does not supply this statement.
2. Use Henniart’s formulas in §2.6 and §2.8 to state the needed extension and explicitly request the underlying JPSS §9 proof.
3. Combine the supercuspidal-pair endpoint with the special-block formulas to identify every standard-data product.

**Check.** For the trivial GL_2 quotient, use two length-one Langlands blocks. Substituting the length-two Steinberg block incorrectly removes an Euler factor.

**Sources.** [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.6 p.595 and §2.8 p.596. States analytic segment and arbitrary Langlands-quotient product formulas, citing JPSS 1983 §9 for the proof.

<a id="full-wd-parameter"></a>

### The full classical Weil–Deligne parameter

**Construction target.** For irreducible π=L(δ_1,…,δ_t), define LLC_WD(π)=⊕_i SegmentWDAdapter(δ_i), using the uniquely determined unordered multiset of ordered Langlands standard blocks. It is a Frobenius-semisimple WD isomorphism class of dimension n. Forgetting N and taking Weil semisimplification gives σ_ss(π). Inverse construction decomposes a Frobenius-semisimple WD object into irreducible Weil special blocks, translates each to a segment and takes the unique standard-data Langlands quotient. Frobenius semisimplification retains N; categorical semisimplification kills N and is a different operation.

**Hypotheses.** Use the existing Arithmetic WD carrier and special-block decomposition; no new equivalence relation or general monodromy classification is planned here.

**Needs:** [The segment-to-monodromy adapter](#segment-wd-adapter); [The character-defined semisimple Weil parameter](#semisimple-trace-parameter); `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification`; `ArithmeticGaloisRepresentations:R01.2/weil-deligne-direct-sum`; `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification-construction`; `ArithmeticGaloisRepresentations:R01.2/categorical-semisimplification-construction`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.5`.

**Construction/proof.**

1. Import uniqueness of GL_n Langlands data from current SR.3.3 and SR.5.3, and uniqueness of arithmetic WD special-block decomposition.
2. Apply the segment adapter to each block and the imported WD direct sum; permutation of blocks changes only the isomorphism representative.
3. Construct the inverse using the supercuspidal bijection and match both multisets. Compare forgotten Weil weights with the earlier character-parameter induction formula.

**API.**

- `ClassicalWDParameter.ofLanglandsData` (constructor): Map the imported unique standard data to the direct sum of its special WD blocks.
- `ClassicalWDParameter.inverse` (equivalence): Decompose the WD object and recover the unique Langlands quotient, inverse on isomorphism classes.
- `ClassicalWDParameter.weilSemisimplification` (compatibility): Forgetting N and semisimplifying r equals σ_ss(π).
- `ClassicalWDParameter.dimension` (simp): The WD dimension equals the rank n of GL_n.
- `ClassicalWDParameter.concatData` (functoriality): Concatenating standard block multisets, then reordering and taking their Langlands quotient, corresponds to WD direct sum; it is not a direct-sum operation on irreducible representation spaces.

**Uses.** ET.6a and AG2.1b/AG2.5: Use the full parameter without deducing N from semisimple traces. ES7:GLn-comparison and inner forms: Compare the constructed classical endpoint with a subsequent geometric parameter, and attach standard inner-form parameters.

**Unit tests.**

1. `ClassicalWDParameter.supercuspidal` (compatibility): A supercuspidal π maps to its irreducible σ_ss with N=0.
2. `ClassicalWDParameter.steinberg` (computation): Unitary St_2 maps to ω^{−1/2}Sp(2), so N≠0 and ker N has dimension 1.
3. `ClassicalWDParameter.trivialGL2` (non-example): The trivial GL_2 representation maps to (ω^{−1/2}⊕ω^{1/2},0), which has the same Weil semisimplification as St_2 and is not isomorphic to its WD object.

**Check.** Both inverse compositions preserve every special-block length; matching only the Weil semisimplification is insufficient.

**Sources.** [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.1–2.2 p.593; §2.5 p.595; §2.7–2.9 pp.595–596. The two multiset classifications define the full correspondence from the supercuspidal endpoint.

<a id="full-wd-correspondence"></a>

### Weil–Deligne local Langlands

**Theorem target.** For each n≥1, LLC_WD is a bijection between irreducible smooth complex representations of GL_n(F) and n-dimensional Frobenius-semisimple WD isomorphism classes with finite inertia. It commutes with duals, character twists and field isomorphisms; det(r)=ω_π through geometric reciprocity. Standard L/epsilon and all pair L/epsilon/gamma factors agree, with full monodromy. For every generic π and ψ of conductor O, its newvector exponent equals the Artin–Deligne conductor of LLC_WD(π). Equality with a later geometric semisimple GL_n parameter is an output theorem in ES7, consuming this endpoint, not an input to its construction.

**Hypotheses.** Same normalization, complex square root, ψ and measures throughout; the nongeneric analytic extension is the previous supplier contract.

**Needs:** [The full classical Weil–Deligne parameter](#full-wd-parameter); [Analytic factors for segments and Langlands quotients](#langlands-quotient-factors); [Integral Weil multiplicities from newvectors](#compact-type-integrality); [Full special-block factors and conductors](#special-block-factor-formulas); `ArithmeticGaloisRepresentations:R01.2/weil-deligne-dual-object`; `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction/proof.**

1. The inverse multisets prove bijectivity. The supercuspidal dual/twist/determinant theorem and the standard-data dual operation extend these properties to every block and quotient.
2. Use analytic Langlands-quotient products and special-block products for all factor identities.
3. Use the generic newvector theorem and the imported WD epsilon/conductor dictionary. No argument replaces N by zero when the Weil representation is already semisimple.

**Check.** In rank one this is reciprocity with N=0. For St_2 versus trivial GL_2 the monodromy and conductor checks distinguish parameters despite identical semisimple Weil traces.

**Sources.** [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2(c)–(d) and discussion, pp.3–4. States the standard full correspondence once the usual factors determine the extension. [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.9 p.596; Theorem 1.8 p.591 and Corollary 1.8 p.592, proof §4.5 p.600. Gives the full bijection and its factor properties; pair L-testing against lower-rank indecomposable blocks detects block lengths.

**Planet:** Weil–Deligne local Langlands.

## F. Additive transfer and actual inner-form parameters

<a id="additive-langlands-jacquet"></a>

### The additive Langlands–Jacquet quotient

**Construction target.** For n=rd let R(GL_n(F)) and R(GL_r(D)) be finite-length Grothendieck groups. Classical JL extends to an injective additive map JL_add from the inner group to the split group by mapping each Langlands standard-module basis element to the normalized induction of its transferred essentially square-integrable blocks. Let S_{n,D} be the span of standard modules whose block ranks are not all divisible by d; these have no matching inner Levi. Then R(GL_n)=im(JL_add)⊕S_{n,D}, and the canonical surjection LJ_D is the inverse on the first summand and zero on the second. It satisfies Θ_π(g)=(−1)^{n−r}Θ_{LJ_D([π])}(g′) on matching regular semisimple classes. This LJ_D already has the classical positive normalization on essentially square-integrables; multiplying it by a second sign is wrong. Its value on an irreducible can be zero or a signed virtual combination.

**Hypotheses.** Standard-module bases require both split and inner-form Langlands classifications; a Grothendieck class is not an irreducible representation.

**Needs:** [Jacquet–Langlands for essentially square-integrable representations](#esi-jacquet-langlands); `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction/proof.**

1. Use the standard-module basis theorem and classical JL on its essentially square-integrable blocks to define JL_add.
2. Character compatibility of normalized induction gives its identity on matching classes and proves injectivity. Split the standard basis by divisibility of every block rank.
3. Project along S_{n,D} and invert the transferred standard basis; character independence on inner forms proves the characterization.

**API.**

- `LanglandsJacquet.additiveTransfer` (constructor): Extend classical JL on the standard-module Z-basis to JL_add.
- `LanglandsJacquet.quotient` (constructor): Project onto im(JL_add), then invert, giving LJ_D.
- `LanglandsJacquet.retraction` (simp): LJ_D∘JL_add is the identity on the inner Grothendieck group.
- `LanglandsJacquet.kernel` (characterisation): ker LJ_D=S_{n,D}, the span of the nonmatching standard modules.
- `LanglandsJacquet.characterIdentity` (compatibility): On matching regular semisimple classes the character has sign (−1)^{n−r}, including virtual outputs.

**Uses.** Badulescu Theorem 3.6: Form the quotient representation ring compatible with induction and Jacquet coproducts. ET.6a/ET.7a and inner-form comparisons: Use virtual character transfer without claiming a nonexistent all-irrep JL bijection.

**Unit tests.**

1. `LanglandsJacquet.splitAlgebra` (degenerate): For d=1 the two groups coincide, S=0 and LJ_D is the identity.
2. `LanglandsJacquet.steinbergGL2` (compatibility): For quaternion D, LJ_D([St_2])=[1_{D×}] without an extra negative sign.
3. `LanglandsJacquet.reduciblePrincipalSeries` (computation): For quaternion D, [Ind_B^{GL_2}(ω^{1/2}⊠ω^{−1/2})]=[St_2]+[1] lies in S, so LJ_D([1])=−[1_{D×}] and the two constituent images cancel.

**Check.** No assertion that JL_add sends every irreducible to an irreducible, or that LJ_D([π]) is an actual positive representation.

**Sources.** [Alexandru Ioan Badulescu, Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), Proposition 3.1 p.14; Theorem 3.2 pp.14–16; Proposition 3.3 p.17. Constructs the standard-basis additive injection and canonical quotient, with their common character sign.

**Planet:** Langlands–Jacquet map.

<a id="jacquet-induction-quotient"></a>

### Induction and Jacquet compatibility of the quotient

**Theorem target.** In the graded finite-length representation ring R(F)=⊕_{n≥0}R(GL_n(F)), the subgroup S(D)=⊕S_{n,D}, including all degrees not divisible by d, is the Hopf ideal generated by essentially square-integrable generators of rank not divisible by d. Its quotient is the GL_r(D) graded representation ring through LJ_D. The product is normalized parabolic induction and the coproduct is the sum of semisimplified normalized Jacquet modules. For corresponding Levi partitions whose blocks all have ranks divisible by d, LJ commutes with induction and, after quotienting every tensor factor by the nonmatching ideal, with Jacquet restriction. It is not an equality of unquotiented Jacquet modules for arbitrary split partitions.

**Hypotheses.** The degree-zero unit is retained; virtual classes, normalized induction and normalized Jacquet restriction are used throughout.

**Needs:** [The additive Langlands–Jacquet quotient](#additive-langlands-jacquet); `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.5`.

**Construction/proof.**

1. Use the polynomial-ring presentation by essentially square-integrable standard generators; divisibility describes the ideal and quotient product.
2. Compare Jacquet modules of a transferred essentially square-integrable generator, using Badulescu Lemma 3.7. Its classical DKV Lemma B.2(b) input is an explicit unread-source gap.
3. Extend on the standard basis through the geometric lemma; discard tensor summands with a nondivisible degree before comparing coproducts.

**Check.** For n=2,d=2 the split (1,1) Jacquet tensor term vanishes in the quotient, since both factor degrees are nondivisible.

**Sources.** [Alexandru Ioan Badulescu, Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), Theorem 3.6 and Lemma 3.7 with proof, pp.19–23. Proves the quotient Hopf-ring compatibility; the Jacquet calculation cites DKV Appendix B and Zelevinsky’s segment Jacquet formula.

<a id="inner-form-standard-parameter"></a>

### The inner-form parameter from standard data

**Construction target.** For irreducible π′ of GL_r(D), take its unique ordered inner Langlands standard data δ′_1,…,δ′_t, transfer each essentially square-integrable block by classical JL, and set LLC_D(π′)=⊕_i LLC_WD(JL(δ′_i)). This is a dimension-rd Frobenius-semisimple WD class. Its image consists exactly of WD classes each of whose indecomposable special-block dimensions is divisible by d, and its inverse uses the classical inverse on each essentially square-integrable block and the inner Langlands quotient. The split quotient Q(π′) of the transferred standard data has this same WD parameter. No general identity LJ_D([Q(π′)])=[π′] or equality JL_add([π′])=[Q(π′)] is asserted: Badulescu’s version explicitly treats the general Q character identity as a conjecture.

**Hypotheses.** Import the all-inner-form Langlands standard-data classification as an SR.3 extension; it is stronger than a conditional general-group tempered-support contract.

**Needs:** [Weil–Deligne local Langlands](#full-wd-correspondence); [Jacquet–Langlands for essentially square-integrable representations](#esi-jacquet-langlands); `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification`; `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction/proof.**

1. Apply the classical essentially square-integrable bijection and the split full WD block adapter to every inner standard block.
2. Use uniqueness of inner standard data and arithmetic special blocks to prove independence and the inverse image criterion.
3. Relate Q only through its defining split standard data. Keep the triangular additive-transfer relation separate from an irreducible quotient claim.

**API.**

- `InnerFormWDParameter.ofStandardData` (constructor): Take the direct sum of full WD parameters of classical JL transfers of the inner standard blocks.
- `InnerFormWDParameter.imageCriterion` (characterisation): A WD class is in the image precisely when every indecomposable block dimension is divisible by d.
- `InnerFormWDParameter.inverse` (equivalence): Invert each classical block and take the unique inner Langlands quotient.
- `InnerFormWDParameter.splitQuotient` (compatibility): The split quotient Q of transferred standard data has exactly this WD parameter.

**Uses.** ET.6a and unitary inner-form local comparisons: Attach parameters to actual inner representations, distinct from additive transfer. ET.6 nontransfer example: Detect the absence of an inner-form parameter without inferring vanishing of its signed LJ class.

**Unit tests.**

1. `InnerFormWDParameter.split` (compatibility): For d=1 the construction agrees with LLC_WD on GL_r(F).
2. `InnerFormWDParameter.quaternionTrivial` (computation): For r=1,d=2, the trivial D× representation maps to ω^{−1/2}Sp(2), through St_2.
3. `InnerFormWDParameter.totalDimensionInsufficient` (non-example): The zero-monodromy sum ω^{−1/2}⊕ω^{1/2} has total dimension 2 but two one-dimensional indecomposable blocks, so it is outside the quaternion parameter image.

**Check.** The parameter image criterion concerns each indecomposable block, not merely divisibility of the total dimension.

**Sources.** [Alexandru Ioan Badulescu, Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), §3.3, definition of Q p.24 and Proposition 3.9 p.25; Proposition 3.11 p.26; §3.4.1 conjecture p.27. Defines the transferred Langlands quotient and distinguishes its triangular relationship from additive transfer. [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.7–2.9 pp.595–596. Translates the transferred split standard data to a full WD block multiset.

<a id="principal-series-nontransfer"></a>

### Principal-series nontransfer and virtual cancellation

**Theorem target.** For a nontrivial inner form d>1 and n divisible by d, every irreducible generic principal series induced from n rank-one characters has a full parameter with n one-dimensional, zero-monodromy blocks and hence no corresponding GL_{n/d}(D) representation under LLC_D. Its irreducible induced standard class has LJ_D=0. At a reducibility point only the entire induced standard class is killed; individual irreducible constituents can have nonzero signed transfers. For quaternion D, the reducible GL_2 standard module with constituents St_2 and 1 has LJ images +1_{D×} and −1_{D×}. The trivial GL_2 constituent has no inner parameter although its LJ image is nonzero.

**Hypotheses.** For the first claim the normalized principal series is irreducible; at reducibility use Grothendieck additivity, not an assertion about each constituent.

**Needs:** [The inner-form parameter from standard data](#inner-form-standard-parameter); [The additive Langlands–Jacquet quotient](#additive-langlands-jacquet); [The full classical Weil–Deligne parameter](#full-wd-parameter); `SmoothRepresentationsOfLocalGroups:SR.5`.

**Construction/proof.**

1. Use the split Langlands data and WD block image criterion.
2. Every rank-one standard block fails divisibility by d, so the standard class belongs to ker LJ_D.
3. At the GL_2 reducibility point the classical St_2 transfer and the exact constituent relation determine the negative trivial-representation image.

**Check.** An assertion that every nonrelevant irreducible has zero LJ fails on trivial GL_2.

**Sources.** [Alexandru Ioan Badulescu, Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), Theorem 3.2 pp.14–16; Proposition 3.3 p.17. The nonmatching standard-module kernel explains both irreducible principal-series vanishing and constituent cancellation. [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.7–2.9 pp.595–596. The Langlands-data full parameter keeps each rank-one block and its zero monodromy.

<a id="normalization-regressions"></a>

### Worked classical normalization checks

**Application target.** Compute the following shared regression cases. An unramified GL_1 character χ(ϖ)=α has N=0, L=(1−αq^{−s})^{-1}, and conductor 0. For GL_2, the trivial representation has σ_ss=ω^{−1/2}⊕ω^{1/2}, N=0 and L=(1−q^{−s+1/2})^{-1}(1−q^{−s−1/2})^{-1}; unitary St_2 has the same σ_ss, N of rank 1, L=(1−q^{−s−1/2})^{-1} and conductor 1. For unramified θ on the Weil side of an irreducible unramified-quadratic induction, a genuinely non-Frobenius-invariant character must be ramified: an unramified character of W_E is invariant and its induction is reducible. For a regular tame character of the residue units of E, its irreducible quadratic Weil induction has N=0, no inertia invariants, L=1 and Artin conductor 2; the bijection gives its supercuspidal endpoint. Finally, at residue degree two the connected-height-one harmonic descent coefficient in rank two and r=1 is q=p², not p.

**Hypotheses.** E/F is the unramified quadratic extension and the tame residue character satisfies θ^q≠θ; its local character extension to W_E is fixed through geometric reciprocity.

**Needs:** [Weil–Deligne local Langlands](#full-wd-correspondence); [Principal-series nontransfer and virtual cancellation](#principal-series-nontransfer); [Harmonic descent and normalized induction](#harmonic-descent-formula); `ArithmeticGaloisRepresentations:R01.3/wd-from-monodromy`; `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction/proof.**

1. Evaluate the imported rank-one Euler factor and arithmetic special block at geometric Frobenius.
2. Use the two Langlands data multisets and ker N to compute GL_2 Euler polynomials and the monodromy conductor term.
3. Use induced Weil restriction on inertia, tame Swan conductor 0 and the degree-two residue cardinality to check the other two boundary calculations; the type classification is imported from SR.4.

**Check.** The tame example requires a noninvariant residue character; unramified quadratic induction of an unramified character is not a supercuspidal example.

**Sources.** [Guy Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.3–2.4 p.594 and §2.7–2.9 pp.595–596. The block and Langlands-data formulas give the explicit rank-two factor tests. [Peter Scholze, The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 12.3 pp.31–32; Lemma 6.1 p.15. The bijection supplies the irreducible tame endpoint; the descent prefactor tests the residue-cardinality convention.

## Suggested file and full target signatures

The [suggested file](../suggested/EndoscopicTransferAndUnitaryTraceComparison--ET.6.lean)
contains two real-bodied matrix definitions, four milestone statements and
three examples. It elaborates at the pinned baseline with only proof-placeholder
warnings. The raw matrices verify arithmetic-Frobenius covariance, nilpotency,
the orientation of ker N, and identical characteristic polynomials in the
presence of distinct monodromy. They are projections of the imported special
object and supply no general WD carrier.

The names RawSpecialBlock2.frobenius, RawSpecialBlock2.monodromy and
RawSpecialBlock2.covariance correspond exactly to the segment adapter API. Its
sameWeilDifferentMonodromy test and length-two check have matrix projections in
the file. Every other object and target above requires a carrier supplied by
its owning roadmap: ClassicalNormalization, DrinfeldDeformationInstance,
NearbyTraceFunction, DieudonneNorm, ClassicalWeilParameter,
PotentiallyAbelianPair, SegmentWDAdapter, ClassicalWDParameter,
LanglandsJacquet and InnerFormWDParameter remain precisely specified reader
targets. They are not replaced with proposition-valued records or unspecified
actions. Their complete API and unit-test names above remain the definitive
signature plan.

## Supplier contracts

The packet records the following contracts. Existing current roadmap imports
are requirements to use their APIs, not new plans for those roadmaps. The ET.4
and SR.3 requests describe proposed early owners until the restructuring is
applied.

### Contract 1: EndoscopicTransferAndUnitaryTraceComparison:ET.4

Make an early ET.4b prefix after AS.6, ET.3 and ET.4: AC I §6 Theorem 6.2, Proposition 6.7 and Lemma 6.10 with normalized twisted character identities for tempered representations (and their essential twists), and extension to all irreducibles through Langlands quotients without asserting those identities for every non-tempered representation; AC III Theorems 4.2 and 6.2 for global prime-cyclic base change/descent and cyclic automorphic induction; Harris–Taylor VI.1.1, VI.2.1, VI.2.9–VI.2.10 restricted cohomological unitary-to-GL transfer, retaining the auxiliary GL_1 character. Supply VI.2.3 isolation, VI.2.5/2.11 ESI and Speh globalization and VI.2.6 ESI globalization with a supercuspidal x-component. ET.7a consumes these exports and never supplies them to ET.6.

**Consumers:** [Harmonic descent and normalized induction](#harmonic-descent-formula); [The simple unitary point count on raw cohomology](#auxiliary-geometric-trace); [Positive Weil traces from early unitary globalization](#positive-weil-traces); [The compact-group Lubin–Tate virtual comparison](#local-lubin-tate-virtual-comparison); [Restricted global Weil extraction without monodromy](#restricted-global-weil-extraction); [Functoriality of the semisimple parameter](#functorial-weil-parameter); [Supercuspidal local Langlands](#cuspidal-weil-bijection); [Harris non-Galois automorphic induction](#harris-solvable-induction); [Jacquet–Langlands for essentially square-integrable representations](#esi-jacquet-langlands).

### Contract 2: EndoscopicTransferAndUnitaryTraceComparison:ET.4

Instantiate the independent simple compact unitary trace identity for Scholze §8 division data, including ker^1 multiplicity, the n factor and central p^{−r′} coset. General CSnc stable-elliptic data alone is insufficient.

**Consumers:** [The simple unitary point count on raw cohomology](#auxiliary-geometric-trace); [Positive Weil traces from early unitary globalization](#positive-weil-traces).

### Contract 3: SmoothRepresentationsOfLocalGroups:SR.3

SmoothRepresentations characters Part II: Harish-Chandra locally integrable characters, local constancy on the regular semisimple locus, distribution character identity, Clozel’s twisted character on G⋊θ, untwisted/twisted Weyl integration and character–Jacquet compatibility. Include elliptic JL orthogonality/independence. Build after SR.3, ET.1 and ReductiveGroupsPartII:RG2.0; supply ET.4 and ET.6, not ET.1. Do not assume twisted character values for a general reductive group are stable.

**Consumers:** [The nearby-cycle test function](#nearby-trace-function); [Norm comparison of orbital integrals and traces](#basic-norm-integrals); [Harmonic descent and normalized induction](#harmonic-descent-formula); [Type isolation and the trace-to-parameter reduction](#type-and-density-reduction); [The compact-group Lubin–Tate virtual comparison](#local-lubin-tate-virtual-comparison); [Integral Weil multiplicities from newvectors](#compact-type-integrality); [Supercuspidal local Langlands](#cuspidal-weil-bijection); [The full classical Weil–Deligne parameter](#full-wd-parameter); [Weil–Deligne local Langlands](#full-wd-correspondence); [Jacquet–Langlands for essentially square-integrable representations](#esi-jacquet-langlands); [The additive Langlands–Jacquet quotient](#additive-langlands-jacquet); [The inner-form parameter from standard data](#inner-form-standard-parameter).

### Contract 4: SmoothRepresentationsOfLocalGroups:SR.3

In the same smooth-representation extension supply Schneider–Zink Proposition 11 in precisely the generalized-Speh versus square-integrable separation used by Scholze Lemma 3.1(i), and Kazhdan density for Lemma 3.1(ii). Import current SR.3 Bernstein-centre regular functions and universal unramified twists for Lemma 3.2. Supply genericity of supercuspidals and the all-rank K_1(c) newvector theorem JPSS §5.1 with Jacquet 2012’s corrected essential-vector proof. Current SR.5 excludes all-rank newforms; AL.5’s reference to them does not establish them.

**Consumers:** [Type isolation and the trace-to-parameter reduction](#type-and-density-reduction); [Integral Weil multiplicities from newvectors](#compact-type-integrality).

### Contract 5: SmoothRepresentationsOfLocalGroups:SR.3

Import current SR.3.3 Langlands-support/standard-data API for GL_n; extend only where needed to an unconditional GL_r(D) essentially square-integrable standard-module basis and unique Langlands quotient, with split/inner segment orientation fixed. A conditional general-group tempered-support theorem is insufficient.

**Consumers:** [The full classical Weil–Deligne parameter](#full-wd-parameter); [Weil–Deligne local Langlands](#full-wd-correspondence); [The additive Langlands–Jacquet quotient](#additive-langlands-jacquet); [The inner-form parameter from standard data](#inner-form-standard-parameter).

### Contract 6: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category

Import the existing early abelian smooth category and finite-length Grothendieck class/additivity interface, separately from its derived enhancement. No late excursion or sheaf input.

**Consumers:** [The additive Langlands–Jacquet quotient](#additive-langlands-jacquet).

### Contract 7: SmoothRepresentationsOfLocalGroups:SR.2

Import current normalized induction, unnormalized and normalized Jacquet functors, transitivity, geometric lemma and their finite-length/Grothendieck additivity; harmonically compare the half-modulus conversion explicitly.

**Consumers:** [Connected–étale descent of nearby cycles](#geometric-descent-formula); [Harmonic descent and normalized induction](#harmonic-descent-formula); [The additive Langlands–Jacquet quotient](#additive-langlands-jacquet); [Induction and Jacquet compatibility of the quotient](#jacquet-induction-quotient).

### Contract 8: SmoothRepresentationsOfLocalGroups:SR.5

Import the current TauCetiRoadmap SmoothRepresentations SR.5.3 highest-derivative-adapter: the two segment conventions, multisegment classification, Zelevinsky involution, unique standard quotient and segment Jacquet formula. Existing current main is the sole owner; no segment or ladder classification is replanned here.

**Consumers:** [The segment-to-monodromy adapter](#segment-wd-adapter); [Analytic factors for segments and Langlands quotients](#langlands-quotient-factors); [The full classical Weil–Deligne parameter](#full-wd-parameter); [Induction and Jacquet compatibility of the quotient](#jacquet-induction-quotient); [Principal-series nontransfer and virtual cancellation](#principal-series-nontransfer).

### Contract 9: SmoothRepresentationsOfLocalGroups:SR.4

Import current Iwahori fixed-vector/support classification and the compact type framework. For Scholze 12.1(v), pair the existing Iwahori criterion with H1’s exact inertia-average calculation; this is not a hyperspecial fixed-vector criterion.

**Consumers:** [Functoriality of the semisimple parameter](#functorial-weil-parameter); [Worked classical normalization checks](#normalization-regressions).

### Contract 10: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1

Request a FiniteFlatGroups Part II after R07.1–R07.2 for strict relative O-action, dimension-one height-n marked deformations, full Cartier-divisor Drinfeld levels, regular finite covers and strict truncated-O algebraization (Scholze 2.3–2.4/Faltings). R07.1 supplies ordinary p-divisible groups and R07.2 their Dieudonné classification; neither supplies this deformation theorem. R07.3 is Fontaine–Laffaille theory and is not the deformation supplier. Preserve the existing contravariant and covariant carriers.

**Consumers:** [Strict O-module deformations with Drinfeld levels](#drinfeld-deformation-instance); [The auxiliary quasi-EL test-function calculation](#quasi-el-test-function-comparison).

### Contract 11: ClassicalAdicEtaleCohomology:H1

Supply finite ℓ-adic nearby cycles on the equivariant finite-type algebraizations of formal strict-O deformation spaces: finiteness in degrees 0,…,n−1, formal-disc invariance, proper base change, Berkovich comparison, congruence-near-identity action invariance and ℓ-independent alternating finite automorphism/Frobenius traces. Deformations 2.8–2.10, 3.15 and 4.2–4.3 specify the controlled-cohomology contract.

**Consumers:** [Strict O-module deformations with Drinfeld levels](#drinfeld-deformation-instance); [The nearby-cycle test function](#nearby-trace-function); [Rationality and local constancy of the test function](#test-function-regularity); [Connected–étale descent of nearby cycles](#geometric-descent-formula); [The simple unitary point count on raw cohomology](#auxiliary-geometric-trace); [Functoriality of the semisimple parameter](#functorial-weil-parameter).

### Contract 12: ClassicalAdicEtaleCohomology:H1

Supply the all-F inertia-average calculation for Scholze 12.1(v): (1−q^r)tr_ss equals the trace on derived inertia invariants and the latter cohomology is independent of basic β. His footnote 8 uses finite-type algebraizations to extend the referenced Q_p calculation. A generic nearby-cycle existence theorem does not supply this calculation.

**Consumers:** [Functoriality of the semisimple parameter](#functorial-weil-parameter).

### Contract 13: PELModuli:M2

Import PELModuli M0–M2’s O_B-action, polarization and determinant framework. Extend it to the strict relative p-divisible quasi-EL datum and its Morita decomposition, with independent étale generators as in Scholze §7 and Deformations 3.14. The current M2 unitary deformation node assumes an unramified CM field at p; it does not by itself establish this arbitrary ramified local O-action case.

**Consumers:** [The auxiliary quasi-EL test-function calculation](#quasi-el-test-function-comparison).

### Contract 14: PELModuli:M4

Import M4’s ker^1-indexed canonical generic fibre and higher-level normalization contracts. Supply the auxiliary compact CM division PEL model, proper flat closure and Serre–Tate completed-local comparisons for the arbitrary local F of Scholze §8 and Deformations 5.2, 5.4–5.8. Current M4 good-prime normalization alone does not supply the ramified strict-O moduli or its level-structure interpretation.

**Consumers:** [The simple unitary point count on raw cohomology](#auxiliary-geometric-trace).

### Contract 15: AutomorphicGaloisRepresentationsPartII:AG2.1a

Instantiate only the existing early finite-level coefficient cohomology, commuting Weil/Hecke projectors, actual geometric Galois action and graded automorphic multiplicity spaces for Scholze’s compact auxiliary division data. Preserve alternating versus actual parity classes and finite multiplicity. ET.6 proves its own auxiliary point-count/test-function calculation on these objects; do not import AG2.1b/AG2.2/AG2.5, ET.6a concentration, or an Igusa torsion theorem.

**Consumers:** [The simple unitary point count on raw cohomology](#auxiliary-geometric-trace); [Restricted global Weil extraction without monodromy](#restricted-global-weil-extraction).

### Contract 16: AutomorphicFormsOnReductiveGroups:AF.5

Import AF.5/gl1-dictionary, current GlobalNumberFields algebraic Hecke characters and their norm/twist/infinity-type APIs. Supply the precise conjugate-self-dual half-normalization correcting characters used by Scholze 13.2 and 13.6, with strong multiplicity-one comparison supplied by the early automorphic prefix. Archimedean LLC itself is the existing AF.1/archimedean-llc-gln node.

**Consumers:** [Restricted global Weil extraction without monodromy](#restricted-global-weil-extraction); [Potentially abelian automorphic–Weil pairs](#potential-abelian-automorphic-pair); [Harris non-Galois automorphic induction](#harris-solvable-induction); [Henniart’s highly ramified functional-equation argument](#highly-ramified-isolation).

### Contract 17: ArithmeticGaloisRepresentations:R01.1

For Weil representations with finite inertia, extend the existing representation operations to cyclic restriction/orbit Clifford calculations and Brauer induction after an unramified scalar twist, using current InductionRestriction Layers 5–6 rather than rebuilding finite-group theory. For the global step require global Weil groups and algebraic Weil-to-ℓ-adic realizations from a ClassFieldTheory Part II (current ClassFieldTheory explicitly excludes global Weil groups); define its localization/finite-extension descent and verify agreement at every v∤ℓ (Scholze 13.4).

**Consumers:** [Supercuspidal local Langlands](#cuspidal-weil-bijection); [Potentially abelian automorphic–Weil pairs](#potential-abelian-automorphic-pair); [Supercuspidal pair-factor compatibility](#cuspidal-pair-factors).

### Contract 18: AutomorphicLFunctionsAndLocalFactors:AL.1

Supply global Hecke-character approximation with prescribed trivial component at the distinguished place and arbitrarily large conductors at a finite other set, plus the global Weil/Hecke functional equation and the fixed Tate measure/s-variable dictionary.

**Consumers:** [Henniart’s highly ramified functional-equation argument](#highly-ramified-isolation).

### Contract 19: AutomorphicLFunctionsAndLocalFactors:AL.3

Supply Henniart 2000 Corollary 2.4’s highly ramified pair stability, including analytic and Weil vanishing L=1 and epsilon comparison under equal dimensions/determinants. Retain ψ and measures, and state the threshold depending on the fixed local pair. Its primary proof remains a recorded access gap.

**Consumers:** [Henniart’s highly ramified functional-equation argument](#highly-ramified-isolation).

### Contract 20: AutomorphicLFunctionsAndLocalFactors:AL.3

Supply exact segment-pair factor formulas and the all-Langlands-quotient, including nongeneric, standard/pair L,gamma,epsilon products stated in Henniart 2002 §2.6 and §2.8, with the JPSS 1983 §9 analytic proof. The accepted rs-induced-factor-product is limited to generic irreducible normalized inductions.

**Consumers:** [Integral Weil multiplicities from newvectors](#compact-type-integrality); [Analytic factors for segments and Langlands quotients](#langlands-quotient-factors).

### Contract 21: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Import this existing current TauCetiRoadmap layer exactly at its stated scope. The reader identifies the API consumed; this request introduces no new target in the upstream roadmap.

**Consumers:** [The classical normalization dictionary](#normalization-dictionary).

### Contract 22: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

Import this existing current TauCetiRoadmap layer exactly at its stated scope. The reader identifies the API consumed; this request introduces no new target in the upstream roadmap.

**Consumers:** [The classical normalization dictionary](#normalization-dictionary).

### Contract 23: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic

Import this existing current TauCetiRoadmap layer exactly at its stated scope. The reader identifies the API consumed; this request introduces no new target in the upstream roadmap.

**Consumers:** [Potentially abelian automorphic–Weil pairs](#potential-abelian-automorphic-pair).

### Contract 24: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters

Import this existing current TauCetiRoadmap layer exactly at its stated scope. The reader identifies the API consumed; this request introduces no new target in the upstream roadmap.

**Consumers:** [Potentially abelian automorphic–Weil pairs](#potential-abelian-automorphic-pair).

### Contract 25: tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup

Import this existing current TauCetiRoadmap layer exactly at its stated scope. The reader identifies the API consumed; this request introduces no new target in the upstream roadmap.

**Consumers:** [Supercuspidal local Langlands](#cuspidal-weil-bijection).

### Contract 26: tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction

Import this existing current TauCetiRoadmap layer exactly at its stated scope. The reader identifies the API consumed; this request introduces no new target in the upstream roadmap.

**Consumers:** [Supercuspidal pair-factor compatibility](#cuspidal-pair-factors).

### Contract 27: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Extend the contravariant p-divisible classification to strict relative O-linear Dieudonné modules F=βσ and the étale O_A^op-linear rank-one case F=β⁻¹σ₀. Supply Morita decomposition, the opposite endomorphism algebra, integral σ-conjugacy and chosen-isomorphism transport. This is a convention adapter on the existing contravariant carrier, not an identification with its covariant counterpart.

**Consumers:** [Strict O-module deformations with Drinfeld levels](#drinfeld-deformation-instance); [Dieudonné norms in the étale and basic cases](#etale-dieudonne-norm).

### Contract 28: AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln

Import the planned real/complex GL_n archimedean LLC endpoint with the same norm convention, algebraic infinity types and compatibility with cyclic restriction/automorphic induction. The AF.1 and AF.5 packets currently have needs_changes reviews, so neither is represented here as an accepted or formalized theorem.

**Consumers:** [Potentially abelian automorphic–Weil pairs](#potential-abelian-automorphic-pair); [Harris non-Galois automorphic induction](#harris-solvable-induction).

## Primary-proof gaps required for closure

### Restricted unitary base change and simultaneous globalization: primary source access

Harris–Taylor VI.1.1, VI.2.1, VI.2.3, VI.2.5–2.6, VI.2.9–2.11 and VII.2.10 are not freely available and the book is not registered as cleared. Scholze 10.2/10.5/10.7/14.2 precisely states how these inputs are used, but their independent primary proofs were not read. Resolve through cleared access or a fully read public proof, and the ET.4b supplier.

**Affected targets:** [Positive Weil traces from early unitary globalization](#positive-weil-traces); [Restricted global Weil extraction without monodromy](#restricted-global-weil-extraction); [Harris non-Galois automorphic induction](#harris-solvable-induction); [Henniart’s highly ramified functional-equation argument](#highly-ramified-isolation).

### Classical all-inner-form JL and Jacquet comparison: primary source access

Deligne–Kazhdan–Vignéras, Représentations des algèbres centrales simples p-adiques, and Appendix B Lemma B.2(b), are not in the cleared library. Badulescu §3.1 p.13 restates the all-r,d classical theorem and §3.2 explicitly uses B.2(b); those are not independent proofs of either input. Resolve both primary proofs before closure.

**Affected targets:** [Jacquet–Langlands for essentially square-integrable representations](#esi-jacquet-langlands); [Induction and Jacquet compatibility of the quotient](#jacquet-induction-quotient).

### Highly ramified stability: primary proof unread

Henniart, Une preuve simple..., Invent. Math. 139 (2000), Corollary 2.4, pp.439–455, is cited by Scholze 14.1. The institutional preprint was retrievable only as PostScript and the publisher PDF was inaccessible; its proof was not read. AL.3 must provide its exact normalized stability and the argument that separates the remaining local L and epsilon factors.

**Affected targets:** [Henniart’s highly ramified functional-equation argument](#highly-ramified-isolation).

### Analytic segment and nongeneric factor formulas: proof supplier incomplete

Henniart 2002 §2.6/§2.8 states the needed formulas and points to JPSS, Rankin–Selberg convolutions (1983), §9. The source scan was located but its §9 proof was not read in this pass. The accepted AL.3 generic product node is narrower. Read that proof and extend the AL supplier to precise nongeneric Langlands-data factors.

**Affected targets:** [Analytic factors for segments and Langlands quotients](#langlands-quotient-factors); [Weil–Deligne local Langlands](#full-wd-correspondence).

### Compact type isolation and density: primary proofs unread

Schneider–Zink Proposition 11 and Kazhdan density are imported in Scholze Lemmas 3.1–3.2. Their primary proofs were not read in this pass; the character/smooth-representation prefix must establish the precise generalized-Speh separator, its vanishing on square-integrables, and finite-length trace density. Isolation of an essentially square-integrable unramified family would be the wrong contract.

**Affected targets:** [Type isolation and the trace-to-parameter reduction](#type-and-density-reduction).

## Source versions and corrections

Sources were read on 14 October 2026. Locators use the editions below; a reference to a statement is distinguished from a read independent proof. No passages of a source are reproduced.

### Peter Scholze: The Local Langlands correspondence for GL_n over p-adic fields

Author PDF dated 7 October 2010, 37 pages; arXiv:1010.1540v1 pagination. [Source](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf). SHA-256: `11358ca04e158f455a08d59fc31afa3dc324ad816c53eef571d5fa7dbce6f002`.

**Read receipt:** Theorems 1.1–1.4 and §§2–14, pp.2–36, read in full.

### Peter Scholze: The Langlands–Kottwitz method and deformation spaces of p-divisible groups

Author PDF titled Deformation spaces of p-divisible groups, dated 2 October 2011, 33 pages; prepublication pagination. [Source](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf). SHA-256: `baf2a72a43e12f48adb4f701ad89191df781c8ca4f8d56e85da93a803a355188`.

**Read receipt:** §2 Theorems 2.8–2.10, pp.7–10; §3 Definitions 3.3, 3.11 and Propositions 3.9–3.15, pp.11–18; §4, pp.19–22; §5, pp.22–27; §6 and §7, pp.27–32.

### James Arthur and Laurent Clozel: Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula

Annals of Mathematics Studies 120 (1989), Clay-hosted scan; printed page = PDF page minus 16. [Source](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). SHA-256: `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737`.

**Read receipt:** Chapter I §2, Lemma 2.1 and Propositions 2.2–2.3, pp.10–12; Chapter I §6, Definition 6.1 and Theorem 6.2 pp.51–52, proof pp.52–57, Propositions 6.6–6.9 pp.58–61, Lemma 6.10 and proof pp.62–64; Chapter III Theorem 4.2 pp.202–203, Definition 6.1 and Theorem 6.2 with beginning of proof pp.214–216.

### Guy Henniart: Une caractérisation de la correspondance de Langlands locale pour GL(n)

Bulletin de la Société Mathématique de France 130(4) (2002), 587–602, published Numdam PDF. [Source](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf). SHA-256: `40c0ed7c7bfb05f1415fd66642d0b1984052f0af7cb5f3061b328216e2d24306`.

**Read receipt:** §1, Theorems 1.5–1.8 and Corollary 1.8, pp.588–592; §2.1–2.9, pp.593–596; §3.1–3.2, p.597; §§3.3–5.3, pp.598–602, including §4.5 uniqueness proof, read.

### Alexandru Ioan Badulescu: Correspondance de Jacquet–Langlands étendue à toutes les représentations

arXiv:math/0201142v2, dated 8 April 2003, 38 pages; use this version’s numbering. [Source](https://arxiv.org/pdf/math/0201142). SHA-256: `087e08bb3393683a8c85a2e3e4bbda0dd3d3dba4b21cb771e135049b11094f23`.

**Read receipt:** Introduction pp.1–5; §3.1, Proposition 3.1, Theorem 3.2 and Proposition 3.3, pp.13–17; §3.2, Theorem 3.6 and Lemma 3.7 with proof, pp.19–23; §3.3, Propositions 3.9, 3.11 and Lemma 3.10, pp.23–26; §3.4.1, conjecture p.27.

### Hervé Jacquet, Ilya Piatetski-Shapiro and Joseph Shalika: Conducteur des représentations du groupe linéaire

Mathematische Annalen 256 (1981), 199–214; published scan on Jacquet’s page, one cover page. [Source](https://www.math.columbia.edu/~hj/conducteur.pdf). SHA-256: `b34acd70b4fbacc442441df0fa07f333ec8cd9708b7386ee0f88a564a8f29536`.

**Read receipt:** §1.1–1.3, pp.199–200; §4.4 and §5.1 theorem, p.211; §5.2 beginning of proof, pp.211–212; use the corrected essential-vector proof below; §4.1–4.2 theorem and existence argument, pp.208–210, read from rendered scan.

### Hervé Jacquet: A correction to Conducteur des représentations du groupe linéaire

Pacific Journal of Mathematics 260(2) (2012), 515–525, publisher PDF. [Source](https://msp.org/pjm/2012/260-2/pjm-v260-n2-p09-s.pdf). SHA-256: `98f02c2aef04bff162c1ceb0a42dd122da746d1304a90d82366a848f22713adf`.

**Read receipt:** Introduction pp.515–517; Theorem 1 p.517 and §1 pp.517–518; essential-vector proof §§2–3 pp.519–524.

### E-ET6-1

7 October 2010 author PDF, Lemma 6.1 and the first displayed proof formula, p.15. The harmonic-descent prefactor is expressed using the rational prime p rather than the residue cardinality of the arbitrary p-adic field F. Use q^{(n−k)r}, where q=|κ_F|, in both prefactors. The connected-height-k modulus is evaluated at a uniformizer of F and uses |ϖ|=q^{-1}. For residue degree two, n=2,k=1,r=1, this gives p² instead of the printed p. No correction located for this author copy; the finding is restricted to the hashed 2010 version. The 2013 published version was not collated, so no claim is made about its wording.

**Independent source review:** confirmed. Confirmed against Lemma 6.1 and its proof: the modulus uses |ϖ_F|=q⁻¹, so residue degree two distinguishes q from p.

### E-ET6-2

Published 1981 article, §4.1 theorem p.208 and existence proof §4.2 pp.208–210, especially the ideal conclusion on p.210; correction Jacquet 2012 Remark 1 p.523. The original existence proof concludes that its symmetric Laurent-polynomial ideal is the full ring from an insufficient common-zero argument. Use Jacquet 2012 Lemmas 4–5 and §3 to establish a nonvanishing polynomial at every nonzero tuple, apply the Nullstellensatz and obtain the essential vector. Jacquet’s Remark 1 explains that the original argument proves only absence of a common coordinate-hyperplane obstruction; that does not establish the claimed full-ring ideal in general. His replacement proof checks every tuple. The original proof does suffice when L(s,π)=1. Published correction: Jacquet, Pacific J. Math. 260 (2012), 515–525, Theorem 1 and §§2–3; DOI 10.2140/pjm.2012.260.515.

**Independent source review:** confirmed. Confirmed in the 1981 scan and Jacquet 2012 Remark 1: the older ideal argument is incomplete, while the replacement proves nonvanishing at every tuple before using the Nullstellensatz.

### E-ET6-3

7 October 2010 author PDF, proof of Corollary 10.3 p.27, compared with Corollary 10.1 p.26; related proof choice in Theorem 10.6 p.27. After globalizing π∨ with π_w=π∨⊗χ, the proof proposes a⁻¹W∨⊗χ_sim⁻¹⊗χ⁻¹, although Corollary 10.1 has the trace of W⊗χ_sim. Use rec_un(π)=a⁻¹W⊗χ_sim⊗χ. For restricted global extraction, globalize Π∨ and use the effective sign(a)W⊗χ_ψ; no later local duality theorem is needed. With χ(ϖ)=u and f supported on determinant valuation r, tr(f∨|π_w)=u⁻ʳtr(f|π), whereas tr(h∨|π_w)=tr(h|π). Corollary 10.1 therefore gives the trace of a⁻¹W⊗χ_sim multiplied by uʳ. It cannot instead give its dual and inverse twists. This direct substitution also fixes the effective global construction. No correction located for the hashed 2010 author copy; the published 2013 text was inaccessible and is not accused of this error.

**Independent source review:** confirmed. Confirmed by substituting π_w∨=π⊗χ⁻¹ into Corollary 10.1 and using determinant valuation r; the positive twists follow without any duality input.

### E-ET6-4

7 October 2010 author PDF, definition of [Rψ](ρ), statement and proof of Corollary 11.3 and Remark 11.4 p.29; ensuing Corollary 11.5 proof p.30. The statement labels the multiplicity by ρ∨, while its preceding Hom definition and final proof integral use ρ. With M(ρ)=Hom_{D×}(ρ,c-Ind[RΨ]), the identity is M(ρ)=(−1)^{n−1}π∨|_K⊗rec_un(π), π=JL(ρ). Use that same multiplicity in the ensuing integrality argument. The proof integrates tr(d⁻¹|R)Θ_ρ(d), which is the character projector to Hom(ρ,R). On a finite cyclic quotient a character ρ of order greater than two contributes average ρ(d⁻¹)ρ(d)=1; replacing that multiplicity by ρ∨ gives average ρ(d)²=0. The h∨ trace accounts separately for π∨. No correction located for the hashed 2010 author copy; no assertion is made about the inaccessible published text.

**Independent source review:** confirmed. Confirmed from the Hom definition and final character integral on p.29, including the finite cyclic projector check; the correction is scoped to the author copy.

### E-ET6-5

7 October 2010 author PDF, generalized-Speh definition before Lemma 3.1 and the tempered family in Lemma 3.1(i), p.9. With n=dt fixed, the generating supercuspidal is labelled as a GL_k representation; the tempered comparison family then uses t copies of the rank-n Speh symbol instead of the rank-d supercuspidal symbol. Take the generating supercuspidal ρ on GL_d(F), and form the tempered family from t unitary unramified twists of that ρ. The ranks of the t inducing blocks must sum to n=dt. Reusing the rank-n Speh representation would instead produce rank tn. The compact type proof on the same page specifies the intended supercuspidal inertial support. No correction located for the hashed 2010 author copy; the published text was not collated.

**Independent source review:** confirmed. Confirmed the two index slips at p.9; the rank count and inertial-support argument uniquely identify the intended lower-rank supercuspidal.

### Strict O-module deformation ownership

The existing R07.3 plans Fontaine–Laffaille theory, while M2/M4 good-prime PEL exports do not prove arbitrary ramified strict-O deformation and algebraization. Add a FiniteFlatGroups Part II after R07.1–R07.2 for strict O-linear deformation, Drinfeld levels and algebraization, keeping the relative/opposite-algebra convention adapters on R07.2 carriers. PELModuli imports these shared targets and supplies the auxiliary PEL instantiation. ET.6 and ET.6a import the same general deformation owner.

## Ownership and export boundaries

The accepted ET.0/ET.1/ET.2b/ET.3 packet remains the owner of its transfer
results. The unfinished ET.4 packet’s coarse ET.6 extraction is reconciled at
assembly through the handoff mapping. Generic segment targets are imported
from current SR.5.3, and general WD objects from Arithmetic R01.2. All new ids
here are distinct. Keep the independently established classical endpoint on
the input side of ES7; keep the full tower realization in ET.6a and global
monodromy compatibility in its AG owners.

The six planets are Drinfeld level structures, Nearby-cycle test functions,
Supercuspidal local Langlands, Weil–Deligne local Langlands,
Jacquet–Langlands correspondence and Langlands–Jacquet map. They expose the
central objects and endpoints rather than verification bookkeeping.
