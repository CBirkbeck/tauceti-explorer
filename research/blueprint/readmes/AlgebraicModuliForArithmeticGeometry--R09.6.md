# Formal deformation and representability comparisons

## R09.6 — completed local moduli and effective versal families

This layer connects the universal properties of constructed moduli objects to their
formal deformation problems. Its outputs are natural comparisons of framed
groupoids, completion maps, tangent and stabilizer sequences, effectivity
equivalences, and a precisely conditional algebraization theorem. It imports
representing schemes, spaces, stacks, Schlessinger theory and formal geometry
from their owners. It constructs neither another Hilbert scheme nor another
general Artin criterion.

The packet is **complete** as a target-level planning pass. R09.6 is **planned**,
not closed: the three exact interface gaps and eight supplier contracts below
remain open. No declaration is claimed implemented. The suggested file checks
native fixed-fibre and tower interfaces at the pinned libraries; its explicit
omission ledger names the geometric statements whose actual carriers and
relative conditions are still supplier work.

### Conventions and mathematical boundaries

Fix a locally Noetherian base S, an affine neighbourhood Spec Λ of the image of
the chosen point, and a residue structure Λ→k. The classical test category C_Λ
consists of local Artinian Λ-algebras with their specified residue field k and
local coefficient-compatible morphisms. Its complete-local enlargement and
the classical deformation/hull conditions belong to SchemeAndStackFoundations
SF.4. The hypotheses of the selected Stacks results require fields of finite
type over S. A geometric point can have a larger residue field; first specify
the corresponding base-changed k-rational model or an appropriate pointed
étale-local coefficient model. The original stalk with residue κ(x) cannot
simply be regarded as a ring with residue k. All comparisons preserve these
residue identifications.

A deformation is an object together with an identification of its special
fibre. Isomorphisms respect that identification. This makes the fibre over k
contractible even if the original moduli object has residual automorphisms.
Over another Artinian algebra the framed fibre can still have nontrivial
automorphisms. Its set of isomorphism classes is a further operation. Neither
the raw set of objects nor an unframed coarse moduli point substitutes for this
groupoid. Mathlib's structured-arrow category and native isomorphism-class
quotient supply the carriers; R09.6 adds their geometric specialization.

The completion at a scheme point is the existing maximal-ideal completion of
the actual stalk. It represents deformations of the point into the scheme,
not deformations of the scheme itself. For example, the origin of a nodal
curve has completed ring k[[u,v]]/(uv); the one-parameter ring of deformations
of the nodal singularity is a different SF.4 object. For an algebraic space a
pointed étale chart with the same residue field gives the representing
completion. For a stack a smooth chart gives a versal formal family and a
formal relation groupoid. No choice-independent chart ring is asserted to be
the completed local ring of the stack.

The completed ring of any smooth chart is not automatically a hull. A hull
requires a smooth transformation with bijective tangent map in the classical
coefficient setting. The smooth chart A¹_k→Spec k is versal, but its completion
k[[t]] has an extra tangent direction; the point is prorepresented by k.
Vanishing infinitesimal automorphisms makes the framed category setoid-valued
under RS, yet it does not remove excess chart parameters. Residue extensions
that introduce derivation orbits require the more general minimality convention
of the supplier; they are excluded from the tangent-bijective hull clause.

Infinitesimal stabilizers are reduction kernels. At the trivial point of BG_m
their dual-number value is 1+εk, rather than the full residual group k×. For a
finite constant étale group G over algebraically closed k, the framed
deformation-class functor of BG is terminal and Inf is zero, while the unframed
residual stabilizer is still G. Consequently neither a coarse space nor
Inf=0 establishes fine unframed representability. An auxiliary level must
come with the actual automorphism-removal theorem, including its hypotheses.

Formal objects retain compatible transition isomorphisms at all quotient
powers; formal arrows commute with them. Quotients are indexed by n≥0 and
use m^(n+1). Effectivity is essential image of the coherent restriction
functor from objects over the complete ring. Full faithfulness is a separate
requirement. Algebraic stacks satisfy the full restriction equivalence by
space-valued Isom, smooth chart lifting and fppf descent. That theorem assumes
algebraicity already; it cannot discharge the effectivity assumption in an
Artin proof of the same algebraicity. It also does not require Grothendieck
existence for coherent modules.

### Dependency order and imported results

The accepted RS-27 ordering and the newer A0-extension-2 prefix settle the
approximation omission identified by RT-AREA-algebraicgeometry/2. SF.0 owns
G-rings, regular completion and Popescu. A0 owns G-ring finite-type permanence,
polynomial approximation, finite-jet formal-object approximation and common
étale neighbourhoods. R09.6 imports that prefix. It adds effective-versal
algebraization after approximation, and imports the selected Artin criteria
from A0. There is no reverse R09.6→A0 prerequisite.

The imported polynomial theorem takes an actual formal solution over the
completion of a Noetherian local G-ring. It approximates that solution to
any prescribed finite order in a pointed étale extension; henselianity places
the approximating solution in the ring itself. Artin's 1969 Theorem 1.10 uses
the stated field/excellent-DVR finite-type henselization setting. His
Corollary 2.6 gives a common étale neighbourhood from an isomorphism of
completed local rings in that setting. A finite-order match to a prescribed
formal isomorphism is available; no all-orders algebraization of that
particular coordinate change is claimed. These imports were checked against
the primary statements, but A0-extension-2 itself is still awaiting independent
review.

For an arbitrary effective formal object, approximation supplies a finite
jet and the required associated-graded comparison. Versality provides the
additional recursive lifting. Agreement to second order yields a surjection
between complete local rings; equal graded dimensions give equal lengths of
all Artinian quotients and make those surjections isomorphisms. This is why
the all-orders algebraization theorem has both effectivity and versality as
hypotheses. G-ring regularity and limit preservation on objects are also
explicit. The resulting family and completed-ring isomorphism are
existential and need not be unique.

Formal geometry remains in SF.4. Its proper coherent Grothendieck existence
equivalence applies to coherent modules on an already specified proper scheme
over a complete Noetherian ring. Its effective formal curve-deformation
theorem supplies the curve setting. A varying higher-dimensional formal
scheme needs its own effectivity theorem. The inherited AdicSpacesPartII
F0/R3 routes do not create a second coherent-existence theory, and the direct
complete-local stack restriction theorem does not acquire an unnecessary
analytic GAGA hypothesis. Ordinary CFG and stack coherence comes from
DiamondsAndVStacks D0; no diamond geometry is needed. Algebraic-space
geometry comes from SF.1. The groupoid-valued deformation extension is
assigned to **SchemeAndStackFoundations, Part II**, retaining the existing
set-valued Schlessinger/hull ownership in SF.4.

R09.1 and R09.2 retain the representing theorems and universal families of
projective, Grassmannian, flag, Hilbert, Quot, Hom and Isom parameters.
R09.6 exports their named formal-point comparisons, and the supplied A0
Picard space gets the corresponding eighth interface. A Picard-space class
is not a Picard-stack object with its automorphisms. Base change of the
parameter functor and its universal object transports the Artinian
comparison; arbitrary base change of completed stalks requires additional
hypotheses and is not asserted. In particular universal-family flatness over
a Hilbert or Quot parameter does not imply that the parameter is flat over S.

Current read-only TauCetiRoadmap main was audited as well as the atlas.
AlgebraicVectorBundles supplies bundle/sheaf and relative-spectrum directions
and explicitly assigns projective, Grassmann and flag bundles to another
roadmap. StableReduction supplies its existing coherent/curve-theory
direction. ModularCurves Layer 7D already plans the elliptic deformation
problem and its universal ring; arithmetic consumers import it. No one of
these constructions is replanned here, and no higher-tier derived-patching
roadmap is used as a prerequisite.

### Declaration inventory

Each entry below is one target or key definition/theorem. Its proof steps end
in the named pinned declarations, an existing node, an exact supplier request
or one of the three recorded gaps. The packet is authoritative for graph ids;
the names below are the corresponding proposed library interface. Theories
already in another roadmap are referenced through that roadmap, not repeated.

#### 1. Framed deformation groupoids

**Construction:** `FramedDeformation`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation`.

For a category fibred in groupoids X over S, an object x₀ over k, and a local Artinian S-algebra A with specified residue identification A/m_A≅k, Def_X,x₀(A) has objects (y,α), y∈X(A), α:x₀≅y|k. An arrow f:(y,α)→(z,β) is an isomorphism over A with (f|k)∘α=β. Base change uses the chosen pullback coherence. The set-valued deformation functor is the set of isomorphism classes of this framed groupoid, not the raw set of objects and not the unframed fibre X(A).

**Hypotheses and conventions.** Fix universes, the S→Spec Λ affine neighbourhood and the residue map Λ→k. The classical C_Λ and its completion are imported from SF.4. For Stacks 98 use k of finite type over S. For a geometric point with a larger residue field use a specified base change to a k-rational point; do not identify its functor with the completion of the original stalk.

**Construction or proof.** (1) Use the native structured-arrow category x₀↓(X(A)→X(k)); arrows in X(k) are invertible. (2) Restrict its projection to retain the special-fibre identification and pullback constraints. Take the native isomorphism-class quotient only after assembling the groupoid. (3) Precomposing α by an automorphism of x₀ changes the framing, so this datum is not discarded.

**Direct dependencies.** `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.4/deformation-functor`, `mathlib:CategoryTheory.StructuredArrow`, `mathlib:CategoryTheory.toSkeleton_eq_toSkeleton_iff`.

**API.**

- `FramedDeformation.reframe_object` (data): Reframing by g∈Aut(x₀) leaves the A-object y fixed.
- `FramedDeformation.reframe_frame` (simp): The new frame is α∘g; native composition is g.hom followed by α.
- `FramedDeformation.arrow_criterion` (characterisation): An underlying arrow f lifts to a framed arrow exactly when its reduction carries α to β; this lift is unique.

**Discriminating unit tests.**

- `FramedTests.residueIdentity` (degenerate): For reduction=id on X(k), between any two framed objects there is exactly one arrow.
- `FramedTests.discrete` (compatibility): For a discrete fibre and identity reduction, its framed object is the specified point, agreeing with the native structured-arrow fibre.
- `FramedTests.nontrivialFrame` (non-example): A nonidentity automorphism g changes the identity frame to g. Collapsing the frame to a Boolean condition fails this test.

**Uses.** 98.12.3 and completed-local comparison: Compare maps of local rings with actual framed deformation objects. AbelianSchemesAndArithmeticModuli:A0 and ModularCurvesPartII:R13.1: Retain automorphisms until the precise auxiliary-level rigidity theorem applies.

**Acceptance.** Def(k) is contractible even when Aut_X(k)(x₀) is nontrivial. The residue pullback is not replaced by equality of objects.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), 98.3, equation (98.3.1.1) and Lemmas 98.3.1–3, pp. 4–5: The special-fibre identification produces a predeformation category and induces the stated maps under morphisms of stacks..

#### 2. Functoriality of framed comparison

**Theorem:** `framedDeformation_twoFibre`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality`.

A morphism X→Y and a chosen identification of its special-fibre object induce Def_X,x₀→Def_Y,y₀. These assignments preserve 2-fibre products: for W=X×_Y Z and w₀=(x₀,z₀,γ₀), Def_W,w₀≃Def_X,x₀×_(Def_Y,y₀)Def_Z,z₀. A representable formally smooth morphism induces a smooth morphism of predeformation categories.

**Hypotheses and conventions.** S locally Noetherian; residue k finite type over S; all products are 2-products with their specified gluing isomorphism. Smoothness means essential surjectivity of the lifting comparison for Artinian surjections; its groupoid definition is imported from SF.4 Part II.

**Construction or proof.** (1) Transport the frame through the morphism using the pullback comparison. (2) An object of a 2-product consists of two deformations and an isomorphism whose residue is γ₀; the framed constructions match on arrows. (3) Use representable infinitesimal lifting after forming the fibre product over an Artinian test scheme.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation`, `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4/hull`.

**Acceptance.** The gluing isomorphism survives passage to the framed groupoid. A strict fibre product of isomorphism-class sets is insufficient when the target has automorphisms.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemmas 98.3.2–3, p. 5: These two comparison properties connect a geometric smooth chart and its relation to the formal deformation category..

#### 3. Infinitesimal stabilizers

**Definition:** `InfinitesimalStabilizer`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/infinitesimal-stabilizer`.

For a deformation y over A′ and its restriction z over A, Inf(y/z) is the kernel of Aut_A′(y)→Aut_A(z). The infinitesimal stabilizer at x₀ is this kernel for the trivial dual-number deformation over k[ε]→k. Its group law is inherited from automorphisms. It is distinct from the entire residual stabilizer Aut_k(x₀).

**Hypotheses and conventions.** Pullback supplies the reduction functor and a specified comparison to z. The dual-number definition uses the split extension k→k[ε]→k and the trivial pullback of x₀.

**Construction or proof.** (1) Specialize the native kernel of the functor-induced map on automorphism groups. (2) Conjugating by a special-fibre comparison identifies this kernel with automorphisms of the framed lift. (3) Import the inertia-stack fibre identification from R09.4; do not construct inertia a second time.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation`, `mathlib:CategoryTheory.Functor.mapAut`, `AlgebraicModuliForArithmeticGeometry:R09.4/inertia-stack`.

**API.**

- `InfinitesimalStabilizer.mem_iff` (characterisation): Membership means the induced automorphism after reduction is the identity.
- `InfinitesimalStabilizer.framedAut` (equivalence): The automorphism group of a framed object is multiplicatively equivalent to its reduction kernel.
- `InfinitesimalStabilizer.faithful` (compatibility): For a faithful reduction functor the kernel is trivial.

**Discriminating unit tests.**

- `StabilizerTests.identity` (degenerate): Identity reduction has bottom kernel.
- `StabilizerTests.allKilled` (computation): On the native one-object category of a group G, the functor induced by the trivial homomorphism G→G has top kernel.
- `StabilizerTests.frameKernel` (compatibility): For a frame α, g belongs to the reduction kernel iff reduction(g)∘α=α.

**Uses.** 98.8.2 and 90.26.2: Supply the first terms of the tangent sequence for a smooth presentation. R09.5 and R13 rigidity comparisons: Distinguish residual finite stabilizers from infinitesimal automorphisms.

**Acceptance.** For BG_m at its trivial torsor, the dual-number kernel is 1+εk, rather than k×. For finite constant étale G, Inf(BG)=0 although the residual stabilizer is G.

**Primary evidence.** [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Definitions 90.19.1–2 and Remark 90.19.3, pp. 55–56: Infinitesimal automorphisms are reduction kernels; their transport depends on the chosen identification..

#### 4. Linearization and vanishing of stabilizers

**Theorem:** `infinitesimalStabilizer_linearization`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/stabilizer-linearization`.

If X satisfies the Rim–Schlessinger condition, Inf_x₀(X) has a natural k-vector-space structure and its addition agrees with composition. For a small extension A′→A of kernel I killed by m_A′, Inf(y/z) is canonically the corresponding additive group Inf_x₀(X)⊗_k I, with identity as its origin. If Inf_x₀(X)=0, every framed Artinian fibre is a setoid and Def_X,x₀ is equivalent to its isomorphism-class functor.

**Hypotheses and conventions.** k and the coefficient category follow the framed conventions. RS is an equivalence of groupoids for the prescribed Artinian ring pullbacks, not merely a surjection on classes.

**Construction or proof.** (1) Apply RS to the automorphism functor at the identity. The two split dual-number directions define addition and scalar multiplication. (2) Functoriality of composition and its shared identity force vector addition to agree with composition. (3) Identify the small-extension kernel with lifts of the identity. Factor arbitrary Artinian surjections into small extensions to propagate vanishing.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/infinitesimal-stabilizer`, `AlgebraicModuliForArithmeticGeometry:A0-extension/strong-infinitesimal-gluing`, `SchemeAndStackFoundations:SF.4/deformation-functor`, `DiamondsAndVStacks:D0`.

**Acceptance.** For BG_m, the infinitesimal group is (k,+) via a↦1+εa. Finite constant étale BG has no infinitesimal autos but retains its unframed residual autos.

**Primary evidence.** [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Lemmas 90.19.6–13, pp. 56–58: RS linearizes reduction kernels and makes the framed category set-valued exactly when infinitesimal autos vanish..

#### 5. Tangent sequence for a 2-fibre product

**Theorem:** `framedTangent_exactSequence`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/tangent-exact-sequence`.

For X→Y←Z satisfying RS and a point w₀ of W=X×_Y Z, there is a natural exact sequence of k-vector spaces 0→Inf_W→Inf_X⊕Inf_Z→Inf_Y→T_W→T_X⊕T_Z→T_Y. Here T means isomorphism classes of framed dual-number deformations; the map Inf_Y→T_W changes the gluing isomorphism by an infinitesimal automorphism.

**Hypotheses and conventions.** S locally Noetherian; w₀ over a field k finite type over S. Use the chosen gluing identification at w₀ to compare the Y-valued objects. The two difference maps use compatible opposite signs.

**Construction or proof.** (1) Use framed 2-fibre compatibility. (2) Construct the boundary by changing the gluing arrow of the trivial dual-number pair. RS makes this construction linear. (3) An arrow lifts precisely when the corresponding change of gluing can be absorbed into the two source autos; this gives exactness at Inf_Y and T_W. Check the remaining kernels directly.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality`, `AlgebraicModuliForArithmeticGeometry:R09.6/stabilizer-linearization`, `SchemeAndStackFoundations:SF.4/deformation-functor`.

**Acceptance.** For U→X an atlas and R=U×_X U at the identity arrow, the sequence starts 0→Inf_X→T_R→T_U⊕T_U. Dropping Inf_Y loses gluing deformations even when X and Z are schemes.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.8.2, p. 11: The framed 2-product has the six-term tangent and automorphism sequence.; [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Lemma 90.26.2, p. 66: For a chart relation the sequence begins with infinitesimal stabilizers..

#### 6. Completed local rings of schemes

**Construction:** `CompletedLocalRing`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/completed-local-ring`.

For a scheme X and point x, CompletedLocalRing(X,x) is the maximal-ideal adic completion of the actual stalk O_X,x. Its structural map is the native algebra map from the stalk; its n-th jet, indexed from zero, is the projection to O_X,x/m_x^(n+1). Under Noetherianity it is a complete Noetherian local ring with the same residue field. This construction alone says nothing about a stack having a canonical completed local ring.

**Hypotheses and conventions.** Noetherianity is required for the stated complete-local properties and for the prorepresentability comparison. A geometric point with residue extension requires a specified coefficient-compatible model; the original stalk is not relabelled as a k-algebra.

**Construction or proof.** (1) Specialize existing adic completion to the scheme stalk and its native maximal ideal. (2) Use native quotient evaluations, extensionality and the local-completion instances. (3) Retain the quotient indexing convention and structural map when converting to formal deformation maps.

**Direct dependencies.** `mathlib:AdicCompletion`, `mathlib:AdicCompletion.evalₐ`, `mathlib:AdicCompletion.ext_evalₐ`, `mathlib:AdicCompletion.isLocalRing_of_fg`, `mathlib:AdicCompletion.residueField_map_bijective`, `SchemeAndStackFoundations:SF.4/formal-scheme`.

**API.**

- `CompletedLocalRing.ofStalk` (constructor): The canonical local ring map O_X,x→CompletedLocalRing(X,x); localness uses Noetherianity.
- `CompletedLocalRing.jet` (data): Projection to O_X,x/m_x^(n+1).
- `CompletedLocalRing.jet_ofStalk` (simp): Projection of a stalk element equals its quotient class.
- `CompletedLocalRing.ext` (extensionality): Equality of every positive-order jet implies equality in the completion.

**Discriminating unit tests.**

- `CompletionTests.residueJet` (computation): The index-zero projection, transported along m¹=m, is the ordinary residue quotient map.
- `CompletionTests.multiplication` (compatibility): Each jet preserves multiplication using the native ring projection.
- `CompletionTests.localResidue` (compatibility): For a Noetherian stalk the structural map induces a bijection on residue fields.

**Uses.** 98.12.3 and 98.12.7: Provide the ring representing the chart and identify an algebraized versal family at every order. R09.1/R09.2 parameter exports: Use completed parameter stalks without reimplementing adic completion.

**Acceptance.** The first jet is the residue field, not the quotient by m⁰. The zero ideal of a field yields the field itself.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.12.3 and its proof, pp. 18–19: The completed stalk represents local maps in the deformation comparison..

#### 7. Scheme points and completed local rings

**Theorem:** `schemeFramedCompletionEquiv`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison`.

Let X be locally of finite type over a locally Noetherian S and x a finite-type point with k=κ(x). On C_Λ, the framed deformation functor of X at x is naturally isomorphic to h_R, where R=Ô_X,x and h_R(A) consists of continuous local Λ-algebra maps R→A inducing the specified identity on k. Thus the identity formal family prorepresents this scheme-point deformation functor.

**Hypotheses and conventions.** Choose Spec Λ⊂S containing the image of x and the associated residue structure. For an algebraically closed geometric residue k work with the appropriate k-rational base-changed model. This is a deformation of a point into X, not a deformation of X as a scheme.

**Construction or proof.** (1) A map Spec A→X restricting to x factors through any chosen affine neighbourhood of x and induces a local map O_X,x→A. (2) Its maximal ideal maps to the nilpotent maximal ideal of A, hence the map factors through some finite jet and extends uniquely to the completion. (3) The two operations are inverse and compatible with maps in C_Λ. Scheme fibres have no nontrivial arrows, so the groupoid reduces to the represented set-valued functor.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation`, `AlgebraicModuliForArithmeticGeometry:R09.6/completed-local-ring`, `SchemeAndStackFoundations:SF.4/hull`, `SchemeAndStackFoundations:SF.4/formal-scheme`.

**Acceptance.** At the origin of A¹_k the ring is k[[t]] and a dual-number point sends t to aε. At the origin of Spec k[u,v]/(uv), the ring is k[[u,v]]/(uv), not the one-parameter smoothing ring of the nodal singularity.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.12.3, proof identification of predeformation categories, pp. 18–19: Local maps into a scheme are exactly completion maps on Artinian tests..

#### 8. Étale charts for space points

**Theorem:** `spaceFramedEtaleCompletionEquiv`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/space-formal-comparison`.

For an algebraic space X locally of finite type over S, a pointed étale chart (U,u)→(X,x) with κ(u)=κ(x)=k induces an equivalence of framed Artinian deformation functors. Consequently Ô_U,u prorepresents the point-deformation functor, and another such chart gives a unique compatible isomorphism of prorepresenting pairs. Do not use an arbitrary smooth chart for this conclusion.

**Hypotheses and conventions.** S locally Noetherian and x finite type. Specify the residue comparison and the chart lift of the point. For a geometric point first pass to the specified residue-field base change.

**Construction or proof.** (1) Étale formal lifting uniquely lifts the nilpotent Artinian test morphism through the chosen residue point. (2) Compare any two charts through their pointed fibre product, using unique étale lifting. (3) Apply the scheme completion comparison and uniqueness of the representing natural isomorphism.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.** An étale chart preserves the prorepresenting ring; a positive-dimensional smooth chart adds formal variables.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.3.2, p. 5 and Lemma 98.12.3, pp. 18–19: Étale unique lifting gives the pointed functor comparison.; [The Stacks Project: Formal Algebraic Spaces](https://stacks.math.columbia.edu/download/formal-spaces.pdf), Lemma 87.33.3, pp. 74–75: The complete-local space argument uses pointed étale lifts and descent..

#### 9. Relative dual-number tangent comparison

**Theorem:** `schemeRelativeTangentEquiv`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/relative-tangent-comparison`.

For X/S as in the scheme comparison, the tangent space of its framed point functor is Der_Λ(O_X,x,k) at the specified residue point. For a k-rational point of a k-scheme this is naturally Hom_k(m_x/m_x²,k), hence the existing ZariskiTangentSpace(X,x). For a general relative base retain relative differentials or derivations; the absolute stalk cotangent dual is not asserted to equal the relative tangent.

**Hypotheses and conventions.** The k-rational special case fixes base S=Spec k and its structural k-algebra map. For an arbitrary point map use the algebra structure it induces on k in a fresh local scope, as required by the native dual-number equivalence.

**Construction or proof.** (1) Restrict the natural comparison to k[ε]. (2) Apply the pinned dual-number lift–derivation equivalence with the correct algebra tower. (3) The affine rational-point cotangent localization equivalence is already pinned Tau Ceti. Dualize that equivalence and use the usual derivation–cotangent universal property imported from SF.1; reduce a non-affine point to its affine neighbourhood. Only the geometric functor transport is new.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison`, `tauceti:TauCeti.derivationToDualNumberEquivLift`, `tauceti:TauCeti.AlgebraicGeometry.ZariskiTangentSpace`, `tauceti:TauCeti.AlgHom.kernelCotangentLinearEquivZariski`, `SchemeAndStackFoundations:SF.4/deformation-functor`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.** The tangent to A¹_k at zero has dimension one. The tangent to a point over itself is zero, including when its absolute residue-field derivations over a smaller field are nonzero.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.8.1, proof pp. 10–11: Scheme tangent vectors are coefficient-relative dual-number lifts.; [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Example 90.11.11, p. 34; equation 90.15.0.1, p. 44: The represented tangent is the derivation module at the chosen residue map..

#### 10. Coherent formal objects

**Definition:** `FormalObject`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/formal-object`.

For a fixed complete Noetherian local S-algebra R with residue k, a formal object of X is a tower ξ_n∈X(R/m_R^(n+1)), n≥0, with restriction isomorphisms ξ_(n+1)|_(R/m^(n+1))≅ξ_n. Morphisms are levelwise arrows commuting with these comparisons. Composites of adjacent comparisons define all longer transitions. The category is a groupoid at fixed R, and changes of complete local base use coherent pullback.

**Hypotheses and conventions.** Use positive quotient powers indexed from zero and the actual restriction functors. In the Stacks convention k is finite type over S. The generic native prototype accepts a specified tower of groupoids; assembling X(R/m^(n+1)) is an explicit D0 supplier contract.

**Construction or proof.** (1) Construct objects with isomorphism gluing rather than equalities of chosen fibre objects. (2) Define arrows, identities, composition and inverses componentwise; the commutation law makes them well-defined. (3) Use the chosen base restriction coherence to obtain the full completion category. For setoid fibres this agrees with the existing A0 compatible-point limit.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation`, `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.4/formal-scheme`, `AlgebraicModuliForArithmeticGeometry:A0-extension/formal-point`.

**API.**

- `FormalObject.evaluation` (projection): The n-th object/arrow evaluation is a functor to X(R/m^(n+1)).
- `FormalObject.hom_ext` (extensionality): Two formal arrows are equal if all their levelwise arrows agree.
- `FormalObject.isomorphism_iff` (characterisation): An isomorphism of formal objects is equivalent to a family of levelwise isomorphisms commuting with gluing.

**Discriminating unit tests.**

- `FormalTests.point` (degenerate): The constant discrete point tower has one object up to isomorphism.
- `FormalTests.compatibleArrows` (non-example): Every formal arrow must commute with each gluing square; an incompatible component sequence is excluded.
- `FormalTests.automorphisms` (computation): For a constant one-object groupoid tower with identity reduction, evaluation at level zero identifies formal automorphisms with the group at that level, even when gluing is nontrivial.

**Uses.** 98.9.5 and 98.12.7: State effectivity as an equivalence/essential image of the full formal groupoid. R10/R13 formal families: Compare the universal object at every quotient, including its automorphisms.

**Acceptance.** Compatible objects do not suffice without compatible arrows. Taking isomorphism classes term by term can lose the chosen transition data.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Definition 98.9.1, pp. 11–12: Formal objects retain transition maps and commuting morphisms.; [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Definitions 90.7.1 and 90.7.3, pp. 15–16: Groupoid-valued completion is a coherent tower rather than a set of classes..

#### 11. Effectivity of formal objects

**Definition:** `IsEffective`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/effectivity`.

Let res_R:X(R)→FormalObject_X(R) be the coherent restriction functor. A formal object ξ is effective if there is y∈X(R) with a specified isomorphism res_R(y)≅ξ. Effectivity of all objects is essential surjectivity. Full faithfulness of res_R is a separate property required to compare arrows and descend algebraizations; equivalence combines both properties.

**Hypotheses and conventions.** R complete Noetherian local over S with the fixed residue convention. The affine set-valued A0 effectivity predicate is imported only after passing to setoid fibres; it does not imply groupoid equivalence.

**Construction or proof.** (1) Construct res_R from actual pullback and its coherence. (2) Use its native essential image for object effectivity, retaining the comparison isomorphism. (3) Use native fully faithful/essentially surjective vocabulary for morphism effectivity and equivalence.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/formal-object`, `mathlib:CategoryTheory.Functor.EssSurj`, `AlgebraicModuliForArithmeticGeometry:A0-extension/effectivity`, `DiamondsAndVStacks:D0`.

**API.**

- `IsEffective.ofRestriction` (constructor): Every object actually restricted from X(R) is effective.
- `IsEffective.iso_iff` (compatibility): An isomorphism of formal objects transports effectivity.
- `IsEffective.all_iff` (characterisation): All formal objects are effective iff res_R is essentially surjective.

**Discriminating unit tests.**

- `EffectiveTests.identity` (degenerate): Identity restriction makes every object effective.
- `EffectiveTests.empty` (non-example): A functor from the empty groupoid cannot effect any object of a nonempty formal target.
- `EffectiveTests.notFullyFaithful` (non-example): The constant functor from the one-object groupoid of (ℤ,+) to the formal point tower is essentially surjective and is not faithful. Object effectivity must not imply equivalence.

**Uses.** 98.12.7: Supply the effective complete-local object before invoking approximation. A0 Artin stack criterion: Keep the criterion’s effectivity input separate from its conclusion of algebraicity.

**Acceptance.** An algebraization with a specified formal comparison is unique up to unique comparison-compatible isomorphism only under full faithfulness.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Definition 98.9.4 and equation 98.9.3.1, p. 12: The object condition is essential image, while the subsequent stack theorem asserts a full equivalence..

#### 12. Restriction from complete rings to spaces

**Theorem:** `completeLocalSpaceRestriction_bijective`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/space-restriction`.

For any algebraic space X over S and a complete Noetherian local S-algebra R, restriction gives a bijection Mor_S(Spec R,X)→lim_(n≥0) Mor_S(Spec(R/m^(n+1)),X). No properness, separatedness or finite-presentation condition on X is required for this statement.

**Hypotheses and conventions.** R is complete, separated, local and Noetherian. This theorem concerns maps from the fixed complete local base, not existence of a finite-type algebraization of an arbitrary formal scheme.

**Construction or proof.** (1) For schemes every map from the local test rings lies in a single affine neighbourhood; compatible ring maps have a unique complete limit. (2) For space injectivity, the equalizer is a locally quasi-finite separated scheme; all-order agreement forces equality at its local ring. (3) For surjectivity choose a pointed étale cover after a finite separable residue extension, lift to its finite étale complete-local extension, effect the scheme maps, then descend using injectivity on the finite product of complete local overlap rings.

**Direct dependencies.** `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4/formal-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.6/formal-object`.

**Acceptance.** Both existence and uniqueness of the compatible map are proved. The formal-space map out of Spf R is not silently identified with an arbitrary scheme-valued formal family.

**Primary evidence.** [The Stacks Project: Formal Algebraic Spaces](https://stacks.math.columbia.edu/download/formal-spaces.pdf), Lemmas 87.33.2–3, tags 0AQG/0AQH, pp. 74–75: Maps out of a complete local ring into an algebraic space are determined and effected by their formal restrictions..

#### 13. Effectivity for algebraic stacks

**Theorem:** `algebraicStackRestriction_equivalence`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/stack-restriction`.

Let S be locally Noetherian and X an algebraic stack over S. Restriction from objects over complete Noetherian local S-algebras with residue field finite type over S to formal objects is an equivalence, compatible with change of such bases. In particular each res_R is fully faithful and essentially surjective.

**Hypotheses and conventions.** Algebraicity of X is already established; this result cannot supply the effectivity hypothesis while algebraicity is still being proved. The diagonal is representable by algebraic spaces and an actual smooth surjective atlas exists.

**Construction or proof.** (1) For full faithfulness represent Isom(y,z) by an algebraic space and apply complete-local space restriction. (2) For objects choose a smooth atlas, pass to a finite separable residue extension and its finite étale complete local ring, and recursively lift a compatible atlas point across successive square-zero quotients. (3) Effect the scheme map; full faithfulness identifies descent arrows over the overlap and proves their cocycle. Effective fppf descent gives the object over R and its specified all-order comparison.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/space-restriction`, `AlgebraicModuliForArithmeticGeometry:R09.6/effectivity`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `SchemeAndStackFoundations:SF.1`, `DiamondsAndVStacks:D0`.

**Acceptance.** BG_m keeps the automorphisms of the algebraized torsor. Grothendieck existence for coherent sheaves is not needed in this direct chart-and-descent proof.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.9.5, tag 07X8, pp. 12–14: The equivalence is proved using space-valued Isom and smooth-atlas descent..

#### 14. Effectivity and 2-fibre products

**Theorem:** `restriction_twoFibre_equivalence`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/effectivity-two-fibres`.

If complete-local restriction is an equivalence for X, Y and Z, it is an equivalence for X×_Y Z. Compatible objects and the comparison isomorphism are all algebraized; uniqueness of the isomorphism follows from full faithfulness for Y.

**Hypotheses and conventions.** The three categories are fibred in groupoids over S; equivalences are compatible with base change. All three equivalences are hypotheses; mere object effectivity in Y is insufficient.

**Construction or proof.** (1) Identify restriction for the product as the 2-product of the three restriction functors. (2) Effect the two objects, lift the gluing isomorphism through the Y equivalence, and transport the coherence. (3) Use equivalence invariance of 2-products for arrows and base maps.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/effectivity`, `AlgebraicModuliForArithmeticGeometry:R09.6/formal-object`, `DiamondsAndVStacks:D0`.

**Acceptance.** A formal Isom arrow between two effective objects is effected, rather than replaced by an equality of their classes.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.9.6, p. 14: The complete-local restriction equivalence is stable under 2-fibre products..

#### 15. Versality of algebraic families

**Definition:** `FamilyVersalAt`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/family-versality`.

Let U be locally of finite type over S, y∈X(U), u a finite-type point and x₀=y|κ(u). The family is versal at u if the induced map Def_U,u→Def_X,x₀ is smooth: for each Artinian surjection B→A the comparison Def_U,u(B)→Def_U,u(A)×_(Def_X,x₀(A))Def_X,x₀(B) is essentially surjective. The 2-product retains its comparison arrow. A formal object ξ over R is versal if h_R→Def_X,x₀ has the same lifting property.

**Hypotheses and conventions.** S locally Noetherian, X fibred in groupoids, k=κ(u) finite type over S. Use the groupoid version of SF.4 smoothness, not an unframed surjectivity statement on objects.

**Construction or proof.** (1) Use the family and 2-Yoneda to assemble its pointed morphism of deformation categories. (2) Form the actual lifting 2-product at each Artinian surjection. (3) Factor any Artinian surjection into small extensions, so testing those suffices; this is the imported formal-deformation lifting theorem.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation`, `AlgebraicModuliForArithmeticGeometry:R09.6/formal-object`, `SchemeAndStackFoundations:SF.4/hull`, `DiamondsAndVStacks:D0`.

**API.**

- `FamilyVersalAt.smallExtension_iff` (characterisation): It suffices to test surjections whose kernel is killed by the source maximal ideal.
- `FamilyVersalAt.completion_iff` (compatibility): The family is versal at u iff its completed-local formal object is versal.
- `FamilyVersalAt.finiteResidueExtension` (functoriality): Under RS, finite residue extensions preserve the smooth pointed deformation morphism.

**Discriminating unit tests.**

- `VersalTests.identity` (degenerate): The identity family of a locally finite-type scheme is versal at every finite-type point.
- `VersalTests.excessParameter` (non-example): A¹_k→Spec k is smooth and versal at zero; its tangent map k→0 is not bijective, so it is not a hull.
- `VersalTests.closedPoint` (non-example): Spec k→A¹_k at zero is not versal: the dual-number point t↦ε cannot lift through the closed point.

**Uses.** 98.12.7: Upgrade the approximated effective object to an all-orders algebraization. R10/R13 and R09.4: Recognize completed smooth charts and distinguish miniversal families from arbitrary charts.

**Acceptance.** Versality does not require tangent bijectivity. The lift includes an isomorphism compatible with the specified A-deformation.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Definitions 98.12.1–2, p. 18: A family is versal through its pointed deformation morphism.; [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Definition 90.8.1 and Remark 90.8.3, pp. 20–21: Smoothness is essential surjectivity on the lifting 2-product..

#### 16. Versality and completed local rings

**Theorem:** `familyVersalAt_completion_iff`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/completion-versality`.

For y over U locally of finite type over locally Noetherian S and a finite-type u, let ξ be its formal restriction over R=Ô_U,u. Then y is versal at u iff ξ is versal. For a morphism U→V of schemes locally of finite type over S, this is also equivalent to the morphism being smooth at u.

**Hypotheses and conventions.** Use the same coefficient and residue maps for h_R and Def_U,u. The scheme smoothness conclusion applies to a genuine locally finite-type scheme morphism; no arbitrary CFG is declared smooth from a predicate alone.

**Construction or proof.** (1) Identify Def_U,u with h_R by the completed-local universal property. (2) The morphism induced by y under this identification is exactly the morphism of its formal object. (3) For schemes apply the local infinitesimal criterion of smoothness with the stated finiteness assumptions.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/family-versality`, `AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.** The same chart and residue point occur in both versality predicates.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemmas 98.12.3–4, pp. 18–19: Completion preserves the precise lifting condition; the scheme case recovers smoothness..

#### 17. Smooth charts and hull comparisons

**Theorem:** `smoothChart_versalHullComparison`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/atlas-versality`.

A smooth representable chart U→X at a specified lift u of x₀ induces a smooth h_(Ô_U,u)→Def_X,x₀, hence a versal formal family. In the classical equal-residue coefficient setting, its isomorphism-class transformation is a hull exactly when its tangent map is bijective. Under RS and Inf_X,x₀=0 the framed category is setoid-valued; if the chart map is also tangent-bijective, the SF.4 prorepresentability criterion makes this pair prorepresent the framed functor. Inf=0 alone does not make an arbitrary smooth-chart ring prorepresent it.

**Hypotheses and conventions.** S locally Noetherian; U locally finite type over S; u finite type with the fixed residue field. For the hull/prorepresentability clause use coefficient residue k and the classical SF.4 H1–H4 conditions. Exclude the inseparable-residue orbit notion of minimality from the tangent-bijective clause.

**Construction or proof.** (1) Representable smooth lifting makes the pointed chart morphism smooth; use the completion identification. (2) The definition of hull adds tangent bijectivity to this smooth transformation. (3) When Inf=0, RS passes through the setoid equivalence to give the required set-valued gluing. Apply the imported prorepresentability criterion and its smooth tangent-bijective comparison theorem.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/completion-versality`, `AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality`, `AlgebraicModuliForArithmeticGeometry:R09.6/stabilizer-linearization`, `SchemeAndStackFoundations:SF.4/hull`, `SchemeAndStackFoundations:SF.4/schlessinger-theorem`, `SchemeAndStackFoundations:SF.4/deformation-functor`.

**Acceptance.** The smooth chart A¹→point gives k[[t]] although the point is prorepresented by k. For finite étale BG with algebraically closed k the framed functor is terminal and prorepresented by k, while BG is still not a fine unframed space.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.3.2, p. 5; Lemma 98.12.3, pp. 18–19: A smooth chart and its completion are versal.; [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Lemma 90.18.1, p. 54; Lemmas 90.19.12–13, p. 58: Vanishing infinitesimal autos gives a setoid functor; tangent bijectivity is separately needed for the hull comparison..

#### 18. Completed presentations of deformation groupoids

**Theorem:** `completedAtlasPresentation_equivalence`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/completed-atlas-presentation`.

For a smooth pointed atlas U→X of an algebraic stack, the framed deformation category at x₀ is equivalent to the groupoid quotient of Def_U,u by Def_(U×_X U),r, where r is the identity relation point (u,u,id). The object functor is represented by Ô_U,u; the relation functor is represented through a pointed étale chart of the algebraic space U×_X U at r. Source, target, identity, inverse and composition are the induced formal maps, and their coherence is retained. This is a presentation, not a choice-independent ring attached to X.

**Hypotheses and conventions.** Residue points u,r have the fixed k; use the geometric base change when needed. U is locally finite type over S locally Noetherian. X satisfies RS, as algebraic stacks do. The relation chart is étale with the prescribed residue field; its completion represents the identity-framed relation functor. The unframed stabilizer has other residual arrows that are not included in this single formal neighbourhood.

**Construction or proof.** (1) Apply framed 2-fibre compatibility to U×_X U at the identity arrow. (2) Smooth lifting of the atlas makes Def_U,u essentially surjective onto the framed category on Artinian tests. (3) The relation arrows and composition recover that category by the imported groupoid-quotient presentation theorem; replace the scheme/space point functors by their completion representatives.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/space-formal-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.6/atlas-versality`, `AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality`, `AlgebraicModuliForArithmeticGeometry:R09.6/tangent-exact-sequence`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.** For BG_m, the object functor of a pointed atlas can be terminal while the identity formal relation has 1+εk automorphisms. For a scheme chart of the identity, the relation introduces no additional stabilizers.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.3.3, p. 5: Framed deformation preserves the atlas relation 2-fibre product.; [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf), Lemma 90.26.1, pp. 65–66 and Lemma 90.26.2, p. 66: A smooth deformation presentation recovers the category and its stabilizer kernel..

#### 19. Algebraization of effective versal formal objects

**Theorem:** `effectiveVersal_algebraization`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/versal-algebraization`.

Let S be locally Noetherian, X fibred in groupoids and limit preserving on objects, and ξ a formal object over a complete Noetherian local S-algebra R with residue k finite type over S, image s∈S. If ξ is effective and versal and O_S,s is a G-ring, there are U→S of finite type, a finite-type u∈U with κ(u)=k, and y∈X(U), versal at u, with an isomorphism R≅Ô_U,u and a compatible identification of all the ξ_n with the formal restrictions of y. The isomorphism and family need not be unique.

**Hypotheses and conventions.** All four inputs—effectivity, versality, local G-ring and limit preservation on objects—are supplied before applying the theorem. No representable-diagonal or Artin-algebraicity conclusion is used in this theorem. The completion isomorphism is existential. It is not a promise to algebraize a prescribed arbitrary formal coordinate change exactly.

**Construction or proof.** (1) Effect ξ by an object over Spec R. Apply the imported A0 approximation theorem at N=2, preserving the second jet and associated graded dimensions. (2) Versality recursively lifts the approximation to all orders and gives a compatible local map R→Ô_U,u. The second-jet agreement makes this map surjective by the complete-local Nakayama criterion imported from SF.4. (3) Associated graded dimension equality gives equal finite lengths at every quotient, making the surjections isomorphisms. Pass to the complete limit and transfer versality back to the algebraic family.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/effectivity`, `AlgebraicModuliForArithmeticGeometry:R09.6/family-versality`, `AlgebraicModuliForArithmeticGeometry:R09.6/completion-versality`, `AlgebraicModuliForArithmeticGeometry:A0-extension/formal-object-approximation`, `AlgebraicModuliForArithmeticGeometry:A0-extension/g-ring-finite-type`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** Approximation of a nonversal formal object provides only finite-jet agreement; it does not prove this all-order conclusion. Dropping the G-ring input is excluded by the source’s counterexample in 98.12.8.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.12.7, tag 07XH, pp. 20–21; Example 98.12.8, p. 21: Versality upgrades the imported finite-jet approximation of an effective object to the completed-local isomorphism..

#### 20. Formal universal properties of represented parameters

**Construction:** `ParameterFormalExports`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/parameter-formal-exports`.

Given a parameter functor F on S-schemes with a supplied natural representation θ:Hom_S(-,P)≅F and a finite-type p∈P, let ξ₀=θ(p). Transport schemeFramedCompletionEquiv through θ to obtain h_(Ô_P,p)≅Def_F,ξ₀. Export the representation, universal object, pullback naturality and this formal comparison under named projective-bundle, Grassmannian, flag, Hilbert, Quot, Hom, Isom and Picard-space interfaces. Space-valued parameters use the pointed étale chart comparison instead. Their original representability and geometric hypotheses remain with R09.1/R09.2/SF.1; this node proves only the uniform point/completion transport.

**Hypotheses and conventions.** For projective/Grassmann/flag use the supplier quotient convention: locally free quotients, flags of quotients with compatible kernels. For Hilbert/Quot use the exact base, projectivity, finite-presentation, sheaf and polynomial conditions from the representing theorem. Hom/Isom require their own representability hypotheses; they are not asserted representable for arbitrary schemes. Fix the functor’s base-change and isomorphism-class conventions. Universal quotient/family flatness is over P and does not assert P→S flat.

**Construction or proof.** (1) Take the universal element θ_P(id_P) and evaluate the supplied natural isomorphism on each test scheme. (2) Naturality identifies arbitrary classified objects with pullbacks of this universal element, including Artinian residue framing. (3) Transport the completed-local natural isomorphism and record one named interface per parameter kind. Supplier base-change identifications transport the finite Artinian comparisons; do not assert arbitrary-base-change commutation of stalk completion without hypotheses.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.6/space-formal-comparison`, `mathlib:CategoryTheory.yoneda`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`, `SchemeAndStackFoundations:SF.1`.

**API.**

- `ParameterFormalExports.classify` (equivalence): For a supplied θ and test T, its component gives Hom_S(T,P)≃F(T).
- `ParameterFormalExports.universal` (data): The universal element is the image of id_P.
- `ParameterFormalExports.classify_natural` (functoriality): Classifying f∘g agrees with pullback of classify(f) along g.
- `projectiveParameter_formalEquiv` (universal-property): A quotient line of E at p has the deformation functor represented by Ô_(P(E)),p, under the supplier quotient convention.
- `grassmannParameter_formalEquiv` (universal-property): Rank-r locally free quotient deformations are represented by the completed stalk of the supplied Grassmannian.
- `flagParameter_formalEquiv` (universal-property): Compatible quotient flags at p have the completed-stalk formal universal property of the supplied flag scheme.
- `hilbertParameter_formalEquiv` (universal-property): Deformations of the specified flat closed subscheme with fixed Hilbert polynomial are classified by the supplied Hilbert completion, with universal family pulled back.
- `quotParameter_formalEquiv` (universal-property): Deformations of the specified flat quotient of E, modulo compatible quotient isomorphism, are classified by the supplied Quot completion.
- `homParameter_formalEquiv` (universal-property): Deformations of a specified morphism in the supplied representable Hom functor are classified by its completed parameter stalk.
- `isomParameter_formalEquiv` (universal-property): Deformations of a specified isomorphism are classified by the supplied Isom completion and retain the invertibility requirement.
- `picardParameter_formalEquiv` (universal-property): The framed deformation of a class in the supplied relative Picard sheaf is represented by a pointed étale-chart completion of its Picard space; this does not classify arrows of the Picard stack.

**Discriminating unit tests.**

- `ParameterTests.identityRepresentation` (compatibility): For F=Hom(-,P) and θ=id, classify is the identity on actual arrows.
- `ParameterTests.universalElement` (degenerate): The universal element classifies id_P, rather than a selected unrelated object.
- `ParameterTests.pullback` (compatibility): Classifying a composition agrees with applying the contravariant functor map to the class of the outer arrow.
- `ParameterTests.grassmannEndpoints` (degenerate): For E of rank n, rank-zero and rank-n quotient functors are terminal over S; over a rational field-base point their framed tangent is zero.
- `ParameterTests.hilbertNonflatBase` (non-example): For S=Spec k[ε] and X=Spec k closed in S, the degree-one Hilbert parameter is X. Its universal family over itself is flat although X→S is not flat; only Artinian S-maps satisfying ε=0 are classified.
- `ParameterTests.quotLengthOne` (computation): For E=O on P¹_k, a length-one quotient at a rational origin has point-deformation completion k[[t]], since it is the length-one Hilbert functor of P¹.
- `ParameterTests.isomUnit` (non-example): For endomorphisms of the trivial line over A, Hom gives A and Isom gives A×; an Artinian endomorphism reducing to 1 is invertible, while zero is excluded.
- `ParameterTests.picardAutomorphisms` (non-example): For X=Spec A over itself the relative Picard sheaf is terminal, while its line-bundle groupoid has the units A× as automorphisms of the trivial object. The Picard-space completion must not be substituted for the Picard-stack groupoid.

**Uses.** AbelianSchemesAndArithmeticModuli:A0; PELModuli:M2: Consume named parameter universal properties while the application proves its own deformation/obstruction conditions. LocalGaloisDeformationRings:L7 and ModularCurvesPartII:R13.1: Use completed classifying rings and preserve the chosen universal objects.

**Acceptance.** Every parameter consumed by the arithmetic roadmap has a named representation and completed-local comparison with its universal object. The adapter never substitutes a coarse space for the groupoid of a stack with stabilizers.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.12.3, pp. 18–19; Section 98.3, pp. 4–5: The representing-point deformation comparison transports along an already supplied natural representation..

#### 21. Transfer to arithmetic moduli

**Application:** `arithmeticFormalComparison_transfer`. Node `AlgebraicModuliForArithmeticGeometry:R09.6/arithmetic-comparison-transfer`.

Given a supplied algebraic moduli stack M of the required elliptic/abelian objects, an equivalence between its framed fibre and the arithmetic deformation groupoid transports the completed-atlas presentation, infinitesimal stabilizers, tangent comparison and complete-local effectivity to that problem. If the formal object is effective and versal, the G-ring and limit-preservation inputs give a finite-type versal family via effectiveVersal_algebraization. A rigidifying level yields a represented local functor only after the supplied level theorem removes the required automorphisms. Coarse moduli alone does not supply this equivalence.

**Hypotheses and conventions.** The arithmetic definition, deformation theory and algebraicity are application inputs from the corresponding R10/R13 owners; no abelian or elliptic deformation theorem is reconstructed here. For an Artin proof use the imported A0 criterion with the complete hypothesis ledger recorded in targetMatrix; effectivity must be independently proved, for example by the imported SF.4 formal-existence theorem in its exact proper/projective setting. For coherent families on an already fixed proper scheme use SF.4 Grothendieck existence; arbitrary varying formal schemes need a separate effectivity/algebraization theorem.

**Construction or proof.** (1) Pull each general comparison through the supplied equivalence of framed groupoids, including arrows and universal objects. (2) For already algebraic M apply complete-local restriction; for a candidate CFG use its separate effectivity supplier before invoking A0 Artin. (3) Apply the effective-versal theorem with all hypotheses checked. Use only the precise automorphism-rigidity and parameter interfaces supplied for the chosen level.

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.6/completed-atlas-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.6/stack-restriction`, `AlgebraicModuliForArithmeticGeometry:R09.6/versal-algebraization`, `AlgebraicModuliForArithmeticGeometry:R09.6/parameter-formal-exports`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `SchemeAndStackFoundations:SF.4/grothendieck-existence`, `SchemeAndStackFoundations:SF.4/effective-formal-deformations-of-curves`, `AlgebraicModuliForArithmeticGeometry:A0-extension/artin-stack-criterion`, `AlgebraicModuliForArithmeticGeometry:A0-extension/artin-space-criterion`.

**Acceptance.** Current ModularCurves Layer 7D supplies elliptic deformation; this packet imports it rather than planning it. Finite residual inertia with Inf=0 is insufficient to assert an unframed fine moduli scheme. Proper coherent Grothendieck existence is not an assertion that every formal deformation of every higher-dimensional scheme is algebraizable.

**Primary evidence.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.9.5, pp. 12–14; Lemma 98.12.7, pp. 20–21; Proposition 98.16.1 and Lemma 98.17.1, pp. 26–27: The general comparison is reusable by arithmetic moduli once their own object, effectivity and rigidity hypotheses are supplied..

### Artin hypothesis ledger

The criterion itself is imported, rather than restated as a new theorem here.

- S locally Noetherian with G-ring local rings at finite-type points; universe/size bound on isomorphism classes (and arrows for stacks).
- Étale sheaf for spaces or étale stack in groupoids for stacks; diagonal representable by algebraic spaces.
- Limit preservation; local RS; finite-dimensional framed tangent at all required residue points and finite-dimensional infinitesimal autos for the stack version.
- Independent effectivity of all formal objects and openness of versality. The selected theorem is Stacks 98.16.1 or 98.17.1; the entire criterion is imported from A0.

The independent effectivity proof must precede the criterion. Its source is
Proposition 98.16.1 for spaces or Lemma 98.17.1 for stacks, with A0 supplying
their proofs and approximation inputs. If openness is obtained from the A0
module obstruction theorem, its extra obstruction axioms must be checked in
the arithmetic problem; naming an obstruction space does not suffice.

### Baseline imports and signature boundary

- `mathlib:CategoryTheory.StructuredArrow`: The native comma fibre over a fixed object, with its underlying object, frame and commuting arrows.
- `mathlib:CategoryTheory.toSkeleton_eq_toSkeleton_iff`: Equality in the native isomorphism-class quotient is equivalent to existence of an isomorphism.
- `mathlib:CategoryTheory.Functor.mapAut`: The group homomorphism on automorphisms induced by a functor.
- `mathlib:AdicCompletion`: The module/ring carrier of compatible quotient sequences for ideal-adic completion.
- `mathlib:AdicCompletion.evalₐ`: The ring-compatible projection from completion to the specified ideal-power quotient.
- `mathlib:AdicCompletion.ext_evalₐ`: Extensionality by all ring quotient projections.
- `mathlib:AdicCompletion.isLocalRing_of_fg`: Localness of maximal-ideal completion when the maximal ideal is finitely generated.
- `mathlib:AdicCompletion.residueField_map_bijective`: The residue field map of a Noetherian local completion is bijective.
- `tauceti:TauCeti.derivationToDualNumberEquivLift`: Derivations over the specified algebra tower are equivalent to dual-number lifts of its point.
- `tauceti:TauCeti.AlgHom.kernelCotangentLinearEquivZariski`: The existing affine augmentation cotangent equivalence with the Zariski cotangent space at its point.
- `tauceti:TauCeti.AlgebraicGeometry.ZariskiTangentSpace`: The dual of the native local cotangent space over the stalk residue field.
- `mathlib:CategoryTheory.Functor.EssSurj`: Every target object belongs to the native essential image.
- `mathlib:CategoryTheory.yoneda`: The represented presheaf of actual morphisms and its contravariant map.

The pinned commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. All the cited statements
were read at those pins. The affine augmentation cotangent localization
equivalence, Zariski tangent carrier, dual-number lift equivalence, adic
completion and categorical carriers are already present. Only their
geometric deformation transport is new. The native suggested declarations
cover framed fibres and reframing, stabilizer kernels, coherent fixed-ring
towers, effectivity as essential image, completed stalk jets and components
of supplied representing natural isomorphisms. This is signature elaboration,
not proof verification or construction of the missing moduli carriers.

FamilyVersalAt, its three API items and its three tests, the eight geometric
parameter formal adapters and their five geometric tests, and all thirteen
geometric theorem signatures plus the arithmetic application are named in
the suggested omission ledger. The primary geometric formal transport of
ParameterFormalExports is also an omission; the component transport does not
prove it. The six hybrid/native constructor interfaces must be specialized
to their supplied relative fibres before the geometric statements can be
implemented. No unavailable condition is represented by an opaque field.

### Supplier contracts and open gaps

**`DiamondsAndVStacks:D0`.** Supply the existing ordinary Cat-valued stack/CFG interfaces specialized to schemes over S: fibre groupoids, coherent pullback, 2-products, 2-Yoneda and fppf descent. Connect the native framed structured-arrow and fixed-ring tower prototypes to those fibres. This requests the relative adapters, not a replacement for existing native pseudofunctor/stack machinery.

**`SchemeAndStackFoundations:SF.1`.** Supply algebraic-space schemes of Isom and pointed étale charts with chosen residue-field identifications; unique lifting across nilpotent thickenings, smooth lifting, finite étale complete-local extensions of separable residue extensions, and local differential/cotangent comparisons. Space restriction needs fppf sheaf descent and equalizer local-ring arguments. These are exact space extensions of the scheme substrate.

**`SchemeAndStackFoundations:SF.4`.** Part II: extend its set-valued deformation/hull interfaces to coherent groupoid-valued completion, smooth lifting by essential surjectivity, RS vector-space structures and 2-fibre tangent exactness, plus complete-local Nakayama and quotient presentation coherence. Export its existing proper coherent Grothendieck existence and effective formal curve-deformation theorems with comparison-compatible arrows. Preserve classical equal-residue hull hypotheses versus inseparable minimality.

**`AlgebraicModuliForArithmeticGeometry:R09.1`.** Supply projective, Grassmannian and flag quotient-classifying natural isomorphisms and universal quotient objects, coherent base change and chosen-point transport. R09.6 adds only their uniform completed-local adapters; AlgebraicVectorBundles current main explicitly assigns these constructions to a separate roadmap.

**`AlgebraicModuliForArithmeticGeometry:R09.2`.** Supply each Hilbert, Quot, Hom and Isom representing natural isomorphism under the exact theorem hypotheses, universal families/quotients and base change. Keep flatness of universal families separate from flatness of the parameter over S. Hom and Isom have their own finiteness/properness conditions.

**`AlgebraicModuliForArithmeticGeometry:R09.4`.** Supply the actual established algebraic-stack presentations used here, including representable algebraic-space diagonals and smooth atlases; verify RS for them. Inertia itself is already imported by its named node. Do not infer stack algebraicity from this packet’s conditional comparison.

**`AlgebraicModuliForArithmeticGeometry:R09.5`.** Supply the specific auxiliary-level automorphism-removal theorem and its base/characteristic/level hypotheses, and its comparison to the fine moduli problem. A coarse space or zero infinitesimal stabilizer alone does not remove residual automorphisms.

**`SchemeAndStackFoundations:SF.0`.** Import G-rings, regular local completion maps and Popescu at their accepted sole owner. A0’s approximation prefix consumes them before its Artin criteria; R09.6 consumes that prefix. No reverse R09.6→A0 edge is proposed.

**Native relative geometric adapters.** Fixed-fibre groupoid and tower signatures elaborate, but their assembly from the actual S-relative stack fibres, pointed algebraic-space charts and geometric residue-field base changes requires the D0/SF.1 contracts. The geometric completion, tangent, presentation and named parameter theorems are listed in the suggested-file omission ledger rather than encoded by artificial predicates.

**Groupoid deformation and versality supplier extension.** SF.4 supplies the classical set-valued hull and formal geometry. The groupoid RS, smooth-lifting, completion and formal presentation extension has an exact Part II request. Without it FamilyVersalAt and the tangent/infinitesimal vector-space theorem signatures and tests cannot be realized natively. Complete-local Nakayama and the inseparable-residue convention must be retained.

**Parameter and arithmetic supplier checks.** R09.1/R09.2 still owe concrete representing natural isomorphisms with their theorem-specific hypotheses. The native Yoneda component prototype only transports an assumed representation. The eight named geometric formal adapters and their concrete tests must be instantiated against those carriers. Arithmetic consumers supply their own groupoid equivalence, effectivity, Artin hypothesis checks and level rigidity; this packet proves conditional transfer, not those application-specific claims.

The next implementation pass must resolve these exact interfaces and replace
the named omissions, rather than add another approximation or representing
theorem. It must instantiate the eight parameter adapters and run their
geometric examples with the actual universal objects. R10/R13 consumers
must check their object equivalence, effectivity and rigidity assumptions.
This is a complete plan with assigned boundaries; it is not closed coverage.

### Source record and source discipline

All primary results are stated in our own words with theorem/section and page
locators. No source passage, source-section summary, PDF or extracted text is
part of the deliverables. No private-library book was needed. No primary
source error was established; sourceIssues is empty. The existing package’s
chart-to-hull wording and its classifying-stack interpretation are corrected
here as planning observations, not attributed to a source misprint.

- [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf) — The Stacks Project authors; Chapter PDF compiled July 14, 2026. Read 2026-10-09; sections/pages: 98.3, pp. 4–5; 98.8–98.10, pp. 9–16; 98.11–98.12, pp. 16–21; 98.16–98.18, pp. 26–29. SHA-256 `c90df80ae07d0b1a1bc5a886c5deea52fe07dcc2623e5903099333a144628bb2`.
- [The Stacks Project: Formal Deformation Theory](https://stacks.math.columbia.edu/download/formal-defos.pdf) — The Stacks Project authors; Chapter PDF compiled July 14, 2026. Read 2026-10-09; sections/pages: 90.7–90.8, pp. 15–23; 90.15, pp. 44–47; 90.18–90.20, pp. 54–60; 90.25–90.26, pp. 65–67. SHA-256 `f6549caab0fa380254eb316265ce14357794224c0e01c517bb0365c708a4c2ea`.
- [The Stacks Project: Formal Algebraic Spaces](https://stacks.math.columbia.edu/download/formal-spaces.pdf) — The Stacks Project authors; Chapter PDF compiled July 14, 2026. Read 2026-10-09; sections/pages: 87.33.1–3, pp. 73–75. SHA-256 `dd2c0d337301c19c5d5bf171fd19ada7e33f14519b405350e3fb36eda28b8971`.
- [The Stacks Project: Smoothing Ring Maps](https://stacks.math.columbia.edu/download/smoothing.pdf) — The Stacks Project authors; Chapter PDF compiled July 14, 2026. Read 2026-10-09; sections/pages: 16.13.1–2, pp. 32–33. SHA-256 `7d2564c4b687ecb73aaf4dbde5fa991a92d638933d2858ee927f600b3564c884`.
- [The Stacks Project: More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf) — The Stacks Project authors; Chapter PDF compiled July 14, 2026. Read 2026-10-09; sections/pages: 15.51.10, pp. 129–131. SHA-256 `ab69179738e642603ddbde651f2838e1cb5d8711e8bcd7c447cbf02a8bb6a5d2`.
- [Algebraic approximation of structures over complete local rings](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf) — Michael Artin; Public Numdam scan, Publications mathématiques de l’IHÉS 36 (1969), pp. 23–58. Read 2026-10-09; sections/pages: Theorem 1.10 and discussion, pp. 25–26; Corollaries 2.5–2.6 and proof, pp. 28–29. SHA-256 `38beaf58d5c557675c3783b6f25a68cfb1bbdbec84882e996f9d7d4b4cc6b434`.
