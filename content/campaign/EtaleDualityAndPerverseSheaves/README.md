# Étale duality, cycle classes and perverse sheaves

## Purpose and canonical ownership

This is the substantial successor to the **finite-coefficient foundations** of
CohomologicalPointCounting,
not a replacement for that seven-roadmap family. ConstructibleEtale owns the
small étale coefficient categories, Tate twists and fundamental group;
EtaleBaseChange owns ordinary direct image, base change, finiteness, Artin
vanishing and local acyclicity; CompactSupport owns Nagata compactification and
the actual Rf!; EllAdicRealization owns normalized systems and classical/pro-étale
realization; TraceFormula owns perfect-complex traces and Frobenius point counting.
Those constructions are imported unchanged.

This roadmap constructs the missing exceptional pullback, smooth purity and
Poincaré/Verdier duality, cycle maps, weak Lefschetz, scheme perversity and the
later rational decomposition theorem. It becomes the canonical owner of the
generic scheme material previously grouped into EndoscopicTransferAndUnitaryTraceComparison
ET.2a. Endoscopy, Igusa and geometric Satake consume the same objects. General
nearby/vanishing cycles belong to LefschetzPencilsAndVanishingCycles (LPV);
finite-field estimates belong to DeligneWeightsAndPurity (DWP).

These are mathematical construction targets, not already formalized theorems.
Suggested.lean contains proved dual-linear-map compatibility
tests against Mathlib; it does not replace étale duality by a carrier carrying
the desired conclusion as a field.

## Conventions and dependency order

The principal geometric category is separated finite-type schemes over a field
k, with ℓ invertible in k. The finite-field applications use k=F_q or its
algebraic closure. The smooth relative purity theorem is proved for the
compactifiable smooth morphisms and invertible torsion coefficients of SGA 4
XVIII 3.2.5, not just structure maps of projective varieties. General arbitrary
Noetherian bases are not silently included in every constructibility statement.

Use Λ_n=Z/ℓ^n or O_E/π^n for a finite extension E/Q_ℓ, their normalized integral
systems, and rational E-coefficients. General finite coefficient rings retain
the finite-Tor-dimension restriction and any required dualizing-coefficient
hypothesis. Bounded constructible biduality is not inferred for a non-Gorenstein
coefficient ring from the word “finite.” Integral cohomology is derived;
degreewise perfect pairings require the appropriate coefficient hypotheses.

Geometric Frobenius has eigenvalue q^(-1) on E(1). Thus a smooth d-dimensional
geometrically connected variety has trace H_c^(2d)(X_bar,E(d))→E and
H_c^(2d)(X_bar,E)=E(-d). Arithmetic Frobenius is the inverse operator. All pairings,
Gysin maps and adjunction units keep the twist and cohomological shift explicit.
Use the EDS enhancement; derived completion comes from DerivedDeRhamCohomology
DD.1, while the normalized-system realization remains the PR196 owner.

The essential acyclic ordering is EDC.0–4 → LPV.0–5 → DWP's Weil I proof.
Within the first block the exact order is EDC.1:adjoint →
EDC.2:trace-purity → EDC.1:biduality → EDC.2:pairings. The numbered EDC.1/2
headers collect interfaces, not an assertion that every part of EDC.1 precedes
every part of EDC.2. In particular, general constructible biduality uses the
smooth dualizing calculation; constructing the adjoint does not.
EDC.5 is the early perverse construction; EDC.7 is its genuinely later
weight/decomposition extension and imports DWP.7–9. No early duality or pencil
theorem depends on EDC.7. EDC.6 is a comparison stage, not a prerequisite for
constructing the finite-level functors in EDC.1–3.

<a id="edc-0"></a>

## EDC.0. Coefficient, support and enhancement interfaces

Import the actual bounded constructible/ctf subcategories and establish the
common notation for internal RHom, tensor, support and geometric stalks.
Construct cohomology with support as the localization fiber, retaining the
closed immersion rather than only its underlying point set. Prove coefficient
restriction/extension and reduction identities, with derived tensor products.
Import the already proved Rf! projection and Künneth formulas, rather than
asking the later duality theorem to prove their prerequisites.

Lift the existing finite-level Rf! to the EDS enhancement using the same chosen
resolutions and coherent compactification comparisons. Prove agreement after
passing to the ordinary derived category, compatibility with filtered colimits
on the ambient category used to construct the adjoint, and the finite
cohomological-dimension bounds needed there. Compactifiability, boundedness and
colimit preservation are verified properties, not entries in a “six functors”
assumption. Acceptance: an open immersion, finite étale map and structure map
of A¹, with the same Rf! as PR196. Sources: SGA 4 XVII §§4–5 and XVIII §3.1;
EDS E0–E3; PR196 ConstructibleEtale Layers 7–9 and CompactSupport Layers 5–9.

<a id="edc-1"></a>

## EDC.1. Exceptional inverse image and Verdier duality

<a id="edc-1-adjoint"></a>

<a id="stage-EDC.1:adjoint"></a>

**EDC.1:adjoint (before smooth purity).** Construct the right adjoint f^! to
the enhanced Rf! on the actual ambient derived category. Construct the unit,
counit, composition and identity isomorphisms and prove their coherence.
For a:X→Spec(k), define K_X=a^!Λ and D_X(K)=RHom(K,K_X), without yet claiming
constructible biduality. Identify i_*i^! with local cohomology for a closed
immersion, and construct the formal adjunction/exchange maps. SGA 4 XVIII's
introduction 0.2 explicitly separates this §3.1 adjoint construction from
§§1–2's smooth trace calculation. This prefix consumes EDC.0 and the existing
cohomological-dimension bounds, not EDC.2 or any later purity theorem.

<a id="edc-1-biduality"></a>

<a id="stage-EDC.1:biduality"></a>

**EDC.1:biduality (after EDC.2:trace-purity).** Use the now-proved smooth
identification of the dualizing object to establish the local coefficient
duality calculation. Prove the bounded constructible restrictions and
biduality by stratification/devissage, retaining the field and coefficient
hypotheses above. This is where the local smooth calculation is consumed;
it is not an assumption in the earlier adjoint construction.

Prove localization and the exchange isomorphisms relating D to f*, Rf*, Rf!
and f^!, including D_Y Rf!≅Rf* D_X and their actual coefficient domains.
Prove the constructible forms of the adjunctions used by recollement. Derive the relative duality comparison
Ra_*D_X K≅RHom(Ra_!K,Λ) in D(k_et). After geometric base change this gives
RΓ(X_bar,D_Xbar K_bar)≅RHom(RΓ_c(X_bar,K_bar),Λ). Do not replace the
relative or geometric formula by absolute Galois cohomology over an arbitrary
field: even Spec(F_q) distinguishes them. At finite level use the self-injective
Z/ℓ^n coefficient ring where ordinary duals are asserted; over Z_ℓ retain
the derived dual and resulting Ext terms. Source: SGA 4 XVIII §3.1;
SGA 4½ [Dualité], with its compatibility statements. Acceptance: a closed
point and its open complement; verify both localization triangles and all shifts.

<a id="edc-2"></a>

## EDC.2. Smooth trace, relative purity and Poincaré duality

<a id="edc-2-trace-purity"></a>

<a id="stage-EDC.2:trace-purity"></a>

**EDC.2:trace-purity.** Import only EDC.1:adjoint, not its biduality suffix.
Build the trace for finite flat relative-dimension-zero maps with degree and
base-change compatibility. Build the trace for smooth curves from divisor
degree, Kummer classes and the independent curve duality/effacement calculation
of SGA 4 XVIII §1. This curve argument must be proved from its Jacobian/Kummer
inputs, not obtained by specializing the later general biduality theorem. Import the
Jacobian/abelian-scheme machinery already assigned to JacobianChallenge,
AbelianSchemesAndArithmeticModuli and PR196 TraceFormula Layer 8; do not prove
a second curve fixed-point formula here.

Carry out the effacement/local-acyclicity argument of SGA 4 XVIII §§1–2 and
its reduction through elementary smooth charts. Construct
Tr_f:Rf!Λ(d)[2d]→Λ for smooth pure relative dimension d and prove that its
adjoint f*Λ(d)[2d]→f^!Λ is an isomorphism. Prove the relative coefficient
form, additivity over relative-dimension components, composition, base change,
products and agreement with the finite-flat trace. The normalization is fixed
by degree-one closed points and c₁(O(1)) on P¹.

<a id="edc-2-pairings"></a>

<a id="stage-EDC.2:pairings"></a>

**EDC.2:pairings.** After EDC.2:trace-purity and EDC.1:biduality, prove the
cohomological perfect-pairing interfaces and their normalization compatibilities.
For smooth separated finite-type X/k, deduce the perfect pairing
H_c^i(X_bar,E)×H^(2d-i)(X_bar,E(d))→E; for proper X remove compact support.
Prove graded symmetry and Frobenius/Galois equivariance, giving
⟨Fx,Fy⟩=q^d⟨x,y⟩ in the untwisted top-degree convention. Keep the derived
finite/integral form separate. Source: SGA 4 XVIII 1.1, 1.6.9, 2.9, 2.14,
3.2.5–3.2.6; Deligne I §2. This proves smooth purity, not the unrelated
general Gabber absolute-purity theorem for arbitrary regular arithmetic schemes.

<a id="edc-3"></a>

## EDC.3. Gysin maps and cycle classes

For a smooth closed pair Z⊂X of pure codimension c over k, construct the
fundamental class with support and prove i^!Λ_X≅Λ_Z(-c)[-2c]. Prove the
purity map by the smooth-pair local calculation/deformation to the normal
bundle; a regular immersion into an arbitrary singular ambient scheme does
not satisfy this formula merely by analogy. Construct the Gysin map, its
projection formula, transverse base change, compositional compatibility and
self-intersection formula with the top Chern class of the normal bundle.

Construct Chern classes, the projective-bundle relation and the cycle class
CH^r(X)→H^(2r)(X,Λ(r)) for smooth finite-type X over a **perfect** field k.
This includes all finite-field and algebraically closed-field applications.
Reusing a dense smooth locus over an imperfect field requires a separate
inseparable-descent construction and is not asserted by this proof. Reuse existing algebraic
cycles/intersections; where absent, explicitly construct the necessary proper
pushforward, flat pullback, rational-equivalence and moving/deformation lemmas.
For a singular integral cycle, construct the fundamental class from its dense
smooth locus and the support-vanishing argument; never apply smooth purity to
the singular cycle. Prove principal divisors map to zero, independence of
representatives, proper-pushforward and intersection/cup-product compatibility.
No equality of numerical and homological equivalence is assumed.

Sources: SGA 4½ [Cycle], especially its cycle/intersection compatibility;
SGA 7 II XVIII §§1–2 for the projective-bundle and blowup applications.
Acceptance: hyperplanes in P^n, a transverse intersection, a self-intersection,
and a singular divisor handled via the actual fundamental-class construction.
EDC.3 exports the geometric étale cycle map; RefinedTraceMethods retains its
K-theoretic/syntomic regulator constructions and comparisons.

<a id="edc-4"></a>

## EDC.4. Weak Lefschetz, projective bundles and blowups

Using the imported affine Artin vanishing theorem and EDC.2–3 localization
and duality, prove weak Lefschetz for a smooth hyperplane section Y of a smooth
projective d-fold X: restriction is an isomorphism below d−1 and injective in
degree d−1; prove its dual Gysin form. Extend the ample-divisor version by the
appropriate embedding/power argument. Separate this theorem from hard
Lefschetz and from a statement that the middle vanishing-cycle form is
nondegenerate.

Prove the projective-bundle decomposition through powers of c₁(O(1)), and
the blowup formula along a smooth center, with pullback, exceptional Gysin,
restriction and trace explicitly identified. Verify Tate twists and Frobenius
on every summand; do not merely equate Betti numbers. Apply to the codimension-two
axis of a pencil. Construct primitive kernels and orthogonal complements as
actual subspaces but leave any direct-sum splitting requiring hard Lefschetz
to DWP.9. Sources: SGA 7 II XVIII §§1–4; Deligne I §§2,5,7; PR196
EtaleBaseChange Layer 6. Acceptance: blowing up a point on a surface and
restriction to a smooth hyperplane, checked independently of Weil bounds.

<a id="edc-5"></a>

## EDC.5. The early perverse category and intermediate extension

For finite-type schemes over a field, construct the middle perverse t-structure
on the appropriate bounded constructible category using dimension functions,
stalk/costalk bounds and induction over an actual stratification. Work first
over a coefficient field (finite of characteristic ℓ≠char(k), or finite
E/Q_ℓ). Prove truncation existence, orthogonality, boundedness, the abelian
heart, perverse cohomology, and exact open/closed recollement. Establish the
normalized statement L[d] is perverse on a smooth pure d-dimensional scheme.

Define j_!* as the image of perverse j!→perverse j*, prove its no-boundary
subobject/quotient characterization, and construct IC_X(L) with independence
of the chosen dense smooth open. Prove self-duality of the middle t-structure
in its valid coefficient setting and the actual IC duality formula: with
IC_X(L)=j_!*(L[d]), one has D_X IC_X(L)=IC_X(L∨(d)). An arbitrary L is not
identified with its dual without a supplied compatible pairing. Prove
finite-map exactness, smooth pullback with its dimension
shift, affine one-sided bounds and perverse Artin vanishing. Integral O_E
perversity and its dual p+ convention require a separate torsion-pair
construction; do not claim integral duality preserves the same heart without it.
No purity, semisimplicity or decomposition follows from this stage.

Sources: BBD Chapters 1–2, especially recollement and intermediate extension;
EDC.1–2 and PR196 constructibility/Artin vanishing. LPV.6 uses this early
category for nearby-cycle t-exactness; it never imports EDC.7. IG.4's enlarged
filtered-colimit support criterion is an explicit extension of this category,
not an identification of every Ind-object with a constructible perverse sheaf.

<a id="edc-6"></a>

## EDC.6. Integral, analytic and diamond comparison of operations

Pass finite-level traces, duality maps and Gysin classes through normalized
adic systems, proving the derived-limit/tensor comparisons and uniform
boundedness conditions. Reuse EllAdicRealization Layers 0–9. Identify classical
and pro-étale rational duality, and prove coefficient-extension compatibility
before using algebraic closures of E. Integral torsion is retained; it is not
discarded by proving only a rational vector-space identity.

Through PR196 ComplexComparison and EllAdicRealization Layer 10 compare
algebraic traces/cycle classes with topological orientation, cup products and
compact-support duality. Through AdicCoefficientsAndComparisons L2–L6 prove
the applicable scheme/adic/diamond operation comparisons, preserving the
source's qcqs, finite-dimensional and ℓ-invertibility hypotheses. This is
transport of the scheme construction, not a second construction of diamond
six operations or an assertion that every analytic space has a model.
Acceptance: P¹'s orientation, an open curve and the same smooth divisor under
both comparison routes. Specialized Shimura model/nearby-cycle comparisons
remain with their geometric owners.

<a id="edc-7"></a>

## EDC.7. Pure intersection complexes and decomposition

Only now import DWP.7–9: finite-field cohomological weight bounds, the
upper/lower-weight duality formalism and the independently proved absolute
hard-Lefschetz theorem. For pure lisse L of weight w on a smooth d-dimensional
dense open, prove IC_X(L) is pure of weight w+d in the perverse normalization.
Prove purity under intermediate extension, weight truncation and the relevant
Ext-vanishing/weight-filtration statements, following BBD Chapter 5 rather
than assuming the desired splitting in the definition of a mixed object.

For a proper f and pure rational perverse K, prove purity of perverse direct
images, geometric semisimplicity and, after passage to the geometric base,
the decomposition Rf*K≅⊕_i pH^i(Rf*K)[-i], with the source's finite-field/descent
hypotheses. The splitting is not asserted canonical or automatically compatible
with an arithmetic Weil structure. Any arithmetic splitting requires its own
source-qualified argument. For **projective** f and an f-ample
class η, prove relative hard Lefschetz
η^i:pH^(-i)(Rf*K)≅pH^i(Rf*K)(i), including its weight shift, and the
primitive decomposition. A proper map has no automatic chosen ample class.
Establish the standard characteristic-zero algebraic specialization through
the required spreading-out/comparison argument, not by asserting every
complex sheaf has an arithmetic model with pure coefficients.

Sources: BBD Chapter 5, in particular the pure perverse, decomposition and
relative hard-Lefschetz results; DWP.7–9 supplies the Weil II inputs.
There is no integral/mod-ℓ decomposition theorem here and no general theorem
that arithmetic Frobenius is semisimple on smooth proper cohomology. This is
the generic supplier for ET.2b's Hitchin-support application and scheme
Satake; geometric/dimension-specific support inequalities remain there.

<a id="edc-8"></a>

## EDC.8. Correspondences and the functional-equation interface

Construct cohomological correspondences c₂* K→c₁^!K, their composition when
the required properness/base-change maps exist, and the trace class on the
fixed-point scheme using evaluation and duality. Prove compatibility with
proper pushforward and restriction. Ordinary Frobenius point counting is
still PR196 TraceFormula's theorem; ET.5 retains its genuinely stronger
contracting-boundary/Fujiwara application with isolation and large-power
hypotheses. An arbitrary fixed-point set does not supply a numerical trace.

Export the graded Poincaré pairing and Frobenius similitude to WeilConjectures:
the degree-(2d−i) characteristic polynomial is the reciprocal partner of the
degree-i polynomial with the q^d scaling. Prove the determinant relation in
the actual finite-dimensional spaces, tracking the middle-degree determinant
and Koszul sign. WC assembles the zeta functional equation; EDC does not
create another zeta-function object. Acceptance: P¹, a curve and an even-dimensional
middle pairing; no unspecified sign replaces the determinant calculation.

## Source and review discipline

Primary files acquired for this expansion are
SGA 4 XVII–XVIII,
SGA 4½,
SGA 7 II,
BBD, and
Deligne I/
II. Scanned/OCR text must be checked
against formulas on the original pages before theorem transcription.
The private WeilConjectures project's cycle and cohomology packets are useful
cross-reference material, not replacements for these proof sources or evidence
that the actual étale objects have been implemented. No standard conjecture,
Tate conjecture, general weight–monodromy or integral decomposition result is
an implicit assumption of this roadmap.

## Completion contracts added on 2026-09-15

**Applies to:** `EDC.1:adjoint`, `EDC.2:trace-purity`, `EDC.1:biduality`, `EDC.3`, `EDC.5`, `EDC.7`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct finite-flat and curve traces with degree normalization before the smooth trace/purity theorem, then derive constructible biduality by the smooth-stratum devissage. For singular cycle classes use the dense smooth locus and cohomology-with-support extension, rather than smooth purity on the singular cycle. Integral perverse coefficients need the torsion-pair p/p+ comparison before any assertion that duality preserves a heart.

### Producer–consumer contract

Export relative duality in D(k_et) and geometric global duality separately. The decomposition splitting is noncanonical and geometric in the stated pure rational setting; a lift to an arithmetic Weil object requires its own extension calculation.

### Acceptance and source route

Spec F_q tests absolute versus relative duality; a singular divisor tests support extension; an integral torsion perverse sheaf tests p/p+; a self-duality claim must supply a coefficient pairing.

**Source route:** SGA4 XVIII §§1–3; BBD Chapters 1–2/5; Weil II 6.2.13 supplies the later absolute-HL input. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
