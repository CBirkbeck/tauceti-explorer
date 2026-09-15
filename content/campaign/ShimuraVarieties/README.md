# Roadmap: complex Shimura varieties and canonical models

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose

Construct the finite-level Shimura variety and its Hecke tower for every pure Shimura datum, first over `ℂ`, then over the reflex field. The endpoint is a canonical-model theorem, not a record containing an arbitrary scheme and an unproved assertion of canonicity. Recover the modular curves from the existing Katz–Mazur roadmap by named comparison isomorphisms.

The route follows Deligne and Milne, with Baily–Borel and Borel for algebraicity. Shimura's 1970 paper supplies the original arithmetic canonical-model perspective. Milne §§12–14 give the normalization and distinguish the abelian-type argument from the genuinely general conjugation argument. Neither Deligne's abelian-type reduction nor a PEL moduli construction is a proof for all data.

## Inputs and order

Use D0–D5 from ShimuraData. Complex analytification and finite étale Riemann existence come from `CohomologicalPointCounting/ComplexComparison`; ComplexComparisonPartII C2–C4 constructs the additional projective GAGA/Chow interface. Use ClassFieldTheory for its existing Artin maps, not a second reciprocity map. Use AbelianSchemes and PELModuli only at the milestones indicated below.

The complex construction V0–V3 precedes the moduli comparison M3. The canonical-model construction V4–V8 uses M3, while M4 identifies the already constructed moduli model with the canonical one. This is a milestone-level ordering, not a circular pair of module imports.

## Conventions

At level `K`, the analytic point space is

\[
\operatorname{Sh}_K(G,X)(\mathbf C)=G(\mathbf Q)\backslash
   (X\times G(\mathbf A_f))/K.
\]

A right translation is defined with its **source and target level**, then composition is proved. It is not an action of all of `G(𝔸_f)` on one finite-level variety. For example `[x,a]↦[x,ag]` sends level `K` to level `g⁻¹Kg`.

Use effective arithmetic groups in the manifold construction. General levels are normal varieties obtained from sufficiently small levels; they need not be smooth. Quotient stacks retain stabilizers and are separate objects. In particular, the raw arithmetic quotient stack can have infinite ineffective central stabilizers and is not automatically a Deligne–Mumford stack.

## Milestones

<a id="v0"></a>

### V0. Arithmetic groups and finite component decompositions

**Dependencies:** D5.

Prove arithmeticity and commensurability of the groups `G(ℚ)₊∩gKg⁻¹`. Consume the reduction theory of AutomorphicFormsOnReductiveGroups and ArithmeticLocallySymmetricSpaces: rational parabolics, Siegel sets, finite arithmetic coverings and adelic component finiteness. Prove the precise Hermitian-domain/effective-action specialization. Prove existence of neat congruence subgroups and properly discontinuous action of the effective groups. Prove the connected-component decomposition as an analytic isomorphism, independent of representatives.

Strong approximation is used only in the form justified by semisimplicity, simple connectedness, and noncompactness hypotheses. A general reductive quotient is not reduced to one connected component by an unjustified approximation argument.

<a id="v1"></a>

### V1. The analytic tower

**Dependencies:** V0 and ComplexManifolds.

Give the double quotient its topology and complex analytic structure, construct level maps and Hecke translations, and prove that they agree with the quotient formulas. At neat levels establish the covering and finite étale analytic properties. Calculate the effective deck group for normal level inclusions; central stabilizers can make it a quotient of the apparent group `K/K'`.

Construct the Hecke correspondence through `K∩gKg⁻¹`, with both maps and their composition law. Make the correspondence available independently of an action on a particular coefficient sheaf.

<a id="v2"></a>

### V2. Baily–Borel algebraicity and minimal compactification

**Dependencies:** V1, reduction theory V0, complex analytic spaces and projective GAGA.

Prove the Baily–Borel theorem, not merely its conclusion as a typeclass. The internal sequence is: rational boundary components and their incidence; the Satake topology; compactness of the arithmetic quotient of the partial compactification; the analytic structure and normality of that quotient; automorphic forms with their growth condition; finite generation of the relevant graded ring and separation by sufficiently high weights; projective realization; and Chow algebraization. For modular-curve factors retain the cusp growth condition. Any use of Koecher must prove the relevant rational-factor or boundary-codimension hypothesis; rational rank one alone does not decide whether the growth condition is automatic.

Define the algebraic open variety and its projective normal minimal compactification from this construction. Establish the boundary stratification and algebraicity of level maps. The graded ring used here is the analytic ring in the Baily–Borel proof; it must not depend on the later algebraic automorphic-bundle construction.

<a id="v3"></a>

### V3. Borel algebraicity and uniqueness

**Dependencies:** V2 and AlgebraicModuliForArithmeticGeometry R09.7d.

Prove extension of maps from products of punctured discs into the arithmetic quotient, then Borel's algebraicity theorem (Milne Theorem 3.14 and Lemma 3.15). Import the characteristic-zero smooth projective compactification with normal-crossings boundary for quasi-projective source charts from AlgebraicModuliForArithmeticGeometry R09.7d. This explicit resolution construction is a genuine architectural cost; Deligne's polarized-family algebraization also invokes Borel and does not eliminate it. Reduce a general smooth algebraic source by its quasi-projective open cover and descend the resulting algebraic maps.

Deduce uniqueness of algebraization at neat levels and functoriality for morphisms of data. Extend to other levels by finite quotients. Prove the precise finite-quotient and normalization statements that will be used in V8. Do not apply Borel's theorem without its torsion-free/effective-action hypotheses.

<a id="v4"></a>

### V4. Torus models and the canonical-model condition

**Dependencies:** D3, V3, and ClassFieldTheory.

For a special pair `(T,h)`, construct the reflex norm on ideles. Compare the supplier's Artin normalization with Milne's convention, and define a named conversion when they are inverse. Define a canonical model as a model over `E(G,X)` whose special points satisfy the corresponding reciprocity formula, including their field of definition. Prove independence of the idele lifting a Galois automorphism.

Construct finite-level torus models as finite étale schemes using the finite Galois sets given by reciprocity. Prove their functoriality and compatibility with the geometric double quotient. Establish density of the special points and Hecke translates required for uniqueness. The model condition must quantify over the actual special pairs of D4, not over an externally supplied subset of points.

<a id="v5"></a>

### V5. CM abelian varieties and the Siegel canonical model

**Dependencies:** V4, A0–A5, and M0–M3.

Using M3 and Borel algebraicity, first finish the algebraization of polarized weight-one variations over smooth algebraic bases needed here. Construct CM types, reflex types, reflex norms, and the Tate-module action. Prove the main theorem of complex multiplication with the normalization used in V4. The proof obligations include reduction of CM abelian varieties at suitable primes, the Shimura–Taniyama Frobenius calculation, compatibility with polarizations and level structures, and passage from Frobenius elements to the full reciprocity law. Class field theory alone does not supply the theorem of complex multiplication.

Apply it to the Siegel moduli model and show that its Galois action satisfies the canonical-model condition. This provides a concrete canonical-model instance rather than an existence hypothesis for the general development.

<a id="v6"></a>

### V6. Hodge and abelian type

**Dependencies:** V5.

For Hodge type, use the canonical-model inheritance theorem for a Shimura subdatum of a datum with canonical model, with its special-point proof. This is the selected route for bare existence; the moduli interpretation using absolute Hodge tensors is a separate theorem in the automorphic-bundle development. Prove the connected Shimura-variety formulation, its adelic/Galois symmetry, and the equivalence with the nonconnected formulation. Prove descent through central isogenies of derived groups and finite component quotients. This gives abelian-type canonical models without identifying the full varieties of two data having the same derived group.

<a id="v7"></a>

### V7. General data: conjugation and descent

**Dependencies:** V3–V6 and the relevant reductive-group structure theory.

Formalize the general argument of Milne (1983), using the reduction described in Milne §14. The work is divided into: reduction to connected simple simply connected data; writing the group as a restriction of scalars from a totally real field; the auxiliary totally real extension and splitting over a CM quadratic extension; construction and compatibility of the required type-`A₁` subdata; construction of the conjugated Shimura datum for an automorphism of `ℂ`; algebraic comparison of the conjugated varieties with compatibility on the `A₁` subvarieties; uniqueness sufficient to prove the cocycle law; continuity of the descent datum; and effective quasi-projective descent to the reflex field.

Primary proof sources are Milne 1983, *The action of an automorphism of C on a Shimura variety and its special points*, §§6–7/Theorem 7.2, and Milne 1999, *Descent for Shimura varieties* for the continuity/effectivity check. Apply the author's errata, especially replacing G by Z in Lemma 3.8. The 1983 local copy is a scan whose text extraction is unusable; source auditing must inspect its pages. Borovoi's historical contribution is not a license to import an unproved stronger generation statement; use the explicit Milne route and its actual reductive-group lemmas.

Each is a theorem to prove in this roadmap. A “Langlands conjugation theorem” supplied as an axiom is not a completed V7. Full absolute-Hodge-cycle theory is not used to disguise the missing non-abelian-type step. The resulting model satisfies V4 and is independent of the auxiliary field extension and special point.

<a id="v8"></a>

### V8. The algebraic tower and modular-curve comparison

**Dependencies:** V4 together with canonical models constructed in V5, V6, or V7; M4 and ModularCurves #81 for the examples. The functoriality theorem is proved for actual canonical models satisfying V4 and then applied to each constructed instance. Thus its abelian-type specialization uses V6 and does not wait for V7. The all-datum specialization combines V7 with this same theorem.

Consume the GL₂ analytic, cusp and determinant comparisons of ModularCurvesPartII R12.1–R12.6, and prove their compatibility with the canonical-model condition. Construct level maps and Hecke correspondences over the reflex field, prove their analytic comparison and functoriality, and descend the minimal compactifications. For the full principal `GL₂` level `N≥3`, prove

\[
\operatorname{Sh}_{K(N)}(GL_2,\mathfrak H^\pm)
 \simeq Y_{\mathrm{full}}(N)_{\mathbf Q}.
\]

Identify the determinant morphism with the Weil-pairing morphism. Over a chosen primitive root `ζ`, identify its fibre with `Y(N,ζ)`, and its analytification with `Γ(N)\ℍ`. Prove the dictionary between row-basis actions in #81 and the adelic convention. Obtain the `Γ₁` and `Γ₀` comparisons with their fine/coarse qualifications. Compare minimal compactifications through ModularCurvesPartII R13.4a/R13.4b, and compare cusp loci and Tate parameters. PR81 Layer 10 supplies only prime N≥5 diamond quotients with H≤(Z/N)×/{±1}; general full/composite levels use the new construction. The open connectedness input for PR81 twisted-level irreducibility comes from R12.4 independently of the later compactification comparison.

## Completion conditions

The final construction exists for arbitrary pure Shimura data and arbitrary compact open levels, with smoothness only where established. Every example comparison is an isomorphism of schemes over a specified field, not a bijection of complex points. The GL₂ comparison preserves level maps, pairings, Hecke correspondences, and compactifications. No integral bad-prime modular-curve theorem is claimed from the generic-fibre comparison.


## Implementation handoff: Canonical models with effective descent

**Stages:** V1, V2, V3, V4, V5, V7, V8. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct the finite-level analytic quotient and maps first, with their effective deck groups. Baily–Borel finite generation and Borel extension require their explicit growth, boundary and smooth-source compactification arguments. V7 then constructs the conjugation isomorphisms, cocycle, continuity and effective descent, preserving special-pair reciprocity.

**Acceptance and consumer contract.** Compare the GL₂ determinant component with the actual Weil-pairing component over a chosen root of unity, and test torus reciprocity. Canonical models for abelian type cannot dispatch to the general V7 branch by changing a label. The scanned Milne 1983 source requires page-image transcription and the recorded erratum before its proof leaves are executable.

## Source anchors and prototype coverage

- ShimuraVarieties source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

<a id="stage-V8.general"></a>

## V8.general. General-data completion interface

**Dependencies:** V8 and V7.

Extend V8's level and functorial canonical-model comparisons to the general-data case proved in V7. The earlier Hodge/abelian comparison V8 does not assume this suffix.
